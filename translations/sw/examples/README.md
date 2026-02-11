# Mifano - Violezo vya Kivitendo na Mipangilio ya AZD

**Kujifunza kwa Mfano - Imepangwa kwa Sura**
- **📚 Mwanzo wa Kozi**: [AZD Kwa Waanzilishi](../README.md)
- **📖 Ramani ya Sura**: Mifano imepangwa kwa ugumu wa kujifunza
- **🚀 Mfano wa Ndani**: [Suluhisho la Wakala Wengi la Rejareja](retail-scenario.md)
- **🤖 Mifano ya AI ya Nje**: Viungo kwenda kwenye hazina za Azure Samples

> **📍 MUHIMU: Mifano ya Ndani vs Mifano za Nje**  
> Hifadhi hii ina **mifano 4 kamili za ndani** zenye utekelezaji kamili:  
> - **Azure OpenAI Chat** (uwekaji GPT-4 wenye kiolesura cha mazungumzo)  
> - **Container Apps** (API rahisi ya Flask + Huduma ndogo ndogo)  
> - **Database App** (Tovuti + Hifadhidata ya SQL)  
> - **Retail Multi-Agent** (Suluhisho la AI la Kampuni)  
>   
> Mifano ya ziada ni marejeleo ya nje kwenye hazina za Azure-Samples ambazo unaweza kuziongeza kwa kloni.

## Utangulizi

Sarakali hii inatoa mifano ya vitendo na marejeleo kukusaidia kujifunza Azure Developer CLI kupitia mazoezi ya vitendo. Senario ya Retail Multi-Agent ni utekelezaji kamili, tayari kwa uzalishaji unaojumuishwa kwenye hifadhi hii. Mifano ya ziada inarejelea Azure Samples rasmi zinazotoa mifano tofauti ya AZD.

### Mwongozo wa Upimaji wa Ugumu

- ⭐ **Mwanzo** - Dhana za msingi, huduma moja, dakika 15-30  
- ⭐⭐ **Wastani** - Huduma nyingi, uunganishaji wa hifadhidata, dakika 30-60  
- ⭐⭐⭐ **Juu** - Miundo tata, kuingizwa kwa AI, 1-2 saa  
- ⭐⭐⭐⭐ **Mtaalamu** - Tayari kwa uzalishaji, mifumo ya shirika, 2+ saa

## 🎯 Kile Kinachopatikana Kwenye Hifadhi Hii

### ✅ Utekelezaji wa Ndani (Tayari Kutumika)

#### [Programu ya Mazungumzo ya Azure OpenAI](azure-openai-chat/README.md) 🆕
**Uwekaji kamili wa GPT-4 wenye kiolesura cha mazungumzo umejumuishwa katika hifadhi hii**

- **Mahali:** `examples/azure-openai-chat/`
- **Ugumu:** ⭐⭐ (Wastani)
- **Kile Kilichojumuishwa:**
  - Uwekaji kamili wa Azure OpenAI (GPT-4)
  - Kiolesura cha mazungumzo cha mstari wa amri cha Python
  - Uunganishaji na Key Vault kwa ajili ya funguo za API salama
  - Violezo vya miundombinu vya Bicep
  - Matumizi ya tokeni na ufuatiliaji wa gharama
  - Kuzuia kasi na kushughulikia makosa

**Anza Haraka:**
```bash
# Nenda kwenye mfano
cd examples/azure-openai-chat

# Sambaza kila kitu
azd up

# Sakinisha utegemezi na anza kuzungumza
pip install -r src/requirements.txt
python src/chat.py
```

**Teknolojia:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Mifano ya Container App](container-app/README.md) 🆕
**Mifano kamili ya uwekaji wa kontena imejumuishwa katika hifadhi hii**

- **Mahali:** `examples/container-app/`
- **Ugumu:** ⭐-⭐⭐⭐⭐ (Mwanzo hadi Mtaalamu)
- **Kile Kilichojumuishwa:**
  - [Mwongozo Mkuu](container-app/README.md) - Muhtasari kamili wa uwekaji wa kontena
  - [API Rahisi ya Flask](../../../examples/container-app/simple-flask-api) - Mfano wa msingi wa REST API
  - [Miundo ya Microservices](../../../examples/container-app/microservices) - Uwekaji wa huduma nyingi tayari kwa uzalishaji
  - Mifumo ya Anza Haraka, Uzalishaji, na Ngazi za Juu
  - Ufuatiliaji, usalama, na uboreshaji wa gharama

