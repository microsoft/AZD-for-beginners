# Azure Developer CLI کے ساتھ AI ماڈل کی تعیناتی

**باب کی نیوی گیشن:**
- **📚 کورس ہوم**: [AZD For Beginners](../../README.md)
- **📖 موجودہ باب**: باب 2 - AI-First Development
- **⬅️ پچھلا**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ اگلا**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 اگلا باب**: [باب 3: Configuration](../chapter-03-configuration/configuration.md)

یہ گائیڈ AZD ٹیمپلیٹس استعمال کرتے ہوئے AI ماڈلز کی تعیناتی کے لئے جامع ہدایات فراہم کرتا ہے، ماڈل کے انتخاب سے لے کر پروڈکشن میں تعیناتی کے پیچیدہ نمونوں تک۔

## فہرست مضامین

- [ماڈل انتخاب کی حکمت عملی](#ماڈل-انتخاب-کی-حکمت-عملی)
- [AI ماڈلز کے لئے AZD کنفیگریشن](#ai-ماڈلز-کے-لئے-azd-کنفیگریشن)
- [تعیناتی کے نمونے](#تعیناتی-کے-نمونے)
- [ماڈل مینجمنٹ](#ماڈل-مینجمنٹ)
- [پروڈکشن کے اعتبارات](#پروڈکشن-کے-اعتبارات)
- [مانیٹرنگ اور نظارت](#مانیٹرنگ-اور-نظارت)

## ماڈل انتخاب کی حکمت عملی

### Microsoft Foundry ماڈلز

اپنے استعمال کے کیس کے لئے درست ماڈل منتخب کریں:

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

### ماڈل صلاحیت کی منصوبہ بندی

| ماڈل کی قسم | استعمال کا کیس | تجویز کردہ صلاحیت | لاگت کے عوامل |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | چیٹ، سوال و جواب | 10-50 TPM | زیادہ کام کے لئے لاگت-موثر |
| gpt-4.1 | پیچیدہ استدلال | 20-100 TPM | زیادہ لاگت، پریمیم خصوصیات کے لئے استعمال کریں |
| Text-embedding-ada-002 | تلاش، RAG | 30-120 TPM | معنوی تلاش کے لئے ضروری |
| Whisper | تقریر سے متن | 10-50 TPM | آڈیو پروسیسنگ کام کے لئے |

## AI ماڈلز کے لئے AZD کنفیگریشن

### بائسک ٹیمپلیٹ کنفیگریشن

بائسک ٹیمپلیٹس کے ذریعے ماڈل کی تعیناتی کریں:

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

### ماحولیاتی متغیرات

اپنے ایپلیکیشن کے ماحول کو ترتیب دیں:

```bash
# ترتیب .env
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## تعیناتی کے نمونے

### نمونہ 1: سنگل ریجن تعیناتی

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

سب سے بہترین:
- ترقی اور ٹیسٹنگ
- واحد مارکیٹ کی ایپلیکیشنز
- لاگت کی بہتری

### نمونہ 2: کثیر ریجن تعیناتی

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

سب سے بہترین:
- عالمی ایپلیکیشنز
- اعلی دستیابی کی ضروریات
- لوڈ کی تقسیم

### نمونہ 3: ہائبرڈ تعیناتی

Microsoft Foundry ماڈلز کو دیگر AI خدمات کے ساتھ جوڑیں:

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

اپنے AZD کنفیگریشن میں ماڈل ورژنز کا پتہ لگائیں:

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

### ماڈل اپ ڈیٹس

ماڈل اپ ڈیٹس کے لئے AZD ہکس استعمال کریں:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"
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

## پروڈکشن کے اعتبارات

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

# مثال کا استعمال
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### خودکار توسیع کی کنفیگریشن

کنٹینر ایپس کے لئے خودکار اسکیلنگ ترتیب دیں:

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

### لاگت کی بہتری

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

## مانیٹرنگ اور نظارت

### ایپلیکیشن انسائٹس انٹیگریشن

AI کام کے بوجھ کے لئے مانیٹرنگ ترتیب دیں:

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

### حسب ضرورت میٹرکس

AI-خصوصی میٹرکس کا پتہ لگائیں:

```python
# AI ماڈلز کے لیے حسب ضرورت ٹیلی میٹری
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
# صحت کی جانچ کے اختتامی نقاط
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

1. **[Microsoft Foundry Integration Guide](microsoft-foundry-integration.md)** کا جائزہ لیں تاکہ سروس انٹیگریشن کے نمونے سمجھ سکیں  
2. **[AI Workshop Lab](ai-workshop-lab.md)** مکمل کریں تاکہ عملی تجربہ حاصل ہو  
3. **[Production AI Practices](production-ai-practices.md)** نافذ کریں تاکہ انٹرپرائز تعیناتی کی جاتی رہے  
4. **[AI Troubleshooting Guide](../chapter-07-troubleshooting/ai-troubleshooting.md)** دیکھیں تاکہ عمومی مسائل حل کیے جا سکیں  

## وسائل

- [Microsoft Foundry ماڈلز کی دستیابی](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI کی دستاویزات](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [کنٹینر ایپس اسکیلنگ](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI ماڈل لاگت کی بہتری](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**باب کی نیوی گیشن:**
- **📚 کورس ہوم**: [AZD For Beginners](../../README.md)
- **📖 موجودہ باب**: باب 2 - AI-First Development
- **⬅️ پچھلا**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ اگلا**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 اگلا باب**: [باب 3: Configuration](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**دستبرداری**:  
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کا استعمال کرتے ہوئے ترجمہ کی گئی ہے۔ اگرچہ ہم درستگی کے لئے کوشش کرتے ہیں، براہ کرم سمجھیں کہ خودکار ترجموں میں غلطیاں یا بے ضابطگیاں ہو سکتی ہیں۔ اصل دستاویز اپنی مادری زبان میں مستند ماخذ سمجھا جانا چاہیے۔ اہم معلومات کے لیے، پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ ہم اس ترجمہ کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کے ذمہ دار نہیں ہیں۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->