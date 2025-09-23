<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "22e9deee2d82e70fc841c60f97627916",
  "translation_date": "2025-09-23T14:02:47+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "ur"
}
-->
# AI ورکشاپ لیب: اپنی AI حل کو AZD-Deployable بنانا

**باب کی نیویگیشن:**
- **📚 کورس ہوم**: [AZD کے ابتدائی رہنما](../../README.md)
- **📖 موجودہ باب**: باب 2 - AI-فرسٹ ڈیولپمنٹ
- **⬅️ پچھلا**: [AI ماڈل ڈیپلائمنٹ](ai-model-deployment.md)
- **➡️ اگلا**: [پروڈکشن AI بہترین طریقے](production-ai-practices.md)
- **🚀 اگلا باب**: [باب 3: کنفیگریشن](../getting-started/configuration.md)

## ورکشاپ کا جائزہ

یہ عملی لیب ڈویلپرز کو ایک موجودہ AI ٹیمپلیٹ لینے اور اسے Azure Developer CLI (AZD) کے ذریعے ڈیپلائے کرنے کے عمل سے گزارتا ہے۔ آپ Azure AI Foundry سروسز کے استعمال سے پروڈکشن AI ڈیپلائمنٹ کے ضروری پیٹرنز سیکھیں گے۔

**دورانیہ:** 2-3 گھنٹے  
**سطح:** درمیانی  
**ضروریات:** Azure کی بنیادی معلومات، AI/ML تصورات سے واقفیت

## 🎓 سیکھنے کے مقاصد

اس ورکشاپ کے اختتام تک، آپ یہ کرنے کے قابل ہوں گے:
- ✅ موجودہ AI ایپلیکیشن کو AZD ٹیمپلیٹس کے ساتھ تبدیل کریں
- ✅ Azure AI Foundry سروسز کو AZD کے ساتھ کنفیگر کریں
- ✅ AI سروسز کے لیے محفوظ کریڈینشل مینجمنٹ نافذ کریں
- ✅ پروڈکشن کے لیے تیار AI ایپلیکیشنز کو مانیٹرنگ کے ساتھ ڈیپلائے کریں
- ✅ عام AI ڈیپلائمنٹ مسائل کو حل کریں

## ضروریات