**Anza Haraka:**
```bash
# Tazama mwongozo mkuu
cd examples/container-app

# Sambaza API rahisi ya Flask
cd simple-flask-api
azd up

# Sambaza mfano wa huduma ndogo
cd ../microservices
azd up
```

**Teknolojia:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Suluhisho la Wakala Wengi la Rejareja](retail-scenario.md) 🆕
**Utekelezaji kamili tayari kwa uzalishaji umejumuishwa katika hifadhi hii**

- **Mahali:** `examples/retail-multiagent-arm-template/`
- **Ugumu:** ⭐⭐⭐⭐ (Juu)
- **Kile Kilichojumuishwa:**
  - Kiolezo kamili cha uwekaji ARM
  - Miundo ya wakala wengi (Mteja + Hesabu)
  - Uunganishaji wa Azure OpenAI
  - Utafutaji wa AI kwa RAG
  - Ufuatiliaji kamili
  - Skripti ya uwekaji kwa bonyeza moja

**Anza Haraka:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Teknolojia:** Azure OpenAI, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Mifano ya Azure ya Nje (Nakili ili Kutumia)

Mifano ifuatayo inadumishwa katika hazina rasmi za Azure-Samples. Kloni ili kuchunguza mifumo tofauti ya AZD:

### Programu Rahisi (Sura 1-2)

