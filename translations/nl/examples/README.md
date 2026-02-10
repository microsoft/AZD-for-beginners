# Voorbeelden - Praktische AZD-sjablonen en Configuraties

**Leren door Voorbeelden - Georganiseerd per Hoofdstuk**
- **📚 Cursus Home**: [AZD Voor Beginners](../README.md)
- **📖 Hoofdstukmapping**: Voorbeelden georganiseerd naar leerniveau
- **🚀 Lokaal Voorbeeld**: [Retail Multi-Agent Solution](retail-scenario.md)
- **🤖 Externe AI Voorbeelden**: Links naar Azure Samples repositories

> **📍 BELANGRIJK: Lokale vs Externe Voorbeelden**  
> Deze repository bevat **4 complete lokale voorbeelden** met volledige implementaties:  
> - **Azure OpenAI Chat** (GPT-4 deployment met chatinterface)  
> - **Container Apps** (Eenvoudige Flask API + microservices)  
> - **Database App** (Web + SQL Database)  
> - **Retail Multi-Agent** (Enterprise AI-oplossing)  
>  
> Aanvullende voorbeelden zijn **externe verwijzingen** naar Azure-Samples repositories die je kunt clonen.

## Introductie

Deze map biedt praktische voorbeelden en verwijzingen om je te helpen de Azure Developer CLI te leren door middel van hands-on oefening. Het Retail Multi-Agent scenario is een volledige, productieklare implementatie inbegrepen in deze repository. Aanvullende voorbeelden verwijzen naar officiële Azure Samples die verschillende AZD-patronen demonstreren.

### Legenda Complexiteitsbeoordeling

- ⭐ **Beginner** - Basisconcepten, enkele service, 15-30 minuten
- ⭐⭐ **Gemiddeld** - Meerdere services, database-integratie, 30-60 minuten
- ⭐⭐⭐ **Gevorderd** - Complexe architectuur, AI-integratie, 1-2 uur
- ⭐⭐⭐⭐ **Expert** - Productieklaar, enterprise-patronen, 2+ uur

## 🎯 Wat Staat Er Eigenlijk in Deze Repository

### ✅ Lokale Implementatie (Klaar voor Gebruik)

#### [Azure OpenAI Chat Application](azure-openai-chat/README.md) 🆕
**Volledige GPT-4 deployment met chatinterface inbegrepen in deze repo**

- **Locatie:** `examples/azure-openai-chat/`
- **Complexiteit:** ⭐⭐ (Gemiddeld)
- **Wat is inbegrepen:**
  - Volledige Azure OpenAI deployment (GPT-4)
  - Python command-line chatinterface
  - Key Vault-integratie voor veilige API-sleutels
  - Bicep infrastructuursjablonen
  - Tokengebruik en kostenmonitoring
  - Rate limiting en foutafhandeling

**Snelstart:**
```bash
# Navigeer naar voorbeeld
cd examples/azure-openai-chat

# Rol alles uit
azd up

# Installeer afhankelijkheden en begin met chatten
pip install -r src/requirements.txt
python src/chat.py
```

**Technologieën:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Container App Examples](container-app/README.md) 🆕
**Uitgebreide container deployment voorbeelden inbegrepen in deze repo**

- **Locatie:** `examples/container-app/`
- **Complexiteit:** ⭐-⭐⭐⭐⭐ (Beginner tot Gevorderd)
- **Wat is inbegrepen:**
  - [Master Guide](container-app/README.md) - Volledig overzicht van container deployments
  - [Simple Flask API](../../../examples/container-app/simple-flask-api) - Basis REST API voorbeeld
  - [Microservices Architecture](../../../examples/container-app/microservices) - Productieklaar multi-service deployment
  - Snelstart, Productie- en Geavanceerde patronen
  - Monitoring, beveiliging en kostenoptimalisatie

**Snelstart:**
```bash
# Bekijk de mastergids
cd examples/container-app

# Implementeer eenvoudige Flask-API
cd simple-flask-api
azd up

# Implementeer voorbeeld van microservices
cd ../microservices
azd up
```

**Technologieën:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent Solution](retail-scenario.md) 🆕
**Volledige productieklare implementatie inbegrepen in deze repo**

