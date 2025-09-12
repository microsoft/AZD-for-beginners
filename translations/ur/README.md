<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee9a026a572535444287d531dbd75d78",
  "translation_date": "2025-09-12T18:38:23+00:00",
  "source_file": "README.md",
  "language_code": "ur"
}
-->
# AZD ابتدائی افراد کے لیے

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.ur.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/?WT.mc_id=academic-105485-koreyst)  
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/?WT.mc_id=academic-105485-koreyst)  
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/?WT.mc_id=academic-105485-koreyst)  

![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)  

![Azure AI Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/kzRShWzttr)  

ان وسائل کو استعمال کرنے کے لیے درج ذیل مراحل پر عمل کریں:  
1. **ریپوزٹری کو فورک کریں**: کلک کریں [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)  
2. **ریپوزٹری کو کلون کریں**: `git clone https://github.com/microsoft/azd-for-beginners.git`  
3. [**Azure Discord کمیونٹیز میں شامل ہوں اور ماہرین اور دیگر ڈویلپرز سے ملاقات کریں**](https://discord.com/invite/ByRwuEEgH4)  

### کثیر زبان کی حمایت

#### GitHub ایکشن کے ذریعے سپورٹ (خودکار اور ہمیشہ اپ ڈیٹ)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](./README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)  

**اگر آپ اضافی زبانوں کی حمایت چاہتے ہیں تو دستیاب زبانوں کی فہرست [یہاں](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md) موجود ہے۔**  

## تعارف

Azure Developer CLI (azd) کے لیے جامع گائیڈ میں خوش آمدید۔ یہ ریپوزٹری طلباء سے لے کر پیشہ ور ڈویلپرز تک ہر سطح کے ڈویلپرز کو Azure Developer CLI سیکھنے اور کلاؤڈ ڈیپلائمنٹ کو مؤثر طریقے سے انجام دینے میں مدد فراہم کرنے کے لیے تیار کی گئی ہے، **خاص طور پر Azure AI Foundry کے ذریعے AI ایپلیکیشن ڈیپلائمنٹ پر توجہ کے ساتھ**۔ یہ منظم تعلیمی وسائل Azure کلاؤڈ ڈیپلائمنٹ، عام مسائل کے حل، اور کامیاب AZD ٹیمپلیٹ ڈیپلائمنٹ کے لیے بہترین طریقوں کو نافذ کرنے کا عملی تجربہ فراہم کرتے ہیں۔  

### **AI ڈویلپرز کے لیے اس گائیڈ کی اہمیت**
Azure AI Foundry Discord کمیونٹی پول کے مطابق، **45% ڈویلپرز AZD کو AI ورک لوڈز کے لیے استعمال کرنے میں دلچسپی رکھتے ہیں** لیکن درج ذیل چیلنجز کا سامنا کرتے ہیں:  
- پیچیدہ ملٹی سروس AI آرکیٹیکچرز  
- پروڈکشن AI ڈیپلائمنٹ کے بہترین طریقے  
- Azure AI سروس انٹیگریشن اور کنفیگریشن  
- AI ورک لوڈز کے لیے لاگت کی اصلاح  
- AI مخصوص ڈیپلائمنٹ مسائل کا حل  

## سیکھنے کے اہداف

اس ریپوزٹری پر کام کرکے، آپ:  
- Azure Developer CLI کے بنیادی اصولوں اور تصورات میں مہارت حاصل کریں گے  
- انفراسٹرکچر کوڈ کے ذریعے Azure وسائل کو ڈیپلائے اور پروویژن کرنا سیکھیں گے  
- عام AZD ڈیپلائمنٹ مسائل کے حل کے لیے مہارت حاصل کریں گے  
- پری ڈیپلائمنٹ ویلیڈیشن اور صلاحیت کی منصوبہ بندی کو سمجھیں گے  
- سیکیورٹی کے بہترین طریقے اور لاگت کی اصلاح کی حکمت عملی نافذ کریں گے  
- Azure پر پروڈکشن ریڈی ایپلیکیشنز کو ڈیپلائے کرنے میں اعتماد پیدا کریں گے  

## سیکھنے کے نتائج

اس کورس کو مکمل کرنے کے بعد، آپ:  
- Azure Developer CLI کو کامیابی سے انسٹال، کنفیگر، اور استعمال کر سکیں گے  
- AZD ٹیمپلیٹس کا استعمال کرتے ہوئے ایپلیکیشنز تخلیق اور ڈیپلائے کر سکیں گے  
- تصدیق، انفراسٹرکچر، اور ڈیپلائمنٹ کے مسائل کو حل کر سکیں گے  
- پری ڈیپلائمنٹ چیکس بشمول صلاحیت کی منصوبہ بندی اور SKU کا انتخاب انجام دے سکیں گے  
- مانیٹرنگ، سیکیورٹی، اور لاگت کے انتظام کے بہترین طریقے نافذ کر سکیں گے  
- AZD ورک فلو کو CI/CD پائپ لائنز میں ضم کر سکیں گے  

## مواد کی فہرست

- [Azure Developer CLI کیا ہے؟](../..)  
- [فوری آغاز](../..)  
- [سیکھنے کا راستہ](../..)  
  - [AI ڈویلپرز کے لیے (یہاں سے شروع کریں!)](../..)  
  - [طلباء اور ابتدائی افراد کے لیے](../..)  
  - [ڈویلپرز کے لیے](../..)  
  - [DevOps انجینئرز کے لیے](../..)  
- [دستاویزات](../..)  
  - [آغاز](../..)  
  - [ڈیپلائمنٹ اور پروویژننگ](../..)  
  - [پری ڈیپلائمنٹ چیکس](../..)  
  - [AI اور Azure AI Foundry](../..)  
  - [مسائل کا حل](../..)  
- [مثالیں اور ٹیمپلیٹس](../..)  
  - [نمایاں: Azure AI Foundry ٹیمپلیٹس](../..)  
  - [نمایاں: Azure AI Foundry E2E منظرنامے](../..)  
  - [اضافی AZD ٹیمپلیٹس](../..)  
  - [عملی لیبز اور ورکشاپس](../..)  
- [وسائل](../..)  
- [شراکت](../..)  
- [مدد](../..)  
- [کمیونٹی](../..)  

## Azure Developer CLI کیا ہے؟

Azure Developer CLI (azd) ایک ڈویلپر مرکوز کمانڈ لائن انٹرفیس ہے جو Azure پر ایپلیکیشنز بنانے اور ڈیپلائے کرنے کے عمل کو تیز کرتا ہے۔ یہ فراہم کرتا ہے:  

- **ٹیمپلیٹ پر مبنی ڈیپلائمنٹ** - عام ایپلیکیشن پیٹرنز کے لیے پہلے سے تیار کردہ ٹیمپلیٹس کا استعمال  
- **انفراسٹرکچر کوڈ کے طور پر** - Bicep یا Terraform کے ذریعے Azure وسائل کا انتظام  
- **مربوط ورک فلو** - ایپلیکیشنز کو پروویژن، ڈیپلائے، اور مانیٹر کرنے کا ہموار عمل  
- **ڈویلپر دوستانہ** - ڈویلپرز کی پیداواریت اور تجربے کے لیے بہتر بنایا گیا  

### **AZD + Azure AI Foundry: AI ڈیپلائمنٹ کے لیے بہترین**

**AI حل کے لیے AZD کیوں؟** AZD AI ڈویلپرز کے سب سے بڑے چیلنجز کو حل کرتا ہے:  

- **AI ریڈی ٹیمپلیٹس** - Azure OpenAI، Cognitive Services، اور ML ورک لوڈز کے لیے پہلے سے کنفیگرڈ ٹیمپلیٹس  
- **محفوظ AI ڈیپلائمنٹ** - AI سروسز، API کیز، اور ماڈل اینڈ پوائنٹس کے لیے بلٹ ان سیکیورٹی پیٹرنز  
- **پروڈکشن AI پیٹرنز** - اسکیل ایبل، لاگت مؤثر AI ایپلیکیشن ڈیپلائمنٹ کے بہترین طریقے  
- **اینڈ ٹو اینڈ AI ورک فلو** - ماڈل ڈیولپمنٹ سے پروڈکشن ڈیپلائمنٹ تک مناسب مانیٹرنگ کے ساتھ  
- **لاگت کی اصلاح** - AI ورک لوڈز کے لیے سمارٹ وسائل کی تقسیم اور اسکیلنگ کی حکمت عملی  
- **Azure AI Foundry انٹیگریشن** - AI Foundry ماڈل کیٹلاگ اور اینڈ پوائنٹس سے ہموار کنکشن  

## فوری آغاز

### ضروریات  
- Azure سبسکرپشن  
- Azure CLI انسٹال شدہ  
- Git (ٹیمپلیٹس کلون کرنے کے لیے)  

### انسٹالیشن  
```bash
# Windows (PowerShell)
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"

# macOS/Linux
curl -fsSL https://aka.ms/install-azd.sh | bash
```  

### آپ کا پہلا ڈیپلائمنٹ  
```bash
# Initialize a new project
azd init --template todo-nodejs-mongo

# Provision Azure resources and deploy
azd up
```  

### آپ کا پہلا AI ڈیپلائمنٹ  
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

## سیکھنے کا راستہ

### AI ڈویلپرز کے لیے (یہاں سے شروع کریں!)  
1. **فوری آغاز**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) ٹیمپلیٹ آزمائیں  
2. **بنیادی اصول سیکھیں**: [AZD Basics](docs/getting-started/azd-basics.md) + [Azure AI Foundry Integration](docs/ai-foundry/azure-ai-foundry-integration.md)  
3. **عملی مشق**: [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) مکمل کریں  
4. **پروڈکشن ریڈی**: [Production AI Best Practices](docs/ai-foundry/production-ai-practices.md) کا جائزہ لیں  
5. **ایڈوانسڈ**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat) انٹرپرائز ٹیمپلیٹ ڈیپلائے کریں  

