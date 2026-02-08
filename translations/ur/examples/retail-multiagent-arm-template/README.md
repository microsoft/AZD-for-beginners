# ریٹیل ملٹی ایجنٹ حل - انفراسٹرکچر ٹیمپلیٹ

**باب 5: پروڈکشن ڈیپلائمنٹ پیکیج**
- **📚 کورس ہوم**: [AZD فار بیگنرز](../../README.md)
- **📖 متعلقہ باب**: [باب 5: ملٹی ایجنٹ AI حل](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 منظرنامہ گائیڈ**: [مکمل آرکیٹیکچر](../retail-scenario.md)
- **🎯 فوری ڈیپلائمنٹ**: [ایک کلک ڈیپلائمنٹ](../../../../examples/retail-multiagent-arm-template)

> **⚠️ صرف انفراسٹرکچر ٹیمپلیٹ**  
> یہ ARM ٹیمپلیٹ **Azure وسائل** کو ملٹی ایجنٹ سسٹم کے لیے ڈیپلائے کرتا ہے۔  
>  
> **کیا ڈیپلائے ہوتا ہے (15-25 منٹ):**
> - ✅ Azure OpenAI (GPT-4o، GPT-4o-mini، تین ریجنز میں ایمبیڈنگز)
> - ✅ AI سرچ سروس (خالی، انڈیکس بنانے کے لیے تیار)
> - ✅ کنٹینر ایپس (پلیس ہولڈر امیجز، آپ کے کوڈ کے لیے تیار)
> - ✅ اسٹوریج، Cosmos DB، Key Vault، Application Insights
>  
> **کیا شامل نہیں ہے (ترقی کی ضرورت ہے):**
> - ❌ ایجنٹ امپلیمنٹیشن کوڈ (کسٹمر ایجنٹ، انوینٹری ایجنٹ)
> - ❌ روٹنگ لاجک اور API اینڈپوائنٹس
> - ❌ فرنٹ اینڈ چیٹ UI
> - ❌ سرچ انڈیکس اسکیمز اور ڈیٹا پائپ لائنز
> - ❌ **تخمینی ترقیاتی وقت: 80-120 گھنٹے**
>  
> **اس ٹیمپلیٹ کو استعمال کریں اگر:**
> - ✅ آپ ملٹی ایجنٹ پروجیکٹ کے لیے Azure انفراسٹرکچر پروویژن کرنا چاہتے ہیں
> - ✅ آپ ایجنٹ امپلیمنٹیشن الگ سے تیار کرنے کا ارادہ رکھتے ہیں
> - ✅ آپ کو پروڈکشن ریڈی انفراسٹرکچر بیس لائن کی ضرورت ہے
>  
> **استعمال نہ کریں اگر:**
> - ❌ آپ فوری طور پر کام کرنے والے ملٹی ایجنٹ ڈیمو کی توقع کرتے ہیں
> - ❌ آپ مکمل ایپلیکیشن کوڈ کی مثالیں تلاش کر رہے ہیں

## جائزہ

یہ ڈائریکٹری ملٹی ایجنٹ کسٹمر سپورٹ سسٹم کے **انفراسٹرکچر بنیاد** کو ڈیپلائے کرنے کے لیے ایک جامع Azure Resource Manager (ARM) ٹیمپلیٹ پر مشتمل ہے۔ ٹیمپلیٹ تمام ضروری Azure سروسز کو پروویژن کرتا ہے، مناسب طریقے سے کنفیگر اور آپس میں جڑا ہوا، آپ کی ایپلیکیشن ڈیولپمنٹ کے لیے تیار۔

**ڈیپلائمنٹ کے بعد، آپ کے پاس ہوگا:** پروڈکشن ریڈی Azure انفراسٹرکچر  
**سسٹم مکمل کرنے کے لیے، آپ کو ضرورت ہوگی:** ایجنٹ کوڈ، فرنٹ اینڈ UI، اور ڈیٹا کنفیگریشن (دیکھیں [آرکیٹیکچر گائیڈ](../retail-scenario.md))

## 🎯 کیا ڈیپلائے ہوتا ہے

### بنیادی انفراسٹرکچر (ڈیپلائمنٹ کے بعد کی حالت)

✅ **Azure OpenAI سروسز** (API کالز کے لیے تیار)
  - پرائمری ریجن: GPT-4o ڈیپلائمنٹ (20K TPM کیپیسٹی)
  - سیکنڈری ریجن: GPT-4o-mini ڈیپلائمنٹ (10K TPM کیپیسٹی)
  - تیسرے ریجن: ٹیکسٹ ایمبیڈنگز ماڈل (30K TPM کیپیسٹی)
  - ایویلیوایشن ریجن: GPT-4o گریڈر ماڈل (15K TPM کیپیسٹی)
  - **حالت:** مکمل طور پر فعال - فوری API کالز کی جا سکتی ہیں

✅ **Azure AI سرچ** (خالی - کنفیگریشن کے لیے تیار)
  - ویکٹر سرچ کی صلاحیتیں فعال
  - اسٹینڈرڈ ٹائر کے ساتھ 1 پارٹیشن، 1 ریپلیکا
  - **حالت:** سروس چل رہی ہے، لیکن انڈیکس بنانے کی ضرورت ہے
  - **ضروری عمل:** اپنی اسکیم کے ساتھ سرچ انڈیکس بنائیں

✅ **Azure اسٹوریج اکاؤنٹ** (خالی - اپلوڈز کے لیے تیار)
  - بلاپ کنٹینرز: `documents`, `uploads`
  - محفوظ کنفیگریشن (HTTPS-صرف، کوئی پبلک ایکسیس نہیں)
  - **حالت:** فائلز وصول کرنے کے لیے تیار
  - **ضروری عمل:** اپنی پروڈکٹ ڈیٹا اور دستاویزات اپلوڈ کریں

⚠️ **کنٹینر ایپس ماحول** (پلیس ہولڈر امیجز ڈیپلائڈ)
  - ایجنٹ روٹر ایپ (nginx ڈیفالٹ امیج)
  - فرنٹ اینڈ ایپ (nginx ڈیفالٹ امیج)
  - آٹو اسکیلنگ کنفیگرڈ (0-10 انسٹینسز)
  - **حالت:** پلیس ہولڈر کنٹینرز چل رہے ہیں
  - **ضروری عمل:** اپنی ایجنٹ ایپلیکیشنز بنائیں اور ڈیپلائ کریں

✅ **Azure Cosmos DB** (خالی - ڈیٹا کے لیے تیار)
  - ڈیٹا بیس اور کنٹینر پہلے سے کنفیگرڈ
  - کم لیٹینسی آپریشنز کے لیے آپٹمائزڈ
  - TTL فعال خودکار صفائی کے لیے
  - **حالت:** چیٹ ہسٹری اسٹور کرنے کے لیے تیار

✅ **Azure Key Vault** (اختیاری - رازوں کے لیے تیار)
  - سافٹ ڈیلیٹ فعال
  - RBAC منیجڈ آئیڈینٹیز کے لیے کنفیگرڈ
  - **حالت:** API کیز اور کنکشن اسٹرنگز اسٹور کرنے کے لیے تیار

✅ **Application Insights** (اختیاری - مانیٹرنگ فعال)
  - لاگ اینالیٹکس ورک اسپیس سے جڑا ہوا
  - کسٹم میٹرکس اور الرٹس کنفیگرڈ
  - **حالت:** آپ کی ایپس سے ٹیلیمیٹری وصول کرنے کے لیے تیار

✅ **ڈاکیومنٹ انٹیلیجنس** (API کالز کے لیے تیار)
  - S0 ٹائر پروڈکشن ورک لوڈز کے لیے
  - **حالت:** اپلوڈ شدہ دستاویزات پروسیس کرنے کے لیے تیار

✅ **Bing سرچ API** (API کالز کے لیے تیار)
  - S1 ٹائر ریئل ٹائم سرچز کے لیے
  - **حالت:** ویب سرچ کوئریز کے لیے تیار

### ڈیپلائمنٹ موڈز

| موڈ | OpenAI کیپیسٹی | کنٹینر انسٹینسز | سرچ ٹائر | اسٹوریج ریڈنڈنسی | بہترین استعمال |
|------|-----------------|---------------------|-------------|-------------------|----------|
| **کم سے کم** | 10K-20K TPM | 0-2 ریپلیکا | بیسک | LRS (لوکل) | ڈیولپمنٹ/ٹیسٹ، لرننگ، پروف آف کانسیپٹ |
| **اسٹینڈرڈ** | 30K-60K TPM | 2-5 ریپلیکا | اسٹینڈرڈ | ZRS (زون) | پروڈکشن، معتدل ٹریفک (<10K یوزرز) |
| **پریمیم** | 80K-150K TPM | 5-10 ریپلیکا، زون ریڈنڈنٹ | پریمیم | GRS (جیو) | انٹرپرائز، زیادہ ٹریفک (>10K یوزرز)، 99.99% SLA |

**قیمت پر اثر:**
- **کم سے کم → اسٹینڈرڈ:** ~4x قیمت میں اضافہ ($100-370/ماہ → $420-1,450/ماہ)
- **اسٹینڈرڈ → پریمیم:** ~3x قیمت میں اضافہ ($420-1,450/ماہ → $1,150-3,500/ماہ)
- **انتخاب کریں بنیاد پر:** متوقع لوڈ، SLA ضروریات، بجٹ کی حدود

**کیپیسٹی پلاننگ:**
- **TPM (ٹوکینز پر منٹ):** تمام ماڈل ڈیپلائمنٹس کے لیے کل
- **کنٹینر انسٹینسز:** آٹو اسکیلنگ رینج (کم سے کم-زیادہ سے زیادہ ریپلیکا)
- **سرچ ٹائر:** کوئری پرفارمنس اور انڈیکس سائز کی حدود پر اثر انداز

## 📋 ضروریات

### مطلوبہ ٹولز
1. **Azure CLI** (ورژن 2.50.0 یا اس سے زیادہ)
   ```bash
   az --version  # ورژن چیک کریں
   az login      # تصدیق کریں
   ```

2. **فعال Azure سبسکرپشن** مالک یا کنٹریبیوٹر رسائی کے ساتھ
   ```bash
   az account show  # رکنیت کی تصدیق کریں
   ```

### مطلوبہ Azure کوٹاز

ڈیپلائمنٹ سے پہلے، اپنے ٹارگٹ ریجنز میں کافی کوٹاز کی تصدیق کریں:

```bash
# اپنے علاقے میں Azure OpenAI کی دستیابی چیک کریں
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus2

# OpenAI کوٹہ کی تصدیق کریں (gpt-4o کی مثال)
az cognitiveservices usage list \
  --location eastus2 \
  --query "[?name.value=='OpenAI.Standard.gpt-4o']"

# کنٹینر ایپس کوٹہ چیک کریں
az provider show \
  --namespace Microsoft.App \
  --query "resourceTypes[?resourceType=='managedEnvironments'].locations"
```

**کم سے کم مطلوبہ کوٹاز:**
- **Azure OpenAI:** 3-4 ماڈل ڈیپلائمنٹس مختلف ریجنز میں
  - GPT-4o: 20K TPM (ٹوکینز پر منٹ)
  - GPT-4o-mini: 10K TPM
  - text-embedding-ada-002: 30K TPM
  - **نوٹ:** GPT-4o کچھ ریجنز میں ویٹ لسٹ پر ہو سکتا ہے - چیک کریں [ماڈل دستیابی](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- **کنٹینر ایپس:** منیجڈ ماحول + 2-10 کنٹینر انسٹینسز
- **AI سرچ:** اسٹینڈرڈ ٹائر (بیسک ویکٹر سرچ کے لیے ناکافی)
- **Cosmos DB:** اسٹینڈرڈ پروویژنڈ تھروپٹ

**اگر کوٹاز ناکافی ہوں:**
1. Azure پورٹل → کوٹاز → اضافہ کی درخواست کریں
2. یا Azure CLI استعمال کریں:
   ```bash
   az support tickets create \
     --ticket-name "OpenAI-Quota-Increase" \
     --severity "minimal" \
     --description "Request quota increase for Azure OpenAI GPT-4o in eastus2"
   ```
3. متبادل ریجنز پر غور کریں جہاں دستیابی ہو

## 🚀 فوری ڈیپلائمنٹ

### آپشن 1: Azure CLI استعمال کرتے ہوئے

```bash
# ٹیمپلیٹ فائلز کو کلون یا ڈاؤنلوڈ کریں
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# ڈپلائمنٹ اسکرپٹ کو قابل عمل بنائیں
chmod +x deploy.sh

# ڈیفالٹ سیٹنگز کے ساتھ ڈپلائی کریں
./deploy.sh -g myResourceGroup

# پروڈکشن کے لیے پریمیم خصوصیات کے ساتھ ڈپلائی کریں
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### آپشن 2: Azure پورٹل استعمال کرتے ہوئے

[![Azure پر ڈیپلائ کریں](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### آپشن 3: Azure CLI براہ راست استعمال کرتے ہوئے

```bash
# وسائل گروپ بنائیں
az group create --name myResourceGroup --location eastus2

# ٹیمپلیٹ تعینات کریں
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⏱️ ڈیپلائمنٹ کا وقت

### کیا توقع کریں

| مرحلہ | دورانیہ | کیا ہوتا ہے |
|-------|----------|--------------||
| **ٹیمپلیٹ کی تصدیق** | 30-60 سیکنڈ | Azure ARM ٹیمپلیٹ کی سنٹیکس اور پیرامیٹرز کی تصدیق کرتا ہے |
| **ریسورس گروپ سیٹ اپ** | 10-20 سیکنڈ | ریسورس گروپ بناتا ہے (اگر ضرورت ہو) |
| **OpenAI پروویژننگ** | 5-8 منٹ | 3-4 OpenAI اکاؤنٹس بناتا ہے اور ماڈلز ڈیپلائ کرتا ہے |
| **کنٹینر ایپس** | 3-5 منٹ | ماحول بناتا ہے اور پلیس ہولڈر کنٹینرز ڈیپلائ کرتا ہے |
| **سرچ اور اسٹوریج** | 2-4 منٹ | AI سرچ سروس اور اسٹوریج اکاؤنٹس پروویژن کرتا ہے |
| **Cosmos DB** | 2-3 منٹ | ڈیٹا بیس بناتا ہے اور کنٹینرز کنفیگر کرتا ہے |
| **مانیٹرنگ سیٹ اپ** | 2-3 منٹ | Application Insights اور لاگ اینالیٹکس سیٹ اپ کرتا ہے |
| **RBAC کنفیگریشن** | 1-2 منٹ | منیجڈ آئیڈینٹیز اور پرمیشنز کنفیگر کرتا ہے |
| **کل ڈیپلائمنٹ** | **15-25 منٹ** | مکمل انفراسٹرکچر تیار |

**ڈیپلائمنٹ کے بعد:**
- ✅ **انفراسٹرکچر تیار:** تمام Azure سروسز پروویژن اور چل رہی ہیں
- ⏱️ **ایپلیکیشن ڈیولپمنٹ:** 80-120 گھنٹے (آپ کی ذمہ داری)
- ⏱️ **انڈیکس کنفیگریشن:** 15-30 منٹ (آپ کی اسکیم کی ضرورت ہے)
- ⏱️ **ڈیٹا اپلوڈ:** ڈیٹا سیٹ کے سائز پر منحصر
- ⏱️ **ٹیسٹنگ اور تصدیق:** 2-4 گھنٹے

---

## ✅ ڈیپلائمنٹ کامیابی کی تصدیق کریں

### مرحلہ 1: ریسورس پروویژننگ چیک کریں (2 منٹ)

```bash
# تمام وسائل کی کامیابی سے تعیناتی کی تصدیق کریں
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

**متوقع:** خالی ٹیبل (تمام ریسورسز "Succeeded" اسٹیٹس دکھائیں)

### مرحلہ 2: Azure OpenAI ڈیپلائمنٹس کی تصدیق کریں (3 منٹ)

```bash
# تمام OpenAI اکاؤنٹس کی فہرست بنائیں
az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'].{Name:name, Location:location, Status:properties.provisioningState}" \
  --output table

# بنیادی علاقے کے لئے ماڈل تعیناتیوں کی جانچ کریں
OPENAI_NAME=$(az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'] | [0].name" -o tsv)

az cognitiveservices account deployment list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --output table
```

**متوقع:** 
- 3-4 OpenAI اکاؤنٹس (پرائمری، سیکنڈری، تیسرے، ایویلیوایشن ریجنز)
- ہر اکاؤنٹ میں 1-2 ماڈل ڈیپلائمنٹس (gpt-4o، gpt-4o-mini، text-embedding-ada-002)

### مرحلہ 3: انفراسٹرکچر اینڈپوائنٹس ٹیسٹ کریں (5 منٹ)

```bash
# کنٹینر ایپ کے URLs حاصل کریں
az containerapp list \
  --resource-group myResourceGroup \
  --query "[].{Name:name, URL:properties.configuration.ingress.fqdn, Status:properties.runningStatus}" \
  --output table

# روٹر اینڈ پوائنٹ کی جانچ کریں (پلیس ہولڈر تصویر جواب دے گی)
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

echo "Testing: https://$ROUTER_URL"
curl -I https://$ROUTER_URL || echo "Container running (placeholder image - expected)"
```

**متوقع:** 
- کنٹینر ایپس "Running" اسٹیٹس دکھائیں
- پلیس ہولڈر nginx HTTP 200 یا 404 کے ساتھ جواب دے (ابھی کوئی ایپلیکیشن کوڈ نہیں)

### مرحلہ 4: Azure OpenAI API ایکسیس کی تصدیق کریں (3 منٹ)

```bash
# اوپن اے آئی اینڈ پوائنٹ اور کلید حاصل کریں
OPENAI_ENDPOINT=$(az cognitiveservices account show \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "properties.endpoint" -o tsv)

OPENAI_KEY=$(az cognitiveservices account keys list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "key1" -o tsv)

# جی پی ٹی-4o تعیناتی کی جانچ کریں
curl "${OPENAI_ENDPOINT}openai/deployments/gpt-4o/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello"}],
    "max_tokens": 10
  }'
