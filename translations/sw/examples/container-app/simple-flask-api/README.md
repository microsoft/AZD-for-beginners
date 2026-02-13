# Simple Flask API - Container App Example

**Njia ya Kujifunza:** Beginner ⭐ | **Muda:** 25-35 minutes | **Gharama:** $0-15/month

Programu kamili, inayofanya kazi ya Python Flask REST API iliyopewa kwenye Azure Container Apps kwa kutumia Azure Developer CLI (azd). Mfano huu unaonyesha utekelezaji wa kontena, upanuzi wa kiotomatiki, na misingi ya ufuatiliaji.

## 🎯 Nini Utajifunza

- Kuzindua programu ya Python iliyohifadhiwa kwenye kontena kwenye Azure
- Kusanidi upanuzi wa kiotomatiki (auto-scaling) pamoja na scale-to-zero
- Kutekeleza probes za afya na ukaguzi wa utayari
- Kufuatilia magogo na vipimo vya programu
- Kutumia Azure Developer CLI kwa utekelezaji wa haraka

## 📦 Vinavyomo

✅ **Flask Application** - REST API kamili na shughuli za CRUD (`src/app.py`)  
✅ **Dockerfile** - Usanidi wa kontena unaotumika uzalishaji  
✅ **Bicep Infrastructure** - Mazingira ya Container Apps na utekelezaji wa API  
✅ **AZD Configuration** - Usanidi wa utekelezaji kwa amri moja  
✅ **Health Probes** - Ukaguzi wa uhai na utayari umewekwa  
✅ **Auto-scaling** - nakala 0-10 kulingana na mzigo wa HTTP  

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

## Mahitaji ya awali

