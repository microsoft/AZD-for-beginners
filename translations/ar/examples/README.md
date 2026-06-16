# أمثلة - قوالب AZD العملية والتكوينات

**التعلم من خلال الأمثلة - منظم حسب الفصل**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../README.md)
- **📖 خريطة الفصول**: أمثلة منظمة حسب مستوى التعلم
- **🚀 مثال محلي**: [حل متعدد الوكلاء للبيع بالتجزئة](retail-scenario.md)
- **🤖 أمثلة AI خارجية**: روابط لمستودعات Azure Samples

> **📍 مهم: أمثلة محلية مقابل خارجية**  
> يحتوي هذا المستودع على **4 أمثلة محلية كاملة** مع تنفيذات كاملة:  
> - **Microsoft Foundry Models Chat** (نشر gpt-4.1 مع واجهة دردشة)  
> - **Container Apps** (واجهة API بسيطة بـ Flask + خدمات دقيقة)  
> - **Database App** (ويب + قاعدة بيانات SQL)  
> - **Retail Multi-Agent** (حل AI للمؤسسات)  
>  
> الأمثلة الإضافية هي مراجع **خارجية** إلى مستودعات Azure-Samples التي يمكنك استنساخها.

## مقدمة

يوفر هذا الدليل أمثلة عملية ومراجع لمساعدتك على تعلم Azure Developer CLI من خلال الممارسة العملية. سيناريو Retail Multi-Agent هو تنفيذ كامل وجاهز للإنتاج مضمن في هذا المستودع. تشير الأمثلة الإضافية إلى عينات Azure الرسمية التي توضح أنماط AZD المختلفة.

### مقياس التعقيد

- ⭐ **مبتدئ** - مفاهيم أساسية، خدمة واحدة، 15-30 دقيقة
- ⭐⭐ **متوسط** - خدمات متعددة، تكامل قاعدة بيانات، 30-60 دقيقة
- ⭐⭐⭐ **متقدم** - بنية معقدة، تكامل AI، 1-2 ساعة
- ⭐⭐⭐⭐ **خبير** - جاهز للإنتاج، أنماط مؤسسية، أكثر من ساعتين

## 🎯 ما الموجود فعلاً في هذا المستودع

### ✅ تنفيذ محلي (جاهز للاستخدام)

#### [تطبيق دردشة Microsoft Foundry Models](azure-openai-chat/README.md) 🆕
**نشر كامل لـ gpt-4.1 مع واجهة دردشة مضمّنة في هذا المستودع**

- **الموقع:** `examples/azure-openai-chat/`
- **التعقيد:** ⭐⭐ (متوسط)
- **ما هو مضمن:**
  - نشر كامل لـ Microsoft Foundry Models (gpt-4.1)
  - واجهة دردشة سطر أوامر Python
  - تكامل Key Vault لمفاتيح API الآمنة
  - قوالب بنية تحتية Bicep
  - تتبع استخدام الرموز والتكلفة
  - تحديد معدلات الاستخدام ومعالجة الأخطاء

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
**أمثلة شاملة لنشر الحاويات مضمّنة في هذا المستودع**

- **الموقع:** `examples/container-app/`
- **التعقيد:** ⭐-⭐⭐⭐⭐ (من مبتدئ إلى متقدم)
- **ما هو مضمن:**
  - [دليل رئيسي](container-app/README.md) - نظرة عامة كاملة على نشر الحاويات
  - [واجهة Flask API بسيطة](../../../examples/container-app/simple-flask-api) - مثال REST API أساسي
  - [بنية خدمات دقيقة](../../../examples/container-app/microservices) - نشر متعدد الخدمات جاهز للإنتاج
  - أنماط بدء سريع، إنتاج، ومتقدم
  - المراقبة، الأمان، وتحسين التكلفة

**بدء سريع:**
```bash
# عرض الدليل الرئيسي
cd examples/container-app

# نشر واجهة برمجة تطبيقات بسيطة باستخدام Flask
cd simple-flask-api
azd up

# نشر مثال للخدمات المصغرة
cd ../microservices
azd up
```

**التقنيات:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [حل البيع بالتجزئة متعدد الوكلاء](retail-scenario.md) 🆕
**تنفيذ كامل جاهز للإنتاج مضمن في هذا المستودع**

