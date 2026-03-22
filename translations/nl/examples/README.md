# Voorbeelden - Praktische AZD-sjablonen en configuraties

**Leren door Voorbeelden - Georganiseerd per Hoofdstuk**
- **📚 Cursus Startpagina**: [AZD voor Beginners](../README.md)
- **📖 Hoofdstukindeling**: Voorbeelden georganiseerd op leerniveau
- **🚀 Lokaal Voorbeeld**: [Retail Multi-Agent Oplossing](retail-scenario.md)
- **🤖 Externe AI-voorbeelden**: Links naar Azure Samples repositories

> **📍 BELANGRIJK: Lokale vs Externe Voorbeelden**  
> Deze repository bevat **4 volledige lokale voorbeelden** met volledige implementaties:  
> - **Microsoft Foundry Models Chat** (gpt-4.1-implementatie met chatinterface)  
> - **Container Apps** (Eenvoudige Flask API + Microservices)  
> - **Database App** (Web + SQL-database)  
> - **Retail Multi-Agent** (Enterprise AI-oplossing)  
>  
> Aanvullende voorbeelden zijn **externe verwijzingen** naar Azure-Samples repositories die je kunt clonen.

## Inleiding

Deze map bevat praktische voorbeelden en verwijzingen om je te helpen Azure Developer CLI te leren via hands-on oefening. Het Retail Multi-Agent scenario is een complete, productieklare implementatie opgenomen in deze repository. Aanvullende voorbeelden verwijzen naar officiële Azure Samples die verschillende AZD-patronen demonstreren.

### Legenda complexiteitsbeoordeling

- ⭐ **Beginner** - Basisconcepten, één service, 15-30 minuten  
- ⭐⭐ **Gemiddeld** - Meerdere services, database-integratie, 30-60 minuten  
- ⭐⭐⭐ **Geavanceerd** - Complexe architectuur, AI-integratie, 1-2 uur  
- ⭐⭐⭐⭐ **Expert** - Productieklaar, enterprise-patronen, 2+ uur

## 🎯 Wat er daadwerkelijk in deze repository staat

### ✅ Lokale Implementatie (Klaar voor gebruik)

#### [Microsoft Foundry Models Chat Toepassing](azure-openai-chat/README.md) 🆕
**Complete gpt-4.1-implementatie met chatinterface opgenomen in deze repo**

- **Locatie:** `examples/azure-openai-chat/`
- **Complexiteit:** ⭐⭐ (Gemiddeld)
- **Wat is inbegrepen:**
  - Volledige Microsoft Foundry Models-implementatie (gpt-4.1)
  - Python command-line chatinterface
  - Key Vault-integratie voor veilige API-sleutels
  - Bicep-infrastructuursjablonen
  - Tokengebruik en kostenbijhouding
  - Verzoeklimitering en foutafhandeling

**Snel aan de slag:**
```bash
# Navigeer naar het voorbeeld
cd examples/azure-openai-chat

# Implementeer alles
azd up

# Installeer afhankelijkheden en begin met chatten
pip install -r src/requirements.txt
python src/chat.py
```

**Technologieën:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Container App Voorbeelden](container-app/README.md) 🆕
**Uitgebreide containerimplementatie-voorbeelden opgenomen in deze repo**

- **Locatie:** `examples/container-app/`
- **Complexiteit:** ⭐-⭐⭐⭐⭐ (Beginner tot Geavanceerd)
- **Wat is inbegrepen:**
  - [Mastergids](container-app/README.md) - Volledig overzicht van containerimplementaties
  - [Eenvoudige Flask API](../../../examples/container-app/simple-flask-api) - Basis REST API-voorbeeld
  - [Microservices-architectuur](../../../examples/container-app/microservices) - Productieklare multi-service-implementatie
  - Snelstart-, Productie- en Geavanceerde patronen
  - Monitoring, beveiliging en kostenoptimalisatie

**Snel aan de slag:**
```bash
# Bekijk de mastergids
cd examples/container-app

# Implementeer een eenvoudige Flask-API
cd simple-flask-api
azd up

# Implementeer een microservices-voorbeeld
cd ../microservices
azd up
```

**Technologieën:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent Oplossing](retail-scenario.md) 🆕
**Complete productieklare implementatie opgenomen in deze repo**

