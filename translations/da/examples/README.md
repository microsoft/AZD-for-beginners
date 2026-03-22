# Examples - Praktiske AZD-skabeloner og konfigurationer

**Læring ved eksempler - organiseret efter kapitel**
- **📚 Kursusstart**: [AZD For Beginners](../README.md)
- **📖 Kapitelkort**: Eksempler organiseret efter læringskompleksitet
- **🚀 Lokalt eksempel**: [Retail Multi-Agent-løsning](retail-scenario.md)
- **🤖 Eksterne AI-eksempler**: Links til Azure Samples-repositorier

> **📍 VIGTIGT: Lokale vs eksterne eksempler**  
> Dette repository indeholder **4 komplette lokale eksempler** med fulde implementeringer:  
> - **Microsoft Foundry Models Chat** (gpt-4.1-udrulning med chatgrænseflade)  
> - **Container Apps** (Enkel Flask API + mikrotjenester)  
> - **Database App** (Web + SQL-database)  
> - **Retail Multi-Agent** (Enterprise AI-løsning)  
>  
> Yderligere eksempler er **eksterne henvisninger** til Azure-Samples-repositorier, som du kan klone.

## Introduktion

Dette bibliotek giver praktiske eksempler og henvisninger til at hjælpe dig med at lære Azure Developer CLI gennem hands-on øvelser. Retail Multi-Agent-scenariet er en komplet, produktionsklar implementering inkluderet i dette repo. Yderligere eksempler henviser til officielle Azure Samples, der demonstrerer forskellige AZD-mønstre.

### Kompleksitetsbedømmelse

- ⭐ **Begynder** - Grundlæggende koncepter, enkelt tjeneste, 15-30 minutter
- ⭐⭐ **Mellem** - Flere tjenester, databaseintegration, 30-60 minutter
- ⭐⭐⭐ **Avanceret** - Kompleks arkitektur, AI-integration, 1-2 timer
- ⭐⭐⭐⭐ **Ekspert** - Produktionsklar, enterprise-mønstre, 2+ timer

## 🎯 Hvad der faktisk er i dette repository

### ✅ Lokal implementering (Klar til brug)

#### [Microsoft Foundry Models Chat-applikation](azure-openai-chat/README.md) 🆕
**Komplet gpt-4.1-udrulning med chatgrænseflade inkluderet i dette repo**

- **Placering:** `examples/azure-openai-chat/`
- **Kompleksitet:** ⭐⭐ (Mellem)
- **Hvad er inkluderet:**
  - Komplet Microsoft Foundry Models-udrulning (gpt-4.1)
  - Python-kommandolinje chatgrænseflade
  - Key Vault-integration for sikre API-nøgler
  - Bicep-infrastrukturskabeloner
  - Tokenforbrug og omkostningssporing
  - Ratebegrænsning og fejlhåndtering

**Hurtig start:**
```bash
# Gå til eksemplet
cd examples/azure-openai-chat

# Udrul alt
azd up

# Installer afhængigheder og begynd at chatte
pip install -r src/requirements.txt
python src/chat.py
```

**Teknologier:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Container App-eksempler](container-app/README.md) 🆕
**Omfattende eksempler på containerudrulning inkluderet i dette repo**

- **Placering:** `examples/container-app/`
- **Kompleksitet:** ⭐-⭐⭐⭐⭐ (Begynder til Avanceret)
- **Hvad er inkluderet:**
  - [Mastervejledning](container-app/README.md) - Komplet oversigt over containerudrulninger
  - [Simpel Flask API](../../../examples/container-app/simple-flask-api) - Grundlæggende REST API-eksempel
  - [Mikrotjenestearkitektur](../../../examples/container-app/microservices) - Produktionsklar multi-service-udrulning
  - Hurtig start, produktion og avancerede mønstre
  - Overvågning, sikkerhed og omkostningsoptimering

**Hurtig start:**
```bash
# Vis masterguide
cd examples/container-app

# Udrul et simpelt Flask-API
cd simple-flask-api
azd up

# Udrul eksempel på mikrotjenester
cd ../microservices
azd up
```

