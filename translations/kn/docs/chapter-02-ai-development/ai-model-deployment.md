# Azure Developer CLI ಮೂಲಕ AI ಮಾದರಿ ನಿಯೋಜನೆ

**ಚಾಪ್ಟರ್ ನ್ಯಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಮನೆ**: [AZD For Beginners](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 2 - AI-ಪ್ರಥಮ ಅಭಿವೃದ್ಧಿ
- **⬅️ ಹಿಂದಿನ**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ ಮುಂದಿನ**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 3: ಸಂರಚನೆ](../chapter-03-configuration/configuration.md)

ಈ ಮಾರ್ಗಸೂಚಿ ಮಾದರಿ ಆಯ್ಕೆ ಮಾಡಲಿಂದ ಉತ್ಪನ್ನ ನಿಯೋಜನಾಭಿವೃದ್ಧಿ ಮಾದರಿಗಳನ್ನು ಆವರಿಸಿ AZD ಟೆಂಪ್ಲೇಟುಗಳ ಬಳಕೆ ಮೂಲಕ AI ಮಾದರಿಗಳ ನಿಯೋಜನೆಗೆ ಸಂಪೂರ್ಣ ಸೂಚನೆಗಳನ್ನು ಒದಗಿಸುತ್ತದೆ.

> **ಪರಿಶೀಲನೆ ಟಿಪ್ಪಣಿ (2026-07-13):** ಈ ಮಾರ್ಗಸೂಚಿಯ AZD ವರ್ಕ್‌ಫ್ಲೋವನ್ನು `azd` `1.27.1` ವಿರುದ್ಧ ಪರಿಶೀಲಿಸಲಾಗಿದೆ. ಡೀಫಾಲ್ಟ್ ಸೇವಾ ನಿಯೋಜನೆ ವಿಂಡೋಕ್ಕಿಂತ ಹೆಚ್ಚು ಸಮಯ ತೆಗೆದುಕೊಳ್ಳುವ AI ನಿಯೋಜನೆಗಳಿಗೆ, ಪ್ರಸ್ತುತ AZD ಬಿಡುಗಡೆಗಳು `azd deploy --timeout <seconds>` ಅನ್ನು ಬೆಂಬಲಿಸುತ್ತವೆ.

## ವಿಷಯಗಳ ಪಟ್ಟಿಯನ್ನು

