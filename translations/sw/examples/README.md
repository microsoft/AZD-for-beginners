# Mifano - Templates na Usanidi wa AZD kwa Vitendo

**Kujifunza kwa Mifano - Imepangwa kwa Sura**
- **📚 Nyumbani kwa Kozi**: [AZD kwa Waanzilishi](../README.md)
- **📖 Ramani ya Sura**: Mifano iliyopangwa kwa ugumu wa kujifunza
- **🚀 Mfano wa Ndani**: [Suluhisho la Wakala Wingi wa Rejareja](retail-scenario.md)
- **🤖 Mifano ya AI ya Nje**: Viungo kwa hifadhi za Azure-Samples

> **📍 MUHIMU: Mifano za Ndani dhidi ya Nje**  
> Hifadhi hii ina **mifano 4 kamili za ndani** zenye utekelezaji kamili:  
> - **Microsoft Foundry Models Chat** (ugawaji gpt-4.1 na kiolesura cha mazungumzo)  
> - **Container Apps** (API rahisi ya Flask + microservices)  
> - **Database App** (Tovuti + Hifadhidata ya SQL)  
> - **Retail Multi-Agent** (Suluhisho la AI kwa Kampuni)  
>  
> Mifano nyingine ni **marejeleo ya nje** kwa hifadhi za Azure-Samples ambazo unaweza kuzikopa (clone).

## Utangulizi

Sarakani hii inatoa mifano ya vitendo na marejeleo yatakayokusaidia kujifunza Azure Developer CLI kupitia mazoezi ya vitendo. Muktadha wa Retail Multi-Agent ni utekelezaji kamili, tayari kwa uzalishaji, uliowekwa katika hifadhi hii. Mifano ya ziada inarejelea Azure Samples rasmi ambazo zinaonyesha mifano mbalimbali ya AZD.

### Maelezo ya Viwango vya Ugumu

- ⭐ **Msingi** - Dhana za msingi, huduma moja, 15-30 dakika
- ⭐⭐ **Wastani** - Huduma nyingi, ujumuishaji wa hifadhidata, 30-60 dakika
- ⭐⭐⭐ **Juu** - Miundombinu tata, ujumuishaji wa AI, 1-2 saa
- ⭐⭐⭐⭐ **Mtaalamu** - Tayari kwa uzalishaji, mifumo ya kampuni, 2+ saa

## 🎯 Kile Kilicho Katika Hifadhi Hii

### ✅ Utekelezaji wa Ndani (Tayari Kutumika)

#### [Programu ya Mazungumzo ya Microsoft Foundry Models](azure-openai-chat/README.md) 🆕
**Utekelezaji kamili wa gpt-4.1 pamoja na kiolesura cha mazungumzo umejumuishwa katika hifadhi hii**

- **Mahali:** `examples/azure-openai-chat/`
- **Ugumu:** ⭐⭐ (Wastani)
- **Kinachojumuishwa:**
  - Utekelezaji kamili wa Microsoft Foundry Models (gpt-4.1)
  - Kiolesura cha mazungumzo kwa mstari wa amri cha Python
  - Uunganisho na Key Vault kwa ajili ya ufunguo salama wa API
  - Templates za miundombinu za Bicep
  - Matumizi ya tokeni na ufuatiliaji wa gharama
  - Kudhibiti kiwango na kushughulikia makosa

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

**Teknolojia:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Mifano za Container Apps](container-app/README.md) 🆕
**Mifano kamili za uenezaji wa kontena zimo katika hifadhi hii**

- **Mahali:** `examples/container-app/`
- **Ugumu:** ⭐-⭐⭐⭐⭐ (Kuanzia Msingi hadi Mtaalamu)
- **Kinachojumuishwa:**
  - [Mwongozo Mkuu](container-app/README.md) - Muhtasari kamili wa utoaji wa kontena
  - [API Rahisi ya Flask](../../../examples/container-app/simple-flask-api) - Mfano wa API ya REST ya msingi
  - [Miundo ya Microservices](../../../examples/container-app/microservices) - Uenezaji wa huduma nyingi tayari kwa uzalishaji
  - Anza Haraka, Mifumo ya Uzalishaji, na Mifumo ya Juu
  - Ufuatiliaji, usalama, na uboreshaji wa gharama

