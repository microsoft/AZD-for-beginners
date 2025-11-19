<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "22ea3f5148517a6012d3e2771584ef87",
  "translation_date": "2025-11-19T14:04:10+00:00",
  "source_file": "examples/container-app/microservices/README.md",
  "language_code": "hk"
}
-->
# 微服務架構 - 容器應用程式範例

⏱️ **估計時間**：25-35 分鐘 | 💰 **估計成本**：約 $50-100/月 | ⭐ **複雜度**：進階

一個**簡化但功能完整**的微服務架構，使用 AZD CLI 部署到 Azure 容器應用程式。本範例展示了服務間的通訊、容器編排及監控，並採用實用的兩個服務設置。

> **📚 學習方式**：此範例以最少的兩個服務架構（API Gateway + 後端服務）開始，您可以實際部署並從中學習。在掌握基礎後，我們提供擴展至完整微服務生態系統的指導。

## 您將學到的內容

完成此範例後，您將能：
- 部署多個容器到 Azure 容器應用程式
- 使用內部網絡實現服務間通訊
- 配置基於環境的擴展及健康檢查
- 使用 Application Insights 監控分佈式應用程式
- 理解微服務部署模式及最佳實踐
- 從簡單架構逐步擴展至複雜架構

## 架構

### 第一階段：我們正在構建的內容（此範例包含）

```
                    ┌─────────────────────────────┐
                    │         Internet            │
                    └──────────────┬──────────────┘
                                   │
                                   │ HTTPS
                                   │
                    ┌──────────────▼──────────────┐
                    │      API Gateway            │
                    │   (Node.js Container)       │
                    │   - Routes requests         │
                    │   - Health checks           │
                    │   - Request logging         │
                    └──────────────┬──────────────┘
                                   │
                                   │ HTTP (internal)
                                   │
                    ┌──────────────▼──────────────┐
                    │    Product Service          │
                    │   (Python Container)        │
                    │   - Product CRUD            │
                    │   - In-memory data store    │
                    │   - REST API                │
                    └──────────────┬──────────────┘
                                   │
                    ┌──────────────▼──────────────┐
                    │   Application Insights      │
                    │   (Monitoring & Logs)       │
                    └─────────────────────────────┘
```

**為什麼從簡單開始？**
- ✅ 快速部署及理解（25-35 分鐘）
- ✅ 學習核心微服務模式而不增加複雜性
- ✅ 可修改及實驗的工作代碼
- ✅ 學習成本較低（約 $50-100/月 vs $300-1400/月）
- ✅ 在添加數據庫及消息隊列前建立信心

**比喻**：這就像學開車。您先在空的停車場（2 個服務）學習基礎，然後進步到城市交通（5+ 個服務及數據庫）。

### 第二階段：未來擴展（參考架構）

當您掌握了兩個服務架構後，您可以擴展至：

```
Full Architecture (Not Included - For Reference)
├── API Gateway (✅ Included)
├── Product Service (✅ Included)
├── Order Service (🔜 Add next)
├── User Service (🔜 Add next)
├── Notification Service (🔜 Add last)
├── Azure Service Bus (🔜 For async communication)
├── Cosmos DB (🔜 For product persistence)
├── Azure SQL (🔜 For order management)
└── Azure Storage (🔜 For file storage)
```

請參閱最後的“擴展指南”部分以獲得逐步指導。

## 包含的功能

✅ **服務發現**：基於 DNS 的容器間自動發現  
✅ **負載均衡**：內建的副本間負載均衡  
✅ **自動擴展**：基於 HTTP 請求的獨立服務擴展  
✅ **健康監控**：兩個服務的存活及準備探測  
✅ **分佈式日誌**：使用 Application Insights 的集中式日誌  
✅ **內部網絡**：安全的服務間通訊  
✅ **容器編排**：自動部署及擴展  
✅ **零停機更新**：滾動更新及版本管理  

## 先決條件

### 必需工具

