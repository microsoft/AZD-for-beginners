# Authoring Your Own azd Template

**Chapter Navigation:**
- **📚 Course Home**: [AZD algajatele](../../README.md)
- **📖 Current Chapter**: Peatükk 4 - Infrastruktuur koodina ja juurutamine
- **⬅️ Previous**: [Juurutamisjuhend](deployment-guide.md)
- **🚀 Next Chapter**: [Peatükk 5: Mitmeagendilised lahendused](../chapter-05-multi-agent/README.md)

> Kinnitatud `azd 1.25.6` seisuga juuni 2026.

## Sissejuhatus

Siiani oled sa *kasutanud* malle käsuga `azd init --template <name>`. Kuid kui sul on projektistruktuur, mis meeldib sinu meeskonnale — näiteks Container App koos Cosmos DB ja sobiva jälgimisega — tahad seda muuta taaskasutatavaks malliks. Mall on lihtsalt Git-hoidla etteaimatava struktuuriga, mida azd oskab lugeda. See õppetund näitab, kuidas sellise malli nullist luua, testida ja (valikuliselt) avaldada kogukonna galeriis.

## Õpieesmärgid

Selle õppetunni lõpuks sa:
- Mõistad, mis teeb kaustast "azd malli"
- Tead nõutavaid faile ja kausta paigutust
- Lisad `azure.yaml` ja `infra/`, mida teised saavad taaskasutada
- Testid oma malli kohapeal enne jagamist
- Avaldad selle ja (valikuline) esitad Awesome AZD-ile

## Õpitulemused

Pärast selle õppetunni läbimist oskad:
- Luua uue malli hoidla struktuuri
- Parameetriseerida infrastruktuuri nii, et see töötab igas subscriptionis
- Valideerida malli `azd init` ja `azd up` abil
- Lisada metaandmed, mida kogukonna galerii nõuab

---

## Mis see mall tegelikult on?

azd mall on **Git-hoidla**, mis sisaldab vähemalt:

| File / folder | Purpose | Required? |
|---------------|---------|-----------|
| `azure.yaml` | Kirjeldab teenuseid, hoste ja infrastruktuuri pakkujat | ✅ Jah |
| `infra/` | Bicep, Terraform või Pulumi, mis provisioneerib ressursid | ✅ Jah |
| `src/` (or your code) | Rakenduse kood, mida azd juurutab | ✅ Jah |
| `README.md` | Kuidas malliga töötada | ✅ Soovitatav |
| `.azdo/` või `.github/` | CI/CD pipeline'i definitsioonid | Valikuline |
| `.devcontainer/` | Reprotsibleeruv arenduskeskkond | Valikuline |
| `azure.yaml` `metadata` | Galerii ja telemeetriainformatsioon | Valikuline (vajalik avaldamiseks) |

Siin pole midagi maagilist: kui käivitad `azd init --template you/your-repo`, kloonib azd hoidlа ja loeb `azure.yaml`.

---

## Samm 1: Hoidla struktuuri loomine

