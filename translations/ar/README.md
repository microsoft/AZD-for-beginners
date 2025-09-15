<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6c3d0f9ef66c2cd692a55a2811d9c3e5",
  "translation_date": "2025-09-15T14:47:19+00:00",
  "source_file": "README.md",
  "language_code": "ar"
}
-->
# AZD للمبتدئين

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.ar.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/kzRShWzttr)](https://discord.gg/kzRShWzttr)

اتبع هذه الخطوات للبدء باستخدام هذه الموارد:
1. **نسخ المستودع**: انقر [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **استنساخ المستودع**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. [**انضم إلى مجتمعات Azure Discord وتواصل مع الخبراء والمطورين الآخرين**](https://discord.com/invite/ByRwuEEgH4)

### دعم متعدد اللغات

#### مدعوم عبر GitHub Action (تلقائي ودائم التحديث)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](./README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)

**إذا كنت ترغب في دعم لغات إضافية، يمكنك الاطلاع على اللغات المدعومة [هنا](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## المقدمة

مرحبًا بك في الدليل الشامل لـ Azure Developer CLI (azd). تم تصميم هذا المستودع لمساعدة المطورين من جميع المستويات، بدءًا من الطلاب وحتى المطورين المحترفين، على تعلم وإتقان Azure Developer CLI لنشر السحابة بكفاءة، **مع التركيز بشكل خاص على نشر تطبيقات الذكاء الاصطناعي باستخدام Azure AI Foundry**. يوفر هذا المورد التعليمي المنظم تجربة عملية مع نشر السحابة على Azure، وحل المشكلات الشائعة، وتطبيق أفضل الممارسات لنشر قوالب AZD بنجاح.

### **لماذا هذا الدليل مهم لمطوري الذكاء الاصطناعي**
استنادًا إلى استطلاع حديث في مجتمع Azure AI Foundry Discord، **45% من المطورين مهتمون باستخدام AZD لأعباء عمل الذكاء الاصطناعي** ولكنهم يواجهون تحديات مع:
- بنى الذكاء الاصطناعي متعددة الخدمات المعقدة
- أفضل الممارسات لنشر الذكاء الاصطناعي في الإنتاج
- تكامل وخدمات Azure AI
- تحسين التكلفة لأعباء عمل الذكاء الاصطناعي
- حل مشكلات النشر الخاصة بالذكاء الاصطناعي

## أهداف التعلم

من خلال العمل على هذا المستودع، ستتمكن من:
- إتقان أساسيات ومفاهيم Azure Developer CLI
- تعلم كيفية نشر وتوفير موارد Azure باستخدام البنية التحتية ككود
- تطوير مهارات حل المشكلات لمشكلات نشر AZD الشائعة
- فهم التحقق المسبق من النشر وتخطيط السعة
- تطبيق أفضل الممارسات الأمنية واستراتيجيات تحسين التكلفة
- بناء الثقة في نشر التطبيقات الجاهزة للإنتاج على Azure

## نتائج التعلم

بعد إكمال هذا الدورة، ستتمكن من:
- تثبيت وتكوين واستخدام Azure Developer CLI بنجاح
- إنشاء ونشر التطبيقات باستخدام قوالب AZD
- حل مشكلات المصادقة والبنية التحتية والنشر
- إجراء فحوصات ما قبل النشر بما في ذلك تخطيط السعة واختيار SKU
- تطبيق أفضل الممارسات للمراقبة والأمان وإدارة التكلفة
- دمج تدفقات عمل AZD في خطوط CI/CD

## جدول المحتويات

- [ما هو Azure Developer CLI؟](../..)
- [البدء السريع](../..)
- [مسار التعلم](../..)
  - [لمطوري الذكاء الاصطناعي (ابدأ هنا!)](../..)
  - [للطلاب والمبتدئين](../..)
  - [للمطورين](../..)
  - [لمهندسي DevOps](../..)
- [التوثيق](../..)
  - [البدء](../..)
  - [النشر والتوفير](../..)
  - [فحوصات ما قبل النشر](../..)
  - [الذكاء الاصطناعي وAzure AI Foundry](../..)
  - [حل المشكلات](../..)
- [الأمثلة والقوالب](../..)
  - [المميزة: قوالب Azure AI Foundry](../..)
  - [المميزة: سيناريوهات Azure AI Foundry الشاملة](../..)
  - [قوالب AZD إضافية](../..)
  - [مختبرات عملية وورش عمل](../..)
- [الموارد](../..)
- [المساهمة](../..)
- [الدعم](../..)
- [المجتمع](../..)

## ما هو Azure Developer CLI؟

Azure Developer CLI (azd) هو واجهة سطر أوامر موجهة للمطورين تسرّع عملية بناء ونشر التطبيقات على Azure. يوفر:

- **النشر القائم على القوالب** - استخدام قوالب جاهزة لأنماط التطبيقات الشائعة
- **البنية التحتية ككود** - إدارة موارد Azure باستخدام Bicep أو Terraform
- **تدفقات عمل متكاملة** - توفير ونشر ومراقبة التطبيقات بسلاسة
- **موجه للمطورين** - مصمم لتحسين إنتاجية وتجربة المطورين

### **AZD + Azure AI Foundry: مثالي لنشر الذكاء الاصطناعي**

**لماذا AZD لحلول الذكاء الاصطناعي؟** يعالج AZD التحديات الرئيسية التي يواجهها مطورو الذكاء الاصطناعي:

- **قوالب جاهزة للذكاء الاصطناعي** - قوالب مهيأة مسبقًا لـ Azure OpenAI، وخدمات الإدراك، وأعباء عمل التعلم الآلي
- **نشر آمن للذكاء الاصطناعي** - أنماط أمان مدمجة لخدمات الذكاء الاصطناعي، ومفاتيح API، ونقاط نهاية النماذج
- **أنماط إنتاج الذكاء الاصطناعي** - أفضل الممارسات لنشر تطبيقات الذكاء الاصطناعي القابلة للتوسع وذات التكلفة الفعالة
- **تدفقات عمل شاملة للذكاء الاصطناعي** - من تطوير النماذج إلى النشر في الإنتاج مع مراقبة مناسبة
- **تحسين التكلفة** - استراتيجيات تخصيص الموارد والتوسع الذكية لأعباء عمل الذكاء الاصطناعي
- **تكامل Azure AI Foundry** - اتصال سلس بكاتالوج نماذج AI Foundry ونقاط النهاية

## البدء السريع

### المتطلبات الأساسية
- اشتراك Azure
- تثبيت Azure CLI
- Git (لاستنساخ القوالب)

### التثبيت
```bash
# Windows (PowerShell)
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"

# macOS/Linux
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### أول عملية نشر
```bash
# Initialize a new project
azd init --template todo-nodejs-mongo

# Provision Azure resources and deploy
azd up
```

### أول عملية نشر للذكاء الاصطناعي
```bash
# Initialize an AI-powered chat application with Azure OpenAI
azd init --template azure-search-openai-demo

# Configure AI services and deploy
azd up

# Or try other AI templates:
azd init --template openai-chat-app-quickstart
azd init --template ai-document-processing
azd init --template contoso-chat
```

## مسار التعلم

### لمطوري الذكاء الاصطناعي (ابدأ هنا!)
1. **البدء السريع**: جرب [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) القالب
2. **تعلم الأساسيات**: [AZD Basics](docs/getting-started/azd-basics.md) + [Azure AI Foundry Integration](docs/ai-foundry/azure-ai-foundry-integration.md)
3. **ممارسة عملية**: أكمل [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md)
4. **جاهزية الإنتاج**: راجع [Production AI Best Practices](docs/ai-foundry/production-ai-practices.md)
5. **متقدم**: انشر [contoso-chat](https://github.com/Azure-Samples/contoso-chat) القالب المؤسسي

### للطلاب والمبتدئين
1. ابدأ بـ [AZD Basics](docs/getting-started/azd-basics.md)
2. اتبع [دليل التثبيت](docs/getting-started/installation.md)
3. أكمل [مشروعك الأول](docs/getting-started/first-project.md)
4. مارس مع [مثال تطبيق ويب بسيط](../../examples/simple-web-app)

### للمطورين
1. راجع [دليل التكوين](docs/getting-started/configuration.md)
2. ادرس [دليل النشر](docs/deployment/deployment-guide.md)
3. اعمل على [مثال تطبيق قاعدة البيانات](../../examples/database-app)
4. استكشف [مثال تطبيق الحاويات](../../examples/container-app)

### لمهندسي DevOps
1. أتقن [توفير الموارد](docs/deployment/provisioning.md)
2. نفذ [فحوصات ما قبل الطيران](docs/pre-deployment/preflight-checks.md)
3. مارس [تخطيط السعة](docs/pre-deployment/capacity-planning.md)
4. مثال متقدم [الخدمات المصغرة](../../examples/microservices)

## التوثيق

### البدء
- [**أساسيات AZD**](docs/getting-started/azd-basics.md) - المفاهيم الأساسية والمصطلحات
- [**التثبيت والإعداد**](docs/getting-started/installation.md) - أدلة التثبيت الخاصة بالمنصة
- [**التكوين**](docs/getting-started/configuration.md) - إعداد البيئة والمصادقة
- [**مشروعك الأول**](docs/getting-started/first-project.md) - دليل خطوة بخطوة

### النشر والتوفير
- [**دليل النشر**](docs/deployment/deployment-guide.md) - تدفقات العمل الكاملة للنشر
- [**توفير الموارد**](docs/deployment/provisioning.md) - إدارة موارد Azure

### فحوصات ما قبل النشر
- [**تخطيط السعة**](docs/pre-deployment/capacity-planning.md) - التحقق من سعة موارد Azure
- [**اختيار SKU**](docs/pre-deployment/sku-selection.md) - اختيار SKUs المناسبة لـ Azure
- [**فحوصات ما قبل الطيران**](docs/pre-deployment/preflight-checks.md) - نصوص التحقق التلقائية

### الذكاء الاصطناعي وAzure AI Foundry
- [**تكامل Azure AI Foundry**](docs/ai-foundry/azure-ai-foundry-integration.md) - ربط AZD بخدمات Azure AI Foundry
- [**أنماط نشر نماذج الذكاء الاصطناعي**](docs/ai-foundry/ai-model-deployment.md) - نشر وإدارة نماذج الذكاء الاصطناعي باستخدام AZD
- [**مختبر ورشة عمل الذكاء الاصطناعي**](docs/ai-foundry/ai-workshop-lab.md) - مختبر عملي: جعل حلول الذكاء الاصطناعي جاهزة لـ AZD
- [**أفضل الممارسات للذكاء الاصطناعي في الإنتاج**](docs/ai-foundry/production-ai-practices.md) - الأمان، التوسع، والمراقبة لأعباء عمل الذكاء الاصطناعي

### حل المشكلات
- [**المشكلات الشائعة**](docs/troubleshooting/common-issues.md) - المشكلات المتكررة والحلول
- [**دليل تصحيح الأخطاء**](docs/troubleshooting/debugging.md) - استراتيجيات تصحيح الأخطاء خطوة بخطوة  
- [**تصحيح الأخطاء المتعلقة بالذكاء الاصطناعي**](docs/troubleshooting/ai-troubleshooting.md) - مشاكل خدمات الذكاء الاصطناعي ونشر النماذج  

## أمثلة وقوالب  

### [مميز: قوالب Azure AI Foundry](https://ai.azure.com/resource/build/templates)  
**ابدأ هنا إذا كنت تنشر تطبيقات الذكاء الاصطناعي!**  

| القالب | الوصف | التعقيد | الخدمات |
|--------|-------|---------|---------|
| [**ابدأ مع دردشة الذكاء الاصطناعي**](https://github.com/Azure-Samples/get-started-with-ai-chat) | إنشاء ونشر تطبيق دردشة أساسي مدمج مع بياناتك ورؤى القياس عن بعد باستخدام Azure Container Apps |⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |
| [**ابدأ مع وكلاء الذكاء الاصطناعي**](https://github.com/Azure-Samples/get-started-with-ai-agents) | إنشاء ونشر تطبيق وكيل أساسي مع إجراءات ورؤى القياس عن بعد باستخدام Azure Container Apps. |⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|
| [**أتمتة سير العمل متعدد الوكلاء**](https://github.com/Azure-Samples/get-started-with-ai-chat) | تحسين تخطيط المهام والأتمتة من خلال تنظيم وإدارة مجموعة من وكلاء الذكاء الاصطناعي.|⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**إنشاء مستندات من بياناتك**](https://github.com/Azure-Samples/get-started-with-ai-chat) | تسريع إنشاء المستندات مثل العقود والفواتير ومقترحات الاستثمار من خلال العثور على المعلومات ذات الصلة وتلخيصها من بياناتك. |⭐⭐⭐  | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|
| [**تحسين اجتماعات العملاء باستخدام الوكلاء**](https://github.com/Azure-Samples/get-started-with-ai-chat) | ترحيل التعليمات البرمجية القديمة إلى لغات حديثة باستخدام فريق من الوكلاء. |⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |
| [**تحديث التعليمات البرمجية الخاصة بك باستخدام الوكلاء**](https://github.com/Azure-Samples/get-started-with-ai-chat) | إنشاء ونشر تطبيق دردشة أساسي مدمج مع بياناتك ورؤى القياس عن بعد باستخدام Azure Container Apps |⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**بناء وكيل المحادثة الخاص بك**](https://github.com/Azure-Samples/get-started-with-ai-chat) | الاستفادة من الفهم المتقدم للمحادثات لإنشاء وتحسين روبوتات الدردشة والوكلاء باستخدام سير عمل محدد وقابل للتحكم البشري. |⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|
| [**اكتشاف رؤى من بيانات المحادثات**](https://github.com/Azure-Samples/get-started-with-ai-chat) | تحسين كفاءة مركز الاتصال من خلال اكتشاف رؤى من مجموعات كبيرة من البيانات الصوتية والنصية باستخدام قدرات فهم المحتوى المتقدمة. |⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|
| [**معالجة المحتوى متعدد الوسائط**](https://github.com/Azure-Samples/get-started-with-ai-chat) | معالجة المطالبات والفواتير والعقود والمستندات الأخرى بسرعة ودقة من خلال استخراج المعلومات من المحتوى غير المنظم وتحويله إلى تنسيق منظم. يدعم هذا القالب النصوص والصور والجداول والرسوم البيانية. |⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|

### مميز: سيناريوهات Azure AI Foundry الشاملة  
**ابدأ هنا إذا كنت تنشر تطبيقات الذكاء الاصطناعي!**  

| القالب | الوصف | التعقيد | الخدمات |
|--------|-------|---------|---------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | واجهة دردشة بسيطة مع Azure OpenAI | ⭐ | AzureOpenAI + Container Apps |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | تطبيق دردشة مدعوم بـ RAG مع Azure OpenAI | ⭐⭐ | AzureOpenAI + Search + App Service |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | تحليل المستندات باستخدام خدمات الذكاء الاصطناعي | ⭐⭐ | Azure Document Intelligence + Functions |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | إطار عمل وكيل الذكاء الاصطناعي مع استدعاء الوظائف | ⭐⭐⭐ | AzureOpenAI + Azure Container Apps + Functions |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | دردشة مؤسسية مع تنظيم الذكاء الاصطناعي | ⭐⭐⭐ | AzureOpenAI + Azure AI Search + Container Apps |

### قوالب AZD إضافية  
- [**دليل الأمثلة**](examples/README.md) - أمثلة عملية وقوالب وسيناريوهات واقعية  
- [**قوالب Azure-Samples AZD**](https://github.com/Azure-Samples/azd-templates) - قوالب Microsoft الرسمية  
- [**معرض Awesome AZD**](https://azure.github.io/awesome-azd/) - قوالب مقدمة من المجتمع  

### مختبرات عملية وورش عمل  
- [**مختبر ورشة عمل الذكاء الاصطناعي**](docs/ai-foundry/ai-workshop-lab.md) - **جديد**: اجعل حلول الذكاء الاصطناعي قابلة للنشر باستخدام AZD  
- [**ورشة عمل AZD للمبتدئين**](workshop/README.md) - التركيز على نشر قوالب وكلاء الذكاء الاصطناعي باستخدام AZD  

## الموارد  

### مراجع سريعة  
- [**ورقة الغش للأوامر**](resources/cheat-sheet.md) - أوامر azd الأساسية  
- [**المصطلحات**](resources/glossary.md) - مصطلحات Azure وazd  
- [**الأسئلة الشائعة**](resources/faq.md) - الأسئلة المتكررة  
- [**دليل الدراسة**](resources/study-guide.md) - أهداف التعلم الشاملة وتمارين الممارسة  

### موارد خارجية  
- [وثائق Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [مركز هندسة Azure](https://learn.microsoft.com/en-us/azure/architecture/)  
- [حاسبة أسعار Azure](https://azure.microsoft.com/pricing/calculator/)  
- [حالة Azure](https://status.azure.com/)  

## المساهمة  

نرحب بالمساهمات! يرجى قراءة [دليل المساهمة](CONTRIBUTING.md) للحصول على تفاصيل حول:  
- كيفية تقديم المشاكل وطلبات الميزات  
- إرشادات المساهمة في التعليمات البرمجية  
- تحسين الوثائق  
- معايير المجتمع  

## الدعم  

- **المشاكل**: [الإبلاغ عن الأخطاء وطلب الميزات](https://github.com/microsoft/azd-for-beginners/issues)  
- **المناقشات**: [أسئلة ومناقشات مجتمع Microsoft Azure على Discord](https://discord.gg/microsoft-azure)  
- **الدعم الخاص بالذكاء الاصطناعي**: انضم إلى [قناة #Azure](https://discord.gg/microsoft-azure) لمناقشات AZD + AI Foundry  
- **البريد الإلكتروني**: للاستفسارات الخاصة  
- **Microsoft Learn**: [وثائق Azure Developer CLI الرسمية](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  

### رؤى المجتمع من Discord الخاص بـ Azure AI Foundry  

**نتائج استطلاع من قناة #Azure:**  
- **45%** من المطورين يرغبون في استخدام AZD لأعباء عمل الذكاء الاصطناعي  
- **أهم التحديات**: نشر الخدمات المتعددة، إدارة بيانات الاعتماد، الجاهزية للإنتاج  
- **الأكثر طلبًا**: قوالب خاصة بالذكاء الاصطناعي، أدلة تصحيح الأخطاء، أفضل الممارسات  

**انضم إلى مجتمعنا لـ:**  
- مشاركة تجاربك مع AZD + AI والحصول على المساعدة  
- الوصول إلى معاينات مبكرة لقوالب الذكاء الاصطناعي الجديدة  
- المساهمة في أفضل ممارسات نشر الذكاء الاصطناعي  
- التأثير على تطوير ميزات الذكاء الاصطناعي + AZD المستقبلية  

## الترخيص  

هذا المشروع مرخص بموجب ترخيص MIT - راجع ملف [LICENSE](../../LICENSE) للحصول على التفاصيل.  

## دورات أخرى  

فريقنا يقدم دورات أخرى! تحقق من:  

- [**جديد** بروتوكول سياق النموذج (MCP) للمبتدئين](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [وكلاء الذكاء الاصطناعي للمبتدئين](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [الذكاء الاصطناعي التوليدي للمبتدئين باستخدام .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)  
- [الذكاء الاصطناعي التوليدي للمبتدئين](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [الذكاء الاصطناعي التوليدي للمبتدئين باستخدام Java](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)  
- [تعلم الآلة للمبتدئين](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)  
- [علم البيانات للمبتدئين](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)  
- [الذكاء الاصطناعي للمبتدئين](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)  
- [الأمن السيبراني للمبتدئين](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)  
- [تطوير الويب للمبتدئين](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)  
- [إنترنت الأشياء للمبتدئين](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)  
- [تطوير XR للمبتدئين](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [إتقان GitHub Copilot للبرمجة المزدوجة بالذكاء الاصطناعي](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)  
- [إتقان GitHub Copilot لمطوري C#/.NET](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)  
- [اختر مغامرتك الخاصة مع Copilot](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)  

---

**التنقل**  
- **الدرس التالي**: [أساسيات AZD](docs/getting-started/azd-basics.md)  

---

**إخلاء المسؤولية**:  
تم ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى لتحقيق الدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو معلومات غير دقيقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي. للحصول على معلومات حاسمة، يُوصى بالاستعانة بترجمة بشرية احترافية. نحن غير مسؤولين عن أي سوء فهم أو تفسيرات خاطئة تنشأ عن استخدام هذه الترجمة.