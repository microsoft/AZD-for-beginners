# مثالیں - عملی AZD ٹیمپلیٹس اور کنفیگریشنز

**مثال کے ذریعے سیکھنا - باب وار منظم**
- **📚 کورس ہوم**: [نوسکھیا والوں کے لیے AZD](../README.md)
- **📖 باب کا نقشہ**: سیکھنے کی پیچیدگی کے مطابق منظم مثالیں
- **🚀 مقامی مثال**: [ریٹیل ملٹی ایجنٹ حل](retail-scenario.md)
- **🤖 خارجی AI مثالیں**: Azure Samples کے ریپازیٹریز کے روابط

> **📍 اہم: مقامی اور خارجی مثالیں**  
> یہ ریپازیٹری **4 مکمل مقامی مثالیں** مکمل عملدرآمد کے ساتھ رکھتی ہے:  
> - **Microsoft Foundry Models Chat** (gpt-4.1 تعیناتی چیٹ انٹرفیس کے ساتھ)  
> - **کنٹینر ایپس** (سادہ Flask API + مائیکرو سروسز)  
> - **ڈیٹا بیس ایپ** (ویب + SQL ڈیٹا بیس)  
> - **ریٹیل ملٹی ایجنٹ** (انٹرپرائز AI حل)  
>  
> اضافی مثالیں Azure-Samples ریپازیٹریز کے **بیرونی حوالہ جات** ہیں جنہیں آپ کلون کر سکتے ہیں۔

## تعارف

یہ ڈائریکٹری عملی مثالیں اور حوالے فراہم کرتی ہے تاکہ آپ ہاتھوں پر مشق کے ذریعے Azure Developer CLI سیکھ سکیں۔ ریٹیل ملٹی ایجنٹ منظر نامہ ایک مکمل، پیداواری سطح پر تیار عملدرآمد ہے جو اس ریپازیٹری میں شامل ہے۔ اضافی مثالیں سرکاری Azure Samples کا حوالہ دیتی ہیں جو مختلف AZD پیٹرنز کو ظاہر کرتی ہیں۔

### پیچیدگی کی درجہ بندی

- ⭐ **نوسکھیا** - بنیادی تصورات، ایک سروس، 15-30 منٹ
- ⭐⭐ **درمیانی** - متعدد سروسز، ڈیٹا بیس انضمام، 30-60 منٹ
- ⭐⭐⭐ **اعلیٰ** - پیچیدہ فن تعمیر، AI انضمام، 1-2 گھنٹے
- ⭐⭐⭐⭐ **ماہرانہ** - پیداواری، انٹرپرائز پیٹرنز، 2+ گھنٹے

## 🎯 اس ریپازیٹری میں درحقیقت کیا ہے

### ✅ مقامی عملدرآمد (استعمال کے لیے تیار)

#### [Microsoft Foundry Models Chat Application](azure-openai-chat/README.md) 🆕  
**مکمل gpt-4.1 تعیناتی چیٹ انٹرفیس کے ساتھ اس ریپو میں شامل ہے**

- **مقام:** `examples/azure-openai-chat/`  
- **پیچیدگی:** ⭐⭐ (درمیانی)  
- **شامل ہے:**  
  - Microsoft Foundry Models کی مکمل تعیناتی (gpt-4.1)  
  - پائتھون کمانڈ لائن چیٹ انٹرفیس  
  - کلید والٹ انضمام برائے محفوظ API کیز  
  - بائسِپ انفرسٹرکچر ٹیمپلیٹس  
  - ٹوکن استعمال اور لاگت کی ٹریکنگ  
  - ریٹ لمیٹنگ اور ایرر ہینڈلنگ  

**فوری آغاز:**  
```bash
# مثال پر جائیں
cd examples/azure-openai-chat

# سب کچھ تعینات کریں
azd up

# انحصار انسٹال کریں اور بات چیت شروع کریں
pip install -r src/requirements.txt
python src/chat.py
```
  
**ٹیکنالوجیز:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [کنٹینر ایپ کی مثالیں](container-app/README.md) 🆕  
**اس ریپازیٹری میں جامع کنٹینر تعیناتی مثالیں شامل ہیں**

- **مقام:** `examples/container-app/`  
- **پیچیدگی:** ⭐-⭐⭐⭐⭐ (نوسکھیا سے اعلیٰ)  
- **شامل ہے:**  
  - [ماسٹر گائیڈ](container-app/README.md) - کنٹینر تعینات کا مکمل جائزہ  
  - [سادہ Flask API](../../../examples/container-app/simple-flask-api) - بنیادی REST API مثال  
  - [مائیکرو سروسز فن تعمیر](../../../examples/container-app/microservices) - پیداواری سطح پر تیار کثیرالخدمتی تعیناتی  
  - فوری آغاز، پیداواری، اور اعلیٰ پیٹرنز  
  - نگرانی، سیکیورٹی، اور لاگت کی اصلاح  

