# AI ಮಾದರಿ ನಿಯೋಜನೆ Azure Developer CLI ಬಳಸಿ

**ಚಾಪ್ಟರ್ ನ್ಯಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಮನೆ**: [ಆರಂಭಿಕರಿಗೆ AZD](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 2 - ಎಐ-ಪ್ರಥಮ ಅಭಿವೃದ್ಧಿ
- **⬅️ ಹಿಂದಿನದು**: [Microsoft Foundry ಸಂಯೋಜನೆ](microsoft-foundry-integration.md)
- **➡️ ಮುಂದಿನದು**: [ಎಐ ವರ್ಕ್‌ಶಾಪ್ ಲ್ಯಾಬ್](ai-workshop-lab.md)
- **🚀 ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 3: ಸಂರಚನೆ](../chapter-03-configuration/configuration.md)

ಈ ಮಾರ್ಗದರ್ಶಿ AZD ಟೆಂಪ್ಲೇಟ್ಗಳನ್ನು ಬಳಸಿ ಎಐ ಮಾದರಿಗಳನ್ನು ನಿಯೋಜಿಸುವ ಕುರಿತು ಸಮಗ್ರ ಸೂಚನೆಗಳನ್ನು ಒದಗಿಸುತ್ತದೆ, ಮಾದರಿ ಆಯ್ಕೆ ಇಂದ ಉತ್ಪಾದನಾ ನಿಯೋಜನೆ ಮಾದರಿಗಳವರೆಗೆ ಎಲ್ಲವನ್ನೂ ಒಳಗೊಂಡಿದೆ.

## ವಿಷಯ ಸೂಚಿ

- [ಮಾದರಿ ಆಯ್ಕೆ ತಂತ್ರ](../../../../docs/chapter-02-ai-development)
- [AI ಮಾದರಿಗಳಿಗಾಗಿ AZD ಸಂರಚನೆ](../../../../docs/chapter-02-ai-development)
- [ನಿಯೋಜನೆ ಮಾದರಿಗಳು](../../../../docs/chapter-02-ai-development)
- [ಮಾದರಿ ನಿರ್ವಹಣೆ](../../../../docs/chapter-02-ai-development)
- [ಉತ್ಪಾದನಾ ಪರಿಗಣನೆಗಳು](../../../../docs/chapter-02-ai-development)
- [ಮೋನಿಟರಿಂಗ್ ಮತ್ತು ದೃಶ್ಯತೆ](../../../../docs/chapter-02-ai-development)

## ಮಾದರಿ ಆಯ್ಕೆ ತಂತ್ರ

### Azure OpenAI ಮಾದರಿಗಳು

ನಿಮ್ಮ ಬಳಕೆಯ ಪ್ರಕರಣಕ್ಕಾಗಿ ಸರಿಯಾದ ಮಾದರಿಯನ್ನು ಆಯ್ಕೆಮಾಡಿ:

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

### ಮಾದರಿ ಸಾಮರ್ಥ್ಯ ಯೋಜನೆ

| ಮಾದರಿ ಪ್ರಕಾರ | ಉಪಯೋಗದ ಪ್ರಕರಣ | ಶಿಫಾರಸು ಮಾಡಿದ ಸಾಮರ್ಥ್ಯ | ಖರ್ಚಿನ ಪರಿಗಣನೆಗಳು |
|------------|----------|---------------------|-------------------|
| GPT-4o-mini | ಚಾಟ್, ಪ್ರಶ್ನೆ ಮತ್ತು ಉತ್ತರ | 10-50 TPM | ಬಹುಮಟ್ಟಿನ ಕೆಲಸಭಾರಗಳಿಗೆ ವೆಚ್ಚ-ಕಾರ್ಯಕ್ಷಮ |
| GPT-4 | ಸಂಕೀರ್ಣ ತರ್ಕ | 20-100 TPM | ಹೆಚ್ಚಿನ ವೆಚ್ಚ, ಪ್ರೀಮಿಯಂ ವೈಶಿಷ್ಟ್ಯಗಳಿಗೆ ಬಳಸಿ |
| Text-embedding-ada-002 | ಹುಡುಕಾಟ, RAG | 30-120 TPM | ಅರ್ಥಾತ್ಮಕ ಹುಡುಕಾಟಕ್ಕೆ ಅಗತ್ಯ |
| Whisper | ಭಾಷಣದಿಂದ ಪಠ್ಯಕ್ಕೆ | 10-50 TPM | ಆಡಿಯೊ ಪ್ರಕ್ರಿಯೆ ಕೆಲಸಭಾರಗಳು |

