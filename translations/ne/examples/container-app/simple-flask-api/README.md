# सरल Flask API - Container App उदाहरण

**अधिगम मार्ग:** शुरुवाती ⭐ | **समय:** 25-35 मिनट | **लागत:** $0-15/महिना

azd (Azure Developer CLI) प्रयोग गरेर Azure Container Apps मा डिप्लोय गरिएको पूर्ण, काम गर्ने Python Flask REST API। यो उदाहरण कन्टेनर डिप्लोयमेन्ट, स्वचालित स्केलिङ, र मोनिटरिङका आधारभूत कुराहरू देखाउँछ।

## 🎯 तपाईंले के सिक्नुहुनेछ

- Azure मा कन्टेनराइज्ड Python एप्लिकेसन डिप्लोय गर्ने
- scale-to-zero सहित स्वचालित स्केलिङ कन्फिगर गर्ने
- हेल्थ प्रोब र रेडिनेस चेकहरू लागू गर्ने
- एप्लिकेसन लगहरू र मेट्रिक्स अनुगमन गर्ने
- छिटो डिप्लोयमेन्टका लागि Azure Developer CLI प्रयोग गर्ने

## 📦 के समावेश छ

✅ **Flask Application** - CRUD अपरेसनहरूसहित पूर्ण REST API (`src/app.py`)  
✅ **Dockerfile** - उत्पादन-तयार कन्टेनर कन्फिगरेसन  
✅ **Bicep Infrastructure** - Container Apps वातावरण र API डिप्लोयमेन्ट  
✅ **AZD Configuration** - एक कमाण्ड डिप्लोयमेन्ट सेटअप  
✅ **Health Probes** - लिभनेस र रेडिनेस चेकहरू कन्फिगर गरिएका  
✅ **Auto-scaling** - HTTP लोडको आधारमा 0-10 रेप्लिकासम्म

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

## पूर्वआवश्यकताहरू