```

**متوقع:** JSON جواب چیٹ کمپلیشن کے ساتھ (تصدیق کرتا ہے کہ OpenAI فعال ہے)

### کیا کام کر رہا ہے اور کیا نہیں

**✅ ڈیپلائمنٹ کے بعد کام کر رہا ہے:**
- Azure OpenAI ماڈلز ڈیپلائ اور API کالز قبول کر رہے ہیں
- AI سرچ سروس چل رہی ہے (خالی، ابھی انڈیکس نہیں بنایا گیا)
- کنٹینر ایپس چل رہی ہیں (پلیس ہولڈر nginx امیجز)
- اسٹوریج اکاؤنٹس قابل رسائی اور اپلوڈز کے لیے تیار
- Cosmos DB ڈیٹا آپریشنز کے لیے تیار
- Application Insights انفراسٹرکچر ٹیلیمیٹری جمع کر رہا ہے
- Key Vault رازوں کے لیے تیار

**❌ ابھی کام نہیں کر رہا (ترقی کی ضرورت ہے):**
- ایجنٹ اینڈپوائنٹس (ابھی کوئی ایپلیکیشن کوڈ ڈیپلائ نہیں ہوا)
- چیٹ فنکشنالٹی (فرنٹ اینڈ + بیک اینڈ امپلیمنٹیشن کی ضرورت ہے)
- سرچ کوئریز (ابھی کوئی سرچ انڈیکس نہیں بنایا گیا)
- ڈاکیومنٹ پروسیسنگ پائپ لائن (ابھی کوئی ڈیٹا اپلوڈ نہیں ہوا)
- کسٹم ٹیلیمیٹری (ایپلیکیشن انسٹرومنٹیشن کی ضرورت ہے)

**اگلے مراحل:** دیکھیں [پوسٹ ڈیپلائمنٹ کنفیگریشن](../../../../examples/retail-multiagent-arm-template) اپنی ایپلیکیشن ڈیولپ اور ڈیپلائ کرنے کے لیے

---

## ⚙️ کنفیگریشن آپشنز

### ٹیمپلیٹ پیرامیٹرز

| پیرامیٹر | قسم | ڈیفالٹ | وضاحت |
|-----------|------|---------|-------------|
| `projectName` | string | "retail" | تمام ریسورس ناموں کے لیے پری فکس |
| `location` | string | ریسورس گروپ لوکیشن | پرائمری ڈیپلائمنٹ ریجن |
| `secondaryLocation` | string | "westus2" | ملٹی ریجن ڈیپلائمنٹ کے لیے سیکنڈری ریجن |
| `tertiaryLocation` | string | "francecentral" | ایمبیڈنگز ماڈل کے لیے ریجن |
| `environmentName` | string | "dev" | ماحول کی وضاحت (dev/staging/prod) |
| `deploymentMode` | string | "standard" | ڈیپلائمنٹ کنفیگریشن (کم سے کم/اسٹینڈرڈ/پریمیم) |
| `enableMultiRegion` | bool | true | ملٹی ریجن ڈیپلائمنٹ فعال کریں |
| `enableMonitoring` | bool | true | Application Insights اور لاگنگ فعال کریں |
| `enableSecurity` | bool | true | Key Vault اور بہتر سیکیورٹی فعال کریں |

### پیرامیٹرز کو کسٹمائز کرنا

`azuredeploy.parameters.json` میں ترمیم کریں:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "projectName": {
      "value": "mycompany"
    },
    "environmentName": {
      "value": "prod"
    },
    "deploymentMode": {
      "value": "premium"
    },
    "location": {
      "value": "eastus2"
    }
  }
}
```

