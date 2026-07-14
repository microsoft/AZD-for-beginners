# سجل التغييرات - AZD للمبتدئين

## مقدمة

يسجل هذا السجل جميع التغييرات الملحوظة والتحديثات والتحسينات في مستودع AZD للمبتدئين. نحن نتبع مبادئ الترقيم الدلالي ونحافظ على هذا السجل لمساعدة المستخدمين على فهم ما تغير بين الإصدارات.

## أهداف التعلم

من خلال مراجعة هذا السجل، ستتمكن من:
- البقاء على اطلاع على الميزات الجديدة وإضافات المحتوى
- فهم التحسينات التي أجريت على الوثائق الحالية
- متابعة إصلاحات الأخطاء والتصحيحات لضمان الدقة
- متابعة تطور المواد التعليمية مع مرور الوقت

## نتائج التعلم

بعد مراجعة إدخالات سجل التغييرات، ستتمكن من:
- تحديد المحتوى والموارد الجديدة المتاحة للتعلم
- فهم الأقسام التي تم تحديثها أو تحسينها
- تخطيط مسار التعلم الخاص بك بناءً على أحدث المواد
- تقديم ملاحظات واقتراحات للتحسينات المستقبلية

## تاريخ النسخ

### [v3.23.0] - 2026-07-13

#### تحديث تحديث AZD 1.27.1: تحديث عملة النسخة
**تعيد هذه النسخة التحقق من صحة الدورة مقابل `azd` `1.27.1` (يوليو 2026، آخر إصدار مستقر) وامتداد وكيل الذكاء الاصطناعي الحالي في المعاينة `azure.ai.agents` `1.0.0-beta.5`، مما يجلب كل لافتة "تم التحقق من صحتها مقابل" إلى التاريخ بعد إصدارات 1.26.0 و 1.27.0 و 1.27.1.**

#### التغييرات
- **✅ تحديث خط الأساس للتحقق من الصحة** من `azd 1.25.6` (يونيو 2026) إلى `azd 1.27.1` (يوليو 2026) في الصفحة الرئيسية README، وجميع README للفصول، ودروس الحاويات التطويرية في الفصل 1 (بما في ذلك أمثلة الإصدارات المثبتة)، ودروس قوالب مخصصة في الفصل 4، ودروس الوكلاء المتعددين في الفصل 5، ووثائق ورشة العمل
- **🤖 تحديث خط الأساس للفصل 2** من `azd 1.23.12` (مارس 2026) إلى `azd 1.27.1` عبر `agents.md`، `ai-model-deployment.md`، `ai-workshop-lab.md`، و `microsoft-foundry-integration.md`؛ تم تحديث تواريخ ملاحظات التحقق إلى 2026-07-13
- **🧩 ترقية امتداد الوكيل الذكي** من `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` إلى الإصدار الحالي `1.0.0-beta.5` في README الخاص بالفصل 2 و `agents.md`
- **🧪 تحديث مثال التحقق في ورشة العمل** (مخرجات `azd version`) إلى `1.27.1`

#### ملاحظات على إصدارات azd ذات الصلة (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** دعم Go لـ Azure Functions على استهلاك مرن، مرشحات الاشتراك لكل مستأجر باستخدام `azd config sub-filter`، حزم امتدادات مكتفية ذاتيًا (`azd x pack --bundle`)، و `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** نمذجة مشاريع/وكلاء Azure AI Foundry مباشرة في `azure.yaml` (تهيئة بدون Bicep/بدون Terraform)، دعم نشر الحاويات لخدمة التطبيقات (`host: appservice` + `language: docker`)، خيار المصدر المباشر لـ `azd extension` باستخدام `-s/--source`، و `azd tool uninstall`
- **1.27.1 (2026-07-09):** خيار `--no-dependencies` لـ `azd extension install`، استبعاد النماذج المهجورة من مطالبات الكتالوج/الحصة بشكل افتراضي، وعدة إصلاحات للأخطاء

#### الملفات التي تم تحديثها
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

#### سد فجوة المبتدئين رقم 2: تأليف القوالب، حاويات التطوير، بولومي، Azure DevOps، حسابات الخدمة، وأكثر
**تغلق هذه النسخة الفجوات الوسيطة المتبقية التي كشف عنها تحليل تغطية azd: كيفية تأليف ونشر قالبك الخاص، بيئات الحاويات التطويرية القابلة لإعادة الإنتاج / GitHub Codespaces، مزود البنية التحتية بولومي، شرح سير عمل Azure DevOps CI/CD، المصادقة باستخدام حسابات الخدمة، إرشادات اختيار المضيف (AKS/تطبيقات Spring)، شروحات `azd restore` / `azd package`، معالجة أخطاء الخطافات، وممارسات فريق / بيئة مشتركة.**

#### الإضافات
- **🧱 درس جديد في الفصل 4** `docs/chapter-04-infrastructure/custom-templates.md` — تأليف قالب azd الخاص بك: الهيكل المطلوب (`azure.yaml`، `infra/`، `src/`)، حقل `metadata.template`، معلمة البنية التحتية باستخدام رمز المورد `uniqueString()` وعلامة `azd-env-name`، الاختبار محليًا باستخدام `azd init --template <local-path>`، النشر إلى GitHub، والتقديم إلى معرض Awesome AZD
- **📦 درس جديد في الفصل 1** `docs/chapter-01-foundation/dev-containers.md` — بيئات azd القابلة لإعادة الإنتاج باستخدام حاويات التطوير وGitHub Codespaces: ملف `.devcontainer/devcontainer.json` بسيط باستخدام ميزة `ghcr.io/azure/azure-dev/azd` الرسمية، الميزات الخاصة باللغات، `docker-in-docker` لمضيفي الحاويات، وتسجيل الدخول عن بعد باستخدام `azd auth login --use-device-code`
- **🧩 بولومي مع azd** في `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`، تخطيط مجلد بولومي، المجموعات المربوطة ببيئات azd، المخرجات اللازمة / الوسم، وسير عمل `azd up` / `azd down` المتطابق
- **🎯 إرشادات اختيار المضيف** في `docs/chapter-04-infrastructure/provisioning.md` — مقارنة سهلة للمبتدئين بين `appservice`، `staticwebapp`، `function`، `containerapp`، `aks`، و `springapp`، مع إرشادات حول موعد اختيار AKS أو Azure Spring Apps
- **🛠️ شرح سير العمل Azure DevOps CI/CD** في `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`، اتصال الخدمة مع اتحاد هوية عبء العمل (OIDC)، ملف `azure-dev.yml` المنتج، وإعداد مجموعة المتغيرات
- **🔑 حسابات الخدمة (النمط 4)** أُضيف إلى `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`، `azd auth login` بدون تفاعل مع سر العميل مقابل بيانات اعتماد موحدة / OIDC، مواعيد الاستخدام، وتخزين بيانات الاعتماد بطريقة آمنة
- **🪝 معالجة أخطاء الخطافات** فرعية في `docs/chapter-04-infrastructure/deployment-guide.md` — رموز الخروج و `set -e`، `continueOnError`، اختبار الخطافات بمفردها باستخدام `azd hooks run`، أصداف مخصصة لأنظمة التشغيل، وخيار `--debug`
- **👥 فرق / بيئات مشتركة** قسم في `docs/chapter-03-configuration/configuration.md` — محتويات `.azure/`، ما يجب تجاهله في git، بيئات لكل مطور، أوامر `azd env list`/`select`، وتوفير قيم البيئة في CI/CD
- **🧰 شروحات `azd restore` و `azd package` الموسعة** في `resources/cheat-sheet.md` — استعادة التبعيات وبناء قطعة قابلة للنشر بدون تنفيذ النشر

#### التغييرات
- **🧭 تحديث جدول دروس الفصل 4** ليشمل درس "تأليف قالبك الخاص" الجديد (الدرس 3)
- **🧭 تحديث جدول دروس الفصل 1** ليشمل درس "حاويات التطوير وCodespaces" الجديد (الدرس 5)؛ أرفق تذييلات التنقل بين `bring-your-own-app.md` و `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### سد فجوة المبتدئين: درس عملي للوكلاء المتعددين، "أحضر تطبيقك الخاص"، Terraform، وشرح CI/CD
**تغلق هذه النسخة أكبر الفجوات لدليل المبتدئين الكامل بإضافة درسين عمليين جديدين (شرح قابل للنشر لوكيلين متعددين وإضافة azd إلى تطبيق موجود)، مقدمة ودية عن الخطافات، قسم Terraform مع azd، شرح خطوة بخطوة لمسار GitHub Actions، شرح للامتدادات الجديدة في المعاينة، وقائمة تحقق صريحة للتحقق من النشر.**

#### الإضافات
- **🤝 درس جديد في الفصل 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — شرح عملي كامل قابل للنشر لوكيلين (المنسق + المتخصصون) باستخدام قالب حقيقي (`contoso-creative-writer`)، يغطي متى وكيفية استخدام الوكلاء المتعددين، سير عمل `azd up`، فهم الموارد المنشورة، تتبع بين الوكلاء، التخصيص، والتنظيف
- **📦 درس جديد في الفصل 1** `docs/chapter-01-foundation/bring-your-own-app.md` — كيفية إضافة azd إلى مشروع قائم باستخدام `azd init` ("استخدام الكود في الدليل الحالي")، فهم `azure.yaml` و `infra/`، توليد الأوامر `azd infra generate`، اكتشاف المضيف، والنشر باستخدام `azd up`
- **🌐 قسم Terraform مع azd** أُضيف إلى `docs/chapter-04-infrastructure/provisioning.md` — تكوين `infra.provider: terraform`، تنظيم مجلد `.tf`، المخرجات المطلوبة `AZURE_*` ووسم `azd-env-name`، وسير عمل `azd up` / `azd down` المتطابق (يغلق الفجوة حيث اُدعي دعم Terraform ولكن تم عرض Bicep فقط)
- **⚙️ شرح خطوة بخطوة لمسار GitHub Actions** في `docs/chapter-08-production/production-ai-practices.md` — من مستودع GitHub إلى النشر الآلي: `azd pipeline config`، بيانات اعتماد الاتحاد OIDC (بدون أسرار مخزنة)، ملف `azure-dev.yml` المنتج، وإرشادات الاختلاف بين الأسرار والمتغيرات
- **🪝 مقدمة ودية للمبتدئين "جديد على الخطافات؟"** في `docs/chapter-04-infrastructure/deployment-guide.md` — ما هو الخطاف، جدول مراحل الخطافات، أبسط خطاف أول، وتشغيل الخطافات يدويًا باستخدام `azd hooks run`
- **✅ أُضيفت قائمة تحقق "تحقق من نشر التطبيق"** إلى الخطوة 5 في `docs/chapter-01-foundation/first-project.md` — اختبار الدخان، التحقق من نقطة النهاية الصحية، ومعايير النجاح الواضحة
- **🧩 شرح تمديدات المعاينة الجديدة** `azure.ai.skills` و `azure.ai.connections` (ماهيتها ومتى تستخدم) في `docs/chapter-08-production/production-ai-practices.md`

#### التغييرات
- **🧭 تصحيح جدول دروس الفصل 5**: `multi-agent-basics.md` الآن هو الدرس 1 (الدرس العملي الوحيد بالكامل)، مع تسمية واضحة أن الدرس 2 في الفصل 6 وأن سيناريو تجارة التجزئة هو مخطط هندسي، ليس قالبًا بأمر واحد
- **🧭 جدول دروس الفصل 1** يشمل الآن درس "أحضر تطبيقك الخاص" الجديد (الدرس 4)
- **🔗 تحديث تذييلات التنقل**: `first-project.md` يرتبط الآن بصفحة `bring-your-own-app.md`

#### تم الإصلاح
- **🧱 إغلاق الفجوة المعلنة ولكن الغائبة لـ Terraform** — الدورة كانت تشير سابقًا إلى دعم Terraform دون عرضه فعليًا
- **🔀 تصحيح الروابط المتقاطعة المضللة في الفصل 5** التي أشارت بشكل خاطئ إلى وجود تنفيذ كامل لوكلاء متعددين حينما كان المخطط مجرد مخطط معماري

#### الملفات التي تم تحديثها
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

#### تحديث AZD 1.25.6، أوامر دورة حياة الوكيل الكاملة، وإعادة تسمية Aspire

**تعيد هذه النسخة تحقق دورة المقرر مقابل `azd` `1.25.6` (يونيو 2026) وامتداد `azure.ai.agents` `0.1.40-preview`، وتمدد إرشادات الذكاء الاصطناعي من "هيكلة وكيل" إلى دورة حياة الوكيل الكاملة (اختبار → تقييم → تحسين → فحص → حذف)، وتبرز امتدادات المعاينة الجديدة `azure.ai.skills` و `azure.ai.connections`، وتلاحظ إعادة تسمية منتج ".NET Aspire" إلى "Aspire".**

#### تمت الإضافة
- **🔁 تغطية دورة حياة الوكيل الكاملة** للمبتدئين ومهندسي الذكاء الاصطناعي في جميع الوثائق:
  - `docs/chapter-01-foundation/azd-basics.md` — تمت إضافة جدول دورة الحياة (هيكلة → اختبار → قياس → تحسين → فحص → تنظيف) إلى قسم الامتدادات وأوامر الذكاء الاصطناعي
  - `docs/chapter-08-production/production-ai-practices.md` — قسم جديد "إدارة دورة حياة الوكيل" يغطي `azd ai agent invoke`، `endpoint show`، `eval generate`، `optimize`، `code download`، و `delete --force`
  - `resources/cheat-sheet.md` — توسيع أوامر وكيل الذكاء الاصطناعي مع `invoke`، `endpoint show`، `eval generate`، `optimize`، `code download`، و `delete --force`
- **🧩 تم توثيق امتدادات معاينة جديدة**: تمت إضافة `azure.ai.skills` (مهارات الوكيل القابلة لإعادة الاستخدام) و `azure.ai.connections` (اتصالات Foundry) إلى جدول الامتدادات وورقة الخداع
- **⏱️ إرشادات توقيت الاستجابة** — توضح أمثلة `azd ai agent invoke` الآن أنها تعرض إجمالي الكمون والوقت حتى أول بايت
- **📌 لافتة الإصدار** في ملف README الجذري توجه المتعلمين إلى `azd version` و `azd upgrade`

#### تم التغيير
- **✅ تحديث خط الأساس للتحقق** من `azd 1.23.12` (مارس 2026) إلى `azd 1.25.6` (يونيو 2026) عبر جميع ملفات README للفصول ووثائق الورشة
- **🤖 تحديث ملاحظة امتداد الفصل 2** من `azure.ai.agents` `0.1.18-preview` إلى `0.1.40-preview`
- **🧪 تحديث مثال تحقق الورشة** (مخرج `azd version`) إلى `1.25.6`
- **🧭 تحديث README "ما الجديد في azd اليوم"** لتسليط الضوء على دورة حياة الوكيل الشاملة، والامتدادات الجديدة للذكاء الاصطناعي، والتحسينات الأخيرة لجودة الحياة (`azd init` التكرار، تنظيف رمز المرور المنتهي في `azd auth login`، مطالبة التشغيل الأولى لـ `azd tool`)
- **📖 يوجه ملف agents.md في الفصل 2 (الخيار 4) الآن المتعلمين إلى أوامر دورة الحياة بعد النشر بدلاً من التوقف عند `azd up`**

#### تم الإصلاح
- **🏷️ تسمية المنتج** — إضافة ملاحظة إعادة تسمية Aspire (".NET Aspire" أصبح ببساطة "Aspire")؛ دعم azd لـ Aspire لم يتغير
- **🔎 تحقق الإصدار الحي** تم تأكيده مقابل تغذية إصدار Azure Developer CLI: CLI المستقر `1.25.6` (2026-06-12) و `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### الملفات التي تم تحديثها
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

