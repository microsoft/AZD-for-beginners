# 你的第一個專案 - 實作教學

**章節導覽：**
- **📚 課程首頁**: [AZD 初學者指南](../../README.md)
- **📖 目前章節**: 第 1 章 - 基礎與快速入門
- **⬅️ 上一章**: [安裝與設定](installation.md)
- **➡️ 下一章**: [設定](configuration.md)
- **🚀 下一章節**: [第 2 章：以 AI 為先的開發](../chapter-02-ai-development/microsoft-foundry-integration.md)

## 介紹

歡迎進入你的第一個 Azure Developer CLI 專案！這個完整的實作教學會帶你逐步建立、部署並管理一個使用 azd 的全端應用程式。你將操作一個真實的待辦事項應用程式，其中包含 React 前端、Node.js API 後端，以及 MongoDB 資料庫。

## 學習目標

完成本教學後，你將能：
- 精通使用範本初始化 azd 專案的流程
- 了解 Azure Developer CLI 專案的結構和設定檔
- 完成整個應用程式部署到 Azure，包含基礎結構佈建
- 實作應用程式更新及重新部署策略
- 管理多個開發和測試環境
- 掌握資源清理及成本管理實務

## 學習成果

完成後，你將能：
- 獨立從範本初始化並設定 azd 專案
- 有效瀏覽並修改 azd 專案結構
- 利用單一指令將全端應用部署至 Azure
- 疑難排解常見部署及認證問題
- 管理不同部署階段的多個 Azure 環境
- 實作持續部署工作流程以更新應用

## 開始前準備

### 必備條件檢查清單
- ✅ 已安裝 Azure Developer CLI（[安裝指南](installation.md)）
- ✅ 已使用 `azd auth login` 完成 AZD 認證
- ✅ 系統安裝 Git
- ✅ Node.js 16 或以上（本教學需求）
- ✅ Visual Studio Code（建議使用）

繼續前，請在專案根目錄執行設定驗證：

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### 驗證你的環境
```bash
# 檢查 azd 安裝
azd version

# 檢查 AZD 認證
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

讓我們從一個包含 React 前端和 Node.js API 後端的受歡迎待辦事項應用程式範本開始。

```bash
# 瀏覽可用的範本
azd template list

# 初始化待辦事項應用程式範本
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# 遵循提示：
# - 輸入環境名稱：「dev」
# - 選擇訂閱（如果有多個）
# - 選擇區域：「美國東部 2」（或您偏好的區域）
```

### 發生了什麼事？
- 將範本程式碼下載到你的本機目錄
- 建立了包含服務定義的 `azure.yaml` 檔案
- 在 `infra/` 目錄設定基礎結構程式碼
- 建立環境設定檔

## 步驟 2：探索專案結構

來看看 azd 為我們建立了什麼：

```bash
# 檢視專案結構
tree /f   # Windows 作業系統
# 或
find . -type f | head -20   # macOS/Linux 作業系統
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

### 主要檔案說明

**azure.yaml** - 你 azd 專案的核心：
```bash
# 查看專案設定
cat azure.yaml
```

**infra/main.bicep** - 基礎結構定義：
```bash
# 查看基礎設施程式碼
head -30 infra/main.bicep
```

## 步驟 3：自訂你的專案（可選）

在部署前，你可以自訂應用程式：

### 修改前端
```bash
# 打開 React 應用組件
code src/web/src/App.tsx
```

做個簡單的變更：
```typescript
// 找出標題並更改它
<h1>My Awesome Todo App</h1>
```

### 設定環境變數
```bash
# 設定自訂環境變數
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# 查看所有環境變數
azd env get-values
```

## 步驟 4：部署到 Azure

現在進入令人振奮的部分—將所有東西部署到 Azure！

```bash
# 部署基礎架構和應用程式
azd up

# 此指令將會：
# 1. 配置 Azure 資源（應用服務、Cosmos DB 等）
# 2. 建置您的應用程式
# 3. 部署到已配置的資源
# 4. 顯示應用程式的 URL
```

