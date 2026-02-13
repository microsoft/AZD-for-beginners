# Examples - 實用的 AZD 模板與設定範例

**透過實例學習 - 按章節組織**
- **📚 課程首頁**: [AZD 新手入門](../README.md)
- **📖 章節對應**: 依學習難度組織的範例
- **🚀 本地範例**: [零售多代理解決方案](retail-scenario.md)
- **🤖 外部 AI 範例**: 連結至 Azure Samples 倉庫

> **📍 重要提醒：本地範例與外部範例**  
> 本倉庫包含 **4 個完整的本地範例**，有完整實作：  
> - **Azure OpenAI Chat**（GPT-4 部署與聊天介面）  
> - **Container Apps**（簡單 Flask API + 微服務）  
> - **資料庫應用程式**（網頁 + SQL 資料庫）  
> - **零售多代理**（企業級 AI 解決方案）  
>  
> 額外範例是指向可 clone 的 Azure-Samples 官方倉庫的外部參考。

## 介紹

本目錄提供實用範例與參考，幫助你透過實作學習 Azure Developer CLI。零售多代理場景是本倉庫中包含的完整、生產就緒實作。其他範例則參考官方 Azure Samples，展示多種 AZD 範式。

### 難度分級說明

- ⭐ **初學者** - 基本概念，單一服務，15-30 分鐘
- ⭐⭐ **中階** - 多服務，資料庫整合，30-60 分鐘
- ⭐⭐⭐ **進階** - 複雜架構，AI 整合，1-2 小時
- ⭐⭐⭐⭐ **專家** - 生產就緒，企業級範式，超過 2 小時

## 🎯 本倉庫實際內容

### ✅ 本地實作（即刻可用）

#### [Azure OpenAI Chat 應用程式](azure-openai-chat/README.md) 🆕
**本倉庫包含完整 GPT-4 部署與聊天介面**

- **位置:** `examples/azure-openai-chat/`
- **難度:** ⭐⭐（中階）
- **內容包含：**
  - 完整 Azure OpenAI 部署（GPT-4）
  - Python 命令行聊天介面
  - Key Vault 整合以保障 API 金鑰安全
  - Bicep 基礎架構模版
  - 令牌使用與成本追蹤
  - 限流與錯誤處理

**快速開始：**
```bash
# 導航到範例
cd examples/azure-openai-chat

# 部署所有內容
azd up

# 安裝依賴並開始聊天
pip install -r src/requirements.txt
python src/chat.py
```

**技術:** Azure OpenAI、GPT-4、Key Vault、Python、Bicep

#### [Container App 範例](container-app/README.md) 🆕
**本倉庫包含全面的容器部署範例**

- **位置:** `examples/container-app/`
- **難度:** ⭐-⭐⭐⭐⭐（初學者至進階）
- **內容包含：**
  - [主導覽](container-app/README.md) - 容器部署完整概覽
  - [簡單 Flask API](../../../examples/container-app/simple-flask-api) - 基礎 REST API 範例
  - [微服務架構](../../../examples/container-app/microservices) - 生產就緒多服務部署
  - 快速上手、生產與進階範式
  - 監控、安全與成本優化

**快速開始：**
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

**技術:** Azure Container Apps、Docker、Python Flask、Node.js、C#、Go、Application Insights

#### [零售多代理解決方案](retail-scenario.md) 🆕
**本倉庫包含完整生產就緒實作**

- **位置:** `examples/retail-multiagent-arm-template/`
- **難度:** ⭐⭐⭐⭐（專家）
- **內容包含：**
  - 完整 ARM 部署模板
  - 多代理架構（客戶 + 庫存）
  - Azure OpenAI 整合
  - AI 搜尋與 RAG 架構
  - 全面監控機制
  - 一鍵部署腳本

**快速開始：**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**技術:** Azure OpenAI、AI 搜尋、Container Apps、Cosmos DB、Application Insights

---

## 🔗 外部 Azure Samples（克隆使用）

以下範例托管在官方 Azure-Samples 倉庫，請 clone 後探索多樣 AZD 範式：

### 簡易應用（第 1-2 章）

