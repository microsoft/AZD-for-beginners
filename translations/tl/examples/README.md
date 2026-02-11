# Mga Halimbawa - Praktikal na Mga Template at Kumpigurasyon ng AZD

**Pag-aaral sa Pamamagitan ng Halimbawa - Inayos ayon sa Kabanata**
- **📚 Tahanan ng Kurso**: [AZD Para sa mga Nagsisimula](../README.md)
- **📖 Pagmamapa ng Kabanata**: Mga halimbawa inayos ayon sa antas ng pagkatuto
- **🚀 Lokal na Halimbawa**: [Solusyon na Retail Multi-Agent](retail-scenario.md)
- **🤖 Mga Panlabas na Halimbawa ng AI**: Mga link sa mga repositoryo ng Azure Samples

> **📍 MAHALAGA: Lokal vs Panlabas na Mga Halimbawa**  
> Naglalaman ang repositoryong ito ng **4 na kumpletong lokal na halimbawa** na may buong implementasyon:  
> - **Azure OpenAI Chat** (GPT-4 deployment na may chat interface)  
> - **Container Apps** (Simpleng Flask API + Microservices)  
> - **Database App** (Web + SQL Database)  
> - **Retail Multi-Agent** (Solusyong AI para sa Enterprise)  
>  
> Ang karagdagang mga halimbawa ay **panlabas na sanggunian** sa mga repositoryo ng Azure-Samples na maaari mong i-clone.

## Panimula

Nagbibigay ang direktoryong ito ng praktikal na mga halimbawa at sanggunian upang tulungan kang matutunan ang Azure Developer CLI sa pamamagitan ng hands-on na pagsasanay. Ang Retail Multi-Agent na senaryo ay isang kumpleto, production-ready na implementasyon na kasama sa repositoryong ito. Ang karagdagang mga halimbawa ay tumutukoy sa opisyal na Azure Samples na nagpapakita ng iba't ibang pattern ng AZD.

### Legend ng Antas ng Kahirapan

- ⭐ **Nagsisimula** - Mga pangunahing konsepto, isang serbisyo lang, 15-30 minuto
- ⭐⭐ **Intermediate** - Maramihang serbisyo, integrasyon ng database, 30-60 minuto
- ⭐⭐⭐ **Advanced** - Komplikadong arkitektura, AI integrasyon, 1-2 oras
- ⭐⭐⭐⭐ **Eksperto** - Production-ready, enterprise patterns, 2+ oras

## 🎯 Ano ang Nasa Repositoryong Ito

### ✅ Lokal na Implementasyon (Handang Gamitin)

#### [Aplikasyon ng Azure OpenAI Chat](azure-openai-chat/README.md) 🆕
**Kumpletong deployment ng GPT-4 na may chat interface na kasama sa repo na ito**

- **Lokasyon:** `examples/azure-openai-chat/`
- **Kompleksidad:** ⭐⭐ (Intermediate)
- **Kasama ang:**
  - Kumpletong Azure OpenAI deployment (GPT-4)
  - Python command-line na chat interface
  - Integrasyon sa Key Vault para sa secure na API keys
  - Mga Bicep template para sa imprastruktura
  - Pagsubaybay sa paggamit ng token at gastos
  - Paglilimita ng rate at paghawak ng mga error

**Mabilis na Simula:**
```bash
# Pumunta sa halimbawa
cd examples/azure-openai-chat

# I-deploy ang lahat
azd up

# I-install ang mga dependencies at magsimulang makipag-chat
pip install -r src/requirements.txt
python src/chat.py
```

**Mga Teknolohiya:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Mga Halimbawa ng Container App](container-app/README.md) 🆕
**Komprehensibong mga halimbawa ng deployment ng container ay kasama sa repo na ito**

- **Lokasyon:** `examples/container-app/`
- **Kompleksidad:** ⭐-⭐⭐⭐⭐ (Mula Nagsisimula hanggang Advanced)
- **Kasama ang:**
  - [Pangunahing Gabay](container-app/README.md) - Kumpletong overview ng mga deployment ng container
  - [Simpleng Flask API](../../../examples/container-app/simple-flask-api) - Halimbawang basic na REST API
  - [Arkitektura ng Microservices](../../../examples/container-app/microservices) - Production-ready na multi-service deployment
  - Mabilis na Simula, Production, at Advanced na mga pattern
  - Monitoring, seguridad, at pag-optimize ng gastos

