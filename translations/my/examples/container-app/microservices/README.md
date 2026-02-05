# Microservices Architecture - Container App Example

⏱️ **ခန့်မှန်းချိန်**: ၂၅-၃၅ မိနစ် | 💰 **ခန့်မှန်းကုန်ကျစရိတ်**: ~$50-100/လ | ⭐ **အဆင့်**: အဆင့်မြင့်

Azure Container Apps ကို AZD CLI အသုံးပြု၍ **ရိုးရှင်းပြီး အသုံးပြုနိုင်သော** microservices architecture တစ်ခုကို deploy လုပ်ထားသည်။ ဤဥပမာသည် service-to-service ဆက်သွယ်မှု၊ container orchestration နှင့် monitoring ကို ၂- service setup ဖြင့် လက်တွေ့ပြသထားသည်။

> **📚 သင်ယူနည်းလမ်း**: ဤဥပမာသည် deploy လုပ်နိုင်ပြီး သင်ယူနိုင်သော အနည်းဆုံး ၂-service architecture (API Gateway + Backend Service) ဖြင့် စတင်သည်။ အခြေခံကို ကျွမ်းကျင်ပြီးနောက်၊ အပြည့်အစုံ microservices ecosystem သို့ တိုးချဲ့ရန် လမ်းညွှန်ချက်များကို ပေးထားသည်။

## သင်လေ့လာနိုင်မည့်အရာများ

ဤဥပမာကို ပြီးမြောက်စွာ လုပ်ဆောင်ပြီးပါက၊ သင်သည်:
- Azure Container Apps သို့ containers များ deploy လုပ်ခြင်း
- internal networking ဖြင့် service-to-service ဆက်သွယ်မှုကို အကောင်အထည်ဖော်ခြင်း
- environment-based scaling နှင့် health checks ကို configure လုပ်ခြင်း
- Application Insights ဖြင့် distributed applications များကို monitor လုပ်ခြင်း
- microservices deployment patterns နှင့် အကောင်းဆုံးအလေ့အကျင့်များကို နားလည်ခြင်း
- ရိုးရှင်းသော architecture မှ အဆင့်မြင့် architecture သို့ တိုးချဲ့ခြင်းကို သင်ယူခြင်း

## Architecture

### အဆင့် ၁: ကျွန်ုပ်တို့တည်ဆောက်မည့်အရာ (ဤဥပမာတွင် ပါဝင်သည်)

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

**ရိုးရှင်းစွာ စတင်ရန် အကြောင်းအရင်း**
- ✅ အလွယ်တကူ deploy လုပ်ပြီး နားလည်နိုင်သည် (၂၅-၃၅ မိနစ်)
- ✅ ရှုပ်ထွေးမှုမရှိဘဲ core microservices patterns များကို သင်ယူနိုင်သည်
- ✅ ပြောင်းလဲပြီး စမ်းသပ်နိုင်သော လုပ်ဆောင်နိုင်သော code
- ✅ သင်ယူရန်အတွက် အနည်းဆုံးကုန်ကျစရိတ် (~$50-100/လ vs $300-1400/လ)
- ✅ databases နှင့် message queues မထည့်မီ ယုံကြည်မှုတည်ဆောက်နိုင်သည်

**ဥပမာ**: ဦးဆောင်မောင်းနှင်ခြင်းကို သင်ယူရန် အလားတူသည်။ သင်သည် အလွတ်ရပ်နားနေသော parking lot (၂ services) မှ စတင်ပြီး အခြေခံကို ကျွမ်းကျင်ပြီးနောက်၊ မြို့တွင်း traffic (databases ပါဝင်သော ၅+ services) သို့ တိုးတက်သည်။

### အဆင့် ၂: အနာဂတ် တိုးချဲ့မှု (Reference Architecture)

၂-service architecture ကို ကျွမ်းကျင်ပြီးနောက်၊ သင်သည် တိုးချဲ့နိုင်သည်:

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

