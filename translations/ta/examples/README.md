# உதாரணங்கள் - நடைமுறை AZD மாதிரிகளும் அமைப்புகளும்

**உதாரணத்தினாலாய் கற்றல் - அத்தியாயம் அடிப்படையில் ஒழுங்குபடுத்தப்பட்டது**
- **📚 பாடநெறி முகப்பு**: [ஆரம்பிகளுக்கான AZD](../README.md)
- **📖 அத்தியாய வரைபடம்**: கற்றலின் சிக்கல்நிலையின் அடிப்படையில் ஒழுங்குபடுத்தப்பட்ட உதாரணங்கள்
- **🚀 உள்ளூர் உதாரணம்**: [சில்லறை மல்டி-ஏஜென்ட் தீர்வு](retail-scenario.md)
- **🤖 வெளிப்புற AI உதாரணங்கள்**: Azure-Samples களஞ்சியங்களுக்கான இணைப்புகள்

> **📍 முக்கியம்: உள்ளூர் மற்றும் வெளிப்புற உதாரணங்கள்**  
> இந்த களஞ்சியம் முழுமையான செயலாக்கங்களுடன் **4 முழுமையான உள்ளூர் உதாரணங்களை** கொண்டுள்ளது:  
> - **Microsoft Foundry Models Chat** (gpt-4.1 அமர்த்தல் மற்றும் உரையாடல் இடைமுகம்)  
> - **Container Apps** (எளிய Flask API + மைக்ரோசெர்வீசுகள்)  
> - **Database App** (இணைய பயன்பாடு + SQL தரவுத்தளம்)  
> - **Retail Multi-Agent** (என்டர்ப்ரைஸ் AI தீர்வு)  
>  
> கூடுதல் உதாரணங்கள் நீங்கள் கிளோன் செய்யக்கூடிய Azure-Samples களஞ்சியங்களுக்கான **வெளிப்புற குறிப்புகள்**.

## அறிமுகம்

இந்த அடைவு நடைமுறை உதாரணங்களையும் குறிப்புகளையும் வழங்கி Azure Developer CLI-ஐ கைமுறையாகப் பயிற்சி மூலம் கற்றுக் கொள்ள உதவுகிறது. Retail Multi-Agent سنாரியோ இந்த களஞ்சியத்தில் சேர்க்கப்பட்ட முழுமையான, தயாரிப்பு-தயார் செயலாக்கமாகும். கூடுதல் உதாரணங்கள் பல AZD கோட்பாடுகளை காட்டும் அதிகாரபூர்வ Azure Samples களஞ்சியங்களை மேற்கோள் கொள்கின்றன.

### சிக்கலான மதிப்பீட்டின் விளக்கம்

- ⭐ **தொடக்கநிலை** - அடிப்படை கொள்கைகள், ஒரு சேவை, 15-30 நிமிடங்கள்
- ⭐⭐ **இடைநிலை** - பல சேவைகள், தரவுத்தள ஒருங்கிணைப்பு, 30-60 நிமிடங்கள்
- ⭐⭐⭐ **மேம்பட்ட** - ஜடிலமான கட்டமைப்பு, AI ஒருங்கிணைப்பு, 1-2 மணி நேரங்கள்
- ⭐⭐⭐⭐ **நிபுணர்** - தயாரிப்பு-தயார், நிறுவன மாதிரிகள், 2+ மணி நேரங்கள்

## 🎯 இந்த களஞ்சியத்தில் உண்மையில் என்ன உள்ளது

### ✅ உள்ளூர் அமலாக்கம் (பயன்படுத்தத் தயார்)

#### [Microsoft Foundry Models Chat Application](azure-openai-chat/README.md) 🆕
**இந்த репோவில் சேர்க்கப்பட்டுள்ள உரையாடல் இடைமுகத்துடன் கூடிய முழுமையான gpt-4.1 அமர்த்தல்**

- **Location:** `examples/azure-openai-chat/`
- **Complexity:** ⭐⭐ (இடைநிலை)
- **What's Included:**
  - Microsoft Foundry Models இன் முழுமையான அமர்த்தல் (gpt-4.1)
  - Python கட்டளை வரிசை உரையாடல் இடைமுகம்
  - பாதுகாப்பான API விசைகளுக்கான Key Vault ஒருங்கிணைப்பு
  - Bicep அதிவேர் டெம்ப்ளேட்டுகள்
  - டோக்கன் பயன்பாடு மற்றும் செலவு கண்காணிப்பு
  - விகித வரம்பிடுதல் மற்றும் பிழை கையாளுதல்

**விரைவான தொடக்கம்:**
```bash
# example கோப்பகத்திற்கு செல்லவும்
cd examples/azure-openai-chat

# எல்லாவற்றையும் வெளியிடவும்
azd up

# தேவையான சார்புகளை நிறுவி உரையாடலைத் தொடங்கவும்
pip install -r src/requirements.txt
python src/chat.py
```

**தொழில்நுட்பங்கள்:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Container App Examples](container-app/README.md) 🆕
**இந்த रिपோவில் உள்ள விரிவான கொண்டெய்னர் அமர்த்தல் உதாரணங்கள்**

