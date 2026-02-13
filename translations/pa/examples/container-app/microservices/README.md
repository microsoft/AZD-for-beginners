# Microservices Architecture - Container App Example

⏱️ **Estimated Time**: 25-35 minutes | 💰 **Estimated Cost**: ~$50-100/month | ⭐ **Complexity**: Advanced

A **simplified but functional** microservices architecture deployed to Azure Container Apps using AZD CLI. This example demonstrates service-to-service communication, container orchestration, and monitoring with a practical 2-service setup.

> **📚 Learning Approach**: This example starts with a minimal 2-service architecture (API Gateway + Backend Service) that you can actually deploy and learn from. After mastering this foundation, we provide guidance for expanding to a full microservices ecosystem.

## What You'll Learn

By completing this example, you will:
- Deploy multiple containers to Azure Container Apps
- Implement service-to-service communication with internal networking
- Configure environment-based scaling and health checks
- Monitor distributed applications with Application Insights
- Understand microservices deployment patterns and best practices
- Learn progressive expansion from simple to complex architectures

## Architecture

### Phase 1: What We're Building (Included in This Example)

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

**Why Start Simple?**
- ✅ Deploy and understand quickly (25-35 minutes)
- ✅ Learn core microservices patterns without complexity
- ✅ Working code you can modify and experiment with
- ✅ Lower cost for learning (~$50-100/month vs $300-1400/month)
- ✅ Build confidence before adding databases and message queues

**Analogy**: Think of this like learning to drive. You start with an empty parking lot (2 services), master the basics, then progress to city traffic (5+ services with databases).

### Phase 2: Future Expansion (Reference Architecture)

Once you master the 2-service architecture, you can expand to:

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

See "Expansion Guide" section at the end for step-by-step instructions.

## Features Included

✅ **Service Discovery**: Automatic DNS-based discovery between containers  
✅ **Load Balancing**: Built-in load balancing across replicas  
✅ **Auto-scaling**: Independent scaling per service based on HTTP requests  
✅ **Health Monitoring**: Liveness and readiness probes for both services  
✅ **Distributed Logging**: Centralized logging with Application Insights  
✅ **Internal Networking**: Secure service-to-service communication  
✅ **Container Orchestration**: Automatic deployment and scaling  
✅ **Zero-Downtime Updates**: Rolling updates with revision management  

## Prerequisites

### Required Tools

Before starting, verify you have these tools installed:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (version 1.0.0 or higher)
   ```bash
   azd version
   # ਉਮੀਦ ਕੀਤੀ ਆਉਟਪੁੱਟ: azd ਵਰਜਨ 1.0.0 ਜਾਂ ਇਸ ਤੋਂ ਉੱਪਰ
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (version 2.50.0 or higher)
   ```bash
   az --version
   # ਉਮੀਦ ਕੀਤੀ ਆਉਟਪੁੱਟ: azure-cli 2.50.0 ਜਾਂ ਇਸ ਤੋਂ ਵੱਧ
   ```

3. **[Docker](https://www.docker.com/get-started)** (for local development/testing - optional)
   ```bash
   docker --version
   # ਉਮੀਦ ਕੀਤੀ ਆਉਟਪੁੱਟ: Docker ਵਰਜਨ 20.10 ਜਾਂ ਇਸ ਤੋਂ ਉੱਚਾ
   ```

### Azure Requirements

- An active **Azure subscription** ([create a free account](https://azure.microsoft.com/free/))
- Permissions to create resources in your subscription
- **Contributor** role on the subscription or resource group

### Knowledge Prerequisites

This is an **advanced-level** example. You should have:
- Completed the [Simple Flask API example](../../../../../examples/container-app/simple-flask-api) 
- Basic understanding of microservices architecture
- Familiarity with REST APIs and HTTP
- Understanding of container concepts

**New to Container Apps?** Start with the [Simple Flask API example](../../../../../examples/container-app/simple-flask-api) first to learn the basics.

## Quick Start (Step-by-Step)

### Step 1: Clone and Navigate

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ Success Check**: Verify you see `azure.yaml`:
```bash
ls
# ਉਮੀਦ: README.md, azure.yaml, infra/, src/
```

### Step 2: Authenticate with Azure

```bash
azd auth login
```

This opens your browser for Azure authentication. Sign in with your Azure credentials.

**✓ Success Check**: You should see:
```
Logged in to Azure.
```

### Step 3: Initialize the Environment

```bash
azd init
```

**Prompts you'll see**:
- **Environment name**: Enter a short name (e.g., `microservices-dev`)
- **Azure subscription**: Select your subscription
- **Azure location**: Choose a region (e.g., `eastus`, `westeurope`)

**✓ Success Check**: You should see:
```
SUCCESS: New project initialized!
```

### Step 4: Deploy Infrastructure and Services

```bash
azd up
```

**What happens** (takes 8-12 minutes):
1. Creates Container Apps environment
2. Creates Application Insights for monitoring
3. Builds API Gateway container (Node.js)
4. Builds Product Service container (Python)
5. Deploys both containers to Azure
6. Configures networking and health checks
7. Sets up monitoring and logging

**✓ Success Check**: You should see:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ Time**: 8-12 minutes

### Step 5: Test the Deployment

```bash
# ਗੇਟਵੇ ਐਂਡਪੌਇੰਟ ਪ੍ਰਾਪਤ ਕਰੋ
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# API ਗੇਟਵੇ ਦੀ ਸਿਹਤ ਦੀ ਜਾਂਚ ਕਰੋ
curl $GATEWAY_URL/health

