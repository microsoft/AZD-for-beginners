# Microservices Architecture - Container App Example

A production-ready microservices architecture deployed to Azure Container Apps using AZD CLI. This example demonstrates service-to-service communication, message queuing, and distributed tracing.

## Architecture

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

## Features

✅ **Service Discovery**: Automatic DNS-based discovery between services  
✅ **Load Balancing**: Built-in load balancing across replicas  
✅ **Auto-scaling**: Independent scaling per service  
✅ **Health Monitoring**: Liveness and readiness probes  
✅ **Distributed Tracing**: Application Insights integration  
✅ **Message Queue**: Async processing with Service Bus  
✅ **Managed Identity**: Secure access to Azure resources  
✅ **Blue-Green Deployment**: Zero-downtime deployments  

## Prerequisites

```bash
# Verify AZD installation
azd version

# Verify Azure CLI
az version

# Login to Azure
azd auth login
```

## Quick Start

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

## Project Structure

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

## Services Overview

### API Gateway (Node.js)

**Port**: 8080  
**Purpose**: Routes requests to appropriate microservices  
**Endpoints**:
- `GET /health` - Health check
- `GET /api/products/*` - Product service routes
- `GET /api/orders/*` - Order service routes
- `GET /api/users/*` - User service routes

**Features**:
- Request routing
- Rate limiting
- JWT authentication
- Request/response logging

### Product Service (Python)

**Port**: 8000  
**Database**: Cosmos DB  
**Purpose**: Manages product catalog  
**Endpoints**:
- `GET /products` - List products
- `GET /products/{id}` - Get product details
- `POST /products` - Create product
- `PUT /products/{id}` - Update product
- `DELETE /products/{id}` - Delete product

### Order Service (C#)

**Port**: 5000  
**Database**: Azure SQL  
**Purpose**: Processes and manages orders  
**Endpoints**:
- `GET /orders` - List orders
- `GET /orders/{id}` - Get order details
- `POST /orders` - Create order
- `PUT /orders/{id}/status` - Update order status

**Features**:
- Transaction management
- Saga pattern for distributed transactions
- Event publishing to Service Bus

### User Service (Go)

**Port**: 9000  
**Database**: Cosmos DB  
**Purpose**: User authentication and profile management  
**Endpoints**:
- `POST /auth/login` - User login
- `POST /auth/register` - User registration
- `GET /users/{id}` - Get user profile
- `PUT /users/{id}` - Update profile

### Notification Service (Node.js)

**Purpose**: Processes notification events from queue  
**Triggers**: Service Bus messages  
**Notifications**:
- Email notifications
- SMS alerts
- Push notifications

## Deployment

### Full Deployment (All Services)

```bash
# Deploy infrastructure and all services
azd up
```

### Deploy Individual Service

```bash
# Deploy only product service
azd deploy product-service

# Deploy only order service
azd deploy order-service
```

### Blue-Green Deployment

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

## Configuration

### Environment Variables

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

### Scaling Configuration

```bash
# Set scaling rules per service
azd env set PRODUCT_MIN_REPLICAS 2
azd env set PRODUCT_MAX_REPLICAS 20

azd env set ORDER_MIN_REPLICAS 3
azd env set ORDER_MAX_REPLICAS 30
```

## Service Communication

### Synchronous Communication (HTTP)

Services communicate using internal DNS names:

```javascript
// From API Gateway to Product Service
const response = await fetch('http://product-service/products');

// From Order Service to User Service
const user = await httpClient.get('http://user-service/users/123');
```

### Asynchronous Communication (Service Bus)

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

## Monitoring

### View All Service Logs

```bash
# Stream logs from all services
azd logs --follow

# View logs for specific service
azd logs product-service --tail 100
```

### Application Insights Queries

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

### Custom Metrics Dashboard

```bash
# Open monitoring dashboard
azd monitor --overview

# View specific metrics
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.product-service.resourceId') \
  --metric "Requests,CPUPercentage,MemoryPercentage"
```

## Testing

### Integration Tests

```bash
# Run integration test suite
cd tests/integration
npm install
npm test

# Test specific service
npm test -- --service=product-service
```

### Load Testing

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

### End-to-End Test Scenario

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

## Performance Optimization

### Enable HTTP/2

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

### Connection Pooling

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

### Caching Strategy

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

## Security

### Managed Identity Configuration

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

### Network Security

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

### API Key Rotation

```bash
# Rotate API keys using Key Vault
az keyvault secret set \
  --vault-name kv-microservices \
  --name api-gateway-key \
  --value $(openssl rand -base64 32)

# Trigger rolling restart
azd deploy api-gateway
```

## Troubleshooting

### Service Can't Communicate

```bash
# Verify service discovery
az containerapp show --name product-service --resource-group rg-microservices \
  --query properties.configuration.ingress.fqdn

# Test internal connectivity
az containerapp exec --name api-gateway --resource-group rg-microservices \
  --command "curl http://product-service/health"
```

### High Latency Between Services

```bash
# Check service location
az containerapp show --name product-service --resource-group rg-microservices \
  --query location

# Ensure all services are in same region and environment
```

### Message Queue Backlog

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

## Cost Analysis

### Estimated Monthly Costs (Production)

| Resource | Configuration | Estimated Cost |
|----------|--------------|----------------|
| API Gateway | 2-10 replicas, 1 vCPU, 2GB RAM | $50-200 |
| Product Service | 2-20 replicas, 0.5 vCPU, 1GB RAM | $40-300 |
| Order Service | 3-30 replicas, 1 vCPU, 2GB RAM | $100-500 |
| User Service | 2-15 replicas, 0.5 vCPU, 1GB RAM | $40-250 |
| Notification Service | 1-10 replicas, 0.25 vCPU, 0.5GB RAM | $20-100 |
| Cosmos DB | 400 RU/s, 10GB storage | $24 |
| Azure SQL | Basic tier | $5 |
| Service Bus | Standard tier | $10 |
| Application Insights | 5GB/month | $10 |
| **Total** | | **$299-1,399/month** |

### Cost Optimization Tips

```bash
# Use scale-to-zero for non-critical services
azd env set NOTIFICATION_MIN_REPLICAS 0

# Use consumption-based Cosmos DB
azd env set COSMOS_THROUGHPUT_MODE serverless

# Enable request-based autoscaling
azd env set SCALE_RULE_TYPE http
azd env set CONCURRENT_REQUESTS 100
```

## Clean Up

```bash
# Remove all resources
azd down --force --purge
```

## Next Steps

- Add [API Management](https://learn.microsoft.com/azure/api-management/) for advanced gateway features
- Implement [Dapr](https://dapr.io/) for service mesh capabilities
- Add [Azure Front Door](https://learn.microsoft.com/azure/frontdoor/) for global load balancing
- Set up [Azure Monitor Workbooks](https://learn.microsoft.com/azure/azure-monitor/visualize/workbooks-overview) for custom dashboards

## Additional Resources

- [Microservices Architecture Guide](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Container Apps Best Practices](https://learn.microsoft.com/azure/container-apps)
- [Distributed Tracing with Application Insights](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
