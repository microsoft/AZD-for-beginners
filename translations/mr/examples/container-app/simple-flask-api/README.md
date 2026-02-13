# साधे Flask API - कंटेनर अ‍ॅप उदाहरण

**शिकण्याचा मार्ग:** नवीन प्रवेशकर्ता ⭐ | **वेळ:** २५-३५ मिनिटे | **खर्च:** $०-१५/महिना

एक पूर्ण, कार्यरत Python Flask REST API, Azure Container Apps मध्ये Azure Developer CLI (azd) वापरून तैनात केलेले. हे उदाहरण कंटेनर तैनात करणे, ऑटो-स्केलिंग, आणि मॉनिटरिंगची मूलभूत माहिती दाखवते.

## 🎯 तुम्हाला काय शिकायला मिळेल

- कंटेनरयुक्त Python अ‍ॅप्लिकेशन Azure वर तैनात करणे
- स्केल-टू-झीरो सह ऑटो-स्केलिंग कॉन्फिगर करणे
- हेल्थ प्रोब आणि रेडीनेस चेकची अंमलबजावणी करणे
- अ‍ॅप्लिकेशन लॉग्स आणि मेट्रिक्सचे निरीक्षण करणे
- जलद तैनातीसाठी Azure Developer CLI वापरणे

## 📦 यात काय समाविष्ट आहे

✅ **Flask अ‍ॅप्लिकेशन** - CRUD ऑपरेशन्ससह संपूर्ण REST API (`src/app.py`)  
✅ **Dockerfile** - उत्पादनासाठी तयार कंटेनर कॉन्फिगरेशन  
✅ **Bicep इन्फ्रास्ट्रक्चर** - कंटेनर अ‍ॅप्स पर्यावरण आणि API तैनाती  
✅ **AZD कॉन्फिगरेशन** - एका आदेशात तैनाती सेटअप  
✅ **हेल्थ प्रोब्स** - लाइव्हनेस आणि रेडीनेस चेक कॉन्फिगर केलेले  
✅ **ऑटो-स्केलिंग** - HTTP लोडवर आधारित ०-१० प्रतिकृती  

## आर्किटेक्चर

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

## पूर्वअट

