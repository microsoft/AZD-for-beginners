<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "22ea3f5148517a6012d3e2771584ef87",
  "translation_date": "2025-11-22T10:39:44+00:00",
  "source_file": "examples/container-app/microservices/README.md",
  "language_code": "tl"
}
-->
# Arkitektura ng Microservices - Halimbawa ng Container App

⏱️ **Tinatayang Oras**: 25-35 minuto | 💰 **Tinatayang Gastos**: ~$50-100/buwan | ⭐ **Kahirapan**: Advanced

Isang **pinadali ngunit gumaganang** arkitektura ng microservices na idineploy sa Azure Container Apps gamit ang AZD CLI. Ipinapakita ng halimbawang ito ang komunikasyon sa pagitan ng mga serbisyo, container orchestration, at monitoring gamit ang praktikal na setup ng 2-serbisyo.

> **📚 Paraan ng Pagkatuto**: Nagsisimula ang halimbawang ito sa isang minimal na arkitektura ng 2-serbisyo (API Gateway + Backend Service) na maaari mong i-deploy at pag-aralan. Pagkatapos maunawaan ang pundasyon, nagbibigay kami ng gabay para sa pagpapalawak patungo sa isang buong ecosystem ng microservices.

## Ano ang Matututuhan Mo

Sa pagtatapos ng halimbawang ito, matututuhan mo:
- Mag-deploy ng maraming container sa Azure Container Apps
- Magpatupad ng komunikasyon sa pagitan ng mga serbisyo gamit ang internal networking
- Mag-configure ng scaling at health checks batay sa environment
- Mag-monitor ng distributed applications gamit ang Application Insights
- Maunawaan ang mga pattern at pinakamahusay na kasanayan sa pag-deploy ng microservices
- Matutong magpalawak mula sa simple patungo sa mas komplikadong arkitektura

## Arkitektura

### Phase 1: Ano ang Ating Itatayo (Kasama sa Halimbawang Ito)

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

**Bakit Magsimula sa Simple?**
- ✅ Mabilis na ma-deploy at maunawaan (25-35 minuto)
- ✅ Matutunan ang mga pangunahing pattern ng microservices nang walang komplikasyon
- ✅ Gumaganang code na maaari mong baguhin at subukan
- ✅ Mas mababang gastos para sa pagkatuto (~$50-100/buwan kumpara sa $300-1400/buwan)
- ✅ Magkaroon ng kumpiyansa bago magdagdag ng databases at message queues

**Analohiya**: Isipin ito na parang pag-aaral magmaneho. Nagsisimula ka sa isang bakanteng parking lot (2 serbisyo), matutunan ang mga batayan, pagkatapos ay magprogreso sa trapiko sa lungsod (5+ serbisyo na may databases).

### Phase 2: Pagpapalawak sa Hinaharap (Reference Architecture)

Kapag na-master mo na ang arkitektura ng 2-serbisyo, maaari kang magpalawak sa:

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

Tingnan ang seksyong "Expansion Guide" sa dulo para sa sunud-sunod na mga tagubilin.

## Mga Tampok na Kasama

✅ **Service Discovery**: Awtomatikong DNS-based na pagtuklas sa pagitan ng mga container  
✅ **Load Balancing**: Built-in na load balancing sa mga replica  
✅ **Auto-scaling**: Independent scaling kada serbisyo batay sa HTTP requests  
✅ **Health Monitoring**: Liveness at readiness probes para sa parehong serbisyo  
✅ **Distributed Logging**: Sentralisadong logging gamit ang Application Insights  
✅ **Internal Networking**: Secure na komunikasyon sa pagitan ng mga serbisyo  
✅ **Container Orchestration**: Awtomatikong pag-deploy at scaling  
✅ **Zero-Downtime Updates**: Rolling updates na may revision management  

## Mga Kinakailangan

### Mga Kailangan na Tool

