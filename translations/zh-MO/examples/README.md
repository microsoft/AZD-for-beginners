# 範例 - 實用 AZD 範本與設定

**以範例學習 - 依章節分類**
- **📚 課程首頁**: [AZD 入門](../README.md)
- **📖 章節對照**: 範例依學習複雜度分類
- **🚀 本地範例**: [零售多代理解決方案](retail-scenario.md)
- **🤖 外部 AI 範例**: 連結至 Azure Samples 儲存庫

> **📍 重要：本地與外部範例**  
> 此儲存庫包含 **4 個完整的本地範例**，具有完整實作：  
> - **Microsoft Foundry Models Chat**（gpt-4.1 部署，附聊天介面）  
> - **Container Apps**（簡單 Flask API + 微服務）  
> - **Database App**（Web + SQL 資料庫）  
> - **Retail Multi-Agent**（企業級 AI 解決方案）  
>  
> 額外的範例為 <strong>外部參考</strong>，指向 Azure-Samples 儲存庫，您可以克隆它們。

## 介紹

此目錄提供實作範例與參考，幫助您透過實作練習學習 Azure Developer CLI。零售多代理情境為本儲存庫內的完整、可投入生產的實作範例。其他範例則參考官方 Azure Samples，示範各種 AZD 模式。

### 複雜度等級說明

- ⭐ <strong>初學者</strong> - 基本概念、單一服務、15-30 分鐘
- ⭐⭐ <strong>中階</strong> - 多個服務、資料庫整合、30-60 分鐘
- ⭐⭐⭐ <strong>進階</strong> - 複雜架構、AI 整合、1-2 小時
- ⭐⭐⭐⭐ <strong>專家</strong> - 可投入生產、企業模式、2 小時以上

## 🎯 此儲存庫實際內容

### ✅ 本地實作（可立即使用）

#### [Microsoft Foundry Models Chat 應用程式](azure-openai-chat/README.md) 🆕
**本儲存庫包含完整的 gpt-4.1 部署與聊天介面**

- **位置:** `examples/azure-openai-chat/`
- **複雜度:** ⭐⭐（中階）
- **包含項目:**
  - 完整的 Microsoft Foundry Models 部署（gpt-4.1）
  - Python 指令列聊天介面
  - Key Vault 整合以保護 API 金鑰
  - Bicep 基礎設施範本
  - 令牌使用與成本追蹤
  - 流量限制與錯誤處理

**快速開始:**
```bash
# 前往範例
cd examples/azure-openai-chat

# 部署所有項目
azd up

# 安裝相依套件並開始聊天
pip install -r src/requirements.txt
python src/chat.py
```

**技術:** Microsoft Foundry Models、gpt-4.1、Key Vault、Python、Bicep

#### [Container App 範例](container-app/README.md) 🆕
<strong>本儲存庫包含完整的容器部署範例</strong>

- **位置:** `examples/container-app/`
- **複雜度:** ⭐-⭐⭐⭐⭐（初學者到進階）
- **包含項目:**
  - [主指南](container-app/README.md) - 完整的容器部署概述
  - [簡單 Flask API](../../../examples/container-app/simple-flask-api) - 基本 REST API 範例
  - [微服務架構](../../../examples/container-app/microservices) - 可投入生產的多服務部署
  - 快速開始、生產環境與進階模式
  - 監控、安全性與成本最佳化

**快速開始:**
```bash
# 檢視主指南
cd examples/container-app

# 部署簡單的 Flask API
cd simple-flask-api
azd up

# 部署微服務範例
cd ../microservices
azd up
```

**技術:** Azure Container Apps、Docker、Python Flask、Node.js、C#、Go、Application Insights

#### [零售多代理解決方案](retail-scenario.md) 🆕
**本儲存庫包含完整的、可投入生產的實作**

