# AI ਮਾਡਲ ਡਿਪਲੋਇਮੈਂਟ ਨਾਲ Azure Developer CLI

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ Next**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

ਇਹ ਗਾਈਡ AZD ਟੈਮਪਲੇਟਸ ਦੀ ਵਰਤੋਂ ਕਰਕੇ AI ਮਾਡਲਾਂ ਨੂੰ ਡਿਪਲੋਇ ਕਰਨ ਲਈ ਵਿਸਤ੍ਰਿਤ ਨਿਰਦੇਸ਼ ਪ੍ਰਦਾਨ ਕਰਦੀ ਹੈ, ਮਾਡਲ ਚੋਣ ਤੋਂ ਲੈ ਕੇ ਪ੍ਰੋਡਕਸ਼ਨ ਡਿਪਲੋਇਮੈਂਟ ਪੈਟਰਨਾਂ ਤੱਕ ਸਭ ਕੁਝ ਕਵਰ ਕਰਦੀ ਹੈ।

## ਸੂਚੀ

- [ਮਾਡਲ ਚੋਣ ਰਣਨੀਤੀ](#ਮਾਡਲ-ਚੋਣ-ਰਣਨੀਤੀ)
- [AI ਮਾਡਲਾਂ ਲਈ AZD ਕਨਫਿਗਰੇਸ਼ਨ](#ai-ਮਾਡਲਾਂ-ਲਈ-azd-ਕਨਫਿਗਰੇਸ਼ਨ)
- [ਡਿਪਲੋਇਮੈਂਟ ਪੈਟਰਨ](#ਡਿਪਲੋਇਮੈਂਟ-ਪੈਟਰਨ)
- [ਮਾਡਲ ਪ੍ਰਬੰਧਨ](#ਮਾਡਲ-ਪ੍ਰਬੰਧਨ)
- [ਪ੍ਰੋਡਕਸ਼ਨ ਵਿਚਾਰ](#ਪ੍ਰੋਡਕਸ਼ਨ-ਵਿਚਾਰ)
- [ਮਾਨਿਟਰਿੰਗ ਅਤੇ ਨਿਰੀਖਣਯੋਗਤਾ](#ਮਾਨਿਟਰਿੰਗ-ਅਤੇ-ਨਿਰੀਖਣਯੋਗਤਾ)

## ਮਾਡਲ ਚੋਣ ਰਣਨੀਤੀ

### Microsoft Foundry ਮਾਡਲ ਮਾਡਲ

ਆਪਣੇ ਉਪਯੋਗ ਕੇਸ ਲਈ ਸਹੀ ਮਾਡਲ ਚੁਣੋ:

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

### ਮਾਡਲ ਸਮਰੱਥਾ ਯੋਜਨਾ

| Model Type | Use Case | Recommended Capacity | Cost Considerations |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | ਚੈਟ, ਸਵਾਲ-ਜਵਾਬ | 10-50 TPM | ਜਿਆਦਾਤਰ ਵਰਕਲੋਡਾਂ ਲਈ ਲਾਗਤ-ਕੁਸ਼ਲ |
| gpt-4.1 | ਜਟਿਲ ਤਰਕ | 20-100 TPM | ਉੱਚੀ ਲਾਗਤ, ਪ੍ਰੀਮੀਅਮ ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ ਲਈ ਵਰਤੋਂ |
| Text-embedding-ada-002 | ਖੋਜ, RAG | 30-120 TPM | ਸੇਮੈਂਟਿਕ ਖੋਜ ਲਈ ਜ਼ਰੂਰੀ |
| Whisper | ਅਵਾਜ਼-ਤੋਂ-ਲਿਖਤ | 10-50 TPM | ਆਡੀਓ ਪ੍ਰੋਸੈਸਿੰਗ ਵਰਕਲੋਡ |

## AI ਮਾਡਲਾਂ ਲਈ AZD ਕਨਫਿਗਰੇਸ਼ਨ

### Bicep ਟੈਮਪਲੇਟ ਕਨਫਿਗਰੇਸ਼ਨ

Bicep ਟੈਮਪਲੇਟਾਂ ਰਾਹੀਂ ਮਾਡਲ ਡਿਪਲੋਇਮੈਂਟ ਬਣਾਓ:

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

### ਪਰਿਵੇਸ਼ ਵੈਰੀਏਬਲ

ਆਪਣੀ ਐਪਲੀਕੇਸ਼ਨ ਦਾ ਪਰਿਵੇਸ਼ ਸੰਰਚਿਤ ਕਰੋ:

```bash
# .env ਸੰਰਚਨਾ
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## ਡਿਪਲੋਇਮੈਂਟ ਪੈਟਰਨ

### ਪੈਟਰਨ 1: ਏਕ-ਰੀਜਨ ਡਿਪਲੋਇਮੈਂਟ

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

ਇਹਨਾਂ ਲਈ ਸਭ ਤੋਂ ਵਧੀਆ:
- ਡਿਵੈਲਪਮੈਂਟ ਅਤੇ ਟੈਸਟਿੰਗ
- ਇੱਕ-ਬਜ਼ਾਰ ਐਪਲੀਕੇਸ਼ਨ
- ਲਾਗਤ ਅਪਟਿਮਾਈਜ਼ੇਸ਼ਨ

### ਪੈਟਰਨ 2: ਬਹੁ-ਰੀਜਨ ਡਿਪਲੋਇਮੈਂਟ

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

ਇਹਨਾਂ ਲਈ ਸਭ ਤੋਂ ਵਧੀਆ:
- ਗਲੋਬਲ ਐਪਲੀਕੇਸ਼ਨ
- ਉੱਚ ਉਪਲੱਬਧਤਾ ਦੀਆਂ ਲੋੜਾਂ
- ਲੋਡ ਵੰਡ

### ਪੈਟਰਨ 3: ਹਾਈਬ੍ਰਿਡ ਡਿਪਲੋਇਮੈਂਟ

Microsoft Foundry ਮਾਡਲਾਂ ਨੂੰ ਹੋਰ AI ਸਰਵਿਸਿਜ਼ ਨਾਲ ਮਿਲਾਓ:

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

## ਮਾਡਲ ਪ੍ਰਬੰਧਨ

### ਵਰਜਨ ਕੰਟਰੋਲ

ਆਪਣੀ AZD ਕਨਫਿਗਰੇਸ਼ਨ ਵਿੱਚ ਮਾਡਲ ਵਰਜਨਾਂ ਨੂੰ ਟ੍ਰੈਕ ਕਰੋ:

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

### ਮਾਡਲ ਅੱਪਡੇਟ

ਮਾਡਲ ਅੱਪਡੇਟ ਲਈ AZD hooks ਵਰਤੋ:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"
```

### A/B ਟੈਸਟਿੰਗ

ਕਈ ਮਾਡਲ ਵਰਜਨਾਂ ਨੂੰ ਡਿਪਲੋਇ ਕਰੋ:

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

## ਪ੍ਰੋਡਕਸ਼ਨ ਵਿਚਾਰ

### ਸਮਰੱਥਾ ਯੋਜਨਾ

ਵਰਤੋਂ ਪੈਟਰਨਾਂ ਦੇ ਆਧਾਰ 'ਤੇ ਲੋੜੀਦੀ ਸਮਰੱਥਾ ਦੀ ਗਣਨਾ ਕਰੋ:

```python
# ਸਮਰੱਥਾ ਦੀ ਗਣਨਾ ਦਾ ਉਦਾਹਰਨ
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

# ਵਰਤੋਂ ਦੀ ਉਦਾਹਰਨ
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### ਆਟੋ-ਸਕੇਲਿੰਗ ਸੰਰਚਨਾ

Container Apps ਲਈ ਆਟੋ-ਸਕੇਲਿੰਗ ਸੈੱਟ ਕਰੋ:

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

### ਲਾਗਤ ਅਪਟੀਮਾਈਜ਼ੇਸ਼ਨ

ਲਾਗਤ ਨਿਯੰਤਰਣ ਲਾਗੂ ਕਰੋ:

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

## ਮਾਨਿਟਰਿੰਗ ਅਤੇ ਨਿਰੀਖਣਯੋਗਤਾ

### Application Insights ਇੰਟੀਗ੍ਰੇਸ਼ਨ

AI ਵਰਕਲੋਡਾਂ ਲਈ ਮਾਨਿਟਰਿੰਗ ਸੰਰਚਿਤ ਕਰੋ:

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

### ਕਸਟਮ ਮੈਟ੍ਰਿਕਸ

AI-ਖਾਸ ਮੈਟ੍ਰਿਕਸ ਟ੍ਰੈਕ ਕਰੋ:

```python
# ਏਆਈ ਮਾਡਲਾਂ ਲਈ ਕਸਟਮ ਟੈਲੀਮੇਟਰੀ
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

### ਹੈਲਥ ਚੈਕਸ

AI ਸਰਵਿਸ ਹੈਲਥ ਮਾਨਿਟਰਿੰਗ ਲਾਗੂ ਕਰੋ:

```python
# ਸਿਹਤ ਜਾਂਚ ਐਂਡਪੌਇੰਟ
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # OpenAI ਕਨੈਕਸ਼ਨ ਦੀ ਜਾਂਚ
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

## ਅਗਲੇ ਕਦਮ

1. **[Microsoft Foundry Integration Guide](microsoft-foundry-integration.md) ਨੂੰ ਸੇਵਾ ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਪੈਟਰਨਾਂ ਲਈ ਸਮੀਖਿਆ ਕਰੋ**
2. **[AI Workshop Lab](ai-workshop-lab.md) ਨੂੰ ਹੈਂਡਸ-ਆਨ ਅਨੁਭਵ ਲਈ ਪੂਰਾ ਕਰੋ**
3. **ਇੰਟਰਪ੍ਰਾਈਜ਼ ਡਿਪਲੋਇਮੈਂਟ ਲਈ [Production AI Practices](production-ai-practices.md) ਲਾਗੂ ਕਰੋ**
4. **ਆਮ ਮੁੱਦਿਆਂ ਲਈ [AI Troubleshooting Guide](../chapter-07-troubleshooting/ai-troubleshooting.md) ਦੀ ਜਾਂਚ/ਖੋਜ ਕਰੋ**

## ਸ.resources

- [Microsoft Foundry ਮਾਡਲਾਂ ਦੀ ਉਪਲਬਧਤਾ](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI ਦਸਤਾਵੇਜ਼](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps ਸਕੇਲਿੰਗ](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI ਮਾਡਲ ਲਾਗਤ ਅਪਟੀਮਾਈਜ਼ੇਸ਼ਨ](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ Next**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ਅਸਵੀਕਾਰ**:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ ਏਆਈ ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਨਾਲ ਕੀਤਾ ਗਿਆ ਹੈ। ਅਸੀਂ ਸ਼ੁੱਧਤਾ ਲਈ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਪਰ ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਣਸਹੀਤੀਆਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਆਪਣੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਹੀ ਅਧਿਕਾਰਤ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਨਾਲ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->