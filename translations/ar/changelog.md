# سجل التغييرات - AZD للمبتدئين

## المقدمة

يوثق سجل التغييرات هذا جميع التغييرات والتحديثات والتحسينات الملحوظة في مستودع AZD للمبتدئين. نتبع مبادئ الترقيم الدلالي ونحافظ على هذا السجل لمساعدة المستخدمين على فهم ما تغير بين الإصدارات.

## أهداف التعلم

من خلال مراجعة سجل التغييرات هذا، سوف:
- ابقَ على اطلاع بالميزات الجديدة والإضافات في المحتوى
- افهم التحسينات التي أُجريت على الوثائق الحالية
- تتبع إصلاحات الأخطاء والتصحيحات لضمان الدقة
- تابع تطور مواد التعلم مع مرور الوقت

## نتائج التعلم

بعد مراجعة مدخلات سجل التغييرات، ستكون قادرًا على:
- تحديد المحتوى والموارد الجديدة المتاحة للتعلم
- فهم الأقسام التي تم تحديثها أو تحسينها
- تخطيط مسار تعلمك بناءً على أحدث المواد
- المساهمة بملاحظات واقتراحات للتحسينات المستقبلية

## تاريخ الإصدارات

### [v3.22.0] - 2026-06-16

#### تعبئة الفجوات للمبتدئين #2: تأليف القوالب، حاويات التطوير، Pulumi، Azure DevOps، حسابات الخدمة، والمزيد
**يغلق هذا الإصدار الفجوات المتبقية على مستوى الوسيط التي أظهرها تحليل azd-coverage: كيفية تأليف ونشر قوالبك الخاصة، بيئات dev-container/Codespaces قابلة لإعادة الإنتاج، مزود البنية التحتية Pulumi، دليل عملي عن Azure DevOps CI/CD، مصادقة حسابات الخدمة، إرشادات اختيار المضيف (AKS/Spring Apps)، شروح `azd restore`/`azd package`، معالجة أخطاء الـ hooks، وممارسات الفريق/البيئات المشتركة.**

#### تمت الإضافة
- **🧱 درس جديد في الفصل 4** `docs/chapter-04-infrastructure/custom-templates.md` — تأليف قالب azd الخاص بك: الهيكل المطلوب (`azure.yaml`, `infra/`, `src/`)، حقل `metadata.template`، تمرير معلمات البنية التحتية باستخدام رمز المورد `uniqueString()` ووسم `azd-env-name`، الاختبار محليًا باستخدام `azd init --template <local-path>`, النشر على GitHub، وإرسالها إلى معرض Awesome AZD
- **📦 درس جديد في الفصل 1** `docs/chapter-01-foundation/dev-containers.md` — بيئات azd قابلة لإعادة الإنتاج باستخدام Dev Containers و GitHub Codespaces: ملف `.devcontainer/devcontainer.json` بسيط يستخدم ميزة `ghcr.io/azure/azure-dev/azd` الرسمية، ميزات خاصة بكل لغة، `docker-in-docker` لمضيفي الحاويات، و `azd auth login --use-device-code` لتسجيل الدخول عن بُعد
- **🧩 قسم Pulumi مع azd** في `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, تسلسل مجلدات Pulumi، stacks mapped to azd environments، المخرجات/الوسم المطلوبة، وعملية العمل المتماثلة `azd up` / `azd down`
- **🎯 إرشادات اختيار المضيف** في `docs/chapter-04-infrastructure/provisioning.md` — مقارنة موجهة للمبتدئين بين `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, و `springapp`, مع إرشادات حول متى تختار AKS أو Azure Spring Apps
- **🛠️ دليل Azure DevOps CI/CD** في `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, اتصال الخدمة مع توحيد هوية عبء العمل (OIDC), ملف `azure-dev.yml` المولد، وإعداد مجموعة المتغيرات
- **🔑 Service Principals (النمط 4)** أضيف إلى `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, `azd auth login` غير التفاعلي مع client secret مقابل بيانات اعتماد موحدة/OIDC، متى تستخدم، وتخزين بيانات الاعتماد بأمان
- **🪝 قسم فرعي لمعالجة أخطاء الـ hooks** في `docs/chapter-04-infrastructure/deployment-guide.md` — رموز الخروج و `set -e`, `continueOnError`, اختبار الهوكس بمعزل باستخدام `azd hooks run`, قذائف خاصة بنظام التشغيل، و `--debug`
- **👥 قسم الفريق / البيئات المشتركة** في `docs/chapter-03-configuration/configuration.md` — ما الذي يعيش في `.azure/`, ما الذي يجب تجاهله في gitignore, بيئات لكل مطور, `azd env list`/`select`, وتوفير قيم البيئة في CI/CD
- **🧰 شروحات `azd restore` و`azd package` الموسعة** في `resources/cheat-sheet.md` — استعادة التبعيات وبناء حزمة قابلة للنشر دون النشر

#### تم التغيير
- **🧭 جدول دروس الفصل 4** تم تحديثه ليشمل الدرس الجديد "تأليف قالبك الخاص" (الدرس 3)
- **🧭 جدول دروس الفصل 1** تم تحديثه ليشمل الدرس الجديد "Dev Containers & Codespaces" (الدرس 5); تذييلات التنقل موصلة بين `bring-your-own-app.md` و `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### تعبئة فجوات المبتدئين: درس عملي متعدد الوكلاء، "أحضر تطبيقك الخاص"، Terraform، ودليل CI/CD
**يغلق هذا الإصدار أكبر الفجوات لدليل المبتدئين الكامل بإضافة درسين عمليين جديدين (درس عملي لنشر متعدد الوكلاء وإضافة azd إلى تطبيق موجود)، مقدمة ودودة للمبتدئين عن الهوكس، قسم Terraform مع azd، دليل خطوة بخطوة لأنبوب GitHub Actions، شرح للإضافات المعاينة الجديدة، وقائمة تحقق صريحة للتحقق من النشر.**

#### تمت الإضافة
- **🤝 درس جديد في الفصل 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — درس عملي بالكامل وقابل للنشر لوكيلين (منسق + متخصصون) باستخدام قالب حقيقي (`contoso-creative-writer`), يغطي متى تستخدم تعدد الوكلاء، سير عمل `azd up`, فهم الموارد المنشورة، تتبع عبر الوكلاء، التخصيص، والتنظيف
- **📦 درس جديد في الفصل 1** `docs/chapter-01-foundation/bring-your-own-app.md` — كيفية إضافة azd إلى مشروع قائم باستخدام `azd init` ("use code in the current directory"), فهم `azure.yaml` و `infra/`, `azd infra generate`, اكتشاف المضيف، والنشر باستخدام `azd up`
- **🌐 Terraform مع azd** تم إضافة قسم إلى `docs/chapter-04-infrastructure/provisioning.md` — تكوين `infra.provider: terraform`, تخطيط مجلد `.tf`, المخرجات المطلوبة `AZURE_*` وووسم `azd-env-name`, وعملية العمل المتماثلة `azd up` / `azd down` (يغلق الفجوة حيث ذُكر دعم Terraform لكن تم عرض Bicep فقط)
- **⚙️ دليل خطوة بخطوة لـ GitHub Actions** في `docs/chapter-08-production/production-ai-practices.md` — من مستودع GitHub إلى عمليات النشر الآلية: `azd pipeline config`, بيانات اعتماد موحدة OIDC (لا أسرار مخزنة), ملف `azure-dev.yml` المولد، وإرشادات حول الأسرار مقابل المتغيرات
- **🪝 مقدمة للمبتدئين "جديد على الهوكس؟"** في `docs/chapter-04-infrastructure/deployment-guide.md` — ما هو الـ hook، جدول لمراحل الهوكس، أول hook بسيط، وتشغيل الهوكس يدويًا باستخدام `azd hooks run`
- **✅ قائمة التحقق "تحقق من نشرِك"** أُضيفت إلى الخطوة 5 من `docs/chapter-01-foundation/first-project.md` — اختبار سريع (smoke test), فحص نقطة صحة، ومعايير نجاح صريحة
- **🧩 شرح للإضافات المعاينة الجديدة** `azure.ai.skills` و `azure.ai.connections` (ما هي ومتى تُستخدم) في `docs/chapter-08-production/production-ai-practices.md`

#### تغييرات
- **🧭 جدول دروس الفصل 5** تم تصحيحه: `multi-agent-basics.md` أصبح الآن الدرس 1 (الدرس الوحيد العملي بالكامل)، مع وسم صريح أن الدرس 2 موجود في الفصل 6 وأن سيناريو التجزئة هو مخطط معماري، وليس قالبًا يُنَفَّذ بأمر واحد
- **🧭 جدول دروس الفصل 1** الآن يتضمن الدرس الجديد "أحضر تطبيقك الخاص" (الدرس 4)
- **🔗 تذييلات التنقل** تم تحديثها: `first-project.md` الآن تربط إلى `bring-your-own-app.md`

#### تم الإصلاح
- **🧱 إغلاق فجوة "مذكور لكن مفقود" لـ Terraform** — كانت الدورة تشير سابقًا إلى دعم Terraform دون عرضه
- **🔀 تصحيح الروابط المتقاطعة المضللة في الفصل 5** التي أوحت بوجود تنفيذ متعدد الوكلاء كامل بينما كان هناك مجرد مخطط معماري

#### الملفات المحدثة
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(new)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(new)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### تحديث AZD 1.25.6، أوامر دورة حياة الوكيل الكاملة وإعادة تسمية Aspire
**يعيد هذا الإصدار التحقق من صحة الدورة مقابل `azd` `1.25.6` (يونيو 2026) والإضافة `azure.ai.agents` `0.1.40-preview`، ويوسع إرشادات الذكاء الاصطناعي من "scaffold an agent" إلى دورة حياة الوكيل الكاملة (تهيئة → اختبار → قياس → تحسين → فحص → تنظيف)، ويبرز الإضافات المعاينة الجديدة `azure.ai.skills` و `azure.ai.connections`، ويذكر إعادة تسمية المنتج من ".NET Aspire" إلى "Aspire".**

#### تمت الإضافة
- **🔁 تغطية دورة حياة الوكيل الكاملة** للمبتدئين ومهندسي الذكاء الاصطناعي عبر الوثائق:
  - `docs/chapter-01-foundation/azd-basics.md` — أضيف جدول دورة الحياة (تهيئة → اختبار → قياس → تحسين → فحص → تنظيف) إلى قسم الإضافات وأوامر الذكاء الاصطناعي
  - `docs/chapter-08-production/production-ai-practices.md` — قسم جديد "إدارة دورة حياة الوكيل" يغطي `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, و `delete --force`
  - `resources/cheat-sheet.md` — أوامر وكيل الذكاء الاصطناعي الموسعة مع `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, و `delete --force`
- **🧩 توثيق الإضافات المعاينة الجديدة**: `azure.ai.skills` (مهارات الوكيل القابلة لإعادة الاستخدام) و `azure.ai.connections` (اتصالات Foundry) أُضيفت إلى جدول الإضافات والـ cheat sheet
- **⏱️ إرشادات توقيت الاستجابة** — أمثلة `azd ai agent invoke` توضح الآن أنها تعرض الكمون الإجمالي ووقت الوصول لأول بايت
- **📌 لافتة الإصدار** في README الجذري تشير للمتعلمين إلى `azd version` و `azd upgrade`

#### تغييرات
- **✅ تحديث خط الأساس للتحقق** من `azd 1.23.12` (مارس 2026) إلى `azd 1.25.6` (يونيو 2026) عبر جميع README للفصول ووثائق الورشة
- **🤖 ملاحظة امتداد الفصل 2** تم تحديثها من `azure.ai.agents` `0.1.18-preview` إلى `0.1.40-preview`
- **🧪 مثال تحقق الورشة** (مخرجات `azd version`) تم تحديثه إلى `1.25.6`
- **🧭 README "What's New in azd Today"** تم تحديثه لتسليط الضوء على دورة حياة الوكيل الشاملة، الإضافات الجديدة للذكاء الاصطناعي، وإصلاحات جودة الحياة الأخيرة (`azd init` قابلية التكرار (idempotency), `azd auth login` تنظيف الرموز المميزة القديمة, موجه التشغيل الأول لـ `azd tool`)
- **📖 Chapter 2 agents.md (الخيار 4)** الآن يوجّه المتعلمين إلى أوامر دورة الحياة بعد النشر بدلاً من التوقف عند `azd up`

#### تم الإصلاح
- **🏷️ تسمية المنتج** — أضيفت ملاحظة إعادة تسمية Aspire (".NET Aspire" أصبحت ببساطة "Aspire"); دعم azd لـ Aspire لم يتغير
- **🔎 التحقق من الإصدارات الحية** تم تأكيده مقابل تغذية إصدارات Azure Developer CLI: CLI المستقر `1.25.6` (2026-06-12) و `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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
#### توضيح بدء التشغيل للمبتدئين، التحقق من الإعداد وتنظيف أمر AZD النهائي
**يتابع هذا الإصدار فحص التحقق من AZD 1.23 مع تمريرة توثيق موجهة للمبتدئين: يوضح إرشادات المصادقة المبنية على AZD أولاً، ويضيف سكربتات تحقق محلية من الإعداد، ويتحقق من الأوامر الرئيسية مقابل واجهة سطر أوامر AZD الحية، ويزيل آخر مراجع أوامر مصدرها الإنجليزية القديمة خارج سجل التغييرات.**

