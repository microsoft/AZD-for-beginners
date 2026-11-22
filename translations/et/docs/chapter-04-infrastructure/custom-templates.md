# Oma azd-malli koostamine

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Käesolev peatükk**: Peatükk 4 - Infrastruktuur koodina ja juurutamine
- **⬅️ Eelmine**: [Juurutamisjuhend](deployment-guide.md)
- **🚀 Järgmine peatükk**: [Peatükk 5: Mitmeagendi lahendused](../chapter-05-multi-agent/README.md)

> Läbivaadatud vastu `azd 1.37.2` (november 2026). See on **malli koostamise juhend osaliste failidega**, mitte täielik mall: enne juurutamist peate lisama rakenduse koodi ja `modules/web.bicep` koos selle keskkonna, registri, konteinerirakenduse ja väljunditega. Azure'i varustamist selles ülevaates ei tehtud.

## Sissejuhatus

Seni olete *kasutanud* malle koos `azd init --template <name>`. Kui aga teil tekib projektistruktuur, mis teie meeskonnale meeldib — näiteks konteinerirakendus koos Cosmos DB ja sobiva jälgimissüsteemiga — soovite seda muuta taaskasutatavaks malliks. Mall on lihtsalt Git-hoidla etteaimatava struktuuriga, mida azd oskab lugeda. See õppetund näitab, kuidas ehitada selline nullist, testida ja (valikuliselt) avaldada see kogukonna galeriis.

## Õpieesmärgid

Selle peatüki lõpuks:
- Mõistate, mis teeb kaustast "azd mall"
- Teate vajalikke faile ja kausta struktuuri
- Lisate `azure.yaml` ja `infra/`, mida teised saavad taaskasutada
- Testite oma malli lokaalselt enne jagamist
- Avaldate selle ja (valikuliselt) esitate Awesome AZD-le

## Õpitulemused

Pärast selle õppetüki lõpetamist oskate:
- Luua uue malli hoidla
- Parameetriseerida infrastruktuuri nii, et see töötaks mis tahes tellimuses
- Kinnitada malli `azd init` ja `azd up` abil
- Lisada metaandmeid, mida kogukonna galerii nõuab

---

## Mis see mall tegelikult on?

Azd mall on **Git-hoidla**, mis sisaldab vähemalt:

| Fail / kaust | Eesmärk | Vajalik? |
|---------------|---------|-----------|
| `azure.yaml` | Kirjeldab teenuseid, hoste ja infrastruktuuri pakkujat | ✅ Jah |
| `infra/` | Bicep või Terraformi juurutusdefinitsioonid | Nõutud selle ekspressiivse SIG näite jaoks; genereeritud infrastruktuuriprojektid võivad selle vahele jätta |
| `src/` (või teie kood) | Rakenduse kood, mida azd juurutab | Nõutud allika-põhiste teenuste jaoks; mitte kõigis mallides pole rakenduse koodi |
| `README.md` | Kuidas malli kasutada | ✅ Soovitatav |
| `.azdo/` või `.github/` | CI/CD torujuhtme definitsioonid | Valikuline |
| `.devcontainer/` | Taastatav arenduskeskkond | Valikuline |
| `azure.yaml` `metadata` | Malli identiteet/telemeetria info | Soovitatav; Git-hoidla avaldamine ei nõua seda |

Siin pole midagi maagilist: kui te käivitate `azd init --template you/your-repo`, kloonib azd hoidla ja loeb `azure.yaml`.

---

## 1. samm: Looge hoidla põhistruktuur

Looge kaustastruktuur käsitsi või alustage minimaalsest mallist ja muutke seda:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Create the standard layout
mkdir -p src infra
```

Tüüpiline valmis struktuur näeb välja selline:

```
my-azd-template/
├── azure.yaml              # ← template definition
├── README.md               # ← how to use it
├── infra/
│   ├── main.bicep          # entry point
│   ├── main.parameters.json
│   └── modules/
│       └── web.bicep
├── src/
│   └── app/                # your application code
└── .github/
    └── workflows/
        └── azure-dev.yml   # optional CI/CD
```

---

## 2. samm: Kirjutage `azure.yaml`

See on malli süda. See ütleb azd-le, mida ja kuidas juurutada:

```yaml
# azure.yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: my-azd-template
metadata:
  template: my-azd-template@1.0.0   # name@version — used by the gallery and telemetry
infra:
  provider: bicep                   # built-in alternative: terraform
  path: infra
services:
  web:
    project: ./src/app
    language: js                    # js | python | dotnet | java | go
    host: containerapp              # appservice | containerapp | function | aks | staticwebapp
```

> `metadata.template` väli on see, mida galeri telemeetria kasutab kasutuse loendamiseks. Kasutage `name@version` konventsiooni.

---

## 3. samm: Parameetriseerige infrastruktuur

Kõige olulisem reegel *taaskasutatava* malli jaoks: **ärge kunagi kodeerige nimesid, regioonide või tellimuse-spetsiifilisi väärtusi püsivalt.** Kasutage parameetreid ja ressursi tokeni mustrit, et sama mall töötaks igaühe tellimuses.

```bicep
// infra/main.bicep
targetScope = 'subscription'

@minLength(1)
@description('Primary location for all resources')
param location string

@minLength(1)
@maxLength(64)
@description('Name of the environment (used to generate resource names)')
param environmentName string

// Generate globally-unique, stable names from the environment + subscription
var resourceToken = uniqueString(subscription().id, environmentName, location)
var tags = { 'azd-env-name': environmentName }

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-${environmentName}'
  location: location
  tags: tags
}

module web 'modules/web.bicep' = {
  name: 'web'
  scope: rg
  params: {
    name: 'app-${resourceToken}'
    location: location
    tags: tags
  }
}

