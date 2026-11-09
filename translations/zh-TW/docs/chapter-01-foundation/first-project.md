# 你的第一個專案 - 實作教程

**章節導航：**
- **📚 課程首頁**: [AZD 入門](../../README.md)
- **📖 目前章節**: 第1章 - 基礎與快速開始
- **⬅️ 上一章**: [安裝與設定](installation.md)
- **➡️ 下一章**: [自備應用程式](bring-your-own-app.md)
- **🚀 下一個章節**: [第2章：AI優先開發](../chapter-02-ai-development/microsoft-foundry-integration.md)

## 介紹

歡迎使用你的第一個 Azure Developer CLI 專案！你將部署一個包含 React 前端、Node.js API 和 Azure Cosmos DB 的待辦事項應用程式。此範本保留了歷史名稱 `todo-nodejs-mongo`；其目前基礎架構使用 Cosmos DB 作為 NoSQL 資料庫，因此請檢視下載的 README 與 `infra/`，而不是僅從名稱推斷資料庫 API。

> 根據 `azd 1.37.2` 及 2026 年 11 月的公開範本進行檢視。以下範例使用 Bash；JSON 擷取亦需 `jq`。Azure 部署會產生費用，且在本次檢視期間未實際執行部署。

## 學習目標

完成本教程後，你將能：
- 精通使用範本進行 azd 專案初始化流程
- 理解 Azure Developer CLI 專案結構與設定檔
- 執行完整應用程式部署及基礎架構配置於 Azure
- 實作應用程式更新與重新部署策略
- 管理多重環境以支援開發與測試
- 套用資源清理與成本管理實務

## 學習成果

完成後，你將能：
- 獨立從範本初始化與配置 azd 專案
- 有效導航並修改 azd 專案架構
- 透過單一指令部署全端應用程式至 Azure
- 排解常見部署問題及驗證錯誤
- 管理多個 Azure 環境以配合不同部署階段
- 實作持續部署流程以更新應用程式

## 開始之前

### 先決條件清單
- ✅ 已安裝 Azure Developer CLI ([安裝指南](installation.md))
- ✅ 已使用 `azd auth login` 完成 AZD 認證
- ✅ 系統已安裝 Git
- ✅ Node.js 22 LTS（或下載範本所需的支援版本）
- ✅ 推薦使用 Visual Studio Code

在繼續之前，請從儲存庫根目錄執行設定驗證程式：

**Windows：** `./validate-setup.ps1`

**macOS / Linux：** `bash ./validate-setup.sh`

### 驗證您的設定
```bash
# Check azd installation
azd version

# Check AZD authentication
azd auth login --check-status
```

### 驗證選用的 Azure CLI 認證

```bash
az account show
```

### 檢查 Node.js 版本
```bash
node --version
```

## 步驟 1：選擇並初始化範本

讓我們從一個包含 React 前端和 Node.js API 後端的熱門待辦清單應用程式範本開始。

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
- 將範本程式碼下載到您的本機目錄
- 建立包含服務定義的 `azure.yaml` 檔案
- 在 `infra/` 目錄中設定基礎架構程式碼
- 建立環境設定檔

## 步驟 2：探索專案結構

讓我們看看 azd 幫我們建立了什麼：

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

### 重要檔案說明

**azure.yaml** - 您 azd 專案的核心：
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - 基礎架構定義：
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## 步驟 3：自訂您的專案（選用）

在部署之前，您可以自訂應用程式：

### 修改前端
```bash
# Open the React app component
code src/web/src/layout/header.tsx
```

做一個簡單的更改：
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

這兩個自訂值僅示範本地儲存。原始範本未使用 `WEBSITE_TITLE` 或 `API_VERSION`，因此不會改變應用程式功能。上方明確的程式碼變更則會更改顯示標題。

## 步驟 4：部署到 Azure

現在是令人興奮的部分—將所有東西部署到 Azure！

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### 部署過程中發生什麼？

工作流程會配置基礎設施並打包／部署程式碼。確切的排序可透過 `workflows.up` 在 `azure.yaml` 中自訂；此範本指定先配置再部署。不要假設所有範本的階段順序都相同。

### 預期輸出
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## 步驟 5：測試您的應用程式

### 存取您的應用程式
點擊部署輸出中提供的 URL，或隨時取得：
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -er '.services.web.ingressUrl'
```

### 測試待辦清單應用程式
1. <strong>添加待辦事項</strong> - 點擊「新增待辦」並輸入任務
2. <strong>標記完成</strong> - 勾選已完成的項目
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

在繼續之前，請用這個快速清單確認一切正常運作—不要僅假設「部署成功」就代表「應用程式可用」：

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

**部署驗證成功條件：**
- ✅ `azd show` 列出可連接的端點 URL
- ✅ URL 可在瀏覽器中開啟，且無錯誤
- ✅ 核心功能正常運作（新增／完成／刪除待辦事項）
- ✅ `azd monitor --logs` 顯示請求到達，且無預期外的錯誤

如果任何檢查失敗，請前往 [第 7 章：故障排除](../chapter-07-troubleshooting/README.md)。

## 步驟 6：進行更改並重新部署

讓我們進行更改，看看更新的流程有多簡單：

### 修改 API
```bash
# Edit the API code
code src/api/src/routes/lists.ts
```

添加自訂回應標頭：
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

建立一個預備環境以在正式發佈前測試：

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

實驗結束後，請清理以避免持續計費：

```bash
# Review and delete BOTH environments created in this tutorial
azd down --environment dev
azd down --environment staging

