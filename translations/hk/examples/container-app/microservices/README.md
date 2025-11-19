<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "933ed5b10b761a61ac633494eb275d8c",
  "translation_date": "2025-11-19T12:50:44+00:00",
  "source_file": "examples/container-app/microservices/README.md",
  "language_code": "hk"
}
-->
# 微服務架構 - 容器應用程式範例

一個可供生產使用的微服務架構，透過 AZD CLI 部署到 Azure 容器應用程式。本範例展示了服務間的通訊、訊息佇列及分佈式追蹤。

## 架構

```
                    ┌─────────────────────────────┐
                    │  Azure Front Door (CDN)     │
                    └──────────────┬──────────────┘
                                   │
              ┌────────────────────┴────────────────────┐
              │                                         │
    ┌─────────▼─────────┐                   ┌─────────▼─────────┐
    │  API Gateway      │                   │   Web Frontend    │
    │  (Container App)  │                   │  (Container App)  │
    └─────────┬─────────┘                   └───────────────────┘
              │
       ┌──────┴──────┬──────────┬──────────┐
       │             │          │          │
┌──────▼──────┐ ┌───▼────┐ ┌───▼────┐ ┌───▼────┐
│ Product Svc │ │Order Svc│ │User Svc│ │Notify  │
│ (Container) │ │(Ctnr)   │ │(Ctnr)  │ │Svc     │
└──────┬──────┘ └───┬────┘ └───┬────┘ └───┬────┘
       │            │          │          │
┌──────▼──────────────▼──────────▼──────────▼─────┐
│         Azure Service Bus Queue                  │
│         (Async Communication)                    │
└──────────────────────────────────────────────────┘
       │            │          │
┌──────▼──────┐ ┌───▼────┐ ┌──▼──────┐
│ Cosmos DB   │ │SQL DB  │ │ Storage │
└─────────────┘ └────────┘ └─────────┘
```

## 功能

✅ **服務發現**：基於 DNS 的自動服務發現  
✅ **負載平衡**：內建的副本間負載平衡  
✅ **自動擴展**：每個服務可獨立擴展  
✅ **健康監控**：存活性及準備性探測  
✅ **分佈式追蹤**：整合 Application Insights  
✅ **訊息佇列**：使用 Service Bus 進行非同步處理  
✅ **受管理的身份**：安全存取 Azure 資源  
✅ **藍綠部署**：零停機部署  

## 先決條件

```bash
# Verify AZD installation
azd version

# Verify Azure CLI
az version

# Login to Azure
azd auth login
```

## 快速開始

```bash
# Navigate to example
cd examples/container-app/microservices

# Initialize environment
azd env new production

# Configure settings
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_NAME production

# Deploy all services
azd up

# Verify deployment
azd show
```

## 專案結構

```
microservices/
├── azure.yaml                    # AZD configuration
├── infra/
│   ├── main.bicep               # Main infrastructure
│   ├── main.parameters.json
│   ├── core/
│   │   ├── monitor.bicep        # Application Insights
│   │   ├── servicebus.bicep     # Service Bus
│   │   ├── cosmos.bicep         # Cosmos DB
│   │   └── sql.bicep            # SQL Database
│   └── app/
│       ├── container-env.bicep  # Container environment
│       ├── api-gateway.bicep
│       ├── product-service.bicep
│       ├── order-service.bicep
│       ├── user-service.bicep
│       └── notification-service.bicep
├── src/
│   ├── api-gateway/
│   │   ├── Dockerfile
│   │   ├── app.js
│   │   └── package.json
│   ├── product-service/
│   │   ├── Dockerfile
│   │   ├── main.py
│   │   └── requirements.txt
│   ├── order-service/
│   │   ├── Dockerfile
│   │   ├── Program.cs
│   │   └── OrderService.csproj
│   ├── user-service/
│   │   ├── Dockerfile
│   │   ├── main.go
│   │   └── go.mod
│   └── notification-service/
│       ├── Dockerfile
│       ├── handler.js
│       └── package.json
└── tests/
    ├── integration/
    └── load/
```

## 服務概覽

