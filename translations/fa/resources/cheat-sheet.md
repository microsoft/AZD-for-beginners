# جدول تقلب دستورات - دستورات ضروری AZD

**مرجع سریع برای همه فصل‌ها**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../README.md)
- **📖 شروع سریع**: [فصل ۱: بنیاد و شروع سریع](../README.md#-chapter-1-foundation--quick-start)
- **🤖 دستورات هوش مصنوعی**: [فصل ۲: توسعه محور هوش مصنوعی](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 پیشرفته**: [فصل ۴: زیرساخت به عنوان کد](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## مقدمه

این جدول تقلب جامع مرجع سریع برای دستورات معمول CLI توسعه‌دهنده Azure است، که بر اساس دسته‌بندی با مثال‌های کاربردی سازمان‌دهی شده است. برای جستجوهای سریع هنگام توسعه، عیب‌یابی و عملیات روزانه در پروژه‌های azd بسیار مناسب است.

## اهداف یادگیری

با استفاده از این جدول تقلب، شما:
- دسترسی فوری به دستورات و سینتکس‌های ضروری CLI توسعه‌دهنده Azure خواهید داشت
- سازماندهی دستورات را بر اساس دسته‌های عملکردی و موارد استفاده درک خواهید کرد
- به نمونه‌های عملی برای سناریوهای معمول توسعه و استقرار مراجعه خواهید کرد
- به دستورات عیب‌یابی برای حل سریع مشکلات دسترسی خواهید داشت
- گزینه‌های پیکربندی پیشرفته و سفارشی‌سازی را به‌طور کارآمد پیدا خواهید کرد
- دستورات مدیریت محیط و گردش کار چند محیطی را پیدا خواهید کرد

## نتایج یادگیری

با مراجعه منظم به این جدول تقلب، قادر خواهید بود:
- دستورات azd را با اطمینان اجرا کنید بدون نیاز به مراجعه کامل به مستندات
- مشکلات رایج را سریع با استفاده از دستورات تشخیصی مناسب حل کنید
- محیط‌ها و سناریوهای استقرار متعدد را به‌طور کارآمد مدیریت کنید
- ویژگی‌ها و گزینه‌های پیشرفته azd را در صورت نیاز اعمال کنید
- مشکلات استقرار را با توالی‌های سیستماتیک دستورات عیب‌یابی کنید
- گردش کارها را با استفاده مؤثر از میان‌برها و گزینه‌های azd بهینه کنید

## دستورات شروع به کار

### احراز هویت
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

### راه‌اندازی پروژه
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

## دستورات اصلی استقرار

### گردش کار کامل استقرار
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

### فقط زیرساخت
```bash
# Provision Azure resources
azd provision

# 🧪 Preview infrastructure changes
azd provision --preview
# Uses provider-specific planning (Bicep what-if / Terraform plan)
# It can require Azure reads and can run configured lifecycle hooks
```

### فقط برنامه
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy web
azd deploy api

# Deploy all services
azd deploy --all
```

### ساخت و بسته‌بندی
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

> **`azd restore`** وابستگی‌های برنامه شما را دانلود می‌کند (npm، pip، NuGet، Maven و غیره). این دستور به‌صورت خودکار در طول `azd package` و `azd deploy` اجرا می‌شود، بنابراین به ندرت مستقیم آن را فراخوانی می‌کنید — برای پیش‌بارگذاری وابستگی‌ها (مثلاً برای گرم‌کردن کش CI یا کار آفلاین بعدی) آن را دستی اجرا کنید.

> **`azd package`** یک آرشیو قابل استقرار آماده می‌کند بدون اینکه سرویس برنامه را مستقر کند. رفتار آن به زبان و میزبان بستگی دارد: بسته‌بندی کانتینر می‌تواند از ساخت‌های راه دور Azure استفاده کند و تصاویر را به رجیستری منتشر کند، پس لزوماً آفلاین یا بدون نوشتن روی Azure نیست. `azd deploy` می‌تواند به‌طور خودکار بسته‌بندی کند؛ وقتی به یک آرشیو یا بررسی ساخت نیاز دارید، از مرحله بسته‌بندی جداگانه استفاده کنید.


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

# Show available environments
azd env list

# Refresh environment state
azd env refresh
```

### متغیرهای محیطی
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

فایل‌های محیطی متن ساده هستند. `azd env set` را به‌عنوان ذخیره‌سازی مخفیانه در نظر نگیرید؛ به جای آن از مراجع Key Vault یا Managed Identity به‌تناسب استفاده کنید.

## ⚙️ دستورات پیکربندی

### پیکربندی جهانی
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

### پیکربندی پروژه
```bash
# Inspect user configuration (this is not azure.yaml validation)
azd config show

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 پایش و عیب‌یابی

### داشبورد پایش
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

Application Insights باید توسط قالب تنظیم شود. گزینه Live Metrics در AZD در حال حاضر برای برنامه‌های Python پشتیبانی نمی‌شود؛ به جای آن از overview، لاگ‌ها یا گردش کار ردیابی مستند نمونه استفاده کنید.

### مشاهده لاگ‌های کانتینر
```bash
# View logs via Azure CLI (for Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Follow logs in real-time
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# View logs from Azure Portal
azd monitor --logs
```

### کوئری‌های Log Analytics
```bash
# Access Log Analytics via Azure Portal
azd monitor --logs

# Query logs using Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
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
azd version

# Get current version
azd version

# View current configuration
azd config show
```

## 🔧 دستورات پیشرفته

### خط لوله و CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Inspect supported pipeline configuration options
azd pipeline config --help
```

### مدیریت زیرساخت
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

### اطلاعات پروژه
```bash
# Show project status and endpoints
azd show

# Show detailed project info as JSON
azd show --output json

# Get service endpoints
azd show --output json | jq '.services'
```

## 🤖 دستورات AI و افزونه‌ها

### افزونه‌های AZD

مرجع Foundry GA به‌روزرسانی شد ۲۰۲۶-۱۱-۰۹: بسته `microsoft.foundry` نسخه ۱.۰، اعلام‌شده [۵ نوامبر ۲۰۲۶](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). از `azd >= 1.37.0` استفاده کنید؛ کامپوننت‌ها به‌صورت مستقل نسخه‌بندی شده‌اند و ویژگی‌های پیش‌نمایش اختیاری وضعیت خود را حفظ می‌کنند.

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

در این بسته ارزیابی‌ها، مجموعه داده‌ها، تنظیم دقیق یا مدل‌های سفارشی گنجانده نشده‌اند. نصب افزونه‌های اصلی جداگانه همچنان پشتیبانی می‌شود. برای نمونه‌ای اجرایی با Python 3.13+، uv جاری، مجوزها و سقف مدل، راهنمای [GA hosted-agent ](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) را دنبال کنید.

### دستورات عامل هوش مصنوعی
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

`--template`/`-t` جایگزین املا منسوخ شده `--manifest`/`-m` شده است؛ مانیفست‌های قدیمی نیاز به مهاجرت دارند. در حال حاضر گزینه agent-init `--host containerapp` وجود ندارد. پیش‌نمایش‌های Managed-harness، صوتی، و بلندمدت نیاز به فعال‌سازی مستقل شل/محیط CI دارند؛ به [مرجع AI CLI](../docs/chapter-08-production/production-ai-practices.md#optional-preview-features) مراجعه کنید.

آزمایش محلی هنوز از استقرار مدل‌های Azure استفاده می‌کند و هزینه دارد. برای پاکسازی، `azd down` گروه منابع پروژه Foundry تازه ایجاد شده را حذف می‌کند، اما منابع پروژه بازاستفاده‌شده را دست‌نخورده باقی می‌گذارد؛ منابع ناخواسته خود را جداگانه حذف کنید.

### ارزیابی و بهینه‌سازی هوش مصنوعی
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

Agents نسخه beta.22 دستورات ارزیابی قدیمی را با `azd ai eval` از `azure.ai.evaluations` جایگزین کرد. پیکربندی ارزیابی جدید از کلیدهای camelCase استفاده می‌کند. بهینه‌سازی `--config` درخواست API بهینه‌سازی مستقل است، **نه** قدیمی `eval.yaml` یا جدید `azure.eval.yaml`؛ برای استفاده مجدد ارزیابی از `--eval`/`--eval-config` استفاده کنید. به [تنظیم ارزیابی](../docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) و [مهاجرت بهینه‌سازی](../docs/chapter-08-production/production-ai-practices.md#optimization-configuration-migration) مراجعه کنید.

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

قطعه رانر یک گردش کار کامل نیست. پیکربندی ارزیابی بررسی شده و دارایی‌های غیرمحرمانه را کامیت کنید، مجوز دسترسی به مجموعه داده/ارزیاب/مدل را بدهید، و برای هر مرحله یک محیط استفاده کنید. نمونه CI/CD تأییدشده را ببینید [authenticated CI/CD example](../docs/chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration).

### سرور MCP (آلفا)
```bash
# Start the MCP server for your project
azd mcp start

# Manage tool consent for MCP operations
azd copilot consent list
```

### تولید زیرساخت
```bash
# Generate IaC files from your project definition
azd infra generate

# Inspect supported infrastructure operations
azd infra --help
```

---

## 🎯 گردش کارهای سریع

### گردش کار توسعه
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

### گردش کار چند محیطی
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

### گردش کار عیب‌یابی
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

## 🔍 دستورات اشکال‌زدایی

### اطلاعات اشکال‌زدایی
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

### اشکال‌زدایی قالب
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Inspect supported template operations
azd template --help
```

## 📁 دستورات فایل و دایرکتوری

### ساختار پروژه
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to your project's directory
cd /path/to/your/project

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 قالب‌بندی خروجی

### خروجی JSON
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config show --output json

# Parse with jq
azd show --output json | jq -r '.services.web.ingressUrl'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### خروجی جدول
```bash
# Human-readable environment table
azd env list

# View deployed services
azd show --output json | jq '.services | keys'
```

## 🔧 ترکیب‌های رایج دستورات

### اسکریپت چک سلامت
```bash
#!/bin/bash
# Quick health check
azd show
azd env get-values
azd monitor --logs
```

### اعتبارسنجی استقرار
```bash
#!/bin/bash
# Pre-deployment validation
azd show
azd provision --preview  # Preview changes before deploying
az account show
```

### مقایسه محیط‌ها
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd show --environment "$env" --output json | jq '.services'
done
```

### اسکریپت پاکسازی منابع
```bash
#!/bin/bash
# Review environments, then explicitly select the one to remove
azd env list
azd down --environment <environment-name>
```

## 📝 متغیرهای محیطی

### متغیرهای رایج محیطی
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

## 🚨 دستورات اضطراری

### رفع سریع مشکلات
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

### دستورات بازیابی
```bash
# Inspect before retrying; deletion/purge is not a routine recovery step
azd show
azd provision --debug

# Reprovision infrastructure only
azd provision

# Redeploy application only
azd deploy
```

## 💡 نکات حرفه‌ای

### مستعارها برای گردش کار سریع‌تر
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### کلیدهای میان‌بر تابعی
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

## 📖 راهنما و مستندات

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

**نکته**: این جدول تقلب را نشانک کنید و از `Ctrl+F` برای یافتن سریع دستورات مورد نیاز خود استفاده کنید!

---

**هدایت**
- **درس قبلی**: [بررسی‌های پیش‌پرواز](../docs/chapter-06-pre-deployment/preflight-checks.md)
- **درس بعدی**: [واژه‌نامه](glossary.md)

---

> **💡 می‌خواهید کمک دستورات Azure را در ویرایشگر خود داشته باشید؟** افزونه [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) را با `npx skills add microsoft/github-copilot-for-azure` نصب کنید — ۳۷ مهارت برای AI، Foundry، استقرار، عیب‌یابی و بیشتر.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مادری خود باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوء تفاهم یا برداشت نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->