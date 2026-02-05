# مثالیں - عملی AZD ٹیمپلیٹس اور کنفیگریشنز

**مثالوں کے ذریعے سیکھنا - باب کے لحاظ سے ترتیب دیا گیا**
- **📚 کورس ہوم**: [AZD ابتدائی افراد کے لیے](../README.md)
- **📖 باب کی ترتیب**: سیکھنے کی پیچیدگی کے لحاظ سے ترتیب دی گئی مثالیں
- **🚀 مقامی مثال**: [ریٹیل ملٹی ایجنٹ حل](retail-scenario.md)
- **🤖 بیرونی AI مثالیں**: Azure Samples ریپوزیٹریز کے لنکس

> **📍 اہم: مقامی بمقابلہ بیرونی مثالیں**  
> اس ریپوزیٹری میں **4 مکمل مقامی مثالیں** شامل ہیں جن میں مکمل عمل درآمد موجود ہے:  
> - **Azure OpenAI چیٹ** (GPT-4 ڈپلائمنٹ کے ساتھ چیٹ انٹرفیس)  
> - **کنٹینر ایپس** (سادہ Flask API + مائیکرو سروسز)  
> - **ڈیٹا بیس ایپ** (ویب + SQL ڈیٹا بیس)  
> - **ریٹیل ملٹی ایجنٹ** (انٹرپرائز AI حل)  
>  
> اضافی مثالیں Azure-Samples ریپوزیٹریز کے بیرونی حوالہ جات ہیں جنہیں آپ کلون کر سکتے ہیں۔

## تعارف

یہ ڈائریکٹری عملی مثالیں اور حوالہ جات فراہم کرتی ہے تاکہ آپ Azure Developer CLI کو عملی مشق کے ذریعے سیکھ سکیں۔ ریٹیل ملٹی ایجنٹ منظر نامہ ایک مکمل، پروڈکشن کے لیے تیار عمل درآمد ہے جو اس ریپوزیٹری میں شامل ہے۔ اضافی مثالیں مختلف AZD پیٹرنز کو ظاہر کرنے والے آفیشل Azure Samples کا حوالہ دیتی ہیں۔

### پیچیدگی کی درجہ بندی کی علامات

- ⭐ **ابتدائی** - بنیادی تصورات، سنگل سروس، 15-30 منٹ
- ⭐⭐ **درمیانی** - متعدد سروسز، ڈیٹا بیس انٹیگریشن، 30-60 منٹ
- ⭐⭐⭐ **اعلی درجے کی** - پیچیدہ آرکیٹیکچر، AI انٹیگریشن، 1-2 گھنٹے
- ⭐⭐⭐⭐ **ماہر** - پروڈکشن کے لیے تیار، انٹرپرائز پیٹرنز، 2+ گھنٹے

## 🎯 اس ریپوزیٹری میں اصل میں کیا ہے

### ✅ مقامی عمل درآمد (استعمال کے لیے تیار)

#### [Azure OpenAI چیٹ ایپلیکیشن](azure-openai-chat/README.md) 🆕
**GPT-4 ڈپلائمنٹ کے ساتھ مکمل چیٹ انٹرفیس اس ریپوزیٹری میں شامل ہے**

- **مقام:** `examples/azure-openai-chat/`
- **پیچیدگی:** ⭐⭐ (درمیانی)
- **شامل کردہ مواد:**
  - مکمل Azure OpenAI ڈپلائمنٹ (GPT-4)
  - Python کمانڈ لائن چیٹ انٹرفیس
  - Key Vault انٹیگریشن محفوظ API کیز کے لیے
  - Bicep انفراسٹرکچر ٹیمپلیٹس
  - ٹوکن استعمال اور لاگت کی ٹریکنگ
  - ریٹ لیمیٹنگ اور ایرر ہینڈلنگ

**فوری آغاز:**
```bash
# مثال پر جائیں
cd examples/azure-openai-chat

# سب کچھ تعینات کریں
azd up

# انحصارات انسٹال کریں اور چیٹنگ شروع کریں
pip install -r src/requirements.txt
python src/chat.py
```

**ٹیکنالوجیز:** Azure OpenAI، GPT-4، Key Vault، Python، Bicep

#### [کنٹینر ایپ مثالیں](container-app/README.md) 🆕
**جامع کنٹینر ڈپلائمنٹ مثالیں اس ریپوزیٹری میں شامل ہیں**

- **مقام:** `examples/container-app/`
- **پیچیدگی:** ⭐-⭐⭐⭐⭐ (ابتدائی سے ماہر)
- **شامل کردہ مواد:**
  - [ماسٹر گائیڈ](container-app/README.md) - کنٹینر ڈپلائمنٹ کا مکمل جائزہ
  - [سادہ Flask API](../../../examples/container-app/simple-flask-api) - بنیادی REST API مثال
  - [مائیکرو سروسز آرکیٹیکچر](../../../examples/container-app/microservices) - پروڈکشن کے لیے تیار ملٹی سروس ڈپلائمنٹ
  - فوری آغاز، پروڈکشن، اور اعلی درجے کے پیٹرنز
  - مانیٹرنگ، سیکیورٹی، اور لاگت کی اصلاح

**فوری آغاز:**
```bash
# ماسٹر گائیڈ دیکھیں
cd examples/container-app

# سادہ فلاسک API تعینات کریں
cd simple-flask-api
azd up

# مائیکروسروسز کی مثال تعینات کریں
cd ../microservices
azd up
```

