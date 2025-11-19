<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "8875403d56140e04c0524bed9b788f7a",
  "translation_date": "2025-11-19T10:08:58+00:00",
  "source_file": "examples/README.md",
  "language_code": "tw"
}
-->
# 範例 - 實用的 AZD 範本與配置

**透過範例學習 - 按章節組織**
- **📚 課程首頁**：[AZD 初學者指南](../README.md)
- **📖 章節對應**：範例依學習難度分類
- **🚀 本地範例**：[零售多代理解決方案](retail-scenario.md)
- **🤖 外部 AI 範例**：連結至 Azure Samples 資源庫

> **📍 重要：本地範例與外部範例的區別**  
> 本資源庫包含 **1 個完整的本地範例**（零售多代理）並提供完整實作。  
> 其他範例為 **外部參考**，連結至 Azure-Samples 資源庫，您可以自行克隆。

## 簡介

此目錄提供實用範例與參考資源，幫助您透過實作練習學習 Azure Developer CLI。本資源庫內的零售多代理場景是一個完整的、可投入生產的實作範例。其他範例則引用官方 Azure Samples，展示各種 AZD 模式。

## 🎯 本資源庫的內容

### ✅ 本地實作（可直接使用）

#### [零售多代理解決方案](retail-scenario.md) 🆕  
**本資源庫內含完整的生產級實作**

- **位置**：`examples/retail-multiagent-arm-template/`
- **難度**：⭐⭐⭐⭐（進階）
- **包含內容**：
  - 完整的 ARM 部署範本
  - 多代理架構（客戶 + 庫存）
  - Azure OpenAI 整合
  - 使用 RAG 的 AI 搜索
  - 全面監控
  - 一鍵部署腳本

**快速開始：**  
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```
  
**技術**：Azure OpenAI、AI 搜索、Container Apps、Cosmos DB、Application Insights

---

## 🔗 外部 Azure 範例（需克隆使用）

以下範例由官方 Azure-Samples 資源庫維護。克隆後可探索不同的 AZD 模式：

### 簡單應用程式（章節 1-2）

| 範本 | 資源庫 | 難度 | 服務 |
|:-----|:-------|:-----|:-----|
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express、Cosmos DB、Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | 靜態網頁應用、Functions、SQL |
| **Python Flask 容器** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python、Container Apps、API |

**使用方式：**  
```bash
# Clone any example
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Deploy
azd up
```
  

### AI 應用範例（章節 2、5、8）

| 範本 | 資源庫 | 難度 | 重點 |
|:-----|:-------|:-----|:-----|
| **AI 聊天快速入門** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | 基本 AI 聊天 |
| **AI 代理** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | 代理框架 |
| **搜索 + OpenAI 範例** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG 模式 |
| **Contoso 聊天** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | 企業級 AI |

### 資料庫與進階模式（章節 3-8）

| 範本 | 資源庫 | 難度 | 重點 |
|:-----|:-------|:-----|:-----|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | 資料庫整合 |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | 無伺服器 NoSQL |
| **Java 微服務** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | 多服務 |
| **ML 管道** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## 學習目標

透過這些範例，您將能夠：
- 使用真實應用場景練習 Azure Developer CLI 工作流程
- 理解不同應用架構及其 AZD 實作
- 掌握各種 Azure 服務的基礎架構即程式碼模式
- 應用配置管理與環境特定部署策略
- 在實際情境中實作監控、安全性與擴展模式
- 累積處理與排除部署問題的經驗

## 學習成果

完成這些範例後，您將能夠：
- 自信地使用 Azure Developer CLI 部署各種應用程式
- 將提供的範本調整為符合您應用需求
- 使用 Bicep 設計並實作自訂基礎架構模式
- 配置具有正確依賴關係的複雜多服務應用程式
- 在實際場景中應用安全性、監控與效能最佳實踐
- 根據實作經驗排除故障並優化部署

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

### 適合初學者
1. **[簡單網頁應用 - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - 部署一個使用 MongoDB 的 Node.js Express 網頁應用
2. **[靜態網站 - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - 使用 Azure 靜態網頁應用託管 React 靜態網站
3. **[容器應用 - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - 部署容器化的 Python Flask 應用程式

### 適合中級使用者
4. **[資料庫應用 - C# 與 Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - 使用 C# API 和 Azure SQL 資料庫的網頁應用
5. **[無伺服器函數 - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - 使用 HTTP 觸發器和 Cosmos DB 的 Python Azure Functions
6. **[微服務 - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - 使用 Container Apps 和 API Gateway 的多服務 Java 應用

### Azure AI Foundry 範本

1. **[Azure OpenAI 聊天應用](https://github.com/Azure-Samples/azure-search-openai-demo)** - 使用 Azure OpenAI 的智能聊天應用
2. **[AI 文件處理](https://github.com/Azure-Samples/azure-ai-document-processing)** - 使用 Azure AI 服務進行文件分析
3. **[機器學習管道](https://github.com/Azure-Samples/mlops-v2)** - 使用 Azure 機器學習的 MLOps 工作流程

### 真實場景

#### **零售多代理解決方案** 🆕  
**[完整實作指南](./retail-scenario.md)**  

一個全面的、生產級的多代理客戶支持解決方案，展示了使用 AZD 部署企業級 AI 應用的能力。此場景提供：

- **完整架構**：多代理系統，包含專業的客戶服務與庫存管理代理
- **生產基礎架構**：多區域 Azure OpenAI 部署、AI 搜索、Container Apps 和全面監控
- **可直接部署的 ARM 範本**：一鍵部署，提供多種配置模式（基本/標準/高級）
- **進階功能**：紅隊安全驗證、代理評估框架、成本優化與故障排除指南
- **真實商業情境**：零售商客戶支持案例，包含文件上傳、搜索整合與動態擴展

**技術**：Azure OpenAI（GPT-4o、GPT-4o-mini）、Azure AI 搜索、Container Apps、Cosmos DB、Application Insights、文件智能、Bing 搜索 API  

**難度**：⭐⭐⭐⭐（進階 - 企業級生產準備）  

**適合對象**：AI 開發者、解決方案架構師及構建生產多代理系統的團隊  

**快速開始**：使用內建的 ARM 範本，透過 `./deploy.sh -g myResourceGroup` 在 30 分鐘內部署完整解決方案  

## 📋 使用說明

### 本地執行範例

1. **克隆或複製範例**  
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```
  