開始之前，請確認您已安裝以下工具：

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)**（版本 1.0.0 或更高）
   ```bash
   azd version
   # 預期輸出：azd 版本 1.0.0 或更高
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)**（版本 2.50.0 或更高）
   ```bash
   az --version
   # 預期輸出：azure-cli 2.50.0 或更高版本
   ```

3. **[Docker](https://www.docker.com/get-started)**（用於本地開發/測試 - 可選）
   ```bash
   docker --version
   # 預期輸出：Docker 版本 20.10 或更高
   ```

### Azure 要求

- 一個有效的 **Azure 訂閱**（[創建免費帳戶](https://azure.microsoft.com/free/)）
- 在您的訂閱中創建資源的權限
- **Contributor** 角色於訂閱或資源群組

### 知識要求

這是一個**進階級別**範例。您應該具備：
- 完成 [簡單 Flask API 範例](../../../../../examples/container-app/simple-flask-api) 
- 微服務架構的基本理解
- 熟悉 REST API 和 HTTP
- 理解容器概念

**容器應用程式新手？** 請先從 [簡單 Flask API 範例](../../../../../examples/container-app/simple-flask-api) 開始學習基礎。

## 快速開始（逐步指南）

### 第一步：克隆並導航

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ 成功檢查**：確認您看到 `azure.yaml`：
```bash
ls
# 預期：README.md, azure.yaml, infra/, src/
```

### 第二步：使用 Azure 認證

```bash
azd auth login
```

這將打開您的瀏覽器進行 Azure 認證。使用您的 Azure 資格登入。

**✓ 成功檢查**：您應該看到：
```
Logged in to Azure.
```

### 第三步：初始化環境

```bash
azd init
```

**您將看到的提示**：
- **環境名稱**：輸入一個簡短名稱（例如 `microservices-dev`）
- **Azure 訂閱**：選擇您的訂閱
- **Azure 地區**：選擇一個地區（例如 `eastus`，`westeurope`）

**✓ 成功檢查**：您應該看到：
```
SUCCESS: New project initialized!
```

### 第四步：部署基礎設施及服務

```bash
azd up
```

**發生了什麼**（需時 8-12 分鐘）：
1. 創建容器應用程式環境
2. 創建 Application Insights 用於監控
3. 建立 API Gateway 容器（Node.js）
4. 建立 Product Service 容器（Python）
5. 部署兩個容器到 Azure
6. 配置網絡及健康檢查
7. 設置監控及日誌

**✓ 成功檢查**：您應該看到：
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ 時間**：8-12 分鐘

### 第五步：測試部署

```bash
# 獲取網關端點
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# 測試 API Gateway 健康狀態
curl $GATEWAY_URL/health

# 預期輸出：
# {"status":"healthy","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**通過網關測試產品服務**：
```bash
# 列出產品
curl $GATEWAY_URL/api/products

# 預期輸出：
# [
#   {"id":1,"name":"筆記型電腦","price":999.99,"stock":50},
#   {"id":2,"name":"滑鼠","price":29.99,"stock":200},
#   {"id":3,"name":"鍵盤","price":79.99,"stock":150}
# ]
```

**✓ 成功檢查**：兩個端點返回 JSON 數據且無錯誤。

---

**🎉 恭喜！** 您已成功部署微服務架構到 Azure！

## 專案結構

所有實現文件均已包含——這是一個完整的工作範例：

```
microservices/
│
├── README.md                         # This file
├── azure.yaml                        # AZD configuration
├── .gitignore                        # Git ignore patterns
│
├── infra/                           # Infrastructure as Code (Bicep)
│   ├── main.bicep                   # Main orchestration
│   ├── abbreviations.json           # Naming conventions
│   ├── core/                        # Shared infrastructure
│   │   ├── container-apps-environment.bicep  # Container environment + registry
│   │   └── monitor.bicep            # Application Insights + Log Analytics
│   └── app/                         # Service definitions
│       ├── api-gateway.bicep        # API Gateway container app
│       └── product-service.bicep    # Product Service container app
│
└── src/                             # Application source code
    ├── api-gateway/                 # Node.js API Gateway
    │   ├── app.js                   # Express server with routing
    │   ├── package.json             # Node dependencies
    │   └── Dockerfile               # Container definition
    └── product-service/             # Python Product Service
        ├── main.py                  # Flask API with product data
        ├── requirements.txt         # Python dependencies
        └── Dockerfile               # Container definition
```

**每個組件的作用：**

**基礎設施（infra/）**：
- `main.bicep`：編排所有 Azure 資源及其依賴項
- `core/container-apps-environment.bicep`：創建容器應用程式環境及 Azure 容器註冊表
- `core/monitor.bicep`：設置 Application Insights 用於分佈式日誌
- `app/*.bicep`：個別容器應用程式定義，包含擴展及健康檢查

**API Gateway（src/api-gateway/）**：
- 面向公眾的服務，將請求路由到後端服務
- 實現日誌記錄、錯誤處理及請求轉發
- 展示服務間的 HTTP 通訊

**Product Service（src/product-service/）**：
- 內部服務，包含產品目錄（簡化為內存）
- REST API，包含健康檢查
- 後端微服務模式範例

