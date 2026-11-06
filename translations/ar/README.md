# AZD للمبتدئين: رحلة تعلم منظمة

![AZD-for-beginners](../../translated_images/ar/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### الترجمات التلقائية (دائماً محدثة)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[العربية](./README.md) | [البنغالية](../bn/README.md) | [البلغارية](../bg/README.md) | [البورمية (ميانمار)](../my/README.md) | [الصينية (المبسطة)](../zh-CN/README.md) | [الصينية (التقليدية، هونغ كونغ)](../zh-HK/README.md) | [الصينية (التقليدية، ماكاو)](../zh-MO/README.md) | [الصينية (التقليدية، تايوان)](../zh-TW/README.md) | [الكرواتية](../hr/README.md) | [التشيكية](../cs/README.md) | [الدانماركية](../da/README.md) | [الهولندية](../nl/README.md) | [الإستونية](../et/README.md) | [الفنلندية](../fi/README.md) | [الفرنسية](../fr/README.md) | [الألمانية](../de/README.md) | [اليونانية](../el/README.md) | [العبرية](../he/README.md) | [الهندية](../hi/README.md) | [الهنغارية](../hu/README.md) | [الإندونيسية](../id/README.md) | [الإيطالية](../it/README.md) | [اليابانية](../ja/README.md) | [الكانادية](../kn/README.md) | [الخمرية](../km/README.md) | [الكورية](../ko/README.md) | [اللتوانية](../lt/README.md) | [الماليزية](../ms/README.md) | [المالايالامية](../ml/README.md) | [مانيپوري (ميتِي مايك)](../mni/README.md) | [الماراثية](../mr/README.md) | [النيبالية](../ne/README.md) | [البيجين النايجيري](../pcm/README.md) | [النرويجية](../no/README.md) | [الفارسية (الفارسية)](../fa/README.md) | [البولندية](../pl/README.md) | [البرتغالية (البرازيل)](../pt-BR/README.md) | [البرتغالية (البرتغال)](../pt-PT/README.md) | [البنجابية (غيرموخى)](../pa/README.md) | [الرومانية](../ro/README.md) | [الروسية](../ru/README.md) | [الصربية (السيريلية)](../sr/README.md) | [السلوفاكية](../sk/README.md) | [السلوفينية](../sl/README.md) | [الإسبانية](../es/README.md) | [السواحيلية](../sw/README.md) | [السويدية](../sv/README.md) | [التاغالوغية (الفلبينية)](../tl/README.md) | [التاميلية](../ta/README.md) | [التيلجو](../te/README.md) | [التايلاندية](../th/README.md) | [التركية](../tr/README.md) | [الأوكرانية](../uk/README.md) | [الأردية](../ur/README.md) | [الفيتنامية](../vi/README.md)

> **تفضل الاستنساخ محليًا؟**
>
> تحتوي هذه المستودعات على ترجمات لأكثر من 50 لغة مما يزيد بشكل كبير من حجم التنزيل. للاستنساخ بدون الترجمات، استخدم السحب الانتقائي:
>
> **باش / macOS / Linux:**
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
>
> **CMD (ويندوز):**
> ```cmd
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone "/*" "!translations" "!translated_images"
> ```
>
> هذا يوفر لك كل ما تحتاجه لإكمال الدورة بتنزيل أسرع بكثير.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 ما الجديد في azd اليوم

> 📌 تم التحقق من صحة هذه الدورة مقابل **`azd 1.27.1`** (يوليو 2026). شغّل `azd version` لفحص البناء الخاص بك، و`azd upgrade` للحصول على الأحدث.

لقد تجاوز Azure Developer CLI التطبيقات الويب التقليدية وواجهات برمجة التطبيقات. اليوم، azd هو الأداة الوحيدة لنشر **أي** تطبيق على Azure — بما في ذلك التطبيقات المدعومة بالذكاء الاصطناعي والوكلاء الأذكياء.

إليك ماذا يعني ذلك بالنسبة لك:

- **الوكلاء الذكيون أصبحوا الآن أحمال عمل معترف بها رسميًا في azd.** يمكنك تهيئة ونشر وإدارة مشاريع الوكلاء الذكيين باستخدام نفس سير العمل `azd init` → `azd up` الذي تعرفه بالفعل.
- **دورة حياة وكيل كاملة من خلال واجهة الأوامر.** يغطي امتداد `azure.ai.agents` الآن الرحلة كاملة — `azd ai agent init` لإنشاء الهيكل، `azd ai agent invoke` للاختبار (مع إخراج توقيت الاستجابة)، `azd ai agent eval generate` و`azd ai agent optimize` لقياس وتحسين الجودة، و`azd ai agent delete` للتنظيف.
- **مزيد من لبنات البناء الخاصة بالذكاء الاصطناعي.** تمكنك الامتدادات التجريبية الجديدة — `azure.ai.skills` و`azure.ai.connections` — من إدارة مهارات الوكلاء القابلة لإعادة الاستخدام واتصالات Foundry مباشرةً من خلال azd.
- **دمج Microsoft Foundry** يجلب نشر النماذج واستضافة الوكلاء وتكوين خدمات الذكاء الاصطناعي مباشرة إلى نظام قوالب azd.
- **أساسيات يومية أكثر سلاسة.** الإصدارات الأخيرة جعلت `azd init` قابلاً للتكرار بأمان (آمن لإعادة التشغيل)، وجعلت `azd auth login` تُزيل الرموز القديمة تلقائيًا، وأضافت موجه إعداد ودود لأول مرة `azd tool`.
- **لم يتغير سير العمل الأساسي.** سواء كنت تنشر تطبيق مهام، أو خدمة مصغرة، أو حل ذكاء اصطناعي متعدد الوكلاء، الأوامر هي نفسها.

> **ملاحظة لمستخدمي Aspire:** تشير مايكروسوفت الآن إلى المنتج ببساطة باسم **Aspire** (سابقًا ".NET Aspire"). دعم azd لـ Aspire لم يتغير — فقط تم تحديث الاسم.

إذا كنت قد استخدمت azd من قبل، فإن دعم الذكاء الاصطناعي هو امتداد طبيعي — وليس أداة منفصلة أو مسار متقدم. إذا كنت تبدأ من الصفر، ستتعلم سير عمل واحد يعمل لكل شيء.

---

## 🚀 ما هو Azure Developer CLI (azd)؟

**Azure Developer CLI (azd)** هو أداة سطر أوامر موجهة للمطورين تجعل من السهل نشر التطبيقات على Azure. بدلاً من إنشاء وربط عشرات الموارد يدوياً، يمكنك نشر التطبيقات بالكامل بأمر واحد.

### سحر `azd up`

```bash
# This single command does everything:
# ✅ Creates all Azure resources  
# ✅ Configures networking and security
# ✅ Builds your application code
# ✅ Deploys to Azure
# ✅ Gives you a working URL
azd up
```

**هذا كل شيء!** لا نقرتك على بوابة Azure، لا قوالب ARM المعقدة لتعلمها أولاً، لا تكوين يدوي — فقط تطبيقات تعمل على Azure.

---

## ❓ Azure Developer CLI مقابل Azure CLI: ما الفرق؟

هذا هو السؤال الأكثر شيوعًا بين المبتدئين. إليك الإجابة البسيطة:

| الميزة | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **الغرض** | إدارة موارد Azure الفردية | نشر التطبيقات كاملة |
| **العقلية** | تركيز على البنية التحتية | تركيز على التطبيق |
| **مثال** | `az webapp create --name myapp...` | `azd up` |
| **منحنى التعلم** | الحاجة لمعرفة خدمات Azure | فقط تعرف تطبيقك |
| **الأفضل لـ** | DevOps، البنية التحتية | المطورين، النمذجة الأولية |

### تشبيه بسيط

- **Azure CLI** يشبه وجود كل الأدوات لبناء منزل - مطارق، مناشير، مسامير. يمكنك بناء أي شيء، لكن عليك أن تعرف البناء.
- **Azure Developer CLI** يشبه استئجار مقاول - تصف ما تريد، وهم يتولون البناء.

### متى تستخدم كل منهما

| السيناريو | استخدم هذا |
|----------|----------|
| "أريد نشر تطبيقي بسرعة" | `azd up` |
| "أحتاج لإنشاء حساب تخزين فقط" | `az storage account create` |
| "أبني تطبيق ذكاء اصطناعي كامل" | `azd init --template azure-search-openai-demo` |
| "أحتاج لتصحيح مورد Azure محدد" | `az resource show` |
| "أريد نشر جاهز للإنتاج خلال دقائق" | `azd up --environment production` |

### هما يعملان معًا!

يستخدم AZD Azure CLI تحت الغطاء. يمكنك استخدام الاثنين معاً:
```bash
# Deploy your app with AZD
azd up

# Then fine-tune specific resources with Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 ابحث عن القوالب في Awesome AZD

لا تبدأ من الصفر! **Awesome AZD** هو مجموعة المجتمع من القوالب الجاهزة للنشر:

| المورد | الوصف |
|----------|-------------|
| 🔗 [**معرض Awesome AZD**](https://azure.github.io/awesome-azd/) | استعرض أكثر من 200 قالب مع نشر بنقرة واحدة |
| 🔗 [**أرسل قالب**](https://github.com/Azure/awesome-azd/issues) | ساهم بقالبك الخاص للمجتمع |
| 🔗 [**مستودع GitHub**](https://github.com/Azure/awesome-azd) | قم بالنجمة واستكشاف المصدر |

### قوالب AI شعبية من Awesome AZD

```bash
# RAG Chat with Microsoft Foundry Models + AI Search
azd init --template azure-search-openai-demo

# Quick AI Chat Application
azd init --template openai-chat-app-quickstart

# AI Agents with Foundry Agents
azd init --template get-started-with-ai-agents
```

---

## 🎯 بدء العمل في 3 خطوات

قبل أن تبدأ، تأكد من أن جهازك جاهز للقالب الذي تريد نشره:

**ويندوز:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

إذا فشل أي فحص مطلوب، أصلحه أولاً ثم تابع البدء السريع.

### الخطوة 1: تثبيت AZD (دقيقتان)

**ويندوز:**
```powershell
winget install microsoft.azd
```

**macOS:**
```bash
brew tap azure/azd && brew install azd
```

**لينكس:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### الخطوة 2: المصادقة لـ AZD

```bash
# Optional if you plan to use Azure CLI commands directly in this course
az login

# Required for AZD workflows
azd auth login
```

إذا لم تكن متأكدًا مما تحتاجه، اتبع التدفق الكامل للإعداد في [التثبيت والإعداد](docs/chapter-01-foundation/installation.md#authentication-setup).

### الخطوة 3: نشر تطبيقك الأول

```bash
# Initialize from a template
azd init --template todo-nodejs-mongo

# Deploy to Azure (creates everything!)
azd up
```

**🎉 هذا كل شيء!** تطبيقك الآن مباشر على Azure.

### التنظيف (لا تنسى!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 كيفية استخدام هذه الدورة

صممت هذه الدورة من أجل **التعلم التدريجي** - ابدأ حيث تشعر بالراحة وتقدم تدريجيًا:

| خبرتك | ابدأ من هنا |
|-----------------|------------|
| **جديد كليًا على Azure** | [الفصل 1: الأساس](#-chapter-1-foundation--quick-start) |
| **تعرف على Azure، جديد في AZD** | [الفصل 1: الأساس](#-chapter-1-foundation--quick-start) |
| **تريد نشر تطبيقات AI** | [الفصل 2: تطوير AI أولاً](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **تريد تدريب عملي** | [🎓 ورشة تفاعلية](workshop/README.md) - مختبر موجه 3-4 ساعات |
| **تحتاج إلى أنماط للإنتاج** | [الفصل 8: الإنتاج والمؤسسات](#-chapter-8-production--enterprise-patterns) |

### الإعداد السريع

1. **افتح فورك لهذا المستودع**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **انسخه**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **الحصول على المساعدة**: [مجتمع Azure على Discord](https://discord.com/invite/ByRwuEEgH4)

> **تفضل الاستنساخ محليًا؟**

> يحتوي هذا المستودع على أكثر من 50 ترجمة للغات مما يزيد بشكل كبير من حجم التنزيل. لاستنساخ بدون ترجمــات، استخدم sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> هذا يمنحك كل ما تحتاجه لإتمام الدورة بتنزيل أسرع بكثير.


## نظرة عامة على الدورة

اتقن Azure Developer CLI (azd) من خلال فصول منظمة مصممة للتعلم التدريجي. **تركيز خاص على نشر تطبيقات AI مع تكامل Microsoft Foundry.**

### لماذا هذه الدورة أساسية للمطورين الحديثين

بناءً على رؤى مجتمع Microsoft Foundry على Discord، **45% من المطورين يرغبون باستخدام AZD لأعباء عمل AI** لكنهم يواجهون تحديات مع:
- بنى ذكاء اصطناعي معقدة متعددة الخدمات
- أفضل ممارسات نشر AI في الإنتاج  
- تكامل خدمات Azure AI والتكوين
- تحسين تكلفة أعباء عمل AI
- استكشاف أخطاء نشر AI الخاصة

### أهداف التعلم

عند إتمام هذه الدورة المنظمة، ستتمكن من:
- **إتقان أساسيات AZD**: المفاهيم الأساسية، التثبيت، والتكوين
- **نشر تطبيقات AI**: استخدام AZD مع خدمات Microsoft Foundry
- **تنفيذ البنية التحتية ككود**: إدارة موارد Azure باستخدام قوالب Bicep
- **استكشاف أخطاء النشر وإصلاحها**: حل المشكلات الشائعة وتصحيح الأخطاء
- **التحسين للإنتاج**: الأمان، التوسع، المراقبة، وإدارة التكاليف
- **بناء حلول متعددة الوكلاء**: نشر هياكل الذكاء الاصطناعي المعقدة

## قبل أن تبدأ: الحسابات، الوصول، والافتراضات

قبل أن تبدأ الفصل الأول، تأكد من أن لديك ما يلي. تفترض خطوات التثبيت في هذا الدليل أن هذه الأساسيات تم التعامل معها مسبقًا.

- **اشتراك Azure**: يمكنك استخدام اشتراك قائم من عملك أو حسابك الخاص، أو إنشاء [نسخة تجريبية مجانية](https://aka.ms/azurefreetrial) للبدء.
- **إذن إنشاء موارد Azure**: لمعظم التمارين، يجب أن يكون لديك وصول **مشارك** على الأقل على الاشتراك أو مجموعة الموارد المستهدفة. وقد تفترض بعض الفصول أيضًا أنه يمكنك إنشاء مجموعات موارد، والهويات المدارة، وتعيينات RBAC.
- [**حساب GitHub**](https://github.com): هذا مفيد للتفرع من المستودع، وتتبع تغييراتك الخاصة، واستخدام GitHub Codespaces للورشة.
- **متطلبات وقت تشغيل القالب**: بعض القوالب تحتاج إلى أدوات محلية مثل Node.js، Python، Java، أو Docker. شغّل محقق الإعداد قبل البدء لتكتشف الأدوات المفقودة مبكرًا.
- **ألفة أساسية مع الطرفية**: لا تحتاج لأن تكون خبيرًا، ولكن يجب أن تكون مرتاحًا لتشغيل أوامر مثل `git clone`، `azd auth login`، و `azd up`.

> **تعمل في اشتراك مؤسسة؟**
> إذا كان بيئة Azure الخاصة بك تُدار بواسطة مسؤول، تأكد مقدمًا أنك تستطيع نشر الموارد في الاشتراك أو مجموعة الموارد التي تخطط لاستخدامها. وإذا لم يكن الأمر كذلك، اطلب اشتراك صندوق اختبار أو وصول كمشارك قبل أن تبدأ.

> **جديد على Azure؟**
> ابدأ بنسخة تجريبية خاصة بك من Azure أو اشتراك الدفع حسب الاستخدام على https://aka.ms/azurefreetrial حتى تتمكن من إكمال التمارين من البداية للنهاية دون انتظار الموافقات على مستوى المستأجر.

## 🗺️ خريطة الدورة: التنقل السريع حسب الفصل

يحتوي كل فصل على ملف README مخصص مع أهداف التعلم، بدايات سريعة، وتمارين:

| الفصل | الموضوع | الدروس | المدة | التعقيد |
|---------|-------|---------|----------|------------|
| **[الفصل 1: الأساس](docs/chapter-01-foundation/README.md)** | البدء | [أساسيات AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [التثبيت](docs/chapter-01-foundation/installation.md) &#124; [المشروع الأول](docs/chapter-01-foundation/first-project.md) | 30-45 دقيقة | ⭐ |
| **[الفصل 2: تطوير الذكاء الاصطناعي](docs/chapter-02-ai-development/README.md)** | تطبيقات الذكاء الاصطناعي أولاً | [دمج Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [وكلاء الذكاء الاصطناعي](docs/chapter-02-ai-development/agents.md) &#124; [نشر النماذج](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [ورشة العمل](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 ساعة | ⭐⭐ |
| **[الفصل 3: التهيئة](docs/chapter-03-configuration/README.md)** | المصادقة والأمان | [التهيئة](docs/chapter-03-configuration/configuration.md) &#124; [المصادقة والأمان](docs/chapter-03-configuration/authsecurity.md) | 45-60 دقيقة | ⭐⭐ |
| **[الفصل 4: البنية التحتية](docs/chapter-04-infrastructure/README.md)** | IaC والنشر | [دليل النشر](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [التوفير](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 ساعة | ⭐⭐⭐ |
| **[الفصل 5: متعدد الوكلاء](docs/chapter-05-multi-agent/README.md)** | حلول وكلاء الذكاء الاصطناعي | [سيناريو التجزئة](examples/retail-scenario.md) &#124; [أنماط التنسيق](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 ساعات | ⭐⭐⭐⭐ |
| **[الفصل 6: قبل النشر](docs/chapter-06-pre-deployment/README.md)** | التخطيط والتحقق | [فحوصات ما قبل الإقلاع](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [تخطيط السعة](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [اختيار SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [رؤى التطبيق](docs/chapter-06-pre-deployment/application-insights.md) | 1 ساعة | ⭐⭐ |
| **[الفصل 7: استكشاف الأخطاء وإصلاحها](docs/chapter-07-troubleshooting/README.md)** | التصحيح والإصلاح | [المشكلات الشائعة](docs/chapter-07-troubleshooting/common-issues.md) &#124; [التصحيح](docs/chapter-07-troubleshooting/debugging.md) &#124; [مشكلات الذكاء الاصطناعي](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 ساعة | ⭐⭐ |
| **[الفصل 8: الإنتاج](docs/chapter-08-production/README.md)** | أنماط المؤسسات | [ممارسات الإنتاج](docs/chapter-08-production/production-ai-practices.md) | 2-3 ساعات | ⭐⭐⭐⭐ |
| **[🎓 ورشة العمل](workshop/README.md)** | مختبر عملي | [مقدمة](workshop/docs/instructions/0-Introduction.md) &#124; [اختيار](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [التحقق](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [التفكيك](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [التهيئة](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [التخصيص](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [الإزالة](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [الاختتام](workshop/docs/instructions/7-Wrap-up.md) | 3-4 ساعات | ⭐⭐ |

**مدة الدورة الإجمالية:** ~10-14 ساعة | **تقدم المهارات:** مبتدئ → جاهز للإنتاج

---

## 📚 فصول التعلم

*اختر مسار تعلمك بناءً على مستوى الخبرة والأهداف*

### 🚀 الفصل 1: الأساس والبداية السريعة
**المتطلبات الأساسية**: اشتراك Azure، معرفة أساسية بسطر الأوامر  
**المدة**: 30-45 دقيقة  
**التعقيد**: ⭐

#### ما ستتعلمه
- فهم أساسيات Azure Developer CLI
- تثبيت AZD على منصتك
- أول نشر ناجح لك

#### الموارد التعليمية
- **🎯 ابدأ هنا**: [ما هو Azure Developer CLI؟](#what-is-azure-developer-cli)
- **📖 نظرية**: [أساسيات AZD](docs/chapter-01-foundation/azd-basics.md) - المفاهيم والمصطلحات الأساسية
- **⚙️ الإعداد**: [التثبيت والإعداد](docs/chapter-01-foundation/installation.md) - أدلة خاصة بالمنصة
- **🛠️ عملي**: [مشروعك الأول](docs/chapter-01-foundation/first-project.md) - دليل خطوة بخطوة
- **📋 مرجع سريع**: [ورقة غش الأوامر](resources/cheat-sheet.md)

#### التمارين العملية
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 ناتج الفصل**: نشر تطبيق ويب بسيط بنجاح على Azure باستخدام AZD

**✅ تحقق النجاح:**
```bash
# After completing Chapter 1, you should be able to:
azd version              # Shows installed version
azd init --template todo-nodejs-mongo  # Initializes project
azd up                  # Deploys to Azure
azd show                # Displays running app URL
# Application opens in browser and works
azd down --force --purge  # Cleans up resources
```

**📊 الوقت المستغرق:** 30-45 دقيقة  
**📈 مستوى المهارة بعد:** يمكنه نشر التطبيقات الأساسية بشكل مستقل
**📈 مستوى المهارة بعد:** يمكنه نشر التطبيقات الأساسية بشكل مستقل

---

### 🤖 الفصل 2: تطوير الذكاء الاصطناعي أولاً (موصى به لمطوري الذكاء الاصطناعي)
**المتطلبات الأساسية**: إتمام الفصل 1  
**المدة**: 1-2 ساعة  
**التعقيد**: ⭐⭐

#### ما ستتعلمه
- دمج Microsoft Foundry مع AZD
- نشر التطبيقات المعتمدة على الذكاء الاصطناعي
- فهم تكوينات خدمات الذكاء الاصطناعي

#### الموارد التعليمية
- **🎯 ابدأ هنا**: [دمج Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 وكلاء الذكاء الاصطناعي**: [دليل وكلاء الذكاء الاصطناعي](docs/chapter-02-ai-development/agents.md) - نشر وكلاء ذكيين مع AZD
- **📖 أنماط**: [نشر نموذج الذكاء الاصطناعي](docs/chapter-02-ai-development/ai-model-deployment.md) - نشر وإدارة نماذج الذكاء الاصطناعي
- **🛠️ ورشة العمل**: [مختبر ورشة عمل الذكاء الاصطناعي](docs/chapter-02-ai-development/ai-workshop-lab.md) - جعل حلول الذكاء الاصطناعي جاهزة بـ AZD
- **🎥 دليل تفاعلي**: [مواد ورشة العمل](workshop/README.md) - التعلم عبر المتصفح مع MkDocs * بيئة DevContainer
- **📋 قوالب**: [قوالب Microsoft Foundry](#featured-microsoft-foundry-templates)
- **📝 أمثلة**: [أمثلة نشر AZD](examples/README.md)

#### التمارين العملية
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 ناتج الفصل**: نشر وتكوين تطبيق دردشة مدعوم بالذكاء الاصطناعي مع قدرات RAG

**✅ تحقق النجاح:**
```bash
# After Chapter 2, you should be able to:
azd init --template azure-search-openai-demo
azd up
# Test the AI chat interface
# Ask questions and get AI-powered responses with sources
# Verify search integration works
azd monitor  # Check Application Insights shows telemetry
azd down --force --purge
```

**📊 الوقت المستغرق:** 1-2 ساعة  
**📈 مستوى المهارة بعد:** يمكنه نشر وتكوين تطبيقات ذكاء اصطناعي جاهزة للإنتاج  
**💰 الوعي بالتكاليف:** فهم تكاليف التطوير 80-150 دولار شهريًا، تكاليف الإنتاج 300-3500 دولار شهريًا

#### 💰 اعتبارات التكلفة لنشر الذكاء الاصطناعي

**بيئة التطوير (تقديري 80-150 دولار شهريًا):**
- نماذج Microsoft Foundry (الدفع حسب الاستخدام): 0-50 دولار شهريًا (استنادًا إلى استخدام الرموز)
- AI Search (الطبقة الأساسية): 75 دولار شهريًا
- تطبيقات الحاويات (الاستهلاك): 0-20 دولار شهريًا
- التخزين (القياسي): 1-5 دولار شهريًا

**بيئة الإنتاج (تقديري 300-3500+ دولار شهريًا):**
- نماذج Microsoft Foundry (PTU لأداء متسق): 3,000+ دولار شهريًا أو الدفع حسب الاستخدام مع حجم مرتفع
- AI Search (الطبقة القياسية): 250 دولار شهريًا
- تطبيقات الحاويات (مخصصة): 50-100 دولار شهريًا
- Application Insights: 5-50 دولار شهريًا
- التخزين (المميز): 10-50 دولار شهريًا

**💡 نصائح تحسين التكلفة:**
- استخدم نماذج Microsoft Foundry **الطبقة المجانية** للتعلم (Azure OpenAI يشمل 50,000 رمز شهريًا)
- شغّل `azd down` لإلغاء تخصيص الموارد عندما لا تكون في طور التطوير الفعلي
- ابدأ بالفوترة حسب الاستهلاك، وارتقِ لـ PTU فقط للإنتاج
- استخدم `azd provision --preview` لتقدير التكاليف قبل النشر
- فعّل التوسعة التلقائية: ادفع فقط مقابل الاستخدام الفعلي

**مراقبة التكاليف:**
```bash
# Check estimated monthly costs
azd provision --preview

# Monitor actual costs in Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ الفصل 3: التهيئة والمصادقة
**المتطلبات الأساسية**: إتمام الفصل 1  
**المدة**: 45-60 دقيقة  
**التعقيد**: ⭐⭐

#### ما ستتعلمه
- تهيئة وإدارة البيئة
- أفضل ممارسات المصادقة والأمان
- تسمية الموارد وتنظيمها

#### الموارد التعليمية
- **📖 التهيئة**: [دليل التهيئة](docs/chapter-03-configuration/configuration.md) - إعداد البيئة
- **🔐 الأمان**: [أنماط المصادقة والهويات المدارة](docs/chapter-03-configuration/authsecurity.md) - أنماط المصادقة
- **📝 أمثلة**: [مثال تطبيق قاعدة بيانات](examples/database-app/README.md) - أمثلة قاعدة بيانات AZD

#### التمارين العملية
- تهيئة بيئات متعددة (تطوير، اختبار، إنتاج)
- إعداد مصادقة الهوية المدارة
- تنفيذ تهيئات خاصة بالبيئة

**💡 ناتج الفصل**: إدارة بيئات متعددة بمصادقة وأمان مناسبين

---

### 🏗️ الفصل 4: البنية التحتية ككود والنشر
**المتطلبات الأساسية**: إتمام الفصول 1-3  
**المدة**: 1-1.5 ساعة  
**التعقيد**: ⭐⭐⭐

#### ما ستتعلمه
- أنماط النشر المتقدمة
- البنية التحتية ككود باستخدام Bicep
- استراتيجيات توفير الموارد

#### الموارد التعليمية
- **📖 النشر**: [دليل النشر](docs/chapter-04-infrastructure/deployment-guide.md) - سير عمل متكامل
- **🏗️ التوفير**: [توفير الموارد](docs/chapter-04-infrastructure/provisioning.md) - إدارة موارد Azure
- **📝 أمثلة**: [مثال تطبيق الحاويات](../../examples/container-app) - نشر تطبيقات محمولة بالحاويات

#### التمارين العملية
- إنشاء قوالب Bicep مخصصة
- نشر تطبيقات متعددة الخدمات
- تنفيذ استراتيجيات النشر الأزرق-الأخضر

**💡 ناتج الفصل**: نشر تطبيقات متعددة الخدمات معقدة باستخدام قوالب بنية تحتية مخصصة

---

### 🎯 الفصل 5: حلول الذكاء الاصطناعي متعددة الوكلاء (متقدم)
**المتطلبات الأساسية**: إتمام الفصول 1-2  
**المدة**: 2-3 ساعات  
**التعقيد**: ⭐⭐⭐⭐

#### ما ستتعلمه
- أنماط هندسة الوكلاء المتعددين
- تنسيق وتنسيق الوكلاء
- نشرات الذكاء الاصطناعي الجاهزة للإنتاج

#### الموارد التعليمية
- **🤖 المشروع المميز**: [حل الذكاء الاصطناعي متعدد الوكلاء في التجزئة](examples/retail-scenario.md) - التنفيذ الكامل
- **🛠️ قوالب ARM**: [حزمة قوالب ARM](../../examples/retail-multiagent-arm-template) - نشر بنقرة واحدة
- **📖 الهندسة**: [أنماط تنسيق الوكلاء المتعددين](docs/chapter-06-pre-deployment/coordination-patterns.md) - الأنماط

#### التمارين العملية
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 ناتج الفصل**: نشر وإدارة حل ذكاء اصطناعي متعدد الوكلاء جاهز للإنتاج مع وكلاء العملاء والمخزون

---

### 🔍 الفصل 6: التحقق والتخطيط قبل النشر
**المتطلبات الأساسية**: إتمام الفصل 4  
**المدة**: 1 ساعة  
**التعقيد**: ⭐⭐

#### ما ستتعلمه
- تخطيط السعة والتحقق من الموارد
- استراتيجيات اختيار SKU
- فحوصات ما قبل الإقلاع والأتمتة

#### الموارد التعليمية
- **📊 التخطيط**: [تخطيط السعة](docs/chapter-06-pre-deployment/capacity-planning.md) - تحقق من الموارد
- **💰 الاختيار**: [اختيار رمز المخزون](docs/chapter-06-pre-deployment/sku-selection.md) - خيارات فعالة من حيث التكلفة
- **✅ التحقق**: [فحوصات ما قبل الإطلاق](docs/chapter-06-pre-deployment/preflight-checks.md) - سكريبتات مؤتمتة

#### تمارين عملية
- تشغيل سكريبتات التحقق من السعة
- تحسين اختيار رموز المخزون من حيث التكلفة
- تنفيذ فحوصات مؤتمتة قبل النشر

**💡 نتيجة الفصل**: تحقق وقم بتحسين عمليات النشر قبل التنفيذ

---

### 🚨 الفصل 7: استكشاف الأخطاء وإصلاحها وتصحيحها
**المتطلبات السابقة**: إكمال أي فصل من فصول النشر  
**المدة الزمنية**: 1-1.5 ساعات  
**التعقيد**: ⭐⭐

#### ما ستتعلمه
- أساليب منظمة لتصحيح الأخطاء
- المشكلات الشائعة وحلولها
- استكشاف أخطاء خاصة بالذكاء الاصطناعي وإصلاحها

#### مصادر التعلم
- **🔧 المشكلات الشائعة**: [المشكلات الشائعة](docs/chapter-07-troubleshooting/common-issues.md) - الأسئلة المتكررة والحلول
- **🕵️ التصحيح**: [دليل التصحيح](docs/chapter-07-troubleshooting/debugging.md) - استراتيجيات خطوة بخطوة
- **🤖 مشكلات الذكاء الاصطناعي**: [استكشاف أخطاء الذكاء الاصطناعي](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - مشاكل خدمات الذكاء الاصطناعي

#### تمارين عملية
- تشخيص فشل عمليات النشر
- حل مشاكل المصادقة
- تصحيح اتصال خدمة الذكاء الاصطناعي

**💡 نتيجة الفصل**: تشخيص مستقل وحل مشاكل النشر الشائعة

---

### 🏢 الفصل 8: أنماط الإنتاج والمؤسسات
**المتطلبات السابقة**: إكمال الفصول 1-4  
**المدة الزمنية**: 2-3 ساعات  
**التعقيد**: ⭐⭐⭐⭐

#### ما ستتعلمه
- استراتيجيات نشر الإنتاج
- أنماط أمان المؤسسات
- المراقبة وتحسين التكلفة

#### مصادر التعلم
- **🏭 الإنتاج**: [أفضل ممارسات الذكاء الاصطناعي للإنتاج](docs/chapter-08-production/production-ai-practices.md) - أنماط المؤسسات
- **📝 أمثلة**: [مثال على الخدمات المصغرة](../../examples/microservices) - بنى معمارية معقدة
- **📊 المراقبة**: [تكامل Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - المراقبة

#### تمارين عملية
- تنفيذ أنماط أمان المؤسسات
- إعداد مراقبة شاملة
- النشر للإنتاج مع الحوكمة الصحيحة

**💡 نتيجة الفصل**: نشر تطبيقات جاهزة للمؤسسات مع قدرات إنتاج كاملة

---

## 🎓 نظرة عامة على ورشة العمل: تجربة تعلم تطبيقية

> **⚠️ حالة الورشة: التطوير جارٍ**  
> يتم حالياً تطوير وتحسين مواد الورشة. الوحدات الأساسية تعمل، ولكن بعض الأقسام المتقدمة غير مكتملة. نعمل بنشاط لإتمام جميع المحتويات. [تتبع التقدم →](workshop/README.md)

### مواد الورشة التفاعلية
**تعلم تطبيقي شامل مع أدوات متصفح وتمارين موجهة**

توفر لنا مواد الورشة تجربة تعليمية منظمة وتفاعلية تكمل المنهج القائم على الفصول أعلاه. الورشة مصممة للتعلم الذاتي والجلوس مع مدرب.

#### 🛠️ ميزات الورشة
- **واجهة متصفح متكاملة**: ورشة مدعومة بـMkDocs كاملة مع البحث، النسخ، وميزات السمات
- **تكامل GitHub Codespaces**: إعداد بيئة تطوير بنقرة واحدة
- **مسار تعلم منظم**: 8 وحدات تمارين موجهة (3-4 ساعات إجمالاً)
- **منهجية تدريجية**: المقدمة → الاختيار → التحقق → التحليل العكسي → التكوين → التخصيص → الإزالة → الخاتمة
- **بيئة DevContainer تفاعلية**: أدوات وإعدادات مسبقة التكوين

#### 📚 بنية وحدات الورشة
تتبع الورشة **منهجية تدريجية مكونة من 8 وحدات** تأخذك من الاكتشاف إلى إتقان النشر:

| الوحدة | الموضوع | ما ستفعله | المدة |
|--------|-------|----------------|----------|
| **0. المقدمة** | نظرة عامة على الورشة | فهم أهداف التعلم، المتطلبات، وبنية الورشة | 15 دقيقة |
| **1. الاختيار** | اكتشاف القوالب | استكشاف قوالب AZD واختيار القالب المناسب لسيناريو الذكاء الاصطناعي الخاص بك | 20 دقيقة |
| **2. التحقق** | النشر والتحقق | نشر القالب باستخدام `azd up` والتحقق من عمل البنية التحتية | 30 دقيقة |
| **3. التحليل العكسي** | فهم البنية | استخدام GitHub Copilot لاستكشاف بنية القالب وملفات Bicep وتنظيم الكود | 30 دقيقة |
| **4. التكوين** | تعمق في azure.yaml | إتقان تكوين `azure.yaml`، ربط الحلقات في دورة الحياة، والمتغيرات البيئية | 30 دقيقة |
| **5. التخصيص** | اجعله خاصاً بك | تفعيل البحث المعتمد على الذكاء الاصطناعي، التتبع، التقييم، والتخصيص لسيناريو خاص بك | 45 دقيقة |
| **6. الإزالة** | التنظيف | إلغاء تخصيص الموارد بأمان باستخدام `azd down --purge` | 15 دقيقة |
| **7. الخاتمة** | الخطوات التالية | مراجعة الإنجازات، المفاهيم الرئيسية، ومواصلة رحلتك التعليمية | 15 دقيقة |

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
# Option 1: GitHub Codespaces (Recommended)
# Click "Code" → "Create codespace on main" in the repository

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow the setup instructions in workshop/README.md
```

#### 🎯 نتائج تعلم الورشة
عند إكمال الورشة، سيتمكن المشاركون من:
- **نشر تطبيقات ذكاء اصطناعي للإنتاج**: استخدام AZD مع خدمات Microsoft Foundry
- **إتقان بنى الوكلاء المتعددين**: تنفيذ حلول وكلاء الذكاء الاصطناعي المنسقة
- **تنفيذ أفضل ممارسات الأمان**: تكوين المصادقة والتحكم في الوصول
- **تحسين الأداء للتوسع**: تصميم نشرات فعالة من حيث التكلفة والأداء
- **استكشاف أخطاء النشر وإصلاحها**: حل المشاكل الشائعة بشكل مستقل

#### 📖 موارد الورشة
- **🎥 دليل تفاعلي**: [مواد الورشة](workshop/README.md) - بيئة تعلم عبر المتصفح
- **📋 إرشادات وحدة بوحدة**:
  - [0. المقدمة](workshop/docs/instructions/0-Introduction.md) - نظرة عامة على الورشة والأهداف
  - [1. الاختيار](workshop/docs/instructions/1-Select-AI-Template.md) - إيجاد واختيار قوالب الذكاء الاصطناعي
  - [2. التحقق](workshop/docs/instructions/2-Validate-AI-Template.md) - نشر والتحقق من القوالب
  - [3. التحليل العكسي](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - استكشاف بنية القالب
  - [4. التكوين](workshop/docs/instructions/4-Configure-AI-Template.md) - إتقان azure.yaml
  - [5. التخصيص](workshop/docs/instructions/5-Customize-AI-Template.md) - التخصيص لسيناريو خاص
  - [6. الإزالة](workshop/docs/instructions/6-Teardown-Infrastructure.md) - تنظيف الموارد
  - [7. الخاتمة](workshop/docs/instructions/7-Wrap-up.md) - المراجعة والخطوات التالية
- **🛠️ مختبر ورشة الذكاء الاصطناعي**: [مختبر ورشة الذكاء الاصطناعي](docs/chapter-02-ai-development/ai-workshop-lab.md) - تمارين مع تركيز على الذكاء الاصطناعي
- **💡 بدء سريع**: [دليل إعداد الورشة](workshop/README.md#quick-start) - تكوين البيئة

**مناسب لـ**: تدريب الشركات، دورات جامعية، التعلم الذاتي، ومعسكرات تدريب المطورين.

---

## 📖 تعمق: قدرات AZD

بالإضافة إلى الأساسيات، يوفر AZD ميزات قوية لعمليات النشر الإنتاجية:

- **عمليات نشر معتمدة على القوالب** - استخدام قوالب معدة مسبقاً للأنماط الشائعة للتطبيقات
- **البنية التحتية ككود** - إدارة موارد Azure باستخدام Bicep أو Terraform  
- **تدفقات عمل متكاملة** - توفير، نشر، ومراقبة التطبيقات بسلاسة
- **صديق للمطورين** - مصمم لزيادة الإنتاجية وتجربة المطور

### **AZD + Microsoft Foundry: مثالي لنشر الذكاء الاصطناعي**

**لماذا AZD لحلول الذكاء الاصطناعي؟** يعالج AZD التحديات الرئيسية التي يواجهها مطورو الذكاء الاصطناعي:

- **قوالب جاهزة للذكاء الاصطناعي** - قوالب معدة مسبقاً لنماذج Microsoft Foundry، خدمات Azure AI، وأعباء عمل ML
- **نشر آمن للذكاء الاصطناعي** - أنماط أمان مدمجة لخدمات الذكاء الاصطناعي، مفاتيح API، ونقاط نهاية النماذج  
- **أنماط الذكاء الاصطناعي للإنتاج** - أفضل الممارسات للنشر القابل للتوسع والفعّال من حيث التكلفة
- **تدفقات عمل الذكاء الاصطناعي الشاملة** - من تطوير النماذج إلى النشر الإنتاجي مع المراقبة الصحيحة
- **تحسين التكلفة** - تخصيص الموارد الذكي واستراتيجيات التوسع لأعباء العمل الذكاء الاصطناعي
- **تكامل Microsoft Foundry** - اتصال سلس بدليل نماذج Microsoft Foundry ونقاط النهاية

---

## 🎯 مكتبة القوالب والأمثلة

### متميز: قوالب Microsoft Foundry
**ابدأ هنا إذا كنت تنشر تطبيقات الذكاء الاصطناعي!**

> **ملاحظة:** تعرض هذه القوالب أنماطاً مختلفة للذكاء الاصطناعي. بعضها عينات Azure خارجية، والبعض الآخر تطبيقات محلية.

| القالب | الفصل | التعقيد | الخدمات | النوع |
|----------|---------|------------|----------|------|
| [**ابدأ بالدردشة بالذكاء الاصطناعي**](https://github.com/Azure-Samples/get-started-with-ai-chat) | الفصل 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | خارجي |
| [**ابدأ مع وكلاء الذكاء الاصطناعي**](https://github.com/Azure-Samples/get-started-with-ai-agents) | الفصل 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| خارجي |
| [**عرض توضيحي Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | الفصل 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | خارجي |
| [**بدء سريع لتطبيق دردشة OpenAI**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | الفصل 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | خارجي |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | الفصل 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | خارجي |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | الفصل 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | خارجي |
| [**حل تجاري متعدد الوكلاء**](examples/retail-scenario.md) | الفصل 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **محلي** |

### متميز: سيناريوهات تعلم كاملة
**قوالب تطبيق جاهزة للإنتاج مرتبطة بفصول التعلم**

| القالب | فصل التعلم | التعقيد | التعلم الرئيسي |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | الفصل 2 | ⭐ | أنماط نشر ذكاء اصطناعي أساسية |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | الفصل 2 | ⭐⭐ | تطبيق RAG باستخدام Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | الفصل 4 | ⭐⭐ | تكامل ذكاء المستندات |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | الفصل 5 | ⭐⭐⭐ | إطار عامل واستدعاء دوال |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | الفصل 8 | ⭐⭐⭐ | تنظيم الذكاء الاصطناعي المؤسسي |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | الفصل 5 | ⭐⭐⭐⭐ | هندسة متعددة الوكلاء مع وكلاء العملاء والمخزون |

### التعلم حسب نوع المثال

> **📌 أمثلة محلية مقابل خارجية:**  
> **الأمثلة المحلية** (في هذا المستودع) = جاهزة للاستخدام فورًا  
> **الأمثلة الخارجية** (عينات Azure) = استنساخ من المستودعات المرتبطة

#### أمثلة محلية (جاهزة للاستخدام)
- [**حل تجاري متعدد الوكلاء**](examples/retail-scenario.md) - تطبيق إنتاجي كامل مع قوالب ARM
  - بنية متعددة الوكلاء (وكلاء العملاء + المخزون)
  - مراقبة وتقييم شامل
  - نشر بنقرة واحدة عبر قالب ARM

#### أمثلة محلية - تطبيقات الحاوية (الفصول 2-5)
**أمثلة شاملة على نشر الحاويات في هذا المستودع:**
- [**أمثلة تطبيقات الحاوية**](examples/container-app/README.md) - دليل كامل للنشر بالحاويات
  - [API بسيط باستخدام Flask](../../examples/container-app/simple-flask-api) - API REST أساسي مع التوسع للصفر
  - [بنية الخدمات المصغرة](../../examples/container-app/microservices) - نشر متعدد الخدمات جاهز للإنتاج
  - أنماط بدء سريع، الإنتاج، والنشر المتقدم
  - إرشادات المراقبة، الأمان، وتحسين التكلفة

#### أمثلة خارجية - تطبيقات بسيطة (الفصول 1-2)
**استنساخ هذه المستودعات عينات Azure للبدء:**
- [تطبيق ويب بسيط - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - أنماط النشر الأساسية
- [موقع ويب ثابت - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - نشر محتوى ثابت
- [تطبيق حاوية - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - نشر REST API

#### أمثلة خارجية - تكامل قواعد البيانات (الفصل 3-4)  
- [تطبيق قاعدة بيانات - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - أنماط اتصال قاعدة البيانات
- [الدوال + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - تدفق بيانات بدون خادم

#### أمثلة خارجية - أنماط متقدمة (الفصول 4-8)
- [خدمات مصغرة Java](https://github.com/Azure-Samples/java-microservices-aca-lab) - بنى متعددة الخدمات
- [مهام تطبيقات الحاوية](https://github.com/Azure-Samples/container-apps-jobs) - معالجة خلفية  
- [خط أنابيب ML مؤسسي](https://github.com/Azure-Samples/mlops-v2) - أنماط ML جاهزة للإنتاج

### مجموعات قالب خارجية
- [**معرض قوالب AZD الرسمي**](https://azure.github.io/awesome-azd/) - مجموعة مختارة من القوالب الرسمية والمجتمعية
- [**قوالب Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - توثيق قوالب Microsoft Learn
- [**دليل الأمثلة**](examples/README.md) - أمثلة تعلم محلية مع شروحات مفصّلة

---

## 📚 موارد التعلم والمراجع

### مراجع سريعة
- [**ورقة غش الأوامر**](resources/cheat-sheet.md) - أوامر azd الأساسية منظمة حسب الفصل
- [**مسرد المصطلحات**](resources/glossary.md) - مصطلحات Azure و azd  
- [**الأسئلة الشائعة**](resources/faq.md) - أسئلة شائعة منظمة حسب فصل التعلم
- [**دليل الدراسة**](resources/study-guide.md) - تمارين عملية شاملة

### ورش عمل تطبيقية
- [**مختبر ورشة عمل الذكاء الاصطناعي**](docs/chapter-02-ai-development/ai-workshop-lab.md) - اجعل حلولك الذكية قابلة للنشر عبر AZD (ساعتان إلى 3 ساعات)
- [**ورشة عمل تفاعلية**](workshop/README.md) - تمارين إرشادية مؤلفة من 8 وحدات مع MkDocs و GitHub Codespaces
  - يتبع: المقدمة → الاختيار → التحقق → التفكيك → التكوين → التخصيص → إزالة الإعداد → الختام

### مصادر تعليمية خارجية
- [توثيق Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [مركز هندسة Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [آلة حاسبة تسعير Azure](https://azure.microsoft.com/pricing/calculator/)
- [حالة Azure](https://status.azure.com/)

### مهارات الوكيل الذكي لمحررك
- [**مهارات Microsoft Azure على skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 مهارة وكيل مفتوحة لـ Azure AI، Foundry، النشر، التشخيص، تحسين التكلفة، وأكثر. قم بتثبيتها في GitHub Copilot، Cursor، Claude Code، أو أي وكيل مدعوم:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 دليل حل المشكلات السريع

**مشاكل شائعة يواجهها المبتدئون وحلول فورية:**

<details>
<summary><strong>❌ "azd: الأمر غير موجود"</strong></summary>

```bash
# Install AZD first
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Verify installation
azd version
```
</details>

<details>
<summary><strong>❌ "لم يتم العثور على اشتراك" أو "الاشتراك غير مضبوط"</strong></summary>

```bash
# List available subscriptions
az account list --output table

# Set default subscription
az account set --subscription "<subscription-id-or-name>"

# Set for AZD environment
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Verify
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" أو "الحد الأقصى للحصة تم تجاوزه"</strong></summary>

```bash
# Try different Azure region
azd env set AZURE_LOCATION "westus2"
azd up

# Or use smaller SKUs in development
# Edit infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "فشل أمر azd up" في منتصف التنفيذ</strong></summary>

```bash
# Option 1: Clean and retry
azd down --force --purge
azd up

# Option 2: Just fix infrastructure
azd provision

# Option 3: Check detailed status
azd show

# Option 4: Check logs in Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "فشل المصادقة" أو "انتهت صلاحية الرمز"</strong></summary>

```bash
# Re-authenticate for AZD
azd auth logout
azd auth login

# Optional: refresh Azure CLI too if you are running az commands
az logout
az login

# Verify authentication
az account show
```
</details>

<details>
<summary><strong>❌ "المورد موجود بالفعل" أو تعارضات في التسميات</strong></summary>

```bash
# AZD generates unique names, but if conflict:
azd down --force --purge

# Then retry with fresh environment
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ استغراق نشر النموذج وقتًا طويلاً</strong></summary>

**أوقات الانتظار الطبيعية:**
- تطبيق ويب بسيط: 5-10 دقائق
- تطبيق مع قاعدة بيانات: 10-15 دقيقة
- تطبيقات الذكاء الاصطناعي: 15-25 دقيقة (توفير OpenAI بطيء)

```bash
# Check progress
azd show

# If stuck >30 minutes, check Azure Portal:
azd monitor --overview
# Look for failed deployments
```
</details>

<details>
<summary><strong>❌ "تم رفض الإذن" أو "ممنوع"</strong></summary>

```bash
# Check your Azure role
az role assignment list --assignee $(az account show --query user.name -o tsv)

# You need at least "Contributor" role
# Ask your Azure admin to grant:
# - Contributor (for resources)
# - User Access Administrator (for role assignments)
```
</details>

<details>
<summary><strong>❌ لا يمكن العثور على عنوان URL للتطبيق المنشور</strong></summary>

```bash
# Show all service endpoints
azd show

# Or open Azure Portal
azd monitor

# Check specific service
azd env get-values
# Look for *_URL variables
```
</details>

### 📚 موارد شاملة لحل المشكلات

- **دليل المشاكل الشائعة:** [حلول مفصلة](docs/chapter-07-troubleshooting/common-issues.md)
- **مشاكل متعلقة بالذكاء الاصطناعي:** [استكشاف مشاكل الذكاء الاصطناعي](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **دليل التصحيح:** [تصحيح خطوة بخطوة](docs/chapter-07-troubleshooting/debugging.md)
- **احصل على المساعدة:** [ديسكورد Azure](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 إتمام الدورة والشهادة

### تتبع التقدم
تتبع تقدمك في التعلم عبر كل فصل:

- [ ] **الفصل 1**: الأساسيات والبدء السريع ✅
- [ ] **الفصل 2**: تطوير الذكاء الاصطناعي أولًا ✅  
- [ ] **الفصل 3**: التكوين والمصادقة ✅
- [ ] **الفصل 4**: البنية التحتية كرمز والنشر ✅
- [ ] **الفصل 5**: حلول الذكاء الاصطناعي متعددة الوكلاء ✅
- [ ] **الفصل 6**: التحقق والتخطيط قبل النشر ✅
- [ ] **الفصل 7**: استكشاف الأخطاء وإصلاحها ✅
- [ ] **الفصل 8**: أنماط الإنتاج والمؤسسات ✅

### التحقق من التعلم
بعد إتمام كل فصل، تحقق من معرفتك عن طريق:
1. **تمرين عملي**: إكمال النشر العملي للفصل
2. **اختبار المعرفة**: مراجعة قسم الأسئلة الشائعة لفصلك
3. **نقاش مجتمعي**: شارك تجربتك في ديسكورد Azure
4. **الفصل التالي**: انتقل إلى مستوى التعقيد التالي

### فوائد إتمام الدورة
عند إكمال جميع الفصول، ستحصل على:
- **خبرة في الإنتاج**: نشر تطبيقات ذكاء اصطناعي حقيقية على Azure
- **مهارات مهنية**: قدرات نشر جاهزة للمؤسسات  
- **تعرف المجتمع**: عضو نشط في مجتمع مطوري Azure
- **تقدم مهني**: خبرة مطلوبة في النشر عبر AZD والذكاء الاصطناعي

---

## 🤝 المجتمع والدعم

### الحصول على المساعدة والدعم
- **المشاكل التقنية**: [الإبلاغ عن الأخطاء وطلب الميزات](https://github.com/microsoft/azd-for-beginners/issues)
- **أسئلة التعلم**: [مجتمع Microsoft Azure Discord](https://discord.gg/microsoft-azure) و [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **مساعدة الذكاء الاصطناعي**: انضم إلى [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **التوثيق**: [وثائق Azure Developer CLI الرسمية](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### رؤى المجتمع من ديسكورد Microsoft Foundry

**نتائج استطلاع حديث من قناة #Azure:**
- **45%** من المطورين يريدون استخدام AZD لأعباء عمل الذكاء الاصطناعي
- **التحديات الكبرى**: نشرات متعددة الخدمات، إدارة بيانات الاعتماد، الجاهزية للإنتاج  
- **الأكثر طلبًا**: قوالب خاصة بالذكاء الاصطناعي، أدلة حل المشكلات، أفضل الممارسات

**انضم إلى مجتمعنا لـ:**
- مشاركة تجاربك في AZD + الذكاء الاصطناعي والحصول على الدعم
- الوصول إلى معاينات مبكرة لقوالب الذكاء الاصطناعي الجديدة
- المساهمة في أفضل ممارسات نشر الذكاء الاصطناعي
- التأثير على تطوير ميزات الذكاء الاصطناعي و AZD المستقبلية

### المساهمة في الدورة
نرحب بالمساهمات! يرجى قراءة [دليل المساهمة](CONTRIBUTING.md) للتفاصيل حول:
- **تحسين المحتوى**: تحسين الفصول والأمثلة الحالية
- **أمثلة جديدة**: إضافة سيناريوهات وقوالب من الواقع  
- **الترجمة**: المساعدة في دعم تعدد اللغات
- **التقارير عن الأخطاء**: تحسين الدقة والوضوح
- **معايير المجتمع**: اتباع إرشادات مجتمعنا الشاملة

---

## 📄 معلومات الدورة

### الترخيص
هذا المشروع مرخص برخصة MIT - انظر ملف [LICENSE](../../LICENSE) للتفاصيل.

### موارد تعليمية مرتبطة من مايكروسوفت

ينتج فريقنا دورات تعليمية شاملة أخرى:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j للمبتدئين](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js للمبتدئين](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain للمبتدئين](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / وكلاء
[![AZD للمبتدئين](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI للمبتدئين](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP للمبتدئين](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![وكلاء الذكاء الاصطناعي للمبتدئين](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### سلسلة الذكاء الاصطناعي التوليدي
[![الذكاء الاصطناعي التوليدي للمبتدئين](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![الذكاء الاصطناعي التوليدي (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![الذكاء الاصطناعي التوليدي (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![الذكاء الاصطناعي التوليدي (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### التعلم الأساسي
[![تعلم الآلة للمبتدئين](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![علوم البيانات للمبتدئين](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![الذكاء الاصطناعي للمبتدئين](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![الأمن السيبراني للمبتدئين](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![تطوير الويب للمبتدئين](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![إنترنت الأشياء للمبتدئين](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![تطوير XR للمبتدئين](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### سلسلة Copilot
[![Copilot للبرمجة الزوجية بالذكاء الاصطناعي](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot لـ C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![مغامرة Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ تنقل الدورة

**🚀 جاهز للبدء في التعلم؟**

**المبتدئون**: ابدأ بـ [الفصل 1: الأساسيات والبدء السريع](#-chapter-1-foundation--quick-start)  
**مطوروا الذكاء الاصطناعي**: انتقل إلى [الفصل 2: تطوير الذكاء الاصطناعي أولًا](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**المطورون ذوو الخبرة**: ابدأ بـ [الفصل 3: التكوين والمصادقة](#️-chapter-3-configuration--authentication)

**الخطوات التالية**: [ابدأ الفصل 1 - أساسيات AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنويه**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي والمعتمد. للمعلومات الهامة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->