## AI ಮಾದರಿಗಳಿಗಾಗಿ AZD ಸಂರಚನೆ

### Bicep ಟೆಂಪ್ಲೇಟು ಸಂರಚನೆ

Bicep ಟೆಂಪ್ಲೇಟ್ಗಳ ಮೂಲಕ ಮಾದರಿ ನಿಯೋಜನೆಗಳನ್ನು ರಚಿಸಿ:

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

### ಪರಿಸರ ಚರಗಳು

ನಿಮ್ಮ ಅಪ್ಲಿಕೇಷನ್ ಪರಿಸರವನ್ನು ಸಂರಚಿಸಿ:

```bash
# .env ಸಂರಚನೆ
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4o-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## ನಿಯೋಜನೆ ಮಾದರಿಗಳು

### ಮಾದರಿ 1: ಏಕ-ಪ್ರದೇಶ ನಿಯೋಜನೆ

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

ಉತ್ತಮವಾಗಿದೆ:
- ವಿಕಾಸ ಮತ್ತು ಪರೀಕ್ಷೆ
- ಏಕ-ಮಾರುಕಟ್ಟೆ ಅಪ್ಲಿಕೇಶನ್‌ಗಳು
- ವೆಚ್ಚ ಅನुकूलನೆ

### ಮಾದರಿ 2: ಬಹು-ಪ್ರದೇಶ ನಿಯೋಜನೆ

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

ಉತ್ತಮವಾಗಿದೆ:
- ವಿಶ್ವ ವ್ಯಾಪ್ತಿಯ ಅಪ್ಲಿಕೇಶನ್‌ಗಳು
- ಉನ್ನತ ಲಭ್ಯತೆ ಅಗತ್ಯಗಳು
- ಭಾರ ಹಂಚಿಕೆ

### ಮಾದರಿ 3: ಹೈಬ್ರಿಡ್ ನಿಯೋಜನೆ

Azure OpenAI ಅನ್ನು ಇತರ ಎಐ ಸೇವೆಗಳೊಡನೆ ಸಂಯೋಜಿಸಿ:

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

## ಮಾದರಿ ನಿರ್ವಹಣೆ

### ಆವೃತ್ತಿ ನಿಯಂತ್ರಣ

ನಿಮ್ಮ AZD ಸಂರಚನೆಯಲ್ಲಿ ಮಾದರಿ ಆವೃತ್ತಿಗಳನ್ನು ಟ್ರ್ಯಾಕ್ ಮಾಡಿ:

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

### ಮಾದರಿ ನವೀಕರಣಗಳು

ಮಾದರಿ ನವೀಕರಣಗಳಿಗೆ AZD ಹುಕ್ಸ್ ಅನ್ನು ಬಳಸಿ:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4o-mini']"
```

### A/B ಪರೀಕ್ಷೆ

ಬಹುಆವೃತ್ತಿ ಮಾದರಿಗಳನ್ನು ನಿಯೋಜಿಸಿ:

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

## ಉತ್ಪಾದನಾ ಪರಿಗಣನೆಗಳು

### ಸಾಮರ್ಥ್ಯ ಯೋಜನೆ

ಬಳಕೆ ಮಾದರಿಗಳ ಆಧಾರದ ಮೇಲೆ ಅಗತ್ಯ ಸಾಮರ್ಥ್ಯವನ್ನು ಲೆಕ್ಕಿಸಿ:

