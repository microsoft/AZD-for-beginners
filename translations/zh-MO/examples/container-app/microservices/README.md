# 微服務架構 - Container App 範例

⏱️ **預計時間**：25-35 分鐘 | 💰 **預估成本**：~$50-100/月 | ⭐ **複雜度**：進階

一個 **簡化但可運作** 的微服務架構，使用 AZD CLI 部署到 Azure Container Apps。此範例示範服務間通訊、容器協調與監控，採用實用的 2 個服務設定。

> **📚 學習方式**：此範例從最小的 2 服務架構（API Gateway + 後端服務）開始，您可以實際部署並學習。掌握基礎後，我們會提供擴展到完整微服務生態系統的指引。

## 您將學到的內容

完成此範例後，您將能：
- 將多個容器部署到 Azure Container Apps
- 實作服務間透過內部網路的通訊
- 設定以環境為基礎的縮放與健康檢查
- 使用 Application Insights 監控分散式應用程式
- 了解微服務部署模式與最佳實務
- 學會從簡單到複雜架構的漸進擴展

## 架構

### 階段 1：我們將建置的內容（包含於此範例）

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

**為何從簡單開始？**
- ✅ 快速部署並理解（25-35 分鐘）
- ✅ 在不增加複雜度下學習核心微服務模式
- ✅ 可修改與實驗的可運作程式碼
- ✅ 學習成本較低（~$50-100/月 vs $300-1400/月）
- ✅ 在加入資料庫與訊息佇列前建立信心

**類比**：把這想像成學開車。先在空蕩的停車場（2 個服務）開始，掌握基本後，再進入市區交通（5+ 個服務並搭配資料庫）。

### 階段 2：未來擴展（參考架構）

一旦您掌握 2 服務架構，就可以擴展到：

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

請參閱文件結尾的「Expansion Guide」章節以獲得逐步說明。

## 包含的功能

✅ **服務發現**：容器之間自動的 DNS 基礎發現  
✅ **負載平衡**：跨複本的內建負載平衡  
✅ **自動縮放**：依服務基於 HTTP 請求獨立縮放  
✅ **健康監控**：兩個服務的 Liveness 與 Readiness 探針  
✅ **分散式記錄**：使用 Application Insights 的集中式紀錄  
✅ **內部網路**：安全的服務到服務通訊  
✅ **容器協調**：自動化部署與縮放  
✅ **零停機更新**：具修訂管理的滾動更新  

## 前置需求

### 所需工具

開始之前，請確認您已安裝下列工具：

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)**（版本 1.0.0 或以上）
   ```bash
   azd version
   # 預期輸出：azd 版本 1.0.0 或更高
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)**（版本 2.50.0 或以上）
   ```bash
   az --version
   # 預期輸出：azure-cli 2.50.0 或更高版本
   ```

3. **[Docker](https://www.docker.com/get-started)**（用於本地開發/測試 - 選用）
   ```bash
   docker --version
   # 預期輸出：Docker 版本 20.10 或以上
   ```

### Azure 要求

- 一個有效的 **Azure 訂閱**（[建立免費帳戶](https://azure.microsoft.com/free/)）
- 在您的訂閱中建立資源的權限
- 在訂閱或資源群組擁有 **Contributor** 角色

### 知識前提

這是 **進階** 範例。您應該已具備：
- 已完成 [Simple Flask API example](../../../../../examples/container-app/simple-flask-api)  
- 對微服務架構有基本了解
- 熟悉 REST API 與 HTTP
- 了解容器概念

**第一次接觸 Container Apps？** 建議先從 [Simple Flask API example](../../../../../examples/container-app/simple-flask-api) 開始學習基礎。

## 快速開始（逐步說明）

### 步驟 1：Clone 並切換目錄

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ 成功檢查**：確認看到 `azure.yaml`：
```bash
ls
# 預期: README.md, azure.yaml, infra/, src/
```

### 步驟 2：使用 Azure 驗證

```bash
azd auth login
```

這會在您的瀏覽器開啟 Azure 驗證頁面。使用您的 Azure 帳號登入。

**✓ 成功檢查**：您應該會看到：
```
Logged in to Azure.
```

### 步驟 3：初始化環境

```bash
azd init
```

**您會看到的提示**：
- **Environment name**：輸入一個短名稱（例如 `microservices-dev`）
- **Azure subscription**：選擇您的訂閱
- **Azure location**：選擇區域（例如 `eastus`, `westeurope`）

**✓ 成功檢查**：您應該會看到：
```
SUCCESS: New project initialized!
```

### 步驟 4：部署基礎設施與服務

```bash
azd up
```

**會發生的事**（耗時 8-12 分鐘）：
1. 建立 Container Apps 環境
2. 建立用於監控的 Application Insights
3. 建置 API Gateway 容器（Node.js）
4. 建置 Product Service 容器（Python）
5. 將兩個容器部署到 Azure
6. 設定網路與健康檢查
7. 設定監控與記錄

**✓ 成功檢查**：您應該會看到：
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ 時間**：8-12 分鐘

### 步驟 5：測試部署結果

```bash
# 取得閘道端點
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# 測試 API 閘道的健康狀態
curl $GATEWAY_URL/health