- **Locatie:** `examples/retail-multiagent-arm-template/`
- **Complexiteit:** ⭐⭐⭐⭐ (Gevorderd)
- **Wat is inbegrepen:**
  - Volledig ARM deployment template
  - Multi-agent architectuur (Customer + Inventory)
  - Azure OpenAI-integratie
  - AI Search met RAG
  - Uitgebreide monitoring
  - One-click deployment script

**Snelstart:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Technologieën:** Azure OpenAI, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Externe Azure Samples (Clonen om te gebruiken)

De volgende voorbeelden worden onderhouden in officiële Azure-Samples repositories. Clone ze om verschillende AZD-patronen te verkennen:

### Eenvoudige Applicaties (Hoofdstukken 1-2)

| Template | Repository | Complexiteit | Services |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Lokaal: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Lokaal: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-service, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Hoe te gebruiken:**
```bash
# Kloon elk voorbeeld
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Uitrollen
azd up
```

### AI Applicatie Voorbeelden (Hoofdstukken 2, 5, 8)

| Template | Repository | Complexiteit | Focus |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI Chat** | [Lokaal: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | GPT-4 deployment |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Basis AI-chat |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agent-framework |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG-patroon |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Enterprise AI |

### Database & Geavanceerde Patronen (Hoofdstukken 3-8)

| Template | Repository | Complexiteit | Focus |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Database-integratie |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-service |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Leerdoelen

Door met deze voorbeelden te werken, zul je:
- Azure Developer CLI-workflows oefenen met realistische applicatiescenario's
- Verschillende applicatiearchitecturen en hun azd-implementaties begrijpen
- Infrastructure as Code-patronen voor verschillende Azure-services beheersen
- Configuratiebeheer en omgevingsspecifieke deploymentstrategieën toepassen
- Monitoring-, beveiligings- en schaalpatronen implementeren in praktische contexten
- Ervaring opbouwen met het oplossen van problemen en debuggen van echte deploymentscenario's

## Leerresultaten

Na het voltooien van deze voorbeelden zul je in staat zijn om:
- Verschillende applicatietypes met vertrouwen te deployen met Azure Developer CLI
- De aangeleverde sjablonen aan te passen aan je eigen applicatievereisten
- Aangepaste infrastructuurpatronen te ontwerpen en te implementeren met Bicep
- Complexe multi-service applicaties te configureren met juiste afhankelijkheden
- Beveiliging-, monitoring- en prestatiebest practices toe te passen in echte scenario's
- Deployments te troubleshooten en te optimaliseren op basis van praktische ervaring

## Directorystructuur

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

## Snelstart Voorbeelden

> **💡 Nieuw met AZD?** Begin met voorbeeld #1 (Flask API) - het duurt ~20 minuten en leert kernconcepten.

### Voor Beginners
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Lokaal) ⭐  
   Deploy een eenvoudige REST API met scale-to-zero  
   **Tijd:** 20-25 minuten | **Kosten:** $0-5/maand  
   **Wat je leert:** Basis azd-workflow, containerisatie, health probes  
   **Verwacht resultaat:** Werkende API-endpoint die "Hello, World!" retourneert met monitoring

