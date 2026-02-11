# Microservices Architecture - Container App Example

⏱️ **Tinatayang Oras**: 25-35 minuto | 💰 **Tinatayang Gastos**: ~$50-100/buwan | ⭐ **Kompleksidad**: Mataas

Isang **pinasimple ngunit gumagana** na arkitekturang microservices na dineploy sa Azure Container Apps gamit ang AZD CLI. Ipinapakita ng halimbawang ito ang komunikasyon ng serbisyo-sa-serbisyo, pangangasiwa ng mga container, at pagmamanman gamit ang praktikal na setup na may 2 serbisyo.

> **📚 Paraan ng Pagkatuto**: Nagsisimula ang halimbawang ito sa minimal na arkitekturang may 2 serbisyo (API Gateway + Backend Service) na maaari mong i-deploy at pag-aralan. Pagkatapos ma-master ang pundasyong ito, nagbibigay kami ng gabay para palawakin ito sa isang buong microservices ecosystem.

## Mga Matututunan Mo

Sa pagkumpleto ng halimbawang ito, matututunan mo:
- Mag-deploy ng maraming container sa Azure Container Apps
- Ipatupad ang komunikasyon ng serbisyo-sa-serbisyo gamit ang internal networking
- I-konfigura ang pag-scale at health checks batay sa environment
- I-monitor ang mga distributed application gamit ang Application Insights
- Maunawaan ang mga pattern at best practices sa deployment ng microservices
- Matutunan ang progresibong pagpapalawak mula simple hanggang kumplikadong arkitektura

## Arkitektura

### Phase 1: Ano ang Itinatayo Namin (Kasama sa Halimbawang Ito)

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

**Bakit Magsimula nang Simple?**
- ✅ Mabilis i-deploy at unawain (25-35 minuto)
- ✅ Matutunan ang mga pangunahing pattern ng microservices nang hindi kumplikado
- ✅ Gumaganang code na maaari mong i-modify at subukan
- ✅ Mas mababang gastos para sa pag-aaral (~$50-100/buwan vs $300-1400/buwan)
- ✅ Magtamo ng kumpiyansa bago magdagdag ng databases at message queues

**Paghahambing**: Isipin ito parang pag-aaral magmaneho. Nagsisimula ka sa isang bakanteng parking lot (2 serbisyo), minamaster ang mga pangunahing kaalaman, pagkatapos ay umuusad sa traffic sa lungsod (5+ serbisyo na may mga database).

### Phase 2: Hinaharap na Pagpapalawak (Reference Architecture)

Kapag na-master mo ang 2-serbisyo na arkitektura, maaari mong palawakin ito sa:

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

Tingnan ang seksyong "Expansion Guide" sa dulo para sa sunud-sunod na mga instruksiyon.

## Mga Tampok na Kasama

✅ **Service Discovery**: Awtomatikong discovery batay sa DNS sa pagitan ng mga container  
✅ **Load Balancing**: Built-in na load balancing sa mga replica  
✅ **Auto-scaling**: Independiyenteng pag-scale bawat serbisyo batay sa mga HTTP request  
✅ **Health Monitoring**: Liveness at readiness probes para sa parehong serbisyo  
✅ **Distributed Logging**: Sentralisadong logging gamit ang Application Insights  
✅ **Internal Networking**: Secure na komunikasyon ng serbisyo-sa-serbisyo  
✅ **Container Orchestration**: Awtomatikong deployment at pag-scale  
✅ **Zero-Downtime Updates**: Rolling updates na may revision management  

## Mga Kinakailangan

### Mga Kinakailangang Kasangkapan

