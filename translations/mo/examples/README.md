<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "0fd083f39ef5508994526bb18e9fcd78",
  "translation_date": "2025-09-17T19:01:34+00:00",
  "source_file": "examples/README.md",
  "language_code": "mo"
}
-->
# 範例 - 實用的 AZD 範本與配置

**透過範例學習 - 按章節整理**
- **📚 課程首頁**: [AZD 初學者指南](../README.md)
- **📖 章節對應**: 範例按學習難度分類
- **🚀 從簡單開始**: [第一章範例](../../../examples)
- **🤖 AI 範例**: [第二章與第五章 AI 解決方案](../../../examples)

## 簡介

此目錄包含實用範例、範本及真實場景，幫助您透過實際操作學習 Azure Developer CLI。每個範例提供完整的工作代碼、基礎架構範本，以及針對不同應用架構和部署模式的詳細指導。

## 學習目標

透過這些範例，您將能：
- 在真實應用場景中練習 Azure Developer CLI 的工作流程
- 理解不同應用架構及其 AZD 實現方式
- 掌握各種 Azure 服務的基礎架構即代碼模式
- 應用配置管理及針對環境的部署策略
- 在實際情境中實現監控、安全性及擴展模式
- 累積排錯及調試真實部署場景的經驗

## 學習成果