### API Gateway (Node.js)

**端口**：8080  
**用途**：將請求路由到適當的微服務  
**端點**：
- `GET /health` - 健康檢查
- `GET /api/products/*` - 產品服務路由
- `GET /api/orders/*` - 訂單服務路由
- `GET /api/users/*` - 用戶服務路由

**功能**：
- 請求路由
- 限流
- JWT 驗證
- 請求/回應日誌記錄

### 產品服務 (Python)

**端口**：8000  
**資料庫**：Cosmos DB  
**用途**：管理產品目錄  
**端點**：
- `GET /products` - 列出產品
- `GET /products/{id}` - 獲取產品詳情
- `POST /products` - 新增產品
- `PUT /products/{id}` - 更新產品
- `DELETE /products/{id}` - 刪除產品

### 訂單服務 (C#)

**端口**：5000  
**資料庫**：Azure SQL  
**用途**：處理及管理訂單  
**端點**：
- `GET /orders` - 列出訂單
- `GET /orders/{id}` - 獲取訂單詳情
- `POST /orders` - 新增訂單
- `PUT /orders/{id}/status` - 更新訂單狀態

**功能**：
- 交易管理
- 使用 Saga 模式進行分佈式交易
- 發佈事件到 Service Bus

### 用戶服務 (Go)

**端口**：9000  
**資料庫**：Cosmos DB  
**用途**：用戶驗證及個人資料管理  
**端點**：
- `POST /auth/login` - 用戶登入
- `POST /auth/register` - 用戶註冊
- `GET /users/{id}` - 獲取用戶資料
- `PUT /users/{id}` - 更新個人資料

### 通知服務 (Node.js)

**用途**：處理來自佇列的通知事件  
**觸發器**：Service Bus 訊息  
**通知**：
- 電郵通知
- SMS 提醒
- 推送通知

## 部署

### 全部服務部署

```bash
# Deploy infrastructure and all services
azd up
```

### 部署單一服務

```bash
# Deploy only product service
azd deploy product-service

# Deploy only order service
azd deploy order-service
```

### 藍綠部署

```bash
# Deploy new version without traffic
azd deploy product-service --revision-suffix v2 --no-traffic

# Test new version
curl https://product-service--v2.example.azurecontainerapps.io/health

# Gradually shift traffic (10% to v2)
az containerapp ingress traffic set \
  --name product-service \
  --resource-group rg-microservices \
  --revision-weight latest=90 v2=10

# Complete cutover
az containerapp ingress traffic set \
  --name product-service \
  --resource-group rg-microservices \
  --revision-weight v2=100
```

## 配置

### 環境變數

```bash
# API Gateway
azd env set GATEWAY_PORT 8080
azd env set JWT_SECRET "your-secret-key"
azd env set RATE_LIMIT_REQUESTS 1000

# Product Service
azd env set COSMOS_DATABASE products
azd env set COSMOS_CONTAINER items

# Order Service
azd env set SQL_DATABASE orders
azd env set SQL_CONNECTION_TIMEOUT 30

# User Service
azd env set JWT_EXPIRATION 3600
azd env set BCRYPT_ROUNDS 10
```

### 擴展配置

```bash
# Set scaling rules per service
azd env set PRODUCT_MIN_REPLICAS 2
azd env set PRODUCT_MAX_REPLICAS 20

azd env set ORDER_MIN_REPLICAS 3
azd env set ORDER_MAX_REPLICAS 30
```

## 服務通訊

### 同步通訊 (HTTP)

服務使用內部 DNS 名稱進行通訊：

```javascript
// From API Gateway to Product Service
const response = await fetch('http://product-service/products');

// From Order Service to User Service
const user = await httpClient.get('http://user-service/users/123');
```

### 非同步通訊 (Service Bus)

```python
# Product Service publishes event
from azure.servicebus import ServiceBusClient, ServiceBusMessage

async def publish_product_created(product_id):
    async with ServiceBusClient.from_connection_string(
        conn_str, transport_type=TransportType.AmqpOverWebsocket
    ) as client:
        sender = client.get_queue_sender('product-events')
        message = ServiceBusMessage(json.dumps({
            'event': 'ProductCreated',
            'productId': product_id,
            'timestamp': datetime.utcnow().isoformat()
        }))
        await sender.send_messages(message)
```

