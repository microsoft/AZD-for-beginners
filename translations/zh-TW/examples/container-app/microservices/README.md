# 微服務架構 - Container App 範例

⏱️ <strong>預估時間</strong>: 25-35 分鐘 | 💰 <strong>預估費用</strong>: 約 $50-100/月 | ⭐ <strong>複雜度</strong>: 進階

一個 <strong>簡化但可運作</strong> 的微服務架構，使用 AZD CLI 部署到 Azure Container Apps。此範例示範服務間通訊、容器編排與監控，採用實用的 2 服務設定。

> **📚 學習方式**: 此範例從最小的 2 服務架構（API Gateway + 後端服務）開始，您可以實際部署並學習。掌握基礎後，我們會提供擴展到完整微服務生態系的指導。

## 你將學到什麼

完成此範例後，您將能：
- 將多個容器部署到 Azure Container Apps
- 使用內部網路實作服務間通訊
- 配置基於環境的縮放和健康檢查
- 使用 Application Insights 監控分散式應用程式
- 了解微服務部署模式與最佳實務
- 學習如何從簡單逐步擴展到複雜架構

## 架構

### 階段 1：我們要建構的內容（此範例包含）

```mermaid
graph TD
    Internet[網際網路] -- HTTPS --> Gateway[API 網關<br/>Node.js 容器<br/>轉送請求<br/>健康檢查<br/>請求記錄]
    Gateway -- HTTP internal --> Product[產品服務<br/>Python 容器<br/>產品 CRUD<br/>記憶體資料庫<br/>REST API]
    Product --> Insights[應用程式洞察<br/>監控與日誌]
```
**為什麼從簡單開始？**
- ✅ 快速部署與理解（25-35 分鐘）
- ✅ 在不增加複雜性的情況下學習核心微服務模式
- ✅ 可修改與實驗的可運行程式碼
- ✅ 學習成本較低（約 $50-100/月 vs $300-1400/月）
- ✅ 在加入資料庫與訊息佇列前建立信心

<strong>類比</strong>：把這想像成學開車。你從空蕩的停車場（2 個服務）開始，掌握基礎，然後進階到市區交通（5 個以上的服務含資料庫）。

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

請參閱文件末端的「擴展指南」章節取得逐步指示。

## 包含的功能

✅ <strong>服務發現</strong>：容器間的自動 DNS 發現  
✅ <strong>負載平衡</strong>：跨複本的內建負載平衡  
✅ <strong>自動縮放</strong>：依服務獨立縮放，基於 HTTP 請求  
✅ <strong>健康監控</strong>：兩個服務的 liveness 與 readiness 探針  
✅ <strong>分散式日誌</strong>：使用 Application Insights 的集中式日誌  
✅ <strong>內部網路</strong>：安全的服務間通訊  
✅ <strong>容器編排</strong>：自動部署與縮放  
✅ <strong>零停機更新</strong>：使用修訂管理的滾動更新  

## 前置需求

### 所需工具

