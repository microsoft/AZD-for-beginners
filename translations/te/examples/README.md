# ఉదాహరణలు - ప్రయోగాత్మక AZD టెంప్లేట్లు మరియు కాన్ఫిగరేషన్లు

**ఉదాహరణల ద్వారా నేర్చుకోవడం - అధ్యాయాల వారీగా సకలీకృతం**
- **📚 కోర్సు హోమ్**: [AZD For Beginners](../README.md)
- **📖 అధ్యాయ మ్యాపింగ్**: నేర్చుకునే క్లిష్టత ఆధారంగా ఆర్గనైజ్డ్ చేసిన ఉదాహరణలు
- **🚀 లోకల్ ఉదాహరణ**: [Retail Multi-Agent Solution](retail-scenario.md)
- **🤖 బాహ్య AI ఉదాహరణలు**: Azure Samples రిపోజిటరీలకి లింక్స్

> **📍 IMPORTANT: లోకల్ vs బాహ్య ఉదాహరణలు**  
> ఈ రిపోజిటరీలో మొత్తం 4 పూర్తి లోకల్ ఉదాహరణలు ఉన్నాయి, పూర్తి అమలు సహితంగా:  
> - **Microsoft Foundry Models Chat** (gpt-4.1 deployment with chat interface)  
> - **Container Apps** (Simple Flask API + Microservices)  
> - **Database App** (Web + SQL Database)  
> - **Retail Multi-Agent** (Enterprise AI Solution)  
>  
> అదనపు ఉదాహరణలు Azure-Samples రిపోజిటరీలకి బాహ్య రిఫరెన్సులుగా ఉన్నాయి, మీరు వాటిని క్లోన్ చేయవచ్చు.

## పరిచయం

ఈ డైరెక్టరీ వ్యావహారిక ఉదాహరణలు మరియు రిఫరెన్సులు అందిస్తుంది, అవి మీకు Azure Developer CLI ను చేతితో నేర్చుకోవడానికి సహాయపడతాయి. Retail Multi-Agent పరిస్థితి ఈ రిపోజిటరీలో చేర్చిన పూర్తి, ప్రొడక్షన్-రెడీ అమలు. అదనపు ఉదాహరణలు వివిధ AZD నమూనాలను చూపించే అధికారిక Azure Samples లను సూచిస్తాయి.

### క్లిష్టత రేటింగ్ లెజెండ్

- ⭐ **ప్రారంభ స్థాయి** - ప్రాథమిక భావనలు, ఒకే సేవ, 15-30 నిమిషాలు
- ⭐⭐ **మధ్యస్థ స్థాయి** - బహుళ సేవలు, డేటాబేస్ ఇంటిగ్రేషన్, 30-60 నిమిషాలు
- ⭐⭐⭐ **అధునాతన** - సంక్లిష్ట ఆర్కిటెక్చర్, AI ఇంటిగ్రేషన్, 1-2 గంటలు
- ⭐⭐⭐⭐ **నిపుణులు** - ప్రొడక్షన్-రెడీ, ఎంటర్ప్రైజ్ నమూనాలు, 2+ గంటలు

## 🎯 ఈ రిపోజిటరీలో వాస్తవంగా ఏముంది

### ✅ లోకల్ అమలు (ఉపయోగానికి సిద్ధంగా)

#### [Microsoft Foundry Models Chat Application](azure-openai-chat/README.md) 🆕
**ఈ రిపోజిటరీలో చాట్ ఇంటర్‌ఫేస్ సహా పూర్తి gpt-4.1 డిప్లాయ్‌మెంట్**

- **స్థానం:** `examples/azure-openai-chat/`
- **సంక్లిష్టత:** ⭐⭐ (మధ్యస్థ స్థాయి)
- **ఇందులో ఏముంది:**
  - పూర్తి Microsoft Foundry Models డిప్లాయ్‌మెంట్ (gpt-4.1)
  - Python కమాండ్-లైన్ చాట్ ఇంటర్‌ఫేస్
  - సురక్షిత API కీలు కోసం Key Vault ఇంటిగ్రేషన్
  - Bicep ఇన్‌ఫ్రాస్ట్రక్చర్ టెంప్లేట్లు
  - టోకెన్ వినియోగం మరియు ఖర్చు ట్రాకింగ్
  - రేట్ పరిమితి మరియు లోపాల నిర్వహణ

**త్వరిత ప్రారంభం:**
```bash
# ఉదాహరణకు వెళ్ళండి
cd examples/azure-openai-chat

# అన్నింటినీ అమలు చేయండి
azd up

# ఆవశ్యకమైన డిపెండెన్సీలు ఇన్‌స్టాల్ చేసి చాట్ ప్రారంభించండి
pip install -r src/requirements.txt
python src/chat.py
```

**సాంకేతికతలు:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Container App Examples](container-app/README.md) 🆕
**ఈ రిపోజిటరీలో సమగ్ర కంటైనర్ డిప్లాయ్‌మెంట్ ఉదాహరణలు ఉన్నాయి**

