# মাইক্রোসার্ভিস আর্কিটেকচার - কন্টেইনার অ্যাপ উদাহরণ

⏱️ **Estimated Time**: 25-35 minutes | 💰 **Estimated Cost**: ~$50-100/month | ⭐ **Complexity**: Advanced

A **simplified but functional** microservices architecture deployed to Azure Container Apps using AZD CLI. This example demonstrates service-to-service communication, container orchestration, and monitoring with a practical 2-service setup.

> **📚 Learning Approach**: This example starts with a minimal 2-service architecture (API Gateway + Backend Service) that you can actually deploy and learn from. After mastering this foundation, we provide guidance for expanding to a full microservices ecosystem.

## আপনি কি শিখবেন

By completing this example, you will:
- Deploy multiple containers to Azure Container Apps
- Implement service-to-service communication with internal networking
- Configure environment-based scaling and health checks
- Monitor distributed applications with Application Insights
- Understand microservices deployment patterns and best practices
- Learn progressive expansion from simple to complex architectures

## আর্কিটেকচার

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

**কেন সহজভাবে শুরু করবেন?**
- ✅ দ্রুত ডিপ্লয় ও বোঝা যায় (25-35 মিনিট)
- ✅ সরলীকৃত কোর মাইক্রোসার্ভিস প্যাটার্ন শিখুন জটিলতা ছাড়াই
- ✅ কাজ করা কোড যা আপনি পরিবর্তন ও পরীক্ষা করতে পারবেন
- ✅ শেখার জন্য কম খরচ (~$50-100/মাস বনাম $300-1400/মাস)
- ✅ ডাটাবেস ও মেসেজ কিউ যোগ করার আগে আত্মবিশ্বাস গড়ে তুলুন

**উপমা**: এটা ড্রাইভ শেখার মতো ভাবুন। আপনি একটা ফাঁকা পার্কিং লটে (2 সার্ভিস) শুরু করেন, মৌলিক বিষয়গুলো আয়ত্ত করেন, তারপর শহরের ট্রাফিকে (5+ সার্ভিস সহ ডাটাবেস) এগোন।

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

## অন্তর্ভুক্ত ফিচারসমূহ

✅ **সার্ভিস আবিষ্কার**: কন্টেইনারগুলোর মধ্যে অটোম্যাটিক DNS-ভিত্তিক আবিষ্কার  
✅ **লোড ব্যালান্সিং**: রেপ্লিকাগুলোর মধ্যে বিল্ট-ইন লোড ব্যালান্সিং  
✅ **স্বয়ংক্রিয় স্কেলিং**: HTTP অনুরোধের ভিত্তিতে সার্ভিসভিত্তিক স্বাধীন স্কেলিং  
✅ **স্বাস্থ্য পর্যবেক্ষণ**: উভয় সার্ভিসের জন্য লাইভনেস ও রেডিনেস প্রোব  
✅ **বিতরণকৃত লগিং**: Application Insights দিয়ে কেন্দ্রীভূত লগিং  
✅ **অভ্যন্তরীণ নেটওয়ার্কিং**: নিরাপদ সার্ভিস-টু-সার্ভিস কমিউনিকেশন  
✅ **কন্টেইনার অর্কেস্ট্রেশন**: অটোমেটেড ডিপ্লয়মেন্ট ও স্কেলিং  
✅ **ডাউনটাইম-রহিত আপডেট**: রোলিং আপডেটস ও রিভিশন ম্যানেজমেন্ট  

## পূর্বশর্ত

### প্রয়োজনীয় টুলস

