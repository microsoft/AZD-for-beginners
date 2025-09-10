<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e45896a8acbafead1f195788780a4ab7",
  "translation_date": "2025-09-10T15:57:42+00:00",
  "source_file": "examples/README.md",
  "language_code": "ar"
}
-->
# أمثلة - قوالب وتكوينات عملية لـ AZD

## المقدمة

يحتوي هذا الدليل على أمثلة عملية، قوالب، وسيناريوهات واقعية لمساعدتك على تعلم Azure Developer CLI من خلال الممارسة العملية. كل مثال يقدم كودًا كاملًا يعمل، قوالب بنية تحتية، وتعليمات مفصلة لأنماط نشر مختلفة وهياكل التطبيقات.

## أهداف التعلم

من خلال العمل على هذه الأمثلة، ستتمكن من:
- ممارسة سير العمل الخاص بـ Azure Developer CLI مع سيناريوهات تطبيق واقعية
- فهم هياكل التطبيقات المختلفة وتنفيذها باستخدام azd
- إتقان أنماط البنية التحتية ككود لخدمات Azure المختلفة
- تطبيق إدارة التكوين واستراتيجيات النشر الخاصة بالبيئة
- تنفيذ أنماط المراقبة، الأمان، والتوسع في سياقات عملية
- اكتساب خبرة في استكشاف الأخطاء وإصلاحها في سيناريوهات النشر الواقعية

## نتائج التعلم

عند إكمال هذه الأمثلة، ستكون قادرًا على:
- نشر أنواع مختلفة من التطبيقات باستخدام Azure Developer CLI بثقة
- تعديل القوالب المقدمة لتناسب متطلبات تطبيقك الخاص
- تصميم وتنفيذ أنماط بنية تحتية مخصصة باستخدام Bicep
- تكوين تطبيقات متعددة الخدمات مع الاعتماديات المناسبة
- تطبيق أفضل الممارسات للأمان، المراقبة، والأداء في سيناريوهات واقعية
- استكشاف الأخطاء وإصلاحها وتحسين النشر بناءً على الخبرة العملية

## هيكل الدليل

```
Azure Samples AZD Templates (linked externally):
├── todo-nodejs-mongo/       # Node.js Express with MongoDB
├── todo-csharp-sql-swa-func/ # React SPA with Static Web Apps  
├── container-apps-store-api/ # Python Flask containerized app
├── todo-csharp-sql/         # C# Web API with Azure SQL
├── todo-python-mongo-swa-func/ # Python Functions with Cosmos DB
├── java-microservices-aca-lab/ # Java microservices with Container Apps
└── configurations/          # Common configuration examples
    ├── environment-configs/
    ├── bicep-modules/
    └── scripts/
```

## أمثلة البدء السريع