## 服務概述

### API Gateway（Node.js/Express）

**端口**：8080  
**訪問**：公眾（外部入口）  
**目的**：將進入的請求路由到適當的後端服務  

**端點**：
- `GET /` - 服務信息
- `GET /health` - 健康檢查端點
- `GET /api/products` - 轉發到產品服務（列出所有）
- `GET /api/products/:id` - 轉發到產品服務（按 ID 獲取）

**主要功能**：
- 使用 axios 進行請求路由
- 集中式日誌記錄
- 錯誤處理及超時管理
- 通過環境變數進行服務發現
- 集成 Application Insights

**代碼亮點**（`src/api-gateway/app.js`）：
```javascript
// 內部服務通訊
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Product Service（Python/Flask）

**端口**：8000  
**訪問**：僅內部（無外部入口）  
**目的**：管理產品目錄，使用內存數據  

**端點**：
- `GET /` - 服務信息
- `GET /health` - 健康檢查端點
- `GET /products` - 列出所有產品
- `GET /products/<id>` - 按 ID 獲取產品

**主要功能**：
- 使用 Flask 的 RESTful API
- 內存產品存儲（簡單，無需數據庫）
- 使用探測進行健康監控
- 結構化日誌記錄
- 集成 Application Insights

**數據模型**：
```python
{
  "id": 1,
  "name": "Laptop",
  "description": "High-performance laptop",
  "price": 999.99,
  "stock": 50
}
```

**為什麼僅內部？**
產品服務不對外公開。所有請求必須通過 API Gateway，這提供了：
- 安全性：受控的訪問點
- 靈活性：可以更改後端而不影響客戶端
- 監控：集中式請求日誌記錄

## 理解服務通訊

### 服務如何相互通訊

在此範例中，API Gateway 使用**內部 HTTP 調用**與 Product Service 通訊：

```javascript
// API Gateway (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// 發出內部 HTTP 請求
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**關鍵點**：

1. **基於 DNS 的發現**：容器應用程式自動為內部服務提供 DNS
   - Product Service FQDN：`product-service.internal.<environment>.azurecontainerapps.io`
   - 簡化為：`http://product-service`（容器應用程式會解析）

2. **無公眾暴露**：Product Service 在 Bicep 中設置為 `external: false`
   - 僅在容器應用程式環境內可訪問
   - 無法從互聯網訪問

3. **環境變數**：服務 URL 在部署時注入
   - Bicep 將內部 FQDN 傳遞給網關
   - 應用程式代碼中無硬編碼 URL

**比喻**：這就像辦公室房間。API Gateway 是接待處（面向公眾），而 Product Service 是辦公室房間（僅內部）。訪客必須通過接待處才能到達任何辦公室。

## 部署選項

### 完整部署（推薦）

```bash
# 部署基礎設施及兩個服務
azd up
```

這將部署：
1. 容器應用程式環境
2. Application Insights
3. 容器註冊表
4. API Gateway 容器
5. Product Service 容器

**時間**：8-12 分鐘

### 部署個別服務

```bash
# 只部署一個服務（初次 azd up 之後）
azd deploy api-gateway

# 或部署產品服務
azd deploy product-service
```

**使用場景**：當您更新了某個服務的代碼並希望僅重新部署該服務。

### 更新配置

```bash
# 更改縮放參數
azd env set GATEWAY_MAX_REPLICAS 30

# 使用新配置重新部署
azd up
```

## 配置

### 擴展配置

兩個服務的 Bicep 文件中均配置了基於 HTTP 的自動擴展：

**API Gateway**：
- 最小副本：2（始終至少 2 個以確保可用性）
- 最大副本：20
- 擴展觸發：每副本 50 個並發請求

**Product Service**：
- 最小副本：1（如有需要可擴展至零）
- 最大副本：10
- 擴展觸發：每副本 100 個並發請求

**自定義擴展**（在 `infra/app/*.bicep` 中）：
```bicep
scale: {
  minReplicas: 1
  maxReplicas: 10
  rules: [
    {
      name: 'http-scale-rule'
      http: {
        metadata: {
          concurrentRequests: '100'  // Adjust this
        }
      }
    }
  ]
}
```

### 資源分配

**API Gateway**：
- CPU：1.0 vCPU
- 記憶體：2 GiB
- 原因：處理所有外部流量

**Product Service**：
- CPU：0.5 vCPU
- 記憶體：1 GiB
- 原因：輕量級內存操作

### 健康檢查

兩個服務均包含存活及準備探測：

