# 微服務架構 - Container App 範例

⏱️ **預計時間**: 25-35 分鐘 | 💰 **預估費用**: ~$50-100/月 | ⭐ **難度**: 進階

一個**簡化但功能完整**的微服務架構，使用 AZD CLI 部署到 Azure Container Apps。此範例示範服務間通訊、容器編排及監控，搭建一個實用的雙服務架構。

> **📚 學習方式**：此範例從最小的雙服務架構（API Gateway + 後端服務）開始，實際部署並學習。掌握基礎後，我們將指導如何擴展成完整的微服務生態系統。

## 您將學習到什麼

完成此範例後，您將能：
- 部署多個容器到 Azure Container Apps
- 實作服務間通訊的內部網路
- 設定基於環境的自動擴展與健康檢查
- 使用 Application Insights 監控分散式應用程式
- 了解微服務部署模式與最佳實踐
- 從簡單到複雜架構的漸進式擴充

## 架構

### 第一階段：我們正在建構的（本範例內容）

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
- ✅ 快速部署與理解（25-35 分鐘）
- ✅ 學習核心微服務模式，無複雜度阻礙
- ✅ 可修改及實驗的可用程式碼
- ✅ 學習成本低（約 $50-100/月，低於 $300-1400/月）
- ✅ 實戰前建立信心，方便日後加資料庫和訊息佇列

**比喻**：就像學開車，從空車場（2 服務）開始，熟悉基礎後再進入市區交通（5+ 服務含資料庫）。

### 第二階段：未來擴充（參考架構）

當掌握雙服務架構後，可擴充成：

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

詳見章節末尾的「擴充指南」提供逐步指引。

## 本範例功能

✅ **服務發現**：容器間自動 DNS 探索  
✅ **負載平衡**：複本間內建負載平衡  
✅ **自動擴縮**：依 HTTP 請求獨立擴展每個服務  
✅ **健康監測**：Liveness 與 Readiness 探測  
✅ **分散式日誌**：中央式 Application Insights 日誌  
✅ **內部網路**：安全的服務間通訊  
✅ **容器編排**：自動部署與擴容  
✅ **零停機更新**：滾動更新與版本管理  

## 前置需求

### 需要工具

開始前請確認安裝：

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (版本 1.0.0 或以上)
   ```bash
   azd version
   # 預期輸出：azd 版本 1.0.0 或以上
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (版本 2.50.0 或以上)
   ```bash
   az --version
   # 預期輸出：azure-cli 2.50.0 或以上版本
   ```

3. **[Docker](https://www.docker.com/get-started)** (用於本地開發/測試 - 選用)
   ```bash
   docker --version
   # 預期輸出：Docker 版本 20.10 或以上
   ```

### Azure 要求

- 有效的 **Azure 訂閱** ([免費帳號申請](https://azure.microsoft.com/free/))
- 能在訂閱中建立資源的權限
- 訂閱或資源群組擁有 **Contributor** 角色

### 知識需求

此為 **進階例子**，您應具備：
- 完成 [Simple Flask API 範例](../../../../../examples/container-app/simple-flask-api)
- 基本微服務架構概念
- 熟悉 REST API 與 HTTP
- 了解容器基礎概念

**Container Apps 新手？** 建議先從 [Simple Flask API 範例](../../../../../examples/container-app/simple-flask-api) 學起。

## 快速開始 (步驟指引)

### 步驟 1：複製與切換目錄

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ 成功檢查**：確認能看到 `azure.yaml`：
```bash
ls
# 預期：README.md、azure.yaml、infra/、src/
```

### 步驟 2：Azure 身分驗證

```bash
azd auth login
```

會開啟瀏覽器進行 Azure 登入，輸入 Azure 帳號密碼。

**✓ 成功檢查**：您會看到：
```
Logged in to Azure.
```

### 步驟 3：初始化環境

```bash
azd init
```

**會詢問**：
- **環境名稱**：輸入簡短名稱（例：`microservices-dev`）
- **Azure 訂閱**：選擇訂閱
- **Azure 區域**：選擇區域（例：`eastus`、`westeurope`）

**✓ 成功檢查**：顯示：
```
SUCCESS: New project initialized!
```

### 步驟 4：部署基礎架構與服務

```bash
azd up
```

**過程（約8-12分鐘）**：
1. 建立 Container Apps 環境
2. 部署 Application Insights 監控
3. 建置 API Gateway 容器 (Node.js)
4. 建置產品服務容器 (Python)
5. 部署容器至 Azure
6. 設定網路與健康檢查
7. 設定監控與日誌

**✓ 成功檢查**：顯示：
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ 時間**：8-12 分鐘

### 步驟 5：測試部署結果

```bash
# 獲取閘道端點
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# 測試 API Gateway 健康狀況
curl $GATEWAY_URL/health