在開始之前，請確認已安裝以下工具：

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)**（版本 1.0.0 或更新）
   ```bash
   azd version
   # 預期輸出：azd 版本 1.0.0 或更高版本
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)**（版本 2.50.0 或更新）
   ```bash
   az --version
   # 預期輸出：azure-cli 2.50.0 或更高版本
   ```

3. **[Docker](https://www.docker.com/get-started)**（用於本地開發/測試 - 選用）
   ```bash
   docker --version
   # 預期輸出：Docker 版本 20.10 或更高版本
   ```

### Azure 要求

- 有效的 **Azure 訂閱**（[建立免費帳戶](https://azure.microsoft.com/free/)）
- 在您的訂閱中建立資源的權限
- 在訂閱或資源群組上擁有 **Contributor** 角色

### 知識前提

這是一個 <strong>進階級</strong> 的範例。您應該已經：
- 完成 [Simple Flask API example](../../../../../examples/container-app/simple-flask-api)  
- 對微服務架構有基本了解
- 熟悉 REST API 與 HTTP
- 了解容器相關概念

**不熟悉 Container Apps？** 建議先從 [Simple Flask API example](../../../../../examples/container-app/simple-flask-api) 開始以學習基礎。

## 快速開始（逐步指引）

### 第 1 步：複製並進入目錄

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ 成功檢查**：確認可以看到 `azure.yaml`：
```bash
ls
# 預期：README.md、azure.yaml、infra/、src/
```

### 第 2 步：與 Azure 驗證

```bash
azd auth login
```

這會在瀏覽器中開啟 Azure 驗證頁面。使用您的 Azure 帳戶登入。

**✓ 成功檢查**：您應該會看到：
```
Logged in to Azure.
```

### 第 3 步：初始化環境

```bash
azd init
```

<strong>您會看到的提示</strong>：
- **Environment name**：輸入一個簡短名稱（例如 `microservices-dev`）
- **Azure subscription**：選擇您的訂閱
- **Azure location**：選擇區域（例如 `eastus`, `westeurope`）

**✓ 成功檢查**：您應該會看到：
```
SUCCESS: New project initialized!
```

### 第 4 步：部署基礎架構與服務

```bash
azd up
```

<strong>會發生的事</strong>（需 8-12 分鐘）：
1. 建立 Container Apps 環境
2. 建立用於監控的 Application Insights
3. 建構 API Gateway 容器（Node.js）
4. 建構 Product Service 容器（Python）
5. 將兩個容器部署到 Azure
6. 配置網路與健康檢查
7. 設定監控與日誌

**✓ 成功檢查**：您應該會看到：
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ 時間**：8-12 分鐘

### 第 5 步：測試部署

```bash
# 取得閘道端點
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# 測試 API 閘道的健康狀態
curl $GATEWAY_URL/health

# 預期輸出：
# {"status":"healthy","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**透過 gateway 測試 product service**：
```bash
# 列出產品
curl $GATEWAY_URL/api/products

# 預期輸出:
# [
#   {"id":1,"name":"筆記型電腦","price":999.99,"stock":50},
#   {"id":2,"name":"滑鼠","price":29.99,"stock":200},
#   {"id":3,"name":"鍵盤","price":79.99,"stock":150}
# ]
```

**✓ 成功檢查**：兩個端點都回傳 JSON 資料且沒有錯誤。

---

**🎉 恭喜！** 您已將微服務架構部署到 Azure！

## 專案結構

所有實作檔案皆已包含—這是一個完整且可運行的範例：

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

**各組件說明：**

**Infrastructure (infra/)**：
- `main.bicep`: 協調所有 Azure 資源及其相依性
- `core/container-apps-environment.bicep`: 建立 Container Apps 環境與 Azure Container Registry
- `core/monitor.bicep`: 為分散式日誌設定 Application Insights
- `app/*.bicep`: 各個容器應用的定義，含縮放與健康檢查

**API Gateway (src/api-gateway/)**：
- 對外的服務，將請求路由到後端服務
- 實作日誌、錯誤處理與請求轉發
- 示範服務間的 HTTP 通訊

**Product Service (src/product-service/)**：
- 內部服務，維護產品目錄（為簡單起見採用記憶體）
- 提供 REST API 與健康檢查
- 範例後端微服務模式

## 服務概覽

### API Gateway (Node.js/Express)

**Port**: 8080  
**Access**: 對外公開（external ingress）  
<strong>目的</strong>：將傳入請求路由到適當的後端服務  

**Endpoints**:
- `GET /` - 服務資訊
- `GET /health` - 健康檢查端點
- `GET /api/products` - 轉發到 product service（列出所有）
- `GET /api/products/:id` - 轉發到 product service（依 ID 取得）

<strong>主要功能</strong>：
- 使用 axios 進行請求路由
- 集中式日誌
- 錯誤處理與超時管理
- 透過環境變數進行服務發現
- 整合 Application Insights