```javascript
// Notification Service subscribes
const { ServiceBusClient } = require('@azure/service-bus');

async function processMessages() {
    const receiver = client.createReceiver('product-events');
    
    receiver.subscribe({
        processMessage: async (message) => {
            const event = JSON.parse(message.body);
            await sendNotification(event);
        }
    });
}
```

## 監控

### 查看所有服務日誌

```bash
# Stream logs from all services
azd logs --follow

# View logs for specific service
azd logs product-service --tail 100
```

### Application Insights 查詢

```kusto
// Find slow requests across all services
requests
| where duration > 1000
| summarize count() by name, cloud_RoleName
| order by count_ desc

// Track service dependencies
dependencies
| where timestamp > ago(1h)
| summarize count() by target, name
| order by count_ desc

// Error rate by service
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName
```

### 自訂指標儀表板

```bash
# Open monitoring dashboard
azd monitor --overview

# View specific metrics
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.product-service.resourceId') \
  --metric "Requests,CPUPercentage,MemoryPercentage"
```

## 測試

### 整合測試

```bash
# Run integration test suite
cd tests/integration
npm install
npm test

# Test specific service
npm test -- --service=product-service
```

### 負載測試

```bash
# Install Azure Load Testing CLI extension
az extension add --name load

# Run load test
cd tests/load
az load test create \
  --name microservices-load-test \
  --test-plan-file loadtest.jmx \
  --engine-instances 10

# View results
az load test show --name microservices-load-test
```

### 端到端測試場景

```bash
# Create user
USER_ID=$(curl -X POST \
  $(azd show --output json | jq -r '.services.api-gateway.endpoint')/api/users \
  -H "Content-Type: application/json" \
  -d '{"email": "test@example.com", "name": "Test User"}' \
  | jq -r '.id')

# Create product
PRODUCT_ID=$(curl -X POST \
  $(azd show --output json | jq -r '.services.api-gateway.endpoint')/api/products \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Product", "price": 29.99}' \
  | jq -r '.id')

# Create order
ORDER_ID=$(curl -X POST \
  $(azd show --output json | jq -r '.services.api-gateway.endpoint')/api/orders \
  -H "Content-Type: application/json" \
  -d "{\"userId\": \"$USER_ID\", \"productId\": \"$PRODUCT_ID\", \"quantity\": 2}" \
  | jq -r '.id')

# Verify order
curl $(azd show --output json | jq -r '.services.api-gateway.endpoint')/api/orders/$ORDER_ID
```

## 性能優化

### 啟用 HTTP/2

```bicep
resource apiGateway 'Microsoft.App/containerApps@2023-05-01' = {
  properties: {
    configuration: {
      ingress: {
        transport: 'http2'
      }
    }
  }
}
```

### 連接池

```python
# Product Service - Reuse Cosmos DB client
from azure.cosmos import CosmosClient

class Database:
    _client = None
    
    @classmethod
    def get_client(cls):
        if not cls._client:
            cls._client = CosmosClient(url, credential)
        return cls._client
```

### 快取策略

```javascript
// API Gateway - Redis cache integration
const redis = require('redis');
const client = redis.createClient({
  socket: {
    host: process.env.REDIS_HOST,
    port: 6379
  }
});

async function getCachedProduct(id) {
  const cached = await client.get(`product:${id}`);
  if (cached) return JSON.parse(cached);
  
  const product = await fetchFromService(id);
  await client.setEx(`product:${id}`, 3600, JSON.stringify(product));
  return product;
}
```

## 安全性

### 受管理的身份配置

```bicep
// Enable managed identity for all services
resource productService 'Microsoft.App/containerApps@2023-05-01' = {
  identity: {
    type: 'SystemAssigned'
  }
}

// Grant access to Cosmos DB
resource cosmosRoleAssignment 'Microsoft.DocumentDB/databaseAccounts/sqlRoleAssignments@2023-04-15' = {
  parent: cosmosAccount
  name: guid(productService.id, cosmosAccount.id)
  properties: {
    principalId: productService.identity.principalId
    roleDefinitionId: cosmosBuiltInDataContributor.id
  }
}
```

