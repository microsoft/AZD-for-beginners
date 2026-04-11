# Azure Developer CLI ဖြင့် AI မော်ဒယ် တပ်ဆင်ခြင်း

**အခန်း လမ်းကြောင်း:**
- **📚 သင်တန်း မူလစာမျက်နှာ**: [စတင်သူများအတွက် AZD](../../README.md)
- **📖 လက်ရှိ အခန်း**: အခန်း 2 - AI-First ဖွံ့ဖြိုးရေး
- **⬅️ ယခင်**: [Microsoft Foundry ပေါင်းစည်းရေး လမ်းညွှန်ချက်](microsoft-foundry-integration.md)
- **➡️ နောက်တစ်ခု**: [AI အလုပ်ရုံလေ့ကျင့်ခန်း](ai-workshop-lab.md)
- **🚀 နောက်သော အခန်း**: [အခန်း 3: ဖော်မတ်ပြင်ဆင်မှု](../chapter-03-configuration/configuration.md)

ဤလမ်းညွှန်သည် AZD တမ်းပလိတ်များကို အသုံးပြု၍ AI မော်ဒယ်များကို တပ်ဆင်ရန် အပြည့်အစုံ နည်းလမ်းများကို ပေးပါသည်။ မော်ဒယ် ရွေးချယ်ခြင်းမှ စ၍ ထုတ်လုပ်ရေး တပ်ဆင်မှု နမူနာများထိ အားလုံးကို ဖော်ပြထားသည်။

> **အတည်ပြုမှတ်ချက် (2026-03-25):** ဤလမ်းညွှန်ထဲရှိ AZD လုပ်ငန်းစဉ်ကို `azd` `1.23.12` နှင့် စစ်ဆေးထားပါသည်။ ဝန်ဆောင်မှု၏ မူလ တပ်ဆင်ချိန်ကာလထက် ပိုကြာသော AI တပ်ဆင်မှုများအတွက်၊ လက်ရှိ AZD ထုတ်ပေါ်မှုများတွင် `azd deploy --timeout <seconds>` ကို ထောက်ပံ့သည်။

## အပိုင်းစာရင်း

