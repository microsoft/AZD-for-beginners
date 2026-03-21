# AI ورکشاپ لیب: اپنی AI حل کو AZD-Deployable بنانا

**باب نیوی گیشن:**
- **📚 کورس ہوم**: [AZD For Beginners](../../README.md)
- **📖 موجودہ باب**: باب 2 - AI-First Development
- **⬅️ پچھلا**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ اگلا**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 اگلا باب**: [باب 3: Configuration](../chapter-03-configuration/configuration.md)

## ورکشاپ کا جائزہ

یہ ہینڈز آن لیب ڈویلپرز کو موجودہ AI ٹیمپلیٹ لے کر Azure Developer CLI (AZD) استعمال کرتے ہوئے اس کی تعیناتی کے عمل میں رہنمائی دیتی ہے۔ آپ Microsoft Foundry سروسز استعمال کرتے ہوئے پروڈکشن AI تعیناتی کے ضروری پیٹرنز سیکھیں گے۔

**دورانیہ:** 2-3 گھنٹے  
**سطح:** درمیانی  
**ضروریات:** بنیادی Azure علم، AI/ML تصورات سے واقفیت

## 🎓 سیکھنے کے مقاصد

اس ورکشاپ کے اختتام پر آپ قابل ہوں گے:  
- ✅ موجودہ AI ایپلیکیشن کو AZD ٹیمپلیٹس میں تبدیل کرنا  
- ✅ Microsoft Foundry سروسز کو AZD کے ساتھ ترتیب دینا  
- ✅ AI سروسز کے لیے محفوظ اسناد کا انتظام کرنا  
- ✅ نگرانی کے ساتھ پروڈکشن کے قابل AI ایپلیکیشنز تعینات کرنا  
- ✅ عام AI تعیناتی کے مسائل کو حل کرنا

## ضروریات

