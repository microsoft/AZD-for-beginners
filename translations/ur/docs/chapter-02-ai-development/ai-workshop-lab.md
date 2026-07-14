# AI ورکشاپ لیب: اپنے AI حل AZD-Deployable بنانا

**باب نیوی گیشن:**
- **📚 کورس ہوم**: [AZD For Beginners](../../README.md)
- **📖 موجودہ باب**: باب 2 - AI-First Development
- **⬅️ پچھلا**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ اگلا**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 اگلا باب**: [باب 3: Configuration](../chapter-03-configuration/configuration.md)

## ورکشاپ جائزہ

یہ عملی لیب ڈویلپرز کو ایک موجودہ AI ٹیمپلیٹ لینے اور اسے Azure Developer CLI (AZD) کے ذریعے تعینات کرنے کے عمل سے گزرتی ہے۔ آپ Microsoft Foundry خدمات کا استعمال کرتے ہوئے پروڈکشن AI تعیناتی کے لیے ضروری پیٹرنز سیکھیں گے۔

> **تصدیقی نوٹ (2026-07-13):** اس ورکشاپ کا جائزہ `azd` `1.27.1` کے خلاف لیا گیا تھا۔ اگر آپ کی مقامی تنصیب پرانی ہے تو شروع کرنے سے پہلے AZD کو اپ ڈیٹ کریں تاکہ توثیق، ٹیمپلیٹ، اور تعیناتی کا ورک فلو نیچے دیے گئے مراحل سے میل کھائے۔

**دورانیہ:** 2-3 گھنٹے  
**سطح:** درمیانی  
**پیشگی ضروریات:** بنیادی Azure معلومات، AI/ML تصورات سے واقفیت

## 🎓 سیکھنے کے مقاصد

اس ورکشاپ کے اختتام تک، آپ قابل ہوں گے کہ:
- ✅ موجودہ AI ایپلیکیشن کو AZD ٹیمپلیٹس استعمال کرنے کے لیے تبدیل کریں
- ✅ Microsoft Foundry خدمات کو AZD کے ساتھ ترتیب دیں
- ✅ AI خدمات کے لیے محفوظ اسناد کے انتظام کو نافذ کریں
- ✅ نگرانی کے ساتھ پروڈکشن کے قابل AI ایپلیکیشنز تعینات کریں
- ✅ عام AI تعیناتی کے مسائل کو حل کریں

## پیشگی ضروریات

