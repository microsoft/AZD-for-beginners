# 範例 - 實用 AZD 範本與設定

**以範例學習 - 依章節整理**
- **📚 課程首頁**: [AZD 初學者](../README.md)
- **📖 章節對應**: 依學習難易度整理的範例
- **🚀 本地範例**: [零售多代理解決方案](retail-scenario.md)
- **🤖 外部 AI 範例**: 指向 Azure Samples 倉庫的連結

> **📍 重要：本地與外部範例**  
> 此倉庫包含 **4 個完整的本地範例**，含完整實作：  
> - **Microsoft Foundry Models 聊天應用** (gpt-4.1 部署含聊天介面)  
> - **Container Apps（容器應用）** (簡易 Flask API + 微服務)  
> - **Database App（資料庫應用）** (Web + SQL 資料庫)  
> - <strong>零售多代理</strong> (企業級 AI 解決方案)  
>  
> 其他範例為可複製的 Azure-Samples 倉庫 <strong>外部參考</strong>。

## 介紹

此目錄提供實作範例與參考，協助你透過實作練習學習 Azure Developer CLI。零售多代理情境是本倉庫中包含的完整、可用於生產的實作。其他範例則引用官方 Azure Samples，示範各種 AZD 模式。

### 複雜度評級對照

- ⭐ <strong>初學者</strong> - 基本概念、單一服務，15-30 分鐘
- ⭐⭐ <strong>中階</strong> - 多服務、資料庫整合，30-60 分鐘
- ⭐⭐⭐ <strong>進階</strong> - 複雜架構、AI 整合，1-2 小時
- ⭐⭐⭐⭐ <strong>專家</strong> - 可上線的企業模式，2 小時以上

## 🎯 此倉庫實際包含什麼

### ✅ 本地實作（可立即使用）

#### [Microsoft Foundry Models 聊天應用](azure-openai-chat/README.md) 🆕
**本倉庫包含完整的 gpt-4.1 部署與聊天介面**

- **位置：** `examples/azure-openai-chat/`
- **複雜度：** ⭐⭐（中階）
- **包含內容：**
  - 完整的 Microsoft Foundry Models 部署（gpt-4.1）
  - Python 指令列聊天介面
  - Key Vault 整合以安全管理 API 金鑰
  - Bicep 基礎架構範本
  - Token 使用與成本追蹤
  - 速率限制與錯誤處理

**快速開始：**
```bash
# 前往範例
cd examples/azure-openai-chat

# 部署所有項目
azd up

# 安裝相依套件並開始聊天
pip install -r src/requirements.txt
python src/chat.py
```

**技術：** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [容器應用 - Container App 範例](container-app/README.md) 🆕
<strong>本倉庫包含完整的容器部署範例</strong>

- **位置：** `examples/container-app/`
- **複雜度：** ⭐-⭐⭐⭐⭐（初學者到進階）
- **包含內容：**
  - [主指南](container-app/README.md) - 容器部署完整概覽
  - [簡易 Flask API](../../../examples/container-app/simple-flask-api) - 基本 REST API 範例
  - [微服務架構](../../../examples/container-app/microservices) - 生產就緒的多服務部署
  - 快速開始、生產與進階模式
  - 監控、安全與成本最佳化

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

**技術：** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [零售多代理解決方案](retail-scenario.md) 🆕
<strong>本倉庫包含完整可用於生產的實作</strong>

- **位置：** `examples/retail-multiagent-arm-template/`
- **複雜度：** ⭐⭐⭐⭐（進階）
- **包含內容：**
  - 完整的 ARM 部署範本
  - 多代理架構（顧客 + 庫存）
  - Microsoft Foundry Models 整合
  - AI Search 與 RAG
  - 完整監控
  - 一鍵部署腳本

**快速開始：**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**技術：** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 外部 Azure 範例（複製使用）

以下範例維護於官方 Azure-Samples 倉庫。複製它們以探索不同的 AZD 模式：

### 簡單應用（章節 1-2）

