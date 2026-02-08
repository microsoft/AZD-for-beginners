# 你的第一個專案 - 實作教學

**章節導覽：**
- **📚 課程主頁**： [AZD 初學者指南](../../README.md)
- **📖 目前章節**： 第 1 章 - 基礎與快速入門
- **⬅️ 上一章**： [安裝與設定](installation.md)
- **➡️ 下一章**： [設定](configuration.md)
- **🚀 下一章**： [第 2 章：以 AI 為先的開發](../chapter-02-ai-development/microsoft-foundry-integration.md)

## 介紹

歡迎使用你的第一個 Azure Developer CLI 專案！本完整的實作教學會完整示範如何使用 azd 在 Azure 上建立、部署及管理一個全端應用程式。你將操作一個真實的 todo 應用程式，包含 React 前端、Node.js API 後端以及 MongoDB 資料庫。

## 學習目標

完成本教學後，你將能：
- 熟練使用範本初始化 azd 專案的工作流程
- 了解 Azure Developer CLI 專案結構與設定檔
- 執行完整的應用程式部署至 Azure 並完成基礎設施佈建
- 實作應用程式更新與重新部署策略
- 管理多個開發與測試環境
- 套用資源清理與成本管理的最佳實務

## 預期學習成果

完成後，你會能：
- 獨立從範本初始化並設定 azd 專案
- 有效瀏覽與修改 azd 專案結構
- 使用單一指令將全端應用部署到 Azure
- 排解常見的部署問題與驗證相關問題
- 管理不同部署階段的多個 Azure 環境
- 為應用更新實作持續部署工作流程

## 開始使用

### 前置需求清單
- ✅ 已安裝 Azure Developer CLI（[安裝與設定](installation.md)）
- ✅ 已安裝並完成驗證的 Azure CLI
- ✅ 已在系統安裝 Git
- ✅ Node.js 16+（本教學適用）
- ✅ 推薦使用 Visual Studio Code

### 驗證你的環境設定
```bash
# 檢查 azd 是否已安裝
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

我們先從一個常見的 todo 應用程式範本開始，該範本包含 React 前端和 Node.js API 後端。

```bash
# 瀏覽可用的範本
azd template list

# 初始化待辦應用程式範本
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# 按照提示:
# - 輸入環境名稱: "dev"
# - 選擇訂閱(如果你有多個)
# - 選擇地區: "East US 2" (或你偏好的地區)
```

### 剛才發生了什麼？
- 下載了範本程式碼到你的本機目錄
- 建立一個 `azure.yaml` 檔案，內含服務定義
- 在 `infra/` 目錄中設定基礎設施程式碼
- 建立了一個環境設定檔

## 步驟 2：探索專案結構

讓我們檢視 azd 為我們建立的內容：

```bash
# 檢視專案結構
tree /f   # Windows
# 或
find . -type f | head -20   # macOS/Linux
```

你應該會看到：
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

### 重要檔案說明

**azure.yaml** - 你的 azd 專案核心：
```bash
# 檢視專案設定
cat azure.yaml
```

**infra/main.bicep** - 基礎設施定義：
```bash
# 檢視基礎設施程式碼
head -30 infra/main.bicep
```

## 步驟 3：客製化你的專案（可選）

在部署前，你可以客製化應用程式：

### 修改前端
```bash
# 開啟 React 應用程式組件
code src/web/src/App.tsx
```

做一個簡單的更改：
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

## 步驟 4：部署到 Azure

到了最令人興奮的部分 — 將所有東西部署到 Azure！

```bash
# 部署基礎設施及應用程式
azd up

# 此命令會：
# 1. 配置 Azure 資源（例如 App Service、Cosmos DB 等）
# 2. 建置你的應用程式
# 3. 部署到已配置的資源
# 4. 顯示應用程式的 URL
```

### 部署期間發生了什麼？

`azd up` 指令會執行以下步驟：
1. **Provision** (`azd provision`) - 建立 Azure 資源
2. **Package** - 建置你的應用程式程式碼
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

## 步驟 5：測試你的應用程式

### 存取你的應用程式
點擊部署輸出中提供的 URL，或隨時取得：
```bash
# 取得應用程式端點
azd show

# 在瀏覽器中開啟應用程式
azd show --output json | jq -r '.services.web.endpoint'
```

### 測試 todo 應用程式
1. **新增 todo 項目** - 按 "Add Todo" 並輸入任務
2. **標示為完成** - 勾選已完成的項目
3. **刪除項目** - 移除你不再需要的 todo 項目

### 監控你的應用程式
```bash
# 於 Azure 入口網站開啟您的資源
azd monitor

# 檢視應用程式日誌
azd monitor --logs

# 檢視即時指標
azd monitor --live
```

## 步驟 6：修改並重新部署

我們來做一個更動，看看更新有多簡單：

### 修改 API
```bash
# 編輯 API 程式碼
code src/api/src/routes/lists.js
```

加入自訂回應標頭：
```javascript
// 尋找一個路由處理器並加入：
res.header('X-Powered-By', 'Azure Developer CLI');
```

### 僅部署程式碼變更
```bash
# 只部署應用程式程式碼（跳過基礎架構）
azd deploy

