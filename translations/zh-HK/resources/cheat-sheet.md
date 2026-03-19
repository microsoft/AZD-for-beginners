# 指令速查 - 必備 AZD 指令

<strong>所有章節快速參考</strong>
- **📚 課程首頁**：[AZD 初學者指南](../README.md)
- **📖 快速入門**：[第1章：基礎與快速入門](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI 指令**：[第2章：AI-First 開發](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 進階操作**：[第4章：基礎設施即代碼](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## 簡介

此綜合速查表提供最常用的 Azure Developer CLI 指令的快速參考，依類別組織並附有實用範例。非常適合在開發、故障排除及使用 azd 專案日常操作時快速查閱。

## 學習目標

使用本速查表，您將：
- 即時取得重要的 Azure Developer CLI 指令及語法
- 了解依功能分類與使用案例來組織指令
- 參考常見開發與部署情境的實務範例
- 查詢故障排除指令以快速解決問題
- 有效找到進階設定及客製化選項
- 掌握環境管理與多環境工作流程指令

## 學習成果

經常參考本速查表，您將能：
- 無須參考完整文件，自信執行 azd 指令
- 利用適當的診斷指令迅速排解常見問題
- 高效管理多個環境與部署情境
- 視需求運用進階 azd 功能與設定選項
- 使用系統化指令序列故障排除部署問題
- 透過有效利用 azd 快捷鍵及選項優化工作流程

## 入門指令

### 認證
```bash
# 登入 Azure 透過 AZD
azd auth login

# 登入 Azure CLI（AZD 底層使用此方法）
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
# 瀏覽可用範本
azd template list

# 從範本初始化
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

# 部署到特定環境
azd up --environment production

# 使用自訂參數部署
azd up --parameter location=westus2
```

### 僅限基礎設施
```bash
# 配置 Azure 資源
azd provision

# 🧪 預覽基礎設施更改
azd provision --preview
# 顯示將會創建/修改/刪除的資源的模擬運行視圖
# 類似於 'terraform plan' 或 'bicep what-if' - 安全運行，無任何更改會被應用
```

### 僅限應用程式
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

# 顯示當前環境
azd env show

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

## ⚙️ 設定指令

### 全域設定
```bash
# 列出所有配置
azd config list

# 設定全球預設值
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# 移除配置
azd config unset defaults.location

# 重置所有配置
azd config reset
```

### 專案設定
```bash
# 驗證 azure.yaml
azd config validate

# 顯示項目資訊
azd show

# 獲取服務端點
azd show --output json
```

## 📊 監控與診斷

### 監控儀表板
```bash
# 打開 Azure 入口網站監控儀表板
azd monitor

# 打開 Application Insights 即時指標
azd monitor --live

# 打開 Application Insights 日誌面版
azd monitor --logs

# 打開 Application Insights 概覽
azd monitor --overview
```

### 查看容器日誌
```bash
# 透過 Azure CLI 查看日誌（用於容器應用程式）
az containerapp logs show --name <app-name> --resource-group <rg-name>

# 即時跟蹤日誌
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# 從 Azure 入口網站查看日誌
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
# 移除所有 Azure 資源
azd down

# 強制刪除而不需確認
azd down --force

# 徹底刪除軟刪除資源
azd down --purge

# 完整清理
azd down --force --purge
```

### 更新
```bash
# 檢查 azd 更新
azd version

# 取得當前版本
azd version

# 查看當前配置
azd config list
```

## 🔧 進階指令

### 流水線與 CI/CD
```bash
# 配置 GitHub Actions
azd pipeline config

# 配置 Azure DevOps
azd pipeline config --provider azdo

# 顯示管道配置
azd pipeline show
```

### 基礎設施管理
```bash
# 產生基礎設施範本
azd infra generate

# 🧪 基礎設施預覽及規劃
azd provision --preview
# 模擬基礎設施佈建，無需部署
# 分析 Bicep/Terraform 範本並顯示：
# - 將添加的資源（綠色 +）
# - 將修改的資源（黃色 ~）
# - 將刪除的資源（紅色 -）
# 安全執行 - 不會對 Azure 環境做出實際更改

# 從 azure.yaml 綜合基礎設施
azd infra synth
```

### 專案資訊
```bash
# 顯示項目狀態及端點
azd show

# 以 JSON 顯示詳細項目信息
azd show --output json

# 獲取服務端點
azd show --output json | jq '.services'
```

## 🤖 AI 與擴充指令

### AZD 擴充功能
```bash
# 列出所有可用擴充功能（包括 AI）
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
# 從一個清單初始化代理項目
azd ai agent init -m <manifest-path-or-uri>

# 指定一個特定的 Foundry 項目
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# 指定代理源目錄
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# 選擇一個托管目標
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP 伺服器 (Alpha)
```bash
# 為你的專案啟動 MCP 伺服器
azd mcp start

# 管理 MCP 操作的工具同意權限
azd mcp consent
```

### 基礎設施生成
```bash
# 根據您的項目定義生成 IaC 文件
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

# 進行更改並重新部署
azd deploy

# 打開監控儀表板
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

# 驗證配置
azd config list

# 開啟監控儀表板查看日誌
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

# 關閉遙測以獲得更清晰的輸出
export AZD_DISABLE_TELEMETRY=true

# 檢查當前配置
azd config list

# 檢查身份驗證狀態
az account show
```

### 範本除錯
```bash
# 列出可用模板詳情
azd template list --output json

# 顯示模板資訊
azd template show <template-name>

# 初始化前驗證模板
azd template validate <template-name>
```

## 📁 檔案及目錄指令

### 專案結構
```bash
# 顯示當前目錄結構
tree /f  # Windows
find . -type f  # Linux/macOS

# 導航到 azd 專案根目錄
cd $(azd root)

# 顯示 azd 配置目錄
echo $AZD_CONFIG_DIR  # 通常是 ~/.azd
```

## 🎨 輸出格式

### JSON 輸出
```bash
# 獲取用於腳本的 JSON 輸出
azd show --output json
azd env list --output json
azd config list --output json

# 使用 jq 解析
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### 表格輸出
```bash
# 格式化為表格
azd env list --output table

# 查看已部署的服務
azd show --output json | jq '.services | keys'
```

## 🔧 常用指令組合

### 健康檢查指令
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

### 資源清理指令
```bash
#!/bin/bash
# 清理舊有的環境
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 環境變數

### 常用環境變數
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

# 僅重新配置基礎設施
azd provision

# 僅重新部署應用程式
azd deploy
```

## 💡 專家技巧

### 流程加速別名
```bash
# 新增至你的 .bashrc 或 .zshrc
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

# 備有監控的快速部署
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

### 尋求幫助
```bash
# 一般幫助
azd --help
azd help

# 指令專用幫助
azd up --help
azd env --help
azd config --help

# 顯示版本及構建資訊
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

<strong>提示</strong>：將此速查表加入書籤，並使用 `Ctrl+F` 快速尋找所需指令！

---

<strong>導覽</strong>
- <strong>上一課程</strong>：[先行檢查](../docs/pre-deployment/preflight-checks.md)
- <strong>下一課程</strong>：[術語表](glossary.md)

---

> **💡 想在編輯器中使用 Azure 指令幫助？** 安裝 [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure)，執行 `npx skills add microsoft/github-copilot-for-azure` — 提供 37 個適用於 AI、Foundry、部署、診斷等的技能。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議採用專業人工翻譯。我們不對因使用此翻譯而導致的任何誤解或曲解負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->