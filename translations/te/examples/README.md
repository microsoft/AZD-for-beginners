# ఉదాహరణలు - ప్రాక్టికల్ AZD టెంప్లేట్‌లు మరియు కాన్ఫిగరేషన్లు

**ఉదాహరణల ద్వారా నేర్చుకోవడం - అధ్యాయాల వారీగా శ్రేణీకృతం**
- **📚 కోర్సు హోమ్**: [AZD ప్రారంభకులకు](../README.md)
- **📖 అధ్యాయ మ్యాపింగ్**: అభ్యాస స్థాయి ఆధారంగా వర్గీకరించిన ఉదాహరణలు
- **🚀 లొకల్ ఉదాహరణ**: [రిటెయిల్ బహుళ-ఏజెంట్ పరిష్కారం](retail-scenario.md)
- **🤖 బాహ్య AI ఉదాహరణలు**: Azure Samples రిపోజిటరీలకు లింకులు

> **📍 ముఖ్యము: లోకల్ మరియు బాహ్య ఉదాహరణలు**  
> ఈ రిపోజిటరీలో పూర్తి అమలుతో కూడిన **4 పూర్తి లోకల్ ఉదాహరణలు** ఉన్నాయి:  
> - **Azure OpenAI Chat** (GPT-4 డిప్లాయ్‌మెంట్ తో చాట్ ఇంటర్‌ఫేస్)  
> - **Container Apps** (సాధారణ Flask API + మైక్రోసర్వీసులు)  
> - **Database App** (వెబ్ + SQL డేటాబేస్)  
> - **Retail Multi-Agent** (ఎంటర్ప్రైజ్ AI పరిష్కారం)  
>  
> అదనపు ఉదాహరణలు మీరు క్లోన్ చేయగల Azure-Samples రిపోజిటరీలకు చెందిన **బాహ్య సూచనలు**.

## పరిచయం

ఈ డైరెక్టరీ ప్రాక్టికల్ ఉదాహరణలు మరియు సూచనలను అందిస్తుంది, తద్వారా మీరు Azure Developer CLIను ప్రాక్టికల్ అభ్యాసం ద్వారా నేర్చుకోవచ్చు. రిటైల్ బహుళ-ఏజెంట్ (Retail Multi-Agent) సన్నివేశం ఈ రిపోజిటరీలో చేర్చిన పూర్తి, ప్రొడక్షన్-తయారైన అమలుగా ఉంటుంది. అదనపు ఉదాహరణలు వివిధ AZD ప్యాటర్న్‌లను ప్రదర్శించే అధికారిక Azure Samplesలను సూచిస్తాయి.

### సంక్లిష్టత రేటింగ్ వివరణ

- ⭐ **ప్రాథమిక** - ప్రాథమిక సూత్రాలు, ఒకే సేవ, 15-30 నిమిషాలు
- ⭐⭐ **మధ్యస్థ** - బహుళ సేవలు, డేటాబేస్ ఇంటిగ్రేషన్, 30-60 నిమిషాలు
- ⭐⭐⭐ **అధునాతన** - సంక్లిష్ట ఆర్కిటెక్చర్, AI ఇంటిగ్రేషన్, 1-2 గంటలు
- ⭐⭐⭐⭐ **నిపుణుడు** - ప్రొడక్షన్-రేడీ, ఎంటర్ప్రైజ్ ప్యాటర్న్లు, 2+ గంటలు

## 🎯 ఈ రిపోజిటరీలో నిజంగా ఏముంది

### ✅ లోకల్ అమలు (వినియోగానికి సిద్ధం)

#### [Azure OpenAI చాట్ అప్లికేషన్](azure-openai-chat/README.md) 🆕
**ఈ రిపోలో చాట్ ఇంటర్‌ఫేస్‌తో పూర్తి GPT-4 డిప్లాయ్‌మెంట్ అందుబాటులో ఉంది**

- **స్థానం:** `examples/azure-openai-chat/`
- **సంక్లిష్టత:** ⭐⭐ (మధ్యస్థ)
- **అందులో ఏముంది:**
  - పూర్తి Azure OpenAI డిప్లాయ్‌మెంట్ (GPT-4)
  - Python కమాండ్-లైన్ చాట్ ఇంటర్‌ఫేస్
  - API కీస్ భద్రంగా నిలవడానికి Key Vault ఇంటిగ్రేషన్
  - Bicep ఇన్ఫ్రాస్ట్రక్చర్ టెంప్లేట్లు
  - టోకెన్ వినియోగం మరియు ఖర్చుల ట్రాకింగ్
  - రేట్ లిమిటింగ్ మరియు లోపాల నిర్వహణ

**త్వరిత ప్రారంభం:**
```bash
# ఉదాహరణకి వెళ్లండి
cd examples/azure-openai-chat

# అన్నింటినీ అమలు చేయండి
azd up

# ఆవశ్యకమైన ఆధారాలను ఇన్‌స్టాల్ చేసి చాట్ ప్రారంభించండి
pip install -r src/requirements.txt
python src/chat.py
```

**సాంకేతికతలు:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Container App ఉదాహరణలు](container-app/README.md) 🆕
**ఈ రిపోలో సమగ్ర కంటైనర్ డిప్లాయ్‌మెంట్ ఉదాహరణలు ఉన్నాయి**

