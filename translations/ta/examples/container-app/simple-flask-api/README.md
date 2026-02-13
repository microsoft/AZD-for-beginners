# எளிய Flask API - Container App உதாரணம்

**கற்றல் பாதை:** ஆரம்ப நிலை ⭐ | **நேரம்:** 25-35 நிமிடங்கள் | **செலவு:** $0-15/மாதம்

Azure Developer CLI (azd) பயன்படுத்தி Azure Container Apps-க்கு வெளியிடப்பட்ட முழுமையான, செயல்பாட்டு Python Flask REST API. இந்த உதாரணம் கன்டெய்னர் வெளியீடு, ஆட்டோ-ஸ்கேலிங் மற்றும் கண்காணிப்பு அடிப்படைகளை வடிகட்டுகிறது.

## 🎯 நீங்கள் என்ன கற்றுக்கொள்ளப்போகிறீர்கள்

- Python பயன்பாட்டை கன்டெய்னரைப் போட்டியிட்டு Azure-க்கு வெளியிடுதல்
- scale-to-zero உடன் ஆட்டோ-ஸ்கேலிங்கை அமைத்தல்
- ஆரோக்கியப் ப்ரோப்கள் மற்றும் ரெடிநெஸ் சோதனைகளை அமல்படுத்துதல்
- பயன்பாட்டின் லோக்கள் மற்றும் மெட்ரிக்ஸ்களை கண்காணித்தல்
- விரைவு வெளியீட்டிற்கு Azure Developer CLI ஐப் பயன்படுத்துதல்

## 📦 என்ன சேர்க்கப்பட்டுள்ளது

✅ **Flask Application** - CRUD செயல்பாடுகளுடன் முழுமையான REST API (`src/app.py`)  
✅ **Dockerfile** - உற்பத்திக்குத் தயாரான கன்டெய்னர் கட்டமைப்பு  
✅ **Bicep Infrastructure** - Container Apps சூழல் மற்றும் API வெளியீடு  
✅ **AZD Configuration** - ஒரே கட்டளையால் வெளியீட்டு அமைப்பு  
✅ **Health Probes** - லைவ்னெஸ் மற்றும் ரெடிநெஸ் சோதனைகள் அமைக்கப்பட்டுள்ளன  
✅ **Auto-scaling** - HTTP சுமை அடிப்படையில் 0-10 பிரதிகள்  

## கட்டமைப்பு

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

## முன்னணித் தேவைகள்