Bago magsimula, tiyakin na naka-install ang mga kasangkapang ito:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (bersyon 1.0.0 o mas mataas)
   ```bash
   azd version
   # Inaasahang output: azd bersyon 1.0.0 o mas mataas
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (bersyon 2.50.0 o mas mataas)
   ```bash
   az --version
   # Inaasahang output: azure-cli 2.50.0 o mas mataas
   ```

3. **[Docker](https://www.docker.com/get-started)** (para sa lokal na development/testing - opsyonal)
   ```bash
   docker --version
   # Inaasahang output: Docker bersyon 20.10 o mas mataas
   ```

### Mga Kinakailangan sa Azure

- Isang aktibong **Azure subscription** ([gumawa ng libreng account](https://azure.microsoft.com/free/))
- Mga pahintulot para lumikha ng mga resource sa iyong subscription
- **Contributor** role sa subscription o resource group

### Kaalamang Kinakailangan

Ito ay isang **advanced-level** na halimbawa. Dapat mayroon ka:
- Nakumpleto ang [Simple Flask API example](../../../../../examples/container-app/simple-flask-api) 
- Pangunahing pag-unawa sa arkitekturang microservices
- Pamilyaridad sa REST APIs at HTTP
- Pag-unawa sa mga konsepto ng container

**Bago sa Container Apps?** Magsimula muna sa [Simple Flask API example](../../../../../examples/container-app/simple-flask-api) para matutunan ang mga batayan.

## Mabilis na Simula (Hakbang-hakbang)

### Hakbang 1: Clone at Mag-navigate

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ Pagpapatunay ng Tagumpay**: Tiyakin na nakikita mo ang `azure.yaml`:
```bash
ls
# Inaasahan: README.md, azure.yaml, infra/, src/
```

### Hakbang 2: Mag-authenticate sa Azure

```bash
azd auth login
```

Magbubukas ito ng iyong browser para sa Azure authentication. Mag-sign in gamit ang iyong mga kredensyal sa Azure.

**✓ Pagpapatunay ng Tagumpay**: Dapat mong makita:
```
Logged in to Azure.
```

### Hakbang 3: I-initialize ang Environment

```bash
azd init
```

**Mga prompt na makikita mo**:
- **Pangalan ng kapaligiran**: Maglagay ng maikling pangalan (hal., `microservices-dev`)
- **Azure subscription**: Piliin ang iyong subscription
- **Azure location**: Pumili ng rehiyon (hal., `eastus`, `westeurope`)

**✓ Pagpapatunay ng Tagumpay**: Dapat mong makita:
```
SUCCESS: New project initialized!
```

### Hakbang 4: I-deploy ang Infrastructure at Mga Serbisyo

```bash
azd up
```

**Ano ang nangyayari** (tumagal ng 8-12 minuto):
1. Lumilikha ng Container Apps environment
2. Lumilikha ng Application Insights para sa pagmamanman
3. Binubuo ang API Gateway container (Node.js)
4. Binubuo ang Product Service container (Python)
5. I-deploy ang parehong container sa Azure
6. Kinokonfigura ang networking at health checks
7. Sine-setup ang monitoring at logging

**✓ Pagpapatunay ng Tagumpay**: Dapat mong makita:
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
# Ilista ang mga produkto
curl $GATEWAY_URL/api/products

# Inaasahang output:
# [
#   {"id":1,"name":"Laptop","price":999.99,"stock":50},
#   {"id":2,"name":"Mouse","price":29.99,"stock":200},
#   {"id":3,"name":"Keyboard","price":79.99,"stock":150}
# ]
```

**✓ Pagpapatunay ng Tagumpay**: Ibinabalik ng parehong endpoints ang JSON na data nang walang mga error.

---

**🎉 Binabati kita!** Na-deploy mo na ang isang arkitekturang microservices sa Azure!

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

**Ano ang Ginagawa ng Bawat Komponent:**

**Infrastructure (infra/)**:
- `main.bicep`: Inaayos ang lahat ng Azure resources at ang kanilang dependencies
- `core/container-apps-environment.bicep`: Lumilikha ng Container Apps environment at Azure Container Registry
- `core/monitor.bicep`: Sine-setup ang Application Insights para sa distributed logging
- `app/*.bicep`: Indibidwal na mga definition ng container app na may scaling at health checks

**API Gateway (src/api-gateway/)**:
- Serbisyong tumatanggap ng publiko na nagro-route ng mga request sa backend services
- Nagpapatupad ng logging, error handling, at request forwarding
- Ipinapakita ang komunikasyon ng serbisyo-sa-serbisyo gamit ang HTTP

