# 範例 - 實用的 AZD 模板與配置

**透過範例學習 - 按章節組織**
- **📚 課程首頁**: [AZD 初學者指南](../README.md)
- **📖 章節映射**: 依學習難度分類的範例
- **🚀 本地範例**: [零售多代理方案](retail-scenario.md)
- **🤖 外部 AI 範例**: 連結至 Azure Samples 倉庫

> **📍 重要提示：本地與外部範例**  
> 本倉庫包含 **4 個完整本地範例**，具有完整實作：  
> - **Microsoft Foundry Models 聊天應用**（gpt-4.1 部署並附聊天介面）  
> - <strong>容器應用程式</strong>（簡單 Flask API + 微服務）  
> - <strong>資料庫應用</strong>（網頁 + SQL 資料庫）  
> - <strong>零售多代理</strong>（企業級 AI 解決方案）  
>  
> 其他範例為可克隆的 Azure-Samples 倉庫外部參考。

## 介紹

本目錄提供實用範例及參考，幫助您透過實作學習 Azure Developer CLI。零售多代理場景為本倉庫內含完整且適合生產環境的實作。其他範例則參考官方 Azure Samples，展示多種 AZD 實務模式。

### 難度評級說明

- ⭐ <strong>初學者</strong> - 基本概念，單一服務，15-30 分鐘  
- ⭐⭐ <strong>中階</strong> - 多重服務，資料庫整合，30-60 分鐘  
- ⭐⭐⭐ <strong>進階</strong> - 複雜架構、AI 整合，1-2 小時  
- ⭐⭐⭐⭐ <strong>專家</strong> - 生產環境準備、企業模式，2 小時以上

## 🎯 本倉庫實際內容

### ✅ 本地實作 (可立即使用)

#### [Microsoft Foundry Models 聊天應用](azure-openai-chat/README.md) 🆕  
**本倉庫內含完整 gpt-4.1 部署與聊天介面**

- **位置:** `examples/azure-openai-chat/`  
- **難度:** ⭐⭐ (中階)  
- **內含項目:**  
  - 完整 Microsoft Foundry Models（gpt-4.1）部署  
  - Python 命令列聊天介面  
  - Key Vault 整合以安全管理 API 金鑰  
  - Bicep 基礎架構模板  
  - 令牌使用與成本追蹤  
  - 速率限制與錯誤處理  

**快速開始：**  
```bash
# 導航到示例
cd examples/azure-openai-chat

# 部署所有內容
azd up

# 安裝依賴並開始聊天
pip install -r src/requirements.txt
python src/chat.py
```
  
**技術:** Microsoft Foundry Models、gpt-4.1、Key Vault、Python、Bicep  

#### [容器應用範例](container-app/README.md) 🆕  
<strong>本倉庫包含全面容器部署範例</strong>

- **位置:** `examples/container-app/`  
- **難度:** ⭐-⭐⭐⭐⭐ (初學者至進階)  
- **內含項目:**  
  - [主導覽](container-app/README.md) - 容器部署完整概述  
  - [簡單 Flask API](../../../examples/container-app/simple-flask-api) - 基本 REST API 範例  
  - [微服務架構](../../../examples/container-app/microservices) - 適合生產的多服務部署  
  - 快速啟動、生產及進階模式  
  - 監控、安全及成本優化  

**快速開始：**  
```bash
# 查看主指南
cd examples/container-app

# 部署簡單的 Flask API
cd simple-flask-api
azd up

# 部署微服務範例
cd ../microservices
azd up
```
  
**技術:** Azure Container Apps、Docker、Python Flask、Node.js、C#、Go、Application Insights

#### [零售多代理方案](retail-scenario.md) 🆕  
<strong>本倉庫內含完整適合生產環境的實作</strong>

- **位置:** `examples/retail-multiagent-arm-template/`  
- **難度:** ⭐⭐⭐⭐ (進階)  
- **內含項目:**  
  - 完整 ARM 部署模板  
  - 多代理架構（客戶 + 庫存）  
  - Microsoft Foundry Models 整合  
  - AI 搜索與 RAG  
  - 全面監控  
  - 一鍵部署腳本  

