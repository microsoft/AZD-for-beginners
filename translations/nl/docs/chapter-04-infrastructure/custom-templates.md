# Je Eigen azd-sjabloon Maken

**Hoofdstuk Navigatie:**
- **📚 Cursus Startpagina**: [AZD Voor Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 4 - Infrastructuur als Code & Implementatie
- **⬅️ Vorige**: [Implementatiegids](deployment-guide.md)
- **🚀 Volgend Hoofdstuk**: [Hoofdstuk 5: Multi-Agent Oplossingen](../chapter-05-multi-agent/README.md)

> Gevalideerd met `azd 1.27.1` in juli 2026.

## Introductie

Tot nu toe heb je *sjablonen geconsumeerd* met `azd init --template <naam>`. Maar zodra je een projectindeling hebt waar je team blij mee is—bijvoorbeeld een Container App met een Cosmos DB en de juiste monitoring—wil je het omzetten in een herbruikbaar eigen sjabloon. Een sjabloon is gewoon een Git repository met een voorspelbare structuur die azd kan lezen. Deze les laat zien hoe je er één vanaf nul maakt, test en (optioneel) publiceert naar de community-galerij.

## Leerdoelen

Aan het einde van deze les zul je:
- Begrijpen wat een map een "azd-sjabloon" maakt
- De benodigde bestanden en mapindeling kennen
- Een `azure.yaml` en `infra/` toevoegen die anderen kunnen hergebruiken
- Je sjabloon lokaal testen voordat je het deelt
- Het publiceren en (optioneel) indienen bij Awesome AZD

## Leerresultaten

Na het voltooien van deze les kun je:
- Een nieuwe sjabloonrepository opzetten
- Infrastructuur parameteriseren zodat het in elke subscription werkt
- Een sjabloon valideren met `azd init` en `azd up`
- De metadata toevoegen die de community-galerij vereist

---

## Wat is een Sjabloon, Eigenlijk?

Een azd-sjabloon is **een Git repository** die minimaal bevat:

| Bestand / map | Doel | Verplicht? |
|---------------|-------|------------|
| `azure.yaml` | Beschrijft diensten, hosts en infra-provider | ✅ Ja |
| `infra/` | Bicep, Terraform of Pulumi die resources aanmaakt | ✅ Ja |
| `src/` (of jouw code) | De applicatiecode die azd uitrolt | ✅ Ja |
| `README.md` | Hoe het sjabloon te gebruiken | ✅ Sterk aanbevolen |
| `.azdo/` of `.github/` | CI/CD pipeline definities | Optioneel |
| `.devcontainer/` | Reproduceerbare ontwikkelomgeving | Optioneel |
| `azure.yaml` `metadata` | Galerie + telemetrie info | Optioneel (verplicht om te publiceren) |

Er is niets magisch aan: wanneer je `azd init --template you/your-repo` uitvoert, kloont azd de repo en leest `azure.yaml`.

---

## Stap 1: Scaffold de Repository

Maak de mappenstructuur met de hand aan of start vanuit een minimaal sjabloon en bewerk het:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Maak de standaardindeling
mkdir -p src infra
```

Een typische uiteindelijke indeling ziet eruit als:

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

Dit is het hart van het sjabloon. Het vertelt azd wat er uitgerold moet worden en hoe:

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

> Het veld `metadata.template` is wat gallery telemetrie gebruikt om gebruik te tellen. Gebruik de conventie `name@version`.

---

## Stap 3: Parameteriseer de Infrastructuur

De allerbelangrijkste regel voor een *herbruikbaar* sjabloon: **hardcode nooit namen, regio's of abonnement-specifieke waarden.** Gebruik parameters en het resource token patroon zodat hetzelfde sjabloon in ieders abonnement werkt.

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

Twee zaken maken dit sjabloon vriendelijk:

1. **`azd-env-name` tag** — azd gebruikt dit om resources per omgeving te volgen en op te ruimen.
2. **`uniqueString(...)` resource token** — levert een stabiele, wereldwijd unieke achtervoegsel zodat namen niet conflicteren.

Zorg voor een bijpassend parametersbestand dat waarden inleest die azd injecteert vanuit de omgeving:

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

## Stap 4: Test Je Sjabloon Lokaal

Bewijs dat het sjabloon werkt vanaf een schone staat voordat je het deelt.

**Test vanaf de lokale map** (geen Git push vereist):

```bash
# Vanaf een lege map initialiseren met behulp van je lokale sjabloonpad
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Provisioneren + end-to-end implementeren
azd auth login
azd up
```

**Test daarna het opruimen**—een goed sjabloon ruimt volledig op:

```bash
azd down --force --purge
```

Als `azd down` resources achterlaat, heb je waarschijnlijk de `azd-env-name` tag op een resource gemist.

> **Tip:** voer eerst `azd provision --preview` uit. Het doet een wat-als analyse en toont sjabloonfouten voordat resources worden aangemaakt.

---

## Stap 5: Publiceer het Sjabloon

Push de repository naar GitHub (openbaar als je wilt dat anderen het gebruiken):

```bash
gh repo create my-azd-template --public --source=. --push
```

Iedereen kan het nu gebruiken:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Stap 6 (optioneel): Indienen bij Awesome AZD

De [Awesome AZD galerij](https://azure.github.io/awesome-azd/) toont communitysjablonen. Om opgenomen te worden moet je repo bevatten:

- ✅ Een duidelijke `README.md` met vereisten, een architectuurdiagram en kostennotities
- ✅ Een werkende `azure.yaml` met `metadata.template`
- ✅ Infrastructuur die schoon uitrolt in een vers abonnement
- ✅ Een `LICENSE` bestand
- ✅ (Aanbevolen) Een `.devcontainer/` voor one-click Codespaces

Dien in door een pull request te openen die je sjabloon toevoegt aan het galerij-databestand, volgens de bijdragehandleiding in de [Awesome AZD repository](https://github.com/Azure/awesome-azd).

---

## Veelvoorkomende Valkuilen

| Valkuil | Oplossing |
|---------|----------|
| Hardcoded resource-namen | Gebruik de `uniqueString()` resource token |
| `azd down` laat resources achter | Tag elke resource (of de resourcegroep) met `azd-env-name` |
| Sjabloon werkt voor jou, faalt voor anderen | Verwijder abonnement-ID's, tenant-ID's en regio-veronderstellingen |
| Outputs zijn niet gekoppeld aan de app | Exporteer `SERVICE_<NAME>_ENDPOINT_URL` en andere `AZURE_*` outputs |
| Galerie-indiening afgewezen | Voeg `README.md`, `LICENSE` en `metadata.template` toe |

---

## Samenvatting

- Een sjabloon is gewoon een Git repo met `azure.yaml`, `infra/` en je code.
- Parameteriseer alles—namen, regio's, en ID's—zodat het overal werkt.
- Tag altijd resources met `azd-env-name` zodat `azd down` werkt.
- Test lokaal met `azd init --template <lokale-pad>` voor publicatie.
- Voeg metadata en een README toe voor inzending bij Awesome AZD.

---

## 🔗 Navigatie

| Richting | Bron |
|---------|-------|
| **Vorige** | [Implementatiegids](deployment-guide.md) |
| **Hoofdstuk Startpagina** | [Hoofdstuk 4: Infrastructuur als Code](README.md) |
| **Volgend Hoofdstuk** | [Hoofdstuk 5: Multi-Agent Oplossingen](../chapter-05-multi-agent/README.md) |

## 📖 Gerelateerde Bronnen

- [Resources Provisioneren](provisioning.md)
- [Awesome AZD Galerij](https://azure.github.io/awesome-azd/)
- [Officiële azd sjabloondocumentatie](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->