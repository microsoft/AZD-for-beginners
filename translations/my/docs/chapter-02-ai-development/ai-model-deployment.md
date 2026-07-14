# Azure Developer CLI ဖြင့် AI မော်ဒယ် မိတ်ဆက်ခြင်း

**အခန်းလမ်းညွှန်:**
- **📚 သင်ခန်းစာအိမ်**: [AZD စတင်လိုသူများအတွက်](../../README.md)
- **📖 လက်ရှိအခန်း**: အခန်း ၂ - AI-ဦးစားပေးဖွံ့ဖြိုးတိုးတက်မှု
- **⬅️ ယခက**: [Microsoft Foundry ပေါင်းစည်းခြင်း](microsoft-foundry-integration.md)
- **➡️ နောက်တစ်ခန်း**: [AI အလုပ်ရုံပြင်လေ့ကျင့်မှု](ai-workshop-lab.md)
- **🚀 နောက်တစ်ခန်း**: [အခန်း ၃: ဖွဲ့တည်မှု](../chapter-03-configuration/configuration.md)

ဤလမ်းညွှန်သည် AZD စံနမူနာများကို အသုံးပြု၍ AI မော်ဒယ်များကို ဖြန့်ချိရန် စုံလင်သော အညွှန်းများကို ပေးပြီး မော်ဒယ် ရွေးချယ်မှုမှ စပြီး ထုတ်လုပ်မှု ဖြန့်ချိမှု ပုံစံများအထိ ဖော်ပြထားသည်။

> **အတည်ပြုမှတ်ချက် (၂၀၂၆-၀၇-၁၃):** ဤလမ်းညွှန်ရှိ AZD လုပ်ဆောင်မှုစဥ်ကို `azd` `1.27.1` နှင့် စမ်းသပ်ပြီးဖြစ်သည်။ နေရာချိန်သတ်မှတ်ချက် ပုံမှန် ဝန်ဆောင်မှု ဖြန့်ချိမှု ထက်ကြာမြင့်သော AI ဖြန့်ချိမှုများအတွက် လက်ရှိ AZD ဗားရှင်းများသည် `azd deploy --timeout <seconds>` ကို ထောက်ခံသည်။

## အကြောင်းအရာ စာရင်း