**Teknologier:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent-løsning](retail-scenario.md) 🆕
**Fuld produktionsklar implementering inkluderet i dette repo**

- **Placering:** `examples/retail-multiagent-arm-template/`
- **Kompleksitet:** ⭐⭐⭐⭐ (Avanceret)
- **Hvad er inkluderet:**
  - Komplet ARM-udrulningsskabelon
  - Multi-agent-arkitektur (Kunde + Lager)
  - Microsoft Foundry Models-integration
  - AI-søgning med RAG
  - Omfattende overvågning
  - Udrulningsscript med ét klik

**Hurtig start:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Teknologier:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Eksterne Azure Samples (Klon for at bruge)

Følgende eksempler vedligeholdes i officielle Azure-Samples-repositorier. Klon dem for at udforske forskellige AZD-mønstre:

### Enkle applikationer (Kapitler 1-2)

| Skabelon | Repository | Kompleksitet | Tjenester |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Lokal: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Lokal: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-service, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Hvordan bruges:**
```bash
# Klon et hvilket som helst eksempel
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Udrul
azd up
```

### AI-applikationseksempler (Kapitler 2, 5, 8)

| Skabelon | Repository | Kompleksitet | Fokus |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [Lokal: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1-udrulning |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Grundlæggende AI-chat |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agent-rammeværk |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG-mønster |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Enterprise-AI |

### Database & Avancerede mønstre (Kapitler 3-8)

| Skabelon | Repository | Kompleksitet | Fokus |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Databaseintegration |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverløst |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Flere services |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Læringsmål

Ved at arbejde dig gennem disse eksempler vil du:
- Øve Azure Developer CLI-arbejdsgange med realistiske applikationsscenarier
- Forstå forskellige applikationsarkitekturer og deres azd-implementeringer
- Mestre Infrastructure as Code-mønstre for forskellige Azure-tjenester
- Anvende konfigurationsstyring og miljøspecifikke udrulningsstrategier
- Implementere overvågnings-, sikkerheds- og skaleringmønstre i praktiske sammenhænge
- Opbygge erfaring med fejlsøgning og fejlretning af virkelige udrulningsscenarier

## Læringsudbytte

Efter at have gennemført disse eksempler vil du kunne:
- Udrulle forskellige applikationstyper ved hjælp af Azure Developer CLI sikkert
- Tilpasse de medfølgende skabeloner til dine egne applikationskrav
- Designe og implementere brugerdefinerede infrastrukturmønstre ved hjælp af Bicep
- Konfigurere komplekse multi-service-applikationer med korrekte afhængigheder
- Anvende sikkerheds-, overvågnings- og performance bedste praksis i virkelige scenarier
- Fejlsøge og optimere udrulninger baseret på praktisk erfaring

## Katalogstruktur

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

## Hurtigstartseksempler

> **💡 Ny til AZD?** Start med eksempel nr. 1 (Flask API) - det tager ~20 minutter og lærer kernekoncepter.

### For begyndere
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Local) ⭐  
   Udrul en simpel REST API med scale-to-zero  
   **Tid:** 20-25 minutter | **Omkostninger:** $0-5/md.  
   **Du lærer:** Grundlæggende azd-arbejdsgang, containerisering, health probes  
   **Forventet resultat:** Funktionsdygtigt API-endpoint, der returnerer "Hello, World!" med overvågning

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Udrul en Node.js Express-webapplikation med MongoDB  
   **Tid:** 25-35 minutter | **Omkostninger:** $10-30/md.  
   **Du lærer:** Databaseintegration, miljøvariabler, forbindelsesstrenge  
   **Forventet resultat:** Todo-liste-app med opret/læs/opdater/slet funktionalitet

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Host en React statisk hjemmeside med Azure Static Web Apps  
   **Tid:** 20-30 minutter | **Omkostninger:** $0-10/md.  
   **Du lærer:** Statisk hosting, serverløse funktioner, CDN-udrulning  
   **Forventet resultat:** React UI med API-backend, automatisk SSL, global CDN

