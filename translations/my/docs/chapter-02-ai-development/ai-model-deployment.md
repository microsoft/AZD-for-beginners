# Azure Developer CLI ဖြင့် AI မော်ဒယ် တပ်ဆင်ခြင်း

**အခန်း လမ်းညွှန်မှု:**
- **📚 သင်တန်း မူလစာမျက်နှာ**: [AZD စတင်လေ့လာသူများ](../../README.md)
- **📖 လက်ရှိ အခန်း**: အခန်း 2 - AI-ဦးစားပေး ဖွံ့ဖြိုးတိုးတက်ရေး
- **⬅️ ယခင်**: [Microsoft Foundry ပေါင်းစည်းခြင်း](microsoft-foundry-integration.md)
- **➡️ နောက်တစ်ခု**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 နောက်တစ်အခန်း**: [အခန်း 3: ဖွဲ့စည်းခြင်း](../chapter-03-configuration/configuration.md)

ဤလမ်းညွှန်သည် AZD စံနမူနာများ အသုံးပြု၍ AI မော်ဒယ်များကို တပ်ဆင်နည်းများကို ဆက်လက်ဖော်ပြထားပြီး မော်ဒယ် ရွေးချယ်ခြင်းမှ စ၍ ထုတ်လုပ်မှု ဖြန့်ချိမှု ပုံစံများအထိ အပြည့်အစုံ သင်ကြားပေးပါသည်။

## အကြောင်းအရာ စာရင်း

