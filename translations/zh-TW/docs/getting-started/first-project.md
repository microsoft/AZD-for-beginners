# 您的第一個專案 - 實作教學

**章節導覽：**
- **📚 課程首頁**：[AZD 初學者指南](../../README.md)
- **📖 本章節**：第 1 章 - 基礎與快速入門
- **⬅️ 上一章**：[安裝與設定](installation.md)
- **➡️ 下一章**：[設定](configuration.md)
- **🚀 下一章節**：[第 2 章：AI 優先開發](../microsoft-foundry/microsoft-foundry-integration.md)

## 簡介

歡迎來到您的第一個 Azure Developer CLI 專案！這份完整的實作教學將引導您從頭到尾建立、部署及管理一個完整的全端應用程式，使用 azd 在 Azure 上進行操作。您將使用一個真實的待辦事項應用程式，包含 React 前端、Node.js API 後端，以及 MongoDB 資料庫。

## 學習目標

完成本教學後，您將能：
- 熟練使用範本進行 azd 專案初始化流程
- 了解 Azure Developer CLI 專案結構及設定檔案
- 完整執行應用程式部署至 Azure，並進行基礎架構配置
- 實作應用程式更新及重新部署策略
- 管理多個開發及測試環境
- 採用資源清理及成本管理的最佳實踐

## 學習成果

完成後，您將能：
- 獨立從範本初始化及設定 azd 專案
- 有效瀏覽及修改 azd 專案結構
- 使用單一指令部署全端應用程式至 Azure
- 排除常見部署問題及身份驗證問題
- 管理不同部署階段的多個 Azure 環境
- 實作應用程式更新的持續部署工作流程

## 開始使用

### 先決條件清單
- ✅ 已安裝 Azure Developer CLI ([安裝指南](installation.md))
- ✅ 已安裝並完成身份驗證的 Azure CLI
- ✅ 系統已安裝 Git
- ✅ Node.js 16+（適用於本教學）
- ✅ 建議使用 Visual Studio Code

### 驗證您的設定
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

## 第一步：選擇並初始化範本

我們從一個受歡迎的待辦事項應用程式範本開始，該範本包含 React 前端及 Node.js API 後端。

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
- 建立了一個包含服務定義的 `azure.yaml` 檔案
- 在 `infra/` 目錄中設置了基礎架構程式碼
- 建立了環境設定

## 第二步：探索專案結構

讓我們檢視 azd 為我們建立的內容：

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

您應該看到：
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

## 第三步：自訂您的專案（選擇性）

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

### 設定環境變數
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

## 第四步：部署至 Azure

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

### 部署期間發生了什麼？

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

## 第五步：測試您的應用程式

### 存取您的應用程式
點擊部署輸出中提供的 URL，或隨時取得：
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### 測試待辦事項應用程式
1. **新增待辦事項** - 點擊「新增待辦事項」，並輸入任務
2. **標記為完成** - 勾選已完成的項目
3. **刪除項目** - 移除不再需要的待辦事項

### 監控您的應用程式
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## 第六步：進行更改並重新部署

讓我們進行更改，看看更新有多簡單：

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

## 第七步：管理多個環境

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

## 第八步：清理資源

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
- ✅ 從範本初始化 azd 專案
- ✅ 探索專案結構及關鍵檔案
- ✅ 部署全端應用程式至 Azure
- ✅ 進行程式碼更改並重新部署
- ✅ 管理多個環境
- ✅ 清理資源

## 🎯 技能驗證練習

### 練習 1：部署不同範本（15 分鐘）
**目標**：展示 azd 初始化及部署工作流程的掌握程度

```bash
# Try Python + MongoDB stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Verify deployment
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Clean up
azd down --force --purge
```

**成功標準：**
- [ ] 應用程式部署無錯誤
- [ ] 可在瀏覽器中存取應用程式 URL
- [ ] 應用程式功能正常（新增/刪除待辦事項）
- [ ] 成功清理所有資源

### 練習 2：自訂設定（20 分鐘）
**目標**：練習環境變數設定

```bash
cd my-first-azd-app

# Create custom environment
azd env new custom-config

# Set custom variables
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verify variables
azd env get-values | grep APP_TITLE

# Deploy with custom config
azd up
```

**成功標準：**
- [ ] 成功建立自訂環境
- [ ] 環境變數已設定並可檢索
- [ ] 應用程式以自訂設定部署
- [ ] 可在部署的應用程式中驗證自訂設定

### 練習 3：多環境工作流程（25 分鐘）
**目標**：掌握環境管理及部署策略

```bash
# Create dev environment
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Note dev URL
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Create staging environment
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Note staging URL
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Compare environments
azd env list

# Test both environments
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Clean up both
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**成功標準：**
- [ ] 建立兩個具有不同設定的環境
- [ ] 兩個環境均成功部署
- [ ] 可使用 `azd env select` 在環境間切換
- [ ] 環境變數在不同環境間有所不同
- [ ] 成功清理兩個環境

## 📊 您的進度

**投入時間**：約 60-90 分鐘  
**獲得技能**：
- ✅ 基於範本的專案初始化
- ✅ Azure 資源配置
- ✅ 應用程式部署工作流程
- ✅ 環境管理
- ✅ 設定管理
- ✅ 資源清理及成本管理

**下一步**：您已準備好進入[設定指南](configuration.md)，學習進階設定模式！

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
- [新增資料庫、儲存空間及其他服務](../deployment/provisioning.md#adding-services)

### 2. 設置 CI/CD
- [GitHub Actions 整合](../deployment/cicd-integration.md)
- [Azure DevOps 管線](../deployment/cicd-integration.md#azure-devops)

### 3. 正式環境最佳實踐
- [安全性設定](../deployment/best-practices.md#security)
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
- [官方範本集](https://azure.github.io/awesome-azd/)
- [社群範本](https://github.com/Azure-Samples/azd-templates)
- [企業模式](https://github.com/Azure/azure-dev/tree/main/templates)

---

**恭喜完成您的第一個 azd 專案！** 您現在已準備好自信地在 Azure 上建置及部署出色的應用程式。

---

**章節導覽：**
- **📚 課程首頁**：[AZD 初學者指南](../../README.md)
- **📖 本章節**：第 1 章 - 基礎與快速入門
- **⬅️ 上一章**：[安裝與設定](installation.md)
- **➡️ 下一章**：[設定](configuration.md)
- **🚀 下一章節**：[第 2 章：AI 優先開發](../microsoft-foundry/microsoft-foundry-integration.md)
- **下一課程**：[部署指南](../deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們致力於提供準確的翻譯，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於關鍵資訊，建議使用專業人工翻譯。我們對因使用此翻譯而產生的任何誤解或誤釋不承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->