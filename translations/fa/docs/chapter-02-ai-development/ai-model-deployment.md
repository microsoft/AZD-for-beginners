# استقرار مدل هوش مصنوعی با Azure Developer CLI

**هدایت فصل:**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل جاری**: فصل ۲ - توسعه با اولویت هوش مصنوعی
- **⬅️ قبلی**: [عامل‌های هوش مصنوعی](agents.md)
- **➡️ بعدی**: [آزمایشگاه کارگاهی هوش مصنوعی](ai-workshop-lab.md)
- **🚀 فصل بعدی**: [فصل ۳: پیکربندی](../chapter-03-configuration/configuration.md)

این راهنما دستورالعمل‌های کامل برای استقرار مدل‌های هوش مصنوعی با استفاده از قالب‌های AZD ارائه می‌دهد که از انتخاب مدل تا الگوهای استقرار در محیط تولید را شامل می‌شود.

> **بررسی انتشار (۲۰۲۶-۱۱-۰۴):** تغییرات مرتبط در CLI در برابر `azd` `1.37.2` بررسی شده‌اند؛ دسترسی به مدل، نسخه‌ها و سهمیه همچنان به منطقه و اشتراک وابسته است. `azd deploy --timeout <seconds>` پنجره استقرار سرویس را کنترل می‌کند، تضمینی برای فعال‌سازی عامل نیست. نکات انتشار جاری و راهنمای مهاجرت هوش مصنوعی را ببینید [در اینجا](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes).

## فهرست مطالب