Bago magsimula, tiyaking naka-install ang mga sumusunod na tool:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (bersyon 1.0.0 o mas bago)
   ```bash
   azd version
   # Inaasahang output: bersyon ng azd 1.0.0 o mas mataas
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (bersyon 2.50.0 o mas bago)
   ```bash
   az --version
   # Inaasahang output: azure-cli 2.50.0 o mas mataas
   ```

3. **[Docker](https://www.docker.com/get-started)** (para sa lokal na pag-develop/pagsubok - opsyonal)
   ```bash
   docker --version
   # Inaasahang output: Docker bersyon 20.10 o mas mataas
   ```

### Mga Kinakailangan sa Azure

- Isang aktibong **Azure subscription** ([gumawa ng libreng account](https://azure.microsoft.com/free/))
- Mga pahintulot upang lumikha ng mga resource sa iyong subscription
- **Contributor** na role sa subscription o resource group

### Mga Kinakailangan sa Kaalaman

Ito ay isang halimbawa para sa **advanced-level**. Dapat ay mayroon kang:
- Natapos ang [Simple Flask API example](../../../../../examples/container-app/simple-flask-api) 
- Pangunahing kaalaman sa arkitektura ng microservices
- Pamilyar sa REST APIs at HTTP
- Pag-unawa sa mga konsepto ng container

**Baguhan sa Container Apps?** Magsimula sa [Simple Flask API example](../../../../../examples/container-app/simple-flask-api) upang matutunan ang mga batayan.

## Mabilis na Pagsisimula (Step-by-Step)

### Hakbang 1: I-clone at Mag-navigate

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ Suriin ang Tagumpay**: Tiyaking makikita mo ang `azure.yaml`:
```bash
ls
# Inaasahan: README.md, azure.yaml, infra/, src/
```

### Hakbang 2: Mag-authenticate sa Azure

```bash
azd auth login
```

Bubuksan nito ang iyong browser para sa authentication sa Azure. Mag-sign in gamit ang iyong Azure credentials.

**✓ Suriin ang Tagumpay**: Dapat mong makita:
```
Logged in to Azure.
```

### Hakbang 3: I-initialize ang Environment

```bash
azd init
```

**Mga Prompt na Makikita Mo**:
- **Pangalan ng Environment**: Maglagay ng maikling pangalan (hal. `microservices-dev`)
- **Azure subscription**: Piliin ang iyong subscription
- **Azure location**: Pumili ng rehiyon (hal. `eastus`, `westeurope`)

**✓ Suriin ang Tagumpay**: Dapat mong makita:
```
SUCCESS: New project initialized!
```

### Hakbang 4: I-deploy ang Infrastructure at Mga Serbisyo

```bash
azd up
```

**Ano ang Nangyayari** (tumatagal ng 8-12 minuto):
1. Lumilikha ng Container Apps environment
2. Lumilikha ng Application Insights para sa monitoring
3. Binubuo ang API Gateway container (Node.js)
4. Binubuo ang Product Service container (Python)
5. I-deploy ang parehong container sa Azure
6. I-configure ang networking at health checks
7. I-set up ang monitoring at logging

**✓ Suriin ang Tagumpay**: Dapat mong makita:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ Oras**: 8-12 minuto

### Hakbang 5: Subukan ang Deployment

```bash
# Kunin ang endpoint ng gateway
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# Subukan ang kalusugan ng API Gateway
curl $GATEWAY_URL/health

# Inaasahang output:
# {"status":"malusog","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**Subukan ang product service sa pamamagitan ng gateway**:
```bash
# Listahan ng mga produkto
curl $GATEWAY_URL/api/products

# Inaasahang output:
# [
#   {"id":1,"name":"Laptop","price":999.99,"stock":50},
#   {"id":2,"name":"Mouse","price":29.99,"stock":200},
#   {"id":3,"name":"Keyboard","price":79.99,"stock":150}
# ]
```

**✓ Suriin ang Tagumpay**: Ang parehong endpoint ay dapat magbalik ng JSON data nang walang error.

---

**🎉 Binabati kita!** Na-deploy mo na ang isang arkitektura ng microservices sa Azure!

## Istruktura ng Proyekto

Kasama ang lahat ng mga file ng implementasyon—ito ay isang kumpleto at gumaganang halimbawa:

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

**Ano ang Ginagawa ng Bawat Bahagi:**

