# AI ورکشاپ لیب: آپ کے AI حل AZD-تعیناتی کے قابل بنانا

**باب نیویگیشن:**
- **📚 کورس ہوم**: [نو آموزوں کے لیے AZD](../../README.md)
- **📖 موجودہ باب**: باب 2 - AI-فرسٹ ڈیولپمنٹ
- **⬅️ پچھلا**: [AI ماڈل تعیناتی](ai-model-deployment.md)
- **➡️ اگلا**: [پروڈکشن AI بہترین طریقے](../chapter-08-production/production-ai-practices.md)
- **🚀 اگلا باب**: [باب 3: ترتیب](../chapter-03-configuration/configuration.md)

## ورکشاپ کا جائزہ

یہ عملی لیب ڈویلپرز کو ایک موجودہ AI ٹیمپلیٹ کو لینے اور Azure Developer CLI (AZD) کا استعمال کرتے ہوئے تعینات کرنے کے عمل سے گزرتی ہے۔ آپ Microsoft Foundry خدمات کے استعمال سے پروڈکشن AI تعیناتی کے لیے اہم طریقے سیکھیں گے۔

> **ریلیز جائزہ (2026-11-04):** AZD کمانڈ ہدایات اور سیمپل کنفیگریشن ناموں کی جانچ `azd` `1.37.2` ریلیز اور لنک شدہ سیمپل کی موجودہ کنفیگریشن کے خلاف کی گئی ہے۔ یہ دستاویزات کا جائزہ ہے، براہ راست تعیناتی کی تصدیق نہیں۔ RAG لیب کو ایجنٹ ایکسٹینشن کی ضرورت نہیں؛ ایجنٹ کے جائزے کے لیے علیحدہ `azure.ai.evaluations` ایکسٹینشن اور [موجودہ جائزہ ورک فلو](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) استعمال کریں، پرانے ایجنٹ جائزہ کمانڈز نہیں۔

**دورانیہ:** 2-3 گھنٹے  
**سطح:** درمیانی  
**پیشگی ضروریات:** بنیادی Azure معلومات، AI/ML تصورات سے واقفیت

## 🎓 تعلیمی مقاصد

اس ورکشاپ کے اختتام تک، آپ قابل ہوں گے:
- ✅ ایک موجودہ AI AZD ٹیمپلیٹ کو دریافت کریں اور اپنی ایپلیکیشن کی تبدیلی کی منصوبہ بندی کریں
- ✅ AZD کے ساتھ Microsoft Foundry خدمات کو ترتیب دیں
- ✅ AI خدمات کے لیے محفوظ اسناد کا انتظام نافذ کریں
- ✅ ایک AI حوالہ ایپلیکیشن کو مانیٹرنگ کے ساتھ تعینات کریں
- ✅ عام AI تعیناتی مسائل کو حل کریں

## پیشگی ضروریات