### طلباء اور ابتدائی افراد کے لیے  
1. [AZD Basics](docs/getting-started/azd-basics.md) سے شروع کریں  
2. [انسٹالیشن گائیڈ](docs/getting-started/installation.md) پر عمل کریں  
3. [آپ کا پہلا پروجیکٹ](docs/getting-started/first-project.md) مکمل کریں  
4. [سادہ ویب ایپ مثال](../../examples/simple-web-app) کے ساتھ مشق کریں  

### ڈویلپرز کے لیے  
1. [کنفیگریشن گائیڈ](docs/getting-started/configuration.md) کا جائزہ لیں  
2. [ڈیپلائمنٹ گائیڈ](docs/deployment/deployment-guide.md) کا مطالعہ کریں  
3. [ڈیٹا بیس ایپ مثال](../../examples/database-app) پر کام کریں  
4. [کنٹینر ایپ مثال](../../examples/container-app) کو دریافت کریں  

### DevOps انجینئرز کے لیے  
1. [وسائل کی پروویژننگ](docs/deployment/provisioning.md) میں مہارت حاصل کریں  
2. [پری فلائٹ چیکس](docs/pre-deployment/preflight-checks.md) نافذ کریں  
3. [صلاحیت کی منصوبہ بندی](docs/pre-deployment/capacity-planning.md) کی مشق کریں  
4. ایڈوانسڈ [مائیکرو سروسز مثال](../../examples/microservices) آزمائیں  

