# Mifano - Violezo vya Kivitendo vya AZD na Usanidi

**Kujifunza kwa Mifano - Imeandaliwa kwa Sura**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Anayeanza](../README.md)
- **📖 Ulinganifu wa Sura**: Mifano imepangwa kulingana na ugumu wa kujifunza
- **🚀 Mfano wa Ndani**: [Suluhisho la Wakala Wengi wa Rejareja](retail-scenario.md)
- **🤖 Mifano ya AI ya Nje**: Viungo kwa hazina za Azure Samples

> **📍 MUHIMU: Mifano ya Ndani dhidi ya ya Nje**  
> Hazina hii ina **mifano 4 kamili ya ndani** yenye utekelezaji kamili:  
> - **Azure OpenAI Chat** (Utekelezaji wa GPT-4 na kiolesura cha mazungumzo)  
> - **Container Apps** (API rahisi ya Flask + Huduma Ndogo)  
> - **Database App** (Tovuti + Hifadhidata ya SQL)  
> - **Retail Multi-Agent** (Suluhisho la AI la Biashara)  
>  
> Mifano ya ziada ni **marejeleo ya nje** kwa hazina za Azure-Samples ambazo unaweza kunakili.

## Utangulizi

Sarakasi hii inatoa mifano ya kivitendo na marejeleo ya kukusaidia kujifunza Azure Developer CLI kupitia mazoezi ya vitendo. Hali ya Wakala Wengi wa Rejareja ni utekelezaji kamili, tayari kwa uzalishaji, uliyojumuishwa katika hazina hii. Mifano ya ziada inarejelea Azure Samples rasmi zinazoonyesha mifumo mbalimbali ya AZD.

### Alama ya Ugumu wa Kujifunza

- ⭐ **Anayeanza** - Dhana za msingi, huduma moja, dakika 15-30
- ⭐⭐ **Kati** - Huduma nyingi, ujumuishaji wa hifadhidata, dakika 30-60
- ⭐⭐⭐ **Juu** - Miundombinu tata, ujumuishaji wa AI, saa 1-2
- ⭐⭐⭐⭐ **Mtaalamu** - Tayari kwa uzalishaji, mifumo ya biashara, zaidi ya saa 2

## 🎯 Nini Kiko Katika Hazina Hii

### ✅ Utekelezaji wa Ndani (Tayari Kutumika)

#### [Programu ya Mazungumzo ya Azure OpenAI](azure-openai-chat/README.md) 🆕
**Utekelezaji kamili wa GPT-4 na kiolesura cha mazungumzo kimejumuishwa katika hazina hii**

- **Mahali:** `examples/azure-openai-chat/`
- **Ugumu:** ⭐⭐ (Kati)
- **Kimejumuishwa:**
  - Utekelezaji kamili wa Azure OpenAI (GPT-4)
  - Kiolesura cha mazungumzo cha Python
  - Ujumuishaji wa Key Vault kwa funguo za API salama
  - Violezo vya miundombinu ya Bicep
  - Ufuatiliaji wa matumizi ya tokeni na gharama
  - Kuweka mipaka ya kiwango na kushughulikia makosa

**Kuanza Haraka:**
```bash
# Elekea kwenye mfano
cd examples/azure-openai-chat

# Peleka kila kitu
azd up

# Sakinisha utegemezi na anza kuzungumza
pip install -r src/requirements.txt
python src/chat.py
```

**Teknolojia:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Mifano ya Programu za Kontena](container-app/README.md) 🆕
**Mifano kamili ya utekelezaji wa kontena imejumuishwa katika hazina hii**

- **Mahali:** `examples/container-app/`
- **Ugumu:** ⭐-⭐⭐⭐⭐ (Anayeanza hadi Mtaalamu)
- **Kimejumuishwa:**
  - [Mwongozo Mkuu](container-app/README.md) - Muhtasari kamili wa utekelezaji wa kontena
  - [API Rahisi ya Flask](../../../examples/container-app/simple-flask-api) - Mfano wa msingi wa REST API
  - [Miundombinu ya Huduma Ndogo](../../../examples/container-app/microservices) - Utekelezaji wa huduma nyingi tayari kwa uzalishaji
  - Mifumo ya Kuanza Haraka, Uzalishaji, na Juu
  - Ufuatiliaji, usalama, na uboreshaji wa gharama