```bicep
probes: [
  {
    type: 'Liveness'
    httpGet: {
      path: '/health'
      port: 8080
    }
    initialDelaySeconds: 10
    periodSeconds: 30
  }
  {
    type: 'Readiness'
    httpGet: {
      path: '/health'
      port: 8080
    }
    initialDelaySeconds: 5
    periodSeconds: 10
  }
]
```

**這意味著**：
- **存活性**：如果健康檢查失敗，容器應用程式將重新啟動容器
- **準備性**：如果未準備好，容器應用程式將停止向該副本路由流量

## 監控及可觀察性

### 查看服務日誌

```bash
# 從 API Gateway 流式傳輸日誌
azd logs api-gateway --follow

# 查看最近的產品服務日誌
azd logs product-service --tail 100

# 查看來自兩個服務的所有日誌
azd logs --follow
```

**預期輸出**：
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Application Insights 查詢

在 Azure Portal 中訪問 Application Insights，然後運行以下查詢：

**查找慢速請求**：
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**追蹤服務間調用**：
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

**按服務的錯誤率**：
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

**請求量隨時間變化**：
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### 訪問監控儀表板

```bash
# 獲取應用程式洞察詳細資料
azd env get-values | grep APPLICATIONINSIGHTS

# 開啟 Azure Portal 監控
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### 實時指標

1. 在 Azure Portal 中導航至 Application Insights
2. 點擊“實時指標”
3. 查看實時請求、失敗及性能
4. 測試運行：`curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## 實踐練習

[注意：請參閱上方“實踐練習”部分以獲得詳細的逐步練習，包括部署驗證、數據修改、自動擴展測試、錯誤處理及添加第三個服務。]

## 成本分析

### 每月估計成本（針對此兩個服務範例）

| 資源 | 配置 | 估計成本 |
|------|------|----------|
| API Gateway | 2-20 副本，1 vCPU，2GB RAM | $30-150 |
| Product Service | 1-10 副本，0.5 vCPU，1GB RAM | $15-75 |
| 容器註冊表 | 基本層 | $5 |
| Application Insights | 1-2 GB/月 | $5-10 |
| 日誌分析 | 1 GB/月 | $3 |
| **總計** | | **$58-243/月** |

**按使用情況的成本分解**：
- **輕流量**（測試/學習）：約 $60/月
- **中等流量**（小型生產）：約 $120/月
- **高流量**（繁忙時段）：約 $240/月

### 成本優化提示

1. **開發時擴展至零**：
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **使用 Cosmos DB 的消耗計劃**（當您添加它時）：
   - 只需支付使用量
   - 無最低收費

