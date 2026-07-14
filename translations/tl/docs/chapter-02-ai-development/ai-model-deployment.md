# Pag-deploy ng AI Model gamit ang Azure Developer CLI

**Pag-navigate sa Kabanata:**
- **📚 Tahanan ng Kurso**: [AZD Para sa mga Nagsisimula](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 2 - AI-First Development
- **⬅️ Nakaraan**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ Susunod**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Susunod na Kabanata**: [Kabanata 3: Pag-configure](../chapter-03-configuration/configuration.md)

Nagbibigay ang gabay na ito ng komprehensibong mga tagubilin para sa pag-deploy ng mga AI model gamit ang mga AZD template, mula sa pagpili ng modelo hanggang sa mga pattern ng pag-deploy sa produksyon.

> **Tala sa Pagpapatunay (2026-07-13):** Ang AZD workflow sa gabay na ito ay sinuri laban sa `azd` `1.27.1`. Para sa mga AI deployment na tumatagal higit sa default na service deployment window, sinusuportahan ng kasalukuyang mga release ng AZD ang `azd deploy --timeout <seconds>`.

## Talaan ng Nilalaman

- [Strategiya sa Pagpili ng Modelo](#strategiya-sa-pagpili-ng-modelo)
- [Pag-configure ng AZD para sa mga AI Model](#pag-configure-ng-azd-para-sa-mga-ai-model)
- [Mga Pattern sa Pag-deploy](#mga-pattern-sa-pag-deploy)
- [Pamamahala ng Modelo](#pamamahala-ng-modelo)
- [Mga Pagsasaalang-alang sa Produksyon](#mga-pagsasaalang-alang-sa-produksyon)
- [Pagsubaybay at Obserbabilidad](#pagsubaybay-at-obserbabilidad)

## Strategiya sa Pagpili ng Modelo

### Mga Modelo ng Microsoft Foundry Models

Piliin ang tamang modelo para sa iyong kaso ng paggamit:

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

### Pagpaplano ng Kapasidad ng Modelo

| Uri ng Modelo | Kaso ng Paggamit | Inirerekomendang Kapasidad | Mga Pagsasaalang-alang sa Gastos |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | Chat, Q&A | 10-50 TPM | Makatipid para sa karamihan ng gawain |
| gpt-4.1 | Kumplikadong pangangatwiran | 20-100 TPM | Mas mataas na gastos, gamitin para sa mga premium na tampok |
| text-embedding-3-large | Paghahanap, RAG | 30-120 TPM | Malakas na default na pagpipilian para sa semantic na paghahanap at retrieval |
| Whisper | Pagsasalita-sa-teksto | 10-50 TPM | Mga gawain sa pagproseso ng audio |

## Pag-configure ng AZD para sa mga AI Model

### Pag-configure ng Bicep Template

Gumawa ng mga deployment ng modelo sa pamamagitan ng Bicep templates:

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

### Mga Variable ng Kapaligiran

I-configure ang iyong application environment:

```bash
# pagsasaayos ng .env
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

## Mga Pattern sa Pag-deploy

### Pattern 1: Deployment sa Isang Rehiyon

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

Pinakamainam para sa:
- Pag-develop at testing
- Mga aplikasyon sa iisang pamilihan
- Pag-optimize ng gastos

### Pattern 2: Deployment sa Maramihang Rehiyon

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

Pinakamainam para sa:
- Mga pandaigdigang aplikasyon
- Mataas na pangangailangan sa availability
- Pamamahagi ng load

### Pattern 3: Hybrid na Deployment

Pagsamahin ang Microsoft Foundry Models sa iba pang AI services:

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

## Pamamahala ng Modelo

### Kontrol sa Bersyon

Subaybayan ang mga bersyon ng modelo sa iyong AZD configuration:

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

### Mga Update sa Modelo

Gamitin ang AZD hooks para sa mga update ng modelo:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"

# Kung ang deployment ay tumagal nang mas mahaba kaysa sa default na timeout
azd deploy --timeout 1800
```

### Pagsubok ng A/B

Mag-deploy ng maramihang bersyon ng modelo:

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

## Mga Pagsasaalang-alang sa Produksyon

### Pagpaplano ng Kapasidad

Kalkulahin ang kinakailangang kapasidad base sa mga pattern ng paggamit:

```python
# Halimbawa ng kalkulasyon ng kapasidad
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

# Halimbawa ng paggamit
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### Pag-configure ng Auto-scaling

I-configure ang auto-scaling para sa Container Apps:

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

### Pag-optimize ng Gastos

Magpatupad ng mga kontrol sa gastos:

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

## Pagsubaybay at Obserbabilidad

### Integrasyon ng Application Insights

I-configure ang pagsubaybay para sa mga AI workload:

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

### Mga Custom na Metrics

Subaybayan ang mga AI-specific metrics:

```python
# Pasadyang telemetry para sa mga modelo ng AI
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

### Health Checks

Magpatupad ng pagsubaybay sa kalusugan ng AI service:

```python
# Mga endpoint para sa tseke ng kalusugan
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # Subukan ang koneksyon sa OpenAI
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

## Mga Susunod na Hakbang

1. **Suriin ang [Microsoft Foundry Integration Guide](microsoft-foundry-integration.md)** para sa mga pattern ng pag-integrate ng serbisyo
2. **Kumpletuhin ang [AI Workshop Lab](ai-workshop-lab.md)** para sa praktikal na karanasan
3. **Ipagpatupad ang [Mga Praktis sa Produksyon ng AI](production-ai-practices.md)** para sa mga enterprise deployment
4. **Siyasatin ang [AI Troubleshooting Guide](../chapter-07-troubleshooting/ai-troubleshooting.md)** para sa mga karaniwang isyu

## Mga Sanggunian

- [Microsoft Foundry Models Model Availability](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Dokumentasyon ng Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Pag-scale ng Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Pag-optimize ng Gastos para sa AI Model](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Pag-navigate sa Kabanata:**
- **📚 Tahanan ng Kurso**: [AZD Para sa mga Nagsisimula](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 2 - AI-First Development
- **⬅️ Nakaraan**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ Susunod**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Susunod na Kabanata**: [Kabanata 3: Pag-configure](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->