## دستاویزات

### آغاز  
- [**AZD Basics**](docs/getting-started/azd-basics.md) - بنیادی تصورات اور اصطلاحات  
- [**انسٹالیشن اور سیٹ اپ**](docs/getting-started/installation.md) - پلیٹ فارم مخصوص انسٹالیشن گائیڈز  
- [**کنفیگریشن**](docs/getting-started/configuration.md) - ماحول کی ترتیب اور تصدیق  
- [**آپ کا پہلا پروجیکٹ**](docs/getting-started/first-project.md) - مرحلہ وار ٹیوٹوریل  

### ڈیپلائمنٹ اور پروویژننگ  
- [**ڈیپلائمنٹ گائیڈ**](docs/deployment/deployment-guide.md) - مکمل ڈیپلائمنٹ ورک فلو  
- [**وسائل کی پروویژننگ**](docs/deployment/provisioning.md) - Azure وسائل کا انتظام  

### پری ڈیپلائمنٹ چیکس  
- [**صلاحیت کی منصوبہ بندی**](docs/pre-deployment/capacity-planning.md) - Azure وسائل کی صلاحیت کی توثیق  
- [**SKU کا انتخاب**](docs/pre-deployment/sku-selection.md) - صحیح Azure SKUs کا انتخاب  
- [**پری فلائٹ چیکس**](docs/pre-deployment/preflight-checks.md) - خودکار توثیق اسکرپٹس  

