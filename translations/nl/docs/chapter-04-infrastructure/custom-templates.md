# Je Eigen azd-sjabloon Maken

**Hoofdstuknavigatie:**
- **📚 Cursus startpagina**: [AZD Voor Beginners](../../README.md)
- **📖 Huidig hoofdstuk**: Hoofdstuk 4 - Infrastructuur als Code & Deployment
- **⬅️ Vorige**: [Deployment Gids](deployment-guide.md)
- **🚀 Volgend hoofdstuk**: [Hoofdstuk 5: Multi-Agent Oplossingen](../chapter-05-multi-agent/README.md)

> Beoordeeld tegen `azd 1.37.2` (november 2026). Dit is een **stap-voor-stap schrijfgids met gedeeltelijke bestanden**, geen volledig sjabloon: je moet zelf applicatiecode en `modules/web.bicep` met de omgeving, registry, Container App, en outputs leveren vóór de deployment. Azure provisioning is niet uitgevoerd in deze review.

## Introductie

Tot nu toe heb je sjablonen *gebruikt* met `azd init --template <name>`. Maar zodra je een projectindeling hebt die je team bevalt — bijvoorbeeld een Container App met een Cosmos DB en de juiste monitoring — wil je het omzetten in een herbruikbaar sjabloon van jezelf. Een sjabloon is gewoon een Git-repository met een voorspelbare structuur die azd kan lezen. Deze les laat zien hoe je er een vanaf nul bouwt, test, en (optioneel) publiceert naar de community-galerij.

## Leerdoelen

Aan het eind van deze les zul je:
- Begrijpen wat een map een "azd-sjabloon" maakt
- Weten welke bestanden en mappenstructuur verplicht is
- Een `azure.yaml` en `infra/` toevoegen die anderen kunnen hergebruiken
- Je sjabloon lokaal testen voordat je het deelt
- Het publiceren en (optioneel) indienen bij Awesome AZD

## Leerresultaten

Na het voltooien van deze les ben je in staat om:
- Een nieuwe sjabloonrepository op te zetten
- Infrastructuur parametriseren zodat het in elke subscription werkt
- Een sjabloon valideren met `azd init` en `azd up`
- De metadata toe te voegen die de community-galerij vereist

---

## Wat is een Sjabloon, Eigenlijk?

Een azd-sjabloon is **een Git-repository** die minimaal bevat:

| Bestand / map | Doel | Verplicht? |
|---------------|--------|-----------|
| `azure.yaml` | Beschrijft services, hosts, en infra-provider | ✅ Ja |
| `infra/` | Bicep- of Terraform provisioningdefinities | Verplicht voor dit expliciete-IaC voorbeeld; projecten met gegenereerde infrastructuur kunnen het weglaten |
| `src/` (of je code) | De applicatiecode die azd deployt | Verplicht voor bron-gebaseerde services; niet alle sjablonen bevatten applicatiecode |
| `README.md` | Hoe het sjabloon te gebruiken | ✅ Sterk aanbevolen |
| `.azdo/` of `.github/` | CI/CD pipeline definities | Optioneel |
| `.devcontainer/` | Reproduceerbare ontwikkelomgeving | Optioneel |
| `azure.yaml` `metadata` | Template-identiteit/telemetrie-informatie | Aanbevolen; een Git-repository publiceren vereist het niet |

Er is hier geen magie: wanneer je `azd init --template you/your-repo` uitvoert, kloont azd de repo en leest `azure.yaml`.

---

## Stap 1: Scaffold de Repository

Maak de mapstructuur met de hand aan of begin met een minimaal sjabloon en bewerk dat:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Create the standard layout
mkdir -p src infra
```

Een typische afgewerkte indeling ziet er zo uit:

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

## Stap 2: Schrijf `azure.yaml`

Dit is het hart van het sjabloon. Het vertelt azd wat en hoe te deployen:

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

> Het `metadata.template` veld is wat de galerij-telemetrie gebruikt om gebruik te tellen. Gebruik de `name@version` conventie.

---

## Stap 3: Parametriseer de Infrastructuur

De allerbelangrijkste regel voor een *herbruikbaar* sjabloon: **nooit hardcoded namen, regio’s of abonnementspecifieke waarden gebruiken.** Gebruik parameters en het resource token-patroon zodat hetzelfde sjabloon in ieders abonnement werkt.

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

Twee dingen maken dit sjabloon vriendelijk:

1. **`azd-env-name` tag** — azd gebruikt dit om resources per omgeving te volgen en op te ruimen.
2. **`uniqueString(...)` resource token** — genereert een stabiele hash-suffix om botsingen te verminderen; het is geen garantie voor wereldwijde uniekheid.

De missende `modules/web.bicep` moet `name`, `location`, en `tags` accepteren, de Container Apps-omgeving/registry en app provisionen, de app taggen met `azd-service-name: web`, en `uri` exporteren. Het moet ook registry-waarden blootstellen die nodig zijn voor de gekozen build/deploy flow (bijvoorbeeld `AZURE_CONTAINER_REGISTRY_ENDPOINT` uit de root-module). Een endpoint output alleen verbindt geen service discovery, applicatie-instellingen of registry-authenticatie.

Lever een bijpassend parametersbestand aan dat waarden leest die azd uit de omgeving injecteert:

Sla het volgende op als `infra/main.parameters.json`:

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

azd vervangt automatisch `${AZURE_ENV_NAME}` en `${AZURE_LOCATION}` uit de actuele omgeving.

---

## Stap 4: Test Je Sjabloon Lokaal

Bewijs vóór het delen dat het sjabloon werkt vanuit een schone staat.

**Test vanuit de lokale map** (geen Git push vereist):

```bash
# From an empty directory, initialize using your local template path
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template .