**Infrastructure (infra/)**:
- `main.bicep`: Nag-oorganisa ng lahat ng mga resource sa Azure at kanilang mga dependency
- `core/container-apps-environment.bicep`: Lumilikha ng Container Apps environment at Azure Container Registry
- `core/monitor.bicep`: Nagse-set up ng Application Insights para sa distributed logging
- `app/*.bicep`: Mga indibidwal na container app definition na may scaling at health checks

**API Gateway (src/api-gateway/)**:
- Pampublikong serbisyo na nagre-route ng mga request sa mga backend service
- Nagpapatupad ng logging, error handling, at request forwarding
- Nagpapakita ng HTTP communication sa pagitan ng mga serbisyo

**Product Service (src/product-service/)**:
- Internal na serbisyo na may product catalog (in-memory para sa pagiging simple)
- REST API na may health checks
- Halimbawa ng backend microservice pattern

## Pangkalahatang-ideya ng Mga Serbisyo

### API Gateway (Node.js/Express)

**Port**: 8080  
**Access**: Pampubliko (external ingress)  
**Layunin**: Nagruruta ng mga papasok na request sa tamang backend service  

**Mga Endpoint**:
- `GET /` - Impormasyon ng serbisyo
- `GET /health` - Health check endpoint
- `GET /api/products` - Forward sa product service (listahan ng lahat)
- `GET /api/products/:id` - Forward sa product service (kuha ng ID)

**Pangunahing Tampok**:
- Request routing gamit ang axios
- Sentralisadong logging
- Error handling at timeout management
- Service discovery gamit ang environment variables
- Application Insights integration

**Highlight ng Code** (`src/api-gateway/app.js`):
```javascript
// Panloob na komunikasyon ng serbisyo
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Product Service (Python/Flask)

**Port**: 8000  
**Access**: Internal lamang (walang external ingress)  
**Layunin**: Pinamamahalaan ang product catalog gamit ang in-memory data  

**Mga Endpoint**:
- `GET /` - Impormasyon ng serbisyo
- `GET /health` - Health check endpoint
- `GET /products` - Listahan ng lahat ng produkto
- `GET /products/<id>` - Kumuha ng produkto gamit ang ID

**Pangunahing Tampok**:
- RESTful API gamit ang Flask
- In-memory product store (simple, walang kinakailangang database)
- Health monitoring gamit ang probes
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

**Bakit Internal Lamang?**
Ang product service ay hindi pampubliko. Lahat ng request ay dapat dumaan sa API Gateway, na nagbibigay ng:
- Seguridad: Kinokontrol na access point
- Kakayahang umangkop: Maaaring baguhin ang backend nang hindi naaapektuhan ang mga kliyente
- Monitoring: Sentralisadong request logging

## Pag-unawa sa Komunikasyon ng Serbisyo

### Paano Nag-uusap ang mga Serbisyo

Sa halimbawang ito, ang API Gateway ay nakikipag-usap sa Product Service gamit ang **internal HTTP calls**:

```javascript
// API Gateway (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Gumawa ng panloob na HTTP na kahilingan
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Pangunahing Punto**:

1. **DNS-Based Discovery**: Awtomatikong nagbibigay ang Container Apps ng DNS para sa mga internal na serbisyo
   - FQDN ng Product Service: `product-service.internal.<environment>.azurecontainerapps.io`
   - Pinadali bilang: `http://product-service` (inaayos ito ng Container Apps)

2. **Walang Pampublikong Exposure**: Ang Product Service ay may `external: false` sa Bicep
   - Accessible lamang sa loob ng Container Apps environment
   - Hindi maabot mula sa internet

3. **Environment Variables**: Ang mga URL ng serbisyo ay ini-inject sa deployment time
   - Pinapasa ng Bicep ang internal FQDN sa gateway
   - Walang hardcoded na URL sa application code

**Analohiya**: Isipin ito na parang mga opisina. Ang API Gateway ay ang reception desk (pampubliko), at ang Product Service ay isang opisina (internal lamang). Kailangang dumaan ang mga bisita sa reception upang makarating sa anumang opisina.

## Mga Opsyon sa Deployment

### Buong Deployment (Inirerekomenda)

