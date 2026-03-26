# AZD للمبتدئين: رحلة تعلم منظمة

![AZD للمبتدئين](../../translated_images/ar/azdbeginners.5527441dd9f74068.webp) 

[![المشاهدون على GitHub](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![التفرعات على GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![النجوم على GitHub](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Discord لـ Azure](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Discord لـ Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### ترجمات مؤتمتة (محدثة دائمًا)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[العربية](./README.md) | [البنغالية](../bn/README.md) | [البلغارية](../bg/README.md) | [البورمية (ميانمار)](../my/README.md) | [الصينية (المبسطة)](../zh-CN/README.md) | [الصينية (تقليدية، هونغ كونغ)](../zh-HK/README.md) | [الصينية (تقليدية، ماكاو)](../zh-MO/README.md) | [الصينية (تقليدية، تايوان)](../zh-TW/README.md) | [الكرواتية](../hr/README.md) | [التشيكية](../cs/README.md) | [الدانماركية](../da/README.md) | [الهولندية](../nl/README.md) | [الإستونية](../et/README.md) | [الفنلندية](../fi/README.md) | [الفرنسية](../fr/README.md) | [الألمانية](../de/README.md) | [اليونانية](../el/README.md) | [العبرية](../he/README.md) | [الهندية](../hi/README.md) | [الهنغارية](../hu/README.md) | [الإندونيسية](../id/README.md) | [الإيطالية](../it/README.md) | [اليابانية](../ja/README.md) | [الكانادية](../kn/README.md) | [الكورية](../ko/README.md) | [اللتوانية](../lt/README.md) | [الماليزية](../ms/README.md) | [المالايلامية](../ml/README.md) | [المراثية](../mr/README.md) | [النيبالية](../ne/README.md) | [البيجين النيجيري](../pcm/README.md) | [النرويجية](../no/README.md) | [الفارسية (الفارسي)](../fa/README.md) | [البولندية](../pl/README.md) | [البرتغالية (البرازيل)](../pt-BR/README.md) | [البرتغالية (البرتغال)](../pt-PT/README.md) | [البنجابية (غورموخي)](../pa/README.md) | [الرومانية](../ro/README.md) | [الروسية](../ru/README.md) | [الصربية (السيريلية)](../sr/README.md) | [السلوفاكية](../sk/README.md) | [السلوفينية](../sl/README.md) | [الإسبانية](../es/README.md) | [السواحيلية](../sw/README.md) | [السويدية](../sv/README.md) | [التاغالوغية (الفلبينية)](../tl/README.md) | [التاميلية](../ta/README.md) | [التيلجو](../te/README.md) | [التايلاندية](../th/README.md) | [التركية](../tr/README.md) | [الأوكرانية](../uk/README.md) | [الأردية](../ur/README.md) | [الفيتنامية](../vi/README.md)

> **هل تفضل الاستنساخ محليًا؟**
>
> يتضمن هذا المستودع ترجمات لأكثر من 50 لغة مما يزيد بشكل كبير من حجم التنزيل. للاستنساخ بدون الترجمات، استخدم sparse checkout:
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

لقد توسع Azure Developer CLI ليشمل أكثر من تطبيقات الويب التقليدية وواجهات برمجة التطبيقات. اليوم، azd هو الأداة الوحيدة لنشر أي تطبيق إلى Azure — بما في ذلك التطبيقات المدعومة بالذكاء الاصطناعي والوكلاء الأذكياء.

إليك ما يعنيه ذلك بالنسبة لك:

- **الوكلاء المدعومون بالذكاء الاصطناعي أصبحوا الآن أحمال عمل رسمية في azd.** يمكنك تهيئة مشاريع وكلاء الذكاء الاصطناعي ونشرها وإدارتها باستخدام نفس سير العمل `azd init` → `azd up` الذي تعرفه بالفعل.
- **تكامل Microsoft Foundry** يجلب نشر النماذج واستضافة الوكلاء وتكوين خدمات الذكاء الاصطناعي مباشرة إلى نظام قوالب azd.
- **سير العمل الأساسي لم يتغير.** سواء كنت تنشر تطبيق مهام بسيط، خدمة مصغرة، أو حل متعدد الوكلاء للذكاء الاصطناعي، الأوامر هي نفسها.

إذا كنت قد استخدمت azd من قبل، فدعم الذكاء الاصطناعي هو امتداد طبيعي — وليس أداة منفصلة أو مسار متقدم. إذا كنت تبدأ من الصفر، ستتعلم سير عمل واحد يعمل مع كل شيء.

---

## 🚀 ما هو Azure Developer CLI (azd)؟

**Azure Developer CLI (azd)** هي أداة سطر أوامر موجهة للمطوّرين تُسهّل نشر التطبيقات إلى Azure. بدلًا من إنشاء وربط عشرات موارد Azure يدويًا، يمكنك نشر تطبيقات كاملة بأمر واحد.

### سحر `azd up`

```bash
# تقوم هذه الأوامر الفردية بكل شيء:
# ✅ ينشئ جميع موارد أزور
# ✅ يضبط الشبكات والأمان
# ✅ يبني كود التطبيق الخاص بك
# ✅ ينشر على أزور
# ✅ يمنحك رابطًا يعمل
azd up
```

**هذا كل شيء!** لا نقر على بوابة Azure، لا حاجة لتعلم قوالب ARM المعقدة أولًا، ولا تكوين يدوي - فقط تطبيقات تعمل على Azure.

---

## ❓ Azure Developer CLI مقابل Azure CLI: ما الفرق؟

هذا هو السؤال الأكثر شيوعًا الذي يطرحه المبتدئون. إليك الإجابة البسيطة:

| الميزة | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **الغرض** | إدارة موارد Azure الفردية | نشر تطبيقات كاملة |
| **طريقة التفكير** | التركيز على البنية التحتية | التركيز على التطبيق |
| **مثال** | `az webapp create --name myapp...` | `azd up` |
| **منحنى التعلم** | يجب معرفة خدمات Azure | فقط معرفة تطبيقك |
| **الأفضل لـ** | DevOps، البنية التحتية | المطورين، النماذج الأولية |

### تشبيه بسيط

- **Azure CLI** يشبه امتلاك كل الأدوات لبناء منزل - مطارق، مناشير، مسامير. يمكنك بناء أي شيء، لكن عليك معرفة البناء.
- **Azure Developer CLI** يشبه توظيف مقاول - تصف ما تريد، وهم يتولى عملية البناء.

### متى تستخدم كل منهما

| السيناريو | استخدم هذا |
|----------|----------|
| "أريد نشر تطبيقي الويب بسرعة" | `azd up` |
| "أحتاج إلى إنشاء حساب تخزين فقط" | `az storage account create` |
| "أبني تطبيق ذكاء اصطناعي كامل" | `azd init --template azure-search-openai-demo` |
| "أحتاج إلى تصحيح مورد Azure محدد" | `az resource show` |
| "أريد نشر جاهز للإنتاج في غضون دقائق" | `azd up --environment production` |

### يعملان معًا!

AZD يستخدم Azure CLI تحت الغطاء. يمكنك استخدام كلاهما:
```bash
# انشر تطبيقك باستخدام AZD
azd up

# ثم قم بضبط الموارد المحددة باستخدام Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 ابحث عن القوالب في Awesome AZD

لا تبدأ من الصفر! **Awesome AZD** هو مجموعة المجتمع من القوالب الجاهزة للنشر:

| المورد | الوصف |
|----------|-------------|
| 🔗 [**معرض Awesome AZD**](https://azure.github.io/awesome-azd/) | تصفح أكثر من 200 قالب مع نشر بنقرة واحدة |
| 🔗 [**قدّم قالبًا**](https://github.com/Azure/awesome-azd/issues) | ساهم بقالبك للمجتمع |
| 🔗 [**مستودع GitHub**](https://github.com/Azure/awesome-azd) | امنح نجمة واستكشف المصدر |

### قوالب ذكاء اصطناعي شائعة من Awesome AZD

```bash
# دردشة RAG مع نماذج Microsoft Foundry + بحث AI
azd init --template azure-search-openai-demo

# تطبيق دردشة AI سريع
azd init --template openai-chat-app-quickstart

# وكلاء AI مع وكلاء Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 البدء في 3 خطوات

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

### الخطوة 2: تسجيل الدخول إلى Azure

```bash
azd auth login
```

### الخطوة 3: انشر تطبيقك الأول

```bash
# التهيئة من قالب
azd init --template todo-nodejs-mongo

# النشر إلى أزور (ينشئ كل شيء!)
azd up
```

**🎉 هذا كل شيء!** تطبيقك الآن مباشر على Azure.

### التنظيف (لا تنسَ!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 كيفية استخدام هذه الدورة

تم تصميم هذه الدورة للتعلم التدرجي - ابدأ من حيث تشعر بالراحة وتقدّم تدريجيًا:

| خبرتك | ابدأ من هنا |
|-----------------|------------|
| **جديد تمامًا على Azure** | [الفصل 1: الأساس](#-chapter-1-foundation--quick-start) |
| **تعرف Azure، جديد على AZD** | [الفصل 1: الأساس](#-chapter-1-foundation--quick-start) |
| **تريد نشر تطبيقات ذكاء اصطناعي** | [الفصل 2: التطوير القائم على الذكاء الاصطناعي](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **تريد ممارسة عملية** | [🎓 ورشة عمل تفاعلية](workshop/README.md) - مختبر موجه لمدة 3-4 ساعات |
| **تحتاج أنماطًا للإنتاج** | [الفصل 8: الإنتاج وأنماط المؤسسات](#-chapter-8-production--enterprise-patterns) |

### الإعداد السريع

1. **قم بعمل Fork لهذا المستودع**: [![التفرعات على GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **استنسخه**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **احصل على مساعدة**: [مجتمع Discord لـ Azure](https://discord.com/invite/ByRwuEEgH4)

> **هل تفضل الاستنساخ محليًا؟**

> يتضمن هذا المستودع ترجمات لأكثر من 50 لغة مما يزيد بشكل كبير من حجم التنزيل. للاستنساخ بدون الترجمات، استخدم sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> هذا يمنحك كل ما تحتاجه لإكمال الدورة مع تنزيل أسرع بكثير.


## نظرة عامة على الدورة

أتقن Azure Developer CLI (azd) من خلال فصول منظمة مصممة للتعلم التدرجي. **تركيز خاص على نشر تطبيقات الذكاء الاصطناعي مع تكامل Microsoft Foundry.**

### لماذا هذه الدورة أساسية للمطورين العصريين

استنادًا إلى رؤى مجتمع Microsoft Foundry على Discord، **45% من المطورين يريدون استخدام AZD لأحمال عمل الذكاء الاصطناعي** لكنهم يواجهون تحديات مع:
- هندسات ذكاء اصطناعي متعددة الخدمات المعقدة
- أفضل ممارسات نشر الذكاء الاصطناعي للإنتاج  
- تكامل وتكوين خدمات Azure للذكاء الاصطناعي
- تحسين التكلفة لأحمال عمل الذكاء الاصطناعي
- استكشاف أخطاء النشر المتعلقة بالذكاء الاصطناعي وإصلاحها

### أهداف التعلم

بإكمال هذه الدورة المنظمة، سوف:
- **أتقن أساسيات AZD**: المفاهيم الأساسية، التثبيت، والتكوين
- **انشر تطبيقات ذكاء اصطناعي**: استخدم AZD مع خدمات Microsoft Foundry
- **نفّذ البنية التحتية ككود**: إدارة موارد Azure باستخدام قوالب Bicep
- **استكشف أخطاء النشر وأصلحها**: حل المشكلات الشائعة وتصحيح الأخطاء
- **حسّن للإنتاج**: الأمان، التحجيم، المراقبة، وإدارة التكلفة
- **ابن حلول متعددة الوكلاء**: نشر هندسات ذكاء اصطناعي معقدة

## 🗺️ خريطة الدورة: تنقل سريع حسب الفصل

كل فصل يحتوي على README مخصص بأهداف التعلم، البدء السريع، والتمارين:

| الفصل | الموضوع | الدروس | المدة | الصعوبة |
|---------|-------|---------|----------|------------|
| **[الفصل 1: الأساس](docs/chapter-01-foundation/README.md)** | البدء | [أساسيات AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [التثبيت](docs/chapter-01-foundation/installation.md) &#124; [المشروع الأول](docs/chapter-01-foundation/first-project.md) | 30-45 دقيقة | ⭐ |
| **[الفصل 2: تطوير الذكاء الاصطناعي](docs/chapter-02-ai-development/README.md)** | تطبيقات تركز على الذكاء الاصطناعي | [تكامل Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [وكلاء الذكاء الاصطناعي](docs/chapter-02-ai-development/agents.md) &#124; [نشر النماذج](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [ورشة عمل](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 ساعة | ⭐⭐ |
| **[الفصل 3: التكوين](docs/chapter-03-configuration/README.md)** | المصادقة والأمان | [التكوين](docs/chapter-03-configuration/configuration.md) &#124; [المصادقة والأمان](docs/chapter-03-configuration/authsecurity.md) | 45-60 دقيقة | ⭐⭐ |
| **[الفصل 4: البنية التحتية](docs/chapter-04-infrastructure/README.md)** | البنية التحتية ككود والنشر | [دليل النشر](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [التجهيز](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 ساعة | ⭐⭐⭐ |
| **[الفصل 5: متعدد الوكلاء](docs/chapter-05-multi-agent/README.md)** | حلول وكلاء الذكاء الاصطناعي | [سيناريو التجزئة](examples/retail-scenario.md) &#124; [أنماط التنسيق](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 ساعات | ⭐⭐⭐⭐ |
| **[الفصل 6: ما قبل النشر](docs/chapter-06-pre-deployment/README.md)** | التخطيط والتحقق | [فحوصات ما قبل التشغيل](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [تخطيط السعة](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [اختيار SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [Application Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 ساعة | ⭐⭐ |
| **[الفصل 7: استكشاف الأخطاء وإصلاحها](docs/chapter-07-troubleshooting/README.md)** | التصحيح والإصلاح | [المشاكل الشائعة](docs/chapter-07-troubleshooting/common-issues.md) &#124; [دليل التصحيح](docs/chapter-07-troubleshooting/debugging.md) &#124; [استكشاف أخطاء الذكاء الاصطناعي](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 ساعة | ⭐⭐ |
| **[الفصل 8: الإنتاج](docs/chapter-08-production/README.md)** | أنماط المؤسسات | [ممارسات الإنتاج](docs/chapter-08-production/production-ai-practices.md) | 2-3 ساعات | ⭐⭐⭐⭐ |
| **[🎓 ورشة العمل](workshop/README.md)** | مختبر عملي | [مقدمة](workshop/docs/instructions/0-Introduction.md) &#124; [الاختيار](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [التحقق](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [تفكيك](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [التكوين](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [التخصيص](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [إزالة البنية التحتية](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [الخلاصة](workshop/docs/instructions/7-Wrap-up.md) | 3-4 ساعات | ⭐⭐ |

**المدة الإجمالية للدورة:** ~10-14 ساعة | **تدرّج المهارات:** مبتدئ → جاهز للإنتاج

---

## 📚 الفصول التعليمية

*اختر مسار التعلم بناءً على مستوى الخبرة والأهداف*

### 🚀 الفصل 1: الأساس والبداية السريعة
**المتطلبات المسبقة**: اشتراك Azure، معرفة أساسية بسطر الأوامر  
**المدة**: 30-45 دقيقة  
**التعقيد**: ⭐

#### ما ستتعلمه
- فهم أساسيات Azure Developer CLI
- تثبيت AZD على منصتك
- أول نشر ناجح لك

#### مصادر التعلم
- **🎯 ابدأ من هنا**: [ما هو Azure Developer CLI؟](#what-is-azure-developer-cli)
- **📖 النظرية**: [أساسيات AZD](docs/chapter-01-foundation/azd-basics.md) - المفاهيم الأساسية والمصطلحات
- **⚙️ الإعداد**: [التثبيت والإعداد](docs/chapter-01-foundation/installation.md) - أدلة مخصصة للمنصات
- **🛠️ عملي**: [مشروعك الأول](docs/chapter-01-foundation/first-project.md) - دليل خطوة بخطوة
- **📋 مرجع سريع**: [ورقة غش الأوامر](resources/cheat-sheet.md)

#### التمارين العملية
```bash
# فحص سريع للتثبيت
azd version

# انشر تطبيقك الأول
azd init --template todo-nodejs-mongo
azd up
```

**💡 نتيجة الفصل**: نشر تطبيق ويب بسيط إلى Azure بنجاح باستخدام AZD

**✅ معايير النجاح:**
```bash
# بعد إكمال الفصل 1، يجب أن تكون قادرًا على:
azd version              # يعرض الإصدار المثبت
azd init --template todo-nodejs-mongo  # يهيئ المشروع
azd up                  # ينشر إلى أزور
azd show                # يعرض رابط التطبيق الجاري تشغيله
# يفتح التطبيق في المتصفح ويعمل
azd down --force --purge  # ينظف الموارد
```

**📊 الوقت المستغرق:** 30-45 دقيقة  
**📈 مستوى المهارة بعد:** يمكنه نشر تطبيقات أساسية بشكل مستقل
**📈 مستوى المهارة بعد:** يمكنه نشر تطبيقات أساسية بشكل مستقل

---

### 🤖 الفصل 2: تطوير يضع الذكاء الاصطناعي في المقام الأول (موصى به لمطوري الذكاء الاصطناعي)
**المتطلبات المسبقة**: إكمال الفصل 1  
**المدة**: 1-2 ساعة  
**التعقيد**: ⭐⭐

#### ما ستتعلمه
- تكامل Microsoft Foundry مع AZD
- نشر تطبيقات مدعومة بالذكاء الاصطناعي
- فهم إعدادات خدمات الذكاء الاصطناعي

#### مصادر التعلم
- **🎯 ابدأ من هنا**: [تكامل Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 وكلاء الذكاء الاصطناعي**: [دليل وكلاء الذكاء الاصطناعي](docs/chapter-02-ai-development/agents.md) - نشر وكلاء ذكيين باستخدام AZD
- **📖 الأنماط**: [نشر نماذج الذكاء الاصطناعي](docs/chapter-02-ai-development/ai-model-deployment.md) - نشر وإدارة نماذج الذكاء الاصطناعي
- **🛠️ ورشة العمل**: [مختبر ورشة الذكاء الاصطناعي](docs/chapter-02-ai-development/ai-workshop-lab.md) - اجعل حلول الذكاء الاصطناعي جاهزة للـ AZD
- **🎥 دليل تفاعلي**: [مواد الورشة](workshop/README.md) - تعلم عبر المتصفح باستخدام MkDocs * بيئة DevContainer
- **📋 القوالب**: [قوالب Microsoft Foundry](#استكشاف-متعمق-قدرات-azd)
- **📝 أمثلة**: [أمثلة نشر AZD](examples/README.md)

#### التمارين العملية
```bash
# انشر أول تطبيق ذكاء اصطناعي لك
azd init --template azure-search-openai-demo
azd up

# جرّب قوالب ذكاء اصطناعي إضافية
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 نتيجة الفصل**: نشر وتكوين تطبيق دردشة مدعوم بالذكاء الاصطناعي مع قدرات RAG

**✅ معايير النجاح:**
```bash
# بعد الفصل الثاني، يجب أن تكون قادرًا على:
azd init --template azure-search-openai-demo
azd up
# اختبار واجهة الدردشة بالذكاء الاصطناعي
# اطرح أسئلة واحصل على إجابات مدعومة بالذكاء الاصطناعي مع المصادر
# التحقق من أن تكامل البحث يعمل
azd monitor  # التحقق من أن Application Insights يعرض بيانات القياس عن بُعد
azd down --force --purge
```

**📊 الوقت المستغرق:** 1-2 ساعة  
**📈 مستوى المهارة بعد:** يمكنه نشر وتكوين تطبيقات ذكاء اصطناعي جاهزة للإنتاج  
**💰 الوعي بالتكاليف:** فهم تكاليف التطوير ~$80-150/شهر، وتكاليف الإنتاج ~$300-3500/شهر

#### 💰 اعتبارات التكلفة لنشر الذكاء الاصطناعي

**بيئة التطوير (تقديريًا $80-150/شهر):**
- نماذج Microsoft Foundry (الدفع حسب الاستخدام): $0-50/شهر (اعتمادًا على استخدام التوكنات)
- AI Search (المستوى الأساسي): $75/شهر
- Container Apps (الاستهلاكي): $0-20/شهر
- التخزين (قياسي): $1-5/شهر

**بيئة الإنتاج (تقديريًا $300-3,500+/شهر):**
- نماذج Microsoft Foundry (PTU لأداء ثابت): $3,000+/شهر OR الدفع حسب الاستخدام مع حجم كبير
- AI Search (المستوى القياسي): $250/شهر
- Container Apps (مخصص): $50-100/شهر
- Application Insights: $5-50/شهر
- التخزين (متميز): $10-50/شهر

**💡 نصائح تحسين التكلفة:**
- استخدم **الطبقة المجانية** من نماذج Microsoft Foundry للتعلّم (يشمل Azure OpenAI 50,000 توكن/شهر)
- شغّل `azd down` لإلغاء تخصيص الموارد عندما لا تكون في طور التطوير النشط
- ابدأ بنظام الفوترة القائم على الاستهلاك، وارقِ إلى PTU فقط للإنتاج
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
**المتطلبات المسبقة**: إكمال الفصل 1  
**المدة**: 45-60 دقيقة  
**التعقيد**: ⭐⭐

#### ما ستتعلمه
- تكوين وإدارة البيئات
- أفضل ممارسات المصادقة والأمان
- تسمية وتنظيم الموارد

#### مصادر التعلم
- **📖 التكوين**: [دليل التكوين](docs/chapter-03-configuration/configuration.md) - إعداد البيئة
- **🔐 الأمان**: [أنماط المصادقة والهوية المُدارة](docs/chapter-03-configuration/authsecurity.md) - أنماط المصادقة
- **📝 أمثلة**: [مثال تطبيق قاعدة بيانات](examples/database-app/README.md) - أمثلة قواعد بيانات AZD

#### التمارين العملية
- تكوين بيئات متعددة (dev، staging، prod)
- إعداد مصادقة الهوية المُدارة
- تنفيذ تكوينات خاصة بكل بيئة

**💡 نتيجة الفصل**: إدارة بيئات متعددة مع المصادقة والأمان المناسبين

---

### 🏗️ الفصل 4: البنية التحتية ككود والنشر
**المتطلبات المسبقة**: إكمال الفصول 1-3  
**المدة**: 1-1.5 ساعة  
**التعقيد**: ⭐⭐⭐

#### ما ستتعلمه
- أنماط نشر متقدمة
- البنية التحتية ككود باستخدام Bicep
- استراتيجيات تجهيز الموارد

#### مصادر التعلم
- **📖 النشر**: [دليل النشر](docs/chapter-04-infrastructure/deployment-guide.md) - سير عمل كامل
- **🏗️ التجهيز**: [تجهيز الموارد](docs/chapter-04-infrastructure/provisioning.md) - إدارة موارد Azure
- **📝 أمثلة**: [مثال تطبيق الحاويات](../../examples/container-app) - نشر باستخدام الحاويات

#### التمارين العملية
- إنشاء قوالب Bicep مخصصة
- نشر تطبيقات متعددة الخدمات
- تنفيذ استراتيجيات النشر الأزرق-الأخضر

**💡 نتيجة الفصل**: نشر تطبيقات متعددة الخدمات ومعقدة باستخدام قوالب بنية تحتية مخصصة

---

### 🎯 الفصل 5: حلول الذكاء الاصطناعي متعددة الوكلاء (متقدم)
**المتطلبات المسبقة**: إكمال الفصول 1-2  
**المدة**: 2-3 ساعات  
**التعقيد**: ⭐⭐⭐⭐

#### ما ستتعلمه
- أنماط هندسة متعددة الوكلاء
- تنسيق وأوركسترة الوكلاء
- نشر حلول ذكاء اصطناعي جاهزة للإنتاج

#### مصادر التعلم
- **🤖 المشروع المميز**: [حل التجزئة متعدد الوكلاء](examples/retail-scenario.md) - تنفيذ كامل
- **🛠️ قوالب ARM**: [حزمة قالب ARM](../../examples/retail-multiagent-arm-template) - نشر بنقرة واحدة
- **📖 المعمارية**: [أنماط تنسيق متعدد الوكلاء](docs/chapter-06-pre-deployment/coordination-patterns.md) - أنماط

#### التمارين العملية
```bash
# نشر الحل الكامل متعدد الوكلاء لتجارة التجزئة
cd examples/retail-multiagent-arm-template
./deploy.sh

# استكشاف تكوينات الوكلاء
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 نتيجة الفصل**: نشر وإدارة حل ذكاء اصطناعي متعدد الوكلاء جاهز للإنتاج يتضمن وكلاء العملاء والمخزون

---

### 🔍 الفصل 6: التحقق والتخطيط ما قبل النشر
**المتطلبات المسبقة**: إكمال الفصل 4  
**المدة**: 1 ساعة  
**التعقيد**: ⭐⭐

#### ما ستتعلمه
- تخطيط السعة والتحقق من الموارد
- استراتيجيات اختيار SKU
- فحوصات ما قبل التشغيل والأتمتة

#### مصادر التعلم
- **📊 التخطيط**: [تخطيط السعة](docs/chapter-06-pre-deployment/capacity-planning.md) - التحقق من الموارد
- **💰 الاختيار**: [اختيار SKU](docs/chapter-06-pre-deployment/sku-selection.md) - خيارات فعّالة من حيث التكلفة
- **✅ التحقق**: [فحوصات ما قبل التشغيل](docs/chapter-06-pre-deployment/preflight-checks.md) - سكربتات مؤتمتة

#### التمارين العملية
- تشغيل سكربتات التحقق من السعة
- تحسين اختيار SKU من حيث التكلفة
- تنفيذ فحوصات ما قبل النشر المؤتمتة

**💡 نتيجة الفصل**: التحقق وتحسين عمليات النشر قبل التنفيذ

---

### 🚨 الفصل 7: استكشاف الأخطاء وإصلاحها وتصحيحها
**المتطلبات المسبقة**: إكمال أي فصل من فصول النشر  
**المدة**: 1-1.5 ساعة  
**التعقيد**: ⭐⭐

#### ما ستتعلمه
- مناهج منهجية لتصحيح الأخطاء
- المشاكل الشائعة والحلول
- استكشاف مشكلات خاصة بالذكاء الاصطناعي

#### مصادر التعلم
- **🔧 المشاكل الشائعة**: [المشاكل الشائعة](docs/chapter-07-troubleshooting/common-issues.md) - الأسئلة المتكررة والحلول
- **🕵️ التصحيح**: [دليل التصحيح](docs/chapter-07-troubleshooting/debugging.md) - استراتيجيات خطوة بخطوة
- **🤖 قضايا الذكاء الاصطناعي**: [استكشاف أخطاء الذكاء الاصطناعي](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - مشاكل خدمات الذكاء الاصطناعي

#### التمارين العملية
- تشخيص فشل النشر
- حل مشاكل المصادقة
- تصحيح اتصال خدمات الذكاء الاصطناعي

**💡 نتيجة الفصل**: تشخيص وحل مشكلات النشر الشائعة بشكل مستقل

---

### 🏢 الفصل 8: الإنتاج وأنماط المؤسسات
**المتطلبات المسبقة**: إكمال الفصول 1-4  
**المدة**: 2-3 ساعات  
**التعقيد**: ⭐⭐⭐⭐

#### مصادر التعلم
- **🏭 الإنتاج**: [أفضل ممارسات الذكاء الاصطناعي للإنتاج](docs/chapter-08-production/production-ai-practices.md) - أنماط المؤسسات
- **📝 أمثلة**: [مثال الخدمات المصغرة](../../examples/microservices) - هياكل معمارية معقدة
- **📊 المراقبة**: [تكامل Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - المراقبة

#### التمارين العملية
- نفّذ أنماط الأمان للمؤسسات
- قم بإعداد مراقبة شاملة
- انشر إلى الإنتاج مع حوكمة مناسبة

**💡 ناتج الفصل**: نشر تطبيقات جاهزة للمؤسسات مع كامل قدرات الإنتاج

---

## 🎓 نظرة عامة على ورشة العمل: تجربة تعلم عملية

> **⚠️ حالة ورشة العمل: قيد التطوير**  
> مواد ورشة العمل قيد الإعداد والتنقيح حاليًا. الوحدات الأساسية تعمل، لكن بعض الأقسام المتقدمة غير مكتملة. نحن نعمل بنشاط على إكمال كل المحتوى. [تتبع التقدم →](workshop/README.md)

### مواد ورشة العمل التفاعلية
**تعلّم عملي شامل باستخدام أدوات متصفح وتدريبات موجهة**

توفر مواد ورشة العمل تجربة تعلم تفاعلية ومنظمة تكمل المنهج المبني على الفصول أعلاه. تم تصميم الورشة للتعلم الذاتي والجلوس بقيادة مدرب على حد سواء.

#### 🛠️ ميزات ورشة العمل
- **واجهة عبر المتصفح**: ورشة عمل كاملة تعمل بواسطة MkDocs مع ميزات البحث والنسخ والثيم
- **تكامل GitHub Codespaces**: إعداد بيئة التطوير بنقرة واحدة
- **مسار تعلم منظم**: تمارين موجهة مكونة من 8 وحدات (3-4 ساعات إجمالًا)
- **منهجية تدريجية**: المقدمة → الاختيار → التحقق → التفكيك → التكوين → التخصيص → الإزالة → الخلاصة
- **بيئة DevContainer تفاعلية**: أدوات واعتمادات مُعدة مسبقًا

#### 📚 هيكل وحدات ورشة العمل
تتبع الورشة **منهجية تدريجية مكونة من 8 وحدات** تأخذك من الاكتشاف إلى إتقان النشر:

| الوحدة | الموضوع | ما الذي ستفعله | المدة |
|--------|---------|----------------|----------|
| **0. المقدمة** | نظرة عامة على الورشة | فهم أهداف التعلم، المتطلبات المسبقة، وهيكل الورشة | 15 دقيقة |
| **1. الاختيار** | استكشاف القوالب | استعرض قوالب AZD واختر قالب الذكاء الاصطناعي المناسب للسيناريو الخاص بك | 20 دقيقة |
| **2. التحقق** | النشر والتحقق | انشر القالب باستخدام `azd up` وتحقق من عمل البنية التحتية | 30 دقيقة |
| **3. التفكيك** | فهم الهيكل | استخدم GitHub Copilot لاستكشاف بنية القالب وملفات Bicep وتنظيم الشيفرة | 30 دقيقة |
| **4. التكوين** | الغوص في azure.yaml | اتقن تكوين `azure.yaml`، حلقات دورة الحياة، ومتغيرات البيئة | 30 دقيقة |
| **5. التخصيص** | اجعلها لك | فعّل AI Search، التتبع، التقييم، وقم بتخصيصها للسيناريو الخاص بك | 45 دقيقة |
| **6. الإزالة** | التنظيف | قم بإخراج الموارد بأمان باستخدام `azd down --purge` | 15 دقيقة |
| **7. الختام** | الخطوات التالية | استعرض الإنجازات، المفاهيم الرئيسية، وواصل رحلة تعلمك | 15 دقيقة |

**سير الورشة:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 البدء في ورشة العمل
```bash
# الخيار 1: GitHub Codespaces (موصى به)
# انقر على "Code" → "Create codespace on main" في المستودع

# الخيار 2: التطوير المحلي
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# اتبع تعليمات الإعداد في workshop/README.md
```

#### 🎯 نتائج تعلم ورشة العمل
من خلال إكمال الورشة، سيقوم المشاركون بـ:
- **نشر تطبيقات ذكاء اصطناعي للإنتاج**: استخدم AZD مع خدمات Microsoft Foundry
- **إتقان معماريات الوكلاء المتعددين**: تنفيذ حلول منسقة لوكلاء الذكاء الاصطناعي
- **تنفيذ أفضل ممارسات الأمان**: تكوين المصادقة والتحكم في الوصول
- **التحسين من أجل القابلية للتوسع**: تصميم نشرات فعالة من حيث التكلفة وعالية الأداء
- **استكشاف أخطاء النشر وحلها**: حل المشكلات الشائعة بشكل مستقل

#### 📖 موارد الورشة
- **🎥 دليل تفاعلي**: [مواد الورشة](workshop/README.md) - بيئة تعلم عبر المتصفح
- **📋 تعليمات وحدة بوحدة**:
  - [0. المقدمة](workshop/docs/instructions/0-Introduction.md) - نظرة عامة على الورشة والأهداف
  - [1. الاختيار](workshop/docs/instructions/1-Select-AI-Template.md) - ابحث واختر قوالب الذكاء الاصطناعي
  - [2. التحقق](workshop/docs/instructions/2-Validate-AI-Template.md) - انشر وتحقق من القوالب
  - [3. التفكيك](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - استكشف بنية القالب
  - [4. التكوين](workshop/docs/instructions/4-Configure-AI-Template.md) - إتقان azure.yaml
  - [5. التخصيص](workshop/docs/instructions/5-Customize-AI-Template.md) - خصص للسيناريو الخاص بك
  - [6. الإزالة](workshop/docs/instructions/6-Teardown-Infrastructure.md) - تنظيف الموارد
  - [7. الختام](workshop/docs/instructions/7-Wrap-up.md) - المراجعة والخطوات التالية
- **🛠️ مختبر ورشة الذكاء الاصطناعي**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - تمارين مركزة على الذكاء الاصطناعي
- **💡 بداية سريعة**: [دليل إعداد الورشة](workshop/README.md#quick-start) - تكوين البيئة

**مثالي لـ**: التدريب المؤسسي، الدورات الجامعية، التعلم الذاتي، ومعسكرات تدريب المطورين.

---

## 📖 استكشاف متعمق: قدرات AZD

بعيدًا عن الأساسيات، يوفر AZD ميزات قوية لنشر الإنتاج:

- **عمليات النشر القائمة على القوالب** - استخدم قوالب مُعدة مسبقًا لأنماط التطبيقات الشائعة
- **البنية التحتية ككود** - إدارة موارد Azure باستخدام Bicep أو Terraform  
- **سير عمل متكامل** - توفير ونشر ومراقبة التطبيقات بسلاسة
- **مصمم للمطورين** - محسن لإنتاجية المطور وتجربته

### **AZD + Microsoft Foundry: مثالي لنشر الذكاء الاصطناعي**

**لماذا AZD لحلول الذكاء الاصطناعي؟** يعالج AZD التحديات الرئيسية التي يواجهها مطورو الذكاء الاصطناعي:

- **قوالب جاهزة للذكاء الاصطناعي** - قوالب مُعدة مسبقًا لنماذج Microsoft Foundry، Cognitive Services، وأحمال التعلم الآلي
- **نشرات ذكية آمنة** - أنماط أمان مدمجة لخدمات الذكاء الاصطناعي، مفاتيح API، ونقاط نهاية النماذج  
- **أنماط ذكاء اصطناعي للإنتاج** - أفضل الممارسات لنشر تطبيقات ذكاء اصطناعي قابلة للتوسع وفعالة من حيث التكلفة
- **سير عمل الذكاء الاصطناعي من البداية للنهاية** - من تطوير النموذج إلى نشر الإنتاج مع مراقبة مناسبة
- **تحسين التكلفة** - تخصيص موارد ذكي واستراتيجيات تحجيم لأحمال الذكاء الاصطناعي
- **تكامل Microsoft Foundry** - اتصال سلس إلى كتالوج نماذج Microsoft Foundry ونقاط النهاية

---

## 🎯 مكتبة القوالب والأمثلة

### مميز: قوالب Microsoft Foundry
**ابدأ من هنا إذا كنت تنشر تطبيقات الذكاء الاصطناعي!**

> **ملاحظة:** تبيّن هذه القوالب أنماطًا مختلفة للذكاء الاصطناعي. بعضها عينات Azure خارجية، والبعض الآخر تنفيذات محلية.

| القالب | الفصل | التعقيد | الخدمات | النوع |
|----------|---------|------------|----------|------|
| [**البدء مع دردشة الذكاء الاصطناعي**](https://github.com/Azure-Samples/get-started-with-ai-chat) | الفصل 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | خارجي |
| [**البدء مع وكلاء الذكاء الاصطناعي**](https://github.com/Azure-Samples/get-started-with-ai-agents) | الفصل 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| خارجي |
| [**عرض Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | الفصل 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | خارجي |
| [**بدء سريع لتطبيق دردشة OpenAI**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | الفصل 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | خارجي |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | الفصل 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | خارجي |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | الفصل 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | خارجي |
| [**حل عدة وكلاء لقطاع التجزئة**](examples/retail-scenario.md) | الفصل 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **محلي** |

### مميز: سيناريوهات تعلم كاملة
**قوالب تطبيقات جاهزة للإنتاج مرتبطة بفصول التعلم**

| القالب | فصل التعلم | التعقيد | ما ستتعلم |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | الفصل 2 | ⭐ | أنماط نشر ذكاء اصطناعي أساسية |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | الفصل 2 | ⭐⭐ | تنفيذ RAG باستخدام Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | الفصل 4 | ⭐⭐ | تكامل Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | الفصل 5 | ⭐⭐⭐ | إطار الوكلاء واستدعاء الدوال |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | الفصل 8 | ⭐⭐⭐ | تنسيق ذكاء اصطناعي للمؤسسات |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | الفصل 5 | ⭐⭐⭐⭐ | معماريات متعددة الوكلاء مع وكلاء العميل والمخزون |

### التعلم من خلال نوع المثال

> **📌 أمثلة محلية مقابل أمثلة خارجية:**  
> **الأمثلة المحلية** (في هذا المستودع) = جاهزة للاستخدام فورًا  
> **الأمثلة الخارجية** (Azure Samples) = استنسخ من المستودعات المرتبطة

#### أمثلة محلية (جاهزة للاستخدام)
- [**حل عدة وكلاء لقطاع التجزئة**](examples/retail-scenario.md) - تنفيذ كامل جاهز للإنتاج مع قوالب ARM
  - بنية عدة وكلاء (وكلاء العميل + المخزون)
  - مراقبة وتقييم شاملة
  - نشر بنقرة واحدة عبر قالب ARM

#### أمثلة محلية - تطبيقات الحاويات (الفصول 2-5)
**أمثلة نشر حاويات شاملة في هذا المستودع:**
- [**أمثلة تطبيقات الحاويات**](examples/container-app/README.md) - دليل كامل لنشر التطبيقات الحاوية
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - واجهة REST أساسية مع خاصية التدرج إلى الصفر
  - [Microservices Architecture](../../examples/container-app/microservices) - نشر متعدد الخدمات جاهز للإنتاج
  - بدء سريع، إنتاج، وأنماط نشر متقدمة
  - إرشادات للمراقبة، الأمان، وتحسين التكلفة

#### أمثلة خارجية - تطبيقات بسيطة (الفصول 1-2)
**استنسخ هذه المستودعات من Azure Samples للبدء:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - أنماط نشر أساسية
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - نشر محتوى ثابت
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - نشر واجهة REST

#### أمثلة خارجية - تكامل قواعد البيانات (الفصل 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - أنماط اتصال قواعد البيانات
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - سير عمل بيانات بدون خادم

#### أمثلة خارجية - أنماط متقدمة (الفصول 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - معماريات متعددة الخدمات
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - المعالجة الخلفية  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - أنماط تعلم آلي جاهزة للإنتاج

### مجموعات القوالب الخارجية
- [**معرض قوالب AZD الرسمي**](https://azure.github.io/awesome-azd/) - مجموعة منسقة من القوالب الرسمية والمجتمعية
- [**قوالب Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - توثيق قوالب Microsoft Learn
- [**دليل الأمثلة**](examples/README.md) - أمثلة تعلم محلية مع شروحات مفصّلة

---

## 📚 مصادر ومرجعيات التعلم

### مراجع سريعة
- [**ورقة غش للأوامر**](resources/cheat-sheet.md) - أوامر azd الأساسية منظمة حسب الفصل
- [**مسرد المصطلحات**](resources/glossary.md) - مصطلحات Azure و azd  
- [**الأسئلة الشائعة**](resources/faq.md) - أسئلة شائعة منظمة حسب فصل التعلم
- [**دليل الدراسة**](resources/study-guide.md) - تمارين تدريبية شاملة

### ورش العمل العملية
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - اجعل حلول الذكاء الاصطناعي قابلة للنشر عبر AZD (2-3 ساعات)
- [**ورشة عمل تفاعلية**](workshop/README.md) - تمارين مكونة من 8 وحدات موجهة مع MkDocs و GitHub Codespaces
  - تتبع: المقدمة → الاختيار → التحقق → التفكيك → التكوين → التخصيص → الإزالة → الختام

### مصادر تعلم خارجية
- [توثيق Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [مركز هندسة Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [حاسبة تسعير Azure](https://azure.microsoft.com/pricing/calculator/)
- [حالة Azure](https://status.azure.com/)

### مهارات وكيل الذكاء الاصطناعي لمحررك
- [**مهارات Microsoft Azure على skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 مهارة وكيل مفتوحة لـ Azure AI وFoundry والنشر والتشخيص وتحسين التكلفة والمزيد. قم بتثبيتها في GitHub Copilot أو Cursor أو Claude Code أو أي وكيل مدعوم:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 دليل استكشاف الأخطاء وإصلاحها السريع

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

# أو استخدم SKUs أصغر أثناء التطوير
# حرّر infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

```bash
# نظف وأعد المحاولة
azd down --force --purge
azd up

# فقط أصلح البنية التحتية
azd provision

# تحقق من الحالة التفصيلية
azd show

# تحقق من السجلات في Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# أعد المصادقة
az logout
az login

azd auth logout
azd auth login

# تحقق من المصادقة
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD ينشئ أسماء فريدة، ولكن إذا حدث تعارض:
azd down --force --purge

# ثم أعد المحاولة باستخدام بيئة جديدة
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ بطء نشر القالب بشكل مفرط</strong></summary>

**أوقات الانتظار المعتادة:**
- تطبيق ويب بسيط: 5-10 دقائق
- تطبيق مع قاعدة بيانات: 10-15 دقائق
- تطبيقات الذكاء الاصطناعي: 15-25 دقائق (توفير OpenAI بطيء)

```bash
# تحقق من التقدم
azd show

# إذا كنت عالقًا لأكثر من ٣٠ دقيقة، تحقق من بوابة Azure:
azd monitor
# ابحث عن عمليات نشر فاشلة
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# تحقق من دور Azure الخاص بك
az role assignment list --assignee $(az account show --query user.name -o tsv)

# تحتاج على الأقل إلى دور «Contributor»
# اطلب من مسؤول Azure منح:
# - Contributor (للموارد)
# - User Access Administrator (لتعيينات الأدوار)
```
</details>

<details>
<summary><strong>❌ لا يمكن العثور على عنوان URL للتطبيق المنشور</strong></summary>

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

### 📚 موارد كاملة لاستكشاف الأخطاء وإصلاحها

- **دليل المشكلات الشائعة:** [حلول مفصلة](docs/chapter-07-troubleshooting/common-issues.md)
- **قضايا خاصة بالذكاء الاصطناعي:** [استكشاف أخطاء الذكاء الاصطناعي وإصلاحها](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **دليل التصحيح:** [تصحيح خطوة بخطوة](docs/chapter-07-troubleshooting/debugging.md)
- **اطلب المساعدة:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 إتمام الدورة والشهادات

### تتبع التقدم
تتبع تقدم تعلمك خلال كل فصل:

- [ ] **الفصل 1**: الأساسيات والبدء السريع ✅
- [ ] **الفصل 2**: تطوير يركز على الذكاء الاصطناعي ✅  
- [ ] **الفصل 3**: التكوين والمصادقة ✅
- [ ] **الفصل 4**: البنية التحتية ككود والنشر ✅
- [ ] **الفصل 5**: حلول الذكاء الاصطناعي متعددة الوكلاء ✅
- [ ] **الفصل 6**: التحقق والتخطيط قبل النشر ✅
- [ ] **الفصل 7**: استكشاف الأخطاء وإصلاحها والتصحيح ✅
- [ ] **الفصل 8**: أنماط الإنتاج والمؤسسات ✅

### التحقق من التعلم
بعد إكمال كل فصل، تحقق من معرفتك عن طريق:
1. **التمرين العملي**: أكمل التمرين العملي لنشر الفصل
2. **التحقق من المعرفة**: راجع قسم الأسئلة الشائعة للفصل
3. **نقاش المجتمع**: شارك تجربتك في Azure Discord
4. **الفصل التالي**: انتقل إلى مستوى التعقيد التالي

### فوائد إتمام الدورة
بعد إكمال جميع الفصول، ستحصل على:
- **خبرة إنتاجية**: نشرت تطبيقات ذكاء اصطناعي حقيقية على Azure
- **مهارات مهنية**: قدرات نشر جاهزة للمؤسسات  
- **الاعتراف المجتمعي**: عضو نشط في مجتمع مطوري Azure
- **تقدم مهني**: خبرة مطلوبة في AZD ونشر الذكاء الاصطناعي

---

## 🤝 المجتمع والدعم

### الحصول على المساعدة والدعم
- **المشكلات التقنية**: [الإبلاغ عن أخطاء وطلب ميزات](https://github.com/microsoft/azd-for-beginners/issues)
- **أسئلة التعلم**: [مجتمع Microsoft Azure على Discord](https://discord.gg/microsoft-azure) و [![Microsoft Foundry على Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **مساعدة خاصة بالذكاء الاصطناعي**: انضم إلى [![Microsoft Foundry على Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **التوثيق**: [التوثيق الرسمي لـ Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### رؤى المجتمع من Microsoft Foundry على Discord

**نتائج الاستطلاع الأخيرة من قناة #Azure:**
- **45%** من المطورين يريدون استخدام AZD لأعباء عمل الذكاء الاصطناعي
- **أهم التحديات**: نشر متعدد الخدمات، إدارة بيانات الاعتماد، الجاهزية للإنتاج  
- **الأكثر طلبًا**: قوالب خاصة بالذكاء الاصطناعي، أدلة استكشاف الأخطاء، أفضل الممارسات

**انضم إلى مجتمعنا لـ:**
- شارك تجاربك مع AZD + الذكاء الاصطناعي واحصل على المساعدة
- الوصول إلى معاينات مبكرة للقوالب الجديدة الخاصة بالذكاء الاصطناعي
- المساهمة في أفضل ممارسات نشر الذكاء الاصطناعي
- التأثير على تطوير ميزات AI + AZD المستقبلية

### المساهمة في الدورة
نرحب بالمساهمات! يرجى قراءة [دليل المساهمة](CONTRIBUTING.md) للحصول على التفاصيل حول:
- **تحسين المحتوى**: تحسين الفصول والأمثلة الحالية
- **أمثلة جديدة**: إضافة سيناريوهات وقوالب من العالم الحقيقي  
- **الترجمة**: المساعدة في الحفاظ على الدعم متعدد اللغات
- **تقارير الأخطاء**: تحسين الدقة والوضوح
- **معايير المجتمع**: اتبع إرشادات مجتمعنا الشاملة

---

## 📄 معلومات الدورة

### الترخيص
هذا المشروع مرخّص بموجب رخصة MIT - راجع ملف [LICENSE](../../LICENSE) للحصول على التفاصيل.

### موارد تعلم من Microsoft ذات صلة

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
[![وكلاء AI للمبتدئين](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### سلسلة الذكاء الاصطناعي التوليدي
[![الذكاء التوليدي للمبتدئين](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![الذكاء التوليدي (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![الذكاء التوليدي (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![الذكاء التوليدي (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### التعلم الأساسي
[![تعلم الآلة للمبتدئين](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![علم البيانات للمبتدئين](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![الذكاء الاصطناعي للمبتدئين](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![الأمن السيبراني للمبتدئين](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![تطوير الويب للمبتدئين](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![الإنترنت للأشياء للمبتدئين](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![تطوير XR للمبتدئين](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### سلسلة Copilot
[![Copilot للبرمجة الزوجية بالذكاء الاصطناعي](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot لـ C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![مغامرة Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ التنقل في الدورة

**🚀 هل أنت مستعد للبدء في التعلم؟**

**للمبتدئين**: ابدأ بـ [الفصل 1: الأساسيات والبدء السريع](#-chapter-1-foundation--quick-start)  
**مطورو الذكاء الاصطناعي**: انتقل إلى [الفصل 2: تطوير يركز على الذكاء الاصطناعي](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**للمطورين ذوي الخبرة**: ابدأ بـ [الفصل 3: التكوين والمصادقة](#️-chapter-3-configuration--authentication)

**الخطوات التالية**: [ابدأ الفصل 1 - أساسيات AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**إخلاء المسؤولية**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة الآلية [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى ملاحظة أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الموثوق. للمعلومات الحساسة أو الحرجة، يوصى بالاستعانة بترجمة بشرية احترافية. نحن غير مسؤولين عن أي سوء فهم أو تفسيرات خاطئة ناتجة عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->