**Kuanza Haraka:**
```bash
# Tazama mwongozo mkuu
cd examples/container-app

# Peleka API rahisi ya Flask
cd simple-flask-api
azd up

# Peleka mfano wa huduma ndogo
cd ../microservices
azd up
```

**Teknolojia:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Suluhisho la Wakala Wengi wa Rejareja](retail-scenario.md) 🆕
**Utekelezaji kamili tayari kwa uzalishaji umejumuishwa katika hazina hii**

- **Mahali:** `examples/retail-multiagent-arm-template/`
- **Ugumu:** ⭐⭐⭐⭐ (Juu)
- **Kimejumuishwa:**
  - Kiolezo kamili cha utekelezaji wa ARM
  - Miundombinu ya wakala wengi (Mteja + Hifadhi)
  - Ujumuishaji wa Azure OpenAI
  - Utafutaji wa AI na RAG
  - Ufuatiliaji wa kina
  - Hati ya utekelezaji wa kubofya mara moja

**Kuanza Haraka:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Teknolojia:** Azure OpenAI, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Mifano ya Nje ya Azure Samples (Nakili Ili Utumie)

Mifano ifuatayo inahifadhiwa katika hazina rasmi za Azure-Samples. Nakili ili kuchunguza mifumo tofauti ya AZD:

### Programu Rahisi (Sura 1-2)