- [မော်ဒယ် ရွေးချယ်မှု မဟာဗျူဟာ](#မော်ဒယ်-ရွေးချယ်မှု-မဟာဗျူဟာ)
- [AI မော်ဒယ်များအတွက် AZD ဖော်မတ်](#ai-မော်ဒယ်များအတွက်-azd-ဖော်မတ်)
- [တပ်ဆင်မှု နမူနာများ](#တပ်ဆင်မှု-နမူနာများ)
- [မော်ဒယ် စီမံခန့်ခွဲမှု](#မော်ဒယ်-စီမံခန့်ခွဲမှု)
- [ထုတ်လုပ်ရေး စဉ်းစားချက်များ](#ထုတ်လုပ်ရေး-စဉ်းစားချက်များ)
- [စောင့်ကြည့်ခြင်းနှင့် မြင်ကွင်းရရှိနိုင်မှု](#စောင့်ကြည့်ခြင်းနှင့်-မြင်ကွင်းရရှိနိုင်မှု)

## မော်ဒယ် ရွေးချယ်မှု မဟာဗျူဟာ

### Microsoft Foundry မော်ဒယ်များ

သင့် အသုံးပြုမှုအတွက် အမှန်ဆုံး မော်ဒယ်ကို ရွေးချယ်ပါ။

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

### မော်ဒယ် စွမ်းရည် စီမံခန့်ခွဲမှု

| မော်ဒယ် အမျိုးအစား | အသုံးချမှု | အကြံပြု စွမ်းရည် | ကုန်ကျစရိတ် စဉ်းစားချက်များ |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | စကားပြော၊ မေး-ဖြေ | 10-50 TPM | အလုပ်ပိုင်းအများစုအတွက် ကုန်ကျစရိတ်ထက်သင့်တော်သည် |
| gpt-4.1 | ရှုပ်ထွေးသော စဉ်းစားချက်များ | 20-100 TPM | ကုန်ကျစရိတ် မြင့်၊ အထူး အင်္ဂါရပ်များအတွက် အသုံးပြုပါ |
| text-embedding-3-large | ရှာဖွေရေး၊ RAG | 30-120 TPM | စာလုံးအဓိပ္ပာယ် ရှာဖွေမှုနှင့် ရယူမှုအတွက် ပုံမှန်အားဖြင့် ခိုင်မာသော ရွေးချယ်မှု |
| Whisper | အသံမှစာသားပြောင်းခြင်း | 10-50 TPM | အသံ ကိုင်တွယ်မှု အလုပ်များအတွက် |

## AI မော်ဒယ်များအတွက် AZD ဖော်မတ်

### Bicep တမ်းပလိတ် ဖော်မတ်

Bicep တမ်းပလိတ်များမှတဆင့် မော်ဒယ် တပ်ဆင်မှုများကို ဖန်တီးပါ။

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

### ပတ်ဝန်းကျင် လက္ခဏာများ

သင့် အက်ပလီကေးရှင်း ပတ်ဝန်းကျင်ကို ပြင်ဆင်ပါ။

```bash
# .env ဖိုင် ဆက်တင်
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

## တပ်ဆင်မှု နမူနာများ

### ပုံစံ 1: တစ်ဒေသတည်း တပ်ဆင်ခြင်း

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

အကောင်းဆုံး အသုံးချရန်:
- ဖွံ့ဖြိုးရေးနှင့် စမ်းသပ်ခြင်း
- တစ်ဈေးကွက် အပလီကေးရှင်းများ
- ကုန်ကျစရိတ် အကောင်းဆုံး ပြုပြင်ခြင်း

### ပုံစံ 2: မျိုးစုံဒေသ တပ်ဆင်ခြင်း

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

အကောင်းဆုံး အသုံးချရန်:
- ကမ္ဘာလုံးဆိုင်ရာ အပလီကေးရှင်းများ
- မြင့်မားသော ရရှိနိုင်ရေး လိုအပ်ချက်များ
- ဘလော့ဒ် ဖြန့်ဝေခြင်း

### ပုံစံ 3: ပေါင်းစပ် တပ်ဆင်ခြင်း

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

AZD ဖော်မတ်တွင် မော်ဒယ် ဗားရှင်းများကို လိုက်လံ စောင့်ကြည့်ပါ။

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

မော်ဒယ် အပ်ဒိတ်များအတွက် AZD hooks များကို အသုံးပြုပါ။

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"

# တပ်ဆင်ခြင်းသည် မူလ အချိန်ကုန်ဆုံးချိန်ထက် ကြာပါက
azd deploy --timeout 1800
```

### A/B စမ်းသပ်ခြင်း

မော်ဒယ် ဗားရှင်း များ အတူတကွ တပ်ဆင်ပါ။

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

## ထုတ်လုပ်ရေး စဉ်းစားချက်များ

### စွမ်းရည် စီမံခန့်ခွဲမှု

အသုံးပြုမှု ပုံစံအပေါ် အခြေခံ၍ လိုအပ်သော စွမ်းရည်ကို တိုင်းတာပါ။

```python
# စွမ်းဆောင်ရည် တွက်ချက်ခြင်း ဥပမာ
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

# အသုံးပြုခြင်း ဥပမာ
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### အလိုအလျောက် တိုးချဲ့မှု ဖော်မတ်ဆက်တင်

Container Apps အတွက် အလိုအလျောက် တိုးချဲ့မှုကို ဖော်ပြပါ။

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

### ကုန်ကျစရိတ် အကောင်းဆုံး ပြုလုပ်ခြင်း

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

## စောင့်ကြည့်ခြင်းနှင့် မြင်ကွင်းရရှိနိုင်မှု

### Application Insights ပေါင်းစည်းခြင်း

AI အလုပ်အကိုင်များအတွက် စောင့်ကြည့်မှုကို ဖော်ပြပါ။

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

### စိတ်ကြိုက် အတိုင်းအတာများ

AI အထူး အတိုင်းအတာများကို မှတ်တမ်းတင်ပြီး လိုက်လံစောင့်ကြည့်ပါ။

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

AI ဝန်ဆောင်မှု ကျန်းမာရေး စောင့်ကြည့်မှုကို အကောင်အထည်ဖော်ပါ။

```python
# ကျန်းမာရေး စစ်ဆေးရန် endpoint များ
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # OpenAI ချိတ်ဆက်မှု စမ်းသပ်ခြင်း
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

## နောက်ဆက်တွဲ လှမ်းများ

1. **[Microsoft Foundry ပေါင်းစည်းရေး လမ်းညွှန်ချက်](microsoft-foundry-integration.md) ကို ဝန်ဆောင်မှု ပေါင်းစည်းမှု နမူနာများအတွက် သုံးသပ်ပါ**
2. **[AI အလုပ်ရုံလေ့ကျင့်ခန်း](ai-workshop-lab.md) ကို လက်တွေ့ အတွေ့အကြုံ ရရှိစေရန် ပြီးဆုံးပါ**
3. **[ထုတ်လုပ်ရေး AI လေ့လာမှုများ](production-ai-practices.md) ကို ကုမ္ပဏီအဆင့် တပ်ဆင်မှုများအတွက် အကောင်အထည်ဖော်ပါ**
4. **ပုံမှန် ပြဿနာများအတွက် [AI Troubleshooting လမ်းညွှန်](../chapter-07-troubleshooting/ai-troubleshooting.md) ကို လေ့လာပါ**

## ရင်းမြစ်များ

- [Microsoft Foundry မော်ဒယ်များ ရရှိနိုင်မှု](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI စာရွက်စာတမ်း](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps အရွယ်ချိန် တိုးချဲ့ခြင်း](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI မော်ဒယ် ကုန်ကျစရိတ် အကောင်းဆုံး ပြုလုပ်ခြင်း](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**အခန်း လမ်းကြောင်း:**
- **📚 သင်တန်း မူလစာမျက်နှာ**: [စတင်သူများအတွက် AZD](../../README.md)
- **📖 လက်ရှိ အခန်း**: အခန်း 2 - AI-First ဖွံ့ဖြိုးရေး
- **⬅️ ယခင်**: [Microsoft Foundry ပေါင်းစည်းရေး လမ်းညွှန်ချက်](microsoft-foundry-integration.md)
- **➡️ နောက်တစ်ခု**: [AI အလုပ်ရုံလေ့ကျင့်ခန်း](ai-workshop-lab.md)
- **🚀 နောက်သော အခန်း**: [အခန်း 3: ဖော်မတ်ပြင်ဆင်မှု](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**တာဝန်ပယ်ချုပ်ချက်**:
ဤစာတမ်းကို AI ဘာသာပြန် ၀န်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ဖြင့် ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးစားသော်လည်း အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါရှိနိုင်ကြောင်း သတိပေးလိုပါသည်။ မူရင်းစာတမ်းကို မူလဘာသာဖြင့် ရှိသည့် အာဏာပိုင် အရင်းအမြစ် အဖြစ် ယူဆသင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူဘာသာပြန် တစ်ဦးအား အသုံးပြု၍ ဘာသာပြန်ရန် အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုသောကြောင့် ဖြစ်ပျက်နိုင်သည့် နားမလည်မှုများ သို့မဟုတ် အဓိပ္ပာယ်မှားယွင်းမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->