### 網絡安全

```bicep
// Internal ingress for backend services
resource orderService 'Microsoft.App/containerApps@2023-05-01' = {
  properties: {
    configuration: {
      ingress: {
        external: false  // Only accessible within Container Apps environment
        targetPort: 5000
      }
    }
  }
}
```

### API 金鑰輪替

```bash
# Rotate API keys using Key Vault
az keyvault secret set \
  --vault-name kv-microservices \
  --name api-gateway-key \
  --value $(openssl rand -base64 32)

# Trigger rolling restart
azd deploy api-gateway
```

## 疑難排解

### 服務無法通訊

```bash
# Verify service discovery
az containerapp show --name product-service --resource-group rg-microservices \
  --query properties.configuration.ingress.fqdn

# Test internal connectivity
az containerapp exec --name api-gateway --resource-group rg-microservices \
  --command "curl http://product-service/health"
```

### 服務間延遲過高

```bash
# Check service location
az containerapp show --name product-service --resource-group rg-microservices \
  --query location

# Ensure all services are in same region and environment
```

### 訊息佇列積壓

```bash
# Check Service Bus metrics
az monitor metrics list \
  --resource-id $(az servicebus namespace show --name sb-microservices --resource-group rg-microservices --query id -o tsv) \
  --metric "ActiveMessages" \
  --start-time $(date -u -d '1 hour ago' +%Y-%m-%dT%H:%M:%SZ)

# Scale up notification service
az containerapp update \
  --name notification-service \
  --resource-group rg-microservices \
  --min-replicas 5 \
  --max-replicas 30
```

## 成本分析

### 預估每月成本 (生產環境)

| 資源 | 配置 | 預估成本 |
|------|------|----------|
| API Gateway | 2-10 副本, 1 vCPU, 2GB RAM | $50-200 |
| 產品服務 | 2-20 副本, 0.5 vCPU, 1GB RAM | $40-300 |
| 訂單服務 | 3-30 副本, 1 vCPU, 2GB RAM | $100-500 |
| 用戶服務 | 2-15 副本, 0.5 vCPU, 1GB RAM | $40-250 |
| 通知服務 | 1-10 副本, 0.25 vCPU, 0.5GB RAM | $20-100 |
| Cosmos DB | 400 RU/s, 10GB 儲存 | $24 |
| Azure SQL | 基本層 | $5 |
| Service Bus | 標準層 | $10 |
| Application Insights | 5GB/月 | $10 |
| **總計** | | **$299-1,399/月** |

### 成本優化提示

```bash
# Use scale-to-zero for non-critical services
azd env set NOTIFICATION_MIN_REPLICAS 0

# Use consumption-based Cosmos DB
azd env set COSMOS_THROUGHPUT_MODE serverless

# Enable request-based autoscaling
azd env set SCALE_RULE_TYPE http
azd env set CONCURRENT_REQUESTS 100
```

## 清理

```bash
# Remove all resources
azd down --force --purge
```

## 下一步

- 添加 [API Management](https://learn.microsoft.com/azure/api-management/) 以獲取進階網關功能
- 實現 [Dapr](https://dapr.io/) 以提供服務網格能力
- 添加 [Azure Front Door](https://learn.microsoft.com/azure/frontdoor/) 以進行全球負載平衡
- 設置 [Azure Monitor Workbooks](https://learn.microsoft.com/azure/azure-monitor/visualize/workbooks-overview) 以建立自訂儀表板

## 其他資源

- [微服務架構指南](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [容器應用程式最佳實踐](https://learn.microsoft.com/azure/container-apps)
- [使用 Application Insights 進行分佈式追蹤](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
此文件已使用人工智能翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。我們致力於提供準確的翻譯，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議使用專業的人類翻譯。我們不對因使用此翻譯而引起的任何誤解或錯誤解釋負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->