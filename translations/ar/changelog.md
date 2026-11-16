# سجل التغييرات - AZD للمبتدئين

## المقدمة

يوثق سجل التغييرات هذا جميع التغييرات الملحوظة والتحديثات والتحسينات لمستودع AZD للمبتدئين. نتبع مبادئ الترقيم الدلالي ونحتفظ بهذا السجل لمساعدة المستخدمين على فهم ما تغير بين الإصدارات.

## أهداف التعلم

من خلال مراجعة سجل التغييرات هذا، ستتمكن من:
- البقاء على اطلاع على الميزات الجديدة والإضافات للمحتوى
- فهم التحسينات التي أُجريت على الوثائق الحالية
- متابعة إصلاحات الأخطاء والتصحيحات لضمان الدقة
- متابعة تطور المواد التعليمية مع مرور الوقت

## مخرجات التعلم

بعد مراجعة إدخالات سجل التغييرات، ستكون قادرًا على:
- التعرف على المحتوى والموارد الجديدة المتاحة للتعلم
- فهم الأقسام التي تم تحديثها أو تحسينها
- تخطيط مسار تعلمك بناءً على أحدث المواد
- تقديم الملاحظات والاقتراحات للتحسينات المستقبلية

## سجل الإصدارات

### [v3.24.0]- 2026-11-04

#### تم الإصلاح
- إصلاح تنقل الدورة بالإنجليزية، مسارات الصفحات المنقولة، الروابط المفقودة، والمراجع الخارجية القديمة، بما في ذلك رابط الفصل 2 إلى دليل الذكاء الاصطناعي للإنتاج.
- مراجعة الإرشادات الحالية مقابل AZD 1.37.2 المنشور، الوكلاء 1.0.0-beta.23، والتقييمات 1.0.0-beta.2. توثيق سير العمل المنفصل `azd ai eval` وترحيل تكوين التحسينات.
- تصحيح الأعلام غير المدعومة في CLI، حدود التوثيق، إرشادات البيئة/الأسرار بنص عادي، تحديثات البنية التحتية، تكوين النموذج، وأمثلة استعادة مدمرة.
- تحديث ورشة العمل مقابل نموذج الوكلاء الذكاء الاصطناعي الحالي، بما في ذلك الخُطاف الفعلي، مدخلات التهيئة، اختبارات التقييم، نقاط دخول الفِرق الحمراء، والرصد.
- تصحيح مطالبات تنفيذ المثال وإصلاح مشكلات التطبيق/البنية التحتية/التكوين المرتبطة. يتم تمييز مواد هندسة التجزئة بوضوح عن تطبيق عملي مكتمل.
- استعادة مصفوفة لغة CodeQL، اختيار Node.js 24 المدعوم للحاوية التطويرية، وإجبار أدوات التحقق على الإبلاغ عن أوامر الإصدارات الفاشلة.

#### أُضيف
- مدقق الروابط/المرساة بدون اتصال بالإنجليزية فقط، اختبارات الانحدار، وسير عمل التوثيق الذي يبني الورشة في وضع صارم. تم استبعاد الترجمات المولدة والصور المترجمة.

#### نطاق التحقق
- التحقق من المصدر، الصياغة، التكوين، السلوك المحلي، وروابط الشبكة لا يثبت نشر Azure مباشر، الحصص، إدارة وصول الدور، توفر النموذج الإقليمي، الفوترة، الامتثال الأمني، أو جاهزية الإنتاج.
- الإدخالات القديمة أدناه هي سجلات تاريخية، وليست تعليمات أو أوامر حالية.

### [v3.23.0] - 2026-07-13

#### تحديث تجديد AZD 1.27.1: تحديث عملة الإصدار
**تعيد هذه النسخة التحقق من الدورة مقابل `azd` `1.27.1` (يوليو 2026، الإصدار المستقر الأخير) وامتداد وكيل AI المعاينة الحالي `azure.ai.agents` `1.0.0-beta.5`، مما يجلب كل لافتة "تم التحقق مقابل" إلى أحدث حال بعد إصدارات 1.26.0، 1.27.0، و1.27.1.**

#### تم التغيير
- **✅ تم تحديث قاعدة التحقق** من `azd 1.25.6` (يونيو 2026) إلى `azd 1.27.1` (يوليو 2026) على مستوى README الجذر، كل READMEs الفصول، درس الحاوية التطويرية للفصل الأول (بما في ذلك أمثلة الإصدارات المثبتة)، درس القوالب المخصصة للفصل الرابع، درس الوكلاء المتعددين للفصل الخامس، و وثائق الورشة
- **🤖 تحديث قاعدة الفصل 2** من `azd 1.23.12` (مارس 2026) إلى `azd 1.27.1` عبر `agents.md`، `ai-model-deployment.md`، `ai-workshop-lab.md`، و `microsoft-foundry-integration.md`؛ تحديث تواريخ ملاحظات التحقق إلى 2026-07-13
- **🧩 تم تحديث امتداد وكيل AI** من `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` إلى الإصدار الحالي `1.0.0-beta.5` في README الفصل 2 و `agents.md`
- **🧪 تحديث مثال التحقق في الورشة** (`azd version` الإخراج) إلى `1.27.1`

#### ملاحظات على إصدارات azd ذات الصلة (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** دعم Go لوظائف Azure في الاستهلاك المرن، فلترات الاشتراك لكل مستأجر `azd config sub-filter`، حزم الامتدادات المستقلة (`azd x pack --bundle`)، و `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** نموذج مشاريع/وكلاء Azure AI Foundry بشكل مباشر في `azure.yaml` (تهيئة بدون Bicep أو Terraform)، دعم نشر الحاويات لخدمة التطبيقات (`host: appservice` + `language: docker`)، `-s/--source` مباشر لأوامر `azd extension`، و `azd tool uninstall`
- **1.27.1 (2026-07-09):** علم `--no-dependencies` لـ `azd extension install`، استبعاد النماذج المهجورة من مطالبات الكتالوج/الحصة افتراضيًا، وعدة إصلاحات للأخطاء

#### الملفات المحدثة
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

#### ملء فجوة للمبتدئين #2: تأليف القوالب، حاويات التطوير، بولومي، أزور ديف أوبس، المبادرات الخدمية، والمزيد
**تغلق هذه النسخة الفجوات المتبقية المتوسطة التي كشفت عنها تحليل تغطية azd: كيفية تأليف قالبك الخاص ونشره، بيئات الحاويات التطويرية/Codespaces القابلة لإعادة الإنتاج، مزود البنية التحتية Pulumi، استعراض CI/CD لـ Azure DevOps، توثيق المبادرات الخدمية، إرشادات اختيار المضيف (AKS/تطبيقات Spring على أزور)، شرح `azd restore`/`azd package`، معالجة أخطاء الخُطاف، وممارسات فرق/بيئات مشتركة.**

#### أُضيف
- **🧱 درس جديد في الفصل 4** `docs/chapter-04-infrastructure/custom-templates.md` — تأليف قالب azd الخاص بك: البنية المطلوبة (`azure.yaml`, `infra/`, `src/`)، حقل `metadata.template`، تمرير المعلمات للبنية التحتية باستخدام رمز المورد `uniqueString()` والوسم `azd-env-name`، الاختبار محليًا مع `azd init --template <local-path>`، النشر إلى GitHub، والتقديم إلى معرض Awesome AZD
- **📦 درس جديد في الفصل 1** `docs/chapter-01-foundation/dev-containers.md` — بيئات azd القابلة لإعادة الإنتاج مع Dev Containers وGitHub Codespaces: `.devcontainer/devcontainer.json` مصغر باستخدام ميزة `ghcr.io/azure/azure-dev/azd` الرسمية، ميزات خاصة باللغات، `docker-in-docker` لمضيفي الحاويات، و `azd auth login --use-device-code` لتسجيل الدخول عن بعد
- **🧩 قسم Pulumi مع azd** في `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`، تخطيط مجلد Pulumi، الحزم المرتبطة ببيئات azd، المخرجات/الوسم المطلوبة، وسير العمل `azd up` / `azd down` المطابق
- **🎯 إرشادات اختيار المضيف** في `docs/chapter-04-infrastructure/provisioning.md` — مقارنة ملائمة للمبتدئين بين `appservice`، `staticwebapp`، `function`، `containerapp`، `aks`، و`springapp`، مع إرشادات متى تختار AKS أو تطبيقات Azure Spring
- **🛠️ استعراض CI/CD لأزور ديف أوبس** في `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`، اتصال الخدمة مع اتحاد هوية عبء العمل (OIDC)، `azure-dev.yml` المتولد، وإعداد مجموعة المتغيرات
- **🔑 المبادرات الخدمية (النمط 4)** أُضيف إلى `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`، الوصول غير التفاعلي `azd auth login` مع سر العميل مقابل بيانات الاعتماد الفيدرالية/OIDC، متى تستخدم، وتخزين بيانات الاعتماد بأمان
- **🪝 معالجة أخطاء الخُطاف** قسم فرعي في `docs/chapter-04-infrastructure/deployment-guide.md` — رموز الخروج و`set -e`، `continueOnError`، اختبار الخُطاف بمعزل باستخدام `azd hooks run`، الشل الخاص بنظام التشغيل، و`--debug`
- **👥 قسم الفريق/البيئات المشتركة** في `docs/chapter-03-configuration/configuration.md` — ما يعيش في `.azure/`، ما يجب تجاهله في git، بيئات كل مطور، `azd env list`/`select`، وتوفير قيم البيئة في CI/CD
- **🧰 شرح `azd restore` و`azd package` الموسع** في `resources/cheat-sheet.md` — استعادة التبعيات وبناء قطعة قابلة للنشر بدون النشر

#### تم التغيير
- **🧭 تحديث جدول دروس الفصل 4** ليشمل درس "تأليف قالبك الخاص" الجديد (الدرس 3)
- **🧭 تحديث جدول دروس الفصل 1** ليشمل درس "حاويات التطوير وCodespaces" الجديد (الدرس 5)؛ تواصل تذييلات التنقل بين `bring-your-own-app.md` و`dev-containers.md`

### [v3.21.0] - 2026-06-16

#### ملء فجوة للمبتدئين: درس متعدد الوكلاء عملي، "أحضر تطبيقك الخاص"، Terraform، واستعراض CI/CD
**تغلق هذه النسخة أكبر الفجوات لدليل المبتدئين الكامل بإضافة درسين عمليين جديدين (درس متعدد وكلاء قابل للنشر ودليل إضافة azd إلى تطبيق قائم)، مقدمة ودية للخُطاف، قسم Terraform مع azd، استعراض خطوة بخطوة لخط أنابيب GitHub Actions، شرح للامتدادات الجديدة في المعاينة، وقائمة تحقق صريحة للتحقق من النشر.**

#### أُضيف
- **🤝 درس جديد في الفصل 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — درس عملي تمامًا متعدد الوكلاء قابل للنشر (منسق + متخصصين) باستخدام قالب حقيقي (`contoso-creative-writer`)، يغطي متى تستخدم متعدد الوكلاء، سير العمل `azd up`، فهم الموارد المنشورة، التتبع عبر الوكلاء، التخصيص، والتنظيف
- **📦 درس جديد في الفصل 1** `docs/chapter-01-foundation/bring-your-own-app.md` — كيفية إضافة azd إلى مشروع قائم مع `azd init` ("استخدام الكود في الدليل الحالي"), فهم `azure.yaml` و`infra/`، `azd infra generate`، كشف المضيف، والنشر باستخدام `azd up`
- **🌐 قسم Terraform مع azd** أُضيف إلى `docs/chapter-04-infrastructure/provisioning.md` — تكوين `infra.provider: terraform`، تخطيط مجلد `.tf`، المخرجات المطلوبة `AZURE_*` والوسم `azd-env-name`، وسير العمل المطابق `azd up` / `azd down` (يغلق الفجوة حيث كان دعم Terraform مدعى فقط وتم عرض Bicep فقط)
- **⚙️ استعراض GitHub Actions خطوة بخطوة** في `docs/chapter-08-production/production-ai-practices.md` — من مستودع GitHub إلى النشرات الآلية: `azd pipeline config`، بيانات اعتماد اتحاد OIDC (بدون أسرار مخزنة)، `azure-dev.yml` المتولد، وإرشادات الأسرار مقابل المتغيرات
- **🪝 مقدمة ودية للمبتدئين "جديد على الخُطاف؟"** في `docs/chapter-04-infrastructure/deployment-guide.md` — ما هو الخُطاف، جدول مراحل الخُطاف، أول خُطاف بسيط، وتشغيل الخُطاف يدويًا مع `azd hooks run`
- **✅ إضافة قائمة تحقق "تحقق من نشر تطبيقك"** إلى الخطوة 5 من `docs/chapter-01-foundation/first-project.md` — اختبار الدخان، فحص نقطة نهاية الصحة، ومعايير نجاح صريحة
- **🧩 شرح لامتدادات المعاينة الجديدة** `azure.ai.skills` و`azure.ai.connections` (ما هي ومتى تستخدمها) في `docs/chapter-08-production/production-ai-practices.md`

