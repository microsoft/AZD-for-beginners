<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "933ed5b10b761a61ac633494eb275d8c",
  "translation_date": "2025-11-19T12:49:31+00:00",
  "source_file": "examples/container-app/microservices/README.md",
  "language_code": "zh"
}
-->
# 微服务架构 - 容器应用示例

一个可用于生产环境的微服务架构，通过 AZD CLI 部署到 Azure 容器应用。本示例展示了服务间通信、消息队列和分布式追踪。

## 架构

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

✅ **服务发现**：基于 DNS 的服务自动发现  
✅ **负载均衡**：内置跨副本的负载均衡  
✅ **自动扩展**：每个服务独立扩展  
✅ **健康监控**：存活性和就绪性探针  
✅ **分布式追踪**：与 Application Insights 集成  
✅ **消息队列**：使用 Service Bus 进行异步处理  
✅ **托管身份**：安全访问 Azure 资源  
✅ **蓝绿部署**：零停机时间的部署  

## 先决条件

```bash
# Verify AZD installation
azd version

# Verify Azure CLI
az version

# Login to Azure
azd auth login
```

## 快速开始

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

## 项目结构

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

## 服务概览

### API 网关 (Node.js)

**端口**: 8080  
**用途**: 将请求路由到相应的微服务  
**端点**:
- `GET /health` - 健康检查
- `GET /api/products/*` - 产品服务路由
- `GET /api/orders/*` - 订单服务路由
- `GET /api/users/*` - 用户服务路由

**功能**:
- 请求路由
- 速率限制
- JWT 身份验证
- 请求/响应日志记录

### 产品服务 (Python)

**端口**: 8000  
**数据库**: Cosmos DB  
**用途**: 管理产品目录  
**端点**:
- `GET /products` - 列出产品
- `GET /products/{id}` - 获取产品详情
- `POST /products` - 创建产品
- `PUT /products/{id}` - 更新产品
- `DELETE /products/{id}` - 删除产品

### 订单服务 (C#)

**端口**: 5000  
**数据库**: Azure SQL  
**用途**: 处理和管理订单  
**端点**:
- `GET /orders` - 列出订单
- `GET /orders/{id}` - 获取订单详情
- `POST /orders` - 创建订单
- `PUT /orders/{id}/status` - 更新订单状态

**功能**:
- 事务管理
- 使用 Saga 模式处理分布式事务
- 向 Service Bus 发布事件

### 用户服务 (Go)

**端口**: 9000  
**数据库**: Cosmos DB  
**用途**: 用户身份验证和个人资料管理  
**端点**:
- `POST /auth/login` - 用户登录
- `POST /auth/register` - 用户注册
- `GET /users/{id}` - 获取用户资料
- `PUT /users/{id}` - 更新资料

### 通知服务 (Node.js)

**用途**: 处理来自队列的通知事件  
**触发器**: Service Bus 消息  
**通知类型**:
- 邮件通知
- 短信提醒
- 推送通知

## 部署

### 全部服务部署

```bash
# Deploy infrastructure and all services
azd up
```

### 单个服务部署

```bash
# Deploy only product service
azd deploy product-service

# Deploy only order service
azd deploy order-service
```

### 蓝绿部署

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

### 环境变量

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

### 扩展配置

```bash
# Set scaling rules per service
azd env set PRODUCT_MIN_REPLICAS 2
azd env set PRODUCT_MAX_REPLICAS 20

azd env set ORDER_MIN_REPLICAS 3
azd env set ORDER_MAX_REPLICAS 30
```

## 服务通信

### 同步通信 (HTTP)

服务通过内部 DNS 名称通信：

```javascript
// From API Gateway to Product Service
const response = await fetch('http://product-service/products');

// From Order Service to User Service
const user = await httpClient.get('http://user-service/users/123');
```

### 异步通信 (Service Bus)

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

## 监控

### 查看所有服务日志

```bash
# Stream logs from all services
azd logs --follow

# View logs for specific service
azd logs product-service --tail 100
```

### Application Insights 查询

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

### 自定义指标仪表盘

```bash
# Open monitoring dashboard
azd monitor --overview

# View specific metrics
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.product-service.resourceId') \
  --metric "Requests,CPUPercentage,MemoryPercentage"
```

## 测试

### 集成测试

```bash
# Run integration test suite
cd tests/integration
npm install
npm test

# Test specific service
npm test -- --service=product-service
```

### 压力测试

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

### 端到端测试场景

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

## 性能优化

### 启用 HTTP/2

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

### 连接池

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

### 缓存策略

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

### 托管身份配置

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

### 网络安全

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

### API 密钥轮换

```bash
# Rotate API keys using Key Vault
az keyvault secret set \
  --vault-name kv-microservices \
  --name api-gateway-key \
  --value $(openssl rand -base64 32)

# Trigger rolling restart
azd deploy api-gateway
```

## 故障排除

### 服务无法通信

```bash
# Verify service discovery
az containerapp show --name product-service --resource-group rg-microservices \
  --query properties.configuration.ingress.fqdn

# Test internal connectivity
az containerapp exec --name api-gateway --resource-group rg-microservices \
  --command "curl http://product-service/health"
```

### 服务间高延迟

```bash
# Check service location
az containerapp show --name product-service --resource-group rg-microservices \
  --query location

# Ensure all services are in same region and environment
```

### 消息队列积压

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

### 生产环境的月度成本估算

| 资源 | 配置 | 估算成本 |
|------|------|----------|
| API 网关 | 2-10 副本, 1 vCPU, 2GB RAM | $50-200 |
| 产品服务 | 2-20 副本, 0.5 vCPU, 1GB RAM | $40-300 |
| 订单服务 | 3-30 副本, 1 vCPU, 2GB RAM | $100-500 |
| 用户服务 | 2-15 副本, 0.5 vCPU, 1GB RAM | $40-250 |
| 通知服务 | 1-10 副本, 0.25 vCPU, 0.5GB RAM | $20-100 |
| Cosmos DB | 400 RU/s, 10GB 存储 | $24 |
| Azure SQL | 基础层 | $5 |
| Service Bus | 标准层 | $10 |
| Application Insights | 5GB/月 | $10 |
| **总计** | | **$299-1,399/月** |

### 成本优化建议

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

## 后续步骤

- 添加 [API 管理](https://learn.microsoft.com/azure/api-management/) 以获取高级网关功能
- 实现 [Dapr](https://dapr.io/) 以支持服务网格功能
- 添加 [Azure Front Door](https://learn.microsoft.com/azure/frontdoor/) 以实现全球负载均衡
- 设置 [Azure Monitor Workbooks](https://learn.microsoft.com/azure/azure-monitor/visualize/workbooks-overview) 以创建自定义仪表盘

## 其他资源

- [微服务架构指南](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [容器应用最佳实践](https://learn.microsoft.com/azure/container-apps)
- [使用 Application Insights 的分布式追踪](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：  
本文档使用AI翻译服务[Co-op Translator](https://github.com/Azure/co-op-translator)进行翻译。尽管我们努力确保翻译的准确性，但请注意，自动翻译可能包含错误或不准确之处。原始语言的文档应被视为权威来源。对于关键信息，建议使用专业人工翻译。我们对因使用此翻译而产生的任何误解或误读不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->