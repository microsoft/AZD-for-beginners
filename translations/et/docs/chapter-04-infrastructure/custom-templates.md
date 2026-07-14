# Oma azd-malli loomine

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Käesolev peatükk**: Peatükk 4 - Infrastruktuur kui kood & juurutamine
- **⬅️ Eelmine**: [Juurutamisjuhend](deployment-guide.md)
- **🚀 Järgmine peatükk**: [Peatükk 5: Mitmeagendi lahendused](../chapter-05-multi-agent/README.md)

> Kontrollitud `azd 1.27.1` vastu 2026. aasta juulis.

## Sissejuhatus

Seni oled sa *kasutanud* malle käsuga `azd init --template <nimi>`. Kui sul on aga meeskonnas lemmikprojektistruktuur – näiteks konteinerirakendus koos Cosmos DB ja sobiva jälgimisega –, tahad sellest luua taaskasutatava omaenda malli. Mall on lihtsalt Git-repositoorium kindla struktuuriga, mida azd oskab lugeda. See õppetund näitab, kuidas seda nullist luua, testida ja (vajadusel) avalikkusele galerii kaudu avaldada.

## Õpieesmärgid

Selle õppetunni lõpuks:
- Mõistad, mis teeb kaustast "azd-malli"
- Tead vajalikke faile ja kaustastruktuuri
- Lisad `azure.yaml` ja `infra/`, mida teised saavad taaskasutada
- Testid oma malli kohapeal enne jagamist
- Avaldad selle ja (vajadusel) esitad Awesome AZD kogukonna galerii jaoks

## Õpitulemused

Pärast õppetunni läbimist suudad:
- Luua uue malli repositooriumi
- Parametreerida infrastruktuuri nii, et see töötaks mistahes tellimuses
- Kontrollida malli `azd init` ja `azd up` käskudega
- Lisada metaandmed, mida kogukonna galerii nõuab

---

## Mis täpselt on mall?

Azd-mall on **Git-repositoorium**, mis sisaldab vähemalt:

| Fail / kaust | Eesmärk | Nõutud? |
|------------|---------|-----------|
| `azure.yaml` | Kirjeldab teenuseid, hosteid ja infrastruktuuri pakkujat | ✅ Jah |
| `infra/` | Bicep, Terraform või Pulumi, mis loob ressursid | ✅ Jah |
| `src/` (või sinu kood) | Rakenduse kood, mida azd juurutab | ✅ Jah |
| `README.md` | Kuidas malli kasutada | ✅ Soovitav |
| `.azdo/` või `.github/` | CI/CD torujuhtmete definitsioonid | Valikuline |
| `.devcontainer/` | Reprodutseeritav arenduskeskkond | Valikuline |
| `azure.yaml` `metadata` | Galerii + telemeetria info | Valikuline (nõutud avaldamiseks) |

Siin pole midagi võlukunsti: kui jooksutad `azd init --template you/your-repo`, kloonib azd repositooriumi ja loeb `azure.yaml`.

---

## Samm 1: Repositooriumi ülesehitus

Loo kaustastruktuur käsitsi või alusta minimaalsest mallist ning muuda seda:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Loo standardne paigutus
mkdir -p src infra
```

Tüüpiline lõpetatud paigutus näeb välja selline:

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

## Samm 2: Kirjuta `azure.yaml`

See on malli süda. Sellega ütled azd-le, mida ja kuidas juurutada:

```yaml
# azure.yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: my-azd-template
metadata:
  template: my-azd-template@1.0.0   # name@version — used by the gallery and telemetry
infra:
  provider: bicep                   # or "terraform" / "pulumi"
  path: infra
services:
  web:
    project: ./src/app
    language: js                    # js | python | dotnet | java | go
    host: containerapp              # appservice | containerapp | function | aks | staticwebapp
```

> Väli `metadata.template` on see, mida galerii telemeetria kasutab kasutuse arvutamiseks. Kasuta konventsiooni `name@version`.

---

## Samm 3: Parametreeri infrastruktuur

Kõige olulisem reegel *taaskasutatavale* mallile: **ära kunagi kõvasti kodeeri nimesid, piirkondi ega tellimuse-spetsiifilisi väärtusi.** Kasuta parameetreid ja ressursi tokeni mustrit, et sama mall töötaks igas tellimuses.

```bicep
// infra/main.bicep
targetScope = 'resourceGroup'

@minLength(1)
@description('Primary location for all resources')
param location string = resourceGroup().location

@minLength(1)
@maxLength(64)
@description('Name of the environment (used to generate resource names)')
param environmentName string

// Generate globally-unique, stable names from the environment + subscription
var resourceToken = uniqueString(subscription().id, environmentName, location)
var tags = { 'azd-env-name': environmentName }