### For mellemniveaubrugere
4. **[Microsoft Foundry Models Chat-applikation](../../../examples/azure-openai-chat)** (Local) ⭐⭐  
   Udrul gpt-4.1 med chatgrænseflade og sikker API-nøglehåndtering  
   **Tid:** 35-45 minutter | **Omkostninger:** $50-200/md.  
   **Du lærer:** Microsoft Foundry Models-udrulning, Key Vault-integration, token-sporing  
   **Forventet resultat:** Funktionsdygtig chatapplikation med gpt-4.1 og omkostningsovervågning

5. **[Container App - Mikrotjenester](../../../examples/container-app/microservices)** (Local) ⭐⭐⭐⭐  
   Produktionsklar multi-service-arkitektur  
   **Tid:** 45-60 minutter | **Omkostninger:** $50-150/md.  
   **Du lærer:** Tjenestekommunikation, beskedkøer, distribueret tracing  
   **Forventet resultat:** 2-tjeneste system (API Gateway + Product Service) med overvågning

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Webapplikation med C# API og Azure SQL-database  
   **Tid:** 30-45 minutter | **Omkostninger:** $20-80/md.  
   **Du lærer:** Entity Framework, database-migrationer, forbindelsessikkerhed  
   **Forventet resultat:** C# API med Azure SQL-backend, automatisk schemaudrulning

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions med HTTP-triggers og Cosmos DB  
   **Tid:** 30-40 minutter | **Omkostninger:** $10-40/md.  
   **Du lærer:** Event-drevet arkitektur, serverløs skalering, NoSQL-integration  
   **Forventet resultat:** Function-app, der reagerer på HTTP-forespørgsler med Cosmos DB-lagring

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Multi-service Java-applikation med Container Apps og API gateway  
   **Tid:** 60-90 minutter | **Omkostninger:** $80-200/md.  
   **Du lærer:** Spring Boot-udrulning, service mesh, load balancing  
   **Forventet resultat:** Multi-service Java-system med servicediscovery og routing

### Microsoft Foundry-skabeloner

1. **[Microsoft Foundry Models Chat App - Lokalt eksempel](../../../examples/azure-openai-chat)** ⭐⭐  
   Komplet gpt-4.1-udrulning med chatgrænseflade  
   **Tid:** 35-45 minutter | **Omkostninger:** $50-200/md.  
   **Forventet resultat:** Funktionsdygtig chatapplikation med token-sporing og omkostningsovervågning

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Intelligent chatapplikation med RAG-arkitektur  
   **Tid:** 60-90 minutter | **Omkostninger:** $100-300/md.  
   **Forventet resultat:** RAG-drevet chatgrænseflade med dokument-søgning og kildehenvisninger

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Dokumentanalyse ved brug af Azure AI-tjenester  
   **Tid:** 40-60 minutter | **Omkostninger:** $20-80/md.  
   **Forventet resultat:** API, der udtrækker tekst, tabeller og entiteter fra uploadede dokumenter

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps-workflow med Azure Machine Learning  
   **Tid:** 2-3 timer | **Omkostninger:** $150-500/md.  
   **Forventet resultat:** Automatiseret ML-pipeline med træning, udrulning og overvågning

### Virkelige scenarier

#### **Retail Multi-Agent-løsning** 🆕
**[Komplet implementeringsguide](./retail-scenario.md)**

En omfattende, produktionsklar multi-agent kundesupportløsning, der demonstrerer enterprise-grad AI-applikationsudrulning med AZD. Dette scenarie tilbyder:
- **Complete Architecture**: Multi-agent system with specialized customer service and inventory management agents
- **Production Infrastructure**: Multi-region Microsoft Foundry Models deployments, AI Search, Container Apps, and comprehensive monitoring
- **Ready-to-Deploy ARM Template**: One-click deployment with multiple configuration modes (Minimal/Standard/Premium)
- **Advanced Features**: Red teaming security validation, agent evaluation framework, cost optimization, and troubleshooting guides
- **Real Business Context**: Retailer customer support use case with file uploads, search integration, and dynamic scaling

