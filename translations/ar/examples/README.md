# أمثلة - قوالب وتكوينات AZD عملية

**التعلم من خلال الأمثلة - منظم حسب الفصل**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../README.md)
- **📖 خريطة الفصول**: أمثلة منظمة حسب مستوى التعلم
- **🚀 مثال محلي**: [حل متعدد الوكلاء للتجزئة](retail-scenario.md)
- **🤖 أمثلة ذكاء اصطناعي خارجية**: روابط إلى مستودعات Azure Samples

> **📍 مهم: الأمثلة المحلية مقابل الأمثلة الخارجية**  
> هذا المستودع يحتوي على **4 أمثلة محلية كاملة** مع تنفيذات كاملة:  
> - **Microsoft Foundry Models Chat** (نشر gpt-4.1 مع واجهة دردشة)  
> - **Container Apps** (واجهة API بسيطة بـ Flask + خدمات مصغرة)  
> - **Database App** (ويب + قاعدة بيانات SQL)  
> - **Retail Multi-Agent** (حل AI للمؤسسات)  
>  
> الأمثلة الإضافية هي **مراجع خارجية** إلى مستودعات Azure-Samples التي يمكنك استنساخها.

## مقدمة

يوفر هذا الدليل أمثلة عملية ومراجع لمساعدتك على تعلم Azure Developer CLI من خلال التدريب العملي. سيناريو Retail Multi-Agent هو تنفيذ كامل وجاهز للإنتاج مضمّن في هذا المستودع. الأمثلة الإضافية تشير إلى Azure Samples الرسمية التي توضح أنماط AZD المختلفة.

### مفتاح تقييم التعقيد

- ⭐ **مبتدئ** - مفاهيم أساسية، خدمة واحدة، 15-30 دقيقة
- ⭐⭐ **متوسط** - خدمات متعددة، تكامل قواعد بيانات، 30-60 دقيقة
- ⭐⭐⭐ **متقدم** - بنية معقدة، تكامل AI، 1-2 ساعة
- ⭐⭐⭐⭐ **خبير** - جاهز للإنتاج، أنماط المؤسسات، 2+ ساعة

## 🎯 ما الموجود فعليًا في هذا المستودع

### ✅ تنفيذ محلي (جاهز للاستخدام)

#### [Microsoft Foundry Models Chat Application](azure-openai-chat/README.md) 🆕
**نشر كامل لـ gpt-4.1 مع واجهة دردشة مضمنة في هذا المستودع**

- **الموقع:** `examples/azure-openai-chat/`
- **التعقيد:** ⭐⭐ (متوسط)
- **ما الذي يتضمنه:**
  - نشر كامل لـ Microsoft Foundry Models (gpt-4.1)
  - واجهة دردشة سطر أوامر Python
  - تكامل Key Vault لمفاتيح API بأمان
  - قوالب بنية تحتية Bicep
  - تتبّع استخدام الرموز وتكاليفها
  - تحديد معدل الطلبات والتعامل مع الأخطاء

**بدء سريع:**
```bash
# انتقل إلى المثال
cd examples/azure-openai-chat

# انشر كل شيء
azd up

# ثبّت التبعيات وابدأ الدردشة
pip install -r src/requirements.txt
python src/chat.py
```

**التقنيات:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [أمثلة تطبيقات الحاويات](container-app/README.md) 🆕
**أمثلة شاملة لنشر الحاويات مضمنة في هذا المستودع**

- **الموقع:** `examples/container-app/`
- **التعقيد:** ⭐-⭐⭐⭐⭐ (من مبتدئ إلى متقدم)
- **ما الذي يتضمنه:**
  - [مرشد رئيسي](container-app/README.md) - نظرة عامة كاملة على نشر الحاويات
  - [Simple Flask API](../../../examples/container-app/simple-flask-api) - مثال REST API أساسي
  - [Microservices Architecture](../../../examples/container-app/microservices) - نشر متعدد الخدمات جاهز للإنتاج
  - أنماط بدء سريع، إنتاجية، ومتقدمة
  - المراقبة، الأمان، وتحسين التكاليف

**بدء سريع:**
```bash
# عرض الدليل الرئيسي
cd examples/container-app

# نشر واجهة برمجة تطبيقات Flask بسيطة
cd simple-flask-api
azd up

# نشر مثال للخدمات المصغرة
cd ../microservices
azd up
```