# 預期輸出:
# {"status":"健康","service":"API 閘道","timestamp":"2025-11-19T10:30:00Z"}
```

**透過 gateway 測試 product service**：
```bash
# 列出產品
curl $GATEWAY_URL/api/products

# 預期輸出：
# [
#   {"id":1,"name":"Laptop","price":999.99,"stock":50},
#   {"id":2,"name":"Mouse","price":29.99,"stock":200},
#   {"id":3,"name":"Keyboard","price":79.99,"stock":150}
# ]
```

**✓ 成功檢查**：兩個端點均回傳 JSON 資料且無錯誤。

---

**🎉 恭喜！** 您已將微服務架構部署到 Azure！

## 專案結構

所有實作檔案皆包含在內—這是一個完整且可運作的範例：

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

**各組件功能說明：**

**Infrastructure (infra/)**：
- `main.bicep`：協調所有 Azure 資源與其相依性
- `core/container-apps-environment.bicep`：建立 Container Apps 環境與 Azure Container Registry
- `core/monitor.bicep`：設定 Application Insights 以利分散式紀錄
- `app/*.bicep`：個別 container app 定義，包含縮放與健康檢查

**API Gateway (src/api-gateway/)**：
- 對外的服務，將請求導向後端服務
- 實作記錄、錯誤處理與請求轉發
- 示範服務到服務的 HTTP 通訊

**Product Service (src/product-service/)**：
- 內部服務，管理記憶體中的產品目錄（簡化示範）
- 提供帶有健康檢查的 REST API
- 範例後端微服務模式

## 服務概覽

### API Gateway (Node.js/Express)

**Port**：8080  
**存取方式**：對外公開（外部 ingress）  
**用途**：將進來的請求導向相對應的後端服務  

**Endpoints**：
- `GET /` - 服務資訊
- `GET /health` - 健康檢查端點
- `GET /api/products` - 轉發到 product service（列出全部）
- `GET /api/products/:id` - 轉發到 product service（依 ID 取得）

**主要功能**：
- 使用 axios 的請求路由
- 集中式記錄
- 錯誤處理與逾時管理
- 透過環境變數進行服務發現
- Application Insights 整合

**程式碼重點**（`src/api-gateway/app.js`）：
```javascript
// 內部服務通訊
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Product Service (Python/Flask)

**Port**：8000  
**存取方式**：僅內部（無外部 ingress）  
**用途**：以記憶體資料管理產品目錄  

**Endpoints**：
- `GET /` - 服務資訊
- `GET /health` - 健康檢查端點
- `GET /products` - 列出所有產品
- `GET /products/<id>` - 依 ID 取得產品

**主要功能**：
- 使用 Flask 的 RESTful API
- 記憶體型產品儲存（簡單示範，無需資料庫）
- 使用探針進行健康監控
- 結構化記錄
- Application Insights 整合

**資料模型**：
```python
{
  "id": 1,
  "name": "Laptop",
  "description": "High-performance laptop",
  "price": 999.99,
  "stock": 50
}
```

**為何僅限內部？**
Product service 不對外暴露。所有請求必須經由 API Gateway，API Gateway 提供：
- 安全性：受控的存取點
- 靈活性：可在不影響用戶端的情況下更改後端
- 監控：集中請求記錄

## 了解服務通訊

### 服務如何互相通訊

在此範例中，API Gateway 使用 **內部 HTTP 呼叫** 與 Product Service 通訊：

```javascript
// API 閘道 (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// 發出內部 HTTP 請求
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**重點說明**：

1. **基於 DNS 的服務發現**：Container Apps 自動提供內部服務的 DNS
   - Product Service FQDN: `product-service.internal.<environment>.azurecontainerapps.io`
   - 簡化為：`http://product-service`（Container Apps 會解析它）

2. **不對外公開**：Product Service 在 Bicep 中設定 `external: false`
   - 僅可在 Container Apps 環境內存取
   - 不能從網際網路直接存取

3. **環境變數**：服務 URL 在部署時注入
   - Bicep 將內部 FQDN 傳給 gateway
   - 應用程式程式碼中沒有硬編碼的 URL

**類比**：把這想像成辦公室房間。API Gateway 是接待櫃檯（對外），而 Product Service 是辦公室房間（僅內部）。訪客必須先經接待才能到達任何辦公室。

## 部署選項

### 完整部署（建議）

```bash
# 部署基礎設施和兩個服務
azd up
```

此部署會包含：
1. Container Apps 環境
2. Application Insights
3. Container Registry
4. API Gateway 容器
5. Product Service 容器

**時間**：8-12 分鐘

### 部署單一服務

```bash
# 只部署一個服務（在初次執行 azd up 後）
azd deploy api-gateway

# 或部署產品服務
azd deploy product-service
```

**使用情境**：當您更新某個服務的程式碼並只想重新部署該服務時。

### 更新設定

```bash
# 調整擴展參數
azd env set GATEWAY_MAX_REPLICAS 30

# 使用新配置重新部署
azd up
```

## 設定

### 縮放設定

兩個服務在其 Bicep 檔案中皆以 HTTP 為基礎設定自動縮放：

**API Gateway**：
- 最少複本數：2（為可用性至少保持 2 個）
- 最大複本數：20
- 縮放觸發：每個複本 50 個併發請求

**Product Service**：
- 最少複本數：1（必要時可縮放到零）
- 最大複本數：10
- 縮放觸發：每個複本 100 個併發請求

**自訂縮放**（在 `infra/app/*.bicep`）：
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

### 資源配置

**API Gateway**：
- CPU：1.0 vCPU
- 記憶體：2 GiB
- 原因：處理所有外部流量

**Product Service**：
- CPU：0.5 vCPU
- 記憶體：1 GiB
- 原因：輕量級的記憶體操作

### 健康檢查

兩個服務皆包含 liveness 與 readiness 探針：

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

**這代表什麼**：
- **Liveness**：若健康檢查失敗，Container Apps 會重新啟動容器
- **Readiness**：若尚未就緒，Container Apps 會停止將流量導向該複本



## 監控與可觀測性

### 檢視服務日誌

```bash
# 使用 azd monitor 檢視日誌
azd monitor --logs

# 或使用 Azure CLI 檢視特定的 Container Apps：
# 從 API Gateway 串流日誌
az containerapp logs show --name api-gateway --resource-group $RG_NAME --follow

# 檢視最近的產品服務日誌
az containerapp logs show --name product-service --resource-group $RG_NAME --tail 100
```

**預期輸出**：
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Application Insights 查詢

在 Azure 入口網站中存取 Application Insights，然後執行下列查詢：

**尋找慢速請求**：
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**追蹤服務到服務的呼叫**：
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

**各服務的錯誤率**：
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

**一段時間內的請求量**：
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### 存取監控儀表板

```bash
# 取得 Application Insights 的詳細資料
azd env get-values | grep APPLICATIONINSIGHTS

# 開啟 Azure 入口網站的監控
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### 即時指標

1. 前往 Azure 入口網站中的 Application Insights
2. 點選「Live Metrics」
3. 檢視即時的請求、失敗與效能
4. 透過執行：`curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products` 進行測試

## 實作練習

[注意：請參閱上方「Practical Exercises」章節中的完整練習，內含逐步的實作練習，包括部署驗證、資料修改、自動縮放測試、錯誤處理，以及新增第三個服務。]

## 成本分析

### 預估每月費用（本 2 服務範例）

| Resource | Configuration | Estimated Cost |
|----------|--------------|----------------|
| API Gateway | 2-20 replicas, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 replicas, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Basic tier | $5 |
| Application Insights | 1-2 GB/month | $5-10 |
| Log Analytics | 1 GB/month | $3 |
| **Total** | | **$58-243/month** |

**依使用情況之成本細目**：
- **輕度流量**（測試/學習）：~$60/月
- **中度流量**（小型生產）：~$120/月
- **高流量**（繁忙時段）：~$240/月

### 成本優化建議

1. **開發時縮放到零**：
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **在加入 Cosmos DB 時使用 Consumption 計劃**：
   - 只為實際使用支付
   - 無最低費用

3. **設定 Application Insights 抽樣**：
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // 抽樣 50% 的請求
   ```

4. **不使用時請清理資源**：
   ```bash
   azd down
   ```

### 免費額度選項
作為學習/測試，請考慮：
- 使用 Azure 免費額度（前 30 天）
- 將副本數維持在最少
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

**會被刪除的項目**：
- Container Apps 環境
- 兩個 Container Apps（gateway 與 product service）
- Container Registry
- Application Insights
- Log Analytics Workspace
- Resource Group

**✓ 驗證清理**：
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

應該會回傳空的結果。

---

## 擴展指南：從 2 個服務到 5 個以上

一旦你掌握了這個兩服務架構，以下是擴展的方法：

### 階段 1：新增資料庫持久化（下一步）

**為產品服務新增 Cosmos DB**：

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

2. 更新產品服務，使其改為使用 Cosmos DB 而非記憶體資料

3. 估計額外成本：約 $25/月（無伺服器）

### 階段 2：新增第三個服務（訂單管理）

**建立訂單服務**：

1. 新資料夾：`src/order-service/`（Python/Node.js/C#）
2. 新 Bicep：`infra/app/order-service.bicep`
3. 更新 API Gateway，新增 /api/orders 的路由
4. 新增 Azure SQL Database 作為訂單持久化

**架構變為**：
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### 階段 3：新增非同步通訊（Service Bus）

**實作事件驅動架構**：

1. 新增 Azure Service Bus：`infra/core/servicebus.bicep`
2. 產品服務發佈「ProductCreated」事件
3. 訂單服務訂閱產品事件
4. 新增通知服務以處理事件

**模式**：Request/Response（HTTP）＋事件驅動（Service Bus）

### 階段 4：新增使用者驗證

**實作使用者服務**：

1. 建立 `src/user-service/`（Go/Node.js）
2. 新增 Azure AD B2C 或自訂 JWT 驗證
3. API Gateway 驗證令牌
4. 服務檢查使用者權限

### 階段 5：生產就緒

**新增這些元件**：
- Azure Front Door（全域負載平衡）
- Azure Key Vault（機密管理）
- Azure Monitor Workbooks（自訂儀表板）
- CI/CD 管線（GitHub Actions）
- 藍綠部署
- 為所有服務設定 Managed Identity

**完整生產架構成本**：約 $300–1,400/月

---

## 進一步學習

### 相關文件
- [Azure Container Apps Documentation](https://learn.microsoft.com/azure/container-apps/)
- [Microservices Architecture Guide](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights for Distributed Tracing](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### 本課程的下一步
- ← 上一節： [Simple Flask API](../../../../../examples/container-app/simple-flask-api) - 初學者單一容器範例
- → 下一節： [AI Integration Guide](../../../../../examples/docs/ai-foundry) - 新增 AI 功能
- 🏠 [課程首頁](../../README.md)

### 比較：何時使用哪種方案

**單一 Container App**（簡單 Flask API 範例）：
- ✅ 簡單應用程式
- ✅ 單體式架構
- ✅ 部署快速
- ❌ 可擴展性有限
- **成本**：約 $15–50/月

**微服務**（此範例）：
- ✅ 適用於複雜應用
- ✅ 各服務可獨立擴展
- ✅ 團隊自主性（不同服務可由不同團隊負責）
- ❌ 管理較為複雜
- **成本**：約 $60–250/月

**Kubernetes（AKS）**：
- ✅ 最大的控制與彈性
- ✅ 跨多雲可攜性
- ✅ 進階網路功能
- ❌ 需要 Kubernetes 專業知識
- **成本**：最低約 $150–500/月

**建議**：從 Container Apps 開始（如本範例），只有在需要 Kubernetes 特定功能時再轉移到 AKS。

---

## 常見問題

**問：為什麼只有 2 個服務，而不是 5 個以上？**  
答：循序漸進的教學方式。先用簡單範例掌握基礎（服務通訊、監控、擴展），再增加複雜性。你在這裡學到的模式也適用於 100 個服務的架構。

**問：我可以自己新增更多服務嗎？**  
答：當然可以！依照上方擴展指南操作。每個新服務遵循相同流程：建立 src 資料夾、建立 Bicep 檔案、更新 azure.yaml、部署。

**問：這能直接用於生產環境嗎？**  
答：這是一個穩固的基礎。要上線生產，建議加入：Managed Identity、Key Vault、持久化資料庫、CI/CD 管線、監控警示與備份策略。

**問：為什麼不使用 Dapr 或其他 service mesh？**  
答：為了學習方便而保持簡單。先了解 Container Apps 原生網路機制後，再視情況加入 Dapr 等進階層。

**問：如何在本機除錯？**  
答：在本機使用 Docker 執行服務：
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**問：可以使用不同的程式語言嗎？**  
答：可以！此範例示範 Node.js（gateway）＋Python（product service）。你可以混用任何能在容器中執行的語言。

**問：如果我沒有 Azure 額度怎麼辦？**  
答：使用 Azure 免費方案（新帳號前 30 天）或只部署短期測試並立即刪除。

---

> **🎓 學習路徑總結**：你已學會部署具自動擴展、內部網路、集中監控與生產就緒模式的多服務架構。這個基礎讓你能應對複雜的分散式系統與企業級微服務架構。

**📚 課程導覽：**
- ← 上一節： [Simple Flask API](../../../../../examples/container-app/simple-flask-api)
- → 下一節： [Database Integration Example](../../../../../examples/database-app)
- 🏠 [課程首頁](../../../README.md)
- 📖 [Container Apps 最佳實務](../../../docs/chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責聲明：
本文件是使用 AI 翻譯服務 Co‑op Translator (https://github.com/Azure/co-op-translator) 所翻譯。雖然我們力求準確，但請注意自動翻譯可能包含錯誤或不準確之處。原始語言的文件應被視為具權威性的版本。對於重要資訊，建議採用專業人工翻譯。我們不對因使用此翻譯而產生的任何誤解或錯誤詮釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->