Before starting, verify you have these tools installed:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (version 1.0.0 or higher)
   ```bash
   azd version
   # প্রত্যাশিত আউটপুট: azd সংস্করণ 1.0.0 বা তার বেশি
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (version 2.50.0 or higher)
   ```bash
   az --version
   # প্রত্যাশিত আউটপুট: azure-cli 2.50.0 বা তার চেয়ে উচ্চতর
   ```

3. **[Docker](https://www.docker.com/get-started)** (for local development/testing - optional)
   ```bash
   docker --version
   # প্রত্যাশিত আউটপুট: Docker সংস্করণ 20.10 বা তার বেশি
   ```

### Azure প্রয়োজনীয়তা

- An active **Azure subscription** ([create a free account](https://azure.microsoft.com/free/))
- Permissions to create resources in your subscription
- **Contributor** role on the subscription or resource group

### জ্ঞানগত পূর্বশর্ত

This is an **advanced-level** example. You should have:
- Completed the [Simple Flask API example](../../../../../examples/container-app/simple-flask-api) 
- Basic understanding of microservices architecture
- Familiarity with REST APIs and HTTP
- Understanding of container concepts

**New to Container Apps?** Start with the [Simple Flask API example](../../../../../examples/container-app/simple-flask-api) first to learn the basics.

## দ্রুত শুরু (ধাপে ধাপে)

### ধাপ 1: ক্লোন ও নেভিগেট

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ Success Check**: Verify you see `azure.yaml`:
```bash
ls
# প্রত্যাশিত: README.md, azure.yaml, infra/, src/
```

### ধাপ 2: Azure-এ প্রমাণীকরণ

```bash
azd auth login
```

This opens your browser for Azure authentication. Sign in with your Azure credentials.

**✓ Success Check**: You should see:
```
Logged in to Azure.
```

### ধাপ 3: পরিবেশ ইনিশিয়ালাইজ করুন

```bash
azd init
```

**আপনি যে প্রম্পটগুলো দেখবেন**:
- **Environment name**: Enter a short name (e.g., `microservices-dev`)
- **Azure subscription**: Select your subscription
- **Azure location**: Choose a region (e.g., `eastus`, `westeurope`)

**✓ Success Check**: You should see:
```
SUCCESS: New project initialized!
```

### ধাপ 4: অবকাঠামো ও সার্ভিসগুলো ডিপ্লয় করুন

```bash
azd up
```

**কি হবে** (সময় লাগে 8-12 মিনিট):
1. Container Apps পরিবেশ তৈরি করে
2. মনিটরিং-এর জন্য Application Insights সেটআপ করে
3. API Gateway কন্টেইনার বিল্ড করে (Node.js)
4. Product Service কন্টেইনার বিল্ড করে (Python)
5. উভয় কন্টেইনার Azure-এ ডিপ্লয় করে
6. নেটওয়ার্কিং ও হেলথ চেক কনফিগার করে
7. মনিটরিং ও লগিং সেটআপ করে

**✓ Success Check**: You should see:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ Time**: 8-12 minutes

### ধাপ 5: ডিপ্লয়মেন্ট টেস্ট করুন

```bash
# গেটওয়ে এন্ডপয়েন্টটি নিন
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# API গেটওয়ের স্বাস্থ্য পরীক্ষা করুন
curl $GATEWAY_URL/health

# প্রত্যাশিত আউটপুট:
# {"status":"healthy","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**গেটওয়ে মাধ্যমে প্রডাক্ট সার্ভিস টেস্ট করুন**:
```bash
# পণ্যসমূহ তালিকা
curl $GATEWAY_URL/api/products

# প্রত্যাশিত আউটপুট:
# [
#   {"id":1,"name":"Laptop","price":999.99,"stock":50},
#   {"id":2,"name":"Mouse","price":29.99,"stock":200},
#   {"id":3,"name":"Keyboard","price":79.99,"stock":150}
# ]
```

**✓ Success Check**: Both endpoints return JSON data without errors.

---

**🎉 অভিনন্দন!** আপনি Azure-এ মাইক্রোসার্ভিস আর্কিটেকচার ডিপ্লয় করেছেন!

## প্রজেক্ট কাঠামো

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

**প্রতিটি কম্পোনেন্ট কী করে:**

**Infrastructure (infra/)**:
- `main.bicep`: সমস্ত Azure রিসোর্স এবং তাদের ডিপেন্ডেন্সি সমন্বয় করে
- `core/container-apps-environment.bicep`: Container Apps পরিবেশ এবং Azure Container Registry তৈরি করে
- `core/monitor.bicep`: বিতরণকৃত লগিং-এর জন্য Application Insights সেটআপ করে
- `app/*.bicep`: স্কেলিং এবং হেলথ চেকসহ পৃথক কন্টেইনার অ্যাপ ডিফিনিশনগুলো

