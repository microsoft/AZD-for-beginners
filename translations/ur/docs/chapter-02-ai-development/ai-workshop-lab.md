# AI ورکشاپ لیب: آپ کے AI حل کو AZD-ڈپلائے کرنے کے قابل بنانا

**باب نیویگیشن:**
- **📚 کورس ہوم**: [AZD For Beginners](../../README.md)
- **📖 موجودہ باب**: باب 2 - AI-فرسٹ ڈیولپمنٹ
- **⬅️ پچھلا**: [AI ماڈل ڈپلائمنٹ](ai-model-deployment.md)
- **➡️ اگلا**: [پروڈکشن AI بہترین طریقے](production-ai-practices.md)
- **🚀 اگلا باب**: [باب 3: کنفیگریشن](../chapter-03-configuration/configuration.md)

## ورکشاپ کا جائزہ

یہ عملی لیب ڈویلپرز کو رہنمائی دیتی ہے کہ موجودہ AI ٹیمپلیٹ کو کیسے Azure Developer CLI (AZD) کے ذریعے ڈپلائے کیا جائے۔ آپ مائیکروسافٹ فاؤنڈری سروسز کا استعمال کرتے ہوئے پروڈکشن AI ڈپلائمنٹس کے ضروری پیٹرنز سیکھیں گے۔

> **تصدیقی نوٹ (2026-03-25):** اس ورکشاپ کا جائزہ `azd` `1.23.12` کے خلاف لیا گیا تھا۔ اگر آپ کی لوکل انسٹالیشن پرانی ہے تو شروع کرنے سے پہلے AZD کو اپڈیٹ کریں تاکہ تصدیق، ٹیمپلیٹ، اور ڈپلائمنٹ ورک فلو نیچے دیے گئے مراحل سے میل کھائے۔

**دورانیہ:** 2-3 گھنٹے  
**سطح:** درمیانی  
**پیشگی شرائط:** بنیادی Azure معلومات، AI/ML تصورات کی واقفیت

## 🎓 سیکھنے کے مقاصد

اس ورکشاپ کے اختتام پر، آپ قابل ہوں گے:
- ✅ موجودہ AI ایپلیکیشن کو AZD ٹیمپلیٹس میں تبدیل کرنا
- ✅ Microsoft Foundry خدمات کو AZD کے ساتھ کنفیگر کرنا
- ✅ AI سروسز کے لیے محفوظ اسناد کا انتظام کرنا
- ✅ پروڈکشن تیار AI ایپلیکیشنز کو مانیٹرنگ کے ساتھ ڈپلائے کرنا
- ✅ عمومی AI ڈپلائمنٹ مسائل کو حل کرنا

## پیشگی شرائط

