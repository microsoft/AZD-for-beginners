# إنشاء قالب azd خاص بك

**التنقل في الفصل:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل 4 - البنية التحتية كرمز والنشر
- **⬅️ السابق**: [دليل النشر](deployment-guide.md)
- **🚀 الفصل التالي**: [الفصل 5: حلول متعددة الوكلاء](../chapter-05-multi-agent/README.md)

> تمت المراجعة بناءً على `azd 1.37.2` (نوفمبر 2026). هذا هو **استعراض إنشاء مع ملفات جزئية فقط**، وليس قالبًا كاملاً: يجب عليك توفير رمز التطبيق و `modules/web.bicep` مع بيئته ومسجله وتطبيق الحاوية والمخرجات قبل النشر. لم يتم تنفيذ توفير Azure في هذه المراجعة.

## المقدمة

حتى الآن قد *استهلكت* قوالب باستخدام `azd init --template <name>`. لكن بمجرد أن تحصل على هيكل مشروع يعجب فريقك — مثل تطبيق حاوية مع قاعدة بيانات كوزموس والمراقبة المناسبة — سترغب في تحويله إلى قالب قابل لإعادة الاستخدام خاص بك. القالب هو مجرد مستودع Git به هيكل متوقع يمكن لـ azd قراءته. يوضح هذا الدرس كيفية بناء واحد من الصفر، اختباره، و (اختياريًا) نشره إلى معرض المجتمع.

## أهداف التعلم

في نهاية هذا الدرس، ستتمكن من:
- فهم ما الذي يجعل المجلد "قالب azd"
- معرفة الملفات المطلوبة وترتيب المجلدات
- إضافة `azure.yaml` و `infra/` يمكن للآخرين إعادة استخدامها
- اختبار القالب محليًا قبل مشاركته
- نشره و (اختياريًا) تقديمه إلى Awesome AZD

## نتائج التعلم

بعد إكمال هذا الدرس، ستتمكن من:
- تجهيز مستودع قالب جديد
- معلمة البنية التحتية بحيث تعمل في أي اشتراك
- التحقق من صحة القالب باستخدام `azd init` و `azd up`
- إضافة البيانات الوصفية المطلوبة من معرض المجتمع

---

## ما هو القالب، حقًا؟

قالب azd هو **مستودع Git** يحتوي، على الأقل على:

| الملف / المجلد | الغرض | مطلوب؟ |
|---------------|---------|-----------|
| `azure.yaml` | يصف الخدمات، المضيفين، ومزود البنية التحتية | ✅ نعم |
| `infra/` | تعريفات توفير Bicep أو Terraform | مطلوب لهذا المثال IaC الصريح؛ يمكن للمشاريع الناتجة التي تُنشئ البنية التحتية إغفاله |
| `src/` (أو رمزك) | رمز التطبيق الذي ينشره azd | مطلوب للخدمات القائمة على المصدر؛ ليست كل القوالب تحتوي على رمز تطبيق |
| `README.md` | كيفية استخدام القالب | ✅ موصى به بشدة |
| `.azdo/` أو `.github/` | تعريفات خط أنابيب CI/CD | اختياري |
| `.devcontainer/` | بيئة تطوير قابلة لإعادة الإنتاج | اختياري |
| `azure.yaml` `metadata` | هوية القالب / معلومات القياس عن بُعد | موصى به؛ لا يتطلب نشر مستودع Git ذلك |

لا يوجد شيء سحري هنا: عند تشغيل `azd init --template you/your-repo`، يقوم azd باستنساخ المستودع وقراءة `azure.yaml`.

---

## الخطوة 1: تجهيز المستودع

أنشئ هيكل المجلد يدويًا أو ابدأ من قالب بسيط وقم بتحريره:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Create the standard layout
mkdir -p src infra
```

يبدوا تخطيط نموذج مكتمل بهذا الشكل:

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

هذا هو قلب القالب. يخبر azd ما الذي ينشره وكيف:

```yaml
# azure.yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: my-azd-template
metadata:
  template: my-azd-template@1.0.0   # name@version — used by the gallery and telemetry
infra:
  provider: bicep                   # built-in alternative: terraform
  path: infra
services:
  web:
    project: ./src/app
    language: js                    # js | python | dotnet | java | go
    host: containerapp              # appservice | containerapp | function | aks | staticwebapp
```

> حقل `metadata.template` هو ما يستخدمه قياس معرض الاستخدام للعد. استخدم convention `name@version`.

---

## الخطوة 3: معلمة البنية التحتية

القاعدة الأهم لقالب *قابل لإعادة الاستخدام*: **لا تقم بترميز الأسماء أو المناطق أو القيم الخاصة بالاشتراك بشكل ثابت.** استخدم المعلمات ونمط رمز المورد بحيث يعمل نفس القالب في اشتراك أي شخص.

```bicep
// infra/main.bicep
targetScope = 'subscription'

@minLength(1)
@description('Primary location for all resources')
param location string

@minLength(1)
@maxLength(64)
@description('Name of the environment (used to generate resource names)')
param environmentName string

// Generate globally-unique, stable names from the environment + subscription
var resourceToken = uniqueString(subscription().id, environmentName, location)
var tags = { 'azd-env-name': environmentName }

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-${environmentName}'
  location: location
  tags: tags
}

module web 'modules/web.bicep' = {
  name: 'web'
  scope: rg
  params: {
    name: 'app-${resourceToken}'
    location: location
    tags: tags
  }
}

