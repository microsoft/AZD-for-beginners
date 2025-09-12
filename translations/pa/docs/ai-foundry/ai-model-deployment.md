<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "d1b97c6d936e9b4f71fc2972306dfb7f",
  "translation_date": "2025-09-12T19:37:50+00:00",
  "source_file": "docs/ai-foundry/ai-model-deployment.md",
  "language_code": "pa"
}
-->
# AZD ਨਾਲ AI ਮਾਡਲ ਡਿਪਲੌਇਮੈਂਟ

**ਪਿਛਲਾ:** [Azure AI Foundry ਇੰਟੀਗ੍ਰੇਸ਼ਨ](azure-ai-foundry-integration.md) | **ਅਗਲਾ:** [AI ਵਰਕਸ਼ਾਪ ਲੈਬ](ai-workshop-lab.md)

ਇਹ ਗਾਈਡ AZD ਟੈਂਪਲੇਟਾਂ ਦੀ ਵਰਤੋਂ ਕਰਕੇ AI ਮਾਡਲਾਂ ਨੂੰ ਡਿਪਲੌਇ ਕਰਨ ਲਈ ਵਿਸਤ੍ਰਿਤ ਹਦਾਇਤਾਂ ਪ੍ਰਦਾਨ ਕਰਦੀ ਹੈ, ਜਿਸ ਵਿੱਚ ਮਾਡਲ ਚੋਣ ਤੋਂ ਲੈ ਕੇ ਪ੍ਰੋਡਕਸ਼ਨ ਡਿਪਲੌਇਮੈਂਟ ਪੈਟਰਨ ਤੱਕ ਸਭ ਕੁਝ ਸ਼ਾਮਲ ਹੈ।

## ਸਮੱਗਰੀ ਦੀ ਸੂਚੀ

- [ਮਾਡਲ ਚੋਣ ਦੀ ਰਣਨੀਤੀ](../../../../docs/ai-foundry)
- [AI ਮਾਡਲਾਂ ਲਈ AZD ਕਨਫਿਗਰੇਸ਼ਨ](../../../../docs/ai-foundry)
- [ਡਿਪਲੌਇਮੈਂਟ ਪੈਟਰਨ](../../../../docs/ai-foundry)
- [ਮਾਡਲ ਪ੍ਰਬੰਧਨ](../../../../docs/ai-foundry)
- [ਪ੍ਰੋਡਕਸ਼ਨ ਵਿਚ ਧਿਆਨ](../../../../docs/ai-foundry)
- [ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਦ੍ਰਿਸ਼ਤਾ](../../../../docs/ai-foundry)

## ਮਾਡਲ ਚੋਣ ਦੀ ਰਣਨੀਤੀ

### Azure OpenAI ਮਾਡਲ

ਆਪਣੇ ਵਰਤੋਂ ਦੇ ਕੇਸ ਲਈ ਸਹੀ ਮਾਡਲ ਚੁਣੋ:

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

### ਮਾਡਲ ਸਮਰੱਥਾ ਯੋਜਨਾ

| ਮਾਡਲ ਕਿਸਮ | ਵਰਤੋਂ ਦੇ ਕੇਸ | ਸਿਫਾਰਸ਼ੀ ਸਮਰੱਥਾ | ਲਾਗਤ ਦੇ ਵਿਚਾਰ |
|------------|----------|---------------------|-------------------|
| GPT-4o-mini | ਚੈਟ, Q&A | 10-50 TPM | ਜ਼ਿਆਦਾਤਰ ਵਰਕਲੋਡ ਲਈ ਲਾਗਤ-ਪ੍ਰਭਾਵੀ |
| GPT-4 | ਜਟਿਲ ਤਰਕ | 20-100 TPM | ਉੱਚ ਲਾਗਤ, ਪ੍ਰੀਮੀਅਮ ਫੀਚਰ ਲਈ ਵਰਤੋਂ |
| Text-embedding-ada-002 | ਖੋਜ, RAG | 30-120 TPM | ਸੈਮੈਂਟਿਕ ਖੋਜ ਲਈ ਜ਼ਰੂਰੀ |
| Whisper | ਸਪੀਚ-ਟੂ-ਟੈਕਸਟ | 10-50 TPM | ਆਡੀਓ ਪ੍ਰੋਸੈਸਿੰਗ ਵਰਕਲੋਡ |

## AI ਮਾਡਲਾਂ ਲਈ AZD ਕਨਫਿਗਰੇਸ਼ਨ

### Bicep ਟੈਂਪਲੇਟ ਕਨਫਿਗਰੇਸ਼ਨ

Bicep ਟੈਂਪਲੇਟਾਂ ਰਾਹੀਂ ਮਾਡਲ ਡਿਪਲੌਇਮੈਂਟ ਬਣਾਓ:

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

### ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ

ਆਪਣੇ ਐਪਲੀਕੇਸ਼ਨ ਵਾਤਾਵਰਣ ਨੂੰ ਕਨਫਿਗਰ ਕਰੋ:

```bash
# .env configuration
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4o-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## ਡਿਪਲੌਇਮੈਂਟ ਪੈਟਰਨ

### ਪੈਟਰਨ 1: ਸਿੰਗਲ-ਰੀਜਨ ਡਿਪਲੌਇਮੈਂਟ

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

ਸਰਬੋਤਮ ਲਈ:
- ਵਿਕਾਸ ਅਤੇ ਟੈਸਟਿੰਗ
- ਸਿੰਗਲ-ਮਾਰਕੀਟ ਐਪਲੀਕੇਸ਼ਨ
- ਲਾਗਤ ਦਾ ਅਨੁਕੂਲਨ

### ਪੈਟਰਨ 2: ਮਲਟੀ-ਰੀਜਨ ਡਿਪਲੌਇਮੈਂਟ

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

ਸਰਬੋਤਮ ਲਈ:
- ਗਲੋਬਲ ਐਪਲੀਕੇਸ਼ਨ
- ਉੱਚ ਉਪਲਬਧਤਾ ਦੀਆਂ ਜ਼ਰੂਰਤਾਂ
- ਲੋਡ ਵੰਡ

### ਪੈਟਰਨ 3: ਹਾਈਬ੍ਰਿਡ ਡਿਪਲੌਇਮੈਂਟ

Azure OpenAI ਨੂੰ ਹੋਰ AI ਸੇਵਾਵਾਂ ਨਾਲ ਜੋੜੋ:

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

ਆਪਣੇ AZD ਕਨਫਿਗਰੇਸ਼ਨ ਵਿੱਚ ਮਾਡਲ ਵਰਜਨ ਟ੍ਰੈਕ ਕਰੋ:

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

### ਮਾਡਲ ਅਪਡੇਟ

ਮਾਡਲ ਅਪਡੇਟ ਲਈ AZD hooks ਦੀ ਵਰਤੋਂ ਕਰੋ:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4o-mini']"
```

### A/B ਟੈਸਟਿੰਗ

ਕਈ ਮਾਡਲ ਵਰਜਨ ਡਿਪਲੌਇ ਕਰੋ:

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

## ਪ੍ਰੋਡਕਸ਼ਨ ਵਿਚ ਧਿਆਨ

### ਸਮਰੱਥਾ ਯੋਜਨਾ

ਵਰਤੋਂ ਦੇ ਪੈਟਰਨ ਦੇ ਆਧਾਰ 'ਤੇ ਲੋੜੀਂਦੀ ਸਮਰੱਥਾ ਦੀ ਗਣਨਾ ਕਰੋ:

```python
# Capacity calculation example
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

# Example usage
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### ਆਟੋ-ਸਕੇਲਿੰਗ ਕਨਫਿਗਰੇਸ਼ਨ

Container Apps ਲਈ ਆਟੋ-ਸਕੇਲਿੰਗ ਕਨਫਿਗਰ ਕਰੋ:

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

### ਲਾਗਤ ਦਾ ਅਨੁਕੂਲਨ

ਲਾਗਤ ਕੰਟਰੋਲ ਲਾਗੂ ਕਰੋ:

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

## ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਦ੍ਰਿਸ਼ਤਾ

### ਐਪਲੀਕੇਸ਼ਨ ਇਨਸਾਈਟਸ ਇੰਟੀਗ੍ਰੇਸ਼ਨ

AI ਵਰਕਲੋਡ ਲਈ ਮਾਨੀਟਰਿੰਗ ਕਨਫਿਗਰ ਕਰੋ:

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

AI-ਵਿਸ਼ੇਸ਼ ਮੈਟ੍ਰਿਕਸ ਟ੍ਰੈਕ ਕਰੋ:

```python
# Custom telemetry for AI models
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

AI ਸੇਵਾ ਦੀ ਸਿਹਤ ਦੀ ਮਾਨੀਟਰਿੰਗ ਲਾਗੂ ਕਰੋ:

```python
# Health check endpoints
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # Test OpenAI connection
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

1. **[Azure AI Foundry ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਗਾਈਡ](azure-ai-foundry-integration.md)** ਦੀ ਸਮੀਖਿਆ ਕਰੋ ਸੇਵਾ ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਪੈਟਰਨ ਲਈ
2. **[AI ਵਰਕਸ਼ਾਪ ਲੈਬ](ai-workshop-lab.md)** ਪੂਰੀ ਕਰੋ ਹੈਂਡਸ-ਆਨ ਅਨੁਭਵ ਲਈ
3. **[ਪ੍ਰੋਡਕਸ਼ਨ AI ਅਭਿਆਸ](production-ai-practices.md)** ਲਾਗੂ ਕਰੋ ਐਂਟਰਪ੍ਰਾਈਜ਼ ਡਿਪਲੌਇਮੈਂਟ ਲਈ
4. **[AI ਟਰਬਲਸ਼ੂਟਿੰਗ ਗਾਈਡ](../troubleshooting/ai-troubleshooting.md)** ਦੀ ਖੋਜ ਕਰੋ ਆਮ ਸਮੱਸਿਆਵਾਂ ਲਈ

## ਸਰੋਤ

- [Azure OpenAI ਮਾਡਲ ਉਪਲਬਧਤਾ](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI ਦਸਤਾਵੇਜ਼](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps ਸਕੇਲਿੰਗ](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI ਮਾਡਲ ਲਾਗਤ ਦਾ ਅਨੁਕੂਲਨ](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**ਪਿਛਲਾ:** [Azure AI Foundry ਇੰਟੀਗ੍ਰੇਸ਼ਨ](azure-ai-foundry-integration.md) | **ਅਗਲਾ:** [AI ਵਰਕਸ਼ਾਪ ਲੈਬ](ai-workshop-lab.md)

---

**ਅਸਵੀਕਰਤਾ**:  
ਇਹ ਦਸਤਾਵੇਜ਼ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀ ਹੋਣ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਦਿਓ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸੁੱਤੀਆਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਇਸ ਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਅਧਿਕਾਰਤ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੇ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆ ਲਈ ਅਸੀਂ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।