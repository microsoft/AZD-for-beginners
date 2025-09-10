<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e45896a8acbafead1f195788780a4ab7",
  "translation_date": "2025-09-10T15:59:01+00:00",
  "source_file": "examples/README.md",
  "language_code": "ur"
}
-->
# مثالیں - عملی AZD ٹیمپلیٹس اور کنفیگریشنز

## تعارف

یہ ڈائریکٹری عملی مثالیں، ٹیمپلیٹس، اور حقیقی دنیا کے منظرنامے فراہم کرتی ہے تاکہ آپ Azure Developer CLI کو عملی مشق کے ذریعے سیکھ سکیں۔ ہر مثال مکمل کام کرنے والا کوڈ، انفراسٹرکچر ٹیمپلیٹس، اور مختلف ایپلیکیشن آرکیٹیکچرز اور ڈیپلائمنٹ پیٹرنز کے لیے تفصیلی ہدایات فراہم کرتی ہے۔

## سیکھنے کے مقاصد

ان مثالوں پر کام کرکے آپ:
- Azure Developer CLI ورک فلو کو حقیقی ایپلیکیشن منظرناموں کے ساتھ مشق کریں گے
- مختلف ایپلیکیشن آرکیٹیکچرز اور ان کے azd implementations کو سمجھیں گے
- Azure سروسز کے لیے Infrastructure as Code پیٹرنز میں مہارت حاصل کریں گے
- کنفیگریشن مینجمنٹ اور ماحول کے مطابق ڈیپلائمنٹ حکمت عملیوں کو اپنائیں گے
- عملی تناظر میں مانیٹرنگ، سیکیورٹی، اور اسکیلنگ پیٹرنز کو نافذ کریں گے
- حقیقی ڈیپلائمنٹ منظرناموں کے ساتھ ٹربل شوٹنگ اور ڈیبگنگ کا تجربہ حاصل کریں گے

## سیکھنے کے نتائج

ان مثالوں کو مکمل کرنے کے بعد آپ:
- مختلف ایپلیکیشن اقسام کو Azure Developer CLI کے ذریعے اعتماد کے ساتھ ڈیپلائے کر سکیں گے
- فراہم کردہ ٹیمپلیٹس کو اپنی ایپلیکیشن ضروریات کے مطابق ڈھال سکیں گے
- Bicep کے ذریعے اپنی مرضی کے انفراسٹرکچر پیٹرنز ڈیزائن اور نافذ کر سکیں گے
- پیچیدہ ملٹی سروس ایپلیکیشنز کو مناسب dependencies کے ساتھ کنفیگر کر سکیں گے
- حقیقی منظرناموں میں سیکیورٹی، مانیٹرنگ، اور کارکردگی کے بہترین طریقے اپلائی کر سکیں گے
- عملی تجربے کی بنیاد پر ڈیپلائمنٹ کو ٹربل شوٹ اور بہتر بنا سکیں گے

## ڈائریکٹری کا ڈھانچہ

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

## فوری آغاز کی مثالیں