3. **設置 Application Insights 取樣**：
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // 抽樣50%的請求
   ```

4. **不需要時清理**：
   ```bash
   azd down
   ```

### 免費層選項
為學習/測試考慮：
- 使用 Azure 免費額度（首30天）
- 保持最低副本數量
- 測試後刪除（避免持續收費）

---

## 清理

為避免持續收費，請刪除所有資源：

```bash
azd down --force --purge
```

**確認提示**：
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

輸入 `y` 以確認。

**刪除內容**：
- Container Apps 環境
- 兩個 Container Apps（gateway 和 product service）
- Container Registry
- Application Insights
- Log Analytics Workspace
- Resource Group

**✓ 驗證清理**：
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

應返回空結果。

---

## 擴展指南：從2個服務到5個以上

掌握了這個2服務架構後，以下是擴展方法：

### 第一階段：新增數據庫持久化（下一步）

**為 Product Service 添加 Cosmos DB**：

1. 建立 `infra/core/cosmos.bicep`：
   ```bicep
   resource cosmosAccount 'Microsoft.DocumentDB/databaseAccounts@2023-04-15' = {
     name: name
     location: location
     kind: 'GlobalDocumentDB'
     properties: {
       databaseAccountOfferType: 'Standard'
       locations: [{ locationName: location, failoverPriority: 0 }]
     }
   }
   ```

2. 更新 Product Service 使用 Cosmos DB 替代內存數據

3. 預估額外成本：約 $25/月（無伺服器模式）

### 第二階段：新增第三個服務（訂單管理）

**建立 Order Service**：

1. 新增資料夾：`src/order-service/`（Python/Node.js/C#）
2. 新增 Bicep 文件：`infra/app/order-service.bicep`
3. 更新 API Gateway 路由 `/api/orders`
4. 添加 Azure SQL Database 用於訂單持久化

**架構變為**：
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### 第三階段：新增異步通信（Service Bus）

**實現事件驅動架構**：

1. 添加 Azure Service Bus：`infra/core/servicebus.bicep`
2. Product Service 發佈 "ProductCreated" 事件
3. Order Service 訂閱產品事件
4. 添加 Notification Service 處理事件

**模式**：請求/回應（HTTP）+ 事件驅動（Service Bus）

### 第四階段：新增用戶身份驗證

**實現 User Service**：

1. 建立 `src/user-service/`（Go/Node.js）
2. 添加 Azure AD B2C 或自定義 JWT 身份驗證
3. API Gateway 驗證令牌
4. 服務檢查用戶權限

### 第五階段：生產準備

**添加以下組件**：
- Azure Front Door（全球負載均衡）
- Azure Key Vault（密鑰管理）
- Azure Monitor Workbooks（自定義儀表板）
- CI/CD Pipeline（GitHub Actions）
- 藍綠部署
- 為所有服務設置 Managed Identity

**完整生產架構成本**：約 $300-1,400/月

---

## 了解更多

### 相關文件
- [Azure Container Apps 文件](https://learn.microsoft.com/azure/container-apps/)
- [微服務架構指南](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [分佈式追蹤的 Application Insights](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Azure Developer CLI 文件](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### 本課程的下一步
- ← 上一章：[簡單 Flask API](../../../../../examples/container-app/simple-flask-api) - 初學者單容器範例
- → 下一章：[AI 集成指南](../../../../../examples/docs/ai-foundry) - 添加 AI 功能
- 🏠 [課程首頁](../../README.md)

### 比較：何時使用哪種架構

**單一 Container App**（簡單 Flask API 範例）：
- ✅ 簡單應用
- ✅ 單體架構
- ✅ 快速部署
- ❌ 可擴展性有限
- **成本**：約 $15-50/月

**微服務**（本範例）：
- ✅ 複雜應用
- ✅ 每個服務獨立擴展
- ✅ 團隊自主性（不同服務由不同團隊管理）
- ❌ 管理更複雜
- **成本**：約 $60-250/月

**Kubernetes (AKS)**：
- ✅ 最大的控制和靈活性
- ✅ 多雲可移植性
- ✅ 高級網絡功能
- ❌ 需要 Kubernetes 專業知識
- **成本**：最低約 $150-500/月

**建議**：從 Container Apps（本範例）開始，只有在需要 Kubernetes 特定功能時才轉向 AKS。

---

## 常見問題

**問：為什麼只有2個服務而不是5個以上？**  
答：教育進程。先用簡單範例掌握基礎（服務通信、監控、擴展），再增加複雜性。你在這裡學到的模式適用於100個服務的架構。

**問：我可以自己添加更多服務嗎？**  
答：當然可以！按照上面的擴展指南。每個新服務都遵循相同模式：建立 src 資料夾，建立 Bicep 文件，更新 azure.yaml，部署。

**問：這是生產就緒的嗎？**  
答：這是一個穩固的基礎。要進入生產環境，需添加：Managed Identity、Key Vault、持久性數據庫、CI/CD Pipeline、監控警報和備份策略。

**問：為什麼不使用 Dapr 或其他服務網格？**  
答：為學習保持簡單。一旦你理解了原生 Container Apps 網絡，可以在高級場景中添加 Dapr。

**問：如何在本地進行調試？**  
答：使用 Docker 在本地運行服務：
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**問：我可以使用不同的編程語言嗎？**  
答：可以！本範例展示了 Node.js（gateway）+ Python（product service）。你可以混合任何能在容器中運行的語言。

**問：如果我沒有 Azure 額度怎麼辦？**  
答：使用 Azure 免費層（新帳戶首30天）或僅部署短期測試並立即刪除。

---

> **🎓 學習路徑摘要**：你已學會部署多服務架構，包括自動擴展、內部網絡、集中監控和生產就緒模式。這個基礎為你準備了複雜的分佈式系統和企業微服務架構。

**📚 課程導航**：
- ← 上一章：[簡單 Flask API](../../../../../examples/container-app/simple-flask-api)
- → 下一章：[數據庫集成範例](../../../../../examples/database-app)
- 🏠 [課程首頁](../../README.md)
- 📖 [Container Apps 最佳實踐](../../docs/deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
此文件已使用人工智能翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們致力於提供準確的翻譯，請注意自動翻譯可能包含錯誤或不準確之處。原始語言的文件應被視為權威來源。對於重要資訊，建議尋求專業人工翻譯。我們對因使用此翻譯而引起的任何誤解或誤釋不承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->