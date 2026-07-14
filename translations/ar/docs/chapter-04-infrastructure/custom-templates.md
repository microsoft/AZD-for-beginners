# تأليف قالب azd خاص بك

**تنقل الفصل:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل 4 - البنية التحتية ككود والنشر
- **⬅️ السابق**: [دليل النشر](deployment-guide.md)
- **🚀 الفصل التالي**: [الفصل 5: حلول الوكلاء المتعددين](../chapter-05-multi-agent/README.md)

> تم التحقق من صحة المحتوى مقابل `azd 1.27.1` في يوليو 2026.

## مقدمة

حتى الآن كنت *تستخدم* القوالب باستخدام الأمر `azd init --template <name>`. ولكن بمجرد أن تحصل على تخطيط المشروع الذي يفضله فريقك — لنفترض تطبيق حاوية مع قاعدة بيانات Cosmos والمراقبة المناسبة — سترغب في تحويله إلى قالب قابل لإعادة الاستخدام خاص بك. القالب هو مجرد مستودع Git به هيكل متوقع تعرف azd كيفية قراءته. تعرض لك هذه الدرس كيفية بناء واحد من الصفر، اختباره، و(اختياريًا) نشره في معرض المجتمع.

## أهداف التعلم

بنهاية هذا الدرس، ستتمكن من:
- فهم ما الذي يجعل المجلد "قالب azd"
- معرفة الملفات المطلوبة وتخطيط المجلدات
- إضافة ملف `azure.yaml` و`infra/` لكي يعيد الآخرون استخدامهما
- اختبار القالب محليًا قبل مشاركته
- نشره و(اختياريًا) تقديمه إلى معرض Awesome AZD

## نتائج التعلم

بعد إكمال هذا الدرس، ستكون قادرًا على:
- إنشاء مستودع قالب جديد
- معلمة البنية التحتية بحيث تعمل في أي اشتراك
- التحقق من صحة القالب باستخدام `azd init` و `azd up`
- إضافة البيانات الوصفية المطلوبة من معرض المجتمع

---

## ما هو القالب، حقًا؟

قالب azd هو **مستودع Git** يحتوي، على الأقل، على:

| الملف / المجلد | الغرض | مطلوب؟ |
|---------------|---------|-----------|
| `azure.yaml` | يصف الخدمات، المضيفين، ومزود البنية التحتية | ✅ نعم |
| `infra/` | Bicep أو Terraform أو Pulumi التي تنشئ الموارد | ✅ نعم |
| `src/` (أو كودك) | كود التطبيق الذي ينشره azd | ✅ نعم |
| `README.md` | كيفية استخدام القالب | ✅ يوصى بشدة |
| `.azdo/` أو `.github/` | تعريفات خطوط أنابيب CI/CD | اختياري |
| `.devcontainer/` | بيئة تطوير قابلة لإعادة الإنتاج | اختياري |
| بيانات `metadata` في `azure.yaml` | معلومات المعرض والقياس | اختياري (مطلوب للنشر) |

لا يوجد شيء سحري هنا: عند تشغيل `azd init --template you/your-repo`، يقوم azd باستنساخ المستودع ويقرأ ملف `azure.yaml`.

---

## الخطوة 1: إنشاء هيكل المستودع