**Mabilis na Simula:**
```bash
# Tingnan ang pangunahing gabay
cd examples/container-app

# I-deploy ang simpleng Flask na API
cd simple-flask-api
azd up

# I-deploy ang halimbawa ng mga microservices
cd ../microservices
azd up
```

**Mga Teknolohiya:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Solusyon na Retail Multi-Agent](retail-scenario.md) 🆕
**Kumpletong production-ready na implementasyon na kasama sa repo na ito**

- **Lokasyon:** `examples/retail-multiagent-arm-template/`
- **Kompleksidad:** ⭐⭐⭐⭐ (Advanced)
- **Kasama ang:**
  - Kumpletong ARM deployment template
  - Multi-agent na arkitektura (Customer + Inventory)
  - Integrasyon ng Azure OpenAI
  - AI Search na may RAG
  - Komprehensibong monitoring
  - One-click deployment script

**Mabilis na Simula:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Mga Teknolohiya:** Azure OpenAI, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Panlabas na Azure Samples (I-clone para Gamitin)

Ang mga sumusunod na halimbawa ay pinangangasiwaan sa opisyal na mga repositoryo ng Azure-Samples. I-clone ang mga ito upang tuklasin ang iba't ibang pattern ng AZD:

### Mga Simpleng Aplikasyon (Kabanata 1-2)

| Template | Repository | Kompleksidad | Mga Serbisyo |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Lokal: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Lokal: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-service, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Paano Gamitin:**
```bash
# Kopyahin ang anumang halimbawa
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# I-deploy
azd up
```

### Mga Halimbawa ng AI Application (Kabanata 2, 5, 8)

| Template | Repository | Kompleksidad | Pokus |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI Chat** | [Lokal: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | GPT-4 deployment |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Basic AI chat |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agent framework |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG pattern |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Enterprise AI |

### Database & Mga Advanced na Pattern (Kabanata 3-8)

| Template | Repository | Kompleksidad | Pokus |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Database integration |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-service |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Mga Layunin sa Pagkatuto

Sa pamamagitan ng pagtrabaho sa mga halimbawang ito, ikaw ay:
- Magsanay ng mga workflow ng Azure Developer CLI gamit ang mga realistic na senaryo ng aplikasyon
- Mauunawaan ang iba't ibang arkitektura ng aplikasyon at ang kanilang mga azd na implementasyon
- Mamahusay sa Infrastructure as Code na mga pattern para sa iba't ibang Azure services
- Mag-aapply ng configuration management at mga deployment strategy na nakalaan sa iba't ibang environment
- Magpapatupad ng monitoring, seguridad, at scaling na mga pattern sa praktikal na konteksto
- Makakakuha ng karanasan sa troubleshooting at pag-debug ng mga totoong senaryo ng deployment

## Mga Kinalabasan ng Pagkatuto

Sa pagkumpleto ng mga halimbawang ito, magagawa mong:
- Mag-deploy ng iba't ibang uri ng aplikasyon gamit ang Azure Developer CLI nang may kumpiyansa
- Iangkop ang mga ibinigay na template sa iyong sariling mga kahilingan ng aplikasyon
- Magdisenyo at magpatupad ng custom na mga pattern ng imprastruktura gamit ang Bicep
- I-configure ang kumplikadong multi-service na mga aplikasyon na may tamang dependencies
- Mag-apply ng mga best practice sa seguridad, monitoring, at performance sa mga totoong senaryo
- Mag-troubleshoot at mag-optimize ng mga deployment batay sa praktikal na karanasan

## Istruktura ng Direktoryo

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

## Mga Mabilis na Halimbawa para Makapagsimula

> **💡 Bago sa AZD?** Magsimula sa halimbawa #1 (Flask API) - tumatagal ng ~20 minuto at nagtuturo ng mga pangunahing konsepto.

### Para sa mga Nagsisimula
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Lokal) ⭐  
   I-deploy ang isang simpleng REST API na may scale-to-zero  
   **Oras:** 20-25 minuto | **Gastos:** $0-5/buwan  
   **Matututuhan mo:** Pangunahing azd workflow, containerization, health probes  
   **Inaasahang Resulta:** Gumaganang API endpoint na nagbabalik ng "Hello, World!" na may monitoring

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   I-deploy ang isang Node.js Express web application na may MongoDB  
   **Oras:** 25-35 minuto | **Gastos:** $10-30/buwan  
   **Matututuhan mo:** Integrasyon ng database, environment variables, connection strings  
   **Inaasahang Resulta:** Todo list app na may create/read/update/delete functionality

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   I-host ang isang React static website gamit ang Azure Static Web Apps  
   **Oras:** 20-30 minuto | **Gastos:** $0-10/buwan  
   **Matututuhan mo:** Static hosting, serverless functions, CDN deployment  
   **Inaasahang Resulta:** React UI na may API backend, automatic SSL, global CDN

