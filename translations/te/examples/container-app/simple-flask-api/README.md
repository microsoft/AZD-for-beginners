# సరళమైన Flask API - Container App ఉదాహరణ

**పాఠ్య మార్గం:** ప్రారంభము ⭐ | **సమయం:** 25-35 నిమిషాలు | **Cost:** $0-15/month

పూర్తి, పనిచేసే Python Flask REST API ను Azure Container Apps లో Azure Developer CLI (azd) ఉపయోగించి డిప్లాయ్ చేయబడింది. ఈ ఉదాహరణ కంటైనర్ డిప్లాయ్‌మెంట్, ఆటో-స్కేలింగ్ మరియు మానిటరింగ్ బేసిక్స్ ని చూపిస్తుంది.

## 🎯 మీరు ఏమి నేర్చుకుంటారు

- Python అనువర్తనాన్ని కంటైనర్‌లో ప్యాకేజ్ చేసి Azureకి డిప్లాయ్ చేయడం
- స్కేల్-టు-జీరోతో ఆటో-స్కేలింగ్‌ను కాన్ఫిగర్ చేయడం
- హెల్త్ ప్రోబ్‌లు మరియు రెడినెస్ చెక్లు అమలు చేయడం
- అప్లికేషన్ లాగ్‌లు మరియు మెట్రిక్‌లు మానిటర్ చేయడం
- వేగంగా డిప్లాయ్ చేసేందుకు Azure Developer CLI ఉపయోగించడం

## 📦 ఇందులో ఏమి ఉంది

✅ **Flask అప్లికేషన్** - CRUD ఆపరేషన్లతో పూర్తి REST API (`src/app.py`)  
✅ **Dockerfile** - ప్రొడక్షన్-రెడీ కంటైనర్ కాన్ఫిగరేషన్  
✅ **Bicep ఇన్‌ఫ్రాస్ట్రక్చర్** - Container Apps పరిసరాలు మరియు API డిప్లాయ్‌మెంట్  
✅ **AZD కాన్ఫిగరేషన్** - ఒకటే ఆజ్ఞతో డిప్లాయ్ సెటప్  
✅ **హెల్త్ ప్రోబ్‌లు** - లైవ్‌నెస్ మరియు రెడినెస్ చెక్స్ కాన్ఫిగర్ చేసినవి  
✅ **ఆటో-స్కేలింగ్** - HTTP లోడ్ ఆధారంగా 0-10 రిప్లికాస్  

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

