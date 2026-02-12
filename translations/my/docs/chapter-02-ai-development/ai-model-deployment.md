# Azure Developer CLI ဖြင့် AI မော်ဒယ် တပ်ဆင်ခြင်း

**အခန်း လမ်းညွှန်:**
- **📚 သင်တန်း မူလ စာမျက်နှာ**: [AZD စတင်လေ့လာသူများ](../../README.md)
- **📖 လက်ရှိ အခန်း**: အခန်း ၂ - AI-ဦးဆောင် ဖွံ့ဖြိုးရေး
- **⬅️ ယခင်**: [Microsoft Foundry ပေါင်းစည်းမှု](microsoft-foundry-integration.md)
- **➡️ နောက်**: [AI လေ့ကျင့်ခန်း](ai-workshop-lab.md)
- **🚀 နောက် အခန်း**: [အခန်း ၃ - ဖွဲ့စည်းမှု](../chapter-03-configuration/configuration.md)

ဤလမ်းညွှန်သည် AZD templates ကို အသုံးပြု၍ AI မော်ဒယ်များကို တပ်ဆင်ရန် မော်ဒယ်ရွေးချယ်ခြင်းမှ ထုတ်လုပ်မှု တပ်ဆင်မှု ပုံစံများအထိ အပြည့်အစုံ ညွှန်ကြားချက်များပေးသည်။

## အကြောင်းအရာများ

- [မော်ဒယ် ရွေးချယ်ရေး မဟာဗျူဟာ](../../../../docs/chapter-02-ai-development)
- [AI မော်ဒယ်များအတွက် AZD ဖွဲ့စည်းမှု](../../../../docs/chapter-02-ai-development)
- [တပ်ဆင်မှု ပုံစံများ](../../../../docs/chapter-02-ai-development)
- [မော်ဒယ် စီမံခန့်ခွဲမှု](../../../../docs/chapter-02-ai-development)
- [ထုတ်လုပ်မှု တွေးခေါ်စရာများ](../../../../docs/chapter-02-ai-development)
- [ကြီးကြပ်ခြင်းနှင့် မြင်နိုင်ခြင်း](../../../../docs/chapter-02-ai-development)

## မော်ဒယ် ရွေးချယ်ရေး မဟာဗျူဟာ

### Azure OpenAI မော်ဒယ်များ

သင့်အသုံးအတွက် သင့်တော်သော မော်ဒယ်ကို ရွေးချယ်ပါ။

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

### မော်ဒယ် စွမ်းရည် စီစဉ်ခြင်း

| မော်ဒယ် အမျိုးအစား | အသုံးအပ်မှု | အကြံပြုသည့် စွမ်းရည် | ကုန်ကျစရိတ် သတိပြုရန်များ |
|------------|----------|---------------------|-------------------|
| GPT-4o-mini | စကားပြောနှင့် မေး-ဖြေ | 10-50 TPM | အများစု အလုပ်များအတွက် ကုန်ကျစရိတ် ထိရောက်မှုရှိသည် |
| GPT-4 | ရှုပ်ထွေးသော အတွေးအခေါ် | 20-100 TPM | ကုန်ကျစရိတ် မြင့်မားပြီး အထူး လက္ခဏာများအတွက် အသုံးပြုရန် |
| Text-embedding-ada-002 | ရှာဖွေခြင်း၊ RAG | 30-120 TPM | သဘောတရားဆိုင်ရာ ရှာဖွေမှု အတွက် အဓိကလိုအပ်သည် |
| Whisper | စကားမှ စာသား သို့ | 10-50 TPM | အသံ ဆိုင်ရာ လုပ်ငန်းများ |

## AI မော်ဒယ်များအတွက် AZD ဖွဲ့စည်းမှု

### Bicep Template ဖွဲ့စည်းခြင်း

Bicep templates များဖြင့် မော်ဒယ် တပ်ဆင်မှုများကို ဖန်တီးပါ။

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

### ပတ်ဝန်းကျင် သတ်မှတ်ချက်များ

သင့်အက်ပလီကေးရှင်း၏ ပတ်ဝန်းကျင်ကို ပြင်ဆင်ပါ။

