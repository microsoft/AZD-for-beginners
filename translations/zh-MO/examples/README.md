# 範例 - 實用 AZD 範本與設定

**以範例學習 - 依章節組織**
- **📚 課程首頁**: [AZD For Beginners](../README.md)
- **📖 章節對應**: 範例依學習複雜度組織
- **🚀 本地範例**: [Retail Multi-Agent Solution](retail-scenario.md)
- **🤖 外部 AI 範例**: 指向 Azure Samples 儲存庫的連結

> **📍 重要：本地與外部範例**  
> 本儲存庫包含 **4 個完整的本地範例**，附有完整實作：  
> - **Azure OpenAI Chat**（GPT-4 部署與聊天介面）  
> - **Container Apps**（簡單 Flask API + 微服務）  
> - **Database App**（Web + SQL 資料庫）  
> - **Retail Multi-Agent**（企業級 AI 解決方案）  
>  
> 其他範例為可供您 clone 的官方 Azure-Samples 儲存庫之 **外部參考**。

## 簡介

此目錄提供實用範例與參考，幫助您透過實作學習 Azure Developer CLI。本儲存庫包含完整且生產就緒的 Retail Multi-Agent 情境實作。其他範例為參考官方 Azure Samples，示範各種 AZD 模式。

### 複雜度評級說明

- ⭐ **初學者** - 基本概念、單一服務，15-30 分鐘
- ⭐⭐ **中階** - 多服務、資料庫整合，30-60 分鐘
- ⭐⭐⭐ **進階** - 複雜架構、AI 整合，1-2 小時
- ⭐⭐⭐⭐ **專家** - 生產就緒、企業模式，2 小時以上

## 🎯 本儲存庫實際內容

### ✅ 本地實作（可立即使用）

#### [Azure OpenAI Chat Application](azure-openai-chat/README.md) 🆕
**本儲存庫內含完整 GPT-4 部署與聊天介面**

- **位置:** `examples/azure-openai-chat/`
- **複雜度:** ⭐⭐（中階）
- **包含項目：**
  - 完整的 Azure OpenAI 部署（GPT-4）
  - Python 命令列聊天介面
  - Key Vault 整合以安全管理 API 金鑰
  - Bicep 基礎建設範本
  - 代幣使用與成本追蹤
  - 速率限制與錯誤處理

**快速開始：**
```bash
# 前往範例
cd examples/azure-openai-chat

# 部署所有內容
azd up

# 安裝相依套件並開始聊天
pip install -r src/requirements.txt
python src/chat.py
```

**技術:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Container App 範例](container-app/README.md) 🆕
**本儲存庫包含完整的容器部署範例**

- **位置:** `examples/container-app/`
- **複雜度:** ⭐-⭐⭐⭐⭐（從初學者到進階）
- **包含項目：**
  - [總覽指南](container-app/README.md) - 容器部署完整概述
  - [簡單 Flask API](../../../examples/container-app/simple-flask-api) - 基本 REST API 範例
  - [微服務架構](../../../examples/container-app/microservices) - 生產就緒的多服務部署
  - 快速開始、正式環境與進階模式
  - 監控、安全性與成本優化

**快速開始：**
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

**技術:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent Solution](retail-scenario.md) 🆕
**本儲存庫內含完整生產就緒實作**

- **位置:** `examples/retail-multiagent-arm-template/`
- **複雜度:** ⭐⭐⭐⭐（進階）
- **包含項目：**
  - 完整的 ARM 部署範本
  - 多代理架構（客服 + 庫存）
  - Azure OpenAI 整合
  - 結合 RAG 的 AI 搜尋
  - 全面監控
  - 一鍵部署腳本

**快速開始：**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**技術:** Azure OpenAI, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 外部 Azure Samples（Clone 使用）

下列範例維護於官方 Azure-Samples 儲存庫。Clone 後可探索不同的 AZD 模式：

### 簡單應用（章節 1-2）