### Required
- **Azure Developer CLI (azd)** - [ఇన్‌స్టాల్ గైడ్](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure subscription** - [ఉచిత ఖాతా](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Docker ఇన్‌స్టాల్ చేయండి](https://www.docker.com/products/docker-desktop/) (లోకల్ పరీక్ష కోసం)

### Verify Prerequisites

```bash
# azd వెర్షన్‌ను తనిఖీ చేయండి (1.5.0 లేదా అంతకంటే పైగా అవసరం)
azd version

# Azure లాగిన్‌ను ధృవీకరించండి
azd auth login

# Docker‌ను తనిఖీ చేయండి (ఐచ్ఛికం, స్థానిక పరీక్ష కోసం)
docker --version
```

## ⏱️ Deployment Timeline

| దశ | వ్యవధి | ఏమి జరుగుతుంది |
|-------|----------|--------------||
| Environment setup | 30 seconds | azd పరిసరాన్ని సృష్టించడం |
| Build container | 2-3 minutes | Docker ద్వారా Flask యాప్‌ను బిల్డ్ చేయడం |
| Provision infrastructure | 3-5 minutes | Container Apps, రిజిస్ట్రీ, మానిటరింగ్‌ను సృష్టించడం |
| Deploy application | 2-3 minutes | ఇమేజ్‌ను పుష్ చేసి Container Appsలో డిప్లాయ్ చేయడం |
| **మొత్తం** | **8-12 నిమిషాలు** | పూర్తి డిప్లాయ్‌మెంట్ సిద్ధం |

## Quick Start

```bash
# ఉదాహరణకి వెళ్లండి
cd examples/container-app/simple-flask-api

# పరిసరాన్ని ప్రారంభించండి (అనన్యమైన పేరు ఎంచుకోండి)
azd env new myflaskapi

# అన్నింటినీ అమలు చేయండి (ఇన్‌ఫ్రాస్ట్రక్చర్ + అప్లికేషన్)
azd up
# మీకు అడిగబడుతుంది:
# 1. Azure సబ్స్క్రిప్షన్ ఎంచుకోండి
# 2. స్థానం ఎంచుకోండి (ఉదా., eastus2)
# 3. డిప్లాయ్‌మెంట్ కోసం 8-12 నిమిషాలు వేచి ఉండండి

# మీ API ఎండ్‌పాయింట్‌ను పొందండి
azd env get-values

# APIని పరీక్షించండి
curl $(azd env get-value API_ENDPOINT)/health
```

**అంచనా అవుట్పుట్:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ డిప్లాయ్‌మెంట్‌ను ధృవీకరించండి

### దశ 1: డిప్లాయ్‌మెంట్ స్థితిని పరిశీలించండి

```bash
# డిప్లాయ్ చేయబడిన సేవలను చూడండి
azd show

# అంచనా అవుట్పుట్ కింది విధంగా ఉంటుంది:
# - సేవ: api
# - ఎండ్‌పాయింట్: https://ca-api-[env].xxx.azurecontainerapps.io
# - స్థితి: నడుస్తోంది
```

### దశ 2: API ఎండ్‌పాయింట్‌లను పరీక్షించండి

```bash
# API ఎండ్‌పాయింట్ పొందండి
API_URL=$(azd env get-value API_ENDPOINT)

# ఆరోగ్యాన్ని పరీక్షించండి
curl $API_URL/health

# రూట్ ఎండ్‌పాయింట్‌ను పరీక్షించండి
curl $API_URL/

# ఒక అంశాన్ని సృష్టించండి
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# అన్ని అంశాలను పొందండి
curl $API_URL/api/items
```

**యశస్సు ప్రమాణాలు:**
- ✅ హెల్త్ ఎండ్‌పాయింట్ HTTP 200 రీటర్న్ చేస్తుంది
- ✅ రూట్ ఎండ్‌పాయింట్ API సమాచారం చూపిస్తుంది
- ✅ POST ఐటమ్ సృష్టించి HTTP 201 రిటర్న్ చేస్తుంది
- ✅ GET సృష్టించిన ఐటమ్‌లను రిటర్న్ చేస్తుంది

### దశ 3: లాగ్‌లను చూడండి

```bash
# azd monitor ని ఉపయోగించి లైవ్ లాగ్‌లను స్ట్రీమ్ చేయండి
azd monitor --logs

# లేక Azure CLI ఉపయోగించండి:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# మీరు చూడగలరు:
# - Gunicorn ఆరంభ సందేశాలు
# - HTTP అభ్యర్థనల లాగ్‌లు
# - అప్లికేషన్ సమాచారం లాగ్‌లు
```

## ప్రాజెక్ట్ నిర్మాణం

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

## API ఎండ్‌పాయింట్లు

| ఎండ్‌పాయింట్ | విధానం | వివరణ |
|----------|--------|-------------|
| `/health` | GET | హెల్త్ చెక్ |
| `/api/items` | GET | అన్ని అంశాలను జాబితా చేయండి |
| `/api/items` | POST | కొత్త అంశం సృష్టించండి |
| `/api/items/{id}` | GET | నిర్దిష్ట అంశాన్ని పొందండి |
| `/api/items/{id}` | PUT | అంశాన్ని నవీకరించండి |
| `/api/items/{id}` | DELETE | అంశాన్ని తొలగించండి |

## Configuration

### ఎన్విరాన్‌మెంట్ వేరియబుల్స్

```bash
# కస్టమ్ కాన్ఫిగరేషన్‌ను సెట్ చేయండి
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Scaling Configuration

The API automatically scales based on HTTP traffic:
- **Min Replicas**: 0 (ఐడల్ ఉన్నప్పుడు జీరోకు స్కేల్ అవుతుంది)
- **Max Replicas**: 10
- **Concurrent Requests per Replica**: 50

## Development

### Run Locally

```bash
# నిర్భరతలను ఇన్‌స్టాల్ చేయండి
cd src
pip install -r requirements.txt

# యాప్‌ను నడపండి
python app.py

# స్థానికంగా పరీక్షించండి
curl http://localhost:8000/health
```

### Build and Test Container

```bash
# Docker ఇమేజ్‌ను నిర్మించండి
docker build -t flask-api:local ./src

# కంటెయినర్‌ను స్థానికంగా నడపండి
docker run -p 8000:8000 flask-api:local

# కంటెయినర్‌ను పరీక్షించండి
curl http://localhost:8000/health
```

## Deployment

### Full Deployment

```bash
# ఇన్‌ఫ్రాస్ట్రక్చర్ మరియు అప్లికేషన్‌ను అమర్చండి
azd up
```

### Code-Only Deployment

```bash
# కేవలం అప్లికేషన్ కోడ్‌ను మాత్రమే డిప్లాయ్ చేయండి (ఇన్ఫ్రాస్ట్రక్చర్ మారదు)
azd deploy api
```

### Update Configuration

```bash
# పర్యావరణ చరాలను నవీకరించండి
azd env set API_KEY "new-api-key"

# కొత్త కాన్ఫిగరేషన్‌తో మళ్లీ అమలు చేయండి
azd deploy api
```

## Monitoring

### View Logs

```bash
# azd monitor ఉపయోగించి ప్రత్యక్ష లాగ్‌లను స్ట్రీమ్ చేయండి
azd monitor --logs

# లేదా Container Apps కోసం Azure CLI ఉపయోగించండి:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# చివరి 100 లైన్లను వీక్షించండి
az containerapp logs show --name api --resource-group $RG_NAME --tail 100
```

### Monitor Metrics

```bash
# Azure Monitor డాష్‌బోర్డ్‌ను తెరవండి
azd monitor --overview

# నిర్దిష్ట మెట్రిక్స్‌ను వీక్షించండి
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## Testing

### Health Check

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

అనుకున్న స్పందన:
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### Create Item

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### Get All Items

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## Cost Optimization

This deployment uses scale-to-zero, so you only pay when the API is processing requests:

- **Idle cost**: ~$0/నెల (జీరోకు స్కేల్ చేయబడింది)
- **Active cost**: ~$0.000024/సెకను ప్రతి రిప్లికాకు
- **అనుకున్న నెలవారీ ఖర్చు** (తక్కువ వినియోగం): $5-15

### Reduce Costs Further

```bash
# డెవ్ కోసం గరిష్ట రిప్లికాలను తగ్గించండి
azd env set MAX_REPLICAS 3

# నిష్క్రియ టైమ్‌అవుట్‌ను తక్కువగా ఉంచండి
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 నిమిషాలు
```

## Troubleshooting

### కంటైనర్ ప్రారంభం కావడం లేదు

```bash
# Azure CLI ద్వారా కంటైనర్ లాగ్‌లను తనిఖీ చేయండి
az containerapp logs show --name api --resource-group $RG_NAME --tail 100

# Docker ఇమేజ్ బిల్డులను స్థానికంగా ధృవీకరించండి
docker build -t test ./src
```

### API అందుబాటులో లేదు

```bash
# ingress బాహ్యంగా ఉందని నిర్ధారించండి
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### ప్రతిస్పందన సమయాలు ఎక్కువగా ఉన్నాయి

```bash
# CPU/మెమరీ వినియోగాన్ని తనిఖీ చేయండి
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# అవసరమైతే వనరులను పెంచండి
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## శుభ్రం చేయడం

```bash
# అన్ని వనరులను తొలగించండి
azd down --force --purge
```

## తదుపరి దశలు

### ఈ ఉదాహరణని విస్తరించండి

1. **డేటాబేస్ జోడించండి** - Azure Cosmos DB లేదా SQL Database ని ఇంటిగ్రేట్ చేయండి
   ```bash
   # infra/main.bicepలో Cosmos DB మాడ్యూల్ జోడించండి
   # app.pyను డేటాబేస్ కనెక్షన్‌తో నవీకరించండి
   ```

2. **అథెంటికేషన్ జోడించండి** - Azure AD లేదా API కీలు అమలు చేయండి
   ```python
   # app.pyకి ప్రామాణీకరణ మిడిల్వేర్ జోడించండి
   from functools import wraps
   ```

3. **CI/CD సెట్ చేయండి** - GitHub Actions వర్క్ఫ్లో
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Managed Identity జోడించండి** - Azure సేవలకు సురక్షిత ప్రాప్తి
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### సంబంధించిన ఉదాహరణలు

- **[డేటాబేస్ యాప్](../../../../../examples/database-app)** - SQL డేటాబేస్‌తో పూర్తి ఉదాహరణ
- **[Microservices](../../../../../examples/container-app/microservices)** - బహుళ-సర్వీస్ ఆర్కిటెక్చర్
- **[Container Apps Master Guide](../README.md)** - అన్ని కంటైనర్ నమూనాలు

### అభ్యాస వనరులు

- 📚 [AZD For Beginners Course](../../../README.md) - ప్రధాన కోర్సు హోమ్
- 📚 [Container Apps Patterns](../README.md) - మరిన్ని డిప్లాయ్‌మెంట్ నమూనాలు
- 📚 [AZD Templates Gallery](https://azure.github.io/awesome-azd/) - సముదాయ టెంప్లేట్లు

## అదనపు వనరులు

### డాక్యుమెంటేషన్
- **[Flask Documentation](https://flask.palletsprojects.com/)** - Flask ఫ్రేమ్‌వర్క్ గైడ్
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - అధికారిక Azure డాక్స్
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd కమాండ్ సూచిక

### ట్యుటోరియల్స్
- **[Container Apps Quickstart](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - మీ మొదటి యాప్‌ను డిప్లాయ్ చేయండి
- **[Python on Azure](https://learn.microsoft.com/azure/developer/python/)** - Python అభివృద్ధి గైడ్
- **[Bicep Language](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infrastructure as code

### టూల్స్
- **[Azure Portal](https://portal.azure.com)** - వనరుల‌ను విజువల్‌గా నిర్వహించండి
- **[VS Code Azure Extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - IDE ఇంటిగ్రేషన్

---

**🎉 అభినందనలు!** మీరు ఆటో-స్కేలింగ్ మరియు మానిటరింగ్ తో Azure Container Apps లో ప్రొడక్షన్-రెడీ Flask APIని డిప్లాయ్ చేశారు.

**ప్రశ్నలు?** [ఇష్యూ ఓపెన్ చేయండి](https://github.com/microsoft/AZD-for-beginners/issues) లేదా [FAQ](../../../resources/faq.md) ని చూడండి

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
డిస్క్లైమర్:
ఈ డాక్యుమెంట్‌ను ఏఐ అనువాద సేవ అయిన [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించారు. మేము ఖచ్చితత్వానికి ప్రయత్నిస్తున్నప్పటికీ, స్వయంచాలక అనువాదాల్లో తప్పులు లేదా అపరిశుద్ధతలు ఉండొచ్చు. దాని స్వదేశీ భాషలో ఉన్న అసలు (మూల) డాక్యుమెంట్నే ప్రామాణిక మూలంగా తీసుకోవాలి. ముఖ్యమైన సమాచారానికి, నిపుణులైన మానవ అనువాదకులచే అనువాదం చేయించుకోవాలని సూచించబడుతుంది. ఈ అనువాదాన్ని ఉపయోగించడంవల్ల కలిగే ఏవైనా లేకపోయినా అర్ధం గందరగోళాలు లేదా తప్పుదోవ పట్టే అర్థాల కోసం మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->