## 🏗️ آرکیٹیکچر جائزہ

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Frontend      │    │  Agent Router   │    │     Agents      │
│ (Container App) │───▶│ (Container App) │───▶│ Customer + Inv  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   AI Search     │    │  Azure OpenAI   │    │    Storage      │
│   (Vector DB)   │    │ (Multi-region)  │    │   (Documents)   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│  Cosmos DB      │    │ App Insights    │    │   Key Vault     │
│ (Chat History)  │    │  (Monitoring)   │    │   (Secrets)     │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

## 📖 ڈیپلائمنٹ اسکرپٹ کا استعمال

`deploy.sh` اسکرپٹ ایک انٹرایکٹو ڈیپلائمنٹ تجربہ فراہم کرتا ہے:

```bash
# مدد دکھائیں
./deploy.sh --help

# بنیادی تعیناتی
./deploy.sh -g myResourceGroup

# حسب ضرورت ترتیبات کے ساتھ اعلی درجے کی تعیناتی
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# بغیر کثیر علاقائی ترقیاتی تعیناتی
./deploy.sh \
  -g myDevRG \
  -e dev \
  -m minimal \
  --no-multi-region \
  --no-security
```

### اسکرپٹ کی خصوصیات

- ✅ **ضروریات کی تصدیق** (Azure CLI، لاگ ان اسٹیٹس، ٹیمپلیٹ فائلز)
- ✅ **ریسورس گروپ مینجمنٹ** (بناتا ہے اگر موجود نہ ہو)
- ✅ **ٹیمپلیٹ کی تصدیق** ڈیپل
> **📝 اہم:** انفراسٹرکچر تعینات ہو چکا ہے، لیکن آپ کو ایپلیکیشن کوڈ تیار اور تعینات کرنا ہوگا۔

