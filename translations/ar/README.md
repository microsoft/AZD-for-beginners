# AZD للمبتدئين: رحلة تعلم منظمة

![AZD للمبتدئين](../../translated_images/ar/azdbeginners.5527441dd9f74068.webp) 

[![المراقبون على GitHub](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![التفرعات على GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![النجوم على GitHub](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![ديسكورد Azure](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![ديسكورد Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### ترجمات آلية (محدثة دائمًا)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[العربية](./README.md) | [البنغالية](../bn/README.md) | [البلغارية](../bg/README.md) | [البرمية (ميانمار)](../my/README.md) | [الصينية (المبسطة)](../zh-CN/README.md) | [الصينية (التقليدية، هونغ كونغ)](../zh-HK/README.md) | [الصينية (التقليدية، ماكاو)](../zh-MO/README.md) | [الصينية (التقليدية، تايوان)](../zh-TW/README.md) | [الكرواتية](../hr/README.md) | [التشيكية](../cs/README.md) | [الدانمركية](../da/README.md) | [الهولندية](../nl/README.md) | [الاستونية](../et/README.md) | [الفنلندية](../fi/README.md) | [الفرنسية](../fr/README.md) | [الألمانية](../de/README.md) | [اليونانية](../el/README.md) | [العبرية](../he/README.md) | [الهندية](../hi/README.md) | [المجرية](../hu/README.md) | [الإندونيسية](../id/README.md) | [الإيطالية](../it/README.md) | [اليابانية](../ja/README.md) | [الكانادا](../kn/README.md) | [الخميرية](../km/README.md) | [الكورية](../ko/README.md) | [الليتوانية](../lt/README.md) | [الماليزية](../ms/README.md) | [المالايالامية](../ml/README.md) | [الماراثية](../mr/README.md) | [النيبالية](../ne/README.md) | [البيجين النيجيري](../pcm/README.md) | [النرويجية](../no/README.md) | [الفارسية](../fa/README.md) | [البولندية](../pl/README.md) | [البرتغالية (البرازيل)](../pt-BR/README.md) | [البرتغالية (البرتغال)](../pt-PT/README.md) | [البنجابية (جورموخي)](../pa/README.md) | [الرومانية](../ro/README.md) | [الروسية](../ru/README.md) | [الصربية (السيريلية)](../sr/README.md) | [السلوفاكية](../sk/README.md) | [السلوفينية](../sl/README.md) | [الإسبانية](../es/README.md) | [السواحيلية](../sw/README.md) | [السويدية](../sv/README.md) | [التاغالوغية (الفلبينية)](../tl/README.md) | [التاميلية](../ta/README.md) | [التيلجو](../te/README.md) | [التايلاندية](../th/README.md) | [التركية](../tr/README.md) | [الأوكرانية](../uk/README.md) | [الأردية](../ur/README.md) | [الفيتنامية](../vi/README.md)

> **تفضل الاستنساخ محليًا؟**
>
> هذا المستودع يتضمن أكثر من 50 ترجمة لغوية مما يزيد حجم التنزيل بشكل كبير. للاستنساخ بدون الترجمات، استخدم الاستنساخ الانتقائي:
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
> هذا يمنحك كل ما تحتاجه لإكمال الدورة مع تنزيل أسرع بكثير.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 ما الجديد في azd اليوم

> 📌 تم التحقق من هذه الدورة باستخدام **`azd 1.25.6`** (يونيو 2026). شغّل `azd version` للتحقق من إصدارك، و`azd upgrade` للحصول على الأحدث.

لقد تطور Azure Developer CLI ليتجاوز تطبيقات الويب التقليدية وواجهات برمجة التطبيقات. اليوم، azd هو الأداة الوحيدة لنشر أي تطبيق إلى Azure — بما في ذلك التطبيقات المدعومة بالذكاء الاصطناعي والوكلاء الأذكياء.

إليك ما يعنيه ذلك بالنسبة لك:

- **الوكلاء المعتمدون بالذكاء الاصطناعي أصبحوا عبء عمل من الدرجة الأولى في azd.** يمكنك تهيئة ونشر وإدارة مشاريع الوكلاء باستخدام نفس سير العمل `azd init` → `azd up` الذي تعرفه بالفعل.
- **دورة حياة كاملة للوكلاء من سطر الأوامر.** امتداد `azure.ai.agents` يغطي الآن الرحلة بأكملها — `azd ai agent init` للتوضيع، `azd ai agent invoke` للاختبار (مع إخراج توقيت الاستجابة)، `azd ai agent eval generate` و `azd ai agent optimize` للقياس وتحسين الجودة، و `azd ai agent delete` للتنظيف.
- **مزيد من لبنات البناء للذكاء الاصطناعي.** إضافات المعاينة الجديدة — `azure.ai.skills` و `azure.ai.connections` — تتيح لك إدارة مهارات الوكلاء القابلة لإعادة الاستخدام واتصالات Foundry مباشرةً عبر azd.
- **التكامل مع Microsoft Foundry** يجلب نشر النماذج، واستضافة الوكلاء، وتكوين خدمات الذكاء الاصطناعي مباشرةً إلى نظام قوالب azd.
- **أساسيات يومية أكثر سلاسة.** الإصدارات الحديثة جعلت `azd init` قابلة لإعادة التشغيل بأمان، وجعلت `azd auth login` تقوم بمسح الرموز القديمة تلقائيًا، وأضافت موجه إعداد أول تشغيل ودودًا لـ `azd tool`.
- **سير العمل الأساسي لم يتغير.** سواء كنت تنشر تطبيق مهام بسيطة، أو خدمة مصغرة، أو حل ذكاء اصطناعي متعدد الوكلاء، الأوامر هي نفسها.

> **ملاحظة لمستخدمي Aspire:** تشير Microsoft الآن إلى المنتج ببساطة باسم **Aspire** (سابقًا ".NET Aspire"). دعم azd لـ Aspire لم يتغير — تم تحديث الاسم فقط.

إذا استخدمت azd من قبل، فإن دعم الذكاء الاصطناعي هو امتداد طبيعي — ليس أداة منفصلة أو مسارًا متقدمًا. إذا كنت تبدأ من جديد، فستتعلم سير عمل واحدًا يعمل مع كل شيء.

---

## 🚀 ما هو Azure Developer CLI (azd)؟

**Azure Developer CLI (azd)** هو أداة سطر أوامر مريحة للمطورين تجعل من السهل نشر التطبيقات على Azure. بدلًا من إنشاء وربط عشرات موارد Azure يدويًا، يمكنك نشر تطبيقات كاملة بأمر واحد.

### سحر `azd up`

```bash
# هذا الأمر الواحد يفعل كل شيء:
# ✅ ينشئ جميع موارد أزور
# ✅ يهيئ الشبكات والأمان
# ✅ يبني كود تطبيقك
# ✅ ينشر على أزور
# ✅ يعطيك رابط عمل
azd up
```

**هذا كل شيء!** لا نقرات في بوابة Azure، لا قوالب ARM معقدة لتتعلمها أولًا، ولا تكوين يدوي — فقط تطبيقات تعمل على Azure.

---

## ❓ Azure Developer CLI مقابل Azure CLI: ما الفرق؟

هذا هو السؤال الأكثر شيوعًا الذي يطرحه المبتدئون. إليك الإجابة البسيطة:

| الميزة | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **الغرض** | إدارة موارد Azure الفردية | نشر تطبيقات كاملة |
| **العقلية** | التركيز على البنية التحتية | التركيز على التطبيق |
| **مثال** | `az webapp create --name myapp...` | `azd up` |
| **منحنى التعلم** | يجب معرفة خدمات Azure | يكفي معرفة تطبيقك |
| **المناسب لـ** | DevOps، البنية التحتية | المطورون، النماذج الأولية |

### تشبيه بسيط

- **Azure CLI** مثل أن يكون لديك كل الأدوات لبناء منزل — مطارق ومنشار ومسامير. يمكنك بناء أي شيء، لكن عليك أن تعرف البناء.
- **Azure Developer CLI** مثل استئجار مقاول — تصف ما تريد، وهم يتولون البناء.

### متى تستخدم كلًا منهما

| السيناريو | استخدم هذا |
|----------|----------|
| "أريد نشر تطبيقي على الويب بسرعة" | `azd up` |
| "أحتاج لإنشاء حساب تخزين فقط" | `az storage account create` |
| "أبني تطبيق ذكاء اصطناعي كامل" | `azd init --template azure-search-openai-demo` |
| "أحتاج إلى تصحيح مورد Azure محدد" | `az resource show` |
| "أريد نشر جاهز للإنتاج في دقائق" | `azd up --environment production` |

### تعملان معًا!

AZD يستخدم Azure CLI تحت الغطاء. يمكنك استخدام كلاهما:
```bash
# انشر تطبيقك باستخدام AZD
azd up

# ثم قم بضبط الموارد المحددة باستخدام Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 اعثر على القوالب في Awesome AZD

لا تبدأ من الصفر! **Awesome AZD** هو مجموعة المجتمع من القوالب الجاهزة للنشر:

| المورد | الوصف |
|----------|-------------|
| 🔗 [**معرض Awesome AZD**](https://azure.github.io/awesome-azd/) | تصفح أكثر من 200 قالب مع نشر بنقرة واحدة |
| 🔗 [**قدّم قالبًا**](https://github.com/Azure/awesome-azd/issues) | ساهم بقالبك الخاص إلى المجتمع |
| 🔗 [**مستودع GitHub**](https://github.com/Azure/awesome-azd) | ضع نجمة واستكشف المصدر |

### قوالب ذكاء اصطناعي شائعة من Awesome AZD

```bash
# دردشة RAG مع نماذج Microsoft Foundry + البحث بالذكاء الاصطناعي
azd init --template azure-search-openai-demo

# تطبيق دردشة ذكاء اصطناعي سريع
azd init --template openai-chat-app-quickstart

# وكلاء الذكاء الاصطناعي مع وكلاء Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 ابدأ في 3 خطوات

قبل أن تبدأ، تأكد من أن جهازك جاهز للقالب الذي تريد نشره:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

إذا فشل أي فحص مطلوب، أصلح ذلك أولًا ثم تابع البدء السريع.

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

إذا لم تكن متأكدًا أي واحد تحتاجه، اتبع سير الإعداد الكامل في [التثبيت والإعداد](docs/chapter-01-foundation/installation.md#authentication-setup).

### الخطوة 3: نشر تطبيقك الأول

```bash
# التهيئة من قالب
azd init --template todo-nodejs-mongo

# النشر على Azure (ينشئ كل شيء!)
azd up
```

**🎉 هذا كل شيء!** تطبيقك الآن مباشر على Azure.

### التنظيف (لا تنس!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 كيف تستخدم هذه الدورة

تم تصميم هذه الدورة للتعلم التدريجي — ابدأ حيث تشعر بالراحة وتقدّم تدريجيًا:

| مستوى خبرتك | ابدأ من هنا |
|-----------------|------------|
| **جديد تمامًا على Azure** | [الفصل 1: الأساس](#-chapter-1-foundation--quick-start) |
| **تعرف Azure، جديد على AZD** | [الفصل 1: الأساس](#-chapter-1-foundation--quick-start) |
| **تريد نشر تطبيقات الذكاء الاصطناعي** | [الفصل 2: تطوير يركز على الذكاء الاصطناعي](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **تريد ممارسة عملية** | [🎓 ورشة عمل تفاعلية](workshop/README.md) - مختبر إرشادي لمدة 3-4 ساعات |
| **تحتاج أنماطًا للإنتاج** | [الفصل 8: الإنتاج والنماذج المؤسسية](#-chapter-8-production--enterprise-patterns) |

### إعداد سريع

1. **أنشئ Fork لهذا المستودع**: [![التفرعات على GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **انسخه**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **احصل على المساعدة**: [مجتمع Azure على ديسكورد](https://discord.com/invite/ByRwuEEgH4)

> **تفضل الاستنساخ محليًا؟**

> هذا المستودع يتضمن أكثر من 50 ترجمة لغوية مما يزيد حجم التنزيل بشكل كبير. للاستنساخ بدون الترجمات، استخدم الاستنساخ الانتقائي:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> هذا يمنحك كل ما تحتاجه لإكمال الدورة مع تنزيل أسرع بكثير.


## نظرة عامة على الدورة

اتقن Azure Developer CLI (azd) من خلال فصول منظمة مصممة للتعلم التدريجي. **تركيز خاص على نشر تطبيقات الذكاء الاصطناعي مع تكامل Microsoft Foundry.**
### لماذا هذه الدورة أساسية للمطورين المعاصرين

استنادًا إلى رؤى مجتمع Microsoft Foundry على Discord، **45% من المطورين يرغبون في استخدام AZD لأحمال العمل الخاصة بالذكاء الاصطناعي** لكنهم يواجهون تحديات تتعلق بـ:
- هندسات ذكاء اصطناعي متعددة الخدمات المعقدة
- أفضل الممارسات لنشر الذكاء الاصطناعي في بيئة الإنتاج  
- تكامل وتكوين خدمات Azure AI
- تحسين التكلفة لأحمال عمل الذكاء الاصطناعي
- استكشاف أخطاء نشر الذكاء الاصطناعي وإصلاحها

### أهداف التعلم

بإكمال هذه الدورة المنظمة، ستتمكن من:
- **إتقان أساسيات AZD**: المفاهيم الأساسية، التثبيت، والتكوين
- **نشر تطبيقات الذكاء الاصطناعي**: استخدام AZD مع خدمات Microsoft Foundry
- **تنفيذ البنية التحتية ككود**: إدارة موارد Azure باستخدام قوالب Bicep
- **استكشاف أخطاء النشر**: حل المشكلات الشائعة وتصحيح الأخطاء
- **التحسين للإنتاج**: الأمان، القياس، المراقبة، وإدارة التكاليف
- **بناء حلول متعددة الوكلاء**: نشر هندسات ذكاء اصطناعي معقدة

## قبل أن تبدأ: الحسابات، الوصول، والافتراضات

قبل أن تبدأ الفصل 1، تأكد من أن لديك ما يلي. تفترض خطوات التثبيت في وقت لاحق من هذا الدليل أن هذه الأساسيات قد تم التعامل معها بالفعل.

- **اشتراك Azure**: يمكنك استخدام اشتراك موجود من العمل أو حسابك الخاص، أو إنشاء [free trial](https://aka.ms/azurefreetrial) للبدء.
- **إذن لإنشاء موارد Azure**: بالنسبة لمعظم التمارين، يجب أن يكون لديك حق وصول لا يقل عن **Contributor** على الاشتراك المستهدف أو مجموعة الموارد. قد تفترض بعض الفصول أيضًا أنه يمكنك إنشاء مجموعات موارد، هويات مُدارة، وتعيينات RBAC.
- [**حساب GitHub**](https://github.com): هذا مفيد لعمل fork للمستودع، تتبع تغييراتك الخاصة، واستخدام GitHub Codespaces للورشة.
- **متطلبات وقت تشغيل القالب**: بعض القوالب تحتاج أدوات محلية مثل Node.js أو Python أو Java أو Docker. شغّل مدقق الإعداد قبل البدء حتى تكتشف الأدوات المفقودة مبكرًا.
- **الاطلاع الأساسي على الطرفية**: لا تحتاج أن تكون خبيرًا، لكن يجب أن تكون مرتاحًا في تشغيل أوامر مثل `git clone` و `azd auth login` و `azd up`.

> **تعمل في اشتراك مؤسسي؟**
> إذا كانت بيئة Azure الخاصة بك مُدارة بواسطة مسؤول، فتأكد مقدمًا من أنه يمكنك نشر الموارد في الاشتراك أو مجموعة الموارد التي تخطط لاستخدامها. إذا لم يكن ذلك ممكنًا، اطلب اشتراك sandbox أو وصول Contributor قبل أن تبدأ.

> **جديد على Azure؟**
> ابدأ مع تجربة Azure الخاصة بك أو اشتراك الدفع أثناء الاستخدام على https://aka.ms/azurefreetrial حتى تتمكن من إكمال التمارين من البداية إلى النهاية دون انتظار موافقات على مستوى المستأجر.

## 🗺️ خريطة الدورة: التنقل السريع حسب الفصل

كل فصل لديه README مخصص بأهداف التعلم، البداية السريعة، والتمارين:

| الفصل | الموضوع | الدروس | المدة | التعقيد |
|---------|-------|---------|----------|------------|
| **[الفصل 1: الأساس](docs/chapter-01-foundation/README.md)** | البدء | [أساسيات AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [التثبيت](docs/chapter-01-foundation/installation.md) &#124; [المشروع الأول](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[الفصل 2: تطوير الذكاء الاصطناعي](docs/chapter-02-ai-development/README.md)** | تطبيقات موجهة للذكاء الاصطناعي | [تكامل Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [وكلاء الذكاء الاصطناعي](docs/chapter-02-ai-development/agents.md) &#124; [نشر النماذج](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [ورشة العمل](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[الفصل 3: التكوين](docs/chapter-03-configuration/README.md)** | المصادقة والأمان | [التكوين](docs/chapter-03-configuration/configuration.md) &#124; [المصادقة والأمان](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[الفصل 4: البنية التحتية](docs/chapter-04-infrastructure/README.md)** | IaC والنشر | [دليل النشر](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [التمهيد](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[الفصل 5: متعدد الوكلاء](docs/chapter-05-multi-agent/README.md)** | حلول وكلاء الذكاء الاصطناعي | [سيناريو تجزئة البيع بالتجزئة](examples/retail-scenario.md) &#124; [أنماط التنسيق](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[الفصل 6: ما قبل النشر](docs/chapter-06-pre-deployment/README.md)** | التخطيط والتحقق | [فحوصات ما قبل الإقلاع](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [تخطيط السعة](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [اختيار SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [Application Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hr | ⭐⭐ |
| **[الفصل 7: استكشاف الأخطاء وإصلاحها](docs/chapter-07-troubleshooting/README.md)** | التصحيح والإصلاح | [المشكلات الشائعة](docs/chapter-07-troubleshooting/common-issues.md) &#124; [التصحيح](docs/chapter-07-troubleshooting/debugging.md) &#124; [مشكلات الذكاء الاصطناعي](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hrs | ⭐⭐ |
| **[الفصل 8: الإنتاج](docs/chapter-08-production/README.md)** | أنماط المؤسسة | [ممارسات الإنتاج](docs/chapter-08-production/production-ai-practices.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | مختبر عملي | [المقدمة](workshop/docs/instructions/0-Introduction.md) &#124; [الاختيار](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [التحقق](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [تفكيك](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [التكوين](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [التخصيص](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [تفكيك البنية التحتية](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [الخاتمة](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hrs | ⭐⭐ |

**إجمالي مدة الدورة:** ~10-14 hours | **تقدم المهارة:** مبتدئ → جاهز للإنتاج

---

## 📚 فصول التعلم

*اختر مسار التعلم بناءً على مستوى الخبرة والأهداف*

### 🚀 الفصل 1: الأساس والبداية السريعة
**المتطلبات السابقة**: اشتراك Azure، معرفة أساسية بسطر الأوامر  
**المدة**: 30-45 دقيقة  
**التعقيد**: ⭐

#### ما الذي ستتعلمه
- فهم أساسيات واجهة سطر أوامر مطور Azure (Azure Developer CLI)
- تثبيت AZD على منصتك
- أول نشر ناجح لك

#### مصادر التعلم
- **🎯 ابدأ من هنا**: [ما هي Azure Developer CLI؟](#what-is-azure-developer-cli)
- **📖 نظرية**: [أساسيات AZD](docs/chapter-01-foundation/azd-basics.md) - المفاهيم والمصطلحات الأساسية
- **⚙️ الإعداد**: [التثبيت والإعداد](docs/chapter-01-foundation/installation.md) - أدلة حسب المنصة
- **🛠️ عملي**: [مشروعك الأول](docs/chapter-01-foundation/first-project.md) - دليل خطوة بخطوة
- **📋 مرجع سريع**: [ورقة غش للأوامر](resources/cheat-sheet.md)

#### تمارين عملية
```bash
# فحص سريع للتثبيت
azd version

# انشر تطبيقك الأول
azd init --template todo-nodejs-mongo
azd up
```

**💡 نتيجة الفصل**: نشر تطبيق ويب بسيط بنجاح إلى Azure باستخدام AZD

**✅ تحقق النجاح:**
```bash
# بعد إكمال الفصل الأول، ستتمكن من:
azd version              # يعرض الإصدار المثبت
azd init --template todo-nodejs-mongo  # يهيئ المشروع
azd up                  # ينشر إلى أزور
azd show                # يعرض عنوان URL للتطبيق قيد التشغيل
# يفتح التطبيق في المتصفح ويعمل
azd down --force --purge  # ينظف الموارد
```

**📊 استثمار الوقت:** 30-45 دقيقة  
**📈 مستوى المهارة بعد:** يمكنه نشر تطبيقات أساسية بشكل مستقل
**📈 مستوى المهارة بعد:** يمكنه نشر تطبيقات أساسية بشكل مستقل

---

### 🤖 الفصل 2: تطوير موجه للذكاء الاصطناعي (مُنصح لمطوري الذكاء الاصطناعي)
**المتطلبات السابقة**: إكمال الفصل 1  
**المدة**: 1-2 ساعة  
**التعقيد**: ⭐⭐

#### ما الذي ستتعلمه
- تكامل Microsoft Foundry مع AZD
- نشر تطبيقات مدعومة بالذكاء الاصطناعي
- فهم تكوينات خدمات الذكاء الاصطناعي

#### مصادر التعلم
- **🎯 ابدأ من هنا**: [تكامل Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 وكلاء الذكاء الاصطناعي**: [دليل وكلاء الذكاء الاصطناعي](docs/chapter-02-ai-development/agents.md) - نشر وكلاء ذكيين باستخدام AZD
- **📖 أنماط**: [نشر نموذج الذكاء الاصطناعي](docs/chapter-02-ai-development/ai-model-deployment.md) - نشر وإدارة نماذج الذكاء الاصطناعي
- **🛠️ ورشة عمل**: [مختبر ورشة الذكاء الاصطناعي](docs/chapter-02-ai-development/ai-workshop-lab.md) - اجعل حلولك الذكية جاهزة لـ AZD
- **🎥 دليل تفاعلي**: [مواد الورشة](workshop/README.md) - تعلم عبر المتصفح مع MkDocs * DevContainer Environment
- **📋 قوالب**: [قوالب Microsoft Foundry المميزة](#موارد-الورشة)
- **📝 أمثلة**: [أمثلة نشر AZD](examples/README.md)

#### تمارين عملية
```bash
# انشر أول تطبيق ذكاء اصطناعي لك
azd init --template azure-search-openai-demo
azd up

# جرّب قوالب ذكاء اصطناعي إضافية
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 نتيجة الفصل**: نشر وتكوين تطبيق دردشة مدعوم بالذكاء الاصطناعي مع قدرات RAG

**✅ تحقق النجاح:**
```bash
# بعد الفصل الثاني، يجب أن تكون قادرًا على:
azd init --template azure-search-openai-demo
azd up
# اختبار واجهة دردشة الذكاء الاصطناعي
# طرح أسئلة والحصول على ردود مدعومة بالذكاء الاصطناعي مع المصادر
# التحقق من أن تكامل البحث يعمل
azd monitor  # التحقق من أن Application Insights يعرض بيانات القياس عن بُعد
azd down --force --purge
```

**📊 استثمار الوقت:** 1-2 ساعة  
**📈 مستوى المهارة بعد:** يمكنه نشر وتكوين تطبيقات ذكاء اصطناعي جاهزة للإنتاج  
**💰 وعي التكلفة:** فهم تكاليف التطوير $80-150/شهر، وتكاليف الإنتاج $300-3500/شهر

#### 💰 اعتبارات التكلفة لنشر الذكاء الاصطناعي

**بيئة التطوير (تقديريًا $80-150/شهر):**
- Microsoft Foundry Models (Pay-as-you-go): $0-50/شهر (بناءً على استخدام الرموز)
- AI Search (المستوى الأساسي): $75/شهر
- Container Apps (الاستهلاك): $0-20/شهر
- التخزين (قياسي): $1-5/شهر

**بيئة الإنتاج (تقديريًا $300-3,500+/شهر):**
- Microsoft Foundry Models (PTU للأداء المتسق): $3,000+/شهر أو الدفع حسب الاستخدام مع حجم عالي
- AI Search (المستوى القياسي): $250/شهر
- Container Apps (مخصص): $50-100/شهر
- Application Insights: $5-50/شهر
- التخزين (متميز): $10-50/شهر

**💡 نصائح لتحسين التكلفة:**
- استخدم **الطبقة المجانية** من Microsoft Foundry Models للتعلم (Azure OpenAI 50,000 tokens/شهر متضمنة)
- شغّل `azd down` لإلغاء تخصيص الموارد عندما لا تكون في طور التطوير النشط
- ابدأ بالفوترة المستندة إلى الاستهلاك، وترقَّ إلى PTU فقط للإنتاج
- استخدم `azd provision --preview` لتقدير التكاليف قبل النشر
- فعّل القياس التلقائي: ادفع فقط مقابل الاستخدام الفعلي

**مراقبة التكلفة:**
```bash
# تحقق من التكاليف الشهرية المقدرة
azd provision --preview

# راقب التكاليف الفعلية في بوابة Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ الفصل 3: التكوين والمصادقة
**المتطلبات السابقة**: إكمال الفصل 1  
**المدة**: 45-60 دقيقة  
**التعقيد**: ⭐⭐

#### ما الذي ستتعلمه
- تكوين وإدارة البيئات
- أفضل ممارسات المصادقة والأمان
- تسمية الموارد وتنظيمها

#### مصادر التعلم
- **📖 التكوين**: [دليل التكوين](docs/chapter-03-configuration/configuration.md) - إعداد البيئة
- **🔐 الأمان**: [أنماط المصادقة والهوية المُدارة](docs/chapter-03-configuration/authsecurity.md) - أنماط المصادقة
- **📝 أمثلة**: [مثال تطبيق قاعدة بيانات](examples/database-app/README.md) - أمثلة AZD لقواعد البيانات

#### تمارين عملية
- تهيئة بيئات متعددة (dev، staging، prod)
- إعداد مصادقة بالهوية المُدارة
- تنفيذ تكوينات خاصة بالبيئة

**💡 نتيجة الفصل**: إدارة بيئات متعددة بمصادقة وأمان مناسبين

---

### 🏗️ الفصل 4: البنية التحتية ككود والنشر
**المتطلبات السابقة**: إكمال الفصول 1-3  
**المدة**: 1-1.5 ساعة  
**التعقيد**: ⭐⭐⭐

#### ما الذي ستتعلمه
- أنماط النشر المتقدمة
- البنية التحتية ككود باستخدام Bicep
- استراتيجيات توفير الموارد

#### مصادر التعلم
- **📖 النشر**: [دليل النشر](docs/chapter-04-infrastructure/deployment-guide.md) - سير العمل الكامل
- **🏗️ التمهيد**: [تمهيد الموارد](docs/chapter-04-infrastructure/provisioning.md) - إدارة موارد Azure
- **📝 أمثلة**: [مثال تطبيق حاوية](../../examples/container-app) - نشرات مُحَوَّمة

#### تمارين عملية
- إنشاء قوالب Bicep مخصصة
- نشر تطبيقات متعددة الخدمات
- تنفيذ استراتيجيات النشر الأزرق-الأخضر

**💡 نتيجة الفصل**: نشر تطبيقات متعددة الخدمات المعقدة باستخدام قوالب بنية تحتية مخصصة
### 🎯 الفصل 5: حلول الذكاء الاصطناعي متعددة الوكلاء (متقدم)
**المتطلبات المسبقة**: إكمال الفصول 1-2  
**المدة**: 2-3 ساعات  
**التعقيد**: ⭐⭐⭐⭐

#### ما ستتعلم
- أنماط هندسة الوكلاء المتعددين
- تنسيق وتنسيق الوكلاء
- نشرات جاهزة للإنتاج للذكاء الاصطناعي

#### مصادر التعلم
- **🤖 المشروع المميز**: [حلول التجزئة متعددة الوكلاء](examples/retail-scenario.md) - تنفيذ كامل
- **🛠️ قوالب ARM**: [حزمة قوالب ARM](../../examples/retail-multiagent-arm-template) - نشر بنقرة واحدة
- **📖 العمارة**: [أنماط تنسيق الوكلاء المتعددين](docs/chapter-06-pre-deployment/coordination-patterns.md) - أنماط

#### تمارين عملية
```bash
# نشر الحل الكامل متعدد الوكلاء للبيع بالتجزئة
cd examples/retail-multiagent-arm-template
./deploy.sh

# استكشاف تكوينات الوكلاء
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 ناتج الفصل**: نشر وإدارة حل ذكاء اصطناعي متعدد الوكلاء جاهز للإنتاج مع وكلاء العميل والمخزون

---

### 🔍 الفصل 6: التحقق والتخطيط قبل النشر
**المتطلبات المسبقة**: إكمال الفصل 4  
**المدة**: 1 ساعة  
**التعقيد**: ⭐⭐

#### ما ستتعلم
- تخطيط السعة والتحقق من الموارد
- استراتيجيات اختيار SKU
- فحوصات ما قبل الإقلاع والأتمتة

#### مصادر التعلم
- **📊 التخطيط**: [تخطيط السعة](docs/chapter-06-pre-deployment/capacity-planning.md) - التحقق من الموارد
- **💰 الاختيار**: [اختيار SKU](docs/chapter-06-pre-deployment/sku-selection.md) - خيارات فعّالة من حيث التكلفة
- **✅ التحقق**: [فحوصات ما قبل الإقلاع](docs/chapter-06-pre-deployment/preflight-checks.md) - نصوص آلية

#### تمارين عملية
- تشغيل نصوص التحقق من السعة
- تحسين اختيارات SKU من أجل التكلفة
- تنفيذ فحوصات آلية قبل النشر

**💡 ناتج الفصل**: التحقق من النشر وتحسينه قبل التنفيذ

---

### 🚨 الفصل 7: استكشاف الأخطاء وتصحيحها
**المتطلبات المسبقة**: إكمال أي من فصول النشر  
**المدة**: 1-1.5 ساعة  
**التعقيد**: ⭐⭐

#### ما ستتعلم
- منهجيات منهجية لتصحيح الأخطاء
- المشاكل الشائعة والحلول
- استكشاف أخطاء مخصص للذكاء الاصطناعي

#### مصادر التعلم
- **🔧 المشاكل الشائعة**: [المشاكل الشائعة](docs/chapter-07-troubleshooting/common-issues.md) - الأسئلة المتكررة والحلول
- **🕵️ التصحيح**: [دليل التصحيح](docs/chapter-07-troubleshooting/debugging.md) - استراتيجيات خطوة بخطوة
- **🤖 مشاكل الذكاء الاصطناعي**: [استكشاف أخطاء الذكاء الاصطناعي](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - مشاكل خدمات الذكاء الاصطناعي

#### تمارين عملية
- تشخيص حالات فشل النشر
- حل مشاكل المصادقة
- تصحيح اتصال خدمات الذكاء الاصطناعي

**💡 ناتج الفصل**: تشخيص وحل مشكلات النشر الشائعة بشكل مستقل

---

### 🏢 الفصل 8: أنماط الإنتاج والمؤسسات
**المتطلبات المسبقة**: إكمال الفصول 1-4  
**المدة**: 2-3 ساعات  
**التعقيد**: ⭐⭐⭐⭐

#### ما ستتعلم
- استراتيجيات نشر للإنتاج
- أنماط أمان للمؤسسات
- المراقبة وتحسين التكلفة

#### مصادر التعلم
- **🏭 الإنتاج**: [أفضل ممارسات الذكاء الاصطناعي للإنتاج](docs/chapter-08-production/production-ai-practices.md) - أنماط مؤسسية
- **📝 أمثلة**: [مثال الخدمات المصغرة](../../examples/microservices) - بنى معقدة
- **📊 المراقبة**: [دمج Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - المراقبة

#### تمارين عملية
- تنفيذ أنماط أمان مؤسسية
- إعداد مراقبة شاملة
- النشر للإنتاج بحوكمة مناسبة

**💡 ناتج الفصل**: نشر تطبيقات جاهزة للمؤسسات بقدرات إنتاجية كاملة

---

## 🎓 نظرة عامة على الورشة: تجربة تعلم عملية

> **⚠️ حالة الورشة: قيد التطوير**  
> يتم حاليًا تطوير مواد الورشة وتنقيحها. الوحدات الأساسية تعمل، لكن بعض الأقسام المتقدمة غير مكتملة. نحن نعمل بنشاط على استكمال جميع المحتويات. [تتبع التقدم →](workshop/README.md)

### مواد الورشة التفاعلية
**تعلم عملي شامل باستخدام أدوات تعمل عبر المتصفح وتمارين موجهة**

توفر مواد الورشة لدينا تجربة تعلم عملية ومنظمة تكمل المنهاج القائم على الفصول أعلاه. تم تصميم الورشة لكل من التعلم الذاتي والجلسات بقيادة مدرب.

#### 🛠️ ميزات الورشة
- **واجهة قابلة للمتصفح**: ورشة عمل كاملة مدعومة بـ MkDocs مع ميزات البحث والنسخ والثيمات
- **تكامل GitHub Codespaces**: إعداد بيئة تطوير بنقرة واحدة
- **مسار تعلم منظم**: تمارين موجهة مكونة من 8 وحدات (3-4 ساعات إجمالاً)
- **منهجية تقدمية**: المقدمة → الاختيار → التحقق → التفكيك → التكوين → التخصيص → الإغلاق → الملخص
- **بيئة DevContainer تفاعلية**: أدوات واعتماديات مهيأة مسبقًا

#### 📚 هيكل وحدات الورشة
تتبع الورشة **منهجية تقدمية مكونة من 8 وحدات** تأخذك من الاكتشاف إلى إتقان النشر:

| الوحدة | الموضوع | ما ستفعله | المدة |
|--------|-------|----------------|----------|
| **0. المقدمة** | نظرة عامة على الورشة | فهم أهداف التعلم، المتطلبات المسبقة، وهيكل الورشة | 15 دقيقة |
| **1. الاختيار** | اكتشاف القوالب | استكشاف قوالب AZD واختيار قالب الذكاء الاصطناعي المناسب لسيناريوك | 20 دقيقة |
| **2. التحقق** | النشر والتحقق | نشر القالب باستخدام `azd up` والتحقق من عمل البنية التحتية | 30 دقيقة |
| **3. التفكيك** | فهم البنية | استخدام GitHub Copilot لاستكشاف بنية القالب وملفات Bicep وتنظيم الكود | 30 دقيقة |
| **4. التكوين** | الغوص في azure.yaml | إتقان تكوين `azure.yaml`، وlifecycle hooks، والمتغيرات البيئية | 30 دقيقة |
| **5. التخصيص** | اجعله خاصتك | تمكين AI Search، والتتبع، والتقييم، وتخصيصه لسيناريوك | 45 دقيقة |
| **6. الإغلاق** | التنظيف | إلغاء توفير الموارد بأمان باستخدام `azd down --purge` | 15 دقيقة |
| **7. الخلاصة** | الخطوات التالية | مراجعة الإنجازات والمفاهيم الأساسية ومواصلة رحلة التعلم | 15 دقيقة |

**تدفق الورشة:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 البدء بالورشة
```bash
# الخيار 1: GitHub Codespaces (موصى به)
# انقر على "Code" → "Create codespace on main" في المستودع

# الخيار 2: التطوير المحلي
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# اتبع تعليمات الإعداد في workshop/README.md
```

#### 🎯 مخرجات تعلم الورشة
عند إكمال الورشة، سيقوم المشاركون بـ:
- **نشر تطبيقات ذكاء اصطناعي للإنتاج**: استخدام AZD مع خدمات Microsoft Foundry
- **إتقان بنى الوكلاء المتعددين**: تنفيذ حلول وكلاء ذكاء اصطناعي منسقة
- **تنفيذ أفضل ممارسات الأمان**: تكوين المصادقة والتحكم بالوصول
- **التحسين للتوسع**: تصميم عمليات نشر فعّالة من حيث التكلفة والأداء
- **استكشاف أخطاء النشر**: حل المشكلات الشائعة بشكل مستقل

#### 📖 موارد الورشة
- **🎥 دليل تفاعلي**: [مواد الورشة](workshop/README.md) - بيئة تعلم عبر المتصفح
- **📋 تعليمات وحدة تلو الأخرى**:
  - [0. المقدمة](workshop/docs/instructions/0-Introduction.md) - نظرة عامة على الورشة والأهداف
  - [1. الاختيار](workshop/docs/instructions/1-Select-AI-Template.md) - العثور على قوالب الذكاء الاصطناعي واختيارها
  - [2. التحقق](workshop/docs/instructions/2-Validate-AI-Template.md) - نشر والتحقق من القوالب
  - [3. التفكيك](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - استكشاف بنية القالب
  - [4. التكوين](workshop/docs/instructions/4-Configure-AI-Template.md) - إتقان azure.yaml
  - [5. التخصيص](workshop/docs/instructions/5-Customize-AI-Template.md) - التخصيص لسيناريوك
  - [6. الإغلاق](workshop/docs/instructions/6-Teardown-Infrastructure.md) - تنظيف الموارد
  - [7. الخلاصة](workshop/docs/instructions/7-Wrap-up.md) - المراجعة والخطوات التالية
- **🛠️ مختبر ورشة الذكاء الاصطناعي**: [مختبر ورشة الذكاء الاصطناعي](docs/chapter-02-ai-development/ai-workshop-lab.md) - تمارين موجهة للذكاء الاصطناعي
- **💡 بداية سريعة**: [دليل إعداد الورشة](workshop/README.md#quick-start) - تكوين البيئة

**مثالية لـ**: التدريب المؤسسي، دورات الجامعة، التعلم الذاتي، ومعسكرات تدريب المطورين.

---

## 📖 الغوص العميق: قدرات AZD

بعيدًا عن الأساسيات، يوفر AZD ميزات قوية لعمليات النشر الإنتاجية:

- **عمليات نشر قائمة على القوالب** - استخدام قوالب جاهزة للأنماط التطبيقية الشائعة
- **البنية التحتية ككود** - إدارة موارد Azure باستخدام Bicep أو Terraform  
- **سير عمل متكامل** - توفير ونشر ومراقبة التطبيقات بسلاسة
- **ملائم للمطورين** - مُحسّن لإنتاجية المطور وتجربته

### **AZD + Microsoft Foundry: مثالي لنشر تطبيقات الذكاء الاصطناعي**

**لماذا AZD لحلول الذكاء الاصطناعي؟** يتعامل AZD مع أبرز التحديات التي يواجهها مطورو الذكاء الاصطناعي:

- **قوالب جاهزة للذكاء الاصطناعي** - قوالب مهيأة مسبقًا لنماذج Microsoft Foundry، وخدمات Azure AI، وأحمال عمل تعلم الآلة
- **نشر آمن للذكاء الاصطناعي** - أنماط أمان مدمجة لخدمات الذكاء الاصطناعي ومفاتيح API ونقاط نهاية النماذج  
- **أنماط الذكاء الاصطناعي للإنتاج** - أفضل الممارسات لعمليات نشر تطبيقات ذكاء اصطناعي قابلة للتوسع وفعالة من حيث التكلفة
- **سير عمل ذكاء اصطناعي شامل** - من تطوير النماذج إلى النشر الإنتاجي مع المراقبة المناسبة
- **تحسين التكلفة** - تخصيص موارد ذكي واستراتيجيات توسيع لأحمال عمل الذكاء الاصطناعي
- **تكامل Microsoft Foundry** - اتصال سلس إلى كتالوج نماذج Microsoft Foundry ونقاط نهايته

---

## 🎯 مكتبة القوالب والأمثلة

### مميز: قوالب Microsoft Foundry
**ابدأ من هنا إذا كنت تنشر تطبيقات ذكاء اصطناعي!**

> **ملاحظة:** توضح هذه القوالب أنماطًا مختلفة للذكاء الاصطناعي. بعضها أمثلة Azure خارجية، وغيرها تطبيقات محلية.

| القالب | الفصل | التعقيد | الخدمات | النوع |
|----------|---------|------------|----------|------|
| [**ابدأ مع دردشة الذكاء الاصطناعي**](https://github.com/Azure-Samples/get-started-with-ai-chat) | الفصل 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | خارجي |
| [**ابدأ مع وكلاء الذكاء الاصطناعي**](https://github.com/Azure-Samples/get-started-with-ai-agents) | الفصل 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| خارجي |
| [**عرض توضيحي Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | الفصل 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | خارجي |
| [**بدء سريع لتطبيق دردشة OpenAI**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | الفصل 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | خارجي |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | الفصل 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | خارجي |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | الفصل 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | خارجي |
| [**حلول التجزئة متعددة الوكلاء**](examples/retail-scenario.md) | الفصل 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **محلي** |

### مميز: سيناريوهات التعلم الكاملة
**قوالب تطبيقات جاهزة للإنتاج مرتبطة بفصول التعلم**

| القالب | فصل التعلم | التعقيد | ما ستتعلمه |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | الفصل 2 | ⭐ | أنماط نشر أساسية للذكاء الاصطناعي |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | الفصل 2 | ⭐⭐ | تنفيذ RAG باستخدام Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | الفصل 4 | ⭐⭐ | تكامل ذكاء المستندات |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | الفصل 5 | ⭐⭐⭐ | إطار عمل الوكيل واستدعاء الدوال |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | الفصل 8 | ⭐⭐⭐ | تنسيق الذكاء الاصطناعي المؤسسي |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | الفصل 5 | ⭐⭐⭐⭐ | بنية متعددة الوكلاء مع وكلاء العميل والمخزون |

### التعلم من خلال نوع المثال

> **📌 أمثلة محلية مقابل خارجية:**  
> **الأمثلة المحلية** (في هذا المستودع) = جاهزة للاستخدام فورًا  
> **الأمثلة الخارجية** (Azure Samples) = استنساخ من المستودعات المرتبطة

#### أمثلة محلية (جاهزة للاستخدام)
- [**حلول التجزئة متعددة الوكلاء**](examples/retail-scenario.md) - تنفيذ كامل جاهز للإنتاج مع قوالب ARM
  - بنية متعددة الوكلاء (وكلاء العميل + المخزون)
  - مراقبة وتقييم شاملة
  - نشر بنقرة واحدة عبر قالب ARM

#### أمثلة محلية - تطبيقات الحاويات (الفصول 2-5)
- [**أمثلة لتطبيقات الحاويات**](examples/container-app/README.md) - دليل كامل لنشر التطبيقات باستخدام الحاويات
  - [واجهة برمجة تطبيقات Flask بسيطة](../../examples/container-app/simple-flask-api) - واجهة REST أساسية تدعم التدرج إلى الصفر
  - [هندسة الخدمات المصغرة](../../examples/container-app/microservices) - نشر متعدد الخدمات جاهز للإنتاج
  - أنماط النشر: البدء السريع، الإنتاج، والمتقدّم
  - إرشادات المراقبة، الأمن، وتحسين التكلفة

#### أمثلة خارجية - تطبيقات بسيطة (الفصول 1-2)
**انسخ مستودعات أمثلة Azure هذه للبدء:**
- [تطبيق ويب بسيط - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - أنماط النشر الأساسية
- [موقع ثابت - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - نشر محتوى ثابت
- [تطبيق حاوية - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - نشر واجهة REST

#### أمثلة خارجية - تكامل قواعد البيانات (الفصول 3-4)  
- [تطبيق قاعدة بيانات - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - أنماط اتصال قواعد البيانات
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - تدفق بيانات بدون خادم

#### أمثلة خارجية - أنماط متقدمة (الفصول 4-8)
- [خدمات مصغرة بلغة Java](https://github.com/Azure-Samples/java-microservices-aca-lab) - هندسات متعددة الخدمات
- [مهام تطبيقات الحاويات](https://github.com/Azure-Samples/container-apps-jobs) - المعالجة في الخلفية  
- [خط أنابيب ML للمؤسسات](https://github.com/Azure-Samples/mlops-v2) - أنماط ML جاهزة للإنتاج

### مجموعات القوالب الخارجية
- [**معرض قوالب AZD الرسمي**](https://azure.github.io/awesome-azd/) - مجموعة مُختارة من القوالب الرسمية ومجتمعية
- [**قوالب Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - توثيق قوالب Microsoft Learn
- [**دليل الأمثلة**](examples/README.md) - أمثلة تعلم محلية مع شروح مفصّلة

---

## 📚 الموارد والمراجع للتعلّم

### مراجع سريعة
- [**ملخص الأوامر**](resources/cheat-sheet.md) - أوامر azd الأساسية مُنظَّمة بحسب الفصل
- [**مسرد المصطلحات**](resources/glossary.md) - مصطلحات Azure و azd  
- [**الأسئلة المتكررة**](resources/faq.md) - الأسئلة الشائعة مُنظَّمة حسب الفصل التعليمي
- [**دليل الدراسة**](resources/study-guide.md) - تمارين عملية شاملة

### ورش عمل تطبيقية
- [**مختبر ورشة عمل الذكاء الاصطناعي**](docs/chapter-02-ai-development/ai-workshop-lab.md) - اجعل حلولك الذكية قابلة للنشر باستخدام AZD (2-3 ساعات)
- [**ورشة تفاعلية**](workshop/README.md) - تمارين إرشادية مؤلفة من 8 وحدات باستخدام MkDocs وGitHub Codespaces
  - يتبعها: المقدمة → الاختيار → التحقق → التفكيك → التكوين → التخصيص → التفكيك النهائي → الختام

### موارد تعلم خارجية
- [توثيق Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [مركز هندسة Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [حاسبة أسعار Azure](https://azure.microsoft.com/pricing/calculator/)
- [حالة Azure](https://status.azure.com/)

### مهارات الوكلاء الذكي لمحررك
- [**مهارات Microsoft Azure على skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 مهارة وكيل مفتوحة للذكاء الاصطناعي على Azure، Foundry، النشر، التشخيص، تحسين التكلفة، وغيرها. قم بتثبيتها في GitHub Copilot، Cursor، Claude Code، أو أي وكيل مدعوم:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 دليل استكشاف الأعطال السريع

**المشكلات الشائعة التي يواجهها المبتدئون والحلول الفورية:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

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
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

```bash
# عرض الاشتراكات المتاحة
az account list --output table

# تعيين الاشتراك الافتراضي
az account set --subscription "<subscription-id-or-name>"

# تعيين لبيئة AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# تحقق
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

```bash
# جرّب منطقة Azure مختلفة
azd env set AZURE_LOCATION "westus2"
azd up

# أو استخدم أحجام SKU أصغر في بيئة التطوير
# حرّر infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

```bash
# الخيار 1: نظف وأعد المحاولة
azd down --force --purge
azd up

# الخيار 2: فقط أصلح البنية التحتية
azd provision

# الخيار 3: تحقق من الحالة التفصيلية
azd show

# الخيار 4: تحقق من السجلات في Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# إعادة المصادقة لـ AZD
azd auth logout
azd auth login

# اختياري: قم أيضًا بتحديث Azure CLI إذا كنت تقوم بتشغيل أوامر az
az logout
az login

# تحقق من المصادقة
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD ينشئ أسماء فريدة، ولكن إذا حدث تعارض:
azd down --force --purge

# ثم أعد المحاولة ببيئة جديدة
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Template deployment taking too long</strong></summary>

**أوقات الانتظار الطبيعية:**
- تطبيق ويب بسيط: 5-10 دقائق
- تطبيق مع قاعدة بيانات: 10-15 دقيقة
- تطبيقات الذكاء الاصطناعي: 15-25 دقيقة (إعداد OpenAI بطيء)

```bash
# تحقق من التقدم
azd show

# إذا علقت لأكثر من 30 دقيقة، تحقق من بوابة Azure:
azd monitor --overview
# ابحث عن عمليات النشر الفاشلة
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# تحقق من دور Azure الخاص بك
az role assignment list --assignee $(az account show --query user.name -o tsv)

# تحتاج إلى دور «المساهم» على الأقل
# اطلب من مسؤول Azure منحك:
# - المساهم (للموارد)
# - مسؤول وصول المستخدم (لتعيينات الأدوار)
```
</details>

<details>
<summary><strong>❌ Can't find deployed application URL</strong></summary>

```bash
# عرض جميع نقاط نهاية الخدمة
azd show

# أو افتح بوابة Azure
azd monitor

# تحقق من خدمة محددة
azd env get-values
# ابحث عن متغيرات *_URL
```
</details>

### 📚 موارد استكشاف الأخطاء الكاملة

- **دليل المشاكل الشائعة:** [حلول مفصلة](docs/chapter-07-troubleshooting/common-issues.md)
- **مشاكل متعلقة بالذكاء الاصطناعي:** [استكشاف أخطاء الذكاء الاصطناعي](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **دليل التصحيح:** [التصحيح خطوة بخطوة](docs/chapter-07-troubleshooting/debugging.md)
- **احصل على المساعدة:** [Discord الخاص بـ Azure](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 إتمام الدورة والشهادات

### تتبُّع التقدّم
تتبّع تقدمك التعليمي عبر كل فصل:

- [ ] **الفصل 1**: الأساسيات والبدء السريع ✅
- [ ] **الفصل 2**: تطوير يركز على الذكاء الاصطناعي ✅  
- [ ] **الفصل 3**: التكوين والمصادقة ✅
- [ ] **الفصل 4**: البنية التحتية كرمز والنشر ✅
- [ ] **الفصل 5**: حلول الذكاء الاصطناعي متعددة الوكلاء ✅
- [ ] **الفصل 6**: التحقق والتخطيط قبل النشر ✅
- [ ] **الفصل 7**: استكشاف الأخطاء وإصلاحها والتصحيح ✅
- [ ] **الفصل 8**: أنماط الإنتاج والمؤسسات ✅

### التحقق من التعلم
بعد إكمال كل فصل، تحقق من معرفتك عن طريق:
1. **التمرين العملي**: أكمل عملية النشر العملية للفصل
2. **اختبار المعرفة**: راجع قسم الأسئلة المتكررة الخاص بفصلك
3. **مناقشة المجتمع**: شارك تجربتك في Discord الخاص بـ Azure
4. **الفصل التالي**: انتقل إلى مستوى التعقيد التالي

### فوائد إتمام الدورة
عند إكمال جميع الفصول، ستحصل على:
- **خبرة إنتاجية**: نشرت تطبيقات ذكاء اصطناعي حقيقية على Azure
- **مهارات مهنية**: قدرات نشر جاهزة للمؤسسات  
- **الاعتراف المجتمعي**: عضو نشط في مجتمع مطوري Azure
- **تقدم وظيفي**: خبرة مطلوبة في AZD ونشر الذكاء الاصطناعي

---

## 🤝 المجتمع والدعم

### الحصول على المساعدة والدعم
- **المشاكل التقنية**: [الإبلاغ عن الأخطاء وطلب الميزات](https://github.com/microsoft/azd-for-beginners/issues)
- **أسئلة التعلم**: [مجتمع Microsoft Azure على Discord](https://discord.gg/microsoft-azure) و [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **مساعدة متعلقة بالذكاء الاصطناعي**: انضم إلى [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **الوثائق**: [توثيق Azure Developer CLI الرسمي](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### رؤى المجتمع من خادم Microsoft Foundry على Discord

**نتائج استطلاع حديثة من قناة #Azure:**
- **45%** من المطورين يرغبون في استخدام AZD لأحمال عمل الذكاء الاصطناعي
- **أهم التحديات**: نشر متعدد الخدمات، إدارة بيانات الاعتماد، الجهوزية للإنتاج  
- **الأكثر طلبًا**: قوالب مخصصة للذكاء الاصطناعي، أدلة استكشاف الأخطاء، أفضل الممارسات

**انضم إلى مجتمعنا لـ:**
- شارك تجاربك مع AZD + الذكاء الاصطناعي واحصل على المساعدة
- الوصول إلى معاينات مبكرة للقوالب الجديدة الخاصة بالذكاء الاصطناعي
- المساهمة في أفضل ممارسات نشر الذكاء الاصطناعي
- التأثير على تطوير ميزات AI + AZD المستقبلية

### المساهمة في الدورة
نرحب بالمساهمات! يرجى قراءة [دليل المساهمة](CONTRIBUTING.md) للتعرف على التفاصيل حول:
- **تحسين المحتوى**: تحسين الفصول والأمثلة الحالية
- **أمثلة جديدة**: أضف سيناريوهات وقوالب من العالم الحقيقي  
- **الترجمة**: ساعد في الحفاظ على الدعم متعدد اللغات
- **تقارير الأخطاء**: حسّن الدقة والوضوح
- **معايير المجتمع**: اتبع إرشادات مجتمعنا الشاملة

---

## 📄 معلومات الدورة

### الرخصة
هذا المشروع مرخَّص بموجب رخصة MIT - راجع ملف [LICENSE](../../LICENSE) للتفاصيل.

### موارد تعليمية ذات صلة من Microsoft

فريقنا ينتج دورات تعليمية شاملة أخرى:

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
[![وكلاء الذكاء الاصطناعي للمبتدئين](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### سلسلة الذكاء الاصطناعي التوليدي
[![الذكاء التوليدي للمبتدئين](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![الذكاء التوليدي (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![الذكاء التوليدي (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
‪‮[![الذكاء التوليدي (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

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
[![مغامرات Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ تنقل الدورة

**🚀 جاهز لبدء التعلم؟**

**المبتدئون**: ابدأ بـ [الفصل 1: الأساس والبدء السريع](#-chapter-1-foundation--quick-start)  
**مطورو الذكاء الاصطناعي**: انتقل إلى [الفصل 2: تطوير يركز على الذكاء الاصطناعي](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**المطورون ذوو الخبرة**: ابدأ بـ [الفصل 3: التكوين والمصادقة](#️-chapter-3-configuration--authentication)

**الخطوات التالية**: [ابدأ الفصل 1 - أساسيات AZD](docs/chapter-01-foundation/azd-basics.md) →‬

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنويه**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي والمعتمد. للمعلومات الهامة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->