- [မော်ဒယ် ရွေးချယ်မှု မဟာဗျုဟာ](#မော်ဒယ်-ရွေးချယ်မှု-မဟာဗျုဟာ)
- [AZD ဖော်ပြချက် (AI မော်ဒယ်များအတွက်)](#azd-ဖော်ပြချက်-ai-မော်ဒယ်များအတွက်)
- [ဖြန့်ချိမှု ပုံစံများ](#ဖြန့်ချိမှု-ပုံစံများ)
- [မော်ဒယ် စီမံခန့်ခွဲမှု](#မော်ဒယ်-စီမံခန့်ခွဲမှု)
- [ထုတ်လုပ်ရေး ဆိုင်ရာ အတွေးအခေါ်များ](#ထုတ်လုပ်ရေးဆိုင်ရာ-အကြံပြုချက်များ)
- [စောင့်ကြည့်မှုနှင့် မြင်သာခြင်း](#စောင့်ကြည့်မှုနှင့်-မြင်သာခြင်း)

## မော်ဒယ် ရွေးချယ်မှု မဟာဗျုဟာ

### Microsoft Foundry မော်ဒယ် မော်ဒယ်

သင့် အသုံးအတွက် သင့်တော်သည့် မော်ဒယ်ကို ရွေးချယ်ပါ။

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

### မော်ဒယ် စွမ်းဆောင်ရည် စီမံချက်

| Model Type | Use Case | Recommended Capacity | Cost Considerations |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | စကားပြော၊ မေး-ဖြေ | 10-50 TPM | များသော အလုပ်ပမာဏများအတွက် စျေးနှုန်း သင့်တော်သည် |
| gpt-4.1 | ရှုပ်ထွေးသော အတွေးခေါက်ချက်များ | 20-100 TPM | စျေးနှုန်း မြင့်သည်၊ ထူးချွန်သော လက္ခဏာများအတွက် အသုံးပြုပါ |
| Text-embedding-ada-002 | ရှာဖွေမှု၊ RAG | 30-120 TPM | အနက်ရင်း ရှာဖွေမှုအတွက် အရေးပါတာ |
| Whisper | အသံမှ စာသားပြောင်းခြင်း | 10-50 TPM | အသံကိုင်တွယ်ဆောင်ရွက်မှု အလုပ်ပမာဏများအတွက် |

## AZD ဖော်ပြချက် (AI မော်ဒယ်များအတွက်)

### Bicep Template Configuration

Bicep ပုံစံများမှတဆင့် မော်ဒယ် ဖြန့်ချိမှုများ ဖန်တီးပါ။

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

### ပတ်ဝန်းကျင် တန်ဖိုးများ

သင့် အက်ပလီကေးရှင်း ပတ်ဝန်းကျင်ကို ဖော်ပြပါ။

```bash
# .env ဖိုင် ဆက်တင်များ
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## ဖြန့်ချိမှု ပုံစံများ

### ပုံစံ 1: တစ်တိုင်းဒေသ ဖြန့်ချိခြင်း

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

အကောင်းဆုံး သင့်လျော်သည်:
- ဖွံ့ဖြိုးရေး နှင့် စမ်းသပ်ခြင်း
- တစ်ဈေးကွက် အက်ပလီကေးရှင်းများ
- ကုန်ကျစရိတ် ထိရောက်စွာ စီမံခြင်း

### ပုံစံ 2: မျိုးနယ်များ (Multi-Region) ဖြန့်ချိခြင်း

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

အကောင်းဆုံး သင့်လျော်သည်:
- ကမ္ဘာလုံးဆိုင်ရာ အက်ပလီကေးရှင်းများ
- မြင့်မားသော ရရှိနိုင်မှု လိုအပ်ချက်များ
- တင်ပို့ အလေးချိန် ဖြန့်ဝေခြင်း

### ပုံစံ 3: ဟိုက်ဘရစ် ဖြန့်ချိမှု

Microsoft Foundry မော်ဒယ်များကို အခြား AI ဝန်ဆောင်မှုများနှင့် ပေါင်းစည်းပါ။

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

## မော်ဒယ် စီမံခန့်ခွဲမှု

### ဗားရှင်း ထိန်းချုပ်မှု

AZD ဖော်ပြချက်အတွင်း မော်ဒယ် ဗားရှင်းများကို လိုက်လံထိန်းသိမ်းပါ။

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

### မော်ဒယ် အပ်ဒိတ်များ

မော်ဒယ် အပ်ဒိတ်များအတွက် AZD hooks ကို အသုံးပြုပါ။

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"
```

### A/B စမ်းသပ်မှု

မော်ဒယ် ဗားရှင်းများစွာ ကို တပ်ဆင်ပါ။

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

## ထုတ်လုပ်ရေးဆိုင်ရာ အကြံပြုချက်များ

### စွမ်းဆောင်ရည် စီမံချက်

အသုံးပြုမှုပုံစံအပေါ် မူတည်၍ လိုအပ်သည့် စွမ်းဆောင်ရည်ကို တွက်ချက်ပါ။

```python
# စွမ်းရည် တွက်ချက်ခြင်း ဥပမာ
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

# အသုံးပြုနည်း ဥပမာ
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### Auto-scaling ဖော်ပြချက်

Container Apps များအတွက် auto-scaling ကို ဖော်ပြပါ။

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

### ကုန်ကျစရိတ် ထိရောက်စွာ စီမံခြင်း

ကုန်ကျစရိတ် ထိန်းချုပ်မှုများကို အကောင်အထည်ဖော်ပါ။

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

## စောင့်ကြည့်မှုနှင့် မြင်သာခြင်း

### Application Insights ပေါင်းစည်းခြင်း

AI အလုပ်ပမာဏများအတွက် စောင့်ကြည့်မှုကို ဖော်ပြပါ။

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

### စိတ်ကြိုက် မီထရစ်များ

AI သီးသန့် မီထရစ်များကို လိုက်လံ တိုက်တာပါ။

```python
# AI မော်ဒယ်များအတွက် စိတ်ကြိုက် တယ်လီမက်ထရီ
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

### ကျန်းမာရေး စစ်ဆေးမှုများ

AI ဝန်ဆောင်မှုများ၏ ကျန်းမာရေး စောင့်ကြည့်မှုကို အကောင်အထည်ဖော်ပါ။

```python
# ကျန်းမာရေး စစ်ဆေးခြင်း endpoint များ
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # OpenAI ချိတ်ဆက်မှုကို စမ်းသပ်ခြင်း
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

## နောက်လှုပ်ရှားရန် အဆင့်များ

1. **ဝန်ဆောင်မှု ပေါင်းစည်းမှု ပုံစံများအတွက် [Microsoft Foundry ပေါင်းစည်းခြင်း လမ်းညွှန်](microsoft-foundry-integration.md) ကို ပြန်လည် သုံးသပ်ပါ**
2. **လက်တွေ့လေ့ကျင့်ခြင်း အတွေ့အကြုံ ရရှိရန် [AI Workshop Lab](ai-workshop-lab.md) ကို ပြီးစီးပါ**
3. **လုပ်ငန်းစီးပွားရေး ဖြန့်ချိမှုများအတွက် [Production AI Practices](production-ai-practices.md) ကို အကောင်အထည်ဖော်ပါ**
4. **ပုံမှန် ပြဿနာများအတွက် [AI Troubleshooting Guide](../chapter-07-troubleshooting/ai-troubleshooting.md) ကို ရှာဖွေပါ**

## အရင်းအမြစ်များ

- [Microsoft Foundry မော်ဒယ် ရရှိနိုင်မှု](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI စာတမ်းများ](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps အရွယ်ချိန်](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI မော်ဒယ် ကုန်ကျစရိတ် ထိရောက်စွာ စီမံခြင်း](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**အခန်း လမ်းညွှန်မှု:**
- **📚 သင်တန်း မူလစာမျက်နှာ**: [AZD စတင်လေ့လာသူများ](../../README.md)
- **📖 လက်ရှိ အခန်း**: အခန်း 2 - AI-ဦးစားပေး ဖွံ့ဖြိုးတိုးတက်ရေး
- **⬅️ ယခင်**: [Microsoft Foundry ပေါင်းစည်းခြင်း](microsoft-foundry-integration.md)
- **➡️ နောက်တစ်ခု**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 နောက်တစ်အခန်း**: [အခန်း 3: ဖွဲ့စည်းခြင်း](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် မှန်ကန်မှုအတွက် ကြိုးပမ်းပေမယ့် အလိုအလျောက် ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါဝင်နိုင်ကြောင်း ကျေးဇူးပြု၍ သိရှိပါ။ မူလစာတမ်းကို မူလဘာသာဖြင့်သာ အာဏာပိုင် ရင်းမြစ်အဖြစ် ယူဆရန် တိုက်တွန်းပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူဘာသာပြန်ဝန်ဆောင်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းကြောင့် ဖြစ်ပေါ်လာနိုင်သည့် နားမလည်မှုများ သို့မဟုတ် မှားယွင်းသော အဓိပ္ပာယ်ဖော်ပြချက်များအတွက် ကျွန်ုပ်တို့ တာဝန်ခံမည်မဟုတ်ပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->