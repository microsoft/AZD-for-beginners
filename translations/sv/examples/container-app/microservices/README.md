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
   # Förväntad utdata: azd version 1.0.0 eller högre
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (version 2.50.0 or higher)
   ```bash
   az --version
   # Förväntat utdata: azure-cli 2.50.0 eller högre
   ```

3. **[Docker](https://www.docker.com/get-started)** (for local development/testing - optional)
   ```bash
   docker --version
   # Förväntat utdata: Docker version 20.10 eller högre
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
# Förväntat: README.md, azure.yaml, infra/, src/
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
# Hämta gateway-ändpunkt
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# Testa API-gatewayens hälsa
curl $GATEWAY_URL/health

# Förväntat utdata:
# {"status":"healthy","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**Test product service through gateway**:
```bash
# Lista produkter
curl $GATEWAY_URL/api/products

# Förväntat resultat:
# [
#   {"id":1,"namn":"Bärbar dator","pris":999.99,"lager":50},
#   {"id":2,"namn":"Mus","pris":29.99,"lager":200},
#   {"id":3,"namn":"Tangentbord","pris":79.99,"lager":150}
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
// Intern kommunikation mellan tjänster
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
// API-gateway (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Gör ett internt HTTP-anrop
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
# Distribuera infrastrukturen och båda tjänsterna
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
# Distribuera endast en tjänst (efter den initiala azd up)
azd deploy api-gateway

# Eller distribuera produkttjänsten
azd deploy product-service
```

**Use Case**: When you've updated code in one service and want to redeploy only that service.

### Update Configuration

```bash
# Ändra skalningsparametrar
azd env set GATEWAY_MAX_REPLICAS 30

# Distribuera om med ny konfiguration
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
# Visa loggar med azd monitor
azd monitor --logs

# Eller använd Azure CLI för specifika Container Apps:
# Strömma loggar från API-gateway
az containerapp logs show --name api-gateway --resource-group $RG_NAME --follow

# Visa senaste loggarna för produkttjänsten
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
# Hämta Application Insights-detaljer
azd env get-values | grep APPLICATIONINSIGHTS

# Öppna övervakningen i Azure-portalen
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
   appInsights.defaultClient.config.samplingPercentage = 50; // Sampla 50% av förfrågningarna
   ```

4. **Clean Up When Not Needed**:
   ```bash
   azd down
   ```

### Free Tier Options
For learning/testing, consider:
- Use Azure free credits (first 30 days)
- Keep to minimum replicas
- Delete after testing (no ongoing charges)

---

## Rensa upp

För att undvika löpande kostnader, ta bort alla resurser:

```bash
azd down --force --purge
```

**Bekräftelseprompt**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

Skriv `y` för att bekräfta.

**Vad som tas bort**:
- Container Apps-miljö
- Båda Container Apps (gateway & produkttjänst)
- Container Registry
- Application Insights
- Log Analytics Workspace
- Resursgrupp

**✓ Verifiera rensning**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Bör vara tomt.

---

## Uppskalningsguide: Från 2 till 5+ tjänster

När du har bemästrat denna arkitektur med 2 tjänster, här är hur du kan utöka:

### Fas 1: Lägg till databasbeständighet (nästa steg)

**Lägg till Cosmos DB för produkttjänsten**:

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

2. Uppdatera produkttjänsten för att använda Cosmos DB istället för in-memory-data

3. Beräknad extra kostnad: ~25 USD/månad (serverless)

### Fas 2: Lägg till tredje tjänst (Orderhantering)

**Skapa Ordertjänst**:

1. Ny mapp: `src/order-service/` (Python/Node.js/C#)
2. Ny Bicep: `infra/app/order-service.bicep`
3. Uppdatera API-gateway för att routa `/api/orders`
4. Lägg till Azure SQL Database för orderpersistens

**Arkitekturen blir**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### Fas 3: Lägg till asynkron kommunikation (Service Bus)

**Implementera händelsestyrd arkitektur**:

1. Lägg till Azure Service Bus: `infra/core/servicebus.bicep`
2. Produkttjänsten publicerar "ProductCreated"-händelser
3. Ordertjänsten prenumererar på produktevenemang
4. Lägg till Notification Service för att bearbeta händelser

**Mönster**: Begäran/Svar (HTTP) + händelsestyrt (Service Bus)

### Fas 4: Lägg till användarautentisering

**Implementera användartjänst**:

1. Skapa `src/user-service/` (Go/Node.js)
2. Lägg till Azure AD B2C eller kundanpassad JWT-autentisering
3. API-gateway validerar tokens
4. Tjänster kontrollerar användarbehörigheter

### Fas 5: Produktionsberedskap

**Lägg till dessa komponenter**:
- Azure Front Door (global lastbalansering)
- Azure Key Vault (hemlighetshantering)
- Azure Monitor Workbooks (anpassade dashboards)
- CI/CD-pipeline (GitHub Actions)
- Blue-Green-distributioner
- Hanterad identitet för alla tjänster

**Kostnad för full produktionsarkitektur**: ~$300-1,400/månad

---

## Lär dig mer

### Relaterad dokumentation
- [Dokumentation för Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Mikrotjänstarkitekturguide](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights för distribuerad spårning](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Dokumentation för Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Nästa steg i denna kurs
- ← Föregående: [Enkel Flask-API](../../../../../examples/container-app/simple-flask-api) - Nybörjarexempel med en enda container
- → Nästa: [Guide för AI-integration](../../../../../examples/docs/ai-foundry) - Lägg till AI-funktioner
- 🏠 [Kursens startsida](../../README.md)

### Jämförelse: När man ska använda vad

**Enkel Container App** (Exempel: Enkel Flask-API):
- ✅ Enkla applikationer
- ✅ Monolitisk arkitektur
- ✅ Snabbt att distribuera
- ❌ Begränsad skalbarhet
- **Kostnad**: ~$15-50/månad

**Mikrotjänster** (Detta exempel):
- ✅ Komplexa applikationer
- ✅ Oberoende skalning per tjänst
- ✅ Teamautonomi (olika tjänster, olika team)
- ❌ Mer komplext att hantera
- **Kostnad**: ~$60-250/månad

**Kubernetes (AKS)**:
- ✅ Maximal kontroll och flexibilitet
- ✅ Multi-cloud-portabilitet
- ✅ Avancerad nätverkshantering
- ❌ Kräver Kubernetes-expertis
- **Kostnad**: ~$150-500/månad minst

**Rekommendation**: Börja med Container Apps (detta exempel), gå över till AKS endast om du behöver Kubernetes-specifika funktioner.

---

## Vanliga frågor

**Q: Varför endast 2 tjänster istället för 5+?**  
A: Pedagogisk progression. Bemästra grunderna (tjänstkommunikation, övervakning, skalning) med ett enkelt exempel innan du lägger till komplexitet. Mönstren du lär dig här gäller för arkitekturer med 100 tjänster.

**Q: Kan jag lägga till fler tjänster själv?**  
A: Absolut! Följ uppskalningsguiden ovan. Varje ny tjänst följer samma mönster: skapa src-mapp, skapa Bicep-fil, uppdatera azure.yaml, distribuera.

**Q: Är detta produktionsklart?**  
A: Det är en stabil grund. För produktion, lägg till: hanterad identitet, Key Vault, persistenta databaser, CI/CD-pipeline, övervakningslarm och backupstrategi.

**Q: Varför inte använda Dapr eller annan service mesh?**  
A: Håll det enkelt för inlärning. När du förstår den inbyggda Container Apps-nätverkeringen kan du lägga till Dapr för avancerade scenarier.

**Q: Hur felsöker jag lokalt?**  
A: Kör tjänster lokalt med Docker:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**Q: Kan jag använda olika programmeringsspråk?**  
A: Ja! Detta exempel visar Node.js (gateway) + Python (produkttjänst). Du kan blanda vilka som helst språk som körs i containrar.

**Q: Vad gör jag om jag inte har Azure-krediter?**  
A: Använd Azure gratisnivå (första 30 dagarna med nya konton) eller distribuera för korta testperioder och ta bort omedelbart.

---

> **🎓 Sammanfattning av lärvägen**: Du har lärt dig att distribuera en arkitektur med flera tjänster med automatisk skalning, intern nätverkstrafik, centraliserad övervakning och produktionsnära mönster. Denna grund förbereder dig för komplexa distribuerade system och företagsmikrotjänstarkitekturer.

**📚 Kursnavigering:**
- ← Föregående: [Enkel Flask-API](../../../../../examples/container-app/simple-flask-api)
- → Nästa: [Databasintegrations-exempel](../../../../../examples/database-app)
- 🏠 [Kursens startsida](../../../README.md)
- 📖 [Container Apps Best Practices](../../../docs/chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Ansvarsfriskrivning:
Detta dokument har översatts med hjälp av AI-översättningstjänsten Co-op Translator (https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet bör du vara medveten om att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess originalspråk ska betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår vid användning av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->