# 你的第一個專案 - 實作教學

**章節導覽：**
- **📚 課程首頁**: [AZD 入門](../../README.md)
- **📖 目前章節**: 第一章 - 基礎與快速入門
- **⬅️ 上一章**: [安裝與設定](installation.md)
- **➡️ 下一章**: [設定](configuration.md)
- **🚀 下一章節**: [第二章：AI 優先開發](../chapter-02-ai-development/microsoft-foundry-integration.md)

## 介紹

歡迎來到你的第一個 Azure Developer CLI 專案！這份完整的實作教學，帶你完整操作如何使用 azd 在 Azure 上建立、部署及管理全端應用程式。你將使用一個真實的待辦事項應用程式，包含 React 前端、Node.js API 後端及 MongoDB 資料庫。

## 學習目標

完成本教學後，你將能：
- 精通使用範本進行 azd 專案初始化流程
- 了解 Azure Developer CLI 專案結構與設定檔
- 執行完整應用程式部署並預置基礎架構
- 實作應用程式更新與重新部署策略
- 管理多個開發與測試環境
- 應用資源清理與成本管理實務

## 學習成果

完成後，你將能夠：
- 獨立從範本初始化與設定 azd 專案
- 有效瀏覽及修改 azd 專案結構
- 使用單一指令部署全端應用程式到 Azure
- 疑難排解常見部署與認證問題
- 管理不同部署階段的多個 Azure 環境
- 實作應用持續部署工作流程

## 開始使用

### 先決條件清單
- ✅ 已安裝 Azure Developer CLI ([安裝指南](installation.md))
- ✅ 透過 `azd auth login` 完成 AZD 認證
- ✅ 系統中已安裝 Git
- ✅ Node.js 16 以上（本教學需求）
- ✅ 建議安裝 Visual Studio Code

繼續之前，請在專案根目錄執行設定驗證器：

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### 驗證你的環境
```bash
# 檢查 azd 安裝情況
azd version

# 檢查 AZD 認證情況
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

## 第 1 步：選擇並初始化範本

我們從一個流行的待辦應用程式範本開始，包含 React 前端及 Node.js API 後端。

```bash
# 瀏覽可用範本
azd template list

# 初始化待辦事項應用程式範本
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# 按提示操作：
# - 輸入環境名稱：「dev」
# - 選擇訂閱（如果你有多個）
# - 選擇區域：「東美洲 2」（或你偏好的區域）
```

### 發生了什麼？
- 將範本程式碼下載到本地目錄
- 建立 `azure.yaml` 檔案，定義服務
- 在 `infra/` 目錄中設定基礎架構程式碼
- 建立環境設定

## 第 2 步：探索專案結構

來看看 azd 幫我們建立了什麼：

```bash
# 檢視項目結構
tree /f   # Windows 作業系統
# 或者
find . -type f | head -20   # macOS/Linux 作業系統
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
# 查看項目配置
cat azure.yaml
```

**infra/main.bicep** - 基礎架構定義：
```bash
# 檢視基礎設施代碼
head -30 infra/main.bicep
```

## 第 3 步：自訂你的專案（可選）

在部署之前，你可以客製化應用程式：

### 修改前端
```bash
# 開啟 React 應用程式組件
code src/web/src/App.tsx
```

做個簡單的變更：
```typescript
// 搵到標題同改佢
<h1>My Awesome Todo App</h1>
```

### 設定環境變數
```bash
# 設置自訂環境變數
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# 查看所有環境變數
azd env get-values
```

## 第 4 步：部署到 Azure

現在來到精彩環節—將所有內容部署到 Azure！

```bash
# 部署基建同應用程式
azd up

# 呢條指令會：
# 1. 配置 Azure 資源（應用服務、Cosmos DB 等）
# 2. 建立你嘅應用程式
# 3. 部署到配置咗嘅資源
# 4. 顯示應用程式嘅網址
```

### 部署期間發生了什麼？

`azd up` 指令執行以下步驟：
1. <strong>預置</strong> (`azd provision`) - 建立 Azure 資源
2. <strong>打包</strong> - 建置應用程式程式碼
3. <strong>部署</strong> (`azd deploy`) - 部署程式碼至 Azure 資源

### 預期輸出
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## 第 5 步：測試你的應用程式

### 使用你的應用
點擊部署輸出中提供的 URL，或隨時取得：
```bash
# 獲取應用程式端點
azd show

# 在瀏覽器中打開應用程式
azd show --output json | jq -r '.services.web.endpoint'
```

### 測試待辦清單應用
1. <strong>新增待辦事項</strong> - 點擊「新增待辦」輸入任務
2. <strong>標示完成</strong> - 勾選已完成的項目
3. <strong>刪除項目</strong> - 移除不再需要的待辦

### 監控你的應用
```bash
# 開啟 Azure 入口網站以管理你的資源
azd monitor

# 查看應用程式日誌
azd monitor --logs

# 查看即時指標
azd monitor --live
```

## 第 6 步：修正並重新部署

讓我們做個修改，體驗更新的簡易：

### 修改 API
```bash
# 編輯 API 代碼
code src/api/src/routes/lists.js
```

新增自訂回應標頭：
```javascript
// 搵一個路由處理器並加上:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### 僅部署程式碼變更
```bash
# 只部署應用程式代碼（跳過基礎設施）
azd deploy

# 這比 'azd up' 快得多，因為基礎設施已經存在
```

## 第 7 步：管理多個環境

建立測試環境，在正式部署前測試變更：

