# 你的第一個專案 - 實作教學

**章節導覽：**
- **📚 課程首頁**: [AZD For Beginners](../../README.md)
- **📖 本章節**: 第 1 章 - 基礎與快速開始
- **⬅️ 上一章**: [安裝與設定](installation.md)
- **➡️ 下一章**: [帶入你的應用程式](bring-your-own-app.md)
- **🚀 下一章節**: [第 2 章：AI 優先開發](../chapter-02-ai-development/microsoft-foundry-integration.md)

## 介紹

歡迎使用你的第一個 Azure Developer CLI 專案！你將會部署一個有 React 前端、Node.js API 及 Azure Cosmos DB 的待辦事項應用程式。此範本保留了歷史名稱 `todo-nodejs-mongo`；其目前的基礎架構使用 Cosmos DB 作為 NoSQL，因此請檢查下載的 README 和 `infra/`，而非直接從名稱推論資料庫 API。

> 根據 `azd 1.37.2` 及 2026 年 11 月的公開範本進行檢閱。以下範例使用 Bash；JSON 擷取亦需要 `jq`。Azure 部署會產生費用，該次審核期間未執行實際部署。

## 學習目標

完成本教學後，您將能：
- 精通使用範本初始化 azd 專案的工作流程
- 理解 Azure Developer CLI 專案結構及設定檔
- 執行完整的應用程式部署及基礎架構配置到 Azure
- 實作應用程式更新與重新部署策略
- 管理開發及測試多個環境
- 應用資源清理及成本管理實務

## 學習成果

完成後你將能：
- 獨立從範本初始化及設定 azd 專案
- 有效導覽及修改 azd 專案結構
- 使用單一指令部署全端應用程式到 Azure
- 排解常見部署問題及驗證錯誤
- 管理不同部署階段的多個 Azure 環境
- 實作持續部署工作流程以更新應用程式

## 開始使用

### 先決條件清單
- ✅ 已安裝 Azure Developer CLI ([安裝指南](installation.md))
- ✅ 已完成使用 `azd auth login` 的 AZD 身份驗證
- ✅ 系統已安裝 Git
- ✅ 已安裝 Node.js 22 LTS（或下載的範本所需的支援版本）
- ✅ 建議使用 Visual Studio Code

在繼續之前，請從儲存庫根目錄執行設定驗證器：

**Windows：** `./validate-setup.ps1`

**macOS / Linux：** `bash ./validate-setup.sh`

### 驗證您的設定
```bash
# Check azd installation
azd version

# Check AZD authentication
azd auth login --check-status
```

### 驗證可選的 Azure CLI 身份驗證

```bash
az account show
```

### 檢查 Node.js 版本
```bash
node --version
```

## 第 1 步：選擇並初始化範本

我們先從一個包含 React 前端和 Node.js API 後端的流行待辦事項應用程式範本開始。

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

### 剛才發生了什麼？
- 下載範本程式碼到本地目錄
- 建立帶有服務定義的 `azure.yaml` 檔案
- 在 `infra/` 目錄中設定基礎設施程式碼
- 建立環境配置

## 第 2 步：探索專案結構

讓我們檢視 azd 為我們建立了什麼：

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

您應該會看到：
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

### 主要要理解的檔案

**azure.yaml** - 您 azd 專案的核心：
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - 基礎設施定義：
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## 第 3 步：客製化您的專案（選用）

部署前，您可以自訂應用程式：

### 修改前端
```bash
# Open the React app component
code src/web/src/layout/header.tsx
```

做一個簡單的變更：
```tsx
// Replace the existing <Text variant="xLarge">ToDo</Text> element
<Text variant="xLarge">My Awesome Todo App</Text>
```

### 設定環境變數
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

這兩個自訂值僅示範本地儲存。基礎範本未使用 `WEBSITE_TITLE` 或 `API_VERSION`，因此不會改變應用程式。上述明確的來源修改改變了顯示的標題。

## 第 4 步：部署到 Azure

現在是令人興奮的部分——將所有東西部署到 Azure！

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

工作流程提供基礎設施，並包裝/部署程式碼。具體順序可透過 `workflows.up` 在 `azure.yaml` 中自訂；此範本指定先 provision 後 deploy。不要假設每個範本都用同一個階段順序。

### 預期輸出
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## 第 5 步：測試您的應用程式

### 訪問您的應用程式
按部署輸出的 URL，或隨時取得：
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -er '.services.web.ingressUrl'
```

### 測試待辦應用
1. <strong>新增待辦項目</strong> - 點選「Add Todo」並輸入任務
2. <strong>標示完成</strong> - 勾選已完成項目
3. <strong>刪除項目</strong> - 移除不再需要的待辦事項

### 監控您的應用程式
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd monitor --logs

# View live metrics
azd monitor --live
```

### ✅ 驗證您的部署

繼續前，請執行此快速檢查清單確認一切正常運作——不要假設「部署成功」就代表「應用程式運作正常」：

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

**當部署被驗證時：**
- ✅ `azd show` 列出可連接的端點 URL
- ✅ URL 可在瀏覽器中開啟且無錯誤
- ✅ 核心功能正常運作（新增/完成/刪除待辦）
- ✅ `azd monitor --logs` 顯示請求到達且無意外錯誤

若有任何檢查失敗，請跳至 [第 7 章：疑難排解](../chapter-07-troubleshooting/README.md)。

## 第 6 步：做更改並重新部署

