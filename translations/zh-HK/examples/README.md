# 範例 - 實用 AZD 範本與設定

**以範例學習 - 按章節組織**  
- **📚 課程首頁**：[AZD For Beginners](../README.md)  
- **📖 章節對照表**：依學習難度組織的範例  
- **🚀 本地範例**：[零售多代理方案](retail-scenario.md)  
- **🤖 外部 AI 範例**：連結至 Azure Samples 儲存庫  

> **📍 重要說明：本地範例與外部範例**  
> 此儲存庫包含 **4 個完整本地範例**，具有完整實作：  
> - **Microsoft Foundry Models 聊天應用**（gpt-4.1 部署及聊天介面）  
> - **Container Apps 範例**（簡單 Flask API + 微服務）  
> - <strong>資料庫應用</strong>（網頁 + SQL 資料庫）  
> - <strong>零售多代理</strong>（企業級 AI 解決方案）  
>  
> 其他範例為指向 Azure-Samples 官方儲存庫的 <strong>外部參考</strong>，可供你 clone 使用。

## 簡介

本目錄提供實用範例與參考，幫助你透過實作練習學習 Azure Developer CLI。零售多代理方案為本儲存庫內完整的生產級實作。其他範例連結官方 Azure Samples，展示各種 AZD 範式。

### 難度評級說明

- ⭐ <strong>初學者</strong> - 基礎概念，單一服務，約 15-30 分鐘  
- ⭐⭐ <strong>中級</strong> - 多重服務，資料庫整合，約 30-60 分鐘  
- ⭐⭐⭐ <strong>進階</strong> - 複雜架構，AI 整合，約 1-2 小時  
- ⭐⭐⭐⭐ <strong>專家</strong> - 生產級，企業模式，2 小時以上  

## 🎯 本儲存庫實際內容

### ✅ 本地實作（可立即使用）

#### [Microsoft Foundry Models 聊天應用](azure-openai-chat/README.md) 🆕  
**本儲存庫內含完整 gpt-4.1 部署與聊天介面**

- **位置:** `examples/azure-openai-chat/`  
- **難度:** ⭐⭐（中級）  
- **包含內容:**  
  - 完整 Microsoft Foundry Models 部署（gpt-4.1）  
  - Python 命令列聊天介面  
  - Key Vault 整合以保護 API 金鑰  
  - Bicep 基礎設施範本  
  - 令牌使用與成本追蹤  
  - 流量限制與錯誤處理  

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
  
**技術堆疊:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep  

#### [Container App 範例](container-app/README.md) 🆕  
<strong>本儲存庫內含全面容器部署範例</strong>

- **位置:** `examples/container-app/`  
- **難度:** ⭐-⭐⭐⭐⭐（初學者至進階）  
- **包含內容:**  
  - [總覽指南](container-app/README.md) - 全面容器部署概述  
  - [簡單 Flask API](../../../examples/container-app/simple-flask-api) - 基本 REST API 範例  
  - [微服務架構](../../../examples/container-app/microservices) - 生產級多服務部署  
  - 快速入門、生產及進階模式  
  - 監控、安全性與成本優化  

**快速開始：**  
```bash
# 查看主導指南
cd examples/container-app

# 部署簡易 Flask API
cd simple-flask-api
azd up

# 部署微服務範例
cd ../microservices
azd up
```
  
**技術堆疊:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights  

#### [零售多代理解決方案](retail-scenario.md) 🆕  
<strong>本儲存庫內含完整生產級實作</strong>

- **位置:** `examples/retail-multiagent-arm-template/`  
- **難度:** ⭐⭐⭐⭐（進階）  
- **包含內容:**  
  - 完整 ARM 部署範本  
  - 多代理架構（客戶 + 庫存）  
  - Microsoft Foundry Models 整合  
  - 利用 RAG 的 AI 搜尋  
  - 全面監控  
  - 一鍵部署腳本  

