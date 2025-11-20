<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ba67ea0b26574a03ffcade6c98a9af60",
  "translation_date": "2025-11-20T09:14:59+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "mo"
}
-->
# 您的第一個專案 - 實作教學

**章節導航：**
- **📚 課程首頁**：[AZD 初學者指南](../../README.md)
- **📖 當前章節**：第 1 章 - 基礎與快速入門
- **⬅️ 上一章**：[安裝與設置](installation.md)
- **➡️ 下一章**：[配置](configuration.md)
- **🚀 下一章節**：[第 2 章：AI 優先開發](../microsoft-foundry/microsoft-foundry-integration.md)

## 簡介

歡迎來到您的第一個 Azure Developer CLI 專案！這份全面的實作教學將引導您完成使用 azd 在 Azure 上建立、部署及管理全端應用程式的完整流程。您將操作一個真實的待辦事項應用程式，包括 React 前端、Node.js API 後端及 MongoDB 資料庫。

## 學習目標

完成本教學後，您將能：
- 掌握使用範本初始化 azd 專案的工作流程
- 理解 Azure Developer CLI 專案結構及配置檔案
- 執行完整的應用程式部署至 Azure，並進行基礎設施配置
- 實施應用程式更新及重新部署策略
- 管理多個開發及測試環境
- 採用資源清理及成本管理的最佳實踐

## 學習成果

完成後，您將能：
- 獨立從範本初始化及配置 azd 專案
- 有效地瀏覽及修改 azd 專案結構
- 使用單一指令部署全端應用程式至 Azure
- 排除常見的部署問題及身份驗證問題
- 管理不同部署階段的多個 Azure 環境
- 實施應用程式更新的持續部署工作流程

## 開始使用

### 先決條件清單
- ✅ 已安裝 Azure Developer CLI ([安裝指南](installation.md))
- ✅ 已安裝並完成身份驗證的 Azure CLI
- ✅ 系統已安裝 Git
- ✅ Node.js 16+（適用於本教學）
- ✅ 建議使用 Visual Studio Code

### 驗證您的設置
```bash
# 檢查 azd 安裝
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

讓我們從一個流行的待辦事項應用程式範本開始，該範本包括 React 前端及 Node.js API 後端。

```bash
# 瀏覽可用的模板
azd template list

# 初始化待辦事項應用模板
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# 按照提示操作：
# - 輸入環境名稱："dev"
# - 選擇訂閱（如果您有多個）
# - 選擇地區："East US 2"（或您偏好的地區）
```

### 剛剛發生了什麼？
- 將範本代碼下載到您的本地目錄
- 建立了一個包含服務定義的 `azure.yaml` 檔案
- 在 `infra/` 目錄中設置了基礎設施代碼
- 建立了環境配置

## 步驟 2：探索專案結構

讓我們檢視 azd 為我們建立的內容：

```bash
# 查看項目結構
tree /f   # 視窗
# 或
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

**azure.yaml** - 您的 azd 專案核心：
```bash
# 查看項目配置
cat azure.yaml
```

**infra/main.bicep** - 基礎設施定義：
```bash
# 查看基礎設施代碼
head -30 infra/main.bicep
```

## 步驟 3：自訂您的專案（可選）

在部署之前，您可以自訂應用程式：

### 修改前端
```bash
# 打開 React 應用程式元件
code src/web/src/App.tsx
```

進行簡單的更改：
```typescript
// 找到標題並更改它
<h1>My Awesome Todo App</h1>
```

### 配置環境變數
```bash
# 設定自定義環境變數
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# 查看所有環境變數
azd env get-values
```

## 步驟 4：部署至 Azure

現在進入令人興奮的部分 - 將所有內容部署至 Azure！

```bash
# 部署基礎設施和應用程式
azd up

# 此命令將：
# 1. 配置 Azure 資源（App Service、Cosmos DB 等）
# 2. 建置您的應用程式
# 3. 部署至已配置的資源
# 4. 顯示應用程式的 URL
```

### 部署期間發生了什麼？

`azd up` 指令執行以下步驟：
1. **配置**（`azd provision`）- 建立 Azure 資源
2. **打包** - 建置您的應用程式代碼
3. **部署**（`azd deploy`）- 將代碼部署至 Azure 資源

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

### 訪問您的應用程式
點擊部署輸出中提供的 URL，或隨時獲取：
```bash
# 獲取應用程式端點
azd show

# 在瀏覽器中打開應用程式
azd show --output json | jq -r '.services.web.endpoint'
```

### 測試待辦事項應用程式
1. **新增待辦事項** - 點擊 "Add Todo" 並輸入任務
2. **標記為完成** - 勾選已完成的項目
3. **刪除項目** - 移除不再需要的待辦事項

### 監控您的應用程式
```bash
# 打開 Azure 入口網站以查看您的資源
azd monitor

# 查看應用程式日誌
azd logs
```

## 步驟 6：進行更改並重新部署

讓我們進行更改，看看更新有多簡單：

### 修改 API
```bash
# 編輯 API 代碼
code src/api/src/routes/lists.js
```

新增自訂回應標頭：
```javascript
// 尋找路由處理器並添加：
res.header('X-Powered-By', 'Azure Developer CLI');
```

