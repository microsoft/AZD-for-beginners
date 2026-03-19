# 你的第一個專案 - 實作教學

**章節導覽：**
- **📚 課程首頁**: [AZD 入門](../../README.md)
- **📖 目前章節**: 第一章 - 基礎與快速入門
- **⬅️ 上一章**: [安裝與設定](installation.md)
- **➡️ 下一章**: [設定](configuration.md)
- **🚀 下一章節**: [第二章：以 AI 為先的開發](../chapter-02-ai-development/microsoft-foundry-integration.md)

## 介紹

歡迎來到你的第一個 Azure Developer CLI 專案！這個完整的實作教學涵蓋了使用 azd 在 Azure 上建立、部署及管理全端應用程式的所有步驟。你將操作一個包含 React 前端、Node.js API 後端及 MongoDB 資料庫的實際待辦應用程式。

## 學習目標

完成本教學後，你將能夠：
- 熟練使用範本初始化 azd 專案流程
- 了解 Azure Developer CLI 專案結構與設定檔
- 執行完整的應用程式佈署並進行基礎架構配置
- 實作應用程式更新與重新部署策略
- 管理多個開發與測試環境
- 套用資源清理與成本管理措施

## 學習成果

完成後，你將能夠：
- 獨立從範本初始化與設定 azd 專案
- 有效瀏覽及修改 azd 專案結構
- 使用單一指令將全端應用佈署到 Azure
- 排解常見佈署疑難及驗證問題
- 管理多個 Azure 環境以適應不同部署階段
- 實作持續部署工作流程來更新應用程式

## 開始使用

### 先決條件清單
- ✅ 已安裝 Azure Developer CLI ([安裝指南](installation.md))
- ✅ 已安裝並驗證 Azure CLI
- ✅ 系統上已安裝 Git
- ✅ Node.js 16+（本教學需求）
- ✅ 建議使用 Visual Studio Code

### 驗證你的設定
```bash
# 檢查 azd 安裝情況
azd version
```
### 驗證 Azure 驗證

```bash
az account show
```

### 檢查 Node.js 版本
```bash
node --version
```

## 第一步：選擇並初始化範本

從一個廣受歡迎的待辦應用程式範本開始，內含 React 前端及 Node.js API 後端。

```bash
# 瀏覽可用嘅範本
azd template list

# 初始化待辦事項應用程式範本
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# 跟隨提示：
# - 輸入環境名稱：「dev」
# - 選擇訂閱（如果你有多個）
# - 選擇地區：「美國東部 2」 （或你偏好嘅地區）
```

### 發生了什麼？
- 將範本程式碼下載到你的本機目錄
- 建立 `azure.yaml` 檔案定義服務
- 在 `infra/` 目錄設定基礎架構代碼
- 建立環境設定

## 第二步：探索專案結構

來看看 azd 幫我們建立了什麼：

```bash
# 查看項目結構
tree /f   # Windows 系統
# 或
find . -type f | head -20   # macOS／Linux 系統
```

你會看到：
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
# 檢視專案配置
cat azure.yaml
```

**infra/main.bicep** - 基礎架構定義：
```bash
# 查看基礎建設代碼
head -30 infra/main.bicep
```

## 第三步：自訂專案（可選）

在部署之前，你可以自訂應用程式：

### 修改前端
```bash
# 打開 React 應用程式組件
code src/web/src/App.tsx
```

做一個簡單修改：
```typescript
// 搵出標題並更改它
<h1>My Awesome Todo App</h1>
```

### 設定環境變數
```bash
# 設定自訂環境變量
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# 查看所有環境變量
azd env get-values
```

## 第四步：部署至 Azure

接下來是令人興奮的部分 - 將所有部署到 Azure！

```bash
# 部署基礎設施及應用程式
azd up

# 此指令將會：
# 1. 配置 Azure 資源（應用程式服務、Cosmos DB 等）
# 2. 建置您的應用程式
# 3. 部署至已配置的資源
# 4. 顯示應用程式的網址
```

### 部署過程中發生了什麼？

`azd up` 指令執行以下步驟：
1. <strong>配置</strong> (`azd provision`) - 建立 Azure 資源
2. <strong>打包</strong> - 編譯你的應用程式代碼
3. <strong>部署</strong> (`azd deploy`) - 將代碼部署至 Azure 資源

### 預期輸出
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## 第五步：測試你的應用程式

### 訪問你的應用程式
點擊部署輸出中提供的網址，或任何時候使用：
```bash
# 取得應用程式端點
azd show

# 在瀏覽器中打開應用程式
azd show --output json | jq -r '.services.web.endpoint'
```

### 測試待辦應用
1. <strong>新增待辦事項</strong> - 點「新增待辦」並輸入任務
2. <strong>標記完成</strong> - 勾選已完成的事項
3. <strong>刪除事項</strong> - 移除不再需要的待辦

### 監控你的應用程式
```bash
# 開啟您資源的 Azure 入口網站
azd monitor

# 查看應用程式日誌
azd monitor --logs

# 查看即時指標
azd monitor --live
```

## 第六步：修改並重新部署

讓我們做個修改，看看更新有多簡單：

### 修改 API
```bash
# 編輯 API 代碼
code src/api/src/routes/lists.js
```

新增自訂回應標頭：
```javascript
// 搵一個路由處理器並新增：
res.header('X-Powered-By', 'Azure Developer CLI');
```

### 只部署程式碼變更
```bash
# 只部署應用程式代碼（跳過基礎設施）
azd deploy

# 由於基礎設施已存在，這比 'azd up' 快得多
```

## 第七步：管理多重環境

建立一個測試環境，以在正式環境前先行測試：

```bash
# 建立一個新的預演環境
azd env new staging

