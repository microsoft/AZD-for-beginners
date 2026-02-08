# 微服務架構 - Container App 範例

⏱️ **預計時間**：25-35 分鐘 | 💰 **預估費用**：約 $50-100/月 | ⭐ **複雜度**：進階

**📚 學習路徑：**
- ← 上一節： [簡單的 Flask API](../../../../examples/container-app/simple-flask-api) - 單一容器基礎
- 🎯 **你在這裡**：微服務架構（2 服務基礎）
- → 下一節： [AI Integration](../../../../docs/ai-foundry) - 為你的服務加入智慧功能
- 🏠 [課程首頁](../../README.md)

---

這是一個使用 AZD CLI 部署到 Azure Container Apps 的 **簡化但可運作** 微服務架構範例。此範例示範服務間通訊、容器編排與監控，採用實務性的 2 服務配置。

> **📚 學習方式**：本範例從最小的 2 服務架構（API Gateway + 後端服務）開始，你可以實際部署並學習。掌握基礎後，我們會提供如何擴展到完整微服務生態系的指引。

## 你將學到什麼

完成本範例後，你將能：
- 部署多個容器到 Azure Container Apps
- 實作使用內部網路的服務對服務通訊
- 設定基於環境的擴縮與健康檢查
- 使用 Application Insights 監控分散式應用
- 了解微服務部署模式與最佳實務
- 學會從簡單逐步擴充到複雜架構

## 架構

### 第一階段：我們正在建置的內容（本範例包含）

```mermaid
graph TB
    Internet[互聯網/用戶]
    Gateway[API 閘道<br/>Node.js 容器<br/>連接埠 8080]
    Product[產品服務<br/>Python 容器<br/>連接埠 8000]
    AppInsights[應用程式洞察<br/>監控與日誌]
    
    Internet -->|HTTPS| Gateway
    Gateway -->|內部 HTTP| Product
    Gateway -.->|遙測| AppInsights
    Product -.->|遙測| AppInsights
    
    style Gateway fill:#2196F3,stroke:#1976D2,stroke-width:3px,color:#fff
    style Product fill:#4CAF50,stroke:#388E3C,stroke-width:3px,color:#fff
    style Internet fill:#FF9800,stroke:#F57C00,stroke-width:2px,color:#fff
    style AppInsights fill:#9C27B0,stroke:#7B1FA2,stroke-width:2px,color:#fff
```
**元件細節：**

| Component | Purpose | Access | Resources |
|-----------|---------|--------|-----------|
| **API Gateway** | 將外部請求路由至後端服務 | 公開（HTTPS） | 1 vCPU, 2GB RAM, 2-20 副本 |
| **Product Service** | 以記憶體資料管理產品目錄 | 僅限內部存取 | 0.5 vCPU, 1GB RAM, 1-10 副本 |
| **Application Insights** | 集中式記錄與分散式追蹤 | Azure Portal | 1-2 GB/月 資料擷取 |

**為什麼從簡單開始？**
- ✅ 快速部署並理解（25-35 分鐘）
- ✅ 在不複雜化的情況下學習核心微服務模式
- ✅ 可修改與實驗的可運作程式碼
- ✅ 學習成本較低（約 $50-100/月 vs $300-1400/月）
- ✅ 在加入資料庫與訊息佇列之前建立信心

**類比**：把這想像成學習開車。你從空的停車場（2 個服務）開始，掌握基礎後，再逐步進入市區車流（5 個以上服務並含資料庫）。

### 第二階段：未來擴充（參考架構）

一旦掌握 2 服務架構，你可以擴充為：

```mermaid
graph TB
    User[使用者]
    Gateway[API 閘道<br/>✅ 已包含]
    Product[產品服務<br/>✅ 已包含]
    Order[訂單服務<br/>🔜 稍後加入]
    UserSvc[使用者服務<br/>🔜 稍後加入]
    Notify[通知服務<br/>🔜 最後加入]
    
    CosmosDB[(Cosmos DB<br/>🔜 產品資料)]
    AzureSQL[(Azure SQL<br/>🔜 訂單資料)]
    ServiceBus[Azure Service Bus<br/>🔜 非同步事件]
    AppInsights[Application Insights<br/>✅ 已包含]
    
    User --> Gateway
    Gateway --> Product
    Gateway --> Order
    Gateway --> UserSvc
    
    Product --> CosmosDB
    Order --> AzureSQL
    UserSvc --> AzureSQL
    
    Product -.->|ProductCreated 事件| ServiceBus
    ServiceBus -.->|訂閱| Notify
    ServiceBus -.->|訂閱| Order
    
    Gateway -.-> AppInsights
    Product -.-> AppInsights
    Order -.-> AppInsights
    UserSvc -.-> AppInsights
    Notify -.-> AppInsights
    
    style Product fill:#4CAF50,stroke:#388E3C,stroke-width:3px,color:#fff
    style Gateway fill:#2196F3,stroke:#1976D2,stroke-width:3px,color:#fff
    style Order fill:#9E9E9E,stroke:#616161,stroke-width:2px,color:#fff
    style UserSvc fill:#9E9E9E,stroke:#616161,stroke-width:2px,color:#fff
    style Notify fill:#9E9E9E,stroke:#616161,stroke-width:2px,color:#fff
```
請參閱文件末尾的「擴充指南」章節以取得逐步說明。

