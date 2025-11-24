<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9e7f581a238c1bf7f9f31a2ba118a90c",
  "translation_date": "2025-11-23T23:18:49+00:00",
  "source_file": "examples/container-app/simple-flask-api/README.md",
  "language_code": "my"
}
-->
# Simple Flask API - Container App အထိမ်းအမှတ်

**သင်ကြားမှုလမ်းကြောင်း:** အခြေခံ ⭐ | **အချိန်:** ၂၅-၃၅ မိနစ် | **ကုန်ကျစရိတ်:** $0-15/လ

Python Flask REST API တစ်ခုကို Azure Container Apps တွင် Azure Developer CLI (azd) အသုံးပြု၍ တင်သွင်းထားသော အပြည့်အစုံ၊ အလုပ်လုပ်နေသော နမူနာ။ ဤနမူနာသည် container တင်သွင်းခြင်း၊ auto-scaling နှင့် monitoring အခြေခံများကို ပြသသည်။

## 🎯 သင်လေ့လာနိုင်မည့်အရာများ

- Python application တစ်ခုကို Azure တွင် container အဖြစ်တင်သွင်းခြင်း
- scale-to-zero ဖြင့် auto-scaling ကို ပြုလုပ်ခြင်း
- health probes နှင့် readiness checks ကို အကောင်အထည်ဖော်ခြင်း
- application logs နှင့် metrics များကို စောင့်ကြည့်ခြင်း
- Azure Developer CLI ကို အသုံးပြု၍ အမြန်တင်သွင်းခြင်း

## 📦 ပါဝင်သောအရာများ

✅ **Flask Application** - CRUD operations ပါဝင်သော REST API အပြည့်အစုံ (`src/app.py`)  
✅ **Dockerfile** - ထုတ်လုပ်မှုအဆင့် container configuration  
✅ **Bicep Infrastructure** - Container Apps ပတ်ဝန်းကျင်နှင့် API တင်သွင်းမှု  
✅ **AZD Configuration** - တစ်ချက်တည်းဖြင့် တင်သွင်းမှုအဆင်သင့်  
✅ **Health Probes** - Liveness နှင့် readiness checks  
✅ **Auto-scaling** - HTTP load အပေါ်မူတည်၍ 0-10 replicas  

## Architecture

```
┌─────────────────────────────────────────┐
│   Azure Container Apps Environment      │
│                                         │
│  ┌───────────────────────────────────┐ │
│  │   Flask API Container             │ │
│  │   - Health endpoints              │ │
│  │   - REST API                      │ │
│  │   - Auto-scaling (0-10 replicas)  │ │
│  └───────────────────────────────────┘ │
│                                         │
│  Application Insights ────────────────┐ │
└────────────────────────────────────────┘
```

## လိုအပ်ချက်များ