# 部署至預演環境
azd up

# 轉回開發環境
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

## 第八步：清理資源

完成實驗後，請清理避免持續產生費用：

```bash
# 刪除當前環境的所有 Azure 資源
azd down

# 強制刪除且不需確認，並清除軟刪除的資源
azd down --force --purge

# 刪除特定環境
azd env select staging
azd down --force --purge
```

## 傳統應用程式 vs. AI 驅動應用程式：相同工作流程

你剛剛部署了一個傳統的網頁應用程式。但如果你想要部署一個 AI 驅動的應用，例如以 Microsoft Foundry Models 支援的聊天應用程式呢？

好消息是：**工作流程是相同的。**

| 步驟 | 傳統待辦應用程式 | AI 聊天應用程式 |
|------|-----------------|-------------|
| 初始化 | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| 驗證身份 | `azd auth login` | `azd auth login` |
| 部署 | `azd up` | `azd up` |
| 監控 | `azd monitor` | `azd monitor` |
| 清理 | `azd down --force --purge` | `azd down --force --purge` |

唯一不同的是你使用的 <strong>範本</strong>。AI 範本會包含額外的基礎架構（例如 Microsoft Foundry Models 資源或 AI 搜尋索引），但 azd 會為你處理這一切。不需學習新指令、採用不同工具，或改變你對部署的思考方式。

這正是 azd 的核心原則：**一套工作流程，萬用負載。** 本教學練習的技能──初始化、部署、監控、重新部署與清理──同樣適用於 AI 應用與代理。

---

## 你學到了什麼

恭喜！你已成功：
- ✅ 從範本初始化 azd 專案
- ✅ 探索專案結構和關鍵檔案
- ✅ 將全端應用部署到 Azure
- ✅ 修改程式碼並重新部署
- ✅ 管理多個環境
- ✅ 清理資源

## 🎯 技能驗證練習

### 練習 1：部署不同範本（15 分鐘）
<strong>目標</strong>：展示對 azd init 及部署流程的精通

```bash
# 嘗試 Python + MongoDB 技術組合
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# 驗證部署
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# 清理工作
azd down --force --purge
```

**成功標準：**
- [ ] 應用程式部署無錯誤
- [ ] 可在瀏覽器存取應用程式網址
- [ ] 應用程式功能正常（新增/刪除待辦）
- [ ] 成功清理所有資源

### 練習 2：自訂設定（20 分鐘）
<strong>目標</strong>：練習環境變數設定

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

# 用自訂配置部署
azd up
```

**成功標準：**
- [ ] 自訂環境成功建立
- [ ] 環境變數設定並可讀取
- [ ] 應用以自訂設定部署成功
- [ ] 可在部屬的應用驗證自訂設定

### 練習 3：多環境工作流（25 分鐘）
<strong>目標</strong>：熟練環境管理與部署策略

```bash
# 建立開發環境
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# 記錄開發 URL
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# 建立預備環境
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# 記錄預備 URL
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# 比較環境
azd env list

# 測試兩個環境
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# 清理兩者
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**成功標準：**
- [ ] 創建兩個不同設定的環境
- [ ] 兩個環境部署成功
- [ ] 可用 `azd env select` 切換環境
- [ ] 各環境變數不同
- [ ] 成功清理兩個環境

## 📊 你的進度

<strong>投入時間</strong>：約 60-90 分鐘  
<strong>獲得技能</strong>：
- ✅ 基於範本的專案初始化
- ✅ Azure 資源佈建
- ✅ 應用部署工作流
- ✅ 環境管理
- ✅ 設定管理
- ✅ 資源清理與成本管控

<strong>下一階段</strong>：準備學習 [設定指南](configuration.md) 以掌握進階設定模式！

## 常見問題排解

### 驗證錯誤
```bash
# 重新使用 Azure 進行身份驗證
az login

# 驗證訂閱存取權限
az account show
```

### 部署失敗
```bash
# 啟用除錯日誌記錄
export AZD_DEBUG=true
azd up --debug

# 在 Azure 查看應用程式日誌
azd monitor --logs

# 對於容器應用，請使用 Azure CLI：
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### 資源名稱衝突
```bash
# 使用一個獨特的環境名稱
azd env new dev-$(whoami)-$(date +%s)
```

### 埠/網路問題
```bash
# 檢查端口是否可用
netstat -an | grep :3000
netstat -an | grep :3100
```

## 下一步

完成第一個專案後，探索以下進階主題：

### 1. 自訂基礎架構
- [基礎架構即程式碼](../chapter-04-infrastructure/provisioning.md)
- [新增資料庫、儲存體及其他服務](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. 設置 CI/CD
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

# 嘗試不同的技術棧
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## 補充資源

### 學習資料
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
- [企業方案範例](https://github.com/Azure/azure-dev/tree/main/templates)

---

**恭喜你完成第一個 azd 專案！** 你現在準備好自信地在 Azure 上打造並部署驚人的應用程式。

---

**章節導覽：**
- **📚 課程首頁**: [AZD 入門](../../README.md)
- **📖 目前章節**: 第一章 - 基礎與快速入門
- **⬅️ 上一章**: [安裝與設定](installation.md)
- **➡️ 下一章**: [設定](configuration.md)
- **🚀 下一章節**: [第二章：以 AI 為先的開發](../chapter-02-ai-development/microsoft-foundry-integration.md)
- <strong>下一課程</strong>: [部署指南](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議使用專業人工翻譯。我們對因使用此翻譯而產生的任何誤解或曲解不承擔任何責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->