## 包含的功能

✅ **服務發現**：容器間基於 DNS 的自動發現  
✅ **負載平衡**：跨副本的內建負載平衡  
✅ **自動擴縮**：每個服務可根據 HTTP 請求獨立擴縮  
✅ **健康監控**：兩個服務都具備 liveness 與 readiness 探針  
✅ **分散式日誌**：使用 Application Insights 的集中式記錄  
✅ **內部網路**：安全的服務對服務通訊  
✅ **容器編排**：自動化的部署與擴縮  
✅ **零停機更新**：具備修訂管理的滾動更新  

## 前置需求

### 必要工具

開始之前，請確認已安裝下列工具：

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

3. **[Docker](https://www.docker.com/get-started)**（用於本機開發/測試 - 選用）
   ```bash
   docker --version
   # 預期輸出：Docker 版本 20.10 或更高
   ```

### 驗證你的環境設定

執行這些命令以確認準備就緒：

```bash
# 檢查 Azure Developer CLI
azd version
# ✅ 預期：azd 版本 1.0.0 或更高

# 檢查 Azure CLI
az --version
# ✅ 預期：azure-cli 2.50.0 或更高

# 檢查 Docker（可選）
docker --version
# ✅ 預期：Docker 版本 20.10 或更高
```

**成功判準**：所有命令都會回傳符合或高於最低版本的版本號。

### Azure 要求

- 一個有效的 **Azure 訂閱**（[創建免費帳戶](https://azure.microsoft.com/free/)）
- 在你的訂閱中建立資源的權限
- 在訂閱或資源群組上具備 **Contributor** 角色

### 知識前提

這是一個 **進階級** 的範例。你應該已具備：
- 已完成 [簡單的 Flask API 範例](../../../../examples/container-app/simple-flask-api) 
- 對微服務架構有基本理解
- 熟悉 REST API 與 HTTP
- 了解容器概念

**剛接觸 Container Apps？** 建議先從 [簡單的 Flask API 範例](../../../../examples/container-app/simple-flask-api) 開始學習基礎。

## 快速入門（逐步指南）

### 步驟 1：複製並切換目錄

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/microservices
```

**✓ 成功檢查**：確認看到 `azure.yaml`：
```bash
ls
# 預期： README.md, azure.yaml, infra/, src/
```

### 步驟 2：與 Azure 驗證

```bash
azd auth login
```

這會打開瀏覽器進行 Azure 驗證。使用你的 Azure 帳號登入。

**✓ 成功檢查**：你應該會看到：
```
Logged in to Azure.
```

### 步驟 3：初始化環境

```bash
azd init
```

**你會看到的提示**：
- **Environment name**：輸入一個簡短名稱（例如：`microservices-dev`）
- **Azure subscription**：選擇你的訂閱
- **Azure location**：選擇地區（例如：`eastus`, `westeurope`）

**✓ 成功檢查**：你應該會看到：
```
SUCCESS: New project initialized!
```

### 步驟 4：部署基礎架構與服務

```bash
azd up
```

**發生的事情**（需時 8-12 分鐘）：

```mermaid
graph LR
    A[執行 azd up] --> B[建立資源群組]
    B --> C[部署容器註冊表]
    C --> D[部署 Log Analytics]
    D --> E[部署 App Insights]
    E --> F[建立容器環境]
    F --> G[建置 API Gateway 映像]
    F --> H[建置產品服務映像]
    G --> I[推送至註冊表]
    H --> I
    I --> J[部署 API 閘道]
    I --> K[部署產品服務]
    J --> L[設定 Ingress 與健康檢查]
    K --> L
    L --> M[部署完成 ✓]
    
    style A fill:#2196F3,stroke:#1976D2,stroke-width:3px,color:#fff
    style M fill:#4CAF50,stroke:#388E3C,stroke-width:3px,color:#fff
```
**✓ 成功檢查**：你應該會看到：
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ 時間**：8-12 分鐘

### 步驟 5：測試部署

```bash
# 取得閘道端點
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# 測試 API 閘道的健康狀態
curl $GATEWAY_URL/health
```

**✅ 預期輸出：**
```json
{
  "status": "healthy",
  "service": "api-gateway",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

**透過 Gateway 測試產品服務**：
```bash
# 列出產品
curl $GATEWAY_URL/api/products
```

**✅ 預期輸出：**
```json
[
  {"id":1,"name":"Laptop","price":999.99,"stock":50},
  {"id":2,"name":"Mouse","price":29.99,"stock":200},
  {"id":3,"name":"Keyboard","price":79.99,"stock":150}
]
```

**✓ 成功檢查**：兩個端點皆回傳 JSON 資料且無錯誤。

---

**🎉 恭喜！** 你已將微服務架構部署到 Azure！

## 專案結構

所有實作檔案皆已包含——這是一個完整且可運行的範例：

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

**各元件功能說明：**

**基礎架構 (infra/)**：
- `main.bicep`：協調所有 Azure 資源及其相依性
- `core/container-apps-environment.bicep`：建立 Container Apps 環境與 Azure Container Registry
- `core/monitor.bicep`：設定 Application Insights 以做分散式日誌
- `app/*.bicep`：個別 Container App 定義，包含擴縮與健康檢查

**API Gateway (src/api-gateway/)**：
- 對外的服務，將請求路由到後端服務
- 實作日誌、錯誤處理與請求轉發
- 示範服務間的 HTTP 通訊

**Product Service (src/product-service/)**：
- 以記憶體資料維護產品目錄（為簡化而使用記憶體）
- 提供 REST API 並具健康檢查
- 後端微服務模式示例

## 服務概覽

### API Gateway (Node.js/Express)

**埠（Port）**：8080  
**存取**：公開（外部 ingress）  
**用途**：將進入請求路由到適當的後端服務  

**端點**：
- `GET /` - 服務資訊
- `GET /health` - 健康檢查端點
- `GET /api/products` - 轉發到產品服務（列出所有）
- `GET /api/products/:id` - 轉發到產品服務（依 ID 取得）

**主要功能**：
- 使用 axios 的請求路由
- 集中式日誌
- 錯誤處理與逾時管理
- 透過環境變數的服務發現
- Application Insights 整合

**程式碼亮點**（`src/api-gateway/app.js`）：
```javascript
// 內部服務通訊
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`, {
    timeout: 5000
  });
  res.json(response.data);
});
```

### 產品服務（Python/Flask）

**埠（Port）**：8000  
**存取**：僅內部（無外部 ingress）  
**用途**：以記憶體資料管理產品目錄  

**端點**：
- `GET /` - 服務資訊
- `GET /health` - 健康檢查端點
- `GET /products` - 列出所有產品
- `GET /products/<id>` - 依 ID 取得產品

**主要功能**：
- 使用 Flask 的 RESTful API
- 記憶體產品儲存（簡單，無需資料庫）
- 使用探針的健康監控
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

**為何僅限內部？**
產品服務不對外公開。所有請求必須經由 API Gateway，該 Gateway 提供：
- 安全性：受控的存取點
- 彈性：可變更後端而不影響用戶端
- 監控：集中式的請求日誌

## 了解服務通訊

### 服務如何互相通訊

```mermaid
sequenceDiagram
    participant User as 使用者
    participant Gateway as API 閘道<br/>(埠 8080)
    participant Product as 產品服務<br/>(埠 8000)
    participant AI as 應用程式洞察
    
    User->>Gateway: GET /api/products
    Gateway->>AI: 記錄請求
    Gateway->>Product: GET /products (內部 HTTP)
    Product->>AI: 記錄查詢
    Product-->>Gateway: JSON 回應 [5 個產品]
    Gateway->>AI: 記錄回應
    Gateway-->>User: JSON 回應 [5 個產品]
    
    Note over Gateway,Product: 內部 DNS: http://product-service
    Note over User,AI: 所有通訊均已記錄及追蹤