### AI اور Azure AI Foundry  
- [**Azure AI Foundry انٹیگریشن**](docs/ai-foundry/azure-ai-foundry-integration.md) - AZD کو Azure AI Foundry سروسز کے ساتھ جوڑیں  
- [**AI ماڈل ڈیپلائمنٹ پیٹرنز**](docs/ai-foundry/ai-model-deployment.md) - AZD کے ساتھ AI ماڈلز کو ڈیپلائے اور منظم کریں  
- [**AI ورکشاپ لیب**](docs/ai-foundry/ai-workshop-lab.md) - عملی لیب: AI حلوں کو AZD ریڈی بنانا  
- [**پروڈکشن AI بہترین طریقے**](docs/ai-foundry/production-ai-practices.md) - AI ورک لوڈز کے لیے سیکیورٹی، اسکیلنگ، اور مانیٹرنگ  

### مسائل کا حل  
- [**عام مسائل**](docs/troubleshooting/common-issues.md) - اکثر پیش آنے والے مسائل اور ان کے حل  
- [**ڈیبگنگ گائیڈ**](docs/troubleshooting/debugging.md) - مرحلہ وار ڈیبگنگ حکمت عملی
- [**AI سے متعلق مسائل کا حل**](docs/troubleshooting/ai-troubleshooting.md) - AI سروس اور ماڈل ڈیپلائمنٹ کے مسائل

## مثالیں اور ٹیمپلیٹس

### [نمایاں: Azure AI Foundry ٹیمپلیٹس](https://ai.azure.com/resource/build/templates)
**AI ایپلیکیشنز ڈیپلائے کرنے کے لیے یہاں سے شروع کریں!**