```bash
# I-deploy ang imprastraktura at parehong mga serbisyo
azd up
```

Ito ay nagde-deploy ng:
1. Container Apps environment
2. Application Insights
3. Container Registry
4. API Gateway container
5. Product Service container

**Oras**: 8-12 minuto

### I-deploy ang Indibidwal na Serbisyo

```bash
# I-deploy lamang ang isang serbisyo (pagkatapos ng unang azd up)
azd deploy api-gateway

# O i-deploy ang serbisyo ng produkto
azd deploy product-service
```

**Gamitin Kapag**: Kapag nag-update ka ng code sa isang serbisyo at nais mong i-deploy muli ang serbisyong iyon lamang.

### I-update ang Configuration

```bash
# Baguhin ang mga parameter ng pag-scale
azd env set GATEWAY_MAX_REPLICAS 30

# I-redeploy gamit ang bagong configuration
azd up
```

## Configuration

### Scaling Configuration

Ang parehong serbisyo ay naka-configure na may HTTP-based autoscaling sa kanilang Bicep files:

**API Gateway**:
- Min replicas: 2 (laging may 2 para sa availability)
- Max replicas: 20
- Scale trigger: 50 concurrent requests kada replica

**Product Service**:
- Min replicas: 1 (maaaring mag-scale sa zero kung kinakailangan)
- Max replicas: 10
- Scale trigger: 100 concurrent requests kada replica

**I-customize ang Scaling** (sa `infra/app/*.bicep`):
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
- Dahilan: Pinangangasiwaan ang lahat ng external na traffic

**Product Service**:
- CPU: 0.5 vCPU
- Memory: 1 GiB
- Dahilan: Magaan na in-memory operations

### Health Checks

Ang parehong serbisyo ay may kasamang liveness at readiness probes:

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

**Ano ang Ibig Sabihin Nito**:
- **Liveness**: Kung nabigo ang health check, ire-restart ng Container Apps ang container
- **Readiness**: Kung hindi handa, ititigil ng Container Apps ang pag-route ng traffic sa replica na iyon

## Monitoring at Observability

### Tingnan ang Service Logs

```bash
# I-stream ang mga log mula sa API Gateway
azd logs api-gateway --follow

# Tingnan ang mga kamakailang log ng serbisyo ng produkto
azd logs product-service --tail 100

# Tingnan ang lahat ng log mula sa parehong mga serbisyo
azd logs --follow
```

**Inaasahang Output**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Application Insights Queries

I-access ang Application Insights sa Azure Portal, pagkatapos ay patakbuhin ang mga query na ito:

**Hanapin ang Mabagal na Requests**:
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**Subaybayan ang Service-to-Service Calls**:
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

**Error Rate kada Serbisyo**:
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
# Kunin ang mga detalye ng Application Insights
azd env get-values | grep APPLICATIONINSIGHTS

# Buksan ang monitoring sa Azure Portal
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### Live Metrics

1. Pumunta sa Application Insights sa Azure Portal
2. I-click ang "Live Metrics"
3. Tingnan ang real-time na requests, failures, at performance
4. Subukan sa pamamagitan ng pagtakbo: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Praktikal na Ehersisyo

[Nota: Tingnan ang buong ehersisyo sa itaas sa seksyong "Practical Exercises" para sa detalyadong sunud-sunod na mga ehersisyo kabilang ang pag-verify ng deployment, pagbabago ng data, pagsubok ng autoscaling, paghawak ng error, at pagdaragdag ng ikatlong serbisyo.]

## Pagsusuri ng Gastos

### Tinatayang Buwanang Gastos (Para sa Halimbawang 2-Serbisyo)

| Resource | Configuration | Tinatayang Gastos |
|----------|--------------|----------------|
| API Gateway | 2-20 replicas, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 replicas, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Basic tier | $5 |
| Application Insights | 1-2 GB/buwan | $5-10 |
| Log Analytics | 1 GB/buwan | $3 |
| **Kabuuan** | | **$58-243/buwan** |