**Anza Haraka:**
```bash
# Tazama mwongozo mkuu
cd examples/container-app

# Sambaza API rahisi ya Flask
cd simple-flask-api
azd up

# Sambaza mfano wa microservices
cd ../microservices
azd up
```

**Teknolojia:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Suluhisho la Wakala Wingi wa Rejareja](retail-scenario.md) 🆕
**Utekelezaji kamili tayari kwa uzalishaji umejumuishwa katika hifadhi hii**

- **Mahali:** `examples/retail-multiagent-arm-template/`
- **Ugumu:** ⭐⭐⭐⭐ (Juu)
- **Kinachojumuishwa:**
  - Template kamili ya utoaji wa ARM
  - Miundo ya mawakala wengi (Mteja + Usimamizi wa Zaliha)
  - Uunganisho na Microsoft Foundry Models
  - Utafutaji wa AI kwa kutumia RAG
  - Ufuatiliaji mpana
  - Skripti ya utoaji kwa bonyeza moja

**Anza Haraka:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Teknolojia:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Mifano ya Azure ya Nje (Klonia ili Kutumia)

Mifano ifuatayo imedumishwa katika hifadhi rasmi za Azure-Samples. Ziklonia ili kuchunguza mifano tofauti ya AZD:

### Programu Rahisi (Sura 1-2)

| Mfano | Hazina | Ugumu | Huduma |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Ndani: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Ndani: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Huduma nyingi, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Jinsi ya kutumia:**
```bash
# Nakili mfano wowote
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Zindua
azd up
```

### Mifano ya Programu za AI (Sura 2, 5, 8)

