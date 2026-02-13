# ရိုးရှင်း Flask API - Container App ဥပမာ

**သင်ယူမှု လမ်းကြောင်း:** စတင်သူ ⭐ | **အချိန်:** 25-35 မိနစ် | **ကုန်ကျစရိတ်:** $0-15/လ

Azure Developer CLI (azd) ကိုအသုံးပြုပြီး Azure Container Apps သို့ တပ်ဆင်ထားသော အလုပ်လုပ်နိုင်သော Python Flask REST API တစ်ခု။ ဤဥပမာတွင် container တပ်ဆင်ခြင်း၊ အလိုအလျောက် စကေးခြင်းနှင့် မော်နီတာလုပ်ငန်းအခြေခံများကို ဥပဒေအတိုင်း ပြပါသည်။

## 🎯 သင်ဘာများ အခိုင်အမာ သင်ယူမလဲ

- container ပြုလုပ်ထားသော Python အက်ပ်ကို Azure သို့ တပ်ဆင်ခြင်း
- scale-to-zero အပါအဝင် အလိုအလျောက် စကေးခြင်း ပြုလုပ်ခြင်း
- health probes နှင့် readiness checks များ အကောင်အထည်ဖော်ခြင်း
- အက်ပ်၏ logs နှင့် metrics များ ကို မော်နီတာလုပ်ခြင်း
- လျင်မြန်စွာ တပ်ဆင်နိုင်ရန် Azure Developer CLI ကို အသုံးပြုခြင်း

## 📦 ပါဝင်ပစ္စည်းများ

✅ **Flask Application** - CRUD လုပ်ဆောင်ချက်များပါသော ပြည့်စုံသော REST API (`src/app.py`)  
✅ **Dockerfile** - ထုတ်လုပ်မှုအဆင်သင့် container ဖော်ပြချက်  
✅ **Bicep Infrastructure** - Container Apps ပတ်ဝန်းကျင်နှင့် API တပ်ဆင်မှု  
✅ **AZD Configuration** - တစ်ချက်က မှတစ်ချက် တပ်ဆင်နိုင်သော စနစ်  
✅ **Health Probes** - Liveness နှင့် readiness စစ်ဆေးမှုများ ဖွဲ့စည်းထား됨  
✅ **Auto-scaling** - HTTP traffic အပေါ် မူတည်၍ 0-10 မိတ္တူများ

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

## Prerequisites