- [ಮಾದರಿ ಆಯ್ಕೆ ಶಾಸ್ತ್ರ](#ಮಾದರಿ-ಆಯ್ಕೆ-ಶಾಸ್ತ್ರ)
- [AI ಮಾದರಿಗಳಿಗೆ AZD ಸಂರಚನೆ](#ai-ಮಾದರಿಗಳಿಗೆ-azd-ಸಂರಚನೆ)
- [ನಿಯೋಜನೆ ಮಾದರಿಗಳು](#ನಿಯೋಜನೆ-ಮಾದರಿಗಳು)
- [ಮಾದರಿ ನಿರ್ವಹಣೆ](#ಮಾದರಿ-ನಿರ್ವಹಣೆ)
- [ಉತ್ಪಾದನಾ ಪರಿಗಣನೆಗಳು](#ಉತ್ಪಾದನೆ-ಪರಿಗಣನೆಗಳು)
- [ನಿಗಾವಣೆ ಮತ್ತು ವೀಕ್ಷಣೆ](#ನಿಗಾವಣೆ-ಮತ್ತು-ವೀಕ್ಷಣೆ)

## ಮಾದರಿ ಆಯ್ಕೆ ಶಾಸ್ತ್ರ

### Microsoft Foundry ಮಾದರಿಗಳು

ನಿಮ್ಮ ಬಳಕೆಯ ಪ್ರಕರಣಕ್ಕೆ ಸರಿಯಾದ ಮಾದರಿಯನ್ನು ಆರಿಸಿ:

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

| ಮಾದರಿ ಪ್ರಕಾರ | ಬಳಕೆಯ ಪ್ರಕರಣ | ಶಿಫಾರಸು ಮಾಡಿದ ಸಾಮರ್ಥ್ಯ | ವೆಚ್ಚ ಪರಿಗಣನೆಗಳು |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | ಸಂಭಾಷಣೆ, ಪ್ರಶ್ನೋತ್ತರ | 10-50 TPM | ಬಹುತೇಕ ಕಾರ್ಯಭಾರಗಳಿಗೆ ವೆಚ್ಚ ಸಾಗುವಿಕೆ ಯುಕ್ತ |
| gpt-4.1 | ಸಂಕೀರ್ಣ ತರ್ಕಾಶಕ್ತಿ | 20-100 TPM | ಹೆಚ್ಚು ವೆಚ್ಚ, ಮೌಲ್ಯಯುತ ವೈಶಿಷ್ಟ್ಯಗಳಿಗೆ ಉಪಯೋಗಿಸಿ |
| text-embedding-3-large | ಶೋಧನೆ, RAG | 30-120 TPM | ಅರ್ಥಪೂರ್ಣ ಶೋಧನೆ ಮತ್ತು ಪವಾದಕ್ಕಾಗಿ ಶಕ್ತಿಶಾಲಿ ಡೀಫಾಲ್ಟ್ ಆಯ್ಕೆ |
| Whisper | ಮಾತು-देखि-ಪಠ್ಯ | 10-50 TPM | ಧ್ವನಿ ಸಂಸ್ಕರಣೆ ಕಾರ್ಯಭಾರಗಳು |

## AI ಮಾದರಿಗಳಿಗೆ AZD ಸಂರಚನೆ

### Bicep ಟೆಂಪ್ಲೇಟು ಸಂರಚನೆ

Bicep ಟೆಂಪ್ಲೇಟುಗಳ ಮೂಲಕ ಮಾದರಿ ನಿಯೋಜನೆಗಳನ್ನು ರಚಿಸಿ:

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

### ಪರಿಸರ ಚರಗಳು

ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್ ಪರಿಸರವನ್ನು ಸಂರಚಿಸಿ:

```bash
# .env ಸಂರಚನೆ
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

## ನಿಯೋಜನೆ ಮಾದರಿಗಳು

### ಮಾದರಿ 1: ಏಕ-ಪ್ರಾಂತ್ಯ ನಿಯೋಜನೆ

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

ಇದಕ್ಕೆ ಅತ್ಯುತ್ತಮ:
- ಅಭಿವೃದ್ಧಿ ಮತ್ತು ಪರೀಕ್ಷೆ
- ಏಕ ಮಾರುಕಟ್ಟೆ ಅಪ್ಲಿಕೇಶನ್ಗಳು
- ವೆಚ್ಚ ಆಪ್ಟಿಮೈಜೆಷನ್

### ಮಾದರಿ 2: ಬಹು-ಪ್ರಾಂತ್ಯ ನಿಯೋಜನೆ

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

ಇದಕ್ಕೆ ಅತ್ಯುತ್ತಮ:
- ಗ್ಲೋಬಲ್ ಅಪ್ಲಿಕೇಶನ್ಗಳು
- ಉಚ್ಛ ಲಭ್ಯತೆ ಅವಶ್ಯಕತೆಗಳು
- ಲೋಡ್ ವಿತರಣೆ

### ಮಾದರಿ 3: ಸಂಯುಕ್ತ ನಿಯೋಜನೆ

Microsoft Foundry ಮಾದರಿಗಳನ್ನು ಇತರ AI சேवೆಗಳೊಂದಿಗೆ ಸಂಯೋಜಿಸಿ:

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

### ವರ್ಸನ್ ನಿಯಂತ್ರಣ

ನಿಮ್ಮ AZD ಸಂರಚನೆಯಲ್ಲಿ ಮಾದರಿ ವರ್ಸನ್ನಗಳನ್ನು ಟ್ರ್ಯಾಕ್ ಮಾಡಿ:

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

### ಮಾದರಿ ಸುಧಾರಣೆಗಳು

ಮಾದರಿ ಸುಧಾರಣೆಗಳಿಗೆ AZD ಹೂಕಳನ್ನು ಬಳಸಿ:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"

# ನಿಯೋಜನೆ ಡೀಫಾಲ್ಟ್ ಸಮಯ ಮೀರಿದರೆ
azd deploy --timeout 1800
```

### A/B ಪರೀಕ್ಷೆ

ಬಹು ಮಾದರಿ ವರ್ಸನ್ನಗಳನ್ನು ನಿಯೋಜಿಸಿ:

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

## ಉತ್ಪಾದನೆ ಪರಿಗಣನೆಗಳು

### ಸಾಮರ್ಥ್ಯ ಯೋಜನೆ

ಬಳಕೆ ಮಾದರಿಗಳ ಆಧಾರದಲ್ಲಿ ಅಗತ್ಯ ಸಾಮರ್ಥ್ಯವನ್ನು ಲೆಕ್ಕಹಾಕಿರಿ:

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

ಕಂಟೈನರ್ ಅಪ್ಸ್‌ಗಾಗಿ ಸ್ವಯಂ-ಸ್ಕೇಲಿಂಗ್ ಅನ್ನು ಸಂರಚಿಸಿ:

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

### ವೆಚ್ಚ ಆಪ್ಟಿಮೈಜೆಷನ್

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

## ನಿಗಾವಣೆ ಮತ್ತು ವೀಕ್ಷಣೆ

### ಅಪ್ಲಿಕೇಶನ್ ಇನ್ಸೈಟ್ಸ್ ಏಕತೆಯ

AI ಕಾರ್ಯಭಾರಗಳಿಗಾಗಿ ನಿಗಾವಣೆಯನ್ನು ಸಂರಚಿಸಿ:

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

AI-ನಿರ್ದಿಷ್ಟ ಮೀಟ್ರಿಕ್ಸ್ ಅನ್ನು ಟ್ರ್ಯಾಕ್ ಮಾಡಿ:

```python
# AI ಮಾದರಿಗಳಿಗೆ ಕಸ್ಟಮ್ ಟೆಲೆಮೆಟ್ರಿ
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

AI ಸೇವೆ ಆರೋಗ್ಯ ನಿಗಾವಣೆಯನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸಿ:

```python
# ಆರೋಗ್ಯ ಪರಿಶೀಲನಾ ಅಂತಿಮ ಬಿಂದುಗಳು
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

## ಮುಂದಿನ ಹೆಜ್ಜೆಗಳು

1. **ಸೇವಾ ಏಕತೆಯ ಮಾದರಿಗಾಗಿ [Microsoft Foundry Integration Guide](microsoft-foundry-integration.md) ಪರಿಶೀಲಿಸಿ**
2. ** ಪರಿಚಯಾತ್ಮಕ ಅನುಭವಕ್ಕಾಗಿ [AI Workshop Lab](ai-workshop-lab.md) ಪೂರ್ಣಗೊಳಿಸಿ**
3. **ಉದ್ಯಮ ನಿಯೋಜನೆಗಳಿಗೆ [Production AI Practices](production-ai-practices.md) ಅನುಷ್ಠಾನಗೊಳಿಸಿ**
4. **ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳಿಗೆ [AI Troubleshooting Guide](../chapter-07-troubleshooting/ai-troubleshooting.md) ಅನ್ವೇಷಿಸಿ**

## ಸಂಪನ್ಮೂಲಗಳು

- [Microsoft Foundry ಮಾದರಿಗಳ ಲಭ್ಯತೆ](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI ಡಾಕ್ಯುಮೆಂಟೇಶನ್](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [ಕಂಟೈನರ್ ಅಪ್ಸ್ ಸ್ಕೇಲಿಂಗ್](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI ಮಾದರಿ ವೆಚ್ಚ ಆಪ್ಟಿಮೈಜೆಷನ್](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**ಚಾಪ್ಟರ್ ನ್ಯಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಮನೆ**: [AZD For Beginners](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 2 - AI-ಪ್ರಥಮ ಅಭಿವೃದ್ಧಿ
- **⬅️ ಹಿಂದಿನ**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ ಮುಂದಿನ**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 3: ಸಂರಚನೆ](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ಅಸ್ವೀಕಾರ**:
ಈ ದಸ್ತಾವೇಜು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಯನ್ನು ಸಾಧಿಸಲು ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ, ದಯವಿಟ್ಟು ಗಮನಿಸಿ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅಸಡ್ಡೆಗಳು ಇರಬಹುದು. ಮೂಲ ಭಾಷೆಯಲ್ಲಿರುವ ಮೂಲ ದಸ್ತಾವೇಜು ಪ್ರಾಮಾಣಿಕ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಪ್ರಮುಖ ಮಾಹಿತಿಗಾಗಿ, ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದವನ್ನು ಬಳಸುವ ಮೂಲಕ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಅರ್ಥಗಳ ಅಥವಾ ತಪ್ಪು ವ್ಯಾಖ್ಯಾನಗಳ ಬಗ್ಗೆ ನಾವು ಹೊಣೆಗಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->