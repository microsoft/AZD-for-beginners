# Azure Developer CLI ਨਾਲ AI ਮਾਡਲ ਡਿਪਲੌਇਮੈਂਟ

**ਚੈਪਟਰ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD ਲਈ ਸ਼ੁਰੂਆਤੀ](../../README.md)
- **📖 ਮੌਜੂਦਾ ਚੈਪਟਰ**: ਅਧਿਆਇ 2 - AI-ਪਹਿਲਾ ਵਿਕਾਸ
- **⬅️ ਪਿਛਲਾ**: [Microsoft Foundry ਇੰਟਿਗ੍ਰੇਸ਼ਨ](microsoft-foundry-integration.md)
- **➡️ ਅਗਲਾ**: [AI ਵਰਕਸ਼ਾਪ ਲੈਬ](ai-workshop-lab.md)
- **🚀 ਅਗਲਾ ਅਧਿਆਇ**: [ਅਧਿਆਇ 3: ਕਨਫਿਗਰੇਸ਼ਨ](../chapter-03-configuration/configuration.md)

ਇਹ ਗਾਈਡ AZD ਟੈਂਪਲੇਟਾਂ ਦੀ ਵਰਤੋਂ ਕਰਕੇ AI ਮਾਡਲਾਂ ਨੂੰ ਡਿਪਲੌਇ ਕਰਨ ਲਈ ਵਿਸਤ੍ਰਿਤ ਨਿਰਦੇਸ਼ ਦਿੰਦੀ ਹੈ, ਮਾਡਲ ਚੋਣ ਤੋਂ ਲੈ ਕੇ ਪ੍ਰੋਡਕਸ਼ਨ ਡਿਪਲੌਇਮੈਂਟ ਪੈਟਰਨ ਤੱਕ ਸਭ ਕੁਝ ਕਵਰ ਕਰਦੀ ਹੈ।

> **ਪ੍ਰਮਾਣਕਰਨ ਨੋਟ (2026-03-25):** ਇਸ ਗਾਈਡ ਵਿੱਚ AZD ਵਰਕਫਲੋ ਨੂੰ `azd` `1.23.12` ਦੇ ਨਾਲ ਚੈੱਕ ਕੀਤਾ ਗਿਆ ਸੀ। ਜੇਕਰ AI ਡਿਪਲੌਇਮੈਂਟ ਡਿਫਾਲਟ ਸਰਵਿਸ ਡਿਪਲੌਇਮੈਂਟ ਵਿੰਡੋ ਤੋਂ ਵੱਧ ਸਮਾਂ ਲੈਂਦੇ ਹਨ, ਤਾਂ ਮੌਜੂਦਾ AZD ਰਿਲੀਜ਼ `azd deploy --timeout <seconds>` ਦਾ ਸਮਰਥਨ ਕਰਦੇ ਹਨ।

## ਸਮੱਗਰੀ