#### تمت الإضافة
- **🧪 سكربتات تحقق إعداد المبتدئين** مع `validate-setup.ps1` و `validate-setup.sh` حتى يستطيع المتعلمون التأكد من الأدوات المطلوبة قبل بدء الفصل 1
- **✅ خطوات تحقق الإعداد المسبقة** في README الجذر وREADME الفصل 1 بحيث يتم اكتشاف المتطلبات المسبقة المفقودة قبل `azd up`

#### تم التغيير
- **🔐 إرشادات مصادقة المبتدئين** الآن تعامل `azd auth login` باستمرار كالمسار الأساسي لتدفقات عمل AZD، مع التنويه إلى `az login` كخيار اختياري ما لم تُستخدم أوامر Azure CLI مباشرة
- **📚 مسار بدء الفصل 1** الآن يوجه المتعلمين للتحقق من إعدادهم المحلي قبل التثبيت والمصادقة وخطوات النشر الأولى
- **🛠️ رسائل أداة التحقق** الآن تفرق بوضوح بين المتطلبات الحرجة والتحذيرات الاختيارية الخاصة بـ Azure CLI لمسار المبتدئين المعتمد على AZD فقط
- **📖 التهيئة واستكشاف الأخطاء ووثائق الأمثلة** الآن تميز بين مصادقة AZD المطلوبة وتسجيل الدخول الاختياري إلى Azure CLI حيثما كان كلاهما معروضين سابقًا بدون سياق

