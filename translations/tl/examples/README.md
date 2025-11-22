<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "4a896781acb2a7bebb3c4c66c4f46e7f",
  "translation_date": "2025-11-22T10:04:10+00:00",
  "source_file": "examples/README.md",
  "language_code": "tl"
}
-->
# Mga Halimbawa - Praktikal na AZD Templates at Konfigurasyon

**Pag-aaral sa Pamamagitan ng Halimbawa - Inayos ayon sa Kabanata**
- **📚 Pahina ng Kurso**: [AZD Para sa Mga Baguhan](../README.md)
- **📖 Pagkakaugnay ng Kabanata**: Mga halimbawa na inayos ayon sa antas ng kahirapan
- **🚀 Lokal na Halimbawa**: [Retail Multi-Agent Solution](retail-scenario.md)
- **🤖 Panlabas na AI Halimbawa**: Mga link sa mga repository ng Azure Samples

> **📍 MAHALAGA: Lokal vs Panlabas na Halimbawa**  
> Ang repositoryong ito ay naglalaman ng **4 na kumpletong lokal na halimbawa** na may buong implementasyon:  
> - **Azure OpenAI Chat** (GPT-4 deployment na may chat interface)  
> - **Container Apps** (Simpleng Flask API + Microservices)  
> - **Database App** (Web + SQL Database)  
> - **Retail Multi-Agent** (Enterprise AI Solution)  
>  
> Ang karagdagang mga halimbawa ay **panlabas na mga sanggunian** sa mga repository ng Azure-Samples na maaari mong i-clone.

## Panimula

Ang direktoryong ito ay nagbibigay ng mga praktikal na halimbawa at sanggunian upang matulungan kang matutunan ang Azure Developer CLI sa pamamagitan ng aktwal na pagsasanay. Ang Retail Multi-Agent scenario ay isang kumpleto, handa-sa-produksyon na implementasyon na kasama sa repositoryong ito. Ang karagdagang mga halimbawa ay tumutukoy sa mga opisyal na Azure Samples na nagpapakita ng iba't ibang AZD patterns.

### Alamat ng Antas ng Kahirapan

- ⭐ **Baguhan** - Mga pangunahing konsepto, iisang serbisyo, 15-30 minuto
- ⭐⭐ **Panggitna** - Maramihang serbisyo, integrasyon ng database, 30-60 minuto
- ⭐⭐⭐ **Mataas na Antas** - Kumplikadong arkitektura, integrasyon ng AI, 1-2 oras
- ⭐⭐⭐⭐ **Dalubhasa** - Handa-sa-produksyon, enterprise patterns, 2+ oras

## 🎯 Ano ang Nasa Repositoryong Ito

### ✅ Lokal na Implementasyon (Handa nang Gamitin)

#### [Azure OpenAI Chat Application](azure-openai-chat/README.md) 🆕
**Kumpletong GPT-4 deployment na may kasamang chat interface sa repo na ito**

- **Lokasyon:** `examples/azure-openai-chat/`
- **Kahirapan:** ⭐⭐ (Panggitna)
- **Kasama:**
  - Kumpletong Azure OpenAI deployment (GPT-4)
  - Python command-line chat interface
  - Key Vault integration para sa secure na API keys
  - Bicep infrastructure templates
  - Pagsubaybay sa paggamit ng token at gastos
  - Rate limiting at error handling

**Mabilis na Simula:**
```bash
# Mag-navigate sa halimbawa
cd examples/azure-openai-chat

# I-deploy ang lahat
azd up

# I-install ang mga dependency at magsimulang makipag-chat
pip install -r src/requirements.txt
python src/chat.py
```

**Mga Teknolohiya:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Mga Halimbawa ng Container App](container-app/README.md) 🆕
**Komprehensibong halimbawa ng container deployment na kasama sa repo na ito**

- **Lokasyon:** `examples/container-app/`
- **Kahirapan:** ⭐-⭐⭐⭐⭐ (Baguhan hanggang Dalubhasa)
- **Kasama:**
  - [Master Guide](container-app/README.md) - Kompletong overview ng container deployments
  - [Simpleng Flask API](../../../examples/container-app/simple-flask-api) - Pangunahing REST API na halimbawa
  - [Microservices Architecture](../../../examples/container-app/microservices) - Handa-sa-produksyon na multi-service deployment
  - Mabilis na Simula, Produksyon, at Advanced na patterns
  - Monitoring, seguridad, at pag-optimize ng gastos

