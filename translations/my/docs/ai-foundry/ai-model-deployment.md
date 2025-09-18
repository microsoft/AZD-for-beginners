<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6af361e2339c27aa56a9196e11b32cb7",
  "translation_date": "2025-09-18T13:19:59+00:00",
  "source_file": "docs/ai-foundry/ai-model-deployment.md",
  "language_code": "my"
}
-->
# Azure Developer CLI ဖြင့် AI Model Deployment

**အခန်းအကြောင်းအရာများ:**
- **📚 သင်ခန်းစာအိမ်**: [AZD For Beginners](../../README.md)
- **📖 လက်ရှိအခန်း**: အခန်း 2 - AI-First Development
- **⬅️ ယခင်**: [Azure AI Foundry Integration](azure-ai-foundry-integration.md)
- **➡️ နောက်တစ်ခု**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 နောက်အခန်း**: [အခန်း 3: Configuration](../getting-started/configuration.md)

ဤလမ်းညွှန်သည် AZD templates ကို အသုံးပြု၍ AI models များကို deploy လုပ်ရန်အတွက် လမ်းညွှန်ချက်များကို ပေးထားပြီး၊ model ရွေးချယ်မှုမှ စ၍ production deployment patterns အထိ အကျယ်အဝန်းဖော်ပြထားသည်။

## အကြောင်းအရာများ

- [Model ရွေးချယ်မှုမူဝါဒ](../../../../docs/ai-foundry)
- [AI Models အတွက် AZD Configuration](../../../../docs/ai-foundry)
- [Deployment Patterns](../../../../docs/ai-foundry)
- [Model စီမံခန့်ခွဲမှု](../../../../docs/ai-foundry)
- [Production အတွက်စဉ်းစားရန်အချက်များ](../../../../docs/ai-foundry)
- [Monitoring နှင့် Observability](../../../../docs/ai-foundry)

## Model ရွေးချယ်မှုမူဝါဒ

### Azure OpenAI Models

သင့်အသုံးပြုမှုအတွက် သင့်တော်သော model ကို ရွေးချယ်ပါ:

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

### Model Capacity Planning

| Model အမျိုးအစား | အသုံးပြုမှု | အကြံပြုထားသော Capacity | ကုန်ကျစရိတ်စဉ်းစားမှု |
|------------------|------------|-------------------------|---------------------|
| GPT-4o-mini | Chat, Q&A | 10-50 TPM | အများစု workload များအတွက် စျေးသက်သာ |
| GPT-4 | ရှုပ်ထွေးသော reasoning | 20-100 TPM | စျေးကြီးပြီး premium features အတွက် အသုံးပြုရန် |
| Text-embedding-ada-002 | Search, RAG | 30-120 TPM | semantic search အတွက် မရှိမဖြစ်လိုအပ် |
| Whisper | Speech-to-text | 10-50 TPM | Audio processing workload များအတွက် |

## AI Models အတွက် AZD Configuration

### Bicep Template Configuration

Bicep templates ဖြင့် model deployments ဖန်တီးပါ:

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

### Environment Variables

သင့် application environment ကို configure လုပ်ပါ:

```bash
# .env configuration
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4o-mini
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
      AZURE_OPENAI_CHAT_DEPLOYMENT: gpt-4o-mini
```

သင့်တော်သောအရာများ:
- Development နှင့် testing
- Single-market applications
- ကုန်ကျစရိတ်အတွက် အထူးသက်သာ

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

သင့်တော်သောအရာများ:
- Global applications
- High availability လိုအပ်ချက်များ
- Load distribution

### Pattern 3: Hybrid Deployment

Azure OpenAI ကို အခြား AI services များနှင့် ပေါင်းစပ်အသုံးပြုပါ:

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

## Model စီမံခန့်ခွဲမှု

### Version Control

AZD configuration တွင် model versions များကို track လုပ်ပါ:

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

### Model Updates

Model updates အတွက် AZD hooks ကို အသုံးပြုပါ:

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

Model versions များကို အများအပြား deploy လုပ်ပါ:

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

## Production အတွက်စဉ်းစားရန်အချက်များ

### Capacity Planning

အသုံးပြုမှု pattern များအပေါ်မူတည်၍ လိုအပ်သော capacity ကိုတွက်ချက်ပါ:

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

### Auto-scaling Configuration

Container Apps အတွက် auto-scaling ကို configure လုပ်ပါ:

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

ကုန်ကျစရိတ်ထိန်းချုပ်မှုများကို အကောင်အထည်ဖော်ပါ:

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

## Monitoring နှင့် Observability

### Application Insights Integration

AI workloads အတွက် monitoring ကို configure လုပ်ပါ:

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

AI-specific metrics များကို track လုပ်ပါ:

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

### Health Checks

AI service health monitoring ကို အကောင်အထည်ဖော်ပါ:

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

## နောက်တစ်ဆင့်လုပ်ဆောင်ရန်

1. **[Azure AI Foundry Integration Guide](azure-ai-foundry-integration.md)** ကို ပြန်လည်သုံးသပ်ပြီး service integration patterns များကို လေ့လာပါ
2. **[AI Workshop Lab](ai-workshop-lab.md)** ကို ပြီးမြောက်စေပြီး လက်တွေ့အတွေ့အကြုံရယူပါ
3. **[Production AI Practices](production-ai-practices.md)** ကို အကောင်အထည်ဖော်ပြီး စီးပွားရေးအတွက် deploy လုပ်ပါ
4. **[AI Troubleshooting Guide](../troubleshooting/ai-troubleshooting.md)** ကို လေ့လာပြီး အခက်အခဲများကို ဖြေရှင်းပါ

## Resources

- [Azure OpenAI Model Availability](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps Scaling](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI Model Cost Optimization](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**အခန်းအကြောင်းအရာများ:**
- **📚 သင်ခန်းစာအိမ်**: [AZD For Beginners](../../README.md)
- **📖 လက်ရှိအခန်း**: အခန်း 2 - AI-First Development
- **⬅️ ယခင်**: [Azure AI Foundry Integration](azure-ai-foundry-integration.md)
- **➡️ နောက်တစ်ခု**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 နောက်အခန်း**: [အခန်း 3: Configuration](../getting-started/configuration.md)

---

**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေပါသော်လည်း၊ အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မတိကျမှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာရှိသော ရင်းမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ဘာသာပြန်ပညာရှင်များမှ ပရော်ဖက်ရှင်နယ် ဘာသာပြန်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်မှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအလွတ်များ သို့မဟုတ် အနားလွဲမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။