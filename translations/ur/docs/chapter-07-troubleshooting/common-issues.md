# عام مسائل اور حل

**باب نیویگیشن:**
- **📚 کورس ہوم**: [AZD For Beginners](../../README.md)
- **📖 موجودہ باب**: باب 7 - مسائل کا حل اور خرابی دور کرنا
- **⬅️ پچھلا باب**: [باب 6: پری فلائٹ چیکس](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ اگلا**: [خرابی دور کرنے کی رہنمائی](debugging.md)
- **🚀 اگلا باب**: [باب 8: پروڈکشن اور انٹرپرائز پیٹرنز](../chapter-08-production/production-ai-practices.md)

## تعارف

یہ جامع مسئلہ حل کرنے کی رہنمائی Azure Developer CLI کے استعمال میں سب سے زیادہ پیش آنے والے مسائل کا احاطہ کرتی ہے۔ توثیق، تعیناتی، انفراسٹرکچر کی فراہمی، اور ایپلیکیشن کی ترتیب میں عام مسائل کی تشخیص، حل اور درستگی سیکھیں۔ ہر مسئلے میں تفصیلی علامات، بنیادی وجوہات، اور مرحلہ وار حل کے طریقہ کار شامل ہیں۔

## سیکھنے کے مقاصد

اس رہنمائی کو مکمل کرکے آپ:
- Azure Developer CLI کے مسائل کی تشخیصی تکنیکوں میں مہارت حاصل کریں گے۔
- عام تصدیق اور اجازت کے مسائل اور ان کے حل کو سمجھیں گے۔
- تعیناتی کی ناکامیوں، انفراسٹرکچر کی فراہمی کی غلطیوں، اور ترتیب کے مسائل کو حل کریں گے۔
- پیشگی نگرانی اور خرابی دور کرنے کی حکمت عملی نافذ کریں گے۔
- پیچیدہ مسائل کے لیے منظم مسئلہ حل کرنے کے طریقے اپنائیں گے۔
- مستقبل کے مسائل کی روک تھام کے لیے مناسب لاگنگ اور نگرانی مرتب کریں گے۔

## سیکھنے کے نتائج

مکمل کرنے پر، آپ قابل ہوں گے کہ:
- اندر موجود تشخیصی ٹولز کے ذریعے Azure Developer CLI کے مسائل کی تشخیص کریں۔
- خود مختار طریقے سے توثیق، سبسکرپشن، اور اجازت سے متعلق مسائل کو حل کریں۔
- تعیناتی کی ناکامیوں اور انفراسٹرکچر کی فراہمی کی غلطیوں کو مؤثر طریقے سے ٹھیک کریں۔
- ایپلیکیشن کی ترتیب کے مسائل اور مخصوص ماحول کے مسائل کی خرابی دور کریں۔
- ممکنہ مسائل کو پیشگی شناخت کرنے کے لیے نگرانی اور الرٹنگ نافذ کریں۔
- لاگنگ، خرابی دور کرنے، اور مسئلہ حل کرنے کے ورک فلو کے لیے بہترین مشقیں اپنائیں۔

## فوری تشخیص

مخصوص مسائل میں غوطہ لگانے سے پہلے، تشخیصی معلومات جمع کرنے کے لیے یہ کمانڈز چلائیں:

```bash
# ایزد ورژن اور صحت چیک کریں
azd version
azd config show

# ایژر توثیق کی تصدیق کریں
az account show
az account list

# موجودہ ماحول چیک کریں
azd env list
azd env get-values

# ڈیبگ لاگنگ کو فعال کریں
export AZD_DEBUG=true
azd <command> --debug
```

## تصدیقی مسائل

### مسئلہ: "ایکسس ٹوکن حاصل کرنے میں ناکامی"
**علامات:**
- `azd up` تصدیقی غلطیوں کے ساتھ ناکام ہو جاتا ہے
- کمانڈز "unauthorized" یا "access denied" واپس کرتی ہیں

**حل:**
```bash
# 1۔ ازور CLI کے ساتھ دوبارہ تصدیق کریں
az login
az account show

# 2۔ کیش شدہ اسناد کو صاف کریں
az account clear
az login

# 3۔ ڈیوائس کوڈ فلو استعمال کریں (ہیڈلیس سسٹمز کے لیے)
az login --use-device-code

# 4۔ واضح سبسکرپشن سیٹ کریں
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### مسئلہ: تعیناتی کے دوران "ناکافی مراعات"
**علامات:**
- تعیناتی اجازت کی غلطیوں کے ساتھ ناکام ہو جاتی ہے
- بعض Azure وسائل تخلیق نہیں کر سکتا

**حل:**
```bash
# 1. اپنے Azure کردار کے اسائنمنٹس چیک کریں
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. یقینی بنائیں کہ آپ کے پاس مطلوبہ کردار ہیں
# - کنٹریبیوٹر (وسائل کے تخلیق کے لیے)
# - یوزر ایکسس ایڈمنسٹریٹر (کردار کے اسائنمنٹس کے لیے)

# 3. مناسب اجازتوں کے لیے اپنے Azure ایڈمنسٹریٹر سے رابطہ کریں
```

### مسئلہ: کثیرالمہمان توثیق کے مسائل
**حل:**
```bash
# 1. مخصوص کرایہ دار کے ساتھ لاگ ان کریں
az login --tenant "your-tenant-id"

# 2. ترتیب میں کرایہ دار سیٹ کریں
azd config set auth.tenantId "your-tenant-id"

# 3. اگر کرایہ دار تبدیل کر رہے ہیں تو کرایہ دار کیش صاف کریں
az account clear
```

## 🏗️ انفراسٹرکچر فراہمی کی غلطیاں

### مسئلہ: وسائل کے ناموں کا تصادم
**علامات:**
- "وسائل کا نام پہلے سے موجود ہے" کی غلطیاں
- وسائل کی تخلیق کے دوران تعیناتی ناکام ہو جاتی ہے

**حل:**
```bash
# 1. منفرد وسائل کے ناموں میں ٹوکن استعمال کریں
# اپنے بائسِپ ٹیمپلیٹ میں:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. ماحولیاتی نام تبدیل کریں
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. موجودہ وسائل کو صاف کریں
azd down --force --purge
```

### مسئلہ: مقام/علاقہ دستیاب نہیں
**علامات:**
- "وسائل کی قسم کے لیے 'xyz' مقام دستیاب نہیں"
- منتخب شدہ علاقہ میں بعض SKUs دستیاب نہیں

**حل:**
```bash
# 1. وسائل کی اقسام کے لیے دستیاب مقامات چیک کریں
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. عام طور پر دستیاب علاقوں کا استعمال کریں
azd config set defaults.location eastus2
# یا
azd env set AZURE_LOCATION eastus2

# 3. خطے کے لحاظ سے سروس کی دستیابی چیک کریں
# ملاحظہ کریں: https://azure.microsoft.com/global-infrastructure/services/
```

### مسئلہ: کوٹہ تجاوز کی غلطیاں
**علامات:**
- "وسائل کی قسم کے لیے کوٹہ حد سے زیادہ"
- "وسائل کی زیادہ سے زیادہ تعداد پہنچ گئی ہے"

**حل:**
```bash
# 1۔ موجودہ کوٹا استعمال چیک کریں
az vm list-usage --location eastus2 -o table

# 2۔ ایزور پورٹل کے ذریعے کوٹا میں اضافہ کی درخواست کریں
# جائیں: سبسکرپشنز > استعمال + کوٹے

# 3۔ ترقی کے لیے چھوٹے SKUs استعمال کریں
# main.parameters.json میں:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4۔ غیر استعمال شدہ وسائل کو صاف کریں
az resource list --query "[?contains(name, 'unused')]" -o table
```

### مسئلہ: بائیسپ ٹیمپلیٹ غلطیاں
**علامات:**
- ٹیمپلیٹ کی توثیق ناکامیاں
- بائیسپ فائلوں میں نحو کی غلطیاں

**حل:**
```bash
# 1۔ بیسپ زبان کی صحت کی جانچ کریں
az bicep build --file infra/main.bicep

# 2۔ بیسپ لنٹر استعمال کریں
az bicep lint --file infra/main.bicep

# 3۔ پیرامیٹر فائل کی زبان کی جانچ کریں
cat infra/main.parameters.json | jq '.'

# 4۔ تعیناتی کی تبدیلیوں کا پیش نظارہ کریں
azd provision --preview
```

## 🚀 تعیناتی کی ناکامیاں

### مسئلہ: بلڈ کی ناکامیاں
**علامات:**
- تعیناتی کے دوران ایپلیکیشن بلڈ نہیں ہوتی
- پیکیج انسٹالیشن کی غلطیاں

**حل:**
```bash
# 1. ڈیبگ فلیگ کے ساتھ بلڈ آؤٹ پٹ چیک کریں
azd deploy --service web --debug

# 2. تعینات شدہ سروس کی حالت دیکھیں
azd show

# 3. بلڈ کو مقامی طور پر ٹیسٹ کریں
cd src/web
npm install
npm run build

# 3. Node.js/Python ورژن کی مطابقت چیک کریں
node --version  # azure.yaml کی ترتیبات سے میل کھانی چاہیے
python --version

# 4. بلڈ کیشے صاف کریں
rm -rf node_modules package-lock.json
npm install

# 5. اگر کنٹینرز استعمال کر رہے ہیں تو Dockerfile چیک کریں
docker build -t test-image .
docker run --rm test-image
```

### مسئلہ: کنٹینر تعیناتی کی ناکامیاں
**علامات:**
- کنٹینر ایپس شروع نہیں ہو رہیں
- تصویر کی پلنگ کی غلطیاں

**حل:**
```bash
# 1۔ لوکل سطح پر ڈوکر کی تعمیر کا تجربہ کریں
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2۔ Azure CLI کا استعمال کرتے ہوئے کنٹینر لاگز چیک کریں
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3۔ azd کے ذریعے ایپلیکیشن کی نگرانی کریں
azd monitor --logs

# 3۔ کنٹینر ریجسٹری کی رسائی کی تصدیق کریں
az acr login --name myregistry

# 4۔ کنٹینر ایپ کی ترتیب چیک کریں
az containerapp show --name my-app --resource-group my-rg
```

### مسئلہ: ڈیٹا بیس کنکشن کی ناکامیاں
**علامات:**
- ایپلیکیشن ڈیٹا بیس سے کنکٹ نہیں ہو پا رہا
- کنکشن ٹائم آؤٹ کی غلطیاں

**حل:**
```bash
# 1. ڈیٹا بیس فائر وال کے قواعد چیک کریں
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. ایپلیکیشن سے کنیکٹیویٹی کی جانچ کریں
# عارضی طور پر اپنی ایپ میں شامل کریں:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. کنکشن اسٹرنگ کے فارمیٹ کی تصدیق کریں
azd env get-values | grep DATABASE

# 4. ڈیٹا بیس سرور کی حالت چیک کریں
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 ترتیب کے مسائل

### مسئلہ: ماحول کے متغیرات کام نہیں کر رہے
**علامات:**
- ایپ ترتیب کے اقدار پڑھ نہیں پا رہی
- ماحول کے متغیرات خالی دکھائی دیتے ہیں

**حل:**
```bash
# 1. ماحول کے متغیرات کی تصدیق کریں کہ وہ سیٹ ہیں
azd env get-values
azd env get DATABASE_URL

# 2. azure.yaml میں متغیرات کے نام چیک کریں
cat azure.yaml | grep -A 5 env:

# 3. ایپلیکیشن کو دوبارہ شروع کریں
azd deploy --service web

# 4. ایپ سروس کی ترتیب چیک کریں
az webapp config appsettings list --name myapp --resource-group myrg
```

### مسئلہ: SSL/TLS سرٹیفکیٹ کے مسائل
**علامات:**
- HTTPS کام نہیں کر رہا
- سرٹیفکیٹ کی توثیق کی غلطیاں

**حل:**
```bash
# 1. ایس ایس ایل سرٹیفکیٹ کی حیثیت چیک کریں
az webapp config ssl list --resource-group myrg

# 2. صرف HTTPS کو فعال کریں
az webapp update --name myapp --resource-group myrg --https-only true

# 3. حسب ضرورت ڈومین شامل کریں (اگر ضرورت ہو)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### مسئلہ: CORS ترتیب کے مسائل
**علامات:**
- فرنٹ اینڈ API کال نہیں کر پا رہا
- کراس اوریجن ریکویسٹ بلاک ہو گئی

**حل:**
```bash
# 1۔ ایپ سروس کے لیے CORS ترتیب دیں
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2۔ CORS کو سنبھالنے کے لیے API کو تازہ کریں
# Express.js میں:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3۔ چیک کریں کہ درست URLs پر چل رہا ہے یا نہیں
azd show
```

## 🌍 ماحول کے انتظام کے مسائل

### مسئلہ: ماحول سوئچ کرنے کے مسائل
**علامات:**
- غلط ماحول استعمال ہو رہا ہے
- ترتیب صحیح طرح سوئچ نہیں ہو رہی

**حل:**
```bash
# ۱۔ تمام ماحول کی فہرست بنائیں
azd env list

# ۲۔ ماحول کو واضح طور پر منتخب کریں
azd env select production

# ۳۔ موجودہ ماحول کی تصدیق کریں
azd env list

# ۴۔ اگر ماحول خراب ہو تو نیا ماحول بنائیں
azd env new production-new
azd env select production-new
```

### مسئلہ: ماحول کی خرابی
**علامات:**
- ماحول غیر درست حالت دکھا رہا ہے
- وسائل ترتیب سے میل نہیں کھاتے

**حل:**
```bash
# 1. ماحول کی حالت کو تازہ کریں
azd env refresh

# 2. ماحول کی ترتیب کو ری سیٹ کریں
azd env new production-reset
# مطلوبہ ماحول کی متغیرات کو کاپی کریں
azd env set DATABASE_URL "your-value"

# 3. موجودہ وسائل کو درآمد کریں (اگر ممکن ہو)
# وسائل کے شناختی نمبروں کے ساتھ .azure/production/config.json کو دستی طور پر اپ ڈیٹ کریں
```

## 🔍 کارکردگی کے مسائل

### مسئلہ: تعیناتی کا وقت بہت سست
**علامات:**
- تعیناتیاں بہت زیادہ وقت لے رہی ہیں
- تعیناتی کے دوران ٹائم آؤٹ ہو رہا ہے

**حل:**
```bash
# 1. تیز تکرار کے لیے مخصوص سروسز تعینات کریں
azd deploy --service web
azd deploy --service api

# 2. جب انفراسٹرکچر تبدیل نہ ہوا ہو تو صرف کوڈ کی تعیناتی کریں
azd deploy  # azd up سے تیز

# 3. بلڈ کے عمل کو بہتر بنائیں
# package.json میں:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. وسائل کی جگہیں چیک کریں (اسی خطہ کا استعمال کریں)
azd config set defaults.location eastus2
```

### مسئلہ: ایپلیکیشن کی کارکردگی کے مسائل
**علامات:**
- جواب دینے میں تاخیر
- وسائل کا زیادہ استعمال

**حل:**
```bash
# 1. وسائل کو بڑھائیں
# مین.parameters.json میں SKU کو اپ ڈیٹ کریں:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. ایپلیکیشن انسائٹس مانیٹرنگ کو فعال کریں
azd monitor --overview

# 3. ایزور میں ایپلیکیشن لاگز چیک کریں
az webapp log tail --name myapp --resource-group myrg
# یا کنٹینر ایپس کے لیے:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. کیشنگ نافذ کریں
# اپنی انفراسٹرکچر میں ریڈیس کیش شامل کریں
```

## 🛠️ مسئلہ حل کرنے کے ٹولز اور کمانڈز

### خرابی دور کرنے والی کمانڈز
```bash
# جامع ڈیبگنگ
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# ازڈ ورژن چیک کریں
azd version

# موجودہ ترتیب دیکھیں
azd config show

# کنیکٹیویٹی ٹیسٹ کریں
curl -v https://myapp.azurewebsites.net/health
```

### لاگ تجزیہ
```bash
# لاگز ایپلیکیشن کے ذریعے Azure CLI
az webapp log tail --name myapp --resource-group myrg

# ایپلیکیشن کی نگرانی azd کے ساتھ
azd monitor --logs
azd monitor --live

# Azure وسائل کے لاگز
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# کنٹینر کے لاگز (کنٹینر ایپس کے لیے)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### وسائل کی تحقیق
```bash
# تمام وسائل کی فہرست بنائیں
az resource list --resource-group myrg -o table

# وسائل کی حالت چیک کریں
az webapp show --name myapp --resource-group myrg --query state

# نیٹ ورک تشخیص
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 اضافی مدد حاصل کرنا

### کب بڑھانا چاہیے
- تمام حل آزمانے کے بعد تصدیقی مسائل برقرار ہوں
- Azure سروسز کے انفراسٹرکچر کے مسائل
- بلنگ یا سبسکرپشن سے متعلق مسائل
- سلامتی کے خدشات یا واقعات

### سپورٹ چینلز
```bash
# 1. ایزور سروس ہیلتھ چیک کریں
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. ایزور سپورٹ ٹکٹ بنائیں
# پر جائیں: https://portal.azure.com -> مدد + سپورٹ

# 3. کمیونٹی وسائل
# - اسٹیک اوور فلو: azure-developer-cli ٹیگ
# - گٹ ہب ایشوز: https://github.com/Azure/azure-dev/issues
# - مائیکروسافٹ سوال و جواب: https://learn.microsoft.com/en-us/answers/
```

### جمع کرنے کے لیے معلومات
سپورٹ سے رابطہ کرنے سے پہلے، جمع کریں:
- `azd version` آؤٹ پٹ
- `azd config show` آؤٹ پٹ
- `azd show` آؤٹ پٹ (موجودہ تعیناتی کی حالت)
- غلطی کے پیغامات (مکمل متن)
- مسئلہ دوبارہ پیدا کرنے کے اقدامات
- ماحول کی تفصیلات (`azd env get-values`)
- مسئلہ کب شروع ہوا کا ٹائم لائن

### لاگ جمع کرنے کا اسکرپٹ
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config show >> debug-logs/config.txt
azd env list >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 مسئلے کی روک تھام

### پری-ڈپلائمنٹ چیک لسٹ
```bash
# 1۔ توثیق کی تصدیق کریں
az account show

# 2۔ کوٹے اور حدود چیک کریں
az vm list-usage --location eastus2

# 3۔ سانچے کی تصدیق کریں
az bicep build --file infra/main.bicep

# 4۔ پہلے مقامی طور پر ٹیسٹ کریں
npm run build
npm run test

# 5۔ خشک-چلانے کی تعیناتی استعمال کریں
azd provision --preview
```

### نگرانی کا سیٹ اپ
```bash
# ایپلیکیشن انسائٹس کو فعال کریں
# main.bicep میں شامل کریں:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# انتباہات مرتب کریں
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### باقاعدہ دیکھ بھال
```bash
# ہفتہ وار صحت کے معائنے
./scripts/health-check.sh

# ماہانہ لاگت کا جائزہ
az consumption usage list --billing-period-name 202401

# سہ ماہی سیکیورٹی کا جائزہ
az security assessment list --resource-group myrg
```

## متعلقہ وسائل

- [خرابی دور کرنے کی رہنمائی](debugging.md) - پیچیدہ خرابی دور کرنے کی تکنیکیں
- [وسائل کی فراہمی](../chapter-04-infrastructure/provisioning.md) - انفراسٹرکچر کے مسائل کا حل
- [صلاحیت کی منصوبہ بندی](../chapter-06-pre-deployment/capacity-planning.md) - وسائل کی منصوبہ بندی کی رہنمائی
- [SKU کا انتخاب](../chapter-06-pre-deployment/sku-selection.md) - سروس کی سطح کی سفارشات

---

**مشورہ**: اس رہنمائی کو نشان زد کر کے رکھیں اور جب بھی مسائل کا سامنا ہو اس کا حوالہ دیں۔ زیادہ تر مسائل پہلے دیکھے جا چکے ہیں اور ان کے حل موجود ہیں!

---

**نیویگیشن**
- **پچھلا سبق**: [وسائل کی فراہمی](../chapter-04-infrastructure/provisioning.md)
- **اگلا سبق**: [خرابی دور کرنے کی رہنمائی](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**دفعِ ذمہ داری**:  
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے ترجمہ کی گئی ہے۔ اگرچہ ہم درستگی کے لیے کوشاں ہیں، براہ کرم آگاہ رہیں کہ خودکار تراجم میں غلطیاں یا عدم صحت ہو سکتی ہے۔ اصل دستاویز اپنی مادری زبان میں مستند ماخذ سمجھی جانی چاہیے۔ اہم معلومات کے لیے، پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کی ذمہ داری ہم پر عائد نہیں ہوتی۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->