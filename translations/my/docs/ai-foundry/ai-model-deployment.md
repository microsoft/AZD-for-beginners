# Azure Developer CLI ဖြင့် AI မော်ဒယ်များကို Deploy လုပ်ခြင်း

**အခန်းအကြောင်းအရာများ:**
- **📚 သင်ခန်းစာအိမ်**: [AZD အခြေခံများ](../../README.md)
- **📖 လက်ရှိအခန်း**: အခန်း ၂ - AI-First Development
- **⬅️ အရင်**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ နောက်တစ်ခု**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 နောက်အခန်း**: [အခန်း ၃: Configuration](../getting-started/configuration.md)

ဤလမ်းညွှန်သည် AZD template များကို အသုံးပြု၍ AI မော်ဒယ်များကို deploy လုပ်ခြင်းအတွက် လမ်းညွှန်ချက်များကို စုံလင်စွာပေးထားပြီး မော်ဒယ်ရွေးချယ်မှုမှ စ၍ ထုတ်လုပ်မှု deployment ပုံစံများအထိ အားလုံးကို ဖော်ပြထားသည်။

## အကြောင်းအရာများ

- [မော်ဒယ်ရွေးချယ်မှုမူဝါဒ](../../../../docs/ai-foundry)
- [AI မော်ဒယ်များအတွက် AZD Configuration](../../../../docs/ai-foundry)
- [Deployment ပုံစံများ](../../../../docs/ai-foundry)
- [မော်ဒယ်စီမံခန့်ခွဲမှု](../../../../docs/ai-foundry)
- [ထုတ်လုပ်မှုအတွက်စဉ်းစားရန်အချက်များ](../../../../docs/ai-foundry)
- [ကြည့်ရှုခြင်းနှင့် စောင့်ကြည့်မှု](../../../../docs/ai-foundry)

## မော်ဒယ်ရွေးချယ်မှုမူဝါဒ

### Azure OpenAI မော်ဒယ်များ

သင့်အသုံးပြုမှုအတွက် သင့်တော်သောမော်ဒယ်ကို ရွေးချယ်ပါ:

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

### မော်ဒယ်စွမ်းရည်အစီအစဉ်

| မော်ဒယ်အမျိုးအစား | အသုံးပြုမှု | အကြံပြုထားသောစွမ်းရည် | ကုန်ကျစရိတ်စဉ်းစားမှု |
|--------------------|------------|-----------------------|-------------------|
| GPT-4o-mini | စကားဝိုင်း, Q&A | 10-50 TPM | အများဆုံး workload များအတွက် ကုန်ကျစရိတ်သက်သာမှု |
| GPT-4 | ရှုပ်ထွေးသော အကြောင်းအရာ | 20-100 TPM | ကုန်ကျစရိတ်များသောကြောင့် premium အင်္ဂါရပ်များအတွက် အသုံးပြုပါ |
| Text-embedding-ada-002 | ရှာဖွေမှု, RAG | 30-120 TPM | semantic ရှာဖွေမှုအတွက် မရှိမဖြစ်လိုအပ်သည် |
| Whisper | အသံမှစာသား | 10-50 TPM | အသံကို အလုပ်လုပ်စေသော workload များအတွက် |

## AI မော်ဒယ်များအတွက် AZD Configuration

### Bicep Template Configuration

Bicep template များဖြင့် မော်ဒယ် deployment များကို ဖန်တီးပါ:

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

### ပတ်ဝန်းကျင် Variable များ

သင့် application ပတ်ဝန်းကျင်ကို configure လုပ်ပါ:

```bash
# .env ဖိုင်ဖွဲ့စည်းမှု
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4o-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## Deployment ပုံစံများ

### ပုံစံ ၁: Single-Region Deployment

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
- ဖွံ့ဖြိုးမှုနှင့် စမ်းသပ်မှု
- Single-market application များ
- ကုန်ကျစရိတ်အထိရောက်မှု

### ပုံစံ ၂: Multi-Region Deployment

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
- ကမ္ဘာလုံးဆိုင်ရာ application များ
- အမြင့်ဆုံးရရှိနိုင်မှုလိုအပ်ချက်များ
- Load ဖြန့်ဝေမှု

### ပုံစံ ၃: Hybrid Deployment

Azure OpenAI ကို အခြား AI ဝန်ဆောင်မှုများနှင့် ပေါင်းစပ်ပါ:

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

## မော်ဒယ်စီမံခန့်ခွဲမှု

### ဗားရှင်းထိန်းချုပ်မှု

AZD configuration တွင် မော်ဒယ်ဗားရှင်းများကို ထိန်းချုပ်ပါ:

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

### မော်ဒယ် Update များ

AZD hooks ကို အသုံးပြု၍ မော်ဒယ် update များလုပ်ဆောင်ပါ:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4o-mini']"
```

### A/B စမ်းသပ်မှု

မော်ဒယ်ဗားရှင်းများစွာကို deploy လုပ်ပါ:

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

## ထုတ်လုပ်မှုအတွက်စဉ်းစားရန်အချက်များ

### စွမ်းရည်အစီအစဉ်

အသုံးပြုမှုပုံစံများအပေါ်မူတည်၍ လိုအပ်သောစွမ်းရည်ကိုတွက်ချက်ပါ:

```python
# စွမ်းဆောင်ရည်တွက်ချက်နမူနာ
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

# အသုံးပြုနမူနာ
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

### ကုန်ကျစရိတ်အထိရောက်မှု

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

## ကြည့်ရှုခြင်းနှင့် စောင့်ကြည့်မှု

### Application Insights Integration

AI workload များအတွက် စောင့်ကြည့်မှုကို configure လုပ်ပါ:

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

AI-specific metrics များကို စောင့်ကြည့်ပါ:

```python
# AI မော်ဒယ်များအတွက် စိတ်ကြိုက် တယ်လီမီထရီ
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

AI ဝန်ဆောင်မှု၏ ကျန်းမာရေးကို စောင့်ကြည့်ပါ:

```python
# ကျန်းမာရေးစစ်ဆေးမှုအဆုံးစွန်များ
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # OpenAI ချိတ်ဆက်မှုကို စမ်းသပ်ပါ
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

## နောက်တစ်ဆင့်

1. **[Microsoft Foundry Integration Guide](microsoft-foundry-integration.md)** ကို ပြန်လည်သုံးသပ်ပါ
2. **[AI Workshop Lab](ai-workshop-lab.md)** ကို ပြီးမြောက်ပါ
3. **[Production AI Practices](production-ai-practices.md)** ကို အဖွဲ့အစည်း deployment များအတွက် အကောင်အထည်ဖော်ပါ
4. **[AI Troubleshooting Guide](../troubleshooting/ai-troubleshooting.md)** ကို အများဆုံးပြဿနာများအတွက် လေ့လာပါ

## အရင်းအမြစ်များ

- [Azure OpenAI Model Availability](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps Scaling](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI Model Cost Optimization](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**အခန်းအကြောင်းအရာများ:**
- **📚 သင်ခန်းစာအိမ်**: [AZD အခြေခံများ](../../README.md)
- **📖 လက်ရှိအခန်း**: အခန်း ၂ - AI-First Development
- **⬅️ အရင်**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ နောက်တစ်ခု**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 နောက်အခန်း**: [အခန်း ၃: Configuration](../getting-started/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မမှန်ကန်မှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာတရားရှိသော အရင်းအမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူက ဘာသာပြန်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်မှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအမှားများ သို့မဟုတ် အနားလွဲမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->