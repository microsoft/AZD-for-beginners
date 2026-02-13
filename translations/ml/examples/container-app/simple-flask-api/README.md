# സിമ്പിൾ ഫ്ലാസ്ക് API - കണ്ടെയ്‌നർ ആപ്പ് ഉദാഹരണം

**അധ്യയന മാർഗം:** തുടക്കക്കാരൻ ⭐ | **സമയം:** 25-35 മിനിറ്റ് | **ചെലവ്:** $0-15/മാസം

Python Flask REST API യുടെ ഒരു പൂർണ്ണമായ, പ്രവർത്തനക്ഷമമായ സംരംഭം Azure Developer CLI (azd) ഉപയോഗിച്ച് Azure Container Apps-ൽ വിന്യസിക്കുന്നത്. ഈ ഉദാഹരണം കണ്ടെയ്‌നർ വിന്യാസം, സ്വയംസ്കേലിംഗ്, മേൽനോട്ടം അടിസ്ഥാനങ്ങൾ കാണിക്കുന്നു.

## 🎯 നിങ്ങൾ പഠിക്കുന്നതു എന്ത്

- Azure-ൽ കണ്ടെയ്‌നറൈസ് ചെയ്ത Python അപ്ലിക്കേഷൻ വിന്യസിക്കുക
- സ്കേൽ-ടു-സീറോ ഓട്ടോ-സ്കേലിംഗ് കോൺഫിഗർ ചെയ്യുക
- ഹെൽത്ത് പ്രോബുകളും റെഡിനസ് ചെക്കുകളും നടപ്പിലാക്കുക
- അപ്ലിക്കേഷൻ ലോഗുകളും മെറ്റ്രിക്സുകളും നിരീക്ഷിക്കുക
- വേഗത്തിലുള്ള വിന്യാസത്തിനായി Azure Developer CLI ഉപയോഗിക്കുക

## 📦 എന്തൊക്കെയാണ് ഉൾപ്പെടുന്നത്

✅ **ഫ്ലാസ്ക് അപ്ലിക്കേഷൻ** - CRUD പ്രവര്‍ത്തനങ്ങളുള്ള പൂർണ്ണ REST API (`src/app.py`)  
✅ **ഡോക്കർഫയൽ** - പ്രൊഡക്ഷൻ-റെഡി കണ്ടെയ്‌നർ കോൺഫിഗറേഷൻ  
✅ **ബൈസപ് ഇൻഫ്രാസ്‌ട്രക്ചർ** - കണ്ടെയ്‌നർ ആപ്സ് എൻവയോൺമെന്റും API വിന്യാസവും  
✅ **AZD കോൺഫിഗറേഷൻ** - ഒറ്റ കമാൻഡ് വിന്യാസ ക്രമീകരണം  
✅ **ഹെൽത്ത് പ്രോബുകൾ** - ലിവ്‌നസ്, റെഡിനസ് ചെക്കുകൾ കോൺഫിഗർ ചെയ്തിട്ടുണ്ട്  
✅ **ഓട്ടോ-സ്കേലിംഗ്** - HTTP ലോഡിന്റെ അടിസ്ഥാനത്തിൽ 0-10 റെപ്ലിക്കാസുകൾ  

## ആർക്കിടെക്ചർ

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

## ആവശ്യമായ മുൻകൂട്ടി ചിട്ടപ്പെടുത്തലുകൾ