- [استراتژی انتخاب مدل](#model-selection-strategy)
- [پیکربندی AZD برای مدل‌های هوش مصنوعی](#azd-configuration-for-ai-models)
- [الگوهای استقرار](#deployment-patterns)
- [مدیریت مدل](#model-management)
- [ملاحظات تولید](#production-considerations)
- [نظارت و قابلیت مشاهده](#monitoring-and-observability)

## استراتژی انتخاب مدل

### مدل‌های Azure OpenAI در Microsoft Foundry

مدل مناسب برای مورد استفاده خود را انتخاب کنید:

استقرار مدل‌ها را در Bicep (در زیر) اعلام کنید، نه در تنظیمات تصادفی `services.*.config.AZURE_OPENAI_MODELS`. AZD چنین تنظیمی را به عنوان فهرست منابع مدل تفسیر نمی‌کند. `project` یک سرویس به منبع برنامه اشاره می‌کند، نه دایرکتوری `infra/` آن.

مثال‌ها از نسخه منتشر شده `gpt-4.1-mini` **`2025-04-14`** و نسخه جاسازی **`1`** استفاده می‌کنند. قبل از فراهم‌سازی، تأیید کنید نسخه مدل و SKU استقرار در منطقه/حساب هدف پشتیبانی می‌شوند.

### برنامه‌ریزی ظرفیت مدل

| نوع مدل | مورد استفاده | تقاضای توکن مثال | ملاحظات هزینه |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | چت، سوال و جواب | ۱۰,۰۰۰-۵۰,۰۰۰ TPM | بررسی هزینه و کیفیت برای بار کاری شما |
| gpt-4.1 | کارهای پیچیده | ۲۰,۰۰۰-۱۰۰,۰۰۰ TPM | ارزیابی بهبود کیفیت نسبت به هزینه توکن |
| text-embedding-3-large | جستجو، RAG | ۳۰,۰۰۰-۱۲۰,۰۰۰ TPM | لحاظ ورودی و ترافیک پرس‌وجو |
| Whisper | تبدیل گفتار به متن | برنامه‌ریزی با توجه به مدت زمان صدا و محدودیت درخواست‌ها | فرمول ظرفیت TPM مدل متنی را اعمال نکنید |

TPM به معنای توکن در دقیقه است. برای این استقرارهای متن استاندارد، ARM `sku.capacity` در واحدهای **۱,۰۰۰ TPM** است، نه TPM تکی (ظرفیت `10` به معنای ۱۰,۰۰۰ TPM است). نسبت‌های RPM به TPM بسته به نوع مدل/استقرار متفاوتند؛ هر دو محدودیت را در برابر [مستندات سهمیه](https://learn.microsoft.com/azure/ai-foundry/openai/quotas-limits?view=foundry-classic) بررسی کنید. این بازه‌ها مثال‌اند، توصیه سایزدهی نیستند.

## پیکربندی AZD برای مدل‌های هوش مصنوعی

### پیکربندی قالب Bicep

استقرار مدل‌ها را از طریق قالب‌های Bicep ایجاد کنید:

```bicep
// infra/main.bicep
param openAiAccountName string
param location string = resourceGroup().location

@description('OpenAI model deployments')
param openAiModelDeployments array = [
  {
    name: 'gpt-4.1-mini'
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
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
    disableLocalAuth: true
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

این یک **نمونه زیرساخت توسعه با دامنه گروه منابع** است، نه قالب کامل برنامه AZD. حساب اجازه دسترسی به شبکه عمومی را می‌دهد و نیازمند احراز هویت Entra ID/RBAC (`Cognitive Services OpenAI User` برای فراخوان‌ها) است. تولید به نقطه پایانی خصوصی، DNS و اتصال برنامه در فصل ۸ نیاز دارد. AZD همچنین به نقشه‌برداری قالب/پارامتر اصلی و منابع میزبان برنامه نیاز دارد؛ برای استقرار کامل از نمونه کاری استفاده کنید.

### متغیرهای محیطی

محیط برنامه خود را پیکربندی کنید:

```bash
# .env configuration
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

این‌ها نام‌های تعریف شده توسط برنامه هستند؛ آن‌ها را در پیکربندی میزبان خود داشته باشید. نقطه پایانی Azure OpenAI v1 که در بررسی سلامت زیر استفاده می‌شود، پارامتر کوئری قدیمی `api-version` را نیاز ندارد؛ کلاینت‌های قدیمی‌تر `AzureOpenAI` آن را می‌خواهند، پس از API استفاده شده توسط برنامه خود پیروی کنید.

## الگوهای استقرار

### الگو ۱: استقرار تک منطقه‌ای

```yaml
# azure.yaml - Single region
services:
  ai-app:
    project: ./src
    host: containerapp
    env:
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
      AZURE_OPENAI_CHAT_DEPLOYMENT: gpt-4.1-mini
```

بهترین برای:
- توسعه و آزمایش
- برنامه‌های بازار تک
- بهینه‌سازی هزینه

### الگو ۲: استقرار چند منطقه‌ای

```bicep
// Illustrative fragment: extend the complete account declaration above.
// Each region must support the selected model/SKU and have quota.
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

خصوصیات/SKU حساب حذف شده باید فراهم شود؛ این تکه به این شکل استقرارپذیر نیست. مدل‌ها در هر حساب مستقر کنید و کنترل‌های مسیر‌یابی/تحمل خطا و محل داده را جداگانه پیاده‌سازی کنید.

بهترین برای:
- برنامه‌های جهانی
- نیازمندی‌های دسترسی بالا
- توزیع بار

### الگو ۳: استقرار ترکیبی

مدل‌های Microsoft Foundry را با سایر سرویس‌های هوش مصنوعی ترکیب کنید:

بخش‌های زیر فرض می‌کنند نام‌ها و `location` توسط قالب شامل فراهم شده‌اند.

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

نسخه‌های مدل را در پیکربندی برنامه یا زیرساخت به عنوان کد خود دنبال کنید. این JSON یک **مثال تعریف‌شده توسط برنامه** است، نه طرح AZD ساخته‌شده؛ باید پشتیبان پیاده‌سازی و به طور صریح مستقر شود:

```json
{
  "models": {
    "chat": {
      "name": "gpt-4.1-mini",
      "version": "2025-04-14",
      "fallback": "gpt-4.1"
    },
    "embedding": {
      "name": "text-embedding-3-large",
      "version": "1"
    }
  }
}
```

### به‌روزرسانی مدل‌ها

از هوک AZD برای بررسی فقط خواندنی دسترسی استفاده کنید، سپس IaC را به‌روزرسانی و مستقر کنید:

```bash
#!/bin/bash
# Illustrative hooks/check-model.sh (requires Azure CLI login and these variables)

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name "$AZURE_OPENAI_ACCOUNT_NAME" \
  --resource-group "$AZURE_RESOURCE_GROUP" \
  --query "[?name=='gpt-4.1-mini']"

```

اجرای `azd up` **خارج از** هوک برای اعمال تغییرات زیرساخت مدل و استقرار کد. هرگز `azd deploy` را از هوک `predeploy` فراخوانی نکنید: این هوک را به صورت بازگشتی فعال می‌کند. `azd deploy --timeout 1800` زمان اجرای استقرار برنامه را تمدید می‌کند؛ منابع Bicep را به‌روزرسانی نمی‌کند.

### آزمایش A/B

منبع مثال زیر نام استقرار و ظرفیت را انتخاب می‌کند؛ **یک** استقرار ایجاد می‌کند، نه آزمایش A/B. برای یک آزمایش واقعی، دو منبع استقرار متمایز فراهم کنید، یک بخش کنترل شده از درخواست‌ها را به هر یک مسیریابی کرده و کیفیت، تأخیر و هزینه را مقایسه کنید. فرض بر `openAi` از مثال حساب است:

```bicep
param enableABTesting bool = false

resource chatDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4.1-mini-${enableABTesting ? 'v1' : 'prod'}'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
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
# Capacity calculation example
import math
def calculate_required_capacity(
    requests_per_minute: int,
    avg_prompt_tokens: int,
    avg_completion_tokens: int,
    safety_margin: float = 0.2
) -> int:
    """Calculate required TPM capacity."""
    total_tokens_per_request = avg_prompt_tokens + avg_completion_tokens
    total_tpm = requests_per_minute * total_tokens_per_request
    return math.ceil(total_tpm * (1 + safety_margin))

# Example usage
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

خروجی مورد انتظار: `Required capacity: 9100 TPM`. با واحدهای ظرفیت ۱۰۰۰ TPM، به حداقل `10` گرد کنید، سپس تخمین نرخ محدودیت RPM مدل و سرویس را بررسی کنید (شامل بودجه خروجی درخواستی). این تخمین تقاضای توکن تضمینی در برابر محدودیت نیست.

### پیکربندی مقیاس خودکار

مقیاس خودکار را برای Container Apps پیکربندی کنید:

**منبع جزئی:** تنظیمات `template.scale` را در یک Container App کامل با مکان، محیط مدیریت شده، تصویر کانتینر، منابع و ورودی ادغام کنید. افزایش تکثیرها ظرفیت مدل را افزایش نمی‌دهد.

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

کنترل هزینه را پیاده‌سازی کنید:

**منبع بودجه مثال:** `budgetStartDate` را به اولین روز ماه جاری در UTC (برای مثال `2026-11-01T00:00:00Z` برای این بازبینی) تعریف کنید و آدرس تماس را جایگزین کنید. شروع باید با محدودیت‌های تاریخ سرویس هماهنگ باشد. بودجه‌ها روی داده‌های صورتحساب تأخیردار هشدار می‌دهند؛ هزینه را متوقف نمی‌کنند.

```bicep
param budgetStartDate string

@description('Enable cost management alerts')
param enableCostAlerts bool = true

resource budgetAlert 'Microsoft.Consumption/budgets@2024-08-01' = if (enableCostAlerts) {
  name: 'ai-budget-alert'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
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

### یکپارچه‌سازی Application Insights

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

```

بخش منبع فرض می‌کند `applicationInsightsName`، `location` و یک `logAnalyticsWorkspace` موجود است. نظارت را فراهم می‌کند، اما برنامه را اندازه‌گیری نمی‌کند یا معیارهای سفارشی ایجاد نمی‌کند.

### معیارهای سفارشی

معیارهای مخصوص هوش مصنوعی را دنبال کنید:

از توزیع [Azure Monitor OpenTelemetry](https://learn.microsoft.com/azure/azure-monitor/app/opentelemetry-enable?tabs=python) پشتیبانی شده استفاده کنید، نه SDK قدیمی `applicationinsights` Python. `azure-monitor-opentelemetry` را نصب، `APPLICATIONINSIGHTS_CONNECTION_STRING` را پیکربندی و یکبار در زمان شروع مقداردهی اولیه کنید:

```python
from azure.monitor.opentelemetry import configure_azure_monitor
from opentelemetry import trace

configure_azure_monitor()
tracer = trace.get_tracer(__name__)

def record_request(model: str, tokens: int, latency_ms: int, success: bool):
    with tracer.start_as_current_span("AI_Model_Request") as span:
        span.set_attribute("ai.model", model)
        span.set_attribute("ai.tokens", tokens)
        span.set_attribute("ai.latency_ms", latency_ms)
        span.set_attribute("ai.success", success)
```

این نمونه انتشار ویژگی‌ها را نشان می‌دهد، نه اندازه‌گیری واقعی فراخوان مدل. درخواست واقعی را در یک span بپیچید تا مدت آن اندازه‌گیری شود؛ `dependencies`/`traces` را در Application Insights بررسی کنید. هیچ پرامپت، پاسخ، کلید یا پیام خطای خام حاوی داده حساس ارسال نکنید.

### بررسی سلامت

نظارت سلامت سرویس هوش مصنوعی را پیاده‌سازی کنید:

نصب `fastapi`، `uvicorn`، `httpx` و `azure-identity`. متغیرهای endpoint/deployment بالا را تنظیم کنید و به caller `Cognitive Services OpenAI User` اعطا کنید. این **probe آمادگی** از محور داده v1 Azure OpenAI با Entra ID استفاده می‌کند؛ این یک درخواست مدل قابل هزینه است. پس از ذخیره با `uvicorn health:app` اجرا کنید به عنوان `health.py`. از یک بررسی سبُک جداگانه برای زنده بودن استفاده کنید، نتایج آمادگی را محدود به نرخ/کش کنید و این مسیر را بدون کنترل‌های دسترسی به صورت عمومی در دسترس قرار ندهید.

```python
# health.py
import os
from fastapi import FastAPI, HTTPException
import httpx
from azure.identity.aio import DefaultAzureCredential

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        async with DefaultAzureCredential() as credential:
            token = await credential.get_token("https://ai.azure.com/.default")
        endpoint = os.environ["AZURE_OPENAI_ENDPOINT"].rstrip("/")
        async with httpx.AsyncClient(timeout=20.0) as client:
            response = await client.post(
                f"{endpoint}/openai/v1/chat/completions",
                headers={"Authorization": f"Bearer {token.token}"},
                json={
                    "model": os.environ["AZURE_OPENAI_CHAT_DEPLOYMENT"],
                    "messages": [{"role": "user", "content": "Reply OK."}],
                    "max_completion_tokens": 8,
                },
            )
        response.raise_for_status()
        return {"status": "healthy"}
    except Exception:
        # Record sanitized internal diagnostics, not service responses/tokens.
        raise HTTPException(status_code=503, detail="AI readiness check failed") from None
```

انتظار می‌رود: `GET /health/ai-models` زمانی که دپلوی چت پیکربندی شده قابل استفاده است `200 {"status":"healthy"}` را برگرداند، یا `503` را بدون افشای جزئیات بالادستی. فهرست کردن دپلوی‌ها یک عملیات صفحه مدیریت است و پروب سلامت محور داده معتبر نیست.

## مراحل بعدی

1. **مرور [راهنمای یکپارچه‌سازی Microsoft Foundry](microsoft-foundry-integration.md)** برای الگوهای یکپارچه‌سازی سرویس
2. **تکمیل [آزمایشگاه کارگاه AI](ai-workshop-lab.md)** برای تجربه عملی
3. **پیاده‌سازی [تمرین‌های AI در تولید](../chapter-08-production/production-ai-practices.md)** برای استقرارهای سازمانی
4. **کاوش [راهنمای عیب‌یابی AI](../chapter-07-troubleshooting/ai-troubleshooting.md)** برای مشکلات رایج

## منابع

- [دسترسی مدل‌های Microsoft Foundry](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [مستندات Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [مقیاس‌پذیری Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [بهینه‌سازی هزینه مدل AI](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**ناوبری فصل:**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل فعلی**: فصل ۲ - توسعه هوش مصنوعی در اولویت
- **⬅️ قبلی**: [عوامل هوش مصنوعی](agents.md)
- **➡️ بعدی**: [آزمایشگاه کارگاه AI](ai-workshop-lab.md)
- **🚀 فصل بعدی**: [فصل ۳: پیکربندی](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مادری خود باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوء تفاهم یا برداشت نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->