# ਐਜ਼ਯੂਅਰ ਡਿਵੈਲਪਰ CLI ਨਾਲ ਏਆਈ ਮਾਡਲ ਡਿਪਲੋਇਮੈਂਟ

**ਅਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD ਫੋਰ ਬਿਗਿਨਰਜ਼](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: ਅਧਿਆਇ 2 - ਏਆਈ-ਪਹਿਲਾ ਵਿਕਾਸ
- **⬅️ ਪਹਿਲਾਂ**: [ਮਾਈਕ੍ਰੋਸਾਫਟ ਫਾਊਂਡਰੀ ਇੰਟਿਗ੍ਰੇਸ਼ਨ](microsoft-foundry-integration.md)
- **➡️ ਅਗਲਾ**: [ਏਆਈ ਵਰਕਸ਼ਾਪ ਲੈਬ](ai-workshop-lab.md)
- **🚀 ਅਗਲਾ ਅਧਿਆਇ**: [ਅਧਿਆਇ 3: ਸੰਰਚਨਾ](../chapter-03-configuration/configuration.md)

ਇਹ ਗਾਈਡ AZD ਟੈਮਪਲੇਟਾਂ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਏਆਈ ਮਾਡਲਾਂ ਨੂੰ ਡਿਪਲੋਇ ਕਰਨ ਲਈ ਵਿਸਤ੍ਰਤ ਹੁਕਮਾਂ ਪ੍ਰਦਾਨ ਕਰਦੀ ਹੈ, ਜਿਸ ਵਿੱਚ ਮਾਡਲ ਚੋਣ ਤੋਂ ਲੈ ਕੇ ਪ੍ਰੋਡਕਸ਼ਨ ਡਿਪਲੋਇਮੈਂਟ ਪੈਟਰਨਾਂ ਤੱਕ ਸਭ ਕੁਝ ਸ਼ਾਮਲ ਹੈ।

> **ਮਾਨਤਾ ਨੋਟ (2026-07-13):** ਇਸ ਗਾਈਡ ਵਿੱਚ AZD ਵਰਕਫਲੋ ਨੂੰ `azd` `1.27.1` ਦੇ ਖਿਲਾਫ਼ ਜਾਂਚਿਆ ਗਿਆ ਸੀ। ਓਹਦਾ ਵਰਤੋਂ ਲਈ ਜਿਹੜੀਆਂ ਡਿਪਲੋਇਮੈਂਟ ਪ੍ਰਕਿਰਿਆਵਾਂ ਡਿਫਾਲਟ ਸਰਵਿਸ ਡਿਪਲੋਇਮੈਂਟ ਖਿੜਕੀ ਤੋਂ ਵੱਧ ਸਮਾਂ ਲੈਂਦੀਆਂ ਹਨ, ਮੌਜੂਦਾ AZD ਰਿਲੀਜ਼ਾਂ `azd deploy --timeout <seconds>` ਨੂੰ ਸਹਿਯੋਗ ਦਿੰਦੀਆਂ ਹਨ।

## ਵਿਸ਼ਯ ਸੂਚੀ

- [ਮਾਡਲ ਚੋਣ ਰਣਨੀਤੀ](#ਮਾਡਲ-ਚੋਣ-ਰਣਨੀਤੀ)
- [ਏਆਈ ਮਾਡਲਾਂ ਲਈ AZD ਸੰਰਚਨਾ](#ਏਆਈ-ਮਾਡਲਾਂ-ਲਈ-azd-ਸੰਰਚਨਾ)
- [ਡਿਪਲੋਇਮੈਂਟ ਪੈਟਰਨ](#ਡਿਪਲੋਇਮੈਂਟ-ਪੈਟਰਨ)
- [ਮਾਡਲ ਪਰਬੰਧਨ](#ਮਾਡਲ-ਪਰਬੰਧਨ)
- [ਉਤਪਾਦਨ ਵਿਚਾਰ](#ਪ੍ਰੋਡਕਸ਼ਨ-ਵਿਚਾਰ)
- [ਮਾਨਿਤਰਨਿੰਗ ਅਤੇ ਨਿਰੀਖਣ](#ਮਾਨਿਤਰਨਿੰਗ-ਅਤੇ-ਨਿਰੀਖਣ)

## ਮਾਡਲ ਚੋਣ ਰਣਨੀਤੀ

### ਮਾਈਕ੍ਰੋਸਾਫਟ ਫਾਊਂਡਰੀ ਮਾਡਲਾਂ

ਆਪਣੇ ਵਰਤੋਂ ਕੇਸ ਲਈ ਸਹੀ ਮਾਡਲ ਚੁਣੋ:

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

### ਮਾਡਲ ਸਮਰੱਥਾ ਯੋਜਨਾ

| ਮਾਡਲ ਕਿਸਮ | ਵਰਤੋਂ ਕੇਸ | ਸੁਝਾਈ ਗਈ ਸਮਰੱਥਾ | ਲਾਗਤ ਵਿਚਾਰ |
|------------|----------|---------------------|---------------|
| gpt-4.1-mini | ਗੱਲਬਾਤ, ਪ੍ਰਸ਼ਨ-ਉੱਤਰ | 10-50 TPM | ਜ਼ਿਆਦਾਤਰ ਵਰਕਲੋਡਸ ਲਈ ਲਾਗਤ-ਪ੍ਰਭਾਵਸ਼ਾਲੀ |
| gpt-4.1 | ਜਟਿਲ ਤਰਕ | 20-100 TPM | ਉੱਚ ਲਾਗਤ, ਪ੍ਰੀਮੀਅਮ ਫੀਚਰਾਂ ਲਈ ਵਰਤੋਂ |
| text-embedding-3-large | ਖੋਜ, RAG | 30-120 TPM | ਸੰਮਤਿਕ ਖੋਜ ਅਤੇ ਪ੍ਰਾਪਤੀ ਲਈ ਮਜ਼ਬੂਤ ਮੂਲ ਚੋਣ |
| Whisper | ਬੋਲੀ ਤੋਂ ਟੈਕਸਟ | 10-50 TPM | ਆਡੀਓ ਪ੍ਰੋਸੈਸਿੰਗ ਵਰਕਲੋਡਸ |

## ਏਆਈ ਮਾਡਲਾਂ ਲਈ AZD ਸੰਰਚਨਾ

### ਬਿਸਪ ਟੈਮਪਲੇਟ ਸੰਰਚਨਾ

ਬਿਸਪ ਟੈਮਪਲੇਟਾਂ ਰਾਹੀਂ ਮਾਡਲ ਡਿਪਲੋਇਮੈਂਟ ਬਣਾਓ:

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

### ਵਾਤਾਵਰਣ ਭੇਰ

ਆਪਣੀ ਐਪਲੀਕੇਸ਼ਨ ਵਾਤਾਵਰਣ ਸੰਰਚਿਤ ਕਰੋ:

```bash
# .env ਸੰਰਚਨਾ
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

## ਡਿਪਲੋਇਮੈਂਟ ਪੈਟਰਨ

### ਪੈਟਰਨ 1: ਇਕ-ਝੋਨੇ ਡਿਪਲੋਇਮੈਂਟ

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

ਸਭ ਤੋਂ ਵਧੀਆ:
- ਵਿਕਾਸ ਅਤੇ ਟੈਸਟਿੰਗ ਲਈ
- ਇੱਕ-ਬਾਜ਼ਾਰ ਐਪਲੀਕੇਸ਼ਨਾਂ ਲਈ
- ਲਾਗਤ ਅਨੁਕੂਲਤਾ ਲਈ

### ਪੈਟਰਨ 2: ਬਹੁ-ਝੋਨੇ ਡਿਪਲੋਇਮੈਂਟ

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

ਸਭ ਤੋਂ ਵਧੀਆ:
- ਗਲੋਬਲ ਐਪਲੀਕੇਸ਼ਨਾਂ ਲਈ
- ਉੱਚ ਉਪਲਬਧਤਾ ਲੋੜਾਂ ਲਈ
- ਲੋਡ ਵੰਡਣ ਲਈ

### ਪੈਟਰਨ 3: ਹਾਈਬ੍ਰਿਡ ਡਿਪਲੋਇਮੈਂਟ

ਮਾਈਕ੍ਰੋਸਾਫਟ ਫਾਊਂਡਰੀ ਮਾਡਲਾਂ ਨੂੰ ਹੋਰ ਏਆਈ ਸਰਵਿਸਾਂ ਨਾਲ ਜੋੜੋ:

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

## ਮਾਡਲ ਪਰਬੰਧਨ

### ਵਰਜਨ ਕੰਟਰੋਲ

ਆਪਣੇ AZD ਸੰਰਚਨਾ ਵਿੱਚ ਮਾਡਲ ਵਰਜ਼ਨਾਂ ਨੂੰ ਟਰੈਕ ਕਰੋ:

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

### ਮਾਡਲ ਅੱਪਡੇਟਸ

ਮਾਡਲ ਅਪਡੇਟ ਲਈ AZD ਹੁਕਸ ਦੀ ਵਰਤੋਂ ਕਰੋ:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"

# ਜੇ ਤਾਇਨਾਤੀकरण ਸਾਮਾਇਕ ਸਮੇਂ ਤੋਂ ਵੱਧ ਲੰਮਾ ਸਮਾਂ ਲੈਂਦੀ ਹੈ
azd deploy --timeout 1800
```

### ਏ/ਬੀ ਟੈਸਟਿੰਗ

ਕਈ ਮਾਡਲ ਵਰਜ਼ਨ ਡਿਪਲੋਇ ਕਰੋ:

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

ਵਰਤੋਂ ਦੇ ਪੈਟਰਨਾਂ ਅਨੁਸਾਰ ਲੋੜੀਂਦੀ ਸਮਰੱਥਾ ਦੀ ਗਣਨਾ ਕਰੋ:

```python
# ਸਮਰੱਥਾ ਗਣਨਾ ਉਦਾਹਰਨ
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

# ਉਦਾਹਰਨ ਵਰਤੋਂ
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### ਆਟੋ-ਸਕੇਲਿੰਗ ਸੰਰਚਨਾ

ਕੰਟੇਨਰ ਐਪਸ ਲਈ ਆਟੋ-ਸਕੇਲਿੰਗ ਸੰਰਚਿਤ ਕਰੋ:

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

### ਲਾਗਤ ਅਨੁਕੂਲਤਾ

ਲਾਗਤ ਨੂੰ ਨਿਯੰਤਰਿਤ ਕਰਨ ਲਈ ਕੰਮ ਕਰੋ:

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

## ਮਾਨਿਤਰਨਿੰਗ ਅਤੇ ਨਿਰੀਖਣ

### ਐਪਲੀਕੇਸ਼ਨ ਇਨਸਾਇਟਸ ਇੰਟਿਗ੍ਰੇਸ਼ਨ

ਏਆਈ ਵਰਕਲੋਡਸ ਲਈ ਨਿਰੀਖਣ ਸੰਰਚਿਤ ਕਰੋ:

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

### ਕਸਟਮ ਮੈਟਰਿਕਸ

ਏਆਈ ਵਿਸ਼ੇਸ਼ ਮੈਟਰਿਕਸ ਨੂੰ ਟਰੈਕ ਕਰੋ:

```python
# ਏਆਈ ਮਾਡਲਾਂ ਲਈ ਕਸਟਮ ਟੈਲੀਮੀਟਰੀ
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

### ਸਿਹਤ ਜਾਂਚ

ਏਆਈ ਸਰਵਿਸ ਸਿਹਤ ਮਾਨਿਤਰਨਿੰਗ ਲਾਗੂ ਕਰੋ:

```python
# ਸਿਹਤ ਚੈੱਕ ਐਂਡਪੋਇੰਟਸ
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # OpenAI ਕਨੈਕਸ਼ਨ ਦੀ ਜਾਂਚ ਕਰੋ
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

1. **ਸੇਵਾ ਇੰਟਿਗ੍ਰੇਸ਼ਨ ਪੈਟਰਨਾਂ ਲਈ [ਮਾਈਕ੍ਰੋਸਾਫਟ ਫਾਊਂਡਰੀ ਇੰਟਿਗ੍ਰੇਸ਼ਨ ਗਾਈਡ](microsoft-foundry-integration.md) ਦੀ ਸਮੀਖਿਆ ਕਰੋ**
2. **ਹੱਥ-ਅਨੁਭਵ ਲਈ [ਏਆਈ ਵਰਕਸ਼ਾਪ ਲੈਬ](ai-workshop-lab.md) ਨੂੰ ਪੂਰਾ ਕਰੋ**
3. **ਇੰਟਰਪ੍ਰਾਈਜ਼ ਡਿਪਲੋਇਮੈਂਟ ਲਈ [ਪ੍ਰੋਡਕਸ਼ਨ ਏਆਈ ਪ੍ਰਕਟਿਸ](production-ai-practices.md) ਨੂੰ ਲਾਗੂ ਕਰੋ**
4. **ਸਧਾਰਣ ਸਮੱਸਿਆਵਾਂ ਲਈ [ਏਆਈ ਟ੍ਰਬਲਸ਼ੂਟਿੰਗ ਗਾਈਡ](../chapter-07-troubleshooting/ai-troubleshooting.md) ਦਾ ਅਧਿਐਨ ਕਰੋ**

## ਸਰੋਤ

- [ਮਾਈਕ੍ਰੋਸਾਫਟ ਫਾਊਂਡਰੀ ਮਾਡਲਾਂ ਮਾਡਲ ਉਪਲਬਧਤਾ](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [ਐਜ਼ਯੂਅਰ ਡਿਵੈਲਪਰ CLI ਦਸਤਾਵੇਜ਼](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [ਕੰਟੇਨਰ ਐਪਸ ਸਕੇਲਿੰਗ](https://learn.microsoft.com/azure/container-apps/scale-app)
- [ਏਆਈ ਮਾਡਲ ਲਾਗਤ ਅਨੁਕੂਲਤਾ](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**ਅਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD ਫੋਰ ਬਿਗਿਨਰਜ਼](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: ਅਧਿਆਇ 2 - ਏਆਈ-ਪਹਿਲਾ ਵਿਕਾਸ
- **⬅️ ਪਹਿਲਾਂ**: [ਮਾਈਕ੍ਰੋਸਾਫਟ ਫਾਊਂਡਰੀ ਇੰਟਿਗ੍ਰੇਸ਼ਨ](microsoft-foundry-integration.md)
- **➡️ ਅਗਲਾ**: [ਏਆਈ ਵਰਕਸ਼ਾਪ ਲੈਬ](ai-workshop-lab.md)
- **🚀 ਅਗਲਾ ਅਧਿਆਇ**: [ਅਧਿਆਇ 3: ਸੰਰਚਨਾ](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ਅਸਵੀਕਾਰੋਪਣ**:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ ਏਆਈ ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀਤਾਵਾਂ ਲਈ ਯਤਨਸ਼ੀਲ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸਮੱਤਿਆਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਆਪਣੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਜਰੂਰੀ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫ਼ਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੇ ਉਪਯੋਗ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜਵਾਬਦੇਹ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->