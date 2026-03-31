# AI Model Deployment with Azure Developer CLI

**ಅಧ್ಯಾಯ ನ್ಯಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [AZD For Beginners](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 2 - AI-ಪ್ರಥಮ ಅಭಿವೃದ್ಧಿ
- **⬅️ ಹಿಂದಿನದು**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ ಮುಂದಿನದು**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 ಮುಂದಿನ ಅಧ್ಯಾಯ**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

ಈ ಮಾರ್ಗದರ್ಶಿಯು AZD ಟೆಂಪ್ಲೇಟ್‌ಗಳನ್ನು ಬಳಸಿಕೊಂಡು AI ಮಾದರಿಗಳನ್ನು ನಿಯೋಜಿಸುವ ಸಂಪೂರ್ಣ ಸೂಚನೆಗಳನ್ನು ಒದಗಿಸುತ್ತದೆ, ಮಾದರಿ ಆಯ್ಕೆಗಿಂದ ಉತ್ಪಾದನಾ ನಿಯೋಜನೆವರೆಗೆ ಎಲ್ಲಾ ವಿಷಯಗಳನ್ನು ಒಳಗೊಂಡಿದೆ.

## ವಿಷಯದ ಪಟ್ಟಿ

- [ಮಾದರಿ ಆಯ್ಕೆ ನಿರ್ಧಾರ ತಂತ್ರಶಾಸ್ತ್ರ](#model-selection-strategy)
- [AI ಮಾದರಿಗಳಿಗಾಗಿ AZD ಸಂರಚನೆ](#azd-configuration-for-ai-models)
- [ನಿಯೋಜನೆ ಮಾದರಿಗಳು](#deployment-patterns)
- [ಮಾದರಿ ನಿರ್ವಹಣೆ](#model-management)
- [ಉತ್ಪಾದನಾ ಪರಿಗಣನೆಗಳು](#production-considerations)
- [ನಿಗಾವಲು ಮತ್ತು ಗಮನಾರ್ಹತೆ](#monitoring-and-observability)

## Model Selection Strategy

### Microsoft Foundry Models Models

ನಿಮ್ಮ ಬಳಕೆಯ ಪ್ರಕರಣಕ್ಕಾಗಿ ಸೂಕ್ತ ಮಾದರಿಯನ್ನು ಆರಿಸಿಕೊಳ್ಳಿ:

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
            "name": "text-embedding-ada-002",
            "version": "2",
            "deployment": "text-embedding-ada-002", 
            "capacity": 30,
            "format": "OpenAI"
          }
        ]
```

### Model Capacity Planning

| Model Type | Use Case | Recommended Capacity | Cost Considerations |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | ಚಾಟ್, ಪ್ರಶ್ನೆ-ಉತ್ತರ | 10-50 TPM | ಬಹುತೇಕ ಕಾರ್ಯಭಾರಗಳಿಗೆ ವೆಚ್ಚ-ಪ್ರಭಾವಿ |
| gpt-4.1 | ಸಂಕೀರ್ಣ ತರ್ಕಶಕ್ತಿ | 20-100 TPM | ಹೆಚ್ಚಿನ ವೆಚ್ಚ, ಪ್ರೀಮಿಯಂ ವೈಶಿಷ್ಟ್ಯಗಳಿಗೆ ಉಪಯುಕ್ತ |
| Text-embedding-ada-002 | ಹುಡುಕಾಟ, RAG | 30-120 TPM | ಸೆಮ್ಯಾಂಟಿಕ್ ಹುಡುಕಾಟಕ್ಕಾಗಿ ಅಗತ್ಯ |
| Whisper | ಭಾಷ್ಯ-ವಿಷಯಕ್ಕೆ (Speech-to-text) | 10-50 TPM | ಆಡಿಯೋ ಪ್ರಕ್ರಿಯೆಗಳ ಕಾರ್ಯಭಾರಗಳು |

## AZD Configuration for AI Models

### Bicep Template Configuration

Bicep ಟೆಂಪ್ಲೇಟ್‌ಗಳ ಮೂಲಕ ಮಾದರಿ ನಿಯೋಜನೆಗಳನ್ನು ರಚಿಸಿ:

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

### Environment Variables

ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್ ಪರಿಸರವನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡಿ:

```bash
# .env ಸಂರಚನೆ
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## Deployment Patterns

### Pattern 1: Single-Region Deployment

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
- ಅಭಿವೃದ್ಧಿ ಮತ್ತು ಪರೀಕ್ಷೆ
- ಏಕ-ಮಾರ್ಕೆಟ್ ಅಪ್ಲಿಕೇಶನ್‌ಗಳು
- ವೆಚ್ಚದ ಅನ್ವಯಾತ್ಮಕತೆ

### Pattern 2: Multi-Region Deployment

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
- वैश್ವಿಕ (Global) ಅಪ್ಲಿಕೇಶನ್‌ಗಳು
- ಎತ್ತರದ ಲಭ್ಯತೆ ಅಗತ್ಯಗಳು
- ಲೋಡ್ ವಿತರಣೆ

### Pattern 3: Hybrid Deployment

Microsoft Foundry Models ಅನ್ನು ಇತರೆ AI ಸೇವೆಗಳೊಂದಿಗೆ ಸಂಯೋಜಿಸಿ:

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

## Model Management

### Version Control

ನಿಮ್ಮ AZD ಸಂರಚನೆಯಲ್ಲಿ ಮಾದರಿ ಆವೃತ್ತಿಗಳನ್ನು ಟ್ರ್ಯಾಕ್ ಮಾಡಿ:

```json
{
  "models": {
    "chat": {
      "name": "gpt-4.1-mini",
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

### Model Updates

ಮಾದರಿ ನವೀಕರಣಗಳಿಗಾಗಿ AZD/hooks ಬಳಸಿ:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"
```

### A/B Testing

ಬಹು-ಆವೃತ್ತಿ ಮಾದರಿಗಳನ್ನು ನಿಯೋಜಿಸಿ:

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

## Production Considerations

### Capacity Planning

ಬಳಕೆದಾರ ಮಾದರಿಗಳ ಆಧಾರದ ಮೇಲೆ ಅಗತ್ಯ ಸಾಮರ್ಥ್ಯವನ್ನು ಲೆಕ್ಕಹಾಕಿ:

```python
# ಸಾಮರ್ಥ್ಯದ ಲೆಕ್ಕಾಚಾರದ ಉದಾಹರಣೆ
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

### Auto-scaling Configuration

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

### Cost Optimization

ವೆಚ್ಚ ನಿಯಂತ್ರಣವನ್ನು ಅನ್ವಯಿಸಿ:

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

## Monitoring and Observability

### Application Insights Integration

AI ಕಾರ್ಯಭಾರಗಳಿಗಾಗಿ ಮಾನಿಟರಿಂಗ್ ಅನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡಿ:

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

### Custom Metrics

AI-ನಿರ್ದಿಷ್ಟ ಮೆಟ್ರಿಕ್‌ಗಳನ್ನು ಟ್ರ್ಯಾಕ್ ಮಾಡಿ:

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

### Health Checks

AI ಸೇವೆಗಳ ಆರೋಗ್ಯ ಮಾನಿಟರಿಂಗ್ ಅನ್ನು ಜಾರಿಗೆ ತರುವಿರಿ:

```python
# ಆರೋಗ್ಯ ಪರಿಶೀಲನಾ ಎಂಡ್ಪಾಯಿಂಟ್‌ಗಳು
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

## Next Steps

1. **[Microsoft Foundry Integration Guide](microsoft-foundry-integration.md)** ಅನ್ನು ಸೇವಾ ինտಿಗ್ರೇಶನ್ ಮಾದರಿಗಳಿಗಾಗಿ ಪರಿಶೀಲಿಸಿ
2. **[AI Workshop Lab](ai-workshop-lab.md)** ಅನ್ನು ಕೈಯಿಂದ ಅನುಭವಕ್ಕಾಗಿ ಪೂರ್ಣಗೊಳಿಸಿ
3. **[Production AI Practices](production-ai-practices.md)** ಅನ್ನು ಎಂಟರ್ಪ್ರೈಸ್ ನಿಯೋಜನೆಗಳಿಗಾಗಿ ಜಾರಿಗೆ ತರುವಿರಿ
4. **[AI Troubleshooting Guide](../chapter-07-troubleshooting/ai-troubleshooting.md)** ಅನ್ನು ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳಿಗಾಗಿ ಅನ್ವೇಷಿಸಿ

## Resources

- [Microsoft Foundry Models Model Availability](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps Scaling](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI Model Cost Optimization](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**ಅಧ್ಯಾಯ ನ್ಯಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [AZD For Beginners](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 2 - AI-ಪ್ರಥಮ ಅಭಿವೃದ್ಧಿ
- **⬅️ ಹಿಂದಿನದು**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ ಮುಂದಿನದು**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 ಮುಂದಿನ ಅಧ್ಯಾಯ**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ಈ ದಾಖಲೆವನ್ನು AI ಅನuvad ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನuvadಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಗೆ ಪ್ರಯತ್ನಿಸಿದರೂ, ಸ್ವಯಂಚಾಲಿತ ಅನuvadಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅಸ್ಪಷ್ಟತೆಗಳಿರಬಹುದು ಎಂದು ದಯವಿಟ್ಟು ಗಮನಿಸಿ. ಮೂಲ ಭಾಷೆಯಲ್ಲಿನ ಮೂಲ ದಾಖಲೆ ಅನ್ನು ಅಧಿಕೃತ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಗಂಭೀರ ಮಾಹಿತಿಗಾಗಿ ವೃತ್ತಿಪರ ಮಾನವ ಅನuvadವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನuvadವನ್ನು ಬಳಸುವುದರಿಂದ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಗ್ರಹಿಕೆಗಳು ಅಥವಾ ತಪ್ಪು ವ್ಯಾಖ್ಯಾನಗಳಿಗಾಗಿ ನಾವು ಜವಾಬ್ದಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->