# 預期輸出：
# {"status":"healthy","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**透過 Gateway 測試產品服務**：
```bash
# 列出產品
curl $GATEWAY_URL/api/products

# 預期輸出：
# [
#   {"id":1,"name":"筆記本電腦","price":999.99,"stock":50},
#   {"id":2,"name":"滑鼠","price":29.99,"stock":200},
#   {"id":3,"name":"鍵盤","price":79.99,"stock":150}
# ]
```

**✓ 成功檢查**：兩端點都回傳 JSON 資料且無錯誤。

---

**🎉 恭喜！** 您已成功部署微服務架構到 Azure！

## 專案結構

包含所有實作檔案—完整可用範例：

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

**各元件說明：**

**基礎架構 (infra/)**：
- `main.bicep`：統籌所有 Azure 資源及依賴
- `core/container-apps-environment.bicep`：建置 Container Apps 環境與 Azure 容器註冊表
- `core/monitor.bicep`：設定 Application Insights 分佈式日誌
- `app/*.bicep`：各個容器應用設定，含擴縮與健康檢查

**API Gateway (src/api-gateway/)**：
- 公開服務，路由請求至後端服務
- 實作日誌、錯誤處理與請求轉發
- 範例展示服務間 HTTP 呼叫

**產品服務 (src/product-service/)**：
- 內部服務，含產品目錄（簡化為記憶體資料）
- 提供 REST API 及健康檢查
- 後端微服務設計範例

## 服務概覽

### API Gateway (Node.js/Express)

**埠口**：8080  
**存取**：公開（外部入口）  
**用途**：路由請求至相對應後端服務  

**端點**：
- `GET /` - 取得服務資訊
- `GET /health` - 健康檢查
- `GET /api/products` - 轉發到產品服務（列出所有）
- `GET /api/products/:id` - 轉發到產品服務（以 ID 查詢）

**主要功能**：
- 使用 axios 進行請求路由
- 集中式日誌
- 錯誤與逾時處理
- 使用環境變數服務發現
- 集成 Application Insights

**程式重點** (`src/api-gateway/app.js`)：
```javascript
// 內部服務通訊
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### 產品服務 (Python/Flask)

**埠口**：8000  
**存取**：僅內部（無公開入口）  
**用途**：管理產品目錄，資料存在記憶體  

**端點**：
- `GET /` - 服務資訊
- `GET /health` - 健康檢查
- `GET /products` - 列出所有產品
- `GET /products/<id>` - 根據 ID 取得產品

**主要功能**：
- 使用 Flask 實作 RESTful API
- 記憶體產品存儲（簡單無需資料庫）
- 健康檢查探針
- 結構化日誌
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

**為何限內部？**
產品服務不公開，所有請求都必須透過 API Gateway，提供：
- 安全性：唯一控管入口
- 彈性：可隨時修改後端服務，不影響客戶端
- 監控：集中式請求日誌

## 服務間通訊理解

### 服務間如何對話

此範例中，API Gateway 透過**內部 HTTP 呼叫**與產品服務通訊：

```javascript
// API 閘道器 (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// 發出內部 HTTP 請求
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**重點**：

1. **基於 DNS 發現**：Container Apps 自動提供內部服務的 DNS  
   - 產品服務完整域名：`product-service.internal.<environment>.azurecontainerapps.io`  
   - 簡化為：`http://product-service`（Container Apps 解析）  

2. **無公開曝露**：產品服務 Bicep 設為 `external: false`  
   - 只能在 Container Apps 環境內存取  
   - 網際網路無法直接連線  

3. **環境變數注入**：部署時注入服務 URL  
   - Bicep 把內部 FQDN 傳給 gateway  
   - 程式碼內不硬編網址  

**比喻**：好比辦公室，API Gateway 是接待櫃檯（對外），產品服務是辦公室內部空間，訪客必須先從接待進入。

## 部署選項

### 完整部署（建議）

```bash
# 部署基礎設施及兩個服務
azd up
```

部署：
1. Container Apps 環境  
2. Application Insights  
3. 容器註冊表  
4. API Gateway 容器  
5. 產品服務容器  

**時間**：8-12 分鐘

### 單一服務部署

```bash
# 只部署一個服務（在初始 azd up 後）
azd deploy api-gateway

# 或部署產品服務
azd deploy product-service
```

**用例**：當只更新單一服務的程式碼時，僅重新部署該服務。

### 更新設定

