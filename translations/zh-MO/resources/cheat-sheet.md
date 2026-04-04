# Command Cheat Sheet - 重要 AZD 指令

<strong>各章節快速參考</strong>
- **📚 課程首頁**：[AZD 入門](../README.md)
- **📖 快速開始**：[第 1 章：基礎與快速開始](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI 指令**：[第 2 章：AI 優先開發](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 進階**：[第 4 章：基礎架構即程式碼](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## 介紹

這份綜合備忘單提供最常用 Azure Developer CLI 指令的快速參考，並依類別組織附有實用範例。非常適合在開發、故障排除及日常操作 azd 專案時快速查閱。

## 學習目標

使用此備忘單，您將能：
- 立即取得重要 Azure Developer CLI 指令與語法
- 瞭解以功能類別與使用情境組織的指令
- 參考常見開發與部署情境的實用範例
- 使用故障排除指令迅速解決問題
- 有效率地找到進階設定和自訂選項
- 掌握環境管理與多環境工作流程的指令

## 學習成果

經常參考此備忘單後，您將能：
- 自信執行 azd 指令，無需查閱完整文件
- 運用適當的診斷指令迅速解決常見問題
- 有效管理多重環境及部署情境
- 按需應用進階 azd 功能和設定選項
- 使用系統化命令序列故障排除部署問題
- 透過有效運用 azd 快捷鍵與選項優化工作流程

## 入門指令

### 認證
```bash
# 透過 AZD 登入 Azure
azd auth login

# 登入 Azure CLI（AZD 在底層使用此工具）
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
# 瀏覽可用模板
azd template list

# 從模板初始化
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# 在當前目錄初始化
azd init .

# 使用自訂名稱初始化
azd init --template todo-nodejs-mongo my-awesome-app
```

## 核心部署指令

### 完整部署工作流程
```bash
# 部署所有內容（配置 + 部署）
azd up

# 部署時禁用確認提示
azd up --confirm-with-no-prompt

# 部署到指定環境
azd up --environment production

# 使用自定義參數部署
azd up --parameter location=westus2
```

### 僅基礎架構
```bash
# 配置 Azure 資源
azd provision

# 🧪 預覽基礎架構變更
azd provision --preview
# 顯示將會建立/修改/刪除的資源的模擬檢視
# 類似於 'terraform plan' 或 'bicep what-if' - 安全執行，無變更應用
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

### 建置與封裝
```bash
# 建立應用程式
azd package

# 建立特定服務
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

# 顯示可用環境
azd env list

# 更新環境狀態
azd env refresh
```

### 環境變數
```bash
# 設定環境變量
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# 獲取環境變量
azd env get API_KEY

# 列出所有環境變量
azd env get-values

# 刪除環境變量
azd env unset DEBUG
```

## ⚙️ 設定指令

### 全域設定
```bash
# 列出所有配置
azd config show

# 設定全域預設值
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

# 開啟 Application Insights 日誌面板
azd monitor --logs

# 開啟 Application Insights 總覽
azd monitor --overview
```

### 查看容器日誌
```bash
# 透過 Azure CLI 檢視日誌（用於容器應用程式）
az containerapp logs show --name <app-name> --resource-group <rg-name>

# 即時追蹤日誌
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

# 強制刪除而不需確認
azd down --force

# 清除軟刪除的資源
azd down --purge

# 完成清理
azd down --force --purge
```

### 更新
```bash
# 檢查 azd 更新
azd version

# 獲取當前版本
azd version

# 查看當前配置
azd config show
```

## 🔧 進階指令

### 管線與 CI/CD
```bash
# 配置 GitHub 行動
azd pipeline config

# 配置 Azure DevOps
azd pipeline config --provider azdo

# 顯示流水線配置
azd pipeline show
```

### 基礎架構管理
```bash
# 產生基礎架構模板
azd infra generate

# 🧪 基礎架構預覽與規劃
azd provision --preview
# 模擬基礎架構配置而不進行部署
# 分析 Bicep/Terraform 模板並顯示：
# - 將新增的資源（綠色 +）
# - 將修改的資源（黃色 ~）
# - 將刪除的資源（紅色 -）
# 運行安全 - 不會對 Azure 環境做出實際更改

# 從 azure.yaml 合成基礎架構
azd infra synth
```

### 專案資訊
```bash
# 顯示項目狀態及端點
azd show

# 以 JSON 顯示詳細的項目信息
azd show --output json

# 獲取服務端點
azd show --output json | jq '.services'
```

## 🤖 AI 與擴充指令

### AZD 擴充套件
```bash
# 列出所有可用的擴充功能（包括人工智能）
azd extension list

# 安裝 Foundry agents 擴充功能
azd extension install azure.ai.agents

# 安裝微調擴充功能
azd extension install azure.ai.finetune

# 安裝自訂模型擴充功能
azd extension install azure.ai.models

# 升級所有已安裝的擴充功能
azd extension upgrade --all
```

### AI 代理指令
```bash
# 從清單初始化代理項目
azd ai agent init -m <manifest-path-or-uri>

# 指定一個特定的Foundry項目
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# 指定代理來源目錄
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# 選擇一個寄存目標
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP 伺服器（Alpha）
```bash
# 為你的項目啟動 MCP 伺服器
azd mcp start

# 管理 MCP 操作的工具同意權限
azd copilot consent list
```

### 基礎架構生成
```bash
# 從您的專案定義生成基礎設施即代碼文件
azd infra generate

# 從 azure.yaml 合成基礎設施
azd infra synth
```

---

## 🎯 快速工作流程

### 開發工作流程
```bash
# 開始新專案
azd init --template todo-nodejs-mongo
cd my-project

# 部署到開發環境
azd env new dev
azd up

# 進行修改並重新部署
azd deploy

# 打開監控儀表板
azd monitor --live
```

### 多環境工作流程
```bash
# 設置環境
azd env new dev
azd env new staging  
azd env new production

# 部署至開發環境
azd env select dev
azd up

# 測試並升級至預備環境
azd env select staging
azd up

# 部署至生產環境
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

# 開啟監控儀表板以查看日誌
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

# 停用遙測以獲得較清晰的輸出
export AZD_DISABLE_TELEMETRY=true

# 檢查目前配置
azd config show

# 檢查認證狀態
az account show
```

### 範本除錯
```bash
# 列出可用範本及詳情
azd template list --output json

# 顯示範本資訊
azd template show <template-name>

# 初始化前驗證範本
azd template validate <template-name>
```

## 📁 檔案與目錄指令

### 專案結構
```bash
# 顯示目前目錄結構
tree /f  # Windows
find . -type f  # Linux/macOS

# 導航至 azd 項目根目錄
cd $(azd root)

# 顯示 azd 配置目錄
echo $AZD_CONFIG_DIR  # 通常是 ~/.azd
```

## 🎨 輸出格式化

### JSON 輸出
```bash
# 取得 JSON 輸出用於腳本
azd show --output json
azd env list --output json
azd config show --output json

# 用 jq 解析
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### 表格輸出
```bash
# 格式化為表格
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
# 部署前的驗證
azd show
azd provision --preview  # 部署前預覽變更
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

# 僅重新配置基礎設施
azd provision

# 僅重新部署應用程式
azd deploy
```

## 💡 專家秘訣

### 加速工作流程的別名
```bash
# 新增到你的 .bashrc 或 .zshrc 文件
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### 函式捷徑
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

## 📖 求助與文件

### 取得幫助
```bash
# 一般幫助
azd --help
azd help

# 命令特定幫助
azd up --help
azd env --help
azd config --help

# 顯示版本和構建信息
azd version
azd version --output json
```

### 文件連結
```bash
# 在瀏覽器中打開文件
azd docs

# 顯示範本文件
azd template show <template-name> --docs
```

---

<strong>秘訣</strong>：將此備忘單加入書籤，並用 `Ctrl+F` 快速搜尋所需指令！

---

<strong>導覽</strong>
- <strong>上一課程</strong>：[預備檢查](../docs/pre-deployment/preflight-checks.md)
- <strong>下一課程</strong>：[術語表](glossary.md)

---

> **💡 想在您的編輯器中取得 Azure 指令協助？** 安裝 [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) 並執行 `npx skills add microsoft/github-copilot-for-azure` — 共 37 項支援 AI、Foundry、部署、診斷等技能。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件是使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們致力於確保準確性，但請注意，自動翻譯可能包含錯誤或不準確之處。原始語言版本之文件應被視為權威資料來源。對於重要資訊，建議採用專業人工翻譯。我們不對因使用此翻譯而引起的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->