# Simple Flask API - Container App Example

**Learning Path:** Beginner ⭐ | **Time:** 25-35 minutes | **Cost:** $0-15/month

A complete, working Python Flask REST API deployed to Azure Container Apps using Azure Developer CLI (azd). This example demonstrates container deployment, auto-scaling, and monitoring basics.

## 🎯 သင်ယူမယ့်အချက်များ

- Container ဆောင်ထားသော Python application ကို Azure သို့ deploy လုပ်နည်း
- scale-to-zero သတ်မှတ်ချက်ဖြင့် auto-scaling ကို ဖန်တီးနည်း
- health probes နှင့် readiness checks ကို ထည့်သွင်းနည်း
- application logs နှင့် metrics များကို စောင့်ကြည့်နည်း
- အလျင်အမြန် deploy အတွက် Azure Developer CLI ကို အသုံးပြုနည်း

## 📦 ပါဝင်သော အရာများ

✅ **Flask Application** - CRUD လုပ်ဆောင်ချက်များပါရှိသော အပြည့်အစုံ REST API (`src/app.py`)  
✅ **Dockerfile** - Production အသုံးအတွက် container ပြင်ဆင်ချက်  
✅ **Bicep Infrastructure** - Container Apps environment နှင့် API deployment  
✅ **AZD Configuration** - တစ်ချက်နှိပ်၍ deploy လုပ်နိုင်စေရေး setup  
✅ **Health Probes** - Liveness နှင့် readiness checks များ သတ်မှတ်ထား됨  
✅ **Auto-scaling** - HTTP traffic အပေါ် မူတည်၍ 0-10 replicas အထိ

## Architecture

```mermaid
graph TD
    subgraph ACA[Azure Container Apps ပတ်ဝန်းကျင်]
        Flask[Flask API ကွန်တိန်နာ<br/>ကျန်းမာရေး အဆုံးချိတ်များ<br/>REST API<br/>အလိုအလျောက် စကေးလ် (0-10 မိတ္တူ)]
        AppInsights[အက်ပလီကေးရှင်း အင်ဆိုက်]
    end
```

## မတိုင်ခင် conditions