### आवश्यक
- **Azure Developer CLI (azd)** - [इंस्टॉलेशन मार्गदर्शक](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure सदस्यता** - [मुफ्त खाते](https://azure.microsoft.com/free/)
- **Docker Desktop** - [डॉकर इंस्टॉल करा](https://www.docker.com/products/docker-desktop/) (स्थानिक चाचणीसाठी)

### पूर्वअटी तपासा

```bash
# azd आवृत्ती तपासा (1.5.0 किंवा त्यापेक्षा उच्च असणे आवश्यक आहे)
azd version

# Azure लॉगिनची पडताळणी करा
azd auth login

# Docker तपासा (ऐच्छिक, स्थानिक चाचणीसाठी)
docker --version
```

## ⏱️ तैनाती कालावधी

| टप्पा | कालावधी | काय घडते |
|-------|---------|----------||
| पर्यावरण सेटअप | ३० सेकंद | azd पर्यावरण तयार करा |
| कंटेनर तयार करा | २-३ मिनिटे | Docker वापरून Flask अ‍ॅप तयार करा |
| इन्फ्रास्ट्रक्चर पुरवा | ३-५ मिनिटे | कंटेनर अ‍ॅप्स, रजिस्ट्री, मॉनिटरिंग तयार करा |
| अ‍ॅप्लिकेशन तैनात करा | २-३ मिनिटे | इमेज पुश करा आणि कंटेनर अ‍ॅप्सवर तैनात करा |
| **एकूण** | **८-१२ मिनिटे** | पूर्ण तैनाती तयार |

## जलद प्रारंभ

```bash
# उदाहरणाकडे नेव्हिगेट करा
cd examples/container-app/simple-flask-api

# पर्यावरण प्रारंभ करा (अद्वितीय नाव निवडा)
azd env new myflaskapi

# सर्व काही तैनात करा (पायाभूत सुविधा + अनुप्रयोग)
azd up
# तुम्हाला खालील गोष्टी विचारल्या जातील:
# 1. Azure सदस्यता निवडा
# 2. स्थान निवडा (उदा., eastus2)
# 3. तैनातीसाठी 8-12 मिनिटे प्रतीक्षा करा

# तुमचा API एंडपॉइंट मिळवा
azd env get-values

# API चे परीक्षण करा
curl $(azd env get-value API_ENDPOINT)/health
```

**अपेक्षित परिणाम:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ तैनाती सत्यापित करा

### टप्पा १: तैनाती स्थिती तपासा

```bash
# तैनात केलेल्या सेवांना पहा
azd show

# अपेक्षित आउटपुट दर्शविते:
# - सेवा: api
# - एंडपॉइंट: https://ca-api-[env].xxx.azurecontainerapps.io
# - स्थिती: चालू आहे
```

### टप्पा २: API एंडपॉइंट्सची चाचणी करा

```bash
# API एंडपॉइंट मिळवा
API_URL=$(azd env get-value API_ENDPOINT)

# स्वास्थ्य तपासा
curl $API_URL/health

# रूट एंडपॉइंट तपासा
curl $API_URL/

# एक आयटम तयार करा
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# सर्व आयटम मिळवा
curl $API_URL/api/items
```

**यशस्वी निकष:**
- ✅ हेल्थ एंडपॉइंट HTTP 200 परत करतो
- ✅ रूट एंडपॉइंट API माहिती दर्शवतो
- ✅ POST नवीन आयटम तयार करतो आणि HTTP 201 परत करतो
- ✅ GET तयार केलेले आयटम परत करते

### टप्पा ३: लॉग्स पाहा

```bash
# azd monitor वापरून थेट लॉग प्रवाहित करा
azd monitor --logs

# किंवा Azure CLI वापरा:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# आपण हे पहावे:
# - Gunicorn सुरू करण्याच्या संदेश
# - HTTP विनंती लॉग
# - अनुप्रयोग माहिती लॉग
```

## प्रकल्प संरचना

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

## API एंडपॉइंट्स

| एंडपॉइंट | पद्धत | वर्णन |
|----------|--------|--------|
| `/health` | GET | हेल्थ चेक |
| `/api/items` | GET | सर्व आयटमची यादी |
| `/api/items` | POST | नवीन आयटम तयार करा |
| `/api/items/{id}` | GET | विशिष्ट आयटम मिळवा |
| `/api/items/{id}` | PUT | आयटम अपडेट करा |
| `/api/items/{id}` | DELETE | आयटम हटवा |

## कॉन्फिगरेशन

### पर्यावरण चल (Environment Variables)

```bash
# सानुकूल संरचना सेट करा
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### स्केलिंग कॉन्फिगरेशन

API ऑटोमॅटिक HTTP ट्रॅफिकवर आधारित स्केल करते:
- **किमान प्रतिकृती**: ० (ब्रेकवर असताना झीरोपर्यंत स्केल होते)
- **कमाल प्रतिकृती**: १०
- **प्रतिकृती प्रति समकालीन विनंती**: ५०

## विकास

### स्थानिकपणे चालवा

```bash
# अवलंबित्व स्थापित करा
cd src
pip install -r requirements.txt

# ॲप चालवा
python app.py

# स्थानिकरीत्या चाचणी करा
curl http://localhost:8000/health
```

### कंटेनर तयार करा आणि चाचणी करा

```bash
# Docker इमेज तयार करा
docker build -t flask-api:local ./src

# कंटेनर स्थानिकरित्या चालवा
docker run -p 8000:8000 flask-api:local

# कंटेनर चाचणी करा
curl http://localhost:8000/health
```

## तैनाती

### पूर्ण तैनाती

```bash
# पायाभूत सुविधा आणि अनुप्रयोग स्थापित करा
azd up
```

### फक्त कोड तैनात करा

```bash
# फक्त अनुप्रयोग कोड तैनात करा (पायाभूत सुविधा अपरिवर्तित)
azd deploy api
```

### कॉन्फिगरेशन अद्यतनित करा

```bash
# पर्यावरणातील चलन अद्ययावत करा
azd env set API_KEY "new-api-key"

# नवीन संरचनेसह पुन्हा डिप्लॉय करा
azd deploy api
```

## निरीक्षण

### लॉग्स पाहा

```bash
# azd monitor वापरून थेट लॉग प्रवाहित करा
azd monitor --logs

# किंवा कंटेनर ॲपसाठी Azure CLI वापरा:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# शेवटचे १०० ओळी पहा
az containerapp logs show --name api --resource-group $RG_NAME --tail 100
```

### मेट्रिक्सचे निरीक्षण करा

```bash
# Azure Monitor डॅशबोर्ड उघडा
azd monitor --overview

# विशिष्ट मेट्रिक्स पहा
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## चाचणी

### हेल्थ चेक

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

अपेक्षित प्रतिसाद:
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### आयटम तयार करा

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### सर्व आयटम मिळवा

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## खर्च ऑप्टिमायझेशन

ही तैनाती स्केल-टू-झीरो वापरते, त्यामुळे तुम्ही फक्त API विनंत्या प्रक्रियेत असतानाच पैसे देता:

- **ब्रेकवरील खर्च**: ~$०/महिना (झीरोपर्यंत स्केल)
- **सक्रिय खर्च**: ~$०.००००२४/सेकंद प्रति प्रतिकृती
- **अपेक्षित मासिक खर्च** (हलक्या वापरासाठी): $५-१५

### खर्च अधिक कमी करा

```bash
# विकासासाठी जास्तीत जास्त प्रत्तिके कमी करा
azd env set MAX_REPLICAS 3

# कमी कालावधीचा निष्क्रिय वेळ वापरा
azd env set SCALE_TO_ZERO_TIMEOUT 300  # ५ मिनिटे
```

## समस्या निवारण

### कंटेनर सुरू होत नाही

```bash
# Azure CLI वापरून कंटेनर लॉग तपासा
az containerapp logs show --name api --resource-group $RG_NAME --tail 100

# स्थानिकपणे Docker इमेज बिल्डिंगची पुष्टी करा
docker build -t test ./src
```

### API प्रवेशयोग्य नाही

```bash
# इनग्रेस बाह्य आहे का ते तपासा
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### प्रतिसाद वेळ जास्त आहे

```bash
# CPU/मेमरी वापर तपासा
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# आवश्यक असल्यास संसाधने वाढवा
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## स्वच्छ करा

```bash
# सर्व स्रोत हटवा
azd down --force --purge
```

## पुढील पावले

### हा उदाहरण वाढवा

१. **डाटाबेस जोडा** - Azure Cosmos DB किंवा SQL Database एकत्र करा  
   ```bash
   # infra/main.bicep मध्ये Cosmos DB मॉड्यूल जोडा
   # app.py मध्ये डेटाबेस कनेक्शन अपडेट करा
   ```
  
२. **प्रमाणीकरण जोडा** - Azure AD किंवा API कीज लागू करा  
   ```python
   # app.py मध्ये प्रमाणीकरण मिडलवेअर जोडा
   from functools import wraps
   ```
  
३. **CI/CD सेट करा** - GitHub Actions वर्कफ्लो  
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```
  
४. **मॅनेज्ड आयडेंटिटी जोडा** - Azure सेवा सुरक्षित प्रवेशासाठी  
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```
  
### संबंधित उदाहरणे

- **[Database App](../../../../../examples/database-app)** - SQL Database सह संपूर्ण उदाहरण  
- **[Microservices](../../../../../examples/container-app/microservices)** - बहु-सेवा आर्किटेक्चर  
- **[Container Apps Master Guide](../README.md)** - सर्व कंटेनर पॅटर्न  

### शिकण्याचे साधन

- 📚 [नवीन प्रवेशकांसाठी AZD कोर्स](../../../README.md) - मुख्य कोर्स होम  
- 📚 [Container Apps पॅटर्न](../README.md) - अधिक तैनाती पॅटर्न  
- 📚 [AZD टेम्पलेट्स गॅलरी](https://azure.github.io/awesome-azd/) - समुदायाचे टेम्पलेट्स  

## अतिरिक्त साधनसामग्री

### दस्तऐवज
- **[Flask दस्तऐवज](https://flask.palletsprojects.com/)** - Flask फ्रेमवर्क मार्गदर्शक  
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - अधिकृत Azure दस्तऐवज  
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd आदेश संदर्भ  

### मार्गदर्शक
- **[Container Apps Quickstart](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - तुमचे पहिले अ‍ॅप तैनात करा  
- **[Azure वर Python](https://learn.microsoft.com/azure/developer/python/)** - Python विकास मार्गदर्शक  
- **[Bicep भाषा](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - इनफ्रास्ट्रक्चर एज़ कोड  

### साधने
- **[Azure पोर्टल](https://portal.azure.com)** - दृश्यात्मक संसाधन व्यवस्थापन  
- **[VS Code Azure विस्तार](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - IDE एकत्रीकरण  

---

**🎉 अभिनंदन!** तुम्ही उत्पादनासाठी तयार Flask API Azure Container Apps मध्ये ऑटो-स्केलिंग व मॉनिटरिंगसह तैनात केले आहे.

**प्रश्न आहेत?** [इश्यु उघडा](https://github.com/microsoft/AZD-for-beginners/issues) किंवा [वारंवार विचारले जाणारे प्रश्न](../../../resources/faq.md) तपासा.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून अनुवादित केला आहे. आम्ही अचूकतेसाठी प्रयत्नशील असतो, तरी कृपया लक्षात ठेवा की स्वयंचलित अनुवादांमध्ये चुका किंवा अपूर्णता असू शकते. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत मानला जाणे आवश्यक आहे. महत्त्वाच्या माहितीसाठी व्यावसायिक मानवी अनुवाद घेणे शिफारसीय आहे. या अनुवादाच्या वापरामुळे होणाऱ्या कोणत्याही गैरसमजुती किंवा चुकीच्या अर्थलाघवांसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->