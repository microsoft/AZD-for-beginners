# کمانڈ چیٹ شیٹ - ضروری AZD کمانڈز

**تمام ابواب کے لیے فوری حوالہ**
- **📚 کورس ہوم**: [AZD For Beginners](../README.md)
- **📖 فوری آغاز**: [باب 1: بنیاد اور فوری آغاز](../README.md#-chapter-1-foundation--quick-start)
- **🤖 اے آئی کمانڈز**: [باب 2: AI-فرسٹ ڈویلپمنٹ](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 جدید**: [باب 4: انفراسٹرکچر ایز کوڈ](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## تعارف

یہ جامع چیٹ شیٹ سب سے زیادہ استعمال ہونے والے Azure Developer CLI کمانڈز کا فوری حوالہ فراہم کرتی ہے، جو زمرہ جات کے لحاظ سے منظم ہے اور عملی مثالوں کے ساتھ ہے۔ azd پروجیکٹس کے ساتھ ترقی، مسائل کو حل کرنے، اور روزانہ کے کاموں کے دوران تیزی سے دیکھنے کے لیے بہترین ہے۔

## سیکھنے کے مقاصد

اس چیٹ شیٹ کو استعمال کرتے ہوئے، آپ:
- Azure Developer CLI کے ضروری کمانڈز اور نحو تک فوری رسائی حاصل کریں گے
- کمانڈ کی تنظیم کو فنکشنل زمرہ جات اور استعمال کی صورتوں کے مطابق سمجھیں گے
- عام ترقی اور تعیناتی کے مناظر کے لیے عملی مثالوں کا حوالہ دیں گے
- مسائل کے تیز حل کے لیے تشخیصی کمانڈز تک رسائی حاصل کریں گے
- جدید ترتیب اور تخصیص کے اختیارات کو مؤثر طریقے سے تلاش کریں گے
- ماحولیات کے انتظام اور کثیر ماحولیات ورک فلو کمانڈز تلاش کریں گے

## سیکھنے کے نتائج

اس چیٹ شیٹ کا باقاعدگی سے حوالہ دے کر آپ:
- ازد کمانڈز کو پورے دستاویزات کا حوالہ دیے بغیر اعتماد سے چلا سکیں گے
- مناسب تشخیصی کمانڈز استعمال کرکے عام مسائل کو جلد حل کر سکیں گے
- متعدد ماحولیات اور تعیناتی کے مناظر کا مؤثر انتظام کر سکیں گے
- ضروری ہونے پر ازد کی جدید خصوصیات اور ترتیب کے اختیارات لاگو کر سکیں گے
- تعیناتی کے مسائل کی تشخیص کو منظم کمانڈ سلسلوں کے ذریعے انجام دے سکیں گے
- ازد شارٹ کٹ اور اختیارات کے مؤثر استعمال کے ذریعے ورک فلو کو بہتر بنا سکیں گے

## شروعاتی کمانڈز

### تصدیق
```bash
# Azure میں AZD کے ذریعے لاگ ان کریں
azd auth login

# Azure CLI میں لاگ ان کریں (AZD اندرونی طور پر اسے استعمال کرتا ہے)
az login

# موجودہ اکاؤنٹ چیک کریں
az account show

# ڈیفالٹ سبسکرپشن سیٹ کریں
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# AZD سے لاگ آؤٹ کریں
azd auth logout

# Azure CLI سے لاگ آؤٹ کریں
az logout
```

### پروجیکٹ کی ابتدا
```bash
# دستیاب ٹیمپلیٹس ملاحظہ کریں
azd template list

# ٹیمپلیٹ سے آغاز کریں
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# موجودہ ڈائریکٹری میں آغاز کریں
azd init .

# حسبِ منشا نام کے ساتھ آغاز کریں
azd init --template todo-nodejs-mongo my-awesome-app
```

## بنیادی تعیناتی کمانڈز

### مکمل تعیناتی ورک فلو
```bash
# سب کچھ تعینات کریں (فراہم کرنا + تعینات کرنا)
azd up

# تصدیقی پوچھ گچھ کو غیر فعال کر کے تعینات کریں
azd up --confirm-with-no-prompt

# مخصوص ماحول میں تعینات کریں
azd up --environment production

# حسب ضرورت پیرامیٹرز کے ساتھ تعینات کریں
azd up --parameter location=westus2
```

### صرف انفراسٹرکچر
```bash
# ایزور وسائل فراہم کریں
azd provision

# 🧪 انفراسٹرکچر میں تبدیلیوں کا پیش نظارہ کریں
azd provision --preview
# دکھاتا ہے کہ کون سے وسائل بنائے/ترمیم کیے/حذف کیے جائیں گے کا ایک خشک-چال دیکھنا
# 'terraform plan' یا 'bicep what-if' کی طرح - چلانے کے لیے محفوظ، کوئی تبدیلیاں لاگو نہیں کی جاتیں
```

### صرف ایپلیکیشن
```bash
# ایپلیکیشن کوڈ کو تعینات کریں
azd deploy

# مخصوص سروس کو تعینات کریں
azd deploy --service web
azd deploy --service api

# تمام سروسز کو تعینات کریں
azd deploy --all
```

### تعمیر اور پیکج
```bash
# درخواست کی انحصاریات کو بحال (ڈاؤن لوڈ) کریں
azd restore

# ایک مخصوص سروس کو بحال کریں
azd restore --service api

# بغیر تعیناتی کے قابل تعینات آرٹیفیکٹ تیار کریں
azd package

# مخصوص سروس تیار کریں
azd package --service api
```

> **`azd restore`** آپ کی ایپ کی dependencies (npm, pip, NuGet, Maven، وغیرہ) کو ڈاؤن لوڈ کرتا ہے۔ یہ خودکار طور پر `azd package` اور `azd deploy` کے دوران چلتا ہے، اس لیے آپ اسے شاذ و نادر ہی براہِ راست چلائیں گے—اسے دستی طور پر چلائیں تاکہ dependencies پہلے سے حاصل کی جاسکیں (مثلاً CI کیش کو گرم رکھنے یا آف لائن کام کرنے کے لیے)۔

> **`azd package`** ڈپلائےبل آرٹیفیکٹ (کنٹینر امیج یا زپ) کو **Azure پر پش کیے بغیر** تعمیر کرتا ہے۔ اسے الگ سے استعمال کریں تاکہ تعمیر کی کامیابی کی تصدیق کریں، نتیجہ چیک کریں، یا ایسا آرٹیفیکٹ تیار کریں جسے کوئی اور عمل بعد میں ڈپلائے کرے۔ `azd deploy` خود بخود پیکجنگ کرتا ہے، اس لیے آپ کو صرف تب `azd package` کی ضرورت ہے جب آپ بغیر ڈپلائے کیے آرٹیفیکٹ حاصل کرنا چاہیں۔

## 🌍 ماحولیات کا انتظام

### ماحولیاتی عمل
```bash
# تمام ماحول کی فہرست بنائیں
azd env list

# نیا ماحول بنائیں
azd env new development
azd env new staging --location westus2

# ماحول منتخب کریں
azd env select production

# دستیاب ماحول دکھائیں
azd env list

# ماحول کی حالت کو تازہ کریں
azd env refresh
```

### ماحولیاتی متغیرات
```bash
# ماحولیاتی متغیر سیٹ کریں
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# ماحولیاتی متغیر حاصل کریں
azd env get API_KEY

# تمام ماحولیاتی متغیرات کی فہرست بنائیں
azd env get-values

# ماحولیاتی متغیر ہٹائیں
azd env unset DEBUG
```

## ⚙️ ترتیب کے کمانڈز

### عالمی ترتیب
```bash
# تمام ترتیب کی فہرست بنائیں
azd config show

# عالمی ڈیفالٹ سیٹ کریں
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# ترتیب کو ہٹائیں
azd config unset defaults.location

# تمام ترتیب کو دوبارہ ترتیب دیں
azd config reset
```

### پروجیکٹ کی ترتیب
```bash
# تصدیق کریں azure.yaml کی
azd config validate

# پراجیکٹ کی معلومات دکھائیں
azd show

# سروس کے اختتام پوائنٹس حاصل کریں
azd show --output json
```

## 📊 نگرانی اور تشخیصی

### نگرانی ڈیش بورڈ
```bash
# ایزور پورٹل مانیٹرنگ ڈیش بورڈ کھولیں
azd monitor

# ایپلیکیشن انسائیٹس لائیو میٹرکس کھولیں
azd monitor --live

# ایپلیکیشن انسائیٹس لاگز بلیڈ کھولیں
azd monitor --logs

# ایپلیکیشن انسائیٹس اوورویو کھولیں
azd monitor --overview
```

### کنٹینر لاگز دیکھنا
```bash
# لاگز Azure CLI کے ذریعے دیکھیں (Container Apps کے لیے)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# لاگز کو حقیقی وقت میں فالو کریں
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# لاگز Azure پورٹل سے دیکھیں
azd monitor --logs
```

### لاگ اینالٹکس کوئریز
```bash
# ازور پورٹل کے ذریعے لاگ تجزیہ تک رسائی حاصل کریں
azd monitor --logs

# ازور CLI کا استعمال کرتے ہوئے لاگز کی استفسار کریں
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ دیکھ بھال کے کمانڈز

### صفائی
```bash
# تمام Azure وسائل ہٹا دیں
azd down

# تصدیق کے بغیر زبردستی حذف کریں
azd down --force

# نرم حذف شدہ وسائل صاف کریں
azd down --purge

# مکمل صفائی
azd down --force --purge
```

### اپڈیٹس
```bash
# ایزد اپ ڈیٹس کے لیے چیک کریں
azd version

# موجودہ ورژن حاصل کریں
azd version

# موجودہ ترتیب دیکھیں
azd config show
```

## 🔧 جدید کمانڈز

### پائپ لائن اور CI/CD
```bash
# گٹ ہب ایکشنز کی ترتیب دیں
azd pipeline config

# ایذور ڈی وی اوپس کی ترتیب دیں
azd pipeline config --provider azdo

# پائپ لائن کی ترتیب دکھائیں
azd pipeline show
```

### انفراسٹرکچر کا انتظام
```bash
# انفراسٹرکچر ٹیمپلیٹس تیار کریں
azd infra generate

# 🧪 انفراسٹرکچر کا پیش نظارہ اور منصوبہ بندی
azd provision --preview
# تعیناتی کے بغیر انفراسٹرکچر کی فراہمی کی نقل کرتا ہے
# بائسِپ/ٹیرافارم ٹیمپلیٹس کا تجزیہ کرتا ہے اور دکھاتا ہے:
# - شامل کرنے کے لیے وسائل (سبز +)
# - تبدیل کرنے کے لیے وسائل (پیلا ~)
# - حذف کرنے کے لیے وسائل (سرخ -)
# چلانے کے لیے محفوظ - Azure ماحول میں کوئی حقیقی تبدیلیاں نہیں کی گئیں

# azure.yaml سے انفراسٹرکچر تیار کریں
azd infra synth
```

### پروجیکٹ کی معلومات
```bash
# پروجیکٹ کی حالت اور اینڈ پوائنٹس دکھائیں
azd show

# JSON کی شکل میں تفصیلی پروجیکٹ معلومات دکھائیں
azd show --output json

# سروس اینڈ پوائنٹس حاصل کریں
azd show --output json | jq '.services'
```

## 🤖 AI اور ایکسٹینشن کمانڈز

### AZD ایکسٹینشنز
```bash
# تمام دستیاب ایکسٹینشنز کی فہرست بنائیں (بشمول AI)
azd extension list

# فاؤنڈری ایجنٹس ایکسٹینشن انسٹال کریں
azd extension install azure.ai.agents

# ایجنٹ اسکلز ایکسٹینشن انسٹال کریں (پری ویو)
azd extension install azure.ai.skills

# فاؤنڈری کنکشنز ایکسٹینشن انسٹال کریں (پری ویو)
azd extension install azure.ai.connections

# فائن ٹیوننگ ایکسٹینشن انسٹال کریں
azd extension install azure.ai.finetune

# کسٹم ماڈلز ایکسٹینشن انسٹال کریں
azd extension install azure.ai.models

# تمام انسٹال شدہ ایکسٹینشنز کو اپ گریڈ کریں
azd extension upgrade --all
```

### AI ایجنٹ کمانڈز
```bash
# ایک ما نیفیسٹ سے ایجنٹ پراجیکٹ شروع کریں
azd ai agent init -m <manifest-path-or-uri>

# ایک مخصوص فاؤنڈری پراجیکٹ کو نشانہ بنائیں
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# ایجنٹ کے سورس ڈائریکٹری کی وضاحت کریں
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# میزبانی کا ہدف منتخب کریں
azd ai agent init -m agent-manifest.yaml --host containerapp

# تعینات شدہ ایجنٹ کا ٹیسٹ کریں (لیٹنسی + ٹائم ٹو فرسٹ بائٹ پرنٹ کرتا ہے)
azd ai agent invoke

# لائیو اینڈپوائنٹ کی تشکیل دکھائیں
azd ai agent endpoint show

# ایک جائزہ ڈیٹا سیٹ تیار کریں، پھر ایجنٹ کو بہتر بنائیں
azd ai agent eval generate
azd ai agent optimize

# کوڈ پر مبنی میزبانی کردہ ایجنٹ کے تعینات سورس کو ڈاؤن لوڈ کریں
azd ai agent code download

# ایک میزبانی شدہ ایجنٹ اور اس کے تمام ورژنز کو حذف کریں (--force فعال سیشن ختم کرتا ہے)
azd ai agent delete --force
```

### MCP سرور (الفا)
```bash
# اپنے پروجیکٹ کے لیے MCP سرور شروع کریں
azd mcp start

# MCP آپریشنز کے لیے ٹول کی منظوری کا انتظام کریں
azd copilot consent list
```

### انفراسٹرکچر جنریشن
```bash
# اپنی پروجیکٹ کی تعریف سے IaC فائلیں تیار کریں
azd infra generate

# azure.yaml سے انفراسٹرکچر تیار کریں
azd infra synth
```

---

## 🎯 فوری ورک فلو

### ترقیاتی ورک فلو
```bash
# نیا پروجیکٹ شروع کریں
azd init --template todo-nodejs-mongo
cd my-project

# ترقیاتی ماحول میں تعینات کریں
azd env new dev
azd up

# تبدیلیاں کریں اور دوبارہ تعینات کریں
azd deploy

# مانیٹرنگ ڈیش بورڈ کھولیں
azd monitor --live
```

### کثیر ماحولیات ورک فلو
```bash
# ماحول تیار کریں
azd env new dev
azd env new staging  
azd env new production

# ڈویلپمنٹ میں تعینات کریں
azd env select dev
azd up

# جانچیں اور اسٹیجنگ پر منتقل کریں
azd env select staging
azd up

# پیداوار میں تعینات کریں
azd env select production
azd up
```

### مسائل حل کرنے کا ورک فلو
```bash
# ڈیبگ موڈ فعال کریں
export AZD_DEBUG=true

# تعیناتی کی صورتحال چیک کریں
azd show

# ترتیب کی توثیق کریں
azd config show

# لاگز کے لیے مانیٹرنگ ڈیش بورڈ کھولیں
azd monitor --logs

# وسائل کی حالت چیک کریں
azd show --output json
```

## 🔍 ڈیبگنگ کمانڈز

### ڈیبگ معلومات
```bash
# ڈیبگ آؤٹ پٹ کو فعال کریں
export AZD_DEBUG=true
azd <command> --debug

# صاف آؤٹ پٹ کے لیے ٹیلی میٹری کو غیر فعال کریں
export AZD_DISABLE_TELEMETRY=true

# موجودہ ترتیب چیک کریں
azd config show

# توثیق کی حیثیت چیک کریں
az account show
```

### ٹیمپلیٹ ڈیبگنگ
```bash
# دستیاب ٹیمپلیٹس کی تفصیلات کے ساتھ فہرست بنائیں
azd template list --output json

# ٹیمپلیٹ کی معلومات دکھائیں
azd template show <template-name>

# آغاز سے پہلے ٹیمپلیٹ کی توثیق کریں
azd template validate <template-name>
```

## 📁 فائل اور ڈائریکٹری کمانڈز

### پروجیکٹ کا ڈھانچہ
```bash
# موجودہ ڈائریکٹری کا ڈھانچہ دکھائیں
tree /f  # ونڈوز
find . -type f  # لینکس/میک او ایس

# azd پروجیکٹ روٹ پر جائیں
cd $(azd root)

# azd کنفیگریشن کی ڈائریکٹری دکھائیں
echo $AZD_CONFIG_DIR  # عام طور پر ~/.azd
```

## 🎨 آؤٹ پٹ کی فارمیٹنگ

### JSON آؤٹ پٹ
```bash
# اسکرپٹنگ کے لیے JSON آؤٹ پٹ حاصل کریں
azd show --output json
azd env list --output json
azd config show --output json

# jq کے ساتھ تجزیہ کریں
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### ٹیبل آؤٹ پٹ
```bash
# بطور جدول فارمیٹ کریں
azd env list --output table

# تعینات شدہ خدمات دیکھیں
azd show --output json | jq '.services | keys'
```

## 🔧 عام کمانڈ امتزاج

### ہیلتھ چیک اسکرپٹ
```bash
#!/bin/bash
# جلدی صحت کی جانچ
azd show
azd env get-values
azd monitor --logs
```

### تعیناتی کی تصدیق
```bash
#!/bin/bash
# تعیناتی سے پہلے کی تصدیق
azd show
azd provision --preview  # تعیناتی سے پہلے تبدیلیوں کا جائزہ لیں
az account show
```

### ماحولیات کا موازنہ
```bash
#!/bin/bash
# ماحول کا موازنہ کریں
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### وسائل کی صفائی کا اسکرپٹ
```bash
#!/bin/bash
# پرانے ماحول کو صاف کریں
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 ماحولیاتی متغیرات

### عام ماحولیاتی متغیرات
```bash
# آزور کی ترتیب
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD کی ترتیب
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# ایپلیکیشن کی ترتیب
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 ہنگامی کمانڈز

### فوری اصلاحات
```bash
# تصدیق کو ری سیٹ کریں
az account clear
az login

# ماحول کو زبردستی تازہ کریں
azd env refresh

# تمام خدمات کو دوبارہ تعینات کریں
azd deploy

# تعیناتی کی حیثیت چیک کریں
azd show --output json
```

### بازیابی کے کمانڈز
```bash
# ناکام تعیناتی سے بازیابی - صفائی کریں اور دوبارہ تعینات کریں
azd down --force --purge
azd up

# صرف بنیادی ڈھانچے کو دوبارہ فراہم کریں
azd provision

# صرف ایپلیکیشن کو دوبارہ تعینات کریں
azd deploy
```

## 💡 پیشہ ورانہ نکات

### تیز ورک فلو کے لیے عرفیات
```bash
# اپنے .bashrc یا .zshrc میں شامل کریں
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### فنکشن شارٹ کٹس
```bash
# فوری ماحول کی تبدیلی
azd-env() {
    azd env select $1 && azd show
}

# نگرانی کے ساتھ فوری تعیناتی
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# ماحول کی صورتحال
azd-status() {
    echo "Current environment:"
    azd env get-values
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 مدد اور دستاویزات

### مدد حاصل کرنا
```bash
# عمومی مدد
azd --help
azd help

# کمانڈ مخصوص مدد
azd up --help
azd env --help
azd config --help

# ورژن اور تعمیر کی معلومات دکھائیں
azd version
azd version --output json
```

### دستاویزات کے لنکس
```bash
# دستاویزات براؤزر میں کھولیں
azd docs

# ٹیمپلیٹ کی دستاویزات دکھائیں
azd template show <template-name> --docs
```

---

**نصیحت**: اس چیٹ شیٹ کو بُک مارک کریں اور کمانڈز تلاش کرنے کے لیے `Ctrl+F` استعمال کریں!

---

**نیویگیشن**
- **پچھلا سبق**: [پری فلائٹ چیکس](../docs/pre-deployment/preflight-checks.md)
- **اگلا سبق**: [گھوسریری](glossary.md)

---

> **💡 کیا آپ اپنے ایڈیٹر میں Azure کمانڈ مدد چاہتے ہیں؟** انسٹال کریں [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) کے ساتھ `npx skills add microsoft/github-copilot-for-azure` — AI، Foundry، تعیناتی، تشخیص، اور مزید کے لیے 37 مہارتیں۔

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ڈس کلیمر**:
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے ترجمہ کی گئی ہے۔ جبکہ ہم درستگی کے لیے کوشاں ہیں، براہ کرم اس بات سے آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا عدم درستیاں ہو سکتی ہیں۔ اصل دستاویز اپنے مادری زبان میں مستند ماخذ سمجھی جائے گی۔ حساس معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کی ذمہ داری ہم قبول نہیں کرتے۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->