#### توضيح توجيهات المبتدئين، تحقق الإعداد، وتنظيف أوامر AZD النهائية
**تتبع هذه النسخة فحص تحقق AZD 1.23 مع جولة توثيق موجهة للمبتدئين: توضح إرشادات المصادقة على AZD أولاً، تضيف سكريبتات تحقق إعداد محلي، تتحقق من الأوامر الأساسية مقابل CLI لـ AZD الحي، وتزيل آخر مراجع أوامر مصدرها الإنجليزية غير المحدثة خارج سجل التغييرات.**

#### تمت الإضافة
- **🧪 سكريبتات تحقق إعداد المبتدئين** باستخدام `validate-setup.ps1` و `validate-setup.sh` ليتمكن المتعلمون من تأكيد الأدوات المطلوبة قبل بدء الفصل 1
- **✅ خطوات تحقق الإعداد المسبقة** في README الجذري وREADME الفصل 1 لضمان القبض على المتطلبات المفقودة قبل `azd up`

#### تم التغيير
- **🔐 إرشادات مصادقة المبتدئين** تعالج الآن بشكل متسق `azd auth login` كمسار رئيسي لسير عمل AZD، مع الإشارة إلى `az login` كاختياري ما لم تُستخدم أوامر Azure CLI مباشرة
- **📚 تدفق الالتحاق في الفصل 1** يوجه المتعلمين الآن للتحقق من إعدادهم المحلي قبل خطوات التثبيت، المصادقة، والنشر الأولى
- **🛠️ رسائل المدقق** تفصل الآن بوضوح بين المتطلبات الإلزامية وتحذيرات Azure CLI الاختيارية لمسار المبتدئين الخاص بـ AZD فقط
- **📖 وثائق التهيئة، استكشاف الأخطاء، والأمثلة** تميز الآن بين مصادقة AZD المطلوبة وتسجيل الدخول الاختياري لـ Azure CLI حيثما قُدما سابقًا دون سياق

#### تم الإصلاح
- **📋 تحديث بقية مراجع أوامر مصدرها الإنجليزية** إلى صيغة AZD الحالية، بما في ذلك `azd config show` في ورقة الخداع و `azd monitor --overview` حيث كان المقصود إرشاد نظرة عامة على بوابة Azure
- **🧭 تخفيف مطالب المبتدئين في الفصل 1** لتجنب الوعد بسلوك خالي من الأخطاء مضمون أو السحب العكسي عبر كل القوالب وموارد Azure
- **🔎 تحقق CLI حي** أكد دعم الأوامر الحالية `azd env get-values`، `azd template list`، `azd extension list --installed`، `azd copilot consent list`، `azd mcp start`، `azd provision --preview`، `azd monitor --logs`، و `azd down --force --purge`

#### الملفات التي تم تحديثها
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

#### تحقق AZD 1.23.12، توسيع بيئة الورشة، وتحديث نموذج الذكاء الاصطناعي
**تجري هذه النسخة فحص تحقق التوثيق مقابل `azd` `1.23.12`، تحدث أمثلة أوامر AZD القديمة، تحدث إرشادات نموذج الذكاء الاصطناعي إلى الإعدادات الافتراضية الحالية، وتوسع تعليمات الورشة لتشمل أيضًا حاويات التطوير والنسخ المحلية إلى جانب GitHub Codespaces.**

#### تمت الإضافة
- **✅ ملاحظات تحقق عبر الفصول الأساسية ووثائق الورشة** لجعل خط الأساس لـ AZD المختبرة صريحًا للمتعلمين باستخدام إصدارات CLI أحدث أو أقدم
- **⏱️ إرشادات مهلة النشر** لنشر تطبيقات الذكاء الاصطناعي طويلة الأمد باستخدام `azd deploy --timeout 1800`
- **🔎 خطوات فحص الامتدادات** مع `azd extension show azure.ai.agents` في وثائق سير عمل الذكاء الاصطناعي
- **🌐 إرشادات بيئة الورشة الموسعة** تغطي GitHub Codespaces، حاويات التطوير، والنسخ المحلية مع MkDocs

#### تم التغيير
- **📚 مداخل README للفصول** الآن توضح التحقق مقابل `azd 1.23.12` عبر قسم الأساس، التهيئة، البنية التحتية، متعددة الوكلاء، ما قبل النشر، استكشاف الأخطاء، والإنتاج
- **🛠️ تحديث مراجع أوامر AZD** إلى الصيغ الحالية في الوثائق:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` أو `azd env get-value(s)` حسب السياق
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` حيث يُراد نظرة عامة لتطبيق Insights
- **🧪 تبسيط أمثلة المعاينة للإعداد** إلى الاستخدام المدعوم الحالي مثل `azd provision --preview` و `azd provision --preview -e production`
- **🧭 تحديث سير الورشة** لتمكين المتعلمين من إكمال المختبرات في Codespaces، حاوية تطوير، أو نسخة محلية بدلاً من الافتراض بالتنفيذ الحصري في Codespaces
- **🔐 تحديث إرشادات المصادقة** لتفضيل `azd auth login` لسير عمل AZD، مع وضع `az login` كاختياري عند استخدام أوامر Azure CLI مباشرة

#### تم الإصلاح
- **🪟 توحيد أوامر تثبيت ويندوز** إلى تهجئة الحزمة الحالية `winget` في دليل التثبيت
- **🐧 تصحيح إرشادات تثبيت لينكس** لتجنب تعليمات مدير حزم `azd` الخاصة بالتوزيعة غير المدعومة، والاستعاضة بتوجيه إلى أصول الإصدار حيث ينطبق
- **📦 تحديث أمثلة نماذج الذكاء الاصطناعي** من الإعدادات الافتراضية الأقدم مثل `gpt-35-turbo` و `text-embedding-ada-002` إلى الأمثلة الحالية مثل `gpt-4.1-mini`، `gpt-4.1`، و `text-embedding-3-large`
- **📋 تصحيح مقتطفات النشر والتشخيص** لاستخدام أوامر البيئة والحالة الحالية في السجلات، السكريبتات، وخطوات استكشاف الأخطاء
- **⚙️ تحديث إرشادات GitHub Actions** من `Azure/setup-azd@v1.0.0` إلى `Azure/setup-azd@v2`
- **🤖 تحديث إرشادات موافقة MCP/Copilot** من `azd mcp consent` إلى `azd copilot consent list`

#### تحسينات
- **🧠 تحسين إرشادات فصل الذكاء الاصطناعي** لتفسير أفضل لسلوك `azd ai` الحساس للمعاينة، تسجيل الدخول الخاص بالمستأجر، استخدام الامتداد الحالي، وتوصيات النشر المحدثة للنماذج
- **🧪 تحديث تعليمات الورشة** باستخدام أمثلة إصدارات أكثر واقعية ولغة إعداد بيئة أوضح لمختبرات عملية
- **📈 تنسيق أفضل لوثائق الإنتاج واستكشاف الأخطاء** مع مراقبة حالية، النموذج الاحتياطي، وأمثلة طبقة التكلفة

#### الملفات التي تم تحديثها
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

#### أوامر AZD AI CLI، تحقق المحتوى، وتوسيع القالب
**تضيف هذه النسخة تغطية أوامر `azd ai`، `azd extension`، و `azd mcp` عبر جميع الفصول المتعلقة بالذكاء الاصطناعي، تصلح الروابط المعطلة والتعليمات البرمجية المهجورة في agents.md، تحدث ورقة الخداع، وتعيد هيكلة قسم قوالب الأمثلة مع أوصاف مثبتة وقوالب Azure AI AZD جديدة.**

#### تمت الإضافة
- **🤖 تغطية أوامر AZD AI CLI** عبر 7 ملفات (سابقًا فقط في الفصل 8):
  - `docs/chapter-01-foundation/azd-basics.md` — قسم جديد "الامتدادات وأوامر الذكاء الاصطناعي" يعرض `azd extension`، `azd ai agent init`، و `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — الخيار 4: `azd ai agent init` مع جدول مقارنة (نموذج مقابل نهج البيان)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — الأقسام الفرعية "امتدادات AZD لـ Foundry" و "نشر الوكيل أولاً"

  - `docs/chapter-05-multi-agent/README.md` — البدء السريع يعرض الآن مسارات النشر القائمة على القالب والقائمة على البيان
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — قسم النشر يتضمن الآن خيار `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — القسم الفرعي "أوامر امتداد AZD AI للتشخيص"
  - `resources/cheat-sheet.md` — قسم جديد "أوامر AI والامتدادات" مع `azd extension`, `azd ai agent init`, `azd mcp`, و `azd infra generate`
