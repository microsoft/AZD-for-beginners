# استقرار مدل‌های هوش مصنوعی با Azure Developer CLI

**فهرست فصل‌ها:**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل فعلی**: فصل ۲ - توسعه مبتنی بر هوش مصنوعی
- **⬅️ قبلی**: [ادغام Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ بعدی**: [آزمایشگاه کارگاه هوش مصنوعی](ai-workshop-lab.md)
- **🚀 فصل بعدی**: [فصل ۳: پیکربندی](../getting-started/configuration.md)

این راهنما دستورالعمل‌های جامع برای استقرار مدل‌های هوش مصنوعی با استفاده از قالب‌های AZD را ارائه می‌دهد و همه چیز از انتخاب مدل تا الگوهای استقرار در محیط تولید را پوشش می‌دهد.

## فهرست مطالب

- [استراتژی انتخاب مدل](../../../../docs/microsoft-foundry)
- [پیکربندی AZD برای مدل‌های هوش مصنوعی](../../../../docs/microsoft-foundry)
- [الگوهای استقرار](../../../../docs/microsoft-foundry)
- [مدیریت مدل](../../../../docs/microsoft-foundry)
- [ملاحظات تولید](../../../../docs/microsoft-foundry)
- [نظارت و مشاهده‌پذیری](../../../../docs/microsoft-foundry)

## استراتژی انتخاب مدل

### مدل‌های Azure OpenAI

مدل مناسب برای مورد استفاده خود را انتخاب کنید:

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

### برنامه‌ریزی ظرفیت مدل

| نوع مدل | مورد استفاده | ظرفیت پیشنهادی | ملاحظات هزینه |
|------------|----------|---------------------|-------------------|
| GPT-4o-mini | چت، پرسش و پاسخ | ۱۰-۵۰ TPM | مقرون‌به‌صرفه برای اکثر بارهای کاری |
| GPT-4 | استدلال پیچیده | ۲۰-۱۰۰ TPM | هزینه بالاتر، مناسب برای ویژگی‌های پیشرفته |
| Text-embedding-ada-002 | جستجو، RAG | ۳۰-۱۲۰ TPM | ضروری برای جستجوی معنایی |
| Whisper | تبدیل گفتار به متن | ۱۰-۵۰ TPM | بارهای کاری پردازش صوتی |

## پیکربندی AZD برای مدل‌های هوش مصنوعی

### پیکربندی قالب Bicep

استقرار مدل‌ها را از طریق قالب‌های Bicep ایجاد کنید:

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

### متغیرهای محیطی

محیط برنامه خود را پیکربندی کنید:

```bash
# پیکربندی .env
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4o-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
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
      AZURE_OPENAI_CHAT_DEPLOYMENT: gpt-4o-mini
```

مناسب برای:
- توسعه و آزمایش
- برنامه‌های تک‌بازاری
- بهینه‌سازی هزینه

### الگوی ۲: استقرار در چند منطقه

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
- نیازهای دسترسی بالا
- توزیع بار

### الگوی ۳: استقرار ترکیبی

ترکیب Azure OpenAI با سایر خدمات هوش مصنوعی:

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

نسخه‌های مدل را در پیکربندی AZD خود دنبال کنید:

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

### به‌روزرسانی مدل

از AZD hooks برای به‌روزرسانی مدل استفاده کنید:

```bash
#!/bin/bash
# قلاب‌ها/قبل از استقرار.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4o-mini']"
```

### آزمایش A/B

چندین نسخه مدل را مستقر کنید:

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

### پیکربندی مقیاس‌گذاری خودکار

مقیاس‌گذاری خودکار برای Container Apps را پیکربندی کنید:

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

## نظارت و مشاهده‌پذیری

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

معیارهای خاص هوش مصنوعی را دنبال کنید:

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

### بررسی سلامت

نظارت بر سلامت خدمات هوش مصنوعی را پیاده‌سازی کنید:

```python
# نقاط پایانی بررسی سلامت
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # اتصال OpenAI را آزمایش کنید
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

1. **راهنمای [ادغام Microsoft Foundry](microsoft-foundry-integration.md)** را برای الگوهای ادغام خدمات مرور کنید
2. **آزمایشگاه [کارگاه هوش مصنوعی](ai-workshop-lab.md)** را برای تجربه عملی کامل کنید
3. **[روش‌های تولید هوش مصنوعی](production-ai-practices.md)** را برای استقرارهای سازمانی پیاده‌سازی کنید
4. **راهنمای [رفع اشکال هوش مصنوعی](../troubleshooting/ai-troubleshooting.md)** را برای مشکلات رایج بررسی کنید

## منابع

- [دسترسی مدل‌های Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [مستندات Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [مقیاس‌گذاری برنامه‌های Container](https://learn.microsoft.com/azure/container-apps/scale-app)
- [بهینه‌سازی هزینه مدل‌های هوش مصنوعی](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**فهرست فصل‌ها:**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل فعلی**: فصل ۲ - توسعه مبتنی بر هوش مصنوعی
- **⬅️ قبلی**: [ادغام Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ بعدی**: [آزمایشگاه کارگاه هوش مصنوعی](ai-workshop-lab.md)
- **🚀 فصل بعدی**: [فصل ۳: پیکربندی](../getting-started/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:  
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما تلاش می‌کنیم دقت را حفظ کنیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌ها باشند. سند اصلی به زبان اصلی آن باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما مسئولیتی در قبال سوء تفاهم‌ها یا تفسیرهای نادرست ناشی از استفاده از این ترجمه نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->