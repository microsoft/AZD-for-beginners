# Mga Halimbawa - Praktikal na Mga Template at Konfigurasiyon ng AZD

**Pagkatuto sa Pamamagitan ng Halimbawa - Inayos ayon sa Kabanata**
- **📚 Tahanan ng Kurso**: [AZD Para sa Mga Nagsisimula](../README.md)
- **📖 Pagmamapa ng Kabanata**: Mga halimbawa na inayos ayon sa antas ng kahirapan
- **🚀 Lokal na Halimbawa**: [Solusyon na Retail Multi-Agent](retail-scenario.md)
- **🤖 Mga Panlabas na Halimbawa ng AI**: Mga link sa mga repositoryo ng Azure Samples

> **📍 MAHALAGA: Lokal laban sa Panlabas na Halimbawa**  
> Ang repositoryong ito ay naglalaman ng **4 kumpletong lokal na halimbawa** na may buong implementasyon:  
> - **Microsoft Foundry Models Chat** (gpt-4.1 deployment na may chat interface)  
> - **Container Apps** (Simple Flask API + Microservices)  
> - **Database App** (Web + SQL Database)  
> - **Retail Multi-Agent** (Enterprise AI Solution)  
>  
> Ang mga karagdagang halimbawa ay **mga panlabas na sanggunian** sa mga repositoryo ng Azure-Samples na maaari mong i-clone.

## Panimula

Ang direktoryong ito ay nagbibigay ng praktikal na mga halimbawa at sanggunian upang tulungan kang matutunan ang Azure Developer CLI sa pamamagitan ng hands-on na pagsasanay. Ang Retail Multi-Agent na scenario ay isang kumpleto, production-ready na implementasyon na kasama sa repositoryong ito. Ang mga karagdagang halimbawa ay tumutukoy sa opisyal na Azure Samples na nagpapakita ng iba't ibang mga pattern ng AZD.

### Legenda ng Antas ng Kahirapan

- ⭐ **Nagsisimula** - Mga pangunahing konsepto, iisang serbisyo, 15-30 minuto
- ⭐⭐ **Intermediate** - Maramihang serbisyo, integrasyon ng database, 30-60 minuto
- ⭐⭐⭐ **Advanced** - Kumplikadong arkitektura, integrasyon ng AI, 1-2 oras
- ⭐⭐⭐⭐ **Eksperto** - Production-ready, enterprise patterns, 2+ oras

## 🎯 Ano ang Talagang Nasa Repositoryong Ito

### ✅ Lokal na Implementasyon (Handang Gamitin)

#### [Aplikasyon ng Chat ng Microsoft Foundry Models](azure-openai-chat/README.md) 🆕
**Kumpletong deployment ng gpt-4.1 na may chat interface na kasama sa repo na ito**

- **Location:** `examples/azure-openai-chat/`
- **Kahirapan:** ⭐⭐ (Intermediate)
- **Kasama sa Nilalaman:**
  - Kumpletong Microsoft Foundry Models deployment (gpt-4.1)
  - Python command-line na chat interface
  - Integrasyon ng Key Vault para sa ligtas na API keys
  - Mga template ng imprastraktura ng Bicep
  - Pagsubaybay ng paggamit ng token at gastos
  - Paglilimita ng rate at paghawak ng error

**Mabilis na Simula:**
```bash
# Pumunta sa halimbawa
cd examples/azure-openai-chat

# I-deploy ang lahat
azd up

# I-install ang mga dependencies at simulan ang pakikipag-chat
pip install -r src/requirements.txt
python src/chat.py
```

**Mga Teknolohiya:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Mga Halimbawa ng Container App](container-app/README.md) 🆕
**Komprehensibong mga halimbawa ng pag-deploy ng container na kasama sa repo na ito**

- **Location:** `examples/container-app/`
- **Kahirapan:** ⭐-⭐⭐⭐⭐ (Nagsisimula hanggang Advanced)
- **Kasama:**
  - [Pangunahing Gabay](container-app/README.md) - Kumpletong overview ng pag-deploy ng container
  - [Simpleng Flask API](../../../examples/container-app/simple-flask-api) - Pangunahing halimbawa ng REST API
  - [Arkitekturang Microservices](../../../examples/container-app/microservices) - Production-ready na multi-service deployment
  - Mabilis na Simula, Production, at Advanced na mga pattern
  - Monitoring, seguridad, at optimisasyon ng gastos