```bash
# 建立一個新的測試環境
azd env new staging

# 部署到測試環境
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

## 第 8 步：清理資源

實驗結束後，清理避免持續付費：

```bash
# 刪除當前環境的所有 Azure 資源
azd down

# 強制刪除且不作確認，並清除軟刪除資源
azd down --force --purge

# 刪除特定環境
azd env select staging
azd down --force --purge
```

## 傳統應用與 AI 加值應用：相同工作流程

你剛剛部署的是傳統網頁應用。那如果你要部署 AI 加持的應用，例如以 Microsoft Foundry Models 為後盾的聊天應用呢？

好消息是：**工作流程是相同的。**

| 步驟 | 傳統待辦應用 | AI 聊天應用 |
|------|-------------|-------------|
| 初始化 | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| 認證 | `azd auth login` | `azd auth login` |
| 部署 | `azd up` | `azd up` |
| 監控 | `azd monitor` | `azd monitor` |
| 清理 | `azd down --force --purge` | `azd down --force --purge` |

唯一不同是你使用的 <strong>範本</strong>。AI 範本包含額外基礎架構（例如 Microsoft Foundry Models 資源或 AI Search 索引），但 azd 已幫你處理好。你不需學習新指令，使用不同的工具，或改變部署思維。

這是 azd 的核心原則：**一套流程，任何工作負載。** 你在本教學練習的技能－初始化、部署、監控、重新部署與清理－同樣適用於 AI 應用與代理。

---

## 你學到了什麼

恭喜！你已成功：
- ✅ 從範本初始化 azd 專案
- ✅ 探索專案結構與核心檔案
- ✅ 將全端應用部署到 Azure
- ✅ 修改程式碼並重新部署
- ✅ 管理多個環境
- ✅ 清理資源

## 🎯 技能驗證練習

### 練習 1：部署不同範本（15 分鐘）
<strong>目標</strong>：展示 azd init 與部署流程的精通

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

**成功條件：**
- [ ] 應用部署無錯誤
- [ ] 可在瀏覽器存取應用 URL
- [ ] 應用功能正常（新增/刪除待辦）
- [ ] 成功清理所有資源

### 練習 2：自訂配置（20 分鐘）
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

# 使用自訂設定進行部署
azd up
```

**成功條件：**
- [ ] 成功建立自訂環境
- [ ] 設定並可取得環境變數
- [ ] 應用以自訂配置部署
- [ ] 可驗證部署應用中的自訂設定

### 練習 3：多環境工作流程（25 分鐘）
<strong>目標</strong>：精通環境管理與部署策略

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

# 清理兩個環境
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**成功條件：**
- [ ] 建立兩個設定不同的環境
- [ ] 兩環境皆成功部署
- [ ] 能使用 `azd env select` 切換環境
- [ ] 環境間環境變數不同
- [ ] 成功清理兩個環境

## 📊 你的進度

<strong>投入時間</strong>：約 60-90 分鐘  
<strong>取得技能</strong>：
- ✅ 以範本初始化專案
- ✅ Azure 資源預置
- ✅ 應用程式部署工作流程
- ✅ 環境管理
- ✅ 配置管理
- ✅ 資源清理與成本控管

<strong>下一階段</strong>：你已準備好學習進階設定模式，請參考 [設定指南](configuration.md)！

## 常見問題排解

### 認證錯誤
```bash
# 重新使用 Azure 進行驗證
az login

# 驗證訂閱存取權限
az account show
```

### 部署失敗
```bash
# 啟用調試日誌記錄
export AZD_DEBUG=true
azd up --debug

# 在 Azure 檢視應用程式日誌
azd monitor --logs

# 對於容器應用，使用 Azure CLI：
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### 資源名稱衝突
```bash
# 使用獨特的環境名稱
azd env new dev-$(whoami)-$(date +%s)
```

### 埠/網路問題
```bash
# 檢查端口是否可用
netstat -an | grep :3000
netstat -an | grep :3100
```

## 下一步

完成首個專案後，可以探索以下進階主題：

### 1. 自訂基礎架構
- [基礎架構即程式碼](../chapter-04-infrastructure/provisioning.md)
- [新增資料庫、儲存與其他服務](../chapter-04-infrastructure/provisioning.md#adding-services)

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

# 嘗試不同的技術組合
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## 額外資源

### 學習資源
- [Azure Developer CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure 架構中心](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 良好架構框架](https://learn.microsoft.com/en-us/azure/well-architected/)

### 社群與支援
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer 社群](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### 範本與範例
- [官方範本集](https://azure.github.io/awesome-azd/)
- [社群範本](https://github.com/Azure-Samples/azd-templates)
- [企業模式](https://github.com/Azure/azure-dev/tree/main/templates)

---

**恭喜你完成第一個 azd 專案！** 你現在可以自信地在 Azure 上建置與部署驚人的應用程式。

---

**章節導覽：**
- **📚 課程首頁**: [AZD 入門](../../README.md)
- **📖 目前章節**: 第一章 - 基礎與快速入門
- **⬅️ 上一章**: [安裝與設定](installation.md)
- **➡️ 下一章**: [設定](configuration.md)
- **🚀 下一章節**: [第二章：AI 優先開發](../chapter-02-ai-development/microsoft-foundry-integration.md)
- <strong>下一課</strong>: [部署指南](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們努力追求準確，但請注意，自動翻譯可能存在錯誤或不準確之處。原文文件的母語版本應被視為權威來源。對於重要資訊，建議採用專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->