### مطلوبہ ٹولز
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) انسٹال کریں
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) انسٹال کریں
- [Git](https://git-scm.com/) انسٹال کریں
- کوڈ ایڈیٹر (VS Code تجویز کردہ)

### Azure وسائل
- Azure سبسکرپشن کے ساتھ کنٹریبیوٹر رسائی
- Azure OpenAI سروسز تک رسائی (یا رسائی کی درخواست کرنے کی صلاحیت)
- ریسورس گروپ بنانے کی اجازت

### علم کی ضروریات
- Azure سروسز کی بنیادی سمجھ
- کمانڈ لائن انٹرفیسز سے واقفیت
- AI/ML تصورات کی بنیادی معلومات (APIs، ماڈلز، پرامپٹس)

## لیب سیٹ اپ

### مرحلہ 1: ماحول کی تیاری

1. **ٹول انسٹالیشن کی تصدیق کریں:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure
az login
azd auth login
```

2. **ورکشاپ ریپوزٹری کلون کریں:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```


## ماڈیول 1: AI ایپلیکیشنز کے لیے AZD اسٹرکچر کو سمجھنا

### AI کے لیے تیار AZD ٹیمپلیٹ کی ساخت

AI کے لیے تیار AZD ٹیمپلیٹ میں کلیدی فائلز کو دریافت کریں:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Azure OpenAI configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```


### **لیب مشق 1.1: کنفیگریشن کو دریافت کریں**

1. **azure.yaml فائل کا جائزہ لیں:**
```bash
cat azure.yaml
```

**دیکھنے کے لیے:**
- AI اجزاء کے لیے سروس کی تعریفیں
- ماحول کے متغیرات کی میپنگ
- ہوسٹ کنفیگریشنز

2. **main.bicep انفراسٹرکچر کا جائزہ لیں:**
```bash
cat infra/main.bicep
```

**AI کے کلیدی پیٹرنز کی شناخت کریں:**
- Azure OpenAI سروس کی پروویژننگ
- Cognitive Search انٹیگریشن
- محفوظ کلیدی مینجمنٹ
- نیٹ ورک سیکیورٹی کنفیگریشنز

### **بحث کا نقطہ:** AI کے لیے یہ پیٹرنز کیوں اہم ہیں

- **سروس کی انحصاریت:** AI ایپس اکثر متعدد مربوط سروسز کی ضرورت ہوتی ہیں
- **سیکیورٹی:** API کیز اور اینڈپوائنٹس کو محفوظ طریقے سے مینج کرنا ضروری ہے
- **اسکیل ایبلٹی:** AI ورک لوڈز کے منفرد اسکیلنگ کی ضروریات ہوتی ہیں
- **لاگت کا انتظام:** AI سروسز مہنگی ہو سکتی ہیں اگر صحیح طریقے سے کنفیگر نہ کی جائیں

## ماڈیول 2: اپنی پہلی AI ایپلیکیشن ڈیپلائے کریں

### مرحلہ 2.1: ماحول کو انیشیئلائز کریں

1. **نیا AZD ماحول بنائیں:**
```bash
azd env new myai-workshop
```

2. **ضروری پیرامیٹرز سیٹ کریں:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: Set specific OpenAI model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```


### مرحلہ 2.2: انفراسٹرکچر اور ایپلیکیشن کو ڈیپلائے کریں

1. **AZD کے ساتھ ڈیپلائے کریں:**
```bash
azd up
```

**`azd up` کے دوران کیا ہوتا ہے:**
- ✅ Azure OpenAI سروس پروویژن کرتا ہے
- ✅ Cognitive Search سروس بناتا ہے
- ✅ ویب ایپلیکیشن کے لیے App Service سیٹ کرتا ہے
- ✅ نیٹ ورکنگ اور سیکیورٹی کنفیگر کرتا ہے
- ✅ ایپلیکیشن کوڈ ڈیپلائے کرتا ہے
- ✅ مانیٹرنگ اور لاگنگ سیٹ کرتا ہے

2. **ڈیپلائمنٹ کی پیش رفت کو مانیٹر کریں** اور بننے والے وسائل کو نوٹ کریں۔

### مرحلہ 2.3: اپنی ڈیپلائمنٹ کی تصدیق کریں

1. **ڈیپلائے کیے گئے وسائل کو چیک کریں:**
```bash
azd show
```

2. **ڈیپلائے کی گئی ایپلیکیشن کھولیں:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **AI فعالیت کو ٹیسٹ کریں:**
   - ویب ایپلیکیشن پر جائیں
   - نمونہ سوالات آزمائیں
   - تصدیق کریں کہ AI جوابات کام کر رہے ہیں

### **لیب مشق 2.1: ٹربل شوٹنگ کی مشق**

**منظرنامہ:** آپ کی ڈیپلائمنٹ کامیاب ہوئی لیکن AI جواب نہیں دے رہا۔

**چیک کرنے کے عام مسائل:**
1. **OpenAI API کیز:** تصدیق کریں کہ وہ صحیح طریقے سے سیٹ ہیں
2. **ماڈل کی دستیابی:** چیک کریں کہ آپ کا علاقہ ماڈل کو سپورٹ کرتا ہے
3. **نیٹ ورک کنیکٹیویٹی:** یقینی بنائیں کہ سروسز آپس میں بات چیت کر سکتی ہیں
4. **RBAC اجازتیں:** تصدیق کریں کہ ایپ OpenAI تک رسائی حاصل کر سکتی ہے

**ڈیبگنگ کمانڈز:**
```bash
# Check environment variables
azd env get-values

# View deployment logs
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```


## ماڈیول 3: AI ایپلیکیشنز کو اپنی ضروریات کے مطابق حسب ضرورت بنانا

### مرحلہ 3.1: AI کنفیگریشن میں ترمیم کریں

1. **OpenAI ماڈل کو اپ ڈیٹ کریں:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_MODEL gpt-4

# Redeploy with the new configuration
azd deploy
```

2. **اضافی AI سروسز شامل کریں:**

Document Intelligence شامل کرنے کے لیے `infra/main.bicep` میں ترمیم کریں:

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

**بہترین طریقہ:** ترقی اور پروڈکشن کے لیے مختلف کنفیگریشنز۔

1. **پروڈکشن ماحول بنائیں:**
```bash
azd env new myai-production
```

2. **پروڈکشن کے مخصوص پیرامیٹرز سیٹ کریں:**
```bash
# Production typically uses higher SKUs
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Enable additional security features
azd env set ENABLE_PRIVATE_ENDPOINTS true
```


### **لیب مشق 3.1: لاگت کی اصلاح**

**چیلنج:** ٹیمپلیٹ کو لاگت کے مؤثر ترقی کے لیے کنفیگر کریں۔

**کام:**
1. شناخت کریں کہ کون سے SKUs کو مفت/بنیادی درجات پر سیٹ کیا جا سکتا ہے
2. ماحول کے متغیرات کو کم سے کم لاگت کے لیے کنفیگر کریں
3. ڈیپلائے کریں اور پروڈکشن کنفیگریشن کے ساتھ لاگت کا موازنہ کریں

**حل کے اشارے:**
- Cognitive Services کے لیے F0 (مفت) درجے کا استعمال کریں جہاں ممکن ہو
- ترقی میں Search Service کے لیے Basic درجے کا استعمال کریں
- Functions کے لیے Consumption پلان پر غور کریں

## ماڈیول 4: سیکیورٹی اور پروڈکشن کے بہترین طریقے

### مرحلہ 4.1: محفوظ کریڈینشل مینجمنٹ

**موجودہ چیلنج:** بہت سی AI ایپس API کیز کو ہارڈ کوڈ کرتی ہیں یا غیر محفوظ اسٹوریج استعمال کرتی ہیں۔

**AZD حل:** Managed Identity + Key Vault انٹیگریشن۔

1. **اپنے ٹیمپلیٹ میں سیکیورٹی کنفیگریشن کا جائزہ لیں:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Managed Identity کی تصدیق کریں:**
```bash
# Check if the web app has the correct identity configuration
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```


### مرحلہ 4.2: نیٹ ورک سیکیورٹی

1. **پرائیویٹ اینڈپوائنٹس کو فعال کریں** (اگر پہلے سے کنفیگر نہیں ہیں):

اپنے bicep ٹیمپلیٹ میں شامل کریں:
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

1. **Application Insights کو کنفیگر کریں:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI کے مخصوص مانیٹرنگ سیٹ اپ کریں:**

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

**کام:** اپنی ڈیپلائمنٹ کا جائزہ لیں تاکہ سیکیورٹی کے بہترین طریقے نافذ ہوں۔

**چیک لسٹ:**
- [ ] کوڈ یا کنفیگریشن میں کوئی ہارڈ کوڈڈ راز نہیں
- [ ] سروس-ٹو-سروس تصدیق کے لیے Managed Identity استعمال کیا گیا
- [ ] Key Vault حساس کنفیگریشن کو اسٹور کرتا ہے
- [ ] نیٹ ورک تک رسائی مناسب طریقے سے محدود ہے
- [ ] مانیٹرنگ اور لاگنگ فعال ہیں

## ماڈیول 5: اپنی AI ایپلیکیشن کو تبدیل کرنا

### مرحلہ 5.1: تشخیصی ورکشیٹ

**اپنی ایپ کو تبدیل کرنے سے پہلے**, ان سوالات کے جواب دیں:

1. **ایپلیکیشن آرکیٹیکچر:**
   - آپ کی ایپ کون سی AI سروسز استعمال کرتی ہے؟
   - اسے کون سے کمپیوٹ وسائل کی ضرورت ہے؟
   - کیا اسے ڈیٹا بیس کی ضرورت ہے؟
   - سروسز کے درمیان انحصار کیا ہیں؟

2. **سیکیورٹی کی ضروریات:**
   - آپ کی ایپ کون سا حساس ڈیٹا ہینڈل کرتی ہے؟
   - آپ کے پاس کون سی تعمیل کی ضروریات ہیں؟
   - کیا آپ کو پرائیویٹ نیٹ ورکنگ کی ضرورت ہے؟

3. **اسکیلنگ کی ضروریات:**
   - آپ کا متوقع لوڈ کیا ہے؟
   - کیا آپ کو آٹو اسکیلنگ کی ضرورت ہے؟
   - کیا علاقائی ضروریات ہیں؟

### مرحلہ 5.2: اپنا AZD ٹیمپلیٹ بنائیں

**اپنی ایپ کو تبدیل کرنے کے لیے اس پیٹرن پر عمل کریں:**

1. **بنیادی ساخت بنائیں:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
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

**infra/main.bicep** - مرکزی ٹیمپلیٹ:
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


### **لیب مشق 5.1: ٹیمپلیٹ تخلیق کا چیلنج**

**چیلنج:** دستاویز پروسیسنگ AI ایپ کے لیے AZD ٹیمپلیٹ بنائیں۔

**ضروریات:**
- مواد کے تجزیے کے لیے Azure OpenAI
- OCR کے لیے Document Intelligence
- دستاویز اپلوڈز کے لیے Storage Account
- پروسیسنگ منطق کے لیے Function App
- صارف انٹرفیس کے لیے ویب ایپ

**اضافی پوائنٹس:**
- مناسب ایرر ہینڈلنگ شامل کریں
- لاگت کا تخمینہ شامل کریں
- مانیٹرنگ ڈیش بورڈز سیٹ کریں

## ماڈیول 6: عام مسائل کا ٹربل شوٹنگ

### عام ڈیپلائمنٹ مسائل

#### مسئلہ 1: OpenAI سروس کوٹہ ختم ہو گیا
**علامات:** ڈیپلائمنٹ کو کوٹہ ایرر کے ساتھ ناکامی
**حل:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase or try different region
azd env set AZURE_LOCATION westus2
azd up
```


#### مسئلہ 2: ماڈل علاقے میں دستیاب نہیں
**علامات:** AI جوابات ناکام یا ماڈل ڈیپلائمنٹ ایرر
**حل:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```


#### مسئلہ 3: اجازت کے مسائل
**علامات:** AI سروسز کو کال کرتے وقت 403 Forbidden ایرر
**حل:**
```bash
# Check role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add missing roles
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```


### کارکردگی کے مسائل

#### مسئلہ 4: AI جوابات سست ہیں
**تحقیقی اقدامات:**
1. Application Insights میں کارکردگی میٹرکس چیک کریں
2. Azure پورٹل میں OpenAI سروس میٹرکس کا جائزہ لیں
3. نیٹ ورک کنیکٹیویٹی اور لیٹنسی کی تصدیق کریں

**حل:**
- عام سوالات کے لیے کیشنگ نافذ کریں
- اپنے استعمال کے کیس کے لیے مناسب OpenAI ماڈل استعمال کریں
- زیادہ لوڈ کے منظرناموں کے لیے ریڈ ریپلیکا پر غور کریں

### **لیب مشق 6.1: ڈیبگنگ چیلنج**

**منظرنامہ:** آپ کی ڈیپلائمنٹ کامیاب ہوئی، لیکن ایپلیکیشن 500 ایرر واپس کرتی ہے۔

**ڈیبگنگ کام:**
1. ایپلیکیشن لاگز چیک کریں
2. سروس کنیکٹیویٹی کی تصدیق کریں
3. تصدیق کی جانچ کریں
4. کنفیگریشن کا جائزہ لیں

**استعمال کرنے کے لیے ٹولز:**
- `azd show` ڈیپلائمنٹ کا جائزہ لینے کے لیے
- Azure پورٹل تفصیلی سروس لاگز کے لیے
- Application Insights ایپلیکیشن ٹیلیمیٹری کے لیے

## ماڈیول 7: مانیٹرنگ اور اصلاح

### مرحلہ 7.1: جامع مانیٹرنگ سیٹ اپ کریں

1. **کسٹم ڈیش بورڈز بنائیں:**

Azure پورٹل پر جائیں اور ایک ڈیش بورڈ بنائیں جس میں شامل ہو:
- OpenAI درخواستوں کی تعداد اور لیٹنسی
- ایپلیکیشن ایرر کی شرح
- وسائل کا استعمال
- لاگت کا ٹریکنگ

2. **الرٹس سیٹ کریں:**
```bash
# Alert for high error rate
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
# Use Azure CLI to get cost data
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **لاگت کنٹرول نافذ کریں:**
- بجٹ الرٹس سیٹ کریں
- آٹو اسکیلنگ پالیسیاں استعمال کریں
- درخواست کیشنگ نافذ کریں
- OpenAI کے لیے ٹوکن استعمال کی نگرانی کریں

### **لیب مشق 7.1: کارکردگی کی اصلاح**

**کام:** اپنی AI ایپلیکیشن کو کارکردگی اور لاگت دونوں کے لیے بہتر بنائیں۔

**بہتر کرنے کے لیے میٹرکس:**
- اوسط جواب وقت کو 20% کم کریں
- ماہانہ لاگت کو 15% کم کریں
- 99.9% اپ ٹائم برقرار رکھیں

**آزمانے کے لیے حکمت عملی:**
- جواب کیشنگ نافذ کریں
- ٹوکن کی کارکردگی کے لیے پرامپٹس کو بہتر بنائیں
- مناسب کمپیوٹ SKUs استعمال کریں
- مناسب آٹو اسکیلنگ سیٹ اپ کریں

## آخری چیلنج: اختتام سے اختتام تک عمل درآمد

### چیلنج منظرنامہ

آپ کو ایک پروڈکشن کے لیے تیار AI پاورڈ کسٹمر سروس چیٹ بوٹ بنانے کا کام دیا گیا ہے جس میں یہ ضروریات ہیں:

**فنکشنل ضروریات:**
- کسٹمر انٹریکشنز کے لیے ویب انٹرفیس
- جوابات کے لیے Azure OpenAI کے ساتھ انٹیگریشن
- Cognitive Search کا استعمال کرتے ہوئے دستاویز تلاش کی صلاحیت
- موجودہ کسٹمر ڈیٹا بیس کے ساتھ انٹیگریشن
- کثیر زبان کی حمایت

**غیر فنکشنل ضروریات:**
- 1000 متوازی صارفین کو ہینڈل کریں
- 99.9% اپ ٹائم SLA
- SOC 2 تعمیل
- $500/ماہ کے تحت لاگت
- متعدد ماحول (ترقی، اسٹیجنگ، پروڈکشن) پر ڈیپلائے کریں

### عمل درآمد کے مراحل

1. **آرکیٹیکچر ڈیزائن کریں**
2. **AZD ٹیمپلیٹ بنائیں**
3. **سیکیورٹی اقدامات نافذ کریں**
4. **مانیٹرنگ اور الرٹنگ سیٹ اپ کریں**
5. **ڈیپلائمنٹ پائپ لائنز بنائیں**
6. **حل کی دستاویزات تیار کریں**

### تشخیصی معیار

- ✅ **فنکشنلٹی:** کیا یہ تمام ضروریات کو پورا کرتا ہے؟
- ✅ **سیکیورٹی:** کیا بہترین طریقے نافذ کیے گئے ہیں؟
- ✅ **اسکیل ایبلٹی:** کیا یہ لوڈ کو ہینڈل کر سکتا ہے؟
- ✅ **مینٹین ایبلٹی:** کیا کوڈ اور انفراسٹرکچر اچھی طرح سے منظم ہیں؟
- ✅ **لاگت:** کیا یہ بجٹ کے اندر رہتا ہے؟

## اضافی وسائل

### Microsoft دستاویزات
- [Azure Developer CLI دستاویزات](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure OpenAI
مبارک ہو! آپ نے AI ورکشاپ لیب مکمل کر لی ہے۔ اب آپ کو یہ کرنے کے قابل ہونا چاہیے:

- ✅ موجودہ AI ایپلیکیشنز کو AZD ٹیمپلیٹس میں تبدیل کریں
- ✅ پروڈکشن کے لیے تیار AI ایپلیکیشنز کو ڈیپلائے کریں
- ✅ AI ورک لوڈز کے لیے سیکیورٹی کے بہترین اصول نافذ کریں
- ✅ AI ایپلیکیشن کی کارکردگی کی نگرانی اور اصلاح کریں
- ✅ عام ڈیپلائمنٹ مسائل کو حل کریں

### اگلے مراحل
1. ان پیٹرنز کو اپنے AI پروجیکٹس پر لاگو کریں
2. ٹیمپلیٹس کو کمیونٹی میں واپس شیئر کریں
3. مسلسل مدد کے لیے Azure AI Foundry Discord میں شامل ہوں
4. ایڈوانس موضوعات جیسے ملٹی ریجن ڈیپلائمنٹس کو دریافت کریں

---

**ورکشاپ فیڈبیک**: اس ورکشاپ کو بہتر بنانے میں ہماری مدد کریں اور اپنا تجربہ [Azure AI Foundry Discord #Azure چینل](https://discord.gg/microsoft-azure) پر شیئر کریں۔

---

**چیپٹر نیویگیشن:**
- **📚 کورس ہوم**: [AZD For Beginners](../../README.md)
- **📖 موجودہ چیپٹر**: چیپٹر 2 - AI-فرسٹ ڈیولپمنٹ
- **⬅️ پچھلا**: [AI ماڈل ڈیپلائمنٹ](ai-model-deployment.md)
- **➡️ اگلا**: [پروڈکشن AI بہترین اصول](production-ai-practices.md)
- **🚀 اگلا چیپٹر**: [چیپٹر 3: کنفیگریشن](../getting-started/configuration.md)

**مدد چاہیے؟** AZD اور AI ڈیپلائمنٹس کے بارے میں سپورٹ اور گفتگو کے لیے ہماری کمیونٹی میں شامل ہوں۔

---