| Mfano | Hazina | Ugumu | Mwelekeo |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [Ndani: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | ugawaji gpt-4.1 |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Mazungumzo ya AI ya msingi |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Mfumo wa maajenti |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | muundo wa RAG |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | AI ya Kampuni |

### Hifadhidata na Mifumo ya Kuendeleza (Sura 3-8)

| Mfano | Hazina | Ugumu | Mwelekeo |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Ujumuishaji wa hifadhidata |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL isiyo na seva |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Huduma nyingi |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Malengo ya Kujifunza

Kwa kufanya kazi kupitia mifano hii, utafanya:
- Mazoezi ya mtiririko wa kazi wa Azure Developer CLI kwa matukio ya programu ya kweli
- Kuelewa miundo tofauti ya programu na utekelezaji wao wa azd
- Kumaliza mifumo ya Infrastructure as Code kwa huduma mbalimbali za Azure
- Kutumia usimamizi wa usanidi na mikakati ya utoaji kwa mazingira maalum
- Kutekeleza mifumo ya ufuatiliaji, usalama, na upanuaji katika muktadha wa vitendo
- Kujenga uzoefu wa kutatua matatizo na kutatua kasoro za hali halisi za utoaji

## Matokeo ya Kujifunza

Baada ya kumaliza mifano hii, utaweza:
- Kutoa aina mbalimbali za programu kwa kutumia Azure Developer CLI kwa kujiamini
- Kurekebisha templates zilizotolewa kwa mahitaji ya programu yako mwenyewe
- Kubuni na kutekeleza mifumo ya miundombinu maalum kwa kutumia Bicep
- Kusanidi programu tata za huduma nyingi na utegemezi sahihi
- Kutumia mbinu bora za usalama, ufuatiliaji, na utendaji katika mazingira halisi
- Kutatua matatizo na kuboresha utoaji kulingana na uzoefu wa vitendo

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

> **💡 Mpya kwa AZD?** Anza na mfano #1 (Flask API) - inachukua takriban dakika 20 na inafundisha dhana kuu.

### Kwa Waanzilishi
1. **[Programu ya Container - Python Flask API](../../../examples/container-app/simple-flask-api)** (Ndani) ⭐  
   Weka API rahisi ya REST inayoweza kupunguzwa hadi sifuri  
   **Muda:** 20-25 dakika | **Gharama:** $0-5/month  
   **Utajifunza:** Mtiririko wa msingi wa azd, containerization, health probes  
   **Matokeo Yanayotarajiwa:** Kiungo cha API kinachofanya kazi kinachorejesha "Hello, World!" na ufuatiliaji

2. **[Programu Rahisi ya Wavuti - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Weka programu ya wavuti ya Node.js Express na MongoDB  
   **Muda:** 25-35 dakika | **Gharama:** $10-30/month  
   **Utajifunza:** Ujumuishaji wa hifadhidata, vigezo vya mazingira, mikoa ya muunganisho  
   **Matokeo Yanayotarajiwa:** Programu ya orodha ya kazi (Todo) yenye uwezo wa kuunda/kusoma/kuboresha/kufuta

3. **[Tovuti ya Kistatiki - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Hifadhi tovuti ya React kistatiki na Azure Static Web Apps  
   **Muda:** 20-30 dakika | **Gharama:** $0-10/month  
   **Utajifunza:** Ukarabati wa kustaata, kazi za serverless, utoaji wa CDN  
   **Matokeo Yanayotarajiwa:** UI ya React yenye backend ya API, SSL otomatiki, CDN ya kimataifa

### Kwa Watumiaji Wastani
4. **[Programu ya Mazungumzo ya Microsoft Foundry Models](../../../examples/azure-openai-chat)** (Ndani) ⭐⭐  
   Weka gpt-4.1 na kiolesura cha mazungumzo na usimamizi salama wa ufunguo wa API  
   **Muda:** 35-45 dakika | **Gharama:** $50-200/month  
   **Utajifunza:** Utekelezaji wa Microsoft Foundry Models, uunganisho wa Key Vault, ufuatiliaji wa tokeni  
   **Matokeo Yanayotarajiwa:** Programu ya mazungumzo inayofanya kazi na gpt-4.1 na ufuatiliaji wa gharama

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Ndani) ⭐⭐⭐⭐  
   Miundo ya huduma nyingi tayari kwa uzalishaji  
   **Muda:** 45-60 dakika | **Gharama:** $50-150/month  
   **Utajifunza:** Mawasiliano ya huduma, kupanga ujumbe, ufuatiliaji uliosambazwa  
   **Matokeo Yanayotarajiwa:** Mfumo wa huduma 2 (API Gateway + Huduma ya Bidhaa) na ufuatiliaji

6. **[Database App - C# na Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Programu ya wavuti yenye API ya C# na Azure SQL Database  
   **Muda:** 30-45 dakika | **Gharama:** $20-80/month  
   **Utajifunza:** Entity Framework, uhamisho wa hifadhidata, usalama wa muunganisho  
   **Matokeo Yanayotarajiwa:** API ya C# yenye backend ya Azure SQL, utekelezaji otomatiki wa skima

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions yenye vichocheo vya HTTP na Cosmos DB  
   **Muda:** 30-40 dakika | **Gharama:** $10-40/month  
   **Utajifunza:** Miundo ya kuendeshwa kwa matukio, upanuaji wa serverless, ujumuishaji wa NoSQL  
   **Matokeo Yanayotarajiwa:** Programu ya kazi inayojibu ombi za HTTP na kuhifadhi Cosmos DB

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Programu ya huduma nyingi ya Java yenye Container Apps na api gateway  
   **Muda:** 60-90 dakika | **Gharama:** $80-200/month  
   **Utajifunza:** Utekelezaji wa Spring Boot, service mesh, usawazishaji wa mzigo  
   **Matokeo Yanayotarajiwa:** Mfumo wa huduma nyingi wa Java wenye ugunduzi wa huduma na routing

### Templates za Microsoft Foundry

1. **[Microsoft Foundry Models Chat App - Mfano wa Ndani](../../../examples/azure-openai-chat)** ⭐⭐  
   Utekelezaji kamili wa gpt-4.1 pamoja na kiolesura cha mazungumzo  
   **Muda:** 35-45 dakika | **Gharama:** $50-200/month  
   **Matokeo Yanayotarajiwa:** Programu ya mazungumzo inayofanya kazi na ufuatiliaji wa tokeni na gharama

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Programu ya mazungumzo yenye akili na muundo wa RAG  
   **Muda:** 60-90 dakika | **Gharama:** $100-300/month  
   **Matokeo Yanayotarajiwa:** Kiolesura cha mazungumzo kinachotumia RAG na utafutaji wa nyaraka na marejeo

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Uchambuzi wa nyaraka kwa kutumia huduma za Azure AI  
   **Muda:** 40-60 dakika | **Gharama:** $20-80/month  
   **Matokeo Yanayotarajiwa:** API inayochambua maandishi, meza, na vyombo kutoka kwa nyaraka zilizopakiwa

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Mtiririko wa MLOps na Azure Machine Learning  
   **Muda:** 2-3 saa | **Gharama:** $150-500/month  
   **Matokeo Yanayotarajiwa:** Mtiririko wa ML otomatiki wenye mafunzo, utoaji, na ufuatiliaji

### Mifano ya Uhalisia

#### **Suluhisho la Wakala Wingi wa Rejareja** 🆕
**[Mwongozo wa Utekelezaji Kamili](./retail-scenario.md)**

Suluhisho kamili, tayari kwa uzalishaji la msaada wa wateja lenye mawakala wengi linaloonyesha utoaji wa programu za AI kwa kiwango cha kampuni kwa kutumia AZD. Muktadha huu unatoa:

- **Ujenzi Kamili**: Mfumo wa mawakala wengi wenye mawakala maalum wa huduma kwa wateja na usimamizi wa zaliha
- **Production Infrastructure**: Usambazaji wa Microsoft Foundry Models katika mikoa mingi, AI Search, Container Apps, na ufuatiliaji kamili
- **Ready-to-Deploy ARM Template**: Uwekaji kwa bonyeza moja na njia mbalimbali za usanidi (Minimal/Standard/Premium)
- **Advanced Features**: Uthibitishaji wa usalama wa red teaming, mfumo wa tathmini ya mawakala, uboreshaji wa gharama, na mwongozo wa kutatua matatizo
- **Real Business Context**: Mfano wa msaada wa wateja wa muuzaji wa rejareja unaojumuisha kupakia faili, ujumuishaji wa utafutaji, na upanuaji unaobadilika

**Technologies**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Complexity**: ⭐⭐⭐⭐ (Kiwango cha Juu - Tayari kwa Uzalishaji wa Shirika)

**Perfect for**: Waendelezaji wa AI, wasanifu wa suluhisho, na timu zinazojenga mifumo ya mawakala wingi kwa uzalishaji

**Quick Start**: Sambaza suluhisho kamili chini ya dakika 30 ukitumia kiolezo cha ARM kilichoambatanishwa na `./deploy.sh -g myResourceGroup`

## 📋 Maelekezo ya Matumizi

### Mahitaji

Kabla ya kuendesha mfano wowote:
- ✅ Usajili wa Azure unao na ruhusa ya Owner au Contributor
- ✅ Azure Developer CLI imewekwa ([Mwongozo wa Usakinishaji](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop inayoendesha (kwa mifano ya kontejina)
- ✅ Viwango vinavyofaa vya Azure (kagua mahitaji maalum ya mfano)

> **💰 Onyo la Gharama:** Mifano yote huunda rasilimali halisi za Azure zinazotoza ada. Angalia faili za README za kila mfano kwa makadirio ya gharama. Kumbuka kuendesha `azd down` baada ya kumaliza ili kuepuka gharama zinazoendelea.

### Kuendesha Mifano Kwenye Eneo Lako

1. **Klonisha au Nakili Mfano**
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

4. **Sambaza**
   ```bash
   # Sambaza miundombinu na programu
   azd up
   ```

5. **Thibitisha Uwekaji**
   ```bash
   # Pata vituo vya huduma
   azd env get-values
   
   # Jaribu kituo cha huduma (mfano)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Viashiria vinavyotarajiwa vya Mafanikio:**
   - ✅ `azd up` inakamilika bila makosa
   - ✅ Kiunganisho cha huduma kirudishe HTTP 200
   - ✅ Azure Portal inaonyesha hali "Running"
   - ✅ Application Insights inapokea telemetry

> **⚠️ Matatizo?** Angalia [Masuala ya Kawaida](../docs/chapter-07-troubleshooting/common-issues.md) kwa utatuzi wa matatizo ya uanzishaji

### Kubadilisha Mifano

Kila mfano unajumuisha:
- **README.md** - Maelekezo ya kina ya usanidi na ubinafsishaji
- **azure.yaml** - Usanidi wa AZD wenye maoni
- **infra/** - Violezo vya Bicep na maelezo ya vigezo
- **src/** - Msimbo wa mfano wa programu
- **scripts/** - Skripti za msaada kwa kazi za kawaida

## 🎯 Malengo ya Kujifunza

### Aina za Mifano

#### **Uwekaji Msingi**
- Programu zenye huduma moja
- Mifano rahisi ya miundombinu
- Usimamizi wa usanidi wa msingi
- Mipangilio ya maendeleo yenye gharama nafuu

#### **Matukio ya Juu**
- Miundo ya huduma nyingi
- Usanidi tata wa mitandao
- Mifano ya ujumuishaji wa hifadhidata
- Utekelezaji wa usalama na utimilifu

#### **Mifano Tayari kwa Uzalishaji**
- Usanidi wa upatikanaji wa juu
- Ufuatiliaji na uwezo wa kuangalia
- Ujumuishaji wa CI/CD
- Mipangilio ya urejesho wa ajali

## 📖 Maelezo ya Mifano

### Programu Rahisi ya Wavuti - Node.js Express
**Teknolojia**: Node.js, Express, MongoDB, Container Apps  
**Ugumu**: Msingi  
**Madhumuni**: Uwekaji wa msingi, REST API, ujumuishaji wa hifadhidata NoSQL

### Tovuti Imara - React SPA
**Teknolojia**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Ugumu**: Msingi  
**Madhumuni**: Uwekaji imara, backend isiyo na seva, maendeleo ya wavuti ya kisasa

### Container App - Python Flask
**Teknolojia**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Ugumu**: Msingi  
**Madhumuni**: Uwekaji ndani ya kontejina, REST API, scale-to-zero, health probes, ufuatiliaji  
**Location**: [Mfano la Ndani](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**Teknolojia**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Ugumu**: Juu  
**Madhumuni**: Muundo wa huduma nyingi, mawasiliano ya huduma, queuing ya ujumbe, tracing iliyosambazwa  
**Location**: [Mfano la Ndani](../../../examples/container-app/microservices)

### Database App - C# with Azure SQL
**Teknolojia**: C# ASP.NET Core, Azure SQL Database, App Service  
**Ugumu**: Wastani  
**Madhumuni**: Entity Framework, muunganisho wa hifadhidata, maendeleo ya web API

### Serverless Function - Python Azure Functions
**Teknolojia**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Ugumu**: Wastani  
**Madhumuni**: Muundo unaoendeshwa na matukio, kompyuta isiyo na seva, maendeleo kamili

### Microservices - Java Spring Boot
**Teknolojia**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Ugumu**: Wastani  
**Madhumuni**: Mawasiliano ya microservices, mifumo iliyosambazwa, mifano ya shirika

### Microsoft Foundry Examples

#### Microsoft Foundry Models Chat App
**Teknolojia**: Microsoft Foundry Models, Azure AI Search, App Service  
**Ugumu**: Wastani  
**Madhumuni**: Usanifu wa RAG, utafutaji wa vector, ujumuishaji wa LLM

#### AI Document Processing
**Teknolojia**: Azure AI Document Intelligence, Storage, Functions  
**Ugumu**: Wastani  
**Madhumuni**: Uchambuzi wa nyaraka, OCR, utafutaji wa data

#### Machine Learning Pipeline
**Teknolojia**: Azure ML, MLOps, Container Registry  
**Ugumu**: Juu  
**Madhumuni**: Mafunzo ya modeli, pipelines za uenezaji, ufuatiliaji

## 🛠 Mifano ya Usanidi

The `configurations/` directory contains reusable components:

### Environment Configurations
- Mipangilio ya mazingira ya maendeleo
- Usanidi wa mazingira ya staging
- Usanidi wa tayari kwa uzalishaji
- Mipangilio ya uenezaji katika mikoa mingi

### Bicep Modules
- Vipengele vya miundombinu vinavyoweza kutumika tena
- Mifano ya rasilimali ya kawaida
- Violezo vilivyoimarishwa kwa usalama
- Usanidi ulioboreshwa kwa gharama

### Helper Scripts
- Uendeshaji wa otomatiki wa usanidi wa mazingira
- Skripti za uhamishaji wa hifadhidata
- Zana za uthibitishaji wa uenezaji
- Vifaa vya ufuatiliaji wa gharama

## 🔧 Mwongozo wa Ubinafsishaji

### Kubadilisha Mifano Kwa Kesi Yako ya Matumizi

1. **Kagua Mahitaji ya Awali**
   - Angalia mahitaji ya huduma za Azure
   - Thibitisha mipaka ya usajili
   - Elewa athari za gharama

2. **Badilisha Usanidi**
   - Sasisha ufafanuzi wa huduma katika `azure.yaml`
   - Binafsisha violezo vya Bicep
   - Rekebisha vigezo vya mazingira

3. **Jaribu kwa Kina**
   - Sambaza kwa mazingira ya maendeleo kwanza
   - Thibitisha utendakazi
   - Jaribu upanuaji na utendaji

4. **Uhakiki wa Usalama**
   - Kagua udhibiti wa upatikanaji
   - Tekeleza usimamizi wa siri
   - Washa ufuatiliaji na arifa

## 📊 Mlinganisho wa Matrix

| Mfano | Huduma | Hifadhidata | Uthibitishaji | Ufuatiliaji | Ugumu |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (Ndani) | 2 | ❌ | Key Vault | Kamili | ⭐⭐ |
| **Python Flask API** (Ndani) | 1 | ❌ | Msingi | Kamili | ⭐ |
| **Microservices** (Ndani) | 5+ | ✅ | Shirika | Juu | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Msingi | Msingi | ⭐ |
| React SPA + Functions | 3 | ✅ | Msingi | Kamili | ⭐ |
| Python Flask Container | 2 | ❌ | Msingi | Kamili | ⭐ |
| C# Web API + SQL | 2 | ✅ | Kamili | Kamili | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Kamili | Kamili | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Kamili | Kamili | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | Kamili | Kamili | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Msingi | Kamili | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Kamili | Kamili | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Ndani) | **8+** | **✅** | **Shirika** | **Juu** | **⭐⭐⭐⭐** |

## 🎓 Njia ya Kujifunza

### Mpangilio Unaopendekezwa

1. **Anza na Programu Rahisi ya Wavuti**
   - Jifunze dhana za msingi za AZD
   - Elewa mtiririko wa uanzishaji
   - Fanya mazoezi ya usimamizi wa mazingira

2. **Jaribu Tovuti Imara**
   - Chunguza njia tofauti za kuhosti
   - Jifunze kuhusu ujumuishaji wa CDN
   - Elewa usanidi wa DNS

3. **Hamia kwa Container App**
   - Jifunze misingi ya kontejina
   - Elewa dhana za upanuaji
   - Fanya mazoezi na Docker

4. **Ongeza Ujumuishaji wa Hifadhidata**
   - Jifunze utoaji wa hifadhidata
   - Elewa connection strings
   - Fanya mazoezi ya usimamizi wa siri

5. **Chunguza Serverless**
   - Elewa muundo unaotegemea matukio
   - Jifunze kuhusu triggers na bindings
   - Fanya mazoezi na APIs

6. **Jenga Microservices**
   - Jifunze mawasiliano ya huduma
   - Elewa mifumo iliyosambazwa
   - Fanya mazoezi ya uenezaji mgumu

## 🔍 Kupata Mfano Sahihi

### Kwa Stack ya Teknolojia
- **Container Apps**: [Python Flask API (Ndani)](../../../examples/container-app/simple-flask-api), [Microservices (Ndani)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Ndani)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Ndani)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Ndani)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Ndani)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Microservices User Service (Ndani)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Ndani)](../../../examples/container-app/simple-flask-api), [Microservices (Ndani)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (Ndani)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (Ndani)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Microsoft Foundry Models Chat (Ndani)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (Ndani)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Kwa Muundo wa Mifumo
- **Simple REST API**: [Python Flask API (Ndani)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Ndani)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (Ndani)](../../../examples/container-app/simple-flask-api), [Microservices (Ndani)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Microsoft Foundry Models Chat (Ndani)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (Ndani)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Kwa Kiwango cha Ugumu
- **Mwanzo**: [Python Flask API (Ndani)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Wastani**: **[Microsoft Foundry Models Chat (Ndani)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **Juu**: ML Pipeline
- **Tayari kwa Uzalishaji wa Shirika**: [Microservices (Ndani)](../../../examples/container-app/microservices) (Huduma nyingi zenye queuing), **Retail Multi-Agent Solution** (Mfumo kamili wa mawakala wengi na kiolezo cha ARM kwa uenezaji)

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
- [Todo App with Node.js and PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [Tovuti ya React na API ya C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Kazi ya Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions na Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Mazoea Bora
- [Mfumo wa Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Mfumo wa Kupitisha Wingu (Cloud Adoption Framework)](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Michango ya Mifano

Una mfano wenye manufaa wa kushiriki? Tunakaribisha michango!

### Miongozo ya Uwasilishaji
1. Fuata muundo wa saraka uliowekwa
2. Jumuisha README.md kamili
3. Ongeza maoni kwenye faili za usanidi
4. Jaribu kwa uangalifu kabla ya kuwasilisha
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

**Ushauri wa Mtaalamu**: Anza na mfano rahisi unaolingana na stack yako ya teknolojia, kisha polepole jenga hadi hali za kisaibisha zaidi. Kila mfano unajenga juu ya dhana kutoka kwa mfano uliopita!

## 🚀 Uko Tayari Kuanza?

### Njia Yako ya Kujifunza

1. **Mwanzo kabisa?** → Anza na [Flask API](../../../examples/container-app/simple-flask-api) (⭐, dakika 20)
2. **Una maarifa ya msingi ya AZD?** → Jaribu [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, dakika 60)
3. **Unajenga Programu za AI?** → Anza na [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, dakika 35) au chunguza [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, zaidi ya saa 2)
4. **Unahitaji stack maalum la teknolojia?** → Tumia sehemu ya [Kupata Mfano Sahihi](#-finding-the-right-example) hapo juu

### Hatua Zinazofuata

- ✅ Kagua [Mahitaji ya awali](#mahitaji) hapo juu
- ✅ Chagua mfano unaolingana na kiwango chako cha ujuzi (tazama [Legenda ya Ugumu](#maelezo-ya-viwango-vya-ugumu))
- ✅ Soma README ya mfano kwa kina kabla ya kuiweka
- ✅ Weka ukumbusho wa kuendesha `azd down` baada ya kupima
- ✅ Shiriki uzoefu wako kupitia GitHub Issues au Discussions

### Unahitaji Msaada?

- 📖 [FAQ](../resources/faq.md) - Maswali ya kawaida yanayojibiwa
- 🐛 [Troubleshooting Guide](../docs/chapter-07-troubleshooting/common-issues.md) - Rekebisha matatizo ya uanzishaji
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Muulize jamii
- 📚 [Study Guide](../resources/study-guide.md) - Imarisha kujifunza kwako

---

**Uvinjari**
- **📚 Nyumbani kwa Kozi**: [AZD For Beginners](../README.md)
- **📖 Vifaa vya Kujifunza**: [Mwongozo wa Masomo](../resources/study-guide.md) | [Muhtasari](../resources/cheat-sheet.md) | [Orodha ya Maneno](../resources/glossary.md)
- **🔧 Rasilimali**: [FAQ](../resources/faq.md) | [Troubleshooting](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Imesasishwa Mwisho: November 2025 | [Ripoti Matatizo](https://github.com/microsoft/AZD-for-beginners/issues) | [Changia Mifano](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->