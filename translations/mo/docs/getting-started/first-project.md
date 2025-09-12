<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e131a5271d4c8eb0d44ae82302f8fd1a",
  "translation_date": "2025-09-12T18:44:27+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "mo"
}
-->
# 您的第一個專案 - 實作教學

**上一章:** [配置](configuration.md) | **下一章:** [Azure AI Foundry 整合](../ai-foundry/azure-ai-foundry-integration.md)

## 簡介

歡迎來到您的第一個 Azure Developer CLI 專案！這份完整的實作教學將帶您一步步完成使用 azd 在 Azure 上建立、部署及管理全端應用程式的過程。您將操作一個真實的待辦事項應用程式，包含 React 前端、Node.js API 後端，以及 MongoDB 資料庫。

## 學習目標

完成本教學後，您將能夠：
- 掌握使用範本初始化 azd 專案的工作流程
- 理解 Azure Developer CLI 專案結構及配置檔案
- 執行完整的應用程式部署至 Azure，並進行基礎架構配置
- 實施應用程式更新及重新部署策略
- 管理多個開發及測試環境
- 採取資源清理及成本管理的最佳實踐

## 學習成果

完成後，您將能夠：
- 獨立從範本初始化及配置 azd 專案
- 有效地瀏覽及修改 azd 專案結構
- 使用單一指令部署全端應用程式至 Azure
- 排除常見的部署問題及身份驗證問題
- 管理多個 Azure 環境以適應不同的部署階段
- 實施持續部署工作流程以進行應用程式更新

## 開始使用

### 先決條件清單
- ✅ 已安裝 Azure Developer CLI ([安裝指南](installation.md))
- ✅ 已安裝並完成身份驗證的 Azure CLI
- ✅ 系統已安裝 Git
- ✅ Node.js 16+ (本教學需要)
- ✅ 建議使用 Visual Studio Code

### 驗證您的設置
```bash
# Check azd installation
azd version
```
### 驗證 Azure 身份驗證

```bash
az account show
```

### 檢查 Node.js 版本
```bash
node --version
```

## 步驟 1：選擇並初始化範本

讓我們從一個受歡迎的待辦事項應用程式範本開始，該範本包含 React 前端及 Node.js API 後端。

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### 剛剛發生了什麼？
- 將範本程式碼下載到您的本地目錄
- 建立了一個 `azure.yaml` 檔案，包含服務定義
- 在 `infra/` 目錄中設置了基礎架構程式碼
- 建立了環境配置

## 步驟 2：探索專案結構

讓我們檢視 azd 為我們建立的內容：

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

您應該會看到：
```
my-first-azd-app/
├── .azd/
│   └── config.json              # Project configuration
├── .azure/
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── modules/                # Reusable infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   ├── package.json       # Node.js dependencies
│   │   └── Dockerfile         # Container configuration
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       ├── package.json       # React dependencies
│       └── Dockerfile         # Container configuration
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### 關鍵檔案解析

**azure.yaml** - azd 專案的核心：
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - 基礎架構定義：
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## 步驟 3：自訂您的專案 (可選)

在部署之前，您可以自訂應用程式：

### 修改前端
```bash
# Open the React app component
code src/web/src/App.tsx
```

進行簡單的更改：
```typescript
// Find the title and change it
<h1>My Awesome Todo App</h1>
```

### 配置環境變數
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

## 步驟 4：部署至 Azure

現在進入令人興奮的部分 - 將所有內容部署到 Azure！

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

`azd up` 指令執行以下步驟：
1. **配置** (`azd provision`) - 建立 Azure 資源
2. **打包** - 建置您的應用程式程式碼
3. **部署** (`azd deploy`) - 將程式碼部署到 Azure 資源

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
azd show --output json | jq -r '.services.web.endpoint'
```

### 測試待辦事項應用程式
1. **新增待辦事項** - 點擊 "Add Todo" 並輸入任務
2. **標記為完成** - 勾選已完成的項目
3. **刪除項目** - 移除不再需要的待辦事項

### 監控您的應用程式
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## 步驟 6：進行更改並重新部署

讓我們進行更改並看看更新有多簡單：

### 修改 API
```bash
# Edit the API code
code src/api/src/routes/lists.js
```

新增自訂回應標頭：
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### 僅部署程式碼更改
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## 步驟 7：管理多個環境

建立測試環境以在正式環境之前測試更改：

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

完成實驗後，清理資源以避免持續費用：

```bash
# Delete all Azure resources for current environment
azd down

# Force delete without confirmation and purge soft-deleted resources
azd down --force --purge

# Delete specific environment
azd env select staging
azd down --force --purge
```

## 您學到了什麼

恭喜！您已成功：
- 從範本初始化 azd 專案
- 探索專案結構及關鍵檔案
- 部署全端應用程式至 Azure
- 進行程式碼更改並重新部署
- 管理多個環境
- 清理資源

## 常見問題排解

### 身份驗證錯誤
```bash
# Re-authenticate with Azure
az login

# Verify subscription access
az account show
```

### 部署失敗
```bash
# Enable debug logging
export AZD_DEBUG=true
azd up --debug

# View detailed logs
azd logs --service api
azd logs --service web
```

### 資源名稱衝突
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### 埠/網路問題
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## 下一步

完成您的第一個專案後，探索以下進階主題：

### 1. 自訂基礎架構
- [基礎架構即程式碼](../deployment/provisioning.md)
- [新增資料庫、儲存及其他服務](../deployment/provisioning.md#adding-services)

### 2. 設置 CI/CD
- [GitHub Actions 整合](../deployment/cicd-integration.md)
- [Azure DevOps 管線](../deployment/cicd-integration.md#azure-devops)

### 3. 正式環境最佳實踐
- [安全性配置](../deployment/best-practices.md#security)
- [效能優化](../deployment/best-practices.md#performance)
- [監控及日誌](../deployment/best-practices.md#monitoring)

### 4. 探索更多範本
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## 其他資源

### 學習材料
- [Azure Developer CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure 架構中心](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 良好架構框架](https://learn.microsoft.com/en-us/azure/well-architected/)

### 社群與支援
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure 開發者社群](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### 範本與範例
- [官方範本庫](https://azure.github.io/awesome-azd/)
- [社群範本](https://github.com/Azure-Samples/azd-templates)
- [企業模式](https://github.com/Azure/azure-dev/tree/main/templates)

---

**恭喜完成您的第一個 azd 專案！** 您現在已準備好自信地在 Azure 上建立及部署出色的應用程式。

---

**上一章:** [配置](configuration.md) | **下一章:** [Azure AI Foundry 整合](../ai-foundry/azure-ai-foundry-integration.md)
- **下一課:** [部署指南](../deployment/deployment-guide.md)

---

**免責聲明**：  
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們致力於提供準確的翻譯，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於關鍵信息，建議尋求專業人工翻譯。我們對因使用此翻譯而引起的任何誤解或誤釋不承擔責任。