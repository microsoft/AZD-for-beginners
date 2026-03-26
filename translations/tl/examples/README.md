# Mga Halimbawa - Praktikal na Mga Template at Konfigurasyon ng AZD

**Pagkatuto sa pamamagitan ng Halimbawa - Inayos ayon sa Kabanata**
- **📚 Course Home**: [AZD Para sa mga Baguhan](../README.md)
- **📖 Chapter Mapping**: Mga halimbawa na inayos ayon sa antas ng kahirapan
- **🚀 Local Example**: [Solusyong Retail Multi-Agent](retail-scenario.md)
- **🤖 External AI Examples**: Mga link sa mga repositoryo ng Azure Samples

> **📍 MAHALAGA: Lokal vs Panlabas na Mga Halimbawa**  
> Ang repositoryong ito ay naglalaman ng **4 kumpletong lokal na halimbawa** na may buong implementasyon:  
> - **Microsoft Foundry Models Chat** (gpt-4.1 deployment na may chat interface)  
> - **Container Apps** (Simpleng Flask API + Mga Microservice)  
> - **Database App** (Web + SQL Database)  
> - **Retail Multi-Agent** (Solusyon ng Enterprise AI)  
>  
> Ang mga karagdagang halimbawa ay **mga panlabas na reperensya** sa mga repositoryo ng Azure-Samples na maaari mong i-clone.

## Introduksyon

Ang direktoryong ito ay nagbibigay ng praktikal na mga halimbawa at reperensya upang tulungan kang matutunan ang Azure Developer CLI sa pamamagitan ng hands-on na pagsasanay. Ang Retail Multi-Agent scenario ay isang kumpleto, production-ready na implementasyon na kasama sa repositoryong ito. Ang mga karagdagang halimbawa ay tumutukoy sa opisyal na Azure Samples na nagpapakita ng iba't ibang mga pattern ng AZD.

### Legend ng Rating ng Kahirapan

- ⭐ **Baguhan** - Mga pangunahing konsepto, iisang serbisyo, 15-30 minuto
- ⭐⭐ **Gitnang Antas** - Maramihang serbisyo, integrasyon ng database, 30-60 minuto
- ⭐⭐⭐ **Mataas na Antas** - Kumplikadong arkitektura, integrasyon ng AI, 1-2 oras
- ⭐⭐⭐⭐ **Eksperto** - Production-ready, enterprise patterns, 2+ oras

## 🎯 Ano ang Nasa Repositoryong Ito

### ✅ Lokal na Implementasyon (Handa nang Gamitin)

#### [Microsoft Foundry Models Chat Application](azure-openai-chat/README.md) 🆕
**Kumpletong gpt-4.1 deployment na may chat interface na kasama sa repo na ito**

- **Lokasyon:** `examples/azure-openai-chat/`
- **Kumplikado:** ⭐⭐ (Gitnang Antas)
- **Kasama:**
  - Kumpletong pag-deploy ng Microsoft Foundry Models (gpt-4.1)
  - Python na command-line chat interface
  - Integrasyon ng Key Vault para sa ligtas na API keys
  - Mga Bicep infrastructure template
  - Pagsubaybay ng paggamit ng token at gastos
  - Rate limiting at paghawak ng mga error

**Mabilis na Pagsisimula:**
```bash
# Pumunta sa halimbawa
cd examples/azure-openai-chat

# I-deploy ang lahat
azd up

# I-install ang mga dependencies at magsimulang makipag-chat
pip install -r src/requirements.txt
python src/chat.py
```

**Mga Teknolohiya:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Container App Examples](container-app/README.md) 🆕
**Komprehensibong mga halimbawa ng pag-deploy ng container na kasama sa repo na ito**

- **Lokasyon:** `examples/container-app/`
- **Kumplikado:** ⭐-⭐⭐⭐⭐ (Mula Baguhan hanggang Mataas na Antas)
- **Kasama:**
  - [Pangkalahatang Gabay](container-app/README.md) - Kumpletong overview ng mga pag-deploy ng container
  - [Simpleng Flask API](../../../examples/container-app/simple-flask-api) - Simpleng halimbawa ng REST API
  - [Arkitektura ng Microservices](../../../examples/container-app/microservices) - Production-ready na multi-service deployment
  - Mabilis na Pagsisimula, Production, at Advanced na mga pattern
  - Pagmamanman, seguridad, at pag-optimize ng gastos

