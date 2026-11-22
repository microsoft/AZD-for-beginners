# 你的第一個專案 - 實作教學

**章節導覽：**
- **📚 課程首頁**: [AZD 初學者指南](../../README.md)
- **📖 本章節**: 第 1 章 - 基礎與快速入門
- **⬅️ 上一章**: [安裝與設定](installation.md)
- **➡️ 下一章**: [自帶應用程式](bring-your-own-app.md)
- **🚀 下一章節**: [第 2 章：AI 優先開發](../chapter-02-ai-development/microsoft-foundry-integration.md)

## 簡介

歡迎開始你的第一個 Azure Developer CLI 專案！你將部署一個 todo 應用程式，包含 React 前端、Node.js API 以及 Azure Cosmos DB。此範本依然保留歷史名稱 `todo-nodejs-mongo`；其現有基礎架構使用 Cosmos DB 作為 NoSQL，請查看下載的 README 和 `infra/`，而非從名稱推斷資料庫 API。

> 2026 年 11 月依据 `azd 1.37.2` 和公開範本審核。下方示例採用 Bash；JSON 擷取另需 `jq`。Azure 部署會產生費用，審核期間未執行實際部署。

## 學習目標

完成本教程後，你將能：
- 熟練使用 azd 專案初始化工作流程及範本
- 了解 Azure Developer CLI 專案結構和設定檔
- 執行完整應用程式部署到 Azure，含基礎架構配置
- 實作應用程式更新和重新部署策略
- 管理多個開發與測試環境
- 應用資源清理及成本管理方法

## 學習成果

完成後，你將能：
- 獨立從範本初始化及配置 azd 專案
- 有效瀏覽和修改 azd 專案結構
- 以單一指令部署全端應用程式至 Azure
- 排解常見部署和認證問題
- 管理多個 Azure 環境以支援不同部署階段
- 實作應用程式持續部署工作流程

## 開始前準備

### 前置需求清單
- ✅ 已安裝 Azure Developer CLI ([安裝指南](installation.md))
- ✅ 已完成 AZD 認證，使用 `azd auth login`
- ✅ 系統中已安裝 Git
- ✅ Node.js 22 LTS（或下載範本所需支援版本）
- ✅ 建議使用 Visual Studio Code

繼續前，請先於儲存庫根目錄執行設定驗證：

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### 驗證安裝環境
```bash
# Check azd installation
azd version

# Check AZD authentication
azd auth login --check-status
```

### 驗證可選的 Azure CLI 認證

```bash
az account show
```

### 檢查 Node.js 版本
```bash
node --version
```

## 步驟 1：選擇並初始化範本

我們從常用的 todo 應用範本開始，它包含 React 前端和 Node.js API 後端。

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo .

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### 剛剛發生了什麼？
- 下載範本程式碼到本地目錄
- 建立包含服務定義的 `azure.yaml` 檔案
- 在 `infra/` 目錄設定基礎架構程式碼
- 建立環境設定檔

## 步驟 2：探索專案結構

來看看 azd 幫我們建立了什麼：

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

你應該會看到：
```
my-first-azd-app/
├── .azure/
│   ├── config.json              # Selected local environment
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── app/                    # Application infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   └── package.json       # Node.js dependencies
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       └── package.json       # React dependencies
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### 重要檔案說明

**azure.yaml** - 你的 azd 專案核心：
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - 基礎架構定義：
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## 步驟 3：自訂專案（可選）

部署前，你可以客製化應用程式：

### 修改前端
```bash
# Open the React app component
code src/web/src/layout/header.tsx
```

做個簡單變更：
```tsx
// Replace the existing <Text variant="xLarge">ToDo</Text> element
<Text variant="xLarge">My Awesome Todo App</Text>
```

### 配置環境變數
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

這兩個自訂值示範僅本地儲存範例。標準範本不會使用 `WEBSITE_TITLE` 或 `API_VERSION`，因此不會改變應用程式。上方明確來源修改則改變了顯示的標題。

## 步驟 4：部署到 Azure

接下來是最令人興奮的部分——把一切部署到 Azure！

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### 部署過程中發生了什麼？

工作流程會佈署基礎架構並打包／部署程式。精確順序可透過 `workflows.up` 在 `azure.yaml` 中自訂；此範本指定先佈署再部署，不可以將所有範本都假設成同一階段順序。

### 預期輸出
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## 步驟 5：測試你的應用程式

### 存取你的應用程式
點擊部署輸出中提供的 URL，或隨時取得：
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -er '.services.web.ingressUrl'
```

