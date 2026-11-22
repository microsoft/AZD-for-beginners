# 指令快速參考表 - 重要的 AZD 指令

<strong>所有章節速查</strong>
- **📚 課程首頁**： [初學者的 AZD](../README.md)
- **📖 快速開始**： [第一章：基礎與快速開始](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI 指令**： [第二章：AI 優先開發](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 進階**： [第四章：基礎設施即程式碼](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## 介紹

這張全面的快速參考表提供了最常用的 Azure Developer CLI 指令，依類別組織並搭配實用範例。非常適合在開發、故障排除及日常操作 azd 專案時快速查閱。

## 學習目標

使用此快速參考表，你將能夠：
- 立即取得重要的 Azure Developer CLI 指令與語法
- 理解指令依功能分類與使用情境的組織方式
- 查閱針對常見開發及部署場景的實用範例
- 使用故障排除指令快速解決問題
- 高效找到進階配置與自訂選項
- 掌握環境管理及多環境工作流程指令

## 學習成果

經常參考此快速參考表後，你將能：
- 有信心執行 azd 指令而無需查閱完整文件
- 使用合適的診斷指令快速解決常見問題
- 有效管理多個環境與部署情境
- 根據需要套用 azd 進階功能與配置選項
- 利用系統化指令序列排除部署問題
- 透過有效使用 azd 快速指令和選項優化工作流程

## 入門指令

### 認證
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

### 專案初始化
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

## 核心部署指令

### 完整部署流程
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

### 僅基礎設施
```bash
# Provision Azure resources
azd provision

# 🧪 Preview infrastructure changes
azd provision --preview
# Uses provider-specific planning (Bicep what-if / Terraform plan)
# It can require Azure reads and can run configured lifecycle hooks
```

### 僅應用程式
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy web
azd deploy api

# Deploy all services
azd deploy --all
```

### 建置與封裝
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

> **`azd restore`** 會下載您應用程式的相依套件 (npm、pip、NuGet、Maven 等)。它會在 `azd package` 和 `azd deploy` 期間自動執行，因此您很少會直接呼叫它 — 您可以手動執行它來預先取得相依套件 (例如，用於暖機 CI 快取或之後離線作業)。

> **`azd package`** 準備可部署的工件，但不部署應用服務。行為視語言和主機而定：容器封裝可以使用 Azure 遠端建置並將映像發布到註冊表，因此不一定是離線的或沒有 Azure 寫入。`azd deploy` 可以自動封裝；當需要工件或建置檢查時，請使用單獨的封裝步驟。


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

# Show available environments
azd env list

# Refresh environment state
azd env refresh
```

### 環境變數
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

環境檔案是純文字。請勿將 `azd env set` 視為秘密存儲；請視情況使用 Key Vault 參考或受管身分。

## ⚙️ 配置指令

### 全域設定
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

### 專案設定
```bash
# Inspect user configuration (this is not azure.yaml validation)
azd config show

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 監控與診斷

### 監控面板
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

必須由範本設定 Application Insights。AZD 的即時指標功能目前不支援 Python 應用程式；請改用總覽、日誌或範例中記錄的追蹤工作流程。

### 檢視容器日誌
```bash
# View logs via Azure CLI (for Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Follow logs in real-time
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# View logs from Azure Portal
azd monitor --logs
```

### Log Analytics 查詢
```bash
# Access Log Analytics via Azure Portal
azd monitor --logs

# Query logs using Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
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
azd version

# Get current version
azd version

# View current configuration
azd config show
```

## 🔧 進階指令

### 流水線與 CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Inspect supported pipeline configuration options
azd pipeline config --help
```

### 基礎架構管理
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

### 專案資訊
```bash
# Show project status and endpoints
azd show

# Show detailed project info as JSON
azd show --output json

# Get service endpoints
azd show --output json | jq '.services'
```

## 🤖 AI 與擴充指令

### AZD 擴充功能

Foundry GA 參考更新至 2026-11-09：`microsoft.foundry` 套件 1.0，於 [2026 年 11 月 5 日](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/) 發布。請使用 `azd >= 1.37.0`；元件獨立版本控制，且可選的預覽功能保有其自身狀態。

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

套件不包含評估、資料集、微調或自訂模型。仍支援安裝獨立核心擴充功能。請參考 [GA 托管代理實作步驟](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga)，獲得可運行的 Python 3.13+ 範例，包含當前的 uv、權限與模型配額。

### AI 代理指令
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

`--template`/`-t` 取代已淘汰的 `--manifest`/`-m` 寫法；舊版清單需進行移植。目前沒有 agent-init `--host containerapp` 選項。受管環境、語音與長時間執行的預覽功能需獨立在 shell/CI 環境中啟用；詳見 [AI CLI 參考](../docs/chapter-08-production/production-ai-practices.md#optional-preview-features)。

本地測試仍使用 Azure 模型部署，並會產生費用。若要清理，`azd down` 會刪除剛建立的 Foundry 專案資源群組，但保留重用專案的資源；請另行移除您不需要的資源。

### AI 評估與優化
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

Agents beta.22 用 `azd ai eval` 取代了來自 `azure.ai.evaluations` 的舊有評估指令。新的評估配置使用駝峰式命名鍵。優化 `--config` 採用獨立的優化 API 請求，<strong>非</strong>舊有的 `eval.yaml` 或新的 `azure.eval.yaml`；請使用 `--eval`/`--eval-config` 來重複利用評估。請見 [評估設定](../docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) 和 [優化遷移](../docs/chapter-08-production/production-ai-practices.md#optimization-configuration-migration)。

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

這個 runner 片段並不是完整的工作流程。提交經審核的評估配置和非機密資產，授予資料集/評估者/模型存取權，並為每個階段使用一個環境。請見 [帶身分驗證的 CI/CD 範例](../docs/chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration)。

### MCP 伺服器 (Alpha)
```bash
# Start the MCP server for your project
azd mcp start

# Manage tool consent for MCP operations
azd copilot consent list
```

### 基礎設施生成
```bash
# Generate IaC files from your project definition
azd infra generate

# Inspect supported infrastructure operations
azd infra --help
```

---

## 🎯 快速工作流程

### 開發工作流程
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

### 疑難排解工作流程
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

## 🔍 除錯指令

### 除錯資訊
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

### 模板除錯
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Inspect supported template operations
azd template --help
```

## 📁 檔案與目錄指令

### 專案結構
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to your project's directory
cd /path/to/your/project

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 輸出格式化

### JSON 輸出
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config show --output json

# Parse with jq
azd show --output json | jq -r '.services.web.ingressUrl'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### 表格輸出
```bash
# Human-readable environment table
azd env list

# View deployed services
azd show --output json | jq '.services | keys'
```

## 🔧 常用指令組合

### 健康檢查腳本
```bash
#!/bin/bash
# Quick health check
azd show
azd env get-values
azd monitor --logs
```

### 部署驗證
```bash
#!/bin/bash
# Pre-deployment validation
azd show
azd provision --preview  # Preview changes before deploying
az account show
```

### 環境比較
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd show --environment "$env" --output json | jq '.services'
done
```

### 資源清理腳本
```bash
#!/bin/bash
# Review environments, then explicitly select the one to remove
azd env list
azd down --environment <environment-name>
```

## 📝 環境變數

### 常用環境變數
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

## 🚨 緊急指令

### 快速修復
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

### 回復指令
```bash
# Inspect before retrying; deletion/purge is not a routine recovery step
azd show
azd provision --debug

# Reprovision infrastructure only
azd provision

# Redeploy application only
azd deploy
```

## 💡 專家提示

### 流程加速別名
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### 函式捷徑
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

<strong>提示</strong>：將此速查表加入書籤，並使用 `Ctrl+F` 快速找到你需要的指令！

---

<strong>導覽</strong>
- <strong>上一課</strong>： [預飛行檢查](../docs/chapter-06-pre-deployment/preflight-checks.md)
- <strong>下一課</strong>： [術語表](glossary.md)

---

> **💡 想在編輯器中獲得 Azure 指令幫助？** 安裝 [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) 與 `npx skills add microsoft/github-copilot-for-azure` — 包含 37 種 AI、Foundry、部署、診斷及其他技能。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
此文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們努力追求準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用此翻譯所產生的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->