# எடுத்துக்காட்டு - நடைமுறை AZD வார்ப்புருக்கள் மற்றும் கட்டமைப்புகள்

**உதாரணங்களின் மூலம் கற்பது - அத்தியாயப்படி ஒழுங்குபடுத்தப்பட்டது**
- **📚 பாடநூல் முகப்பு**: [AZD For Beginners](../README.md)
- **📖 அத்தியாய மாப்பிங்**: கற்றல் சிக்கல்திறன் அடிப்படையில் ஒழுங்குபடுத்தப்பட்ட எடுத்துக்காட்டுகள்
- **🚀 உள்ளூர் எடுத்துக்காட்டு**: [Retail Multi-Agent Solution](retail-scenario.md)
- **🤖 வெளி AI எடுத்துக்காட்டுகள்**: Azure Samples களஞ்சியங்களுக்கு இணைப்புகள்

> **📍 முக்கியம்: உள்ளூர் vs வெளியே உள்ள எடுத்துக்காட்டுகள்**  
> இந்த களஞ்சியம் முழுமையாக அமல்படுத்தப்பட்டுள்ள **4 முழுமையான உள்ளூர் எடுத்துக்காட்டுகளை** கொண்டுள்ளது:  
> - **Azure OpenAI Chat** (பேச்சு இடைமுகத்துடன் GPT-4 உருவாக்கம்)  
> - **Container Apps** (எளிய Flask API + மைக்ரோசேவைகள்)  
> - **Database App** (வலை + SQL தரவுத்தளம்)  
> - **Retail Multi-Agent** (எளிய நிறுவன AI தீர்வு)  
>  
> கூடுதலாக சில எடுத்துக்காட்டுகள் **வெளிப்புற குறிப்புகள்** ஆகும், அவை Azure-Samples களஞ்சியங்களுக்கு இணைக்கப்பட்டிருக்கின்றன, நீங்கள் அவற்றை clone செய்யலாம்.

## அறிமுகம்

இந்த அடைவு Azure Developer CLI-ஐ செயலில் கற்று கொள்ள உதவும் நடைமுறை எடுத்துக்காட்டுகள் மற்றும் குறிப்பு தொடர்புகளை வழங்குகிறது. Retail Multi-Agent காட்சி இந்த களஞ்சியத்தில் அடங்கிய முழுமையான, உற்பத்திக்கு-தயாரான அமல்படுத்தல் ஆகும். கூடுதல் எடுத்துக்காட்டுகள் பல்வேறு AZD முறைமைகளை எடுத்துகாட்டும் அதிகாரபூர்வ Azure Samples களஞ்சியங்களை குறிப்பிட்டு உள்ளன.

### சிக்கல்திறன் மதிப்பீட்டு விளக்கு

- ⭐ **தொடக்க நிலை** - அடிப்படைக் கருத்துகள், ஒரு சேவை, 15-30 நிமிடங்கள்
- ⭐⭐ **மத்திய நிலை** - பல சேவைகள், தரவுத்தள ஒருங்கிணைப்பு, 30-60 நிமிடங்கள்
- ⭐⭐⭐ **மேம்பட்ட நிலை** - சிக்கலான கட்டமைப்பு, AI ஒருங்கிணைப்பு, 1-2 மணி நேரம்
- ⭐⭐⭐⭐ **வல்லுநர்** - உற்பத்தி-தயாரான, நிறுவன முறைமைகள், 2+ மணி நேரம்

## 🎯 இந்த களஞ்சியத்தில் உண்மையில் என்ன உள்ளது

### ✅ உள்ளூர் அமல்படுத்தல் (பயன்பாடு தயாராக)

#### [Azure OpenAI Chat Application](azure-openai-chat/README.md) 🆕
**இந்த ரெப்போவில் சேர்க்கப்பட்டுள்ள பேச்சு இடைமுகத்துடன் முழுமையான GPT-4 உருவாக்கம்**

- **இடம்:** `examples/azure-openai-chat/`
- **சிக்கல்திறன்:** ⭐⭐ (மத்திய நிலை)
- **என்ன அடங்கியுள்ளது:**
  - முழுமையான Azure OpenAI உருவாக்கம் (GPT-4)
  - Python கட்டளை வரிசை பேச்சு இடைமுகம்
  - பாதுகாப்பான API விசைகளுக்கான Key Vault ஒருங்கிணைப்பு
  - Bicep கீழமைவர்த்தக வார்ப்புருக்கள்
  - டோக்கன் பயன்பாடு மற்றும் செலவு கண்காணிப்பு
  - விகித வரம்பு மற்றும் பிழை கையாள்தல்

**தைவக்க தொடக்கம்:**
```bash
# உதாரணத்திற்குச் செல்லவும்
cd examples/azure-openai-chat

# எல்லாவற்றையும் வெளியிடவும்
azd up

# தேவையான சார்புகளை நிறுவி உரையாடலைத் தொடங்கவும்
pip install -r src/requirements.txt
python src/chat.py
```

**தொழில்நுட்பங்கள்:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Container App Examples](container-app/README.md) 🆕
**இந்த ரெப்போவில் உள்ள விரிவான கன்டெய்னர் அமல்படுத்தல் எடுத்துக்காட்டுகள்**

