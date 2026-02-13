# Pag-deploy ng AI Model gamit ang Azure Developer CLI

**Pag-navigate sa Kabanata:**
- **📚 Pangunahing Pahina ng Kurso**: [AZD Para sa Mga Nagsisimula](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 2 - AI-First Development
- **⬅️ Nakaraan**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ Sunod**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Susunod na Kabanata**: [Kabanata 3: Konfigurasyon](../chapter-03-configuration/configuration.md)

Ang gabay na ito ay nagbibigay ng komprehensibong mga tagubilin para sa pag-deploy ng mga AI model gamit ang mga AZD template, na sumasaklaw mula sa pagpili ng modelo hanggang sa mga pattern ng produksyon.

## Talaan ng Nilalaman

- [Estratehiya sa Pagpili ng Modelo](../../../../docs/chapter-02-ai-development)
- [Konfigurasyon ng AZD para sa mga AI Model](../../../../docs/chapter-02-ai-development)
- [Mga Pattern ng Pag-deploy](../../../../docs/chapter-02-ai-development)
- [Pamamahala ng Modelo](../../../../docs/chapter-02-ai-development)
- [Mga Dapat Isaalang-alang sa Produksyon](../../../../docs/chapter-02-ai-development)
- [Pagsubaybay at Obserbabilidad](../../../../docs/chapter-02-ai-development)

## Estratehiya sa Pagpili ng Modelo

### Mga Azure OpenAI na Modelo

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

### Pagpaplano ng Kapasidad ng Modelo

| Uri ng Modelo | Gamit | Inirekomendang Kapasidad | Mga Dapat Isaalang-alang sa Gastos |
|------------|----------|---------------------|-------------------|
| GPT-4o-mini | Chat, Q&A | 10-50 TPM | Makatipid para sa karamihan ng mga workload |
| GPT-4 | Kumplikadong pagrarason | 20-100 TPM | Mas mataas ang gastusin, gamitin para sa mga premium na tampok |
| Text-embedding-ada-002 | Paghahanap, RAG | 30-120 TPM | Mahalaga para sa semantic search |
| Whisper | Pag-convert ng pagsasalita sa text | 10-50 TPM | Mga workload ng pagproseso ng audio |

## Konfigurasyon ng AZD para sa mga AI Model

### Pagkonfigura ng Bicep Template

Lumikha ng mga deployment ng modelo gamit ang Bicep templates:

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

### Mga Variable ng Kapaligiran

Ikonfigura ang iyong kapaligiran ng aplikasyon:

```bash
# konfigurasyon ng .env
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4o-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## Mga Pattern ng Pag-deploy

### Pattern 1: Pag-deploy sa Isang Rehiyon

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

Pinakamainam para sa:
- Pag-unlad at pagsubok
- Mga aplikasyon para sa iisang merkado
- Pag-optimize ng gastos

### Pattern 2: Pag-deploy sa Maramihang Rehiyon

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
- Pandaigdigang aplikasyon
- Mataas na pangangailangan sa availability
- Pamamahagi ng karga

### Pattern 3: Hybrid na Pag-deploy

Pagsamahin ang Azure OpenAI sa iba pang mga serbisyo ng AI:

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

### Kontrol ng Bersyon

Subaybayan ang mga bersyon ng modelo sa iyong konfigurasyon ng AZD:

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

### Mga Pag-update ng Modelo

Gamitin ang AZD hooks para sa mga pag-update ng modelo:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4o-mini']"
```

### A/B Testing

I-deploy ang maramihang bersyon ng modelo:

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

## Mga Dapat Isaalang-alang sa Produksyon

### Pagpaplano ng Kapasidad

Kalkulahin ang kinakailangang kapasidad batay sa mga pattern ng paggamit:

```python
# Halimbawa ng pagkalkula ng kapasidad
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

### Konfigurasyon ng Auto-scaling

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

### Pasadyang Metrics

Subaybayan ang mga metric na partikular sa AI:

```python
# Pasadyang telemetriya para sa mga modelong AI
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

### Pagsusuri ng Kalusugan

Magpatupad ng pagsubaybay sa kalusugan ng serbisyo ng AI:

```python
# Mga endpoint ng health check
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

1. **Balikan ang [Gabay sa Integrasyon ng Microsoft Foundry](microsoft-foundry-integration.md)** para sa mga pattern ng integrasyon ng serbisyo
2. **Kumpletuhin ang [AI Workshop Lab](ai-workshop-lab.md)** para sa praktikal na karanasan
3. **Ipatupad ang [Mga Praktis ng Produksyon ng AI](production-ai-practices.md)** para sa mga deployment sa enterprise
4. **Suriin ang [Gabay sa Pag-troubleshoot ng AI](../chapter-07-troubleshooting/ai-troubleshooting.md)** para sa mga karaniwang isyu

## Mga Mapagkukunan

- [Pagkakaroon ng Mga Modelo ng Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Dokumentasyon ng Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Pag-scale ng Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Pag-optimize ng Gastos ng AI Model](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Pag-navigate sa Kabanata:**
- **📚 Pangunahing Pahina ng Kurso**: [AZD Para sa Mga Nagsisimula](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 2 - AI-First Development
- **⬅️ Nakaraan**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ Sunod**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Susunod na Kabanata**: [Kabanata 3: Konfigurasyon](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Paunawa:
Isinalin ang dokumentong ito gamit ang serbisyong AI na pagsasalin na Co-op Translator (https://github.com/Azure/co-op-translator). Bagaman sinisikap namin ang katumpakan, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi tumpak na impormasyon. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pinakapinagkakatiwalaang sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasaling-tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na maaaring magmula sa paggamit ng salin na ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->