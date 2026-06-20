# 範例 - 實用 AZD 範本與設定

**以範例學習 - 依章節組織**
- **📚 課程首頁**: [AZD For Beginners](../README.md)
- **📖 章節對應**: 範例依學習難度組織
- **🚀 本機範例**: [零售多代理解決方案](retail-scenario.md)
- **🤖 外部 AI 範例**: 指向 Azure Samples 儲存庫的連結

> **📍 重要：本機範例與外部範例**  
> 本儲存庫包含 **4 個完整的本機範例**，具有完整實作：  
> - **Microsoft Foundry Models Chat**（gpt-4.1 部署含聊天介面）  
> - **Container Apps**（簡單 Flask API + 微服務）  
> - **Database App**（Web + SQL 資料庫）  
> - **Retail Multi-Agent**（企業級 AI 解決方案）  
>  
> 其他範例為可供複製的 Azure-Samples 儲存庫 <strong>外部參考</strong>。

## 介紹

此目錄提供實作範例與參考，協助你透過實際操作學習 Azure Developer CLI。Retail Multi-Agent 情境為本儲存庫中包含的完整、可投入生產的實作。其他範例則參考官方 Azure Samples，示範各種 AZD 範式。

### 複雜度等級說明

- ⭐ <strong>初學者</strong> - 基本概念、單一服務、15-30 分鐘
- ⭐⭐ <strong>中階</strong> - 多服務、資料庫整合、30-60 分鐘
- ⭐⭐⭐ <strong>進階</strong> - 複雜架構、AI 整合、1-2 小時
- ⭐⭐⭐⭐ <strong>專家級</strong> - 可投入生產、企業範式、2 小時以上

## 🎯 本儲存庫實際包含的內容

### ✅ 本機實作（可立即使用）

#### [Microsoft Foundry Models 聊天應用程式](azure-openai-chat/README.md) 🆕
**本儲存庫包含完整的 gpt-4.1 部署與聊天介面**

- **位置：** `examples/azure-openai-chat/`
- **複雜度：** ⭐⭐（中階）
- **包含內容：**
  - 完整的 Microsoft Foundry Models 部署（gpt-4.1）
  - Python 指令列聊天介面
  - Key Vault 整合以確保 API 金鑰安全
  - Bicep 基礎設施範本
  - 代幣用量與成本追蹤
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

**技術：** Microsoft Foundry Models、gpt-4.1、Key Vault、Python、Bicep

#### [Container App 範例](container-app/README.md) 🆕
<strong>本儲存庫包含全面性的容器部署範例</strong>

- **位置：** `examples/container-app/`
- **複雜度：** ⭐-⭐⭐⭐⭐（初學者到進階）
- **包含內容：**
  - [總覽指南](container-app/README.md) - 容器部署完整總覽
  - [簡單 Flask API](../../../examples/container-app/simple-flask-api) - 基本 REST API 範例
  - [微服務架構](../../../examples/container-app/microservices) - 可投入生產的多服務部署
  - Quick Start、Production 與 Advanced 範式
  - 監控、安全性與成本最佳化

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

**技術：** Azure Container Apps、Docker、Python Flask、Node.js、C#、Go、Application Insights

#### [零售多代理解決方案](retail-scenario.md) 🆕
<strong>本儲存庫包含完整的可投入生產實作</strong>

- **位置：** `examples/retail-multiagent-arm-template/`
- **複雜度：** ⭐⭐⭐⭐（進階）
- **包含內容：**
  - 完整的 ARM 部署範本
  - 多代理架構（客戶 + 庫存）
  - Microsoft Foundry Models 整合
  - AI Search 與 RAG
  - 全方位監控
  - 一鍵部署腳本

**快速開始：**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**技術：** Microsoft Foundry Models、AI Search、Container Apps、Cosmos DB、Application Insights

---

## 🔗 外部 Azure Samples（複製以使用）

以下範例由官方 Azure-Samples 儲存庫維護。複製它們以探索不同的 AZD 範式：

### 簡單應用（第 1-2 章）

