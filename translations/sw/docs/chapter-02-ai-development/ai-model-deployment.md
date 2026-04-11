# Uwekaji wa Mifano ya AI kwa Azure Developer CLI

**Uvinjari wa Sura:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Waanzilishi](../../README.md)
- **📖 Sura ya Sasa**: Sura 2 - Maendeleo ya Kwanza ya AI
- **⬅️ Iliyopita**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ Inayofuata**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Sura Inayofuata**: [Sura 3: Configuration](../chapter-03-configuration/configuration.md)

Mwongozo huu unatoa maagizo kamili ya kuweka mifano ya AI kwa kutumia violezo vya AZD, ukifunika kila kitu kutoka uteuzi wa mfano hadi mifumo ya uenezaji kwa uzalishaji.

> **Kumbusho ya uthibitishaji (2026-03-25):** Muhtasari wa AZD katika mwongozo huu ulikipimwa dhidi ya `azd` `1.23.12`. Kwa uenezaji wa AI ambao unachukua zaidi ya dirisha la kawaida la uenezaji wa huduma, toleo za sasa za AZD zinaunga mkono `azd deploy --timeout <seconds>`.

## Yaliyomo

- [Mkakati wa Kuchagua Mfano](#mkakati-wa-kuchagua-mfano)
- [Mipangilio ya AZD kwa Mifano ya AI](#mipangilio-ya-azd-kwa-mifano-ya-ai)
- [Mifumo ya Uenezaji](#mifumo-ya-uenezaji)
- [Usimamizi wa Mfano](#usimamizi-wa-mfano)
- [Mambo ya Kuzingatia kwa Uzalishaji](#mambo-ya-kuzingatia-kwa-uzalishaji)
- [Ufuatiliaji na Uwezo wa Kuonekana](#ufuatiliaji-na-uwezo-wa-kuonekana)

## Mkakati wa Kuchagua Mfano

### Mifano ya Microsoft Foundry Mifano

Chagua mfano sahihi kwa matumizi yako:

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
            "name": "gpt-4.1-mini",
            "version": "2024-07-18",
            "deployment": "gpt-4.1-mini",
            "capacity": 10,
            "format": "OpenAI"
          },
          {
            "name": "text-embedding-3-large",
            "version": "1",
            "deployment": "text-embedding-3-large", 
            "capacity": 30,
            "format": "OpenAI"
          }
        ]
```

### Upangaji wa Uwezo wa Mfano

| Model Type | Use Case | Recommended Capacity | Cost Considerations |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | Maongezi, Maswali na Majibu | 10-50 TPM | Inatoa gharama nafuu kwa mzigo wa kazi mwingi |
| gpt-4.1 | Ufafanuzi mgumu | 20-100 TPM | Gharama ya juu, tumia kwa vipengele vya premium |
| text-embedding-3-large | Utafutaji, RAG | 30-120 TPM | Chaguo imara cha msingi kwa utafutaji wa maana na urejeshaji |
| Whisper | Hotuba hadi maandishi | 10-50 TPM | Mizigo ya kazi ya usindikaji wa sauti |

## Mipangilio ya AZD kwa Mifano ya AI

### Bicep Template Configuration

Create model deployments through Bicep templates:

```bicep
// infra/main.bicep
@description('OpenAI model deployments')
param openAiModelDeployments array = [
  {
    name: 'gpt-4.1-mini'
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2024-07-18'
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

### Vigezo vya Mazingira

Configure your application environment:

```bash
# usanidi wa .env
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

## Mifumo ya Uenezaji

### Mfano 1: Single-Region Deployment

```yaml
# azure.yaml - Single region
services:
  ai-app:
    project: ./src
    host: containerapp
    config:
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
      AZURE_OPENAI_CHAT_DEPLOYMENT: gpt-4.1-mini
```

Bora kwa:
- Uendelezaji na upimaji
- Programu za soko moja
- Uboreshaji wa gharama

### Mfano 2: Multi-Region Deployment

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

Bora kwa:
- Programu za kimataifa
- Mahitaji ya upatikanaji wa juu
- Ugawaji wa mzigo

### Mfano 3: Uenezaji Mchanganyiko

Changanya Mifano ya Microsoft Foundry na huduma nyingine za AI:

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

## Usimamizi wa Mfano

### Udhibiti wa Toleo

Track model versions in your AZD configuration:

```json
{
  "models": {
    "chat": {
      "name": "gpt-4.1-mini",
      "version": "2024-07-18",
      "fallback": "gpt-4.1"
    },
    "embedding": {
      "name": "text-embedding-3-large",
      "version": "1"
    }
  }
}
```

### Sasisho za Mfano

Use AZD hooks for model updates:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"

# Ikiwa utekelezaji (deployment) unachukua muda mrefu kuliko muda wa kusubiri wa chaguo-msingi
azd deploy --timeout 1800
```

### Upimaji wa A/B

Deploy multiple model versions:

```bicep
param enableABTesting bool = false

resource chatDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4.1-mini-${enableABTesting ? 'v1' : 'prod'}'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2024-07-18'
    }
  }
  sku: {
    name: 'Standard'
    capacity: enableABTesting ? 5 : 10
  }
}
```

## Mambo ya Kuzingatia kwa Uzalishaji

### Upangaji wa Uwezo

Calculate required capacity based on usage patterns:

```python
# Mfano wa uhesabuaji wa uwezo
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

# Mfano wa matumizi
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### Mipangilio ya Kujiongezea Kiotomatiki

Configure auto-scaling for Container Apps:

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

### Uboreshaji wa Gharama

Implement cost controls:

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

## Ufuatiliaji na Uwezo wa Kuonekana

### Uunganishaji wa Application Insights

Configure monitoring for AI workloads:

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

### Vipimo Maalum

Track AI-specific metrics:

```python
# Telemetri maalum kwa modeli za AI
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

### Ukaguzi wa Afya

Implement AI service health monitoring:

```python
# Vituo vya ukaguzi wa afya
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # Jaribu muunganisho wa OpenAI
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

## Hatua Zifuatazo

1. **Pitisha [Mwongozo wa Uunganishaji wa Microsoft Foundry](microsoft-foundry-integration.md)** kwa mifumo ya uunganishaji wa huduma
2. **Kamilisha [Maabara ya Warsha ya AI](ai-workshop-lab.md)** kwa uzoefu wa vitendo
3. **Tekeleza [Miongozo ya AI kwa Uzalishaji](production-ai-practices.md)** kwa uenezaji wa biashara
4. **Chunguza [Mwongozo wa Utatuzi wa AI](../chapter-07-troubleshooting/ai-troubleshooting.md)** kwa masuala ya kawaida

## Rasilimali

- [Microsoft Foundry Models Model Availability](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps Scaling](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI Model Cost Optimization](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Uvinjari wa Sura:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Waanzilishi](../../README.md)
- **📖 Sura ya Sasa**: Sura 2 - Maendeleo ya Kwanza ya AI
- **⬅️ Iliyopita**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ Inayofuata**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Sura Inayofuata**: [Sura 3: Configuration](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Hati hii imetafsiriwa kwa kutumia huduma ya utafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuhakikisha usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au kasoro. Nyaraka ya asili katika lugha yake ya asili inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, inapendekezwa kutumia tafsiri ya kitaalamu ya binadamu. Hatuwajibiki kwa kutoelewana au tafsiri potofu zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->