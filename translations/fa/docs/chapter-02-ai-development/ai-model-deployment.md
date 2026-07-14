# استقرار مدل هوش مصنوعی با Azure Developer CLI

**هدایت فصل:**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل جاری**: فصل ۲ - توسعه هوشمند محور هوش مصنوعی
- **⬅️ قبلی**: [یکپارچه‌سازی Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ بعدی**: [کارگاه هوش مصنوعی](ai-workshop-lab.md)
- **🚀 فصل بعدی**: [فصل ۳: پیکربندی](../chapter-03-configuration/configuration.md)

این راهنما دستورالعمل‌های جامعی برای استقرار مدل‌های هوش مصنوعی با استفاده از قالب‌های AZD ارائه می‌دهد، که همه چیز از انتخاب مدل تا الگوهای استقرار در تولید را پوشش می‌دهد.

> **نکته اعتبارسنجی (۲۰۲۶-۰۷-۱۳):** جریان کاری AZD در این راهنما با نسخه `azd` `1.27.1` بررسی شده است. برای استقرارهای هوش مصنوعی که زمان بیشتری نسبت به پنجره پیش‌فرض استقرار سرویس می‌گیرند، نسخه‌های جاری AZD از گزینه `azd deploy --timeout <seconds>` پشتیبانی می‌کنند.

## فهرست مطالب

- [استراتژی انتخاب مدل](#استراتژی-انتخاب-مدل)
- [پیکربندی AZD برای مدل‌های هوش مصنوعی](#پیکربندی-azd-برای-مدل‌های-هوش-مصنوعی)
- [الگوهای استقرار](#الگوهای-استقرار)
- [مدیریت مدل](#مدیریت-مدل)
- [ملاحظات تولید](#ملاحظات-تولید)
- [نظارت و دیده‌بانی](#نظارت-و-دیده‌بانی)

## استراتژی انتخاب مدل

### مدل‌های Microsoft Foundry

مدل مناسب برای مورد استفاده خود انتخاب کنید:

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

### برنامه‌ریزی ظرفیت مدل

| نوع مدل | مورد استفاده | ظرفیت پیشنهادی | ملاحظات هزینه |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | گفتگو، سوال و جواب | ۱۰-۵۰ TPM | مقرون به صرفه برای اکثر بارهای کاری |
| gpt-4.1 | استدلال پیچیده | ۲۰-۱۰۰ TPM | هزینه بیشتر، استفاده برای قابلیت‌های پرمیوم |
| text-embedding-3-large | جستجو، RAG | ۳۰-۱۲۰ TPM | انتخاب قوی پیش‌فرض برای جستجوی معناشناختی و بازیابی |
| Whisper | تبدیل گفتار به متن | ۱۰-۵۰ TPM | بارهای کاری پردازش صوت |

## پیکربندی AZD برای مدل‌های هوش مصنوعی

### پیکربندی قالب Bicep

ایجاد استقرار مدل‌ها از طریق قالب‌های Bicep:

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

### متغیرهای محیطی

محیط برنامه خود را پیکربندی کنید:

```bash
# پیکربندی .env
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

## الگوهای استقرار

### الگو ۱: استقرار در یک منطقه

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

بهترین برای:
- توسعه و تست
- برنامه‌های بازار تک‌منطقه‌ای
- بهینه‌سازی هزینه

### الگو ۲: استقرار چندمنطقه‌ای

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

بهترین برای:
- برنامه‌های جهانی
- نیازمندی‌های در دسترس بودن بالا
- توزیع بار

### الگو ۳: استقرار ترکیبی

ترکیب مدل‌های Microsoft Foundry با سایر خدمات هوش مصنوعی:

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

## مدیریت مدل

### کنترل نسخه

نسخه‌های مدل را در پیکربندی AZD خود ردیابی کنید:

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

### به‌روزرسانی مدل

از هوک‌های AZD برای به‌روزرسانی مدل استفاده کنید:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"

# اگر استقرار بیش از زمان پیش‌فرض طول بکشد
azd deploy --timeout 1800
```

### تست A/B

چند نسخه از مدل را استقرار دهید:

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

## ملاحظات تولید

### برنامه‌ریزی ظرفیت

ظرفیت مورد نیاز را بر اساس الگوهای استفاده محاسبه کنید:

```python
# مثال محاسبه ظرفیت
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

# مثال استفاده
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### پیکربندی مقیاس خودکار

مقیاس خودکار برای Container Apps را پیکربندی کنید:

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

### بهینه‌سازی هزینه

کنترل‌های هزینه را پیاده‌سازی کنید:

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

## نظارت و دیده‌بانی

### ادغام Application Insights

نظارت بر بارهای کاری هوش مصنوعی را پیکربندی کنید:

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

### معیارهای سفارشی

معیارهای خاص هوش مصنوعی را ردیابی کنید:

```python
# تلومتری سفارشی برای مدل‌های هوش مصنوعی
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

### بررسی سلامت

نظارت بر سلامت سرویس هوش مصنوعی را پیاده‌سازی کنید:

```python
# نقاط پایانی بررسی سلامت
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # آزمایش اتصال OpenAI
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

## مراحل بعدی

۱. **بررسی [راهنمای یکپارچه‌سازی Microsoft Foundry](microsoft-foundry-integration.md)** برای الگوهای ادغام سرویس
۲. **کامل کردن [کارگاه هوش مصنوعی](ai-workshop-lab.md)** برای تجربه عملی
۳. **اجرای [روش‌های تولید هوش مصنوعی](production-ai-practices.md)** برای استقرارهای سازمانی
۴. **مرور [راهنمای عیب‌یابی هوش مصنوعی](../chapter-07-troubleshooting/ai-troubleshooting.md)** برای مسائل رایج

## منابع

- [دسترس‌پذیری مدل‌های Microsoft Foundry](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [مستندات Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [مقیاس‌پذیری Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [بهینه‌سازی هزینه مدل هوش مصنوعی](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**هدایت فصل:**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل جاری**: فصل ۲ - توسعه هوشمند محور هوش مصنوعی
- **⬅️ قبلی**: [یکپارچه‌سازی Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ بعدی**: [کارگاه هوش مصنوعی](ai-workshop-lab.md)
- **🚀 فصل بعدی**: [فصل ۳: پیکربندی](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مادری خود باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوء تفاهم یا برداشت نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->