### Para sa mga Intermediate na Gumagamit
4. **[Azure OpenAI Chat Application](../../../examples/azure-openai-chat)** (Lokal) ⭐⭐  
   I-deploy ang GPT-4 na may chat interface at secure na pamamahala ng API key  
   **Oras:** 35-45 minuto | **Gastos:** $50-200/buwan  
   **Matututuhan mo:** Azure OpenAI deployment, integrasyon ng Key Vault, token tracking  
   **Inaasahang Resulta:** Gumaganang chat application na may GPT-4 at monitoring ng gastos

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Lokal) ⭐⭐⭐⭐  
   Production-ready na multi-service na arkitektura  
   **Oras:** 45-60 minuto | **Gastos:** $50-150/buwan  
   **Matututuhan mo:** Komunikasyon ng serbisyo, message queuing, distributed tracing  
   **Inaasahang Resulta:** 2-service na sistema (API Gateway + Product Service) na may monitoring

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Web application na may C# API at Azure SQL Database  
   **Oras:** 30-45 minuto | **Gastos:** $20-80/buwan  
   **Matututuhan mo:** Entity Framework, database migrations, connection security  
   **Inaasahang Resulta:** C# API na may Azure SQL backend, automatic schema deployment

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions na may HTTP triggers at Cosmos DB  
   **Oras:** 30-40 minuto | **Gastos:** $10-40/buwan  
   **Matututuhan mo:** Event-driven na arkitektura, serverless scaling, NoSQL integration  
   **Inaasahang Resulta:** Function app na tumutugon sa HTTP requests na may Cosmos DB storage

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Multi-service na Java application na may Container Apps at API gateway  
   **Oras:** 60-90 minuto | **Gastos:** $80-200/buwan  
   **Matututuhan mo:** Spring Boot deployment, service mesh, load balancing  
   **Inaasahang Resulta:** Multi-service Java system na may service discovery at routing

### Microsoft Foundry Templates

1. **[Azure OpenAI Chat App - Lokal na Halimbawa](../../../examples/azure-openai-chat)** ⭐⭐  
   Kumpletong GPT-4 deployment na may chat interface  
   **Oras:** 35-45 minuto | **Gastos:** $50-200/buwan  
   **Inaasahang Resulta:** Gumaganang chat application na may token tracking at monitoring ng gastos

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Intelligent chat application na may RAG architecture  
   **Oras:** 60-90 minuto | **Gastos:** $100-300/buwan  
   **Inaasahang Resulta:** RAG-powered chat interface na may document search at citations

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Pagsusuri ng dokumento gamit ang Azure AI services  
   **Oras:** 40-60 minuto | **Gastos:** $20-80/buwan  
   **Inaasahang Resulta:** API na nag-eextract ng text, tables, at entities mula sa mga in-upload na dokumento

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps workflow gamit ang Azure Machine Learning  
   **Oras:** 2-3 oras | **Gastos:** $150-500/buwan  
   **Inaasahang Resulta:** Automated ML pipeline na may training, deployment, at monitoring

### Mga Tunay na Senaryo

#### **Solusyon na Retail Multi-Agent** 🆕
**[Kompletong Gabay sa Implementasyon](./retail-scenario.md)**