### தேவையானவை
- **Azure Developer CLI (azd)** - [நிறுவல் வழிகாட்டு](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure subscription** - [இலவச கணக்கு](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Docker ஐ நிறுவுக](https://www.docker.com/products/docker-desktop/) (உள்ளூரில் சோதனை செய்ய)

### முன்னணித் தேவைகளை சரிபார்க்கவும்

```bash
# azd பதிப்பைப் பரிசோதிக்கவும் (1.5.0 அல்லது அதற்கு மேல் தேவை)
azd version

# Azure உள்நுழைவை சரிபார்க்கவும்
azd auth login

# Docker ஐ பரிசோதிக்கவும் (அவசியம் இல்லை — உள்ளூர் சோதனைக்காக)
docker --version
```

## ⏱️ வெளியீட்டு நேர அட்டவணை

| பகுதி | காலம் | நடைபெறும் செயல்பாடு |
|-------|----------|--------------||
| சூழல் அமைப்பு | 30 seconds | azd சூழலை உருவாக்கவும் |
| கன்டெய்னர் கட்டமை | 2-3 minutes | Docker மூலம் Flask பயன்பாட்டை கட்டமைக்கவும் |
| அடிபணியை வழங்குதல் | 3-5 minutes | Container Apps, registry, monitoring ஆகியவற்றை உருவாக்கவும் |
| பயன்பாட்டை வெளியிடுதல் | 2-3 minutes | படத்தை தள்ளி Container Apps-க்கு வெளியிடவும் |
| **மொத்தம்** | **8-12 minutes** | முழு வெளியீடு தயாராக உள்ளது |

## விரைவு தொடக்கம்

```bash
# உதாரணத்திற்குச் செல்லவும்
cd examples/container-app/simple-flask-api

# சூழலை ஆரம்பிக்கவும் (தனித்துவமான பெயரை தேர்ந்தெடுக்கவும்)
azd env new myflaskapi

# எல்லாவற்றையும் பணியிடவும் (அடித்தள அமைப்பு + பயன்பாடு)
azd up
# உங்களிடம் கேட்கப்படும்:
# 1. Azure சந்தாவை தேர்ந்தெடுக்கவும்
# 2. இடத்தை தேர்ந்தெடுக்கவும் (உதாரணமாக, eastus2)
# 3. பணியிடுவதற்கு 8-12 நிமிடங்கள் காத்திருக்கவும்

# உங்கள் API இடைமுக முகவரியைப் பெறவும்
azd env get-values

# உங்கள் API-ஐ சோதிக்கவும்
curl $(azd env get-value API_ENDPOINT)/health
```

**எதிர்பார்க்கப்படும் வெளியீடு:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ வெளியீட்டை சரிபார்க்கவும்

### படி 1: வெளியீட்டு நிலையை சரிபார்க்கவும்

```bash
# பதிவேற்றப்பட்ட சேவைகளைப் பார்க்கவும்
azd show

# எதிர்பார்க்கப்படும் வெளியீடு:
# - சேவை: api
# - என்ட்பாயிண்ட்: https://ca-api-[env].xxx.azurecontainerapps.io
# - நிலை: இயங்குகிறது
```

### படி 2: API எண்ட்பாயிண்டுகளை சோதிக்கவும்

```bash
# API இடைமுகத்தைப் பெறவும்
API_URL=$(azd env get-value API_ENDPOINT)

# ஹெல்த் சோதனை
curl $API_URL/health

# மூல எண்ட்பாயிண்ட் சோதனை
curl $API_URL/

# ஒரு பொருளை உருவாக்கவும்
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# அனைத்து பொருட்களையும் பெறவும்
curl $API_URL/api/items
```

**வெற்றி நிபந்தனைகள்:**
- ✅ Health எண்ட்பாயிண்ட் HTTP 200 ஐ திருப்பும்
- ✅ ரூட் எண்ட்பாயிண்ட் API பற்றிய தகவலைக் காட்டுகிறது
- ✅ POST புதிய பொருளை உருவாக்கி HTTP 201 ஐ திருப்பும்
- ✅ GET உருவாக்கப்பட்ட பொருட்களை திருப்பும்

### படி 3: லோக்களைப் பார்க்கவும்

```bash
# azd monitor பயன்படுத்தி நேரடி லாக்களை ஸ்ட்ரீம் செய்யவும்
azd monitor --logs

# அல்லது Azure CLI-ஐ பயன்படுத்தவும்:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# நீங்கள் காணலாம்:
# - Gunicorn துவக்க செய்திகள்
# - HTTP கோரிக்கை பதிவுகள்
# - பயன்பாட்டு தகவல் பதிவுகள்
```

## திட்ட அமைப்பு

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

## API எண்ட்பாயிண்டுகள்

| எண்ட்பாயிண்ட் | முறை | விளக்கம் |
|----------|--------|-------------|
| `/health` | GET | சேவை நிலைச் சோதனை |
| `/api/items` | GET | அனைத்து பொருட்களையும் பட்டியலிடு |
| `/api/items` | POST | புதிய பொருளை உருவாக்கு |
| `/api/items/{id}` | GET | குறிப்பிட்ட பொருளைப் பெறு |
| `/api/items/{id}` | PUT | பொருள் புதுப்பி |
| `/api/items/{id}` | DELETE | பொருளை நீக்கு |

## கட்டமைப்பு

### சூழல் மாறிகள்

```bash
# தனிப்பயன் கட்டமைப்பை அமைக்கவும்
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### ஸ்கேலிங் கட்டமைப்பு

API HTTP போக்கினைப் பொறுத்து தானாகவே அளவை மாற்றும்:
- **குறைந்தபட்ச பிரதிகள்**: 0 (ஏற்பனை இல்லாதபோது ஜீரோ வரை குறையும்)
- **அதிகபட்ச பிரதிகள்**: 10
- **ஒவ்வொரு பிரதிக்கும் ஒரேநேர கோரிக்கைகள்**: 50

## வளர்ச்சி

### உள்ளூரில் இயக்குதல்

```bash
# தேவையான சார்புகளை நிறுவவும்
cd src
pip install -r requirements.txt

# செயலியை இயக்கவும்
python app.py

# உள்ளூர் சோதனை செய்யவும்
curl http://localhost:8000/health
```

### கன்டெய்னரை கட்டவும் மற்றும் சோதிக்கவும்

```bash
# Docker இமேஜை உருவாக்கவும்
docker build -t flask-api:local ./src

# கொண்டெய்னரை உள்ளூரில் இயக்கவும்
docker run -p 8000:8000 flask-api:local

# கொண்டெய்னரை சோதிக்கவும்
curl http://localhost:8000/health
```

## வெளியீடு

### முழு வெளியீடு

```bash
# உள்கட்டமைப்பையும் பயன்பாட்டையும் அமர்த்தவும்
azd up
```

### குறியீடு மட்டுமே வெளியீடு

```bash
# பயன்பாட்டு குறியீட்டையே மட்டுமே வெளியிடவும் (அடித்தளம் மாற்றமின்றி)
azd deploy api
```

### கட்டமைப்பை புதுப்பிக்கவும்

```bash
# சூழல் மாறிலிகளை புதுப்பிக்கவும்
azd env set API_KEY "new-api-key"

# புதிய கட்டமைப்புடன் மறுபதிவேற்றவும்
azd deploy api
```

## கண்காணிப்பு

### லோக்களைப் பார்க்கவும்

```bash
# azd monitor ஐப் பயன்படுத்தி நேரடி பதிவுகளை ஸ்ட்ரீம் செய்யவும்
azd monitor --logs

# அல்லது Container Apps க்கான Azure CLI ஐப் பயன்படுத்தவும்:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# கடைசி 100 வரிகளைப் காண்க
az containerapp logs show --name api --resource-group $RG_NAME --tail 100
```

### மெட்ரிக்ஸ்களை கண்காணிக்கவும்

```bash
# Azure Monitor டாஷ்போர்டை திறக்கவும்
azd monitor --overview

# குறிப்பிட்ட அளவுகோல்களைப் பார்க்கவும்
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## சோதனை

### ஆரோக்கிய சோதனை

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

எதிர்பார்க்கப்படும் பதில்:
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### பொருள் உருவாக்குதல்

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### அனைத்து பொருட்களின் பெறல்

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## செலவு மேம்படுத்தல்

இந்த வெளியீடு scale-to-zero ஐப் பயன்படுத்துகிறது, ஆகவே API கோரிக்கைகளை செயலாக்கும் போது மட்டுமே நீங்கள் கட்டணம் செலுத்துவீர்கள்:

- **ஈடுபாட்டு இல்லாத போது செலவு**: ~$0/மாதம் (ஜீரோ வரை ஸ்கேல் செய்யப்படுகிறது)
- **செயலில் இருக்கும் போது செலவு**: ~$0.000024/நொடிக்கு ஒரு பிரதிக்கு
- **எதிர்பார்க்கப்படும் மாத செலவு** (இலகு பயன்பாடு): $5-15

### செலவுகளை மேலும் குறைக்க

```bash
# dev-க்கான அதிகபட்ச நகல்களை குறைக்கவும்
azd env set MAX_REPLICAS 3

# செயலற்ற காலாவதியை குறைவாக அமைக்கவும்
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 நிமிடங்கள்
```

## பிழைதிருத்தம்

### கன்டெய்னர் தொடங்கவில்லை

```bash
# கன்டெய்னர் லாக்களை Azure CLI மூலம் சரிபார்க்கவும்
az containerapp logs show --name api --resource-group $RG_NAME --tail 100

# Docker இமேஜ் உள்ளூரில் கட்டப்படுகிறதா என்பதை சரிபார்க்கவும்
docker build -t test ./src
```

### API அணுகமுடியவில்லை

```bash
# இன்கிரெஸ் வெளிப்புறமாக உள்ளதா என்பதை சரிபார்க்கவும்
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### பதில் நேரங்கள் அதிகமாக இருக்கிறது

```bash
# CPU/நினைவக பயன்பாட்டை சரிபாரிக்கவும்
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# தேவையானால் வளங்களை அதிகரிக்கவும்
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## சுத்திகரிப்பு

```bash
# எல்லா வளங்களையும் அழிக்கவும்
azd down --force --purge
```

## அடுத்த படிகள்

### இந்த உதாரணத்தை விரிவாக்கவும்

1. **தரவுத்தளத்தை சேர்க்கவும்** - Azure Cosmos DB அல்லது SQL Database ஐ ஒருங்கிணைக்கவும்
   ```bash
   # infra/main.bicep-இல் Cosmos DB தொகுதியைச் சேர்க்க
   # app.py-ஐ தரவுத்தள இணைப்புடன் புதுப்பிக்க
   ```

2. **அங்கீகாரத்தை சேர்க்கவும்** - Azure AD அல்லது API விசைகளை செயல்படுத்தவும்
   ```python
   # app.py-க்கு அங்கீகார மிடில்வேர் சேர்க்கவும்
   from functools import wraps
   ```

3. **CI/CD ஐ அமைக்கவும்** - GitHub Actions வேலை ஓட்டம்
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Managed Identity ஐச் சேர்க்கவும்** - Azure சேவைகளுக்கு பாதுகாப்பான அணுகலை அமைக்கவும்
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### சார்ந்த உதாரணங்கள்

- **[தரவுத்தள பயன்பாடு](../../../../../examples/database-app)** - SQL Database உடன் முழுமையான உதாரணம்
- **[மைக்ரோசர்வீசஸ்](../../../../../examples/container-app/microservices)** - பல சேவைகளைக் கொண்ட கட்டமைப்பு
- **[Container Apps மாஸ்டர் கையேடு](../README.md)** - அனைத்து கன்டெய்னர் மாதிரிகள்

### கற்றல் ஆதாரங்கள்

- 📚 [AZD தொடக்கப் பாடநெறி](../../../README.md) - முதற்கட்ட பாடநெறி முகப்பு
- 📚 [Container Apps மாதிரிகள்](../README.md) - மேலும் வெளியீட்டு மாதிரிகள்
- 📚 [AZD Templates Gallery](https://azure.github.io/awesome-azd/) - சமூக டெம்ப்ளேட்டுகள்

## கூடுதல் ஆதாரங்கள்

### ஆவணங்கள்
- **[Flask Documentation](https://flask.palletsprojects.com/)** - Flask கட்டமைப்பு வழிகாட்டி
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - அதிகாரப்பூர்வ Azure ஆவணங்கள்
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd கட்டளை குறிப்பு

### பயிற்சிகள்
- **[Container Apps Quickstart](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - உங்கள் முதலாம் பயன்பாட்டை வெளியிடுக
- **[Python on Azure](https://learn.microsoft.com/azure/developer/python/)** - Python வளர்ச்சி வழிகாட்டி
- **[Bicep Language](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - கோடாக அடிப்படை அமைப்பு

### கருவிகள்
- **[Azure Portal](https://portal.azure.com)** - வளங்களை காட்சியமைப்பில் நிர்வகிக்கவும்
- **[VS Code Azure Extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - IDE ஒருங்கிணைப்பு

---

**🎉 வாழ்த்துகள்!** நீங்கள் ஆட்டோ-ஸ்கேலிங் மற்றும் கண்காணிப்புடன் Azure Container Apps-க்கு தயாரான Flask API ஐ வெளியிட்டுள்ளீர்கள்.

**கேள்விகள்?** [Open an issue](https://github.com/microsoft/AZD-for-beginners/issues) அல்லது [FAQ](../../../resources/faq.md) ஐப் பார்க்கவும்

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
மறுப்பு அறிக்கை:
இந்த ஆவணம் செயற்கை நுண்ணறிவு மொழிபெயர்ப்பு சேவையான [Co-op Translator](https://github.com/Azure/co-op-translator) மூலம் மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சித்தாலும், தன்னிச்சையாக செய்யப்படும் மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறான விளக்கங்கள் இருக்கலாம் என்பதை தயவுசெய்து உணருங்கள். முதன்மை மொழியில் உள்ள அசல் ஆவணம் அதிகாரபூர்வ மூலமாகக் கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்பை பரிந்துரைக்கிறோம். இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதின் மூலம் ஏற்படும் எந்தவொரு தவறாகப் புரிதலுக்கோ அல்லது தவறான விளக்கத்திற்கோ நாங்கள் பொறுப்பேற்கமாட்டோம்.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->