module web 'modules/web.bicep' = {
  name: 'web'
  params: {
    name: 'app-${resourceToken}'
    location: location
    tags: tags
  }
}

output SERVICE_WEB_ENDPOINT_URL string = web.outputs.uri
```

Kaks asja muudavad selle malli sõbralikuks:

1. **`azd-env-name` silt** — azd kasutab seda, et keskkonniti ressursse jälgida ja puhastada.
2. **`uniqueString(...)` ressursi token** — genereerib stabiilse ja globaalselt unikaalse järelliite, et nimed ei kattuks.

Lisa sobiv parameetrite fail, mis loeb väärtusi, mida azd keskkonnast süstib:

```json
// infra/main.parameters.json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": { "value": "${AZURE_ENV_NAME}" },
    "location": { "value": "${AZURE_LOCATION}" }
  }
}
```

azd asendab `${AZURE_ENV_NAME}` ja `${AZURE_LOCATION}` automaatselt sellest keskkonnast.

---

## Samm 4: Testi oma malli kohalikult

Enne jagamist veendu, et mall töötab puhtast olekust.

**Testi kohalikust kaustast** (Git-push pole vajalik):

```bash
# Tühjast kataloogist alusta initsialiseerimist, kasutades oma lokaalseid malliradasid
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Loomine + juurutamine algusest lõpuni
azd auth login
azd up
```

**Testi siis eemaldamist** — hea mall puhastab täielikult:

```bash
azd down --force --purge
```

Kui `azd down` jätab ressursid alles, jäi sul tõenäoliselt puudu ressursi `azd-env-name` silt.

> **Nipp:** käivita esmalt `azd provision --preview`. See teeb what-if simulatsiooni ja kuvab malli vead enne ressursside loomist.

---

## Samm 5: Avalda mall

Pushi repositoorium GitHubi (avalik, kui tahad, et teised seda kasutaksid):

```bash
gh repo create my-azd-template --public --source=. --push
```

Nüüd saab seda igaüks kasutada:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Samm 6 (valikuline): Esita Awesome AZD kogukonna galeriisse

[Awesome AZD galerii](https://azure.github.io/awesome-azd/) loetleb kogukonna malle. Selleks, et seal olla, peaks su repo sisaldama:

- ✅ Selget `README.md` koos eelduste, arhitektuuri diagrammi ja kulude märkustega
- ✅ Töötavat `azure.yaml` koos `metadata.template`-ga
- ✅ Infrastruktuuri, mis loob puhtalt uues tellimuses
- ✅ `LICENSE` faili
- ✅ (Soovitatav) `.devcontainer/` ühekordseks Codespaces'i avamiseks

Esita see, avades pull requesti, mis lisab su malli galerii andmefaili, järgides panustamisjuhendit [Awesome AZD repositooriumis](https://github.com/Azure/awesome-azd).

---

## Levinumad lõksud

| Lõks | Lahendus |
|------|---------|
| Kõvasti kodeeritud ressursinimed | Kasuta `uniqueString()` ressursi tokenit |
| `azd down` jätab ressursid alles | Sildi iga ressurss (või ressursigrupi) `azd-env-name`-ga |
| Mall töötab sul, aga mitte teistel | Eemalda tellimuse ID-d, teenusepakkuja ID-d ja piirkonna eeldused |
| Väljundid pole rakendusega ühendatud | Eksporti `SERVICE_<NAME>_ENDPOINT_URL` ja muud `AZURE_*` väljundid |
| Galerii esitamine tagasi lükatud | Lisa `README.md`, `LICENSE` ja `metadata.template` |

---

## Kokkuvõte

- Mall on lihtsalt Git repo, mis sisaldab `azure.yaml`, `infra/` ja sinu koodi.
- Parametreeri kõik — nimed, regioonid ja ID-d — nii käib see kõikjal.
- Sildi alati ressursid `azd-env-name`-ga, et `azd down` toimiks.
- Testi kohalikult käsuga `azd init --template <local-path>` enne avaldamist.
- Lisa metaandmed ja README, et saaksid esitada Awesome AZD-sse.

---

## 🔗 Navigeerimine

| Suund | Ressurss |
|-------|----------|
| **Eelmine** | [Juurutamisjuhend](deployment-guide.md) |
| **Peatüki avaleht** | [Peatükk 4: Infrastruktuur kui kood](README.md) |
| **Järgmine peatükk** | [Peatükk 5: Mitmeagendi lahendused](../chapter-05-multi-agent/README.md) |

## 📖 Seotud ressursid

- [Ressursside juurutamine](provisioning.md)
- [Awesome AZD galerii](https://azure.github.io/awesome-azd/)
- [Ametlik azd malli dokumentatsioon](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->