أنشئ هيكل المجلد يدويًا أو ابدأ من قالب بسيط وعدله:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# إنشاء التخطيط القياسي
mkdir -p src infra
```

الشكل النموذجي النهائي يكون هكذا:

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

## الخطوة 2: كتابة `azure.yaml`

هذا هو قلب القالب. يخبر azd ماذا ينشر وكيف:

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

> حقل `metadata.template` هو ما يستخدمه قياس المعرض لحساب الاستخدام. استخدم قاعدة التسمية `name@version`.

---

## الخطوة 3: معلمة البنية التحتية

القاعدة الوحيدة الأهم لقالب *قابل لإعادة الاستخدام*: **لا تستخدم أسماء أو مناطق أو قيم مرتبطة باشتراك معين بشكل ثابت**. استخدم المعلمات ونمط رمز المورد بحيث يعمل نفس القالب في اشتراك أي شخص.

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

اثنان من الأمور تجعل هذا القالب ملائمًا:

1. **وسم `azd-env-name`** — يستخدمه azd لتتبع وتنظيف الموارد لكل بيئة.
2. **رمز المورد `uniqueString(...)`** — ينتج لاحقة ثابتة وفريدة عالميًا حتى لا تتصادم الأسماء.

قدم ملف معلمات مطابق يقرأ القيم التي يحقنها azd من البيئة:

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

يقوم azd باستبدال `${AZURE_ENV_NAME}` و`${AZURE_LOCATION}` تلقائيًا من البيئة الحالية.

---

## الخطوة 4: اختبار القالب محليًا

قبل المشاركة، أثبت أن القالب يعمل من حالة نظيفة.

**اختبر من المجلد المحلي** (لا حاجة لدفع Git):

```bash
# من مجلد فارغ، قم بالتهيئة باستخدام مسار القالب المحلي الخاص بك
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# الإعداد + النشر من البداية للنهاية
azd auth login
azd up
```

**ثم اختبر إزالة النشر** — القالب الجيد ينظف نفسه بالكامل:

```bash
azd down --force --purge
```

إذا ترك `azd down` موارد، ربما نسيت وسم `azd-env-name` على مورد ما.

> **نصيحة:** شغّل `azd provision --preview` أولًا. ينفذ سيناريو ماذا لو ويكشف أخطاء القالب قبل إنشاء أي مورد.

---

## الخطوة 5: نشر القالب

ادفع المستودع إلى GitHub (عامة إذا أردت للآخرين استخدامه):

```bash
gh repo create my-azd-template --public --source=. --push
```

يمكن لأي شخص الآن استخدامه:

```bash
azd init --template your-github-username/my-azd-template
```

---

## الخطوة 6 (اختياري): التقديم إلى Awesome AZD

يعرض [معرض Awesome AZD](https://azure.github.io/awesome-azd/) قوالب المجتمع. ليتم إدراج مستودعك يجب أن يحتوي على:

- ✅ ملف `README.md` واضح مع المتطلبات المسبقة، ومخطط هندسي، وملاحظات تكلفة
- ✅ ملف `azure.yaml` يعمل مع `metadata.template`
- ✅ بنية تحتية تنشأ نظيفة في اشتراك جديد
- ✅ ملف `LICENSE`
- ✅ (موصى به) مجلد `.devcontainer/` لتشغيل Codespaces بنقرة واحدة

قدّم بطلب سحب يضيف قالبك إلى ملف بيانات المعرض، متبعًا دليل المساهمة في [مستودع Awesome AZD](https://github.com/Azure/awesome-azd).

---

## المزالق الشائعة

| المأزق | الحل |
|---------|-----|
| أسماء الموارد المحددة ثابتة | استخدم رمز المورد `uniqueString()` |
| `azd down` يترك موارد | وسم كل مورد (أو مجموعة الموارد) بـ `azd-env-name` |
| يعمل القالب لك، يفشل للآخرين | احذف معرفات الاشتراك، معرفات المستأجر، وافتراضات المناطق |
| المخرجات غير مرتبطة بالتطبيق | صدّر `SERVICE_<NAME>_ENDPOINT_URL` ومخرجات `AZURE_*` الأخرى |
| رفض التقديم للمعرض | أضف `README.md`، و`LICENSE`، و`metadata.template` |

---

## خلاصة

- القالب هو فقط مستودع Git مع `azure.yaml`، `infra/`، وكودك.
- معلمة كل شيء—الأسماء، المناطق، والمعرفات—لتشغيله في أي مكان.
- ضع دائمًا وسم `azd-env-name` على الموارد حتى يعمل `azd down`.
- اختبر محليًا باستخدام `azd init --template <local-path>` قبل النشر.
- أضف البيانات الوصفية وREADME للتقديم إلى Awesome AZD.

---

## 🔗 التنقل

| الاتجاه | المورد |
|-----------|----------|
| **السابق** | [دليل النشر](deployment-guide.md) |
| **صفحة الفصل الرئيسية** | [الفصل 4: البنية التحتية ككود](README.md) |
| **الفصل التالي** | [الفصل 5: حلول الوكلاء المتعددين](../chapter-05-multi-agent/README.md) |

## 📖 الموارد ذات الصلة

- [توفير الموارد](provisioning.md)
- [معرض Awesome AZD](https://azure.github.io/awesome-azd/)
- [توثيق القوالب الرسمي لـ azd](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنويه**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي والمعتمد. للمعلومات الهامة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->