"Expansion Guide" အပိုင်း၏ နောက်ဆုံးတွင် အဆင့်ဆင့် လမ်းညွှန်ချက်များကို ကြည့်ပါ။

## ပါဝင်သော Features

✅ **Service Discovery**: containers များအကြား DNS-based discovery ကို အလိုအလျောက်  
✅ **Load Balancing**: replicas များအကြား built-in load balancing  
✅ **Auto-scaling**: HTTP requests အပေါ်မူတည်၍ service တစ်ခုချင်းစီကို အလိုအလျောက် scale လုပ်ခြင်း  
✅ **Health Monitoring**: liveness နှင့် readiness probes များ  
✅ **Distributed Logging**: Application Insights ဖြင့် centralized logging  
✅ **Internal Networking**: service-to-service ဆက်သွယ်မှုကို လုံခြုံစွာ  
✅ **Container Orchestration**: deployment နှင့် scaling ကို အလိုအလျောက်  
✅ **Zero-Downtime Updates**: revision management ဖြင့် rolling updates  

## လိုအပ်ချက်များ

### လိုအပ်သော Tools

စတင်မီ၊ သင်သည် အောက်ပါ tools များကို install လုပ်ထားကြောင်း အတည်ပြုပါ:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (version 1.0.0 သို့မဟုတ် အထက်)
   ```bash
   azd version
   # မျှော်မှန်းထားသော output: azd version 1.0.0 သို့မဟုတ် အထက်ရှိ version
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (version 2.50.0 သို့မဟုတ် အထက်)
   ```bash
   az --version
   # မျှော်မှန်းထားသော output: azure-cli 2.50.0 သို့မဟုတ် အထက်ရှိ version
   ```

3. **[Docker](https://www.docker.com/get-started)** (local development/testing အတွက် - optional)
   ```bash
   docker --version
   # မျှော်မှန်းထားသော output: Docker version 20.10 သို့မဟုတ် အထက်ရှိ version
   ```

### Azure Requirements

- **Azure subscription** ([အခမဲ့ account ဖန်တီးပါ](https://azure.microsoft.com/free/))  
- သင့် subscription တွင် resources များဖန်တီးရန် ခွင့်ပြုချက်  
- subscription သို့မဟုတ် resource group တွင် **Contributor** role  

### Knowledge Prerequisites

ဤဥပမာသည် **အဆင့်မြင့်** ဖြစ်သည်။ သင်သည်:
- [Simple Flask API example](../../../../../examples/container-app/simple-flask-api) ကို ပြီးမြောက်စွာ လုပ်ဆောင်ပြီးဖြစ်ရမည်  
- microservices architecture ကို အခြေခံနားလည်ထားရမည်  
- REST APIs နှင့် HTTP ကို ရင်းနှီးထားရမည်  
- container concepts ကို နားလည်ထားရမည်  

**Container Apps အသစ်စတင်သုံးနေပါသလား?** [Simple Flask API example](../../../../../examples/container-app/simple-flask-api) ကို အရင်စတင်ပါ။

## Quick Start (Step-by-Step)

### အဆင့် ၁: Clone နှင့် Navigate

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ အောင်မြင်မှု စစ်ဆေးချက်**: `azure.yaml` ကို တွေ့ရမည်:
```bash
ls
# မျှော်မှန်းထားသည်: README.md, azure.yaml, infra/, src/
```

### အဆင့် ၂: Azure နှင့် Authenticate

```bash
azd auth login
```

ဤသည် သင့် browser ကို ဖွင့်ပြီး Azure authentication အတွက် Sign in လုပ်ရန် တောင်းဆိုသည်။

**✓ အောင်မြင်မှု စစ်ဆေးချက်**: သင်သည် အောက်ပါအတိုင်း တွေ့ရမည်:
```
Logged in to Azure.
```

### အဆင့် ၃: Environment ကို Initialize လုပ်ပါ

```bash
azd init
```

**သင်တွေ့ရမည့် Prompts**:
- **Environment name**: အတိုချုံးနာမည်ထည့်ပါ (ဥပမာ `microservices-dev`)
- **Azure subscription**: သင့် subscription ကို ရွေးပါ
- **Azure location**: region ရွေးပါ (ဥပမာ `eastus`, `westeurope`)

**✓ အောင်မြင်မှု စစ်ဆေးချက်**: သင်သည် အောက်ပါအတိုင်း တွေ့ရမည်:
```
SUCCESS: New project initialized!
```

### အဆင့် ၄: Infrastructure နှင့် Services ကို Deploy လုပ်ပါ

```bash
azd up
```

**ဖြစ်ပျက်မည့်အရာများ** (၈-၁၂ မိနစ်):
1. Container Apps environment ကို ဖန်တီးသည်
2. Application Insights ကို monitoring အတွက် ဖန်တီးသည်
3. API Gateway container ကို build လုပ်သည် (Node.js)
4. Product Service container ကို build လုပ်သည် (Python)
5. containers နှစ်ခုလုံးကို Azure သို့ deploy လုပ်သည်
6. networking နှင့် health checks ကို configure လုပ်သည်
7. monitoring နှင့် logging ကို စနစ်တကျ ပြုလုပ်သည်

**✓ အောင်မြင်မှု စစ်ဆေးချက်**: သင်သည် အောက်ပါအတိုင်း တွေ့ရမည်:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ အချိန်**: ၈-၁၂ မိနစ်

### အဆင့် ၅: Deployment ကို စမ်းသပ်ပါ

```bash
# ဂိတ်ဝင်အဆုံးကိုရယူပါ
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# API Gateway ကျန်းမာရေးကိုစမ်းသပ်ပါ
curl $GATEWAY_URL/health

