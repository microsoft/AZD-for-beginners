# کمانڈ چیٹ شیٹ - بنیادی AZD کمانڈز

**تمام ابواب کے لیے فوری حوالہ**  
- **📚 کورس ہوم**: [ابتدائیوں کے لیے AZD](../README.md)  
- **📖 فوری آغاز**: [باب 1: بنیاد اور فوری آغاز](../README.md#-chapter-1-foundation--quick-start)  
- **🤖 AI کمانڈز**: [باب 2: AI-فرسٹ ڈیولپمنٹ](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)  
- **🔧 اعلیٰ درجے کے**: [باب 4: انفراسٹرکچر ایز کوڈ](../README.md#️-chapter-4-infrastructure-as-code--deployment)  

## تعارف

یہ مکمل چیٹ شیٹ عام طور پر استعمال ہونے والی Azure Developer CLI کمانڈز کے لیے فوری حوالہ فراہم کرتی ہے، جنہیں زمرہ وار اور عملی مثالوں کے ساتھ منظم کیا گیا ہے۔ azd پروجیکٹس کے ساتھ ترقی، مسئلہ حل کرنے، اور روزمرہ کے کاموں کے دوران فوری جائزے کے لیے بہترین۔

## سیکھنے کے اہداف

اس چیٹ شیٹ کو استعمال کرتے ہوئے، آپ:  
- اہم Azure Developer CLI کمانڈز اور نحو تک فوری رسائی حاصل کریں گے  
- کمانڈز کو فعالی زمروں اور استعمال کے معاملات کے مطابق سمجھیں گے  
- عام ترقی اور تعیناتی کے منظرناموں کے لیے عملی مثالوں کا حوالہ دیں گے  
- فوری مسئلہ حل کے لیے تشخیصی کمانڈز استعمال کریں گے  
- اعلیٰ درجہ کی کنفیگریشن اور حسب ضرورت اختیارات تک باآسانی رسائی حاصل کریں گے  
- ماحول کی مینجمنٹ اور کثیر ماحول کے ورک فلو کمانڈز تلاش کریں گے  

## سیکھنے کے نتائج

اس چیٹ شیٹ کا باقاعدہ حوالہ دے کر، آپ قابل ہو جائیں گے:  
- azd کمانڈز کو بغیر مکمل دستاویز کا حوالہ دیے اعتماد کے ساتھ چلانا  
- مناسب تشخیصی کمانڈز استعمال کرتے ہوئے عمومی مسائل کو جلد حل کرنا  
- متعدد ماحول اور تعیناتی کے منظرناموں کو مؤثر طریقے سے منظم کرنا  
- ضرورت کے مطابق azd کی اعلیٰ خصوصیات اور کنفیگریشن اختیارات کو اپلائی کرنا  
- تعیناتی کے مسائل کو منظم کمانڈز کے تسلسل کے ذریعے حل کرنا  
- azd کے شارٹ کٹس اور اختیارات کے مؤثر استعمال سے ورک فلو کو بہتر بنانا  

## شروع کرنے والی کمانڈز

### تصدیق  
```bash
# AZD کے ذریعے Azure میں لاگ ان کریں
azd auth login

# Azure CLI میں لاگ ان کریں (AZD اس کو نیچے استعمال کرتا ہے)
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
# دستیاب ٹیمپلیٹس براؤز کریں
azd template list

# ٹیمپلیٹ سے آغاز کریں
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# موجودہ ڈائریکٹری میں آغاز کریں
azd init .

# کسٹم نام کے ساتھ آغاز کریں
azd init --template todo-nodejs-mongo my-awesome-app
```
  
## بنیادی تعیناتی کمانڈز

### مکمل تعیناتی ورک فلو  
```bash
# سب کچھ نافذ کریں (فراہم کریں + تعینات کریں)
azd up

# تصدیقی پرامپٹس کو غیر فعال کرتے ہوئے تعینات کریں
azd up --confirm-with-no-prompt

# مخصوص ماحول میں تعینات کریں
azd up --environment production

# حسب ضرورت پیرامیٹرز کے ساتھ تعینات کریں
azd up --parameter location=westus2
```
  
### صرف انفراسٹرکچر  
```bash
# ایزور وسائل مہیا کریں
azd provision

# 🧪 بنیادی ڈھانچے میں تبدیلیوں کا پیش نظارہ
azd provision --preview
# دکھاتا ہے کہ کون سے وسائل تخلیق/ترمیم/حذف کیے جائیں گے، بغیر کسی تبدیلی کے
# 'terraform plan' یا 'bicep what-if' کی طرح - چلانے میں محفوظ، کوئی تبدیلی نہیں کی جاتی
```
  
### صرف ایپلیکیشن  
```bash
# درخواست کا کوڈ تعینات کریں
azd deploy

# مخصوص خدمت تعینات کریں
azd deploy --service web
azd deploy --service api

# تمام خدمات تعینات کریں
azd deploy --all
```
  
### بلڈ اور پیکجنگ  
```bash
# ایپلیکیشنز بنائیں
azd package

# مخصوص سروس بنائیں
azd package --service api
```
  
## 🌍 ماحول کی مینجمنٹ

### ماحول کے عملیات  
```bash
# تمام ماحول کی فہرست بنائیں
azd env list

# نیا ماحول بنائیں
azd env new development
azd env new staging --location westus2

# ماحول کا انتخاب کریں
azd env select production

# موجودہ ماحول دکھائیں
azd env show

# ماحول کی حالت کو تازہ کریں
azd env refresh
```
  
### ماحول کی متغیرات  
```bash
# ماحول کا متغیر سیٹ کریں
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# ماحول کا متغیر حاصل کریں
azd env get API_KEY

# تمام ماحول کے متغیرات کی فہرست بنائیں
azd env get-values

# ماحول کا متغیر حذف کریں
azd env unset DEBUG
```
  
## ⚙️ کنفیگریشن کمانڈز

### عالمی کنفیگریشن  
```bash
# تمام ترتیب کی فہرست بنائیں
azd config list

# عالمی ڈیفالٹس مقرر کریں
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# ترتیب ہٹائیں
azd config unset defaults.location

# تمام ترتیب کو ری سیٹ کریں
azd config reset
```
  
### پروجیکٹ کنفیگریشن  
```bash
# azure.yaml کی توثیق کریں
azd config validate

# منصوبے کی معلومات دکھائیں
azd show

# سروس کے انتہاپوان حاصل کریں
azd show --output json
```
  
## 📊 نگرانی اور تشخیص

### نگرانی ڈیش بورڈ  
```bash
# ایزور پورٹل مانیٹرنگ ڈیش بورڈ کھولیں
azd monitor

# ایپلیکیشن انسائٹس لائیو میٹرکس کھولیں
azd monitor --live

# ایپلیکیشن انسائٹس لاگز بلیڈ کھولیں
azd monitor --logs

# ایپلیکیشن انسائٹس کا جائزہ کھولیں
azd monitor --overview
```
  
### کنٹینر لاگز دیکھنا  
```bash
# ایژور CLI کے ذریعے لاگز دیکھیں (کنٹینر ایپس کے لیے)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# لاگز کو حقیقی وقت میں فالو کریں
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# ایژور پورٹل سے لاگز دیکھیں
azd monitor --logs
```
  
### لاگ اینالٹکس کیوریز  
```bash
# ازور پورٹل کے ذریعے لاگ اینالیٹکس تک رسائی حاصل کریں
azd monitor --logs

# ازور CLI کا استعمال کرتے ہوئے لاگز کو استفسار کریں
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```
  
## 🛠️ مینٹیننس کمانڈز

### صفائی  
```bash
# تمام Azure وسائل کو ہٹا دیں
azd down

# تصدیق کے بغیر زبردستی حذف کریں
azd down --force

# نرم حذف شدہ وسائل کو ختم کریں
azd down --purge

# مکمل صفائی
azd down --force --purge
```
  
### اپڈیٹس  
```bash
# ایزد اپ ڈیٹس چیک کریں
azd version

# موجودہ ورژن حاصل کریں
azd version

# موجودہ ترتیب دیکھیں
azd config list
```
  
## 🔧 اعلیٰ درجے کے کمانڈز

### پائپ لائن اور CI/CD  
```bash
# گٹ ہب ایکشنز کو ترتیب دیں
azd pipeline config

# ایزور ڈیواپس کو ترتیب دیں
azd pipeline config --provider azdo

# پائپ لائن کی ترتیب دکھائیں
azd pipeline show
```
  
### انفراسٹرکچر مینجمنٹ  
```bash
# انفراسٹرکچر کے ٹیمپلیٹس تیار کریں
azd infra generate

# 🧪 انفراسٹرکچر کا جائزہ اور منصوبہ بندی
azd provision --preview
# بغیر تعیناتی کے انفراسٹرکچر کی فراہمی کی نقل بنائیں
# بائسک/ٹیرافارم ٹیمپلیٹس کا تجزیہ کرتا ہے اور دکھاتا ہے:
# - شامل کرنے کے لیے وسائل (سبز +)
# - ترمیم کرنے کے لیے وسائل (پیلا ~)
# - حذف کرنے کے لیے وسائل (سرخ -)
# چلانا محفوظ ہے - Azure ماحول میں کوئی اصل تبدیلیاں نہیں کی گئیں

# azure.yaml سے انفراسٹرکچر تیار کریں
azd infra synth
```
  
### پروجیکٹ معلومات  
```bash
# پروجیکٹ کی حالت اور اینڈ پوائنٹس دکھائیں
azd show

# JSON کے طور پر تفصیلی پروجیکٹ معلومات دکھائیں
azd show --output json

# سروس اینڈ پوائنٹس حاصل کریں
azd show --output json | jq '.services'
```
  
## 🤖 AI اور ایکسٹینشن کمانڈز

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

# تمام انسٹال کردہ توسیعات کو اپ گریڈ کریں
azd extension upgrade --all
```
  
### AI ایجنٹ کمانڈز  
```bash
# ایک Manifest سے ایجنٹ پروجیکٹ شروع کریں
azd ai agent init -m <manifest-path-or-uri>

# کسی مخصوص Foundry پروجیکٹ کو ہدف بنائیں
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# ایجنٹ سورس ڈائریکٹری کی وضاحت کریں
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# ہاسٹنگ ہدف منتخب کریں
azd ai agent init -m agent-manifest.yaml --host containerapp
```
  
### MCP سرور (الفا)  
```bash
# اپنے منصوبے کے لیے MCP سرور شروع کریں
azd mcp start

# MCP کے عملیات کے لیے ٹول اجازت کا انتظام کریں
azd mcp consent
```
  
### انفراسٹرکچر جنریشن  
```bash
# آپ کے پروجیکٹ کی تعریف سے IaC فائلیں تیار کریں
azd infra generate

# azure.yaml سے انفراسٹرکچر تیار کریں
azd infra synth
```
  
---

## 🎯 فوری ورک فلو

### ترقیاتی ورک فلو  
```bash
# نیا پراجیکٹ شروع کریں
azd init --template todo-nodejs-mongo
cd my-project

# ڈیولپمنٹ میں تعینات کریں
azd env new dev
azd up

# تبدیلی کریں اور دوبارہ تعینات کریں
azd deploy

# مانیٹرنگ ڈیش بورڈ کھولیں
azd monitor --live
```
  
### کثیر ماحول ورک فلو  
```bash
# ماحول بنائیں
azd env new dev
azd env new staging  
azd env new production

# ڈیولپمنٹ میں تعینات کریں
azd env select dev
azd up

# جانچ کریں اور اسٹیجنگ میں ترقی دیں
azd env select staging
azd up

# پیداوار میں تعینات کریں
azd env select production
azd up
```
  
### مسئلہ حل کرنے کا ورک فلو  
```bash
# ڈیبگ موڈ کو فعال کریں
export AZD_DEBUG=true

# تعیناتی کی صورتحال چیک کریں
azd show

# ترتیب کی توثیق کریں
azd config list

# لاگز کے لئے مانیٹرنگ ڈیش بورڈ کھولیں
azd monitor --logs

# وسائل کی صورتحال چیک کریں
azd show --output json
```
  
## 🔍 ڈیبگنگ کمانڈز

### ڈیبگ معلومات  
```bash
# ڈی بگ آؤٹ پٹ کو فعال کریں
export AZD_DEBUG=true
azd <command> --debug

# صاف آؤٹ پٹ کے لیے ٹیلی میٹری کو غیر فعال کریں
export AZD_DISABLE_TELEMETRY=true

# موجودہ ترتیب چیک کریں
azd config list

# توثیق کی حالت چیک کریں
az account show
```
  
### ٹیمپلیٹ ڈیبگنگ  
```bash
# دستیاب سانچے کی تفصیلات کے ساتھ فہرست بنائیں
azd template list --output json

# سانچے کی معلومات دکھائیں
azd template show <template-name>

# شروع کرنے سے پہلے سانچے کی تصدیق کریں
azd template validate <template-name>
```
  
## 📁 فائل اور ڈائریکٹری کمانڈز

### پروجیکٹ کا ڈھانچہ  
```bash
# موجودہ ڈائریکٹری کی ساخت دکھائیں
tree /f  # ونڈوز
find . -type f  # لینکس/میک او ایس

# azd پروجیکٹ روٹ پر جائیں
cd $(azd root)

# azd کنفیگریشن ڈائریکٹری دکھائیں
echo $AZD_CONFIG_DIR  # عام طور پر ~/.azd
```
  
## 🎨 آؤٹ پٹ کی ترتیب

### JSON آؤٹ پٹ  
```bash
# اسکرپٹنگ کے لیے JSON آؤٹ پٹ حاصل کریں
azd show --output json
azd env list --output json
azd config list --output json

# jq کے ساتھ پارس کریں
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```
  
### ٹیبل آؤٹ پٹ  
```bash
# جدول کے طور پر فارمیٹ کریں
azd env list --output table

# تعینات کردہ خدمات دیکھیں
azd show --output json | jq '.services | keys'
```
  
## 🔧 عام کمانڈ کمبینیشنز

### ہیلتھ چیک اسکرپٹ  
```bash
#!/bin/bash
# فوری صحت کی جانچ
azd show
azd env show
azd monitor --logs
```
  
### تعیناتی کی توثیق  
```bash
#!/bin/bash
# ترسیل سے پہلے تصدیق
azd show
azd provision --preview  # ترسیل سے پہلے تبدیلیوں کا جائزہ لیں
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
  
### ریسورس صفائی اسکرپٹ  
```bash
#!/bin/bash
# پرانے ماحول کو صاف کریں
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```
  
## 📝 ماحول کی متغیرات

### عام ماحول کی متغیرات  
```bash
# ایزور کی ترتیب
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# اے زی ڈی کی ترتیب
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# ایپلیکیشن کی ترتیب
export NODE_ENV="production"
export LOG_LEVEL="info"
```
  
## 🚨 ایمرجنسی کمانڈز

### فوری اصلاحات  
```bash
# توثیق کو ری سیٹ کریں
az account clear
az login

# ماحول کو مجبور کر کے تازہ کاری کریں
azd env refresh

# تمام خدمات کو دوبارہ تعینات کریں
azd deploy

# تعیناتی کی حیثیت چیک کریں
azd show --output json
```
  
### بازیابی کمانڈز  
```bash
# ناکام تعیناتی سے بحالی - صاف کریں اور دوبارہ تعینات کریں
azd down --force --purge
azd up

# صرف بنیادی ڈھانچے کی دوبارہ فراہمی کریں
azd provision

# صرف درخواست کو دوبارہ تعینات کریں
azd deploy
```
  
## 💡 پرو ٹپس

### تیز تر ورک فلو کے لیے عرفیات  
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

# ماحول کی حالت
azd-status() {
    echo "Current environment:"
    azd env show
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

# سانچہ کی دستاویزات دکھائیں
azd template show <template-name> --docs
```
  
---

**مشورہ**: اس چیٹ شیٹ کو بک مارک کریں اور اپنی ضرورت کی کمانڈز کو جلدی تلاش کرنے کے لئے `Ctrl+F` استعمال کریں!

---

**نیویگیشن**  
- **پچھلا سبق**: [پری فلائٹ چیکس](../docs/pre-deployment/preflight-checks.md)  
- **اگلا سبق**: [Glossary](glossary.md)  

---

> **💡 کیا آپ چاہتے ہیں کہ آپ کے ایڈیٹر میں Azure کمانڈ کی مدد ہو؟** انسٹال کریں [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) `npx skills add microsoft/github-copilot-for-azure` کے ساتھ — AI، Foundry، تعیناتی، تشخیصی اور مزید کے لیے 37 اسکلز۔

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ڈس کلیمر**:  
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے ترجمہ کی گئی ہے۔ اگرچہ ہم درستگی کے لیے کوشاں ہیں، براہ کرم اس بات سے آگاہ رہیں کہ خودکار تراجم میں غلطیاں یا کچھ نا درستیاں ہو سکتی ہیں۔ اصل دستاویز اپنی مادری زبان میں معتبر ذریعہ تصور کی جانی چاہیے۔ اہم معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمہ کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تعبیر کی ذمہ داری ہم پر نہیں ہوگی۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->