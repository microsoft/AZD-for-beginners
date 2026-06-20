# تأليف قالب azd خاص بك

**تنقل الفصل:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل 4 - البنية التحتية كرمز والنشر
- **⬅️ السابق**: [دليل النشر](deployment-guide.md)
- **🚀 الفصل التالي**: [الفصل 5: حلول متعددة الوكلاء](../chapter-05-multi-agent/README.md)

> تم التحقق باستخدام `azd 1.25.6` في يونيو 2026.

## مقدمة

حتى الآن كنت قد *استهلكت* القوالب باستخدام `azd init --template <name>`. لكن بمجرد أن يصبح لديك هيكل مشروع يعجب فريقك—مثل تطبيق Container App مع قاعدة بيانات Cosmos DB والمراقبة المناسبة—سترغب في تحويله إلى قالب قابل لإعادة الاستخدام خاص بك. القالب هو مجرد مستودع Git يحتوي على بنية متوقعة تعرف azd كيف تقرأها. يوضح هذا الدرس كيفية بنائه من الصفر، اختباره، و(اختياريًا) نشره في معرض المجتمع.

## أهداف التعلم

بنهاية هذا الدرس، ستتمكن من:
- فهم ما الذي يجعل المجلد "قالب azd"
- معرفة الملفات المطلوبة وتخطيط المجلدات
- إضافة `azure.yaml` و`infra/` التي يمكن للآخرين إعادة استخدامها
- اختبار قالبك محليًا قبل المشاركة
- نشره و(اختياريًا) إرساله إلى Awesome AZD

## مخرجات التعلم

بعد إكمال هذا الدرس، ستكون قادرًا على:
- تهيئة مستودع قالب جديد
- تعميم البنية التحتية باستخدام معلمات لتعمل في أي اشتراك
- التحقق من قالب باستخدام `azd init` و`azd up`
- إضافة بيانات التعريف (metadata) التي يتطلبها معرض المجتمع

---

## ما هو القالب، حقًا؟

قالب azd هو **مستودع Git** يحتوي، على الأقل، على:

| ملف / مجلد | الغرض | مطلوب؟ |
|---------------|---------|-----------|
| `azure.yaml` | يصف الخدمات وبيئات الاستضافة ومزود البنية التحتية | ✅ نعم |
| `infra/` | Bicep أو Terraform أو Pulumi التي تنشئ الموارد | ✅ نعم |
| `src/` (or your code) | كود التطبيق الذي يقوم azd بنشره | ✅ نعم |
| `README.md` | كيفية استخدام القالب | ✅ يوصى بشدة |
| `.azdo/` or `.github/` | تعريفات CI/CD لخطوط الأنابيب | اختياري |
| `.devcontainer/` | بيئة تطوير قابلة لإعادة الإنتاج | اختياري |
| `azure.yaml` `metadata` | معلومات المعرض + معلومات القياس | اختياري (مطلوب للنشر) |

لا يوجد هنا سحر: عندما تشغّل `azd init --template you/your-repo`، يقوم azd باستنساخ المستودع وقراءة `azure.yaml`.

---

## الخطوة 1: تهيئة المستودع

أنشئ هيكل المجلدات يدويًا أو ابدأ من قالب مصغر وقم بتحريره:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# أنشئ التخطيط القياسي
mkdir -p src infra
```

يبدو التخطيط النهائي النموذجي كما يلي:

```
my-azd-template/
├── azure.yaml              # ← template definition
├── README.md               # ← how to use it
├── infra/
│   ├── main.bicep          # entry point
│   ├── main.parameters.json
│   └── modules/
│       └── web.bicep
├── src/
│   └── app/                # your application code
└── .github/
    └── workflows/
        └── azure-dev.yml   # optional CI/CD
```

---

## الخطوة 2: اكتب `azure.yaml`

هذا هو جوهر القالب. يخبر azd بما يجب نشره وكيف:

```yaml
# azure.yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: my-azd-template
metadata:
  template: my-azd-template@1.0.0   # name@version — used by the gallery and telemetry
infra:
  provider: bicep                   # or "terraform" / "pulumi"
  path: infra
services:
  web:
    project: ./src/app
    language: js                    # js | python | dotnet | java | go
    host: containerapp              # appservice | containerapp | function | aks | staticwebapp
```

> حقل `metadata.template` هو ما تستخدمه قياسات المعرض لحساب الاستخدام. استخدم اصطلاح `name@version`.

---

## الخطوة 3: تعميم البنية التحتية بالمعلمات

أهم قاعدة لقالب *قابل لإعادة الاستخدام*: **لا تقم بتضمين الأسماء أو المناطق أو القيم الخاصة بالاشتراك بصيغة ثابتة.** استخدم المعلمات ونمط رمز المورد بحيث يعمل نفس القالب في اشتراك أي شخص.

```bicep
// infra/main.bicep
targetScope = 'resourceGroup'

@minLength(1)
@description('Primary location for all resources')
param location string = resourceGroup().location

@minLength(1)
@maxLength(64)
@description('Name of the environment (used to generate resource names)')
param environmentName string

// Generate globally-unique, stable names from the environment + subscription
var resourceToken = uniqueString(subscription().id, environmentName, location)
var tags = { 'azd-env-name': environmentName }