2. **初始化 AZD 環境**  
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```
  
3. **配置環境**  
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```
  
4. **部署**  
   ```bash
   # Deploy infrastructure and application
   azd up
   ```
  

### 調整範例

每個範例包含：
- **README.md** - 詳細的設置與自訂說明
- **azure.yaml** - 帶有註解的 AZD 配置
- **infra/** - 含參數說明的 Bicep 範本
- **src/** - 範例應用程式代碼
- **scripts/** - 常用任務的輔助腳本

## 🎯 學習目標

### 範例分類

#### **基礎部署**
- 單一服務應用
- 簡單基礎架構模式
- 基本配置管理
- 成本效益高的開發設置

#### **進階場景**
- 多服務架構
- 複雜的網路配置
- 資料庫整合模式
- 安全性與合規性實作

#### **生產級模式**
- 高可用性配置
- 監控與可觀察性
- CI/CD 整合
- 災難復原設置

## 📖 範例描述

### 簡單網頁應用 - Node.js Express
**技術**：Node.js、Express、MongoDB、Container Apps  
**難度**：初學者  
**概念**：基礎部署、REST API、NoSQL 資料庫整合

### 靜態網站 - React SPA
**技術**：React、Azure 靜態網頁應用、Azure Functions、Cosmos DB  
**難度**：初學者  
**概念**：靜態託管、無伺服器後端、現代網頁開發

### 容器應用 - Python Flask
**技術**：Python Flask、Docker、Container Apps、Container Registry  
**難度**：初學者  
**概念**：容器化、微服務架構、API 開發

### 資料庫應用 - C# 與 Azure SQL
**技術**：C# ASP.NET Core、Azure SQL 資料庫、App Service  
**難度**：中級  
**概念**：Entity Framework、資料庫連接、網頁 API 開發

### 無伺服器函數 - Python Azure Functions
**技術**：Python、Azure Functions、Cosmos DB、靜態網頁應用  
**難度**：中級  
**概念**：事件驅動架構、無伺服器計算、全端開發

### 微服務 - Java Spring Boot
**技術**：Java Spring Boot、Container Apps、Service Bus、API Gateway  
**難度**：中級  
**概念**：微服務通訊、分散式系統、企業模式

### Azure AI Foundry 範例

#### Azure OpenAI 聊天應用
**技術**：Azure OpenAI、Cognitive Search、App Service  
**難度**：中級  
**概念**：RAG 架構、向量搜索、LLM 整合

#### AI 文件處理
**技術**：Azure AI 文件智能、儲存、Functions  
**難度**：中級  
**概念**：文件分析、OCR、數據提取

#### 機器學習管道
**技術**：Azure ML、MLOps、Container Registry  
**難度**：進階  
**概念**：模型訓練、部署管道、監控

## 🛠 配置範例

`configurations/` 目錄包含可重用的組件：

### 環境配置
- 開發環境設置
- 測試環境配置
- 生產級配置
- 多區域部署設置

### Bicep 模組
- 可重用的基礎架構組件
- 常見資源模式
- 強化安全性的範本
- 成本優化配置

### 輔助腳本
- 環境設置自動化
- 資料庫遷移腳本
- 部署驗證工具
- 成本監控工具

## 🔧 自訂指南

### 調整範例以符合您的需求

1. **檢查先決條件**
   - 確認 Azure 服務需求
   - 驗證訂閱限制
   - 瞭解成本影響

2. **修改配置**
   - 更新 `azure.yaml` 服務定義
   - 自訂 Bicep 範本
   - 調整環境變數

3. **徹底測試**
   - 先部署至開發環境
   - 驗證功能
   - 測試擴展性與效能

4. **安全性檢查**
   - 檢查存取控制
   - 實作機密管理
   - 啟用監控與警報

## 📊 比較矩陣

| 範例 | 服務 | 資料庫 | 認證 | 監控 | 難度 |
|------|------|--------|------|------|------|
| Node.js Express Todo | 2 | ✅ | 基本 | 基本 | ⭐ |
| React SPA + Functions | 3 | ✅ | 基本 | 完整 | ⭐ |
| Python Flask 容器 | 2 | ❌ | 基本 | 完整 | ⭐ |
| C# Web API + SQL | 2 | ✅ | 完整 | 完整 | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | 完整 | 完整 | ⭐⭐ |
| Java 微服務 | 5+ | ✅ | 完整 | 完整 | ⭐⭐ |
| Azure OpenAI 聊天 | 3 | ✅ | 完整 | 完整 | ⭐⭐⭐ |
| AI 文件處理 | 2 | ❌ | 基本 | 完整 | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | 完整 | 完整 | ⭐⭐⭐⭐ |
| **零售多代理系統** | **8+** | **✅** | **企業級** | **進階** | **⭐⭐⭐⭐** |

## 🎓 學習路徑

### 建議進度

1. **從簡單的 Web 應用程式開始**
   - 學習基本的 AZD 概念
   - 了解部署流程
   - 練習環境管理

2. **嘗試靜態網站**
   - 探索不同的主機選項
   - 學習 CDN 整合
   - 了解 DNS 配置

3. **進階到容器應用程式**
   - 學習容器化的基礎知識
   - 了解擴展概念
   - 使用 Docker 練習

4. **加入資料庫整合**
   - 學習資料庫佈建
   - 了解連接字串
   - 練習秘密管理

5. **探索無伺服器架構**
   - 了解事件驅動架構
   - 學習觸發器和綁定
   - 練習使用 API

6. **建立微服務**
   - 學習服務間的通訊
   - 了解分散式系統
   - 練習複雜的部署

## 🔍 尋找合適的範例

### 根據技術堆疊
- **Node.js**: Node.js Express Todo App
- **Python**: Python Flask Container App, Python Functions + SPA
- **C#**: C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **容器**: Python Flask Container App, Java Microservices
- **資料庫**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **零售多代理系統**
- **多代理系統**: **零售多代理系統**
- **企業級生產環境**: **零售多代理系統**

### 根據架構模式
- **單體架構**: Node.js Express Todo, C# Web API + SQL
- **靜態 + 無伺服器**: React SPA + Functions, Python Functions + SPA
- **微服務**: Java Spring Boot Microservices
- **容器化**: Python Flask Container App
- **AI 驅動**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **零售多代理系統**
- **多代理架構**: **零售多代理系統**
- **企業級多服務**: **零售多代理系統**

### 根據複雜程度
- **初學者**: Node.js Express Todo, React SPA + Functions, Python Flask Container App
- **中階**: C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **進階**: ML Pipeline
- **企業級生產環境**: **零售多代理系統**（完整的多代理系統，包含 ARM 模板部署）

## 📚 其他資源

### 文件連結
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep 文件](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure 架構中心](https://learn.microsoft.com/en-us/azure/architecture/)

### 社群範例
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App with Node.js and PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web App with C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions with Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### 最佳實踐
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 貢獻範例

有有用的範例想分享嗎？我們歡迎您的貢獻！

### 提交指南
1. 遵循既定的目錄結構
2. 包含完整的 README.md
3. 在配置文件中添加註解
4. 在提交前進行充分測試
5. 包含成本估算和前置條件

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

**專業提示**：從最簡單的範例開始，選擇符合您技術堆疊的範例，然後逐步進階到更複雜的情境。每個範例都建立在前一個範例的概念之上！

**下一步**：
- 選擇符合您技能等級的範例
- 按照範例 README 中的設置指示進行操作
- 嘗試進行自訂
- 與社群分享您的學習成果

---

**導航**
- **上一課**：[學習指南](../resources/study-guide.md)
- **返回**：[主 README](../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們致力於提供準確的翻譯，但請注意，機器翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議使用專業人工翻譯。我們對因使用此翻譯而引起的任何誤解或錯誤解釋不承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->