### للمبتدئين
1. **[تطبيق ويب بسيط - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - نشر تطبيق ويب Node.js Express مع MongoDB  
2. **[موقع ثابت - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - استضافة موقع React ثابت باستخدام Azure Static Web Apps  
3. **[تطبيق حاوية - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - نشر تطبيق Python Flask في حاوية  

### للمستخدمين المتوسطين
4. **[تطبيق قاعدة بيانات - C# مع Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - تطبيق ويب مع API بلغة C# وقاعدة بيانات Azure SQL  
5. **[وظيفة بدون خادم - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - وظائف Azure بلغة Python مع مشغلات HTTP وCosmos DB  
6. **[الخدمات المصغرة - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - تطبيق متعدد الخدمات بلغة Java مع Container Apps وAPI Gateway  

### قوالب Azure AI Foundry

1. **[تطبيق دردشة Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)** - تطبيق دردشة ذكي باستخدام Azure OpenAI  
2. **[معالجة مستندات الذكاء الاصطناعي](https://github.com/Azure-Samples/azure-ai-document-processing)** - تحليل المستندات باستخدام خدمات Azure AI  
3. **[خط أنابيب التعلم الآلي](https://github.com/Azure-Samples/mlops-v2)** - سير عمل MLOps باستخدام Azure Machine Learning  

## 📋 تعليمات الاستخدام

### تشغيل الأمثلة محليًا

1. **نسخ أو استنساخ المثال**  
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **تهيئة بيئة AZD**  
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **تكوين البيئة**  
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **النشر**  
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### تعديل الأمثلة

كل مثال يتضمن:
- **README.md** - تعليمات إعداد وتخصيص مفصلة  
- **azure.yaml** - تكوين AZD مع تعليقات  
- **infra/** - قوالب Bicep مع شرح المعلمات  
- **src/** - كود تطبيق نموذجي  
- **scripts/** - سكربتات مساعدة للمهام الشائعة  

## 🎯 أهداف التعلم

### فئات الأمثلة

#### **النشر الأساسي**
- تطبيقات الخدمة الواحدة  
- أنماط بنية تحتية بسيطة  
- إدارة تكوين أساسية  
- إعدادات تطوير منخفضة التكلفة  

#### **السيناريوهات المتقدمة**
- هياكل متعددة الخدمات  
- تكوينات شبكات معقدة  
- أنماط تكامل قواعد البيانات  
- تنفيذات الأمان والامتثال  

#### **أنماط جاهزة للإنتاج**
- تكوينات عالية التوافر  
- المراقبة والرصد  
- تكامل CI/CD  
- إعدادات استرداد الكوارث  

## 📖 وصف الأمثلة

### تطبيق ويب بسيط - Node.js Express
**التقنيات**: Node.js، Express، MongoDB، Container Apps  
**التعقيد**: مبتدئ  
**المفاهيم**: نشر أساسي، REST API، تكامل قاعدة بيانات NoSQL  

### موقع ثابت - React SPA
**التقنيات**: React، Azure Static Web Apps، Azure Functions، Cosmos DB  
**التعقيد**: مبتدئ  
**المفاهيم**: استضافة ثابتة، واجهة خلفية بدون خادم، تطوير ويب حديث  

### تطبيق حاوية - Python Flask
**التقنيات**: Python Flask، Docker، Container Apps، Container Registry  
**التعقيد**: مبتدئ  
**المفاهيم**: الحاويات، هيكل الخدمات المصغرة، تطوير API  

### تطبيق قاعدة بيانات - C# مع Azure SQL
**التقنيات**: C# ASP.NET Core، Azure SQL Database، App Service  
**التعقيد**: متوسط  
**المفاهيم**: Entity Framework، اتصالات قاعدة البيانات، تطوير API ويب  

### وظيفة بدون خادم - Python Azure Functions
**التقنيات**: Python، Azure Functions، Cosmos DB، Static Web Apps  
**التعقيد**: متوسط  
**المفاهيم**: هيكل مدفوع بالأحداث، الحوسبة بدون خادم، تطوير كامل المكدس  

### الخدمات المصغرة - Java Spring Boot
**التقنيات**: Java Spring Boot، Container Apps، Service Bus، API Gateway  
**التعقيد**: متوسط  
**المفاهيم**: تواصل الخدمات المصغرة، الأنظمة الموزعة، أنماط المؤسسات  

### أمثلة Azure AI Foundry

#### تطبيق دردشة Azure OpenAI
**التقنيات**: Azure OpenAI، Cognitive Search، App Service  
**التعقيد**: متوسط  
**المفاهيم**: هيكل RAG، البحث المتجه، تكامل LLM  

#### معالجة مستندات الذكاء الاصطناعي
**التقنيات**: Azure AI Document Intelligence، Storage، Functions  
**التعقيد**: متوسط  
**المفاهيم**: تحليل المستندات، OCR، استخراج البيانات  

#### خط أنابيب التعلم الآلي
**التقنيات**: Azure ML، MLOps، Container Registry  
**التعقيد**: متقدم  
**المفاهيم**: تدريب النماذج، خطوط النشر، المراقبة  

## 🛠 أمثلة التكوين

يحتوي دليل `configurations/` على مكونات قابلة لإعادة الاستخدام:

### تكوينات البيئة
- إعدادات بيئة التطوير  
- تكوينات بيئة الاختبار  
- تكوينات جاهزة للإنتاج  
- إعدادات النشر متعدد المناطق  

### وحدات Bicep
- مكونات بنية تحتية قابلة لإعادة الاستخدام  
- أنماط موارد شائعة  
- قوالب معززة بالأمان  
- تكوينات منخفضة التكلفة  

### سكربتات مساعدة
- أتمتة إعداد البيئة  
- سكربتات ترحيل قواعد البيانات  
- أدوات التحقق من النشر  
- أدوات مراقبة التكلفة  

## 🔧 دليل التخصيص

### تعديل الأمثلة لتناسب حالتك

1. **مراجعة المتطلبات الأساسية**
   - تحقق من متطلبات خدمات Azure  
   - تأكد من حدود الاشتراك  
   - فهم الآثار المالية  

2. **تعديل التكوين**
   - تحديث تعريفات الخدمات في `azure.yaml`  
   - تخصيص قوالب Bicep  
   - ضبط متغيرات البيئة  

3. **اختبار شامل**
   - النشر أولاً في بيئة التطوير  
   - التحقق من الوظائف  
   - اختبار التوسع والأداء  

4. **مراجعة الأمان**
   - مراجعة ضوابط الوصول  
   - تنفيذ إدارة الأسرار  
   - تفعيل المراقبة والتنبيهات  

## 📊 مصفوفة المقارنة

| المثال | الخدمات | قاعدة البيانات | المصادقة | المراقبة | التعقيد |
|--------|---------|----------------|----------|----------|----------|
| Node.js Express Todo | 2 | ✅ | أساسي | أساسي | ⭐ |
| React SPA + Functions | 3 | ✅ | أساسي | كامل | ⭐ |
| Python Flask Container | 2 | ❌ | أساسي | كامل | ⭐ |
| C# Web API + SQL | 2 | ✅ | كامل | كامل | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | كامل | كامل | ⭐⭐ |
| Java Microservices | 5+ | ✅ | كامل | كامل | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | كامل | كامل | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | أساسي | كامل | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | كامل | كامل | ⭐⭐⭐⭐ |

## 🎓 مسار التعلم

### التقدم الموصى به

1. **ابدأ بتطبيق ويب بسيط**
   - تعلم مفاهيم AZD الأساسية  
   - فهم سير عمل النشر  
   - ممارسة إدارة البيئة  

2. **جرب موقع ثابت**
   - استكشاف خيارات الاستضافة المختلفة  
   - تعلم تكامل CDN  
   - فهم تكوين DNS  

3. **انتقل إلى تطبيق الحاوية**
   - تعلم أساسيات الحاويات  
   - فهم مفاهيم التوسع  
   - ممارسة مع Docker  

4. **أضف تكامل قاعدة البيانات**
   - تعلم توفير قواعد البيانات  
   - فهم سلاسل الاتصال  
   - ممارسة إدارة الأسرار  

5. **استكشف الوظائف بدون خادم**
   - فهم هيكل مدفوع بالأحداث  
   - تعلم عن المشغلات والروابط  
   - ممارسة مع APIs  

6. **قم ببناء الخدمات المصغرة**
   - تعلم تواصل الخدمات  
   - فهم الأنظمة الموزعة  
   - ممارسة النشر المعقد  

## 🔍 العثور على المثال المناسب

### حسب تقنية التطوير
- **Node.js**: تطبيق Node.js Express Todo  
- **Python**: تطبيق Python Flask Container، Python Functions + SPA  
- **C#**: تطبيق C# Web API + SQL Database، تطبيق دردشة Azure OpenAI، خط أنابيب ML  
- **Java**: تطبيق Java Spring Boot Microservices  
- **React**: React SPA + Functions  
- **الحاويات**: Python Flask Container App، Java Microservices  
- **قواعد البيانات**: Node.js + MongoDB، C# + Azure SQL، Python + Cosmos DB  
- **الذكاء الاصطناعي/التعلم الآلي**: تطبيق دردشة Azure OpenAI، معالجة مستندات الذكاء الاصطناعي، خط أنابيب ML  

### حسب نمط الهيكل
- **Monolithic**: Node.js Express Todo، C# Web API + SQL  
- **Static + Serverless**: React SPA + Functions، Python Functions + SPA  
- **Microservices**: Java Spring Boot Microservices  
- **Containerized**: Python Flask Container App  
- **AI-Powered**: تطبيق دردشة Azure OpenAI، معالجة مستندات الذكاء الاصطناعي، خط أنابيب ML  

### حسب مستوى التعقيد
- **مبتدئ**: Node.js Express Todo، React SPA + Functions، Python Flask Container App  
- **متوسط**: C# Web API + SQL، Python Functions + SPA، Java Microservices، تطبيق دردشة Azure OpenAI، معالجة مستندات الذكاء الاصطناعي  
- **متقدم**: خط أنابيب ML  

## 📚 موارد إضافية

### روابط الوثائق
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [قوالب Azure AI Foundry AZD](https://github.com/Azure/ai-foundry-templates)  
- [وثائق Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [مركز Azure للهندسة المعمارية](https://learn.microsoft.com/en-us/azure/architecture/)  

### أمثلة المجتمع
- [قوالب Azure Samples AZD](https://github.com/Azure-Samples/azd-templates)  
- [قوالب Azure AI Foundry](https://github.com/Azure/ai-foundry-templates)  
- [معرض Azure Developer CLI](https://azure.github.io/awesome-azd/)  
- [تطبيق Todo مع C# وAzure SQL](https://github.com/Azure-Samples/todo-csharp-sql)  
- [تطبيق Todo مع Python وMongoDB](https://github.com/Azure-Samples/todo-python-mongo)  
- [تطبيق Todo مع Node.js وPostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)  
- [تطبيق ويب React مع API بلغة C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)  
- [وظيفة Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)  
- [وظائف Azure مع Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)  

### أفضل الممارسات
- [إطار عمل Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)  
- [إطار اعتماد السحابة](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)  

## 🤝 المساهمة بالأمثلة

هل لديك مثال مفيد للمشاركة؟ نحن نرحب بالمساهمات!

### إرشادات التقديم
1. اتبع هيكل الدليل المعتمد  
2. قم بتضمين README.md شامل  
3. أضف تعليقات إلى ملفات التكوين  
4. اختبر جيدًا قبل التقديم  
5. قم بتضمين تقديرات التكلفة والمتطلبات الأساسية  

### هيكل قالب المثال
```
example-name/
├── README.md           # Detailed setup instructions
├── azure.yaml          # AZD configuration
├── infra/              # Infrastructure templates
│   ├── main.bicep
│   └── modules/
├── src/                # Application source code
├── scripts/            # Helper scripts
├── .gitignore         # Git ignore rules
└── docs/              # Additional documentation
```

---

**نصيحة احترافية**: ابدأ بأبسط مثال يناسب تقنية التطوير الخاصة بك، ثم تقدم تدريجيًا إلى السيناريوهات الأكثر تعقيدًا. كل مثال يبني على المفاهيم من الأمثلة السابقة!

**الخطوات التالية**:  
- اختر المثال الذي يناسب مستوى مهاراتك  
- اتبع تعليمات الإعداد في README الخاص بالمثال  
- جرب التخصيصات  
- شارك تعلمك مع المجتمع  

---

**التنقل**  
- **الدرس السابق**: [دليل الدراسة](../resources/study-guide.md)  
- **العودة إلى**: [الصفحة الرئيسية README](../README.md)  

---

**إخلاء المسؤولية**:  
تم ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى لتحقيق الدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو معلومات غير دقيقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الموثوق. للحصول على معلومات حاسمة، يُوصى بالاستعانة بترجمة بشرية احترافية. نحن غير مسؤولين عن أي سوء فهم أو تفسيرات خاطئة تنشأ عن استخدام هذه الترجمة.