```
在此範例中，API Gateway 使用 **內部 HTTP 呼叫** 與產品服務通訊：

```javascript
// API 網關 (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// 發出內部 HTTP 請求
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**重點**：

1. **基於 DNS 的服務發現**：Container Apps 會自動為內部服務提供 DNS
   - Product Service FQDN: `product-service.internal.<environment>.azurecontainerapps.io`
   - 簡化為：`http://product-service`（Container Apps 會解析）

2. **不對外公開**：Product Service 在 Bicep 中設為 `external: false`
   - 僅能在 Container Apps 環境內存取
   - 無法從網際網路直接存取

3. **環境變數**：服務 URL 在部署時注入
   - Bicep 將內部 FQDN 傳給 Gateway
   - 應用程式程式碼中沒有硬編碼的 URL

**類比**：把這想像成辦公室房間。API Gateway 是接待櫃檯（面向公眾），而 Product Service 是辦公室房間（僅限內部）。訪客必須先經接待才能到達辦公室。

## 部署選項

### 完整部署（推薦）

```bash
# 部署基礎架構及兩個服務
azd up
```

此部署包含：
1. Container Apps 環境
2. Application Insights
3. Container Registry
4. API Gateway 容器
5. Product Service 容器

**時間**：8-12 分鐘

### 部署單一服務

```bash
# 僅部署一個服務（在初次執行 azd up 之後）
azd deploy api-gateway

# 或部署產品服務
azd deploy product-service
```

**使用情境**：當你僅更新單一服務的程式碼，且只想重新部署該服務。

### 更新設定