- **Location:** `examples/container-app/`
- **Complexity:** ⭐-⭐⭐⭐⭐ (தொடக்கநிலையில் இருந்து நிபுணருக்குள்)
- **What's Included:**
  - [மாஸ்டர் வழிகாட்டி](container-app/README.md) - கொண்டெய்னர் அமர்த்தல்களின் முழுமையான மேற்பார்வை
  - [எளிய Flask API](../../../examples/container-app/simple-flask-api) - அடிப்படை REST API உதாரணம்
  - [மைக்ரோசெர்வீசஸ் கட்டமைப்பு](../../../examples/container-app/microservices) - தயாரிப்பு-தயார் பல்சேவை அமர்த்தல்
  - விரைவான தொடக்கம், தயாரிப்பு, மற்றும் மேம்பட்ட மாதிரிகள்
  - கண்காணிப்பு, பாதுகாப்பு, மற்றும் செலவு tốiமிக்கம்

**விரைவான தொடக்கம்:**
```bash
# மாஸ்டர் வழிகாட்டியை பார்க்கவும்
cd examples/container-app

# எளிய Flask API-ஐ நிறுவவும்
cd simple-flask-api
azd up

# மைக்ரோசேவைகள் எடுத்துக்காட்டை நிறுவவும்
cd ../microservices
azd up
```

**தொழில்நுட்பங்கள்:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent Solution](retail-scenario.md) 🆕
**இந்த களஞ்சியத்தில் சேர்க்கப்பட்டுள்ள முழுமையான தயாரிப்பு-தயார் அமலாக்கம்**

- **Location:** `examples/retail-multiagent-arm-template/`
- **Complexity:** ⭐⭐⭐⭐ (மேம்பட்ட)
- **What's Included:**
  - முழுமையான ARM அமர்த்தல் டெம்ப்ளேட்
  - பல-ஏஜென்ட் கட்டமைப்பு (Customer + Inventory)
  - Microsoft Foundry Models ஒருங்கிணைப்பு
  - RAG உடன் AI Search
  - விரிவான கண்காணிப்பு
  - ஒரு கிளிக்கில் அமர்த்தல் ஸ்கிரிப்ட்

**விரைவான தொடக்கம்:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**தொழில்நுட்பங்கள்:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 வெளிப்புற Azure Samples (கிளோன் செய்து பயன்படுத்து)

கீழ்காணும் உதாரணங்கள் அதிகாரபூர்வ Azure-Samples களஞ்சியங்களில் பராமரிக்கப்படுகின்றன. வெவ்வேறு AZD மாதிரிகளை ஆராய கிளோன் செய்யவும்:

### எளிய பயன்பாடுகள் (அத்தியாயங்கள் 1-2)

