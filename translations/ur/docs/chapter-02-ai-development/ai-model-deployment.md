# Azure Developer CLI کے ساتھ AI ماڈل کی تعیناتی

**باب کی نیویگیشن:**
- **📚 کورس ہوم**: [AZD For Beginners](../../README.md)
- **📖 موجودہ باب**: باب 2 - AI-First Development
- **⬅️ پچھلا**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ اگلا**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 اگلا باب**: [باب 3: Configuration](../chapter-03-configuration/configuration.md)

یہ رہنما AZD ٹیمپلیٹس استعمال کرتے ہوئے AI ماڈلز کی تعیناتی کے لئے جامع ہدایات فراہم کرتا ہے، جو ماڈل کے انتخاب سے لے کر پیداوار میں تعیناتی کے نمونوں تک سب کچھ شامل ہے۔

> **تصدیقی نوٹ (2026-03-25):** اس رہنما میں AZD ورک فلو کو `azd` `1.23.12` کے خلاف چیک کیا گیا تھا۔ AI تعیناتیوں کے لئے جو ڈیفالٹ سروس تعیناتی کھڑکی سے زیادہ وقت لیتے ہیں، موجودہ AZD ریلیزز `azd deploy --timeout <seconds>` کی حمایت کرتے ہیں۔

## فہرست مضامین

- [ماڈل انتخاب کی حکمت عملی](#ماڈل-انتخاب-کی-حکمت-عملی)
- [AI ماڈلز کے لئے AZD کنفیگریشن](#ai-ماڈلز-کے-لئے-azd-کنفیگریشن)
- [تعیناتی کے نمونے](#تعیناتی-کے-نمونے)
- [ماڈل مینجمنٹ](#ماڈل-مینجمنٹ)
- [پیداوری خیالات](#پیداوری-خیالات)
- [مانیٹرنگ اور مشاہدہ](#مانیٹرنگ-اور-مشاہدہ)

## ماڈل انتخاب کی حکمت عملی

### Microsoft Foundry ماڈلز

اپنے استعمال کے معاملے کے لئے صحیح ماڈل منتخب کریں:

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

### ماڈل صلاحیت کی منصوبہ بندی

| ماڈل کی قسم | استعمال کا کیس | تجویز کردہ صلاحیت | لاگت کے پہلو |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | چیٹ، سوال و جواب | 10-50 TPM | زیادہ تر ورکلوڈز کے لئے لاگت مؤثر |
| gpt-4.1 | پیچیدہ منطق | 20-100 TPM | اعلی لاگت، پریمیم خصوصیات کے لئے استعمال کریں |
| text-embedding-3-large | تلاش، RAG | 30-120 TPM | معنوی تلاش اور بازیافت کے لئے مضبوط ڈیفالٹ انتخاب |
| Whisper | تقریر سے متن | 10-50 TPM | آڈیو پراسیسنگ ورکلوڈز |

## AI ماڈلز کے لئے AZD کنفیگریشن

### بائسپ ٹیمپلیٹ کنفیگریشن

بائسپ ٹیمپلیٹس کے ذریعے ماڈل کی تعیناتی کریں:

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

### ماحول کے متغیرات

اپنی ایپلیکیشن کے ماحول کو ترتیب دیں:

```bash
# ترتیب .env
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

## تعیناتی کے نمونے

### نمونہ 1: سنگل-ریجن تعیناتی

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

بہترین برائے:
- ترقی اور جانچ
- واحد مارکیٹ کی ایپلیکیشنز
- لاگت کی بہتر کاری

### نمونہ 2: ملٹی-ریجن تعیناتی

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

بہترین برائے:
- عالمی ایپلیکیشنز
- اعلی دستیابی کی ضروریات
- بوجھ کی تقسیم

### نمونہ 3: ہائبریڈ تعیناتی

Microsoft Foundry ماڈلز کو دیگر AI خدمات کے ساتھ ملائیں:

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

اپنے AZD کنفیگریشن میں ماڈل ورژنز کا پتہ رکھیں:

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

### ماڈل اپڈیٹس

ماڈل اپڈیٹس کے لئے AZD ہُکس استعمال کریں:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"

# اگر تعیناتی وقت زیادہ لے جائے طے شدہ ٹائم آؤٹ سے
azd deploy --timeout 1800
```

### A/B ٹیسٹنگ

متعدد ماڈل ورژنز تعینات کریں:

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

## پیداوری خیالات

### صلاحیت کی منصوبہ بندی

استعمال کے نمونوں کی بنیاد پر مطلوبہ صلاحیت کا حساب لگائیں:

```python
# صلاحیت کا حساب لگانے کی مثال
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

### آٹو سکیلنگ کنفیگریشن

کنٹینر ایپلیکیشنز کے لئے آٹو سکیلنگ ترتیب دیں:

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

### لاگت کی بہتر کاری

لاگت کنٹرول نافذ کریں:

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

AI ورکلوڈز کے لئے مانیٹرنگ ترتیب دیں:

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

AI متعلقہ میٹرکس کا پتہ رکھیں:

```python
# AI ماڈلز کے لیے حسبِ خواہش ٹیلی میٹری
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

### صحت کی جانچ

AI سروس کی صحت کی نگرانی نافذ کریں:

```python
# صحت کی جانچ کے ایند پوائنٹس
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

1. **[Microsoft Foundry Integration Guide](microsoft-foundry-integration.md)** کے ذریعے سروس انٹیگریشن نمونوں کا جائزہ لیں
2. **[AI Workshop Lab](ai-workshop-lab.md)** مکمل کریں تاکہ عملی تجربہ حاصل ہو
3. **[Production AI Practices](production-ai-practices.md)** نافذ کریں برائے انٹرپرائز تعیناتیاں
4. **[AI Troubleshooting Guide](../chapter-07-troubleshooting/ai-troubleshooting.md)** دریافت کریں عام مسائل کے حل کے لئے

## وسائل

- [Microsoft Foundry ماڈلز کی دستیابی](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI دستاویزات](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [کنٹینر ایپلیکیشنز کی سکیلنگ](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI ماڈل کی لاگت کی بہتر کاری](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**باب کی نیویگیشن:**
- **📚 کورس ہوم**: [AZD For Beginners](../../README.md)
- **📖 موجودہ باب**: باب 2 - AI-First Development
- **⬅️ پچھلا**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ اگلا**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 اگلا باب**: [باب 3: Configuration](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**خبردار**:
اس دستاویز کا ترجمہ AI ترجمہ خدمت [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعہ کیا گیا ہے۔ جبکہ ہم درستگی کے لیے کوشش کرتے ہیں، براہ کرم آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا غیر درستیاں ہو سکتی ہیں۔ اصل دستاویز اپنی مادری زبان میں قابل اعتماد ماخذ سمجھی جانی چاہئے۔ حساس معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ ہم اس ترجمہ کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تعبیر کے لیے ذمہ دار نہیں ہیں۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->