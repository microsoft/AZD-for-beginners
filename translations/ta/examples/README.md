# உதாரணங்கள் - நடைமுறை AZD டெம்ப்ளேட்டுகள் மற்றும் கட்டமைப்புகள்

**உதாரணங்களைக் கொண்டு கல்வி - அத்தியாயம் வாரியாக ஒழுங்குபடுத்தப்பட்டது**
- **📚 பாடநெறி முகப்பு**: [AZD தொடக்கர்கள்](../README.md)
- **📖 அத்தியாய வரைபடம்**: கற்றல் சிக்கல்நிலையின்படி ஒழுங்குபடுத்தப்பட்ட உதாரணங்கள்
- **🚀 உள்ளூர் உதாரணம்**: [சில்லறை பல முகவர் தீர்வு](retail-scenario.md)
- **🤖 வெளிப்புற AI உதாரணங்கள்**: Azure-Samples ரெப்பொசிட்டரி இணைப்புகள்

> **📍 முக்கியம்: உள்ளூர் vs வெளிப்புற உதாரணங்கள்**  
> இந்த ரெப்பொசிடரி முழுமையான செயல்படுத்தல்களுடன் **4 முழுமையான உள்ளூர் உதாரணங்கள்** கொண்டுள்ளது:  
> - **Microsoft Foundry Models Chat** (gpt-4.1 உரையாடல் இடைமுகத்துடன் அமல்படுத்தல்)  
> - **Container Apps** (எளிய Flask API + மைக்ரோசெர்வீசுகள்)  
> - **Database App** (வலை + SQL தரவுத்தளம்)  
> - **Retail Multi-Agent** (எண்டர்பிரைஸ் AI தீர்வு)  
>  
> கூடுதல் உதாரணங்கள் நீங்கள் கிளோன் செய்யக்கூடிய Azure-Samples ரெப்பொசிட்டரிகளுக்கான **வெளிப்புற குறிப்புகள்**.

## அறிமுகம்

இந்த அடைவு Azure Developer CLI-ஐ கைமுறையாக பயிற்சி செய்து கற்க உதவும் நடைமுறை உதாரணங்களையும் குறிப்பு இணைப்புகளையும் வழங்குகிறது. Retail Multi-Agent காட்சி இந்த ரெப்பொசிடரியில் இணைக்கப்பட்டுள்ள முழுமையான, தயாரிப்பு-தயாரான செயலாக்கம் ஆகும். கூடுதல் உதாரணங்கள் பலவகை AZD மாதிரிகளை காண்பிக்க அதிகாரப்பூர்வ Azure Samples-யை குறிக்கின்றன.

### சிக்கல்நிலை மதிப்பீட்டின் விளக்கம்

- ⭐ **தொடக்கநிலை** - அடிப்படை கருத்துகள், ஒரே சேவை, 15-30 நிமிடம்
- ⭐⭐ **இடைநிலை** - பல சேவைகள், தரவுத்தள ஒன்றிணைப்பு, 30-60 நிமிடம்
- ⭐⭐⭐ **உயர் நிலை** - சிக்கலான கட்டமைப்பு, AI ஒருங்கிணைப்பு, 1-2 மணி
- ⭐⭐⭐⭐ **நிபுணர்** - தயாரிப்பு-தயார், நிறுவன மாதிரிகள், 2+ மணி

## 🎯 இந்த ரெப்பொசிடரியில் உண்மையில் என்ன உள்ளது

### ✅ உள்ளூர் செயலாக்கம் (பயன்பாட்டிற்கு தயாராக)

#### [Microsoft Foundry Models Chat Application](azure-openai-chat/README.md) 🆕
**இந்த ரெப்பொசிடரியில் இணைக்கப்பட்டு முழுமையாக gpt-4.1 அமல்படுத்தல் மற்றும் உரையாடல் இடைமுகம்**

- **இருப்பிடம்:** `examples/azure-openai-chat/`
- **சிக்கல்நிலை:** ⭐⭐ (இடைநிலை)
- **இல் உள்ளவை:**
  - முழுமையான Microsoft Foundry Models அமல்படுத்தல் (gpt-4.1)
  - Python கட்டளை வரி உரையாடல் இடைமுகம்
  - பாதுகாப்பான API முக்கியங்களுக்கான Key Vault ஒருங்கிணைப்பு
  - Bicep அடிப்படை கட்டமைப்பு டெம்ப்ளேட்டுகள்
  - டோக்கன் பயன்படுத்தல் மற்றும் செலவு கண்காணிப்பு
  - அளவுரு வரம்பிடுதல் மற்றும் பிழை கையாளுதல்

**விரைவு தொடக்கம்:**
```bash
# உதாரணத்திற்கு செல்லவும்
cd examples/azure-openai-chat

# எல்லாவரவையும் அமல்படுத்தவும்
azd up

# தேவையான சார்புகளை நிறுவி உரையாடலைத் தொடங்கவும்
pip install -r src/requirements.txt
python src/chat.py
```

**தொழில்நுட்பங்கள்:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Container App Examples](container-app/README.md) 🆕
**இந்த ரெப்பொசிடரியில் உள்ள விரிவான கான்டெய்னர் அமல்படுத்தல் உதாரணங்கள்**