### ابتدائی افراد کے لیے
1. **[سادہ ویب ایپ - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - Node.js Express ویب ایپلیکیشن کو MongoDB کے ساتھ ڈیپلائے کریں
2. **[اسٹیٹک ویب سائٹ - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - Azure Static Web Apps کے ساتھ React اسٹیٹک ویب سائٹ کی میزبانی کریں
3. **[کنٹینر ایپ - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - کنٹینرائزڈ Python Flask ایپلیکیشن کو ڈیپلائے کریں

### درمیانی سطح کے صارفین کے لیے
4. **[ڈیٹابیس ایپ - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - C# API اور Azure SQL ڈیٹابیس کے ساتھ ویب ایپلیکیشن
5. **[سرور لیس فنکشن - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - HTTP ٹرگرز اور Cosmos DB کے ساتھ Python Azure Functions
6. **[مائیکرو سروسز - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - کنٹینر ایپس اور API گیٹ وے کے ساتھ ملٹی سروس Java ایپلیکیشن

### Azure AI Foundry ٹیمپلیٹس

1. **[Azure OpenAI چیٹ ایپ](https://github.com/Azure-Samples/azure-search-openai-demo)** - Azure OpenAI کے ساتھ ذہین چیٹ ایپلیکیشن
2. **[AI دستاویز پروسیسنگ](https://github.com/Azure-Samples/azure-ai-document-processing)** - Azure AI سروسز کے ذریعے دستاویز کا تجزیہ
3. **[مشین لرننگ پائپ لائن](https://github.com/Azure-Samples/mlops-v2)** - Azure Machine Learning کے ساتھ MLOps ورک فلو

## 📋 استعمال کی ہدایات

### مثالیں مقامی طور پر چلانا

1. **مثال کو کلون یا کاپی کریں**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **AZD ماحول کو انیشیئلائز کریں**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **ماحول کو کنفیگر کریں**
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **ڈیپلائے کریں**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### مثالوں کو اپنانا

ہر مثال میں شامل ہے:
- **README.md** - تفصیلی سیٹ اپ اور حسب ضرورت ہدایات
- **azure.yaml** - AZD کنفیگریشن کے ساتھ تبصرے
- **infra/** - پیرامیٹر وضاحتوں کے ساتھ Bicep ٹیمپلیٹس
- **src/** - نمونہ ایپلیکیشن کوڈ
- **scripts/** - عام کاموں کے لیے مددگار اسکرپٹس

## 🎯 سیکھنے کے مقاصد

### مثالوں کی اقسام

#### **بنیادی ڈیپلائمنٹس**
- سنگل سروس ایپلیکیشنز
- سادہ انفراسٹرکچر پیٹرنز
- بنیادی کنفیگریشن مینجمنٹ
- کم لاگت والے ترقیاتی سیٹ اپ

#### **جدید منظرنامے**
- ملٹی سروس آرکیٹیکچرز
- پیچیدہ نیٹ ورکنگ کنفیگریشنز
- ڈیٹابیس انٹیگریشن پیٹرنز
- سیکیورٹی اور کمپلائنس کے نفاذ

#### **پروڈکشن کے لیے تیار پیٹرنز**
- ہائی ایویلیبیلٹی کنفیگریشنز
- مانیٹرنگ اور مشاہدہ
- CI/CD انٹیگریشن
- ڈیزاسٹر ریکوری سیٹ اپ

## 📖 مثالوں کی وضاحت

### سادہ ویب ایپ - Node.js Express
**ٹیکنالوجیز**: Node.js, Express, MongoDB, Container Apps  
**پیچیدگی**: ابتدائی  
**تصورات**: بنیادی ڈیپلائمنٹ، REST API، NoSQL ڈیٹابیس انٹیگریشن

### اسٹیٹک ویب سائٹ - React SPA
**ٹیکنالوجیز**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**پیچیدگی**: ابتدائی  
**تصورات**: اسٹیٹک ہوسٹنگ، سرور لیس بیک اینڈ، جدید ویب ڈویلپمنٹ

### کنٹینر ایپ - Python Flask
**ٹیکنالوجیز**: Python Flask, Docker, Container Apps, Container Registry  
**پیچیدگی**: ابتدائی  
**تصورات**: کنٹینرائزیشن، مائیکرو سروسز آرکیٹیکچر، API ڈویلپمنٹ

### ڈیٹابیس ایپ - C# with Azure SQL
**ٹیکنالوجیز**: C# ASP.NET Core, Azure SQL Database, App Service  
**پیچیدگی**: درمیانی  
**تصورات**: Entity Framework، ڈیٹابیس کنکشنز، ویب API ڈویلپمنٹ

### سرور لیس فنکشن - Python Azure Functions
**ٹیکنالوجیز**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**پیچیدگی**: درمیانی  
**تصورات**: ایونٹ ڈرائیون آرکیٹیکچر، سرور لیس کمپیوٹنگ، فل اسٹیک ڈویلپمنٹ

### مائیکرو سروسز - Java Spring Boot
**ٹیکنالوجیز**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**پیچیدگی**: درمیانی  
**تصورات**: مائیکرو سروسز کمیونیکیشن، ڈسٹریبیوٹڈ سسٹمز، انٹرپرائز پیٹرنز

### Azure AI Foundry مثالیں

#### Azure OpenAI چیٹ ایپ
**ٹیکنالوجیز**: Azure OpenAI, Cognitive Search, App Service  
**پیچیدگی**: درمیانی  
**تصورات**: RAG آرکیٹیکچر، ویکٹر سرچ، LLM انٹیگریشن

#### AI دستاویز پروسیسنگ
**ٹیکنالوجیز**: Azure AI Document Intelligence, Storage, Functions  
**پیچیدگی**: درمیانی  
**تصورات**: دستاویز کا تجزیہ، OCR، ڈیٹا ایکسٹریکشن

#### مشین لرننگ پائپ لائن
**ٹیکنالوجیز**: Azure ML, MLOps, Container Registry  
**پیچیدگی**: جدید  
**تصورات**: ماڈل ٹریننگ، ڈیپلائمنٹ پائپ لائنز، مانیٹرنگ

## 🛠 کنفیگریشن کی مثالیں

`configurations/` ڈائریکٹری میں دوبارہ استعمال کے قابل اجزاء شامل ہیں:

### ماحول کی کنفیگریشنز
- ترقیاتی ماحول کی ترتیبات
- اسٹیجنگ ماحول کی کنفیگریشنز
- پروڈکشن کے لیے تیار کنفیگریشنز
- ملٹی ریجن ڈیپلائمنٹ سیٹ اپ

### Bicep ماڈیولز
- دوبارہ استعمال کے قابل انفراسٹرکچر اجزاء
- عام وسائل کے پیٹرنز
- سیکیورٹی سے محفوظ ٹیمپلیٹس
- کم لاگت والے کنفیگریشنز

### مددگار اسکرپٹس
- ماحول کی سیٹ اپ آٹومیشن
- ڈیٹابیس مائیگریشن اسکرپٹس
- ڈیپلائمنٹ ویلیڈیشن ٹولز
- لاگت کی نگرانی کے یوٹیلیٹیز

## 🔧 حسب ضرورت گائیڈ

### اپنی ضروریات کے لیے مثالوں کو اپنانا

1. **پیشگی شرائط کا جائزہ لیں**
   - Azure سروسز کی ضروریات چیک کریں
   - سبسکرپشن کی حدود کی تصدیق کریں
   - لاگت کے اثرات کو سمجھیں

2. **کنفیگریشن میں ترمیم کریں**
   - `azure.yaml` سروس ڈیفینیشنز کو اپ ڈیٹ کریں
   - Bicep ٹیمپلیٹس کو حسب ضرورت بنائیں
   - ماحول کے متغیرات کو ایڈجسٹ کریں

3. **مکمل طور پر ٹیسٹ کریں**
   - پہلے ترقیاتی ماحول میں ڈیپلائے کریں
   - فعالیت کی تصدیق کریں
   - اسکیلنگ اور کارکردگی کا ٹیسٹ کریں

4. **سیکیورٹی کا جائزہ لیں**
   - رسائی کنٹرولز کا جائزہ لیں
   - سیکریٹس مینجمنٹ نافذ کریں
   - مانیٹرنگ اور الرٹنگ کو فعال کریں

## 📊 موازنہ میٹرکس

| مثال | سروسز | ڈیٹابیس | تصدیق | مانیٹرنگ | پیچیدگی |
|---------|----------|----------|------|------------|------------|
| Node.js Express Todo | 2 | ✅ | بنیادی | بنیادی | ⭐ |
| React SPA + Functions | 3 | ✅ | بنیادی | مکمل | ⭐ |
| Python Flask Container | 2 | ❌ | بنیادی | مکمل | ⭐ |
| C# Web API + SQL | 2 | ✅ | مکمل | مکمل | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | مکمل | مکمل | ⭐⭐ |
| Java Microservices | 5+ | ✅ | مکمل | مکمل | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | مکمل | مکمل | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | بنیادی | مکمل | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | مکمل | مکمل | ⭐⭐⭐⭐ |

## 🎓 سیکھنے کا راستہ

### تجویز کردہ ترقی

1. **سادہ ویب ایپ سے شروع کریں**
   - بنیادی AZD تصورات سیکھیں
   - ڈیپلائمنٹ ورک فلو کو سمجھیں
   - ماحول کے انتظام کی مشق کریں

2. **اسٹیٹک ویب سائٹ آزمائیں**
   - مختلف ہوسٹنگ آپشنز کو دریافت کریں
   - CDN انٹیگریشن سیکھیں
   - DNS کنفیگریشن کو سمجھیں

3. **کنٹینر ایپ پر جائیں**
   - کنٹینرائزیشن کی بنیادی باتیں سیکھیں
   - اسکیلنگ تصورات کو سمجھیں
   - Docker کے ساتھ مشق کریں

4. **ڈیٹابیس انٹیگریشن شامل کریں**
   - ڈیٹابیس پروویژننگ سیکھیں
   - کنکشن اسٹرنگز کو سمجھیں
   - سیکریٹس مینجمنٹ کی مشق کریں

5. **سرور لیس کو دریافت کریں**
   - ایونٹ ڈرائیون آرکیٹیکچر کو سمجھیں
   - ٹرگرز اور بائنڈنگز کے بارے میں سیکھیں
   - APIs کے ساتھ مشق کریں

6. **مائیکرو سروسز بنائیں**
   - سروس کمیونیکیشن سیکھیں
   - ڈسٹریبیوٹڈ سسٹمز کو سمجھیں
   - پیچیدہ ڈیپلائمنٹس کی مشق کریں

## 🔍 صحیح مثال تلاش کرنا

### ٹیکنالوجی اسٹیک کے لحاظ سے
- **Node.js**: Node.js Express Todo App
- **Python**: Python Flask Container App, Python Functions + SPA
- **C#**: C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: Python Flask Container App, Java Microservices
- **Databases**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline

### آرکیٹیکچر پیٹرن کے لحاظ سے
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: Java Spring Boot Microservices
- **Containerized**: Python Flask Container App
- **AI-Powered**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline

### پیچیدگی کی سطح کے لحاظ سے
- **ابتدائی**: Node.js Express Todo, React SPA + Functions, Python Flask Container App
- **درمیانی**: C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **جدید**: ML Pipeline

## 📚 اضافی وسائل

### دستاویزات کے لنکس
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### کمیونٹی مثالیں
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App with Node.js and PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web App with C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions with Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### بہترین طریقے
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 مثالیں پیش کرنا

کیا آپ کے پاس کوئی مفید مثال ہے؟ ہم تعاون کا خیر مقدم کرتے ہیں!

### جمع کرانے کے رہنما اصول
1. قائم کردہ ڈائریکٹری ڈھانچے کی پیروی کریں
2. جامع README.md شامل کریں
3. کنفیگریشن فائلوں میں تبصرے شامل کریں
4. جمع کرانے سے پہلے مکمل طور پر ٹیسٹ کریں
5. لاگت کے تخمینے اور پیشگی شرائط شامل کریں

### مثال ٹیمپلیٹ ڈھانچہ
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

**پرو ٹپ**: اپنی ٹیکنالوجی اسٹیک سے مطابقت رکھنے والی سب سے آسان مثال سے شروع کریں، پھر آہستہ آہستہ زیادہ پیچیدہ منظرناموں کی طرف بڑھیں۔ ہر مثال پچھلی مثالوں کے تصورات پر مبنی ہے!

**اگلے اقدامات**: 
- اپنی مہارت کی سطح سے مطابقت رکھنے والی مثال منتخب کریں
- مثال کے README میں دی گئی سیٹ اپ ہدایات پر عمل کریں
- حسب ضرورت کے ساتھ تجربہ کریں
- اپنی سیکھنے کو کمیونٹی کے ساتھ شیئر کریں

---

**نیویگیشن**
- **پچھلا سبق**: [مطالعہ گائیڈ](../resources/study-guide.md)
- **واپس جائیں**: [مین README](../README.md)

---

**ڈسکلیمر**:  
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کا استعمال کرتے ہوئے ترجمہ کی گئی ہے۔ ہم درستگی کے لیے کوشش کرتے ہیں، لیکن براہ کرم آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا غیر درستیاں ہو سکتی ہیں۔ اصل دستاویز کو اس کی اصل زبان میں مستند ذریعہ سمجھا جانا چاہیے۔ اہم معلومات کے لیے، پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ ہم اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کے ذمہ دار نہیں ہیں۔