**Product Service (src/product-service/)**:
- Internal na serbisyo na may product catalog (in-memory para sa pagiging simple)
- REST API na may health checks
- Halimbawa ng pattern ng backend microservice

## Pangkalahatang-ideya ng Mga Serbisyo

### API Gateway (Node.js/Express)

**Port**: 8080  
**Access**: Public (external ingress)  
**Layunin**: I-route ang mga papasok na request sa angkop na backend services  

**Mga Endpoint**:
- `GET /` - Impormasyon ng serbisyo
- `GET /health` - Health check endpoint
- `GET /api/products` - I-forward sa product service (listahan lahat)
- `GET /api/products/:id` - I-forward sa product service (kuha ayon sa ID)

**Pangunahing Mga Tampok**:
- Request routing gamit ang axios
- Sentralisadong logging
- Error handling at timeout management
- Service discovery via environment variables
- Application Insights integration

**Code Highlight** (`src/api-gateway/app.js`):
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
- `GET /products` - Ilista lahat ng produkto
- `GET /products/<id>` - Kunin ang produkto ayon sa ID

**Pangunahing Mga Tampok**:
- RESTful API gamit ang Flask
- In-memory product store (simple, walang database na kinakailangan)
- Pagmamanman ng kalusugan gamit ang probes
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
Ang product service ay hindi publiko. Lahat ng request ay dapat dumaan sa API Gateway, na nagbibigay ng:
- Seguridad: Kontroladong punto ng access
- Kakayahang umangkop: Maaaring baguhin ang backend nang hindi naaapektuhan ang mga kliyente
- Pagmamanman: Sentralisadong request logging

## Pag-unawa sa Komunikasyon ng Serbisyo

### Paano Nag-uusap ang Mga Serbisyo

Sa halimbawang ito, nakikipag-ugnayan ang API Gateway sa Product Service gamit ang **internal HTTP calls**:

```javascript
// API Gateway (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Gumawa ng panloob na HTTP request
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Pangunahing Punto**:

1. **Pagdiskubre gamit ang DNS**: Awtomatikong nagbibigay ang Container Apps ng DNS para sa mga internal na serbisyo
   - Product Service FQDN: `product-service.internal.<environment>.azurecontainerapps.io`
   - Pinapasimple bilang: `http://product-service` (ini-resolve ito ng Container Apps)

2. **Walang Pampublikong Exposure**: Ang Product Service ay may `external: false` sa Bicep
   - Maa-access lamang sa loob ng Container Apps environment
   - Hindi maaabot mula sa internet

3. **Environment Variables**: Ang mga Service URL ay ini-inject sa oras ng deployment
   - Ipinapasa ng Bicep ang internal FQDN sa gateway
   - Walang hardcoded na URL sa application code

**Paghahambing**: Isipin ito parang mga silid-opisina. Ang API Gateway ay ang reception desk (pampubliko), at ang Product Service ay isang silid-opisina (internal lamang). Dapat dumaan ang mga bisita sa reception para makarating sa anumang opisina.

## Mga Opsyon sa Deployment

### Buong Pag-deploy (Inirerekomenda)

```bash
# I-deploy ang imprastruktura at ang dalawang serbisyo
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

**Gamit**: Kapag na-update mo ang code sa isang serbisyo at nais mo lamang i-redeploy ang serbisyong iyon.

### I-update ang Konfigurasyon

```bash
# Baguhin ang mga parameter ng scaling
azd env set GATEWAY_MAX_REPLICAS 30