<strong>程式重點</strong>（`src/api-gateway/app.js`）：
```javascript
// 內部服務之間的通訊
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Product Service (Python/Flask)

**Port**: 8000  
**Access**: 僅內部可存取（無對外 ingress）  
<strong>目的</strong>：以記憶體資料管理產品目錄  

**Endpoints**:
- `GET /` - 服務資訊
- `GET /health` - 健康檢查端點
- `GET /products` - 列出所有產品
- `GET /products/<id>` - 依 ID 取得產品

<strong>主要功能</strong>：
- 使用 Flask 的 RESTful API
- 記憶體產品儲存（簡單、不需資料庫）
- 以探針進行健康監控
- 結構化日誌
- 整合 Application Insights

<strong>資料模型</strong>：
```python
{
  "id": 1,
  "name": "Laptop",
  "description": "High-performance laptop",
  "price": 999.99,
  "stock": 50
}
```

**為什麼僅限內部？**
Product service 不對外暴露。所有請求必須經由 API Gateway，API Gateway 提供：
- 安全性：受控的存取點
- 彈性：可變更後端而不影響客戶端
- 監控：集中請求日誌

## 了解服務通訊

### 服務如何互相通訊

在此範例中，API Gateway 使用 **內部 HTTP 呼叫** 與 Product Service 通訊：

```javascript
// API 網關 (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// 發出內部 HTTP 請求
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

<strong>重點說明</strong>：

1. **基於 DNS 的發現**：Container Apps 會自動為內部服務提供 DNS
   - Product Service 完整 FQDN：`product-service.internal.<environment>.azurecontainerapps.io`
   - 簡化為：`http://product-service`（Container Apps 會解析）

2. <strong>不對外公開</strong>：Product Service 在 Bicep 中設定 `external: false`
   - 僅能在 Container Apps 環境內存取
   - 無法從網際網路直接連到該服務

3. <strong>環境變數</strong>：服務 URL 在部署時注入
   - Bicep 將內部 FQDN 傳給 gateway
   - 應用程式程式碼中沒有硬編碼 URL

<strong>類比</strong>：把這想像成辦公室房間。API Gateway 是接待台（對外），Product Service 是辦公室（內部）。訪客必須先到接待台才能進入辦公室。

## 部署選項

### 完整部署（建議）

```bash
# 部署基礎設施與兩個服務
azd up
```

此部署包含：
1. Container Apps 環境
2. Application Insights
3. Container Registry
4. API Gateway 容器
5. Product Service 容器

<strong>時間</strong>：8-12 分鐘

### 部署單一服務

```bash
# 僅部署一個服務（在初次 azd up 之後）
azd deploy api-gateway

# 或部署產品服務
azd deploy product-service
```

<strong>使用情境</strong>：當您更新某一服務的程式碼，只想重新部署該服務時使用。

### 更新設定

```bash
# 變更縮放參數
azd env set GATEWAY_MAX_REPLICAS 30

# 使用新設定重新部署
azd up
```

## 設定

### 縮放設定

兩個服務在其 Bicep 檔案中都設定了基於 HTTP 的自動縮放：

**API Gateway**：
- 最少複本數：2（至少維持 2 個以確保可用性）
- 最多複本數：20
- 縮放觸發條件：每個複本 50 個併發請求

**Product Service**：
- 最少複本數：1（必要時可縮到 0）
- 最多複本數：10
- 縮放觸發條件：每個複本 100 個併發請求

<strong>客製化縮放</strong>（在 `infra/app/*.bicep`）：
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
- CPU: 1.0 vCPU
- 記憶體: 2 GiB
- 理由：處理所有外部流量

**Product Service**：
- CPU: 0.5 vCPU
- 記憶體: 1 GiB
- 理由：輕量的記憶體操作

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

<strong>這代表什麼</strong>：
- **Liveness**：若健康檢查失敗，Container Apps 會重新啟動容器
- **Readiness**：若尚未就緒，Container Apps 會停止將流量導向該複本



## 監控與可觀測性

### 檢視服務日誌

```bash
# 使用 azd monitor 檢視日誌
azd monitor --logs

# 或使用 Azure CLI 針對特定 Container Apps:
# 從 API Gateway 串流日誌
az containerapp logs show --name api-gateway --resource-group $RG_NAME --follow

# 檢視近期的產品服務日誌
az containerapp logs show --name product-service --resource-group $RG_NAME --tail 100
```