**API Gateway (src/api-gateway/)**:
- পাবলিক ফেসিং সার্ভিস যা ব্যাকএন্ড সার্ভিসগুলোর কাছে রিকোয়েস্ট রুট করে
- লগিং, এরর হ্যান্ডলিং, এবং রিকোয়েস্ট ফরওয়ার্ডিং ইমপ্লিমেন্ট করে
- সার্ভিস-টু-সার্ভিস HTTP কমিউনিকেশনের উদাহরণ দেয়

**Product Service (src/product-service/)**:
- ইন-মেমরি প্রোডাক্ট ক্যাটালগ সহ ইন্টারনাল সার্ভিস (সরলতার জন্য)
- REST API ও হেলথ চেক সহ
- ব্যাকএন্ড মাইক্রোসার্ভিস প্যাটার্নের উদাহরণ

## সার্ভিস ওভারভিউ

### API Gateway (Node.js/Express)

**Port**: 8080  
**Access**: Public (external ingress)  
**Purpose**: ইনকামিং রিকোয়েস্টগুলোকে উপযুক্ত ব্যাকএন্ড সার্ভিসে রুট করে  

**Endpoints**:
- `GET /` - Service information
- `GET /health` - Health check endpoint
- `GET /api/products` - Forward to product service (list all)
- `GET /api/products/:id` - Forward to product service (get by ID)

**Key Features**:
- axios দিয়ে রিকোয়েস্ট রাউটিং
- কেন্দ্রভিত্তিক লগিং
- এরর হ্যান্ডলিং ও টাইমআউট ম্যানেজমেন্ট
- পরিবেশ ভ্যারিয়েবল মাধ্যমে সার্ভিস ডিসকভারি
- Application Insights ইন্টিগ্রেশন

**Code Highlight** (`src/api-gateway/app.js`):
```javascript
// অভ্যন্তরীণ সার্ভিসের যোগাযোগ
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Product Service (Python/Flask)

**Port**: 8000  
**Access**: Internal only (no external ingress)  
**Purpose**: ইন-মেমরি ডেটা সহ প্রোডাক্ট ক্যাটালগ পরিচালনা করা  

**Endpoints**:
- `GET /` - Service information
- `GET /health` - Health check endpoint
- `GET /products` - List all products
- `GET /products/<id>` - Get product by ID

**Key Features**:
- Flask দিয়ে RESTful API
- ইন-মেমরি প্রোডাক্ট স্টোর (সরল, কোনো ডাটাবেস দরকার নেই)
- প্রোব সহ স্বাস্থ্য মনিটরিং
- স্ট্রাকচার্ড লগিং
- Application Insights ইন্টিগ্রেশন

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

**কেন শুধুই ইন্টারনাল?**
Product Service পাবলিকভাবে এক্সপোজ করা হয়নি। সব রিকোয়েস্ট API Gateway-এর মাধ্যমে যেতে হবে, যা প্রদান করে:
- সিকিউরিটি: নিয়ন্ত্রিত এক্সেস পয়েন্ট
- নমনীয়তা: ব্যাকএন্ড পরিবর্তন করলে ক্লায়েন্ট প্রভাবিত হয় না
- মনিটরিং: কেন্দ্রীভূত রিকোয়েস্ট লগিং

## সার্ভিস কমিউনিকেশন বোঝা

### সার্ভিসগুলো কিভাবে একে অপরের সাথে কথা বলে

In this example, the API Gateway communicates with the Product Service using **internal HTTP calls**:

```javascript
// API গেটওয়ে (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// অভ্যন্তরীণ HTTP অনুরোধ করুন
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**কী বিষয়গুলো জানা জরুরি**:

1. **DNS-ভিত্তিক ডিসকভারি**: Container Apps স্বয়ংক্রিয়ভাবে অভ্যন্তরীণ সার্ভিসগুলোর জন্য DNS প্রদান করে
   - Product Service FQDN: `product-service.internal.<environment>.azurecontainerapps.io`
   - সরলীকৃত: `http://product-service` (Container Apps এটিকে রেজলভ করে)