- **స్థానం:** `examples/container-app/`
- **సంక్లిష్టత:** ⭐-⭐⭐⭐⭐ (ప్రారంభ స్థాయి నుండి నైపుణ్య స్థాయి వరకు)
- **ఇందులో ఏముంది:**
  - [Master Guide](container-app/README.md) - కంటైనర్ డిప్లాయ్‌మెంట్‌ల పూర్తి అవలోకనం
  - [Simple Flask API](../../../examples/container-app/simple-flask-api) - ప్రాథమిక REST API ఉదాహరణ
  - [Microservices Architecture](../../../examples/container-app/microservices) - ప్రొడక్షన్-రెడీ బహు-సర్వీస్ డిప్లాయ్‌మెంట్
  - త్వరిత ప్రారంభం, ప్రొడక్షన్ మరియు అధునాతన నమూనాలు
  - మానిటరింగ్, భద్రత, మరియు ఖర్చు ఆప్టిమైజేషన్

**త్వరిత ప్రారంభం:**
```bash
# మాస్టర్ గైడ్ చూడండి
cd examples/container-app

# సాధారణ Flask APIని డిప్లాయ్ చేయండి
cd simple-flask-api
azd up

# మైక్రోసర్వీసెస్ ఉదాహరణను డిప్లాయ్ చేయండి
cd ../microservices
azd up
```

**సాంకేతికతలు:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent Solution](retail-scenario.md) 🆕
**ఈ రిపోజిటరీలో పూర్తి ప్రొడక్షన్-రెడీ అమలు**

- **స్థానం:** `examples/retail-multiagent-arm-template/`
- **సంక్లిష్టత:** ⭐⭐⭐⭐ (అధునాతన)
- **ఇందులో ఏముంది:**
  - పూర్తి ARM డిప్లాయ్‌మెంట్ టెంప్లేట్
  - బహుళ-ఏజెంట్ ఆర్కిటెక్చర్ (Customer + Inventory)
  - Microsoft Foundry Models ఇంటిగ్రేషన్
  - RAG తో AI సర్చ్
  - సమగ్ర మానిటరింగ్
  - ఒక క్లిక్ డిప్లాయ్‌మెంట్ స్క్రిప్ట్

**త్వరిత ప్రారంభం:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**సాంకేతికతలు:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 బాహ్య Azure Samples (క్లోన్ చేసి ఉపయోగించండి)

క్రింది ఉదాహరణలు అధికారిక Azure-Samples రిపోజిటరీలలో నిర్వహింపబడతాయి. వివిధ AZD నమూనాలను గురించి తెలుసుకోవడానికి అవి క్లోన్ చేయండి:

### సింపుల్ అప్లికేషన్లు (అధ్యాయాలు 1-2)