### 部署過程中發生什麼？

`azd up` 指令會執行以下步驟：
1. <strong>佈建</strong> (`azd provision`) — 建立 Azure 資源
2. <strong>打包</strong> — 建置你的應用程式程式碼
3. <strong>部署</strong> (`azd deploy`) — 將程式碼部署到 Azure 資源

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

### 測試待辦事項應用
1. <strong>新增待辦事項</strong> — 點擊「Add Todo」並輸入任務
2. <strong>標記完成</strong> — 勾選已完成項目
3. <strong>刪除項目</strong> — 移除不需要的待辦事項

### 監控你的應用程式
```bash
# 開啟您的資源的 Azure 入口網站
azd monitor

# 檢視應用程式日誌
azd monitor --logs

# 檢視即時指標
azd monitor --live
```

## 步驟 6：修改並重新部署

讓我們做些更動，看看更新有多容易：

### 修改 API
```bash
# 編輯 API 程式碼
code src/api/src/routes/lists.js
```

新增自訂回應標頭：
```javascript
// 找到一個路由處理程序並新增：
res.header('X-Powered-By', 'Azure Developer CLI');
```

### 只部署程式碼變更
```bash
# 僅部署應用程式碼（跳過基礎設施）
azd deploy

# 這比 'azd up' 快得多，因為基礎設施已經存在
```

## 步驟 7：管理多個環境

建立一個測試環境以在正式環境前測試更動：

```bash
# 創建新的測試環境
azd env new staging

# 部屬到測試環境
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

# 查看預備環境
azd env select staging
azd show
```

## 步驟 8：清理資源

當你完成實驗後，請清理以避免持續產生費用：

```bash
# 刪除當前環境的所有 Azure 資源
azd down

# 強制刪除不需確認並清除軟刪除的資源
azd down --force --purge

# 刪除特定環境
azd env select staging
azd down --force --purge
```

## 傳統應用與 AI 驅動應用：相同工作流程

你剛剛部署了一個傳統的 Web 應用。但是如果你想要部署一個由 Microsoft Foundry 模型支援的 AI 聊天應用呢？

好消息是：**工作流程完全相同。**

| 步驟 | 傳統待辦應用 | AI 聊天應用 |
|------|--------------|-------------|
| 初始化 | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| 認證 | `azd auth login` | `azd auth login` |
| 部署 | `azd up` | `azd up` |
| 監控 | `azd monitor` | `azd monitor` |
| 清理 | `azd down --force --purge` | `azd down --force --purge` |

唯一差別在於你從哪個<strong>範本</strong>開始。AI 範本會包含額外的基礎結構（例如 Microsoft Foundry 模型資源或 AI 搜尋索引），但 azd 都會幫你處理。你不需要學習新的指令、採用不同工具，或改變部署的思維方式。

這就是 azd 的核心理念：**一個工作流程，任何工作負載。** 你在本教學練習的技能——初始化、部署、監控、重新部署和清理資源——完全適用於 AI 應用和代理。

---

## 你學到了什麼

恭喜！你已成功：
- ✅ 從範本初始化 azd 專案
- ✅ 探索專案結構和主要檔案
- ✅ 將全端應用部署到 Azure
- ✅ 修改程式碼並重新部署
- ✅ 管理多個環境
- ✅ 清理資源

## 🎯 技能驗證練習

### 練習 1：部署不同範本 (15 分鐘)
<strong>目標</strong>：展示 azd init 與部署流程的掌握

```bash
# 嘗試 Python + MongoDB 組合
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
- [ ] 應用部署無錯誤
- [ ] 能在瀏覽器中存取應用 URL
- [ ] 應用正常運作（能新增/移除待辦）
- [ ] 成功清理所有資源

### 練習 2：自訂設定 (20 分鐘)
<strong>目標</strong>：練習環境變數配置

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

# 使用自訂設定進行部署
azd up
```