# Provision + deploy end to end
azd auth login
azd up
```

**Test daarna het opruimen (teardown)** — een goed sjabloon ruimt volledig op:

```bash
azd down --force --purge
```

Als `azd down` resources achterlaat, controleer dan omgeving/resource-groep detectie, externe/gedeelde resources, permissies, locks en purge-bescherming. `--purge` verwijdert geen lokale `.azure/` status.

> **Tip:** zodra je alle missende bestanden hebt aangeleverd, voer eerst `azd provision --preview` uit. Inspecteer hooks vóór preview omdat ze commando’s met bijwerkingen kunnen uitvoeren. Preview is geen prijsinschatting of garantie dat provisioning slaagt.

---

## Stap 5: Publiceer het Sjabloon

Push de repository naar GitHub (public als je wilt dat anderen het kunnen gebruiken):

```bash
# Return to the SOURCE template folder, not /tmp/test-run.
# Review .gitignore and staged content; never commit .azure/ or secrets.
git add azure.yaml infra src README.md .gitignore
git commit -m "Add reusable azd template"
gh repo create my-azd-template --public --source=. --push
```

Iedereen kan het nu gebruiken:

```bash
azd init --template your-github-username/my-azd-template .
```

---

## Stap 6 (Optioneel): Indienen bij Awesome AZD

De [Awesome AZD galerij](https://azure.github.io/awesome-azd/) toont community-sjablonen. Om vermeld te worden moet je repo bevatten:

- ✅ Een duidelijke `README.md` met vereisten, een architectuurschema en kostenopmerkingen
- ✅ Een werkende `azure.yaml` met `metadata.template`
- ✅ Infrastructuur die netjes provisioneert in een nieuw abonnement
- ✅ Een `LICENSE` bestand
- ✅ (Aanbevolen) Een `.devcontainer/` voor one-click Codespaces

Dien in door een pull request te openen die je sjabloon toevoegt aan het data bestand van de galerij, volgens de bijdragehandleiding in de [Awesome AZD repository](https://github.com/Azure/awesome-azd).

---

## Veelvoorkomende Valkuilen

| Valkuil | Oplossing |
|---------|----------|
| Hardcoded resource-namen | Gebruik het `uniqueString()` resource token |
| `azd down` laat resources achter | Tag elke resource (of resource-groep) met `azd-env-name` |
| Sjabloon werkt voor jou, faalt voor anderen | Verwijder subscription IDs, tenant IDs, en regiovoorspellingen |
| Outputs niet verbonden met de app | Laat `azd-service-name`/`resourceName` overeenkomen voor deployment en map outputs expliciet naar app settings |
| Galerie-indiening afgewezen | Voeg `README.md`, `LICENSE`, en `metadata.template` toe |

---

## Samenvatting

- Een sjabloon is gewoon een Git-repo met `azure.yaml`, `infra/`, en je code.
- Parametriseer alles — namen, regio’s en IDs — zodat het overal draait.
- Tag altijd resources met `azd-env-name` zodat `azd down` werkt.
- Test lokaal met `azd init --template <local-path>` voor publicatie.
- Voeg metadata en een README toe om in te dienen bij Awesome AZD.

---

## 🔗 Navigatie

| Richting | Bron |
|-----------|----------|
| **Vorige** | [Deployment Gids](deployment-guide.md) |
| **Hoofdstuk startpagina** | [Hoofdstuk 4: Infrastructuur als Code](README.md) |
| **Volgend hoofdstuk** | [Hoofdstuk 5: Multi-Agent Oplossingen](../chapter-05-multi-agent/README.md) |

## 📖 Gerelateerde Bronnen

- [Provisioneren van Resources](provisioning.md)
- [Awesome AZD Galerij](https://azure.github.io/awesome-azd/)
- [Officiële azd sjabloondocumentatie](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->