```python
# ಸಾಮರ್ಥ್ಯ ಲೆಕ್ಕಾಚಾರ ಉದಾಹರಣೆ
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

# ಬಳಕೆಯ ಉದಾಹರಣೆ
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### ಸ್ವಯಂ-ಸ್ಕೇಲಿಂಗ್ ಸಂರಚನೆ

Container Apps ಗಾಗಿ ಸ್ವಯಂ-ಸ್ಕೇಲಿಂಗ್ ಅನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡಿ:

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

### ವೆಚ್ಚ ಅನುಕೂಲನ

ಅನುಷ್ಟಾನ ವೆಚ್ಚ ನಿಯಂತ್ರಣಗಳನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸಿ:

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

## ಮೇಲ್ವಿಚಾರಣೆ ಮತ್ತು ದೃಶ್ಯತೆ

### Application Insights ಏಕೀಕರಣ

ಎಐ ಕೆಲಸಭಾರಗಳಿಗೆ ನಿಗಾವನ್ನು ಸಂರಚಿಸಿ:

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

### ಕಸ್ಟಮ್ ಮೆಟ್ರಿಕ್‌ಗಳು

ಎಐ-ನಿರ್ದಿಷ್ಟ ಮೆಟ್ರಿಕ್‌ಗಳನ್ನು ಟ್ರ್ಯಾಕ್ ಮಾಡಿ:

```python
# ಎಐ ಮಾದರಿಗಳಿಗಾಗಿ ಕಸ್ಟಮ್ ಟೆಲಿಮೆಟ್ರಿ
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

### ಆರೋಗ್ಯ ತಪಾಸಣೆಗಳು

ಎಐ ಸೇವೆಯ ಆರೋಗ್ಯ ನಿಗಾವನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸಿ:

```python
# ಆರೋಗ್ಯ ಪರಿಶೀಲನೆ ಎಂಡ್ಪಾಯಿಂಟ್‌ಗಳು
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # OpenAI ಸಂಪರ್ಕವನ್ನು ಪರೀಕ್ಷಿಸಿ
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

## ಮುಂದಿನ ಕ್ರಮಗಳು

1. **ಸೇವಾ ಸಂಯೋಜನೆ ಮಾದರಿಗಳಿಗಾಗಿ [Microsoft Foundry Integration Guide](microsoft-foundry-integration.md) ಪರಿಶೀಲಿಸಿ**
2. **ಪ್ರಾಯೋಗಿಕ ಅನುಭವಕ್ಕಾಗಿ [AI Workshop Lab](ai-workshop-lab.md) ಪೂರ್ಣಗೊಳ್ಳಿ**
3. **ಉದ್ಯಮ ನಿಯೋಜನೆಗಳಿಗಾಗಿ [Production AI Practices](production-ai-practices.md) ಜಾರಿಗೆ ತರ하세요**
4. **ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳಿಗಾಗಿ [AI Troubleshooting Guide](../chapter-07-troubleshooting/ai-troubleshooting.md) ಅನ್ವೇಷಿಸಿ**

## ಸಂಪನ್ಮೂಲಗಳು

- [Azure OpenAI Model Availability](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps Scaling](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI Model Cost Optimization](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**ಚಾಪ್ಟರ್ ನ್ಯಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಮನೆ**: [ಆರಂಭಿಕರಿಗೆ AZD](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 2 - ಎಐ-ಪ್ರಥಮ ಅಭಿವೃದ್ಧಿ
- **⬅️ ಹಿಂದಿನದು**: [Microsoft Foundry ಸಂಯೋಜನೆ](microsoft-foundry-integration.md)
- **➡️ ಮುಂದಿನದು**: [ಎಐ ವರ್ಕ್‌ಶಾಪ್ ಲ್ಯಾಬ್](ai-workshop-lab.md)
- **🚀 ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 3: ಸಂರಚನೆ](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ನಿರಾಕರಣೆ:
ಈ ದಾಖಲೆ AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನuvadಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಯನ್ನು ಕಾಯ್ದುಕೊಳ್ಳಲು ಪ್ರಯತ್ನಿಸಿದರೂ, ಸ್ವಯಂ-ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅಸ್ಪಷ್ಟತೆಗಳು ಇರಬಹುದೆಂದು ದಯವಿಟ್ಟು ಗಮನಿಸಿ. ಮೂಲ ದಾಖಲೆ ಅದರ ಮೂಲ ಭಾಷೆಯಲ್ಲಿರುವುದು ಅಧಿಕೃತ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಪ್ರಮುಖ ಮಾಹಿತಿಗಾಗಿ ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದದ ಬಳಕೆಯಿಂದ ಉಂಟಾದ ಯಾವುದೇ ಅರ್ಥತಪ್ಪುಗಳು ಅಥವಾ ತಪ್ಪು ವ್ಯಾಖ್ಯಾನಗಳಿಗಾಗಿ ನಾವು ಹೊಣೆಗಾರರಾಗುವುದಿಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->