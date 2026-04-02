# AI ورکشاپ لیب: اپنی AI حلوں کو AZD-Deployable بنانا

**باب کی نیویگیشن:**
- **📚 کورس ہوم**: [AZD For Beginners](../../README.md)
- **📖 موجودہ باب**: باب 2 - AI-First Development
- **⬅️ پچھلا**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ اگلا**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 اگلا باب**: [باب 3: Configuration](../chapter-03-configuration/configuration.md)

## ورکشاپ کا جائزہ

یہ ہینڈز آن لیب ڈویلپرز کو ایک موجودہ AI ٹیمپلیٹ لینے اور Azure Developer CLI (AZD) استعمال کرتے ہوئے اس کی تعیناتی کے عمل سے گزرنے میں رہنمائی کرتی ہے۔ آپ Microsoft Foundry خدمات کے ذریعے پیداوار AI کی تعیناتی کے ضروری پیٹرنز سیکھیں گے۔

> **تصدیقی نوٹ (2026-03-25):** اس ورکشاپ کا جائزہ `azd` `1.23.12` کے خلاف لیا گیا ہے۔ اگر آپ کی لوکل انسٹالیشن پرانی ہے، تو شروع کرنے سے پہلے AZD کو اپ ڈیٹ کریں تاکہ auth، template، اور deployment ورک فلو نیچے دیے گئے مراحل سے میل کھائے۔

**دورانیہ:** 2-3 گھنٹے  
**سطح:** درمیانہ  
**ضروریات:** بنیادی Azure معلومات، AI/ML تصورات سے واقفیت

## 🎓 سیکھنے کے مقاصد

اس ورکشاپ کے اختتام پر، آپ قادر ہوں گے:
- ✅ ایک موجودہ AI ایپلیکیشن کو AZD ٹیمپلیٹس میں تبدیل کرنا
- ✅ Microsoft Foundry خدمات کو AZD کے ساتھ ترتیب دینا
- ✅ AI خدمات کیلئے محفوظ اسناد کا انتظام نافذ کرنا
- ✅ نگرانی کے ساتھ تیار شدہ AI ایپلیکیشنز کو تعینات کرنا
- ✅ عام AI تعیناتی مسائل کا مسئلہ تلاش کرنا

## ضروریات

