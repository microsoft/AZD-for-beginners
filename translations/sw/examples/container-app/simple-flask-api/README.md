<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9e7f581a238c1bf7f9f31a2ba118a90c",
  "translation_date": "2025-11-23T12:13:15+00:00",
  "source_file": "examples/container-app/simple-flask-api/README.md",
  "language_code": "sw"
}
-->
# API Rahisi ya Flask - Mfano wa Programu ya Kontena

**Njia ya Kujifunza:** Mwanzoni ⭐ | **Muda:** Dakika 25-35 | **Gharama:** $0-15/mwezi

API kamili ya Python Flask REST iliyowekwa kwenye Azure Container Apps kwa kutumia Azure Developer CLI (azd). Mfano huu unaonyesha uwekaji wa kontena, upanuzi wa kiotomatiki, na misingi ya ufuatiliaji.

## 🎯 Utajifunza Nini

- Weka programu ya Python iliyowekwa kwenye kontena kwenye Azure
- Sanidi upanuzi wa kiotomatiki na scale-to-zero
- Tekeleza uchunguzi wa afya na ukaguzi wa utayari
- Fuatilia kumbukumbu za programu na vipimo
- Tumia Azure Developer CLI kwa uwekaji wa haraka

## 📦 Kinachojumuishwa

✅ **Programu ya Flask** - API kamili ya REST na operesheni za CRUD (`src/app.py`)  
✅ **Dockerfile** - Usanidi wa kontena tayari kwa uzalishaji  
✅ **Miundombinu ya Bicep** - Mazingira ya Container Apps na uwekaji wa API  
✅ **Usanidi wa AZD** - Usanidi wa amri moja kwa uwekaji  
✅ **Uchunguzi wa Afya** - Ukaguzi wa liveness na utayari umesanidiwa  
✅ **Upanuzi wa Kiotomatiki** - Nakala 0-10 kulingana na mzigo wa HTTP  

## Muundo wa Kifaa

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

## Mahitaji

