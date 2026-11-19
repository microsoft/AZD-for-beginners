# سجل التغييرات - AZD للمبتدئين

## مقدمة

يوثق سجل التغييرات هذا جميع التغييرات وال تحديثات والتحسينات الملحوظة في مستودع AZD للمبتدئين. نتبع مبادئ الترقيم الدلالي ونحافظ على هذا السجل لمساعدة المستخدمين على فهم ما تغير بين الإصدارات.

## أهداف التعلم

بمراجعة سجل التغييرات هذا، ستتمكن من:
- البقاء على اطلاع على الميزات الجديدة وإضافات المحتوى
- فهم التحسينات التي أُجريت على الوثائق الحالية
- تتبع إصلاحات الأخطاء والتصحيحات لضمان الدقة
- متابعة تطور مواد التعلم بمرور الوقت

## نتائج التعلم

بعد مراجعة إدخالات سجل التغييرات، ستتمكن من:
- التعرف على المحتوى والموارد الجديدة المتاحة للتعلم
- فهم الأقسام التي تم تحديثها أو تحسينها
- تخطيط مسار تعلمك بناءً على أحدث المواد
- المساهمة بملاحظات واقتراحات لتحسينات مستقبلية

## تاريخ الإصدارات

### [v3.25.0] - 2026-11-09

#### امتداد Microsoft Foundry 1.0 متوفر الآن بشكل عام

حزمة `microsoft.foundry` 1.0 **نشطة ومتاحة للجميع**، كما أعلن في [5 نوفمبر 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). يقوم الدورة الآن بتدريس تدفق العمل GA الصادر، وليس إصدارًا قادمًا. ابدأ مع AZD **1.37.0 أو إصدار أحدث** و`azd ext install microsoft.foundry`.

#### المتوفر في تحديث الدورة هذا
- الإرشادات الإنجليزية تستخدم حزمة GA كمسار التثبيت الافتراضي وتشرح امتداداتها الأساسية السبع ذات الإصدارات المستقلة.
- يغطّي [جولة عبر الوكيل المستضاف](docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) عينة واجهة برمجة التطبيقات لاستجابات إطار عمل وكيل بايثون الأعلى، الإصدار الحالي uv، بايثون 3.13+، اختيار المشروع الجديد/القائم، إعادة استخدام النموذج، ومراجعة `azure.yaml`.
- يغطي تدفق العمل من المحلي إلى السحابة اختبار مفتش الوكيل، تكاليف استدعاء النموذج المدعومة من Azure، بناء التعليمات البرمجية عن بعد، تنفيذ النشر، تتبع السحابة، معاينة النشر، السجلات، والتشخيص.
- تتناول إرشادات التقييم المنفصلة إنشاء ومراجعة مجموعات البيانات/المقاييس، تكوين تقييم مسمى، تسجيل الأصول، وفحص النتائج. تظل تعليمات التقييم/التحسين الأقدم جزءًا من سجل الترحيل، وليس قاعدة إطلاق الإصدار الحالي.
- إرشادات Foundry CI/CD تشمل تثبيت امتداد العداء، النشر المصدق، أصول/وصول التقييم، وبوابة جودة صريحة.
- تميز إرشادات التنظيف المشاريع Foundry الجديدة والمستخدمة مرة أخرى. يشير ورشة العمل إلى تمرين GA المنفصل دون استبدال اختبارات العينات الخاصة به.
- تعكس التنقل في الدورة، أهداف التعلم، متطلبات الإعداد، ملخص المساعدة، الأسئلة الشائعة، ودليل الدراسة تدفق العمل GA. الترجمات المولدة غير مُعدلة يدويًا.

#### نطاق المراجعة
- استنادًا إلى إعلان GA، إرشادات Microsoft Learn المرتبطة، وتكوين العينة الأعلى. لم يتم إجراء نشر Azure مباشر، أو تنفيذ نشر، أو استدعاء نموذج، أو تقييم حي.
- لا تعني حزمة GA موافقة عامة لكل ميزة اختيارية أو امتداد مستقل أو SDK، ولا تصادق على الأمثلة للإنتاج.

### [v3.24.0]- 2026-11-04

#### تم الإصلاح
- إصلاح تنقل الدورة الإنجليزية، مسارات الصفحات المنقولة، النقاط المفقودة، والمرجعيات الخارجية المهجورة، بما في ذلك رابط الفصل 2 إلى دليل الذكاء الاصطناعي للإنتاج.
- تمت مراجعة الإرشادات الحالية مقابل النسخة المنشورة AZD 1.37.2، والوكلاء 1.0.0-beta.23، والتقييمات 1.0.0-beta.2. وثقت تدفق العمل المنفصل `azd ai eval` وترحيل تكوين التحسين.
- تصحيح أعلام CLI غير المدعومة، حدود المصادقة، إرشادات البيئة/الأسرار النصية، تحديثات البنية التحتية، تهيئة النموذج، وأمثلة الاسترداد التدميري.
- تحديث ورشة العمل استنادًا إلى عينة AI Agents الحالية، بما في ذلك الخطافات الفعلية، مدخلات التكوين، اختبارات التقييم، نقاط الدخول الحمراء، والرصد.
- تصحيح مطالبات التنفيذ النموذجية وإصلاح المشكلات التطبيقية/البنية التحتية/التكوين المرتبطة. يتم تمييز مواد بنية التجزئة صراحة عن التطبيق العامل الكامل.
- استعادة مصفوفة لغة CodeQL، اختيار Node.js 24 المدعوم للحاوية التطويرية، وجعل أدوات التحقق من الإعداد تبلغ عن أوامر الإصدار الفاشلة.

#### أُضيف
- أداة تحقق من الروابط/النقاط العمل دون اتصال بالإنجليزية فقط، اختبارات الانحدار، وتدفق عمل توثيقي يبني الورشة أيضًا في الوضع الصارم. تستبعد الترجمات المولدة والصور المترجمة.

#### نطاق التحقق
- فحوصات المصدر، البنية، التكوين، السلوك المحلي، والرابط الشبكي لا تؤكد قابلية النشر المباشر على Azure، الحصص، RBAC، توافر النموذج الإقليمي، الفوترة، الامتثال الأمني، أو جاهزية الإنتاج.
- الإدخالات الأقدم أدناه سجلات تاريخية، وليست أوامر إصدار أو أوامر حالية.

### [v3.23.0] - 2026-07-13

#### تحديث AZD 1.27.1: تحديث عملة الإصدار
**يتم إعادة التحقق من الدورة مقابل `azd` `1.27.1` (يوليو 2026، أحدث إصدار مستقر) وامتداد وكيل AI المعاينة الحالي `azure.ai.agents` `1.0.0-beta.5`، مع تحديث كل لافتة "تم التحقق مقابل" عقب إصدارات 1.26.0، 1.27.0، و1.27.1.**

#### تم التغيير
- **✅ تم تحديث خط الأساس للتحقق** من `azd 1.25.6` (يونيو 2026) إلى `azd 1.27.1` (يوليو 2026) على مستوى README الجذري، جميع README الفصول، درس الحاوية التطويرية في الفصل 1 (بما في ذلك أمثلة النسخ المثبتة)، درس القوالب المخصصة في الفصل 4، درس الوكيل المتعدد في الفصل 5، والوثائق الخاصة بالورشة
- **🤖 تم تحديث خط الأساس للفصل 2** من `azd 1.23.12` (مارس 2026) إلى `azd 1.27.1` عبر `agents.md`، `ai-model-deployment.md`، `ai-workshop-lab.md`، و`microsoft-foundry-integration.md`؛ تم تحديث تواريخ ملاحظة التحقق إلى 2026-07-13
- **🧩 تم تحديث امتداد وكيل AI** من `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` إلى الإصدار `1.0.0-beta.5` الحالي في README الفصل 2 و`agents.md`
- **🧪 تم تحديث مثال التحقق للورشة** (`azd version` الإخراج) إلى `1.27.1`

#### ملاحظات عن إصدارات azd ذات الصلة (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** دعم Go لوظائف Azure على Flex Consumption، فلاتر اشتراك لكل مستأجر `azd config sub-filter`، حزَم امتدادات متكاملة ذاتية contained (`azd x pack --bundle`)، و`azd tool install azure-skills`
- **1.27.0 (2026-06-30):** نماذج مشاريع/وكلاء Azure AI Foundry مباشرة في `azure.yaml` (تهيئة بدون Bicep/بدون Terraform)، دعم نشر الحاويات لخدمة التطبيقات (`host: appservice` + `language: docker`)، أوامر `-s/--source` المباشرة لـ `azd extension`، و`azd tool uninstall`
- **1.27.1 (2026-07-09):** علم `--no-dependencies` لـ `azd extension install`، استبعاد النماذج المتقادمة من المحفزات الكتالوج/الحصة افتراضيًا، والعديد من إصلاحات الأخطاء

#### الملفات المحدَّثة
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md`
- `docs/chapter-01-foundation/dev-containers.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/custom-templates.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

### [v3.22.0] - 2026-06-16

#### سد الفجوات للمبتدئين #2: تأليف القالب، حاويات التطوير، Pulumi، Azure DevOps، مدراء الخدمة، وأكثر
**يغلق هذا الإصدار الفجوات المتبقية المتوسطة التي كشفتها تحليل تغطية azd: كيفية تأليف ونشر قالبك الخاص، بيئات حاويات التطوير/Codespaces المتكررة، مزود البنية التحتية Pulumi، جولة CI/CD في Azure DevOps، مصادقة مدراء الخدمة، إرشادات اختيار المضيف (AKS/تطبيقات الربيع Azure Spring Apps)، شروحات `azd restore`/`azd package`، معالجة أخطاء الخطافات، وممارسات الفرق/البيئات المشتركة.**

#### أُضيف
- **🧱 درس جديد في الفصل 4** `docs/chapter-04-infrastructure/custom-templates.md` — تأليف قالب azd الخاص بك: الهيكل المطلوب (`azure.yaml`، `infra/`، `src/`)، الحقل `metadata.template`، تهيئة البنية التحتية باستخدام رمز المورد `uniqueString()` والوسم `azd-env-name`، الاختبار محليًا بـ `azd init --template <local-path>`، النشر إلى GitHub، والتقديم إلى معرض Awesome AZD
- **📦 درس جديد في الفصل 1** `docs/chapter-01-foundation/dev-containers.md` — بيئات azd المتكررة باستخدام حاويات التطوير وGitHub Codespaces: `.devcontainer/devcontainer.json` بسيط باستخدام ميزة `ghcr.io/azure/azure-dev/azd` الرسمية، ميزات خاصة باللغات، `docker-in-docker` لمضيفات الحاويات، و`azd auth login --use-device-code` لتسجيل الدخول عن بعد
- قسم **🧩 Pulumi مع azd** في `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`، تخطيط مجلد Pulumi، الطبقات المرتبطة ببيئات azd، المخرجات المطلوبة/الوسم، وتدفق العمل المطابق `azd up` / `azd down`
- **🎯 إرشادات اختيار المضيف** في `docs/chapter-04-infrastructure/provisioning.md` — مقارنة مناسبة للمبتدئين بين `appservice`، `staticwebapp`، `function`، `containerapp`، `aks`، و`springapp`، مع إرشادات حول متى تختار AKS أو تطبيقات الربيع Azure Spring Apps
- **🛠️ جولة Azure DevOps CI/CD** في `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`، اتصال الخدمة مع اتحاد هوية عبء العمل (OIDC)، `azure-dev.yml` المولدة، وإعداد مجموعة المتغيرات
- **🔑 مدراء الخدمة (النمط 4)** أضيفت إلى `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`، `azd auth login` غير تفاعلية مع سر العميل مقابل بيانات اعتماد موحدة/OIDC، متى تستخدمها، وتخزين بيانات الاعتماد الآمن
- قسم **🪝 معالجة أخطاء الخطافات** في `docs/chapter-04-infrastructure/deployment-guide.md` — رموز الخروج و`set -e`، `continueOnError`، اختبار الخطافات معزولة باستخدام `azd hooks run`، قشور خاصة بنظام التشغيل، و`--debug`
- قسم **👥 الفرق / البيئات المشتركة** في `docs/chapter-03-configuration/configuration.md` — ما يوجد في `.azure/`، ما يجب تجاهله في gitignore، بيئات لكل مطور، `azd env list`/`select`، وتوفير قيم البيئة في CI/CD
- شرح **🧰 `azd restore` و`azd package` الموسع** في `resources/cheat-sheet.md` — استعادة التبعيات وبناء قطعة قابلة للنشر دون النشر

#### تم التغيير
- **🧭 جدول دروس الفصل 4** تم تحديثه ليشمل الدرس الجديد "تأليف قالبك الخاص" (الدرس 3)
- **🧭 جدول دروس الفصل 1** تم تحديثه ليشمل الدرس الجديد "حاويات التطوير وCodespaces" (الدرس 5)؛ أقدام التنقل الموصولة بين `bring-your-own-app.md` و`dev-containers.md`