**ٹیکنالوجیز:** Azure Container Apps، Docker، Python Flask، Node.js، C#، Go، Application Insights

#### [ریٹیل ملٹی ایجنٹ حل](retail-scenario.md) 🆕
**پروڈکشن کے لیے تیار مکمل عمل درآمد اس ریپوزیٹری میں شامل ہے**

- **مقام:** `examples/retail-multiagent-arm-template/`
- **پیچیدگی:** ⭐⭐⭐⭐ (اعلی درجے کی)
- **شامل کردہ مواد:**
  - مکمل ARM ڈپلائمنٹ ٹیمپلیٹ
  - ملٹی ایجنٹ آرکیٹیکچر (کسٹمر + انوینٹری)
  - Azure OpenAI انٹیگریشن
  - AI سرچ RAG کے ساتھ
  - جامع مانیٹرنگ
  - ون کلک ڈپلائمنٹ اسکرپٹ

**فوری آغاز:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**ٹیکنالوجیز:** Azure OpenAI، AI سرچ، Container Apps، Cosmos DB، Application Insights

---

## 🔗 بیرونی Azure Samples (استعمال کے لیے کلون کریں)

ذیل کی مثالیں آفیشل Azure-Samples ریپوزیٹریز میں موجود ہیں۔ انہیں مختلف AZD پیٹرنز کو دریافت کرنے کے لیے کلون کریں:

### سادہ ایپلیکیشنز (باب 1-2)