**Mabilis na Simula:**
```bash
# Tingnan ang pangunahing gabay
cd examples/container-app

# I-deploy ang simpleng Flask na API
cd simple-flask-api
azd up

# I-deploy ang halimbawa ng microservices
cd ../microservices
azd up
```

**Mga Teknolohiya:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Solusyon na Retail Multi-Agent](retail-scenario.md) 🆕
**Kumpletong production-ready na implementasyon na kasama sa repo na ito**

- **Location:** `examples/retail-multiagent-arm-template/`
- **Kahirapan:** ⭐⭐⭐⭐ (Advanced)
- **Kasama:**
  - Kumpletong ARM deployment template
  - Multi-agent na arkitektura (Customer + Inventory)
  - Integrasyon ng Microsoft Foundry Models
  - AI Search na may RAG
  - Komprehensibong monitoring
  - Isang-click na deployment script

**Mabilis na Simula:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Mga Teknolohiya:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Mga Panlabas na Azure Samples (I-clone para Gamitin)

Ang mga sumusunod na halimbawa ay pinamamahalaan sa mga opisyal na repositoryo ng Azure-Samples. I-clone ang mga ito upang galugarin ang iba't ibang mga pattern ng AZD:

### Mga Simpleng Aplikasyon (Mga Kabanata 1-2)

| Template | Repository | Kahirapan | Mga Serbisyo |
|:---------|:-----------|:-----------|:-------------|
| **Python Flask API** | [Lokal: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Lokal: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-service, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Paano gamitin:**
```bash
# Kopyahin ang anumang halimbawa
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Ilunsad
azd up
```

### Mga Halimbawa ng AI Application (Mga Kabanata 2, 5, 8)

| Template | Repository | Kahirapan | Pokus |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [Lokal: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 deployment |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Pangunahing AI chat |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agent framework |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG pattern |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Enterprise AI |

### Database at Mga Advanced na Pattern (Mga Kabanata 3-8)

| Template | Repository | Kahirapan | Pokus |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Database integration |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-service |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Mga Layunin ng Pagkatuto

Sa pamamagitan ng pagtatrabaho sa mga halimbawang ito, matututunan mo:
- Magsanay ng mga workflow ng Azure Developer CLI gamit ang mga realistiko na senaryo ng aplikasyon
- Unawain ang iba't ibang arkitektura ng aplikasyon at ang kanilang mga implementasyon sa azd
- Maging bihasa sa mga pattern ng Infrastructure as Code para sa iba't ibang serbisyo ng Azure
- Ilapat ang pamamahala ng konfigurasiyon at mga estratehiya sa deployment na naka-angkop sa bawat environment
- Ipatupad ang monitoring, seguridad, at mga pattern ng scaling sa praktikal na konteksto
- Bumuo ng karanasan sa troubleshooting at pag-debug ng mga totoong senaryo ng deployment

## Mga Kinalabasan ng Pagkatuto

Pagkatapos makumpleto ang mga halimbawang ito, magagawa mong:
- Mag-deploy ng iba't ibang uri ng aplikasyon gamit ang Azure Developer CLI nang may kumpiyansa
- Iangkop ang mga ibinigay na template sa iyong sariling mga pangangailangan sa aplikasyon
- Mag-disenyo at magpatupad ng mga custom na pattern ng imprastraktura gamit ang Bicep
- I-configure ang kumplikadong multi-service na mga aplikasyon na may tamang mga dependency
- Ilapat ang pinakamahusay na kasanayan sa seguridad, monitoring, at pagganap sa totoong mga senaryo
- Mag-troubleshoot at mag-optimize ng mga deployment base sa praktikal na karanasan

## Estruktura ng Direktoryo

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

## Mabilis na Simula na Mga Halimbawa

> **💡 Bago sa AZD?** Magsimula sa halimbawa #1 (Flask API) - tumatagal ng ~20 minuto at itinuturo ang mga pangunahing konsepto.

### Para sa Mga Nagsisimula
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Lokal) ⭐  
   Mag-deploy ng simpleng REST API na may scale-to-zero  
   **Oras:** 20-25 minuto | **Gastos:** $0-5/buwan  
   **Matututuhan Mo:** Pangunahing azd workflow, containerization, health probes  
   **Inaasahang Resulta:** Gumaganang API endpoint na nagbabalik ng "Hello, World!" na may monitoring

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Mag-deploy ng Node.js Express web application na may MongoDB  
   **Oras:** 25-35 minuto | **Gastos:** $10-30/buwan  
   **Matututuhan Mo:** Integrasyon ng database, environment variables, connection strings  
   **Inaasahang Resulta:** Todo list app na may create/read/update/delete functionality

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   I-host ang React static website gamit ang Azure Static Web Apps  
   **Oras:** 20-30 minuto | **Gastos:** $0-10/buwan  
   **Matututuhan Mo:** Static hosting, serverless functions, CDN deployment  
   **Inaasahang Resulta:** React UI na may API backend, automatic SSL, global CDN

### Para sa Intermediate na Mga Gumagamit
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (Lokal) ⭐⭐  
   Mag-deploy ng gpt-4.1 na may chat interface at secure na pamamahala ng API key  
   **Oras:** 35-45 minuto | **Gastos:** $50-200/buwan  
   **Matututuhan Mo:** Deployment ng Microsoft Foundry Models, integrasyon ng Key Vault, pagsubaybay ng token  
   **Inaasahang Resulta:** Gumaganang chat application na may gpt-4.1 at monitoring ng gastos

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Lokal) ⭐⭐⭐⭐  
   Production-ready na multi-service na arkitektura  
   **Oras:** 45-60 minuto | **Gastos:** $50-150/buwan  
   **Matututuhan Mo:** Komunikasyon ng serbisyo, message queuing, distributed tracing  
   **Inaasahang Resulta:** 2-service system (API Gateway + Product Service) na may monitoring

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
   Multi-service na Java application na may Container Apps at API gateway  
   **Oras:** 60-90 minuto | **Gastos:** $80-200/buwan  
   **Matututuhan Mo:** Spring Boot deployment, service mesh, load balancing  
   **Inaasahang Resulta:** Multi-service Java system na may service discovery at routing