- **இருப்பிடம்:** `examples/container-app/`
- **சிக்கல்நிலை:** ⭐-⭐⭐⭐⭐ (தொடக்கநிலையிலிருந்து நிபுணர் வரை)
- **இல் உள்ளவை:**
  - [மாஸ்டர் கையேடு](container-app/README.md) - கான்டெய்னர் அமல்படுத்தல்களின் முழுமையான அறிமுகம்
  - [எளிய Flask API](../../../examples/container-app/simple-flask-api) - அடிப்படை REST API உதாரணம்
  - [மைக்ரோசெர்வீசஸ் கட்டமைப்பு](../../../examples/container-app/microservices) - தயாரிப்பு-தயாரான பல்சேவை அமல்படுத்தல்
  - விரைவு தொடக்கம், தயாரிப்பு மற்றும் உயர்ந்த மாதிரிகள்
  - கண்காணிப்பு, பாதுகாப்பு, மற்றும் செலவு சிறப்பிக்கல்

**விரைவு தொடக்கம்:**
```bash
# முதன்மை வழிகாட்டியைப் பார்க்க
cd examples/container-app

# எளிய Flask API-ஐ நிலைநிறுத்து
cd simple-flask-api
azd up

# மைக்ரோசேவைகள் எடுத்துக்காட்டை நிலைநிறுத்து
cd ../microservices
azd up
```

**தொழில்நுட்பங்கள்:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent Solution](retail-scenario.md) 🆕
**இந்த ரெப்பொசிடரியில் இணைக்கப்பட்டுள்ள முழுமையான தயாரிப்பு-தயாரான செயலாக்கம்**

- **இருப்பிடம்:** `examples/retail-multiagent-arm-template/`
- **சிக்கல்நிலை:** ⭐⭐⭐⭐ (உயர் நிலை)
- **இல் உள்ளவை:**
  - முழுமையான ARM அமல்படுத்தல் டெம்ப்ளேட்
  - பல முகவர் கட்டமைப்பு (வாடிக்கையாளர் + கையிருப்பு)
  - Microsoft Foundry Models ஒருங்கிணைப்பு
  - RAG உடன் AI தேடல்
  - விரிவான கண்காணிப்பு
  - ஒரே-கிளிக் அமல்படுத்தல் ஸ்கிரிப்ட்

**விரைவு தொடக்கம்:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**தொழில்நுட்பங்கள்:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 வெளிப்புற Azure மாதிரிகள் (கிளோன் செய்து பயன்படுத்தவும்)

இற்க்கண்ட உதாரணங்கள் அதிகாரப்பூர்வ Azure-Samples ரெப்பொசிட்டரிகளில் பராமரிக்கப்படுகின்றன. வெவ்வேறு AZD மாதிரிகளை ஆராய கிளோன் செய்யவும்:

### எளிய பயன்பாடுகள் (அத்தியாயங்கள் 1-2)

