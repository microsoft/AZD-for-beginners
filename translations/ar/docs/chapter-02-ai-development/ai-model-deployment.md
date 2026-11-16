# نشر نموذج الذكاء الاصطناعي باستخدام Azure Developer CLI

**التنقل في الفصل:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل 2 - التطوير المعتمد على الذكاء الاصطناعي أولاً
- **⬅️ السابق**: [وكلاء الذكاء الاصطناعي](agents.md)
- **➡️ التالي**: [مختبر ورشة عمل الذكاء الاصطناعي](ai-workshop-lab.md)
- **🚀 الفصل التالي**: [الفصل 3: التكوين](../chapter-03-configuration/configuration.md)

يقدم هذا الدليل تعليمات شاملة لنشر نماذج الذكاء الاصطناعي باستخدام قوالب AZD، بدءًا من اختيار النموذج وصولاً إلى أنماط النشر للإنتاج.

> **مراجعة الإصدار (2026-11-04):** تم مراجعة التغييرات المتعلقة بـ CLI مقابل `azd` `1.37.2`؛ تظل توافر النماذج والإصدارات والحصص معتمدة على المنطقة والاشتراك. `azd deploy --timeout <seconds>` يتحكم في نافذة نشر الخدمة، وليس ضمان تنشيط الوكيل. راجع [ملاحظات الإصدار الحالية وإرشادات ترحيل الذكاء الاصطناعي](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes).

## جدول المحتويات