- **இடம்:** `examples/container-app/`
- **சிக்கல்திறன்:** ⭐-⭐⭐⭐⭐ (தொடக்க நிலை முதல் மேம்பட்ட வரை)
- **என்ன அடங்கியுள்ளது:**
  - [மாஸ்டர் கையேடு](container-app/README.md) - கன்டெய்னர் அமல்படுத்தல்களின் முழுமை பார்வை
  - [எளிய Flask API](../../../examples/container-app/simple-flask-api) - அடிப்படை REST API எடுத்துக்காட்டு
  - [மைக்ரோசேவைகள் கட்டமைப்பு](../../../examples/container-app/microservices) - உற்பத்திக்கு-தயாரான பல சேவை அமல்படுத்தல்
  - துவக்க வழிகாட்டி, உற்பத்தி மற்றும் மேம்பட்ட முறைமைகள்
  - கண்காணிப்பு, பாதுகாப்பு, மற்றும் செலவு tốiமீன்

**தைவக்க தொடக்கம்:**
```bash
# மாஸ்டர் வழிகாட்டியை பார்க்க
cd examples/container-app

# எளிய Flask API-ஐ நிறுவு
cd simple-flask-api
azd up

# மைக்க்ரோசேவைகள் உதாரணத்தை நிறுவு
cd ../microservices
azd up
```

**தொழில்நுட்பங்கள்:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent Solution](retail-scenario.md) 🆕
**இந்த ரெப்போவில் சேர்க்கப்பட்டுள்ள முழுமையான உற்பத்தி-தயாரான அமல்படுத்தல்**

- **இடம்:** `examples/retail-multiagent-arm-template/`
- **சிக்கல்திறன்:** ⭐⭐⭐⭐ (மேம்பட்ட)
- **என்ன அடங்கியுள்ளது:**
  - முழுமையான ARM உருவாக்க வார்ப்புரு
  - பல-ஏஜென்ட் கட்டமைப்பு (வாடிக்கையாளர் + சரக்கு)
  - Azure OpenAI ஒருங்கிணைப்பு
  - RAG உடன் AI தேடல்
  - விரிவான கண்காணிப்பு
  - ஒரு கிளிக்கில் உருவாக்கும் ஸ்கிரிப்ட்

**தைவக்க தொடக்கம்:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**தொழில்நுட்பங்கள்:** Azure OpenAI, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 வெளிப்புற Azure எடுத்துக்காட்டுகள் (பயன்பாட்டிற்கு clone செய்ய)

பின்வரும் எடுத்துக்காட்டுகள் அதிகாரபூர்வ Azure-Samples களஞ்சியங்களில் பராமரிக்கப்படுகின்றன. பல்வேறு AZD முறைமைகளை ஆராய அவற்றை clone செய்யவும்:

### எளிய பயன்பாடுகள் (அத்தியாயங்கள் 1-2)

