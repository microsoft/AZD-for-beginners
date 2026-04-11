# کمانڈ چیٹ شیٹ - ضروری AZD کمانڈز

**تمام ابواب کے لیے فوری حوالہ**
- **📚 کورس ہوم**: [AZD برائے مبتدیان](../README.md)
- **📖 جلدی آغاز**: [باب 1: بنیاد اور جلدی آغاز](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI کمانڈز**: [باب 2: AI-فرسٹ ڈیولپمنٹ](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 جدید**: [باب 4: انفراسٹرکچر ایز کوڈ](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## تعارف

یہ جامع چیٹ شیٹ Azure Developer CLI کے سب سے زیادہ استعمال ہونے والے کمانڈز کا فوری حوالہ فراہم کرتی ہے، جو زمرہ وار اور عملی مثالوں کے ساتھ منظم ہیں۔ ترقی، خرابیوں کا ازالہ، اور روزانہ کے کاموں کے دوران فوری دیکھنے کے لیے بہترین ہے azd پروجیکٹس کے ساتھ۔

## تعلیمی مقاصد

اس چیٹ شیٹ کے استعمال سے، آپ:
- لازمی Azure Developer CLI کمانڈز اور نحو تک فوری رسائی حاصل کریں گے
- فنکشنل زمرہ جات اور استعمال کے کیسز کے لحاظ سے کمانڈز کی ترتیب کو سمجھیں گے
- عام ترقی اور تعیناتی کے مناظر کے لیے عملی مثالوں کا حوالہ دیں گے
- مسائل کے جلد حل کے لیے خرابیوں کا ازالہ کمانڈز تک رسائی حاصل کریں گے
- جدید کنفیگریشن اور حسب ضرورت کے اختیارات کو مؤثر طریقے سے تلاش کریں گے
- ماحول کے انتظام اور کثیر ماحول کی ورک فلو کمانڈز تلاش کریں گے

## تعلیمی نتائج

اس چیٹ شیٹ کو باقاعدگی سے دیکھنے سے، آپ:
- مکمل دستاویزات کی طرف رجوع کیے بغیر azd کمانڈز کو بااعتماد طریقے سے چلائیں گے
- مناسب تشخیصی کمانڈز کا استعمال کرتے ہوئے عام مسائل کو تیزی سے حل کریں گے
- متعدد ماحول اور تعیناتی کے مناظر کو مؤثر طریقے سے منظم کریں گے
- ضرورت کے مطابق جدید azd خصوصیات اور کنفیگریشن اختیارات لگائیں گے
- تعیناتی کے مسائل کو منظم کمانڈ سلسلوں کے ذریعے حل کریں گے
- azd کے شارٹ کٹس اور اختیارات کے مؤثر استعمال کے ذریعے ورک فلو کو بہتر بنائیں گے

## شروع کرنے والے کمانڈز

### توثیق
```bash
# ای زی ڈٰی کے ذریعے Azure میں لاگ ان کریں
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
# دستیاب ٹیمپلیٹس دیکھیں
azd template list

# ٹیمپلیٹ سے شروع کریں
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# موجودہ ڈائریکٹری میں شروع کریں
azd init .

# حسبِ خواہش نام کے ساتھ شروع کریں
azd init --template todo-nodejs-mongo my-awesome-app
```

## بنیادی تعیناتی کے کمانڈز

### مکمل تعیناتی ورک فلو
```bash
# سب کچھ تعینات کریں (فراہم کریں + تعینات کریں)
azd up

# تصدیقی اشارے غیر فعال کرکے تعینات کریں
azd up --confirm-with-no-prompt

# مخصوص ماحول میں تعینات کریں
azd up --environment production

# حسب ضرورت پیرامیٹرز کے ساتھ تعینات کریں
azd up --parameter location=westus2
```

### صرف انفراسٹرکچر
```bash
# آزور وسائل کی فراہمی
azd provision

# 🧪 انفراسٹرکچر میں تبدیلیوں کا جائزہ لیں
azd provision --preview
# دکھاتا ہے کہ کون سے وسائل بنائے، ترمیم یا حذف کیے جائیں گے - ایک خشک رن نظارہ
# 'terraform plan' یا 'bicep what-if' کے مانند - محفوظ طریقہ، کوئی تبدیلیاں لاگو نہیں کی جاتیں
```

### صرف ایپلیکیشن
```bash
# ایپلیکیشن کوڈ تعینات کریں
azd deploy

# مخصوص سروس تعینات کریں
azd deploy --service web
azd deploy --service api

# تمام سروسز تعینات کریں
azd deploy --all
```

### بلڈ اور پیکیج
```bash
# ایپلیکیشنز بنائیں
azd package

# مخصوص سروس بنائیں
azd package --service api
```

## 🌍 ماحول کا انتظام

### ماحول کے آپریشنز
```bash
# تمام ماحول کی فہرست بنائیں
azd env list

# نیا ماحول بنائیں
azd env new development
azd env new staging --location westus2

# ماحول کا انتخاب کریں
azd env select production

# دستیاب ماحول دکھائیں
azd env list

# ماحول کی حالت کو تازہ کریں
azd env refresh
```

### ماحول کے متغیرات
```bash
# ماحول کا متغیر سیٹ کریں
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# ماحول کا متغیر حاصل کریں
azd env get API_KEY

# تمام ماحول کے متغیرات کی فہرست بنائیں
azd env get-values

# ماحول کا متغیر ہٹائیں
azd env unset DEBUG
```

## ⚙️ کنفیگریشن کمانڈز

### عالمی کنفیگریشن
```bash
# تمام کنفیگریشن کی فہرست بنائیں
azd config show

# عالمی ڈیفالٹس مقرر کریں
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# کنفیگریشن ہٹائیں
azd config unset defaults.location

# تمام کنفیگریشن ری سیٹ کریں
azd config reset
```

### پروجیکٹ کنفیگریشن
```bash
# azure.yaml کی تصدیق کریں
azd config validate

# پروجیکٹ کی معلومات دکھائیں
azd show

# سروس اینڈپوائنٹس حاصل کریں
azd show --output json
```

## 📊 نگرانی اور تشخیص

### مانیٹرنگ ڈیش بورڈ
```bash
# ایزور پورٹل مانیٹرنگ ڈیش بورڈ کھولیں
azd monitor

# ایپلیکیشن انسائٹس کی لائیو میٹرکس کھولیں
azd monitor --live

# ایپلیکیشن انسائٹس لاگز بلیڈ کھولیں
azd monitor --logs

# ایپلیکیشن انسائٹس کا جائزہ کھولیں
azd monitor --overview
```

### کنٹینر لاگز دیکھنا
```bash
# Azure CLI کے ذریعے لاگز دیکھیں (Container Apps کے لیے)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# حقیقی وقت میں لاگز کا تعاقب کریں
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Azure Portal سے لاگز دیکھیں
azd monitor --logs
```

### لاگ اینالٹکس سوالات
```bash
# آزور پورٹل کے ذریعے لاگ تجزیہ تک رسائی
azd monitor --logs

# آزور CLI کا استعمال کرتے ہوئے لاگز کی استفسار کریں
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ دیکھ بھال کے کمانڈز

### صفائی
```bash
# تمام Azure وسائل کو ہٹا دیں
azd down

# بغیر تصدیق کے زبردستی حذف کریں
azd down --force

# نرم حذف شدہ وسائل کو مکمل طور پر مٹائیں
azd down --purge

# مکمل صفائی
azd down --force --purge
```

### اپ ڈیٹس
```bash
# ایزد اپ ڈیٹس کی جانچ کریں
azd version

# موجودہ ورژن حاصل کریں
azd version

# موجودہ ترتیب دیکھیں
azd config show
```

## 🔧 جدید کمانڈز

### پائپ لائن اور CI/CD
```bash
# گٹ ہب ایکشنز کو تشکیل دیں
azd pipeline config

# ایزور ڈیو آپس کو تشکیل دیں
azd pipeline config --provider azdo

# پائپ لائن کی تشکیل دکھائیں
azd pipeline show
```

### انفراسٹرکچر مینجمنٹ
```bash
# بنیادی ڈھانچے کے سانچے تیار کریں
azd infra generate

# 🧪 بنیادی ڈھانچے کا جائزہ اور منصوبہ بندی
azd provision --preview
# تعیناتی کیے بغیر بنیادی ڈھانچے کی فراہمی کی مشابہت کرتا ہے
# بائسپس/ٹیرافارم سانچوں کا تجزیہ کرتا ہے اور دکھاتا ہے:
# - شامل کی جانے والی وسائل (سبز +)
# - ترمیم کی جانے والی وسائل (پیلا ~)
# - حذف کی جانے والی وسائل (سرخ -)
# چلانے کے لیے محفوظ - Azure ماحول میں کوئی اصل تبدیلیاں نہیں کی گئیں

# azure.yaml سے بنیادی ڈھانچے کا خلاصہ تیار کریں
azd infra synth
```

### پروجیکٹ معلومات
```bash
# منصوبے کی حیثیت اور اختتامی نقاط دکھائیں
azd show

# تفصیلی منصوبے کی معلومات JSON کے طور پر دکھائیں
azd show --output json

# سروس کے اختتامی نقاط حاصل کریں
azd show --output json | jq '.services'
```

## 🤖 AI اور ایکسٹینشنز کمانڈز

### AZD ایکسٹینشنز
```bash
# تمام دستیاب توسیعات کی فہرست بنائیں (بشمول AI)
azd extension list

# فاؤنڈری ایجنٹس توسیع انسٹال کریں
azd extension install azure.ai.agents

# فائن ٹیوننگ توسیع انسٹال کریں
azd extension install azure.ai.finetune

# کسٹم ماڈلز توسیع انسٹال کریں
azd extension install azure.ai.models

# تمام نصب شدہ توسیعات کو اپ گریڈ کریں
azd extension upgrade --all
```

### AI ایجنٹ کمانڈز
```bash
# ایک مینی فیسٹ سے ایجنٹ پروجیکٹ شروع کریں
azd ai agent init -m <manifest-path-or-uri>

# مخصوص Foundry پروجیکٹ کو ہدف بنائیں
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# ایجنٹ کے ماخذ ڈائریکٹری کی وضاحت کریں
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# ہوسٹنگ کا ہدف منتخب کریں
azd ai agent init -m agent-manifest.yaml --host containerapp
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
# اپنی پروجیکٹ تعریف سے IaC فائلیں بنائیں
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

### کثیر ماحولیاتی ورک فلو
```bash
# ماحول ترتیب دیں
azd env new dev
azd env new staging  
azd env new production

# ترقیاتی ماحول میں تعینات کریں
azd env select dev
azd up

# جانچ کریں اور اسٹیجنگ میں ترقی دیں
azd env select staging
azd up

# پیداوار میں تعینات کریں
azd env select production
azd up
```

### خرابیوں کا ازالہ ورک فلو
```bash
# ڈیبگ موڈ کو فعال کریں
export AZD_DEBUG=true

# تعیناتی کی حالت چیک کریں
azd show

# ترتیب کی تصدیق کریں
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

# توثیق کی حالت چیک کریں
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
# موجودہ ڈائریکٹری کی ساخت دکھائیں
tree /f  # ونڈوز
find . -type f  # لینکس/میك او ایس

# azd پروجیکٹ کے روٹ پر جائیں
cd $(azd root)

# azd کنفیگریشن ڈائریکٹری دکھائیں
echo $AZD_CONFIG_DIR  # عام طور پر ~/.azd
```

## 🎨 آؤٹ پٹ فارمیٹنگ

### JSON آؤٹ پٹ
```bash
# اسکرپٹنگ کے لیے JSON آؤٹ پٹ حاصل کریں
azd show --output json
azd env list --output json
azd config show --output json

# jq کے ساتھ پارس کریں
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### ٹیبل آؤٹ پٹ
```bash
# جدول کے طور پر فارمیٹ کریں
azd env list --output table

# تعینات خدمات دیکھیں
azd show --output json | jq '.services | keys'
```

## 🔧 عمومی کمانڈ مجموعے

### ہیلتھ چیک اسکرپٹ
```bash
#!/bin/bash
# تیز صحت کی جانچ
azd show
azd env get-values
azd monitor --logs
```

### تعیناتی کی توثیق
```bash
#!/bin/bash
# پیش از تعیناتی کی تصدیق
azd show
azd provision --preview  # تعیناتی سے پہلے تبدیلیاں پیش نظارہ کریں
az account show
```

### ماحول کا موازنہ
```bash
#!/bin/bash
# ماحول کا موازنہ کریں
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### وسائل کی صفائی اسکرپٹ
```bash
#!/bin/bash
# پرانے ماحول صاف کریں
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 ماحول کے متغیرات

### عام ماحول کے متغیرات
```bash
# ایذور کی تشکیل
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD کی تشکیل
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# درخواست کی تشکیل
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 ایمرجنسی کمانڈز

### فوری اصلاحات
```bash
# توثیق کو دوبارہ ترتیب دیں
az account clear
az login

# ماحول کو زبردستی تازہ کریں
azd env refresh

# تمام خدمات کو دوبارہ تعینات کریں
azd deploy

# تعیناتی کی حالت چیک کریں
azd show --output json
```

### بازیابی کے کمانڈز
```bash
# ناکام تقسیم سے بحالی - صفائی کریں اور دوبارہ تقسیم کریں
azd down --force --purge
azd up

# صرف بنیادی ڈھانچے کو دوبارہ فراہمی کریں
azd provision

# صرف درخواست کو دوبارہ تقسیم کریں
azd deploy
```

## 💡 پرو ٹپس

### تیز ورک فلو کے لیے علیاسز
```bash
# اپنے .bashrc یا .zshrc میں شامل کریں
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### فنکشن شارٹ کٹس
```bash
# ماحولیاتی تبدیلی جلدی
azd-env() {
    azd env select $1 && azd show
}

# نگرانی کے ساتھ جلدی تعیناتی
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# ماحولیاتی حیثیت
azd-status() {
    echo "Current environment:"
    azd env get-values
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 مدد اور دستاویزات

### مدد حاصل کریں
```bash
# عمومی مدد
azd --help
azd help

# حکم مخصوص مدد
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

**ٹپ**: اس چیٹ شیٹ کو بُک مارک کریں اور ضروری کمانڈز کو جلد تلاش کرنے کے لیے `Ctrl+F` استعمال کریں!

---

**نیوگیشن**
- **پچھلا سبق**: [پری فلائٹ چیکز](../docs/pre-deployment/preflight-checks.md)
- **اگلا سبق**: [گلاسری](glossary.md)

---

> **💡 کیا آپ اپنے ایڈیٹر میں Azure کمانڈ مدد چاہتے ہیں؟** نصب کریں [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) کے ساتھ `npx skills add microsoft/github-copilot-for-azure` — AI، فاؤنڈری، تعیناتی، تشخیص، اور مزید کے لیے 37 مہارتیں۔

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**انتباہ**:
اس دستاویز کا ترجمہ AI ترجمہ خدمت [Co-op Translator](https://github.com/Azure/co-op-translator) کا استعمال کرتے ہوئے کیا گیا ہے۔ اگرچہ ہم درستگی کے لئے کوشاں ہیں، براہ کرم یاد رکھیں کہ خودکار تراجم میں غلطیاں یا اغلاط ہو سکتی ہیں۔ اصل دستاویز اپنی مادری زبان میں مستند ماخذ سمجھی جانی چاہئے۔ اہم معلومات کے لئے پیشہ ور انسانی ترجمہ تجویز کیا جاتا ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کی ذمہ داری ہم پر نہیں ہوگی۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->