#### تم الإصلاح
- **📋 مراجع أوامر مصدرها الإنجليزية المتبقية** محدثة إلى صيغ AZD الحالية، بما في ذلك `azd config show` في ورقة الغش و `azd monitor --overview` حيث كان المقصود دليل نظرة عامة في بوابة Azure
- **🧭 ادعاءات المبتدئين في الفصل 1** تم تخفيفها لتجنب المبالغة في الوعد بعدم حدوث أخطاء أو سلوك التراجع المضمون عبر جميع القوالب وموارد Azure
- **🔎 التحقق الحي من سطر الأوامر** أكد الدعم الحالي لـ `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, و `azd down --force --purge`

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

#### التحقق من AZD 1.23.12، توسيع بيئة ورشة العمل وتحديث نماذج الذكاء الاصطناعي
**يقوم هذا الإصدار بتمرير فحص التوثيق مقابل `azd` `1.23.12`، يحدّث أمثلة أوامر AZD القديمة، يجدد إرشادات نماذج الذكاء الاصطناعي إلى الافتراضات الحالية، ويوسع تعليمات الورشة لتدعم حاويات التطوير والنسخ المحلية بالإضافة إلى GitHub Codespaces.**

#### تمت الإضافة
- **✅ ملاحظات التحقق عبر الفصول الأساسية ووثائق الورشة** لجعل خط الأساس لـ AZD المختبر صريحًا للمتعلمين الذين يستخدمون إصدارات واجهة سطر الأوامر الأحدث أو الأقدم
- **⏱️ إرشادات مهلة النشر** لنشر تطبيقات الذكاء الاصطناعي طويلة التشغيل باستخدام `azd deploy --timeout 1800`
- **🔎 خطوات فحص الإضافات** مع `azd extension show azure.ai.agents` في وثائق سير عمل الذكاء الاصطناعي
- **🌐 إرشادات أوسع لبيئة الورشة** تغطي GitHub Codespaces، حاويات التطوير، والنسخ المحلية مع MkDocs

#### تم التغيير
- **📚 README مقدمات الفصول** الآن تشير باستمرار إلى التحقق مقابل `azd 1.23.12` عبر أقسام الأساس، التهيئة، البنية التحتية، تعدد الوكلاء، ما قبل النشر، استكشاف الأخطاء، والإنتاج
- **🛠️ مراجع أوامر AZD** محدثة إلى الأشكال الحالية عبر الوثائق:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` أو `azd env get-value(s)` اعتمادًا على السياق
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` حيث المقصود نظرة عامة على Application Insights
- **🧪 أمثلة معاينة التهيئة** مُبسطة لاستخدام مدعوم حاليًا مثل `azd provision --preview` و `azd provision --preview -e production`
- **🧭 تدفق الورشة** محدث حتى يتمكن المتعلمون من إكمال المختبرات في Codespaces أو حاوية تطوير أو نسخة محلية بدلاً من افتراض التنفيذ عبر Codespaces فقط
- **🔐 إرشادات المصادقة** تفضل الآن `azd auth login` لتدفقات عمل AZD، مع وضع `az login` كخيار عند استخدام أوامر Azure CLI مباشرة

#### تم الإصلاح
- **🪟 أوامر التثبيت في Windows** تم توحيدها إلى حالة حزمة `winget` الحالية في دليل التثبيت
- **🐧 إرشادات التثبيت على Linux** صُححت لتجنب تعليمات مديري حزم `azd` الخاصة بتوزيعات غير المدعومة وتشير بدلاً من ذلك إلى أصول الإصدارات عند الاقتضاء
- **📦 أمثلة نماذج الذكاء الاصطناعي** جُددت من الإفتراضات القديمة مثل `gpt-35-turbo` و `text-embedding-ada-002` إلى أمثلة حالية مثل `gpt-4.1-mini`, `gpt-4.1`, و `text-embedding-3-large`
- **📋 مقتطفات النشر والتشخيص** صُححت لاستخدام أوامر البيئة والحالة الحالية في السجلات والسكربتات وخطوات استكشاف الأخطاء
- **⚙️ إرشادات GitHub Actions** محدثة من `Azure/setup-azd@v1.0.0` إلى `Azure/setup-azd@v2`
- **🤖 إرشادات موافقة MCP/Copilot** محدثة من `azd mcp consent` إلى `azd copilot consent list`

#### تحسن
- **🧠 إرشادات فصل الذكاء الاصطناعي** الآن تشرح بشكل أفضل سلوك `azd ai` الحساس للمعاينة، تسجيل الدخول المرتبط بالمستأجر، استخدام الإضافات الحالي، وتوصيات نشر النموذج المحدثة
- **🧪 تعليمات الورشة** الآن تستخدم أمثلة إصدار أكثر واقعية ولغة إعداد بيئة أوضح للمختبرات العملية
- **📈 مستندات الإنتاج واستكشاف الأخطاء** الآن تتوافق بشكل أفضل مع أمثلة المراقبة، نموذج fallback، ومستويات التكلفة الحالية

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

#### أوامر AZD AI CLI، التحقق من المحتوى وتوسيع القوالب
**يضيف هذا الإصدار تغطية أوامر `azd ai`, `azd extension`, و `azd mcp` عبر جميع الفصول المتعلقة بالذكاء الاصطناعي، يصلح الروابط المعطلة والشيفرات المهجورة في agents.md، يحدّث ورقة الغش، ويعيد تشكيل قسم قوالب الأمثلة بأوصاف محققة وقوالب AZD الجديدة الخاصة بـ Azure AI.**

#### تمت الإضافة
- **🤖 تغطية أوامر AZD AI CLI** عبر 7 ملفات (كانت سابقًا فقط في الفصل 8):
  - `docs/chapter-01-foundation/azd-basics.md` — قسم جديد "الإضافات وأوامر الذكاء الاصطناعي" يقدم `azd extension`, `azd ai agent init`, و `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — الخيار 4: `azd ai agent init` مع جدول مقارنة (نهج القالب مقابل نهج المانيفست)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — أقسام "إضافات AZD لـ Foundry" و "نشر يعتمد على الوكيل" الفرعية
  - `docs/chapter-05-multi-agent/README.md` — بدء سريع يعرض الآن مسارات النشر المعتمدة على القالب والمانيفست
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — قسم النشر يتضمن الآن خيار `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — قسم فرعي "أوامر إضافة AZD AI للتشخيص"
  - `resources/cheat-sheet.md` — قسم جديد "أوامر AI والإضافات" مع `azd extension`, `azd ai agent init`, `azd mcp`, و `azd infra generate`
- **📦 قوالب أمثلة AZD AI جديدة** في `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — دردشة RAG بـ .NET مع Blazor WebAssembly، Semantic Kernel، ودعم الدردشة الصوتية
  - **azure-search-openai-demo-java** — دردشة RAG بجافا باستخدام Langchain4J مع خيارات نشر ACA/AKS
  - **contoso-creative-writer** — تطبيق كتابة إبداعية متعدد الوكلاء يستخدم Azure AI Agent Service، Bing Grounding، و Prompty
  - **serverless-chat-langchainjs** — RAG بدون خادم باستخدام Azure Functions + LangChain.js + Cosmos DB مع دعم تطوير محلي عبر Ollama
  - **chat-with-your-data-solution-accelerator** — مسراع حلول RAG للمؤسسات مع بوابة إدارة، تكامل Teams، وخيارات PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — تطبيق مرجعي لتنظيم MCP متعدد الوكلاء مع خوادم بـ .NET، Python، Java، و TypeScript
  - **azd-ai-starter** — قالب بدء بنيّة تحتية Azure AI صغير مع Bicep
  - **🔗 رابط معرض Awesome AZD AI** — إشارة إلى [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (أكثر من 80 قالبًا)

#### تم الإصلاح
- **🔗 تنقل agents.md**: روابط السابق/التالي الآن تطابق ترتيب دروس README الفصل 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 روابط agents.md المعطلة**: تم تصحيح `production-ai-practices.md` إلى `../chapter-08-production/production-ai-practices.md` (3 حالات)
- **📦 شيفرة agents.md المهجورة**: استبدال `opencensus` بـ `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 واجهة برمجة تطبيقات agents.md غير الصحيحة**: تم نقل `max_tokens` من `create_agent()` إلى `create_run()` كـ `max_completion_tokens`
- **🔢 عدّ الرموز في agents.md**: استبدال تقدير تقريبي `len//4` بـ `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: تصحيح الخدمات من "Cognitive Search + App Service" إلى "Azure AI Search + Azure Container Apps" (المضيف الافتراضي تغير في أكتوبر 2024)
- **contoso-chat**: تحديث الوصف للإشارة إلى Azure AI Foundry + Prompty، لمطابقة عنوان المستودع الفعلي وتكديس التكنولوجيا

#### تمت الإزالة
- **ai-document-processing**: إزالة إشارة قالب غير عاملة (المستودع غير متاح علنًا كقالب AZD)

#### تحسن
- **📝 تمارين agents.md**: التمرين 1 يعرض الآن المخرجات المتوقعة وخطوة `azd monitor`; التمرين 2 يتضمن كود تسجيل كامل لـ `FunctionTool`; التمرين 3 يستبدل الإرشادات الغامضة بأوامر `prepdocs.py` محددة
- **📚 موارد agents.md**: تحديث روابط التوثيق إلى مستندات Azure AI Agent Service والبدء السريع الحالية
- **📋 جدول الخطوات التالية في agents.md**: إضافة رابط مختبر ورشة الذكاء الاصطناعي لتغطية الفصل الكامل

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
#### تحسين تنقّل المقرر
**تعمل هذه النسخة على تحسين تنقّل فصول README.md باستخدام تنسيق جدول محسّن.**

#### تغييرات
- **جدول خريطة الدورة**: تم تحسينه بروابط دروس مباشرة، تقديرات للمدة، وتقييمات التعقيد
- **تنظيف المجلدات**: تمت إزالة المجلدات القديمة والمتكررة (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **التحقق من الروابط**: تم التحقق من جميع الروابط الداخلية (>21) في جدول خريطة الدورة

### [v3.16.0] - 2026-02-05

#### تحديثات أسماء المنتجات
**تعمل هذه النسخة على تحديث الإشارات إلى المنتجات لتعكس العلامة التجارية الحالية لشركة Microsoft.**

#### تغييرات
- **Microsoft Foundry → Microsoft Foundry**: تم تحديث جميع الإشارات عبر الملفات غير المترجمة
- **Azure AI Agent Service → Foundry Agents**: تم تحديث اسم الخدمة ليعكس العلامة التجارية الحالية

#### الملفات المحدثة
- `README.md` - صفحة الهبوط الرئيسية للمقرر
- `changelog.md` - سجل الإصدارات
- `course-outline.md` - هيكل المقرر
- `docs/chapter-02-ai-development/agents.md` - دليل وكلاء الذكاء الاصطناعي
- `examples/README.md` - توثيق الأمثلة
- `workshop/README.md` - صفحة الهبوط للورشة
- `workshop/docs/index.md` - فهرس الورشة
- `workshop/docs/instructions/*.md` - جميع ملفات تعليمات الورشة

---

### [v3.15.0] - 2026-02-05

#### إعادة هيكلة المستودع الرئيسية: أسماء المجلدات مرتبة حسب الفصل
**تعيد هذه النسخة هيكلة التوثيق إلى مجلدات مخصصة لكل فصل لتسهيل التنقل.**

#### إعادة تسمية المجلدات
تم استبدال المجلدات القديمة بمجلدات مرقّمة حسب الفصول:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- تمت الإضافة: `docs/chapter-05-multi-agent/`

#### هجرة الملفات
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
| All pre-deployment files | pre-deployment/ | chapter-06-pre-deployment/ |
| All troubleshooting files | troubleshooting/ | chapter-07-troubleshooting/ |

#### تمت الإضافة
- **📚 ملفات README لكل فصل**: تم إنشاء README.md في كل مجلد فصل يتضمن:
  - أهداف التعلم والمدة
  - جدول الدروس مع الأوصاف
  - أوامر البدء السريع
  - توجيهات للتنقل إلى الفصول الأخرى

#### تغييرات
- **🔗 تم تحديث جميع الروابط الداخلية**: تم تحديث أكثر من 78 مسارًا عبر جميع ملفات التوثيق
- **🗺️ README.md الرئيسي**: تم تحديث خريطة الدورة مع هيكل الفصول الجديد
- **📝 examples/README.md**: تم تحديث المراجع المتقاطعة إلى مجلدات الفصول

#### تمت الإزالة
- هيكل المجلدات القديم (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### إعادة هيكلة المستودع: تنقّل الفصول
**أضافت هذه النسخة ملفات README للتنقّل بين الفصول (تم استبدالها بواسطة v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### دليل وكلاء الذكاء الاصطناعي الجديد
**تضيف هذه النسخة دليلًا شاملاً لنشر وكلاء الذكاء الاصطناعي باستخدام Azure Developer CLI.**

#### تمت الإضافة
- **🤖 docs/microsoft-foundry/agents.md**: دليل كامل يغطي:
  - ما هي وكلاء الذكاء الاصطناعي وكيف تختلف عن الدردشة الآلية (chatbots)
  - ثلاثة قوالب بدء سريعة للوكلاء (Foundry Agents, Prompty, RAG)
  - أنماط بنية الوكلاء (وكيل واحد، RAG، متعدد الوكلاء)
  - تكوين الأدوات والتخصيص
  - المراقبة وتتبع القياسات
  - اعتبارات التكلفة والتحسين
  - سيناريوهات استكشاف الأخطاء الشائعة
  - ثلاث تدريبات عملية مع معايير النجاح

#### بنية المحتوى
- **المقدمة**: مفاهيم الوكلاء للمبتدئين
- **البدء السريع**: نشر الوكلاء باستخدام `azd init --template get-started-with-ai-agents`
- **أنماط البنية**: مخططات مرئية لأنماط الوكلاء
- **التكوين**: إعداد الأدوات والمتغيرات البيئية
- **المراقبة**: تكامل Application Insights
- **التدريبات**: تعلم عملي تدريجي (20-45 دقيقة لكل واحدة)

---

### [v3.12.0] - 2026-02-05

#### تحديث بيئة DevContainer
**تعمل هذه النسخة على تحديث تكوين حاوية التطوير بأدوات حديثة وإعدادات أفضل لتجربة تعلم AZD.**

#### تغييرات
- **🐳 صورة الأساس**: تم التحديث من `python:3.12-bullseye` إلى `python:3.12-bookworm` (أحدث نسخة مستقرة من Debian)
- **📛 اسم الحاوية**: تم إعادة التسمية من "Python 3" إلى "AZD for Beginners" لمزيد من الوضوح

#### تمت الإضافة
- **🔧 ميزات جديدة في Dev Container**:
  - `azure-cli` مع دعم Bicep مفعّل
  - `node:20` (إصدار LTS لقوالب AZD)
  - `github-cli` لإدارة القوالب
  - `docker-in-docker` لنشر تطبيقات الحاويات

- **🔌 إعادة توجيه المنافذ**: تم تهيئة المنافذ مسبقًا للتطوير الشائع:
  - 8000 (معاينة MkDocs)
  - 3000 (تطبيقات الويب)
  - 5000 (Python Flask)
  - 8080 (واجهات برمجة التطبيقات)

- **🧩 ملحقات VS Code الجديدة**:
  - `ms-python.vscode-pylance` - تحسين تكملة Python الذكية
  - `ms-azuretools.vscode-azurefunctions` - دعم Azure Functions
  - `ms-azuretools.vscode-docker` - دعم Docker
  - `ms-azuretools.vscode-bicep` - دعم لغة Bicep
  - `ms-azure-devtools.azure-resource-groups` - إدارة موارد Azure
  - `yzhang.markdown-all-in-one` - تحرير Markdown
  - `DavidAnson.vscode-markdownlint` - فحص جودة Markdown
  - `bierner.markdown-mermaid` - دعم مخططات Mermaid
  - `redhat.vscode-yaml` - دعم YAML (لـ azure.yaml)
  - `eamodio.gitlens` - تصور Git
  - `mhutchie.git-graph` - تاريخ Git

- **⚙️ إعدادات VS Code**: أُضيفت إعدادات افتراضية لمترجم Python، والتنسيق عند الحفظ، وإزالة المسافات البيضاء الزائدة

- **📦 تحديث requirements-dev.txt**:
  - أُضيف ملحق تصغير MkDocs
  - أُضيف pre-commit لجودة الكود
  - أُضيفت حزم Azure SDK (azure-identity, azure-mgmt-resource)

#### تم الإصلاح
- **أمر ما بعد الإنشاء**: الآن يتحقق من تثبيت AZD و Azure CLI عند بدء الحاوية

---

### [v3.11.0] - 2026-02-05

#### إعادة تصميم README لتكون صديقة للمبتدئين
**تحسّن هذه النسخة بشكل كبير README.md لتكون أكثر قابلية للوصول للمبتدئين وتضيف موارد أساسية لمطوري الذكاء الاصطناعي.**

#### تمت الإضافة
- **🆚 مقارنة Azure CLI مقابل AZD**: شرح واضح لمتى يجب استخدام كل أداة مع أمثلة عملية
- **🌟 روابط رائعة لـ AZD**: روابط مباشرة إلى معرض قوالب المجتمع وموارد المساهمة:
  - [معرض Awesome AZD](https://azure.github.io/awesome-azd/) - أكثر من 200 قالب جاهز للنشر
  - [إرسال قالب](https://github.com/Azure/awesome-azd/issues) - مساهمة المجتمع
- **🎯 دليل البدء السريع**: قسم مبسّط من 3 خطوات للبدء (التثبيت → تسجيل الدخول → النشر)
- **📊 جدول تنقّل مبني على التجربة**: إرشادات واضحة عن أين تبدأ بناءً على خبرة المطوّر

#### تغييرات
- **هيكلة README**: إعادة تنظيم للكشف التدريجي - المعلومات الأساسية أولًا
- **قسم المقدمة**: إعادة كتابة لشرح "سحر `azd up`" للمبتدئين تمامًا
- **إزالة المحتوى المكرر**: إلغاء قسم استكشاف الأخطاء المكرر
- **أوامر استكشاف الأخطاء**: تم إصلاح إشارة `azd logs` لاستخدام الأمر الصحيح `azd monitor --logs`

#### تم الإصلاح
- **🔐 أوامر المصادقة**: أُضيفت `azd auth login` و `azd auth logout` إلى cheat-sheet.md
- **مراجع أوامر غير صحيحة**: تم إزالة أي بقايا من `azd logs` من قسم استكشاف الأخطاء في README

#### ملاحظات
- **النطاق**: طُبقت التغييرات على README.md الرئيسي و resources/cheat-sheet.md
- **الجمهور المستهدف**: تحسينات موجهة خصيصًا للمطورين الجدد على AZD

---

### [v3.10.0] - 2026-02-05

#### تحديث دقة أوامر Azure Developer CLI
**تصحّح هذه النسخة الأوامر غير الموجودة في وثائق AZD، مما يضمن أن جميع أمثلة الكود تستخدم تركيبًا صالحًا لأداة Azure Developer CLI.**

#### تم الإصلاح
- **🔧 إزالة الأوامر غير الموجودة في AZD**: تدقيق شامل وتصحيح للأوامر غير الصحيحة:
  - `azd logs` (غير موجود) → استبداله بـ `azd monitor --logs` أو بدائل Azure CLI
  - أوامر فرعية `azd service` (غير موجودة) → استبدالها بـ `azd show` و Azure CLI
  - `azd infra import/export/validate` (غير موجودة) → إزالتها أو استبدالها ببدائل صحيحة
  - أعلام `azd deploy --rollback/--incremental/--parallel/--detect-changes` (غير موجودة) → إزالتها
  - أعلام `azd provision --what-if/--rollback` (غير موجودة) → التحديث لاستخدام `--preview`
  - `azd config validate` (غير موجود) → استبداله بـ `azd config list`
  - `azd info`, `azd history`, `azd metrics` (غير موجودة) → إزالتها

- **📚 الملفات المحدثة مع تصحيحات الأوامر**:
  - `resources/cheat-sheet.md`: مراجعة شاملة لدليل الأوامر
  - `docs/deployment/deployment-guide.md`: إصلاح استراتيجيات التراجع والنشر
  - `docs/troubleshooting/debugging.md`: تصحيح أقسام تحليل السجلات
  - `docs/troubleshooting/common-issues.md`: تحديث أوامر استكشاف الأخطاء
  - `docs/troubleshooting/ai-troubleshooting.md`: إصلاح قسم تصحيح أخطاء AZD
  - `docs/getting-started/azd-basics.md`: تصحيح أوامر المراقبة
  - `docs/getting-started/first-project.md`: تحديث أمثلة المراقبة والتصحيح
  - `docs/getting-started/installation.md`: تصحيح أمثلة المساعدة والإصدار
  - `docs/pre-deployment/application-insights.md`: تصحيح أوامر عرض السجلات
  - `docs/pre-deployment/coordination-patterns.md`: تصحيح أوامر تصحيح الوكلاء

- **📝 تحديث مرجع الإصدار**:
  - `docs/getting-started/installation.md`: تغيير الإصدار الثابت `1.5.0` إلى عام `1.x.x` مع رابط إلى الإصدارات

#### تغييرات
- **استراتيجيات التراجع**: تحديث الوثائق لاستخدام التراجع المعتمد على Git (AZD لا يحتوي على تراجع أصلي)
- **عرض السجلات**: استبدال إشارات `azd logs` بـ `azd monitor --logs`، `azd monitor --live`، وأوامر Azure CLI
- **قسم الأداء**: إزالة أعلام النشر المتوازية/التزايدية غير الموجودة، وتقديم بدائل صحيحة

#### التفاصيل التقنية
- **أوامر AZD الصالحة**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **أعلام azd monitor الصالحة**: `--live`, `--logs`, `--overview`
- **الميزات المزالة**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### ملاحظات
- **التحقق**: تم التحقق من الأوامر مقابل Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### اكتمال الورشة وتحسين جودة الوثائق
**تُكمل هذه النسخة الوحدات التفاعلية للورشة، تصلّح جميع الروابط المعطلة في التوثيق، وتحسّن جودة المحتوى لمطوري الذكاء الاصطناعي الذين يستخدمون Microsoft AZD.**

#### تمت الإضافة
- **📝 CONTRIBUTING.md**: مستند إرشادات المساهمة الجديد يتضمّن:
  - تعليمات واضحة للإبلاغ عن المشكلات واقتراح التغييرات
  - معايير توثيق للمحتوى الجديد
  - إرشادات أمثلة الشيفرة واتفاقيات رسائل الالتزام
  - معلومات التفاعل مع المجتمع

#### المكتمل
- **🎯 وحدة ورشة العمل 7 (الخاتمة)**: أكملت وحدة الخاتمة بالكامل مع:
  - ملخص شامل لإنجازات الورشة
  - قسم المفاهيم الرئيسية المتقنة يغطي AZD والقوالب وMicrosoft Foundry
  - توصيات لمواصلة رحلة التعلم
  - تمارين تحدي الورشة مع تقييمات مستوى الصعوبة
  - روابط ملاحظات المجتمع والدعم

- **📚 وحدة ورشة العمل 3 (التفكيك)**: تم تحديث أهداف التعلم مع:
  - توجيهات تفعيل GitHub Copilot مع خوادم MCP
  - فهم هيكل مجلد قوالب AZD
  - أنماط تنظيم Infrastructure-as-code (Bicep)
  - تعليمات المختبر العملي

- **🔧 وحدة ورشة العمل 6 (تفكيك الموارد)**: مكتملة مع:
  - أهداف تنظيف الموارد وإدارة التكلفة
  - استخدام `azd down` لإيقاف نشر البنية التحتية بأمان
  - إرشادات استرداد خدمات الإدراك المحذوفة مؤقتًا
  - مطالبات استكشافية إضافية لـ GitHub Copilot وAzure Portal

#### تم الإصلاح
- **🔗 إصلاح روابط معطلة**: تم حل أكثر من 15 رابطًا داخليًا معطلاً في الوثائق:
  - `docs/ai-foundry/ai-model-deployment.md`: تم إصلاح المسارات إلى microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: تم تصحيح مسارات ai-model-deployment.md و production-ai-practices.md
  - `docs/getting-started/first-project.md`: تم استبدال cicd-integration.md غير الموجودة بـ deployment-guide.md
  - `examples/retail-scenario.md`: تم إصلاح مسارات الأسئلة الشائعة ودليل استكشاف الأخطاء
  - `examples/container-app/microservices/README.md`: تم تصحيح مسارات صفحة الدورة ودليل النشر
  - `resources/faq.md` و `resources/glossary.md`: تم تحديث مراجع فصل الذكاء الاصطناعي
  - `course-outline.md`: تم تصحيح مراجع دليل المدرب ومختبر ورشة العمل الخاصة بالذكاء الاصطناعي

- **📅 لافتة حالة الورشة**: تم التحديث من "قيد الإنشاء" إلى حالة الورشة النشطة بتاريخ February 2026

- **🔗 تنقل الورشة**: تم إصلاح روابط التنقل المعطلة في README.md للورشة التي كانت تشير إلى المجلد غير الموجود lab-1-azd-basics

#### تم التغيير
- **عرض الورشة التقديمي**: تمت إزالة تحذير "قيد الإنشاء"، الورشة الآن مكتملة وجاهزة للاستخدام
- **تناسق التنقل**: تم التأكد من أن جميع وحدات الورشة لديها تنقل بين الوحدات صحيح
- **مراجع مسار التعلم**: تم تحديث المراجع الفصلية المتقاطعة لاستخدام مسارات microsoft-foundry الصحيحة

#### تم التحقق
- ✅ جميع ملفات Markdown الإنجليزية تحتوي على روابط داخلية صالحة
- ✅ وحدات الورشة 0-7 مكتملة بأهداف التعلم
- ✅ التنقل بين الفصول والوحدات يعمل بشكل صحيح
- ✅ المحتوى مناسب لمطوري الذكاء الاصطناعي الذين يستخدمون Microsoft AZD
- ✅ لغة وبنية مناسبة للمبتدئين مع الحفاظ على الوضوح
- ✅ يوفر CONTRIBUTING.md إرشادات واضحة للمساهمين من المجتمع

#### التنفيذ الفني
- **التحقق من الروابط**: سكربت PowerShell آلي تحقق من جميع روابط .md الداخلية
- **تدقيق المحتوى**: مراجعة يدوية لاكتمال الورشة ومدى ملاءمتها للمبتدئين
- **نظام التنقل**: تطبيق أنماط تنقل متسقة للفصول والوحدات

#### ملاحظات
- **النطاق**: التغييرات طُبقت على الوثائق الإنجليزية فقط
- **الترجمات**: مجلدات الترجمات لم يتم تحديثها في هذا الإصدار (المزامنة التلقائية للترجمات ستتم لاحقًا)
- **مدة الورشة**: الورشة المكتملة توفر الآن 3-4 ساعات من التعلم العملي

---

### [v3.8.0] - 2025-11-19

#### توثيق متقدم: المراقبة والأمان وأنماط التنسيق متعدد الوكلاء
**تضيف هذه النسخة دروسًا متقدمة شاملة من الفئة A حول تكامل Application Insights، وأنماط المصادقة، وتنسيق تعدد الوكلاء لنشر الإنتاج.**

#### تمت الإضافة
- **📊 درس تكامل Application Insights**: في `docs/pre-deployment/application-insights.md`:
  - نشر موجه لـ AZD مع توفير تلقائي
  - قوالب Bicep كاملة لـ Application Insights + Log Analytics
  - تطبيقات Python عملية مع قياسات مخصصة (أكثر من 1,200 سطر)
  - أنماط مراقبة AI/LLM (تتبع رموز/تكلفة نماذج Microsoft Foundry)
  - 6 مخططات Mermaid (الهيكل المعماري، التتبع الموزع، تدفق القياسات)
  - 3 تمارين عملية (التنبيهات، لوحات المعلومات، مراقبة AI)
  - أمثلة استعلام Kusto واستراتيجيات تحسين التكلفة
  - بث مقاييس مباشر وتصحيح أخطاء في الوقت الحقيقي
  - وقت تعلم متوقع 40-50 دقيقة مع أنماط جاهزة للإنتاج

- **🔐 درس أنماط المصادقة والأمان**: في `docs/getting-started/authsecurity.md`:
  - 3 أنماط مصادقة (سلاسل الاتصال، Key Vault، Managed Identity)
  - قوالب بنية تحتية Bicep كاملة للنشر الآمن
  - كود تطبيق Node.js مع تكامل Azure SDK
  - 3 تمارين كاملة (تمكين Managed Identity، User-assigned identity، تدوير Key Vault)
  - ممارسات أمان وأطر عمل RBAC
  - دليل استكشاف الأخطاء وتحليل التكلفة
  - أنماط مصادقة بدون كلمات مرور جاهزة للإنتاج

- **🤖 درس أنماط تنسيق تعدد الوكلاء**: في `docs/pre-deployment/coordination-patterns.md`:
  - 5 أنماط تنسيق (تسلسلي، متوازي، هرمي، مدفوع بالأحداث، إجماع)
  - تنفيذ خدمة منسق كامل (Python/Flask، أكثر من 1,500 سطر)
  - 3 تطبيقات وكيل متخصصة (باحث، كاتب، محرر)
  - تكامل Service Bus لطابور الرسائل
  - إدارة الحالة في Cosmos DB للأنظمة الموزعة
  - 6 مخططات Mermaid توضح تفاعلات الوكلاء
  - 3 تمارين متقدمة (التعامل مع المهلة، منطق إعادة المحاولة، قاطع الدائرة)
  - تحليل تكلفة ($240-565/month) مع استراتيجيات تحسين
  - تكامل Application Insights للمراقبة

#### معزز
- **فصل ما قبل النشر**: يتضمن الآن أنماط المراقبة والتنسيق الشاملة
- **فصل البدء**: معزز بأنماط مصادقة احترافية
- **جاهزية الإنتاج**: تغطية كاملة من الأمان إلى القابلية للمراقبة
- **مخطط الدورة**: تم تحديثه للإشارة إلى الدروس الجديدة في الفصلين 3 و 6

#### تم التغيير
- **تقدم التعلم**: تكامل أفضل للأمان والمراقبة عبر الدورة
- **جودة التوثيق**: معايير متناسقة من الفئة A (95-97%) عبر الدروس الجديدة
- **أنماط الإنتاج**: تغطية كاملة شاملة لنشر المؤسسات

#### تحسين
- **تجربة المطور**: مسار واضح من التطوير إلى مراقبة الإنتاج
- **معايير الأمان**: أنماط احترافية للمصادقة وإدارة الأسرار
- **القابلية للمراقبة**: تكامل Application Insights الكامل مع AZD
- **أحمال عمل AI**: مراقبة متخصصة لنماذج Microsoft Foundry وأنظمة تعدد الوكلاء

#### تم التحقق
- ✅ جميع الدروس تتضمن كودًا عمليًا كاملًا (ليست مقتطفات)
- ✅ مخططات Mermaid للتعلم البصري (19 مخططًا إجماليًا عبر 3 دروس)
- ✅ تمارين عملية مع خطوات تحقق (9 إجمالًا)
- ✅ قوالب Bicep جاهزة للإنتاج قابلة للنشر عبر `azd up`
- ✅ تحليل التكلفة واستراتيجيات التحسين
- ✅ أدلة استكشاف الأخطاء وأفضل الممارسات
- ✅ نقاط تحقق معرفية مع أوامر تحقق

#### نتائج تقييم التوثيق
- **docs/pre-deployment/application-insights.md**: - دليل مراقبة شامل
- **docs/getting-started/authsecurity.md**: - أنماط أمان احترافية
- **docs/pre-deployment/coordination-patterns.md**: - هياكل متقدمة لتعدد الوكلاء
- **المحتوى الجديد بشكل عام**: - معايير جودة عالية ومتناسقة

#### التنفيذ الفني
- **Application Insights**: Log Analytics + قياسات مخصصة + تتبع موزع
- **المصادقة**: Managed Identity + Key Vault + أنماط RBAC
- **تعدد الوكلاء**: Service Bus + Cosmos DB + Container Apps + orchestration
- **المراقبة**: مقاييس مباشرة + استعلامات Kusto + تنبيهات + لوحات بيانات
- **إدارة التكلفة**: استراتيجيات أخذ العينات، سياسات الاحتفاظ، ضوابط الميزانية

### [v3.7.0] - 2025-11-19

#### تحسين جودة التوثيق ومثال جديد لنماذج Microsoft Foundry
**تحسن هذه النسخة جودة التوثيق عبر المستودع وتضيف مثال نشر كامل لنماذج Microsoft Foundry مع واجهة دردشة gpt-4.1.**

#### تمت الإضافة
- **🤖 مثال دردشة نماذج Microsoft Foundry**: نشر gpt-4.1 كامل مع تنفيذ عملي في `examples/azure-openai-chat/`:
  - بنية تحتية كاملة لنماذج Microsoft Foundry (نشر نموذج gpt-4.1)
  - واجهة دردشة سطر أوامر Python مع سجل المحادثة
  - تكامل Key Vault لتخزين مفاتيح API بأمان
  - تتبع استخدام الرموز وتقدير التكلفة
  - تحديد معدل الطلبات ومعالجة الأخطاء
  - README شامل مع دليل نشر 35-45 دقيقة
  - 11 ملفًا جاهزًا للإنتاج (قوالب Bicep، تطبيق Python، التهيئة)
- **📚 تمارين توثيقية**: إضافة تمارين عملية لدليل التهيئة:
  - التمرين 1: تهيئة متعددة البيئات (15 دقيقة)
  - التمرين 2: ممارسة إدارة الأسرار (10 دقائق)
  - مع معايير نجاح واضحة وخطوات تحقق
- **✅ التحقق من النشر**: إضافة قسم تحقق لدليل النشر:
  - إجراءات فحص الصحة
  - قائمة معايير النجاح
  - المخرجات المتوقعة لجميع أوامر النشر
  - مرجع سريع لاستكشاف الأخطاء

#### معزَّز
- **examples/README.md**: تم تحديثه إلى جودة الفئة A (93%):
  - إضافة azure-openai-chat إلى جميع الأقسام ذات الصلة
  - تحديث عدد الأمثلة المحلية من 3 إلى 4
  - إضافته إلى جدول أمثلة تطبيقات AI
  - دمجه في الإعداد السريع للمستخدمين المتوسطين
  - إضافته إلى قسم قوالب Microsoft Foundry
  - تحديث مصفوفة المقارنة وأقسام البحث عن التكنولوجيا
- **جودة التوثيق**: تحسنت من B+ (87%) → A- (92%) عبر مجلد docs:
  - إضافة المخرجات المتوقعة إلى أمثلة الأوامر الحرجة
  - تضمين خطوات تحقق لتغييرات التهيئة
  - تعزيز التعلم العملي بتمارين عملية

#### تم التغيير
- **تقدم التعلم**: تكامل أفضل لأمثلة AI للمستخدمين المتوسطين
- **هيكلة التوثيق**: تمارين أكثر قابلية للتنفيذ مع نتائج واضحة
- **عملية التحقق**: إضافة معايير نجاح صريحة لسير العمل الأساسية

#### تحسّن
- **تجربة المطور**: نشر نماذج Microsoft Foundry الآن يستغرق 35-45 دقيقة (مقابل 60-90 للبدائل المعقدة)
- **شفافية التكاليف**: تقديرات تكلفة واضحة ($50-200/month) لمثال نماذج Microsoft Foundry
- **مسار التعلم**: نقطة دخول واضحة لمطوري AI مع azure-openai-chat
- **معايير التوثيق**: مخرجات متوقعة وخطوات تحقق متسقة

#### تم التحقق
- ✅ مثال نماذج Microsoft Foundry يعمل بالكامل مع `azd up`
- ✅ جميع 11 ملفًا للتنفيذ صحيحة تركيبياً
- ✅ تعليمات README تتطابق مع تجربة النشر الفعلية
- ✅ تحديث روابط التوثيق عبر أكثر من 8 مواقع
- ✅ فهرس الأمثلة يعكس بدقة 4 أمثلة محلية
- ✅ لا توجد روابط خارجية مكررة في الجداول
- ✅ جميع مراجع التنقل صحيحة

#### التنفيذ الفني
- **بنية نماذج Microsoft Foundry**: gpt-4.1 + Key Vault + نمط Container Apps
- **الأمان**: جاهزية Managed Identity، الأسرار في Key Vault
- **المراقبة**: تكامل Application Insights
- **إدارة التكلفة**: تتبع الرموز وتحسين الاستخدام
- **النشر**: أمر واحد `azd up` لإعداد كامل

### [v3.6.0] - 2025-11-19

#### تحديث رئيسي: أمثلة نشر تطبيقات الحاويات
**تقدم هذه النسخة أمثلة نشر تطبيقات حاويات جاهزة للإنتاج باستخدام Azure Developer CLI (AZD)، مع توثيق كامل ودمج في مسار التعلم.**

#### تمت الإضافة
- **🚀 أمثلة تطبيقات الحاويات**: أمثلة محلية جديدة في `examples/container-app/`:
  - [دليل رئيسي](examples/container-app/README.md): نظرة عامة كاملة على نشرات الحاويات، بدء سريع، أنماط الإنتاج والمتقدمة
  - [واجهة برمجة تطبيقات Flask بسيطة](../../examples/container-app/simple-flask-api): REST API مناسب للمبتدئين مع ميزة scale-to-zero، فحوصات الصحة، المراقبة، واستكشاف الأخطاء
  - [هندسة الخدمات المصغرة](../../examples/container-app/microservices): نشر جاهز للإنتاج متعدد الخدمات (API Gateway، Product، Order، User، Notification)، رسائل غير متزامنة، Service Bus، Cosmos DB، Azure SQL، تتبع موزع، نشر أزرق-أخضر/كاناري
- **أفضل الممارسات**: الأمان والمراقبة وتحسين التكلفة وإرشادات CI/CD لأحمال العمل المحوّاة
- **عينات الكود**: `azure.yaml` كاملة، قوالب Bicep، وتنفيذ خدمات بلغات متعددة (Python، Node.js، C#، Go)
- **الاختبار واستكشاف الأخطاء**: سيناريوهات اختبار شاملة، أوامر المراقبة، وإرشادات استكشاف الأخطاء

#### تم التغيير
- **README.md**: تم تحديثه لعرض وربط أمثلة تطبيقات الحاويات الجديدة تحت "Local Examples - Container Applications"
- **examples/README.md**: تم تحديثه لتسليط الضوء على أمثلة تطبيقات الحاويات، إضافة مدخلات مصفوفة المقارنة، وتحديث المراجع التكنولوجية/المعمارية
- **مخطط الدورة ودليل الدراسة**: تم تحديثهما للإشارة إلى أمثلة تطبيقات الحاويات وأنماط النشر في الفصول ذات الصلة

#### تم التحقق
- ✅ جميع الأمثلة الجديدة قابلة للنشر باستخدام `azd up` وتتبع أفضل الممارسات
- ✅ تحديثات روابط التوثيق والتنقل متناسقة
- ✅ الأمثلة تغطي سيناريوهات من المبتدئ إلى المتقدم، بما في ذلك الخدمات المصغرة الجاهزة للإنتاج

#### ملاحظات
- **النطاق**: الوثائق والأمثلة الإنجليزية فقط
- **الخطوات التالية**: التوسع بإضافة أنماط حاويات متقدمة وأتمتة CI/CD في الإصدارات المستقبلية

### [v3.5.0] - 2025-11-19

#### إعادة تسمية المنتج: Microsoft Foundry
**تطبق هذه النسخة تغيير اسم المنتج الشامل من "Microsoft Foundry" إلى "Microsoft Foundry" عبر جميع الوثائق الإنجليزية، عاكسةً إعادة العلامة الرسمية لشركة Microsoft.**

#### تم التغيير
- **🔄 تحديث اسم المنتج**: إعادة تسمية كاملة من "Microsoft Foundry" إلى "Microsoft Foundry"
  - تحديث كل المراجع عبر الوثائق الإنجليزية في مجلد `docs/`
  - إعادة تسمية المجلد: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - إعادة تسمية الملف: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - المجموع: تم تحديث 23 مرجعًا للمحتوى عبر 7 ملفات توثيق

- **📁 تغييرات هيكل المجلدات**:
  - `docs/ai-foundry/` أعيدت تسميته إلى `docs/microsoft-foundry/`
  - تم تحديث جميع الإشارات البينية لتعكس هيكل المجلدات الجديد
  - تم التحقق من روابط التنقل عبر جميع ملفات التوثيق

- **📄 إعادة تسمية الملفات**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - تم تحديث جميع الروابط الداخلية للإشارة إلى اسم الملف الجديد

#### الملفات المحدثة
- **توثيق الفصل** (7 ملفات):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 تحديثات لروابط التنقل
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 تحديثات لمرجع اسم المنتج
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - يستخدم Microsoft Foundry بالفعل (من التحديثات السابقة)
  - `docs/microsoft-foundry/production-ai-practices.md` - تم تحديث 3 مراجع (نظرة عامة، ملاحظات المجتمع، التوثيق)
  - `docs/getting-started/azd-basics.md` - تم تحديث 4 روابط إشارات متقاطعة
  - `docs/getting-started/first-project.md` - تم تحديث رابطين تنقلية للفصول
  - `docs/getting-started/installation.md` - تم تحديث رابطين للفصل التالي
  - `docs/troubleshooting/ai-troubleshooting.md` - تم تحديث 3 مراجع (التنقل، مجتمع Discord)
  - `docs/troubleshooting/common-issues.md` - تم تحديث رابط تنقل واحد
  - `docs/troubleshooting/debugging.md` - تم تحديث رابط تنقل واحد

- **ملفات بنية الدورة** (2 ملفات):
  - `README.md` - تم تحديث 17 مرجعًا (نظرة عامة على الدورة، عناوين الفصول، قسم القوالب، رؤى المجتمع)
  - `course-outline.md` - تم تحديث 14 مرجعًا (نظرة عامة، أهداف التعلم، موارد الفصل)

#### تم التحقق منه
- ✅ لا توجد بقايا لمسار المجلد "ai-foundry" في ملفات التوثيق الإنجليزية
- ✅ لا توجد بقايا لمرجع اسم المنتج "Microsoft Foundry" في ملفات التوثيق الإنجليزية
- ✅ جميع روابط التنقل تعمل مع هيكل المجلدات الجديد
- ✅ تم إكمال إعادة تسمية الملفات والمجلدات بنجاح
- ✅ تم التحقق من الإشارات البينية بين الفصول

#### ملاحظات
- **النطاق**: تم تطبيق التغييرات على وثائق اللغة الإنجليزية في مجلد `docs/` فقط
- **الترجمات**: مجلدات الترجمة (`translations/`) لم يتم تحديثها في هذا الإصدار
- **ورشة العمل**: مواد الورشة (`workshop/`) لم يتم تحديثها في هذا الإصدار
- **أمثلة**: قد لا تزال ملفات الأمثلة تشير إلى التسمية القديمة (سيتم التعامل معها في تحديث مستقبلي)
- **روابط خارجية**: تظل عناوين URL وروابط مستودع GitHub الخارجية دون تغيير

#### دليل الترحيل للمساهمين
إذا كانت لديك فروع محلية أو توثيق يشير إلى الهيكل القديم:
1. حدّث إشارات المجلدات: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. حدّث إشارات الملفات: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. استبدل اسم المنتج: "Microsoft Foundry" → "Microsoft Foundry"
4. تحقق من أن جميع روابط التوثيق الداخلية ما زالت تعمل

---

### [v3.4.0] - 2025-10-24

#### تحسينات معاينة البنية التحتية والتحقق
**يتضمن هذا الإصدار دعمًا شاملاً لميزة المعاينة الجديدة في Azure Developer CLI ويحسن تجربة مستخدمي الورشة.**

#### تمت الإضافة
- **🧪 توثيق ميزة azd provision --preview**: تغطية شاملة لقدرة معاينة البنية التحتية الجديدة
  - مرجع الأمر وأمثلة الاستخدام في ورقة الغش
  - تكامل مفصل في دليل التجهيز مع حالات استخدام وفوائد
  - تكامل فحص ما قبل الإقلاع للتحقّق الآمن من النشر
  - تحديثات دليل البدء مع ممارسات نشر تضع السلامة أولًا
- **🚧 لافتة حالة الورشة**: لافتة HTML احترافية تشير إلى حالة تطوير الورشة
  - تصميم متدرج مع مؤشرات إنشاء لتواصل واضح مع المستخدم
  - طابع زمني لآخر تحديث للشفافية
  - استجابة تصميمية للأجهزة المحمولة وأنواع الشاشات المختلفة

#### تم التعزيز
- **سلامة البنية التحتية**: تم دمج وظيفة المعاينة في جميع وثائق النشر
- **التحقق قبل النشر**: تتضمن السكربتات الآلية الآن اختبارات معاينة البنية التحتية
- **سير عمل المطور**: تحديث تسلسلات الأوامر لتشمل المعاينة كممارسة موصى بها
- **تجربة الورشة**: وضع توقعات واضحة للمستخدمين حول حالة تطوير المحتوى

#### تم التغيير
- **أفضل ممارسات النشر**: تم التوصية الآن بوحدة العمل التي تبدأ بالمعاينة
- **تدفق التوثيق**: تم نقل التحقق من البنية التحتية إلى مرحلة أبكر في عملية التعلم
- **عرض الورشة**: تواصل حالة احترافية مع جدول زمني واضح للتطوير

#### تم التحسين
- **نهج السلامة أولًا**: يمكن الآن التحقق من تغييرات البنية التحتية قبل النشر
- **التعاون الفريقّي**: يمكن مشاركة نتائج المعاينة للمراجعة والموافقة
- **الوعي بالتكاليف**: فهم أفضل لتكاليف الموارد قبل التجهيز
- **التخفيف من المخاطر**: تقليل فشل النشر من خلال التحقق المسبق

#### التنفيذ الفني
- **تكامل عبر مستندات متعددة**: تم توثيق ميزة المعاينة عبر 4 ملفات رئيسية
- **أنماط الأوامر**: تناسق في الصياغة والأمثلة عبر التوثيق
- **دمج أفضل الممارسات**: شُملت المعاينة في سيريات التحقق والسكربتات
- **مؤشرات بصرية**: وسوم ميزة NEW واضحة لسهولة الاكتشاف

#### بنية ورشة العمل
- **التواصل عن الحالة**: لافتة HTML احترافية بتدرج لوني
- **تجربة المستخدم**: حالة التطوير الواضحة تمنع الارتباك
- **العرض الاحترافي**: يحافظ على مصداقية المستودع مع وضع التوقعات
- **الشفافية الزمنية**: طابع زمني لآخر تحديث في أكتوبر 2025 للمساءلة

### [v3.3.0] - 2025-09-24

#### مواد ورشة عمل محسّنة وتجربة تعليمية تفاعلية
**يتضمن هذا الإصدار مواد ورشة عمل شاملة مع أدلة تفاعلية تعمل في المتصفح ومسارات تعلم منظمة.**

#### تمت الإضافة
- **🎥 دليل ورشة عمل تفاعلي**: تجربة ورشة عمل تعمل في المتصفح مع قدرة معاينة MkDocs
- **📝 تعليمات ورشة عمل منظمة**: مسار تعلم مكوّن من 7 خطوات موجه من الاكتشاف إلى التخصيص
  - 0-Introduction: نظرة عامة على الورشة والإعداد
  - 1-Select-AI-Template: اكتشاف القوالب وعملية الاختيار
  - 2-Validate-AI-Template: إجراءات النشر والتحقق
  - 3-Deconstruct-AI-Template: فهم بنية القالب
  - 4-Configure-AI-Template: التكوين والتخصيص
  - 5-Customize-AI-Template: تعديلات متقدمة وتكرار
  - 6-Teardown-Infrastructure: التنظيف وإدارة الموارد
  - 7-Wrap-up: الخلاصة والخطوات التالية
- **🛠️ أدوات الورشة**: تكوين MkDocs مع سمة Material لتحسين تجربة التعلم
- **🎯 مسار التعلم العملي**: منهجية من 3 خطوات (اكتشاف → نشر → تخصيص)
- **📱 تكامل GitHub Codespaces**: إعداد بيئة تطوير سلسة

#### تم التعزيز
- **مختبر ورشة العمل للذكاء الاصطناعي**: موسع مع تجربة تعلم منظمة مدتها 2-3 ساعات
- **توثيق الورشة**: عرض احترافي مع تنقل ومساعدات بصرية
- **تقدّم التعلم**: إرشاد خطوة بخطوة واضح من اختيار القالب إلى النشر في الإنتاج
- **تجربة المطور**: أدوات مدمجة لسير عمل تطوير مبسّط

#### تم التحسين
- **إمكانية الوصول**: واجهة متصفح مع بحث، وظيفة نسخ، وتبديل السمة
- **التعلم الذاتي**: هيكلية مرنة تستوعب سرعات تعلم مختلفة
- **التطبيق العملي**: سيناريوهات نشر قوالب الذكاء الاصطناعي في العالم الحقيقي
- **تكامل المجتمع**: تكامل Discord لدعم الورشة والتعاون

#### ميزات الورشة
- **بحث مدمج**: اكتشاف سريع للكلمات المفتاحية والدروس
- **نسخ مقاطع الكود**: وظيفة نسخ عند التمرير فوق كل أمثلة الكود
- **تبديل السمة**: دعم الوضع الداكن/الفاتح لتفضيلات مختلفة
- **الأصول المرئية**: لقطات شاشة ومخططات لفهم أفضل
- **تكامل المساعدة**: وصول مباشر إلى Discord لدعم المجتمع

### [v3.2.0] - 2025-09-17

#### إعادة هيكلة شاملة للتنقل ونظام تعلّم معتمد على الفصول
**يقدم هذا الإصدار بنية تعلم مكوّنة من فصول معاد تنظيمها وتحسين التنقل عبر المستودع بأكمله.**

#### تمت الإضافة
- **📚 نظام تعلم معتمد على الفصول**: إعادة هيكلة كامل الدورة إلى 8 فصول تعليمية متدرجة
  - الفصل 1: الأساسيات والبدء السريع (⭐ - 30-45 دقيقة)
  - الفصل 2: تطوير موجه بالذكاء الاصطناعي (⭐⭐ - 1-2 ساعة)
  - الفصل 3: التكوين والمصادقة (⭐⭐ - 45-60 دقيقة)
  - الفصل 4: البنية التحتية ككود والنشر (⭐⭐⭐ - 1-1.5 ساعة)
  - الفصل 5: حلول AI متعددة الوكلاء (⭐⭐⭐⭐ - 2-3 ساعات)
  - الفصل 6: التحقق والتخطيط قبل النشر (⭐⭐ - 1 ساعة)
  - الفصل 7: استكشاف الأخطاء وإصلاحها وتصحيحها (⭐⭐ - 1-1.5 ساعة)
  - الفصل 8: أنماط الإنتاج والمؤسسات (⭐⭐⭐⭐ - 2-3 ساعات)
- **📚 نظام تنقل شامل**: رؤوس وتذييلات تنقل متناسقة عبر كل التوثيق
- **🎯 تعقب التقدّم**: قائمة تحقق لإكمال الدورة ونظام تحقق من التعلم
- **🗺️ إرشاد مسار التعلم**: نقاط دخول واضحة لمستويات وخبرات وأهداف مختلفة
- **🔗 تنقّل بالإشارات البينية**: ربط واضح للفصول ذات الصلة والمتطلبات المسبقة

#### تم التعزيز
- **هيكلية README**: تحولت إلى منصة تعلم منظمة مع تنظيم معتمد على الفصول
- **تنقل التوثيق**: كل صفحة تتضمن الآن سياق الفصل وإرشادات التقدّم
- **تنظيم القوالب**: أمثلة وقوالب مرتبطة بالفصول التعليمية المناسبة
- ** دمج الموارد**: أوراق الغش، الأسئلة الشائعة، وأدلة الدراسة مرتبطة بالفصول ذات الصلة
- **دمج الورش العملية**: المختبرات العملية مرتبطة بأهداف تعلم متعدد الفصول

#### تم التغيير
- **تقدّم التعلم**: الانتقال من التوثيق الخطي إلى تعلم مرن معتمد على الفصول
- **موضع التكوين**: إعادة وضع دليل التكوين كالفصل 3 لتدفق تعلّم أفضل
- **دمج محتوى الذكاء الاصطناعي**: تكامل أفضل لمحتوى AI عبر رحلة التعلم
- **محتوى الإنتاج**: تجميع الأنماط المتقدمة في الفصل 8 للمتعلمين المؤسسيين

#### تم التحسين
- **تجربة المستخدم**: شروحات تنقّل واضحة ومؤشرات تقدم الفصل
- **إمكانية الوصول**: أنماط تنقّل متسقة لتسهيل تصفح الدورة
- **العرض الاحترافي**: هيكل دورة على غرار الجامعات مناسب للتدريب الأكاديمي والمؤسسي
- **كفاءة التعلم**: تقليل الوقت للعثور على المحتوى المناسب بفضل تنظيم محسن

#### التنفيذ الفني
- **رؤوس التنقل**: توحيد تنقل الفصل عبر أكثر من 40 ملف توثيق
- **تذييل التنقل**: إرشادات تقدم متناسقة ومؤشرات إكمال الفصل
- **روابط داخلية**: نظام ربط داخلي شامل يربط المفاهيم ذات الصلة
- **تعيين الفصول**: ربط القوالب والأمثلة بأهداف التعلم بوضوح

#### تحسين دليل الدراسة
- **📚 أهداف تعلم شاملة**: إعادة هيكلة دليل الدراسة ليتماشى مع نظام الفصول الثمانية
- **🎯 تقييم معتمد على الفصل**: كل فصل يتضمن أهداف تعلم وممارسات عملية محددة
- **📋 تتبع التقدّم**: جدول تعلم أسبوعي مع نتائج قابلة للقياس وقوائم تحقق للإكمال
- **❓ أسئلة تقييمية**: أسئلة تحقق معرفية لكل فصل مع نتائج مهنية
- **🛠️ تمارين عملية**: أنشطة تطبيقية مع سيناريوهات نشر حقيقية واستكشاف أخطاء
- **📊 تطور المهارات**: تقدم واضح من المفاهيم الأساسية إلى أنماط المؤسسات مع تركيز على التطور المهني
- **🎓 إطار الشهادات**: نتائج تطوير مهني ونظام اعتراف مجتمعي
- **⏱️ إدارة الجدول الزمني**: خطة تعلم منظمة لمدة 10 أسابيع مع تحقق من الإنجازات

### [v3.1.0] - 2025-09-17

#### تحسين حلول الذكاء الاصطناعي متعددة الوكلاء
**يحسّن هذا الإصدار حل التجزئة متعدد الوكلاء مع تسمية أفضل للوكلاء ووثائق محسّنة.**

#### تم التغيير
- **مصطلحات متعددة الوكلاء**: استبدال "Cora agent" بـ "Customer agent" عبر حل التجزئة متعدد الوكلاء لفهم أوضح
- **هندسة الوكيل**: تم تحديث كل التوثيق وARM templates وأمثلة الكود لاستخدام تسمية "Customer agent" المتسقة
- **أمثلة التكوين**: تحديث أنماط تكوين الوكلاء الحديثة مع قواعد تسمية محدثة
- **اتساق التوثيق**: ضمان أن جميع الإشارات تستخدم أسماء وكلاء مهنية ووصفية

#### تم التعزيز
- **حزمة قالب ARM**: تحديث retail-multiagent-arm-template مع إشارات Customer agent
- **مخططات المعمارية**: تحديث مخططات Mermaid بأسماء الوكلاء الجديدة
- **أمثلة الكود**: تستخدم الآن فئات Python وتسميات تنفيذية CustomerAgent
- **متغيرات البيئة**: تحديث كل سكربتات النشر لاستخدام قواعد CUSTOMER_AGENT_NAME

#### تم التحسين
- **تجربة المطور**: وضوح أكبر لأدوار ومسؤوليات الوكلاء في التوثيق
- **جاهزية الإنتاج**: توافق أفضل مع قواعد تسمية المؤسسات
- **مواد التعلم**: تسمية وكلاء أكثر وضوحًا لأغراض التعليم
- **قابلية استخدام القوالب**: تبسيط فهم وظائف الوكلاء وأنماط النشر

#### التفاصيل التقنية
- تحديث مخططات المعمارية Mermaid بالإشارات إلى CustomerAgent
- استبدال أسماء فئات CoraAgent بـ CustomerAgent في أمثلة Python
- تعديل تكوينات قالب ARM JSON لاستخدام نوع الوكيل "customer"
- تحديث متغيرات البيئة من CORA_AGENT_* إلى CUSTOMER_AGENT_* 
- تحديث أوامر النشر وتكوينات الحاويات

### [v3.0.0] - 2025-09-12

#### تغييرات رئيسية - تركيز على مطوري الذكاء الاصطناعي وتكامل Microsoft Foundry
** يحوّل هذا الإصدار المستودع إلى مصدر تعلم شامل موجه لمطوري الذكاء الاصطناعي مع دليل تكامل Microsoft Foundry.**

#### تمت الإضافة
- **🤖 مسار تعلم يركّز على AI**: إعادة هيكلة كاملة تعطي الأولوية لمطوري ومهندسي الذكاء الاصطناعي
- **دليل تكامل Microsoft Foundry**: توثيق شامل لربط AZD بخدمات Microsoft Foundry
- **أنماط نشر نماذج AI**: دليل مفصل يغطي اختيار النموذج والتكوين واستراتيجيات النشر في الإنتاج
- **مختبر ورشة عمل الذكاء الاصطناعي**: ورشة عمل عملية مدتها 2-3 ساعات لتحويل تطبيقات الذكاء الاصطناعي إلى حلول قابلة للنشر باستخدام AZD
- **أفضل ممارسات الذكاء الاصطناعي للإنتاج**: أنماط جاهزة للمؤسسات من أجل التحجيم والمراقبة وتأمين أحمال العمل الخاصة بالذكاء الاصطناعي
- **دليل استكشاف أخطاء الذكاء الاصطناعي وإصلاحها**: استكشاف شامل لمشاكل نماذج Microsoft Foundry، Cognitive Services، ومشكلات نشر الذكاء الاصطناعي
- **معرض قوالب الذكاء الاصطناعي**: مجموعة مميزة من قوالب Microsoft Foundry مع تصنيفات حسب مستوى التعقيد
- **مواد الورشة**: بنية ورشة عمل كاملة مع مختبرات عملية ومواد مرجعية

#### معزز
- **هيكل README**: موجه لمطوري الذكاء الاصطناعي مع بيانات اهتمام المجتمع بنسبة 45% مأخوذة من Microsoft Foundry Discord
- **مسارات التعلم**: مسار مخصص لمطوري الذكاء الاصطناعي إلى جانب المسارات التقليدية للطلاب ومهندسي DevOps
- **توصيات القوالب**: قوالب مميزة للذكاء الاصطناعي بما في ذلك azure-search-openai-demo و contoso-chat و openai-chat-app-quickstart
- **تكامل المجتمع**: دعم مجتمع Discord معزز مع قنوات ومناقشات مخصصة للذكاء الاصطناعي

#### التركيز على الأمان والإنتاج
- **أنماط Managed Identity**: تكوينات المصادقة والأمان الخاصة بالذكاء الاصطناعي
- **تحسين التكاليف**: تتبع استخدام الرموز الضمنية ومراقبة الميزانية لأحمال عمل الذكاء الاصطناعي
- **نشر متعدد المناطق**: استراتيجيات لنشر تطبيقات الذكاء الاصطناعي على مستوى العالم
- **مراقبة الأداء**: مقاييس خاصة بالذكاء الاصطناعي وتكامل Application Insights

#### جودة التوثيق
- **هيكل دورة خطي**: تقدم منطقي من المبتدئ إلى أنماط نشر الذكاء الاصطناعي المتقدمة
- **الروابط الموثقة**: جميع روابط المستودعات الخارجية تم التحقق منها وقابلة للوصول
- **مرجع كامل**: جميع روابط التوثيق الداخلية تم التحقق منها وتعمل بشكل صحيح
- **جاهز للإنتاج**: أنماط نشر للمؤسسات مع أمثلة من العالم الحقيقي

### [v2.0.0] - 2025-09-09

#### تغييرات رئيسية - إعادة هيكلة المستودع وتحسين احترافي
**يمثل هذا الإصدار إعادة تصميم كبيرة لبنية المستودع وطريقة عرض المحتوى.**

#### مضاف
- **إطار تعلم منظم**: جميع صفحات التوثيق الآن تتضمن أقسام المقدمة، أهداف التعلم، ونتائج التعلم
- **نظام تنقل**: إضافة روابط الدرس السابق/التالي في جميع صفحات التوثيق لتوجيه تقدم التعلم
- **دليل الدراسة**: study-guide.md شامل مع أهداف التعلم، تمارين عملية، ومواد تقييم
- **عرض احترافي**: إزالة جميع أيقونات الإيموجي لتحسين إمكانية الوصول والمظهر الاحترافي
- **تحسين هيكل المحتوى**: تنظيم وتدفق محسن لمواد التعلم

#### تم تغييره
- **تنسيق التوثيق**: توحيد جميع التوثيقات بهيكل ثابت يركز على التعلم
- **تدفق التنقل**: تنفيذ تقدم منطقي عبر جميع مواد التعلم
- **عرض المحتوى**: إزالة العناصر الزخرفية لصالح تنسيق واضح واحترافي
- **هيكل الروابط**: تحديث جميع الروابط الداخلية لدعم نظام التنقل الجديد

#### تحسينات
- **إمكانية الوصول**: إزالة تبعيات الإيموجي لتحسين توافق قارئات الشاشة
- **المظهر الاحترافي**: عرض أنظف بأسلوب أكاديمي مناسب لتعلم المؤسسات
- **تجربة التعلم**: نهج منظم مع أهداف ونتائج واضحة لكل درس
- **تنظيم المحتوى**: تدفق منطقي أفضل وربط أوضح بين الموضوعات ذات الصلة

### [v1.0.0] - 2025-09-09

#### الإصدار الأولي - مستودع تعلم AZD شامل

#### مضاف
- **هيكل التوثيق الأساسي**
  - سلسلة أدلة بدء الاستخدام الكاملة
  - توثيق شامل للنشر والتجهيز
  - موارد استكشاف الأخطاء وإرشادات التصحيح التفصيلية
  - أدوات وإجراءات التحقق قبل النشر

- **وحدة بدء التشغيل**
  - أساسيات AZD: المفاهيم والمصطلحات الأساسية
  - دليل التثبيت: تعليمات الإعداد الخاصة بكل منصة
  - دليل التكوين: إعداد البيئة والمصادقة
  - درس المشروع الأول: تعلم عملي خطوة بخطوة

- **وحدة النشر والتجهيز**
  - دليل النشر: توثيق سير العمل الكامل
  - دليل التجهيز: البنية التحتية ككود باستخدام Bicep
  - أفضل الممارسات لنشرات الإنتاج
  - أنماط هندسة متعددة الخدمات

- **وحدة التحقق قبل النشر**
  - تخطيط السعة: التحقق من توافر موارد Azure
  - اختيار SKU: إرشادات شاملة لمستويات الخدمة
  - فحوصات ما قبل الإقلاع: نصوص التحقق التلقائي (PowerShell و Bash)
  - أدوات تقدير التكاليف وتخطيط الميزانية

- **وحدة استكشاف الأخطاء وإصلاحها**
  - المشاكل الشائعة: المشكلات المتكررة والحلول
  - دليل التصحيح: منهجيات استكشاف الأخطاء المنهجية
  - تقنيات وأدوات تشخيص متقدمة
  - مراقبة الأداء وتحسينه

- **الموارد والمرجع**
  - ورقة غش الأوامر: مرجع سريع للأوامر الأساسية
  - معجم المصطلحات: تعريفات شاملة للمصطلحات والاختصارات
  - الأسئلة الشائعة: إجابات مفصلة على الأسئلة الشائعة
  - روابط الموارد الخارجية واتصالات المجتمع

- **أمثلة وقوالب**
  - مثال تطبيق ويب بسيط
  - قالب نشر موقع ثابت
  - تكوين تطبيق حاويات
  - أنماط دمج قواعد البيانات
  - أمثلة هندسة الميكروسيرفيسز
  - تنفيذات الدوال الخالية من الخادم

#### الميزات
- **دعم متعدد المنصات**: أدلة التثبيت والتكوين لـ Windows و macOS و Linux
- **مستويات مهارة متعددة**: محتوى مصمم للطلاب وصولاً إلى المطورين المحترفين
- **تركيز عملي**: أمثلة عملية وحالات من العالم الحقيقي
- **تغطية شاملة**: من المفاهيم الأساسية إلى أنماط المؤسسات المتقدمة
- **نهج يضع الأمان أولاً**: أفضل ممارسات الأمان مدمجة في كل أنحاء المحتوى
- **تحسين التكاليف**: إرشادات لنشر فعال من حيث التكلفة وإدارة الموارد

#### جودة التوثيق
- **أمثلة كود مفصلة**: عينات كود عملية ومجربة
- **إرشادات خطوة بخطوة**: إرشادات واضحة وقابلة للتنفيذ
- **معالجة أخطاء شاملة**: استكشاف مشكلات شائعة وإصلاحها
- **دمج أفضل الممارسات**: معايير وتوصيات الصناعة
- **توافق الإصدارات**: مواكبة أحدث خدمات Azure وميزات azd

## التحسينات المستقبلية المخططة

### الإصدار 3.1.0 (مخطط)
#### توسيع منصة الذكاء الاصطناعي
- **دعم متعدد النماذج**: أنماط التكامل لـ Hugging Face و Azure Machine Learning والنماذج المخصصة
- **أطر وكلاء الذكاء الاصطناعي**: قوالب لنشرات LangChain و Semantic Kernel و AutoGen
- **أنماط RAG المتقدمة**: خيارات قواعد بيانات متجهات خارج Azure AI Search (Pinecone، Weaviate، إلخ)
- **قابلية ملاحظة الذكاء الاصطناعي**: مراقبة محسنة لأداء النماذج، استخدام الرموز، وجودة الاستجابات

#### تجربة المطور
- **امتداد VS Code**: تجربة تطوير متكاملة لـ AZD + Microsoft Foundry
- **تكامل GitHub Copilot**: توليد قوالب AZD بمساعدة الذكاء الاصطناعي
- **دروس تفاعلية**: تمارين ترميز عملية مع تحقق آلي لسيناريوهات الذكاء الاصطناعي
- **محتوى فيديو**: دروس فيديو تكميلية للمتعلمين البصريين تركز على نشرات الذكاء الاصطناعي

### الإصدار 4.0.0 (مخطط)
#### أنماط الذكاء الاصطناعي للمؤسسات
- **إطار الحوكمة**: حوكمة نماذج الذكاء الاصطناعي والامتثال ومسارات التدقيق
- **الذكاء الاصطناعي متعدد المستأجرين**: أنماط لخدمة عدة عملاء باستخدام خدمات ذكاء اصطناعي معزولة
- **نشر الذكاء الاصطناعي على الحافة**: التكامل مع Azure IoT Edge وحاويات الحاويات
- **الذكاء الاصطناعي السحابي الهجين**: أنماط نشر متعددة السحب وهجينة لأحمال عمل الذكاء الاصطناعي

#### ميزات متقدمة
- **أتمتة خطوط أنابيب الذكاء الاصطناعي**: تكامل MLOps مع خطوط أنابيب Azure Machine Learning
- **أمان متقدم**: أنماط الثقة الصفرية، نقاط نهاية خاصة، وحماية متقدمة من التهديدات
- **تحسين الأداء**: ضبط متقدم واستراتيجيات تحجيم لتطبيقات الذكاء الاصطناعي عالية الإنتاجية
- **التوزيع العالمي**: أنماط توصيل المحتوى وتخزين مؤقت على الحافة لتطبيقات الذكاء الاصطناعي

### الإصدار 3.0.0 (مخطط) - تم الاستغناء عنه بواسطة الإصدار الحالي
#### إضافات مقترحة - تم تنفيذها الآن في v3.0.0
- ✅ **محتوى موجه للذكاء الاصطناعي**: تكامل شامل مع Microsoft Foundry (مكتمل)
- ✅ **دروس تفاعلية**: مختبر ورشة عمل عملية للذكاء الاصطناعي (مكتمل)
- ✅ **وحدة أمان متقدمة**: أنماط أمان خاصة بالذكاء الاصطناعي (مكتمل)
- ✅ **تحسين الأداء**: استراتيجيات ضبط أحمال عمل الذكاء الاصطناعي (مكتمل)

### الإصدار 2.1.0 (مخطط) - تم تنفيذ جزء منه في v3.0.0
#### تحسينات طفيفة - تم إكمال بعضها في الإصدار الحالي
- ✅ **أمثلة إضافية**: سيناريوهات نشر موجهة للذكاء الاصطناعي (مكتمل)
- ✅ **الأسئلة الشائعة الموسعة**: أسئلة واستكشاف أخطاء خاصة بالذكاء الاصطناعي (مكتمل)
- **تكامل الأدوات**: أدلة محسنة لتكامل بيئات التطوير والمحررات
- ✅ **توسيع المراقبة**: أنماط مراقبة وتنبيه خاصة بالذكاء الاصطناعي (مكتمل)

#### لا تزال مخططة للإصدار المستقبلي
- **توثيق صديق للهاتف المحمول**: تصميم استجابي لتعلم محمول
- **الوصول دون اتصال**: حزم توثيق قابلة للتنزيل
- **تحسين تكامل بيئات التطوير**: امتداد VS Code لتدفقات عمل AZD + AI
- **لوحة معلومات المجتمع**: مقاييس المجتمع في الوقت الفعلي وتتبع المساهمات

## المساهمة في سجل التغييرات

### الإبلاغ عن التغييرات
عند المساهمة في هذا المستودع، يرجى التأكد من أن إدخالات سجل التغييرات تتضمن:

1. **رقم الإصدار**: اتباع الترقيم الدلالي (major.minor.patch)
2. **التاريخ**: تاريخ الإصدار أو التحديث بصيغة YYYY-MM-DD
3. **الفئة**: مضاف، تم تغييره، مهمل، محذوف، ثابت، أمان
4. **وصف واضح**: وصف موجز لما تم تغييره
5. **تقييم التأثير**: كيف تؤثر التغييرات على المستخدمين الحاليين

### فئات التغيير

#### مضاف
- ميزات جديدة، أقسام توثيق، أو قدرات جديدة
- أمثلة جديدة، قوالب، أو موارد تعليمية
- أدوات إضافية، نصوص، أو مساعدات

#### تم تغييره
- تعديلات على الوظائف أو التوثيق الموجود
- تحديثات لتحسين الوضوح أو الدقة
- إعادة هيكلة المحتوى أو التنظيم

#### مهمل
- ميزات أو طرق يتم إيقافها تدريجيًا
- أقسام توثيق مجدولة للإزالة
- طرق توجد لها بدائل أفضل

#### محذوف
- ميزات أو توثيق أو أمثلة لم تعد ذات صلة
- معلومات قديمة أو طرق مهملة
- محتوى مكرر أو مدمج

#### ثابت
- تصحيحات للأخطاء في التوثيق أو الكود
- حل المشاكل أو المسائل المبلغ عنها
- تحسينات للدقة أو الوظائف

#### أمان
- تحسينات أو تصحيحات تتعلق بالأمان
- تحديثات لأفضل ممارسات الأمان
- حل ثغرات أمنية

### إرشادات الترقيم الدلالي

#### الإصدار الرئيسي (X.0.0)
- تغييرات كاسرة تتطلب إجراء من المستخدم
- إعادة هيكلة كبيرة للمحتوى أو التنظيم
- تغييرات تغير النهج أو المنهجية الأساسية

#### الإصدار الفرعي (X.Y.0)
- ميزات جديدة أو إضافات محتوى
- تحسينات تحافظ على التوافق مع الإصدارات السابقة
- أمثلة إضافية، أدوات، أو موارد

#### إصدار التصحيح (X.Y.Z)
- إصلاحات أخطاء وتصحيحات
- تحسينات طفيفة للمحتوى الموجود
- توضيحات وتحسينات صغيرة

## ملاحظات ومقترحات المجتمع

نشجع بشدة ملاحظات المجتمع لتحسين مورد التعلم هذا:

### كيفية تقديم الملاحظات
- **GitHub Issues**: الإبلاغ عن المشاكل أو اقتراح التحسينات (قضايا متعلقة بالذكاء الاصطناعي مرحب بها)
- **مناقشات Discord**: مشاركة الأفكار والتفاعل مع مجتمع Microsoft Foundry
- **Pull Requests**: المساهمة بتحسينات مباشرة للمحتوى، خاصة قوالب وأدلة الذكاء الاصطناعي
- **Microsoft Foundry Discord**: المشاركة في قناة #Azure لمناقشات AZD + AI
- **منتديات المجتمع**: المشاركة في مناقشات مطوري Azure الأوسع

### فئات الملاحظات
- **دقة محتوى الذكاء الاصطناعي**: تصحيحات لتكامل خدمات الذكاء الاصطناعي ومعلومات النشر
- **تجربة التعلم**: اقتراحات لتحسين مسار تعلم مطور الذكاء الاصطناعي
- **محتوى الذكاء الاصطناعي المفقود**: طلبات لإضافة قوالب أو أنماط أو أمثلة إضافية
- **إمكانية الوصول**: تحسينات لاحتياجات تعلم متنوعة
- **تكامل أدوات الذكاء الاصطناعي**: اقتراحات لدمج أفضل لتدفقات عمل تطوير الذكاء الاصطناعي
- **أنماط إنتاج الذكاء الاصطناعي**: طلبات لأنماط نشر المؤسسة للذكاء الاصطناعي

### التزام الاستجابة
- **الرد على القضايا**: خلال 48 ساعة للحوادث المبلغ عنها
- **طلبات الميزات**: التقييم في غضون أسبوع
- **مساهمات المجتمع**: المراجعة في غضون أسبوع
- **قضايا الأمان**: أولوية فورية مع استجابة مُعجلة

## جدول الصيانة

### تحديثات منتظمة
- **مراجعات شهرية**: دقة المحتوى والتحقق من الروابط
- **تحديثات ربع سنوية**: إضافات محتوى وتحسينات كبيرة
- **مراجعات نصف سنوية**: إعادة هيكلة شاملة وتحسينات
- **إصدارات سنوية**: تحديثات إصدار رئيسية مع تحسينات مهمة

### المراقبة وضمان الجودة
- **اختبارات آلية**: التحقق المنتظم من أمثلة الكود والروابط
- **دمج ملاحظات المجتمع**: دمج منتظم لاقتراحات المستخدمين
- **تحديثات التكنولوجيا**: التوافق مع أحدث خدمات Azure وإصدارات azd
- **تدقيقات إمكانية الوصول**: مراجعة دورية لمبادئ التصميم الشاملة

## سياسة دعم الإصدارات

### دعم الإصدار الحالي
- **أحدث إصدار رئيسي**: دعم كامل مع تحديثات منتظمة
- **الإصدار الرئيسي السابق**: تحديثات أمان وتصحيحات حرجة لمدة 12 شهرًا
- **الإصدارات القديمة**: دعم من المجتمع فقط، بدون تحديثات رسمية

### إرشادات الترحيل
عند إصدار إصدارات رئيسية، نقدم:
- **أدلة الترحيل**: تعليمات انتقال خطوة بخطوة
- **ملاحظات التوافق**: تفاصيل حول التغييرات الكاسرة
- **دعم الأدوات**: نصوص أو أدوات للمساعدة في الترحيل
- **دعم المجتمع**: منتديات مخصصة لأسئلة الترحيل

---

**التنقل**
- **الدرس السابق**: [Study Guide](resources/study-guide.md)
- **الدرس التالي**: العودة إلى [Main README](README.md)

**ابقَ محدثًا**: راقب هذا المستودع للحصول على إشعارات حول إصدارات جديدة وتحديثات هامة لمواد التعلم.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنويه**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي والمعتمد. للمعلومات الهامة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->