```bash
# 變更擴充參數
azd env set GATEWAY_MAX_REPLICAS 30

# 以新設定重新部署
azd up
```

## 設定

### 擴縮設定

兩個服務在其 Bicep 檔案中都設定了基於 HTTP 的自動擴縮：

**API Gateway**：
- 最小副本數：2（為確保可用性始終至少 2 個）
- 最大副本數：20
- 擴縮觸發：每個副本 50 個同時請求

**Product Service**：
- 最小副本數：1（如需可縮減至 0）
- 最大副本數：10
- 擴縮觸發：每個副本 100 個同時請求

**自訂擴縮**（在 `infra/app/*.bicep` 中）：
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

**Product Service**：
- CPU：0.5 vCPU
- 記憶體：1 GiB
- 理由：輕量的記憶體運算

### 健康檢查

兩個服務皆包含存活（liveness）與就緒（readiness）探針：

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

**這代表**：
- **Liveness（存活）**：若健康檢查失敗，Container Apps 會重啟容器
- **Readiness（就緒）**：若尚未就緒，Container Apps 不會將流量導向該副本

## 監控與可觀察性

### 檢視服務日誌

```bash
# 使用 azd monitor 檢視日誌
azd monitor --logs

# 或使用 Azure CLI 針對特定的容器應用程式：
# 從 API Gateway 串流日誌
az containerapp logs show --name api-gateway --resource-group $RG_NAME --follow

# 檢視近期的產品服務日誌
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

在 Azure 入口網站存取 Application Insights，然後執行下列查詢：

**找出慢速請求**：
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

**各服務錯誤率**：
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

### 存取監控儀表板

```bash
# 取得 Application Insights 的詳細資料
azd env get-values | grep APPLICATIONINSIGHTS

# 在 Azure 入口網站中開啟監控
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### 即時量測

1. 前往 Azure 入口網站中的 Application Insights
2. 點選「Live Metrics」
3. 檢視即時的請求、失敗與效能
4. 測試：執行： `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## 實作練習

### 練習 1：新增產品端點 ⭐（簡易）

**目標**：新增 POST 端點以建立新產品

**起始檔案**：`src/product-service/main.py`

**步驟**：

1. 在 `main.py` 的 `get_product` 函式之後加入此端點：

```python
@app.route('/products', methods=['POST'])
def create_product():
    """Create a new product"""
    data = request.get_json()
    
    # 驗證必填欄位
    if not data or 'name' not in data or 'price' not in data:
        return jsonify({'error': 'Missing required fields: name, price'}), 400
    
    new_id = max(p['id'] for p in products) + 1
    new_product = {
        'id': new_id,
        'name': data['name'],
        'description': data.get('description', ''),
        'price': float(data['price']),
        'stock': int(data.get('stock', 0))
    }
    products.append(new_product)
    logger.info(f"Created product {new_id}")
    return jsonify(new_product), 201
```

2. 在 API Gateway (`src/api-gateway/app.js`) 新增 POST 路由：

```javascript
// 在 GET /api/products 路由之後加入這段
app.post('/api/products', async (req, res) => {
  try {
    console.log(`Forwarding POST request to ${PRODUCT_SERVICE_URL}/products`);
    const response = await axios.post(`${PRODUCT_SERVICE_URL}/products`, req.body, {
      timeout: 5000
    });
    res.status(201).json(response.data);
  } catch (error) {
    console.error('Error calling product service:', error.message);
    res.status(503).json({
      error: 'Product service unavailable',
      message: error.message
    });
  }
});
```

3. Redeploy both services:

```bash
azd deploy product-service
azd deploy api-gateway
```

4. Test the new endpoint:

```bash
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# 建立一個新產品
curl -X POST $GATEWAY_URL/api/products \
  -H "Content-Type: application/json" \
  -d '{"name":"USB Cable","price":9.99,"stock":500}'
```

**✅ 預期輸出:**
```json
{"id":6,"name":"USB Cable","description":"","price":9.99,"stock":500}
```

5. Verify it appears in the list:

```bash
curl $GATEWAY_URL/api/products
# 現在應該會顯示 6 個產品，包括新的 USB 傳輸線
```

**成功標準**:
- ✅ POST 請求返回 HTTP 201
- ✅ 新產品出現在 GET /api/products 列表中
- ✅ 產品具有自動遞增的 ID

**時間**: 10-15 分鐘

---

### Exercise 2: Modify Autoscaling Rules ⭐⭐ (Medium)

**目標**: 讓 Product Service 更積極地擴展

**起始點**: `infra/app/product-service.bicep`

**步驟**:

1. 打開 `infra/app/product-service.bicep` 並找到 `scale` 區塊（大約在第 95 行）

2. 從：
```bicep
scale: {
  minReplicas: 1
  maxReplicas: 10
  rules: [
    {
      name: 'http-scale-rule'
      http: {
        metadata: {
          concurrentRequests: '100'  // OLD
        }
      }
    }
  ]
}
```

改為：
```bicep
scale: {
  minReplicas: 2  // Always have 2 running
  maxReplicas: 20  // Allow more scaling
  rules: [
    {
      name: 'http-scale-rule'
      http: {
        metadata: {
          concurrentRequests: '20'  // Scale at lower threshold
        }
      }
    }
  ]
}
```

3. 重新部署基礎設施：

```bash
azd up
```

4. 驗證新的擴展配置：

```bash
az containerapp show \
  --name $(azd env get-values | grep PRODUCT_SERVICE | head -1 | cut -d '/' -f5) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2 | tr -d '"') \
  --query "properties.template.scale" -o json
