# Mifano - Violezo na Mipangilio ya AZD ya Vitendo

**Jifunze kwa Mfano - Imepangwa Kwa Sura**
- **📚 Nyumba ya Kozi**: [AZD Kwa Waanzilishi](../README.md)
- **📖 Ramani za Sura**: Mifano imepangwa kwa ugumu wa kujifunza
- **🚀 Mfano wa Ndani**: [Suluhisho la Wakala Wingi la Rejareja](retail-scenario.md)
- **🤖 Mifano ya AI ya Nje**: Viungo kuelekea hazina za Azure Samples

> **📍 MUHIMU: Mifano ya Ndani dhidi ya Nje**  
> Hifadhi hii ina **mifano 4 kamili ya ndani** yenye utekelezaji kamili:  
> - **Microsoft Foundry Models Chat** (utoaji wa gpt-4.1 pamoja na kiolesura cha mazungumzo)  
> - **Container Apps** (API rahisi ya Flask + Microservices)  
> - **Database App** (Tovuti + Hifadhidata ya SQL)  
> - **Retail Multi-Agent** (Suluhisho la AI la Kampuni)  
>  
> Mifano ya ziada ni **marejeleo ya nje** kwa hazina za Azure-Samples ambazo unaweza kuzipakua.

## Utangulizi

Taaluma hii inatoa mifano ya vitendo na marejeleo ili kukusaidia kujifunza Azure Developer CLI kupitia mazoezi ya vitendo. Muktadha wa Retail Multi-Agent ni utekelezaji kamili, tayari kwa uzalishaji uliowemo katika hifadhi hii. Mifano ya ziada inarejelea Azure Samples rasmi ambazo zinaonyesha mifumo mbalimbali ya AZD.

### Kielezo cha Upimaji wa Ugumu

- ⭐ **Mwanzo** - Dhana za msingi, huduma moja, dakika 15-30
- ⭐⭐ **Wastani** - Huduma nyingi, ujumuishaji wa hifadhidata, dakika 30-60
- ⭐⭐⭐ **Mwenye Ujuzi** - Miundo tata, ujumuishaji wa AI, 1-2 saa
- ⭐⭐⭐⭐ **Mtaalamu** - Tayari kwa uzalishaji, mifumo ya kampuni, zaidi ya 2 saa

## 🎯 Nini Kipo Kweli kwenye Hifadhi Hii

### ✅ Utekelezaji wa Ndani (Tayari Kutumiwa)

#### [Programu ya Chat ya Microsoft Foundry Models](azure-openai-chat/README.md) 🆕
**Utekelezaji kamili wa gpt-4.1 pamoja na kiolesura cha mazungumzo umejumuishwa katika hifadhi hii**

- **Mahali:** `examples/azure-openai-chat/`
- **Ugumu:** ⭐⭐ (Wastani)
- **Kimejumuishwa:**
  - Utekelezaji kamili wa Microsoft Foundry Models (gpt-4.1)
  - Kiolesura cha mazungumzo kwa mstari wa amri wa Python
  - Ujumuishaji wa Key Vault kwa ajili ya funguo za API salama
  - Violezo vya miundombinu vya Bicep
  - Matumizi ya tokeni na ufuatiliaji wa gharama
  - Kuzuia viwango na utambuzi wa makosa

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

#### [Mifano ya Programu za Container](container-app/README.md) 🆕
**Mifano kamili ya ueneaji wa kontena zimejumuishwa katika hifadhi hii**

- **Mahali:** `examples/container-app/`
- **Ugumu:** ⭐-⭐⭐⭐⭐ (Kuanzia Mwanzo hadi Mtaalamu)
- **Kimejumuishwa:**
  - [Mwongozo Mkuu](container-app/README.md) - Muhtasari kamili wa ueneaji wa kontena
  - [API Rahisi ya Flask](../../../examples/container-app/simple-flask-api) - Mfano wa msingi wa REST API
  - [Miundo ya Microservices](../../../examples/container-app/microservices) - Ueneaji wa huduma nyingi tayari kwa uzalishaji
  - Mwanzo wa Haraka, Mifumo ya Uzalishaji, na Mipangilio ya Juu
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