- **位置:** `examples/retail-multiagent-arm-template/`
- **複雜度:** ⭐⭐⭐⭐（進階）
- **包含項目:**
  - 完整的 ARM 部署範本
  - 多代理架構（客戶 + 庫存）
  - Microsoft Foundry Models 整合
  - AI 搜尋與 RAG
  - 全面監控
  - 一鍵部署腳本

**快速開始:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**技術:** Microsoft Foundry Models、AI Search、Container Apps、Cosmos DB、Application Insights

---

## 🔗 外部 Azure 範例（克隆後使用）

以下範例維護於官方 Azure-Samples 儲存庫。克隆它們以探索不同的 AZD 範式：

### 簡單應用程式（第 1-2 章）

| 範本 | 儲存庫 | 複雜度 | 服務 |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [本地：simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python、Container Apps、Application Insights |
| **Microservices** | [本地：microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | 多服務、Service Bus、Cosmos DB、SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express、Cosmos DB、Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps、Functions、SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python、Container Apps、API |

**使用方式：**
```bash
# 複製任何範例
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# 部署
azd up
```

### AI 應用範例（第 2、5、8 章）

| 範本 | 儲存庫 | 複雜度 | 重點 |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [本地：azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 部署 |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | 基本 AI 聊天 |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | 代理人框架 |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG 模式 |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | 企業級 AI |

### 資料庫與進階範式（第 3-8 章）

| 範本 | 儲存庫 | 複雜度 | 重點 |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | 資料庫整合 |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL 無伺服器 |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | 多服務 |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## 學習目標

透過實作這些範例，您將能：
- 在真實應用情境中練習 Azure Developer CLI 工作流程
- 理解不同應用架構及其 azd 的實作
- 掌握各種 Azure 服務的基礎設施即程式碼（IaC）模式
- 應用組態管理與環境專屬的部署策略
- 在實務情境中實作監控、安全與縮放模式
- 累積針對真實部署情境的故障排除與除錯經驗

## 學習成果

完成這些範例後，您將能夠：
- 使用 Azure Developer CLI 自信地部署各類應用程式
- 將提供的範本調整至您的應用程式需求
- 使用 Bicep 設計並實作自訂基礎設施範式
- 為複雜的多服務應用設定正確的相依性
- 在實際情境中套用安全、監控與效能的最佳實務
- 依據實務經驗進行部署故障診斷與優化

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

## 快速啟動範例

> **💡 初學 AZD？** 從範例 #1（Flask API）開始 - 大約需要 20 分鐘，並教導核心概念。

### 初學者適用
1. **[容器應用 - Python Flask API](../../../examples/container-app/simple-flask-api)** (本地) ⭐  
   部署一個具備自動縮減至零的簡單 REST API  
   **時間：** 20-25 分鐘 | **費用：** $0-5/月  
   **您會學到：** 基本 azd 工作流程、容器化、健康檢查  
   **預期結果：** 可運作的 API 端點回傳 "Hello, World!" 並有監控

2. **[簡單網頁應用 - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   部署一個帶有 MongoDB 的 Node.js Express 網頁應用  
   **時間：** 25-35 分鐘 | **費用：** $10-30/月  
   **您會學到：** 資料庫整合、環境變數、連線字串  
   **預期結果：** 可建立/讀取/更新/刪除的 Todo 清單應用

3. **[靜態網站 - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   使用 Azure Static Web Apps 托管 React 靜態網站  
   **時間：** 20-30 分鐘 | **費用：** $0-10/月  
   **您會學到：** 靜態主機、無伺服器函式、CDN 部署  
   **預期結果：** React 使用者介面搭配 API 後端、自動 SSL、全球 CDN

### 中階使用者
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (本地) ⭐⭐  
   部署 gpt-4.1，含聊天介面與安全的 API 金鑰管理  
   **時間：** 35-45 分鐘 | **費用：** $50-200/月  
   **您會學到：** Microsoft Foundry Models 部署、Key Vault 整合、令牌追蹤  
   **預期結果：** 可運作的聊天應用，使用 gpt-4.1 並具成本監控

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (本地) ⭐⭐⭐⭐  
   可投入生產的多服務架構  
   **時間：** 45-60 分鐘 | **費用：** $50-150/月  
   **您會學到：** 服務間通訊、訊息佇列、分散式追蹤  
   **預期結果：** 兩個服務系統（API Gateway + Product Service）並具監控

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   C# API 與 Azure SQL 的網頁應用  
   **時間：** 30-45 分鐘 | **費用：** $20-80/月  
   **您會學到：** Entity Framework、資料庫遷移、連線安全  
   **預期結果：** 使用 Azure SQL 的 C# API，含自動架構部署

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   具有 HTTP 觸發器與 Cosmos DB 的 Python Azure Functions  
   **時間：** 30-40 分鐘 | **費用：** $10-40/月  
   **您會學到：** 事件驅動架構、無伺服器擴展、NoSQL 整合  
   **預期結果：** 回應 HTTP 請求並使用 Cosmos DB 儲存的函式應用

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   使用 Container Apps 與 API Gateway 的多服務 Java 應用  
   **時間：** 60-90 分鐘 | **費用：** $80-200/月  
   **您會學到：** Spring Boot 部署、服務網格、負載平衡  
   **預期結果：** 具服務發現與路由的多服務 Java 系統

### Microsoft Foundry 範本

1. **[Microsoft Foundry Models Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   完整的 gpt-4.1 部署與聊天介面  
   **時間：** 35-45 分鐘 | **費用：** $50-200/月  
   **預期結果：** 可運作的聊天應用，具令牌追蹤與成本監控

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   採用 RAG 架構的智慧聊天應用  
   **時間：** 60-90 分鐘 | **費用：** $100-300/月  
   **預期結果：** 採 RAG 的聊天介面，含文件搜尋與引用

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   使用 Azure AI 服務的文件分析  
   **時間：** 40-60 分鐘 | **費用：** $20-80/月  
   **預期結果：** 提供 API 以擷取上傳文件中的文字、表格與實體

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   使用 Azure Machine Learning 的 MLOps 工作流程  
   **時間：** 2-3 小時 | **費用：** $150-500/月  
   **預期結果：** 含訓練、部署與監控的自動化 ML 管線

### 實務情境

#### <strong>零售多代理解決方案</strong> 🆕
**[完整實作指南](./retail-scenario.md)**

一個全面、可投入生產的多代理客戶支援解決方案，示範如何使用 AZD 部署企業級 AI 應用。此情境提供：
- <strong>完整架構</strong>: 多代理系統，具備專門化的客戶服務與庫存管理代理
- <strong>生產基礎設施</strong>: 多區域 Microsoft Foundry Models 部署、AI Search、Container Apps，以及完整的監控
- **可即時部署的 ARM 範本**: 一鍵部署，提供多種配置模式 (Minimal/Standard/Premium)
- <strong>進階功能</strong>: 紅隊安全驗證、代理評估框架、成本優化與故障排除指南
- <strong>真實商業場景</strong>: 零售商客戶支援用例，包含檔案上傳、搜尋整合與動態擴充

<strong>技術</strong>: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

<strong>複雜度</strong>: ⭐⭐⭐⭐（進階 - 企業生產就緒）

<strong>非常適合</strong>: AI 開發者、解決方案架構師，以及構建生產級多代理系統的團隊

<strong>快速開始</strong>: 使用內含的 ARM 範本並透過 `./deploy.sh -g myResourceGroup` 在 30 分鐘內部署完整解決方案

## 📋 使用說明

### 先決條件

在執行任何範例之前：
- ✅ Azure 訂閱，具有擁有者或參與者存取權
- ✅ 已安裝 Azure Developer CLI（[安裝指南](../docs/chapter-01-foundation/installation.md)）
- ✅ 已啟動 Docker Desktop（用於容器範例）
- ✅ 適當的 Azure 配額（請檢查範例特定需求）

> **💰 成本警示：** 所有範例會建立實際的 Azure 資源，會產生費用。請參閱各自的 README 檔案以取得費用估算。完成後請記得執行 `azd down` 以避免持續產生費用。

### 在本機執行範例

1. <strong>複製或拷貝範例</strong>
   ```bash
   # 前往所需的範例
   cd examples/simple-web-app
   ```

2. **初始化 AZD 環境**
   ```bash
   # 使用現有範本初始化
   azd init
   
   # 或建立新環境
   azd env new my-environment
   ```

3. <strong>設定環境</strong>
   ```bash
   # 設定所需的變數
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. <strong>部署</strong>
   ```bash
   # 部署基礎架構與應用程式
   azd up
   ```

5. <strong>驗證部署</strong>
   ```bash
   # 取得服務端點
   azd env get-values
   
   # 測試端點（範例）
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **預期成功指標:**
   - ✅ `azd up` 成功完成且無錯誤
   - ✅ 服務端點回傳 HTTP 200
   - ✅ Azure 入口網站顯示 "Running" 狀態
   - ✅ Application Insights 正在接收遙測資料

> **⚠️ 有問題嗎？** 請參閱 [常見問題](../docs/chapter-07-troubleshooting/common-issues.md) 以取得部署故障排除資訊

### 調整範例

每個範例包含：
- **README.md** - 詳細的設定與自訂說明
- **azure.yaml** - AZD 設定與註解
- **infra/** - 含參數說明的 Bicep 範本
- **src/** - 範例應用程式程式碼
- **scripts/** - 常用作業的輔助腳本

## 🎯 學習目標

### 範例類別

#### <strong>基礎部署</strong>
- 單一服務應用程式
- 簡單的基礎架構模式
- 基本的設定管理
- 具成本效益的開發環境

#### <strong>進階情境</strong>
- 多服務架構
- 複雜的網路設定
- 資料庫整合模式
- 安全性與法規遵循實作

#### <strong>生產就緒範式</strong>
- 高可用性配置
- 監控與可觀測性
- CI/CD 整合
- 災難復原配置

## 📖 範例說明

### Simple Web App - Node.js Express
<strong>技術</strong>: Node.js, Express, MongoDB, Container Apps  
<strong>複雜度</strong>: 入門  
<strong>概念</strong>: 基本部署、REST API、NoSQL 資料庫整合

### Static Website - React SPA
<strong>技術</strong>: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
<strong>複雜度</strong>: 入門  
<strong>概念</strong>: 靜態託管、無伺服器後端、現代網頁開發

### Container App - Python Flask
<strong>技術</strong>: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
<strong>複雜度</strong>: 入門  
<strong>概念</strong>: 容器化、REST API、scale-to-zero、健康檢查、監控  
<strong>位置</strong>: [本機範例](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
<strong>技術</strong>: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
<strong>複雜度</strong>: 進階  
<strong>概念</strong>: 多服務架構、服務通訊、訊息佇列、分散式追蹤  
<strong>位置</strong>: [本機範例](../../../examples/container-app/microservices)

### Database App - C# with Azure SQL
<strong>技術</strong>: C# ASP.NET Core, Azure SQL Database, App Service  
<strong>複雜度</strong>: 中階  
<strong>概念</strong>: Entity Framework、資料庫連線、Web API 開發

### Serverless Function - Python Azure Functions
<strong>技術</strong>: Python, Azure Functions, Cosmos DB, Static Web Apps  
<strong>複雜度</strong>: 中階  
<strong>概念</strong>: 事件驅動架構、無伺服器運算、全端開發

### Microservices - Java Spring Boot
<strong>技術</strong>: Java Spring Boot, Container Apps, Service Bus, API Gateway  
<strong>複雜度</strong>: 中階  
<strong>概念</strong>: 微服務通訊、分散式系統、企業級模式

### Microsoft Foundry 範例

#### Microsoft Foundry Models Chat App
<strong>技術</strong>: Microsoft Foundry Models, Cognitive Search, App Service  
<strong>複雜度</strong>: 中階  
<strong>概念</strong>: RAG 架構、向量搜尋、LLM 整合

#### AI Document Processing
<strong>技術</strong>: Azure AI Document Intelligence, Storage, Functions  
<strong>複雜度</strong>: 中階  
<strong>概念</strong>: 文件分析、OCR、資料擷取

#### Machine Learning Pipeline
<strong>技術</strong>: Azure ML, MLOps, Container Registry  
<strong>複雜度</strong>: 進階  
<strong>概念</strong>: 模型訓練、部署管線、監控

## 🛠 設定範例

configurations/ 目錄包含可重用的元件：

### 環境設定
- 開發環境設定
- Staging 環境配置
- 生產就緒配置
- 多區域部署設定

### Bicep 模組
- 可重用的基礎設施元件
- 常見資源模式
- 強化安全的範本
- 成本優化配置

### 輔助腳本
- 環境設定自動化
- 資料庫遷移腳本
- 部署驗證工具
- 成本監控工具

## 🔧 自訂指南

### 為您的使用情境調整範例

1. <strong>檢閱先決條件</strong>
   - 檢查 Azure 服務需求
   - 確認訂閱限制
   - 了解成本影響

2. <strong>修改設定</strong>
   - 更新 `azure.yaml` 的服務定義
   - 自訂 Bicep 範本
   - 調整環境變數

3. <strong>徹底測試</strong>
   - 先部署到開發環境
   - 驗證功能
   - 測試擴充與效能

4. <strong>安全審查</strong>
   - 檢閱存取控制
   - 實作機密管理
   - 啟用監控與警示

## 📊 比較矩陣

| 範例 | 服務 | 資料庫 | 認證 | 監控 | 複雜度 |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (本機) | 2 | ❌ | Key Vault | 完整 | ⭐⭐ |
| **Python Flask API** (本機) | 1 | ❌ | 基本 | 完整 | ⭐ |
| **Microservices** (本機) | 5+ | ✅ | 企業 | 進階 | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | 基本 | 基本 | ⭐ |
| React SPA + Functions | 3 | ✅ | 基本 | 完整 | ⭐ |
| Python Flask Container | 2 | ❌ | 基本 | 完整 | ⭐ |
| C# Web API + SQL | 2 | ✅ | 完整 | 完整 | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | 完整 | 完整 | ⭐⭐ |
| Java Microservices | 5+ | ✅ | 完整 | 完整 | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | 完整 | 完整 | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | 基本 | 完整 | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | 完整 | 完整 | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (本機) | **8+** | **✅** | <strong>企業</strong> | <strong>進階</strong> | **⭐⭐⭐⭐** |

## 🎓 學習路徑

### 建議進程

1. **從簡單 Web 應用程式開始**
   - 學習基本 AZD 概念
   - 了解部署工作流程
   - 練習環境管理

2. <strong>嘗試靜態網站</strong>
   - 探索不同的託管選項
   - 了解 CDN 整合
   - 理解 DNS 設定

3. <strong>進入容器應用</strong>
   - 學習容器化基礎
   - 了解擴充概念
   - 練習使用 Docker

4. <strong>加入資料庫整合</strong>
   - 學習資料庫配置
   - 了解連線字串
   - 練習機密管理

5. <strong>探索無伺服器</strong>
   - 理解事件驅動架構
   - 了解觸發器與繫結
   - 練習 API

6. <strong>構建微服務</strong>
   - 學習服務通訊
   - 理解分散式系統
   - 練習複雜部署

## 🔍 尋找適合的範例

### 依技術棧
- **Container Apps**: [Python Flask API (本機)](../../../examples/container-app/simple-flask-api), [Microservices (本機)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (本機)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (本機)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (本機)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (本機)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Microservices User Service (本機)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (本機)](../../../examples/container-app/simple-flask-api), [Microservices (本機)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (本機)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (本機)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Microsoft Foundry Models Chat (本機)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (本機)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### 依架構模式
- **Simple REST API**: [Python Flask API (本機)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (本機)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (本機)](../../../examples/container-app/simple-flask-api), [Microservices (本機)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Microsoft Foundry Models Chat (本機)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (本機)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### 依複雜度
- <strong>入門</strong>: [Python Flask API (本機)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- <strong>中階</strong>: **[Microsoft Foundry Models Chat (本機)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- <strong>進階</strong>: ML Pipeline
- <strong>企業生產就緒</strong>: [Microservices (本機)](../../../examples/container-app/microservices)（含多服務與訊息佇列）, **Retail Multi-Agent Solution**（完整多代理系統並附 ARM 範本部署）

## 📚 其他資源

### 文件連結
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### 社群範例
- [Azure 範例 AZD 範本](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry 範本](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI 畫廊](https://azure.github.io/awesome-azd/)
- [使用 C# 與 Azure SQL 的待辦事項應用程式](https://github.com/Azure-Samples/todo-csharp-sql)
- [使用 Python 與 MongoDB 的待辦事項應用程式](https://github.com/Azure-Samples/todo-python-mongo)
- [使用 Node.js 與 PostgreSQL 的待辦事項應用程式](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [使用 C# API 的 React Web 應用程式](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps 工作](https://github.com/Azure-Samples/container-apps-jobs)
- [使用 Java 的 Azure Functions](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### 最佳實務
- [Azure 良好架構框架](https://learn.microsoft.com/en-us/azure/well-architected/)
- [雲端採用框架](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 貢獻範例

有實用的範例想分享嗎？我們歡迎貢獻！

### 提交指南
1. 遵循既定的目錄結構
2. 包含完整的 README.md
3. 在設定檔中加入註解
4. 在提交之前徹底測試
5. 包含成本估算和先決條件

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

<strong>專業提示</strong>：從與你技術棧相符的最簡範例開始，然後逐漸進階到更複雜的情境。每個範例都建立在之前範例的概念之上！

## 🚀 準備開始？

### 你的學習路徑

1. **完全初學者？** → 從 [Flask API](../../../examples/container-app/simple-flask-api) 開始 (⭐, 20 mins)
2. **有基本 AZD 知識？** → 試試 [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 mins)
3. **構建 AI 應用？** → 從 [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) 開始 (⭐⭐, 35 mins) 或探索 [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ hours)
4. **需要特定技術堆疊？** → 使用上方的 [尋找合適的範例](#-finding-the-right-example) 區段

### 下一步

- ✅ 檢閱上方的 [先決條件](#先決條件)
- ✅ 選擇符合你技能等級的範例（參見 [複雜度說明](#複雜度等級說明)）
- ✅ 在部署前徹底閱讀範例的 README
- ✅ 設定提醒在測試後執行 `azd down`
- ✅ 透過 GitHub Issues 或 Discussions 分享你的經驗

### 需要協助？

- 📖 [常見問題](../resources/faq.md) - 常見問題解答
- 🐛 [故障排除指南](../docs/chapter-07-troubleshooting/common-issues.md) - 修復部署問題
- 💬 [GitHub 討論](https://github.com/microsoft/AZD-for-beginners/discussions) - 向社群請教
- 📚 [學習指南](../resources/study-guide.md) - 強化你的學習

---

<strong>導覽</strong>
- **📚 課程首頁**: [AZD For Beginners](../README.md)
- **📖 學習資源**: [學習指南](../resources/study-guide.md) | [速查表](../resources/cheat-sheet.md) | [術語表](../resources/glossary.md)
- **🔧 資源**: [常見問題](../resources/faq.md) | [故障排除](../docs/chapter-07-troubleshooting/common-issues.md)

---

*最後更新：2025年11月 | [回報問題](https://github.com/microsoft/AZD-for-beginners/issues) | [貢獻範例](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**:
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不精確之處。原始語言版本的文件應被視為具權威性的來源。如涉及重要資訊，建議採用專業人工翻譯。我們對於因使用本翻譯而產生的任何誤解或誤譯概不負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->