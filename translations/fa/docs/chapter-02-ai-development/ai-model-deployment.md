# استقرار مدل‌های هوش مصنوعی با Azure Developer CLI

**راهنمای فصل:**
- **📚 صفحه‌ی دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل جاری**: فصل ۲ - توسعه‌محور هوش مصنوعی
- **⬅️ قبلی**: [ادغام Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ بعدی**: [کارگاه عملی هوش مصنوعی](ai-workshop-lab.md)
- **🚀 فصل بعدی**: [فصل ۳: پیکربندی](../chapter-03-configuration/configuration.md)

این راهنما دستورالعمل‌های جامع برای استقرار مدل‌های هوش مصنوعی با استفاده از قالب‌های AZD را فراهم می‌کند و همه چیز را از انتخاب مدل تا الگوهای استقرار در محیط تولید پوشش می‌دهد.

> **یادداشت اعتبارسنجی (2026-03-25):** جریان کاری AZD در این راهنما با `azd` `1.23.12` بررسی شد. برای استقرارهای هوش مصنوعی که زمان بیشتری از پنجره پیش‌فرض استقرار سرویس می‌گیرند، نسخه‌های فعلی AZD از `azd deploy --timeout <seconds>` پشتیبانی می‌کنند.

## فهرست مطالب

- [استراتژی انتخاب مدل](#استراتژی-انتخاب-مدل)
- [پیکربندی AZD برای مدل‌های هوش مصنوعی](#پیکربندی-azd-برای-مدل‌های-هوش-مصنوعی)
- [الگوهای استقرار](#الگوهای-استقرار)
- [مدیریت مدل](#مدیریت-مدل)
- [ملاحظات محیط تولید](#ملاحظات-محیط-تولید)
- [نظارت و قابلیت مشاهده](#نظارت-و-قابلیت-مشاهده)

## استراتژی انتخاب مدل

### مدل‌های Microsoft Foundry

مدل مناسب را برای مورد استفادهٔ خود انتخاب کنید:

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
| gpt-4.1-mini | گفت‌وگو، پرسش و پاسخ | 10-50 TPM | مناسب از نظر هزینه برای اکثر بارهای کاری |
| gpt-4.1 | استدلال پیچیده | 20-100 TPM | هزینهٔ بالاتر، مناسب برای ویژگی‌های پرمیوم |
| text-embedding-3-large | جستجو، RAG | 30-120 TPM | انتخاب پیش‌فرض قوی برای جستجوی معنایی و بازیابی |
| Whisper | تبدیل گفتار به متن | 10-50 TPM | بارهای کاری پردازش صوت |

## پیکربندی AZD برای مدل‌های هوش مصنوعی

### پیکربندی قالب Bicep

از طریق قالب‌های Bicep استقرار مدل‌ها را ایجاد کنید:

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

محیط برنامهٔ خود را پیکربندی کنید:

```bash
# پیکربندی فایل .env
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

## الگوهای استقرار

### الگوی ۱: استقرار در یک منطقه

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

مناسب برای:
- توسعه و تست
- برنامه‌های تک‌بازاری
- بهینه‌سازی هزینه

### الگوی ۲: استقرار چندمنطقه‌ای

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

مناسب برای:
- برنامه‌های جهانی
- الزامات در دسترس‌پذیری بالا
- توزیع بار

### الگوی ۳: استقرار ترکیبی

ادغام مدل‌های Microsoft Foundry با سایر سرویس‌های هوش مصنوعی:

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

پیگیری نسخه‌های مدل در پیکربندی AZD خود:

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

# اگر عملیات استقرار بیش از زمان انتظار پیش‌فرض طول بکشد
azd deploy --timeout 1800
```

### تست A/B

چندین نسخه از مدل را مستقر کنید:

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

## ملاحظات محیط تولید

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

# نمونه استفاده
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### پیکربندی مقیاس خودکار

مقیاس خودکار را برای Container Apps پیکربندی کنید:

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

کنترل‌های هزینه را اجرا کنید:

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

## نظارت و قابلیت مشاهده

### ادغام Application Insights

نظارت را برای بارهای کاری هوش مصنوعی پیکربندی کنید:

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

### متریک‌های سفارشی

پیگیری متریک‌های خاص هوش مصنوعی:

```python
# تله‌متری سفارشی برای مدل‌های هوش مصنوعی
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

### بررسی‌های سلامت

نظارت بر سلامت سرویس‌های هوش مصنوعی را پیاده‌سازی کنید:

```python
# نقاط پایانی بررسی سلامت
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # تست اتصال به OpenAI
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

## گام‌های بعدی

1. **مرور [راهنمای ادغام Microsoft Foundry](microsoft-foundry-integration.md)** برای الگوهای ادغام سرویس
2. **تکمیل [کارگاه عملی هوش مصنوعی](ai-workshop-lab.md)** برای تجربهٔ عملی
3. **اجرای [روش‌های تولیدی هوش مصنوعی](production-ai-practices.md)** برای استقرارهای سازمانی
4. **مطالعه [راهنمای عیب‌یابی هوش مصنوعی](../chapter-07-troubleshooting/ai-troubleshooting.md)** برای مسائل رایج

## منابع

- [دسترس‌پذیری مدل‌های Microsoft Foundry](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [مستندات Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [مقیاس‌دهی Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [بهینه‌سازی هزینه مدل‌های هوش مصنوعی](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**راهنمای فصل:**
- **📚 صفحه‌ی دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل جاری**: فصل ۲ - توسعه‌محور هوش مصنوعی
- **⬅️ قبلی**: [ادغام Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ بعدی**: [کارگاه عملی هوش مصنوعی](ai-workshop-lab.md)
- **🚀 فصل بعدی**: [فصل ۳: پیکربندی](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
این سند با استفاده از سرویس ترجمه مبتنی بر هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان بومی خود باید به‌عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حساس، ترجمه انسانی حرفه‌ای توصیه می‌شود. ما در قبال هرگونه سوتفاهم یا تفسیر نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->