# 由於基礎架構已存在，這比 'azd up' 快得多
```

## 步驟 7：管理多個環境

建立一個測試（staging）環境，在上線前測試變更：

```bash
# 建立新的預備環境
azd env new staging

# 部署到預備環境
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

# 檢視預發環境
azd env select staging
azd show
```

## 步驟 8：清理資源

當你完成試驗後，請清理資源以避免持續產生費用：

```bash
# 刪除目前環境的所有 Azure 資源
azd down

# 強制刪除而不作確認，並清除已軟刪除的資源
azd down --force --purge

# 刪除指定環境
azd env select staging
azd down --force --purge
```

## 你已學會的內容

恭喜！你已成功：
- ✅ 從範本初始化 azd 專案
- ✅ 探索專案結構與重要檔案
- ✅ 將全端應用程式部署到 Azure
- ✅ 進行程式碼變更並重新部署
- ✅ 管理多個環境
- ✅ 清理資源

## 🎯 技能驗證練習

### 練習 1：部署不同的範本（15 分鐘）
**目標**：展示對 azd init 與部署流程的熟練度

```bash
# 試用 Python + MongoDB 技術堆疊
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
- [ ] 應用程式無錯誤地部署
- [ ] 能在瀏覽器中存取應用程式 URL
- [ ] 應用程式功能正常（新增/移除 todo）
- [ ] 成功清理所有資源

### 練習 2：自訂設定（20 分鐘）
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

**成功標準：**
- [ ] 成功建立自訂環境
- [ ] 環境變數已設定並可取得
- [ ] 應用程式以自訂設定部署成功
- [ ] 能在已部署的應用中驗證自訂設定

### 練習 3：多環境工作流程（25 分鐘）
**目標**：掌握環境管理與部署策略

```bash
# 建立開發環境
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# 記錄開發環境的網址
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# 建立預發環境
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# 記錄預發環境的網址
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

**成功標準：**
- [ ] 建立了兩個具有不同設定的環境
- [ ] 兩個環境皆成功部署
- [ ] 可使用 `azd env select` 在環境之間切換
- [ ] 各環境之間的環境變數不同
- [ ] 成功清理兩個環境

## 📊 你的進度

**投入時間**：約 60-90 分鐘  
**已獲得技能**：
- ✅ 以範本為基礎的專案初始化
- ✅ Azure 資源佈建
- ✅ 應用程式部署工作流程
- ✅ 環境管理
- ✅ 設定管理
- ✅ 資源清理與成本管理

**下一步**：你已準備好學習進階設定模式，請參閱 [設定指南](configuration.md)！

## 常見問題排解

### 驗證錯誤
```bash
# 重新與 Azure 進行驗證
az login

# 驗證訂閱存取權限
az account show
```

### 部署失敗
```bash
# 啟用偵錯日誌
export AZD_DEBUG=true
azd up --debug

# 在 Azure 檢視應用程式日誌
azd monitor --logs

# 對於 Container Apps，請使用 Azure CLI：
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### 資源名稱衝突
```bash
# 使用唯一的環境名稱
azd env new dev-$(whoami)-$(date +%s)
```

### 埠/網路問題
```bash
# 檢查連接埠是否可用
netstat -an | grep :3000
netstat -an | grep :3100
```

## 後續步驟

現在你已完成第一個專案，探索以下進階主題：

### 1. 客製化基礎設施
- [基礎設施即程式碼](../chapter-04-infrastructure/provisioning.md)
- [新增資料庫、儲存與其他服務](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. 設定 CI/CD
- [部署指南](../chapter-04-infrastructure/deployment-guide.md) - 完整的 CI/CD 工作流程
- [Azure Developer CLI 文件](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - 管線設定

### 3. 上線最佳實務
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
- [官方範本目錄](https://azure.github.io/awesome-azd/)
- [社群範本](https://github.com/Azure-Samples/azd-templates)
- [企業範例](https://github.com/Azure/azure-dev/tree/main/templates)

---

**恭喜完成你的第一個 azd 專案！** 你現在已準備好在 Azure 上自信地建置和部署令人驚豔的應用程式。

---

**章節導覽：**
- **📚 課程主頁**： [AZD 初學者指南](../../README.md)
- **📖 目前章節**： 第 1 章 - 基礎與快速入門
- **⬅️ 上一章**： [安裝與設定](installation.md)
- **➡️ 下一章**： [設定](configuration.md)
- **🚀 下一章**： [第 2 章：以 AI 為先的開發](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **下一課程**： [部署指南](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責聲明：
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們會盡力確保準確性，但請注意，自動翻譯可能包含錯誤或不準確之處。應以原始語言的文件為準。對於重要資訊，建議採用專業人工翻譯。對於因使用此翻譯而導致的任何誤解或錯誤詮釋，我們概不負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->