**Technologies**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Complexity**: ⭐⭐⭐⭐ (Avanceret - Klar til produktion for virksomheder)

**Perfect for**: AI developers, solution architects, and teams building production multi-agent systems

**Quick Start**: Deploy the complete solution in under 30 minutes using the included ARM template with `./deploy.sh -g myResourceGroup`

## 📋 Brugsvejledning

### Forudsætninger

Før du kører et eksempel:
- ✅ Azure subscription with Owner or Contributor access
- ✅ Azure Developer CLI installed ([Installationsvejledning](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop running (for container examples)
- ✅ Appropriate Azure quotas (check example-specific requirements)

> **💰 Omkostningsadvarsel:** Alle eksempler opretter reelle Azure-ressourcer, der medfører omkostninger. Se de enkelte README-filer for omkostningsoverslag. Husk at køre `azd down`, når du er færdig, for at undgå løbende omkostninger.

### Kør eksempler lokalt

1. **Clone or Copy Example**
   ```bash
   # Naviger til ønsket eksempel
   cd examples/simple-web-app
   ```

2. **Initialize AZD Environment**
   ```bash
   # Initialiser med eksisterende skabelon
   azd init
   
   # Eller opret et nyt miljø
   azd env new my-environment
   ```

3. **Configure Environment**
   ```bash
   # Angiv nødvendige variabler
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Deploy**
   ```bash
   # Udrul infrastruktur og applikation
   azd up
   ```

5. **Verify Deployment**
   ```bash
   # Hent serviceendepunkter
   azd env get-values
   
   # Test endepunktet (eksempel)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Forventede succesindikatorer:**
   - ✅ `azd up` fuldføres uden fejl
   - ✅ Service-endpoint returnerer HTTP 200
   - ✅ Azure-portalen viser status "Kører"
   - ✅ Application Insights modtager telemetri

> **⚠️ Problemer?** Se [Almindelige problemer](../docs/chapter-07-troubleshooting/common-issues.md) for fejlfinding ved udrulning

### Tilpasning af eksempler

Hvert eksempel inkluderer:
- **README.md** - Detaljerede installations- og tilpasningsinstruktioner
- **azure.yaml** - AZD-konfiguration med kommentarer
- **infra/** - Bicep-skabeloner med parameterforklaringer
- **src/** - Eksempelkode til applikation
- **scripts/** - Hjælpescripts til almindelige opgaver

## 🎯 Læringsmål

### Eksempelkategorier

#### **Basisudrulninger**
- Single-service applications
- Simple infrastructure patterns
- Basic configuration management
- Cost-effective development setups

#### **Avancerede scenarier**
- Multi-service architectures
- Complex networking configurations
- Database integration patterns
- Security and compliance implementations

#### **Produktionsklare mønstre**
- High availability configurations
- Monitoring and observability
- CI/CD integration
- Disaster recovery setups

## 📖 Eksempelbeskrivelser

### Simple Web App - Node.js Express
**Technologies**: Node.js, Express, MongoDB, Container Apps  
**Complexity**: Begynder  
**Concepts**: Basic deployment, REST API, NoSQL database integration

### Static Website - React SPA
**Technologies**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complexity**: Begynder  
**Concepts**: Static hosting, serverless backend, modern web development

### Container App - Python Flask
**Technologies**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Complexity**: Begynder  
**Concepts**: Containerization, REST API, scale-to-zero, health probes, monitoring  
**Placering**: [Lokalt eksempel](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**Technologies**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complexity**: Avanceret  
**Concepts**: Multi-service architecture, service communication, message queuing, distributed tracing  
**Placering**: [Lokalt eksempel](../../../examples/container-app/microservices)

### Database App - C# with Azure SQL
**Technologies**: C# ASP.NET Core, Azure SQL Database, App Service  
**Complexity**: Mellem  
**Concepts**: Entity Framework, database connections, web API development

### Serverless Function - Python Azure Functions
**Technologies**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complexity**: Mellem  
**Concepts**: Event-driven architecture, serverless computing, full-stack development

### Microservices - Java Spring Boot
**Technologies**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Complexity**: Mellem  
**Concepts**: Microservices communication, distributed systems, enterprise patterns

### Microsoft Foundry-eksempler

#### Microsoft Foundry Models Chat App
**Technologies**: Microsoft Foundry Models, Cognitive Search, App Service  
**Complexity**: Mellem  
**Concepts**: RAG architecture, vector search, LLM integration

#### AI Document Processing
**Technologies**: Azure AI Document Intelligence, Storage, Functions  
**Complexity**: Mellem  
**Concepts**: Document analysis, OCR, data extraction

#### Maskinlæringspipeline
**Technologies**: Azure ML, MLOps, Container Registry  
**Complexity**: Avanceret  
**Concepts**: Model training, deployment pipelines, monitoring

## 🛠 Konfigurationseksempler

The `configurations/` directory contains reusable components:

### Miljøkonfigurationer
- Development environment settings
- Staging environment configurations
- Production-ready configurations
- Multi-region deployment setups

### Bicep-moduler
- Reusable infrastructure components
- Common resource patterns
- Security-hardened templates
- Cost-optimized configurations

### Hjælpescripts
- Environment setup automation
- Database migration scripts
- Deployment validation tools
- Cost monitoring utilities

## 🔧 Tilpasningsvejledning

### Tilpas eksempler til dit brugstilfælde

1. **Gennemgå forudsætninger**
   - Check Azure service requirements
   - Verify subscription limits
   - Understand cost implications

2. **Tilpas konfiguration**
   - Update `azure.yaml` service definitions
   - Customize Bicep templates
   - Adjust environment variables

3. **Test grundigt**
   - Deploy to development environment first
   - Validate functionality
   - Test scaling and performance

4. **Sikkerhedsgennemgang**
   - Review access controls
   - Implement secrets management
   - Enable monitoring and alerting

## 📊 Sammenligningsmatrix

| Eksempel | Tjenester | Database | Godkendelse | Overvågning | Kompleksitet |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (Lokal) | 2 | ❌ | Key Vault | Full | ⭐⭐ |
| **Python Flask API** (Lokal) | 1 | ❌ | Basic | Full | ⭐ |
| **Microservices** (Lokal) | 5+ | ✅ | Enterprise | Advanced | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Basic | Basic | ⭐ |
| React SPA + Functions | 3 | ✅ | Basic | Full | ⭐ |
| Python Flask Container | 2 | ❌ | Basic | Full | ⭐ |
| C# Web API + SQL | 2 | ✅ | Full | Full | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Full | Full | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Full | Full | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | Full | Full | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Basic | Full | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Full | Full | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Lokal) | **8+** | **✅** | **Enterprise** | **Avanceret** | **⭐⭐⭐⭐** |

## 🎓 Læringssti

### Anbefalet rækkefølge

1. **Start med Simple Web App**
   - Learn basic AZD concepts
   - Understand deployment workflow
   - Practice environment management

2. **Prøv Static Website**
   - Explore different hosting options
   - Learn about CDN integration
   - Understand DNS configuration

3. **Gå videre til Container App**
   - Learn containerization basics
   - Understand scaling concepts
   - Practice with Docker

4. **Tilføj databaseintegration**
   - Learn database provisioning
   - Understand connection strings
   - Practice secrets management

5. **Udforsk serverless**
   - Understand event-driven architecture
   - Learn about triggers and bindings
   - Practice with APIs

6. **Byg mikrotjenester**
   - Learn service communication
   - Understand distributed systems
   - Practice complex deployments

## 🔍 Find det rigtige eksempel

### Efter teknologistak
- **Container Apps**: [Python Flask API (Lokal)](../../../examples/container-app/simple-flask-api), [Microservices (Lokal)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Lokal)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Lokal)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Lokal)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Lokal)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Microservices User Service (Lokal)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Lokal)](../../../examples/container-app/simple-flask-api), [Microservices (Lokal)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (Lokal)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (Lokal)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Microsoft Foundry Models Chat (Lokal)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (Lokal)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Efter arkitekturmønster
- **Simple REST API**: [Python Flask API (Lokal)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Lokal)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (Lokal)](../../../examples/container-app/simple-flask-api), [Microservices (Lokal)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Microsoft Foundry Models Chat (Lokal)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (Lokal)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Efter kompleksitetsniveau
- **Begynder**: [Python Flask API (Lokal)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Mellem**: **[Microsoft Foundry Models Chat (Lokal)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **Avanceret**: ML Pipeline
- **Klar til produktion for virksomheder**: [Microservices (Lokal)](../../../examples/container-app/microservices) (Multi-service with message queuing), **Retail Multi-Agent Solution** (Complete multi-agent system with ARM template deployment)

## 📚 Yderligere ressourcer

### Dokumentationslinks
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Fællesskabseksempler
- [Azure-eksempler AZD-skabeloner](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry-skabeloner](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI-galleri](https://azure.github.io/awesome-azd/)
- [Todo-app med C# og Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo-app med Python og MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo-app med Node.js og PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React-webapp med C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps-job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions med Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Bedste praksis
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Bidrag med eksempler

Har du et nyttigt eksempel at dele? Vi tager gerne imod bidrag!

### Retningslinjer for indsendelse
1. Følg den etablerede mappestruktur
2. Inkluder en omfattende README.md
3. Tilføj kommentarer til konfigurationsfilerne
4. Test grundigt før indsendelse
5. Inkluder omkostningsoverslag og forudsætninger

### Eksempel på skabelonstruktur
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

**Pro Tip**: Start med det simpleste eksempel, der passer til din teknologistak, og arbejd dig gradvist op til mere komplekse scenarier. Hvert eksempel bygger videre på koncepter fra de foregående!

## 🚀 Klar til at komme i gang?

### Din læringsvej

1. **Helt nybegynder?** → Start med [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 min)
2. **Har grundlæggende AZD-viden?** → Prøv [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 min)
3. **Bygger du AI-apps?** → Start med [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 min) eller udforsk [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ timer)
4. **Bruger du en specifik teknologistak?** → Brug afsnittet [Find det rigtige eksempel](#-finding-the-right-example) ovenfor

### Næste skridt

- ✅ Gennemgå [Forudsætninger](#forudsætninger) ovenfor
- ✅ Vælg et eksempel, der matcher dit færdighedsniveau (se [Kompleksitetslegende](#kompleksitetsbedømmelse))
- ✅ Læs eksemplets README grundigt, før du udruller
- ✅ Sæt en påmindelse om at køre `azd down` efter test
- ✅ Del din oplevelse via GitHub Issues eller Discussions

### Brug for hjælp?

- 📖 [FAQ](../resources/faq.md) - Almindelige spørgsmål besvaret
- 🐛 [Fejlfindingvejledning](../docs/chapter-07-troubleshooting/common-issues.md) - Ret udrulningsproblemer
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Spørg fællesskabet
- 📚 [Studieguide](../resources/study-guide.md) - Styrk din læring

---

**Navigation**
- **📚 Kursusforside**: [AZD For Beginners](../README.md)
- **📖 Studieressourcer**: [Studieguide](../resources/study-guide.md) | [Hurtigoversigt](../resources/cheat-sheet.md) | [Ordliste](../resources/glossary.md)
- **🔧 Ressourcer**: [FAQ](../resources/faq.md) | [Fejlfinding](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Sidst opdateret: November 2025 | [Rapporter problemer](https://github.com/microsoft/AZD-for-beginners/issues) | [Bidrag med eksempler](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Dokumentet i dets oprindelige sprog bør betragtes som den autoritative kilde. For kritiske oplysninger anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->