2. **[Eenvoudige Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Deploy een Node.js Express webapplicatie met MongoDB  
   **Tijd:** 25-35 minuten | **Kosten:** $10-30/maand  
   **Wat je leert:** Database-integratie, omgevingsvariabelen, connection strings  
   **Verwacht resultaat:** Todo-list app met create/read/update/delete-functionaliteit

3. **[Statische Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Host een React statische website met Azure Static Web Apps  
   **Tijd:** 20-30 minuten | **Kosten:** $0-10/maand  
   **Wat je leert:** Static hosting, serverless functions, CDN-deploy  
   **Verwacht resultaat:** React UI met API-backend, automatische SSL, globale CDN

### Voor Gemiddelde Gebruikers
4. **[Azure OpenAI Chat Application](../../../examples/azure-openai-chat)** (Lokaal) ⭐⭐  
   Deploy GPT-4 met chatinterface en veilige API-sleutelbeheer  
   **Tijd:** 35-45 minuten | **Kosten:** $50-200/maand  
   **Wat je leert:** Azure OpenAI deployment, Key Vault-integratie, tokentracking  
   **Verwacht resultaat:** Werkende chatapplicatie met GPT-4 en kostenmonitoring

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Lokaal) ⭐⭐⭐⭐  
   Productieklaar multi-service architectuur  
   **Tijd:** 45-60 minuten | **Kosten:** $50-150/maand  
   **Wat je leert:** Servicecommunicatie, message queuing, gedistribueerde tracing  
   **Verwacht resultaat:** 2-service systeem (API Gateway + Product Service) met monitoring

6. **[Database App - C# met Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Webapplicatie met C# API en Azure SQL Database  
   **Tijd:** 30-45 minuten | **Kosten:** $20-80/maand  
   **Wat je leert:** Entity Framework, database-migraties, verbindingsbeveiliging  
   **Verwacht resultaat:** C# API met Azure SQL backend, automatische schema-deploy

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions met HTTP-triggers en Cosmos DB  
   **Tijd:** 30-40 minuten | **Kosten:** $10-40/maand  
   **Wat je leert:** Event-driven architectuur, serverless scaling, NoSQL-integratie  
   **Verwacht resultaat:** Function app die reageert op HTTP-aanvragen met Cosmos DB-opslag

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Multi-service Java-applicatie met Container Apps en API-gateway  
   **Tijd:** 60-90 minuten | **Kosten:** $80-200/maand  
   **Wat je leert:** Spring Boot deployment, service mesh, load balancing  
   **Verwacht resultaat:** Multi-service Java-systeem met service discovery en routing

### Microsoft Foundry Templates

1. **[Azure OpenAI Chat App - Lokaal Voorbeeld](../../../examples/azure-openai-chat)** ⭐⭐  
   Volledige GPT-4 deployment met chatinterface  
   **Tijd:** 35-45 minuten | **Kosten:** $50-200/maand  
   **Verwacht resultaat:** Werkende chatapplicatie met tokentracking en kostenmonitoring

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Intelligente chatapplicatie met RAG-architectuur  
   **Tijd:** 60-90 minuten | **Kosten:** $100-300/maand  
   **Verwacht resultaat:** RAG-aangedreven chatinterface met documentzoekfunctie en citaties

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Documentanalyse met Azure AI-services  
   **Tijd:** 40-60 minuten | **Kosten:** $20-80/maand  
   **Verwacht resultaat:** API die tekst, tabellen en entiteiten uit geüploade documenten extraheert

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps-workflow met Azure Machine Learning  
   **Tijd:** 2-3 uur | **Kosten:** $150-500/maand  
   **Verwacht resultaat:** Geautomatiseerde ML-pijplijn met training, deployment en monitoring

### Praktijkvoorbeelden

#### **Retail Multi-Agent Solution** 🆕
**[Volledige Implementatiehandleiding](./retail-scenario.md)**

Een uitgebreide, productieklare multi-agent klantenserviceoplossing die enterprise-grade AI-applicatie-deployments met AZD demonstreert. Dit scenario biedt:

- **Volledige architectuur**: Multi-agent systeem met gespecialiseerde klantenservice- en voorraadbeheersagenten
- **Productie-infrastructuur**: Multi-region Azure OpenAI-implementaties, AI Search, Container Apps en uitgebreide monitoring
- **Klaar-om-te-implementeren ARM Template**: Eenmalige implementatie met meerdere configuratiemodi (Minimal/Standard/Premium)
- **Geavanceerde functies**: red teaming-beveiligingsvalidatie, agent-evaluatiekader, kostenoptimalisatie en probleemoplossingshandleidingen
- **Echte zakelijke context**: Klantenondersteuningscase voor detailhandel met bestandsuploads, zoekintegratie en dynamische schaalbaarheid

**Technologieën**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Complexiteit**: ⭐⭐⭐⭐ (Geavanceerd - Klaar voor enterprise-productie)

**Perfect voor**: AI-ontwikkelaars, oplossingsarchitecten en teams die productie multi-agentsystemen bouwen

**Snelstart**: Implementeer de volledige oplossing in minder dan 30 minuten met het meegeleverde ARM-sjabloon met `./deploy.sh -g myResourceGroup`

## 📋 Gebruiksinstructies

### Vereisten

Voordat u een voorbeeld uitvoert:
- ✅ Azure-abonnement met Owner- of Contributor-toegang
- ✅ Azure Developer CLI geïnstalleerd ([Installatiegids](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop actief (voor container-voorbeelden)
- ✅ Geschikte Azure-quota's (controleer voorbeeldspecifieke vereisten)

> **💰 Kostenwaarschuwing:** Alle voorbeelden maken echte Azure-resources die kosten met zich meebrengen. Zie de afzonderlijke README-bestanden voor kostenschattingen. Vergeet niet `azd down` uit te voeren wanneer u klaar bent om doorlopende kosten te voorkomen.

### Voorbeelden lokaal uitvoeren

1. **Voorbeeld klonen of kopiëren**
   ```bash
   # Navigeer naar het gewenste voorbeeld
   cd examples/simple-web-app
   ```

2. **Initialiseer AZD-omgeving**
   ```bash
   # Initialiseren met een bestaand sjabloon
   azd init
   
   # Of maak een nieuwe omgeving
   azd env new my-environment
   ```

3. **Configureer omgeving**
   ```bash
   # Stel vereiste variabelen in
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Implementeer**
   ```bash
   # Implementeer infrastructuur en applicatie
   azd up
   ```

5. **Verifieer implementatie**
   ```bash
   # Haal service-eindpunten op
   azd env get-values
   
   # Test het eindpunt (voorbeeld)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Verwachte succesindicatoren:**
   - ✅ `azd up` voltooit zonder fouten
   - ✅ Service-endpoint retourneert HTTP 200
   - ✅ Azure Portal toont "Running" status
   - ✅ Application Insights ontvangt telemetrie

> **⚠️ Problemen?** Zie [Veelvoorkomende problemen](../docs/chapter-07-troubleshooting/common-issues.md) voor probleemoplossing bij implementatie

### Voorbeelden aanpassen

Elk voorbeeld bevat:
- **README.md** - Gedetailleerde installatie- en aanpassingsinstructies
- **azure.yaml** - AZD-configuratie met opmerkingen
- **infra/** - Bicep-sjablonen met parameteruitleg
- **src/** - Voorbeeldapplicatiecode
- **scripts/** - Hulpscripts voor veelvoorkomende taken

## 🎯 Leerdoelen

### Voorbeeldcategorieën

#### **Eenvoudige implementaties**
- Applicaties met één service
- Eenvoudige infrastructuurpatronen
- Basisconfiguratiebeheer
- Kostenbesparende ontwikkelomgevingen

#### **Geavanceerde scenario's**
- Architecturen met meerdere services
- Complexe netwerkconfiguraties
- Database-integratiepatronen
- Implementaties voor beveiliging en compliance

#### **Productieklare patronen**
- Configuraties voor hoge beschikbaarheid
- Monitoring en observeerbaarheid
- CI/CD-integratie
- Opstellingen voor disaster recovery

## 📖 Voorbeeldbeschrijvingen

### Eenvoudige webapp - Node.js Express
**Technologieën**: Node.js, Express, MongoDB, Container Apps  
**Complexiteit**: Beginner  
**Concepten**: Basisimplementatie, REST API, NoSQL-database-integratie

### Statische website - React SPA
**Technologieën**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complexiteit**: Beginner  
**Concepten**: Statische hosting, serverless-backend, moderne webontwikkeling

### Container App - Python Flask
**Technologieën**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Complexiteit**: Beginner  
**Concepten**: Containerisatie, REST API, scale-to-zero, health probes, monitoring  
**Locatie**: [Lokaal voorbeeld](../../../examples/container-app/simple-flask-api)

### Container App - Microservicesarchitectuur
**Technologieën**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complexiteit**: Geavanceerd  
**Concepten**: Multi-service-architectuur, servicecommunicatie, message queuing, distributed tracing  
**Locatie**: [Lokaal voorbeeld](../../../examples/container-app/microservices)

### Database-app - C# met Azure SQL
**Technologieën**: C# ASP.NET Core, Azure SQL Database, App Service  
**Complexiteit**: Gemiddeld  
**Concepten**: Entity Framework, databaseconnecties, web-API-ontwikkeling

### Serverless-functie - Python Azure Functions
**Technologieën**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complexiteit**: Gemiddeld  
**Concepten**: Event-driven architectuur, serverless computing, full-stack ontwikkeling

### Microservices - Java Spring Boot
**Technologieën**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Complexiteit**: Gemiddeld  
**Concepten**: Microservices-communicatie, gedistribueerde systemen, enterprisepatronen

### Microsoft Foundry-voorbeelden

#### Azure OpenAI Chat-app
**Technologieën**: Azure OpenAI, Cognitive Search, App Service  
**Complexiteit**: Gemiddeld  
**Concepten**: RAG-architectuur, vectorzoekopdrachten, LLM-integratie

#### AI-documentverwerking
**Technologieën**: Azure AI Document Intelligence, Storage, Functions  
**Complexiteit**: Gemiddeld  
**Concepten**: Documentanalyse, OCR, data-extractie

#### Machine learning-pijplijn
**Technologieën**: Azure ML, MLOps, Container Registry  
**Complexiteit**: Geavanceerd  
**Concepten**: Modeltraining, implementatiepijplijnen, monitoring

## 🛠 Configuratievoorbeelden

De map `configurations/` bevat herbruikbare componenten:

### Omgevingsconfiguraties
- Development-omgevingsinstellingen
- Staging-omgevingsconfiguraties
- Productieklare configuraties
- Multi-regio-implementatieopstellingen

### Bicep-modules
- Herbruikbare infrastructuurcomponenten
- Veelvoorkomende resourcepatronen
- Security-hardening-sjablonen
- Kosten-geoptimaliseerde configuraties

### Hulpscripts
- Automatisering van omgevingssetup
- Database-migratiescripts
- Validatietools voor implementatie
- Hulpprogramma's voor kostenmonitoring

## 🔧 Aanpassingshandleiding

### Voorbeelden aanpassen aan uw gebruiksscenario

1. **Bekijk vereisten**
   - Controleer Azure-servicevereisten
   - Verifieer abonnementslimieten
   - Begrijp kostenimplicaties

2. **Wijzig configuratie**
   - Werk `azure.yaml` service-definities bij
   - Pas Bicep-sjablonen aan
   - Stel omgevingsvariabelen bij

3. **Test grondig**
   - Implementeer eerst in de ontwikkelomgeving
   - Valideer functionaliteit
   - Test schaling en prestaties

4. **Beveiligingsreview**
   - Controleer toegangscontroles
   - Implementeer geheimenbeheer
   - Schakel monitoring en alerting in

## 📊 Vergelijkingsmatrix

| Voorbeeld | Services | Database | Authenticatie | Monitoring | Complexiteit |
|---------|----------|----------|------|------------|------------|
| **Azure OpenAI Chat** (Lokaal) | 2 | ❌ | Key Vault | Volledig | ⭐⭐ |
| **Python Flask API** (Lokaal) | 1 | ❌ | Basis | Volledig | ⭐ |
| **Microservices** (Lokaal) | 5+ | ✅ | Enterprise | Geavanceerd | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Basis | Basis | ⭐ |
| React SPA + Functions | 3 | ✅ | Basis | Volledig | ⭐ |
| Python Flask Container | 2 | ❌ | Basis | Volledig | ⭐ |
| C# Web API + SQL | 2 | ✅ | Volledig | Volledig | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Volledig | Volledig | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Volledig | Volledig | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Volledig | Volledig | ⭐⭐⭐ |
| AI-documentverwerking | 2 | ❌ | Basis | Volledig | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Volledig | Volledig | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Lokaal) | **8+** | **✅** | **Enterprise** | **Geavanceerd** | **⭐⭐⭐⭐** |

## 🎓 Leerpad

### Aanbevolen volgorde

1. **Begin met Eenvoudige webapp**
   - Leer basisconcepten van AZD
   - Begrijp de implementatiestroom
   - Oefen met omgevingsbeheer

2. **Probeer Statische website**
   - Verken verschillende hostingopties
   - Leer over CDN-integratie
   - Begrijp DNS-configuratie

3. **Ga naar Container App**
   - Leer containerisatiebasisprincipes
   - Begrijp schaalconcepten
   - Oefen met Docker

4. **Voeg database-integratie toe**
   - Leer databaseprovisioning
   - Begrijp connectiestrings
   - Oefen met geheimenbeheer

5. **Verken Serverless**
   - Begrijp event-driven architectuur
   - Leer over triggers en bindings
   - Oefen met API's

6. **Bouw Microservices**
   - Leer servicecommunicatie
   - Begrijp gedistribueerde systemen
   - Oefen met complexe implementaties

## 🔍 Het juiste voorbeeld vinden

### Per technologiestack
- **Container Apps**: [Python Flask API (Lokaal)](../../../examples/container-app/simple-flask-api), [Microservices (Lokaal)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Lokaal)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Lokaal)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Lokaal)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Lokaal)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Go**: [Microservices User Service (Lokaal)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Lokaal)](../../../examples/container-app/simple-flask-api), [Microservices (Lokaal)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (Lokaal)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI-documentverwerking, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (Lokaal)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Per architectuurpatroon
- **Eenvoudige REST API**: [Python Flask API (Lokaal)](../../../examples/container-app/simple-flask-api)
- **Monolithisch**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Lokaal)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Gecontaineriseerd**: [Python Flask (Lokaal)](../../../examples/container-app/simple-flask-api), [Microservices (Lokaal)](../../../examples/container-app/microservices)
- **AI-aangedreven**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI-documentverwerking, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architectuur**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (Lokaal)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Per complexiteitsniveau
- **Beginner**: [Python Flask API (Lokaal)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Gemiddeld**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI-documentverwerking
- **Geavanceerd**: ML Pipeline
- **Enterprise productieklaar**: [Microservices (Lokaal)](../../../examples/container-app/microservices) (Multi-service met message queuing), **Retail Multi-Agent Solution** (Complete multi-agent-systeem met ARM-sjabloonimplementatie)

## 📚 Aanvullende bronnen

### Documentatielinks
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Community-voorbeelden
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo-app met Node.js en PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React-webapp met C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps-taak](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions met Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Beste praktijken
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Voorbeelden bijdragen

Heb je een nuttig voorbeeld om te delen? We verwelkomen bijdragen!

### Richtlijnen voor inzendingen
1. Volg de vastgestelde mappenstructuur
2. Voeg een uitgebreide README.md toe
3. Voeg opmerkingen toe aan configuratiebestanden
4. Test grondig voordat je indient
5. Voeg kostenramingen en vereisten toe

### Voorbeeldsjabloonstructuur
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

**Pro Tip**: Begin met het eenvoudigste voorbeeld dat bij je technologiestack past, en werk geleidelijk naar complexere scenario's toe. Elk voorbeeld bouwt voort op concepten uit de vorige voorbeelden!

## 🚀 Klaar om te beginnen?

### Jouw leerpad

1. **Volledige beginner?** → Begin met [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 min)
2. **Heb je basiskennis van AZD?** → Probeer [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 min)
3. **AI-apps bouwen?** → Begin met [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 min) of verken [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ uur)
4. **Een specifieke techstack nodig?** → Gebruik de sectie [Het juiste voorbeeld vinden](../../../examples) hierboven

### Volgende stappen

- ✅ Bekijk [Vereisten](../../../examples) hierboven
- ✅ Kies een voorbeeld dat bij je vaardigheidsniveau past (zie [Complexiteitslegenda](../../../examples))
- ✅ Lees de README van het voorbeeld grondig voordat je het implementeert
- ✅ Zet een herinnering om `azd down` uit te voeren na het testen
- ✅ Deel je ervaring via GitHub Issues of Discussions

### Hulp nodig?

- 📖 [FAQ](../resources/faq.md) - Veelgestelde vragen beantwoord
- 🐛 [Troubleshooting Guide](../docs/chapter-07-troubleshooting/common-issues.md) - Los implementatieproblemen op
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Stel vragen aan de community
- 📚 [Study Guide](../resources/study-guide.md) - Versterk je kennis

---

**Navigatie**
- **📚 Cursusstartpagina**: [AZD For Beginners](../README.md)
- **📖 Studiemateriaal**: [Study Guide](../resources/study-guide.md) | [Cheat Sheet](../resources/cheat-sheet.md) | [Glossary](../resources/glossary.md)
- **🔧 Hulpbronnen**: [FAQ](../resources/faq.md) | [Troubleshooting](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Laatst bijgewerkt: November 2025 | [Problemen melden](https://github.com/microsoft/AZD-for-beginners/issues) | [Voorbeelden bijdragen](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI-vertalingsdienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, moet u zich ervan bewust zijn dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het oorspronkelijke document in de oorspronkelijke taal moet als de gezaghebbende bron worden beschouwd. Voor kritieke informatie wordt een professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->