完成這些範例後，您將能：
- 自信地使用 Azure Developer CLI 部署各類型應用
- 根據自己的應用需求調整提供的範本
- 設計並實現使用 Bicep 的自定義基礎架構模式
- 配置具有正確依賴關係的複雜多服務應用
- 在真實場景中應用安全性、監控及性能最佳實踐
- 根據實際經驗排除故障並優化部署

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
1. **[簡單網頁應用 - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - 部署使用 MongoDB 的 Node.js Express 網頁應用
2. **[靜態網站 - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - 使用 Azure 靜態網站托管 React 靜態網站
3. **[容器應用 - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - 部署容器化的 Python Flask 應用

### 中級使用者
4. **[資料庫應用 - C# 與 Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - 使用 C# API 和 Azure SQL 資料庫的網頁應用
5. **[無伺服器函數 - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - 使用 HTTP 觸發器和 Cosmos DB 的 Python Azure Functions
6. **[微服務 - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - 使用容器應用和 API 閘道的多服務 Java 應用

### Azure AI Foundry 範本

1. **[Azure OpenAI 聊天應用](https://github.com/Azure-Samples/azure-search-openai-demo)** - 使用 Azure OpenAI 的智能聊天應用
2. **[AI 文件處理](https://github.com/Azure-Samples/azure-ai-document-processing)** - 使用 Azure AI 服務進行文件分析
3. **[機器學習管道](https://github.com/Azure-Samples/mlops-v2)** - 使用 Azure 機器學習的 MLOps 工作流程

### 真實場景

#### **零售多代理解決方案** 🆕
**[完整實現指南](./retail-scenario.md)**

一個全面的、可投入生產的多代理客戶支持解決方案，展示了使用 AZD 部署企業級 AI 應用的能力。此場景提供：

- **完整架構**: 包含專業化客戶服務及庫存管理代理的多代理系統
- **生產基礎架構**: 多區域 Azure OpenAI 部署、AI 搜索、容器應用及全面監控
- **即用型 ARM 範本**: 一鍵部署，提供多種配置模式（簡約/標準/高級）
- **高級功能**: 紅隊安全驗證、代理評估框架、成本優化及故障排除指南
- **真實業務背景**: 零售商客戶支持用例，包含文件上傳、搜索整合及動態擴展

**技術**: Azure OpenAI (GPT-4o, GPT-4o-mini)、Azure AI 搜索、容器應用、Cosmos DB、應用洞察、文件智能、Bing 搜索 API

**複雜度**: ⭐⭐⭐⭐（高級 - 企業生產就緒）

**適合對象**: AI 開發者、解決方案架構師及構建生產多代理系統的團隊

**快速入門**: 使用包含的 ARM 範本，30 分鐘內部署完整解決方案，執行 `./deploy.sh -g myResourceGroup`

## 📋 使用說明

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

每個範例包含：
- **README.md** - 詳細的設置及自定義指導
- **azure.yaml** - 帶有註解的 AZD 配置
- **infra/** - 帶有參數說明的 Bicep 範本
- **src/** - 範例應用代碼
- **scripts/** - 常用任務的輔助腳本

## 🎯 學習目標

### 範例分類

#### **基礎部署**
- 單一服務應用
- 簡單基礎架構模式
- 基本配置管理
- 成本效益高的開發設置

#### **高級場景**
- 多服務架構
- 複雜的網絡配置
- 資料庫整合模式
- 安全性及合規性實現

#### **生產就緒模式**
- 高可用性配置
- 監控及可觀察性
- CI/CD 整合
- 災難恢復設置

## 📖 範例描述

### 簡單網頁應用 - Node.js Express
**技術**: Node.js、Express、MongoDB、容器應用  
**複雜度**: 初學者  
**概念**: 基本部署、REST API、NoSQL 資料庫整合

### 靜態網站 - React SPA
**技術**: React、Azure 靜態網站、Azure Functions、Cosmos DB  
**複雜度**: 初學者  
**概念**: 靜態托管、無伺服器後端、現代網頁開發

### 容器應用 - Python Flask
**技術**: Python Flask、Docker、容器應用、容器註冊表  
**複雜度**: 初學者  
**概念**: 容器化、微服務架構、API 開發

### 資料庫應用 - C# 與 Azure SQL
**技術**: C# ASP.NET Core、Azure SQL 資料庫、應用服務  
**複雜度**: 中級  
**概念**: Entity Framework、資料庫連接、網頁 API 開發

### 無伺服器函數 - Python Azure Functions
**技術**: Python、Azure Functions、Cosmos DB、靜態網站  
**複雜度**: 中級  
**概念**: 事件驅動架構、無伺服器計算、全端開發

### 微服務 - Java Spring Boot
**技術**: Java Spring Boot、容器應用、服務匯流排、API 閘道  
**複雜度**: 中級  
**概念**: 微服務通信、分布式系統、企業模式

### Azure AI Foundry 範例

#### Azure OpenAI 聊天應用
**技術**: Azure OpenAI、認知搜索、應用服務  
**複雜度**: 中級  
**概念**: RAG 架構、向量搜索、LLM 整合

#### AI 文件處理
**技術**: Azure AI 文件智能、存儲、函數  
**複雜度**: 中級  
**概念**: 文件分析、OCR、數據提取

#### 機器學習管道
**技術**: Azure ML、MLOps、容器註冊表  
**複雜度**: 高級  
**概念**: 模型訓練、部署管道、監控

## 🛠 配置範例

`configurations/` 目錄包含可重用的組件：

### 環境配置
- 開發環境設置
- 測試環境配置
- 生產就緒配置
- 多區域部署設置

### Bicep 模組
- 可重用的基礎架構組件
- 常見資源模式
- 安全加固範本
- 成本優化配置

### 輔助腳本
- 環境設置自動化
- 資料庫遷移腳本
- 部署驗證工具
- 成本監控工具

## 🔧 自定義指南

### 調整範例以符合您的需求

1. **檢查先決條件**
   - 確認 Azure 服務需求
   - 驗證訂閱限制
   - 理解成本影響

2. **修改配置**
   - 更新 `azure.yaml` 服務定義
   - 自定義 Bicep 範本
   - 調整環境變數

3. **徹底測試**
   - 先部署到開發環境
   - 驗證功能
   - 測試擴展性及性能

4. **安全性審查**
   - 檢查訪問控制
   - 實現秘密管理
   - 啟用監控及警報

## 📊 比較矩陣

| 範例 | 服務 | 資料庫 | 認證 | 監控 | 複雜度 |
|------|------|--------|------|------|--------|
| Node.js Express Todo | 2 | ✅ | 基本 | 基本 | ⭐ |
| React SPA + Functions | 3 | ✅ | 基本 | 完整 | ⭐ |
| Python Flask Container | 2 | ❌ | 基本 | 完整 | ⭐ |
| C# Web API + SQL | 2 | ✅ | 完整 | 完整 | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | 完整 | 完整 | ⭐⭐ |
| Java Microservices | 5+ | ✅ | 完整 | 完整 | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | 完整 | 完整 | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | 基本 | 完整 | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | 完整 | 完整 | ⭐⭐⭐⭐ |
| **零售多代理** | **8+** | **✅** | **企業級** | **高級** | **⭐⭐⭐⭐** |

## 🎓 學習路徑

### 推薦進度

1. **從簡單網頁應用開始**
   - 學習 AZD 基本概念
   - 理解部署工作流程
   - 練習環境管理

2. **嘗試靜態網站**
   - 探索不同的托管選項
   - 學習 CDN 整合
   - 理解 DNS 配置

3. **進入容器應用**
   - 學習容器化基礎
   - 理解擴展概念
   - 練習使用 Docker

4. **添加資料庫整合**
   - 學習資料庫配置
   - 理解連接字串
   - 練習秘密管理

5. **探索無伺服器架構**
   - 理解事件驅動架構
   - 學習觸發器及綁定
   - 練習 API 開發

6. **構建微服務**
   - 學習服務通信
   - 理解分布式系統
   - 練習複雜部署

## 🔍 找到合適的範例

### 按技術堆疊
- **Node.js**: Node.js Express Todo 應用
- **Python**: Python Flask 容器應用、Python Functions + SPA
- **C#**: C# Web API + SQL 資料庫、Azure OpenAI 聊天應用、ML 管道
- **Java**: Java Spring Boot 微服務
- **React**: React SPA + Functions
- **容器**: Python Flask 容器應用、Java 微服務
- **資料庫**: Node.js + MongoDB、C# + Azure SQL、Python + Cosmos DB
- **AI/ML**: Azure OpenAI 聊天應用、AI 文件處理、ML 管道、**零售多代理解決方案**
- **多代理系統**: **零售多代理解決方案**
- **企業生產**: **零售多代理解決方案**

### 按架構模式
- **單體架構**: Node.js Express Todo、C# Web API + SQL
- **靜態 + 無伺服器**: React SPA + Functions、Python Functions + SPA
- **微服務**: Java Spring Boot 微服務
- **容器化**: Python Flask 容器應用
- **AI 驅動**: Azure OpenAI 聊天應用、AI 文件處理、ML 管道、**零售多代理解決方案**
- **多代理架構**: **零售多代理解決方案**
- **企業多服務**: **零售多代理解決方案**

### 按複雜度等級
- **初學者**: Node.js Express Todo、React SPA + Functions、Python Flask 容器應用
- **中級**: C# Web API + SQL、Python Functions + SPA、Java 微服務、Azure OpenAI 聊天應用、AI 文件處理
- **高級**: ML 管道
- **企業生產就緒**: **零售多代理解決方案**（完整多代理系統，含 ARM 範本部署）

## 📚 其他資源

### 文件連結
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Azure AI Foundry AZD 範本](https://github.com/Azure/ai-foundry-templates)
- [Bicep 文件](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure 架構中心](https://learn.microsoft.com/en-us/azure/architecture/)

### 社群範例
- [Azure 範例 AZD 範本](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry 範本](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI 資源庫](https://azure.github.io/awesome-azd/)
- [使用 C# 和 Azure SQL 的待辦事項應用程式](https://github.com/Azure-Samples/todo-csharp-sql)
- [使用 Python 和 MongoDB 的待辦事項應用程式](https://github.com/Azure-Samples/todo-python-mongo)
- [使用 Node.js 和 PostgreSQL 的待辦事項應用程式](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [使用 C# API 的 React 網頁應用程式](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure 容器應用程式工作](https://github.com/Azure-Samples/container-apps-jobs)
- [使用 Java 的 Azure Functions](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### 最佳實踐
- [Azure 良好架構框架](https://learn.microsoft.com/en-us/azure/well-architected/)
- [雲端採用框架](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 貢獻範例

有實用的範例想分享嗎？我們歡迎您的貢獻！

### 提交指南
1. 遵循既定的目錄結構
2. 包含完整的 README.md
3. 在配置檔案中添加註解
4. 在提交前進行全面測試
5. 包括成本估算和先決條件

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
- 選擇符合您技能水平的範例
- 按照範例 README 中的設置指導進行操作
- 嘗試進行自訂
- 與社群分享您的學習成果

---

**導航**
- **上一課**：[學習指南](../resources/study-guide.md)
- **返回**：[主 README](../README.md)

---

**免責聲明**：  
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們努力確保翻譯的準確性，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於關鍵資訊，建議尋求專業人工翻譯。我們對因使用此翻譯而引起的任何誤解或錯誤解釋不承擔責任。