### Mga Template ng Microsoft Foundry

1. **[Microsoft Foundry Models Chat App - Lokal na Halimbawa](../../../examples/azure-openai-chat)** ⭐⭐  
   Kumpletong gpt-4.1 deployment na may chat interface  
   **Oras:** 35-45 minuto | **Gastos:** $50-200/buwan  
   **Inaasahang Resulta:** Gumaganang chat application na may pagsubaybay ng token at monitoring ng gastos

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Intelligent chat application na may RAG architecture  
   **Oras:** 60-90 minuto | **Gastos:** $100-300/buwan  
   **Inaasahang Resulta:** RAG-powered chat interface na may paghahanap ng dokumento at citations

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Pagsusuri ng dokumento gamit ang Azure AI services  
   **Oras:** 40-60 minuto | **Gastos:** $20-80/buwan  
   **Inaasahang Resulta:** API na nag-eextract ng teksto, mga talahanayan, at mga entity mula sa ini-upload na mga dokumento

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps workflow gamit ang Azure Machine Learning  
   **Oras:** 2-3 oras | **Gastos:** $150-500/buwan  
   **Inaasahang Resulta:** Automated ML pipeline na may training, deployment, at monitoring

### Mga Totoong Senaryo

#### **Solusyon na Retail Multi-Agent** 🆕
**[Kumpletong Gabay sa Implementasyon](./retail-scenario.md)**

Isang komprehensibo, production-ready na multi-agent customer support solution na nagpapakita ng enterprise-grade AI application deployment gamit ang AZD. Ang senaryong ito ay nagbibigay ng:

- **Kumpletong Arkitektura**: Multi-agent na sistema na may mga espesyalisadong ahente para sa serbisyo sa customer at pamamahala ng imbentaryo
- **Imprastruktura para sa Produksyon**: Mga multi-rehiyong deployment ng Microsoft Foundry Models, AI Search, Container Apps, at komprehensibong monitoring
- **Ready-to-Deploy ARM Template**: Pag-deploy nang isang-click na may maraming mode ng konfigurasyon (Minimal/Standard/Premium)
- **Mga Advanced na Tampok**: red teaming na pagpapatunay ng seguridad, framework para sa pagsusuri ng agent, optimisasyon ng gastos, at mga gabay sa pag-troubleshoot
- **Tunay na Konteksto ng Negosyo**: Use case para sa suporta ng customer ng retailer na may pag-upload ng file, integrasyon ng paghahanap, at dynamic na pag-scale

**Mga Teknolohiya**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Kompleksidad**: ⭐⭐⭐⭐ (Advanced - Handa para sa Produksyon ng Enterprise)

**Perpekto para sa**: mga AI developer, mga solution architect, at mga koponang gumagawa ng production multi-agent na mga sistema