```bash
# 更改縮放參數
azd env set GATEWAY_MAX_REPLICAS 30

# 以新配置重新部署
azd up
```

## 設定說明

### 擴縮設定

兩個服務均在 Bicep 檔案中配置基於 HTTP 的自動擴縮：

**API Gateway**：
- 最小複本數：2（確保可用性，至少兩個複本）
- 最大複本數：20
- 擴縮觸發條件：每複本 50 個同時請求

**產品服務**：
- 最小複本數：1（可擴縮到 0）
- 最大複本數：10
- 擴縮觸發條件：每複本 100 個同時請求

**可自訂擴縮設定**（在 `infra/app/*.bicep`）：
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
- 理由：處理所有外部流量

**產品服務**：
- CPU：0.5 vCPU  
- 記憶體：1 GiB  
- 理由：輕量級記憶體操作

### 健康檢查

兩服務均包含 liveness 與 readiness 探針：

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

**意義**：
- **Liveness**：健康檢查失敗時，Container Apps 會重啟容器  
- **Readiness**：未準備好時，Container Apps 不會將流量導向該複本  

## 監控與可觀察性

### 查看服務日誌

```bash
# 使用 azd monitor 查看日誌
azd monitor --logs

# 或使用 Azure CLI 查看特定的容器應用程式：
# 從 API Gateway 串流日誌
az containerapp logs show --name api-gateway --resource-group $RG_NAME --follow

# 查看近期產品服務日誌
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

於 Azure 入口網站的 Application Insights 中執行以下查詢：

**尋找慢請求**：
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**追蹤服務間呼叫**：
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

**依服務計算錯誤率**：
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

**隨時間變化的請求量**：
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### 存取監控儀表板

```bash
# 取得 Application Insights 詳情
azd env get-values | grep APPLICATIONINSIGHTS

# 開啟 Azure 入口網站監控
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### 即時指標

1. 在 Azure 入口網站開啟 Application Insights  
2. 點選「即時指標」  
3. 觀看即時請求、失敗及效能  
4. 可透過執行：`curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products` 進行測試  

## 實作練習

[註：完整練習流程請見上方「實作練習」章節，包含部署驗證、資料修改、自動擴縮測試、錯誤處理及新增第三個服務流程。]

## 成本分析

### 預估月費 (雙服務範例)

| 資源 | 配置 | 預估費用 |
|----------|--------------|----------------|
| API Gateway | 2-20 複本，1 vCPU，2GB RAM | $30-150 |
| 產品服務 | 1-10 複本，0.5 vCPU，1GB RAM | $15-75 |
| 容器註冊表 | 基本層級 | $5 |
| Application Insights | 1-2 GB/月 | $5-10 |
| Log Analytics | 1 GB/月 | $3 |
| **總計** | | **$58-243/月** |

**依使用量分成本**：
- **輕量流量**（測試/學習）：約 $60/月  
- **中等流量**（小型生產）：約 $120/月  
- **高流量**（高峰期）：約 $240/月  

### 成本優化建議

1. **開發時擴縮至零**：
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Cosmos DB 採用消費模式**：
   - 依用量付費
   - 無最低費用

3. **設定 Application Insights 採樣率**：
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // 抽樣 50% 的請求
   ```

4. **不使用時清理資源**：
   ```bash
   azd down
   ```

### 免費方案選擇
For learning/testing, consider:  
- 使用 Azure 免費點數（首 30 天）  
- 保持最少副本數量  
- 測試後刪除（避免持續收費）  

---

## Cleanup

為避免持續收費，刪除所有資源：

```bash
azd down --force --purge
```
  
**確認提示**：  
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```
  
輸入 `y` 來確認。

**刪除清單**：  
- Container Apps 環境  
- 兩個 Container Apps（gateway 和 product service）  
- Container Registry  
- Application Insights  
- Log Analytics 工作區  
- 資源群組  

**✓ 驗證已清理**：  
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```
  
應返回空結果。

---

## Expansion Guide: From 2 to 5+ Services

當你掌握這個 2 服務架構後，以下是擴展方法：

### Phase 1: 加入資料庫持久化（下一步）

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
  
2. 更新產品服務，使用 Cosmos DB 替代記憶體資料  

3. 預估額外成本：約 $25/月（無伺服器模式）

### Phase 2: 新增第三個服務（訂單管理）

**建立訂單服務**：

1. 新資料夾：`src/order-service/`（Python/Node.js/C#）  
2. 新 Bicep：`infra/app/order-service.bicep`  
3. 更新 API Gateway 路由至 `/api/orders`  
4. 新增 Azure SQL Database，做為訂單持久化  

**架構變更為**：  
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```
  