### Yanayohitajika
- **Azure Developer CLI (azd)** - [Mwongozo wa usakinishaji](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Usajili wa Azure** - [Akaunti ya bure](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Sakinisha Docker](https://www.docker.com/products/docker-desktop/) (kwa majaribio ya ndani)

### Thibitisha Mahitaji

```bash
# Angalia toleo la azd (unahitaji 1.5.0 au zaidi)
azd version

# Thibitisha kuingia kwa Azure
azd auth login

# Angalia Docker (hiari, kwa majaribio ya ndani)
docker --version
```

## ⏱️ Muda wa Uwekaji

| Awamu | Muda | Kinachotokea |
|-------|----------|--------------||
| Usanidi wa mazingira | Sekunde 30 | Unda mazingira ya azd |
| Jenga kontena | Dakika 2-3 | Jenga programu ya Flask kwa Docker |
| Toa miundombinu | Dakika 3-5 | Unda Container Apps, rejista, ufuatiliaji |
| Weka programu | Dakika 2-3 | Sukuma picha na weka kwenye Container Apps |
| **Jumla** | **Dakika 8-12** | Uwekaji kamili tayari |

## Mwanzo wa Haraka

```bash
# Elekea kwenye mfano
cd examples/container-app/simple-flask-api

# Anzisha mazingira (chagua jina la kipekee)
azd env new myflaskapi

# Peleka kila kitu (miundombinu + programu)
azd up
# Utatakiwa:
# 1. Chagua usajili wa Azure
# 2. Chagua eneo (mfano, eastus2)
# 3. Subiri dakika 8-12 kwa ajili ya upelekaji

# Pata mwisho wa API yako
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

## ✅ Thibitisha Uwekaji

### Hatua ya 1: Angalia Hali ya Uwekaji

```bash
# Tazama huduma zilizowekwa
azd show

# Matokeo yanayotarajiwa yanaonyesha:
# - Huduma: api
# - Endpoint: https://ca-api-[env].xxx.azurecontainerapps.io
# - Hali: Inaendelea
```

### Hatua ya 2: Jaribu Njia za API

```bash
# Pata mwisho wa API
API_URL=$(azd env get-value API_ENDPOINT)

# Jaribu afya
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
- ✅ Njia ya afya inarudisha HTTP 200
- ✅ Njia ya mzizi inaonyesha taarifa za API
- ✅ POST inaunda kipengee na kurudisha HTTP 201
- ✅ GET inarudisha vipengee vilivyoundwa

### Hatua ya 3: Tazama Kumbukumbu

```bash
# Tazama kumbukumbu za moja kwa moja
azd logs api --follow

# Unapaswa kuona:
# - Ujumbe wa kuanzisha Gunicorn
# - Kumbukumbu za maombi ya HTTP
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

## Njia za API

| Njia | Njia | Maelezo |
|----------|--------|-------------|
| `/health` | GET | Ukaguzi wa afya |
| `/api/items` | GET | Orodhesha vipengee vyote |
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

API inapanuka kiotomatiki kulingana na trafiki ya HTTP:
- **Nakala za Chini**: 0 (inapungua hadi sifuri ikiwa haifanyi kazi)
- **Nakala za Juu**: 10
- **Maombi ya Wakati Mmoja kwa Nakala**: 50

## Maendeleo

### Endesha Ndani

```bash
# Sakinisha utegemezi
cd src
pip install -r requirements.txt

# Endesha programu
python app.py

# Jaribu ndani ya nchi
curl http://localhost:8000/health
```

### Jenga na Jaribu Kontena

```bash
# Jenga picha ya Docker
docker build -t flask-api:local ./src

# Endesha kontena kwa ndani
docker run -p 8000:8000 flask-api:local

# Jaribu kontena
curl http://localhost:8000/health
```

## Uwekaji

### Uwekaji Kamili

```bash
# Weka miundombinu na programu
azd up
```

### Uwekaji wa Nambari Pekee

```bash
# Peleka tu msimbo wa programu (miundombinu haijabadilika)
azd deploy api
```

### Sasisha Usanidi

```bash
# Sasisha vigezo vya mazingira
azd env set API_KEY "new-api-key"

# Tuma upya na usanidi mpya
azd deploy api
```

## Ufuatiliaji

### Tazama Kumbukumbu

```bash
# Tazama kumbukumbu za moja kwa moja
azd logs api --follow

# Tazama mistari 100 ya mwisho
azd logs api --tail 100
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

### Pata Vipengee Vyote

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## Uboreshaji wa Gharama

Uwekaji huu unatumia scale-to-zero, kwa hivyo unalipa tu wakati API inashughulikia maombi:

- **Gharama ya kutokufanya kazi**: ~$0/mwezi (imepungua hadi sifuri)
- **Gharama ya kufanya kazi**: ~$0.000024/sekunde kwa nakala
- **Gharama ya kila mwezi inayotarajiwa** (matumizi madogo): $5-15

### Punguza Gharama Zaidi

```bash
# Punguza idadi ya nakala za juu kwa maendeleo
azd env set MAX_REPLICAS 3

# Tumia muda mfupi wa kusubiri bila kazi
azd env set SCALE_TO_ZERO_TIMEOUT 300  # Dakika 5
```

## Utatuzi wa Shida

### Kontena Halianzi

```bash
# Angalia magogo ya kontena
azd logs api --tail 100

# Thibitisha picha ya Docker inajengwa ndani ya nchi
docker build -t test ./src
```

### API Haipatikani

```bash
# Thibitisha kuingia ni ya nje
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Muda Mrefu wa Majibu

```bash
# Angalia matumizi ya CPU/Kumbukumbu
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Ongeza rasilimali ikiwa inahitajika
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Kusafisha

```bash
# Futa rasilimali zote
azd down --force --purge
```

## Hatua Zifuatazo

### Panua Mfano Huu

1. **Ongeza Hifadhidata** - Unganisha Azure Cosmos DB au SQL Database
   ```bash
   # Ongeza moduli ya Cosmos DB kwenye infra/main.bicep
   # Sasisha app.py na muunganisho wa hifadhidata
   ```

2. **Ongeza Uthibitishaji** - Tekeleza Azure AD au funguo za API
   ```python
   # Ongeza middleware ya uthibitishaji kwenye app.py
   from functools import wraps
   ```

3. **Sanidi CI/CD** - Mtiririko wa kazi wa GitHub Actions
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Ongeza Utambulisho Ulioendeshwa** - Fikia huduma za Azure kwa usalama
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### Mifano Inayohusiana

- **[Programu ya Hifadhidata](../../../../../examples/database-app)** - Mfano kamili na SQL Database
- **[Huduma Ndogo](../../../../../examples/container-app/microservices)** - Muundo wa huduma nyingi
- **[Mwongozo Mkuu wa Container Apps](../README.md)** - Mifumo yote ya kontena

### Rasilimali za Kujifunza

- 📚 [Kozi ya AZD Kwa Wanaoanza](../../../README.md) - Nyumbani kwa kozi kuu
- 📚 [Mifumo ya Container Apps](../README.md) - Mifumo zaidi ya uwekaji
- 📚 [Matunzio ya Violezo vya AZD](https://azure.github.io/awesome-azd/) - Violezo vya jamii

## Rasilimali za Ziada

### Nyaraka
- **[Nyaraka za Flask](https://flask.palletsprojects.com/)** - Mwongozo wa mfumo wa Flask
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Nyaraka rasmi za Azure
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - Marejeleo ya amri za azd

### Mafunzo
- **[Mwanzo wa Haraka wa Container Apps](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Weka programu yako ya kwanza
- **[Python kwenye Azure](https://learn.microsoft.com/azure/developer/python/)** - Mwongozo wa maendeleo ya Python
- **[Lugha ya Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Miundombinu kama nambari

### Zana
- **[Azure Portal](https://portal.azure.com)** - Dhibiti rasilimali kwa taswira
- **[Kiendelezi cha Azure cha VS Code](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - Muunganisho wa IDE

---

**🎉 Hongera!** Umeweka API ya Flask tayari kwa uzalishaji kwenye Azure Container Apps na upanuzi wa kiotomatiki na ufuatiliaji.

**Maswali?** [Fungua suala](https://github.com/microsoft/AZD-for-beginners/issues) au angalia [Maswali Yanayoulizwa Mara kwa Mara](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kanusho**:  
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kwa usahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Hati ya asili katika lugha yake ya awali inapaswa kuzingatiwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu ya binadamu inapendekezwa. Hatutawajibika kwa kutoelewana au tafsiri zisizo sahihi zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->