#### تم التغيير
- **🧭 تصحيح جدول دروس الفصل 5**: `multi-agent-basics.md` هو الآن الدرس 1 (الدرس العملي الوحيد)، مع تسمية صادقة أن الدرس 2 في الفصل 6 وسيناريو التجزئة هو مخطط هندسي، وليس قالب بأمر واحد
- **🧭 تحديث جدول دروس الفصل 1** ليشمل درس "أحضر تطبيقك الخاص" الجديد (الدرس 4)
- **🔗 تحديث تذييلات التنقل**: `first-project.md` الآن يربط للأمام إلى `bring-your-own-app.md`

#### تم الإصلاح
- **🧱 سد فجوة Terraform "المزعومة لكن المفقودة"** — كانت الدورة سابقًا تشير لدعم Terraform بدون عرضه
- **🔀 تصحيح الروابط الخاطئة في الفصل 5** التي ألمحت لوجود تنفيذ متعدد وكلاء كامل بينما يوجد فقط مخطط هندسي

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

#### تحديث AZD 1.25.6، أوامر دورة حياة العميل الكاملة وإعادة تسمية Aspire
**تعيد هذه النسخة التحقق من صحة الدورة مقابل `azd` `1.25.6` (يونيو 2026) وامتداد `azure.ai.agents` `0.1.40-preview`، وتوسع توجيهات الذكاء الاصطناعي من "إنشاء وكيل" إلى دورة حياة العميل الكاملة (اختبار → تقييم → تحسين → فحص → حذف)، وتعرض الامتدادات الجديدة `azure.ai.skills` و `azure.ai.connections` للمعاينة، وتذكر إعادة تسمية المنتج من ".NET Aspire" إلى "Aspire".**

#### تمت الإضافة
- **🔁 تغطية دورة حياة العميل الكاملة** للمبتدئين ومهندسي الذكاء الاصطناعي عبر الوثائق:
  - `docs/chapter-01-foundation/azd-basics.md` — جدول دورة الحياة (إنشاء → اختبار → قياس → تحسين → فحص → تنظيف) أُضيف إلى قسم الامتدادات وأوامر الذكاء الاصطناعي
  - `docs/chapter-08-production/production-ai-practices.md` — قسم جديد "إدارة دورة حياة العميل" يغطي `azd ai agent invoke`، `endpoint show`، `eval generate`، `optimize`، `code download`، و `delete --force`
  - `resources/cheat-sheet.md` — توسعة أوامر وكيل الذكاء الاصطناعي مع `invoke`، `endpoint show`، `eval generate`، `optimize`، `code download`، و `delete --force`
- **🧩 امتدادات معاينة جديدة** موثقة: `azure.ai.skills` (مهارات وكيل قابلة لإعادة الاستخدام) و `azure.ai.connections` (اتصالات Foundry) أُضيفا إلى جدول الامتدادات ونموذج الغش
- **⏱️ توجيهات توقيت الاستجابة** — أمثلة `azd ai agent invoke` تذكر الآن أنها تطبع إجمالي الكمون ووقت وصول أول بايت
- **📌 لافتة النسخة** في README الجذر تشير إلى `azd version` و `azd upgrade`

#### تم التغيير
- **✅ تحديث خط الأساس للتحقق من الصحة** من `azd 1.23.12` (مارس 2026) إلى `azd 1.25.6` (يونيو 2026) عبر جميع README الفصول ومستندات الورشة
- **🤖 تحديث ملاحظة امتداد الفصل 2** من `azure.ai.agents` `0.1.18-preview` إلى `0.1.40-preview`
- **🧪 تحديث مثال التحقق من صحة الورشة** (ناتج `azd version`) إلى `1.25.6`
- **🧭 تحديث README "ما الجديد في azd اليوم"** لتسليط الضوء على دورة حياة العميل من البداية للنهاية، امتدادات الذكاء الاصطناعي الجديدة، وتصحيحات جودة الحياة الحديثة (`azd init` التكرار، `azd auth login` إزالة الرموز التالفة، `azd tool` مطالبة التشغيل الأول)
- **📖 الفصل 2 agents.md (الخيار 4)** يشير الآن للمستخدمين لأوامر دورة الحياة بعد النشر بدلاً من التوقف عند `azd up`

