# مثالیں - عملی AZD ٹیمپلیٹس اور ترتیبیں

**مثال سے سیکھنا - باب وار ترتیب دی گئی**  
- **📚 کورس ہوم**: [AZD برائے مبتدی](../README.md)  
- **📖 باب کی درجہ بندی**: مثالیں سیکھنے کی پیچیدگی کے مطابق منظم  
- **🚀 لوکل مثال**: [ریٹیل ملٹی ایجنٹ سلوشن](retail-scenario.md)  
- **🤖 بیرونی AI مثالیں**: Azure Samples ریپوزٹریز کے لنکس  

> **📍 اہم: لوکل بمقابلہ بیرونی مثالیں**  
> اس ریپوزٹری میں **4 مکمل لوکل مثالیں** شامل ہیں جن کی مکمل عملداری ہے:  
> - **Microsoft Foundry Models Chat** (gpt-4.1 ڈپلائمنٹ کے ساتھ چیٹ انٹرفیس)  
> - **Container Apps** (سادہ Flask API + مائیکروسروسز)  
> - **Database App** (ویب + SQL ڈیٹا بیس)  
> - **Retail Multi-Agent** (انٹرپرائز AI سلوشن)  
>  
> اضافی مثالیں **بیرونی حوالہ جات** ہیں جو Azure-Samples ریپوزٹریز کی طرف اشارہ کرتی ہیں جنہیں آپ کلون کر سکتے ہیں۔

## تعارف

یہ ڈائریکٹری عملی مثالیں اور حوالہ جات فراہم کرتی ہے تاکہ آپ Azure Developer CLI کو ہاتھوں سے مشق کے ذریعے سیکھ سکیں۔ ریٹیل ملٹی ایجنٹ منظرنامہ اس ریپوزٹری میں شامل ایک مکمل، پروڈکشن کے قابل نفاذ کام ہے۔ اضافی مثالیں سرکاری Azure Samples کو ریفرنس کرتی ہیں جو مختلف AZD پیٹرنز دکھاتی ہیں۔

### پیچیدگی کی درجہ بندی کی وضاحت

- ⭐ **ابتدائی** - بنیادی تصورات، واحد سروس، 15-30 منٹ  
- ⭐⭐ **درمیانی** - متعدد سروسز، ڈیٹا بیس انٹیگریشن، 30-60 منٹ  
- ⭐⭐⭐ **اعلیٰ** - پیچیدہ فن تعمیر، AI انضمام، 1-2 گھنٹے  
- ⭐⭐⭐⭐ **ماہرانہ** - پروڈکشن کے قابل، انٹرپرائز پیٹرنز، 2+ گھنٹے  

## 🎯 اس ریپوزٹری میں اصل میں کیا ہے

### ✅ لوکل نفاذ (استعمال کے لیے تیار)

#### [Microsoft Foundry Models Chat Application](azure-openai-chat/README.md) 🆕  
**مکمل gpt-4.1 ڈپلائمنٹ چیٹ انٹرفیس کے ساتھ اس ریپو میں شامل**

- **مقام:** `examples/azure-openai-chat/`  
- **پیچیدگی:** ⭐⭐ (درمیانی)  
- **شامل ہے:**  
  - مکمل Microsoft Foundry Models کی ڈپلائمنٹ (gpt-4.1)  
  - پائتھن کمانڈ لائن چیٹ انٹرفیس  
  - محفوظ API کیز کے لئے Key Vault انٹیگریشن  
  - Bicep انفراسٹرکچر ٹیمپلیٹس  
  - ٹوکن استعمال اور لاگت کا پتہ لگانا  
  - ریٹ لمٹ اور ایرر ہینڈلنگ  

**فوری آغاز:**  
```bash
# مثال کی طرف جائیں
cd examples/azure-openai-chat

# سب کچھ تعینات کریں
azd up

# انحصاریات انسٹال کریں اور گفتگو شروع کریں
pip install -r src/requirements.txt
python src/chat.py
```
  
**ٹیکنالوجیز:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep  

#### [Container App Examples](container-app/README.md) 🆕  
**مکمل کانٹینر ڈپلائمنٹ کی مثالیں اس ریپو میں شامل**

- **مقام:** `examples/container-app/`  
- **پیچیدگی:** ⭐-⭐⭐⭐⭐ (ابتدائی سے اعلیٰ تک)  
- **شامل ہے:**  
  - [ماسٹر گائیڈ](container-app/README.md) - کانٹینر ڈپلائمنٹس کا مکمل جائزہ  
  - [سادہ Flask API](../../../examples/container-app/simple-flask-api) - بنیادی REST API مثال  
  - [مائیکروسروسز آرکیٹیکچر](../../../examples/container-app/microservices) - پروڈکشن کے قابل متعدد سروسز کی تعیناتی  
  - فوری آغاز، پروڈکشن، اور اعلیٰ پیٹرنز  
  - مانیٹرنگ، سیکیورٹی، اور لاگت کی اصلاح  

