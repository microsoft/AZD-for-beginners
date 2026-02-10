# AI Model Deployment with Azure Developer CLI

**Hoofdstuknavigatie:**
- **📚 Course Home**: [AZD voor Beginners](../../README.md)
- **📖 Huidig hoofdstuk**: Hoofdstuk 2 - AI-first ontwikkeling
- **⬅️ Vorige**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ Volgende**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Volgend hoofdstuk**: [Hoofdstuk 3: Configuratie](../chapter-03-configuration/configuration.md)

Deze gids biedt uitgebreide instructies voor het implementeren van AI-modellen met AZD-sjablonen, en behandelt alles van modelselectie tot productiedeploymentscenario's.

## Inhoudsopgave

- [Strategie voor modelselectie](../../../../docs/chapter-02-ai-development)
- [AZD-configuratie voor AI-modellen](../../../../docs/chapter-02-ai-development)
- [Implementatiepatronen](../../../../docs/chapter-02-ai-development)
- [Modelbeheer](../../../../docs/chapter-02-ai-development)
- [Productieoverwegingen](../../../../docs/chapter-02-ai-development)
- [Monitoring en observeerbaarheid](../../../../docs/chapter-02-ai-development)

## Strategie voor modelselectie

### Azure OpenAI-modellen

Kies het juiste model voor uw gebruiksscenario:

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

### Capaciteitsplanning voor modellen

| Model Type | Gebruiksscenario | Aanbevolen capaciteit | Kostenoverwegingen |
|------------|------------------|----------------------|-------------------|
| GPT-4o-mini | Chat, Q&A | 10-50 TPM | Kostenefficiënt voor de meeste workloads |
| GPT-4 | Complexe redenering | 20-100 TPM | Hogere kosten, gebruik voor premiumfuncties |
| Text-embedding-ada-002 | Zoeken, RAG | 30-120 TPM | Essentieel voor semantische zoekopdrachten |
| Whisper | Spraak-naar-tekst | 10-50 TPM | Workloads voor audiaverwerking |

## AZD-configuratie voor AI-modellen

### Bicep-sjabloonconfiguratie

Maak modelimplementaties via Bicep-sjablonen:

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

### Omgevingsvariabelen

Configureer uw applicatieomgeving:

```bash
# Configuratie van .env
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4o-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## Implementatiepatronen

### Patroon 1: Implementatie in één regio

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

Geschikt voor:
- Ontwikkeling en testen
- Applicaties voor één markt
- Kostoptimalisatie

### Patroon 2: Implementatie in meerdere regio's

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

Geschikt voor:
- Wereldwijde applicaties
- Vereisten voor hoge beschikbaarheid
- Verdeling van belasting

### Patroon 3: Hybride implementatie

Combineer Azure OpenAI met andere AI-services:

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

Volg modelversies in uw AZD-configuratie:

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

### Modelupdates

Gebruik AZD-hooks voor modelupdates:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4o-mini']"
```

### A/B-testen

Implementeer meerdere modelversies:

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

## Productieoverwegingen

### Capaciteitsplanning

Bereken de vereiste capaciteit op basis van gebruikspatronen:

```python
# Voorbeeld van capaciteitsberekening
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

# Voorbeeld van gebruik
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### Auto-scalingconfiguratie

Configureer autoscaling voor Container Apps:

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

## Monitoring en observeerbaarheid

### Integratie met Application Insights

Configureer monitoring voor AI-workloads:

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

### Aangepaste metrics

Volg AI-specifieke metrics:

```python
# Aangepaste telemetrie voor AI-modellen
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

### Gezondheidscontroles

Implementeer gezondheidsmonitoring voor AI-services:

```python
# Healthcheck-eindpunten
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # OpenAI-verbinding testen
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

## Volgende stappen

1. **Bekijk de [Microsoft Foundry Integration Guide](microsoft-foundry-integration.md)** voor integratiepatronen van services
2. **Voltooi de [AI Workshop Lab](ai-workshop-lab.md)** voor praktijkervaring
3. **Implementeer [Productie AI-praktijken](production-ai-practices.md)** voor enterprise-implementaties
4. **Bekijk de [AI-foutopsporingsgids](../chapter-07-troubleshooting/ai-troubleshooting.md)** voor veelvoorkomende problemen

## Hulpbronnen

- [Beschikbaarheid van Azure OpenAI-modellen](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Documentatie Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Schaalbaarheid van Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Kostenoptimalisatie voor AI-modellen](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Hoofdstuknavigatie:**
- **📚 Course Home**: [AZD voor Beginners](../../README.md)
- **📖 Huidig hoofdstuk**: Hoofdstuk 2 - AI-first ontwikkeling
- **⬅️ Vorige**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ Volgende**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Volgend hoofdstuk**: [Hoofdstuk 3: Configuratie](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vrijwaring**:
Dit document is vertaald met behulp van de AI-vertalingsdienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het oorspronkelijke document in de oorspronkelijke taal moet als de gezaghebbende bron worden beschouwd. Voor kritieke informatie wordt een professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->