# မျှော်မှန်းထားသော output:
# {"status":"healthy","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**gateway မှတဆင့် product service ကို စမ်းသပ်ပါ**:
```bash
# ထုတ်ကုန်များစာရင်း
curl $GATEWAY_URL/api/products

# မျှော်မှန်းထားသော output:
# [
#   {"id":1,"name":"Laptop","price":999.99,"stock":50},
#   {"id":2,"name":"Mouse","price":29.99,"stock":200},
#   {"id":3,"name":"Keyboard","price":79.99,"stock":150}
# ]
```

**✓ အောင်မြင်မှု စစ်ဆေးချက်**: endpoints နှစ်ခုလုံး JSON data ကို error မရှိဘဲ ပြန်ပေးသည်။

---

**🎉 ဂုဏ်ယူပါတယ်!** သင်သည် microservices architecture ကို Azure သို့ deploy လုပ်ပြီးပါပြီ!

## Project Structure

Implementation files အားလုံးပါဝင်သည်—ဤသည်မှာ အပြည့်အစုံ၊ လုပ်ဆောင်နိုင်သော ဥပမာတစ်ခုဖြစ်သည်:

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

**Component တစ်ခုချင်းစီ၏ လုပ်ဆောင်ချက်များ**:

**Infrastructure (infra/)**:
- `main.bicep`: Azure resources အားလုံးနှင့် dependencies များကို စနစ်တကျ ပြုလုပ်သည်
- `core/container-apps-environment.bicep`: Container Apps environment နှင့် Azure Container Registry ကို ဖန်တီးသည်
- `core/monitor.bicep`: Application Insights ကို distributed logging အတွက် စနစ်တကျ ပြုလုပ်သည်
- `app/*.bicep`: Individual container app definitions များကို scaling နှင့် health checks ဖြင့်

**API Gateway (src/api-gateway/)**:
- Public-facing service ဖြစ်ပြီး backend services များသို့ requests များကို route လုပ်သည်
- logging, error handling, နှင့် request forwarding ကို implement လုပ်သည်
- service-to-service HTTP communication ကို ပြသသည်