### مرحلہ 1: ایجنٹ ایپلیکیشنز تیار کریں (آپ کی ذمہ داری)

ARM ٹیمپلیٹ **خالی کنٹینر ایپس** بناتا ہے جن میں پلیس ہولڈر nginx امیجز ہوتی ہیں۔ آپ کو درج ذیل کام کرنے ہوں گے:

**ضروری ترقی:**
1. **ایجنٹ کی عمل درآمد** (30-40 گھنٹے)
   - کسٹمر سروس ایجنٹ کے ساتھ GPT-4o انٹیگریشن
   - انوینٹری ایجنٹ کے ساتھ GPT-4o-mini انٹیگریشن
   - ایجنٹ روٹنگ لاجک

2. **فرنٹ اینڈ ڈویلپمنٹ** (20-30 گھنٹے)
   - چیٹ انٹرفیس UI (React/Vue/Angular)
   - فائل اپلوڈ کی فعالیت
   - جواب کی رینڈرنگ اور فارمیٹنگ

3. **بیک اینڈ سروسز** (12-16 گھنٹے)
   - FastAPI یا Express روٹر
   - تصدیق کے لیے مڈل ویئر
   - ٹیلیمیٹری انٹیگریشن

**دیکھیں:** [آرکیٹیکچر گائیڈ](../retail-scenario.md) تفصیلی عمل درآمد کے نمونوں اور کوڈ کی مثالوں کے لیے

