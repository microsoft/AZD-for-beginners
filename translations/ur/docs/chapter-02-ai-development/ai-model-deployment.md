# Azure Developer CLI کے ساتھ AI ماڈل کی تعیناتی

**باب نیویگیشن:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ Next**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

یہ رہنمائی AZD ٹیمپلیٹس کا استعمال کرتے ہوئے AI ماڈلز کی تعیناتی کے لیے جامع ہدایات فراہم کرتی ہے، ماڈل کے انتخاب سے لے کر پروڈکشن تعیناتی کے نمونوں تک سب کچھ شامل ہے۔

## فہرستِ مضامین

- [ماڈل انتخاب کی حکمتِ عملی](../../../../docs/chapter-02-ai-development)
- [AI ماڈلز کے لیے AZD کنفیگریشن](../../../../docs/chapter-02-ai-development)
- [تعیناتی کے نمونے](../../../../docs/chapter-02-ai-development)
- [ماڈل مینجمنٹ](../../../../docs/chapter-02-ai-development)
- [پروڈکشن کے پہلو](../../../../docs/chapter-02-ai-development)
- [مانیٹرنگ اور قابلِ مشاہدہ](../../../../docs/chapter-02-ai-development)

## ماڈل انتخاب کی حکمتِ عملی

### Azure OpenAI ماڈلز

اپنے استعمال کے منظرنامے کے لیے درست ماڈل منتخب کریں:

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

### ماڈل صلاحیت کی منصوبہ بندی

| Model Type | Use Case | Recommended Capacity | Cost Considerations |
|------------|----------|---------------------|-------------------|
| GPT-4o-mini | چیٹ، سوال و جواب | 10-50 TPM | زیادہ تر ورک لوڈز کے لیے لاگت موثر |
| GPT-4 | پیچیدہ استدلال | 20-100 TPM | زیادہ قیمت، پریمیم خصوصیات کے لیے استعمال کریں |
| Text-embedding-ada-002 | سرچ، RAG | 30-120 TPM | معنوی تلاش کے لیے ضروری |
| Whisper | تقریر سے متن | 10-50 TPM | آڈیو پروسیسنگ کے ورک لوڈز |

## AI ماڈلز کے لیے AZD کنفیگریشن

### Bicep ٹیمپلیٹ کنفیگریشن

Bicep ٹیمپلیٹس کے ذریعے ماڈل تعیناتیاں بنائیں:

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

### ماحولیاتی متغیرات

اپنی ایپلیکیشن کا ماحول ترتیب دیں:

```bash
# .env کی ترتیب
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4o-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## تعیناتی کے نمونے

### نمونہ 1: یک علاقائی تعیناتی

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

مناسب برائے:
- ڈیولپمنٹ اور ٹیسٹنگ
- ایک مارکیٹ والی ایپلیکیشنز
- لاگت کی اصلاح

### نمونہ 2: کثیر علاقائی تعیناتی

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

مناسب برائے:
- عالمی ایپلیکیشنز
- اعلی دستیابی کی ضروریات
- لوڈ کی تقسیم

### نمونہ 3: ہائبرڈ تعیناتی

Azure OpenAI کو دیگر AI سروسز کے ساتھ ملائیں:

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

اپنے AZD کنفیگریشن میں ماڈل کے ورژنز کو ٹریک کریں:

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
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4o-mini']"
```

### A/B ٹیسٹنگ

متعدد ماڈل ورژنز ڈیپلائے کریں:

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

استعمال کے نمونوں کی بنیاد پر مطلوبہ صلاحیت کا حساب لگائیں:

```python
# گنجائش کے حساب کی مثال
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

Container Apps کے لیے آٹو اسکیلنگ ترتیب دیں:

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

## مانیٹرنگ اور قابلِ مشاہدہ

### Application Insights انضمام

AI ورک لوڈز کے لیے مانیٹرنگ ترتیب دیں:

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

AI مخصوص میٹرکس ٹریک کریں:

```python
# مصنوعی ذہانت کے ماڈلز کے لیے حسبِ ضرورت ٹیلی میٹری
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

AI سروس کی صحت کی مانیٹرنگ نافذ کریں:

```python
# صحت کی جانچ کے اینڈ پوائنٹس
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # OpenAI کنکشن کی جانچ کریں
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

1. **[Microsoft Foundry انضمام گائیڈ](microsoft-foundry-integration.md) کا جائزہ لیں** سروس انضمام کے نمونوں کے لیے
2. **[AI ورکشاپ لیب](ai-workshop-lab.md) مکمل کریں** عملی تجربے کے لیے
3. **[پروڈکشن AI طریقے](production-ai-practices.md) نافذ کریں** انٹرپرائز تعیناتیوں کے لیے
4. **[AI ٹربل شوٹنگ گائیڈ](../chapter-07-troubleshooting/ai-troubleshooting.md) تلاش کریں** عام مسائل کے لیے

## وسائل

- [Azure OpenAI ماڈل کی دستیابی](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI دستاویزات](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps کی اسکیلنگ](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI ماڈل لاگت کی اصلاح](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**باب نیویگیشن:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ Next**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
دستبرداری:
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے ترجمہ کی گئی ہے۔ اگرچہ ہم درستگی کے لیے کوشش کرتے ہیں، براہِ کرم خیال رکھیں کہ خودکار تراجم میں غلطیاں یا نادرستیاں ہو سکتی ہیں۔ اصل دستاویز اُس کی مادری زبان میں مستند ماخذ سمجھی جانی چاہیے۔ اہم معلومات کے لیے پیشہ ور انسانی ترجمے کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تعبیر کے لیے ہم ذمہ دار نہیں ہیں۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->