**Product Service (src/product-service/)**:
- product catalog (ရိုးရှင်းစွာ in-memory) ပါဝင်သော internal service
- REST API နှင့် health checks
- backend microservice pattern ကို ဥပမာပြသသည်

## Services Overview

### API Gateway (Node.js/Express)

**Port**: 8080  
**Access**: Public (external ingress)  
**Purpose**: incoming requests များကို backend services သို့ route လုပ်သည်  

**Endpoints**:
- `GET /` - Service information
- `GET /health` - Health check endpoint
- `GET /api/products` - product service (list all) သို့ forward
- `GET /api/products/:id` - product service (get by ID) သို့ forward

**Key Features**:
- axios ဖြင့် request routing
- Centralized logging
- Error handling နှင့် timeout management
- Environment variables ဖြင့် service discovery
- Application Insights integration

**Code Highlight** (`src/api-gateway/app.js`):
```javascript
// အတွင်းဝန်ဆောင်မှုဆက်သွယ်မှု
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Product Service (Python/Flask)

**Port**: 8000  
**Access**: Internal only (external ingress မရှိ)  
**Purpose**: in-memory data ဖြင့် product catalog ကို စနစ်တကျ ပြုလုပ်သည်  

**Endpoints**:
- `GET /` - Service information
- `GET /health` - Health check endpoint
- `GET /products` - List all products
- `GET /products/<id>` - Get product by ID

**Key Features**:
- RESTful API with Flask
- database မလိုအပ်သော in-memory product store
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

**အဘယ်ကြောင့် Internal Only?**
Product service ကို public-facing မဟုတ်ပါ။ requests အားလုံးသည် API Gateway မှတဆင့် သွားရမည်။ ဤသည်သည်:
- လုံခြုံမှု: Controlled access point
- Flexibility: backend ကို ပြောင်းလဲနိုင်သည်
- Monitoring: Centralized request logging

## Service Communication ကို နားလည်ခြင်း

### Services များအကြား ဆက်သွယ်မှု

ဤဥပမာတွင် API Gateway သည် Product Service နှင့် **internal HTTP calls** ဖြင့် ဆက်သွယ်သည်:

```javascript
// API Gateway (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// အတွင်း HTTP တောင်းဆိုမှုလုပ်ပါ
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**အဓိကအချက်များ**:

1. **DNS-Based Discovery**: Container Apps သည် internal services များအတွက် DNS ကို အလိုအလျောက် ပေးသည်
   - Product Service FQDN: `product-service.internal.<environment>.azurecontainerapps.io`
   - ရိုးရှင်းစွာ: `http://product-service` (Container Apps သည် ၎င်းကို resolve လုပ်သည်)

2. **Public Exposure မရှိ**: Product Service တွင် `external: false` ရှိသည်
   - Container Apps environment အတွင်းမှသာ access လုပ်နိုင်သည်
   - အင်တာနက်မှ မရောက်နိုင်ပါ

3. **Environment Variables**: Service URLs များကို deployment အချိန်တွင် inject လုပ်သည်
   - Bicep သည် internal FQDN ကို gateway သို့ pass လုပ်သည်
   - Application code တွင် hardcoded URLs မရှိပါ

**ဥပမာ**: ဤသည်သည် ရုံးခန်းများနှင့် တူသည်။ API Gateway သည် reception desk (public-facing) ဖြစ်ပြီး Product Service သည် ရုံးခန်း (internal only) ဖြစ်သည်။ Visitors များသည် reception မှတဆင့်သာ ရုံးခန်းများသို့ ရောက်နိုင်သည်။

## Deployment Options

### Full Deployment (အကြံပြု)

```bash
# အခြေခံအဆောက်အအုံနှင့် ဝန်ဆောင်မှုနှစ်ခုကို တင်သွင်းပါ
azd up
```

ဤသည် deploy လုပ်သည်:
1. Container Apps environment
2. Application Insights
3. Container Registry
4. API Gateway container
5. Product Service container