**Mabilis na Simula:**
```bash
# Tingnan ang pangunahing gabay
cd examples/container-app

# I-deploy ang simpleng Flask API
cd simple-flask-api
azd up

# I-deploy ang halimbawa ng microservices
cd ../microservices
azd up
```

**Mga Teknolohiya:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent Solution](retail-scenario.md) 🆕
**Kumpletong handa-sa-produksyon na implementasyon na kasama sa repo na ito**

- **Lokasyon:** `examples/retail-multiagent-arm-template/`
- **Kahirapan:** ⭐⭐⭐⭐ (Mataas na Antas)
- **Kasama:**
  - Kumpletong ARM deployment template
  - Multi-agent architecture (Customer + Inventory)
  - Azure OpenAI integration
  - AI Search gamit ang RAG
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

Ang mga sumusunod na halimbawa ay pinapanatili sa mga opisyal na repository ng Azure-Samples. I-clone ang mga ito upang tuklasin ang iba't ibang AZD patterns:

### Simpleng Aplikasyon (Kabanata 1-2)

| Template | Repository | Kahirapan | Mga Serbisyo |
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

| Template | Repository | Kahirapan | Pokus |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI Chat** | [Lokal: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | GPT-4 deployment |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Pangunahing AI chat |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agent framework |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG pattern |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Enterprise AI |

### Database at Advanced na Patterns (Kabanata 3-8)

| Template | Repository | Kahirapan | Pokus |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Integrasyon ng database |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-service |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Mga Layunin sa Pag-aaral

Sa pamamagitan ng pagtatrabaho sa mga halimbawang ito, ikaw ay:
- Magpapraktis ng Azure Developer CLI workflows gamit ang makatotohanang application scenarios
- Mauunawaan ang iba't ibang application architectures at ang kanilang azd implementations
- Magiging bihasa sa Infrastructure as Code patterns para sa iba't ibang Azure services
- Mag-aaplay ng configuration management at environment-specific deployment strategies
- Magpapatupad ng monitoring, seguridad, at scaling patterns sa praktikal na konteksto
- Magkakaroon ng karanasan sa troubleshooting at debugging ng mga aktwal na deployment scenarios

## Mga Resulta ng Pag-aaral

Pagkatapos makumpleto ang mga halimbawang ito, ikaw ay:
- Makakapag-deploy ng iba't ibang uri ng aplikasyon gamit ang Azure Developer CLI nang may kumpiyansa
- Makakapag-adapt ng mga ibinigay na template sa iyong sariling application requirements
- Makakapagdisenyo at makakapag-implement ng custom infrastructure patterns gamit ang Bicep
- Makakapag-configure ng kumplikadong multi-service applications na may tamang dependencies
- Makakapag-apply ng security, monitoring, at performance best practices sa mga aktwal na scenario
- Makakapag-troubleshoot at makakapag-optimize ng deployments batay sa praktikal na karanasan

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

## Mabilis na Halimbawa ng Simula

> **💡 Baguhan sa AZD?** Magsimula sa halimbawa #1 (Flask API) - tumatagal ng ~20 minuto at nagtuturo ng mga pangunahing konsepto.

### Para sa Mga Baguhan
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Lokal) ⭐  
   Mag-deploy ng simpleng REST API na may scale-to-zero  
   **Oras:** 20-25 minuto | **Gastos:** $0-5/buwan  
   **Matututunan Mo:** Pangunahing azd workflow, containerization, health probes  
   **Inaasahang Resulta:** Gumaganang API endpoint na nagbabalik ng "Hello, World!" na may monitoring