- **స్థానం:** `examples/container-app/`
- **సంక్లిష్టత:** ⭐-⭐⭐⭐⭐ (ప్రాథమిక నుంచి అధునాతన వరకు)
- **అందులో ఏముంది:**
  - [మాస్టర్ గైడ్](container-app/README.md) - కంటైనర్ డిప్లాయ్‌మెంట్ల పూర్తి అవలోకనం
  - [సాదారణ Flask API](../../../examples/container-app/simple-flask-api) - ప్రాథమిక REST API ఉదాహరణ
  - [మైక్రోసర్వీసు ఆర్కిటెక్చర్](../../../examples/container-app/microservices) - ప్రొడక్షన్-తయారైన బహుళ-సేవా డిప్లాయ్‌మెంట్
  - త్వరిత ఆరంభం, ప్రొడక్షన్, మరియు అధునాతన ప్యాటర్న్లు
  - మానిటరింగ్, భద్రత, మరియు ఖర్చు ఆప్టిమైజేషన్

**త్వరిత ప్రారంభం:**
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

**సాంకేతికతలు:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent పరిష్కారం](retail-scenario.md) 🆕
**ఈ రిపోలో పూర్తి ప్రొడక్షన్-తయారైన అమలు అందుబాటులో ఉంది**

- **స్థానం:** `examples/retail-multiagent-arm-template/`
- **సంక్లిష్టత:** ⭐⭐⭐⭐ (అధునాతన)
- **అందులో ఏముంది:**
  - పూర్తి ARM డిప్లాయ్‌మెంట్ టెంప్లేట్
  - బహుళ-ఏజెంట్ ఆర్కిటెక్చర్ (కస్టమర్ + ఇన్వెంటరీ)
  - Azure OpenAI ఇంటిగ్రేషన్
  - RAG తో AI శోధన
  - సమగ్ర మానిటరింగ్
  - వన్-క్లిక్ డిప్లాయ్‌మెంట్ స్క్రిప్ట్

**త్వరిత ప్రారంభం:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**సాంకేతికతలు:** Azure OpenAI, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 బాహ్య Azure Samples (వినియోగానికి క్లోన్ చేయండి)

కిందివివరణ ఉదాహరణలు అధికారిక Azure-Samples రిపోజిటరీల్లో నిర్వహించబడ్డాయి. వివిధ AZD ప్యాటర్న్‌లను అన్వేషించడానికి వాటిని క్లోన్ చేయండి:

### సరళ అప్లికేషన్లు (అధ్యాయాలు 1-2)

