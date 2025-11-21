<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "2432e08775264e481d86a2e0e512a347",
  "translation_date": "2025-11-21T19:26:13+00:00",
  "source_file": "docs/microsoft-foundry/ai-model-deployment.md",
  "language_code": "no"
}
-->
# Distribusjon av AI-modeller med Azure Developer CLI

**Kapittelnavigasjon:**
- **📚 Kursoversikt**: [AZD For Nybegynnere](../../README.md)
- **📖 Nåværende Kapittel**: Kapittel 2 - AI-First Utvikling
- **⬅️ Forrige**: [Microsoft Foundry Integrasjon](microsoft-foundry-integration.md)
- **➡️ Neste**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Neste Kapittel**: [Kapittel 3: Konfigurasjon](../getting-started/configuration.md)

Denne veiledningen gir omfattende instruksjoner for distribusjon av AI-modeller ved bruk av AZD-maler, og dekker alt fra modellvalg til produksjonsmønstre.

## Innholdsfortegnelse

- [Strategi for Modellvalg](../../../../docs/microsoft-foundry)
- [AZD-konfigurasjon for AI-modeller](../../../../docs/microsoft-foundry)
- [Distribusjonsmønstre](../../../../docs/microsoft-foundry)
- [Modelladministrasjon](../../../../docs/microsoft-foundry)
- [Produksjonsbetraktninger](../../../../docs/microsoft-foundry)
- [Overvåking og Observasjon](../../../../docs/microsoft-foundry)

## Strategi for Modellvalg

### Azure OpenAI-modeller

Velg riktig modell for ditt bruksområde:

```yaml
# azure.yaml - Model configuration
services:
  ai-service:
    project: ./infra
    host: containerapp
    config:
      AZURE_OPENAI_MODELS: |
        [
          {
            "name": "gpt-4o-mini",
            "version": "2024-07-18",
            "deployment": "gpt-4o-mini",
            "capacity": 10,
            "format": "OpenAI"
          },
          {
            "name": "text-embedding-ada-002",
            "version": "2",
            "deployment": "text-embedding-ada-002", 
            "capacity": 30,
            "format": "OpenAI"
          }
        ]
```

### Kapasitetsplanlegging for Modeller

| Modelltype | Bruksområde | Anbefalt kapasitet | Kostnadshensyn |
|------------|-------------|---------------------|----------------|
| GPT-4o-mini | Chat, Q&A | 10-50 TPM | Kostnadseffektiv for de fleste arbeidsmengder |
| GPT-4 | Kompleks resonnering | 20-100 TPM | Høyere kostnad, bruk for premiumfunksjoner |
| Text-embedding-ada-002 | Søk, RAG | 30-120 TPM | Essensiell for semantisk søk |
| Whisper | Tale-til-tekst | 10-50 TPM | Arbeidsmengder for lydbehandling |

## AZD-konfigurasjon for AI-modeller

### Bicep-mal Konfigurasjon

Opprett modelldistribusjoner gjennom Bicep-maler:

```bicep
// infra/main.bicep
@description('OpenAI model deployments')
param openAiModelDeployments array = [
  {
    name: 'gpt-4o-mini'
    model: {
      format: 'OpenAI'
      name: 'gpt-4o-mini'
      version: '2024-07-18'
    }
    sku: {
      name: 'Standard'
      capacity: 10
    }
  }
  {
    name: 'text-embedding-ada-002'
    model: {
      format: 'OpenAI'
      name: 'text-embedding-ada-002'
      version: '2'
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

### Miljøvariabler

Konfigurer applikasjonsmiljøet ditt:

```bash
# .env-konfigurasjon
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4o-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## Distribusjonsmønstre

### Mønster 1: Enkelt-region Distribusjon

```yaml
# azure.yaml - Single region
services:
  ai-app:
    project: ./src
    host: containerapp
    config:
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
      AZURE_OPENAI_CHAT_DEPLOYMENT: gpt-4o-mini
```

Best egnet for:
- Utvikling og testing
- Applikasjoner for ett marked
- Kostnadsoptimalisering

### Mønster 2: Multi-region Distribusjon

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

Best egnet for:
- Globale applikasjoner
- Krav til høy tilgjengelighet
- Lastfordeling

### Mønster 3: Hybrid Distribusjon

Kombiner Azure OpenAI med andre AI-tjenester:

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

## Modelladministrasjon

### Versjonskontroll

Spor modellversjoner i din AZD-konfigurasjon:

```json
{
  "models": {
    "chat": {
      "name": "gpt-4o-mini",
      "version": "2024-07-18",
      "fallback": "gpt-35-turbo"
    },
    "embedding": {
      "name": "text-embedding-ada-002",
      "version": "2"
    }
  }
}
```

### Modelloppdateringer

Bruk AZD-hooks for modelloppdateringer:

```bash
#!/bin/bash
# kroker/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4o-mini']"
```

### A/B-testing

Distribuer flere modellversjoner:

```bicep
param enableABTesting bool = false

resource chatDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4o-mini-${enableABTesting ? 'v1' : 'prod'}'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4o-mini'
      version: '2024-07-18'
    }
  }
  sku: {
    name: 'Standard'
    capacity: enableABTesting ? 5 : 10
  }
}
```

## Produksjonsbetraktninger

### Kapasitetsplanlegging

Beregn nødvendig kapasitet basert på bruksområder:

```python
# Kapasitetsberegningseksempel
def calculate_required_capacity(
    requests_per_minute: int,
    avg_prompt_tokens: int,
    avg_completion_tokens: int,
    safety_margin: float = 0.2
) -> int:
    """Calculate required TPM capacity."""
    total_tokens_per_request = avg_prompt_tokens + avg_completion_tokens
    total_tpm = requests_per_minute * total_tokens_per_request
    return int(total_tpm * (1 + safety_margin))

# Eksempel på bruk
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### Auto-skalering Konfigurasjon

Konfigurer auto-skalering for Container Apps:

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

### Kostnadsoptimalisering

Implementer kostnadskontroller:

```bicep
@description('Enable cost management alerts')
param enableCostAlerts bool = true

resource budgetAlert 'Microsoft.Consumption/budgets@2023-05-01' = if (enableCostAlerts) {
  name: 'ai-budget-alert'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2024-12-31'
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

## Overvåking og Observasjon

### Integrasjon med Application Insights

Konfigurer overvåking for AI-arbeidsmengder:

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

// Custom metrics for AI models
resource aiMetrics 'Microsoft.Insights/components/analyticsItems@2020-02-02' = {
  parent: applicationInsights
  name: 'ai-model-metrics'
  properties: {
    content: '''
      customEvents
      | where name == "AI_Model_Request"
      | extend model = tostring(customDimensions.model)
      | extend tokens = toint(customDimensions.tokens)
      | extend latency = toint(customDimensions.latency_ms)
      | summarize 
          requests = count(),
          avg_tokens = avg(tokens),
          avg_latency = avg(latency)
        by model, bin(timestamp, 5m)
    '''
    type: 'query'
    scope: 'shared'
  }
}
```

### Tilpassede Metrikker

Spor AI-spesifikke metrikker:

```python
# Tilpasset telemetri for AI-modeller
import logging
from applicationinsights import TelemetryClient

class AITelemetry:
    def __init__(self, instrumentation_key: str):
        self.client = TelemetryClient(instrumentation_key)
    
    def track_model_request(self, model: str, tokens: int, latency_ms: int, success: bool):
        """Track AI model request metrics."""
        self.client.track_event(
            'AI_Model_Request',
            {
                'model': model,
                'tokens': str(tokens),
                'latency_ms': str(latency_ms),
                'success': str(success)
            }
        )
        
    def track_model_error(self, model: str, error_type: str, error_message: str):
        """Track AI model errors."""
        self.client.track_exception(
            type=error_type,
            value=error_message,
            properties={
                'model': model,
                'component': 'ai_model'
            }
        )
```

### Helsesjekker

Implementer helsesjekk for AI-tjenester:

```python
# Helsekontrollendepunkter
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # Test OpenAI-tilkobling
        async with httpx.AsyncClient() as client:
            response = await client.get(
                f"{AZURE_OPENAI_ENDPOINT}/openai/deployments",
                headers={"api-key": AZURE_OPENAI_API_KEY}
            )
            
        if response.status_code == 200:
            return {"status": "healthy", "models": response.json()}
        else:
            raise HTTPException(status_code=503, detail="AI models unavailable")
            
    except Exception as e:
        raise HTTPException(status_code=503, detail=f"Health check failed: {str(e)}")
```

## Neste Steg

1. **Gå gjennom [Microsoft Foundry Integrasjonsveiledning](microsoft-foundry-integration.md)** for tjenesteintegrasjonsmønstre
2. **Fullfør [AI Workshop Lab](ai-workshop-lab.md)** for praktisk erfaring
3. **Implementer [Produksjons AI-praksis](production-ai-practices.md)** for bedriftsdistribusjoner
4. **Utforsk [AI Feilsøkingsveiledning](../troubleshooting/ai-troubleshooting.md)** for vanlige problemer

## Ressurser

- [Azure OpenAI Modelltilgjengelighet](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI Dokumentasjon](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps Skalering](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI Modell Kostnadsoptimalisering](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Kapittelnavigasjon:**
- **📚 Kursoversikt**: [AZD For Nybegynnere](../../README.md)
- **📖 Nåværende Kapittel**: Kapittel 2 - AI-First Utvikling
- **⬅️ Forrige**: [Microsoft Foundry Integrasjon](microsoft-foundry-integration.md)
- **➡️ Neste**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Neste Kapittel**: [Kapittel 3: Konfigurasjon](../getting-started/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi etterstreber nøyaktighet, vær oppmerksom på at automatiserte oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på dets opprinnelige språk bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->