# Automation alternative for a selected disposable environment:
# azd down --environment dev --force --purge
# --purge affects supported soft-deleted Azure resources, not local .azure files.
```

## 傳統應用程式與 AI 驅動應用程式：相同流程

您剛部署了一個傳統的網頁應用程式。但如果您想部署一個 AI 驅動的應用，例如以 Microsoft Foundry Models 為後盾的聊天應用呢？

好消息是：**工作流程是一樣的。**

| 步驟 | 傳統待辦清單應用 | AI 聊天應用 |
|------|-----------------|-------------|
| 初始化 (空目錄) | `azd init --template todo-nodejs-mongo .` | `azd init --template azure-search-openai-demo .` |
| 認證 | `azd auth login` | `azd auth login` |
| 部署 | `azd up` | `azd up` |
| 監控 | `azd monitor` | `azd monitor` |
| 清理 | `azd down --force --purge` | `azd down --force --purge` |

生命週期命令相同，但先決條件不同。AI 範本可能需要模型存取權、區域配額、資料攝取及額外設定。部署前請閱讀其 README；`azd up` 無法補足缺失的權限或配額。

這是 azd 的核心原則：**一個工作流程，任何工作負載。** 你在本教程中練習的技能——初始化、部署、監控、重新部署和清理——同樣適用於 AI 應用程式和代理。

---

## 你學到了什麼

恭喜！你已成功：
- ✅ 從範本初始化 azd 專案
- ✅ 探索專案結構與關鍵檔案
- ✅ 部署全端應用程式到 Azure
- ✅ 修改程式碼並重新部署
- ✅ 管理多個環境
- ✅ 清理資源

## 🎯 技能驗證練習

### 練習 1：部署其他範本（15 分鐘）
<strong>目標</strong>：展現熟練 azd init 及部署流程

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
- [ ] 可在瀏覽器中存取應用程式 URL
- [ ] 應用程式功能正常（新增/移除待辦事項）
- [ ] 成功清理所有資源

### 練習 2：自訂設定（20 分鐘）
<strong>目標</strong>：練習本地環境值儲存，且不誤認其為執行時設定

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
- [ ] 環境變數已設定並可讀取
- [ ] `azd env get-value APP_TITLE` 輸出 `My Custom Todo App`
- [ ] 能解釋為何這些數值不會改變預設應用，除非程式碼/基礎設施使用它們

### 練習 3：多環境工作流程（25 分鐘）
<strong>目標</strong>：精通環境管理與部署策略

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
- [ ] 建立兩個不同設定的環境
- [ ] 兩個環境均成功部署
- [ ] 可使用 `azd env select` 切換環境
- [ ] 環境變數在不同環境間有所差異
- [ ] 成功清理兩個環境

## 📊 你的進展

<strong>投入時間</strong>：約 60-90 分鐘  
<strong>獲得技能</strong>：
- ✅ 範本式專案初始化
- ✅ Azure 資源配置
- ✅ 應用程式部署流程
- ✅ 環境管理
- ✅ 設定管理
- ✅ 資源清理與成本管理

<strong>下一階段</strong>：你已準備好進入 [設定指南](../chapter-03-configuration/configuration.md)，學習進階設定模式！

## 疑難排解常見問題

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

### 連接埠/網路問題
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## 下一步

現在你完成了第一個專案，探索以下進階主題：

### 1. 自訂基礎設施
- [基礎設施即代碼](../chapter-04-infrastructure/provisioning.md)
- [新增資料庫基礎設施](../chapter-04-infrastructure/provisioning.md#%EF%B8%8F-database-provisioning)

### 2. 設定 CI/CD
- [部署指南](../chapter-04-infrastructure/deployment-guide.md) - 完整 CI/CD 工作流程
- [Azure Developer CLI 文件](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - 管線設定

### 3. 生產環境最佳實務
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

## 其他資源

### 學習資料
- [Azure Developer CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure 架構中心](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 優良架構框架](https://learn.microsoft.com/en-us/azure/well-architected/)

### 社群與支援
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer 社群](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### 範本與範例
- [官方範本庫](https://azure.github.io/awesome-azd/)
- [社群範本貢獻](https://github.com/Azure/awesome-azd)
- [Todo 範本來源](https://github.com/Azure-Samples/todo-nodejs-mongo)

---

**恭喜完成你的第一個 azd 專案！** 你現在準備好自信地在 Azure 上構建與部署驚人的應用程式。

---

**章節導覽：**
- **📚 課程首頁**：[初學者使用 AZD](../../README.md)
- **📖 本章節**：第 1 章 - 基礎與快速入門
- **⬅️ 上一章**：[安裝與設定](installation.md)
- **➡️ 下一章**：[帶自己的應用程式](bring-your-own-app.md)
- **🚀 下一章節**：[第 2 章：AI 優先開發](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
此文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們努力追求準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用此翻譯所產生的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->