**Pagkakabaha-bahagi ng Gastos ayon sa Paggamit**:
- **Mababang traffic** (pagsubok/pagkatuto): ~$60/buwan
- **Katamtamang traffic** (maliit na produksyon): ~$120/buwan
- **Mataas na traffic** (abala sa mga panahon): ~$240/buwan

### Mga Tip sa Pag-optimize ng Gastos

1. **I-scale sa Zero para sa Development**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Gamitin ang Consumption Plan para sa Cosmos DB** (kapag idinagdag mo ito):
   - Magbayad lamang para sa iyong ginagamit
   - Walang minimum na singil

3. **I-set ang Application Insights Sampling**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // Samplehin ang 50% ng mga kahilingan
   ```

4. **Linisin Kapag Hindi Kailangan**:
   ```bash
   azd down
   ```

### Mga Opsyon sa Libreng Tier
Para sa pag-aaral/pagsubok, isaalang-alang:
- Gamitin ang libreng credits ng Azure (unang 30 araw)
- Panatilihin sa pinakamababang replicas
- Burahin pagkatapos ng pagsubok (walang patuloy na bayarin)

---

## Paglilinis

Upang maiwasan ang patuloy na bayarin, burahin ang lahat ng resources:

```bash
azd down --force --purge
```

**Kumpirmasyon ng Prompt**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

I-type ang `y` upang kumpirmahin.

**Ano ang Mabubura**:
- Container Apps Environment
- Parehong Container Apps (gateway at product service)
- Container Registry
- Application Insights
- Log Analytics Workspace
- Resource Group

**✓ I-verify ang Paglilinis**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Dapat magbalik ng walang laman.

---

## Gabay sa Pagpapalawak: Mula 2 hanggang 5+ na Serbisyo

Kapag na-master mo na ang 2-service architecture na ito, narito kung paano magpalawak:

### Phase 1: Magdagdag ng Database Persistence (Susunod na Hakbang)

**Magdagdag ng Cosmos DB para sa Product Service**:

1. Gumawa ng `infra/core/cosmos.bicep`:
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

2. I-update ang product service upang gumamit ng Cosmos DB sa halip na in-memory data

3. Tinatayang karagdagang gastos: ~$25/buwan (serverless)

### Phase 2: Magdagdag ng Ikatlong Serbisyo (Order Management)

**Gumawa ng Order Service**:

1. Bagong folder: `src/order-service/` (Python/Node.js/C#)
2. Bagong Bicep: `infra/app/order-service.bicep`
3. I-update ang API Gateway upang i-route ang `/api/orders`
4. Magdagdag ng Azure SQL Database para sa order persistence

**Magiging Arkitektura**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### Phase 3: Magdagdag ng Async Communication (Service Bus)

**Ipatupad ang Event-Driven Architecture**:

1. Magdagdag ng Azure Service Bus: `infra/core/servicebus.bicep`
2. Ang Product Service ay mag-publish ng "ProductCreated" events
3. Ang Order Service ay mag-subscribe sa product events
4. Magdagdag ng Notification Service upang magproseso ng events

**Pattern**: Request/Response (HTTP) + Event-Driven (Service Bus)

### Phase 4: Magdagdag ng User Authentication

**Ipatupad ang User Service**:

1. Gumawa ng `src/user-service/` (Go/Node.js)
2. Magdagdag ng Azure AD B2C o custom JWT authentication
3. Ang API Gateway ay mag-validate ng tokens
4. Ang mga serbisyo ay mag-check ng user permissions

### Phase 5: Production Readiness

**Magdagdag ng Mga Sumusunod na Komponent**:
- Azure Front Door (global load balancing)
- Azure Key Vault (secret management)
- Azure Monitor Workbooks (custom dashboards)
- CI/CD Pipeline (GitHub Actions)
- Blue-Green Deployments
- Managed Identity para sa lahat ng serbisyo

**Kabuuang Gastos ng Production Architecture**: ~$300-1,400/buwan

---

## Matuto Pa

### Kaugnay na Dokumentasyon
- [Azure Container Apps Documentation](https://learn.microsoft.com/azure/container-apps/)
- [Microservices Architecture Guide](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights for Distributed Tracing](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Mga Susunod na Hakbang sa Kursong Ito
- ← Nakaraan: [Simple Flask API](../../../../../examples/container-app/simple-flask-api) - Halimbawa ng beginner single-container
- → Susunod: [AI Integration Guide](../../../../../examples/docs/ai-foundry) - Magdagdag ng AI capabilities
- 🏠 [Home ng Kurso](../../README.md)

### Paghahambing: Kailan Gagamitin ang Ano

**Single Container App** (Halimbawa ng Simple Flask API):
- ✅ Simpleng aplikasyon
- ✅ Monolithic architecture
- ✅ Mabilis i-deploy
- ❌ Limitadong scalability
- **Gastos**: ~$15-50/buwan

**Microservices** (Halimbawa na ito):
- ✅ Komplikadong aplikasyon
- ✅ Independent scaling bawat serbisyo
- ✅ Autonomy ng team (iba't ibang serbisyo, iba't ibang team)
- ❌ Mas kumplikado i-manage
- **Gastos**: ~$60-250/buwan

**Kubernetes (AKS)**:
- ✅ Pinakamataas na kontrol at flexibility
- ✅ Multi-cloud portability
- ✅ Advanced networking
- ❌ Nangangailangan ng Kubernetes expertise
- **Gastos**: ~$150-500/buwan minimum

**Rekomendasyon**: Magsimula sa Container Apps (halimbawa na ito), lumipat sa AKS kung kailangan mo ng Kubernetes-specific features.

---

## Mga Madalas Itanong

**Q: Bakit 2 serbisyo lang sa halip na 5+?**  
A: Para sa edukasyonal na pag-unlad. Masterin muna ang mga pangunahing kaalaman (service communication, monitoring, scaling) gamit ang simpleng halimbawa bago magdagdag ng komplikasyon. Ang mga pattern na matututunan mo dito ay naaangkop sa 100-service architectures.

**Q: Maaari ba akong magdagdag ng higit pang mga serbisyo?**  
A: Oo naman! Sundin ang gabay sa pagpapalawak sa itaas. Ang bawat bagong serbisyo ay sumusunod sa parehong pattern: gumawa ng src folder, gumawa ng Bicep file, i-update ang azure.yaml, i-deploy.

**Q: Handa na ba ito para sa production?**  
A: Ito ay isang matibay na pundasyon. Para sa production, magdagdag ng: managed identity, Key Vault, persistent databases, CI/CD pipeline, monitoring alerts, at backup strategy.

**Q: Bakit hindi gumamit ng Dapr o iba pang service mesh?**  
A: Panatilihing simple para sa pag-aaral. Kapag naintindihan mo na ang native Container Apps networking, maaari kang mag-layer ng Dapr para sa advanced scenarios.

**Q: Paano ako mag-debug locally?**  
A: Patakbuhin ang mga serbisyo locally gamit ang Docker:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**Q: Maaari ba akong gumamit ng iba't ibang programming languages?**  
A: Oo! Ang halimbawang ito ay nagpapakita ng Node.js (gateway) + Python (product service). Maaari kang maghalo ng anumang mga wika na tumatakbo sa containers.

**Q: Paano kung wala akong Azure credits?**  
A: Gamitin ang libreng tier ng Azure (unang 30 araw para sa mga bagong account) o mag-deploy para sa maikling panahon ng pagsubok at burahin agad.

---

> **🎓 Buod ng Learning Path**: Natutunan mo kung paano mag-deploy ng multi-service architecture na may automatic scaling, internal networking, centralized monitoring, at production-ready patterns. Ang pundasyong ito ay naghahanda sa iyo para sa mas kumplikadong distributed systems at enterprise microservices architectures.

**📚 Navigation ng Kurso**:
- ← Nakaraan: [Simple Flask API](../../../../../examples/container-app/simple-flask-api)
- → Susunod: [Database Integration Example](../../../../../examples/database-app)
- 🏠 [Home ng Kurso](../../README.md)
- 📖 [Container Apps Best Practices](../../docs/deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Paunawa**:  
Ang dokumentong ito ay isinalin gamit ang AI translation service na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagamat sinisikap naming maging tumpak, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na opisyal na sanggunian. Para sa mahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na dulot ng paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->