### مرحلہ 2: AI سرچ انڈیکس کو ترتیب دیں (15-30 منٹ)

اپنے ڈیٹا ماڈل سے میل کھانے والا سرچ انڈیکس بنائیں:

```bash
# تلاش کی خدمت کی تفصیلات حاصل کریں
SEARCH_NAME=$(az search service list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

SEARCH_KEY=$(az search admin-key show \
  --service-name $SEARCH_NAME \
  --resource-group myResourceGroup \
  --query "primaryKey" -o tsv)

# اپنی اسکیمہ کے ساتھ انڈیکس بنائیں (مثال)
curl -X POST "https://${SEARCH_NAME}.search.windows.net/indexes?api-version=2023-11-01" \
  -H "Content-Type: application/json" \
  -H "api-key: ${SEARCH_KEY}" \
  -d '{
    "name": "products",
    "fields": [
      {"name": "id", "type": "Edm.String", "key": true},
      {"name": "title", "type": "Edm.String", "searchable": true},
      {"name": "content", "type": "Edm.String", "searchable": true},
      {"name": "category", "type": "Edm.String", "filterable": true},
      {"name": "content_vector", "type": "Collection(Edm.Single)", 
       "searchable": true, "dimensions": 1536, "vectorSearchProfile": "default"}
    ],
    "vectorSearch": {
      "algorithms": [{"name": "default", "kind": "hnsw"}],
      "profiles": [{"name": "default", "algorithm": "default"}]
    }
  }'
```