Isang komprehensibo, production-ready na multi-agent customer support solution na nagpapakita ng enterprise-grade na deployment ng AI application gamit ang AZD. Nagbibigay ang senaryong ito ng:

- **Kumpletong Arkitektura**: Multi-agent na sistema na may mga espesyal na agent para sa customer service at pamamahala ng imbentaryo
- **Production Infrastructure**: Multi-region Azure OpenAI deployments, AI Search, Container Apps, and comprehensive monitoring
- **Ready-to-Deploy ARM Template**: One-click deployment with multiple configuration modes (Minimal/Standard/Premium)
- **Advanced Features**: Red teaming security validation, agent evaluation framework, cost optimization, and troubleshooting guides
- **Real Business Context**: Retailer customer support use case with file uploads, search integration, and dynamic scaling

**Technologies**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Complexity**: ⭐⭐⭐⭐ (Advanced - Enterprise Production Ready)

**Perfect for**: AI developers, solution architects, and teams building production multi-agent systems

**Quick Start**: Deploy the complete solution in under 30 minutes using the included ARM template with `./deploy.sh -g myResourceGroup`

## 📋 Mga Tagubilin sa Paggamit

### Mga Kinakailangan

Bago patakbuhin ang anumang halimbawa:
- ✅ Azure subscription na may access na Owner o Contributor
- ✅ Naka-install ang Azure Developer CLI ([Gabay sa Pag-install](../docs/chapter-01-foundation/installation.md))
- ✅ Naka-run ang Docker Desktop (para sa mga halimbawa ng container)
- ✅ Angkop na Azure quotas (tingnan ang mga kinakailangan para sa bawat halimbawa)

> **💰 Babala sa Gastos:** Lahat ng halimbawa ay lumilikha ng totoong Azure resources na nagdudulot ng singil. Tingnan ang indibidwal na mga README file para sa mga pagtatantya ng gastos. Tandaan na patakbuhin ang `azd down` kapag tapos na upang maiwasan ang patuloy na singil.

### Pagpapatakbo ng Mga Halimbawa Nang Lokal

1. **I-clone o Kopyahin ang Halimbawa**
   ```bash
   # Pumunta sa nais na halimbawa
   cd examples/simple-web-app
   ```

2. **I-initialize ang AZD Environment**
   ```bash
   # I-initialize gamit ang umiiral na template
   azd init
   
   # O lumikha ng bagong kapaligiran
   azd env new my-environment
   ```

3. **I-configure ang Environment**
   ```bash
   # Itakda ang mga kinakailangang variable
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **I-deploy**
   ```bash
   # I-deploy ang imprastraktura at ang aplikasyon
   azd up
   ```

5. **I-verify ang Deployment**
   ```bash
   # Kunin ang mga endpoint ng serbisyo
   azd env get-values
   
   # Subukan ang endpoint (halimbawa)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Mga Inaasahang Tanda ng Tagumpay:**
   - ✅ `azd up` completes without errors
   - ✅ Nagbabalik ang endpoint ng serbisyo ng HTTP 200
   - ✅ Ipinapakita ng Azure Portal ang status na "Running"
   - ✅ Tumatanggap ang Application Insights ng telemetry

> **⚠️ May problema?** Tingnan ang [Karaniwang Mga Isyu](../docs/chapter-07-troubleshooting/common-issues.md) para sa pag-troubleshoot ng deployment

### Pag-aangkop ng Mga Halimbawa