### လိုအပ်သောအရာများ
- **Azure Developer CLI (azd)** - [တပ်ဆင်ရန်လမ်းညွှန်](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure subscription** - [အခမဲ့အကောင့်](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Docker တပ်ဆင်ရန်](https://www.docker.com/products/docker-desktop/) (ဒေသတွင်းစမ်းသပ်ရန်)

### လိုအပ်ချက်များစစ်ဆေးရန်

```bash
# azd ဗားရှင်းကိုစစ်ဆေးပါ (1.5.0 သို့မဟုတ်အထက်လိုအပ်သည်)
azd version

# Azure login ကိုအတည်ပြုပါ
azd auth login

# Docker ကိုစစ်ဆေးပါ (ရွေးချယ်နိုင်သည်၊ ဒေသတွင်းစမ်းသပ်ရန်အတွက်)
docker --version
```

## ⏱️ တင်သွင်းမှုအချိန်ဇယား

| အဆင့် | ကြာချိန် | ဖြစ်ပျက်မှု |
|-------|----------|--------------||
| ပတ်ဝန်းကျင်တည်ဆောက်မှု | ၃၀ စက္ကန့် | azd ပတ်ဝန်းကျင်ဖန်တီးခြင်း |
| container တည်ဆောက်မှု | ၂-၃ မိနစ် | Docker ဖြင့် Flask app တည်ဆောက်ခြင်း |
| အခြေခံအဆောက်အအုံ | ၃-၅ မိနစ် | Container Apps, registry, monitoring ဖန်တီးခြင်း |
| application တင်သွင်းမှု | ၂-၃ မိနစ် | image ကို push လုပ်ပြီး Container Apps တွင် တင်သွင်းခြင်း |
| **စုစုပေါင်း** | **၈-၁၂ မိနစ်** | တင်သွင်းမှုအဆင်သင့် |

## အမြန်စတင်ရန်

```bash
# ဥပမာကိုသွားပါ
cd examples/container-app/simple-flask-api

# ပတ်ဝန်းကျင်ကိုစတင်ပါ (ထူးခြားတဲ့နာမည်ရွေးပါ)
azd env new myflaskapi

# အားလုံးကိုဖြန့်ဝေပါ (အခြေခံအဆောက်အအုံ + အပလီကေးရှင်း)
azd up
# သင်ကိုမေးမြန်းပါလိမ့်မယ်-
# 1. Azure subscription ကိုရွေးပါ
# 2. တည်နေရာရွေးပါ (ဥပမာ- eastus2)
# 3. ဖြန့်ဝေမှုအတွက် 8-12 မိနစ်စောင့်ပါ

# သင့် API endpoint ကိုရယူပါ
azd env get-values

# API ကိုစမ်းသပ်ပါ
curl $(azd env get-value API_ENDPOINT)/health
```

**မျှော်မှန်းရလဒ်:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ တင်သွင်းမှုစစ်ဆေးရန်

### အဆင့် ၁: တင်သွင်းမှုအခြေအနေစစ်ဆေးရန်

```bash
# တင်ထားသော ဝန်ဆောင်မှုများကို ကြည့်ရှုပါ
azd show

# မျှော်မှန်းထားသော output တွင် ပြသထားသည်။
# - ဝန်ဆောင်မှု: api
# - Endpoint: https://ca-api-[env].xxx.azurecontainerapps.io
# - အခြေအနေ: လည်ပတ်နေသည်
```

### အဆင့် ၂: API Endpoints စမ်းသပ်ရန်

```bash
# API endpoint ကိုရယူပါ
API_URL=$(azd env get-value API_ENDPOINT)

# ကျန်းမာရေးကိုစမ်းသပ်ပါ
curl $API_URL/health

# root endpoint ကိုစမ်းသပ်ပါ
curl $API_URL/

# item တစ်ခုဖန်တီးပါ
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# item အားလုံးကိုရယူပါ
curl $API_URL/api/items
```

**အောင်မြင်မှုစံနှုန်းများ:**
- ✅ Health endpoint သည် HTTP 200 ကို ပြန်ပေးသည်
- ✅ Root endpoint သည် API အချက်အလက်ကို ပြသသည်
- ✅ POST သည် item တစ်ခုဖန်တီးပြီး HTTP 201 ကို ပြန်ပေးသည်
- ✅ GET သည် ဖန်တီးထားသော items များကို ပြန်ပေးသည်

### အဆင့် ၃: Logs ကြည့်ရန်

```bash
# တိုက်ရိုက် log များကို stream လုပ်ပါ
azd logs api --follow

# သင်တွေ့မြင်ရမည်မှာ:
# - Gunicorn စတင်မှု မက်ဆေ့များ
# - HTTP တောင်းဆိုမှု log များ
# - အက်ပလီကေးရှင်း အချက်အလက် log များ
```

## Project ဖွဲ့စည်းမှု

```
simple-flask-api/
├── azure.yaml              # AZD configuration
├── infra/
│   ├── main.bicep         # Main infrastructure
│   ├── main.parameters.json
│   └── app/
│       ├── container-env.bicep
│       └── api.bicep
└── src/
    ├── app.py             # Flask application
    ├── requirements.txt
    └── Dockerfile
```

## API Endpoints

| Endpoint | Method | ဖော်ပြချက် |
|----------|--------|-------------|
| `/health` | GET | Health check |
| `/api/items` | GET | List all items |
| `/api/items` | POST | Create new item |
| `/api/items/{id}` | GET | Get specific item |
| `/api/items/{id}` | PUT | Update item |
| `/api/items/{id}` | DELETE | Delete item |

## Configuration

### Environment Variables

```bash
# အထူးဖန်တီးထားသော configuration ကို သတ်မှတ်ပါ
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Scaling Configuration

API သည် HTTP traffic အပေါ်မူတည်၍ အလိုအလျောက် scale လုပ်သည်:
- **Min Replicas**: 0 (idle ဖြစ်သောအခါ scale-to-zero)
- **Max Replicas**: 10
- **Concurrent Requests per Replica**: 50

## Development

### ဒေသတွင်းတွင် Run လုပ်ရန်

```bash
# အခြေခံလိုအပ်ချက်များကို ထည့်သွင်းပါ
cd src
pip install -r requirements.txt

# အက်ပ်ကို အလုပ်လုပ်စေပါ
python app.py

# ဒေသတွင်းတွင် စမ်းသပ်ပါ
curl http://localhost:8000/health
```

### Container တည်ဆောက်ခြင်းနှင့် စမ်းသပ်ခြင်း

```bash
# Docker ပုံစံကို တည်ဆောက်ပါ
docker build -t flask-api:local ./src

# ကွန်တိန်နာကို ဒေသတွင်းတွင် အလုပ်လုပ်ပါ
docker run -p 8000:8000 flask-api:local

# ကွန်တိန်နာကို စမ်းသပ်ပါ
curl http://localhost:8000/health
```

## Deployment

### အပြည့်အစုံတင်သွင်းမှု

```bash
# အခြေခံအဆောက်အအုံနှင့် အက်ပလီကေးရှင်းကို တင်သွင်းပါ
azd up
```

### Code-Only တင်သွင်းမှု

```bash
# အက်ပ်လ်ကိုဒ်ကိုသာဖြန့်ဝေပါ (အခြေခံအဆောက်အအုံမပြောင်းလဲပါ)
azd deploy api
```

### Configuration ပြင်ဆင်မှု

```bash
# ပတ်ဝန်းကျင်အပြောင်းအလဲများကို အပ်ဒိတ်လုပ်ပါ
azd env set API_KEY "new-api-key"

# configuration အသစ်ဖြင့် ပြန်လည်တင်သွင်းပါ
azd deploy api
```

## Monitoring

### Logs ကြည့်ရန်

```bash
# တိုက်ရိုက် log များကို စီးဆင်းကြည့်ရှုပါ
azd logs api --follow

# နောက်ဆုံး ၁၀၀ လိုင်းကို ကြည့်ရှုပါ
azd logs api --tail 100
```

### Metrics စောင့်ကြည့်ရန်

```bash
# Azure Monitor ဒက်ရှ်ဘုတ်ကိုဖွင့်ပါ
azd monitor --overview

# အထူးသတ်မှတ် metrics များကိုကြည့်ရှုပါ
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## Testing

### Health Check

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

မျှော်မှန်းရလဒ်:
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### Item ဖန်တီးခြင်း

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### All Items ရယူခြင်း

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## ကုန်ကျစရိတ်သက်သာစေရန်

ဤတင်သွင်းမှုသည် scale-to-zero ကို အသုံးပြုသောကြောင့် API သည် request များကို 처리နေစဉ်တွင်သာ ကုန်ကျစရိတ်ရှိသည်:

- **Idle cost**: ~$0/လ (scale-to-zero)
- **Active cost**: ~$0.000024/စက္ကန့် တစ် replica လျှင်
- **မျှော်မှန်းလစဉ်ကုန်ကျစရိတ်** (အသုံးပြုမှုနည်း): $5-15

### ကုန်ကျစရိတ် ပိုမိုလျှော့ချရန်

```bash
# အဆင့်ချမှတ်ရန် dev အတွက် max replicas ကို လျှော့ချပါ
azd env set MAX_REPLICAS 3

# အချိန်ကုန်သက်သာမှုကို ပိုမိုတိုတောင်းစေပါ
azd env set SCALE_TO_ZERO_TIMEOUT 300  # ၅ မိနစ်
```

## ပြဿနာဖြေရှင်းခြင်း

### Container မစတင်နိုင်ပါ

```bash
# ကွန်တိန်နာ လော့ဂ်များကို စစ်ဆေးပါ။
azd logs api --tail 100

# ဒေါက်ကာ အိုင်မေ့ဂျ်ကို ဒေသတွင်းတွင် တည်ဆောက်မှုကို အတည်ပြုပါ။
docker build -t test ./src
```

### API မရနိုင်ပါ

```bash
# ingress သည် အပြင်ဘက်ဖြစ်ကြောင်း အတည်ပြုပါ
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### တုံ့ပြန်မှုအချိန်များမြင့်မားသည်

```bash
# CPU/မှတ်ဉာဏ်အသုံးပြုမှုကိုစစ်ဆေးပါ
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# လိုအပ်ပါကအရင်းအမြစ်များကိုတိုးချဲ့ပါ
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## ရှင်းလင်းမှု

```bash
# အရင်းအမြစ်အားလုံးကို ဖျက်ပါ
azd down --force --purge
```

## နောက်တစ်ဆင့်

### ဤနမူနာကို တိုးချဲ့ရန်

1. **Database ထည့်သွင်းရန်** - Azure Cosmos DB သို့မဟုတ် SQL Database ကို ပေါင်းစပ်ပါ
   ```bash
   # infra/main.bicep တွင် Cosmos DB module ထည့်ပါ
   # database connection ဖြင့် app.py ကို အပ်ဒိတ်လုပ်ပါ
   ```

2. **Authentication ထည့်သွင်းရန်** - Azure AD သို့မဟုတ် API keys ကို အသုံးပြုပါ
   ```python
   # app.py တွင် authentication middleware ကို ထည့်ပါ
   from functools import wraps
   ```

3. **CI/CD စနစ်တည်ဆောက်ရန်** - GitHub Actions workflow
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Managed Identity ထည့်သွင်းရန်** - Azure ဝန်ဆောင်မှုများသို့ လုံခြုံစွာ ဝင်ရောက်ရန်
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### ဆက်စပ်နမူနာများ

- **[Database App](../../../../../examples/database-app)** - SQL Database ပါဝင်သော နမူနာ
- **[Microservices](../../../../../examples/container-app/microservices)** - Multi-service architecture
- **[Container Apps Master Guide](../README.md)** - Container patterns အားလုံး

### သင်ကြားမှုအရင်းအမြစ်များ

- 📚 [AZD For Beginners Course](../../../README.md) - အဓိကသင်တန်း
- 📚 [Container Apps Patterns](../README.md) - Deployment patterns များ
- 📚 [AZD Templates Gallery](https://azure.github.io/awesome-azd/) - အသိုင်းအဝိုင်း templates

## အပိုအရင်းအမြစ်များ

### Documentation
- **[Flask Documentation](https://flask.palletsprojects.com/)** - Flask framework လမ်းညွှန်
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Azure အတည်ပြုစာရွက်များ
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd command ရည်ညွှန်းချက်

### Tutorials
- **[Container Apps Quickstart](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - သင့်ပထမဆုံး app ကို တင်သွင်းပါ
- **[Python on Azure](https://learn.microsoft.com/azure/developer/python/)** - Python ဖွံ့ဖြိုးမှုလမ်းညွှန်
- **[Bicep Language](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infrastructure as code

### Tools
- **[Azure Portal](https://portal.azure.com)** - အရင်းအမြစ်များကို မြင်ရအောင် စီမံပါ
- **[VS Code Azure Extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - IDE ပေါင်းစပ်မှု

---

**🎉 ဂုဏ်ယူပါတယ်!** သင်သည် auto-scaling နှင့် monitoring ပါဝင်သော production-ready Flask API ကို Azure Container Apps တွင် တင်သွင်းပြီးဖြစ်ပါသည်။

**မေးခွန်းများရှိပါသလား?** [Issue တစ်ခုဖွင့်ပါ](https://github.com/microsoft/AZD-for-beginners/issues) သို့မဟုတ် [FAQ](../../../resources/faq.md) ကို ကြည့်ပါ

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးစားနေသော်လည်း အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မမှန်ကန်မှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာတရားရှိသော အရင်းအမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ဘာသာပြန်ပညာရှင်များကို အသုံးပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်မှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအမှားများ သို့မဟုတ် အနားယူမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->