### 測試 Todo 應用
1. <strong>新增待辦事項</strong> - 點擊「Add Todo」並輸入任務
2. <strong>標記完成</strong> - 勾選完成的事項
3. <strong>刪除項目</strong> - 移除不需要的待辦事項

### 監控你的應用程式
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd monitor --logs

# View live metrics
azd monitor --live
```

### ✅ 驗證部署

繼續之前，請快速執行此清單確認一切正常運作，不要只假設「部署成功」就是「應用程式沒問題」：

```bash
# 1. Confirm the endpoint exists and is reachable
azd show

# 2. Smoke-test the endpoint (expects HTTP 200)
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error --location "$WEB_URL"

# 3. Test the API's actual list route (the template has no /health route)
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
curl --fail --show-error "$API_URL/lists"
```

**當符合以下條件時部署即被驗證：**
- ✅ `azd show` 列出可連接的端點 URL
- ✅ 用瀏覽器開啟 URL 無錯誤
- ✅ 核心功能正常（新增／完成／刪除待辦事項）
- ✅ `azd monitor --logs` 顯示請求到達且無意外錯誤

若任何檢查失敗，請跳往 [第 7 章：故障排除](../chapter-07-troubleshooting/README.md)。

## 步驟 6：修改並重新部署

我們來做個修改，看看更新有多簡單：

### 修改 API
```bash
# Edit the API code
code src/api/src/routes/lists.ts
```

新增自訂回應標頭：
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### 僅部署程式碼變更
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## 步驟 7：管理多個環境

建立測試環境於正式環境前驗證變更：

```bash
# Create a new staging environment
azd env new staging

# Deploy to staging
azd up

# Switch back to dev environment
azd env select dev

# List all environments
azd env list
```

### 環境比較
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## 步驟 8：清理資源

實驗完成後，清理資源以避免持續產生費用：

```bash
# Review and delete BOTH environments created in this tutorial
azd down --environment dev
azd down --environment staging

# Automation alternative for a selected disposable environment:
# azd down --environment dev --force --purge
# --purge affects supported soft-deleted Azure resources, not local .azure files.
```

## 傳統應用與 AI 應用：相同工作流程

你剛部署了一個傳統的網頁應用程式。但如果你想部署 AI 驅動應用，例如背靠 Microsoft Foundry 模型的聊天應用呢？

好消息：**工作流程完全相同。**

| 步驟 | 傳統 Todo 應用 | AI 聊天應用 |
|------|-----------------|-------------|
| 初始化 (空目錄) | `azd init --template todo-nodejs-mongo .` | `azd init --template azure-search-openai-demo .` |
| 認證 | `azd auth login` | `azd auth login` |
| 部署 | `azd up` | `azd up` |
| 監控 | `azd monitor` | `azd monitor` |
| 清理 | `azd down --force --purge` | `azd down --force --purge` |

生命週期指令相同，但前置條件有異。AI 範本可能需要模型存取、地區配額、資料導入與其他配置。部署前請詳細閱讀其 README；`azd up` 無法替你提供缺失的權限或配額。

這就是 azd 的核心原則：**一套工作流程，適用所有工作負載。** 你在此教程練習到的技能——初始化、部署、監控、重新部署與清理——同樣適用於 AI 應用及代理。

---

## 你學到了什麼

恭喜！你成功：
- ✅ 從範本初始化了 azd 專案
- ✅ 探索了專案結構和重要檔案
- ✅ 將全端應用程式部署到 Azure
- ✅ 程式碼變更後重新部署
- ✅ 管理多個環境
- ✅ 進行資源清理

## 🎯 技能驗證練習

### 練習 1：部署不同範本 (15 分鐘)
<strong>目標</strong>：展現 azd 初始化與部署工作流程的掌握

```bash
# Try Python + MongoDB stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo .
azd up