**Mabilis na Pagsisimula**: I-deploy ang kumpletong solusyon sa loob ng mas mababa sa 30 minuto gamit ang kalakip na ARM template sa `./deploy.sh -g myResourceGroup`

## 📋 Mga Instruksyon sa Paggamit

### Mga Kinakailangan

Bago patakbuhin ang anumang halimbawa:
- ✅ Azure subscription na may access bilang Owner o Contributor
- ✅ Na-install ang Azure Developer CLI (Tingnan ang [Gabay sa Pag-install](../docs/chapter-01-foundation/installation.md))
- ✅ Tumatakbong Docker Desktop (para sa mga halimbawa ng container)
- ✅ Angkop na Azure quotas (suriin ang mga kinakailangan na partikular sa halimbawa)

> **💰 Babala sa Gastos:** Lahat ng halimbawa ay lumilikha ng totoong Azure resources na may bayarin. Suriin ang mga hiwalay na README file para sa pagtatantya ng gastos. Tandaan na patakbuhin ang `azd down` kapag tapos na upang maiwasan ang patuloy na gastusin.

### Pagpapatakbo ng Mga Halimbawa nang Lokal

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

3. **I-configure ang Kapaligiran**
   ```bash
   # Itakda ang mga kinakailangang variable
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **I-deploy**
   ```bash
   # I-deploy ang imprastruktura at aplikasyon
   azd up
   ```

5. **Suriin ang Deployment**
   ```bash
   # Kunin ang mga endpoint ng serbisyo
   azd env get-values
   
   # Subukan ang endpoint (halimbawa)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Inaasahang Palatandaan ng Tagumpay:**
   - ✅ `azd up` kumpleto nang walang mga error
   - ✅ Nagbabalik ng HTTP 200 ang service endpoint
   - ✅ Ipinapakita ng Azure Portal ang status na "Running"
   - ✅ Tumatanggap ang Application Insights ng telemetry

> **⚠️ May mga Isyu?** Tingnan ang [Mga Karaniwang Isyu](../docs/chapter-07-troubleshooting/common-issues.md) para sa pag-troubleshoot ng deployment

### Pag-aangkop ng Mga Halimbawa