**وسائل:**
- [AI سرچ انڈیکس اسکیمہ ڈیزائن](https://learn.microsoft.com/azure/search/search-what-is-an-index)
- [وییکٹر سرچ کنفیگریشن](https://learn.microsoft.com/azure/search/vector-search-how-to-create-index)

### مرحلہ 3: اپنا ڈیٹا اپلوڈ کریں (وقت مختلف ہو سکتا ہے)

جب آپ کے پاس پروڈکٹ ڈیٹا اور دستاویزات ہوں:

```bash
# اسٹوریج اکاؤنٹ کی تفصیلات حاصل کریں
STORAGE_NAME=$(az storage account list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

STORAGE_KEY=$(az storage account keys list \
  --account-name $STORAGE_NAME \
  --resource-group myResourceGroup \
  --query "[0].value" -o tsv)

# اپنے دستاویزات اپ لوڈ کریں
az storage blob upload-batch \
  --destination documents \
  --source /path/to/your/product/docs \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY

# مثال: ایک فائل اپ لوڈ کریں
az storage blob upload \
  --container-name documents \
  --name "product-manual.pdf" \
  --file /path/to/product-manual.pdf \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY
```

### مرحلہ 4: اپنی ایپلیکیشنز بنائیں اور تعینات کریں (8-12 گھنٹے)

جب آپ نے اپنے ایجنٹ کوڈ تیار کر لیا ہو:

```bash
# 1. اگر ضرورت ہو تو Azure Container Registry بنائیں
az acr create \
  --name myregistry \
  --resource-group myResourceGroup \
  --sku Basic

# 2. ایجنٹ روٹر امیج بنائیں اور پش کریں
docker build -t myregistry.azurecr.io/agent-router:v1 /path/to/your/router/code
az acr login --name myregistry
docker push myregistry.azurecr.io/agent-router:v1

# 3. فرنٹ اینڈ امیج بنائیں اور پش کریں
docker build -t myregistry.azurecr.io/frontend:v1 /path/to/your/frontend/code
docker push myregistry.azurecr.io/frontend:v1

# 4. اپنے امیجز کے ساتھ کنٹینر ایپس کو اپ ڈیٹ کریں
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:v1

az containerapp update \
  --name retail-frontend \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/frontend:v1

# 5. ماحول کے متغیرات کو ترتیب دیں
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --set-env-vars \
    OPENAI_ENDPOINT=secretref:openai-endpoint \
    OPENAI_KEY=secretref:openai-key \
    SEARCH_ENDPOINT=secretref:search-endpoint \
    SEARCH_KEY=secretref:search-key
```

### مرحلہ 5: اپنی ایپلیکیشن کی جانچ کریں (2-4 گھنٹے)

```bash
# اپنی درخواست کا URL حاصل کریں
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

# ایجنٹ کے اختتامی نقطہ کو آزمائیں (جب آپ کا کوڈ تعینات ہو جائے)
curl -X POST "https://${ROUTER_URL}/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'

# درخواست کے لاگز چیک کریں
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow
```

### عمل درآمد کے وسائل

**آرکیٹیکچر اور ڈیزائن:**
- 📖 [مکمل آرکیٹیکچر گائیڈ](../retail-scenario.md) - تفصیلی عمل درآمد کے نمونے
- 📖 [ملٹی ایجنٹ ڈیزائن پیٹرنز](https://learn.microsoft.com/azure/architecture/ai-ml/guide/multi-agent-systems)

**کوڈ کی مثالیں:**
- 🔗 [Azure OpenAI چیٹ سیمپل](https://github.com/Azure-Samples/azure-search-openai-demo) - RAG پیٹرن
- 🔗 [سیمینٹک کرنل](https://github.com/microsoft/semantic-kernel) - ایجنٹ فریم ورک (C#)
- 🔗 [LangChain Azure](https://github.com/langchain-ai/langchain) - ایجنٹ آرکیسٹریشن (Python)
- 🔗 [AutoGen](https://github.com/microsoft/autogen) - ملٹی ایجنٹ گفتگو

**کل تخمینی وقت:**
- انفراسٹرکچر کی تعیناتی: 15-25 منٹ (✅ مکمل)
- ایپلیکیشن کی ترقی: 80-120 گھنٹے (🔨 آپ کا کام)
- جانچ اور اصلاح: 15-25 گھنٹے (🔨 آپ کا کام)

## 🛠️ خرابیوں کا ازالہ

### عام مسائل

#### 1. Azure OpenAI کوٹہ ختم ہو گیا

```bash
# موجودہ کوٹہ استعمال کی جانچ کریں
az cognitiveservices usage list --location eastus2

# کوٹہ بڑھانے کی درخواست کریں
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. کنٹینر ایپس کی تعیناتی ناکام ہو گئی

```bash
# کنٹینر ایپ کے لاگز چیک کریں
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# کنٹینر ایپ کو دوبارہ شروع کریں
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. سرچ سروس کی شروعات

```bash
# تلاش کی خدمت کی حیثیت کی تصدیق کریں
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# تلاش کی خدمت کی رابطے کی جانچ کریں
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### تعیناتی کی توثیق

```bash
# تصدیق کریں کہ تمام وسائل تخلیق کیے گئے ہیں
az resource list \
  --resource-group myResourceGroup \
  --output table

# وسائل کی صحت چیک کریں
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 سیکیورٹی کے تحفظات

### کلیدی انتظام
- تمام راز Azure Key Vault میں محفوظ کیے گئے ہیں (جب فعال ہو)
- کنٹینر ایپس تصدیق کے لیے منیجڈ شناخت استعمال کرتی ہیں
- اسٹوریج اکاؤنٹس میں محفوظ ڈیفالٹس ہیں (صرف HTTPS، کوئی عوامی blob رسائی نہیں)

### نیٹ ورک سیکیورٹی
- کنٹینر ایپس ممکنہ حد تک اندرونی نیٹ ورکنگ استعمال کرتی ہیں
- سرچ سروس پرائیویٹ اینڈ پوائنٹس آپشن کے ساتھ ترتیب دی گئی ہے
- Cosmos DB کم سے کم ضروری اجازتوں کے ساتھ ترتیب دیا گیا ہے

### RBAC کنفیگریشن
```bash
# منظم شناخت کے لئے ضروری کردار تفویض کریں
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 لاگت کی اصلاح

### لاگت کے تخمینے (ماہانہ، USD)

| موڈ | OpenAI | کنٹینر ایپس | سرچ | اسٹوریج | کل تخمینہ |
|------|--------|----------------|--------|---------|------------|
| کم سے کم | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| معیاری | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| پریمیم | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### لاگت کی نگرانی

```bash
# بجٹ الرٹس ترتیب دیں
az consumption budget create \
  --account-name <subscription-id> \
  --budget-name "retail-budget" \
  --amount 500 \
  --time-grain Monthly \
  --start-date 2024-01-01 \
  --end-date 2024-12-31
```

## 🔄 اپ ڈیٹس اور دیکھ بھال

### ٹیمپلیٹ اپ ڈیٹس
- ARM ٹیمپلیٹ فائلز کو ورژن کنٹرول کریں
- پہلے ترقیاتی ماحول میں تبدیلیوں کی جانچ کریں
- اپ ڈیٹس کے لیے انکریمنٹل تعیناتی موڈ استعمال کریں

### وسائل کی اپ ڈیٹس
```bash
# نئے پیرامیٹرز کے ساتھ اپ ڈیٹ کریں
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### بیک اپ اور ریکوری
- Cosmos DB خودکار بیک اپ فعال ہے
- Key Vault سافٹ ڈیلیٹ فعال ہے
- کنٹینر ایپ ریویژنز رول بیک کے لیے برقرار رکھی گئی ہیں

## 📞 سپورٹ

- **ٹیمپلیٹ کے مسائل:** [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Azure سپورٹ:** [Azure Support Portal](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **کمیونٹی:** [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ کیا آپ اپنی ملٹی ایجنٹ سلوشن تعینات کرنے کے لیے تیار ہیں؟**

شروع کریں: `./deploy.sh -g myResourceGroup`

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**اعلانِ لاتعلقی**:  
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کا استعمال کرتے ہوئے ترجمہ کی گئی ہے۔ ہم درستگی کے لیے کوشش کرتے ہیں، لیکن براہ کرم آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا غیر درستیاں ہو سکتی ہیں۔ اصل دستاویز کو اس کی اصل زبان میں مستند ذریعہ سمجھا جانا چاہیے۔ اہم معلومات کے لیے، پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ ہم اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کے ذمہ دار نہیں ہیں۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->