2. **[Simpleng Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Mag-deploy ng Node.js Express web application na may MongoDB  
   **Oras:** 25-35 minuto | **Gastos:** $10-30/buwan  
   **Matututunan Mo:** Integrasyon ng database, environment variables, connection strings  
   **Inaasahang Resulta:** Todo list app na may create/read/update/delete functionality

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Mag-host ng React static website gamit ang Azure Static Web Apps  
   **Oras:** 20-30 minuto | **Gastos:** $0-10/buwan  
   **Matututunan Mo:** Static hosting, serverless functions, CDN deployment  
   **Inaasahang Resulta:** React UI na may API backend, automatic SSL, global CDN

### Para sa Mga Intermediate na Gumagamit
4. **[Azure OpenAI Chat Application](../../../examples/azure-openai-chat)** (Lokal) ⭐⭐  
   Mag-deploy ng GPT-4 na may chat interface at secure API key management  
   **Oras:** 35-45 minuto | **Gastos:** $50-200/buwan  
   **Matututunan Mo:** Azure OpenAI deployment, Key Vault integration, token tracking  
   **Inaasahang Resulta:** Gumaganang chat application na may GPT-4 at cost monitoring

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Lokal) ⭐⭐⭐⭐  
   Handa-sa-produksyon na multi-service architecture  
   **Oras:** 45-60 minuto | **Gastos:** $50-150/buwan  
   **Matututunan Mo:** Service communication, message queuing, distributed tracing  
   **Inaasahang Resulta:** 2-service system (API Gateway + Product Service) na may monitoring

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Web application na may C# API at Azure SQL Database  
   **Oras:** 30-45 minuto | **Gastos:** $20-80/buwan  
   **Matututunan Mo:** Entity Framework, database migrations, connection security  
   **Inaasahang Resulta:** C# API na may Azure SQL backend, automatic schema deployment

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions na may HTTP triggers at Cosmos DB  
   **Oras:** 30-40 minuto | **Gastos:** $10-40/buwan  
   **Matututunan Mo:** Event-driven architecture, serverless scaling, NoSQL integration  
   **Inaasahang Resulta:** Function app na tumutugon sa HTTP requests na may Cosmos DB storage

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Multi-service Java application na may Container Apps at API gateway  
   **Oras:** 60-90 minuto | **Gastos:** $80-200/buwan  
   **Matututunan Mo:** Spring Boot deployment, service mesh, load balancing  
   **Inaasahang Resulta:** Multi-service Java system na may service discovery at routing

### Azure AI Foundry Templates

1. **[Azure OpenAI Chat App - Lokal na Halimbawa](../../../examples/azure-openai-chat)** ⭐⭐  
   Kumpletong GPT-4 deployment na may chat interface  
   **Oras:** 35-45 minuto | **Gastos:** $50-200/buwan  
   **Inaasahang Resulta:** Gumaganang chat application na may token tracking at cost monitoring

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Matalinong chat application na may RAG architecture  
   **Oras:** 60-90 minuto | **Gastos:** $100-300/buwan  
   **Inaasahang Resulta:** RAG-powered chat interface na may document search at citations

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Pagsusuri ng dokumento gamit ang Azure AI services  
   **Oras:** 40-60 minuto | **Gastos:** $20-80/buwan  
   **Inaasahang Resulta:** API na nag-eextract ng text, tables, at entities mula sa mga na-upload na dokumento

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps workflow gamit ang Azure Machine Learning  
   **Oras:** 2-3 oras | **Gastos:** $150-500/buwan  
   **Inaasahang Resulta:** Automated ML pipeline na may training, deployment, at monitoring

### Mga Real-World Scenario

#### **Retail Multi-Agent Solution** 🆕
**[Kumpletong Gabay sa Implementasyon](./retail-scenario.md)**

Isang komprehensibo, handa-sa-produksyon na multi-agent customer support solution na nagpapakita ng enterprise-grade AI application deployment gamit ang AZD. Ang scenario na ito ay nagbibigay ng:

- **Kumpletong Arkitektura**: Multi-agent system na may espesyal na customer service at inventory management agents
- **Imprastruktura ng Produksyon**: Multi-region Azure OpenAI deployments, AI Search, Container Apps, at komprehensibong monitoring
- **Handa nang I-deploy na ARM Template**: Isang click na deployment na may iba't ibang configuration modes (Minimal/Standard/Premium)
- **Mga Advanced na Tampok**: Red teaming security validation, agent evaluation framework, cost optimization, at troubleshooting guides
- **Tunay na Konteksto ng Negosyo**: Use case para sa customer support ng retailer na may file uploads, search integration, at dynamic scaling

**Mga Teknolohiya**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Kompleksidad**: ⭐⭐⭐⭐ (Advanced - Handa para sa Produksyon ng Enterprise)

**Perpekto para sa**: Mga AI developer, solution architects, at mga team na gumagawa ng production multi-agent systems

**Mabilis na Pagsisimula**: I-deploy ang kumpletong solusyon sa loob ng 30 minuto gamit ang kasamang ARM template sa `./deploy.sh -g myResourceGroup`