2. **কোনো পাবলিক এক্সপোজার নেই**: Product Service-এ Bicep-এ `external: false` আছে
   - শুধুমাত্র Container Apps পরিবেশের ভিতর থেকেই অ্যাক্সেসযোগ্য
   - ইন্টারনেট থেকে পৌঁছানো যায় না

3. **পরিবেশ ভ্যারিয়েবল**: সার্ভিস URL ডিপ্লয়মেন্ট সময় ইনজেক্ট করা হয়
   - Bicep গেটে অন্তর্ভুক্ত অভ্যন্তরীন FQDN পাস করে
   - অ্যাপ্লিকেশন কোডে কোনো হার্ডকোডেড URL নেই

**উপমা**: এটা অফিস রুমের মতো ভাবুন। API Gateway হলো রিসেপশান ডেস্ক (পাবলিক-ফেসিং), এবং Product Service হলো একটি অফিস কক্ষ (শুধুমাত্র অভ্যন্তরীণ)। ভিজিটরদের রিসেপশান পেরিয়ে অফিসে যাওয়ার আগেই যেতে হবে।

## ডিপ্লয়মেন্ট অপশনসমূহ

### ফুল ডিপ্লয়মেন্ট (প্রস্তাবিত)

```bash
# ইনফ্রাস্ট্রাকচার এবং উভয় সার্ভিস স্থাপন করুন
azd up
```

This deploys:
1. Container Apps environment
2. Application Insights
3. Container Registry
4. API Gateway container
5. Product Service container

**Time**: 8-12 minutes

### শুধুমাত্র নির্দিষ্ট সার্ভিস ডিপ্লয় করা

```bash
# শুধুমাত্র একটি সার্ভিস ডিপ্লয় করুন (প্রাথমিক azd up চালানোর পরে)
azd deploy api-gateway

# অথবা পণ্য সার্ভিস ডিপ্লয় করুন
azd deploy product-service
```

**Use Case**: When you've updated code in one service and want to redeploy only that service.

### কনফিগারেশন আপডেট করুন

```bash
# স্কেলিং প্যারামিটার পরিবর্তন করুন
azd env set GATEWAY_MAX_REPLICAS 30

# নতুন কনফিগারেশন নিয়ে পুনরায় ডিপ্লয় করুন
azd up
```

## কনফিগারেশন

### স্কেলিং কনফিগারেশন

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

### রিসোর্স বরাদ্দ

**API Gateway**:
- CPU: 1.0 vCPU
- Memory: 2 GiB
- কারণ: সমস্ত বাহ্যিক ট্র্যাফিক হ্যান্ডেল করে

**Product Service**:
- CPU: 0.5 vCPU
- Memory: 1 GiB
- কারণ: হালকা ইন-মেমরি অপারেশন

### হেলথ চেকস

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

**এর মানে কি**:
- **Liveness**: যদি হেলথ চেক ব্যর্থ হয়, Container Apps কন্টেইনার রিস্টার্ট করে
- **Readiness**: যদি রেডি না থাকে, Container Apps সেই রেপ্লিকায় ট্র্যাফিক রুট করা বন্ধ করে



## মনিটরিং ও অবজারভেবিলিটি

### সার্ভিস লগ দেখুন

```bash
# azd monitor ব্যবহার করে লগ দেখুন
azd monitor --logs

# অথবা নির্দিষ্ট Container Apps-এর জন্য Azure CLI ব্যবহার করুন:
# API Gateway থেকে লগ স্ট্রিম করুন
az containerapp logs show --name api-gateway --resource-group $RG_NAME --follow

# সাম্প্রতিক product service লগ দেখুন
az containerapp logs show --name product-service --resource-group $RG_NAME --tail 100
```

**প্রত্যাশিত আউটপুট**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Application Insights কুয়েরি

Azure Portal-এ Application Insights খুলুন, তারপর এই কুয়েরিগুলো চালান:

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

### মনিটরিং ড্যাশবোর্ডে অ্যাক্সেস

