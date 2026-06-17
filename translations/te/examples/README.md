# ఉదాహరణలు - ప్రాక్టికల్ AZD టెంప్లేట్లు మరియు కాన్ఫిగరేషన్లు

**ఉదాహరణల ద్వారా నేర్చుకోండి - అధ్యాయాల వారీగా ఏర్పాటు**
- **📚 కోర్సు హోమ్**: [AZD ప్రారంభికులకు](../README.md)
- **📖 అధ్యాయ మ్యాపింగ్**: అభ్యాస స్థాయి ఆధారంగా ఏర్పాటుచేయబడిన ఉదాహరణలు
- **🚀 లోకల్ ఉదాహరణ**: [రిటెయిల్ బహుళ ఏజెంట్ పరిష్కారం](retail-scenario.md)
- **🤖 బాహ్య AI ఉదాహరణలు**: Azure Samples రిపోజిటరీల లింకులు

> **📍 ముఖ్యము: లోకల్ vs బాహ్య ఉదాహరణలు**  
> ఈ రిపోజిటరీలో పూర్తి అమలుతో కూడిన **4 పూర్తి లోకల్ ఉదాహరణలు** ఉన్నాయి:  
> - **Microsoft Foundry Models Chat** (gpt-4.1 deployment తో చాట్ ఇంటర్‌ఫేస్)  
> - **Container Apps** (సాధారణ Flask API + మైక్రోవర్సీసులు)  
> - **Database App** (వెబ్ + SQL డేటాబేస్)  
> - **Retail Multi-Agent** (ఎంటర్‌ప్రైజ్ AI పరిష్కారం)  
>  
> అదనపు ఉదాహరణలు అనేవి మీరు క్లోన్ చేయగల Azure-Samples రిపోజిటరీలకు చెందిన **బాహ్య సూచనలు**.

## పరిచయం

ఈ డైరెక్టరీ వాస్తవిక ఉదాహరణలు మరియు సూచనలను అందిస్తుంది, అవి చేతితో ప్రాక్టీస్ ద్వారా Azure Developer CLI నేర్చుకునేందుకు సహాయపడతాయి. రిటెయిల్ బహుళ ఏజెంట్ సన్నివేశం ఈ రిపోజిటరీలో చేర్చబడిన పూర్తి, ప్రొడక్షన్-రెడి అమలుగా ఉంది. అదనపు ఉదాహరణలు వివిధ AZD శైలులను ప్రదర్శించే అధికారిక Azure Samples ను సూచిస్తాయి.

### సంక్లిష్టత రేటింగ్ లెజెండ్

- ⭐ **ప్రాథమికులు** - ప్రాథమిక ఆలోచనలు, ఒకే సేవ, 15-30 నిమిషాలు
- ⭐⭐ **మధ్యస్థ** - బహుళ సేవలు, డేటాబేస్ సమీకరణ, 30-60 నిమిషాలు
- ⭐⭐⭐ **అభివృద్ధి స్థాయి** - సంక్లిష్ట ఆర్కిటెక్చర్, AI సమన్వయం, 1-2 గంటలు
- ⭐⭐⭐⭐ **నిపుణులు** - ప్రొడక్షన్-రెడి, ఎంటర్‌ప్రైజ్ శైలులు, 2+ గంటలు

## 🎯 ఈ రిపోజిటరీలో వాస్తవంగా ఏముంది

### ✅ లోకల్ అమలు (ఉపయోగానికి సిద్ధం)

#### [Microsoft Foundry Models Chat అనువర్తనం](azure-openai-chat/README.md) 🆕
**ఈ రిపోజిటరీలో చాట్ ఇంటర్‌ఫేస్‌తో కూడిన పూర్తి gpt-4.1 డిప్లాయ్‌మెంట్ అమర్చబడింది**

- **స్థానం:** `examples/azure-openai-chat/`
- **సంక్లిష్టత:** ⭐⭐ (మధ్యస్థ)
- **ఏం చేర్చబడింది:**
  - పూర్తి Microsoft Foundry Models డిప్లాయ్‌మెంట్ (gpt-4.1)
  - Python కమాండ్-లైన్ చాట్ ఇంటర్‌ఫేస్
  - సురక్షిత API కీల కోసం Key Vault సమైక్యం
  - Bicep ఇన్‌ఫ్రాస్ట్రక్చర్ టెంప్లేట్లు
  - టోకెన్ వినియోగం మరియు ఖర్చు ట్రాకింగ్
  - రేట్ పరిమితి మరియు లోప నిర్వహణ

**త్వర ప్రారంభం:**
```bash
# ఉదాహరణకు నావిగేట్ చేయండి
cd examples/azure-openai-chat

# అన్నింటిని అమలు చేయండి
azd up

# ఆవలంబనలు ఇన్‌స్టాల్ చేసి చాటింగ్ ప్రారంభించండి
pip install -r src/requirements.txt
python src/chat.py
```

- **సాంకేతికతలు:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Container App ఉదాహరణలు](container-app/README.md) 🆕
**ఈ రిపోజిటరీలో సమగ్ర కంటైనర్ డిప్లాయ్‌మెంట్ ఉదాహరణలు ఉన్నాయి**

