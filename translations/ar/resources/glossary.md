# Glossary - Azure and AZD Terminology

**Reference for All Chapters**
- **📚 Course Home**: [AZD For Beginners](../README.md)
- **📖 Learn Basics**: [Chapter 1: AZD Basics](../docs/getting-started/azd-basics.md)
- **🤖 AI Terms**: [Chapter 2: AI-First Development](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## Introduction

توفر هذه المسرد الشامل تعريفات للمصطلحات والمفاهيم والاختصارات المستخدمة في Azure Developer CLI وتطوير سحابة Azure. مرجع أساسي لفهم الوثائق الفنية، وحل المشكلات، والتواصل الفعال حول مشاريع azd وخدمات Azure.

## Learning Goals

باستخدام هذا المسرد، سوف:
- تفهم مصطلحات ومفاهيم Azure Developer CLI الأساسية
- تتقن مفردات ومصطلحات تطوير سحابة Azure الفنية
- تشير بكفاءة إلى مصطلحات البنية التحتية ككود ونشر التطبيقات
- تستوعب أسماء خدمات Azure والاختصارات وأغراضها
- تصل إلى تعريفات لمصطلحات استكشاف الأخطاء وإصلاحها وتصحيحها
- تتعلم مفاهيم متقدمة في هندسة وتطوير Azure

## Learning Outcomes

مع الرجوع المنتظم إلى هذا المسرد، ستكون قادراً على:
- التواصل بفعالية باستخدام المصطلحات الصحيحة لـ Azure Developer CLI
- فهم الوثائق الفنية ورسائل الخطأ بوضوح أكبر
- التنقل بين خدمات ومفاهيم Azure بثقة
- استكشاف المشكلات باستخدام المفردات الفنية المناسبة
- المساهمة في مناقشات الفريق بلغة تقنية دقيقة
- توسيع معرفتك بتطوير سحابة Azure بشكل منظم

## A

**قالب ARM**  
قالب Azure Resource Manager. صيغة بنية تحتية ككود قائمة على JSON تُستخدم لتعريف ونشر موارد Azure بشكل إعلانِي.

**خدمة App**  
عرض منصة كخدمة (PaaS) من Azure لاستضافة تطبيقات الويب وواجهات REST API وخدمات الواجهة الخلفية للتطبيقات المحمولة دون إدارة البنية التحتية.

**Application Insights**  
خدمة مراقبة أداء التطبيقات (APM) من Azure التي توفر رؤى متعمقة حول أداء التطبيق وتوافره واستخدامه.

**Azure CLI**  
واجهة سطر الأوامر لإدارة موارد Azure. تُستخدم بواسطة azd للمصادقة وبعض العمليات.

**Azure Developer CLI (azd)**  
أداة سطر أوامر موجهة للمطورين تُسرّع عملية بناء ونشر التطبيقات إلى Azure باستخدام قوالب والبنية التحتية ككود.

**azure.yaml**  
ملف التكوين الرئيسي لمشروع azd الذي يعرّف الخدمات والبنية التحتية وخطافات النشر.

**Azure Resource Manager (ARM)**  
خدمة النشر والإدارة في Azure التي توفر طبقة إدارة لإنشاء وتحديث وحذف الموارد.

## B

**Bicep**  
لغة مخصّصة للمجال (DSL) طورتها Microsoft لنشر موارد Azure. توفر صياغة أبسط من قوالب ARM مع الترجمة إلى ARM عند التجميع.

**Build**  
عملية ترجمة شفرة المصدر، وتثبيت التبعيات، وتجهيز التطبيقات للنشر.

**نشر أزرق-أخضر**  
استراتيجية نشر تستخدم بيئتين إنتاجيتين متطابقتين (أزرق وأخضر) لتقليل وقت التوقف والمخاطر.

## C

**Container Apps**  
خدمة الحاويات بدون خادم من Azure التي تمكّن تشغيل التطبيقات الحاوية بدون إدارة بنية تحتية معقدة.

**CI/CD**  
الاندماج المستمر/النشر المستمر. ممارسات مؤتمتة لدمج تغييرات الشفرة ونشر التطبيقات.

**Cosmos DB**  
خدمة قاعدة البيانات متعددة النماذج والموزعة عالمياً من Azure التي توفر اتفاقيات مستوى خدمة شاملة للقدرة على التحمل، الكمون، التوافر، والتناسق.

**التكوين**  
الإعدادات والمعلمات التي تتحكم بسلوك التطبيق وخيارات النشر.

## D

**النشر**  
عملية تثبيت وتكوين التطبيقات وتبعياتها على البنية التحتية المستهدفة.

**Docker**  
منصة لتطوير وشحن وتشغيل التطبيقات باستخدام تقنية الحاويات.

**Dockerfile**  
ملف نصي يحتوي تعليمات لبناء صورة حاوية Docker.

## E

**البيئة**  
هدف النشر الذي يمثل مثيلاً محدداً من تطبيقك (مثلاً، التطوير، التجربة، الإنتاج).

**متغيرات البيئة**  
قيم التكوين المخزنة كأزواج مفتاح-قيمة يمكن للتطبيقات الوصول إليها عند وقت التشغيل.

**نقطة النهاية**  
عنوان URL أو عنوان شبكة حيث يمكن الوصول إلى تطبيق أو خدمة.

## F

**Function App**  
خدمة الحوسبة بدون خادم من Azure التي تمكّن تشغيل شفرة مدفوعة بالأحداث دون إدارة البنية التحتية.

## G

**GitHub Actions**  
منصة CI/CD متكاملة مع مستودعات GitHub لأتمتة سير العمل.

**Git**  
نظام تحكم بالإصدارات موزع يُستخدم لتتبع التغييرات في شفرة المصدر.

## H

**Hooks**  
سكريبتات أو أوامر مخصصة تعمل في نقاط محددة خلال دورة حياة النشر (preprovision, postprovision, predeploy, postdeploy).

**المضيف**  
نوع خدمة Azure التي سينشر عليها التطبيق (مثلاً، appservice, containerapp, function).

## I

**البنية التحتية ككود (IaC)**  
ممارسة تعريف وإدارة البنية التحتية عبر الشيفرة بدلاً من العمليات اليدوية.

**Init**  
عملية تهيئة مشروع azd جديد، عادةً من قالب.

## J

**JSON**  
JavaScript Object Notation. صيغة تبادل بيانات تُستخدم شائعاً لملفات التكوين واستجابات واجهات برمجة التطبيقات.

**JWT**  
JSON Web Token. معيار لنقل المعلومات بأمان بين الأطراف ككائن JSON.

## K

**Key Vault**  
خدمة Azure لتخزين وإدارة الأسرار والمفاتيح والشهادات بأمان.

**Kusto Query Language (KQL)**  
لغة استعلام تُستخدم لتحليل البيانات في Azure Monitor وApplication Insights وخدمات Azure الأخرى.

## L

**موازن التحميل**  
خدمة توزع حركة الشبكة الواردة عبر عدة خوادم أو مثيلات.

**Log Analytics**  
خدمة Azure لجمع وتحليل والتصرف بناءً على بيانات القياس من البيئات السحابية والمحلية.

## M

**Managed Identity**  
ميزة في Azure توفر لهويات مُدارة تلقائياً للخدمات المصادقة إلى خدمات Azure الأخرى.

**خدمات صغيرة (Microservices)**  
نهج معماري حيث تُبنى التطبيقات كمجموعة من الخدمات الصغيرة والمستقلة.

**Monitor**  
حل المراقبة الموحدة من Azure الذي يوفر رؤية شاملة عبر التطبيقات والبنية التحتية.

## N

**Node.js**  
بيئة تشغيل JavaScript مبنية على محرك V8 من Chrome لبناء تطبيقات جانب الخادم.

**npm**  
مدير الحزم لـ Node.js الذي يدير التبعيات والحزم.

## O

**المخرجات**  
القيم المعادة من نشر البنية التحتية والتي يمكن أن تستخدمها التطبيقات أو الموارد الأخرى.

## P

**التعبئة (Package)**  
عملية تجهيز شفرة التطبيق وتبعياته للنشر.

**المعلمات**  
قيم إدخال تُمرَر إلى قوالب البنية التحتية لتخصيص عمليات النشر.

**PostgreSQL**  
نظام إدارة قواعد بيانات علائقية مفتوح المصدر مدعوم كخدمة مُدارة في Azure.

**التجهيز (Provisioning)**  
عملية إنشاء وتكوين موارد Azure المعرفة في قوالب البنية التحتية.

## Q

**الحصة (Quota)**  
الحدود على كمية الموارد التي يمكن إنشاؤها في اشتراك Azure أو منطقة.

## R

**مجموعة الموارد**  
حاوية منطقية لموارد Azure تشترك في نفس دورة الحياة والأذونات والسياسات.

**رمز المورد**  
سلسلة فريدة يولدها azd لضمان تميّز أسماء الموارد عبر عمليات النشر.

**REST API**  
نمط معماري لتصميم التطبيقات الشبكية باستخدام طرق HTTP.

**التراجع (Rollback)**  
عملية الرجوع إلى إصدار سابق من تطبيق أو تكوين البنية التحتية.

## S

**الخدمة**  
مكون من تطبيقك معرف في azure.yaml (مثلاً، واجهة ويب أمامية، واجهة برمجة تطبيقات خلفية، قاعدة بيانات).

**SKU**  
وحدة حفظ المخزون. تمثل مستويات خدمة مختلفة أو مستويات أداء لموارد Azure.

**قاعدة بيانات SQL**  
خدمة قاعدة بيانات علائقية مُدارة من Azure تعتمد على Microsoft SQL Server.

**Static Web Apps**  
خدمة Azure لبناء ونشر تطبيقات ويب كاملة من مستودعات الشيفرة المصدرية.

**حساب التخزين**  
خدمة Azure التي توفر تخزين سحابي لكائنات البيانات بما في ذلك blobs, files, queues, و tables.

**الاشتراك**  
حاوية حساب Azure التي تحتوي على مجموعات الموارد والموارد، مع الفوترة وإدارة الوصول المرتبطة بها.

## T

**القالب**  
هيكل مشروع مُسبق البناء يحتوي شفرة التطبيق وتعريفات البنية التحتية والتكوين للسيناريوهات الشائعة.

**Terraform**  
أداة بنية تحتية ككود مفتوحة المصدر تدعم مزودي سحابة متعددة بما في ذلك Azure.

**Traffic Manager**  
موازن تحميل قائم على DNS من Azure لتوزيع الحركة عبر مناطق Azure العالمية.

## U

**URI**  
معرف الموارد الموحد. سلسلة تحدد مورداً معيناً.

**URL**  
محدد موقع الموارد الموحد. نوع من URI يحدد مكان المورد وكيفية استرجاعه.

## V

**الشبكة الافتراضية (VNet)**  
اللبنة الأساسية للشبكات الخاصة في Azure، توفر العزل والتقسيم.

**VS Code**  
Visual Studio Code. محرر شيفرة شهير يتميز بتكامل ممتاز مع Azure وazd.

## W

**Webhook**  
استدعاء HTTP يُحفز بواسطة أحداث محددة، يُستخدم شائعاً في خطوط CI/CD.

**What-if**  
ميزة في Azure تُظهر التغييرات التي ستُجرى بسبب نشر دون تنفيذها فعلياً.

## Y

**YAML**  
YAML ليست لغة ترميز. معيار تسلسل بيانات سهل القراءة بشرياً يُستخدم لملفات التكوين مثل azure.yaml.

## Z

**المنطقة (Zone)**  
مواقع منفصلة فعلياً داخل منطقة Azure توفر التكرار والتوافر العالي.

---

## Common Acronyms

| Acronym | Full Form | Description |
|---------|-----------|-------------|
| AAD | Azure Active Directory (now Microsoft Entra ID) | خدمة إدارة الهوية والوصول |
| ACR | Azure Container Registry | خدمة سجل صور الحاويات |
| AKS | Azure Kubernetes Service | خدمة Kubernetes مُدارة |
| API | Application Programming Interface | مجموعة بروتوكولات لبناء البرمجيات |
| ARM | Azure Resource Manager | خدمة النشر والإدارة في Azure |
| CDN | Content Delivery Network | شبكة موزعة من الخوادم |
| CI/CD | Continuous Integration/Continuous Deployment | ممارسات تطوير مؤتمتة |
| CLI | Command Line Interface | واجهة مستخدم نصية |
| DNS | Domain Name System | نظام لترجمة أسماء النطاقات إلى عناوين IP |
| HTTPS | Hypertext Transfer Protocol Secure | النسخة الآمنة من HTTP |
| IaC | Infrastructure as Code | إدارة البنية التحتية عبر الشيفرة |
| JSON | JavaScript Object Notation | صيغة تبادل بيانات |
| JWT | JSON Web Token | صيغة رمز لنقل المعلومات بأمان |
| KQL | Kusto Query Language | لغة استعلام لخدمات بيانات Azure |
| RBAC | Role-Based Access Control | طريقة تحكم في الوصول تعتمد على الأدوار |
| REST | Representational State Transfer | نمط معماري لخدمات الويب |
| SDK | Software Development Kit | مجموعة أدوات التطوير |
| SLA | Service Level Agreement | التزام بتوافر/أداء الخدمة |
| SQL | Structured Query Language | لغة لإدارة قواعد البيانات العلائقية |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | بروتوكولات تشفير |
| URI | Uniform Resource Identifier | سلسلة تحدد مورداً |
| URL | Uniform Resource Locator | نوع من URI يحدد موقع المورد |
| VM | Virtual Machine | محاكاة لنظام حاسوبي |
| VNet | Virtual Network | شبكة خاصة في Azure |
| YAML | YAML Ain't Markup Language | معيار تسلسل بيانات |

---

## Azure Service Name Mappings

| Common Name | Official Azure Service Name | azd Host Type |
|-------------|------------------------------|---------------|
| Web App | Azure App Service | `appservice` |
| API App | Azure App Service | `appservice` |
| Container App | Azure Container Apps | `containerapp` |
| Function | Azure Functions | `function` |
| Static Site | Azure Static Web Apps | `staticwebapp` |
| Database | Azure Database for PostgreSQL | `postgres` |
| NoSQL DB | Azure Cosmos DB | `cosmosdb` |
| Storage | Azure Storage Account | `storage` |
| Cache | Azure Cache for Redis | `redis` |
| Search | Azure AI Search | `search` |
| Messaging | Azure Service Bus | `servicebus` |

---

## Context-Specific Terms

### Development Terms
- **Hot Reload**: تحديث التطبيقات تلقائياً أثناء التطوير دون الحاجة لإعادة التشغيل
- **Build Pipeline**: عملية مؤتمتة لبناء واختبار الشيفرة
- **Deployment Slot**: بيئة تجربة داخل App Service
- **Environment Parity**: الحفاظ على تشابه بيئات التطوير والتجربة والإنتاج

### Security Terms
- **Managed Identity**: ميزة Azure التي توفر إدارة بيانات اعتماد تلقائية
- **Key Vault**: تخزين آمن للأسرار والمفاتيح والشهادات
- **RBAC**: تحكم بالوصول قائم على الأدوار لموارد Azure
- **Network Security Group**: جدار ناري افتراضي للتحكم بحركة الشبكة

### Monitoring Terms
- **Telemetry**: جمع تلقائي للقياسات والبيانات
- **Application Performance Monitoring (APM)**: مراقبة أداء البرمجيات
- **Log Analytics**: خدمة لجمع وتحليل بيانات السجلات
- **Alert Rules**: إشعارات آلية مبنية على مقاييس أو شروط

### Deployment Terms
- **Blue-Green Deployment**: استراتيجية نشر بدون وقت توقف
- **Canary Deployment**: طرح تدريجي لمجموعة فرعية من المستخدمين
- **Rolling Update**: استبدال متتابع لمثيلات التطبيق
- **Rollback**: الرجوع إلى إصدار سابق من التطبيق

---

**Usage Tip**: استخدم `Ctrl+F` للبحث السريع عن مصطلحات محددة في هذا المسرد. يتم الإشارة إلى المصطلحات ذات الصلة حيثما كان ذلك مناسباً.

---

**Navigation**
- **Previous Lesson**: [Cheat Sheet](cheat-sheet.md)
- **Next Lesson**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنويه**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي والمعتمد. للمعلومات الهامة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->