| 模板 | 倉庫 | 難度 | 服務 |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [本地: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python、Container Apps、Application Insights |
| **微服務** | [本地: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | 多服務、Service Bus、Cosmos DB、SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express、Cosmos DB、Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | 靜態網站應用、Functions、SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python、Container Apps、API |

**使用方法：**
```bash
# 複製任何範例
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# 部署
azd up
```

### AI 應用範例（第 2、5、8 章）

| 模板 | 倉庫 | 難度 | 專注點 |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI Chat** | [本地: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | GPT-4 部署 |
| **AI Chat 快速上手** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | 基礎 AI 聊天 |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | 代理框架 |
| **搜尋 + OpenAI 示範** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG 架構 |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | 企業級 AI |

### 資料庫與進階範式（第 3-8 章）

| 模板 | 倉庫 | 難度 | 專注點 |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | 資料庫整合 |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL 無伺服器 |
| **Java 微服務** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | 多服務 |
| **機器學習流水線** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## 學習目標

透過這些範例，你將能：
- 練習 Azure Developer CLI 工作流程，搭配真實應用場景
- 理解不同應用架構及其 azd 實作方式
- 精通多種 Azure 服務的基礎架構即程式碼範式
- 應用組態管理和針對不同環境的部署策略
- 在實際場景中實作監控、安全與擴展模式
- 鍛鍊排錯與除錯真實部署的能力

## 學習成果

完成範例後，你將能：
- 自信使用 Azure Developer CLI 部署各種應用類型
- 依需求修改並套用範本至自有應用
- 設計並實作自訂基礎架構模式（Bicep）
- 針對複雜多服務應用正確設定依賴關係
- 實務運用安全、監控與效能最佳實踐
- 根據經驗排除並優化部署問題

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

> **💡 AZD 新手？** 從範例 #1（Flask API）開始，約 20 分鐘即可學習核心概念。

### 初學者適用
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)**（本地）⭐  
   部署簡單 REST API，支援自動縮減至零  
   **時間:** 20-25 分鐘 | **費用:** $0-5/月  
   **學到:** 基本 azd 工作流程、容器化、健康檢查  
   **預期成果:** 可用的 API 端點，回傳「Hello, World!」並帶監控

2. **[簡單網頁應用 - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   部署 Node.js Express 網頁應用並連接 MongoDB  
   **時間:** 25-35 分鐘 | **費用:** $10-30/月  
   **學到:** 資料庫整合、環境變數、連線字串管理  
   **預期成果:** 具備建立/讀取/更新/刪除功能的 Todo 清單應用

3. **[靜態網站 - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   以 Azure 靜態網站應用託管 React 單頁應用  
   **時間:** 20-30 分鐘 | **費用:** $0-10/月  
   **學到:** 靜態託管、無伺服器函式、CDN 部署  
   **預期成果:** React UI 搭配 API 後端，自動 SSL 且全球 CDN

### 中階使用者適用
4. **[Azure OpenAI Chat 應用](../../../examples/azure-openai-chat)**（本地）⭐⭐  
   部署 GPT-4 聊天介面，並管理安全 API 金鑰  
   **時間:** 35-45 分鐘 | **費用:** $50-200/月  
   **學到:** Azure OpenAI 部署、Key Vault 整合、令牌追蹤  
   **預期成果:** 可用的 GPT-4 聊天應用，並且能監控成本

5. **[Container App - 微服務](../../../examples/container-app/microservices)**（本地）⭐⭐⭐⭐  
   生產就緒的多服務架構  
   **時間:** 45-60 分鐘 | **費用:** $50-150/月  
   **學到:** 服務間通訊、訊息佇列、分散式追蹤  
   **預期成果:** 2 服務系統（API Gateway + 產品服務）並附監控

6. **[資料庫應用 - C# + Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   帶 C# API 和 Azure SQL 資料庫的網頁應用  
   **時間:** 30-45 分鐘 | **費用:** $20-80/月  
   **學到:** Entity Framework、資料庫遷移、連線安全  
   **預期成果:** C# API 搭配 Azure SQL 後端，自動佈署結構

7. **[無伺服器函式 - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions 支援 HTTP 觸發並有 Cosmos DB  
   **時間:** 30-40 分鐘 | **費用:** $10-40/月  
   **學到:** 事件驅動架構、無伺服器擴展、NoSQL 整合  
   **預期成果:** 函式應用能回應 HTTP 請求並操作 Cosmos DB

8. **[微服務 - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Java 多服務應用搭配 Container Apps 與 API Gateway  
   **時間:** 60-90 分鐘 | **費用:** $80-200/月  
   **學到:** Spring Boot 部署、服務網格、負載平衡  
   **預期成果:** 多服務 Java 系統，支援服務發現與路由

### Microsoft Foundry 模板

1. **[Azure OpenAI Chat App - 本地範例](../../../examples/azure-openai-chat)** ⭐⭐  
   完整 GPT-4 部署與聊天介面  
   **時間:** 35-45 分鐘 | **費用:** $50-200/月  
   **預期成果:** 可用的聊天應用，含令牌追蹤與成本監控

2. **[Azure Search + OpenAI 示範](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   智慧聊天應用，採用 RAG 架構  
   **時間:** 60-90 分鐘 | **費用:** $100-300/月  
   **預期成果:** RAG 支援的聊天介面，含文件搜尋與引證

3. **[AI 文件處理](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   使用 Azure AI 服務進行文件分析  
   **時間:** 40-60 分鐘 | **費用:** $20-80/月  
   **預期成果:** API 可從上傳文件擷取文字、表格與實體

4. **[機器學習流水線](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   基於 Azure Machine Learning 的 MLOps 工作流程  
   **時間:** 2-3 小時 | **費用:** $150-500/月  
   **預期成果:** 可自動化訓練、部署與監控的 ML 流水線

### 真實世界場景

#### **零售多代理解決方案** 🆕
**[完整實作指南](./retail-scenario.md)**

一套全面、適用於生產環境的多代理客戶支援解決方案，展示使用 AZD 部署企業級 AI 應用。此場景提供：

- **完整架構**：多代理系統，包含專責客戶服務及庫存管理代理
- **生產環境基礎架構**：多區域 Azure OpenAI 部署、AI 搜尋、Container Apps 及全面監控
- **即用 ARM 模板**：一鍵部署，提供多種配置模式（Minimal/Standard/Premium）
- **進階功能**：紅隊安全驗證、代理評估框架、成本優化及疑難排解指南
- **實際商業情境**：零售商客戶支援用例，包含檔案上傳、搜尋整合和動態擴展

**技術**：Azure OpenAI (GPT-4o, GPT-4o-mini)、Azure AI Search、Container Apps、Cosmos DB、Application Insights、Document Intelligence、Bing Search API

**複雜度**：⭐⭐⭐⭐（高階 - 企業級生產環境準備）

**適合對象**：AI 開發人員、解決方案架構師及建置生產多代理系統的團隊

**快速開始**：使用附帶的 ARM 模板，執行 `./deploy.sh -g myResourceGroup` 於 30 分鐘內部署完整方案

## 📋 使用說明

### 先決條件

執行任何範例之前：
- ✅ 具有擁有者或貢獻者角色的 Azure 訂閱
- ✅ 安裝 Azure Developer CLI ([安裝指南](../docs/chapter-01-foundation/installation.md))
- ✅ 運行 Docker Desktop（針對容器範例）
- ✅ 適當的 Azure 配額（請檢查範例特有需求）

> **💰 成本警告：** 所有範例均會建立實際 Azure 資源，會產生費用。請參閱各自 README 文件中的成本估算。完成後請執行 `azd down` 以避免持續產生費用。

### 本地執行範例

1. **複製或下載範例**
   ```bash
   # 導航到所需的範例
   cd examples/simple-web-app
   ```

2. **初始化 AZD 環境**
   ```bash
   # 使用現有模板初始化
   azd init
   
   # 或建立新環境
   azd env new my-environment
   ```

3. **配置環境**
   ```bash
   # 設定所需變數
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **部署**
   ```bash
   # 部署基礎設施及應用程式
   azd up
   ```

5. **驗證部署**
   ```bash
   # 獲取服務端點
   azd env get-values
   
   # 測試端點（範例）
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **預期成功指標：**
   - ✅ `azd up` 無錯誤完成
   - ✅ 服務端點回傳 HTTP 200
   - ✅ Azure 入口網站顯示「執行中」狀態
   - ✅ Application Insights 正收到遙測資料

> **⚠️ 有問題嗎？** 請參考 [常見問題](../docs/chapter-07-troubleshooting/common-issues.md) 排解部署問題

### 調整範例

每個範例包含：
- **README.md** - 詳細設定及自訂說明
- **azure.yaml** - AZD 配置並帶註解
- **infra/** - Bicep 模板及參數說明
- **src/** - 範例應用程式程式碼
- **scripts/** - 常用工具腳本

## 🎯 學習目標

### 範例分類

#### **基礎部署**
- 單一服務應用
- 簡單基礎架構模式
- 基本配置管理
- 成本效益開發環境

#### **進階情境**
- 多服務架構
- 複雜網路配置
- 資料庫整合模式
- 安全與合規實作

#### **生產就緒模式**
- 高可用配置
- 監控與可觀察性
- CI/CD 整合
- 災難復原架構

## 📖 範例說明

### 簡易網頁應用 - Node.js Express
**技術**：Node.js、Express、MongoDB、Container Apps  
**複雜度**：初學者  
**概念**：基礎部署、REST API、NoSQL 資料庫整合

### 靜態網站 - React SPA
**技術**：React、Azure Static Web Apps、Azure Functions、Cosmos DB  
**複雜度**：初學者  
**概念**：靜態托管、無伺服器後端、現代網站開發

### Container App - Python Flask
**技術**：Python Flask、Docker、Container Apps、容器註冊表、Application Insights  
**複雜度**：初學者  
**概念**：容器化、REST API、scale-to-zero、健康檢查、監控  
**位置**：[本地範例](../../../examples/container-app/simple-flask-api)

### Container App - 微服務架構
**技術**：Python、Node.js、C#、Go、Service Bus、Cosmos DB、Azure SQL、Container Apps  
**複雜度**：進階  
**概念**：多服務架構、服務通訊、消息佇列、分散式追蹤  
**位置**：[本地範例](../../../examples/container-app/microservices)

### 資料庫應用 - C# 與 Azure SQL
**技術**：C# ASP.NET Core、Azure SQL Database、App Service  
**複雜度**：中階  
**概念**：Entity Framework、資料庫連線、Web API 開發

### 無伺服器函數 - Python Azure Functions
**技術**：Python、Azure Functions、Cosmos DB、Static Web Apps  
**複雜度**：中階  
**概念**：事件驅動架構、無伺服器運算、全端開發

### 微服務 - Java Spring Boot
**技術**：Java Spring Boot、Container Apps、Service Bus、API Gateway  
**複雜度**：中階  
**概念**：微服務通信、分散式系統、企業模式

### Microsoft Foundry 範例

#### Azure OpenAI 聊天應用
**技術**：Azure OpenAI、Cognitive Search、App Service  
**複雜度**：中階  
**概念**：RAG 架構、向量搜尋、LLM 整合

#### AI 文件處理
**技術**：Azure AI Document Intelligence、儲存、Functions  
**複雜度**：中階  
**概念**：文件分析、OCR、資料擷取

#### 機器學習流程
**技術**：Azure ML、MLOps、容器註冊表  
**複雜度**：高階  
**概念**：模型訓練、部署流程、監控

## 🛠 配置範例

`configurations/` 目錄包含可重用元件：

### 環境配置
- 開發環境設定
- 預備環境配置
- 生產就緒配置
- 多區域部署設定

### Bicep 模組
- 可重用基礎架構元件
- 常見資源模式
- 強化安全模板
- 成本優化配置

### 助手腳本
- 環境設置自動化
- 資料庫遷移腳本
- 部署驗證工具
- 成本監控工具

## 🔧 自訂指南

### 為您的案例調整範例

1. **檢查先決條件**
   - 確認 Azure 服務需求
   - 驗證訂閱限制
   - 了解成本影響

2. **修改配置**
   - 更新 `azure.yaml` 服務定義
   - 自訂 Bicep 模板
   - 調整環境變數

3. **徹底測試**
   - 先部署到開發環境
   - 驗證功能
   - 測試擴展與效能

4. **安全審查**
   - 檢視存取控制
   - 實施祕密管理
   - 啟用監控與警示

## 📊 比較矩陣

| 範例 | 服務 | 資料庫 | 認證 | 監控 | 複雜度 |
|---------|----------|----------|------|------------|------------|
| **Azure OpenAI 聊天**（本地） | 2 | ❌ | Key Vault | 完整 | ⭐⭐ |
| **Python Flask API**（本地） | 1 | ❌ | 基本 | 完整 | ⭐ |
| **微服務**（本地） | 5+ | ✅ | 企業級 | 進階 | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | 基本 | 基本 | ⭐ |
| React SPA + Functions | 3 | ✅ | 基本 | 完整 | ⭐ |
| Python Flask Container | 2 | ❌ | 基本 | 完整 | ⭐ |
| C# Web API + SQL | 2 | ✅ | 完整 | 完整 | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | 完整 | 完整 | ⭐⭐ |
| Java 微服務 | 5+ | ✅ | 完整 | 完整 | ⭐⭐ |
| Azure OpenAI 聊天 | 3 | ✅ | 完整 | 完整 | ⭐⭐⭐ |
| AI 文件處理 | 2 | ❌ | 基本 | 完整 | ⭐⭐ |
| ML 流程 | 4+ | ✅ | 完整 | 完整 | ⭐⭐⭐⭐ |
| **零售多代理**（本地） | **8+** | **✅** | **企業級** | **進階** | **⭐⭐⭐⭐** |

## 🎓 學習路徑

### 推薦進度

1. **從簡易網頁應用開始**
   - 學習基本 AZD 概念
   - 了解部署工作流程
   - 練習環境管理

2. **嘗試靜態網站**
   - 探索不同托管選項
   - 了解 CDN 整合
   - 理解 DNS 配置

3. **進階到容器應用**
   - 學習容器化基礎
   - 了解擴展概念
   - 練習使用 Docker

4. **加入資料庫整合**
   - 學習資料庫佈署
   - 理解連線字串
   - 練習祕密管理

5. **探索無伺服器**
   - 理解事件驅動架構
   - 了解觸發器與綁定
   - 練習 APIs

6. **建構微服務**
   - 學習服務通訊
   - 了解分散式系統
   - 練習複雜部署

## 🔍 找到適合的範例

### 按技術棧劃分
- **Container Apps**： [Python Flask API（本地）](../../../examples/container-app/simple-flask-api)、[微服務（本地）](../../../examples/container-app/microservices)、Java 微服務
- **Node.js**： Node.js Express Todo App、[微服務 API Gateway（本地）](../../../examples/container-app/microservices)
- **Python**： [Python Flask API（本地）](../../../examples/container-app/simple-flask-api)、[微服務產品服務（本地）](../../../examples/container-app/microservices)、Python Functions + SPA
- **C#**： [微服務訂單服務（本地）](../../../examples/container-app/microservices)、C# Web API + SQL Database、Azure OpenAI 聊天應用、ML 流程
- **Go**： [微服務用戶服務（本地）](../../../examples/container-app/microservices)
- **Java**： Java Spring Boot 微服務
- **React**： React SPA + Functions
- **容器**： [Python Flask（本地）](../../../examples/container-app/simple-flask-api)、[微服務（本地）](../../../examples/container-app/microservices)、Java 微服務
- **資料庫**： [微服務（本地）](../../../examples/container-app/microservices)、Node.js + MongoDB、C# + Azure SQL、Python + Cosmos DB
- **AI/ML**： **[Azure OpenAI 聊天（本地）](../../../examples/azure-openai-chat)**、Azure OpenAI 聊天應用、AI 文件處理、ML 流程、**零售多代理方案**
- **多代理系統**： **零售多代理方案**
- **OpenAI 整合**： **[Azure OpenAI 聊天（本地）](../../../examples/azure-openai-chat)**、零售多代理方案
- **企業生產環境**： [微服務（本地）](../../../examples/container-app/microservices)、**零售多代理方案**

### 按架構模式劃分
- **簡易 REST API**： [Python Flask API（本地）](../../../examples/container-app/simple-flask-api)
- **單體式**： Node.js Express Todo、C# Web API + SQL
- **靜態 + Serverless**： React SPA + Functions、Python Functions + SPA
- **微服務**： [生產微服務（本地）](../../../examples/container-app/microservices)、Java Spring Boot 微服務
- **容器化**： [Python Flask（本地）](../../../examples/container-app/simple-flask-api)、[微服務（本地）](../../../examples/container-app/microservices)
- **AI 驅動**： **[Azure OpenAI 聊天（本地）](../../../examples/azure-openai-chat)**、Azure OpenAI 聊天應用、AI 文件處理、ML 流程、**零售多代理方案**
- **多代理架構**： **零售多代理方案**
- **企業多服務**： [微服務（本地）](../../../examples/container-app/microservices)、**零售多代理方案**

### 按複雜度級別劃分
- **初學者**： [Python Flask API（本地）](../../../examples/container-app/simple-flask-api)、Node.js Express Todo、React SPA + Functions
- **中階**： **[Azure OpenAI 聊天（本地）](../../../examples/azure-openai-chat)**、C# Web API + SQL、Python Functions + SPA、Java 微服務、Azure OpenAI 聊天應用、AI 文件處理
- **高階**： ML 流程
- **企業生產環境就緒**： [微服務（本地）](../../../examples/container-app/microservices)（多服務含佇列消息）、**零售多代理方案**（完整多代理系統含 ARM 模板部署）

## 📚 附加資源

### 文件連結
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep 文件](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure 架構中心](https://learn.microsoft.com/en-us/azure/architecture/)

### 社群範例
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [C# 與 Azure SQL Todo App](https://github.com/Azure-Samples/todo-csharp-sql)
- [Python 與 MongoDB Todo App](https://github.com/Azure-Samples/todo-python-mongo)
- [使用 Node.js 和 PostgreSQL 的待辦事項應用程式](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [搭配 C# API 的 React 網頁應用程式](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps 工作](https://github.com/Azure-Samples/container-apps-jobs)
- [使用 Java 的 Azure Functions](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### 最佳實務
- [Azure 良好架構框架](https://learn.microsoft.com/en-us/azure/well-architected/)
- [雲端採用框架](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 貢獻範例

有有用的範例想分享？歡迎您貢獻！

### 提交指南
1. 遵循既定的目錄結構
2. 包含完整的 README.md
3. 為設定檔添加註解
4. 提交前徹底測試
5. 包含費用估算和先決條件

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

**專業提示**：從符合您技術堆疊的最簡單範例開始，逐步挑戰更複雜的場景。每個範例都建立在前一個的概念上！

## 🚀 準備開始了嗎？

### 您的學習路徑

1. **完全初學者？** → 從 [Flask API](../../../examples/container-app/simple-flask-api) 開始 (⭐，20 分鐘)
2. **具備基本 AZD 知識？** → 嘗試 [微服務](../../../examples/container-app/microservices) (⭐⭐⭐⭐，60 分鐘)
3. **構建 AI 應用？** → 從 [Azure OpenAI Chat](../../../examples/azure-openai-chat) 開始 (⭐⭐，35 分鐘) 或探索 [零售多代理](retail-scenario.md) (⭐⭐⭐⭐，2 小時以上)
4. **需要特定技術堆疊？** → 使用上方的 [尋找合適範例](../../../examples) 區段

### 下一步

- ✅ 檢視以上的 [先決條件](../../../examples)
- ✅ 選擇符合您技能等級的範例（見 [複雜度說明](../../../examples)）
- ✅ 徹底閱讀範例的 README 後再部署
- ✅ 測試後設定提醒執行 `azd down`
- ✅ 透過 GitHub Issues 或 Discussions 分享您的經驗

### 需要幫助？

- 📖 [常見問題](../resources/faq.md) - 常見問題解答
- 🐛 [疑難排解指南](../docs/chapter-07-troubleshooting/common-issues.md) - 解決部署問題
- 💬 [GitHub 討論區](https://github.com/microsoft/AZD-for-beginners/discussions) - 問問社群
- 📚 [學習指南](../resources/study-guide.md) - 強化您的學習

---

**導航**
- **📚 課程首頁**：[AZD For Beginners](../README.md)
- **📖 學習資料**：[學習指南](../resources/study-guide.md) | [速查表](../resources/cheat-sheet.md) | [術語表](../resources/glossary.md)
- **🔧 資源**：[常見問題](../resources/faq.md) | [疑難排解](../docs/chapter-07-troubleshooting/common-issues.md)

---

*最後更新：2025 年 11 月 | [回報問題](https://github.com/microsoft/AZD-for-beginners/issues) | [貢獻範例](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件是使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們力求準確，但請注意自動翻譯可能包含錯誤或不準確之處。原始語言的文件應視為具權威性之資料來源。對於重要資訊，建議採用專業人工翻譯。我們不對因使用本翻譯而引致的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->