- **స్థానం:** `examples/container-app/`
- **సంక్లిష్టత:** ⭐-⭐⭐⭐⭐ (ప్రాథమిక నుంచి అభివృద్ధి వరకూ)
- **ఏం చేర్చబడింది:**
  - [మాస్టర్ గైడ్](container-app/README.md) - కంటైనర్ డిప్లాయ్‌మెంట్ల పూర్తి అవలోకనం
  - [Simple Flask API](../../../examples/container-app/simple-flask-api) - ప్రాథమిక REST API ఉదాహరణ
  - [Microservices Architecture](../../../examples/container-app/microservices) - ప్రొడక్షన్-రెడి బహుసర్వీస్ డిప్లాయ్‌మెంట్
  - త్వరిత ప్రారంభం, ప్రొడక్షన్, మరియు అభివృద్ధి శైలులు
  - మానిటరింగ్, భద్రత, మరియు ఖర్చు ఆప్టిమైజేషన్

**త్వర ప్రారంభం:**
```bash
# మాస్టర్ గైడ్ చూడండి
cd examples/container-app

# సరళమైన Flask APIని అమర్చండి
cd simple-flask-api
azd up

# మైక్రోసర్వీసుల ఉదాహరణను అమర్చండి
cd ../microservices
azd up
```

- **సాంకేతికతలు:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [రిటెయిల్ బహుళ ఏజెంట్ పరిష్కారం](retail-scenario.md) 🆕
**ఈ రిపోజిటరీలో పూర్తి ప్రొడక్షన్-రెడి అమలు చేర్చబడింది**

- **స్థానం:** `examples/retail-multiagent-arm-template/`
- **సంక్లిష్టత:** ⭐⭐⭐⭐ (అభివృద్ధి)
- **ఏం చేర్చబడింది:**
  - పూర్తి ARM డిప్లాయ్‌మెంట్ టెంప్లేట్
  - బహుళ ఏజెంట్ ఆర్కిటెక్చర్ (కస్టమర్ + ఇన్వెంటరీ)
  - Microsoft Foundry Models సమైక్యం
  - RAG తో AI Search
  - సవిస్తృత మానిటరింగ్
  - వన్-క్లిక్ డిప్లాయ్‌మెంట్ స్క్రిప్ట్

**త్వర ప్రారంభం:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

- **సాంకేతికతలు:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 బాహ్య Azure Samples (ఉపయోగించేందుకు క్లోన్ చేయండి)

క్రిందనున్న ఉదాహరణలు అధికారిక Azure-Samples రిపోజిటరీలలో నిర్వహించబడుతున్నాయి. వివిధ AZD శైలులను అన్వేషించడానికి వాటిని క్లోన్ చేయండి:

### సరళమైన అనువర్తనాలు (అధ్యాయాలు 1-2)