### ആവശ്യപ്പെടുന്നവ
- **Azure Developer CLI (azd)** - [ഇൻസ്റ്റാൾ ഗൈഡ്](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure സബ്സ്ക്രിപ്ഷൻ** - [ഫ്രീ അക്കൗണ്ട്](https://azure.microsoft.com/free/)
- **ഡോക്കർ ഡെസ്‌ക്ടോപ്പ്** - [ഡോക്കർ ഇൻസ്റ്റാൾ ചെയ്യുക](https://www.docker.com/products/docker-desktop/) (ലോകല് ടെസ്റ്റിംഗിനായി)

### മുൻകൂട്ടി ചിട്ടപ്പെടുത്തലുകൾ പരിശോധന നടത്തുക

```bash
# azd പതിപ്പ് പരിശോധിക്കുക (1.5.0 അല്ലെങ്കിൽ അതിൽ മേൽ ആവശ്യം)
azd version

# Azure ലോഗിൻ പരിശോധിക്കുക
azd auth login

# Docker പരിശോധിക്കുക (ഐച്ചികം, പ്രാദേശിക പരിശോധനയ്‌ക്കായി)
docker --version
```

## ⏱️ വിന്യാസ സമയരേഖ

| ഘട്ടം | ദൈർഘ്യം | സംഭവിക്കുന്നത് |
|-------|----------|--------------||
| എൻവയോൺമെന്റ് ക്രിയേറ്റ് ചെയ്യൽ | 30 സെക്കന്റ് | azd എൻവയോൺമെന്റ് സൃഷ്ടിക്കുക |
| കണ്ടെയ്‌നർ നിർമ്മാണം | 2-3 മിനിറ്റ് | ഡോക്കർ ഉപയോഗിച്ച് ഫ്ലാസ്ക് ആപ്പ് ബിൽഡ് ചെയ്യുക |
| ഇൻഫ്രാസ്ട്രക്ചർ ഒരുക്കൽ | 3-5 മിനിറ്റ് | കണ്ടെയ്‌നർ ആപ്സ്, രജിസ്ട്രി, മേൽനോട്ടം സൃഷ്ടിക്കുക |
| അപ്ലിക്കേഷൻ വിന്യാസം | 2-3 മിനിറ്റ് | ഇമേജ് പുഷ് ചെയ്ത് കണ്ടെയ്‌നർ ആപ്സിലേക്ക് വിന്യസിക്കുക |
| **മൊത്തം** | **8-12 മിനിറ്റ്** | പൂർണ്ണ വിന്യാസം തയ്യാറായി |

## വഴക്കം തുടക്കം

```bash
# ഉദാഹരണത്തിലേക്ക് നീങ്ങുക
cd examples/container-app/simple-flask-api

# പരിസ്ഥിതി തുടങ്ങുക (വ്യത്യസ്തമായ പേര് തിരഞ്ഞെടുക്കുക)
azd env new myflaskapi

# എല്ലാം വിന്യസിക്കുക (സൗകര്യം + ആപ്ലിക്കേഷൻ)
azd up
# നിങ്ങളെ പ്രേരിപ്പിക്കും:
# 1. അഴ്യൂർ സബ്സ്ക്രിപ്ഷൻ തിരഞ്ഞെടുക്കുക
# 2. സ്ഥലം തിരഞ്ഞെടുക്കുക (ഉദാ., eastus2)
# 3. വിന്യസനത്തിനായി 8-12 മിനിറ്റ് കാത്തിരിക്കുക

# നിങ്ങളുടെ API എൻഡ്‌പോയിന്റ് നേടുക
azd env get-values

# API പരിശോധിക്കുക
curl $(azd env get-value API_ENDPOINT)/health
```

**പ്രതീക്ഷിക്കുന്ന ഔട്ട്‌പുട്ട്:**  
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ വിന്യാസം സ്ഥിരീകരിക്കൽ

### നടപടി 1: വിന്യാസ നില പരിശോധിക്കുക

```bash
# വിന്യസിച്ച സേവനങ്ങൾ കാണുക
azd show

# പ്രതീക്ഷിക്കപ്പെടുന്ന ഔട്ട്പുട്ട് കാണിക്കുന്നു:
# - സേവനം: api
# - എൻഡ്പോയിന്റ്: https://ca-api-[env].xxx.azurecontainerapps.io
# - നില: പ്രവർത്തനസജ്ജമാണ്
```

### നടപടി 2: API എൻഡ്‌പോയിന്റുകൾ പരിശോധിക്കുക

```bash
# API എൻഡ്‌പോയിന്റ് നേടുക
API_URL=$(azd env get-value API_ENDPOINT)

# ശാരീരികം പരിശോധിക്കുക
curl $API_URL/health

# റൂട്ട് എൻഡ്‌പോയിന്റ് പരിശോധിക്കുക
curl $API_URL/

# ഒരു ഇനം സൃഷ്ടിക്കുക
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# എല്ലാ ഇനങ്ങളും നേടുക
curl $API_URL/api/items
```

** വിജയ മാനദണ്ഡങ്ങൾ:**  
- ✅ ഹെൽത്ത് എൻഡ്‌പോയിന്റ് HTTP 200 റിട്ടേൺ ചെയ്യണം  
- ✅ റൂട്ട്എൻഡ്‌പോയിന്റ് API വിവരങ്ങൾ കാണിക്കണം  
- ✅ POST പുതിയ ഐറ്റം സൃഷ്ടിച്ച് HTTP 201 റിട്ടേൺ ചെയ്യണം  
- ✅ GET സൃഷ്ടിച്ച ഐറ്റങ്ങൾ റിട്ടേൺ ചെയ്യണം  

### നടപടി 3: ലോഗുകൾ കാണുക

```bash
# azd monitor ഉപയോഗിച്ച് ലൈവ് ലൈഗുകൾ സ്ട്രീം ചെയ്യുക
azd monitor --logs

# അല്ലെങ്കിൽ Azure CLI ഉപയോഗിക്കുക:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# നിങ്ങൾ കാണേണ്ടത്:
# - ഗണികോൺ സ്റ്റാർട്ടപ്പ് സന്ദേശങ്ങൾ
# - HTTP അഭ്യർഥനാ ലോക്കുകൾ
# - അപ്ലിക്കേഷൻ വിവരം ലോക്കുകൾ
```

## പ്രോജക്റ്റ് ഘടന

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

## API എൻഡ്‌പോയിന്റുകൾ

| എൻഡ്‌പോയിന്റ് | മെത്തഡ് | വിവരണം |
|----------|--------|-------------|
| `/health` | GET | ഹെൽത്ത് ചെക്ക് |
| `/api/items` | GET | എല്ലാ ഐറ്റങ്ങൾ ലിസ്റ്റ് ചെയ്യുക |
| `/api/items` | POST | പുതിയ ഐറ്റം സൃഷ്ടിക്കുക |
| `/api/items/{id}` | GET | പ്രത്യേക ഐറ്റം ലഭിക്കുക |
| `/api/items/{id}` | PUT | ഐറ്റം അപ്ഡേറ്റു ചെയ്യുക |
| `/api/items/{id}` | DELETE | ഐറ്റം ഡിലീറ്റ് ചെയ്യുക |

## കോൺഫിഗറേഷൻ

### എൻവയോൺമെന്റ് വേരിയബിളുകൾ

```bash
# ഇഷ്ടാനുസൃത ക്രമീകരണം സജ്ജീകരിക്കുക
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### സ്കേലിംഗ് കോൺഫിഗറേഷൻ

HTTP ട്രാഫിക് അടിസ്ഥാനമാക്കി API സ്വയം സ്കേൽ ചെയ്യുന്നു:
- **കുറഞ്ഞ റെപ്ലിക്കാസുകൾ**: 0 (ഓവറ്ഹെഡ് ഇല്ലാതെയായി സ്കേൽ-ടു-സീറോ)
- **പരമാവധി റെപ്ലിക്കാസുകൾ**: 10
- **ഓരോ റെപ്ലിക്കക്കും ഒരുമിച്ച് കൈകാര്യം ചെയ്യാവുന്ന അഭ്യർത്ഥനകൾ**: 50

## ഡെവലപ്പ്മെന്റ്

### ലോക്കലായി റൺ ചെയ്യുക

```bash
# ആശ്രിതങ്ങൾ ഇൻസ്റ്റാൾ ചെയ്യുക
cd src
pip install -r requirements.txt

# ആപ്പ് പ്രവർത്തിപ്പിക്കുക
python app.py

# പ്രാദേശികമായി പരിശോധനചെയ്യുക
curl http://localhost:8000/health
```

### കണ്ടെയ്‌നർ ബിൽഡ് ചെയ്യുക, ടസ്റ്റ് ചെയ്യുക

```bash
# Docker ചിത്രം നിർമ്മിക്കുക
docker build -t flask-api:local ./src

# കണ്ടെയ്‌നർ ലോക്കലായി പ്രവർത്തിക്കുക
docker run -p 8000:8000 flask-api:local

# കണ്ടെയ്‌നർ പരിശോധന നടത്തുക
curl http://localhost:8000/health
```

## വിന്യാസം

### പൂർണ്ണ വിന്യാസം

```bash
# അടിസ്ഥാനസൗകര്യവും അപേക്ഷയും വിന്യസിക്കുക
azd up
```

### കോഡ് മാത്രം വിന്യാസം

```bash
# ആപ്ലിക്കേഷൻ കോഡ് മാത്രം ഡിപ്ലോയ് ചെയ്യുക (ഇൻഫ്രാസ്ട്രക്ചർ മാറ്റംവരുത്തരുത്)
azd deploy api
```

### കോൺഫിഗറേഷൻ അപ്ഡേറ്റ് ചെയ്യുക

```bash
# പരിസരവരുമാനങ്ങൾ അപ്ഡേറ്റ് ചെയ്യുക
azd env set API_KEY "new-api-key"

# പുതിയ കോൺഫിഗറേഷനുള്ളതായി പുനഃപ്രവർത്തിപ്പിക്കുക
azd deploy api
```

## മേൽനോട്ടം

### ലോഗുകൾ കാണുക

```bash
# azd monitor ഉപയോഗിച്ച് ലൈവാക്കമുള്ള ലോഗുകൾ സ്റ്റ്രീം ചെയ്യുക
azd monitor --logs

# അല്ലെങ്കിൽ കൺടെയ്‌നർ ആപ്പുകൾക്കായി Azure CLI ഉപയോഗിക്കുക:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# അവസാന 100 വരികൾ കാണുക
az containerapp logs show --name api --resource-group $RG_NAME --tail 100
```

### മെറ്റ്രിക്സുകൾ നിരീക്ഷിക്കുക

```bash
# Azure Monitor ഡാഷ്‌ബോഡ് തുറക്കുക
azd monitor --overview

# പ്രത്യേക മെട്രിക്കുകൾ കാണുക
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## ടെസ്റ്റിംഗ്

### ഹെൽത്ത് ചെക്ക്

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

പ്രതീക്ഷിക്കുന്ന പ്രതികരണം:  
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### ഐറ്റം സൃഷ്ടിക്കൽ

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### എല്ലാ ഐറ്റങ്ങളും ലഭിക്കുക

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## ചെലവ് കുറഞ്ഞ രീതിയിൽ ഉള്ള വിന്യാസം

ഈ വിന്യാസം സ്കേൽ-ടു-സീറോ ഉപയോഗിക്കുന്നു, അതിനാൽ API അഭ്യർത്ഥനകൾ പ്രോസസ് ചെയ്യുന്ന കാര്യകാലത്ത് മാത്രം നിങ്ങൾക്ക് പണം തരേണ്ടി വരും:

- **അനുപയോഗം സമയം ചെലവ്**: ഏകദേശം $0/മാസം (സീറോ സ്കേൽഡ്)
- **പ്രവർത്തന സമയം ചെലവ്**: ഏകദേശം $0.000024/സെക്കൻഡ് ഓരോ റെപ്ലിക്കക്കും
- **പ്രതീക്ഷിക്കുന്ന മാസ ചെലവ്** (ഇളം ഉപയോഗം): $5-15

### ചെലവ് കൂടുതൽ കുറയ്ക്കുന്നതിനുള്ള മാർഗങ്ങൾ

```bash
# ഡെവലപ്പ്മെന്റിനായി പരമാവധി പ്രതികൾ കുറയ്‌ക്കുക
azd env set MAX_REPLICAS 3

# ചെറുതായൊരു ഐഡിൽ ടൈമൗട്ട് ഉപയോഗിക്കുക
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 മിനിറ്റുകൾ
```

## പ്രശ്നപരിഹാരം

### കണ്ടെയ്‌നർ തുടങ്ങുന്നില്ല

```bash
# എ്യൂർ CLI ഉപയോഗിച്ച് കൺറ്റെയ്നർ ലോഗുകൾ പരിശോധിക്കുക
az containerapp logs show --name api --resource-group $RG_NAME --tail 100

# ഡോക്കർ ഇമേജ് ലോക്കലി നിർമ്മിതമാണ് എന്ന് സ്ഥിരീകരിക്കുക
docker build -t test ./src
```

### API ലഭ്യമല്ല

```bash
# ഇൻ‌ഗ്രസ്സ് বাহ്യമാണ് എന്ന് പരിശോധിക്കുക
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### ഉയർന്ന പ്രതികരണ സമയം

```bash
# CPU/Memory ഉപയോഗം പരിശോധിക്കുക
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# ആവശ്യമായാൽ സ്രോതസ്സുകൾ വർദ്ധിപ്പിക്കുക
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## ക്ലീൻ അപ്പ്

```bash
# എല്ലാ വിഭവങ്ങളും മായ്ച്ചു
azd down --force --purge
```

## തവ്വക്കം നിലനിർത്തേണ്ടതും അടുത്ത ചുവട്

### ഈ ഉദാഹരണം വിപുലീകരിക്കുക

1. **ഡാറ്റാബേസ് ചേർക്കുക** - Azure Cosmos DB അല്ലെങ്കിൽ SQL ഡാറ്റാബേസ് ഇൻറഗ്രേറ്റ് ചെയ്യുക  
   ```bash
   # infra/main.bicep ലേക്ക് Cosmos DB മിഡ്യൂൾ ചേർക്കുക
   # app.py ൽ ഡാറ്റാബേസ് ബന്ധം അപ്ഡേറ്റ് ചെയ്യുക
   ```

2. **അഥന്റിക്കേഷൻ ചേർക്കുക** - Azure AD അല്ലെങ്കിൽ API കീകൾ നടപ്പിലാക്കുക  
   ```python
   # app.py-ലേക്ക് ഓതന്റിക്കേഷൻ മിഡിൽവെയർ ചേർക്കുക
   from functools import wraps
   ```

3. **CI/CD സെറ്റ് അപ്പ് ചെയ്യുക** - GitHub Actions വർക്ക്‌ഫ്ലോ  
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **മാനേജഡ് ഐഡന്റിറ്റി ചേർക്കുക** - Azure സേവനങ്ങളിലേക്ക് സുരക്ഷിത പ്രവേശനം  
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### ബന്ധപ്പെട്ട ഉദാഹരണങ്ങൾ

- **[ഡാറ്റാബേസ് ആപ്പ്](../../../../../examples/database-app)** - SQL ഡാറ്റാബേസ് ഉപയോഗിക്കുന്ന പൂർണ്ണ ഉദാഹരണം  
- **[മൈക്രോസർവീസസ്](../../../../../examples/container-app/microservices)** - മൾട്ടി-സർവീസ് ആർക്കിടെക്ചർ  
- **[കണ്ടെയ്‌നർ ആപ്സ് മാസ്റ്റർ ഗൈഡ്](../README.md)** - എല്ലാം കണ്ടെയ്‌നർ മാതൃകകൾ

### പഠന വിഭവങ്ങൾ

- 📚 [AZD ഫോർ-BEGINNERS കോഴ്സ്](../../../README.md) - മുഖ്യ കോഴ്സ്  
- 📚 [കണ്ടെയ്‌നർ ആപ്സ് മാതൃകകൾ](../README.md) - കൂടുതൽ വിന്യാസ മാതൃകകൾ  
- 📚 [AZD ടെംപ്ലേറ്റുകൾ ഗ്യാലറി](https://azure.github.io/awesome-azd/) - കമ്മ്യൂണിറ്റി ടെംപ്ലേറ്റുകൾ  

## അധിക വിഭവങ്ങൾ

### ഡോക്യുമെന്റേഷൻ  
- **[Flask ഡോക്യുമെന്റേഷൻ](https://flask.palletsprojects.com/)** - ഫ്ലാസ്ക് ഫ്രെയിംവർക്ക് ഗൈഡ്  
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - ഔദ്യോഗിക Azure ഡോക്  
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd കമാൻഡ് റഫറൻസ്  

### ട്യൂട്ടോറിയലുകൾ  
- **[Container Apps ക്വിക്ക്സ്റ്റാർട്ട്](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - നിങ്ങളുടെ ആദ്യ അപ്ലിക്കേഷൻ വിന്യസിക്കുക  
- **[Python ഓൺ Azure](https://learn.microsoft.com/azure/developer/python/)** - Python ഡെവലപ്പ്മെന്റ് ഗൈഡ്  
- **[Bicep ലാംഗ്വേജ്](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infrastructure as Code

### ടൂൾസ്  
- **[Azure പോർട്ടൽ](https://portal.azure.com)** - പ്രൊജക്റ്റുകൾ ദൃശ്യപരമായി കൈകാര്യം ചെയ്യുക  
- **[VS കോഡ് Azure എക്‌സ്റ്റൻഷൻ](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - ഐ.ഡി.ഇ ഇന്റഗ്രേഷൻ  

---

**🎉 അഭിനന്ദനങ്ങൾ!** നിങ്ങൾ ഒരു പ്രൊഡക്ഷൻ റെഡി Flask API Azure Container Apps-ലേക്ക് ഓട്ടോ-സ്കേലിംഗ്, മേൽനോട്ട സംവിധാനങ്ങളോടുകൂടി വിന്യസിച്ചു.

**ചോദ്യങ്ങൾ ഉണ്ടോ?** [ഒരു ഇഷു തുറക്കുക](https://github.com/microsoft/AZD-for-beginners/issues) അല്ലെങ്കിൽ [FAQ](../../../resources/faq.md) പരിശോധിക്കുക

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**വ്യത്യാസവിവരണം**:  
ഈ രേഖ AI പരിഭാഷാ സേവനം [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് പരിഭാഷപ്പെടുത്തിയതാണ്. നാം ശരിയായ പരിഭാഷ നൽകാൻ ശ്രമിക്കുന്നുവെങ്കിലും, സ്വയം പ്രവർത്തിക്കുന്ന പരിഭാഷകളിൽ പിഴവുകൾ അല്ലെങ്കിൽ അസത്യതകൾ ഉണ്ടായേക്കാമെന്ന് ശ്രദ്ധിക്കുക. മാതൃഭാഷയിൽ തയ്യാറാക്കിയ അടിസ്ഥാനം രേഖ വിശ്വാസയോഗ്യമായ ഉറവിടമായി കണക്കാക്കേണ്ടതാണ്. നിർണായക വിവരങ്ങൾക്ക്, പ്രൊഫഷണൽ മനുഷ്യ പരിഭാഷ ശുപാർശ ചെയ്യപ്പെടുന്നു. ഈ പരിഭാഷ ഉപയോഗിക്കുന്നതിനിടയിലെ തെറ്റിദ്ധാരണകൾക്കും വ്യാഖ്യാന വ്യത്യാസങ്ങൾക്കും ഞങ്ങൾ ഉത്തരവാദിയല്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->