module web 'modules/web.bicep' = {
  name: 'web'
  params: {
    name: 'app-${resourceToken}'
    location: location
    tags: tags
  }
}

output SERVICE_WEB_ENDPOINT_URL string = web.outputs.uri
```

شيئان يجعلان هذا القالب مناسبًا لإعادة الاستخدام:

1. **`azd-env-name` tag** — يستخدمها azd لتتبع وتنظيف الموارد لكل بيئة.
2. **`uniqueString(...)` resource token** — ينتج لاحقة ثابتة وفريدة عالميًا حتى لا تتصادم الأسماء.

وفر ملف معلمات مطابق يقرأ القيم التي يقوم azd بحقنها من البيئة:

```json
// infra/main.parameters.json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": { "value": "${AZURE_ENV_NAME}" },
    "location": { "value": "${AZURE_LOCATION}" }
  }
}
```

يقوم azd باستبدال `${AZURE_ENV_NAME}` و`${AZURE_LOCATION}` من البيئة الحالية تلقائيًا.

---

## الخطوة 4: اختبر قالبك محليًا

قبل المشاركة، أثبت أن القالب يعمل من حالة نظيفة.

**اختبر من المجلد المحلي** (لا حاجة لدفع إلى Git):

```bash
# من دليل فارغ، قم بالتهيئة باستخدام مسار القالب المحلي الخاص بك
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# توفير + النشر من البداية إلى النهاية
azd auth login
azd up
```

**ثم اختبر الإزالة**—القالب الجيد ينظف كل شيء تمامًا:

```bash
azd down --force --purge
```

إذا ترك `azd down` موارد وراءه، فمن المحتمل أنك نسيت إضافة وسم `azd-env-name` على مورد.

> **نصيحة:** شغّل `azd provision --preview` أولًا. يقوم بعملية what-if ويكشف أخطاء القالب قبل إنشاء أي مورد.

---

## الخطوة 5: نشر القالب

ادفع المستودع إلى GitHub (عام إذا أردت أن يستخدمه الآخرون):

```bash
gh repo create my-azd-template --public --source=. --push
```

يمكن لأي شخص الآن استخدامه:

```bash
azd init --template your-github-username/my-azd-template
```

---

## الخطوة 6 (اختياري): الإرسال إلى Awesome AZD

يعرض معرض [معرض Awesome AZD](https://azure.github.io/awesome-azd/) قوالب المجتمع. ليتم إدراج مستودعك، يجب أن يتضمن:

- ✅ ملف `README.md` واضح يتضمن المتطلبات المسبقة، مخططًا معماريًا، وملاحظات عن التكلفة
- ✅ ملف `azure.yaml` يعمل يحتوي على `metadata.template`
- ✅ بنية تحتية تنشئ الموارد بنجاح في اشتراكٍ جديد
- ✅ ملف `LICENSE`
- ✅ (مستحسن) مجلد `.devcontainer/` لتمكين Codespaces بنقرة واحدة

قم بالإرسال بفتح طلب سحب يضيف قالبك إلى ملف بيانات المعرض، باتباع دليل المساهمة في [مستودع Awesome AZD](https://github.com/Azure/awesome-azd).

---

## المشكلات الشائعة

| المشكلة | الحل |
|---------|-----|
| أسماء الموارد المكتوبة بشكل ثابت | استخدم رمز المورد `uniqueString()` |
| `azd down` يترك موارد | وسّم كل مورد (أو مجموعة الموارد) بـ `azd-env-name` |
| القالب يعمل عندك لكنه يفشل لدى الآخرين | قم بإزالة معرفات الاشتراك، ومعرفات المستأجر، وافتراضات المناطق |
| المخرجات غير مرتبطة بالتطبيق | صدّر `SERVICE_<NAME>_ENDPOINT_URL` وغيرها من مخرجات `AZURE_*` |
| رفض الإدراج في المعرض | أضف `README.md`, `LICENSE`, و`metadata.template` |

---

## الملخص

- القالب هو مجرد مستودع Git يحتوي على `azure.yaml`, `infra/`, والكود الخاص بك.
- عمم كل شيء بالمعلمات—الأسماء، المناطق، والمعرفات—بحيث يعمل في أي مكان.
- وسّم دائمًا الموارد بـ `azd-env-name` حتى يعمل `azd down`.
- اختبر محليًا باستخدام `azd init --template <local-path>` قبل النشر.
- أضف بيانات التعريف وملف README للتقديم إلى Awesome AZD.

---

## 🔗 التنقل

| الاتجاه | المورد |
|-----------|----------|
| **السابق** | [دليل النشر](deployment-guide.md) |
| **الصفحة الرئيسية للفصل** | [الفصل 4: البنية التحتية كرمز](README.md) |
| **الفصل التالي** | [الفصل 5: حلول متعددة الوكلاء](../chapter-05-multi-agent/README.md) |

## 📖 الموارد ذات الصلة

- [تهيئة الموارد](provisioning.md)
- [معرض Awesome AZD](https://azure.github.io/awesome-azd/)
- [التوثيق الرسمي لقوالب azd](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنويه**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي والمعتمد. للمعلومات الهامة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->