**فوری آغاز:**  
```bash
# ماسٹر گائیڈ دیکھیں
cd examples/container-app

# سادہ فلاسک API تعینات کریں
cd simple-flask-api
azd up

# مائیکرو سروسز کی مثال تعینات کریں
cd ../microservices
azd up
```
  
**ٹیکنالوجیز:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [ریٹیل ملٹی ایجنٹ حل](retail-scenario.md) 🆕  
**اس ریپازیٹری میں مکمل پیداواری سطح پر تیار عملدرآمد شامل ہے**

- **مقام:** `examples/retail-multiagent-arm-template/`  
- **پیچیدگی:** ⭐⭐⭐⭐ (اعلیٰ)  
- **شامل ہے:**  
  - مکمل ARM تعیناتی ٹیمپلیٹ  
  - کثیر ایجنٹ فن تعمیر (صارف + انوینٹری)  
  - Microsoft Foundry Models انضمام  
  - AI سرچ RAG کے ساتھ  
  - جامع نگرانی  
  - ایک کلک تعیناتی اسکرپٹ  

**فوری آغاز:**  
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```
  
**ٹیکنالوجیز:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 خارجی Azure Samples (استعمال کے لیے کلون کریں)

مندرجہ ذیل مثالیں سرکاری Azure-Samples ریپازیٹریز میں برقرار رکھی جاتی ہیں۔ انہیں کلون کریں تاکہ مختلف AZD پیٹرنز کا تجربہ کریں:

### سادہ ایپلیکیشنز (باب 1-2)

| ٹیمپلیٹ | ریپازیٹری | پیچیدگی | خدمات |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [مقامی: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **مائیکرو سروسز** | [مقامی: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | کثیرالخدمتی، سروس بس، Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**استعمال کا طریقہ:**  
```bash
# کسی بھی مثال کو کلون کریں
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# تعینات کریں
azd up
```
  
### AI ایپلیکیشن مثالیں (باب 2, 5, 8)

| ٹیمپلیٹ | ریپازیٹری | پیچیدگی | فوکس |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [مقامی: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 تعیناتی |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | بنیادی AI چیٹ |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | ایجنٹ فریم ورک |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG پیٹرن |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | انٹرپرائز AI |

### ڈیٹا بیس اور اعلیٰ پیٹرنز (باب 3-8)

| ٹیمپلیٹ | ریپازیٹری | پیچیدگی | فوکس |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | ڈیٹا بیس انضمام |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL سرورلیس |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | کثیرالخدمتی |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## سیکھنے کے مقاصد

ان مثالوں کے ذریعے کام کر کے آپ:  
- Azure Developer CLI ورک فلو کو حقیقت پسندانہ ایپلیکیشن منظرناموں کے ساتھ مشق کریں گے  
- مختلف ایپلیکیشن فن تعمیرات اور ان کے azd عملدرآمد کو سمجھیں گے  
- مختلف Azure خدمات کے لیے Infrastructure as Code پیٹرنز میں مہارت حاصل کریں گے  
- کنفیگریشن مینجمنٹ اور ماحول مخصوص تعیناتی حکمت عملیوں کو نافذ کریں گے  
- عملی سیاق و سباق میں نگرانی، سیکیورٹی، اور اسکیلنگ پیٹرنز کو اپنائیں گے  
- حقیقی تعیناتی منظرناموں میں ٹربل شوٹنگ اور ڈیبگنگ کا تجربہ حاصل کریں گے  

## سیکھنے کے نتائج

ان مثالوں کو مکمل کرنے کے بعد آپ قابل ہوں گے:  
- مختلف قسم کی ایپلیکیشنز کو Azure Developer CLI سے خود اعتمادی سے تعینات کرنا  
- فراہم کردہ ٹیمپلیٹس کو اپنی ایپلیکیشن ضروریات کے مطابق ڈھالنا  
- Bicep کے ذریعے کسٹم انفرسٹرکچر پیٹرنز ڈیزائن اور عملدرآمد کرنا  
- پیچیدہ کثیرالخدمتی ایپلیکیشنز کو مناسب انحصارات کے ساتھ کنفیگر کرنا  
- حقیقی منظرناموں میں سیکیورٹی، نگرانی، اور کارکردگی کی بہترین عملی تجاویز اپنانا  
- عملی تجربے کی بنیاد پر تعیناتیوں کی ٹربل شوٹنگ اور بہتر کاری  

## ڈائریکٹری کی ساخت

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

> **💡 AZD میں نئے ہیں؟** مثال #1 (Flask API) سے شروع کریں - تقریباً 20 منٹ میں بنیادی تصورات سکھاتی ہے۔

### نوسکھیا کے لیے
1. **[کنٹینر ایپ - Python Flask API](../../../examples/container-app/simple-flask-api)** (مقامی) ⭐  
   آسان REST API تعینات کریں جس میں scale-to-zero ہو  
   **وقت:** 20-25 منٹ | **لاگت:** $0-5/ماہ  
   **سیکھیں گے:** بنیادی azd ورک فلو، کنٹینریزیشن، ہیلتھ پروبز  
   **متوقع نتیجہ:** کام کرنے والا API اینڈپوائنٹ جو "Hello, World!" واپس کرے گا، نگرانی کے ساتھ

2. **[سادہ ویب ایپ - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Node.js Express ویب ایپلیکیشن تعینات کریں MongoDB کے ساتھ  
   **وقت:** 25-35 منٹ | **لاگت:** $10-30/ماہ  
   **سیکھیں گے:** ڈیٹا بیس انضمام، انوائرنمنٹ ویریبلز، کنکشن سٹرنگز  
   **متوقع نتیجہ:** Todo لسٹ ایپ جس میں تخلیق/مطالعہ/تبدیلی/حذف کی فعالیت ہو

3. **[Static ویب سائٹ - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   React static ویب سائٹ میزبانی کریں Azure Static Web Apps کے ساتھ  
   **وقت:** 20-30 منٹ | **لاگت:** $0-10/ماہ  
   **سیکھیں گے:** جامد ہوسٹنگ، بغیر سرور فنکشنز، CDN تعیناتی  
   **متوقع نتیجہ:** React UI API بیک اینڈ کے ساتھ، خودکار SSL، عالمی CDN

### درمیانی صارفین کے لیے
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (مقامی) ⭐⭐  
   gpt-4.1 تعینات کریں چیٹ انٹرفیس اور محفوظ API کی مینجمنٹ کے ساتھ  
   **وقت:** 35-45 منٹ | **لاگت:** $50-200/ماہ  
   **سیکھیں گے:** Microsoft Foundry Models تعیناتی، Key Vault انضمام، ٹوکن ٹریکنگ  
   **متوقع نتیجہ:** gpt-4.1 کے ساتھ کام کرنے والی چیٹ ایپلیکیشن لاگت کی نگرانی کے ساتھ

5. **[کنٹینر ایپ - مائیکرو سروسز](../../../examples/container-app/microservices)** (مقامی) ⭐⭐⭐⭐  
   پیداواری سطح پر تیار کثیر الخدمة فن تعمیر  
   **وقت:** 45-60 منٹ | **لاگت:** $50-150/ماہ  
   **سیکھیں گے:** سروس مواصلات، میسج کیوئنگ، تقسیم شدہ ٹریسنگ  
   **متوقع نتیجہ:** 2-سروس نظام (API Gateway + Product Service) نگرانی کے ساتھ

6. **[ڈیٹا بیس ایپ - C# کے ساتھ Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   C# API اور Azure SQL ڈیٹا بیس کے ساتھ ویب ایپلیکیشن   
   **وقت:** 30-45 منٹ | **لاگت:** $20-80/ماہ  
   **سیکھیں گے:** Entity Framework، ڈیٹا بیس مائیگریشنز، کنکشن سیکیورٹی  
   **متوقع نتیجہ:** C# API Azure SQL بیک اینڈ کے ساتھ، خودکار اسکیمہ تعیناتی

7. **[سرورلیس فنکشن - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   HTTP ٹرگرز اور Cosmos DB کے ساتھ Python Azure Functions  
   **وقت:** 30-40 منٹ | **لاگت:** $10-40/ماہ  
   **سیکھیں گے:** ایونٹ ڈرائیون فن تعمیر، سرورلیس اسکیلنگ، NoSQL انضمام  
   **متوقع نتیجہ:** فنکشن ایپ جو HTTP درخواستوں پر ردعمل دیتی ہے Cosmos DB اسٹوریج کے ساتھ

8. **[مائیکرو سروسز - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   کثیر الخدمة Java ایپلیکیشن کنٹینر ایپس اور API گیٹ وے کے ساتھ  
   **وقت:** 60-90 منٹ | **لاگت:** $80-200/ماہ  
   **سیکھیں گے:** Spring Boot تعیناتی، سروس میش، بوجھ کی تقسیم  
   **متوقع نتیجہ:** کثیر الخدمة Java نظام سروس دریافت اور روٹنگ کے ساتھ

### Microsoft Foundry ٹیمپلیٹس

1. **[Microsoft Foundry Models Chat App - مقامی مثال](../../../examples/azure-openai-chat)** ⭐⭐  
   مکمل gpt-4.1 تعیناتی چیٹ انٹرفیس کے ساتھ  
   **وقت:** 35-45 منٹ | **لاگت:** $50-200/ماہ  
   **متوقع نتیجہ:** کام کرنے والی چیٹ ایپلیکیشن ٹوکن ٹریکنگ اور لاگت کی نگرانی کے ساتھ

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   ذہین چیٹ ایپلیکیشن RAG فن تعمیر کے ساتھ  
   **وقت:** 60-90 منٹ | **لاگت:** $100-300/ماہ  
   **متوقع نتیجہ:** RAG پر مبنی چیٹ انٹرفیس دستاویز تلاش اور حوالہ جات کے ساتھ

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   دستاویز تجزیہ Azure AI خدمات استعمال کرتے ہوئے  
   **وقت:** 40-60 منٹ | **لاگت:** $20-80/ماہ  
   **متوقع نتیجہ:** API جو اپلوڈ کی گئی دستاویزات سے متن، جدولیں، اور اجزاء نکالتی ہے

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps ورک فلو Azure Machine Learning کے ساتھ  
   **وقت:** 2-3 گھنٹے | **لاگت:** $150-500/ماہ  
   **متوقع نتیجہ:** خودکار ML پائپ لائن، تربیت، تعیناتی، اور نگرانی کے ساتھ

### حقیقی دنیا کے منظرنامے

#### **ریٹیل ملٹی ایجنٹ حل** 🆕  
**[مکمل عملدرآمد گائیڈ](./retail-scenario.md)**

ایک جامع، پیداواری سطح پر تیار کثیر ایجنٹ صارف معاونت حل جو انٹرپرائز گریڈ AI ایپلیکیشن تعیناتی AZD کے ساتھ دکھاتا ہے۔ یہ منظر نامہ فراہم کرتا ہے:

- **مکمل فن تعمیر**: کثیر ایجنٹ نظام خصوصی صارف خدمات اور انوینٹری مینجمنٹ ایجنٹس کے ساتھ
- **پروڈکشن انفراسٹرکچر**: ملٹی ریجن مائیکروسافٹ فاؤنڈری ماڈلز کی تعیناتی، AI سرچ، کنٹینر ایپس، اور جامع نگرانی  
- **ریڈی ٹو ڈیپلائے ARM ٹیمپلیٹ**: ایک کلک تعیناتی متعدد کنفیگریشن موڈز کے ساتھ (Minimal/Standard/Premium)  
- **جدید خصوصیات**: ریڈ ٹیمینگ سیکیورٹی ویلیڈیشن، ایجنٹ ایویلیو ایشن فریم ورک، لاگت کی بہتری، اور ٹربل شوٹنگ گائیڈز  
- **حقیقی کاروباری سیاق و سباق**: ریٹیلر کسٹمر سپورٹ استعمال کیس فائل اپ لوڈز، سرچ انٹیگریشن، اور ڈائنامک اسکیلنگ کے ساتھ  

**ٹیکنالوجیز**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini)، Azure AI Search، Container Apps، Cosmos DB، Application Insights، Document Intelligence، Bing Search API  

**پیچیدگی**: ⭐⭐⭐⭐ (ایڈوانسڈ - انٹرپرائز پروڈکشن ریڈی)  

**مناسب برائے**: AI ڈویلپرز، سلوشن آرکیٹیکٹس، اور ٹیمیں جو پروڈکشن ملٹی-ایجنٹ سسٹمز تیار کر رہی ہیں  

**فوری شروعات**: مکمل حل کو 30 منٹ سے کم وقت میں تعینات کریں شامل ARM ٹیمپلیٹ کا استعمال کرتے ہوئے `./deploy.sh -g myResourceGroup`  

## 📋 استعمال کی ہدایات  

### ضروریات  

کسی بھی مثال کو چلانے سے پہلے:  
- ✅ Azure سبسکرپشن جس کے پاس Owner یا Contributor رسائی ہو  
- ✅ Azure Developer CLI انسٹال شدہ ([انسٹالیشن گائیڈ](../docs/chapter-01-foundation/installation.md))  
- ✅ Docker Desktop چل رہا ہو (کنٹینر مثالوں کے لئے)  
- ✅ مناسب Azure کوٹے (مثال کی مخصوص ضروریات چیک کریں)  

> **💰 لاگت کی وارننگ:** تمام مثالیں حقیقی Azure وسائل تخلیق کرتی ہیں جس پر چارجز لاگو ہوتے ہیں۔ لاگت کے اندازوں کے لیے متعلقہ README فائلز دیکھیں۔ مکمل ہونے پر `azd down` چلانا نہ بھولیں تاکہ جاری لاگت سے بچا جا سکے۔  

### لوکل مثالیں چلانا  

1. **مثال کلون یا کاپی کریں**  
   ```bash
   # مطلوبہ مثال پر جائیں
   cd examples/simple-web-app
   ```
  
2. **AZD ماحول کو شروع کریں**  
   ```bash
   # موجودہ ٹیمپلیٹ کے ساتھ شروع کریں
   azd init
   
   # یا نیا ماحول بنائیں
   azd env new my-environment
   ```
  
3. **ماحول کی ترتیب کریں**  
   ```bash
   # مطلوبہ متغیرات سیٹ کریں
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```
  
4. **تعینات کریں**  
   ```bash
   # انفراسٹرکچر اور ایپلیکیشن کو تعینات کریں
   azd up
   ```
  
5. **تعیناتی کی تصدیق کریں**  
   ```bash
   # سروس اینڈ پوائنٹس حاصل کریں
   azd env get-values
   
   # اینڈ پوائنٹ کا تجربہ کریں (مثال)
   curl https://your-app-url.azurecontainer.io/health
   ```
  
   **متوقع کامیابی کے اشارے:**  
   - ✅ `azd up` بغیر غلطیوں کے مکمل ہو  
   - ✅ سروس اینڈ پوائنٹ HTTP 200 واپس کرے  
   - ✅ Azure پورٹل "Running" کی حیثیت دکھائے  
   - ✅ Application Insights ٹیلی میٹری وصول کر رہا ہو  

> **⚠️ مسائل؟** تعیناتی کے مسائل کے لیے [Common Issues](../docs/chapter-07-troubleshooting/common-issues.md) دیکھیں  

### مثالوں کو اپنانا  

ہر مثال میں شامل ہیں:  
- **README.md** - تفصیلی سیٹ اپ اور تخصیص کی ہدایات  
- **azure.yaml** - تبصروں کے ساتھ AZD کنفیگریشن  
- **infra/** - پیرامیٹر وضاحت کے ساتھ بائسک ٹیمپلیٹس  
- **src/** - نمونہ ایپلیکیشن کوڈ  
- **scripts/** - عام کاموں کے لیے ہیلپر سکرپٹس  

## 🎯 تعلیمی مقاصد  

### مثال کی اقسام  

#### **بنیادی تعیناتیاں**  
- واحد سروس ایپلیکیشنز  
- سادہ انفراسٹرکچر پیٹرنز  
- بنیادی کنفیگریشن مینجمنٹ  
- لاگت کے مؤثر ترقیاتی سیٹ اپ  

#### **ایڈوانسڈ منظرنامے**  
- کثیر سروس آرکیٹیکچر  
- پیچیدہ نیٹ ورکنگ کنفیگریشنز  
- ڈیٹا بیس انٹیگریشن پیٹرنز  
- سیکیورٹی اور کمپلائنس نفاذ  

#### **پروڈکشن-ریڈی پیٹرنز**  
- ہائی اویلیبیلیٹی کنفیگریشنز  
- نگرانی اور مشاہدہ  
- CI/CD انٹیگریشن  
- ڈیزاسٹر ریکوری سیٹ اپ  

## 📖 مثالوں کی وضاحت  

### سادہ ویب ایپ - Node.js Express  
**ٹیکنالوجیز**: Node.js, Express, MongoDB, Container Apps  
**پیچیدگی**: ابتدائی  
**تصورات**: بنیادی تعیناتی، REST API، NoSQL ڈیٹا بیس انٹیگریشن  

### سٹیٹک ویب سائٹ - React SPA  
**ٹیکنالوجیز**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**پیچیدگی**: ابتدائی  
**تصورات**: سٹیٹک ہوسٹنگ، سرورلیس بیک اینڈ، جدید ویب ڈیولپمنٹ  

### کنٹینر ایپ - Python Flask  
**ٹیکنالوجیز**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**پیچیدگی**: ابتدائی  
**تصورات**: کنٹینرائزیشن، REST API، سکین ٹو زیرو، ہیلتھ پروبز، نگرانی  
**مقام**: [لوکل مثال](../../../examples/container-app/simple-flask-api)  

### کنٹینر ایپ - مائیکروسروسز آرکیٹیکچر  
**ٹیکنالوجیز**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**پیچیدگی**: ایڈوانسڈ  
**تصورات**: ملٹی سروس آرکیٹیکچر، سروس کمیونیکیشن، میسج کیوئنگ، ڈسٹری بیوٹڈ ٹریسنگ  
**مقام**: [لوکل مثال](../../../examples/container-app/microservices)  

### ڈیٹا بیس ایپ - C# کے ساتھ Azure SQL  
**ٹیکنالوجیز**: C# ASP.NET Core, Azure SQL Database, App Service  
**پیچیدگی**: درمیانہ  
**تصورات**: Entity Framework، ڈیٹا بیس کنیکشنز، ویب API کی تعمیر  

### سرور لیس فنکشن - Python Azure Functions  
**ٹیکنالوجیز**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**پیچیدگی**: درمیانہ  
**تصورات**: ایونٹ ڈرائیون آرکیٹیکچر، سرورلیس کمپیوٹنگ، فل اسٹیک ڈیولپمنٹ  

### مائیکروسروسز - Java Spring Boot  
**ٹیکنالوجیز**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**پیچیدگی**: درمیانہ  
**تصورات**: مائیکروسروسز کمیونیکیشن، ڈسٹری بیوٹڈ سسٹمز، انٹرپرائز پیٹرنز  

### Microsoft Foundry مثالیں  

#### Microsoft Foundry Models چیٹ ایپ  
**ٹیکنالوجیز**: Microsoft Foundry Models, Azure AI Search, App Service  
**پیچیدگی**: درمیانہ  
**تصورات**: RAG آرکیٹیکچر، ویکٹر سرچ، LLM انٹیگریشن  

#### AI ڈاکیومنٹ پروسیسنگ  
**ٹیکنالوجیز**: Azure AI Document Intelligence, Storage, Functions  
**پیچیدگی**: درمیانہ  
**تصورات**: ڈاکیومنٹ تجزیہ، OCR، ڈیٹا استخراج  

#### مشین لرننگ پائپ لائن  
**ٹیکنالوجیز**: Azure ML, MLOps, Container Registry  
**پیچیدگی**: ایڈوانسڈ  
**تصورات**: ماڈل ٹریننگ، تعیناتی پائپ لائنز، نگرانی  

## 🛠 کنفیگریشن مثالیں  

`configurations/` ڈائریکٹری میں قابل استعمال اجزاء شامل ہیں:  

### ماحولیاتی کنفیگریشنز  
- ڈیولپمنٹ ماحول کی سیٹنگز  
- اسٹیجنگ ماحول کی کنفیگریشنز  
- پروڈکشن ریڈی کنفیگریشنز  
- ملٹی ریجن تعیناتی سیٹ اپ  

### بائسک ماڈیولز  
- قابل استعمال انفراسٹرکچر اجزاء  
- عمومی وسائل کے پیٹرنز  
- سیکیورٹی ہارڈینڈ ٹیمپلیٹس  
- لاگت کے لحاظ سے بہتر کنفیگریشنز  

### ہیلپر سکرپٹس  
- ماحول کا سیٹ اپ خود کاری  
- ڈیٹا بیس مائیگریشن سکرپٹس  
- تعیناتی کی تصدیقی ٹولز  
- لاگت کی نگرانی کے آلات  

## 🔧 تخصیص گائیڈ  

### اپنے استعمال کے لیے مثالوں کو اپنانا  

1. **ضروریات کا جائزہ لیں**  
   - Azure سروس کی ضروریات چیک کریں  
   - سبسکرپشن کی حدود کی تصدیق کریں  
   - لاگت کے اثرات سمجھیں  

2. **کنفیگریشن میں ترمیم کریں**  
   - `azure.yaml` سروس کی تعریفیں اپڈیٹ کریں  
   - بائسک ٹیمپلیٹس کو حسب ضرورت بنائیں  
   - ماحول کے متغیرات ایڈجسٹ کریں  

3. **مکمل جانچ کریں**  
   - پہلے ڈیولپمنٹ ماحول میں تعینات کریں  
   - فنکشنلٹی کی تصدیق کریں  
   - اسکیلنگ اور پرفارمنس کا معائنہ کریں  

4. **سیکیورٹی جائزہ**  
   - رسائی کنٹرولز کا جائزہ لیں  
   - سیکرٹس مینجمنٹ نافذ کریں  
   - نگرانی اور الارمنگ فعال کریں  

## 📊 موازنہ میٹرکس  

| مثال | سروسز | ڈیٹا بیس | اوتھ | نگرانی | پیچیدگی |  
|---------|----------|----------|------|------------|------------|  
| **Microsoft Foundry Models Chat** (لوکل) | 2 | ❌ | Key Vault | مکمل | ⭐⭐ |  
| **Python Flask API** (لوکل) | 1 | ❌ | بنیادی | مکمل | ⭐ |  
| **Microservices** (لوکل) | 5+ | ✅ | انٹرپرائز | ایڈوانسڈ | ⭐⭐⭐⭐ |  
| Node.js Express Todo | 2 | ✅ | بنیادی | بنیادی | ⭐ |  
| React SPA + Functions | 3 | ✅ | بنیادی | مکمل | ⭐ |  
| Python Flask Container | 2 | ❌ | بنیادی | مکمل | ⭐ |  
| C# Web API + SQL | 2 | ✅ | مکمل | مکمل | ⭐⭐ |  
| Python Functions + SPA | 3 | ✅ | مکمل | مکمل | ⭐⭐ |  
| Java Microservices | 5+ | ✅ | مکمل | مکمل | ⭐⭐ |  
| Microsoft Foundry Models Chat | 3 | ✅ | مکمل | مکمل | ⭐⭐⭐ |  
| AI Document Processing | 2 | ❌ | بنیادی | مکمل | ⭐⭐ |  
| ML Pipeline | 4+ | ✅ | مکمل | مکمل | ⭐⭐⭐⭐ |  
| **Retail Multi-Agent** (لوکل) | **8+** | **✅** | **انٹرپرائز** | **ایڈوانسڈ** | **⭐⭐⭐⭐** |  

## 🎓 تعلیمی راستہ  

### تجویز کردہ ترقی  

1. **سادہ ویب ایپ سے شروع کریں**  
   - بنیادی AZD تصورات سیکھیں  
   - تعیناتی کا ورک فلو سمجھیں  
   - ماحول کے انتظام کی مشق کریں  

2. **سٹیٹک ویب سائٹ آزمائیں**  
   - مختلف ہوسٹنگ اختیارات کا جائزہ لیں  
   - CDN انٹیگریشن کے بارے میں جانیں  
   - DNS کنفیگریشن سمجھیں  

3. **کنٹینر ایپ کی طرف بڑھیں**  
   - کنٹینرائزیشن کی بنیادی باتیں سیکھیں  
   - اسکیلنگ کے تصورات سمجھیں  
   - Docker کے ساتھ مشق کریں  

4. **ڈیٹا بیس انٹیگریشن شامل کریں**  
   - ڈیٹا بیس پروویژنینگ سیکھیں  
   - کنکشن سٹرنگز سمجھیں  
   - سیکرٹس مینجمنٹ پر مشق کریں  

5. **سرورلیس ایکسپلور کریں**  
   - ایونٹ ڈرائیون آرکیٹیکچر سمجھیں  
   - ٹرگرز اور بائنڈنگز کے بارے میں جانیں  
   - APIs کے ساتھ مشق کریں  

6. **مائیکروسروسز بنائیں**  
   - سروس کمیونیکیشن سیکھیں  
   - ڈسٹری بیوٹڈ سسٹمز سمجھیں  
   - پیچیدہ تعیناتیاں کریں  

## 🔍 صحیح مثال تلاش کرنا  

### ٹیکنالوجی اسٹیک کی بنیاد پر  
- **کنٹینر ایپس**: [Python Flask API (لوکل)](../../../examples/container-app/simple-flask-api), [Microservices (لوکل)](../../../examples/container-app/microservices), Java Microservices  
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (لوکل)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (لوکل)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (لوکل)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [Microservices Order Service (لوکل)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline  
- **Go**: [Microservices User Service (لوکل)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot Microservices  
- **React**: React SPA + Functions  
- **کنٹینرز**: [Python Flask (لوکل)](../../../examples/container-app/simple-flask-api), [Microservices (لوکل)](../../../examples/container-app/microservices), Java Microservices  
- **ڈیٹا بیسز**: [Microservices (لوکل)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **AI/ML**: **[Microsoft Foundry Models Chat (لوکل)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **ریٹیل ملٹی-ایجنٹ سلوشن**  
- **ملٹی ایجنٹ سسٹمز**: **ریٹیل ملٹی-ایجنٹ سلوشن**  
- **OpenAI انٹیگریشن**: **[Microsoft Foundry Models Chat (لوکل)](../../../examples/azure-openai-chat)**، ریٹیل ملٹی-ایجنٹ سلوشن  
- **انٹرپرائز پروڈکشن**: [Microservices (لوکل)](../../../examples/container-app/microservices)، **ریٹیل ملٹی-ایجنٹ سلوشن**  

### آرکیٹیکچر پیٹرن کی بنیاد پر  
- **سادہ REST API**: [Python Flask API (لوکل)](../../../examples/container-app/simple-flask-api)  
- **مونولیتھک**: Node.js Express Todo، C# Web API + SQL  
- **سٹیٹک + سرورلیس**: React SPA + Functions، Python Functions + SPA  
- **مائیکروسروسز**: [Production Microservices (لوکل)](../../../examples/container-app/microservices)، Java Spring Boot Microservices  
- **کنٹینرائزڈ**: [Python Flask (لوکل)](../../../examples/container-app/simple-flask-api)، [Microservices (لوکل)](../../../examples/container-app/microservices)  
- **AI پاورڈ**: **[Microsoft Foundry Models Chat (لوکل)](../../../examples/azure-openai-chat)**، Microsoft Foundry Models Chat App، AI Document Processing، ML Pipeline، **ریٹیل ملٹی-ایجنٹ سلوشن**  
- **ملٹی ایجنٹ آرکیٹیکچر**: **ریٹیل ملٹی-ایجنٹ سلوشن**  
- **انٹرپرائز ملٹی سروس**: [Microservices (لوکل)](../../../examples/container-app/microservices)، **ریٹیل ملٹی-ایجنٹ سلوشن**  

### پیچیدگی کی سطح کے مطابق  
- **ابتدائی**: [Python Flask API (لوکل)](../../../examples/container-app/simple-flask-api)، Node.js Express Todo، React SPA + Functions  
- **درمیانہ**: **[Microsoft Foundry Models Chat (لوکل)](../../../examples/azure-openai-chat)**، C# Web API + SQL، Python Functions + SPA، Java Microservices، Microsoft Foundry Models Chat App، AI Document Processing  
- **ایڈوانسڈ**: ML Pipeline  
- **انٹرپرائز پروڈکشن ریڈی**: [Microservices (لوکل)](../../../examples/container-app/microservices) (ملٹی سروس وی تھ میسج کیوئنگ)، **ریٹیل ملٹی-ایجنٹ سلوشن** (مکمل ملٹی-ایجنٹ سسٹم ARM ٹیمپلیٹ کے ساتھ تعیناتی)  

## 📚 اضافی وسائل  

### دستاویزات کے لنکس  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Microsoft Foundry AZD ٹیمپلیٹس](https://github.com/Azure/ai-foundry-templates)  
- [بائسک دستاویزات](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure آرکیٹیکچر سینٹر](https://learn.microsoft.com/en-us/azure/architecture/)  

### کمیونٹی مثالیں  
- [Azure Samples AZD ٹیمپلیٹس](https://github.com/Azure-Samples/azd-templates)  
- [Microsoft Foundry ٹیمپلیٹس](https://github.com/Azure/ai-foundry-templates)  
- [Azure Developer CLI گیلری](https://azure.github.io/awesome-azd/)  
- [C# اور Azure SQL کے ساتھ Todo ایپ](https://github.com/Azure-Samples/todo-csharp-sql)  
- [Python اور MongoDB کے ساتھ Todo ایپ](https://github.com/Azure-Samples/todo-python-mongo)  
- [Node.js اور PostgreSQL کے ساتھ Todo ایپ](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [C# API کے ساتھ ری ایکٹ ویب ایپ](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [ایزور کنٹینر ایپس جاب](https://github.com/Azure-Samples/container-apps-jobs)
- [جاوا کے ساتھ ایزور فنگشنز](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### بہترین مشقیں
- [ایزور ویل-آرکیٹیکٹڈ فریم ورک](https://learn.microsoft.com/en-us/azure/well-architected/)
- [کلاؤڈ اپنانے کا فریم ورک](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 مثالیں شامل کرنا

کیا آپ کے پاس کوئی مفید مثال شیئر کرنے کے لیے ہے؟ ہم تعاون کو خوش آمدید کہتے ہیں!

### جمع کرانے کے رہنما اصول
1. قائم شدہ ڈائریکٹری ڈھانچے کی پیروی کریں
2. جامع README.md شامل کریں
3. کنفیگریشن فائلوں میں تبصرے شامل کریں
4. جمع کرانے سے پہلے مکمل جانچ کریں
5. لاگت کے تخمینے اور ضروریات شامل کریں

### مثال کا ٹیمپلیٹ ڈھانچہ
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

**پروف ٹپ**: سب سے سادہ مثال سے شروع کریں جو آپ کے ٹیکنالوجی اسٹیک سے میل کھاتی ہو، پھر بتدریج زیادہ پیچیدہ منظرناموں کی طرف بڑھیں۔ ہر مثال پچھلی مثالوں کے تصورات پر تعمیر ہوتی ہے!

## 🚀 شروع کرنے کے لیے تیار؟

### آپ کا سیکھنے کا راستہ

1. **بالکل ابتدائی؟** → [Flask API](../../../examples/container-app/simple-flask-api) سے شروع کریں (⭐، 20 منٹ)
2. **بنیادی AZD معلومات ہے؟** → [مائیکروسرویسز](../../../examples/container-app/microservices) آزما کر دیکھیں (⭐⭐⭐⭐، 60 منٹ)
3. **AI ایپس بنا رہے ہیں؟** → [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) سے شروع کریں (⭐⭐، 35 منٹ) یا [Retail Multi-Agent](retail-scenario.md) دریافت کریں (⭐⭐⭐⭐، 2+ گھنٹے)
4. **کسی خاص ٹیک اسٹیک کی ضرورت ہے؟** → اوپر دیئے گئے [صحیح مثال تلاش کریں](#-finding-the-right-example) سیکشن کا استعمال کریں

### اگلے اقدامات

- ✅ اوپر دیئے گئے [ضروریات](#ضروریات) کا جائزہ لیں
- ✅ اپنی مہارت کی سطح سے مطابقت رکھنے والی مثال منتخب کریں (دیکھیں [پیچیدگی کی لیجنڈ](#پیچیدگی-کی-درجہ-بندی))
- ✅ مثال کے README کو غور سے پڑھیں قبل از تعیناتی
- ✅ جانچ کے بعد `azd down` چلانے کے لیے ریمائنڈر سیٹ کریں
- ✅ اپنا تجربہ GitHub Issues یا Discussions کے ذریعے شیئر کریں

### مدد چاہیے؟

- 📖 [عمومی سوالات](../resources/faq.md) - عام سوالوں کے جواب
- 🐛 [مسائل حل کرنے کی رہنمائی](../docs/chapter-07-troubleshooting/common-issues.md) - تعیناتی کے مسائل حل کریں
- 💬 [GitHub بحث و مباحثہ](https://github.com/microsoft/AZD-for-beginners/discussions) - کمیونٹی سے پوچھیں
- 📚 [مطالعہ گائیڈ](../resources/study-guide.md) - آپ کی سمجھ کو مضبوط کریں

---

**نیویگیشن**
- **📚 کورس ہوم**: [AZD For Beginners](../README.md)
- **📖 مطالعہ کے مواد**: [مطالعہ گائیڈ](../resources/study-guide.md) | [چیٹ شیٹ](../resources/cheat-sheet.md) | [گلاسری](../resources/glossary.md)
- **🔧 وسائل**: [عمومی سوالات](../resources/faq.md) | [مسائل حل کرنے](../docs/chapter-07-troubleshooting/common-issues.md)

---

*آخری تازہ کاری: نومبر 2025 | [مسائل رپورٹ کریں](https://github.com/microsoft/AZD-for-beginners/issues) | [مثالیں شامل کریں](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ڈس کلیمر**:
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے ترجمہ کی گئی ہے۔ جبکہ ہم درستگی کے لیے کوشاں ہیں، براہ کرم اس بات سے آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا عدم درستیاں ہو سکتی ہیں۔ اصل دستاویز اپنے مادری زبان میں مستند ماخذ سمجھی جائے گی۔ حساس معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کی ذمہ داری ہم قبول نہیں کرتے۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->