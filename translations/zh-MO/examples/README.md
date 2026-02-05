# 範例 - 實用的 AZD 模板及配置

**透過範例學習 - 按章節整理**
- **📚 課程首頁**: [AZD 初學者指南](../README.md)
- **📖 章節對應**: 範例按學習難度整理
- **🚀 本地範例**: [零售多代理解決方案](retail-scenario.md)
- **🤖 外部 AI 範例**: 連結至 Azure Samples 資源庫

> **📍 重要提示: 本地範例 vs 外部範例**  
> 本資源庫包含 **4 個完整的本地範例**，提供完整的實現：  
> - **Azure OpenAI 聊天** (GPT-4 部署及聊天介面)  
> - **容器應用** (簡單 Flask API + 微服務)  
> - **資料庫應用** (網頁 + SQL 資料庫)  
> - **零售多代理** (企業 AI 解決方案)  
>  
> 其他範例為 **外部參考**，連結至 Azure-Samples 資源庫，可供克隆使用。

## 簡介

此目錄提供實用範例及參考，幫助您透過實際操作學習 Azure Developer CLI。零售多代理場景是一個完整的、可投入生產的實現，已包含在本資源庫中。其他範例則引用官方 Azure Samples，展示各種 AZD 模式。

### 難度評級圖例

- ⭐ **初學者** - 基本概念，單一服務，15-30 分鐘
- ⭐⭐ **中級** - 多個服務，資料庫整合，30-60 分鐘
- ⭐⭐⭐ **進階** - 複雜架構，AI 整合，1-2 小時
- ⭐⭐⭐⭐ **專家** - 可投入生產的企業模式，2 小時以上

## 🎯 本資源庫的內容

### ✅ 本地實現 (可直接使用)

#### [Azure OpenAI 聊天應用](azure-openai-chat/README.md) 🆕
**完整的 GPT-4 部署及聊天介面，已包含在本資源庫中**

- **位置:** `examples/azure-openai-chat/`
- **難度:** ⭐⭐ (中級)
- **包含內容:**
  - 完整的 Azure OpenAI 部署 (GPT-4)
  - Python 命令行聊天介面
  - Key Vault 整合以保護 API 密鑰
  - Bicep 基礎架構模板
  - Token 使用及成本追蹤
  - 限流及錯誤處理

**快速開始:**
```bash
# 導航到示例
cd examples/azure-openai-chat

# 部署所有內容
azd up

# 安裝依賴項並開始聊天
pip install -r src/requirements.txt
python src/chat.py
```

**技術:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [容器應用範例](container-app/README.md) 🆕
**全面的容器部署範例，已包含在本資源庫中**

- **位置:** `examples/container-app/`
- **難度:** ⭐-⭐⭐⭐⭐ (初學者至專家)
- **包含內容:**
  - [主指南](container-app/README.md) - 容器部署的完整概述
  - [簡單 Flask API](../../../examples/container-app/simple-flask-api) - 基本 REST API 範例
  - [微服務架構](../../../examples/container-app/microservices) - 可投入生產的多服務部署
  - 快速開始、生產及進階模式
  - 監控、安全性及成本優化

**快速開始:**
```bash
# 查看主指南
cd examples/container-app

# 部署簡單的 Flask API
cd simple-flask-api
azd up

# 部署微服務示例
cd ../microservices
azd up
```

**技術:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [零售多代理解決方案](retail-scenario.md) 🆕
**完整的可投入生產的實現，已包含在本資源庫中**

- **位置:** `examples/retail-multiagent-arm-template/`
- **難度:** ⭐⭐⭐⭐ (進階)
- **包含內容:**
  - 完整的 ARM 部署模板
  - 多代理架構 (客戶 + 庫存)
  - Azure OpenAI 整合
  - 使用 RAG 的 AI 搜索
  - 全面的監控
  - 一鍵部署腳本

**快速開始:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**技術:** Azure OpenAI, AI 搜索, 容器應用, Cosmos DB, Application Insights