| 範本 | 儲存庫 | 複雜度 | 服務 |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [本機: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python、Container Apps、Application Insights |
| **Microservices** | [本機: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | 多服務、Service Bus、Cosmos DB、SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express、Cosmos DB、Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps、Functions、SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python、Container Apps、API |

**使用方式：**
```bash
# 複製任一範例
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# 部署
azd up
```

### AI 應用範例（第 2、5、8 章）

| 範本 | 儲存庫 | 複雜度 | 焦點 |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [本機: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 部署 |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | 基本 AI 聊天 |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | 代理框架 |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG 範式 |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | 企業級 AI |

### 資料庫與進階範式（第 3-8 章）

| 範本 | 儲存庫 | 複雜度 | 焦點 |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | 資料庫整合 |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | 無伺服器 NoSQL |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | 多服務 |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## 學習目標

透過操作這些範例，你將會：
- 練習 Azure Developer CLI 的工作流程，使用真實的應用情境
- 了解不同應用架構及其 azd 實作
- 精通各種 Azure 服務的基礎設施即程式碼（Infrastructure as Code）範式
- 應用組態管理與針對不同環境的部署策略
- 在實務情境中實作監控、安全與擴充範式
- 建立在真實部署情境中疑難排解與除錯的經驗

## 學習成果

完成這些範例後，你將能：
- 自信地使用 Azure Developer CLI 部署各種應用類型
- 將提供的範本調整以符合你的應用需求
- 使用 Bicep 設計並實作自訂的基礎設施範式
- 為複雜的多服務應用設定正確的相依性
- 在實務情境中應用安全、監控與效能最佳實務
- 根據實務經驗進行部署的疑難排解與優化

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

> **💡 新接觸 AZD？** 從範例 #1（Flask API）開始 —— 約需 20 分鐘並教你核心概念。

### 適合初學者
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)**（本機） ⭐  
   部署一個支援 scale-to-zero 的簡單 REST API  
   **時間：** 20-25 分鐘 | **費用：** $0-5/月  
   **你會學到：** 基本 azd 工作流程、容器化、健康檢查探針  
   **預期結果：** 可運作的 API 端點回傳 "Hello, World!" 並具監控功能

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   部署附有 MongoDB 的 Node.js Express 網頁應用程式  
   **時間：** 25-35 分鐘 | **費用：** $10-30/月  
   **你會學到：** 資料庫整合、環境變數、連線字串  
   **預期結果：** 具建立/讀取/更新/刪除功能的代辦清單應用程式

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   透過 Azure Static Web Apps 主機化 React 靜態網站  
   **時間：** 20-30 分鐘 | **費用：** $0-10/月  
   **你會學到：** 靜態主機、無伺服器函式、CDN 部署  
   **預期結果：** 含 API 後端的 React 使用者介面、自動 SSL、全球 CDN

### 適合中階使用者
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)**（本機） ⭐⭐  
   部署 gpt-4.1，包含聊天介面和安全的 API 金鑰管理  
   **時間：** 35-45 分鐘 | **費用：** $50-200/月  
   **你會學到：** Microsoft Foundry Models 部署、Key Vault 整合、代幣追蹤  
   **預期結果：** 可運作的聊天應用程式，使用 gpt-4.1 並具成本監控

5. **[Container App - Microservices](../../../examples/container-app/microservices)**（本機） ⭐⭐⭐⭐  
   可投入生產的多服務架構  
   **時間：** 45-60 分鐘 | **費用：** $50-150/月  
   **你會學到：** 服務間通訊、訊息佇列、分散式追蹤  
   **預期結果：** 兩個服務系統（API Gateway + Product Service），具監控

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   使用 C# API 與 Azure SQL Database 的網頁應用程式  
   **時間：** 30-45 分鐘 | **費用：** $20-80/月  
   **你會學到：** Entity Framework、資料庫遷移、連線安全  
   **預期結果：** 使用 Azure SQL 後端的 C# API，自動架構部署

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   使用 HTTP 觸發器與 Cosmos DB 的 Python Azure Functions  
   **時間：** 30-40 分鐘 | **費用：** $10-40/月  
   **你會學到：** 事件驅動架構、無伺服器擴展、NoSQL 整合  
   **預期結果：** 回應 HTTP 請求並使用 Cosmos DB 儲存的函式應用程式

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   使用 Container Apps 與 API Gateway 的多服務 Java 應用程式  
   **時間：** 60-90 分鐘 | **費用：** $80-200/月  
   **你會學到：** Spring Boot 部署、service mesh、負載平衡  
   **預期結果：** 具服務發現與路由的多服務 Java 系統

### Microsoft Foundry 範本

1. **[Microsoft Foundry Models Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   包含聊天介面的完整 gpt-4.1 部署  
   **時間：** 35-45 分鐘 | **費用：** $50-200/月  
   **預期結果：** 可運作的聊天應用程式，具代幣追蹤與成本監控

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   採用 RAG 架構的智能聊天應用程式  
   **時間：** 60-90 分鐘 | **費用：** $100-300/月  
   **預期結果：** 具有文件搜尋與引用的 RAG 驅動聊天介面

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   使用 Azure AI 服務進行文件分析  
   **時間：** 40-60 分鐘 | **費用：** $20-80/月  
   **預期結果：** 從上傳文件中擷取文字、表格與實體的 API

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   使用 Azure Machine Learning 的 MLOps 工作流程  
   **時間：** 2-3 小時 | **費用：** $150-500/月  
   **預期結果：** 含訓練、部署與監控的自動化 ML 管線

### 實際情境

#### <strong>零售多代理解決方案</strong> 🆕  
**[完整實作指南](./retail-scenario.md)**

一個綜合性的、可投入生產的多代理客服解決方案，示範使用 AZD 部署企業等級 AI 應用。此情境提供：

- <strong>完整架構</strong>：多代理系統，包含專責的客服與庫存管理代理
- **Production Infrastructure**: Multi-region Microsoft Foundry Models deployments, AI Search, Container Apps, and comprehensive monitoring
- **Ready-to-Deploy ARM Template**: One-click deployment with multiple configuration modes (Minimal/Standard/Premium)
- **Advanced Features**: Red teaming security validation, agent evaluation framework, cost optimization, and troubleshooting guides
- **Real Business Context**: Retailer customer support use case with file uploads, search integration, and dynamic scaling

**Technologies**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Complexity**: ⭐⭐⭐⭐ (Advanced - Enterprise Production Ready)

**Perfect for**: AI developers, solution architects, and teams building production multi-agent systems

**Quick Start**: Deploy the complete solution in under 30 minutes using the included ARM template with `./deploy.sh -g myResourceGroup`

## 📋 使用說明

### 先決條件

在執行任何範例之前：
- ✅ 擁有 Azure 訂閱且具有 Owner 或 Contributor 存取權
- ✅ 已安裝 Azure Developer CLI（[安裝指南](../docs/chapter-01-foundation/installation.md)）
- ✅ Docker Desktop 已在執行中（用於容器範例）
- ✅ 適當的 Azure 配額（請檢查範例特定需求）

> **💰 成本警告：** 所有範例會建立實際的 Azure 資源，會產生費用。請參閱各自 README 檔案以獲得成本估算。完成後請記得執行 `azd down` 以避免持續費用。

### 在本機執行範例

1. **Clone or Copy Example**
   ```bash
   # 前往所需的範例
   cd examples/simple-web-app
   ```

2. **Initialize AZD Environment**
   ```bash
   # 以現有範本初始化
   azd init
   
   # 或建立新的環境
   azd env new my-environment
   ```

3. **Configure Environment**
   ```bash
   # 設定所需變數
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Deploy**
   ```bash
   # 部署基礎架構與應用程式
   azd up
   ```

5. **Verify Deployment**
   ```bash
   # 取得服務端點
   azd env get-values
   
   # 測試端點（範例）
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **預期成功指標：**
   - ✅ `azd up` 成功完成且沒有錯誤
   - ✅ 服務端點回傳 HTTP 200
   - ✅ Azure 入口網站顯示「Running」狀態
   - ✅ Application Insights 接收到遙測資料

> **⚠️ 有問題嗎？** 請參閱 [常見問題](../docs/chapter-07-troubleshooting/common-issues.md) 以取得部署疑難排解協助

### 調整範例

每個範例包含：
- **README.md** - 詳細的設定與自訂說明
- **azure.yaml** - 帶註解的 AZD 設定檔
- **infra/** - 含參數說明的 Bicep 範本
- **src/** - 範例應用程式程式碼
- **scripts/** - 常見任務的輔助腳本

## 🎯 學習目標

### 範例類別

#### <strong>基本部署</strong>
- 單一服務應用
- 簡單的基礎設施模式
- 基本的設定管理
- 成本效益的開發環境

#### <strong>進階情境</strong>
- 多服務架構
- 複雜的網路設定
- 資料庫整合模式
- 安全性與合規性實作

#### <strong>生產就緒模式</strong>
- 高可用性配置
- 監控與可觀察性
- CI/CD 整合
- 災難復原配置

## 📖 範例說明

### Simple Web App - Node.js Express
**Technologies**: Node.js, Express, MongoDB, Container Apps  
**Complexity**: Beginner  
**Concepts**: 基本部署、REST API、NoSQL 資料庫整合

### Static Website - React SPA
**Technologies**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complexity**: Beginner  
**Concepts**: 靜態託管、無伺服器後端、現代網頁開發

### Container App - Python Flask
**Technologies**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Complexity**: Beginner  
**Concepts**: 容器化、REST API、scale-to-zero、健康檢查、監控  
**Location**: [本機範例](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**Technologies**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complexity**: Advanced  
**Concepts**: 多服務架構、服務間通訊、訊息佇列、分散式追蹤  
**Location**: [本機範例](../../../examples/container-app/microservices)

### Database App - C# with Azure SQL
**Technologies**: C# ASP.NET Core, Azure SQL Database, App Service  
**Complexity**: Intermediate  
**Concepts**: Entity Framework、資料庫連線、Web API 開發

### Serverless Function - Python Azure Functions
**Technologies**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complexity**: Intermediate  
**Concepts**: 事件驅動架構、無伺服器運算、全端開發

### Microservices - Java Spring Boot
**Technologies**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Complexity**: Intermediate  
**Concepts**: 微服務通訊、分散式系統、企業架構模式

### Microsoft Foundry Examples

#### Microsoft Foundry Models Chat App
**Technologies**: Microsoft Foundry Models, Azure AI Search, App Service  
**Complexity**: Intermediate  
**Concepts**: RAG 架構、向量搜尋、LLM 整合

#### AI Document Processing
**Technologies**: Azure AI Document Intelligence, Storage, Functions  
**Complexity**: Intermediate  
**Concepts**: 文件分析、OCR、資料擷取

#### Machine Learning Pipeline
**Technologies**: Azure ML, MLOps, Container Registry  
**Complexity**: Advanced  
**Concepts**: 模型訓練、部署管線、監控

## 🛠 設定範例

`configurations/` 目錄包含可重用組件：

### 環境設定
- 開發環境設定
- 測試環境設定
- 生產就緒設定
- 多區域部署配置

### Bicep 模組
- 可重用的基礎設施組件
- 常見資源模式
- 安全強化範本
- 成本優化配置

### 輔助腳本
- 環境設定自動化
- 資料庫遷移腳本
- 部署驗證工具
- 成本監控工具

## 🔧 自訂指南

### 針對您的使用情境調整範例

1. <strong>檢視先決條件</strong>
   - 檢查 Azure 服務需求
   - 驗證訂閱限制
   - 了解成本影響

2. <strong>修改設定</strong>
   - 更新 `azure.yaml` 的服務定義
   - 自訂 Bicep 範本
   - 調整環境變數

3. <strong>徹底測試</strong>
   - 先部署到開發環境
   - 驗證功能性
   - 測試擴充與效能

4. <strong>安全性審查</strong>
   - 檢視存取控制
   - 實作密鑰與祕密管理
   - 啟用監控與警示

## 📊 比較矩陣

| Example | Services | Database | Auth | Monitoring | Complexity |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (Local) | 2 | ❌ | Key Vault | Full | ⭐⭐ |
| **Python Flask API** (Local) | 1 | ❌ | Basic | Full | ⭐ |
| **Microservices** (Local) | 5+ | ✅ | Enterprise | Advanced | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Basic | Basic | ⭐ |
| React SPA + Functions | 3 | ✅ | Basic | Full | ⭐ |
| Python Flask Container | 2 | ❌ | Basic | Full | ⭐ |
| C# Web API + SQL | 2 | ✅ | Full | Full | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Full | Full | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Full | Full | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | Full | Full | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Basic | Full | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Full | Full | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Local) | **8+** | **✅** | **Enterprise** | **Advanced** | **⭐⭐⭐⭐** |

## 🎓 學習路徑

### 建議進度

1. **從簡單 Web 應用開始**
   - 學習基本 AZD 概念
   - 了解部署工作流程
   - 練習環境管理

2. <strong>嘗試靜態網站</strong>
   - 探索不同的託管選項
   - 了解 CDN 整合
   - 了解 DNS 設定

3. **移至 Container App**
   - 學習容器化基礎
   - 了解擴充概念
   - 使用 Docker 練習

4. <strong>加入資料庫整合</strong>
   - 學習資料庫配置
   - 了解連線字串
   - 練習祕密管理

5. <strong>探索無伺服器</strong>
   - 了解事件驅動架構
   - 學習觸發器與繫結
   - 練習 API 開發

6. <strong>構建微服務</strong>
   - 學習服務通訊
   - 了解分散式系統
   - 練習複雜部署

## 🔍 找到合適的範例

### 根據技術棧
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

### 根據架構模式
- **Simple REST API**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Local)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### 根據複雜度等級
- **Beginner**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Intermediate**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **Advanced**: ML Pipeline
- **Enterprise Production-Ready**: [Microservices (Local)](../../../examples/container-app/microservices) (具有訊息佇列的多服務), **Retail Multi-Agent Solution** (包含 ARM 範本部署的完整多代理系統)

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
- [Todo App with Node.js and PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [使用 C# API 的 React 網頁應用程式](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps 工作](https://github.com/Azure-Samples/container-apps-jobs)
- [使用 Java 的 Azure Functions](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### 最佳實務
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 貢獻範例

有實用的範例想分享？我們歡迎貢獻！

### 提交指南
1. 遵循既定的目錄結構
2. 包含完整的 README.md
3. 在設定檔中加入註解
4. 在提交前徹底測試
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

<strong>專業提示</strong>：從最符合你技術棧的最簡單範例開始，然後逐步進階到更複雜的情境。每個範例都建立在前一個範例的概念上！

## 🚀 準備好開始了嗎？

### 你的學習路徑

1. **完全的初學者？** → 從 [Flask API](../../../examples/container-app/simple-flask-api) 開始 (⭐、20 分鐘)
2. **有基本的 AZD 知識？** → 嘗試 [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐、60 分鐘)
3. **要建立 AI 應用程式？** → 從 [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) 開始 (⭐⭐、35 分鐘) 或探索 [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐、2 小時以上)
4. **需要特定技術棧？** → 使用上方的 [尋找合適範例](#-finding-the-right-example) 區段

### 下一步

- ✅ 檢查上方的 [先決條件](#先決條件)
- ✅ 選擇符合你技能等級的範例（見 [複雜度說明](#複雜度等級說明)）
- ✅ 在部署前徹底閱讀該範例的 README
- ✅ 測試完畢後，設定提醒執行 `azd down`
- ✅ 透過 GitHub Issues 或 Discussions 分享你的經驗

### 需要幫忙？

- 📖 [FAQ](../resources/faq.md) - 常見問題解答
- 🐛 [疑難排解指南](../docs/chapter-07-troubleshooting/common-issues.md) - 修復部署問題
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - 向社群提問
- 📚 [學習指南](../resources/study-guide.md) - 強化你的學習

---

<strong>導覽</strong>
- **📚 課程首頁**: [AZD For Beginners](../README.md)
- **📖 學習資料**: [學習指南](../resources/study-guide.md) | [速查表](../resources/cheat-sheet.md) | [術語表](../resources/glossary.md)
- **🔧 資源**: [FAQ](../resources/faq.md) | [疑難排解](../docs/chapter-07-troubleshooting/common-issues.md)

---

*最後更新：2025 年 11 月 | [回報問題](https://github.com/microsoft/AZD-for-beginners/issues) | [貢獻範例](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
此文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們努力追求準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用此翻譯所產生的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->