讓我們做個更改，看看更新有多容易：

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

### 只部署程式碼變更
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## 第 7 步：管理多環境

建立測試環境以在生產前測試更改：

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

## 第 8 步：清理資源

實驗結束後，請清理以免產生持續費用：

```bash
# Review and delete BOTH environments created in this tutorial
azd down --environment dev
azd down --environment staging

# Automation alternative for a selected disposable environment:
# azd down --environment dev --force --purge
# --purge affects supported soft-deleted Azure resources, not local .azure files.
```

## 傳統應用程式與 AI 驅動應用程式：相同工作流程

您剛部署了一個傳統網頁應用。但如果想部署 AI 驅動的應用，比如由 Microsoft Foundry Models 支援的聊天應用呢？

好消息是：**工作流程相同。**

| 步驟 | 傳統待辦應用 | AI 聊天應用 |
|------|-----------------|-------------|
| 初始化 (空目錄) | `azd init --template todo-nodejs-mongo .` | `azd init --template azure-search-openai-demo .` |
| 身份驗證 | `azd auth login` | `azd auth login` |
| 部署 | `azd up` | `azd up` |
| 監控 | `azd monitor` | `azd monitor` |
| 清理 | `azd down --force --purge` | `azd down --force --purge` |

生命週期指令相同，但前提條件不同。AI 範本可能需要模型存取、區域配額、資料引入及額外配置。部署前請閱讀其 README；`azd up` 無法提供缺少的權限或配額。

這是 azd 的核心原則：**一套工作流程，適用於任何工作負載。** 您在本教學練習的技能—初始化、部署、監控、重新部署、清理—對 AI 應用和代理同樣適用。

---

## 您學到了什麼

恭喜您！您已成功：
- ✅ 從範本初始化 azd 專案
- ✅ 探索專案結構和主要檔案
- ✅ 部署全端應用程式到 Azure
- ✅ 做程式碼變更並重新部署
- ✅ 管理多個環境
- ✅ 清理資源

## 🎯 技能驗證練習

### 練習 1：部署不同範本（15 分鐘）
<strong>目標</strong>：展示對 azd init 和部署工作流程的熟練掌握

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
- [ ] 應用程式部署無錯誤
- [ ] 能在瀏覽器中存取應用程式 URL
- [ ] 應用程式功能正常（新增/移除待辦）
- [ ] 成功清理所有資源

### 練習 2：自訂配置（20 分鐘）
<strong>目標</strong>：練習本地環境值儲存，並了解其與執行時配置的差異

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
- [ ] 設定並能檢索環境變數
- [ ] `azd env get-value APP_TITLE` 輸出 `My Custom Todo App`
- [ ] 能說明為何這些值除非有程式碼/基礎設施使用，否則不會改變基礎範本應用

### 練習 3：多環境工作流程（25 分鐘）
<strong>目標</strong>：掌握環境管理與部署策略

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
- [ ] 建立兩個配置不同的環境
- [ ] 兩個環境成功部署
- [ ] 能用 `azd env select` 切換環境
- [ ] 環境變數在環境間不同
- [ ] 成功清理兩個環境

## 📊 您的進度

<strong>花費時間</strong>：約 60-90 分鐘  
<strong>已習得技能</strong>：
- ✅ 基於範本的專案初始化
- ✅ Azure 資源佈建
- ✅ 應用部署流程
- ✅ 環境管理
- ✅ 配置管理
- ✅ 資源清理與成本管理

<strong>下一階段</strong>：您已經準備好閱讀[配置指南](../chapter-03-configuration/configuration.md)以學習進階配置模式！

## 常見問題排解

### 身份驗證錯誤
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

完成您的第一個專案後，探究以下進階主題：

### 1. 自訂基礎設施
- [基礎設施即程式碼](../chapter-04-infrastructure/provisioning.md)
- [新增資料庫基礎設施](../chapter-04-infrastructure/provisioning.md#%EF%B8%8F-database-provisioning)

### 2. 設定持續整合／持續部署 (CI/CD)
- [部署指南](../chapter-04-infrastructure/deployment-guide.md) - 完整 CI/CD 流程
- [Azure Developer CLI 文件](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - 管線配置

### 3. 生產最佳實踐
- [部署指南](../chapter-04-infrastructure/deployment-guide.md) - 安全性、效能與監控

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

## 額外資源

### 學習材料
- [Azure Developer CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure 架構中心](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 良好架構框架](https://learn.microsoft.com/en-us/azure/well-architected/)

### 社群與支援
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer 社群](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### 範本與範例
- [官方範本畫廊](https://azure.github.io/awesome-azd/)
- [社群範本貢獻](https://github.com/Azure/awesome-azd)
- [待辦範本原始碼](https://github.com/Azure-Samples/todo-nodejs-mongo)

---

**恭喜完成您的第一個 azd 專案！** 您現在已準備好自信地在 Azure 上建置及部署出色的應用程式。

---

**章節導覽：**
- **📚 課程首頁**： [AZD 新手入門](../../README.md)
- **📖 目前章節**： 第一章 - 基礎與快速開始
- **⬅️ 上一章**： [安裝與設定](installation.md)
- **➡️ 下一章**： [帶入您自己的應用](bring-your-own-app.md)
- **🚀 下一章節**： [第二章：AI 優先開發](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議尋求專業人工翻譯。我們不對因使用本翻譯而引起的任何誤解或曲解承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->