- **Locatie:** `examples/retail-multiagent-arm-template/`
- **Complexiteit:** ⭐⭐⭐⭐ (Geavanceerd)
- **Wat is inbegrepen:**
  - Volledig ARM-implementatiesjabloon
  - Multi-agent architectuur (Customer + Inventory)
  - Microsoft Foundry Models-integratie
  - AI Search met RAG
  - Uitgebreide monitoring
  - One-click implementatiescript

**Snel aan de slag:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Technologieën:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Externe Azure Samples (Cloneer om te gebruiken)

De volgende voorbeelden worden onderhouden in officiële Azure-Samples repositories. Clone ze om verschillende AZD-patronen te verkennen:

### Eenvoudige Applicaties (Hoofdstukken 1-2)

| Sjabloon | Repository | Complexiteit | Diensten |
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

# Implementeer
azd up
```

### AI Applicatie Voorbeelden (Hoofdstukken 2, 5, 8)

| Sjabloon | Repository | Complexiteit | Focus |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [Lokaal: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 implementatie |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Basis AI-chat |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agent-framework |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG-patroon |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Enterprise AI |

### Database & Geavanceerde Patronen (Hoofdstukken 3-8)

| Sjabloon | Repository | Complexiteit | Focus |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Database-integratie |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-service |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Leerdoelen

Door met deze voorbeelden te werken, zul je:
- Azure Developer CLI-workflows oefenen met realistische applicatiescenario's
- Verschillende applicatiearchitecturen en hun azd-implementaties begrijpen
- Infrastructure as Code-patronen beheersen voor diverse Azure-diensten
- Configuratiebeheer en omgevingsspecifieke implementatiestrategieën toepassen
- Monitoring-, beveiligings- en schaalpatronen implementeren in praktische contexten
- Ervaring opdoen met probleemoplossing en debuggen van echte implementatiescenario's

## Leerresultaten

Na het voltooien van deze voorbeelden kun je:
- Verschillende applicatietypen met vertrouwen implementeren met Azure Developer CLI
- De aangeboden sjablonen aanpassen aan je eigen applicatievereisten
- Aangepaste infrastructuurpatronen ontwerpen en implementeren met Bicep
- Complexe multi-service applicaties configureren met de juiste afhankelijkheden
- Beveiligings-, monitoring- en prestatiebest practices toepassen in echte scenario's
- Implementaties probleemoplossen en optimaliseren op basis van praktische ervaring

## Mapstructuur

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

## Snelstartvoorbeelden

> **💡 Nieuw bij AZD?** Begin met voorbeeld #1 (Flask API) - het duurt ~20 minuten en leert kernconcepten.

### Voor Beginners
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Lokaal) ⭐  
   Implementeer een eenvoudige REST API met scale-to-zero  
   **Tijd:** 20-25 minuten | **Kosten:** $0-5/maand  
   **Je leert:** Basis azd-werkstroom, containerisatie, gezondheidscontroles  
   **Verwacht Resultaat:** Werkende API-endpoint die "Hello, World!" retourneert met monitoring

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Implementeer een Node.js Express webapplicatie met MongoDB  
   **Tijd:** 25-35 minuten | **Kosten:** $10-30/maand  
   **Je leert:** Database-integratie, omgevingsvariabelen, connection strings  
   **Verwacht Resultaat:** Todo-lijst app met create/read/update/delete-functionaliteit

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Host een React static website met Azure Static Web Apps  
   **Tijd:** 20-30 minuten | **Kosten:** $0-10/maand  
   **Je leert:** Static hosting, serverless functies, CDN-implementatie  
   **Verwacht Resultaat:** React UI met API-backend, automatische SSL, wereldwijd CDN

### Voor Gemiddelde Gebruikers
4. **[Microsoft Foundry Models Chat Toepassing](../../../examples/azure-openai-chat)** (Lokaal) ⭐⭐  
   Implementeer gpt-4.1 met chatinterface en beveiligd API-sleutelbeheer  
   **Tijd:** 35-45 minuten | **Kosten:** $50-200/maand  
   **Je leert:** Microsoft Foundry Models-implementatie, Key Vault-integratie, tokentracking  
   **Verwacht Resultaat:** Werkende chatapplicatie met gpt-4.1 en kostenmonitoring

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Lokaal) ⭐⭐⭐⭐  
   Productieklare multi-service architectuur  
   **Tijd:** 45-60 minuten | **Kosten:** $50-150/maand  
   **Je leert:** Servicecommunicatie, message queuing, distributed tracing  
   **Verwacht Resultaat:** 2-service systeem (API Gateway + Product Service) met monitoring

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Webapplicatie met C# API en Azure SQL Database  
   **Tijd:** 30-45 minuten | **Kosten:** $20-80/maand  
   **Je leert:** Entity Framework, database-migraties, connectieveiligheid  
   **Verwacht Resultaat:** C# API met Azure SQL-backend, automatische schema-implementatie

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions met HTTP-triggers en Cosmos DB  
   **Tijd:** 30-40 minuten | **Kosten:** $10-40/maand  
   **Je leert:** Event-driven architectuur, serverless schaling, NoSQL-integratie  
   **Verwacht Resultaat:** Function app die reageert op HTTP-verzoeken met Cosmos DB-opslag

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Multi-service Java-applicatie met Container Apps en API-gateway  
   **Tijd:** 60-90 minuten | **Kosten:** $80-200/maand  
   **Je leert:** Spring Boot-implementatie, service mesh, load balancing  
   **Verwacht Resultaat:** Multi-service Java-systeem met service discovery en routing

### Microsoft Foundry-sjablonen

1. **[Microsoft Foundry Models Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   Complete gpt-4.1-implementatie met chatinterface  
   **Tijd:** 35-45 minuten | **Kosten:** $50-200/maand  
   **Verwacht Resultaat:** Werkende chatapplicatie met tokentracking en kostenmonitoring

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Intelligente chatapplicatie met RAG-architectuur  
   **Tijd:** 60-90 minuten | **Kosten:** $100-300/maand  
   **Verwacht Resultaat:** RAG-aangedreven chatinterface met documentzoekfunctie en citaties

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Documentanalyse met Azure AI-diensten  
   **Tijd:** 40-60 minuten | **Kosten:** $20-80/maand  
   **Verwacht Resultaat:** API die tekst, tabellen en entiteiten uit geüploade documenten extraheert

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps-workflow met Azure Machine Learning  
   **Tijd:** 2-3 uur | **Kosten:** $150-500/maand  
   **Verwacht Resultaat:** Geautomatiseerde ML-pijplijn met training, implementatie en monitoring

### Praktijkscenario's

#### **Retail Multi-Agent Oplossing** 🆕
**[Volledige implementatiegids](./retail-scenario.md)**

Een uitgebreide, productieklare multi-agent klantenondersteuningsoplossing die enterprise-grade AI-applicatie-implementatie met AZD demonstreert. Dit scenario biedt:
- **Volledige architectuur**: Multi-agent systeem met gespecialiseerde agenten voor klantenservice en voorraadbeheer
- **Productie-infrastructuur**: Multi-regio implementaties van Microsoft Foundry Models, AI Search, Container Apps en uitgebreide monitoring
- **Klaar-om-te-implementeren ARM-sjabloon**: Eén-klik-implementatie met meerdere configuratiemodi (Minimal/Standard/Premium)
- **Geavanceerde functies**: Red teaming-beveiligingsvalidatie, evaluatiekader voor agenten, kostenoptimalisatie en handleidingen voor probleemoplossing
- **Echte zakelijke context**: Gebruikssituatie klantenservice van een retailer met bestandsuploads, zoekintegratie en dynamische schaling

**Technologieën**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Complexiteit**: ⭐⭐⭐⭐ (Geavanceerd - Enterprise productieklaar)

**Perfect voor**: AI-ontwikkelaars, oplossingsarchitecten en teams die productieklare multi-agentsystemen bouwen

**Snelle start**: Implementeer de complete oplossing in minder dan 30 minuten met het meegeleverde ARM-sjabloon met `./deploy.sh -g myResourceGroup`

## 📋 Gebruiksinstructies

### Vereisten

Voordat u een voorbeeld uitvoert:
- ✅ Azure-abonnement met Owner- of Contributor-toegang
- ✅ Azure Developer CLI geïnstalleerd ([Installatiehandleiding](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop draait (voor containervoorbeelden)
- ✅ Geschikte Azure-quotums (controleer voorbeeldspecifieke vereisten)

> **💰 Kostenwaarschuwing:** Alle voorbeelden maken echte Azure-resources die kosten met zich meebrengen. Zie de individuele README-bestanden voor kostenramingen. Vergeet niet `azd down` uit te voeren wanneer u klaar bent om doorlopende kosten te voorkomen.

### Voorbeelden lokaal uitvoeren

1. **Kloon of kopieer voorbeeld**
   ```bash
   # Navigeer naar het gewenste voorbeeld
   cd examples/simple-web-app
   ```

2. **Initialiseer AZD-omgeving**
   ```bash
   # Initialiseer met een bestaand sjabloon
   azd init
   
   # Of maak een nieuwe omgeving aan
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