Loo kaustastruktuur käsitsi või alusta minimaalsest mallist ja muuda seda:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Loo standardne paigutus
mkdir -p src infra
```

Tüüpiline lõplik paigutus näeb välja nii:

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

See on malli süda. See ütleb azd-ile, mida juurutada ja kuidas:

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

> Välja `metadata.template` kasutab galerii telemeetria kasutuse loendamiseks. Kasuta konventsiooni `name@version`.

---

## Samm 3: Parameetriseeri infrastruktuur

Kõige olulisem reegel *taaskasutatava* malli puhul: **ärge kunagi kovakodeerige nimesid, regioonide või subscription-spetsiifilisi väärtusi.** Kasutage parameetreid ja ressursside token-patent, nii et sama mall töötab igaühe subscriptionis.

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

Kaks asja muudavad selle malli kasutajasõbralikuks:

1. **`azd-env-name` silt** — azd kasutab seda keskkonna ressursse jälgimiseks ja puhastamiseks.
2. **`uniqueString(...)` ressurssitoken** — genereerib stabiilse, globaalselt-unikaalse järelliite, et nimed ei kattuks.

Lisa vastav parameetrite fail, mis loeb väärtusi, mida azd keskkonnast süstib:

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

azd asendab automaatselt `${AZURE_ENV_NAME}` ja `${AZURE_LOCATION}` jooksvalt keskkonnast.

---

## Samm 4: Testi oma malli kohapeal

Enne jagamist veendu, et mall töötab puhtast olekust.

**Testi kohalikust kaustast** (ei ole vaja Git'i push'i):

```bash
# Tühjast kataloogist initsialiseeri, kasutades oma kohalikku malli teed
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Provisioneerimine ja juurutamine otsast lõpuni
azd auth login
azd up
```

**Seejärel testi eemaldamist** — hea mall puhastab kõik täielikult:

```bash
azd down --force --purge
```

Kui `azd down` jätab ressursse, jätsid tõenäoliselt ressursile `azd-env-name` sildi lisamata.

> **Vihje:** käivita esmalt `azd provision --preview`. See teeb what-if'i ja toob vead esile enne mis tahes ressursi loomist.

---

## Samm 5: Avalda mall

Push'i hoidla GitHubi (avalik, kui soovid, et teised seda kasutaksid):

```bash
gh repo create my-azd-template --public --source=. --push
```

Nüüd saavad seda igaüks kasutada:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Samm 6 (valikuline): Esita Awesome AZD-ile

[Awesome AZD galerii](https://azure.github.io/awesome-azd/) loetleb kogukonna malle. Et sind loetletaks, peaks su repo sisaldama:

- ✅ Selget `README.md`, mis sisaldab eeldusi, arhitektuuri diagrammi ja kulumärkusi
- ✅ Töötavat `azure.yaml` koos `metadata.template`
- ✅ Infrastruktuuri, mis provisioneerib puhtalt uues subscriptionis
- ✅ `LICENSE` faili
- ✅ (Soovitatav) `.devcontainer/` ühe-klõpsu Codespaces jaoks

Esita see, avades pull requesti, mis lisab su malli galeriide andmefaili, järgides panustamisjuhist [Awesome AZD hoidlas](https://github.com/Azure/awesome-azd).

---

## Levinumad lõksud

| Pitfall | Fix |
|---------|-----|
| Kõvaks kodeeritud ressursside nimed | Kasuta `uniqueString()` ressurssitoken'it |
| `azd down` jätab ressursid | Sildi iga ressurssi (või ressursigrupi) `azd-env-name`-ga |
| Mall töötab sinu puhul, ebaõnnestub teistel | Eemalda subscription ID-d, tenant ID-d ja regiooni eeldused |
| Väljundid pole rakendusega ühendatud | Ekspordi `SERVICE_<NAME>_ENDPOINT_URL` ja teised `AZURE_*` väljundid |
| Galeriisse esitamine tagasi lükatud | Lisa `README.md`, `LICENSE` ja `metadata.template` |

---

## Kokkuvõte

- Mall on lihtsalt Git-hoidla koos `azure.yaml`, `infra/` ja sinu koodiga.
- Parameetriseeri kõik — nimed, regioonid ja ID-d — et see tööle läheks igal pool.
- Sildi alati ressursid `azd-env-name`-ga, et `azd down` töötaks.
- Testi kohapeal käsuga `azd init --template <local-path>` enne avaldamist.
- Lisa metaandmed ja README, et esitada Awesome AZD-ile.

---

## 🔗 Navigation

| Direction | Resource |
|-----------|----------|
| **Previous** | [Juurutamisjuhend](deployment-guide.md) |
| **Chapter Home** | [Peatükk 4: Infrastruktuur koodina](README.md) |
| **Next Chapter** | [Peatükk 5: Mitmeagendilised lahendused](../chapter-05-multi-agent/README.md) |

## 📖 Related Resources

- [Ressursside provisioneerimine](provisioning.md)
- [Awesome AZD galerii](https://azure.github.io/awesome-azd/)
- [Ametlik azd malli dokumentatsioon](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->