### مطلوبہ اوزار
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) نصب شدہ
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) نصب شدہ
- [Git](https://git-scm.com/) نصب شدہ
- کوڈ ایڈیٹر (VS Code کی سفارش کی جاتی ہے)

### Azure وسائل
- Azure سبسکرپشن جس میں کنٹریبیوٹر رسائی ہو
- Microsoft Foundry Models خدمات تک رسائی (یا رسائی کی درخواست کرنے کی صلاحیت)
- Resource group بنانے کے اجازت

### علمی ضروریات
- Azure خدمات کی بنیادی سمجھ
- کمانڈ لائن انٹرفیس سے واقفیت
- AI/ML تصورات کی بنیادی معلومات (APIs، ماڈلز، پرامپٹس)

## لیب کی ترتیب

### مرحلہ 1: ماحول کی تیاری

1. **اوزار کی انسٹالیشن کی تصدیق کریں:**
```bash
# AZD کی تنصیب چیک کریں
azd version

# Azure CLI چیک کریں
az --version

# AZD ورک فلو کے لیے Azure میں لاگ ان کریں
azd auth login

# صرف اس صورت میں Azure CLI میں لاگ ان کریں اگر آپ تشخیصی عمل کے دوران az کمانڈز چلانے کا ارادہ رکھتے ہیں
az login
```

اگر آپ مختلف ٹیننٹس میں کام کرتے ہیں یا آپ کی سبسکرپشن خود بخود نہیں ملتی، تو دوبارہ کوشش کریں `azd auth login --tenant-id <tenant-id>` کے ساتھ۔

2. **ورکشاپ رپوزیٹری کو کلون کریں:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## ماڈیول 1: AI ایپلیکیشنز کے لیے AZD ساخت کو سمجھنا

### AI AZD ٹیمپلیٹ کی ساخت

AI کے لیے تیار AZD ٹیمپلیٹ میں اہم فائلوں کو دریافت کریں:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **لیب ایکسرسائز 1.1: ترتیب کا جائزہ لیں**

1. **azure.yaml فائل کا معائنہ کریں:**
```bash
cat azure.yaml
```

**جو دیکھنا چاہیے:**
- AI اجزاء کیلئے سروس کی تعریفیں
- ماحول کی متغیرات کے نقشے
- ہوسٹ کی ترتیب

2. **main.bicep انفراسٹرکچر کا جائزہ لیں:**
```bash
cat infra/main.bicep
```

**شناخت کرنے کے اہم AI پیٹرنز:**
- Microsoft Foundry Models سروس کی فراہمی
- Cognitive Search کا انضمام
- محفوظ کی مینجمنٹ
- نیٹ ورک سیکیورٹی کی ترتیبات

### **بحث کا نکتہ:** یہ پیٹرنز AI کے لیے کیوں اہم ہیں

- **سروس انحصار:** AI ایپس عموماً متعدد مربوط سروسز کی ضرورت رکھتی ہیں
- **سیکیورٹی:** API کیز اور اینڈ پوائنٹس کی محفوظ مینجمنٹ ضروری ہے
- **توسیع پذیری:** AI کے کاموں کے لیے الگ اسکیلنگ کی ضرورت ہوتی ہے
- **لاگت کی مینجمنٹ:** AI خدمات لاگت میں مہنگی ہوسکتی ہیں اگر مناسب طریقے سے ترتیب نہ دی جائیں

## ماڈیول 2: اپنی پہلی AI ایپلیکیشن تعینات کریں

### مرحلہ 2.1: ماحول کی ابتدا

1. **نیا AZD ماحول بنائیں:**
```bash
azd env new myai-workshop
```

2. **ضروری پیرا میٹرز سیٹ کریں:**
```bash
# اپنا پسندیدہ Azure خطہ سیٹ کریں
azd env set AZURE_LOCATION eastus

# اختیاری: مخصوص OpenAI ماڈل سیٹ کریں
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### مرحلہ 2.2: انفراسٹرکچر اور ایپلیکیشن تعینات کریں

1. **AZD کے ذریعے تعینات کریں:**
```bash
azd up
```

`azd up` کے دوران کیا ہوتا ہے:
- ✅ Microsoft Foundry Models سروس فراہم کی جاتی ہے
- ✅ Cognitive Search سروس بنائی جاتی ہے
- ✅ ویب ایپلیکیشن کے لیے App Service ترتیب دی جاتی ہے
- ✅ نیٹ ورکنگ اور سیکیورٹی کی ترتیب دی جاتی ہے
- ✅ ایپلیکیشن کوڈ تعینات کیا جاتا ہے
- ✅ نگرانی اور لاگنگ کا سیٹ اپ کیا جاتا ہے

2. **تعیناتی کی پیش رفت کی نگرانی کریں** اور بنائے جانے والے وسائل کو نوٹ کریں۔

### مرحلہ 2.3: اپنی تعیناتی کی تصدیق کریں

1. **تعینات کردہ وسائل چیک کریں:**
```bash
azd show
```

2. **تعینات شدہ ایپلیکیشن کھولیں:**
```bash
azd show
```

`azd show` کے آؤٹ پٹ میں دکھائے گئے ویب اینڈ پوائنٹ کو کھولیں۔

3. **AI فعالیت کا تجربہ کریں:**
   - ویب ایپلیکیشن پر جائیں
   - نمونہ سوالات آزمائیں
   - AI کے جوابات کی کارکردگی کی تصدیق کریں

### **لیب ایکسرسائز 2.1: مسئلہ حل کرنے کی مشق**

**صورت حال:** آپ کی تعیناتی کامیاب ہوئی لیکن AI جواب نہیں دے رہا۔

**عام مسائل چیک کرنے کے لیے:**
1. **OpenAI API کیز:** تصدیق کریں کہ وہ صحیح طریقے سے سیٹ ہیں
2. **ماڈل کی دستیابی:** چیک کریں کہ آیا آپ کے خطے میں ماڈل دستیاب ہے
3. **نیٹ ورک کنیکٹیویٹی:** یقینی بنائیں خدمات آپس میں رابطہ کر سکتی ہیں
4. **RBAC اجازتیں:** تصدیق کریں کہ ایپ OpenAI تک رسائی حاصل کر سکتی ہے

**ڈی بگ کرنے کے کمانڈز:**
```bash
# ماحول کے متغیرات چیک کریں
azd env get-values

# تعیناتی کے لاگز دیکھیں
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI تعیناتی کی حیثیت چیک کریں
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## ماڈیول 3: اپنی ضروریات کے لیے AI ایپلیکیشنز کو حسب ضرورت بنانا

### مرحلہ 3.1: AI ترتیب میں ترمیم کریں

1. **OpenAI ماڈل اپ ڈیٹ کریں:**
```bash
# اپنے خطے میں دستیاب ہو تو کسی مختلف ماڈل میں تبدیلی کریں
azd env set AZURE_OPENAI_MODEL gpt-4.1

# نئی ترتیب کے ساتھ دوبارہ تعینات کریں
azd deploy
```

2. **اضافی AI خدمات شامل کریں:**

Document Intelligence شامل کرنے کے لیے `infra/main.bicep` ترمیم کریں:

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

### مرحلہ 3.2: ماحول کے مخصوص ترتیب

**بہترین طریقہ:** ترقی اور پیداوار کے لیے مختلف ترتیبات۔

1. **پیداوار کا ماحول بنائیں:**
```bash
azd env new myai-production
```

2. **پیداوار کے مخصوص پیرا میٹرز سیٹ کریں:**
```bash
# پیداوار عام طور پر زیادہ ایس کے یوز استعمال کرتی ہے
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# اضافی حفاظتی خصوصیات کو فعال کریں
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **لیب ایکسرسائز 3.1: لاگت کی اصلاح**

**چیلنج:** ٹیمپلیٹ کو لاگت مؤثر ترقی کے لیے ترتیب دیں۔

**کام:**
1. معلوم کریں کون سے SKUs کو مفت/بنیادی درجے پر سیٹ کیا جا سکتا ہے
2. کم سے کم لاگت کے لیے ماحول کی متغیرات ترتیب دیں
3. تعینات کریں اور لاگت کا موازنہ پیداوار کی ترتیب سے کریں

**حل کے اشارے:**
- ممکن ہو تو Cognitive Services کے لیے F0 (مفت) ٹیر کا استعمال کریں
- ترقی میں Search Service کے لیے Basic ٹیر استعمال کریں
- Functions کے لیے Consumption پلان پر غور کریں

## ماڈیول 4: سیکیورٹی اور پیداوار کی بہترین عملی اقدار

### مرحلہ 4.1: محفوظ اسناد کا انتظام

**موجودہ چیلنج:** بہت سی AI ایپس API کیز کو ہارڈ کوڈ کرتی ہیں یا نا محفوظ ذخیرہ استعمال کرتی ہیں۔

**AZD حل:** Managed Identity + Key Vault انضمام۔

1. **اپنے ٹیمپلیٹ میں سیکیورٹی کی ترتیب دیکھیں:**
```bash
# کی وولٹ اور منیجڈ آئیڈینٹی کی ترتیب تلاش کریں
grep -r "keyVault\|managedIdentity" infra/
```

2. **Managed Identity کی کارکردگی کی تصدیق کریں:**
```bash
# چیک کریں کہ ویب ایپ کے پاس صحیح شناخت کی ترتیب موجود ہے
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### مرحلہ 4.2: نیٹ ورک سیکیورٹی

1. **پرائیویٹ اینڈ پوائنٹس فعال کریں** (اگر پہلے سیٹ نہیں ہیں):

اپنے بائسک ٹیمپلیٹ میں شامل کریں:
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

### مرحلہ 4.3: نگرانی اور مشاہدہ

1. **Application Insights کی ترتیب:**
```bash
# ایپلیکیشن انسائٹس کو خود بخود ترتیب دیا جانا چاہیے
# ترتیب چیک کریں:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI مخصوص نگرانی کا سیٹ اپ:**

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

### **لیب ایکسرسائز 4.1: سیکیورٹی آڈٹ**

**کام:** اپنی تعیناتی کا سیکیورٹی کی بہترین عملی اقدار پر جائزہ لیں۔

**چیک لسٹ:**
- [ ] کوڈ یا ترتیب میں کوئی ہارڈ کوڈڈ راز نہیں ہیں
- [ ] Managed Identity سروس سے سروس کی تصدیق کے لیے استعمال ہو رہی ہے
- [ ] Key Vault حساس ترتیبات کو ذخیرہ کرتا ہے
- [ ] نیٹ ورک تک رسائی مناسب طریقے سے محدود ہے
- [ ] نگرانی اور لاگنگ فعال ہیں

## ماڈیول 5: اپنی AI ایپلیکیشن کو تبدیل کرنا

### مرحلہ 5.1: جائزہ ورکشیٹ

**اپنی ایپ کو تبدیل کرنے سے پہلے، ان سوالات کے جواب دیں:**

1. **ایپلیکیشن کی معمار:**
   - آپ کی ایپ کونسی AI خدمات استعمال کرتی ہے؟
   - اسے کون سے کمپیوٹنگ وسائل کی ضرورت ہے؟
   - کیا اسے ڈیٹا بیس کی ضرورت ہے؟
   - خدمات کے درمیان انحصار کیا ہے؟

2. **سیکیورٹی کی ضروریات:**
   - آپ کی ایپ کون سے حساس ڈیٹا کو ہینڈل کرتی ہے؟
   - آپ کی پاس کیا کمپلائنس کی ضروریات ہیں؟
   - کیا آپ کو پرائیویٹ نیٹ ورکنگ کی ضرورت ہے؟

3. **اسکیلنگ کی ضروریات:**
   - آپ کی متوقع لوڈ کیا ہے؟
   - کیا آپ کو خودکار اسکیلنگ چاہیے؟
   - کیا خطے کی ضروریات موجود ہیں؟

### مرحلہ 5.2: اپنا AZD ٹیمپلیٹ بنائیں

**اپنی ایپ کو تبدیل کرنے کے لیے درج ذیل پیٹرن پر عمل کریں:**

1. **بنیادی ساخت بنائیں:**
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

3. **انفراسٹرکچر ٹیمپلیٹس بنائیں:**

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

### **لیب ایکسرسائز 5.1: ٹیمپلیٹ بنانے کا چیلنج**

**چیلنج:** دستاویز پراسیسنگ AI ایپ کے لیے AZD ٹیمپلیٹ بنائیں۔

**ضروریات:**
- Microsoft Foundry Models برائے مواد کا تجزیہ
- Document Intelligence برائے OCR
- دستاویز اپ لوڈز کے لیے Storage Account
- پروسیسنگ کے لیے Function App
- یوزر انٹرفیس کے لیے ویب ایپ

**بونس پوائنٹس:**
- مناسب ایرر ہینڈلنگ شامل کریں
- لاگت کا تخمینہ شامل کریں
- نگرانی کے ڈیش بورڈز بنائیں

## ماڈیول 6: عام مسائل کا مسئلہ حل کرنا

### عام تعیناتی کے مسائل

#### مسئلہ 1: OpenAI سروس کوٹا تجاوز
**علامات:** کوٹا کی غلطی کے ساتھ تعیناتی ناکام ہو جاتی ہے  
**حل:**
```bash
# موجودہ کوٹہ چیک کریں
az cognitiveservices usage list --location eastus

# کوٹہ میں اضافہ کی درخواست کریں یا مختلف خطہ آزما کر دیکھیں
azd env set AZURE_LOCATION westus2
azd up
```

#### مسئلہ 2: خطے میں ماڈل دستیاب نہیں
**علامات:** AI جوابات ناکام یا ماڈل تعیناتی غلطیاں  
**حل:**
```bash
# ماڈل کی دستیابی خطہ وار چیک کریں
az cognitiveservices model list --location eastus

# دستیاب ماڈل کو اپ ڈیٹ کریں
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### مسئلہ 3: اجازت کی خرابی
**علامات:** AI خدمات کال کرتے وقت 403 Forbidden کی غلطیاں  
**حل:**
```bash
# کردار تفویضات کی پڑتال کریں
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# غائب کردار شامل کریں
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### کارکردگی کے مسائل

#### مسئلہ 4: AI جوابات سست ہیں
**تفتیشی مراحل:**
1. Application Insights میں کارکردگی کے میٹرکس چیک کریں
2. Azure پورٹل میں OpenAI سروس میٹرکس کا جائزہ لیں
3. نیٹ ورک کنیکٹیویٹی اور لیٹینسی کی تصدیق کریں

**حل:**
- عام سوالات کے لیے کیشنگ نافذ کریں
- اپنے استعمال کے کیس کے لئے مناسب OpenAI ماڈل استعمال کریں
- زیادہ لوڈ والے حالات کے لیے ریڈ رپلیکا پر غور کریں

### **لیب ایکسرسائز 6.1: مسئلہ حل کرنے کا چیلنج**

**صورت حال:** آپ کی تعیناتی کامیاب ہوئی ہے، لیکن ایپلیکیشن 500 کی غلطیاں واپس کر رہی ہے۔

**ڈی بگ کرنے کے کام:**
1. ایپلیکیشن لاگز چیک کریں
2. سروس کنیکٹیویٹی کی تصدیق کریں
3. تصدیق کا امتحان کریں
4. ترتیب کا جائزہ لیں

**استعمال کرنے کے اوزار:**
- تعیناتی کا عمومی جائزہ لینے کے لیے `azd show`
- تفصیلی سروس لاگز کے لیے Azure پورٹل
- ایپلیکیشن ٹیلی میٹری کے لیے Application Insights

## ماڈیول 7: نگرانی اور اصلاح

### مرحلہ 7.1: جامع نگرانی کا سیٹ اپ کریں

1. **کسٹم ڈیش بورڈز بنائیں:**

Azure پورٹل پر جائیں اور درج ذیل کے ساتھ ڈیش بورڈ بنائیں:  
- OpenAI درخواستوں کی تعداد اور تاخیر  
- ایپلیکیشن کی غلطیوں کی شرح  
- وسائل کا استعمال  
- لاگت کا ٹریکنگ

2. **alerts سیٹ کریں:**
```bash
# بلند غلطی کی شرح کے لیے الرٹ
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### مرحلہ 7.2: لاگت کی اصلاح

1. **موجودہ لاگت کا تجزیہ کریں:**
```bash
# لاگت کے ڈیٹا حاصل کرنے کے لیے Azure CLI استعمال کریں
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **لاگت کنٹرولز نافذ کریں:**
- بجٹ الرٹس سیٹ کریں
- خودکار اسکیلنگ پالیسیز استعمال کریں
- درخواست کیشنگ نافذ کریں
- OpenAI کے لیے ٹوکن کے استعمال کی نگرانی کریں

### **لیب ایکسرسائز 7.1: کارکردگی کی اصلاح**

**کام:** اپنی AI ایپلیکیشن کو کارکردگی اور لاگت دونوں کے لیے بہتر بنائیں۔

**بہتری کے میٹرکس:**
- اوسط جواب کا وقت 20٪ کم کریں
- ماہانہ اخراجات 15٪ کم کریں
- 99.9٪ اپ ٹائم برقرار رکھیں

**کوشش کرنے کی حکمت عملی:**
- جواب کی کیشنگ نافذ کریں
- ٹوکن کی کارکردگی کے لیے پرامپٹس کو بہتر بنائیں
- مناسب کمپیوٹ SKUs استعمال کریں
- مناسب خودکار اسکیلنگ ترتیب دیں

## آخری چیلنج: اختتام سے اختتام تک نفاذ

### چیلنج کی صورت حال

آپ کو ایک تیار شدہ AI سے چلنے والی کسٹمر سروس چیٹ بوٹ بنانے کی ذمہ داری سونپی گئی ہے جس کی یہ ضروریات ہیں:

**فعال ضروریات:**
- صارفین کے ساتھ بات چیت کے لیے ویب انٹرفیس
- جوابات کے لیے Microsoft Foundry Models کا انضمام
- دستاویزات کی تلاش کے لیے Cognitive Search کا استعمال
- موجودہ کسٹمر ڈیٹا بیس سے انضمام
- کثیر لسانی حمایت

**غیر فعال ضروریات:**
- 1000 بیک وقت صارفین کو ہینڈل کرنا
- 99.9٪ اپ ٹائم SLA
- SOC 2 کمپلائنس
- ماہانہ $500 سے کم لاگت
- متعدد ماحول (dev, staging, prod) میں تعیناتی

### نفاذ کے مراحل

1. معمار ڈیزائن کریں  
2. AZD ٹیمپلیٹ بنائیں  
3. سیکیورٹی اقدامات نافذ کریں  
4. نگرانی اور الرٹس بنائیں  
5. تعیناتی کی پائپ لائن بنائیں  
6. حل کی دستاویزات تیار کریں  

### جانچ کے معیار

- ✅ **فعالیت:** کیا یہ تمام ضروریات پوری کرتا ہے؟  
- ✅ **سیکیورٹی:** کیا بہترین طریقے نافذ ہیں؟  
- ✅ **وسعت پذیری:** کیا یہ لوڈ سنبھال سکتا ہے؟  
- ✅ **بحالی:** کیا کوڈ اور انفراسٹرکچر منظم ہیں؟  
- ✅ **لاگت:** کیا یہ بجٹ میں ہے؟  

## اضافی وسائل

### Microsoft دستاویزات
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### سیمپل ٹیمپلیٹس
- [Microsoft Foundry Models چیٹ ایپ](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI چیٹ ایپ کوئیک اسٹارٹ](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso چیٹ](https://github.com/Azure-Samples/contoso-chat)

### کمیونٹی وسائل
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 تکمیل کا سرٹیفکیٹ

مبارک ہو! آپ نے AI ورکشاپ لیب مکمل کرلی ہے۔ اب آپ کو قابلیت حاصل ہونی چاہیے کہ آپ:

- ✅ موجودہ AI ایپلیکیشنز کو AZD ٹیمپلیٹس میں تبدیل کریں
- ✅ پروڈکشن کے لئے تیار AI ایپلیکیشنز کو تعینات کریں
- ✅ AI ورک لوڈز کے لیے سیکورٹی کی بہترین طریقے نافذ کریں
- ✅ AI ایپلیکیشن کی کارکردگی کی مانیٹرنگ اور بہتری کریں
- ✅ عام تعیناتی کے مسائل کو حل کریں

### اگلے اقدامات
1. ان نمونوں کو اپنی AI پروجیکٹس پر نافذ کریں
2. کمیونٹی کو ٹیمپلیٹس واپس فراہم کریں
3. مستقل معاونت کے لیے Microsoft Foundry Discord میں شامل ہوں
4. ملٹی ریجن ڈیپلائمنٹس جیسے اعلیٰ موضوعات کو دریافت کریں

---

**ورکشاپ فیڈبیک**: اس ورکشاپ کو بہتر بنانے میں ہماری مدد کریں اور اپنا تجربہ [Microsoft Foundry Discord #Azure چینل](https://discord.gg/microsoft-azure) میں شیئر کریں۔

---

**باب کی نیویگیشن:**
- **📚 کورس ہوم**: [AZD For Beginners](../../README.md)
- **📖 موجودہ باب**: باب 2 - AI-First Development
- **⬅️ پچھلا**: [AI ماڈل ڈیپلائمنٹ](ai-model-deployment.md)
- **➡️ اگلا**: [پروڈکشن AI بہترین طریقے](production-ai-practices.md)
- **🚀 اگلا باب**: [باب 3: کنفیگریشن](../chapter-03-configuration/configuration.md)

**مدد چاہیے؟** AZD اور AI ڈیپلائمنٹس کے بارے میں مدد اور گفتگو کے لیے ہماری کمیونٹی میں شامل ہوں۔

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**دستخطی بیان**:  
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے ترجمہ کی گئی ہے۔ اگرچہ ہم درستگی کے لیے کوشاں ہیں، براہ کرم یہ بات ذہن میں رکھیں کہ خودکار ترجمے میں غلطیاں یا نا درستیاں ہو سکتی ہیں۔ اصل دستاویز اپنی مادری زبان میں مستند ذریعہ سمجھی جانی چاہیے۔ اہم معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے ہونے والے کسی بھی غلط فہمی یا غلط تشریح کی ذمہ داری ہم پر نہیں ہو گی۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->