### مطلوبہ آلات  
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) انسٹال  
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) انسٹال  
- [Git](https://git-scm.com/) انسٹال  
- کوڈ ایڈیٹر (VS Code تجویز کردہ)

### Azure وسائل  
- Azure سبسکرپشن جس میں کنٹریبیوٹر رسائی ہو  
- Microsoft Foundry Models سروسز تک رسائی (یا رسائی کی درخواست کرنے کی صلاحیت)  
- ریسورس گروپ بنانے کی اجازت

### علمی ضروریات  
- Azure سروسز کا بنیادی فہم  
- کمانڈ لائن انٹرفیس سے واقفیت  
- AI/ML بنیادی تصورات (APIs، ماڈلز، پرامپٹس)

## لیب سیٹ اپ

### مرحلہ 1: ماحول کی تیاری

1. **آلات کی تنصیبات کی جانچ کریں:**
```bash
# AZD کی تنصیب چیک کریں
azd version

# Azure CLI چیک کریں
az --version

# Azure میں لاگ ان کریں
az login
azd auth login
```

2. **ورکشاپ ریپوزٹری کلون کریں:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## ماڈیول 1: AI ایپلیکیشنز کے لیے AZD اسٹرکچر کی سمجھ

### AI AZD ٹیمپلیٹ کا ڈھانچہ

AI-ریڈی AZD ٹیمپلیٹ میں اہم فائلز دریافت کریں:

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

### **لیب مشق 1.1: کنفیگریشن کی پڑتال کریں**

1. **azure.yaml فائل کا جائزہ لیں:**
```bash
cat azure.yaml
```

**دیکھنے کے نکات:**  
- AI کمپونینٹس کے لیے سروس کی تعریفیں  
- ماحول کی ویری ایبل میپنگز  
- ہوسٹ کنفیگریشنز  

2. **main.bicep انفراسٹرکچر دیکھیں:**
```bash
cat infra/main.bicep
```

**شناخت کرنے کے لیے اہم AI پیٹرنز:**  
- Microsoft Foundry Models سروس کی پروویژننگ  
- Cognitive Search انٹیگریشن  
- محفوظ کی مینجمنٹ  
- نیٹ ورک سیکیورٹی کنفیگریشنز  

### **بحث کا موضوع:** AI کے لیے یہ پیٹرنز کیوں اہم ہیں

- **سروس انحصار:** AI ایپس اکثر متعدد ہم آہنگ خدمات کی ضرورت رکھتی ہیں  
- **سیکیورٹی:** API کیز اور اینڈ پوائنٹس کو محفوظ طریقے سے سنبھالنا ضروری ہے  
- **اسکیل ایبلیٹی:** AI ورک لوڈز کے منفرد اسکیلنگ تقاضے ہوتے ہیں  
- **لاگت کا انتظام:** AI سروسز کی لاگت مناسب طریقے سے کنفیگر نہ کی جائے تو زیادہ ہو سکتی ہے  

## ماڈیول 2: پہلی AI ایپلیکیشن کی تعیناتی

### مرحلہ 2.1: ماحول کی ابتدا

1. **نیا AZD ماحول بنائیں:**
```bash
azd env new myai-workshop
```

2. **ضروری پیرامیٹرز سیٹ کریں:**
```bash
# اپنی پسندیدہ Azure خطہ سیٹ کریں
azd env set AZURE_LOCATION eastus

# اختیاری: مخصوص OpenAI ماڈل سیٹ کریں
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### مرحلہ 2.2: انفراسٹرکچر اور ایپلیکیشن تعینات کریں

1. **AZD کے ذریعے تعینات کریں:**
```bash
azd up
```

`azd up` کے دوران ہونے والے عمل:  
- ✅ Microsoft Foundry Models سروس پروویژن کی جاتی ہے  
- ✅ Cognitive Search سروس بنائی جاتی ہے  
- ✅ ویب ایپلیکیشن کے لیے App Service قائم ہوتا ہے  
- ✅ نیٹ ورکنگ اور سیکیورٹی ترتیب دی جاتی ہے  
- ✅ ایپلیکیشن کوڈ تعینات کیا جاتا ہے  
- ✅ نگرانی اور لاگنگ سیٹ کی جاتی ہے  

2. **تعیناتی کی پیش رفت مانیٹر کریں** اور بنائے جانے والے وسائل کو نوٹ کریں۔

### مرحلہ 2.3: اپنی تعیناتی کی تصدیق کریں

1. **تعینات شدہ وسائل چیک کریں:**
```bash
azd show
```

2. **تعینات شدہ ایپلیکیشن کھولیں:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **AI فنکشنلٹی ٹیسٹ کریں:**  
   - ویب ایپلیکیشن پر جائیں  
   - سیمپل کوئریز آزمائیں  
   - AI جوابات کی درستگی چیک کریں  

### **لیب مشق 2.1: مسئلہ حل کرنے کی مشق**

**صورت حال:** آپ کی تعیناتی کامیاب ہوئی لیکن AI جواب نہیں دے رہا۔

**عام مسائل چیک کریں:**  
1. **OpenAI API کیز:** درست طریقے سے سیٹ ہیں؟  
2. **ماڈل کی دستیابی:** کیا آپ کے خطے میں ماڈل موجود ہے؟  
3. **نیٹ ورک کنیکٹوٹی:** کیا خدمات رابطہ کر پا رہی ہیں؟  
4. **RBAC اجازتیں:** کیا ایپ کو OpenAI تک رسائی حاصل ہے؟  

**ڈیبگ کمانڈز:**  
```bash
# ماحولیاتی متغیرات چیک کریں
azd env get-values

# تعیناتی کے لاگز دیکھیں
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI کی تعیناتی کی حالت چیک کریں
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## ماڈیول 3: اپنی ضروریات کے لیے AI ایپلیکیشنز کی تخصیص

### مرحلہ 3.1: AI کنفیگریشن میں ترمیم کریں

1. **OpenAI ماڈل کو اپڈیٹ کریں:**
```bash
# کسی مختلف ماڈل میں تبدیل کریں (اگر آپ کے علاقے میں دستیاب ہو)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# نئی ترتیب کے ساتھ دوبارہ تعینات کریں
azd deploy
```

2. **اضافی AI سروسز شامل کریں:**

`infra/main.bicep` کو Document Intelligence کے لیے ایڈٹ کریں:

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

**بہترین عمل:** ڈیولپمنٹ اور پروڈکشن کے لیے مختلف کنفیگریشنز استعمال کریں۔

1. **پروڈکشن ماحول بنائیں:**
```bash
azd env new myai-production
```

2. **پروڈکشن مخصوص پیرامیٹرز سیٹ کریں:**
```bash
# پیداواری طور پر عموماً زیادہ ایس کے یو استعمال ہوتے ہیں
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# اضافی حفاظتی خصوصیات کو فعال کریں
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **لیب مشق 3.1: لاگت کی بہتری**

**چیلنج:** ٹیمپلیٹ کو کم لاگت والی ڈیولپمنٹ کے لیے کنفیگر کریں۔

**کام:**  
1. چینج کریں کون سے SKU فری/بیسک ٹیئر میں سیٹ کیے جا سکتے ہیں  
2. ماحول کی ویری ایبلز کو کم سے کم لاگت کے لیے ترتیب دیں  
3. تعینات کریں اور پروڈکشن کنفیگریشن کے ساتھ لاگت کا موازنہ کریں  

**حل کے اشارے:**  
- Cognitive Services کے لیے F0 (مفت) ٹیئر استعمال کریں جہاں ممکن ہو  
- سرچ سروس کے لیے ڈیولپمنٹ میں Basic ٹیئر استعمال کریں  
- Functions کے لیے Consumption پلان پر غور کریں  

## ماڈیول 4: سیکیورٹی اور پروڈکشن بہترین طریقے

### مرحلہ 4.1: محفوظ اسناد کا انتظام

**موجودہ چیلنج:** اکثر AI ایپس API کیز ہارڈ کوڈ کرتی ہیں یا غیر محفوظ اسٹوریج استعمال کرتی ہیں۔

**AZD حل:** Managed Identity + Key Vault انٹیگریشن۔

1. **اپنے ٹیمپلیٹ میں سیکیورٹی کنفیگریشن کا جائزہ لیں:**
```bash
# کی والو اور مینیجڈ آئیڈینٹی کنفیگریشن تلاش کریں
grep -r "keyVault\|managedIdentity" infra/
```

2. **Managed Identity کی تصدیق کریں:**
```bash
# چیک کریں کہ ویب ایپ کے پاس صحیح شناخت کی ترتیب ہے
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### مرحلہ 4.2: نیٹ ورک سیکیورٹی

1. **پرائیویٹ اینڈ پوائنٹس کو فعال کریں** (اگر پہلے سے کنفیگر نہیں ہیں):

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

### مرحلہ 4.3: نگرانی اور مشاہدہ

1. **Application Insights کنفیگر کریں:**
```bash
# ایپلیکیشن انسائٹس کو خود بخود ترتیب دیا جانا چاہیے
# ترتیب چیک کریں:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI مخصوص نگرانی سیٹ کریں:**

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

**کام:** اپنی تعیناتی کی سیکیورٹی بہترین طریقے چیک کریں۔

**چیک لسٹ:**  
- [ ] کوڈ یا کنفیگریشن میں کوئی ہارڈ کوڈڈ سیکریٹس نہ ہوں  
- [ ] Managed Identity سروس سے سروس کی توثیق کے لیے استعمال ہو  
- [ ] حساس کنفیگریشن کے لیے Key Vault استعمال ہو  
- [ ] نیٹ ورک رسائی مناسب طریقے سے محدود ہو  
- [ ] نگرانی اور لاگنگ فعال ہوں  

## ماڈیول 5: اپنی AI ایپلیکیشن کو تبدیل کرنا

### مرحلہ 5.1: جائزہ ورق

**اپنی ایپ تبدیل کرنے سے پہلے، ان سوالات کے جواب دیں:**

1. **ایپلیکیشن آرکیٹیکچر:**  
   - آپ کی ایپ کون سی AI سروسز استعمال کرتی ہے؟  
   - اسے کس قسم کے کمپیوٹ وسائل کی ضرورت ہے؟  
   - کیا اسے ڈیٹابیس کی ضرورت ہے؟  
   - سروسز کے درمیان انحصارات کیا ہیں؟  

2. **سیکیورٹی کی ضروریات:**  
   - آپ کی ایپ کون سا حساس ڈیٹا سنبھالتی ہے؟  
   - آپ کو کون سی کمپلائنس کی پابندیاں ہیں؟  
   - کیا آپ کو پرائیوٹ نیٹ ورکنگ کی ضرورت ہے؟  

3. **اسکیلنگ کی ضروریات:**  
   - آپ کا متوقع لوڈ کیا ہے؟  
   - کیا آپ کو آٹو اسکیلنگ چاہیے؟  
   - کیا علاقائی تقاضے ہیں؟  

### مرحلہ 5.2: اپنا AZD ٹیمپلیٹ بنائیں

**اپنی ایپ تبدیل کرنے کے لیے یہ پیٹرن اپنائیں:**

1. **بنیادی ڈھانچہ بنائیں:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# AZD ٹیمپلیٹ کی ابتدا کریں
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

### **لیب مشق 5.1: ٹیمپلیٹ تخلیق چیلنج**

**چیلنج:** ڈاکیومنٹ پروسیسنگ AI ایپ کے لیے AZD ٹیمپلیٹ بنائیں۔

**ضروریات:**  
- Microsoft Foundry Models برائے مواد کا تجزیہ  
- Document Intelligence برائے OCR  
- دستاویزات اپ لوڈ کے لیے Storage Account  
- پروسیسنگ منطق کے لیے Function App  
- یوزر انٹرفیس کے لیے ویب ایپ  

**بونس پوائنٹس:**  
- مناسب ایرر ہینڈلنگ شامل کریں  
- لاگت کا تخمینہ شامل کریں  
- نگرانی کے ڈیش بورڈ بنائیں  

## ماڈیول 6: عام مسائل کا حل

### عام تعیناتی کے مسائل

#### مسئلہ 1: OpenAI سروس کوٹا تجاوز کر گیا  
**علامات:** کوٹا ایرر کے ساتھ تعیناتی ناکام  
**حل:**  
```bash
# موجودہ کوٹے چیک کریں
az cognitiveservices usage list --location eastus

# کوٹے میں اضافہ کی درخواست کریں یا مختلف علاقے کی کوشش کریں
azd env set AZURE_LOCATION westus2
azd up
```
  
#### مسئلہ 2: ماڈل علاقائی طور پر دستیاب نہیں  
**علامات:** AI جواب نہ دینا یا ماڈل تعیناتی میں ایررز  
**حل:**  
```bash
# علاقہ کے لحاظ سے ماڈل کی دستیابی چیک کریں
az cognitiveservices model list --location eastus

# دستیاب ماڈل کو اپ ڈیٹ کریں
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```
  
#### مسئلہ 3: اجازت کے مسائل  
**علامات:** AI سروسز کو کال کرتے وقت 403 فوربڈن ایررز  
**حل:**  
```bash
# کردار کی تعیناتیوں کو چیک کریں
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# غائب کردہ کردار شامل کریں
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```
  
### کارکردگی کے مسائل

#### مسئلہ 4: AI جوابوں میں سستی  
**تحقیقی اقدامات:**  
1. Application Insights میں کارکردگی کے میٹرکس دیکھیں  
2. Azure پورٹل میں OpenAI سروس کے میٹرکس کا جائزہ لیں  
3. نیٹ ورک کنیکٹوٹی اور لیٹینسی کی تصدیق کریں  

**حل:**  
- عام کوئریز کے لیے کیشنگ نافذ کریں  
- اپنے استعمال کے لیے مناسب OpenAI ماڈل استعمال کریں  
- ہائی لوڈ کے لیے ریڈ رپلیکاز پر غور کریں  

### **لیب مشق 6.1: ڈیبگنگ چیلنج**

**صورت حال:** آپ کی تعیناتی کامیاب ہوئی لیکن ایپلیکیشن 500 ایررز دے رہا ہے۔

**ڈیبگنگ کے کام:**  
1. ایپلیکیشن لاگز دیکھیں  
2. سروس کنیکٹوٹی کی تصدیق کریں  
3. توثیق کو آزمائیں  
4. کنفیگریشن کا جائزہ لیں  

**استعمال کے لیے ٹولز:**  
- `azd show` تعیناتی کا جائزہ  
- Azure پورٹل میں سروس لاگز  
- Application Insights ایپلیکیشن ٹیلیمیٹری کے لیے  

## ماڈیول 7: نگرانی اور بہتری

### مرحلہ 7.1: جامع نگرانی قائم کریں

1. **کسٹم ڈیش بورڈز بنائیں:**

Azure پورٹل پر جائیں اور یہ ڈیش بورڈ بنائیں:  
- OpenAI درخواستوں کی تعداد اور لیٹینسی  
- ایپلیکیشن کی ایس او آرز  
- وسائل کا استعمال  
- لاگت کی ٹریکنگ  

2. **الارٹس سیٹ کریں:**  
```bash
# بلند غلطی کی شرح کے لیے انتباہ
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### مرحلہ 7.2: لاگت کی بہتر سازی

1. **موجودہ لاگت کا تجزیہ کریں:**  
```bash
# Azure CLI استعمال کریں تاکہ لاگت کا ڈیٹا حاصل کیا جا سکے
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **لاگت کنٹرول نافذ کریں:**  
- بجٹ کے الارٹس سیٹ کریں  
- آٹواسکیلنگ پالیسیاں نافذ کریں  
- درخواست کی کیشنگ کریں  
- OpenAI کے ٹوکن استعمال کی نگرانی کریں  

### **لیب مشق 7.1: کارکردگی کی بہتری**

**کام:** اپنی AI ایپلیکیشن کو کارکردگی اور لاگت دونوں کے لیے بہتر بنائیں۔

**بہتری کے میٹرکس:**  
- اوسط جواب کا وقت 20% کم کریں  
- ماہانہ لاگت 15% کم کریں  
- 99.9% اپ ٹائم برقرار رکھیں  

**آزمائیں یہ حکمت عملی:**  
- جواب کی کیشنگ نافذ کریں  
- ٹوکن کے بہتر استعمال کے لیے پرامپٹس بہتر بنائیں  
- مناسب کمپیوٹ SKU استعمال کریں  
- مناسب آٹو اسکیلنگ سیٹ کریں  

## آخری چیلنج: مکمل نفاذ

### چیلنج کی صورت حال

آپ کو ایک پروڈکشن-ریڈی AI پاورڈ کسٹمر سروس چیٹ بوٹ بنانا ہے جس کی ضروریات درج ذیل ہوں:

**فنکشنل ضروریات:**  
- صارف کی بات چیت کے لیے ویب انٹرفیس  
- Microsoft Foundry Models کے ساتھ جوابات کا انٹیگریشن  
- Cognitive Search کے ذریعے دستاویز کی تلاش کی صلاحیت  
- موجودہ کسٹمر ڈیٹابیس کے ساتھ انٹیگریشن  
- کثیر لسانی معاونت  

**غیر فنکشنل ضروریات:**  
- 1000 متوازی صارفین کو ہینڈل کرنا  
- 99.9% اپ ٹائم SLA  
- SOC 2 کمپلائنس  
- $500/مہینہ لاگت کے تحت  
- مختلف ماحولوں (dev, staging, prod) میں تعیناتی  

### نفاذ کے مراحل

1. آرکیٹیکچر ڈیزائن کریں  
2. AZD ٹیمپلیٹ بنائیں  
3. سیکیورٹی اقدامات نافذ کریں  
4. نگرانی اور الرٹ سیٹ اپ کریں  
5. تعیناتی پائپ لائنز بنائیں  
6. حل کی دستاویزات بنائیں  

### جانچ کے معیار

- ✅ **فعلیت:** کیا تمام ضروریات پوری ہو رہی ہیں؟  
- ✅ **سیکیورٹی:** کیا بہترین عمل نافذ کیے گئے ہیں؟  
- ✅ **اسکیل ایبلیٹی:** کیا لوڈ ہینڈل کر سکتا ہے؟  
- ✅ **مینٹین ایبلیٹی:** کیا کوڈ اور انفراسٹرکچر منظم ہے؟  
- ✅ **لاگت:** کیا بجٹ میں رہتا ہے؟  

## اضافی وسائل

### Microsoft دستاویزات  
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

## 🎓 تکمیل کا سرٹیفکیٹ

مبارک ہو! آپ نے AI ورکشاپ لیب مکمل کر لی ہے۔ اب آپ قابل ہوں گے:
- ✅ موجودہ AI ایپلیکیشنز کو AZD ٹیمپلیٹس میں تبدیل کریں  
- ✅ پروڈکشن کے قابل AI ایپلیکیشنز کو تعینات کریں  
- ✅ AI ورک لوڈز کے لیے سیکیورٹی کی بہترین طریقہ کار نافذ کریں  
- ✅ AI ایپلیکیشن کی کارکردگی کی نگرانی اور بہتر بنائیں  
- ✅ عام تعیناتی مسائل کو حل کریں  

### اگلے اقدامات  
1. ان پیٹرنز کو اپنے AI پروجیکٹس پر لاگو کریں  
2. ٹیمپلیٹس کو کمیونٹی کے لیے واپس فراہم کریں  
3. مزید سپورٹ کے لیے Microsoft Foundry Discord میں شامل ہوں  
4. ملٹی ریجن تعیناتی جیسے پیش رفت موضوعات کو دریافت کریں  

---

**ورکشاپ کا فیڈبیک**: اس ورکشاپ کو بہتر بنانے میں ہماری مدد کریں اور اپنا تجربہ [Microsoft Foundry Discord #Azure چینل](https://discord.gg/microsoft-azure) میں شیئر کریں۔  

---

**باب کی نیویگیشن:**  
- **📚 کورس ہوم**: [AZD For Beginners](../../README.md)  
- **📖 موجودہ باب**: باب 2 - AI-فرسٹ ڈیولپمنٹ  
- **⬅️ پچھلا**: [AI ماڈل کی تعیناتی](ai-model-deployment.md)  
- **➡️ اگلا**: [پروڈکشن AI بہترین طریقہ کار](production-ai-practices.md)  
- **🚀 اگلا باب**: [باب 3: کنفگریشن](../chapter-03-configuration/configuration.md)  

**مدد چاہیے؟** AZD اور AI تعیناتیوں کے بارے میں سپورٹ اور مباحثے کے لیے ہماری کمیونٹی میں شامل ہوں۔

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**وضاحت**:  
اس دستاویز کا ترجمہ AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے کیا گیا ہے۔ جبکہ ہم درستگی کے لیے کوشاں ہیں، براہ کرم آگاہ رہیں کہ خودکار ترجموں میں غلطیاں یا بے ضابطگیاں ہو سکتی ہیں۔ اصل دستاویز اپنی مادری زبان میں قابلِ اعتبار ماخذ سمجھی جانی چاہیے۔ اہم معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تعبیر کی ذمہ داری ہم پر نہیں ہے۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->