- **📦 قوالب جديدة لأمثلة AZD AI** في `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — دردشة RAG .NET مع Blazor WebAssembly، Semantic Kernel، ودعم الدردشة الصوتية
  - **azure-search-openai-demo-java** — دردشة RAG جافا باستخدام Langchain4J مع خيارات نشر ACA/AKS
  - **contoso-creative-writer** — تطبيق متعدد الوكلاء للكتابة الإبداعية باستخدام خدمة Azure AI Agent، Bing Grounding، و Prompty
  - **serverless-chat-langchainjs** — RAG بدون خادم باستخدام Azure Functions + LangChain.js + Cosmos DB مع دعم تطوير محلي Ollama
  - **chat-with-your-data-solution-accelerator** — مسرع RAG للمؤسسات مع بوابة الإدارة، دمج Teams، وخيارات PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — تطبيق مرجعي لتنسيق MCP متعدد الوكلاء مع خوادم في .NET، Python، Java، و TypeScript
  - **azd-ai-starter** — قالب بداية بسيط للبنية التحتية Azure AI باستخدام Bicep
  - **🔗 رابط معرض رائع لـ AZD AI** — إشارة إلى [معرض رائع لـ azd AI](https://azure.github.io/awesome-azd/?tags=ai) (أكثر من 80 قالب)

#### تم الإصلاح
- **🔗 التنقل في agents.md**: الروابط السابقة/التالية تطابق الآن ترتيب دروس ملف README في الفصل 2 (تكامل Microsoft Foundry → وكلاء → نشر نموذج AI)
- **🔗 الروابط المكسورة في agents.md**: تم تصحيح `production-ai-practices.md` إلى `../chapter-08-production/production-ai-practices.md` (3 مرات)
- **📦 برمجيات deprecated في agents.md**: استبدال `opencensus` بـ `azure-monitor-opentelemetry` + مجموعة أدوات OpenTelemetry SDK
- **🐛 API غير صالح في agents.md**: تم نقل `max_tokens` من `create_agent()` إلى `create_run()` كـ `max_completion_tokens`
- **🔢 عد الرموز في agents.md**: استبدال التقدير التقريبي `len//4` بـ `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: تصحيح الخدمات من "البحث الإدراكي + خدمة التطبيقات" إلى "بحث Azure AI + تطبيقات الحاوية Azure" (المضيف الافتراضي تغير في أكتوبر 2024)
- **contoso-chat**: تحديث الوصف للإشارة إلى Azure AI Foundry + Prompty، متوافق مع عنوان ومستوى التقنية في المستودع

#### تمت الإزالة
- **ai-document-processing**: تم إزالة الإشارة إلى قالب غير وظيفي (المستودع غير متاح للعامة كقالب AZD)

#### تم التحسين
- **📝 تمرينات agents.md**: التمرين 1 يعرض الآن الإخراج المتوقع وخطوة `azd monitor`; التمرين 2 يشمل كود تسجيل كامل لـ `FunctionTool`; التمرين 3 يستبدل الإرشادات العامة بأوامر محددة `prepdocs.py`
- **📚 موارد agents.md**: تحديث روابط التوثيق إلى وثائق خدمة Azure AI Agent الحالية والبدء السريع
- **📋 جدول الخطوات التالية في agents.md**: إضافة رابط ورشة عمل AI لتغطية كاملة للفصل

#### الملفات المحدثة
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### تحسين الملاحة في المساق
**يحسن هذا الإصدار التنقل في README.md للفصول باستخدام صيغة جدول محسنة.**