| Kiolezo | Hazina | Ugumu | Huduma |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Ndani: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Huduma Ndogo** | [Ndani: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Huduma nyingi, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Jinsi ya kutumia:**
```bash
# Nakili mfano wowote
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Weka
azd up
```

### Mifano ya Programu za AI (Sura 2, 5, 8)

| Kiolezo | Hazina | Ugumu | Lengo |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI Chat** | [Ndani: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | Utekelezaji wa GPT-4 |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Mazungumzo ya AI ya msingi |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Mfumo wa wakala |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | Mfano wa RAG |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | AI ya Biashara |

### Hifadhidata & Mifumo ya Juu (Sura 3-8)

| Kiolezo | Hazina | Ugumu | Lengo |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Ujumuishaji wa hifadhidata |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Huduma nyingi |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Malengo ya Kujifunza

Kwa kufanya kazi kupitia mifano hii, utaweza:
- Kufanya mazoezi ya kazi za Azure Developer CLI na hali halisi za programu
- Kuelewa miundombinu tofauti ya programu na utekelezaji wake wa azd
- Kumudu mifumo ya Miundombinu kama Kanuni kwa huduma mbalimbali za Azure
- Kutumia usimamizi wa usanidi na mikakati ya utekelezaji maalum kwa mazingira
- Kutekeleza mifumo ya ufuatiliaji, usalama, na upanuzi katika muktadha wa vitendo
- Kujenga uzoefu wa kutatua matatizo na kurekebisha hali halisi za utekelezaji

## Matokeo ya Kujifunza

Baada ya kukamilisha mifano hii, utaweza:
- Kuweka programu mbalimbali kwa kutumia Azure Developer CLI kwa ujasiri
- Kubadilisha violezo vilivyotolewa kwa mahitaji yako ya programu
- Kubuni na kutekeleza mifumo ya miundombinu maalum kwa kutumia Bicep
- Kusimamia programu tata za huduma nyingi na utegemezi sahihi
- Kutumia mbinu bora za usalama, ufuatiliaji, na utendaji katika hali halisi
- Kutatua matatizo na kuboresha utekelezaji kwa msingi wa uzoefu wa vitendo

## Muundo wa Sarakasi

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

## Mifano ya Kuanza Haraka

> **💡 Mpya kwa AZD?** Anza na mfano #1 (Flask API) - inachukua ~dakika 20 na inafundisha dhana za msingi.

### Kwa Anayeanza
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Ndani) ⭐  
   Weka REST API rahisi yenye uwezo wa kupunguza hadi sifuri  
   **Muda:** Dakika 20-25 | **Gharama:** $0-5/mwezi  
   **Utakachojifunza:** Mtiririko wa msingi wa azd, kontena, uchunguzi wa afya  
   **Matokeo Yanayotarajiwa:** Endpoint ya API inayofanya kazi ikirudisha "Hello, World!" na ufuatiliaji

2. **[Programu Rahisi ya Wavuti - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Weka programu ya wavuti ya Node.js Express na MongoDB  
   **Muda:** Dakika 25-35 | **Gharama:** $10-30/mwezi  
   **Utakachojifunza:** Ujumuishaji wa hifadhidata, vigezo vya mazingira, nyuzi za muunganisho  
   **Matokeo Yanayotarajiwa:** Programu ya orodha ya kufanya yenye uwezo wa kuunda/kusoma/kusasisha/kufuta

3. **[Tovuti Tuli - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Karibisha tovuti tuli ya React na Azure Static Web Apps  
   **Muda:** Dakika 20-30 | **Gharama:** $0-10/mwezi  
   **Utakachojifunza:** Ukaribishaji tuli, kazi za serverless, utekelezaji wa CDN  
   **Matokeo Yanayotarajiwa:** UI ya React yenye API ya nyuma, SSL otomatiki, CDN ya kimataifa

### Kwa Watumiaji wa Kati
4. **[Programu ya Mazungumzo ya Azure OpenAI](../../../examples/azure-openai-chat)** (Ndani) ⭐⭐  
   Weka GPT-4 na kiolesura cha mazungumzo na usimamizi salama wa funguo za API  
   **Muda:** Dakika 35-45 | **Gharama:** $50-200/mwezi  
   **Utakachojifunza:** Utekelezaji wa Azure OpenAI, ujumuishaji wa Key Vault, ufuatiliaji wa tokeni  
   **Matokeo Yanayotarajiwa:** Programu ya mazungumzo inayofanya kazi na GPT-4 na ufuatiliaji wa gharama

5. **[Container App - Huduma Ndogo](../../../examples/container-app/microservices)** (Ndani) ⭐⭐⭐⭐  
   Miundombinu ya huduma nyingi tayari kwa uzalishaji  
   **Muda:** Dakika 45-60 | **Gharama:** $50-150/mwezi  
   **Utakachojifunza:** Mawasiliano ya huduma, foleni za ujumbe, ufuatiliaji wa kusambazwa  
   **Matokeo Yanayotarajiwa:** Mfumo wa huduma 2 (API Gateway + Huduma ya Bidhaa) na ufuatiliaji

6. **[Programu ya Hifadhidata - C# na Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Programu ya wavuti yenye API ya C# na Hifadhidata ya Azure SQL  
   **Muda:** Dakika 30-45 | **Gharama:** $20-80/mwezi  
   **Utakachojifunza:** Mfumo wa Entity, uhamishaji wa hifadhidata, usalama wa muunganisho  
   **Matokeo Yanayotarajiwa:** API ya C# yenye hifadhidata ya Azure SQL, utekelezaji wa mpangilio wa moja kwa moja

7. **[Kazi ya Serverless - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Kazi za Python Azure Functions zenye vichochezi vya HTTP na Cosmos DB  
   **Muda:** Dakika 30-40 | **Gharama:** $10-40/mwezi  
   **Utakachojifunza:** Miundombinu inayotegemea matukio, upanuzi wa serverless, ujumuishaji wa NoSQL  
   **Matokeo Yanayotarajiwa:** Programu ya kazi inayojibu maombi ya HTTP na hifadhi ya Cosmos DB

8. **[Huduma Ndogo - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Programu ya Java yenye huduma nyingi, Container Apps, na API gateway  
   **Muda:** Dakika 60-90 | **Gharama:** $80-200/mwezi  
   **Utakachojifunza:** Utekelezaji wa Spring Boot, mtandao wa huduma, usawazishaji wa mzigo  
   **Matokeo Yanayotarajiwa:** Mfumo wa Java wenye huduma nyingi na ugunduzi wa huduma na usambazaji

### Violezo vya Azure AI Foundry

1. **[Programu ya Mazungumzo ya Azure OpenAI - Mfano wa Ndani](../../../examples/azure-openai-chat)** ⭐⭐  
   Utekelezaji kamili wa GPT-4 na kiolesura cha mazungumzo  
   **Muda:** Dakika 35-45 | **Gharama:** $50-200/mwezi  
   **Matokeo Yanayotarajiwa:** Programu ya mazungumzo inayofanya kazi na ufuatiliaji wa tokeni na gharama

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Programu ya mazungumzo yenye akili na miundombinu ya RAG  
   **Muda:** Dakika 60-90 | **Gharama:** $100-300/mwezi  
   **Matokeo Yanayotarajiwa:** Kiolesura cha mazungumzo kinachoendeshwa na RAG chenye utafutaji wa nyaraka na marejeleo

3. **[Usindikaji wa Nyaraka za AI](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Uchambuzi wa nyaraka kwa kutumia huduma za Azure AI  
   **Muda:** Dakika 40-60 | **Gharama:** $20-80/mwezi  
   **Matokeo Yanayotarajiwa:** API inayochambua maandishi, meza, na vyombo kutoka kwa nyaraka zilizopakiwa

4. **[Mfumo wa Mafunzo ya Mashine](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Mtiririko wa MLOps na Azure Machine Learning  
   **Muda:** Saa 2-3 | **Gharama:** $150-500/mwezi  
   **Matokeo Yanayotarajiwa:** Mtiririko wa ML otomatiki wenye mafunzo, utekelezaji, na ufuatiliaji

### Hali Halisi za Ulimwengu

#### **Suluhisho la Wakala Wengi wa Rejareja** 🆕
**[Mwongozo Kamili wa Utekelezaji](./retail-scenario.md)**

Suluhisho kamili, tayari kwa uzalishaji la msaada wa wateja wa wakala wengi linaloonyesha utekelezaji wa programu ya AI ya kiwango cha biashara na AZD. Hali hii inatoa:

- **Miundombinu Kamili**: Mfumo wa wakala wengi wenye huduma maalum za wateja na usimamizi wa hifadhi
- **Miundombinu ya Uzalishaji**: Usambazaji wa Azure OpenAI katika maeneo mengi, Utafutaji wa AI, Programu za Kontena, na ufuatiliaji wa kina
- **Kiolezo cha ARM Tayari kwa Utekelezaji**: Utekelezaji wa haraka kwa kubofya mara moja na hali nyingi za usanidi (Kidogo/Kawaida/Kiwango cha Juu)
- **Vipengele vya Juu**: Uthibitishaji wa usalama wa Red Teaming, mfumo wa tathmini ya mawakala, uboreshaji wa gharama, na miongozo ya kutatua matatizo
- **Muktadha Halisi wa Biashara**: Kesi ya matumizi ya msaada wa wateja wa muuzaji na upakiaji wa faili, ujumuishaji wa utafutaji, na upanuzi wa nguvu

**Teknolojia**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Programu za Kontena, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Ugumu**: ⭐⭐⭐⭐ (Juu - Tayari kwa Uzalishaji wa Biashara)

**Inafaa kwa**: Watengenezaji wa AI, wasanifu wa suluhisho, na timu zinazojenga mifumo ya mawakala wa uzalishaji

**Kuanza Haraka**: Tekeleza suluhisho kamili chini ya dakika 30 ukitumia kiolezo cha ARM kilichojumuishwa na `./deploy.sh -g myResourceGroup`

## 📋 Maelekezo ya Matumizi

### Mahitaji ya Awali

Kabla ya kuendesha mfano wowote:
- ✅ Usajili wa Azure na ufikiaji wa Mmiliki au Mchangiaji
- ✅ CLI ya Azure Developer imewekwa ([Mwongozo wa Usakinishaji](../docs/getting-started/installation.md))
- ✅ Docker Desktop inafanya kazi (kwa mifano ya kontena)
- ✅ Upungufu wa Azure unaofaa (angalia mahitaji maalum ya mfano)

> **💰 Onyo la Gharama:** Mifano yote huunda rasilimali halisi za Azure ambazo husababisha gharama. Tazama faili za README za kila mfano kwa makadirio ya gharama. Kumbuka kuendesha `azd down` ukimaliza ili kuepuka gharama zinazoendelea.

### Kuendesha Mifano Laini

1. **Nakili au Kloni Mfano**
   ```bash
   # Elekea kwenye mfano unaotaka
   cd examples/simple-web-app
   ```

2. **Anzisha Mazingira ya AZD**
   ```bash
   # Anzisha na kiolezo kilichopo
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
   # Weka miundombinu na programu
   azd up
   ```

5. **Thibitisha Utekelezaji**
   ```bash
   # Pata sehemu za huduma
   azd env get-values
   
   # Jaribu sehemu ya mwisho (mfano)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Viashiria vya Mafanikio Vinavyotarajiwa:**
   - ✅ `azd up` inakamilika bila makosa
   - ✅ Endpoint ya huduma inarudisha HTTP 200
   - ✅ Portal ya Azure inaonyesha hali ya "Inafanya Kazi"
   - ✅ Application Insights inapokea telemetry

> **⚠️ Matatizo?** Tazama [Masuala ya Kawaida](../docs/troubleshooting/common-issues.md) kwa utatuzi wa utekelezaji

### Kubadilisha Mifano

Kila mfano unajumuisha:
- **README.md** - Maelekezo ya kina ya usanidi na ubinafsishaji
- **azure.yaml** - Usanidi wa AZD na maoni
- **infra/** - Violezo vya Bicep na maelezo ya vigezo
- **src/** - Msimbo wa programu ya mfano
- **scripts/** - Script za kusaidia kwa kazi za kawaida

## 🎯 Malengo ya Kujifunza

### Makundi ya Mifano

#### **Utekelezaji Rahisi**
- Programu za huduma moja
- Mifumo rahisi ya miundombinu
- Usimamizi wa usanidi wa msingi
- Mazingira ya maendeleo ya gharama nafuu

#### **Matukio ya Juu**
- Miundombinu ya huduma nyingi
- Usanidi wa mitandao tata
- Mifumo ya ujumuishaji wa hifadhidata
- Utekelezaji wa usalama na kufuata sheria

#### **Mifumo Tayari kwa Uzalishaji**
- Usanidi wa upatikanaji wa juu
- Ufuatiliaji na uangalizi
- Ujumuishaji wa CI/CD
- Usanidi wa urejeshaji wa maafa

## 📖 Maelezo ya Mifano

### Programu Rahisi ya Wavuti - Node.js Express
**Teknolojia**: Node.js, Express, MongoDB, Programu za Kontena  
**Ugumu**: Mwanzoni  
**Mafunzo**: Utekelezaji wa msingi, REST API, ujumuishaji wa hifadhidata ya NoSQL

### Tovuti Tuli - React SPA
**Teknolojia**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Ugumu**: Mwanzoni  
**Mafunzo**: Ukaribishaji tuli, backend isiyo na seva, maendeleo ya wavuti ya kisasa

### Programu ya Kontena - Python Flask
**Teknolojia**: Python Flask, Docker, Programu za Kontena, Container Registry, Application Insights  
**Ugumu**: Mwanzoni  
**Mafunzo**: Uwekaji wa kontena, REST API, scale-to-zero, probes za afya, ufuatiliaji  
**Mahali**: [Mfano wa Ndani](../../../examples/container-app/simple-flask-api)

### Programu ya Kontena - Usanifu wa Huduma Ndogo
**Teknolojia**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Programu za Kontena  
**Ugumu**: Juu  
**Mafunzo**: Usanifu wa huduma nyingi, mawasiliano ya huduma, foleni za ujumbe, ufuatiliaji wa usambazaji  
**Mahali**: [Mfano wa Ndani](../../../examples/container-app/microservices)

### Programu ya Hifadhidata - C# na Azure SQL
**Teknolojia**: C# ASP.NET Core, Azure SQL Database, App Service  
**Ugumu**: Kati  
**Mafunzo**: Entity Framework, miunganisho ya hifadhidata, maendeleo ya web API

### Kazi Isiyo na Seva - Python Azure Functions
**Teknolojia**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Ugumu**: Kati  
**Mafunzo**: Usanifu unaoendeshwa na matukio, hesabu isiyo na seva, maendeleo ya full-stack

### Huduma Ndogo - Java Spring Boot
**Teknolojia**: Java Spring Boot, Programu za Kontena, Service Bus, API Gateway  
**Ugumu**: Kati  
**Mafunzo**: Mawasiliano ya huduma ndogo, mifumo ya usambazaji, mifumo ya biashara

### Mifano ya Azure AI Foundry

#### Programu ya Mazungumzo ya Azure OpenAI
**Teknolojia**: Azure OpenAI, Cognitive Search, App Service  
**Ugumu**: Kati  
**Mafunzo**: Usanifu wa RAG, utafutaji wa vector, ujumuishaji wa LLM

#### Usindikaji wa Nyaraka za AI
**Teknolojia**: Azure AI Document Intelligence, Storage, Functions  
**Ugumu**: Kati  
**Mafunzo**: Uchambuzi wa nyaraka, OCR, uchimbaji wa data

#### Njia ya Mashine ya Kujifunza
**Teknolojia**: Azure ML, MLOps, Container Registry  
**Ugumu**: Juu  
**Mafunzo**: Mafunzo ya modeli, njia za utekelezaji, ufuatiliaji

## 🛠 Mifano ya Usanidi

Saraka ya `configurations/` ina vipengele vinavyoweza kutumika tena:

### Usanidi wa Mazingira
- Mazingira ya maendeleo
- Usanidi wa mazingira ya majaribio
- Usanidi tayari kwa uzalishaji
- Usanidi wa usambazaji wa maeneo mengi

### Moduli za Bicep
- Vipengele vya miundombinu vinavyoweza kutumika tena
- Mifumo ya rasilimali ya kawaida
- Violezo vilivyohifadhiwa kwa usalama
- Usanidi wa gharama nafuu

### Script za Kusaidia
- Uwekaji wa mazingira kiotomatiki
- Script za uhamishaji wa hifadhidata
- Zana za uthibitishaji wa utekelezaji
- Huduma za ufuatiliaji wa gharama

## 🔧 Mwongozo wa Kubinafsisha

### Kubadilisha Mifano kwa Kesi Yako ya Matumizi

1. **Kagua Mahitaji ya Awali**
   - Angalia mahitaji ya huduma za Azure
   - Thibitisha mipaka ya usajili
   - Elewa athari za gharama

2. **Badilisha Usanidi**
   - Sasisha ufafanuzi wa huduma za `azure.yaml`
   - Binafsisha violezo vya Bicep
   - Rekebisha vigezo vya mazingira

3. **Jaribu Kikamilifu**
   - Tekeleza kwanza kwenye mazingira ya maendeleo
   - Thibitisha utendaji
   - Jaribu upanuzi na utendaji

4. **Kagua Usalama**
   - Kagua udhibiti wa ufikiaji
   - Tekeleza usimamizi wa siri
   - Washa ufuatiliaji na tahadhari

## 📊 Jedwali la Ulinganisho

| Mfano | Huduma | Hifadhidata | Uthibitishaji | Ufuatiliaji | Ugumu |
|-------|--------|-------------|---------------|-------------|-------|
| **Mazungumzo ya Azure OpenAI** (Ndani) | 2 | ❌ | Key Vault | Kamili | ⭐⭐ |
| **Python Flask API** (Ndani) | 1 | ❌ | Msingi | Kamili | ⭐ |
| **Huduma Ndogo** (Ndani) | 5+ | ✅ | Biashara | Juu | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Msingi | Msingi | ⭐ |
| React SPA + Functions | 3 | ✅ | Msingi | Kamili | ⭐ |
| Python Flask Container | 2 | ❌ | Msingi | Kamili | ⭐ |
| C# Web API + SQL | 2 | ✅ | Kamili | Kamili | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Kamili | Kamili | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Kamili | Kamili | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Kamili | Kamili | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Msingi | Kamili | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Kamili | Kamili | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Ndani) | **8+** | **✅** | **Biashara** | **Juu** | **⭐⭐⭐⭐** |

## 🎓 Njia ya Kujifunza

### Maendeleo Yanayopendekezwa

1. **Anza na Programu Rahisi ya Wavuti**
   - Jifunze dhana za msingi za AZD
   - Elewa mtiririko wa utekelezaji
   - Fanya mazoezi ya usimamizi wa mazingira

2. **Jaribu Tovuti Tuli**
   - Chunguza chaguo tofauti za ukaribishaji
   - Jifunze kuhusu ujumuishaji wa CDN
   - Elewa usanidi wa DNS

3. **Endelea na Programu ya Kontena**
   - Jifunze misingi ya uwekaji wa kontena
   - Elewa dhana za upanuzi
   - Fanya mazoezi na Docker

4. **Ongeza Ujumuishaji wa Hifadhidata**
   - Jifunze utoaji wa hifadhidata
   - Elewa mistari ya muunganisho
   - Fanya mazoezi ya usimamizi wa siri

5. **Chunguza Usanidi Usio na Seva**
   - Elewa usanifu unaoendeshwa na matukio
   - Jifunze kuhusu vichochezi na viunganishi
   - Fanya mazoezi na API

6. **Jenga Huduma Ndogo**
   - Jifunze mawasiliano ya huduma
   - Elewa mifumo ya usambazaji
   - Fanya mazoezi ya utekelezaji tata

## 🔍 Kupata Mfano Sahihi

### Kwa Stack ya Teknolojia
- **Programu za Kontena**: [Python Flask API (Ndani)](../../../examples/container-app/simple-flask-api), [Huduma Ndogo (Ndani)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [API Gateway ya Huduma Ndogo (Ndani)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Ndani)](../../../examples/container-app/simple-flask-api), [Huduma Ndogo ya Bidhaa (Ndani)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Huduma Ndogo ya Agizo (Ndani)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Go**: [Huduma Ndogo ya Mtumiaji (Ndani)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Kontena**: [Python Flask (Ndani)](../../../examples/container-app/simple-flask-api), [Huduma Ndogo (Ndani)](../../../examples/container-app/microservices), Java Microservices
- **Hifadhidata**: [Huduma Ndogo (Ndani)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Azure OpenAI Chat (Ndani)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Mifumo ya Mawakala Wengi**: **Retail Multi-Agent Solution**
- **Ujumuishaji wa OpenAI**: **[Azure OpenAI Chat (Ndani)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Uzalishaji wa Biashara**: [Huduma Ndogo (Ndani)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Kwa Muundo wa Usanifu
- **REST API Rahisi**: [Python Flask API (Ndani)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Tuli + Isiyo na Seva**: React SPA + Functions, Python Functions + SPA
- **Huduma Ndogo**: [Huduma Ndogo za Uzalishaji (Ndani)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Kontena**: [Python Flask (Ndani)](../../../examples/container-app/simple-flask-api), [Huduma Ndogo (Ndani)](../../../examples/container-app/microservices)
- **Inayoendeshwa na AI**: **[Azure OpenAI Chat (Ndani)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Usanifu wa Mawakala Wengi**: **Retail Multi-Agent Solution**
- **Huduma Nyingi za Biashara**: [Huduma Ndogo (Ndani)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Kwa Kiwango cha Ugumu
- **Mwanzoni**: [Python Flask API (Ndani)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Kati**: **[Azure OpenAI Chat (Ndani)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Juu**: ML Pipeline
- **Tayari kwa Uzalishaji wa Biashara**: [Huduma Ndogo (Ndani)](../../../examples/container-app/microservices) (Huduma nyingi na foleni za ujumbe), **Retail Multi-Agent Solution** (Mfumo kamili wa mawakala wengi na utekelezaji wa kiolezo cha ARM)

## 📚 Rasilimali za Ziada

### Viungo vya Nyaraka
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Mifano ya Jamii
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Programu ya Todo na Node.js na PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [Programu ya Wavuti ya React na API ya C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Kazi za Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions na Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Mazoezi Bora
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Mifano ya Kuchangia

Una mfano mzuri wa kushiriki? Tunakaribisha michango!

### Miongozo ya Uwasilishaji
1. Fuata muundo wa saraka uliowekwa
2. Jumuisha README.md iliyo kamili
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

**Ushauri wa Wataalamu**: Anza na mfano rahisi zaidi unaolingana na teknolojia yako, kisha polepole endelea hadi hali ngumu zaidi. Kila mfano unajenga juu ya dhana kutoka kwa zile za awali!

## 🚀 Tayari Kuanza?

### Njia Yako ya Kujifunza

1. **Mwanzilishi Kabisa?** → Anza na [Flask API](../../../examples/container-app/simple-flask-api) (⭐, Dakika 20)
2. **Una Maarifa ya Msingi ya AZD?** → Jaribu [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, Dakika 60)
3. **Unajenga Programu za AI?** → Anza na [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, Dakika 35) au chunguza [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, Saa 2+)
4. **Unahitaji Teknolojia Maalum?** → Tumia sehemu ya [Kupata Mfano Sahihi](../../../examples) hapo juu

### Hatua Zifuatazo

- ✅ Kagua [Mahitaji ya Awali](../../../examples) hapo juu
- ✅ Chagua mfano unaolingana na kiwango chako cha ujuzi (tazama [Alama ya Ugumu](../../../examples))
- ✅ Soma README ya mfano kwa kina kabla ya kupeleka
- ✅ Weka ukumbusho wa kuendesha `azd down` baada ya majaribio
- ✅ Shiriki uzoefu wako kupitia Masuala ya GitHub au Majadiliano

### Unahitaji Msaada?

- 📖 [Maswali Yanayoulizwa Mara kwa Mara](../resources/faq.md) - Maswali ya kawaida yanajibiwa
- 🐛 [Mwongozo wa Kutatua Tatizo](../docs/troubleshooting/common-issues.md) - Rekebisha matatizo ya upelekaji
- 💬 [Majadiliano ya GitHub](https://github.com/microsoft/AZD-for-beginners/discussions) - Uliza jamii
- 📚 [Mwongozo wa Kujifunza](../resources/study-guide.md) - Imarisha kujifunza kwako

---

**Urambazaji**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Anzishi](../README.md)
- **📖 Vifaa vya Kujifunza**: [Mwongozo wa Kujifunza](../resources/study-guide.md) | [Karatasi ya Msaada](../resources/cheat-sheet.md) | [Kamusi](../resources/glossary.md)
- **🔧 Rasilimali**: [Maswali Yanayoulizwa Mara kwa Mara](../resources/faq.md) | [Kutatua Tatizo](../docs/troubleshooting/common-issues.md)

---

*Imesasishwa Mwisho: Novemba 2025 | [Ripoti Masuala](https://github.com/microsoft/AZD-for-beginners/issues) | [Changia Mifano](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kanusho**:  
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kwa usahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Hati ya asili katika lugha yake ya kiasili inapaswa kuzingatiwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu ya binadamu inapendekezwa. Hatutawajibika kwa kutoelewana au tafsiri zisizo sahihi zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->