#### [Suluhisho la Wakala Wingi la Rejareja](retail-scenario.md) 🆕
**Utekelezaji kamili, tayari kwa uzalishaji umejumuishwa katika hifadhi hii**

- **Mahali:** `examples/retail-multiagent-arm-template/`
- **Ugumu:** ⭐⭐⭐⭐ (Mwenye Ujuzi)
- **Kimejumuishwa:**
  - Kiolezo kamili cha ueneaji wa ARM
  - Miundo ya wakala wengi (Mteja + Hesabu)
  - Ujumuishaji wa Microsoft Foundry Models
  - Utafutaji wa AI kwa RAG
  - Ufuatiliaji wa kina
  - Skripti ya ueneaji kwa kubofya mara moja

**Anza Haraka:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Teknolojia:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Mifano ya Azure ya Nje (Pakua ili Kutumia)

Mifano ifuatayo inashikiliwa katika hazina rasmi za Azure-Samples. Zipakue (clone) ili kuchunguza mifumo tofauti ya AZD:

### Programu Rahisi (Sura 1-2)

| Kiolezo | Hifadhi | Ugumu | Huduma |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Ndani: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Ndani: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Huduma nyingi, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Jinsi ya Kutumia:**
```bash
# Nakili mfano wowote
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Weka
azd up
```

### Mifano ya Programu za AI (Sura 2, 5, 8)