| Template | Repository | Complexity | Services |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [本地: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [本地: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-service, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**使用方式：**
```bash
# 複製任何範例
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# 部署
azd up
```

### AI 應用範例（章節 2、5、8）

| Template | Repository | Complexity | Focus |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI Chat** | [本地: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | GPT-4 部署 |
| **AI Chat 快速入門** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | 基本 AI 聊天 |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | 代理框架 |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG 模式 |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | 企業級 AI |

### 資料庫與進階模式（章節 3-8）

| Template | Repository | Complexity | Focus |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | 資料庫整合 |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL 無伺服器 |
| **Java 微服務** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | 多服務 |
| **ML 管線** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## 學習目標

透過操作這些範例，您將能：
- 練習 Azure Developer CLI 的工作流程，使用具代表性的應用情境
- 理解不同應用架構及其 azd 實作方式
- 精通各種 Azure 服務的基礎建設即程式碼（Infrastructure as Code）模式
- 套用組態管理與針對不同環境的部署策略
- 在實務情境中實作監控、安全性與自動擴展模式
- 建立實際部署的疑難排解與偵錯經驗

## 學習成果

完成這些範例後，您將能夠：
- 自信地使用 Azure Developer CLI 部署各類應用
- 將提供的範本改造為符合自身應用需求
- 設計並實作使用 Bicep 的自訂基礎建設模式
- 設定複雜多服務應用的正確相依性
- 在實際情境中套用安全、監控與效能最佳做法
- 根據實務經驗進行部署疑難排解與優化

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

> **💡 初次接觸 AZD？** 建議從範例 #1（Flask API）開始 — 約 20 分鐘，可學到核心概念。

### 初學者適用
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)**（本地） ⭐  
   部署簡單的 REST API，支援縮減至零（scale-to-zero）  
   **時間:** 20-25 分鐘 | **費用:** $0-5/月  
   **你會學到:** 基本 azd 工作流程、容器化、健康檢查  
   **預期成果:** 可運作的 API 端點回傳 "Hello, World!" 並具監控

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   部署帶有 MongoDB 的 Node.js Express 網站應用  
   **時間:** 25-35 分鐘 | **費用:** $10-30/月  
   **你會學到:** 資料庫整合、環境變數、連線字串  
   **預期成果:** 具建立/讀取/更新/刪除功能的 Todo 應用

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   使用 Azure Static Web Apps 托管 React 靜態網站  
   **時間:** 20-30 分鐘 | **費用:** $0-10/月  
   **你會學到:** 靜態託管、無伺服器函數、CDN 部署  
   **預期成果:** 含 API 後端的 React UI，自動 SSL，全球 CDN

### 中階使用者
4. **[Azure OpenAI Chat Application](../../../examples/azure-openai-chat)**（本地） ⭐⭐  
   部署 GPT-4 聊天介面並安全管理 API 金鑰  
   **時間:** 35-45 分鐘 | **費用:** $50-200/月  
   **你會學到:** Azure OpenAI 部署、Key Vault 整合、代幣追蹤  
   **預期成果:** 可運作的 GPT-4 聊天應用並具成本監控

5. **[Container App - Microservices](../../../examples/container-app/microservices)**（本地） ⭐⭐⭐⭐  
   生產就緒的多服務架構  
   **時間:** 45-60 分鐘 | **費用:** $50-150/月  
   **你會學到:** 服務間通訊、訊息佇列、分散式追蹤  
   **預期成果:** 2 服務系統（API Gateway + Product Service），具監控

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   搭配 Azure SQL 的 C# 網站應用  
   **時間:** 30-45 分鐘 | **費用:** $20-80/月  
   **你會學到:** Entity Framework、資料庫遷移、連線安全  
   **預期成果:** 使用 Azure SQL 的 C# API，具自動部署的資料表結構

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   具 HTTP 觸發器與 Cosmos DB 的 Python Azure Functions  
   **時間:** 30-40 分鐘 | **費用:** $10-40/月  
   **你會學到:** 事件驅動架構、無伺服器擴展、NoSQL 整合  
   **預期成果:** 回應 HTTP 請求並將資料儲存到 Cosmos DB 的 Function App

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   使用 Container Apps 與 API Gateway 的多服務 Java 應用  
   **時間:** 60-90 分鐘 | **費用:** $80-200/月  
   **你會學到:** Spring Boot 部署、服務網格、負載平衡  
   **預期成果:** 具服務發現與路由的多服務 Java 系統

### Microsoft Foundry 範本

1. **[Azure OpenAI Chat App - 本地範例](../../../examples/azure-openai-chat)** ⭐⭐  
   完整的 GPT-4 部署與聊天介面  
   **時間:** 35-45 分鐘 | **費用:** $50-200/月  
   **預期成果:** 可運作的聊天應用，具代幣追蹤與成本監控

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   採用 RAG 架構的智慧聊天應用  
   **時間:** 60-90 分鐘 | **費用:** $100-300/月  
   **預期成果:** 使用文件搜尋與引用的 RAG 聊天介面

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   使用 Azure AI 服務的文件分析  
   **時間:** 40-60 分鐘 | **費用:** $20-80/月  
   **預期成果:** 可從上傳文件擷取文字、表格與實體的 API

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   使用 Azure Machine Learning 的 MLOps 工作流程  
   **時間:** 2-3 小時 | **費用:** $150-500/月  
   **預期成果:** 具訓練、部署與監控的自動化 ML 管線

### 真實世界情境

#### **Retail Multi-Agent Solution** 🆕
**[完整實作指南](./retail-scenario.md)**

一個完整且生產就緒的多代理客戶支援解決方案，示範企業級 AI 應用使用 AZD 的部署。本情境提供：

- **完整架構**：具有專責客服與庫存管理代理的多代理系統
- **Production Infrastructure**: 多地區 Azure OpenAI 部署、AI Search、Container Apps，以及完整監控
- **Ready-to-Deploy ARM Template**: 一鍵部署，提供多種配置模式 (Minimal/Standard/Premium)
- **Advanced Features**: 紅隊安全驗證、代理評估框架、成本優化與故障排除指南
- **Real Business Context**: 零售商客服使用情境，包含檔案上傳、搜尋整合與動態擴展

**Technologies**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Complexity**: ⭐⭐⭐⭐ (進階 - 企業生產就緒)

**Perfect for**: AI 開發者、解決方案架構師，以及建立生產級多代理系統的團隊

**Quick Start**: 使用附帶的 ARM 範本，透過 `./deploy.sh -g myResourceGroup` 在 30 分鐘內部署完整解決方案

## 📋 使用說明

### 前置需求

在執行任何範例之前：
- ✅ 具有 Owner 或 Contributor 權限的 Azure 訂閱
- ✅ 已安裝 Azure Developer CLI ([安裝指南](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop 正在執行（用於容器範例）
- ✅ 適當的 Azure 配額（請檢查各範例的特定需求）

> **💰 成本警告：** 所有範例都會建立實際的 Azure 資源並產生費用。請參閱各自的 README 檔以獲得費用估算。完成後請記得執行 `azd down` 以避免持續產生費用。

### 在本機執行範例

1. **複製或拷貝範例**
   ```bash
   # 導航到所需的範例
   cd examples/simple-web-app
   ```

2. **初始化 AZD 環境**
   ```bash
   # 使用現有範本初始化
   azd init
   
   # 或建立新的環境
   azd env new my-environment
   ```

3. **設定環境**
   ```bash
   # 設定必要的變數
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **部署**
   ```bash
   # 部署基礎架構與應用程式
   azd up
   ```

5. **驗證部署**
   ```bash
   # 取得服務端點
   azd env get-values
   
   # 測試端點（範例）
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **預期成功指標：**
   - ✅ `azd up` 成功完成且無錯誤
   - ✅ 服務端點回傳 HTTP 200
   - ✅ Azure 入口網站顯示 "Running" 狀態
   - ✅ Application Insights 正在接收遙測資料

> **⚠️ 有問題嗎？** 有關部署故障排除請見 [常見問題](../docs/chapter-07-troubleshooting/common-issues.md)

### 調整範例以符合需求

每個範例包含：
- **README.md** - 詳細的設定與客製化說明
- **azure.yaml** - 含註解的 AZD 設定
- **infra/** - 含參數說明的 Bicep 範本
- **src/** - 範例應用程式程式碼
- **scripts/** - 常用作業的輔助腳本

## 🎯 學習目標

### 範例類別

#### **基本部署**
- 單一服務應用程式
- 簡單的基礎設施模式
- 基礎設定管理
- 成本效益高的開發環境設定

#### **進階情境**
- 多服務架構
- 複雜的網路配置
- 資料庫整合模式
- 安全性與合規性實作

#### **生產就緒模式**
- 高可用性配置
- 監控與可觀測性
- CI/CD 整合
- 災難復原設定

## 📖 範例描述

### 簡單 Web 應用 - Node.js Express
**Technologies**: Node.js, Express, MongoDB, Container Apps  
**Complexity**: 入門  
**Concepts**: 基本部署、REST API、NoSQL 資料庫整合

### 靜態網站 - React SPA
**Technologies**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complexity**: 入門  
**Concepts**: 靜態託管、無伺服器後端、現代化網頁開發

### Container App - Python Flask
**Technologies**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Complexity**: 入門  
**Concepts**: 容器化、REST API、自動縮減至零、健康檢查、監控  
**Location**: [本機範例](../../../examples/container-app/simple-flask-api)

### Container App - 微服務架構
**Technologies**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complexity**: 進階  
**Concepts**: 多服務架構、服務間通訊、訊息佇列、分散式追蹤  
**Location**: [本機範例](../../../examples/container-app/microservices)

### 資料庫應用 - C# 與 Azure SQL
**Technologies**: C# ASP.NET Core, Azure SQL Database, App Service  
**Complexity**: 中階  
**Concepts**: Entity Framework、資料庫連線、Web API 開發

### 無伺服器函式 - Python Azure Functions
**Technologies**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complexity**: 中階  
**Concepts**: 事件驅動架構、無伺服器運算、全端開發

### 微服務 - Java Spring Boot
**Technologies**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Complexity**: 中階  
**Concepts**: 微服務通訊、分散式系統、企業級模式

### Microsoft Foundry 範例

#### Azure OpenAI 聊天應用
**Technologies**: Azure OpenAI, Cognitive Search, App Service  
**Complexity**: 中階  
**Concepts**: RAG 架構、向量搜尋、與 LLM 整合

#### AI 文件處理
**Technologies**: Azure AI Document Intelligence, Storage, Functions  
**Complexity**: 中階  
**Concepts**: 文件分析、OCR、資料擷取

#### 機器學習管線
**Technologies**: Azure ML, MLOps, Container Registry  
**Complexity**: 進階  
**Concepts**: 模型訓練、部署管線、監控

## 🛠 設定範例

目錄 `configurations/` 包含可重複使用的元件：

### 環境設定
- 開發環境設定
- 暫存環境配置
- 生產就緒配置
- 多區域部署設定

### Bicep 模組
- 可重用的基礎設施元件
- 常見資源模式
- 強化安全的範本
- 成本最佳化配置

### 輔助腳本
- 環境設定自動化
- 資料庫遷移腳本
- 部署驗證工具
- 成本監控工具

## 🔧 客製化指南

### 針對您的使用情境調整範例

1. **檢視前置需求**
   - 檢查 Azure 服務需求
   - 驗證訂閱限制
   - 了解成本影響

2. **修改設定**
   - 更新 `azure.yaml` 服務定義
   - 客製化 Bicep 範本
   - 調整環境變數

3. **徹底測試**
   - 先部署到開發環境
   - 驗證功能
   - 測試擴展與效能

4. **安全審查**
   - 檢視存取控制
   - 實作機密管理
   - 啟用監控與警示

## 📊 比較矩陣

| 範例 | 服務數量 | 資料庫 | 認證 | 監控 | 複雜度 |
|---------|----------|----------|------|------------|------------|
| **Azure OpenAI Chat** (本機) | 2 | ❌ | Key Vault | 完整 | ⭐⭐ |
| **Python Flask API** (本機) | 1 | ❌ | 基礎 | 完整 | ⭐ |
| **Microservices** (本機) | 5+ | ✅ | 企業級 | 進階 | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | 基礎 | 基礎 | ⭐ |
| React SPA + Functions | 3 | ✅ | 基礎 | 完整 | ⭐ |
| Python Flask Container | 2 | ❌ | 基礎 | 完整 | ⭐ |
| C# Web API + SQL | 2 | ✅ | 完整 | 完整 | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | 完整 | 完整 | ⭐⭐ |
| Java Microservices | 5+ | ✅ | 完整 | 完整 | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | 完整 | 完整 | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | 基礎 | 完整 | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | 完整 | 完整 | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (本機) | **8+** | **✅** | **企業級** | **進階** | **⭐⭐⭐⭐** |

## 🎓 學習路線

### 推薦進程

1. **從簡單的 Web 應用開始**
   - 學習基本的 AZD 概念
   - 了解部署工作流程
   - 練習環境管理

2. **嘗試靜態網站**
   - 探索不同的託管選項
   - 學習 CDN 整合
   - 了解 DNS 配置

3. **進一步學習 Container App**
   - 學習容器化基礎
   - 了解自動擴展概念
   - 使用 Docker 實作練習

4. **加入資料庫整合**
   - 學習資料庫佈建
   - 了解連線字串
   - 練習機密管理

5. **探索無伺服器**
   - 了解事件驅動架構
   - 學習觸發器與綁定
   - 練習 API 開發

6. **構建微服務**
   - 學習服務間通訊
   - 了解分散式系統
   - 練習複雜部署

## 🔍 尋找合適的範例

### 按技術棧分類
- **Container Apps**: [Python Flask API (本機)](../../../examples/container-app/simple-flask-api), [Microservices (本機)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App、[Microservices API Gateway (本機)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (本機)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (本機)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (本機)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Go**: [Microservices User Service (本機)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (本機)](../../../examples/container-app/simple-flask-api), [Microservices (本機)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (本機)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Azure OpenAI Chat (本機)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Azure OpenAI Chat (本機)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (本機)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### 按架構模式分類
- **Simple REST API**: [Python Flask API (本機)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (本機)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (本機)](../../../examples/container-app/simple-flask-api), [Microservices (本機)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Azure OpenAI Chat (本機)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (本機)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### 按複雜度等級
- **入門**: [Python Flask API (本機)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **中階**: **[Azure OpenAI Chat (本機)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **進階**: ML Pipeline
- **企業生產就緒**: [Microservices (本機)](../../../examples/container-app/microservices)（具訊息佇列的多服務），**Retail Multi-Agent Solution**（具 ARM 範本部署的完整多代理系統）

## 📚 額外資源

### 文件連結
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### 社群範例
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo 應用程式 (Node.js 與 PostgreSQL)](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React 網頁應用程式 (C# API)](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps 工作](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions（使用 Java）](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### 最佳實務
- [Azure 良好架構框架](https://learn.microsoft.com/en-us/azure/well-architected/)
- [雲端採用框架](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 貢獻範例

有實用的範例想分享？歡迎投稿！

### 提交指南
1. 遵循既定的目錄結構
2. 包含詳細的 README.md
3. 在設定檔加入註解
4. 在提交前徹底測試
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

**專家提示**: 建議從符合您技術棧的最簡單範例開始，然後逐步挑戰更複雜的情境。每個範例都建立在前一個範例的概念上！

## 🚀 準備好開始了嗎？

### 您的學習路徑

1. **完全初學者？** → 從 [Flask API](../../../examples/container-app/simple-flask-api) 開始 (⭐, 20 mins)
2. **有基本 AZD 知識？** → 試試 [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 mins)
3. **想建立 AI 應用？** → 從 [Azure OpenAI Chat](../../../examples/azure-openai-chat) 開始 (⭐⭐, 35 mins) 或探索 [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ hours)
4. **需要特定技術棧？** → 使用上方的 [尋找合適的範例](../../../examples) 區段

### 下一步

- ✅ 查看上方的 [先決條件](../../../examples)
- ✅ 選擇符合您技能等級的範例 (參見 [複雜度圖例](../../../examples))
- ✅ 在部署前仔細閱讀該範例的 README
- ✅ 設定提醒，在測試後執行 `azd down`
- ✅ 透過 GitHub Issues 或 Discussions 分享您的經驗

### 需要幫助？

- 📖 [常見問題](../resources/faq.md) - 解答常見問題
- 🐛 [故障排除指南](../docs/chapter-07-troubleshooting/common-issues.md) - 修復部署問題
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - 向社群提問
- 📚 [學習指南](../resources/study-guide.md) - 強化您的學習

---

**導覽**
- **📚 課程首頁**: [AZD For Beginners](../README.md)
- **📖 學習材料**: [學習指南](../resources/study-guide.md) | [速查表](../resources/cheat-sheet.md) | [術語表](../resources/glossary.md)
- **🔧 資源**: [常見問題](../resources/faq.md) | [故障排除](../docs/chapter-07-troubleshooting/common-issues.md)

---

*最後更新：2025年11月 | [回報問題](https://github.com/microsoft/AZD-for-beginners/issues) | [貢獻範例](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責聲明：
本文件已使用 AI 翻譯服務 Co‑op Translator（https://github.com/Azure/co-op-translator）進行翻譯。雖然我們力求準確，但請注意自動翻譯可能包含錯誤或不準確之處。原始語言的文件應被視為權威來源。對於關鍵或重要資訊，建議委託專業人工翻譯。我們不對因使用本翻譯而導致的任何誤解或誤釋負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->