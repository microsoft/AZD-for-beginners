# Command Cheat Sheet - 重要的 AZD 指令

**各章節快速參考**
- **📚 課程首頁**: [初學者的 AZD](../README.md)
- **📖 快速入門**: [第一章：基礎與快速入門](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI 指令**: [第二章：AI 優先開發](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 進階篇**: [第四章：基礎設施即程式碼](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## 簡介

這份完整的速查表提供最常使用的 Azure Developer CLI 指令快速參考，按類別組織並附有實作範例。非常適合開發、除錯及日常使用 azd 專案時快速查閱。

## 學習目標

透過使用這份速查表，你將能：
- 即時存取重要的 Azure Developer CLI 指令與語法
- 了解指令依功能類別及使用情境的組織方式
- 參考常見開發與部署場景的實務範例
- 學習除錯指令以迅速解決問題
- 有效找到進階設定及客製化選項
- 掌握環境管理與多環境工作流程指令

## 學習成果

經常參考此速查表，你將能：
- 在不查閱完整文件下，自信執行 azd 指令
- 使用適當診斷指令快速解決常見問題
- 高效管理多重環境與部署情境
- 按需應用 azd 的進階功能與設定選項
- 系統化指令序列解決部署問題
- 利用 azd 快捷方式與選項優化工作流程

## 入門指令

### 認證
```bash
# 透過 AZD 登入 Azure
azd auth login

# 登入 Azure CLI（AZD 在底層使用此工具）
az login

# 檢查當前帳戶
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

# 以自訂名稱初始化
azd init --template todo-nodejs-mongo my-awesome-app
```

## 核心部署指令

### 完整部署工作流程
```bash
# 部署所有內容（配置 + 部署）
azd up

# 部署且無確認提示
azd up --confirm-with-no-prompt

# 部署到指定環境
azd up --environment production

# 使用自訂參數部署
azd up --parameter location=westus2
```

### 基礎設施專用
```bash
# 配置 Azure 資源
azd provision

# 🧪 預覽基礎設施更改
azd provision --preview
# 顯示將會創建/修改/刪除資源的模擬執行視圖
# 類似於 'terraform plan' 或 'bicep what-if' - 安全執行，無更改套用
```

### 應用程式專用
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
# 列出所有設定
azd config list

# 設置全局預設
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

# 顯示項目信息
azd show

# 獲取服務端點
azd show --output json
```

## 📊 監控與診斷

### 監控儀表板
```bash
# 打開 Azure 門戶監控儀表板
azd monitor

# 打開 Application Insights 即時指標
azd monitor --live

# 打開 Application Insights 日誌面板
azd monitor --logs

# 打開 Application Insights 概覽
azd monitor --overview
```

### 查看容器日誌
```bash
# 通過 Azure CLI 檢視日誌（容器應用程式）
az containerapp logs show --name <app-name> --resource-group <rg-name>

# 實時追蹤日誌
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# 從 Azure 入口網站檢視日誌
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
# 刪除所有 Azure 資源
azd down

# 強制刪除無需確認
azd down --force

# 清除軟刪除資源
azd down --purge

# 完全清理
azd down --force --purge
```

### 更新
```bash
# 檢查 azd 更新
azd version

# 獲取當前版本
azd version

# 查看當前配置
azd config list
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

### 基礎設施管理
```bash
# 產生基礎設施範本
azd infra generate

# 🧪 基礎設施預覽及規劃
azd provision --preview
# 模擬基礎設施佈署但不實際部署
# 分析 Bicep/Terraform 範本並顯示：
# - 將會新增的資源（綠色 +）
# - 將會修改的資源（黃色 ~）
# - 將會刪除的資源（紅色 -）
# 安全執行 - 不會對 Azure 環境做出實際變更

# 從 azure.yaml 合成基礎設施
azd infra synth
```

### 專案資訊
```bash
# 顯示項目狀態及端點
azd show

# 以 JSON 顯示詳細項目資訊
azd show --output json

# 獲取服務端點
azd show --output json | jq '.services'
```

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

# 測試並推廣至測試環境
azd env select staging
azd up

# 部署到生產環境
azd env select production
azd up
```

### 除錯工作流程
```bash
# 啟用除錯模式
export AZD_DEBUG=true

# 檢查部署狀態
azd show

# 驗證配置
azd config list

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

# 關閉遙測以獲得更清晰的輸出
export AZD_DISABLE_TELEMETRY=true

# 檢查當前配置
azd config list

# 檢查身份驗證狀態
az account show
```

### 範本除錯
```bash
# 列出可用範本及其詳情
azd template list --output json

# 顯示範本資訊
azd template show <template-name>

# 初始化前驗證範本
azd template validate <template-name>
```

## 📁 檔案與目錄指令

### 專案架構
```bash
# 顯示目前目錄結構
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

# 用 jq 解析
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

### 健康檢查腳本
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
# 從部署失敗中復原 - 清理並重新部署
azd down --force --purge
azd up

# 只重新供應基礎設施
azd provision

# 只重新部署應用程式
azd deploy
```

## 💡 專家技巧

### 快速工作流程的別名
```bash
# 加入到你的 .bashrc 或 .zshrc 中
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

# 顯示版本和構建資訊
azd version
azd version --output json
```

### 文件連結
```bash
# 在瀏覽器中打開文件
azd docs

# 顯示模板文件
azd template show <template-name> --docs
```

---

**提示**：將此速查表加入書籤，利用 `Ctrl+F` 快速找到所需指令！

---

**導覽**
- **上一課**: [預部署檢查](../docs/pre-deployment/preflight-checks.md)
- **下一課**: [詞彙表](glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件乃使用人工智能翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯所得。雖然我們致力於確保準確性，請注意自動翻譯可能存在錯誤或不準確之處。原始語言版本為權威版本，應視為正式依據。對於重要資訊，建議採用專業人類翻譯。我們不對因使用本翻譯而引起的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->