**فوری آغاز:**  
```bash
# ماسٹر گائیڈ دیکھیں
cd examples/container-app

# آسان فلاسک API تعینات کریں
cd simple-flask-api
azd up

# مائیکرو سروسز کی مثال تعینات کریں
cd ../microservices
azd up
```
  
**ٹیکنالوجیز:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights  

#### [Retail Multi-Agent Solution](retail-scenario.md) 🆕  
**مکمل پروڈکشن کے قابل نفاذ اس ریپو میں شامل ہے**

- **مقام:** `examples/retail-multiagent-arm-template/`  
- **پیچیدگی:** ⭐⭐⭐⭐ (اعلیٰ)  
- **شامل ہے:**  
  - مکمل ARM ڈپلائمنٹ ٹیمپلیٹ  
  - ملٹی ایجنٹ آرکیٹیکچر (کسٹمر + انوینٹری)  
  - Microsoft Foundry Models انٹیگریشن  
  - AI سرچ RAG کے ساتھ  
  - جامع مانیٹرنگ  
  - ایک کلک سے ڈپلائمنٹ اسکرپٹ  

**فوری آغاز:**  
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```
  
**ٹیکنالوجیز:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights  

---

## 🔗 بیرونی Azure Samples (کلون کر کے استعمال کریں)

مندرجہ ذیل مثالیں سرکاری Azure-Samples ریپوزٹریز میں رکھی گئی ہیں۔ مختلف AZD پیٹرنز کو دریافت کرنے کے لئے انہیں کلون کریں:

### سادہ ایپلیکیشنز (باب 1-2)

| ٹیمپلیٹ | ریپوزٹری | پیچیدگی | سروسز |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [لوکل: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [لوکل: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | متعدد سروسز, Service Bus, Cosmos DB, SQL |
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
  
### AI ایپلیکیشن مثالیں (باب 2، 5، 8)

| ٹیمپلیٹ | ریپوزٹری | پیچیدگی | فوکس |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [لوکل: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 ڈپلائمنٹ |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | بنیادی AI چیٹ |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | ایجنٹ فریم ورک |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG پیٹرن |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | انٹرپرائز AI |

### ڈیٹا بیس اور اعلیٰ پیٹرنز (باب 3-8)

| ٹیمپلیٹ | ریپوزٹری | پیچیدگی | فوکس |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | ڈیٹا بیس انٹیگریشن |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL سرورلیس |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | متعدد سروسز |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## سیکھنے کے مقاصد

ان مثالوں پر کام کر کے آپ:  
- حقیقی ایپلیکیشن منظرناموں کے ساتھ Azure Developer CLI ورک فلو کی مشق کریں گے  
- مختلف ایپلیکیشن آرکیٹیکچرز اور ان کی azd عملدرآمدات کو سمجھیں گے  
- مختلف Azure سروسز کے لئے Infrastructure as Code پیٹرنز میں مہارت حاصل کریں گے  
- ترتیب مینجمنٹ اور ماحول مخصوص تعیناتی حکمت عملیوں کو لاگو کریں گے  
- عملی سیاق و سباق میں مانیٹرنگ، سیکیورٹی، اور اسکیلنگ پیٹرنز کو نافذ کریں گے  
- حقیقی تعیناتی منظرناموں میں مسئلہ شناسی اور ڈیبگنگ کا تجربہ حاصل کریں گے  

## سیکھنے کے نتائج

ان مثالوں کو مکمل کرنے کے بعد آپ:  
- Azure Developer CLI استعمال کرتے ہوئے مختلف ایپلیکیشن اقسام کی تعیناتی اعتماد کے ساتھ کر سکیں گے  
- فراہم کردہ ٹیمپلیٹس کو اپنی ایپلیکیشن کی ضروریات کے مطابق ڈھال سکیں گے  
- Bicep کا استعمال کرتے ہوئے کسٹم انفراسٹرکچر پیٹرنز ڈیزائن اور نافذ کر سکیں گے  
- درست انحصاریوں کے ساتھ پیچیدہ ملٹی سروس ایپلیکیشنز کی ترتیب کر سکیں گے  
- حقیقی منظرناموں میں سیکیورٹی، مانیٹرنگ، اور کارکردگی کی بہترین مشقیں اپنائیں گے  
- عملی تجربے کی بنیاد پر تعیناتیوں کی مسئلہ شناسی اور اصلاح کریں گے  

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
  
## فوری شروع کی مثالیں

> **💡 AZD میں نئے ہیں؟** مثال #1 (Flask API) سے شروع کریں - اس میں ~20 منٹ لگتے ہیں اور بنیادی تصورات سکھاتا ہے۔

### مبتدیوں کے لیے
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (لوکل) ⭐  
   سادہ REST API تعینات کریں جس میں scale-to-zero ہو  
   **وقت:** 20-25 منٹ | **لاگت:** $0-5/ماہ  
   **آپ سیکھیں گے:** بنیادی azd ورک فلو، کانٹینرائزیشن، ہیلتھ پروبز  
   **متوقع نتیجہ:** کام کرنے والا API اینڈ پوائنٹ جو "Hello, World!" واپس کرے گا اور مانیٹر ہو گا  

2. **[سادہ ویب ایپ - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   MongoDB کے ساتھ Node.js Express ویب ایپ تعینات کریں  
   **وقت:** 25-35 منٹ | **لاگت:** $10-30/ماہ  
   **آپ سیکھیں گے:** ڈیٹا بیس انٹیگریشن، ماحول متغیرات، کنکشن سٹرنگز  
   **متوقع نتیجہ:** ٹوڈو لسٹ ایپ جس میں create/read/update/delete فنکشنلٹی موجود ہو  

3. **[جامد ویب سائٹ - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Azure Static Web Apps کے ساتھ React جامد ویب سائٹ ہوسٹ کریں  
   **وقت:** 20-30 منٹ | **لاگت:** $0-10/ماہ  
   **آپ سیکھیں گے:** جامد ہوسٹنگ، سرورلیس فنکشنز، CDN تعیناتی  
   **متوقع نتیجہ:** React UI کے ساتھ API بیک اینڈ، خودکار SSL، عالمی CDN  

### درمیانے درجے کے صارفین کے لیے
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (لوکل) ⭐⭐  
   gpt-4.1 تعینات کریں چیٹ انٹرفیس اور محفوظ API کی مینجمنٹ کے ساتھ  
   **وقت:** 35-45 منٹ | **لاگت:** $50-200/ماہ  
   **آپ سیکھیں گے:** Microsoft Foundry Models کی ڈپلائمنٹ، Key Vault انٹیگریشن، ٹوکن ٹریکنگ  
   **متوقع نتیجہ:** کام کرنے والی چیٹ ایپلیکیشن gpt-4.1 اور لاگت کی نگرانی کے ساتھ  

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (لوکل) ⭐⭐⭐⭐  
   پروڈکشن کے قابل متعدد سروسز کا فن تعمیر  
   **وقت:** 45-60 منٹ | **لاگت:** $50-150/ماہ  
   **آپ سیکھیں گے:** سروس کمیونیکیشن، میسج کیونگ، تقسیم شدہ ٹریسنگ  
   **متوقع نتیجہ:** 2-سروس سسٹم (API گیٹ وے + پروڈکٹ سروس) مانیٹرنگ کے ساتھ  

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   C# API اور Azure SQL ڈیٹا بیس کے ساتھ ویب ایپلیکیشن  
   **وقت:** 30-45 منٹ | **لاگت:** $20-80/ماہ  
   **آپ سیکھیں گے:** Entity Framework، ڈیٹا بیس مائیگریشنز، کنکشن سیکیورٹی  
   **متوقع نتیجہ:** C# API Azure SQL بیک اینڈ کے ساتھ، خودکار اسکیمہ تعیناتی  

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   HTTP ٹریگرز اور Cosmos DB کے ساتھ Python Azure Functions  
   **وقت:** 30-40 منٹ | **لاگت:** $10-40/ماہ  
   **آپ سیکھیں گے:** ایونٹ ڈرائیون آرکیٹیکچر، سرورلیس اسکیلنگ، NoSQL انٹیگریشن  
   **متوقع نتیجہ:** HTTP درخواستوں کا جواب دینے والی فنکشن ایپ Cosmos DB اسٹوریج کے ساتھ  

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Container Apps اور API گیٹ وے کے ساتھ متعدد سروسز والی Java ایپلیکیشن  
   **وقت:** 60-90 منٹ | **لاگت:** $80-200/ماہ  
   **آپ سیکھیں گے:** Spring Boot کی ڈپلائمنٹ، سروس میش، لوڈ بیلنسنگ  
   **متوقع نتیجہ:** متعدد سروس Java سسٹم جس میں سروس کھوج اور روٹنگ شامل ہے  

### Microsoft Foundry ٹیمپلیٹس

1. **[Microsoft Foundry Models Chat App - لوکل مثال](../../../examples/azure-openai-chat)** ⭐⭐  
   مکمل gpt-4.1 ڈپلائمنٹ چیٹ انٹرفیس کے ساتھ  
   **وقت:** 35-45 منٹ | **لاگت:** $50-200/ماہ  
   **متوقع نتیجہ:** کام کرنے والی چیٹ ایپلیکیشن جس میں ٹوکن ٹریکنگ اور لاگت کی نگرانی ہو  

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   ذہین چیٹ ایپلیکیشن RAG آرکیٹیکچر کے ساتھ  
   **وقت:** 60-90 منٹ | **لاگت:** $100-300/ماہ  
   **متوقع نتیجہ:** RAG فیچرڈ چیٹ انٹرفیس دستاویز سرچ اور حوالہ جات کے ساتھ  

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Azure AI سروسز کے ذریعے دستاویزات کا تجزیہ  
   **وقت:** 40-60 منٹ | **لاگت:** $20-80/ماہ  
   **متوقع نتیجہ:** API جو اپ لوڈ شدہ دستاویزات سے متن، جدولیں اور اکائیاں نکالے  

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Azure Machine Learning کے ساتھ MLOps ورک فلو  
   **وقت:** 2-3 گھنٹے | **لاگت:** $150-500/ماہ  
   **متوقع نتیجہ:** خودکار ML پائپ لائن جس میں ٹریننگ، ڈپلائمنٹ، اور مانیٹرنگ شامل ہے  

### حقیقی دنیا کے منظرنامے

#### **Retail Multi-Agent Solution** 🆕  
**[مکمل نفاذ گائیڈ](./retail-scenario.md)**  

ایک جامع، پروڈکشن کے قابل ملٹی ایجنٹ کسٹمر سپورٹ سلوشن جو انٹرپرائز گریڈ AI ایپلیکیشن کی AZD کے ساتھ تعیناتی دکھاتا ہے۔ یہ منظرنامہ فراہم کرتا ہے:
- **مکمل فن تعمیر**: کثیر الاجراء نظام جس میں مخصوص کسٹمر سروس اور انوینٹری مینجمنٹ ایجنٹ شامل ہیں  
- **پیداوار کا انفراسٹرکچر**: ملٹی-ریجن Microsoft Foundry Models کی تنصیبات، AI سرچ، کنٹینر ایپس، اور مکمل نگرانی  
- **تیار برائے تعیناتی ARM ٹیمپلیٹ**: ایک کلک تنصیب کے ساتھ متعدد کنفیگریشن موڈز (Minimal/Standard/Premium)  
- **جدید خصوصیات**: ریڈ ٹیم سیکیورٹی کی تصدیق، ایجنٹ جائزہ فریم ورک، لاگت کی بہتری، اور مسئلہ حل کرنے کے رہنما  
- **حقیقی کاروباری سیاق و سباق**: ریٹیلر کسٹمر سپورٹ کے لیے فائل اپ لوڈز، سرچ انٹیگریشن، اور حرکیاتی اسکیلنگ  

**ٹیکنالوجیز**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini)، Azure AI Search، Container Apps، Cosmos DB، Application Insights، Document Intelligence، Bing Search API  

**پیچیدگی**: ⭐⭐⭐⭐ (ایڈوانسڈ - انٹرپرائز پروڈکشن ریڈی)  

**مناسب برائے**: AI ڈویلپرز، حل کے معمار، اور ٹیمیں جو پروڈکشن ملٹی-ایجنٹ نظام تعمیر کر رہی ہیں  

**فوری آغاز**: مکمل حل کو 30 منٹ سے کم وقت میں ARM ٹیمپلیٹ کے ساتھ `./deploy.sh -g myResourceGroup` چلا کر نصب کریں  

## 📋 استعمال کے ہدایات  

### لازمی شرائط  

کسی بھی مثال کو چلانے سے پہلے:  
- ✅ Azure سبسکرپشن جس میں مالک یا معاون کی رسائی ہو  
- ✅ Azure Developer CLI انسٹال شدہ ہو ([انسٹالیشن گائیڈ](../docs/chapter-01-foundation/installation.md))  
- ✅ Docker Desktop چل رہا ہو (کنٹینر کی مثالوں کے لیے)  
- ✅ مناسب Azure کوٹاز (مثال مخصوص ضروریات چیک کریں)  

> **💰 لاگت کی وارننگ:** تمام مثالیں حقیقی Azure وسائل تخلیق کرتی ہیں جن پر چارجز لگتے ہیں۔ لاگت کے تخمینے کے لیے ہر فائل کا README دیکھیں۔ ختم ہونے کے بعد `azd down` چلانا نہ بھولیں تاکہ جاری اخراجات سے بچا جا سکے۔  

### مقامی طور پر مثالوں کو چلانا  

1. **مثال کلون یا کاپی کریں**  
   ```bash
   # مطلوبہ مثال پر جائیں
   cd examples/simple-web-app
   ```
  
2. **AZD ماحول کو شروع کریں**  
   ```bash
   # موجودہ ٹیمپلیٹ کے ساتھ شروعات کریں
   azd init
   
   # یا نیا ماحول بنائیں
   azd env new my-environment
   ```
  
3. **ماحول کی کنفیگریشن کریں**  
   ```bash
   # مطلوبہ متغیرات سیٹ کریں
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```
  
4. **تنصیب کریں**  
   ```bash
   # انفراسٹرکچر اور ایپلیکیشن کو تعینات کریں
   azd up
   ```
  
5. **تنصیب کی تصدیق کریں**  
   ```bash
   # سروس اینڈ پوائنٹس حاصل کریں
   azd env get-values
   
   # اینڈ پوائنٹ کی جانچ کریں (مثال)
   curl https://your-app-url.azurecontainer.io/health
   ```
  
   **متوقع کامیابی کے اشارے:**  
   - ✅ `azd up` بغیر غلطیوں کے مکمل ہو  
   - ✅ سروس اینڈپوائنٹ HTTP 200 واپس کرے  
   - ✅ Azure پورٹل "چل رہا ہے" کی حالت دکھائے  
   - ✅ Application Insights ٹیلی میٹری وصول کر رہا ہو  

> **⚠️ مسائل؟** تنصیب کے مسائل کے حل کے لیے [عام مسائل](../docs/chapter-07-troubleshooting/common-issues.md) دیکھیں  

### مثالوں کو اپنے مطابق ڈھالنا  

ہر مثال میں شامل ہے:  
- **README.md** - تفصیلی سیٹ اپ اور تخصیص کی ہدایات  
- **azure.yaml** - AZD کنفیگریشن بمع کمنٹس  
- **infra/** - بائسک ٹیمپلیٹس بمع پیرا میٹر کی وضاحت  
- **src/** - نمونہ ایپلیکیشن کوڈ  
- **scripts/** - عام کاموں کے لیے معاون اسکرپٹس  

## 🎯 تعلیمی مقاصد  

### مثالوں کے زمرے  

#### **بنیادی تنصیبات**  
- واحد سروس ایپلیکیشنز  
- سادہ انفراسٹرکچر کے پیٹرنز  
- بنیادی کنفیگریشن مینجمنٹ  
- کم خرچ ترقی کے سیٹ اپس  

#### **ایڈوانسڈ منظرنامے**  
- کثیر سروسز فن تعمیر  
- پیچیدہ نیٹ ورکنگ کنفیگریشن  
- ڈیٹا بیس انٹیگریشن پیٹرنز  
- سیکیورٹی اور تعمیل کے نفاذ  

#### **پیداواری-تیار پیٹرنز**  
- اعلی دستیابی کی ترتیبیں  
- نگرانی اور نظرثانی  
- CI/CD انٹیگریشن  
- آفات کی بحالی کے سیٹ اپس  

## 📖 مثالوں کی وضاحت  

### سادہ ویب ایپ - Node.js Express  
**ٹیکنالوجیز**: Node.js, Express, MongoDB, Container Apps  
**پیچیدگی**: ابتدائی  
**تصورات**: بنیادی تعیناتی، REST API، NoSQL ڈیٹا بیس انٹیگریشن  

### جامد ویب سائٹ - React SPA  
**ٹیکنالوجیز**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**پیچیدگی**: ابتدائی  
**تصورات**: جامد ہوسٹنگ، سرور لیس بیک اینڈ، جدید ویب ترقی  

### کنٹینر ایپ - Python Flask  
**ٹیکنالوجیز**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**پیچیدگی**: ابتدائی  
**تصورات**: کنٹینرائزیشن، REST API، صفر تک اسکیلنگ، صحت کے چیک، نگرانی  
**مقام**: [مقامی مثال](../../../examples/container-app/simple-flask-api)  

### کنٹینر ایپ - مائیکرو سروسز فن تعمیر  
**ٹیکنالوجیز**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**پیچیدگی**: ایڈوانسڈ  
**تصورات**: کثیر سروسز فن تعمیر، سروس کمیونیکیشن، میسج کیوئنگ، تقسیم شدہ ٹریسنگ  
**مقام**: [مقامی مثال](../../../examples/container-app/microservices)  

### ڈیٹا بیس ایپ - C# کے ساتھ Azure SQL  
**ٹیکنالوجیز**: C# ASP.NET Core, Azure SQL Database, App Service  
**پیچیدگی**: درمیانہ  
**تصورات**: Entity Framework، ڈیٹا بیس کنیکشنز، ویب API کی ترقی  

### سرور لیس فنکشن - Python Azure Functions  
**ٹیکنالوجیز**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**پیچیدگی**: درمیانہ  
**تصورات**: ایونٹ ڈرائیون آرکیٹیکچر، سرور لیس کمپیوٹنگ، فل اسٹیک ترقی  

### مائیکرو سروسز - Java Spring Boot  
**ٹیکنالوجیز**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**پیچیدگی**: درمیانہ  
**تصورات**: مائیکرو سروسز کمیونیکیشن، تقسیم شدہ نظام، انٹرپرائز پیٹرنز  

### Microsoft Foundry مثالیں  

#### Microsoft Foundry Models چیٹ ایپ  
**ٹیکنالوجیز**: Microsoft Foundry Models, Cognitive Search, App Service  
**پیچیدگی**: درمیانہ  
**تصورات**: RAG فن تعمیر، ویکٹر سرچ، LLM انٹیگریشن  

#### AI دستاویز پراسیسنگ  
**ٹیکنالوجیز**: Azure AI Document Intelligence, اسٹوریج، فانکشنز  
**پیچیدگی**: درمیانہ  
**تصورات**: دستاویزات کا تجزیہ، OCR، ڈیٹا کا استخراج  

#### مشین لرننگ پائپ لائن  
**ٹیکنالوجیز**: Azure ML, MLOps, Container Registry  
**پیچیدگی**: ایڈوانسڈ  
**تصورات**: ماڈل ٹریننگ، تعیناتی پائپ لائنز، نگرانی  

## 🛠 کنفیگریشن مثالیں  

`configurations/` ڈائریکٹری میں دہرائے جانے والے اجزاء شامل ہیں:  

### ماحول کی کنفیگریشنز  
- ترقیاتی ماحول کی ترتیبات  
- اسٹیجنگ ماحول کی کنفیگریشنز  
- پیداوار کے لیے تیار کنفیگرشنز  
- ملٹی-ریجن تعیناتی کے سیٹ اپ  

### بائسک ماڈیولز  
- قابل دوبارہ استعمال انفراسٹرکچر اجزاء  
- عام وسائل کے پیٹرنز  
- سیکیورٹی مضبوط ٹیمپلیٹس  
- لاگت کی بہتری کی کنفیگریشنز  

### معاون اسکرپٹس  
- ماحول کا خودکار سیٹ اپ  
- ڈیٹا بیس مائگریشن اسکرپٹس  
- تنصیب کی تصدیق کے اوزار  
- لاگت کی نگرانی کے آلات  

## 🔧 تخصیص گائیڈ  

### اپنی ضروریات کے لیے مثالوں کو ڈھالنا  

1. **لازمی شرائط کا جائزہ لیں**  
   - Azure سروس کی ضروریات چیک کریں  
   - سبسکرپشن کی حدود تصدیق کریں  
   - لاگت کے پہلو سمجھیں  

2. **کنفیگریشن میں تبدیلی کریں**  
   - `azure.yaml` سروس تعریفیں اپ ڈیٹ کریں  
   - بائسک ٹیمپلیٹس حسب ضرورت بنائیں  
   - ماحول کے متغیرات کو ایڈجسٹ کریں  

3. **مکمل جانچ کریں**  
   - پہلے ترقیاتی ماحول میں تعیناتی کریں  
   - فعالیت کی تصدیق کریں  
   - اسکیلنگ اور کارکردگی کا ٹیسٹ کریں  

4. **سیکیورٹی جائزہ لیں**  
   - رسائی کنٹرولز کا جائزہ لیں  
   - سیکریٹس مینجمنٹ نافذ کریں  
   - نگرانی اور الرٹس فعال کریں  

## 📊 موازنہ میٹرکس  

| مثال | خدمات | ڈیٹا بیس | توثیق | نگرانی | پیچیدگی |  
|---------|----------|----------|------|------------|------------|  
| **Microsoft Foundry Models چیٹ** (مقامی) | 2 | ❌ | کی والٹ | مکمل | ⭐⭐ |  
| **Python Flask API** (مقامی) | 1 | ❌ | بنیادی | مکمل | ⭐ |  
| **مائیکرو سروسز** (مقامی) | 5+ | ✅ | انٹرپرائز | ایڈوانسڈ | ⭐⭐⭐⭐ |  
| Node.js Express Todo | 2 | ✅ | بنیادی | بنیادی | ⭐ |  
| React SPA + Functions | 3 | ✅ | بنیادی | مکمل | ⭐ |  
| Python Flask Container | 2 | ❌ | بنیادی | مکمل | ⭐ |  
| C# Web API + SQL | 2 | ✅ | مکمل | مکمل | ⭐⭐ |  
| Python Functions + SPA | 3 | ✅ | مکمل | مکمل | ⭐⭐ |  
| Java Microservices | 5+ | ✅ | مکمل | مکمل | ⭐⭐ |  
| Microsoft Foundry Models چیٹ | 3 | ✅ | مکمل | مکمل | ⭐⭐⭐ |  
| AI دستاویز پراسیسنگ | 2 | ❌ | بنیادی | مکمل | ⭐⭐ |  
| ML پائپ لائن | 4+ | ✅ | مکمل | مکمل | ⭐⭐⭐⭐ |  
| **ریٹیل ملٹی-ایجنٹ** (مقامی) | **8+** | **✅** | **انٹرپرائز** | **ایڈوانسڈ** | **⭐⭐⭐⭐** |  

## 🎓 تعلیمی راستہ  

### تجویز کردہ پیش رفت  

1. **سادہ ویب ایپ سے شروع کریں**  
   - AZD کے بنیادی تصورات سیکھیں  
   - تعیناتی کے ورک فلو کو سمجھیں  
   - ماحول کی مینجمنٹ کی مشق کریں  

2. **جامد ویب سائٹ آزمائیں**  
   - مختلف ہوسٹنگ آپشنز دریافت کریں  
   - CDN انٹیگریشن کے بارے میں معلومات حاصل کریں  
   - DNS کنفیگریشن سمجھیں  

3. **کنٹینر ایپ پر منتقل ہوں**  
   - کنٹینرائزیشن کے بنیادی اصول سیکھیں  
   - اسکیلنگ کے تصورات سمجھیں  
   - Docker کے ساتھ مشق کریں  

4. **ڈیٹا بیس انٹیگریشن شامل کریں**  
   - ڈیٹا بیس کی فراہمی سیکھیں  
   - کنکشن سٹرنگز سمجھیں  
   - سیکریٹس مینجمنٹ کی مشق کریں  

5. **سرور لیس کی تلاش کریں**  
   - ایونٹ ڈرائیون آرکیٹیکچر کو سمجھیں  
   - ٹرگرز اور بائنڈنگز کے بارے میں جانیں  
   - APIs کے ساتھ مشق کریں  

6. **مائیکرو سروسز تعمیر کریں**  
   - سروس کمیونیکیشن سیکھیں  
   - تقسیم شدہ نظام سمجھیے  
   - پیچیدہ تعیناتی کی مشق کریں  

## 🔍 صحیح مثال تلاش کرنا  

### ٹیکنالوجی اسٹیک کے لحاظ سے  
- **کنٹینر ایپس**: [Python Flask API (مقامی)](../../../examples/container-app/simple-flask-api)، [مائیکرو سروسز (مقامی)](../../../examples/container-app/microservices)، Java Microservices  
- **Node.js**: Node.js Express Todo App, [مائیکرو سروسز API گیٹ وے (مقامی)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (مقامی)](../../../examples/container-app/simple-flask-api)، [مائیکرو سروسز پروڈکٹ سروس (مقامی)](../../../examples/container-app/microservices)، Python Functions + SPA  
- **C#**: [مائیکرو سروسز آرڈر سروس (مقامی)](../../../examples/container-app/microservices)، C# Web API + SQL Database، Microsoft Foundry Models چیٹ ایپ، ML پائپ لائن  
- **Go**: [مائیکرو سروسز یوزر سروس (مقامی)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot مائیکرو سروسز  
- **React**: React SPA + Functions  
- **کنٹینرز**: [Python Flask (مقامی)](../../../examples/container-app/simple-flask-api)، [مائیکرو سروسز (مقامی)](../../../examples/container-app/microservices)، Java Microservices  
- **ڈیٹا بیسز**: [مائیکرو سروسز (مقامی)](../../../examples/container-app/microservices)، Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **AI/ML**: **[Microsoft Foundry Models چیٹ (مقامی)](../../../examples/azure-openai-chat)**، Microsoft Foundry Models چیٹ ایپ، AI دستاویز پراسیسنگ، ML پائپ لائن، **ریٹیل ملٹی-ایجنٹ حل**  
- **کثیر الاجراء نظام**: **ریٹیل ملٹی-ایجنٹ حل**  
- **OpenAI انٹیگریشن**: **[Microsoft Foundry Models چیٹ (مقامی)](../../../examples/azure-openai-chat)**، ریٹیل ملٹی-ایجنٹ حل  
- **انٹرپرائز پروڈکشن**: [مائیکرو سروسز (مقامی)](../../../examples/container-app/microservices)، **ریٹیل ملٹی-ایجنٹ حل**  

### فن تعمیر کے پیٹرن کے مطابق  
- **سادہ REST API**: [Python Flask API (مقامی)](../../../examples/container-app/simple-flask-api)  
- **مونو لیتھک**: Node.js Express Todo, C# Web API + SQL  
- **جامد + سرور لیس**: React SPA + Functions, Python Functions + SPA  
- **مائیکرو سروسز**: [پیداواری مائیکرو سروسز (مقامی)](../../../examples/container-app/microservices)، Java Spring Boot مائیکرو سروسز  
- **کنٹینرائزڈ**: [Python Flask (مقامی)](../../../examples/container-app/simple-flask-api)، [مائیکرو سروسز (مقامی)](../../../examples/container-app/microservices)  
- **AI سے لیس**: **[Microsoft Foundry Models چیٹ (مقامی)](../../../examples/azure-openai-chat)**، Microsoft Foundry Models چیٹ ایپ، AI دستاویز پراسیسنگ، ML پائپ لائن، **ریٹیل ملٹی-ایجنٹ حل**  
- **کثیر الاجراء فن تعمیر**: **ریٹیل ملٹی-ایجنٹ حل**  
- **انٹرپرائز ملٹی سروس**: [مائیکرو سروسز (مقامی)](../../../examples/container-app/microservices)، **ریٹیل ملٹی-ایجنٹ حل**  

### پیچیدگی کی سطح کے لحاظ سے  
- **ابتدائی**: [Python Flask API (مقامی)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **درمیانہ**: **[Microsoft Foundry Models چیٹ (مقامی)](../../../examples/azure-openai-chat)**، C# Web API + SQL، Python Functions + SPA، Java Microservices، Microsoft Foundry Models چیٹ ایپ، AI دستاویز پراسیسنگ  
- **ایڈوانسڈ**: ML پائپ لائن  
- **انٹرپرائز پروڈکشن-ریڈی**: [مائیکرو سروسز (مقامی)](../../../examples/container-app/microservices) (کثیر سروسز میسج کیوئنگ کے ساتھ)، **ریٹیل ملٹی-ایجنٹ حل** (مکمل کثیر الاجراء نظام ARM ٹیمپلیٹ تعیناتی کے ساتھ)  

## 📚 اضافی وسائل  

### دستاویزات کے لنکس  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Microsoft Foundry AZD ٹیمپلیٹس](https://github.com/Azure/ai-foundry-templates)  
- [بائسک دستاویزات](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure فن تعمیر مرکز](https://learn.microsoft.com/en-us/azure/architecture/)  

### کمیونٹی مثالیں  
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)  
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)  
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

## 🤝 نمونے فراہم کرنا

کیا آپ کے پاس کوئی مفید مثال شیئر کرنے کے لیے ہے؟ ہم تعاون کا خیرمقدم کرتے ہیں!

### جمع کرانے کے رہنما اصول  
1. مقررہ ڈائریکٹری کی ساخت کی پیروی کریں  
2. مکمل README.md شامل کریں  
3. کنفیگریشن فائلوں میں تبصرے شامل کریں  
4. جمع کرانے سے پہلے مکمل جانچ کریں  
5. لاگت کا تخمینہ اور پیشگی شرائط شامل کریں  

### مثال ٹیمپلیٹ کی ساخت  
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

**پروف ٹپ**: سب سے آسان مثال سے شروع کریں جو آپ کی ٹیکنالوجی اسٹیک سے میل کھاتی ہو، پھر آہستہ آہستہ زیادہ پیچیدہ حالات کی طرف بڑھیں۔ ہر مثال پچھلی مثالوں کے تصورات پر قائم ہوتی ہے!

## 🚀 شروع کرنے کے لیے تیار؟

### آپ کی سیکھنے کا راستہ

1. **مکمل مبتدی؟** → [Flask API](../../../examples/container-app/simple-flask-api) سے شروع کریں (⭐، 20 منٹ)  
2. **بنیادی AZD معلومات ہے؟** → [Microservices](../../../examples/container-app/microservices) آزمائیں (⭐⭐⭐⭐، 60 منٹ)  
3. **AI ایپس بنا رہے ہیں؟** → [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) سے شروع کریں (⭐⭐، 35 منٹ) یا [Retail Multi-Agent](retail-scenario.md) کو دریافت کریں (⭐⭐⭐⭐، 2+ گھنٹے)  
4. **کسی مخصوص ٹیک اسٹیک کی ضرورت ہے؟** → اوپر [Finding the Right Example](#-finding-the-right-example) سیکشن استعمال کریں  

### اگلے اقدامات

- ✅ اوپر [Prerequisites](#لازمی-شرائط) کا جائزہ لیں  
- ✅ اپنی مہارت کی سطح کے مطابق ایک مثال منتخب کریں (دیکھیں [Complexity Legend](#پیچیدگی-کی-درجہ-بندی-کی-وضاحت))  
- ✅ نمونے کی README کو تعیناتی سے پہلے مکمل طور پر پڑھیں  
- ✅ جانچ کے بعد `azd down` چلانے کا یاد دہانی سیٹ کریں  
- ✅ اپنے تجربے کو گیٹ ہب مسائل یا مباحثوں کے ذریعے شیئر کریں  

### مدد کی ضرورت ہے؟

- 📖 [عمومی سوالات](../resources/faq.md) - عمومی سوالات کے جوابات  
- 🐛 [مسائل کے حل کی گائیڈ](../docs/chapter-07-troubleshooting/common-issues.md) - تعیناتی کے مسائل حل کریں  
- 💬 [گیٹ ہب مباحثے](https://github.com/microsoft/AZD-for-beginners/discussions) - کمیونٹی سے پوچھیں  
- 📚 [مطالعہ گائیڈ](../resources/study-guide.md) - اپنی سمجھ کو مضبوط کریں  

---

**نیویگیشن**  
- **📚 کورس ہوم**: [AZD For Beginners](../README.md)  
- **📖 مطالعہ کے مواد**: [مطالعہ گائیڈ](../resources/study-guide.md) | [چیٹ شیٹ](../resources/cheat-sheet.md) | [اصطلاحات](../resources/glossary.md)  
- **🔧 وسائل**: [عمومی سوالات](../resources/faq.md) | [مسائل کے حل](../docs/chapter-07-troubleshooting/common-issues.md)  

---

*آخری اپڈیٹ: نومبر 2025 | [مسائل رپورٹ کریں](https://github.com/microsoft/AZD-for-beginners/issues) | [نمونے فراہم کریں](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ڈس کلیمر**:  
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے ترجمہ کی گئی ہے۔ اگرچہ ہم درستگی کے لیے کوشاں ہیں، براہ کرم آگاہ رہیں کہ خودکار ترجموں میں غلطیاں یا نقائص ہو سکتے ہیں۔ اصل دستاویز اپنی مادری زبان میں معتبر ذریعہ سمجھی جانی چاہیے۔ اہم معلومات کے لیے پیشہ ور انسانی ترجمہ تجویز کیا جاتا ہے۔ اس ترجمہ کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کی ذمہ داری ہم پر عائد نہیں ہوگی۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->