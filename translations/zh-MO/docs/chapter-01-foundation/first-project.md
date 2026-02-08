# 你的第一個專案 - 實作教學

**章節導覽：**
- **📚 課程首頁**: [AZD 初學者指南](../../README.md)
- **📖 目前章節**: 第 1 章 - 基礎與快速上手
- **⬅️ 上一章**: [安裝與設定](installation.md)
- **➡️ 下一章**: [設定](configuration.md)
- **🚀 下一章節**: [第 2 章：AI 優先開發](../chapter-02-ai-development/microsoft-foundry-integration.md)

## 介紹

歡迎來到您的第一個 Azure Developer CLI 專案！這份完整的實作教學會帶您一步步建立、部署及管理在 Azure 上的全端應用程式，使用 azd。您將使用一個實際的待辦事項應用程式，其中包含 React 前端、Node.js API 後端以及 MongoDB 資料庫。

## 學習目標

完成本教學後，您將能：
- 精通使用範本初始化 azd 專案的工作流程
- 了解 Azure Developer CLI 專案結構與設定檔
- 執行完整的應用程式部署到 Azure 並同時完成基礎結構佈建
- 實作應用程式更新與重新部署策略
- 管理用於開發與測試的多個環境
- 應用資源清理與成本管理的做法

## 學習成果

完成後，您將能：
- 獨立從範本初始化並設定 azd 專案
- 有效瀏覽並修改 azd 專案結構
- 使用單一指令將全端應用程式部署至 Azure
- 疑難排解常見的部署問題與驗證問題
- 管理不同部署階段的多個 Azure 環境
- 為應用程式更新實作持續部署工作流程

## 開始

### 先決事項檢查表
- ✅ Azure Developer CLI 已安裝（[安裝指南](installation.md)）
- ✅ 已安裝並完成驗證的 Azure CLI
- ✅ 系統已安裝 Git
- ✅ 已安裝 Node.js 16+（本教學使用）
- ✅ 建議使用 Visual Studio Code

### 驗證您的設定
```bash
# 檢查 azd 是否已安裝
azd version
```
### 驗證 Azure 認證

```bash
az account show
```

### 檢查 Node.js 版本
```bash
node --version
```

## 第1步：選擇並初始化範本

我們從一個流行的待辦事項應用程式範本開始，該範本包含 React 前端以及 Node.js API 後端。

```bash
# 瀏覽可用的範本
azd template list

# 初始化待辦事項應用程式範本
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# 跟隨提示:
# - 輸入環境名稱: "dev"
# - 選擇一個訂閱 (如果你有多個)
# - 選擇一個地區: "East US 2" (或你偏好的地區)
```

### 剛剛發生了什麼？
- 已將範本程式碼下載到本機目錄
- 已建立 `azure.yaml` 檔案，內含服務定義
- 已在 `infra/` 目錄中設定基礎結構程式碼
- 已建立環境設定

## 第2步：探索專案結構

讓我們檢視 azd 為我們建立的內容：

```bash
# 檢視專案結構
tree /f   # Windows
# 或
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

### 需了解的主要檔案

**azure.yaml** - 您 azd 專案的核心：
```bash
# 檢視專案設定
cat azure.yaml
```

**infra/main.bicep** - 基礎結構定義：
```bash
# 檢視基礎架構程式碼
head -30 infra/main.bicep
```

## 第3步：客製化您的專案（可選）

在部署之前，您可以自訂應用程式：

### 修改前端
```bash
# 開啟 React 應用程式元件
code src/web/src/App.tsx
```

做一個簡單變更：
```typescript
// 找到標題並更改它
<h1>My Awesome Todo App</h1>
```

### 設定環境變數
```bash
# 設定自訂環境變數
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# 檢視所有環境變數
azd env get-values
```

## 第4步：部署到 Azure

現在來到刺激的部分 —— 將所有內容部署到 Azure！

```bash
# 部署基礎架構與應用程式
azd up

# 此指令將會：
# 1. 佈建 Azure 資源（App Service、Cosmos DB 等）
# 2. 建置您的應用程式
# 3. 部署到已佈建的資源
# 4. 顯示應用程式的 URL
```

### 部署期間發生了什麼？

`azd up` 指令會執行以下步驟：
1. **Provision** (`azd provision`) - 建立 Azure 資源
2. **Package** - 建置您的應用程式程式碼
3. **Deploy** (`azd deploy`) - 將程式碼部署到 Azure 資源

### 預期輸出
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## 第5步：測試您的應用程式

### 存取您的應用程式
點選部署輸出中提供的 URL，或隨時取得：
```bash
# 取得應用程式端點
azd show

# 在瀏覽器中開啟應用程式
azd show --output json | jq -r '.services.web.endpoint'
```

### 測試待辦事項應用程式
1. **新增一個待辦項目** - 按一下「新增待辦」，並輸入一個任務
2. **標記為完成** - 勾選已完成的項目
3. **刪除項目** - 移除不再需要的待辦

### 監控您的應用程式
```bash
# 開啟 Azure 入口網站以存取您的資源
azd monitor

# 檢視應用程式日誌
azd monitor --logs

# 檢視即時指標
azd monitor --live
```

## 第6步：修改並重新部署

讓我們做個變更，看看更新有多簡單：

### 修改 API
```bash
# 編輯 API 程式碼
code src/api/src/routes/lists.js
```

新增自訂回應標頭：
```javascript
// 尋找一個路由處理程式並加入：
res.header('X-Powered-By', 'Azure Developer CLI');
```

### 只部署程式碼變更
```bash
# 只部署應用程式的程式碼（跳過基礎架構）
azd deploy