### ضروری ٹولز
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) نصب
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) نصب
- [Git](https://git-scm.com/) نصب
- کوڈ ایڈیٹر (وی ایس کوڈ کی سفارش کی جاتی ہے)

یہ کمانڈ بلاکس باش نحو استعمال کرتے ہیں (بشمول لائن کی تسلسل اور `grep`)۔ ونڈوز پر، Git Bash/WSL استعمال کریں یا انہیں پاورشیل میں تبدیل کریں۔ نیز [نمونہ کے مقامی ماحول کی ترتیب](https://github.com/Azure-Samples/azure-search-openai-demo#local-environment) میں درج زبان، پیکیج مینیجر، اور کنٹینر کے اوزار بھی انسٹال کریں۔

### ایزور وسائل
- ایزور سبسکرپشن جس میں وسائل مہیا کرنے اور کردار تفویض کی اجازت ہو (محض کونٹریبیوٹر RBAC تفویضات تخلیق نہیں کر سکتا؛ ایک مجاز کردار منتظم یا نمونے کا دستاویزی مساوی استعمال کریں)
- Microsoft Foundry Models سروسز تک رسائی (یا رسائی کی درخواست کرنے کی صلاحیت)
- ریسورس گروپ بنانے کی اجازت

### علمی ضروریات
- ایزور سروسز کی بنیادی سمجھ
- کمانڈ لائن انٹرفیسز کی واقفیت
- بنیادی AI/ML تصورات (APIs، ماڈلز، پرامپٹس)

## لیب کی ترتیب

### مرحلہ 1: ماحول کی تیاری

1. **اوزار کی تنصیبات کی تصدیق کریں:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure for AZD workflows
azd auth login

# Login to Azure CLI only if you plan to run az commands during diagnostics
az login
```

اگر آپ متعدد ٹیننٹس میں کام کر رہے ہیں یا آپ کی سبسکرپشن خود بخود معلوم نہیں ہو رہی، تو دوبارہ کوشش کریں `azd auth login --tenant-id <tenant-id>` کے ساتھ۔

2. **ورکشاپ ریپوزیٹری کلون کریں:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## ماڈیول 1: AI ایپلیکیشنز کے لیے AZD ساخت کی سمجھ

### AI AZD ٹیمپلیٹ کی تشریح

AI تیار AZD ٹیمپلیٹ کی کلیدی فائلوں کو دریافت کریں:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   ├── core/               # Shared infrastructure modules
│   └── app/                # Application-specific infrastructure
├── app/                    # Backend, frontend, and optional ingestion functions
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

چیک آؤٹ نمونہ تبدیل ہو سکتا ہے؛ `.azure/` ماحول کی شروعات کے بعد ظاہر ہوتا ہے، ہرگز نئے کلون میں ضروری نہیں۔ اس خاکہ سے میل کھانے کے لیے گم شدہ ڈائریکٹریاں بنانے کے بجائے حقیقی چیک آؤٹ کا معائنہ کریں۔

### **لیب مشق 1.1: تشکیلات کو دریافت کریں**

1. **azure.yaml فائل کا معائنہ کریں:**
```bash
cat azure.yaml
```

**دیکھنے کے لیے:**
- AI اجزاء کے لیے سروس کی تعریفیں
- ماحول کی متغیرات کے میپنگز
- میزبان کی تشریحات

2. **main.bicep انفراسٹرکچر کا جائزہ لیں:**
```bash
cat infra/main.bicep
```

**شناخت کرنے کے لیے کلیدی AI پیٹرنز:**
- Microsoft Foundry Models سروس کی فراہمی
- ایزور AI سرچ انضمام
- محفوظ کلید مینجمنٹ
- نیٹ ورک سیکیورٹی کی تشریحات

### **تبادلہ خیال کا نقطہ:** AI کے لیے یہ پیٹرنز اہم کیوں ہیں

- **سروس انحصارات**: AI ایپس کو اکثر متعدد مربوط سروسز کی ضرورت ہوتی ہے
- **سکیورٹی**: API کیز اور ان پوائنٹس کا محفوظ انتظام ضروری ہے
- **پیمائش پذیری**: AI ورک لوڈز کی منفرد پیمائش کی ضروریات ہوتی ہیں
- **لاگت کا انتظام**: AI سروسز اگر مناسب طریقے سے ترتیب نہ دی جائیں تو مہنگی ہو سکتی ہیں

## ماڈیول 2: اپنی پہلی AI ایپلیکیشن تعینات کریں

### مرحلہ 2.1: ماحول کی ابتدا

1. **نیا AZD ماحول بنائیں:**
```bash
azd env new myai-workshop
```

2. **ضروری پیرامیٹرز سیٹ کریں:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: select a chat model supported by your region and quota
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
```

### مرحلہ 2.2: انفراسٹرکچر اور ایپلیکیشن کی تعیناتی

1. **AZD کے ذریعے تعینات کریں:**
```bash
azd up
```

**`azd up` کے دوران کیا ہوتا ہے:**
- ✅ Microsoft Foundry Models سروس کی فراہمی کرتا ہے
- ✅ Azure AI Search سروس بناتا ہے
- ✅ Azure Container Apps کو بیک اینڈ اور مرتب شدہ فرنٹ اینڈ کے لیے ترتیب دیتا ہے (موجودہ نمونہ ڈیفالٹ)
- ✅ نیٹ ورکنگ اور سیکیورٹی ترتیب دیتا ہے
- ✅ ایپلیکیشن کوڈ تعینات کرتا ہے
- ✅ مانیٹرنگ اور لاگنگ ترتیب دیتا ہے

2. **تعیناتی کی پیشرفت کی نگرانی کریں** اور بنائے جا رہے وسائل کو نوٹ کریں۔

### مرحلہ 2.3: اپنی تعیناتی کی تصدیق کریں

1. **تعینات کیے گئے وسائل چیک کریں:**
```bash
azd show
```

2. **تعینات کی گئی ایپلیکیشن کھولیں:**
```bash
azd show
```

ویب اینڈپوائنٹ کھولیں جو `azd show` آؤٹ پٹ میں دکھایا گیا ہے۔

3. **AI فعالیت کا تجربہ کریں:**
   - ویب ایپلیکیشن پر جائیں
   - نمونہ سوالات آزمائیں
   - یقینی بنائیں کہ AI جوابات کام کر رہے ہیں

### **لیب مشق 2.1: مسئلہ حل کرنے کی مشق**

**منظر نامہ**: آپ کی تعیناتی کامیاب ہوئی لیکن AI جواب نہیں دے رہا۔

**عام مسائل جن کی جانچ کریں:**
1. **تصدیق:** منیجڈ شناخت اور کردار کی تفویضات کو چیک کریں؛ صرف اس صورت میں API کیز چیک کریں اگر آپ نے جان بوجھ کر کی بیسڈ توثیق کو فعال کیا ہو
2. **ماڈل کی دستیابی:** چیک کریں کہ آیا آپ کے خطے میں ماڈل دستیاب ہے
3. **نیٹ ورک کنیکٹیویٹی:** یقینی بنائیں کہ سروسز آپس میں بات چیت کر سکتی ہیں
4. **RBAC اجازتیں:** تصدیق کریں کہ ایپ OpenAI تک رسائی رکھتی ہے

**ڈی بگنگ کمانڈز:**
```bash
# Check environment variables
azd env get-values

# Open the selected environment's logging view
azd monitor --logs

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## ماڈیول 3: آپ کی ضروریات کے مطابق AI ایپلیکیشنز کی تخصیص

### قدم 3.1: AI ترتیب میں ترمیم کریں

1. **OpenAI ماڈل کو اپ ڈیٹ کریں:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1

# Apply the model infrastructure change, then deploy the application
azd up
```

2. **مزید AI سروسز شامل کریں:**

دستاویزاتی ذہانت شامل کرنے کے لیے `infra/main.bicep` میں ترمیم کریں:

ذیل میں ایک وضاحتی ٹکڑا ہے، مکمل ٹیمپلیٹ نہیں۔ نمونہ پہلے ہی دستاویز پروسیسنگ سروسز فراہم کر سکتا ہے: ڈپلیکیٹ وسائل شامل کرنے سے پہلے اس کے موجودہ انفراسٹرکچر کا معائنہ کریں۔ حسب ضرورت اضافے آؤٹ پٹس، شناختوں، اور ایپلیکیشن کنفیگریشن کو مربوط کرنے کی ضرورت رکھتے ہیں۔

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

### قدم 3.2: مخصوص ماحول کی ترتیب

**بہترین طریقہ کار**: ترقی اور پیداوار کے لئے مختلف ترتیبات۔

1. **پیداوار کا ماحول تیار کریں:**
```bash
azd env new myai-production
```

2. **پیداواری مخصوص پیرامیٹرز سیٹ کریں:**
```bash
# Use the sample's actual Search SKU parameter
azd env set AZURE_SEARCH_SERVICE_SKU standard

# Enable private endpoints using the sample's parameter
azd env set AZURE_USE_PRIVATE_ENDPOINT true
```

یہ نام نمونہ کی [main.parameters.json](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/infra/main.parameters.json) سے آتے ہیں۔ `azd env set` ایک قدر رکھتا ہے لیکن کوئی بے ترتیب متغیر موثر نہیں بناتا: ٹیمپلیٹ کو اسے استعمال کرنا ہوتا ہے۔ عام رسائی بند کرنے سے پہلے نمونہ کا [نیٹ ورک آئسولیشن گائیڈ](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/docs/deploy_private.md) دیکھیں اور انفراسٹرکچر تبدیلیوں کے لئے `azd up` استعمال کریں۔ OpenAI SKU `S0` اکیلا ماڈل کے ذریعے نہیں بلکہ ماڈل کی تعیناتی کی قسم اور صلاحیت بھی اہم ہے۔

### **لیب مشق 3.1: لاگت کی بہتری**

**چیلنج**: لاگت مؤثر ترقی کے لیے ٹیمپلیٹ کو تشکیل دیں۔

**ذمہ داریاں:**
1. ضائع ہونے والے ورکشاپ ماحول کا انتخاب کریں: `azd env select myai-workshop`۔
2. موجودہ سرچ SKU اور ماڈل کی صلاحیت ریکارڈ کریں جو `infra/main.parameters.json` اور منتخب ماحول سے ہے۔
3. نیچے دیے گئے معاون شدہ ان پٹ استعمال کریں، ماڈل/علاقہ کوٹہ کی تصدیق کے بعد:
   ```bash
   azd env set AZURE_SEARCH_SERVICE_SKU basic
   azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
   azd up
   ```
4. پورٹل میں سرچ SKU اور تعیناتی کی صلاحیت کی تصدیق کریں اور قیمت کیلکولیٹر کے ساتھ فرق کا اندازہ لگائیں۔ بلنگ ڈیٹا فوری طور پر اپ ڈیٹ ہونے کی توقع نہ رکھیں۔

**کامیابی کے معیار:** سرچ بنیادی سطح استعمال کرتا ہے، چیٹ کی تعیناتی میں درکار معاون صلاحیت موجود ہے، اور ایپ اب بھی نمونہ سوال کا جواب دیتی ہے۔ صلاحیت `10` ریٹ لمٹ الاوکےشن ہے، ٹوکن قیمت کی چھوٹ نہیں۔ سرچ ٹیر کی تبدیلیاں محدود یا دوبارہ تخلیق کی ضرورت ہو سکتی ہیں؛ پیداوار کے وسائل پر تجربہ نہ کریں۔ F0 سروس مخصوص ہے اور Azure OpenAI ماڈل SKU نہیں ہے۔

## ماڈیول 4: سیکیورٹی اور پیداوار کے بہترین طریقے

### قدم 4.1: اسناد کا محفوظ انتظام

**موجودہ چیلنج:** کئی AI ایپس API کیز کو ہارڈ کوڈ کرتی ہیں یا غیر محفوظ اسٹوریج استعمال کرتی ہیں۔

**AZD حل:** منیجڈ شناخت + کی وولٹ انٹیگریشن۔

1. **اپنے ٹیمپلیٹ میں سیکیورٹی کنفیگریشن کا جائزہ لیں:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **تصدیق کریں کہ مینیجڈ شناخت کام کر رہی ہے:**
```bash
# For the sample's default Container Apps host
az containerapp identity show --name YOUR_CONTAINER_APP_NAME --resource-group YOUR_RG
```

### مرحلہ 4.2: نیٹ ورک کی سیکیورٹی

1. **نمونے کی سپورٹ کردہ نیٹ ورک کنفیگریشن کا استعمال کرتے ہوئے پرائیوٹ اینڈ پوائنٹس کو فعال کریں** (اگر پہلے سے کنفیگر نہ کیے گئے ہوں)۔

اپنے اپنے ٹیمپلیٹ کے لیے، یہ بیان کردہ حصہ اوپن اے آئی اینڈ پوائنٹ کنکشن دکھاتا ہے۔ اسے وی نیٹ، پرائیوٹ ڈی این ایس کنفیگریشن، اور ایپلیکیشن کنیکٹوٹی کی بھی ضرورت ہے؛ اسے بغیر تبدیلی کے نمونے میں نہ چسپاں کریں، جس میں پہلے سے پرائیوٹ اینڈ پوائنٹ ماڈیول شامل ہیں:
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

1. **ایپلیکیشن انسائٹس کو کنفیگر کریں:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_INSIGHTS_NAME --resource-group YOUR_RG
```

2. **نمونے کے ایپلیکیشن انسائٹس انٹیگریشن کو فعال کریں:**
```bash
azd env set AZURE_USE_APPLICATION_INSIGHTS true
azd up
azd monitor --overview
```

نمونے کا انسٹرومینٹیشن ٹیلی میٹری جاری کرتا ہے؛ ایک فرضی `OPENAI_MONITOR_ENABLED` سیٹنگ AI میٹرکس کو فعال نہیں کرتی۔ ماڈل کالز، لیٹنسی، ناکامیاں، اور ٹوکن کے استعمال کے لیے ٹریسز کا جائزہ لیں، اور حساس پرامپٹس یا جوابات کو ریکارڈ کرنے سے گریز کریں۔

### **لیب مشق 4.1: سیکیورٹی آڈٹ**

**کام**: اپنی تعیناتی کا جائزہ لیں کہ سیکیورٹی کی بہترین عمل درآمد ہو رہی ہے۔

**چیک لسٹ:**
- [ ] کوڈ یا کنفیگریشن میں کوئی ہارڈ کوڈڈ سیکریٹس نہیں
- [ ] سروس سے سروس کی توثیق کے لیے مینیجڈ شناخت کا استعمال
- [ ] کی والٹ حساس کنفیگریشن کو ذخیرہ کرتا ہے
- [ ] نیٹ ورک رسائی مناسب طریقے سے محدود ہے
- [ ] مانیٹرنگ اور لاگنگ فعال ہیں

## ماڈیول 5: اپنا AI ایپلیکیشن تبدیل کرنا

### مرحلہ 5.1: اسیسمنٹ ورک شیٹ

**اپنی ایپ کو تبدیل کرنے سے پہلے، ان سوالات کے جواب دیں:**

1. **ایپلیکیشن آرکیٹیکچر:**
   - آپ کی ایپ کون سی AI سروسز استعمال کرتی ہے؟
   - اسے کون سے کمپیوٹ وسائل درکار ہیں؟
   - کیا اسے ڈیٹا بیس کی ضرورت ہے؟
   - سروسز کے درمیان انحصار کیا ہیں؟

2. **سیکیورٹی کی ضروریات:**
   - آپ کی ایپ کون سا حساس ڈیٹا سنبھالتی ہے؟
   - آپ کی کون سی تعمیل کی ضروریات ہیں؟
   - کیا آپ کو پرائیوٹ نیٹ ورکنگ کی ضرورت ہے؟

3. **اسکیلنگ کی ضروریات:**
   - آپ کا متوقع بوجھ کیا ہے؟
   - کیا آپ کو خودکار اسکیلنگ کی ضرورت ہے؟
   - کیا علاقائی تقاضے ہیں؟

### مرحلہ 5.2: اپنا AZD ٹیمپلیٹ بنائیں

**اپنی ایپ کو تبدیل کرنے کے لیے اس پیٹرن پر عمل کریں:**

**صرف اسکافولڈ:** اس حصے میں API/ویب ایپلیکیشن سورس، ہوسٹ انفراسٹرکچر، ماڈل تعیناتیاں، شناخت/RBAC، یا مکمل شدہ `main.parameters.json` شامل نہیں ہیں۔ ریسورس گروپ اسکوپڈ بائسک ماڈیول کمپوزیشن کی وضاحت کرتا ہے؛ ایک عام AZD سبسکرپشن اسکوپڈ انٹری پوائنٹ کو ریسورس گروپ بنانا اور اس اسکوپ پر اسے کال کرنا چاہیے۔ توقع نہ رکھیں کہ صرف ان حصوں کو کاپی کرنے سے `azd up` مکمل ایپ تعینات کر دے گا۔ رن ایبل بیس لائن کے لیے، ماڈیول 1 سے RAG ٹیمپلیٹ کا استعمال جاری رکھیں۔

1. **بنیادی ڈھانچہ بنائیں:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal .
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

**infra/modules/openai.bicep** - اوپن اے آئی ماڈیول:
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
    disableLocalAuth: true
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **لیب مشق 5.1: ٹیمپلیٹ بنانے کا چیلنج**

**چیلنج**: دستاویز پراسیسنگ AI ایپ کے لیے AZD ٹیمپلیٹ بنائیں۔

**ضروریات:**
- مواد کے تجزیے کے لیے Microsoft Foundry ماڈلز
- OCR کے لیے دستاویزی ذہانت
- دستاویز اپلوڈز کے لیے اسٹوریج اکاؤنٹ
- پروسیسنگ لاجک کے لیے فنکشن ایپ
- صارف انٹرفیس کے لیے ویب ایپ

**بونس پوائنٹس:**
- مناسب ایرر ہینڈلنگ شامل کریں
- لاگت کا تخمینہ شامل کریں
- نگرانی کے ڈیش بورڈ قائم کریں

## ماڈیول 6: عام مسائل کا حل تلاش کرنا

### عام تعیناتی کے مسائل

#### مسئلہ 1: OpenAI سروس کوٹا ختم ہو گیا
**علامات:** کوٹا ایرر کے ساتھ تعیناتی ناکام ہو جاتی ہے
**حل:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase, OR try a new disposable environment in another region.
# Azure resources cannot be relocated merely by changing AZURE_LOCATION.
azd env new myai-quota-test
azd env set AZURE_LOCATION westus2
azd up
```

#### مسئلہ 2: ماڈل مخصوص خطے میں دستیاب نہیں
**علامات:** AI جوابات ناکام ہوتے ہیں یا ماڈل تعیناتی میں غلطیاں آتی ہیں
**حل:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
azd up
```

#### مسئلہ 3: اجازت کے مسائل
**علامات:** AI سروسز کو کال کرتے ہوئے 403 Forbidden ایررز آتے ہیں
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
1. پرفارمنس میٹرکس کے لیے Application Insights چیک کریں
2. Azure پورٹل میں OpenAI سروس میٹرکس کا جائزہ لیں
3. نیٹ ورک کنیکٹیویٹی اور تاخیر کی تصدیق کریں

**حل:**
- عام سوالات کے لیے کیشنگ نافذ کریں
- اپنے استعمال کے لیے مناسب OpenAI ماڈل استعمال کریں
- ماڈل کے RPM/TPM حدوں کی جانچ کے بعد ہی ایپلیکیشن کی نقول کی تعداد بڑھائیں؛ Azure OpenAI تعیناتیاں عمومی ڈیٹا بیس طرز کی "ریڈ ریپلیکا" سیٹنگ فراہم نہیں کرتی ہیں

### **لیب مشق 6.1: ڈی بگنگ چیلنج**

**منظرنامہ**: آپ کی تعیناتی کامیاب ہوئی، لیکن ایپلیکیشن 500 ایررز ظاہر کر رہی ہے۔

**ڈی بگنگ کے کام:**
1. ایپلیکیشن لاگز چیک کریں
2. سروس کنیکٹیویٹی کی تصدیق کریں
3. تصدیق کو آزمائیں
4. تشکیلات کا جائزہ لیں

**استعمال کے لیے آلات:**
- `azd show` برائے تعیناتی کا جائزہ
- Azure پورٹل برائے مفصل سروس لاگز
- Application Insights برائے درخواست کی ٹیلی میٹری

## ماڈیول 7: نگرانی اور بہتر سازی

### قدم 7.1: جامع نگرانی قائم کریں

1. **حسب ضرورت ڈیش بورڈ بنائیں:**

Azure پورٹل پر جائیں اور درج ذیل کے ساتھ ڈیش بورڈ بنائیں:
- OpenAI درخواست کی تعداد اور تاخیر
- درخواست کی خرابی کی شرحیں
- وسائل کا استعمال
- لاگت کا سراغ لگانا

2. **الرٹس سیٹ کریں:**
```bash
# Failed-request count on the Application Insights component (not a percentage)
az monitor metrics alert create \
  --name "AI-App-Failed-Requests" \
  --resource-group YOUR_RG \
  --scopes YOUR_APPLICATION_INSIGHTS_RESOURCE_ID \
  --condition "count requests/failed > 10" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --description "More than 10 failed requests in five minutes"
```

تصدیق کریں کہ جزو درخواست کی ٹیلی میٹری خارج کرتا ہے اور اگر اطلاع دہی کی ضرورت ہو تو ایک ایکشن گروپ شامل کریں۔ میٹرک ایک گنتی ہے، ناکامی کی فیصد نہیں؛ ریٹ الرٹ کے لیے مناسب سوال اور مخرج کی ضرورت ہوتی ہے۔

### قدم 7.2: لاگت کی بہتری

1. **موجودہ لاگت کا تجزیہ کریں:**
```bash
# Set a recent reporting window supported by your billing account.
az consumption usage list --start-date YYYY-MM-DD --end-date YYYY-MM-DD
```

تاریخ کے پلے ہولڈرز کو تبدیل کریں۔ کسٹمشن API کی حمایت بلنگ معاہدے کے مطابق مختلف ہوتی ہے؛ اگر استعمال کی تفصیلات دستیاب نہ ہوں تو پورٹل میں لاگت مینجمنٹ استعمال کریں۔ لاگتیں تاخیر شدہ ہیں، حقیقی وقت کا ٹیسٹ زریہ نہیں۔

2. **لاگت کنٹرول نافذ کریں:**
- بجٹ الرٹس مرتب کریں
- آٹو اسکیلنگ پالیسیز استعمال کریں
- درخواست کی کیشینگ نافذ کریں
- OpenAI کے لیے ٹوکن کے استعمال کی نگرانی کریں

### **لیب مشق 7.1: کارکردگی کی بہتری**

**کام**: اپنے AI ایپلیکیشن کو کارکردگی اور لاگت دونوں کے لیے بہتر بنائیں۔

**بہتری کے لیے میٹرکس:**
- اوسط جواب کا وقت 20% کم کریں
- ماہانہ لاگت کو 15% کم کریں
- 99.9% دستیابی کا SLO اور پیمائش کی کھڑکی متعین کریں (مختصر لیب ماہانہ اپ ٹائم دکھانے کے قابل نہیں)

**استراتيجيات آزمانے کے لیے:**
- جواب کی کیشینگ نافذ کریں
- ٹوکن کی کارکردگی کے لیے پرامپٹس کو بہتر بنائیں
- مناسب compute SKUs استعمال کریں
- صحیح آٹو اسکیلنگ مرتب کریں

## آخری چیلنج: ابتدا سے انتہا تک نفاذ

### چیلنج منظرنامہ

یہ ایک **اختیاری فن تعمیر/ڈیزائن چیلنج** ہے، نہ کہ فراہم کردہ قابل عمل مشق یا پیداوار کی تصدیق۔ AI سے چلنے والا کسٹمر سروس چیٹ بوٹ تجویز کریں اور دستاویز کریں کہ کون سی ضروریات مزید نفاذ اور ثبوت کی متقاضی ہیں:

**فعلی ضروریات:**
- صارفین کے لیے ویب انٹرفیس
- جوابات کے لیے Microsoft Foundry Models کے ساتھ انضمام
- Azure AI سرچ استعمال کرتے ہوئے دستاویز کی تلاش کی صلاحیت
- موجودہ کسٹمر ڈیٹا بیس کے ساتھ انضمام
- کثیر لسانی حمایت

**غیر فعلی ضروریات:**
- 1000 ایک ساتھ صارفین کو ہینڈل کرنا
- 99.9% اپ ٹائم SLA
- SOC 2 تعمیل
- ماہانہ $500 سے کم لاگت
- مختلف ماحول (dev، staging، prod) میں تعینات کرنا

یہ مفروضاتی اسٹیک ہولڈر حدود ہیں، بیک وقت یقینی نتائج نہیں۔ لاگت کا اندازہ لگانے سے پہلے درخواست کی شرح، پرامپٹ/آؤٹ پٹ کے سائز، اور سیشن دورانیہ متعین کریں؛ 1,000 ایک ساتھ صارفین ایک ورک لوڈ قائم نہیں کرتے اور نہ ہی یہ ثابت کرتے ہیں کہ $500 کا بجٹ ممکن ہے۔ SOC 2 ایک تنظیمی آڈٹ نتیجہ ہے، AZD ٹیمپلیٹ کے ذریعے فعال ہونے والا سوئچ نہیں۔ رد و بدل کی نشاندہی کریں اور ناقابل عمل حدود کو ثبوت کے ساتھ مسترد کریں۔

### نفاذ کے اقدامات

1. **فن تعمیر ڈیزائن کریں**
2. **AZD ٹیمپلیٹ بنائیں**
3. **سیکیورٹی اقدامات نافذ کریں**
4. **نگرانی اور اطلاع دہی قائم کریں**
5. **تعیناتی پائپ لائنز بنائیں**
6. **حل کی دستاویزات تیار کریں**

### جانچ کے معیار

- ✅ **فعلیت**: کیا نافذ شدہ صلاحیتیں ظاہر کی گئی ہیں اور باقی کمی واضح ہے؟
- ✅ **سیکیورٹی**: کیا بہترین عملی طریقے نافذ کیے گئے ہیں؟
- ✅ **اسکیل ایبلٹی**: کیا یہ بوجھ کو سنبھال سکتا ہے؟
- ✅ **قابل دیکھ بھال ہونا**: کیا کوڈ اور انفراسٹرکچر منظم ہیں؟
- ✅ **لاگت**: کیا یہ بجٹ کے اندر رہتا ہے؟

## اضافی ذرائع

### Microsoft دستاویزات
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### نمونہ ٹیمپلیٹس
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### کمیونٹی ذرائع
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 تکمیل کا نقطہ چیک کریں

مبارک ہو! آپ نے AI ورکشاپ لیب مکمل کر لی ہے۔ اب آپ درج ذیل کر سکیں گے:

- ✅ یہ سمجھائیں کہ موجودہ AI ایپلیکیشن کو AZD ٹیمپلیٹ میں کیسے ڈھالا جائے
- ✅ AI ریفرنس ایپلیکیشن کی تعیناتی اور جانچ کریں
- ✅ AI ورک لوڈز کے لیے سیکیورٹی کی بہترین عملی طریقے نافذ کریں
- ✅ AI ایپلیکیشن کی کارکردگی کی نگرانی اور بہتری کریں
- ✅ عمومی تعیناتی مسائل کے حل تلاش کریں

**صفائی کریں:** `azd env list` چلائیں، اس لیب میں بنائے گئے ہر عارضی ماحول منتخب کریں (`myai-workshop`، اور اگر تعینات کیا گیا ہو تو `myai-production`/`myai-quota-test`)، اور ہر ایک میں `azd down` چلائیں۔ حذف کرنے کا منصوبہ دیکھیں؛ صرف ایک ماحول کی مقامی ترتیب کو حذف کرنا Azure وسائل کو حذف نہیں کرتا۔ `--purge` سے اجتناب کریں جب تک کہ آپ نرم حذف کیے گئے وسائل کو ناقابل واپسی طور پر ہٹانے کو نہ سمجھتے ہوں۔

### اگلے اقدامات
1. ان نمونوں کو اپنی AI پراجیکٹس میں نافذ کریں
2. ٹیمپلیٹس کو کمیونٹی کو واپس دیں
3. جاری مدد کے لیے Microsoft Foundry Discord میں شامل ہوں
4. متعدد خطوں میں تعیناتی جیسے جدید موضوعات دریافت کریں

---

**ورکشاپ تاثرات**: ہماری مدد کریں اس ورکشاپ کو بہتر بنانے میں، اپنا تجربہ [Microsoft Foundry Discord #Azure چینل](https://discord.gg/microsoft-azure) میں شیئر کر کے۔

---

**باب کی نیویگیشن:**
- **📚 کورس کا ہوم پیج**: [AZD For Beginners](../../README.md)
- **📖 موجودہ باب**: باب 2 - AI-First Development
- **⬅️ پچھلا**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ اگلا**: [Production AI Best Practices](../chapter-08-production/production-ai-practices.md)
- **🚀 اگلا باب**: [باب 3: تشکیلات](../chapter-03-configuration/configuration.md)

**مدد چاہیے؟** ہماری کمیونٹی میں شامل ہوں AZD اور AI تعیناتیوں کے بارے میں سپورٹ اور مباحثوں کے لیے۔

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ڈس کلیمر**:
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے ترجمہ کی گئی ہے۔ جبکہ ہم درستگی کے لیے کوشاں ہیں، براہ کرم اس بات سے آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا عدم درستیاں ہو سکتی ہیں۔ اصل دستاویز اپنے مادری زبان میں مستند ماخذ سمجھی جائے گی۔ حساس معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کی ذمہ داری ہم قبول نہیں کرتے۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->