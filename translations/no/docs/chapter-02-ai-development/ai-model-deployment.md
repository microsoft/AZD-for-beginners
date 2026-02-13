# Distribusjon av AI-modeller med Azure Developer CLI

**Kapittelnavigasjon:**
- **📚 Kursoversikt**: [AZD for nybegynnere](../../README.md)
- **📖 Nåværende kapittel**: Kapittel 2 - AI-først utvikling
- **⬅️ Forrige**: [Integrasjon med Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ Neste**: [AI Workshop-lab](ai-workshop-lab.md)
- **🚀 Neste kapittel**: [Kapittel 3: Konfigurasjon](../chapter-03-configuration/configuration.md)

Denne veiledningen gir omfattende instruksjoner for å distribuere AI-modeller ved hjelp av AZD-maler, og dekker alt fra modellvalg til produksjonsdistribusjonsmønstre.

## Innholdsfortegnelse

- [Strategi for modellvalg](../../../../docs/chapter-02-ai-development)
- [AZD-konfigurasjon for AI-modeller](../../../../docs/chapter-02-ai-development)
- [Distribusjonsmønstre](../../../../docs/chapter-02-ai-development)
- [Modellhåndtering](../../../../docs/chapter-02-ai-development)
- [Produksjonshensyn](../../../../docs/chapter-02-ai-development)
- [Overvåking og observabilitet](../../../../docs/chapter-02-ai-development)

## Strategi for modellvalg

### Azure OpenAI-modeller

Velg riktig modell for ditt brukstilfelle:

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

### Kapasitetsplanlegging for modeller

| Modelltype | Brukstilfelle | Anbefalt kapasitet | Kostnadsbetraktninger |
|------------|----------|---------------------|-------------------|
| GPT-4o-mini | Chat, spørsmål og svar | 10-50 TPM | Kostnadseffektivt for de fleste arbeidsmengder |
| GPT-4 | Komplekse resonnementer | 20-100 TPM | Høyere kostnad, bruk for premium-funksjoner |
| Text-embedding-ada-002 | Søk, RAG | 30-120 TPM | Nødvendig for semantisk søk |
| Whisper | Tale-til-tekst | 10-50 TPM | Arbeidsmengder for lydprosessering |

## AZD-konfigurasjon for AI-modeller

### Konfigurasjon av Bicep-mal

Opprett modellutrullinger gjennom Bicep-maler:

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

### Mønster 1: Distribusjon i én region

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

### Mønster 2: Distribusjon i flere regioner

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
- Belastningsfordeling

### Mønster 3: Hybrid distribusjon

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

## Modellhåndtering

### Versjonskontroll

Spor modellversjoner i AZD-konfigurasjonen din:

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
# hooks/predeploy.sh

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

## Produksjonshensyn

### Kapasitetsplanlegging

Beregn nødvendig kapasitet basert på bruksmønstre:

```python
# Eksempel på kapasitetsberegning
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

### Konfigurasjon av autoskalering

Konfigurer autoskalering for Container Apps:

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

## Overvåking og observabilitet

### Integrering med Application Insights

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

### Egendefinerte metrikker

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

### Helsjekker

Implementer helsesjekk for AI-tjenester:

```python
# Endepunkter for helsesjekk
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

## Neste steg

1. **Gå gjennom [Integrasjonsveiledningen for Microsoft Foundry](microsoft-foundry-integration.md)** for mønstre for tjenesteintegrasjon
2. **Fullfør [AI Workshop-lab](ai-workshop-lab.md)** for praktisk erfaring
3. **Implementer [Produksjonspraksis for AI](production-ai-practices.md)** for bedriftsutrullinger
4. **Utforsk [Feilsøkingsveiledningen for AI](../chapter-07-troubleshooting/ai-troubleshooting.md)** for vanlige problemer

## Ressurser

- [Tilgjengelighet for Azure OpenAI-modeller](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Dokumentasjon for Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Skalering av Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Kostnadsoptimalisering for AI-modeller](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Kapittelnavigasjon:**
- **📚 Kursoversikt**: [AZD for nybegynnere](../../README.md)
- **📖 Nåværende kapittel**: Kapittel 2 - AI-først utvikling
- **⬅️ Forrige**: [Integrasjon med Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ Neste**: [AI Workshop-lab](ai-workshop-lab.md)
- **🚀 Neste kapittel**: [Kapittel 3: Konfigurasjon](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vennligst vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på sitt opprinnelige språk bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->