```bash
# Application Insights-এর বিবরণ পান
azd env get-values | grep APPLICATIONINSIGHTS

# Azure পোর্টালের মনিটরিং খুলুন
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### লাইভ মেট্রিক্স

1. Application Insights-এ Azure Portal-এ যান
2. "Live Metrics" ক্লিক করুন
3. রিয়েল-টাইম রিকোয়েস্ট, ফেলিয়ার, এবং পারফরম্যান্স দেখুন
4. টেস্ট করতে রান করুন: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## প্র্যাকটিক্যাল এক্সারসাইজ

[Note: See full exercises above in the "Practical Exercises" section for detailed step-by-step exercises including deployment verification, data modification, autoscaling tests, error handling, and adding a third service.]

## খরচ বিশ্লেষণ

### আনুমানিক মাসিক খরচ (এই 2-সার্ভিস উদাহরণের জন্য)

| Resource | Configuration | Estimated Cost |
|----------|--------------|----------------|
| API Gateway | 2-20 replicas, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 replicas, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Basic tier | $5 |
| Application Insights | 1-2 GB/month | $5-10 |
| Log Analytics | 1 GB/month | $3 |
| **Total** | | **$58-243/month** |

**ব্যবহারের ভিত্তিতে খরচ-বিভাগ**:
- **হালকা ট্র্যাফিক** (টেস্টিং/শিক্ষা): ~$60/month
- **মধ্যম ট্র্যাফিক** (ছোট প্রোডাকশন): ~$120/month
- **উচ্চ ট্র্যাফিক** (ব্যস্ত সময়): ~$240/month

### খরচ অপ্টিমাইজেশন টিপস

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
   appInsights.defaultClient.config.samplingPercentage = 50; // অনুরোধের ৫০% নমুনা করুন
   ```

4. **Clean Up When Not Needed**:
   ```bash
   azd down
   ```

### ফ্রি টিয়ার অপশনসমূহ
শিখতে/পরীক্ষা করার জন্য বিবেচনা করুন:
- নতুন অ্যাকাউন্টের জন্য প্রথম ৩০ দিনে Azure-এর ফ্রি ক্রেডিট ব্যবহার করুন
- রেপ্লিকা সর্বনিম্ন রাখুন
- পরীক্ষা শেষে মুছুন (চলমান কোনও চার্জ থাকবে না)

---

## পরিষ্কার

চলমান চার্জ এড়াতে, সব রিসোর্স মুছুন:

```bash
azd down --force --purge
```

**নিশ্চিতকরণ অনুরোধ**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

নিশ্চিত করতে `y` টাইপ করুন।

**কি মুছে ফেলা হবে**:
- Container Apps Environment
- উভয় Container Apps (gateway & product service)
- Container Registry
- Application Insights
- Log Analytics Workspace
- Resource Group

**✓ পরিষ্কার হয়েছে তা যাচাই করুন**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

ফাঁকা ফলাফল আসা উচিত।

---

## বিস্তৃতি নির্দেশিকা: 2 থেকে 5+ সার্ভিস

একবার আপনি এই 2-সার্ভিস আর্কিটেকচার আয়ত্ত করলে, এইভাবে বিস্তার করবেন:

### পর্যায় 1: ডাটাবেস স্টোরেজ যোগ করুন (পরবর্তী ধাপ)

**প্রোডাক্ট সার্ভিসের জন্য Cosmos DB যোগ করুন**:

1. তৈরি করুন `infra/core/cosmos.bicep`:
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

2. ইন-মেমরি ডেটার বদলে product সার্ভিসকে Cosmos DB ব্যবহার করতে আপডেট করুন

3. আনুমানিক অতিরিক্ত খরচ: ~$25/মাস (সার্ভারলেস)

### পর্যায় 2: তৃতীয় সার্ভিস যোগ করুন (অর্ডার ম্যানেজমেন্ট)

**অর্ডার সার্ভিস তৈরি করুন**:

1. নতুন ফোল্ডার: `src/order-service/` (Python/Node.js/C#)
2. নতুন Bicep: `infra/app/order-service.bicep`
3. API Gateway আপডেট করুন যাতে `/api/orders` রুট করে
4. অর্ডার পছন্দের জন্য Azure SQL Database যোগ করুন

**আর্কিটেকচার হয়ে উঠবে**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### পর্যায় 3: অ্যাসিঙ্ক্রোনাস কমিউনিকেশন যোগ করুন (Service Bus)

**ইভেন্ট-চালিত আর্কিটেকচার বাস্তবায়ন করুন**:

1. Azure Service Bus যোগ করুন: `infra/core/servicebus.bicep`
2. Product সার্ভিস "ProductCreated" ইভেন্ট প্রকাশ করে
3. Order সার্ভিস প্রোডাক্ট ইভেন্টগুলোতে সাবস্ক্রাইব করে
4. ইভেন্ট প্রক্রিয়াকরণের জন্য Notification সার্ভিস যোগ করুন

**প্যাটার্ন**: Request/Response (HTTP) + Event-Driven (Service Bus)

### পর্যায় 4: ইউজার অথেন্টিকেশন যোগ করুন

**User সার্ভিস বাস্তবায়ন করুন**:

1. তৈরি করুন `src/user-service/` (Go/Node.js)
2. Azure AD B2C বা কাস্টম JWT অথেন্টিকেশন যোগ করুন
3. API Gateway টোকেন যাচাই করে
4. সার্ভিসগুলো ইউজারের অনুমতি চেক করে

### পর্যায় 5: প্রোডাকশন-রেডিনেস

**এই উপাদানগুলি যোগ করুন**:
- Azure Front Door (গ্লোবাল লোড ব্যালান্সিং)
- Azure Key Vault (সিক্রেট ম্যানেজমেন্ট)
- Azure Monitor Workbooks (কাস্টম ড্যাশবোর্ড)
- CI/CD পাইপলাইন (GitHub Actions)
- ব্লু-গ্রিন ডিপ্লয়মেন্ট
- সব সার্ভিসের জন্য Managed Identity

**পূর্ণ প্রোডাকশন আর্কিটেকচার খরচ**: ~$300-1,400/মাস

---

## আরও জানুন

### সম্পর্কিত ডকুমেন্টেশন
- [Azure Container Apps Documentation](https://learn.microsoft.com/azure/container-apps/)
- [Microservices Architecture Guide](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights for Distributed Tracing](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### এই কোর্সের পরবর্তী ধাপসমূহ
- ← পূর্ববর্তী: [Simple Flask API](../../../../../examples/container-app/simple-flask-api) - শুরুতাদের জন্য একক-কনটেইনার উদাহরণ
- → পরবর্তী: [AI Integration Guide](../../../../../examples/docs/ai-foundry) - AI ক্ষমতা যোগ করা
- 🏠 [Course Home](../../README.md)

### তুলনা: কখন কোনটি ব্যবহার করবেন

**Single Container App** (Simple Flask API উদাহরণ):
- ✅ সহজ অ্যাপ্লিকেশন
- ✅ মনোলিথিক আর্কিটেকচার
- ✅ দ্রুত ডিপ্লয় করতে সক্ষম
- ❌ সীমিত স্কেলেবিলিটি
- **খরচ**: ~$15-50/মাস

**Microservices** (এই উদাহরণ):
- ✅ জটিল অ্যাপ্লিকেশন
- ✅ সার্ভিস অনুযায়ী স্বাধীন স্কেলিং
- ✅ দলীয় স্বায়ত্তশাসন (ভিন্ন সার্ভিস, ভিন্ন দল)
- ❌ পরিচালনা করা আরও জটিল
- **খরচ**: ~$60-250/মাস

**Kubernetes (AKS)**:
- ✅ সর্বাধিক নিয়ন্ত্রণ ও নমনীয়তা
- ✅ মাল্টি-ক্লাউড বহুমুখিতা
- ✅ উন্নত নেটওয়ার্কিং
- ❌ Kubernetes দক্ষতা প্রয়োজন
- **খরচ**: ~$150-500/মাস ন্যূনতম

**সুপারিশ**: Container Apps (এই উদাহরণ) দিয়ে শুরু করুন, শুধুমাত্র যদি Kubernetes-নির্দিষ্ট ফিচারের দরকার হয় তখনই AKS এ যান।

---

## ঘনঘন জিজ্ঞাস্য প্রশ্ন

**Q: কেন 5+ সার্ভিসের বদলে কেবল 2 সার্ভিস?**  
A: শিক্ষামূলক অগ্রগতি। জটিলতা বাড়ানোর আগে মৌলিক বিষয়গুলো (সার্ভিস কমিউনিকেশন, মনিটরিং, স্কেলিং) একটি সিম্পল উদাহরণ দিয়ে আয়ত্ত করুন। এখানে শেখা প্যাটার্নগুলো 100-সার্ভিস আর্কিটেকচারের জন্যও প্রযোজ্য।

**Q: আমি কি নিজে আরও সার্ভিস যোগ করতে পারি?**  
A: অবশ্যই! উপরের বিস্তৃতি নির্দেশিকা অনুসরণ করুন। প্রতিটি নতুন সার্ভিস একই প্যাটার্ন অনুসরণ করে: src ফোল্ডার তৈরি করুন, Bicep ফাইল তৈরি করুন, azure.yaml আপডেট করুন, ডিপ্লয় করুন।

**Q: এটি কি প্রোডাকশন-রেডি?**  
A: এটি একটি শক্ত ভিত্তি। প্রোডাকশনের জন্য যোগ করুন: managed identity, Key Vault, স্থায়ী ডাটাবেস, CI/CD পাইপলাইন, মনিটরিং অ্যালার্ট, এবং ব্যাকআপ স্ট্র্যাটেজি।

**Q: কেন Dapr বা অন্য সার্ভিস মেশ ব্যবহার করবেন না?**  
A: শেখার জন্য সহজ রাখুন। একবার আপনি Container Apps এর নেটওয়ার্কিং বোঝেন, তখন উন্নত সিনারিওর জন্য Dapr যোগ করা যায়।

**Q: আমি কিভাবে লোকালি ডিবাগ করবো?**  
A: সার্ভিসগুলো লোকালি Docker দিয়ে চালান:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**Q: আমি কি ভিন্ন প্রোগ্রামিং ভাষা ব্যবহার করতে পারি?**  
A: হ্যাঁ! এই উদাহরণে Node.js (gateway) + Python (product service) দেখানো হয়েছে। আপনি যে কোনো কনটেইনার-চালিত ভাষা মিশ্রিত করতে পারবেন।

**Q: যদি আমার কাছে Azure ক্রেডিট না থাকে তখন কি?**  
A: নতুন অ্যাকাউন্টের জন্য Azure ফ্রি টিয়ার ব্যবহার করুন (প্রথম ৩০ দিন) অথবা সংক্ষিপ্ত পরীক্ষার জন্য ডিপ্লয় করুন এবং তৎক্ষণাত মুছে দিন।

---

> **🎓 শেখার পথ সারসংক্ষেপ**: আপনি স্বয়ংক্রিয় স্কেলিং, ইন্টারন্যাল নেটওয়ার্কিং, কেন্দ্রীকৃত মনিটরিং, এবং প্রোডাকশন-রেডি প্যাটার্ন সহ একটি বহু-সার্ভিস আর্কিটেকচার ডিপ্লয় করতে শিখেছেন। এই ভিত্তি আপনাকে জটিল ডিস্ট্রিবিউটেড সিস্টেম এবং এন্টারপ্রাইজ মাইক্রোসার্ভিস আর্কিটেকচারের জন্য প্রস্তুত করবে।

**📚 কোর্স নেভিগেশন:**
- ← পূর্ববর্তী: [Simple Flask API](../../../../../examples/container-app/simple-flask-api)
- → পরবর্তী: [Database Integration Example](../../../../../examples/database-app)
- 🏠 [Course Home](../../../README.md)
- 📖 [Container Apps Best Practices](../../../docs/chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
অস্বীকৃতি:
এই নথিটি AI অনুবাদ সেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা যথাসাধ্য সঠিকতা নিশ্চিত করার চেষ্টা করি, তবে অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ভুল বা অসঙ্গতি থাকতে পারে। স্থানীয় ভাষায় থাকা মূল নথিটিকে কর্তৃপক্ষসম্মত উৎস হিসেবে গণ্য করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ পরামর্শযোগ্য। এই অনুবাদ ব্যবহারের ফলে উদ্ভূত কোনো ভুল বোঝাবুঝি বা মিসইন্টারপ্রেটেশনের জন্য আমরা দায়ী নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->