```

**✅ 預期輸出:**
```json
{
  "minReplicas": 2,
  "maxReplicas": 20,
  "rules": [...]
}
```

5. 使用負載測試自動擴展：

```bash
# 產生並發請求
for i in {1..500}; do curl $GATEWAY_URL/api/products & done

# 使用 Azure CLI 觀察縮放情況
az containerapp logs show --name product-service --resource-group $RG_NAME --follow
# 尋找：Container Apps 的縮放事件
```

**成功標準**:
- ✅ Product Service 永遠至少運行 2 個副本
- ✅ 在負載下，擴展到超過 2 個副本
- ✅ Azure 入口網站顯示新的擴展規則

**時間**: 15-20 分鐘

---

### Exercise 3: Add Custom Monitoring Query ⭐⭐ (Medium)

**目標**: 為 Application Insights 建立自訂查詢以追蹤產品 API 效能

**步驟**:

1. 在 Azure 入口網站前往 Application Insights:
   - 前往 Azure Portal
   - 找到你的資源群組 (rg-microservices-*)
   - 點選 Application Insights 資源

2. 在左側選單點選「Logs」

3. 建立此查詢：

```kusto
requests
| where timestamp > ago(1h)
| where name contains "products"
| summarize 
    RequestCount = count(),
    AvgDuration = avg(duration),
    P95Duration = percentile(duration, 95),
    SuccessRate = 100.0 * countif(success == true) / count()
  by bin(timestamp, 5m)
| render timechart
```

4. 點選「Run」執行查詢

5. 儲存查詢：
   - 點選「Save」
   - 名稱: "Product API Performance"
   - 分類: "Performance"

6. 產生測試流量：

```bash
for i in {1..100}; do curl $GATEWAY_URL/api/products; sleep 1; done
```

7. 重新整理查詢以查看資料

**✅ 預期輸出:**
- 顯示請求數量隨時間變化的圖表
- 平均持續時間 < 500ms
- 成功率 = 100%
- 時間區間為 5 分鐘

**成功標準**:
- ✅ 查詢顯示 100+ 請求
- ✅ 成功率為 100%
- ✅ 平均持續時間 < 500ms
- ✅ 圖表顯示 5 分鐘的時間區段

**學習成果**: 了解如何使用自訂查詢監控服務效能

**時間**: 10-15 分鐘

---

### Exercise 4: Implement Retry Logic ⭐⭐⭐ (Advanced)

**目標**: 當 Product Service 臨時不可用時，為 API Gateway 新增重試邏輯

**起始點**: `src/api-gateway/app.js`

**步驟**:

1. 安裝重試函式庫：

```bash
cd src/api-gateway
npm install axios-retry --save
cd ../..
```

2. 更新 `src/api-gateway/app.js`（在 axios 匯入之後新增）：

```javascript
const axiosRetry = require('axios-retry');

// 設定重試邏輯
axiosRetry(axios, {
  retries: 3,
  retryDelay: (retryCount) => {
    return retryCount * 1000; // 1 秒、2 秒、3 秒
  },
  retryCondition: (error) => {
    // 在網絡錯誤或 5xx 回應時重試
    return axiosRetry.isNetworkOrIdempotentRequestError(error) ||
           (error.response && error.response.status >= 500);
  }
});

console.log('Retry logic configured: 3 retries with exponential backoff');
```

3. 重新部署 API Gateway：

```bash
azd deploy api-gateway
```

4. 透過模擬服務故障來測試重試行為：

```bash
# 將產品服務縮減到 0 (模擬故障)
az containerapp update \
  --name $(azd env get-values | grep PRODUCT_SERVICE | head -1 | cut -d '/' -f5) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2 | tr -d '"') \
  --min-replicas 0 \
  --max-replicas 0

# 嘗試存取產品 (會重試 3 次)
time curl -v $GATEWAY_URL/api/products
# 觀察: 回應約需 6 秒 (1s + 2s + 3s 的重試)

# 恢復產品服務
az containerapp update \
  --name $(azd env get-values | grep PRODUCT_SERVICE | head -1 | cut -d '/' -f5) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2 | tr -d '"') \
  --min-replicas 1 \
  --max-replicas 10