Bawat halimbawa ay may kasamang:
- **README.md** - Detalyadong mga instruksyon sa pag-setup at pag-customize
- **azure.yaml** - Konfigurasyon ng AZD na may mga komento
- **infra/** - Mga Bicep template na may mga paliwanag sa mga parameter
- **src/** - Halimbawa ng code ng aplikasyon
- **scripts/** - Mga helper script para sa mga karaniwang gawain

## 🎯 Mga Layunin sa Pagkatuto

### Mga Kategorya ng Halimbawa

#### **Mga Pangunahing Deployment**
- Mga application na may iisang serbisyo
- Mga simpleng pattern ng imprastruktura
- Pangunahing pamamahala ng konfigurasyon
- Mga matipid na setup para sa pag-develop

#### **Mga Advanced na Senaryo**
- Mga arkitekturang may maraming serbisyo
- Mga komplikadong konfigurasyon ng networking
- Mga pattern ng integrasyon ng database
- Mga implementasyon ng seguridad at pagsunod

#### **Mga Pattern na Handa para sa Produksyon**
- Mga konfigurasyon para sa mataas na availability
- Pagsubaybay at obserbabilidad
- Integrasyon ng CI/CD
- Mga setup para sa disaster recovery

## 📖 Mga Paglalarawan ng Halimbawa

### Simpleng Web App - Node.js Express
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
**Lokasyon**: [Halimbawa Lokal](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**Mga Teknolohiya**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Kompleksidad**: Advanced  
**Mga Konsepto**: Arkitekturang multi-service, komunikasyon ng serbisyo, message queuing, distributed tracing  
**Lokasyon**: [Halimbawa Lokal](../../../examples/container-app/microservices)

### Database App - C# with Azure SQL
**Mga Teknolohiya**: C# ASP.NET Core, Azure SQL Database, App Service  
**Kompleksidad**: Intermediate  
**Mga Konsepto**: Entity Framework, koneksyon sa database, pag-develop ng web API

### Serverless Function - Python Azure Functions
**Mga Teknolohiya**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Kompleksidad**: Intermediate  
**Mga Konsepto**: Event-driven architecture, serverless computing, full-stack development

### Microservices - Java Spring Boot
**Mga Teknolohiya**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Kompleksidad**: Intermediate  
**Mga Konsepto**: Komunikasyon sa microservices, distributed systems, enterprise patterns

### Microsoft Foundry Examples

#### Microsoft Foundry Models Chat App
**Mga Teknolohiya**: Microsoft Foundry Models, Azure AI Search, App Service  
**Kompleksidad**: Intermediate  
**Mga Konsepto**: RAG architecture, vector search, LLM integration

#### AI Document Processing
**Mga Teknolohiya**: Azure AI Document Intelligence, Storage, Functions  
**Kompleksidad**: Intermediate  
**Mga Konsepto**: Document analysis, OCR, pagkuha ng data

#### Machine Learning Pipeline
**Mga Teknolohiya**: Azure ML, MLOps, Container Registry  
**Kompleksidad**: Advanced  
**Mga Konsepto**: Pagsasanay ng modelo, deployment pipelines, monitoring

## 🛠 Mga Halimbawa ng Konfigurasyon

Ang `configurations/` directory ay naglalaman ng mga reusable na component:

### Environment Configurations
- Mga setting para sa development environment
- Mga konfigurasyon para sa staging environment
- Mga konfigurasyong handa para sa produksyon
- Mga setup para sa multi-region deployment

### Bicep Modules
- Mga reusable na component ng imprastruktura
- Karaniwang mga pattern ng resource
- Mga template na pinatibay para sa seguridad
- Mga konfigurasyong na-optimize para sa gastos

### Helper Scripts
- Automation para sa setup ng kapaligiran
- Mga script para sa migration ng database
- Mga tool para sa validation ng deployment
- Mga utility para sa monitoring ng gastos

## 🔧 Gabay sa Pag-customize

### Pag-aangkop ng Mga Halimbawa para sa Iyong Use Case

1. **Suriin ang Mga Kinakailangan**
   - Suriin ang mga kinakailangan ng serbisyo ng Azure
   - Patunayan ang mga limitasyon ng subscription
   - Unawain ang mga implikasyon sa gastos

2. **Baguhin ang Konfigurasyon**
   - I-update ang `azure.yaml` na mga depinisyon ng serbisyo
   - I-customize ang mga Bicep template
   - I-adjust ang mga environment variable

3. **Subukin nang Mabuti**
   - I-deploy muna sa development environment
   - Patunayan ang functionality
   - Subukin ang scaling at performance

4. **Review sa Seguridad**
   - Suriin ang mga control sa access
   - Ipatupad ang pamamahala ng mga secret
   - I-enable ang monitoring at alerting

## 📊 Comparison Matrix

| Halimbawa | Serbisyo | Database | Auth | Pagsubaybay | Kumplikado |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (Local) | 2 | ❌ | Key Vault | Buong | ⭐⭐ |
| **Python Flask API** (Local) | 1 | ❌ | Basic | Buong | ⭐ |
| **Microservices** (Local) | 5+ | ✅ | Enterprise | Advanced | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Basic | Basic | ⭐ |
| React SPA + Functions | 3 | ✅ | Basic | Buong | ⭐ |
| Python Flask Container | 2 | ❌ | Basic | Buong | ⭐ |
| C# Web API + SQL | 2 | ✅ | Buong | Buong | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Buong | Buong | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Buong | Buong | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | Buong | Buong | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Basic | Buong | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Buong | Buong | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Local) | **8+** | **✅** | **Enterprise** | **Advanced** | **⭐⭐⭐⭐** |

## 🎓 Landas ng Pagkatuto

### Inirerekomendang Pagkakasunod-sunod

1. **Magsimula sa Simpleng Web App**
   - Matutunan ang mga pangunahing konsepto ng AZD
   - Unawain ang workflow ng deployment
   - Magpraktis sa pamamahala ng kapaligiran

2. **Subukan ang Static Website**
   - Tuklasin ang iba't ibang opsyon sa hosting
   - Matutunan ang integrasyon ng CDN
   - Unawain ang konfigurasyon ng DNS

3. **Lumipat sa Container App**
   - Matutunan ang mga pangunahing kaalaman sa containerization
   - Unawain ang mga konsepto ng scaling
   - Magpraktis gamit ang Docker

4. **Magdagdag ng Integrasyon ng Database**
   - Matutunan ang provisioning ng database
   - Unawain ang connection strings
   - Magpraktis sa pamamahala ng secrets

5. **Tuklasin ang Serverless**
   - Unawain ang event-driven architecture
   - Matutunan ang mga trigger at binding
   - Magpraktis gamit ang mga API

6. **Bumuo ng Microservices**
   - Matutunan ang komunikasyon ng serbisyo
   - Unawain ang distributed systems
   - Magpraktis sa mga komplikadong deployment

## 🔍 Paghanap ng Tamang Halimbawa

### Ayon sa Stack ng Teknolohiya
- **Container Apps**: [Python Flask API (Lokal)](../../../examples/container-app/simple-flask-api), [Microservices (Lokal)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Lokal)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Lokal)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Lokal)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Lokal)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Microservices User Service (Lokal)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Lokal)](../../../examples/container-app/simple-flask-api), [Microservices (Lokal)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (Lokal)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (Lokal)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Ayon sa Architecture Pattern
- **Simple REST API**: [Python Flask API (Lokal)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Lokal)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (Lokal)](../../../examples/container-app/simple-flask-api), [Microservices (Lokal)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (Lokal)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Ayon sa Antas ng Kumplikado
- **Baguhan**: [Python Flask API (Lokal)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Intermediate**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **Advanced**: ML Pipeline
- **Enterprise Production-Ready**: [Microservices (Lokal)](../../../examples/container-app/microservices) (Multi-service with message queuing), **Retail Multi-Agent Solution** (Kumpletong multi-agent system na may ARM template deployment)

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
- [Todo App with Node.js and PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web App na may C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions na may Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Pinakamahusay na Kasanayan
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Mga Halimbawa ng Kontribusyon

May kapaki-pakinabang na halimbawa ka bang maibabahagi? Tinatanggap namin ang mga kontribusyon!

### Mga Panuntunan sa Pagsusumite
1. Sundin ang itinatag na istruktura ng direktoryo
2. Isama ang komprehensibong README.md
3. Magdagdag ng mga komento sa mga file ng konfigurasyon
4. Subukan nang mabuti bago magsumite
5. Isama ang mga pagtatantya ng gastos at mga kinakailangan

### Istruktura ng Halimbawang Template
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

**Pro Tip**: Magsimula sa pinakasimpleng halimbawa na tumutugma sa iyong technology stack, at unti-unting umakyat sa mas kumplikadong mga senaryo. Ang bawat halimbawa ay bumubuo sa mga konsepto mula sa mga naunang halimbawa!

## 🚀 Handa na bang Magsimula?

### Ang Iyong Landas ng Pagkatuto

1. **Ganap na Baguhan?** → Magsimula sa [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 minuto)
2. **May Batayang Kaalaman sa AZD?** → Subukan ang [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 minuto)
3. **Gumagawa ng mga AI App?** → Magsimula sa [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 minuto) o galugarin ang [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ oras)
4. **Kailangan ng Tiyak na Tech Stack?** → Gamitin ang seksyon [Paghanap ng Tamang Halimbawa](#-finding-the-right-example) sa itaas

### Mga Susunod na Hakbang

- ✅ Suriin ang [Mga Kinakailangan](#mga-kinakailangan) sa itaas
- ✅ Piliin ang halimbawa na tumutugma sa iyong antas ng kakayahan (tingnan ang [Legend ng Kompleksidad](#legenda-ng-antas-ng-kahirapan))
- ✅ Basahin nang mabuti ang README ng halimbawa bago mag-deploy
- ✅ Magtakda ng paalala na patakbuhin ang `azd down` pagkatapos ng pagsubok
- ✅ Ibahagi ang iyong karanasan sa pamamagitan ng GitHub Issues o Discussions

### Kailangan ng Tulong?

- 📖 [FAQ](../resources/faq.md) - Mga karaniwang tanong na sinagot
- 🐛 [Gabay sa Pag-troubleshoot](../docs/chapter-07-troubleshooting/common-issues.md) - Ayusin ang mga isyu sa deployment
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Magtanong sa komunidad
- 📚 [Gabay sa Pag-aaral](../resources/study-guide.md) - Palakasin ang iyong pagkatuto

---

**Navigasyon**
- **📚 Tahanan ng Kurso**: [AZD For Beginners](../README.md)
- **📖 Mga Materyales sa Pag-aaral**: [Gabay sa Pag-aaral](../resources/study-guide.md) | [Cheat Sheet](../resources/cheat-sheet.md) | [Talahulugan](../resources/glossary.md)
- **🔧 Mga Mapagkukunan**: [FAQ](../resources/faq.md) | [Gabay sa Pag-troubleshoot](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Huling Na-update: November 2025 | [Iulat ang mga Isyu](https://github.com/microsoft/AZD-for-beginners/issues) | [Mag-ambag ng Mga Halimbawa](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->