#### تم التغيير
- **جدول خريطة المساق**: تم تحسينه بروابط دروس مباشرة، تقديرات المدة، وتصنيفات التعقيد
- **تنظيف المجلدات**: إزالة المجلدات القديمة المتكررة (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **التحقق من الروابط**: تم التحقق من جميع الروابط الداخلية الـ 21+ في جدول خريطة المساق

### [v3.16.0] - 2026-02-05

#### تحديث أسماء المنتج
**يقوم هذا الإصدار بتحديث إشارات المنتج إلى العلامة التجارية الحالية لمايكروسوفت.**

#### تم التغيير
- **Microsoft Foundry → Microsoft Foundry**: تحديث جميع الإشارات عبر الملفات غير الخاصة بالترجمة
- **خدمة Azure AI Agent → وكلاء Foundry**: تحديث اسم الخدمة ليعكس العلامة التجارية الحالية

#### الملفات المحدثة
- `README.md` - الصفحة الرئيسية للمساق
- `changelog.md` - سجل الإصدارات
- `course-outline.md` - هيكل المساق
- `docs/chapter-02-ai-development/agents.md` - دليل وكلاء AI
- `examples/README.md` - توثيق الأمثلة
- `workshop/README.md` - صفحة البداية لورشة العمل
- `workshop/docs/index.md` - فهرس ورشة العمل
- `workshop/docs/instructions/*.md` - جميع ملفات التعليمات الخاصة بورشة العمل

---

### [v3.15.0] - 2026-02-05

#### إعادة هيكلة كبيرة في المستودع: أسماء المجلدات حسب الفصول
**يعيد هذا الإصدار هيكلة التوثيق إلى مجلدات مخصصة لكل فصل من أجل تنقل أوضح.**

#### إعادة تسمية المجلدات
تم استبدال المجلدات القديمة بمجلدات مسماة حسب أرقام الفصول:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- تمت الإضافة الجديدة: `docs/chapter-05-multi-agent/`

#### هجرات الملفات
| ملف | من | إلى |
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
| All pre-deployment files | pre-deployment/ | chapter-06-pre-deployment/ |
| All troubleshooting files | troubleshooting/ | chapter-07-troubleshooting/ |

#### تمت الإضافة
- **📚 ملفات README للفصول**: تم إنشاء README.md في كل مجلد فصل مع:
  - أهداف التعلم والمدة
  - جدول الدروس مع الأوصاف
  - أوامر البدء السريع
  - التنقل إلى الفصول الأخرى

#### تم التغيير
- **🔗 تحديث جميع الروابط الداخلية**: تم تحديث أكثر من 78 مسارًا عبر جميع ملفات التوثيق
- **🗺️ الملف الرئيسي README.md**: تحديث خريطة الدورة مع هيكل جديد للفصول
- **📝 examples/README.md**: تحديث المراجع المتقاطعة إلى مجلدات الفصول

#### تم الإزالة
- هيكل المجلد القديم (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### إعادة هيكلة المستودع: التنقل بين الفصول
**هذه النسخة أضافت ملفات README للتنقل في الفصول (تم تجاوزها بواسطة v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### دليل وكلاء الذكاء الاصطناعي الجديد
**تضيف هذه النسخة دليلاً شاملاً لنشر وكلاء الذكاء الاصطناعي باستخدام Azure Developer CLI.**

#### تمت الإضافة
- **🤖 docs/microsoft-foundry/agents.md**: دليل كامل يغطي:
  - ما هي وكلاء الذكاء الاصطناعي وكيف يختلفون عن الدردشة الآلية
  - ثلاثة قوالب بدء سريعة للوكلاء (Foundry Agents, Prompty, RAG)
  - أنماط هندسة الوكلاء (وكيل واحد، RAG، متعدد الوكلاء)
  - تكوين الأدوات والتخصيص
  - المراقبة وتتبع المقاييس
  - اعتبارات التكلفة والتحسين
  - سيناريوهات متكررة لحل المشاكل
  - ثلاث تمارين عملية مع معايير النجاح

#### هيكل المحتوى
- **مقدمة**: مفاهيم الوكيل للمبتدئين
- **بدء سريع**: نشر الوكلاء باستخدام `azd init --template get-started-with-ai-agents`
- **أنماط الهندسة**: مخططات بصرية لأنماط الوكلاء
- **التكوين**: إعداد الأدوات والمتغيرات البيئية
- **المراقبة**: دمج Application Insights
- **التمارين**: تعلم عملي متدرج (20-45 دقيقة لكل منها)

---

### [v3.12.0] - 2026-02-05

#### تحديث بيئة DevContainer
**تُحدّث هذه النسخة تركيب حاوية التطوير مع أدوات حديثة وإعدادات أفضل لتجربة تعلم AZD.**

#### تم التغيير
- **🐳 صورة الأساس**: تم التحديث من `python:3.12-bullseye` إلى `python:3.12-bookworm` (أحدث إصدار مستقر من دبيان)
- **📛 اسم الحاوية**: تم تغيير الاسم من "Python 3" إلى "AZD للمبتدئين" للوضوح

#### تمت الإضافة
- **🔧 ميزات جديدة في حاوية التطوير**:
  - `azure-cli` مع دعم Bicep مُفعّل
  - `node:20` (نسخة LTS لقوالب AZD)
  - `github-cli` لإدارة القوالب
  - `docker-in-docker` لنشر تطبيقات الحاوية

- **🔌 إعادة توجيه المنافذ**: منافذ مهيأة مسبقًا للتطوير الشائع:
  - 8000 (معاينة MkDocs)
  - 3000 (تطبيقات الويب)
  - 5000 (Python Flask)
  - 8080 (واجهات برمجة التطبيقات APIs)

- **🧩 إضافات VS Code الجديدة**:
  - `ms-python.vscode-pylance` - تحسين IntelliSense للغة Python
  - `ms-azuretools.vscode-azurefunctions` - دعم Azure Functions
  - `ms-azuretools.vscode-docker` - دعم Docker
  - `ms-azuretools.vscode-bicep` - دعم لغة Bicep
  - `ms-azure-devtools.azure-resource-groups` - إدارة موارد Azure
  - `yzhang.markdown-all-in-one` - تحرير ملفات Markdown
  - `DavidAnson.vscode-markdownlint` - تدقيق Markdown
  - `bierner.markdown-mermaid` - دعم مخططات Mermaid
  - `redhat.vscode-yaml` - دعم YAML (لـ azure.yaml)
  - `eamodio.gitlens` - عرض تاريخ Git
  - `mhutchie.git-graph` - تاريخ Git بصري

- **⚙️ إعدادات VS Code**: إضافة إعدادات افتراضية لمفسر Python، التنسيق عند الحفظ، وقص الفراغات

- **📦 تحديث requirements-dev.txt**:
  - إضافة ملحق تصغير MkDocs
  - إضافة pre-commit لجودة الكود
  - إضافة حزم Azure SDK (azure-identity، azure-mgmt-resource)

#### تم الإصلاح
- **أمر ما بعد الإنشاء**: الآن يتحقق من تثبيت AZD وAzure CLI عند بدء الحاوية

---

### [v3.11.0] - 2026-02-05

#### إعادة تصميم README للمبتدئين
**تحسن هذه النسخة بشكل كبير README.md ليصبح أكثر سهولة للمبتدئين ويضيف موارد أساسية لمطوري الذكاء الاصطناعي.**

#### تمت الإضافة
- **🆚 مقارنة Azure CLI مع AZD**: شرح واضح متى تستخدم كل أداة مع أمثلة عملية
- **🌟 روابط رائعة لـ AZD**: روابط مباشرة إلى معرض قوالب المجتمع وموارد المساهمة:
  - [معرض Awesome AZD](https://azure.github.io/awesome-azd/) - أكثر من 200 قالب جاهز للنشر
  - [إرسال قالب](https://github.com/Azure/awesome-azd/issues) - مساهمة المجتمع
- **🎯 دليل البدء السريع**: قسم تبسيطي من 3 خطوات للبدء (التثبيت → تسجيل الدخول → النشر)
- **📊 جدول التنقل بناءً على الخبرة**: إرشادات واضحة أين تبدأ بناء على خبرة المطور

#### تم التغيير
- **هيكل README**: إعادة تنظيم للكشف التدريجي - المعلومات الأساسية أولاً
- **قسم المقدمة**: إعادة كتابة لشرح "سحر `azd up`" للمبتدئين التام
- **حذف المحتوى المكرر**: إزالة قسم حل المشاكل المكرر

- **أوامر استكشاف الأخطاء وإصلاحها**: تم تصحيح إشارة `azd logs` لاستخدام الأمر الصحيح `azd monitor --logs`

#### تم الإصلاح

- **🔐 أوامر المصادقة**: تمت إضافة `azd auth login` و `azd auth logout` إلى cheat-sheet.md
- **إشارات الأمر غير الصحيحة**: تمت إزالة كل ما تبقى من `azd logs` من قسم استكشاف الأخطاء وإصلاحها في README

#### ملاحظات
- **النطاق**: تم تطبيق التغييرات على README.md الرئيسي وresources/cheat-sheet.md
- **الجمهور المستهدف**: تحسينات موجهة خصيصًا للمطورين الجدد على AZD

---

### [v3.10.0] - 2026-02-05

#### تحديث دقة أوامر Azure Developer CLI
**هذا الإصدار يصحح أوامر AZD غير الموجودة في جميع أنحاء الوثائق، مما يضمن أن جميع أمثلة الكود تستخدم صيغة صحيحة لـ Azure Developer CLI.**

#### تم الإصلاح
- **🔧 إزالة أوامر AZD غير الموجودة**: تدقيق وتصحيح شامل للأوامر غير الصحيحة:
  - `azd logs` (غير موجود) → استبدل بـ `azd monitor --logs` أو بدائل Azure CLI
  - أوامر فرعية لـ `azd service` (غير موجودة) → استبدلت بـ `azd show` وAzure CLI
  - `azd infra import/export/validate` (غير موجودة) → أزيلت أو استبدلت ببدائل صحيحة
  - أعلام `azd deploy --rollback/--incremental/--parallel/--detect-changes` (غير موجودة) → أزيلت
  - أعلام `azd provision --what-if/--rollback` (غير موجودة) → تم تحديثها لاستخدام `--preview`
  - `azd config validate` (غير موجود) → استبدل بـ `azd config list`
  - `azd info`، `azd history`، `azd metrics` (غير موجودة) → أزيلت

- **📚 الملفات المحدثة بتصحيحات الأوامر**:
  - `resources/cheat-sheet.md`: مراجعة شاملة لمرجع الأوامر
  - `docs/deployment/deployment-guide.md`: إصلاح استراتيجيات التراجع والنشر
  - `docs/troubleshooting/debugging.md`: تصحيح أقسام تحليل السجلات
  - `docs/troubleshooting/common-issues.md`: تحديث أوامر استكشاف الأخطاء الشائعة
  - `docs/troubleshooting/ai-troubleshooting.md`: تصحيح قسم تصحيح AZD
  - `docs/getting-started/azd-basics.md`: تصحيح أوامر المراقبة
  - `docs/getting-started/first-project.md`: تحديث أمثلة المراقبة والتصحيح
  - `docs/getting-started/installation.md`: تصحيح أمثلة المساعدة والإصدار
  - `docs/pre-deployment/application-insights.md`: تصحيح أوامر عرض السجلات
  - `docs/pre-deployment/coordination-patterns.md`: تصحيح أوامر تصحيح وكيل

- **📝 تحديث مرجع الإصدار**: 
  - `docs/getting-started/installation.md`: تم تغيير الإصدار المحدد `1.5.0` إلى `1.x.x` عام مع رابط للإصدارات

#### تغييرات
- **استراتيجيات التراجع**: تحديث الوثائق لاستخدام التراجع المستند إلى Git (AZD لا يحتوي على تراجع مدمج)
- **عرض السجلات**: استبدال إشارات `azd logs` بـ `azd monitor --logs` و `azd monitor --live` وأوامر Azure CLI
- **قسم الأداء**: إزالة أعلام النشر المتوازي/التزايدي غير الموجودة، وتقديم بدائل صحيحة

#### تفاصيل فنية
- **أوامر AZD الصحيحة**: `init`، `up`، `auth`، `deploy`، `down`، `provision`، `publish`، `completion`، `config`، `env`، `show`، `version`، `monitor`
- **أعلام azd monitor الصحيحة**: `--live`، `--logs`، `--overview`
- **الميزات المحذوفة**: `azd logs`، `azd service`، `azd infra import/export/validate`، `azd history`، `azd metrics`، `azd info`، `azd config validate`

#### ملاحظات
- **التحقق**: تم التحقق من الأوامر مقابل Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### إكمال الورشة وتحديث جودة الوثائق
**يكمل هذا الإصدار وحدات الورشة التفاعلية، يصحح جميع روابط الوثائق المعطوبة، ويحسن جودة المحتوى الإجمالية لمطوري الذكاء الاصطناعي باستخدام Microsoft AZD.**

#### تمّت الإضافة
- **📝 CONTRIBUTING.md**: وثيقة إرشادات مساهمة جديدة تشمل:
  - تعليمات واضحة للإبلاغ عن المشاكل واقتراح التغييرات
  - معايير توثيق للمحتوى الجديد
  - إرشادات لأمثلة الكود واعتمادات رسائل الالتزام
  - معلومات عن تفاعل المجتمع

#### مكتمل
- **🎯 وحدة ورشة العمل 7 (التلخيص)**: وحدة التلخيص مكتملة بالكامل مع:
  - ملخص شامل لإنجازات الورشة
  - قسم المفاهيم الرئيسية التي تم إتقانها مثل AZD والقوالب وMicrosoft Foundry
  - توصيات لاستمرار رحلة التعلم
  - تمارين تحدي الورشة مع تقييمات الصعوبة
  - روابط ملاحظات المجتمع والدعم

- **📚 وحدة ورشة العمل 3 (التفكيك)**: تحديث أهداف التعلم مع:
  - تفعيل GitHub Copilot مع خوادم MCP
  - فهم هيكل مجلد قوالب AZD
  - أنماط تنظيم البنية التحتية كرمز (Bicep)
  - تعليمات المختبر العملي

- **🔧 وحدة ورشة العمل 6 (التفكيك)**: مكتملة مع:
  - أهداف تنظيف الموارد وإدارة التكاليف
  - استخدام `azd down` لفك البنية التحتية بأمان
  - إرشادات استرداد الخدمات الإدراكية التي تم حذفها بشكل ناعم
  - مطالبات استكشاف إضافية لـ GitHub Copilot وAzure Portal

#### تم الإصلاح
- **🔗 إصلاح الروابط المعطوبة**: تم حل أكثر من 15 رابط داخلي معطوب في الوثائق:
  - `docs/ai-foundry/ai-model-deployment.md`: تم تصحيح المسارات إلى microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: تصحيح مسارات ai-model-deployment.md وproduction-ai-practices.md
  - `docs/getting-started/first-project.md`: استبدال cicd-integration.md غير الموجودة بـ deployment-guide.md
  - `examples/retail-scenario.md`: تصحيح مسارات الأسئلة الشائعة ودليل استكشاف الأخطاء وإصلاحها
  - `examples/container-app/microservices/README.md`: تصحيح مسارات الصفحة الرئيسية للدورة ودليل النشر
  - `resources/faq.md` و `resources/glossary.md`: تحديث إشارات فصل الذكاء الاصطناعي
  - `course-outline.md`: تصحيح دليل المدرب وإشارات مختبر ورشة العمل

- **📅 راية حالة الورشة**: تحديث من "تحت الإنشاء" إلى حالة الورشة النشطة بتاريخ فبراير 2026

- **🔗 تنقل الورشة**: إصلاح الروابط المعطوبة في README.md للورشة التي تشير إلى مجلد lab-1-azd-basics غير الموجود

#### تغييرات
- **عرض الورشة**: إزالة تحذير "تحت الإنشاء"، الورشة الآن مكتملة وجاهزة للاستخدام
- **تناسق التنقل**: ضمان وجود تنقل ملائم بين وحدات الورشة
- **إشارات المسار التعليمي**: تحديث المراجع المتقاطعة للفصول لاستخدام المسارات الصحيحة في microsoft-foundry

#### تم التحقق منه
- ✅ كل ملفات Markdown الإنجليزية تحتوي على روابط داخلية صالحة
- ✅ وحدات الورشة 0-7 مكتملة بأهداف تعلمية
- ✅ التنقل بين الفصول والوحدات يعمل بشكل صحيح
- ✅ المحتوى مناسب لمطوري الذكاء الاصطناعي باستخدام Microsoft AZD
- ✅ لغة وهيكل ودود للمبتدئين محفوظة عبر المحتوى
- ✅ يقدم CONTRIBUTING.md إرشادات واضحة للمساهمين في المجتمع

#### التنفيذ الفني
- **التحقق من الروابط**: تحقق سكربت PowerShell تلقائي لكل روابط .md الداخلية
- **تدقيق المحتوى**: مراجعة يدوية لكمال الورشة وصلاحية المبتدئين
- **نظام التنقل**: تطبيق أنماط تنقل متناسقة للفصول والوحدات

#### ملاحظات
- **النطاق**: التغييرات تم تطبيقها على الوثائق الإنجليزية فقط
- **الترجمات**: لم يتم تحديث مجلدات الترجمة في هذا الإصدار (سيتزامن الترجمة الآلية لاحقًا)
- **مدة الورشة**: تقدم الورشة كاملة الآن 3-4 ساعات تعلم عملي

---

### [v3.8.0] - 2025-11-19

#### توثيق متقدم: المراقبة، الأمان، وأنماط الوكلاء المتعددين
**يضيف هذا الإصدار دروسًا متقدمة من الدرجة أ حول تكامل Application Insights، أنماط المصادقة، وتنسيق الوكلاء المتعددين للنشر في بيئات الإنتاج.**

#### تمت الإضافة
- **📊 درس تكامل Application Insights** في `docs/pre-deployment/application-insights.md`:
  - نشر موجه لـ AZD مع التهيئة التلقائية
  - قوالب Bicep كاملة لـ Application Insights + تحليلات السجلات
  - تطبيقات Python تعمل مع تتبع مخصص (أكثر من 1200 سطر)
  - أنماط مراقبة AI/LLM (تتبع التوكن / التكلفة لنماذج Microsoft Foundry)
  - 6 مخططات Mermaid (البنية، التتبع الموزع، تدفق التتبع)
  - 3 تمارين عملية (تنبيهات، لوحات بيانات، مراقبة AI)
  - أمثلة استعلام Kusto واستراتيجيات تحسين التكلفة
  - تدفق مقاييس حية وتصحيح أخطاء في الوقت الحقيقي
  - 40-50 دقيقة وقت تعلم مع أنماط جاهزة للإنتاج

- **🔐 درس أنماط المصادقة والأمان** في `docs/getting-started/authsecurity.md`:
  - 3 أنماط مصادقة (سلاسل الاتصال، Key Vault، الهوية المُدارة)
  - قوالب بنية تحتية Bicep كاملة للنشر الآمن
  - كود تطبيق Node.js مع تكامل Azure SDK
  - 3 تمارين كاملة (تمكين الهوية المُدارة، الهوية المعينة من المستخدم، تدوير Key Vault)
  - ممارسات أمان أفضل وتكوينات RBAC
  - دليل استكشاف الأخطاء وتحليل التكلفة
  - أنماط مصادقة بدون كلمة مرور جاهزة للإنتاج

- **🤖 درس أنماط التنسيق بين الوكلاء المتعددين** في `docs/pre-deployment/coordination-patterns.md`:
  - 5 أنماط تنسيق (تسلسلي، متوازي، هرمي، قائم على الحدث، توافق)
  - تنفيذ خدمة المنسق الكامل (Python/Flask، أكثر من 1500 سطر)
  - 3 تنفيذات وكيلاً متخصصة (البحث، الكاتب، المحرر)
  - تكامل Service Bus لصف الرسائل
  - إدارة الحالة عبر Cosmos DB للأنظمة الموزعة
  - 6 مخططات Mermaid تُظهر تفاعلات الوكلاء
  - 3 تمارين متقدمة (تعامل مع المهلات، منطق المحاولة، قاطع الدائرة)
  - تفصيل التكلفة (240-565 دولار شهريًا) مع استراتيجيات تحسين
  - تكامل Application Insights للمراقبة

#### معزز
- **فصل ما قبل النشر**: يشمل الآن أنماط مراقبة وتنسيق شاملة
- **فصل بدء العمل**: محسن مع أنماط مصادقة احترافية
- **الجاهزية للإنتاج**: تغطية كاملة من الأمان إلى الرصد
- **مخطط الدورة**: تحديث المراجع للدروس الجديدة في الفصل 3 و6

#### تم تغييره
- **تقدم التعلم**: دمج أفضل للأمان والمراقبة عبر الدورة
- **جودة الوثائق**: معايير ثابتة من الدرجة أ (95-97٪) عبر الدروس الجديدة
- **أنماط الإنتاج**: تغطية شاملة من البداية للنهاية لنشر المؤسسات

#### تم تحسينه
- **تجربة المطور**: مسار واضح من التطوير إلى مراقبة الإنتاج
- **معايير الأمان**: أنماط احترافية للمصادقة وإدارة الأسرار
- **الرصد**: تكامل كامل مع Application Insights وAZD
- **أحمال عمل الذكاء الاصطناعي**: مراقبة متخصصة لنماذج Microsoft Foundry وأنظمة الوكلاء المتعددين

#### تم التحقق منه
- ✅ جميع الدروس تتضمن كود عملي كامل (وليس مقتطفات فقط)
- ✅ مخططات Mermaid للتعلم البصري (19 إجمالًا عبر 3 دروس)
- ✅ تمارين عملية مع خطوات التحقق (9 إجمالًا)
- ✅ قوالب Bicep جاهزة للإنتاج قابلة للنشر عبر `azd up`
- ✅ تحليل التكلفة واستراتيجيات التحسين
- ✅ أدلة استكشاف الأخطاء وأفضل الممارسات
- ✅ نقاط تحقق معرفة مع أوامر التحقق

#### نتائج تقييم الوثائق
- **docs/pre-deployment/application-insights.md**: - دليل مراقبة شامل
- **docs/getting-started/authsecurity.md**: - أنماط أمان احترافية
- **docs/pre-deployment/coordination-patterns.md**: - بنى متقدمة للوكلاء المتعددين
- **المحتوى الجديد العام**: - معايير جودة عالية متناسقة

#### التنفيذ الفني
- **Application Insights**: تحليلات السجلات + تتبع مخصص + التتبع الموزع
- **المصادقة**: الهوية المُدارة + Key Vault + أنماط RBAC
- **الوكلاء المتعددون**: Service Bus + Cosmos DB + تطبيقات الحاويات + التنسيق
- **المراقبة**: مقاييس حية + استعلامات Kusto + تنبيهات + لوحات بيانات
- **إدارة التكلفة**: استراتيجيات العرض، سياسات الاحتفاظ، ضوابط الميزانية

### [v3.7.0] - 2025-11-19

#### تحسين جودة الوثائق ومثال جديد لنماذج Microsoft Foundry
**يعزز هذا الإصدار جودة الوثائق في المستودع ويضيف مثال نشر كامل لنماذج Microsoft Foundry مع واجهة دردشة gpt-4.1.**

#### تمت الإضافة
- **🤖 مثال دردشة نماذج Microsoft Foundry**: نشر كامل لـ gpt-4.1 مع تنفيذ عملي في `examples/azure-openai-chat/`:
  - بنية تحتية كاملة لنماذج Microsoft Foundry (نموذج gpt-4.1)
  - واجهة دردشة سطر الأوامر Python مع سجل المحادثة
  - تكامل Key Vault لتخزين مفتاح API آمن
  - تتبع استخدام التوكن وتقدير التكلفة
  - تحديد معدل الخطأ والتعامل معه
  - ملف README شامل مع دليل نشر 35-45 دقيقة
  - 11 ملف جاهز للإنتاج (قوالب Bicep، تطبيق Python، تهيئة)
- **📚 تمارين توثيق**: إضافة تمارين عملية إلى دليل التهيئة:
  - تمرين 1: تهيئة متعددة البيئات (15 دقيقة)
  - تمرين 2: ممارسة إدارة الأسرار (10 دقائق)
  - معايير نجاح واضحة وخطوات التحقق
- **✅ تحقق من النشر**: إضافة قسم تحقق إلى دليل النشر:
  - إجراءات فحص الصحة
  - قائمة فحص معايير النجاح
  - المخرجات المتوقعة لجميع أوامر النشر
  - مرجع سريع لاستكشاف الأخطاء وإصلاحها

#### محسن
- **examples/README.md**: تحديث إلى جودة الدرجة أ (93٪):
  - إضافة azure-openai-chat إلى جميع الأقسام ذات الصلة
  - تحديث عدد الأمثلة المحلية من 3 إلى 4
  - إضافته إلى جدول أمثلة تطبيقات الذكاء الاصطناعي
  - دمجه في بدء سريع للمستخدمين المتوسطين
  - إضافته إلى قسم قوالب Microsoft Foundry
  - تحديث مصفوفة المقارنة وأقسام البحث التقني
- **جودة الوثائق**: تحسن من B+ (87٪) إلى A- (92٪) عبر مجلد الوثائق:

  - أُضيفت المخرجات المتوقعة لأمثلة الأوامر الحرجة  
  - شُملت خطوات التحقق من تغييرات التكوين  
  - تعزيز التعلم العملي من خلال تمارين تطبيقية  

#### تغير  
- **تقدم التعلم**: دمج أفضل لأمثلة الذكاء الاصطناعي للمتعلمين المتوسطين  
- **هيكل التوثيق**: تمارين أكثر عملية مع نتائج واضحة  
- **عملية التحقق**: تمت إضافة معايير نجاح صريحة لتدفقات العمل الرئيسية  

#### تحسين  
- **تجربة المطور**: نشر نماذج مايكروسوفت فاوندري يستغرق الآن 35-45 دقيقة (مقابل 60-90 للخيارات المعقدة)  
- **شفافية التكلفة**: تقديرات تكلفة واضحة (50-200 دولار شهريًا) لمثال نماذج مايكروسوفت فاوندري  
- **مسار التعلم**: لدى مطوري الذكاء الاصطناعي نقطة دخول واضحة مع azure-openai-chat  
- **معايير التوثيق**: إخراجات متوقعة وخطوات تحقق متناسقة  

#### تم التحقق  
- ✅ مثال نماذج مايكروسوفت فاوندري يعمل بشكل كامل مع `azd up`  
- ✅ جميع 11 ملف تنفيذ صحيحة من حيث الصياغة  
- ✅ تعليمات README تتطابق مع تجربة النشر الفعلية  
- ✅ تحديث روابط التوثيق في أكثر من 8 مواقع  
- ✅ فهرس الأمثلة يعكس بدقة 4 أمثلة محلية  
- ✅ لا توجد روابط خارجية مكررة في الجداول  
- ✅ جميع مراجع التنقل صحيحة  

#### التنفيذ الفني  
- **هيكل نماذج مايكروسوفت فاوندري**: نمط gpt-4.1 + Key Vault + تطبيقات الحاويات  
- **الأمان**: الجاهزية لهوية مُدارة، الأسرار في Key Vault  
- **المراقبة**: تكامل Application Insights  
- **إدارة التكلفة**: تتبع الرموز وتحسين الاستخدام  
- **النشر**: أمر `azd up` الواحد لإعداد كامل  

### [v3.6.0] - 2025-11-19  

#### تحديث رئيسي: أمثلة نشر تطبيقات الحاويات  
**تقدم هذه النسخة أمثلة شاملة لنشر تطبيقات الحاويات الجاهزة للإنتاج باستخدام Azure Developer CLI (AZD)، مع توثيق كامل ودمج في مسار التعلم.**  

#### أُضيف  
- **🚀 أمثلة تطبيق الحاويات**: أمثلة محلية جديدة في `examples/container-app/`:  
  - [الدليل الرئيسي](examples/container-app/README.md): نظرة شاملة على النشرات المحوّلة إلى حاويات، بدء سريع، الإنتاج، والأنماط المتقدمة  
  - [واجهة برمجة تطبيقات فلاس بسيطة](../../examples/container-app/simple-flask-api): REST API صديق للمبتدئين مع التدرج إلى الصفر، فحوصات الصحة، المراقبة، واستكشاف الأخطاء وإصلاحها  
  - [هيكلية الخدمات الصغيرة](../../examples/container-app/microservices): نشر متعدد الخدمات جاهز للإنتاج (بوابة API، المنتج، الطلب، المستخدم، الإشعارات)، الرسائل غير المتزامنة، Service Bus، Cosmos DB، Azure SQL، تتبع موزع، نشر أزرق-أخضر / كناري  
- **أفضل الممارسات**: الأمان، المراقبة، تحسين التكلفة، وإرشادات CI/CD للأحمال المحوّلة إلى حاويات  
- **عينات الكود**: ملفات `azure.yaml` كاملة، قوالب Bicep، وتنفيذ خدمات متعددة اللغات (Python، Node.js، C#، Go)  
- **الاختبار واستكشاف الأخطاء**: سيناريوهات اختبار شاملة، أوامر المراقبة، إرشادات استكشاف الأعطال  

#### تغيّر  
- **README.md**: تحديث لعرض وربط أمثلة تطبيق الحاويات الجديدة ضمن "أمثلة محلية - تطبيقات الحاويات"  
- **examples/README.md**: تحديث لإبراز أمثلة تطبيق الحاويات، إضافة مدخلات مصفوفة المقارنة، وتحديث مراجع التكنولوجيا/الهيكلية  
- **مخطط الدورة ودليل الدراسة**: تحديث للإشارة إلى أمثلة تطبيق الحاويات وأنماط النشر في الفصول ذات الصلة  

#### تم التحقق  
- ✅ جميع الأمثلة الجديدة يمكن نشرها بواسطة `azd up` وتتبع أفضل الممارسات  
- ✅ تحديث الروابط المتقاطعة والتنقل في التوثيق  
- ✅ تغطي الأمثلة سيناريوهات من المبتدئين إلى المتقدمين، بما في ذلك الخدمات الدقيقة للإنتاج  

#### ملاحظات  
- **النطاق**: التوثيق والأمثلة باللغة الإنجليزية فقط  
- **الخطوات القادمة**: توسيع بأنماط حاوية متقدمة إضافية وأتمتة CI/CD في الإصدارات المستقبلية  

### [v3.5.0] - 2025-11-19  

#### إعادة تسمية المنتج: مايكروسوفت فاوندري  
**تنفذ هذه النسخة تغييرًا شاملاً في اسم المنتج من "Microsoft Foundry" إلى "Microsoft Foundry" عبر جميع توثيقات اللغة الإنجليزية، مما يعكس إعادة تسمية رسمية من مايكروسوفت.**  

#### تغيّر  
- **🔄 تحديث اسم المنتج**: إعادة تسمية كاملة من "Microsoft Foundry" إلى "Microsoft Foundry"  
  - تحديث جميع الإشارات في توثيقات اللغة الإنجليزية في مجلد `docs/`  
  - إعادة تسمية المجلد: `docs/ai-foundry/` → `docs/microsoft-foundry/`  
  - إعادة تسمية الملف: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`  
  - إجمالي: 23 إشارة محتوى تم تحديثها عبر 7 ملفات توثيق  

- **📁 تغييرات هيكل المجلدات**:  
  - `docs/ai-foundry/` أُعيد تسميته إلى `docs/microsoft-foundry/`  
  - تحديث كافة المراجع المتقاطعة لتعكس الهيكل الجديد  
  - التحقق من روابط التنقل في جميع التوثيقات  

- **📄 إعادة تسمية الملفات**:  
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`  
  - تحديث كافة الروابط الداخلية للإشارة إلى الاسم الجديد للملف  

#### ملفات محدثة  
- **توثيق الفصل** (7 ملفات):  
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 تحديثات روابط التنقل  
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 تحديثات إشارات اسم المنتج  
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - مستخدم بالفعل Microsoft Foundry (من التحديثات السابقة)  
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 تحديثات إشارات (نظرة عامة، ملاحظات من المجتمع، التوثيق)  
  - `docs/getting-started/azd-basics.md` - 4 تحديثات روابط متقاطعة  
  - `docs/getting-started/first-project.md` - 2 تحديثات روابط تنقل فصول  
  - `docs/getting-started/installation.md` - 2 تحديثات روابط فصول لاحقة  
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 تحديثات إشارات (تنقل، مجتمع Discord)  
  - `docs/troubleshooting/common-issues.md` - تحديث 1 رابط تنقل  
  - `docs/troubleshooting/debugging.md` - تحديث 1 رابط تنقل  

- **ملفات هيكل الدورة** (ملفان):  
  - `README.md` - تحديث 17 إشارة (نظرة عامة على الدورة، عناوين الفصول، قسم القوالب، رؤى المجتمع)  
  - `course-outline.md` - تحديث 14 إشارة (نظرة عامة، أهداف التعلم، موارد الفصل)  

#### تم التحقق  
- ✅ لا توجد مراجع متبقية لمسار مجلد "ai-foundry" في التوثيق الإنجليزي  
- ✅ لا توجد مراجع متبقية لاسم المنتج "Microsoft Foundry" في التوثيق الإنجليزي  
- ✅ جميع روابط التنقل تعمل بالهيكل الجديد للمجلدات  
- ✅ إعادة تسمية الملفات والمجلدات تمّت بنجاح  
- ✅ التحقق من المراجع المتقاطعة بين الفصول  

#### ملاحظات  
- **النطاق**: التغييرات مطبقة على توثيق اللغة الإنجليزية ضمن مجلد `docs/` فقط  
- **الترجمات**: مجلدات الترجمة (`translations/`) لم يتم تحديثها في هذه النسخة  
- **الورشة**: مواد الورشة (`workshop/`) لم يتم تحديثها في هذه النسخة  
- **الأمثلة**: قد تستمر ملفات الأمثلة في الإشارة للتسمية القديمة (سوف تتم معالجتها في تحديث مستقبلي)  
- **الروابط الخارجية**: عناوين URL الخارجية وروابط مستودع GitHub تبقى بدون تغيير  

#### دليل الهجرة للمساهمين  
إذا كانت لديك فروع محلية أو توثيق يشير إلى الهيكل القديم:  
1. حدّث مراجع المجلد: `docs/ai-foundry/` → `docs/microsoft-foundry/`  
2. حدّث مراجع الملفات: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`  
3. استبدل اسم المنتج: "Microsoft Foundry" → "Microsoft Foundry"  
4. تحقق من أن جميع روابط التوثيق الداخلية ما زالت تعمل  

---

### [v3.4.0] - 2025-10-24  

#### تعزيزات معاينة البنية التحتية والتحقق  
**تقدم هذه النسخة دعمًا شاملاً لميزة المعاينة الجديدة في Azure Developer CLI وتعزز تجربة مستخدم الورشة.**  

#### أُضيف  
- **🧪 توثيق ميزة azd provision --preview**: تغطية شاملة لقدرة معاينة البنية التحتية الجديدة  
  - مرجع الأوامر وأمثلة الاستخدام في ورقة الغش  
  - تكامل مفصل في دليل التهيئة مع حالات استخدام وفوائد  
  - تكامل فحص ما قبل الإقلاع للتحقق الآمن من النشر  
  - تحديثات دليل البداية مع ممارسات نشر تركز على السلامة  
- **🚧 لافتة حالة الورشة**: لافتة HTML احترافية تشير إلى حالة تطوير الورشة  
  - تصميم متدرج مع مؤشرات البناء لتوضيح للمستخدم  
  - طابع زمني لآخر تحديث للشفافية  
  - تصميم متجاوب مع الأجهزة المحمولة  

#### تحسين  
- **سلامة البنية التحتية**: دمج ميزة المعاينة في جميع وثائق النشر  
- **التحقق ما قبل النشر**: سكربتات مؤتمتة تضم اختبارات معاينة البنية التحتية  
- **تدفق عمل المطور**: تحديث تسلسل الأوامر ليشمل المعاينة كممارسة مثلى  
- **تجربة الورشة**: وضع توقعات واضحة للمستخدمين حول حالة محتوى التطوير  

#### تغير  
- **أفضل ممارسات النشر**: اعتماد تدفق عمل المعاينة أولًا كنهج موصى به  
- **تدفق التوثيق**: تم تقديم التحقق من البنية التحتية بشكل مبكر في عملية التعلم  
- **عرض الورشة**: تواصل حالة احترافية مع جدول زمني تطوير واضح  

#### تحسّن  
- **نهج السلامة أولًا**: يمكن الآن التحقق من تغييرات البنية التحتية قبل النشر  
- **التعاون الجماعي**: يمكن مشاركة نتائج المعاينة للمراجعة والموافقة  
- **الوعي بالتكلفة**: فهم أفضل لتكاليف الموارد قبل التهيئة  
- **تخفيف المخاطر**: تقليل فشل النشر من خلال التحقق المسبق  

#### التنفيذ الفني  
- **تكامل متعدد الوثائق**: توثيق ميزة المعاينة عبر 4 ملفات رئيسية  
- **أنماط الأوامر**: صياغة وأمثلة متناسقة في جميع التوثيقات  
- **دمج أفضل الممارسات**: تضمين المعاينة في تدفقات التحقق والسكربتات  
- **المؤشرات البصرية**: علامات واضحة على الميزة الجديدة لاكتشافها  

#### بنية الورشة  
- **تواصل الحالة**: لافتة HTML احترافية ذات تصميم متدرج  
- **تجربة المستخدم**: توضيح حالة التطوير يمنع الالتباس  
- **عرض احترافي**: يحافظ على مصداقية المستودع مع وضع التوقعات  
- **شفافية الجدول الزمني**: تاريخ آخر تحديث أكتوبر 2025 للمسائلة  

### [v3.3.0] - 2025-09-24  

#### تعزيز مواد الورشة وتجربة التعلم التفاعلية  
**تقدم هذه النسخة مواد ورشة شاملة مع أدلة تفاعلية عبر المتصفح ومسارات تعلم منظمة.**  

#### أُضيف  
- **🎥 دليل ورشة تفاعلية**: تجربة ورشة عبر المتصفح مع ميزة معاينة MkDocs  
- **📝 تعليمات ورشة منظمة**: مسار تعلم مكون من 7 خطوات من الاكتشاف إلى التخصيص  
  - 0-مقدمة: نظرة عامة وإعداد الورشة  
  - 1-اختيار قالب AI: اكتشاف القوالب وعملية الاختيار  
  - 2-التحقق من قالب AI: إجراءات النشر والتحقق  
  - 3-تفكيك قالب AI: فهم بنية القالب  
  - 4-تكوين قالب AI: الإعداد والتخصيص  
  - 5-تخصيص قالب AI: التعديلات المتقدمة والتكرارات  
  - 6-تفكيك البنية التحتية: التنظيف وإدارة الموارد  
  - 7-الختام: ملخص والخطوات التالية  
- **🛠️ أدوات الورشة**: تكوين MkDocs مع موضوع Material لتحسين تجربة التعلم  
- **🎯 مسار التعلم العملي**: منهجية من 3 خطوات (اكتشاف → نشر → تخصيص)  
- **📱 تكامل GitHub Codespaces**: إعداد بيئة تطوير سلسة  

#### تحسين  
- **مختبر ورشة AI**: توسيع مع تجربة تعلم منظمة شاملة تستغرق 2-3 ساعات  
- **توثيق الورشة**: عرض احترافي مع تنقل وسائط مرئية  
- **تقدم التعلم**: توجيه واضح خطوة بخطوة من اختيار القالب إلى النشر للإنتاج  
- **تجربة المطور**: أدوات متكاملة لسير عمل تطوير مبسط  

#### تحسّن  
- **الوصولية**: واجهة متصفح مع بحث، وظيفة نسخ، وتبديل السمة  
- **التعلم الذاتي حسب الوتيرة**: هيكل ورشة مرن يستوعب سرعات تعلم مختلفة  
- **التطبيق العملي**: سيناريوهات نشر قالب AI من العالم الحقيقي  
- **دمج المجتمع**: تكامل Discord لدعم الورشة والتعاون  

#### ميزات الورشة  
- **بحث مدمج**: اكتشاف سهل للكلمات المفتاحية والدروس  
- **نسخ كتل الكود**: وظيفة نسخ عند التمرير على كل أمثلة الكود  
- **تبديل السمة**: دعم وضع الظلام/الضوء لتفضيلات مختلفة  
- **الأصول البصرية**: لقطات شاشة ورسوم بيانية لفهم أفضل  
- **تكامل المساعدة**: وصول مباشر إلى Discord لدعم المجتمع  

### [v3.2.0] - 2025-09-17  

#### إعادة هيكلة كبيرة للتنقل ونظام تعلم قائم على الفصول  
**تقدم هذه النسخة هيكل تعلم شامل قائم على الفصول مع تنقل محسّن عبر المستودع بالكامل.**  

#### أُضيف  
- **📚 نظام تعلم قائم على الفصول**: إعادة هيكلة الدورة بالكامل إلى 8 فصول متتابعة  
  - الفصل 1: الأساسيات والبداية السريعة (⭐ - 30-45 دقيقة)  
  - الفصل 2: تطوير AI-أولًا (⭐⭐ - 1-2 ساعة)  
  - الفصل 3: التكوين والمصادقة (⭐⭐ - 45-60 دقيقة)  
  - الفصل 4: البنية التحتية ككود والنشر (⭐⭐⭐ - 1-1.5 ساعة)  
  - الفصل 5: حلول AI متعددة الوكلاء (⭐⭐⭐⭐ - 2-3 ساعات)  
  - الفصل 6: التحقق والتخطيط ما قبل النشر (⭐⭐ - 1 ساعة)  
  - الفصل 7: استكشاف الأخطاء وإصلاحها وتصحيحها (⭐⭐ - 1-1.5 ساعة)  
  - الفصل 8: أنماط الإنتاج والمؤسسات (⭐⭐⭐⭐ - 2-3 ساعات)  
- **📚 نظام تنقل شامل**: رؤوس وتذييلات تنقل متناسقة عبر جميع التوثيقات  
- **🎯 تتبع التقدم**: قائمة التحقق لإكمال الدورة ونظام تحقق التعلم  
- **🗺️ إرشادات مسار التعلم**: نقاط دخول واضحة لمستويات وخبرات وأهداف مختلفة  
- **🔗 تنقل مع الإشارات المتقاطعة**: ربط واضح بين الفصول ذات الصلة والمتطلبات السابقة  

#### تحسين  
- **هيكل README**: تحويله إلى منصة تعلم منظمة بتنسيق قائم على الفصول  
- **تنقل التوثيق**: تضمين سياق الفصل وإرشادات التقدم في كل صفحة  
- **تنظيم القوالب**: ربط الأمثلة والقوالب بالفصول التعليمية المناسبة  

- **دمج الموارد**: ملخصات الغش، الأسئلة المتكررة، وأدلة الدراسة مرتبطة بالفصول ذات الصلة
- **دمج ورش العمل**: مختبرات تطبيقية مرتبطة بأهداف التعلم متعددة الفصول

#### تم التغيير
- **تقدم التعلم**: الانتقال من التوثيق الخطي إلى التعلم المرن المبني على الفصول
- **موضع التكوين**: إعادة وضع دليل التكوين كالفصل 3 لتحسين تدفق التعلم
- **دمج محتوى الذكاء الاصطناعي**: دمج محسن لمحتوى الذكاء الاصطناعي الخاص عبر رحلة التعلم
- **محتوى الإنتاج**: تجميع الأنماط المتقدمة في الفصل 8 للمتعلمين المؤسساتيين

#### تم تحسينه
- **تجربة المستخدم**: توصيف واضح للمسارات والتنقل في الفصول
- **إمكانية الوصول**: أنماط تنقل متناسقة لتسهيل التجول في الدورة
- **العرض الاحترافي**: هيكل دورة بأسلوب جامعي مناسب للتدريب الأكاديمي والمؤسسي
- **كفاءة التعلم**: تقليل الوقت للعثور على المحتوى الملائم من خلال تنظيم محسن

#### التنفيذ التقني
- **رؤوس التنقل**: توحيد تنقل الفصول عبر أكثر من 40 ملف توثيق
- **تنقل التذييل**: إرشادات تقدم متناسقة ومؤشرات إتمام الفصول
- **الربط المتقاطع**: نظام ربط داخلي شامل يربط المفاهيم ذات الصلة
- **رسم خرائط الفصول**: قوالب وأمثلة مرتبطة بوضوح بأهداف التعلم

#### تحسين دليل الدراسة
- **📚 أهداف تعلم شاملة**: إعادة هيكلة دليل الدراسة ليتوافق مع نظام 8 فصول
- **🎯 تقييم مستند إلى الفصول**: كل فصل يتضمن أهداف تعلم محددة وتمارين عملية
- **📋 تتبع التقدم**: جدول تعلم أسبوعي مع نتائج قابلة للقياس وقوائم تحقق للإكمال
- **❓ أسئلة التقييم**: أسئلة تحقق من المعرفة لكل فصل مع نتائج مهنية
- **🛠️ تمارين عملية**: أنشطة تطبيقية مع سيناريوهات نشر حقيقية واستكشاف الأخطاء وإصلاحها
- **📊 تقدم المهارات**: تقدم واضح من المفاهيم الأساسية إلى أنماط المؤسسات مع تركيز على تطوير المهنة
- **🎓 إطار الشهادات**: نتائج التطوير المهني ونظام الاعتراف المجتمعي
- **⏱️ إدارة الجدول الزمني**: خطة تعلم منظمة على 10 أسابيع مع تحقق من المراحل الأساسية

### [v3.1.0] - 2025-09-17

#### حلول الذكاء الاصطناعي متعددة الوكلاء المحسنة
**تحسن هذه النسخة الحل متعدد الوكلاء للبيع بالتجزئة مع تسمية أفضل للوكلاء وتوثيق محسّن.**

#### تم التغيير
- **مصطلحات متعدد الوكلاء**: استبدال "وكيل كورا" بـ "وكيل العميل" في كل الحلول متعددة الوكلاء في التجزئة للفهم الأوضح
- **هيكل الوكيل**: تحديث جميع التوثيقات، قوالب ARM، وأمثلة الشيفرة لاستخدام تسمية "وكيل العميل" المتناسقة
- **أمثلة التكوين**: تحديث أنماط تكوين الوكلاء بأسماء محدثة حديثة
- **اتساق التوثيق**: التأكد من أن كل المراجع تستخدم أسماء وكلاء وصفية ومهنية

#### مُحسّن
- **حزمة قالب ARM**: تحديث قالب retail-multiagent-arm-template مع مراجع وكيل العميل
- **مخططات الهيكل**: تحديث مخططات Mermaid مع تسمية الوكيل المحدثة
- **أمثلة الشيفرة**: فئات بايثون وأمثلة التنفيذ تستخدم الآن تسمية CustomerAgent
- **متغيرات البيئة**: تحديث جميع سكربتات النشر لاستخدام تسميات CUSTOMER_AGENT_NAME

#### تم تحسينه
- **تجربة المطور**: أدوار ومسؤوليات الوكيل أوضح في التوثيق
- **جاهزية الإنتاج**: توافق أفضل مع قواعد التسمية المؤسساتية
- **مواد التعلم**: تسمية وكلاء أكثر بديهية للأغراض التعليمية
- **سهولة استخدام القوالب**: تبسيط فهم وظائف الوكلاء وأنماط النشر

#### التفاصيل التقنية
- تحديث مخططات الهيكل Mermaid مع مراجع CustomerAgent
- استبدال أسماء فئة CoraAgent بأسماء CustomerAgent في أمثلة بايثون
- تعديل تكوينات JSON في قالب ARM لاستخدام نوع الوكيل "customer"
- تحديث متغيرات البيئة من CORA_AGENT_* إلى نماذج CUSTOMER_AGENT_*
- تحديث جميع أوامر النشر وتكوين الحاويات

### [v3.0.0] - 2025-09-12

#### تغييرات كبيرة - تركيز مطور الذكاء الاصطناعي ودمج Microsoft Foundry
**تحول هذا الإصدار المخزن إلى مورد تعلم شامل يركز على الذكاء الاصطناعي مع دمج Microsoft Foundry.**

#### أضيف
- **🤖 مسار تعلم يركز على الذكاء الاصطناعي أولاً**: إعادة هيكلة شاملة تفضل مطوري ومهندسي الذكاء الاصطناعي
- **دليل دمج Microsoft Foundry**: توثيق شامل لربط AZD بخدمات Microsoft Foundry
- **أنماط نشر نماذج الذكاء الاصطناعي**: دليل مفصل يشمل اختيار النموذج، التكوين، واستراتيجيات النشر الإنتاجي
- **مختبر ورشة عمل الذكاء الاصطناعي**: ورشة عمل تعليمية مدتها 2-3 ساعات لتحويل تطبيقات الذكاء الاصطناعي إلى حلول قابلة للنشر عبر AZD
- **أفضل ممارسات الذكاء الاصطناعي الإنتاجية**: أنماط جاهزة للمؤسسات للتوسعة، المراقبة، وتأمين أحمال عمل الذكاء الاصطناعي
- **دليل استكشاف أعطال الذكاء الاصطناعي**: استكشاف شامل لأعطال نماذج Microsoft Foundry، الخدمات المعرفية، وقضايا النشر
- **معرض قوالب الذكاء الاصطناعي**: مجموعة مميزة من قوالب Microsoft Foundry مع تقييمات التعقيد
- **مواد الورشة**: هيكل ورشة عمل كامل مع مختبرات تطبيقية ومواد مرجعية

#### تم تحسينه
- **هيكل README**: موجه لمطوري الذكاء الاصطناعي مع بيانات اهتمام مجتمعي بنسبة 45% من Discord الخاص بـ Microsoft Foundry
- **مسارات التعلم**: رحلة مخصصة لمطوري الذكاء الاصطناعي إلى جانب المسارات التقليدية للطلاب ومهندسي DevOps
- **توصيات القوالب**: قوالب ذكاء اصطناعي مميزة مثل azure-search-openai-demo، contoso-chat، و openai-chat-app-quickstart
- **دمج المجتمع**: دعم مجتمعي معزز في Discord مع قنوات ومناقشات مخصصة للذكاء الاصطناعي

#### أمان وتركيز الإنتاج
- **أنماط الهوية المُدارة**: مصادقة وتكوينات أمان خاصة بالذكاء الاصطناعي
- **تحسين التكاليف**: تتبع استخدام الرموز وإدارة الميزانيات على أحمال عمل الذكاء الاصطناعي
- **النشر متعدد المناطق**: استراتيجيات لنشر تطبيقات الذكاء الاصطناعي عالمياً
- **مراقبة الأداء**: مقاييس خاصة بالذكاء الاصطناعي ودمج Application Insights

#### جودة التوثيق
- **هيكل الدورة الخطية**: تقدم منطقي من المبتدئ إلى أنماط نشر الذكاء الاصطناعي المتقدمة
- **الروابط الموثقة**: التحقق من كل روابط المستودعات الخارجية وقابلية الوصول إليها
- **مرجع كامل**: التحقق من جميع روابط التوثيق الداخلية وضمان وظيفتها
- **جاهز للإنتاج**: أنماط نشر مؤسساتي مع أمثلة من العالم الحقيقي

### [v2.0.0] - 2025-09-09

#### تغييرات كبيرة - إعادة هيكلة المستودع وتحسين احترافي
**يمثل هذا الإصدار مراجعة كبيرة لبنية المستودع وعرض المحتوى.**

#### أضيف
- **إطار تعلم منظم**: جميع صفحات التوثيق الآن تتضمن مقدمة، وأهداف تعلم، ونتائج تعلم
- **نظام التنقل**: إضافة روابط الدرس السابق/التالي في كل التوثيقات لتوجيه تقدم التعلم
- **دليل الدراسة**: study-guide.md شامل مع أهداف تعلم، تمارين تدريبية، ومواد تقييم
- **العرض الاحترافي**: إزالة كل رموز الإيموجي لتحسين إمكانية الوصول والمظهر المهني
- **تحسين هيكل المحتوى**: تحسين التنظيم وتدفق مواد التعلم

#### تم التغيير
- **تنسيق التوثيق**: توحيد كل التوثيقات مع هيكل يركز على التعلم بشكل متناسق
- **تدفق التنقل**: تنفيذ تقدم منطقي عبر كل مواد التعلم
- **عرض المحتوى**: إزالة العناصر الزخرفية لصياغة واضحة ومهنية
- **هيكل الروابط**: تحديث كل الروابط الداخلية لدعم نظام التنقل الجديد

#### تم تحسينه
- **إمكانية الوصول**: إزالة اعتماد الرموز التعبيرية لتحسين توافق قارئ الشاشة
- **المظهر الاحترافي**: عرض نظيف بأسلوب أكاديمي مناسب لتعلم المؤسسات
- **تجربة التعلم**: نهج منظم مع أهداف واضحة ونتائج لكل درس
- **تنظيم المحتوى**: تدفق منطقي أفضل وربط بين المواضيع ذات الصلة

### [v1.0.0] - 2025-09-09

#### الإصدار الأول - مستودع تعلم AZD شامل

#### أضيف
- **هيكل التوثيق الأساسي**
  - سلسلة كاملة من أدلة البدء السريع
  - توثيق شامل للنشر والتقديم
  - موارد مفصلة لاستكشاف الأخطاء وإصلاحها وإرشادات التصحيح
  - أدوات وإجراءات التحقق قبل النشر

- **وحدة البدء السريع**
  - أساسيات AZD: المفاهيم والمصطلحات الأساسية
  - دليل التثبيت: تعليمات إعداد حسب النظام الأساسي
  - دليل التكوين: إعداد البيئة والمصادقة
  - أول درس عملي: تعلم تطبيقي خطوة بخطوة

- **وحدة النشر والتقديم**
  - دليل النشر: توثيق كامل لسير العمل
  - دليل التقديم: البنية التحتية كرمز باستخدام Bicep
  - أفضل الممارسات لنشر الإنتاج
  - أنماط البنية متعددة الخدمات

- **وحدة التحقق قبل النشر**
  - تخطيط القدرات: التحقق من توافر موارد Azure
  - اختيار SKU: إرشادات شاملة لطبقة الخدمة
  - الفحوصات المسبقة: نصوص تحقق مؤتمتة (PowerShell و Bash)
  - أدوات تقدير التكلفة والتخطيط الميزاني

- **وحدة استكشاف الأخطاء**
  - مشاكل شائعة: مشاكل متكررة وحلولها
  - دليل التصحيح: منهجيات استكشاف الأخطاء المنهجي
  - تقنيات وأدوات تشخيص متقدمة
  - مراقبة الأداء والتحسين

- **الموارد والمراجع**
  - ملخص الأوامر: مرجع سريع للأوامر الأساسية
  - مسرد المصطلحات: تعريفات شاملة للمصطلحات والاختصارات
  - الأسئلة الشائعة: أجوبة مفصلة للأسئلة المتكررة
  - روابط الموارد الخارجية والاتصالات المجتمعية

- **الأمثلة والقوالب**
  - مثال تطبيق ويب بسيط
  - قالب نشر موقع ويب ثابت
  - تكوين تطبيق حاوية
  - أنماط تكامل قاعدة البيانات
  - أمثلة بنية الميكروسيرفس
  - تطبيقات الدوال بدون خادم

#### الميزات
- **دعم متعدد المنصات**: أدلة التثبيت والتكوين لويندوز، ماك، ولينكس
- **مستويات مهارات متعددة**: محتوى مصمم للطلاب حتى المطورين المحترفين
- **تركيز عملي**: أمثلة تطبيقية وسيناريوهات من العالم الحقيقي
- **تغطية شاملة**: من المفاهيم الأساسية إلى أنماط المؤسسات المتقدمة
- **نهج أمان أولاً**: أفضل ممارسات الأمان مدمجة في كل مكان
- **تحسين التكاليف**: إرشادات لنشر فعال من حيث التكلفة وإدارة الموارد

#### جودة التوثيق
- **أمثلة شيفرة مفصلة**: عينات شيفرة عملية ومختبرة
- **إرشادات خطوة بخطوة**: توجيهات واضحة وقابلة للتنفيذ
- **معالجة أخطاء شاملة**: استكشاف الأخطاء الشائع التعامل معها
- **دمج أفضل الممارسات**: معايير وتوصيات الصناعة
- **توافق الإصدارات**: محدث مع أحدث خدمات Azure وميزات azd

## التحسينات المستقبلية المخططة

### النسخة 3.1.0 (مخطط لها)
#### توسيع منصة الذكاء الاصطناعي
- **دعم نماذج متعددة**: أنماط التكامل لـ Hugging Face و Azure Machine Learning والنماذج المخصصة
- **أطر العمل لوكلاء الذكاء الاصطناعي**: قوالب لـ LangChain، Semantic Kernel، و AutoGen
- **أنماط RAG المتقدمة**: خيارات قواعد بيانات متجهة خارج Azure AI Search (Pinecone، Weaviate، إلخ)
- **مراقبة الذكاء الاصطناعي**: مراقبة محسنة لأداء النماذج، استخدام الرموز، وجودة الاستجابة

#### تجربة المطور
- **امتداد VS Code**: تجربة تطوير متكاملة لـ AZD + Microsoft Foundry
- **دمج GitHub Copilot**: توليد قوالب AZD بمساعدة الذكاء الاصطناعي
- **دروس تفاعلية**: تمارين ترميز تطبيقية مع تحقق آلي لسيناريوهات الذكاء الاصطناعي
- **محتوى فيديو**: دروس فيديو مساعدة للمتعلمين البصريين تركز على نشرات الذكاء الاصطناعي

### النسخة 4.0.0 (مخطط لها)
#### أنماط الذكاء الاصطناعي للمؤسسات
- **إطار الحوكمة**: حوكمة نماذج الذكاء الاصطناعي، الامتثال، ومسارات التدقيق
- **ذكاء اصطناعي متعدد المستأجرين**: أنماط لخدمة عدة عملاء مع عزل خدمات الذكاء الاصطناعي
- **نشر الذكاء الاصطناعي على الحافة**: دمج مع Azure IoT Edge وحاويات الحاويات
- **ذكاء اصطناعي سحابي هجين**: أنماط نشر متعدد السحابة وهجين لأحمال الذكاء الاصطناعي

#### ميزات متقدمة
- **أتمتة خطوط إنتاج الذكاء الاصطناعي**: دمج MLOps مع خطوط تشغيل Azure Machine Learning
- **أمان متقدم**: أنماط الثقة الصفرية، النقاط النهائية الخاصة، وحماية التهديدات المتقدمة
- **تحسين الأداء**: استراتيجيات الضبط والتوسع المتقدمة لتطبيقات الذكاء الاصطناعي ذات الإنتاجية العالية
- **التوزيع العالمي**: أنماط تسليم المحتوى وتخزين مؤقت عند الحافة لتطبيقات الذكاء الاصطناعي

### النسخة 3.0.0 (مخطط لها) - تم استبداله بالإصدار الحالي
#### إضافات مقترحة - تم تنفيذها الآن في v3.0.0
- ✅ **محتوى يركز على الذكاء الاصطناعي**: دمج شامل لـ Microsoft Foundry (مكتمل)
- ✅ **دروس تفاعلية**: مختبر ورشة عمل الذكاء الاصطناعي العملي (مكتمل)
- ✅ **وحدة أمان متقدمة**: أنماط أمان محددة بالذكاء الاصطناعي (مكتمل)
- ✅ **تحسين الأداء**: استراتيجيات ضبط أحمال العمل الذكاء الاصطناعي (مكتمل)

### النسخة 2.1.0 (مخطط لها) - تم تنفيذ جزئياً في v3.0.0
#### تحسينات ثانوية - بعض منها مكتمل في الإصدار الحالي
- ✅ **أمثلة إضافية**: سيناريوهات نشر تركز على الذكاء الاصطناعي (مكتمل)
- ✅ **الأسئلة والتقييم الموسع**: أسئلة واستكشاف أعطال خاصة بالذكاء الاصطناعي (مكتمل)
- **دمج الأدوات**: أدلة محسّنة لتكامل IDE والمحرر
- ✅ **توسع المراقبة**: أنماط مراقبة وتنبيه خاصة بالذكاء الاصطناعي (مكتمل)

#### لا يزال مخططًا للإصدار المستقبلي
- **توثيق ملائم للهاتف المحمول**: تصميم استجابي للتعلم عبر المحمول
- **الوصول دون اتصال**: حزم توثيق قابلة للتنزيل
- **تكامل IDE محسن**: امتداد VS Code لتدفقات عمل AZD + الذكاء الاصطناعي
- **لوحة معلومات المجتمع**: مقاييس مجتمعية حية وتتبع المساهمات

## الإسهام في سجل التغييرات

### الإبلاغ عن التغييرات
عند الإسهام في هذا المستودع، يرجى التأكد من أن إدخالات سجل التغييرات تشمل:

1. **رقم الإصدار**: حسب نظام الترقيم الدلالي (رئيسي.فرعي.تصحيح)
2. **التاريخ**: تاريخ الإصدار أو التحديث بصيغة YYYY-MM-DD
3. **الفئة**: مضافة، تم تغييرها، مهجورة، تم إزالتها، تم تصحيحها، أمان
4. **وصف واضح**: وصف موجز لما تم تغييره
5. **تقييم الأثر**: كيف تؤثر التغييرات على المستخدمين الحاليين

### فئات التغيير

#### مضافة
- ميزات جديدة، أقسام توثيق، أو قدرات
- أمثلة وقوالب أو موارد تعلم جديدة
- أدوات إضافية، سكربتات، أو خدمات مساعدة

#### تم التغيير
- تعديلات على وظيفة موجودة أو توثيق
- تحديثات لتحسين الوضوح أو الدقة
- إعادة هيكلة المحتوى أو التنظيم

#### مهجورة
- ميزات أو طرق يتم التوقف عن استخدامها تدريجياً
- أقسام توثيق مقررة للإزالة
- طرق لها بدائل أفضل

#### تم الإزالة
- ميزات، توثيق، أو أمثلة لم تعد ذات صلة
- معلومات قديمة أو طرق مهجورة
- محتوى مكرر أو موحد

#### تم التصحيح
- تصحيحات لأخطاء في التوثيق أو الشيفرة
- حل القضايا أو المشاكل المبلغ عنها
- تحسينات في الدقة أو الوظائف


#### الأمان
- تحسينات أو إصلاحات متعلقة بالأمان
- تحديثات لأفضل ممارسات الأمان
- حل الثغرات الأمنية

### إرشادات النسخ الدلالية

#### النسخة الرئيسية (X.0.0)
- تغييرات جذرية تتطلب إجراء من المستخدم
- إعادة هيكلة كبيرة للمحتوى أو التنظيم
- تغييرات تغير النهج الأساسي أو المنهجية

#### النسخة الثانوية (X.Y.0)
- ميزات جديدة أو إضافات للمحتوى
- تحسينات تحافظ على التوافق مع الإصدارات السابقة
- أمثلة إضافية أو أدوات أو موارد

#### نسخة التصحيح (X.Y.Z)
- إصلاحات الأخطاء وتصحيحات
- تحسينات بسيطة للمحتوى الحالي
- توضيحات وتحسينات صغيرة

## ملاحظات المجتمع واقتراحاته

نحن نشجع بنشاط ملاحظات المجتمع لتحسين هذا المورد التعليمي:

### كيفية تقديم الملاحظات
- **قضايا GitHub**: الإبلاغ عن المشكلات أو الاقتراحات للتحسين (مرحب بالقضايا الخاصة بالذكاء الاصطناعي)
- **مناقشات Discord**: مشاركة الأفكار والتفاعل مع مجتمع Microsoft Foundry
- **طلبات السحب**: المساهمة بتحسينات مباشرة على المحتوى، خاصة على قوالب وإرشادات الذكاء الاصطناعي
- **Microsoft Foundry Discord**: المشاركة في قناة #Azure لمناقشات AZD + الذكاء الاصطناعي
- **منتديات المجتمع**: المشاركة في مناقشات المطورين الأوسع في Azure

### فئات الملاحظات
- **دقة محتوى الذكاء الاصطناعي**: تصحيحات لمعلومات دمج وتوزيع خدمة الذكاء الاصطناعي
- **تجربة التعلم**: اقتراحات لتحسين تدفق تعلم مطوري الذكاء الاصطناعي
- **محتوى الذكاء الاصطناعي المفقود**: طلبات لوثائق أو قوالب أو أمثلة إضافية للذكاء الاصطناعي
- **إتاحة الوصول**: تحسينات لتلبية احتياجات تعلم متنوعة
- **تكامل أدوات الذكاء الاصطناعي**: اقتراحات لتكامل أفضل في سير عمل تطوير الذكاء الاصطناعي
- **أنماط إنتاج الذكاء الاصطناعي**: طلبات أنماط نشر الذكاء الاصطناعي للمؤسسات

### التزام بالرد
- **الرد على المشكلات**: خلال 48 ساعة للمشاكل المبلغة
- **طلبات الميزات**: التقييم خلال أسبوع
- **مساهمات المجتمع**: المراجعة خلال أسبوع
- **قضايا الأمان**: أولوية فورية مع استجابة معجلة

## جدول الصيانة

### تحديثات منتظمة
- **مراجعات شهرية**: دقة المحتوى والتحقق من الروابط
- **تحديثات ربع سنوية**: إضافات وتحسينات كبيرة للمحتوى
- **مراجعات نصف سنوية**: إعادة هيكلة شاملة وتحسينات
- **إصدارات سنوية**: تحديثات نسخة رئيسية مع تحسينات كبيرة

### المراقبة وضمان الجودة
- **الاختبارات الآلية**: التحقق الدوري من أمثلة الكود والروابط
- **دمج ملاحظات المجتمع**: إدراج منتظم لاقتراحات المستخدمين
- **تحديثات التكنولوجيا**: التوافق مع أحدث خدمات Azure وإصدارات azd
- **تدقيقات الإتاحة**: مراجعة منتظمة لمبادئ التصميم الشامل

## سياسة دعم النسخ

### دعم النسخ الحالية
- **أحدث نسخة رئيسية**: دعم كامل مع تحديثات منتظمة
- **النسخة الرئيسية السابقة**: تحديثات أمان وتصحيحات حرجة لمدة 12 شهراً
- **الإصدارات القديمة**: دعم المجتمع فقط، بدون تحديثات رسمية

### إرشادات الترحيل
عند إصدار نسخ رئيسية، نوفر:
- **أدلة الترحيل**: تعليمات خطوة بخطوة للانتقال
- **ملاحظات التوافق**: تفاصيل حول التغييرات الجذرية
- **دعم الأدوات**: سكريبتات أو أدوات لمساعدة الترحيل
- **دعم المجتمع**: منتديات مخصصة لأسئلة الترحيل

---

**التنقل**
- **الدرس السابق**: [دليل الدراسة](resources/study-guide.md)
- **الدرس التالي**: العودة إلى [الملف الرئيسي README](README.md)

**ابقَ على اطلاع**: اشترك في هذا المستودع لتلقي إشعارات حول الإصدارات الجديدة والتحديثات المهمة لمواد التعلم.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنويه**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي والمعتمد. للمعلومات الهامة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->