- [ਮਾਡਲ ਚੋਣ ਰਣਨੀਤੀ](#ਮਾਡਲ-ਚੋਣ-ਰਣਨੀਤੀ)
- [AI ਮਾਡਲਾਂ ਲਈ AZD ਸੰਰਚਨਾ](#ai-ਮਾਡਲਾਂ-ਲਈ-azd-ਸੰਰਚਨਾ)
- [ਡਿਪਲੌਇਮੈਂਟ ਪੈਟਰਨ](#ਡਿਪਲੌਇਮੈਂਟ-ਪੈਟਰਨ)
- [ਮਾਡਲ ਪ੍ਰਬੰਧਨ](#ਮਾਡਲ-ਪ੍ਰਬੰਧਨ)
- [ਪ੍ਰੋਡਕਸ਼ਨ ਵਿਚਾਰ](#ਪ੍ਰੋਡਕਸ਼ਨ-ਵਿਚਾਰ)
- [ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਨਿਗਰਾਨੀ](#ਮਾਨੀਟਰਿੰਗ-ਅਤੇ-ਨਿਗਰਾਨੀ)

## ਮਾਡਲ ਚੋਣ ਰਣਨੀਤੀ

### Microsoft Foundry ਮਾਡਲ ਮਾਡਲ

ਆਪਣੇ ਯੂਜ਼ ਕੇਸ ਲਈ ਸਹੀ ਮਾਡਲ ਚੁਣੋ:

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

| ਮਾਡਲ ਕਿਸਮ | ਵਰਤੋਂ ਦਾ ਕੇਸ | ਸਿਫ਼ਾਰਸ਼ ਕੀਤੀ ਸਮਰੱਥਾ | ਲਾਗਤ ਬਾਰੇ ਵਿਚਾਰ |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | ਚੈਟ, ਪ੍ਰਸ਼ਨ-ਉੱਤਰ | 10-50 TPM | ਬਹੁਤ ਸਾਰੇ ਵਰਕਲੋਡਾਂ ਲਈ ਲਾਗਤ-ਕੁਸ਼ਲ |
| gpt-4.1 | ਜਟਿਲ ਤਰਕ | 20-100 TPM | ਉੱਚੀ ਲਾਗਤ, ਪ੍ਰੀਮੀਅਮ ਫੀਚਰਾਂ ਲਈ ਵਰਤੋਂ ਕਰੋ |
| text-embedding-3-large | ਖੋਜ, RAG | 30-120 TPM | ਸੈਮਾਂਟਿਕ ਖੋਜ ਅਤੇ ਰੀਟ੍ਰੀਵਲ ਲਈ ਮਜ਼ਬੂਤ ਡਿਫਾਲਟ ਚੋਣ |
| Whisper | ਬੋਲੀ-ਤੋਂ-ਟੈਕਸਟ | 10-50 TPM | ਆਡੀਓ ਪ੍ਰੋਸੈਸਿੰਗ ਵਰਕਲੋਡ |

## AI ਮਾਡਲਾਂ ਲਈ AZD ਸੰਰਚਨਾ

### Bicep ਟੈਂਪਲੇਟ ਸੰਰਚਨਾ

Bicep ਟੈਂਪਲੇਟਾਂ ਰਾਹੀਂ ਮਾਡਲ ਡਿਪਲੌਇਮੈਂਟ ਬਣਾਓ:

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

### ਐਨਵਾਇਰਨਮੈਂਟ ਵੇਰੀਏਬਲ

ਆਪਣੇ ਐਪਲੀਕੇਸ਼ਨ ਦਾ ਐਨਵਾਇਰਨਮੈਂਟ ਸੰਰਚਿਤ ਕਰੋ:

```bash
# .env ਸੰਰਚਨਾ
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

## ਡਿਪਲੌਇਮੈਂਟ ਪੈਟਰਨ

### ਪੈਟਰਨ 1: ਇਕ-ਰੀਜਨ ਡਿਪਲੌਇਮੈਂਟ

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
- ਡਿਵੈਲਪਮੈਂਟ ਅਤੇ ਟੈਸਟਿੰਗ
- ਇੱਕ-ਬਜ਼ਾਰ ਐਪਲੀਕੇਸ਼ਨਾਂ
- ਲਾਗਤ ਅਪਟੀਮਾਈਜ਼ੇਸ਼ਨ

### ਪੈਟਰਨ 2: ਬਹੁ-ਰੀਜਨ ਡਿਪਲੌਇਮੈਂਟ

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
- ਗਲੋਬਲ ਐਪਲੀਕੇਸ਼ਨਾਂ
- ਉੱਚ ਉਪਲਬਧਤਾ ਦੀਆਂ ਜ਼ਰੂਰਤਾਂ
- ਲੋਡ ਫੈਲਾਵ

### ਪੈਟਰਨ 3: ਹਾਇਬ੍ਰਿਡ ਡਿਪਲੌਇਮੈਂਟ

Microsoft Foundry ਮਾਡਲਾਂ ਨੂੰ ਹੋਰ AI ਸੇਵਾਵਾਂ ਨਾਲ ਜੋੜੋ:

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

ਆਪਣੀ AZD ਸੰਰਚਨਾ ਵਿੱਚ ਮਾਡਲ ਵਰਜਨਾਂ ਨੂੰ ਟ੍ਰੈਕ ਕਰੋ:

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

ਮਾਡਲ ਅੱਪਡੇਟਸ ਲਈ AZD hooks ਦੀ ਵਰਤੋਂ ਕਰੋ:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"

# ਜੇ ਡਿਪਲੌਇਮੈਂਟ ਡਿਫੌਲਟ ਟਾਈਮਆਉਟ ਤੋਂ ਲੰਬਾ ਸਮਾਂ ਲੈਂਦੀ ਹੈ
azd deploy --timeout 1800
```

### A/B ਟੈਸਟਿੰਗ

ਕਈ ਮਾਡਲ ਵਰਜਨਾਂ ਨੂੰ ਡਿਪਲੌਇ ਕਰੋ:

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

ਉਪਯੋਗ ਪੈਟਰਨਾਂ ਆਧਾਰਿਤ ਲੋੜੀਂਦੀ ਸਮਰੱਥਾ ਦੀ ਗਣਨਾ ਕਰੋ:

```python
# ਛਮਤਾ ਦੀ ਗਣਨਾ ਦੀ ਮਿਸਾਲ
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

# ਇਸਤਮਾਲ ਦੀ ਉਦਾਹਰਨ
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### ਆਟੋ-ਸਕੇਲਿੰਗ ਸੰਰਚਨਾ

Container Apps ਲਈ ਆਟੋ-ਸਕੇਲਿੰਗ ਸੰਰਚਿਤ ਕਰੋ:

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

## ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਨਿਗਰਾਨੀ

### Application Insights ਇੰਟਿਗ੍ਰੇਸ਼ਨ

AI ਵਰਕਲੋਡਾਂ ਲਈ ਮਾਨੀਟਰਿੰਗ ਸੰਰਚਿਤ ਕਰੋ:

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

AI-ਨਿਰਧਾਰਿਤ ਮੈਟ੍ਰਿਕਸ ਨੂੰ ਟ੍ਰੈਕ ਕਰੋ:

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

AI ਸੇਵਾ ਦੀ ਸਿਹਤ ਨਿਗਰਾਨੀ ਲਾਗੂ ਕਰੋ:

```python
# ਸਿਹਤ ਜਾਂਚ ਦੇ ਐਂਡਪੋਇੰਟ
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

1. **[Microsoft Foundry ਇੰਟਿਗ੍ਰੇਸ਼ਨ ਗਾਈਡ](microsoft-foundry-integration.md)** ਨੂੰ ਸੇਵਾ ਇੰਟਿਗ੍ਰੇਸ਼ਨ ਪੈਟਰਨਾਂ ਲਈ ਸਮੀਖਿਆ ਕਰੋ
2. **[AI ਵਰਕਸ਼ਾਪ ਲੈਬ](ai-workshop-lab.md)** ਨੂੰ ਹੱਥੋਂ-ਹੱਥ ਅਨੁਭਵ ਲਈ ਪੂਰਾ ਕਰੋ
3. **[ਪ੍ਰੋਡਕਸ਼ਨ AI ਅਭਿਆਸ](production-ai-practices.md)** ਨੂੰ ਐਂਟਰਪ੍ਰਾਈਜ਼ ਡਿਪਲੌਇਮੈਂਟਸ ਲਈ ਲਾਗੂ ਕਰੋ
4. **[AI ਟ੍ਰਬਲਸ਼ੂਟਿੰਗ ਗਾਈਡ](../chapter-07-troubleshooting/ai-troubleshooting.md)** ਨੂੰ ਆਮ ਸਮੱਸਿਆਵਾਂ ਲਈ ਵੇਖੋ

## ਸਰੋਤ

- [Microsoft Foundry ਮਾਡਲਾਂ ਦੀ ਉਪਲਬਧਤਾ](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI ਡੌਕਯੂਮੈਂਟੇਸ਼ਨ](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps ਸਕੇਲਿੰਗ](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI ਮਾਡਲ ਲਾਗਤ ਅਪਟੀਮਾਈਜ਼ੇਸ਼ਨ](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**ਚੈਪਟਰ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD ਲਈ ਸ਼ੁਰੂਆਤੀ](../../README.md)
- **📖 ਮੌਜੂਦਾ ਚੈਪਟਰ**: ਅਧਿਆਇ 2 - AI-ਪਹਿਲਾ ਵਿਕਾਸ
- **⬅️ ਪਿਛਲਾ**: [Microsoft Foundry ਇੰਟਿਗ੍ਰੇਸ਼ਨ](microsoft-foundry-integration.md)
- **➡️ ਅਗਲਾ**: [AI ਵਰਕਸ਼ਾਪ ਲੈਬ](ai-workshop-lab.md)
- **🚀 ਅਗਲਾ ਅਧਿਆਇ**: [ਅਧਿਆਇ 3: ਕਨਫਿਗਰੇਸ਼ਨ](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ਅਸਵੀਕਾਰ**:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਹਾਲਾਂਕਿ ਅਸੀਂ ਸ਼ੁੱਧਤਾ ਲਈ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸੁਚਿੱਤਤਾ ਹੋ ਸਕਦੀ ਹੈ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਆਪਣੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਿਤ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣا ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਿਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਕਾਰਨ ਦੇ ਹੋਣ ਵਾਲੇ ਕਿਸੇ ਵੀ ਗਲਤਫਹਮੀ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->