5. **Controleer implementatie**
   ```bash
   # Haal service-eindpunten op
   azd env get-values
   
   # Test het eindpunt (voorbeeld)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Verwachte succesindicatoren:**
   - ✅ `azd up` voltooit zonder fouten
   - ✅ Service-eindpunt retourneert HTTP 200
   - ✅ Azure Portal toont status "Running"
   - ✅ Application Insights ontvangt telemetrie

> **⚠️ Problemen?** Zie [Veelvoorkomende problemen](../docs/chapter-07-troubleshooting/common-issues.md) voor hulp bij implementatieproblemen

### Voorbeelden aanpassen

Elk voorbeeld bevat:
- **README.md** - Gedetailleerde installatie- en aanpassingsinstructies
- **azure.yaml** - AZD-configuratie met opmerkingen
- **infra/** - Bicep-sjablonen met parameteruitleg
- **src/** - Voorbeeldapplicatiecode
- **scripts/** - Hulpscripts voor veelvoorkomende taken

## 🎯 Leerdoelen

### Voorbeeldcategorieën

#### **Basisimplementaties**
- Applicaties met één service
- Eenvoudige infrastructuurpatronen
- Basisconfiguratiebeheer
- Kosteneffectieve ontwikkelomgevingen

#### **Geavanceerde scenario's**
- Architecturen met meerdere services
- Complexe netwerkconfiguraties
- Patronen voor database-integratie
- Beveiligings- en compliance-implementaties

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
**Concepten**: Statische hosting, serverless backend, moderne webontwikkeling

### Container-app - Python Flask
**Technologieën**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Complexiteit**: Beginner  
**Concepten**: Containerisatie, REST API, scale-to-zero, gezondheidscontroles, monitoring  
**Location**: [Lokaal voorbeeld](../../../examples/container-app/simple-flask-api)

### Container-app - Microservicesarchitectuur
**Technologieën**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complexiteit**: Geavanceerd  
**Concepten**: Meerdere service-architectuur, servicecommunicatie, berichtwachtrij, gedistribueerde tracing  
**Location**: [Lokaal voorbeeld](../../../examples/container-app/microservices)

### Database-app - C# met Azure SQL
**Technologieën**: C# ASP.NET Core, Azure SQL Database, App Service  
**Complexiteit**: Intermediair  
**Concepten**: Entity Framework, databaseverbindingen, web-API-ontwikkeling

### Serverless-functie - Python Azure Functions
**Technologieën**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complexiteit**: Intermediair  
**Concepten**: Eventgedreven architectuur, serverless computing, full-stack ontwikkeling

### Microservices - Java Spring Boot
**Technologieën**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Complexiteit**: Intermediair  
**Concepten**: Communicatie tussen microservices, gedistribueerde systemen, enterprisepatronen

### Microsoft Foundry-voorbeelden

#### Microsoft Foundry Models Chat-app
**Technologieën**: Microsoft Foundry Models, Cognitive Search, App Service  
**Complexiteit**: Intermediair  
**Concepten**: RAG-architectuur, vectorzoekopdrachten, LLM-integratie

#### AI-documentverwerking
**Technologieën**: Azure AI Document Intelligence, Storage, Functions  
**Complexiteit**: Intermediair  
**Concepten**: Documentanalyse, OCR, gegevensextractie

#### Machine Learning-pijplijn
**Technologieën**: Azure ML, MLOps, Container Registry  
**Complexiteit**: Geavanceerd  
**Concepten**: Modeltraining, implementatiepijplijnen, monitoring

## 🛠 Configuratievoorbeelden

De `configurations/` directory bevat herbruikbare componenten:

### Omgevingsconfiguraties
- Instellingen voor ontwikkelomgeving
- Configuraties voor staging-omgeving
- Productieklare configuraties
- Multi-regio implementatieopstellingen

### Bicep-modules
- Herbruikbare infrastructuurcomponenten
- Veelvoorkomende resourcepatronen
- Beveiligingsgehardiseerde sjablonen
- Kostengeoptimaliseerde configuraties

### Hulpscripts
- Automatisering van omgevinginrichting
- Scripts voor databasemigratie
- Tools voor validatie van implementatie
- Hulpmiddelen voor kostenbewaking

## 🔧 Aanpassingsgids

### Voorbeelden aanpassen voor uw gebruiksscenario

1. **Controleer vereisten**
   - Controleer Azure-servicevereisten
   - Verifieer abonnementslimieten
   - Begrijp de kostenimplicaties

2. **Wijzig configuratie**
   - Werk `azure.yaml` service-definities bij
   - Pas Bicep-sjablonen aan
   - Pas omgevingsvariabelen aan

3. **Grondig testen**
   - Implementeer eerst naar de ontwikkelomgeving
   - Valideer functionaliteit
   - Test schaling en prestaties

4. **Beveiligingsreview**
   - Controleer toegangscontroles
   - Implementeer geheimenbeheer
   - Schakel monitoring en waarschuwingen in

## 📊 Vergelijkingsmatrix

| Voorbeeld | Services | Database | Authenticatie | Monitoring | Complexiteit |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (Lokaal) | 2 | ❌ | Key Vault | Volledig | ⭐⭐ |
| **Python Flask API** (Lokaal) | 1 | ❌ | Basis | Volledig | ⭐ |
| **Microservices** (Lokaal) | 5+ | ✅ | Enterprise | Geavanceerd | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Basis | Basis | ⭐ |
| React SPA + Functions | 3 | ✅ | Basis | Volledig | ⭐ |
| Python Flask Container | 2 | ❌ | Basis | Volledig | ⭐ |
| C# Web API + SQL | 2 | ✅ | Volledig | Volledig | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Volledig | Volledig | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Volledig | Volledig | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | Volledig | Volledig | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Basis | Volledig | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Volledig | Volledig | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Lokaal) | **8+** | **✅** | **Enterprise** | **Geavanceerd** | **⭐⭐⭐⭐** |

## 🎓 Leerlijn

### Aanbevolen volgorde

1. **Begin met de eenvoudige webapp**
   - Leer basisconcepten van AZD
   - Begrijp de implementatieworkflow
   - Oefen met omgevingsbeheer

2. **Probeer een statische website**
   - Ontdek verschillende hostingopties
   - Leer over CDN-integratie
   - Begrijp DNS-configuratie

3. **Ga naar Container-app**
   - Leer basisprincipes van containerisatie
   - Begrijp schalingsconcepten
   - Oefen met Docker

4. **Voeg database-integratie toe**
   - Leer database provisioning
   - Begrijp connection strings
   - Oefen met geheimenbeheer

5. **Verken serverless**
   - Begrijp eventgedreven architectuur
   - Leer over triggers en bindings
   - Oefen met API's

6. **Bouw microservices**
   - Leer servicecommunicatie
   - Begrijp gedistribueerde systemen
   - Oefen met complexe implementaties

## 🔍 Het juiste voorbeeld vinden

### Op technologiestack
- **Container Apps**: [Python Flask API (Lokaal)](../../../examples/container-app/simple-flask-api), [Microservices (Lokaal)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo-app, [Microservices API Gateway (Lokaal)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Lokaal)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Lokaal)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Lokaal)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Microservices User Service (Lokaal)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Lokaal)](../../../examples/container-app/simple-flask-api), [Microservices (Lokaal)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (Lokaal)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (Lokaal)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent-oplossing**
- **Multi-Agent Systems**: **Retail Multi-Agent-oplossing**
- **OpenAI Integration**: **[Microsoft Foundry Models Chat (Lokaal)](../../../examples/azure-openai-chat)**, Retail Multi-Agent-oplossing
- **Enterprise Production**: [Microservices (Lokaal)](../../../examples/container-app/microservices), **Retail Multi-Agent-oplossing**

### Op architectuurpatroon
- **Simple REST API**: [Python Flask API (Lokaal)](../../../examples/container-app/simple-flask-api)
- **Monolithisch**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Lokaal)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (Lokaal)](../../../examples/container-app/simple-flask-api), [Microservices (Lokaal)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Microsoft Foundry Models Chat (Lokaal)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent-oplossing**
- **Multi-Agent Architecture**: **Retail Multi-Agent-oplossing**
- **Enterprise Multi-Service**: [Microservices (Lokaal)](../../../examples/container-app/microservices), **Retail Multi-Agent-oplossing**

### Op complexiteitsniveau
- **Beginner**: [Python Flask API (Lokaal)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Intermediair**: **[Microsoft Foundry Models Chat (Lokaal)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **Geavanceerd**: ML Pipeline
- **Enterprise productieklaar**: [Microservices (Lokaal)](../../../examples/container-app/microservices) (Meerdere services met berichtwachtrij), **Retail Multi-Agent-oplossing** (Complete multi-agent systeem met ARM-sjabloonimplementatie)

## 📚 Aanvullende bronnen

### Documentatielinks
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Communityvoorbeelden
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo-app met C# en Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo-app met Python en MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo-app met Node.js en PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React-webapp met C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions met Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Beste praktijken
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Voorbeelden bijdragen

Heb je een nuttig voorbeeld om te delen? We verwelkomen bijdragen!

### Inzendingsrichtlijnen
1. Volg de vastgestelde mappenstructuur
2. Voeg een uitgebreide README.md toe
3. Voeg opmerkingen toe aan configuratiebestanden
4. Test grondig voordat je indient
5. Voeg kostenramingen en vereisten toe

### Voorbeeld sjabloonstructuur
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

**Pro Tip**: Begin met het eenvoudigste voorbeeld dat overeenkomt met je technologiestack, en werk dan geleidelijk naar complexere scenario's. Elk voorbeeld bouwt voort op concepten uit de vorige!

## 🚀 Klaar om te beginnen?

### Jouw leerpad

1. **Volledige beginner?** → Begin met [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 min)
2. **Heb je basiskennis van AZD?** → Probeer [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 min)
3. **AI-apps bouwen?** → Begin met [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 min) of verken [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ uur)
4. **Een specifieke technologiestack nodig?** → Gebruik de sectie [Het juiste voorbeeld vinden](#-finding-the-right-example) hierboven

### Volgende stappen

- ✅ Bekijk de [Vereisten](#vereisten) hierboven
- ✅ Kies een voorbeeld dat past bij je vaardigheidsniveau (zie [Complexiteitslegenda](#legenda-complexiteitsbeoordeling))
- ✅ Lees de README van het voorbeeld grondig voordat je het implementeert
- ✅ Zet een herinnering om na het testen `azd down` uit te voeren
- ✅ Deel je ervaring via GitHub Issues of Discussions

### Hulp nodig?

- 📖 [FAQ](../resources/faq.md) - Veelgestelde vragen beantwoord
- 🐛 [Probleemoplossingsgids](../docs/chapter-07-troubleshooting/common-issues.md) - Los implementatieproblemen op
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Vraag het de community
- 📚 [Studiegids](../resources/study-guide.md) - Versterk je kennis

---

**Navigatie**
- **📚 Cursus startpagina**: [AZD For Beginners](../README.md)
- **📖 Studie materialen**: [Studiegids](../resources/study-guide.md) | [Spiekbriefje](../resources/cheat-sheet.md) | [Woordenlijst](../resources/glossary.md)
- **🔧 Bronnen**: [FAQ](../resources/faq.md) | [Probleemoplossing](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Laatst bijgewerkt: November 2025 | [Problemen rapporteren](https://github.com/microsoft/AZD-for-beginners/issues) | [Voorbeelden bijdragen](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI-vertalingsdienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, houd er rekening mee dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het oorspronkelijke document in de oorspronkelijke taal moet als de gezaghebbende bron worden beschouwd. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor enige misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->