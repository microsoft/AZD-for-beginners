<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "0b97d7e7c56825f0da031b9706d7f1ca",
  "translation_date": "2025-09-17T13:15:41+00:00",
  "source_file": "resources/cheat-sheet.md",
  "language_code": "hk"
}
-->
# 指令速查表 - AZD 必備指令

**所有章節快速參考**
- **📚 課程首頁**: [AZD 初學者指南](../README.md)
- **📖 快速入門**: [第1章：基礎與快速入門](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI 指令**: [第2章：AI優先開發](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 進階**: [第4章：基礎架構即程式碼](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## 簡介

這份全面的速查表提供了最常用的 Azure Developer CLI 指令的快速參考，按類別組織並附有實用範例。非常適合在開發、故障排除以及日常操作 AZD 專案時快速查閱。

## 學習目標

使用這份速查表，您將能夠：
- 即時獲取重要的 Azure Developer CLI 指令及語法
- 理解指令按功能類別及使用案例的組織方式
- 參考常見開發與部署場景的實用範例
- 獲取故障排除指令以快速解決問題
- 高效找到進階配置及自訂選項
- 掌握環境管理及多環境工作流程指令

## 學習成果

經常參考這份速查表，您將能夠：
- 自信地執行 AZD 指令而無需查閱完整文件
- 使用適當的診斷指令快速解決常見問題
- 高效管理多個環境及部署場景
- 根據需要應用 AZD 的進階功能及配置選項
- 使用系統化指令序列排除部署問題
- 通過有效使用 AZD 快捷方式及選項優化工作流程

## 入門指令

### 身份驗證
```bash
# Login to Azure (uses Azure CLI)
az login

# Check current account
az account show

# Set default subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### 專案初始化
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

## 核心部署指令

### 完整部署工作流程
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

### 僅部署基礎架構
```bash
# Provision Azure resources
azd provision

# Preview infrastructure changes
azd provision --preview

# Provision with what-if analysis
azd provision --what-if
```

### 僅部署應用程式
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy all services
azd deploy --all
```

### 建置與打包
```bash
# Build applications
azd package

# Build specific service
azd package --service api
```

## 🌍 環境管理

### 環境操作
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

### 環境變數
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

## ⚙️ 配置指令

### 全域配置
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

### 專案配置
```bash
# Validate azure.yaml
azd config validate

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 監控與日誌

### 應用程式日誌
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

### 監控
```bash
# Open Azure portal for monitoring
azd monitor

# Open Application Insights
azd monitor --insights
```

## 🛠️ 維護指令

### 清理
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

### 更新
```bash
# Check for azd updates
azd version --check-for-updates

# Get current version
azd version

# Show system information
azd info
```

## 🔧 進階指令

### 管道與 CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Show pipeline configuration
azd pipeline show
```

### 基礎架構管理
```bash
# Import existing resources
azd infra import

# Export infrastructure template
azd infra export

# Validate infrastructure
azd infra validate
```

### 服務管理
```bash
# List all services
azd service list

# Show service details
azd service show --service web

# Restart service
azd service restart --service api
```

## 🎯 快速工作流程

### 開發工作流程
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

### 多環境工作流程
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

### 故障排除工作流程
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

## 🔍 除錯指令

### 除錯資訊
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

### 模板除錯
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Validate template before init
azd template validate <template-name>
```

## 📁 檔案與目錄指令

### 專案結構
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to azd project root
cd $(azd root)

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 輸出格式化

### JSON 輸出
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config list --output json

# Parse with jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### 表格輸出
```bash
# Format as table
azd env list --output table
azd service list --output table
```

## 🔧 常用指令組合

### 健康檢查腳本
```bash
#!/bin/bash
# Quick health check
azd show
azd env show
azd logs --level error --since 10m
```

### 部署驗證
```bash
#!/bin/bash
# Pre-deployment validation
azd config validate
azd provision --preview
az account show
```

### 環境比較
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### 資源清理腳本
```bash
#!/bin/bash
# Clean up old environments
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 環境變數

### 常見環境變數
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

## 🚨 緊急指令

### 快速修復
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

### 恢復指令
```bash
# Recover from failed deployment
azd provision --continue-on-error
azd deploy --ignore-errors

# Clean slate recovery
azd down --force
azd up --confirm-with-no-prompt
```

## 💡 專業提示

### 快速工作流程的別名
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up --confirm-with-no-prompt'
alias azdl='azd logs --follow'
alias azds='azd show --output json'
alias azde='azd env'
```

### 功能快捷方式
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

## 📖 幫助與文件

### 獲取幫助
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

### 文件連結
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**提示**: 收藏這份速查表，並使用 `Ctrl+F` 快速找到您需要的指令！

---

**導航**
- **上一課**: [部署前檢查](../docs/pre-deployment/preflight-checks.md)
- **下一課**: [術語表](glossary.md)

---

**免責聲明**：  
本文件已使用人工智能翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們致力於提供準確的翻譯，但請注意，自動翻譯可能包含錯誤或不準確之處。原始語言的文件應被視為權威來源。對於重要資訊，建議使用專業的人類翻譯。我們對因使用此翻譯而引起的任何誤解或錯誤解釋概不負責。