Bawat halimbawa ay may kasamang:
- **README.md** - Detalyadong mga tagubilin sa pag-setup at pag-customize
- **azure.yaml** - AZD configuration na may mga komento
- **infra/** - Mga Bicep template na may mga paliwanag ng parameter
- **src/** - Halimbawang code ng aplikasyon
- **scripts/** - Mga helper script para sa karaniwang gawain

## 🎯 Mga Layunin sa Pagkatuto

### Mga Kategorya ng Halimbawa

#### **Mga Pangunahing Deployment**
- Single-service applications
- Simple infrastructure patterns
- Basic configuration management
- Cost-effective development setups

#### **Mga Advanced na Senaryo**
- Multi-service architectures
- Complex networking configurations
- Database integration patterns
- Security and compliance implementations

#### **Mga Pattern na Handang-Para-sa-Production**
- High availability configurations
- Monitoring and observability
- CI/CD integration
- Disaster recovery setups

## 📖 Mga Paglalarawan ng Halimbawa

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
**Location**: [Halimbawa Lokal](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**Technologies**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complexity**: Advanced  
**Concepts**: Multi-service architecture, service communication, message queuing, distributed tracing  
**Location**: [Halimbawa Lokal](../../../examples/container-app/microservices)

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

#### Azure OpenAI Chat App
**Technologies**: Azure OpenAI, Cognitive Search, App Service  
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

## 🛠 Mga Halimbawa ng Konfigurasyon

Ang `configurations/` directory ay naglalaman ng mga reusable na component:

### Mga Konfigurasyon ng Environment
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

## 🔧 Gabay sa Pag-customize

### Pag-aangkop ng Mga Halimbawa para sa Iyong Use Case

1. **Suriin ang Mga Kinakailangan**
   - Suriin ang mga kinakailangan ng Azure service
   - Beripikahin ang mga limitasyon ng subscription
   - Unawain ang mga implikasyon sa gastos

2. **Baguhin ang Konfigurasyon**
   - I-update ang `azure.yaml` service definitions
   - I-customize ang mga Bicep template
   - I-adjust ang mga environment variables

3. **Subukan nang Mabuti**
   - I-deploy muna sa development environment
   - Beripikahin ang functionality
   - Subukan ang scaling at performance

4. **Pagsusuri sa Seguridad**
   - Suriin ang access controls
   - Ipatupad ang secrets management
   - I-enable ang monitoring at alerting

## 📊 Matriz ng Paghahambing

| Halimbawa | Mga Serbisyo | Database | Awentikasyon | Pagmomonitor | Kakamplek-sidad |
|---------|----------|----------|------|------------|------------|
| **Azure OpenAI Chat** (Lokal) | 2 | ❌ | Key Vault | Buong | ⭐⭐ |
| **Python Flask API** (Lokal) | 1 | ❌ | Pangunahing | Buong | ⭐ |
| **Microservices** (Lokal) | 5+ | ✅ | Enterprise | Advanced | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Pangunahing | Pangunahing | ⭐ |
| React SPA + Functions | 3 | ✅ | Pangunahing | Buong | ⭐ |
| Python Flask Container | 2 | ❌ | Pangunahing | Buong | ⭐ |
| C# Web API + SQL | 2 | ✅ | Buong | Buong | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Buong | Buong | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Buong | Buong | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Buong | Buong | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Pangunahing | Buong | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Buong | Buong | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Lokal) | **8+** | **✅** | **Enterprise** | **Advanced** | **⭐⭐⭐⭐** |

## 🎓 Daan ng Pagkatuto

### Inirerekomendang Pagkakasunod-sunod

1. **Magsimula sa Simple Web App**
   - Matutunan ang mga pangunahing konsepto ng AZD
   - Unawain ang deployment workflow
   - Magpraktis ng environment management

2. **Subukang ang Static Website**
   - Siyasatin ang iba't ibang hosting options
   - Matutunan ang tungkol sa CDN integration
   - Unawain ang DNS configuration

3. **Lumipat sa Container App**
   - Matutunan ang mga pangunahing kaalaman sa containerization
   - Unawain ang mga konsepto ng scaling
   - Magpraktis gamit ang Docker

4. **Magdagdag ng Database Integration**
   - Matutunan ang provisioning ng database
   - Unawain ang connection strings
   - Magpraktis ng secrets management

5. **Siyasatin ang Serverless**
   - Unawain ang event-driven architecture
   - Matutunan ang tungkol sa triggers at bindings
   - Magpraktis gamit ang APIs

6. **Bumuo ng Microservices**
   - Matutunan ang service communication
   - Unawain ang distributed systems
   - Magpraktis ng mga komplikadong deployment

## 🔍 Paghahanap ng Tamang Halimbawa

### Ayon sa Technology Stack
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

### Ayon sa Pattern ng Arkitektura
- **Simple REST API**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Local)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Ayon sa Antas ng Kakompleksidad
- **Beginner**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Intermediate**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Advanced**: ML Pipeline
- **Enterprise Production-Ready**: [Microservices (Local)](../../../examples/container-app/microservices) (Multi-service with message queuing), **Retail Multi-Agent Solution** (Complete multi-agent system with ARM template deployment)

## 📚 Karagdagang Mga Mapagkukunan

### Mga Link sa Dokumentasyon
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Mga Halimbawa mula sa Komunidad
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App na may Node.js at PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web App na may C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Trabaho ng Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions gamit ang Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Pinakamahusay na Kasanayan
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Pag-aambag ng Mga Halimbawa

May kapaki-pakinabang na halimbawa ka bang ibabahagi? Malugod naming tinatanggap ang mga kontribusyon!

### Mga Patnubay sa Pagsumite
1. Sundin ang itinatag na istruktura ng direktoryo
2. Isama ang komprehensibong README.md
3. Magdagdag ng mga komento sa mga configuration file
4. Suriing mabuti bago isumite
5. Isama ang mga pagtataya ng gastos at mga kinakailangan

### Halimbawang Istruktura ng Template
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

**Pro Tip**: Magsimula sa pinakapayak na halimbawa na tumutugma sa iyong stack ng teknolohiya, pagkatapos unti-unting umakyat patungo sa mas kumplikadong mga senaryo. Bawat halimbawa ay bumubuo sa mga konsepto mula sa mga naunang mga halimbawa!

## 🚀 Handa Ka Na Bang Magsimula?

### Iyong Landas sa Pagkatuto

1. **Baguhan ka ba?** → Magsimula sa [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 min)
2. **May Batayang Kaalaman sa AZD?** → Subukan ang [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 min)
3. **Gumagawa ng AI Apps?** → Magsimula sa [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 min) o tuklasin ang [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ oras)
4. **Kailangan ng Espesipikong Tech Stack?** → Gamitin ang seksyong [Hanapin ang Tamang Halimbawa](../../../examples) sa itaas

### Mga Susunod na Hakbang

- ✅ Suriin ang [Mga Kinakailangan](../../../examples) sa itaas
- ✅ Pumili ng halimbawa na tumutugma sa iyong antas ng kasanayan (tingnan ang [Legend ng Antas ng Kahirapan](../../../examples))
- ✅ Basahin nang mabuti ang README ng halimbawa bago mag-deploy
- ✅ Mag-set ng paalala na patakbuhin ang `azd down` pagkatapos ng pagsubok
- ✅ Ibahagi ang iyong karanasan sa pamamagitan ng GitHub Issues o Discussions

### Kailangan ng Tulong?

- 📖 [FAQ](../resources/faq.md) - Mga karaniwang tanong na sinagot
- 🐛 [Gabay sa Pag-troubleshoot](../docs/chapter-07-troubleshooting/common-issues.md) - Ayusin ang mga isyu sa deployment
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Magtanong sa komunidad
- 📚 [Gabay sa Pag-aaral](../resources/study-guide.md) - Patibayin ang iyong pagkatuto

---

**Navigasyon**
- **📚 Tahanan ng Kurso**: [AZD Para sa mga Nagsisimula](../README.md)
- **📖 Mga Materyales sa Pag-aaral**: [Gabay sa Pag-aaral](../resources/study-guide.md) | [Cheat Sheet](../resources/cheat-sheet.md) | [Talahulugan](../resources/glossary.md)
- **🔧 Mga Mapagkukunan**: [FAQ](../resources/faq.md) | [Pag-troubleshoot](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Huling Na-update: Nobyembre 2025 | [Iulat ang Mga Isyu](https://github.com/microsoft/AZD-for-beginners/issues) | [Mag-ambag ng Mga Halimbawa](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Paunawa:
Isinalin ang dokumentong ito gamit ang serbisyong AI na pagsasalin [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami para sa katumpakan, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o kamalian. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na opisyal na pinagkukunan. Para sa kritikal na impormasyon, inirerekomenda ang propesyonal na pagsasaling-tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na magmumula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->