# برگه تقلب دستورات - دستورات ضروری AZD

**مرجع سریع برای همه فصل‌ها**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../README.md)
- **📖 شروع سریع**: [فصل 1: پایه و شروع سریع](../README.md#-chapter-1-foundation--quick-start)
- **🤖 دستورات هوش مصنوعی**: [فصل 2: توسعه مبتنی بر هوش مصنوعی](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 پیشرفته**: [فصل 4: زیرساخت به عنوان کد](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## مقدمه

این برگه تقلب جامع، مرجع سریعی برای پرکاربردترین دستورات CLI توسعه‌دهنده Azure ارائه می‌دهد که بر اساس دسته‌بندی‌ها با مثال‌های عملی سازماندهی شده است. مناسب برای جستجوی سریع در طول توسعه، رفع اشکال و عملیات روزانه با پروژه‌های azd.

## اهداف یادگیری

با استفاده از این برگه تقلب، شما:
- به دستورات ضروری CLI توسعه‌دهنده Azure و نحو آن‌ها دسترسی فوری خواهید داشت
- سازماندهی دستورات بر اساس دسته‌بندی‌های عملکردی و موارد استفاده را درک خواهید کرد
- به مثال‌های عملی برای سناریوهای رایج توسعه و استقرار مراجعه خواهید کرد
- دستورات رفع اشکال برای حل سریع مشکلات را پیدا خواهید کرد
- گزینه‌های پیکربندی پیشرفته و سفارشی‌سازی را به‌طور مؤثر پیدا خواهید کرد
- دستورات مدیریت محیط و جریان کاری چند محیطی را پیدا خواهید کرد

## نتایج یادگیری

با مراجعه منظم به این برگه تقلب، شما قادر خواهید بود:
- دستورات azd را با اطمینان اجرا کنید بدون نیاز به مراجعه به مستندات کامل
- مشکلات رایج را به سرعت با استفاده از دستورات تشخیصی مناسب حل کنید
- محیط‌های متعدد و سناریوهای استقرار را به‌طور مؤثر مدیریت کنید
- ویژگی‌ها و گزینه‌های پیکربندی پیشرفته azd را در صورت نیاز اعمال کنید
- مشکلات استقرار را با استفاده از توالی‌های دستوری سیستماتیک رفع کنید
- جریان‌های کاری را از طریق استفاده مؤثر از میانبرها و گزینه‌های azd بهینه کنید

## دستورات شروع کار

### احراز هویت
```bash
# Login to Azure (uses Azure CLI)
az login

# Check current account
az account show

# Set default subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### راه‌اندازی پروژه
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

## دستورات اصلی استقرار

### جریان کاری کامل استقرار
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

### فقط زیرساخت
```bash
# Provision Azure resources
azd provision

# 🧪 Preview infrastructure changes (NEW)
azd provision --preview
# Shows a dry-run view of what resources would be created/modified/deleted
# Similar to 'terraform plan' or 'bicep what-if' - safe to run, no changes applied

# Provision with what-if analysis
azd provision --what-if
```

### فقط برنامه
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy all services
azd deploy --all
```

### ساخت و بسته‌بندی
```bash
# Build applications
azd package

# Build specific service
azd package --service api
```

## 🌍 مدیریت محیط

### عملیات محیط
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

### متغیرهای محیط
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

## ⚙️ دستورات پیکربندی

### پیکربندی جهانی
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

### پیکربندی پروژه
```bash
# Validate azure.yaml
azd config validate

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 نظارت و گزارش‌ها

### گزارش‌های برنامه
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

### نظارت
```bash
# Open Azure portal for monitoring
azd monitor

# Open Application Insights
azd monitor --insights
```

## 🛠️ دستورات نگهداری

### پاکسازی
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

### به‌روزرسانی‌ها
```bash
# Check for azd updates
azd version --check-for-updates

# Get current version
azd version

# Show system information
azd info
```

## 🔧 دستورات پیشرفته

### خط لوله و CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Show pipeline configuration
azd pipeline show
```

### مدیریت زیرساخت
```bash
# Import existing resources
azd infra import

# Export infrastructure template
azd infra export

# Validate infrastructure
azd infra validate

# 🧪 Infrastructure Preview & Planning (NEW)
azd provision --preview
# Simulates infrastructure provisioning without deploying
# Analyzes Bicep/Terraform templates and shows:
# - Resources to be added (green +)
# - Resources to be modified (yellow ~) 
# - Resources to be deleted (red -)
# Safe to run - no actual changes made to Azure environment
```

### مدیریت سرویس
```bash
# List all services
azd service list

# Show service details
azd service show --service web

# Restart service
azd service restart --service api
```

## 🎯 جریان‌های کاری سریع

### جریان کاری توسعه
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

### جریان کاری چند محیطی
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

### جریان کاری رفع اشکال
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

## 🔍 دستورات اشکال‌زدایی

### اطلاعات اشکال‌زدایی
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

### اشکال‌زدایی قالب
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Validate template before init
azd template validate <template-name>
```

## 📁 دستورات فایل و دایرکتوری

### ساختار پروژه
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to azd project root
cd $(azd root)

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 قالب‌بندی خروجی

### خروجی JSON
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config list --output json

# Parse with jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### خروجی جدول
```bash
# Format as table
azd env list --output table
azd service list --output table
```

## 🔧 ترکیب‌های رایج دستورات

### اسکریپت بررسی سلامت
```bash
#!/bin/bash
# Quick health check
azd show
azd env show
azd logs --level error --since 10m
```

### اعتبارسنجی استقرار
```bash
#!/bin/bash
# Pre-deployment validation
azd config validate
azd provision --preview  # 🧪 NEW: Preview changes before deploying
az account show
```

### مقایسه محیط
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### اسکریپت پاکسازی منابع
```bash
#!/bin/bash
# Clean up old environments
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 متغیرهای محیط

### متغیرهای محیط رایج
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

## 🚨 دستورات اضطراری

### رفع سریع
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

### دستورات بازیابی
```bash
# Recover from failed deployment
azd provision --continue-on-error
azd deploy --ignore-errors

# Clean slate recovery
azd down --force
azd up --confirm-with-no-prompt
```

## 💡 نکات حرفه‌ای

### نام مستعار برای جریان کاری سریع‌تر
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up --confirm-with-no-prompt'
alias azdl='azd logs --follow'
alias azds='azd show --output json'
alias azde='azd env'
```

### میانبرهای عملکرد
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

## 📖 کمک و مستندات

### دریافت کمک
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

### لینک‌های مستندات
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**نکته**: این برگه تقلب را نشانه‌گذاری کنید و از `Ctrl+F` برای یافتن سریع دستورات مورد نیاز استفاده کنید!

---

**ناوبری**
- **درس قبلی**: [بررسی‌های پیش از استقرار](../docs/pre-deployment/preflight-checks.md)
- **درس بعدی**: [واژه‌نامه](glossary.md)

---

**سلب مسئولیت**:  
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما تلاش می‌کنیم دقت را حفظ کنیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌ها باشند. سند اصلی به زبان اصلی آن باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حساس، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما مسئولیتی در قبال سوء تفاهم‌ها یا تفسیرهای نادرست ناشی از استفاده از این ترجمه نداریم.