| மாதிரி | களஞ்சியம் | சிக்கல் | சேவைகள் |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [உள்ளூர்: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [உள்ளூர்: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | பல சேவைகள், Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**பயன்படுத்துவது எப்படி:**
```bash
# எந்தவொரு எடுத்துக்காட்டையும் கிளோன் செய்
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# வெளியிடு
azd up
```

### AI பயன்பாட்டுக் உதாரணங்கள் (அத்தியாயங்கள் 2, 5, 8)

| மாதிரி | களஞ்சியம் | சிக்கல் | கவனம் |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [உள்ளூர்: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 அமர்த்தல் |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | அடிப்படை AI உரையாடல் |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | ஏஜெண்ட் கட்டமைப்பு |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG மாதிரியியல் |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | என்டர்ப்ரைஸ் AI |

### தரவுத்தளம் மற்றும் மேம்பட்ட மாதிரிகள் (அத்தியாயங்கள் 3-8)

| மாதிரி | களஞ்சியம் | சிக்கல் | கவனம் |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | தரவுத்தள ஒருங்கிணைப்பு |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | பல்சேவை |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## கற்றல் குறிக்கோள்கள்

இந்த உதாரணங்களைப் செயல்படுத்துவதன் மூலம் நீங்கள்:
- நெகிழ்நிலை பயன்பாட்டு сценарியொடு Azure Developer CLI வேலைப்பாடுகளைப் பயிற்சி பெறுவீர்கள்
- வெவ்வேறு பயன்பாட்டு கட்டமைப்புகளை மற்றும் அவைகளின் azd அமலாக்கங்களை புரிந்து கொள்வீர்கள்
- பல Azure சேவைகளுக்கான Infrastructure as Code மாதிரிகளை நிபுணத்துவமாக கையாள்வீர்கள்
- கொள்கைகளுக்கான கட்டமைப்பு மேலாண்மையும் சுற்றுச்சூழல்-அடிப்படை அமர்த்தல் தந்திரங்களையும் பயன்படுத்து வீர்கள்
- நடைமுறை சூழல்களில் கண்காணிப்பு, பாதுகாப்பு மற்றும் ஸ்கேலிங் நெறிமுறைகளை அறிமுகப்படுத்துவீர்கள்
- உண்மையான அமர்த்தல் சூழல்களில் தடை கண்டறிதல் மற்றும் பிழை நீக்கத்தில் அனுபவம் சேர்ப்பீர்கள்

## கற்றலின் முடிவுகள்

இந்த உதாரணங்களை முடித்தவுடன், நீங்கள்:
- Azure Developer CLI-ஐ பயன்படுத்தி பல்வேறு பயன்பாட்டு வகைகளை நம்பகத்தன்மையுடன் அமர்த்த முடியும்
- வழங்கப்பட்ட டெம்ப்ளேட்டுகளை உங்கள் சொந்த பயன்பாட்டிற்கு ஏற்ப ஒழுங்குபடுத்த முடியும்
- Bicep பயன்படுத்தி தனிப்பயன் உள்கட்டமைப்பு மாதிரிகளை வடிவமைத்து செயல்படுத்த முடியும்
- சரியான சார்புகளுடன் சிக்கலான பல்சேவை பயன்பாடுகளை கட்டமைக்க முடியும்
- பாதுகாப்பு, கண்காணிப்பு மற்றும் செயல்திறன் சிறந்த நடைமுறைகளை நடைமுறை சூழலில் பொருந்தக்கூடியவாறு பிரயோகிப்பீர்கள்
- நடைமுறை அனுபவத்தின் அடிப்படையில் அமர்த்தல்களை டிரபிள்ஷூட் செய்து சீரமைக்க முடியும்

## அடைவு கட்டமைப்பு

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

## விரைவு தொடக்க உதாரணங்கள்

> **💡 AZD-இல் புதியவரா?** உதாரணம் #1 (Flask API)-இன் மூலம் துவங்குங்கள் - இது ~20 நிமிடங்கள் எடுக்கும் மற்றும் முக்கியக் கருத்துக்களை கற்பிக்கும்.

### தொடக்கநிலையினருக்கு
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (உள்ளூர்) ⭐  
   ஒரு எளிய REST API-ஐ scale-to-zero உடன் அமர்த்தவும்  
   **நேரம்:** 20-25 நிமிடங்கள் | **செல்:** $0-5/மாதம்  
   **நீங்கள் கற்று கொள்ளப் போகிறீர்கள்:** அடிப்படை azd வேலைவழிகள், கொண்டெய்னரைகிரசன், ஹெல்த் پروப்ஸ்  
   **எதிர்பார்க்கப்படும் முடிவு:** "Hello, World!"-ஐ 반환 செய்யும் செயல்படும் API ஒருங்கீடை கண்காணிப்புடன்

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   MongoDB உடன் Node.js Express வலை பயன்பாட்டை அமர்த்தவும்  
   **நேரம்:** 25-35 நிமிடங்கள் | **செல்:** $10-30/மாதம்  
   **நீங்கள் கற்று கொள்ளப் போகிறீர்கள்:** தரவுத்தள ஒருங்கிணைப்பு, சுற்றுச்சூழல் மாறிலிகள், இணைப்பு ஸ்டிரிங்குகள்  
   **எதிர்பார்க்கப்படும் முடிவு:** உருவாக்கு/படிக்க/மேம்படுத்த/அழிக்கும் செயல்பாடுகளுடன் Todo பட்டியல் பயன்பாடு

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Azure Static Web Apps கொண்டு React ஸ்டாட்டிக் தளத்தை ஹோஸ்ட் செய்யவும்  
   **நேரம்:** 20-30 நிமிடங்கள் | **செல்:** $0-10/மாதம்  
   **நீங்கள் கற்று கொள்ளப் போகிறீர்கள்:** ஸ்டாட்டிக் ஹோஸ்டிங், சர்வர் லெஸ் ஃபங்க்ஷன்கள், CDN அமர்த்தல்  
   **எதிர்பார்க்கப்படும் முடிவு:** API பின்னணி உடன் React UI, தானாக SSL, உலகளாவிய CDN

### இடைநிலை பயனர்களுக்கு
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (உள்ளூர்) ⭐⭐  
   உரையாடல் இடைமுகத்துடன் gpt-4.1-ஐ அமர்த்தவும் மற்றும் பாதுகாப்பான API விசை மேலாண்மை  
   **நேரம்:** 35-45 நிமிடங்கள் | **செல்:** $50-200/மாதம்  
   **நீங்கள் கற்று கொள்ளப் போகிறீர்கள்:** Microsoft Foundry Models அமர்த்தல், Key Vault ஒருங்கிணைவு, டோக்கன் கண்காணிப்பு  
   **எதிர்பார்க்கப்படும் முடிவு:** gpt-4.1 மற்றும் செலவு கண்காணிப்புடன் செயல்படும் உரையாடல் பயன்பாடு

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (உள்ளூர்) ⭐⭐⭐⭐  
   தயாரிப்பு-தயார் பல்சேவை கட்டமைப்பு  
   **நேரம்:** 45-60 நிமிடங்கள் | **செல்:** $50-150/மாதம்  
   **நீங்கள் கற்று கொள்ளப் போகிறீர்கள்:** சேவை தொடர்பாடல், செய்தி வரிசைகள், விநியோகிக்கப்பட்ட டிரேசிங்  
   **எதிர்பார்க்கப்படும் முடிவு:** கண்காணிப்புடன் 2-சேவை அமைப்பான (API Gateway + Product Service) கணினி

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   C# API மற்றும் Azure SQL தரவுத்தளத்துடன் வலை பயன்பாடு  
   **நேரம்:** 30-45 நிமிடங்கள் | **செல்:** $20-80/மாதம்  
   **நீங்கள் கற்று கொள்ளப் போகிறீர்கள்:** Entity Framework, தரவுத்தள மைக்ரேஷன்கள், இணைப்பு பாதுகாப்பு  
   **எதிர்பார்க்கப்படும் முடிவு:** Azure SQL பின்னணியுடன் C# API, தானாகிய ஸ்கீமா அமர்த்தல்

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   HTTP துடுப்புகளுடன் Python Azure Functions மற்றும் Cosmos DB  
   **நேரம்:** 30-40 நிமிடங்கள் | **செல்:** $10-40/மாதம்  
   **நீங்கள் கற்று கொள்ளப் போகிறீர்கள்:** நிகழ்வு-ஈடுபட்ட கட்டமைப்பு, சர்வர் லெஸ் ஸ்கேலிங், NoSQL ஒருங்கிணைப்பு  
   **எதிர்பார்க்கப்படும் முடிவு:** HTTP கோரிக்கைகளுக்கு பதிலளிக்கும் மற்றும் Cosmos DB சேமிப்பைக் கொண்ட Function App

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Container Apps மற்றும் API கேட் வே உடன் பல்சேவை Java பயன்பாடு  
   **நேரம்:** 60-90 நிமிடங்கள் | **செல்:** $80-200/மாதம்  
   **நீங்கள் கற்று கொள்ளப் போகிறீர்கள்:** Spring Boot அமர்த்தல், சேவை மடல், லோடு பாலன்சிங்  
   **எதிர்பார்க்கப்படும் முடிவு:** சேவை கண்டுபிடித்தல் மற்றும் ரவுடிங்குடன் பல்சேவை Java அமைப்பு

### Microsoft Foundry டெம்ப்ளேடுகள்

1. **[Microsoft Foundry Models Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   உரையாடல் இடைமுகத்துடன் முழுமையான gpt-4.1 அமர்த்தல்  
   **நேரம்:** 35-45 நிமிடங்கள் | **செல்:** $50-200/மாதம்  
   **எதிர்பார்க்கப்படும் முடிவு:** டோக்கன் கண்காணிப்பும் செலவு கண்காணிப்பும் உடைய செயல்படும் உரையாடல் பயன்பாடு

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   RAG கட்டமைப்புடன் கூடிய நுண்ணுணர்வு உரையாடல் பயன்பாடு  
   **நேரம்:** 60-90 நிமிடங்கள் | **செல்:** $100-300/மாதம்  
   **எதிர்பார்க்கப்படும் முடிவு:** ஆவண தேடல் மற்றும் மேற்கோள்களுடன் RAG-சார்ந்த உரையாடல் இடைமுகம்

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Azure AI சேவைகள் பயன்படுத்தி ஆவண பகுப்பாய்வு  
   **நேரம்:** 40-60 நிமிடங்கள் | **செல்:** $20-80/மாதம்  
   **எதிர்பார்க்கப்படும் முடிவு:** பதிவேற்றப்பட்ட ஆவணங்களில் இருந்து உரை, அட்டவணைகள் மற்றும் இனங்கள் எடுத்து வழங்கும் API

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Azure Machine Learning உடன் MLOps வேலைப்பாடு  
   **நேரம்:** 2-3 மணி | **செல்:** $150-500/மாதம்  
   **எதிர்பார்க்கப்படும் முடிவு:** பயிற்சி, அமர்த்தல் மற்றும் கண்காணிப்புடன் தானியங்கி ML பைப்லைன்

### நிஜ உலக சூழல்கள்

#### **Retail Multi-Agent Solution** 🆕
**[முழுமையான அமலாக்கக் கையேடு](./retail-scenario.md)**

AZD மூலம் நிறுவன மட்ட அரசியல் AI பயன்பாடு அமர்த்தலை விளக்கும் விரிவான, தயாரிப்பு-தயார் பல-ஏஜென்ட் வாடிக்கையாளர் ஆதரவு தீர்வு. இந்த سنாரியோ கீழ்க்காணும் அம்ச들을 வழங்குகிறது:
- **Complete Architecture**: திறமையான வாடிக்கையாளர் சேவை மற்றும் கையிருப்பு மேலாண்மை முகவர்கள் கொண்ட பல்வேறு முகவர் அமைப்பு
- **Production Infrastructure**: பல மண்டல Microsoft Foundry Models நிறுவல்கள், AI Search, Container Apps, மற்றும் விரிவான கண்காணிப்பு
- **Ready-to-Deploy ARM Template**: ஒரு கிளிக் மூலம் பல கன்ஃபிகரேஷன் முறைகளுடன் (Minimal/Standard/Premium)
- **Advanced Features**: ரெட்-டீமிங் பாதுகாப்பு சரிபார்ப்பு, முகவர் மதிப்பீடு அமைப்புகள், செலவு 최ுக்கம், மற்றும் பிழைத்திருத்த வழிகாட்டிகள்
- **Real Business Context**: கோப்புகளை பதிவேற்றம் செய்யும், தேடல் ஒருங்கிணைப்பு மற்றும் இடைமாறாக அளவை நீட்டிக்கும் சில்லறை வணிக வாடிக்கையாளர் ஆதரவு பயன்பாடு

**Technologies**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Complexity**: ⭐⭐⭐⭐ (மேம்பட்ட - எண்டர்பிரைஸ் உற்பத்தி-தயார்)

**Perfect for**: AI டெவலப்பர்கள், தீர்வு கட்டமைப்பாளர்கள், மற்றும் உற்பத்தி பல்முகவர் அமைப்புகளை கட்டும் குழுக்களுக்கு சிறந்தது

**Quick Start**: சேர்க்கப்பட்ட ARM வார்ப்புருவைப் பயன்படுத்தி `./deploy.sh -g myResourceGroup` மூலம் முழு தீர்வை 30 நிமிடங்களில் குறைவாக பதிவேற்றவும்

## 📋 பயன்பாட்டு வழிமுறைகள்

### முன்-தேவைகள்

Before running any example:
- ✅ Owner அல்லது Contributor அணுகலுடன் Azure subscription
- ✅ Azure Developer CLI நிறுவப்பட்டிருக்கும் ([நிறுவல் கையேடு](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop இயங்கி இருக்க வேண்டும் (கண்டெய்னர் உதாரணங்களுக்கு)
- ✅ தீர்க்கமான Azure ஒதுக்கீடுகள் (உதாரண-குறிப்பிட்ட தேவைகளைச் சோதிக்கவும்)

> **💰 Cost Warning:** அனைத்து உதாரணங்களும் உண்மையான Azure வளங்களை உருவாக்கும்; இதனால் கட்டணங்கள் ஆகும். செலவு மதிப்பீடுகளுக்காக தனித்தன்மையான README கோப்புகளை பார்க்கவும். தொடர்ந்து செலவுகள் ஏற்படாமல் இருக்க முடிந்தவுடன் `azd down` என்பதைக் இயக்க வேண்டும்.

### உள்ளூரில் உதாரணங்களை இயக்குதல்

1. **உதாரணத்தை கிளோன் செய்யவும் அல்லது நகலெடுக்கவும்**
   ```bash
   # வேண்டிய எடுத்துக்காட்டிற்கு செல்லவும்
   cd examples/simple-web-app
   ```

2. **AZD சூழலை துவக்கவும்**
   ```bash
   # கிடைக்கும் மாதிரியைப் பயன்படுத்தி துவங்கவும்
   azd init
   
   # அல்லது புதிய சூழ்நிலையை உருவாக்கவும்
   azd env new my-environment
   ```

3. **சூழலை கட்டமைக்கவும்**
   ```bash
   # தேவையான மாறிகளை அமைக்கவும்
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **பதிவேற்று**
   ```bash
   # அடிப்படை கட்டமைப்பையும் பயன்பாட்டையும் நிறுவி வெளியிடவும்
   azd up
   ```

5. **பதிவேற்றத்தை சரிபார்க்கவும்**
   ```bash
   # சேவையின் முடிவுப் புள்ளிகளைப் பெறவும்
   azd env get-values
   
   # அந்த முடிவுப் புள்ளியைச் சோதிக்கவும் (உதாரணம்)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **எதிர்பார்க்கப்படும் வெற்றிக் குறியீடுகள்:**
   - ✅ `azd up` பிழைகளின்றி முடிவடைகிறது
   - ✅ சேவை پایانப்ராயின் HTTP 200 ஐ 반환 செய்கிறது
   - ✅ Azure পோர்டல் "Running" நிலையை காண்கிறது
   - ✅ Application Insights பயன்பாட்டின் டெலிமெட்ரியை பெறுகிறது

> **⚠️ பிரச்சினைகள்?** பதிவேற்று பிழைதிருத்தத்திற்கு [பொதுவான பிரச்சினைகள்](../docs/chapter-07-troubleshooting/common-issues.md) ஐப் பார்க்கவும்

### உதாரணங்களைச் செயற்கையாகச் சரிசெய்தல்

Each example includes:
- **README.md** - விரிவான அமைப்பு மற்றும் தனிப்பயன் வழிமுறைகள்
- **azure.yaml** - குறிப்புகளுடன் AZD கட்டமைப்பு
- **infra/** - அளவுரு விளக்கங்களுடன் Bicep வார்ப்புருக்கள்
- **src/** - மாதிரி பயன்பாட்டுக் குறியீடு
- **scripts/** - பொதுவான பணிகளுக்கான உதவிக் ஸ்கிரிப்ட்

## 🎯 கற்றல் இலக்குகள்

### உதாரண வகைகள்

#### **அடிப்படை பதிவேற்றங்கள்**
- ஒரே சேவை பயன்பாடுகள்
- எளிய உள்ளமைப்பு வடிவங்கள்
- அடிப்படை கட்டமைப்பு மேலாண்மை
- செலவு-திறன் மேம்படுத்தப்பட்ட வளர்ச்சிப் பரிமாணங்கள்

#### **மேம்பட்ட சூழ்நிலைகள்**
- பல சேவை கட்டமைப்புகள்
- சிக்கலான நெட்வொர்க் கட்டமைப்புகள்
- தரவுத்தள ஒருங்கிணைப்பு வடிவங்கள்
- பாதுகாப்பு மற்றும் இணக்கக் கொள்கைகள்

#### **உற்பத்தி-தயார் வடிவங்கள்**
- உயர் கிடைக்கத் தன்மை கட்டமைப்புகள்
- கண்காணிப்பு மற்றும் காணொளிக்கணக்குகள்
- CI/CD ஒருங்கிணைப்பு
- பேரழிவு மீட்டெடுத்தல் அமைப்புகள்

## 📖 உதாரண விளக்கங்கள்

### Simple Web App - Node.js Express
**Technologies**: Node.js, Express, MongoDB, Container Apps  
**Complexity**: Beginner  
**Concepts**: அடிப்படை பதிவேற்றம், REST API, NoSQL தரவுத்தள ஒருங்கிணைப்பு

### Static Website - React SPA
**Technologies**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complexity**: Beginner  
**Concepts**: நிலையான ஹோஸ்டிங், ஸெர்வர்-லகற்ற பேக்-எண்ட், நவீன வலை வளர்ச்சி

### Container App - Python Flask
**Technologies**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Complexity**: Beginner  
**Concepts**: கண்டெய்னரைசேஷன், REST API, scale-to-zero, ஹெல்த் ப்ரோப்ஸ், கண்காணிப்பு  
**Location**: [Local Example](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**Technologies**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complexity**: Advanced  
**Concepts**: பல சேவை கட்டமைப்பு, சேவை தொடர்பு, மெசேஜ் க்யூயிங், விநியோகிக்கப்பட்ட டிரேசிங்  
**Location**: [Local Example](../../../examples/container-app/microservices)

### Database App - C# with Azure SQL
**Technologies**: C# ASP.NET Core, Azure SQL Database, App Service  
**Complexity**: Intermediate  
**Concepts**: Entity Framework, தரவுத்தள இணைப்புகள், வலை API வளர்ச்சி

### Serverless Function - Python Azure Functions
**Technologies**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complexity**: Intermediate  
**Concepts**: நிகழ்வு-செயல்பாட்டு கட்டமைப்பு, ஸெர்வர்லெஸ் கணித்தல், முழுமையான ஸ்டாக் வளர்ச்சி

### Microservices - Java Spring Boot
**Technologies**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Complexity**: Intermediate  
**Concepts**: மைக்ரோசர்வீசஸ் தொடர்பு, விநியோகிக்கப்பட்ட சிஸ்டம்கள், எண்டர்ப்ரைஸ் வடிவங்கள்

### Microsoft Foundry Examples

#### Microsoft Foundry Models Chat App
**Technologies**: Microsoft Foundry Models, Cognitive Search, App Service  
**Complexity**: Intermediate  
**Concepts**: RAG ஆர்க்கிடெக்சர், வெக்டர் தேடல், LLM ஒருங்கிணைப்பு

#### AI Document Processing
**Technologies**: Azure AI Document Intelligence, Storage, Functions  
**Complexity**: Intermediate  
**Concepts**: டாக்குமென்ட் பகுப்பு, OCR, தரவு மீட்பு

#### Machine Learning Pipeline
**Technologies**: Azure ML, MLOps, Container Registry  
**Complexity**: Advanced  
**Concepts**: மாடல் பயிற்சி, பிரதி பொருத்து படிகள், கண்காணிப்பு

## 🛠 கட்டமைப்பு உதாரணங்கள்

The `configurations/` directory contains reusable components:

### சூழல் கட்டமைப்புகள்
- வளர்ச்சி சூழல் அமைப்புகள்
- ஸ்டேஜிங் சூழல் கட்டமைப்புகள்
- உற்பத்தி-தயார் கட்டமைப்புகள்
- பல மண்டல பதிவேற்ற அமைப்புகள்

### Bicep தொகுதிகள்
- மறுபயன்படுத்தக்கூடிய உள்ளமைப்பு கூறுகள்
- பொதுவான வள வார்ப்புருக்கள்
- பாதுகாப்பு-முன்னெடுக்கப்பட்ட மாதிரிகள்
- செலவு-சரிசெய்து கொண்ட உள்ளமைப்புகள்

### உதவிக் ஸ்கிரிப்டுகள்
- சூழல் அமைப்பு தானியக்கங்கள்
- தரவுத்தள இடமாற்று ஸ்கிரிப்டுகள்
- பதிவேற்று செல்லுபடியாகும் கருவிகள்
- செலவு கண்காணிப்பு உதவிகள்

## 🔧 தனிப்பயன் வழிகாட்டி

### உங்கள் பயன்பாட்டிற்காக உதாரணங்களை சரிசெய்தல்

1. **முன்-தேவைகளை மறுபரிசீலனை செய்க**
   - Azure சேவை தேவைகளை சரிபார்க்கவும்
   - சந்தா வரம்புகளை உறுதிசெய்க
   - செலவின் விளைவுகளை புரிந்துகொள்ளவும்

2. **கன்ஃபிகரேஷனை மாற்றுக**
   - `azure.yaml` சேவை வரையீடுகளை புதுப்பிக்கவும்
   - Bicep வார்ப்புருக்களை தனிப்பயன் செய்யவும்
   - சூழல் மாறிகள் சீரமைக்கவும்

3. **முழுமையாக சோதிக்கவும்**
   - முதலில் வளர்ச்சி சூழலில் பதிவேற்றம் செய்க
   - செயல்பாட்டை சரிபார்க்கவும்
   - அளவீடு மற்றும் செயல்திறனைக் காசோதிக்கவும்

4. **பாதுகாப்பு பரிசீலனை**
   - அணுகல் கட்டுப்பாடுகளை பரிசீலனை செய்க
   - ரகசிய மேலாண்மையை செயல்படுத்துக
   - கண்காணிப்பு மற்றும் அலெர்ட்டுகளை இயக்கு

## 📊 ஒப்பீட்டு அட்டவணை

| உதாரணம் | சேவைகள் | தரவுத்தளம் | அங்கீகாரம் | கண்காணிப்பு | சிக்கல்தன்மை |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (உள்ளூர்) | 2 | ❌ | Key Vault | Full | ⭐⭐ |
| **Python Flask API** (உள்ளூர்) | 1 | ❌ | Basic | Full | ⭐ |
| **Microservices** (உள்ளூர்) | 5+ | ✅ | Enterprise | Advanced | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Basic | Basic | ⭐ |
| React SPA + Functions | 3 | ✅ | Basic | Full | ⭐ |
| Python Flask Container | 2 | ❌ | Basic | Full | ⭐ |
| C# Web API + SQL | 2 | ✅ | Full | Full | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Full | Full | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Full | Full | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | Full | Full | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Basic | Full | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Full | Full | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (உள்ளூர்) | **8+** | **✅** | **Enterprise** | **Advanced** | **⭐⭐⭐⭐** |

## 🎓 கற்றல் பாதை

### பரிந்துரைக்கப்படும் முன்னேற்றம்

1. **எளிய வலைப் பயன்பாட்டுடன் தொடங்கவும்**
   - அடிப்படை AZD கருத்துக்களை கற்றுக்கொள்ளவும்
   - பதிவேற்று செயல்வழியை புரிந்துகொள்ளவும்
   - சூழல் மேலாண்மையில் பயிற்சி பெறவும்

2. **நிலையான வலைத்தளத்தை முயற்சி செய்யவும்**
   - வெவ்வேறு ஹோஸ்டிங் விருப்பங்களை ஆராயவும்
   - CDN ஒருங்கிணைப்பை கற்றுக்கொள்ளவும்
   - DNS கட்டமைப்பை புரிந்துகொள்ளவும்

3. **Container App க்கு முன்னேறவும்**
   - கண்டெய்னரைசேஷன் அடிப்படைகளை கற்றுக்கொள்ளவும்
   - அளவீட்டு கருத்துக்களை புரிந்துகொள்ளவும்
   - Docker உடன் பயிற்சி செய்யவும்

4. **தரவுத்தள ஒருங்கிணைப்பை சேர்க்கவும்**
   - தரவுத்தள மோசித்தலை கற்றுக்கொள்ளவும்
   - இணைப்பு ஸ்ட்ரிங்களைப் புரிந்துகொள்ளவும்
   - ரகசிய மேலாண்மை பயிற்சி செய்யவும்

5. **சர்வர்-சர்லெஸ் அமைப்புகளை ஆராயவும்**
   - நிகழ்வு-செயல்முறை கட்டமைப்பை புரிந்துகொள்ளவும்
   - ட்ரிக்கர்கள் மற்றும் பைண்டிங்களை கற்றுக்கொள்ளவும்
   - APIகளுடன் பழகவும்

6. **மைக்ரோசர்வீஸ்களை கட்டுங்கள்**
   - சேவை தொடர்பை கற்றுக்கொள்ளவும்
   - விநியோகப்பட்ட சிஸ்டம்களை புரிந்துகொள்ளவும்
   - சிக்கலான பதிவேற்றங்கள் செய்ய பயிற்சி பெறவும்

## 🔍 சரியான உதாரணத்தை கண்டறிதல்

### தொழில்நுட்ப ஸ்டாக் படி
- **Container Apps**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Local)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Local)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Local)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Microservices User Service (Local)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (Local)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### வடிவமைப்பு மாதிரிகள் படி
- **Simple REST API**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Local)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### சிக்கல்தன்மை நிலைபடி
- **Beginner**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Intermediate**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **Advanced**: ML Pipeline
- **Enterprise Production-Ready**: [Microservices (Local)](../../../examples/container-app/microservices) (பல சேவைகள் மற்றும் மெசேஜ் க்யூயிங்), **Retail Multi-Agent Solution** (ARM வார்ப்புருவுடன் முழுமையான பல்முகவர் அமைப்பு பதிவேற்றம்)

## 📚 கூடுதல் வளங்கள்

### ஆவண இணைப்புகள்
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### சமூக உதாரணங்கள்
- [Azure உதாரணங்கள் AZD டெம்ப்ளேடுகள்](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry டெம்ப்ளேடுகள்](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI கேலரி](https://azure.github.io/awesome-azd/)
- [C# மற்றும் Azure SQL உடன் Todo பயன்பாடு](https://github.com/Azure-Samples/todo-csharp-sql)
- [Python மற்றும் MongoDB உடன் Todo பயன்பாடு](https://github.com/Azure-Samples/todo-python-mongo)
- [Node.js மற்றும் PostgreSQL உடன் Todo பயன்பாடு](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [C# API உடன் React வலை பயன்பாடு](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps பணி](https://github.com/Azure-Samples/container-apps-jobs)
- [Java உடன் Azure Functions](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### சிறந்த நடைமுறைகள்
- [Azure நன்கு வடிவமைக்கப்பட்ட கட்டமைப்பு](https://learn.microsoft.com/en-us/azure/well-architected/)
- [மேக ஏற்றுதல் கட்டமைப்பு](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 உதாரணங்கள் பங்களிப்பு

பகிர *ஒரு பயனுள்ள உதாரணம்* இருக்கிறதா? உங்கள் பங்களிப்புகளை நாங்கள் வரவேற்கிறோம்!

### சமர்ப்பிப்புக் கொள்கைகள்
1. நிர்ணயிக்கப்பட்ட அடைவு அமைப்பைப் பின்பற்றவும்
2. விரிவான README.md ஐ சேர்க்கவும்
3. கட்டமைப்பு கோப்புகளில் கருத்துகள் சேர்க்கவும்
4. சமர்ப்பிப்புக்கு முன் முழுமையாக சோதனை செய்யவும்
5. செலவுக் கணக்குகள் மற்றும் முன் தேவைகள் சேர்க்கவும்

### உதாரண டெம்ப்ளேட் அமைப்பு
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

**சிறந்த குறிப்பு**: உங்கள் தொழில்நுட்ப ஸ்டாக்குக்கு பொருந்தும் எளிய உதாரணத்திலிருந்து தொடங்குங்கள், பின்னர் படிப்படியாக மேலும் சிக்கலான சூழ்நிலைகளுக்கு முன்னேறுங்கள். ஒவ்வொரு உதாரணமும் முந்தைய உதாரணங்களின் கருத்துக்களை அடிப்படையாகக் கொண்டுள்ளது!

## 🚀 தொடங்க தயாரா?

### உங்கள் கற்றல் பாதை

1. **முழுமையான தொடக்கநபர்?** → [Flask API](../../../examples/container-app/simple-flask-api) மூலம் தொடங்குங்கள் (⭐, 20 நிமிடங்கள்)
2. **AZD பற்றிய அடிப்படை அறிவு உண்டா?** → [Microservices](../../../examples/container-app/microservices) ஐ முயற்சி செய்யவும் (⭐⭐⭐⭐, 60 நிமிடங்கள்)
3. **AI பயன்பாடுகளை உருவாக்குகிறீர்களா?** → [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) மூலம் தொடங்குங்கள் (⭐⭐, 35 நிமிடங்கள்) அல்லது [Retail Multi-Agent](retail-scenario.md) ஐ ஆய்வு செய்யவும் (⭐⭐⭐⭐, 2+ மணி நேரங்கள்)
4. **குறிப்பிட்ட தொழில்நுட்ப ஸ்டாக் தேவைப்படுகிறதா?** → மேலே உள்ள [சரியான உதாரணத்தை கண்டறிதல்](../../../examples) பிரிவைப் பயன்படுத்துங்கள்

### அடுத்த படிகள்

- ✅ மேலே உள்ள [முன் தேவைகள்](../../../examples) ஐ சரிபார்க்கவும்
- ✅ உங்கள் திறன் மட்டத்திற்கு பொருந்தும் உதாரணத்தைத் தேர்ந்தெடுக்கவும் (பார்வையிடுங்கள் [சிக்கல்தரம் விளக்கம்](../../../examples))
- ✅ அந்த உதாரணத்தின் README ஐ முழுமையாக படிக்கவும் לפני deploy
- ✅ சோதனை முடிந்ததுக்குப் பிறகு `azd down` இயக்க நினைவூட்டலை அமைக்கவும்
- ✅ உங்கள் அனுபவத்தை GitHub Issues அல்லது Discussions மூலம் பகிரவும்

### உதவி வேண்டுமா?

- 📖 [FAQ](../resources/faq.md) - அடிக்கடி கேட்கப்படும் கேள்விகளுக்கான பதிலுகள்
- 🐛 [Troubleshooting Guide](../docs/chapter-07-troubleshooting/common-issues.md) - டிப்ளாய்மென்ட் சிக்கல்களைத் தீர்க்க
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - சமூகத்திடம் கேள்வி கேட்கவும்
- 📚 [Study Guide](../resources/study-guide.md) - உங்கள் கற்றலை உறுதிப்படுத்த

---

**Navigation**
- **📚 பாடநெறி முகப்பு**: [AZD For Beginners](../README.md)
- **📖 படிப்பு வளங்கள்**: [Study Guide](../resources/study-guide.md) | [Cheat Sheet](../resources/cheat-sheet.md) | [Glossary](../resources/glossary.md)
- **🔧 வளங்கள்**: [FAQ](../resources/faq.md) | [Troubleshooting](../docs/chapter-07-troubleshooting/common-issues.md)

---

*கடைசியாக புதுப்பிக்கப்பட்டது: November 2025 | [பிழைகள் அறிக்கையிடவும்](https://github.com/microsoft/AZD-for-beginners/issues) | [உதாரணங்களை பங்களிக்கவும்](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
மறுப்பு:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவையான [Co-op Translator](https://github.com/Azure/co-op-translator) மூலம் மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சித்தாலும், தானியங்கி மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறுகள் இருக்கலாம் என்பதை கவனத்தில் கொள்ளவும். மூல மொழியில் உள்ள அசல் ஆவணம் அதிகாரபூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு தொழில்முறை மனித மொழிபெயர்ப்பை பரிந்துரைக்கிறோம். இந்த மொழிபெயர்ப்பைப் பயன்படுத்தியதனால் ஏற்படும் எந்தவொரு தவறான புரிதல்களுக்கும் அல்லது தவறான விளக்கங்களுக்கும் நாங்கள் பொறுப்பேற்கமாட்டோம்.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->