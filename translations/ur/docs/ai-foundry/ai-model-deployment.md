# ای آئی ماڈل کی تعیناتی Azure Developer CLI کے ساتھ

**باب کی نیویگیشن:**
- **📚 کورس ہوم**: [AZD ابتدائیوں کے لیے](../../README.md)
- **📖 موجودہ باب**: باب 2 - ای آئی-فرسٹ ڈیولپمنٹ
- **⬅️ پچھلا**: [Microsoft Foundry انٹیگریشن](microsoft-foundry-integration.md)
- **➡️ اگلا**: [AI ورکشاپ لیب](ai-workshop-lab.md)
- **🚀 اگلا باب**: [باب 3: کنفیگریشن](../getting-started/configuration.md)

یہ گائیڈ AZD ٹیمپلیٹس کے ذریعے ای آئی ماڈلز کی تعیناتی کے لیے جامع ہدایات فراہم کرتا ہے، جس میں ماڈل کے انتخاب سے لے کر پروڈکشن تعیناتی کے پیٹرنز تک سب کچھ شامل ہے۔

## مواد کی فہرست

- [ماڈل انتخاب کی حکمت عملی](../../../../docs/ai-foundry)
- [ای آئی ماڈلز کے لیے AZD کنفیگریشن](../../../../docs/ai-foundry)
- [تعیناتی کے پیٹرنز](../../../../docs/ai-foundry)
- [ماڈل مینجمنٹ](../../../../docs/ai-foundry)
- [پروڈکشن کے پہلو](../../../../docs/ai-foundry)
- [مانیٹرنگ اور مشاہدہ](../../../../docs/ai-foundry)

## ماڈل انتخاب کی حکمت عملی

### Azure OpenAI ماڈلز

اپنے استعمال کے کیس کے لیے صحیح ماڈل منتخب کریں:

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

### ماڈل کی صلاحیت کی منصوبہ بندی

| ماڈل کی قسم | استعمال کا کیس | تجویز کردہ صلاحیت | لاگت کے پہلو |
|------------|----------|---------------------|-------------------|
| GPT-4o-mini | چیٹ، سوال و جواب | 10-50 TPM | زیادہ تر ورک لوڈز کے لیے لاگت مؤثر |
| GPT-4 | پیچیدہ استدلال | 20-100 TPM | زیادہ لاگت، پریمیم فیچرز کے لیے استعمال کریں |
| Text-embedding-ada-002 | تلاش، RAG | 30-120 TPM | سیمینٹک سرچ کے لیے ضروری |
| Whisper | تقریر سے متن | 10-50 TPM | آڈیو پروسیسنگ ورک لوڈز |

## ای آئی ماڈلز کے لیے AZD کنفیگریشن

### Bicep ٹیمپلیٹ کنفیگریشن

Bicep ٹیمپلیٹس کے ذریعے ماڈل کی تعیناتی کریں:

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

### ماحول کے متغیرات

اپنے ایپلیکیشن کے ماحول کو کنفیگر کریں:

```bash
# .env ترتیب
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4o-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## تعیناتی کے پیٹرنز

### پیٹرن 1: سنگل ریجن تعیناتی

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

بہترین استعمال کے لیے:
- ڈیولپمنٹ اور ٹیسٹنگ
- سنگل مارکیٹ ایپلیکیشنز
- لاگت کی اصلاح

### پیٹرن 2: ملٹی ریجن تعیناتی

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

بہترین استعمال کے لیے:
- عالمی ایپلیکیشنز
- اعلی دستیابی کی ضروریات
- لوڈ کی تقسیم

### پیٹرن 3: ہائبرڈ تعیناتی

Azure OpenAI کو دیگر ای آئی سروسز کے ساتھ ملائیں:

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

## ماڈل مینجمنٹ

### ورژن کنٹرول

اپنے AZD کنفیگریشن میں ماڈل ورژنز کو ٹریک کریں:

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

### ماڈل اپڈیٹس

ماڈل اپڈیٹس کے لیے AZD ہکس استعمال کریں:

```bash
#!/bin/bash
# ہکس/پری ڈپلائے.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4o-mini']"
```

### A/B ٹیسٹنگ

متعدد ماڈل ورژنز تعینات کریں:

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

## پروڈکشن کے پہلو

### صلاحیت کی منصوبہ بندی

استعمال کے پیٹرنز کی بنیاد پر مطلوبہ صلاحیت کا حساب لگائیں:

```python
# صلاحیت کا حساب کتاب کی مثال
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

# استعمال کی مثال
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### آٹو اسکیلنگ کنفیگریشن

کنٹینر ایپس کے لیے آٹو اسکیلنگ کنفیگر کریں:

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

### لاگت کی اصلاح

لاگت کنٹرولز نافذ کریں:

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

## مانیٹرنگ اور مشاہدہ

### ایپلیکیشن انسائٹس انٹیگریشن

ای آئی ورک لوڈز کے لیے مانیٹرنگ کنفیگر کریں:

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

### کسٹم میٹرکس

ای آئی مخصوص میٹرکس کو ٹریک کریں:

```python
# AI ماڈلز کے لیے حسب ضرورت ٹیلیمیٹری
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

### ہیلتھ چیکس

ای آئی سروس کی صحت کی مانیٹرنگ نافذ کریں:

```python
# صحت کی جانچ کے اختتامی نکات
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # اوپن اے آئی کنکشن کی جانچ کریں
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

## اگلے اقدامات

1. **[Microsoft Foundry انٹیگریشن گائیڈ](microsoft-foundry-integration.md)** کا جائزہ لیں تاکہ سروس انٹیگریشن پیٹرنز کو سمجھ سکیں
2. **[AI ورکشاپ لیب](ai-workshop-lab.md)** مکمل کریں تاکہ عملی تجربہ حاصل ہو
3. **[پروڈکشن ای آئی پریکٹسز](production-ai-practices.md)** نافذ کریں تاکہ انٹرپرائز تعیناتیوں کے لیے تیار ہوں
4. **[AI ٹربل شوٹنگ گائیڈ](../troubleshooting/ai-troubleshooting.md)** کو دریافت کریں تاکہ عام مسائل کو حل کیا جا سکے

## وسائل

- [Azure OpenAI ماڈل کی دستیابی](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI دستاویزات](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [کنٹینر ایپس اسکیلنگ](https://learn.microsoft.com/azure/container-apps/scale-app)
- [ای آئی ماڈل لاگت کی اصلاح](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**باب کی نیویگیشن:**
- **📚 کورس ہوم**: [AZD ابتدائیوں کے لیے](../../README.md)
- **📖 موجودہ باب**: باب 2 - ای آئی-فرسٹ ڈیولپمنٹ
- **⬅️ پچھلا**: [Microsoft Foundry انٹیگریشن](microsoft-foundry-integration.md)
- **➡️ اگلا**: [AI ورکشاپ لیب](ai-workshop-lab.md)
- **🚀 اگلا باب**: [باب 3: کنفیگریشن](../getting-started/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ڈسکلیمر**:  
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کا استعمال کرتے ہوئے ترجمہ کی گئی ہے۔ ہم درستگی کے لیے کوشش کرتے ہیں، لیکن براہ کرم آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا غیر درستیاں ہو سکتی ہیں۔ اصل دستاویز کو اس کی اصل زبان میں مستند ذریعہ سمجھا جانا چاہیے۔ اہم معلومات کے لیے، پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ ہم اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کے ذمہ دار نہیں ہیں۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->