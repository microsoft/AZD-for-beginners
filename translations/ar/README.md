<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3bd0e0644b110276e4364eb753ddcef8",
  "translation_date": "2025-09-09T18:43:32+00:00",
  "source_file": "README.md",
  "language_code": "ar"
}
-->
# AZD للمبتدئين

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.ar.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/?WT.mc_id=academic-105485-koreyst)  
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/?WT.mc_id=academic-105485-koreyst)  
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/?WT.mc_id=academic-105485-koreyst)  

[![Azure Discord](https://dcbadge.limes.yellow/api/server/kzRShWzttr)](https://discord.gg/microsoft-azure)  

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/kzRShWzttr)](https://discord.gg/kzRShWzttr)  

اتبع هذه الخطوات للبدء باستخدام هذه الموارد:  
1. **نسخ المستودع**: اضغط [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)  
2. **استنساخ المستودع**: `git clone https://github.com/microsoft/azd-for-beginners.git`  
3. [**انضم إلى مجتمعات Azure Discord وتواصل مع الخبراء والمطورين الآخرين**](https://discord.com/invite/ByRwuEEgH4)  

### 🌐 دعم متعدد اللغات

#### مدعوم عبر GitHub Action (تلقائي ودائم التحديث)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](./README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)  

**إذا كنت ترغب في دعم لغات إضافية، يمكنك الاطلاع على القائمة [هنا](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**  

## المقدمة

مرحبًا بك في الدليل الشامل لـ Azure Developer CLI (azd). تم تصميم هذا المستودع لمساعدة المطورين على جميع المستويات، من الطلاب إلى المطورين المحترفين، على تعلم وإتقان Azure Developer CLI لنشر التطبيقات السحابية بكفاءة. يوفر هذا المورد التعليمي المهيكل تجربة عملية مع نشرات Azure السحابية، وحل المشكلات الشائعة، وتطبيق أفضل الممارسات لنشر قوالب AZD بنجاح.

## أهداف التعلم

من خلال العمل على هذا المستودع، ستتمكن من:  
- إتقان أساسيات ومفاهيم Azure Developer CLI  
- تعلم كيفية نشر وتوفير موارد Azure باستخدام البنية التحتية ككود  
- تطوير مهارات حل المشكلات المتعلقة بنشرات AZD  
- فهم التحقق المسبق للنشر وتخطيط السعة  
- تطبيق أفضل ممارسات الأمان واستراتيجيات تحسين التكلفة  
- بناء الثقة في نشر التطبيقات الجاهزة للإنتاج على Azure  

## نتائج التعلم

بعد إكمال هذا الدورة، ستكون قادرًا على:  
- تثبيت وتكوين واستخدام Azure Developer CLI بنجاح  
- إنشاء ونشر التطبيقات باستخدام قوالب AZD  
- حل مشكلات المصادقة والبنية التحتية والنشر  
- إجراء فحوصات ما قبل النشر بما في ذلك تخطيط السعة واختيار SKU  
- تطبيق أفضل ممارسات المراقبة والأمان وإدارة التكلفة  
- دمج تدفقات عمل AZD في خطوط CI/CD  

## جدول المحتويات

- [ما هو Azure Developer CLI؟](../..)  
- [البدء السريع](../..)  
- [التوثيق](../..)  
- [الأمثلة والقوالب](../..)  
- [الموارد](../..)  
- [المساهمة](../..)  

## ما هو Azure Developer CLI؟

Azure Developer CLI (azd) هو واجهة سطر أوامر موجهة للمطورين تسرّع عملية بناء ونشر التطبيقات على Azure. يوفر:  

- **نشرات قائمة على القوالب** - استخدام قوالب جاهزة لأنماط التطبيقات الشائعة  
- **البنية التحتية ككود** - إدارة موارد Azure باستخدام Bicep أو Terraform  
- **تدفقات عمل متكاملة** - توفير ونشر ومراقبة التطبيقات بسلاسة  
- **موجه للمطورين** - مصمم لتحسين إنتاجية وتجربة المطورين  

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

## التوثيق

### البدء  
- [**أساسيات AZD**](docs/getting-started/azd-basics.md) - المفاهيم والمصطلحات الأساسية  
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

### حل المشكلات  
- [**المشكلات الشائعة**](docs/troubleshooting/common-issues.md) - المشكلات والحلول المتكررة  
- [**دليل التصحيح**](docs/troubleshooting/debugging.md) - استراتيجيات التصحيح خطوة بخطوة  

## الأمثلة والقوالب

### قوالب البداية  
- [**تطبيق ويب بسيط**](../../examples/simple-web-app) - نشر تطبيق ويب Node.js أساسي  
- [**موقع ثابت**](../../examples/static-website) - استضافة موقع ثابت على Azure Storage  
- [**تطبيق الحاويات**](../../examples/container-app) - نشر تطبيق مخصص للحاويات  
- [**تطبيق قاعدة البيانات**](../../examples/database-app) - تطبيق ويب مع تكامل قاعدة البيانات  

### السيناريوهات المتقدمة  
- [**الخدمات المصغرة**](../../examples/microservices) - بنية تطبيق متعددة الخدمات  
- [**وظائف بدون خادم**](../../examples/serverless-function) - نشر وظائف Azure  
- [**أمثلة التكوين**](../../examples/configurations) - أنماط تكوين قابلة لإعادة الاستخدام  

## الموارد

### المراجع السريعة  
- [**ورقة الغش للأوامر**](resources/cheat-sheet.md) - أوامر azd الأساسية  
- [**المصطلحات**](resources/glossary.md) - مصطلحات Azure وazd  
- [**الأسئلة الشائعة**](resources/faq.md) - الأسئلة المتكررة  
- [**دليل الدراسة**](resources/study-guide.md) - أهداف التعلم الشاملة وتمارين الممارسة  

### الموارد الخارجية  
- [توثيق Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [مركز بنية Azure](https://learn.microsoft.com/en-us/azure/architecture/)  
- [حاسبة أسعار Azure](https://azure.microsoft.com/pricing/calculator/)  
- [حالة Azure](https://status.azure.com/)  

## مسار التعلم

### للطلاب والمبتدئين  
1. ابدأ بـ [أساسيات AZD](docs/getting-started/azd-basics.md)  
2. اتبع [دليل التثبيت](docs/getting-started/installation.md)  
3. أكمل [مشروعك الأول](docs/getting-started/first-project.md)  
4. تدرب على [مثال تطبيق ويب بسيط](../../examples/simple-web-app)  

### للمطورين  
1. راجع [دليل التكوين](docs/getting-started/configuration.md)  
2. ادرس [دليل النشر](docs/deployment/deployment-guide.md)  
3. اعمل على [مثال تطبيق قاعدة البيانات](../../examples/database-app)  
4. استكشف [مثال تطبيق الحاويات](../../examples/container-app)  

### لمهندسي DevOps  
1. أتقن [توفير الموارد](docs/deployment/provisioning.md)  
2. نفذ [فحوصات ما قبل الطيران](docs/pre-deployment/preflight-checks.md)  
3. تدرب على [تخطيط السعة](docs/pre-deployment/capacity-planning.md)  
4. مثال متقدم [الخدمات المصغرة](../../examples/microservices)  

## المساهمة

نرحب بالمساهمات! يرجى قراءة [دليل المساهمة](CONTRIBUTING.md) للحصول على تفاصيل حول:  
- كيفية تقديم المشكلات وطلبات الميزات  
- إرشادات مساهمة الكود  
- تحسينات التوثيق  
- معايير المجتمع  

## الدعم

- **المشكلات**: [الإبلاغ عن الأخطاء وطلب الميزات](https://github.com/microsoft/azd-for-beginners/issues)  
- **المناقشات**: [مجتمع Microsoft Azure Discord للأسئلة والمناقشات](https://discord.gg/microsoft-azure)  
- **البريد الإلكتروني**: للاستفسارات الخاصة  
- **Microsoft Learn**: [توثيق Azure Developer CLI الرسمي](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  

## الترخيص

هذا المشروع مرخص بموجب ترخيص MIT - راجع ملف [LICENSE](../../LICENSE) للحصول على التفاصيل.  

## 🎒 دورات أخرى

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
- [تطوير الواقع الممتد للمبتدئين](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
- [إتقان GitHub Copilot للبرمجة المزدوجة بالذكاء الاصطناعي](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [إتقان GitHub Copilot لمطوري C#/.NET](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [اختر مغامرتك الخاصة مع Copilot](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

**التنقل**
- **الدرس التالي**: [أساسيات AZD](docs/getting-started/azd-basics.md)

---

**إخلاء المسؤولية**:  
تم ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى لتحقيق الدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو معلومات غير دقيقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي. للحصول على معلومات حاسمة، يُوصى بالترجمة البشرية الاحترافية. نحن غير مسؤولين عن أي سوء فهم أو تفسيرات خاطئة تنشأ عن استخدام هذه الترجمة.