### Phase 3: 加入非同步通訊（Service Bus）

**實作事件驅動架構**：

1. 新增 Azure Service Bus：`infra/core/servicebus.bicep`  
2. 產品服務發布 “ProductCreated” 事件  
3. 訂單服務訂閱產品事件  
4. 加入通知服務去處理事件  

**模式**：請求/回應（HTTP）+ 事件驅動（Service Bus）

### Phase 4: 加入用戶身份驗證

**實作用戶服務**：

1. 建立 `src/user-service/`（Go/Node.js）  
2. 新增 Azure AD B2C 或自訂 JWT 認證  
3. API Gateway 驗證權杖  
4. 服務檢查使用者權限  

### Phase 5: 生產環境準備

**新增這些元件**：  
- Azure Front Door（全球負載平衡）  
- Azure Key Vault（機密管理）  
- Azure Monitor 工作簿（自訂儀表板）  
- CI/CD Pipeline（GitHub Actions）  
- 藍綠部署  
- 所有服務使用 Managed Identity  

**完整生產架構成本**：約 $300-1,400/月  

---

## Learn More

### 相關文件  
- [Azure Container Apps 文件](https://learn.microsoft.com/azure/container-apps/)  
- [微服務架構指南](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)  
- [Application Insights 分散式追蹤](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)  
- [Azure Developer CLI 文件](https://learn.microsoft.com/azure/developer/azure-developer-cli/)  

### 本課程後續步驟  
- ← 上一章節: [Simple Flask API](../../../../../examples/container-app/simple-flask-api) - 初學者單容器示例  
- → 下一章節: [AI Integration Guide](../../../../../examples/docs/ai-foundry) - 新增 AI 功能  
- 🏠 [課程首頁](../../README.md)  

### 比較：何時選用何種架構

**單一 Container App**（Simple Flask API 範例）：  
- ✅ 適合簡單應用  
- ✅ 單體架構  
- ✅ 部署快速  
- ❌ 擴展性有限  
- **成本**：約 $15-50/月  

**微服務**（本範例）：  
- ✅ 適合複雜應用  
- ✅ 服務獨立擴展  
- ✅ 團隊自治（不同服務不同團隊）  
- ❌ 管理較複雜  
- **成本**：約 $60-250/月  

**Kubernetes (AKS)**：  
- ✅ 最高控制與彈性  
- ✅ 多雲可攜性  
- ✅ 進階網路功能  
- ❌ 需 Kubernetes 專業知識  
- **成本**：約 $150-500/月起  

**建議**：先從 Container Apps（本範例）開始，僅在需要 Kubernetes 特定功能時再轉向 AKS。

---

## 常見問題

**問：為什麼只用 2 個服務，不用 5 個以上？**  
答：教學進度需要。先用簡單範例掌握基本（服務通訊、監控、擴展），再逐步增加複雜度。學到的模式同樣適用於 100 服務架構。

**問：我可以自己新增更多服務嗎？**  
答：絕對可以！依照上面擴展指南。每個新服務循環相同流程：建立 src 資料夾、建立 Bicep 檔、更新 azure.yaml、部署。

**問：這樣架構適合生產環境嗎？**  
答：這是堅實基礎。生產環境還需加 unmanaged identity、Key Vault、持久化資料庫、CI/CD pipeline、監控警示、備份策略。

**問：為什麼不直接用 Dapr 或其他 service mesh？**  
答：為了學習簡單起見。先了解原生 Container Apps 網路機制，再考慮用 Dapr 進階應用。

**問：我怎麼本地除錯？**  
答：用 Docker 在本地執行服務：  
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```
  
**問：我能用不同程式語言嗎？**  
答：可以！本範例示範 Node.js（gateway）+ Python（product service）。你能自由混合任何容器可執行語言。

**問：如果我沒有 Azure 點數怎麼辦？**  
答：使用 Azure 免費方案（新帳號首 30 天），或短暫測試後立即刪除。

---

> **🎓 學習路線總結**：你已學會部署多服務架構，具備自動擴展、內部網路、集中監控、生產就緒等模式。這個基礎為你日後應付複雜分散式系統和企業微服務架構打下堅實根基。

**📚 課程導航：**  
- ← 上一章節: [Simple Flask API](../../../../../examples/container-app/simple-flask-api)  
- → 下一章節: [Database Integration Example](../../../../../examples/database-app)  
- 🏠 [課程首頁](../../../README.md)  
- 📖 [Container Apps 最佳實踐](../../../docs/chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件由AI翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議尋求專業人工翻譯。我們對因使用本翻譯而引起的任何誤解或誤釋不承擔任何責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->