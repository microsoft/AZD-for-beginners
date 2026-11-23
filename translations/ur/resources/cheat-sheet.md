# کمانڈ چیٹ شیٹ - ضروری AZD کمانڈز

**تمام ابواب کے لئے فوری حوالہ**
- **📚 کورس ہوم**: [AZD فار بیگنرز](../README.md)
- **📖 جلد آغاز**: [باب 1: بنیاد اور جلد آغاز](../README.md#-chapter-1-foundation--quick-start)
- **🤖 اے آئی کمانڈز**: [باب 2: اے آئی-فرسٹ ڈیولپمنٹ](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 ایڈوانسڈ**: [باب 4: انفراسٹرکچر ایز کوڈ](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## تعارف

یہ جامع چیٹ شیٹ سب سے زیادہ استعمال ہونے والی Azure Developer CLI کمانڈز کے لئے فوری حوالہ فراہم کرتی ہے، جو زمرہ جات کے لحاظ سے منظم ہیں اور عملی مثالوں کے ساتھ ہیں۔ azd پروجیکٹس میں ترقی، خرابی حل کرنے، اور روزانہ کے آپریشنز کے دوران تیز نظر ثانی کے لئے بہترین ہے۔

## تعلیمی مقاصد

اس چیٹ شیٹ کو استعمال کرتے ہوئے، آپ:
- اہم Azure Developer CLI کمانڈز اور نحو تک فوری رسائی حاصل کریں گے
- کمانڈ کی تنظیم کو فنکشنل زمرہ جات اور استعمال کی صورتوں کے لحاظ سے سمجھیں گے
- عمومی ترقی اور تعیناتی کے منظرناموں کے عملی مثالوں کو حوالہ دیں گے
- جلد مسئلہ حل کرنے کے لئے خرابی تلاش کرنے والی کمانڈز تک رسائی حاصل کریں گے
- اعلی درجہ کی تشکیل اور تخصیص کے اختیارات مؤثر طریقے سے تلاش کریں گے
- ماحولیاتی انتظام اور کثیر ماحول ورک فلو کمانڈز کو تلاش کریں گے

## تعلیمی نتائج

اس چیٹ شیٹ کا باقاعدہ حوالہ دے کر، آپ قابل ہو جائیں گے:
- مکمل دستاویزات کے بغیر azd کمانڈز کو اعتماد کے ساتھ انجام دیں
- مناسب تشخیصی کمانڈز کے ذریعے عمومی مسائل کو جلد حل کریں
- کثیر ماحولیاتی اور تعیناتی کے منظرناموں کو مؤثر طریقے سے منظم کریں
- ضرورت کے مطابق اعلی درجے کی azd خصوصیات اور تشکیل کے اختیارات استعمال کریں
- ترتیب وار کمانڈ سلسلوں کے ذریعے تعیناتی کے مسائل کو حل کریں
- مؤثر طریقے سے azd شارٹ کٹ اور اختیارات کے ذریعے ورک فلو کو بہتر بنائیں

## شروع کرنے کی کمانڈز

### توثیق
```bash
# Login to Azure via AZD
azd auth login

# Optional: login separately for exercises or hooks that run Azure CLI
az login

# Check Azure CLI's current account (not AZD's login)
az account show

# Set default subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Logout from AZD
azd auth logout

# Logout from Azure CLI
az logout
```

### پروجیکٹ کی ابتدا
```bash
# Browse available templates
azd template list

# Initialize from a template in the current empty directory (alternatives)
azd init --template todo-nodejs-mongo .
azd init --template <template-name> .

# Initialize in current directory
azd init .

# Initialize with custom name
azd init --template todo-nodejs-mongo my-awesome-app
cd my-awesome-app
```

## بنیادی تعیناتی کمانڈز

### مکمل تعیناتی ورک فلو
```bash
# Deploy everything (provision + deploy)
azd up

# Deploy with confirmation prompts disabled
azd up --no-prompt

# Deploy to specific environment
azd up --environment production

# Persist the region before deployment
azd env set AZURE_LOCATION westus2
azd up
```

### صرف انفراسٹرکچر
```bash
# Provision Azure resources
azd provision

# 🧪 Preview infrastructure changes
azd provision --preview
# Uses provider-specific planning (Bicep what-if / Terraform plan)
# It can require Azure reads and can run configured lifecycle hooks
```

### صرف ایپلیکیشن
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy web
azd deploy api

# Deploy all services
azd deploy --all
```

### تعمیر اور پیکیج
```bash
# Restore (download) application dependencies
azd restore

# Restore a specific service
azd restore api

# Build a deployable artifact without deploying
azd package

# Build specific service
azd package api
```

> **`azd restore`** آپ کی ایپ کی منحصرات (npm, pip, NuGet, Maven، وغیرہ) ڈاؤن لوڈ کرتا ہے۔ یہ خودکار طور پر `azd package` اور `azd deploy` کے دوران چلتا ہے، اس لیے آپ اس کو براہ راست کم ہی کال کرتے ہیں—دستی طور پر چلائیں تاکہ منحصرات پہلے سے حاصل ہو جائیں (مثلاً، CI کیش کو گرم کرنے یا بعد میں آف لائن کام کرنے کے لئے)۔

> **`azd package`** ایک تعیناتی کے قابل آرٹیفیکٹ تیار کرتا ہے بغیر ایپلیکیشن سروس تعینات کیے۔ رویہ زبان اور میزبان پر منحصر ہے: کنٹینر پیکیجنگ Azure ریموٹ بلڈز استعمال کر سکتا ہے اور رجسٹری کو تصاویر شائع کر سکتا ہے، لہذا یہ لازمی طور پر آف لائن یا Azure تحریروں سے آزاد نہیں ہے۔ `azd deploy` خودکار طریقے سے پیکیج کر سکتا ہے؛ جب آرٹیفیکٹ یا بلڈ چیک کی ضرورت ہو تو الگ پیکیج مرحلہ استعمال کریں۔


## 🌍 ماحول کا انتظام

### ماحولیاتی آپریشنز
```bash
# List all environments
azd env list

# Create new environment
azd env new development
azd env new staging --location westus2

# Select environment
azd env select production

# Show available environments
azd env list

# Refresh environment state
azd env refresh
```

### ماحولیاتی متغیرات
```bash
# Set environment variable
azd env set LOG_LEVEL info
azd env set DEBUG true

# Get environment variable
azd env get-value LOG_LEVEL

# List all environment variables
azd env get-values

# Remove environment variable (beta in AZD 1.37.0+)
azd env unset DEBUG
```

ماحولیاتی فائلیں سادہ متن ہوتی ہیں۔ `azd env set` کو راز کی ذخیرہ اندوزی نہ سمجھیں؛ مناسب طریقے سے کی والٹ حوالہ جات یا منظم شناخت استعمال کریں۔

## ⚙️ تشکیل کمانڈز

### عالمی تشکیل
```bash
# List all configuration
azd config show

# Set global defaults
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Remove configuration
azd config unset defaults.location

# Reset all configuration
azd config reset
```

### پروجیکٹ کی تشکیل
```bash
# Inspect user configuration (this is not azure.yaml validation)
azd config show

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 نگرانی اور تشخیص

### نگرانی ڈیش بورڈ
```bash
# Open Azure portal monitoring dashboard
azd monitor

# Open Application Insights live metrics
azd monitor --live

# Open Application Insights logs blade
azd monitor --logs

# Open Application Insights overview
azd monitor --overview
```

ایپلیکیشن انسائٹس ٹیمپلیٹ کے ذریعے ترتیب دی جانی چاہیے۔ AZD کا Live Metrics آپشن فی الحال Python ایپلیکیشنز کے لیے سپورٹ نہیں کرتا؛ اس کی بجائے اوور ویو، لاگز، یا سیمپل کی دستاویزی شدہ ٹریسنگ ورک فلو استعمال کریں۔

### کنٹینر لاگز دیکھنا
```bash
# View logs via Azure CLI (for Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Follow logs in real-time
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# View logs from Azure Portal
azd monitor --logs
```

### لاگ انیلیٹکس سوالات
```bash
# Access Log Analytics via Azure Portal
azd monitor --logs

# Query logs using Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ دیکھ بھال کے کمانڈز

### صفائی
```bash
# Remove all Azure resources
azd down

# Force delete without confirmation
azd down --force

# Purge soft-deleted resources
azd down --purge

# Complete cleanup
azd down --force --purge
```

### اپڈیٹس
```bash
# Check for azd updates
azd version

# Get current version
azd version

# View current configuration
azd config show
```

## 🔧 اعلیٰ درجے کے کمانڈز

### پائپ لائن اور CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Inspect supported pipeline configuration options
azd pipeline config --help
```

### انفراسٹرکچر مینجمنٹ
```bash
# Generate infrastructure templates
azd infra generate

# 🧪 Infrastructure Preview & Planning
azd provision --preview
# Simulates infrastructure provisioning without deploying
# Analyzes Bicep/Terraform templates and shows:
# - Resources to be added (green +)
# - Resources to be modified (yellow ~) 
# - Resources to be deleted (red -)
# Review provider behavior and configured hooks before treating preview as read-only

# Inspect supported infrastructure operations
azd infra --help
```

### پروجیکٹ کی معلومات
```bash
# Show project status and endpoints
azd show

# Show detailed project info as JSON
azd show --output json

# Get service endpoints
azd show --output json | jq '.services'
```

## 🤖 اے آئی اور توسیعات کمانڈز

### AZD توسیعات

Foundry GA حوالہ 2026-11-09 کو اپ ڈیٹ کیا گیا: `microsoft.foundry` بنڈل 1.0، اعلان شدہ [5 نومبر 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/)۔ `azd >= 1.37.0` استعمال کریں؛ اجزاء آزادانہ طور پر ورژن کیے جاتے ہیں اور اختیاری پیش نظارہ فیچرز اپنی ذاتی حیثیت رکھتے ہیں۔

```bash
# List all available extensions (including AI)
azd extension list

# Check/update the core CLI before updating extensions
azd version
azd update

# Install the GA bundle (agents, connections, inspector, projects,
# routines, skills, and toolboxes)
azd ext install microsoft.foundry

# Install the separate evaluations extension
azd extension install azure.ai.evaluations

# Install the fine-tuning extension
azd extension install azure.ai.finetune

# Install the custom models extension
azd extension install azure.ai.models

# Inspect installed versions and upgrade the bundle
azd ext list --installed
azd ext upgrade microsoft.foundry
```

بنڈل میں ایوالویشنز، ڈیٹاسیٹس، فائن ٹوننگ، یا کسٹم ماڈلز شامل نہیں ہیں۔ انفرادی کور ایکسٹینشنز کی تنصیب اب بھی سپورٹ کی جاتی ہے۔ Python 3.13+، موجودہ uv، اجازتیں، اور ماڈل کوٹا کے ساتھ چلانے کے لئے [GA ہوسٹڈ-ایجنٹ واک تھرو](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) دیکھیں۔

### اے آئی ایجنٹ کمانڈز
```bash
# Initialize an agent project interactively
azd ai agent init

# Or adopt a current azure.yaml agent project template
azd ai agent init --template <path-to-azure.yaml>

# Target a specific Foundry project
azd ai agent init --template <path-to-azure.yaml> --project-id <foundry-project-id>

# Adopt into a specified directory, then follow the printed cd next step
azd ai agent init --template <path-to-azure.yaml> --src ./agents/my-agent

# For a code-based hosted agent, add --deploy-mode code during init
# Review azure.yaml, then provision before running locally
azd provision
azd ai agent run

# In a second terminal in the same project directory
azd ai agent invoke --local "Explain how this agent is deployed."

# Upload source for a remote Foundry build (code mode)
azd deploy

# Test a deployed agent (prints latency + time-to-first-byte)
azd ai agent invoke

# Show the live endpoint configuration
azd ai agent endpoint show

# Review hosted-agent changes, stream logs, or diagnose permissions
azd deploy --preview
azd ai agent monitor --follow
azd ai agent doctor

# Download the deployed source of a code-based hosted agent
azd ai agent code download

# Delete a hosted agent and all its versions (--force ends active sessions)
azd ai agent delete --force
```

`--template`/`-t` نے ختم شدہ `--manifest`/`-m` ہجے کو تبدیل کر دیا ہے؛ پرانے مینیفیسٹ کو مائیگریٹ کرنے کی ضرورت ہے۔ موجودہ ایجنٹ-ابتدائی `--host containerapp` آپشن نہیں ہے۔ منظم-ہارنس، وائس، اور طویل مدتی پیش نظارہ خود مختار شیل/CI ماحول میں آپٹ ان طلب کرتے ہیں؛ [AI CLI حوالہ](../docs/chapter-08-production/production-ai-practices.md#optional-preview-features) دیکھیں۔

لوکل ٹیسٹنگ اب بھی Azure ماڈل تعیناتیوں کا استعمال کرتی ہے اور چارجز عائد کرتی ہے۔ صفائی کے لئے، `azd down` نیا بنایا گیا Foundry پروجیکٹ کا ریسورس گروپ حذف کرتا ہے، لیکن دوبارہ استعمال کیے گئے پروجیکٹ کے وسائل کو مقام پر رکھتا ہے؛ صرف غیر مطلوب وسائل کو الگ سے حذف کریں جو آپ کے ہیں۔

### اے آئی ایوالویشنز اور آپٹیمائزیشن
```bash
# Generate and review a draft dataset and rubric (Dataset and evaluator / Turn)
azd ai eval generate

# In the initialized agent project, select those assets and a judge model
azd ai eval init --name quality

# Register datasets/evaluators/eval groups, then run and inspect results
azd up
azd ai eval run start --eval quality --wait
azd ai eval run list
azd ai eval run show <run-id>
azd ai eval run output list <run-id>

# Reuse a compatible turn-level dataset evaluation for optimization
azd ai agent optimize --eval-config ./evals/azure.eval.yaml --eval <evaluation-name> --optimize-model <optimizer-deployment>
```

ایجنٹس بیٹا.22 نے پرانے ایوالویشن کمانڈز کو `azd ai eval` سے بدل دیا جو `azure.ai.evaluations` سے آیا تھا۔ نئی ایوالویشن تشکیل کیز camelCase میں ہیں۔ آپٹیمائزیشن `--config` ایک اسٹینڈ الون آپٹیمائزیشن API درخواست لیتا ہے، **نہیں** پرانا `eval.yaml` یا نیا `azure.eval.yaml`؛ ایوالویشن دوبارہ استعمال کے لئے `--eval`/`--eval-config` استعمال کریں۔ [ایوالویشن سیٹ اپ](../docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) اور [آپٹیمائزیشن مائیگریشن](../docs/chapter-08-production/production-ai-practices.md#optimization-configuration-migration) دیکھیں۔

### Foundry CI/CD
```bash
# After a successful local deployment, generate and review the pipeline
azd up
azd pipeline config

# Runner steps: install extensions, authenticate, then deploy
azd ext install microsoft.foundry azure.ai.evaluations
# Keep the generated OIDC sign-in and environment settings here
azd up --no-prompt
azd ai eval run start --eval quality --wait --no-prompt --fail-on "pass-rate=0.9"
```

رنر فریگمنٹ مکمل ورک فلو نہیں ہے۔ جائزہ شدہ ایوالویشن تشکیل اور غیر خفیہ اثاثے کمٹ کریں، ڈیٹاسیٹ/ایوالویٹر/ماڈل رسائی دیں، اور ہر مرحلے کے لیے ایک ماحول استعمال کریں۔ [تصدیق شدہ CI/CD مثال](../docs/chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration) دیکھیں۔

### MCP سرور (الفا)
```bash
# Start the MCP server for your project
azd mcp start

# Manage tool consent for MCP operations
azd copilot consent list
```

### انفراسٹرکچر جنریشن
```bash
# Generate IaC files from your project definition
azd infra generate

# Inspect supported infrastructure operations
azd infra --help
```

---

## 🎯 فوری ورک فلو

### ترقیاتی ورک فلو
```bash
# Start a new project in an explicit directory
azd init --template todo-nodejs-mongo my-project
cd my-project

# Deploy to development
azd env new dev
azd up

# Make changes and redeploy
azd deploy

# Open monitoring dashboard
azd monitor --live
```

### کثیر ماحول ورک فلو
```bash
# Set up environments
azd env new dev
azd env new staging  
azd env new production

# Deploy to dev
azd env select dev
azd up

# Test and promote to staging
azd env select staging
azd up

# Deploy to production
azd env select production
azd up
```

### خرابی حل کرنے کا ورک فلو
```bash
# Check deployment status
azd show --debug

# Validate configuration
azd config show

# Open monitoring dashboard for logs
azd monitor --logs

# Check resource status
azd show --output json
```

## 🔍 ڈیبگنگ کمانڈز

### ڈیبگ معلومات
```bash
# Enable debug output for a command
azd <command> --debug

# Disable telemetry for cleaner output
export AZURE_DEV_COLLECT_TELEMETRY=no

# Check current configuration
azd config show

# Reauthenticate AZD if needed (Azure CLI has a separate login)
azd auth login
```

### ٹیمپلیٹ ڈیبگنگ
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Inspect supported template operations
azd template --help
```

## 📁 فائل اور ڈائریکٹری کمانڈز

### پروجیکٹ ڈھانچہ
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to your project's directory
cd /path/to/your/project

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 آؤٹ پٹ فارمیٹنگ

### JSON آؤٹ پٹ
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config show --output json

# Parse with jq
azd show --output json | jq -r '.services.web.ingressUrl'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### ٹیبل آؤٹ پٹ
```bash
# Human-readable environment table
azd env list

# View deployed services
azd show --output json | jq '.services | keys'
```

## 🔧 عام کمانڈ کمبینیشنز

### صحت چیک اسکرپٹ
```bash
#!/bin/bash
# Quick health check
azd show
azd env get-values
azd monitor --logs
```

### تعیناتی کی توثیق
```bash
#!/bin/bash
# Pre-deployment validation
azd show
azd provision --preview  # Preview changes before deploying
az account show
```

### ماحول کا موازنہ
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd show --environment "$env" --output json | jq '.services'
done
```

### وسائل کی صفائی اسکرپٹ
```bash
#!/bin/bash
# Review environments, then explicitly select the one to remove
azd env list
azd down --environment <environment-name>
```

## 📝 ماحولیاتی متغیرات

### عام ماحولیاتی متغیرات
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD configuration
export AZURE_DEV_COLLECT_TELEMETRY=no
export AZD_CONFIG_DIR="$HOME/.azd"

# Application configuration
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 ہنگامی کمانڈز

### فوری اصلاحات
```bash
# Reauthenticate AZD without changing Azure CLI's account cache
azd auth login

# Force refresh environment
azd env refresh

# Redeploy all services
azd deploy

# Check deployment status
azd show --output json
```

### بازیابی کمانڈز
```bash
# Inspect before retrying; deletion/purge is not a routine recovery step
azd show
azd provision --debug

# Reprovision infrastructure only
azd provision

# Redeploy application only
azd deploy
```

## 💡 پرو ٹپس

### تیز ورک فلو کے لئے متبادل نام
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### فنکشن شارٹ کٹ
```bash
# Quick environment switching
azd-env() {
    azd env select "$1" && azd show
}

# Quick deployment with monitoring
azd-deploy-watch() {
    azd deploy "$1" && azd monitor --overview
}

# Environment status
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
# General help
azd --help
azd help

# Command-specific help
azd up --help
azd env --help
azd config --help

# Show version and build info
azd version
azd version --output json
```

### دستاویزی روابط
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**مشورہ**: اس چیٹ شیٹ کو بک مارک کریں اور آسانی سے اپنی مطلوبہ کمانڈز تلاش کرنے کے لیے `Ctrl+F` استعمال کریں!

---

**نیویگیشن**
- **پچھلا سبق**: [پریفلاٹ چیکس](../docs/chapter-06-pre-deployment/preflight-checks.md)
- **اگلا سبق**: [گلاسری](glossary.md)

---

> **💡 کیا آپ اپنے ایڈیٹر میں Azure کمانڈ مدد چاہتے ہیں؟** انسٹال کریں [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) کے ساتھ `npx skills add microsoft/github-copilot-for-azure` — AI، Foundry، تعیناتی، تشخیصات، اور مزید کے لئے 37 صلاحیتیں۔

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ڈس کلیمر**:
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے ترجمہ کی گئی ہے۔ جبکہ ہم درستگی کے لیے کوشاں ہیں، براہ کرم اس بات سے آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا عدم درستیاں ہو سکتی ہیں۔ اصل دستاویز اپنے مادری زبان میں مستند ماخذ سمجھی جائے گی۔ حساس معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کی ذمہ داری ہم قبول نہیں کرتے۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->