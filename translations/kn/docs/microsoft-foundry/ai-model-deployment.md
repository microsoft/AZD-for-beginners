<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "2432e08775264e481d86a2e0e512a347",
  "translation_date": "2025-11-24T23:43:16+00:00",
  "source_file": "docs/microsoft-foundry/ai-model-deployment.md",
  "language_code": "kn"
}
-->
# ಏಐ ಮಾದರಿ ನಿಯೋಜನೆ Azure Developer CLI ಬಳಸಿ

**ಅಧ್ಯಾಯ ನಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [AZD For Beginners](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 2 - ಏಐ-ಮೊದಲು ಅಭಿವೃದ್ಧಿ
- **⬅️ ಹಿಂದಿನದು**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ ಮುಂದಿನದು**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 3: ಸಂರಚನೆ](../getting-started/configuration.md)

ಈ ಮಾರ್ಗದರ್ಶಿ AZD ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ಬಳಸಿಕೊಂಡು ಏಐ ಮಾದರಿಗಳನ್ನು ನಿಯೋಜಿಸಲು ಸಂಪೂರ್ಣ ಸೂಚನೆಗಳನ್ನು ಒದಗಿಸುತ್ತದೆ, ಮಾದರಿ ಆಯ್ಕೆಮಾಡುವಿಕೆಯಿಂದ ಪ್ರೊಡಕ್ಷನ್ ನಿಯೋಜನೆ ಮಾದರಿಗಳವರೆಗೆ.

## ವಿಷಯಗಳ ಪಟ್ಟಿಯು

- [ಮಾದರಿ ಆಯ್ಕೆಮಾಡುವ ತಂತ್ರ](../../../../docs/microsoft-foundry)
- [ಏಐ ಮಾದರಿಗಳಿಗೆ AZD ಸಂರಚನೆ](../../../../docs/microsoft-foundry)
- [ನಿಯೋಜನೆ ಮಾದರಿಗಳು](../../../../docs/microsoft-foundry)
- [ಮಾದರಿ ನಿರ್ವಹಣೆ](../../../../docs/microsoft-foundry)
- [ಪ್ರೊಡಕ್ಷನ್ ಪರಿಗಣನೆಗಳು](../../../../docs/microsoft-foundry)
- [ಮಾನಿಟರಿಂಗ್ ಮತ್ತು ಅವಲೋಕನ](../../../../docs/microsoft-foundry)

## ಮಾದರಿ ಆಯ್ಕೆಮಾಡುವ ತಂತ್ರ

### Azure OpenAI ಮಾದರಿಗಳು

ನಿಮ್ಮ ಬಳಕೆ ಪ್ರಕರಣಕ್ಕೆ ಸರಿಯಾದ ಮಾದರಿಯನ್ನು ಆಯ್ಕೆಮಾಡಿ:

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

| ಮಾದರಿ ಪ್ರಕಾರ | ಬಳಕೆ ಪ್ರಕರಣ | ಶಿಫಾರಸು ಮಾಡಿದ ಸಾಮರ್ಥ್ಯ | ವೆಚ್ಚ ಪರಿಗಣನೆಗಳು |
|-------------|------------|-----------------------|-----------------|
| GPT-4o-mini | ಚಾಟ್, ಪ್ರಶ್ನೋತ್ತರ | 10-50 TPM | ಹೆಚ್ಚಿನ ಕೆಲಸಗಳಿಗೆ ವೆಚ್ಚ-ಪರಿಣಾಮಕಾರಿ |
| GPT-4 | ಸಂಕೀರ್ಣ ತಾರ್ಕಿಕತೆ | 20-100 TPM | ಹೆಚ್ಚಿನ ವೆಚ್ಚ, ಪ್ರೀಮಿಯಂ ವೈಶಿಷ್ಟ್ಯಗಳಿಗೆ ಬಳಸಿರಿ |
| Text-embedding-ada-002 | ಶೋಧ, RAG | 30-120 TPM | ಅರ್ಥಪೂರ್ಣ ಶೋಧಕ್ಕೆ ಅಗತ್ಯ |
| Whisper | ಸ್ಪೀಚ್-ಟು-ಟೆಕ್ಸ್ಟ್ | 10-50 TPM | ಆಡಿಯೋ ಪ್ರೊಸೆಸಿಂಗ್ ಕೆಲಸಗಳಿಗೆ |

## ಏಐ ಮಾದರಿಗಳಿಗೆ AZD ಸಂರಚನೆ

### Bicep ಟೆಂಪ್ಲೇಟ್ ಸಂರಚನೆ

Bicep ಟೆಂಪ್ಲೇಟುಗಳ ಮೂಲಕ ಮಾದರಿ ನಿಯೋಜನೆಗಳನ್ನು ರಚಿಸಿ:

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

### ಪರಿಸರ ಚರಾಂಶಗಳು

ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್ ಪರಿಸರವನ್ನು ಸಂರಚಿಸಿ:

```bash
# .env ಕಾನ್ಫಿಗರೇಶನ್
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4o-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## ನಿಯೋಜನೆ ಮಾದರಿಗಳು

### ಮಾದರಿ 1: ಸಿಂಗಲ್-ರೀಜಿಯನ್ ನಿಯೋಜನೆ

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
- ಅಭಿವೃದ್ಧಿ ಮತ್ತು ಪರೀಕ್ಷೆ
- ಸಿಂಗಲ್-ಮಾರ್ಕೆಟ್ ಅಪ್ಲಿಕೇಶನ್‌ಗಳು
- ವೆಚ್ಚ ಆಪ್ಟಿಮೈಸೇಶನ್

### ಮಾದರಿ 2: ಮಲ್ಟಿ-ರೀಜಿಯನ್ ನಿಯೋಜನೆ

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
- ಜಾಗತಿಕ ಅಪ್ಲಿಕೇಶನ್‌ಗಳು
- ಹೆಚ್ಚಿನ ಲಭ್ಯತೆ ಅಗತ್ಯಗಳು
- ಲೋಡ್ ವಿತರಣಾ

### ಮಾದರಿ 3: ಹೈಬ್ರಿಡ್ ನಿಯೋಜನೆ

Azure OpenAI ಅನ್ನು ಇತರ ಏಐ ಸೇವೆಗಳೊಂದಿಗೆ ಸಂಯೋಜಿಸಿ:

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

ಮಾದರಿ ನವೀಕರಣಗಳಿಗೆ AZD ಹೂಕ್ಸ್ ಅನ್ನು ಬಳಸಿ:

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

ಬಹು ಮಾದರಿ ಆವೃತ್ತಿಗಳನ್ನು ನಿಯೋಜಿಸಿ:

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

## ಪ್ರೊಡಕ್ಷನ್ ಪರಿಗಣನೆಗಳು

### ಸಾಮರ್ಥ್ಯ ಯೋಜನೆ

ಬಳಕೆ ಮಾದರಿಗಳ ಆಧಾರದ ಮೇಲೆ ಅಗತ್ಯ ಸಾಮರ್ಥ್ಯವನ್ನು ಲೆಕ್ಕಹಾಕಿ:

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

# ಬಳಕೆ ಉದಾಹರಣೆ
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### ಸ್ವಯಂ-ಸ್ಕೇಲಿಂಗ್ ಸಂರಚನೆ

Container Apps ಗೆ ಸ್ವಯಂ-ಸ್ಕೇಲಿಂಗ್ ಅನ್ನು ಸಂರಚಿಸಿ:

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

### ವೆಚ್ಚ ಆಪ್ಟಿಮೈಸೇಶನ್

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

## ಮಾನಿಟರಿಂಗ್ ಮತ್ತು ಅವಲೋಕನ

### ಅಪ್ಲಿಕೇಶನ್ ಇನ್ಸೈಟ್ಸ್ ಇಂಟಿಗ್ರೇಶನ್

ಏಐ ಕೆಲಸಗಳಿಗೆ ಮಾನಿಟರಿಂಗ್ ಅನ್ನು ಸಂರಚಿಸಿ:

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

### ಕಸ್ಟಮ್ ಮೆಟ್ರಿಕ್ಸ್

ಏಐ-ನಿರ್ದಿಷ್ಟ ಮೆಟ್ರಿಕ್ಸ್ ಅನ್ನು ಟ್ರ್ಯಾಕ್ ಮಾಡಿ:

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

ಏಐ ಸೇವಾ ಆರೋಗ್ಯ ಮಾನಿಟರಿಂಗ್ ಅನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸಿ:

```python
# ಆರೋಗ್ಯ ತಪಾಸಣೆ ಎಂಡ್ಪಾಯಿಂಟ್‌ಗಳು
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # ಓಪನ್‌ಎಐ ಸಂಪರ್ಕವನ್ನು ಪರೀಕ್ಷಿಸಿ
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

## ಮುಂದಿನ ಹಂತಗಳು

1. **[Microsoft Foundry Integration Guide](microsoft-foundry-integration.md)** ಅನ್ನು ಪರಿಶೀಲಿಸಿ ಸೇವಾ ಸಂಯೋಜನೆ ಮಾದರಿಗಳಿಗೆ
2. **[AI Workshop Lab](ai-workshop-lab.md)** ಅನ್ನು ಪೂರ್ಣಗೊಳಿಸಿ ಪ್ರಾಯೋಗಿಕ ಅನುಭವಕ್ಕಾಗಿ
3. **[Production AI Practices](production-ai-practices.md)** ಅನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸಿ ಎಂಟರ್‌ಪ್ರೈಸ್ ನಿಯೋಜನೆಗಳಿಗೆ
4. **[AI Troubleshooting Guide](../troubleshooting/ai-troubleshooting.md)** ಅನ್ನು ಅನ್ವೇಷಿಸಿ ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳಿಗೆ

## ಸಂಪತ್ತುಗಳು

- [Azure OpenAI Model Availability](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps Scaling](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI Model Cost Optimization](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**ಅಧ್ಯಾಯ ನಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [AZD For Beginners](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 2 - ಏಐ-ಮೊದಲು ಅಭಿವೃದ್ಧಿ
- **⬅️ ಹಿಂದಿನದು**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ ಮುಂದಿನದು**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 3: ಸಂರಚನೆ](../getting-started/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ಅಸಮಾಕ್ಷಿಕೆ**:  
ಈ ದಸ್ತಾವೇಜು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಯಿಗಾಗಿ ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ, ದಯವಿಟ್ಟು ಗಮನಿಸಿ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ತಪ್ಪುಗಳು ಅಥವಾ ಅಸಮಾಕ್ಷಿತೆಗಳು ಇರಬಹುದು. ಮೂಲ ಭಾಷೆಯಲ್ಲಿರುವ ಮೂಲ ದಸ್ತಾವೇಜು ಪ್ರಾಮಾಣಿಕ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಮಹತ್ವದ ಮಾಹಿತಿಗಾಗಿ, ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದವನ್ನು ಬಳಸುವ ಮೂಲಕ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಅರ್ಥಗಳ ಅಥವಾ ತಪ್ಪು ವ್ಯಾಖ್ಯಾನಗಳ ಬಗ್ಗೆ ನಾವು ಹೊಣೆಗಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->