**Mabilis na Pagsisimula:**
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
**Kumpletong production-ready na implementasyon na kasama sa repo na ito**

- **Lokasyon:** `examples/retail-multiagent-arm-template/`
- **Kumplikado:** ⭐⭐⭐⭐ (Mataas na Antas)
- **Kasama:**
  - Kumpletong ARM deployment template
  - Multi-agent na arkitektura (Customer + Inventory)
  - Integrasyon ng Microsoft Foundry Models
  - AI Search na may RAG
  - Komprehensibong pagmamanman
  - One-click deployment script

**Mabilis na Pagsisimula:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Mga Teknolohiya:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Panlabas na Azure Samples (I-clone para Gamitin)

Ang mga sumusunod na halimbawa ay pinamamahalaan sa opisyal na mga repositoryo ng Azure-Samples. I-clone ang mga ito para tuklasin ang iba't ibang mga pattern ng AZD:

### Simpleng Mga Application (Kabanata 1-2)

| Template | Repository | Kahirapan | Mga Serbisyo |
|:---------|:-----------|:-----------|:-------------|
| **Python Flask API** | [Lokal: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Lokal: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Maramihang serbisyo, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Paano gamitin:**
```bash
# I-clone ang anumang halimbawa
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# I-deploy
azd up
```

### Mga Halimbawa ng AI Application (Kabanata 2, 5, 8)

| Template | Repository | Kahirapan | Pokus |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [Lokal: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 deployment |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Basic AI chat |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agent framework |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG pattern |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Enterprise AI |

### Database & Mga Advanced na Pattern (Kabanata 3-8)

| Template | Repository | Kahirapan | Pokus |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Integrasyon ng database |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Maramihang serbisyo |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Mga Layunin sa Pagkatuto

Sa pamamagitan ng pagtrabaho sa mga halimbawang ito, ikaw ay:
- Magpapraktis ng mga workflow ng Azure Developer CLI gamit ang makatotohanang mga senaryo ng aplikasyon
- Mauunawaan ang iba't ibang arkitektura ng aplikasyon at ang kanilang mga implementasyon sa azd
- Mamasters ang Infrastructure as Code na mga pattern para sa iba't ibang serbisyo ng Azure
- Mag-aaplay ng pamamahala ng konfigurasyon at mga estratehiya sa deployment na nakabatay sa environment
- Magpapatupad ng pagmamanman, seguridad, at mga pattern ng scaling sa mga praktikal na konteksto
- Magkakaroon ng karanasan sa troubleshooting at pag-debug ng mga totoong senaryo ng deployment

## Mga Kinalabasan ng Pagkatuto

Pagkatapos makumpleto ang mga halimbawang ito, magagawang mong:
- Mag-deploy ng iba't ibang uri ng aplikasyon gamit ang Azure Developer CLI nang may kumpiyansa
- Iangkop ang mga ipinakitang template sa iyong sariling mga kinakailangan sa aplikasyon
- Magdisenyo at magpatupad ng mga custom na infrastructure pattern gamit ang Bicep
- I-configure ang kumplikadong mga multi-service na aplikasyon na may tamang dependencies
- Mag-apply ng pinakamahusay na kasanayan sa seguridad, pagmamanman, at performance sa mga totoong senaryo
- Magsagawa ng troubleshooting at pag-optimize ng mga deployment batay sa praktikal na karanasan

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

## Mabilis na Mga Halimbawa para sa Pagsisimula

> **💡 Bago sa AZD?** Magsimula sa halimbawa #1 (Flask API) - tumatagal ng ~20 minuto at itinuturo ang mga pangunahing konsepto.

### Para sa mga Baguhan
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Lokal) ⭐  
   I-deploy ang isang simpleng REST API na may scale-to-zero  
   **Oras:** 20-25 minuto | **Gastos:** $0-5/buwan  
   **Matututuhan Mo:** Pangunahing azd workflow, containerization, health probes  
   **Inaasahang Resulta:** Gumagamit na API endpoint na nagbabalik ng "Hello, World!" na may pagmamanman

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   I-deploy ang isang Node.js Express web application kasama ang MongoDB  
   **Oras:** 25-35 minuto | **Gastos:** $10-30/buwan  
   **Matututuhan Mo:** Integrasyon ng database, environment variables, connection strings  
   **Inaasahang Resulta:** Todo list app na may create/read/update/delete na functionality

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   I-host ang isang React static website gamit ang Azure Static Web Apps  
   **Oras:** 20-30 minuto | **Gastos:** $0-10/buwan  
   **Matututuhan Mo:** Static hosting, serverless functions, CDN deployment  
   **Inaasahang Resulta:** React UI na may API backend, automatic SSL, global CDN

### Para sa Mga Gitnang Antas na Gumagamit
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (Lokal) ⭐⭐  
   I-deploy ang gpt-4.1 na may chat interface at secure na pamamahala ng API key  
   **Oras:** 35-45 minuto | **Gastos:** $50-200/buwan  
   **Matututuhan Mo:** Pag-deploy ng Microsoft Foundry Models, integrasyon ng Key Vault, pagsubaybay ng token  
   **Inaasahang Resulta:** Gumaganang chat application na may gpt-4.1 at pagmamanman ng gastos

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Lokal) ⭐⭐⭐⭐  
   Production-ready na multi-service na arkitektura  
   **Oras:** 45-60 minuto | **Gastos:** $50-150/buwan  
   **Matututuhan Mo:** Komunikasyon ng serbisyo, message queuing, distributed tracing  
   **Inaasahang Resulta:** 2-service na sistema (API Gateway + Product Service) na may pagmamanman

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Web application na may C# API at Azure SQL Database  
   **Oras:** 30-45 minuto | **Gastos:** $20-80/buwan  
   **Matututuhan Mo:** Entity Framework, database migrations, security ng koneksyon  
   **Inaasahang Resulta:** C# API na may Azure SQL backend, automatic schema deployment

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions na may HTTP triggers at Cosmos DB  
   **Oras:** 30-40 minuto | **Gastos:** $10-40/buwan  
   **Matututuhan Mo:** Event-driven architecture, serverless scaling, NoSQL integration  
   **Inaasahang Resulta:** Function app na tumutugon sa HTTP requests na may Cosmos DB storage

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Multi-service Java application na may Container Apps at API gateway  
   **Oras:** 60-90 minuto | **Gastos:** $80-200/buwan  
   **Matututuhan Mo:** Pag-deploy ng Spring Boot, service mesh, load balancing  
   **Inaasahang Resulta:** Multi-service Java system na may service discovery at routing

