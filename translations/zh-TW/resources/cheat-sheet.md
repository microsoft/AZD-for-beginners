# Command Cheat Sheet - Essential AZD Commands

<strong>章節快速參考</strong>
- **📚 課程首頁**: [AZD 初學者指南](../README.md)
- **📖 快速開始**: [第 1 章：基礎與快速開始](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI 指令**: [第 2 章：以 AI 為先的開發（建議 AI 開發者）](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 進階**: [第 4 章：基礎設施即代碼（部署）](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introduction

這份綜合備忘單提供最常用的 Azure Developer CLI 指令快速參考，依類別組織並搭配實用範例。非常適合在開發、故障排除和日常操作 azd 專案時快速查閱。

## Learning Goals

使用此備忘單，您將能：
- 立即取得重要的 Azure Developer CLI 指令與語法
- 了解依功能類別與使用情境所組織的指令
- 查閱常見開發與部署情境的實用範例
- 存取快速問題排解的診斷指令
- 有效率地找到進階設定與客製化選項
- 定位環境管理與多環境工作流程的指令

## Learning Outcomes

經常參考此備忘單，您將能夠：
- 在不查閱完整文件的情況下自信地執行 azd 指令
- 使用適當的診斷指令快速解決常見問題
- 有效率地管理多個環境與部署情境
- 在需要時應用進階 azd 功能與設定選項
- 使用系統化的指令序列排解部署問題
- 透過有效使用 azd 快捷與選項來優化工作流程

## Getting Started Commands

### Authentication
```bash
# 透過 AZD 登入 Azure
azd auth login

# 登入 Azure CLI（AZD 在底層使用它）
az login

# 檢查目前帳戶
az account show

# 設定預設訂閱
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# 從 AZD 登出
azd auth logout

# 從 Azure CLI 登出
az logout
```

### Project Initialization
```bash
# 瀏覽可用範本
azd template list

# 從範本初始化
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# 在目前目錄中初始化
azd init .

# 以自訂名稱初始化
azd init --template todo-nodejs-mongo my-awesome-app
```

## Core Deployment Commands

### Complete Deployment Workflow
```bash
# 部署所有內容（配置 + 部署）
azd up

# 部署時停用確認提示
azd up --confirm-with-no-prompt

# 部署到特定環境
azd up --environment production

# 使用自訂參數部署
azd up --parameter location=westus2
```

### Infrastructure Only
```bash
# 部署 Azure 資源
azd provision

# 🧪 預覽基礎設施變更
azd provision --preview
# 顯示資源在模擬執行（dry-run）下會被建立、修改或刪除的情況
# 類似 'terraform plan' 或 'bicep what-if' — 可安全執行，不會套用任何變更
```

### Application Only
```bash
# 部署應用程式的程式碼
azd deploy

# 部署特定的服務
azd deploy --service web
azd deploy --service api

# 部署所有服務
azd deploy --all
```

### Build and Package
```bash
# 還原（下載）應用程式的相依性
azd restore

# 還原特定服務
azd restore --service api

# 建置可部署的工件，但不進行部署
azd package

# 建置特定服務
azd package --service api
```

> **`azd restore`** 會下載您應用程式的相依性（npm、pip、NuGet、Maven 等）。它會在 `azd package` 與 `azd deploy` 期間自動執行，因此您很少會直接呼叫它——手動執行可預先抓取相依性（例如，用於暖機 CI 快取或之後離線工作）。

> **`azd package`<strong> 會建置可部署的產物（容器映像或 zip），但</strong>不會**將其推送到 Azure。單獨使用它可驗證建置是否成功、檢查輸出，或產生由其他程序稍後部署的產物。`azd deploy` 會自動打包，因此只有在您想要產物但不部署時才需要 `azd package`。

## 🌍 Environment Management

### Environment Operations
```bash
# 列出所有環境
azd env list

# 建立新環境
azd env new development
azd env new staging --location westus2

# 選擇環境
azd env select production

# 顯示可用環境
azd env list

# 重新整理環境狀態
azd env refresh
```

### Environment Variables
```bash
# 設定環境變數
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# 取得環境變數
azd env get API_KEY

# 列出所有環境變數
azd env get-values

# 移除環境變數
azd env unset DEBUG
```

## ⚙️ Configuration Commands

### Global Configuration
```bash
# 列出所有設定
azd config show

# 設定全域預設值
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# 移除設定
azd config unset defaults.location

# 重設所有設定
azd config reset
```

### Project Configuration
```bash
# 驗證 azure.yaml
azd config validate

# 顯示專案資訊
azd show

# 取得服務端點
azd show --output json
```

## 📊 Monitoring and Diagnostics

### Monitoring Dashboard
```bash
# 開啟 Azure 入口網站監控儀表板
azd monitor

# 開啟 Application Insights 即時指標
azd monitor --live

# 開啟 Application Insights 的日誌功能窗格
azd monitor --logs

# 開啟 Application Insights 概觀
azd monitor --overview
```

### Viewing Container Logs
```bash
# 透過 Azure CLI 檢視日誌 (適用於 Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# 即時追蹤日誌
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# 從 Azure 入口網站檢視日誌
azd monitor --logs
```

### Log Analytics Queries
```bash
# 透過 Azure 入口網站存取 Log Analytics
azd monitor --logs

# 使用 Azure CLI 查詢日誌
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Maintenance Commands

### Cleanup
```bash
# 刪除所有 Azure 資源
azd down

# 強制刪除，無需確認
azd down --force

# 清除已軟刪除的資源
azd down --purge

# 徹底清理
azd down --force --purge
```

### Updates
```bash
# 檢查 azd 更新
azd version

# 取得目前版本
azd version

# 檢視目前設定
azd config show
```

## 🔧 Advanced Commands

### Pipeline and CI/CD
```bash
# 設定 GitHub Actions
azd pipeline config

# 設定 Azure DevOps
azd pipeline config --provider azdo

# 顯示管線設定
azd pipeline show
```

### Infrastructure Management
```bash
# 產生基礎架構範本
azd infra generate

# 🧪 基礎架構預覽與規劃
azd provision --preview
# 模擬基礎架構佈建而不實際部署
# 分析 Bicep/Terraform 範本並顯示：
# - 將新增的資源（綠色 +）
# - 將被修改的資源（黃色 ~）
# - 將刪除的資源（紅色 -）
# 可安全執行 - 不會對 Azure 環境做出實際變更

# 從 azure.yaml 合成基礎架構
azd infra synth
```

### Project Information
```bash
# 顯示專案狀態與端點
azd show

# 以 JSON 格式顯示專案詳細資訊
azd show --output json

# 取得服務端點
azd show --output json | jq '.services'
```

## 🤖 AI & Extensions Commands

### AZD Extensions
```bash
# 列出所有可用的擴充功能（包括 AI）
azd extension list

# 安裝 Foundry agents 擴充功能
azd extension install azure.ai.agents

# 安裝 agent skills 擴充功能（預覽）
azd extension install azure.ai.skills

# 安裝 Foundry connections 擴充功能（預覽）
azd extension install azure.ai.connections

# 安裝 fine-tuning 擴充功能
azd extension install azure.ai.finetune

# 安裝 custom models 擴充功能
azd extension install azure.ai.models

# 升級所有已安裝的擴充功能
azd extension upgrade --all
```

### AI Agent Commands
```bash
# 從清單初始化代理專案
azd ai agent init -m <manifest-path-or-uri>

# 針對特定 Foundry 專案
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# 指定代理來源目錄
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# 選擇託管目標
azd ai agent init -m agent-manifest.yaml --host containerapp

# 測試已部署的代理（印出延遲與到達第一個位元組時間）
azd ai agent invoke

# 顯示線上端點設定
azd ai agent endpoint show

# 產生評估資料集，然後優化代理
azd ai agent eval generate
azd ai agent optimize

# 下載以程式碼為基礎的託管代理之已部署原始碼
azd ai agent code download

# 刪除託管代理及其所有版本（--force 會終止活動會話）
azd ai agent delete --force
```

### MCP Server (Alpha)
```bash
# 為您的專案啟動 MCP 伺服器
azd mcp start

# 管理 MCP 操作所需的工具授權
azd copilot consent list
```

### Infrastructure Generation
```bash
# 根據您的專案定義產生基礎設施即程式碼檔案
azd infra generate

# 從 azure.yaml 產生基礎設施
azd infra synth
```

---

## 🎯 Quick Workflows

### Development Workflow
```bash
# 開始新專案
azd init --template todo-nodejs-mongo
cd my-project

# 部署到開發環境
azd env new dev
azd up

# 進行更改並重新部署
azd deploy

# 開啟監控儀表板
azd monitor --live
```

### Multi-Environment Workflow
```bash
# 設定環境
azd env new dev
azd env new staging  
azd env new production

# 部署到開發環境
azd env select dev
azd up

# 測試並推送至預備環境
azd env select staging
azd up

# 部署到生產環境
azd env select production
azd up
```

### Troubleshooting Workflow
```bash
# 啟用除錯模式
export AZD_DEBUG=true

# 檢查部署狀態
azd show

# 驗證設定
azd config show

# 開啟監控儀表板以檢視日誌
azd monitor --logs

# 檢查資源狀態
azd show --output json
```

## 🔍 Debugging Commands

### Debug Information
```bash
# 啟用除錯輸出
export AZD_DEBUG=true
azd <command> --debug

# 停用遙測以獲得較乾淨的輸出
export AZD_DISABLE_TELEMETRY=true

# 檢查目前設定
azd config show

# 檢查驗證狀態
az account show
```

### Template Debugging
```bash
# 列出可用範本及其詳細資訊
azd template list --output json

# 顯示範本資訊
azd template show <template-name>

# 在初始化之前驗證範本
azd template validate <template-name>
```

## 📁 File and Directory Commands

### Project Structure
```bash
# 顯示目前的目錄結構
tree /f  # Windows
find . -type f  # Linux/macOS

# 切換到 azd 專案根目錄
cd $(azd root)

# 顯示 azd 設定目錄
echo $AZD_CONFIG_DIR  # 通常位於 ~/.azd
```

## 🎨 Output Formatting

### JSON Output
```bash
# 取得 JSON 輸出以供腳本使用
azd show --output json
azd env list --output json
azd config show --output json

# 使用 jq 解析
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Table Output
```bash
# 格式化為表格
azd env list --output table

# 檢視已部署的服務
azd show --output json | jq '.services | keys'
```

## 🔧 Common Command Combinations

### Health Check Script
```bash
#!/bin/bash
# 快速健康檢查
azd show
azd env get-values
azd monitor --logs
```

### Deployment Validation
```bash
#!/bin/bash
# 部署前驗證
azd show
azd provision --preview  # 在部署前預覽變更
az account show
```

### Environment Comparison
```bash
#!/bin/bash
# 比較環境
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Resource Cleanup Script
```bash
#!/bin/bash
# 清除舊有環境
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Environment Variables

### Common Environment Variables
```bash
# Azure 設定
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD 設定
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# 應用程式設定
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Emergency Commands

### Quick Fixes
```bash
# 重設身分驗證
az account clear
az login

# 強制重新整理環境
azd env refresh

# 重新部署所有服務
azd deploy

# 檢查部署狀態
azd show --output json
```

### Recovery Commands
```bash
# 從部署失敗中復原 - 清理並重新部署
azd down --force --purge
azd up

# 僅重新配置基礎架構
azd provision

# 僅重新部署應用程式
azd deploy
```

## 💡 Pro Tips

### Aliases for Faster Workflow
```bash
# 將其加入你的 .bashrc 或 .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Function Shortcuts
```bash
# 快速環境切換
azd-env() {
    azd env select $1 && azd show
}

# 帶監控的快速部署
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# 環境狀態
azd-status() {
    echo "Current environment:"
    azd env get-values
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Help and Documentation

### Getting Help
```bash
# 一般說明
azd --help
azd help

# 特定命令的說明
azd up --help
azd env --help
azd config --help

# 顯示版本與建置資訊
azd version
azd version --output json
```

### Documentation Links
```bash
# 在瀏覽器中開啟說明文件
azd docs

# 顯示範本說明文件
azd template show <template-name> --docs
```

---

<strong>提示</strong>: 將此備忘單加入書籤，並使用 `Ctrl+F` 快速找到您需要的指令！

---

<strong>導覽</strong>
- <strong>前一課</strong>: [預檢查事項](../docs/pre-deployment/preflight-checks.md)
- <strong>下一課</strong>: [Glossary](glossary.md)

---

> **💡 想在您的編輯器中取得 Azure 指令幫助嗎？** 安裝 [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) 並執行 `npx skills add microsoft/github-copilot-for-azure` — 包含 37 個涵蓋 AI、Foundry、部署、診斷等的技能。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
此文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們努力追求準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用此翻譯所產生的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->