# 命令速查表 - 必要的 AZD 指令

<strong>所有章節快速參考</strong>
- **📚 課程首頁**: [AZD 初學者指南](../README.md)
- **📖 快速開始**: [第 1 章：基礎與快速入門](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI 指令**: [第 2 章：以 AI 為先的開發（建議給 AI 開發人員）](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 進階**: [第 4 章：基礎設施即程式碼](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## 簡介

這份完整的速查表提供最常用的 Azure Developer CLI 指令的快速參考，按類別分類並附有實用範例。非常適合在開發、疑難排解及日常操作 azd 專案時快速查閱。

## 學習目標

使用這份速查表，您將能夠：
- 即時取得必要的 Azure Developer CLI 指令與語法
- 了解指令依功能類別與使用情境的組織方式
- 參考常見開發與部署情境的實用範例
- 存取用於快速問題排解的診斷指令
- 有效率地找到進階設定與自訂選項
- 定位環境管理與多環境工作流程指令

## 學習成果

持續參考此速查表後，您將能夠：
- 自信執行 azd 指令而不需查閱完整文件
- 使用適當的診斷指令快速解決常見問題
- 有效率地管理多個環境與部署情境
- 視需要套用進階 azd 功能與設定選項
- 使用系統化的指令序列來排解部署問題
- 透過有效利用 azd 的捷徑與選項來優化工作流程

## 入門指令

### 驗證
```bash
# 使用 AZD 登入 Azure
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

### 專案初始化
```bash
# 瀏覽可用的範本
azd template list

# 從範本初始化
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# 在目前目錄初始化
azd init .

# 使用自訂名稱初始化
azd init --template todo-nodejs-mongo my-awesome-app
```

## 核心部署指令

### 完整部署工作流程
```bash
# 部署所有項目（配置資源 + 部署）
azd up

# 部署時停用確認提示
azd up --confirm-with-no-prompt

# 部署到特定環境
azd up --environment production

# 使用自訂參數部署
azd up --parameter location=westus2
```

### 僅基礎設施
```bash
# 部署 Azure 資源
azd provision

# 🧪 預覽基礎架構變更
azd provision --preview
# 顯示模擬執行的檢視，說明哪些資源會被建立／修改／刪除
# 類似 'terraform plan' 或 'bicep what-if' - 可安全執行，不會套用任何變更
```

### 僅應用程式
```bash
# 部署應用程式代碼
azd deploy

# 部署特定服務
azd deploy --service web
azd deploy --service api

# 部署所有服務
azd deploy --all
```

### 建置與打包
```bash
# 還原（下載）應用程式相依項目
azd restore

# 還原特定服務
azd restore --service api

# 建置可部署的產物但不部署
azd package

# 建置特定服務
azd package --service api
```

> **`azd restore`** 會下載您應用的相依套件（npm、pip、NuGet、Maven 等）。它會在 `azd package` 與 `azd deploy` 執行時自動運行，因此您很少需要直接呼叫它 —— 若要預先抓取相依以利後續離線作業或暖置 CI 快取，可手動執行。

> **`azd package`<strong> 會建置可部署的產物（容器映像或 zip），但</strong>不會**推送到 Azure。單獨使用它可驗證建置是否成功、檢視輸出或產生由其他流程稍後部署的產物。`azd deploy` 會自動進行 package，因此只有在您想要產生產物但不部署時，才需要使用 `azd package`。


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

# 顯示可用環境
azd env list

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

## ⚙️ 設定指令

### 全域設定
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

# 開啟 Application Insights 的日誌刀片
azd monitor --logs

# 開啟 Application Insights 的概觀
azd monitor --overview
```

### 檢視容器日誌
```bash
# 透過 Azure CLI 檢視日誌（適用於容器應用）
az containerapp logs show --name <app-name> --resource-group <rg-name>

# 即時追蹤日誌
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# 在 Azure 入口網站檢視日誌
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

## 🛠️ 維護指令

### 清理
```bash
# 移除所有 Azure 資源
azd down

# 強制刪除而不需確認
azd down --force

# 清除已軟刪除的資源
azd down --purge

# 完成清理
azd down --force --purge
```

### 更新
```bash
# 檢查 azd 更新
azd version

# 取得目前版本
azd version

# 檢視目前設定
azd config show
```

## 🔧 進階指令

### 流水線與 CI/CD
```bash
# 設定 GitHub Actions
azd pipeline config

# 設定 Azure DevOps
azd pipeline config --provider azdo

# 顯示管線設定
azd pipeline show
```

### 基礎設施管理
```bash
# 產生基礎架構範本
azd infra generate

# 🧪 基礎架構預覽與規劃
azd provision --preview
# 模擬基礎架構配置而不實際部署
# 分析 Bicep/Terraform 範本並顯示：
# - 將新增的資源（綠色 +）
# - 將被修改的資源（黃色 ~）
# - 將刪除的資源（紅色 -）
# 可安全執行 - 不會對 Azure 環境做出實際變更

# 從 azure.yaml 合成基礎架構
azd infra synth
```

### 專案資訊
```bash
# 顯示專案狀態及端點
azd show

# 以 JSON 格式顯示專案詳細資訊
azd show --output json

# 取得服務端點
azd show --output json | jq '.services'
```

## 🤖 AI 與擴充套件指令

### AZD 擴充套件
```bash
# 列出所有可用的擴充套件（包括 AI）
azd extension list

# 安裝 Foundry agents 擴充套件
azd extension install azure.ai.agents

# 安裝 agent skills 擴充套件（預覽）
azd extension install azure.ai.skills

# 安裝 Foundry connections 擴充套件（預覽）
azd extension install azure.ai.connections

# 安裝微調擴充套件
azd extension install azure.ai.finetune

# 安裝自訂模型擴充套件
azd extension install azure.ai.models

# 升級所有已安裝的擴充套件
azd extension upgrade --all
```

### AI 代理指令
```bash
# 從清單初始化代理專案
azd ai agent init -m <manifest-path-or-uri>

# 指定特定 Foundry 專案
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# 指定代理來源目錄
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# 選擇託管目標
azd ai agent init -m agent-manifest.yaml --host containerapp

# 測試已部署的代理（顯示延遲與首位元組時間）
azd ai agent invoke

# 顯示線上端點設定
azd ai agent endpoint show

# 產生評估資料集，然後優化代理
azd ai agent eval generate
azd ai agent optimize

# 下載以程式碼為基礎的託管代理之已部署原始碼
azd ai agent code download

# 刪除託管代理及其所有版本（--force 會結束所有活動會話）
azd ai agent delete --force
```

### MCP 伺服器（Alpha）
```bash
# 為你的專案啟動 MCP 伺服器
azd mcp start

# 管理 MCP 操作所需工具的同意
azd copilot consent list
```

### 基礎設施生成
```bash
# 從你的專案定義產生基礎設施即程式碼 (IaC) 檔案
azd infra generate

# 從 azure.yaml 合成基礎設施
azd infra synth
```

---

## 🎯 快速工作流程

### 開發工作流程
```bash
# 建立新專案
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

### 多環境工作流程
```bash
# 設定環境
azd env new dev
azd env new staging  
azd env new production

# 部署到開發環境
azd env select dev
azd up

# 測試並推送到暫存環境
azd env select staging
azd up

# 部署到生產環境
azd env select production
azd up
```

### 疑難排解工作流程
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

## 🔍 除錯指令

### 除錯資訊
```bash
# 啟用偵錯輸出
export AZD_DEBUG=true
azd <command> --debug

# 停用遙測以使輸出更簡潔
export AZD_DISABLE_TELEMETRY=true

# 檢查目前設定
azd config show

# 檢查驗證狀態
az account show
```

### 範本除錯
```bash
# 列出可用範本與詳細資訊
azd template list --output json

# 顯示範本資訊
azd template show <template-name>

# 在初始化前驗證範本
azd template validate <template-name>
```

## 📁 檔案與目錄指令

### 專案結構
```bash
# 顯示目前目錄結構
tree /f  # Windows
find . -type f  # Linux/macOS

# 前往 azd 專案根目錄
cd $(azd root)

# 顯示 azd 設定目錄
echo $AZD_CONFIG_DIR  # 通常為 ~/.azd
```

## 🎨 輸出格式

### JSON 輸出
```bash
# 取得供腳本使用的 JSON 輸出
azd show --output json
azd env list --output json
azd config show --output json

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

## 🔧 常用指令組合

### 健康檢查腳本
```bash
#!/bin/bash
# 快速健康檢查
azd show
azd env get-values
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

### 資源清理腳本
```bash
#!/bin/bash
# 清理舊有環境
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 環境變數

### 常用環境變數
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

## 🚨 緊急指令

### 快速修復
```bash
# 重設認證
az account clear
az login

# 強制重新整理環境
azd env refresh

# 重新部署所有服務
azd deploy

# 檢查部署狀態
azd show --output json
```

### 復原指令
```bash
# 從失敗的部署復原 - 清理並重新部署
azd down --force --purge
azd up

# 僅重新配置基礎架構
azd provision

# 僅重新部署應用程式
azd deploy
```

## 💡 實用技巧

### 加速工作流程的別名
```bash
# 加入到你的 .bashrc 或 .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### 功能捷徑
```bash
# 快速切換環境
azd-env() {
    azd env select $1 && azd show
}

# 快速部署並附有監控
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

## 📖 協助與文件

### 取得協助
```bash
# 一般說明
azd --help
azd help

# 命令專屬說明
azd up --help
azd env --help
azd config --help

# 顯示版本及建置資訊
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

<strong>小提示</strong>：將此速查表加入書籤，並使用 `Ctrl+F` 快速找到所需指令！

---

<strong>導覽</strong>
- <strong>上一課</strong>: [預部署檢查](../docs/pre-deployment/preflight-checks.md)
- <strong>下一課</strong>: [術語表](glossary.md)

---

> **💡 想在編輯器中取得 Azure 指令協助嗎？** 安裝 [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) 並使用 `npx skills add microsoft/github-copilot-for-azure` — 提供 37 項技能，涵蓋 AI、Foundry、部署、診斷等功能。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議尋求專業人工翻譯。我們不對因使用本翻譯而引起的任何誤解或曲解承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->