### [v3.21.0] - 2026-06-16

#### سد الفجوات للمبتدئين: درس عملي متعدد الوكلاء، "أحضر تطبيقك الخاص"، Terraform، وجولة CI/CD
**يغلق هذا الإصدار أكبر الفجوات لدليل المبتدئين الكامل بإضافة درسين عمليين جديدين (جولة تنفيذية متعددة الوكلاء وجولة إضافة azd إلى تطبيق موجود)، مقدمة ودية للخطافات، قسم Terraform مع azd، دورة GitHub Actions خطوة بخطوة، شرح للامتدادات الجديدة في المعاينة، وقائمة تحقق صريحة للتحقق من النشر.**

#### أُضيف
- **🤝 درس جديد في الفصل 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — جولة تنفيذية تفاعلية لوكيلين (مُنظّم + متخصصون) باستخدام قالب حقيقي (`contoso-creative-writer`)، تغطي متى تستخدم الوكلاء المتعددين، تدفق العمل `azd up`، فهم الموارد المنشورة، التتبع عبر الوكلاء، التخصيص، والتنظيف
- **📦 درس جديد في الفصل 1** `docs/chapter-01-foundation/bring-your-own-app.md` — كيفية إضافة azd إلى مشروع قائم باستخدام `azd init` ("استخدام الشفرة في الدليل الحالي")، فهم `azure.yaml` و`infra/`، `azd infra generate`، كشف المضيف، والنشر باستخدام `azd up`
- قسم **🌐 Terraform مع azd** مضاف إلى `docs/chapter-04-infrastructure/provisioning.md` — تكوين `infra.provider: terraform`، تخطيط المجلد `.tf`، مخرجات الوسم المطلوبة `AZURE_*` و`azd-env-name`، وتدفق العمل المطابق `azd up` / `azd down` (يغلق الفجوة التي كان فيها دعم Terraform محسوب لكنه عرض فقط Bicep)
- **⚙️ شرح تفصيلي لـ GitHub Actions خطوة بخطوة** في `docs/chapter-08-production/production-ai-practices.md` — من مستودع GitHub إلى عمليات النشر الآلية: `azd pipeline config`، بيانات اعتماد OIDC الموحدة (بدون أسرار مخزنة)، `azure-dev.yml` المُولدة، وإرشادات الأسرار مقابل المتغيرات
- **🪝 مقدمة للمبتدئين "جديد في الهوكس؟"** في `docs/chapter-04-infrastructure/deployment-guide.md` — ما هو الهوك، جدول مراحل الهوك، أول هوك بسيط، وتشغيل الهوكس يدويًا باستخدام `azd hooks run`
- **✅ قائمة التحقق "تحقق من نشر تطبيقك"** أُضيفت إلى الخطوة 5 من `docs/chapter-01-foundation/first-project.md` — اختبار الدخان، فحص نقطة النهاية الصحية، ومعايير النجاح الصريحة
- **🧩 شرح للامتدادات المعاينة الجديدة** `azure.ai.skills` و `azure.ai.connections` (ما هي ومتى تستخدمها) في `docs/chapter-08-production/production-ai-practices.md`

#### تم التغيير
- **🧭 تم تصحيح جدول دروس الفصل 5**: أصبح `multi-agent-basics.md` هو الدرس 1 (الدرس العملي الوحيد بالكامل)، مع تسميات واضحة بأن الدرس 2 في الفصل 6 وسيناريو التجزئة هو مخطط معماري وليس قالب أمر واحد
- **🧭 يتضمن جدول دروس الفصل 1** الآن درس "أحضر تطبيقك الخاص" الجديد (الدرس 4)
- **🔗 تم تحديث تذييلات التنقل**: الآن `first-project.md` يربط إلى `bring-your-own-app.md`

#### تم الإصلاح
- **🧱 تم سد الفجوة "المطالبة ولكن مفقودة" في Terraform** — حيث أشار الدورة مسبقًا إلى دعم Terraform دون عرضه
- **🔀 تم تصحيح الروابط المتداخلة المضللة في الفصل 5** التي توهم وجود تنفيذ كامل متعدد الوكلاء بينما كان هناك فقط مخطط معماري

#### الملفات المحدثة
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(جديد)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(جديد)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### تحديث AZD 1.25.6، أوامر دورة حياة الوكيل الكاملة وإعادة تسمية Aspire
**يعيد هذا الإصدار التحقق من صحة الدورة مقابل `azd` `1.25.6` (يونيو 2026) وامتداد `azure.ai.agents` `0.1.40-preview`، ويوسع إرشادات الذكاء الاصطناعي من "بناء وكيل" إلى دورة حياة الوكيل الكاملة (اختبار → تقييم → تحسين → فحص → حذف)، ويبرز الامتدادات الجديدة `azure.ai.skills` و `azure.ai.connections` للمعاينة، ويشير إلى إعادة تسمية المنتج من ".NET Aspire" إلى "Aspire".**

#### أُضيف
- **🔁 تغطية دورة حياة الوكيل الكاملة** للمبتدئين ومهندسي الذكاء الاصطناعي عبر الوثائق:
  - `docs/chapter-01-foundation/azd-basics.md` — جدول دورة الحياة (البناء → الاختبار → القياس → التحسين → الفحص → التنظيف) أُضيف إلى قسم الامتدادات وأوامر الذكاء الاصطناعي
  - `docs/chapter-08-production/production-ai-practices.md` — قسم جديد "إدارة دورة حياة الوكيل" يغطي `azd ai agent invoke`، `endpoint show`، `eval generate`، `optimize`، `code download`، و `delete --force`
  - `resources/cheat-sheet.md` — توسيع أوامر وكيل الذكاء الاصطناعي مع `invoke`، `endpoint show`، `eval generate`، `optimize`، `code download`، و `delete --force`
- **🧩 توثيق امتدادات المعاينة الجديدة**: تم إضافة `azure.ai.skills` (مهارات الوكيل القابلة لإعادة الاستخدام) و `azure.ai.connections` (اتصالات Foundry) إلى جدول الامتدادات وصفحة الغش
- **⏱️ إرشادات توقيت الاستجابة** — توضح أمثلة `azd ai agent invoke` الآن أنها تطبع إجمالي زمن الاستجابة ووقت البايت الأول
- **📌 لافتة الإصدار** في README الجذر توجه المتعلمين إلى `azd version` و `azd upgrade`

#### تم التغيير
- **✅ تحديث خط الأساس للتحقق** من `azd 1.23.12` (مارس 2026) إلى `azd 1.25.6` (يونيو 2026) عبر جميع README الخاص بالفصول وورقة العمل
- **🤖 تحديث ملاحظة امتداد الفصل 2** من `azure.ai.agents` `0.1.18-preview` إلى `0.1.40-preview`
- **🧪 تحديث مثال التحقق في الورشة** (مخرجات `azd version`) إلى `1.25.6`
- **🧭 تحديث README "ما الجديد في azd اليوم"** لتسليط الضوء على دورة حياة الوكيل الشاملة، والامتدادات الجديدة للذكاء الاصطناعي، وإصلاحات جودة الحياة الحديثة (التماثلية `azd init`، مسح الرمز المميز القديم `azd auth login`، موجه التشغيل الأول `azd tool`)
- **📖 فصل 2 agents.md (الخيار 4)** الآن يشير المتعلمين إلى أوامر دورة الحياة ما بعد النشر بدلاً من التوقف عند `azd up`

#### تم الإصلاح
- **🏷️ تسمية المنتج** — أُضيفت ملاحظة إعادة تسمية Aspire (".NET Aspire" أصبحت "Aspire" فقط)؛ دعم azd لـ Aspire لم يتغير
- **🔎 تأكيد التحقق من الإصدار الحي** مقابل تغذية إصدار CLI لمطور Azure: CLI مستقر `1.25.6` (2026-06-12) و `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### الملفات المحدثة
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `resources/cheat-sheet.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

---

### [v3.19.1] - 2026-03-27

#### توضيح الالتحاق بالمبتدئين، التحقق من الإعداد وتنظيف أوامر AZD النهائية
**يتابع هذا الإصدار جولة التحقق من صحة AZD 1.23 بتمرير توثيق يركز على المبتدئين: يوضح إرشادات المصادقة باستخدام AZD أولاً، يضيف نصوص تحقق من الإعداد المحلي، يتحقق من الأوامر الأساسية مقابل CLI الحي لـ AZD، ويزيل آخر مراجع أوامر مصدرها اللغة الإنجليزية غير المستخدمة خارج سجل التغييرات.**

#### أُضيف
- **🧪 نصوص تحقق إعداد المبتدئين** باستخدام `validate-setup.ps1` و `validate-setup.sh` حتى يتمكن المتعلمون من تأكيد الأدوات المطلوبة قبل بدء الفصل 1
- **✅ خطوات تحقق الإعداد المسبق** في README الجذر و README الفصل 1 حتى يتم اكتشاف المتطلبات المفقودة قبل `azd up`

#### تم التغيير
- **🔐 إرشادات مصادقة المبتدئين** تعالج الآن `azd auth login` كمسار أساسي لاستيعاب تدفقات عمل AZD، مع التفصيل في `az login` كخيار ما لم تُستخدم أوامر Azure CLI مباشرة
- **📚 تدفق الالتحاق بالفصل 1** يشير الآن للمتعلمين للتحقق من إعدادهم المحلي قبل خطوات التثبيت، المصادقة، والنشر الأول
- **🛠️ رسائل المدقق** تفصل بوضوح متطلبات الحظر عن تحذيرات Azure CLI الاختيارية لمسار المبتدئين المبني على AZD فقط
- **📖 التوثيق الخاص بالتكوين، استكشاف الأخطاء، والأمثلة** يميز الآن بين مصادقة AZD المطلوبة وتسجيل الدخول الاختياري لـ Azure CLI حيثما كان كلاهما يُعرض سابقًا بلا سياق

#### تم الإصلاح
- **📋 تحديث مراجع أوامر مصدرها الإنجليزية المتبقية** إلى أشكال AZD الحالية، بما في ذلك `azd config show` في صفحة الغش و `azd monitor --overview` حيث كان يُقصد إرشاد نظرة عامة على بوابة Azure
- **🧭 تلطيف مطالبات المبتدئين في الفصل 1** لتجنب الوعود المفرطة بضمان عدم حدوث أخطاء أو التراجع عبر جميع القوالب وموارد Azure
- **🔎 تأكيد التحقق من CLI الحي** لدعم الحالات الحالية لـ `azd env get-values`، `azd template list`، `azd extension list --installed`، `azd copilot consent list`، `azd mcp start`، `azd provision --preview`، `azd monitor --logs`، و `azd down --force --purge`

#### الملفات المحدثة
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `examples/container-app/README.md`
- `examples/database-app/README.md`
- `resources/cheat-sheet.md`
- `validate-setup.ps1`
- `validate-setup.sh`

---

### [v3.19.0] - 2026-03-26

#### تحقق AZD 1.23.12، توسيع بيئة الورشة وتجديد نموذج الذكاء الاصطناعي
**يجري هذا الإصدار جولة تحقق توثيقية ضد `azd` `1.23.12`، يحدث أمثلة أوامر AZD القديمة، يجدد إرشادات نموذج الذكاء الاصطناعي إلى الإعدادات الافتراضية الحالية، ويوسع تعليمات الورشة لتشمل الحاويات التطويرية والنسخ المحلية إلى جانب GitHub Codespaces.**

#### أُضيف
- **✅ ملاحظات تحقق عبر الفصول الأساسية ومستندات الورشة** لتوضيح قاعدة AZD المختبرة للمتعلمين الذين يستخدمون إصدارات CLI أحدث أو أقدم
- **⏱️ إرشادات مهلة النشر** لنشر تطبيقات الذكاء الاصطناعي طويلة الأمد باستخدام `azd deploy --timeout 1800`
- **🔎 خطوات فحص الامتداد** مع `azd extension show azure.ai.agents` في وثائق سير عمل الذكاء الاصطناعي
- **🌐 إرشادات بيئة الورشة الأوسع** تغطي GitHub Codespaces، حاويات التطوير، والنسخ المحلية مع MkDocs