# 由於基礎架構已存在，這比 'azd up' 快得多
```

## 第7步：管理多個環境

建立一個暫存環境，在正式上線前測試變更：

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
# 檢視開發環境
azd env select dev
azd show

# 檢視預備環境
azd env select staging
azd show
```

## 第8步：清理資源

實驗完成後，請清理以避免持續產生費用：

```bash
# 刪除目前環境的所有 Azure 資源
azd down

# 強制刪除而無需確認，並清除已軟刪除的資源
azd down --force --purge

# 刪除指定的環境
azd env select staging
azd down --force --purge
```

## 您學到了什麼

恭喜！您已成功：
- ✅ 從範本初始化 azd 專案
- ✅ 探索專案結構與主要檔案
- ✅ 將全端應用程式部署到 Azure
- ✅ 修改程式碼並重新部署
- ✅ 管理多個環境
- ✅ 清理資源

## 🎯 技能驗證練習

### 練習1：部署不同的範本（15 分鐘）
**目標**：示範對 azd init 與部署工作流程的熟練掌握

```bash
# 嘗試 Python + MongoDB 技術堆疊
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# 驗證部署
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# 清理
azd down --force --purge
```

**成功準則：**
- [ ] 應用程式部署無誤
- [ ] 能在瀏覽器中存取應用程式 URL
- [ ] 應用程式運作正常（可以新增/刪除待辦）
- [ ] 成功清理所有資源

### 練習2：自訂設定（20 分鐘）
**目標**：練習環境變數設定

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

# 使用自訂設定部署
azd up
```

**成功準則：**
- [ ] 成功建立自訂環境
- [ ] 環境變數已設定且可擷取
- [ ] 應用程式以自訂設定部署成功
- [ ] 可在已部署的應用程式中驗證自訂設定

### 練習3：多環境工作流程（25 分鐘）
**目標**：精通環境管理與部署策略

```bash
# 建立開發環境
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# 記下開發環境的 URL
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# 建立暫存環境
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# 記下暫存環境的 URL
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# 比較兩個環境
azd env list

# 測試兩個環境
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# 清理兩個環境
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**成功準則：**
- [ ] 建立兩個具有不同設定的環境
- [ ] 兩個環境皆成功部署
- [ ] 可使用 `azd env select` 在環境間切換
- [ ] 各環境之間的環境變數不同
- [ ] 成功清理兩個環境

## 📊 您的進度

**投入時間**：約 60-90 分鐘  
**獲得技能**：
- ✅ 基於範本的專案初始化
- ✅ Azure 資源佈建
- ✅ 應用程式部署工作流程
- ✅ 環境管理
- ✅ 設定管理
- ✅ 資源清理與成本管理

**下一階段**：您已準備好前往 [設定指南](configuration.md) 學習進階設定範例！

## 常見問題排解

### 認證錯誤
```bash
# 重新與 Azure 進行身份驗證
az login

# 驗證訂閱存取權限
az account show
```

### 部署失敗
```bash
# 啟用偵錯記錄
export AZD_DEBUG=true
azd up --debug

# 在 Azure 檢視應用程式日誌
azd monitor --logs

# 對於 Container Apps，使用 Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### 資源名稱衝突
```bash
# 使用唯一的環境名稱
azd env new dev-$(whoami)-$(date +%s)
```

### 埠/網路問題
```bash
# 檢查埠是否可用
netstat -an | grep :3000
netstat -an | grep :3100
```

## 後續步驟

現在您已完成第一個專案，請探索以下進階主題：

### 1. 客製化基礎結構
- [基礎設施即程式碼](../chapter-04-infrastructure/provisioning.md)
- [新增資料庫、儲存與其他服務](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. 設定 CI/CD
- [部署指南](../chapter-04-infrastructure/deployment-guide.md) - 完整 CI/CD 工作流程
- [Azure Developer CLI 文件](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - 管線設定

### 3. 生產環境最佳實務
- [部署指南](../chapter-04-infrastructure/deployment-guide.md) - 安全性、效能與監控

### 4. 探索更多範本
```bash
# 按類別瀏覽範本
azd template list --filter web
azd template list --filter api
azd template list --filter database

# 嘗試不同的技術堆疊
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## 其他資源

### 學習資料
- [Azure Developer CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure 架構中心](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 良好架構框架](https://learn.microsoft.com/en-us/azure/well-architected/)

### 社群與支援
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### 範本與範例
- [官方範本館](https://azure.github.io/awesome-azd/)
- [社群範本](https://github.com/Azure-Samples/azd-templates)
- [企業範例](https://github.com/Azure/azure-dev/tree/main/templates)

---

**恭喜完成您的第一個 azd 專案！** 您現在已準備好自信地在 Azure 上建立與部署出色的應用程式。

---

**章節導覽：**
- **📚 課程首頁**: [AZD 初學者指南](../../README.md)
- **📖 目前章節**: 第 1 章 - 基礎與快速上手
- **⬅️ 上一章**: [安裝與設定](installation.md)
- **➡️ 下一章**: [設定](configuration.md)
- **🚀 下一章節**: [第 2 章：AI 優先開發](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **下一課程**: [部署指南](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責聲明：
本文件經由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 所翻譯。儘管我們力求準確，請注意自動翻譯可能包含錯誤或不準確之處。原始語言的文件應被視為具權威性的版本。若涉及重要資訊，建議採用專業人工翻譯。我們對因使用本翻譯而引致之任何誤解或錯誤詮釋概不負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->