**成功標準：**
- [ ] 成功建立自訂環境
- [ ] 環境變數已設定且可讀取
- [ ] 應用成功部署並套用自訂設定
- [ ] 能驗證已部署應用中的自訂設定

### 練習 3：多環境工作流程 (25 分鐘)
<strong>目標</strong>：掌握環境管理及部署策略

```bash
# 建立開發環境
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# 記錄開發環境 URL
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# 建立預備環境
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# 記錄預備環境 URL
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
- [ ] 建立兩個配置不同的環境
- [ ] 兩個環境皆成功部署
- [ ] 能使用 `azd env select` 切換環境
- [ ] 各環境的環境變數不同
- [ ] 成功清理由兩個環境產生的資源

## 📊 你的進度

<strong>投入時間</strong>：約 60-90 分鐘  
<strong>獲得技能</strong>：
- ✅ 範本初始化專案
- ✅ Azure 資源佈建
- ✅ 應用部署流程
- ✅ 環境管理
- ✅ 設定管理
- ✅ 資源清理與成本管理

<strong>下一步</strong>：準備好深入學習 [設定指南](configuration.md) 探索進階設定模式！

## 常見問題排解

### 認證錯誤
```bash
# 重新使用 Azure 進行身份驗證
az login

# 驗證訂閱存取權限
az account show
```

### 部署失敗
```bash
# 啟用除錯記錄
export AZD_DEBUG=true
azd up --debug

# 在 Azure 中查看應用程式日誌
azd monitor --logs

# 對於容器應用程式，請使用 Azure CLI：
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### 資源名稱衝突
```bash
# 使用唯一的環境名稱
azd env new dev-$(whoami)-$(date +%s)
```

### 埠口/網路問題
```bash
# 檢查埠口是否可用
netstat -an | grep :3000
netstat -an | grep :3100
```

## 下一步

完成你的第一個專案後，試著探索這些進階主題：

### 1. 自訂基礎結構
- [基礎結構即程式碼](../chapter-04-infrastructure/provisioning.md)
- [新增資料庫、儲存和其他服務](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. 設定 CI/CD
- [部署指南](../chapter-04-infrastructure/deployment-guide.md) — 完整 CI/CD 工作流程
- [Azure Developer CLI 文件](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) — 管線設定

### 3. 產品環境最佳實務
- [部署指南](../chapter-04-infrastructure/deployment-guide.md) — 安全性、效能與監控

### 4. 探索更多範本
```bash
# 按類別瀏覽範本
azd template list --filter web
azd template list --filter api
azd template list --filter database

# 嘗試不同的技術棧
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## 附加資源

### 學習資料
- [Azure Developer CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure 架構中心](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 優良架構指引](https://learn.microsoft.com/en-us/azure/well-architected/)

### 社群與支援
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure 開發者社群](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### 範本與範例
- [官方範本集](https://azure.github.io/awesome-azd/)
- [社群範本](https://github.com/Azure-Samples/azd-templates)
- [企業範例](https://github.com/Azure/azure-dev/tree/main/templates)

---

**恭喜你完成第一個 azd 專案！** 現在你已做好準備，信心滿滿地在 Azure 上建立和部署精彩的應用程式。

---

**章節導覽：**
- **📚 課程首頁**: [AZD 初學者指南](../../README.md)
- **📖 目前章節**: 第 1 章 - 基礎與快速入門
- **⬅️ 上一章**: [安裝與設定](installation.md)
- **➡️ 下一章**: [設定](configuration.md)
- **🚀 下一章節**: [第 2 章：以 AI 為先的開發](../chapter-02-ai-development/microsoft-foundry-integration.md)
- <strong>下一課程</strong>: [部署指南](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意自動翻譯可能包含錯誤或不精確之處。原文文件應被視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。對於因使用本翻譯而產生的任何誤解或誤釋，我們不承擔任何責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->