| ٹیمپلیٹ | تفصیل | پیچیدگی | سروسز |
|----------|-------------|------------|----------|
| [**AI چیٹ کے ساتھ شروعات کریں**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Azure Container Apps کا استعمال کرتے ہوئے ڈیٹا اور ٹیلیمیٹری ان سائٹس کے ساتھ ایک بنیادی چیٹ ایپلیکیشن بنائیں اور ڈیپلائے کریں |⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |
| [**AI ایجنٹس کے ساتھ شروعات کریں**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Azure Container Apps کا استعمال کرتے ہوئے ایک بنیادی ایجنٹ ایپلیکیشن بنائیں اور ڈیپلائے کریں، جس میں ایکشنز اور ٹیلیمیٹری ان سائٹس شامل ہوں۔ |⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|
| [**ملٹی ایجنٹ ورک فلو آٹومیشن**](https://github.com/Azure-Samples/get-started-with-ai-chat) | AI ایجنٹس کے گروپ کو منظم اور ترتیب دے کر ٹاسک پلاننگ اور آٹومیشن کو بہتر بنائیں۔|⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**اپنے ڈیٹا سے دستاویزات تیار کریں**](https://github.com/Azure-Samples/get-started-with-ai-chat) | اپنے ڈیٹا سے متعلقہ معلومات تلاش کرکے اور خلاصہ بنا کر دستاویزات جیسے معاہدے، انوائسز اور سرمایہ کاری کی تجاویز تیار کرنے میں تیزی لائیں۔ |⭐⭐⭐  | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|
| [**کلائنٹ میٹنگز کو ایجنٹس کے ساتھ بہتر بنائیں**](https://github.com/Azure-Samples/get-started-with-ai-chat) | ایجنٹس کی ٹیم کا استعمال کرتے ہوئے پرانے کوڈ کو جدید زبانوں میں منتقل کریں۔ |⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |
| [**اپنے کوڈ کو ایجنٹس کے ساتھ جدید بنائیں**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Azure Container Apps کا استعمال کرتے ہوئے ڈیٹا اور ٹیلیمیٹری ان سائٹس کے ساتھ ایک بنیادی چیٹ ایپلیکیشن بنائیں اور ڈیپلائے کریں۔ |⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**اپنا گفتگو کرنے والا ایجنٹ بنائیں**](https://github.com/Azure-Samples/get-started-with-ai-chat) | جدید گفتگو کی سمجھ بوجھ کا فائدہ اٹھائیں تاکہ چیٹ بوٹس اور ایجنٹس کو ڈیٹرمینسٹک اور انسانی کنٹرول کے قابل ورک فلو کے ساتھ بنایا اور بہتر بنایا جا سکے۔ |⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|
| [**گفتگو کے ڈیٹا سے ان سائٹس حاصل کریں**](https://github.com/Azure-Samples/get-started-with-ai-chat) | بڑے آڈیو اور ٹیکسٹ ڈیٹا سیٹس سے ان سائٹس حاصل کرکے کانٹیکٹ سینٹر کی کارکردگی کو بہتر بنائیں، جدید مواد کی سمجھ بوجھ کی صلاحیتوں کا استعمال کرتے ہوئے۔ |⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|
| [**ملٹی موڈل مواد کی پروسیسنگ**](https://github.com/Azure-Samples/get-started-with-ai-chat) | غیر ساختہ مواد سے معلومات نکال کر اور اسے ساختہ فارمیٹ میں میپ کرکے دعووں، انوائسز، معاہدوں اور دیگر دستاویزات کو جلدی اور درست طریقے سے پروسیس کریں۔ یہ ٹیمپلیٹ ٹیکسٹ، تصاویر، ٹیبلز اور گرافز کو سپورٹ کرتا ہے۔ |⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|

### نمایاں: Azure AI Foundry E2E منظرنامے
**AI ایپلیکیشنز ڈیپلائے کرنے کے لیے یہاں سے شروع کریں!**

| ٹیمپلیٹ | تفصیل | پیچیدگی | سروسز |
|----------|-------------|------------|----------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Azure OpenAI کے ساتھ سادہ چیٹ انٹرفیس | ⭐ | AzureOpenAI + Container Apps |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG-فعال چیٹ ایپ Azure OpenAI کے ساتھ | ⭐⭐ | AzureOpenAI + Search + App Service |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | AI سروسز کے ساتھ دستاویزات کا تجزیہ | ⭐⭐ | Azure Document Intelligence + Functions |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | فنکشن کالنگ کے ساتھ AI ایجنٹ فریم ورک | ⭐⭐⭐ | AzureOpenAI + Azure Container Apps + Functions |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | AI آرکسٹریشن کے ساتھ انٹرپرائز چیٹ | ⭐⭐⭐ | AzureOpenAI + Azure AI Search + Container Apps |

### اضافی AZD ٹیمپلیٹس
- [**مثالوں کی ڈائریکٹری**](examples/README.md) - عملی مثالیں، ٹیمپلیٹس، اور حقیقی دنیا کے منظرنامے
- [**Azure-Samples AZD ٹیمپلیٹس**](https://github.com/Azure-Samples/azd-templates) - مائیکروسافٹ کے آفیشل نمونہ ٹیمپلیٹس  
- [**Awesome AZD گیلری**](https://azure.github.io/awesome-azd/) - کمیونٹی کے تعاون سے بنے ٹیمپلیٹس

### عملی لیبز اور ورکشاپس
- [**AI ورکشاپ لیب**](docs/ai-foundry/ai-workshop-lab.md) - **نیا**: اپنی AI حلوں کو AZD کے قابل ڈیپلائے بنائیں
- [**AZD ابتدائیوں کے لیے ورکشاپ**](workshop/README.md) - AI ایجنٹس AZD ٹیمپلیٹ ڈیپلائے پر توجہ مرکوز کریں

## وسائل

### فوری حوالہ جات
- [**کمانڈ چیٹ شیٹ**](resources/cheat-sheet.md) - ضروری azd کمانڈز
- [**اصطلاحات**](resources/glossary.md) - Azure اور azd کی اصطلاحات
- [**اکثر پوچھے گئے سوالات**](resources/faq.md) - عمومی سوالات
- [**مطالعہ گائیڈ**](resources/study-guide.md) - جامع سیکھنے کے مقاصد اور عملی مشقیں

### بیرونی وسائل
- [Azure Developer CLI دستاویزات](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure آرکیٹیکچر سینٹر](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure قیمت کیلکولیٹر](https://azure.microsoft.com/pricing/calculator/)
- [Azure اسٹیٹس](https://status.azure.com/)

## تعاون

ہم تعاون کا خیر مقدم کرتے ہیں! براہ کرم ہمارے [تعاون گائیڈ](CONTRIBUTING.md) کو پڑھیں تاکہ معلوم ہو:
- مسائل اور فیچر کی درخواستیں کیسے جمع کرائیں
- کوڈ تعاون کے رہنما اصول
- دستاویزات میں بہتری
- کمیونٹی کے معیار

## سپورٹ

- **مسائل**: [بگز رپورٹ کریں اور فیچرز کی درخواست کریں](https://github.com/microsoft/azd-for-beginners/issues)
- **مباحثے**: [Microsoft Azure Discord کمیونٹی Q&A اور مباحثے](https://discord.gg/microsoft-azure)
- **AI سے متعلق سپورٹ**: AZD + AI Foundry مباحثوں کے لیے [#Azure چینل](https://discord.gg/microsoft-azure) میں شامل ہوں
- **ای میل**: نجی سوالات کے لیے
- **Microsoft Learn**: [Azure Developer CLI کی آفیشل دستاویزات](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Azure AI Foundry Discord سے کمیونٹی بصیرت

**#Azure چینل کے پول کے نتائج:**
- **45%** ڈویلپرز AZD کو AI ورک لوڈز کے لیے استعمال کرنا چاہتے ہیں
- **اہم چیلنجز**: ملٹی سروس ڈیپلائمنٹس، کریڈینشل مینجمنٹ، پروڈکشن ریڈی نیس
- **سب سے زیادہ درخواست کردہ**: AI مخصوص ٹیمپلیٹس، مسائل کے حل کے گائیڈز، بہترین طریقے

**ہماری کمیونٹی میں شامل ہوں تاکہ:**
- اپنے AZD + AI تجربات شیئر کریں اور مدد حاصل کریں
- نئے AI ٹیمپلیٹس کے ابتدائی پیش نظارہ تک رسائی حاصل کریں
- AI ڈیپلائمنٹ کے بہترین طریقوں میں تعاون کریں
- مستقبل کے AI + AZD فیچر ڈیولپمنٹ پر اثر ڈالیں

## لائسنس

یہ پروجیکٹ MIT لائسنس کے تحت لائسنس یافتہ ہے - تفصیلات کے لیے [LICENSE](../../LICENSE) فائل دیکھیں۔

## دیگر کورسز

ہماری ٹیم دیگر کورسز بھی تیار کرتی ہے! دیکھیں:

- [**نیا** ماڈل کانٹیکسٹ پروٹوکول (MCP) ابتدائیوں کے لیے](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
- [AI ایجنٹس ابتدائیوں کے لیے](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Generative AI ابتدائیوں کے لیے .NET کا استعمال کرتے ہوئے](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
- [Generative AI ابتدائیوں کے لیے](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Generative AI ابتدائیوں کے لیے جاوا کا استعمال کرتے ہوئے](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
- [ML ابتدائیوں کے لیے](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
- [ڈیٹا سائنس ابتدائیوں کے لیے](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
- [AI ابتدائیوں کے لیے](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
- [سائبرسیکیورٹی ابتدائیوں کے لیے](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)
- [ویب ڈیولپمنٹ ابتدائیوں کے لیے](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
- [IoT ابتدائیوں کے لیے](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
- [XR ڈیولپمنٹ ابتدائیوں کے لیے](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
- [GitHub Copilot کے ساتھ AI پیئرڈ پروگرامنگ میں مہارت حاصل کریں](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [GitHub Copilot کے ساتھ C#/.NET ڈویلپرز کے لیے مہارت حاصل کریں](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [اپنی Copilot ایڈونچر کا انتخاب کریں](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

**نیویگیشن**
- **اگلا سبق**: [AZD بنیادی باتیں](docs/getting-started/azd-basics.md)

---

**ڈسکلیمر**:  
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کا استعمال کرتے ہوئے ترجمہ کی گئی ہے۔ ہم درستگی کے لیے کوشش کرتے ہیں، لیکن براہ کرم آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا غیر درستیاں ہو سکتی ہیں۔ اصل دستاویز کو اس کی اصل زبان میں مستند ذریعہ سمجھا جانا چاہیے۔ اہم معلومات کے لیے، پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ ہم اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کے ذمہ دار نہیں ہیں۔