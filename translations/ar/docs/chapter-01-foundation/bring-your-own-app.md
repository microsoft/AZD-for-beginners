# أحضر تطبيقك الخاص - أضف azd إلى مشروع موجود

**Chapter Navigation:**
- **📚 Course Home**: [AZD للمبتدئين](../../README.md)
- **📖 Current Chapter**: الفصل 1 - الأساس والبدء السريع
- **⬅️ Previous**: [مشروعك الأول](first-project.md)
- **➡️ Next**: [حاويات التطوير وCodespaces](dev-containers.md)

> تم التحقق مقابل `azd 1.25.6` في يونيو 2026.

## المقدمة

في [مشروعك الأول](first-project.md) قمت بنشر تطبيق بالبدء من قالب. لكن في معظم الأحيان لديك بالفعل تطبيق — واجهة برمجة تطبيقات Node.js، خدمة Python Flask، تطبيق ويب .NET — موجود في مجلد على جهازك. يوضح هذا الدرس كيفية إضافة azd إلى هذا الكود القائم حتى تتمكن من نشره باستخدام `azd up`، دون الحاجة إلى قالب.

## أهداف التعلم

بنهاية هذا الدرس، ستتمكن من:
- فهم الطرق الثلاث لبدء مشروع azd
- تشغيل `azd init` داخل قاعدة رمز موجودة
- فهم ما تقوم به `azure.yaml` ومجلد `infra/` لتطبيقك
- معرفة متى تسمح لـ azd بتوليد البنية التحتية ومتى تكتبها بنفسك
- نشر تطبيقك القائم إلى Azure باستخدام `azd up`

## نواتج التعلم

بعد إكمال هذا الدرس، ستتمكن من:
- تهيئة azd في مشروع لديك بالفعل
- قراءة وتحرير ملف `azure.yaml` أساسي
- توليد بنية تحتية مبدئية باستخدام `azd infra generate`
- اختيار مضيف Azure مناسب لتطبيقك
- نشر وتنظيف تطبيقك الخاص

---

## ثلاث طرق لبدء مشروع azd

| Starting point | Command | When to use |
|----------------|---------|-------------|
| **من قالب** | `azd init --template <name>` | للتعلّم، أو لبدء تطبيق جديد من عيّنة مثبتة |
| **من الكود القائم لديك** | `azd init` (في مجلد مشروعك) | لديك بالفعل تطبيق وتريد نشره |
| **من مستودع Git** | `azd init --from-code` (في مستودع مستنسخ) | تبني azd لمستودع قائم |

لقد مارست الخيار الأول بالفعل. يغطي هذا الدرس الخيار الثاني — السيناريو الأكثر شيوعًا في العالم الحقيقي.

---

## الخطوة 1: شغّل `azd init` في مشروعك

افتح محطة طرفية **داخل مجلد مشروعك القائم** وشغّل:

```bash
cd my-existing-app
azd init
```

سيطلب منك azd كيفية التهيئة. اختر:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

اختر **"استخدم الشفرة في الدليل الحالي."** ثم يقوم azd بمسح مجلدك، يكتشف لغتك وإطار العمل، ويقترح مضيفًا.

### ما الذي يكتشفه azd

