# Authoring Your Own azd Template

**Chapter Navigation:**
- **📚 Course Home**: [AZD voor Beginners](../../README.md)
- **📖 Current Chapter**: Hoofdstuk 4 - Infrastructuur als Code & Implementatie
- **⬅️ Previous**: [Implementatiegids](deployment-guide.md)
- **🚀 Next Chapter**: [Hoofdstuk 5: Multi-agent Oplossingen](../chapter-05-multi-agent/README.md)

> Geverifieerd tegen `azd 1.25.6` in juni 2026.

## Introduction

Tot nu toe heb je templates *geconsumeerd* met `azd init --template <name>`. Maar zodra je een projectindeling hebt waar je team blij mee is — bijvoorbeeld een Container App met een Cosmos DB en de juiste monitoring — wil je die omzetten in een herbruikbaar template van jezelf. Een template is gewoon een Git-repository met een voorspelbare structuur die azd kan lezen. Deze les laat zien hoe je er een vanaf nul bouwt, test en (optioneel) publiceert in de community gallery.

## Learning Goals

Aan het einde van deze les zul je:
- Begrijpen wat een map tot een "azd template" maakt
- De vereiste bestanden en mappenstructuur kennen
- Een `azure.yaml` en `infra/` toevoegen die anderen kunnen hergebruiken
- Je template lokaal testen voordat je het deelt
- Het publiceren en (optioneel) indienen bij Awesome AZD

## Learning Outcomes

Na het voltooien van deze les kun je:
- Een nieuwe template-repository opzetten
- Infrastructuur parameteriseren zodat het in elke subscription werkt
- Een template valideren met `azd init` en `azd up`
- De metadata toevoegen die de community gallery vereist

---

## What Is a Template, Really?

Een azd-template is **een Git-repository** die minimaal het volgende bevat:

| File / folder | Purpose | Required? |
|---------------|---------|-----------|
| `azure.yaml` | Beschrijft services, hosts en infra-provider | ✅ Ja |
| `infra/` | Bicep, Terraform of Pulumi die resources provisioneert | ✅ Ja |
| `src/` (or your code) | De applicatiecode die azd implementeert | ✅ Ja |
| `README.md` | Hoe het template te gebruiken | ✅ Sterk aanbevolen |
| `.azdo/` of `.github/` | CI/CD pipeline-definities | Optioneel |
| `.devcontainer/` | Reproduceerbare ontwikkelomgeving | Optioneel |
| `azure.yaml` `metadata` | Gallery- en telemetry-informatie | Optioneel (vereist om te publiceren) |

Er zit niets magisch aan: wanneer je `azd init --template you/your-repo` uitvoert, kloont azd de repo en leest `azure.yaml`.

---

## Step 1: Scaffold the Repository

Maak de mappenstructuur handmatig aan of begin vanaf een minimaal template en bewerk het:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Maak de standaardindeling
mkdir -p src infra
```

Een typisch eindresultaat ziet er zo uit:

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

## Step 2: Write `azure.yaml`

Dit is het hart van het template. Het vertelt azd wat te deployen is en hoe:

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

> Het veld `metadata.template` is wat de gallery-telemetrie gebruikt om gebruik te tellen. Gebruik de conventie `name@version`.

---

## Step 3: Parameterize the Infrastructure

De belangrijkste regel voor een *herbruikbaar* template: **nooit namen, regio's of subscription-specifieke waarden hardcoderen.** Gebruik parameters en het resource token-patroon zodat hetzelfde template in ieders subscription werkt.

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

Twee dingen maken dit template-vriendelijk:

1. **`azd-env-name` tag** — azd gebruikt deze om resources per omgeving bij te houden en op te ruimen.
2. **`uniqueString(...)` resource token** — produceert een stabiele, wereldwijd-unieke suffix zodat namen niet botsen.

Voorzie een bijpassend parametersbestand dat waarden leest die azd vanuit de omgeving injecteert:

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

azd vervangt `${AZURE_ENV_NAME}` en `${AZURE_LOCATION}` automatisch vanuit de huidige omgeving.

---

## Step 4: Test Your Template Locally

Voordat je het deelt, bewijs je dat het template werkt vanuit een schone staat.

**Test vanuit de lokale map** (geen Git push vereist):

```bash
# Initialiseer vanuit een lege map met je lokale sjabloonpad
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Voorziening + implementatie van begin tot eind
azd auth login
azd up
```

**Test daarna de teardown** — een goed template ruimt volledig op:

```bash
azd down --force --purge
```

Als `azd down` resources achterlaat, heb je waarschijnlijk de `azd-env-name` tag op een resource gemist.

> **Tip:** voer eerst `azd provision --preview` uit. Het doet een what-if en toont template-fouten voordat er resources worden aangemaakt.

---

## Step 5: Publish the Template

Push de repository naar GitHub (openbaar als je wilt dat anderen het gebruiken):

```bash
gh repo create my-azd-template --public --source=. --push
```

Iedereen kan het nu gebruiken:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Step 6 (Optional): Submit to Awesome AZD

De [Awesome AZD gallery](https://azure.github.io/awesome-azd/) vermeldt community-templates. Om opgenomen te worden moet je repo het volgende bevatten:

- ✅ Een duidelijke `README.md` met vereisten, een architectuurdiagram en kostennotities
- ✅ Een werkende `azure.yaml` met `metadata.template`
- ✅ Infrastructuur die schoon provisioneert in een verse subscription
- ✅ Een `LICENSE`-bestand
- ✅ (Aanbevolen) Een `.devcontainer/` voor one-click Codespaces

Dien in door een pull request te openen dat je template toevoegt aan het data-bestand van de gallery, volgens de bijdragegids in de [Awesome AZD repository](https://github.com/Azure/awesome-azd).

---

## Common Pitfalls

| Pitfall | Fix |
|---------|-----|
| Hardcoded resource names | Gebruik de `uniqueString()` resource token |
| `azd down` leaves resources | Tag elke resource (of de resource group) met `azd-env-name` |
| Template works for you, fails for others | Verwijder subscription IDs, tenant IDs en regiovoorspelingen |
| Outputs not wired into the app | Exporteer `SERVICE_<NAME>_ENDPOINT_URL` en andere `AZURE_*` outputs |
| Gallery submission rejected | Voeg `README.md`, `LICENSE` en `metadata.template` toe |

---

## Summary

- Een template is gewoon een Git-repo met `azure.yaml`, `infra/` en je code.
- Parameteriseer alles — namen, regio's en ID's — zodat het overal draait.
- Tag altijd resources met `azd-env-name` zodat `azd down` werkt.
- Test lokaal met `azd init --template <local-path>` voordat je publiceert.
- Voeg metadata en een README toe om in te dienen bij Awesome AZD.

---

## 🔗 Navigation

| Direction | Resource |
|-----------|----------|
| **Previous** | [Implementatiegids](deployment-guide.md) |
| **Chapter Home** | [Hoofdstuk 4: Infrastructuur als Code](README.md) |
| **Next Chapter** | [Hoofdstuk 5: Multi-agent Oplossingen](../chapter-05-multi-agent/README.md) |

## 📖 Related Resources

- [Provisioning Resources](provisioning.md)
- [Awesome AZD Gallery](https://azure.github.io/awesome-azd/)
- [Official azd template documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->