# Muling i-deploy gamit ang bagong konfigurasyon
azd up
```

## Konfigurasyon

### Konfigurasyon ng Pag-scale

Parehong naka-configure ang mga serbisyo gamit ang HTTP-based autoscaling sa kanilang mga Bicep file:

**API Gateway**:
- Min replicas: 2 (laging hindi bababa sa 2 para sa availability)
- Max replicas: 20
- Scale trigger: 50 concurrent requests per replica

**Product Service**:
- Min replicas: 1 (maaaring mag-scale sa zero kung kailangan)
- Max replicas: 10
- Scale trigger: 100 concurrent requests per replica

**I-customize ang Pag-scale** (sa `infra/app/*.bicep`):
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

### Alokasyon ng Mga Yaman

**API Gateway**:
- CPU: 1.0 vCPU
- Memory: 2 GiB
- Dahilan: Humahawak sa lahat ng external traffic

**Product Service**:
- CPU: 0.5 vCPU
- Memory: 1 GiB
- Dahilan: Magaan na mga in-memory na operasyon

### Mga Health Check

Parehong isinasama ang liveness at readiness probes sa mga serbisyo:

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

**Ibig Sabihin Nito**:
- **Liveness**: Kung mabigo ang health check, rere-restart ng Container Apps ang container
- **Readiness**: Kung hindi handa, ititigil ng Container Apps ang pag-route ng traffic sa replica na iyon



## Pagmamanman at Observability

### Tingnan ang Mga Log ng Serbisyo

```bash
# Tingnan ang mga log gamit ang azd monitor
azd monitor --logs

# O gumamit ng Azure CLI para sa mga partikular na Container Apps:
# I-stream ang mga log mula sa API Gateway
az containerapp logs show --name api-gateway --resource-group $RG_NAME --follow

# Tingnan ang mga kamakailang log ng serbisyo ng produkto
az containerapp logs show --name product-service --resource-group $RG_NAME --tail 100
```

**Inaasahang Output**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Mga Query sa Application Insights

I-access ang Application Insights sa Azure Portal, pagkatapos patakbuhin ang mga query na ito:

**Hanapin ang Mabagal na Requests**:
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**Subaybayan ang Mga Tawag Serbisyo-sa-Serbisyo**:
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

**Rate ng Error ayon sa Serbisyo**:
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

**Dami ng Request sa Paglipas ng Panahon**:
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### I-access ang Monitoring Dashboard

```bash
# Kunin ang mga detalye ng Application Insights
azd env get-values | grep APPLICATIONINSIGHTS

# Buksan ang pagsubaybay sa Azure Portal
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### Live Metrics

1. Pumunta sa Application Insights sa Azure Portal
2. I-click ang "Live Metrics"
3. Makita ang real-time na mga request, pagkabigo, at performance
4. Subukan sa pamamagitan ng pagpapatakbo: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Praktikal na Ehersisyo

[Tandaan: Tingnan ang buong mga ehersisyo sa itaas sa seksyong "Practical Exercises" para sa detalyadong hakbang-hakbang na mga ehersisyo kabilang ang pagpapatunay ng deployment, pagbabago ng data, mga pagsubok ng autoscaling, paghawak ng mga error, at pagdagdag ng ikatlong serbisyo.]

## Pagsusuri ng Gastos

### Tinatayang Buwanang Gastos (Para sa Halimbawang may 2 Serbisyo)

| Resource | Configuration | Tinatayang Gastos |
|----------|--------------|-------------------|
| API Gateway | 2-20 replicas, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 replicas, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Basic tier | $5 |
| Application Insights | 1-2 GB/month | $5-10 |
| Log Analytics | 1 GB/month | $3 |
| **Total** | | **$58-243/buwan** |

**Pagkahati ng Gastos ayon sa Paggamit**:
- **Light traffic** (testing/pag-aaral): ~$60/buwan
- **Moderate traffic** (maliit na production): ~$120/buwan
- **High traffic** (mabigat na panahon): ~$240/buwan

### Mga Tip para sa Pag-optimize ng Gastos

1. **Mag-scale sa zero para sa Development**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Gamitin ang Consumption Plan para sa Cosmos DB** (kapag idinagdag mo ito):
   - Magbayad lamang para sa iyong nagamit
   - Walang minimum na singil

3. **I-set ang Application Insights Sampling**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // Kumuha ng 50% ng mga kahilingan bilang sample
   ```

4. **I-clean up kapag hindi kinakailangan**:
   ```bash
   azd down
   ```

### Mga Libreng Opsyon
Para sa pag-aaral/pagsubok, isaalang-alang:
- Gamitin ang libreng kredito ng Azure (unang 30 araw)
- Panatilihin ang bilang ng mga replika sa minimum
- Tanggalin pagkatapos ng pagsubok (walang patuloy na singil)

---

## Paglilinis

Upang maiwasan ang patuloy na singil, tanggalin ang lahat ng mga resource:

```bash
azd down --force --purge
```

**Prompt ng Kumpirmasyon**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

I-type ang `y` para kumpirmahin.

**Ano ang Matatanggal**:
- Container Apps Environment
- Both Container Apps (gateway & product service)
- Container Registry
- Application Insights
- Log Analytics Workspace
- Resource Group

**✓ Suriin ang Paglilinis**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Dapat magbalik ng walang laman.

---

## Gabay sa Pagpapalawak: Mula sa 2 hanggang 5+ Serbisyo

Kapag na-master mo na ang arkitekturang may 2 serbisyo na ito, narito kung paano palawakin:

### Yugto 1: Magdagdag ng Persistent na Storage para sa Database (Susunod na Hakbang)

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

2. I-update ang product service upang gumamit ng Cosmos DB sa halip na in-memory na datos

3. Tinatayang karagdagang gastos: ~$25/buwan (serverless)

### Yugto 2: Magdagdag ng Ikatlong Serbisyo (Pamamahala ng Order)

**Gumawa ng Order Service**:

1. Bagong folder: `src/order-service/` (Python/Node.js/C#)
2. Bagong Bicep: `infra/app/order-service.bicep`
3. I-update ang API Gateway upang i-route ang `/api/orders`
4. Magdagdag ng Azure SQL Database para sa pagpapanatili ng mga order

**Nagiging Arkitektura**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### Yugto 3: Magdagdag ng Asinkron na Komunikasyon (Service Bus)

**Ipatupad ang Event-Driven na Arkitektura**:

1. Magdagdag ng Azure Service Bus: `infra/core/servicebus.bicep`
2. Product Service ay naglalathala ng "ProductCreated" events
3. Order Service ay nag-subscribe sa mga event ng produkto
4. Magdagdag ng Notification Service para iproseso ang mga event

**Pattern**: Request/Response (HTTP) + Event-Driven (Service Bus)

### Yugto 4: Magdagdag ng Pagpapatunay ng Gumagamit

**Ipatupad ang User Service**:

1. Gumawa ng `src/user-service/` (Go/Node.js)
2. Magdagdag ng Azure AD B2C o custom na JWT authentication
3. Sinusuri ng API Gateway ang mga token
4. Sinusuri ng mga serbisyo ang mga permiso ng gumagamit

### Yugto 5: Kahandaan para sa Produksyon

**Magdagdag ng Mga Bahaging Ito**:
- Azure Front Door (pandaigdigang load balancing)
- Azure Key Vault (pamamahala ng mga lihim)
- Azure Monitor Workbooks (mga custom na dashboard)
- CI/CD Pipeline (GitHub Actions)
- Blue-Green Deployments
- Managed Identity para sa lahat ng serbisyo

**Buong Gastos para sa Produksyon**: ~$300-1,400/buwan

---

## Matuto Pa

### Kaugnay na Dokumentasyon
- [Dokumentasyon ng Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Gabay sa Arkitektura ng Microservices](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights para sa Distributed Tracing](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Dokumentasyon ng Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Mga Susunod na Hakbang sa Kurso na Ito
- ← Nakaraan: [Simple Flask API](../../../../../examples/container-app/simple-flask-api) - Halimbawa ng single-container para sa mga nagsisimula
- → Susunod: [Gabay sa Integrasyon ng AI](../../../../../examples/docs/ai-foundry) - Magdagdag ng kakayahan sa AI
- 🏠 [Tahanan ng Kurso](../../README.md)

### Paghahambing: Kailan Gamitin ang Bawat Isa

**Single Container App** (Halimbawa: Simple Flask API):
- ✅ Simpleng mga aplikasyon
- ✅ Monolitikong arkitektura
- ✅ Mabilis i-deploy
- ❌ Limitado ang kakayahan sa pag-scale
- **Gastos**: ~$15-50/buwan

**Microservices** (Ang halimbawang ito):
- ✅ Kumplikadong mga aplikasyon
- ✅ Independiyenteng pag-scale para sa bawat serbisyo
- ✅ Autonomiya ng team (magkakaibang serbisyo, magkakaibang team)
- ❌ Mas kumplikadong pamahalaan
- **Gastos**: ~$60-250/buwan

**Kubernetes (AKS)**:
- ✅ Pinakamataas na kontrol at kakayahang umangkop
- ✅ Multi-cloud na portability
- ✅ Advanced na networking
- ❌ Nangangailangan ng kahusayan sa Kubernetes
- **Gastos**: ~$150-500/buwan minimum

**Rekomendasyon**: Magsimula sa Container Apps (ang halimbawang ito), lumipat sa AKS lamang kung kailangan mo ng mga tampok na partikular sa Kubernetes.

---

## Madalas na Itanong

**Q: Bakit 2 lamang ang mga serbisyo at hindi 5+?**  
A: Para sa pagkatuto. Unahing ma-master ang mga pangunahing (komunikasyon ng serbisyo, monitoring, pag-scale) gamit ang simpleng halimbawa bago magdagdag ng kumplikasyon. Ang mga pattern na matututunan mo rito ay naaangkop sa mga arkitekturang may 100 serbisyo.

**Q: Maaari ba akong magdagdag ng higit pang mga serbisyo nang mag-isa?**  
A: Oo naman! Sundin ang gabay sa pagpapalawak sa itaas. Ang bawat bagong serbisyo ay sumusunod sa parehong pattern: gumawa ng src folder, gumawa ng Bicep file, i-update ang azure.yaml, i-deploy.

**Q: Handang-gamit ba ito sa produksyon?**  
A: Isang matibay na pundasyon ito. Para sa produksyon, magdagdag ng: managed identity, Key Vault, persistent na mga database, CI/CD pipeline, monitoring alerts, at backup strategy.

**Q: Bakit hindi gumamit ng Dapr o ibang service mesh?**  
A: Panatilihing simple para sa pag-aaral. Kapag naintindihan mo na ang native na networking ng Container Apps, maaari mong idagdag ang Dapr para sa mas advanced na mga senaryo.

**Q: Paano ako mag-debug nang lokal?**  
A: Patakbuhin ang mga serbisyo nang lokal gamit ang Docker:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**Q: Maaari ba akong gumamit ng iba't ibang programming languages?**  
A: Oo! Ipinapakita ng halimbawang ito ang Node.js (gateway) + Python (product service). Maaari mong paghaluin ang anumang mga wika na tumatakbo sa mga container.

**Q: Paano kung wala akong Azure credits?**  
A: Gamitin ang Azure free tier (unang 30 araw para sa mga bagong account) o i-deploy para sa maikling panahon ng pagsubok at tanggalin kaagad.

---

> **🎓 Buod ng Landas sa Pag-aaral**: Natutunan mong i-deploy ang isang arkitekturang multi-serbisyo na may awtomatikong scaling, internal na networking, sentralisadong monitoring, at mga pattern na handa na para sa produksyon. Inihahanda ka ng pundasyong ito para sa mga kumplikadong distributed na sistema at arkitekturang enterprise microservices.

**📚 Navigasyon ng Kurso:**
- ← Nakaraan: [Simple Flask API](../../../../../examples/container-app/simple-flask-api)
- → Susunod: [Database Integration Example](../../../../../examples/database-app)
- 🏠 [Tahanan ng Kurso](../../../README.md)
- 📖 [Best Practices para sa Container Apps](../../../docs/chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Paunawa:
Isinalin ang dokumentong ito gamit ang AI na serbisyo ng pagsasalin na [Co-op Translator] (https://github.com/Azure/co-op-translator). Bagama’t nagsusumikap kami para maging tumpak, pakitandaan na ang mga awtomatikong salin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatumpak. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na opisyal na sanggunian. Para sa kritikal na impormasyon, inirerekomenda ang propesyonal na pagsasaling‑tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na maaaring magmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->