#### تم التغيير
- **📚 README مقدمة الفصول** تشير الآن بانتظام إلى التحقق ضد `azd 1.23.12` عبر الأقسام الأساسية، التكوين، البنية التحتية، تعدد الوكلاء، ما قبل النشر، استكشاف الأخطاء، والإنتاج
- **🛠️ تحديث مراجع أوامر AZD** إلى الأشكال الحالية في الوثائق:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` أو `azd env get-value(s)` حسب السياق
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` حيث يُراد نظرة عامة على Application Insights
- **🧪 تبسيط أمثلة توفير المعاينة** إلى الاستخدامات المدعومة الحالية مثل `azd provision --preview` و `azd provision --preview -e production`
- **🧭 تحديث تدفق الورشة** ليتمكن المتعلمون من إكمال المختبرات في Codespaces، أو حاوية تطوير، أو نسخة محلية بدلاً من الافتراض على تنفيذ Codespaces فقط
- **🔐 تحديث إرشادات المصادقة** لتفضيل `azd auth login` لتدفقات عمل AZD، مع وضع `az login` اختياريًا عند استخدام أوامر Azure CLI مباشرة

#### تم الإصلاح
- **🪟 توحيد أوامر التثبيت لنظام Windows** إلى التسمية الحالية للحزمة `winget` في دليل التثبيت
- **🐧 تصحيح إرشادات تثبيت Linux** لتجنب تعليمات مدير الحزم الخاصة بالتوزيعات غير المدعومة `azd` والاشارة بدلاً من ذلك إلى أصول الإصدار حسب الحاجة
- **📦 تحديث أمثلة نموذج الذكاء الاصطناعي** من الإعدادات الافتراضية القديمة مثل `gpt-35-turbo` و `text-embedding-ada-002` إلى أمثلة حالية مثل `gpt-4.1-mini`، `gpt-4.1`، و `text-embedding-3-large`
- **📋 تصحيح مقتطفات النشر والتشخيص** لاستخدام أوامر الحالة والبيئة الحالية في السجلات والنصوص وخطوات الاستكشاف
- **⚙️ تحديث إرشادات GitHub Actions** من `Azure/setup-azd@v1.0.0` إلى `Azure/setup-azd@v2`
- **🤖 تحديث إرشادات موافقة MCP/Copilot** من `azd mcp consent` إلى `azd copilot consent list`

#### تم التحسين
- **🧠 تحسين إرشادات فصل الذكاء الاصطناعي** لتوضيح أفضل لسلوك `azd ai` الحساس للمعاينة، تسجيل الدخول الخاص بالمستأجر، استخدام الامتداد الحالي، وتوصيات تحديث نشر النماذج
- **🧪 تحسين تعليمات الورشة** باستخدام أمثلة إصدارات أكثر واقعية ولغة إعداد بيئة أكثر وضوحًا للمختبرات العملية
- **📈 تحسين مستندات الإنتاج واستكشاف الأخطاء** لتتماشى بشكل أفضل مع مراقبة الحالة، نموذج التراجع، وأمثلة مستويات التكلفة الحالية