| 範本 | 倉庫 | 複雜度 | 服務 |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [本地：simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python、Container Apps、Application Insights |
| **Microservices** | [本地：microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | 多服務、Service Bus、Cosmos DB、SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express、Cosmos DB、Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps、Functions、SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python、Container Apps、API |

**如何使用：**
```bash
# 複製任一範例
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# 部署
azd up
```

### AI 應用範例（章節 2、5、8）

| 範本 | 倉庫 | 複雜度 | 重點 |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models 聊天** | [本地：azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 部署 |
| **AI Chat 快速入門** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | 基本 AI 聊天 |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | 代理框架 |
| **Search + OpenAI 範例** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG 模式 |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | 企業級 AI |

### 資料庫與進階模式（章節 3-8）

| 範本 | 倉庫 | 複雜度 | 重點 |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | 資料庫整合 |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | 無伺服器 NoSQL |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | 多服務 |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## 學習目標

透過這些範例，你將能：
- 透過真實應用情境練習 Azure Developer CLI 工作流程
- 理解不同應用架構及其 azd 實作
- 掌握各種 Azure 服務的基礎架構即程式碼模式
- 應用組態管理與環境特定的部署策略
- 在實際情境中實作監控、安全與擴充模式
- 建立實際部署情境的故障排除與除錯經驗

## 學習成果

完成這些範例後，你將能夠：
- 能自信地使用 Azure Developer CLI 部署各類應用程式
- 將提供的範本調整以符合你的應用需求
- 使用 Bicep 設計與實作自訂基礎架構模式
- 為複雜多服務應用設定適當的相依性
- 在真實情境中套用安全、監控與效能最佳實務
- 基於實務經驗進行部署故障排除與最佳化

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

> **💡 初次接觸 AZD？** 從範例 #1（Flask API）開始 - 約 20 分鐘，可學到核心概念。

### 初學者適用
1. **[容器應用 - Python Flask API](../../../examples/container-app/simple-flask-api)** (本地) ⭐  
   部署一個具備 scale-to-zero 的簡單 REST API  
   **時間：** 20-25 分鐘 | **成本：** $0-5/月  
   **你將學到：** 基本 azd 工作流程、容器化、健康檢查  
   **預期結果：** 具有監控功能、會回應 "Hello, World!" 的可用 API 端點

2. **[簡單 Web 應用 - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   部署搭配 MongoDB 的 Node.js Express 網站應用  
   **時間：** 25-35 分鐘 | **成本：** $10-30/月  
   **你將學到：** 資料庫整合、環境變數、連線字串  
   **預期結果：** 具有增刪查改功能的待辦清單應用

3. **[靜態網站 - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   使用 Azure Static Web Apps 代管 React 靜態網站  
   **時間：** 20-30 分鐘 | **成本：** $0-10/月  
   **你將學到：** 靜態託管、無伺服器函式、CDN 部署  
   **預期結果：** 具有 API 後端、自動 SSL、全球 CDN 的 React 介面

### 適合中階使用者
4. **[Microsoft Foundry Models 聊天應用](../../../examples/azure-openai-chat)** (本地) ⭐⭐  
   部署 gpt-4.1 並提供聊天介面與安全的 API 金鑰管理  
   **時間：** 35-45 分鐘 | **成本：** $50-200/月  
   **你將學到：** Microsoft Foundry Models 部署、Key Vault 整合、token 追蹤  
   **預期結果：** 具備 gpt-4.1 與成本監控的可用聊天應用

5. **[容器應用 - 微服務](../../../examples/container-app/microservices)** (本地) ⭐⭐⭐⭐  
   生產就緒的多服務架構  
   **時間：** 45-60 分鐘 | **成本：** $50-150/月  
   **你將學到：** 服務間通訊、訊息佇列、分散式追蹤  
   **預期結果：** 具監控的雙服務系統（API Gateway + 產品服務）

6. **[資料庫應用 - C# 與 Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   具 C# API 與 Azure SQL Database 的網站應用  
   **時間：** 30-45 分鐘 | **成本：** $20-80/月  
   **你將學到：** Entity Framework、資料庫遷移、連線安全  
   **預期結果：** 以 Azure SQL 為後端並自動部署結構的 C# API

7. **[無伺服器函式 - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   具 HTTP 觸發器且使用 Cosmos DB 的 Python Azure Functions  
   **時間：** 30-40 分鐘 | **成本：** $10-40/月  
   **你將學到：** 事件驅動架構、無伺服器擴充、NoSQL 整合  
   **預期結果：** 回應 HTTP 請求並使用 Cosmos DB 儲存的 Function 應用

8. **[微服務 - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   使用 Container Apps 與 API gateway 的多服務 Java 應用  
   **時間：** 60-90 分鐘 | **成本：** $80-200/月  
   **你將學到：** Spring Boot 部署、服務網格、負載平衡  
   **預期結果：** 具服務發現與路由的多服務 Java 系統

### Microsoft Foundry 範本

1. **[Microsoft Foundry Models 聊天應用 - 本地範例](../../../examples/azure-openai-chat)** ⭐⭐  
   完整 gpt-4.1 部署與聊天介面  
   **時間：** 35-45 分鐘 | **成本：** $50-200/月  
   **預期結果：** 具 token 追蹤與成本監控的可用聊天應用

2. **[Azure Search + OpenAI 範例](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   具 RAG 架構的智慧聊天應用  
   **時間：** 60-90 分鐘 | **成本：** $100-300/月  
   **預期結果：** 具文件搜尋與引用的 RAG 聊天介面

3. **[AI 文件處理](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   使用 Azure AI 服務進行文件分析  
   **時間：** 40-60 分鐘 | **成本：** $20-80/月  
   **預期結果：** 提供 API 從上傳文件中擷取文字、表格與實體

4. **[機器學習流程](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   使用 Azure Machine Learning 的 MLOps 工作流程  
   **時間：** 2-3 小時 | **成本：** $150-500/月  
   **預期結果：** 具訓練、部署與監控的自動化 ML 流程

### 真實世界情境

#### <strong>零售多代理解決方案</strong> 🆕
**[完整實作指南](./retail-scenario.md)**

一個完整、可上線的多代理客戶支援解決方案，示範使用 AZD 部署企業級 AI 應用。此情境提供：
- **Complete Architecture**: 完整架構：多代理系統，具有專責的客服與庫存管理代理
- **Production Infrastructure**: 生產基礎設施：多區域 Microsoft Foundry Models 部署、AI Search、Container Apps，以及完整監控
- **Ready-to-Deploy ARM Template**: 一鍵部署的 ARM 範本，提供多種設定模式（Minimal/Standard/Premium）
- **Advanced Features**: 進階功能：紅隊安全驗證、代理評估框架、成本優化與故障排除指南
- **Real Business Context**: 真實商業情境：零售業客戶支援範例，包含檔案上傳、搜尋整合與動態擴展

**Technologies**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Complexity**: ⭐⭐⭐⭐（進階 - 企業生產就緒）

**Perfect for**: AI 開發人員、解決方案架構師，以及正在建置生產級多代理系統的團隊

**Quick Start**: 使用內建 ARM 範本與 `./deploy.sh -g myResourceGroup` 在 30 分鐘內部署完整解決方案

## 📋 使用說明

### 前置需求

在執行任何範例之前：
- ✅ 擁有 Owner 或 Contributor 權限的 Azure 訂閱
- ✅ 已安裝 Azure Developer CLI（[安裝指南](../docs/chapter-01-foundation/installation.md)）
- ✅ Docker Desktop 正在執行（用於容器範例）
- ✅ 適當的 Azure 配額（請檢查範例特定需求）

> **💰 成本警告：** 所有範例都會建立實際的 Azure 資源並產生費用。請參考個別 README 檔以取得成本估算。完成後請記得執行 `azd down` 以避免持續產生費用。

### 在本機執行範例

1. <strong>複製或拷貝範例</strong>
   ```bash
   # 導覽到所需的範例
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
   # 設定所需變數
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
   
   # 測試該端點（範例）
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **預期成功指標：**
   - ✅ `azd up` 執行完成且無錯誤
   - ✅ 服務端點回應 HTTP 200
   - ✅ Azure 入口網站顯示「Running」狀態
   - ✅ Application Insights 正在接收遙測

> **⚠️ 有問題嗎？** 請參閱 [常見問題](../docs/chapter-07-troubleshooting/common-issues.md) 以獲得部署疑難排解

### 調整範例

每個範例包含：
- **README.md** - 詳細的設定與自訂說明
- **azure.yaml** - 含註解的 AZD 設定檔
- **infra/** - 含參數說明的 Bicep 範本
- **src/** - 範例應用程式碼
- **scripts/** - 常用工作的輔助腳本

## 🎯 學習目標

### 範例類別

#### <strong>基礎部署</strong>
- 單一服務應用程式
- 簡單的基礎設施模式
- 基本的設定管理
- 成本效益高的開發設定

#### <strong>進階情境</strong>
- 多服務架構
- 複雜的網路設定
- 資料庫整合模式
- 安全性與合規性實作

#### <strong>生產就緒模式</strong>
- 高可用性設定
- 監控與可觀測性
- CI/CD 整合
- 災害復原設定

## 📖 範例說明

### 簡單的 Web 應用 - Node.js Express
**Technologies**: Node.js、Express、MongoDB、Container Apps  
**Complexity**: 初學者  
**Concepts**: 基本部署、REST API、NoSQL 資料庫整合

### 靜態網站 - React SPA
**Technologies**: React、Azure Static Web Apps、Azure Functions、Cosmos DB  
**Complexity**: 初學者  
**Concepts**: 靜態託管、無伺服器後端、現代網頁開發

### 容器應用 - Python Flask
**Technologies**: Python Flask、Docker、Container Apps、Container Registry、Application Insights  
**Complexity**: 初學者  
**Concepts**: 容器化、REST API、scale-to-zero、健康檢查、監控  
**Location**: [本機範例](../../../examples/container-app/simple-flask-api)

### 容器應用 - 微服務架構
**Technologies**: Python、Node.js、C#、Go、Service Bus、Cosmos DB、Azure SQL、Container Apps  
**Complexity**: 進階  
**Concepts**: 多服務架構、服務間通訊、訊息佇列、分散式追蹤  
**Location**: [本機範例](../../../examples/container-app/microservices)

### 資料庫應用 - C# 與 Azure SQL
**Technologies**: C# ASP.NET Core、Azure SQL Database、App Service  
**Complexity**: 中階  
**Concepts**: Entity Framework、資料庫連線、Web API 開發

### 無伺服器函式 - Python Azure Functions
**Technologies**: Python、Azure Functions、Cosmos DB、Static Web Apps  
**Complexity**: 中階  
**Concepts**: 事件驅動架構、無伺服器運算、全端開發

### 微服務 - Java Spring Boot
**Technologies**: Java Spring Boot、Container Apps、Service Bus、API Gateway  
**Complexity**: 中階  
**Concepts**: 微服務通訊、分散式系統、企業模式

### Microsoft Foundry 範例

#### Microsoft Foundry Models 聊天應用
**Technologies**: Microsoft Foundry Models、Cognitive Search、App Service  
**Complexity**: 中階  
**Concepts**: RAG 架構、向量搜尋、LLM 整合

#### AI 文件處理
**Technologies**: Azure AI Document Intelligence、Storage、Functions  
**Complexity**: 中階  
**Concepts**: 文件分析、OCR、資料擷取

#### 機器學習流程
**Technologies**: Azure ML、MLOps、Container Registry  
**Complexity**: 進階  
**Concepts**: 模型訓練、部署流程、監控

## 🛠 配置範例

The `configurations/` directory contains reusable components:

### 環境配置
- 開發環境設定
- 測試環境配置
- 生產就緒配置
- 多區域部署設定

### Bicep 模組
- 可重用的基礎設施組件
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

1. <strong>確認前置需求</strong>
   - 檢查 Azure 服務需求
   - 驗證訂閱限制
   - 了解成本影響

2. <strong>修改設定</strong>
   - 更新 `azure.yaml` 服務定義
   - 客製化 Bicep 範本
   - 調整環境變數

3. <strong>全面測試</strong>
   - 先部署至開發環境
   - 驗證功能
   - 測試擴展與效能

4. <strong>安全性審查</strong>
   - 檢視存取控制
   - 實作祕密管理
   - 啟用監控與警示

## 📊 比較矩陣

| 範例 | 服務數 | 資料庫 | 認證 | 監控 | 複雜度 |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (Local) | 2 | ❌ | Key Vault | 完整 | ⭐⭐ |
| **Python Flask API** (Local) | 1 | ❌ | 基本 | 完整 | ⭐ |
| **Microservices** (Local) | 5+ | ✅ | 企業 | 進階 | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | 基本 | 基本 | ⭐ |
| React SPA + Functions | 3 | ✅ | 基本 | 完整 | ⭐ |
| Python Flask Container | 2 | ❌ | 基本 | 完整 | ⭐ |
| C# Web API + SQL | 2 | ✅ | 完整 | 完整 | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | 完整 | 完整 | ⭐⭐ |
| Java Microservices | 5+ | ✅ | 完整 | 完整 | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | 完整 | 完整 | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | 基本 | 完整 | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | 完整 | 完整 | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Local) | **8+** | **✅** | <strong>企業</strong> | <strong>進階</strong> | **⭐⭐⭐⭐** |

## 🎓 學習路徑

### 推薦進度

1. **從簡單的 Web 應用開始**
   - 學習基本 AZD 概念
   - 了解部署流程
   - 練習環境管理

2. <strong>嘗試靜態網站</strong>
   - 探索不同的託管選項
   - 了解 CDN 整合
   - 了解 DNS 設定

3. <strong>進階到容器應用</strong>
   - 學習容器化基礎
   - 了解擴展概念
   - 使用 Docker 練習

4. <strong>新增資料庫整合</strong>
   - 學習資料庫佈建
   - 了解連線字串
   - 練習祕密管理

5. <strong>探索無伺服器</strong>
   - 了解事件驅動架構
   - 學習觸發器與 bindings
   - 練習 API 開發

6. <strong>建立微服務</strong>
   - 學習服務通訊
   - 了解分散式系統
   - 練習複雜部署

## 🔍 尋找合適的範例

### 按技術堆疊
- **Container Apps**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Local)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Local)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Local)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Microservices User Service (Local)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (Local)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### 按架構樣式
- **Simple REST API**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Local)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### 按複雜度等級
- **Beginner**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Intermediate**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **Advanced**: ML Pipeline
- **Enterprise Production-Ready**: [Microservices (Local)](../../../examples/container-app/microservices)（具有訊息佇列的多服務）、**Retail Multi-Agent Solution**（完整多代理系統並附 ARM 範本部署）

## 📚 額外資源

### 文件連結
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### 社群範例
- [Azure 範例 AZD 範本](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry 範本](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI 圖庫](https://azure.github.io/awesome-azd/)
- [Todo 應用程式 (C# 與 Azure SQL)](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo 應用程式 (Python 與 MongoDB)](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo 應用程式 (Node.js 與 PostgreSQL)](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React 網站 (C# API)](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps 工作](https://github.com/Azure-Samples/container-apps-jobs)
- [使用 Java 的 Azure Functions](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### 最佳實務
- [Azure 良好架構框架](https://learn.microsoft.com/en-us/azure/well-architected/)
- [雲端採用框架](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 貢獻範例

有有用的範例想分享嗎？歡迎投稿！

### 提交指南
1. 遵循既定的目錄結構
2. 包含完整的 README.md
3. 在設定檔中加入註解
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

<strong>專家提示</strong>: 從符合您技術堆疊的最簡單範例開始，然後逐步進階到更複雜的情境。每個範例都建立在前一個的概念上！

## 🚀 準備開始了嗎？

### 學習路徑

1. **完全初學者？** → 從 [Flask API](../../../examples/container-app/simple-flask-api) 開始 (⭐、20 分鐘)
2. **有基本 AZD 知識？** → 嘗試 [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐、60 分鐘)
3. **建立 AI 應用程式？** → 從 [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) 開始 (⭐⭐、35 分鐘) 或探索 [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐、2+ 小時)
4. **需要特定技術堆疊？** → 使用上方的 [尋找合適的範例](#-finding-the-right-example) 區段

### 下一步

- ✅ 查看上方的 [先決條件](#前置需求)
- ✅ 選擇一個符合您技能等級的範例 (請參閱 [複雜度圖例](#複雜度評級對照))
- ✅ 在部署前徹底閱讀該範例的 README
- ✅ 在測試後設定提醒以執行 `azd down`
- ✅ 透過 GitHub Issues 或 Discussions 分享您的經驗

### 需要幫忙嗎？

- 📖 [常見問題 (FAQ)](../resources/faq.md) - 常見問題解答
- 🐛 [疑難排解指南](../docs/chapter-07-troubleshooting/common-issues.md) - 修復部署問題
- 💬 [GitHub 討論](https://github.com/microsoft/AZD-for-beginners/discussions) - 向社群提問
- 📚 [學習指南](../resources/study-guide.md) - 強化你的學習

---

<strong>導覽</strong>
- **📚 課程首頁**: [AZD 初學者指南](../README.md)
- **📖 學習資源**: [學習指南](../resources/study-guide.md) | [速查表](../resources/cheat-sheet.md) | [術語表](../resources/glossary.md)
- **🔧 資源**: [常見問題 (FAQ)](../resources/faq.md) | [疑難排解](../docs/chapter-07-troubleshooting/common-issues.md)

---

*最後更新：2025年11月 | [回報問題](https://github.com/microsoft/AZD-for-beginners/issues) | [貢獻範例](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**:
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不精確之處。原始文件的母語版本應被視為具權威性的來源。對於重要資訊，建議採用專業人工翻譯。我們不對因使用此翻譯而產生的任何誤解或誤譯負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->