### Mga Template ng Microsoft Foundry

1. **[Microsoft Foundry Models Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   Kumpletong gpt-4.1 deployment na may chat interface  
   **Oras:** 35-45 minuto | **Gastos:** $50-200/buwan  
   **Inaasahang Resulta:** Gumaganang chat application na may pagsubaybay ng token at pagmamanman ng gastos

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Intelligent chat application na may RAG architecture  
   **Oras:** 60-90 minuto | **Gastos:** $100-300/buwan  
   **Inaasahang Resulta:** RAG-powered chat interface na may document search at citations

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Pagsusuri ng dokumento gamit ang Azure AI services  
   **Oras:** 40-60 minuto | **Gastos:** $20-80/buwan  
   **Inaasahang Resulta:** API na nag-eextract ng teksto, mga talahanayan, at mga entity mula sa na-upload na mga dokumento

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps workflow gamit ang Azure Machine Learning  
   **Oras:** 2-3 oras | **Gastos:** $150-500/buwan  
   **Inaasahang Resulta:** Automated ML pipeline na may training, deployment, at pagmamanman

### Mga Tunay na Senaryo

#### **Retail Multi-Agent Solution** 🆕  
**[Kumpletong Gabay sa Implementasyon](./retail-scenario.md)**

Isang komprehensibo, production-ready na multi-agent na solusyon para sa customer support na nagpapakita ng enterprise-grade na pag-deploy ng AI application gamit ang AZD. Ang senaryong ito ay nagbibigay ng:
- **Kompletong Arkitektura**: Multi-agent system na may mga espesyal na ahente para sa customer service at pamamahala ng imbentaryo
- **Production Infrastructure**: Multi-region Microsoft Foundry Models deployments, AI Search, Container Apps, at komprehensibong monitoring
- **Ready-to-Deploy ARM Template**: One-click deployment with multiple configuration modes (Minimal/Standard/Premium)
- **Advanced Features**: Red teaming security validation, agent evaluation framework, cost optimization, at troubleshooting guides
- **Real Business Context**: Retailer customer support use case na may file uploads, search integration, at dynamic scaling

**Technologies**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Complexity**: ⭐⭐⭐⭐ (Advanced - Handa para sa Produksyon ng Enterprise)

**Perpekto para sa**: AI developers, solution architects, at mga koponan na bumubuo ng production multi-agent systems

**Mabilis na Simula**: I-deploy ang kompletong solusyon sa loob ng 30 minuto gamit ang kasamang ARM template gamit ang `./deploy.sh -g myResourceGroup`

## 📋 Mga Tagubilin sa Paggamit

### Mga Kinakailangan

Bago patakbuhin ang anumang halimbawa:
- ✅ Azure subscription na may Owner o Contributor access
- ✅ Azure Developer CLI installed ([Gabay sa Pag-install](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop na tumatakbo (para sa mga halimbawa ng container)
- ✅ Angkop na Azure quotas (suriin ang mga example-specific na kinakailangan)

> **💰 Babala sa Gastos:** Lahat ng halimbawa ay lumilikha ng totoong Azure resources na may kaukulang singil. Tingnan ang mga indibidwal na README files para sa mga estimate ng gastos. Tandaan na patakbuhin ang `azd down` kapag tapos na upang maiwasan ang patuloy na singil.

### Pagpapatakbo ng Mga Halimbawa Nang Lokal

1. **I-clone o Kopyahin ang Halimbawa**
   ```bash
   # Pumunta sa nais na halimbawa
   cd examples/simple-web-app
   ```

2. **I-initialize ang AZD na Kapaligiran**
   ```bash
   # Simulan gamit ang umiiral na template
   azd init
   
   # O lumikha ng bagong kapaligiran
   azd env new my-environment
   ```

3. **I-configure ang Kapaligiran**
   ```bash
   # Itakda ang mga kinakailangang variable
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Mag-deploy**
   ```bash
   # I-deploy ang imprastruktura at ang aplikasyon
   azd up
   ```

5. **Suriin ang Deployment**
   ```bash
   # Kunin ang mga endpoint ng serbisyo
   azd env get-values
   
   # Subukan ang endpoint (halimbawa)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Mga Inaasahang Palatandaan ng Tagumpay:**
   - ✅ `azd up` kumpleto nang walang errors
   - ✅ Ang service endpoint ay nagbabalik ng HTTP 200
   - ✅ Azure Portal nagpapakita ng "Running" na status
   - ✅ Application Insights tumatanggap ng telemetry

> **⚠️ May Problema?** Tingnan ang [Pangkaraniwang Mga Isyu](../docs/chapter-07-troubleshooting/common-issues.md) para sa troubleshooting ng deployment

### Pagsasaayos ng Mga Halimbawa

Bawat halimbawa ay may kasamang:
- **README.md** - Detalyadong setup at mga tagubilin sa customisasi
- **azure.yaml** - AZD configuration na may mga komento
- **infra/** - Mga Bicep template na may paliwanag sa mga parameter
- **src/** - Sample application code
- **scripts/** - Mga helper script para sa mga karaniwang gawain

## 🎯 Mga Layunin sa Pagkatuto

### Mga Kategorya ng Halimbawa

#### **Mga Pangunahing Deployment**
- Mga aplikasyon na may iisang serbisyo
- Simpleng mga pattern ng imprastruktura
- Pangunahing pamamahala ng konfigurasyon
- Abot-kayang mga setup para sa pag-develop

#### **Mga Advanced na Senaryo**
- Mga arkitekturang may maraming serbisyo
- Komplek­s na konfigurasyon ng networking
- Mga pattern ng integrasyon ng database
- Mga implementasyon ng seguridad at pagsunod

#### **Mga Pattern na Handa para sa Produksyon**
- Mga configuration para sa mataas na availability
- Monitoring at observability
- CI/CD integration
- Mga setup para sa disaster recovery

## 📖 Mga Paglalarawan ng Halimbawa

### Simpleng Web App - Node.js Express
**Technologies**: Node.js, Express, MongoDB, Container Apps  
**Complexity**: Baguhan  
**Mga Konsepto**: Pangunahing deployment, REST API, NoSQL database integration

### Static na Website - React SPA
**Technologies**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complexity**: Baguhan  
**Mga Konsepto**: Static hosting, serverless backend, modern web development

### Container App - Python Flask
**Technologies**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Complexity**: Baguhan  
**Mga Konsepto**: Containerization, REST API, scale-to-zero, health probes, monitoring  
**Lokasyon**: [Local Example](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**Technologies**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complexity**: Advanced  
**Mga Konsepto**: Multi-service architecture, service communication, message queuing, distributed tracing  
**Lokasyon**: [Local Example](../../../examples/container-app/microservices)

### Database App - C# with Azure SQL
**Technologies**: C# ASP.NET Core, Azure SQL Database, App Service  
**Complexity**: Intermediate  
**Mga Konsepto**: Entity Framework, database connections, web API development

### Serverless Function - Python Azure Functions
**Technologies**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complexity**: Intermediate  
**Mga Konsepto**: Event-driven architecture, serverless computing, full-stack development

### Microservices - Java Spring Boot
**Technologies**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Complexity**: Intermediate  
**Mga Konsepto**: Microservices communication, distributed systems, enterprise patterns

### Microsoft Foundry Examples

#### Microsoft Foundry Models Chat App
**Technologies**: Microsoft Foundry Models, Cognitive Search, App Service  
**Complexity**: Intermediate  
**Mga Konsepto**: RAG architecture, vector search, LLM integration

#### AI Document Processing
**Technologies**: Azure AI Document Intelligence, Storage, Functions  
**Complexity**: Intermediate  
**Mga Konsepto**: Document analysis, OCR, data extraction

#### Machine Learning Pipeline
**Technologies**: Azure ML, MLOps, Container Registry  
**Complexity**: Advanced  
**Mga Konsepto**: Model training, deployment pipelines, monitoring

## 🛠 Mga Halimbawa ng Konfigurasyon

Ang `configurations/` directory ay naglalaman ng mga reusable na component:

### Environment Configurations
- Mga setting para sa development environment
- Mga konfigurasyon para sa staging environment
- Mga configuration na handa para sa production
- Mga setup para sa multi-region deployment

### Mga Module ng Bicep
- Mga reusable na component ng imprastruktura
- Karaniwang mga pattern ng resource
- Mga security-hardened na template
- Mga cost-optimized na konfigurasyon

### Mga Helper Script
- Automation para sa environment setup
- Mga script para sa database migration
- Mga tool para sa deployment validation
- Mga utility para sa cost monitoring

## 🔧 Gabay sa Pag-customize

### Pagsasaayos ng Mga Halimbawa para sa Iyong Kaso ng Paggamit

1. **Suriin ang Mga Kinakailangan**
   - Suriin ang mga kinakailangan ng Azure service
   - Beripikahin ang mga limitasyon ng subscription
   - Unawain ang mga implikasyon sa gastos

2. **Baguhin ang Konfigurasyon**
   - I-update ang `azure.yaml` service definitions
   - I-customize ang mga Bicep template
   - I-adjust ang mga environment variables

3. **Subukan nang Mabuti**
   - Mag-deploy sa development environment muna
   - Beripikahin ang functionality
   - Subukan ang scaling at performance

4. **Pagrepaso ng Seguridad**
   - Suriin ang mga access control
   - Ipatupad ang secrets management
   - I-enable ang monitoring at alerting

## 📊 Matriks ng Paghahambing

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

## 🎓 Landas ng Pagkatuto

### Inirekumendang Pagkakasunod-sunod

1. **Magsimula sa Simpleng Web App**
   - Matutunan ang mga pangunahing konsepto ng AZD
   - Unawain ang deployment workflow
   - Magpraktis ng environment management

2. **Subukan ang Static Website**
   - Tuklasin ang iba't ibang hosting options
   - Matutunan ang tungkol sa CDN integration
   - Unawain ang DNS configuration

3. **Lumipat sa Container App**
   - Matutunan ang mga batayan ng containerization
   - Unawain ang mga konsepto ng scaling
   - Magpraktis gamit ang Docker

4. **Magdagdag ng Database Integration**
   - Matutunan ang provisioning ng database
   - Unawain ang connection strings
   - Magpraktis ng secrets management

5. **Suriin ang Serverless**
   - Unawain ang event-driven architecture
   - Matutunan ang tungkol sa triggers at bindings
   - Magpraktis sa mga API

6. **Bumuo ng Microservices**
   - Matutunan ang service communication
   - Unawain ang distributed systems
   - Magpraktis ng mga kompleks na deployment

## 🔍 Paghahanap ng Tamang Halimbawa

### Ayon sa Technology Stack
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

### Ayon sa Pattern ng Arkitektura
- **Simple REST API**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Local)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Ayon sa Antas ng Kahirapan
- **Baguhan**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Intermediate**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **Advanced**: ML Pipeline
- **Enterprise Production-Ready**: [Microservices (Local)](../../../examples/container-app/microservices) (Multi-service with message queuing), **Retail Multi-Agent Solution** (Kompletong multi-agent system na may ARM template deployment)

## 📚 Karagdagang Mga Mapagkukunan

### Mga Link sa Dokumentasyon
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Mga Halimbawa mula sa Komunidad
- [Mga Template ng Azure Samples AZD](https://github.com/Azure-Samples/azd-templates)
- [Mga Template ng Microsoft Foundry](https://github.com/Azure/ai-foundry-templates)
- [Gallery ng Azure Developer CLI](https://azure.github.io/awesome-azd/)
- [Todo App gamit ang C# at Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App gamit ang Python at MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App gamit ang Node.js at PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web App na may C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Job ng Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions gamit ang Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Mga Pinakamahusay na Kasanayan
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Pag-ambag ng mga Halimbawa

May kapaki-pakinabang na halimbawa na nais ibahagi? Tinatanggap namin ang mga kontribusyon!

### Mga Alituntunin sa Pagsusumite
1. Sundin ang itinatag na istraktura ng direktoryo
2. Isama ang komprehensibong README.md
3. Magdagdag ng mga komento sa mga file ng configuration
4. Subukin nang mabuti bago magsumite
5. Isama ang mga pagtatantya ng gastos at mga kinakailangan

### Halimbawa ng Istruktura ng Template
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

**Matalinong Tip**: Magsimula sa pinakasimpleng halimbawa na tumutugma sa iyong stack ng teknolohiya, pagkatapos ay dahan-dahang umakyat sa mas kumplikadong mga senaryo. Ang bawat halimbawa ay nakabatay sa mga konsepto mula sa mga nauna!

## 🚀 Handa na bang Magsimula?

### Ang Iyong Landas sa Pagkatuto

1. **Ganap na Baguhan?** → Magsimula sa [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 mins)
2. **May Pangunahing Kaalaman sa AZD?** → Subukan ang [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 mins)
3. **Nagtatayo ng mga AI App?** → Magsimula sa [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 mins) o tuklasin ang [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ hours)
4. **Kailangan ng Tiyak na Tech Stack?** → Gamitin ang [Hanapin ang Tamang Halimbawa](#-finding-the-right-example) na seksyon sa itaas

### Mga Susunod na Hakbang

- ✅ Suriin ang [Mga Kinakailangan](#mga-kinakailangan) sa itaas
- ✅ Pumili ng halimbawa na tumutugma sa iyong antas ng kasanayan (tingnan ang [Legenda ng Kahirapan](#legend-ng-rating-ng-kahirapan))
- ✅ Basahin nang mabuti ang README ng halimbawa bago i-deploy
- ✅ Mag-set ng paalala na patakbuhin `azd down` pagkatapos mag-test
- ✅ Ibahagi ang iyong karanasan sa pamamagitan ng GitHub Issues o Discussions

### Kailangan ng Tulong?

- 📖 [FAQ](../resources/faq.md) - Mga karaniwang tanong na nasasagot
- 🐛 [Gabay sa Pag-troubleshoot](../docs/chapter-07-troubleshooting/common-issues.md) - Ayusin ang mga isyu sa deployment
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Magtanong sa komunidad
- 📚 [Gabay sa Pag-aaral](../resources/study-guide.md) - Patatagin ang iyong pagkatuto

---

**Navigasyon**
- **📚 Tahanan ng Kurso**: [AZD For Beginners](../README.md)
- **📖 Mga Materyales sa Pag-aaral**: [Gabay sa Pag-aaral](../resources/study-guide.md) | [Cheat Sheet](../resources/cheat-sheet.md) | [Talahulugan](../resources/glossary.md)
- **🔧 Mga Mapagkukunan**: [FAQ](../resources/faq.md) | [Gabay sa Pag-troubleshoot](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Huling Na-update: November 2025 | [I-report ang mga Isyu](https://github.com/microsoft/AZD-for-beginners/issues) | [Mag-ambag ng Mga Halimbawa](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Paunawa**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI para sa pagsasalin na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami para sa katumpakan, pakitandaan na ang mga awtomatikong salin ay maaaring maglaman ng mga pagkakamali o kawalan ng katumpakan. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pinagmumulan ng awtoridad. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasaling-tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->