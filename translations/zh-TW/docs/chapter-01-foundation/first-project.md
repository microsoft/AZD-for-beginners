# 你的第一個專案 - 實作教學

**章節導覽：**
- **📚 課程首頁**: [AZD For Beginners](../../README.md)
- **📖 目前章節**: 第 1 章 - 基礎與快速開始
- **⬅️ 上一節**: [Installation & Setup](installation.md)
- **➡️ 下一節**: [Configuration](configuration.md)
- **🚀 下一章**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## 介紹

歡迎來到你的第一個 Azure Developer CLI 專案！這個完整的實作教學會帶你一步步建立、部署並管理一個在 Azure 上的全端應用程式，使用 azd。你將操作一個真實的 todo 應用程式，包含 React 前端、Node.js API 後端與 MongoDB 資料庫。

## 學習目標

完成本教學後，你將能：
- 精通使用範本的 azd 專案初始化流程
- 了解 Azure Developer CLI 專案結構與設定檔
- 執行將完整應用程式部署到 Azure 並進行基礎設施佈建
- 實作應用程式更新與重新部署策略
- 管理多個開發與測試環境
- 套用資源清理與成本管理實務

## 學習成果

完成後，你將能夠：
- 獨立從範本初始化並設定 azd 專案
- 有效瀏覽並修改 azd 專案結構
- 使用單一指令將全端應用程式部署到 Azure
- 排解常見部署問題與驗證錯誤
- 管理不同部署階段的多個 Azure 環境
- 為應用程式更新實作持續部署工作流程

## 開始之前

### 前置需求清單
- ✅ 已安裝 Azure Developer CLI（[Installation Guide](installation.md)）
- ✅ 已安裝並完成驗證 Azure CLI
- ✅ 已在系統安裝 Git
- ✅ Node.js 16+（本教學使用）
- ✅ 建議使用 Visual Studio Code

### 驗證你的環境
```bash
# 檢查 azd 是否已安裝
azd version
```
### 驗證 Azure 驗證狀態

```bash
az account show
```

### 檢查 Node.js 版本
```bash
node --version
```

## 第 1 步：選擇並初始化範本

我們從一個熱門的 todo 應用程式範本開始，包含 React 前端與 Node.js API 後端。

```bash
# 瀏覽可用的範本
azd template list

# 初始化待辦應用程式範本
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# 依照提示操作:
# - 輸入環境名稱: "dev"
# - 選擇訂閱（如果你有多個）
# - 選擇地區: "East US 2" (或你偏好的地區)
```

### 剛剛發生了什麼？
- 已將範本程式碼下載到你的本機目錄
- 建立了一個包含服務定義的 `azure.yaml` 檔案
- 在 `infra/` 目錄中設定了基礎設施程式碼
- 建立了一個環境設定

## 第 2 步：探索專案結構

讓我們檢視 azd 為我們建立了什麼：

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

### 需要了解的主要檔案

**azure.yaml** - 你 azd 專案的核心：
```bash
# 檢視專案設定
cat azure.yaml
```

**infra/main.bicep** - 基礎設施定義：
```bash
# 檢視基礎架構程式碼
head -30 infra/main.bicep
```

## 第 3 步：自訂你的專案（可選）

在部署之前，你可以自訂應用程式：

### 修改前端
```bash
# 開啟 React 應用程式元件
code src/web/src/App.tsx
```

做一個簡單的變更：
```typescript
// 找出標題並更改它
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

## 第 4 步：部署到 Azure

現在來到最令人興奮的部分 — 將所有東西部署到 Azure！

```bash
# 部署基礎設施與應用程式
azd up

# 此指令將會：
# 1. 配置 Azure 資源（App Service、Cosmos DB 等）
# 2. 建置您的應用程式
# 3. 部署到已配置的資源
# 4. 顯示應用程式的 URL
```

### 部署期間發生了什麼？

`azd up` 指令會執行下列步驟：
1. <strong>佈建</strong> (`azd provision`) - 建立 Azure 資源
2. <strong>打包</strong> - 建置你的應用程式程式碼
3. <strong>部署</strong> (`azd deploy`) - 將程式碼部署到 Azure 資源

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

### 存取你的應用程式
點擊部署輸出中提供的 URL，或隨時取得它：
```bash
# 取得應用程式端點
azd show

# 在瀏覽器中開啟應用程式
azd show --output json | jq -r '.services.web.endpoint'
```

### 測試 Todo 應用
1. **新增一個 todo 項目** - 點選「Add Todo」並輸入任務
2. <strong>標記為完成</strong> - 勾選已完成的項目
3. <strong>刪除項目</strong> - 移除不再需要的 todo

### 監控你的應用程式
```bash
# 在 Azure 入口網站中開啟您的資源
azd monitor

# 檢視應用程式日誌
azd monitor --logs

# 檢視即時指標
azd monitor --live
```

## 第 6 步：進行變更並重新部署

讓我們做一個變更，看看更新有多簡單：

### 修改 API
```bash
# 編輯 API 程式碼
code src/api/src/routes/lists.js
```

新增一個自訂回應標頭：
```javascript
// 找到一個路由處理器並加入:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### 只部署程式碼變更
```bash
# 只部署應用程式程式碼（跳過基礎架構）
azd deploy

# 由於基礎架構已存在，這比 'azd up' 快得多
```

## 第 7 步：管理多個環境