يبحث azd عن إشارات مثل `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, أو `Dockerfile`، ويقترح مضيف Azure مطابقًا:

| Your app | Likely detected host |
|----------|----------------------|
| تطبيق ويب Node.js / Python / .NET | Azure App Service أو Container Apps |
| تطبيق داخل حاوية (`Dockerfile`) | Azure Container Apps |
| تطبيق Function | Azure Functions |
| موقع ثابت (مخرجات بناء React/Vue) | Azure Static Web Apps |

أكد الخدمة/الخدمات المكتشفة، وسيقوم azd ببناء الملفات التي تحتاجها.

---

## الخطوة 2: فهم ما أنشأه azd

بعد التهيئة، سيكون لديك شيئان جديدان في مشروعك:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # ← NEW: Infrastructure as Code (Bicep by default)
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — تعريف المشروع

هذا هو قلب مشروع azd. يبدو ملف بسيط كهذا:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

كتلة `services` هي الجزء الأساسي: كل إدخال يربط مجلدًا من شفرتك بمضيف Azure. إذا كان لتطبيقك واجهة أمامية وواجهة برمجة تطبيقات، فسيكون لديك خدمتان.

### `infra/` — موارد Azure الخاصة بك ككود

مجلد `infra/` يحتوي على ملفات Bicep التي تعرف موارد Azure التي يحتاجها تطبيقك (خدمة التطبيق، قاعدة البيانات، إلخ). ليس عليك كتابة هذه الملفات يدويًا — يقوم azd بتوليد نقطة بداية قابلة للعمل. يمكنك تعديلها لاحقًا لإضافة موارد أو شدّ الأمان (مغطى في [الفصل 4](../chapter-04-infrastructure/README.md)).

> **نصيحة:** هل تريد رؤية البنية التحتية المولَّدة أو تخصيصها قبل النشر؟ شغّل `azd infra generate` (متاح أيضًا كـ `azd infra synth`) لكتابة IaC على القرص حتى تتمكن من مراجعتها والتحكم في إصدارها.

---

## الخطوة 3: ضبط التكوين المطلوب

إذا كان تطبيقك يحتاج إعدادات أو أسرارًا (سلسلة اتصال، مفتاح API)، فلا تضعها ضمن الشفرة. استخدم قيم البيئة:

```bash
# أنشئ بيئة
azd env new dev

# عيّن قيمة غير سرية
azd env set API_VERSION 1.0.0
```

لأسرار حقيقية، خزنها في Key Vault وأشر إليها من بنيتك التحتية — راجع [الفصل 3: التكوين والمصادقة](../chapter-03-configuration/authsecurity.md).

---

## الخطوة 4: النشر

استخدم الآن نفس سير العمل الذي تعرفه بالفعل:

```bash
# المصادقة (مطلوبة لـ azd)
azd auth login

# معاينة الموارد التي سيتم إنشاؤها
azd provision --preview

# توفير البنية التحتية ونشر الشيفرة الخاصة بك
azd up
```

عند الانتهاء، يطبع azd عنوان URL لتطبيقك. تحقق منه بنفس الطريقة كما في أي تطبيق azd:

```bash
azd show           # عرض نقاط النهاية
azd monitor --logs # تحقق من السجلات إذا لزم الأمر
```

---

## المشكلات الشائعة في المرة الأولى

| العَرَض | السبب المحتمل | الحل |
|---------|--------------|-----|
| azd لم يكتشف تطبيقي | نقص مَنشور (مثلاً، `package.json`) | أضف المَنشور، أو اختر المضيف يدويًا أثناء `azd init` |
| فشل البناء أثناء `azd up` | التطبيق يحتاج خطوة بناء | أضف `buildCommand`/`outputPath` تحت الخدمة في `azure.yaml` |
| يبدأ التطبيق لكنه يعيد أخطاء | إعداد/سر مفقود | عين القيم باستخدام `azd env set` أو اربط Key Vault |
| تم اختيار مضيف خاطئ | التخمين التلقائي أخطأ | حرر `host:` في `azure.yaml` وأعد تشغيل `azd up` |

لمزيد من المعلومات، راجع [الفصل 7: استكشاف الأخطاء وإصلاحها](../chapter-07-troubleshooting/README.md).

---

## التنظيف

```bash
azd down --force --purge
```

---

## الملخص

- `azd init` → **"استخدم الشفرة في الدليل الحالي"** يضيف azd إلى تطبيق لديك بالفعل.
- يربط `azure.yaml` مجلدات الشفرة بمضيفات Azure؛ ويعرّف `infra/` الموارد كـ Bicep.
- يتيح لك `azd infra generate` مراجعة أو تخصيص البنية التحتية المولَّدة.
- بعد التهيئة، يستخدم تطبيقك القائم نفس سير العمل `azd up` / `azd down` تمامًا كتطبيق قائم على قالب.

---

## 🔗 التنقل

| Direction | Lesson |
|-----------|--------|
| **السابق** | [مشروعك الأول](first-project.md) |
| **التالي** | [حاويات التطوير وCodespaces](dev-containers.md) |

## 📖 موارد ذات صلة

- [أساسيات AZD](azd-basics.md)
- [الفصل 4: البنية التحتية ككود](../chapter-04-infrastructure/README.md)
- [التكوين والمصادقة](../chapter-03-configuration/authsecurity.md)
- [مُلخّص الأوامر](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنويه**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي والمعتمد. للمعلومات الهامة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->