### ضروری ٹولز
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) نصب ہو
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) نصب ہو
- [Git](https://git-scm.com/) نصب ہو
- کوڈ ایڈیٹر (VS Code کی سفارش کی جاتی ہے)

### Azure وسائل
- Azure سبسکرپشن جس میں کونٹریبیوٹر رسائی ہو
- Microsoft Foundry Models خدمات تک رسائی (یا رسائی کے لیے درخواست دینے کی صلاحیت)
- ریسورس گروپ بنانے کی اجازت

### علمی ضروریات
- Azure خدمات کی بنیادی سمجھ
- کمانڈ لائن انٹرفیسز سے واقفیت
- بنیادی AI/ML تصورات (APIs، ماڈلز، پرامپٹس)

## لیب سیٹ اپ

### مرحلہ 1: ماحول کی تیاری

1. **ٹولز کی تنصیبات کی تصدیق کریں:**
```bash
# AZD کی تنصیب چیک کریں
azd version

# Azure CLI چیک کریں
az --version

# AZD ورک فلو کے لیے Azure میں لاگ ان کریں
azd auth login

# صرف اس صورت میں Azure CLI میں لاگ ان کریں اگر آپ تشخیصی کے دوران az کمانڈز چلانے کا ارادہ رکھتے ہیں
az login
```

اگر آپ متعدد ٹیننٹس پر کام کرتے ہیں یا آپ کی سبسکرپشن خودکار طور پر دریافت نہیں ہوتی، تو `azd auth login --tenant-id <tenant-id>` کے ساتھ دوبارہ کوشش کریں۔

2. **ورکشاپ کا ریپوزیٹری کلون کریں:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## ماڈیول 1: AI ایپلیکیشنز کے لیے AZD ڈھانچے کی سمجھ

### AI AZD ٹیمپلیٹ کا تجزیہ

AI-ریڈی AZD ٹیمپلیٹ میں اہم فائلوں کو دریافت کریں:

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

### **لیب مشق 1.1: ترتیب دریافت کریں**

1. **azure.yaml فائل کا معائنہ کریں:**
```bash
cat azure.yaml
```

**دیکھنے کے لیے کیا چیزیں:**
- AI اجزاء کے لیے سروس کی تعاریف
- ماحولیاتی متغیرات کی میپنگز
- ہوسٹ کنفیگریشنز

2. **main.bicep انفراسٹرکچر کا جائزہ لیں:**
```bash
cat infra/main.bicep
```

**شناخت کے لیے اہم AI پیٹرنز:**
- Microsoft Foundry Models سروس کی پروویژننگ
- Azure AI سرچ انٹیگریشن
- محفوظ کلید مینجمنٹ
- نیٹ ورک سیکیورٹی کنفیگریشنز

### **مباحثہ پوائنٹ:** AI کے لیے یہ پیٹرنز کیوں اہم ہیں

- **سروس انحصار:** AI ایپس میں اکثر متعدد ہم آہنگ خدمات کی ضرورت ہوتی ہے
- **سیکیورٹی:** API کیز اور اینڈ پوائنٹس کا محفوظ انتظام ضروری ہے
- **اسکال ایبلیٹی:** AI ورک لوڈز کی منفرد پیمائش کی ضروریات ہوتی ہیں
- **لاگت مینجمنٹ:** AI خدمات مہنگی ہوسکتی ہیں اگر صحیح ترتیب نہ دی جائے

## ماڈیول 2: اپنی پہلی AI ایپلیکیشن تعینات کریں

### مرحلہ 2.1: ماحول شروع کریں

1. **نیا AZD ماحول بنائیں:**
```bash
azd env new myai-workshop
```

2. **ضروری پیرامیٹرز سیٹ کریں:**
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

**`azd up` کے دوران کیا ہوتا ہے:**
- ✅ Microsoft Foundry Models سروس کی پروویژننگ
- ✅ Azure AI سرچ سروس تخلیق کرتا ہے
- ✅ ویب ایپلیکیشن کے لیے App Service سیٹ کرتا ہے
- ✅ نیٹ ورکنگ اور سیکیورٹی کی ترتیب دیتا ہے
- ✅ ایپلیکیشن کوڈ تعینات کرتا ہے
- ✅ نگرانی اور لاگنگ سیٹ کرتا ہے

2. **تعیناتی کی پیش رفت کی نگرانی کریں** اور بننے والے وسائل کو نوٹ کریں۔

### مرحلہ 2.3: اپنی تعیناتی کی تصدیق کریں

1. **تعینات کیے گئے وسائل چیک کریں:**
```bash
azd show
```

2. **تعینات کردہ ایپلیکیشن کھولیں:**
```bash
azd show
```

`azd show` آؤٹ پٹ میں دکھائے گئے ویب اینڈ پوائنٹ کو کھولیں۔

3. **AI فعالیت کو آزمائیں:**
   - ویب ایپلیکیشن پر جائیں
   - نمونہ سوالات آزماہ کریں
   - تصدیق کریں کہ AI جوابات کام کر رہے ہیں

### **لیب مشق 2.1: مسئلہ حل کرنے کی مشق**

**منظرنامہ**: آپ کی تعیناتی کامیاب ہوئی ہے لیکن AI جواب نہیں دے رہا۔

**عام مسائل جو چیک کرنے ہیں:**
1. **OpenAI API کیز**: تصدیق کریں کہ صحیح سیٹ ہیں
2. **ماڈل دستیابی**: چیک کریں کہ آیا آپ کا ریجن ماڈل کو سپورٹ کرتا ہے
3. **نیٹ ورک کنیکٹیویٹی**: یقینی بنائیں کہ خدمات ایک دوسرے سے رابطہ کر سکیں
4. **RBAC اجازتیں**: تصدیق کریں کہ ایپ کو OpenAI تک رسائی حاصل ہے

**ڈی بگنگ کمانڈز:**
```bash
# ماحول کے متغیرات کی جانچ کریں
azd env get-values

# تعیناتی کے لاگز دیکھیں
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI تعیناتی کی حیثیت چیک کریں
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## ماڈیول 3: اپنی ضروریات کے لیے AI ایپلیکیشنز کو حسب ضرورت بنائیں

### مرحلہ 3.1: AI کنفیگریشن میں ترمیم کریں

1. **OpenAI ماڈل کو اپ ڈیٹ کریں:**
```bash
# کسی دوسرے ماڈل پر منتقل کریں (اگر آپ کے علاقے میں دستیاب ہو)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# نئی تشکیل کے ساتھ دوبارہ تعینات کریں
azd deploy
```

2. **اضافی AI خدمات شامل کریں:**

`infra/main.bicep` کو Document Intelligence شامل کرنے کے لیے ایڈٹ کریں:

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

### مرحلہ 3.2: ماحول کے مخصوص کنفیگریشنز

**بہترین عمل**: ترقیاتی اور پروڈکشن کے لیے مختلف کنفیگریشنز۔

1. **پروڈکشن ماحول بنائیں:**
```bash
azd env new myai-production
```

2. **پروڈکشن مخصوص پیرامیٹرز سیٹ کریں:**
```bash
# پیداوار عام طور پر زیادہ SKU استعمال کرتی ہے
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# اضافی حفاظتی خصوصیات کو فعال کریں
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **لیب مشق 3.1: لاگت کی بہتر بینی**

**چیلنج**: لاگت مؤثر ترقی کے لیے ٹیمپلیٹ ترتیب دیں۔

**ٹاسک:**
1. شناخت کریں کون سے SKUs کو فری/بیسک ٹیر پر سیٹ کیا جا سکتا ہے
2. کم سے کم لاگت کے لیے ماحول متغیرات کی ترتیب دیں
3. تعینات کریں اور لاگت کا موازنہ پروڈکشن کنفیگریشن کے ساتھ کریں

**حل کے اشارے:**
- جہاں ممکن ہو Azure AI خدمات کے لیے F0 (مفت) ٹیر استعمال کریں
- ترقی میں سرچ سروس کے لیے Basic ٹیر استعمال کریں
- فانکشنز کے لیے Consumption پلان پر غور کریں

## ماڈیول 4: سیکیورٹی اور پروڈکشن کے بہترین عمل

### مرحلہ 4.1: محفوظ اسناد کا انتظام

**موجودہ چیلنج:** بہت سی AI ایپس API کیز کو ہارڈ کوڈ کرتی ہیں یا غیر محفوظ ذخیرہ استعمال کرتی ہیں۔

**AZD حل:** Managed Identity + Key Vault انٹیگریشن۔

1. **اپنے ٹیمپلیٹ میں سیکیورٹی کنفیگریشن کا جائزہ لیں:**
```bash
# کی والٹ اور منیجڈ آئیڈینٹیٹی کی ترتیب تلاش کریں
grep -r "keyVault\|managedIdentity" infra/
```

2. **Managed Identity کے کام کرنے کی تصدیق کریں:**
```bash
# چیک کریں کہ ویب ایپ کی صحیح شناخت کی تشکیل ہے یا نہیں
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### مرحلہ 4.2: نیٹ ورک سیکیورٹی

1. **پرائیویٹ اینڈ پوائنٹس فعال کریں** (اگر پہلے سے ترتیب نہیں دی گئی):

اپنے بائسہ ٹیمپلیٹ میں شامل کریں:
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

1. **Application Insights ترتیب دیں:**
```bash
# ایپلیکیشن انسائٹس کو خود بخود ترتیب دیا جانا چاہیے
# ترتیب چیک کریں:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI مخصوص نگرانی سیٹ اپ کریں:**

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

**ٹاسک:** اپنی تعیناتی کو سیکیورٹی بہترین عمل کے لیے جائزہ لیں۔

**چیک لسٹ:**
- [ ] کوڈ یا کنفیگریشن میں کوئی ہارڈ کوڈ شدہ راز نہیں
- [ ] Managed Identity کو سروس سے سروس کی توثیق کے لیے استعمال کیا گیا ہے
- [ ] Key Vault حساس کنفیگریشن کو ذخیرہ کرتا ہے
- [ ] نیٹ ورک رسائی مناسب طریقے سے محدود ہے
- [ ] نگرانی اور لاگنگ فعال ہے

## ماڈیول 5: اپنی AI ایپلیکیشن کو تبدیل کرنا

### مرحلہ 5.1: جائزہ ورکشیٹ

**اپنی ایپ کو تبدیل کرنے سے پہلے، یہ سوالات جواب دیں:**

1. **ایپلیکیشن فن تعمیر:**
   - آپ کی ایپ کون سی AI خدمات استعمال کرتی ہے؟
   - اسے کون سے کمپیوٹ وسائل کی ضرورت ہے؟
   - کیا اسے ڈیٹابیس کی ضرورت ہے؟
   - خدمات کے درمیان انحصار کیا ہیں؟

2. **سیکیورٹی ضروریات:**
   - آپ کی ایپ کون سا حساس ڈیٹا سنبھالتی ہے؟
   - آپ کے پاس کون سی تعمیل کی ضروریات ہیں؟
   - کیا آپ کو پرائیویٹ نیٹ ورکنگ کی ضرورت ہے؟

3. **اسکالنگ کی ضروریات:**
   - آپ کا متوقع لوڈ کیا ہے؟
   - کیا آپ کو خودکار پیمائش کی ضرورت ہے؟
   - کیا علاقائی ضروریات ہیں؟

### مرحلہ 5.2: اپنی AZD ٹیمپلیٹ بنائیں

**اپنی ایپ کو تبدیل کرنے کے لیے اس پیٹرن کو فالو کریں:**

1. **بنیادی ڈھانچہ بنائیں:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# AZD ٹیمپلیٹ کو initialize کریں
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

### **لیب مشق 5.1: ٹیمپلیٹ بنانے کا چیلنج**

**چیلنج:** دستاویزات پراسیسنگ AI ایپ کے لیے AZD ٹیمپلیٹ بنائیں۔

**ضروریات:**
- مواد تجزیہ کے لیے Microsoft Foundry Models
- OCR کے لیے Document Intelligence
- دستاویز اپ لوڈ کے لیے اسٹوریج اکاؤنٹ
- پروسیسنگ لاجک کے لیے فانکشن ایپ
- صارف انٹرفیس کے لیے ویب ایپ

**بونس پوائنٹس:**
- مناسب غلطی ہینڈلنگ شامل کریں
- لاگت کا اندازہ شامل کریں
- نگرانی ڈیش بورڈز سیٹ کریں

## ماڈیول 6: عام مسائل کا حل

### عام تعیناتی کے مسائل

#### مسئلہ 1: OpenAI سروس کوٹہ ختم ہو گیا
**علامات:** تعیناتی کوٹہ ایرر کے ساتھ ناکام ہو جاتی ہے
**حل:**
```bash
# موجودہ کوٹہ چیک کریں
az cognitiveservices usage list --location eastus

# کوٹہ میں اضافہ کی درخواست دیں یا مختلف خطہ آزما کر دیکھیں
azd env set AZURE_LOCATION westus2
azd up
```

#### مسئلہ 2: ماڈل علاقے میں دستیاب نہیں
**علامات:** AI جوابات ناکام ہوتے ہیں یا ماڈل تعیناتی میں خرابی
**حل:**
```bash
# علاقہ کے لحاظ سے ماڈل کی دستیابی چیک کریں
az cognitiveservices model list --location eastus

# دستیاب ماڈل کو اپ ڈیٹ کریں
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### مسئلہ 3: اجازت کے مسائل
**علامات:** AI خدمات کال کرنے پر 403 ممنوعہ ایرر
**حل:**
```bash
# کردار کی تفویضات چیک کریں
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# غائب کردار شامل کریں
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### کارکردگی کے مسائل

#### مسئلہ 4: AI جوابات کی سستی
**تحقیقی اقدامات:**
1. Application Insights میں کارکردگی کے میٹرکس چیک کریں
2. Azure پورٹل میں OpenAI سروس میٹرکس کا جائزہ لیں
3. نیٹ ورک کنیکٹیویٹی اور تاخیر کی تصدیق کریں

**حل:**
- عام سوالات کے لیے کیشنگ لاگو کریں
- اپنے استعمال کے کیس کے لیے مناسب OpenAI ماڈل استعمال کریں
- زیادہ لوڈ والے مناظر کے لیے ریڈ رپلیکس پر غور کریں

### **لیب مشق 6.1: ڈی بگنگ چیلنج**

**منظرنامہ:** آپ کی تعیناتی کامیاب ہو گئی لیکن ایپلیکیشن 500 ایرر لوٹا رہی ہے۔

**ڈی بگنگ کے ٹاسک:**
1. ایپلیکیشن لاگز چیک کریں
2. سروس کنیکٹیویٹی کی تصدیق کریں
3. توثیق کا ٹیسٹ کریں
4. کنفیگریشن کا جائزہ لیں

**استعمال کرنے کے ٹولز:**
- `azd show` تعیناتی کا جائزہ لینے کے لیے
- Azure پورٹل تفصیلی سروس لاگز کے لیے
- Application Insights ایپلیکیشن ٹیلی میٹری کے لیے

## ماڈیول 7: نگرانی اور اصلاح

### مرحلہ 7.1: جامع نگرانی قائم کریں

1. **کسٹم ڈیش بورڈز بنائیں:**

Azure پورٹل میں جا کر یہ ڈیش بورڈ بنائیں:
- OpenAI درخواستوں کی تعداد اور تاخیر
- ایپلیکیشن کے غلطی کی شرحیں
- وسائل کا استعمال
- لاگت کی نگرانی

2. **الارمز ترتیب دیں:**
```bash
# بلند غلطی کی شرح کے لیے الرٹ
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### مرحلہ 7.2: لاگت کی بہتر بینی

1. **موجودہ لاگت کا تجزیہ کریں:**
```bash
# خرچ کا ڈیٹا حاصل کرنے کے لیے Azure CLI استعمال کریں
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **لاگت کنٹرول نافذ کریں:**
- بجٹ الارمز سیٹ کریں
- آٹو سکیلنگ پالیسیاں استعمال کریں
- درخواست کیشنگ نافذ کریں
- OpenAI کی ٹوکن استعمال کی نگرانی کریں

### **لیب مشق 7.1: کارکردگی کی اصلاح**

**ٹاسک:** اپنی AI ایپلیکیشن کو کارکردگی اور لاگت دونوں کے لیے بہتر بنائیں۔

**بہتری کے لیے میٹرکس:**
- اوسط جواب دہی کا وقت 20% کم کریں
- ماہانہ لاگت 15% کم کریں
- 99.9% اپ ٹائم برقرار رکھیں

**کوشش کرنے کے لیے حکمت عملیاں:**
- جواب کیشنگ نافذ کریں
- ٹوکن کی کارکردگی کے لیے پرامپٹ بہتر کریں
- مناسب کمپیوٹ SKUs استعمال کریں
- مناسب آٹو سکیلنگ سیٹ اپ کریں

## آخری چیلنج: مکمل نفاذ

### چیلنج منظرنامہ

آپ کو ایک پروڈکشن ریڈی AI-پاورڈ کسٹمر سروس چیٹ بوٹ بنانے کا ٹاسک دیا گیا ہے جن کی یہ ضروریات ہیں:

**فعال ضروریات:**
- صارفین کے تعاملات کے لیے ویب انٹرفیس
- جوابات کے لیے Microsoft Foundry Models کے ساتھ انٹیگریشن
- Azure AI سرچ کا استعمال کرتے ہوئے دستاویزات کی تلاش کی صلاحیت
- موجودہ کسٹمر ڈیٹا بیس کے ساتھ انٹیگریشن
- متعدد زبانوں کی حمایت

**غیر فعال ضروریات:**
- 1000 بیک وقت صارفین کے لیے ہینڈلنگ
- 99.9% اپ ٹائم SLA
- SOC 2 تعمیل
- ماہانہ لاگت $500 سے کم
- متعدد ماحول میں تعیناتی (dev, staging, prod)

### نفاذ کے مراحل

1. **فن تعمیر ڈیزائن کریں**
2. **AZD ٹیمپلیٹ بنائیں**
3. **سیکیورٹی اقدامات نافذ کریں**
4. **نگرانی اور الارٹنگ سیٹ اپ کریں**
5. **تعیناتی پائپ لائنز بنائیں**
6. **حل دستاویزات تیار کریں**

### تشخیصی معیارات

- ✅ **فعالیت:** کیا یہ تمام ضروریات پوری کرتا ہے؟
- ✅ **سیکیورٹی:** کیا بہترین عمل نافذ کیے گئے ہیں؟
- ✅ **اسکالایبلیٹی:** کیا یہ لوڈ ہینڈل کر سکتا ہے؟
- ✅ **منتقلی کی سہولت:** کیا کوڈ اور انفراسٹرکچر اچھی طرح مرتب ہیں؟
- ✅ **لاگت:** کیا یہ بجٹ میں رہتا ہے؟

## اضافی وسائل

### مائیکروسافٹ دستاویزات
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### نمونہ ٹیمپلیٹس
- [Microsoft Foundry Models چیٹ ایپ](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI چیٹ ایپ کوئیک اسٹارٹ](https://github.com/Azure-Samples/openai-chat-app-quickstart)

- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### کمیونٹی کے وسائل
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 تکمیل کا سرٹیفیکیٹ

مبارک ہو! آپ نے AI ورکشاپ لیب مکمل کر لی ہے۔ اب آپ کے قابل ہونا چاہیے کہ آپ:

- ✅ موجودہ AI ایپلیکیشنز کو AZD ٹیمپلیٹس میں تبدیل کریں
- ✅ پیداوار کے لیے تیار AI ایپلیکیشنز کو تعینات کریں
- ✅ AI ورک لوڈز کے لیے سیکیورٹی کی بہترین مشقیں نافذ کریں
- ✅ AI ایپلیکیشن کی کارکردگی کی نگرانی اور بہتر بنائیں
- ✅ عام تعیناتی کے مسائل کو حل کریں

### اگلے اقدامات
1. ان نمونوں کو اپنے AI پروجیکٹس پر لاگو کریں
2. ٹیمپلیٹس کمیونٹی کو واپس دیں
3. مسلسل سپورٹ کے لیے Microsoft Foundry Discord میں شامل ہوں
4. ملٹی ریجن تعیناتی جیسے جدید موضوعات کو دریافت کریں

---

**ورکشاپ تاثرات**: اس ورکشاپ کو بہتر بنانے میں ہماری مدد کریں اپنے تجربے کو [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure) میں شیئر کرکے۔

---

**چیپٹر نیوی گیشن:**
- **📚 کورس ہوم**: [AZD For Beginners](../../README.md)
- **📖 موجودہ چیپٹر**: چیپٹر 2 - AI-فرسٹ ڈیولپمنٹ
- **⬅️ پچھلا**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ اگلا**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 اگلا چیپٹر**: [چیپٹر 3: کنفیگریشن](../chapter-03-configuration/configuration.md)

**مدد چاہیے؟** AZD اور AI تعیناتیوں کے بارے میں سپورٹ اور مباحثے کے لیے ہماری کمیونٹی میں شامل ہوں۔

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ڈس کلیمر**:
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے ترجمہ کی گئی ہے۔ جبکہ ہم درستگی کے لیے کوشاں ہیں، براہ کرم اس بات سے آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا عدم درستیاں ہو سکتی ہیں۔ اصل دستاویز اپنے مادری زبان میں مستند ماخذ سمجھی جائے گی۔ حساس معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کی ذمہ داری ہم قبول نہیں کرتے۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->