# AZD للمبتدئين: رحلة تعلم منظمة

![AZD-for-beginners](../../translated_images/ar/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### الترجمات الآلية (دائماً محدثة)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](./README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **هل تفضل الاستنساخ محلياً؟**
>
> يتضمن هذا المستودع ترجمات لأكثر من 50 لغة مما يزيد بشكل كبير من حجم التنزيل. للاستنساخ بدون الترجمات، استخدم الاستنساخ المتفرق:
>
> **Bash / macOS / Linux:**
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
>
> **CMD (Windows):**
> ```cmd
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone "/*" "!translations" "!translated_images"
> ```
>
> هذا يمنحك كل ما تحتاجه لإكمال الدورة بتنزيل أسرع بكثير.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 ما الجديد في azd اليوم

> 📌 تم التحقق من هذه الدورة باستخدام **`azd 1.27.1`** (يوليو 2026). شغل `azd version` للتحقق من إصدارك، و `azd upgrade` للحصول على الأحدث.

لقد تطور Azure Developer CLI ليشمل أكثر من التطبيقات الويب التقليدية وواجهات برمجة التطبيقات. اليوم، azd هو الأداة الوحيدة لنشر **أي** تطبيق على Azure — بما في ذلك التطبيقات المدعومة بالذكاء الاصطناعي والعملاء الأذكياء.

هذا ما يعنيه لك:

- **عملاء الذكاء الاصطناعي أصبحوا الآن من أولويات azd.** يمكنك تهيئة، نشر، وإدارة مشاريع عملاء الذكاء الاصطناعي باستخدام نفس سير العمل `azd init` → `azd up` الذي تعرفه.
- **دورة حياة عميل كاملة من خلال CLI.** المكون الإضافي `azure.ai.agents` يغطي الرحلة كاملة—`azd ai agent init` للبنية الأساسية، `azd ai agent invoke` للاختبار (مع إنتاج توقيت الاستجابة)، `azd ai agent eval generate` و `azd ai agent optimize` لقياس وتحسين الجودة، و `azd ai agent delete` لتنظيف.
- **مزيد من مكونات الذكاء الاصطناعي.** المكونات التمهيدية الجديدة — `azure.ai.skills` و `azure.ai.connections` — تتيح لك إدارة المهارات القابلة لإعادة الاستخدام والاتصالات Foundry مباشرة مع azd.
- **تكامل Microsoft Foundry** يقدم نشر النماذج، استضافة العملاء، وتكوين خدمات الذكاء الاصطناعي مباشرة في نظام قوالب azd.
- **أساسيات أكثر سلاسة في العمل اليومي.** الإصدارات الحديثة جعلت `azd init` قابلة لإعادة التشغيل بأمان، وقامت بجعل `azd auth login` ينظف الرموز القديمة تلقائياً، وأضافت مطالبة إعداد أول تنفيذ ودودة لأمر `azd tool`.
- **سير العمل الأساسي لم يتغير.** سواء كنت تنشر تطبيق مهام، خدمة صغيرة، أو حل ذكاء اصطناعي متعدد العملاء، الأوامر هي نفسها.

> **ملاحظة لمستخدمي Aspire:** تشير مايكروسوفت الآن إلى المنتج ببساطة باسم **Aspire** (سابقًا ".NET Aspire"). دعم azd لـ Aspire لم يتغير—التغيير فقط في الاسم.

إذا كنت قد استخدمت azd سابقًا، فإن دعم الذكاء الاصطناعي هو امتداد طبيعي ليس أداة منفصلة أو مسار متقدم. وإذا بدأت من الصفر، ستتعلم سير عمل واحد يناسب كل شيء.

---

## 🚀 ما هو Azure Developer CLI (azd)؟

**Azure Developer CLI (azd)** هي أداة سطر أوامر سهلة الاستخدام للمطورين تجعل نشر التطبيقات على Azure بسيطًا. بدلاً من إنشاء وربط العديد من موارد Azure يدويًا، يمكنك نشر تطبيقات كاملة بأمر واحد.

### سحر `azd up`

```bash
# هذا الأمر الواحد يقوم بكل شيء:
# ✅ ينشئ جميع موارد Azure
# ✅ يهيئ الشبكات والأمان
# ✅ يبني كود التطبيق الخاص بك
# ✅ ينشر على Azure
# ✅ يمنحك عنوان URL يعمل
azd up
```

**هذا كل شيء!** لا حاجة للنقر في بوابة Azure، ولا تعلم قوالب ARM المعقدة أولاً، ولا إعداد يدوي - فقط تطبيقات تعمل على Azure.

---

## ❓ Azure Developer CLI مقابل Azure CLI: ما الفرق؟

هذا هو السؤال الأكثر شيوعًا بين المبتدئين. إليك الجواب البسيط:

| الميزة | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **الغرض** | إدارة موارد Azure الفردية | نشر تطبيقات كاملة |
| **العقلية** | تركيز على البنية التحتية | تركيز على التطبيق |
| **مثال** | `az webapp create --name myapp...` | `azd up` |
| **منحنى التعلم** | يجب معرفة خدمات Azure | فقط معرفة تطبيقك |
| **الأفضل لـ** | DevOps، البنية التحتية | المطورين، النماذج الأولية |

### تشبيه بسيط

- **Azure CLI** كالامتلاك لجميع أدوات بناء المنزل - المطارق، المناشير، المسامير. يمكنك بناء أي شيء، لكن عليك معرفة البناء.
- **Azure Developer CLI** كأنك تستأجر مقاولًا - تصف ما تريد وهم يتولون البناء.

### متى تستخدم كل واحدة

| السيناريو | استخدم هذا |
|----------|----------|
| "أريد نشر تطبيقي الويب بسرعة" | `azd up` |
| "أحتاج لإنشاء فقط حساب تخزين" | `az storage account create` |
| "أنا أبني تطبيق ذكاء اصطناعي كامل" | `azd init --template azure-search-openai-demo` |
| "أحتاج إلى تصحيح مورد Azure محدد" | `az resource show` |
| "أريد نشرًا جاهزًا للإنتاج خلال دقائق" | `azd up --environment production` |

### يعملان معًا!

يستخدم AZD Azure CLI تحت الغطاء. يمكنك استخدام كلاهما:
```bash
# نشر تطبيقك باستخدام AZD
azd up

# ثم ضبط الموارد المحددة باستخدام Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 ابحث عن القوالب في Awesome AZD

لا تبدأ من الصفر! **Awesome AZD** هي مجموعة المجتمع للقوالب الجاهزة للنشر:

| المورد | الوصف |
|----------|-------------|
| 🔗 [**معرض Awesome AZD**](https://azure.github.io/awesome-azd/) | تصفح أكثر من 200 قالب بنقرة واحدة للنشر |
| 🔗 [**إرسال قالب**](https://github.com/Azure/awesome-azd/issues) | ساهم بقالبك الخاص للمجتمع |
| 🔗 [**مستودع GitHub**](https://github.com/Azure/awesome-azd) | امنح النجوم واستكشف المصدر |

### قوالب الذكاء الاصطناعي الشهيرة من Awesome AZD

```bash
# دردشة RAG مع نماذج Microsoft Foundry + البحث بالذكاء الاصطناعي
azd init --template azure-search-openai-demo

# تطبيق دردشة ذكاء اصطناعي سريع
azd init --template openai-chat-app-quickstart

# وكلاء الذكاء الاصطناعي مع وكلاء Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 بدء العمل في 3 خطوات

قبل البدء، تأكد من أن جهازك جاهز للقالب الذي تريد نشره:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

إذا فشل أي فحص مطلوب، صححه أولاً ثم تابع البداية السريعة.

### الخطوة 1: تثبيت AZD (دقيقتان)

**Windows:**
```powershell
winget install microsoft.azd
```

**macOS:**
```bash
brew tap azure/azd && brew install azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### الخطوة 2: المصادقة لـ AZD

```bash
# اختياري إذا كنت تخطط لاستخدام أوامر Azure CLI مباشرة في هذه الدورة
az login

# مطلوب لتدفقات عمل AZD
azd auth login
```

إذا لم تكن متأكدًا مما تحتاجه، اتبع سير الإعداد الكامل في [التثبيت والإعداد](docs/chapter-01-foundation/installation.md#authentication-setup).

### الخطوة 3: نشر التطبيق الأول

```bash
# التهيئة من قالب
azd init --template todo-nodejs-mongo

# النشر إلى أزور (ينشئ كل شيء!)
azd up
```

**🎉 هذا كل شيء!** تطبيقك الآن مباشر على Azure.

### التنظيف (لا تنسى!)

```bash
# إزالة جميع الموارد عند الانتهاء من التجربة
azd down --force --purge
```

---

## 📚 كيفية استخدام هذه الدورة

هذه الدورة مصممة لـ **التعلم التدريجي** - ابدأ من حيث تشعر بالراحة وتدرج:

| خبرتك | ابدأ هنا |
|-----------------|------------|
| **جديد كليًا على Azure** | [الفصل 1: الأساس](#-chapter-1-foundation--quick-start) |
| **تعرف Azure، جديد على AZD** | [الفصل 1: الأساس](#-chapter-1-foundation--quick-start) |
| **تريد نشر تطبيقات الذكاء الاصطناعي** | [الفصل 2: تطوير الذكاء الاصطناعي أولاً](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **تريد تدريبًا عمليًا** | [🎓 ورشة العمل التفاعلية](workshop/README.md) - مختبر موجه من 3-4 ساعات |
| **تحتاج أنماط الإنتاج** | [الفصل 8: الإنتاج والمؤسسات](#-chapter-8-production--enterprise-patterns) |

### إعداد سريع

1. **استنسخ هذا المستودع**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **انسخه محلياً**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **احصل على المساعدة**: [مجتمع Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **هل تفضل الاستنساخ محلياً؟**

> يتضمن هذا المستودع ترجمات لأكثر من 50 لغة مما يزيد بشكل كبير من حجم التنزيل. للاستنساخ بدون الترجمات، استخدم الاستنساخ المتفرق:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> هذا يمنحك كل ما تحتاجه لإكمال الدورة بتنزيل أسرع بكثير.


## نظرة عامة على الدورة

اتقن Azure Developer CLI (azd) من خلال فصول منظمة مصممة للتعلم التدريجي. **تركيز خاص على نشر تطبيقات الذكاء الاصطناعي مع تكامل Microsoft Foundry.**


### لماذا هذه الدورة ضرورية للمطورين العصريين

بناءً على رؤى مجتمع Microsoft Foundry في ديسكورد، **يرغب 45% من المطورين في استخدام AZD لأعباء عمل الذكاء الاصطناعي** لكنهم يواجهون تحديات في:
- هياكل ذكاء اصطناعي معقدة متعددة الخدمات
- أفضل ممارسات نشر الذكاء الاصطناعي في الإنتاج  
- تكامل وتكوين خدمات Azure AI
- تحسين التكلفة لأعباء عمل الذكاء الاصطناعي
- استكشاف مشاكل النشر الخاصة بالذكاء الاصطناعي وحلها

### أهداف التعلم

بإكمال هذه الدورة المنظمة، ستتمكن من:
- **إتقان أساسيات AZD**: المفاهيم الأساسية، التثبيت، والتكوين
- **نشر تطبيقات الذكاء الاصطناعي**: استخدام AZD مع خدمات Microsoft Foundry
- **تنفيذ البنية التحتية كرمز**: إدارة موارد Azure بواسطة قوالب Bicep
- **استكشاف أخطاء النشر وإصلاحها**: حل المشكلات الشائعة وتصحيح الأخطاء
- **التحسين للإنتاج**: الأمان، التوسع، المراقبة، وإدارة التكاليف
- **بناء حلول متعددة الوكلاء**: نشر هياكل ذكاء اصطناعي معقدة

## قبل أن تبدأ: الحسابات، الوصول، والافتراضات

قبل بدء الفصل 1، تأكد من وجود ما يلي. خطوات التثبيت لاحقاً في هذا الدليل تفترض أن هذه الأساسيات قد تم التعامل معها.

- **اشتراك Azure**: يمكنك استخدام اشتراك موجود من العمل أو حسابك الخاص، أو إنشاء [نسخة تجريبية مجانية](https://aka.ms/azurefreetrial) للبدء.
- **إذن إنشاء موارد Azure**: لمعظم التمارين، يجب أن يكون لديك على الأقل صلاحية **مساهم** على الاشتراك أو مجموعة الموارد المستهدفة. قد تفترض بعض الفصول أيضاً أنه يمكنك إنشاء مجموعات موارد، هويات مُدارة، وتعيينات RBAC.
- [**حساب GitHub**](https://github.com): هذا مفيد لتفريع المستودع، تتبع تغييراتك الخاصة، واستخدام GitHub Codespaces للعمل العملي.
- **متطلبات وقت تشغيل القوالب**: بعض القوالب تحتاج أدوات محلية مثل Node.js، Python، Java، أو Docker. شغّل مدقق الإعداد قبل البدء حتى تكتشف الأدوات الناقصة مبكراً.
- **إلمام أساسي بالترمينال**: لست بحاجة لأن تكون خبيراً، لكن يجب أن تكون مرتاحاً في تشغيل أوامر مثل `git clone`، `azd auth login`، و`azd up`.

> **تعمل في اشتراك مؤسسي؟**
> إذا كان بيئة Azure الخاصة بك تتم إدارتها بواسطة مسؤول، فتأكد مسبقاً من إمكانية نشر الموارد في الاشتراك أو مجموعة الموارد التي تنوي استخدامها. إذا لم يكن، اطلب اشتراك تجربة أو صلاحية مساهم قبل البدء.

> **جديد في Azure؟**
> ابدأ باشتراك Azure التجريبي الخاص بك أو الاشتراك بالدفع حسب الاستخدام عبر https://aka.ms/azurefreetrial حتى تتمكن من إكمال التمارين من البداية للنهاية دون انتظار الموافقات على مستوى المستأجر.

## 🗺️ خريطة الدورة: التنقل السريع حسب الفصل

يحتوي كل فصل على README مخصص بأهداف التعلم، البدء السريع، والتمارين:

| الفصل | الموضوع | الدروس | المدة | التعقيد |
|---------|-------|---------|----------|------------|
| **[الفصل 1: الأساس](docs/chapter-01-foundation/README.md)** | البدء | [أساسيات AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [التثبيت](docs/chapter-01-foundation/installation.md) &#124; [المشروع الأول](docs/chapter-01-foundation/first-project.md) | 30-45 دقيقة | ⭐ |
| **[الفصل 2: تطوير الذكاء الاصطناعي](docs/chapter-02-ai-development/README.md)** | تطبيقات الذكاء الاصطناعي | [تكامل Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [وكلاء الذكاء الاصطناعي](docs/chapter-02-ai-development/agents.md) &#124; [نشر النموذج](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [ورشة العمل](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 ساعة | ⭐⭐ |
| **[الفصل 3: التكوين](docs/chapter-03-configuration/README.md)** | المصادقة والأمان | [التكوين](docs/chapter-03-configuration/configuration.md) &#124; [المصادقة والأمان](docs/chapter-03-configuration/authsecurity.md) | 45-60 دقيقة | ⭐⭐ |
| **[الفصل 4: البنية التحتية](docs/chapter-04-infrastructure/README.md)** | IaC والنشر | [دليل النشر](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [التوفير](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 ساعة | ⭐⭐⭐ |
| **[الفصل 5: الوكلاء المتعددون](docs/chapter-05-multi-agent/README.md)** | حلول الوكيل الذكي | [سيناريو البيع بالتجزئة](examples/retail-scenario.md) &#124; [أنماط التنسيق](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 ساعات | ⭐⭐⭐⭐ |
| **[الفصل 6: قبل النشر](docs/chapter-06-pre-deployment/README.md)** | التخطيط والتحقق | [فحوصات ما قبل الرحلة](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [تخطيط السعة](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [اختيار SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [رؤى التطبيقات](docs/chapter-06-pre-deployment/application-insights.md) | 1 ساعة | ⭐⭐ |
| **[الفصل 7: استكشاف الأخطاء](docs/chapter-07-troubleshooting/README.md)** | تصحيح وحل المشكلات | [مشكلات شائعة](docs/chapter-07-troubleshooting/common-issues.md) &#124; [تصحيح الأخطاء](docs/chapter-07-troubleshooting/debugging.md) &#124; [مشكلات الذكاء الاصطناعي](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 ساعة | ⭐⭐ |
| **[الفصل 8: الإنتاج](docs/chapter-08-production/README.md)** | أنماط المؤسسات | [ممارسات الإنتاج](docs/chapter-08-production/production-ai-practices.md) | 2-3 ساعات | ⭐⭐⭐⭐ |
| **[🎓 ورشة العمل](workshop/README.md)** | مختبر عملي | [مقدمة](workshop/docs/instructions/0-Introduction.md) &#124; [اختيار](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [التحقق](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [تفكيك](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [تكوين](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [تخصيص](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [تفكيك البنية التحتية](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [الختام](workshop/docs/instructions/7-Wrap-up.md) | 3-4 ساعات | ⭐⭐ |

**إجمالي مدة الدورة:** ~10-14 ساعة | **تطور المهارات:** مبتدئ → جاهز للإنتاج

---

## 📚 فصول التعلم

*اختر مسار تعلمك بناءً على مستوى الخبرة والأهداف*

### 🚀 الفصل 1: الأساس والبدء السريع
**المتطلبات المسبقة**: اشتراك Azure، معرفة أساسية بسطر الأوامر  
**المدة**: 30-45 دقيقة  
**التعقيد**: ⭐

#### ما ستتعلمه
- فهم أساسيات Azure Developer CLI
- تثبيت AZD على منصتك
- نشر أول مشروع ناجح

#### مصادر التعلم
- **🎯 ابدأ هنا**: [ما هو Azure Developer CLI؟](#what-is-azure-developer-cli)
- **📖 نظرية**: [أساسيات AZD](docs/chapter-01-foundation/azd-basics.md) - المفاهيم الأساسية والمصطلحات
- **⚙️ إعداد**: [التثبيت والإعداد](docs/chapter-01-foundation/installation.md) - أدلة خاصة بالمنصة
- **🛠️ عملي**: [مشروعك الأول](docs/chapter-01-foundation/first-project.md) - درس خطوة بخطوة
- **📋 مرجع سريع**: [ورقة غش الأوامر](resources/cheat-sheet.md)

#### تمارين عملية
```bash
# فحص التثبيت السريع
azd version

# نشر تطبيقك الأول
azd init --template todo-nodejs-mongo
azd up
```

**💡 نتيجة الفصل**: نشر تطبيق ويب بسيط على Azure باستخدام AZD بنجاح

**✅ تحقق من النجاح:**
```bash
# بعد الانتهاء من الفصل 1، يجب أن تكون قادرًا على:
azd version              # يعرض النسخة المثبتة
azd init --template todo-nodejs-mongo  # يُهيئ المشروع
azd up                  # ينشر إلى أزور
azd show                # يعرض رابط التطبيق العامل
# يفتح التطبيق في المتصفح ويعمل
azd down --force --purge  # ينظف الموارد
```

**📊 الوقت المتوقع:** 30-45 دقيقة  
**📈 مستوى المهارة بعد:** يمكن نشر التطبيقات البسيطة بشكل مستقل
**📈 مستوى المهارة بعد:** يمكن نشر التطبيقات البسيطة بشكل مستقل

---

### 🤖 الفصل 2: تطوير الذكاء الاصطناعي أولاً (موصى به لمطوري الذكاء الاصطناعي)
**المتطلبات المسبقة**: إكمال الفصل 1  
**المدة**: 1-2 ساعة  
**التعقيد**: ⭐⭐

#### ما ستتعلمه
- تكامل Microsoft Foundry مع AZD
- نشر تطبيقات مدعومة بالذكاء الاصطناعي
- فهم تكوين خدمات الذكاء الاصطناعي

#### مصادر التعلم
- **🎯 ابدأ هنا**: [تكامل Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 وكلاء الذكاء الاصطناعي**: [دليل الوكلاء](docs/chapter-02-ai-development/agents.md) - نشر وكلاء ذكيين باستخدام AZD
- **📖 الأنماط**: [نشر نموذج الذكاء الاصطناعي](docs/chapter-02-ai-development/ai-model-deployment.md) - نشر وإدارة نماذج الذكاء الاصطناعي
- **🛠️ ورشة عمل**: [مختبر ورشة AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - اجعل حلول الذكاء الاصطناعي جاهزة لـ AZD
- **🎥 دليل تفاعلي**: [مواد الورشة](workshop/README.md) - تعلم عبر المتصفح مع MkDocs * بيئة DevContainer
- **📋 القوالب**: [قوالب Microsoft Foundry](#موارد-الورشة)
- **📝 الأمثلة**: [أمثلة نشر AZD](examples/README.md)

#### تمارين عملية
```bash
# نشر تطبيق الذكاء الاصطناعي الأول الخاص بك
azd init --template azure-search-openai-demo
azd up

# جرب قوالب ذكاء اصطناعي إضافية
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 نتيجة الفصل**: نشر وتكوين تطبيق دردشة مدعوم بالذكاء الاصطناعي مع قدرات RAG

**✅ تحقق من النجاح:**
```bash
# بعد الفصل 2، يجب أن تكون قادرًا على:
azd init --template azure-search-openai-demo
azd up
# اختبار واجهة الدردشة الذكية
# طرح أسئلة والحصول على ردود مدعومة بالذكاء الاصطناعي مع المصادر
# التحقق من عمل تكامل البحث
azd monitor  # التحقق من أن Application Insights يعرض القياساتTelemetry
azd down --force --purge
```

**📊 الوقت المتوقع:** 1-2 ساعة  
**📈 مستوى المهارة بعد:** يمكن نشر وتكوين تطبيقات ذكاء اصطناعي جاهزة للإنتاج  
**💰 الوعي بالتكلفة:** فهم تكاليف التطوير 80-150 دولار/شهر، وتكاليف الإنتاج 300-3500 دولار/شهر

#### 💰 اعتبارات التكلفة لنشر الذكاء الاصطناعي

**بيئة التطوير (تقديري 80-150 دولار/شهر):**
- نماذج Microsoft Foundry (الدفع حسب الاستخدام): 0-50 دولار/شهر (حسب استخدام الرموز)
- بحث الذكاء الاصطناعي (الطبقة الأساسية): 75 دولار/شهر
- تطبيقات الحاويات (الاستهلاك): 0-20 دولار/شهر
- التخزين (القياسي): 1-5 دولار/شهر

**بيئة الإنتاج (تقديري 300-3500+ دولار/شهر):**
- نماذج Microsoft Foundry (PTU للأداء المتسق): 3000+ دولار/شهر أو الدفع حسب الاستخدام مع حجم عالٍ
- بحث الذكاء الاصطناعي (الطبقة القياسية): 250 دولار/شهر
- تطبيقات الحاويات (مخصصة): 50-100 دولار/شهر
- Application Insights: 5-50 دولار/شهر
- التخزين (المميز): 10-50 دولار/شهر

**💡 نصائح تحسين التكلفة:**
- استخدم **الطبقة المجانية** لنماذج Microsoft Foundry للتعلم (Azure OpenAI 50,000 رمز/شهر متضمن)
- نفذ `azd down` لتحرير الموارد عند عدم التطوير النشط
- ابدأ بالفوترة حسب الاستهلاك، وترقي لـ PTU فقط للإنتاج
- استخدم `azd provision --preview` لتقدير التكاليف قبل النشر
- فعّل التوسع التلقائي: ادفع فقط للاستخدام الفعلي

**مراقبة التكلفة:**
```bash
# تحقق من التكاليف الشهرية المقدرة
azd provision --preview

# راقب التكاليف الفعلية في بوابة أزور
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ الفصل 3: التكوين والمصادقة
**المتطلبات المسبقة**: إكمال الفصل 1  
**المدة**: 45-60 دقيقة  
**التعقيد**: ⭐⭐

#### ما ستتعلمه
- تكوين وإدارة البيئة
- أفضل ممارسات المصادقة والأمان
- تسمية وتنظيم الموارد

#### مصادر التعلم
- **📖 التكوين**: [دليل التكوين](docs/chapter-03-configuration/configuration.md) - إعداد البيئة
- **🔐 الأمان**: [أنماط المصادقة والهوية المُدارة](docs/chapter-03-configuration/authsecurity.md) - أنماط المصادقة
- **📝 أمثلة**: [مثال تطبيق قاعدة بيانات](examples/database-app/README.md) - أمثلة قاعدة بيانات AZD

#### تمارين عملية
- تكوين بيئات متعددة (تطوير، اختبار، إنتاج)
- إعداد مصادقة الهوية المُدارة
- تنفيذ تكوينات محددة للبيئة

**💡 نتيجة الفصل**: إدارة بيئات متعددة مع مصادقة وأمان صحيحين

---

### 🏗️ الفصل 4: البنية التحتية كرمز والنشر
**المتطلبات المسبقة**: إكمال الفصول 1-3  
**المدة**: 1-1.5 ساعة  
**التعقيد**: ⭐⭐⭐

#### ما ستتعلمه
- أنماط النشر المتقدمة
- البنية التحتية كرمز باستخدام Bicep
- استراتيجيات توفير الموارد

#### مصادر التعلم
- **📖 النشر**: [دليل النشر](docs/chapter-04-infrastructure/deployment-guide.md) - سير العمل الكامل
- **🏗️ التوفير**: [توفير الموارد](docs/chapter-04-infrastructure/provisioning.md) - إدارة موارد Azure
- **📝 أمثلة**: [مثال تطبيق الحاويات](../../examples/container-app) - النشر المُحَوَّم

#### تمارين عملية
- إنشاء قوالب Bicep مخصصة
- نشر تطبيقات متعددة الخدمات
- تنفيذ استراتيجيات النشر الأزرق-الأخضر

**💡 نتيجة الفصل**: نشر تطبيقات متعددة الخدمات المعقدة باستخدام قوالب بنية تحتية مخصصة

---


### 🎯 الفصل 5: حلول الذكاء الاصطناعي متعددة الوكلاء (متقدم)
**المتطلبات الأساسية**: إكمال الفصول 1-2  
**المدة**: 2-3 ساعات  
**التعقيد**: ⭐⭐⭐⭐

#### ما ستتعلمه
- أنماط بنية متعددة الوكلاء
- تنسيق وتنسيق الوكلاء
- نشرات الذكاء الاصطناعي الجاهزة للإنتاج

#### موارد التعلم
- **🤖 المشروع المميز**: [حل متعدد الوكلاء للبيع بالتجزئة](examples/retail-scenario.md) - تنفيذ كامل
- **🛠️ قوالب ARM**: [حزمة قالب ARM](../../examples/retail-multiagent-arm-template) - نشر بنقرة واحدة
- **📖 البنية**: [أنماط تنسيق متعددة الوكلاء](docs/chapter-06-pre-deployment/coordination-patterns.md) - الأنماط

#### تمارين عملية
```bash
# نشر الحل الكامل لوكلاء البيع بالتجزئة المتعددين
cd examples/retail-multiagent-arm-template
./deploy.sh

# استكشاف تكوينات الوكلاء
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 نتيجة الفصل**: نشر وإدارة حل ذكاء اصطناعي متعدد الوكلاء جاهز للإنتاج مع وكلاء العملاء والمخزون

---

### 🔍 الفصل 6: التحقق والتخطيط قبل النشر
**المتطلبات الأساسية**: إتمام الفصل 4  
**المدة**: ساعة واحدة  
**التعقيد**: ⭐⭐

#### ما ستتعلمه
- تخطيط السعة والتحقق من الموارد
- استراتيجيات اختيار وحدة حفظ المخزون (SKU)
- فحوصات قبل الإقلاع وأتمتة

#### موارد التعلم
- **📊 التخطيط**: [تخطيط السعة](docs/chapter-06-pre-deployment/capacity-planning.md) - التحقق من الموارد
- **💰 الاختيار**: [اختيار SKU](docs/chapter-06-pre-deployment/sku-selection.md) - خيارات فعالة من حيث التكلفة
- **✅ التحقق**: [فحوصات قبل الإقلاع](docs/chapter-06-pre-deployment/preflight-checks.md) - نصوص مؤتمتة

#### تمارين عملية
- تشغيل نصوص التحقق من السعة
- تحسين اختيارات SKU من حيث التكلفة
- تنفيذ فحوصات مؤتمتة قبل النشر

**💡 نتيجة الفصل**: التحقق وتحسين عمليات النشر قبل التنفيذ

---

### 🚨 الفصل 7: استكشاف الأخطاء وإصلاحها وتصحيح الأخطاء
**المتطلبات الأساسية**: إتمام أي فصل نشر  
**المدة**: 1-1.5 ساعة  
**التعقيد**: ⭐⭐

#### ما ستتعلمه
- منهجيات تصحيح الأخطاء المنهجية
- المشكلات الشائعة وحلولها
- استكشاف أخطاء الذكاء الاصطناعي المحددة

#### موارد التعلم
- **🔧 المشكلات الشائعة**: [المشكلات الشائعة](docs/chapter-07-troubleshooting/common-issues.md) - الأسئلة المتكررة والحلول
- **🕵️ التصحيح**: [دليل التصحيح](docs/chapter-07-troubleshooting/debugging.md) - استراتيجيات خطوة بخطوة
- **🤖 مشكلات الذكاء الاصطناعي**: [استكشاف أخطاء الذكاء الاصطناعي](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - مشاكل خدمات الذكاء الاصطناعي

#### تمارين عملية
- تشخيص فشل النشر
- حل مشكلات المصادقة
- تصحيح اتصال خدمة الذكاء الاصطناعي

**💡 نتيجة الفصل**: تشخيص وحل المشكلات الشائعة للنشر بشكل مستقل

---

### 🏢 الفصل 8: أنماط الإنتاج والمؤسسات
**المتطلبات الأساسية**: إتمام الفصول 1-4  
**المدة**: 2-3 ساعات  
**التعقيد**: ⭐⭐⭐⭐

#### ما ستتعلمه
- استراتيجيات النشر الإنتاجي
- أنماط الأمان المؤسسية
- المراقبة وتحسين التكلفة

#### موارد التعلم
- **🏭 الإنتاج**: [أفضل ممارسات الذكاء الاصطناعي للإنتاج](docs/chapter-08-production/production-ai-practices.md) - أنماط المؤسسات
- **📝 الأمثلة**: [مثال الخدمات المصغرة](../../examples/microservices) - هياكل معقدة
- **📊 المراقبة**: [تكامل Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - المراقبة

#### تمارين عملية
- تنفيذ أنماط الأمان المؤسسية
- إعداد مراقبة شاملة
- النشر للإنتاج بحوكمة ملائمة

**💡 نتيجة الفصل**: نشر تطبيقات جاهزة للمؤسسات مع إمكانيات إنتاج كاملة

---

## 🎓 نظرة عامة على الورشة: تجربة تعلم عملية

> **⚠️ حالة الورشة: تطوير نشط**  
> مواد الورشة قيد التطوير والتنقيح حالياً. الوحدات الأساسية تعمل، لكن بعض الأقسام المتقدمة غير مكتملة. ونحن نعمل بنشاط لإكمال كل المحتوى. [تتبع التقدم →](workshop/README.md)

### مواد ورشة عمل تفاعلية
**تجربة تعلم شاملة وتفاعلية باستخدام أدوات متصفح وتمارين موجهة**

توفر مواد الورشة تجربة تعليمية منظمة وتفاعلية تكمل المنهج القائم على الفصول السابق ذكرها. تم تصميم الورشة لكل من التعلم الذاتي والجلسات التي يقودها مدرب.

#### 🛠️ ميزات الورشة
- **واجهة متصفح**: ورشة عمل كاملة مدعومة بـ MkDocs مع ميزات البحث والنسخ والثيمات
- **تكامل GitHub Codespaces**: إعداد بيئة تطوير بنقرة واحدة
- **مسار تعلم منظم**: 8 وحدات تمارين موجهة (3-4 ساعات إجمالاً)
- **منهج مرحلي**: مقدمة → اختيار → تحقق → تفكيك → تكوين → تخصيص → تفكيك → خاتمة
- **بيئة DevContainer تفاعلية**: أدوات وتبعيات مُعدة مسبقًا

#### 📚 هيكل وحدات الورشة
تتبع الورشة **منهجية مرحلية من 8 وحدات** تأخذك من الاكتشاف إلى التمكن من النشر:

| الوحدة | الموضوع | ما ستفعله | المدة |
|--------|-------|----------------|----------|
| **0. مقدمة** | نظرة عامة على الورشة | فهم أهداف التعلم، المتطلبات الأساسية، وهيكل الورشة | 15 دقيقة |
| **1. اختيار** | اكتشاف القوالب | استكشاف قوالب AZD واختيار قالب الذكاء الاصطناعي المناسب لسيناريوك | 20 دقيقة |
| **2. تحقق** | النشر والتحقق | نشر القالب باستخدام `azd up` والتحقق من عمل البنية التحتية | 30 دقيقة |
| **3. تفكيك** | فهم الهيكل | استخدام GitHub Copilot لاستكشاف بنية القالب، ملفات Bicep، وتنظيم الشيفرة | 30 دقيقة |
| **4. تكوين** | تعمق في azure.yaml | إتقان تكوين `azure.yaml`، نقاط الربط الدورية، ومتغيرات البيئة | 30 دقيقة |
| **5. تخصيص** | اجعله خاصاً بك | تمكين بحث الذكاء الاصطناعي، التتبع، التقييم، والتخصيص لسيناريوك | 45 دقيقة |
| **6. تفكيك** | التنظيف | إلغاء تخصيص الموارد بأمان باستخدام `azd down --purge` | 15 دقيقة |
| **7. خاتمة** | الخطوات التالية | مراجعة الإنجازات، المفاهيم الرئيسية، ومتابعة رحلة التعلم | 15 دقيقة |

**تدفق الورشة:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 بدء الورشة
```bash
# الخيار 1: GitHub Codespaces (موصى به)
# انقر على "Code" → "Create codespace on main" في المستودع

# الخيار 2: التطوير المحلي
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# اتبع تعليمات الإعداد في workshop/README.md
```

#### 🎯 نتائج تعلم الورشة
عند إكمال الورشة سيقوم المشاركون بـ:
- **نشر تطبيقات الذكاء الاصطناعي للإنتاج**: استخدام AZD مع خدمات Microsoft Foundry
- **إتقان بنى الوكلاء المتعددين**: تنفيذ حلول وكيل ذكاء اصطناعي منسقة
- **تنفيذ أفضل ممارسات الأمان**: تكوين المصادقة والتحكم في الوصول
- **التحسين من أجل النطاق**: تصميم نشرات فعالة من حيث التكلفة وعالية الأداء
- **استكشاف أخطاء النشرات**: حل المشكلات الشائعة بشكل مستقل

#### 📖 موارد الورشة
- **🎥 دليل تفاعلي**: [مواد الورشة](workshop/README.md) - بيئة تعلم عبر المتصفح
- **📋 تعليمات وحدة بوحدة**:
  - [0. مقدمة](workshop/docs/instructions/0-Introduction.md) - نظرة عامة على الورشة والأهداف
  - [1. اختيار](workshop/docs/instructions/1-Select-AI-Template.md) - البحث واختيار قوالب الذكاء الاصطناعي
  - [2. تحقق](workshop/docs/instructions/2-Validate-AI-Template.md) - نشر والتحقق من القوالب
  - [3. تفكيك](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - استكشاف بنية القالب
  - [4. تكوين](workshop/docs/instructions/4-Configure-AI-Template.md) - إتقان azure.yaml
  - [5. تخصيص](workshop/docs/instructions/5-Customize-AI-Template.md) - تخصيص لسيناريوك
  - [6. تفكيك](workshop/docs/instructions/6-Teardown-Infrastructure.md) - تنظيف الموارد
  - [7. خاتمة](workshop/docs/instructions/7-Wrap-up.md) - مراجعة وخطوات تالية
- **🛠️ مختبر ورشة الذكاء الاصطناعي**: [مختبر ورشة الذكاء الاصطناعي](docs/chapter-02-ai-development/ai-workshop-lab.md) - تمارين موجهة للذكاء الاصطناعي
- **💡 بدء سريع**: [دليل إعداد الورشة](workshop/README.md#quick-start) - تكوين البيئة

**مثالي لـ**: التدريب المؤسسي، الدورات الجامعية، التعلم الذاتي، ومعسكرات تدريب المطورين.

---

## 📖 التعمق: قدرات AZD

إلى جانب الأساسيات، يوفر AZD ميزات قوية لنشر الإنتاج:

- **نشرات قائمة على القوالب** - استخدام قوالب جاهزة للأنماط الشائعة للتطبيقات
- **البنية التحتية كرمز** - إدارة موارد Azure باستخدام Bicep أو Terraform  
- **تدفقات عمل متكاملة** - توفير، نشر، ومراقبة التطبيقات بسلاسة
- **صديق للمطور** - محسّن لزيادة إنتاجية وتجربة المطور

### **AZD + Microsoft Foundry: مثالي للنشرات الذكاء الاصطناعي**

**لماذا AZD لحلول الذكاء الاصطناعي؟** AZD يعالج أهم التحديات التي يواجهها مطورو الذكاء الاصطناعي:

- **قوالب جاهزة للذكاء الاصطناعي** - قوالب مهيأة مسبقًا لنماذج Microsoft Foundry، خدمات Azure AI، وأعباء عمل تعلم الآلة
- **نشرات ذكاء اصطناعي آمنة** - أنماط أمان مدمجة لخدمات AI، مفاتيح API، ونقاط نهاية النماذج  
- **أنماط ذكاء اصطناعي للإنتاج** - أفضل الممارسات لنشرات تطبيقات AI قابلة للتوسع وفعالة من حيث التكلفة
- **تدفقات عمل AI شاملة** - من تطوير النموذج إلى النشر الإنتاجي مع المراقبة الملائمة
- **تحسين التكلفة** - استراتيجيات تخصيص الموارد والتمديد بذكاء لأعباء عمل AI
- **تكامل Microsoft Foundry** - اتصال سلس إلى كتالوج نماذج Microsoft Foundry ونقاط النهاية

---

## 🎯 مكتبة القوالب والأمثلة

### المميز: قوالب Microsoft Foundry
**ابدأ هنا إذا كنت تنشر تطبيقات الذكاء الاصطناعي!**

> **ملاحظة:** هذه القوالب تعرض أنماطًا مختلفة من الذكاء الاصطناعي. بعضها عينات Azure خارجية، والبعض الآخر تطبيقات محلية.

| القالب | الفصل | التعقيد | الخدمات | النوع |
|----------|---------|------------|----------|------|
| [**ابدأ مع دردشة الذكاء الاصطناعي**](https://github.com/Azure-Samples/get-started-with-ai-chat) | الفصل 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | خارجي |
| [**ابدأ مع وكلاء الذكاء الاصطناعي**](https://github.com/Azure-Samples/get-started-with-ai-agents) | الفصل 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| خارجي |
| [**عرض Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | الفصل 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | خارجي |
| [**بدء سريع لتطبيق دردشة OpenAI**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | الفصل 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | خارجي |
| [**وكيل OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | الفصل 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | خارجي |
| [**دردشة Contoso RAG**](https://github.com/Azure-Samples/contoso-chat) | الفصل 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | خارجي |
| [**حل متعدد الوكلاء للبيع بالتجزئة**](examples/retail-scenario.md) | الفصل 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **محلي** |

### المميز: سيناريوهات تعلم كاملة
**قوالب تطبيقات جاهزة للإنتاج مرتبطة بفصول التعلم**

| القالب | فصل التعلم | التعقيد | التعلم الرئيسي |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | الفصل 2 | ⭐ | أنماط نشر ذكاء اصطناعي أساسية |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | الفصل 2 | ⭐⭐ | تنفيذ RAG باستخدام Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | الفصل 4 | ⭐⭐ | تكامل ذكاء المستندات |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | الفصل 5 | ⭐⭐⭐ | إطار الوكيل واستدعاء الوظائف |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | الفصل 8 | ⭐⭐⭐ | تنسيق ذكاء اصطناعي مؤسسي |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | الفصل 5 | ⭐⭐⭐⭐ | بنية متعددة الوكلاء مع وكلاء العملاء والمخزون |

### التعلم حسب نوع المثال

> **📌 أمثلة محلية مقابل خارجية:**  
> **أمثلة محلية** (في هذا المستودع) = جاهزة للاستخدام فوراً  
> **أمثلة خارجية** (عينات Azure) = استنساخ من المستودعات المرتبطة

#### أمثلة محلية (جاهزة للاستخدام)
- [**حل متعدد الوكلاء للبيع بالتجزئة**](examples/retail-scenario.md) - تنفيذ كامل جاهز للإنتاج مع قوالب ARM
  - بنية متعددة الوكلاء (عملاء + وكلاء المخزون)
  - مراقبة وتقييم شاملة
  - نشر بنقرة واحدة عبر قالب ARM

#### أمثلة محلية - تطبيقات الحاويات (الفصول 2-5)
**أمثلة شاملة لنشر الحاويات في هذا المستودع:**

- [**أمثلة تطبيق الحاويات**](examples/container-app/README.md) - دليل كامل لنشر التطبيقات المحوسبة بالحاويات
  - [واجهة برمجة التطبيقات البسيطة باستخدام فلاسک](../../examples/container-app/simple-flask-api) - واجهة REST أساسية مع ميزة التوسيع حتى الصفر
  - [هيكلية الخدمات الصغيرة](../../examples/container-app/microservices) - نشر يحتوي على خدمات متعددة وجاهز للإنتاج
  - أنماط النشر السريع، الإنتاجي، والمتقدم
  - إرشادات المراقبة، الأمان، وتحسين التكلفة

#### أمثلة خارجية - تطبيقات بسيطة (الفصل 1-2)
**قم باستنساخ مستودعات عينات أزور هذه للبدء:**
- [تطبيق ويب بسيط - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - أنماط النشر الأساسية
- [موقع ويب ثابت - تطبيق React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - نشر محتوى ثابت
- [تطبيق الحاويات - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - نشر واجهة REST API

#### أمثلة خارجية - تكامل قواعد البيانات (الفصل 3-4)  
- [تطبيق قاعدة البيانات - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - أنماط الاتصال بقاعدة البيانات
- [دوال + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - سير عمل البيانات بدون خادم

#### أمثلة خارجية - أنماط متقدمة (الفصل 4-8)
- [خدمات صغيرة بلغة جافا](https://github.com/Azure-Samples/java-microservices-aca-lab) - هيكليات متعددة الخدمات
- [وظائف تطبيقات الحاويات](https://github.com/Azure-Samples/container-apps-jobs) - معالجة في الخلفية  
- [خط أنابيب تعلم الآلة على مستوى الإنتاج](https://github.com/Azure-Samples/mlops-v2) - أنماط تعلم آلة جاهزة للإنتاج

### مجموعات القوالب الخارجية
- [**معرض قوالب AZD الرسمي**](https://azure.github.io/awesome-azd/) - مجموعة منتقاة من القوالب الرسمية وقوالب المجتمع
- [**قوالب Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - توثيق قوالب Microsoft Learn
- [**دليل الأمثلة**](examples/README.md) - أمثلة تعليمية محلية مع شرح تفصيلي

---

## 📚 موارد و مراجع تعليمية

### مراجع سريعة
- [**ورقة أوامر**](resources/cheat-sheet.md) - أوامر azd الأساسية منظمة حسب الفصل
- [**قاموس المصطلحات**](resources/glossary.md) - مصطلحات Azure و azd  
- [**الأسئلة الشائعة**](resources/faq.md) - أسئلة شائعة منظمة حسب فصل التعلم
- [**دليل الدراسة**](resources/study-guide.md) - تمارين عملية شاملة

### ورش عمل تطبيقية
- [**مختبر ورشة عمل الذكاء الاصطناعي**](docs/chapter-02-ai-development/ai-workshop-lab.md) - اجعل حلول الذكاء الاصطناعي قابلة للنشر باستخدام AZD (2-3 ساعات)
- [**ورشة عمل تفاعلية**](workshop/README.md) - تمارين موجهة مكونة من 8 وحدات مع MkDocs و GitHub Codespaces
  - التتابع: المقدمة → الاختيار → التحقق → التفكيك → التكوين → التخصيص → التهدئة → الخاتمة

### موارد تعليمية خارجية
- [توثيق Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [مركز معماريات Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [حاسبة تسعير Azure](https://azure.microsoft.com/pricing/calculator/)
- [حالة Azure](https://status.azure.com/)

### مهارات وكيل الذكاء الاصطناعي لمحررك
- [**مهارات Microsoft Azure على skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 مهارة وكيل مفتوحة الذكاء الاصطناعي لـ Azure و Foundry والنشر والتشخيص وتحسين التكلفة والمزيد. قم بتثبيتها في GitHub Copilot أو Cursor أو Claude Code أو أي وكيل مدعوم:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 دليل حل المشكلات السريع

**مشاكل شائعة يواجهها المبتدئون وحلول فورية:**

<details>
<summary><strong>❌ "azd: الأمر غير موجود"</strong></summary>

```bash
# قم بتثبيت AZD أولاً
# ويندوز (PowerShell):
winget install microsoft.azd

# ماك أو إس:
brew tap azure/azd && brew install azd

# لينكس:
curl -fsSL https://aka.ms/install-azd.sh | bash

# تحقق من التثبيت
azd version
```
</details>

<details>
<summary><strong>❌ "لم يتم العثور على اشتراك" أو "الاشتراك غير محدد"</strong></summary>

```bash
# سرد الاشتراكات المتاحة
az account list --output table

# تعيين الاشتراك الافتراضي
az account set --subscription "<subscription-id-or-name>"

# التعيين لبيئة AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# التحقق
az account show
```
</details>

<details>
<summary><strong>❌ "حصة غير كافية" أو "تم تجاوز الحصة"</strong></summary>

```bash
# جرب منطقة أزور مختلفة
azd env set AZURE_LOCATION "westus2"
azd up

# أو استخدم وحدات SKU أصغر في التطوير
# حرر infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ فشل أمر "azd up" في منتصف الطريق</strong></summary>

```bash
# الخيار 1: تنظيف وإعادة المحاولة
azd down --force --purge
azd up

# الخيار 2: إصلاح البنية التحتية فقط
azd provision

# الخيار 3: فحص الحالة التفصيلية
azd show

# الخيار 4: فحص السجلات في مراقب أزور
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "فشل التوثيق" أو "انتهت صلاحية الرمز"</strong></summary>

```bash
# إعادة المصادقة لـ AZD
azd auth logout
azd auth login

# اختياري: تحديث Azure CLI أيضًا إذا كنت تستخدم أوامر az
az logout
az login

# التحقق من المصادقة
az account show
```
</details>

<details>
<summary><strong>❌ "المورد موجود مسبقًا" أو تعارضات التسمية</strong></summary>

```bash
# يقوم AZD بإنشاء أسماء فريدة، ولكن إذا حدث تعارض:
azd down --force --purge

# ثم أعد المحاولة باستخدام بيئة جديدة
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ استغراق نشر القالب وقتًا طويلاً</strong></summary>

**أوقات الانتظار الطبيعية:**
- تطبيق ويب بسيط: 5-10 دقائق
- تطبيق مع قاعدة بيانات: 10-15 دقيقة
- تطبيقات الذكاء الاصطناعي: 15-25 دقيقة (تخصيص OpenAI بطيء)

```bash
# تحقق من التقدم
azd show

# إذا توقف لأكثر من 30 دقيقة، تحقق من بوابة أزور:
azd monitor --overview
# ابحث عن عمليات النشر الفاشلة
```
</details>

<details>
<summary><strong>❌ "تم رفض الإذن" أو "ممنوع"</strong></summary>

```bash
# تحقق من دورك في Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# تحتاج إلى دور "المساهم" على الأقل
# اطلب من مسؤول Azure الخاص بك منح:
# - المساهم (للموارد)
# - مسؤول وصول المستخدم (لتعيينات الأدوار)
```
</details>

<details>
<summary><strong>❌ لا يمكن العثور على عنوان URL للتطبيق المنشور</strong></summary>

```bash
# عرض جميع نقاط نهاية الخدمة
azd show

# أو افتح بوابة أزور
azd monitor

# تحقق من خدمة محددة
azd env get-values
# ابحث عن متغيرات *_URL
```
</details>

### 📚 موارد حل المشاكل الكاملة

- **دليل المشاكل الشائعة:** [حلول مفصلة](docs/chapter-07-troubleshooting/common-issues.md)
- **مشاكل خاصة بالذكاء الاصطناعي:** [حل مشاكل الذكاء الاصطناعي](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **دليل التصحيح:** [التصحيح خطوة بخطوة](docs/chapter-07-troubleshooting/debugging.md)
- **الحصول على المساعدة:** [ديسكورد Azure](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 إتمام الدورة والشهادة

### تتبع التقدم
تتبع تقدمك في التعلم عبر كل فصل:

- [ ] **الفصل 1**: الأساسيات والبدء السريع ✅
- [ ] **الفصل 2**: تطوير أولي للذكاء الاصطناعي ✅  
- [ ] **الفصل 3**: التكوين والتوثيق ✅
- [ ] **الفصل 4**: البنية التحتية ككود والنشر ✅
- [ ] **الفصل 5**: حلول الذكاء الاصطناعي متعددة الوكلاء ✅
- [ ] **الفصل 6**: التحقق والتخطيط قبل النشر ✅
- [ ] **الفصل 7**: حل المشاكل والتصحيح ✅
- [ ] **الفصل 8**: أنماط الإنتاج والمؤسسات ✅

### التحقق من التعلم
بعد إكمال كل فصل، تحقق من معرفتك عن طريق:
1. **تمرين عملي**: استكمل نشر الفصل العملي
2. **اختبار المعرفة**: راجع قسم الأسئلة الشائعة للفصل
3. **نقاش المجتمع**: شارك تجربتك في Discord الخاص بـ Azure
4. **الفصل التالي**: انتقل إلى المستوى التالي من التعقيد

### فوائد إتمام الدورة
عند إتمام جميع الفصول، ستحصل على:
- **الخبرة الإنتاجية**: تطبيقات AI حقيقية منشورة على Azure
- **المهارات المهنية**: قدرات نشر جاهزة للمؤسسات  
- **الاعتراف المجتمعي**: عضو نشط في مجتمع مطوري Azure
- **تقدم مهني**: خبرة مطلوبة في النشر باستخدام AZD و AI

---

## 🤝 المجتمع والدعم

### الحصول على المساعدة والدعم
- **المشاكل التقنية**: [الإبلاغ عن الأخطاء وطلب الميزات](https://github.com/microsoft/azd-for-beginners/issues)
- **أسئلة التعلم**: [مجتمع Microsoft Azure Discord](https://discord.gg/microsoft-azure) و [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **مساعدة خاصة بالذكاء الاصطناعي**: انضم إلى [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **التوثيق**: [توثيق Azure Developer CLI الرسمي](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### رؤى المجتمع من Microsoft Foundry Discord

**نتائج استبيان حديث من قناة #Azure:**
- **45%** من المطورين يرغبون باستخدام AZD لأعباء عمل الذكاء الاصطناعي
- **التحديات الكبرى**: نشر متعدد الخدمات، إدارة بيانات الاعتماد، جاهزية الإنتاج  
- **الأكثر طلبًا**: قوالب خاصة بالذكاء الاصطناعي، أدلة حل المشاكل، أفضل الممارسات

**انضم إلى مجتمعنا لـ:**
- مشاركة تجاربك مع AZD + AI والحصول على المساعدة
- الوصول إلى معاينات مبكرة لقوالب AI الجديدة
- المساهمة في أفضل ممارسات نشر الذكاء الاصطناعي
- التأثير على تطوير ميزات AI + AZD المستقبلية

### المساهمة في الدورة
نرحب بالمساهمات! الرجاء قراءة [دليل المساهمة](CONTRIBUTING.md) للحصول على تفاصيل حول:
- **تحسين المحتوى**: تحسين الفصول والأمثلة الحالية
- **أمثلة جديدة**: إضافة سيناريوهات وقوالب واقعية  
- **الترجمة**: المساعدة في دعم اللغات المتعددة
- **تقارير الأخطاء**: تحسين الدقة والوضوح
- **معايير المجتمع**: اتباع إرشادات المجتمع الشاملة

---

## 📄 معلومات الدورة

### الترخيص
هذا المشروع مرخص بموجب رخصة MIT - راجع ملف [LICENSE](../../LICENSE) للتفاصيل.

### موارد تعلم متعلقة بـ Microsoft

ينتج فريقنا دورات تعليمية شاملة أخرى:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j للمبتدئين](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js للمبتدئين](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain للمبتدئين](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / الوكلاء
[![AZD للمبتدئين](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI للمبتدئين](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP للمبتدئين](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![وكلاء AI للمبتدئين](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### سلسلة الذكاء الاصطناعي التوليدية
[![الذكاء الاصطناعي التوليدي للمبتدئين](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![الذكاء الاصطناعي التوليدي (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![الذكاء الاصطناعي التوليدي (جافا)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)

[![الذكاء الاصطناعي التوليدي (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### التعلم الأساسي
[![التعلم الآلي للمبتدئين](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![علم البيانات للمبتدئين](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![الذكاء الاصطناعي للمبتدئين](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![الأمن السيبراني للمبتدئين](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![تطوير الويب للمبتدئين](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![إنترنت الأشياء للمبتدئين](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![تطوير XR للمبتدئين](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### سلسلة المساعد الذكي
[![مساعد الذكاء الاصطناعي للبرمجة الزوجية](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![مساعد C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![مغامرة المساعد](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ تصفح الدورة

**🚀 جاهز للبدء في التعلم؟**

**المبتدئون**: ابدأ بـ [الفصل 1: الأساسيات والبدء السريع](#-chapter-1-foundation--quick-start)  
**مطورون الذكاء الاصطناعي**: انتقل إلى [الفصل 2: تطوير الذكاء الاصطناعي أولاً](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**المطورون ذوو الخبرة**: ابدأ بـ [الفصل 3: التهيئة والمصادقة](#️-chapter-3-configuration--authentication)

**الخطوات التالية**: [ابدأ الفصل 1 - أساسيات AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنويه**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي والمعتمد. للمعلومات الهامة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->