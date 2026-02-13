# မိုက်ခရိုဆာဗစ် ပုံစံ - Container App ဥပမာ

⏱️ **ခန့်မှန်းချိန်**: 25-35 မိနစ် | 💰 **ခန့်မှန်းကုန်ကျမှု**: ~$50-100/လ | ⭐ **ခက်ခဲမှု**: Advanced

AZD CLI ကို အသုံးပြု၍ Azure Container Apps သို့ တပ်ဆင်ထားသော **ရိုးရှင်းသော်လည်း လုပ်ဆောင်နိုင်သော** မိုက်ခရိုဆာဗစ် အင်ဂျင်နီယာစနစ်။ ဤဥပမာသည် ဝန်ဆောင်မှုမှ ဝန်ဆောင်မှု ဆက်သွယ်မှု၊ ကွန်တိန်နာ ကြပ်မတ်မှုနှင့် မော်နီတာလုပ်ငန်းများကို 2-ဝန်ဆောင်မှု အခြေခံ ပုံစံဖြင့် တက်တူးပြသသည်။

> **📚 သင်ယူရန် နည်းလမ်း**: ဤဥပမာသည် အနည်းဆုံး 2-ဝန်ဆောင်မှု ဖွဲ့စည်းပုံ (API Gateway + Backend Service) ဖြင့် စတင်ပြီး သင်တတ်ပြီး တပ်ဆင်လေ့လာနိုင်သည်။ အခြေခံကို ကျွမ်းကျင်ပြီးနောက်၊ အပြည့်အစုံ မိုက်ခရိုဆာဗစ် စနစ်သို့ တိုးချဲ့ရန် လမ်းညွှန်ချက်များကို ပေးပါမည်။

## သင်ဘာတွေ သင်ယူမလဲ

ဤဥပမာကို ပြီးမြောက်စွာလုပ်ဆောင်ခြင်းအားဖြင့် သင်သည် -
- Azure Container Apps သို့ ကွန်တိန်နာများ အများပြား တပ်ဆင်နိုင်မည်
- အတွင်းကွန်ရက်ဖြင့် ဝန်ဆောင်မှုမှ ဝန်ဆောင်မှု ဆက်သွယ်မှု အကောင်အထည်ဖော်နိုင်မည်
- ပတ်ဝန်းကျင်အလိုက် စကေးလုပ်ငန်းနှင့် ကျန်းမာရေး စစ်ဆေးမှုများ ဖော်ပြနိုင်မည်
- Application Insights ဖြင့် ဖြန့်ပြားထားသည့် အက်ပ်များကို မော်နီတာ ပြုစုပေးနိုင်မည်
- မိုက်ခရိုဆာဗစ် တပ်ဆင်မှု ပုံစံများနှင့် အကောင်းဆုံး လုပ်နည်းများကို နားလည်မည်
- ရိုးရှင်းမှ ဖက်ရှင်နက် သို့ တိုးချဲ့သင်ယူနည်းများကို လေ့လာမည်

## ဖွဲ့စည်းပုံ

### အဆင့် 1: ကျွန်တော်တို့ တည်ဆောက်နေသည် (ဤဥပမာတွင် ပါဝင်သည်)

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

**ဘာကြောင့် ရိုးရှင်းစွာ စတင်ရသလဲ?**
- ✅ မြန်ဆန်စွာ တပ်ဆင်ပြီး နားလည်နိုင်မည် (25-35 မိနစ်)
- ✅ ရှုပ်ထွေးမှုမရှိပဲ မိုက်ခရိုဆာဗစ် အခြေခံ ပုံစံများကို သင်ယူနိုင်မည်
- ✅ ပြင်ဆင်ပြီး လေ့လာနိုင်သော အလုပ်လုပ်သော ကုဒ်
- ✅ သင်ယူရန် ကုန်ကျစရိတ် နည်း (ခန့်မှန်း ~$50-100/လ vs $300-1400/လ)
- ✅ ဒေတာဘေ့စ်များနှင့် မက်ဆေ့ခ််ကွန်ယက်များ ထည့်မည်မဆို ယုံကြည်မှု တည်ဆောက်နိုင်ရန်