建立一個暫存（staging）環境，以在正式上線前測試變更：

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

# 檢視暫存環境
azd env select staging
azd show
```

## 第 8 步：清理資源

當你完成實驗後，請清理以避免持續產生費用：

```bash
# 刪除目前環境的所有 Azure 資源
azd down

# 強制刪除且跳過確認，並永久清除已軟刪除的資源
azd down --force --purge

# 刪除特定環境
azd env select staging
azd down --force --purge
```

## 傳統應用 vs. AI 驅動應用：相同的工作流程

你剛剛部署的是傳統的網頁應用。但如果你想部署一個 AI 驅動的應用——例如由 Microsoft Foundry Models 支援的聊天應用呢？

好消息是：**工作流程完全相同。**

| Step | 傳統 Todo 應用 | AI 聊天應用 |
|------|-----------------|-------------|
| Initialize | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Authenticate | `azd auth login` | `azd auth login` |
| Deploy | `azd up` | `azd up` |
| Monitor | `azd monitor` | `azd monitor` |
| Clean up | `azd down --force --purge` | `azd down --force --purge` |

唯一的差別是你起始使用的 <strong>範本</strong>。AI 範本會包含額外的基礎設施（像是 Microsoft Foundry Models 資源或 AI 搜尋索引），但 azd 會替你處理所有這些。你不需要學習新的指令、採用不同工具或改變你對部署的思維方式。

這就是 azd 的核心原則：**一套工作流程，適用於任何工作負載。** 你在本教學中練習的技能——初始化、部署、監控、重新部署與清理——同樣適用於 AI 應用與代理程式。

---

## 你學到了什麼

恭喜！你已成功：
- ✅ 從範本初始化 azd 專案
- ✅ 探索專案結構與主要檔案
- ✅ 將全端應用部署到 Azure
- ✅ 做出程式碼變更並重新部署
- ✅ 管理多個環境
- ✅ 清理資源

## 🎯 技能驗證練習

### 練習 1：部署不同的範本（15 分鐘）
<strong>目標</strong>：展現對 azd init 及部署流程的掌握

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
- [ ] 應用程式部署時無錯誤
- [ ] 能在瀏覽器存取應用程式 URL
- [ ] 應用程式功能正常（新增/移除 todos）
- [ ] 成功清理所有資源

### 練習 2：自訂設定（20 分鐘）
<strong>目標</strong>：練習環境變數的設定

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
- [ ] 自訂環境建立成功
- [ ] 環境變數已設定且可取得
- [ ] 應用程式以自訂設定部署成功
- [ ] 能在已部署的應用程式中驗證自訂設定

### 練習 3：多環境工作流程（25 分鐘）
<strong>目標</strong>：精通環境管理與部署策略

```bash
# 建立開發環境
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# 記下開發環境的 URL
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# 建立暫存（staging）環境
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# 記下暫存（staging）環境的 URL
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
- [ ] 能使用 `azd env select` 在環境間切換
- [ ] 環境變數在不同環境間有所差異
- [ ] 成功清理兩個環境

## 📊 你的進度

<strong>投入時間</strong>：~60-90 分鐘  
<strong>習得技能</strong>：
- ✅ 基於範本的專案初始化
- ✅ Azure 資源佈建
- ✅ 應用程式部署工作流程
- ✅ 環境管理
- ✅ 設定管理
- ✅ 資源清理與成本管理

<strong>下一階段</strong>：你已準備好前往 [Configuration Guide](configuration.md) 學習進階設定模式！

## 常見問題排解

### 驗證錯誤
```bash
# 重新向 Azure 進行驗證
az login

# 驗證訂閱的存取權限
az account show
```

### 部署失敗
```bash
# 啟用偵錯記錄
export AZD_DEBUG=true
azd up --debug

# 在 Azure 中檢視應用程式日誌
azd monitor --logs

# 對於 Container Apps，請使用 Azure CLI：
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### 資源名稱衝突
```bash
# 使用唯一的環境名稱
azd env new dev-$(whoami)-$(date +%s)
```

### 埠／網路問題
```bash
# 檢查連接埠是否可用
netstat -an | grep :3000
netstat -an | grep :3100
```

## 下一步

現在你已完成第一個專案，探索這些進階主題：

### 1. 自訂基礎設施
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [新增資料庫、儲存體與其他服務](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. 建立 CI/CD
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - 完整的 CI/CD 工作流程
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - 管線設定

### 3. 產品環境最佳實務
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - 安全性、效能與監控

### 4. 探索更多範本
```bash
# 依類別瀏覽範本
azd template list --filter web
azd template list --filter api
azd template list --filter database

# 嘗試不同的技術堆疊
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## 額外資源

### 學習資料
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### 社群與支援
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### 範本與示例
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**恭喜你完成你的第一個 azd 專案！** 現在你已經可以自信地在 Azure 上建立並部署精彩的應用程式。

---

**章節導覽：**
- **📚 課程首頁**: [AZD For Beginners](../../README.md)
- **📖 目前章節**: 第 1 章 - 基礎與快速開始
- **⬅️ 上一節**: [Installation & Setup](installation.md)
- **➡️ 下一節**: [Configuration](configuration.md)
- **🚀 下一章**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- <strong>下一課程</strong>: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**:  
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不精確之處。原始文件的母語版本應視為具權威性的來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤譯負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->