| Kiolezo | Repozitori | Ugumu | Huduma |
|:--------|:-----------|:------:|:-------|
| **API ya Python Flask** | [Ndani: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Huduma Ndogo Ndogo** | [Ndani: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Huduma nyingi, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Jinsi ya kutumia:**
```bash
# Nakili mfano wowote
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Sambaza
azd up
```

### Mifano ya Programu za AI (Sura 2, 5, 8)

| Kiolezo | Repozitori | Ugumu | Mwelekeo |
|:--------|:-----------|:------:|:---------|
| **Azure OpenAI Chat** | [Ndani: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | Uwekaji wa GPT-4 |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Mazungumzo ya AI ya msingi |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Mfumo wa wakala |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | Mfumo wa RAG |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | AI ya Kampuni |

### Hifadhidata & Mifumo ya Juu (Sura 3-8)

| Kiolezo | Repozitori | Ugumu | Mwelekeo |
|:--------|:-----------|:------:|:---------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Uunganishaji wa Hifadhidata |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Huduma nyingi |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Malengo ya Kujifunza

Kwa kufanya kazi kupitia mifano hii, utapata:
- Mazoezi ya mtiririko wa kazi wa Azure Developer CLI kwa hali halisi za programu
- Uelewa wa miundo tofauti ya programu na utekelezaji wao wa azd
- Utaalamu wa mifumo ya Infrastructure as Code kwa huduma mbalimbali za Azure
- Kuanzisha usimamizi wa usanidi na mikakati ya uwekaji kwa mazingira maalum
- Kutekeleza mifumo ya ufuatiliaji, usalama, na upanuaji katika muktadha wa vitendo
- Kujenga uzoefu wa utatuzi matatizo na uchambuzi wa uzalishaji kwa hali ya kutokea

## Matokeo ya Kujifunza

Baada ya kumaliza mifano hii, utaweza:
- Kutangaza aina mbalimbali za programu kwa kutumia Azure Developer CLI kwa ujasiri
- Kurekebisha violezo vilivyotolewa kwa mahitaji ya programu yako mwenyewe
- Kubuni na kutekeleza mifumo ya miundombinu maalum kwa kutumia Bicep
- Kusanidi programu za huduma nyingi zenye utegemezi sahihi
- Kutekeleza usalama, ufuatiliaji, na mbinu za utendaji bora katika hali halisi
- Kutatua matatizo na kuboresha uwekaji kulingana na uzoefu wa vitendo

## Muundo wa Saraka

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

## Mifano ya Anza Haraka

> **💡 Mpya kwa AZD?** Anza na mfano #1 (Flask API) - huchukua ~dakika 20 na hufundisha dhana za msingi.

### Kwa Waanzilishi
1. **[Container App - API ya Python Flask](../../../examples/container-app/simple-flask-api)** (Ndani) ⭐  
   Weka API rahisi ya REST yenye scale-to-zero  
   **Muda:** 20-25 dakika | **Gharama:** $0-5/mwezi  
   **Utajifunza:** Mtiririko wa kazi wa azd, containerization, vipimo vya afya  
   **Matokeo Yanayotarajiwa:** Mwisho wa API unaofanya kazi unaorejesha "Hello, World!" na ufuatiliaji

2. **[Tovuti Rahisi - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Weka programu ya wavuti ya Node.js Express na MongoDB  
   **Muda:** 25-35 dakika | **Gharama:** $10-30/mwezi  
   **Utajifunza:** Uunganishaji wa hifadhidata, vigezo vya mazingira, mnyororo wa muunganisho  
   **Matokeo Yanayotarajiwa:** Programu ya orodha ya kazi yenye uwezo wa kuunda/kuona/kusasisha/kufuta

3. **[Tovuti Tulivu - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Host wavuti tulivu ya React kwa Azure Static Web Apps  
   **Muda:** 20-30 dakika | **Gharama:** $0-10/mwezi  
   **Utajifunza:** Kupangilia mwenyeji tulivu, functions zisizo za seva, uenezaji wa CDN  
   **Matokeo Yanayotarajiwa:** UI ya React yenye backend ya API, SSL moja kwa moja, CDN ya kimataifa

### Kwa Watumiaji wa Kati
4. **[Programu ya Mazungumzo ya Azure OpenAI](../../../examples/azure-openai-chat)** (Ndani) ⭐⭐  
   Weka GPT-4 na kiolesura cha mazungumzo na usimamizi salama wa funguo za API  
   **Muda:** 35-45 dakika | **Gharama:** $50-200/mwezi  
   **Utajifunza:** Uwekaji wa Azure OpenAI, uunganishaji wa Key Vault, ufuatiliaji wa tokeni  
   **Matokeo Yanayotarajiwa:** Programu ya mazungumzo inayofanya kazi na GPT-4 na ufuatiliaji wa gharama

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Ndani) ⭐⭐⭐⭐  
   Miundo ya huduma nyingi tayari kwa uzalishaji  
   **Muda:** 45-60 dakika | **Gharama:** $50-150/mwezi  
   **Utajifunza:** Mawasiliano ya huduma, foleni za ujumbe, ufuatiliaji wa mgawanyiko  
   **Matokeo Yanayotarajiwa:** Mfumo wa huduma 2 (API Gateway + Huduma ya Bidhaa) yenye ufuatiliaji

6. **[Database App - C# na Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Programu ya wavuti na API ya C# na Azure SQL Database  
   **Muda:** 30-45 dakika | **Gharama:** $20-80/mwezi  
   **Utajifunza:** Entity Framework, uhamisho wa skima, usalama wa mnyororo wa muunganisho  
   **Matokeo Yanayotarajiwa:** API ya C# na backend ya Azure SQL, utekelezaji wa skima kiotomatiki

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions zenye vichocheo vya HTTP na Cosmos DB  
   **Muda:** 30-40 dakika | **Gharama:** $10-40/mwezi  
   **Utajifunza:** Miundo inayotegemea matukio, upanuaji wa serverless, uunganishaji wa NoSQL  
   **Matokeo Yanayotarajiwa:** Function app inayojibu ombi za HTTP na kuhifadhi Cosmos DB

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Programu ya huduma nyingi ya Java na Container Apps na API gateway  
   **Muda:** 60-90 dakika | **Gharama:** $80-200/mwezi  
   **Utajifunza:** Uwekaji wa Spring Boot, service mesh, kusawazisha mzigo  
   **Matokeo Yanayotarajiwa:** Mfumo wa huduma nyingi wa Java mwenye uvumbuzi wa huduma na routing

### Violezo vya Microsoft Foundry

1. **[Azure OpenAI Chat App - Mfano wa Ndani](../../../examples/azure-openai-chat)** ⭐⭐  
   Uwekaji kamili wa GPT-4 wenye kiolesura cha mazungumzo  
   **Muda:** 35-45 dakika | **Gharama:** $50-200/mwezi  
   **Matokeo Yanayotarajiwa:** Programu ya mazungumzo inayofanya kazi yenye ufuatiliaji wa tokeni na gharama

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Programu ya mazungumzo yenye akili kwa muundo wa RAG  
   **Muda:** 60-90 dakika | **Gharama:** $100-300/mwezi  
   **Matokeo Yanayotarajiwa:** Kiolesura cha mazungumzo cha RAG kinachotumia utafutaji wa nyaraka na marejeleo

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Uchambuzi wa nyaraka ukitumia huduma za Azure AI  
   **Muda:** 40-60 dakika | **Gharama:** $20-80/mwezi  
   **Matokeo Yanayotarajiwa:** API inayochambua maandishi, meza, na vitu kutoka kwa nyaraka zilizopakiwa

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Mtiririko wa MLOps kwa Azure Machine Learning  
   **Muda:** 2-3 saa | **Gharama:** $150-500/mwezi  
   **Matokeo Yanayotarajiwa:** Mtiririko wa ML uliosimamiwa kiotomatiki pamoja na mafunzo, uwekaji, na ufuatiliaji

### Senario za Duniani Halisi

#### **Suluhisho la Wakala Wengi la Rejareja** 🆕  
**[Mwongozo Kamili wa Utekelezaji](./retail-scenario.md)**

Suluhisho kamili, tayari kwa uzalishaji la msaada kwa wateja linalotumia wakala wengi ambalo linaonyesha uwekaji wa programu za AI kwa kiwango cha shirika kwa kutumia AZD. Senario hii inatoa:

- **Miundo Kamili**: Mfumo wa wakala wengi wenye mawakala maalum wa huduma kwa wateja na usimamizi wa hesabu
- **Miundombinu ya Uzalishaji**: Utekelezaji wa Azure OpenAI katika maeneo mengi, Azure AI Search, Container Apps, na ufuatiliaji mpana
- **Tempeleti ya ARM Tayari kwa Utekelezaji**: Utekelezaji kwa bonyeza moja na modi nyingi za usanidi (Minimal/Standard/Premium)
- **Vipengele vya Juu**: Ukaguzi wa usalama wa red teaming, mfumo wa tathmini wa mawakala, uboreshaji wa gharama, na miongozo ya utatuzi wa matatizo
- **Muktadha Halisi wa Biashara**: Mfano wa huduma kwa wateja wa muuzaji rejareja na upakiaji wa faili, ujumuishaji wa utafutaji, na upanuzi wa rasilimali unaobadilika

**Teknolojia**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Ugumu**: ⭐⭐⭐⭐ (Cha Juu - Tayari kwa Uzalishaji wa Kampuni)

**Inafaa kwa**: Waendelezaji wa AI, wabunifu wa suluhisho, na timu zinazojenga mifumo ya mawakala wengi kwa uzalishaji

**Anza Haraka**: Tekeleza suluhisho kamili ndani ya chini ya dakika 30 ukitumia templeti ya ARM iliyojumuishwa na `./deploy.sh -g myResourceGroup`

## 📋 Maelekezo ya Matumizi

### Masharti ya Awali

Kabla ya kuendesha mfano wowote:
- ✅ Usajili wa Azure ukiwa na ruhusa ya Owner au Contributor
- ✅ Azure Developer CLI imewekwa ([Mwongozo wa Usakinishaji](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop inaendeshwa (kwa mifano ya container)
- ✅ Mipaka inayofaa ya Azure (angalia mahitaji maalum ya mfano)

> **💰 Onyo la Gharama:** Mifano yote inaunda rasilimali halisi za Azure ambazo husababisha malipo. Angalia mafaili ya README ya kila mfano kwa makadirio ya gharama. Kumbuka kuendesha `azd down` ukimaliza ili kuepuka gharama zinazodumu.

### Kuendesha Mifano Mlokalini

1. **Nakili au Kloni Mfano**
   ```bash
   # Nenda kwenye mfano unaotaka
   cd examples/simple-web-app
   ```

2. **Anzisha Mazingira ya AZD**
   ```bash
   # Anzisha kwa kutumia kiolezo kilichopo
   azd init
   
   # Au unda mazingira mapya
   azd env new my-environment
   ```

3. **Sanidi Mazingira**
   ```bash
   # Weka vigezo vinavyohitajika
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Tekeleza**
   ```bash
   # Sambaza miundombinu na programu
   azd up
   ```

5. **Thibitisha Utekelezaji**
   ```bash
   # Pata anwani za huduma
   azd env get-values
   
   # Jaribu kiunganishi (mfano)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Viashiria vinavyotarajiwa vya Mafanikio:**
   - ✅ `azd up` inakamilika bila makosa
   - ✅ Endpoint ya huduma inarudisha HTTP 200
   - ✅ Azure Portal inaonyesha hali "Running"
   - ✅ Application Insights inapata telemetry

> **⚠️ Matatizo?** Angalia [Matatizo ya Kawaida](../docs/chapter-07-troubleshooting/common-issues.md) kwa utatuzi wa matatizo ya utekelezaji

### Kubadilisha Mifano

Kila mfano unajumuisha:
- **README.md** - Maelekezo ya kina ya usanidi na ubinafsishaji
- **azure.yaml** - usanidi wa AZD wenye maoni
- **infra/** - Templates za Bicep zenye maelezo ya vigezo
- **src/** - Msimbo wa mfano wa programu
- **scripts/** - Skripti za kusaidia kwa kazi za kawaida

## 🎯 Malengo ya Kujifunza

### Aina za Mifano

#### **Utekelezaji Msingi**
- Programu za huduma moja
- Mifumo rahisi ya miundombinu
- Usimamizi wa usanidi wa msingi
- Mipangilio ya maendeleo yenye gharama nafuu

#### **Mazingira ya Juu**
- Miundo yenye huduma nyingi
- Usanidi tata wa mitandao
- Mifumo ya ujumuishaji wa hifadhidata
- Utekelezaji wa usalama na uzingativu

#### **Mifumo Tayari kwa Uzalishaji**
- Usanidi wa upatikanaji wa juu
- Ufuatiliaji na uonekana
- Ujumuishaji wa CI/CD
- Mipangilio ya urejeshaji baada ya maafa

## 📖 Maelezo ya Mifano

### Simple Web App - Node.js Express
**Teknolojia**: Node.js, Express, MongoDB, Container Apps  
**Ugumu**: Mwanzo  
**Dhana**: Utekelezaji wa msingi, REST API, ujumuishaji wa hifadhidata NoSQL

### Static Website - React SPA
**Teknolojia**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Ugumu**: Mwanzo  
**Dhana**: Uwekaji tovuti wa static, backend ya serverless, maendeleo ya wavuti ya kisasa

### Container App - Python Flask
**Teknolojia**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Ugumu**: Mwanzo  
**Dhana**: Uwekaji kwenye container, REST API, scale-to-zero, health probes, ufuatiliaji  
**Mahali**: [Mfano Mlokalini](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**Teknolojia**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Ugumu**: Cha Juu  
**Dhana**: Miundo ya huduma nyingi, mawasiliano ya huduma, queuing ya ujumbe, tracing iliyosambazwa  
**Mahali**: [Mfano Mlokalini](../../../examples/container-app/microservices)

### Database App - C# with Azure SQL
**Teknolojia**: C# ASP.NET Core, Azure SQL Database, App Service  
**Ugumu**: Wastani  
**Dhana**: Entity Framework, muunganisho wa hifadhidata, maendeleo ya web API

### Serverless Function - Python Azure Functions
**Teknolojia**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Ugumu**: Wastani  
**Dhana**: Muundo unaoendeshwa na matukio, kompyuta isiyo ya seva, maendeleo kamili-za-stack

### Microservices - Java Spring Boot
**Teknolojia**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Ugumu**: Wastani  
**Dhana**: Mawasiliano ya microservices, mifumo iliyosambazwa, mifano ya kibiashara

### Microsoft Foundry Examples

#### Azure OpenAI Chat App
**Teknolojia**: Azure OpenAI, Cognitive Search, App Service  
**Ugumu**: Wastani  
**Dhana**: Usaidizi wa RAG, utafutaji wa vector, ujumuishaji wa LLM

#### AI Document Processing
**Teknolojia**: Azure AI Document Intelligence, Storage, Functions  
**Ugumu**: Wastani  
**Dhana**: Uchambuzi wa nyaraka, OCR, uondoaji wa data

#### Machine Learning Pipeline
**Teknolojia**: Azure ML, MLOps, Container Registry  
**Ugumu**: Cha Juu  
**Dhana**: Mafunzo ya modeli, pipelines za utekelezaji, ufuatiliaji

## 🛠 Mifano ya Usanidi

Katalogi ya `configurations/` inajumuisha vipengele vinavyoweza kutumika tena:

### Usanidi wa Mazingira
- Mipangilio ya mazingira ya maendeleo
- Usanidi wa mazingira ya staging
- Usanidi tayari kwa uzalishaji
- Mipangilio ya utekelezaji katika maeneo mengi

### Moduli za Bicep
- Vipengele vya miundombinu vinavyoweza kutumika tena
- Mifano ya rasilimali ya kawaida
- Templeti zilizoimarishwa kwa usalama
- Usanidi ulioboreshwa kwa gharama

### Skripti za Msaada
- Uendeshaji wa otomatiki wa usanidi wa mazingira
- Skripti za uhamishaji wa hifadhidata
- Vifaa vya uthibitishaji wa utekelezaji
- Zana za ufuatiliaji wa gharama

## 🔧 Mwongozo wa Ubinafsishaji

### Kubadilisha Mifano kwa Matumizi Yako

1. **Pitia Masharti ya Awali**
   - Angalia mahitaji ya huduma za Azure
   - Thibitisha mipaka ya usajili
   - Fahamu athari za gharama

2. **Boresha Usanidi**
   - Sasisha ufafanuzi wa huduma kwenye `azure.yaml`
   - Binafsisha templeti za Bicep
   - Rekebisha vigezo vya mazingira

3. **Jaribu Kwa Kina**
   - Tekeleza kwa mazingira ya maendeleo kwanza
   - Thibitisha utendakazi
   - Jaribu upanuzi na utendaji

4. **Mapitio ya Usalama**
   - Pitia udhibiti wa upatikanaji
   - Tekeleza usimamizi wa siri
   - Washa ufuatiliaji na arifu

## 📊 Matrisi ya Ulinganisho

| Mfano | Huduma | Hifadhidata | Uthibitisho | Ufuatiliaji | Ugumu |
|---------|----------|----------|------|------------|------------|
| **Azure OpenAI Chat** (Mlokalini) | 2 | ❌ | Key Vault | Kamili | ⭐⭐ |
| **Python Flask API** (Mlokalini) | 1 | ❌ | Msingi | Kamili | ⭐ |
| **Microservices** (Mlokalini) | 5+ | ✅ | Enterprise | Cha Juu | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Msingi | Msingi | ⭐ |
| React SPA + Functions | 3 | ✅ | Msingi | Kamili | ⭐ |
| Python Flask Container | 2 | ❌ | Msingi | Kamili | ⭐ |
| C# Web API + SQL | 2 | ✅ | Kamili | Kamili | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Kamili | Kamili | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Kamili | Kamili | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Kamili | Kamili | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Msingi | Kamili | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Kamili | Kamili | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Mlokalini) | **8+** | **✅** | **Enterprise** | **Cha Juu** | **⭐⭐⭐⭐** |

## 🎓 Njia ya Kujifunza

### Mfululizo Unaopendekezwa

1. **Anza na Simple Web App**
   - Jifunze dhana za msingi za AZD
   - Elewa mtiririko wa utekelezaji
   - Fanya mazoezi ya usimamizi wa mazingira

2. **Jaribu Static Website**
   - Chunguza chaguzi tofauti za hosting
   - Jifunze kuhusu ujumuishaji wa CDN
   - Elewa usanidi wa DNS

3. **Hamia kwa Container App**
   - Jifunze misingi ya containerization
   - Elewa dhana za upanuzi
   - Fanya mazoezi na Docker

4. **Ongeza Ujumuishaji wa Hifadhidata**
   - Jifunze kuhusu utoaji wa hifadhidata
   - Elewa connection strings
   - Fanya mazoezi ya usimamizi wa siri

5. **Chunguza Serverless**
   - Elewa muundo unaoendeshwa na matukio
   - Jifunze kuhusu triggers na bindings
   - Fanya mazoezi na APIs

6. **Jenga Microservices**
   - Jifunze mawasiliano ya huduma
   - Elewa mifumo iliyosambazwa
   - Fanya mazoezi ya utekelezaji tata

## 🔍 Kupata Mfano Sahihi

### Kulingana na Stack ya Teknolojia
- **Container Apps**: [Python Flask API (Mlokalini)](../../../examples/container-app/simple-flask-api), [Microservices (Mlokalini)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Mlokalini)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Mlokalini)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Mlokalini)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Mlokalini)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Go**: [Microservices User Service (Mlokalini)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Mlokalini)](../../../examples/container-app/simple-flask-api), [Microservices (Mlokalini)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (Mlokalini)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Azure OpenAI Chat (Mlokalini)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Azure OpenAI Chat (Mlokalini)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (Mlokalini)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Kulingana na Mfano wa Usaidizi
- **Simple REST API**: [Python Flask API (Mlokalini)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Mlokalini)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (Mlokalini)](../../../examples/container-app/simple-flask-api), [Microservices (Mlokalini)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Azure OpenAI Chat (Mlokalini)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (Mlokalini)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Kulingana na Kiwango cha Ugumu
- **Mwanzo**: [Python Flask API (Mlokalini)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Wastani**: **[Azure OpenAI Chat (Mlokalini)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Cha Juu**: ML Pipeline
- **Tayari kwa Uzalishaji wa Kampuni**: [Microservices (Mlokalini)](../../../examples/container-app/microservices) (Huduma nyingi na queuing ya ujumbe), **Retail Multi-Agent Solution** (Mfumo kamili wa mawakala wengi na templeti ya ARM kwa utekelezaji)

## 📚 Rasilimali Zaidi

### Viungo vya Nyaraka
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Mifano ya Jamii
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Programu ya Todo na Node.js na PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [Web App ya React na API ya C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Kazi ya Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions na Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Mbinu Bora
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Kuchangia Mifano

Una mfano mzuri wa kushiriki? Tunakaribisha michango!

### Miongozo ya Kuwasilisha
1. Fuata muundo uliowekwa wa saraka
2. Jumuisha README.md kamili
3. Ongeza maoni kwenye faili za usanidi
4. Jaribu kwa kina kabla ya kuwasilisha
5. Jumuisha makadirio ya gharama na mahitaji ya awali

### Muundo wa Kiolezo cha Mfano
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

**Ushauri wa Pro**: Anza na mfano rahisi unaolingana na stack yako ya teknolojia, kisha pole pole jenga hadi kwa matukio magumu zaidi. Kila mfano unajenga juu ya dhana kutoka kwa mfano uliotangulia!

## 🚀 Tayari kuanza?

### Njia Yako ya Kujifunza

1. **Mwanzo kabisa?** → Anza na [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 dakika)
2. **Una Ujuzi wa Msingi wa AZD?** → Jaribu [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 dakika)
3. **Unajenga Programu za AI?** → Anza na [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 dakika) au chunguza [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, zaidi ya saa 2)
4. **Unahitaji stack maalum la teknolojia?** → Tumia sehemu ya [Kupata Mfano Sahihi](../../../examples) hapo juu

### Hatua Zifuatazo

- ✅ Kagua [Masharti ya awali](../../../examples) hapo juu
- ✅ Chagua mfano unaolingana na kiwango chako cha ujuzi (angalia [Legenda ya Ugumu](../../../examples))
- ✅ Soma README ya mfano kwa makini kabla ya kupeleka
- ✅ Weka ukumbusho wa kuendesha `azd down` baada ya kujaribu
- ✅ Shirikisha uzoefu wako kupitia GitHub Issues au Discussions

### Unahitaji Msaada?

- 📖 [Maswali Yanayoulizwa Mara kwa Mara](../resources/faq.md) - Maswali ya kawaida yaliyojibiwa
- 🐛 [Mwongozo wa Utatuzi wa Matatizo](../docs/chapter-07-troubleshooting/common-issues.md) - Rekebisha matatizo ya kupeleka
- 💬 [Majadiliano ya GitHub](https://github.com/microsoft/AZD-for-beginners/discussions) - Uliza jamii
- 📚 [Mwongozo wa Kusoma](../resources/study-guide.md) - Thibitisha unachojifunza

---

**Uvinjari**
- **📚 Nyumbani kwa Kozi**: [AZD For Beginners](../README.md)
- **📖 Vifaa vya Kujifunzia**: [Mwongozo wa Kusoma](../resources/study-guide.md) | [Muhtasari wa Mbinu](../resources/cheat-sheet.md) | [Kamusi](../resources/glossary.md)
- **🔧 Rasilimali**: [Maswali Yanayoulizwa Mara kwa Mara](../resources/faq.md) | [Utatuzi wa Matatizo](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Imesasishwa: Novemba 2025 | [Ripoti Matatizo](https://github.com/microsoft/AZD-for-beginners/issues) | [Changia Mifano](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Taarifa ya kutokuwa na dhamana:
Nyaraka hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI (Co-op Translator: https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kwa usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upotofu. Nyaraka ya asili katika lugha yake ya asili inapaswa kuchukuliwa kama chanzo rasmi. Kwa taarifa muhimu, tafsiri ya kitaalamu kwa mtafsiri wa binadamu inapendekezwa. Hatuwajibiki kwa kutokuelewana au tafsiri zisizo sahihi zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->