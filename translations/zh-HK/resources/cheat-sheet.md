# Command Cheat Sheet - 必備 AZD 指令

<strong>快速參考所有章節</strong>
- **📚 課程首頁**: [初學者的 AZD](../README.md)
- **📖 快速入門**: [第 1 章：基礎與快速入門](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI 指令**: [第 2 章：AI 優先開發](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 高階**: [第 4 章：基礎結構即代碼](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## 介紹

此完整速查表提供最常用的 Azure Developer CLI 指令的快速參考，按類別組織並配有實用範例。非常適合在使用 azd 項目開發、故障排除和日常操作時快速查找。

## 學習目標

使用本速查表，您將能：
- 即時取得必要的 Azure Developer CLI 指令與語法
- 了解指令按功能類別與用例組織方式
- 參考常見開發與部署場景的實用範例
- 使用疑難排解指令快速解決問題
- 有效率找到進階配置與客製化選項
- 定位環境管理與多環境工作流程指令

## 學習成果

經常參考此速查表後，您將能夠：
- 自信執行 azd 指令，不需參考完整文件
- 快速使用適當的診斷指令解決常見問題
- 高效管理多個環境和部署場景
- 按需應用進階 azd 功能與配置選項
- 使用系統化指令序列排查部署問題
- 透過有效利用 azd 快捷鍵和選項優化工作流程

## 入門指令

### 認證
```bash
# 透過 AZD 登入 Azure
azd auth login

# 登入 Azure CLI（AZD 底層使用此工具）
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

# 由範本初始化
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# 在當前目錄初始化
azd init .

# 使用自定名稱初始化
azd init --template todo-nodejs-mongo my-awesome-app
```

## 核心部署指令

### 完整部署流程
```bash
# 部署所有內容（配置 + 部署）
azd up

# 禁用確認提示進行部署
azd up --confirm-with-no-prompt

# 部署到特定環境
azd up --environment production

# 使用自訂參數進行部署
azd up --parameter location=westus2
```

### 僅基礎結構
```bash
# 配置 Azure 資源
azd provision

# 🧪 預覽基礎設施更改
azd provision --preview
# 顯示將會建立/修改/刪除的資源的模擬執行視圖
# 類似於 'terraform plan' 或 'bicep what-if' - 安全執行，無更改套用
```

### 僅應用程式
```bash
# 部署應用程式代碼
azd deploy

# 部署指定服務
azd deploy --service web
azd deploy --service api

# 部署所有服務
azd deploy --all
```

### 建置與打包
```bash
# 還原（下載）應用程式依賴項
azd restore

# 還原特定服務
azd restore --service api

# 建立可部署的檔案但不部署
azd package

# 建立特定服務
azd package --service api
```

> **`azd restore`** 會下載您的應用程式相依性（npm、pip、NuGet、Maven 等）。此指令會在 `azd package` 和 `azd deploy` 過程中自動執行，因此您通常不需直接呼叫——手動執行可預先抓取相依性（例如，熱身 CI 快取或後續離線作業）。

> **`azd package`<strong> 建置可部署的工件（容器映像或 zip），</strong>但不會**推送到 Azure。單獨使用時，用於確認建置成功、檢視輸出或產生稍後由其他流程部署的工件。`azd deploy` 會自動打包，因此只在需要產生不部署的工件時執行 `azd package`。

## 🌍 環境管理

### 環境操作
```bash
# 列出所有環境
azd env list

# 創建新環境
azd env new development
azd env new staging --location westus2

# 選擇環境
azd env select production

# 顯示可用環境
azd env list

# 更新環境狀態
azd env refresh
```

### 環境變數
```bash
# 設置環境變量
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# 獲取環境變量
azd env get API_KEY

# 列出所有環境變量
azd env get-values

# 刪除環境變量
azd env unset DEBUG
```

## ⚙️ 配置指令

### 全域設定
```bash
# 列出所有配置
azd config show

# 設定全局預設值
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# 移除配置
azd config unset defaults.location

# 重設所有配置
azd config reset
```

### 專案設定
```bash
# 驗證 azure.yaml
azd config validate

# 顯示項目信息
azd show

# 獲取服務端點
azd show --output json
```

## 📊 監控與診斷

### 監控儀表板
```bash
# 開啟 Azure 入口網站監控儀表板
azd monitor

# 開啟 Application Insights 即時指標
azd monitor --live

# 開啟 Application Insights 日誌視窗
azd monitor --logs

# 開啟 Application Insights 總覽
azd monitor --overview
```

### 查看容器日誌
```bash
# 透過 Azure CLI 檢視日誌（用於容器應用程式）
az containerapp logs show --name <app-name> --resource-group <rg-name>

# 即時跟蹤日誌
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# 從 Azure 入口網站檢視日誌
azd monitor --logs
```

### 日誌分析查詢
```bash
# 通過 Azure 入口網站存取日誌分析
azd monitor --logs

# 使用 Azure CLI 查詢日誌
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ 維護指令

### 清理
```bash
# 刪除所有 Azure 資源
azd down

# 強制刪除，無需確認
azd down --force

# 清除已軟刪除的資源
azd down --purge

# 完成清理
azd down --force --purge
```

### 更新
```bash
# 檢查 azd 的更新
azd version

# 獲取當前版本
azd version

# 查看當前配置
azd config show
```

## 🔧 進階指令

### 管線與 CI/CD
```bash
# 配置 GitHub Actions
azd pipeline config

# 配置 Azure DevOps
azd pipeline config --provider azdo

# 顯示流水線配置
azd pipeline show
```

### 基礎結構管理
```bash
# 產生基礎建設範本
azd infra generate

# 🧪 基礎建設預覽與規劃
azd provision --preview
# 模擬基礎建設部署，無需實際部署
# 分析 Bicep/Terraform 範本並顯示：
# - 將新增的資源（綠色 +）
# - 將修改的資源（黃色 ~）
# - 將刪除的資源（紅色 -）
# 安全執行 - 不會對 Azure 環境做出實際更改

# 從 azure.yaml 合成基礎建設
azd infra synth
```

### 專案資訊
```bash
# 顯示項目狀態及端點
azd show

# 顯示詳細項目信息以 JSON 格式
azd show --output json

# 獲取服務端點
azd show --output json | jq '.services'
```

## 🤖 AI 與擴充指令

### AZD 擴充
```bash
# 列出所有可用擴充功能（包括 AI）
azd extension list

# 安裝 Foundry 代理擴充功能
azd extension install azure.ai.agents

# 安裝代理技能擴充功能（預覽）
azd extension install azure.ai.skills

# 安裝 Foundry 連接擴充功能（預覽）
azd extension install azure.ai.connections

# 安裝微調擴充功能
azd extension install azure.ai.finetune

# 安裝自訂模型擴充功能
azd extension install azure.ai.models

# 升級所有已安裝擴充功能
azd extension upgrade --all
```

### AI 代理人指令
```bash
# 從清單初始化代理項目
azd ai agent init -m <manifest-path-or-uri>

# 指定特定的 Foundry 項目
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# 指定代理源目錄
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# 選擇主機目標
azd ai agent init -m agent-manifest.yaml --host containerapp

# 測試已部署的代理（列印延遲和首字節時間）
azd ai agent invoke

# 顯示實時端點配置
azd ai agent endpoint show

# 生成評估數據集，然後優化代理
azd ai agent eval generate
azd ai agent optimize

# 下載基於代碼的托管代理的已部署源碼
azd ai agent code download

# 刪除托管代理及其所有版本（--force 可結束所有活動會話）
azd ai agent delete --force
```

### MCP 伺服器（Alpha）
```bash
# 為你的項目啟動 MCP 服務器
azd mcp start

# 管理 MCP 操作的工具同意權限
azd copilot consent list
```

### 基礎結構產生
```bash
# 從您的項目定義生成 IaC 檔案
azd infra generate

# 從 azure.yaml 合成基礎設施
azd infra synth
```

---

## 🎯 快速工作流程

### 開發工作流程
```bash
# 開始新項目
azd init --template todo-nodejs-mongo
cd my-project

# 部署到開發環境
azd env new dev
azd up

# 作出更改並重新部署
azd deploy

# 開啟監控儀表板
azd monitor --live
```

### 多環境工作流程
```bash
# 設置環境
azd env new dev
azd env new staging  
azd env new production

# 部署到開發環境
azd env select dev
azd up

# 測試並推廣到預備環境
azd env select staging
azd up

# 部署到生產環境
azd env select production
azd up
```

### 故障排除工作流程
```bash
# 啟用除錯模式
export AZD_DEBUG=true

# 檢查部署狀態
azd show

# 驗證配置
azd config show

# 打開用於日誌的監控儀表板
azd monitor --logs

# 檢查資源狀態
azd show --output json
```

## 🔍 除錯指令

### 除錯資訊
```bash
# 啟用除錯輸出
export AZD_DEBUG=true
azd <command> --debug

# 停用遙測以獲得更清晰的輸出
export AZD_DISABLE_TELEMETRY=true

# 檢查當前設定
azd config show

# 檢查認證狀態
az account show
```

### 範本除錯
```bash
# 列出可用的模板詳情
azd template list --output json

# 顯示模板資訊
azd template show <template-name>

# 初始化前驗證模板
azd template validate <template-name>
```

## 📁 檔案與目錄指令

### 專案結構
```bash
# 顯示當前目錄結構
tree /f  # Windows
find . -type f  # Linux/macOS

# 導航至 azd 專案根目錄
cd $(azd root)

# 顯示 azd 配置目錄
echo $AZD_CONFIG_DIR  # 通常是 ~/.azd
```

## 🎨 輸出格式化

### JSON 輸出
```bash
# 獲取用於腳本的 JSON 輸出
azd show --output json
azd env list --output json
azd config show --output json

# 使用 jq 解析
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### 表格輸出
```bash
# 格式化為表格
azd env list --output table

# 查看已部署服務
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
azd provision --preview  # 部署前預覽更改
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
# 清理舊環境
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 環境變數

### 常見環境變數
```bash
# Azure 配置
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD 配置
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# 應用程式配置
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 緊急指令

### 快速修復
```bash
# 重設認證
az account clear
az login

# 強制刷新環境
azd env refresh

# 重新部署所有服務
azd deploy

# 檢查部署狀態
azd show --output json
```

### 復原指令
```bash
# 從部署失敗恢復 - 清理並重新部署
azd down --force --purge
azd up

# 只重新配置基礎設施
azd provision

# 只重新部署應用程式
azd deploy
```

## 💡 專家提示

### 提升工作流程的別名
```bash
# 新增到你的 .bashrc 或 .zshrc 文件
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### 功能捷徑
```bash
# 快速環境切換
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
    azd env get-values
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 幫助與文件

### 獲取幫助
```bash
# 一般幫助
azd --help
azd help

# 指令專用幫助
azd up --help
azd env --help
azd config --help

# 顯示版本及編譯資訊
azd version
azd version --output json
```

### 文件連結
```bash
# 在瀏覽器中開啟文件
azd docs

# 顯示模板文件
azd template show <template-name> --docs
```

---

<strong>提示</strong>：將本速查表加入書籤並使用 `Ctrl+F` 快速找到所需指令！

---

<strong>導覽</strong>
- <strong>上一課</strong>： [前置檢查](../docs/pre-deployment/preflight-checks.md)
- <strong>下一課</strong>： [術語表](glossary.md)

---

> **💡 想在編輯器中獲得 Azure 指令幫助？** 安裝 [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) ，執行 `npx skills add microsoft/github-copilot-for-azure` — 37 個 AI、Foundry、部署、診斷等技能。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意，機器自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->