| టెంప్లేట్ | రిపోజిటరీ | సంక్లిష్టత | సేవలు |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [లోకల్: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [లోకల్: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-service, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**ఎలా ఉపయోగించాలి:**
```bash
# ఏదైనా ఉదాహరణను క్లోన్ చేయండి
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# డిప్లాయ్ చేయండి
azd up
```

### AI అనువర్తన ఉదాహరణలు (అధ్యాయాలు 2, 5, 8)

| టెంప్లేట్ | రిపోజిటరీ | సంక్లిష్టత | దృష్టి |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [లోకల్: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 deployment |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | ప్రాథమిక AI చాట్ |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | ఏజెంట్ ఫ్రేమ్‌వర్క్ |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG నమూనా |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | ఎంటర్‌ప్రైజ్ AI |

### డేటాబేస్ & అభివృద్ధి శైలులు (అధ్యాయాలు 3-8)

| టెంప్లేట్ | రిపోజిటరీ | సంక్లిష్టత | దృష్టి |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | డేటాబేస్ సమైక్యం |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL సర్వర్‌లెస్ |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | బహుసర్వీస్ |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## నేర్చుకునే లక్ష్యాలు

ఈ ఉదాహరణల ద్వారా పనిచేసి, మీరు:
- వాస్తవిక అనువర్తన సన్నివేశాలతో Azure Developer CLI వర్క్‌ఫ్లోలను సాధన చేయగలుగుతారు
- వివిధ అనువర్తన ఆర్కిటెక్చర్‌లను మరియు వాటి azd అమలు విధానాలను అర్థం చేసుకోగలుగుతారు
- వివిధ Azure సేవల కోసం ఇన్ఫ్రాస్ట్రక్చర్ యాస్ కోడ్ శైలాల్లో నైపుణ్యం సంపాదించగలుగుతారు
- కాన్ఫిగరేషన్ నిర్వహణ మరియు పర్యావరణ-నిర్దిష్ట డిప్లాయ్‌మెంట్ వ్యూహాలను అన్వయించగలుగుతారు
- ప్రాయోగిక సందర్భాలలో మానిటరింగ్, భద్రత, మరియు స్కేలింగ్ శైలులను అమలు చేయగలుగుతారు
- నిజమైన డిప్లాయ్‌మెంట్ సన్నివేశాలలో సమస్య పరిష్కారం మరియు డీబగ్గింగ్ అనుభవం పొందగలుగుతారు

## నేర్చుకొనే ఫలితాలు

ఈ ఉదాహరణలను పూర్తిచేసిన తర్వాత, మీరు చేయగలుగుతారు:
- Azure Developer CLI ఉపయోగించి వివిధ అనువర్తన రకాల్ని ఆత్మవిశ్వాసంగా డిప్లాయ్ చేయగలుగుతారు
- నివ్వబడిన టెంప్లేట్స్‌ను మీ స్వంత అనువర్తన అవసరాలకు అనుగుణంగా మార్చగలుగుతారు
- Bicep ఉపయోగించి కస్టమ్ ఇన్ఫ్రాస్ట్రక్చర్ శైలులను డిజైన్ చేసి అమలు చేయగలుగుతారు
- సరైన ఆధారపడ్డతలతో సంక్లిష్ట బహుసర్వీస్ అనువర్తనాలను కాన్ఫిగర్ చేయగలుగుతారు
- నిజమైన సందర్భాలలో భద్రత, మానిటరింగ్, మరియు పనితీరు ఉత్తమ విధానాలను వర్తింపజేయగలుగుతారు
- ప్రాయోగిక అనుభవంపై ఆధారపడి డిప్లాయ్‌మెంట్స్‌ను సమస్యల పరిష్కారం చేసి ఉత్తమీకరించగలుగుతారు

## డైరెక్టరీ నిర్మాణం

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

## త్వరిత ప్రారంభ ఉదాహరణలు

> **💡 AZDకి కొత్త?** ఉదాహరణ #1 (Flask API) తో ప్రారంభించండి - ఇది సుమారు 20 నిమిషాలు పడును మరియు మూల భావనలను నేర్పుతుంది.

### ప్రారంభికుల కొరకు
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (లోకల్) ⭐  
   స్కేల్-టు-జీరోతో ఒక సాదా REST APIని డిప్లాయ్ చేయండి  
   **సమయం:** 20-25 నిమిషాలు | **ఖర్చు:** $0-5/నెల  
   **మీకు నేర్చుకోవచ్చు:** ప్రాథమిక azd వర్క్‌ఫ్లో, కంటైనరీకరణ, హెల్త్ ప్రోబ్స్  
   **అంచనావంతమైన ఫలితం:** మానిటరింగ్‌తో "Hello, World!" తిరిగి ఇచ్చే పని చేస్తున్న API ఎండ్‌పాయింట్

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   MongoDB తో ఒక Node.js Express వెబ్ అనువర్తనాన్ని డిప్లాయ్ చేయండి  
   **సమయం:** 25-35 నిమిషాలు | **ఖర్చు:** $10-30/నెల  
   **మీకు నేర్చుకోవచ్చు:** డేటాబేస్ సమైక్యం, పర్యావరణ చరాలు, కనెక్షన్ స్ట్రింగులు  
   **అంచనావంతమైన ఫలితం:** క్రియించు/ఒకట్రో/నవీకరణ/తొలగింపు పనితీరు ఉన్న Todo లిస్ట్ అప్లికేషన్

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Azure Static Web Apps తో ఒక React స్టాటిక్ వెబ్‌సైట్ హోస్ట్ చేయండి  
   **సమయం:** 20-30 నిమిషాలు | **ఖర్చు:** $0-10/నెల  
   **మీకు నేర్చుకోవచ్చు:** స్టాటిక్ హోస్టింగ్, సర్వర్‌లెస్ ఫంక్షన్‌లు, CDN డిప్లాయ్‌మెంట్  
   **అంచనావంతమైన ఫలితం:** API బ్యాకెండ్‌తో React UI, ఆటోమేటిక్ SSL, గ్లోబల్ CDN

### మధ్యస్థ వినియోగదారుల కోసం
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (లోకల్) ⭐⭐  
   gpt-4.1 ను చాట్ ఇంటర్‌ఫేస్ మరియు సురక్షిత API కీ నిర్వహణ సహితంగా డిప్లాయ్ చేయండి  
   **సమయం:** 35-45 నిమిషాలు | **ఖర్చు:** $50-200/నెల  
   **మీకు నేర్చుకోవచ్చు:** Microsoft Foundry Models డిప్లాయ్‌మెంట్, Key Vault సమైక్యం, టోకెన్ ట్రాకింగ్  
   **అంచనావంతమైన ఫలితం:** gpt-4.1 మరియు ఖర్చు మానిటరింగ్‌తో పనిచేసే చాట్ అనువర్తనం

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (లోకల్) ⭐⭐⭐⭐  
   ప్రొడక్షన్-రెడి బహు-సర్వీస్ ఆర్కిటెక్చర్  
   **సమయం:** 45-60 నిమిషాలు | **ఖర్చు:** $50-150/నెల  
   **మీకు నేర్చుకోవచ్చు:** సేవల మధ్య కమ్యూనికేషన్, మెసేజ్ క్యూయింగ్, విస్తృత ట్రేసింగ్  
   **అంచనావంతమైన ఫలితం:** 2-సర్వీస్ సిస్టమ్ (API గేట్వే + ప్రొడక్ట్ సర్వీస్) మానిటరింగ్‌తో

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   C# API మరియు Azure SQL డేటాబేస్ తో వెబ్ అనువర్తనం  
   **సమయం:** 30-45 నిమిషాలు | **ఖర్చు:** $20-80/నెల  
   **మీకు నేర్చుకోవచ్చు:** Entity Framework, డేటాబేస్ మైగ్రేషన్స్, కనెక్షన్ భద్రత  
   **అంచనావంతమైన ఫలితం:** Azure SQL బ్యాక్‌ఎండ్ కలిగిన C# API, ఆటోమెటిక్ స్కీమా డిప్లాయ్‌మెంట్

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   HTTP ట్రిగర్స్ మరియు Cosmos DB తో Python Azure Functions  
   **సమయం:** 30-40 నిమిషాలు | **ఖర్చు:** $10-40/నెల  
   **మీకు నేర్చుకోవచ్చు:** ఈవెంట్-డ్రివెన్ ఆర్కిటెక్చర్, సర్వర్‌లెస్ స్కేలింగ్, NoSQL సమైక్యం  
   **అంచనావంతమైన ఫలితం:** HTTP అభ్యర్థనలకు స్పందించే మరియు Cosmos DBలో నిల్వ చేసే ఫంక్షన్ అప్లికేషన్

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Container Apps మరియు API గేట్వే తో బహుసర్వీస్ Java అప్లికేషన్  
   **సమయం:** 60-90 నిమిషాలు | **ఖర్చు:** $80-200/నెల  
   **మీకు నేర్చుకోవచ్చు:** Spring Boot డిప్లాయ్‌మెంట్, సేవ మెష్, లోడ్ బాలెన్సింగ్  
   **అంచనావంతమైన ఫలితం:** సేవ కనుగొనడం మరియు రూటింగ్‌తో కూడిన బహు-సర్వీస్ Java సిస్టమ్

### Microsoft Foundry Templates

1. **[Microsoft Foundry Models Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   చాట్ ఇంటర్‌ఫేస్‌తో పూర్తి gpt-4.1 డిప్లాయ్‌మెంట్  
   **సమయం:** 35-45 నిమిషాలు | **ఖర్చు:** $50-200/నెల  
   **అంచనావంతమైన ఫలితం:** టోకెన్ ట్రాకింగ్ మరియు ఖర్చు మానిటరింగ్‌తో పనిచేసే చాట్ అనువర్తనం

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   RAG ఆర్కిటెక్చర్‌తో బుద్ధిమంతమైన చాట్ అనువర్తనం  
   **సమయం:** 60-90 నిమిషాలు | **ఖర్చు:** $100-300/నెల  
   **అంచనావంతమైన ఫలితం:** డాక్యుమెంట్ సెర్చ్ మరియు సిటేషన్లతో RAG-చాలిత చాట్ ఇంటర్‌ఫేస్

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Azure AI సేవల్ని ఉపయోగించి డాక్యుమెంట్ విశ్లేషణ  
   **సమయం:** 40-60 నిమిషాలు | **ఖర్చు:** $20-80/నెల  
   **అంచనావంతమైన ఫలితం:** అప్లోడ్ చేసిన డాక్యుమెంట్ల నుండి పాఠ్యం, పట్టికలు మరియు ఎంటిటీలను తీసేసే API

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Azure Machine Learning తో MLOps వర్క్‌ఫ్లో  
   **సమయం:** 2-3 గంటలు | **ఖర్చు:** $150-500/నెల  
   **అంచనావంతమైన ఫలితం:** ట్రైనింగ్, డిప్లాయ్‌మెంట్ మరియు మానిటరింగ్‌తో ఆటోమేటెడ్ ML పైప్‌లైన్

### వాస్తవ ప్రపంచ సన్నివేశాలు

#### **Retail Multi-Agent Solution** 🆕
**[Complete Implementation Guide](./retail-scenario.md)**

వివరమైన, ప్రొడక్షన్-రెడి బహుళ ఏజెంట్ కస్టమర్ సపోర్ట్ పరిష్కారం, ఇది AZD తో ఎంటర్‌ప్రైజ్-తరహా AI అనువర్తన డిప్లాయ్‌మెంట్‌ను ప్రదర్శిస్తుంది. ఈ సన్నివేశం ఇవ్వబడినది:

- **Complete Architecture**: ప్రత్యేక కస్టమర్ సర్వీస్ మరియు ఇన్వెంటరీ మేనేజ్‌మెంట్ ఏజెంట్లతో బహుళ ఏజెంట్ సిస్టమ్
- **ప్రొడక్షన్ ఇన్‌ఫ్రాస్ట్రక్చర్**: బహుళ-ప్రాంతాల Microsoft Foundry Models డిప్లాయ్‌మెంట్‌లు, AI Search, Container Apps, మరియు సమగ్ర మానిటరింగ్
- **డిప్లాయ్‌కు సిద్ధం ARM టెంప్లెట్**: ఒక క్లిక్ డిప్లాయ్‌మెంట్ విభిన్న కాన్ఫిగరేషన్ మోడ్‌లతో (Minimal/Standard/Premium)
- **అధునాతన ఫీచర్లు**: రెడ్-టీమింగ్ సెక్యూరిటీ వెరిఫికేషన్, ఏజెంట్ మూల్యాంకన ఫ్రేమ్‌వర్క్, ఖర్చు ఆప్టిమైజేషన్, మరియు ట్రబుల్‌షూటింగ్ గైడ్స్
- **వాస్తవ వ్యాపార పరిధి**: ఫైల్ అప్‌లోడ్‌లు, సెర్చ్ ఇంటిగ్రేషన్, మరియు డైనమిక్ స్కేలింగ్ ఉన్న రిటైలర్ కస్టమర్ సపోర్ట్ వినియోగం

**సాంకేతిక పరిజ్ఞానాలు**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**సంక్లిష్టత**: ⭐⭐⭐⭐ (అధునాతన - ఎంటర్ప్రైజ్ ప్రొడక్షన్ సిద్ధం)

**సరైనది కోసం**: AI డెవలపర్లు, సొల్యూషన్ ఆర్కిటెక్ట్స్, మరియు ప్రొడక్షన్ బహు-ఏజెంట్ సిస్టమ్స్ నిర్మించే బృందాలు

**త్వరిత ప్రారంభం**: చేర్చిన ARM టెంప్లేట్ ఉపయోగించి పూర్తి పరిష్కారాన్ని 30 నిమిషాలలోపు డిప్లాయ్ చేయండి `./deploy.sh -g myResourceGroup`

## 📋 ఉపయోగ సూచనలు

### ముందస్తు అవసరాలు

Before running any example:
- ✅ Azure subscription with Owner or Contributor access
- ✅ Azure Developer CLI installed ([ఇన్‌స్టలేషన్ గైడ్](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop running (for container examples)
- ✅ Appropriate Azure quotas (check example-specific requirements)

> **💰 ఖర్చు హెచ్చరిక:** అన్ని ఉదాహరణలు వాస్తవ Azure వనరులను సృష్టిస్తాయి మరియు ఖర్చులు కలిగిస్తాయి. ఖర్చు అంచనాల కోసం వ్యక్తిగత README ఫైళ్లు చూడండి. నిరంతర ఖర్చులను నివారించడానికి పూర్తయిన తర్వాత `azd down` నడపండి.

### స్థానికంగా ఉదాహరణలు నడపడం

1. **ఉదాహరణను క్లోన్ లేదా కాపీ చేయండి**
   ```bash
   # ఇష్టమైన ఉదాహరణకు వెళ్ళండి
   cd examples/simple-web-app
   ```

2. **AZD పర్యావరణాన్ని ప్రారంభించండి**
   ```bash
   # ఉన్న టెంప్లేట్‌తో ప్రారంభించండి
   azd init
   
   # లేదా కొత్త వాతావరణం సృష్టించండి
   azd env new my-environment
   ```

3. **పర్యావరణాన్ని కాన్ఫిగర్ చేయండి**
   ```bash
   # అవసరమైన చరాలను సెట్ చేయండి
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **డిప్లాయ్ చేయండి**
   ```bash
   # ఇన్ఫ్రాస్ట్రక్చర్ మరియు అప్లికేషన్‌ను అమర్చండి
   azd up
   ```

5. **డిప్లాయ్‌మెంట్‌ను ధృవీకరించండి**
   ```bash
   # సేవా ఎండ్‌పాయింట్లను పొందండి
   azd env get-values
   
   # ఎండ్‌పాయింట్‌ను పరీక్షించండి (ఉదాహరణ)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **అంచనా విజయం సూచికలు:**
   - ✅ `azd up` తప్పులేకుండా పూర్తి అవుతుంది
   - ✅ సర్వీస్ ఎండ్‌పాయింట్ HTTP 200 రిటర్న్ చేస్తుంది
   - ✅ Azure పోర్టల్ "Running" స్థితిని చూపిస్తుంది
   - ✅ Application Insights టెలిమెట్రీని అందుకుంటోంది

> **⚠️ సమస్యలు ఉన్నాయా?** డిప్లాయ్‌మెంట్ ట్రబుల్‌షూటింగ్ కోసం [సాధారణ సమస్యలు](../docs/chapter-07-troubleshooting/common-issues.md) చూడండి

### ఉదాహరణలను అనుకూలీకరించడం

Each example includes:
- **README.md** - విపులమైన సెటప్ మరియు అనుకూలీకరణ సూచనలు
- **azure.yaml** - వ్యాఖ్యలతో AZD కాన్ఫిగరేషన్
- **infra/** - పరామితి వివరణలతో Bicep టెంప్లెట్లు
- **src/** - నమూనా అప్లికేషన్ కోడ్
- **scripts/** - సాధారణ పనుల కోసం సహాయక స్క్రిప్ట్‌లు

## 🎯 అభ్యాస లక్ష్యాలు

### ఉదాహరణ వర్గాలు

#### **ప్రాథమిక డిప్లాయ్‌మెంట్‌లు**
- ఏక-సేవా అప్లికేషన్లు
- సరళమైన ఇన్‌ఫ్రాస్ట్రక్చర్ నమూనాలు
- ప్రాథమిక కాన్ఫిగరేషన్ నిర్వహణ
- ఖర్చు-సమర్థవంతమైన డెవలప్‌మెంట్ సెటప్స్

#### **అధునాతన పరిస్థతులు**
- బహు-సేవా ఆర్కిటెక్చర్లు
- సంక్లిష్ట నెట్‌వర్కింగ్ కాన్ఫిగరేషన్లు
- డేటాబేస్ ఇంటిగ్రేషన్ నమూనాలు
- సెక్యూరిటీ మరియు కంప్లయన్స్ అమలులు

#### **ప్రొడక్షన్-సిద్ధ నమూనాలు**
- హై అవెయిలబిలిటీ కాన్ఫిగరేషన్లు
- మానిటరింగ్ మరియు ఆబ్జర్వబిలిటీ
- CI/CD ఇంటిగ్రేషన్
- డిజాస్టర్ రికవరీ సెటప్స్

## 📖 ఉదాహరణ వివరణలు

### సరళ వెబ్ అనువర్తనం - Node.js Express
**సాంకేతికాలు**: Node.js, Express, MongoDB, Container Apps  
**సంక్లిష్టత**: ప్రారంభ స్థాయి  
**ఆలోచనలు**: ప్రాథమిక డిప్లాయ్‌మెంట్, REST API, NoSQL డేటాబేస్ ఇంటిగ్రేషన్

### స్థిర వెబ్‌సైట్ - React SPA
**సాంకేతికాలు**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**సంక్లిష్టత**: ప్రారంభ స్థాయి  
**ఆలోచనలు**: స్థిర హోస్టింగ్, సర్వర్‌లెస్ బ్యాక్‌ఎండ్, ఆధునిక వెబ్ డెవలప్మెంట్

### Container App - Python Flask
**సాంకేతికాలు**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**సంక్లిష్టత**: ప్రారంభ స్థాయి  
**ఆలోచనలు**: కంటైనరైజేషన్, REST API, scale-to-zero, హెల్త్ probes, మానిటరింగ్  
**స్థానం**: [స్థానిక ఉదాహరణ](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**సాంకేతికాలు**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**సంక్లిష్టత**: అధునాతన  
**ఆలోచనలు**: బహు-సర్వీస్ ఆర్కిటెక్చర్, సేవల కమ్యూనికేషన్, మెసేజ్ క్యూయింగ్, డిస్ట్రిబ్యూటెడ్ ట్రేసింగ్  
**స్థానం**: [స్థానిక ఉదాహరణ](../../../examples/container-app/microservices)

### డేటాబేస్ అప్లికేషన్ - C# తో Azure SQL
**సాంకేతికాలు**: C# ASP.NET Core, Azure SQL Database, App Service  
**సంక్లిష్టత**: మధ్యస్థ  
**ఆలోచనలు**: Entity Framework, డేటాబేస్ కనెక్షన్లు, వెబ్ API డెవలప్మెంట్

### సర్వర్‌లెస్ ఫంక్షన్ - Python Azure Functions
**సాంకేతికాలు**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**సంక్లిష్టత**: మధ్యస్థ  
**ఆలోచనలు**: ఈవెంట్-చాలిత ఆర్కిటెక్చర్, సర్వర్‌లెస్ కంప్యూటింగ్, ఫుల్-స్టాక్ డెవలప్మెంట్

### మైక్రోసర్వీసెస్ - Java Spring Boot
**సాంకేతికాలు**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**సంక్లిష్టత**: మధ్యస్థ  
**ఆలోచనలు**: మైక్రోసర్వీసెస్ కమ్యూనికేషన్, డిస్ట్రిబ్యూటెడ్ సిస్టమ్స్, ఎంటర్ప్రైజ్ నమూనాలు

### Microsoft Foundry ఉదాహరణలు

#### Microsoft Foundry Models Chat App
**సాంకేతికాలు**: Microsoft Foundry Models, Azure AI Search, App Service  
**సంక్లిష్టత**: మధ్యస్థ  
**ఆలోచనలు**: RAG ఆర్కిటెక్చర్, వెక్టర్ సెర్చ్, LLM ఇంటిగ్రేషన్

#### AI డాక్యుమెంట్ ప్రాసెసింగ్
**సాంకేతికాలు**: Azure AI Document Intelligence, Storage, Functions  
**సంక్లిష్టత**: మధ్యస్థ  
**ఆలోచనలు**: డాక్యుమెంట్ విశ్లేషణ, OCR, డేటా ఎక్స్‌ట్రాక్షన్

#### మెషిన్ లర్నింగ్ పైప్‌లైన్
**సాంకేతికాలు**: Azure ML, MLOps, Container Registry  
**సంక్లిష్టత**: అధునాతన  
**ఆలోచనలు**: మోడల్ ట్రైనింగ్, డిప్లాయ్‌మెంట్ పైప్‌లైన్లు, మానిటరింగ్

## 🛠 కాన్ఫిగరేషన్ ఉదాహరణలు

The `configurations/` directory contains reusable components:

### పరిసర కాన్ఫిగరేషన్లు
- Development environment settings
- Staging environment configurations
- Production-ready configurations
- Multi-region deployment setups

### Bicep మాడ్యూల్స్
- Reusable infrastructure components
- Common resource patterns
- Security-hardened templates
- Cost-optimized configurations

### సహాయక స్క్రిప్ట్‌లు
- Environment setup automation
- Database migration scripts
- Deployment validation tools
- Cost monitoring utilities

## 🔧 అనుకూలీకరణ మార్గదర్శకం

### మీ వినియోగానికి ఉదాహరణలను అనుకూలీకరించడం

1. **ముందస్తు అవసరాలను సమీక్షించండి**
   - Azure సేవల అవసరాలను తనిఖీ చేయండి
   - సబ్‌స్క్రిప్షన్ పరిమితులను ధృవీకరించండి
   - ఖర్చు ప్రభావాలను అర్థం చేసుకోండి

2. **కాన్ఫిగరేషన్‌ను మారుస్తారు**
   - `azure.yaml` సేవ నిర్వచనాలను నవీకరించండి
   - Bicep టెంప్లెట్లు అనుకూలీకరించండి
   - పర్యావరణ వేరియబుల్‌లను సర్దుబాటు చేయండి

3. **పూర్తిగా పరీక్షించండి**
   - ముందుగా డెవలప్‌మెంట్ పర్యావరణంలో డిప్లాయ్ చేయండి
   - ఫంక్షనాలిటీని ధృవీకరించండి
   - స్కేలింగ్ మరియు ప్రదర్శనను పరీక్షించండి

4. **సెక్యూరిటీ సమీక్ష**
   - యాక్సెస్ కంట్రోల్స్ సమీక్షించండి
   - సీక్రెట్లు నిర్వహణను అమలు చేయండి
   - మానిటరింగ్ మరియు అలర్టింగ్‌ను ఎనేబుల్ చేయండి

## 📊 పోలిక మ్యాట్రిక్స్

| ఉదాహరణ | సేవలు | డేటాబేస్ | ప్రామాణీకరణ | మానిటరింగ్ | సంక్లిష్టత |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (స్థానిక) | 2 | ❌ | Key Vault | Full | ⭐⭐ |
| **Python Flask API** (స్థానిక) | 1 | ❌ | Basic | Full | ⭐ |
| **Microservices** (స్థానిక) | 5+ | ✅ | Enterprise | Advanced | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Basic | Basic | ⭐ |
| React SPA + Functions | 3 | ✅ | Basic | Full | ⭐ |
| Python Flask Container | 2 | ❌ | Basic | Full | ⭐ |
| C# Web API + SQL | 2 | ✅ | Full | Full | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Full | Full | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Full | Full | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | Full | Full | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Basic | Full | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Full | Full | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (స్థానిక) | **8+** | **✅** | **Enterprise** | **Advanced** | **⭐⭐⭐⭐** |

## 🎓 అభ్యాస పథం

### సూచించబడిన ప్రగతిశీలత

1. **సాదారణ వెబ్ ఆప్‌తో ప్రారంభించండి**
   - ముఖ్య AZD కాన్సెప్ట్స్ నేర్చుకోండి
   - డిప్లాయ్‌మెంట్ వర్క్‌ఫ్లో అర్థం చేసుకోండి
   - పర్యావరణ నిర్వహణను ఆచరణలో పెట్టుకోండి

2. **స్థిర వెబ్‌సైట్ ప్రయత్నించండి**
   - వివిధ హోస్టింగ్ ఎంపికలను అన్వేషించండి
   - CDN ఇంటిగ్రేషన్ గురించి నేర్చుకోండి
   - DNS కాన్ఫిగరేషన్ అర్థం చేసుకోండి

3. **Container App వైపు వెళ్లండి**
   - కంటైనరైజేషన్ మౌలికాన్ని నేర్చుకోండి
   - స్కేలింగ్ కాన్సెప్ట్స్ అర్థం చేసుకోండి
   - Docker తో ప్రాక్టీస్ చేయండి

4. **డేటాబేస్ ఇంటిగ్రేషన్ జోడించండి**
   - డేటాబేస్ ప్రావిజనింగ్ నేర్చుకోండి
   - కనెక్షన్ స్ట్రింగ్స్ అర్థం చేసుకోండి
   - సీక్రెట్లు నిర్వహణ తో ప్రాక్టీస్ చేయండి

5. **సర్వర్‌లెస్‌ను అన్వేషించండి**
   - ఈవెంట్-చాలిత ఆర్కిటెక్చర్ అర్థం చేసుకోండి
   - ట్రిగ్గర్స్ మరియు బైండింగ్‌ల గురించి నేర్చుకోండి
   - APIs తో ప్రాక్టీస్ చేయండి

6. **మైక్రోసర్వీసెస్ నిర్మించండి**
   - సేవలు కమ్యూనికేషన్ నేర్చుకోండి
   - డిస్ట్రిబ్యూటెడ్ సిస్టమ్స్ అర్థం చేసుకోండి
   - సంక్లిష్ట డిప్లాయ్‌మెంట్లపై ప్రాక్టీస్ చేయండి

## 🔍 సరైన ఉదాహరణ కనుగొనడం

### టెక్నాలజీ స్టాక్ ప్రకారం
- **Container Apps**: [Python Flask API (స్థానిక)](../../../examples/container-app/simple-flask-api), [Microservices (స్థానిక)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (స్థానిక)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (స్థానిక)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (స్థానిక)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (స్థానిక)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Microservices User Service (స్థానిక)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (സ്ഥానిక)](../../../examples/container-app/simple-flask-api), [Microservices (స్థానిక)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (ಸ್ಥానిక)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (స్థానిక)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Microsoft Foundry Models Chat (స్థానిక)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (స్థానిక)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### ఆర్కిటెక్చర్ నమూనా ప్రకారం
- **సాధారణ REST API**: [Python Flask API (స్థానిక)](../../../examples/container-app/simple-flask-api)
- **మొనోలిథిక్**: Node.js Express Todo, C# Web API + SQL
- **స్థిర + సర్వర్‌లెస్**: React SPA + Functions, Python Functions + SPA
- **మైక్రోసర్వీసెస్**: [Production Microservices (స్థానిక)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **కంటైనరైజ్డ్**: [Python Flask (స్థానిక)](../../../examples/container-app/simple-flask-api), [Microservices (స్థానిక)](../../../examples/container-app/microservices)
- **AI-పవర్డ్**: **[Microsoft Foundry Models Chat (స్థానిక)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **బహు-ఏజెంట్ ఆర్కిటెక్చర్**: **Retail Multi-Agent Solution**
- **ఎంటర్ప్రైజ్ బహు-సర్వీస్**: [Microservices (స్థానిక)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### సంక్లిష్టత స్థాయి ప్రకారం
- **ప్రారంభ స్థాయి**: [Python Flask API (స్థానిక)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **మధ్యస్థ**: **[Microsoft Foundry Models Chat (స్థానిక)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **అధునాతన**: ML Pipeline
- **ఎంటర్ప్రైజ్ ప్రొడక్షన్-సిద్ధం**: [Microservices (స్థానిక)](../../../examples/container-app/microservices) (మెసేజ్ క్యూ తీసుకున్న బహు-సర్వీస్), **Retail Multi-Agent Solution** (ARM టెంప్లెట్ డిప్లాయ్‌మెంట్‌తో పూర్తి బహు-ఏజెంట్ సిస్టమ్)

## 📚 అదనపు వనరులు

### డాక్యుమెంటేషన్ లింకులు
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### కమ్యూనిటీ ఉదాహరణలు
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App with Node.js and PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [C# API తో React వెబ్ యాప్](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps జాబ్](https://github.com/Azure-Samples/container-apps-jobs)
- [Java తో Azure Functions](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### ఉత్తమ పద్ధతులు
- [Azure వెల్-ఆర్కిటెక్టెడ్ ఫ్రేమ్‌వర్క్](https://learn.microsoft.com/en-us/azure/well-architected/)
- [క్లౌడ్ అడాప్షన్ ఫ్రేమ్‌వర్క్](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 ఉదాహరణలు అందించండి

పంచుకోవడానికి ఉపయోగకరమైన ఉదాహరణ ఉందా? మేము మీ సహకారాన్ని స్వాగతిస్తున్నాము!

### సమర్పణ మార్గదర్శకాలు
1. స్థాపించబడిన డైరెక్టరీ నిర్మాణాన్ని అనుసరించండి
2. సమగ్ర README.md ను చేర్చండి
3. కాన్ఫిగరేషన్ ఫైళ్లలో వ్యాఖ్యలు జోడించండి
4. సమర్పించడానికి ముందు పూర్తిగా పరీక్షించండి
5. ఖర్చు అంచనాలు మరియు ముందస్తు అవసరాలను చేర్చండి

### ఉదాహరణ టెంప్లేట్ నిర్మాణం
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

**ప్రో టిప్**: మీ టెక్నాలజీ స్టాక్‌కు సరిపోయే అత్యసాధారణ ఉదాహరణతో ప్రారంభించండి, తరువాత క్ర‌మంగా మరింత సంక్లిష్ట పరిస్థితులవైపు విస్తరించండి. ప్రతి ఉదాహరణ పూర్వపు ఉదాహరణల సూత్రాలపై ఆధారపడి ఉంటుంది!

## 🚀 ప్రారంభించడానికి సిద్ధమా?

### మీ అభ్యాస మార్గం

1. **పూర్తిగా ప్రారంభికరా?** → [Flask API](../../../examples/container-app/simple-flask-api) తో ప్రారంభించండి (⭐, 20 నిమిషాలు)
2. **ప్రాథమిక AZD పరిజ్ఞానం ఉందా?** → [Microservices](../../../examples/container-app/microservices) ప్రయత్నించండి (⭐⭐⭐⭐, 60 నిమిషాలు)
3. **AI యాప్‌లు నిర్మిస్తున్నారా?** → [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) తో ప్రారంభించండి (⭐⭐, 35 నిమిషాలు) లేదా [Retail Multi-Agent](retail-scenario.md) అన్వేషించండి (⭐⭐⭐⭐, 2+ గంటలు)
4. **నిర్దిష్ట టెక్ స్టాక్ కావాలా?** → పై భాగంలోని [Finding the Right Example](#-finding-the-right-example) విభాగాన్ని ఉపయోగించండి

### తరువాతి దశలు

- ✅ పైన ఉన్న [Prerequisites](#ముందస్తు-అవసరాలు) ను సమీక్షించండి
- ✅ మీ నైపుణ్య స్థాయికి సరిపోయే ఉదాహరణను ఎంచుకోండి (చూడండి [Complexity Legend](#సంక్లిష్టత-రేటింగ్-లెజెండ్))
- ✅ డిప్లాయ్ చేయడానికి ముందు ఉదాహరణ యొక్క README ను పూర్తిగా చదవండి
- ✅ పరీక్షించిన తర్వాత `azd down` ను నడిపేలా ఒక రిమైండర్ సెట్ చేయండి
- ✅ మీ అనుభవాన్ని GitHub Issues లేదా Discussions ద్వారా పంచుకోండి

### సహాయం కావాలా?

- 📖 [FAQ](../resources/faq.md) - సాధారణ ప్రశ్నలకు సమాధానాలు
- 🐛 [Troubleshooting Guide](../docs/chapter-07-troubleshooting/common-issues.md) - డిప్లాయ్ సమస్యలను పరిష్కరించండి
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - కమ్యూనిటీని అడగండి
- 📚 [Study Guide](../resources/study-guide.md) - మీ అభ్యాసాన్ని బలోపేతం చేయండి

---

**నావిగేషన్**
- **📚 కోర్సు హోమ్**: [AZD ప్రారంభికులకు](../README.md)
- **📖 అధ్యయన సామగ్రి**: [అభ్యాస గైడ్](../resources/study-guide.md) | [చీట్ షీట్](../resources/cheat-sheet.md) | [పదసూచి](../resources/glossary.md)
- **🔧 వనరులు**: [FAQ](../resources/faq.md) | [పరిష్కరణలు](../docs/chapter-07-troubleshooting/common-issues.md)

---

*చివరిసారి నవీకరణ: నవంబర్ 2025 | [ఇష్యూలను నివేదించండి](https://github.com/microsoft/AZD-for-beginners/issues) | [ఉదాహరణలు అందించండి](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**అస్వీకరణ**:
ఈ పత్రం AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నిస్తున్నప్పటికీ, ఆటోమేటెడ్ అనువాదాలు తప్పులు లేదా అసమగ్రతలను కలిగి ఉండవచ్చు. దాని స్వదేశ భాషలో ఉన్న అసలు పత్రాన్ని అధికారం కలిగిన మూలంగా పరిగణించాలి. కీలకమైన సమాచారం కోసం, ప్రొఫెషనల్ మానవ అనువాదాన్ని సిఫారసు చేస్తాము. ఈ అనువాదం ఉపయోగం వల్ల కలిగే ఏవైనా అపార్థాలు లేదా తప్పుదారులు కోసం మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->