### လိုအပ်သည်များ
- **Azure Developer CLI (azd)** - [တပ်ဆင်နည်းလမ်းညွှန်](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure subscription** - [အခမဲ့ အကောင့်](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Docker တပ်ဆင်ခြင်း](https://www.docker.com/products/docker-desktop/) (ဒေသခံ စမ်းသပ်ရန်)

### လိုအပ်ချက်များ အတည်ပြုခြင်း

```bash
# azd ဗားရှင်းကို စစ်ဆေးပါ (1.5.0 သို့မဟုတ် ထက်မြင့်သော ဗားရှင်း လိုအပ်သည်)
azd version

# Azure လော့ဂ်အင်ကို အတည်ပြုပါ
azd auth login

# Docker ကို စစ်ဆေးပါ (ရွေးချယ်နိုင်သည်၊ ဒေသတွင်း စမ်းသပ်မှုအတွက်)
docker --version
```

## ⏱️ တပ်ဆင်ခြင်း အချိန်အကာလ

| အဆင့် | ကြာချိန် | လုပ်ဆောင်ချက် |
|-------|----------|--------------||
| ပတ်ဝန်းကျင် ပြင်ဆင်ခြင်း | 30 စက္ကန့် | azd ပတ်ဝန်းကျင် ဖန်တီးခြင်း |
| Container တည်ဆောက်ခြင်း | 2-3 မိနစ် | Docker ဖြင့် Flask အက်ပ် ဆောက်ခြင်း |
| အတည်ပြု အဆောက်အအုံ ချမှတ်ခြင်း | 3-5 မိနစ် | Container Apps, registry, monitoring များ ဖန်တီးခြင်း |
| အက်ပ် တပ်ဆင်ခြင်း | 2-3 မိနစ် | image ကို push လုပ်၍ Container Apps သို့ deploy ခြင်း |
| **စုစုပေါင်း** | **8-12 မိနစ်** | တပ်ဆင်မှု ပြီးစီးစီစစ် ပြင်ဆင်ပြီး အဆင်သင့် ဖြစ်သည် |

## Quick Start

```bash
# ဥပမာသို့ သွားပါ
cd examples/container-app/simple-flask-api

# ပတ်ဝန်းကျင်ကို စတင်ပြင်ဆင်ပါ (ထူးခြားသော အမည်ကို ရွေးပါ)
azd env new myflaskapi

# အားလုံးကို စနစ်တကျ တင်သွင်းပါ (အခြေခံအဆောက်အအုံ + အက်ပလီကေးရှင်း)
azd up
# သင်ကို အောက်ပါအချက်များ တောင်းခံမည်:
# 1. Azure subscription ကို ရွေးချယ်ပါ
# 2. တည်နေရာကို ရွေးပါ (ဥပမာ၊ eastus2)
# 3. တင်သွင်းမှုအတွက် 8-12 မိနစ် ခန့် စောင့်ဆိုင်းပါ

# သင့် API endpoint ကို ရယူပါ
azd env get-values

# API ကို စမ်းသပ်ပါ
curl $(azd env get-value API_ENDPOINT)/health
```

**မျှော်လင့်ရမည့် ရလဒ်:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ တပ်ဆင်မှု ကို အတည်ပြုရန်

### အဆင့် 1: တပ်ဆင်မှု အခြေအနေ စစ်ဆေးခြင်း

```bash
# တပ်ဆင်ထားသော ဝန်ဆောင်မှုများကို ကြည့်ရန်
azd show

# မျှော်မှန်းထားသော ထွက်ရလဒ်မှာ အောက်ပါအတိုင်း:
# - ဝန်ဆောင်မှု: api
# - အဆုံးလိပ်စာ: https://ca-api-[env].xxx.azurecontainerapps.io
# - အခြေအနေ: လည်ပတ်နေသည်
```

### အဆင့် 2: API Endpoint များကို စမ်းသပ်ခြင်း

```bash
# API endpoint ရယူရန်
API_URL=$(azd env get-value API_ENDPOINT)

# health ကို စမ်းသပ်ရန်
curl $API_URL/health

# root endpoint ကို စမ်းသပ်ရန်
curl $API_URL/

# item တစ်ခု ဖန်တီးရန်
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# item အားလုံး ရယူရန်
curl $API_URL/api/items
```

**အောင်မြင်မှု ချက်များ:**
- ✅ Health endpoint သည် HTTP 200 ပြန်လာရမည်
- ✅ Root endpoint သည် API သတင်းအချက်အလက်ကို ပြသရမည်
- ✅ POST သည် item တစ်ခု ဖန်တီးပြီး HTTP 201 ကို ပြန်သင့်ပါသည်
- ✅ GET သည် ဖန်တီးထားသည့် items များကို ပြန်ပေးရမည်

### အဆင့် 3: Logs ကြည့်ရှုခြင်း

```bash
# azd monitor ကိုအသုံးပြု၍ တိုက်ရိုက် လော့ဂ်များကို ကြည့်ရှုပါ
azd monitor --logs

# သို့မဟုတ် Azure CLI ကို အသုံးပြုပါ:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# သင်မြင်ရမည့်အရာများ:
# - Gunicorn စတင်ချိန် မက်ဆေ့ခ်ျများ
# - HTTP တောင်းဆိုမှု လော့ဂ်များ
# - လျှောက်လွှာ သတင်းအချက်အလက် လော့ဂ်များ
```

## Project Structure

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
| `/health` | GET | Health စစ်ဆေးချက် |
| `/api/items` | GET | အရာများအားလုံး ပြသခြင်း |
| `/api/items` | POST | အသစ်အရာ တစ်ခု ဖန်တီးခြင်း |
| `/api/items/{id}` | GET | သတ်မှတ်ထားသော အရာ ရယူခြင်း |
| `/api/items/{id}` | PUT | အရာ အပ်ဒိတ်/ပြင်ဆင်ခြင်း |
| `/api/items/{id}` | DELETE | အရာ ဖျက်ခြင်း |

## Configuration

### Environment Variables

```bash
# စိတ်ကြိုက် ဖွဲ့စည်းမှုကို သတ်မှတ်ပါ
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Scaling Configuration

API သည် HTTP traffic ကို အခြေခံ၍ အလိုအလျောက် စကေးလျှင်:
- **အနည်းဆုံး မိတ္တူ (Min Replicas)**: 0 (idle လျှင် zero သို့ စကေးသည်)
- **အများဆုံး မိတ္တူ (Max Replicas)**: 10
- **မိတ္တူ တစ်ခုချင်းလျှင် တပြိုင်နက်တောင်းဆိုမှုများ (Concurrent Requests per Replica)**: 50

## Development

### ဒေသတွင်းတွင် chạy လုပ်ရန်

```bash
# လိုအပ်သော အချိတ်အဆက်များကို တပ်ဆင်ပါ
cd src
pip install -r requirements.txt

# အက်ပလီကေးရှင်းကို လည်ပတ်ပါ
python app.py

# ကိုယ့်စက်ပေါ်တွင် စမ်းသပ်ပါ
curl http://localhost:8000/health
```

### Container ကို ထုတ်လုပ်၍ စမ်းသပ်ခြင်း

```bash
# Docker image တည်ဆောက်ပါ
docker build -t flask-api:local ./src

# ကွန်တိန်နာကို ကိုယ်ပိုင်စက်ပေါ်တွင် လည်ပတ်ပါ
docker run -p 8000:8000 flask-api:local

# ကွန်တိန်နာကို စမ်းသပ်ပါ
curl http://localhost:8000/health
```

## Deployment

### အပြည့်အစုံ တပ်ဆင်ခြင်း

```bash
# အခြေခံအဆောက်အအုံနှင့် အက်ပလီကေးရှင်းကို ဖြန့်ချိပါ
azd up
```

### ကုဒ်ပဲ ဖြင့် တပ်ဆင်ခြင်း

```bash
# အက်ပလီကေးရှင်းကုဒ်သာ တင်ပါ (အောက်ခံအဆောက်အအုံ မပြောင်းလဲထားပါ)
azd deploy api
```

### ဆက်တင်များ ပြင်ဆင်ခြင်း

```bash
# ပတ်ဝန်းကျင် သတ်မှတ်ထားသော တန်ဖိုးများအား အပ်ဒိတ်လုပ်ပါ
azd env set API_KEY "new-api-key"

# ဆက်တင်အသစ်ဖြင့် ပြန်လည်တင်သွင်းပါ
azd deploy api
```

## Monitoring

### Logs ကြည့်ရှုရန်

```bash
# azd monitor ကို အသုံးပြု၍ တိုက်ရိုက် log များ စီးဆင်းကြည့်ပါ
azd monitor --logs

# သို့မဟုတ် Container Apps အတွက် Azure CLI ကို အသုံးပြုပါ:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# နောက်ဆုံး 100 ကြောင်းကို ကြည့်ပါ
az containerapp logs show --name api --resource-group $RG_NAME --tail 100
```

### Metrics များ မော်နီတာရန်

```bash
# Azure Monitor ဒက်ရှ်ဘုတ်ကို ဖွင့်ပါ
azd monitor --overview

# တိကျသော မီထရစ်များကို ကြည့်ပါ
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## Testing

### Health စစ်ဆေးမှု

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

မျှော်လင့်ရမည့် ပြန်ကြားချက်:
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

### အားလုံး ရယူခြင်း

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## ကုန်ကျစရိတ် ထိရောက်စေခြင်း

ဤတပ်ဆင်မှုသည် scale-to-zero ကို အသုံးပြုသည်၊ ထို့ကြောင့် API သည် တောင်းဆိုမှုများကို ပြုလုပ်သည့်အချိန်တွင်သာ ငါးမလွှတ် ပေးငွေ ရမည်။

- **အလုပ်မလုပ်သည့် ကုန်ကျစရိတ် (Idle cost)**: ~ $0/လ (zero သို့ စကေးထားသည်)
- **လုပ်ဆောင်နေချိန် ကုန်ကျစရိတ် (Active cost)**: ~ $0.000024/စက္ကန့် တစ်မိတ္တူလျှင်
- **မျှော်မှန်း လစဉ် ကုန်ကျစရိတ်** (အသုံးအနှုန်း သာမန်): $5-15

### ကုန်ကျစရိတ် သက်သာစေရန် နည်းလမ်းများ

```bash
# ဖွံ့ဖြိုးရေး (dev) အတွက် အများဆုံး replicas ကို လျော့ချပါ
azd env set MAX_REPLICAS 3

# မအသုံးပြုနေသည့် အချိန်အတွက် timeout ကို ပိုမိုတိုအောင် သတ်မှတ်ပါ
azd env set SCALE_TO_ZERO_TIMEOUT 300  # ၅ မိနစ်
```

## Troubleshooting

### Container မစတင်ပါက

```bash
# Azure CLI ကို အသုံးပြုပြီး ကွန်တိန်နာများ၏ မှတ်တမ်းများကို စစ်ဆေးပါ
az containerapp logs show --name api --resource-group $RG_NAME --tail 100

# Docker image များကို ကိုယ့်ကွန်ပျူတာပေါ်တွင် တည်ဆောက်နိုင်ခြင်းကို အတည်ပြုပါ
docker build -t test ./src
```

### API သို့ မရောက်ရှိနိုင်ပါက

```bash
# ingress ကို ပြင်ပကြောင်း အတည်ပြုပါ
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### တုံ့ပြန်ချိန် မြင့်မားနေပါက

```bash
# CPU နှင့် မှတ်ဉာဏ် (Memory) အသုံးပြုမှုကို စစ်ဆေးပါ
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# လိုအပ်လျှင် အရင်းအမြစ်များကို တိုးမြှင့်ပါ
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## ရှင်းလင်း ဖျက်တင်ခြင်း

```bash
# အရင်းအမြစ်အားလုံးကို ဖျက်ပါ
azd down --force --purge
```

## နောက်ထပ် လုပ်ဆောင်ရန်

### ဤဥပမာကို တိုးချဲ့ရန်

1. **Database ထည့်ပါ** - Azure Cosmos DB သို့မဟုတ် SQL Database အဖွဲ့စည်း ထည့်သွင်းခြင်း
   ```bash
   # infra/main.bicep တွင် Cosmos DB မော်ဂျူးကို ထည့်ပါ
   # app.py ကို ဒေတာဘေ့စ် ချိတ်ဆက်မှုဖြင့် အပ်ဒိတ်လုပ်ပါ
   ```

2. **Authentication ထည့်ပါ** - Azure AD သို့မဟုတ် API keys အကောင်အထည်ဖော်ခြင်း
   ```python
   # app.py တွင် သုံးသူ အတည်ပြုခြင်းအတွက် middleware ကို ထည့်ပါ
   from functools import wraps
   ```

3. **CI/CD ချိတ်ဆက်ပါ** - GitHub Actions workflow
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Managed Identity ထည့်ပါ** - Azure ဝန်ဆောင်မှုများသို့ လုံခြုံစွာ 접근ခွင့် ပေးခြင်း
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### ဆက်စပ် ဥပမာများ

- **[ဒေတာဘေ့စ် အက်ပ်](../../../../../examples/database-app)** - SQL Database ပါသော ပြည့်စုံ ဥပမာ
- **[မိုက်ခရိုဆာဗစ်များ](../../../../../examples/container-app/microservices)** - မြောက်စွာသော ဝန်ဆောင်မှုဖွဲ့စည်းမှု
- **[Container Apps မာစတာ လမ်းညွှန်](../README.md)** - အားလုံးသော container ပုံစံများ

### သင်ယူရန် အရင်းအမြစ်များ

- 📚 [AZD For Beginners Course](../../../README.md) - မူလ သင်တန်း အိမ်မျိုင်း
- 📚 [Container Apps Patterns](../README.md) - နောက်ထပ် တပ်ဆင်မှု ပုံစံများ
- 📚 [AZD Templates Gallery](https://azure.github.io/awesome-azd/) - အသိုင်းအဝိုင်း ပုံစံများ

## အပိုဆောင်း အရင်းအမြစ်များ

### စာတမ်းများ
- **[Flask Documentation](https://flask.palletsprojects.com/)** - Flask framework လမ်းညွှန်
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Azure အတည်တကျ စာတမ်းများ
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd command ကိုးကားချက်

### လေ့ကျင့်ခန်းများ
- **[Container Apps Quickstart](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - ပထမဆုံး အက်ပ် ကို တပ်ဆင်ခြင်း quickstart
- **[Python on Azure](https://learn.microsoft.com/azure/developer/python/)** - Azure တွင် Python ဖွံ့ဖြိုးရေး လမ်းညွှန်
- **[Bicep Language](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infrastructure as code သင်ခန်းစာ

### ကိရိယာများ
- **[Azure Portal](https://portal.azure.com)** - ရှုမြင်၍ စီမံခန့်ခွဲရန်
- **[VS Code Azure Extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - IDE တွင် ပေါင်းစည်းရန်

---

**🎉 အားလုံးကို ဂုဏ်ပြုပါတယ်!** သင်သည် auto-scaling နှင့် monitoring ပါဝင်သော production-ready Flask API ကို Azure Container Apps သို့ တပ်ဆင်ပြီး ဖြစ်ပါသည်။

**မေးခွန်းများ ရှိပါသလား?** [Open an issue](https://github.com/microsoft/AZD-for-beginners/issues) သို့ ဖွင့်မေးပါ သို့မဟုတ် [FAQ](../../../resources/faq.md) ကို ကြည့်ပါ။

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
တာဝန်လွှတ်ချက်:
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု Co-op Translator (https://github.com/Azure/co-op-translator) ဖြင့် ဘာသာပြန်ထားပါသည်။ ကျွန်တော်(တို့)သည် တိကျမှန်ကန်စေရန် ကြိုးပမ်းချင်သော်လည်း အလိုအလျောက် ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါရှိနိုင်ကြောင်း သတိပြုပါ။ မူလစာတမ်းကို မူလဘာသာဖြင့်သာ ယုံကြည်စိတ်ချရသော အရင်းအမြစ်အနေဖြင့် ယူဆသင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူသားပညာရှင်(ပရော်ဖက်ရှင်နယ်) ခံနိုင်ရည်ရှိသော ဘာသာပြန်တင်ပြချက်ကို အသုံးပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုမှုကြောင့် ဖြစ်ပေါ်လာနိုင်သည့် နားမလည်မှုများ သို့မဟုတ် မှားယွင်းဖော်ပြချက်များအတွက် ကျွန်တော်(တို့) တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->