output SERVICE_WEB_ENDPOINT_URL string = web.outputs.uri
```

هناك شيئين يجعلانه قالبًا ملائمًا:

1. **وسم `azd-env-name`** — يستخدمه azd لتتبع وتنظيف الموارد حسب البيئة.
2. **رمز مورد `uniqueString(...)`** — ينتج لاحقة تجزئة ثابتة لتقليل التصادمات؛ لكنه ليس ضمانًا للتفرد العالمي.

يجب أن يقبل `modules/web.bicep` الناقص `name`، `location`، و`tags`، أن يوفر بيئة/مسجل تطبيقات الحاوية والتطبيق، يوسم التطبيق بـ `azd-service-name: web`، ويصدر `uri`. يجب أيضًا أن يعرض قيم المسجل المطلوبة لتدفق البناء/النشر المختار (مثل `AZURE_CONTAINER_REGISTRY_ENDPOINT` من الموديل الجذر). مخرج نقطة النهاية لوحده لا يوصّل اكتشاف الخدمة أو إعدادات التطبيق أو المصادقة على المسجل.

قدّم ملف معلمات متطابق يقرأ القيم التي يحقنها azd من البيئة:

احفظ الملف التالي باسم `infra/main.parameters.json`:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": { "value": "${AZURE_ENV_NAME}" },
    "location": { "value": "${AZURE_LOCATION}" }
  }
}
```

يستبدل azd تلقائيًا `${AZURE_ENV_NAME}` و `${AZURE_LOCATION}` من البيئة الحالية.

---

## الخطوة 4: اختبار قالبك محليًا

قبل المشاركة، أثبت أن القالب يعمل من حالة نظيفة.

**اختبر من المجلد المحلي** (بدون الحاجة لدفع Git):

```bash
# From an empty directory, initialize using your local template path
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template .

# Provision + deploy end to end
azd auth login
azd up
```

**ثم اختبر التنظيف** — قالب جيد ينظف كل شيء تمامًا:

```bash
azd down --force --purge
```

إذا ترك `azd down` موارد خلفه، تحقق من اكتشاف البيئة/مجموعة الموارد، الموارد المشتركة/الخارجية، الأذونات، الأقفال، والحماية ضد الحذف التام. `--purge` لا يحذف حالة `.azure/` المحلية.

> **نصيحة:** بعد توفير كل الملفات الناقصة، شغّل `azd provision --preview` أولاً. افحص الخطافات قبل المعاينة لأنها قد تنفذ أوامر ذات تأثير جانبي. المعاينة ليست تقديرًا للسعر أو ضمانًا لنجاح التوفير.

---

## الخطوة 5: نشر القالب

ادفع المستودع إلى GitHub (عامة إذا أردت أن يستخدمه الآخرون):

```bash
# Return to the SOURCE template folder, not /tmp/test-run.
# Review .gitignore and staged content; never commit .azure/ or secrets.
git add azure.yaml infra src README.md .gitignore
git commit -m "Add reusable azd template"
gh repo create my-azd-template --public --source=. --push
```

يمكن لأي شخص الآن استخدامه:

```bash
azd init --template your-github-username/my-azd-template .
```

---

## الخطوة 6 (اختياري): تقديم إلى Awesome AZD

يعرض [معرض Awesome AZD](https://azure.github.io/awesome-azd/) قوالب المجتمع. لكي تُدرج، يجب أن يحتوي مستودعك على:

- ✅ `README.md` واضحة مع المتطلبات المسبقة، مخطط معماري، وملاحظات تكلفة
- ✅ `azure.yaml` عاملة مع `metadata.template`
- ✅ بنية تحتية توفّر نظيفة في اشتراك جديد
- ✅ ملف `LICENSE`
- ✅ (موصى به) `.devcontainer/` لـ Codespaces بنقرة واحدة

قدم الطلب بفتح طلب سحب يضيف قالبك إلى ملف بيانات المعرض، متبعًا دليل المساهمة في [مستودع Awesome AZD](https://github.com/Azure/awesome-azd).

---

## الأخطاء الشائعة

| المشكلة | الحل |
|---------|-----|
| أسماء الموارد مشفرة ثابتة | استخدم رمز المورد `uniqueString()` |
| `azd down` يترك موارد | وسم كل مورد (أو مجموعة الموارد) بـ `azd-env-name` |
| القالب يعمل لديك لكن يفشل عند الآخرين | أزل معرفات الاشتراك، معرفات المستأجر، وافتراضات المناطق |
| المخرجات غير موصولة بالتطبيق | طابق `azd-service-name`/`resourceName` للنشر واربط المخرجات صراحةً بإعدادات التطبيق |
| رفض تقديم القالب للمعرض | أضف `README.md`، `LICENSE`، و `metadata.template` |

---

## الخلاصة

- القالب هو ببساطة مستودع Git مع `azure.yaml`، `infra/`، ورمزك.
- قم بمعلمة كل شيء — الأسماء، المناطق، والمعرفات — لتشغيله في أي مكان.
- وسم الموارد دائمًا بـ `azd-env-name` لكي يعمل `azd down`.
- اختبر محليًا باستخدام `azd init --template <local-path>` قبل النشر.
- أضف البيانات الوصفية وREADME لتقديمه إلى Awesome AZD.

---

## 🔗 التنقل

| الاتجاه | المورد |
|-----------|----------|
| **السابق** | [دليل النشر](deployment-guide.md) |
| **الصفحة الرئيسية للفصل** | [الفصل 4: البنية التحتية كرمز](README.md) |
| **الفصل التالي** | [الفصل 5: حلول متعددة الوكلاء](../chapter-05-multi-agent/README.md) |

## 📖 الموارد ذات الصلة

- [توفير الموارد](provisioning.md)
- [معرض Awesome AZD](https://azure.github.io/awesome-azd/)
- [التوثيق الرسمي لقوالب azd](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنويه**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي والمعتمد. للمعلومات الهامة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->