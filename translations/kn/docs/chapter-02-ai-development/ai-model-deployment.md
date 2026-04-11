# AI ಮಾದರಿ ನಿಯೋಜನೆ ಜೊತೆಗೆ ಆಜ್ವರ್ ಡೆವಲಪರ್ CLI

**ಅಧ್ಯಾಯ ನಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [AZD For Beginners](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 2 - AI-ಮೊದಲು ಅಭಿವೃದ್ಧಿ
- **⬅️ ಹಿಂದಿನದು**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ ಮುಂದಿನದು**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 ಮುಂದಿನ ಅಧ್ಯಾಯ**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

ಈ ಮಾರ್ಗದರ್ಶಿ AZD ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ಬಳಸಿ AI ಮಾದರಿಗಳ ನಿಯೋಜನೆಗೆ ಸಮಗ್ರ ಸೂಚನೆಗಳನ್ನು ಒದಗಿಸುತ್ತದೆ, ಮಾದರಿ ಆಯ್ಕೆ ಮತ್ತು ಉತ್ಪಾದನ ನಿಯೋಜನೆ ಮಾದರಿಗಳ ತನಕ ಎಲ್ಲವನ್ನೂ ಒಳಗೊಂಡಿದೆ.

> **ಪರಿಶೀಲನೆಯ ಸೂಚನೆ (2026-03-25):** ಈ ಮಾರ್ಗದರ್ಶಿಯ AZD ಕೆಲಸದ ಪ್ರವಾಹ `azd` `1.23.12` ಗೆ ವಿರುದ್ಧವಾಗಿ ಪರಿಶೀಲಿಸಲಾಯಿತು. ಡೀಫಾಲ್ಟ್ ಸರ್ವಿಸ್ ನಿಯೋಜನೆ ವಿಂಡೋದಿಗಿಂತ ಹೆಚ್ಚು ಸಮಯ ತೆಗೆದುಕೊಳ್ಳುವ AI ನಿಯೋಜನೆಗಳಿಗೆ, ಪ್ರಸ್ತುತ AZD ಬಿಡುಗಡೆಗಳು `azd deploy --timeout <seconds>` ಅನ್ನು ಬೆಂಬಲಿಸುತ್ತವೆ.

## ವಿಷಯ ಸೂಚಿಕೆ

- [ಮಾದರಿ ಆಯ್ಕೆ ತಂತ್ರಜ್ಞಾನ](#ಮಾದರಿ-ಆಯ್ಕೆ-ತಂತ್ರಜ್ಞಾನ)
- [AI ಮಾದರಿಗಳಿಗಾಗಿ AZD ಸಂರಚನೆ](#ai-ಮಾದರಿಗಳಿಗಾಗಿ-azd-ಸಂರಚನೆ)
- [ನಿಯೋಜನೆ ಮಾದರಿಗಳು](#ನಿಯೋಜನೆ-ಮಾದರಿಗಳು)
- [ಮಾದರಿ ನಿರ್ವಹಣೆ](#ಮಾದರಿ-ನಿರ್ವಹಣೆ)
- [ಉತ್ಪಾದನಾ ಪರಿಗಣನೆಗಳು](#ಉತ್ಪಾದನಾ-ಪರಿಗಣನೆಗಳು)
- [ನಿರೀಕ್ಷಣೆ ಮತ್ತು ಅವಲೋಕನ](#ನಿರೀಕ್ಷಣೆ-ಮತ್ತು-ಅವಲೋಕನ)

## ಮಾದರಿ ಆಯ್ಕೆ ತಂತ್ರಜ್ಞಾನ

### Microsoft Foundry ಮಾದರಿಗಳು

ನಿಮ್ಮ ಬಳಕೆ ಪ್ರಕರಣಕ್ಕಾಗಿ ಸರಿಯಾದ ಮಾದರಿಯನ್ನು ಆಯ್ಕೆಮಾಡಿ:

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

### ಮಾದರಿ ಸಾಮರ್ಥ್ಯ ಯೋಜನೆ

| ಮಾದರಿ ಪ್ರಕಾರ | ಬಳಕೆ ಪ್ರಕರಣ | ಶಿಫಾರಸು ಮಾಡಿದ ಸಾಮರ್ಥ್ಯ | ವೆಚ್ಚ ಪರಿಗಣನೆಗಳು |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | ಚಾಟ್, ಪ್ರಶ್ನೋತ್ತರ | 10-50 TPM | ಬಹುಮಟ್ಟಿನ ಕೆಲಸಗಳಿಗೆ ಖರ್ಚು-ಕಾರ್ಯನಿರ್ವಹಣಾ |
| gpt-4.1 | ಸಂಕೀರ್ಣ તાર್ಕಿಕತೆ | 20-100 TPM | ಉನ್ನತ ವೆಚ್ಚ, ಪ್ರೀಮಿಯಂ ವೈಶಿಷ್ಟ್ಯಗಳಿಗೆ ಬಳಸು |
| text-embedding-3-large | ಹುಡುಕು, RAG | 30-120 TPM | ಸಾಮ್ಯಾಂತು ಹುಡುಕಾಟ ಮತ್ತು ಸಂಗ್ರಹಣೆಗೆ ಬಲವಾದ ಡೀಫಾಲ್ಟ್ ಆಯ್ಕೆ |
| Whisper | ಸ್ಪೀಚ್-ಟು-ಟೆಕ್ಸ್ಟ್ | 10-50 TPM | ಆಡಿಯೋ ಪ್ರಕ್ರಿಯೆ ಕೆಲಸಗಳು |

## AI ಮಾದರಿಗಳಿಗಾಗಿ AZD ಸಂರಚನೆ

### ಬೈಸ್ಪ್ ಟೆಂಪ್ಲೇಟ್ ಸಂರಚನೆ

ಬೈಸ್ಪ್ ಟೆಂಪ್ಲೇಟುಗಳ ಮೂಲಕ ಮಾದರಿ ನಿಯೋಜನೆಗಳನ್ನು ರಚಿಸಿ:

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

### ಪರಿಸರ ಬದಲಾವಣೆಗಳು

ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್ ಪರಿಸರವನ್ನು ಸಂರಚಿಸಿ:

```bash
# .env ಸಂರಚನೆ
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
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
      AZURE_OPENAI_CHAT_DEPLOYMENT: gpt-4.1-mini
```

ಉತ್ತಮವಾಗಿದೆ:
- ಅಭಿವೃದ್ಧಿ ಮತ್ತು ಪರೀಕ್ಷೆಗಾಗಿ
- ಏಕ-ಮಾರುಕಟ್ಟೆ ಅಪ್ಲಿಕೇಶನ್‌ಗಳಿಗೆ
- ವೆಚ್ಚ ಪರಿಣಾಮಕಾರಿತ್ವಕ್ಕಾಗಿ

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
- ಜಾಗತಿಕ ಅಪ್ಲಿಕೇಶನ್‌ಗಳಿಗೆ
- ಹೆಚ್ಚಿನ ಲಭ್ಯತೆ ಅಗತ್ಯಗಳಿಗೆ
- ಭಾರ ವಿತರಣೆಗಾಗಿ

### ಮಾದರಿ 3: ಸಂಯುಕ್ತ ನಿಯೋಜನೆ

Microsoft Foundry ಮಾದರಿಗಳನ್ನು ಇತರ AI ಸೇವೆಗಳಲ್ಲಿ ಸಂಯೋಜಿಸಿ:

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

ನಿಮ್ಮ AZD ಸಂರಚನೆದಲ್ಲಿ ಮಾದರಿ ಆವೃತ್ತಿಗಳನ್ನು ಹತ್ತಿರವಿಡಿ:

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

### ಮಾದರಿ ನವೀಕರಣಗಳು

AZD ಹೂಕ್‌ಗಳನ್ನು ಬಳಸಿ ಮಾದರಿ ನವೀಕರಣಗಳನ್ನು ಮಾಡಿ:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"

# ನಿಯೋಜನೆ ಡೀಫಾಲ್ಟ್ ಕಾಲಹരണ ಸಮಯಕ್ಕಿಂತ ಹೆಚ್ಚು ಸಮಯ ತೆಗೆದುಕೊಂಡರೆ
azd deploy --timeout 1800
```

### A/B ಪರೀಕ್ಷೆ

ಹೆಚ್ಚಿನ ಮಾದರಿ ಆವೃತ್ತಿಗಳನ್ನು ನಿಯೋಜಿಸಿ:

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

## ಉತ್ಪಾದನಾ ಪರಿಗಣನೆಗಳು

### ಸಾಮರ್ಥ್ಯ ಯೋಜನೆ

ಬಳಕೆ ಮಾದರಿಗಳ ಆಧಾರದ ಮೇಲೆ ಬೇಕಾದ ಸಾಮರ್ಥ್ಯವನ್ನು ಲೆಕ್ಕಿಸಿ:

```python
# ಸಾಮರ್ಥ್ಯ ಲೆಕ್ಕಾಚಾರದ ಉದಾಹರಣೆ
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

# ಉದಾಹರಣೆ ಬಳಕೆ
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### ಸ್ವಯංಕ್ರಿಯ ಸ್ಕೇಲಿಂಗ್ ಸಂರಚನೆ

ಕಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್‌ಗಳಿಗಾಗಿ ಸ್ವಯಂಸ್ಕೇಲಿಂಗನ್ನು ಸಂರಚಿಸಿ:

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

### ವೆಚ್ಚ ಪರಿಣಾಮಕಾರಿತ್ವ

ವೆಚ್ಚ ನಿಯಂತ್ರಣಗಳನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸಿ:

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

## ನಿರೀಕ್ಷಣೆ ಮತ್ತು ಅವಲೋಕನ

### ಅಪ್ಲಿಕೇಶನ್ ಇನ್ಸೈಟ್ಸ್ ಸಂಯೋಜನೆ

AI ಕೆಲಸಗಳಿಗೆ ಮೌಲ್ಯಮಾಪನ ನಿರೀಕ್ಷಣೆಯನ್ನು ಸಂರಚಿಸಿ:

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

### ಕಸ್ಟಮ್ ಮೀಟ್ರಿಕ್ಸ್

AI-ನಿರ್ದಿಷ್ಟ ಮೀಟ್ರಿಕ್ಸ್ ಅನ್ನು ಹತ್ತಿರವಿಡಿ:

```python
# AI ಮಾದರಿಗಳಿಗಾಗಿ ಕಸ್ಟಮ್ ಟೆಲಿಮೆಟ್ರಿ
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

AI ಸೇವೆಯ ಆರೋಗ್ಯ ನಿರೀಕ್ಷಣೆಯನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸಿ:

```python
# ಆರೋಗ್ಯ ಪರಿಶೀಲನಾ ಎಂಡ್ಪಾಯಿಂಟ್‌ಗಳು
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # OpenAI ಸಂಪರ್ಕ ಪರೀಕ್ಷೆ
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

## ಮುಂದಿನ ಹೆಜ್ಜೆಗಳು

1. **[Microsoft Foundry Integration Guide](microsoft-foundry-integration.md)** ಸೇವೆ ಸಂಯೋಜನೆ ಮಾದರಿಗಳಿಗಾಗಿ ಪರಿಶೀಲಿಸಿ  
2. **[AI Workshop Lab](ai-workshop-lab.md)** ಮೂಲಕ ಕೈಯಲ್ಲಿ ಅನುಭವ ಸಂಪಾದಿಸಿ  
3. **[Production AI Practices](production-ai-practices.md)** ಮೂಲಕ ಕಂಪನಿಯ ನಿಯೋಜನೆಗಳಿಗೆ ಅನುಷ್ಠಾನಗೊಳಿಸಿ  
4. **[AI Troubleshooting Guide](../chapter-07-troubleshooting/ai-troubleshooting.md)** ಮೂಲಕ ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳನ್ನು ಪರಿಶೀಲಿಸಿ  

## ಸಂಪನ್ಮೂಲಗಳು

- [Microsoft Foundry Models Model Availability](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps Scaling](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI Model Cost Optimization](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**ಅಧ್ಯಾಯ ನಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [AZD For Beginners](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 2 - AI-ಮೊದಲು ಅಭಿವೃದ್ಧಿ
- **⬅️ ಹಿಂದಿನದು**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ ಮುಂದಿನದು**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 ಮುಂದಿನ ಅಧ್ಯಾಯ**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ತ್ಯಜ್ಯತೆ**:
ಈ ದಾಖಲೆ AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ಆರ್ದತೆಯನ್ನು ಸಾಧಿಸಲು ಪ್ರಯತ್ನಿಸಿದರೂ, ಸ್ವಯಂಕ್ರಿಯ ಅನುವಾದಗಳಲ್ಲಿ ತಪ್ಪುಗಳು ಅಥವಾ ಅಸ್ವತಂತ್ರತೆಗಳಿರಬಹುದು ಎಂದು ದಯವಿಟ್ಟು ಗಮನಿಸಿ. ಮೂಲ ಭಾಷೆಯಲ್ಲಿನ ಮೂಲ ದಾಖಲೆನ್ನು ಪ್ರಧಾನ ಮೂಲ ಎಂದು ಪರಿಗಣಿಸಬೇಕು. ಪ್ರಮುಖ ಮಾಹಿತಿಗಾಗಿ, ವೃತ್ತಿಪರ ಮಾನವನ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗಿದೆ. ಈ ಅನುವಾದ ಬಳಕೆಯಿಂದ ಉದ್ಭವಿಸುವ ಯಾವುದೇ ಗುರುತು ತಪ್ಪುಗಳು ಅಥವಾ ತಪ್ಪು ಅರ್ಥಮಾಡಿಕೆಗಳಿಗೆ ನಾವು ಜವಾಬ್ದಾರಿಯಾಗುವುದಿಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->