<strong>預期輸出</strong>：
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Application Insights 查詢

在 Azure 入口網站存取 Application Insights，然後執行下列查詢：

<strong>找出慢速請求</strong>：
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

<strong>追蹤服務間呼叫</strong>：
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

<strong>按服務的錯誤率</strong>：
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

<strong>一段時間內的請求量</strong>：
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

### 即時量測

1. 在 Azure 入口網站中導覽到 Application Insights
2. 點選「Live Metrics」
3. 查看即時請求、失敗與效能
4. 測試指令：`curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## 實作練習

[註：請參閱上方「實作練習」章節的完整練習，內含逐步部署驗證、資料修改、自動縮放測試、錯誤處理，以及新增第三個服務等詳細練習。]

## 成本分析

### 預估每月費用（以此 2 服務範例為例）

| Resource | Configuration | Estimated Cost |
|----------|--------------|----------------|
| API Gateway | 2-20 replicas, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 replicas, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Basic tier | $5 |
| Application Insights | 1-2 GB/month | $5-10 |
| Log Analytics | 1 GB/month | $3 |
| **Total** | | **$58-243/month** |

<strong>按使用量的費用細項</strong>：
- <strong>輕量流量</strong>（測試/學習）：約 $60/月
- <strong>中等流量</strong>（小型生產）：約 $120/月
- <strong>高流量</strong>（忙碌時段）：約 $240/月

### 成本優化建議

1. <strong>開發環境縮放到零</strong>：
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **新增 Cosmos DB 時使用消耗計畫**：
   - 僅為您使用的量付費
   - 無最低收費

3. **設定 Application Insights 取樣**：
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // 對 50% 的請求進行抽樣
   ```

4. <strong>不需要時清理資源</strong>：
   ```bash
   azd down
   ```

### 免費方案選項

供學習/測試考慮：
- 使用 Azure 免費額度（前 30 天）
- 保持最小副本數
- 測試後刪除（避免持續產生費用）

---

## 清理

為避免持續產生費用，請刪除所有資源：

```bash
azd down --force --purge
```

<strong>確認提示</strong>：
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

輸入 `y` 以確認。

<strong>將被刪除的項目</strong>：
- Container Apps 環境
- 兩個 Container Apps（gateway 與 product service）
- Container Registry（容器註冊表）
- Application Insights
- Log Analytics 工作區
- Resource Group（資源群組）

**✓ 驗證清理**：
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

應該會回傳空的。

---

## 擴充指南：從 2 個服務到 5 個以上

一旦你掌握了這個 2 服務架構，以下是如何擴充：

### 階段 1：加入資料庫持久性（下一步）

**為 product service 新增 Cosmos DB**：

1. Create `infra/core/cosmos.bicep`：
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

2. 更新 product service，使其使用 Cosmos DB 取代記憶體資料

3. 預估額外成本：約 $25/月（無伺服器）

### 階段 2：新增第三個服務（訂單管理）

**建立 Order Service**：

1. 新資料夾：`src/order-service/`（Python/Node.js/C#）
2. 新的 Bicep：`infra/app/order-service.bicep`
3. 更新 API Gateway，路由至 `/api/orders`
4. 新增 Azure SQL Database 作為訂單持久層

<strong>架構變更</strong>：
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### 階段 3：新增非同步通訊（Service Bus）

<strong>實作事件驅動架構</strong>：

1. 新增 Azure Service Bus：`infra/core/servicebus.bicep`
2. Product Service 發佈「ProductCreated」事件
3. Order Service 訂閱產品事件
4. 新增 Notification Service 來處理事件

<strong>模式</strong>：請求/回應（HTTP）+ 事件驅動（Service Bus）

### 階段 4：加入使用者驗證

<strong>實作使用者服務</strong>：

1. 建立 `src/user-service/`（Go/Node.js）
2. 新增 Azure AD B2C 或 自訂 JWT 驗證
3. API Gateway 驗證令牌
4. 各服務檢查使用者權限

### 階段 5：生產準備

