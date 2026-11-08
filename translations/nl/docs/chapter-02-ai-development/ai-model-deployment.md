# AI Model Deployment met Azure Developer CLI

**Hoofdstuk Navigatie:**
- **📚 Cursus Home**: [AZD Voor Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 2 - AI-First Ontwikkeling
- **⬅️ Vorige**: [AI Agents](agents.md)
- **➡️ Volgende**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Volgend Hoofdstuk**: [Hoofdstuk 3: Configuratie](../chapter-03-configuration/configuration.md)

Deze gids biedt uitgebreide instructies voor het implementeren van AI-modellen met behulp van AZD-sjablonen, waarbij alles wordt behandeld van modelkeuze tot productiedistributiepatronen.

> **Release review (2026-11-04):** Gerelateerde CLI-wijzigingen zijn beoordeeld aan de hand van `azd` `1.37.2`; modelbeschikbaarheid, versies en quota blijven regio- en abonnement-afhankelijk. `azd deploy --timeout <seconds>` regelt het service-implementatievenster, niet de garantie voor agentactivatie. Zie [huidige release-opmerkingen en AI-migratierichtlijnen](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes).

## Inhoudsopgave

- [Model Selectiestrategie](#model-selection-strategy)
- [AZD Configuratie voor AI Modellen](#azd-configuration-for-ai-models)
- [Implementatiepatronen](#deployment-patterns)
- [Modelbeheer](#model-management)
- [Productie Overwegingen](#production-considerations)
- [Monitoring en Observeerbaarheid](#monitoring-and-observability)

## Model Selectiestrategie

### Azure OpenAI Modellen in Microsoft Foundry

Kies het juiste model voor je gebruikssituatie:

Verklaar modelimplementaties in Bicep (hieronder), niet in willekeurige `services.*.config.AZURE_OPENAI_MODELS` instellingen. AZD interpreteert zo'n instelling niet als een lijst van modelbronnen. De `project` van een service verwijst naar de applicatiebron, niet naar de `infra/` directory.

De voorbeelden gebruiken de gepubliceerde `gpt-4.1-mini` versie **`2025-04-14`** en embed-versie **`1`**. Bevestig dat de modelversie en implementatie-SKU worden ondersteund in je doellocatie/account voordat je deze provisioneert.

### Model Capaciteitsplanning

| Modeltype | Gebruikssituatie | Illustratieve Token-vraag | Kostenaandachtspunten |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | Chat, V&A | 10.000-50.000 TPM | Benchmark kosten en kwaliteit voor je workload |
| gpt-4.1 | Complexe taken | 20.000-100.000 TPM | Evalueer kwaliteitswinst ten opzichte van tokencost |
| text-embedding-3-large | Zoeken, RAG | 30.000-120.000 TPM | Houd rekening met ingestie en queryverkeer |
| Whisper | Spraak-naar-tekst | Plan met audioduurtijd en aanvraaglimieten | Pas geen text-model TPM capaciteit formule toe |

TPM betekent tokens per minuut. Voor deze standaard tekstimplementaties is ARM `sku.capacity` in **1.000-TPM eenheden**, niet individuele TPM (capaciteit `10` betekent 10.000 TPM). RPM-tot-TPM verhoudingen variëren per model/implementatietype; verifieer beide limieten aan de hand van de [quotadocumentatie](https://learn.microsoft.com/azure/ai-foundry/openai/quotas-limits?view=foundry-classic). Deze bereiken dienen als voorbeelden, geen maatwerkaanbevelingen.

## AZD Configuratie voor AI Modellen

### Bicep Sjabloon Configuratie

Maak modelimplementaties via Bicep-sjablonen:

```bicep
// infra/main.bicep
param openAiAccountName string
param location string = resourceGroup().location

@description('OpenAI model deployments')
param openAiModelDeployments array = [
  {
    name: 'gpt-4.1-mini'
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
    }
    sku: {
      name: 'Standard'
      capacity: 10
    }
  }
  {
    name: 'text-embedding-3-large'
    model: {
      format: 'OpenAI'
      name: 'text-embedding-3-large'
      version: '1'
    }
    sku: {
      name: 'Standard'
      capacity: 30
    }
  }
]

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: openAiAccountName
  location: location
  kind: 'OpenAI'
  properties: {
    customSubDomainName: openAiAccountName
    disableLocalAuth: true
    networkAcls: {
      defaultAction: 'Allow'
    }
    publicNetworkAccess: 'Enabled'
  }
  sku: {
    name: 'S0'
  }
}

@batchSize(1)
resource deployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = [for deployment in openAiModelDeployments: {
  parent: openAi
  name: deployment.name
  properties: {
    model: deployment.model
  }
  sku: deployment.sku
}]
```

Dit is een resourcegroep-gescopeerd **ontwikkelingsinfrastructuurvoorbeeld**, geen volledig AZD-applicatiesjabloon. Het account staat openbaar netwerktoegang toe en vereist Entra ID/RBAC authenticatie (`Cognitive Services OpenAI User` voor aanroepers). Productie vereist het private endpoint, DNS en applicatieconnectiviteit beschreven in Hoofdstuk 8. AZD heeft ook een hoofdtemplate/parameter-mapping en applicatie-hostresources nodig; gebruik een werkend voorbeeld voor een volledige implementatie.

### Omgevingsvariabelen

Configureer je applicatieomgeving:

```bash
# .env configuration
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

Dit zijn applicatie-gedefinieerde namen; verbind ze met je hostconfiguratie. De Azure OpenAI v1 endpoint gebruikt door de onderstaande gezondheidscontrole vereist niet de verouderde `api-version` queryparameter; oudere `AzureOpenAI` clients wel, dus volg de door je applicatie gebruikte API-generatie.

## Implementatiepatronen

### Patroon 1: Single-Region Implementatie

```yaml
# azure.yaml - Single region
services:
  ai-app:
    project: ./src
    host: containerapp
    env:
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
      AZURE_OPENAI_CHAT_DEPLOYMENT: gpt-4.1-mini
```

Het beste voor:
- Ontwikkeling en testen
- Single-market applicaties
- Kostenoptimalisatie

### Patroon 2: Multi-Region Implementatie

```bicep
// Illustrative fragment: extend the complete account declaration above.
// Each region must support the selected model/SKU and have quota.
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

De weggelaten accounteigenschappen/SKU moeten worden aangeleverd; dit fragment is niet zoals geschreven implementeerbaar. Implementeer modellen in elk account en implementeer routing/failover en dataresidentiebeheer afzonderlijk.

Het beste voor:
- Globale applicaties
- Hoge beschikbaarheidseisen
- Verdeling van belastingen

### Patroon 3: Hybride Implementatie

Combineer Microsoft Foundry Modellen met andere AI-services:

De volgende fragmenten veronderstellen dat namen en `location` worden geleverd door de omringende template.

```bicep
// Hybrid AI services
resource cognitiveServices 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: cognitiveServicesName
  location: location
  kind: 'CognitiveServices'
  properties: {
    customSubDomainName: cognitiveServicesName
  }
  sku: {
    name: 'S0'
  }
}

resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: documentIntelligenceName
  location: location
  kind: 'FormRecognizer'
  properties: {
    customSubDomainName: documentIntelligenceName
  }
  sku: {
    name: 'S0'
  }
}
```

## Modelbeheer

### Versiebeheer

Volg modelversies in de configuratie van je applicatie of IaC. Deze JSON is een **applicatie-gedefinieerd voorbeeld**, geen ingebouwd AZD-modelschema; een fallback moet expliciet worden geïmplementeerd en uitgerold:

```json
{
  "models": {
    "chat": {
      "name": "gpt-4.1-mini",
      "version": "2025-04-14",
      "fallback": "gpt-4.1"
    },
    "embedding": {
      "name": "text-embedding-3-large",
      "version": "1"
    }
  }
}
```

### Modelupdates

Gebruik een AZD-hook voor een alleen-lezen beschikbaarheidscontrole, werk vervolgens IaC bij en provisioneer het:

```bash
#!/bin/bash
# Illustrative hooks/check-model.sh (requires Azure CLI login and these variables)

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name "$AZURE_OPENAI_ACCOUNT_NAME" \
  --resource-group "$AZURE_RESOURCE_GROUP" \
  --query "[?name=='gpt-4.1-mini']"

```

Voer `azd up` **buiten** de hook uit om gewijzigde modelinfrastructuur toe te passen en code te implementeren. Nooit `azd deploy` aanroepen vanuit een `predeploy` hook: dit veroorzaakt recursieve activering van dezelfde hook. `azd deploy --timeout 1800` verlengt een applicatie-implementatietimeout; het werkt geen Bicep-resources bij.

### A/B Testing

De illustratieve resource hieronder selecteert een implementatienaam en capaciteit; het creëert **één** implementatie, geen A/B test. Voor een echt experiment, provisioneer twee afzonderlijke implementatieresources, routeer een gecontroleerd deel van de aanvragen naar elk, en vergelijk kwaliteit, latentie en kosten. Het gaat uit van `openAi` uit het accountvoorbeeld:

```bicep
param enableABTesting bool = false

resource chatDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4.1-mini-${enableABTesting ? 'v1' : 'prod'}'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: enableABTesting ? 5 : 10
  }
}
```

## Productie Overwegingen

### Capaciteitsplanning

Bereken de benodigde capaciteit op basis van gebruikspatronen:

```python
# Capacity calculation example
import math
def calculate_required_capacity(
    requests_per_minute: int,
    avg_prompt_tokens: int,
    avg_completion_tokens: int,
    safety_margin: float = 0.2
) -> int:
    """Calculate required TPM capacity."""
    total_tokens_per_request = avg_prompt_tokens + avg_completion_tokens
    total_tpm = requests_per_minute * total_tokens_per_request
    return math.ceil(total_tpm * (1 + safety_margin))

# Example usage
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

Verwachte output: `Required capacity: 9100 TPM`. Met 1.000-TPM capaciteitsunits, rond je af naar minstens `10`, controleer daarna model-specifieke RPM en service rate-limit schatting (inclusief gevraagde outputbudget). Deze schatting van tokenvraag is geen garantie tegen throttling.

### Auto-scaling Configuratie

Configureer auto-scaling voor Container Apps:

**Gedeeltelijke resource:** voeg de `template.scale` instellingen samen in een complete Container App met locatie, beheerde omgeving, container image, bronnen en ingress. Schalen van replica’s verhoogt de modelquota niet.

```bicep
resource containerApp 'Microsoft.App/containerApps@2024-03-01' = {
  name: containerAppName
  properties: {
    template: {
      scale: {
        minReplicas: 1
        maxReplicas: 10
        rules: [
          {
            name: 'http-rule'
            http: {
              metadata: {
                concurrentRequests: '10'
              }
            }
          }
          {
            name: 'cpu-rule'
            custom: {
              type: 'cpu'
              metadata: {
                type: 'Utilization'
                value: '70'
              }
            }
          }
        ]
      }
    }
  }
}
```

### Kostenoptimalisatie

Implementeer kostenbeheersing:

**Illustratieve budget-resource:** definieer `budgetStartDate` als de eerste dag van de huidige maand in UTC (bijvoorbeeld `2026-11-01T00:00:00Z` voor deze review), en vervang het contactadres. De start moet voldoen aan de huidige datumvereisten van de service. Budgetten waarschuwen bij vertragingsfacturatie; ze stoppen het uitgeven niet.

```bicep
param budgetStartDate string

@description('Enable cost management alerts')
param enableCostAlerts bool = true

resource budgetAlert 'Microsoft.Consumption/budgets@2024-08-01' = if (enableCostAlerts) {
  name: 'ai-budget-alert'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
    }
    timeGrain: 'Monthly'
    amount: 1000
    category: 'Cost'
    notifications: {
      Actual_GreaterThan_80_Percent: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: [
          'admin@yourcompany.com'
        ]
      }
    }
  }
}
```

## Monitoring en Observeerbaarheid

### Application Insights Integratie

Configureer monitoring voor AI workloads:

```bicep
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
  }
}

```

Het resourcefragment veronderstelt `applicationInsightsName`, `location`, en een bestaand `logAnalyticsWorkspace`. Het voorziet in monitoring, maar instrumenteert de app niet en creëert geen aangepaste statistieken.

### Aangepaste Statistieken

Volg AI-specifieke statistieken:

Gebruik de ondersteunde [Azure Monitor OpenTelemetry distribution](https://learn.microsoft.com/azure/azure-monitor/app/opentelemetry-enable?tabs=python), niet de legacy `applicationinsights` Python SDK. Installeer `azure-monitor-opentelemetry`, configureer `APPLICATIONINSIGHTS_CONNECTION_STRING`, en initialiseer eenmaal bij opstarten:

```python
from azure.monitor.opentelemetry import configure_azure_monitor
from opentelemetry import trace

configure_azure_monitor()
tracer = trace.get_tracer(__name__)

def record_request(model: str, tokens: int, latency_ms: int, success: bool):
    with tracer.start_as_current_span("AI_Model_Request") as span:
        span.set_attribute("ai.model", model)
        span.set_attribute("ai.tokens", tokens)
        span.set_attribute("ai.latency_ms", latency_ms)
        span.set_attribute("ai.success", success)
```

Dit illustreert het uitzenden van attributen, geen daadwerkelijke model-call instrumentatie. Wikkel het echte verzoek in een span om de duur ervan te meten; inspecteer `dependencies`/`traces` in Application Insights. Verstuur geen prompt- of antwoorddata, sleutels, of ruwe exceptieberichten met gevoelige informatie.

### Gezondheidscontroles

Implementeer AI service gezondheidsmonitoring:

Installeer `fastapi`, `uvicorn`, `httpx`, en `azure-identity`. Stel de endpoint-/implementatievariabelen hierboven in en verleen de aanroeper `Cognitive Services OpenAI User`. Deze **readiness probe** gebruikt Azure OpenAI v1 data plane met Entra ID; het doet een factureerbare modelcall. Voer uit met `uvicorn health:app` na opslaan als `health.py`. Gebruik een aparte lichte liveness check, rate-limit/cache de readiness resultaten, en publiceer deze route niet zonder toegangscontrole.

```python
# health.py
import os
from fastapi import FastAPI, HTTPException
import httpx
from azure.identity.aio import DefaultAzureCredential

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        async with DefaultAzureCredential() as credential:
            token = await credential.get_token("https://ai.azure.com/.default")
        endpoint = os.environ["AZURE_OPENAI_ENDPOINT"].rstrip("/")
        async with httpx.AsyncClient(timeout=20.0) as client:
            response = await client.post(
                f"{endpoint}/openai/v1/chat/completions",
                headers={"Authorization": f"Bearer {token.token}"},
                json={
                    "model": os.environ["AZURE_OPENAI_CHAT_DEPLOYMENT"],
                    "messages": [{"role": "user", "content": "Reply OK."}],
                    "max_completion_tokens": 8,
                },
            )
        response.raise_for_status()
        return {"status": "healthy"}
    except Exception:
        # Record sanitized internal diagnostics, not service responses/tokens.
        raise HTTPException(status_code=503, detail="AI readiness check failed") from None
```

Verwacht: `GET /health/ai-models` retourneert `200 {"status":"healthy"}` wanneer de geconfigureerde chatimplementatie bruikbaar is, of `503` zonder upstreamdetails prijs te geven. Het opnoemen van implementaties is een management-plane operatie en geen geldige data-plane gezondheidsprobe.

## Volgende Stappen

1. **Bekijk de [Microsoft Foundry Integratiehandleiding](microsoft-foundry-integration.md)** voor service-integratiepatronen
2. **Voltooi de [AI Workshop Lab](ai-workshop-lab.md)** voor praktijkervaring
3. **Implementeer [Productie AI Praktijken](../chapter-08-production/production-ai-practices.md)** voor enterprise implementaties
4. **Verken de [AI Probleemoplossingsgids](../chapter-07-troubleshooting/ai-troubleshooting.md)** voor veelvoorkomende problemen

## Bronnen

- [Microsoft Foundry Modellen Modelbeschikbaarheid](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI Documentatie](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps Schaling](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI Model Kostenoptimalisatie](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Hoofdstuk Navigatie:**
- **📚 Cursus Home**: [AZD Voor Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 2 - AI-First Ontwikkeling
- **⬅️ Vorige**: [AI Agents](agents.md)
- **➡️ Volgende**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Volgend Hoofdstuk**: [Hoofdstuk 3: Configuratie](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->