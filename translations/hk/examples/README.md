<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e45896a8acbafead1f195788780a4ab7",
  "translation_date": "2025-09-10T16:01:04+00:00",
  "source_file": "examples/README.md",
  "language_code": "hk"
}
-->
# 範例 - 實用的 AZD 模板及配置

## 簡介

此目錄包含實用範例、模板及真實場景，幫助您通過實際操作學習 Azure Developer CLI。每個範例提供完整的工作代碼、基礎設施模板及詳細指引，涵蓋不同的應用架構及部署模式。

## 學習目標

通過這些範例，您將能：
- 在真實應用場景中練習 Azure Developer CLI 的工作流程
- 理解不同應用架構及其 AZD 實現方式
- 掌握針對各種 Azure 服務的基礎設施即代碼模式
- 應用配置管理及針對環境的部署策略
- 在實際情境中實現監控、安全及擴展模式
- 累積排查及調試真實部署場景的經驗

## 學習成果

完成這些範例後，您將能：
- 自信地使用 Azure Developer CLI 部署各類型應用
- 根據自己的應用需求調整提供的模板
- 使用 Bicep 設計及實現自定義基礎設施模式
- 配置具有正確依賴關係的複雜多服務應用
- 在真實場景中應用安全、監控及性能最佳實踐
- 根據實際經驗排查及優化部署

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

## 快速入門範例