**快速開始：**  
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```
  
**技術:** Microsoft Foundry Models、AI 搜索、Container Apps、Cosmos DB、Application Insights

---

## 🔗 外部 Azure Samples（克隆後使用）

以下範例置於官方 Azure-Samples 倉庫中。可克隆後探索多種 AZD 模式：

### 簡易應用（第 1-2 章）

| 範本 | 倉庫 | 難度 | 服務 |
|:-----|:-----|:-----|:-----|
| **Python Flask API** | [本地：simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python、Container Apps、Application Insights |
| <strong>微服務</strong> | [本地：microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | 多服務、Service Bus、Cosmos DB、SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express、Cosmos DB、Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps、Functions、SQL |
| **Python Flask 容器** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python、Container Apps、API |

**使用方式：**  
```bash
# 複製任何範例
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# 部署
azd up
```


### AI 應用範例（第 2、5、8 章）

| 範本 | 倉庫 | 難度 | 專注 |
|:-----|:-----|:-----|:-----|
| **Microsoft Foundry Models 聊天** | [本地：azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 部署 |
| **AI 聊天快速啟動** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | 基礎 AI 聊天 |
| **AI 代理** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | 代理框架 |
| **搜索 + OpenAI 示範** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG 模式 |
| **Contoso 聊天** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | 企業 AI |

### 資料庫與進階模式（第 3-8 章）

| 範本 | 倉庫 | 難度 | 專注 |
|:-----|:-----|:-----|:-----|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | 資料庫整合 |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | 無伺服器 NoSQL |
| **Java 微服務** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | 多重服務 |
| <strong>機器學習管線</strong> | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## 學習目標

透過操作這些範例，您將能：
- 實作 Azure Developer CLI 流程，體驗實際應用場景  
- 理解不同應用架構及其 azd 實作  
- 精通各種 Azure 服務基礎架構即代碼模式  
- 掌握環境設定管理及環境差異化部署策略  
- 在實務情境中應用監控、安全及擴展模式  
- 累積實務除錯與故障排除經驗  

## 學習成果

完成範例後，您將能：
- 自信地使用 Azure Developer CLI 部署各類應用  
- 按自身需求調整並擴充提供的範本  
- 規劃並實作自訂 Bicep 基礎架構模式  
- 構建多服務應用並管理其依賴關係  
- 在真實場景中實施安全、監控與效能最佳實踐  
- 根據實務經驗排解和優化部署  

## 目錄結構

```
Azure Samples AZD Templates (linked externally):
├── todo-nodejs-mongo/       # Node.js Express with MongoDB
├── todo-csharp-sql-swa-func/ # React SPA with Static Web Apps  
├── container-apps-store-api/ # Python Flask containerized app
├── todo-csharp-sql/         # C# Web API with Azure SQL
├── todo-python-mongo-swa-func/ # Python Functions with Cosmos DB
├── java-microservices-aca-lab/ # Java microservices with Container Apps
└── configurations/          # Common configuration examples
    ├── environment-configs/
    ├── bicep-modules/
    └── scripts/