**အချိန်**: ၈-၁၂ မိနစ်

### Individual Service ကို Deploy လုပ်ပါ

```bash
# တစ်ခုတည်းသော service ကို deploy လုပ်ပါ (အစပိုင်း azd up ပြီးနောက်)
azd deploy api-gateway

# သို့မဟုတ် product service ကို deploy လုပ်ပါ
azd deploy product-service
```

**အသုံးပြုမှု**: သင်သည် service တစ်ခု၏ code ကို update လုပ်ပြီး service တစ်ခုသာ redeploy လုပ်လိုသောအခါ။

### Configuration ကို Update လုပ်ပါ

```bash
# အတိုင်းအတာများကို ပြောင်းလဲပါ
azd env set GATEWAY_MAX_REPLICAS 30

# configuration အသစ်ဖြင့် ပြန်လည်တပ်ဆင်ပါ
azd up
```

## Configuration

### Scaling Configuration

Services နှစ်ခုလုံးသည် Bicep files တွင် HTTP-based autoscaling ဖြင့် configure လုပ်ထားသည်:

**API Gateway**:
- Min replicas: ၂ (availability အတွက် အနည်းဆုံး ၂)
- Max replicas: ၂၀
- Scale trigger: replica တစ်ခုလျှင် ၅၀ concurrent requests

**Product Service**:
- Min replicas: ၁ (လိုအပ်ပါက zero သို့ scale လုပ်နိုင်သည်)
- Max replicas: ၁၀
- Scale trigger: replica တစ်ခုလျှင် ၁၀၀ concurrent requests

**Scaling ကို Customize လုပ်ပါ** (`infra/app/*.bicep`):
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
- အကြောင်းအရင်း: external traffic အားလုံးကို handle လုပ်သည်

**Product Service**:
- CPU: 0.5 vCPU
- Memory: 1 GiB
- အကြောင်းအရင်း: Lightweight in-memory operations

### Health Checks

Services နှစ်ခုလုံးတွင် liveness နှင့် readiness probes ပါဝင်သည်:

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

**ဤသည်၏ အဓိပ္ပာယ်**:
- **Liveness**: health check မအောင်မြင်ပါက Container Apps သည် container ကို restart လုပ်သည်
- **Readiness**: ready မဖြစ်ပါက Container Apps သည် replica သို့ traffic မပို့ပါ

## Monitoring & Observability

### Service Logs ကို ကြည့်ရန်

```bash
# API Gateway မှ log များကို stream လုပ်ပါ
azd logs api-gateway --follow

# နောက်ဆုံးထုတ်ကုန်ဝန်ဆောင်မှု log များကိုကြည့်ပါ
azd logs product-service --tail 100

# ဝန်ဆောင်မှုနှစ်ခုလုံးမှ log အားလုံးကိုကြည့်ပါ
azd logs --follow
```

**မျှော်မှန်းရလဒ်**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Application Insights Queries

Azure Portal တွင် Application Insights ကို access လုပ်ပြီး အောက်ပါ queries များကို run လုပ်ပါ:

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

### Monitoring Dashboard ကို Access လုပ်ပါ