**နှိုင်းယှဉ်ချက်**: ဤကဲ့သို့ ယာဉ်မောင်းသင်ကြားမှုလိုပါသည်။ မူလတွင် ရပ်နားထားသော ကားတင်ဧက (2 ဝန်ဆောင်မှု) ဖြင့် စတင်ပြီး အခြေခံအချက်များကို ကျွမ်းကျင်ပါ၊ ထို့နောက် မြို့လမ်းများ (5+ ဝန်ဆောင်မှုများနှင့် ဒေတာဘေ့စ်များ) သို့ တိုးတက်ပါလိမ့်မည်။

### အဆင့် 2: အနာဂတ် တိုးချဲ့ခြင်း (အညွှန်း ပုံစံ)

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

နောက်ဆုံးတွင် "Expansion Guide" အပိုင်းတွင် အဆင့်ဆင့် ကိုပြသထားသော လမ်းညွှန်ချက်များကို ကြည့်ပါ။

## ပါဝင်သော လက္ခဏာများ

✅ **Service Discovery**: ကွန်တိန်နာများအကြား အလိုအလျော့ DNS အခြေခံ ရှာဖွေရေး  ဖြစ်စေသည်။  
✅ **Load Balancing**: မျိုးစုံသော ကူးစားမှုအလုံးအရ အလိုအလျော့ Load Balancing ရှိသည်။  
✅ **Auto-scaling**: HTTP မေးခွန်းများအပေါ် အခြေခံ၍ ဝန်ဆောင်မှု တစ်ခုချင်းစီ သီးသန့် အလိုအလျော့ စကေးလုပ်သည်။  
✅ **Health Monitoring**: နှစ်ဖက်လုံး အတွက် liveness နှင့် readiness probes များ။  
✅ **Distributed Logging**: Application Insights ဖြင့် အစုစည်း မှတ်တမ်းစုစည်းမှု။  
✅ **Internal Networking**: လုံခြုံသော ဝန်ဆောင်မှုမှ ဝန်ဆောင်မှု ဆက်သွယ်မှု။  
✅ **Container Orchestration**: အလိုအလျော့ တပ်ဆင်ခြင်းနှင့် စကေးလုပ်ခြင်း။  
✅ **Zero-Downtime Updates**: revision များကို စီမံခြင်းဖြင့် Rolling updates များ။

## မလိုအပ်မီ

### လိုအပ်သော ကိရိယာများ