```


## 快速開始範例

> **💡 AZD 新手？** 建議從範例 #1（Flask API）開始，約 20 分鐘即可了解核心概念。

### 初學者適用
1. **[容器應用 - Python Flask API](../../../examples/container-app/simple-flask-api)**（本地）⭐  
   部署簡單 REST API，支援 scale-to-zero  
   **時間:** 20-25 分鐘 | **費用:** $0-5/月  
   **學習內容:** 基本 azd 工作流程、容器化、健康檢查  
   **預期成果:** 可正常回應 "Hello, World!" 且具監控功能之 API 端點  

2. **[簡單網頁應用 - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   部署 Node.js Express 網頁應用與 MongoDB  
   **時間:** 25-35 分鐘 | **費用:** $10-30/月  
   **學習內容:** 資料庫整合、環境變數、連線字串  
   **預期成果:** 具 CRUD 功能的待辦事項清單應用  

3. **[靜態網站 - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   使用 Azure 靜態網站應用部署 React 靜態網站  
   **時間:** 20-30 分鐘 | **費用:** $0-10/月  
   **學習內容:** 靜態網站託管、無伺服器函式、CDN 部署  
   **預期成果:** React UI + API 後端，自動 SSL 與全球 CDN  

### 中階使用者
4. **[Microsoft Foundry Models 聊天應用](../../../examples/azure-openai-chat)**（本地）⭐⭐  
   部署 gpt-4.1 具聊天介面及安全 API 金鑰管理  
   **時間:** 35-45 分鐘 | **費用:** $50-200/月  
   **學習內容:** Microsoft Foundry Models 部署、Key Vault 整合、令牌追蹤  
   **預期成果:** 可用的 gpt-4.1 聊天應用，含成本監控  

5. **[容器應用 - 微服務](../../../examples/container-app/microservices)**（本地）⭐⭐⭐⭐  
   生產級多服務架構  
   **時間:** 45-60 分鐘 | **費用:** $50-150/月  
   **學習內容:** 服務通訊、訊息佇列、分散式追蹤  
   **預期成果:** 含監控的雙服務系統（API Gateway + 產品服務）  

6. **[資料庫應用 - C# 搭配 Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   搭配 C# API 與 Azure SQL 資料庫的網頁應用  
   **時間:** 30-45 分鐘 | **費用:** $20-80/月  
   **學習內容:** Entity Framework、資料庫遷移、連線安全  
   **預期成果:** C# API 串接 Azure SQL，支援自動結構部署  

7. **[無伺服器函式 - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions，支援 HTTP 觸發和 Cosmos DB  
   **時間:** 30-40 分鐘 | **費用:** $10-40/月  
   **學習內容:** 事件驅動架構、無伺服器擴展、NoSQL 整合  
   **預期成果:** 可響應 HTTP 請求並使用 Cosmos DB 儲存的函式應用  

8. **[微服務 - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   多服務 Java 應用搭配 Container Apps 與 API Gateway  
   **時間:** 60-90 分鐘 | **費用:** $80-200/月  
   **學習內容:** Spring Boot 部署、服務網格、負載平衡  
   **預期成果:** 多服務 Java 系統，支援服務發現與路由  

### Microsoft Foundry 模板

1. **[Microsoft Foundry Models 聊天應用 - 本地範例](../../../examples/azure-openai-chat)** ⭐⭐  
   完整 gpt-4.1 部署及聊天介面  
   **時間:** 35-45 分鐘 | **費用:** $50-200/月  
   **預期成果:** 含令牌追蹤與成本監控的聊天應用  

2. **[Azure Search + OpenAI 示範](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   智慧聊天應用搭配 RAG 架構  
   **時間:** 60-90 分鐘 | **費用:** $100-300/月  
   **預期成果:** 結合文檔搜尋與引用的 RAG 聊天介面  

3. **[AI 文件處理](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   使用 Azure AI 服務進行文件分析  
   **時間:** 40-60 分鐘 | **費用:** $20-80/月  
   **預期成果:** API 可擷取上傳文件中的文字、表格與實體  

4. **[機器學習管線](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Azure 機器學習 MLOps 工作流程  
   **時間:** 2-3 小時 | **費用:** $150-500/月  
   **預期成果:** 自動化機器學習管線，含訓練、部署與監控  

### 真實世界場景

#### <strong>零售多代理方案</strong> 🆕  
**[完整實作指南](./retail-scenario.md)**  

一套全面且適合生產環境的多代理客戶支援解決方案，展示使用 AZD 部署企業級 AI 應用。本方案包括：
- <strong>完整架構</strong>：具備專門的客戶服務及庫存管理代理的多代理系統  
- <strong>生產環境基礎設施</strong>：跨區域 Microsoft Foundry Models 部署、AI 搜尋、容器應用程式及全面監控  
- **即用 ARM 模板**：一鍵部署，提供多種配置模式（精簡/標準/高級）  
- <strong>進階功能</strong>：紅隊安全驗證、代理評估框架、成本優化及故障排除指南  
- <strong>真實商業場景</strong>：零售商客戶支援案例，包含檔案上傳、搜尋整合及動態擴展  

<strong>技術</strong>：Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini)、Azure AI Search、Container Apps、Cosmos DB、Application Insights、Document Intelligence、Bing Search API  

<strong>複雜度</strong>：⭐⭐⭐⭐（進階 - 企業生產就緒）  

<strong>適合對象</strong>：AI 開發者、解決方案架構師及構建生產級多代理系統的團隊  

<strong>快速入門</strong>：使用包含的 ARM 模板及 `./deploy.sh -g myResourceGroup` 指令，30 分鐘內部署完整解決方案  

## 📋 使用說明  

### 前置條件  

執行任何範例前請確保：  
- ✅ 具備擁有者或貢獻者角色的 Azure 訂閱  
- ✅ 安裝 Azure Developer CLI（[安裝指南](../docs/chapter-01-foundation/installation.md)）  
- ✅ Docker Desktop 正在執行（適用於容器範例）  
- ✅ 有適當的 Azure 配額（請查看各範例的具體需求）  

> **💰 成本警告：** 所有範例均會建立實際的 Azure 資源並產生費用。請參考各個 README 文件的成本估算。完成後請執行 `azd down` 以避免持續費用。  

### 本地執行範例  

1. <strong>複製或下載範例</strong>  
   ```bash
   # 導航到所需的範例
   cd examples/simple-web-app
   ```
  
2. **初始化 AZD 環境**  
   ```bash
   # 使用現有範本初始化
   azd init
   
   # 或建立新環境
   azd env new my-environment
   ```
  
3. <strong>配置環境</strong>  
   ```bash
   # 設置所需變數
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```
  
4. <strong>部署</strong>  
   ```bash
   # 部署基礎設施及應用程式
   azd up
   ```
  
5. <strong>驗證部署</strong>  
   ```bash
   # 獲取服務端點
   azd env get-values
   
   # 測試端點（範例）
   curl https://your-app-url.azurecontainer.io/health
   ```
  
   **預期成功指標：**  
   - ✅ `azd up` 執行無錯誤  
   - ✅ 服務端點回傳 HTTP 200  
   - ✅ Azure 入口網站顯示「運行中」狀態  
   - ✅ Application Insights 接收到遙測資料  

> **⚠️ 遇到問題？** 請參閱 [常見問題](../docs/chapter-07-troubleshooting/common-issues.md) 的部署疑難排解指引  

### 調整範例  

每個範例都包含：  
- **README.md** - 詳細設定與自訂說明  
- **azure.yaml** - 帶註解的 AZD 配置  
- **infra/** - 含參數說明的 Bicep 模板  
- **src/** - 範例應用程式程式碼  
- **scripts/** - 常用輔助腳本  

## 🎯 學習目標  

### 範例類別  

#### <strong>基礎部署</strong>  
- 單一服務應用  
- 簡單基礎架構範例  
- 基本配置管理  
- 成本效益開發環境  

#### <strong>進階場景</strong>  
- 多服務架構  
- 複雜網路配置  
- 資料庫整合範例  
- 安全與合規設定  

#### <strong>生產就緒範本</strong>  
- 高可用性配置  
- 監控與可觀察性  
- CI/CD 整合  
- 災難復原配置  

## 📖 範例說明  

### 簡易網頁應用 - Node.js Express  
<strong>技術</strong>：Node.js, Express, MongoDB, Container Apps  
<strong>複雜度</strong>：初學者  
<strong>概念</strong>：基礎部署、REST API、NoSQL 數據庫整合  

### 靜態網站 - React SPA  
<strong>技術</strong>：React, Azure Static Web Apps, Azure Functions, Cosmos DB  
<strong>複雜度</strong>：初學者  
<strong>概念</strong>：靜態託管、無伺服器後端、現代網頁開發  

### 容器應用 - Python Flask  
<strong>技術</strong>：Python Flask, Docker, Container Apps, Container Registry, Application Insights  
<strong>複雜度</strong>：初學者  
<strong>概念</strong>：容器化、REST API、scale-to-zero、健康檢查、監控  
<strong>位置</strong>：[本地範例](../../../examples/container-app/simple-flask-api)  

### 容器應用 - 微服務架構  
<strong>技術</strong>：Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
<strong>複雜度</strong>：進階  
<strong>概念</strong>：多服務架構、服務通訊、訊息佇列、分散式追蹤  
<strong>位置</strong>：[本地範例](../../../examples/container-app/microservices)  

### 資料庫應用 - C# 與 Azure SQL  
<strong>技術</strong>：C# ASP.NET Core, Azure SQL Database, App Service  
<strong>複雜度</strong>：中階  
<strong>概念</strong>：Entity Framework、資料庫連接、網路 API 開發  

### 無伺服器功能 - Python Azure Functions  
<strong>技術</strong>：Python, Azure Functions, Cosmos DB, Static Web Apps  
<strong>複雜度</strong>：中階  
<strong>概念</strong>：事件驅動架構、無伺服器運算、全端開發  

### 微服務 - Java Spring Boot  
<strong>技術</strong>：Java Spring Boot, Container Apps, Service Bus, API Gateway  
<strong>複雜度</strong>：中階  
<strong>概念</strong>：微服務通訊、分散式系統、企業模式  

### Microsoft Foundry 範例  

#### Microsoft Foundry Models 聊天應用  
<strong>技術</strong>：Microsoft Foundry Models、Cognitive Search、App Service  
<strong>複雜度</strong>：中階  
<strong>概念</strong>：RAG 架構、向量搜尋、LLM 整合  

#### AI 文件處理  
<strong>技術</strong>：Azure AI Document Intelligence、Storage、Functions  
<strong>複雜度</strong>：中階  
<strong>概念</strong>：文件分析、OCR、資料擷取  

#### 機器學習流程  
<strong>技術</strong>：Azure ML、MLOps、Container Registry  
<strong>複雜度</strong>：進階  
<strong>概念</strong>：模型訓練、部署流程、監控  

## 🛠 配置範例  

`configurations/` 目錄包含可重用元件：  

### 環境配置  
- 開發環境設定  
- 測試環境配置  
- 生產就緒設定  
- 跨區域部署設定  

### Bicep 模組  
- 可重用基礎設施元件  
- 通用資源模式  
- 安全加固模板  
- 成本優化配置  

### 輔助腳本  
- 環境設置自動化  
- 資料庫遷移腳本  
- 部署驗證工具  
- 成本監控工具  

## 🔧 客製化指引  

### 調整範例以符合您的使用情境  

1. <strong>審核前置條件</strong>  
   - 檢查 Azure 服務需求  
   - 驗證訂閱限制  
   - 評估成本影響  

2. <strong>修改配置</strong>  
   - 更新 `azure.yaml` 服務定義  
   - 自訂 Bicep 模板  
   - 調整環境變數  

3. <strong>充分測試</strong>  
   - 先部署至開發環境  
   - 驗證功能完整  
   - 測試擴展與效能  

4. <strong>安全審查</strong>  
   - 檢視存取控制  
   - 實施秘密管理  
   - 啟用監控與警示  

## 📊 比較矩陣  

| 範例 | 服務數量 | 資料庫 | 身份驗證 | 監控 | 複雜度 |  
|---------|----------|----------|------|------------|------------|  
| **Microsoft Foundry Models 聊天**（本地） | 2 | ❌ | Key Vault | 完整 | ⭐⭐ |  
| **Python Flask API**（本地） | 1 | ❌ | 基本 | 完整 | ⭐ |  
| <strong>微服務</strong>（本地） | 5+ | ✅ | 企業級 | 進階 | ⭐⭐⭐⭐ |  
| Node.js Express Todo | 2 | ✅ | 基本 | 基本 | ⭐ |  
| React SPA + Functions | 3 | ✅ | 基本 | 完整 | ⭐ |  
| Python Flask 容器 | 2 | ❌ | 基本 | 完整 | ⭐ |  
| C# Web API + SQL | 2 | ✅ | 完整 | 完整 | ⭐⭐ |  
| Python Functions + SPA | 3 | ✅ | 完整 | 完整 | ⭐⭐ |  
| Java 微服務 | 5+ | ✅ | 完整 | 完整 | ⭐⭐ |  
| Microsoft Foundry Models 聊天 | 3 | ✅ | 完整 | 完整 | ⭐⭐⭐ |  
| AI 文件處理 | 2 | ❌ | 基本 | 完整 | ⭐⭐ |  
| ML 流程 | 4+ | ✅ | 完整 | 完整 | ⭐⭐⭐⭐ |  
| <strong>零售多代理系統</strong>（本地） | **8+** | **✅** | <strong>企業級</strong> | <strong>進階</strong> | **⭐⭐⭐⭐** |  

## 🎓 學習路徑  

### 推薦進度  

1. <strong>從簡易網頁應用開始</strong>  
   - 學習 AZD 基本概念  
   - 理解部署工作流程  
   - 練習環境管理  

2. <strong>嘗試靜態網站</strong>  
   - 探索不同託管選項  
   - 瞭解 CDN 整合  
   - 了解 DNS 配置  

3. <strong>進入容器應用</strong>  
   - 學習容器化基礎  
   - 理解擴展概念  
   - 實作 Docker 練習  

4. <strong>新增資料庫整合</strong>  
   - 學習資料庫資源配置  
   - 瞭解連接字串  
   - 練習秘密管理  

5. <strong>探索無伺服器架構</strong>  
   - 理解事件驅動架構  
   - 學習觸發器與綁定  
   - 練習 API 開發  

6. <strong>構建微服務</strong>  
   - 學習服務間通訊  
   - 理解分散式系統  
   - 練習複雜部署  

## 🔍 尋找合適範例  

### 按技術堆疊分類  
- **Container Apps**: [Python Flask API (本地)](../../../examples/container-app/simple-flask-api)、[微服務 (本地)](../../../examples/container-app/microservices)、Java 微服務  
- **Node.js**: Node.js Express Todo App、[微服務 API Gateway (本地)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (本地)](../../../examples/container-app/simple-flask-api)、[微服務產品服務 (本地)](../../../examples/container-app/microservices)、Python Functions + SPA  
- **C#**: [微服務訂單服務 (本地)](../../../examples/container-app/microservices)、C# Web API + SQL、Microsoft Foundry Models 聊天應用、ML 流程  
- **Go**: [微服務使用者服務 (本地)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot 微服務  
- **React**: React SPA + Functions  
- <strong>容器</strong>: [Python Flask (本地)](../../../examples/container-app/simple-flask-api)、[微服務 (本地)](../../../examples/container-app/microservices)、Java 微服務  
- <strong>資料庫</strong>: [微服務 (本地)](../../../examples/container-app/microservices)、Node.js + MongoDB、C# + Azure SQL、Python + Cosmos DB  
- **AI/ML**: **[Microsoft Foundry Models 聊天 (本地)](../../../examples/azure-openai-chat)**、Microsoft Foundry Models 聊天應用、AI 文件處理、ML 流程、<strong>零售多代理解決方案</strong>  
- <strong>多代理系統</strong>: <strong>零售多代理解決方案</strong>  
- **OpenAI 整合**: **[Microsoft Foundry Models 聊天 (本地)](../../../examples/azure-openai-chat)**、零售多代理解決方案  
- <strong>企業生產環境</strong>: [微服務 (本地)](../../../examples/container-app/microservices)、<strong>零售多代理解決方案</strong>  

### 按架構模式分類  
- **簡易 REST API**: [Python Flask API (本地)](../../../examples/container-app/simple-flask-api)  
- <strong>單體架構</strong>: Node.js Express Todo、C# Web API + SQL  
- **靜態 + 無伺服器**: React SPA + Functions、Python Functions + SPA  
- <strong>微服務</strong>: [生產微服務 (本地)](../../../examples/container-app/microservices)、Java Spring Boot 微服務  
- <strong>容器化</strong>: [Python Flask (本地)](../../../examples/container-app/simple-flask-api)、[微服務 (本地)](../../../examples/container-app/microservices)  
- **AI 驅動**: **[Microsoft Foundry Models 聊天 (本地)](../../../examples/azure-openai-chat)**、Microsoft Foundry Models 聊天應用、AI 文件處理、ML 流程、<strong>零售多代理解決方案</strong>  
- <strong>多代理架構</strong>: <strong>零售多代理解決方案</strong>  
- <strong>企業多服務</strong>: [微服務 (本地)](../../../examples/container-app/microservices)、<strong>零售多代理解決方案</strong>  

### 按複雜度級別分類  
- <strong>初學者</strong>: [Python Flask API (本地)](../../../examples/container-app/simple-flask-api)、Node.js Express Todo、React SPA + Functions  
- <strong>中階</strong>: **[Microsoft Foundry Models 聊天 (本地)](../../../examples/azure-openai-chat)**、C# Web API + SQL、Python Functions + SPA、Java 微服務、Microsoft Foundry Models 聊天應用、AI 文件處理  
- <strong>進階</strong>: ML 流程  
- <strong>企業生產就緒</strong>: [微服務 (本地)](../../../examples/container-app/microservices)（多服務含訊息佇列）、<strong>零售多代理解決方案</strong>（完整多代理系統與 ARM 模板部署）  

## 📚 附加資源  

### 文件連結  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Microsoft Foundry AZD 模板](https://github.com/Azure/ai-foundry-templates)  
- [Bicep 文件](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure 架構中心](https://learn.microsoft.com/en-us/azure/architecture/)  

### 社群範例  
- [Azure Samples AZD 範本](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry 範本](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI 展示廳](https://azure.github.io/awesome-azd/)
- [使用 C# 與 Azure SQL 的 Todo App](https://github.com/Azure-Samples/todo-csharp-sql)
- [使用 Python 與 MongoDB 的 Todo App](https://github.com/Azure-Samples/todo-python-mongo)
- [使用 Node.js 與 PostgreSQL 的 Todo App](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React 網頁應用與 C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [使用 Java 的 Azure Functions](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### 最佳實踐
- [Azure 優良架構框架](https://learn.microsoft.com/en-us/azure/well-architected/)
- [雲端採用框架](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 貢獻範例

有實用的範例想分享嗎？歡迎您貢獻！

### 提交指南
1. 遵循既有的目錄結構
2. 包含完整的 README.md
3. 配置檔中加入註解
4. 提交前完整測試
5. 包含成本估算與先決條件

### 範例範本結構
```
example-name/
├── README.md           # Detailed setup instructions
├── azure.yaml          # AZD configuration
├── infra/              # Infrastructure templates
│   ├── main.bicep
│   └── modules/
├── src/                # Application source code
├── scripts/            # Helper scripts
├── .gitignore         # Git ignore rules
└── docs/              # Additional documentation
```

---

<strong>專家提示</strong>：從最簡單且符合您技術棧的範例開始，然後逐步挑戰更複雜的情境。每個範例都建立在前一個的概念上！

## 🚀 準備開始了嗎？

### 您的學習路徑

1. **完全初學者？** → 從 [Flask API](../../../examples/container-app/simple-flask-api) 開始 (⭐, 約 20 分鐘)
2. **有基本 AZD 知識？** → 試試 [微服務架構](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 約 60 分鐘)
3. **打造 AI 應用？** → 從 [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) 開始 (⭐⭐, 約 35 分鐘) 或探索 [零售多代理](retail-scenario.md) (⭐⭐⭐⭐, 2 小時以上)
4. **需要特定技術棧？** → 使用上方 [尋找合適範例](#-finding-the-right-example) 區段

### 下一步

- ✅ 複習上方的 [先決條件](#前置條件)
- ✅ 選擇符合您技能程度的範例（參考 [複雜度說明](#難度評級說明)）
- ✅ 部署前仔細閱讀該範例的 README
- ✅ 測試完成後，設定提醒執行 `azd down`
- ✅ 透過 GitHub Issues 或 Discussions 分享您的經驗

### 需要協助？

- 📖 [常見問題](../resources/faq.md) - 解答常見問題
- 🐛 [故障排除指南](../docs/chapter-07-troubleshooting/common-issues.md) - 解決部署問題
- 💬 [GitHub 討論區](https://github.com/microsoft/AZD-for-beginners/discussions) - 與社群交流
- 📚 [學習指南](../resources/study-guide.md) - 加強您的學習

---

<strong>導覽</strong>
- **📚 課程首頁**: [AZD 新手入門](../README.md)
- **📖 學習資料**: [學習指南](../resources/study-guide.md) | [速查表](../resources/cheat-sheet.md) | [詞彙表](../resources/glossary.md)
- **🔧 資源**: [常見問題](../resources/faq.md) | [故障排除](../docs/chapter-07-troubleshooting/common-issues.md)

---

*最後更新：2025 年 11 月 | [回報問題](https://github.com/microsoft/AZD-for-beginners/issues) | [貢獻範例](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件乃使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請留意自動翻譯可能存在錯誤或不準確之處。原始文件之母語版本應被視為權威來源。對於重要資訊，建議採用專業人工翻譯。我們不對因使用此翻譯而產生之任何誤解或誤讀承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->