output SERVICE_WEB_ENDPOINT_URL string = web.outputs.uri
```

Kaks asja teevad selle malli sõbralikuks:

1. **`azd-env-name` silt** — azd kasutab seda ressursside jälgimiseks ja koristamiseks keskkonna lõikes.
2. **`uniqueString(...)` ressursi token** — toodab stabiilse räsi sufiksi kokkupõrgete vähendamiseks; see ei taga globaalselt unikaalsust.

Puuduv `modules/web.bicep` peab vastu võtma `name`, `location` ja `tags`, juurutama Container Apps keskkonna/registri ja rakenduse, märgistama rakenduse `azd-service-name: web` abil ning eksportima `uri`. Samuti peab see avaldama registri väärtused, mida vajab valitud ehitus/juurutusvoog (näiteks `AZURE_CONTAINER_REGISTRY_ENDPOINT` juurmoduulist). Ainult väljund lõpp-punkt ei seo teenuste avastust, rakenduse seadeid ega registri autentimist.

Lisage sobiv parameetrite fail, mis loeb väärtusi, mida azd keskkonnast sisestab:

Salvestage järgnev failina `infra/main.parameters.json`:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": { "value": "${AZURE_ENV_NAME}" },
    "location": { "value": "${AZURE_LOCATION}" }
  }
}
```

azd asendab automaatselt `${AZURE_ENV_NAME}` ja `${AZURE_LOCATION}` praegusest keskkonnast.

---

## 4. samm: Testige oma malli lokaalselt

Enne jagamist tõestage, et mall töötab puhtalt olekult.

**Testige kohalikust kaustast** (Git push ei ole vajalik):

```bash
# From an empty directory, initialize using your local template path
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template .

# Provision + deploy end to end
azd auth login
azd up
```

**Seejärel testige puhastust** — hea mall koristab täielikult:

```bash
azd down --force --purge
```

Kui `azd down` jätab ressursse maha, kontrollige keskkonna/ressursigrupi avastust, väliseid/jagatud ressursse, õigusi, lukke ja puhastus-kaitset. `--purge` ei kustuta kohalikku `.azure/` olekut.

> **Nõuanne:** pärast kõigi puuduvate failide lisamist käivitage esmalt `azd provision --preview`. Kontrollige konksusid enne eelvaadet, sest need võivad käivitada kõrvalmõjuga käske. Eelvaade ei ole hinnang ega garantii, et juurutamine õnnestub.

---

## 5. samm: Avaldage mall

Lükake hoidla GitHubi (avalik, kui soovite, et teised saaksid seda kasutada):

```bash
# Return to the SOURCE template folder, not /tmp/test-run.
# Review .gitignore and staged content; never commit .azure/ or secrets.
git add azure.yaml infra src README.md .gitignore
git commit -m "Add reusable azd template"
gh repo create my-azd-template --public --source=. --push
```

Keegi saab seda nüüd kasutada:

```bash
azd init --template your-github-username/my-azd-template .
```

---

## 6. samm (valikuline): Esitage Awesome AZD-sse

Kogukonna malle loetleb [Awesome AZD galerii](https://azure.github.io/awesome-azd/). Selleks, et teie hoidla oleks loetletud, peaks see sisaldama:

- ✅ Selget `README.md` eeldustega, arhitektuuri skeemiga ja kulumärkmetega
- ✅ Töötavat `azure.yaml` koos `metadata.template`-ga
- ✅ Infrastruktuuri, mis seob korrektselt uue tellimuse peale
- ✅ `LICENSE` faili
- ✅ (Soovitatav) Ühte klõpsuga Codespaces'i jaoks mõeldud `.devcontainer/`

Esitage see, avades tõmbepäringu, mis lisab teie malli galeriisse andmefaili, järgides panustamisjuhendit [Awesome AZD hoidlas](https://github.com/Azure/awesome-azd).

---

## Levinud lõksud

| Lõks | Parandus |
|---------|-----|
| Kõva kodeeringuga ressursinimed | Kasuta `uniqueString()` ressursitokenit |
| `azd down` jätab ressursid alles | Märgista iga ressurss (või ressursside grupp) `azd-env-name`'ga |
| Mall töötab sinu jaoks, aga mitte teiste jaoks | Eemalda tellimuse ID-d, kliendi ID-d ja piirkonna eeldused |
| Väljundid pole rakendusega ühendatud | Sobita `azd-service-name`/`resourceName` juurutamisel ja kaardi väljundid rakenduse sättetega selgelt |
| Galerii esitus tagasilükatud | Lisa `README.md`, `LICENSE` ja `metadata.template` |

---

## Kokkuvõte

- Mall on lihtsalt Git repositoorium koos `azure.yaml`, `infra/` ja su koodiga.
- Parameetriseeri kõik—nimed, piirkonnad ja ID-d—et see töötaks kõikjal.
- Alati märgi ressursid `azd-env-name` nii et `azd down` töötab.
- Testi lokaalselt `azd init --template <local-path>` enne avaldamist.
- Lisa metainfo ja README, et esitada Awesome AZD-le.

---

## 🔗 Navigatsioon

| Suund | Ressurss |
|-----------|----------|
| **Eelmine** | [Deploy juhend](deployment-guide.md) |
| **Peatüki Kodu** | [4. peatükk: Infrastruktuur koodina](README.md) |
| **Järgmine Peatükk** | [5. peatükk: Mitmeagendi lahendused](../chapter-05-multi-agent/README.md) |

## 📖 Seotud Ressursid

- [Ressursside loomiseks](provisioning.md)
- [Awesome AZD Galerii](https://azure.github.io/awesome-azd/)
- [Ametlik azd mallide dokumentatsioon](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->