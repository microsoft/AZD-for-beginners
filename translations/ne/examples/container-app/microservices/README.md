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
   # अपेक्षित आउटपुट: azd संस्करण 1.0.0 वा सोभन्दा उच्च
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (version 2.50.0 or higher)
   ```bash
   az --version
   # अपेक्षित आउटपुट: azure-cli 2.50.0 वा सो भन्दा माथि
   ```

3. **[Docker](https://www.docker.com/get-started)** (for local development/testing - optional)
   ```bash
   docker --version
   # अपेक्षित आउटपुट: Docker संस्करण 20.10 वा त्यसभन्दा नयाँ
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
# अपेक्षित: README.md, azure.yaml, infra/, src/
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
# गेटवे अन्तबिन्दु प्राप्त गर्नुहोस्
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# API गेटवेको स्वास्थ्य परीक्षण गर्नुहोस्
curl $GATEWAY_URL/health

# अपेक्षित आउटपुट:
# {"status":"स्वस्थ","service":"एपीआई-गेटवे","timestamp":"2025-11-19T10:30:00Z"}
```

**Test product service through gateway**:
```bash
# उत्पादनहरू सूचीबद्ध गर्नुहोस्
curl $GATEWAY_URL/api/products

# अपेक्षित आउटपुट:
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
// आन्तरिक सेवा सञ्चार
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
// एपीआई गेटवे (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// आन्तरिक HTTP अनुरोध गर्नुहोस्
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
# पूर्वाधार र दुवै सेवाहरू तैनाथ गर्नुहोस्
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
# केवल एउटा सेवा तैनात गर्नुहोस् (प्रारम्भिक azd up पछि)
azd deploy api-gateway

# वा प्रोडक्ट सेवा तैनात गर्नुहोस्
azd deploy product-service
```

**Use Case**: When you've updated code in one service and want to redeploy only that service.

### Update Configuration

```bash
# स्केलिङ प्यारामिटरहरू परिवर्तन गर्नुहोस्
azd env set GATEWAY_MAX_REPLICAS 30

# नयाँ कन्फिगरेसनसहित पुनः तैनाथ गर्नुहोस्
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
# azd monitor प्रयोग गरी लगहरू हेर्नुहोस्
azd monitor --logs

# वा विशिष्ट Container Apps का लागि Azure CLI प्रयोग गर्नुहोस्:
# API Gateway बाट लगहरू स्ट्रीम गर्नुहोस्
az containerapp logs show --name api-gateway --resource-group $RG_NAME --follow

# हालैका उत्पादन सेवा लगहरू हेर्नुहोस्
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
# Application Insights को विवरण प्राप्त गर्नुहोस्
azd env get-values | grep APPLICATIONINSIGHTS

# Azure Portal मा निगरानी खोल्नुहोस्
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
   appInsights.defaultClient.config.samplingPercentage = 50; // अनुरोधहरूको 50% नमुना गर्नुहोस्
   ```

4. **Clean Up When Not Needed**:
   ```bash
   azd down
   ```

### Free Tier Options
For learning/testing, consider:
- Azure निःशुल्क क्रेडिटहरू प्रयोग गर्नुहोस् (पहिला 30 दिन)
- रिप्लिकाहरू न्यूनतममा राख्नुहोस्
- परीक्षण पछि मेटाउनुहोस् (निरन्तर शुल्क नलागोस्)

---

## Cleanup

To avoid ongoing charges, delete all resources:

```bash
azd down --force --purge
```

**पुष्टिकरण संकेत**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

पुष्टिकरण गर्न `y` टाइप गर्नुहोस्।

**के मेटिनेछ**:
- Container Apps Environment
- Both Container Apps (gateway & product service)
- Container Registry
- Application Insights
- Log Analytics Workspace
- Resource Group

**✓ सफाइ प्रमाणित गर्नुहोस्**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

खाली हुनुपर्छ।

---

## विस्तार मार्गदर्शिका: 2 बाट 5+ सेवाहरू

एक पटक तपाईंले यो 2-सर्भिस आर्किटेक्चरमा निपुण भएपछि, यसरी विस्तार गर्न सकिन्छ:

### चरण 1: डेटाबेस स्थायित्व थप्नुहोस् (अर्को चरण)

**Product Service का लागि Cosmos DB थप्नुहोस्**:

1. सिर्जना गर्नुहोस् `infra/core/cosmos.bicep`:
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

2. Product service लाई in-memory डेटाको सट्टा Cosmos DB प्रयोग गर्ने गरी अपडेट गर्नुहोस्

3. अनुमानित अतिरिक्त लागत: ~$25/महिना (serverless)

### चरण 2: तेस्रो सेवा थप्नुहोस् (Order Management)

**Order Service सिर्जना गर्नुहोस्**:

1. नयाँ फोल्डर: `src/order-service/` (Python/Node.js/C#)
2. नयाँ Bicep: `infra/app/order-service.bicep`
3. API Gateway लाई `/api/orders` रुट गर्न अपडेट गर्नुहोस्
4. अर्डर स्थायित्वका लागि Azure SQL Database थप्नुहोस्

**आर्किटेक्चर यसरी हुन्छ**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### चरण 3: असिन्क्रोन सञ्चार थप्नुहोस् (Service Bus)

**इभेन्ट-ड्राइभन आर्किटेक्चर लागू गर्नुहोस्**:

1. Azure Service Bus थप्नुहोस्: `infra/core/servicebus.bicep`
2. Product Service ले "ProductCreated" इभेन्टहरू प्रकाशित गर्छ
3. Order Service ले product इभेन्टहरूमा सदस्यता लिन्छ
4. इभेन्टहरू प्रक्रिया गर्न Notification Service थप्नुहोस्

**ढाँचा**: अनुरोध/प्रतिक्रिया (HTTP) + इभेन्ट-ड्राइभन (Service Bus)

### चरण 4: प्रयोगकर्ता प्रमाणीकरण थप्नुहोस्

**प्रयोगकर्ता सेवा लागू गर्नुहोस्**:

1. सिर्जना गर्नुहोस् `src/user-service/` (Go/Node.js)
2. Azure AD B2C वा custom JWT प्रमाणीकरण थप्नुहोस्
3. API Gateway ले टोकनहरू मान्य गर्छ
4. सेवाहरूले प्रयोगकर्ताको अनुमति जाँच गर्छन्

### चरण 5: उत्पादन तयारी

**यी कम्पोनेन्टहरू थप्नुहोस्**:
- Azure Front Door (ग्लोबल लोड बेलान्सिङ)
- Azure Key Vault (सिक्रेट व्यवस्थापन)
- Azure Monitor Workbooks (कस्टम ड्यासबोर्डहरू)
- CI/CD पाइपलाइन (GitHub Actions)
- Blue-Green Deployments
- सबै सेवाहरूका लागि Managed Identity

**पूर्ण उत्पादन आर्किटेक्चर लागत**: ~$300-1,400/महिना

---

## थप जान्नुहोस्

### सम्बन्धित दस्तावेजहरू
- [Azure Container Apps दस्तावेजीकरण](https://learn.microsoft.com/azure/container-apps/)
- [माइक्रोसर्भिस आर्किटेक्चर गाइड](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [वितरित ट्रेसिङका लागि Application Insights](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Azure Developer CLI दस्तावेजीकरण](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### यो कोर्सको अर्को चरणहरू
- ← अघिल्लो: [Simple Flask API](../../../../../examples/container-app/simple-flask-api) - शुरुआतकर्ता एकल-कन्टेनर उदाहरण
- → अर्को: [AI Integration Guide](../../../../../examples/docs/ai-foundry) - AI क्षमताहरू थप्नुहोस्
- 🏠 [Course Home](../../README.md)

### तुलना: कहिले के प्रयोग गर्ने

**सिङ्गल कन्टेनर एप** (Simple Flask API उदाहरण):
- ✅ सरल अनुप्रयोगहरू
- ✅ मोनोलीथिक आर्किटेक्चर
- ✅ छिटो डिप्लोय गर्न मिल्ने
- ❌ सीमित स्केलेबिलिटी
- **लागत**: ~$15-50/महिना

**माइक्रोसर्भिसहरू** (यो उदाहरण):
- ✅ जटिल अनुप्रयोगहरू
- ✅ प्रत्येक सेवाको लागि स्वतन्त्र स्केलिङ
- ✅ टिम स्वतन्त्रता (विभिन्न सेवाहरू, विभिन्न टिमहरू)
- ❌ व्यवस्थापनमा अधिक जटिल
- **लागत**: ~$60-250/महिना

**Kubernetes (AKS)**:
- ✅ अधिकतम नियन्त्रण र लचिलोपन
- ✅ बहु-क्लाउड पोर्टेबिलिटी
- ✅ उन्नत नेटवर्किङ
- ❌ Kubernetes विशेषज्ञता आवश्यक
- **लागत**: ~$150-500/महिना न्यूनतम

**सिफारिस**: Container Apps (यो उदाहरण) बाट सुरु गर्नुहोस्, AKS त केवल तब मात्र सर्नुहोस् जब तपाईंलाई Kubernetes-विशिष्ट सुविधाहरू आवश्यक परो।

---

## बारम्बार सोधिने प्रश्नहरू

**प्रश्न: किन 5+ को सट्टा मात्र 2 सेवा?**  
उत्तर: शैक्षिक प्रगति। जटिलता थप्नु अघि आधारभूत कुरा (सेवा संचार, मोनिटरिङ, स्केलिङ) एउटा सरल उदाहरणबाट सिक्नुहोस्। यहाँ सिकेका ढाँचाहरू 100-सेवा आर्किटेक्चरमा पनि लागू हुन्छन्।

**प्रश्न: के म आफैँ थप सेवाहरू थप्न सक्छु?**  
उत्तर: अवश्य! माथिको विस्तार मार्गदर्शिका पालन गर्नुहोस्। प्रत्येक नयाँ सेवा एउटै ढाँचालाई अनुसरण गर्छ: src फोल्डर सिर्जना गर्नुहोस्, Bicep फाइल बनाउनुहोस्, azure.yaml अपडेट गर्नुहोस्, तैनाथ गर्नुहोस्।

**प्रश्न: के यो उत्पादन-तयार छ?**  
उत्तर: यो बलियो आधार हो। उत्पादनका लागि थप्नुहोस्: Managed Identity, Key Vault, स्थायी डेटाबेसहरू, CI/CD पाइपलाइन, मोनिटरिङ अलर्टहरू, र ब्याकअप रणनीति।

**प्रश्न: किन Dapr वा अन्य सेवा मेश प्रयोग नगर्ने?**  
उत्तर: सिकाइका लागि सरल राख्नुहोस्। जब तपाईंले Container Apps को नेटिव नेटवर्किङ बुझ्नुभयो भने, उन्नत परिदृश्यहरूको लागि Dapr थप गर्न सक्नुहुन्छ।

**प्रश्न: म स्थानीय रूपमा कसरी डिबग गर्छु?**  
उत्तर: सेवाहरूलाई स्थानीय रूपमा Docker सँग चलाउनुहोस्:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**प्रश्न: के म विभिन्न प्रोग्रामिङ भाषाहरू प्रयोग गर्न सक्छु?**  
उत्तर: हो! यो उदाहरण Node.js (gateway) + Python (product service) देखाउँछ। तपाईं कन्टेनरमा चल्ने कुनै पनि भाषाहरू मिश्रण गर्न सक्नुहुन्छ।

**प्रश्न: के मेरो सँग Azure क्रेडिटहरू छैनन् भने?**  
उत्तर: नयाँ खाताहरूका लागि Azure निःशुल्क टियर (पहिला 30 दिन) प्रयोग गर्नुहोस् वा छोटो परीक्षण अवधि मात्र तैनाथ गरेर तुरुन्त मेटाउनुहोस्।

---

> **🎓 सिकाइ मार्ग सारांश**: तपाईंले स्वत: स्केलिङ, आन्तरिक नेटवर्किङ, केन्द्रित मोनिटरिङ, र उत्पादन-तयार ढाँचाहरूसँग बहु-सेवा आर्किटेक्चर तैनाथ गर्न सिक्नुभयो। यो आधारले तपाईंलाई जटिल वितरित प्रणालीहरू र एन्त्रप्राइज माइक्रोसर्भिस आर्किटेक्चरहरूका लागि तयार बनाउँछ।

**📚 कोर्स नेभिगेसन:**
- ← अघिल्लो: [Simple Flask API](../../../../../examples/container-app/simple-flask-api)
- → अर्को: [Database Integration Example](../../../../../examples/database-app)
- 🏠 [Course Home](../../../README.md)
- 📖 [Container Apps सर्वश्रेष्ठ अभ्यासहरू](../../../docs/chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यो कागजात AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी शुद्धताका लागि प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटि वा अशुद्धता हुन सक्छ। मूल भाषामा रहेको मौलिक दस्तावेजलाई अधिकृत स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीका लागि पेशेवर मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न हुने कुनै पनि गलत बुझाइ वा व्याख्याको लागि हामी उत्तरदायी छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->