# Verify deployment
azd show
curl --fail "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Clean up
azd down --force --purge
```

**成功標準：**
- [ ] 應用程式無錯誤成功部署
- [ ] 可於瀏覽器存取應用程式 URL
- [ ] 應用功能正常（新增／移除待辦事項）
- [ ] 成功清理所有資源

### 練習 2：自訂配置 (20 分鐘)
<strong>目標</strong>：練習本地環境值儲存，不誤當成執行時設定

```bash
# Return to your original my-first-azd-app directory first

# Create custom environment
azd env new custom-config

# Set custom variables
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verify variables
azd env get-values | grep APP_TITLE

# Check one value exactly; expected: My Custom Todo App
azd env get-value APP_TITLE
```

**成功標準：**
- [ ] 成功建立自訂環境
- [ ] 環境變數成功設置且可讀取
- [ ] `azd env get-value APP_TITLE` 印出 `My Custom Todo App`
- [ ] 能解釋為何這些值不會改變標準應用程式，除非程式碼／基礎架構使用它們

### 練習 3：多環境工作流程 (25 分鐘)
<strong>目標</strong>：熟練環境管理與部署策略

```bash
# Create dev environment
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Note dev URL
DEV_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Dev: $DEV_URL"

# Create staging environment
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Note staging URL
STAGING_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Staging: $STAGING_URL"

# Compare environments
azd env list

# Test both environments
curl --fail "$DEV_URL"
curl --fail "$STAGING_URL"

# Clean up both
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**成功標準：**
- [ ] 建立兩個具有不同配置的環境
- [ ] 兩個環境均成功部署
- [ ] 能使用 `azd env select` 在環境間切換
- [ ] 兩環境環境變數不同
- [ ] 成功清理兩個環境

## 📊 你的進度

<strong>投入時間</strong>：約 60-90 分鐘  
**掌握技能：**
- ✅ 範本基礎專案初始化
- ✅ Azure 資源佈署
- ✅ 應用程式部署流程
- ✅ 環境管理
- ✅ 配置管理
- ✅ 資源清理與成本管理

<strong>下一階段</strong>：準備好閱讀 [配置指南](../chapter-03-configuration/configuration.md) 學習進階配置模式！

## 常見問題排除

### 認證錯誤
```bash
# Re-authenticate with azd (az login does not refresh azd's default credentials)
azd auth login

# Verify the selected environment's subscription
azd env get-value AZURE_SUBSCRIPTION_ID
```

### 部署失敗
```bash
# Enable debug logging
azd up --debug

# View application logs in Azure
azd monitor --logs

# For Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### 資源名稱衝突
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### 連接埠／網路問題
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## 下一步

完成你的第一個專案後，可以探索以下進階主題：

### 1. 自訂基礎架構
- [基礎架構即程式碼](../chapter-04-infrastructure/provisioning.md)
- [新增資料庫基礎架構](../chapter-04-infrastructure/provisioning.md#%EF%B8%8F-database-provisioning)

### 2. 建立 CI/CD
- [部署指南](../chapter-04-infrastructure/deployment-guide.md) - 完整 CI/CD 工作流程
- [Azure Developer CLI 文件](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - 管道配置

### 3. 生產最佳實務
- [部署指南](../chapter-04-infrastructure/deployment-guide.md) - 安全、效能與監控

### 4. 探索更多範本
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
# Choose ONE in a new empty directory, not all three in the same project
azd init --template todo-python-mongo .
# azd init --template todo-csharp-sql .
# azd init --template todo-java-mongo .
```

## 補充資源

### 學習資源
- [Azure Developer CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure 架構中心](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 良好架構框架](https://learn.microsoft.com/en-us/azure/well-architected/)

### 社群與支援
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure 開發者社群](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### 範本與範例
- [官方範本庫](https://azure.github.io/awesome-azd/)
- [社群範本貢獻](https://github.com/Azure/awesome-azd)
- [Todo 範本來源](https://github.com/Azure-Samples/todo-nodejs-mongo)

---

**恭喜你完成了第一個 azd 專案！** 你已經準備好自信地在 Azure 上構建並部署精彩應用程式。

---

**章節導覽：**
- **📚 課程首頁**: [AZD 初學者指南](../../README.md)
- **📖 本章節**: 第 1 章 - 基礎與快速入門
- **⬅️ 上一章**: [安裝與設定](installation.md)
- **➡️ 下一章**: [自帶應用程式](bring-your-own-app.md)
- **🚀 下一章節**: [第 2 章：AI 優先開發](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意，機器自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->