# AZD For Beginners: A Structured Learning Journey

![AZD للمبتدئين](../../translated_images/ar/azdbeginners.5527441dd9f74068.webp) 

[![المراقبون على GitHub](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![التفرعات على GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![النجوم على GitHub](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Discord الخاص بـ Azure](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Discord الخاص بـ Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### الترجمات الآلية (دائمًا محدثة)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[العربية](./README.md) | [البنغالية](../bn/README.md) | [البلغارية](../bg/README.md) | [البورمية (ميانمار)](../my/README.md) | [الصينية (مبسطة)](../zh-CN/README.md) | [الصينية (تقليدية، هونغ كونغ)](../zh-HK/README.md) | [الصينية (تقليدية، ماكاو)](../zh-MO/README.md) | [الصينية (تقليدية، تايوان)](../zh-TW/README.md) | [الكرواتية](../hr/README.md) | [التشيكية](../cs/README.md) | [الدنماركية](../da/README.md) | [الهولندية](../nl/README.md) | [الإستونية](../et/README.md) | [الفنلندية](../fi/README.md) | [الفرنسية](../fr/README.md) | [الألمانية](../de/README.md) | [اليونانية](../el/README.md) | [العبرية](../he/README.md) | [الهندية](../hi/README.md) | [المجرية](../hu/README.md) | [الإندونيسية](../id/README.md) | [الإيطالية](../it/README.md) | [اليابانية](../ja/README.md) | [الكنادية](../kn/README.md) | [الكورية](../ko/README.md) | [الليتوانية](../lt/README.md) | [الماليزية](../ms/README.md) | [المالايالامية](../ml/README.md) | [الماراثية](../mr/README.md) | [النيبالية](../ne/README.md) | [بيجين نيجيري](../pcm/README.md) | [النرويجية](../no/README.md) | [الفارسية (فارسي)](../fa/README.md) | [البولندية](../pl/README.md) | [البرتغالية (البرازيل)](../pt-BR/README.md) | [البرتغالية (البرتغال)](../pt-PT/README.md) | [البنجابية (غورموخي)](../pa/README.md) | [الرومانية](../ro/README.md) | [الروسية](../ru/README.md) | [الصربية (السيريلية)](../sr/README.md) | [السلوفاكية](../sk/README.md) | [السلوفينية](../sl/README.md) | [الإسبانية](../es/README.md) | [السواحيلية](../sw/README.md) | [السويدية](../sv/README.md) | [التاغالوغ (الفلبينية)](../tl/README.md) | [التاميلية](../ta/README.md) | [التيلجو](../te/README.md) | [التايلاندية](../th/README.md) | [التركية](../tr/README.md) | [الأوكرانية](../uk/README.md) | [الأردية](../ur/README.md) | [الفيتنامية](../vi/README.md)

> **تفضل الاستنساخ محليًا؟**
>
> هذا المستودع يتضمن أكثر من 50 ترجمة للغات مما يزيد حجم التنزيل بشكل كبير. للاستنساخ بدون الترجمات، استخدم السحب الانتقائي (sparse checkout):
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

Azure Developer CLI توسع ليشمل أكثر من تطبيقات الويب التقليدية وواجهات برمجة التطبيقات. اليوم، أصبح azd الأداة الوحيدة لنشر أي تطبيق إلى Azure — بما في ذلك التطبيقات المدعومة بالذكاء الاصطناعي والوكيلات الذكية.

ماذا يعني هذا بالنسبة لك:

- **عملاء الذكاء الاصطناعي أصبحوا الآن أحمال عمل من الدرجة الأولى في azd.** يمكنك تهيئة مشاريع وكلاء الذكاء الاصطناعي ونشرها وإدارتها باستخدام نفس سير العمل `azd init` → `azd up` الذي تعرفه بالفعل.
- **تكامل Microsoft Foundry** يجلب نشر النماذج، واستضافة الوكلاء، وتكوين خدمات الذكاء الاصطناعي مباشرة إلى نظام قوالب azd.
- **لم يتغير سير العمل الأساسي.** سواء كنت تنشر تطبيق مهام، خدمة مصغرة، أو حل ذكاء اصطناعي متعدد الوكلاء، الأوامر هي نفسها.

إذا استخدمت azd من قبل، فدعم الذكاء الاصطناعي هو امتداد طبيعي — ليس أداة منفصلة أو مسار متقدم. إذا كنت تبدأ من جديد، ستتعلم سير عمل واحد يعمل مع كل شيء.

---

## 🚀 ما هو Azure Developer CLI (azd)؟

**Azure Developer CLI (azd)** هو أداة سطر أوامر صديقة للمطورين تجعل من السهل نشر التطبيقات إلى Azure. بدلاً من إنشاء وربط عشرات موارد Azure يدويًا، يمكنك نشر تطبيقات كاملة بأمر واحد.

### سحر `azd up`

```bash
# هذا الأمر الواحد يفعل كل شيء:
# ✅ ينشئ جميع موارد أزور
# ✅ يهيئ الشبكات والأمان
# ✅ يبني رمز تطبيقك
# ✅ ينشر إلى أزور
# ✅ يعطيك رابطًا يعمل
azd up
```

**هذا كل شيء!** لا نقرات في بوابة Azure، لا قوالب ARM معقدة لتتعلمها أولاً، ولا تكوين يدوي — فقط تطبيقات تعمل على Azure.

---

## ❓ Azure Developer CLI مقابل Azure CLI: ما الفرق؟

هذا هو السؤال الأكثر شيوعًا الذي يطرحه المبتدئون. إليك الإجابة البسيطة:

| الميزة | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **الغرض** | إدارة موارد Azure الفردية | نشر تطبيقات كاملة |
| **العقلية** | تركيز على البنية التحتية | تركيز على التطبيقات |
| **مثال** | `az webapp create --name myapp...` | `azd up` |
| **منحنى التعلم** | يجب أن تعرف خدمات Azure | فقط تعرف تطبيقك |
| **الأفضل لـ** | DevOps، البنية التحتية | المطورون، النماذج الأولية |

### تشبيه بسيط

- **Azure CLI** يشبه امتلاك كل الأدوات لبناء منزل - مطارق، مناشير، مسامير. يمكنك بناء أي شيء، لكنك تحتاج إلى معرفة البناء.
- **Azure Developer CLI** يشبه توظيف مقاول - تصف ما تريد، وهم يتولون البناء.

### متى تستخدم كل منهما

| السيناريو | استخدم هذا |
|----------|----------|
| "أريد نشر تطبيق الويب بسرعة" | `azd up` |
| "أحتاج إلى إنشاء حساب تخزين فقط" | `az storage account create` |
| "أبني تطبيق ذكاء اصطناعي كامل" | `azd init --template azure-search-openai-demo` |
| "أحتاج إلى تصحيح مورد Azure محدد" | `az resource show` |
| "أريد نشر جاهز للإنتاج في دقائق" | `azd up --environment production` |

### يعملان معًا!

AZD يستخدم Azure CLI تحت الواجهة. يمكنك استخدام كلاهما:
```bash
# نشر تطبيقك باستخدام AZD
azd up

# ثم ضبط الموارد المحددة بدقة باستخدام Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 ابحث عن القوالب في Awesome AZD

لا تبدأ من الصفر! **Awesome AZD** هي مجموعة المجتمع من القوالب الجاهزة للنشر:

| المورد | الوصف |
|----------|-------------|
| 🔗 [**معرض Awesome AZD**](https://azure.github.io/awesome-azd/) | تصفح أكثر من 200 قالب مع نشر بنقرة واحدة |
| 🔗 [**إرسال قالب**](https://github.com/Azure/awesome-azd/issues) | ساهم بقالبك للمجتمع |
| 🔗 [**مستودع GitHub**](https://github.com/Azure/awesome-azd) | قم بتمييزه واستكشف المصدر |

### قوالب الذكاء الاصطناعي الشائعة من Awesome AZD

```bash
# دردشة RAG مع نماذج Microsoft Foundry + البحث بالذكاء الاصطناعي
azd init --template azure-search-openai-demo

# تطبيق دردشة ذكي سريع
azd init --template openai-chat-app-quickstart

# وكلاء الذكاء الاصطناعي مع وكلاء Foundry
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

### الخطوة 3: نشر تطبيقك الأول

```bash
# التهيئة من قالب
azd init --template todo-nodejs-mongo

# النشر إلى أزور (ينشئ كل شيء!)
azd up
```

**🎉 هذا كل شيء!** تطبيقك الآن متاح على Azure.

### التنظيف (لا تنسَ!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 كيفية استخدام هذه الدورة

تم تصميم هذه الدورة للتعلم التدريجي - ابدأ من حيث تشعر بالراحة وتدرج إلى الأعلى:

| خبرتك | ابدأ من هنا |
|-----------------|------------|
| **جديد كليًا على Azure** | [الفصل 1: الأساس](../..) |
| **تعرف على Azure، جديد على AZD** | [الفصل 1: الأساس](../..) |
| **تريد نشر تطبيقات الذكاء الاصطناعي** | [الفصل 2: تطوير يركز على الذكاء الاصطناعي](../..) |
| **تريد ممارسة عملية** | [🎓 ورشة عمل تفاعلية](workshop/README.md) - مختبر موجه لمدة 3-4 ساعات |
| **تحتاج أنماط جاهزة للإنتاج** | [الفصل 8: الإنتاج والمؤسسات](../..) |

### الإعداد السريع

1. **افتح نسخة من هذا المستودع (Fork This Repository)**: [![التفرعات على GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **انسخ المستودع**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **احصل على المساعدة**: [مجتمع Azure على Discord](https://discord.com/invite/ByRwuEEgH4)

> **تفضل الاستنساخ محليًا؟**
>
> هذا المستودع يتضمن أكثر من 50 ترجمة للغات مما يزيد حجم التنزيل بشكل كبير. للاستنساخ بدون الترجمات، استخدم السحب الانتقائي (sparse checkout):
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> هذا يمنحك كل ما تحتاجه لإكمال الدورة مع تنزيل أسرع بكثير.


## نظرة عامة على الدورة

اتقن Azure Developer CLI (azd) من خلال فصول منظمة مصممة للتعلم التدريجي. **تركيز خاص على نشر تطبيقات الذكاء الاصطناعي مع تكامل Microsoft Foundry.**

### لماذا هذه الدورة ضرورية للمطورين العصريين

بناءً على رؤى مجتمع Microsoft Foundry على Discord، **45% من المطورين يرغبون في استخدام AZD لأعباء عمل الذكاء الاصطناعي** لكنهم يواجهون تحديات في:
- هندسات الذكاء الاصطناعي متعددة الخدمات المعقدة
- أفضل ممارسات نشر الذكاء الاصطناعي للإنتاج  
- تكامل وتكوين خدمات Azure للذكاء الاصطناعي
- تحسين التكلفة لأعباء عمل الذكاء الاصطناعي
- استكشاف أخطاء النشر الخاصة بالذكاء الاصطناعي وإصلاحها

### أهداف التعلم

من خلال إكمال هذه الدورة المنظمة، ستتمكن من:
- **إتقان أساسيات AZD**: المفاهيم الأساسية، التثبيت، والتكوين
- **نشر تطبيقات الذكاء الاصطناعي**: استخدام AZD مع خدمات Microsoft Foundry
- **تنفيذ البنية التحتية كرمز**: إدارة موارد Azure بقوالب Bicep
- **استكشاف أخطاء النشر وإصلاحها**: حل المشاكل الشائعة وتصحيح الأخطاء
- **التحسين للإنتاج**: الأمن، التحجيم، المراقبة، وإدارة التكلفة
- **بناء حلول متعددة الوكلاء**: نشر هندسات ذكاء اصطناعي معقدة

## 🗺️ خريطة الدورة: التنقل السريع حسب الفصل

كل فصل له README مخصص مع أهداف التعلم، بدء سريع، وتمارين:

| الفصل | الموضوع | الدروس | المدة | التعقيد |
|---------|-------|---------|----------|------------|
| **[الفصل 1: الأساس](docs/chapter-01-foundation/README.md)** | البدء | [أساسيات AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [التثبيت](docs/chapter-01-foundation/installation.md) &#124; [المشروع الأول](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[الفصل 2: تطوير الذكاء الاصطناعي](docs/chapter-02-ai-development/README.md)** | تطبيقات محورها الذكاء الاصطناعي | [تكامل Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [وكلاء الذكاء الاصطناعي](docs/chapter-02-ai-development/agents.md) &#124; [نشر النماذج](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [ورشة عمل](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 ساعة | ⭐⭐ |
| **[الفصل 3: التهيئة](docs/chapter-03-configuration/README.md)** | المصادقة & الأمان | [Configuration](docs/chapter-03-configuration/configuration.md) &#124; [Auth & Security](docs/chapter-03-configuration/authsecurity.md) | 45-60 دقيقة | ⭐⭐ |
| **[الفصل 4: البنية التحتية](docs/chapter-04-infrastructure/README.md)** | IaC & النشر | [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 ساعة | ⭐⭐⭐ |
| **[الفصل 5: متعدد الوكلاء](docs/chapter-05-multi-agent/README.md)** | حلول وكلاء الذكاء الاصطناعي | [السيناريو التجزئة](examples/retail-scenario.md) &#124; [أنماط التنسيق](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 ساعة | ⭐⭐⭐⭐ |
| **[الفصل 6: ما قبل النشر](docs/chapter-06-pre-deployment/README.md)** | التخطيط والتحقق | [فحوصات ما قبل الإقلاع](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [تخطيط السعة](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [اختيار SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 ساعة | ⭐⭐ |
| **[الفصل 7: استكشاف الأخطاء](docs/chapter-07-troubleshooting/README.md)** | تصحيح وإصلاح | [المشكلات الشائعة](docs/chapter-07-troubleshooting/common-issues.md) &#124; [التصحيح](docs/chapter-07-troubleshooting/debugging.md) &#124; [مشكلات الذكاء الاصطناعي](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 ساعة | ⭐⭐ |
| **[الفصل 8: الإنتاج](docs/chapter-08-production/README.md)** | نماذج المؤسسات | [ممارسات الإنتاج](docs/chapter-08-production/production-ai-practices.md) | 2-3 ساعة | ⭐⭐⭐⭐ |
| **[🎓 ورشة العمل](workshop/README.md)** | مختبر عملي | [مقدمة](workshop/docs/instructions/0-Introduction.md) &#124; [الاختيار](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [التحقق](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [التفكيك](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [التكوين](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [التخصيص](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [تفكيك البنية التحتية](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [الختام](workshop/docs/instructions/7-Wrap-up.md) | 3-4 ساعة | ⭐⭐ |

**إجمالي مدة الدورة:** ~10-14 ساعة | **تقدم المهارات:** مبتدئ → جاهز للإنتاج

---

## 📚 فصول التعلم

*اختر مسار التعلم بناءً على مستوى الخبرة والأهداف*

### 🚀 الفصل 1: الأساسيات والبدء السريع
**المتطلبات المسبقة**: اشتراك Azure، معرفة أساسية بسطر الأوامر  
**المدة**: 30-45 دقيقة  
**التعقيد**: ⭐

#### ما الذي ستتعلمه
- فهم أساسيات Azure Developer CLI
- تثبيت AZD على نظامك
- أول نشر ناجح لك

#### موارد التعلم
- **🎯 ابدأ من هنا**: [ما هو Azure Developer CLI؟](../..)
- **📖 النظرية**: [أساسيات AZD](docs/chapter-01-foundation/azd-basics.md) - المفاهيم الأساسية والمصطلحات
- **⚙️ الإعداد**: [التثبيت والإعداد](docs/chapter-01-foundation/installation.md) - أدلة خاصة بالنظام الأساسي
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

**💡 مخرجات الفصل**: نشر تطبيق ويب بسيط إلى Azure بنجاح باستخدام AZD

**✅ معايير النجاح:**
```bash
# بعد إكمال الفصل 1، يجب أن تكون قادرًا على:
azd version              # يعرض الإصدار المثبت
azd init --template todo-nodejs-mongo  # يهيئ المشروع
azd up                  # ينشر إلى Azure
azd show                # يعرض عنوان URL للتطبيق الجاري تشغيله
# يفتح التطبيق في المتصفح ويعمل
azd down --force --purge  # ينظف الموارد
```

**📊 الوقت المطلوب:** 30-45 دقيقة  
**📈 مستوى المهارة بعد:** يمكنه نشر تطبيقات أساسية بشكل مستقل
**📈 مستوى المهارة بعد:** يمكنه نشر تطبيقات أساسية بشكل مستقل

---

### 🤖 الفصل 2: تطوير محوره الذكاء الاصطناعي (موصى به لمطوري الذكاء الاصطناعي)
**المتطلبات المسبقة**: إتمام الفصل 1  
**المدة**: 1-2 ساعة  
**التعقيد**: ⭐⭐

#### ما الذي ستتعلمه
- تكامل Microsoft Foundry مع AZD
- نشر تطبيقات مدعومة بالذكاء الاصطناعي
- فهم إعدادات خدمات الذكاء الاصطناعي

#### موارد التعلم
- **🎯 ابدأ من هنا**: [تكامل Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 وكلاء الذكاء الاصطناعي**: [دليل وكلاء الذكاء الاصطناعي](docs/chapter-02-ai-development/agents.md) - نشر وكلاء ذكيين باستخدام AZD
- **📖 أنماط**: [نشر نماذج الذكاء الاصطناعي](docs/chapter-02-ai-development/ai-model-deployment.md) - نشر وإدارة نماذج الذكاء الاصطناعي
- **🛠️ مختبر**: [مختبر ورشة عمل الذكاء الاصطناعي](docs/chapter-02-ai-development/ai-workshop-lab.md) - اجعل حلول الذكاء الاصطناعي جاهزة لـ AZD
- **🎥 دليل تفاعلي**: [مواد الورشة](workshop/README.md) - تعلم عبر المتصفح باستخدام MkDocs * DevContainer Environment
- **📋 قوالب**: [قوالب Microsoft Foundry](../..)
- **📝 أمثلة**: [أمثلة نشر AZD](examples/README.md)

#### تمارين عملية
```bash
# انشر تطبيق الذكاء الاصطناعي الأول الخاص بك
azd init --template azure-search-openai-demo
azd up

# جرّب قوالب ذكاء اصطناعي إضافية
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 مخرجات الفصل**: نشر وتكوين تطبيق دردشة مدعوم بالذكاء الاصطناعي مع قدرات RAG

**✅ معايير النجاح:**
```bash
# بعد الفصل الثاني، يجب أن تكون قادرًا على:
azd init --template azure-search-openai-demo
azd up
# اختبار واجهة دردشة الذكاء الاصطناعي
# طرح الأسئلة والحصول على إجابات مدعومة بالذكاء الاصطناعي مع المصادر
# التحقق من أن تكامل البحث يعمل
azd monitor  # التحقق من أن Application Insights يعرض بيانات القياس
azd down --force --purge
```

**📊 الوقت المطلوب:** 1-2 ساعة  
**📈 مستوى المهارة بعد:** يمكنه نشر وتكوين تطبيقات ذكاء اصطناعي جاهزة للإنتاج  
**💰 الوعي بالتكاليف:** فهم تكاليف التطوير $80-150/شهر، وتكاليف الإنتاج $300-3500/شهر

#### 💰 اعتبارات التكلفة لنشر الذكاء الاصطناعي

**بيئة التطوير (مقدرة $80-150/شهريًا):**
- Microsoft Foundry Models (الدفع حسب الاستخدام): $0-50/شهر (بناءً على استخدام التوكن)
- AI Search (الطبقة الأساسية): $75/شهر
- Container Apps (استهلاكي): $0-20/شهر
- Storage (قياسي): $1-5/شهر

**بيئة الإنتاج (مقدرة $300-3,500+/شهر):**
- Microsoft Foundry Models (PTU لأداء ثابت): $3,000+/شهر OR Pay-as-go with high volume
- AI Search (الطبقة القياسية): $250/شهر
- Container Apps (مخصص): $50-100/شهر
- Application Insights: $5-50/شهر
- Storage (متميز): $10-50/شهر

**💡 نصائح لتحسين التكلفة:**
- استخدم **الطبقة المجانية** Microsoft Foundry Models للتعلم (Azure OpenAI يشمل 50,000 توكن/شهر)
- شغّل `azd down` لإلغاء تخصيص الموارد عندما لا تكون في وضع التطوير النشط
- ابدأ بنظام الفوترة القائم على الاستهلاك، قم بالترقية إلى PTU فقط للإنتاج
- استخدم `azd provision --preview` لتقدير التكاليف قبل النشر
- قم بتمكين التحجيم التلقائي: ادفع فقط مقابل الاستخدام الفعلي

**مراقبة التكلفة:**
```bash
# تحقق من التكاليف الشهرية المقدرة
azd provision --preview

# راقب التكاليف الفعلية في بوابة Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ الفصل 3: التهيئة والمصادقة
**المتطلبات المسبقة**: إتمام الفصل 1  
**المدة**: 45-60 دقيقة  
**التعقيد**: ⭐⭐

#### ما الذي ستتعلمه
- إدارة وإعداد البيئات
- أفضل ممارسات المصادقة والأمان
- تسمية وتنظيم الموارد

#### موارد التعلم
- **📖 التهيئة**: [دليل التهيئة](docs/chapter-03-configuration/configuration.md) - إعداد البيئة
- **🔐 الأمان**: [نماذج المصادقة والهوية المُدارة](docs/chapter-03-configuration/authsecurity.md) - نماذج المصادقة
- **📝 أمثلة**: [مثال تطبيق قاعدة بيانات](examples/database-app/README.md) - أمثلة قاعدة بيانات AZD

#### تمارين عملية
- تكوين بيئات متعددة (dev, staging, prod)
- إعداد مصادقة الهوية المُدارة
- تنفيذ إعدادات مخصصة للبيئات

**💡 مخرجات الفصل**: إدارة بيئات متعددة مع مصادقة وأمان مناسبين

---

### 🏗️ الفصل 4: البنية التحتية كرمز والنشر
**المتطلبات المسبقة**: إتمام الفصول 1-3  
**المدة**: 1-1.5 ساعة  
**التعقيد**: ⭐⭐⭐

#### ما الذي ستتعلمه
- أنماط نشر متقدمة
- البنية التحتية كرمز باستخدام Bicep
- استراتيجيات توفير الموارد

#### موارد التعلم
- **📖 النشر**: [دليل النشر](docs/chapter-04-infrastructure/deployment-guide.md) - تدفقات العمل الكاملة
- **🏗️ توفير الموارد**: [توفير الموارد](docs/chapter-04-infrastructure/provisioning.md) - إدارة موارد Azure
- **📝 أمثلة**: [مثال تطبيق الحاويات](../../examples/container-app) - نشر معتمد على الحاويات

#### تمارين عملية
- إنشاء قوالب Bicep مخصصة
- نشر تطبيقات متعددة الخدمات
- تنفيذ استراتيجيات النشر الأزرق-الأخضر

**💡 مخرجات الفصل**: نشر تطبيقات متعددة الخدمات المعقدة باستخدام قوالب بنية تحتية مخصصة

---

### 🎯 الفصل 5: حلول الذكاء الاصطناعي متعددة الوكلاء (متقدم)
**المتطلبات المسبقة**: إتمام الفصول 1-2  
**المدة**: 2-3 ساعة  
**التعقيد**: ⭐⭐⭐⭐

#### ما الذي ستتعلمه
- أنماط هندسة متعددة الوكلاء
- تنسيق وتأليف الوكلاء
- نشرات ذكاء اصطناعي جاهزة للإنتاج

#### موارد التعلم
- **🤖 المشروع المميز**: [حل متعدد الوكلاء لقطاع التجزئة](examples/retail-scenario.md) - تنفيذ كامل
- **🛠️ قوالب ARM**: [حزمة قالب ARM](../../examples/retail-multiagent-arm-template) - نشر بنقرة واحدة
- **📖 الهندسة**: [أنماط تنسيق متعددة الوكلاء](docs/chapter-06-pre-deployment/coordination-patterns.md) - أنماط

#### تمارين عملية
```bash
# نشر الحل المتكامل متعدد الوكلاء للبيع بالتجزئة
cd examples/retail-multiagent-arm-template
./deploy.sh

# استكشاف تكوينات الوكلاء
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 مخرجات الفصل**: نشر وإدارة حل ذكاء اصطناعي متعدد الوكلاء جاهز للإنتاج مع وكلاء العملاء والمخزون

---

### 🔍 الفصل 6: التحقق والتخطيط قبل النشر
**المتطلبات المسبقة**: إتمام الفصل 4  
**المدة**: 1 ساعة  
**التعقيد**: ⭐⭐

#### ما الذي ستتعلمه
- تخطيط السعة والتحقق من الموارد
- استراتيجيات اختيار SKU
- فحوصات ما قبل الإقلاع والأتمتة

#### موارد التعلم
- **📊 التخطيط**: [تخطيط السعة](docs/chapter-06-pre-deployment/capacity-planning.md) - التحقق من الموارد
- **💰 الاختيار**: [اختيار SKU](docs/chapter-06-pre-deployment/sku-selection.md) - اختيارات فعّالة من حيث التكلفة
- **✅ التحقق**: [فحوصات ما قبل الإقلاع](docs/chapter-06-pre-deployment/preflight-checks.md) - نصوص آلية

#### تمارين عملية
- تشغيل نصوص التحقق من السعة
- تحسين اختيارات SKU من حيث التكلفة
- تنفيذ فحوصات ما قبل النشر الآلية

**💡 مخرجات الفصل**: التحقق وتحسين عمليات النشر قبل التنفيذ

---

### 🚨 الفصل 7: استكشاف الأخطاء وإصلاحها وتصحيح الأخطاء
**المتطلبات المسبقة**: أي فصل نشر مكتمل  
**المدة**: 1-1.5 ساعة  
**التعقيد**: ⭐⭐

#### ما الذي ستتعلمه
- طرق منهجية للتصحيح
- المشكلات والحلول الشائعة
- استكشاف أخطاء الذكاء الاصطناعي الخاصة

#### موارد التعلم
- **🔧 المشكلات الشائعة**: [المشكلات الشائعة](docs/chapter-07-troubleshooting/common-issues.md) - الأسئلة المتكررة والحلول
- **🕵️ التصحيح**: [دليل التصحيح](docs/chapter-07-troubleshooting/debugging.md) - استراتيجيات خطوة بخطوة
- **🤖 مشكلات الذكاء الاصطناعي**: [استكشاف أخطاء الذكاء الاصطناعي](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - مشاكل خدمات الذكاء الاصطناعي

#### تمارين عملية
- تشخيص فشل النشر
- حل مشكلات المصادقة
- تصحيح اتصال خدمات الذكاء الاصطناعي

**💡 مخرجات الفصل**: تشخيص وحل مشكلات النشر الشائعة بشكل مستقل

---

### 🏢 الفصل 8: الإنتاج ونماذج المؤسسات
**المتطلبات المسبقة**: إتمام الفصول 1-4  
**المدة**: 2-3 ساعة  
**التعقيد**: ⭐⭐⭐⭐

#### ما الذي ستتعلمه
- استراتيجيات نشر الإنتاج
- نماذج أمان المؤسسات
- المراقبة وتحسين التكلفة

#### موارد التعلم
- **🏭 الإنتاج**: [أفضل ممارسات الذكاء الاصطناعي للإنتاج](docs/chapter-08-production/production-ai-practices.md) - أنماط المؤسسات
- **📝 أمثلة**: [مثال الخدمات المصغرة](../../examples/microservices) - هندسات معقدة
- **📊 المراقبة**: [تكامل Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - المراقبة

#### تمارين عملية
- تنفيذ أنماط أمان مؤسسية
- إعداد مراقبة شاملة
- النشر إلى الإنتاج مع حوكمة مناسبة

**💡 نتيجة الفصل**: نشر تطبيقات جاهزة للمؤسسات بقدرات إنتاجية كاملة

---

## 🎓 نظرة عامة على الورشة: تجربة تعلم عملية

> **⚠️ حالة الورشة: قيد التطوير**  
> يتم حاليًا تطوير مواد الورشة وصقلها. الوحدات الأساسية تعمل، لكن بعض الأقسام المتقدمة غير مكتملة. نحن نعمل بنشاط لإتمام كافة المحتويات. [تتبع التقدم →](workshop/README.md)

### مواد الورشة التفاعلية
**تعلم عملي تفاعلي شامل باستخدام أدوات متصفح وتمارين موجهة**

توفر مواد الورشة تجربة تعلم منظمة وتفاعلية تكمل المنهج القائم على الفصول أعلاه. تم تصميم الورشة للتعلم الذاتي ولقاءات يقودها مُدرّس.

#### 🛠️ مميزات الورشة
- **واجهة متصفح**: ورشة متكاملة تعمل بـ MkDocs مع ميزات البحث والنسخ والسمات
- **التكامل مع GitHub Codespaces**: إعداد بيئة تطوير بنقرة واحدة
- **مسار تعلم منظم**: تمارين موجهة مكونة من 8 وحدات (3-4 ساعات إجمالاً)
- **منهجية تقدمية**: المقدمة → الاختيار → التحقق → التفكيك → التكوين → التخصيص → الإزالة → الخلاصة
- **بيئة DevContainer تفاعلية**: أدوات واعتماديات مُجهزة مسبقًا

#### 📚 هيكل وحدات الورشة
تتبع الورشة **منهجية تقدمية مكونة من 8 وحدات** تأخذك من الاكتشاف إلى إتقان النشر:

| الوحدة | الموضوع | ما ستفعله | المدة |
|--------|---------|----------|----------|
| **0. المقدمة** | نظرة عامة على الورشة | فهم أهداف التعلم، المتطلبات المسبقة، وهيكل الورشة | 15 دقيقة |
| **1. الاختيار** | اكتشاف القوالب | استكشاف قوالب AZD واختيار القالب المناسب للذكاء الاصطناعي لسيناريوك | 20 دقيقة |
| **2. التحقق** | النشر والتحقّق | نشر القالب باستخدام `azd up` والتحقق من عمل البنية التحتية | 30 دقيقة |
| **3. التفكيك** | فهم البنية | استخدم GitHub Copilot لاستكشاف هندسة القالب، وملفات Bicep، وتنظيم الكود | 30 دقيقة |
| **4. التكوين** | الغوص في azure.yaml | إتقان تكوين `azure.yaml`، وخطافات دورة الحياة، ومتغيرات البيئة | 30 دقيقة |
| **5. التخصيص** | اجعلها لك | تفعيل AI Search، والتتبع، والتقييم، وتخصيصه لسيناريوك | 45 دقيقة |
| **6. الإزالة** | التنظيف | إلغاء توفير الموارد بأمان باستخدام `azd down --purge` | 15 دقيقة |
| **7. الخلاصة** | الخطوات التالية | مراجعة الإنجازات، المفاهيم الرئيسية، ومواصلة رحلة التعلم | 15 دقيقة |

**تدفق الورشة:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 البدء في الورشة
```bash
# الخيار 1: GitHub Codespaces (موصى به)
# انقر على «Code» → «Create codespace on main» في المستودع

# الخيار 2: التطوير المحلي
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# اتبع إرشادات الإعداد في workshop/README.md
```

#### 🎯 مخرجات تعلم الورشة
من خلال إكمال الورشة، سيستطيع المشاركون:
- **نشر تطبيقات الذكاء الاصطناعي للإنتاج**: استخدام AZD مع خدمات Microsoft Foundry
- **إتقان معماريات متعددة الوكلاء**: تنفيذ حلول منسقة لوكلاء الذكاء الاصطناعي
- **تطبيق أفضل ممارسات الأمان**: تكوين المصادقة والتحكم في الوصول
- **التحسين للتوسع**: تصميم نشرات فعّالة من حيث التكلفة والأداء
- **استكشاف مشكلات النشر وإصلاحها**: حل المشكلات الشائعة بشكل مستقل

#### 📖 موارد الورشة
- **🎥 الدليل التفاعلي**: [مواد الورشة](workshop/README.md) - بيئة تعلم قائمة على المتصفح
- **📋 تعليمات وحدة بوحدة**:
  - [0. المقدمة](workshop/docs/instructions/0-Introduction.md) - نظرة عامة على الورشة والأهداف
  - [1. الاختيار](workshop/docs/instructions/1-Select-AI-Template.md) - العثور على قوالب الذكاء الاصطناعي واختيارها
  - [2. التحقق](workshop/docs/instructions/2-Validate-AI-Template.md) - نشر القوالب والتحقق منها
  - [3. التفكيك](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - استكشاف بنية القالب
  - [4. التكوين](workshop/docs/instructions/4-Configure-AI-Template.md) - إتقان azure.yaml
  - [5. التخصيص](workshop/docs/instructions/5-Customize-AI-Template.md) - تخصيص لسيناريوك
  - [6. الإزالة](workshop/docs/instructions/6-Teardown-Infrastructure.md) - تنظيف الموارد
  - [7. الخلاصة](workshop/docs/instructions/7-Wrap-up.md) - مراجعة والخطوات التالية
- **🛠️ مختبر ورشة الذكاء الاصطناعي**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - تمارين مركزة على الذكاء الاصطناعي
- **💡 البدء السريع**: [دليل إعداد الورشة](workshop/README.md#quick-start) - تهيئة البيئة

**مثالية لـ**: التدريب المؤسسي، الدورات الجامعية، التعلم الذاتي، ومعسكرات تدريب المطورين.

---

## 📖 غوص معمق: إمكانات AZD

بخلاف الأساسيات، يوفر AZD ميزات قوية لنشرات الإنتاج:

- **النشر القائم على القوالب** - استخدم قوالب جاهزة لأنماط التطبيقات الشائعة
- **البنية التحتية ككود** - إدارة موارد Azure باستخدام Bicep أو Terraform  
- **تدفقات عمل متكاملة** - توفير ونشر ومراقبة التطبيقات بسلاسة
- **مناسب للمطورين** - مُحسّن لإنتاجية وتجربة المطور

### **AZD + Microsoft Foundry: مثالي لنشرات الذكاء الاصطناعي**

**لماذا AZD لحلول الذكاء الاصطناعي؟** يعالج AZD التحديات الرئيسية التي يواجهها مطورو الذكاء الاصطناعي:

- **قوالب جاهزة للذكاء الاصطناعي** - قوالب مُهيأة مسبقًا لنماذج Microsoft Foundry وCognitive Services وأحمال عمل التعلم الآلي
- **نشرات ذكاء اصطناعي آمنة** - أنماط أمان مضمنة لخدمات الذكاء الاصطناعي ومفاتيح API ونقاط نهاية النماذج  
- **أنماط الذكاء الاصطناعي للإنتاج** - أفضل الممارسات لنشر تطبيقات الذكاء الاصطناعي القابلة للتوسع وذات التكلفة الفعّالة
- **تدفقات عمل الذكاء الاصطناعي من البداية للنهاية** - من تطوير النماذج إلى النشر الإنتاجي مع مراقبة مناسبة
- **تحسين التكلفة** - تخصيص موارد ذكي واستراتيجيات التوسيع لأحمال عمل الذكاء الاصطناعي
- **التكامل مع Microsoft Foundry** - اتصال سلس إلى كتالوج نماذج Microsoft Foundry ونقاط النهاية

---

## 🎯 مكتبة القوالب والأمثلة

### مميزة: قوالب Microsoft Foundry
**ابدأ هنا إذا كنت تنشر تطبيقات ذكاء اصطناعي!**

> **ملاحظة:** تبيّن هذه القوالب أنماطًا مختلفة للذكاء الاصطناعي. بعضها عينات Azure خارجية، والأخرى تنفيذات محلية.

| القالب | الفصل | التعقيد | الخدمات | النوع |
|----------|---------|------------|----------|------|
| [**البدء مع الدردشة بالذكاء الاصطناعي**](https://github.com/Azure-Samples/get-started-with-ai-chat) | الفصل 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | خارجي |
| [**البدء مع وكلاء الذكاء الاصطناعي**](https://github.com/Azure-Samples/get-started-with-ai-agents) | الفصل 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| خارجي |
| [**عرض توضيحي Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | الفصل 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | خارجي |
| [**البدء السريع لتطبيق دردشة OpenAI**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | الفصل 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | خارجي |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | الفصل 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | خارجي |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | الفصل 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | خارجي |
| [**حل متعدد الوكلاء للقطاع التجزئة**](examples/retail-scenario.md) | الفصل 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **محلي** |

### مميزة: سيناريوهات تعلم كاملة
**قوالب تطبيقات جاهزة للإنتاج مرتبطة بفصول التعلم**

| القالب | فصل التعلم | التعقيد | التعلم الرئيسي |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | الفصل 2 | ⭐ | أنماط نشر الذكاء الاصطناعي الأساسية |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | الفصل 2 | ⭐⭐ | تنفيذ RAG باستخدام Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | الفصل 4 | ⭐⭐ | تكامل Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | الفصل 5 | ⭐⭐⭐ | إطار الوكلاء واستدعاء الدوال |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | الفصل 8 | ⭐⭐⭐ | تنظيم AI على مستوى المؤسسة |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | الفصل 5 | ⭐⭐⭐⭐ | معماريات متعددة الوكلاء مع وكلاء العميل والمخزون |

### التعلم بواسطة نوع المثال

> **📌 أمثلة محلية مقابل خارجية:**  
> **الأمثلة المحلية** (في هذا المستودع) = جاهزة للاستخدام فورًا  
> **الأمثلة الخارجية** (Azure Samples) = استنسخها من المستودعات المرتبطة

#### أمثلة محلية (جاهزة للاستخدام)
- [**حل متعدد الوكلاء للقطاع التجزئة**](examples/retail-scenario.md) - تنفيذ كامل جاهز للإنتاج مع قوالب ARM
  - هندسة متعددة الوكلاء (وكلاء العميل + المخزون)
  - مراقبة وتقييم شاملة
  - نشر بنقرة واحدة عبر قالب ARM

#### أمثلة محلية - تطبيقات الحاويات (الفصول 2-5)
**أمثلة شاملة لنشر الحاويات في هذا المستودع:**
- [**أمثلة تطبيقات الحاويات**](examples/container-app/README.md) - دليل كامل لنشرات الحاويات
  - [واجهة برمجة تطبيقات Flask بسيطة](../../examples/container-app/simple-flask-api) - REST أساسية مع إمكانية scale-to-zero
  - [هندسة الخدمات المصغرة](../../examples/container-app/microservices) - نشر متعدد الخدمات جاهز للإنتاج
  - نماذج البداية السريعة، الإنتاج، والنشر المتقدم
  - إرشادات للمراقبة، الأمان، وتحسين التكلفة

#### أمثلة خارجية - تطبيقات بسيطة (الفصول 1-2)
**استنسخ مستودعات Azure Samples هذه للبدء:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - أنماط نشر أساسية
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - نشر محتوى ثابت
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - نشر REST API

#### أمثلة خارجية - تكامل قواعد البيانات (الفصل 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - أنماط اتصال قاعدة البيانات
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - سير عمل بيانات بدون خادم

#### أمثلة خارجية - أنماط متقدمة (الفصول 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - هندسات متعددة الخدمات
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - المعالجة الخلفية  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - أنماط ML جاهزة للإنتاج

### مجموعات القوالب الخارجية
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - مجموعة منقحة من القوالب الرسمية ومجتمعية
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - وثائق قوالب Microsoft Learn
- [**Examples Directory**](examples/README.md) - أمثلة تعلم محلية مع تفسيرات مفصلة

---

## 📚 موارد ومراجع التعلم

### مراجع سريعة
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - أوامر azd الأساسية منظمة حسب الفصل
- [**Glossary**](resources/glossary.md) - مصطلحات Azure و azd  
- [**FAQ**](resources/faq.md) - أسئلة شائعة منظمة حسب فصل التعلم
- [**Study Guide**](resources/study-guide.md) - تمارين تطبيقية شاملة

### ورش العمل العملية
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - اجعل حلول الذكاء الاصطناعي قابلة للنشر عبر AZD (2-3 ساعات)
- [**Interactive Workshop**](workshop/README.md) - تمارين مكونة من 8 وحدات مع MkDocs وGitHub Codespaces
  - يتبع: المقدمة → الاختيار → التحقق → التفكيك → التكوين → التخصيص → الإزالة → الخلاصة

### موارد تعلم خارجية
- [وثائق Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [مركز هندسة Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [حاسبة تسعير Azure](https://azure.microsoft.com/pricing/calculator/)
- [حالة Azure](https://status.azure.com/)

### مهارات وكلاء الذكاء الاصطناعي لمحررك
- [**مهارات Microsoft Azure على skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 مهارة وكيل مفتوحة لـ Azure AI، Foundry، النشر، التشخيص، تحسين التكلفة، والمزيد. قم بتثبيتها في GitHub Copilot، Cursor، Claude Code، أو أي وكيل مدعوم:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 دليل استكشاف الأخطاء وإصلاحها السريع

**المشكلات الشائعة التي يواجهها المبتدئون والحلول الفورية:**

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
<summary><strong>❌ "لم يتم العثور على اشتراك" أو "لم يتم ضبط الاشتراك"</strong></summary>

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
<summary><strong>❌ "InsufficientQuota" أو "تجاوز الحصة"</strong></summary>

```bash
# جرّب منطقة Azure مختلفة
azd env set AZURE_LOCATION "westus2"
azd up

# أو استخدم وحدات SKU أصغر في بيئة التطوير
# حرّر infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" يفشل في منتصف العملية</strong></summary>

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
<summary><strong>❌ "فشل المصادقة" أو "انتهت صلاحية الرمز"</strong></summary>

```bash
# إعادة المصادقة
az logout
az login

azd auth logout
azd auth login

# التحقق من المصادقة
az account show
```
</details>

<details>
<summary><strong>❌ "المورد موجود بالفعل" أو تعارضات في الأسماء</strong></summary>

```bash
# تقوم AZD بإنشاء أسماء فريدة، ولكن إذا حدث تعارض:
azd down --force --purge

# ثم أعد المحاولة ببيئة جديدة
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ نشر القالب يستغرق وقتًا طويلاً</strong></summary>

**أوقات الانتظار العادية:**
- تطبيق ويب بسيط: 5-10 دقائق
- تطبيق مع قاعدة بيانات: 10-15 دقائق
- تطبيقات الذكاء الاصطناعي: 15-25 دقائق (توفير OpenAI بطيء)

```bash
# تحقق من التقدم
azd show

# إذا علقت لأكثر من 30 دقيقة، فتحقق من بوابة Azure:
azd monitor
# ابحث عن عمليات النشر الفاشلة
```
</details>

<details>
<summary><strong>❌ "تم الرفض" أو "ممنوع"</strong></summary>

```bash
# تحقق من دور Azure الخاص بك
az role assignment list --assignee $(az account show --query user.name -o tsv)

# تحتاج إلى دور "Contributor" على الأقل
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
# ابحث عن المتغيرات *_URL
```
</details>

### 📚 موارد استكشاف الأخطاء وإصلاحها الكاملة

- **دليل المشكلات الشائعة:** [حلول مفصلة](docs/chapter-07-troubleshooting/common-issues.md)
- **قضايا متعلقة بالذكاء الاصطناعي:** [استكشاف أخطاء الذكاء الاصطناعي وإصلاحها](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **دليل التصحيح:** [التصحيح خطوة بخطوة](docs/chapter-07-troubleshooting/debugging.md)
- **الحصول على المساعدة:** [ديسكورد Azure](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 إكمال الدورة والشهادات

### تتبع التقدم
تتبع تقدم تعلمك في كل فصل:

- [ ] **الفصل 1**: الأساس والبدء السريع ✅
- [ ] **الفصل 2**: تطوير يقوده الذكاء الاصطناعي ✅  
- [ ] **الفصل 3**: التكوين والمصادقة ✅
- [ ] **الفصل 4**: البنية التحتية كرمز والنشر ✅
- [ ] **الفصل 5**: حلول الذكاء الاصطناعي متعددة الوكلاء ✅
- [ ] **الفصل 6**: التحقق والتخطيط قبل النشر ✅
- [ ] **الفصل 7**: استكشاف الأخطاء وإصلاحها والتصحيح ✅
- [ ] **الفصل 8**: أنماط الإنتاج والمؤسسات ✅

### التحقق من التعلم
بعد إكمال كل فصل، تحقق من معرفتك عن طريق:
1. **تمرين عملي**: أكمل النشر العملي للفصل
2. **فحص المعرفة**: راجع قسم الأسئلة الشائعة للفصل
3. **مناقشة المجتمع**: شارك تجربتك في Discord الخاص بـ Azure
4. **الفصل التالي**: انتقل إلى مستوى التعقيد التالي

### فوائد إتمام الدورة
عند إكمال جميع الفصول، ستحصل على:
- **خبرة في الإنتاج**: نشرت تطبيقات ذكاء اصطناعي حقيقية على Azure
- **مهارات مهنية**: قدرات نشر جاهزة للمؤسسات  
- **الاعتراف المجتمعي**: عضو نشط في مجتمع مطوري Azure
- **تقدم وظيفي**: خبرة مطلوبة في AZD ونشر الذكاء الاصطناعي

---

## 🤝 المجتمع والدعم

### الحصول على المساعدة والدعم
- **مشكلات تقنية**: [الإبلاغ عن الأخطاء وطلب الميزات](https://github.com/microsoft/azd-for-beginners/issues)
- **أسئلة التعلم**: [مجتمع Discord الخاص بـ Microsoft Azure](https://discord.gg/microsoft-azure) و [![ديسكورد Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **مساعدة متعلقة بالذكاء الاصطناعي**: انضم إلى [![ديسكورد Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **التوثيق**: [التوثيق الرسمي لـ Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### رؤى المجتمع من ديسكورد Microsoft Foundry

**نتائج الاستطلاع الأخيرة من قناة #Azure:**
- **45%** من المطورين يريدون استخدام AZD لأحمال عمل الذكاء الاصطناعي
- **التحديات الرئيسية**: نشرات متعددة الخدمات، إدارة بيانات الاعتماد، الاستعداد للإنتاج  
- **الأكثر طلبًا**: قوالب متخصصة بالذكاء الاصطناعي، أدلة استكشاف الأخطاء، أفضل الممارسات

**انضم إلى مجتمعنا لـ:**
- شارك تجاربك مع AZD + الذكاء الاصطناعي واحصل على المساعدة
- الوصول إلى معاينات مبكرة للقوالب الجديدة الخاصة بالذكاء الاصطناعي
- المساهمة في أفضل ممارسات نشر الذكاء الاصطناعي
- التأثير في تطوير ميزات AI + AZD المستقبلية

### المساهمة في الدورة
نرحب بالمساهمات! يرجى قراءة [دليل المساهمة](CONTRIBUTING.md) للتفاصيل حول:
- **تحسين المحتوى**: تحسين الفصول والأمثلة الحالية
- **أمثلة جديدة**: إضافة سيناريوهات وقوالب من العالم الحقيقي  
- **الترجمة**: المساعدة في الحفاظ على دعم متعدد اللغات
- **تقارير الأخطاء**: تحسين الدقة والوضوح
- **معايير المجتمع**: اتباع إرشادات المجتمع الشاملة

---

## 📄 معلومات الدورة

### الترخيص
هذا المشروع مُرخّص بموجب رخصة MIT - انظر ملف [LICENSE](../../LICENSE) للتفاصيل.

### موارد تعلم Microsoft ذات الصلة

ينتج فريقنا دورات تعلم شاملة أخرى:

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
[![الذكاء الاصطناعي التوليدي للمبتدئين](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![الذكاء الاصطناعي التوليدي (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![الذكاء الاصطناعي التوليدي (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
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
 
### سلسلة Copilot
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ التنقل في الدورة

**🚀 جاهز للبدء في التعلم؟**

**للمبتدئين**: ابدأ بـ [الفصل 1: الأساس والبدء السريع](../..)  
**مطوروا الذكاء الاصطناعي**: انتقل إلى [الفصل 2: تطوير الذكاء الاصطناعي أولاً](../..)  
**المطورون ذوو الخبرة**: ابدأ بـ [الفصل 3: التكوين والمصادقة](../..)

**الخطوات التالية**: [ابدأ الفصل 1 - أساسيات AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
إخلاء المسؤولية:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة الآلية Co-op Translator (https://github.com/Azure/co-op-translator). بينما نسعى لتحقيق الدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر المرجعي والموثوق. بالنسبة للمعلومات الحساسة أو الحرجة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسيرات خاطئة ناتجة عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->