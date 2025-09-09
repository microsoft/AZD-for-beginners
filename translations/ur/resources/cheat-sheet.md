<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "04291031a6a1cc0dc4064dcb9c543584",
  "translation_date": "2025-09-09T20:25:04+00:00",
  "source_file": "resources/cheat-sheet.md",
  "language_code": "ur"
}
-->
# کمانڈ چیٹ شیٹ - ضروری AZD کمانڈز

## تعارف

یہ جامع چیٹ شیٹ عام طور پر استعمال ہونے والے Azure Developer CLI کمانڈز کے لیے فوری حوالہ فراہم کرتی ہے، جو زمرہ جات کے لحاظ سے ترتیب دی گئی ہیں اور عملی مثالوں کے ساتھ۔ ترقی، خرابیوں کا پتہ لگانے، اور روزمرہ کے آپریشنز کے دوران azd پروجیکٹس کے ساتھ فوری حوالہ کے لیے بہترین۔

## سیکھنے کے اہداف

اس چیٹ شیٹ کے استعمال سے، آپ:
- ضروری Azure Developer CLI کمانڈز اور ان کے نحو تک فوری رسائی حاصل کریں گے
- کمانڈز کو فنکشنل زمرہ جات اور استعمال کے معاملات کے لحاظ سے سمجھیں گے
- عام ترقی اور تعیناتی کے منظرناموں کے لیے عملی مثالوں کا حوالہ دیں گے
- خرابیوں کا پتہ لگانے کے کمانڈز تک فوری مسئلہ حل کرنے کے لیے رسائی حاصل کریں گے
- اعلیٰ درجے کی ترتیب اور حسب ضرورت کے اختیارات کو مؤثر طریقے سے تلاش کریں گے
- ماحول کے انتظام اور کثیر ماحول ورک فلو کمانڈز کو تلاش کریں گے

## سیکھنے کے نتائج

اس چیٹ شیٹ کا باقاعدہ حوالہ دے کر، آپ:
- azd کمانڈز کو اعتماد کے ساتھ بغیر مکمل دستاویزات کا حوالہ دیے استعمال کریں گے
- مناسب تشخیصی کمانڈز کا استعمال کرتے ہوئے عام مسائل کو جلدی حل کریں گے
- متعدد ماحول اور تعیناتی کے منظرناموں کو مؤثر طریقے سے منظم کریں گے
- ضرورت کے مطابق azd کی اعلیٰ خصوصیات اور ترتیب کے اختیارات کو لاگو کریں گے
- تعیناتی کے مسائل کو منظم کمانڈ سیکوئنسز کے ذریعے حل کریں گے
- azd شارٹ کٹس اور اختیارات کے مؤثر استعمال کے ذریعے ورک فلو کو بہتر بنائیں گے

## شروع کرنے کے کمانڈز

### تصدیق
```bash
# Login to Azure (uses Azure CLI)
az login

# Check current account
az account show

# Set default subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### پروجیکٹ کی شروعات
```bash
# Browse available templates
azd template list

# Initialize from template
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Initialize in current directory
azd init .

# Initialize with custom name
azd init --template todo-nodejs-mongo my-awesome-app
```

## بنیادی تعیناتی کمانڈز

### مکمل تعیناتی ورک فلو
```bash
# Deploy everything (provision + deploy)
azd up

# Deploy with confirmation prompts disabled
azd up --confirm-with-no-prompt

# Deploy to specific environment
azd up --environment production

# Deploy with custom parameters
azd up --parameter location=westus2
```

### صرف انفراسٹرکچر
```bash
# Provision Azure resources
azd provision

# Preview infrastructure changes
azd provision --preview

# Provision with what-if analysis
azd provision --what-if
```

### صرف ایپلیکیشن
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy all services
azd deploy --all
```

### تعمیر اور پیکج
```bash
# Build applications
azd package

# Build specific service
azd package --service api
```

## 🌍 ماحول کا انتظام

### ماحول کے آپریشنز
```bash
# List all environments
azd env list

# Create new environment
azd env new development
azd env new staging --location westus2

# Select environment
azd env select production

# Show current environment
azd env show

# Refresh environment state
azd env refresh
```

### ماحول کے متغیرات
```bash
# Set environment variable
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Get environment variable
azd env get API_KEY

# List all environment variables
azd env get-values

# Remove environment variable
azd env unset DEBUG
```

## ⚙️ ترتیب کے کمانڈز

### عالمی ترتیب
```bash
# List all configuration
azd config list

# Set global defaults
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Remove configuration
azd config unset defaults.location

# Reset all configuration
azd config reset
```

### پروجیکٹ کی ترتیب
```bash
# Validate azure.yaml
azd config validate

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 مانیٹرنگ اور لاگز

### ایپلیکیشن لاگز
```bash
# View logs from all services
azd logs

# View logs from specific service
azd logs --service api

# Follow logs in real-time
azd logs --follow