```

5. 查看重試日誌：

```bash
az containerapp logs show --name api-gateway --resource-group $RG_NAME --tail 50
# 尋找：重試嘗試的訊息
```

**✅ 預期行為:**
- 請求在失敗前重試 3 次
- 每次重試等待時間漸增（1s、2s、3s）
- 服務重啟後請求成功
- 日誌顯示重試嘗試

**成功標準**:
- ✅ 請求在失敗前重試 3 次
- ✅ 每次重試等待時間逐步增加（指數回退）
- ✅ 服務重啟後請求成功
- ✅ 日誌顯示重試嘗試

**學習成果**: 了解微服務中的韌性模式（斷路器、重試、逾時）

**時間**: 20-25 分鐘

---

## 知識檢核點

完成此範例後，驗證你的理解：

### 1. 服務通訊 ✓

測試你的知識:
- [ ] 你能解釋 API Gateway 如何發現 Product Service 嗎？（基於 DNS 的服務發現）
- [ ] 如果 Product Service 宕機會發生什麼事？（Gateway 返回 503 錯誤）
- [ ] 你會如何新增第三個服務？（建立新的 Bicep 檔案，加入 main.bicep，建立 src 資料夾）

**實作驗證:**
```bash
# 模擬服務故障
az containerapp update --name <product-service-name> --min-replicas 0 --max-replicas 0
curl $GATEWAY_URL/api/products
# ✅ 預期：503 服務不可用

# 恢復服務
az containerapp update --name <product-service-name> --min-replicas 1 --max-replicas 10
```

### 2. 監控與可觀察性 ✓

測試你的知識:
- [ ] 你在哪裡看到分散式日誌？（Azure Portal 的 Application Insights）
- [ ] 你如何追蹤較慢的請求？（Kusto 查詢: `requests | where duration > 1000`）
- [ ] 你能辨識是哪個服務造成錯誤嗎？（檢查日誌中的 `cloud_RoleName` 欄位）

**實作驗證:**
```bash
# 產生慢速請求模擬
curl "$GATEWAY_URL/api/products?delay=2000"

# 查詢 Application Insights 中的慢速請求
# 前往 Azure 入口網站 → Application Insights → 日誌
# 執行: requests | where duration > 1000 | project timestamp, name, duration, cloud_RoleName
```

### 3. 縮放與效能 ✓

測試你的知識:
- [ ] 是什麼觸發自動縮放？（HTTP 同時請求規則：gateway 為 50，product 為 100）
- [ ] 現在運行了多少副本？（使用 `az containerapp revision list` 檢查）
- [ ] 你會如何將 Product Service 縮放到 5 個副本？（在 Bicep 中更新 minReplicas）

**實作驗證:**
```bash
# 產生負載以測試自動縮放
for i in {1..1000}; do curl $GATEWAY_URL/api/products & done

# 使用 Azure CLI 觀察副本數量增加
az containerapp logs show --name api-gateway --resource-group $RG_NAME --follow
# ✅ 預期：在日誌中看到縮放事件
```

**成功標準**: 你可以回答所有問題並透過實作命令驗證。

---

## 成本分析

### 預估每月成本（針對此 2 服務範例）

| Resource | Configuration | Estimated Cost |
|----------|--------------|----------------|
| API Gateway | 2-20 replicas, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 replicas, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Basic tier | $5 |
| Application Insights | 1-2 GB/month | $5-10 |
| Log Analytics | 1 GB/month | $3 |
| **Total** | | **$58-243/month** |

### 依使用情形的成本分解

**輕量流量**（測試/學習）：約 $60/月
- API Gateway: 2 個副本 × 24/7 = $30
- Product Service: 1 個副本 × 24/7 = $15
- 監控 + Registry = $13

**中等流量**（小型生產）：約 $120/月
- API Gateway: 平均 5 個副本 = $75
- Product Service: 平均 3 個副本 = $45
- 監控 + Registry = $13

**高流量**（繁忙時段）：約 $240/月
- API Gateway: 平均 15 個副本 = $225
- Product Service: 平均 8 個副本 = $120
- 監控 + Registry = $13

### 成本優化建議

1. **開發時縮放到零**：
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **對於 Cosmos DB 使用消費方案**（在你加入時）：
   - 只為使用量付費
   - 無最低收費

3. **設定 Application Insights 取樣**：
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // 對50%的請求進行抽樣
   ```

4. **不需要時清理資源**：
   ```bash
   azd down --force --purge
   ```

### 免費方案選項

用於學習/測試，可考慮：
- ✅ 使用 Azure 免費額度（新帳戶首 30 天 $200）
- ✅ 保持最少副本數（可節省約 50% 成本）
- ✅ 測試後刪除（避免持續費用）
- ✅ 在學習期間將服務縮放到零

**範例**：每日運行此範例 2 小時 × 30 天 = 約 $5/月 而不是 $60/月

---

## 疑難排解 快速參考

### 問題：`azd up` 因「找不到訂閱」失敗

**解法**：
```bash
# 再次以明確的訂閱登入
az account set --subscription <your-subscription-id>
azd env set AZURE_SUBSCRIPTION_ID <your-subscription-id>
azd up
```