| Kiolezo | Hifadhi | Ugumu | Msingi |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [Ndani: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | utoaji wa gpt-4.1 |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Chat ya AI ya Msingi |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Mfumo wa mawakala |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | mfumo wa RAG |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | AI ya Kampuni |

### Hifadhidata & Mipangilio ya Juu (Sura 3-8)

| Kiolezo | Hifadhi | Ugumu | Msingi |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Ujumuishaji wa hifadhidata |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL isiyo na seva |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Huduma nyingi |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Malengo ya Kujifunza

Kwa kufanya kazi kupitia mifano hii, utakuwa unaweza:
- Fanya mazoezi ya taratibu za Azure Developer CLI kwa kutumia matukio ya programu halisi
- Elewa miundo tofauti ya programu na utekelezaji wao wa azd
- Pata ujuzi wa mifumo ya Infrastructure as Code kwa huduma mbalimbali za Azure
- Tumia usimamizi wa usanidi na mikakati ya ueneaji maalum kwa mazingira
- Tekeleza mifumo ya ufuatiliaji, usalama, na upanuzi katika muktadha wa vitendo
- Jenga uzoefu wa utatuzi wa matatizo na urekebishaji wa makosa katika matukio halisi ya ueneaji

## Matokeo ya Kujifunza

Baada ya kumaliza mifano hii, utaweza:
- Kutoa aina mbalimbali za programu kwa kutumia Azure Developer CLI kwa kujiamini
- Badilisha violezo vilivyotolewa ili kuendana na mahitaji ya programu yako
- Buni na tekeleza mifumo ya miundombinu iliyobinafsishwa kwa kutumia Bicep
- Sanidi programu tata zenye huduma nyingi na utegemezi sahihi
- Tumia mbinu bora za usalama, ufuatiliaji, na utendaji katika matukio halisi
- Tatua matatizo na boresha ueneaji kwa kuzingatia uzoefu wa vitendo

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

## Mifano ya Mwanzo wa Haraka

> **💡 Mpya kwa AZD?** Anza na mfano wa #1 (Flask API) - huchukua takriban dakika 20 na hufundisha dhana za msingi.

### Kwa Waanzilishi
1. **[Programu ya Container - Python Flask API](../../../examples/container-app/simple-flask-api)** (Ndani) ⭐  
   Kutoa REST API rahisi yenye upanuzi hadi sifuri  
   **Muda:** dakika 20-25 | **Gharama:** $0-5/mwezi  
   **Utajifunza:** taratibu za msingi za azd, kuweka kwenye kontena, probes za afya  
   **Matokeo Yanayotarajiwa:** Mwisho wa API unaofanya kazi unaorudisha "Hello, World!" pamoja na ufuatiliaji

2. **[Tovuti Rahisi - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Kutoa programu ya wavuti ya Node.js Express pamoja na MongoDB  
   **Muda:** 25-35 dakika | **Gharama:** $10-30/mwezi  
   **Utajifunza:** ujumuishaji wa hifadhidata, vigezo vya mazingira, misururu ya muunganisho  
   **Matokeo Yanayotarajiwa:** Programu ya orodha ya kazi (Todo) yenye uwezo wa kuunda/kusoma/kuboresha/kufuta

3. **[Tovuti Statiki - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Andaa tovuti ya statiki ya React kwa kutumia Azure Static Web Apps  
   **Muda:** 20-30 dakika | **Gharama:** $0-10/mwezi  
   **Utajifunza:** uandishi wa statiki, kazi zisizo na seva (serverless), ueneaji wa CDN  
   **Matokeo Yanayotarajiwa:** UI ya React na backend ya API, SSL ya moja kwa moja, CDN ya kimataifa

### Kwa Watumiaji wa Kati
4. **[Programu ya Chat ya Microsoft Foundry Models](../../../examples/azure-openai-chat)** (Ndani) ⭐⭐  
   Kutoa gpt-4.1 na kiolesura cha mazungumzo pamoja na usimamizi salama wa funguo za API  
   **Muda:** 35-45 dakika | **Gharama:** $50-200/mwezi  
   **Utajifunza:** utekelezaji wa Microsoft Foundry Models, ujumuishaji wa Key Vault, ufuatiliaji wa tokeni  
   **Matokeo Yanayotarajiwa:** Programu ya mazungumzo inayoendelea kufanya kazi na gpt-4.1 na ufuatiliaji wa gharama

5. **[Programu ya Container - Microservices](../../../examples/container-app/microservices)** (Ndani) ⭐⭐⭐⭐  
   Muundo wa huduma nyingi tayari kwa uzalishaji  
   **Muda:** 45-60 dakika | **Gharama:** $50-150/mwezi  
   **Utajifunza:** mawasiliano ya huduma, kuorodhesha ujumbe (message queuing), ufuatiliaji wa usambazaji  
   **Matokeo Yanayotarajiwa:** Mfumo wa huduma 2 (API Gateway + Huduma ya Bidhaa) na ufuatiliaji

6. **[Programu ya Hifadhidata - C# na Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Programu ya wavuti na API ya C# na Azure SQL Database  
   **Muda:** 30-45 dakika | **Gharama:** $20-80/mwezi  
   **Utajifunza:** Entity Framework, uhamisho wa miundo ya hifadhidata (database migrations), usalama wa muunganisho  
   **Matokeo Yanayotarajiwa:** API ya C# na backend ya Azure SQL, ueneaji wa schema kwa njia ya moja kwa moja

7. **[Kazi Zisizo na Seva - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions zenye vichocheo vya HTTP na Cosmos DB  
   **Muda:** 30-40 dakika | **Gharama:** $10-40/mwezi  
   **Utajifunza:** usanifu unaoendeshwa na matukio, upanuzi bila seva (serverless), ujumuishaji wa NoSQL  
   **Matokeo Yanayotarajiwa:** Programu ya function inayojibu ombi za HTTP kwa uhifadhi wa Cosmos DB

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Programu ya Java yenye huduma nyingi na Container Apps na API gateway  
   **Muda:** 60-90 dakika | **Gharama:** $80-200/mwezi  
   **Utajifunza:** ueneaji wa Spring Boot, service mesh, kusawazisha mzigo  
   **Matokeo Yanayotarajiwa:** Mfumo wa Java mwenye huduma nyingi na kugundua huduma na kuhifadhi njia

### Violezo vya Microsoft Foundry

1. **[Programu ya Chat ya Microsoft Foundry Models - Mfano wa Ndani](../../../examples/azure-openai-chat)** ⭐⭐  
   Utekelezaji kamili wa gpt-4.1 na kiolesura cha mazungumzo  
   **Muda:** 35-45 dakika | **Gharama:** $50-200/mwezi  
   **Matokeo Yanayotarajiwa:** Programu ya mazungumzo inayoendelea kufanya kazi na ufuatiliaji wa tokeni na gharama

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Programu ya mazungumzo yenye akili pamoja na usanifu wa RAG  
   **Muda:** 60-90 dakika | **Gharama:** $100-300/mwezi  
   **Matokeo Yanayotarajiwa:** Kiolesura cha mazungumzo kinachotumia RAG na utafutaji wa nyaraka na marejeleo

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Uchambuzi wa nyaraka kwa kutumia huduma za Azure AI  
   **Muda:** 40-60 dakika | **Gharama:** $20-80/mwezi  
   **Matokeo Yanayotarajiwa:** API inayochukua maandishi, jedwali, na vitu kutoka kwa nyaraka zilizoambatishwa

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Taratibu za MLOps na Azure Machine Learning  
   **Muda:** 2-3 saa | **Gharama:** $150-500/mwezi  
   **Matokeo Yanayotarajiwa:** Mlolongo wa ML uliyoanzishwa kwa njia ya kiotomatiki na mafunzo, ueneaji, na ufuatiliaji

### Matukio ya Uhalisia

#### **Suluhisho la Wakala Wingi la Rejareja** 🆕  
**[Mwongozo wa Utekelezaji Kamili](./retail-scenario.md)**

Suluhisho kamili, tayari kwa uzalishaji la msaada kwa wateja lenye wakala wengi linaloonyesha ueneaji wa programu za AI za kiwango cha kampuni kwa kutumia AZD. Muktadha huu unatoa:
- **Complete Architecture**: Multi-agent system with specialized customer service and inventory management agents
- **Production Infrastructure**: Multi-region Microsoft Foundry Models deployments, AI Search, Container Apps, and comprehensive monitoring
- **Ready-to-Deploy ARM Template**: One-click deployment with multiple configuration modes (Minimal/Standard/Premium)
- **Advanced Features**: Red teaming security validation, agent evaluation framework, cost optimization, and troubleshooting guides
- **Real Business Context**: Retailer customer support use case with file uploads, search integration, and dynamic scaling

**Technologies**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Complexity**: ⭐⭐⭐⭐ (Advanced - Enterprise Production Ready)

**Perfect for**: AI developers, solution architects, and teams building production multi-agent systems

**Quick Start**: Deploy the complete solution in under 30 minutes using the included ARM template with `./deploy.sh -g myResourceGroup`

## 📋 Usage Instructions

### Prerequisites

Before running any example:
- ✅ Azure subscription with Owner or Contributor access
- ✅ Azure Developer CLI installed ([Mwongozo wa Usakinishaji](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop running (for container examples)
- ✅ Appropriate Azure quotas (check example-specific requirements)

> **💰 Cost Warning:** All examples create real Azure resources that incur charges. See individual README files for cost estimates. Remember to run `azd down` when done to avoid ongoing costs.

### Running Examples Locally

1. **Clone or Copy Example**
   ```bash
   # Nenda kwenye mfano unaotaka
   cd examples/simple-web-app
   ```

2. **Initialize AZD Environment**
   ```bash
   # Anzisha kwa kutumia kiolezo kilichopo
   azd init
   
   # Au unda mazingira mapya
   azd env new my-environment
   ```

3. **Configure Environment**
   ```bash
   # Weka vigezo vinavyohitajika
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Deploy**
   ```bash
   # Weka miundombinu na programu
   azd up
   ```

5. **Verify Deployment**
   ```bash
   # Pata miisho ya huduma
   azd env get-values
   
   # Jaribu mwisho wa huduma (mfano)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Expected Success Indicators:**
   - ✅ `azd up` completes without errors
   - ✅ Service endpoint returns HTTP 200
   - ✅ Azure Portal shows "Running" status
   - ✅ Application Insights receiving telemetry

> **⚠️ Issues?** See [Masuala ya Kawaida](../docs/chapter-07-troubleshooting/common-issues.md) for deployment troubleshooting

### Adapting Examples

Each example includes:
- **README.md** - Maelekezo ya kina ya usanidi na urekebishaji
- **azure.yaml** - AZD configuration with comments
- **infra/** - Bicep templates with parameter explanations
- **src/** - Sample application code
- **scripts/** - Helper scripts for common tasks

## 🎯 Learning Objectives

### Example Categories

#### **Basic Deployments**
- Single-service applications
- Simple infrastructure patterns
- Basic configuration management
- Cost-effective development setups

#### **Advanced Scenarios**
- Multi-service architectures
- Complex networking configurations
- Database integration patterns
- Security and compliance implementations

#### **Production-Ready Patterns**
- High availability configurations
- Monitoring and observability
- CI/CD integration
- Disaster recovery setups

## 📖 Example Descriptions

### Simple Web App - Node.js Express
**Technologies**: Node.js, Express, MongoDB, Container Apps  
**Complexity**: Beginner  
**Concepts**: Basic deployment, REST API, NoSQL database integration

### Static Website - React SPA
**Technologies**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complexity**: Beginner  
**Concepts**: Static hosting, serverless backend, modern web development

### Container App - Python Flask
**Technologies**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Complexity**: Beginner  
**Concepts**: Containerization, REST API, scale-to-zero, health probes, monitoring  
**Location**: [Mfano Lokali](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**Technologies**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complexity**: Advanced  
**Concepts**: Multi-service architecture, service communication, message queuing, distributed tracing  
**Location**: [Mfano Lokali](../../../examples/container-app/microservices)

### Database App - C# with Azure SQL
**Technologies**: C# ASP.NET Core, Azure SQL Database, App Service  
**Complexity**: Intermediate  
**Concepts**: Entity Framework, database connections, web API development

### Serverless Function - Python Azure Functions
**Technologies**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complexity**: Intermediate  
**Concepts**: Event-driven architecture, serverless computing, full-stack development

### Microservices - Java Spring Boot
**Technologies**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Complexity**: Intermediate  
**Concepts**: Microservices communication, distributed systems, enterprise patterns

### Microsoft Foundry Examples

#### Microsoft Foundry Models Chat App
**Technologies**: Microsoft Foundry Models, Cognitive Search, App Service  
**Complexity**: Intermediate  
**Concepts**: RAG architecture, vector search, LLM integration

#### AI Document Processing
**Technologies**: Azure AI Document Intelligence, Storage, Functions  
**Complexity**: Intermediate  
**Concepts**: Document analysis, OCR, data extraction

#### Machine Learning Pipeline
**Technologies**: Azure ML, MLOps, Container Registry  
**Complexity**: Advanced  
**Concepts**: Model training, deployment pipelines, monitoring

## 🛠 Configuration Examples

The `configurations/` directory contains reusable components:

### Environment Configurations
- Development environment settings
- Staging environment configurations
- Production-ready configurations
- Multi-region deployment setups

### Bicep Modules
- Reusable infrastructure components
- Common resource patterns
- Security-hardened templates
- Cost-optimized configurations

### Helper Scripts
- Environment setup automation
- Database migration scripts
- Deployment validation tools
- Cost monitoring utilities

## 🔧 Customization Guide

### Adapting Examples for Your Use Case

1. **Review Prerequisites**
   - Check Azure service requirements
   - Verify subscription limits
   - Understand cost implications

2. **Modify Configuration**
   - Update `azure.yaml` service definitions
   - Customize Bicep templates
   - Adjust environment variables

3. **Test Thoroughly**
   - Deploy to development environment first
   - Validate functionality
   - Test scaling and performance

4. **Security Review**
   - Review access controls
   - Implement secrets management
   - Enable monitoring and alerting

## 📊 Comparison Matrix

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

## 🎓 Learning Path

### Recommended Progression

1. **Start with Simple Web App**
   - Learn basic AZD concepts
   - Understand deployment workflow
   - Practice environment management

2. **Try Static Website**
   - Explore different hosting options
   - Learn about CDN integration
   - Understand DNS configuration

3. **Move to Container App**
   - Learn containerization basics
   - Understand scaling concepts
   - Practice with Docker

4. **Add Database Integration**
   - Learn database provisioning
   - Understand connection strings
   - Practice secrets management

5. **Explore Serverless**
   - Understand event-driven architecture
   - Learn about triggers and bindings
   - Practice with APIs

6. **Build Microservices**
   - Learn service communication
   - Understand distributed systems
   - Practice complex deployments

## 🔍 Finding the Right Example

### By Technology Stack
- **Container Apps**: [Python Flask API (Lokali)](../../../examples/container-app/simple-flask-api), [Microservices (Lokali)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Lokali)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Lokali)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Lokali)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Lokali)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Microservices User Service (Lokali)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Lokali)](../../../examples/container-app/simple-flask-api), [Microservices (Lokali)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (Lokali)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (Lokali)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Microsoft Foundry Models Chat (Lokali)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (Lokali)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### By Architecture Pattern
- **Simple REST API**: [Python Flask API (Lokali)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Lokali)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (Lokali)](../../../examples/container-app/simple-flask-api), [Microservices (Lokali)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Microsoft Foundry Models Chat (Lokali)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (Lokali)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### By Complexity Level
- **Beginner**: [Python Flask API (Lokali)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Intermediate**: **[Microsoft Foundry Models Chat (Lokali)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **Advanced**: ML Pipeline
- **Enterprise Production-Ready**: [Microservices (Lokali)](../../../examples/container-app/microservices) (Multi-service with message queuing), **Retail Multi-Agent Solution** (Complete multi-agent system with ARM template deployment)

## 📚 Additional Resources

### Documentation Links
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Community Examples
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App with Node.js and PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web App with C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions with Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Mbinu Bora
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Kuchangia Mifano

Je, una mfano mzuri wa kushiriki? Tunakaribisha michango!

### Miongozo ya Uwasilishaji
1. Fuata muundo uliowekwa wa saraka
2. Jumuisha README.md kamili
3. Ongeza maoni kwenye mafaili ya usanidi
4. Jaribu kwa kina kabla ya kuwasilisha
5. Jumuisha makadirio ya gharama na mahitaji ya awali

### Muundo wa Mfano wa Kiolezo
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

**Ushauri wa Pro**: Anza na mfano rahisi unaolingana na stack yako ya teknolojia, kisha polepole jenga hadi kwenye matukio magumu zaidi. Kila mfano unaendeleza dhana kutoka kwa yale ya awali!

## 🚀 Tayari Kuanza?

### Njia Yako ya Kujifunza

1. **Mwanzo Kabisa?** → Anza na [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 mins)
2. **Una Ujuzi wa Msingi wa AZD?** → Jaribu [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 mins)
3. **Unajenga Programu za AI?** → Anza na [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 mins) au chunguza [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, zaidi ya 2 saa)
4. **Unahitaji Stack Maalum la Teknolojia?** → Tumia sehemu ya [Kupata Mfano Sahihi](#-finding-the-right-example) hapo juu

### Hatua Zifuatazo

- ✅ Angalia [Mahitaji ya awali](#prerequisites) hapo juu
- ✅ Chagua mfano unaolingana na kiwango chako cha ujuzi (tazama [Mwongozo wa Ugumu](#kielezo-cha-upimaji-wa-ugumu))
- ✅ Soma README ya mfano kwa kina kabla ya kuendesha
- ✅ Weka ukumbusho wa kuendesha `azd down` baada ya kujaribu
- ✅ Shiriki uzoefu wako kupitia GitHub Issues au Discussions

### Unahitaji Msaada?

- 📖 [FAQ](../resources/faq.md) - Maswali ya kawaida yanayojibiwa
- 🐛 [Troubleshooting Guide](../docs/chapter-07-troubleshooting/common-issues.md) - Tatua matatizo ya uanzishaji
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Uliza jamii
- 📚 [Study Guide](../resources/study-guide.md) - Imarisha ujifunzaji wako

---

**Urambazaji**
- **📚 Nyumba ya Kozi**: [AZD For Beginners](../README.md)
- **📖 Vifaa vya Kujifunzia**: [Study Guide](../resources/study-guide.md) | [Cheat Sheet](../resources/cheat-sheet.md) | [Glossary](../resources/glossary.md)
- **🔧 Rasilimali**: [FAQ](../resources/faq.md) | [Troubleshooting](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Imesasishwa Mwisho: Novemba 2025 | [Ripoti Matatizo](https://github.com/microsoft/AZD-for-beginners/issues) | [Changia Mifano](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Taarifa ya kutokuwajibika**:
Nyaraka hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kwa usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Nyaraka ya awali kwa lugha yake ya asili inapaswa kuchukuliwa kuwa chanzo cha mamlaka. Kwa habari muhimu, inapendekezwa kutumia tafsiri ya kitaalamu inayofanywa na binadamu. Hatuwajibiki kwa lolote la kutokuelewana au tafsiri potofu zitokanazo na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->