# View logs since specific time
azd logs --since 1h
azd logs --since "2024-01-01 10:00:00"

# Filter logs by level
azd logs --level error
```

### مانیٹرنگ
```bash
# Open Azure portal for monitoring
azd monitor

# Open Application Insights
azd monitor --insights
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
azd version --check-for-updates

# Get current version
azd version

# Show system information
azd info
```

## 🔧 اعلیٰ درجے کے کمانڈز

### پائپ لائن اور CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Show pipeline configuration
azd pipeline show
```

### انفراسٹرکچر کا انتظام
```bash
# Import existing resources
azd infra import

# Export infrastructure template
azd infra export

# Validate infrastructure
azd infra validate
```

### سروس کا انتظام
```bash
# List all services
azd service list

# Show service details
azd service show --service web

# Restart service
azd service restart --service api
```

## 🎯 فوری ورک فلو

### ترقیاتی ورک فلو
```bash
# Start new project
azd init --template todo-nodejs-mongo
cd my-project

# Deploy to development
azd env new dev
azd up

# Make changes and redeploy
azd deploy

# View logs
azd logs --follow
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

### خرابیوں کا پتہ لگانے کا ورک فلو
```bash
# Enable debug mode
export AZD_DEBUG=true

# Check system info
azd info

# Validate configuration
azd config validate

# View detailed logs
azd logs --level debug --since 1h

# Check resource status
azd show --output json
```

## 🔍 ڈیبگنگ کمانڈز

### ڈیبگ معلومات
```bash
# Enable debug output
export AZD_DEBUG=true
azd <command> --debug

# Disable telemetry for cleaner output
export AZD_DISABLE_TELEMETRY=true

# Get system information
azd info

# Check authentication status
az account show
```

### ٹیمپلیٹ ڈیبگنگ
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Validate template before init
azd template validate <template-name>
```

## 📁 فائل اور ڈائریکٹری کمانڈز

### پروجیکٹ کی ساخت
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to azd project root
cd $(azd root)

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 آؤٹ پٹ فارمیٹنگ

### JSON آؤٹ پٹ
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config list --output json

# Parse with jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### ٹیبل آؤٹ پٹ
```bash
# Format as table
azd env list --output table
azd service list --output table
```

## 🔧 عام کمانڈ کے امتزاج

### صحت کی جانچ اسکرپٹ
```bash
#!/bin/bash
# Quick health check
azd show
azd env show
azd logs --level error --since 10m
```

### تعیناتی کی توثیق
```bash
#!/bin/bash
# Pre-deployment validation
azd config validate
azd provision --preview
az account show
```

### ماحول کا موازنہ
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### وسائل کی صفائی اسکرپٹ
```bash
#!/bin/bash
# Clean up old environments
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 ماحول کے متغیرات

### عام ماحول کے متغیرات
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD configuration
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Application configuration
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 ایمرجنسی کمانڈز

### فوری اصلاحات
```bash
# Reset authentication
az account clear
az login

# Force refresh environment
azd env refresh --force

# Restart all services
azd service restart --all

# Quick rollback
azd deploy --rollback
```

### بحالی کے کمانڈز
```bash
# Recover from failed deployment
azd provision --continue-on-error
azd deploy --ignore-errors

# Clean slate recovery
azd down --force
azd up --confirm-with-no-prompt
```

## 💡 پرو ٹپس

### تیز تر ورک فلو کے لیے عرف
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up --confirm-with-no-prompt'
alias azdl='azd logs --follow'
alias azds='azd show --output json'
alias azde='azd env'
```

### فنکشن شارٹ کٹس
```bash
# Quick environment switching
azd-env() {
    azd env select $1 && azd show
}

# Quick deployment with logs
azd-deploy-watch() {
    azd deploy --service $1 && azd logs --service $1 --follow
}

# Environment status
azd-status() {
    echo "Current environment: $(azd env show --output json | jq -r '.name')"
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

### دستاویزات کے لنکس
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**ٹپ**: اس چیٹ شیٹ کو بک مارک کریں اور `Ctrl+F` کا استعمال کریں تاکہ آپ کو مطلوبہ کمانڈز جلدی مل سکیں!

---

**نیویگیشن**
- **پچھلا سبق**: [پری فلائٹ چیکس](../docs/pre-deployment/preflight-checks.md)
- **اگلا سبق**: [اصطلاحات](glossary.md)

---

**ڈسکلیمر**:  
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کا استعمال کرتے ہوئے ترجمہ کی گئی ہے۔ ہم درستگی کے لیے کوشش کرتے ہیں، لیکن براہ کرم آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا غیر درستیاں ہو سکتی ہیں۔ اصل دستاویز کو اس کی اصل زبان میں مستند ذریعہ سمجھا جانا چاہیے۔ اہم معلومات کے لیے، پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ ہم اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کے ذمہ دار نہیں ہیں۔