စတင်မီအောက်ပါ ကိရိယာများ 설치 ရှိကြောင်း အတည်ပြုပါ။

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (version 1.0.0 or higher)  
   ```bash
   azd version
   # မျှော်မှန်းထားသော ထွက်: azd ဗားရှင်း 1.0.0 သို့မဟုတ် ထို့ထက်မြင့်
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (version 2.50.0 or higher)  
   ```bash
   az --version
   # မျှော်လင့်ရသော ထွက်ရလဒ်: azure-cli 2.50.0 သို့မဟုတ် အထက်
   ```

3. **[Docker](https://www.docker.com/get-started)** (အခြေပြု ဖွံ့ဖြိုးမှု/စမ်းသပ်မှု အတွက် - ရွေးချယ်စရာ)  
   ```bash
   docker --version
   # မျှော်မှန်းထားသော အထွက်: Docker ဗားရှင်း 20.10 သို့မဟုတ် အထက်
   ```

### Azure လိုအပ်ချက်များ

- အသုံးပြုနိုင်သော **Azure subscription** ([create a free account](https://azure.microsoft.com/free/))
- သင့် subscription တွင် အရင်းအမြစ်များ ဖန်တီးနိုင်သော ခွင့်ပြုချက်များ
- Subscription သို့ resource group ပေါ်တွင် **Contributor** အခွင့်အရေး

### အတတ်ပညာလိုအပ်ချက်များ

ဤဥပမာသည် **အဆင့်မြင့်** ဖြစ်သည်။ သင့်တွင် -
- [Simple Flask API example](../../../../../examples/container-app/simple-flask-api) ကို လုပ်ဆောင်ပြီးဖြစ်ရမည်  
- မိုက်ခရိုဆာဗစ် ဖွဲ့စည်းပုံ အခြေခံ နားလည်မှုရှိရမည်  
- REST API များနှင့် HTTP အကြောင်း အခြေခံ အသိပညာရှိရမည်  
- ကွန်တိန်နာ အခြေအနေများကို နားလည်ထားရမည်

**Container Apps အတွက် အသစ်လား?** အခြေခံများကို သင်ယူရန် အရင်ဆုံး [Simple Flask API example](../../../../../examples/container-app/simple-flask-api) ကို စတင်ပါ။

## အမြန် စတင်ခြင်း (အဆင့်လိုက်)

### အဆင့် 1: Clone လုပ်၍ သွားပါ

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ အောင်မြင်မှု စစ်ဆေးမှု**: `azure.yaml` ကို မြင်လား စစ်ဆေးပါ:
```bash
ls
# မျှော်မှန်းထားသည်: README.md, azure.yaml, infra/, src/
```

### အဆင့် 2: Azure ဖြင့် အတည်ပြု၀င်မည်

```bash
azd auth login
```

ဤသည်က သင့် browser ကို ဖွင့်၍ Azure အတည်ပြုခြင်းကို ဖိတ်ခေါ်ပါလိမ့်မည်။ သင့် Azure အချက်အလက်ဖြင့် サိုင်းအင်၀င်ပါ။

**✓ အောင်မြင်မှု စစ်ဆေးမှု**: သင်သည် ဖြစ်ရမည်:
```
Logged in to Azure.
```

### အဆင့် 3: ပတ်ဝန်းကျင် အစ သတ်မှတ်ခြင်း

```bash
azd init
```

**မေးခွန်းများ အဖြေများ**:
- **Environment name**: အတိုချုပ် နာမည်ကို ထည့်ပါ (ဥပမာ `microservices-dev`)
- **Azure subscription**: သင့် subscription ကို ရွေးပါ
- **Azure location**: တစ်ဧရိယာကို ရွေးပါ (ဥပမာ `eastus`, `westeurope`)

**✓ အောင်မြင်မှု စစ်ဆေးမှု**: သင်သည် မြင်ရမည်:
```
SUCCESS: New project initialized!
```

### အဆင့် 4: အခြေခံအဆောက်အအုံနှင့် ဝန်ဆောင်မှုများ တပ်ဆင်ခြင်း

```bash
azd up
```

**ဘာများ ဖြစ်ပေါ်မလဲ** (8-12 မိနစ် ကြာပါသည်):
1. Container Apps ပတ်ဝန်းကျင် ဖန်တီးသည်
2. မော်နီတာလုပ်ဆောင်မှုအတွက် Application Insights ဖန်တီးသည်
3. API Gateway ကွန်တိန်နာ (Node.js) ကို တည်ဆောက်သည်
4. Product Service ကွန်တိန်နာ (Python) ကို တည်ဆောက်သည်
5. နှစ်ဖက် ကွန်တိန်နာများကို Azure သို့ တပ်ဆင်သည်
6. ကွန်ရက်နှင့် ကျန်းမာရေး စစ်ဆေးမှုများကို ဖော်စပ်သည်
7. မော်နီတာနှင့် မှတ်တမ်းစုစည်းမှုကို သတ်မှတ်သည်

**✓ အောင်မြင်မှု စစ်ဆေးမှု**: သင်သည် မြင်ရမည်:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ เวลา**: 8-12 မိနစ်

### အဆင့် 5: တပ်ဆင်မှု စမ်းသပ်ပါ

```bash
# ဂိတ်ဝေး အဆုံးနေရာကို ရယူပါ
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# API Gateway ၏ ကျန်းမာရေးကို စမ်းသပ်ပါ
curl $GATEWAY_URL/health

# မျှော်လင့်ထားသော ရလဒ်:
# {"အခြေအနေ":"ကျန်းမာ","ဝန်ဆောင်မှု":"API ဂိတ်ဝေး","အချိန်တံဆိပ်":"2025-11-19T10:30:00Z"}
```

**Gateway မှတဆင့် product service ကို စမ်းသပ်ပါ**:
```bash
# ထုတ်ကုန်များစာရင်း
curl $GATEWAY_URL/api/products

