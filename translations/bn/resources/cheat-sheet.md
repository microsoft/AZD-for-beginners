<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "2a5f480ef9bf86e8f4dd1340d077fff3",
  "translation_date": "2025-10-24T16:56:33+00:00",
  "source_file": "resources/cheat-sheet.md",
  "language_code": "bn"
}
-->
# কমান্ড চিট শিট - গুরুত্বপূর্ণ AZD কমান্ডসমূহ

**সব অধ্যায়ের দ্রুত রেফারেন্স**
- **📚 কোর্স হোম**: [AZD For Beginners](../README.md)
- **📖 দ্রুত শুরু**: [অধ্যায় ১: ভিত্তি ও দ্রুত শুরু](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI কমান্ডসমূহ**: [অধ্যায় ২: AI-প্রথম উন্নয়ন](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 উন্নত**: [অধ্যায় ৪: কোড হিসেবে অবকাঠামো](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## পরিচিতি

এই বিস্তৃত চিট শিটটি সবচেয়ে বেশি ব্যবহৃত Azure Developer CLI কমান্ডগুলোর দ্রুত রেফারেন্স প্রদান করে, যা বিভাগ অনুযায়ী সংগঠিত এবং ব্যবহারিক উদাহরণসহ। এটি উন্নয়ন, সমস্যা সমাধান এবং দৈনন্দিন AZD প্রকল্প পরিচালনার সময় দ্রুত রেফারেন্সের জন্য উপযুক্ত।

## শেখার লক্ষ্য

এই চিট শিট ব্যবহার করে আপনি:
- গুরুত্বপূর্ণ Azure Developer CLI কমান্ড এবং সিনট্যাক্সের তাৎক্ষণিক অ্যাক্সেস পাবেন
- কার্যকরী বিভাগ এবং ব্যবহার কেস অনুযায়ী কমান্ড সংগঠনের ধারণা পাবেন
- সাধারণ উন্নয়ন এবং ডিপ্লয়মেন্ট পরিস্থিতির জন্য ব্যবহারিক উদাহরণ রেফারেন্স করতে পারবেন
- দ্রুত সমস্যা সমাধানের জন্য ট্রাবলশুটিং কমান্ড খুঁজে পাবেন
- উন্নত কনফিগারেশন এবং কাস্টমাইজেশন অপশন সহজে খুঁজে পাবেন
- পরিবেশ ব্যবস্থাপনা এবং বহু-পরিবেশের ওয়ার্কফ্লো কমান্ড খুঁজে পাবেন

## শেখার ফলাফল

এই চিট শিট নিয়মিত রেফারেন্স করে আপনি:
- সম্পূর্ণ ডকুমেন্টেশন রেফারেন্স না করেই আত্মবিশ্বাসের সাথে azd কমান্ড চালাতে পারবেন
- সঠিক ডায়াগনস্টিক কমান্ড ব্যবহার করে সাধারণ সমস্যাগুলো দ্রুত সমাধান করতে পারবেন
- একাধিক পরিবেশ এবং ডিপ্লয়মেন্ট পরিস্থিতি দক্ষতার সাথে পরিচালনা করতে পারবেন
- প্রয়োজন অনুযায়ী উন্নত azd ফিচার এবং কনফিগারেশন অপশন প্রয়োগ করতে পারবেন
- সিস্টেমেটিক কমান্ড সিকোয়েন্স ব্যবহার করে ডিপ্লয়মেন্ট সমস্যাগুলো সমাধান করতে পারবেন
- কার্যকরভাবে azd শর্টকাট এবং অপশন ব্যবহার করে ওয়ার্কফ্লো অপ্টিমাইজ করতে পারবেন

## শুরু করার কমান্ডসমূহ

### প্রমাণীকরণ
```bash
# Login to Azure (uses Azure CLI)
az login

# Check current account
az account show

# Set default subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### প্রকল্প আরম্ভ
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

## মূল ডিপ্লয়মেন্ট কমান্ডসমূহ

### সম্পূর্ণ ডিপ্লয়মেন্ট ওয়ার্কফ্লো
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

### শুধুমাত্র অবকাঠামো
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

### শুধুমাত্র অ্যাপ্লিকেশন
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy all services
azd deploy --all
```

### বিল্ড এবং প্যাকেজ
```bash
# Build applications
azd package

# Build specific service
azd package --service api
```

## 🌍 পরিবেশ ব্যবস্থাপনা

### পরিবেশ অপারেশন
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

### পরিবেশ ভেরিয়েবল
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

## ⚙️ কনফিগারেশন কমান্ডসমূহ

### গ্লোবাল কনফিগারেশন
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

### প্রকল্প কনফিগারেশন
```bash
# Validate azure.yaml
azd config validate

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 মনিটরিং এবং লগ

### অ্যাপ্লিকেশন লগ
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

### মনিটরিং
```bash
# Open Azure portal for monitoring
azd monitor

# Open Application Insights
azd monitor --insights
```

## 🛠️ রক্ষণাবেক্ষণ কমান্ডসমূহ

### ক্লিনআপ
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

### আপডেট
```bash
# Check for azd updates
azd version --check-for-updates

# Get current version
azd version

# Show system information
azd info
```

## 🔧 উন্নত কমান্ডসমূহ

### পাইপলাইন এবং CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Show pipeline configuration
azd pipeline show
```

### অবকাঠামো ব্যবস্থাপনা
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

### সার্ভিস ব্যবস্থাপনা
```bash
# List all services
azd service list

# Show service details
azd service show --service web

# Restart service
azd service restart --service api
```

## 🎯 দ্রুত ওয়ার্কফ্লো

### উন্নয়ন ওয়ার্কফ্লো
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

### বহু-পরিবেশ ওয়ার্কফ্লো
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

### ট্রাবলশুটিং ওয়ার্কফ্লো
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

## 🔍 ডিবাগিং কমান্ডসমূহ

### ডিবাগ তথ্য
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

### টেমপ্লেট ডিবাগিং
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Validate template before init
azd template validate <template-name>
```

## 📁 ফাইল এবং ডিরেক্টরি কমান্ডসমূহ

### প্রকল্প কাঠামো
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to azd project root
cd $(azd root)

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 আউটপুট ফরম্যাটিং

### JSON আউটপুট
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config list --output json

# Parse with jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### টেবিল আউটপুট
```bash
# Format as table
azd env list --output table
azd service list --output table
```

## 🔧 সাধারণ কমান্ড সংমিশ্রণ

### স্বাস্থ্য পরীক্ষা স্ক্রিপ্ট
```bash
#!/bin/bash
# Quick health check
azd show
azd env show
azd logs --level error --since 10m
```

### ডিপ্লয়মেন্ট যাচাইকরণ
```bash
#!/bin/bash
# Pre-deployment validation
azd config validate
azd provision --preview  # 🧪 NEW: Preview changes before deploying
az account show
```

### পরিবেশ তুলনা
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### রিসোর্স ক্লিনআপ স্ক্রিপ্ট
```bash
#!/bin/bash
# Clean up old environments
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 পরিবেশ ভেরিয়েবল

### সাধারণ পরিবেশ ভেরিয়েবল
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

## 🚨 জরুরি কমান্ডসমূহ

### দ্রুত সমাধান
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

### পুনরুদ্ধার কমান্ডসমূহ
```bash
# Recover from failed deployment
azd provision --continue-on-error
azd deploy --ignore-errors

# Clean slate recovery
azd down --force
azd up --confirm-with-no-prompt
```

## 💡 প্রো টিপস

### দ্রুত ওয়ার্কফ্লোর জন্য এলিয়াস
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up --confirm-with-no-prompt'
alias azdl='azd logs --follow'
alias azds='azd show --output json'
alias azde='azd env'
```

### ফাংশন শর্টকাট
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

## 📖 সাহায্য এবং ডকুমেন্টেশন

### সাহায্য পাওয়া
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

### ডকুমেন্টেশন লিঙ্কসমূহ
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**টিপ**: এই চিট শিটটি বুকমার্ক করুন এবং `Ctrl+F` ব্যবহার করে দ্রুত প্রয়োজনীয় কমান্ড খুঁজুন!

---

**নেভিগেশন**
- **পূর্ববর্তী পাঠ**: [প্রিফ্লাইট চেক](../docs/pre-deployment/preflight-checks.md)
- **পরবর্তী পাঠ**: [শব্দকোষ](glossary.md)

---

**অস্বীকৃতি**:  
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা যথাসাধ্য সঠিকতার জন্য চেষ্টা করি, তবে অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল ভাষায় থাকা নথিটিকে প্রামাণিক উৎস হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য, পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদ ব্যবহারের ফলে কোনো ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়ী থাকব না।