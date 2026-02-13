# AZD للمبتدئين: رحلة تعليمية منظمة

![AZD للمبتدئين](../../translated_images/ar/azdbeginners.5527441dd9f74068.webp) 

[![المتابعون في GitHub](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![Forks على GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![النجوم في GitHub](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Discord الخاص بـ Azure](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Discord الخاص بـ Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### الترجمات الآلية (محدثة دائماً)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[العربية](./README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **تفضل الاستنساخ محليًا؟**
>
> يحتوي هذا المستودع على أكثر من 50 ترجمة للغات مما يزيد بشكل كبير من حجم التنزيل. لاستنساخ بدون الترجمات، استخدم sparse checkout:
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
> سيمنحك هذا كل ما تحتاجه لإكمال الدورة مع تنزيل أسرع بكثير.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🚀 ما هو Azure Developer CLI (azd)؟

**Azure Developer CLI (azd)** هي أداة سطر أوامر مريحة للمطورين تسهّل نشر التطبيقات على Azure. بدلاً من إنشاء وربط عشرات موارد Azure يدوياً، يمكنك نشر تطبيقات كاملة بأمر واحد.

### سحر `azd up`

```bash
# هذا الأمر الواحد يقوم بكل شيء:
# ✅ ينشئ جميع موارد أزور
# ✅ يهيئ الشبكات والأمان
# ✅ يبني رمز التطبيق الخاص بك
# ✅ ينشر إلى أزور
# ✅ يمنحك رابطًا صالحًا للعمل
azd up
```

**هذا كل شيء!** لا حاجة للنقر في بوابة Azure، ولا حاجة لتعلّم قوالب ARM المعقّدة أولاً، ولا تكوين يدوي — فقط تطبيقات تعمل على Azure.

---

## ❓ Azure Developer CLI مقابل Azure CLI: ما الفرق؟

هذا هو السؤال الأكثر شيوعاً الذي يطرحه المبتدئون. إليك الإجابة البسيطة:

| Feature | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Purpose** | إدارة موارد Azure فردية | نشر تطبيقات كاملة |
| **Mindset** | تركيز على البنية التحتية | تركيز على التطبيق |
| **Example** | `az webapp create --name myapp...` | `azd up` |
| **Learning Curve** | يجب معرفة خدمات Azure | يكفي معرفة تطبيقك |
| **Best For** | DevOps، البنية التحتية | المطورون، إنشاء النماذج الأولية |

### تشبيه بسيط

- **Azure CLI** أشبه بامتلاك كل الأدوات لبناء بيت - المطارق، المناشير، المسامير. يمكنك بناء أي شيء، لكنك بحاجة لمعرفة البناء.
- **Azure Developer CLI** أشبه بتوظيف مقاول - تصف ما تريد، وهم يتولون عملية البناء.

### متى تستخدم كل واحدة

| Scenario | Use This |
|----------|----------|
| "أريد نشر تطبيقي الوب بسرعة" | `azd up` |
| "أحتاج إلى إنشاء حساب تخزين فقط" | `az storage account create` |
| "أبني تطبيق ذكاء اصطناعي كامل" | `azd init --template azure-search-openai-demo` |
| "أحتاج إلى تصحيح مورد Azure محدد" | `az resource show` |
| "أريد نشرًا جاهزًا للإنتاج في دقائق" | `azd up --environment production` |

### يعملان معًا!

يستخدم AZD Azure CLI تحت الغطاء. يمكنك استخدام كلاهما:
```bash
# انشر تطبيقك باستخدام AZD
azd up

# ثم قم بضبط الموارد المحددة باستخدام Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 اعثر على القوالب في Awesome AZD

لا تبدأ من الصفر! **Awesome AZD** هي مجموعة مجتمعية من القوالب الجاهزة للنشر:

| Resource | Description |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | تصفح أكثر من 200 قالب مع نشر بنقرة واحدة |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | قدّم قالبك إلى المجتمع |
| 🔗 [**مستودع GitHub**](https://github.com/Azure/awesome-azd) | امنح نجمة واستكشف المصدر |

### قوالب الذكاء الاصطناعي الشهيرة من Awesome AZD

```bash
# دردشة RAG مع Azure OpenAI + البحث الذكي
azd init --template azure-search-openai-demo

# تطبيق دردشة ذكي سريع
azd init --template openai-chat-app-quickstart

# وكلاء الذكاء الاصطناعي مع وكلاء Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 ابدأ في 3 خطوات

### الخطوة 1: تثبيت AZD (2 دقيقة)

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

**🎉 هذا كل شيء!** تطبيقك الآن يعمل على Azure.

### التنظيف (لا تنسَ!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 كيفية استخدام هذه الدورة

تم تصميم هذه الدورة للتعلم التدريجي - ابدأ من حيث تشعر بالراحة وتقدّم للخلف تدريجياً:

| Your Experience | Start Here |
|-----------------|------------|
| **جديد تمامًا على Azure** | [Chapter 1: Foundation](../..) |
| **تعرف Azure، جديد على AZD** | [Chapter 1: Foundation](../..) |
| **تريد نشر تطبيقات ذكاء اصطناعي** | [Chapter 2: AI-First Development](../..) |
| **تريد تدريباً عملياً** | [🎓 Interactive Workshop](workshop/README.md) - مختبر موجّه لمدة 3-4 ساعات |
| **تحتاج أنماطًا للإنتاج** | [Chapter 8: Production & Enterprise](../..) |

### إعداد سريع

1. **افتح Fork لهذا المستودع**: [![Forks على GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **انسخه**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **اطلب المساعدة**: [مجتمع Azure على Discord](https://discord.com/invite/ByRwuEEgH4)

> **تفضل الاستنساخ محليًا؟**

> يحتوي هذا المستودع على أكثر من 50 ترجمة للغات مما يزيد بشكل كبير من حجم التنزيل. لاستنساخ بدون الترجمات، استخدم sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> هذا يمنحك كل ما تحتاجه لإكمال الدورة مع تنزيل أسرع بكثير.


## نظرة عامة على الدورة

اتقن Azure Developer CLI (azd) من خلال فصول منظمة مصممة للتعلم التدريجي. **تركيز خاص على نشر تطبيقات الذكاء الاصطناعي مع تكامل Microsoft Foundry.**

### لماذا هذه الدورة أساسية للمطورين المعاصرين

استنادًا إلى رؤى مجتمع Microsoft Foundry على Discord، **45% من المطورين يرغبون في استخدام AZD لأحمال عمل الذكاء الاصطناعي** لكنهم يواجهون تحديات في:
- هندسات ذكاء اصطناعي متعددة الخدمات المعقّدة
- أفضل ممارسات نشر الذكاء الاصطناعي للإنتاج  
- تكامل خدمات Azure AI والتكوين
- تحسين التكلفة لأحمال عمل الذكاء الاصطناعي
- استكشاف أخطاء النشر المرتبطة بالذكاء الاصطناعي وإصلاحها

### أهداف التعلم

بعد إكمال هذه الدورة المنظمة، ستتمكن من:
- **إتقان أساسيات AZD**: المفاهيم الجوهرية، التثبيت، والتكوين
- **نشر تطبيقات الذكاء الاصطناعي**: استخدام AZD مع خدمات Microsoft Foundry
- **تنفيذ البنية التحتية ككود**: إدارة موارد Azure باستخدام قوالب Bicep
- **استكشاف أخطاء النشر**: حل المشكلات الشائعة وتصحيح الأخطاء
- **التحسين للإنتاج**: الأمن، التوسيع، المراقبة، وإدارة التكاليف
- **بناء حلول متعددة الوكلاء**: نشر هندسات ذكاء اصطناعي معقدة

## 🗺️ خريطة الدورة: تنقّل سريع بحسب الفصل

لكل فصل README مخصص يحتوي على أهداف التعلم، البدايات السريعة، والتمارين:

| Chapter | Topic | Lessons | Duration | Complexity |
|---------|-------|---------|----------|------------|
| **[Ch 1: Foundation](docs/chapter-01-foundation/README.md)** | البداية | [أساسيات AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [التثبيت](docs/chapter-01-foundation/installation.md) &#124; [المشروع الأول](docs/chapter-01-foundation/first-project.md) | 30-45 دقيقة | ⭐ |
| **[Ch 2: AI Development](docs/chapter-02-ai-development/README.md)** | تطبيقات ذات أولوية للذكاء الاصطناعي | [تكامل Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [وكلاء الذكاء الاصطناعي](docs/chapter-02-ai-development/agents.md) &#124; [نشر النماذج](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [الورشة العملية](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 ساعة | ⭐⭐ |
| **[Ch 3: Configuration](docs/chapter-03-configuration/README.md)** | المصادقة والأمن | [التكوين](docs/chapter-03-configuration/configuration.md) &#124; [المصادقة والأمن](docs/chapter-03-configuration/authsecurity.md) | 45-60 دقيقة | ⭐⭐ |
| **[الفصل 4: البنية التحتية](docs/chapter-04-infrastructure/README.md)** | البنية التحتية ككود والنشر | [دليل النشر](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [التزويد](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 ساعة | ⭐⭐⭐ |
| **[الفصل 5: متعدد الوكلاء](docs/chapter-05-multi-agent/README.md)** | حلول وكلاء الذكاء الاصطناعي | [سيناريو التجزئة](examples/retail-scenario.md) &#124; [أنماط التنسيق](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 ساعات | ⭐⭐⭐⭐ |
| **[الفصل 6: ما قبل النشر](docs/chapter-06-pre-deployment/README.md)** | التخطيط والتحقق | [فحوصات ما قبل النشر](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [تخطيط السعة](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [اختيار SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 ساعة | ⭐⭐ |
| **[الفصل 7: استكشاف الأخطاء وإصلاحها](docs/chapter-07-troubleshooting/README.md)** | تصحيح وإصلاح | [مشاكل شائعة](docs/chapter-07-troubleshooting/common-issues.md) &#124; [التصحيح](docs/chapter-07-troubleshooting/debugging.md) &#124; [مشاكل الذكاء الاصطناعي](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 ساعة | ⭐⭐ |
| **[الفصل 8: الإنتاج](docs/chapter-08-production/README.md)** | أنماط مؤسسية | [ممارسات الإنتاج](docs/chapter-08-production/production-ai-practices.md) | 2-3 ساعات | ⭐⭐⭐⭐ |
| **[🎓 ورشة العمل](workshop/README.md)** | مختبر عملي | [مقدمة](workshop/docs/instructions/0-Introduction.md) &#124; [الاختيار](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [التحقق](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [تفكيك](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [التكوين](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [التخصيص](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [تفكيك البنية التحتية](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [الخلاصة](workshop/docs/instructions/7-Wrap-up.md) | 3-4 ساعات | ⭐⭐ |

**إجمالي مدة الدورة:** ~10-14 ساعات | **تقدم المهارة:** مبتدئ → جاهز للإنتاج

---

## 📚 فصول التعلم

*اختر مسار التعلم بناءً على مستوى الخبرة والأهداف*

### 🚀 الفصل 1: الأساسيات والبدء السريع
**المتطلبات المسبقة**: اشتراك Azure، معرفة أساسية بسطر الأوامر  
**المدة**: 30-45 دقيقة  
**مستوى التعقيد**: ⭐

#### ما ستتعلمه
- فهم أساسيات Azure Developer CLI
- تثبيت AZD على منصتك
- نشرك الناجح الأول

#### موارد التعلم
- **🎯 ابدأ من هنا**: [ما هو Azure Developer CLI؟](../..)
- **📖 النظرية**: [أساسيات AZD](docs/chapter-01-foundation/azd-basics.md) - المفاهيم الأساسية والمصطلحات
- **⚙️ الإعداد**: [التثبيت والإعداد](docs/chapter-01-foundation/installation.md) - أدلة حسب النظام الأساسي
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

**💡 نتيجة الفصل**: نشر تطبيق ويب بسيط إلى Azure بنجاح باستخدام AZD

**✅ معايير النجاح:**
```bash
# بعد إكمال الفصل الأول، ستتمكن من:
azd version              # يعرض الإصدار المثبت
azd init --template todo-nodejs-mongo  # يهيئ المشروع
azd up                  # ينشر إلى Azure
azd show                # يعرض عنوان URL للتطبيق قيد التشغيل
# يفتح التطبيق في المتصفح ويعمل
azd down --force --purge  # ينظف الموارد
```

**📊 الوقت المتوقع:** 30-45 دقيقة  
**📈 مستوى المهارة بعد:** قادر على نشر تطبيقات أساسية بشكل مستقل

**✅ معايير النجاح:**
```bash
# بعد إكمال الفصل الأول، يجب أن تكون قادرًا على:
azd version              # يعرض الإصدار المثبت
azd init --template todo-nodejs-mongo  # يهيئ المشروع
azd up                  # ينشر إلى أزور
azd show                # يعرض عنوان URL للتطبيق قيد التشغيل
# يفتح التطبيق في المتصفح ويعمل
azd down --force --purge  # ينظف الموارد
```

**📊 الوقت المتوقع:** 30-45 دقيقة  
**📈 مستوى المهارة بعد:** قادر على نشر تطبيقات أساسية بشكل مستقل

---

### 🤖 الفصل 2: تطوير موجه بالذكاء الاصطناعي (موصى به لمطوري الذكاء الاصطناعي)
**المتطلبات المسبقة**: إكمال الفصل 1  
**المدة**: 1-2 ساعات  
**مستوى التعقيد**: ⭐⭐

#### ما ستتعلمه
- تكامل Microsoft Foundry مع AZD
- نشر تطبيقات تعمل بالذكاء الاصطناعي
- فهم إعدادات خدمات الذكاء الاصطناعي

#### موارد التعلم
- **🎯 ابدأ من هنا**: [تكامل Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 وكلاء الذكاء الاصطناعي**: [دليل وكلاء الذكاء الاصطناعي](docs/chapter-02-ai-development/agents.md) - نشر وكلاء ذكيين باستخدام AZD
- **📖 الأنماط**: [نشر نماذج الذكاء الاصطناعي](docs/chapter-02-ai-development/ai-model-deployment.md) - نشر وإدارة نماذج الذكاء الاصطناعي
- **🛠️ ورشة العمل**: [مختبر ورشة الذكاء الاصطناعي](docs/chapter-02-ai-development/ai-workshop-lab.md) - تجهيز حلول الذكاء الاصطناعي للعمل مع AZD
- **🎥 دليل تفاعلي**: [مواد الورشة](workshop/README.md) - تعلم عبر المتصفح باستخدام MkDocs * بيئة DevContainer
- **📋 القوالب**: [قوالب Microsoft Foundry](../..)
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

**💡 نتيجة الفصل**: نشر وتكوين تطبيق دردشة يعمل بالذكاء الاصطناعي بقدرات RAG

**✅ معايير النجاح:**
```bash
# بعد الفصل الثاني، يجب أن تكون قادرًا على:
azd init --template azure-search-openai-demo
azd up
# اختبار واجهة الدردشة بالذكاء الاصطناعي
# طرح أسئلة والحصول على ردود مدعومة بالذكاء الاصطناعي مع المصادر
# التحقق من أن تكامل البحث يعمل
azd monitor  # التحقق من أن Application Insights يعرض بيانات القياس
azd down --force --purge
```

**📊 الوقت المتوقع:** 1-2 ساعات  
**📈 مستوى المهارة بعد:** قادر على نشر وتكوين تطبيقات ذكاء اصطناعي جاهزة للإنتاج  
**💰 وعي بالتكلفة:** فهم تكاليف التطوير $80-150/شهريًا، وتكاليف الإنتاج $300-3500/شهريًا

#### 💰 اعتبارات التكلفة لنشرات الذكاء الاصطناعي

**بيئة التطوير (تقدير $80-150/شهريًا):**
- Azure OpenAI (الدفع حسب الاستخدام): $0-50/شهريًا (بناءً على استخدام التوكنات)
- AI Search (الطبقة الأساسية): $75/شهريًا
- Container Apps (الاستهلاك): $0-20/شهريًا
- التخزين (قياسي): $1-5/شهريًا

**بيئة الإنتاج (تقدير $300-3,500+/شهريًا):**
- Azure OpenAI (PTU لأداء ثابت): $3,000+/شهريًا أو الدفع حسب الاستخدام مع حجم كبير
- AI Search (الطبقة القياسية): $250/شهريًا
- Container Apps (مخصص): $50-100/شهريًا
- Application Insights: $5-50/شهريًا
- التخزين (متميز): $10-50/شهريًا

**💡 نصائح تحسين التكلفة:**
- استخدم **الطبقة المجانية** Azure OpenAI للتعلم (50,000 توكن/شهريًا مشمولة)
- شغّل `azd down` لإلغاء تخصيص الموارد عند عدم التطوير النشط
- ابدأ بالفوترة على أساس الاستهلاك، وقم بالترقية إلى PTU فقط للإنتاج
- استخدم `azd provision --preview` لتقدير التكاليف قبل النشر
- فعّل التحجيم التلقائي: ادفع فقط مقابل الاستخدام الفعلي

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
**مستوى التعقيد**: ⭐⭐

#### ما ستتعلمه
- تكوين وإدارة البيئات
- أفضل ممارسات المصادقة والأمن
- تسمية الموارد والتنظيم

#### موارد التعلم
- **📖 التكوين**: [دليل التكوين](docs/chapter-03-configuration/configuration.md) - إعداد البيئة
- **🔐 الأمن**: [أنماط المصادقة والهوية المدارة](docs/chapter-03-configuration/authsecurity.md) - أنماط المصادقة
- **📝 أمثلة**: [مثال تطبيق قاعدة بيانات](examples/database-app/README.md) - أمثلة قواعد بيانات AZD

#### تمارين عملية
- تهيئة بيئات متعددة (dev, staging, prod)
- إعداد مصادقة الهوية المدارة
- تنفيذ إعدادات خاصة بكل بيئة

**💡 نتيجة الفصل**: إدارة بيئات متعددة مع المصادقة والأمن المناسبين

---

### 🏗️ الفصل 4: البنية التحتية كرمز والنشر
**المتطلبات المسبقة**: إكمال الفصول 1-3  
**المدة**: 1-1.5 ساعة  
**مستوى التعقيد**: ⭐⭐⭐

#### ما ستتعلمه
- أنماط نشر متقدمة
- البنية التحتية كرمز باستخدام Bicep
- استراتيجيات توفير الموارد

#### موارد التعلم
- **📖 النشر**: [دليل النشر](docs/chapter-04-infrastructure/deployment-guide.md) - سير العمل الكامل
- **🏗️ التزويد**: [توفير الموارد](docs/chapter-04-infrastructure/provisioning.md) - إدارة موارد Azure
- **📝 أمثلة**: [مثال تطبيق حاوية](../../examples/container-app) - عمليات نشر بالحاويات

#### تمارين عملية
- إنشاء قوالب Bicep مخصصة
- نشر تطبيقات متعددة الخدمات
- تنفيذ استراتيجيات النشر الأزرق-الأخضر

**💡 نتيجة الفصل**: نشر تطبيقات معقدة متعددة الخدمات باستخدام قوالب بنية تحتية مخصصة

---

### 🎯 الفصل 5: حلول الذكاء الاصطناعي متعددة الوكلاء (متقدم)
**المتطلبات المسبقة**: إكمال الفصول 1-2  
**المدة**: 2-3 ساعات  
**مستوى التعقيد**: ⭐⭐⭐⭐

#### ما ستتعلمه
- أنماط هندسة متعددة الوكلاء
- تنسيق وإدارة الوكلاء
- نشرات ذكاء اصطناعي جاهزة للإنتاج

#### موارد التعلم
- **🤖 المشروع المميز**: [حل متعدد الوكلاء للبيع بالتجزئة](examples/retail-scenario.md) - تنفيذ كامل
- **🛠️ قوالب ARM**: [حزمة قوالب ARM](../../examples/retail-multiagent-arm-template) - نشر بنقرة واحدة
- **📖 الهندسة**: [أنماط تنسيق متعدد الوكلاء](docs/chapter-06-pre-deployment/coordination-patterns.md) - أنماط

#### تمارين عملية
```bash
# نشر الحل المتكامل متعدد الوكلاء للبيع بالتجزئة
cd examples/retail-multiagent-arm-template
./deploy.sh

# استكشاف تكوينات الوكلاء
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 نتيجة الفصل**: نشر وإدارة حل ذكاء اصطناعي متعدد الوكلاء جاهز للإنتاج مع وكلاء العملاء والمخزون

---

### 🔍 الفصل 6: التحقق والتخطيط ما قبل النشر
**المتطلبات المسبقة**: إكمال الفصل 4  
**المدة**: 1 ساعة  
**مستوى التعقيد**: ⭐⭐

#### ما ستتعلمه
- تخطيط السعة والتحقق من الموارد
- استراتيجيات اختيار SKU
- فحوصات ما قبل النشر والأتمتة

#### موارد التعلم
- **📊 التخطيط**: [تخطيط السعة](docs/chapter-06-pre-deployment/capacity-planning.md) - التحقق من الموارد
- **💰 الاختيار**: [اختيار SKU](docs/chapter-06-pre-deployment/sku-selection.md) - خيارات فعّالة من حيث التكلفة
- **✅ التحقق**: [فحوصات ما قبل النشر](docs/chapter-06-pre-deployment/preflight-checks.md) - سكربتات مؤتمتة

#### تمارين عملية
- تشغيل سكربتات التحقق من السعة
- تحسين اختيارات SKU من حيث التكلفة
- تنفيذ فحوصات ما قبل النشر المؤتمتة

**💡 نتيجة الفصل**: التحقق من النشرات وتحسينها قبل التنفيذ

---

### 🚨 الفصل 7: استكشاف الأخطاء وإصلاحها والتصحيح
**المتطلبات المسبقة**: إكمال أي فصل نشر  
**المدة**: 1-1.5 ساعة  
**مستوى التعقيد**: ⭐⭐

#### ما ستتعلمه
- أساليب تصحيح منهجية
- المشاكل الشائعة والحلول
- استكشاف أخطاء خاص بالذكاء الاصطناعي

#### موارد التعلم
- **🔧 مشاكل شائعة**: [مشاكل شائعة](docs/chapter-07-troubleshooting/common-issues.md) - الأسئلة المتكررة والحلول
- **🕵️ التصحيح**: [دليل التصحيح](docs/chapter-07-troubleshooting/debugging.md) - استراتيجيات خطوة بخطوة
- **🤖 مشاكل الذكاء الاصطناعي**: [استكشاف أخطاء الذكاء الاصطناعي](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - مشاكل خدمات الذكاء الاصطناعي

#### تمارين عملية
- تشخيص فشل النشر
- حل مشاكل المصادقة
- تصحيح اتصال خدمات الذكاء الاصطناعي

**💡 نتيجة الفصل**: تشخيص وحل مشاكل النشر الشائعة بشكل مستقل

---

### 🏢 الفصل 8: الإنتاج وأنماط المؤسسات
**المتطلبات المسبقة**: إكمال الفصول 1-4  
**المدة**: 2-3 ساعات  
**مستوى التعقيد**: ⭐⭐⭐⭐

#### ما ستتعلمه
- استراتيجيات نشر الإنتاج
- أنماط الأمن المؤسسي
- المراقبة وتحسين التكلفة

#### موارد التعلم
- **🏭 الإنتاج**: [ممارسات الذكاء الاصطناعي في الإنتاج](docs/chapter-08-production/production-ai-practices.md) - أنماط مؤسسية
- **📝 أمثلة**: [مثال الخدمات المصغرة](../../examples/microservices) - هياكل معقدة
- **📊 المراقبة**: [تكامل Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - المراقبة

#### تمارين عملية
- تنفيذ أنماط الأمن المؤسسي
- إعداد مراقبة شاملة
- النشر في بيئة الإنتاج مع الحوكمة المناسبة

**💡 نتيجة الفصل**: نشر تطبيقات جاهزة للمؤسسات بقدرات إنتاجية كاملة

---

## 🎓 نظرة عامة على الورشة: تجربة تعلم عملية

> **⚠️ حالة الورشة: قيد التطوير**
> يتم حالياً تطوير مواد الورشة وتنقيحها. الوحدات الأساسية تعمل، لكن بعض الأقسام المتقدمة غير مكتملة. نحن نعمل بنشاط لإكمال كل المحتوى. [عرض التقدم →](workshop/README.md)

### مواد الورشة التفاعلية
**تعلم عملي شامل باستخدام أدوات متصفح وتمارين موجهة**

توفر مواد الورشة تجربة تعلم تفاعلية ومنهجية تكمل المنهج القائم على الفصول أعلاه. تم تصميم الورشة لكل من التعلم الذاتي والجلسات بقيادة مدرّس.

#### 🛠️ ميزات الورشة
- **واجهة تعمل عبر المتصفح**: ورشة عمل كاملة مدعومة بـ MkDocs مع ميزات البحث والنسخ والثيم
- **تكامل GitHub Codespaces**: إعداد بيئة تطوير بنقرة واحدة
- **مسار تعلم منظم**: تمارين موجهة مكونة من 8 وحدات (3-4 ساعات إجمالاً)
- **منهجية تقدمية**: المقدمة → الاختيار → التحقق → التفكيك → التكوين → التخصيص → الإيقاف → الخلاصة
- **بيئة DevContainer تفاعلية**: أدوات واعتمادات مُعَدّة مسبقاً

#### 📚 هيكل وحدة الورشة
تتبع الورشة **منهجية تقدمية مكونة من 8 وحدات** تأخذك من الاكتشاف إلى إتقان النشر:

| Module | Topic | What You'll Do | Duration |
|--------|-------|----------------|----------|
| **0. المقدمة** | نظرة عامة على الورشة | فهم أهداف التعلم والمتطلبات المسبقة وبنية الورشة | 15 دقيقة |
| **1. الاختيار** | اكتشاف القوالب | استكشاف قوالب AZD واختيار قالب الذكاء الاصطناعي المناسب لسيناريوك | 20 دقيقة |
| **2. التحقق** | النشر والتحقق | نشر القالب باستخدام `azd up` والتحقق من عمل البنية التحتية | 30 دقيقة |
| **3. التفكيك** | فهم البنية | استخدام GitHub Copilot لاستكشاف بنية القالب وملفات Bicep وتنظيم الشفرة | 30 دقيقة |
| **4. التكوين** | نظرة معمقة على azure.yaml | إتقان تكوين `azure.yaml`، روابط دورة الحياة، والمتغيرات البيئية | 30 دقيقة |
| **5. التخصيص** | اجعلها خاصة بك | تفعيل AI Search، التتبع، التقييم، وتخصيصه لسيناريوك | 45 دقيقة |
| **6. الإيقاف** | التنظيف | إلغاء تخصيص الموارد بأمان باستخدام `azd down --purge` | 15 دقيقة |
| **7. الخلاصة** | الخطوات التالية | مراجعة الإنجازات والمفاهيم الرئيسية ومواصلة رحلة التعلم | 15 دقيقة |

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
# في المستودع انقر على "Code" → "Create codespace on main"

# الخيار 2: التطوير المحلي
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# اتبع تعليمات الإعداد في workshop/README.md
```

#### 🎯 نواتج تعلم الورشة
بإكمال الورشة، سيتمكن المشاركون من:
- **نشر تطبيقات ذكاء اصطناعي إنتاجية**: استخدام AZD مع خدمات Microsoft Foundry
- **إتقان معماريات الوكلاء المتعددين**: تنفيذ حلول منسقة لوكلاء الذكاء الاصطناعي
- **تطبيق أفضل ممارسات الأمان**: تكوين المصادقة والتحكم في الوصول
- **التحسين من أجل السعة**: تصميم نشرات فعّالة من حيث التكلفة والأداء
- **استكشاف أخطاء النشرات وإصلاحها**: حل المشكلات الشائعة بشكل مستقل

#### 📖 موارد الورشة
- **🎥 الدليل التفاعلي**: [مواد الورشة](workshop/README.md) - بيئة تعلم تعمل عبر المتصفح
- **📋 تعليمات وحدة بوحدة**:
  - [0. المقدمة](workshop/docs/instructions/0-Introduction.md) - نظرة عامة على الورشة والأهداف
  - [1. الاختيار](workshop/docs/instructions/1-Select-AI-Template.md) - العثور على قوالب الذكاء الاصطناعي واختيارها
  - [2. التحقق](workshop/docs/instructions/2-Validate-AI-Template.md) - نشر والتحقق من القوالب
  - [3. التفكيك](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - استكشاف بنية القالب
  - [4. التكوين](workshop/docs/instructions/4-Configure-AI-Template.md) - إتقان azure.yaml
  - [5. التخصيص](workshop/docs/instructions/5-Customize-AI-Template.md) - تخصيص لسيناريوك
  - [6. الإيقاف](workshop/docs/instructions/6-Teardown-Infrastructure.md) - تنظيف الموارد
  - [7. الخلاصة](workshop/docs/instructions/7-Wrap-up.md) - المراجعة والخطوات التالية
- **🛠️ مختبر ورشة عمل الذكاء الاصطناعي**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - تمارين موجهة للذكاء الاصطناعي
- **💡 بدء سريع**: [دليل إعداد الورشة](workshop/README.md#quick-start) - تكوين البيئة

**مثالية لـ**: التدريب المؤسسي، الدورات الجامعية، التعلم الذاتي، ومعسكرات تدريب المطورين.

---

## 📖 نظرة متعمقة: إمكانيات AZD

بعيداً عن الأساسيات، يوفر AZD ميزات قوية لنشرات الإنتاج:

- **نشرات معتمدة على القوالب** - استخدم قوالب مُعدة مسبقًا لأنماط التطبيقات الشائعة
- **البنية التحتية ككود** - إدارة موارد Azure باستخدام Bicep أو Terraform  
- **تدفقات عمل مدمجة** - توفير ونشر ومراقبة التطبيقات بسلاسة
- **صديق للمطور** - مُحسّن لزيادة إنتاجية المطور وتجربته

### **AZD + Microsoft Foundry: مناسب تمامًا لنشرات الذكاء الاصطناعي**

**لماذا AZD لحلول الذكاء الاصطناعي؟** يعالج AZD أبرز التحديات التي يواجهها مطورو الذكاء الاصطناعي:

- **قوالب جاهزة للذكاء الاصطناعي** - قوالب مهيأة مسبقًا لـ Azure OpenAI وCognitive Services وأعباء عمل التعلم الآلي
- **نشرات آمنة للذكاء الاصطناعي** - أنماط أمان مدمجة لخدمات الذكاء الاصطناعي ومفاتيح API ونقاط نهاية النماذج  
- **أنماط ذكاء اصطناعي للإنتاج** - أفضل الممارسات لنشرات تطبيقات ذكاء اصطناعي قابلة للتوسع وفعّالة من حيث التكلفة
- **تدفقات عمل كاملة للذكاء الاصطناعي** - من تطوير النموذج إلى النشر الإنتاجي مع المراقبة المناسبة
- **تحسين التكلفة** - تخصيص موارد ذكي واستراتيجيات موازنة للحِمل لأعباء عمل الذكاء الاصطناعي
- **تكامل Microsoft Foundry** - اتصال سلس إلى كتالوج نماذج Microsoft Foundry ونقاط النهاية

---

## 🎯 مكتبة القوالب والأمثلة

### مميز: قوالب Microsoft Foundry
**ابدأ من هنا إذا كنت تنشر تطبيقات ذكاء اصطناعي!**

> **ملاحظة:** توضح هذه القوالب أنماطًا مختلفة للذكاء الاصطناعي. بعضها عينات Azure خارجية، والبعض الآخر تطبيقات محلية.

| Template | Chapter | Complexity | Services | Type |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | الفصل 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | خارجي |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | الفصل 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| خارجي |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | الفصل 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | خارجي |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | الفصل 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | خارجي |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | الفصل 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | خارجي |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | الفصل 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | خارجي |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | الفصل 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **محلي** |

### مميز: سيناريوهات تعلم كاملة
**قوالب تطبيقات جاهزة للإنتاج مرتبطة بفصول التعلم**

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | الفصل 2 | ⭐ | أنماط النشر الأساسية للذكاء الاصطناعي |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | الفصل 2 | ⭐⭐ | تنفيذ RAG مع Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | الفصل 4 | ⭐⭐ | تكامل Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | الفصل 5 | ⭐⭐⭐ | إطار العمل الوكِلي واستدعاء الدوال |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | الفصل 8 | ⭐⭐⭐ | تنسيق ذكاء اصطناعي للمؤسسات |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | الفصل 5 | ⭐⭐⭐⭐ | معماريات متعددة الوكلاء مع وكلاء العملاء والمخزون |

### التعلم من خلال نوع المثال

> **📌 أمثلة محلية مقابل خارجية:**  
> **الأمثلة المحلية** (في هذا المستودع) = جاهزة للاستخدام فوراً  
> **الأمثلة الخارجية** (Azure Samples) = استنساخ من المستودعات المرتبطة

#### أمثلة محلية (جاهزة للاستخدام)
- [**حل متعدد الوكلاء لقطاع التجزئة**](examples/retail-scenario.md) - تنفيذ جاهز للإنتاج كامل مع قوالب ARM
  - بنية متعددة الوكلاء (وكلاء العملاء + المخزون)
  - مراقبة وتقييم شاملة
  - نشر بنقرة واحدة عبر قالب ARM

#### أمثلة محلية - تطبيقات الحاويات (الفصول 2-5)
**أمثلة شاملة لنشر الحاويات في هذا المستودع:**
- [**أمثلة تطبيقات الحاوية**](examples/container-app/README.md) - دليل كامل لنشرات الحاويات
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - واجهة REST أساسية مع مقياس يصل للصفر
  - [Microservices Architecture](../../examples/container-app/microservices) - نشر متعدد الخدمات جاهز للإنتاج
  - أنماط بدء سريعة، إنتاجية، ومتقدمة للنشر
  - إرشادات للمراقبة، الأمان، وتحسين التكلفة

#### أمثلة خارجية - تطبيقات بسيطة (الفصول 1-2)
**استنسخ مستودعات Azure Samples هذه للبدء:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - أنماط النشر الأساسية
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - نشر محتوى ثابت
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - نشر REST API

#### أمثلة خارجية - تكامل قواعد البيانات (الفصل 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - أنماط اتصال قواعد البيانات
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - سير عمل بيانات بدون خوادم

#### أمثلة خارجية - أنماط متقدمة (الفصول 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - معماريات متعددة الخدمات
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - المعالجة الخلفية  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - أنماط ML جاهزة للإنتاج

### مجموعات قوالب خارجية
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - مجموعة منظمة من القوالب الرسمية ومجتمعية
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - توثيق قوالب Microsoft Learn
- [**Examples Directory**](examples/README.md) - أمثلة تعلم محلية مع شروحات مفصلة

---

## 📚 موارد التعلم والمراجع

### مراجع سريعة
- [**ورقة غش للأوامر**](resources/cheat-sheet.md) - أوامر azd الأساسية منظمة حسب الفصل
- [**قاموس المصطلحات**](resources/glossary.md) - مصطلحات Azure و azd  
- [**الأسئلة الشائعة**](resources/faq.md) - أسئلة شائعة منظمة حسب فصل التعلم
- [**دليل الدراسة**](resources/study-guide.md) - تمارين عملية شاملة

### ورش عملية
- [**مختبر ورشة عمل الذكاء الاصطناعي**](docs/chapter-02-ai-development/ai-workshop-lab.md) - اجعل حلولك قابلة للنشر بـ AZD (2-3 ساعات)
- [**الورشة التفاعلية**](workshop/README.md) - تمارين موجهة مكونة من 8 وحدات مع MkDocs وGitHub Codespaces
  - يتبع: المقدمة → الاختيار → التحقق → التفكيك → التكوين → التخصيص → الإيقاف → الخلاصة

### موارد تعلم خارجية
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 دليل استكشاف الأخطاء السريع

**المشكلات الشائعة التي يواجهها المبتدئون وحلول فورية:**

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

# التحقق من التثبيت
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
<summary><strong>❌ "InsufficientQuota" أو "Quota exceeded"</strong></summary>

```bash
# جرّب منطقة مختلفة في Azure
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
<summary><strong>❌ "azd up" يفشل في منتصف التنفيذ</strong></summary>

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
<summary><strong>❌ "Authentication failed" أو "Token expired"</strong></summary>

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
<summary><strong>❌ "Resource already exists" أو تعارضات التسميات</strong></summary>

```bash
# AZD يولّد أسماء فريدة، ولكن إذا حدث تعارض:
azd down --force --purge

# ثم أعد المحاولة في بيئة جديدة
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ نشر القالب يستغرق وقتًا طويلاً</strong></summary>

**أوقات الانتظار المتوقعة:**
- تطبيق ويب بسيط: 5-10 دقائق
- تطبيق مع قاعدة بيانات: 10-15 دقيقة
- تطبيقات الذكاء الاصطناعي: 15-25 دقيقة (توفير OpenAI بطيء)

```bash
# تحقق من التقدم
azd show

# إذا علقت لأكثر من 30 دقيقة، فتحقق من بوابة Azure:
azd monitor
# ابحث عن عمليات النشر الفاشلة
```
</details>

<details>
<summary><strong>❌ "Permission denied" أو "Forbidden"</strong></summary>

```bash
# تحقق من دورك في Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# تحتاج على الأقل إلى الدور "Contributor"
# اطلب من مسؤول Azure أن يمنح:
# - Contributor (للموارد)
# - User Access Administrator (لتعيينات الأدوار)
```
</details>

<details>
<summary><strong>❌ لا يمكن العثور على عنوان URL للتطبيق المنشور</strong></summary>

```bash
# اعرض جميع نقاط نهاية الخدمة
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
- **مشكلات مخصصة للذكاء الاصطناعي:** [استكشاف أخطاء الذكاء الاصطناعي](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **دليل التصحيح:** [التصحيح خطوة بخطوة](docs/chapter-07-troubleshooting/debugging.md)
- **اطلب المساعدة:** [Discord الخاص بـ Azure](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 إتمام الدورة والشهادة

### تتبع التقدم
تتبع تقدمك في التعلم خلال كل فصل:

- [ ] **الفصل 1**: الأساس والانطلاق السريع ✅
- [ ] **الفصل 2**: التطوير الموجه للذكاء الاصطناعي ✅  
- [ ] **الفصل 3**: التكوين والمصادقة ✅
- [ ] **الفصل 4**: البنية التحتية كرمز والنشر ✅
- [ ] **الفصل 5**: حلول الذكاء الاصطناعي متعددة الوكلاء ✅
- [ ] **الفصل 6**: التحقق والتخطيط قبل النشر ✅
- [ ] **الفصل 7**: استكشاف الأخطاء وإصلاحها والتصحيح ✅
- [ ] **الفصل 8**: أنماط الإنتاج للمؤسسات ✅

### التحقق من التعلم
بعد إكمال كل فصل، تحقق من معرفتك عن طريق:
1. **التمرين العملي**: أكمل النشر العملي للفصل
2. **اختبار المعرفة**: راجع قسم الأسئلة الشائعة للفصل
3. **المناقشة المجتمعية**: شارك تجربتك في Discord الخاص بـ Azure
4. **الفصل التالي**: انتقل إلى مستوى التعقيد التالي

### فوائد إتمام الدورة
بعد إتمام جميع الفصول، ستحصل على:
- **خبرة إنتاجية**: نشرت تطبيقات ذكاء اصطناعي حقيقية على Azure
- **المهارات المهنية**: قدرات نشر جاهزة للمؤسسات  
- **الاعتراف المجتمعي**: عضو نشط في مجتمع مطوري Azure
- **التقدم في الوظيفة**: خبرة مطلوبة في نشر AZD والذكاء الاصطناعي

---

## 🤝 المجتمع والدعم

### الحصول على المساعدة والدعم
- **المشكلات التقنية**: [الإبلاغ عن الأخطاء وطلب الميزات](https://github.com/microsoft/azd-for-beginners/issues)
- **أسئلة التعلم**: [مجتمع Microsoft Azure على Discord](https://discord.gg/microsoft-azure) و [![Discord الخاص بـ Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **مساعدة مخصصة للذكاء الاصطناعي**: انضم إلى [![Discord الخاص بـ Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **التوثيق**: [التوثيق الرسمي لـ Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### رؤى المجتمع من Microsoft Foundry Discord

**نتائج استطلاع حديثة من قناة #Azure:**
- **45%** من المطورين يريدون استخدام AZD لأحمال عمل الذكاء الاصطناعي
- **أكبر التحديات**: نشر خدمات متعددة، إدارة بيانات الاعتماد، الجاهزية للإنتاج  
- **الأكثر طلبًا**: قوالب مخصصة للذكاء الاصطناعي، أدلة استكشاف الأخطاء، أفضل الممارسات

**انضم إلى مجتمعنا لـ:**
- شارك تجاربك مع AZD + الذكاء الاصطناعي واحصل على المساعدة
- الوصول إلى معاينات مبكرة للقوالب الجديدة للذكاء الاصطناعي
- المساهمة في أفضل ممارسات نشر الذكاء الاصطناعي
- التأثير على تطوير ميزات AI + AZD المستقبلية

### المساهمة في الدورة
نرحب بالمساهمات! يرجى قراءة دليل [المساهمة](CONTRIBUTING.md) للتفاصيل حول:
- **تحسين المحتوى**: تحسين الفصول والأمثلة الحالية
- **أمثلة جديدة**: أضف سيناريوهات وقوالب من العالم الحقيقي  
- **الترجمة**: ساعد في الحفاظ على دعم متعدد اللغات
- **تقارير الأخطاء**: حسّن الدقة والوضوح
- **معايير المجتمع**: اتبع إرشادات مجتمعنا الشاملة

---

## 📄 معلومات الدورة

### الترخيص
هذا المشروع مرخّص بموجب ترخيص MIT - راجع ملف [LICENSE](../../LICENSE) للتفاصيل.

### الموارد التعليمية ذات الصلة من Microsoft

Our team produces other comprehensive learning courses:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j للمبتدئين](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js للمبتدئين](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain للمبتدئين](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
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
[![الإنترنت للأشياء للمبتدئين](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![تطوير XR للمبتدئين](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### سلسلة Copilot
[![Copilot للبرمجة المرافقة بالذكاء الاصطناعي](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot لـ C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![مغامرة Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ التنقل في الدورة

**🚀 هل أنت مستعد للبدء في التعلم؟**

**المبتدئين**: ابدأ بـ [الفصل 1: الأساسيات والبدء السريع](../..)  
**مطورو الذكاء الاصطناعي**: انتقل إلى [الفصل 2: التطوير المرتكز على الذكاء الاصطناعي](../..)  
**المطورون ذوو الخبرة**: ابدأ بـ [الفصل 3: التكوين والمصادقة](../..)

**الخطوات التالية**: [ابدأ الفصل 1 - أساسيات AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
إخلاء المسؤوليّة:
تمّت ترجمة هذا المستند باستخدام خدمة الترجمة الآلية Co-op Translator (https://github.com/Azure/co-op-translator). بينما نسعى لتحقيق الدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقّة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر المعتمد. للمعلومات الحسّاسة أو الحرجة، يوصى بالاستعانة بترجمة احترافية من قِبَل مترجم بشري. لن نتحمّل أي مسؤولية عن أي سوء فهم أو تفسير خاطئ ينشأ عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->