# မျှော်မှန်းထားသော ရလဒ်:
# [
#   {"id":1,"name":"Laptop","price":999.99,"stock":50},
#   {"id":2,"name":"Mouse","price":29.99,"stock":200},
#   {"id":3,"name":"Keyboard","price":79.99,"stock":150}
# ]
```

**✓ အောင်မြင်မှု စစ်ဆေးမှု**: နှစ်ခုလုံး endpoints များသည် အမှားမရှိဘဲ JSON ဒေတာ ပြန်လည်ပေးရမည်။

---

**🎉 ဂုဏ်ပင်!** သင်သည် Azure သို့ မိုက်ခရိုဆာဗစ် ဖွဲ့စည်းပုံ တပ်ဆင်နိုင်ခဲ့ပါပြီ!

## project ဖွဲ့စည်းပုံ

ဆောင်ရွက်ရန် ဖိုင်များအားလုံး ပါဝင်သည်—ဤသည်မှာ ပြီးမြောက်ပြီး အလုပ်လုပ်နိုင်သော ဥပမာတစ်ခုဖြစ်သည်။

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

**ဧကရာဇ်တိုင်း၏ တာဝန်များ**:

**Infrastructure (infra/)**:
- `main.bicep`: Azure အရင်းအမြစ်များနှင့် သူတို့၏ အချိတ်ဆက်စီမံချက်ကို ညွှန်ကြားသည်
- `core/container-apps-environment.bicep`: Container Apps ပတ်ဝန်းကျင်နှင့် Azure Container Registry ကို ဖန်တီးသည်
- `core/monitor.bicep`: ဖြန့်ဖြူး မှတ်တမ်းစုစည်းမှုအတွက် Application Insights ကို သတ်မှတ်သည်
- `app/*.bicep`: စကေးလုပ်ဆောင်မှုနှင့် ကျန်းမာရေးစစ်ဆေးမှုများပါသော တစ်ခုချင်းသော container app ကြေညာချက်များ

**API Gateway (src/api-gateway/)**:
- ပြင်ပကို ကြည့်ရှုသူ ဝန်ဆောင်မှုဖြစ်ပြီး နောက်ခံ ဝန်ဆောင်မှုများသို့ လမ်းကြောင်းစီမံပေးသည်
- မှတ်တမ်းစုစည်းမှု၊ အမှားကိုင်တွယ်မှုနှင့် တောင်းဆိုချက် ပို့ပေးမှုကို အကောင်အထည်ဖော်သည်
- ဝန်ဆောင်မှုမှ ဝန်ဆောင်မှု HTTP ဆက်သွယ်မှုကို ပြသသည်

**Product Service (src/product-service/)**:
- ပစ္စည်းစာရင်းကို ကိုင်တွယ်သော အတွင်းဝန်ဆောင်မှု (သက်သာစေရန် in-memory)
- REST API နှင့် ကျန်းမာရေး စစ်ဆေးမှုများ
- နောက်ခံ မိုက်ခရိုဆာဗစ် ပုံစံ အတွက် ဥပမာ

## ဝန်ဆောင်မှုများ အနှစ်ချုပ်

### API Gateway (Node.js/Express)

**Port**: 8080  
**Access**: ပြင်ပ (external ingress)  
**ရည်ရွယ်ချက်**: ရောက်ရှိလာသော တောင်းဆိုမှုများကို သင့်တော်သလို နောက်ခံ ဝန်ဆောင်မှုများသို့ လမ်းကြောင်းပေးသည်။

**Endpoints**:
- `GET /` - ဝန်ဆောင်မှု အချက်အလက်
- `GET /health` - ကျန်းမာရေး စစ်ဆေးမှု endpoint
- `GET /api/products` - product service သို့ ရှေ့ပို့ (စာရင်း)
- `GET /api/products/:id` - product service သို့ ရှေ့ပို့ (ID အလိုက် ရယူ)

**အဓိက လက္ခဏာများ**:
- axios ဖြင့် တောင်းဆိုမှု လမ်းကြောင်းသတ်မှတ်ခြင်း
- အစုစည်း မှတ်တမ်းစုစည်းမှု
- အမှားကိုင်တွယ်မှုနှင့် timeout စီမံခန့်ခွဲမှု
- ပတ်ဝန်းကျင် အပြောင်းအလဲများမှ ဝန်ဆောင်မှု ရှာဖွေမှု
- Application Insights အတွင်း ထည့်သွင်းထားခြင်း

**Code Highlight** (`src/api-gateway/app.js`):
```javascript
// အတွင်းပိုင်း ဝန်ဆောင်မှု ဆက်သွယ်မှု
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Product Service (Python/Flask)

**Port**: 8000  
**Access**: အတွင်းမှသာ (ပြင်ပ ingress မရှိ)  
**ရည်ရွယ်ချက်**: in-memory ဒေတာဖြင့် ပစ္စည်း စာရင်း ကိုင်တွယ်ပေးသည်။

**Endpoints**:
- `GET /` - ဝန်ဆောင်မှု အချက်အလက်
- `GET /health` - ကျန်းမာရေး စစ်ဆေးမှု endpoint
- `GET /products` - ပစ္စည်းများအားလုံးစာရင်း
- `GET /products/<id>` - ID အလိုက် ပစ္စည်း ရယူရန်

**အဓိက လက္ခဏာများ**:
- Flask နှင့် RESTful API
- in-memory ပစ္စည်း အချက်အလက် စတိုး (ရိုးရှင်းသည်၊ database မလိုအပ်)
- probes များဖြင့် ကျန်းမာရေး မော်နီတာ
- ဖွဲ့စည်းထားသော မှတ်တမ်းစုစည်းမှု
- Application Insights ထည့်သွင်းခြင်း

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

**ဘာကြောင့် အတွင်းမှသာလဲ?**
Product service ကို ပြင်ပထံ ထွက်ပေးထားခြင်း မရှိပါ။ မည်သည့် တောင်းဆိုမှုမျှ API Gateway မှတဆင့် ဖြစ်ရမည်၊ ၎င်းက ဖော်ပြပေးသည်မှာ -
- လုံခြုံရေး: ထိန်းချုပ်ထားသော ဝင်ရောက်ရေးချက်
- ပြောင်းလဲနိုင်ခြင်း: မူလ client များအား ထိခိုက်စေခြင်းမရှိဘဲ နောက်ခံကို ပြောင်းလဲနိုင်ခြင်း
- မော်နီတာ: တောင်းဆိုမှု များကို အစုစည်းစီမံ မှတ်တမ်းထားခြင်း

## ဝန်ဆောင်မှု ဆက်သွယ်မှု ကို နားလည်ခြင်း

### ဝန်ဆောင်မှုများ ဘယ်လို ဆက်သွယ်ကြသလဲ

ဤဥပမာတွင် API Gateway သည် Product Service နှင့် **အတွင်း HTTP ချိတ်ဆက်မှုများ** ဖြင့် ဆက်သွယ်သည်။

```javascript
// API ဂိတ်ဝေး (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// အတွင်းပိုင်း HTTP တောင်းဆိုချက် တစ်ခု ပြုလုပ်ပါ
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**အဓိက အချက်များ**:

1. **DNS အခြေခံ ရှာဖွေမှု**: Container Apps သည် အတွင်း ဝန်ဆောင်မှုများအတွက် အလိုအလျော့ DNS ပံ့ပိုးပေးသည်
   - Product Service FQDN: `product-service.internal.<environment>.azurecontainerapps.io`
   - ရိုးရှင်းစွာ: `http://product-service` (Container Apps က ယင်းကို ဖြေရှင်းပေးသည်)

2. **ပြင်ပ ထုတ်ဖေါ်မှု မရှိခြင်း**: Product Service တွင် Bicep ထဲတွင် `external: false` ဖြစ်သည်
   - Container Apps ပတ်ဝန်းကျင်အတွင်းထဲမှသာ ဝင်ရောက်နိုင်သည်
   - အင်တာနက်မှ မရောက်နိုင်ပါ

3. **ပတ်ဝန်းကျင် အပြောင်းအလဲများ**: ဝန်ဆောင်မှု URL များကို တပ်ဆင်ရာ အချိန်တွင် ထည့်ပေးသည်
   - Bicep သည် API Gateway သို့ အတွင်း FQDN ကို ပေးပို့သည်
   - အပလီကေးရှင်း ကုဒ်ထဲတွင် URL မဟုတ်သည့် hardcoded ဖိုင် မရှိပါ

**နှိုင်းယှဉ်ချက်**: ဤသည်ကို ရုံးခန်းများလို တွေးပါ။ API Gateway သည် ရုံးဝန်ထမ်း စားပွဲ (ပြင်ပအသုံးပြုသူများအတွက်) ဖြစ်ပြီး Product Service သည် အခန်းတစ်ခန်း (အတွင်းမှသာ) ဖြစ်သည်။ ဧည့်သည်များသည် ရုံးဝန်ထမ်းဖြင့်သာ အခန်းများသို့ သွားရောက်နိုင်ပါသည်။

## တပ်ဆင်မှု စိတ်ကြိုက်ရွေးချယ်စရာများ

### အပြည့်အစုံ တပ်ဆင်ခြင်း (အကြံပြု)

```bash
# အခြေခံအဆောက်အအုံနှင့် နှစ်ခုစလုံး ဝန်ဆောင်မှုများကို တပ်ဆင်ပါ
azd up
```

ဤသည်သည် တပ်ဆင်သည်:
1. Container Apps ပတ်ဝန်းကျင်
2. Application Insights
3. Container Registry
4. API Gateway ကွန်တိန်နာ
5. Product Service ကွန်တိန်နာ

**ချိန်**: 8-12 မိနစ်

### တစ်ခုချင်း ဝန်ဆောင်မှု တပ်ဆင်ခြင်း

```bash
# အစပိုင်း azd up လုပ်ပြီးနောက် ဝန်ဆောင်မှုတစ်ခုတည်းကိုသာ တပ်ဆင်ပါ
azd deploy api-gateway

# သို့မဟုတ် product ဝန်ဆောင်မှုကို တပ်ဆင်ပါ
azd deploy product-service
```

**အသုံးချမှု**: ဝန်ဆောင်မှုတစ်ခု၏ ကုဒ်ကို ပြင်ဆင်ပြီး ထပ်မံ တပ်ဆင်လိုသောအခါ သာမက ချန်ထားနိုင်သည်။

### ဖွဲ့စည်းမှု အပ်ဒိတ်

```bash
# ချဲ့ထွင်မှု ပါရာမီတာများကို ပြောင်းလဲပါ
azd env set GATEWAY_MAX_REPLICAS 30

# ဖွဲ့စည်းပုံအသစ်ဖြင့် ပြန်လည်တပ်ဆင်ပါ
azd up
```

## ဖွဲ့စည်းမှု

### စကေးဖွဲ့စည်းမှု ကို သတ်မှတ်ခြင်း

နှစ်ဖက်ဝန်ဆောင်မှုများသည် သူတို့၏ Bicep ဖိုင်များတွင် HTTP အခြေခံ အလိုအလျော့ စကေးဖြင့် သတ်မှတ်ထားသည်။

**API Gateway**:
- Min replicas: 2 (availability အတွက် အနည်းဆုံး 2)
- Max replicas: 20
- Scale trigger: replica တစ်ခုလျှင် 50 concurrent requests

**Product Service**:
- Min replicas: 1 (လိုအပ်သည်ဆိုလျှင် zero သို့ စကေးချနိုင်)
- Max replicas: 10
- Scale trigger: replica တစ်ခုလျှင် 100 concurrent requests

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

### အရင်းအမြစ် ချိန်ညှိမှု

**API Gateway**:
- CPU: 1.0 vCPU
- Memory: 2 GiB
- အကြောင်းပြချက်: ပြင်ပ traffic အားလုံး ကို ကိုင်တွယ်သည်

**Product Service**:
- CPU: 0.5 vCPU
- Memory: 1 GiB
- အကြောင်းပြချက်: in-memory လည်ပတ်မှုများသည် ပိုမို ပေါ့ပါးသည်

### ကျန်းမာရေး စစ်ဆေးမှုများ

နှစ်ဖက် ဝန်ဆောင်မှုများတွင် liveness နှင့် readiness probes များ ပါဝင်သည်:

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

**ဤသည်သည် ဘာကို ရည်ညွှန်းသလဲ**:
- **Liveness**: ကျန်းမာရေး စစ်ဆေးမှု မအောင်မြင်ပါက Container Apps သည် container ကို ထပ်မံ စမည်
- **Readiness**: ပြင်ဆင်မှုမဖြစ်ပါက Container Apps သည် ထို replica သို့ traffic မပို့မီ ရပ်ဆိုင်းမည်



## မော်နီတာနှင့် မြင်သာမှု

### ဝန်ဆောင်မှု မှတ်တမ်းများ ကြည့်ရန်

```bash
# azd monitor ကို အသုံးပြုပြီး လော့ဂ်များ ကြည့်ပါ
azd monitor --logs

# သို့မဟုတ် သီးသန့် Container Apps များအတွက် Azure CLI ကို အသုံးပြုပါ:
# API Gateway မှ လော့ဂ်များကို တိုက်ရိုက် စီးဆင်းကြည့်ပါ
az containerapp logs show --name api-gateway --resource-group $RG_NAME --follow

# မကြာသေးမီ ထုတ်ကုန် ဝန်ဆောင်မှု လော့ဂ်များကို ကြည့်ပါ
az containerapp logs show --name product-service --resource-group $RG_NAME --tail 100
```

**မျှော်လင့်ရမည့် ထွက်လာမှု**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Application Insights မေးခွန်းများ

Azure Portal တွင် Application Insights ကို ဝင်ရောက်ပြီး ထို့နောက် ဤ မေးခွန်းများကို ဆောင်ရွက်ပါ။

**နောက်ကျသော တောင်းဆိုမှုပြင်းထန်မှုများကို ရှာဖွေပါ**:
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**ဝန်ဆောင်မှုမှ ဝန်ဆောင်မှု ခေါ်ဆိုမှုများကို မှတ်တမ်းတင်ပါ**:
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

**ဝန်ဆောင်မှု အလိုက် အမှားနှုန်း**:
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

**အချိန် အလိုက် တောင်းဆိုမှု အရေအတွက်**:
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### မော်နီတာ Dashboard သို့ ဝင်ရောက်ကြည့်ရှုခြင်း

```bash
# Application Insights အသေးစိတ်အချက်အလက်များ ရယူပါ
azd env get-values | grep APPLICATIONINSIGHTS

# Azure Portal အတွင်း စောင့်ကြည့်မှုကို ဖွင့်ပါ
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### Live Metrics

1. Application Insights ကို Azure Portal တွင် သွားပါ
2. "Live Metrics" ကို နှိပ်ပါ
3. အချိန်နှင့်တပြေးညီ တောင်းဆိုမှုများ၊ မအောင်မြင်မှုများနှင့် စွမ်းဆောင်ရည်ကို ကြည့်ရှုနိုင်သည်
4. စမ်းသပ်ရန် အောက်ပါကို အသုံးပြုပါ: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## လက်တွေ့ လေ့ကျင့်ခန်းများ

[မှတ်ချက်: အပြည့်အစုံ လေ့ကျင့်ခန်းများကို "Practical Exercises" အပိုင်း၌ အဆင့်ဆင့် လမ်းညွှန်ချက်များ (deployment verification, data modification, autoscaling tests, error handling, နှင့် တတိယ ဝန်ဆောင်မှု ထည့်သွင်းခြင်း) ဖြင့် ကြည့်ပါ။]

## ကုန်ကျစရိတ် বিশ্লেষণ

### ငွေပမာဏ ခန့်မှန်း (ဤ 2-ဝန်ဆောင်မှု ဥပမာအတွက်)

| Resource | Configuration | Estimated Cost |
|----------|--------------|----------------|
| API Gateway | 2-20 replicas, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 replicas, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Basic tier | $5 |
| Application Insights | 1-2 GB/month | $5-10 |
| Log Analytics | 1 GB/month | $3 |
| **Total** | | **$58-243/month** |

**သုံးစွဲမှု အလိုက် ကုန်ကျစရိတ် ခွဲခြမ်းမှု**:
- **နည်းပမာဏ ဗဟိုဆောင်ရွက်မှု** (စမ်းသပ်ခြင်း/သင်ယူရန်): ~$60/လ
- **အလယ်အလတ် သယ်ယူပေးမှု** (သေးငယ်သော production): ~$120/လ
- **မြင့်မား သယ်ယူပေးမှု** (ပင်ပန်းသကြား အချိန်များ): ~$240/လ

### ကုန်ကျစရိတ် အကျိုးရှိဆုံး အကြံပြုချက်များ

1. **ဖွံ့ဖြိုးမှုအတွက် Scale to Zero အသုံးပြုပါ**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Cosmos DB ထည့်စဉ် Consumption Plan ကို အသုံးပြုပါ** (ထည့်သွင်းသောအခါ):
   - သင်သုံးသလိုသာ ပေးဆောင်ပါ
   - မည်သည့်အစအနည်းအကြောင်းလည်း မရှိ

3. **Application Insights Sampling ကို သတ်မှတ်ပါ**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // တောင်းဆိုမှုများ၏ 50% ကို နမူနာယူပါ
   ```

4. **အသုံးမလိုချိန် အတွင်း ဖယ်ရှားပါ**:
   ```bash
   azd down
   ```

### အခမဲ့ ထပ်တိုး ရွေးချယ်စရာများ
For learning/testing, consider:
- Use Azure free credits (first 30 days)
- Keep to minimum replicas
- Delete after testing (no ongoing charges)

---

## Cleanup

To avoid ongoing charges, delete all resources:

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
- Both Container Apps (gateway & product service)
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

Once you've mastered this 2-service architecture, here's how to expand:

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
- Azure Front Door (global load balancing)
- Azure Key Vault (secret management)
- Azure Monitor Workbooks (custom dashboards)
- CI/CD Pipeline (GitHub Actions)
- Blue-Green Deployments
- Managed Identity for all services

**Full Production Architecture Cost**: ~$300-1,400/month

---

## Learn More

### Related Documentation
- [Azure Container Apps Documentation](https://learn.microsoft.com/azure/container-apps/)
- [Microservices Architecture Guide](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights for Distributed Tracing](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Next Steps in This Course
- ← Previous: [Simple Flask API](../../../../../examples/container-app/simple-flask-api) - Beginner single-container example
- → Next: [AI Integration Guide](../../../../../examples/docs/ai-foundry) - Add AI capabilities
- 🏠 [Course Home](../../README.md)

### Comparison: When to Use What

**Single Container App** (Simple Flask API example):
- ✅ Simple applications
- ✅ Monolithic architecture
- ✅ Fast to deploy
- ❌ Limited scalability
- **Cost**: ~$15-50/month

**Microservices** (This example):
- ✅ Complex applications
- ✅ Independent scaling per service
- ✅ Team autonomy (different services, different teams)
- ❌ More complex to manage
- **Cost**: ~$60-250/month

**Kubernetes (AKS)**:
- ✅ Maximum control and flexibility
- ✅ Multi-cloud portability
- ✅ Advanced networking
- ❌ Requires Kubernetes expertise
- **Cost**: ~$150-500/month minimum

**Recommendation**: Start with Container Apps (this example), move to AKS only if you need Kubernetes-specific features.

---

## Frequently Asked Questions

**Q: Why only 2 services instead of 5+?**  
A: Educational progression. Master the fundamentals (service communication, monitoring, scaling) with a simple example before adding complexity. The patterns you learn here apply to 100-service architectures.

**Q: Can I add more services myself?**  
A: Absolutely! Follow the expansion guide above. Each new service follows the same pattern: create src folder, create Bicep file, update azure.yaml, deploy.

**Q: Is this production-ready?**  
A: It's a solid foundation. For production, add: managed identity, Key Vault, persistent databases, CI/CD pipeline, monitoring alerts, and backup strategy.

**Q: Why not use Dapr or other service mesh?**  
A: Keep it simple for learning. Once you understand native Container Apps networking, you can layer on Dapr for advanced scenarios.

**Q: How do I debug locally?**  
A: Run services locally with Docker:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**Q: Can I use different programming languages?**  
A: Yes! This example shows Node.js (gateway) + Python (product service). You can mix any languages that run in containers.

**Q: What if I don't have Azure credits?**  
A: Use Azure free tier (first 30 days with new accounts) or deploy for short testing periods and delete immediately.

---

> **🎓 Learning Path Summary**: You've learned to deploy a multi-service architecture with automatic scaling, internal networking, centralized monitoring, and production-ready patterns. This foundation prepares you for complex distributed systems and enterprise microservices architectures.

**📚 Course Navigation:**
- ← Previous: [Simple Flask API](../../../../../examples/container-app/simple-flask-api)
- → Next: [Database Integration Example](../../../../../examples/database-app)
- 🏠 [Course Home](../../../README.md)
- 📖 [Container Apps Best Practices](../../../docs/chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
အသိပေးချက်:
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ဖြင့် ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးစားပါသော်လည်း၊ အလိုအလျောက် ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် မှန်ကန်မှုမလုံလောက်မှုများ ရှိနိုင်ကြောင်း ကျေးဇူးပြု၍ သိထားပါ။ မူရင်းစာတမ်းကို မူလဘာသာစကားဖြင့်သာ တရားဝင် အရင်းအမြစ်အဖြစ် ယူဆရမည် ဖြစ်ပါသည်။ အရေးကြီးသော သတင်းအချက်အလက်များအတွက် လူသားဘာသာပြန်ကျွမ်းကျင်သူမှ ဘာသာပြန်ရန် အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းကြောင့် ဖြစ်ပေါ်လာနိုင်သည့် နားမလည်မှုများ သို့မဟုတ် မမှန်ကန်စွာ ဖော်ပြခြင်းများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->