```bash
# .env ဆက်တင်
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4o-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## တပ်ဆင်မှု ပုံစံများ

### ပုံစံ ၁: တစ်ဒေသတည်း တပ်ဆင်ခြင်း

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

သင့်တော်သော အရာများ:
- ဖွံ့ဖြိုးရေးနှင့် စမ်းသပ်ရေး
- တစ်ဈေးကွက်အတွက် အက်ပလီကေးရှင်းများ
- ကုန်ကျစရိတ် စီမံခြင်း

### ပုံစံ ၂: အများသဒေသ တပ်ဆင်ခြင်း

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

သင့်တော်သော အရာများ:
- ကမ္ဘာလုံးဆိုင်ရာ အက်ပလီကေးရှင်းများ
- မြင့်မားသော ရရှိနိုင်မှု လိုအပ်ချက်များ
- လုပ်ငန်းပမာဏ ဖြန့်ဝေခြင်း

### ပုံစံ ၃: ဟိုက်ဘရစ် တပ်ဆင်ခြင်း

Azure OpenAI ကို အခြား AI ဝန်ဆောင်မှုများနှင့် ပေါင်းစည်းပါ။

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

AZD ဖွဲ့စည်းမှုတွင် မော်ဒယ် ဗားရှင်းများကို မှတ်တမ်းတင်ထားပါ။

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

### မော်ဒယ် အပ်ဒိတ်များ

မော်ဒယ် အပ်ဒိတ်များအတွက် AZD hooks များကို အသုံးပြုပါ။

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

မော်ဒယ် ဗားရှင်းများ အများအပြား တပ်ဆင်ပါ။

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

## ထုတ်လုပ်မှု တွေးခေါ်စရာများ

### စွမ်းရည် စီမံခန့်ခွဲခြင်း

အသုံးပြုမူ ပုံစံများအပေါ် အခြေခံ၍ လိုအပ်သည့် စွမ်းရည်ကို တွက်ချက်ပါ။

```python
# စွမ်းဆောင်ရည် တွက်ချက် ဥပမာ
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

### အလိုအလျောက် တိုးချဲ့ခြင်း ဖွဲ့စည်းမှု

Container Apps များအတွက် အလိုအလျာက္ တိုးချဲ့ခြင်းကို ပြင်ဆင်ပါ။

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

### ကုန်ကျစရိတ် ထိရောက်စေခြင်း

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

## ကြီးကြပ်ခြင်းနှင့် မြင်နိုင်ခြင်း

### Application Insights ပေါင်းစည်းခြင်း

AI အလုပ်မျိုးများအတွက် ကြီးကြပ်မှုကို ပြင်ဆင်ပါ။

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

### အထူး Metric များ

AI အတွက် သတ်မှတ်ထားသော metrics များကို လိုက်လံကြည့်ရှုပါ။

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

AI ဝန်ဆောင်မှုများ၏ ကျန်းမာရေး ကြီးကြပ်မှုကို အကောင်အထည်ဖော်ပါ။

```python
# ကျန်းမာရေး စစ်ဆေးရန် endpoint များ
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # OpenAI ချိတ်ဆက်မှုကို စမ်းသပ်ရန်
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

## နောက်တစ်ဆင့်များ

1. **[Microsoft Foundry ပေါင်းစည်းမှု လမ်းညွှန်](microsoft-foundry-integration.md) ကို ပြန်လည်သုံးသပ်ပါ** ဆောင်ရွက်မှု ပုံစံများအတွက်
2. **[AI လေ့ကျင့်ခန်း](ai-workshop-lab.md) ကို ပြီးမြောက်စွာ ပြုလုပ်ပါ** လက်တွေ့ အတွေ့အကြုံ ရယူရန်
3. **[ထုတ်လုပ်ရေး AI အသုံးပြုမှုနည်းလမ်းများ](production-ai-practices.md) ကို အကောင်အထည်ဖော်ပါ** လုပ်ငန်းသုံး တပ်ဆင်မှုများအတွက်
4. **[AI ပြဿနာရှာဖွေရေး လမ်းညွှန်](../chapter-07-troubleshooting/ai-troubleshooting.md) ကို စူးစမ်းလေ့လာပါ** ရိုးရာ ပြဿနာများအတွက်

## ရင်းမြစ်များ

- [Azure OpenAI မော်ဒယ် ရရှိနိုင်မှု](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI စာတမ်းများ](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps တိုးချဲ့ခြင်း](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI မော်ဒယ် ကုန်ကျစရိတ် ထိရောက်စေခြင်း](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**အခန်း လမ်းညွှန်:**
- **📚 သင်တန်း မူလ စာမျက်နှာ**: [AZD စတင်လေ့လာသူများ](../../README.md)
- **📖 လက်ရှိ အခန်း**: အခန်း ၂ - AI-ဦးဆောင် ဖွံ့ဖြိုးရေး
- **⬅️ ယခင်**: [Microsoft Foundry ပေါင်းစည်းမှု](microsoft-foundry-integration.md)
- **➡️ နောက်**: [AI လေ့ကျင့်ခန်း](ai-workshop-lab.md)
- **🚀 နောက် အခန်း**: [အခန်း ၃ - ဖွဲ့စည်းမှု](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
အသိပေးချက်:
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှုဖြစ်သည့် [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် မှန်ကန်မှုအတွက် ကြိုးပမ်းသော်လည်း အလိုအလျောက်ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် မှန်ကန်မှုမရှိနိုင်သည့် အပိုင်းများ ရှိနိုင်ကြောင်း သတိပြုပါ။ မူရင်းဘာသာဖြင့် ရှိသော မူလစာတမ်းကို တရားဝင် အရင်းအမြစ်အဖြစ် ထည့်သင့်သည်။ အရေးကြီးသော အချက်အလက်များအတွက်တော့ ကျွမ်းကျင် လူဘာသာပြန်ကို အသုံးပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုမှုကြောင့် ဖြစ်ပေါ်လာနိုင်သည့် နားမလည်မှုများ သို့မဟုတ် မှားယွင်းသော သဘောထားချက်များအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->