### 初學者
1. **[簡單網頁應用 - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - 部署一個使用 MongoDB 的 Node.js Express 網頁應用
2. **[靜態網站 - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - 使用 Azure 靜態網頁應用托管 React 靜態網站
3. **[容器應用 - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - 部署容器化的 Python Flask 應用

### 中級使用者
4. **[數據庫應用 - C# 與 Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - 使用 C# API 和 Azure SQL 數據庫的網頁應用
5. **[無伺服器函數 - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - 使用 HTTP 觸發器和 Cosmos DB 的 Python Azure Functions
6. **[微服務 - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - 使用容器應用和 API 閘道的多服務 Java 應用

### Azure AI Foundry 模板

1. **[Azure OpenAI 聊天應用](https://github.com/Azure-Samples/azure-search-openai-demo)** - 使用 Azure OpenAI 的智能聊天應用
2. **[AI 文檔處理](https://github.com/Azure-Samples/azure-ai-document-processing)** - 使用 Azure AI 服務進行文檔分析
3. **[機器學習管道](https://github.com/Azure-Samples/mlops-v2)** - 使用 Azure 機器學習的 MLOps 工作流程

## 📋 使用指引

### 本地運行範例

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

每個範例包括：
- **README.md** - 詳細的設置及自定義指引
- **azure.yaml** - 帶有註解的 AZD 配置
- **infra/** - 帶有參數說明的 Bicep 模板
- **src/** - 範例應用代碼
- **scripts/** - 常用任務的輔助腳本

## 🎯 學習目標

### 範例分類

#### **基礎部署**
- 單服務應用
- 簡單基礎設施模式
- 基礎配置管理
- 成本效益高的開發設置

#### **進階場景**
- 多服務架構
- 複雜的網絡配置
- 數據庫集成模式
- 安全及合規實現

#### **生產級模式**
- 高可用性配置
- 監控及可觀察性
- CI/CD 集成
- 災難恢復設置

## 📖 範例描述

### 簡單網頁應用 - Node.js Express
**技術**: Node.js, Express, MongoDB, 容器應用  
**複雜度**: 初學者  
**概念**: 基礎部署、REST API、NoSQL 數據庫集成

### 靜態網站 - React SPA
**技術**: React, Azure 靜態網頁應用, Azure Functions, Cosmos DB  
**複雜度**: 初學者  
**概念**: 靜態托管、無伺服器後端、現代網頁開發

### 容器應用 - Python Flask
**技術**: Python Flask, Docker, 容器應用, 容器註冊表  
**複雜度**: 初學者  
**概念**: 容器化、微服務架構、API 開發

### 數據庫應用 - C# 與 Azure SQL
**技術**: C# ASP.NET Core, Azure SQL 數據庫, 應用服務  
**複雜度**: 中級  
**概念**: Entity Framework、數據庫連接、網頁 API 開發

### 無伺服器函數 - Python Azure Functions
**技術**: Python, Azure Functions, Cosmos DB, 靜態網頁應用  
**複雜度**: 中級  
**概念**: 事件驅動架構、無伺服器計算、全棧開發

### 微服務 - Java Spring Boot
**技術**: Java Spring Boot, 容器應用, 服務總線, API 閘道  
**複雜度**: 中級  
**概念**: 微服務通信、分佈式系統、企業模式

### Azure AI Foundry 範例

#### Azure OpenAI 聊天應用
**技術**: Azure OpenAI, 認知搜索, 應用服務  
**複雜度**: 中級  
**概念**: RAG 架構、向量搜索、大型語言模型集成

#### AI 文檔處理
**技術**: Azure AI 文檔智能, 存儲, 函數  
**複雜度**: 中級  
**概念**: 文檔分析、OCR、數據提取

#### 機器學習管道
**技術**: Azure ML, MLOps, 容器註冊表  
**複雜度**: 高級  
**概念**: 模型訓練、部署管道、監控

## 🛠 配置範例

`configurations/` 目錄包含可重用的組件：

### 環境配置
- 開發環境設置
- 測試環境配置
- 生產級配置
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

### 調整範例以適應您的需求

1. **檢查先決條件**
   - 確認 Azure 服務需求
   - 驗證訂閱限制
   - 理解成本影響

2. **修改配置**
   - 更新 `azure.yaml` 服務定義
   - 自定義 Bicep 模板
   - 調整環境變數

3. **徹底測試**
   - 首先部署到開發環境
   - 驗證功能
   - 測試擴展性及性能

4. **安全審查**
   - 檢查訪問控制
   - 實現秘密管理
   - 啟用監控及警報

## 📊 比較矩陣

| 範例 | 服務 | 數據庫 | 認證 | 監控 | 複雜度 |
|------|------|--------|------|------|--------|
| Node.js Express Todo | 2 | ✅ | 基礎 | 基礎 | ⭐ |
| React SPA + Functions | 3 | ✅ | 基礎 | 完整 | ⭐ |
| Python Flask Container | 2 | ❌ | 基礎 | 完整 | ⭐ |
| C# Web API + SQL | 2 | ✅ | 完整 | 完整 | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | 完整 | 完整 | ⭐⭐ |
| Java Microservices | 5+ | ✅ | 完整 | 完整 | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | 完整 | 完整 | ⭐⭐⭐ |
| AI 文檔處理 | 2 | ❌ | 基礎 | 完整 | ⭐⭐ |
| ML 管道 | 4+ | ✅ | 完整 | 完整 | ⭐⭐⭐⭐ |

## 🎓 學習路徑

### 推薦進度

1. **從簡單網頁應用開始**
   - 學習基礎 AZD 概念
   - 理解部署工作流程
   - 練習環境管理

2. **嘗試靜態網站**
   - 探索不同的托管選項
   - 學習 CDN 集成
   - 理解 DNS 配置

3. **進入容器應用**
   - 學習容器化基礎
   - 理解擴展概念
   - 練習使用 Docker

4. **添加數據庫集成**
   - 學習數據庫配置
   - 理解連接字符串
   - 練習秘密管理

5. **探索無伺服器架構**
   - 理解事件驅動架構
   - 學習觸發器及綁定
   - 練習 API 開發

6. **構建微服務**
   - 學習服務通信
   - 理解分佈式系統
   - 練習複雜部署

## 🔍 找到合適的範例

### 按技術堆疊
- **Node.js**: Node.js Express Todo 應用
- **Python**: Python Flask 容器應用, Python Functions + SPA
- **C#**: C# Web API + SQL 數據庫, Azure OpenAI 聊天應用, ML 管道
- **Java**: Java Spring Boot 微服務
- **React**: React SPA + Functions
- **容器**: Python Flask 容器應用, Java 微服務
- **數據庫**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: Azure OpenAI 聊天應用, AI 文檔處理, ML 管道

### 按架構模式
- **單體架構**: Node.js Express Todo, C# Web API + SQL
- **靜態 + 無伺服器**: React SPA + Functions, Python Functions + SPA
- **微服務**: Java Spring Boot 微服務
- **容器化**: Python Flask 容器應用
- **AI 驅動**: Azure OpenAI 聊天應用, AI 文檔處理, ML 管道

### 按複雜度級別
- **初學者**: Node.js Express Todo, React SPA + Functions, Python Flask 容器應用
- **中級**: C# Web API + SQL, Python Functions + SPA, Java 微服務, Azure OpenAI 聊天應用, AI 文檔處理
- **高級**: ML 管道

## 📚 其他資源

### 文件連結
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Azure AI Foundry AZD 模板](https://github.com/Azure/ai-foundry-templates)
- [Bicep 文件](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure 架構中心](https://learn.microsoft.com/en-us/azure/architecture/)

### 社群範例
- [Azure 範例 AZD 模板](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry 模板](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI 資源庫](https://azure.github.io/awesome-azd/)
- [使用 C# 和 Azure SQL 的 Todo 應用](https://github.com/Azure-Samples/todo-csharp-sql)
- [使用 Python 和 MongoDB 的 Todo 應用](https://github.com/Azure-Samples/todo-python-mongo)
- [使用 Node.js 和 PostgreSQL 的 Todo 應用](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [使用 C# API 的 React 網頁應用](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure 容器應用任務](https://github.com/Azure-Samples/container-apps-jobs)
- [使用 Java 的 Azure Functions](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### 最佳實踐
- [Azure 良好架構框架](https://learn.microsoft.com/en-us/azure/well-architected/)
- [雲採用框架](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 範例貢獻

有有用的範例想分享嗎？我們歡迎您的貢獻！

### 提交指南
1. 遵循既定的目錄結構
2. 包含全面的 README.md
3. 在配置文件中添加註解
4. 在提交前徹底測試
5. 包括成本估算及先決條件

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

**提示**: 從最簡單的範例開始，選擇符合您技術堆疊的範例，然後逐步進階到更複雜的場景。每個範例都基於前一個範例的概念進行構建！

**下一步**: 
- 選擇符合您技能水平的範例
- 按範例 README 中的設置指引操作
- 嘗試自定義
- 與社群分享您的學習成果

---

**導航**
- **上一課**: [學習指南](../resources/study-guide.md)
- **返回**: [主 README](../README.md)

---

**免責聲明**：  
本文件已使用人工智能翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們致力於提供準確的翻譯，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要信息，建議使用專業人工翻譯。我們對因使用此翻譯而引起的任何誤解或錯誤解釋概不負責。