```bash
# အက်ပလီကေးရှင်းအိုင်ဆိုက်များ၏အသေးစိတ်ကိုရယူပါ
azd env get-values | grep APPLICATIONINSIGHTS

# Azure Portal monitoring ကိုဖွင့်ပါ
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### Live Metrics

1. Azure Portal တွင် Application Insights သို့ သွားပါ
2. "Live Metrics" ကို click လုပ်ပါ
3. real-time requests, failures, နှင့် performance ကို ကြည့်ပါ
4. စမ်းသပ်ရန် run လုပ်ပါ: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Practical Exercises

[မှတ်ချက်: "Practical Exercises" အပိုင်းတွင် အဆင့်ဆင့် လုပ်ဆောင်ရန် exercises များကို deployment verification, data modification, autoscaling tests, error handling, နှင့် third service ထည့်ခြင်းအပါအဝင် အသေးစိတ်ဖော်ပြထားသည်။]

## Cost Analysis

### Estimated Monthly Costs (ဤ ၂-Service Example အတွက်)

| Resource | Configuration | Estimated Cost |
|----------|--------------|----------------|
| API Gateway | 2-20 replicas, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 replicas, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Basic tier | $5 |
| Application Insights | 1-2 GB/month | $5-10 |
| Log Analytics | 1 GB/month | $3 |
| **Total** | | **$58-243/month** |

**Usage အပေါ်မူတည်သော ကုန်ကျစရိတ်**:
- **Light traffic** (testing/learning): ~$60/month
- **Moderate traffic** (small production): ~$120/month
- **High traffic** (busy periods): ~$240/month

### Cost Optimization Tips

1. **Development အတွက် Scale to Zero**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Cosmos DB အတွက် Consumption Plan ကို အသုံးပြုပါ** (သင်ထည့်မည်ဆိုပါက):
   - သုံးသလောက်ပေး
   - အနည်းဆုံး charge မရှိ

3. **Application Insights Sampling ကို Set လုပ်ပါ**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // တောင်းဆိုမှုများ၏ ၅၀% ကို နမူနာယူပါ
   ```

4. **မလိုအပ်ပါက Clean Up လုပ်ပါ**:
   ```bash
   azd down
   ```

### Free Tier Options
သင်ယူခြင်း/စမ်းသပ်ခြင်းအတွက် အကြံပြုချက်များ:
- Azure အခမဲ့ credits (ပထမ ၃၀ ရက်) ကို အသုံးပြုပါ
- Replica အနည်းဆုံးထားပါ
- စမ်းသပ်ပြီးနောက် ဖျက်ပါ (အဆက်မပြတ် အခကြေးငွေ မရှိပါ)

---

## ရှင်းလင်းခြင်း

အဆက်မပြတ် အခကြေးငွေ မရှိစေရန် အရင်းအမြစ်အားလုံးကို ဖျက်ပါ:

```bash
azd down --force --purge
```

**အတည်ပြုချက် Prompt**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

`y` ကို ရိုက်ထည့်ပြီး အတည်ပြုပါ။

**ဖျက်မည့်အရာများ**:
- Container Apps Environment
- Container Apps နှစ်ခု (gateway & product service)
- Container Registry
- Application Insights
- Log Analytics Workspace
- Resource Group

**✓ ရှင်းလင်းမှုကို စစ်ဆေးပါ**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

အလွတ်ပြန်လာသင့်သည်။

---

## တိုးချဲ့လမ်းညွှန်: ၂ မှ ၅+ ဝန်ဆောင်မှုများ

၂-ဝန်ဆောင်မှု architecture ကို ကျွမ်းကျင်ပြီးနောက် တိုးချဲ့ရန်အတွက်:

### အဆင့် ၁: Database Persistence ထည့်သွင်းခြင်း (နောက်တစ်ဆင့်)

**Product Service အတွက် Cosmos DB ထည့်သွင်းပါ**:

1. `infra/core/cosmos.bicep` ဖန်တီးပါ:
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

2. Product Service ကို in-memory data အစား Cosmos DB အသုံးပြုရန် update လုပ်ပါ

3. ခန့်မှန်းထားသော အပိုကုန်ကျစရိတ်: ~ $25/month (serverless)

### အဆင့် ၂: တတိယဝန်ဆောင်မှု (Order Management) ထည့်သွင်းပါ

**Order Service ဖန်တီးပါ**:

1. ဖိုင်ခွဲအသစ်: `src/order-service/` (Python/Node.js/C#)
2. Bicep အသစ်: `infra/app/order-service.bicep`
3. API Gateway ကို `/api/orders` သို့ route update လုပ်ပါ
4. Order persistence အတွက် Azure SQL Database ထည့်သွင်းပါ

**Architecture သည်**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### အဆင့် ၃: Async Communication (Service Bus) ထည့်သွင်းပါ

**Event-Driven Architecture ကို အကောင်အထည်ဖော်ပါ**:

1. Azure Service Bus ထည့်သွင်းပါ: `infra/core/servicebus.bicep`
2. Product Service သည် "ProductCreated" events ကို publish လုပ်ပါ
3. Order Service သည် product events ကို subscribe လုပ်ပါ
4. Notification Service ကို events ကို process လုပ်ရန် ထည့်သွင်းပါ

**Pattern**: Request/Response (HTTP) + Event-Driven (Service Bus)

### အဆင့် ၄: User Authentication ထည့်သွင်းပါ

**User Service ကို အကောင်အထည်ဖော်ပါ**:

1. `src/user-service/` ဖန်တီးပါ (Go/Node.js)
2. Azure AD B2C သို့မဟုတ် custom JWT authentication ထည့်သွင်းပါ
3. API Gateway သည် tokens ကို validate လုပ်ပါ
4. Services သည် user permissions ကို စစ်ဆေးပါ

### အဆင့် ၅: Production Readiness

**ဤအပိုင်းများကို ထည့်သွင်းပါ**:
- Azure Front Door (global load balancing)
- Azure Key Vault (secret management)
- Azure Monitor Workbooks (custom dashboards)
- CI/CD Pipeline (GitHub Actions)
- Blue-Green Deployments
- Managed Identity for all services

**Production Architecture အပြည့်အစုံကုန်ကျစရိတ်**: ~ $300-1,400/month

---

## ပိုမိုလေ့လာရန်

### ဆက်စပ် Documentation
- [Azure Container Apps Documentation](https://learn.microsoft.com/azure/container-apps/)
- [Microservices Architecture Guide](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights for Distributed Tracing](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### ဒီသင်ခန်းစာ၏ နောက်တစ်ဆင့်များ
- ← အရင်: [Simple Flask API](../../../../../examples/container-app/simple-flask-api) - Beginner single-container example
- → နောက်တစ်ဆင့်: [AI Integration Guide](../../../../../examples/docs/ai-foundry) - AI capabilities ထည့်သွင်းပါ
- 🏠 [Course Home](../../README.md)

### နှိုင်းယှဉ်ခြင်း: ဘာကို ဘယ်အချိန်မှာ အသုံးပြုမလဲ

**Single Container App** (Simple Flask API ဥပမာ):
- ✅ ရိုးရှင်းသော application များ
- ✅ Monolithic architecture
- ✅ Deploy လုပ်ရန် အလွယ်တကူ
- ❌ Scalability အကန့်အသတ်ရှိ
- **ကုန်ကျစရိတ်**: ~ $15-50/month

**Microservices** (ဤဥပမာ):
- ✅ ရှုပ်ထွေးသော application များ
- ✅ Service တစ်ခုချင်းစီအလိုက် independent scaling
- ✅ အဖွဲ့အစည်းအလိုက် အချုပ်အခြာအာဏာ (service များကွဲပြားခြင်း၊ အဖွဲ့များကွဲပြားခြင်း)
- ❌ စီမံခန့်ခွဲရန် ပိုမိုရှုပ်ထွေး
- **ကုန်ကျစရိတ်**: ~ $60-250/month

**Kubernetes (AKS)**:
- ✅ အများဆုံး control နှင့် flexibility
- ✅ Multi-cloud portability
- ✅ အဆင့်မြင့် networking
- ❌ Kubernetes ကျွမ်းကျင်မှု လိုအပ်
- **ကုန်ကျစရိတ်**: ~ $150-500/month အနည်းဆုံး

**အကြံပြုချက်**: Container Apps (ဤဥပမာ) ဖြင့် စတင်ပါ၊ Kubernetes-specific features လိုအပ်ပါက AKS သို့ ရောက်ပါ။

---

## မကြာခဏမေးလေ့ရှိသောမေးခွန်းများ

**Q: ဘာကြောင့် ၂ ဝန်ဆောင်မှုသာ အသုံးပြုသလဲ၊ ၅+ မဟုတ်ဘူးလား?**  
A: ပညာရေးအဆင့်ဆင့်တိုးတက်မှု။ ရိုးရှင်းသောဥပမာဖြင့် အခြေခံများ (service communication, monitoring, scaling) ကို ကျွမ်းကျင်ပြီးနောက် ရှုပ်ထွေးမှုကို ထည့်သွင်းပါ။ ဤနေရာတွင် သင်ယူသော pattern များသည် 100-service architectures တွင်လည်း အသုံးပြုနိုင်သည်။

**Q: ကိုယ်တိုင် service များကို ထည့်သွင်းနိုင်မလား?**  
A: အမှန်ပါပဲ! အထက်ပါ တိုးချဲ့လမ်းညွှန်ကို လိုက်နာပါ။ Service အသစ်တစ်ခုစီသည် အတူတူ pattern ကို လိုက်နာရမည်: src folder ဖန်တီးပါ၊ Bicep ဖိုင် ဖန်တီးပါ၊ azure.yaml update လုပ်ပါ၊ deploy လုပ်ပါ။

**Q: ဤသည် production-ready ဖြစ်ပါသလား?**  
A: အခြေခံအဆောက်အအုံကောင်းတစ်ခုဖြစ်သည်။ Production အတွက် managed identity, Key Vault, persistent databases, CI/CD pipeline, monitoring alerts, နှင့် backup strategy ထည့်သွင်းပါ။

**Q: Dapr သို့မဟုတ် အခြား service mesh မသုံးဘဲ ဘာကြောင့်?**  
A: သင်ယူရန် ရိုးရှင်းစေပါ။ Container Apps networking ကို နားလည်ပြီးနောက် Dapr ကို layer လုပ်၍ အဆင့်မြင့် scenario များအတွက် အသုံးပြုနိုင်သည်။

**Q: Local မှာ debug လုပ်နည်း?**  
A: Docker ဖြင့် service များကို local မှာ run လုပ်ပါ:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**Q: ကွဲပြားသော programming language များကို အသုံးပြုနိုင်မလား?**  
A: ဟုတ်ကဲ့! ဤဥပမာတွင် Node.js (gateway) + Python (product service) ကို ပြသထားသည်။ Container တွင် run လုပ်နိုင်သော ဘာသာစကားမဆို ရောနှောအသုံးပြုနိုင်သည်။

**Q: Azure credits မရှိရင် ဘာလုပ်မလဲ?**  
A: Azure အခမဲ့ tier (အကောင့်အသစ်များအတွက် ပထမ ၃၀ ရက်) ကို အသုံးပြုပါ၊ သို့မဟုတ် testing အတိုင်း deploy လုပ်ပြီး ချက်ချင်းဖျက်ပါ။

---

> **🎓 သင်ယူလမ်းကြောင်းအကျဉ်းချုပ်**: သင်သည် automatic scaling, internal networking, centralized monitoring, နှင့် production-ready patterns ဖြင့် multi-service architecture ကို deploy လုပ်နည်းကို သင်ယူပြီးပါပြီ။ ဤအခြေခံအဆောက်အအုံသည် ရှုပ်ထွေးသော distributed systems နှင့် enterprise microservices architectures အတွက် ပြင်ဆင်ပေးသည်။

**📚 သင်ခန်းစာ Navigation**:
- ← အရင်: [Simple Flask API](../../../../../examples/container-app/simple-flask-api)
- → နောက်တစ်ဆင့်: [Database Integration Example](../../../../../examples/database-app)
- 🏠 [Course Home](../../README.md)
- 📖 [Container Apps Best Practices](../../docs/deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မမှန်ကန်မှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာတရားရှိသော အရင်းအမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူက ဘာသာပြန်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်မှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအမှားများ သို့မဟုတ် အနားလွဲမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->