#### تم الإصلاح
- **🏷️ تسمية المنتج** — تمت إضافة ملاحظة إعادة التسمية لـ Aspire (أصبح ".NET Aspire" الآن فقط "Aspire")؛ دعم azd لـ Aspire لم يتغير
- **🔎 التحقق من صحة الإصدار المباشر** تم التأكيد عبر تغذية إصدار Azure Developer CLI: CLI مستقر `1.25.6` (2026-06-12) و `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### توضيح إرشادات المبتدئين، التحقق من الإعداد، وتنظيف أوامر AZD النهائية
**تتبع هذه النسخة فحص التحقق من صحة AZD 1.23 بجولة توثيق موجهة للمبتدئين: توضح إرشادات المصادقة التي تعتمد على AZD أولاً، تضيف نصوص تحقق من الإعداد المحلي، تتحقق من الأوامر الأساسية مقابل AZD CLI الحي، وتزيل آخر مراجع أوامر المصدر الإنجليزي القديمة خارج سجل التغييرات.**

#### تمت الإضافة
- **🧪 نصوص تحقق إعداد المبتدئين** مع `validate-setup.ps1` و `validate-setup.sh` لتمكين المتعلمين من تأكيد أدواتهم المطلوبة قبل بدء الفصل 1
- **✅ خطوات تحقق الإعداد المسبق** في README الجذر و README الفصل 1 لالتقاط المتطلبات المفقودة قبل `azd up`

#### تم التغيير
- **🔐 إرشادات مصادقة المبتدئين** تتعامل الآن بثبات مع `azd auth login` كالمسار الرئيسي لعميات AZD، مع إبراز `az login` كخيار اختياري إلا إذا تم استخدام أوامر Azure CLI مباشرة
- **📚 تدفق انضمام الفصل 1** يشير الآن للمتعلمين للتحقق من إعدادهم المحلي قبل خطوات التثبيت، المصادقة، والنشر الأول
- **🛠️ رسائل المحقق** تفصل الآن بوضوح بين المتطلبات التي تمنع التقدم والتحذيرات الاختيارية لـ Azure CLI لمسار المبتدئين الذي يعتمد فقط على AZD
- **📖 التوثيق الخاص بالتكوين، التحري عن الأخطاء، والأمثلة** يفرق الآن بين مصادقة AZD المطلوبة وتسجيل الدخول الاختياري لـ Azure CLI حيثما كانت تعرض سابقًا بدون سياق

#### تم الإصلاح
- **📋 تحديث المراجع المتبقية لأوامر المصدر الإنجليزي** إلى أشكال AZD الحالية، بما في ذلك `azd config show` في نموذج الغش و `azd monitor --overview` حيثما وُجهت تعليمات نظرة عامة على بوابة Azure
- **🧭 تخفيف ادعاءات المبتدئين في الفصل 1** لتجنب الوعود الزائدة بسلوك بدون أخطاء أو التراجع المضمون عبر جميع القوالب وموارد Azure
- **🔎 التحقق الحي من CLI** أكد الدعم الحالي لـ `azd env get-values`، `azd template list`، `azd extension list --installed`، `azd copilot consent list`، `azd mcp start`، `azd provision --preview`، `azd monitor --logs`، و `azd down --force --purge`

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

#### التحقق من AZD 1.23.12، توسيع بيئة الورش، وتحديث نموذج AI
**تقوم هذه النسخة بجولة تحقق توثيقية ضد `azd` `1.23.12`، تحدّث أمثلة أوامر AZD القديمة، تجدد إرشادات نموذج AI للتهيئة الافتراضية الحالية، وتوسع توجيهات الورشة لتشمل حاويات التطوير والاستنساخات المحلية إلى جانب GitHub Codespaces.**

#### تمت الإضافة
- **✅ ملاحظات التحقق عبر الفصول الأساسية ووثائق الورشة** لتوضيح معيار AZD المختبر للمتعلمين باستخدام إصدار CLI أحدث أو أقدم
- **⏱️ إرشادات مهلة النشر** لنشر تطبيقات AI طويلة المدة باستخدام `azd deploy --timeout 1800`
- **🔎 خطوات فحص الامتدادات** مع `azd extension show azure.ai.agents` في وثائق سير عمل AI
- **🌐 إرشادات أوسع لبيئة الورشة** تغطي GitHub Codespaces، حاويات التطوير، واستنساخات محلية باستخدام MkDocs

#### تم التغيير
- **📚 README مقدمات الفصول** تشير الآن بثبات إلى التحقق من صحة `azd 1.23.12` عبر الأقسام الأساسية، التكوين، البنية التحتية، تعدد العملاء، قبل النشر، التحري عن الأخطاء، والإنتاج
- **🛠️ تحديث مراجع أوامر AZD** إلى الأشكال الحالية عبر الوثائق:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` أو `azd env get-value(s)` حسب السياق
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` حيثما يُقصد نظرة عامة على Application Insights
- **🧪 تبسيط أمثلة المعاينة الموفرة** إلى الاستخدام المدعوم الحالي مثل `azd provision --preview` و `azd provision --preview -e production`
- **🧭 تحديث تدفق الورشة** لتمكين المتعلمين من إكمال المختبرات في Codespaces أو حاوية تطوير أو استنساخ محلي بدلاً من الفرض على تنفيذ Codespaces فقط
- **🔐 تفضيل إرشادات المصادقة** لـ `azd auth login` لسير عمل AZD، مع اعتبار `az login` اختياريًا عند استخدام أوامر Azure CLI مباشرة

#### تم الإصلاح
- **🪟 توحيد أوامر التثبيت على Windows** إلى حالة الحزمة الحالية `winget` في دليل التثبيت
- **🐧 تصحيح إرشادات التثبيت على Linux** لتجنب تعليمات مدير الحزمة الخاصة بالتوزيعة غير المدعومة `azd` والبدل بالإشارة إلى أصول الإصدار حيثما كان مناسبًا
- **📦 تحديث أمثلة نموذج AI** من الافتراضات القديمة مثل `gpt-35-turbo` و `text-embedding-ada-002` إلى أمثلة حاليّة مثل `gpt-4.1-mini`، `gpt-4.1`، و `text-embedding-3-large`
- **📋 تصحيح مقتطفات النشر والتشخيص** لاستخدام أوامر البيئة والحالة الحالية في السجلات والنصوص وخطوات التحري عن الأخطاء
- **⚙️ تحديث إرشادات GitHub Actions** من `Azure/setup-azd@v1.0.0` إلى `Azure/setup-azd@v2`
- **🤖 تحديث إرشادات موافقة MCP/Copilot** من `azd mcp consent` إلى `azd copilot consent list`

#### تحسينات
- **🧠 إرشادات فصل الذكاء الاصطناعي** توضح الآن سلوكيات `azd ai` الحساسة للمعاينة، تسجيل الدخول حسب المستأجر، الاستخدام الحالي للامتدادات، وتوصيات تحديث نشر النماذج
- **🧪 تعليمات الورشة** تستخدم الآن أمثلة إصدارات أكثر واقعية ولغة إعداد بيئة أوضح للمختبرات العملية
- **📈 توافق أفضل مع التوثيق الإنتاجي والتحري عن الأخطاء** مع مراقبة حالية، نموذج بديل، وأمثلة مستويات التكلفة

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
**تضيف هذه النسخة تغطية الأوامر `azd ai`، `azd extension`، و `azd mcp` عبر جميع فصول الذكاء الاصطناعي، تصلح الروابط المعطلة والكود المهمل في agents.md، تحدّث نموذج الغش، وتجدد قسم قوالب الأمثلة مع أوصاف مصدقة وقوالب Azure AI AZD جديدة.**

#### تمت الإضافة
- **🤖 تغطية أوامر AZD AI CLI** عبر 7 ملفات (كانت سابقًا في الفصل 8 فقط):
  - `docs/chapter-01-foundation/azd-basics.md` — قسم جديد "الامتدادات وأوامر الذكاء الاصطناعي" يقدم `azd extension`، `azd ai agent init`، و `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — الخيار 4: `azd ai agent init` مع جدول مقارنة (القالب مقابل منهج المانيفست)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — الأقسام الفرعية "امتدادات AZD لـ Foundry" و"نشر العميل أولاً"
  - `docs/chapter-05-multi-agent/README.md` — البدء السريع يعرض الآن كلا مسارات النشر القائمة على القالب والمانيفست
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — قسم النشر يشمل الآن خيار `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — القسم الفرعي "أوامر امتداد AZD AI للتشخيص"
  - `resources/cheat-sheet.md` — قسم جديد "أوامر الذكاء الاصطناعي والامتدادات" مع `azd extension`، `azd ai agent init`، `azd mcp`، و `azd infra generate`
- **📦 قوالب أمثلة AZD AI الجديدة** في `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — دردشة RAG على .NET مع Blazor WebAssembly، Semantic Kernel، ودعم الدردشة الصوتية
  - **azure-search-openai-demo-java** — دردشة RAG على جافا باستخدام Langchain4J مع خيارات نشر ACA/AKS
  - **contoso-creative-writer** — تطبيق كتابة إبداعية متعدد الوكلاء باستخدام Azure AI Agent Service، Bing Grounding، و Prompty
  - **serverless-chat-langchainjs** — RAG بدون خادم باستخدام Azure Functions + LangChain.js + Cosmos DB مع دعم تطوير محلي من Ollama
  - **مسرع حل الدردشة مع بياناتك** — مسرع RAG للمؤسسات مع بوابة إدارية، تكامل Teams، وخيارات PostgreSQL/Cosmos DB  
  - **وكلاء Azure AI** — تطبيق مرجعي لتنظيم MCP متعدد الوكلاء مع خوادم بـ .NET، Python، Java، وTypeScript  
  - **مُبدئ AI لـ azd** — نموذج بدء بيسيب البنية التحتية الأساسية لـ Azure AI  
  - **🔗 رابط معرض Awesome AZD AI** — إشارة إلى معرض [awesome-azd AI](https://azure.github.io/awesome-azd/?tags=ai) (أكثر من 80 نموذجًا)  

#### تم الإصلاح  
- **🔗 التنقل في agents.md**: تحققت روابط السابق/التالي لتتطابق مع ترتيب درس الفصل 2 README (تكامل Microsoft Foundry → الوكلاء → نشر نموذج AI)  
- **🔗 الروابط المعطلة في agents.md**: تم تصحيح `production-ai-practices.md` إلى `../chapter-08-production/production-ai-practices.md` (3 مرات)  
- **📦 كود متقاعد في agents.md**: تم استبدال `opencensus` بـ `azure-monitor-opentelemetry` + SDK OpenTelemetry  
- **🐛 API غير صالح في agents.md**: تم نقل `max_tokens` من `create_agent()` إلى `create_run()` باعتباره `max_completion_tokens`  
- **🔢 عد الرموز في agents.md**: تم استبدال تقدير تقريبي `len//4` بـ `tiktoken.encoding_for_model()`  
- **عرض توضيحي azure-search-openai**: تم تصحيح الخدمات من "بحث معرفي + خدمة التطبيق" إلى "Azure AI Search + تطبيقات الحاويات Azure" (تغيير المضيف الافتراضي أكتوبر 2024)  
- **contoso-chat**: تم تحديث الوصف للإشارة إلى Azure AI Foundry + Prompty، بما يتطابق مع العنوان الفعلي ومستوى التكنولوجيا في المستودع  

#### تم الإزالة  
- **معالجة المستندات AI**: تمت إزالة إشارة قالب غير وظيفي (المستودع غير متاح للعامة كقالب AZD)  

#### تحسينات  
- **📝 تمارين agents.md**: يعرض التمرين 1 الناتج المتوقع وخطوة `azd monitor`؛ يتضمن التمرين 2 رمز تسجيل `FunctionTool` كاملًا؛ يستبدل التمرين 3 التوجيهات الغامضة بأوامر `prepdocs.py` ملموسة  
- **📚 مصادر agents.md**: تم تحديث روابط الوثائق إلى مستندات خدمة Azure AI Agent الحالية ودليل البداية السريع  
- **📋 جدول الخطوات التالية في agents.md**: إضافة رابط مختبر ورشة عمل AI لتغطية شاملة للفصل  

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
**تحسن هذا الإصدار في التنقل بين فصول README.md بفضل تنسيق جدول محسن.**  

#### التغييرات  
- **جدول خريطة الدورة**: تم تحسينه بالروابط المباشرة للدروس، تقديرات المدة، وتقييمات التعقيد  
- **تنظيف المجلدات**: إزالة مجلدات قديمة زائدة (deployment/, getting-started/, pre-deployment/, troubleshooting/)  
- **التحقق من الروابط**: تم التحقق من أكثر من 21 رابطًا داخليًا في جدول خريطة الدورة  

### [v3.16.0] - 2026-02-05  

#### تحديث أسماء المنتجات  
**يقوم هذا الإصدار بتحديث إشارات المنتجات لتتوافق مع العلامة التجارية الحالية لـ Microsoft.**  

#### التغييرات  
- **Microsoft Foundry → Microsoft Foundry**: تم تحديث جميع الإشارات عبر ملفات غير الترجمة  
- **خدمة Azure AI Agent → Foundry Agents**: تم تحديث اسم الخدمة ليعكس العلامة التجارية الحالية  

#### الملفات التي تم تحديثها  
- `README.md` - الصفحة الرئيسية للدورة  
- `changelog.md` - سجل الإصدار  
- `course-outline.md` - هيكل الدورة  
- `docs/chapter-02-ai-development/agents.md` - دليل الوكلاء AI  
- `examples/README.md` - توثيق الأمثلة  
- `workshop/README.md` - صفحة ورشة العمل  
- `workshop/docs/index.md` - فهرس ورشة العمل  
- `workshop/docs/instructions/*.md` - جميع ملفات تعليمات ورشة العمل  

---

### [v3.15.0] - 2026-02-05  

#### إعادة هيكلة رئيسية للمستودع: مجلدات مرتبة حسب الفصول  
**يعيد هذا الإصدار تنظيم الوثائق إلى مجلدات مخصصة للفصول لتسهيل التنقل.**  

#### إعادة تسمية المجلدات  
تم استبدال المجلدات القديمة بمجلدات مرقمة حسب الفصل:  
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`  
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`  
- `docs/deployment/` → `docs/chapter-04-infrastructure/`  
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`  
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`  
- تمت إضافة جديد: `docs/chapter-05-multi-agent/`  

#### الترحيلات الملفية  
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
| جميع ملفات ما قبل النشر | pre-deployment/ | chapter-06-pre-deployment/ |  
| جميع ملفات استكشاف الأخطاء وإصلاحها | troubleshooting/ | chapter-07-troubleshooting/ |  

#### تم الإضافة  
- **📚 ملفات README الخاصة بالفصول**: إنشاء README.md في كل مجلد فصل يتضمن:  
  - أهداف التعلم والمدة  
  - جدول الدروس مع الأوصاف  
  - أوامر بدء سريعة  
  - التنقل إلى الفصول الأخرى  

#### التغييرات  
- **🔗 تحديث جميع الروابط الداخلية**: تحديث أكثر من 78 مسارًا عبر جميع ملفات الوثائق  
- **🗺️ ملف README.md الرئيسي**: تحديث خريطة الدورة مع الهيكل الجديد للفصول  
- **📝 أمثلة/README.md**: تحديث مراجع متقاطعة إلى مجلدات الفصول  

#### الإزالة  
- هيكل المجلدات القديم (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)  

---

### [v3.14.0] - 2026-02-05  

#### إعادة هيكلة المستودع: التنقل حسب الفصل  
**تم في هذا الإصدار إضافة ملفات README للتنقل حسب الفصل (تم استبدالها بالإصدار v3.15.0).**  

---

### [v3.13.0] - 2026-02-05  

#### دليل جديد للوكلاء AI  
**يضيف هذا الإصدار دليلًا شاملاً لنشر وكلاء AI باستخدام Azure Developer CLI.**  

#### الإضافة  
- **🤖 docs/microsoft-foundry/agents.md**: دليل كامل يتناول:  
  - ما هو وكلاء AI وكيف يختلفون عن الروبوتات الحوارية  
  - ثلاثة نماذج بدء سريعة للوكلاء (Foundry Agents, Prompty, RAG)  
  - أنماط هندسة الوكيل (وكيل منفرد، RAG، متعدد الوكلاء)  
  - إعداد وتخصيص الأدوات  
  - المراقبة وتتبع المقاييس  
  - اعتبارات التكلفة والتحسين  
  - سيناريوهات استكشاف الأخطاء الشائعة  
  - ثلاثة تمارين تطبيقية مع معايير نجاح  

#### هيكل المحتوى  
- **مقدمة**: مفاهيم الوكيل للمبتدئين  
- **بدء سريع**: نشر الوكلاء باستخدام `azd init --template get-started-with-ai-agents`  
- **أنماط البنية**: مخططات بصرية لأنماط الوكلاء  
- **الإعداد**: إعداد الأدوات ومتغيرات البيئة  
- **المراقبة**: تكامل Application Insights  
- **التمارين**: تعلم تطبيقي تدريجي (20-45 دقيقة لكل تمرين)  

---

### [v3.12.0] - 2026-02-05  

#### تحديث بيئة DevContainer  
**يحدث هذا الإصدار تكوين حاوية التطوير مع أدوات حديثة وإعدادات افتراضية محسنة لتجربة تعلم AZD.**  

#### التغييرات  
- **🐳 صورة أساسية**: تحديث من `python:3.12-bullseye` إلى `python:3.12-bookworm` (آخر إصدار مستقر من Debian)  
- **📛 اسم الحاوية**: إعادة التسمية من "Python 3" إلى "AZD للمبتدئين" للوضوح  

#### الإضافة  
- **🔧 ميزات جديدة لحاوية التطوير**:  
  - `azure-cli` مع تمكين دعم Bicep  
  - `node:20` (إصدار LTS لنماذج AZD)  
  - `github-cli` لإدارة النماذج  
  - `docker-in-docker` لنشر تطبيقات الحاويات  

- **🔌 إعادة توجيه المنافذ**: منافذ مجهزة مسبقًا للتطوير الشائع:  
  - 8000 (معاينة MkDocs)  
  - 3000 (تطبيقات ويب)  
  - 5000 (Python Flask)  
  - 8080 (واجهات برمجة التطبيقات)  

- **🧩 ملحقات VS Code الجديدة**:  
  - `ms-python.vscode-pylance` - تحسين IntelliSense لـ Python  
  - `ms-azuretools.vscode-azurefunctions` - دعم Azure Functions  
  - `ms-azuretools.vscode-docker` - دعم Docker  
  - `ms-azuretools.vscode-bicep` - دعم لغة Bicep  
  - `ms-azure-devtools.azure-resource-groups` - إدارة موارد Azure  
  - `yzhang.markdown-all-in-one` - تحرير Markdown  
  - `DavidAnson.vscode-markdownlint` - تدقيق Markdown  
  - `bierner.markdown-mermaid` - دعم مخططات Mermaid  
  - `redhat.vscode-yaml` - دعم YAML (لـ azure.yaml)  
  - `eamodio.gitlens` - تصور Git  
  - `mhutchie.git-graph` - سجل Git  

- **⚙️ إعدادات VS Code**: تم إضافة الإعدادات الافتراضية لمفسر Python، التنسيق عند الحفظ، وإزالة الفراغات  

- **📦 تحديث requirements-dev.txt**:  
  - إضافة ملحق تصغير MkDocs  
  - إضافة pre-commit لجودة الكود  
  - إضافة حزم Azure SDK (azure-identity, azure-mgmt-resource)  

#### تم الإصلاح  
- **أمر ما بعد الإنشاء**: يتحقق الآن من تثبيت AZD و Azure CLI عند بدء الحاوية  

---

### [v3.11.0] - 2026-02-05  

#### إعادة تصميم README للمبتدئين  
**يحسن هذا الإصدار README.md بشكل كبير ليصبح أكثر سهولة للمبتدئين ويضيف موارد أساسية لمطوري AI.**  

#### الإضافة  
- **🆚 مقارنة Azure CLI و AZD**: شرح واضح لمتى يستخدم كل أداة مع أمثلة عملية  
- **🌟 روابط Awesome AZD**: روابط مباشرة إلى معرض نماذج المجتمع وموارد المساهمة:  
  - [معرض Awesome AZD](https://azure.github.io/awesome-azd/) - أكثر من 200 نموذج جاهز للنشر  
  - [إرسال نموذج](https://github.com/Azure/awesome-azd/issues) - مساهمة المجتمع  
- **🎯 دليل البدء السريع**: قسم مبسط بالخطوات الثلاثة للبدء (تثبيت → تسجيل الدخول → النشر)  
- **📊 جدول التنقل المبني على الخبرة**: إرشاد واضح عن مكان البدء بناءً على خبرة المطور  

#### التغييرات  
- **هيكل README**: إعادة تنظيم لكشف تدريجي - المعلومات الرئيسية أولاً  
- **قسم المقدمة**: إعادة كتابة لشرح "سحر `azd up`" للمبتدئين تمامًا  
- **إزالة المحتوى المكرر**: حذف قسم استكشاف الأخطاء المكرر  
- **أوامر استكشاف الأخطاء وإصلاحها**: إصلاح إشارة `azd logs` لاستخدام `azd monitor --logs` صالح  

#### تم الإصلاح  
- **🔐 أوامر المصادقة**: إضافة `azd auth login` و `azd auth logout` إلى cheat-sheet.md  
- **مراجع الأوامر غير الصحيحة**: إزالة باقي `azd logs` من قسم README لاستكشاف الأخطاء  

#### ملاحظات  
- **النطاق**: التغييرات مطبقة على README.md الرئيسي وresources/cheat-sheet.md  
- **الجمهور المستهدف**: تحسينات موجهة خصيصًا للمطورين الجدد على AZD  

---

### [v3.10.0] - 2026-02-05  

#### تحديث دقة أوامر Azure Developer CLI  
**يصَحح هذا الإصدار أوامر AZD غير الموجودة في جميع المستندات، مما يضمن أن جميع أمثلة الكود تستخدم بناء جملة Azure Developer CLI صالحًا.**  

#### تم الإصلاح  
- **🔧 إزالة أوامر AZD غير الموجودة**: تدقيق شامل وتصحيح للأوامر غير الصالحة:  
  - `azd logs` (غير موجودة) → استبدال بـ `azd monitor --logs` أو بدائل Azure CLI  
  - أوامر فرعية `azd service` (غير موجودة) → استبدال بـ `azd show` و Azure CLI  
  - `azd infra import/export/validate` (غير موجودة) → إزالة أو استبدال ببدائل صالحة  
  - أعلام `azd deploy --rollback/--incremental/--parallel/--detect-changes` (غير موجودة) → إزالة  
  - أعلام `azd provision --what-if/--rollback` (غير موجودة) → تحديث لاستخدام `--preview`  
  - `azd config validate` (غير موجودة) → استبدال بـ `azd config list`  
  - `azd info`، `azd history`، `azd metrics` (غير موجودة) → إزالة  

- **📚 ملفات تم تحديثها مع تصحيحات الأوامر**:  
  - `resources/cheat-sheet.md`: مراجعة شاملة لمراجع الأوامر  
  - `docs/deployment/deployment-guide.md`: تصحيح استراتيجيات الرجوع والنشر  
  - `docs/troubleshooting/debugging.md`: تصحيح أقسام تحليل السجلات  
  - `docs/troubleshooting/common-issues.md`: تحديث أوامر استكشاف الأخطاء  
  - `docs/troubleshooting/ai-troubleshooting.md`: تصحيح قسم تصحيح AZD  
  - `docs/getting-started/azd-basics.md`: تم تصحيح أوامر المراقبة  
  - `docs/getting-started/first-project.md`: تم تحديث أمثلة المراقبة وتصحيح الأخطاء  
  - `docs/getting-started/installation.md`: تم إصلاح أمثلة المساعدة والإصدار  
  - `docs/pre-deployment/application-insights.md`: تم تصحيح أوامر عرض السجلّات  
  - `docs/pre-deployment/coordination-patterns.md`: تم إصلاح أوامر تصحيح الأخطاء للوكيل  

- **📝 تم تحديث مرجع الإصدار**:  
  - `docs/getting-started/installation.md`: تم تغيير الإصدار المُشفر `1.5.0` إلى إصدار عام `1.x.x` مع رابط للإصدارات  

#### تم التغيير  
- **استراتيجيات التراجع**: تم تحديث الوثائق لاستخدام التراجع القائم على Git (AZD لا يحتوي على تراجع أصلي)  
- **عرض السجلّات**: تم استبدال مراجع `azd logs` بـ `azd monitor --logs` و`azd monitor --live` وأوامر Azure CLI  
- **قسم الأداء**: تم إزالة أعلام النشر الموازي/التزايدي غير الموجودة، وتم توفير بدائل صحيحة  

#### التفاصيل التقنية  
- **أوامر AZD الصحيحة**: `init`، `up`، `auth`، `deploy`، `down`، `provision`، `publish`، `completion`، `config`، `env`، `show`، `version`، `monitor`  
- **أعلام azd monitor الصحيحة**: `--live`، `--logs`، `--overview`  
- **الميزات المحذوفة**: `azd logs`، `azd service`، `azd infra import/export/validate`، `azd history`، `azd metrics`، `azd info`، `azd config validate`  

#### ملاحظات  
- **التحقق**: تم التحقق من الأوامر مقابل Azure Developer CLI الإصدار v1.23.x  

---

### [v3.9.0] - 2026-02-05  

#### تحديث إكمال الورشة وجودة التوثيق  
**يكمل هذا الإصدار وحدات الورشة التفاعلية، يصلح جميع الروابط المكسورة في الوثائق، ويحسن جودة المحتوى بشكل عام لمطوري الذكاء الاصطناعي الذين يستخدمون Microsoft AZD.**  

#### مضاف  
- **📝 CONTRIBUTING.md**: مستند إرشادات إسهام جديد مع:  
  - تعليمات واضحة للإبلاغ عن المشاكل واقتراح التغييرات  
  - معايير التوثيق لمحتوى جديد  
  - إرشادات لأمثلة الشيفرة وقواعد رسائل الالتزام  
  - معلومات مشاركة المجتمع  

#### مكتمل  
- **🎯 وحدة ورشة العمل 7 (الختام)**: الانتهاء الكامل من وحدة الختام مع:  
  - ملخص شامل لإنجازات الورشة  
  - قسم المفاهيم الرئيسية المشمولة لـ AZD والقوالب وMicrosoft Foundry  
  - توصيات لمتابعة رحلة التعلم  
  - تمارين تحدي الورشة مع تقييمات الصعوبة  
  - تعليقات المجتمع وروابط الدعم  

- **📚 وحدة ورشة العمل 3 (التفكيك)**: تم تحديث أهداف التعلم مع:  
  - إرشادات تفعيل GitHub Copilot مع خوادم MCP  
  - فهم هيكل مجلد قوالب AZD  
  - أنماط تنظيم البنية التحتية ككود (Bicep)  
  - تعليمات المختبر العملي  

- **🔧 وحدة ورشة العمل 6 (التفكيك)**: تم الانتهاء مع:  
  - أهداف تنظيف الموارد وإدارة التكاليف  
  - استخدام `azd down` لإلغاء توفير البنية التحتية بأمان  
  - إرشادات استرداد خدمات الإدراك المحذوفة ناعماً  
  - محفزات استكشاف إضافية لـ GitHub Copilot وبوابة Azure  

#### تم الإصلاح  
- **🔗 إصلاح الروابط المكسورة**: تم حل أكثر من 15 رابط توثيق داخلي مكسور:  
  - `docs/ai-foundry/ai-model-deployment.md`: تم تصحيح المسارات لـ microsoft-foundry-integration.md  
  - `docs/troubleshooting/ai-troubleshooting.md`: تم تصحيح مسارات ai-model-deployment.md و production-ai-practices.md  
  - `docs/getting-started/first-project.md`: تم استبدال cicd-integration.md غير الموجود بـ deployment-guide.md  
  - `examples/retail-scenario.md`: تم إصلاح مسارات الأسئلة الشائعة ودليل استكشاف الأخطاء  
  - `examples/container-app/microservices/README.md`: تم تصحيح مسارات صفحة الدورة ودليل النشر  
  - `resources/faq.md` و `resources/glossary.md`: تم تحديث مراجع فصل الذكاء الاصطناعي  
  - `course-outline.md`: تم إصلاح مراجع دليل المُدرّب ومختبر الذكاء الاصطناعي  

- **📅 لافتة حالة الورشة**: تم تحديثها من "قيد الإنشاء" إلى حالة الورشة الفعالة بتاريخ فبراير 2026  

- **🔗 تنقل الورشة**: تم إصلاح الروابط المكسورة داخل README.md الخاصة بالورشة التي تشير إلى مجلد lab-1-azd-basics غير الموجود  

#### تم التغيير  
- **عرض الورشة**: إزالة تحذير "قيد الإنشاء"، الورشة الآن مكتملة وجاهزة للاستخدام  
- **اتساق التنقل**: ضمان أن جميع وحدات الورشة تحتوي على تنقل مناسب بين الوحدات  
- **مراجع مسار التعلم**: تم تحديث المراجع البينية للفصول مع المسارات الصحيحة لمايكروسوفت فاوندري  

#### تم التحقق  
- ✅ جميع ملفات markdown الإنجليزية تحتوي على روابط داخلية صحيحة  
- ✅ وحدات الورشة 0-7 مكتملة مع أهداف تعلم  
- ✅ التنقل بين الفصول والوحدات يعمل بشكل صحيح  
- ✅ المحتوى مناسب لمطوري الذكاء الاصطناعي باستخدام Microsoft AZD  
- ✅ تم الحفاظ على لغة وبنية مناسبة للمبتدئين طوال الطريق  
- ✅ ملف CONTRIBUTING.md يوفر إرشادات واضحة للمساهمين في المجتمع  

#### التنفيذ التقني  
- **التحقق من الروابط**: برنامج PowerShell تلقائي تحقق من كافة الروابط الداخلية بصيغة .md  
- **تدقيق المحتوى**: مراجعة يدوية لاكتمال الورشة ومدى ملائمتها للمبتدئين  
- **نظام التنقل**: تطبيق أنماط تنقل متسقة للفصل والوحدة  

#### ملاحظات  
- **النطاق**: التغييرات تطبق فقط على الوثائق الإنجليزية  
- **الترجمات**: لم يتم تحديث مجلدات الترجمة في هذا الإصدار (الترجمة الآلية ستتم مزامنتها لاحقاً)  
- **مدة الورشة**: الورشة المكتملة تقدم الآن 3-4 ساعات من التعلم العملي  

---

### [v3.8.0] - 2025-11-19  

#### توثيق متقدم: المراقبة، الأمان وأنماط التنسيق متعدد الوكلاء  
**يضيف هذا الإصدار دروساً شاملة من الدرجة الأولى حول تكامل Application Insights، وأنماط المصادقة، وتنسيق الوكلاء المتعددين لنشرات الإنتاج.**  

#### مضاف  
- **📊 درس تكامل Application Insights**: في `docs/pre-deployment/application-insights.md`:  
  - نشر مركز على AZD مع توفير تلقائي  
  - قوالب Bicep كاملة لـ Application Insights + Log Analytics  
  - تطبيقات Python عاملة مع قياس عن بعد مخصص (أكثر من 1200 سطر)  
  - أنماط مراقبة AI/LLM (تتبع تكاليف ورموز Microsoft Foundry Models)  
  - 6 مخططات Mermaid (الهندسة المعمارية، التتبع الموزع، تدفق القياس عن بعد)  
  - 3 تمارين تطبيقية (التنبيهات، لوحات المعلومات، مراقبة AI)  
  - أمثلة استعلام كستو واستراتيجيات تحسين التكلفة  
  - بث المقاييس الحي وتصحيح الأخطاء في الوقت الفعلي  
  - مدة تعلم 40-50 دقيقة مع أنماط جاهزة للإنتاج  

- **🔐 درس أنماط المصادقة والأمان**: في `docs/getting-started/authsecurity.md`:  
  - 3 أنماط مصادقة (سلاسل الاتصال، Key Vault، الهوية المدارة)  
  - قوالب بنية تحتية Bicep كاملة للنشر الآمن  
  - شفرة تطبيق Node.js مع تكامل Azure SDK  
  - 3 تمارين كاملة (تمكين الهوية المدارة، الهوية المعينة للمستخدم، تدوير Key Vault)  
  - أفضل ممارسات الأمان وتكوينات RBAC  
  - دليل استكشاف الأخطاء وتحليل التكلفة  
  - أنماط مصادقة بدون كلمة مرور جاهزة للإنتاج  

- **🤖 درس أنماط تنسيق الوكلاء المتعددين**: في `docs/pre-deployment/coordination-patterns.md`:  
  - 5 أنماط تنسيق (تتابعي، متوازٍ، هرمي، مدفوع بالأحداث، إجماع)  
  - تنفيذ خدمة منسق كامل (Python/Flask، أكثر من 1500 سطر)  
  - 3 تطبيقات متخصصة للوكلاء (بحث، كاتب، محرر)  
  - تكامل Service Bus للطابور الرسائل  
  - إدارة الحالة باستخدام Cosmos DB للأنظمة الموزعة  
  - 6 مخططات Mermaid تعرض تفاعلات الوكلاء  
  - 3 تمارين متقدمة (معالجة تجاوز الوقت، منطق إعادة المحاولة، قاطع الدائرة)  
  - تحليل التكلفة (240-565 دولار شهرياً) مع استراتيجيات تحسين  
  - تكامل Application Insights للمراقبة  

#### تم التعزيز  
- **فصل ما قبل النشر**: الآن يتضمن أنماط مراقبة وتنسيق شاملة  
- **فصل البدء**: معزز بأنماط مصادقة احترافية  
- **الجاهزية للإنتاج**: تغطية كاملة من الأمان إلى الرصد  
- **مخطط الدورة**: تحديث للإشارة إلى الدروس الجديدة في الفصلين 3 و6  

#### تم التغيير  
- **تطور التعلم**: دمج أفضل للأمان والمراقبة عبر الدورة  
- **جودة التوثيق**: معايير متسقة من الدرجة الأولى (95-97%) عبر الدروس الجديدة  
- **أنماط الإنتاج**: تغطية شاملة من البداية للنهاية لنشرات المؤسسات  

#### تم التحسين  
- **تجربة المطور**: مسار واضح من التطوير إلى مراقبة الإنتاج  
- **معايير الأمان**: أنماط احترافية للمصادقة وإدارة الأسرار  
- **الرصد**: تكامل كامل لـ Application Insights مع AZD  
- **أحمال عمل الذكاء الاصطناعي**: مراقبة متخصصة لنماذج Microsoft Foundry وأنظمة الوكلاء المتعددين  

#### تم التحقق  
- ✅ جميع الدروس تتضمن شفرات عاملة كاملة (ليست مقتطفات)  
- ✅ مخططات Mermaid للتعلم البصري (19 مخطط إجمالاً عبر 3 دروس)  
- ✅ تمارين تطبيقية مع خطوات تحقق (9 إجمالاً)  
- ✅ قوالب Bicep جاهزة للإنتاج قابلة لنشر عبر `azd up`  
- ✅ تحليل التكلفة واستراتيجيات التحسين  
- ✅ أدلة استكشاف الأخطاء وأفضل الممارسات  
- ✅ نقاط تحقق معرفية مع أوامر تحقق  

#### نتائج تقييم التوثيق  
- **docs/pre-deployment/application-insights.md**: - دليل مراقبة شامل  
- **docs/getting-started/authsecurity.md**: - أنماط أمان احترافية  
- **docs/pre-deployment/coordination-patterns.md**: - بنى معمارية متقدمة للوكلاء المتعددين  
- **المحتوى الجديد العام**: - معايير جودة عالية متسقة  

#### التنفيذ التقني  
- **Application Insights**: Log Analytics + قياس عن بعد مخصص + تتبع موزع  
- **المصادقة**: الهوية المدارة + Key Vault + أنماط RBAC  
- **الوكلاء المتعددين**: Service Bus + Cosmos DB + Container Apps + التنسيق  
- **المراقبة**: المقاييس الحيّة + استعلامات Kusto + تنبيهات + لوحات معلومات  
- **إدارة التكلفة**: استراتيجيات العينة، سياسات الاحتفاظ، ضوابط الميزانية  

### [v3.7.0] - 2025-11-19  

#### تحسين جودة التوثيق ومثال جديد لنماذج Microsoft Foundry  
**يعزز هذا الإصدار جودة التوثيق في المستودع ويضيف مثال نشر كامل لنماذج Microsoft Foundry مع واجهة دردشة gpt-4.1.**  

#### مضاف  
- **🤖 مثال دردشة لنماذج Microsoft Foundry**: نشر كامل لـ gpt-4.1 مع تنفيذ عملي في `examples/azure-openai-chat/`:  
  - بنية تحتية كاملة لنماذج Microsoft Foundry (نشر نموذج gpt-4.1)  
  - واجهة دردشة من سطر الأوامر في Python مع سجل المحادثة  
  - تكامل مع Key Vault لتخزين آمن لمفاتيح API  
  - تتبع استخدام الرموز وتقدير التكلفة  
  - تحديد معدّل الاستخدام ومعالجة الأخطاء  
  - README شامل يتضمن دليل نشر مدته 35-45 دقيقة  
  - 11 ملفًا جاهزًا للإنتاج (قوالب Bicep، تطبيق Python، التهيئة)  
- **📚 تمارين التوثيق**: أُضيفت تمارين تطبيقية إلى دليل التهيئة:  
  - تمرين 1: تهيئة متعددة البيئات (15 دقيقة)  
  - تمرين 2: ممارسة إدارة الأسرار (10 دقائق)  
  - معايير نجاح واضحة وخطوات تحقق  
- **✅ التحقق من النشر**: أُضيف قسم تحقق إلى دليل النشر:  
  - إجراءات فحص الصحة  
  - قائمة معايير النجاح  
  - المخرجات المتوقعة لجميع أوامر النشر  
  - مرجع سريع لاستكشاف الأخطاء  

#### معزز  
- **examples/README.md**: تم تحديث الجودة إلى الدرجة الأولى (93%):  
  - أُضيف azure-openai-chat إلى جميع الأقسام ذات الصلة  
  - تم تحديث عدد الأمثلة المحلية من 3 إلى 4  
  - أُضيف إلى جدول أمثلة تطبيقات AI  
  - دمج في بداية سريعة للمستخدمين المتوسطين  
  - أُضيف إلى قسم قوالب Microsoft Foundry  
  - تم تحديث مصفوفة المقارنة وأقسام إيجاد التكنولوجيا  
- **جودة التوثيق**: تحسّن من B+ (87%) إلى A- (92%) عبر مجلد الوثائق:  
  - أُضيفت المخرجات المتوقعة لأمثلة الأوامر الحيوية  
  - تضمنت خطوات تحقق لتغييرات التهيئة  
  - عزز التعلم العملي بالتمارين التطبيقية  

#### تم التغيير  
- **تطور التعلم**: دمج أفضل لأمثلة AI للمتعلمين المتوسطين  
- **هيكل التوثيق**: تمارين أكثر تطبيقية مع نتائج واضحة  
- **عملية التحقق**: أُضيفت معايير نجاح صريحة لسير العمل الرئيسية  

#### تم التحسين  
- **تجربة المطور**: تستغرق عملية نشر نماذج Microsoft Foundry الآن 35-45 دقيقة (مقابل 60-90 للبدائل المعقدة)  
- **شفافية التكلفة**: تقديرات واضحة للتكلفة (50-200 دولار شهرياً) لمثال نماذج Microsoft Foundry  
- **مسار التعلم**: يوجد نقطة دخول واضحة لمطوري AI عبر azure-openai-chat  
- **معايير التوثيق**: مخرجات متوقعة وخطوات تحقق متسقة  

#### تم التحقق  
- ✅ مثال نماذج Microsoft Foundry عملي بالكامل مع `azd up`  
- ✅ جميع الملفات ال11 الخاصة بالتنفيذ صحيحة تركيبياً  
- ✅ تعليمات README تطابق تجربة النشر الفعلية  
- ✅ تحديث روابط الوثائق في أكثر من 8 مواقع  
- ✅ فهرس الأمثلة يعكس بدقة 4 أمثلة محلية  
- ✅ لا روابط خارجية مكررة في الجداول  
- ✅ جميع مراجع التنقل صحيحة  

#### التنفيذ التقني  
- **بنية نماذج Microsoft Foundry**: gpt-4.1 + Key Vault + نمط Container Apps  
- **الأمان**: الهوية المدارة جاهزة، الأسرار في Key Vault  
- **المراقبة**: تكامل Application Insights  
- **إدارة التكلفة**: تتبع الرموز وتحسين الاستخدام  
- **النشر**: أمر `azd up` واحد للإعداد الكامل  

### [v3.6.0] - 2025-11-19  

#### تحديث رئيسي: أمثلة نشر تطبيقات الحاويات  
**يقدم هذا الإصدار أمثلة شاملة وجاهزة للإنتاج لنشر تطبيقات الحاويات باستخدام Azure Developer CLI (AZD)، مع توثيق كامل ودمج في مسار التعلم.**  

#### مضاف  
- **🚀 أمثلة تطبيقات الحاويات**: أمثلة محلية جديدة في `examples/container-app/`:  
  - [الدليل الرئيسي](examples/container-app/README.md): نظرة شاملة على النشر الحاوي، بدء سريع، الإنتاج، ونماذج متقدمة  
  - [واجهة Flask API بسيطة](../../examples/container-app/simple-flask-api): واجهة REST API مناسبة للمبتدئين مع خاصية التصغير إلى الصفر، التحقق من الحالة، المراقبة، واستكشاف الأخطاء  
  - [هندسة الخدمات المصغرة](../../examples/container-app/microservices): نشر متعدد الخدمات جاهز للإنتاج (بوابة API، المنتج، الطلب، المستخدم، الإشعارات)، الرسائل غير المتزامنة، حافلة الخدمة، Cosmos DB، Azure SQL، التتبع الموزع، النشر الأزرق-الأخضر / كناري  
- **أفضل الممارسات**: الأمان، المراقبة، تحسين التكاليف، وإرشادات CI/CD لأعباء العمل الحاوية  
- **نماذج الشيفرة**: شيفرة `azure.yaml` كاملة، قوالب Bicep، وتنفيذات الخدمات متعددة اللغات (Python، Node.js، C#، Go)  
- **الاختبار واستكشاف الأخطاء**: سيناريوهات اختبار شاملة، أوامر المراقبة، وإرشادات استكشاف الأخطاء  

#### تم التغيير  
- **README.md**: تم التحديث ليشمل ويشير إلى أمثلة تطبيقات الحاويات الجديدة تحت "الأمثلة المحلية - تطبيقات الحاويات"  
- **examples/README.md**: تم التحديث لتسليط الضوء على أمثلة تطبيقات الحاويات، إضافة مدخلات مصفوفة المقارنة، وتحديث مراجع التكنولوجيا/الهندسة  
- **مخطط الدورة ودليل الدراسة**: تم التحديث للإشارة إلى أمثلة تطبيقات الحاويات الجديدة ونماذج النشر في الفصول ذات الصلة  

#### تم التحقق  
- ✅ جميع الأمثلة الجديدة قابلة للنشر باستخدام `azd up` وتتبع أفضل الممارسات  
- ✅ تم تحديث روابط التنقل والتوثيق  
- ✅ تغطي الأمثلة سيناريوهات من المبتدئين إلى المتقدمين، بما في ذلك الخدمات المصغرة للإنتاج  

#### ملاحظات  
- **النطاق**: التوثيق والأمثلة باللغة الإنجليزية فقط  
- **الخطوات التالية**: التوسع مع أنماط حاويات متقدمة إضافية وأتمتة CI/CD في الإصدارات المستقبلية  

### [v3.5.0] - 2025-11-19  

#### إعادة تسمية المنتج: Microsoft Foundry  
**ينفذ هذا الإصدار تغييراً شاملاً في اسم المنتج من "Microsoft Foundry" إلى "Microsoft Foundry" عبر كافة التوثيقات الإنجليزية، معكساً إعادة تسمية رسمية من مايكروسوفت.**  

#### تم التغيير  
- **🔄 تحديث اسم المنتج**: إعادة تسمية كاملة من "Microsoft Foundry" إلى "Microsoft Foundry"  
  - تم تحديث جميع الإشارات في مجلد `docs/` عبر التوثيق الإنجليزي  
  - إعادة تسمية المجلد: `docs/ai-foundry/` → `docs/microsoft-foundry/`  
  - إعادة تسمية الملف: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`  
  - المجموع: 23 مرجع محتوى تم تحديثهم عبر 7 ملفات توثيق  

- **📁 تغييرات هيكل المجلدات**:  
  - تم إعادة تسمية `docs/ai-foundry/` إلى `docs/microsoft-foundry/`  
  - تم تحديث جميع الروابط المتقاطعة لتعكس الهيكل الجديد للمجلدات  
  - تم التحقق من روابط التنقل عبر كافة التوثيق  

- **📄 إعادة تسمية الملفات**:  
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`  
  - تم تحديث جميع الروابط الداخلية للإشارة إلى الاسم الجديد للملف  

#### الملفات المحدّثة  
- **توثيق الفصول** (7 ملفات):  
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 تحديثات لروابط التنقل  
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 تحديثات لمرجع اسم المنتج  
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - مستخدم Microsoft Foundry (من تحديثات سابقة)  
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 تحديثات للمرجع (نظرة عامة، ملاحظات المجتمع، التوثيق)  
  - `docs/getting-started/azd-basics.md` - 4 تحديثات لروابط الإشارة المتقاطعة  
  - `docs/getting-started/first-project.md` - 2 تحديثات لروابط التنقل بين الفصول  
  - `docs/getting-started/installation.md` - 2 تحديثات لروابط الفصل التالي  
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 تحديثات لمرجع (التنقل، مجتمع Discord)  
  - `docs/troubleshooting/common-issues.md` - 1 تحديث لرابط التنقل  
  - `docs/troubleshooting/debugging.md` - 1 تحديث لرابط التنقل  

- **ملفات هيكل الدورة** (2 ملفات):  
  - `README.md` - 17 تحديثات (نظرة عامة على الدورة، عناوين الفصول، قسم القوالب، رؤى المجتمع)  
  - `course-outline.md` - 14 تحديثات (نظرة عامة، أهداف التعلم، موارد الفصل)  

#### تم التحقق  
- ✅ لا توجد مراجع متبقية لمجلد "ai-foundry" في التوثيق الإنجليزي  
- ✅ لا توجد مراجع متبقية لاسم المنتج "Microsoft Foundry" في التوثيق الإنجليزي  
- ✅ جميع روابط التنقل تعمل مع الهيكل الجديد للمجلدات  
- ✅ إعادة تسمية الملفات والمجلدات نجحت  
- ✅ تم التحقق من الروابط المتقاطعة بين الفصول  

#### ملاحظات  
- **النطاق**: التغييرات طُبّقت على التوثيق الإنجليزي في مجلد `docs/` فقط  
- **الترجمات**: مجلدات الترجمة (`translations/`) لم يتم تحديثها في هذا الإصدار  
- **ورش العمل**: مواد ورش العمل (`workshop/`) لم يتم تحديثها في هذا الإصدار  
- **الأمثلة**: قد لا تزال الملفات المرجعية تستخدم التسمية القديمة (سيتم معالجتها في تحديث مستقبلي)  
- **الروابط الخارجية**: عناوين URL الخارجية ومراجع مستودع GitHub تظل دون تغيير  

#### دليل الهجرة للمساهمين  
إذا كان لديك فروع محلية أو توثيق يشير إلى الهيكل القديم:  
1. حدّث مراجع المجلد: `docs/ai-foundry/` → `docs/microsoft-foundry/`  
2. حدّث مراجع الملفات: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`  
3. استبدل اسم المنتج: "Microsoft Foundry" → "Microsoft Foundry"  
4. تحقق أن جميع روابط التوثيق الداخلية لا تزال تعمل  

---

### [v3.4.0] - 2025-10-24  

#### تحسينات معاينة البنية التحتية والتحقق  
**يقدم هذا الإصدار دعمًا شاملاً لميزة المعاينة الجديدة في Azure Developer CLI ويعزز تجربة مستخدمي ورش العمل.**  

#### أضيف  
- **🧪 توثيق خاصية azd provision --preview**: تغطية شاملة لقدرة معاينة البنية التحتية الجديدة  
  - مرجع الأوامر وأمثلة الاستخدام في ورقة الغش  
  - تكامل مفصل في دليل التجهيز مع حالات الاستخدام والفوائد  
  - تكامل الفحص القبلي لتوفير نشر أكثر أمانًا  
  - تحديثات دليل البدء مع ممارسات النشر الآمن أولاً  
- **🚧 لافتة حالة ورشة العمل**: لافتة HTML مهنية تبين حالة تطوير ورشة العمل  
  - تصميم تدرجي مع مؤشرات بناء للتواصل الواضح مع المستخدم  
  - طابع زمني لآخر تحديث للشفافية  
  - تصميم متجاوب مع جميع أنواع الأجهزة المحمولة  

#### محسّن  
- **سلامة البنية التحتية**: تكامل خاصية المعاينة في جميع وثائق النشر  
- **التحقق قبل النشر**: تضمين اختبارات المعاينة في النصوص الآلية  
- **سير عمل المطور**: تحديث تسلسل الأوامر ليشمل المعاينة كأفضل ممارسة  
- **تجربة ورشة العمل**: تحديد توقعات واضحة للمستخدمين عن حالة تطوير المحتوى  

#### تم التغيير  
- **أفضل ممارسات النشر**: أصبح نهج المعاينة أولاً هو الموصى به  
- **تدفق التوثيق**: تم تحريك التحقق من البنية التحتية إلى مرحلة أبكر في التعلم  
- **عرض ورشة العمل**: تواصل حالة مهنية مع جدول زمني واضح للتطوير  

#### تحسن  
- **نهج السلامة أولاً**: إمكانية التحقق من تغييرات البنية التحتية قبل النشر  
- **التعاون الجماعي**: إمكانية مشاركة نتائج المعاينة للمراجعة والموافقة  
- **الوعي بالتكلفة**: فهم أفضل لتكاليف الموارد قبل التجهيز  
- **تخفيف المخاطر**: تقليل فشل النشر من خلال التحقق المسبق  

#### التنفيذ التقني  
- **تكامل متعدد الوثائق**: خاصية المعاينة موثقة عبر 4 ملفات رئيسية  
- **أنماط الأوامر**: تناسق في الصياغة والأمثلة في جميع التوثيق  
- **دمج أفضل الممارسات**: تضمين المعاينة في سير عمل التحقق والنصوص  
- **مؤشرات بصرية**: علامات واضحة على الميزات الجديدة لسهولة الاكتشاف  

#### بنية ورشة العمل  
- **تواصل الحالة**: لافتة HTML مهنية مع تنسيق تدرجي  
- **تجربة المستخدم**: وضوح الحالة التطويرية لمنع الالتباس  
- **عرض احترافي**: يحافظ على مصداقية المستودع مع تحديد التوقعات  
- **شفافية الجدول الزمني**: طابع تاريخ آخر تحديث أكتوبر 2025 للمسائلة  

### [v3.3.0] - 2025-09-24  

#### تحسين مواد ورشة العمل وتجربة التعلم التفاعلي  
**يقدم هذا الإصدار مواد ورش عمل شاملة مع أدلة تفاعلية قائمة على المتصفح ومسارات تعلم منظمة.**  

#### أضيف  
- **🎥 دليل ورشة عمل تفاعلي**: تجربة ورشة عمل قائمة على المتصفح مع خاصية المعاينة في MkDocs  
- **📝 تعليمات ورشة العمل المنظمة**: مسار تعليمي موجه من 7 خطوات من الاكتشاف إلى التخصيص  
  - 0-مقدمة: نظرة عامة على الورشة والإعداد  
  - 1-اختيار قالب AI: عملية الاكتشاف والاختيار  
  - 2-التحقق من قالب AI: إجراءات النشر والتحقق  
  - 3-تفكيك قالب AI: فهم هيكل القالب  
  - 4-تهيئة قالب AI: الإعداد والتخصيص  
  - 5-تخصيص قالب AI: التعديلات المتقدمة والتكرار  
  - 6-تدمير البنية التحتية: التنظيف وإدارة الموارد  
  - 7-الختام: ملخص والخطوات التالية  
- **🛠️ أدوات ورش العمل**: تكوين MkDocs مع موضوع Material لتجربة تعلم محسّنة  
- **🎯 مسار تعلم عملي**: منهجية 3 خطوات (الاكتشاف → النشر → التخصيص)  
- **📱 دمج GitHub Codespaces**: إعداد بيئة تطوير سلسة  

#### محسّن  
- **مختبر ورشة عمل AI**: موسع مع تجربة تعلم منظمة شاملة لمدة 2-3 ساعات  
- **توثيق ورشة العمل**: عرض مهني مع التنقل والوسائل البصرية  
- **تقدم التعلم**: إرشاد واضح خطوة بخطوة من اختيار القالب إلى نشر الإنتاج  
- **تجربة المطور**: أدوات مدمجة لسير عمل تطوير مبسط  

#### تحسن  
- **إمكانية الوصول**: واجهة قائمة على المتصفح مع بحث، إمكانية النسخ، وتبديل الموضوع  
- **تعلم ذاتي الإيقاع**: هيكل ورشة عمل مرن يناسب سرعات تعلم مختلفة  
- **التطبيق العملي**: سيناريوهات نشر قوالب AI في العالم الحقيقي  
- **التكامل المجتمعي**: دمج Discord لدعم ورش العمل والتعاون  

#### ميزات ورشة العمل  
- **بحث مدمج**: اكتشاف سريع بالكلمات المفتاحية والدروس  
- **نسخ أكواد المحتوى**: إمكانية النسخ بالمرور على كتل الأكواد  
- **تبديل الموضوع**: دعم وضعي الإضاءة والظلام للتفضيلات المختلفة  
- **الموارد البصرية**: لقطات شاشة ومخططات لتعزيز الفهم  
- **تكامل المساعدة**: وصول مباشر إلى Discord لدعم المجتمع  

### [v3.2.0] - 2025-09-17  

#### إعادة هيكلة التنقل الكبرى ونظام التعلم المعتمد على الفصول  
**يقدم هذا الإصدار هيكل تعلم شامل معتمد على الفصول مع تحسين التنقل في كامل المستودع.**  

#### أضيف  
- **📚 نظام التعلم المعتمد على الفصول**: إعادة هيكلة الدورة الكاملة إلى 8 فصول تعليمية تقدمية  
  - الفصل 1: الأساسيات والبدء السريع (⭐ - 30-45 دقيقة)  
  - الفصل 2: تطوير AI-أولاً (⭐⭐ - 1-2 ساعة)  
  - الفصل 3: التهيئة والمصادقة (⭐⭐ - 45-60 دقيقة)  
  - الفصل 4: البنية التحتية ككود والنشر (⭐⭐⭐ - 1-1.5 ساعة)  
  - الفصل 5: حلول AI متعددة الوكلاء (⭐⭐⭐⭐ - 2-3 ساعات)  
  - الفصل 6: التحقق والتخطيط قبل النشر (⭐⭐ - 1 ساعة)  
  - الفصل 7: استكشاف الأخطاء وتصحيحها (⭐⭐ - 1-1.5 ساعة)  
  - الفصل 8: أنماط الإنتاج والمؤسسات (⭐⭐⭐⭐ - 2-3 ساعات)  
- **📚 نظام تنقل شامل**: رؤوس وتذييلات تنقل متناسقة عبر جميع التوثيق  
- **🎯 تتبع التقدم**: قائمة مراجعة إتمام الدورة ونظام تحقق التعلم  
- **🗺️ توجيه مسار التعلم**: نقاط دخول واضحة لمستويات وخبرات مختلفة  
- **🔗 تنقل الإشارات المتقاطعة**: ربط واضح بالفصول ذات الصلة والمتطلبات السابقة  

#### محسّن  
- **هيكل README**: تحول إلى منصة تعلم منظمة مع تنظيم معتمد على الفصول  
- **تنقل التوثيق**: تتضمن كل صفحة الآن سياق الفصل وإرشادات التقدم  
- **تنظيم القوالب**: ربط الأمثلة والقوالب بالفصول التعليمية المناسبة  
- **تكامل الموارد**: أوراق الغش، الأسئلة الشائعة، وأدلة الدراسة مرتبطة بالفصول المعنية  
- **تكامل ورش العمل**: معاملات عملية موجهة لأهداف التعلم بعدة فصول  

#### تم التغيير  
- **تقدم التعلم**: الانتقال من توثيق خطي إلى تعلم مرن معتمد على الفصول  
- **وضع التهيئة**: إعادة وضع دليل التهيئة كالفصل 3 لسير تعلم أفضل  
- **دمج محتوى AI**: دمج أفضل لمحتوى AI الخاص خلال رحلة التعلم  
- **محتوى الإنتاج**: دمج أنماط متقدمة في الفصل 8 للمتعلمين المؤسسيين  

#### تحسن  
- **تجربة المستخدم**: علامات تنقل واضحة والتقدم عبر الفصول  
- **إمكانية الوصول**: أنماط تنقل متسقة لتسهيل التجول في الدورة  
- **عرض احترافي**: هيكل دورة بأسلوب جامعي مناسب للتدريب الأكاديمي والمهني  
- **كفاءة التعلم**: تقليل الوقت اللازم للعثور على المحتوى الملائم بفضل التنظيم المحسن  

#### التنفيذ التقني  
- **رؤوس التنقل**: توحيد تنقل الفصول في أكثر من 40 ملفاً توثيقياً  
- **تذييل التنقل**: إرشادات متسقة للتقدم ومؤشرات إتمام الفصول  
- **الربط المتقاطع**: نظام ربط داخلي شامل يربط المفاهيم ذات الصلة  
- **رسم الفصول**: ربط القوالب والأمثلة بوضوح بأهداف التعلم  

#### تحسين دليل الدراسة  
- **📚 أهداف تعلم شاملة**: إعادة هيكلة دليل الدراسة ليتوافق مع النظام المكون من 8 فصول  
- **🎯 تقييم قائم على الفصول**: كل فصل يحتوي على أهداف تعلم محددة وتمارين عملية  
- **📋 تتبع التقدم**: جدول أسبوعي للتعلم مع نتائج قابلة للقياس وقوائم مراجعة للإتمام  
- **❓ أسئلة التقييم**: أسئلة تحقق المعرفة لكل فصل مع نتائج مهنية  
- **🛠️ تمارين عملية**: نشاطات تطبيقية مع سيناريوهات نشر حقيقية واستكشاف الأخطاء  
- **📊 تقدم المهارات**: تقدم واضح من المفاهيم الأساسية إلى أنماط المؤسسات مع تركيز على التطوير المهني  
- **🎓 إطار الشهادات**: نتائج التطوير المهني ونظام الاعتراف المجتمعي  
- **⏱️ إدارة الجدول الزمني**: خطة تعلم منظمة لمدة 10 أسابيع مع تحقق من الإنجاز  

### [v3.1.0] - 2025-09-17  

#### تحسين حلول AI متعددة الوكلاء  
**يحسن هذا الإصدار حل التجزئة متعدد الوكلاء مع تسمية أفضل للوكلاء وتوثيق مُعزّز.**  

#### تم التغيير  
- **مصطلحات الوكلاء المتعددين**: تم استبدال "وكيل كورا" بـ "وكيل العميل" في جميع أنحاء حل الوكلاء المتعددين للبيع بالتجزئة لفهم أوضح
- **هندسة الوكيل**: تم تحديث جميع الوثائق وقوالب ARM وأمثلة التعليم البرمجي لاستخدام تسمية "وكيل العميل" بشكل متسق
- **أمثلة التكوين**: تحديث أنماط تكوين الوكيل مع معايير التسمية الجديدة
- **اتساق الوثائق**: ضمان جميع الإشارات تستخدم أسماء وكلاء مهنية ووصفية

#### محسن
- **حزمة قالب ARM**: تحديث retail-multiagent-arm-template مع إشارات إلى وكيل العميل
- **مخططات الهندسة**: تحديث مخططات Mermaid مع تسمية الوكيل الجديدة
- **أمثلة البرمجة**: تستخدم فئات Python وأمثلة التنفيذ الآن تسمية CustomerAgent
- **متغيرات البيئة**: تحديث جميع نصوص النشر لاستخدام اصطلاحات CUSTOMER_AGENT_NAME

#### محسن
- **تجربة المطور**: أدوار ومسؤوليات الوكلاء أوضح في الوثائق
- **جاهزية الإنتاج**: توافق أفضل مع اصطلاحات تسمية المؤسسات
- **مواد التعلم**: تسمية وكلاء أكثر بديهية لأغراض التعليم
- **سهولة استخدام القوالب**: تبسيط فهم وظائف الوكيل وأنماط النشر

#### تفاصيل تقنية
- تحديث مخططات الهندسة Mermaid مع إشارات CustomerAgent
- استبدال أسماء فئة CoraAgent بـ CustomerAgent في أمثلة Python
- تعديل تكوينات JSON لقالب ARM لاستخدام نوع الوكيل "customer"
- تحديث متغيرات البيئة من CORA_AGENT_* إلى CUSTOMER_AGENT_*
- تحديث جميع أوامر النشر وتكوينات الحاويات

### [v3.0.0] - 2025-09-12

#### تغييرات كبيرة - تركيز على مطوري الذكاء الاصطناعي وتكامل Microsoft Foundry
**تحول هذا الإصدار إلى مورد تعليمي شامل يركز على الذكاء الاصطناعي مع تكامل Microsoft Foundry.**

#### أُضيف
- **🤖 مسار تعليمي يركز على الذكاء الاصطناعي أولاً**: إعادة هيكلة كاملة تُعطي الأولوية لمطوري ومهندسي الذكاء الاصطناعي
- **دليل تكامل Microsoft Foundry**: توثيق شامل لربط AZD بخدمات Microsoft Foundry
- **أنماط نشر نماذج الذكاء الاصطناعي**: دليل مفصل يغطّي اختيار النموذج والتكوين واستراتيجيات النشر في الإنتاج
- **مختبر ورشة عمل الذكاء الاصطناعي**: ورشة عمل عملية لمدة 2-3 ساعات لتحويل تطبيقات الذكاء الاصطناعي إلى حلول قابلة للنشر بواسطة AZD
- **أفضل ممارسات الذكاء الاصطناعي للإنتاج**: أنماط جاهزة للمؤسسات للنشر الواسع والمراقبة وتأمين أحمال عمل الذكاء الاصطناعي
- **دليل استكشاف الأخطاء الخاص بالذكاء الاصطناعي**: استكشاف أخطاء شامل لنماذج Microsoft Foundry وخدمات الذكاء الإدراكي وقضايا النشر
- **معرض قوالب الذكاء الاصطناعي**: مجموعة مميزة من قوالب Microsoft Foundry مع تقييمات التعقيد
- **مواد الورشة**: هيكل كامل للورشة مع مختبرات عملية ومواد مرجعية

#### محسن
- **هيكل ملف README**: موجه لمطوري الذكاء الاصطناعي مع بيانات اهتمام 45% من المجتمع من Discord الخاص بـ Microsoft Foundry
- **مسارات التعلم**: رحلة مخصصة لمطوري الذكاء الاصطناعي إلى جانب المسارات التقليدية للطلاب ومهندسي DevOps
- **توصيات القوالب**: قوالب ذكاء اصطناعي مميزة تشمل azure-search-openai-demo، contoso-chat، و openai-chat-app-quickstart
- **تكامل المجتمع**: دعم مجتمع Discord مع قنوات ومناقشات مخصصة للذكاء الاصطناعي

#### التركيز على الأمان والإنتاج
- **أنماط الهوية المُدارة**: تكوينات الأمن والمصادقة الخاصة بالذكاء الاصطناعي
- **تحسين التكلفة**: تتبع استخدام الرموز والتحكم في الميزانية لأحمال عمل الذكاء الاصطناعي
- **النشر عبر مناطق متعددة**: استراتيجيات لنشر تطبيقات الذكاء الاصطناعي على مستوى العالم
- **مراقبة الأداء**: مقاييس خاصة بالذكاء الاصطناعي وتكامل Application Insights

#### جودة الوثائق
- **هيكل الدورة الخطية**: تقدم منطقي من المبتدئين إلى أنماط نشر الذكاء الاصطناعي المتقدمة
- **روابط تم التحقق منها**: جميع روابط المستودعات الخارجية مثبتة وقابلة للوصول
- **مرجع كامل**: جميع روابط الوثائق الداخلية تم التحقق منها وتعمل
- **جاهز للإنتاج**: أنماط نشر مؤسساتية بأمثلة حقيقية

### [v2.0.0] - 2025-09-09

#### تغييرات كبيرة - إعادة هيكلة المستودع وتعزيز مهني
**يمثل هذا الإصدار تحديثًا كبيرًا في هيكل المستودع وطريقة عرض المحتوى.**

#### أُضيف
- **إطار تعلم منظم**: جميع صفحات الوثائق تتضمن الآن مقدمة، وأهداف تعلم، ونتائج تعلم
- **نظام التنقل**: إضافة روابط الدرس السابق/التالي في جميع الوثائق لتسهيل التقدم التعليمي
- **دليل الدراسة**: study-guide.md شامل يحتوي على أهداف التعلم، تمارين تطبيقية، ومواد تقييمية
- **عرض مهني**: إزالة جميع الرموز التعبيرية لتحسين الوصول والمظهر المهني
- **هيكل محتوى محسن**: تحسين تنظيم وتدفق مواد التعلم

#### تم التغيير
- **صيغة الوثائق**: توحيد جميع الوثائق بهيكل تعليمي موحد
- **تدفق التنقل**: تنفيذ تقدم منطقي عبر جميع مواد التعلم
- **عرض المحتوى**: إزالة العناصر الزخرفية لصياغة واضحة ومهنية
- **هيكل الروابط**: تحديث جميع الروابط الداخلية لدعم نظام التنقل الجديد

#### تحسين
- **الوصولية**: إزالة الاعتماد على الرموز التعبيرية لتحسين توافق قارئات الشاشة
- **المظهر المهني**: عرض نظيف وأكاديمي مناسب للتعلم المؤسسي
- **تجربة التعلم**: نهج منظم مع أهداف واضحة ونتائج لكل درس
- **تنظيم المحتوى**: تدفق منطقي أفضل وربط المواضيع ذات الصلة

### [v1.0.0] - 2025-09-09

#### الإصدار الأول - مستودع تعلم شامل لـ AZD

#### أُضيف
- **هيكل الوثائق الأساسي**
  - سلسلة كاملة من دليل البدء السريع
  - وثائق شاملة للنشر والتوفير
  - موارد استكشاف الأخطاء وإرشادات التصحيح التفصيلية
  - أدوات وإجراءات التحقق قبل النشر

- **وحدة البدء**
  - أساسيات AZD: المفاهيم والمصطلحات الأساسية
  - دليل التثبيت: تعليمات الإعداد حسب النظام الأساسي
  - دليل التكوين: إعداد البيئة والمصادقة
  - الدرس الأول: تعلم عملي خطوة بخطوة

- **وحدة النشر والتوفير**
  - دليل النشر: وثائق سير العمل كاملة
  - دليل التوفير: البنية التحتية ككود باستخدام Bicep
  - أفضل الممارسات لنشر الإنتاج
  - أنماط هندسة متعددة الخدمات

- **وحدة التحقق قبل النشر**
  - تخطيط السعة: التحقق من توفر موارد Azure
  - اختيار SKU: إرشادات شاملة لمستوى الخدمة
  - فحوصات ما قبل الإقلاع: نصوص تحقق آلية (PowerShell وBash)
  - أدوات تقدير التكلفة وخطط الميزانية

- **وحدة استكشاف الأخطاء**
  - المشاكل الشائعة: مشاكل متكررة وحلولها
  - دليل التصحيح: منهجيات استكشاف الأخطاء المنهجية
  - تقنيات وأدوات تشخيص متقدمة
  - مراقبة وتحسين الأداء

- **الموارد والمراجع**
  - ورقة غش للأوامر: مرجع سريع للأوامر الأساسية
  - مسرد: تعاريف شاملة للمصطلحات والاختصارات
  - الأسئلة الشائعة: إجابات مفصلة على الأسئلة المتكررة
  - روابط موارد خارجية واتصالات مجتمعية

- **أمثلة وقوالب**
  - مثال تطبيق ويب بسيط
  - قالب نشر موقع ثابت
  - تكوين تطبيق حاوية
  - أنماط دمج قواعد البيانات
  - أمثلة هندسة الخدمات المصغرة
  - تنفيذات الدوال بدون خادم

#### الميزات
- **دعم متعدد المنصات**: دلائل التثبيت والتكوين لأنظمة Windows، macOS، وLinux
- **مستويات مهارية متعددة**: محتوى مصمم من الطلاب حتى المطورين المحترفين
- **تركيز عملي**: أمثلة عملية وسيناريوهات من العالم الحقيقي
- **تغطية شاملة**: من المفاهيم الأساسية إلى أنماط المؤسسات المتقدمة
- **نهج الأمان أولاً**: أفضل ممارسات الأمان مدمجة طوال المحتوى
- **تحسين التكلفة**: إرشادات للنشر الفعّال من حيث التكلفة وإدارة الموارد

#### جودة الوثائق
- **أمثلة كود مفصلة**: عينات كود عملية ومجربة
- **تعليمات خطوة بخطوة**: إرشادات واضحة وقابلة للتنفيذ
- **معالجة شاملة للأخطاء**: استكشاف الأخطاء للمشاكل الشائعة
- **دمج أفضل الممارسات**: معايير صناعية وتوصيات
- **توافق الإصدارات**: محدث مع أحدث خدمات Azure وميزات azd

## التحسينات المستقبلية المخططة

### الإصدار 3.1.0 (مخطط)
#### توسيع منصة الذكاء الاصطناعي
- **دعم نماذج متعددة**: أنماط دمج Hugging Face، Azure Machine Learning، والنماذج المخصصة
- **أُطر وكلاء الذكاء الاصطناعي**: قوالب نشر LangChain، Semantic Kernel، و AutoGen
- **أنماط RAG المتقدمة**: خيارات قواعد بيانات المتجهات خارج Azure AI Search (مثل Pinecone، Weaviate)
- **مراقبة الذكاء الاصطناعي**: مراقبة معززة لأداء النماذج، استخدام الرموز، وجودة الاستجابة

#### تجربة المطور
- **امتداد VS Code**: تجربة تطوير متكاملة لـ AZD + Microsoft Foundry
- **تكامل GitHub Copilot**: توليد قوالب AZD بمساعدة الذكاء الاصطناعي
- **دروس تفاعلية**: تمارين ترميز عملية مع تحقق آلي لسيناريوهات الذكاء الاصطناعي
- **محتوى فيديو**: دروس فيديو إضافية للمتعلمين المرئيين تركّز على نشرات الذكاء الاصطناعي

### الإصدار 4.0.0 (مخطط)
#### أنماط الذكاء الاصطناعي المؤسسية
- **إطار الحوكمة**: حوكمة نموذج الذكاء الاصطناعي، الامتثال، ومسارات التدقيق
- **الذكاء الاصطناعي متعدد المستأجرين**: أنماط لخدمة عدة عملاء بخدمات ذكاء اصطناعي معزولة
- **نشر الذكاء الاصطناعي عند الحافة**: التكامل مع Azure IoT Edge وحاويات الحافة
- **الذكاء الاصطناعي السحابي الهجين**: أنماط النشر على السحابات المتعددة والهجينة لأحمال عمل الذكاء الاصطناعي

#### الميزات المتقدمة
- **أتمتة خطوط الذكاء الاصطناعي**: دمج MLOps مع خطوط أنابيب Azure Machine Learning
- **الأمان المتقدم**: أنماط الثقة الصفرية، نقاط النهاية الخاصة، والحماية المتقدمة من التهديدات
- **تحسين الأداء**: استراتيجيات ضبط وتوسيع متقدمة لتطبيقات الذكاء الاصطناعي عالية الإنتاجية
- **التوزيع العالمي**: أنماط توصيل المحتوى والتخزين المؤقت للحافة لتطبيقات الذكاء الاصطناعي

### الإصدار 3.0.0 (مخطط) - تم استبداله بالإصدار الحالي
#### الإضافات المقترحة - تم تنفيذها الآن في الإصدار 3.0.0
- ✅ **محتوى يركز على الذكاء الاصطناعي**: تكامل شامل مع Microsoft Foundry (مكتمل)
- ✅ **دروس تفاعلية**: مختبر ورشة عمل ذكاء اصطناعي عملي (مكتمل)
- ✅ **وحدة أمان متقدمة**: أنماط أمان خاصة بالذكاء الاصطناعي (مكتمل)
- ✅ **تحسين الأداء**: استراتيجيات ضبط أحمال عمل الذكاء الاصطناعي (مكتمل)

### الإصدار 2.1.0 (مخطط) - تم تنفيذه جزئيًا في الإصدار 3.0.0
#### تحسينات طفيفة - بعض منها مكتمل في الإصدار الحالي
- ✅ **أمثلة إضافية**: سيناريوهات نشر تركز على الذكاء الاصطناعي (مكتمل)
- ✅ **الأسئلة الشائعة الممتدة**: أسئلة واستكشاف أخطاء خاصة بالذكاء الاصطناعي (مكتمل)
- **تكامل الأدوات**: دلائل دمج IDE والمحرر المحسنة
- ✅ **توسيع المراقبة**: أنماط مراقبة وتنبيه خاصة بالذكاء الاصطناعي (مكتمل)

#### ما زال مخططًا للإصدار المستقبلي
- **وثائق صديقة للجوال**: تصميم استجابي لتعلم الجوال
- **الوصول دون اتصال**: حزم وثائق قابلة للتنزيل
- **تكامل IDE معزز**: امتداد VS Code لسير عمل AZD + الذكاء الاصطناعي
- **لوحة مجتمع**: مقاييس مجتمعية في الوقت الحقيقي وتتبع المساهمات

## المساهمة في سجل التغييرات

### الإبلاغ عن التغييرات
عند المساهمة في هذا المستودع، يرجى التأكد من أن إدخالات سجل التغييرات تتضمن:

1. **رقم الإصدار**: وفقًا لإصدار المعاني الدلالي (رئيسي.فرعي.تصحيح)
2. **التاريخ**: تاريخ الإصدار أو التحديث بصيغة YYYY-MM-DD
3. **الفئة**: أضيف، تغير، مهمل، محذوف، تم إصلاحه، أمان
4. **وصف واضح**: وصف موجز لما تم تغييره
5. **تقييم التأثير**: كيف تؤثر التغييرات على المستخدمين الحاليين

### فئات التغيير

#### أضيف
- ميزات جديدة، أقسام توثيق، أو قدرات جديدة
- أمثلة جديدة، قوالب، أو موارد تعليمية
- أدوات إضافية، نصوص، أو أدوات مساعدة

#### تغير
- تعديلات على الوظائف أو التوثيق الحالي
- تحديثات لتحسين الوضوح أو الدقة
- إعادة هيكلة المحتوى أو التنظيم

#### مهمل
- ميزات أو طرق يتم التخلص منها تدريجياً
- أقسام وثائق مبرمجة للإزالة
- طرق لديها بدائل أفضل

#### محذوف
- ميزات، وثائق، أو أمثلة لم تعد ذات صلة
- معلومات قديمة أو طرق مهملة
- محتوى مكرر أو موحد

#### تم إصلاحه
- تصحيحات لأخطاء في الوثائق أو الكود
- حل المشكلات أو القضايا المُبلغ عنها
- تحسينات في الدقة أو الأداء

#### أمان
- تحسينات أو إصلاحات متعلقة بالأمان
- تحديثات لأفضل ممارسات الأمان
- حل الثغرات الأمنية

### إرشادات إصدار المعاني الدلالية

#### إصدار رئيسي (X.0.0)
- تغييرات جذرية تتطلب إجراء من المستخدم
- إعادة هيكلة كبيرة للمحتوى أو التنظيم
- تغييرات تغير النهج أو المنهجية الأساسية

#### إصدار فرعي (X.Y.0)
- ميزات جديدة أو إضافات محتوى
- تحسينات تحافظ على التوافق الخلفي
- أمثلة، أدوات، أو موارد إضافية

#### إصدار تصحيحي (X.Y.Z)
- إصلاحات أخطاء وتصحيحات
- تحسينات طفيفة في المحتوى الحالي
- توضيحات وتحسينات صغيرة

## تعليقات المجتمع والاقتراحات

نحن نشجع بنشاط تعليقات المجتمع لتحسين مورد التعلم هذا:

### كيفية تقديم التعليقات
- **قضايا GitHub**: الإبلاغ عن المشاكل أو اقتراح التحسينات (قضايا الذكاء الاصطناعي مرحب بها)
- **مناقشات Discord**: مشاركة الأفكار والتفاعل مع مجتمع Microsoft Foundry
- **طلبات السحب**: مساهمة تحسينات مباشرة على المحتوى، خاصة قوالب ودلائل الذكاء الاصطناعي
- **Microsoft Foundry Discord**: المشاركة في قناة #Azure لمناقشات AZD + الذكاء الاصطناعي
- **منتديات المجتمع**: المشاركة في مناقشات مطوري Azure أوسع نطاقاً

### فئات التعليقات
- **دقة محتوى الذكاء الاصطناعي**: تصحيحات لدمج خدمات الذكاء الاصطناعي ومعلومات النشر
- **تجربة التعلم**: اقتراحات لتحسين تسلسل تعلم مطوري الذكاء الاصطناعي
- **محتوى الذكاء الاصطناعي المفقود**: طلبات إضافية لقوالب، أنماط، أو أمثلة ذكاء اصطناعي
- **سهولة الوصول**: تحسينات لتلبية احتياجات تعلم متنوعة
- **تكامل أدوات الذكاء الاصطناعي**: اقتراحات لتحسين تدفق عمل تطوير الذكاء الاصطناعي
- **أنماط نشر الذكاء الاصطناعي الإنتاجية**: طلبات أنماط نشر ذكاء اصطناعي للمؤسسات

### التزام الاستجابة
- **الرد على القضايا**: خلال 48 ساعة للمشاكل المبلغ عنها
- **طلبات الميزات**: تقييم خلال أسبوع واحد
- **مساهمات المجتمع**: مراجعة خلال أسبوع واحد
- **قضايا الأمان**: أولوية فورية مع استجابة سريعة

## جدول الصيانة

### تحديثات منتظمة
- **مراجعات شهرية**: دقة المحتوى والتحقق من الروابط
- **تحديثات ربع سنوية**: إضافات وتحسينات محتوى كبيرة
- **مراجعات نصف سنوية**: إعادة هيكلة وتحسين شامل
- **إصدارات سنوية**: تحديثات إصدارات كبرى مع تحسينات مهمة

### المراقبة وضمان الجودة
- **الاختبار الآلي**: التحقق المنتظم من أمثلة الكود والروابط  
- **دمج ملاحظات المجتمع**: دمج اقتراحات المستخدمين بانتظام  
- **تحديثات التكنولوجيا**: التوافق مع أحدث خدمات Azure وإصدارات azd  
- **مراجعات الوصول**: مراجعة دورية لمبادئ التصميم الشامل  

## سياسة دعم الإصدارات  

### دعم الإصدار الحالي  
- **أحدث إصدار رئيسي**: دعم كامل مع تحديثات منتظمة  
- **الإصدار الرئيسي السابق**: تحديثات أمنية وتصحيحات حرجة لمدة 12 شهرًا  
- **الإصدارات القديمة**: دعم المجتمع فقط، بدون تحديثات رسمية  

### إرشادات الترحيل  
عند صدور إصدارات رئيسية، نوفر:  
- **أدلة الترحيل**: تعليمات خطوة بخطوة للانتقال  
- **ملاحظات التوافق**: تفاصيل حول التغييرات التي تؤدي إلى كسر التوافق  
- **دعم الأدوات**: سكربتات أو أدوات مساعدة للمساعدة في الترحيل  
- **دعم المجتمع**: منتديات مخصصة لأسئلة الترحيل  

---  

**التنقل**  
- **الدروس السابقة**: [دليل الدراسة](resources/study-guide.md)  
- **الدرس التالي**: العودة إلى [README الرئيسي](README.md)  

**ابقَ محدثًا**: راقب هذا المستودع للحصول على إشعارات حول الإصدارات الجديدة والتحديثات الهامة في مواد التعلم.  

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنويه**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي والمعتمد. للمعلومات الهامة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->