### 僅部署代碼更改
```bash
# 僅部署應用程式代碼（跳過基礎設施）
azd deploy

# 這比 'azd up' 快得多，因為基礎設施已經存在
```

## 步驟 7：管理多個環境

建立測試環境以在生產之前測試更改：

```bash
# 建立新的暫存環境
azd env new staging

# 部署到暫存環境
azd up

# 切換回開發環境
azd env select dev

# 列出所有環境
azd env list
```

### 環境比較
```bash
# 查看開發環境
azd env select dev
azd show

# 查看暫存環境
azd env select staging
azd show
```

## 步驟 8：清理資源

完成實驗後，請清理以避免持續費用：

```bash
# 刪除當前環境的所有 Azure 資源
azd down

# 強制刪除且不需確認，並清除已軟刪除的資源
azd down --force --purge

# 刪除特定環境
azd env select staging
azd down --force --purge
```

## 您學到了什麼

恭喜！您已成功：
- ✅ 從範本初始化 azd 專案
- ✅ 探索專案結構及關鍵檔案
- ✅ 部署全端應用程式至 Azure
- ✅ 進行代碼更改並重新部署
- ✅ 管理多個環境
- ✅ 清理資源

## 🎯 技能驗證練習

### 練習 1：部署不同範本（15 分鐘）
**目標**：展示 azd 初始化及部署工作流程的掌握

```bash
# 嘗試使用 Python + MongoDB 堆疊
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# 驗證部署
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# 清理
azd down --force --purge
```

**成功標準：**
- [ ] 應用程式部署無錯誤
- [ ] 可在瀏覽器中訪問應用程式 URL
- [ ] 應用程式功能正常（新增/刪除待辦事項）
- [ ] 成功清理所有資源

### 練習 2：自訂配置（20 分鐘）
**目標**：練習環境變數配置

```bash
cd my-first-azd-app

# 建立自訂環境
azd env new custom-config

# 設定自訂變數
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# 驗證變數
azd env get-values | grep APP_TITLE

# 使用自訂配置部署
azd up
```

**成功標準：**
- [ ] 成功建立自訂環境
- [ ] 環境變數設置並可檢索
- [ ] 應用程式以自訂配置部署
- [ ] 可在部署的應用程式中驗證自訂設置

### 練習 3：多環境工作流程（25 分鐘）
**目標**：掌握環境管理及部署策略

```bash
# 建立開發環境
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# 記錄開發網址
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# 建立測試環境
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# 記錄測試網址
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# 比較環境
azd env list

# 測試兩個環境
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# 清理兩個環境
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**成功標準：**
- [ ] 建立兩個具有不同配置的環境
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
- ✅ 配置管理
- ✅ 資源清理及成本管理

**下一步**：您已準備好進入 [配置指南](configuration.md)，學習進階配置模式！

## 常見問題排查

### 身份驗證錯誤
```bash
# 重新驗證 Azure
az login

# 驗證訂閱訪問權限
az account show
```

### 部署失敗
```bash
# 啟用調試日誌
export AZD_DEBUG=true
azd up --debug

# 查看詳細日誌
azd logs --service api
azd logs --service web
```

### 資源名稱衝突
```bash
# 使用獨特的環境名稱
azd env new dev-$(whoami)-$(date +%s)
```

### 埠/網絡問題
```bash
# 檢查端口是否可用
netstat -an | grep :3000
netstat -an | grep :3100
```

## 下一步

完成您的第一個專案後，探索以下進階主題：

### 1. 自訂基礎設施
- [基礎設施即代碼](../deployment/provisioning.md)
- [新增資料庫、存儲及其他服務](../deployment/provisioning.md#adding-services)

### 2. 設置 CI/CD
- [GitHub Actions 整合](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### 3. 生產最佳實踐
- [安全配置](../deployment/best-practices.md#security)
- [性能優化](../deployment/best-practices.md#performance)
- [監控及日誌](../deployment/best-practices.md#monitoring)

### 4. 探索更多範本
```bash
# 按類別瀏覽模板
azd template list --filter web
azd template list --filter api
azd template list --filter database

# 嘗試不同的技術堆疊
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
- [Azure Developer 社群](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### 範本與範例
- [官方範本庫](https://azure.github.io/awesome-azd/)
- [社群範本](https://github.com/Azure-Samples/azd-templates)
- [企業模式](https://github.com/Azure/azure-dev/tree/main/templates)

---

**恭喜完成您的第一個 azd 專案！** 您現在可以自信地在 Azure 上建立及部署出色的應用程式。

---

**章節導航：**
- **📚 課程首頁**：[AZD 初學者指南](../../README.md)
- **📖 當前章節**：第 1 章 - 基礎與快速入門
- **⬅️ 上一章**：[安裝與設置](installation.md)
- **➡️ 下一章**：[配置](configuration.md)
- **🚀 下一章節**：[第 2 章：AI 優先開發](../microsoft-foundry/microsoft-foundry-integration.md)
- **下一課程**：[部署指南](../deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件已使用人工智能翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們致力於提供準確的翻譯，請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要信息，建議使用專業人工翻譯。我們對因使用此翻譯而引起的任何誤解或誤釋不承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->