- **الموقع:** `examples/retail-multiagent-arm-template/`
- **التعقيد:** ⭐⭐⭐⭐ (متقدم)
- **ما هو مضمن:**
  - قالب نشر ARM كامل
  - بنية متعددة الوكلاء (العميل + المخزون)
  - تكامل Microsoft Foundry Models
  - بحث AI مع RAG
  - مراقبة شاملة
  - نص نشر بنقرة واحدة

**بدء سريع:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**التقنيات:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 عينات Azure خارجية (استنسخ للاستخدام)

الأمثلة التالية محفوظة في مستودعات Azure-Samples الرسمية. استنسخها لاستكشاف أنماط AZD المختلفة:

### تطبيقات بسيطة (الفصل 1-2)

| قالب | المستودع | التعقيد | الخدمات |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [محلي: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **خدمات دقيقة** | [محلي: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | خدمات متعددة، Service Bus، Cosmos DB، SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**كيفية الاستخدام:**
```bash
# استنسخ أي مثال
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# نشر
azd up
```

### أمثلة تطبيقات AI (الفصول 2، 5، 8)

| قالب | المستودع | التعقيد | التركيز |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [محلي: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | نشر gpt-4.1 |
| **بدء سريع للدردشة AI** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | دردشة AI أساسية |
| **وكلاء AI** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | إطار عمل الوكلاء |
| **عرض Search + OpenAI** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | نمط RAG |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | AI للمؤسسات |

### قواعد بيانات وأنماط متقدمة (الفصول 3-8)

| قالب | المستودع | التعقيد | التركيز |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | تكامل قاعدة البيانات |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL بدون خادم |
| **خدمات دقيقة جافا** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | خدمات متعددة |
| **مسار عمل ML** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## أهداف التعلم

من خلال العمل على هذه الأمثلة، ستتمكن من:
- ممارسة سير عمل Azure Developer CLI باستخدام سيناريوهات تطبيقية واقعية
- فهم هياكل التطبيقات المختلفة وتنفيذاتها في azd
- إتقان أنماط البنية التحتية كرمز للخدمات Azure المختلفة
- تطبيق إدارة التكوين واستراتيجيات النشر الخاصة بالبيئات
- تنفيذ أنماط المراقبة والأمان والتوسع في سياقات عملية
- بناء خبرة في استكشاف المشكلات وتصحيح أخطاء سيناريوهات النشر الحقيقية

## مخرجات التعلم

بعد إكمال هذه الأمثلة، ستكون قادراً على:
- نشر أنواع مختلفة من التطبيقات باستخدام Azure Developer CLI بثقة
- تكييف القوالب المقدمة لتلبية متطلبات تطبيقك الخاصة
- تصميم وتنفيذ أنماط بنية تحتية مخصصة باستخدام Bicep
- تكوين تطبيقات متعددة الخدمات المعقدة مع الاعتمادات المناسبة
- تطبيق ممارسات الأمان والمراقبة والأداء في سيناريوهات حقيقية
- استكشاف وتحسين عمليات النشر بناءً على الخبرة العملية

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

## أمثلة بدء سريعة

> **💡 جديد على AZD؟** ابدأ بالمثال رقم 1 (Flask API) - يستغرق ~20 دقيقة ويعلّم المفاهيم الأساسية.

### للمبتدئين
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (محلي) ⭐  
   انشر REST API بسيط مع خاصية scale-to-zero  
   **الوقت:** 20-25 دقيقة | **التكلفة:** $0-5/شهرياً  
   **ما ستتعلمه:** سير عمل azd الأساسي، حاويات، فحوصات الصحة  
   **النتيجة المتوقعة:** نقطة نهاية API تعمل ترجع "Hello, World!" مع مراقبة

2. **[تطبيق ويب بسيط - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   انشر تطبيق ويب Node.js Express مع MongoDB  
   **الوقت:** 25-35 دقيقة | **التكلفة:** $10-30/شهرياً  
   **ما ستتعلمه:** تكامل قاعدة البيانات، متغيرات البيئة، سلاسل الاتصال  
   **النتيجة المتوقعة:** تطبيق قائمة مهام مع وظائف الإنشاء/القراءة/التحديث/الحذف

3. **[موقع ثابت - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   استضف موقع React ثابت باستخدام Azure Static Web Apps  
   **الوقت:** 20-30 دقيقة | **التكلفة:** $0-10/شهرياً  
   **ما ستتعلمه:** الاستضافة الثابتة، الدوال بدون خادم، نشر CDN  
   **النتيجة المتوقعة:** واجهة React مع واجهة خلفية API، SSL آلي، CDN عالمي

### للمستوى المتوسط
4. **[تطبيق دردشة Microsoft Foundry Models](../../../examples/azure-openai-chat)** (محلي) ⭐⭐  
   انشر gpt-4.1 مع واجهة دردشة وإدارة آمنة لمفتاح API  
   **الوقت:** 35-45 دقيقة | **التكلفة:** $50-200/شهرياً  
   **ما ستتعلمه:** نشر Microsoft Foundry Models، تكامل Key Vault، تتبع الرموز  
   **النتيجة المتوقعة:** تطبيق دردشة يعمل مع gpt-4.1 ومراقبة التكاليف

5. **[Container App - خدمات دقيقة](../../../examples/container-app/microservices)** (محلي) ⭐⭐⭐⭐  
   بنية متعددة الخدمات جاهزة للإنتاج  
   **الوقت:** 45-60 دقيقة | **التكلفة:** $50-150/شهرياً  
   **ما ستتعلمه:** تواصل الخدمات، قوائم الرسائل، التتبع الموزع  
   **النتيجة المتوقعة:** نظام مكوّن من خدمتين (API Gateway + خدمة المنتجات) مع المراقبة

6. **[تطبيق قاعدة بيانات - C# مع Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   تطبيق ويب مع API C# وAzure SQL Database  
   **الوقت:** 30-45 دقيقة | **التكلفة:** $20-80/شهرياً  
   **ما ستتعلمه:** Entity Framework، هجرات القاعدة، أمان الاتصال  
   **النتيجة المتوقعة:** API C# مع خلفية Azure SQL، نشر مخطط تلقائي

7. **[دالة بدون خادم - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions مع مشغلات HTTP وCosmos DB  
   **الوقت:** 30-40 دقيقة | **التكلفة:** $10-40/شهرياً  
   **ما ستتعلمه:** بنية مدفوعة بالأحداث، التوسع بدون خادم، تكامل NoSQL  
   **النتيجة المتوقعة:** تطبيق دالة يستجيب لطلبات HTTP مع تخزين في Cosmos DB

8. **[خدمات دقيقة - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   تطبيق جافا متعدد الخدمات مع Container Apps وAPI gateway  
   **الوقت:** 60-90 دقيقة | **التكلفة:** $80-200/شهرياً  
   **ما ستتعلمه:** نشر Spring Boot، service mesh، موازنة التحميل  
   **النتيجة المتوقعة:** نظام متعدد الخدمات بجافا مع اكتشاف الخدمات والتوجيه

### قوالب Microsoft Foundry

1. **[تطبيق دردشة Microsoft Foundry Models - مثال محلي](../../../examples/azure-openai-chat)** ⭐⭐  
   نشر كامل لـ gpt-4.1 مع واجهة دردشة  
   **الوقت:** 35-45 دقيقة | **التكلفة:** $50-200/شهرياً  
   **النتيجة المتوقعة:** تطبيق دردشة يعمل مع تتبع الرموز ومراقبة التكاليف

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   تطبيق دردشة ذكي ببنية RAG  
   **الوقت:** 60-90 دقيقة | **التكلفة:** $100-300/شهرياً  
   **النتيجة المتوقعة:** واجهة دردشة تعمل بنمط RAG مع بحث المستندات والاستشهادات

3. **[معالجة مستندات AI](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   تحليل المستندات باستخدام خدمات Azure AI  
   **الوقت:** 40-60 دقيقة | **التكلفة:** $20-80/شهرياً  
   **النتيجة المتوقعة:** API يستخرج النص والجداول والكيانات من المستندات المرفوعة

4. **[مسار عمل تعلم الآلة](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   سير عمل MLOps مع Azure Machine Learning  
   **الوقت:** 2-3 ساعات | **التكلفة:** $150-500/شهرياً  
   **النتيجة المتوقعة:** مسار عمل ML تلقائي مع التدريب، النشر، والمراقبة

### سيناريوهات العالم الحقيقي

#### **حل البيع بالتجزئة متعدد الوكلاء** 🆕
**[دليل التنفيذ الكامل](./retail-scenario.md)**

حل دعم عملاء متعدد الوكلاء شامل وجاهز للإنتاج يوضح نشر تطبيق AI بمستوى مؤسسة باستخدام AZD. يوفر هذا السيناريو:

- **بنية كاملة:** نظام متعدد الوكلاء مع وكلاء متخصصين لخدمة العملاء وإدارة المخزون
- **البنية التحتية للإنتاج**: نشرات متعددة المناطق لنماذج Microsoft Foundry، AI Search، Container Apps، ومراقبة شاملة
- **قالب ARM جاهز للنشر**: نشر بنقرة واحدة مع أوضاع تكوين متعددة (Minimal/Standard/Premium)
- **ميزات متقدمة**: اختبار الفريق الأحمر للأمن، إطار تقييم الوكلاء، تحسين التكلفة، وأدلة استكشاف الأخطاء وإصلاحها
- **سياق أعمال حقيقي**: حالة استخدام دعم عملاء لتاجر تجزئة مع تحميل ملفات، تكامل البحث، والتحجيم الديناميكي

**التقنيات**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**التعقيد**: ⭐⭐⭐⭐ (متقدم - جاهز للإنتاج على مستوى المؤسسة)

**مثالي لـ**: مطورو الذكاء الاصطناعي، مهندسو الحلول، والفرق التي تبني أنظمة متعددة الوكلاء للإنتاج

**بدء سريع**: نشر الحل الكامل في أقل من 30 دقيقة باستخدام قالب ARM المضمن مع `./deploy.sh -g myResourceGroup`

## 📋 تعليمات الاستخدام

### المتطلبات المسبقة

قبل تشغيل أي مثال:
- ✅ اشتراك Azure بصلاحية Owner أو Contributor
- ✅ تثبيت Azure Developer CLI ([دليل التثبيت](../docs/chapter-01-foundation/installation.md))
- ✅ تشغيل Docker Desktop (لأمثلة الحاويات)
- ✅ حصص Azure المناسبة (تحقق من متطلبات المثال المحددة)

> **💰 تحذير تكلفة:** تنشئ جميع الأمثلة موارد Azure حقيقية تتسبب في تكاليف. راجع ملفات README الفردية لتقديرات التكلفة. تذكّر تشغيل `azd down` عند الانتهاء لتجنب التكاليف المستمرة.

### تشغيل الأمثلة محليًا

1. **استنساخ أو نسخ المثال**
   ```bash
   # انتقل إلى المثال المطلوب
   cd examples/simple-web-app
   ```

2. **تهيئة بيئة AZD**
   ```bash
   # تهيئة باستخدام قالب موجود
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
   - ✅ نقطة نهاية الخدمة تُعيد HTTP 200
   - ✅ بوابة Azure تعرض حالة "Running"
   - ✅ Application Insights تتلقى القياسات

> **⚠️ مشاكل؟** راجع [المشاكل الشائعة](../docs/chapter-07-troubleshooting/common-issues.md) لاستكشاف أخطاء النشر وإصلاحها

### تكييف الأمثلة

كل مثال يتضمن:
- **README.md** - تعليمات إعداد وتخصيص مفصّلة
- **azure.yaml** - تكوين AZD مع تعليقات
- **infra/** - قوالب Bicep مع شرح المعاملات
- **src/** - كود التطبيق النموذجي
- **scripts/** - سكربتات مساعدة للمهام الشائعة

## 🎯 أهداف التعلم

### فئات الأمثلة

#### **النشرات الأساسية**
- تطبيقات ذات خدمة واحدة
- أنماط بنية تحتية بسيطة
- إدارة التكوين الأساسية
- إعدادات تطوير منخفضة التكلفة

#### **السيناريوهات المتقدمة**
- هندسات متعددة الخدمات
- تكوينات شبكات معقدة
- أنماط تكامل قواعد البيانات
- تنفيذات الأمان والامتثال

#### **أنماط جاهزة للإنتاج**
- تكوينات عالية التوافر
- المراقبة والقدرة على الرصد
- تكامل CI/CD
- إعدادات استعادة الكوارث

## 📖 أوصاف الأمثلة

### تطبيق ويب بسيط - Node.js Express
**التقنيات**: Node.js, Express, MongoDB, Container Apps  
**التعقيد**: مبتدئ  
**المفاهيم**: نشر أساسي، REST API، تكامل قاعدة بيانات NoSQL

### موقع ثابت - React SPA
**التقنيات**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**التعقيد**: مبتدئ  
**المفاهيم**: استضافة ثابتة، backend بدون خوادم، تطوير ويب حديث

### تطبيق حاوية - Python Flask
**التقنيات**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**التعقيد**: مبتدئ  
**المفاهيم**: حاويات، REST API، التحجيم إلى الصفر، فحوصات الصحة، المراقبة  
**الموقع**: [مثال محلي](../../../examples/container-app/simple-flask-api)

### تطبيق حاوية - هندسة الخدمات المصغرة
**التقنيات**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**التعقيد**: متقدم  
**المفاهيم**: هندسة متعددة الخدمات، تواصل الخدمات، قوائم انتظار الرسائل، تتبع موزع  
**الموقع**: [مثال محلي](../../../examples/container-app/microservices)

### تطبيق قاعدة بيانات - C# مع Azure SQL
**التقنيات**: C# ASP.NET Core, Azure SQL Database, App Service  
**التعقيد**: متوسط  
**المفاهيم**: Entity Framework، اتصالات قاعدة البيانات، تطوير Web API

### دالة بدون خوادم - Python Azure Functions
**التقنيات**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**التعقيد**: متوسط  
**المفاهيم**: هندسة مدفوعة بالأحداث، الحوسبة بدون خوادم، تطوير كامل الواجهة

### الخدمات المصغرة - Java Spring Boot
**التقنيات**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**التعقيد**: متوسط  
**المفاهيم**: تواصل الخدمات المصغرة، أنظمة موزعة، أنماط مؤسسية

### أمثلة Microsoft Foundry

#### تطبيق دردشة نماذج Microsoft Foundry
**التقنيات**: Microsoft Foundry Models, Azure AI Search, App Service  
**التعقيد**: متوسط  
**المفاهيم**: هندسة RAG، بحث المتجهات، دمج LLM

#### معالجة المستندات بالذكاء الاصطناعي
**التقنيات**: Azure AI Document Intelligence, Storage, Functions  
**التعقيد**: متوسط  
**المفاهيم**: تحليل المستندات، OCR، استخراج البيانات

#### خط أنابيب تعلم الآلة
**التقنيات**: Azure ML, MLOps, Container Registry  
**التعقيد**: متقدم  
**المفاهيم**: تدريب النماذج، خطوط نشر، المراقبة

## 🛠 أمثلة التكوين

دليل `configurations/` يحتوي على مكونات قابلة لإعادة الاستخدام:

### تكوينات البيئة
- إعدادات بيئة التطوير
- تكوينات بيئة الاختبار
- تكوينات جاهزة للإنتاج
- إعدادات النشر متعددة المناطق

### وحدات Bicep
- مكونات بنية تحتية قابلة لإعادة الاستخدام
- أنماط موارد شائعة
- قوالب معززة للأمان
- تكوينات محسّنة للتكلفة

### سكربتات مساعدة
- أتمتة إعداد البيئة
- سكربتات ترحيل قاعدة البيانات
- أدوات التحقق من النشر
- أدوات مراقبة التكلفة

## 🔧 دليل التخصيص

### تكييف الأمثلة لحالتك

1. **مراجعة المتطلبات المسبقة**
   - تحقق من متطلبات خدمة Azure
   - تحقق من حدود الاشتراك
   - فهم تبعات التكلفة

2. **تعديل التكوين**
   - تحديث تعريفات الخدمة في `azure.yaml`
   - تخصيص قوالب Bicep
   - ضبط متغيرات البيئة

3. **اختبار شامل**
   - انشر في بيئة التطوير أولًا
   - التحقق من الوظائف
   - اختبار التحجيم والأداء

4. **مراجعة الأمان**
   - مراجعة ضوابط الوصول
   - تنفيذ إدارة الأسرار
   - تمكين المراقبة والتنبيه

## 📊 مصفوفة المقارنة

| المثال | الخدمات | قاعدة البيانات | المصادقة | المراقبة | التعقيد |
|--------|---------|----------------|----------|----------|---------|
| **Microsoft Foundry Models Chat** (محلي) | 2 | ❌ | Key Vault | كامل | ⭐⭐ |
| **Python Flask API** (محلي) | 1 | ❌ | أساسي | كامل | ⭐ |
| **Microservices** (محلي) | 5+ | ✅ | مؤسسي | متقدم | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | أساسي | أساسي | ⭐ |
| React SPA + Functions | 3 | ✅ | أساسي | كامل | ⭐ |
| Python Flask Container | 2 | ❌ | أساسي | كامل | ⭐ |
| C# Web API + SQL | 2 | ✅ | كامل | كامل | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | كامل | كامل | ⭐⭐ |
| Java Microservices | 5+ | ✅ | كامل | كامل | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | كامل | كامل | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | أساسي | كامل | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | كامل | كامل | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (محلي) | **8+** | **✅** | **مؤسسي** | **متقدم** | **⭐⭐⭐⭐** |

## 🎓 مسار التعلم

### التدرّج الموصى به

1. **ابدأ بتطبيق ويب بسيط**
   - تعلّم مفاهيم AZD الأساسية
   - فهم سير عمل النشر
   - ممارسة إدارة البيئات

2. **جرّب موقعًا ثابتًا**
   - استكشف خيارات الاستضافة المختلفة
   - تعرّف على تكامل CDN
   - فهم تكوين DNS

3. **انتقل إلى تطبيق حاوية**
   - تعلّم أساسيات الحاويات
   - فهم مفاهيم التحجيم
   - الممارسة باستخدام Docker

4. **أضف تكامل قاعدة بيانات**
   - تعلّم تزويد قواعد البيانات
   - فهم سلاسل الاتصال
   - الممارسة في إدارة الأسرار

5. **استكشف الحوسبة بدون خوادم**
   - فهم هندسة مدفوعة بالأحداث
   - تعلّم عن المشغلات والربط
   - الممارسة مع واجهات برمجة التطبيقات

6. **بِناء الخدمات المصغرة**
   - تعلّم تواصل الخدمات
   - فهم الأنظمة الموزّعة
   - الممارسة في نشرات معقدة

## 🔍 العثور على المثال المناسب

### حسب حزمة التكنولوجيا
- **Container Apps**: [Python Flask API (محلي)](../../../examples/container-app/simple-flask-api), [Microservices (محلي)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: تطبيق Node.js Express Todo، [بوابة API للخدمات المصغرة (محلي)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (محلي)](../../../examples/container-app/simple-flask-api), [خدمة المنتج في الخدمات المصغرة (محلي)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [خدمة الطلب في الخدمات المصغرة (محلي)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [خدمة المستخدم في الخدمات المصغرة (محلي)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (محلي)](../../../examples/container-app/simple-flask-api), [Microservices (محلي)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (محلي)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (محلي)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Microsoft Foundry Models Chat (محلي)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (محلي)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### حسب نمط الهندسة المعمارية
- **Simple REST API**: [Python Flask API (محلي)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo، C# Web API + SQL
- **Static + Serverless**: React SPA + Functions، Python Functions + SPA
- **Microservices**: [Production Microservices (محلي)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (محلي)](../../../examples/container-app/simple-flask-api), [Microservices (محلي)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Microsoft Foundry Models Chat (محلي)](../../../examples/azure-openai-chat)**، Microsoft Foundry Models Chat App، AI Document Processing، ML Pipeline، **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (محلي)](../../../examples/container-app/microservices)، **Retail Multi-Agent Solution**

### حسب مستوى التعقيد
- **Beginner**: [Python Flask API (محلي)](../../../examples/container-app/simple-flask-api)، Node.js Express Todo، React SPA + Functions
- **Intermediate**: **[Microsoft Foundry Models Chat (محلي)](../../../examples/azure-openai-chat)**، C# Web API + SQL، Python Functions + SPA، Java Microservices، Microsoft Foundry Models Chat App، AI Document Processing
- **Advanced**: ML Pipeline
- **Enterprise Production-Ready**: [Microservices (محلي)](../../../examples/container-app/microservices) (متعدد الخدمات مع قوائم انتظار الرسائل)، **Retail Multi-Agent Solution** (نظام متعدد الوكلاء كامل مع نشر بقالب ARM)

## 📚 موارد إضافية

### روابط التوثيق
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### أمثلة من المجتمع
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App with Node.js and PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [تطبيق ويب React مع واجهة برمجة تطبيقات C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [مهمة Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [وظائف Azure بلغة Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### أفضل الممارسات
- [إطار Azure للهندسة الجيدة](https://learn.microsoft.com/en-us/azure/well-architected/)
- [إطار تبني السحابة](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 المساهمة بأمثلة

هل لديك مثال مفيد تريد مشاركته؟ نحن نرحب بالمساهمات!

### إرشادات التقديم
1. اتبع هيكل الدليل المعتمد
2. قم بتضمين README.md الشامل
3. أضف تعليقات إلى ملفات التكوين
4. اختبر بدقة قبل الإرسال
5. قم بتضمين تقديرات التكلفة والمتطلبات المسبقة

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

**نصيحة احترافية**: ابدأ بأبسط مثال يتوافق مع مجموعة تقنياتك، ثم تقدم تدريجيًا إلى سيناريوهات أكثر تعقيدًا. يبني كل مثال على مفاهيم الأمثلة السابقة!

## 🚀 جاهز للبدء؟

### مسارك التعليمي

1. **مبتدئ تمامًا؟** → ابدأ بـ [واجهة برمجة تطبيقات Flask](../../../examples/container-app/simple-flask-api) (⭐، 20 دقيقة)
2. **هل لديك معرفة أساسية بـ AZD؟** → جرّب [الخدمات المصغرة](../../../examples/container-app/microservices) (⭐⭐⭐⭐، 60 دقيقة)
3. **هل تبني تطبيقات ذكاء اصطناعي؟** → ابدأ بـ [دردشة نماذج Microsoft Foundry](../../../examples/azure-openai-chat) (⭐⭐، 35 دقيقة) أو استكشف [متعدد الوكلاء للبيع بالتجزئة](retail-scenario.md) (⭐⭐⭐⭐، أكثر من ساعتين)
4. **هل تحتاج إلى مجموعة تقنيات محددة؟** → استخدم قسم [العثور على المثال المناسب](#-finding-the-right-example) أعلاه

### الخطوات التالية

- ✅ راجع [المتطلبات المسبقة](#المتطلبات-المسبقة) أعلاه
- ✅ اختر مثالًا يطابق مستوى مهارتك (انظر [أسطورة التعقيد](#مقياس-التعقيد))
- ✅ اقرأ ملف README الخاص بالمثال بدقة قبل النشر
- ✅ عيّن تذكيرًا لتشغيل `azd down` بعد الاختبار
- ✅ شارك تجربتك عبر GitHub Issues أو المناقشات

### هل تحتاج مساعدة؟

- 📖 [الأسئلة الشائعة](../resources/faq.md) - إجابات للأسئلة الشائعة
- 🐛 [دليل استكشاف الأخطاء وإصلاحها](../docs/chapter-07-troubleshooting/common-issues.md) - إصلاح مشكلات النشر
- 💬 [مناقشات GitHub](https://github.com/microsoft/AZD-for-beginners/discussions) - اسأل المجتمع
- 📚 [دليل الدراسة](../resources/study-guide.md) - عزز تعلمك

---

**التنقل**
- **📚 Course Home**: [AZD للمبتدئين](../README.md)
- **📖 Study Materials**: [دليل الدراسة](../resources/study-guide.md) | [ملخص](../resources/cheat-sheet.md) | [مسرد المصطلحات](../resources/glossary.md)
- **🔧 Resources**: [الأسئلة الشائعة](../resources/faq.md) | [استكشاف الأخطاء وإصلاحها](../docs/chapter-07-troubleshooting/common-issues.md)

---

*آخر تحديث: نوفمبر 2025 | [الإبلاغ عن المشاكل](https://github.com/microsoft/AZD-for-beginners/issues) | [المساهمة بأمثلة](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنويه**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي والمعتمد. للمعلومات الهامة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->