| ٹیمپلیٹ | ریپوزیٹری | پیچیدگی | سروسز |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [مقامی: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python، Container Apps، Application Insights |
| **مائیکرو سروسز** | [مقامی: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | ملٹی سروس، Service Bus، Cosmos DB، SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express، Cosmos DB، Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps، Functions، SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python، Container Apps، API |

**استعمال کا طریقہ:**
```bash
# کسی بھی مثال کو کلون کریں
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# تعین کریں
azd up
```

### AI ایپلیکیشن مثالیں (باب 2، 5، 8)

| ٹیمپلیٹ | ریپوزیٹری | پیچیدگی | فوکس |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI چیٹ** | [مقامی: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | GPT-4 ڈپلائمنٹ |
| **AI چیٹ کوئیک اسٹارٹ** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | بنیادی AI چیٹ |
| **AI ایجنٹس** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | ایجنٹ فریم ورک |
| **سرچ + OpenAI ڈیمو** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG پیٹرن |
| **Contoso چیٹ** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | انٹرپرائز AI |

### ڈیٹا بیس اور اعلی درجے کے پیٹرنز (باب 3-8)

| ٹیمپلیٹ | ریپوزیٹری | پیچیدگی | فوکس |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | ڈیٹا بیس انٹیگریشن |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL سرور لیس |
| **Java مائیکرو سروسز** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | ملٹی سروس |
| **ML پائپ لائن** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## سیکھنے کے اہداف

ان مثالوں پر کام کر کے، آپ:
- Azure Developer CLI ورک فلو کو حقیقت پسندانہ ایپلیکیشن منظرناموں کے ساتھ مشق کریں گے
- مختلف ایپلیکیشن آرکیٹیکچرز اور ان کے azd عمل درآمد کو سمجھیں گے
- مختلف Azure سروسز کے لیے انفراسٹرکچر از کوڈ پیٹرنز میں مہارت حاصل کریں گے
- کنفیگریشن مینجمنٹ اور ماحول کے مخصوص ڈپلائمنٹ حکمت عملیوں کو نافذ کریں گے
- عملی سیاق و سباق میں مانیٹرنگ، سیکیورٹی، اور اسکیلنگ پیٹرنز کو نافذ کریں گے
- حقیقی ڈپلائمنٹ منظرناموں کو ٹربل شوٹ اور ڈیبگ کرنے کا تجربہ حاصل کریں گے

## سیکھنے کے نتائج

ان مثالوں کو مکمل کرنے کے بعد، آپ:
- مختلف ایپلیکیشن اقسام کو Azure Developer CLI کے ذریعے اعتماد کے ساتھ ڈپلائے کریں گے
- فراہم کردہ ٹیمپلیٹس کو اپنی ایپلیکیشن کی ضروریات کے مطابق ڈھال سکیں گے
- Bicep کا استعمال کرتے ہوئے کسٹم انفراسٹرکچر پیٹرنز کو ڈیزائن اور نافذ کریں گے
- مناسب ڈیپینڈنسیز کے ساتھ پیچیدہ ملٹی سروس ایپلیکیشنز کو کنفیگر کریں گے
- حقیقی منظرناموں میں سیکیورٹی، مانیٹرنگ، اور کارکردگی کے بہترین طریقوں کو نافذ کریں گے
- عملی تجربے کی بنیاد پر ڈپلائمنٹ کو ٹربل شوٹ اور بہتر بنائیں گے

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

## فوری آغاز مثالیں

> **💡 AZD کے لیے نئے ہیں؟** مثال #1 (Flask API) سے شروع کریں - یہ تقریباً 20 منٹ لیتی ہے اور بنیادی تصورات سکھاتی ہے۔

### ابتدائی افراد کے لیے
1. **[کنٹینر ایپ - Python Flask API](../../../examples/container-app/simple-flask-api)** (مقامی) ⭐  
   ایک سادہ REST API کو اسکیل ٹو زیرو کے ساتھ ڈپلائے کریں  
   **وقت:** 20-25 منٹ | **لاگت:** $0-5/ماہ  
   **آپ سیکھیں گے:** بنیادی azd ورک فلو، کنٹینرائزیشن، ہیلتھ پروبز  
   **متوقع نتیجہ:** کام کرنے والا API اینڈ پوائنٹ "Hello, World!" واپس کرے گا، مانیٹرنگ کے ساتھ

2. **[سادہ ویب ایپ - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   ایک Node.js Express ویب ایپلیکیشن کو MongoDB کے ساتھ ڈپلائے کریں  
   **وقت:** 25-35 منٹ | **لاگت:** $10-30/ماہ  
   **آپ سیکھیں گے:** ڈیٹا بیس انٹیگریشن، ماحول کے متغیرات، کنکشن اسٹرنگز  
   **متوقع نتیجہ:** ٹوڈو لسٹ ایپ جس میں تخلیق/پڑھنا/اپ ڈیٹ/حذف کی فعالیت ہوگی

3. **[اسٹیک ویب سائٹ - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Azure Static Web Apps کے ساتھ React اسٹیک ویب سائٹ کی میزبانی کریں  
   **وقت:** 20-30 منٹ | **لاگت:** $0-10/ماہ  
   **آپ سیکھیں گے:** اسٹیک ہوسٹنگ، سرور لیس فنکشنز، CDN ڈپلائمنٹ  
   **متوقع نتیجہ:** React UI کے ساتھ API بیک اینڈ، خودکار SSL، عالمی CDN

### درمیانی صارفین کے لیے
4. **[Azure OpenAI چیٹ ایپلیکیشن](../../../examples/azure-openai-chat)** (مقامی) ⭐⭐  
   GPT-4 کو چیٹ انٹرفیس اور محفوظ API کی مینجمنٹ کے ساتھ ڈپلائے کریں  
   **وقت:** 35-45 منٹ | **لاگت:** $50-200/ماہ  
   **آپ سیکھیں گے:** Azure OpenAI ڈپلائمنٹ، Key Vault انٹیگریشن، ٹوکن ٹریکنگ  
   **متوقع نتیجہ:** کام کرنے والی چیٹ ایپلیکیشن GPT-4 کے ساتھ اور لاگت کی مانیٹرنگ

5. **[کنٹینر ایپ - مائیکرو سروسز](../../../examples/container-app/microservices)** (مقامی) ⭐⭐⭐⭐  
   پروڈکشن کے لیے تیار ملٹی سروس آرکیٹیکچر  
   **وقت:** 45-60 منٹ | **لاگت:** $50-150/ماہ  
   **آپ سیکھیں گے:** سروس کمیونیکیشن، میسج کیوئنگ، ڈسٹریبیوٹڈ ٹریسنگ  
   **متوقع نتیجہ:** 2-سروس سسٹم (API گیٹ وے + پروڈکٹ سروس) مانیٹرنگ کے ساتھ

6. **[ڈیٹا بیس ایپ - C# Azure SQL کے ساتھ](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   C# API اور Azure SQL ڈیٹا بیس کے ساتھ ویب ایپلیکیشن  
   **وقت:** 30-45 منٹ | **لاگت:** $20-80/ماہ  
   **آپ سیکھیں گے:** Entity Framework، ڈیٹا بیس مائیگریشنز، کنکشن سیکیورٹی  
   **متوقع نتیجہ:** C# API Azure SQL بیک اینڈ کے ساتھ، خودکار اسکیمہ ڈپلائمنٹ

7. **[سرور لیس فنکشن - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   HTTP ٹرگرز اور Cosmos DB کے ساتھ Python Azure Functions  
   **وقت:** 30-40 منٹ | **لاگت:** $10-40/ماہ  
   **آپ سیکھیں گے:** ایونٹ ڈرائیون آرکیٹیکچر، سرور لیس اسکیلنگ، NoSQL انٹیگریشن  
   **متوقع نتیجہ:** HTTP درخواستوں کا جواب دینے والی فنکشن ایپ Cosmos DB اسٹوریج کے ساتھ

8. **[مائیکرو سروسز - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   ملٹی سروس Java ایپلیکیشن Container Apps اور API گیٹ وے کے ساتھ  
   **وقت:** 60-90 منٹ | **لاگت:** $80-200/ماہ  
   **آپ سیکھیں گے:** Spring Boot ڈپلائمنٹ، سروس میش، لوڈ بیلنسنگ  
   **متوقع نتیجہ:** ملٹی سروس Java سسٹم سروس ڈسکوری اور روٹنگ کے ساتھ

### Azure AI Foundry ٹیمپلیٹس

1. **[Azure OpenAI چیٹ ایپ - مقامی مثال](../../../examples/azure-openai-chat)** ⭐⭐  
   GPT-4 ڈپلائمنٹ کے ساتھ مکمل چیٹ انٹرفیس  
   **وقت:** 35-45 منٹ | **لاگت:** $50-200/ماہ  
   **متوقع نتیجہ:** کام کرنے والی چیٹ ایپلیکیشن ٹوکن ٹریکنگ اور لاگت کی مانیٹرنگ کے ساتھ

2. **[Azure سرچ + OpenAI ڈیمو](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   RAG آرکیٹیکچر کے ساتھ ذہین چیٹ ایپلیکیشن  
   **وقت:** 60-90 منٹ | **لاگت:** $100-300/ماہ  
   **متوقع نتیجہ:** RAG پاورڈ چیٹ انٹرفیس دستاویز سرچ اور حوالہ جات کے ساتھ

3. **[AI دستاویز پروسیسنگ](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Azure AI سروسز کا استعمال کرتے ہوئے دستاویز تجزیہ  
   **وقت:** 40-60 منٹ | **لاگت:** $20-80/ماہ  
   **متوقع نتیجہ:** اپلوڈ کردہ دستاویزات سے متن، ٹیبلز، اور اینٹٹیز نکالنے والا API

4. **[مشین لرننگ پائپ لائن](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Azure Machine Learning کے ساتھ MLOps ورک فلو  
   **وقت:** 2-3 گھنٹے | **لاگت:** $150-500/ماہ  
   **متوقع نتیجہ:** تربیت، ڈپلائمنٹ، اور مانیٹرنگ کے ساتھ خودکار ML پائپ لائن

### حقیقی دنیا کے منظرنامے

#### **ریٹیل ملٹی ایجنٹ حل** 🆕
**[مکمل عمل درآمد گائیڈ](./retail-scenario.md)**

ایک جامع، پروڈکشن کے لیے تیار ملٹی ایجنٹ کسٹمر سپورٹ حل جو انٹرپرائز گریڈ AI ایپلیکیشن ڈپلائمنٹ کو AZD کے ساتھ ظاہر کرتا ہے۔ یہ منظرنامہ فراہم کرتا ہے:

- **مکمل آرکیٹیکچر
- **پروڈکشن انفراسٹرکچر**: ملٹی ریجن Azure OpenAI ڈیپلائمنٹس، AI سرچ، کنٹینر ایپس، اور جامع مانیٹرنگ  
- **ریڈی ٹو ڈیپلائے ARM ٹیمپلیٹ**: ایک کلک میں ڈیپلائمنٹ، مختلف کنفیگریشن موڈز (منیمم/اسٹینڈرڈ/پریمیم)  
- **ایڈوانسڈ فیچرز**: ریڈ ٹیمنگ سیکیورٹی ویلیڈیشن، ایجنٹ ایویلوایشن فریم ورک، کاسٹ آپٹیمائزیشن، اور ٹربل شوٹنگ گائیڈز  
- **حقیقی کاروباری سیاق و سباق**: ریٹیلر کسٹمر سپورٹ کیس اسٹڈی، فائل اپلوڈز، سرچ انٹیگریشن، اور ڈائنامک اسکیلنگ  

**ٹیکنالوجیز**: Azure OpenAI (GPT-4o, GPT-4o-mini)، Azure AI سرچ، کنٹینر ایپس، Cosmos DB، Application Insights، Document Intelligence، Bing Search API  

**پیچیدگی**: ⭐⭐⭐⭐ (ایڈوانسڈ - انٹرپرائز پروڈکشن ریڈی)  

**مناسب ہے**: AI ڈیولپرز، سلوشن آرکیٹیکٹس، اور ٹیمیں جو پروڈکشن ملٹی ایجنٹ سسٹمز بنا رہی ہیں  

**فوری آغاز**: شامل کردہ ARM ٹیمپلیٹ کے ساتھ مکمل سلوشن کو 30 منٹ سے کم وقت میں ڈیپلائے کریں `./deploy.sh -g myResourceGroup`  

## 📋 استعمال کی ہدایات  

### ضروریات  

کسی بھی مثال کو چلانے سے پہلے:  
- ✅ Azure سبسکرپشن جس میں مالک یا کنٹریبیوٹر رسائی ہو  
- ✅ Azure Developer CLI انسٹال ہو ([انسٹالیشن گائیڈ](../docs/getting-started/installation.md))  
- ✅ Docker Desktop چل رہا ہو (کنٹینر مثالوں کے لیے)  
- ✅ مناسب Azure کوٹاز (مثال کے مخصوص ضروریات چیک کریں)  

> **💰 کاسٹ وارننگ:** تمام مثالیں حقیقی Azure ریسورسز بناتی ہیں جو چارجز کا سبب بنتی ہیں۔ انفرادی README فائلز میں کاسٹ تخمینے دیکھیں۔ کام ختم ہونے پر `azd down` چلائیں تاکہ جاری اخراجات سے بچا جا سکے۔  

### مثالیں لوکل چلانا  

1. **مثال کلون یا کاپی کریں**  
   ```bash
   # مطلوبہ مثال پر جائیں
   cd examples/simple-web-app
   ```
  
2. **AZD ماحول کو انیشیئلائز کریں**  
   ```bash
   # موجودہ سانچے کے ساتھ شروع کریں
   azd init
   
   # یا نیا ماحول بنائیں
   azd env new my-environment
   ```
  
3. **ماحول کو کنفیگر کریں**  
   ```bash
   # مطلوبہ متغیرات سیٹ کریں
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```
  
4. **ڈیپلائے کریں**  
   ```bash
   # انفراسٹرکچر اور ایپلیکیشن کو تعینات کریں
   azd up
   ```
  
5. **ڈیپلائمنٹ کی تصدیق کریں**  
   ```bash
   # سروس کے اختتامی نکات حاصل کریں
   azd env get-values
   
   # اختتامی نقطہ آزمائیں (مثال)
   curl https://your-app-url.azurecontainer.io/health
   ```
  
   **متوقع کامیابی کے اشارے:**  
   - ✅ `azd up` بغیر کسی ایرر کے مکمل ہو  
   - ✅ سروس اینڈ پوائنٹ HTTP 200 واپس کرے  
   - ✅ Azure پورٹل "Running" اسٹیٹس دکھائے  
   - ✅ Application Insights ٹیلیمیٹری وصول کر رہا ہو  

> **⚠️ مسائل؟** [عام مسائل](../docs/troubleshooting/common-issues.md) دیکھیں ڈیپلائمنٹ ٹربل شوٹنگ کے لیے  

### مثالوں کو ایڈجسٹ کرنا  

ہر مثال میں شامل ہے:  
- **README.md** - تفصیلی سیٹ اپ اور کسٹمائزیشن ہدایات  
- **azure.yaml** - AZD کنفیگریشن کے ساتھ کمنٹس  
- **infra/** - Bicep ٹیمپلیٹس کے ساتھ پیرامیٹر وضاحتیں  
- **src/** - نمونہ ایپلیکیشن کوڈ  
- **scripts/** - عام کاموں کے لیے ہیلپر اسکرپٹس  

## 🎯 سیکھنے کے مقاصد  

### مثال کی اقسام  

#### **بنیادی ڈیپلائمنٹس**  
- سنگل سروس ایپلیکیشنز  
- سادہ انفراسٹرکچر پیٹرنز  
- بنیادی کنفیگریشن مینجمنٹ  
- کم خرچ ترقیاتی سیٹ اپس  

#### **ایڈوانسڈ سیناریوز**  
- ملٹی سروس آرکیٹیکچرز  
- پیچیدہ نیٹ ورکنگ کنفیگریشنز  
- ڈیٹا بیس انٹیگریشن پیٹرنز  
- سیکیورٹی اور کمپلائنس امپلیمنٹیشنز  

#### **پروڈکشن ریڈی پیٹرنز**  
- ہائی ایویلیبیلیٹی کنفیگریشنز  
- مانیٹرنگ اور آبزرویبلٹی  
- CI/CD انٹیگریشن  
- ڈیزاسٹر ریکوری سیٹ اپس  

## 📖 مثال کی تفصیلات  

### سادہ ویب ایپ - Node.js Express  
**ٹیکنالوجیز**: Node.js، Express، MongoDB، کنٹینر ایپس  
**پیچیدگی**: ابتدائی  
**تصورات**: بنیادی ڈیپلائمنٹ، REST API، NoSQL ڈیٹا بیس انٹیگریشن  

### اسٹاٹک ویب سائٹ - React SPA  
**ٹیکنالوجیز**: React، Azure Static Web Apps، Azure Functions، Cosmos DB  
**پیچیدگی**: ابتدائی  
**تصورات**: اسٹاٹک ہوسٹنگ، سرورلیس بیک اینڈ، جدید ویب ڈیولپمنٹ  

### کنٹینر ایپ - Python Flask  
**ٹیکنالوجیز**: Python Flask، Docker، کنٹینر ایپس، کنٹینر رجسٹری، Application Insights  
**پیچیدگی**: ابتدائی  
**تصورات**: کنٹینرائزیشن، REST API، اسکیل ٹو زیرو، ہیلتھ پروبز، مانیٹرنگ  
**مقام**: [لوکل مثال](../../../examples/container-app/simple-flask-api)  

### کنٹینر ایپ - مائیکرو سروسز آرکیٹیکچر  
**ٹیکنالوجیز**: Python، Node.js، C#، Go، Service Bus، Cosmos DB، Azure SQL، کنٹینر ایپس  
**پیچیدگی**: ایڈوانسڈ  
**تصورات**: ملٹی سروس آرکیٹیکچر، سروس کمیونیکیشن، میسج کیوئنگ، ڈسٹریبیوٹڈ ٹریسنگ  
**مقام**: [لوکل مثال](../../../examples/container-app/microservices)  

### ڈیٹا بیس ایپ - C# with Azure SQL  
**ٹیکنالوجیز**: C# ASP.NET Core، Azure SQL ڈیٹا بیس، App Service  
**پیچیدگی**: انٹرمیڈیٹ  
**تصورات**: Entity Framework، ڈیٹا بیس کنیکشنز، ویب API ڈیولپمنٹ  

### سرورلیس فنکشن - Python Azure Functions  
**ٹیکنالوجیز**: Python، Azure Functions، Cosmos DB، Static Web Apps  
**پیچیدگی**: انٹرمیڈیٹ  
**تصورات**: ایونٹ ڈریون آرکیٹیکچر، سرورلیس کمپیوٹنگ، فل اسٹیک ڈیولپمنٹ  

### مائیکرو سروسز - Java Spring Boot  
**ٹیکنالوجیز**: Java Spring Boot، کنٹینر ایپس، Service Bus، API Gateway  
**پیچیدگی**: انٹرمیڈیٹ  
**تصورات**: مائیکرو سروسز کمیونیکیشن، ڈسٹریبیوٹڈ سسٹمز، انٹرپرائز پیٹرنز  

### Azure AI Foundry مثالیں  

#### Azure OpenAI چیٹ ایپ  
**ٹیکنالوجیز**: Azure OpenAI، Cognitive Search، App Service  
**پیچیدگی**: انٹرمیڈیٹ  
**تصورات**: RAG آرکیٹیکچر، ویکٹر سرچ، LLM انٹیگریشن  

#### AI ڈاکیومنٹ پروسیسنگ  
**ٹیکنالوجیز**: Azure AI Document Intelligence، Storage، Functions  
**پیچیدگی**: انٹرمیڈیٹ  
**تصورات**: ڈاکیومنٹ تجزیہ، OCR، ڈیٹا ایکسٹریکشن  

#### مشین لرننگ پائپ لائن  
**ٹیکنالوجیز**: Azure ML، MLOps، کنٹینر رجسٹری  
**پیچیدگی**: ایڈوانسڈ  
**تصورات**: ماڈل ٹریننگ، ڈیپلائمنٹ پائپ لائنز، مانیٹرنگ  

## 🛠 کنفیگریشن مثالیں  

`configurations/` ڈائریکٹری میں قابل استعمال اجزاء شامل ہیں:  

### ماحول کی کنفیگریشنز  
- ترقیاتی ماحول کی سیٹنگز  
- اسٹیجنگ ماحول کی کنفیگریشنز  
- پروڈکشن ریڈی کنفیگریشنز  
- ملٹی ریجن ڈیپلائمنٹ سیٹ اپس  

### Bicep ماڈیولز  
- قابل استعمال انفراسٹرکچر اجزاء  
- عام ریسورس پیٹرنز  
- سیکیورٹی ہارڈنڈ ٹیمپلیٹس  
- کم خرچ کنفیگریشنز  

### ہیلپر اسکرپٹس  
- ماحول سیٹ اپ آٹومیشن  
- ڈیٹا بیس مائیگریشن اسکرپٹس  
- ڈیپلائمنٹ ویلیڈیشن ٹولز  
- کاسٹ مانیٹرنگ یوٹیلٹیز  

## 🔧 کسٹمائزیشن گائیڈ  

### اپنی ضرورت کے مطابق مثالوں کو ایڈجسٹ کریں  

1. **ضروریات کا جائزہ لیں**  
   - Azure سروس کی ضروریات چیک کریں  
   - سبسکرپشن کی حدود کی تصدیق کریں  
   - کاسٹ کے اثرات کو سمجھیں  

2. **کنفیگریشن میں ترمیم کریں**  
   - `azure.yaml` سروس ڈیفینیشنز اپڈیٹ کریں  
   - Bicep ٹیمپلیٹس کو کسٹمائز کریں  
   - ماحول کے ویریبلز کو ایڈجسٹ کریں  

3. **مکمل طور پر ٹیسٹ کریں**  
   - پہلے ترقیاتی ماحول میں ڈیپلائے کریں  
   - فنکشنلٹی کی تصدیق کریں  
   - اسکیلنگ اور پرفارمنس ٹیسٹ کریں  

4. **سیکیورٹی کا جائزہ لیں**  
   - ایکسیس کنٹرولز کا جائزہ لیں  
   - سیکریٹس مینجمنٹ نافذ کریں  
   - مانیٹرنگ اور الرٹنگ کو فعال کریں  

## 📊 موازنہ میٹرکس  

| مثال | سروسز | ڈیٹا بیس | آتھ | مانیٹرنگ | پیچیدگی |  
|---------|----------|----------|------|------------|------------|  
| **Azure OpenAI چیٹ** (لوکل) | 2 | ❌ | Key Vault | مکمل | ⭐⭐ |  
| **Python Flask API** (لوکل) | 1 | ❌ | بنیادی | مکمل | ⭐ |  
| **مائیکرو سروسز** (لوکل) | 5+ | ✅ | انٹرپرائز | ایڈوانسڈ | ⭐⭐⭐⭐ |  
| Node.js Express Todo | 2 | ✅ | بنیادی | بنیادی | ⭐ |  
| React SPA + Functions | 3 | ✅ | بنیادی | مکمل | ⭐ |  
| Python Flask کنٹینر | 2 | ❌ | بنیادی | مکمل | ⭐ |  
| C# ویب API + SQL | 2 | ✅ | مکمل | مکمل | ⭐⭐ |  
| Python Functions + SPA | 3 | ✅ | مکمل | مکمل | ⭐⭐ |  
| Java مائیکرو سروسز | 5+ | ✅ | مکمل | مکمل | ⭐⭐ |  
| Azure OpenAI چیٹ | 3 | ✅ | مکمل | مکمل | ⭐⭐⭐ |  
| AI ڈاکیومنٹ پروسیسنگ | 2 | ❌ | بنیادی | مکمل | ⭐⭐ |  
| ML پائپ لائن | 4+ | ✅ | مکمل | مکمل | ⭐⭐⭐⭐ |  
| **ریٹیل ملٹی ایجنٹ** (لوکل) | **8+** | **✅** | **انٹرپرائز** | **ایڈوانسڈ** | **⭐⭐⭐⭐** |  

## 🎓 سیکھنے کا راستہ  

### تجویز کردہ ترقی  

1. **سادہ ویب ایپ سے شروع کریں**  
   - بنیادی AZD تصورات سیکھیں  
   - ڈیپلائمنٹ ورک فلو کو سمجھیں  
   - ماحول مینجمنٹ کی مشق کریں  

2. **اسٹاٹک ویب سائٹ آزمائیں**  
   - مختلف ہوسٹنگ آپشنز کو دریافت کریں  
   - CDN انٹیگریشن سیکھیں  
   - DNS کنفیگریشن کو سمجھیں  

3. **کنٹینر ایپ پر جائیں**  
   - کنٹینرائزیشن کی بنیادی باتیں سیکھیں  
   - اسکیلنگ تصورات کو سمجھیں  
   - Docker کے ساتھ مشق کریں  

4. **ڈیٹا بیس انٹیگریشن شامل کریں**  
   - ڈیٹا بیس پروویژننگ سیکھیں  
   - کنیکشن اسٹرنگز کو سمجھیں  
   - سیکریٹس مینجمنٹ کی مشق کریں  

5. **سرورلیس کو دریافت کریں**  
   - ایونٹ ڈریون آرکیٹیکچر کو سمجھیں  
   - ٹرگرز اور بائنڈنگز کے بارے میں سیکھیں  
   - APIs کے ساتھ مشق کریں  

6. **مائیکرو سروسز بنائیں**  
   - سروس کمیونیکیشن سیکھیں  
   - ڈسٹریبیوٹڈ سسٹمز کو سمجھیں  
   - پیچیدہ ڈیپلائمنٹس کی مشق کریں  

## 🔍 صحیح مثال تلاش کرنا  

### ٹیکنالوجی اسٹیک کے لحاظ سے  
- **کنٹینر ایپس**: [Python Flask API (لوکل)](../../../examples/container-app/simple-flask-api)، [مائیکرو سروسز (لوکل)](../../../examples/container-app/microservices)، Java مائیکرو سروسز  
- **Node.js**: Node.js Express Todo App، [مائیکرو سروسز API Gateway (لوکل)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (لوکل)](../../../examples/container-app/simple-flask-api)، [مائیکرو سروسز پروڈکٹ سروس (لوکل)](../../../examples/container-app/microservices)، Python Functions + SPA  
- **C#**: [مائیکرو سروسز آرڈر سروس (لوکل)](../../../examples/container-app/microservices)، C# ویب API + SQL ڈیٹا بیس، Azure OpenAI چیٹ ایپ، ML پائپ لائن  
- **Go**: [مائیکرو سروسز یوزر سروس (لوکل)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot مائیکرو سروسز  
- **React**: React SPA + Functions  
- **کنٹینرز**: [Python Flask (لوکل)](../../../examples/container-app/simple-flask-api)، [مائیکرو سروسز (لوکل)](../../../examples/container-app/microservices)، Java مائیکرو سروسز  
- **ڈیٹا بیسز**: [مائیکرو سروسز (لوکل)](../../../examples/container-app/microservices)، Node.js + MongoDB، C# + Azure SQL، Python + Cosmos DB  
- **AI/ML**: **[Azure OpenAI چیٹ (لوکل)](../../../examples/azure-openai-chat)**، Azure OpenAI چیٹ ایپ، AI ڈاکیومنٹ پروسیسنگ، ML پائپ لائن، **ریٹیل ملٹی ایجنٹ سلوشن**  
- **ملٹی ایجنٹ سسٹمز**: **ریٹیل ملٹی ایجنٹ سلوشن**  
- **OpenAI انٹیگریشن**: **[Azure OpenAI چیٹ (لوکل)](../../../examples/azure-openai-chat)**، ریٹیل ملٹی ایجنٹ سلوشن  
- **انٹرپرائز پروڈکشن**: [مائیکرو سروسز (لوکل)](../../../examples/container-app/microservices)، **ریٹیل ملٹی ایجنٹ سلوشن**  

### آرکیٹیکچر پیٹرن کے لحاظ سے  
- **سادہ REST API**: [Python Flask API (لوکل)](../../../examples/container-app/simple-flask-api)  
- **مونولیتھک**: Node.js Express Todo، C# ویب API + SQL  
- **اسٹاٹک + سرورلیس**: React SPA + Functions، Python Functions + SPA  
- **مائیکرو سروسز**: [پروڈکشن مائیکرو سروسز (لوکل)](../../../examples/container-app/microservices)، Java Spring Boot مائیکرو سروسز  
- **کنٹینرائزڈ**: [Python Flask (لوکل)](../../../examples/container-app/simple-flask-api)، [مائیکرو سروسز (لوکل)](../../../examples/container-app/microservices)  
- **AI پاورڈ**: **[Azure OpenAI چیٹ (لوکل)](../../../examples/azure-openai-chat)**، Azure OpenAI چیٹ ایپ، AI ڈاکیومنٹ پروسیسنگ، ML پائپ لائن، **ریٹیل ملٹی ایجنٹ سلوشن**  
- **ملٹی ایجنٹ آرکیٹیکچر**: **ریٹیل ملٹی ایجنٹ سلوشن**  
- **انٹرپرائز ملٹی سروس**: [مائیکرو سروسز (لوکل)](../../../examples/container-app/microservices)، **ریٹیل ملٹی ایجنٹ سلوشن**  

### پیچیدگی کی سطح کے لحاظ سے  
- **ابتدائی**: [Python Flask API (لوکل)](../../../examples/container-app/simple-flask-api)، Node.js Express Todo، React SPA + Functions  
- **انٹرمیڈیٹ**: **[Azure OpenAI چیٹ (لوکل)](../../../examples/azure-openai-chat)**، C# ویب API + SQL، Python Functions + SPA، Java مائیکرو سروسز، Azure OpenAI چیٹ ایپ، AI ڈاکیومنٹ پروسیسنگ  
- **ایڈوانسڈ**: ML پائپ لائن  
- **انٹرپرائز پروڈکشن ریڈی**: [مائیکرو سروسز (لوکل)](../../../examples/container-app/microservices) (ملٹی سروس میسج کیوئنگ کے ساتھ)، **ریٹیل ملٹی ایجنٹ سلوشن**
- [نوڈ.جے ایس اور پوسٹگری ایس کیو ایل کے ساتھ ٹوڈو ایپ](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [ری ایکٹ ویب ایپ سی شارپ API کے ساتھ](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [ایزور کنٹینر ایپس جاب](https://github.com/Azure-Samples/container-apps-jobs)
- [ایزور فنکشنز جاوا کے ساتھ](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### بہترین طریقے
- [ایزور ویل آرکیٹیکٹڈ فریم ورک](https://learn.microsoft.com/en-us/azure/well-architected/)
- [کلاؤڈ ایڈاپشن فریم ورک](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 مثالیں شامل کریں

کیا آپ کے پاس کوئی مفید مثال ہے؟ ہم آپ کی شراکت کا خیر مقدم کرتے ہیں!

### جمع کرانے کے رہنما اصول
1. مقررہ ڈائریکٹری ڈھانچے کی پیروی کریں
2. جامع README.md شامل کریں
3. کنفیگریشن فائلوں میں تبصرے شامل کریں
4. جمع کرانے سے پہلے مکمل طور پر ٹیسٹ کریں
5. لاگت کے تخمینے اور ضروریات شامل کریں

### مثال کے ٹیمپلیٹ کا ڈھانچہ
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

**پرو ٹپ**: اپنی ٹیکنالوجی اسٹیک سے مطابقت رکھنے والی سب سے آسان مثال سے شروع کریں، پھر آہستہ آہستہ زیادہ پیچیدہ منظرناموں کی طرف بڑھیں۔ ہر مثال پچھلی مثالوں کے تصورات پر مبنی ہوتی ہے!

## 🚀 شروع کرنے کے لیے تیار؟

### آپ کا سیکھنے کا راستہ

1. **بالکل نئے ہیں؟** → [فلاسک API](../../../examples/container-app/simple-flask-api) سے شروع کریں (⭐, 20 منٹ)
2. **AZD کا بنیادی علم رکھتے ہیں؟** → [مائیکرو سروسز](../../../examples/container-app/microservices) آزمائیں (⭐⭐⭐⭐, 60 منٹ)
3. **AI ایپس بنا رہے ہیں؟** → [ایزور اوپن AI چیٹ](../../../examples/azure-openai-chat) سے شروع کریں (⭐⭐, 35 منٹ) یا [ریٹیل ملٹی ایجنٹ](retail-scenario.md) کو دریافت کریں (⭐⭐⭐⭐, 2+ گھنٹے)
4. **مخصوص ٹیک اسٹیک کی ضرورت ہے؟** → [صحیح مثال تلاش کرنے](../../../examples) کے سیکشن کا استعمال کریں

### اگلے اقدامات

- ✅ اوپر دی گئی [ضروریات](../../../examples) کا جائزہ لیں
- ✅ اپنی مہارت کی سطح سے مطابقت رکھنے والی مثال منتخب کریں (دیکھیں [پیچیدگی کی درجہ بندی کی علامات](../../../examples))
- ✅ مثال کے README کو تعیناتی سے پہلے اچھی طرح پڑھیں
- ✅ ٹیسٹنگ کے بعد `azd down` چلانے کے لیے یاد دہانی مقرر کریں
- ✅ اپنی تجربات کو GitHub Issues یا Discussions کے ذریعے شیئر کریں

### مدد کی ضرورت ہے؟

- 📖 [FAQ](../resources/faq.md) - عام سوالات کے جوابات
- 🐛 [ٹربل شوٹنگ گائیڈ](../docs/troubleshooting/common-issues.md) - تعیناتی کے مسائل حل کریں
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - کمیونٹی سے سوال کریں
- 📚 [مطالعہ گائیڈ](../resources/study-guide.md) - اپنی سیکھنے کو مضبوط کریں

---

**نیویگیشن**
- **📚 کورس ہوم**: [AZD For Beginners](../README.md)
- **📖 مطالعہ مواد**: [مطالعہ گائیڈ](../resources/study-guide.md) | [چیٹ شیٹ](../resources/cheat-sheet.md) | [گلاسری](../resources/glossary.md)
- **🔧 وسائل**: [FAQ](../resources/faq.md) | [ٹربل شوٹنگ](../docs/troubleshooting/common-issues.md)

---

*آخری اپ ڈیٹ: نومبر 2025 | [مسائل رپورٹ کریں](https://github.com/microsoft/AZD-for-beginners/issues) | [مثالیں شامل کریں](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ڈسکلیمر**:  
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کا استعمال کرتے ہوئے ترجمہ کی گئی ہے۔ ہم درستگی کے لیے کوشش کرتے ہیں، لیکن براہ کرم آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا غیر درستیاں ہو سکتی ہیں۔ اصل دستاویز کو اس کی اصل زبان میں مستند ذریعہ سمجھا جانا چاہیے۔ اہم معلومات کے لیے، پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ ہم اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کے ذمہ دار نہیں ہیں۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->