### 問題：API Gateway 返回 503 "Product service unavailable"

**診斷**：
```bash
# 檢查產品服務日誌，使用 Azure 命令列介面
az containerapp logs show --name product-service --resource-group $RG_NAME --tail 50

# 檢查產品服務運作狀況
az containerapp show \
  --name $(azd env get-values | grep PRODUCT_SERVICE | head -1 | cut -d '/' -f5) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2 | tr -d '"') \
  --query "properties.runningStatus"
```

**常見原因**:
1. Product service 未啟動（檢查日誌是否有 Python 錯誤）
2. 健康檢查失敗（驗證 `/health` 端點是否正常）
3. 容器映像建置失敗（檢查註冊表中的映像）

### 問題：自動縮放無效

**診斷**：
```bash
# 檢查目前副本數量
az containerapp revision list \
  --name $(azd env get-values | grep API_GATEWAY | head -1 | cut -d '/' -f5) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2 | tr -d '"') \
  --query "[].properties.replicas"

# 產生負載以進行測試
for i in {1..1000}; do curl $GATEWAY_URL/api/products & done

# 使用 Azure CLI 監看縮放事件
az containerapp logs show --name api-gateway --resource-group $RG_NAME --follow | grep -i scale
```

**常見原因**:
1. 負載不足以觸發縮放規則（需要 >50 並發請求）
2. 已達到最大副本數（檢查 Bicep 設定）
3. 縮放規則在 Bicep 中設定錯誤（驗證 concurrentRequests 值）

### 問題：Application Insights 未顯示日誌

**診斷**：
```bash
# 確認連線字串已設定
azd env get-values | grep APPLICATIONINSIGHTS

# 檢查服務是否正在傳送遙測資料
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_NAME | cut -d '=' -f2 | tr -d '"') \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2 | tr -d '"') \
  --query "properties.InstrumentationKey"
```

**常見原因**:
1. 連線字串未傳遞到容器（檢查環境變數）
2. Application Insights SDK 未設定（驗證程式碼中的匯入）
3. 防火牆阻擋遙測（少見，檢查網路規則）

### 問題：Docker 在本機建置失敗

**診斷**：
```bash
# 測試 API Gateway 建置
cd src/api-gateway
docker build -t test-gateway .

# 測試 產品服務 建置
cd ../product-service
docker build -t test-product .
```

**常見原因**:
1. package.json/requirements.txt 中缺少相依套件
2. Dockerfile 語法錯誤
3. 下載相依套件時的網路問題