### လိုအပ်ချက်များ
- **Azure Developer CLI (azd)** - [Install guide](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure subscription** - [Free account](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Install Docker](https://www.docker.com/products/docker-desktop/) (for local testing)

### လိုအပ်ချက်များ စစ်ဆေးခြင်း

```bash
# azd ဗားရှင်းကို စစ်ဆေးပါ (1.5.0 သို့မဟုတ် အထက်လိုအပ်သည်)
azd version

# Azure လော့ဂ်အင်ကို အတည်ပြုပါ
azd auth login

# Docker ကို စစ်ဆေးပါ (ရွေးချယ်နိုင်၊ ဒေသခံ စမ်းသပ်မှုများအတွက်)
docker --version
```

## ⏱️ Deployment အချိန်ဇယား

| Phase | Duration | What Happens |
|-------|----------|--------------||
| Environment setup | 30 seconds | Create azd environment |
| Build container | 2-3 minutes | Docker build Flask app |
| Provision infrastructure | 3-5 minutes | Create Container Apps, registry, monitoring |
| Deploy application | 2-3 minutes | Push image and deploy to Container Apps |
| **Total** | **8-12 minutes** | Complete deployment ready |

## Quick Start

```bash
# ဥပမာသို့ သွားပါ
cd examples/container-app/simple-flask-api

# ပတ်ဝန်းကျင်ကို စတင်ဆောက်လုပ်ပါ (ထူးခြားသော နာမည် ရွေးပါ)
azd env new myflaskapi

# အားလုံးကို တပ်ဆင်ပါ (အခြေခံအဆောက်အအုံ + အပလီကေးရှင်း)
azd up
# သင့်အား အောက်ပါအချက်များကို မေးမြန်းပါလိမ့်မည်
# 1. Azure subscription ကို ရွေးချယ်ပါ
# 2. တည်နေရာကို ရွေးချယ်ပါ (ဥပမာ၊ eastus2)
# 3. ထည့်တပ်မှုအတွက် 8-12 မိနစ် ခန့် စောင့်ပါ

# သင့် API endpoint ကို ရယူပါ
azd env get-values

# API ကို စမ်းသပ်ပါ
curl $(azd env get-value API_ENDPOINT)/health
```

**Expected Output:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ Deployment စစ်ဆေးခြင်း

### အဆင့် 1: Deployment အခြေအနေ စစ်ဆေးမည်

```bash
# တင်ထားသော ဝန်ဆောင်မှုများကို ကြည့်ရန်
azd show

# မျှော်မှန်းထားသော အထွက်မှာ အောက်ပါအတိုင်း ဖြစ်သည်:
# - ဝန်ဆောင်မှု: api
# - အင်ဒ်ပိုင့်: https://ca-api-[env].xxx.azurecontainerapps.io
# - အခြေအနေ: လည်ပတ်နေသည်
```

### အဆင့် 2: API Endpoints များ စမ်းသပ်မည်

```bash
# API အဆုံးပိုင်းကို ရယူပါ
API_URL=$(azd env get-value API_ENDPOINT)

# ကျန်းမာရေးကို စမ်းသပ်ပါ
curl $API_URL/health

# မူလ အဆုံးပိုင်းကို စမ်းသပ်ပါ
curl $API_URL/

# ပစ္စည်းတစ်ခု ဖန်တီးပါ
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# ပစ္စည်းအားလုံးကို ရယူပါ
curl $API_URL/api/items
```

**အောင်မြင်မှု စံသတ်မှတ်ချက်များ:**
- ✅ Health endpoint သည် HTTP 200 ကို ပြန်လည်ပေးရမည်
- ✅ Root endpoint တွင် API အချက်အလက်များ ပြလိမ့်မည်
- ✅ POST သည် item ကို ဖန်တီးပြီး HTTP 201 ကို ပြန်ပေးရမည်
- ✅ GET သည် ဖန်တီးထားသော items များကို ပြန်ပေးရမည်

### အဆင့် 3: Logs ကြည့်ရှူမည်

```bash
# azd monitor ကို အသုံးပြုပြီး တိုက်ရိုက် လော့ဂ်များကို စီးဆင်းကြည့်ပါ
azd monitor --logs

# သို့မဟုတ် Azure CLI ကို အသုံးပြုပါ:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# သင်သည် အောက်ပါအရာများကို မြင်ရမည်:
# - Gunicorn စတင်ချိန် မက်ဆေ့ခ်ျများ
# - HTTP တောင်းဆိုမှု လော့ဂ်များ
# - လျှောက်လွှာ အချက်အလက် လော့ဂ်များ
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

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/health` | GET | Health check |
| `/api/items` | GET | List all items |
| `/api/items` | POST | Create new item |
| `/api/items/{id}` | GET | Get specific item |
| `/api/items/{id}` | PUT | Update item |
| `/api/items/{id}` | DELETE | Delete item |

## သတ်မှတ်ချက်များ

### Environment Variables

```bash
# စိတ်ကြိုက် ဖွဲ့စည်းပုံကို သတ်မှတ်ပါ
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Scaling သတ်မှတ်ချက်များ

API သည် HTTP traffic အပေါ် မူတည်၍ အလိုအလျောက် scale လုပ်ပါသည်။
- **Min Replicas**: 0 (idle ဖြစ်သောအခါ scale to zero)
- **Max Replicas**: 10
- **Concurrent Requests per Replica**: 50

## ဖွံ့ဖြိုးရေး

### ဒေသတွင်းတွင် chạy ချရန်

```bash
# dependencies များကို ထည့်သွင်းပါ
cd src
pip install -r requirements.txt

# အက်ပ်ကို လည်ပတ်ပါ
python app.py

# ကိုယ်ပိုင်စက်ပေါ်တွင် စမ်းသပ်ပါ
curl http://localhost:8000/health
```

### Container တည်ဆောက်၍ စမ်းသပ်မည်

```bash
# Docker image ကို ဖန်တီးပါ
docker build -t flask-api:local ./src

# container ကို local ပတ်ဝန်းကျင်တွင် လည်ပတ်ပါ
docker run -p 8000:8000 flask-api:local

# container ကို စမ်းသပ်ပါ
curl http://localhost:8000/health
```

## Deployment

### အပြည့်အစုံ Deployment

```bash
# အခြေခံအဆောက်အအုံနှင့် အက်ပလီကေးရှင်းကို ဖြန့်ချိပါ
azd up
```

### ကုဒ်သာ Deploy လုပ်ခြင်း

```bash
# အပလီကေးရှင်းကုဒ်ပဲ တင်ပို့ပါ (အောက်ခံအဆောက်အအုံ မပြောင်းလဲပါ)
azd deploy api
```

### သတ်မှတ်ချက်များ အပ်ဒိတ်လုပ်ခြင်း

```bash
# ပတ်ဝန်းကျင် သတ်မှတ်ချက်များကို အပ်ဒိတ်လုပ်ပါ
azd env set API_KEY "new-api-key"

# ဖွဲ့စည်းပုံအသစ်နှင့်အတူ ပြန်လည်တပ်ဆင်ပါ
azd deploy api
```

## မှတ်တမ်း ကြည့်ရှုခြင်း

### Logs များ ကြည့်ရန်

```bash
# azd monitor ကို အသုံးပြုပြီး လက်ရှိ တိုက်ရိုက် log များကို စီးဆင်းကြည့်ပါ
azd monitor --logs

# သို့မဟုတ် Container Apps အတွက် Azure CLI ကို အသုံးပြုပါ:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# နောက်ဆုံး 100 လိုင်းများကို ကြည့်ပါ
az containerapp logs show --name api --resource-group $RG_NAME --tail 100
```

### Metrics များ စောင့်ကြည့်ရန်

```bash
# Azure Monitor ဒက်ရှ်ဘုတ်ကို ဖွင့်ပါ
azd monitor --overview

# သီးခြားသော မက်ထရစ်များကို ကြည့်ပါ
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## စမ်းသပ်ခြင်း

### Health Check

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

Expected response:
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

### အားလုံးကို ရယူမည်

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## ကုန်ကျစရိတ် အနည်းဆုံးသိမ်းဆည်းနည်း

ဒီ deployment သည် scale-to-zero ကို အသုံးပြုသည်၊ ထို့ကြောင့် API သည် request ကို process လုပ်စဉ်တွင်သာ ပေးဆောင်ရမည်:

- **Idle cost**: ~$0/month (scaled to zero)
- **Active cost**: ~$0.000024/second per replica
- **Expected monthly cost** (light usage): $5-15

### ကုန်ကျစရိတ် သက်သာစေရန် နည်းလမ်းများ

```bash
# dev အတွက် အမြင့်ဆုံး replicas များကို လျော့ချပါ
azd env set MAX_REPLICAS 3

# မအသုံးပြုနေသည့် အချိန်ကုန်ချိန်ကို ပိုတို သတ်မှတ်ပါ
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 မိနစ်
```

## ပြဿနာဖြေရှင်းခြင်း

### Container ပေါက်မထိုးနိုင်ခြင်း

```bash
# Azure CLI ကို အသုံးပြု၍ ကွန်တိန်နာ လော့ဂ်များကို စစ်ဆေးပါ
az containerapp logs show --name api --resource-group $RG_NAME --tail 100

# Docker image များကို မိမိစက်တွင် တည်ဆောက်နိုင်မှုကို အတည်ပြုပါ
docker build -t test ./src
```

### API မရောက်နိုင်ခြင်း

```bash
# ingress သည် အပြင်ဘက် ဖြစ်ကြောင်း အတည်ပြုပါ
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### တုံ့ပြန်ချိန် များစွာ ကြာခြင်း

```bash
# CPU/မှတ်ဉာဏ် (Memory) အသုံးပြုမှုကို စစ်ဆေးပါ
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# လိုအပ်လျှင် အရင်းအမြစ်များကို တိုးမြှင့်ပါ
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## သန့်ရှင်းရေး

```bash
# အရင်းအမြစ်အားလုံးကို ဖျက်ပါ
azd down --force --purge
```

## နောက်တစ်ဆင့်များ

### ဤဥပမာကို တိုးချဲ့မည်

1. **Add Database** - Integrate Azure Cosmos DB or SQL Database
   ```bash
   # infra/main.bicep တွင် Cosmos DB မော်ဂျူးကို ထည့်ပါ
   # app.py ကို ဒေတာဘေ့စ် ချိတ်ဆက်မှုဖြင့် အပ်ဒိတ်ပြုလုပ်ပါ
   ```

2. **Add Authentication** - Implement Microsoft Entra ID or API keys
   ```python
   # app.py ထဲတွင် authentication middleware ထည့်ပါ
   from functools import wraps
   ```

3. **Set Up CI/CD** - GitHub Actions workflow
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Add Managed Identity** - Secure access to Azure services
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### ဆက်စပ် ဥပမာများ

- **[Database App](../../../../../examples/database-app)** - Complete example with SQL Database
- **[Microservices](../../../../../examples/container-app/microservices)** - Multi-service architecture
- **[Container Apps Master Guide](../README.md)** - All container patterns

### သင်ယူရန် အရင်းအမြစ်များ

- 📚 [AZD For Beginners Course](../../../README.md) - Main course home
- 📚 [Container Apps Patterns](../README.md) - More deployment patterns
- 📚 [AZD Templates Gallery](https://azure.github.io/awesome-azd/) - Community templates

## အပိုဆောင်း အရင်းအမြစ်များ

### စာတမ်းများ
- **[Flask Documentation](https://flask.palletsprojects.com/)** - Flask framework guide
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Official Azure docs
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd command reference

### သင်ခန်းစာများ
- **[Container Apps Quickstart](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Deploy your first app
- **[Python on Azure](https://learn.microsoft.com/azure/developer/python/)** - Python development guide
- **[Bicep Language](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infrastructure as code

### ကိရိယာများ
- **[Azure Portal](https://portal.azure.com)** - Manage resources visually
- **[VS Code Azure Extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - IDE integration

---

**🎉 ကံကောင်းပါစေ!** သင်သည် auto-scaling နှင့် monitoring ပါသော production-ready Flask API ကို Azure Container Apps ပေါ်သို့ deploy ပြီးသားဖြစ်ပါပြီ။

**မေးခွန်းများ ရှိပါသလား?** [Open an issue](https://github.com/microsoft/AZD-for-beginners/issues) သို့မဟုတ် [FAQ](../../../resources/faq.md) ကို စစ်ဆေးပါ။

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ပြောကြားချက်**
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးပမ်းနေသော်လည်း၊ စက်ကိရိယာဘာသာပြန်ခြင်းများတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါဝင်နိုင်ကြောင်း သတိပြုပါရန် လိုအပ်ပါသည်။ မူလစာတမ်းကို မူရင်းဘာသာဖြင့်သာ ယုံကြည်စိတ်ချရသော အချက်အလက်အဖြစ် သတ်မှတ်သင့်သည်။ အရေးကြီးသည့် သတင်းအချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူသားဘာသာပြန်သူဝန်ဆောင်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော နားလည်မှုကွာခြားမှုများ သို့မဟုတ် မမှန်ကန်သော အသုံးပြုမှုများအတွက် ကျွန်ုပ်တို့ တာဝန်မခံပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->