| டெம்ப்ளேட் | களஞ்சியம் | சிக்கல்திறன் | சேவைகள் |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [உள்ளூர்: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **மைக்ரோசேவைகள்** | [உள்ளூர்: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | பல்சேவை, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**எவ்வாறு பயன்படுத்துவது:**
```bash
# எந்த உதாரணத்தையும் கிளோன் செய்யவும்
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# வெளியிடவும்
azd up
```

### AI பயன்பாட்டு எடுத்துக்காட்டுகள் (அத்தியாயங்கள் 2, 5, 8)

| டெம்ப்ளேட் | களஞ்சியம் | சிக்கல்திறன் | கவனம் |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI Chat** | [உள்ளூர்: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | GPT-4 உருவாக்கம் |
| **AI Chat துவக்கக் கையேடு** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | அடிப்படை AI பேச்சு |
| **AI ஏஜென்டுகள்** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | ஏஜென்ட் கட்டமைப்பு |
| **Search + OpenAI டெமோ** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG முறைமை |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | நிறுவன AI |

### தரவுத்தளம் & மேம்பட்ட முறைமைகள் (அத்தியாயங்கள் 3-8)

| டெம்ப்ளேட் | களஞ்சியம் | சிக்கல்திறன் | கவனம் |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | தரவுத்தள ஒருங்கிணைப்பு |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java மைக்ரோசேவைகள்** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | பல்சேவை |
| **ML குழாயமைப்பு** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## கற்றல் குறிக்கோள்கள்

இந்த எடுத்துக்காட்களை முகாமை செய்து பார்க்கும்போது, நீங்கள்:
- நிஜமான பயன்பாட்டு காட்சி மூலம் Azure Developer CLI வேலைநுட்பங்களை பயிற்சி பெறலாம்
- வெவ்வேறு பயன்பாட்டு கட்டமைப்புகள் மற்றும் அவற்றின் azd அமல்படுத்தல்களை புரிந்துகொள்கின்றீர்கள்
- பல Azure சேவைகளுக்கான Infrastructure as Code முறைமைகளை ماهிரமாக கையாளலாம்
- கட்டமைப்பு மேலாண்மை மற்றும் சூழ்நிலைக்கு உட்பட்ட அமல்படுத்தல் 전략ங்களைப் பயன்படுத்து
- கண்காணிப்பு, பாதுகாப்பு மற்றும் அளவுரு முறைமைகளை நடைமுறையில் அமல்படுத்து
- உண்மையான உருவாக்க நிலைகளில் தொல்லியல் விசாரணை மற்றும் பிழைதிருத்தத்தில் அனுபவம் பெறலாம்

## கற்றல் விளைவுகள்

இந்த எடுத்துக்காட்டுகளை முடித்தவுடன், நீங்கள் செய்ய முடியும்:
- Azure Developer CLI-ஐப் பயன்படுத்தி பல பயன்பாட்டு வகைகளை திடீரென உருவாக்கDeploy செய்யக்கூடிய திறன் பெறுவீர்கள்
- வழங்கப்பட்ட வார்ப்புருக்களை உங்கள் பயன்பாட்டு தேவைகளுக்கு ஏற்ப ஒழுங்குபடுத்த முடியும்
- Bicep பயன்படுத்தி தனிப்பட்ட கீழமைவர்த்தக முறைமைகளை வடிவமைப்பு மற்றும் அமல்படுத்த முடியும்
- சரியான சார்புகளுடன் சிக்கலான பல்சேவை பயன்பாடுகளை கன்ஃபிகர் செய்ய முடியும்
- உண்மையான சூழ்நிலைகளில் பாதுகாப்பு, கண்காணிப்பு மற்றும் செயல்திறன் சிறந்த நடைமுறைகளைப் பயன்படுத்த முடியும்
- நடைமுறை அனுபவத்தின் அடிப்படையில் உருவாக்கங்களை துடைப்பதும் மேம்படுத்துவதும் செய்ய முடியும்

## அடைவு அமைப்பு

```
Azure Samples AZD Templates (linked externally):
├── todo-nodejs-mongo/       # Node.js Express with MongoDB
├── todo-csharp-sql-swa-func/ # React SPA with Static Web Apps  
├── container-apps-store-api/ # Python Flask containerized app
├── todo-csharp-sql/         # C# Web API with Azure SQL
├── todo-python-mongo-swa-func/ # Python Functions with Cosmos DB
├── java-microservices-aca-lab/ # Java microservices with Container Apps
└── configurations/          # Common configuration examples
    ├── environment-configs/
    ├── bicep-modules/
    └── scripts/
```

## தைவக்க தொடக்க எடுத்துக்காட்டுகள்

> **💡 AZD-இல் புதியவரா?** எடுத்துக்காட்டு #1 (Flask API) இல் இருந்து துவங்குங்கள் - இது ~20 நிமிடங்கள் எடுத்துக்கொள்ளும் மற்றும் முக்கியமான கருத்துக்களை கற்பிக்கும்.

### தொடக்க நிலை பயனர்களுக்காக
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (உள்ளூர்) ⭐  
   scale-to-zero உடன் ஒரு எளிய REST API ஐ உருவாக்கு  
   **நேரம்:** 20-25 நிமிடங்கள் | **செலவு:** $0-5/மாதம்  
   **நீங்கள் கற்கப்போகிறீர்கள்:** அடிப்படை azd வேலைநெறி, கன்டெய்னரைசேஷன், ஹெல்த் ப்ரோப்ஸ்  
   **எதிர்பார்க்கப்படும் முடிவு:** கண்காணிப்புடன் "Hello, World!" திருப்பிச் சொல்வதற்கான செயல்படும் API endpoint

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   MongoDB உடன் Node.js Express வலை பயன்பாட்டை உருவாக்கு  
   **நேரம்:** 25-35 நிமிடங்கள் | **செலவு:** $10-30/மாதம்  
   **நீங்கள் கற்கப்போகிறீர்கள்:** தரவுத்தள ஒருங்கிணைப்பு, சூழல் மாறிலிகள், இணைப்பு ஸ்டிரிங்ஸ்  
   **எதிர்பார்க்கப்படும் முடிவு:** உருவாக்க/ஓற்று/நிரூப/அழிக்க செயல்பாடுகள் கொண்ட Todo பட்டியல் செயலி

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Azure Static Web Apps உடன் React நிலையான வலைத்தளத்தை ஹோஸ்ட் செய்க  
   **நேரம்:** 20-30 நிமிடங்கள் | **செலவு:** $0-10/மாதம்  
   **நீங்கள் கற்கப்போகிறீர்கள்:** நிலையான ஹோஸ்டிங், serverless functions, CDN உருவாக்கம்  
   **எதிர்பார்க்கப்படும் முடிவு:** API பின்னணி கொண்ட React UI, தானாக SSL, உலகளாவிய CDN

### மத்திய நிலை பயனர்களுக்காக
4. **[Azure OpenAI Chat Application](../../../examples/azure-openai-chat)** (உள்ளூர்) ⭐⭐  
   GPT-4 உடன் பேச்சு இடைமுகம் மற்றும் பாதுகாப்பான API விசை மேலாண்மை உருவாக்கு  
   **நேரம்:** 35-45 நிமிடங்கள் | **செலவு:** $50-200/மாதம்  
   **நீங்கள் கற்கப்போகிறீர்கள்:** Azure OpenAI உருவாக்கம், Key Vault ஒருங்கிணைப்பு, டோக்கன் கண்காணிப்பு  
   **எதிர்பார்க்கப்படும் முடிவு:** GPT-4 மற்றும் செலவு கண்காணிப்புடன் செயல்படும் பேச்சு செயலி

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (உள்ளூர்) ⭐⭐⭐⭐  
   உற்பத்திக்கு-தயாரான பல்சேவை கட்டமைப்பு  
   **நேரம்:** 45-60 நிமிடங்கள் | **செலவு:** $50-150/மாதம்  
   **நீங்கள் கற்கப்போகிறீர்கள்:** சேவை தொடர்பு, message queuing, விநியோகிக்கப்பட்ட டிரேசிங்  
   **எதிர்பார்க்கப்படும் முடிவு:** கண்காணிப்புடன் 2-சேவை முறைமை (API Gateway + Product Service)

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   C# API மற்றும் Azure SQL தரவுத்தளத்துடன் வலை பயன்பாடு  
   **நேரம்:** 30-45 நிமிடங்கள் | **செலவு:** $20-80/மாதம்  
   **நீங்கள் கற்கப்போகிறீர்கள்:** Entity Framework, தரவுத்தள மைగ్రேஷன்கள், இணைப்பு பாதுகாப்பு  
   **எதிர்பார்க்கப்படும் முடிவு:** Azure SQL பின் அத்தியா் கொண்ட C# API, தானாக வரையறை அமைப்பு அமல்படுத்தல்

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   HTTP தூண்டுதல்களுடன் Python Azure Functions மற்றும் Cosmos DB  
   **நேரம்:** 30-40 நிமிடங்கள் | **செலவு:** $10-40/மாதம்  
   **நீங்கள் கற்கப்போகிறீர்கள்:** நிகழ்வு-நேர்ந்த உத்தரவு, serverless அளவீடு, NoSQL ஒருங்கிணைப்பு  
   **எதிர்பார்க்கப்படும் முடிவு:** HTTP கோரிக்கைகளுக்கு பதிலளிக்கும் மற்றும் Cosmos DB சேமிப்புடன் செயல்படும் Function app

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Container Apps மற்றும் API கேட்வே உடன் பல்சேவை Java பயன்பாடு  
   **நேரம்:** 60-90 நிமிடங்கள் | **செலவு:** $80-200/மாதம்  
   **நீங்கள் கற்கப்போகிறீர்கள்:** Spring Boot உருவாக்கம், service mesh, லோட் பேலன்சிங்  
   **எதிர்பார்க்கப்படும் முடிவு:** சேவை கண்டறிதல் மற்றும் маршрутகளுடன் பல்சேவை Java முறைமை

### Microsoft Foundry வார்ப்புருக்கள்

1. **[Azure OpenAI Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   பேச்சு இடைமுகத்துடன் முழுமையான GPT-4 உருவாக்கம்  
   **நேரம்:** 35-45 நிமிடங்கள் | **செலவு:** $50-200/மாதம்  
   **எதிர்பார்க்கப்படும் முடிவு:** டோக்கன் கண்காணிப்பு மற்றும் செலவு கண்காணிப்புடன் செயல்படும் பேச்சு செயலி

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   RAG கட்டமைப்புடன் நுண்ணறிவு பேச்சு செயலி  
   **நேரம்:** 60-90 நிமிடங்கள் | **செலவு:** $100-300/மாதம்  
   **எதிர்பார்க்கப்படும் முடிவு:** ஆவணத் தேடல் மற்றும் மேற்கோள்களுடன் RAG இயங்கும் பேச்சு இடைமுகம்

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Azure AI சேவைகளைப் பயன்படுத்தி ஆவணப் பகுப்பாய்வு  
   **நேரம்:** 40-60 நிமிடங்கள் | **செலவு:** $20-80/மாதம்  
   **எதிர்பார்க்கப்படும் முடிவு:** பதிவேற்றப்பட்ட ஆவணங்களிலிருந்து உரை, அட்டவணைகள் மற்றும் அவயவங்களை வெளிப்படுத்தும் API

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Azure Machine Learning உடன் MLOps வேலைநிறைவு  
   **நேரம்:** 2-3 மணி நேரம் | **செலவு:** $150-500/மாதம்  
   **எதிர்பார்க்கப்படும் முடிவு:** பயிற்சி, உருவாக்கம் மற்றும் கண்காணிப்புடன் தானாக இயங்கும் ML குழாயமைப்பு

### உண்மையான உலகக் காட்சிகள்

#### **Retail Multi-Agent Solution** 🆕
**[முழுமையான அமல்படுத்தல் கையேடு](./retail-scenario.md)**

AZD உடன் நிறுவனம்-தரமான AI பயன்பாட்டு உருவாக்கத்தை மதிப்பீடு செய்யும் விரிவான, உற்பத்தி-தயாரான பல-ஏஜென்ட் வாடிக்கையர்க் குழு தீர்வு. இந்த காட்சி வழங்குகிறது:

- **முழுமையான கட்டமைப்பு**: சிறப்பு வாடிக்கையாளர் சேவை மற்றும் சரக்கு மேலாண்மைக் ஏஜென்டுகளை கொண்ட பல-ஏஜென்ட் முறைமை
- **Production Infrastructure**: Multi-region Azure OpenAI deployments, AI Search, Container Apps, and comprehensive monitoring
- **Ready-to-Deploy ARM Template**: One-click deployment with multiple configuration modes (Minimal/Standard/Premium)
- **Advanced Features**: Red teaming security validation, agent evaluation framework, cost optimization, and troubleshooting guides
- **Real Business Context**: Retailer customer support use case with file uploads, search integration, and dynamic scaling

**Technologies**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Complexity**: ⭐⭐⭐⭐ (மேம்பட்ட - நிறுவன தயாரிப்பு தயாரானது)

**Perfect for**: AI developers, solution architects, and teams building production multi-agent systems

**Quick Start**: `./deploy.sh -g myResourceGroup` உடன் இணைக்கப்பட்ட ARM டெம்பிளேட் பயன்படுத்தி முழு தீர்வை 30 நிமிடங்களில் குறைவாக நிறுவுங்கள்

## 📋 பயன்பாட்டு வழிமுறைகள்

### முன் தேவைகள்

Before running any example:
- ✅ Owner அல்லது Contributor அனுமதியுடன் Azure சந்தா
- ✅ Azure Developer CLI நிறுவப்பட்டிருக்கும் ([இன்ஸ்டாலேஷன் வழிகாட்டி](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop இயங்கிவர வேண்டும் (கொண்டெய்னர் உதாரணங்களுக்காக)
- ✅ பொருத்தமான Azure குறித்தளவுகள் (உதாரண-சார்ந்த தேவைகளை சரிபார்க்கவும்)

> **💰 செலவு எச்சரிக்கை:** அனைத்து உதாரணங்களும் கட்டணத்தை ஏற்படுத்தும் உண்மையான Azure வளங்களை உருவாக்கும். செலவு மதிப்பீடுகளுக்கு தனித்த README கோப்புகளைப் பாருங்கள். தொடர்ச்சியான செலவுகளைத் தவிர்க்க முடிந்தவசமாக முடிந்தவுடன் `azd down` இயக்க நினைவில் கொள்ளுங்கள்.

### உதாரணங்களை உள்ளூரில் இயக்குதல்

1. **Clone or Copy Example**
   ```bash
   # விரும்பிய உதாரணத்திற்கு செல்லவும்
   cd examples/simple-web-app
   ```

2. **AZD சூழலை துவக்கவும்**
   ```bash
   # ஏற்கனவே உள்ள மாதிரியைப் பயன்படுத்தி துவக்கவும்
   azd init
   
   # அல்லது புதிய சூழலை உருவாக்கவும்
   azd env new my-environment
   ```

3. **சூழலமைப்பை கையாளவும்**
   ```bash
   # தேவையான மாறிகளை அமைக்கவும்
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Deploy**
   ```bash
   # அடித்தள கட்டமைப்பையும் பயன்பாட்டையும் வெளியிடு
   azd up
   ```

5. **பதிவைப் சரிபார்க்கவும்**
   ```bash
   # சேவை எண்ட்பாயின்டுகளைப் பெறுக
   azd env get-values
   
   # எண்ட்பாயின்டை சோதிக்கவும் (உதாரணம்)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **எதிர்பார்க்கப்படக்கூடிய வெற்றி குறியீடுகள்:**
   - ✅ `azd up` பிழைகளின்றி முடிவடைகிறது
   - ✅ சேவை எண்ட்பாயிண்ட் HTTP 200 ஐ திருப்புகிறது
   - ✅ Azure போர்டல் "ஓடுகிறது" நிலையை காட்டுகிறது
   - ✅ Application Insights டெலிமெட்ரி பெறுகிறது

> **⚠️ பிரச்சினைகள்?** பதிவிறக்கம் தொடர்பான பிழைதிருத்தத்திற்காக [பொதுவான சிக்கல்கள்](../docs/chapter-07-troubleshooting/common-issues.md) பார்க்கவும்

### உதாரணங்களை பொருத்துதல்

ஒவ்வொரு உதாரணத்திலும் அடங்கியவை:
- **README.md** - விரிவான அமைப்பு மற்றும் தனிப்பயன் அமைப்புகள் பற்றிய வழிமுறைகள்
- **azure.yaml** - கருத்துக்களுடன் AZD கட்டமைப்பு
- **infra/** - மாறிலிகள் விளக்கத்துடன் Bicep டெம்பிளேட்கள்
- **src/** - மாதிரி பயன்பாடு குறியீடு
- **scripts/** - பொதுவான பணிகளுக்கான உதவி ஸ்கிரிப்டுகள்

## 🎯 கற்றல் குறிக்கோள்கள்

### உதாரண வகைகள்

#### **அடிப்படை உள்ளமைப்புகள்**
- ஒரே சேவை பயன்பாடுகள்
- எளிய கட்டமைப்பு மாதிரிகள்
- அடிப்படை கட்டமைப்பு மேலாண்மை
- செலவு-திறன் கொண்ட மேம்பாட்டு அமைப்புகள்

#### **மேம்பட்ட நிலைகள்**
- பல சேவை معماريகள்
- சிக்கலான நெட்வொர்க்கிங் கட்டமைப்புகள்
- தரவுத்தள ஒருங்கிணைப்பு மாதிரிகள்
- பாதுகாப்பு மற்றும் ஒழுங்குமுறை அமலாக்கங்கள்

#### **தயாரிப்பு-தேர்வான வடிவங்கள்**
- உயர் கிடைக்கும் கட்டமைப்புகள்
- கண்காணிப்பு மற்றும் பரிசோதனையாக்கம்
- CI/CD ஒருங்கிணைப்பு
- பேரழிவு மீட்பு அமைப்புகள்

## 📖 உதாரண விளக்கங்கள்

### Simple Web App - Node.js Express
**Technologies**: Node.js, Express, MongoDB, Container Apps  
**சிக்கல்தரம்**: ஆரம்ப நிலை  
**கருத்துக்கள்**: அடிப்படை பதிவேற்றம், REST API, NoSQL தரவுத்தள ஒருங்கிணைப்பு

### Static Website - React SPA
**Technologies**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**சிக்கல்தரம்**: ஆரம்ப நிலை  
**கருத்துக்கள்**: நிலையான ஹோஸ்டிங், சர்வர்-இல்லாத பின்னணி, நவீன வலை மேம்பாடு

### Container App - Python Flask
**Technologies**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**சிக்கல்தரம்**: ஆரம்ப நிலை  
**கருத்துக்கள்**: கொண்டெய்னரைசேஷன், REST API, scale-to-zero, health probes, கண்காணித்தல்  
**இடம்**: [உள்ளூர் உதாரணம்](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**Technologies**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**சிக்கல்தரம்**: மேம்பட்ட  
**கருத்துக்கள்**: பல சேவைகள் معماري, சேவை தொடர்புகள், மெசேஜ் கியூ잉், பகிர்ந்தடைந்த டிரேசிங்  
**இடம்**: [உள்ளூர் உதாரணம்](../../../examples/container-app/microservices)

### Database App - C# with Azure SQL
**Technologies**: C# ASP.NET Core, Azure SQL Database, App Service  
**சிக்கல்தரம்**: இடைநிலை  
**கருத்துக்கள்**: Entity Framework, தரவுத்தள இணைப்புகள், வலை API உருவாக்கம்

### Serverless Function - Python Azure Functions
**Technologies**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**சிக்கல்தரம்**: இடைநிலை  
**கருத்துக்கள்**: நிகழ்வு-இயக்கமான கட்டமைப்பு, serverless கணினி, முழு-ஸ்டாக் மேம்பாடு

### Microservices - Java Spring Boot
**Technologies**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**சிக்கல்தரம்**: இடைநிலை  
**கருத்துக்கள்**: மைக்ரோசெர்விசஸ் தொடர்பு, பகிர்ந்த அமைப்புகள், நிறுவன மாதிரிகள்

### Microsoft Foundry Examples

#### Azure OpenAI Chat App
**Technologies**: Azure OpenAI, Cognitive Search, App Service  
**சிக்கல்தரம்**: இடைநிலை  
**கருத்துக்கள்**: RAG கட்டமைப்பு, வெக்டர் தேடல், LLM ஒருங்கிணைப்பு

#### AI Document Processing
**Technologies**: Azure AI Document Intelligence, Storage, Functions  
**சிக்கல்தரம்**: இடைநிலை  
**கருத்துக்கள்**: ஆவணம் பகுப்பாய்வு, OCR, தரவு எடுப்பு

#### Machine Learning Pipeline
**Technologies**: Azure ML, MLOps, Container Registry  
**சிக்கல்தரம்**: மேம்பட்ட  
**கருத்துக்கள்**: மாடல் பயிற்சி, நிலைத்தெடு குழாய், கண்காணித்தல்

## 🛠 கான்பிகரேஷன் உதாரணங்கள்

The `configurations/` directory contains reusable components:

### சூழல் கான்பிகரேஷன்கள்
- மேம்பாட்டு சூழல் அமைப்புகள்
- ஸ்டேஜிங் சூழல் கட்டமைப்புகள்
- தயாரிப்பு-தேர்வான கட்டமைப்புகள்
- பல-மண்டலப் பதிவிறக்கம் அமைப்புகள்

### Bicep Modules
- மறுபயன்படக்கூடிய உள்தடங்கு கூறுகள்
- பொதுவான வள மாதிரிகள்
- பாதுகாப்பு-முழுமையாக்கப்பட்ட டெம்பிளேட்கள்
- செலவு-இலக்கு கான்பிகரேஷன்கள்

### உதவி ஸ்கிரிப்டுகள்
- சூழல் அமைப்பு தானியங்கி
- தரவுத்தள இடமாற்ற ஸ்கிரிப்டுகள்
- பதவிறக்கம் சரிபார்க்கும் கருவிகள்
- செலவு கண்காணிப்பு உபகரணங்கள்

## 🔧 தனிப்பயன் வழிகாட்டி

### உங்கள் பயன்பாட்டிற்கு உதாரணங்களை பொருத்துவது

1. **முன் தேவைகளை மீட்டுச்செக் செய்க**
   - Azure சேவை தேவைகளை சரிபார்க்கவும்
   - சந்தா வரம்புகளை சரிபார்க்கவும்
   - செலவு தாக்கங்களைக் புரிந்துகொள்ளவும்

2. **கான்பிகரேஷனை மாற்றவும்**
   - `azure.yaml` சேவை வரையறைகளை புதுப்பிக்கவும்
   - Bicep டெம்பிளேட்களை தனிமைப்படுத்தவும்
   - சூழல் மாறிலிகளை சரிசெய்க

3. **முழுமையாக சோதிக்கவும்**
   - முதலில் மேம்பாட்டு சூழலில் பதவி இடவும்
   - செயல்பாடுகளை சரிபார்க்கவும்
   - அளவீடு மற்றும் செயல்திறன் சோதிக்கவும்

4. **பாதுகாப்பு ஆய்வு**
   - அணுகலுக்கான கட்டுப்பாடுகளை மதிப்பாய்வு செய்யவும்
   - ரகசிய மேலாண்மையை அமல்படுத்தவும்
   - கண்காணிப்பு மற்றும் அலர்ட்டை இயக்கவும்

## 📊 ஒப்பீட்டு அட்டவணை

| உதாரணம் | சேவைகள் | தரவுத்தளம் | அங்கீகாரம் | கண்காணித்தல் | சிக்கல்தரம் |
|---------|----------|----------|------|------------|------------|
| **Azure OpenAI Chat** (உள்ளூர்) | 2 | ❌ | Key Vault | Full | ⭐⭐ |
| **Python Flask API** (உள்ளூர்) | 1 | ❌ | Basic | Full | ⭐ |
| **Microservices** (உள்ளூர்) | 5+ | ✅ | Enterprise | Advanced | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Basic | Basic | ⭐ |
| React SPA + Functions | 3 | ✅ | Basic | Full | ⭐ |
| Python Flask Container | 2 | ❌ | Basic | Full | ⭐ |
| C# Web API + SQL | 2 | ✅ | Full | Full | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Full | Full | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Full | Full | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Full | Full | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Basic | Full | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Full | Full | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (உள்ளூர்) | **8+** | **✅** | **Enterprise** | **Advanced** | **⭐⭐⭐⭐** |

## 🎓 கற்றல் பாதை

### பரிந்துரைக்கபடும் முன்னேற்றம்

1. **Simple Web App**-இல் துவங்கவும்
   - அடிப்படை AZD கருத்துக்களை கற்கவும்
   - பதவிறக்க பணிமுறையை புரிந்துகொள்ளவும்
   - சூழல் மேலாண்மையில் பயிற்சி பெறவும்

2. **Static Website**-ஐ முயற்சிக்கவும்
   - வெவ்வேறு ஹோஸ்டிங் விருப்பங்களைத் தொலைபார்க்கவும்
   - CDN ஒருங்கிணைப்பை கற்றுக்கொள்ளவும்
   - DNS கட்டமைப்பை புரிந்துகொள்ளவும்

3. **Container App**-க்கு நகருங்கள்
   - கொண்டெய்னரைசேஷன் அடிப்படைகளை கற்கவும்
   - அளவீட்டு கருத்துக்களை புரிந்துகொள்ளவும்
   - Docker-இல் பயிற்சி செய்யவும்

4. **தரவுத்தள ஒருங்கிணைப்பு சேர்க்கவும்**
   - தரவுத்தள வழங்கலை கற்கவும்
   - இணைப்பு சொருகுகளை புரிந்துகொள்ளவும்
   - ரகசிய மேலாண்மையில் பயிற்சி பெறவும்

5. **Serverless**-ஐ ஆராய்க
   - நிகழ்வு-இயங்குதல் கட்டமைப்பைப் புரிந்துகொள்ளவும்
   - டிரிகர்கள் மற்றும் பைண்டிங்களை கற்றுக்கொள்ளவும்
   - APIs உடன் பயிற்சி மேற்கொள்ளவும்

6. **Microservices** உருவாக்கவும்
   - சேவை தொடர்புகளை கற்றுக்கொள்ளவும்
   - பகிர்ந்த அமைப்புகளைப் புரிந்துகொள்ளவும்
   - சிக்கலான பதவிறக்கங்களில் பயிற்சி செய்யவும்

## 🔍 சரியான உதாரணத்தை கண்டுபிடித்தல்

### தொழில்நுட்ப ஸ்டாக் மூலம்
- **Container Apps**: [Python Flask API (உள்ளூர்)](../../../examples/container-app/simple-flask-api), [Microservices (உள்ளூர்)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (உள்ளூர்)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (உள்ளூர்)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (உள்ளூர்)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (உள்ளூர்)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Go**: [Microservices User Service (உள்ளூர்)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (உள்ளூர்)](../../../examples/container-app/simple-flask-api), [Microservices (உள்ளூர்)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (உள்ளூர்)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Azure OpenAI Chat (உள்ளூர்)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Azure OpenAI Chat (உள்ளூர்)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (உள்ளூர்)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### கட்டமைப்பு மாதிரி அடிப்படையில்
- **Simple REST API**: [Python Flask API (உள்ளூர்)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (உள்ளூர்)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (உள்ளூர்)](../../../examples/container-app/simple-flask-api), [Microservices (உள்ளூர்)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Azure OpenAI Chat (உள்ளோர்)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (உள்ளூர்)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### சிக்கல் தகுதி அடிப்படையில்
- **ஆரம்ப நிலை**: [Python Flask API (உள்ளூர்)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **இடைநிலை**: **[Azure OpenAI Chat (உள்ளூர்)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **மேம்பட்ட**: ML Pipeline
- **நிறுவன தயாரிப்பு-தேர்வானது**: [Microservices (உள்ளூர்)](../../../examples/container-app/microservices) (பல சேவைகளுடன் மெசேஜ் கியூ잉்), **Retail Multi-Agent Solution** (ARM டெம்பிளேட் உடன் முழுமையான பல-ஏஜென்ட் அமைப்பு)

## 📚 மேலும் வளங்கள்

### டாக்குமெண்டேஷன் இணைப்புகள்
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### சமூகம் உதாரணங்கள்
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Node.js மற்றும் PostgreSQL உடன் Todo செயலி](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [C# API உடன் React வெப் செயலி](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps பணி](https://github.com/Azure-Samples/container-apps-jobs)
- [Java உடன் Azure Functions](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### சிறந்த நடைமுறைகள்
- [Azure நன்கு வடிவமைக்கப்பட்ட கட்டமைப்பு](https://learn.microsoft.com/en-us/azure/well-architected/)
- [மேகம் ஏற்றுக்கொள்ளுதல் கட்டமைப்பு](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 உதாரணங்களை பங்களிக்க

பகிர்வதற்கு பயனுள்ள உதாரணம் உள்ளதா? உங்கள் பங்களிப்புகளை வரவேற்க்கிறோம்!

### சமர்ப்பிப்பு வழிமுறைகள்
1. நிர்ணயிக்கப்பட்ட கோப்புறை கட்டமைப்பை பின்பற்றவும்
2. பரிபூரண README.md ஒன்றை சேர்க்கவும்
3. கட்டமைப்பு கோப்புகளில் விளக்கக் குறிப்புகளை சேர்க்கவும்
4. சமர்ப்பிக்குமுன் முழுமையாக சோதிக்கவும்
5. செலவுக் கணக்கீடுகள் மற்றும் முன் தேவைகள் சேர்க்கவும்

### உதாரண மாதிரி கட்டமைப்பு
```
example-name/
├── README.md           # Detailed setup instructions
├── azure.yaml          # AZD configuration
├── infra/              # Infrastructure templates
│   ├── main.bicep
│   └── modules/
├── src/                # Application source code
├── scripts/            # Helper scripts
├── .gitignore         # Git ignore rules
└── docs/              # Additional documentation
```

---

**சிறந்த குறிப்பு**: உங்கள் தொழில்நுட்ப ஸ்டாக்குடன் பொருந்தும் மிகவும் எளிமையான உதாரணத்திலிருந்து தொடங்குங்கள், பின்னர் படிப்படியாக சிக்கலான நிலைகளுக்கு முன்னேறுங்கள். ஒவ்வொரு உதாரணமும் முந்தைய ஒன்றின் கருத்துகளின் அடிப்படையில் கட்டமைக்கப்பட்டுள்ளது!

## 🚀 தொடங்கத் தயார்?

### உங்கள் கற்றல் பாதை

1. **முழுமையான தொடக்கநபரா?** → [Flask API](../../../examples/container-app/simple-flask-api) மூலம் தொடங்குங்கள் (⭐, 20 நிமிடம்)
2. **அடிப்படை AZD அறிவு உள்ளதா?** → [Microservices](../../../examples/container-app/microservices) முயற்சிக்கவும் (⭐⭐⭐⭐, 60 நிமிடம்)
3. **AI செயலிகள் கட்டுகிறீர்களா?** → [Azure OpenAI Chat](../../../examples/azure-openai-chat) மூலம் தொடங்குங்கள் (⭐⭐, 35 நிமிடம்) அல்லது [Retail Multi-Agent](retail-scenario.md) ஐ ஆராயுங்கள் (⭐⭐⭐⭐, 2+ மணி நேரம்)
4. **குறிப்பிட்ட தொழில்நுட்ப ஸ்டாக்க் வேண்டும்?** → மேலே உள்ள [Finding the Right Example](../../../examples) பகுதியைப் பயன்படுத்தவும்

### அடுத்த படிகள்

- ✅ மேலே உள்ள [Prerequisites](../../../examples) ஐ ஆய்வு செய்யவும்
- ✅ உங்கள் திறன் நிலைக்கு பொருந்திய உதாரணத்தை தேர்ந்தெடுக்கவும் (பார்க்கவும் [சிக்கல்தன்மை விளக்கம்](../../../examples))
- ✅ உதாரணத்தின் README-ஐ டெப்ளோ செய்யும்முன் முழுமையாகப் படியுங்கள்
- ✅ சோதனைக்குப்பிறகு `azd down` இயக்க நினைவூட்டலை அமைக்கவும்
- ✅ உங்கள் அனுபவத்தை GitHub Issues அல்லது Discussions வழியாக பகிரவும்

### உதவி வேண்டுமா?

- 📖 [FAQ](../resources/faq.md) - பொதுவான கேள்விகளுக்கான பதில்கள்
- 🐛 [Troubleshooting Guide](../docs/chapter-07-troubleshooting/common-issues.md) - டெப்ளோ பிரச்சினைகளை சரிசெய்யவும்
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - சமூகத்திடம் கேளுங்கள்
- 📚 [Study Guide](../resources/study-guide.md) - உங்கள் கற்றலினை வலுப்படுத்துங்கள்

---

**வழிசெலுத்தல்**
- **📚 பாடநெறி முகப்பு**: [AZD For Beginners](../README.md)
- **📖 படிப்பு வளங்கள்**: [பயிற்சி வழிகாட்டி](../resources/study-guide.md) | [சுருக்கக் குறிப்பு](../resources/cheat-sheet.md) | [அகராதி](../resources/glossary.md)
- **🔧 வளங்கள்**: [FAQ](../resources/faq.md) | [Troubleshooting](../docs/chapter-07-troubleshooting/common-issues.md)

---

*சமீபத்திய புதுப்பிப்பு: நவம்பர் 2025 | [பிரச்சினைகளை அறிவிக்கவும்](https://github.com/microsoft/AZD-for-beginners/issues) | [உதாரணங்களை பங்களிக்கவும்](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
மறுப்பு:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவையான Co‑op Translator (https://github.com/Azure/co-op-translator) மூலம் மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சித்தாலும், தானியங்கி மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறான பொருள் விளக்கங்கள் இருக்கக்கூடும் என்பதை தயவுசெய்து கவனிக்கவும். அதன் சொந்த மொழியில் உள்ள அசல் ஆவணம் அதிகாரப்பூர்வ மூலமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்பை பரிந்துரைக்கப்படுகிறோம். இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் ஏதேனும் தவறான புரிதல்களுக்கோ அல்லது தவறான விளக்கங்களுக்கோ நாங்கள் பொறுப்பேற்கமாட்டோம்.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->