**仍然卡住？** 請參閱 [Common Issues Guide](../../docs/chapter-07-troubleshooting/common-issues.md) 或 [Azure Container Apps Troubleshooting](https://learn.microsoft.com/azure/container-apps/troubleshooting)

---

## 清理

為避免持續費用，刪除所有資源：

```bash
azd down --force --purge
```

**確認提示**：
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

輸入 `y` 以確認。

**會被刪除的項目**:
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

應該回傳為空。

---

## 擴展指南：從 2 個服務擴展到 5+ 個服務

當你熟悉這個 2 服務架構後，以下是擴展方式：

### 階段 1：加入資料庫持久層（下一步）

**為 Product Service 加入 Cosmos DB**：

1. 建立 `infra/core/cosmos.bicep`：
   ```bicep
   resource cosmosAccount 'Microsoft.DocumentDB/databaseAccounts@2023-04-15' = {
     name: name
     location: location
     kind: 'GlobalDocumentDB'
     properties: {
       databaseAccountOfferType: 'Standard'
       consistencyPolicy: { defaultConsistencyLevel: 'Session' }
       locations: [{ locationName: location, failoverPriority: 0 }]
     }
   }
   ```

2. 更新 product service 使用 Azure Cosmos DB Python SDK 取代記憶體內資料

3. 估計額外成本：約 $25/月（無伺服器）

### 階段 2：加入第三個服務（訂單管理）

**建立 Order Service**：

1. 新資料夾: `src/order-service/` (Python/Node.js/C#)
2. 新 Bicep: `infra/app/order-service.bicep`
3. 更新 API Gateway 導向 `/api/orders`
4. 為訂單持久化新增 Azure SQL Database

**架構會變成**：
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### 階段 3：加入非同步通訊（Service Bus）

**實作事件驅動架構**：

1. 新增 Azure Service Bus：`infra/core/servicebus.bicep`
2. Product Service 發布 "ProductCreated" 事件
3. Order Service 訂閱產品事件
4. 新增 Notification Service 來處理事件

**模式**: Request/Response (HTTP) + Event-Driven (Service Bus)

### 階段 4：加入使用者驗證

**實作 User Service**：

1. 建立 `src/user-service/` (Go/Node.js)
2. 新增 Azure AD B2C 或自訂 JWT 驗證
3. API Gateway 在路由前驗證 token
4. 服務檢查使用者權限

### 階段 5：準備生產環境

**新增下列元件**:
- ✅ Azure Front Door（全球負載平衡）
- ✅ Azure Key Vault（密鑰管理）
- ✅ Azure Monitor Workbooks（自訂儀表板）
- ✅ CI/CD 管線（GitHub Actions）
- ✅ 藍綠部署
- ✅ 為所有服務使用 Managed Identity

**完整生產架構成本**: 約 $300-1,400/月

---

## 進一步閱讀

### 相關文件
- [Azure Container Apps Documentation](https://learn.microsoft.com/azure/container-apps/)
- [Microservices Architecture Guide](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights for Distributed Tracing](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### 本課程的下一步
- ← 上一章節: [Simple Flask API](../../../../examples/container-app/simple-flask-api) - 初學者單容器範例
- → 下一章節: [AI Integration Guide](../../../../docs/ai-foundry) - 新增 AI 功能
- 🏠 [課程首頁](../../README.md)

### 比較：何時使用何者

| Feature | Single Container | Microservices (This) | Kubernetes (AKS) |
|---------|-----------------|---------------------|------------------|
| **Use Case** | Simple apps | Complex apps | Enterprise apps |
| **Scalability** | Single service | Per-service scaling | Maximum flexibility |
| **Complexity** | Low | Medium | High |
| **Team Size** | 1-3 developers | 3-10 developers | 10+ developers |
| **Cost** | ~$15-50/month | ~$60-250/month | ~$150-500/month |
| **Deployment Time** | 5-10 minutes | 8-12 minutes | 15-30 minutes |
| **最適合** | MVP（最簡可行產品）、原型 | 生產環境應用程式 | 多雲、進階網絡功能 |

**建議**：先從 Container Apps（此範例）開始，只有在需要 Kubernetes 特定功能時才轉移到 AKS。

---

## 常見問題

**問：為什麼只有 2 個服務，而不是 5 個以上？**  
答：循序漸進的教學。先掌握基礎（服務通訊、監控、擴展），在加入複雜性之前用簡單範例練習。您在這裡學到的模式適用於 100 個服務的架構。

**問：我可以自行新增更多服務嗎？**  
答：當然可以！請遵循上方的擴展指南。每個新服務都遵循相同的模式：建立 src 資料夾、建立 Bicep 檔案、更新 azure.yaml，然後部署。

**問：這個能用於生產環境嗎？**  
答：這是一個穩固的基礎。若要用於生產，請加入：託管身分、Key Vault、持久化資料庫、CI/CD 管線、監控警示，以及備份策略。

**問：為什麼不使用 Dapr 或其他服務網格？**  
答：為了學習而保持簡單。一旦你了解 Container Apps 的原生網絡，就可以在進階情境（狀態管理、pub/sub、bindings）上疊加 Dapr。

**問：如何在本地進行除錯？**  
答：使用 Docker 在本地執行服務：  
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**問：可以使用不同的程式語言嗎？**  
答：可以！此範例示範 Node.js（gateway）+ Python（product service）。您可以混合任何能在容器中執行的語言：C#, Go, Java, Ruby, PHP 等等。

**問：如果我沒有 Azure 點數怎麼辦？**  
答：使用 Azure 免費方案（新帳戶前 30 天可獲得 $200 點數），或在短期測試後立即刪除。此範例大約花費 ~$2/天。

**問：這與 Azure Kubernetes Service (AKS) 有何不同？**  
答：Container Apps 較簡單（不需要 Kubernetes 知識），但彈性較低。AKS 可讓你完全控制 Kubernetes，但需要更多專業知識。從 Container Apps 開始，若需要再進階到 AKS。

**問：我可以將此與現有的 Azure 服務一起使用嗎？**  
答：可以！你可以連接現有的資料庫、儲存帳戶、Service Bus 等。更新 Bicep 檔案以參考現有資源，而不是建立新的資源。

---

> **🎓 學習路徑摘要**：您已學會部署一個具備自動擴展、內部網路、集中監控及生產就緒模式的多服務架構。這個基礎將讓您準備好處理複雜的分散式系統與企業級微服務架構。

**📚 課程導覽：**
- ← 上一節： [Simple Flask API](../../../../examples/container-app/simple-flask-api)
- → 下一節： [Database Integration Example](../../../../database-app)
- 🏠 [Course Home](../../README.md)
- 📖 [Container Apps Best Practices](../../docs/chapter-04-infrastructure/deployment-guide.md)

---

**✨ 恭喜！** 你已完成微服務範例。你現在了解如何在 Azure Container Apps 上建置、部署並監控分散式應用程式。準備加入 AI 能力了嗎？參考 [AI Integration Guide](../../../../docs/ai-foundry)！

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責聲明：
本文件係使用 AI 翻譯服務 Co‑op Translator（https://github.com/Azure/co-op-translator）翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不精確之處。原始文件之母語版本應視為具權威性的版本。對於重要資訊，建議採用專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->