| టెంప్లేట్ | రిపోజిటరీ | సంక్లిష్టత | సేవలు |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [లోకల్: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **மైక்ரోసర్వీసులు** | [లోకల్: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | బహుళ-సేవా, Service Bus, Cosmos DB, SQL |
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

### AI అప్లికేషన్ ఉదాహరణలు (అధ్యాయాలు 2, 5, 8)

| టెంప్లేట్ | రిపోజిటరీ | సంక్లిష్టత | దృష్టి |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI Chat** | [లోకల్: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | GPT-4 డిప్లాయ్‌మెంట్ |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | బేసిక్ AI చాట్ |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | ఏజెంట్ ఫ్రేమ్‌వర్క్ |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG ప్యాటర్న్ |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | ఎంటర్ప్రైజ్ AI |

### డేటాబేస్ & అధునాతన ప్యాటర్న్లు (అధ్యాయాలు 3-8)

| టెంప్లేట్ | రిపోజిటరీ | సంక్లిష్టత | దృష్టి |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | డేటాబేస్ ఇంటిగ్రేషన్ |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL సర్వర్‌లెస్ |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | బహుళ-సేవా |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## అభ్యాస లక్ష్యాలు

ఈ ఉదాహరణలను ఉపయోగించి పనిచేస్తే, మీరు:
- వాస్తవిక అప్లికేషన్ సన్నివేశాలతో Azure Developer CLI వర్క్‌ఫ్లోలను అభ్యసించగలుగుతారు
- విభిన్న అప్లికేషన్ ఆర్కిటెక్చర్‌లు మరియు వాటి azd అమలులను అర్ధం చేసుకోగలుగుతారు
- వివిధ Azure సేవలకు Infrastructure as Code ప్యాటర్న్‌లలో నైపుణ్యం పొందగలుగుతారు
- కాన్ఫిగరేషన్ మేనేజ్‌మెంట్ మరియు వాతావరణ-నిర్దిష్ట డిప్లాయ్‌మెంట్ వ్యూహాలను వర్తింపజేయగలుగుతారు
- ప్రాక్టికల్ సందర్భాలలో మానిటరింగ్, భద్రత, మరియు స్కేలింగ్ ప్యాటర్న్‌లను అమలు చేయగలుగుతారు
- నిజమైన డిప్లాయ్‌మెంట్ సందర్భాల్లో ట్రబుల్‌షూటింగ్ మరియు డీబగ్గింగ్ అనుభవాన్ని నిర్మించగలుగుతారు

## అభ్యాస ఫలితాలు

ఈ ఉదాహరణలను పూర్తి చేసిన తర్వాత, మీరు చేయగలుగుతారు:
- Azure Developer CLI ఉపయోగించి వివిధ రకాల అప్లికేషన్లను ఆత్మవిశ్వాసంగా డిప్లాయ్ చేయగలుగుతారు
- అందించిన టెంప్లేట్లను మీ స్వంత అప్లికేషన్ అవసరాలకు అనుగుణంగా అనుకూలీకరించగలుగుతారు
- Bicep ఉపయోగించి కస్టమ్ ఇన్ఫ్రాస్ట్రక్చర్ ప్యాటర్న్‌లు డిజైన్ చేసి అమలు చేయగలుగుతారు
- సరైన డిపెండెన్సీలతో సంక్లిష్ట బహుళ-సేవా అప్లికేషన్లను కాన్ఫిగర్ చేయగలుగుతారు
- నిజ సన్నివేశాల్లో భద్రత, మానిటరింగ్, మరియు పనితీరు ఉత్తమ పద్ధతులను వర్తింపజేయగలుగుతారు
- ప్రాక్టికల్ అనుభవం ఆధారంగా డిప్లాయ్‌మెంట్‌లను ట్రబుల్‌షూట్ చేసి ఆప్టిమైజ్ చేయగలుగుతారు

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

> **💡 AZDలో కొత్తవారా?** ఉదాహరణ #1 (Flask API)తో ప్రారంభించండి - ఇది సుమారు 20 నిమిషాలుగా తీసుకుంటుంది మరియు ప్రాథమిక సూత్రాలను బోధిస్తుంది.

### ప్రారంభకులకు
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (లోకల్) ⭐  
   స్కేల్-టు-జీరోతో ఒక సాధారణ REST APIని డిప్లాయ్ చేయండి  
   **సమయం:** 20-25 నిమిషాలు | **ఖర్చు:** $0-5/నెల  
   **మీరు నేర్చుకుంటారు:** ప్రాథమిక azd వర్క్‌ఫ్లో, కంటైనరైజేషన్, హెల్త్ ప్రోబ్స్  
   **అంచనా ఫలితం:** మానిటరింగ్‌తో పని చేసే API ఎండ్‌పాయింట్ "Hello, World!" ను రిటర్న్ చేస్తుంది

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   MongoDBతో Node.js Express వెబ్ అప్లికేషన్ డిప్లాయ్ చేయండి  
   **సమయం:** 25-35 నిమిషాలు | **ఖర్చు:** $10-30/నెల  
   **మీరు నేర్చుకుంటారు:** డేటాబేస్ ఇంటిగ్రేషన్, ఎన్విరాన్‌మెంట్ వేరియబుల్స్, కనెక్షన్ స్ట్రింగ్స్  
   **అంచనా ఫలితం:** క్రియేట్/రీఅడ్/అప్‌డేట్/డిలీట్ ఫంక్షనాలిటీ కలిగిన Todo లిస్ట్ అనువర్తనం

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   React స్టాటిక్ వెబ్‌సైట్‌ను Azure Static Web Apps తో హోస్ట్ చేయండి  
   **సమయం:** 20-30 నిమిషాలు | **ఖర్చు:** $0-10/నెల  
   **మీరు నేర్చుకుంటారు:** స్టాటిక్ హోస్టింగ్, సర్వర్‌లెస్ ఫంక్షన్లు, CDN డిప్లాయ్‌మెంట్  
   **అంచనా ఫలితం:** API బ్యాక్‌ఎండ్‌తో React UI, ఆటోమాటిక్ SSL, గ్లోబల్ CDN

### మధ్యస్థ వినియోగదారుల కోసం
4. **[Azure OpenAI Chat Application](../../../examples/azure-openai-chat)** (లోకల్) ⭐⭐  
   GPT-4 మరియు చాట్ ఇంటర్‌ఫేస్‌ని, భద్రమైన API కీ నిర్వహణతో డిప్లాయ్ చేయండి  
   **సమయం:** 35-45 నిమిషాలు | **ఖర్చు:** $50-200/నెల  
   **మీరు నేర్చుకుంటారు:** Azure OpenAI డిప్లాయ్‌మెంట్, Key Vault ఇంటిగ్రేషన్, టోకెన్ ట్రాకింగ్  
   **అంచనా ఫలితం:** GPT-4 మరియు ఖర్చు మానిటరింగ్ తో పని చేసే చాట్ అప్లికేషన్

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (లోకల్) ⭐⭐⭐⭐  
   ప్రొడక్షన్-రెడీ బహుళ-సేవా ఆర్కిటెక్చర్  
   **సమయం:** 45-60 నిమిషాలు | **ఖర్చు:** $50-150/నెల  
   **మీరు నేర్చుకుంటారు:** సేవా కమ్యూనికేషన్, మెసేజ్ క్యూ, వ్యాప్తి ట్రేసింగ్  
   **అంచనా ఫలితం:** 2-సేవా సిస్టమ్ (API గేట్‌వే + ఉత్పత్తి సేవ) మానిటరింగ్ తో

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   C# API మరియు Azure SQL డేటాబేస్తో వెబ్ అప్లికేషన్  
   **సమయం:** 30-45 నిమిషాలు | **ఖర్చు:** $20-80/నెల  
   **మీరు నేర్చుకుంటారు:** Entity Framework, డేటాబేస్ మైగ్రేషన్లు, కనెక్షన్ భద్రత  
   **అంచనా ఫలితం:** Azure SQL బ్యాక్‌ఎండ్‌తో C# API, ఆటోమేటిక్ స్కీమా డిప్లాయ్‌మెంట్

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   HTTP triggers మరియు Cosmos DBతో Python Azure Functions  
   **సమయం:** 30-40 నిమిషాలు | **ఖర్చు:** $10-40/నెల  
   **మీరు నేర్చుకుంటారు:** ఈవెంట్-డ్రివన్ ఆర్కిటెక్చర్, సర్వర్‌లెస్ స్కేలింగ్, NoSQL ఇంటిగ్రేషన్  
   **అంచనా ఫలితం:** Cosmos DB స్టోరేజ్‌తో HTTP రిక్వెస్ట్స్ కి స్పందించే Function యాప్

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Container Apps మరియు API గేట్‌వేతో బహుళ-సేవా Java అప్లికేషన్  
   **సమయం:** 60-90 నిమిషాలు | **ఖర్చు:** $80-200/నెల  
   **మీరు నేర్చుకుంటారు:** Spring Boot డిప్లాయ్‌మెంట్, సేవా మెష్, లోడ్ బ్యాలెన్సింగ్  
   **అంచనా ఫలితం:** సేవా డిస్కవరీ మరియు రూటింగ్ కలిగిన బహుళ-సేవా Java వ్యవస్థ

### Microsoft Foundry టెంప్లేట్లు

1. **[Azure OpenAI Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   GPT-4 డిప్లాయ్‌మెంట్ తో పూర్తి చాట్ ఇంటర్‌ఫేస్  
   **సమయం:** 35-45 నిమిషాలు | **ఖర్చు:** $50-200/నెల  
   **అంచనా ఫలితం:** టోకెన్ ట్రాకింగ్ మరియు ఖర్చు మానిటరింగ్ కలిగిన పని చేసే చాట్ అప్లికేషన్

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   RAG ఆర్కిటెక్చర్ ఉన్న ఇంటెలిజెంట్ చాట్ అప్లికేషన్  
   **సమయం:** 60-90 నిమిషాలు | **ఖర్చు:** $100-300/నెల  
   **అంచనా ఫలితం:** డాక్యుమెంట్ శోధన మరియు ఉల్లేఖనాలతో RAG-సామర్థ్యంతో కూడిన చాట్ ఇంటర్‌ఫేస్

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Azure AI సేవలను ఉపయోగించిన డాక్యుమెంట్ విశ్లేషణ  
   **సమయం:** 40-60 నిమిషాలు | **ఖర్చు:** $20-80/నెల  
   **అంచనా ఫలితం:** అప్‌లోడ్ చేసిన డాక్యుమెంట్ల నుంచి పాఠ్యము, పట్టికలు, మరియు ఎంటిటీలను తీసే API

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Azure Machine Learning తో MLOps వర్క్‌ఫ్లో  
   **సమయం:** 2-3 గంటలు | **ఖర్చు:** $150-500/నెల  
   **అంచనా ఫలితం:** శిక్షణ, డిప్లాయ్‌మెంట్, మరియు మానిటరింగ్‌తో ఆటోమేటెడ్ ML పైప్‌లైన్

### వాస్తవ ప్రపంచ సన్నివేశాలు

#### **Retail Multi-Agent పరిష్కారం** 🆕  
**[పూర్తి అమలు గైడ్](./retail-scenario.md)**

కోంప్రెహెన్సివ్, ప్రొడక్షన్-రెడీ బహుళ-ఏజెంట్ కస్టమర్ సపోర్ట్ పరిష్కారం, ఇది AZD తో ఎంటర్ప్రైజ్-గ్రేడ్ AI అప్లికేషన్ డిప్లాయ్‌మెంట్‌ను ప్రదర్శిస్తుంది. ఈ సన్నివేశం అందిస్తుంది:
- **Complete Architecture**: Multi-agent system with specialized customer service and inventory management agents
- **ఉత్పత్తి ఇన్‌ఫ్రాస్ట్రక్చర్**: బహు-ప్రాంతాల Azure OpenAI అమకలు, AI Search, Container Apps, మరియు సమగ్ర మానిటరింగ్
- **ప్రారంభానికి సిద్ధమైన ARM టెంప్లేట్**: ఒక క్లిక్‌తో డిప్లాయ్ చేయగల బహు కాన్ఫిగరేషన్ మోడ్‌లతో (Minimal/Standard/Premium)
- **అధునాతన ఫీచర్లు**: రెడ్ టీమింగ్ సెక్యూరిటీ ధృవీకరణ, ఏజెంట్ మూల్యాంకన ఫ్రేమ్‌వర్క్, ఖర్చు ఆప్టిమైజేషన్, మరియు ట్రబుల్షూటింగ్ గైడ్లు
- **వాస్తవ వ్యాపార పరిసరాలు**: ఫైల్ అప్లోడ్‌లు, సెర్చ్ ఇంటిగ్రేషన్, మరియు డైనామిక్ స్కేలింగ్ ఉన్న రిటైల్ కస్టమర్ సపోర్ట్ యూజ్ కేసు

**సాంకేతికతలు**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**సంక్లిష్టత**: ⭐⭐⭐⭐ (అధునాతన - ఎంటర్ప్రైజ్ ప్రొడక్షన్-సిద్ధం)

**ఇది అనుకూలం**: AI డెవలపర్స్, సొల్యూషన్ ఆర్కిటెక్ట్లు, మరియు ప్రొడక్షన్ బహు-ఏజెంట్ల సిస్టమ్లు నిర్మించే బృందాలకు

**త్వరిత ప్రారంభం**: అందించిన ARM టెంప్లేట్ ఉపయోగించి `./deploy.sh -g myResourceGroup` తో పూర్తి పరిష్కారాన్ని 30 నిమిషాలలోపు డిప్లాయ్ చేయండి

## 📋 వినియోగ సూచనలు

### ముందస్తు అవసరాలు

Before running any example:
- ✅ Owner లేదా Contributor హక్కులతో Azure subscription
- ✅ Azure Developer CLI ఇన్‌స్టాల్ చేయబడినది ([ఇన్‌స్టాలేషన్ గైడ్](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop నడుస్తుంది (container ఉదాహరణల కోసం)
- ✅ అనుకూల Azure క్వాటాస్ (ఉదాహరణ-నిర్దిష్ట అవసరాలను తనిఖీ చేయండి)

> **💰 ఖర్చు హెచ్చరిక:** అన్ని ఉదాహరణలు నిజమైన Azure వనరులను సృష్టిస్తాయి మరియు ఛార్జీలు కలిగిస్తాయి. ఖర్చుల అంచనాల కోసం వ్యక్తిగత README ఫైళ్లను చూడండి. కొనసాగుతున్న ఖర్చులను నివారించడానికి పనిని పూర్తిచేసిన తర్వాత `azd down` ను 실행 చేయడం గుర్తుంచుకోండి.

### ఉదాహరణలను స్థానికంగా నడపడం

1. **ఉదాహరణను క్లోన్ లేదా కాపీ చేయండి**
   ```bash
   # కావలసిన ఉదాహరణకు నావిగేట్ చేయండి
   cd examples/simple-web-app
   ```

2. **AZD వాతావరణాన్ని ప్రారంభించండి**
   ```bash
   # ఉన్న టెంప్లేట్‌తో ప్రారంభించండి
   azd init
   
   # లేదా కొత్త పర్యావరణం సృష్టించండి
   azd env new my-environment
   ```

3. **వాతావరణాన్ని కాన్ఫిగర్ చేయండి**
   ```bash
   # అవసరమైన వేరియబుల్స్‌ను సెట్ చేయండి
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **డిప్లాయ్ చేయండి**
   ```bash
   # ఇన్‌ఫ్రాస్ట్రక్చర్ మరియు అప్లికేషన్‌ను అమర్చండి
   azd up
   ```

5. **అమరికను నిర్ధారించండి**
   ```bash
   # సేవా ఎండ్‌పాయింట్లను పొందండి
   azd env get-values
   
   # ఎండ్‌పాయింట్ను పరీక్షించండి (ఉదాహరణ)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **అనుకున్న విజయ సూచికలు:**
   - ✅ `azd up` పొరపాట్ల లేకుండా పూర్తవుతుంది
   - ✅ సర్వీస్ ఎండ్‌పాయింట్ HTTP 200 ను రిటర్న్ చేస్తుంది
   - ✅ Azure Portal "Running" స్థితిని చూపిస్తుంది
   - ✅ Application Insights టెలిమెట్రీను అందుకుంటోంది

> **⚠️ సమస్యలుమా?** డిప్లాయ్ ట్రబుల్‌షూటింగ్ కోసం [సాధారణ సమస్యలు](../docs/chapter-07-troubleshooting/common-issues.md) చూడండి

### ఉదాహరణలను అనుకూలీకరించడం

ప్రతీ ఉదాహరణలో ఇవి ఉంటాయి:
- **README.md** - విపులమైన సెటప్ మరియు అనుకూలీకరణ సూచనలు
- **azure.yaml** - వ్యాఖ్యలతో AZD కాన్ఫిగరేషన్
- **infra/** - పారామీటర్ వివరణలతో Bicep టెంప్లేట్లు
- **src/** - నమూనా అప్లికేషన్ కోడ్
- **scripts/** - సాధారణ పనులకు సహాయక స్క్రిప్ట్‌లు

## 🎯 నేర్చుకోవాల్సిన లక్ష్యాలు

### ఉదాహరణ వర్గాలు

#### **బేసిక్ డిప్లాయ్‌మెంట్లు**
- ఒక్క-సర్వీస్ అప్లికేషన్లు
- సాధారణ ఇన్‌ఫ్రాస్ట్రక్చర్ నమూనాలు
- ప్రాథమిక కాన్ఫిగరేషన్ నిర్వహణ
- ఖర్చు-ప్రభావవంతమైన డెవలప్‌మెంట్ సెటప్‌లు

#### **అధునాతన సన్నివేశాలు**
- బహు-సర్వీస్ ఆర్కిటెచర్లు
- సంక్లిష్ట నెట్‌వర్కింగ్ కాన్ఫిగరేషన్లు
- డేటాబేస్ సమీకరణ నమూనాలు
- భద్రత మరియు కంప్లయన్స్ అమలు

#### **ప్రొడక్షన్-సిద్ధ నమూనాలు**
- అధిక లభ్యత కాన్ఫిగరేషన్లు
- మానిటరింగ్ మరియు ఆబ్జర్వబిలిటీ
- CI/CD సమీకరణ
- విపత్తు పునరావాస సెటప్‌లు

## 📖 ఉదాహరణ వివరణలు

### Simple Web App - Node.js Express
**సాంకేతికతలు**: Node.js, Express, MongoDB, Container Apps  
**సంక్లిష్టత**: ప్రారంభ స్థాయి  
**సిద్ధాంతాలు**: ప్రాథమిక డిప్లాయ్‌మెంట్, REST API, NoSQL డేటాబేస్ సమీకరణ

### Static Website - React SPA
**సాంకేతికతలు**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**సంక్లిష్టత**: ప్రారంభ స్థాయి  
**సిద్ధాంతాలు**: స్టాటిక్ హోస్టింగ్, సర్వర్‌లెస్ బ్యాక్‌ఎండ్, ఆధునిక వెబ్ అభివృద్ధి

### Container App - Python Flask
**సాంకేతికతలు**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**సంక్లిష్టత**: ప్రారంభ స్థాయి  
**సిద్ధాంతాలు**: కంటైనరైజేషన్, REST API, scale-to-zero, హెల్త్ ప్రోబులు, మానిటరింగ్  
**Location**: [Local Example](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**సాంకేతికతలు**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**సంక్లిష్టత**: అధునాతన  
**సిద్ధాంతాలు**: బహు-సర్వీస్ ఆర్కిటెక్చర్, సర్వీస్ కమ్యూనికేషన్, మెసేజ్ క్యూయింగ్, విస్తృత ట్రేసింగ్  
**Location**: [Local Example](../../../examples/container-app/microservices)

### Database App - C# with Azure SQL
**సాంకేతికతలు**: C# ASP.NET Core, Azure SQL Database, App Service  
**సంక్లిష్టత**: మధ్యస్థ  
**సిద్ధాంతాలు**: Entity Framework, డేటాబేస్ కనెక్షన్లు, వెబ్ API అభివృద్ధి

### Serverless Function - Python Azure Functions
**సాంకేతికతలు**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**సంక్లిష్టత**: మధ్యస్థ  
**సిద్ధాంతాలు**: ఈవెంట్-డ్రివన్ ఆర్కిటెక్చర్, సర్వర్‌లెస్ కంప్యూటింగ్, ఫుల్-స్టాక్ అభివృద్ధి

### Microservices - Java Spring Boot
**సాంకేతికతలు**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**సంక్లిష్టత**: మధ్యస్థ  
**సిద్ధాంతాలు**: మైక్రోసర్వీసస్ కమ్యూనికేషన్, పంపిణీ వ్యవస్థలు, ఎంటర్ప్రైజ్ ప్యాటర్న్లు

### Microsoft Foundry Examples

#### Azure OpenAI Chat App
**సాంకేతికతలు**: Azure OpenAI, Cognitive Search, App Service  
**సంక్లిష్టత**: మధ్యస్థ  
**సిద్ధాంతాలు**: RAG ఆర్కిటెక్చర్, వెక్టర్ సెర్చ్, LLM సమీకరణ

#### AI Document Processing
**సాంకేతికతలు**: Azure AI Document Intelligence, Storage, Functions  
**సంక్లిష్టత**: మధ్యస్థ  
**సిద్ధాంతాలు**: డాక్యుమెంట్ విశ్లేషణ, OCR, డేటా ఎక్స్ట్రాక్షన్

#### Machine Learning Pipeline
**సాంకేతికతలు**: Azure ML, MLOps, Container Registry  
**సంక్లిష్టత**: అధునాతన  
**సిద్ధాంతాలు**: మోడల్ ట్రైనింగ్, డిప్లాయ్‌మెంట్ పైప్‌లైన్లు, మానిటరింగ్

## 🛠 కాన్ఫిగరేషన్ ఉదాహరణలు

The `configurations/` directory contains reusable components:

### వాతావరణ కాన్ఫిగరేషన్లు
- డెవలప్‌మెంట్ వాతావరణ సెట్టింగ్స్
- స్టేజింగ్ వాతావరణ కాన్ఫిగరేషన్లు
- ప్రొడక్షన్-సిద్ధ కాన్ఫిగరేషన్లు
- బహు-ప్రాంత డిప్లాయ్‌మెంట్ సెట్ల

### Bicep మాడ్యూల్స్
- పునఃవినియోగించదగిన ఇన్‌ఫ్రాస్ట్రక్చర్ భాగాలు
- సాధారణ రిసోర్స్ ప్యాటర్న్లు
- సెక్యూరిటీ-హార్డెండ్ టెంప్లేట్లు
- ఖర్చు-ఆప్టిమైజ్డ్ కాన్ఫిగరేషన్లు

### సహాయక స్క్రిప్ట్‌లు
- వాతావరణ సెటప్ ఆటోమేషన్
- డేటాబేస్ మైగ్రేషన్ స్క్రిప్ట్‌లు
- డిప్లాయ్ వాలిడేషన్ టూల్స్
- ఖర్చు మానిటరింగ్ యుటిలిటీస్

## 🔧 అనుకూలీకరణ మార్గదర్శి

### మీ ఉపయోగానికి ఉదాహరణలను అనుకూలీకరించడం

1. **ముందస్తు అవసరాలను సమీక్షించండి**
   - Azure సేవా అవసరాలను తనిఖీ చేయండి
   - సబ్స్క్రిప్షన్ పరిమితులను ధృవీకరించండి
   - ఖర్చు ప్రభావాలను అర్థం చేసుకోండి

2. **కాన్ఫిగరేషన్ మార్చండి**
   - `azure.yaml` సేవ నిర్వచనాలను అప్‌డేట్ చేయండి
   - Bicep టెంప్లేట్లను అనుకూలీకరించండి
   - వాతావరణ మార్పుల (environment variables) సర్దుబాటు చేయండి

3. **పూర్తిగా పరీక్షించండి**
   - ముందుగా అభివృద్ధి వాతావరణంలో డిప్లాయ్ చేయండి
   - ఫంక్షనాలిటీని ధృవీకరించండి
   - స్కేలింగ్ మరియు పనితీరును పరీక్షించండి

4. **భద్రతా సమీక్ష**
   - ప్రవేశ నియంత్రణలను సమీక్షించండి
   - సీక్రెట్ మేనేజ్మెంట్‌ను అమలు చేయండి
   - మానిటరింగ్ మరియు అలర్టింగ్ ఎనేబుల్ చేయండి

## 📊 తులనాత్మక మ్యాట్రిక్స్

| ఉదాహరణ | సేవలు | డేటాబేస్ | ప్రామాణీకరణ | మానిటరింగ్ | సంక్లిష్టత |
|---------|----------|----------|------|------------|------------|
| **Azure OpenAI Chat** (Local) | 2 | ❌ | Key Vault | పూర్తిగా | ⭐⭐ |
| **Python Flask API** (Local) | 1 | ❌ | ప్రాథమిక | పూర్తిగా | ⭐ |
| **Microservices** (Local) | 5+ | ✅ | ఎంటర్ప్రైజ్ | అధునాతన | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | ప్రాథమిక | ప్రాథమిక | ⭐ |
| React SPA + Functions | 3 | ✅ | ప్రాథమిక | పూర్తిగా | ⭐ |
| Python Flask Container | 2 | ❌ | ప్రాథమిక | పూర్తిగా | ⭐ |
| C# Web API + SQL | 2 | ✅ | పూర్తి | పూర్తిగా | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | పూర్తి | పూర్తి | ⭐⭐ |
| Java Microservices | 5+ | ✅ | పూర్తి | పూర్తి | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | పూర్తి | పూర్తి | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | ప్రాథమిక | పూర్తి | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | పూర్తి | పూర్తి | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Local) | **8+** | **✅** | **ఎంటర్ప్రైజ్** | **అధునాతన** | **⭐⭐⭐⭐** |

## 🎓 నేర్చుకునే మార్గం

### సిఫార్సు క్రమం

1. **సింపుల్ Web App** తో ప్రారంభించండి
   - ప్రాథమిక AZD కాన్సెప్ట్‌లను నేర్చుకోండి
   - డిప్లాయ్ వర్క్‌ఫ్లోను అర్థం చేసుకోండి
   - వాతావరణ నిర్వహణలో ప్రాక్టీస్ చేయండి

2. **స్టాటిక్ వెబ్‌సైట్ ప్రయత్నించండి**
   - విభిన్న హోస్టింగ్ ఎంపికలను అన్వేషించండి
   - CDN సమీకరణ గురించి తెలుసుకోండి
   - DNS కాన్ఫిగరేషన్‌ను అర్థం చేసుకోండి

3. **కంటైనర్ యాప్‌కు మారండి**
   - కంటైనరైజేషన్ ప్రాథమికాలను నేర్చుకోండి
   - స్కేలింగ్ కాన్సెప్ట్‌లను అర్థం చేసుకోండి
   - Docker తో సాధన చేయండి

4. **డేటాబేస్ సమీకరణ జోడించండి**
   - డేటాబేస్ ప్రొవిజనింగ్ నేర్చుకోండి
   - కనెక్షన్ స్ట్రింగ్స్‌ను అర్థం చేసుకోండి
   - సీక్రెట్ మేనేజ్మెంట్‌లో ప్రాక్టీస్ చేయండి

5. **సర్వర్‌లెస్ అన్వేషించండి**
   - ఈవెంట్-డ్రివన్ ఆర్కిటెక్చర్‌ను అర్థం చేసుకోండి
   - ట్రిగర్స్ మరియు బైండింగ్స్ గురించి నేర్చుకోండి
   - APIs తో ప్రాక్టీస్ చేయండి

6. **మైక్రోసర్వీసెస్ నిర్మించండి**
   - సర్వీస్ కమ్యూనికేషన్ నేర్చుకోండి
   - పంపిణీ వ్యవస్థలను అర్థం చేసుకోండి
   - సంక్లిష్ట డిప్లాయ్‌మెంట్‌లపై ప్రాక్టీస్ చేయండి

## 🔍 సరైన ఉదాహరణ కనుగొనడం

### సాంకేతిక స్టాక్ ఆధారంగా
- **Container Apps**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Local)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Local)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Local)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Go**: [Microservices User Service (Local)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (Local)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### ఆర్కిటెక్చర్ ప్యాటర్న్ ఆధారంగా
- **Simple REST API**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Local)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### సంక్లిష్టత స్థాయి ద్వారా
- **ప్రారంభ స్థాయి**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **మధ్యస్థ**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **అధునాతన**: ML Pipeline
- **ఎంటర్ప్రైజ్ ప్రొడక్షన్-సిద్ధం**: [Microservices (Local)](../../../examples/container-app/microservices) (బహు-సర్వీస్ మరియు మెసేజ్ క్యూయింగ్), **Retail Multi-Agent Solution** (ARM టెంప్లేట్ డిప్లాయ్‌తో పూర్తి బహు-ఏజెంట్ సిస్టమ్)

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
- [Node.js మరియు PostgreSQL తో Todo App](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [C# API తో React Web App](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Javaతో Azure Functions](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### ఉత్తమ పద్ధతులు
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 ఉదాహరణలు సమర్పించడం

పరయోజనకరమైన ఒక ఉదాహరణ పంచుకోవాలనుకుంటున్నారా? మేము సహకారాలను స్వాగతిస్తాము!

### సమర్పణ మార్గదర్శకాలు
1. స్థాపించబడిన డైరెక్టరీ నిర్మాణాన్ని అనుసరించండి
2. విస్తృత README.mdని చేర్చండి
3. కాన్ఫిగరేషన్ ఫైళ్లలో వ్యాఖ్యలు జోడించండి
4. సమర్పించే ముందు పూర్తిగా పరీక్షించండి
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

**ప్రో టిప్**: మీ టెక్నాలజీ స్టాక్‌కు సరిపోయే సులభమైన ఉదాహరణతో ప్రారంభించండి, తర్వాత تدريجగా మరింత సంక్లిష్ట സാഹചര്യాల వైపు ఎదగండి. ప్రతి ఉదాహరణ గత ఉదాహరణల నుండి ఉన్న కాన్సెప్ట్‌లపై నిర్మించబడుతుంది!

## 🚀 ప్రారంభించడానికి సిద్ధమా?

### మీ నేర్చుకునే మార్గం

1. **సంపూర్ణ ఆరంభకుడా?** → ప్రారంభించండి [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 నిమిషాలు)
2. **AZD గురించి ప్రాథమిక పరిజ్ఞానమా?** → ప్రయత్నించండి [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 నిమిషాలు)
3. **AI యాప్స్ తయారు చేస్తుండాలా?** → ప్రారంభించండి [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 నిమిషాలు) లేదా అన్వేషించండి [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ గంటలు)
4. **ఖచ్చితమైన టెక్ స్టాక్ కావాలా?** → పై భాగంలో ఉన్న [సరైన ఉదాహరణ కనుగొనడం](../../../examples) విభాగాన్ని ఉపయోగించండి

### తర్వాతి దశలు

- ✅ పైలోని [ముందస్తు అవసరాలు](../../../examples)ను సమీక్షించండి
- ✅ మీ నైపుణ్య స్థాయికి అనుగుణంగా ఒక ఉదాహరణ ఎంచుకోండి (చూడండి [సంక్లిష్టత లెజెండ్](../../../examples))
- ✅ ఆ ఉదాహరణ యొక్క README ను డిప్లాయ్ చేయడానికి ముందు పూర్తిగా చదవండి
- ✅ టెస్టింగ్ అనంతరం `azd down` నడపాలని గుర్తుచేసుకునేందుకు ఒక రిమైండర్ సెట్ చేయండి
- ✅ మీ అనుభవాన్ని GitHub Issues లేదా Discussions ద్వారా పంచుకోండి

### సహాయం కావాలా?

- 📖 [FAQ](../resources/faq.md) - తరచుగా అడిగే ప్రశ్నలకు సమాధానాలు
- 🐛 [Troubleshooting Guide](../docs/chapter-07-troubleshooting/common-issues.md) - డిప్లాయ్ సమస్యలను పరిష్కరించండి
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - కమ్యూనిటీతో ప్రశ్నలు అడగండి
- 📚 [Study Guide](../resources/study-guide.md) - మీ నేర్చుకొన్నదాన్ని బలోపేతం చేయండి

---

**నావిగేషన్**
- **📚 కోర్స్ హోమ్**: [AZD For Beginners](../README.md)
- **📖 అధ్యయన పదార్థాలు**: [Study Guide](../resources/study-guide.md) | [Cheat Sheet](../resources/cheat-sheet.md) | [Glossary](../resources/glossary.md)
- **🔧 వనరులు**: [FAQ](../resources/faq.md) | [Troubleshooting](../docs/chapter-07-troubleshooting/common-issues.md)

---

*చివరిగా నవీకరించబడింది: November 2025 | [Report Issues](https://github.com/microsoft/AZD-for-beginners/issues) | [Contribute Examples](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
నిరాకరణ:
ఈ డాక్యుమెంట్‌ను AI అనువాద సేవ Co-op Translator (https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నించినప్పటికీ, స్వయంచాలిత అనువాదాల్లో పొరపాటు లేదా అనిశితం ఉంటే ఉండొచ్చు అని దయచేసి గమనించండి. మూల భాషలో ఉన్న అసలైన పత్రాన్ని అధికారిక మూలంగా పరిగణించాలి. ముఖ్యమైన సమాచారానికి వృత్తిపరమైన మానవ అనువాదాన్ని ఉపయోగించాలని సిఫార్సు చేస్తాము. ఈ అనువాదం ఉపయోగించడం నుంచి కలిగే ఏవైనా అపార్థాలు లేదా తప్పుదృష్టులపై మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->