### आवश्यक
- **Azure Developer CLI (azd)** - [स्थापना मार्गदर्शन](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure subscription** - [निःशुल्क खाता](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Install Docker](https://www.docker.com/products/docker-desktop/) (स्थानीय परीक्षणको लागि)

### पूर्वआवश्यकताहरू जाँच गर्नुहोस्

```bash
# azd संस्करण जाँच गर्नुहोस् (आवश्यक 1.5.0 वा माथि)
azd version

# Azure लगइन प्रमाणित गर्नुहोस्
azd auth login

# Docker जाँच गर्नुहोस् (वैकल्पिक, स्थानीय परीक्षणको लागि)
docker --version
```

## ⏱️ डिप्लोयमेन्ट टाइमलाइन

| अवस्था | अवधि | के हुन्छ |
|-------|----------|--------------||
| Environment setup | 30 seconds | azd वातावरण सिर्जना गर्नुहोस् |
| Build container | 2-3 minutes | Docker build Flask एप |
| Provision infrastructure | 3-5 minutes | Container Apps, registry, मोनिटरिङ सिर्जना गर्नुहोस् |
| Deploy application | 2-3 minutes | इमेज पुश गरी Container Apps मा डिप्लोय गर्नुहोस् |
| **कुल** | **8-12 minutes** | डिप्लोयमेन्ट पूरा र तयार |

## छिटो सुरु

```bash
# उदाहरणमा जानुहोस्
cd examples/container-app/simple-flask-api

# पर्यावरण आरम्भ गर्नुहोस् (एक अद्वितीय नाम छान्नुहोस्)
azd env new myflaskapi

# सबै तैनाथ गर्नुहोस् (पूर्वाधार + अनुप्रयोग)
azd up
# तपाईंलाई सोधिनेछ:
# 1. Azure सदस्यता छान्नुहोस्
# 2. स्थान छान्नुहोस् (जस्तै, eastus2)
# 3. तैनाथीकरणका लागि 8-12 मिनेट प्रतीक्षा गर्नुहोस्

# आफ्नो API अन्तबिन्दु प्राप्त गर्नुहोस्
azd env get-values

# API परीक्षण गर्नुहोस्
curl $(azd env get-value API_ENDPOINT)/health
```

**अपेक्षित आउटपुट:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ डिप्लोयमेन्ट जाँच गर्नुहोस्

### चरण 1: डिप्लोयमेन्ट स्थिति जाँच गर्नुहोस्

```bash
# डिप्लोय गरिएका सेवाहरू हेर्नुहोस्
azd show

# अपेक्षित आउटपुटले देखाउँछ:
# - सेवा: api
# - एन्डपोइन्ट: https://ca-api-[env].xxx.azurecontainerapps.io
# - स्थिति: चलिरहेको
```

### चरण 2: API एन्डपोइन्टहरू परीक्षण गर्नुहोस्

```bash
# API एन्डपोइन्ट प्राप्त गर्नुहोस्
API_URL=$(azd env get-value API_ENDPOINT)

# स्वास्थ्य परीक्षण गर्नुहोस्
curl $API_URL/health

# मूल एन्डपोइन्ट परीक्षण गर्नुहोस्
curl $API_URL/

# एक वस्तु सिर्जना गर्नुहोस्
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# सबै वस्तुहरू प्राप्त गर्नुहोस्
curl $API_URL/api/items
```

**सफलताका मापदण्ड:**
- ✅ Health endpoint ले HTTP 200 फर्काउँछ
- ✅ Root endpoint ले API जानकारी देखाउँछ
- ✅ POST ले आइटम सिर्जना गर्छ र HTTP 201 फर्काउँछ
- ✅ GET ले सिर्जना गरिएका आइटमहरू फर्काउँछ

### चरण 3: लगहरू हेर्नुहोस्

```bash
# azd monitor प्रयोग गरेर प्रत्यक्ष लगहरू स्ट्रिम गर्नुहोस्
azd monitor --logs

# वा Azure CLI प्रयोग गर्नुहोस्:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# तपाईंले यी देख्नुहुनेछ:
# - Gunicorn सुरु हुने सन्देशहरू
# - HTTP अनुरोध लगहरू
# - अनुप्रयोग जानकारी लगहरू
```

## प्रोजेक्ट संरचना

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

## API एन्डपोइण्टहरू

| एन्डपोइण्ट | विधि | विवरण |
|----------|--------|-------------|
| `/health` | GET | स्वास्थ्य जाँच |
| `/api/items` | GET | सबै आइटमहरू सूचीबद्ध गर्नुहोस् |
| `/api/items` | POST | नयाँ आइटम सिर्जना गर्नुहोस् |
| `/api/items/{id}` | GET | विशेष आइटम प्राप्त गर्नुहोस् |
| `/api/items/{id}` | PUT | आइटम अद्यावधिक गर्नुहोस् |
| `/api/items/{id}` | DELETE | आइटम मेटाउनुहोस् |

## कन्फिगरेसन

### पर्यावरण भेरिएबलहरू

```bash
# कस्टम कन्फिगरेसन सेट गर्नुहोस्
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### स्केलिङ कन्फिगरेसन

API ले HTTP ट्राफिकको आधारमा स्वचालित रूपमा स्केल गर्छ:
- **न्यूनतम रेप्लिका**: 0 (आइडल हुँदा शून्यमा स्केल हुन्छ)
- **अधिकतम रेप्लिका**: 10
- **प्रति रेप्लिकामा समकालीन अनुरोधहरू**: 50

## विकास

### स्थानीय रूपमा चलाउनुहोस्

```bash
# निर्भरता स्थापना गर्नुहोस्
cd src
pip install -r requirements.txt

# एप चलाउनुहोस्
python app.py

# स्थानीय रूपमा परीक्षण गर्नुहोस्
curl http://localhost:8000/health
```

### कन्टेनर बिल्ड र परीक्षण गर्नुहोस्

```bash
# Docker इमेज निर्माण गर्नुहोस्
docker build -t flask-api:local ./src

# कन्टेनर स्थानीय रूपमा चलाउनुहोस्
docker run -p 8000:8000 flask-api:local

# कन्टेनर परीक्षण गर्नुहोस्
curl http://localhost:8000/health
```

## डिप्लोयमेन्ट

### पूर्ण डिप्लोयमेन्ट

```bash
# पूर्वाधार र अनुप्रयोग तैनाथ गर्नुहोस्
azd up
```

### केवल कोड डिप्लोयमेन्ट

```bash
# अनुप्रयोग कोड मात्र परिनियोजन गर्नुहोस् (पूर्वाधार अपरिवर्तित)
azd deploy api
```

### कन्फिगरेसन अद्यावधिक गर्नुहोस्

```bash
# पर्यावरण चरहरू अद्यावधिक गर्नुहोस्
azd env set API_KEY "new-api-key"

# नयाँ विन्याससहित पुनः परिनियोजन गर्नुहोस्
azd deploy api
```

## मोनिटरिङ

### लगहरू हेर्नुहोस्

```bash
# azd monitor प्रयोग गरेर प्रत्यक्ष लगहरू स्ट्रिम गर्नुहोस्
azd monitor --logs

# वा Container Apps का लागि Azure CLI प्रयोग गर्नुहोस्:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# पछिल्ला 100 लाइनहरू हेर्नुहोस्
az containerapp logs show --name api --resource-group $RG_NAME --tail 100
```

### मेट्रिक्स अनुगमन गर्नुहोस्

```bash
# Azure Monitor ड्यासबोर्ड खोल्नुहोस्
azd monitor --overview

# विशिष्ट मेट्रिकहरू हेर्नुहोस्
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## परीक्षण

### स्वास्थ्य जाँच

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

अपेक्षित प्रतिक्रिया:
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### आइटम सिर्जना गर्नुहोस्

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### सबै आइटमहरू प्राप्त गर्नुहोस्

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## लागत अनुकूलन

यस डिप्लोयमेन्टले स्केल-टु-जीरो प्रयोग गर्दछ, त्यसैले API अनुरोधहरू प्रशोधन गरिरहेको बेला मात्र तिर्नुहुन्छ:

- **आइडल लागत**: ~ $0/महिना (शून्यमा स्केल हुन्छ)
- **सक्रिय लागत**: ~ $0.000024/सेकेन्ड प्रति रेप्लिका
- **अपेक्षित मासिक लागत** (हल्का प्रयोग): $5-15

### लागत थप घटाउने तरिका

```bash
# डेभका लागि अधिकतम रेप्लिकाहरू घटाउनुहोस्
azd env set MAX_REPLICAS 3

# छोटो निष्क्रिय समयसीमा प्रयोग गर्नुहोस्
azd env set SCALE_TO_ZERO_TIMEOUT 300  # ५ मिनेट
```

## समस्या समाधान

### कन्टेनर सुरु हुँदैन

```bash
# Azure CLI प्रयोग गरेर कन्टेनरका लगहरू जाँच गर्नुहोस्
az containerapp logs show --name api --resource-group $RG_NAME --tail 100

# Docker इमेज स्थानीय रूपमा निर्माण हुन्छ कि छैन भनेर जाँच गर्नुहोस्
docker build -t test ./src
```

### API पहुँचयोग्य छैन

```bash
# ingress बाह्य छ कि छैन जाँच गर्नुहोस्
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### प्रतिक्रिया समय धेरै छ

```bash
# CPU/मेमोरी प्रयोग जाँच गर्नुहोस्
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# आवश्यक परे स्रोतहरू वृद्धि गर्नुहोस्
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## साफ गर्नुहोस्

```bash
# सबै संसाधनहरू मेटाउनुहोस्
azd down --force --purge
```

## अर्को कदमहरू

### यो उदाहरण विस्तार गर्नुहोस्

1. **डेटाबेस थप्नुहोस्** - Azure Cosmos DB वा SQL Database एकिकृत गर्नुहोस्
   ```bash
   # infra/main.bicep मा Cosmos DB मोड्युल थप्नुहोस्
   # app.py मा डेटाबेस कनेक्शन थपेर अपडेट गर्नुहोस्
   ```

2. **प्रमाणीकरण थप्नुहोस्** - Azure AD वा API कुञ्जीहरू लागू गर्नुहोस्
   ```python
   # app.py मा प्रमाणीकरण मिडलवेयर थप्नुहोस्
   from functools import wraps
   ```

3. **CI/CD सेटअप गर्नुहोस्** - GitHub Actions वर्कफ्लो
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Managed Identity थप्नुहोस्** - Azure सेवाहरूमा सुरक्षित पहुँच
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### सम्बन्धित उदाहरणहरू

- **[डाटाबेस एप](../../../../../examples/database-app)** - SQL Database सहित पूर्ण उदाहरण
- **[Microservices](../../../../../examples/container-app/microservices)** - मल्टि-सर्भिस आर्किटेक्चर
- **[Container Apps Master Guide](../README.md)** - सबै कन्टेनर प्याटर्नहरू

### अधिगम स्रोतहरू

- 📚 [AZD For Beginners Course](../../../README.md) - मुख्य कोर्स गृहपृष्ठ
- 📚 [Container Apps Patterns](../README.md) - थप डिप्लोयमेन्ट प्याटर्नहरू
- 📚 [AZD Templates Gallery](https://azure.github.io/awesome-azd/) - समुदायका टेम्प्लेटहरू

## थप स्रोतहरू

### प्रलेखन
- **[Flask Documentation](https://flask.palletsprojects.com/)** - Flask फ्रेमवर्क गाइड
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - आधिकारिक Azure कागजातहरू
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd कमाण्ड रेफरेन्स

### ट्यूटोरियलहरू
- **[Container Apps Quickstart](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - आफ्नो पहिलो एप डिप्लोय गर्नुहोस्
- **[Python on Azure](https://learn.microsoft.com/azure/developer/python/)** - Python विकास गाइड
- **[Bicep Language](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infrastructure as code

### उपकरणहरू
- **[Azure Portal](https://portal.azure.com)** - दृश्य रूपमा स्रोतहरू व्यवस्थापन गर्नुहोस्
- **[VS Code Azure Extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - IDE एकीकरण

---

**🎉 बधाई छ!** तपाईंले auto-scaling र मोनिटरिङ सहित उत्पादन-तयार Flask API Azure Container Apps मा डिप्लोय गर्नुभयो।

**प्रश्नहरू?** [एक इश्यू खोल्नुहोस्](https://github.com/microsoft/AZD-for-beginners/issues) वा [FAQ](../../../resources/faq.md) जाँच गर्नुहोस्

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यो दस्तावेज AI अनुवाद सेवा Co-op Translator (https://github.com/Azure/co-op-translator) प्रयोग गरी अनुवाद गरिएको हो। हामी शुद्धताका लागि प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटि वा अशुद्धता हुन सक्छ। मूल भाषामा रहेको दस्तावेजलाई आधिकारिक स्रोत मानिनुपर्छ। महत्त्वपूर्ण जानकारीका लागि व्यावसायिक मानवीय अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलत बुझाइ वा गलत व्याख्याका लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->