| టెంప్లేట్ | రిపోజిటరీ | సంక్లిష్టత | సేవలు |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [లోకల్: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [లోకల్: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | బహు-సేవల, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**పయోగించే విధానం:**
```bash
# ఏదైనా ఉదాహరణను క్లోన్ చేయండి
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# డిప్లాయ్ చేయండి
azd up
```

### AI అప్లికేషన్ ఉదాహరణలు (అధ్యాయాలు 2, 5, 8)

| టెంప్లేట్ | రిపోజిటరీ | సంక్లిష్టత | ఫోకస్ |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [లోకల్: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 డిప్లాయ్‌మెంట్ |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | ప్రాథమిక AI చాట్ |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | ఏజెంట్ ఫ్రేమ్‌వర్క్ |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG నమూనా |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | ఎంటర్ప్రైజ్ AI |

### డేటాబేస్ & అధునాతన నమూనాలు (అధ్యాయాలు 3-8)

| టెంప్లేట్ | రిపోజిటరీ | సంక్లిష్టత | ఫోకస్ |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | డేటాబేస్ ఇంటిగ్రేషన్ |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL సర్వర్‌లెస్ |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | బహు-సర్వీస్ |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## అభ్యాస లక్ష్యాలు

ఈ ఉదాహరణల ద్వారా పని చేస్తే, మీరు:
- వాస్తవ ఆకృతి అప్లికేషన్ సందర్భాలతో Azure Developer CLI పనితీరును అభ్యాసం చేయగలరు
- వివిధ అప్లికేషన్ ఆర్కిటెక్చర్లను మరియు అవి azd లో ఎలా అమలవుతాయో అర్థం చేసుకోవచ్చు
- వివిధ Azure సేవల కోసం Infrastructure as Code నమూనాలను నేర్చుకోవచ్చు
- కాన్ఫిగరేషన్ మేనేజ్‌మెంట్ మరియు వాతావరణ-నిర్దిష్ట డిప్లాయ్‌మెంట్ వ్యూహాలను అమలు చేయగలరు
- వాస్తవ సందర్భాలలో మానిటరింగ్, భద్రత మరియు స్కేలింగ్ నమూనాలను అమలు చేయగలరు
- వాస్తవ డిప్లాయ్‌మెంట్ సమస్యల డీబగ్గింగ్ మరియు ట్రబుల్షూటింగ్ లో అనుభవాన్ని పొందగలరు

## నేర్చుకున్న ఫలితాలు

ఈ ఉదాహరణలను పూర్తిచేసిన తర్వాత, మీరు చేయగలరా:
- Azure Developer CLI ఉపయోగించి వివిధ అప్లికేషన్ రకాలని ధృవీకరించే విధంగా డిప్లాయ్ చేయగలరు
- ఇచ్చిన టెంప్లేట్లను మీ స్వంత అప్లికేషన్ అవసరాలకు అనుగుణంగా సవరించగలరు
- Bicep ఉపయోగించి అనుకూల ఇన్‌ఫ్రాస్ట్రక్చర్ నమూనాలను డిజైన్ చేసి అమలు చేయగలరు
- సరైన ఆధారపడ్డతలతో సంక్లిష్ట బహు-సర్వీస్ అప్లికేషన్లను కాన్ఫిగర్ చేయగలరు
- వాస్తవ సందర్భాలలో భద్రత, మానిటరింగ్ మరియు పనితీరు ఉత్తమ పద్ధతులను వర్తింపజేయగలరు
- వాస్తవ అనుభవం ఆధారంగా డిప్లాయ్‌మెంట్లను ట్రబుల్షూట్ చేసి ఆప్టిమైజ్ చేయగలరు

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

> **💡 AZD కొత్తవారా?** ఉదాహరణ #1 (Flask API) తో ప్రారంభించండి - ఇది సుమారు 20 నిమిషాలు తీసుకుంటుంది మరియు కోర్ కాన్సెప్ట్లను నేర్పుతుంది.

### ప్రారంభ స్థాయి వాడుకదారులకి
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (లోకల్) ⭐  
   స్కేల్-టు-జీరో తో ఒక సాధారణ REST APIని డిప్లాయ్ చేయండి  
   **సమయం:** 20-25 నిమిషాలు | **ఖర్చు:** $0-5/నెల  
   **మీరు నేర్చుకొనేందుకు:** ప్రాథమిక azd వర్క్‌ఫ్లో, కంటైనరైజేషన్, హెల్త్ ప్రోబ్స్  
   **అనూహ్య ఫలితం:** "Hello, World!" ని రిటర్న్ చేసే పనికిరాని API ఎండ్పాయింట్ మానిటరింగ్ తో

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   MongoDB తో ఒక Node.js Express వెబ్ అప్లికేషన్‌ను డిప్లాయ్ చేయండి  
   **సమయం:** 25-35 నిమిషాలు | **ఖర్చు:** $10-30/నెల  
   **మీరు నేర్చుకోవాల్సినది:** డేటాబేస్ ఇంటిగ్రేషన్, ఇన్‌విరాన్మెంట్ వేరియబుల్స్, కనెక్షన్ స్ట్రింగ్స్  
   **అనూహ్య ఫలితం:** సృష్టించడం/పఠనం/నవీకరణ/చాలించడం ఉండే Todo లిస్ట్ అప్లికేషన్

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Azure Static Web Apps తో React స్టాటిక్ వెబ్‌సైట్ హోస్ట్ చేయండి  
   **సమయం:** 20-30 నిమిషాలు | **ఖర్చు:** $0-10/నెల  
   **మీరు నేర్చుకునేది:** స్టాటిక్ హోస్టింగ్, సర్వర్లెస్ ఫంక్‌షన్స్, CDN డిప్లాయ్‌మెంట్  
   **అనూహ్య ఫలితం:** API బ్యాక్‌ఎండ్ తో React UI, ఆటోమేటిక్ SSL, గ్లోబల్ CDN

### మధ్యస్థ స్థాయి వాడుకదారులకి
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (లోకల్) ⭐⭐  
   gpt-4.1 ను చాట్ ఇంటర్‌ఫేస్ మరియు సురక్షిత API కీ నిర్వహణతో డిప్లాయ్ చేయండి  
   **సమయం:** 35-45 నిమిషాలు | **ఖర్చు:** $50-200/నెల  
   **మీరు నేర్చుకోవాల్సినది:** Microsoft Foundry Models డిప్లాయ్‌మెంట్, Key Vault ఇంటిగ్రేషన్, టోకెన్ ట్రాకింగ్  
   **అనూహ్య ఫలితం:** gpt-4.1 మరియు ఖర్చు మానిటరింగ్‌తో పనిచేసే చాట్ అప్లికేషన్

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (లోకల్) ⭐⭐⭐⭐  
   ప్రొడక్షన్-రెడీ బహు-సర్వీస్ ఆర్కిటెక్చర్  
   **సమయం:** 45-60 నిమిషాలు | **ఖర్చు:** $50-150/నెల  
   **మీరు నేర్చుకోవాల్సినది:** సేవల కమ్యూనికేషన్, మెసేజ్ క్యూ, డిస్ట్రిబ్యూటెడ్ ట్రేసింగ్  
   **అనూహ్య ఫలితం:** మానిటరింగ్‌తో 2-సర్వీస్ సిస్టమ్ (API గేట్‌వే + Product Service)

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   C# API మరియు Azure SQL డేటాబేస్‌తో వెబ్ అప్లికేషన్  
   **సమయం:** 30-45 నిమిషాలు | **ఖర్చు:** $20-80/నెల  
   **మీరు నేర్చుకోవాల్సినది:** Entity Framework, డేటాబేస్ మైగ్రేషన్లు, కనెక్షన్ భద్రత  
   **అనూహ్య ఫలితం:** Azure SQL బ్యాకెండ్ ఉన్న C# API, ఆటోమేటిక్ స్కీమా డిప్లాయ్‌మెంట్

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   HTTP ట్రిగ్గర్లతో Python Azure Functions మరియు Cosmos DB  
   **సమయం:** 30-40 నిమిషాలు | **ఖర్చు:** $10-40/నెల  
   **మీరు నేర్చుకోవాల్సినది:** ఈవెంట్-డ్రివన్ ఆర్కిటెక్చర్, సర్వర్‌లెస్ స్కేలింగ్, NoSQL ఇంటిగ్రేషన్  
   **అనూహ్య ఫలితం:** HTTP కోరలకి స్పందించే మరియు Cosmos DB స్టోరేజ్ ఉపయోగించే ఫంక్షన్ అప్లికేషన్

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Container Apps మరియు API గేట్‌వేతో బహుళ-సర్వీస్ Java అప్లికేషన్  
   **సమయం:** 60-90 నిమిషాలు | **ఖర్చు:** $80-200/నెల  
   **మీరు నేర్చుకోవాల్సినది:** Spring Boot డిప్లాయ్‌మెంట్, సర్వీస్ మెష్, లోడ్ బ్యాలెన్సింగ్  
   **అనూహ్య ఫలితం:** సేవా కనుగొనడం మరియు రౌటింగ్‌తో బహుళ-సర్వీస్ Java సిస్టమ్

### Microsoft Foundry టెంప్లేట్లు

1. **[Microsoft Foundry Models Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   చాట్ ఇంటర్‌ఫేస్‌తో పూర్తి gpt-4.1 డిప్లాయ్‌మెంట్  
   **సమయం:** 35-45 నిమిషాలు | **ఖర్చు:** $50-200/నెల  
   **అనూహ్య ఫలితం:** టోకెన్ ట్రాకింగ్ మరియు ఖర్చు మానిటరింగ్‌తో పనిచేసే చాట్ అప్లికేషన్

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   RAG ఆర్కిటెక్చర్‌తో ఇంటెలిజెంట్ చాట్ అప్లికేషన్  
   **సమయం:** 60-90 నిమిషాలు | **ఖర్చు:** $100-300/నెల  
   **అనూహ్య ఫలితం:** డాక్యుమెంట్ సెర్చ్ మరియు సూచనలు కలిగిన RAG-శక్తివంతమైన చాట్ ఇంటర్‌ఫేస్

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Azure AI సేవల ఉపయోగంతో డాక్యుమెంట్ విశ్లేషణ  
   **సమయం:** 40-60 నిమిషాలు | **ఖర్చు:** $20-80/నెల  
   **అనూహ్య ఫలితం:** అప్లోడ్ చేసిన డాక్యుమెంట్ల నుంచి టెక్స్ట్, టేబుల్స్ మరియు ఎంటిటీలు యాక్స్ట్రాక్ట్ చేయగల API

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Azure Machine Learning తో MLOps వర్క్‌ఫ్లో  
   **సమయం:** 2-3 గంటలు | **ఖర్చు:** $150-500/నెల  
   **అనూహ్య ఫలితం:** ట్రైనింగ్, డిప్లాయ్‌మెంట్ మరియు మానిటరింగ్‌తో ఆటోమేటెడ్ ML పైప్‌లైన్

### వాస్తవ-ప్రపంచ పరిస్థితులు

#### **Retail Multi-Agent Solution** 🆕
**[Complete Implementation Guide](./retail-scenario.md)**

ఒక సమగ్ర, ప్రొడక్షన్-రెడీ బహుళ-ఏజెంట్ కస్టమర్ సపోర్ట్ పరిష్కారం, ఇది AZDతో ఎంటర్ప్రైజ్-గ్రేడ్ AI అప్లికేషన్ డిప్లాయ్‌మెంట్‌ను చూపిస్తుంది. ఈ పరిస్థితి అందిస్తుంది:
- **Complete Architecture**: మల్టీ-ఏజెంట్ సిస్టమ్ ప్రత్యేకీకరించబడిన కస్టమర్ సర్వీస్ మరియు ఇన్వెంటరీ నిర్వహణ ఏజెంట్లతో
- **Production Infrastructure**: బహు-రీజియన్ Microsoft Foundry Models deployments, AI Search, Container Apps, మరియు సమగ్ర మానిటరింగ్
- **Ready-to-Deploy ARM Template**: ఒక క్లిక్ డిప్లోయ్ బహు కాన్ఫిగరేషన్ మోడ్‌లతో (Minimal/Standard/Premium)
- **Advanced Features**: red teaming సెక్యూర్‌‌టి వెరిఫికేషన్, ఏజెంట్ మూల్యాంకన ఫ్రేమ్‌వర్క్, ఖర్చు ఆప్టిమైజేషన్, మరియు ట్రబుల్షూటింగ్ గైడ్‌లు
- **Real Business Context**: రిటైలర్ కస్టమర్ సపోర్ట్ ఉపయోగ ఉదాహరణ ఫైల్ अप్లోడ్‌లు, సెర్చ్ ఇంటిగ్రేషన్, మరియు డైనమిక్ స్కేలింగ్‌తో

**Technologies**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Complexity**: ⭐⭐⭐⭐ (అడ్వాన్స్‌డ్ - ఎంటర్‌ప్రైజ్ ప్రొడక్షన్ రెడీ)

**Perfect for**: AI డెవలపర్స్, సొల్యూషన్ ఆర్కిటెక్ట్స్, మరియు ప్రొడక్షన్ మల్టీ-ఏజెంట్ సిస్టమ్స్ నిర్మిస్తున్న టీమ్స్

**Quick Start**: చేర్చబడిన ARM టెంప్లేట్ ఉపయోగించి `./deploy.sh -g myResourceGroup` తో పూర్తి సొల్యూషన్‌ను 30 నిమిషాలలోపు డిప్లాయ్ చేయండి

## 📋 ఉపయోగం సూచనలు

### ముందస్తు అవసరాలు

ఏదైన ఉదాహరణను నడిపే ముందు:
- ✅ Owner లేదా Contributor 접근తో Azure subscription
- ✅ Azure Developer CLI ఇన్‌స్టాల్ చేయబడి ఉంటుంది ([Installation Guide](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop నడుస్తుంది (కంటెయినర్ ఉదాహరణల కోసం)
- ✅ సంబంధిత Azure కోటాస్ (ఉదాహరణ-స్పెసిఫిక్ అవసరాలను తనిఖీ చేయండి)

> **💰 ఖర్చు హెచ్చరిక:** అన్ని ఉదాహరణలు వాస్తవ Azure రిసోర్స్‌లు సృష్టిస్తాయి అవి ఛార్జీలను కలిగిస్తాయి. ఖర్చు అంచనాల కోసం వ్యక్తిగత README ఫైళ్లను చూడండి. కొనసాగుతున్న ఖర్చులను నివారించడానికి ముగిసాక `azd down` నడపమని గుర్తుంచుకోండి.

### స్థానికంగా ఉదాహరణలు నడపడం

1. **ఉదాహరణను క్లోన్ లేదా కాపీ చేయండి**
   ```bash
   # కోరుకున్న ఉదాహరణకు నావిగేట్ చేయండి
   cd examples/simple-web-app
   ```

2. **AZD ఎన్విరాన్‌మెంట్‌ను ప్రారంభించండి**
   ```bash
   # ఉన్న టెంప్లేట్‌తో ప్రారంభించండి
   azd init
   
   # లేదా కొత్త పర్యావరణాన్ని సృష్టించండి
   azd env new my-environment
   ```

3. **ఎన్విరాన్‌మెంట్‌ను కాన్ఫిగర్ చేయండి**
   ```bash
   # అవసరమైన వేరియబుల్‌లను సెట్ చేయండి
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **డిప్లాయ్ చేయండి**
   ```bash
   # ఇన్‌ఫ్రాస్ట్రక్చర్ మరియు అనువర్తనాన్ని అమర్చండి
   azd up
   ```

5. **డిప్లాయ్‌ను నిర్ధారించండి**
   ```bash
   # సేవ ఎండ్‌పాయింట్లను పొందండి
   azd env get-values
   
   # ఎండ్‌పాయింట్‌ను పరీక్షించండి (ఉదాహరణ)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **అంచనా విజయ సూచికలు:**
   - ✅ `azd up`లో ఎర్రర్స్ లేకుండా పూర్తి అయి ఉండాలి
   - ✅ సర్వీస్ ఎండ్‌పాయింట్ HTTP 200ను రిటర్న్ చేయాలి
   - ✅ Azure పోర్టల్ "Running" స్థితిని చూపిస్తుంది
   - ✅ Application Insights టెలిమెట్రీ అందుకుంటోంది

> **⚠️ సమస్యలు ఉన్నాయా?** డిప్లాయ్‌మెంట్ ట్రబుల్షూటింగ్ కోసం [Common Issues](../docs/chapter-07-troubleshooting/common-issues.md) చూడండి

### ఉదాహరణలను అనుకూలీకరించడం

ప్రతి ఉదాహరణలో ఉంటాయి:
- **README.md** - స్థాపన మరియు కస్టమైజేషన్ సూచనలు వివరంగా
- **azure.yaml** - వ్యాఖ్యలతో AZD కాన్ఫిగరేషన్
- **infra/** - పారామీటర్ వివరణలతో Bicep టెంప్లేట్స్
- **src/** - నమూనా అప్లికేషన్ కోడ్
- **scripts/** - సాధారణ పనుల కోసం సహాయక స్క్రిప్ట్స్

## 🎯 నేర్చుకునే లక్ష్యాలు

### ఉదాహరణ వర్గాలు

#### **ప్రాథమిక డిప్లాయ్‌మెంట్లు**
- సింగిల్-సర్వీస్ అప్లికేషన్లు
- సింపుల్ ఇన్ఫ్రాస్ట్రక్చర్ నమూనాలు
- ప్రాథమిక కాన్ఫిగరేషన్ నిర్వహణ
- ఖర్చు-ప్రయోజనకరమైన డెవలప్‌మెంట్ సెటప్‌లు

#### **అడ్వాన్స్‌డ్ సన్నివేశాలు**
- మల్టీ-సర్వీస్ ఆర్కిటెక్చర్స్
- సంక్లిష్ట నెట్వర్కింగ్ కాన్ఫిగరేషన్‌లు
- డేటాబేస్ ఇంటిగ్రేషన్ నమూనాలు
- సెక్యూరిటీ మరియు కంప్లయన్స్ అమలు

#### **ప్రొడక్షన్-రెడీ ప్యాటర్న్లు**
- హై అవైలబిలిటీ కాన్ఫిగరేషన్లు
- మానిటరింగ్ మరియు ఆబ్జర్వబిలిటీ
- CI/CD ఇంటిగ్రేషన్
- డిజాస్టర్ రికవరీ సెటప్‌లు

## 📖 ఉదాహరణ వివరణలు

### Simple Web App - Node.js Express
**Technologies**: Node.js, Express, MongoDB, Container Apps  
**Complexity**: ప్రారంభ స్థాయి  
**Concepts**: ప్రాథమిక డిప్లాయ్‌మెంట్, REST API, NoSQL డేటాబేస్ ఇంటిగ్రేషన్

### Static Website - React SPA
**Technologies**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complexity**: ప్రారంభ స్థాయి  
**Concepts**: స్టాటిక్ హోస్టింగ్, సర్వర్‌లెస్ బ్యాక్‌ఎండ్, ఆధునిక వెబ్ డెవలప్‌మెంట్

### Container App - Python Flask
**Technologies**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Complexity**: ప్రారంభ స్థాయి  
**Concepts**: కంటెయినరైజేషన్, REST API, scale-to-zero, health probes, మానిటరింగ్  
**Location**: [స్థానిక ఉదాహరణ](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**Technologies**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complexity**: అడ్వాన్స్‌డ్  
**Concepts**: మల్టీ-సర్వీస్ ఆర్కిటెక్చర్, సర్వీస్ కమ్యూనికేషన్, మెసేజ్ క్యూయింగ్, డిస్ట్రిబ్యూటెడ్ ట్రేసింగ్  
**Location**: [స్థానిక ఉదాహరణ](../../../examples/container-app/microservices)

### Database App - C# with Azure SQL
**Technologies**: C# ASP.NET Core, Azure SQL Database, App Service  
**Complexity**: మధ్యమ స్థాయి  
**Concepts**: Entity Framework, డేటాబేస్ కనెక్షన్స్, వెబ్ API డెవలప్‌మెంట్

### Serverless Function - Python Azure Functions
**Technologies**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complexity**: మధ్యమ స్థాయి  
**Concepts**: ఈవెంట్-డ్రివన్ ఆర్కిటెక్చర్, సర్వర్‌లెస్ కంప్యూటింగ్, ఫుల్-స్టాక్ డెవలప్‌మెంట్

### Microservices - Java Spring Boot
**Technologies**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Complexity**: మధ్యమ స్థాయి  
**Concepts**: మైక్రోసర్వీసెస్ కమ్యూనికేషన్, డిస్ట్రిబ్యూటెడ్ సిస్టమ్స్, ఎంటర్‌ప్రైజ్ ప్యాటర్న్స్

### Microsoft Foundry Examples

#### Microsoft Foundry Models Chat App
**Technologies**: Microsoft Foundry Models, Cognitive Search, App Service  
**Complexity**: మధ్యమ స్థాయి  
**Concepts**: RAG architecture, వెక్టర్ సెర్చ్, LLM ఇంటిగ్రేషన్

#### AI Document Processing
**Technologies**: Azure AI Document Intelligence, Storage, Functions  
**Complexity**: మధ్యమ స్థాయి  
**Concepts**: డాక్యుమెంట్ విశ్లేషణ, OCR, డేటా ఎక్స్‌ట్రాక్షన్

#### Machine Learning Pipeline
**Technologies**: Azure ML, MLOps, Container Registry  
**Complexity**: అడ్వాన్స్‌డ్  
**Concepts**: మోడల్ ట్రైనింగ్, డిప్లాయ్‌మెంట్ పైప్‌లైన్స్, మానిటరింగ్

## 🛠 కాన్ఫిగరేషన్ ఉదాహరణలు

The `configurations/` directory contains reusable components:

### Environment Configurations
- డెవలప్‌మెంట్ ఎన్విరాన్‌మెంట్ సెట్టింగ్స్
- స్టేజింగ్ ఎన్విరాన్‌మెంట్ కాన్ఫిగరేషన్లు
- ప్రొడక్షన్-రెడీ కాన్ఫిగరేషన్లు
- బహు-రీజియన్ డిప్లాయ్‌మెంట్ సెటప్‌లు

### Bicep Modules
- మళ్లీ ఉపయోగించదగిన ఇన్ఫ్రాస్ట్రక్చర్ కాంపొనెంట్స్
- కామన్ రిసోర్స్ నమూనాలు
- సెక్యూరిటీ-హార్డెన్ చేయబడిన టెంప్లేట్స్
- ఖర్చు-ఆప్టిమైజ్డ్ కాన్ఫిగరేషన్లు

### Helper Scripts
- ఎన్విరాన్‌మెంట్ సెటప్ ఆటోమేషన్
- డేటాబేస్ మిగ్రేషన్ స్క్రిప్ట్స్
- డిప్లాయ్‌మెంట్ వాలిడేషన్ టూల్స్
- ఖర్చు మానిటరింగ్ యుటిలిటీస్

## 🔧 అనుకూలీకరణ గైడ్

### మీ వినియోగ కేస్ కోసం ఉదాహరణలను అనుకూలీకరించడం

1. **ముందస్తు అవసరాలను సమీక్షించండి**
   - Azure సేవ అవసరాలను తనిఖీ చేయండి
   - సబ్స్క్రిప్షన్ పరిమితుల్ని ధృవీకరించండి
   - ఖర్చుల ప్రభావాన్ని అర్థం చేసుకోండి

2. **కాన్ఫిగరేషన్ మార్చండి**
   - `azure.yaml` సర్వీస్ నిర్వచనాలను నవీకరించండి
   - Bicep టెంప్లేట్స్‌ను కస్టమైజ్ చేయండి
   - ఎన్విరాన్‌మెంట్ వేరియబుల్స్‌ను సర్దుబాటు చేయండి

3. **పూర్తిగా టెస్ట్ చేయండి**
   - మొదట డెవలప్‌మెంట్ ఎన్విరాన్‌మెంట్‌లో డిప్లాయ్ చేయండి
   - ఫంక్షనాలిటీ వాలిడేట్ చేయండి
   - స్కేలింగ్ మరియు పనితీరును పరీక్షించండి

4. **సెక్యూరిటీ సమీక్ష**
   - యాక్సెస్ కంట్రోల్స్‌ను సమీక్షించండి
   - సీక్రెట్ల్ మేనేజ్‌మెంట్ అమలు చేయండి
   - మానిటరింగ్ మరియు అలర్టింగ్ ఎనేబుల్ చేయండి

## 📊 పోలిక మ్యాట్రిక్స్

| Example | Services | Database | Auth | Monitoring | Complexity |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (Local) | 2 | ❌ | Key Vault | Full | ⭐⭐ |
| **Python Flask API** (Local) | 1 | ❌ | Basic | Full | ⭐ |
| **Microservices** (Local) | 5+ | ✅ | Enterprise | Advanced | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Basic | Basic | ⭐ |
| React SPA + Functions | 3 | ✅ | Basic | Full | ⭐ |
| Python Flask Container | 2 | ❌ | Basic | Full | ⭐ |
| C# Web API + SQL | 2 | ✅ | Full | Full | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Full | Full | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Full | Full | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | Full | Full | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Basic | Full | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Full | Full | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Local) | **8+** | **✅** | **Enterprise** | **Advanced** | **⭐⭐⭐⭐** |

## 🎓 నేర్చుకునే మార్గం

### సిఫార్సు క్రమం

1. **సింపుల్ వెబ్ యాప్‌తో ప్రారంభించండి**
   - ప్రాథమిక AZD కాన్సెప్ట్స్ నేర్చుకోండి
   - డిప్లాయ్‌మెంట్ వర్క్‌ఫ్లో అర్థం చేసుకోండి
   - ఎన్విరాన్‌మెంట్ నిర్వహణ ప్రాక్టీస్ చేయండి

2. **స్టాటిక్ వెబ్‌సైట్ ప్రయత్నించండి**
   - వివిధ హోస్టింగ్ ఎంపికలను అన్వేషించండి
   - CDN ఇంటిగ్రేషన్ గురించి తెలుసుకోండి
   - DNS కాన్ఫిగరేషన్ అర్థం చేసుకోండి

3. **కంటెయినర్ యాప్ వైపు వదలండి**
   - కంటెయినరైజేషన్ బేసిక్స్ నేర్చుకోండి
   - స్కేలింగ్ కాన్సెప్ట్స్ అర్థం చేసుకోండి
   - Docker తో ప్రాక్టీస్ చేయండి

4. **డేటాబేస్ ఇంటిగ్రేషన్ జోడించండి**
   - డేటాబేస్ ప్రొవిజనింగ్ నేర్చుకోండి
   - కనెక్షన్ స్ట్రింగ్స్ అర్థం చేసుకోండి
   - సీక్రెట్స్ మేనేజ్‌మెంట్ ప్రాక్టీస్ చేయండి

5. **సರ್ವర్‌లెస్‌ను అన్వేషించండి**
   - ఈవెంట్-డ్రివన్ ఆర్కిటెక్చర్ అర్థం చేసుకోండి
   - ట్రిగ్గర్స్ మరియు బైండింగ్స్ గురించి తెలుసుకోండి
   - APIs తో ప్రాక్టీస్ చేయండి

6. **మైక్రోసర్వీసస్ నిర్మించండి**
   - సర్వీస్ కమ్యూనికేషన్ నేర్చుకోండి
   - డిస్ట్రిబ్యూటెడ్ సిస్టమ్స్ అర్థం చేసుకోండి
   - సంక్లిష్ట డిప్లాయ్‌మెంట్స్‌తో ప్రాక్టీస్ చేయండి

## 🔍 సరైన ఉదాహరణను కనుగొనడం

### సాంకేతిక స్టాక్ ద్వారా
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

### ఆర్కిటెక్చర్ ప్యాటర్న్ ద్వారా
- **Simple REST API**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Local)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### సంక్లిష్టత స్థాయి ద్వారా
- **ప్రారంభ స్థాయి**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **మధ్యమ స్థాయి**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **అడ్వాన్స్‌డ్**: ML Pipeline
- **ఎంటర్‌ప్రైజ్ ప్రొడక్షన్-రెడీ**: [Microservices (Local)](../../../examples/container-app/microservices) (మెసేజ్ క్య్యూయింగ్‌తో మల్టీ-సర్వీస్), **Retail Multi-Agent Solution** (ARM టెంప్లేట్ డిప్లాయ్‌మెంట్‌తో పూర్తి మల్టీ-ఏజెంట్ సిస్టమ్)

## 📚 అదనపు వనరులు

### డాక్యుమెంటేషన్ లింక్స్
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
- [React Web App with C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions with Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### ఉత్తమ పద్ధతులు
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 ఉదాహరణలు అందించుటకు

ఉపయోగకరమైన ఉదాహరణ భాగస్వామ్యం చేయాలనుకుంటున్నారా? మేము భాగస్వామ్యాలను స్వాగతిస్తాం!

### సమర్పణ మార్గదర్శకాలు
1. స్థాపించబడిన డైరెక్టరీ నిర్మాణాన్ని అనుసరించండి
2. విస్తృత README.md ఫైల్‌ను చేర్చండి
3. కాన్ఫిగరేషన్ ఫైళ్లలో వ్యాఖ్యలు జోడించండి
4. సమర్పించడానికి ముందు సక్రమంగా పరీక్షించండి
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

**ప్రో చిట్కా**: మీ టెక్నాలజీ స్టాక్‌కు సరిపడే అత్యంత తక్కువ సంక్లిష్టత ఉన్న ఉదాహరణతో ప్రారంభించండి, ఆపై постепంగా క్లిష్టమైన పరిస్థితుల వైపు పోవండి. ప్రతి ఉదాహరణ పూర్వపు వాటి భావనలపై ఆధారపడి నిర్మించబడుతుంది!

## 🚀 ప్రారంభించడానికి సిద్ధంగా?

### మీ నేర్చుకునే మార్గం

1. **పూర్తిగా ప్రారంభకుడారా?** → ప్రారంభించండి [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 mins)
2. **ప్రాథమిక AZD జ్ఞానం ఉంది?** → ప్రయత్నించండి [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 mins)
3. **AI యాప్స్ నిర్మిస్తున్నారా?** → ప్రారంభించండి [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 mins) లేదా అన్వేషించండి [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ hours)
4. **నిర్దిష్ట టెక్ స్టాక్ కావాలా?** → పైలోని [Finding the Right Example](#-finding-the-right-example) విభాగాన్ని ఉపయోగించండి

### తరువాతి దశలు

- ✅ పైలోని [Prerequisites](#ముందస్తు-అవసరాలు) ను సమీక్షించండి
- ✅ మీ నైపుణ్య స్థాయికి సరిపోయే ఒక ఉదాహరణను ఎంచుకోండి (చూడండి [Complexity Legend](#క్లిష్టత-రేటింగ్-లెజెండ్))
- ✅ డిప్లాయ్ చేసే ముందు ఉదాహరణ యొక్క README ని పూర్వపాఠంగా చదవండి
- ✅ పరీక్ష తర్వాత `azd down` నడపాలని గుర్తుచేసుకోవడానికి రిమైండర్ సెట్చేయండి
- ✅ మీ అనుభవాన్ని GitHub Issues లేదా Discussions ద్వారా పంచుకోండి

### సహాయం కావాలి?

- 📖 [FAQ](../resources/faq.md) - సాధారణ ప్రశ్నలకు సమాధానాలు
- 🐛 [Troubleshooting Guide](../docs/chapter-07-troubleshooting/common-issues.md) - డిప్లాయ్‌మెంట్ సమస్యలను పరిష్కరించండి
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - సముదాయాన్ని అడగండి
- 📚 [Study Guide](../resources/study-guide.md) - మీ నేర్పకాన్ని బలోపేతం చేయండి

---

**నేవిగేషన్**
- **📚 కోర్సు హోమ్**: [AZD For Beginners](../README.md)
- **📖 అధ్యయన పదార్థాలు**: [Study Guide](../resources/study-guide.md) | [Cheat Sheet](../resources/cheat-sheet.md) | [Glossary](../resources/glossary.md)
- **🔧 వనరులు**: [FAQ](../resources/faq.md) | [Troubleshooting](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Last Updated: November 2025 | [Report Issues](https://github.com/microsoft/AZD-for-beginners/issues) | [Contribute Examples](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**డిస్క్లైమర్**:
ఈ పత్రం AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నించినప్పటికీ, ఆటోమేటెడ్ అనువాదాల్లో పొరపాట్లు లేదా తప్పు విషయాలు ఉండవచ్చని దయచేసి గమనించండి. మూల పత్రాన్ని దాని స్థానిక భాషలోనే అధికారిక మూలంగా పరిగణించాలి. అత్యంత కీలకమైన సమాచారానికి, వృత్తిపరమైన మానవ అనువాదాన్ని సిఫార్సు చేస్తాము. ఈ అనువాదాన్ని ఉపయోగించడం వల్ల ఏర్పడే ఏవైనా అవగాహనా లోపాలు లేదా అపార్థాల గురించి మేము బాధ్యులు కాదు.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->