**快速開始：**  
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```
  
**技術堆疊:** Microsoft Foundry Models, AI 搜尋, Container Apps, Cosmos DB, Application Insights  

---

## 🔗 外部 Azure Samples（Clone 後使用）

以下範例維護於官方 Azure-Samples 儲存庫，請 clone 後探索不同 AZD 範式：

### 簡單應用（第 1-2 章）

| 範本 | 儲存庫 | 難度 | 服務類型 |
|:-----|:-------|:-----|:---------|
| **Python Flask API** | [本地：simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |  
| <strong>微服務</strong> | [本地：microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | 多服務, Service Bus, Cosmos DB, SQL |  
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |  
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |  
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |  

**如何使用：**  
```bash
# 複製任何範例
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# 部署
azd up
```
  
### AI 應用範例（第 2、5、8 章）

| 範本 | 儲存庫 | 難度 | 重點 |
|:-----|:-------|:-----|:-----|
| **Microsoft Foundry Models 聊天應用** | [本地：azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 部署 |  
| **AI Chat 快速入門** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | 基本 AI 聊天 |  
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | 代理框架 |  
| **搜尋 + OpenAI 示範** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG 範式 |  
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | 企業級 AI |  

### 資料庫與進階模式（第 3-8 章）

| 範本 | 儲存庫 | 難度 | 重點 |
|:-----|:-------|:-----|:-----|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | 資料庫整合 |  
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | 無伺服器 NoSQL |  
| **Java 微服務** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | 多服務 |  
| <strong>機器學習流程線</strong> | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |  

## 學習目標

透過完成這些範例，你將能：  
- 實作現實應用場景的 Azure Developer CLI 工作流程  
- 理解不同應用架構及其 azd 實作方式  
- 精通各種 Azure 服務的基礎設施即程式碼範式  
- 掌握設定管理與環境特定部署策略  
- 實踐監控、安全性與彈性擴展模式  
- 鍛鍊故障排除與除錯實際部署問題的能力  

## 學習成果

完成這些範例後，你將能夠：  
- 自信使用 Azure Developer CLI 部署多種應用類型  
- 根據自身需求調整提供的範本  
- 設計並實作自訂基礎設施模式，運用 Bicep  
- 配置具有合理依賴性的複雜多服務應用  
- 運用安全、監控與效能最佳實務於真實場景  
- 基於實務經驗對部署進行故障排除與優化  

## 目錄架構

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

> **💡 初次使用 AZD？** 請從範例#1（Flask API）開始 - 約需 20 分鐘，涵蓋核心概念。

### 初學者適用  
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)**（本地） ⭐  
   部署簡單 REST API 支援 scale-to-zero  
   **所需時間：** 20-25 分鐘 | **預估費用：** $0-5/月  
   **學習內容：** 基本 azd 工作流程、容器化、健康檢查  
   **預期成效：** 建立可回傳「Hello, World!」並具監控的 API 節點  

2. **[簡單網站 - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   部署 Node.js Express 網站搭配 MongoDB  
   **所需時間：** 25-35 分鐘 | **預估費用：** $10-30/月  
   **學習內容：** 資料庫整合、環境變數、連線字串  
   **預期成效：** 具新增/讀取/更新/刪除功能的待辦清單應用  

3. **[靜態網站 - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   透過 Azure Static Web Apps 託管 React 靜態網站  
   **所需時間：** 20-30 分鐘 | **預估費用：** $0-10/月  
   **學習內容：** 靜態託管、無伺服器函式、CDN 部署  
   **預期成效：** React UI 搭配 API 後端，自動 SSL 與全球 CDN  

### 中級使用者適用  
4. **[Microsoft Foundry Models 聊天應用](../../../examples/azure-openai-chat)**（本地） ⭐⭐  
   部署 gpt-4.1 並具聊天介面及安全 API 金鑰管理  
   **所需時間：** 35-45 分鐘 | **費用預估：** $50-200/月  
   **學習內容：** Microsoft Foundry Models 部署、Key Vault 整合、令牌追蹤  
   **預期成效：** 具聊天功能與成本監控的 gpt-4.1 應用  

5. **[Container App - 微服務](../../../examples/container-app/microservices)**（本地） ⭐⭐⭐⭐  
   生產級多服務架構  
   **所需時間：** 45-60 分鐘 | **費用預估：** $50-150/月  
   **學習內容：** 服務通訊、訊息佇列、分散式偵錯追蹤  
   **預期成效：** 2 服務系統（API 閘道 + 產品服務）具監控功能  

6. **[資料庫應用 - C# 搭配 Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   網頁應用搭配 C# API 與 Azure SQL 資料庫  
   **所需時間：** 30-45 分鐘 | **費用預估：** $20-80/月  
   **學習內容：** Entity Framework、資料庫遷移、連線安全  
   **預期成效：** C# API 搭配 Azure SQL，具自動架構部署  

7. **[無伺服器函式 - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions，含 HTTP 觸發器與 Cosmos DB  
   **所需時間：** 30-40 分鐘 | **費用預估：** $10-40/月  
   **學習內容：** 事件驅動架構、無伺服器擴展、NoSQL 整合  
   **預期成效：** 函式應用回應 HTTP 請求並存取 Cosmos DB  

8. **[微服務 - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   多服務 Java 應用，搭配 Container Apps 與 API 閘道  
   **所需時間：** 60-90 分鐘 | **費用預估：** $80-200/月  
   **學習內容：** Spring Boot 部署、服務網格、負載均衡  
   **預期成效：** 多服務 Java 系統，具服務發現及路由能力  

### Microsoft Foundry 範本

1. **[Microsoft Foundry Models 聊天 App - 本地範例](../../../examples/azure-openai-chat)** ⭐⭐  
   完整 gpt-4.1 部署及聊天介面  
   **所需時間：** 35-45 分鐘 | **費用預估：** $50-200/月  
   **預期成效：** 具令牌追蹤及成本監控的聊天應用  

2. **[Azure Search + OpenAI 示範](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   智能聊天應用，採用 RAG 架構  
   **所需時間：** 60-90 分鐘 | **費用預估：** $100-300/月  
   **預期成效：** RAG 驅動的聊天介面，具文件搜尋和引用  

3. **[AI 文件處理](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   透過 Azure AI 進行文件分析  
   **所需時間：** 40-60 分鐘 | **費用預估：** $20-80/月  
   **預期成效：** API 可從上傳文件中萃取文字、表格與實體  

4. **[機器學習流程線](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   使用 Azure Machine Learning 的 MLOps 工作流程  
   **所需時間：** 2-3 小時 | **費用預估：** $150-500/月  
   **預期成效：** 自動化 ML 流程線，含訓練、部署及監控  

### 實務場景

#### <strong>零售多代理解決方案</strong> 🆕  
**[完整實作指南](./retail-scenario.md)**

一個全面的生產級多代理客戶支援方案，展示以 AZD 部署企業級 AI 應用。此方案提供：  

- <strong>完整架構</strong>：具專門的客戶服務及庫存管理多代理系統
- <strong>生產基建</strong>：多區域 Microsoft Foundry Models 部署、AI 搜索、容器應用及全面監控
- **即時部署 ARM 模板**：一鍵部署，多種配置模式（最小/標準/高級）
- <strong>進階功能</strong>：紅隊安全驗證、代理評估框架、成本優化及疑難排解指引
- <strong>真實商業情境</strong>：零售客戶支援案例，包含文件上傳、搜索整合及動態擴展

<strong>技術</strong>：Microsoft Foundry Models（gpt-4.1、gpt-4.1-mini）、Azure AI 搜索、容器應用、Cosmos DB、Application Insights、文件智能、Bing 搜索 API

<strong>難度</strong>：⭐⭐⭐⭐（進階 - 企業生產就緒）

<strong>適合對象</strong>：AI 開發者、方案架構師及構建生產多代理系統的團隊

<strong>快速入門</strong>：使用內附 ARM 模板，透過 `./deploy.sh -g myResourceGroup` 於 30 分鐘內完成整套解決方案部署

## 📋 使用說明

### 先決條件

執行任何範例前：
- ✅ 擁有含所有者或參與者權限的 Azure 訂閱
- ✅ 已安裝 Azure Developer CLI（[安裝指南](../docs/chapter-01-foundation/installation.md)）
- ✅ Docker Desktop 已啟動（以用於容器範例）
- ✅ 適用 Azure 配額（請檢查每個範例的具體需求）

> **💰 費用提醒：** 所有範例均會建立真實 Azure 資源並產生費用。費用估算請參見各自 README 文件。完成使用後請記得執行 `azd down` 以避免持續產生費用。

### 本機執行範例

1. <strong>複製或克隆範例</strong>
   ```bash
   # 導航至所需範例
   cd examples/simple-web-app
   ```

2. **初始化 AZD 環境**
   ```bash
   # 使用現有模板初始化
   azd init
   
   # 或建立新環境
   azd env new my-environment
   ```

3. <strong>配置環境</strong>
   ```bash
   # 設定所需的變數
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
   - ✅ `azd up` 無錯誤完成
   - ✅ 服務端點返回 HTTP 200
   - ✅ Azure 入口網站顯示「運行中」狀態
   - ✅ Application Insights 正接收遙測資料