### Inahitajika
- **Azure Developer CLI (azd)** - [Install guide](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure subscription** - [Free account](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Install Docker](https://www.docker.com/products/docker-desktop/) (kwa upimaji wa ndani)

### Thibitisha Mahitaji

```bash
# Angalia toleo la azd (inahitaji 1.5.0 au ya juu)
azd version

# Thibitisha kuingia kwa Azure
azd auth login

# Angalia Docker (hiari, kwa majaribio ya ndani)
docker --version
```

## ⏱️ Muda wa Utekelezaji

| Phase | Duration | What Happens |
|-------|----------|--------------||
| Environment setup | 30 seconds | Create azd environment |
| Build container | 2-3 minutes | Docker build Flask app |
| Provision infrastructure | 3-5 minutes | Create Container Apps, registry, monitoring |
| Deploy application | 2-3 minutes | Push image and deploy to Container Apps |
| **Total** | **8-12 minutes** | Complete deployment ready |

## Anza Haraka

```bash
# Nenda kwenye mfano
cd examples/container-app/simple-flask-api

# Anzisha mazingira (chagua jina la kipekee)
azd env new myflaskapi

# Sambaza yote (miundombinu + programu)
azd up
# Utaulizwa kufanya:
# 1. Chagua usajili wa Azure
# 2. Chagua eneo (kwa mfano, eastus2)
# 3. Subiri dakika 8-12 kwa ajili ya usambazaji

# Pata kiunganishi cha API yako
azd env get-values

# Jaribu API
curl $(azd env get-value API_ENDPOINT)/health
```

**Matokeo Yanayotarajiwa:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ Thibitisha Utekelezaji

### Hatua 1: Angalia Hali ya Utekelezaji

```bash
# Tazama huduma zilizowekwa
azd show

# Matokeo yanayotarajiwa yanaonyesha:
# - Huduma: api
# - Kiunganisho: https://ca-api-[env].xxx.azurecontainerapps.io
# - Hali: Inafanya kazi
```

### Hatua 2: Jaribu Vituo vya API

```bash
# Pata mwisho wa API
API_URL=$(azd env get-value API_ENDPOINT)

# Jaribu hali ya afya
curl $API_URL/health

# Jaribu mwisho wa mzizi
curl $API_URL/

# Unda kipengee
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# Pata vipengee vyote
curl $API_URL/api/items
```

**Vigezo vya Mafanikio:**
- ✅ Health endpoint returns HTTP 200
- ✅ Root endpoint shows API information
- ✅ POST creates item and returns HTTP 201
- ✅ GET returns created items

### Hatua 3: Tazama Magogo

```bash
# Tiririsha kumbukumbu za moja kwa moja kwa kutumia azd monitor
azd monitor --logs

# Au tumia Azure CLI:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Unapaswa kuona:
# - Ujumbe za kuanzishaji wa Gunicorn
# - Kumbukumbu za maombi za HTTP
# - Kumbukumbu za taarifa za programu
```

## Muundo wa Mradi

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

## Vituo vya API

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/health` | GET | Ukaguzi wa afya |
| `/api/items` | GET | Orodhesha vitu vyote |
| `/api/items` | POST | Unda kipengee kipya |
| `/api/items/{id}` | GET | Pata kipengee maalum |
| `/api/items/{id}` | PUT | Sasisha kipengee |
| `/api/items/{id}` | DELETE | Futa kipengee |

## Usanidi

### Vigezo vya Mazingira

```bash
# Weka usanidi maalum
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Usanidi wa Upanuzi

API inapanuka kwa kiotomatiki kulingana na trafiki ya HTTP:
- **Min Replicas**: 0 (inapanuka hadi sifuri wakati haifanyi kazi)
- **Max Replicas**: 10
- **Concurrent Requests per Replica**: 50

## Maendeleo

### Endesha kwa Kompyuta Yako

```bash
# Sakinisha vitegemezi
cd src
pip install -r requirements.txt

# Endesha programu
python app.py

# Fanya majaribio kwenye kompyuta yako
curl http://localhost:8000/health
```

### Jenga na Jaribu Kontena

```bash
# Jenga picha ya Docker
docker build -t flask-api:local ./src

# Endesha kontena kwenye mashine ya ndani
docker run -p 8000:8000 flask-api:local

# Jaribu kontena
curl http://localhost:8000/health
```

## Utekelezaji

### Utekelezaji Kamili

```bash
# Sambaza miundombinu na programu
azd up
```

### Utekelezaji wa Msimbo Pekee

```bash
# Weka tu msimbo wa programu (miundombinu isibadilike)
azd deploy api
```

### Sasisha Usanidi

```bash
# Sasisha vigezo vya mazingira
azd env set API_KEY "new-api-key"

# Zindua tena kwa usanidi mpya
azd deploy api
```

## Ufuatiliaji

### Tazama Magogo

```bash
# Tiririsha kumbukumbu za moja kwa moja kwa kutumia azd monitor
azd monitor --logs

# Au tumia Azure CLI kwa Container Apps:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Tazama mistari 100 ya mwisho
az containerapp logs show --name api --resource-group $RG_NAME --tail 100
```

### Fuatilia Vipimo

```bash
# Fungua dashibodi ya Azure Monitor
azd monitor --overview

# Tazama vipimo maalum
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## Upimaji

### Ukaguzi wa Afya

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

Jibu linalotarajiwa:
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### Unda Kipengee

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### Pata Vitu Vyote

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## Uboreshaji wa Gharama

Utekelezaji huu unatumia scale-to-zero, kwa hivyo unalipa tu wakati API inashughulikia maombi:

- **Gharama wakati haifanyi kazi**: ~$0/month (inabaki hadi sifuri)
- **Gharama ya uendeshaji**: ~$0.000024/second per replica
- **Gharama inayotarajiwa kwa mwezi** (matumizi mepesi): $5-15

### Punguza Gharama Zaidi

```bash
# Punguza idadi ya juu ya nakala kwa ajili ya mazingira ya maendeleo
azd env set MAX_REPLICAS 3

# Tumia muda mfupi wa kutokuwa na shughuli
azd env set SCALE_TO_ZERO_TIMEOUT 300  # dakika 5
```

## Utatuzi wa Matatizo

### Kontena Haianzi

```bash
# Angalia kumbukumbu za kontena kwa kutumia Azure CLI
az containerapp logs show --name api --resource-group $RG_NAME --tail 100

# Thibitisha kwamba picha za Docker zinajengwa kwa ndani (lokali)
docker build -t test ./src
```

### API Haiwezi Kufikiwa

```bash
# Thibitisha kuwa ingress ni ya nje
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Muda Mrefu wa Majibu

```bash
# Angalia matumizi ya CPU/kumbukumbu
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Panua rasilimali ikiwa zinahitajika
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Ondoa Rasilimali

```bash
# Futa rasilimali zote
azd down --force --purge
```

## Hatua Zifuatazo

### Panua Mfano Huu

1. **Add Database** - Integrate Azure Cosmos DB or SQL Database
   ```bash
   # Ongeza moduli ya Cosmos DB kwenye infra/main.bicep
   # Sasisha app.py na muunganisho wa hifadhidata
   ```

2. **Add Authentication** - Implement Azure AD or API keys
   ```python
   # Ongeza middleware ya uthibitishaji kwenye app.py
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

### Mifano Iliyohusiana

- **[Database App](../../../../../examples/database-app)** - Mfano kamili na SQL Database
- **[Microservices](../../../../../examples/container-app/microservices)** - Muundo wa huduma nyingi
- **[Container Apps Master Guide](../README.md)** - Mifumo yote ya container

### Rasilimali za Kujifunza

- 📚 [AZD For Beginners Course](../../../README.md) - Ukurasa mkuu wa kozi
- 📚 [Container Apps Patterns](../README.md) - Mifumo zaidi ya utekelezaji
- 📚 [AZD Templates Gallery](https://azure.github.io/awesome-azd/) - Violezo vya jamii

## Rasilimali Zaidi

### Nyaraka
- **[Flask Documentation](https://flask.palletsprojects.com/)** - Mwongozo wa mfumo wa Flask
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Nyaraka rasmi za Azure
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - Marejeo ya amri za azd

### Mafunzo
- **[Container Apps Quickstart](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Weka programu yako ya kwanza
- **[Python on Azure](https://learn.microsoft.com/azure/developer/python/)** - Mwongozo wa maendeleo ya Python
- **[Bicep Language](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Miundombinu kama msimbo

### Zana
- **[Azure Portal](https://portal.azure.com)** - Dhibiti rasilimali kwa mtazamo wa kioo
- **[VS Code Azure Extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - Uunganisho wa IDE

---

**🎉 Hongera!** Umeweka Flask API tayari kwa uzalishaji kwenye Azure Container Apps ikiwa na upanuzi wa kiotomatiki na ufuatiliaji.

**Maswali?** [Fungua issue](https://github.com/microsoft/AZD-for-beginners/issues) au angalia [FAQ](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Taarifa ya Kutoweka Dhamana:
Hati hii imetafsiriwa kwa kutumia huduma ya utafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuhakikisha usahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au hitilafu. Hati ya asili katika lugha yake ya mama inapaswa kuzingatiwa kama chanzo chenye mamlaka. Kwa taarifa muhimu, inashauriwa kutumia utafsiri wa kitaalamu uliofanywa na mtu. Hatuwajibiki kwa uelewa mbaya au tafsiri potofu zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->