| டெம்ப்ளேட் | ரெப்பொசிட்டரி | சிக்கல்நிலை | சேவைகள் |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [உள்ளூர்: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **மைக்ரோசெர்வீசஸ்** | [உள்ளூர்: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | பல சேவைகள், Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**பயன்பாடு எப்படி:**
```bash
# எந்த உதாரணத்தையும் கிளோன் செய்யவும்
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# வெளியிடவும்
azd up
```

### AI பயன்பாடு உதாரணங்கள் (அத்தியாயங்கள் 2, 5, 8)

| டெம்ப்ளேட் | ரெப்பொசிட்டரி | சிக்கல்நிலை | கவனம் |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [உள்ளூர்: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 deployment |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | அடிப்படை AI உரையாடல் |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | முகவர் கட்டமைப்பு |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG மாதிரி |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | நிறுவன AI |

### தரவுத்தளம் & உயர்ந்த மாதிரிகள் (அத்தியாயங்கள் 3-8)

| டெம்ப்ளேட் | ரெப்பொசிட்டரி | சிக்கல்நிலை | கவனம் |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | தரவுத்தள ஒருங்கிணைப்பு |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | பல்சேவை |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## கற்றல் இலக்குகள்

இந்த உதாரணங்களை செயல்படுத்துவதன் மூலம், நீங்கள்:
- யதார்த்த பயன்பாட்டு காட்சிகளுடன் Azure Developer CLI பணிகள் பயிற்சி பெறுவீர்கள்
- பல்வேறு பயன்பாட்டு கட்டமைப்புகள் மற்றும் அவற்றின் azd அமல்படுத்தல்களை புரிந்துகொள்வீர்கள்
- பல Azure சேவைகளுக்கான Infrastructure as Code மாதிரிகளைMaster செய்வீர்கள்
- கட்டமைப்பு மேலாண்மை மற்றும் சூழலுக்கேற்ற அமல்படுத்தல் நெறிமுறைகளை பயன்படுத்துவீர்கள்
- கண்காணிப்பு, பாதுகாப்பு மற்றும் அளவை சீரமைப்பு நெறிமுறைகளை நடைமுறையில் செயல்படுத்துவீர்கள்
- உண்மையான அமல்படுத்தல் காட்சி பிரச்சினைகளை தீர்க்கும் மற்றும் டீபګ் அனுபவம் பெறுவீர்கள்

## கற்றல் பலன்கள்

இந்த உதாரணங்களை முடித்தவுடன், நீங்கள் செய்யக்கூடியவை:
- Azure Developer CLI பயன்படுத்தி பல்வேறு பயன்பாட்டு வகைகளை தைரியமாக வெளியிட முடியும்
- வழங்கப்பட்ட டெம்ப்ளேட்டுகளை உங்கள் சொந்த பயன்பாட்டு தேவைகளுக்கு ஏற்ற வகையில் வடிவமைக்க முடியும்
- Bicep பயன்படுத்தி தனிப்பயன் அமைப்புக் கோடுகளை வடிவமைத்து அமல்படுத்த முடியும்
- சரியான சார்புகளை கொண்டு சிக்கலான பல்சேவை பயன்பாடுகளை கொந்‌பிகர் செய்ய முடியும்
- உண்மையான சூழல்களில் பாதுகாப்பு, கண்காணிப்பு மற்றும் செயல்திறன் சிறந்த நடைமுறைகளை பொருந்துவீர்கள்
- நடைமுறை அனுபவம் அடிப்படையில் அமல்படுத்தல்களை பிரச்சினை தீர்த்து சிறப்பித்து கொள்ள முடியும்

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

## விரைவு தொடக்க உதாரணங்கள்

> **💡 AZD-யில் புதியவரா?** உதாரணம் #1 (Flask API) - இது ~20 நிமிடம் ஆகும் மற்றும் முக்கியக் கருத்துக்களை கற்பிக்கும்.

### தொடக்கர்களுக்காக
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (உள்ளூர்) ⭐  
   ஒரு எளிய REST API-யை scale-to-zero உடன் வெளியிடவும்  
   **நேரம்:** 20-25 நிமிடம் | **செலவு:** $0-5/மாதம்  
   **நீங்கள் கற்றுக்கொள்ளப்போகும்:** அடிப்படை azd பணிவழி, கான்டெய்னரைசேஷன், ஹெல்த் ப்ரோப்ஸ்  
   **எதிர்பார்க்கப்படும் முடிவு:** கண்காணிப்புடன் "Hello, World!" ஐ திருப்பி வழங்கும் செயல்பாட்டுள்ள API ஆதாரம்

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Node.js Express வலை பயன்பாட்டை MongoDB உடன் வெளியிடவும்  
   **நேரம்:** 25-35 நிமிடம் | **செலவு:** $10-30/மாதம்  
   **நீங்கள் கற்றுக்கொள்ளப்போகும்:** தரவுத்தள ஒருங்கிணைப்பு, சுற்றுச்சூழல் மாறிகள், இணைப்பு சரம்  
   **எதிர்பார்க்கப்படும் முடிவு:** உருவாக்க/கேட்பு/த் திருத்த/அழிக்கும் செயல்களைக் கொண்ட Todo பட்டியல் பயன்பாடு

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Azure Static Web Apps கொண்டு React நிலையான வலைத்தளத்தை ஹோஸ்ட் செய்க  
   **நேரம்:** 20-30 நிமிடம் | **செலவு:** $0-10/மாதம்  
   **நீங்கள் கற்றுக்கொள்ளப்போகும்:** நிலையான ஹோஸ்டிங், serverless functions, CDN வெளியீடு  
   **எதிர்பார்க்கப்படும் முடிவு:** API பின்னணி உடன் React UI, தன்னிச்சையான SSL, உலகளாவிய CDN

### இடைநிலை பயனர்களுக்காக
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (உள்ளூர்) ⭐⭐  
   gpt-4.1-ஐ உரையாடல் இடைமுகத்துடன் மற்றும் பாதுகாப்பான API விசை மேலாண்மையுடன் வெளியிடவும்  
   **நேரம்:** 35-45 நிமிடம் | **செலவு:** $50-200/மாதம்  
   **நீங்கள் கற்றுக்கொள்ளப்போகும்:** Microsoft Foundry Models அமல்படுத்தல், Key Vault ஒருங்கிணைப்பு, டோக்கன் கண்காணிப்பு  
   **எதிர்பார்க்கப்படும் முடிவு:** gpt-4.1 மற்றும் செலவு கண்காணிப்புடன் செயல்படும் உரையாடல் பயன்பாடு

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (உள்ளூர்) ⭐⭐⭐⭐  
   தயாரிப்பு-தயாரான பல்சேவை கட்டமைப்பு  
   **நேரம்:** 45-60 நிமிடம் | **செலவு:** $50-150/மாதம்  
   **நீங்கள் கற்றுக்கொள்ளப்போகும்:** சேவை தொடர்பு, செய்தி வரிசை, விசலாக்கத் தடம்  
   **எதிர்பார்க்கப்படும் முடிவு:** கண்காணிப்புடன் 2-சேவை அமைப்பு (API Gateway + Product Service)

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   C# API மற்றும் Azure SQL தரவுத்தளத்துடன் வலை பயன்பாடு  
   **நேரம்:** 30-45 நிமிடம் | **செலவு:** $20-80/மாதம்  
   **நீங்கள் கற்றுக்கொள்ளப்போகும்:** Entity Framework, தரவுத்தள மைக்ரேஷன்கள், இணைப்பு பாதுகாப்பு  
   **எதிர்பார்க்கப்படும் முடிவு:** Azure SQL பின்புலத்துடன் C# API மற்றும் தானாக அமைக்கப்படும் ஸ்கீமா

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   HTTP டிரிகர்களுடன் Python Azure Functions மற்றும் Cosmos DB  
   **நேரம்:** 30-40 நிமிடம் | **செலவு:** $10-40/மாதம்  
   **நீங்கள் கற்றுக்கொள்ளப்போகும்:** நிகழ்வு-இயங்கும் கட்டமைப்பு, serverless அளவீடு, NoSQL ஒருங்கிணைப்பு  
   **எதிர்பார்க்கப்படும் முடிவு:** HTTP கோரிக்கைகளுக்கு பதிலளிக்கும் மற்றும் Cosmos DB-யில் தரவை சேமிக்கும் Function app

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Container Apps மற்றும் API கேட்‌வே உடன் பல்சேவை Java பயன்பாடு  
   **நேரம்:** 60-90 நிமிடம் | **செலவு:** $80-200/மாதம்  
   **நீங்கள் கற்றுக்கொள்ளப்போகும்:** Spring Boot வெளியீடு, சேவை நெட்ஓட்டி, பாரமிதி சமநிலை  
   **எதிர்பார்க்கப்படும் முடிவு:** சேவை கண்டுபிடிப்பு மற்றும் ரவுடிங் உடன் பல்சேவை Java அமைப்பு

### Microsoft Foundry டெம்ப்ளேட்டுகள்

1. **[Microsoft Foundry Models Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   gpt-4.1-ஐ உரையாடல் இடைமுகத்துடன் முழுமையாக அமல்படுத்தல்  
   **நேரம்:** 35-45 நிமிடம் | **செலவு:** $50-200/மாதம்  
   **எதிர்பார்க்கப்படும் முடிவு:** டோக்கன் கண்காணிப்புடன் மற்றும் செலவு கண்காணிப்புடன் செயல்படும் உரையாடல் பயன்பாடு

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   RAG கட்டமைப்புடன் கூடிய நுண்ணறிவு உரையாடல் பயன்பாடு  
   **நேரம்:** 60-90 நிமிடம் | **செலவு:** $100-300/மாதம்  
   **எதிர்பார்க்கப்படும் முடிவு:** ஆவண தேடலும் மேற்கோள்களுடன் RAG-ஆல் இயக்கப்படும் உரையாடல் இடைமுகம்

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Azure AI சேவைகளைப் பயன்படுத்து ஆவண பகுப்பு  
   **நேரம்:** 40-60 நிமிடம் | **செலவு:** $20-80/மாதம்  
   **எதிர்பார்க்கப்படும் முடிவு:** பதிவேற்றப்பட்ட ஆவணங்களிலிருந்து உரை, அட்டவணைகள் மற்றும் உள்ளக்கூறுகளைப் பெறும் API

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Azure Machine Learning உடன் MLOps பணிவழி  
   **நேரம்:** 2-3 மணி | **செலவு:** $150-500/மாதம்  
   **எதிர்பார்க்கப்படும் முடிவு:** பயிற்சி, வெளியீடு மற்றும் கண்காணிப்புடன் தானியங்கி ML பைப்‌லைன்

### உண்மை உலக காட்சிகள்

#### **சில்லறை பல முகவர் தீர்வு** 🆕  
**[முழு செயலாக்கக் கையேடு](./retail-scenario.md)**

ஒருங்கிணைந்த, தயாரிப்பு-தயாரான பல முகவர் வாடிக்கையாளர் ஆதரவு தீர்வு, இது AZD உடன் நிறுவனத் தர முதலியல் AI பயன்பாட்டு வெளியீட்டை காட்டுகிறது. இந்த காட்சி வழங்குகிறது:

- **முழுமையான கட்டமைப்பு**: குறிப்பிட்ட வாடிக்கையாளர் சேவை மற்றும் கையிருப்பு மேலாண்மை முகவர்களுடன் பல முகவர் அமைப்பு
- **உற்பத்தி கட்டமைப்பு**: பல-பிராந்திய Microsoft Foundry Models அடுக்குகள், AI Search, Container Apps, மற்றும் முழுமையான கண்காணிப்பு
- **நிருவனம்-தயாரான ARM Template**: பல கட்டமைப்பு முறைகளுடன் (Minimal/Standard/Premium) ஒரே-கிளிக் நிறுவல்
- **முன்னேற்றப்பட்ட அம்சங்கள்**: ரெட்-டீமிங் பாதுகாப்பு சரிபார்ப்பு, ஏஜென்ட் மதிப்பீடு கட்டமைப்பு, செலவு மேம்படுத்துதல், மற்றும் பிரச்சனை தீர்க்கும் வழிகாட்டிகள்
- **உண்மையான வணிக சூழல்**: கோப்புகள் பதிவேற்றி, தேடல் ஒருங்கிணைப்பு மற்றும் தானியங்கி அளவீடு கொண்ட சில்லறை வணிக வாடிக்கையாளர் ஆதரவு பயன்பாடு

**தொழில்நுட்பங்கள்**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**சிக்கல்தன்மை**: ⭐⭐⭐⭐ (அதிகரித்தது - எண்டர்பிரைஸ் உற்பத்திக்குத் தயாரானது)

**மிகச் சிறந்தது**: AI டெவலப்பர்கள், தீர்வு வடிவமைப்பாளர்கள், மற்றும் உற்பத்தி பல-ஏஜென்ட் அமைப்புகளை உருவாக்கும் குழுக்கள்

**அறிமுகத்துறையா தொடக்கம்**: இணைக்கப்பட்ட ARM டெம்ப்ளேட்டை `./deploy.sh -g myResourceGroup` கொண்டு பயன்படுத்தி முழுமையான தீர்வை 30 நிமிடங்களிற்குள் நிறுவவும்

## 📋 பயன்முறை வழிமுறைகள்

### முன் தேவைகள்

எந்த உதாரணத்தையும் இயக்கும் முன்:
- ✅ Owner அல்லது Contributor அணுகலுடன் Azure சந்தா
- ✅ Azure Developer CLI நிறுவப்பட்டிருக்க வேண்டும் ([நிறுவல் வழிகாட்டி](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop இயங்கிவர வேண்டும் (container உதாரணங்களுக்கு)
- ✅ சரியான Azure குவோட்டாக்கள் (உதாரணம்-சார்ந்த தேவைகளைச் சரிபார்க்கவும்)

> **💰 செலவு எச்சரிக்கை:** அனைத்து உதாரணங்களும் கட்டணத்தை ஏற்படுத்தும் உண்மையான Azure வளங்களை உருவாக்குகின்றன. செலவு மதிப்பீடுகளைப் பார்க்க தனித்த README கோப்புகளைப் பார்க்கவும். நிலையான கட்டணங்களைத் தவிர்க்க `azd down` ஐ முடிந்தவுடன் இயக்க மறவாதீர்கள்.

### உள்ளூரில் உதாரணங்களை இயக்குதல்

1. **உதாரணத்தை கிளோன் அல்லது நகலெடுக்கவும்**
   ```bash
   # வேண்டிய உதாரணத்திற்கு செல்லவும்
   cd examples/simple-web-app
   ```

2. **AZD சுற்றுச்சூழலை ஆரம்பிக்கவும்**
   ```bash
   # ஏற்கனவே உள்ள டெம்ப்ளேட்டுடன் தொடங்கவும்
   azd init
   
   # அல்லது புதிய சூழலை உருவாக்கவும்
   azd env new my-environment
   ```

3. **சுற்றுச்சூழலை கட்டமைக்கவும்**
   ```bash
   # தேவையான மாறிலிகளை அமைக்கவும்
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **நிறுவல்**
   ```bash
   # அடித்தள அமைப்பையும் பயன்பாட்டையும் வெளியிடவும்
   azd up
   ```

5. **நிறுவலைச் சரிபார்க்கவும்**
   ```bash
   # சேவை இறுதிப் புள்ளிகளைப் பெறவும்
   azd env get-values
   
   # இறுதிப் புள்ளியைச் சோதிக்கவும் (உதாரணம்)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **எதிர்பார்க்கப்படும் வெற்றி குறியீடுகள்:**
   - ✅ `azd up` பிழைவின்றி நிறைவேறுகிறது
   - ✅ சேவை என்ட்பாயின்ட் HTTP 200 ஐ வழங்குகிறது
   - ✅ Azure போர்டல் "Running" நிலையை காட்டுகிறது
   - ✅ Application Insights டெலிமெட்ரி பெறுகிறது

> **⚠️ பிரச்சினைகள் உள்ளதா?** பதவிப் பிரச்சனைகள் மற்றும் நிறுவல் பிரச்சனைகள் பற்றி [பொதுவான பிரச்சினைகள்](../docs/chapter-07-troubleshooting/common-issues.md) பார்க்கவும்

### உதாரணங்களை உகந்தவாறு மாற்றுதல்

ஒவ்வொரு உதாரணத்திலும் அடங்கும்:
- **README.md** - விரிவான அமைப்பு மற்றும் தனிப்பயன்பாடு அறிவுரைகள்
- **azure.yaml** - கருத்துகளுடன் AZD கட்டமைப்பு
- **infra/** - அளவுரு விளக்கங்கள் கொண்ட Bicep டெம்ப்ளேடுகள்
- **src/** - மாதிரி பயன்பாடு குறியீடு
- **scripts/** - பொதுவான பணிகளுக்கான உதவி ஸ்கிரிப்ட்கள்

## 🎯 கற்றல் நோக்கங்கள்

### உதாரண வகைகள்

#### **அடிப்படை நிறுவல்கள்**
- ஏக சேவை பயன்பாடுகள்
- எளிய இன்ப்ராஸ்ட்ரக்சர் முறைமைகள்
- அடிப்படை கட்டமைப்பு மேலாண்மை
- செலவு-முறைமையாகிய மேம்பாட்டு அமைப்புகள்

#### **முன்னேற்ற сценарிகள்**
- பல-சேவை கட்டமைப்புகள்
- சிக்கலான நெட்வொர்க்கிங் கட்டமைப்புகள்
- தரவுத்தள இணைப்பு முறைமைகள்
- பாதுகாப்பு மற்றும் இணக்கமான நடைமுறைகள்

#### **உற்பத்தி-தயார் முறைமைகள்**
- உயர்ந்த கிடைப்புத்தன்மை கட்டமைப்புகள்
- கண்காணிப்பு மற்றும் கவனிப்புத்தன்மை
- CI/CD ஒருங்கிணைப்பு
- விபத்து மீட்பு அமைப்புகள்

## 📖 உதாரணங்களின் விவரங்கள்

### எளிய வலைப் பயன்பாடு - Node.js Express
**தொழில்நுட்பங்கள்**: Node.js, Express, MongoDB, Container Apps  
**சிக்கல்தன்மை**: துவக்க நிலை  
**கருத்துகள்**: அடிப்படை நிறுவல், REST API, NoSQL தரவுத்தள இணைப்பு

### நிலையான இணையதளம் - React SPA
**தொழில்நுட்பங்கள்**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**சிக்கல்தன்மை**: துவக்க நிலை  
**கருத்துகள்**: நிலையான ஹோஸ்டிங், சர்வர்லெஸ் பேக்கெண்ட், நவீன வலை பயன்பாடு

### Container App - Python Flask
**தொழில்நுட்பங்கள்**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**சிக்கல்தன்மை**: துவக்க நிலை  
**கருத்துகள்**: கண்டெய்னரீசென், REST API, scale-to-zero, ஹெல்த் ப்ரோப்கள், கண்காணிப்பு  
**இடம்**: [உள்ளூர் உதாரணம்](../../../examples/container-app/simple-flask-api)

### Container App - மைக்ரோசேவைகள் கட்டமைப்பு
**தொழில்நுட்பங்கள்**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**சிக்கல்தன்மை**: முன்னேற்றம்  
**கருத்துகள்**: பல-சேவை கட்டமைப்பு, சேவை தொடர்புகள், செய்தி வரிசை நிறுவல், விநியோக திண்ணை டிரேசிங்  
**இடம்**: [உள்ளூர் உதாரணம்](../../../examples/container-app/microservices)

### தரவுத் தள பயன்பாடு - C# மற்றும் Azure SQL
**தொழில்நுட்பங்கள்**: C# ASP.NET Core, Azure SQL Database, App Service  
**சிக்கல்தன்மை**: நடுத்தரம்  
**கருத்துகள்**: Entity Framework, தரவுத்தள இணைப்புகள், வலை API மேம்பாடு

### சர்வர்லெஸ் செயலி - Python Azure Functions
**தொழில்நுட்பங்கள்**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**சிக்கல்தன்மை**: நடுத்தரம்  
**கருத்துகள்**: நிகழ்வு-இயங்கும் முன்முறைமை, சர்வர்லெஸ் கம்ப்யூட்டிங், முழு-ஸ்டாக் மேம்பாடு

### மைக்ரோசேவைகள் - Java Spring Boot
**தொழில்நுட்பங்கள்**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**சிக்கல்தன்மை**: நடுத்தரம்  
**கருத்துகள்**: மைக்ரோசேவைகள் தொடர்பு, விநியோக சிஸ்டம்கள், நிறுவன மாதிரிகள்

### Microsoft Foundry உதাহாரணங்கள்

#### Microsoft Foundry Models உரையாடல் பயன்பாடு
**தொழில்நுட்பங்கள்**: Microsoft Foundry Models, Azure AI Search, App Service  
**சிக்கல்தன்மை**: நடுத்தரம்  
**கருத்துகள்**: RAG கட்டமைப்பு, வெக்டர் தேடல், LLM ஒருங்கிணைப்பு

#### AI ஆவண செயலாக்கம்
**தொழில்நுட்பங்கள்**: Azure AI Document Intelligence, Storage, Functions  
**சிக்கல்தன்மை**: நடுத்தரம்  
**கருத்துகள்**: ஆவண பகுப்பாய்வு, OCR, தரவு எடுப்பு

#### மெஷின் லேர்னிங் பைப்லைன்
**தொழில்நுட்பங்கள்**: Azure ML, MLOps, Container Registry  
**சிக்கல்தன்மை**: முன்னேற்றம்  
**கருத்துகள்**: மாதிரி பயிற்சி, வெளியீட்டு பைப்லைன்கள், கண்காணிப்பு

## 🛠 கட்டமைப்பு உதாரணங்கள்

`configurations/` கோப்பகத்தில் மீண்டும் பயன்படுத்தக்கூடிய கூறுகள் அடங்கும்:

### சுற்றுச்சூழல் கட்டமைப்புகள்
- மேம்பாட்டு சுற்றுச்சூழல் அமைப்புகள்
- ஸ்டேஜிங் சுற்றுச்சூழல் கட்டமைப்புகள்
- உற்பத்தி-தயார் கட்டமைப்புகள்
- பல-பிராந்திய அமைப்புகள்

### Bicep மாடியூல்கள்
- மீண்டும் பயன்பாட可能மான உள்கட்டமைப்பு கூறுகள்
- பொதுவான வள சீர்முயற்சி மாதிரிகள்
- பாதுகாப்பு-அரைக்கப்பட்ட டெம்ப்ளேடுகள்
- செலவு-மேம்படுத்தப்பட்ட கட்டமைப்புகள்

### உதவி ஸ்கிரிப்டுகள்
- சுற்றுச்சூழல் அமைப்பு தானியக்கத்திடம்
- தரவுத்தள மைഗ്രேஷன் ஸ்கிரிப்டுகள்
- நிறுவல் சரிபார்ப்பு கருவிகள்
- செலவு கண்காணிப்பு பயன்பாடுகள்

## 🔧 தனிப்பயனாக்கல் வழிகாட்டி

### உங்கள் பயன்பாட்டிற்கு உதாரணங்களை அமைத்தல்

1. **முன் தேவைகளை அணுகுங்கள்**
   - Azure சேவை தேவைகளைப் சரிபார்க்கவும்
   - சந்தா வரம்புகளை உறுதிப்படுத்தவும்
   - செலவு விளைவுகளை புரிந்து கொள்ளவும்

2. **கட்டமைப்புகளை மாற்றவும்**
   - `azure.yaml` சேவை வரையறைகளை அப்டேட் செய்யவும்
   - Bicep டெம்ப்ளேடுகளை தனிப்பயனாக்கவும்
   - சுற்றுச்சூழல் மாறிகள் சரிசெய்யவும்

3. **முழுமையாக சோதிக்கவும்**
   - முதலில் மேம்பாட்டு சுற்றுச்சூழலிற்கு நிறுவவும்
   - செயல்பாட்டை உறுதிப்படுத்தவும்
   - அளவீடு மற்றும் செயல்திறன் சோதிக்கவும்

4. **பாதுகாப்பு மதிப்பாய்வு**
   - அணுகல் கட்டுப்பாடுகளை மதிப்பாய்வு செய்யவும்
   - இரகசிய மேலாண்மையை செயல்படுத்தவும்
   - கண்காணிப்பு மற்றும் அலர்ட்களை இயக்கு

## 📊 ஒப்பீட்டு அட்டவணை

| Example | Services | Database | Auth | Monitoring | Complexity |
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

1. **எளிய வலை பயன்பாட்டுடன் தொடங்குங்கள்**
   - அடிப்படை AZD கொள்கைகளை கற்றுக்கொள்ளுங்கள்
   - நிறுவும் பணிமுறை ஓரிருை புரிந்து கொள்ளுங்கள்
   - சுற்றுச்சூழல் மேலாண்மையை பயிற்சி செய்யுங்கள்

2. **நிலையான இணையதளத்தை முயற்சிக்கவும்**
   - வேறுபட்ட ஹோஸ்டிங் விருப்பங்களை ஆராயுங்கள்
   - CDN ஒருங்கிணைப்பைப் பற்றி கற்றுக்கொள்ளுங்கள்
   - DNS கட்டமைப்பை புரிந்துகொள்ளுங்கள்

3. **Container App வெபிற்கு நகருங்கள்**
   - கண்டெய்னரீசென் அடிப்படைகளை கற்றுக் கொள்ளுங்கள்
   - அளவீட்டு கருத்துக்களை புரிந்துகொள்ளுங்கள்
   - Docker உடன் பயிற்சி செய்யுங்கள்

4. **தரவுத்தள இணைப்பை சேர்க்கவும்**
   - தரவுத்தள உருவாக்கம் கற்றுக்கொள்ளுங்கள்
   - தொடர்பு ஸ்ட்ரிங்களை புரிந்து கொள்ளுங்கள்
   - இரகசிய மேலாண்மையை பயிற்சி செய்யுங்கள்

5. **சர்வர்லெஸ்ஸை ஆராயுங்கள்**
   - நிகழ்வு-இயங்கும் கட்டமைப்பை புரிந்துகொள்ளுங்கள்
   - டிரிகர்கள் மற்றும் பைன்டிங்களை கற்றுக்கொள்ளுங்கள்
   - API-களுடன் பயிற்சி செய்யுங்கள்

6. **மைக்ரோசேவைகள் கட்டமைக்கத் தொடங்குங்கள்**
   - சேவை தொடர்பைக் கற்றுக்கொள்ளுங்கள்
   - விநியோக சிஸ்டம்களைப் புரிந்துகொள்ளுங்கள்
   - சிக்கலான வெளியீடுகளில் பயிற்சி செய்யுங்கள்

## 🔍 சரியான உதாரணத்தை கண்டறிதல்

### தொழில்நுட்பத் தொகுப்பு மூலம்
- **Container Apps**: [Python Flask API (உள்ளூர்)](../../../examples/container-app/simple-flask-api), [Microservices (உள்ளூர்)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (உள்ளூர்)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (உள்ளூர்)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (உள்ளூர்)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (உள்ளூர்)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Microservices User Service (உள்ளூர்)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **கண்டெய்னர்கள்**: [Python Flask (உள்ளூர்)](../../../examples/container-app/simple-flask-api), [Microservices (உள்ளூர்)](../../../examples/container-app/microservices), Java Microservices
- **தரவுத்தளங்கள்**: [Microservices (உள்ளூர்)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (உள்ளூர்)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **பல-ஏஜென்ட் சிஸ்டம்கள்**: **Retail Multi-Agent Solution**
- **OpenAI ஒருங்கிணைப்பு**: **[Microsoft Foundry Models Chat (உள்ளூர்)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **நிறுவன உற்பத்தி**: [Microservices (உள்ளூர்)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### கட்டமைப்பு மாதிரி மூலம்
- **எளிய REST API**: [Python Flask API (உள்ளூர்)](../../../examples/container-app/simple-flask-api)
- **மொனோலித்**: Node.js Express Todo, C# Web API + SQL
- **நிலையான + சர்வர்லெஸ்**: React SPA + Functions, Python Functions + SPA
- **மைக்ரோசேவைகள்**: [Production Microservices (உள்ளூர்)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **கண்டெய்னர்அய்ஸ்**: [Python Flask (உள்ளூர்)](../../../examples/container-app/simple-flask-api), [Microservices (உள்ளூர்)](../../../examples/container-app/microservices)
- **AI சக்தியூட்டப்பட்டவை**: **[Microsoft Foundry Models Chat (உள்ளூர்)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **பல-ஏஜென்ட் கட்டமைப்பு**: **Retail Multi-Agent Solution**
- **நிறுவன பல-சேவை**: [Microservices (உள்ளூர்)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### சிக்கல்தன்மை அடிப்படையில்
- **துவக்க நிலை**: [Python Flask API (உள்ளூர்)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **நடுத்தரம்**: **[Microsoft Foundry Models Chat (உள்ளூர்)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **முன்னேற்றம்**: ML Pipeline
- **நிறுவன உற்பத்தி-தயார்**: [Microservices (உள்ளூர்)](../../../examples/container-app/microservices) (பல-சேவைகள் மற்றும் செய்தி வரிசை), **Retail Multi-Agent Solution** (ARM டெம்ப்ளேட் வெளியீட்டுடன் முழுமையான பல-ஏஜென்ட் அமைப்பு)

## 📚 கூடுதல் வளங்கள்

### ஆவண இணைப்புகள்
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### சமூக உதாரணங்கள்
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [C# மற்றும் Azure SQL உடன் Todo பயன்பாடு](https://github.com/Azure-Samples/todo-csharp-sql)
- [Python மற்றும் MongoDB உடன் Todo பயன்பாடு](https://github.com/Azure-Samples/todo-python-mongo)
- [Node.js மற்றும் PostgreSQL உடன் Todo பயன்பாடு](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React வலைப் பயன்பாடு C# API உடன்](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps வேலை](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions Java உடன்](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### சிறந்த நடைமுறைகள்
- [Azure நன்கு வடிவமைக்கப்பட்ட கட்டமைப்பு](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 உதாரணங்கள் பங்களித்தல்

பகிர்ந்து கொள்ள பயனுள்ள உதாரணம் உள்ளதா? உங்கள் பங்களிப்புகளை வரவேற்கிறோம்!

### சமர்ப்பிப்பு வழிமுறைகள்
1. நிலைப்படுத்தப்பட்ட அடைவு கட்டமைப்பை பின்பற்றவும்
2. விரிவான README.md ஐச் சேர்க்கவும்
3. கட்டமைப்பு கோப்புகளில் கருத்துக்களை சேர்க்கவும்
4. சமர்ப்பிப்பதற்கு முன் முழுமையாக சோதனை செய்யவும்
5. செலவுக் கணக்குகள் மற்றும் முன் அவசியங்களைச் சேர்க்கவும்

### உதாரண வார்ப்புரு கட்டமைப்பு
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

**சிறந்த குறிப்பு**: உங்கள் தொழில்நுட்பத் தொகுப்பிற்கு பொருந்தும் மிக எளிய உதாரணத்திலிருந்து தொடங்குங்கள், பின்னர் மெதுவாக மேலும் சிக்கலான சூழ்நிலைகளுக்கு முன்னேறுங்கள். ஒவ்வொரு உதாரணமும் முந்தையவற்றிலிருந்து கருத்துக்களை அடிப்படையாகக் கொண்டு கட்டமைக்கப்படுகிறது!

## 🚀 தொடங்க தயார்?

### உங்கள் கற்றல் பாதை

1. **முழு தொடக்கமா?** → தொடங்க [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 நிமிடங்கள்)
2. **AZD பற்றிய அடிப்படை அறிவு உண்டா?** → முயற்சி செய்க [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 நிமிடங்கள்)
3. **AI பயன்பாடுகள் உருவாக்குகிறீர்களா?** → தொடங்குங்கள் [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 நிமிடங்கள்) அல்லது ஆராயுங்கள் [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ மணி நேரங்கள்)
4. **குறிப்பிட்ட தொழில்நுட்ப தொகுப்பு வேண்டுமா?** → மேலே உள்ள [சரியான உதாரணத்தை கண்டறிதல்](#-finding-the-right-example) பிரிவைப் பயன்படுத்தவும்

### அடுத்த படிகள்

- ✅ மேல் உள்ள [முன் தேவைகள்](#முன்-தேவைகள்) ஐப் பரிசீலிக்கவும்
- ✅ உங்கள் திறன் மட்டத்திற்கு பொருந்தும் ஒரு உதாரணத்தை தேர்ந்தெடுக்கவும் (பாருங்கள் [சிக்கல்தன்மை விளக்கம்](#சிக்கல்நிலை-மதிப்பீட்டின்-விளக்கம்))
- ✅ உதாரணத்தின் README-ஐ நன்கு படித்து பிறகு டிப்ப்ளாய்மென்ட் செய்யவும்
- ✅ சோதனைக்கு பிறகு `azd down` இயக்க நினைவூட்டலை அமைக்கவும்
- ✅ உங்கள் அனுபவத்தை GitHub Issues அல்லது Discussions மூலம் பகிரவும்

### உதவி தேவை?

- 📖 [FAQ](../resources/faq.md) - பொதுவாக கேட்கப்படும் கேள்விகளுக்கு பதில்கள்
- 🐛 [Troubleshooting Guide](../docs/chapter-07-troubleshooting/common-issues.md) - பதிப்பேற்ற பிரச்சனைகளை சரி செய்யுங்கள்
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - சமுதாயத்தில் கேள்வி கேளுங்கள்
- 📚 [Study Guide](../resources/study-guide.md) - உங்கள் கற்றலை வலுப்படுத்துங்கள்

---

**வழிசெலுத்தல்**
- **📚 பாடநெறி முகப்பு**: [AZD For Beginners](../README.md)
- **📖 பயிற்சி வளங்கள்**: [Study Guide](../resources/study-guide.md) | [Cheat Sheet](../resources/cheat-sheet.md) | [Glossary](../resources/glossary.md)
- **🔧 வளங்கள்**: [FAQ](../resources/faq.md) | [Troubleshooting](../docs/chapter-07-troubleshooting/common-issues.md)

---

*கடைசியாக புதுப்பிக்கப்பட்டது: நவம்பர் 2025 | [பிரச்சனைகள் அறிக்கையிடவும்](https://github.com/microsoft/AZD-for-beginners/issues) | [உதாரணங்கள் பங்களிக்கவும்](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**மறுப்பு**:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவை [Co-op Translator](https://github.com/Azure/co-op-translator) பயன்படுத்தி மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சி செய்துள்ளோம், ஆனால் தானாக செய்யப்படும் மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறுகள் இருக்கலாம் என்பதை கவனத்தில் கொள்ளவும். அசல் ஆவணம் அதன் தாய்மொழியில் அதிகாரப்பூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்நுட்பமான மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்த தவறான புரிதல்கள் அல்லது தவறான விளக்கத்திற்கும் நாங்கள் பொறுப்பில்வில்லை.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->