> **⚠️ 遇到問題？** 請參閱 [常見問題](../docs/chapter-07-troubleshooting/common-issues.md) 以取得部署故障排解指導

### 範例調整

每個範例包括：
- **README.md** - 詳盡的設置與自訂說明
- **azure.yaml** - 附註說明的 AZD 配置文件
- **infra/** - 含參數說明的 Bicep 模板
- **src/** - 範例應用程式碼
- **scripts/** - 常見任務的輔助腳本

## 🎯 學習目標

### 範例類別

#### <strong>基礎部署</strong>
- 單一服務應用
- 簡易基礎架構模式
- 基本配置管理
- 成本效益開發設置

#### <strong>進階場景</strong>
- 多服務架構
- 複雜網路配置
- 資料庫整合模式
- 安全與合規實作

#### <strong>生產級模式</strong>
- 高可用性配置
- 監控與可觀測性
- CI/CD 整合
- 災難復原設置

## 📖 範例說明

### 簡易 Web 應用 - Node.js Express
<strong>技術</strong>：Node.js、Express、MongoDB、容器應用  
<strong>難度</strong>：初學者  
<strong>概念</strong>：基礎部署、REST API、NoSQL 資料庫整合

### 靜態網站 - React SPA
<strong>技術</strong>：React、Azure 靜態 Web 應用、Azure Functions、Cosmos DB  
<strong>難度</strong>：初學者  
<strong>概念</strong>：靜態托管、無服務器後端、現代網頁開發

### 容器應用 - Python Flask
<strong>技術</strong>：Python Flask、Docker、容器應用、容器註冊表、Application Insights  
<strong>難度</strong>：初學者  
<strong>概念</strong>：容器化、REST API、零擴展、健康檢查、監控  
<strong>位置</strong>：[本機範例](../../../examples/container-app/simple-flask-api)

### 容器應用 - 微服務架構
<strong>技術</strong>：Python、Node.js、C#、Go、服務總線、Cosmos DB、Azure SQL、容器應用  
<strong>難度</strong>：進階  
<strong>概念</strong>：多服務架構、服務間通信、訊息佇列、分散式追蹤  
<strong>位置</strong>：[本機範例](../../../examples/container-app/microservices)

### 資料庫應用 - C# Azure SQL
<strong>技術</strong>：C# ASP.NET Core、Azure SQL 資料庫、應用服務  
<strong>難度</strong>：中階  
<strong>概念</strong>：實體框架、資料庫連接、Web API 開發

### 無服務器函數 - Python Azure Functions
<strong>技術</strong>：Python、Azure Functions、Cosmos DB、靜態 Web 應用  
<strong>難度</strong>：中階  
<strong>概念</strong>：事件驅動架構、無服務器運算、全端開發

### 微服務 - Java Spring Boot
<strong>技術</strong>：Java Spring Boot、容器應用、服務總線、API 閘道  
<strong>難度</strong>：中階  
<strong>概念</strong>：微服務通信、分散式系統、企業方案模式

### Microsoft Foundry 範例

#### Microsoft Foundry Models 聊天應用
<strong>技術</strong>：Microsoft Foundry Models、Azure AI 搜索、應用服務  
<strong>難度</strong>：中階  
<strong>概念</strong>：RAG 架構、向量搜索、LLM 整合

#### AI 文件處理
<strong>技術</strong>：Azure AI 文件智能、儲存、Functions  
<strong>難度</strong>：中階  
<strong>概念</strong>：文件分析、OCR、資料擷取

#### 機器學習管線
<strong>技術</strong>：Azure ML、MLOps、容器註冊表  
<strong>難度</strong>：進階  
<strong>概念</strong>：模型訓練、部署管線、監控

## 🛠 配置範例

`configurations/` 目錄包含可重用元件：

### 環境配置
- 開發環境設定
- 測試環境配置
- 生產就緒配置
- 多區域部署設置

### Bicep 模組
- 可重用基礎架構元件
- 常用資源模式
- 安全強化模板
- 成本優化配置

### 輔助腳本
- 環境設置自動化
- 資料庫遷移腳本
- 部署驗證工具
- 成本監控工具

## 🔧 自訂指南

### 依據使用情境調整範例

1. <strong>檢視先決條件</strong>
   - 檢查 Azure 服務需求
   - 確認訂閱限制
   - 理解費用影響

2. <strong>修改配置</strong>
   - 更新 `azure.yaml` 服務定義
   - 自訂 Bicep 模板
   - 調整環境變數

3. <strong>充分測試</strong>
   - 先部署於開發環境
   - 驗證功能正確
   - 測試擴展能力與效能

4. <strong>安全檢討</strong>
   - 評估存取控制
   - 實施密鑰管理
   - 啟用監控與警示

## 📊 比較矩陣

| 範例 | 服務 | 資料庫 | 認證 | 監控 | 難度 |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat**（本機） | 2 | ❌ | Key Vault | 完整 | ⭐⭐ |
| **Python Flask API**（本機） | 1 | ❌ | 基本 | 完整 | ⭐ |
| <strong>微服務</strong>（本機） | 5+ | ✅ | 企業級 | 進階 | ⭐⭐⭐⭐ |
| Node.js Express 待辦 | 2 | ✅ | 基本 | 基本 | ⭐ |
| React SPA + Functions | 3 | ✅ | 基本 | 完整 | ⭐ |
| Python Flask 容器 | 2 | ❌ | 基本 | 完整 | ⭐ |
| C# Web API + SQL | 2 | ✅ | 完整 | 完整 | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | 完整 | 完整 | ⭐⭐ |
| Java 微服務 | 5+ | ✅ | 完整 | 完整 | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | 完整 | 完整 | ⭐⭐⭐ |
| AI 文件處理 | 2 | ❌ | 基本 | 完整 | ⭐⭐ |
| ML 管線 | 4+ | ✅ | 完整 | 完整 | ⭐⭐⭐⭐ |
| <strong>零售多代理</strong>（本機） | **8+** | **✅** | <strong>企業級</strong> | <strong>進階</strong> | **⭐⭐⭐⭐** |

## 🎓 學習路徑

### 推薦進度

1. **從簡易 Web 應用開始**
   - 學習基本 AZD 概念
   - 理解部署流程
   - 練習環境管理

2. <strong>嘗試靜態網站</strong>
   - 探索不同托管方案
   - 學習 CDN 整合
   - 理解 DNS 配置

3. <strong>轉向容器應用</strong>
   - 學習容器化基礎
   - 理解擴展概念
   - 練習 Docker

4. <strong>新增資料庫整合</strong>
   - 學習資料庫配備
   - 理解連接字串
   - 練習密鑰管理

5. <strong>探索無服務器</strong>
   - 理解事件驅動架構
   - 學習觸發器與繫結
   - 練習 API 設計

6. <strong>建立微服務</strong>
   - 學習服務通信
   - 理解分散式系統
   - 練習複雜部署

## 🔍 尋找適合範例

### 按技術棧分類
- <strong>容器應用</strong>：[Python Flask API（本機）](../../../examples/container-app/simple-flask-api)、[微服務（本機）](../../../examples/container-app/microservices)、Java 微服務
- **Node.js**：Node.js Express 待辦應用、[微服務 API 閘道（本機）](../../../examples/container-app/microservices)
- **Python**：[Python Flask API（本機）](../../../examples/container-app/simple-flask-api)、[微服務商品服務（本機）](../../../examples/container-app/microservices)、Python Functions + SPA
- **C#**：[微服務訂單服務（本機）](../../../examples/container-app/microservices)、C# Web API + SQL 資料庫、Microsoft Foundry Models 聊天應用、ML 管線
- **Go**：[微服務用戶服務（本機）](../../../examples/container-app/microservices)
- **Java**：Java Spring Boot 微服務
- **React**：React SPA + Functions
- <strong>容器</strong>：[Python Flask（本機）](../../../examples/container-app/simple-flask-api)、[微服務（本機）](../../../examples/container-app/microservices)、Java 微服務
- <strong>資料庫</strong>：[微服務（本機）](../../../examples/container-app/microservices)、Node.js + MongoDB、C# + Azure SQL、Python + Cosmos DB
- **AI/ML**：**[Microsoft Foundry Models Chat（本機）](../../../examples/azure-openai-chat)**、Microsoft Foundry Models 聊天應用、AI 文件處理、ML 管線、<strong>零售多代理解決方案</strong>
- <strong>多代理系統</strong>：<strong>零售多代理解決方案</strong>
- **OpenAI 整合**：**[Microsoft Foundry Models Chat（本機）](../../../examples/azure-openai-chat)**、零售多代理解決方案
- <strong>企業生產</strong>：[微服務（本機）](../../../examples/container-app/microservices)、<strong>零售多代理解決方案</strong>

### 按架構模式分類
- **簡易 REST API**：[Python Flask API（本機）](../../../examples/container-app/simple-flask-api)
- <strong>單體式</strong>：Node.js Express 待辦、C# Web API + SQL
- **靜態 + 無服務器**：React SPA + Functions、Python Functions + SPA
- <strong>微服務</strong>：[生產微服務（本機）](../../../examples/container-app/microservices)、Java Spring Boot 微服務
- <strong>容器化</strong>：[Python Flask（本機）](../../../examples/container-app/simple-flask-api)、[微服務（本機）](../../../examples/container-app/microservices)
- **AI 驅動**：**[Microsoft Foundry Models Chat（本機）](../../../examples/azure-openai-chat)**、Microsoft Foundry Models 聊天應用、AI 文件處理、ML 管線、<strong>零售多代理解決方案</strong>
- <strong>多代理架構</strong>：<strong>零售多代理解決方案</strong>
- <strong>企業多服務</strong>：[微服務（本機）](../../../examples/container-app/microservices)、<strong>零售多代理解決方案</strong>

### 按難度分類
- <strong>初學者</strong>：[Python Flask API（本機）](../../../examples/container-app/simple-flask-api)、Node.js Express 待辦、React SPA + Functions
- <strong>中階</strong>：**[Microsoft Foundry Models Chat（本機）](../../../examples/azure-openai-chat)**、C# Web API + SQL、Python Functions + SPA、Java 微服務、Microsoft Foundry Models 聊天應用、AI 文件處理
- <strong>進階</strong>：ML 管線
- <strong>企業生產就緒</strong>：[微服務（本機）](../../../examples/container-app/microservices)（多服務含訊息佇列）、<strong>零售多代理解決方案</strong>（完整多代理系統含 ARM 模板部署）

## 📚 附加資源

### 文件連結
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD 模板](https://github.com/Azure/ai-foundry-templates)
- [Bicep 文件](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure 架構中心](https://learn.microsoft.com/en-us/azure/architecture/)

### 社群範例
- [Azure Samples AZD 模板](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry 模板](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [C# 與 Azure SQL 待辦應用](https://github.com/Azure-Samples/todo-csharp-sql)
- [Python 與 MongoDB 待辦應用](https://github.com/Azure-Samples/todo-python-mongo)
- [Node.js 與 PostgreSQL 待辦應用](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [使用 C# API 的 React 網頁應用程式](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps 工作](https://github.com/Azure-Samples/container-apps-jobs)
- [使用 Java 的 Azure Functions](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### 最佳實踐
- [Azure 卓越架構框架](https://learn.microsoft.com/en-us/azure/well-architected/)
- [雲端採用框架](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 貢獻範例

有實用的範例想分享？我們歡迎您的貢獻！

### 提交指南
1. 遵循既定的目錄結構
2. 包含完整的 README.md
3. 在配置文件中加入註解
4. 提交前做好充分測試
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

<strong>專業提示</strong>：從符合您技術棧的最簡單範例開始，逐步進階到更複雜的場景。每個範例皆建立於前一個概念之上！

## 🚀 準備開始了嗎？

### 您的學習路徑

1. **完全初學者？** → 從 [Flask API](../../../examples/container-app/simple-flask-api) 開始（⭐，20 分鐘）
2. **有基本的 AZD 知識？** → 試試 [微服務](../../../examples/container-app/microservices)（⭐⭐⭐⭐，60 分鐘）
3. **建立 AI 應用？** → 從 [Microsoft Foundry Models 聊天](../../../examples/azure-openai-chat) 開始（⭐⭐，35 分鐘）或探索 [零售多代理](retail-scenario.md)（⭐⭐⭐⭐，2 小時以上）
4. **需要特定技術棧？** → 使用上方的 [尋找合適範例](#-finding-the-right-example) 區段

### 下一步

- ✅ 查看上述的 [先決條件](#先決條件)
- ✅ 選擇符合您的技能等級的範例（參考 [複雜度說明](#難度評級說明)）
- ✅ 在部署前仔細閱讀範例的 README
- ✅ 記得測試完後執行 `azd down`
- ✅ 透過 GitHub Issues 或 Discussions 分享您的經驗

### 需要幫助？

- 📖 [常見問題](../resources/faq.md) - 常見問題解答
- 🐛 [疑難排解指南](../docs/chapter-07-troubleshooting/common-issues.md) - 解決部署問題
- 💬 [GitHub 討論區](https://github.com/microsoft/AZD-for-beginners/discussions) - 向社群提問
- 📚 [學習指南](../resources/study-guide.md) - 加強您的學習

---

<strong>導覽</strong>
- **📚 課程首頁**：[AZD 初學者](../README.md)
- **📖 學習素材**：[學習指南](../resources/study-guide.md) | [速查表](../resources/cheat-sheet.md) | [術語表](../resources/glossary.md)
- **🔧 資源**：[常見問題](../resources/faq.md) | [疑難排解](../docs/chapter-07-troubleshooting/common-issues.md)

---

*最後更新：2025 年 11 月 | [回報問題](https://github.com/microsoft/AZD-for-beginners/issues) | [貢獻範例](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意，機器自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->