### ضروری ٹولز
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) انسٹال شدہ
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) انسٹال شدہ
- [Git](https://git-scm.com/) انسٹال شدہ
- کوڈ ایڈیٹر (VS Code تجویز کردہ)

### Azure وسائل
- Azure سبسکرپشن جس میں کنٹریبیوٹر رسائی ہو
- Microsoft Foundry Models خدمات تک رسائی (یا رسائی کی درخواست کی صلاحیت)
- ریسورس گروپ بنانے کی اجازت

### معلومات کی پیشگی شرائط
- Azure خدمات کی بنیادی سمجھ
- کمانڈ لائن انٹرفیس کی واقفیت
- بنیادی AI/ML تصورات (APIs, ماڈلز, پرومپٹس)

## لیب سیٹ اپ

### مرحلہ 1: ماحول کی تیاری

1. **ٹول انسٹالیشنز کی تصدیق کریں:**
```bash
# AZD کی تنصیب چیک کریں
azd version

# Azure CLI چیک کریں
az --version

# AZD ورک فلو کے لیے Azure میں لاگ ان کریں
azd auth login

# صرف اس صورت میں Azure CLI میں لاگ ان کریں اگر آپ تشخیص کے دوران az کمانڈز چلانے کا ارادہ رکھتے ہیں
az login
```

اگر آپ متعدد ٹینینٹس میں کام کر رہے ہیں یا آپ کی سبسکرپشن خودکار طور پر نہیں ملی تو `azd auth login --tenant-id <tenant-id>` کے ساتھ دوبارہ کوشش کریں۔

2. **ورکشاپ ریپوزٹری کلون کریں:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## ماڈیول 1: AI ایپلیکیشنز کے لیے AZD ڈھانچے کو سمجھنا

### AI AZD ٹیمپلیٹ کا ڈھانچہ

AI تیار AZD ٹیمپلیٹ میں کلیدی فائلز کو دریافت کریں:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Azure AI Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **لیب مشق 1.1: کنفیگریشن کا جائزہ لیں**

1. **azure.yaml فائل کا معائنہ کریں:**
```bash
cat azure.yaml
```

**دیکھنے کی چیزیں:**
- AI اجزاء کے لیے سروس کی تعریفیں
- ماحول کے متغیرات کے نقشے
- ہوسٹ کنفیگریشنز

2. **main.bicep بنیادی ڈھانچے کا جائزہ لیں:**
```bash
cat infra/main.bicep
```

**شناخت کرنے کے لیے کلیدی AI پیٹرنز:**
- Microsoft Foundry Models سروس کی فراہمی
- Azure AI سرچ انٹیگریشن
- محفوظ کی مینجمنٹ
- نیٹ ورک سیکیورٹی کنفیگریشن

### **تجزیہ کا نقطہ نظر:** AI کے لیے یہ پیٹرنز کیوں اہم ہیں

- **سروس انحصار:** AI ایپس کو عموماً متعدد مربوط خدمات کی ضرورت ہوتی ہے  
- **سیکیورٹی:** API کیز اور اینڈپوائنٹس کا محفوظ انتظام  
- **اسکیل ایبلیٹی:** AI ورک لوڈز کے منفرد اسکیلنگ تقاضے  
- **لاگت کا انتظام:** AI سروسز کی قیمتیں مناسب کنفیگریشن کے بغیر زیادہ ہو سکتی ہیں  

## ماڈیول 2: اپنی پہلی AI ایپلیکیشن کو ڈپلائے کریں

### مرحلہ 2.1: ماحول کی شروعات کریں

1. **نیا AZD ماحول بنائیں:**
```bash
azd env new myai-workshop
```

2. **ضروری پیرامیٹرز سیٹ کریں:**
```bash
# اپنا مطلوبہ Azure خطہ منتخب کریں
azd env set AZURE_LOCATION eastus

# اختیاری: مخصوص OpenAI ماڈل منتخب کریں
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### مرحلہ 2.2: انفراسٹرکچر اور ایپلیکیشن کو ڈپلائے کریں

1. **AZD کے ساتھ ڈپلائے کریں:**
```bash
azd up
```

`azd up` کے دوران کیا ہوتا ہے:
- ✅ Microsoft Foundry Models سروس کی فراہمی  
- ✅ Azure AI سرچ سروس کی تخلیق  
- ✅ ویب ایپلیکیشن کے لیے App Service ترتیب  
- ✅ نیٹ ورکنگ اور سیکیورٹی کی ترتیب  
- ✅ ایپلیکیشن کوڈ کی ڈپلائمنٹ  
- ✅ مانیٹرنگ اور لاگنگ کی ترتیب

2. **ڈپلائمنٹ کی پیش رفت مانیٹر کریں** اور بنائے جانے والے وسائل کا نوٹ لیں۔

### مرحلہ 2.3: اپنی ڈپلائمنٹ کی تصدیق کریں

1. **ڈپلائے کیے گئے وسائل چیک کریں:**
```bash
azd show
```

2. **ڈپلائے شدہ ایپلیکیشن کھولیں:**
```bash
azd show
```

`azd show` آؤٹ پٹ میں دکھائے گئے ویب اینڈپوائنٹ کو کھولیں۔

3. **AI فنکشنالٹی کا ٹیسٹ کریں:**
   - ویب ایپلیکیشن پر جائیں  
   - نمونہ سوالات آزمائیں  
   - تصدیق کریں کہ AI جوابات درست کام کر رہے ہیں

### **لیب مشق 2.1: مسئلہ حل کرنے کی مشق**

**صورت حال:** آپ کی ڈپلائمنٹ کامیاب ہوگئی ہے لیکن AI جواب نہیں دے رہا۔

**عام مسائل کی جانچ کریں:**
1. **OpenAI API کیز:** تصدیق کریں کہ وہ صحیح سے سیٹ ہیں  
2. **ماڈل دستیابی:** دیکھیں کہ کیا آپ کے علاقہ میں ماڈل دستیاب ہے  
3. **نیٹ ورک کنیکٹیویٹی:** خدمات کے درمیان رابطے کو یقینی بنائیں  
4. **RBAC اجازت نامے:** تصدیق کریں کہ ایپ OpenAI تک رسائی حاصل کر سکتی ہے

**ڈی بگنگ کمانڈز:**
```bash
# ماحولیاتی متغیرات کی جانچ کریں
azd env get-values

# تعیناتی کے لاگز دیکھیں
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI کی تعیناتی کی حالت چیک کریں
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## ماڈیول 3: اپنی ضروریات کے مطابق AI ایپلیکیشنز کو حسبِ منشاء بنانا

### مرحلہ 3.1: AI کنفیگریشن میں ترمیم کریں

1. **OpenAI ماڈل کو اپڈیٹ کریں:**
```bash
# اپنے علاقے میں دستیاب ہو تو کسی دوسرے ماڈل میں تبدیل کریں
azd env set AZURE_OPENAI_MODEL gpt-4.1

# نئی ترتیب کے ساتھ دوبارہ تعینات کریں
azd deploy
```

2. **اضافی AI سروسز شامل کریں:**

`infra/main.bicep` کو ترمیم کریں تاکہ Document Intelligence شامل ہو:

```bicep
// Add to main.bicep
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: 'doc-intel-${uniqueString(resourceGroup().id)}'
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'F0'  // Free tier for workshop
  }
  properties: {
    customSubDomainName: 'doc-intel-${uniqueString(resourceGroup().id)}'
  }
}
```

### مرحلہ 3.2: مخصوص ماحول کی کنفیگریشن

**بہترین عمل:** ترقی اور پروڈکشن کے لیے مختلف کنفیگریشنز۔

1. **پروڈکشن ماحول بنائیں:**
```bash
azd env new myai-production
```

2. **پروڈکشن مخصوص پیرامیٹرز سیٹ کریں:**
```bash
# پیداوار عام طور پر زیادہ SKUs استعمال کرتی ہے
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# اضافی سیکیورٹی خصوصیات کو فعال کریں
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **لیب مشق 3.1: لاگت کی بہتر کاری**

**چیلنج:** ٹیمپلیٹ کو لاگت میں مؤثر ترقی کے لیے ترتیب دیں۔

**ٹاسکس:**
1. شناخت کریں کونسی SKUs کو مفت/بنیادی درجے پر سیٹ کیا جا سکتا ہے  
2. ماحول کے متغیرات کو کم از کم قیمت کے لیے کنفیگر کریں  
3. ڈپلائے کریں اور پروڈکشن کنفیگریشن سے لاگت کا موازنہ کریں

**حل کے اشارے:**
- ممکنہ طور پر Azure AI خدمات کے لیے F0 (مفت) درجے کا استعمال کریں  
- ترقی میں سرچ سروس کے لیے بنیادی درجے کا استعمال کریں  
- فنکشنز کے لیے Consumption پلان پر غور کریں

## ماڈیول 4: سیکیورٹی اور پروڈکشن بہترین طریقے

### مرحلہ 4.1: محفوظ اسناد کا انتظام

**موجودہ چیلنج:** کئی AI ایپس API کیز کو ہارڈ کوڈ کرتی ہیں یا غیر محفوظ اسٹوریج استعمال کرتی ہیں۔

**AZD حل:** Managed Identity + Key Vault انٹیگریشن۔

1. **اپنے ٹیمپلیٹ میں سیکیورٹی کنفیگریشن کا جائزہ لیں:**
```bash
# تلاش کریں کلید والٹ اور منیجڈ شناخت کی ترتیب
grep -r "keyVault\|managedIdentity" infra/
```

2. **Managed Identity کی کارکردگی کی تصدیق کریں:**
```bash
# چیک کریں کہ ویب ایپ میں صحیح شناخت کی تشکیل ہے یا نہیں
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### مرحلہ 4.2: نیٹ ورک سیکیورٹی

1. **پرائیوٹ اینڈپوائنٹس فعال کریں** (اگر پہلے سے فعال نہیں):

اپنے بائسپ ٹیمپلیٹ میں شامل کریں:
```bicep
// Private endpoint for OpenAI
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: 'pe-openai-${uniqueString(resourceGroup().id)}'
  location: location
  properties: {
    subnet: {
      id: vnet.properties.subnets[0].id
    }
    privateLinkServiceConnections: [
      {
        name: 'openai-connection'
        properties: {
          privateLinkServiceId: openAIAccount.id
          groupIds: ['account']
        }
      }
    ]
  }
}
```

### مرحلہ 4.3: مانیٹرنگ اور مشاہدہ

1. **Application Insights ترتیب دیں:**
```bash
# ایپلیکیشن انسائٹس کو خودکار طریقے سے ترتیب دیا جانا چاہیے
# ترتیب کی جانچ کریں:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI مخصوص مانیٹرنگ ترتیب دیں:**

AI آپریشنز کے لیے کسٹم میٹرکس شامل کریں:
```bicep
// In your web app configuration
resource webApp 'Microsoft.Web/sites@2023-01-01' = {
  properties: {
    siteConfig: {
      appSettings: [
        {
          name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
          value: applicationInsights.properties.ConnectionString
        }
        {
          name: 'OPENAI_MONITOR_ENABLED'
          value: 'true'
        }
      ]
    }
  }
}
```

### **لیب مشق 4.1: سیکیورٹی آڈٹ**

**ٹاسک:** اپنی ڈپلائمنٹ کو سیکیورٹی بہترین طریقوں کے لیے جانچیں۔

**چیک لسٹ:**
- [ ] کوڈ یا کنفیگریشن میں ہارڈکوڈڈ راز نہ ہوں  
- [ ] سروس سے سروس تصدیق کے لیے Managed Identity کا استعمال  
- [ ] Key Vault میں حساس کنفیگریشن محفوظ ہو  
- [ ] نیٹ ورک تک رسائی مناسب حد تک محدود ہو  
- [ ] مانیٹرنگ اور لاگنگ فعال ہو

## ماڈیول 5: اپنی AI ایپلیکیشن کو تبدیل کرنا

### مرحلہ 5.1: جائزہ ورک شیٹ

**اپنی ایپ تبدیل کرنے سے پہلے، یہ سوالات جواب دیں:**

1. **ایپلیکیشن آرکیٹیکچر:**
   - آپ کی ایپ کون سی AI خدمات استعمال کرتی ہے؟  
   - اسے کون سے کمپیوٹنگ وسائل درکار ہیں؟  
   - کیا اسے ڈیٹا بیس کی ضرورت ہے؟  
   - خدمات کے درمیان انحصار کیا ہے؟

2. **سیکیورٹی کی ضروریات:**
   - آپ کی ایپ کون سا حساس ڈیٹا ہینڈل کرتی ہے؟  
   - آپ کو کونسی تعمیل کی ضرورت ہے؟  
   - کیا آپ کو پرائیویٹ نیٹ ورکنگ کی ضرورت ہے؟

3. **اسکیلنگ کی ضروریات:**
   - آپ کا متوقع لوڈ کیا ہے؟  
   - کیا آپ کو آٹو اسکیلنگ چاہیے؟  
   - کیا علاقائی ضروریات ہیں؟

### مرحلہ 5.2: اپنا AZD ٹیمپلیٹ بنائیں

**اپنی ایپ کو تبدیل کرنے کے لیے یہ پیٹرن فالو کریں:**

1. **بنیادی ڈھانچہ تیار کریں:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# AZD ٹیمپلیٹ کو شروع کریں
azd init --template minimal
```

2. **azure.yaml بنائیں:**
```yaml
# Metadata
name: my-ai-app
metadata:
  template: my-ai-app-template@0.0.1-beta

# Services definition
services:
  api:
    project: ./api
    host: containerapp
  web:
    project: ./web
    host: staticwebapp
    
# Hooks for custom deployment logic  
hooks:
  predeploy:
    shell: sh
    run: echo "Preparing AI models..."
```

3. **انفراسٹرکچر ٹیمپلیٹس تیار کریں:**

**infra/main.bicep** - مین ٹیمپلیٹ:
```bicep
@description('Primary location for all resources')
param location string = resourceGroup().location

@description('Name of the OpenAI service')
param openAIServiceName string = 'openai-${uniqueString(resourceGroup().id)}'

// Your AI services here
module openAI 'modules/openai.bicep' = {
  name: 'openai'
  params: {
    name: openAIServiceName
    location: location
  }
}
```

**infra/modules/openai.bicep** - OpenAI ماڈیول:
```bicep
@description('Name of the OpenAI service')
param name string

@description('Location for the OpenAI service')
param location string

resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: name
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: name
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **لیب مشق 5.1: ٹیمپلیٹ بنانے کا چیلنج**

**چیلنج:** دستاویزات پروسیسنگ AI ایپ کے لیے AZD ٹیمپلیٹ بنائیں۔

**ضروریات:**
- مواد کے تجزیے کے لیے Microsoft Foundry Models  
- OCR کے لیے Document Intelligence  
- دستاویزات اپلوڈ کے لیے Storage Account  
- پروسیسنگ منطق کے لیے Function App  
- صارف انٹرفیس کے لیے ویب ایپ

**اضافی پوائنٹس:**
- مناسب ایرر ہینڈلنگ کا اضافہ  
- لاگت کا تخمینہ شامل کریں  
- مانیٹرنگ ڈیش بورڈز سیٹ کریں

## ماڈیول 6: عمومی مسائل کا حل

### عام ڈپلائمنٹ مسائل

#### مسئلہ 1: OpenAI سروس کوٹا تجاوز
**علامات:** کوٹا ایرر کے ساتھ ڈپلائمنٹ ناکام  
**حل:**
```bash
# موجودہ کوٹہ چیک کریں
az cognitiveservices usage list --location eastus

# کوٹہ میں اضافہ کی درخواست کریں یا مختلف خطہ آزمانے کی کوشش کریں
azd env set AZURE_LOCATION westus2
azd up
```

#### مسئلہ 2: علاقہ میں ماڈل دستیاب نہیں
**علامات:** AI جوابات ناکام یا ماڈل ڈپلائمنٹ کی غلطیاں  
**حل:**
```bash
# علاقے کے لحاظ سے ماڈل کی دستیابی چیک کریں
az cognitiveservices model list --location eastus

# دستیاب ماڈل کو اپ ڈیٹ کریں
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### مسئلہ 3: اجازت کے مسائل
**علامات:** AI خدمات کو کال کرتے وقت 403 Forbidden ایررز  
**حل:**
```bash
# رول تفویضات کی جانچ کریں
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# موجودہ کردار شامل کریں
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### کارکردگی کے مسائل

#### مسئلہ 4: AI جوابات سست ہیں
**تحقیقی مراحل:**
1. Application Insights میں کارکردگی کے اعداد و شمار دیکھیں  
2. Azure پورٹل میں OpenAI سروس میٹرکس کا جائزہ لیں  
3. نیٹ ورک کنیکٹیویٹی اور تاخیر کی تصدیق کریں

**حل:**
- عام سوالات کے لیے کیشنگ نافذ کریں  
- اپنے کیس کے لیے مناسب OpenAI ماڈل کا انتخاب کریں  
- ہائی لوڈ حالات کے لیے ریڈ ریپلیکاز پر غور کریں

### **لیب مشق 6.1: ڈی بگنگ چیلنج**

**صورت حال:** آپ کی ڈپلائمنٹ کامیاب ہے، لیکن ایپلیکیشن 500 ایرر دے رہی ہے۔

**ڈی بگنگ کے کام:**
1. ایپلیکیشن لاگز چیک کریں  
2. سروس کنیکٹیویٹی کی تصدیق کریں  
3. تصدیق کی جانچ کریں  
4. کنفیگریشن کا جائزہ لیں

**استعمال کے ٹولز:**
- `azd show` سے ڈپلائمنٹ کا جائزہ  
- Azure پورٹل سے تفصیلی سروس لاگز  
- Application Insights سے ایپلیکیشن کی ٹیلی میٹری

## ماڈیول 7: مانیٹرنگ اور بہتر کاری

### مرحلہ 7.1: جامع مانیٹرنگ سیٹ اپ کریں

1. **کسٹم ڈیش بورڈ بنائیں:**

Azure پورٹل پر جائیں اور درج ذیل کے ساتھ ڈیش بورڈ بنائیں:  
- OpenAI درخواستوں کی تعداد اور تاخیر  
- ایپلیکیشن ایرر کی شرح  
- وسائل کا استعمال  
- لاگت کی ٹریکنگ

2. **الرٹس سیٹ کریں:**
```bash
# اعلیٰ خرابی کی شرح کے لیے انتباہ
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### مرحلہ 7.2: لاگت کی بہتر کاری

1. **موجودہ لاگت کا تجزیہ کریں:**
```bash
# Azure CLI استعمال کریں تاکہ لاگت کا ڈیٹا حاصل کیا جا سکے
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **لاگت کنٹرول نافذ کریں:**
- بجٹ الرٹس بنائیں  
- آٹو اسکیلنگ پالیسیاں استعمال کریں  
- درخواست کی کیشنگ نافذ کریں  
- OpenAI کے لیے ٹوکن استعمال مانیٹر کریں

### **لیب مشق 7.1: کارکردگی کی بہتر کاری**

**ٹاسک:** اپنی AI ایپلیکیشن کو کارکردگی اور لاگت دونوں کے لیے بہتر کریں۔

**بہتر بنانے والے میٹرکس:**
- اوسط ردعمل کا وقت 20٪ کم کریں  
- ماہانہ لاگت 15٪ کم کریں  
- 99.9٪ اپ ٹائم برقرار رکھیں

**آزمائشی حکمت عملی:**
- ردعمل کی کیشنگ نافذ کریں  
- ٹوکن کی مؤثریت کے لیے پرومپٹس بہتر کریں  
- مناسب کمپیوٹ SKUs استعمال کریں  
- مناسب آٹو اسکیلنگ ترتیب دیں

## آخری چیلنج: اختتام سے اختتام تک نفاذ

### چیلنج منظر نامہ

آپ کو ایک پروڈکشن-تیار AI پر مبنی کسٹمر سروس چیٹ بوٹ بنانے کا کام دیا گیا ہے جن کی یہ ضروریات ہیں:

**فعال ضروریات:**
- کسٹمر تعامل کے لیے ویب انٹرفیس  
- Microsoft Foundry Models کے ساتھ جوابات کا انضمام  
- Azure AI سرچ کے ذریعے دستاویزات کی تلاش  
- موجودہ کسٹمر ڈیٹا بیس کے ساتھ انٹیگریشن  
- متعدد زبانوں کی حمایت

**غیر فعال ضروریات:**
- 1000 متوازی صارفین کو ہینڈل کرنا  
- 99.9٪ اپ ٹائم SLA  
- SOC 2 تعمیل  
- ماہانہ $500 سے کم لاگت  
- متعدد ماحولوں (ترقی، اسٹیجنگ، پروڈ) میں تعیناتی

### نفاذ کے اقدامات

1. آرکیٹیکچر ڈیزائن کریں  
2. AZD ٹیمپلیٹ بنائیں  
3. سیکیورٹی اقدامات نافذ کریں  
4. مانیٹرنگ اور الرٹنگ ترتیب دیں  
5. ڈپلائمنٹ پائپ لائنز بنائیں  
6. حل کی دستاویزات تیار کریں

### جائزہ کے معیار

- ✅ **فنکشنالٹی:** کیا یہ تمام ضروریات پوری کرتا ہے؟  
- ✅ **سیکیورٹی:** کیا بہترین طریقے نافذ کیے گئے ہیں؟  
- ✅ **اسکیل ایبلیٹی:** کیا یہ لوڈ ہینڈل کر سکتا ہے؟  
- ✅ **مینٹین ایبلٹی:** کیا کوڈ اور انفراسٹرکچر منظم ہے؟  
- ✅ **لاگت:** کیا بجٹ میں رہتا ہے؟

## اضافی وسائل

### مائیکروسافٹ دستاویزات
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### نمونہ ٹیمپلیٹس
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### کمیونٹی وسائل
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 تکمیل کا سرٹیفیکیٹ

مبارک ہو! آپ نے AI ورکشاپ لیب مکمل کر لی ہے۔ اب آپ کو یہ کام کرنے کے قابل ہونا چاہیے:

- ✅ موجودہ AI ایپلیکیشنز کو AZD ٹیمپلیٹس میں تبدیل کرنا
- ✅ پروڈکشن کے قابل AI ایپلیکیشنز کو تعینات کرنا
- ✅ AI ورک لوڈز کے لیے سیکیورٹی کی بہترین مشقیں نافذ کرنا
- ✅ AI ایپلیکیشن کی کارکردگی کی نگرانی اور اس کی بہتری کرنا
- ✅ عام تعیناتی کے مسائل کو حل کرنا

### اگلے اقدامات
1. ان نمونوں کو اپنے AI پروجیکٹس پر لاگو کریں
2. ٹیمپلیٹس کمیونٹی کے ساتھ واپس شیئر کریں
3. Microsoft Foundry Discord میں شامل ہوں مزید تعاون کے لیے
4. ملٹی-ریجن تعیناتی جیسے اعلیٰ موضوعات کو دریافت کریں

---

**ورکشاپ کا فیڈ بیک**: براہ کرم اس ورکشاپ کو بہتر بنانے میں مدد کے لیے اپنا تجربہ [Microsoft Foundry Discord #Azure چینل](https://discord.gg/microsoft-azure) میں شیئر کریں۔

---

**باب کی نیویگیشن:**
- **📚 کورس ہوم**: [AZD For Beginners](../../README.md)
- **📖 موجودہ باب**: باب 2 - AI-فرسٹ ڈیولپمنٹ
- **⬅️ پچھلا**: [AI ماڈل کی تعیناتی](ai-model-deployment.md)
- **➡️ اگلا**: [پروڈکشن AI بہترین مشقیں](production-ai-practices.md)
- **🚀 اگلا باب**: [باب 3: کنفیگریشن](../chapter-03-configuration/configuration.md)

**مدد چاہیے؟** AZD اور AI تعیناتیوں کے بارے میں مدد اور مباحثے کے لیے ہماری کمیونٹی میں شامل ہوں۔

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ڈس کلیمر**:
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے ترجمہ کی گئی ہے۔ جبکہ ہم درستگی کے لیے کوشاں ہیں، براہ کرم اس بات سے آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا عدم درستیاں ہو سکتی ہیں۔ اصل دستاویز اپنے مادری زبان میں مستند ماخذ سمجھی جائے گی۔ حساس معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کی ذمہ داری ہم قبول نہیں کرتے۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->