---

## 🔗 外部 Azure 範例 (需克隆使用)

以下範例由官方 Azure-Samples 資源庫維護。克隆後可探索不同的 AZD 模式：

### 簡單應用 (章節 1-2)

| 模板 | 資源庫 | 難度 | 服務 |
|:-----|:-------|:-----|:-----|
| **Python Flask API** | [本地: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, 容器應用, Application Insights |
| **微服務** | [本地: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | 多服務, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, 容器應用 |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | 靜態網頁應用, Functions, SQL |
| **Python Flask 容器** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, 容器應用, API |

**使用方法:**
```bash
# 複製任何範例
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# 部署
azd up
```

### AI 應用範例 (章節 2, 5, 8)

| 模板 | 資源庫 | 難度 | 重點 |
|:-----|:-------|:-----|:-----|
| **Azure OpenAI 聊天** | [本地: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | GPT-4 部署 |
| **AI 聊天快速入門** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | 基本 AI 聊天 |
| **AI 代理** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | 代理框架 |
| **搜索 + OpenAI 範例** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG 模式 |
| **Contoso 聊天** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | 企業 AI |

### 資料庫及進階模式 (章節 3-8)

| 模板 | 資源庫 | 難度 | 重點 |
|:-----|:-------|:-----|:-----|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | 資料庫整合 |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | 無伺服器 NoSQL |
| **Java 微服務** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | 多服務 |
| **ML 管道** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## 學習目標

透過這些範例，您將能：
- 在真實應用場景中練習 Azure Developer CLI 工作流程
- 理解不同應用架構及其 AZD 實現方式
- 掌握各種 Azure 服務的基礎架構即代碼模式
- 應用配置管理及針對環境的部署策略
- 在實際情境中實現監控、安全性及擴展模式
- 累積處理及調試真實部署場景的經驗

## 學習成果

完成這些範例後，您將能：
- 自信地使用 Azure Developer CLI 部署各種應用類型
- 根據自己的應用需求調整提供的模板
- 設計及實現使用 Bicep 的自定義基礎架構模式
- 配置具有正確依賴關係的複雜多服務應用
- 在真實場景中應用安全性、監控及性能最佳實踐
- 根據實際經驗調試及優化部署

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

> **💡 AZD 初學者？** 從範例 #1 (Flask API) 開始 - 約需 20 分鐘，教您核心概念。

### 初學者
1. **[容器應用 - Python Flask API](../../../examples/container-app/simple-flask-api)** (本地) ⭐  
   部署一個簡單的 REST API，具備零負載自動縮減功能  
   **時間:** 20-25 分鐘 | **成本:** $0-5/月  
   **您將學到:** 基本 AZD 工作流程、容器化、健康檢查  
   **預期成果:** 可正常運行的 API 端點，返回 "Hello, World!"，並具備監控功能

2. **[簡單網頁應用 - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   部署一個 Node.js Express 網頁應用，搭配 MongoDB  
   **時間:** 25-35 分鐘 | **成本:** $10-30/月  
   **您將學到:** 資料庫整合、環境變數、連接字串  
   **預期成果:** 提供新增/查詢/更新/刪除功能的待辦事項應用

3. **[靜態網站 - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   使用 Azure 靜態網頁應用托管 React 靜態網站  
   **時間:** 20-30 分鐘 | **成本:** $0-10/月  
   **您將學到:** 靜態托管、無伺服器函數、CDN 部署  
   **預期成果:** React UI 搭配 API 後端、自動 SSL、全球 CDN

### 中級使用者
4. **[Azure OpenAI 聊天應用](../../../examples/azure-openai-chat)** (本地) ⭐⭐  
   部署 GPT-4，具備聊天介面及安全的 API 密鑰管理  
   **時間:** 35-45 分鐘 | **成本:** $50-200/月  
   **您將學到:** Azure OpenAI 部署、Key Vault 整合、Token 追蹤  
   **預期成果:** 可正常運行的聊天應用，具備 GPT-4 及成本監控功能

5. **[容器應用 - 微服務](../../../examples/container-app/microservices)** (本地) ⭐⭐⭐⭐  
   可投入生產的多服務架構  
   **時間:** 45-60 分鐘 | **成本:** $50-150/月  
   **您將學到:** 服務間通信、消息隊列、分佈式追蹤  
   **預期成果:** 2 服務系統 (API Gateway + Product Service)，具備監控功能

6. **[資料庫應用 - C# 搭配 Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   使用 C# API 及 Azure SQL 資料庫的網頁應用  
   **時間:** 30-45 分鐘 | **成本:** $20-80/月  
   **您將學到:** Entity Framework、資料庫遷移、連接安全性  
   **預期成果:** C# API 搭配 Azure SQL 後端，自動部署資料庫架構

7. **[無伺服器函數 - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   使用 HTTP 觸發器及 Cosmos DB 的 Python Azure Functions  
   **時間:** 30-40 分鐘 | **成本:** $10-40/月  
   **您將學到:** 事件驅動架構、無伺服器擴展、NoSQL 整合  
   **預期成果:** 函數應用回應 HTTP 請求，並使用 Cosmos DB 存儲

8. **[微服務 - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   使用容器應用及 API Gateway 的多服務 Java 應用  
   **時間:** 60-90 分鐘 | **成本:** $80-200/月  
   **您將學到:** Spring Boot 部署、服務網格、負載均衡  
   **預期成果:** 多服務 Java 系統，具備服務發現及路由功能

### Azure AI Foundry 模板

1. **[Azure OpenAI 聊天應用 - 本地範例](../../../examples/azure-openai-chat)** ⭐⭐  
   完整的 GPT-4 部署及聊天介面  
   **時間:** 35-45 分鐘 | **成本:** $50-200/月  
   **預期成果:** 可正常運行的聊天應用，具備 Token 追蹤及成本監控功能

2. **[Azure 搜索 + OpenAI 範例](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   使用 RAG 架構的智能聊天應用  
   **時間:** 60-90 分鐘 | **成本:** $100-300/月  
   **預期成果:** 使用 RAG 驅動的聊天介面，具備文件搜索及引用功能

3. **[AI 文件處理](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   使用 Azure AI 服務進行文件分析  
   **時間:** 40-60 分鐘 | **成本:** $20-80/月  
   **預期成果:** API 可從上傳的文件中提取文字、表格及實體

4. **[機器學習管道](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   使用 Azure 機器學習的 MLOps 工作流程  
   **時間:** 2-3 小時 | **成本:** $150-500/月  
   **預期成果:** 自動化的 ML 管道，具備訓練、部署及監控功能

### 真實場景

#### **零售多代理解決方案** 🆕
**[完整實現指南](./retail-scenario.md)**

一個全面的、可投入生產的多代理客戶支持解決方案，展示了使用 AZD 部署企業級 AI 應用的能力。此場景提供：

- **完整架構**: 多代理系統，包含專業的客戶服務及庫存管理代理
- **生產基礎設施**：多區域 Azure OpenAI 部署、AI 搜索、容器應用程式及全面監控  
- **即用型 ARM 模板**：一鍵部署，提供多種配置模式（簡約/標準/高級）  
- **高級功能**：紅隊安全驗證、代理評估框架、成本優化及故障排除指南  
- **真實業務場景**：零售商客戶支援案例，包含檔案上傳、搜索整合及動態擴展  

**技術**：Azure OpenAI (GPT-4o, GPT-4o-mini)、Azure AI 搜索、容器應用程式、Cosmos DB、Application Insights、Document Intelligence、Bing 搜索 API  

**複雜度**：⭐⭐⭐⭐（高級 - 企業生產就緒）  

**適合對象**：AI 開發者、解決方案架構師及構建生產多代理系統的團隊  

**快速開始**：使用包含的 ARM 模板，30 分鐘內部署完整解決方案 `./deploy.sh -g myResourceGroup`  

## 📋 使用說明  

### 先決條件  

在執行任何範例之前：  
- ✅ 擁有擁有者或貢獻者權限的 Azure 訂閱  
- ✅ 已安裝 Azure Developer CLI ([安裝指南](../docs/getting-started/installation.md))  
- ✅ Docker Desktop 正在運行（適用於容器範例）  
- ✅ 適當的 Azure 配額（檢查範例特定需求）  

> **💰 成本警告**：所有範例都會創建真正的 Azure 資源並產生費用。請參閱各個 README 文件了解成本估算。完成後記得執行 `azd down` 以避免持續費用。  

### 本地執行範例  

1. **克隆或複製範例**  
   ```bash
   # 導航至所需範例
   cd examples/simple-web-app
   ```
  
2. **初始化 AZD 環境**  
   ```bash
   # 使用現有模板初始化
   azd init
   
   # 或創建新環境
   azd env new my-environment
   ```
  
3. **配置環境**  
   ```bash
   # 設置所需變數
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```
  
4. **部署**  
   ```bash
   # 部署基礎設施和應用程序
   azd up
   ```
  
5. **驗證部署**  
   ```bash
   # 獲取服務端點
   azd env get-values
   
   # 測試端點（示例）
   curl https://your-app-url.azurecontainer.io/health
   ```
  
   **預期成功指標**：  
   - ✅ `azd up` 無錯誤完成  
   - ✅ 服務端點返回 HTTP 200  
   - ✅ Azure Portal 顯示「運行中」狀態  
   - ✅ Application Insights 接收遙測  

> **⚠️ 問題？** 請參閱 [常見問題](../docs/troubleshooting/common-issues.md) 以解決部署問題  

### 調整範例  

每個範例包含：  
- **README.md** - 詳細的設置和自定義說明  
- **azure.yaml** - 帶有註解的 AZD 配置  
- **infra/** - 帶有參數解釋的 Bicep 模板  
- **src/** - 範例應用程式代碼  
- **scripts/** - 常用任務的輔助腳本  

## 🎯 學習目標  

### 範例分類  

#### **基礎部署**  
- 單一服務應用程式  
- 簡單的基礎設施模式  
- 基本配置管理  
- 成本效益高的開發設置  

#### **高級場景**  
- 多服務架構  
- 複雜的網絡配置  
- 數據庫整合模式  
- 安全性和合規性實施  

#### **生產就緒模式**  
- 高可用性配置  
- 監控和可觀察性  
- CI/CD 整合  
- 災難恢復設置  

## 📖 範例描述  

### 簡單 Web 應用程式 - Node.js Express  
**技術**：Node.js、Express、MongoDB、容器應用程式  
**複雜度**：初學者  
**概念**：基礎部署、REST API、NoSQL 數據庫整合  

### 靜態網站 - React SPA  
**技術**：React、Azure 靜態 Web 應用程式、Azure Functions、Cosmos DB  
**複雜度**：初學者  
**概念**：靜態託管、無伺服器後端、現代 Web 開發  

### 容器應用程式 - Python Flask  
**技術**：Python Flask、Docker、容器應用程式、容器註冊表、Application Insights  
**複雜度**：初學者  
**概念**：容器化、REST API、零擴展、健康檢查、監控  
**位置**：[本地範例](../../../examples/container-app/simple-flask-api)  

### 容器應用程式 - 微服務架構  
**技術**：Python、Node.js、C#、Go、Service Bus、Cosmos DB、Azure SQL、容器應用程式  
**複雜度**：高級  
**概念**：多服務架構、服務通信、消息隊列、分佈式追蹤  
**位置**：[本地範例](../../../examples/container-app/microservices)  

### 數據庫應用程式 - C# 與 Azure SQL  
**技術**：C# ASP.NET Core、Azure SQL 數據庫、App Service  
**複雜度**：中級  
**概念**：Entity Framework、數據庫連接、Web API 開發  

### 無伺服器函數 - Python Azure Functions  
**技術**：Python、Azure Functions、Cosmos DB、靜態 Web 應用程式  
**複雜度**：中級  
**概念**：事件驅動架構、無伺服器計算、全棧開發  

### 微服務 - Java Spring Boot  
**技術**：Java Spring Boot、容器應用程式、Service Bus、API Gateway  
**複雜度**：中級  
**概念**：微服務通信、分佈式系統、企業模式  

### Azure AI Foundry 範例  

#### Azure OpenAI 聊天應用程式  
**技術**：Azure OpenAI、Cognitive Search、App Service  
**複雜度**：中級  
**概念**：RAG 架構、向量搜索、LLM 整合  

#### AI 文件處理  
**技術**：Azure AI Document Intelligence、Storage、Functions  
**複雜度**：中級  
**概念**：文件分析、OCR、數據提取  

#### 機器學習管道  
**技術**：Azure ML、MLOps、容器註冊表  
**複雜度**：高級  
**概念**：模型訓練、部署管道、監控  

## 🛠 配置範例  

`configurations/` 目錄包含可重用的組件：  

### 環境配置  
- 開發環境設置  
- 測試環境配置  
- 生產就緒配置  
- 多區域部署設置  

### Bicep 模塊  
- 可重用的基礎設施組件  
- 常見資源模式  
- 安全加固模板  
- 成本優化配置  

### 輔助腳本  
- 環境設置自動化  
- 數據庫遷移腳本  
- 部署驗證工具  
- 成本監控工具  

## 🔧 自定義指南  

### 根據您的使用案例調整範例  

1. **檢查先決條件**  
   - 檢查 Azure 服務需求  
   - 驗證訂閱限制  
   - 理解成本影響  

2. **修改配置**  
   - 更新 `azure.yaml` 服務定義  
   - 自定義 Bicep 模板  
   - 調整環境變數  

3. **徹底測試**  
   - 首先部署到開發環境  
   - 驗證功能  
   - 測試擴展性和性能  

4. **安全審查**  
   - 審查訪問控制  
   - 實施秘密管理  
   - 啟用監控和警報  

## 📊 比較矩陣  

| 範例 | 服務 | 數據庫 | 認證 | 監控 | 複雜度 |  
|---------|----------|----------|------|------------|------------|  
| **Azure OpenAI 聊天**（本地） | 2 | ❌ | Key Vault | 完整 | ⭐⭐ |  
| **Python Flask API**（本地） | 1 | ❌ | 基本 | 完整 | ⭐ |  
| **微服務**（本地） | 5+ | ✅ | 企業 | 高級 | ⭐⭐⭐⭐ |  
| Node.js Express Todo | 2 | ✅ | 基本 | 基本 | ⭐ |  
| React SPA + Functions | 3 | ✅ | 基本 | 完整 | ⭐ |  
| Python Flask 容器 | 2 | ❌ | 基本 | 完整 | ⭐ |  
| C# Web API + SQL | 2 | ✅ | 完整 | 完整 | ⭐⭐ |  
| Python Functions + SPA | 3 | ✅ | 完整 | 完整 | ⭐⭐ |  
| Java 微服務 | 5+ | ✅ | 完整 | 完整 | ⭐⭐ |  
| Azure OpenAI 聊天 | 3 | ✅ | 完整 | 完整 | ⭐⭐⭐ |  
| AI 文件處理 | 2 | ❌ | 基本 | 完整 | ⭐⭐ |  
| ML 管道 | 4+ | ✅ | 完整 | 完整 | ⭐⭐⭐⭐ |  
| **零售多代理**（本地） | **8+** | **✅** | **企業** | **高級** | **⭐⭐⭐⭐** |  

## 🎓 學習路徑  

### 推薦進度  

1. **從簡單 Web 應用程式開始**  
   - 學習基本 AZD 概念  
   - 理解部署工作流程  
   - 練習環境管理  

2. **嘗試靜態網站**  
   - 探索不同的託管選項  
   - 學習 CDN 整合  
   - 理解 DNS 配置  

3. **轉向容器應用程式**  
   - 學習容器化基礎知識  
   - 理解擴展概念  
   - 練習使用 Docker  

4. **添加數據庫整合**  
   - 學習數據庫配置  
   - 理解連接字符串  
   - 練習秘密管理  

5. **探索無伺服器**  
   - 理解事件驅動架構  
   - 學習觸發器和綁定  
   - 練習使用 API  

6. **構建微服務**  
   - 學習服務通信  
   - 理解分佈式系統  
   - 練習複雜部署  

## 🔍 找到合適的範例  

### 按技術堆疊  
- **容器應用程式**：[Python Flask API（本地）](../../../examples/container-app/simple-flask-api)、[微服務（本地）](../../../examples/container-app/microservices)、Java 微服務  
- **Node.js**：Node.js Express Todo 應用程式、[微服務 API Gateway（本地）](../../../examples/container-app/microservices)  
- **Python**：[Python Flask API（本地）](../../../examples/container-app/simple-flask-api)、[微服務產品服務（本地）](../../../examples/container-app/microservices)、Python Functions + SPA  
- **C#**：[微服務訂單服務（本地）](../../../examples/container-app/microservices)、C# Web API + SQL 數據庫、Azure OpenAI 聊天應用程式、ML 管道  
- **Go**：[微服務用戶服務（本地）](../../../examples/container-app/microservices)  
- **Java**：Java Spring Boot 微服務  
- **React**：React SPA + Functions  
- **容器**：[Python Flask（本地）](../../../examples/container-app/simple-flask-api)、[微服務（本地）](../../../examples/container-app/microservices)、Java 微服務  
- **數據庫**：[微服務（本地）](../../../examples/container-app/microservices)、Node.js + MongoDB、C# + Azure SQL、Python + Cosmos DB  
- **AI/ML**：**[Azure OpenAI 聊天（本地）](../../../examples/azure-openai-chat)**、Azure OpenAI 聊天應用程式、AI 文件處理、ML 管道、**零售多代理解決方案**  
- **多代理系統**：**零售多代理解決方案**  
- **OpenAI 整合**：**[Azure OpenAI 聊天（本地）](../../../examples/azure-openai-chat)**、零售多代理解決方案  
- **企業生產**：[微服務（本地）](../../../examples/container-app/microservices)、**零售多代理解決方案**  

### 按架構模式  
- **簡單 REST API**：[Python Flask API（本地）](../../../examples/container-app/simple-flask-api)  
- **單體架構**：Node.js Express Todo、C# Web API + SQL  
- **靜態 + 無伺服器**：React SPA + Functions、Python Functions + SPA  
- **微服務**：[生產微服務（本地）](../../../examples/container-app/microservices)、Java Spring Boot 微服務  
- **容器化**：[Python Flask（本地）](../../../examples/container-app/simple-flask-api)、[微服務（本地）](../../../examples/container-app/microservices)  
- **AI 驅動**：**[Azure OpenAI 聊天（本地）](../../../examples/azure-openai-chat)**、Azure OpenAI 聊天應用程式、AI 文件處理、ML 管道、**零售多代理解決方案**  
- **多代理架構**：**零售多代理解決方案**  
- **企業多服務**：[微服務（本地）](../../../examples/container-app/microservices)、**零售多代理解決方案**  

### 按複雜度級別  
- **初學者**：[Python Flask API（本地）](../../../examples/container-app/simple-flask-api)、Node.js Express Todo、React SPA + Functions  
- **中級**：**[Azure OpenAI 聊天（本地）](../../../examples/azure-openai-chat)**、C# Web API + SQL、Python Functions + SPA、Java 微服務、Azure OpenAI 聊天應用程式、AI 文件處理  
- **高級**：ML 管道  
- **企業生產就緒**：[微服務（本地）](../../../examples/container-app/microservices)（多服務帶消息隊列）、**零售多代理解決方案**（完整多代理系統，帶 ARM 模板部署）  

## 📚 附加資源  

### 文件連結  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)  
- [Bicep 文件](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure 架構中心](https://learn.microsoft.com/en-us/azure/architecture/)  

### 社群範例  
- [Azure 範例 AZD 模板](https://github.com/Azure-Samples/azd-templates)  
- [Azure AI Foundry 模板](https://github.com/Azure/ai-foundry-templates)  
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)  
- [Todo 應用程式（C# 與 Azure SQL）](https://github.com/Azure-Samples/todo-csharp-sql)  
- [Todo 應用程式（Python 與 MongoDB）](https://github.com/Azure-Samples/todo-python-mongo)  
- [使用 Node.js 和 PostgreSQL 的待辦事項應用程式](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [使用 C# API 的 React 網頁應用程式](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure 容器應用程式工作](https://github.com/Azure-Samples/container-apps-jobs)
- [使用 Java 的 Azure Functions](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### 最佳實踐
- [Azure 良好架構框架](https://learn.microsoft.com/en-us/azure/well-architected/)
- [雲端採用框架](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 貢獻範例

有有用的範例想分享？我們歡迎您的貢獻！

### 提交指南
1. 遵循既定的目錄結構
2. 包含完整的 README.md
3. 在配置文件中添加註解
4. 提交前進行全面測試
5. 包括成本估算和前置條件

### 範例模板結構
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

**專業提示**：從最簡單的範例開始，選擇符合您的技術堆疊的範例，然後逐步進階到更複雜的情境。每個範例都基於前一個範例的概念進行構建！

## 🚀 準備開始？

### 您的學習路徑

1. **完全初學者？** → 從 [Flask API](../../../examples/container-app/simple-flask-api) 開始 (⭐, 20 分鐘)
2. **有基本的 AZD 知識？** → 試試 [微服務](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 分鐘)
3. **正在構建 AI 應用程式？** → 從 [Azure OpenAI Chat](../../../examples/azure-openai-chat) 開始 (⭐⭐, 35 分鐘) 或探索 [零售多代理](retail-scenario.md) (⭐⭐⭐⭐, 2+ 小時)
4. **需要特定技術堆疊？** → 使用 [尋找合適範例](../../../examples) 部分

### 下一步

- ✅ 查看 [前置條件](../../../examples) 上方
- ✅ 選擇符合您技能水平的範例 (參見 [複雜度圖例](../../../examples))
- ✅ 在部署前仔細閱讀範例的 README
- ✅ 測試後設置提醒執行 `azd down`
- ✅ 通過 GitHub Issues 或 Discussions 分享您的經驗

### 需要幫助？

- 📖 [常見問題](../resources/faq.md) - 解答常見問題
- 🐛 [故障排除指南](../docs/troubleshooting/common-issues.md) - 修復部署問題
- 💬 [GitHub 討論](https://github.com/microsoft/AZD-for-beginners/discussions) - 向社群提問
- 📚 [學習指南](../resources/study-guide.md) - 加強您的學習

---

**導航**
- **📚 課程首頁**: [AZD 初學者指南](../README.md)
- **📖 學習材料**: [學習指南](../resources/study-guide.md) | [速查表](../resources/cheat-sheet.md) | [詞彙表](../resources/glossary.md)
- **🔧 資源**: [常見問題](../resources/faq.md) | [故障排除](../docs/troubleshooting/common-issues.md)

---

*最後更新日期：2025 年 11 月 | [回報問題](https://github.com/microsoft/AZD-for-beginners/issues) | [貢獻範例](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
此文件已使用人工智能翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們努力確保準確性，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於關鍵信息，建議使用專業人工翻譯。我們對因使用此翻譯而引起的任何誤解或誤釋不承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->