# ਉਮੀਦਿਤ ਆਉਟਪੁੱਟ:
# {"status":"ਸਿਹਤਮੰਦ","service":"api-ਗੇਟਵੇ","timestamp":"2025-11-19T10:30:00Z"}
```

**Test product service through gateway**:
```bash
# ਉਤਪਾਦਾਂ ਦੀ ਸੂਚੀ
curl $GATEWAY_URL/api/products

# ਉਮੀਦ ਕੀਤੀ ਨਤੀਜਾ:
# [
#   {"id":1,"name":"Laptop","price":999.99,"stock":50},
#   {"id":2,"name":"Mouse","price":29.99,"stock":200},
#   {"id":3,"name":"Keyboard","price":79.99,"stock":150}
# ]
```

**✓ Success Check**: Both endpoints return JSON data without errors.

---

**🎉 Congratulations!** You've deployed a microservices architecture to Azure!

## Project Structure

All implementation files are included—this is a complete, working example:

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

**What Each Component Does:**

**Infrastructure (infra/)**:
- `main.bicep`: Orchestrates all Azure resources and their dependencies
- `core/container-apps-environment.bicep`: Creates the Container Apps environment and Azure Container Registry
- `core/monitor.bicep`: Sets up Application Insights for distributed logging
- `app/*.bicep`: Individual container app definitions with scaling and health checks

**API Gateway (src/api-gateway/)**:
- Public-facing service that routes requests to backend services
- Implements logging, error handling, and request forwarding
- Demonstrates service-to-service HTTP communication

**Product Service (src/product-service/)**:
- Internal service with product catalog (in-memory for simplicity)
- REST API with health checks
- Example of backend microservice pattern

## Services Overview

### API Gateway (Node.js/Express)

**Port**: 8080  
**Access**: Public (external ingress)  
**Purpose**: Routes incoming requests to appropriate backend services  

**Endpoints**:
- `GET /` - Service information
- `GET /health` - Health check endpoint
- `GET /api/products` - Forward to product service (list all)
- `GET /api/products/:id` - Forward to product service (get by ID)

**Key Features**:
- Request routing with axios
- Centralized logging
- Error handling and timeout management
- Service discovery via environment variables
- Application Insights integration

**Code Highlight** (`src/api-gateway/app.js`):
```javascript
// ਅੰਦਰੂਨੀ ਸੇਵਾ ਸੰਚਾਰ
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Product Service (Python/Flask)

**Port**: 8000  
**Access**: Internal only (no external ingress)  
**Purpose**: Manages product catalog with in-memory data  

**Endpoints**:
- `GET /` - Service information
- `GET /health` - Health check endpoint
- `GET /products` - List all products
- `GET /products/<id>` - Get product by ID

**Key Features**:
- RESTful API with Flask
- In-memory product store (simple, no database needed)
- Health monitoring with probes
- Structured logging
- Application Insights integration

**Data Model**:
```python
{
  "id": 1,
  "name": "Laptop",
  "description": "High-performance laptop",
  "price": 999.99,
  "stock": 50
}
```

**Why Internal Only?**
The product service is not exposed publicly. All requests must go through the API Gateway, which provides:
- Security: Controlled access point
- Flexibility: Can change backend without affecting clients
- Monitoring: Centralized request logging

## Understanding Service Communication

### How Services Talk to Each Other

In this example, the API Gateway communicates with the Product Service using **internal HTTP calls**:

```javascript
// API ਗੇਟਵੇ (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// ਅੰਦਰੂਨੀ HTTP ਬੇਨਤੀ ਕਰੋ
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Key Points**:

1. **DNS-Based Discovery**: Container Apps automatically provides DNS for internal services
   - Product Service FQDN: `product-service.internal.<environment>.azurecontainerapps.io`
   - Simplified as: `http://product-service` (Container Apps resolves it)

2. **No Public Exposure**: Product Service has `external: false` in Bicep
   - Only accessible within the Container Apps environment
   - Cannot be reached from the internet

3. **Environment Variables**: Service URLs are injected at deployment time
   - Bicep passes the internal FQDN to the gateway
   - No hardcoded URLs in application code

**Analogy**: Think of this like office rooms. The API Gateway is the reception desk (public-facing), and the Product Service is an office room (internal only). Visitors must go through reception to reach any office.

## Deployment Options

### Full Deployment (Recommended)

```bash
# ਬੁਨਿਆਦੀ ਢਾਂਚਾ ਅਤੇ ਦੋਵਾਂ ਸੇਵਾਵਾਂ ਨੂੰ ਤੈਨਾਤ ਕਰੋ
azd up
```

This deploys:
1. Container Apps environment
2. Application Insights
3. Container Registry
4. API Gateway container
5. Product Service container

**Time**: 8-12 minutes

### Deploy Individual Service

```bash
# ਕੇਵਲ ਇੱਕ ਸੇਵਾ ਤੈਨਾਤ ਕਰੋ (ਸ਼ੁਰੂਆਤੀ azd up ਤੋਂ ਬਾਅਦ)
azd deploy api-gateway

# ਜਾਂ ਪ੍ਰੋਡਕਟ ਸੇਵਾ ਤੈਨਾਤ ਕਰੋ
azd deploy product-service
```

**Use Case**: When you've updated code in one service and want to redeploy only that service.

### Update Configuration

```bash
# ਸਕੇਲਿੰਗ ਪੈਰਾਮੀਟਰਾਂ ਨੂੰ ਬਦਲੋ
azd env set GATEWAY_MAX_REPLICAS 30

# ਨਵੀਂ ਸੰਰਚਨਾ ਨਾਲ ਮੁੜ ਤੈਨਾਤ ਕਰੋ
azd up
```

## Configuration

### Scaling Configuration

Both services are configured with HTTP-based autoscaling in their Bicep files:

**API Gateway**:
- Min replicas: 2 (always at least 2 for availability)
- Max replicas: 20
- Scale trigger: 50 concurrent requests per replica

**Product Service**:
- Min replicas: 1 (can scale to zero if needed)
- Max replicas: 10
- Scale trigger: 100 concurrent requests per replica

**Customize Scaling** (in `infra/app/*.bicep`):
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

### Resource Allocation

**API Gateway**:
- CPU: 1.0 vCPU
- Memory: 2 GiB
- Reason: Handles all external traffic

**Product Service**:
- CPU: 0.5 vCPU
- Memory: 1 GiB
- Reason: Lightweight in-memory operations

### Health Checks

Both services include liveness and readiness probes:

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

**What This Means**:
- **Liveness**: If health check fails, Container Apps restarts the container
- **Readiness**: If not ready, Container Apps stops routing traffic to that replica



## Monitoring & Observability

### View Service Logs

```bash
# azd monitor ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਲੌਗ ਵੇਖੋ
azd monitor --logs

# ਜਾਂ ਖਾਸ Container Apps ਲਈ Azure CLI ਵਰਤੋਂ:
# API Gateway ਤੋਂ ਲੌਗ ਸਟ੍ਰੀਮ ਕਰੋ
az containerapp logs show --name api-gateway --resource-group $RG_NAME --follow

# ਹਾਲੀਆ ਉਤਪਾਦ ਸੇਵਾ ਦੇ ਲੌਗ ਵੇਖੋ
az containerapp logs show --name product-service --resource-group $RG_NAME --tail 100
```

**Expected Output**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Application Insights Queries

Access Application Insights in Azure Portal, then run these queries:

**Find Slow Requests**:
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**Track Service-to-Service Calls**:
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

**Error Rate by Service**:
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

**Request Volume Over Time**:
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### Access Monitoring Dashboard

```bash
# Application Insights ਦੇ ਵੇਰਵੇ ਪ੍ਰਾਪਤ ਕਰੋ
azd env get-values | grep APPLICATIONINSIGHTS

# Azure ਪੋਰਟਲ ਵਿੱਚ ਮਾਨੀਟਰਿੰਗ ਖੋਲ੍ਹੋ
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### Live Metrics

1. Navigate to Application Insights in Azure Portal
2. Click "Live Metrics"
3. See real-time requests, failures, and performance
4. Test by running: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Practical Exercises

[Note: See full exercises above in the "Practical Exercises" section for detailed step-by-step exercises including deployment verification, data modification, autoscaling tests, error handling, and adding a third service.]

## Cost Analysis

### Estimated Monthly Costs (For This 2-Service Example)

| Resource | Configuration | Estimated Cost |
|----------|--------------|----------------|
| API Gateway | 2-20 replicas, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 replicas, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Basic tier | $5 |
| Application Insights | 1-2 GB/month | $5-10 |
| Log Analytics | 1 GB/month | $3 |
| **Total** | | **$58-243/month** |

**Cost Breakdown by Usage**:
- **Light traffic** (testing/learning): ~$60/month
- **Moderate traffic** (small production): ~$120/month
- **High traffic** (busy periods): ~$240/month

### Cost Optimization Tips

1. **Scale to Zero for Development**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Use Consumption Plan for Cosmos DB** (when you add it):
   - Pay only for what you use
   - No minimum charge

3. **Set Application Insights Sampling**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // ਬੇਨਤੀਆਂ ਵਿੱਚੋਂ 50% ਦਾ ਨਮੂਨਾ ਲਓ
   ```

4. **Clean Up When Not Needed**:
   ```bash
   azd down
   ```

### Free Tier Options
For learning/testing, consider:
- Azure ਦੇ ਮੁਫ਼ਤ ਕਰੈਡਿਟ ਦੀ ਵਰਤੋਂ ਕਰੋ (ਪਹਿਲੇ 30 ਦਿਨ)
- ਨਿੱਕੀ ਤੋਂ ਨਿੱਕੀ ਨਕਲਾਂ ਰੱਖੋ
- ਟੈਸਟਿੰਗ ਦੇ ਬਾਅਦ ਮਿਟਾ ਦਿਓ (ਕੋਈ جاري ਖਰਚੇ ਨਹੀਂ)

---

## Cleanup

ਜਾਰੀ ਰਹਿਣ ਵਾਲੇ ਖਰਚਿਆਂ ਤੋਂ ਬਚਣ ਲਈ, ਸਾਰੇ ਰਿਸੋਰਸ ਮਿਟਾ ਦਿਓ:

```bash
azd down --force --purge
```

**Confirmation Prompt**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

Type `y` to confirm.

**What Gets Deleted**:
- Container Apps Environment
- ਦੋਹਾਂ Container Apps (gateway & product service)
- Container Registry
- Application Insights
- Log Analytics Workspace
- Resource Group

**✓ Verify Cleanup**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Should return empty.

---

## Expansion Guide: From 2 to 5+ Services

ਜਦੋਂ ਤੁਸੀਂ ਇਸ 2-ਸੇਵਾ ਆਰਕੀਟੈਕਚਰ 'ਤੇ ਕਾਬੂ ਪਾ ਲਓਗੇ, ਤਾਂ ਇਹਨਾਂ ਤਰੀਕਿਆਂ ਨਾਲ ਵਿਸਥਾਰ ਕਰੋ:

### Phase 1: Add Database Persistence (Next Step)

**Add Cosmos DB for Product Service**:

1. Create `infra/core/cosmos.bicep`:
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

2. Update product service to use Cosmos DB instead of in-memory data

3. Estimated additional cost: ~$25/month (serverless)

### Phase 2: Add Third Service (Order Management)

**Create Order Service**:

1. New folder: `src/order-service/` (Python/Node.js/C#)
2. New Bicep: `infra/app/order-service.bicep`
3. Update API Gateway to route `/api/orders`
4. Add Azure SQL Database for order persistence

**Architecture becomes**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### Phase 3: Add Async Communication (Service Bus)

**Implement Event-Driven Architecture**:

1. Add Azure Service Bus: `infra/core/servicebus.bicep`
2. Product Service publishes "ProductCreated" events
3. Order Service subscribes to product events
4. Add Notification Service to process events

**Pattern**: Request/Response (HTTP) + Event-Driven (Service Bus)

### Phase 4: Add User Authentication

**Implement User Service**:

1. Create `src/user-service/` (Go/Node.js)
2. Add Azure AD B2C or custom JWT authentication
3. API Gateway validates tokens
4. Services check user permissions

### Phase 5: Production Readiness

**Add These Components**:
- Azure Front Door (ਗਲੋਬਲ ਲੋਡ ਬੈਲੰਸਿੰਗ)
- Azure Key Vault (ਸੀਕ੍ਰੈਟ ਮੈਨੇਜਮੈਂਟ)
- Azure Monitor Workbooks (ਕਸਟਮ ਡੈਸ਼ਬੋਰਡ)
- CI/CD Pipeline (GitHub Actions)
- Blue-Green Deployments
- ਸਾਰੇ ਸੇਵਾਵਾਂ ਲਈ Managed Identity

**Full Production Architecture Cost**: ~$300-1,400/month

---

## Learn More

### Related Documentation
- [Azure Container Apps Documentation](https://learn.microsoft.com/azure/container-apps/)
- [Microservices Architecture Guide](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights for Distributed Tracing](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Next Steps in This Course
- ← Previous: [Simple Flask API](../../../../../examples/container-app/simple-flask-api) - ਸ਼ੁਰੂਆਤੀ ਇਕ-ਕੰਟੇਨਰ ਉਦਾਹਰਨ
- → Next: [AI Integration Guide](../../../../../examples/docs/ai-foundry) - AI ਸਮਰੱਥਾਵਾਂ ਸ਼ਾਮِل ਕਰੋ
- 🏠 [Course Home](../../README.md)

### Comparison: When to Use What

**Single Container App** (Simple Flask API example):
- ✅ ਸਧਾਰਣ ਐਪਲੀਕੇਸ਼ਨ
- ✅ ਮੋਨੋਲਿਥਿਕ ਆਰਕੀਟੈਕਚਰ
- ✅ ਤੇਜ਼ ਡਿਪਲੋਯਮੈਂਟ
- ❌ ਸੀਮਿਤ ਸਕੇਲਬਿਲਟੀ
- **ਲਾਗਤ**: ~$15-50/month

**Microservices** (This example):
- ✅ ਜਟਿਲ ਐਪਲੀਕੇਸ਼ਨ
- ✅ ਹਰ ਸੇਵਾ ਲਈ ਅਜ਼ਾਦ ਸਕੇਲਿੰਗ
- ✅ ਟੀਮ ਆਤਮਨਿਰਭਰਤਾ (ਵੱਖ-ਵੱਖ ਸੇਵਾਵਾਂ, ਵੱਖ-ਵੱਖ ਟੀਮਾਂ)
- ❌ ਪ੍ਰਬੰਧਨ ਲਈ ਵਧੇਰੇ ਜਟਿਲਤਾ
- **ਲਾਗਤ**: ~$60-250/month

**Kubernetes (AKS)**:
- ✅ ਅਧਿਕਤਮ ਕੰਟਰੋਲ ਅਤੇ ਲਚਕੀਲਾਪਨ
- ✅ ਮਲਟੀ-ਕਲਾਉਡ ਪੋਰਟੇਬਿਲਿਟੀ
- ✅ ਐਡਵਾਂਸਡ ਨੈਟਵਰਕਿੰਗ
- ❌ Kubernetes ਮਹਾਰਤ ਦੀ ਲੋੜ
- **ਲਾਗਤ**: ~$150-500/month minimum

**Recommendation**: Container Apps (ਇਸ ਉਦਾਹਰਨ) ਨਾਲ ਸ਼ੁਰੂ ਕਰੋ, ਕੇਵਲ ਜੇ ਤੁਹਾਨੂੰ Kubernetes-ਵਸ਼ੇਸ਼ ਫੀਚਰਾਂ ਦੀ ਲੋੜ ਹੋਵੇ ਤਾਂ AKS ਵੱਲ ਵਧੋ।

---

## Frequently Asked Questions

**Q: Why only 2 services instead of 5+?**  
A: ਪਾਠਕ੍ਰਮਕ ਤਰੱਕੀ। ਜਟਿਲਤਾ ਜੋੜਨ ਤੋਂ ਪਹਿਲਾਂ ਹਨੇਰੇ ਨਿਯਮ (ਸੇਵਾ ਸੰਚਾਰ, ਮਾਨੀਟਰਿੰਗ, ਸਕੇਲਿੰਗ) ਨੂੰ ਸਿੱਖਣ ਲਈ ਸਰਲ ਉਦਾਹਰਨ ਨਾਲ ਮੁਢਲੀ ਨਿਯਮਾਂ 'ਤੇ ਮਾਹਰ ਬਣੋ। ਇੱਥੇ ਸਿੱਖੇ ਪੈਟਰਨ 100-ਸੇਵਾ ਆਰਕੀਟੈਕਚਰਾਂ 'ਤੇ ਵੀ ਲਾਗੂ ਹੁੰਦੇ ਹਨ।

**Q: Can I add more services myself?**  
A: ਬਿਲਕੁਲ! ਉੱਪਰ ਦਿੱਤੇ Expansion Guide ਨੂੰ ਫੋਲੋ ਕਰੋ। ਹਰ ਨਵੀਂ ਸੇਵਾ ਇੱਕੋ ਜਿਹਾ ਪੈਟਰਨ ਫੋਲੋ ਕਰਦੀ ਹੈ: src ਫੋਲਡਰ ਬਣਾਓ, Bicep ਫਾਇਲ ਬਣਾਓ, azure.yaml ਅੱਪਡੇਟ ਕਰੋ, ਤੇ ਡਿਪਲੋਏ ਕਰੋ।

**Q: Is this production-ready?**  
A: ਇਹ ਇੱਕ ਮਜ਼ਬੂਤ ਬੁਨਿਆਦ ਹੈ। ਪ੍ਰੋਡਕਸ਼ਨ ਲਈ ਸ਼ਾਮِل ਕਰੋ: managed identity, Key Vault, ਸਥਾਈ ਡੇਟਾਬੇਸ, CI/CD ਪਾਈਪਲਾਈਨ, monitoring alerts, ਅਤੇ ਬੈਕਅੱਪ ਰਣਨੀਤੀ।

**Q: Why not use Dapr or other service mesh?**  
A: ਸਿੱਖਣ ਲਈ ਸਧਾਰਨ ਰੱਖੋ। ਜਦੋਂ ਤੁਸੀਂ ਨੇਟਿਵ Container Apps ਨੈਟਵਰਕਿੰਗ ਨੂੰ ਸਮਝ ਲੈਂਦੇ ਹੋ, ਤਾਂ ਉन्नਤ ਸਿਨਾਰੀਆਂ ਲਈ Dapr ਜੋੜ ਸਕਦੇ ਹੋ।

**Q: How do I debug locally?**  
A: Docker ਨਾਲ ਸੇਵਾਵਾਂ ਲੋਕਲ ਤੌਰ 'ਤੇ ਚਲਾਓ:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**Q: Can I use different programming languages?**  
A: ਹਾਂ! ਇਸ ਉਦਾਹਰਨ ਵਿੱਚ Node.js (gateway) + Python (product service) ਦਿਖਾਇਆ ਗਿਆ ਹੈ। ਤੁਸੀਂ ਕੋਈ ਵੀ ਭਾਸ਼ਾ ਮਿਲਾ ਕੇ ਵਰਤ ਸਕਦੇ ਹੋ ਜੋ ਕੰਟੇਨਰਾਂ ਵਿੱਚ ਚਲਦੀ ਹੋਵੇ।

**Q: What if I don't have Azure credits?**  
A: Azure ਮੁਫ਼ਤ ਟੀਅਰ ਵਰਤੋਂ (ਨਵੇਂ ਅਕਾਊਂਟਾਂ ਲਈ ਪਹਿਲੇ 30 ਦਿਨ) ਜਾਂ ਛੋਟੇ ਟੈਸਟਿੰਗ ਅੰਤਰਾਲਾਂ ਲਈ ਡਿਪਲੋਏ ਕਰੋ ਅਤੇ ਤੁਰੰਤ ਮਿਟਾ ਦਿਓ।

---

> **🎓 Learning Path Summary**: ਤੁਸੀਂ ਸਵੈ-ਸਕੇਲਿੰਗ, ਅੰਦਰੂਨੀ ਨੈਟਵਰਕਿੰਗ, ਕੇਂਦਰੀਕ੍ਰਿਤ ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਪ੍ਰੋਡਕਸ਼ਨ-ਰੈਡੀ ਪੈਟਰਨਾਂ ਨਾਲ ਇੱਕ ਮਲਟੀ-ਸੇਵਾ ਆਰਕੀਟੈਕਚਰ ਡਿਪਲੋਏ ਕਰਨਾ ਸਿੱਖ ਲਿਆ ਹੈ। ਇਹ ਬੁਨਿਆਦ ਤੁਹਾਨੂੰ ਜਟਿਲ ਵੰਡੇ ਗਏ ਸਿਸਟਮਾਂ ਅਤੇ ਉਦਯੋਗਿਕ ਮਾਈਕ੍ਰੋਸਰਵਿਸ ਆਰਕੀਟੈਕਚਰਾਂ ਲਈ ਤਿਆਰ ਕਰਦੀ ਹੈ।

**📚 Course Navigation:**
- ← Previous: [Simple Flask API](../../../../../examples/container-app/simple-flask-api)
- → Next: [Database Integration Example](../../../../../examples/database-app)
- 🏠 [Course Home](../../../README.md)
- 📖 [Container Apps Best Practices](../../../docs/chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ਡਿਸਕਲੇਮਰ:
ਇਹ ਦਸਤਾਵੇਜ਼ AI ਅਨੁਵਾਦ ਸੇਵਾ Co-op Translator (https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਅਸੀਂ ਸਹੀਅਤ ਲਈ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਪਰ ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਤ੍ਰੁੱਟੀਆਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਇਸਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਹੀ ਪ੍ਰਮਾਣਿਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਿਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੇ ਉਪਯੋਗ ਨਾਲ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਮੀ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->