- [မော်ဒယ် ရွေးချယ်မှု မဟာဗျူဟာ](#မော်ဒယ်-ရွေးချယ်မှု-မဟာဗျူဟာ)
- [AI မော်ဒယ်များအတွက် AZD ဖွဲ့တည်မှု](#ai-မော်ဒယ်များအတွက်-azd-ဖွဲ့တည်မှု)
- [ဖြန့်ချိမှု ပုံစံများ](#ဖြန့်ချိမှု-ပုံစံများ)
- [မော်ဒယ် စီမံခန့်ခွဲမှု](#မော်ဒယ်-စီမံခန့်ခွဲမှု)
- [ထုတ်လုပ်မှု စဉ်းစားချက်များ](#ထုတ်လုပ်မှု-စဉ်းစားချက်များ)
- [စောင့်ကြည့်မှု နှင့် မြင်သာမှု](#စောင့်ကြည့်မှု-နှင့်-မြင်သာမှု)

## မော်ဒယ် ရွေးချယ်မှု မဟာဗျူဟာ

### Microsoft Foundry မော်ဒယ်များ မော်ဒယ်များ

သင့်အသုံးပြုမှုအတွက် မှန်ကန်သော မော်ဒယ်ကို ရွေးချယ်ပါ။

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

### မော်ဒယ် စွမ်းဆောင်ရည် စီမံခန့်ခွဲမှု

| မော်ဒယ် အမျိုးအစား | အသုံးပြုမှု | အကြံပြု စွမ်းဆောင်ရည် | ကုန်ကျစရိတ် စဉ်းစားချက် |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | စကားပြော, မေးမြန်းဖြေကြားမှု | 10-50 TPM | အများဆုံး အလုပ်များအတွက် ကုန်ကျစရိတ်ထိရောက်မှုရှိသည် |
| gpt-4.1 | ခက်ခဲသော အတွေးအခေါ် | 20-100 TPM | ကုန်ကျစရိတ်များ၊ ထူးချွန်သော လုပ်ဆောင်ချက်များအတွက် အသုံးပြုပါ |
| text-embedding-3-large | ရှာဖွေမှု, RAG | 30-120 TPM | စာလုံးအဓိပ္ပါယ် ရှာဖွေရန်နှင့် ပြန်လည်ယူဆောင်ရန် အခြေခံရွေးချယ်မှု |
| Whisper | အသံမှ စာသားသို့ | 10-50 TPM | အသံကောက်ယူမှု လုပ်ငန်းများအတွက် |

## AI မော်ဒယ်များအတွက် AZD ဖွဲ့တည်မှု

### Bicep စံနမူနာ ဖွဲ့တည်မှု

Bicep စံနမူနာများဖြင့် မော်ဒယ် ဖြန့်ချိမှုများ ဖန်တီးပါ။

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

### ပတ်ဝန်းကျင် အပြောင်းအလဲများ

သင်၏ အက်ပလီကေးရှင်း ပတ်ဝန်းကျင်ကို ဖွဲ့တည်ပါ။

```bash
# .env ဖိုင် ဆက်တင်မှု
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

## ဖြန့်ချိမှု ပုံစံများ

### ပုံစံ ၁: တစ်တိုင်းဒေသ ဖြန့်ချိမှု

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

အကောင်းဆုံးအတွက် -
- ဖွံ့ဖြိုးတိုးတက်မှုနှင့် စမ်းသပ်မှု
- တစ်ဈေးကွက် အက်ပလီကေးရှင်းများ
- ကုန်ကျစရိတ် ထိရောက်မှု

### ပုံစံ ၂: မျိုးစုံတိုင်းဒေသ ဖြန့်ချိမှု

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

အကောင်းဆုံးအတွက် -
- ကမ္ဘာအနှံ့ အက်ပလီကေးရှင်းများ
- မြင့်မားသော ရရှိနိုင်မှု လိုအပ်ချက်များ
- ပမာဏ ခွဲဝေမှု

### ပုံစံ ၃: တွဲဖက် ဖြန့်ချိမှု

Microsoft Foundry မော်ဒယ်များကို အခြား AI ဝန်ဆောင်မှုများနှင့် တွဲဖက်ခြင်း

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

သင့် AZD ဖွဲ့တည်မှုတွင် မော်ဒယ် ဗားရှင်းများကို ခြေရာခံပါ။

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

### မော်ဒယ် အပ်ဒိတ်များ

မော်ဒယ် အပ်ဒိတ်များအတွက် AZD ကွက်တိများကို အသုံးပြုပါ။

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"

# ပုံမှန် Timeout ထက် တာရွည်လွန်ပါကချိန်ကန့်သတ်မှုရှိပါက
azd deploy --timeout 1800
```

### A/B စမ်းသပ်ခြင်း

မော်ဒယ် ဗားရှင်းများစွာကို ဖြန့်ချိပါ။

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

## ထုတ်လုပ်မှု စဉ်းစားချက်များ

### စွမ်းဆောင်ရည် စီမံခန့်ခွဲမှု

အသုံးများစနစ်အပေါ်မူတည်၍ လိုအပ်သော စွမ်းဆောင်ရည်ကိုတွက်ချက်ပါ။

```python
# စွမ်းဆောင်ရည်တွက်ချက်မှုဥပမာ
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

# အသုံးပြုမှုဥပမာ
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### အလိုအလျောက်ချဲ့ထွင်ခြင်း ဖွဲ့တည်မှု

Container Apps အတွက် အလိုအလျောက် ချဲ့ထွင်မှုကို ဖွဲ့တည်ပါ။

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

### ကုန်ကျစရိတ် ထိရောက်မှု

ကုန်ကျစရိတ် ထိန်းချုပ်မှုများ အကောင်အထည်ဖော်ပါ။

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

## စောင့်ကြည့်မှု နှင့် မြင်သာမှု

### Application Insights ပေါင်းစည်းခြင်း

AI အလုပ်များ အတွက် စောင့်ကြည့်မှုကို ဖွဲ့တည်ပါ။

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

### ကမ္ဘာအတိုင်း မှတ်တမ်းများ

AI ပက်သက်သော မှတ်တမ်းများကို ခြေရာခံပါ။

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

### ကျန်းမာရေး စစ်ဆေးမှုများ

AI ဝန်ဆောင်မှု ကျန်းမာရေး စောင့်ကြည့်မှုကို အကောင်အထည်ဖော်ပါ။

```python
# ကျန်းမာရေးစစ်ဆေးရေးအဆုံးထားများ
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

## နောက်တစ်လှမ်းများ

1. **[Microsoft Foundry ပေါင်းစည်းခြင်း လမ်းညွှန်](microsoft-foundry-integration.md)** ကို ဝန်ဆောင်မှု ပေါင်းစည်းမှု ပုံစံများအတွက် ပြန်လည်စာပေးပါ။
2. **[AI အလုပ်ရုံပြင်လေ့ကျင့်ခန်း](ai-workshop-lab.md)** ကို လက်တွေ့လုပ်ငန်းအတွေ့အကြုံအတွက် ပြီးမြောက်ပါ။
3. **[ထုတ်လုပ်မှု AI လုပ်ထုံးလုပ်နည်းများ](production-ai-practices.md)** ကို စီးပွားရေးဖြန့်ချိမှုများအတွက် အကောင်အထည်ဖော်ပါ။
4. **[AI ပြဿနာဖြေရှင်း လမ်းညွှန်](../chapter-07-troubleshooting/ai-troubleshooting.md)** ကို အထင်ကြီးသော ပြဿနာများအတွက် စူးစမ်းပါ။

## အရင်းအမြစ်များ

- [Microsoft Foundry မော်ဒယ်များ ရရှိနိုင်မှု](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI စာတမ်းများ](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps ချဲ့ထွင်မှု](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI မော်ဒယ် ကုန်ကျစရိတ် ထိရောက်မှု](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**အခန်းလမ်းညွှန်:**
- **📚 သင်ခန်းစာအိမ်**: [AZD စတင်လိုသူများအတွက်](../../README.md)
- **📖 လက်ရှိအခန်း**: အခန်း ၂ - AI-ဦးစားပေးဖွံ့ဖြိုးတိုးတက်မှု
- **⬅️ ယခက**: [Microsoft Foundry ပေါင်းစည်းခြင်း](microsoft-foundry-integration.md)
- **➡️ နောက်တစ်ခန်း**: [AI အလုပ်ရုံပြင်လေ့ကျင့်မှု](ai-workshop-lab.md)
- **🚀 နောက်တစ်ခန်း**: [အခန်း ၃: ဖွဲ့တည်မှု](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ပြောကြားချက်**
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးပမ်းနေသော်လည်း၊ စက်ကိရိယာဘာသာပြန်ခြင်းများတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါဝင်နိုင်ကြောင်း သတိပြုပါရန် လိုအပ်ပါသည်။ မူလစာတမ်းကို မူရင်းဘာသာဖြင့်သာ ယုံကြည်စိတ်ချရသော အချက်အလက်အဖြစ် သတ်မှတ်သင့်သည်။ အရေးကြီးသည့် သတင်းအချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူသားဘာသာပြန်သူဝန်ဆောင်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော နားလည်မှုကွာခြားမှုများ သို့မဟုတ် မမှန်ကန်သော အသုံးပြုမှုများအတွက် ကျွန်ုပ်တို့ တာဝန်မခံပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->