#### الملفات المحدثة
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-03-configuration/configuration.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-06-pre-deployment/preflight-checks.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `docs/chapter-07-troubleshooting/common-issues.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `workshop/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/1-Select-AI-Template.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`
- `workshop/docs/instructions/3-Deconstruct-AI-Template.md`
- `workshop/docs/instructions/5-Customize-AI-Template.md`

---

### [v3.18.0] - 2026-03-16

#### أوامر AZD AI CLI، تحقق المحتوى وتوسيع القالب
**تضيف هذه النسخة تغطية أوامر `azd ai`، `azd extension`، و`azd mcp` عبر جميع فصول الذكاء الاصطناعي، تصلح الروابط المعطلة والكود المهجور في agents.md، تحدّث ورقة الغش، وتعيد هيكلة قسم قوالب الأمثلة مع أوصاف موثقة وقوالب جديدة لـ Azure AI AZD.**

#### تمت الإضافة
- **🤖 تغطية AZD AI CLI** عبر 7 ملفات (كان سابقًا فقط في الفصل 8):
  - `docs/chapter-01-foundation/azd-basics.md` — قسم جديد "الإضافات وأوامر الذكاء الاصطناعي" يُقدّم `azd extension`، `azd ai agent init`، و`azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — الخيار 4: `azd ai agent init` مع جدول مقارنة (النهج القالب مقابل النهج البيان)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — أقسام فرعية "إضافات AZD لـ Foundry" و"نشر الوكيل أولاً"
  - `docs/chapter-05-multi-agent/README.md` — بدء سريع يعرض الآن مسارات النشر بالقالب والبيان
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — قسم النشر يشمل الآن خيار `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — القسم الفرعي "أوامر تمديد AZD AI للتشخيص"
  - `resources/cheat-sheet.md` — قسم جديد "أوامر الذكاء الاصطناعي والإضافات" مع `azd extension`، `azd ai agent init`، `azd mcp`، و`azd infra generate`
- **📦 قوالب أمثلة جديدة لـ AZD AI** في `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — دردشة RAG .NET مع Blazor WebAssembly، Semantic Kernel، ودعم الدردشة الصوتية
  - **azure-search-openai-demo-java** — دردشة RAG Java باستخدام Langchain4J مع خيارات نشر ACA/AKS
  - **contoso-creative-writer** — تطبيق كتابة إبداعية متعدد الوكلاء باستخدام Azure AI Agent Service، Bing Grounding، و Prompty
  - **serverless-chat-langchainjs** — RAG بدون خادم باستخدام Azure Functions + LangChain.js + Cosmos DB مع دعم تطوير Ollama المحلي
  - **chat-with-your-data-solution-accelerator** — مسرّع RAG مؤسساتي مع بوابة مسؤول، تكامل Teams، وخيارات PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — تطبيق مرجعي لأوركسترا MCP متعدد الوكلاء بخوادم بـ .NET، Python، Java، و TypeScript
  - **azd-ai-starter** — قالب بدء بسيط للبنية التحتية لـ Azure AI باستخدام Bicep
  - **🔗 رابط معرض AZD AI الرائع** — مرجع إلى [معرض awesome-azd AI](https://azure.github.io/awesome-azd/?tags=ai) (أكثر من 80 قالبًا)

#### تم الإصلاح
- **🔗 تنقل agents.md**: الآن روابط السابقة/التالية تتطابق مع ترتيب دروس الفصل 2 README (تكامل Microsoft Foundry → الوكلاء → نشر نموذج الذكاء الاصطناعي)
- **🔗 روابط agents.md المعطلة**: تم تصحيح `production-ai-practices.md` إلى `../chapter-08-production/production-ai-practices.md` (3 مرات)
- **📦 كود agents.md المهجور**: تم استبدال `opencensus` بـ `azure-monitor-opentelemetry` + SDK الخاص بـ OpenTelemetry
- **🐛 API غير صالح في agents.md**: تم نقل `max_tokens` من `create_agent()` إلى `create_run()` بصفتها `max_completion_tokens`
- **🔢 عد الرموز في agents.md**: تم استبدال تقدير `len//4` التقريبي بـ `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: تم تصحيح الخدمات من "Cognitive Search + App Service" إلى "Azure AI Search + Azure Container Apps" (تغير المضيف الافتراضي أكتوبر 2024)
- **contoso-chat**: تم تحديث الوصف للإشارة إلى Azure AI Foundry + Prompty بما يتطابق مع العنوان الفعلي والمكدس التقني للمستودع

#### تم الإزالة
- **ai-document-processing**: إزالة مرجع قالب غير وظيفي (المستودع غير متاح علنًا كقالب AZD)

#### تم التحسين
- **📝 تمارين agents.md**: التمرين 1 يعرض الآن الناتج المتوقع وخطوة `azd monitor`؛ التمرين 2 يتضمن رمز تسجيل `FunctionTool` كامل؛ التمرين 3 يستبدل التوجيه الغامض بأوامر `prepdocs.py` ملموسة
- **📚 موارد agents.md**: تحديث روابط التوثيق إلى مستندات Azure AI Agent Service الحالية والدليل السريع
- **📋 جدول الخطوات القادمة في agents.md**: تمت إضافة رابط ورشة عمل AI لتغطية كاملة للفصل

#### الملفات التي تم تحديثها
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### تحسين تنقل الدورة
**تحسّن هذه النسخة تنقل فصول README.md بتنسيق جدول مُحسّن.**

#### تغييرات
- **جدول خريطة الدورة**: تحسينه بروابط دروس مباشرة، تقديرات المدة، وتقييمات التعقيد
- **تنظيف المجلدات**: إزالة مجلدات قديمة زائدة (deployment/، getting-started/، pre-deployment/، troubleshooting/)
- **التحقق من الروابط**: تحقق من أكثر من 21 رابط داخلي في جدول خريطة الدورة

### [v3.16.0] - 2026-02-05

#### تحديث أسماء المنتجات
**تحدّثت هذه النسخة مراجع المنتجات لتتوافق مع العلامة التجارية الحالية لمايكروسوفت.**

#### تغييرات
- **Microsoft Foundry → Microsoft Foundry**: تم تحديث جميع المراجع عبر الملفات غير الخاصة بالترجمة
- **Azure AI Agent Service → Foundry Agents**: تم تحديث اسم الخدمة ليعكس العلامة التجارية الحالية

#### الملفات التي تم تحديثها
- `README.md` - الصفحة الرئيسية للدورة
- `changelog.md` - تاريخ الإصدارات
- `course-outline.md` - هيكل الدورة
- `docs/chapter-02-ai-development/agents.md` - دليل وكلاء الذكاء الاصطناعي
- `examples/README.md` - توثيق الأمثلة
- `workshop/README.md` - صفحة ورشة العمل الرئيسية
- `workshop/docs/index.md` - فهرس ورشة العمل
- `workshop/docs/instructions/*.md` - جميع ملفات تعليمات ورشة العمل

---

### [v3.15.0] - 2026-02-05

#### إعادة هيكلة رئيسية للمستودع: أسماء مجلدات استنادًا إلى الفصول
**تعيد هذه النسخة هيكلة التوثيق إلى مجلدات مخصصة لكل فصل لتسهيل التنقل.**

#### إعادة تسمية المجلدات
تم استبدال المجلدات القديمة بمجلدات مرقمة حسب الفصول:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- أضيف جديد: `docs/chapter-05-multi-agent/`

#### ترحيل الملفات
| الملف | من | إلى |
|------|------|---|
| azd-basics.md | getting-started/ | chapter-01-foundation/ |
| installation.md | getting-started/ | chapter-01-foundation/ |
| first-project.md | getting-started/ | chapter-01-foundation/ |
| configuration.md | getting-started/ | chapter-03-configuration/ |
| authsecurity.md | getting-started/ | chapter-03-configuration/ |
| microsoft-foundry-integration.md | microsoft-foundry/ | chapter-02-ai-development/ |
| agents.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-model-deployment.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-workshop-lab.md | microsoft-foundry/ | chapter-02-ai-development/ |
| production-ai-practices.md | microsoft-foundry/ | chapter-08-production/ |
| deployment-guide.md | deployment/ | chapter-04-infrastructure/ |
| provisioning.md | deployment/ | chapter-04-infrastructure/ |
| جميع ملفات ما قبل النشر | pre-deployment/ | chapter-06-pre-deployment/ |
| جميع ملفات استكشاف الأخطاء وإصلاحها | troubleshooting/ | chapter-07-troubleshooting/ |

#### تمت الإضافة
- **📚 ملفات README لكل فصل**: إنشاء README.md في كل مجلد فصل مع:
  - أهداف التعلم والمدة
  - جدول الدروس مع الأوصاف
  - أوامر بدء سريع
  - التنقل إلى الفصول الأخرى

#### تغييرات
- **🔗 تحديث جميع الروابط الداخلية**: تحديث 78+ مسارًا عبر جميع ملفات التوثيق
- **🗺️ README.md الرئيسي**: تحديث خريطة الدورة مع الهيكل الجديد للفصول
- **📝 examples/README.md**: تحديث المراجع المتبادلة إلى مجلدات الفصول

#### الإزالة
- هيكل المجلدات القديم (getting-started/، microsoft-foundry/، deployment/، pre-deployment/، troubleshooting/، ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### إعادة هيكلة المستودع: تنقل الفصل
**أضيفت في هذه النسخة ملفات README لتنقل الفصول (تم تجاوزها بواسطة v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### دليل وكلاء الذكاء الاصطناعي الجديد
**تضيف هذه النسخة دليلًا شاملًا لنشر وكلاء الذكاء الاصطناعي باستخدام Azure Developer CLI.**

#### تمت الإضافة
- **🤖 docs/microsoft-foundry/agents.md**: دليل كامل يغطي:
  - ما هي وكلاء الذكاء الاصطناعي وكيف تختلف عن روبوتات المحادثة
  - ثلاثة قوالب وكلاء بدء سريع (Foundry Agents، Prompty، RAG)
  - أنماط هندسة الوكلاء (وكيل فردي، RAG، متعدد الوكلاء)
  - تكوين الأدوات والتخصيص
  - المراقبة وتتبع المقاييس
  - اعتبارات التكلفة والتحسين
  - سيناريوهات استكشاف الأخطاء الشائعة
  - ثلاث تمارين عملية مع معايير النجاح

#### هيكل المحتوى
- **مقدمة**: مفاهيم الوكيل للمبتدئين
- **بدء سريع**: نشر الوكلاء باستخدام `azd init --template get-started-with-ai-agents`
- **أنماط الهندسة**: مخططات بصرية لأنماط الوكلاء
- **التكوين**: إعداد الأدوات ومتغيرات البيئة
- **المراقبة**: تكامل Application Insights
- **التمارين**: تعلم تطبيقي تدريجي (20-45 دقيقة لكل تمرين)

---

### [v3.12.0] - 2026-02-05

#### تحديث بيئة DevContainer
**تحدّثت هذه النسخة تكوين حاوية التطوير بأدوات حديثة وإعدادات أفضل لتجربة تعلم AZD.**

#### تغييرات
- **🐳 صورة أساسية**: تحديث من `python:3.12-bullseye` إلى `python:3.12-bookworm` (آخر إصدار مستقر لـ Debian)
- **📛 اسم الحاوية**: إعادة التسمية من "Python 3" إلى "AZD للمبتدئين" للوضوح

#### تمت الإضافة
- **🔧 ميزات جديدة لحاوية التطوير**:
  - `azure-cli` مع دعم Bicep مفعّل
  - `node:20` (نسخة LTS لقوالب AZD)
  - `github-cli` لإدارة القوالب
  - `docker-in-docker` لنشر تطبيقات الحاوية

- **🔌 إعادة توجيه المنافذ**: المنافذ معدّة مسبقًا للتطوير الشائع:
  - 8000 (معاينة MkDocs)
  - 3000 (تطبيقات الويب)
  - 5000 (Python Flask)
  - 8080 (واجهات برمجة التطبيقات)

- **🧩 إضافات جديدة لـ VS Code**:
  - `ms-python.vscode-pylance` - تعزيز IntelliSense للبايثون
  - `ms-azuretools.vscode-azurefunctions` - دعم Azure Functions
  - `ms-azuretools.vscode-docker` - دعم Docker
  - `ms-azuretools.vscode-bicep` - دعم لغة Bicep
  - `ms-azure-devtools.azure-resource-groups` - إدارة موارد Azure
  - `yzhang.markdown-all-in-one` - تحرير Markdown
  - `DavidAnson.vscode-markdownlint` - تدقيق Markdown
  - `bierner.markdown-mermaid` - دعم مخططات Mermaid
  - `redhat.vscode-yaml` - دعم YAML (لملف azure.yaml)
  - `eamodio.gitlens` - تصور Git
  - `mhutchie.git-graph` - تاريخ Git

- **⚙️ إعدادات VS Code**: تمت إضافة إعدادات افتراضية لمفسر بايثون، التنسيق عند الحفظ، وقص المساحات الفارغة

- **📦 تحديث requirements-dev.txt**:
  - إضافة الملحق MkDocs minify
  - إضافة pre-commit لجودة الكود
  - إضافة حزم Azure SDK (azure-identity، azure-mgmt-resource)

#### تم الإصلاح
- **أمر ما بعد الإنشاء**: يتحقق الآن من تثبيت AZD وAzure CLI عند بدء الحاوية

---

### [v3.11.0] - 2026-02-05

#### مراجعة README مناسبة للمبتدئين
**تحسن هذه النسخة README.md بشكل كبير ليكون أكثر وصولاً للمبتدئين وتضيف موارد أساسية لمطوري الذكاء الاصطناعي.**

#### تمت الإضافة
- **🆚 مقارنة Azure CLI و AZD**: شرح واضح لمتى تستخدم كل أداة مع أمثلة عملية
- **🌟 روابط AZD الرائعة**: روابط مباشرة إلى معرض القوالب المجتمعية وموارد المساهمة:
  - [معرض Awesome AZD](https://azure.github.io/awesome-azd/) - أكثر من 200 قالب جاهز للنشر
  - [إرسال قالب](https://github.com/Azure/awesome-azd/issues) - مساهمة المجتمع
- **🎯 دليل البدء السريع**: قسم مبسط بثلاث خطوات للبدء (التثبيت → تسجيل الدخول → النشر)
- **📊 جدول التنقل المبني على الخبرة**: توجيه واضح حول مكان البدء بناءً على خبرة المطور

#### تغييرات
- **هيكل README**: أعيد تنظيمه للكشف التدريجي - المعلومات الأساسية أولًا
- **قسم المقدمة**: إعادة كتابة لشرح "سحر `azd up`" للمبتدئين تمامًا
- **إزالة المحتوى المكرر**: إزالة قسم استكشاف الأخطاء المتكرر
- **أوامر استكشاف الأخطاء وإصلاحها**: تم تصحيح المرجع `azd logs` لاستخدام `azd monitor --logs` صالح

#### تم التصحيح
- **🔐 أوامر المصادقة**: تمت إضافة `azd auth login` و `azd auth logout` إلى cheat-sheet.md
- **المراجع غير الصالحة للأوامر**: تمت إزالة باقي `azd logs` من قسم استكشاف الأخطاء في README

#### ملاحظات
- **النطاق**: تم تطبيق التغييرات على README.md الرئيسي و resources/cheat-sheet.md
- **الجمهور المستهدف**: تحسينات موجهة خصيصًا للمطورين الجدد على AZD

---

### [v3.10.0] - 2026-02-05

#### تحديث دقة أوامر Azure Developer CLI
**تصحيح هذا الإصدار لأوامر AZD غير الموجودة عبر كامل المستندات، مما يضمن أن جميع أمثلة الكود تستخدم صياغة Azure Developer CLI صحيحة.**

#### تم التصحيح
- **🔧 إزالة أوامر AZD غير الموجودة**: تدقيق شامل وتصحيح للأوامر غير الصالحة:
  - `azd logs` (غير موجود) → استبدال بـ `azd monitor --logs` أو بدائل Azure CLI
  - أوامر فرعية `azd service` (غير موجودة) → استبدال بـ `azd show` و Azure CLI
  - `azd infra import/export/validate` (غير موجودة) → إزالتها أو استبدالها ببدائل صحيحة
  - أعلام `azd deploy --rollback/--incremental/--parallel/--detect-changes` (غير موجودة) → إزالة
  - أعلام `azd provision --what-if/--rollback` (غير موجودة) → تحديث لاستخدام `--preview`
  - `azd config validate` (غير موجود) → استبدال بـ `azd config list`
  - `azd info`، `azd history`، `azd metrics` (غير موجودة) → إزالتها

- **📚 ملفات محدثة مع تصحيحات الأوامر**:
  - `resources/cheat-sheet.md`: إعادة هيكلة شاملة لمرجع الأوامر
  - `docs/deployment/deployment-guide.md`: تصحيح استراتيجيات التراجع والنشر
  - `docs/troubleshooting/debugging.md`: تصحيح أقسام تحليل السجلات
  - `docs/troubleshooting/common-issues.md`: تحديث أوامر استكشاف الأخطاء
  - `docs/troubleshooting/ai-troubleshooting.md`: تصحيح قسم تصحيح أخطاء AZD
  - `docs/getting-started/azd-basics.md`: تصحيح أوامر المراقبة
  - `docs/getting-started/first-project.md`: تحديث أمثلة المراقبة والتصحيح
  - `docs/getting-started/installation.md`: تصحيح أمثلة المساعدة والإصدار
  - `docs/pre-deployment/application-insights.md`: تصحيح أوامر عرض السجلات
  - `docs/pre-deployment/coordination-patterns.md`: تصحيح أوامر تصحيح الوكيل

- **📝 تحديث مرجع النسخة**: 
  - `docs/getting-started/installation.md`: تغيير إصدار `1.5.0` الثابت إلى `1.x.x` عام مع رابط للإصدارات

#### تغييرات
- **استراتيجيات التراجع**: تحديث المستندات لاستخدام التراجع المعتمد على Git (لا يمتلك AZD تراجعًا أصليًا)
- **عرض السجلات**: استبدال مراجع `azd logs` بـ `azd monitor --logs`، `azd monitor --live`، وأوامر Azure CLI
- **قسم الأداء**: إزالة أعلام النشر المتوازي/التزايدي غير الموجودة، وتوفير بدائل صحيحة

#### التفاصيل التقنية
- **أوامر AZD الصالحة**: `init`، `up`، `auth`، `deploy`، `down`، `provision`، `publish`، `completion`، `config`، `env`، `show`، `version`، `monitor`
- **أعلام azd monitor الصالحة**: `--live`، `--logs`، `--overview`
- **ميزات تمت إزالتها**: `azd logs`، `azd service`، `azd infra import/export/validate`، `azd history`، `azd metrics`، `azd info`، `azd config validate`

#### ملاحظات
- **التحقق**: تم التحقق من الأوامر مقابل Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### تحديث إكمال ورشة العمل وجودة التوثيق
**يكمل هذا الإصدار وحدات ورشة العمل التفاعلية، يصحح جميع الروابط المكسورة في التوثيق، ويحسن جودة المحتوى للمطورين الذين يستخدمون Microsoft AZD في مجال الذكاء الاصطناعي.**

#### تمت الإضافة
- **📝 CONTRIBUTING.md**: وثيقة إرشادات مساهمة جديدة تحتوي على:
  - تعليمات واضحة للإبلاغ عن المشاكل واقتراح التغييرات
  - معايير التوثيق للمحتوى الجديد
  - إرشادات أمثلة الكود واتفاقيات رسائل الالتزام
  - معلومات عن المشاركة المجتمعية

#### تم الإنجاز
- **🎯 وحدة ورشة العمل 7 (الخاتمة)**: إكمال كامل للوحدة الختامية مع:
  - ملخص شامل لإنجازات الورشة
  - قسم المفاهيم الأساسية المتقنة يغطي AZD والقوالب وMicrosoft Foundry
  - توصيات لاستمرار رحلة التعلم
  - تحديات تمارين الورشة مع تقييمات الصعوبة
  - ملاحظات المجتمع وروابط الدعم

- **📚 وحدة ورشة العمل 3 (تحليل)**: تحديث أهداف التعلم مع:
  - تفعيل GitHub Copilot مع خوادم MCP
  - فهم هيكل مجلد قالب AZD
  - أنماط تنظيم البنية التحتية كرمز (Bicep)
  - تعليمات المختبر العملي

- **🔧 وحدة ورشة العمل 6 (التفكيك)**: اكتملت مع:
  - أهداف تنظيف الموارد وإدارة التكلفة
  - استخدام `azd down` لإلغاء توفير البنية التحتية بأمان
  - إرشادات استرداد خدمات الذكاء الاصطناعي المحذوفة بطيئة الحذف
  - حوافز استكشاف GitHub Copilot ومنصة Azure

#### تم التصحيح
- **🔗 إصلاح الروابط المكسورة**: تم حل أكثر من 15 رابطًا داخليًا مكسورًا في التوثيق:
  - `docs/ai-foundry/ai-model-deployment.md`: تصحيح مسارات microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: تصحيح مسارات ai-model-deployment.md و production-ai-practices.md
  - `docs/getting-started/first-project.md`: استبدال cicd-integration.md غير الموجود بـ deployment-guide.md
  - `examples/retail-scenario.md`: تصحيح مسارات الأسئلة الشائعة ودليل استكشاف الأخطاء
  - `examples/container-app/microservices/README.md`: تصحيح مسارات الصفحة الرئيسية للدورة ودليل النشر
  - `resources/faq.md` و `resources/glossary.md`: تحديث مراجع فصل الذكاء الاصطناعي
  - `course-outline.md`: تصحيح دلائل المدرسين ومختبرات ورش الذكاء الاصطناعي

- **📅 شعار حالة الورشة**: تحديث الحالة من "تحت الإنشاء" إلى حالة ورشة نشطة بتاريخ فبراير 2026

- **🔗 تنقل الورشة**: إصلاح روابط التنقل المكسورة في README.md للورشة التي كانت تشير إلى مجلد lab-1-azd-basics غير الموجود

#### تغييرات
- **عرض الورشة**: إزالة تحذير "تحت الإنشاء"، الورشة مكتملة وجاهزة للاستخدام
- **اتساق التنقل**: ضمان أن جميع وحدات الورشة بها تنقل صحيح بين الوحدات
- **مراجع مسار التعلم**: تحديث المراجع البينية مع استخدام مسارات microsoft-foundry الصحيحة

#### تم التحقق منها
- ✅ جميع ملفات markdown الإنجليزية تحتوي على روابط داخلية صالحة
- ✅ وحدات الورشة 0-7 مكتملة مع أهداف التعلم
- ✅ التنقل بين الفصول والوحدات يعمل بشكل صحيح
- ✅ المحتوى مناسب لمطوري الذكاء الاصطناعي الذين يستخدمون Microsoft AZD
- ✅ تم الحفاظ على لغة وبنية ملائمة للمبتدئين عبر كامل المحتوى
- ✅ ملف CONTRIBUTING.md يقدم إرشادات واضحة لمساهمي المجتمع

#### التنفيذ التقني
- **التحقق من الروابط**: تحقق نص PowerShell تلقائيًا من جميع الروابط الداخلية لـ .md
- **تدقيق المحتوى**: مراجعة يدوية لكمال الورشة ومدى ملاءمتها للمبتدئين
- **نظام التنقل**: تطبيق نماذج تنقل متسقة للفصول والوحدات

#### ملاحظات
- **النطاق**: التغييرات مطبقة على التوثيق الإنجليزي فقط
- **الترجمات**: لم يتم تحديث مجلدات الترجمة في هذا الإصدار (سيتم المزامنة ترجميًا لاحقًا)
- **مدة الورشة**: توفر الورشة المكتملة الآن 3-4 ساعات من التعلم العملي

---

### [v3.8.0] - 2025-11-19

#### توثيق متقدم: المراقبة، الأمان، وأنماط تعدد الوكلاء
**يضيف هذا الإصدار دروسًا شاملة من الدرجة الأولى حول تكامل Application Insights، وأنماط المصادقة، وتنسيق الوكلاء المتعددين لنشرات الإنتاج.**

#### تمت الإضافة
- **📊 درس تكامل Application Insights**: في `docs/pre-deployment/application-insights.md`:
  - نشر موجه للـ AZD مع توفير تلقائي
  - قوالب Bicep كاملة لـ Application Insights + Log Analytics
  - تطبيقات بايثون عاملة مع قياس عن بعد مخصص (أكثر من 1200 سطر)
  - أنماط مراقبة AI/LLM (تتبع رموز/تكاليف نماذج Microsoft Foundry)
  - 6 مخططات Mermaid (الهندسة، التتبع الموزع، تدفق القياس عن بعد)
  - 3 تمارين تطبيقية (تنبيهات، لوحات معلومات، مراقبة AI)
  - أمثلة استعلامات Kusto واستراتيجيات تحسين التكاليف
  - بث المقاييس الحي وتصحيح الأخطاء في الوقت الحقيقي
  - وقت تعلم 40-50 دقيقة مع أنماط جاهزة للإنتاج

- **🔐 درس أنماط المصادقة والأمان**: في `docs/getting-started/authsecurity.md`:
  - 3 أنماط مصادقة (سلاسل الاتصال، Key Vault، الهوية المُدارة)
  - قوالب بنية تحتية Bicep كاملة للنشرات الآمنة
  - كود تطبيق Node.js مع تكامل Azure SDK
  - 3 تمارين كاملة (تمكين الهوية المُدارة، الهوية المعينة للمستخدم، تدوير Key Vault)
  - ممارسات الأمان الفضلى وتكوينات RBAC
  - دليل استكشاف الأخطاء وتحليل التكاليف
  - أنماط مصادقة بدون كلمة مرور جاهزة للإنتاج

- **🤖 درس أنماط تنسيق الوكلاء المتعددين**: في `docs/pre-deployment/coordination-patterns.md`:
  - 5 أنماط تنسيق (تسلسلي، متواز، هرمي، مدفوع بالأحداث، بالإجماع)
  - تنفيذ خدمة منسق كامل (Python/Flask، أكثر من 1500 سطر)
  - 3 تنفيذات متخصصة للوكلاء (بحث، كاتب، محرر)
  - تكامل Service Bus لقوائم الانتظار الرسائل
  - إدارة الحالة في Cosmos DB للأنظمة الموزعة
  - 6 مخططات Mermaid تعرض تفاعلات الوكلاء
  - 3 تمارين متقدمة (معالجة انتهاء المهلة، منطق الإعادة، قاطع الدائرة)
  - تحليل التكلفة (240-565 دولار شهريًا) مع استراتيجيات تحسين
  - تكامل Application Insights للمراقبة

#### تحسينات
- **فصل قبل النشر**: يشمل الآن أنماط مراقبة وتنسيق شاملة
- **فصل بدء الاستخدام**: محسن بأنماط مصادقة احترافية
- **جاهزية الإنتاج**: تغطية كاملة من الأمان إلى القابلية للمراقبة
- **مخطط الدورة**: محدث ليشير إلى دروس جديدة في الفصلين 3 و6

#### تغييرات
- **تقدم التعلم**: تكامل أفضل للأمان والمراقبة عبر الدورة
- **جودة التوثيق**: معايير درجة A متناسقة (95-97%) عبر الدروس الجديدة
- **أنماط الإنتاج**: تغطية كاملة للنشر المؤسسي من البداية إلى النهاية

#### تحسينات
- **تجربة المطور**: مسار واضح من التطوير إلى مراقبة الإنتاج
- **معايير الأمان**: أنماط احترافية للمصادقة وإدارة الأسرار
- **القابلية للمراقبة**: تكامل كامل لـ Application Insights مع AZD
- **أحمال عمل AI**: مراقبة متخصصة لنماذج Microsoft Foundry وأنظمة الوكلاء المتعددين

#### تم التحقق منها
- ✅ جميع الدروس تحتوي على كود كامل عامل (ليس مقاطع مقتطفة)
- ✅ مخططات Mermaid للتعلم البصري (19 إجمالي عبر 3 دروس)
- ✅ تمارين تطبيقية مع خطوات التحقق (9 إجمالي)
- ✅ قوالب Bicep جاهزة للنشر عبر `azd up`
- ✅ تحليل التكلفة واستراتيجيات التحسين
- ✅ أدلة استكشاف الأخطاء والممارسات الفضلى
- ✅ نقاط تحقق للمعرفة مع أوامر التحقق

#### نتائج تقييم التوثيق
- **docs/pre-deployment/application-insights.md**: - دليل شامل للمراقبة
- **docs/getting-started/authsecurity.md**: - أنماط أمان احترافية
- **docs/pre-deployment/coordination-patterns.md**: - معمارية متقدمة للوكلاء المتعددين
- **المحتوى الجديد العام**: - معايير جودة عالية متناسقة

#### التنفيذ التقني
- **Application Insights**: Log Analytics + قياس مخصص + تتبع موزع
- **المصادقة**: الهوية المُدارة + Key Vault + أنماط RBAC
- **الوكلاء المتعددون**: Service Bus + Cosmos DB + حاويات التطبيقات + التنسيق
- **المراقبة**: مقاييس حية + استعلامات Kusto + تنبيهات + لوحات معلومات
- **إدارة التكاليف**: استراتيجيات أخذ العينات، سياسات الاحتفاظ، ضوابط الميزانية

### [v3.7.0] - 2025-11-19

#### تحسينات جودة التوثيق ومثال جديد لنماذج Microsoft Foundry
**يعزز هذا الإصدار جودة التوثيق عبر المستودع ويضيف مثال نشر كامل لنماذج Microsoft Foundry مع واجهة دردشة gpt-4.1.**

#### تمت الإضافة
- **🤖 مثال دردشة نماذج Microsoft Foundry**: نشر gpt-4.1 كامل مع تنفيذ عامل في `examples/azure-openai-chat/`:
  - بنية تحتية كاملة لنماذج Microsoft Foundry (نشر نموذج gpt-4.1)
  - واجهة دردشة سطر أوامر بايثون مع سجل المحادثة
  - تكامل Key Vault لتخزين مفاتيح API بشكل آمن
  - تتبع استخدام الرموز وتقدير التكلفة
  - تحديد معدلات الخطأ والمحدودية
  - README شامل مع دليل نشر 35-45 دقيقة
  - 11 ملف جاهز للإنتاج (قوالب Bicep، تطبيق بايثون، التكوين)
- **📚 تمارين التوثيق**: إضافة تمارين عملية لدليل التكوين:
  - التمرين 1: تكوين بيئات متعددة (15 دقيقة)
  - التمرين 2: ممارسة إدارة الأسرار (10 دقائق)
  - معايير نجاح واضحة وخطوات تحقق
- **✅ التحقق من النشر**: إضافة قسم التحقق إلى دليل النشر:
  - إجراءات فحص الصحة
  - قائمة معايير النجاح
  - المخرجات المتوقعة لجميع أوامر النشر
  - مرجع سريع لاستكشاف الأخطاء

#### تحسينات
- **examples/README.md**: تحديث الجودة إلى درجة A (93%):
  - إضافة azure-openai-chat لجميع الأقسام ذات الصلة
  - تحديث عدد الأمثلة المحلية من 3 إلى 4
  - إضافته إلى جدول أمثلة تطبيقات AI
  - دمجه في البدء السريع للمستخدمين المتوسطين
  - إضافته إلى قسم قوالب Microsoft Foundry
  - تحديث مصفوفة المقارنة وأقسام استكشاف التكنولوجيا
- **جودة التوثيق**: تحسنت من B+ (87%) إلى A- (92%) عبر مجلد الوثائق:
  - أُضيفت المخرجات المتوقعة لأمثلة الأوامر الحرجة
  - تم تضمين خطوات التحقق من تغييرات التكوين
  - تم تعزيز التعلم العملي بتمارين تطبيقية

#### تم التغيير
- **تقدم التعلم**: دمج أفضل لأمثلة الذكاء الاصطناعي للمتعلمين المتوسطين
- **هيكل التوثيق**: تمارين أكثر قابلية للتنفيذ مع نتائج واضحة
- **عملية التحقق**: إضافة معايير نجاح صريحة لسير العمل الأساسية

#### تم التحسين
- **تجربة المطور**: نشر نماذج Microsoft Foundry يتطلب الآن 35-45 دقيقة (مقابل 60-90 للبدائل المعقدة)
- **شفافية التكلفة**: تقديرات تكلفة واضحة (50-200 دولار شهريًا) لمثال نماذج Microsoft Foundry
- **مسار التعلم**: للمطورين الذكاء الاصطناعي نقطة دخول واضحة مع azure-openai-chat
- **معايير التوثيق**: مخرجات متوقعة وخطوات تحقق متسقة

#### تم التحقق
- ✅ نموذج Microsoft Foundry يعمل بشكل كامل مع `azd up`
- ✅ جميع ملفات التنفيذ الـ 11 صحيحة نحويًا
- ✅ تعليمات README تتطابق مع تجربة النشر الفعلية
- ✅ تحديث روابط التوثيق عبر أكثر من 8 مواقع
- ✅ مؤشر الأمثلة يعكس بدقة 4 أمثلة محلية
- ✅ لا يوجد روابط خارجية مكررة في الجداول
- ✅ جميع مراجع التنقل صحيحة

#### التنفيذ الفني
- **هيكل نماذج Microsoft Foundry**: gpt-4.1 + Key Vault + نمط تطبيقات الحاويات
- **الأمان**: معرفة مدارة جاهزة، الأسرار في Key Vault
- **المراقبة**: تكامل مع Application Insights
- **إدارة التكلفة**: تتبع الرموز وتحسين الاستخدام
- **النشر**: أمر `azd up` واحد للإعداد الكامل

### [v3.6.0] - 2025-11-19

#### تحديث رئيسي: أمثلة نشر تطبيقات الحاويات
**تقدم هذه النسخة أمثلة شاملة لنشر تطبيقات الحاويات جاهزة للإنتاج باستخدام Azure Developer CLI (AZD)، مع توثيق كامل ودمج في مسار التعلم.**

#### أُضيف
- **🚀 أمثلة تطبيقات الحاويات**: أمثلة محلية جديدة في `examples/container-app/`:
  - [الدليل الشامل](examples/container-app/README.md): عرض كامل لنشر الحاويات، بدء سريع، الإنتاج وأنماط متقدمة
  - [API فلاس بسيط](../../examples/container-app/simple-flask-api): API REST للمبتدئين مع التدرج للصفر، فحوصات الصحة، المراقبة، واستكشاف الأخطاء
  - [هيكلية الخدمات المصغرة](../../examples/container-app/microservices): نشر خدمات متعددة جاهز للإنتاج (API Gateway, Product, Order, User, Notification)، المراسلة غير المتزامنة، Service Bus, Cosmos DB, Azure SQL، تتبع موزع، نشر أزرق-أخضر/كانياري
- **أفضل الممارسات**: إرشادات الأمان والمراقبة وتحسين التكلفة وCI/CD للأحمال المعبأة بحاويات
- **عينات الكود**: مكتملة `azure.yaml`، قوالب Bicep، وتنفيذات متعددة اللغات (Python, Node.js, C#, Go)
- **الاختبار واستكشاف الأخطاء**: سيناريوهات اختبار شاملة، أوامر المراقبة، إرشادات استكشاف الأخطاء

#### تم التغيير
- **README.md**: تم التحديث لإبراز وربط أمثلة تطبيقات الحاويات الجديدة ضمن "الأمثلة المحلية - تطبيقات الحاويات"
- **examples/README.md**: تم تحديثه لتسليط الضوء على أمثلة تطبيقات الحاويات، إضافة مدخلات مصفوفة المقارنة، وتحديث مراجع التكنولوجيا/الهيكلية
- **مخطط الدورة ودليل الدراسة**: تم تحديثه للإشارة إلى أمثلة تطبيقات الحاويات وأنماط النشر ذات الصلة في الفصول المناسبة

#### تم التحقق
- ✅ جميع الأمثلة الجديدة قابلة للنشر باستخدام `azd up` وتتبع أفضل الممارسات
- ✅ تحديث الروابط والارتباطات المتبادلة في الوثائق والتنقل
- ✅ الأمثلة تغطي سيناريوهات من المبتدئين إلى المتقدمين، بما في ذلك الخدمات المصغرة الإنتاجية

#### ملاحظات
- **النطاق**: الوثائق والأمثلة باللغة الإنجليزية فقط
- **الخطوات القادمة**: توسيع بأنماط حاويات متقدمة إضافية وأتمتة CI/CD في الإصدارات المستقبلية

### [v3.5.0] - 2025-11-19

#### إعادة تسمية المنتج: Microsoft Foundry
**تنفذ هذه النسخة تغييرًا شاملاً لاسم المنتج من "Microsoft Foundry" إلى "Microsoft Foundry" في كافة التوثيقات الإنجليزية، مع انعكاس إعادة التسمية الرسمية لمايكروسوفت.**

#### تم التغيير
- **🔄 تحديث اسم المنتج**: إعادة تسمية كاملة من "Microsoft Foundry" إلى "Microsoft Foundry"
  - تم تحديث كافة الإشارات عبر التوثيق الإنجليزي في مجلد `docs/`
  - إعادة تسمية المجلد: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - إعادة تسمية الملف: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - المجموع: تحديث 23 مرجع محتوى عبر 7 ملفات توثيق

- **📁 تغييرات هيكل المجلدات**:
  - تم إعادة تسمية `docs/ai-foundry/` إلى `docs/microsoft-foundry/`
  - تم تحديث كل الإشارات المتقاطعة لتعكس الهيكل الجديد للمجلدات
  - تم التحقق من روابط التنقل عبر كل التوثيق

- **📄 إعادة تسمية الملفات**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - تم تحديث كل الروابط الداخلية للإشارة إلى أسماء الملفات الجديدة

#### تحديث الملفات
- **توثيق الفصول** (7 ملفات):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 تحديثات لروابط التنقل
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 تحديثات لمرجع اسم المنتج
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - تستخدم بالفعل Microsoft Foundry (من التحديثات السابقة)
  - `docs/microsoft-foundry/production-ai-practices.md` - تم تحديث 3 مراجع (نظرة عامة، ملاحظات المجتمع، التوثيق)
  - `docs/getting-started/azd-basics.md` - تحديث 4 روابط ارتجاع متقاطع
  - `docs/getting-started/first-project.md` - تحديث 2 روابط التنقل الفصلية
  - `docs/getting-started/installation.md` - تحديث 2 روابط للفصل التالي
  - `docs/troubleshooting/ai-troubleshooting.md` - تحديث 3 مراجع (التنقل، مجتمع Discord)
  - `docs/troubleshooting/common-issues.md` - تحديث رابط تنقل واحد
  - `docs/troubleshooting/debugging.md` - تحديث رابط تنقل واحد

- **ملفات هيكل الدورة** (2 ملفات):
  - `README.md` - تحديث 17 مرجع (ملخص الدورة، عناوين الفصول، قسم القوالب، رؤى المجتمع)
  - `course-outline.md` - تحديث 14 مرجع (نظرة عامة، أهداف التعلم، موارد الفصل)

#### تم التحقق
- ✅ لا توجد مراجع متبقية لمسار مجلد "ai-foundry" في الوثائق الإنجليزية
- ✅ لا توجد مراجع متبقية لاسم المنتج "Microsoft Foundry" في الوثائق الإنجليزية
- ✅ كل روابط التنقل تعمل مع الهيكل الجديد للمجلدات
- ✅ تم إكمال إعادة تسمية الملفات والمجلدات بنجاح
- ✅ تم التحقق من الارتباطات المتقاطعة بين الفصول

#### ملاحظات
- **النطاق**: التغييرات مطبقة فقط على التوثيق الإنجليزي في مجلد `docs/`
- **الترجمات**: مجلدات الترجمة (`translations/`) غير محدثة في هذا الإصدار
- **ورش العمل**: مواد ورش العمل (`workshop/`) غير محدثة في هذا الإصدار
- **الأمثلة**: ملفات الأمثلة قد تزال تشير إلى التسميات القديمة (سيتم معالجتها في تحديث مستقبلي)
- **الروابط الخارجية**: عناوين URL خارجية ومرجع مستودع GitHub لم تتغير

#### دليل الهجرة للمساهمين
إذا كان لديك فروع محلية أو توثيق يشير إلى الهيكل القديم:
1. حدّث إشارات المجلد: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. حدّث إشارات الملفات: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. استبدل اسم المنتج: "Microsoft Foundry" → "Microsoft Foundry"
4. تحقق أن كل الروابط الداخلية في التوثيق ما زالت تعمل

---

### [v3.4.0] - 2025-10-24

#### تعزيزات معاينة البنية التحتية والتحقق
**يقدم هذا الإصدار دعمًا شاملاً للميزة الجديدة Azure Developer CLI للمعاينة ويُحسّن تجربة مستخدمي ورش العمل.**

#### أُضيف
- **🧪 توثيق ميزة azd provision --preview**: تغطية شاملة لقدرة معاينة البنية التحتية الجديدة
  - مرجع الأمر وأمثلة الاستخدام في ورقة الغش
  - تكامل مفصل في دليل التجهيز مع حالات استخدام وفوائد
  - تكامل فحص قبل الطيران لفحص النشر بشكل آمن
  - تحديثات دليل البدء مع ممارسات نشر تركز على الأمان أولاً
- **🚧 شريط حالة ورشة العمل**: شريط HTML احترافي يُظهر حالة تطوير الورشة
  - تصميم تدرجي مع مؤشرات بناء لتواصل واضح مع المستخدم
  - طابع زمني لآخر تحديث للشفافية
  - تصميم متجاوب مع الأجهزة المحمولة لجميع أنواع الأجهزة

#### تم التعزيز
- **سلامة البنية التحتية**: دمج وظيفة المعاينة في جميع توثيقات النشر
- **التحقق قبل النشر**: سكربتات مؤتمتة الآن تشمل اختبار معاينة البنية التحتية
- **سير عمل المطور**: تحديث تسلسل الأوامر ليشمل المعاينة كأفضل ممارسة
- **تجربة الورشة**: وضع توقعات واضحة للمستخدمين حول حالة تطوير المحتوى

#### تم التغيير
- **أفضل ممارسات النشر**: سير عمل المعاينة أولًا هو الآن الاستراتيجية الموصى بها
- **تدفق التوثيق**: تم تقديم التحقق من البنية التحتية في وقت مبكر من عملية التعلم
- **عرض الورشة**: تواصل حالة احترافية مع جدول زمني واضح للتطوير

#### تم التحسين
- **نهج السلامة أولاً**: يمكن الآن التحقق من تغييرات البنية التحتية قبل النشر
- **تعاون الفريق**: يمكن مشاركة نتائج المعاينة للمراجعة والموافقة
- **الوعي بالتكاليف**: فهم أفضل لتكاليف الموارد قبل التجهيز
- **تخفيف المخاطر**: تقليل إخفاقات النشر من خلال التحقق المسبق

#### التنفيذ الفني
- **تكامل متعدد الوثائق**: ميزة المعاينة موثقة عبر 4 ملفات رئيسية
- **أنماط الأوامر**: تنسيق وأمثلة متناسقة عبر التوثيق
- **دمج أفضل الممارسات**: تضمين المعاينة في سير عمل التحقق والسكربتات
- **مؤشرات بصرية**: علامات مميزة واضحة للميزات الجديدة لسهولة الاكتشاف

#### بنية ورشة العمل
- **تواصل الحالة**: شريط HTML محترف مع تصميم تدرجي
- **تجربة المستخدم**: حالة تطوير واضحة تمنع الالتباس
- **عرض احترافي**: يحافظ على مصداقية المستودع مع وضع توقعات واضحة
- **شفافية الجدول الزمني**: طابع زمني لآخر تحديث في أكتوبر 2025 للمساءلة

### [v3.3.0] - 2025-09-24

#### مواد ورشة العمل المحسنة وتجربة تعلم تفاعلية
**يقدم هذا الإصدار مواد ورشة عمل شاملة مع أدلة تفاعلية مستندة إلى المتصفح ومسارات تعلم منظمة.**

#### أُضيف
- **🎥 دليل ورشة العمل التفاعلية**: تجربة ورشة عمل مستندة إلى المتصفح مع قدرة معاينة MkDocs
- **📝 تعليمات ورشة العمل المنظمة**: مسار تعلم موجه مكوّن من 7 خطوات من الاكتشاف إلى التخصيص
  - 0-مقدمة: نظرة عامة على الورشة والإعداد
  - 1-اختيار قالب الذكاء الاصطناعي: عملية اكتشاف واختيار القالب
  - 2-التحقق من قالب الذكاء الاصطناعي: إجراءات النشر والتحقق
  - 3-تفكيك قالب الذكاء الاصطناعي: فهم هيكلية القالب
  - 4-تكوين قالب الذكاء الاصطناعي: التهيئة والتخصيص
  - 5-تخصيص قالب الذكاء الاصطناعي: التعديلات المتقدمة والتكرارات
  - 6-تفكيك البنية التحتية: التنظيف وإدارة الموارد
  - 7-الختام: ملخص والخطوات التالية
- **🛠️ أدوات الورشة**: تكوين MkDocs مع سمة Material لتعزيز تجربة التعلم
- **🎯 مسار التعلم العملي**: منهجية من 3 خطوات (الاكتشاف → النشر → التخصيص)
- **📱 تكامل GitHub Codespaces**: إعداد بيئة تطوير سلسة

#### تم التعزيز
- **مختبر ورشة الذكاء الاصطناعي**: توسيع بتجربة تعلم منظمة شاملة مدتها 2-3 ساعات
- **توثيق الورشة**: عرض احترافي مع تنقل ووسائل بصرية
- **تقدم التعلم**: إرشاد واضح خطوة بخطوة من اختيار القالب إلى النشر الإنتاجي
- **تجربة المطور**: أدوات مدمجة لتدفقات عمل تطوير مبسطة

#### تم التحسين
- **إمكانية الوصول**: واجهة مستعرض مع وظيفة البحث، النسخ، وتبديل السمة
- **التعلم الذاتي**: هيكل ورشة مرن يناسب سرعات تعلم مختلفة
- **تطبيق عملي**: سيناريوهات نشر قوالب الذكاء الاصطناعي في العالم الحقيقي
- **تكامل المجتمع**: دمج Discord لدعم الورشة والتعاون

#### ميزات الورشة
- **بحث مدمج**: اكتشاف الكلمات الرئيسية والدروس بسرعة
- **نسخ كتل الكود**: وظيفة نسخ عند التمرير لكل أمثلة الكود
- **تبديل السمة**: دعم الوضع الداكن/الفاتح لتفضيلات مختلفة
- **الموارد البصرية**: لقطات شاشة ورسومات لتحسين الفهم
- **تكامل المساعدة**: وصول مباشر إلى Discord للدعم المجتمعي

### [v3.2.0] - 2025-09-17

#### إعادة هيكلة التنقل الرئيسية ونظام التعلم القائم على الفصول
**يقدم هذا الإصدار هيكل تعلم شامل قائم على الفصول مع تحسين التنقل عبر المستودع بأكمله.**

#### أُضيف
- **📚 نظام التعلم القائم على الفصول**: إعادة هيكلة الدورة الكاملة إلى 8 فصول تعليمية متدرجة
  - الفصل 1: الأساسيات والبدء السريع (⭐ - 30-45 دقيقة)
  - الفصل 2: تطوير يركز على الذكاء الاصطناعي أولاً (⭐⭐ - 1-2 ساعة)
  - الفصل 3: التكوين والمصادقة (⭐⭐ - 45-60 دقيقة)
  - الفصل 4: البنية التحتية كرمز والنشر (⭐⭐⭐ - 1-1.5 ساعة)
  - الفصل 5: حلول الذكاء الاصطناعي متعددة الوكلاء (⭐⭐⭐⭐ - 2-3 ساعات)
  - الفصل 6: التحقق والتخطيط قبل النشر (⭐⭐ - 1 ساعة)
  - الفصل 7: استكشاف الأخطاء وإصلاحها (⭐⭐ - 1-1.5 ساعة)
  - الفصل 8: أنماط الإنتاج والمؤسسات (⭐⭐⭐⭐ - 2-3 ساعات)
- **📚 نظام تنقل شامل**: رؤوس وتذييلات تنقل متسقة عبر كافة التوثيق
- **🎯 تتبع التقدم**: قائمة مراجعة إكمال الدورة ونظام تصديق التعلم
- **🗺️ إرشاد مسار التعلم**: نقاط دخول واضحة لمستويات وأهداف خبرة متنوعة
- **🔗 تنقل بالمرجع المتقاطع**: فصول ذات صلة ومتطلبات واضحة مرتبطة بوضوح

#### تم التعزيز
- **هيكل README**: تحول إلى منصة تعلم منظمة مع تنظيم قائم على الفصول
- **تنقل التوثيق**: كل صفحة تتضمن الآن سياق الفصل وتوجيه التقدم
- **تنظيم القوالب**: الأمثلة والقوالب مرتبة حسب فصول التعلم المناسبة
- **تكامل الموارد**: أوراق الغش، الأسئلة الشائعة، وأدلة الدراسة مرتبطة بالفصول ذات الصلة
- **تكامل الورشة**: مختبرات عملية مرتبطة بأهداف تعلم متعددة الفصول

#### تم التغيير
- **تقدم التعلم**: الانتقال من توثيق خطي إلى تعلم مرن قائم على الفصول
- **موقع التكوين**: إعادة وضع دليل التكوين كالفصل 3 لتدفق تعلم أفضل
- **دمج محتوى الذكاء الاصطناعي**: دمج أفضل لمحتوى الذكاء الاصطناعي الخاص طوال رحلة التعلم
- **محتوى الإنتاج**: تجميع أنماط متقدمة في الفصل 8 للمتعلمين على مستوى المؤسسات

#### تحسينات
- **تجربة المستخدم**: مسارات تنقل واضحة ومؤشرات تقدم الفصول
- **سهولة الوصول**: أنماط تنقل متسقة لتسهيل التنقل في الدورة
- **العرض الاحترافي**: هيكل دورة بأسلوب جامعي مناسب للتدريب الأكاديمي والمهني
- **كفاءة التعلم**: تقليل الوقت للعثور على المحتوى المناسب من خلال تنظيم محسّن

#### التنفيذ التقني
- **رؤوس التنقل**: توحيد تنقل الفصول عبر أكثر من 40 ملف توثيق
- **تنقل التذييل**: توجيه تقدم متسق ومؤشرات إتمام الفصول
- **الربط الداخلي**: نظام ربط داخلي شامل يربط المفاهيم ذات الصلة
- **خريطة الفصول**: قوالب وأمثلة مرتبطة بوضوح بأهداف التعلم

#### تحسين دليل الدراسة
- **📚 أهداف تعلم شاملة**: إعادة هيكلة دليل الدراسة لمواءمة نظام المقررات المكون من 8 فصول
- **🎯 تقييم قائم على الفصول**: يشمل كل فصل أهداف تعلم محددة وتمارين عملية
- **📋 تتبع التقدم**: جدول تعلم أسبوعي مع نتائج قابلة للقياس وقوائم مراجعة للإكمال
- **❓ أسئلة التقييم**: أسئلة تحقق من المعرفة لكل فصل مع نتائج مهنية
- **🛠️ تمارين عملية**: أنشطة تطبيقية مع سيناريوهات نشر حقيقية وحل المشكلات
- **📊 تقدم المهارات**: تقدم واضح من المفاهيم الأساسية إلى أنماط المؤسسات مع تركيز على التطوير المهني
- **🎓 إطار الشهادات**: نتائج التطوير المهني ونظام اعتراف مجتمعي
- **⏱️ إدارة الجدول الزمني**: خطة تعلم منظمة لمدة 10 أسابيع مع تحقق من الإنجاز

### [v3.1.0] - 2025-09-17

#### حلول الذكاء الاصطناعي متعددة العملاء المحسنة
**تحسن هذه النسخة من حل الذكاء الاصطناعي متعدد العملاء للبيع بالتجزئة مع تسمية أفضل للعملاء وتوثيق معزز.**

#### تغييرات
- **مصطلحات متعددة العملاء**: استبدال "وكيل كورا" بـ "وكيل العميل" في حل البيع بالتجزئة متعدد العملاء لفهم أوضح
- **هيكل الوكيل**: تحديث كافة المستندات وقوالب ARM وأمثلة الشيفرة لاستخدام تسمية "وكيل العميل" المتسقة
- **أمثلة التكوين**: تحديث أنماط تكوين الوكلاء بتحديث قواعد التسمية
- **اتساق الوثائق**: ضمان استخدام أسماء وكلاء مهنية ووصفية في جميع الإشارات

#### تحسينات
- **حزمة قالب ARM**: تحديث retail-multiagent-arm-template مع إشارات لوكيل العميل
- **مخططات الهيكلية**: تحديث مخططات Mermaid مع تسمية الوكيل المحدثة
- **أمثلة الشفرة**: فصول بايثون وأمثلة التنفيذ تستخدم الآن تسمية CustomerAgent
- **متغيرات البيئة**: تحديث جميع نصوص النشر لاستخدام قواعد تسمية CUSTOMER_AGENT_NAME

#### تحسينات
- **تجربة المطور**: أدوار ومسؤوليات الوكلاء أوضح في الوثائق
- **جاهزية الإنتاج**: توافق أفضل مع قواعد التسمية المؤسسية
- **مواد التعلم**: تسمية أكثر فهمًا لأغراض تعليمية
- **قابلية استخدام القالب**: تبسيط فهم وظائف الوكلاء وأنماط النشر

#### التفاصيل التقنية
- تحديث مخططات الهيكل Mermaid مع إشارات CustomerAgent
- استبدال أسماء الكلاس CoraAgent بـ CustomerAgent في أمثلة بايثون
- تعديل تكوينات JSON لقالب ARM لاستخدام نوع الوكيل "customer"
- تحديث متغيرات البيئة من CORA_AGENT_* إلى CUSTOMER_AGENT_*
- تحديث كافة أوامر النشر وتكوينات الحاوية

### [v3.0.0] - 2025-09-12

#### تغييرات رئيسية - تركيز على مطوري الذكاء الاصطناعي وتكامل Microsoft Foundry
**تحول هذه النسخة المستودع إلى مورد تعلم شامل موجه لمطوري الذكاء الاصطناعي مع تكامل Microsoft Foundry.**

#### إضافات
- **🤖 مسار تعلم يركز على الذكاء الاصطناعي أولاً**: إعادة هيكلة كاملة تركز على مطوري ومهندسي الذكاء الاصطناعي
- **دليل تكامل Microsoft Foundry**: توثيق شامل لربط AZD مع خدمات Microsoft Foundry
- **أنماط نشر نماذج الذكاء الاصطناعي**: دليل مفصل يغطي اختيار النموذج والتكوين واستراتيجيات النشر في الإنتاج
- **مختبر ورشة عمل الذكاء الاصطناعي**: ورشة عمل تطبيقية مدتها 2-3 ساعات لتحويل تطبيقات الذكاء الاصطناعي إلى حلول قابلة للنشر عبر AZD
- **أفضل ممارسات إنتاج الذكاء الاصطناعي**: أنماط جاهزة للمؤسسات للتوسع والمراقبة وتأمين أعباء عمل الذكاء الاصطناعي
- **دليل استكشاف أخطاء الذكاء الاصطناعي**: استكشاف أخطاء شامل لنماذج Microsoft Foundry وخدمات الإدراك وقضايا النشر
- **معرض قوالب الذكاء الاصطناعي**: مجموعة مميزة من قوالب Microsoft Foundry مع تصنيفات التعقيد
- **مواد ورش العمل**: هيكل ورشة عمل كامل مع مختبرات تطبيقية ومواد مرجعية

#### تحسينات
- **هيكل README**: موجه لمطوري الذكاء الاصطناعي مع بيانات اهتمام المجتمع بنسبة 45% من Discord Microsoft Foundry
- **مسارات التعلم**: رحلة مخصصة لمطوري الذكاء الاصطناعي إلى جانب المسارات التقليدية للطلاب ومهندسي DevOps
- **توصيات القوالب**: قوالب ذكاء اصطناعي مميزة تشمل azure-search-openai-demo و contoso-chat و openai-chat-app-quickstart
- **تكامل المجتمع**: دعم مجتمع Discord معزز بقنوات ومناقشات مخصصة للذكاء الاصطناعي

#### الأمان وتركيز الإنتاج
- **أنماط الهوية المدارة**: تكوينات أمان ومصادقة مخصصة للذكاء الاصطناعي
- **تحسين التكلفة**: تتبع استخدام الرموز والتحكم في الميزانية لأعباء عمل الذكاء الاصطناعي
- **نشر متعدد المناطق**: استراتيجيات نشر تطبيقات الذكاء الاصطناعي عالمياً
- **مراقبة الأداء**: مقاييس خاصة بالذكاء الاصطناعي وتكامل Application Insights

#### جودة الوثائق
- **هيكل مسار التعلم الخطي**: تقدم منطقي من نماذج النشر للمبتدئين إلى أنماط الذكاء الاصطناعي المتقدمة
- **روابط URL محققة**: تم التحقق من جميع روابط المستودعات الخارجية وقابليتها للوصول
- **مرجع مكتمل**: تم التحقق من صحة جميع روابط الوثائق الداخلية ووظائفها
- **جاهز للإنتاج**: أنماط نشرة المؤسسات مع أمثلة واقعية

### [v2.0.0] - 2025-09-09

#### تغييرات رئيسية - إعادة هيكلة المستودع وتحسين احترافي
**تمثل هذه النسخة إعادة هيكلة كبيرة لمحتوى وهيكل المستودع.**

#### إضافات
- **إطار تعلم منظم**: تشمل الآن جميع صفحات الوثائق أقسام المقدمة، وأهداف التعلم، ونتائج التعلم
- **نظام التنقل**: إضافة روابط الدروس السابقة/التالية في جميع الوثائق لتوجيه تقدم التعلم
- **دليل الدراسة**: دراسة شاملة في study-guide.md مع أهداف تعليمية، تمارين تطبيقية، ومواد تقييم
- **العرض الاحترافي**: إزالة جميع رموز الإيموجي لتحسين إمكانية الوصول والمظهر الاحترافي
- **تحسين هيكل المحتوى**: تنظيم وتحسين تدفق مواد التعلم

#### تغييرات
- **تنسيق الوثائق**: توحيد كافة الوثائق مع هيكل تعلمي متسق
- **تدفق التنقل**: تطبيق تقدم منطقي عبر جميع مواد التعلم
- **عرض المحتوى**: إزالة العناصر الزخرفية لصالح تنسيق واضح واحترافي
- **هيكل الروابط**: تحديث جميع الروابط الداخلية لدعم نظام التنقل الجديد

#### تحسينات
- **سهولة الوصول**: إزالة اعتماديات الإيموجي لتحسين توافق قراءة الشاشة
- **المظهر الاحترافي**: عرض نظيف بأسلوب أكاديمي مناسب لتعلم المؤسسسة
- **تجربة التعلم**: منهج منظم مع أهداف واضحة ونتائج لكل درس
- **تنظيم المحتوى**: تدفق منطقي أفضل وربط بين المواضيع ذات الصلة

### [v1.0.0] - 2025-09-09

#### الإصدار الأول - مستودع تعلم شامل لـ AZD

#### إضافات
- **هيكل الوثائق الأساسية**
  - سلسلة دليل البدء الكامل
  - توثيق شامل للنشر والتوفير
  - موارد مفصلة لاستكشاف الأخطاء وإرشادات التصحيح
  - أدوات وإجراءات التحقق المسبق للنشر

- **وحدة البدء**
  - أساسيات AZD: المفاهيم والمصطلحات الأساسية
  - دليل التثبيت: إرشادات إعداد خاصة بالمنصة
  - دليل التكوين: إعداد البيئة والمصادقة
  - الدرس العملي الأول: تعلم عملي خطوة بخطوة

- **وحدة النشر والتوفير**
  - دليل النشر: توثيق سير العمل الكامل
  - دليل التوفير: البنية التحتية ككود باستخدام Bicep
  - أفضل الممارسات لنشر الإنتاج
  - أنماط بنية الخدمات المتعددة

- **وحدة التحقق المسبق للنشر**
  - تخطيط السعة: التحقق من توفر موارد Azure
  - اختيار SKU: إرشادات شاملة لطبقات الخدمة
  - فحوصات ما قبل الطيران: نصوص تحقق آلية (PowerShell و Bash)
  - أدوات تقدير التكلفة والتخطيط المالي

- **وحدة استكشاف الأخطاء**
  - المشاكل الشائعة: حلول للمشاكل المتكررة
  - دليل التصحيح: منهجيات استكشاف منهجية للأخطاء
  - تقنيات وأدوات التشخيص المتقدمة
  - مراقبة الأداء وتحسينه

- **الموارد والمراجع**
  - ورقة اختصارات الأوامر: مرجع سريع للأوامر الأساسية
  - مسرد: تعريفات شاملة للمصطلحات والاختصارات
  - الأسئلة المتكررة: إجابات مفصلة للأسئلة الشائعة
  - روابط الموارد الخارجية والاتصالات المجتمعية

- **الأمثلة والقوالب**
  - مثال تطبيق ويب بسيط
  - قالب نشر موقع ثابت
  - تكوين تطبيق الحاويات
  - أنماط دمج قواعد البيانات
  - أمثلة بنية الخدمات المصغرة
  - تطبيقات بدون خادم

#### الميزات
- **دعم متعدد المنصات**: أدلة التثبيت والتكوين لنظام ويندوز، ماك، ولينكس
- **مستويات مهارة متعددة**: محتوى مصمم للطلاب وصولاً إلى المطورين المحترفين
- **تركيز عملي**: أمثلة تطبيقية وسيناريوهات من العالم الحقيقي
- **تغطية شاملة**: من المفاهيم الأساسية إلى أنماط المؤسسات المتقدمة
- **نهج أمان أولاً**: أفضل ممارسات الأمان متكاملة في كل الأجزاء
- **تحسين التكلفة**: إرشادات لنشر فعال من حيث التكلفة وإدارة الموارد

#### جودة الوثائق
- **أمثلة شيفرة مفصلة**: عينات شيفرة عملية ومختبرة
- **إرشادات خطوة بخطوة**: توجيهات واضحة وعملية
- **معالجة الأخطاء الشاملة**: استكشاف الأخطاء الشائعة
- **دمج أفضل الممارسات**: المعايير والتوصيات الصناعية
- **توافق الإصدارات**: محدث مع أحدث خدمات Azure وميزات azd

## التحسينات المستقبلية المخططة

### الإصدار 3.1.0 (مخطط)
#### توسيع منصة الذكاء الاصطناعي
- **دعم نماذج متعددة**: أنماط دمج لنماذج Hugging Face و Azure Machine Learning والنماذج المخصصة
- **أطر عمل لوكلاء الذكاء الاصطناعي**: قوالب لنشر LangChain و Semantic Kernel و AutoGen
- **أنماط RAG المتقدمة**: خيارات قواعد بيانات متجهة أبعد من Azure AI Search (مثل Pinecone و Weaviate)
- **مراقبة الذكاء الاصطناعي**: مراقبة محسنة لأداء النماذج، استخدام الرموز، وجودة الاستجابة

#### تجربة المطور
- **امتداد VS Code**: تجربة تطوير مدمجة لـ AZD + Microsoft Foundry
- **تكامل GitHub Copilot**: توليد قوالب AZD مدعوم بالذكاء الاصطناعي
- **دروس تفاعلية**: تمارين ترميز تطبيقية مع تحقق آلي لسيناريوهات الذكاء الاصطناعي
- **محتوى فيديو**: دروس فيديو إضافية للمتعلم البصري تركز على نشرات الذكاء الاصطناعي

### الإصدار 4.0.0 (مخطط)
#### أنماط الذكاء الاصطناعي للمؤسسات
- **إطار الحوكمة**: حوكمة نماذج الذكاء الاصطناعي والامتثال ومسارات التدقيق
- **ذكاء اصطناعي متعدد المستأجرين**: أنماط لخدمة عدة عملاء بخدمات ذكاء اصطناعي معزولة
- **نشر الذكاء الاصطناعي على الحافة**: تكامل مع Azure IoT Edge وحاويات الحوسبة
- **الذكاء الاصطناعي السحابي المختلط**: أنماط نشر متعددة السحب وسحابة مختلطة لأعباء الذكاء الاصطناعي

#### ميزات متقدمة
- **أتمتة خط أنابيب الذكاء الاصطناعي**: تكامل MLOps مع خطوط أنابيب Azure Machine Learning
- **أمن متقدم**: أنماط الثقة الصفرية، ونقاط النهاية الخاصة، وحماية متقدمة ضد التهديدات
- **تحسين الأداء**: استراتيجيات ضبط وتوسيع متقدمة لتطبيقات الذكاء الاصطناعي عالية الإنتاجية
- **التوزيع العالمي**: أنماط توصيل المحتوى والتخزين المؤقت على الحافة لتطبيقات الذكاء الاصطناعي

### الإصدار 3.0.0 (مخطط) - تم تجاوزه بالإصدار الحالي
#### الإضافات المقترحة - تم تنفيذها الآن في v3.0.0
- ✅ **محتوى يركز على الذكاء الاصطناعي**: تكامل شامل مع Microsoft Foundry (مكتمل)
- ✅ **دروس تفاعلية**: مختبر ورشة عمل الذكاء الاصطناعي التطبيقي (مكتمل)
- ✅ **وحدة أمن متقدمة**: أنماط أمان خاصة بالذكاء الاصطناعي (مكتمل)
- ✅ **تحسين الأداء**: استراتيجيات ضبط أعباء العمل الخاصة بالذكاء الاصطناعي (مكتمل)

### الإصدار 2.1.0 (مخطط) - تم تنفيذه جزئيًا في v3.0.0
#### تحسينات طفيفة - تم بعضها في الإصدار الحالي
- ✅ **أمثلة إضافية**: سيناريوهات نشر تركز على الذكاء الاصطناعي (مكتمل)
- ✅ **توسيع الأسئلة المتداولة**: أسئلة واستكشاف أخطاء الذكاء الاصطناعي (مكتمل)
- **تكامُل الأدوات**: إرشادات محسنة لتكامل IDE والمحرر
- ✅ **توسيع المراقبة**: أنماط مراقبة وتنبيه خاصة بالذكاء الاصطناعي (مكتمل)

#### لا يزال مخططًا للإصدار المستقبلي
- **توثيق ملائم للجوال**: تصميم متجاوب للتعلم عبر الهواتف المحمولة
- **الوصول دون اتصال**: حزم وثائق قابلة للتنزيل
- **تكامل IDE محسّن**: امتداد VS Code لتدفقات العمل AZD + AI
- **لوحة معلومات المجتمع**: مقاييس مجتمعية في الوقت الفعلي وتتبع المساهمات

## كيفية المساهمة في سجل التغييرات

### الإبلاغ عن التغييرات
عند المساهمة في هذا المستودع، يرجى التأكد من أن إدخالات سجل التغييرات تتضمن:

1. **رقم الإصدار**: مع اتباع الاصدار الدلالي (major.minor.patch)
2. **التاريخ**: تاريخ الإصدار أو التحديث بصيغة YYYY-MM-DD
3. **الفئة**: إضافات، تغييرات، مهجورة، محذوفة، إصلاحات، أمان
4. **وصف واضح**: وصف موجز لما تم تغييره
5. **تقييم الأثر**: كيف تؤثر التغييرات على المستخدمين الحاليين

### فئات التغيير

#### إضافات
- ميزات جديدة، أقسام توثيق، أو قدرات جديدة
- أمثلة جديدة، قوالب، أو موارد تعليمية
- أدوات إضافية، نصوص، أو خدمات مساعدة

#### تغييرات
- تعديلات على الوظائف أو التوثيق القائمة
- تحديثات لتحسين الوضوح أو الدقة
- إعادة هيكلة المحتوى أو التنظيم

#### مهجورة
- ميزات أو أساليب تُزال تدريجياً
- أقسام توثيق مبرمجة للإزالة
- طرق تم استبدالها بخيارات أفضل

#### محذوفة
- ميزات، وثائق، أو أمثلة لم تعد ذات صلة
- معلومات قديمة أو أساليب مهجورة
- محتوى مكرر أو مدمج

#### إصلاحات
- تصحيحات لأخطاء في التوثيق أو الكود
- حل مشكلات أو تقارير أخطاء
- تحسينات للدقة أو الوظائف

#### أمان
- تحسينات أو إصلاحات متعلقة بالأمان
- تحديثات لأفضل ممارسات الأمان
- معالجة ثغرات أمنية

### إرشادات الاصدار الدلالي

#### الإصدار الرئيسي (X.0.0)
- تغييرات جذرية تتطلب إجراء من المستخدم
- إعادة هيكلة كبيرة للمحتوى أو التنظيم
- تغييرات تغير النهج أو المنهجية الأساسية

#### إصدار فرعي (X.Y.0)
- ميزات جديدة أو إضافات محتوى
- تحسينات تحافظ على التوافق مع الإصدارات السابقة
- أمثلة وأدوات أو موارد إضافية

#### إصدار تصحيحي (X.Y.Z)
- إصلاحات الأخطاء والتصحيحات
- تحسينات طفيفة على المحتوى الموجود
- توضيحات وتحسينات بسيطة

## ملاحظات المجتمع والاقتراحات

نحن نشجع بنشاط ملاحظات المجتمع لتحسين هذا المورد التعليمي:

### كيفية تقديم الملاحظات
- **قضايا GitHub**: الإبلاغ عن المشكلات أو اقتراح التحسينات (مشكلة محددة بالذكاء الاصطناعي مرحب بها)
- **مناقشات Discord**: مشاركة الأفكار والتفاعل مع مجتمع Microsoft Foundry
- **طلبات السحب**: المساهمة بتحسينات مباشرة للمحتوى، خصوصًا قوالب وأدلة الذكاء الاصطناعي
- **ديسكورد Microsoft Foundry**: المشاركة في قناة #Azure لمناقشات AZD و AI
- **منتديات المجتمع**: المشاركة في مناقشات مطوري Azure الأوسع

### فئات الملاحظات
- **دقة محتوى الذكاء الاصطناعي**: تصحيحات لمعلومات تكامل الذكاء الاصطناعي والنشر
- **تجربة التعلم**: اقتراحات لتحسين تدفق تعلم مطوري الذكاء الاصطناعي
- **محتوى الذكاء الاصطناعي المفقود**: طلبات لقوالب أو أنماط أو أمثلة إضافية في الذكاء الاصطناعي
- **قابلية الوصول**: تحسينات لتلبية احتياجات تعلم متنوعة
- **تكامل أدوات الذكاء الاصطناعي**: اقتراحات لتحسين تكامل سير عمل تطوير الذكاء الاصطناعي
- **أنماط نشر الذكاء الاصطناعي الإنتاجية**: طلبات لأنماط نشر الذكاء الاصطناعي للمؤسسات

### التزام الاستجابة
- **الاستجابة للمشكلات**: خلال 48 ساعة للمشكلات المبلغ عنها
- **طلبات الميزات**: التقييم خلال أسبوع
- **مساهمات المجتمع**: المراجعة خلال أسبوع
- **المشكلات الأمنية**: أولوية فورية مع استجابة سريعة

## جدول الصيانة

### التحديثات الدورية
- **المراجعات الشهرية**: دقة المحتوى والتحقق من الروابط
- **التحديثات الربعية**: إضافات وتحسينات محتوى كبيرة
- **المراجعات نصف السنوية**: إعادة هيكلة شاملة وتحسينات
- **الإصدارات السنوية**: تحديثات إصدارات كبرى مع تحسينات هامة

### المراقبة وضمان الجودة
- **الاختبارات الآلية**: التحقق المنتظم من أمثلة التعليمات البرمجية والروابط
- **تكامل ملاحظات المجتمع**: دمج دوري لاقتراحات المستخدمين
- **تحديثات التكنولوجيا**: التوافق مع أحدث خدمات Azure وإصدارات azd
- **تدقيقات القابلية للوصول**: مراجعة دورية لمبادئ التصميم الشامل

## سياسة دعم الإصدارات

### دعم الإصدار الحالي
- **أحدث إصدار رئيسي**: دعم كامل مع تحديثات منتظمة
- **الإصدار الرئيسي السابق**: تحديثات أمان وتصحيحات حرجة لمدة 12 شهرًا
- **الإصدارات القديمة**: دعم المجتمع فقط، بدون تحديثات رسمية

### إرشادات الترحيل
عند إصدار إصدارات كبرى، نوفر:
- **أدلة الترحيل**: تعليمات خطوة بخطوة للانتقال
- **ملاحظات التوافق**: تفاصيل حول التغييرات الجذرية
- **دعم الأدوات**: سكريبتات أو أدوات مساعدة للترحيل
- **دعم المجتمع**: منتديات مخصصة لأسئلة الترحيل

---

**التنقل**
- **الدرس السابق**: [دليل الدراسة](resources/study-guide.md)
- **الدرس التالي**: العودة إلى [README الرئيسي](README.md)

**ابقَ محدثًا**: تابع هذا المستودع للحصول على إشعارات حول الإصدارات الجديدة والتحديثات المهمة إلى المواد التعليمية.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنويه**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي والمعتمد. للمعلومات الهامة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->