<strong>新增這些元件</strong>:
- Azure Front Door（全球負載平衡）
- Azure Key Vault（機密管理）
- Azure Monitor Workbooks（自訂儀表板）
- CI/CD 管線（GitHub Actions）
- 藍綠部署
- 為所有服務啟用 Managed Identity（受管身分）

<strong>完整生產架構成本</strong>：約 $300-1,400/月

---

## 進一步學習

### 相關文件
- [Azure Container Apps 文件](https://learn.microsoft.com/azure/container-apps/)
- [微服務架構指南](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [用於分散式追蹤的 Application Insights](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Azure Developer CLI 文件](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### 本課程的下一步
- ← 上一章： [Simple Flask API](../../../../../examples/container-app/simple-flask-api) - 初學者單容器範例
- → 下一章： [AI 整合指南](../../../../../examples/docs/ai-foundry) - 新增 AI 能力
- 🏠 [課程首頁](../../README.md)

### 比較：何時使用何者

**單一 Container App**（Simple Flask API 範例）：
- ✅ 適合簡單應用程式
- ✅ 單體架構
- ✅ 部署快速
- ❌ 可擴充性有限
- <strong>成本</strong>：約 $15-50/月

<strong>微服務</strong>（本範例）：
- ✅ 適合複雜應用程式
- ✅ 各服務可獨立擴展
- ✅ 團隊自主（不同服務可由不同團隊負責）
- ❌ 管理上更複雜
- <strong>成本</strong>：約 $60-250/月

**Kubernetes（AKS）**：
- ✅ 最大的控制性與彈性
- ✅ 跨雲可攜性
- ✅ 進階網路功能
- ❌ 需要 Kubernetes 專業知識
- <strong>成本</strong>：最低約 $150-500/月

<strong>建議</strong>：從 Container Apps（本範例）開始，僅在需要 Kubernetes 特定功能時再遷移至 AKS。

---

## 常見問題

**Q: 為什麼只使用 2 個服務，而不是 5 個以上？**  
A: 以教學進度為主。在加入更多複雜度之前，先用簡單範例掌握基礎（服務通訊、監控、擴展）。在這裡學到的模式同樣適用於 100 個服務的架構。

**Q: 我可以自己新增更多服務嗎？**  
A: 當然可以！遵循上方的擴充指南。每個新服務遵循相同模式：建立 src 資料夾、建立 Bicep 檔案、更新 azure.yaml、部署。

**Q: 這個準備好可以用於生產環境了嗎？**  
A: 它是一個穩健的基礎。為生產環境加入：Managed Identity（受管身分）、Key Vault、持久化資料庫、CI/CD 管線、監控警示，以及備份策略。

**Q: 為什麼不使用 Dapr 或其他 service mesh？**  
A: 為學習而保持簡單。當你了解原生 Container Apps 的網路後，可以再針對進階情境加入 Dapr。

**Q: 我如何在本機進行除錯？**  
A: 在本機使用 Docker 執行服務：
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**Q: 我可以使用不同的程式語言嗎？**  
A: 可以！本範例示範 Node.js（gateway）+ Python（product service）。你可以混合任何能在容器中執行的語言。

**Q: 如果我沒有 Azure 額度怎麼辦？**  
A: 使用 Azure 免費方案（新帳號前 30 天），或在短期測試期間部署並立即刪除。

---

> **🎓 學習路徑摘要**：你已學會部署多服務架構，具自動調整、內部網路、集中式監控與生產就緒模式。這個基礎可讓你準備好面對複雜的分散式系統與企業微服務架構。

**📚 課程導航：**
- ← 上一章： [Simple Flask API](../../../../../examples/container-app/simple-flask-api)
- → 下一章： [資料庫整合範例](../../../../../examples/database-app)
- 🏠 [課程首頁](../../../README.md)
- 📖 [Container Apps 最佳實務](../../../docs/chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們力求準確，但請注意自動翻譯可能包含錯誤或不準確之處。原始語言版本之文件應視為具權威性的來源。若為關鍵資訊，建議採用專業人工翻譯。我們不對因使用此翻譯而產生的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->