**التقنيات:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [حل متعدد الوكلاء للتجزئة](retail-scenario.md) 🆕
**تنفيذ كامل وجاهز للإنتاج مضمن في هذا المستودع**

- **الموقع:** `examples/retail-multiagent-arm-template/`
- **التعقيد:** ⭐⭐⭐⭐ (متقدم)
- **ما الذي يتضمنه:**
  - قالب نشر ARM كامل
  - بنية متعددة الوكلاء (العميل + المخزون)
  - تكامل Microsoft Foundry Models
  - AI Search مع RAG
  - مراقبة شاملة
  - نص نشر بنقرة واحدة

**بدء سريع:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**التقنيات:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 أمثلة Azure خارجية (استنسخ للاستخدام)

الأمثلة التالية محفوظة في مستودعات Azure-Samples الرسمية. استنسخها لاستكشاف أنماط AZD المختلفة:

### تطبيقات بسيطة (الفصلان 1-2)

| Template | Repository | Complexity | Services |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [محلي: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [محلي: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-service, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**كيفية الاستخدام:**
```bash
# انسخ أي مثال
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# نشر
azd up
```

### أمثلة تطبيقات الذكاء الاصطناعي (الفصول 2، 5، 8)

| Template | Repository | Complexity | Focus |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [محلي: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 deployment |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Basic AI chat |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agent framework |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG pattern |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Enterprise AI |

### قواعد بيانات وأنماط متقدمة (الفصول 3-8)

| Template | Repository | Complexity | Focus |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Database integration |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-service |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## أهداف التعلم

من خلال العمل على هذه الأمثلة، ستتمكن من:
- ممارسة تدفقات عمل Azure Developer CLI مع سيناريوهات تطبيقية واقعية
- فهم بنى التطبيقات المختلفة وتنفيذاتها في azd
- إتقان أنماط Infrastructure as Code لخدمات Azure المختلفة
- تطبيق إدارة التكوين واستراتيجيات النشر الخاصة بالبيئة
- تنفيذ أنماط المراقبة، الأمان، والتمدد في سياقات عملية
- بناء خبرة في استكشاف أخطاء النشر وتصحيحها في سيناريوهات حقيقية

## مخرجات التعلم

بعد إكمال هذه الأمثلة، ستكون قادرًا على:
- نشر أنواع تطبيقات مختلفة باستخدام Azure Developer CLI بثقة
- تكييف القوالب المقدمة مع متطلبات تطبيقك الخاصة
- تصميم وتنفيذ أنماط بنية تحتية مخصصة باستخدام Bicep
- تكوين تطبيقات متعددة الخدمات المعقدة مع الاعتماديات الصحيحة
- تطبيق أفضل ممارسات الأمان، المراقبة، والأداء في سيناريوهات حقيقية
- استكشاف أخطاء النشر وتحسينها بناءً على الخبرة العملية

## بنية الدليل

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

## أمثلة بدء سريعة

> **💡 جديد على AZD؟** ابدأ بالمثال رقم 1 (Flask API) - يستغرق ~20 دقيقة ويعلّم المفاهيم الأساسية.

### للمبتدئين
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (محلي) ⭐  
   انشر REST API بسيط مع مبدأ scale-to-zero  
   **الوقت:** 20-25 دقيقة | **التكلفة:** $0-5/شهر  
   **ما ستتعلمه:** سير عمل azd الأساسي، تحزيم الحاويات، فحوصات الصحة  
   **النتيجة المتوقعة:** نقطة نهاية API تعمل تعيد "Hello, World!" مع المراقبة

2. **[تطبيق ويب بسيط - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   انشر تطبيق ويب Node.js Express مع MongoDB  
   **الوقت:** 25-35 دقيقة | **التكلفة:** $10-30/شهر  
   **ما ستتعلمه:** تكامل قواعد البيانات، متغيرات البيئة، سلاسل الاتصال  
   **النتيجة المتوقعة:** تطبيق قائمة مهام مع وظائف الإنشاء/القراءة/التحديث/الحذف

3. **[موقع ثابت - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   استضِف موقع React ثابت باستخدام Azure Static Web Apps  
   **الوقت:** 20-30 دقيقة | **التكلفة:** $0-10/شهر  
   **ما ستتعلمه:** الاستضافة الثابتة، الدوال الخدمية (serverless)، نشر CDN  
   **النتيجة المتوقعة:** واجهة React مع خلفية API، SSL تلقائي، CDN عالمي

### للمستخدمين المتوسطين
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (محلي) ⭐⭐  
   انشر gpt-4.1 مع واجهة دردشة وإدارة آمنة لمفتاح API  
   **الوقت:** 35-45 دقيقة | **التكلفة:** $50-200/شهر  
   **ما ستتعلمه:** نشر Microsoft Foundry Models، تكامل Key Vault، تتبع الرموز  
   **النتيجة المتوقعة:** تطبيق دردشة يعمل بـ gpt-4.1 مع مراقبة التكاليف

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (محلي) ⭐⭐⭐⭐  
   بنية متعددة الخدمات جاهزة للإنتاج  
   **الوقت:** 45-60 دقيقة | **التكلفة:** $50-150/شهر  
   **ما ستتعلمه:** تواصل الخدمات، قوائم الرسائل، التتبع الموزع  
   **النتيجة المتوقعة:** نظام مكوّن من خدمتين (API Gateway + خدمة المنتج) مع المراقبة

6. **[تطبيق قاعدة بيانات - C# مع Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   تطبيق ويب مع API بـ C# وقاعدة بيانات Azure SQL  
   **الوقت:** 30-45 دقيقة | **التكلفة:** $20-80/شهر  
   **ما ستتعلمه:** Entity Framework، هجرات قواعد البيانات، أمان الاتصال  
   **النتيجة المتوقعة:** API بـ C# مع خلفية Azure SQL، نشر تلقائي للمخطط

7. **[دالة بدون خادم - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   دوال Azure بـ Python مع محركات HTTP و Cosmos DB  
   **الوقت:** 30-40 دقيقة | **التكلفة:** $10-40/شهر  
   **ما ستتعلمه:** بنية مدفوعة بالأحداث، التوسع الخالي من الخوادم، تكامل NoSQL  
   **النتيجة المتوقعة:** تطبيق دوال يستجيب لطلبات HTTP مع تخزين في Cosmos DB

8. **[الخدمات المصغرة - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   تطبيق Java متعدد الخدمات مع Container Apps و API gateway  
   **الوقت:** 60-90 دقيقة | **التكلفة:** $80-200/شهر  
   **ما ستتعلمه:** نشر Spring Boot، شبكة خدمات، موازنة الحمل  
   **النتيجة المتوقعة:** نظام متعدد الخدمات بـ Java مع اكتشاف الخدمات والتوجيه

### قوالب Microsoft Foundry

1. **[تطبيق دردشة Microsoft Foundry Models - مثال محلي](../../../examples/azure-openai-chat)** ⭐⭐  
   نشر كامل لـ gpt-4.1 مع واجهة دردشة  
   **الوقت:** 35-45 دقيقة | **التكلفة:** $50-200/شهر  
   **النتيجة المتوقعة:** تطبيق دردشة يعمل مع تتبع الرموز ومراقبة التكاليف

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   تطبيق دردشة ذكي بهيكلية RAG  
   **الوقت:** 60-90 دقيقة | **التكلفة:** $100-300/شهر  
   **النتيجة المتوقعة:** واجهة دردشة تعمل بنمط RAG مع بحث في المستندات واستشهادات

3. **[معالجة المستندات بالذكاء الاصطناعي](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   تحليل المستندات باستخدام خدمات Azure AI  
   **الوقت:** 40-60 دقيقة | **التكلفة:** $20-80/شهر  
   **النتيجة المتوقعة:** API يستخرج النصوص والجداول والكيانات من المستندات المرفوعة

4. **[سير عمل تعلم الآلة](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   سير عمل MLOps مع Azure Machine Learning  
   **الوقت:** 2-3 ساعات | **التكلفة:** $150-500/شهر  
   **النتيجة المتوقعة:** أنبوب ML مؤتمت مع التدريب والنشر والمراقبة

### سيناريوهات من العالم الحقيقي

#### **حل متعدد الوكلاء للتجزئة** 🆕
**[دليل التنفيذ الكامل](./retail-scenario.md)**

حل متعدد الوكلاء شامل وجاهز للإنتاج لدعم العملاء يوضح نشر تطبيقات AI بمستوى مؤسساتي باستخدام AZD. يقدم هذا السيناريو:
- **الهندسة المعمارية الكاملة**: نظام متعدد الوكلاء مع وكلاء متخصصين لخدمة العملاء وإدارة المخزون
- **بنية تحتية للإنتاج**: نشرات Microsoft Foundry Models متعددة المناطق، Azure AI Search، Container Apps، ومراقبة شاملة
- **قالب ARM جاهز للنشر**: نشر بنقرة واحدة مع أوضاع تكوين متعددة (Minimal/Standard/Premium)
- **ميزات متقدمة**: التحقق الأمني بنهج red teaming، إطار تقييم الوكلاء، تحسين التكلفة، وأدلة استكشاف الأخطاء وإصلاحها
- **سياق تجاري حقيقي**: حالة استخدام دعم عملاء لتاجر تجزئة مع تحميل ملفات، تكامل بحث، وتدرج ديناميكي

**التقنيات**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**التعقيد**: ⭐⭐⭐⭐ (متقدم - جاهز للإنتاج المؤسسي)

**مثالي لـ**: مطوري الذكاء الاصطناعي، مهندسي الحلول، والفرق التي تبني أنظمة متعددة الوكلاء للإنتاج

**البدء السريع**: انشر الحل الكامل في أقل من 30 دقيقة باستخدام قالب ARM المرفق مع `./deploy.sh -g myResourceGroup`

## 📋 تعليمات الاستخدام

### المتطلبات المسبقة

قبل تشغيل أي مثال:
- ✅ اشتراك Azure بصلاحية Owner أو Contributor
- ✅ تثبيت Azure Developer CLI ([دليل التثبيت](../docs/chapter-01-foundation/installation.md))
- ✅ تشغيل Docker Desktop (لأمثلة الحاويات)
- ✅ الحصص المناسبة في Azure (تحقق من متطلبات كل مثال)

> **💰 تحذير التكاليف:** جميع الأمثلة تنشئ موارد Azure حقيقية تتكبد رسومًا. راجع ملفات README الفردية لتقديرات التكلفة. تذكر تشغيل `azd down` عند الانتهاء لتجنب التكاليف المستمرة.

### تشغيل الأمثلة محليًا

1. **استنساخ أو نسخ المثال**
   ```bash
   # انتقل إلى المثال المطلوب
   cd examples/simple-web-app
   ```

2. **تهيئة بيئة AZD**
   ```bash
   # التهيئة باستخدام القالب الموجود
   azd init
   
   # أو إنشاء بيئة جديدة
   azd env new my-environment
   ```

3. **تكوين البيئة**
   ```bash
   # تعيين المتغيرات المطلوبة
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **نشر**
   ```bash
   # نشر البنية التحتية والتطبيق
   azd up
   ```

5. **التحقق من النشر**
   ```bash
   # الحصول على نقاط نهاية الخدمة
   azd env get-values
   
   # اختبار نقطة النهاية (مثال)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **مؤشرات النجاح المتوقعة:**
   - ✅ `azd up` يكتمل بدون أخطاء
   - ✅ نقطة نهاية الخدمة تُرجع HTTP 200
   - ✅ بوابة Azure تظهر حالة "Running"
   - ✅ Application Insights يستقبل قياسات

> **⚠️ مشاكل؟** انظر [المشكلات الشائعة](../docs/chapter-07-troubleshooting/common-issues.md) لاستكشاف مشكلات النشر وإصلاحها

### تخصيص الأمثلة

كل مثال يتضمن:
- **README.md** - تعليمات إعداد وتخصيص مفصلة
- **azure.yaml** - تكوين AZD مع تعليقات
- **infra/** - قوالب Bicep مع شرح للمعاملات
- **src/** - كود تطبيق نموذجي
- **scripts/** - سكريبتات مساعدة لمهام شائعة

## 🎯 أهداف التعلم

### فئات الأمثلة

#### **عمليات النشر الأساسية**
- تطبيقات خدمة واحدة
- أنماط بنية تحتية بسيطة
- إدارة التكوين الأساسية
- إعدادات تطوير منخفضة التكلفة

#### **السيناريوهات المتقدمة**
- بنى متعددة الخدمات
- تكوينات شبكات معقدة
- أنماط تكامل قواعد البيانات
- تنفيذات الأمن والامتثال

#### **نماذج جاهزة للإنتاج**
- تكوينات توفر عالٍ
- المراقبة وقابلية الملاحظة
- تكامل CI/CD
- إعدادات استعادة الكوارث

## 📖 وصف الأمثلة

### تطبيق ويب بسيط - Node.js Express
**التقنيات**: Node.js, Express, MongoDB, Container Apps  
**التعقيد**: مبتدئ  
**المفاهيم**: النشر الأساسي، REST API، تكامل قاعدة بيانات NoSQL

### موقع ثابت - React SPA
**التقنيات**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**التعقيد**: مبتدئ  
**المفاهيم**: الاستضافة الثابتة، باكب اند سيرفرلس، تطوير ويب حديث

### Container App - Python Flask
**التقنيات**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**التعقيد**: مبتدئ  
**المفاهيم**: تجزئة الحاويات، REST API، scale-to-zero، فحوصات الصحة، المراقبة  
**الموقع**: [مثال محلي](../../../examples/container-app/simple-flask-api)

### Container App - بنية مايكروسيرفيسز
**التقنيات**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**التعقيد**: متقدم  
**المفاهيم**: بنية متعددة الخدمات، تواصل الخدمات، قوائم الرسائل، تتبع موزع  
**الموقع**: [مثال محلي](../../../examples/container-app/microservices)

### تطبيق قاعدة بيانات - C# مع Azure SQL
**التقنيات**: C# ASP.NET Core, Azure SQL Database, App Service  
**التعقيد**: متوسط  
**المفاهيم**: Entity Framework، اتصالات قاعدة البيانات، تطوير Web API

### دالة سيرفرلس - Python Azure Functions
**التقنيات**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**التعقيد**: متوسط  
**المفاهيم**: بنية مدفوعة بالأحداث، الحوسبة السيرفرلس، تطوير كامل المكدس

### مايكروسيرفيسز - Java Spring Boot
**التقنيات**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**التعقيد**: متوسط  
**المفاهيم**: تواصل المايكروسيرفيسز، الأنظمة الموزعة، أنماط المؤسسات

### أمثلة Microsoft Foundry

#### تطبيق دردشة Microsoft Foundry Models
**التقنيات**: Microsoft Foundry Models, Cognitive Search, App Service  
**التعقيد**: متوسط  
**المفاهيم**: بنية RAG، البحث الاتجاهي (vector search)، تكامل LLM

#### معالجة المستندات بالذكاء الاصطناعي
**التقنيات**: Azure AI Document Intelligence, Storage, Functions  
**التعقيد**: متوسط  
**المفاهيم**: تحليل المستندات، OCR، استخراج البيانات

#### خط أنابيب التعلم الآلي
**التقنيات**: Azure ML, MLOps, Container Registry  
**التعقيد**: متقدم  
**المفاهيم**: تدريب النماذج، خطوط نشر النماذج، المراقبة

## 🛠 أمثلة التكوين

يحتوي الدليل `configurations/` على مكونات قابلة لإعادة الاستخدام:

### تكوينات البيئة
- إعدادات بيئة التطوير
- تكوينات بيئة التجهيز (Staging)
- تكوينات جاهزة للإنتاج
- إعدادات النشر متعددة المناطق

### وحدات Bicep
- مكونات بنية تحتية قابلة لإعادة الاستخدام
- أنماط موارد شائعة
- قوالب محسنة للأمان
- تكوينات محسّنة للتكلفة

### السكريبتات المساعدة
- أتمتة إعداد البيئة
- سكريبتات ترحيل قواعد البيانات
- أدوات تحقق النشر
- أدوات مراقبة التكاليف

## 🔧 دليل التخصيص

### تكييف الأمثلة لحالتك

1. **راجع المتطلبات المسبقة**
   - تحقق من متطلبات خدمات Azure
   - تحقق من حدود الاشتراك
   - افهم تبعات التكلفة

2. **عدّل التكوين**
   - حدّث تعريفات الخدمة في `azure.yaml`
   - خصص قوالب Bicep
   - اضبط متغيرات البيئة

3. **اختبر بدقة**
   - انشر أولًا إلى بيئة التطوير
   - تحقق من الوظائف
   - اختبر التدرج والأداء

4. **مراجعة الأمن**
   - راجع ضوابط الوصول
   - نفّذ إدارة الأسرار
   - فعّل المراقبة والتنبيه

## 📊 مصفوفة المقارنة

| المثال | الخدمات | قاعدة البيانات | المصادقة | المراقبة | التعقيد |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (محلي) | 2 | ❌ | Key Vault | كامل | ⭐⭐ |
| **Python Flask API** (محلي) | 1 | ❌ | أساسي | كامل | ⭐ |
| **مايكروسيرفيسز** (محلي) | 5+ | ✅ | مؤسسي | متقدم | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | أساسي | أساسي | ⭐ |
| React SPA + Functions | 3 | ✅ | أساسي | كامل | ⭐ |
| Python Flask Container | 2 | ❌ | أساسي | كامل | ⭐ |
| C# Web API + SQL | 2 | ✅ | كامل | كامل | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | كامل | كامل | ⭐⭐ |
| Java مايكروسيرفيسز | 5+ | ✅ | كامل | كامل | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | كامل | كامل | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | أساسي | كامل | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | كامل | كامل | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (محلي) | **8+** | **✅** | **مؤسسي** | **متقدم** | **⭐⭐⭐⭐** |

## 🎓 مسار التعلم

### التدرج الموصى به

1. **ابدأ بتطبيق ويب بسيط**
   - تعلّم مفاهيم AZD الأساسية
   - افهم سير عمل النشر
   - مارس إدارة البيئة

2. **جرّب الموقع الثابت**
   - استكشف خيارات الاستضافة المختلفة
   - تعرّف على تكامل CDN
   - افهم تكوين DNS

3. **انتقل إلى Container App**
   - تعلّم أساسيات الحاويات
   - افهم مفاهيم التدرج
   - مارس مع Docker

4. **أضف تكامل قاعدة بيانات**
   - تعلّم provisioning قواعد البيانات
   - افهم سلاسل الاتصال
   - مارس إدارة الأسرار

5. **استكشف السيرفرلس**
   - افهم بنية الأحداث
   - تعلّم عن المشغلات والربط
   - مارس مع APIs

6. **ابنِ مايكروسيرفيسز**
   - تعلّم تواصل الخدمات
   - افهم الأنظمة الموزعة
   - مارس عمليات النشر المعقدة

## 🔍 العثور على المثال المناسب

### حسب مجموعة التقنيات
- **Container Apps**: [Python Flask API (محلي)](../../../examples/container-app/simple-flask-api), [مايكروسيرفيسز (محلي)](../../../examples/container-app/microservices), Java مايكروسيرفيسز
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (محلي)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (محلي)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (محلي)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (محلي)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Microservices User Service (محلي)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **الحاويات**: [Python Flask (محلي)](../../../examples/container-app/simple-flask-api), [مايكروسيرفيسز (محلي)](../../../examples/container-app/microservices), Java مايكروسيرفيسز
- **قواعد البيانات**: [مايكروسيرفيسز (محلي)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (محلي)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **حل تجزئة متعددة الوكلاء للتجزئة**
- **أنظمة متعددة الوكلاء**: **حل تجزئة متعددة الوكلاء للتجزئة**
- **تكامل OpenAI**: **[Microsoft Foundry Models Chat (محلي)](../../../examples/azure-openai-chat)**, حل تجزئة متعددة الوكلاء للتجزئة
- **إنتاج للمؤسسات**: [مايكروسيرفيسز (محلي)](../../../examples/container-app/microservices), **حل تجزئة متعددة الوكلاء للتجزئة**

### حسب نمط البنية
- **REST API بسيط**: [Python Flask API (محلي)](../../../examples/container-app/simple-flask-api)
- **مونوليثي**: Node.js Express Todo, C# Web API + SQL
- **ثابت + سيرفرلس**: React SPA + Functions, Python Functions + SPA
- **مايكروسيرفيسز**: [Production Microservices (محلي)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **محوّل إلى حاويات**: [Python Flask (محلي)](../../../examples/container-app/simple-flask-api), [مايكروسيرفيسز (محلي)](../../../examples/container-app/microservices)
- **مدعوم بالذكاء الاصطناعي**: **[Microsoft Foundry Models Chat (محلي)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **حل تجزئة متعددة الوكلاء للتجزئة**
- **بنية متعددة الوكلاء**: **حل تجزئة متعددة الوكلاء للتجزئة**
- **مؤسسات متعددة الخدمات**: [مايكروسيرفيسز (محلي)](../../../examples/container-app/microservices), **حل تجزئة متعددة الوكلاء للتجزئة**

### حسب مستوى التعقيد
- **مبتدئ**: [Python Flask API (محلي)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **متوسط**: **[Microsoft Foundry Models Chat (محلي)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java مايكروسيرفيسز, Microsoft Foundry Models Chat App, AI Document Processing
- **متقدم**: ML Pipeline
- **جاهز للإنتاج المؤسسي**: [مايكروسيرفيسز (محلي)](../../../examples/container-app/microservices) (متعدد الخدمات مع قوائم رسائل)، **حل تجزئة متعددة الوكلاء للتجزئة** (نظام متعدد الوكلاء متكامل مع قالب ARM للنشر)

## 📚 موارد إضافية

### روابط الوثائق
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### أمثلة المجتمع
- [قوالب Azure Samples AZD](https://github.com/Azure-Samples/azd-templates)
- [قوالب Microsoft Foundry](https://github.com/Azure/ai-foundry-templates)
- [معرض Azure Developer CLI](https://azure.github.io/awesome-azd/)
- [تطبيق Todo بـ C# و Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [تطبيق Todo بـ Python و MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [تطبيق Todo بـ Node.js و PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [تطبيق ويب React مع واجهة برمجة تطبيقات C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [مهمة Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [دوال Azure بلغة Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### أفضل الممارسات
- [إطار العمل Well-Architected الخاص بـ Azure](https://learn.microsoft.com/en-us/azure/well-architected/)
- [إطار اعتماد السحابة](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 المساهمة بأمثلة

هل لديك مثال مفيد للمشاركة؟ نرحب بالمساهمات!

### إرشادات التقديم
1. اتبع بنية الدليل المعتمدة
2. أدرج ملف README.md شامل
3. أضف تعليقات إلى ملفات التكوين
4. اختبر بدقة قبل الإرسال
5. أدرج تقديرات التكلفة والمتطلبات المسبقة

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

**نصيحة احترافية**: ابدأ بأبسط مثال يتطابق مع حزمة تقنياتك، ثم تقدّم تدريجيًا نحو سيناريوهات أكثر تعقيدًا. كل مثال يبني على مفاهيم الأمثلة السابقة!

## 🚀 جاهز للبدء؟

### مسار تعلمك

1. **مبتدئ تمامًا؟** → ابدأ بـ [Flask API](../../../examples/container-app/simple-flask-api) (⭐، 20 دقيقة)
2. **هل لديك معرفة أساسية بـ AZD؟** → جرّب [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐، 60 دقيقة)
3. **هل تبني تطبيقات ذكاء اصطناعي؟** → ابدأ بـ [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐، 35 دقيقة) أو استكشف [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐، أكثر من ساعتين)
4. **هل تحتاج إلى حزمة تقنيات محددة؟** → استخدم قسم [العثور على المثال المناسب](../../../examples) أعلاه

### الخطوات التالية

- ✅ راجع [المتطلبات المسبقة](../../../examples) أعلاه
- ✅ اختر مثالًا يتناسب مع مستوى مهاراتك (راجع [دليل التعقيد](../../../examples))
- ✅ اقرأ ملف README الخاص بالمثال بدقة قبل النشر
- ✅ ضع تذكيرًا لتشغيل `azd down` بعد الاختبار
- ✅ شارك تجربتك عبر GitHub Issues أو Discussions

### هل تحتاج مساعدة؟

- 📖 [الأسئلة الشائعة](../resources/faq.md) - الإجابة على الأسئلة الشائعة
- 🐛 [دليل استكشاف الأخطاء وإصلاحها](../docs/chapter-07-troubleshooting/common-issues.md) - حل مشكلات النشر
- 💬 [نقاشات GitHub](https://github.com/microsoft/AZD-for-beginners/discussions) - اسأل المجتمع
- 📚 [دليل الدراسة](../resources/study-guide.md) - عزز تعلمك

---

**التنقل**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../README.md)
- **📖 مواد الدراسة**: [دليل الدراسة](../resources/study-guide.md) | [ورقة مختصرة](../resources/cheat-sheet.md) | [مسرد المصطلحات](../resources/glossary.md)
- **🔧 الموارد**: [الأسئلة الشائعة](../resources/faq.md) | [استكشاف الأخطاء وإصلاحها](../docs/chapter-07-troubleshooting/common-issues.md)

---

*آخر تحديث: نوفمبر 2025 | [الإبلاغ عن مشكلات](https://github.com/microsoft/AZD-for-beginners/issues) | [المساهمة بأمثلة](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**إخلاء المسؤولية**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى لتحقيق الدقة، يُرجى ملاحظة أن الترجمات الآلية قد تتضمن أخطاء أو عدم دقّة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر المرجعي. بالنسبة للمعلومات الحرجة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن لا نتحمّل أي مسؤولية عن أي سوء فهم أو تفسير خاطئ ينشأ عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->