## 📋 Mga Tagubilin sa Paggamit

### Mga Kinakailangan

Bago patakbuhin ang anumang halimbawa:
- ✅ Azure subscription na may Owner o Contributor access
- ✅ Nakainstall ang Azure Developer CLI ([Installation Guide](../docs/getting-started/installation.md))
- ✅ Naka-on ang Docker Desktop (para sa mga halimbawa ng container)
- ✅ Angkop na Azure quotas (suriin ang mga kinakailangan sa bawat halimbawa)

> **💰 Babala sa Gastos:** Ang lahat ng mga halimbawa ay lumilikha ng mga totoong Azure resources na may kaukulang bayarin. Tingnan ang mga indibidwal na README files para sa mga pagtatantya ng gastos. Tandaan na patakbuhin ang `azd down` kapag tapos na upang maiwasan ang patuloy na gastos.

### Pagpapatakbo ng Mga Halimbawa sa Lokal

1. **I-clone o Kopyahin ang Halimbawa**
   ```bash
   # Mag-navigate sa nais na halimbawa
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
   # I-deploy ang imprastraktura at aplikasyon
   azd up
   ```

5. **I-verify ang Deployment**
   ```bash
   # Kunin ang mga endpoint ng serbisyo
   azd env get-values
   
   # Subukan ang endpoint (halimbawa)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Mga Inaasahang Palatandaan ng Tagumpay:**
   - ✅ Ang `azd up` ay natapos nang walang error
   - ✅ Ang service endpoint ay nagbabalik ng HTTP 200
   - ✅ Ang Azure Portal ay nagpapakita ng status na "Running"
   - ✅ Ang Application Insights ay tumatanggap ng telemetry

> **⚠️ Mga Isyu?** Tingnan ang [Common Issues](../docs/troubleshooting/common-issues.md) para sa pag-aayos ng deployment

### Pag-aangkop ng Mga Halimbawa

Ang bawat halimbawa ay naglalaman ng:
- **README.md** - Detalyadong setup at mga tagubilin sa pagpapasadya
- **azure.yaml** - AZD configuration na may mga komento
- **infra/** - Mga Bicep template na may mga paliwanag sa parameter
- **src/** - Sample na application code
- **scripts/** - Mga helper script para sa mga karaniwang gawain

## 🎯 Mga Layunin sa Pag-aaral

### Mga Kategorya ng Halimbawa

#### **Mga Pangunahing Deployment**
- Mga application na may iisang serbisyo
- Simpleng mga pattern ng imprastruktura
- Pangunahing pamamahala ng configuration
- Mga cost-effective na development setup

#### **Mga Advanced na Scenario**
- Mga arkitektura na may maraming serbisyo
- Mga komplikadong configuration ng networking
- Mga pattern ng integrasyon ng database
- Mga implementasyon ng seguridad at pagsunod

#### **Mga Pattern na Handa sa Produksyon**
- Mga configuration na may mataas na availability
- Monitoring at observability
- CI/CD integration
- Mga setup para sa disaster recovery

## 📖 Mga Deskripsyon ng Halimbawa

### Simple Web App - Node.js Express
**Mga Teknolohiya**: Node.js, Express, MongoDB, Container Apps  
**Kompleksidad**: Baguhan  
**Mga Konsepto**: Pangunahing deployment, REST API, integrasyon ng NoSQL database

### Static Website - React SPA
**Mga Teknolohiya**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Kompleksidad**: Baguhan  
**Mga Konsepto**: Static hosting, serverless backend, modernong web development

### Container App - Python Flask
**Mga Teknolohiya**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Kompleksidad**: Baguhan  
**Mga Konsepto**: Containerization, REST API, scale-to-zero, health probes, monitoring  
**Lokasyon**: [Local Example](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**Mga Teknolohiya**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Kompleksidad**: Advanced  
**Mga Konsepto**: Multi-service architecture, service communication, message queuing, distributed tracing  
**Lokasyon**: [Local Example](../../../examples/container-app/microservices)

### Database App - C# with Azure SQL
**Mga Teknolohiya**: C# ASP.NET Core, Azure SQL Database, App Service  
**Kompleksidad**: Intermediate  
**Mga Konsepto**: Entity Framework, database connections, web API development

### Serverless Function - Python Azure Functions
**Mga Teknolohiya**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Kompleksidad**: Intermediate  
**Mga Konsepto**: Event-driven architecture, serverless computing, full-stack development

### Microservices - Java Spring Boot
**Mga Teknolohiya**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Kompleksidad**: Intermediate  
**Mga Konsepto**: Microservices communication, distributed systems, enterprise patterns

### Mga Halimbawa ng Azure AI Foundry

#### Azure OpenAI Chat App
**Mga Teknolohiya**: Azure OpenAI, Cognitive Search, App Service  
**Kompleksidad**: Intermediate  
**Mga Konsepto**: RAG architecture, vector search, LLM integration

#### AI Document Processing
**Mga Teknolohiya**: Azure AI Document Intelligence, Storage, Functions  
**Kompleksidad**: Intermediate  
**Mga Konsepto**: Document analysis, OCR, data extraction

#### Machine Learning Pipeline
**Mga Teknolohiya**: Azure ML, MLOps, Container Registry  
**Kompleksidad**: Advanced  
**Mga Konsepto**: Model training, deployment pipelines, monitoring

## 🛠 Mga Halimbawa ng Configuration

Ang direktoryo ng `configurations/` ay naglalaman ng mga reusable na components:

### Mga Configuration ng Environment
- Mga setting ng development environment
- Mga configuration ng staging environment
- Mga configuration na handa sa produksyon
- Mga setup ng multi-region deployment

### Mga Bicep Modules
- Mga reusable na components ng imprastruktura
- Mga karaniwang pattern ng resources
- Mga template na pinatibay ang seguridad
- Mga configuration na optimized sa gastos

### Mga Helper Scripts
- Automation ng setup ng environment
- Mga script para sa database migration
- Mga tools para sa validation ng deployment
- Mga utilities para sa monitoring ng gastos

## 🔧 Gabay sa Pagpapasadya

### Pag-aangkop ng Mga Halimbawa para sa Iyong Gamit

1. **Suriin ang Mga Kinakailangan**
   - Suriin ang mga kinakailangan sa serbisyo ng Azure
   - I-verify ang mga limitasyon ng subscription
   - Unawain ang mga implikasyon sa gastos

2. **I-modify ang Configuration**
   - I-update ang `azure.yaml` service definitions
   - I-customize ang mga Bicep template
   - I-adjust ang mga environment variables

3. **Subukan nang Mabuti**
   - I-deploy muna sa development environment
   - I-validate ang functionality
   - Subukan ang scaling at performance

4. **Review ng Seguridad**
   - Suriin ang access controls
   - Magpatupad ng secrets management
   - I-enable ang monitoring at alerting

## 📊 Matrix ng Paghahambing

| Halimbawa | Mga Serbisyo | Database | Auth | Monitoring | Kompleksidad |
|-----------|--------------|----------|------|------------|--------------|
| **Azure OpenAI Chat** (Local) | 2 | ❌ | Key Vault | Full | ⭐⭐ |
| **Python Flask API** (Local) | 1 | ❌ | Basic | Full | ⭐ |
| **Microservices** (Local) | 5+ | ✅ | Enterprise | Advanced | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Basic | Basic | ⭐ |
| React SPA + Functions | 3 | ✅ | Basic | Full | ⭐ |
| Python Flask Container | 2 | ❌ | Basic | Full | ⭐ |
| C# Web API + SQL | 2 | ✅ | Full | Full | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Full | Full | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Full | Full | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Full | Full | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Basic | Full | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Full | Full | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Local) | **8+** | **✅** | **Enterprise** | **Advanced** | **⭐⭐⭐⭐** |

## 🎓 Landas ng Pag-aaral

### Inirerekomendang Progresyon

1. **Simulan sa Simple Web App**
   - Matutunan ang mga pangunahing konsepto ng AZD
   - Unawain ang workflow ng deployment
   - Magpraktis sa pamamahala ng environment

2. **Subukan ang Static Website**
   - Tuklasin ang iba't ibang opsyon sa hosting
   - Matutunan ang CDN integration
   - Unawain ang DNS configuration

3. **Lumipat sa Container App**
   - Matutunan ang mga pangunahing kaalaman sa containerization
   - Unawain ang mga konsepto ng scaling
   - Magpraktis gamit ang Docker

4. **Magdagdag ng Database Integration**
   - Matutunan ang database provisioning
   - Unawain ang connection strings
   - Magpraktis sa secrets management

5. **Tuklasin ang Serverless**
   - Unawain ang event-driven architecture
   - Matutunan ang tungkol sa triggers at bindings
   - Magpraktis gamit ang APIs

6. **Gumawa ng Microservices**
   - Matutunan ang service communication
   - Unawain ang distributed systems
   - Magpraktis sa mga komplikadong deployment

## 🔍 Paghahanap ng Tamang Halimbawa

### Ayon sa Teknolohiya
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

### Ayon sa Antas ng Kompleksidad
- **Baguhan**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Intermediate**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Advanced**: ML Pipeline
- **Handa sa Produksyon ng Enterprise**: [Microservices (Local)](../../../examples/container-app/microservices) (Multi-service na may message queuing), **Retail Multi-Agent Solution** (Kumpletong multi-agent system na may ARM template deployment)

## 📚 Karagdagang Resources

### Mga Link sa Dokumentasyon
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Mga Halimbawa ng Komunidad
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App gamit ang Node.js at PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)  
- [React Web App gamit ang C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)  
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)  
- [Azure Functions gamit ang Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)  

### Mga Best Practices  
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)  
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)  

## 🤝 Pag-aambag ng Mga Halimbawa  

May kapaki-pakinabang na halimbawa na maibabahagi? Malugod naming tinatanggap ang mga kontribusyon!  

### Mga Alituntunin sa Pagsusumite  
1. Sundin ang itinatag na istruktura ng direktoryo  
2. Isama ang detalyadong README.md  
3. Magdagdag ng mga komento sa mga configuration file  
4. Subukan nang mabuti bago magsumite  
5. Isama ang mga pagtatantya ng gastos at mga kinakailangan  

### Template ng Istruktura ng Halimbawa  
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

**Tip**: Magsimula sa pinakasimpleng halimbawa na tumutugma sa iyong teknolohiyang stack, pagkatapos ay unti-unting magtrabaho patungo sa mas kumplikadong mga senaryo. Ang bawat halimbawa ay bumubuo sa mga konsepto mula sa mga nauna!  

## 🚀 Handa Ka Na Ba?  

### Ang Iyong Landas sa Pag-aaral  

1. **Baguhan?** → Magsimula sa [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 minuto)  
2. **May Basic AZD Knowledge?** → Subukan ang [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 minuto)  
3. **Gumagawa ng AI Apps?** → Magsimula sa [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 minuto) o tuklasin ang [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ oras)  
4. **Kailangan ng Tiyak na Tech Stack?** → Gamitin ang [Finding the Right Example](../../../examples) na seksyon sa itaas  

### Mga Susunod na Hakbang  

- ✅ Suriin ang [Prerequisites](../../../examples) sa itaas  
- ✅ Pumili ng halimbawa na tumutugma sa iyong antas ng kasanayan (tingnan ang [Complexity Legend](../../../examples))  
- ✅ Basahin nang mabuti ang README ng halimbawa bago mag-deploy  
- ✅ Magtakda ng paalala upang patakbuhin ang `azd down` pagkatapos ng pagsubok  
- ✅ Ibahagi ang iyong karanasan sa pamamagitan ng GitHub Issues o Discussions  

### Kailangan ng Tulong?  

- 📖 [FAQ](../resources/faq.md) - Mga karaniwang tanong na nasagot  
- 🐛 [Troubleshooting Guide](../docs/troubleshooting/common-issues.md) - Ayusin ang mga isyu sa deployment  
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Magtanong sa komunidad  
- 📚 [Study Guide](../resources/study-guide.md) - Palakasin ang iyong pag-aaral  

---  

**Navigation**  
- **📚 Course Home**: [AZD For Beginners](../README.md)  
- **📖 Study Materials**: [Study Guide](../resources/study-guide.md) | [Cheat Sheet](../resources/cheat-sheet.md) | [Glossary](../resources/glossary.md)  
- **🔧 Resources**: [FAQ](../resources/faq.md) | [Troubleshooting](../docs/troubleshooting/common-issues.md)  

---  

*Huling Na-update: Nobyembre 2025 | [Iulat ang mga Isyu](https://github.com/microsoft/AZD-for-beginners/issues) | [Mag-ambag ng Mga Halimbawa](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*  

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Paunawa**:  
Ang dokumentong ito ay isinalin gamit ang AI translation service na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't sinisikap naming maging tumpak, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na opisyal na sanggunian. Para sa mahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na dulot ng paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->