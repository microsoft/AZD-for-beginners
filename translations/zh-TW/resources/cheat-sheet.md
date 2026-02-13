# 指令速查表 - 必備 AZD 指令

**章節快速參考**
- **📚 課程首頁**: [AZD For Beginners](../README.md)
- **📖 快速開始**: [Chapter 1: Foundation & Quick Start](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI 指令**: [Chapter 2: AI-First Development](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 進階**: [Chapter 4: Infrastructure as Code](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## 介紹

這份完整的速查表提供最常用的 Azure Developer CLI 指令快速參考，依類別組織並附上實用範例。非常適合在開發、除錯以及日常使用 azd 專案時快速查找。

## 學習目標

使用此速查表，你將能夠：
- 立即取得重要的 Azure Developer CLI 指令與語法
- 了解指令按功能類別與使用情境的組織方式
- 參考常見開發與部署情境的實務範例
- 使用除錯指令快速解決問題
- 有效率地找到進階設定與客製化選項
- 找到環境管理與多環境工作流程指令

## 學習成效

經常參考此速查表，你將能夠：
- 自信地執行 azd 指令而不需翻閱完整文件
- 使用適當的診斷指令快速解決常見問題
- 有效率地管理多個環境與部署情境
- 視需要應用進階 azd 功能與設定選項
- 使用系統化的指令序列排查部署問題
- 透過有效使用 azd 捷徑與選項來最佳化工作流程

## 開始使用 指令

### 驗證
```bash
# 透過 AZD 登入 Azure
azd auth login

# 登入 Azure CLI（AZD 在底層會使用它）
az login

# 檢查目前的帳戶
az account show

# 設定預設訂閱
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# 從 AZD 登出
azd auth logout

# 從 Azure CLI 登出
az logout
```

### 專案初始化
```bash
# 瀏覽可用範本
azd template list

# 從範本初始化
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# 在目前目錄初始化
azd init .

# 以自訂名稱初始化
azd init --template todo-nodejs-mongo my-awesome-app
```

## 核心部署 指令

### 完整部署 工作流程
```bash
# 部署所有項目（佈建 + 部署）
azd up

# 部署並停用確認提示
azd up --confirm-with-no-prompt

# 部署到特定環境
azd up --environment production

# 使用自訂參數部署
azd up --parameter location=westus2
```

### 僅基礎架構
```bash
# 部署 Azure 資源
azd provision

# 🧪 預覽基礎架構變更
azd provision --preview
# 顯示一個模擬執行的視圖，呈現將會被建立、修改或刪除的資源
# 類似 'terraform plan' 或 'bicep what-if' - 可安全執行，不會套用任何變更
```

### 僅應用程式
```bash
# 部署應用程式程式碼
azd deploy

# 部署特定服務
azd deploy --service web
azd deploy --service api

# 部署所有服務
azd deploy --all
```

### 建置與封裝
```bash
# 建置應用程式
azd package

# 建置特定服務
azd package --service api
```

## 🌍 環境管理

### 環境操作
```bash
# 列出所有環境
azd env list

# 建立新環境
azd env new development
azd env new staging --location westus2

# 選擇環境
azd env select production

# 顯示目前環境
azd env show

# 重新整理環境狀態
azd env refresh
```

### 環境變數
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

## ⚙️ 設定 指令

### 全域設定
```bash
# 列出所有設定
azd config list

# 設定全域預設值
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# 移除設定
azd config unset defaults.location

# 重置所有設定
azd config reset
```

### 專案設定
```bash
# 驗證 azure.yaml
azd config validate

# 顯示專案資訊
azd show

# 取得服務端點
azd show --output json
```

## 📊 監控與診斷

### 監控儀表板
```bash
# 開啟 Azure 入口網站的監控儀表板
azd monitor

# 開啟 Application Insights 的即時指標
azd monitor --live

# 開啟 Application Insights 的記錄 (Logs) 窗格
azd monitor --logs

# 開啟 Application Insights 概觀
azd monitor --overview
```

### 檢視容器日誌
```bash
# 透過 Azure CLI 檢視日誌（適用於 Container Apps）
az containerapp logs show --name <app-name> --resource-group <rg-name>

# 即時追蹤日誌
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# 從 Azure 入口網站檢視日誌
azd monitor --logs
```

### 日誌分析查詢
```bash
# 透過 Azure 入口網站存取 Log Analytics
azd monitor --logs

# 使用 Azure CLI 查詢日誌
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ 維護 指令

### 清理
```bash
# 移除所有 Azure 資源
azd down

# 強制刪除而不需確認
azd down --force

# 清除已軟刪除的資源
azd down --purge

# 徹底清理
azd down --force --purge
```

### 更新
```bash
# 檢查 azd 更新
azd version

# 取得目前版本
azd version

# 檢視目前設定
azd config list
```

## 🔧 進階 指令

### 管線與 CI/CD
```bash
# 設定 GitHub Actions
azd pipeline config

# 設定 Azure DevOps
azd pipeline config --provider azdo

# 顯示管線設定
azd pipeline show
```

### 基礎架構管理
```bash
# 產生基礎架構範本
azd infra generate

# 🧪 基礎架構預覽與規劃
azd provision --preview
# 模擬基礎架構佈建但不實際部署
# 分析 Bicep/Terraform 範本並顯示：
# - 要新增的資源（綠色 +）
# - 要修改的資源（黃色 ~）
# - 要刪除的資源（紅色 -）
# 安全執行 - 不會對 Azure 環境做出任何實際變更

# 從 azure.yaml 產生基礎架構
azd infra synth
```

### 專案資訊
```bash
# 顯示專案狀態與端點
azd show

# 以 JSON 格式顯示專案詳細資訊
azd show --output json

# 取得服務端點
azd show --output json | jq '.services'
```

## 🎯 快速工作流程

### 開發工作流程
```bash
# 開始新專案
azd init --template todo-nodejs-mongo
cd my-project

# 部署到開發環境
azd env new dev
azd up

# 進行變更並重新部署
azd deploy

# 開啟監控儀表板
azd monitor --live
```

### 多環境工作流程
```bash
# 設定環境
azd env new dev
azd env new staging  
azd env new production

# 部署到開發環境
azd env select dev
azd up

# 測試並推進到暫存環境
azd env select staging
azd up

# 部署到生產環境
azd env select production
azd up
```

### 疑難排解 工作流程
```bash
# 啟用除錯模式
export AZD_DEBUG=true

# 檢查部署狀態
azd show

# 驗證設定
azd config list

# 開啟監控儀表板以檢視日誌
azd monitor --logs

# 檢查資源狀態
azd show --output json
```

## 🔍 除錯 指令

### 除錯資訊
```bash
# 啟用除錯輸出
export AZD_DEBUG=true
azd <command> --debug

# 停用遙測以獲得較乾淨的輸出
export AZD_DISABLE_TELEMETRY=true

# 檢查目前設定
azd config list

# 檢查認證狀態
az account show
```

### 範本除錯
```bash
# 列出可用範本及其詳細資訊
azd template list --output json

# 顯示範本資訊
azd template show <template-name>

# 在初始化之前驗證範本
azd template validate <template-name>
```

## 📁 檔案與目錄 指令

### 專案結構
```bash
# 顯示目前目錄結構
tree /f  # Windows
find . -type f  # Linux/macOS

# 前往 azd 專案根目錄
cd $(azd root)

# 顯示 azd 設定目錄
echo $AZD_CONFIG_DIR  # 通常位於 ~/.azd
```

## 🎨 輸出格式

### JSON 輸出
```bash
# 取得 JSON 輸出供腳本使用
azd show --output json
azd env list --output json
azd config list --output json

# 使用 jq 解析
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### 表格輸出
```bash
# 以表格格式顯示
azd env list --output table

# 檢視已部署的服務
azd show --output json | jq '.services | keys'
```

## 🔧 常見指令組合

### 健康檢查 腳本
```bash
#!/bin/bash
# 快速健康檢查
azd show
azd env show
azd monitor --logs
```

### 部署驗證
```bash
#!/bin/bash
# 部署前驗證
azd show
azd provision --preview  # 在部署前預覽變更
az account show
```

### 環境比較
```bash
#!/bin/bash
# 比較環境
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### 資源清理 腳本
```bash
#!/bin/bash
# 清除舊環境
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 環境變數

### 常見環境變數
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

## 🚨 緊急 指令

### 快速修復
```bash
# 重設驗證
az account clear
az login

# 強制重新整理環境
azd env refresh

# 重新部署所有服務
azd deploy

# 檢查部署狀態
azd show --output json
```

### 復原 指令
```bash
# 從失敗的部署復原 - 清理並重新部署
azd down --force --purge
azd up

# 僅重新佈建基礎設施
azd provision

# 僅重新部署應用程式
azd deploy
```

## 💡 專家提示

### 加速工作流程的別名
```bash
# 加入到你的 .bashrc 或 .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### 函式捷徑
```bash
# 快速切換環境
azd-env() {
    azd env select $1 && azd show
}

# 快速部署並監控
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# 環境狀態
azd-status() {
    echo "Current environment:"
    azd env show
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 幫助與文件

### 取得幫助
```bash
# 一般說明
azd --help
azd help

# 特定指令的說明
azd up --help
azd env --help
azd config --help

# 顯示版本與建置資訊
azd version
azd version --output json
```

### 文件連結
```bash
# 在瀏覽器中開啟說明文件
azd docs

# 顯示範本說明文件
azd template show <template-name> --docs
```

---

**提示**: 將此速查表加入書籤，並使用 `Ctrl+F` 快速尋找所需指令！

---

**導覽**
- **上一課**: [Preflight Checks](../docs/pre-deployment/preflight-checks.md)
- **下一課**: [Glossary](glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責聲明：
本文件係使用 AI 翻譯服務 Co‑op Translator（https://github.com/Azure/co-op-translator）自動翻譯而成。雖然我們力求準確，但自動翻譯可能包含錯誤或不準確之處。原始語言之原文應視為具權威性的版本。對於關鍵資訊，建議採用專業人工翻譯。我們對因使用本翻譯所導致的任何誤解或曲解不承擔任何責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->