- [استراتيجية اختيار النموذج](#model-selection-strategy)
- [تكوين AZD لنماذج الذكاء الاصطناعي](#azd-configuration-for-ai-models)
- [أنماط النشر](#deployment-patterns)
- [إدارة النموذج](#model-management)
- [الاعتبارات الإنتاجية](#production-considerations)
- [المراقبة والقابلية للملاحظة](#monitoring-and-observability)

## استراتيجية اختيار النموذج

### نماذج Azure OpenAI في Microsoft Foundry

اختر النموذج المناسب لحالتك:

أعلن عن نشر النماذج في Bicep (أدناه)، وليس في إعدادات `services.*.config.AZURE_OPENAI_MODELS` عشوائية. لا يفسر AZD مثل هذا الإعداد كقائمة موارد نموذج. يشير `project` لخدمة إلى مصدر التطبيق، وليس إلى دليل `infra/` الخاص بها.

تستخدم الأمثلة نسخة `gpt-4.1-mini` المنشورة **`2025-04-14`** وإصدار التضمين **`1`**. تحقق من أن إصدار النموذج وحزمة النشر مدعومان في منطقتك/حسابك الهدف قبل التجهيز.

### تخطيط سعة النموذج

| نوع النموذج | حالة الاستخدام | الطلب التوضيحي على الرموز | اعتبارات التكلفة |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | الدردشة، الأسئلة والأجوبة | 10,000-50,000 رمز/دقيقة | الموازنة بين التكلفة والجودة لحمل العمل الخاص بك |
| gpt-4.1 | المهام المعقدة | 20,000-100,000 رمز/دقيقة | تقييم مكاسب الجودة مقابل تكلفة الرموز |
| text-embedding-3-large | البحث، RAG | 30,000-120,000 رمز/دقيقة | احتسب الإدخال بالإضافة إلى حركة المرور الاستعلامية |
| Whisper | تحويل الكلام إلى نص | خطط باستخدام مدة الصوت وحدود الطلب | لا تطبق صيغة سعة رمز TPM لنموذج نصي |

TPM تعني الرموز لكل دقيقة. لهذه النشرات النصية القياسية، يكون ARM `sku.capacity` بوحدات **1,000 رمز/دقيقة** وليس TPM فردية (السعة `10` تعني 10,000 رمز/دقيقة). تختلف نسب RPM إلى TPM بحسب نوع النموذج/النشر؛ تحقق من كلا الحدين مقابل [وثائق الحصة](https://learn.microsoft.com/azure/ai-foundry/openai/quotas-limits?view=foundry-classic). هذه النطاقات أمثلة فقط وليست توصيات للحجم.

## تكوين AZD لنماذج الذكاء الاصطناعي

### تكوين قالب Bicep

أنشئ نشرات النموذج عبر قوالب Bicep:

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

هذا مثال **للبنية التحتية للتطوير** محدود بمجموعة الموارد، وليس قالب تطبيق AZD كامل. الحساب يسمح بالوصول الشبكي العام ويتطلب مصادقة Entra ID/RBAC (`Cognitive Services OpenAI User` للمتصلين). يحتاج الإنتاج إلى نقطة نهاية خاصة وDNS واتصال التطبيق كما هو موضح في الفصل 8. يحتاج AZD أيضًا إلى قالب رئيسي / تعيين معلمات وموارد مضيف التطبيق؛ استخدم عينة عملية للنشر الكامل.

### متغيرات البيئة

قم بتكوين بيئة تطبيقك:

```bash
# .env configuration
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

هذه أسماء معرفة من التطبيق؛ قم بربطها في تكوين المضيف الخاص بك. نقطة نهاية Azure OpenAI v1 المستخدمة في فحص الصحة أدناه لا تتطلب معامل استعلام `api-version` المؤرخ؛ يحتاج العملاء الأقدم `AzureOpenAI` لذلك، فاتبع توليد API المستخدم في تطبيقك.

## أنماط النشر

### النمط 1: النشر في منطقة واحدة

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

الأفضل لـ:
- التطوير والاختبار
- التطبيقات ذات السوق الواحد
- تحسين التكلفة

### النمط 2: النشر في مناطق متعددة

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

يجب توفير الخصائص / SKU للحساب المهملة؛ هذا المقطع لا يمكن نشره كما هو مكتوب. انشر النماذج في كل حساب وطبق التوجيه / الفشل والتحكم في مقيم البيانات بشكل منفصل.

الأفضل لـ:
- التطبيقات العالمية
- متطلبات التوفر العالي
- توزيع الحِمل

### النمط 3: النشر الهجين

دمج نماذج Microsoft Foundry مع خدمات الذكاء الاصطناعي الأخرى:

تفترض المقاطع التالية أن الأسماء و `location` تم توفيرها بالقالب المحتوي.

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

## إدارة النموذج

### التحكم في الإصدارات

تتبع إصدارات النموذج في تكوين تطبيقك أو IaC. هذا JSON هو **مثال معرف بواسطة التطبيق**، وليس مخطط نموذج مدمج بـ AZD؛ يجب تنفيذ خطة احتياطية ونشرها صراحة:

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

### تحديثات النموذج

استخدم خطاف AZD لفحص التوفر للقراءة فقط، ثم حدّث IaC وجهزها:

```bash
#!/bin/bash
# Illustrative hooks/check-model.sh (requires Azure CLI login and these variables)

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name "$AZURE_OPENAI_ACCOUNT_NAME" \
  --resource-group "$AZURE_RESOURCE_GROUP" \
  --query "[?name=='gpt-4.1-mini']"

```

نفّذ `azd up` **خارج** الخطاف لتطبيق تغييرات البنية التحتية للنموذج ونشر الكود. لا تستدعي أبدًا `azd deploy` من خطاف `predeploy`: فإنه يؤدي إلى تكرار نفس الخطاف. `azd deploy --timeout 1800` يمدد مهلة نشر التطبيق؛ ولا يحدث موارد Bicep.

### اختبار A/B

المورد التوضيحي أدناه يختار اسم نشر وسعة؛ ينشئ **نشرًا واحدًا**، وليس اختبار A/B. للتجربة الحقيقية، جهز موردين نشر مميزين، ووجه جزءًا محكمًا من الطلبات لكل منهما، وقارن الجودة والزمن والتكلفة. يفترض `openAi` من مثال الحساب:

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

## اعتبارات الإنتاج

### تخطيط السعة

احسب السعة المطلوبة بناءً على أنماط الاستخدام:

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

الناتج المتوقع: `Required capacity: 9100 TPM`. مع وحدات سعة 1,000 رمز/دقيقة، قرّب إلى الأعلى على الأقل إلى `10`، ثم تحقق من تقدير RPM والحدود الخاصة بالنموذج (بما في ذلك ميزانية الإخراج المطلوبة). هذا التقدير للطلب على الرموز ليس ضمانًا ضد التقييد.

### تكوين التوسع التلقائي

قم بتكوين التوسع التلقائي لتطبيقات الحاويات:

**مورد جزئي:** دمج إعدادات `template.scale` في تطبيق حاويات كامل مع الموقع، البيئة المُدارة، صورة الحاوية، الموارد، والوصول. زيادة النسخ لا تزيد حصة النموذج.

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

### تحسين التكاليف

نفذ ضوابط التكلفة:

**مورد الميزانية التوضيحي:** عرّف `budgetStartDate` كأول يوم في الشهر الحالي بالتوقيت العالمي (مثلاً `2026-11-01T00:00:00Z` لهذه المراجعة)، واستبدل عنوان الاتصال. يجب أن يلبي البداية قيود تاريخ الخدمة الحالية. تنبه الميزانيات على تأخر بيانات الفوترة؛ لكنها لا توقف الإنفاق.

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

## المراقبة والقابلية للملاحظة

### تكامل Application Insights

قم بتكوين المراقبة لأعباء عمل الذكاء الاصطناعي:

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

يفترض المقطع المورد `applicationInsightsName`، `location`، و `logAnalyticsWorkspace` موجودًا. يقوم بتوفير المراقبة، لكنه لا يجهز التطبيق أو ينشئ مقاييس مخصصة.

### المقاييس المخصصة

تتبع المقاييس الخاصة بالذكاء الاصطناعي:

استخدم [توزيع Azure Monitor OpenTelemetry المدعوم](https://learn.microsoft.com/azure/azure-monitor/app/opentelemetry-enable?tabs=python)، وليس SDK بايثون القديم `applicationinsights`. ثبت `azure-monitor-opentelemetry`، وقم بتكوين `APPLICATIONINSIGHTS_CONNECTION_STRING`، وابدأ مرة واحدة عند التشغيل:

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

يوضح هذا إصدار السمات، وليس تجهيز استدعاء النموذج الفعلي. غلف الطلب الحقيقي في فترة قياس لقياس مدته؛ افحص `dependencies`/`traces` في Application Insights. لا ترسل موجهات، ردود، مفاتيح، أو رسائل استثناءات خام تحتوي على بيانات حساسة.

### فحوصات الصحة

طبق مراقبة صحة خدمة الذكاء الاصطناعي:

ثبت `fastapi`، `uvicorn`، `httpx`، و `azure-identity`. عيّن متغيرات نقطة النهاية/النشر أعلاه وامنح المتصل `Cognitive Services OpenAI User`. يستخدم هذا **فحص الجاهزية** طائرة بيانات Azure OpenAI v1 مع Entra ID؛ يقوم باستدعاء نموذج يمكن فوترته. شغّل مع `uvicorn health:app` بعد الحفظ كـ `health.py`. استخدم فحص خفة وزن منفصل للحيوية، قيد الحد/خزن نتائج الجاهزية، ولا تكشف هذا المسار علنًا بدون ضوابط وصول.

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

المتوقع: `GET /health/ai-models` ترجع `200 {"status":"healthy"}` عند قابلية استخدام نشر الدردشة المكوّن، أو `503` دون الإفصاح عن التفاصيل العليا. سرد النشرات هو عملية على مستوى الإدارة وليس فحص صحة صالحة على مستوى البيانات.

## الخطوات التالية

1. **راجع [دليل تكامل Microsoft Foundry](microsoft-foundry-integration.md)** لأنماط دمج الخدمة  
2. **أكمل [مختبر ورشة عمل الذكاء الاصطناعي](ai-workshop-lab.md)** للتجربة العملية  
3. **طبق [ممارسات الذكاء الاصطناعي للإنتاج](../chapter-08-production/production-ai-practices.md)** لنشرات المؤسسات  
4. **استكشف [دليل استكشاف مشكلات الذكاء الاصطناعي](../chapter-07-troubleshooting/ai-troubleshooting.md)** للقضايا الشائعة  

## الموارد

- [توفر نموذج Microsoft Foundry](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [توثيق Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [توسع تطبيقات الحاويات](https://learn.microsoft.com/azure/container-apps/scale-app)
- [تحسين تكلفة نموذج الذكاء الاصطناعي](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**التنقل في الفصل:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل 2 - التطوير المعتمد على الذكاء الاصطناعي أولاً
- **⬅️ السابق**: [وكلاء الذكاء الاصطناعي](agents.md)
- **➡️ التالي**: [مختبر ورشة عمل الذكاء الاصطناعي](ai-workshop-lab.md)
- **🚀 الفصل التالي**: [الفصل 3: التكوين](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنويه**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي والمعتمد. للمعلومات الهامة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->