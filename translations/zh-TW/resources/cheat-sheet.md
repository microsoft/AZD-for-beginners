# 指令速查表 - 重要的 AZD 指令

<strong>所有章節快速參考</strong>
- **📚 課程首頁**: [AZD 入門](../README.md)
- **📖 快速開始**: [第1章：基礎與快速開始](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI 指令**: [第2章：AI優先開發](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 進階**: [第4章：基礎建設即程式碼](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## 介紹

這份完整的速查表依分類提供最常用的 Azure Developer CLI 指令及實用範例，是開發、除錯及日常使用 azd 專案的快速參考工具。

## 學習目標

使用本速查表，你將能夠：
- 立即存取重要的 Azure Developer CLI 指令與語法
- 了解指令依功能分類與使用場景的組織方式
- 參考實用範例以應對常見開發與部署情境
- 使用故障排除指令快速解決問題
- 高效找到進階設定與客製化選項
- 管理環境及多環境工作流程指令

## 學習成果

經常參考本速查表後，你將能：
- 自信執行 azd 指令而無需完整文件支援
- 利用適當的診斷指令快速解決常見問題
- 有效管理多重環境及部署情境
- 按需應用進階 azd 功能與設定選項
- 透過系統化指令序列排解部署問題
- 利用 azd 快捷鍵與選項優化流程

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

### 完整部署流程
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

### 僅基礎建設
```bash
# 配置 Azure 資源
azd provision

# 🧪 預覽基礎設施變更
azd provision --preview
# 顯示將會被建立/修改/刪除的資源的模擬執行檢視
# 類似於 'terraform plan' 或 'bicep what-if' - 安全執行，不會套用變更
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
# 列出所有配置
azd config show

# 設定全域預設值
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

# 顯示專案資訊
azd show

# 獲取服務端點
azd show --output json
```

## 📊 監控與診斷

### 監控儀表板
```bash
# 開啟 Azure 入口網站監控儀表板
azd monitor

# 開啟 Application Insights 即時度量
azd monitor --live

# 開啟 Application Insights 日誌頁籤
azd monitor --logs

# 開啟 Application Insights 概覽
azd monitor --overview
```

### 檢視容器日誌
```bash
# 透過 Azure CLI 檢視日誌（適用於容器應用）
az containerapp logs show --name <app-name> --resource-group <rg-name>

# 即時追蹤日誌
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# 從 Azure 入口網站查看日誌
azd monitor --logs
```

### 日誌分析查詢
```bash
# 透過 Azure 入口網站存取日誌分析
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

# 強制刪除無需確認
azd down --force

# 清除軟刪除的資源
azd down --purge

# 完整清理
azd down --force --purge
```

### 更新
```bash
# 檢查 azd 更新
azd version

# 取得目前版本
azd version

# 查看目前設定
azd config show
```

## 🔧 進階指令

### 管線與 CI/CD
```bash
# 設定 GitHub Actions
azd pipeline config

# 設定 Azure DevOps
azd pipeline config --provider azdo

# 顯示管線設定
azd pipeline show
```

### 基礎建設管理
```bash
# 產生基礎架構範本
azd infra generate

# 🧪 基礎架構預覽與規劃
azd provision --preview
# 模擬基礎架構佈建，無需部署
# 分析 Bicep/Terraform 範本並顯示:
# - 要新增的資源（綠色 +）
# - 要修改的資源（黃色 ~）
# - 要刪除的資源（紅色 -）
# 執行安全 - 不會對 Azure 環境做出實際更改

# 從 azure.yaml 合成基礎架構
azd infra synth
```

### 專案資訊
```bash
# 顯示專案狀態與端點
azd show

# 以 JSON 顯示詳細的專案資訊
azd show --output json

# 取得服務端點
azd show --output json | jq '.services'
```

## 🤖 AI 與擴充指令

### AZD 擴充套件
```bash
# 列出所有可用的擴充功能（包括 AI）
azd extension list

# 安裝 Foundry 代理擴充功能
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
# 從清單初始化代理專案
azd ai agent init -m <manifest-path-or-uri>

# 指定特定的 Foundry 專案
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# 指定代理的來源目錄
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# 選擇一個主機目標
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP 伺服器（Alpha）
```bash
# 啟動您的專案的 MCP 伺服器
azd mcp start

# 管理 MCP 操作的工具同意權限
azd copilot consent list
```

### 基礎建設生成
```bash
# 從您的專案定義產生 IaC 檔案
azd infra generate

# 從 azure.yaml 合成基礎架構
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

# 進行更改並重新部署
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

# 測試並提升至預備環境
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

# 驗證設定
azd config show

# 開啟監控面板以查看日誌
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

# 禁用遙測以獲得更乾淨的輸出
export AZD_DISABLE_TELEMETRY=true

# 檢查目前的設定
azd config show

# 檢查身份驗證狀態
az account show
```

### 模板除錯
```bash
# 列出可用的範本及詳細資訊
azd template list --output json

# 顯示範本資訊
azd template show <template-name>

# 初始化前驗證範本
azd template validate <template-name>
```

## 📁 檔案與目錄指令

### 專案結構
```bash
# 顯示當前目錄結構
tree /f  # Windows
find . -type f  # Linux/macOS

# 導航到 azd 專案根目錄
cd $(azd root)

# 顯示 azd 設定目錄
echo $AZD_CONFIG_DIR  # 通常是 ~/.azd
```

## 🎨 輸出格式

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
azd provision --preview  # 部署前預覽變更
az account show
```

### 環境比較
```bash
#!/bin/bash
# 比較環境設定
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
# 重置認證
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
# 從部署失敗中復原 - 清理並重新部署
azd down --force --purge
azd up

# 僅重新配置基礎設施
azd provision

# 僅重新部署應用程式
azd deploy
```

## 💡 專家秘訣

### 速成別名
```bash
# 新增到您的 .bashrc 或 .zshrc 中
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### 功能快捷鍵
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
    azd env get-values
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 幫助與文件

### 尋求幫助
```bash
# 一般說明
azd --help
azd help

# 指令專用說明
azd up --help
azd env --help
azd config --help

# 顯示版本與建置資訊
azd version
azd version --output json
```

### 文件連結
```bash
# 在瀏覽器中打開文件
azd docs

# 顯示模板文件說明
azd template show <template-name> --docs
```

---

<strong>提示</strong>：將此速查表加入書籤，用 `Ctrl+F` 快速查找所需指令！

---

<strong>導覽</strong>
- <strong>上一課</strong>: [預檢查](../docs/pre-deployment/preflight-checks.md)
- <strong>下一課</strong>: [詞彙表](glossary.md)

---

> **💡 想在編輯器中獲得 Azure 指令協助？** 安裝 [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) 使用 `npx skills add microsoft/github-copilot-for-azure` — 提供 37 種 AI、Foundry、部署、診斷等技能。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件係使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們致力於準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為具權威性的資料來源。對於重要資訊，建議採用專業人工翻譯。我們不對因使用此翻譯而引起的任何誤解或誤譯負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->