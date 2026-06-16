# Voorbeelden - Praktische AZD-sjablonen en configuraties

**Leren door Voorbeeld - Georganiseerd per Hoofdstuk**
- **📚 Cursus Startpagina**: [AZD For Beginners](../README.md)
- **📖 Hoofdstukindeling**: Voorbeelden georganiseerd naar leerniveau
- **🚀 Lokaal Voorbeeld**: [Retail Multi-Agent Solution](retail-scenario.md)
- **🤖 Externe AI-voorbeelden**: Links naar Azure Samples repositories

> **📍 BELANGRIJK: Lokale vs Externe Voorbeelden**  
> Deze repository bevat **4 complete lokale voorbeelden** met volledige implementaties:  
> - **Microsoft Foundry Models Chat** (gpt-4.1 implementatie met chatinterface)  
> - **Container Apps** (Eenvoudige Flask-API + Microservices)  
> - **Database App** (Web + SQL-database)  
> - **Retail Multi-Agent** (Enterprise AI-oplossing)  
>  
> Extra voorbeelden zijn **externe verwijzingen** naar Azure-Samples repositories die je kunt klonen.

## Introductie

Deze map biedt praktische voorbeelden en verwijzingen om je te helpen de Azure Developer CLI te leren via hands-on oefening. Het Retail Multi-Agent scenario is een complete, productieklare implementatie die in deze repository is opgenomen. Extra voorbeelden verwijzen naar officiële Azure Samples die verschillende AZD-patronen demonstreren.

### Legenda Complexiteitsbeoordeling

- ⭐ **Beginner** - Basisconcepten, één service, 15-30 minuten
- ⭐⭐ **Gemiddeld** - Meerdere services, database-integratie, 30-60 minuten
- ⭐⭐⭐ **Geavanceerd** - Complexe architectuur, AI-integratie, 1-2 uur
- ⭐⭐⭐⭐ **Expert** - Productieklaar, enterprise-patronen, 2+ uur

## 🎯 Wat er daadwerkelijk in deze repository staat

### ✅ Lokale implementatie (Klaar voor gebruik)

#### [Microsoft Foundry Models Chat Application](azure-openai-chat/README.md) 🆕
**Volledige gpt-4.1-implementatie met chatinterface opgenomen in deze repo**

- **Locatie:** `examples/azure-openai-chat/`
- **Complexiteit:** ⭐⭐ (Gemiddeld)
- **Wat is inbegrepen:**
  - Volledige Microsoft Foundry Models-implementatie (gpt-4.1)
  - Python commandoregel-chatinterface
  - Key Vault-integratie voor veilige API-sleutels
  - Bicep-infrastructuursjablonen
  - Bijhouden van tokengebruik en kosten
  - Rate-limiting en foutafhandeling

**Snelstart:**
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

#### [Container App Examples](container-app/README.md) 🆕
**Uitgebreide container-implementatievoorbeelden opgenomen in deze repo**

- **Locatie:** `examples/container-app/`
- **Complexiteit:** ⭐-⭐⭐⭐⭐ (Beginner tot Geavanceerd)
- **Wat is inbegrepen:**
  - [Master Guide](container-app/README.md) - Volledig overzicht van container-implementaties
  - [Simple Flask API](../../../examples/container-app/simple-flask-api) - Basisvoorbeeld van een REST-API
  - [Microservices Architecture](../../../examples/container-app/microservices) - Productieklaar multi-service-implementatie
  - Snelstart-, productie- en geavanceerde patronen
  - Monitoring, beveiliging en kostenoptimalisatie

**Snelstart:**
```bash
# Bekijk de hoofdhandleiding
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
**Volledige productieklare implementatie opgenomen in deze repo**

- **Locatie:** `examples/retail-multiagent-arm-template/`
- **Complexiteit:** ⭐⭐⭐⭐ (Geavanceerd)
- **Wat is inbegrepen:**
  - Volledig ARM-implementatiesjabloon
  - Multi-agentarchitectuur (Customer + Inventory)
  - Microsoft Foundry Models-integratie
  - AI Search met RAG
  - Uitgebreide monitoring
  - Een-klik-implementatiescript

**Snelstart:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Technologieën:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Externe Azure-samples (Klonen om te gebruiken)

De volgende voorbeelden worden onderhouden in officiële Azure-Samples repositories. Kloneer ze om verschillende AZD-patronen te verkennen:

### Eenvoudige toepassingen (Hoofdstukken 1-2)

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

# Uitrollen
azd up
```

### AI-toepassingsvoorbeelden (Hoofdstukken 2, 5, 8)

| Sjabloon | Repository | Complexiteit | Focus |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [Lokaal: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 implementatie |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Basis AI-chat |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agent-framework |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG-patroon |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Enterprise AI |

### Database- en geavanceerde patronen (Hoofdstukken 3-8)

| Sjabloon | Repository | Complexiteit | Focus |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Database-integratie |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-service |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Leerdoelen

Door met deze voorbeelden te werken, zul je:
- Azure Developer CLI-workflows oefenen met realistische applicatiescenario's
- Verschillende applicatie-architecturen en hun azd-implementaties begrijpen
- Infrastructure as Code-patronen voor diverse Azure-diensten beheersen
- Configuratiebeheer en omgevingsspecifieke implementatiestrategieën toepassen
- Monitoring-, beveiligings- en schaalpatronen in praktische contexten implementeren
- Ervaring opbouwen met het oplossen van problemen en debuggen van echte implementatiescenario's

## Leerresultaten

Na het voltooien van deze voorbeelden kun je:
- Verschillende applicatietypen met vertrouwen implementeren met Azure Developer CLI
- De aangeboden sjablonen aanpassen aan je eigen applicatievereisten
- Aangepaste infrastructuurpatronen ontwerpen en implementeren met Bicep
- Complexe multi-service-applicaties configureren met de juiste afhankelijkheden
- Beveiligings-, monitoring- en prestatiebest practices toepassen in echte scenario's
- Implementaties oplossen en optimaliseren op basis van praktische ervaring

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

## Snelstartvoorbeelden

> **💡 Nieuw met AZD?** Begin met voorbeeld #1 (Flask API) - het duurt ~20 minuten en leert de kernconcepten.

### Voor beginners
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Lokaal) ⭐  
   Implementeer een eenvoudige REST-API met automatisch schalen naar nul  
   **Tijd:** 20-25 minuten | **Kosten:** $0-5/month  
   **Je leert:** Basis azd-workflow, containerisatie, health probes  
   **Verwachte uitkomst:** Werkend API-eindpunt dat "Hello, World!" retourneert met monitoring

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Implementeer een Node.js Express-webapplicatie met MongoDB  
   **Tijd:** 25-35 minuten | **Kosten:** $10-30/month  
   **Je leert:** Database-integratie, omgevingsvariabelen, verbindingsreeksen  
   **Verwachte uitkomst:** Todo-list-app met create/read/update/delete-functionaliteit

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Host een React-statische website met Azure Static Web Apps  
   **Tijd:** 20-30 minuten | **Kosten:** $0-10/month  
   **Je leert:** Statische hosting, serverless functies, CDN-implementatie  
   **Verwachte uitkomst:** React UI met API-backend, automatische SSL, wereldwijde CDN

### Voor gevorderden
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (Lokaal) ⭐⭐  
   Implementeer gpt-4.1 met chatinterface en veilig beheer van API-sleutels  
   **Tijd:** 35-45 minuten | **Kosten:** $50-200/month  
   **Je leert:** Microsoft Foundry Models-implementatie, Key Vault-integratie, tokentracking  
   **Verwachte uitkomst:** Werkende chatapplicatie met gpt-4.1 en kostenbewaking

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Lokaal) ⭐⭐⭐⭐  
   Productieklaar multi-service-architectuur  
   **Tijd:** 45-60 minuten | **Kosten:** $50-150/month  
   **Je leert:** Servicecommunicatie, berichtwachtrij, gedistribueerde tracing  
   **Verwachte uitkomst:** 2-service systeem (API Gateway + Product Service) met monitoring

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Webapplicatie met C# API en Azure SQL Database  
   **Tijd:** 30-45 minuten | **Kosten:** $20-80/month  
   **Je leert:** Entity Framework, database-migraties, verbindingsbeveiliging  
   **Verwachte uitkomst:** C# API met Azure SQL-backend, automatische schema-implementatie

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions met HTTP-triggers en Cosmos DB  
   **Tijd:** 30-40 minuten | **Kosten:** $10-40/month  
   **Je leert:** Event-driven architectuur, serverless scaling, NoSQL-integratie  
   **Verwachte uitkomst:** Function app die reageert op HTTP-verzoeken met opslag in Cosmos DB

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Multi-service Java-applicatie met Container Apps en API-gateway  
   **Tijd:** 60-90 minuten | **Kosten:** $80-200/month  
   **Je leert:** Spring Boot-implementatie, service mesh, load balancing  
   **Verwachte uitkomst:** Multi-service Java-systeem met service discovery en routering

### Microsoft Foundry Templates

1. **[Microsoft Foundry Models Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   Volledige gpt-4.1-implementatie met chatinterface  
   **Tijd:** 35-45 minuten | **Kosten:** $50-200/month  
   **Verwachte uitkomst:** Werkende chatapplicatie met tokentracking en kostenbewaking

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Intelligente chatapplicatie met RAG-architectuur  
   **Tijd:** 60-90 minuten | **Kosten:** $100-300/month  
   **Verwachte uitkomst:** RAG-gestuurde chatinterface met documentsearch en bronvermelding

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Documentanalyse met Azure AI-diensten  
   **Tijd:** 40-60 minuten | **Kosten:** $20-80/month  
   **Verwachte uitkomst:** API die tekst, tabellen en entiteiten uit geüploade documenten extraheert

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps-workflow met Azure Machine Learning  
   **Tijd:** 2-3 uur | **Kosten:** $150-500/month  
   **Verwachte uitkomst:** Geautomatiseerde ML-pijplijn met training, implementatie en monitoring

### Reële scenario's

#### **Retail Multi-Agent Solution** 🆕
**[Volledige implementatiegids](./retail-scenario.md)**

Een uitgebreide, productieklare multi-agent klantenserviceoplossing die enterprise-grade AI-applicatie-implementatie met AZD demonstreert. Dit scenario biedt:

- **Volledige Architectuur**: Multi-agent systeem met gespecialiseerde klantenservice- en voorraadbeheeragents
- **Productie-infrastructuur**: Multi-region Microsoft Foundry Models implementaties, AI Search, Container Apps, en uitgebreide monitoring
- **Klaar-om-te-implementeren ARM-sjabloon**: Implementatie met één klik met meerdere configuratiemodi (Minimal/Standard/Premium)
- **Geavanceerde functies**: Red teaming beveiligingsvalidatie, agent-evaluatiekader, kostenoptimalisatie en handleidingen voor probleemoplossing
- **Reële zakelijke context**: Klantondersteuningsuse-case voor detailhandel met bestandsuploads, zoekintegratie en dynamische schaalvergroting

**Technologieën**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Complexiteit**: ⭐⭐⭐⭐ (Geavanceerd - Enterprise productieklaar)

**Perfect voor**: AI-ontwikkelaars, oplossingsarchitecten en teams die productie multi-agent systemen bouwen

**Snelstart**: Implementeer de volledige oplossing in minder dan 30 minuten met de meegeleverde ARM-sjabloon met `./deploy.sh -g myResourceGroup`

## 📋 Gebruiksinstructies

### Vereisten

Voordat u een voorbeeld uitvoert:
- ✅ Azure-abonnement met Owner- of Contributor-toegang
- ✅ Azure Developer CLI geïnstalleerd ([Installatiehandleiding](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop actief (voor container-voorbeelden)
- ✅ Geschikte Azure-quota (controleer voorbeeldspecifieke vereisten)

> **💰 Kostenwaarschuwing:** Alle voorbeelden maken echte Azure-resources die kosten met zich meebrengen. Zie individuele README-bestanden voor kostenramingen. Vergeet niet `azd down` uit te voeren als u klaar bent om doorlopende kosten te voorkomen.

### Voorbeelden lokaal uitvoeren

1. **Kloon of kopieer het voorbeeld**
   ```bash
   # Navigeer naar het gewenste voorbeeld
   cd examples/simple-web-app
   ```

2. **Initialiseer de AZD-omgeving**
   ```bash
   # Initialiseer met een bestaand sjabloon
   azd init
   
   # Of maak een nieuwe omgeving aan
   azd env new my-environment
   ```

3. **Configureer de omgeving**
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
   - ✅ `azd up` wordt voltooid zonder fouten
   - ✅ Service-eindpunt geeft HTTP 200 terug
   - ✅ Azure Portal toont status "Actief"
   - ✅ Application Insights ontvangt telemetrie

> **⚠️ Problemen?** Zie [Veelvoorkomende problemen](../docs/chapter-07-troubleshooting/common-issues.md) voor het oplossen van implementatieproblemen

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
- Kostenbesparende ontwikkelopstellingen

#### **Geavanceerde scenario's**
- Architecturen met meerdere services
- Complexe netwerkconfiguraties
- Patronen voor database-integratie
- Implementaties voor beveiliging en naleving

#### **Productieklare patronen**
- Hoogbeschikbaarheidsconfiguraties
- Monitoring en observeerbaarheid
- CI/CD-integratie
- Noodherstelopstellingen

## 📖 Voorbeeldbeschrijvingen

### Eenvoudige webapp - Node.js Express
**Technologieën**: Node.js, Express, MongoDB, Container Apps  
**Complexiteit**: Beginner  
**Concepten**: Basisimplementatie, REST API, NoSQL-database-integratie

### Statische website - React SPA
**Technologieën**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complexiteit**: Beginner  
**Concepten**: Statische hosting, serverless-backend, moderne webontwikkeling

### Container-app - Python Flask
**Technologieën**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Complexiteit**: Beginner  
**Concepten**: Containerisatie, REST API, scale-to-zero, health probes, monitoring  
**Locatie**: [Lokaal voorbeeld](../../../examples/container-app/simple-flask-api)

### Container-app - Microservicesarchitectuur
**Technologieën**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complexiteit**: Geavanceerd  
**Concepten**: Meerdere-service-architectuur, servicecommunicatie, berichtwachtrijen, gedistribueerde tracing  
**Locatie**: [Lokaal voorbeeld](../../../examples/container-app/microservices)

### Database-app - C# met Azure SQL
**Technologieën**: C# ASP.NET Core, Azure SQL Database, App Service  
**Complexiteit**: Gemiddeld  
**Concepten**: Entity Framework, databaseconnecties, web-API-ontwikkeling

### Serverless-functie - Python Azure Functions
**Technologieën**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complexiteit**: Gemiddeld  
**Concepten**: Event-driven-architectuur, serverless computing, full-stack-ontwikkeling

### Microservices - Java Spring Boot
**Technologieën**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Complexiteit**: Gemiddeld  
**Concepten**: Microservices-communicatie, gedistribueerde systemen, enterprise-patronen

### Microsoft Foundry-voorbeelden

#### Microsoft Foundry Models Chat-app
**Technologieën**: Microsoft Foundry Models, Azure AI Search, App Service  
**Complexiteit**: Gemiddeld  
**Concepten**: RAG-architectuur, vectorzoekopdrachten, LLM-integratie

#### AI-documentverwerking
**Technologieën**: Azure AI Document Intelligence, Storage, Functions  
**Complexiteit**: Gemiddeld  
**Concepten**: Documentanalyse, OCR, gegevensuitwinning

#### Machine Learning-pijplijn
**Technologieën**: Azure ML, MLOps, Container Registry  
**Complexiteit**: Geavanceerd  
**Concepten**: Modeltraining, deployment-pijplijnen, monitoring

## 🛠 Configuratievoorbeelden

De map `configurations/` bevat herbruikbare componenten:

### Omgevingsconfiguraties
- Instellingen voor de ontwikkelomgeving
- Configuraties voor de staging-omgeving
- Productieklare configuraties
- Multi-regio-implementaties

### Bicep-modules
- Herbruikbare infrastructuurcomponenten
- Veelvoorkomende resourcepatronen
- Beveiligingsversterkte sjablonen
- Kostengeoptimaliseerde configuraties

### Hulpscripts
- Automatisering van omgevingsopzet
- Database-migratiescripts
- Tools voor validatie van implementaties
- Hulpmiddelen voor kostenbewaking

## 🔧 Aanpassingsgids

### Voorbeelden aanpassen voor uw gebruikssituatie

1. **Controleer de vereisten**
   - Controleer vereisten voor Azure-diensten
   - Controleer abonnementslimieten
   - Begrijp de kostenimplicaties

2. **Wijzig de configuratie**
   - Werk `azure.yaml`-servicedefinities bij
   - Pas Bicep-sjablonen aan
   - Pas omgevingsvariabelen aan

3. **Test grondig**
   - Implementeer eerst naar de ontwikkelomgeving
   - Valideer functionaliteit
   - Test schaling en prestaties

4. **Veiligheidsevaluatie**
   - Controleer toegangscontroles
   - Implementeer geheimbeheer
   - Schakel monitoring en waarschuwingen in

## 📊 Vergelijkingsmatrix

| Voorbeeld | Services | Database | Auth | Monitoring | Complexiteit |
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

## 🎓 Leerpad

### Aanbevolen volgorde

1. **Begin met de eenvoudige webapp**
   - Leer basisconcepten van AZD
   - Begrijp de implementatiestroom
   - Oefen met omgevingsbeheer

2. **Probeer de statische website**
   - Onderzoek verschillende hostingopties
   - Leer over CDN-integratie
   - Begrijp DNS-configuratie

3. **Stap over naar Container-apps**
   - Leer basisprincipes van containerisatie
   - Begrijp concepten voor schaling
   - Oefen met Docker

4. **Voeg database-integratie toe**
   - Leer over het provisioneren van databases
   - Begrijp connection strings
   - Oefen met geheimbeheer

5. **Verken serverless**
   - Begrijp event-driven-architectuur
   - Leer over triggers en bindings
   - Oefen met API's

6. **Bouw microservices**
   - Leer servicecommunicatie
   - Begrijp gedistribueerde systemen
   - Oefen met complexe implementaties

## 🔍 Het juiste voorbeeld vinden

### Per technologiestack
- **Container Apps**: [Python Flask API (Lokaal)](../../../examples/container-app/simple-flask-api), [Microservices (Lokaal)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Lokaal)](../../../examples/container-app/microservices)
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

### Per architectuurpatroon
- **Simple REST API**: [Python Flask API (Lokaal)](../../../examples/container-app/simple-flask-api)
- **Monolithisch**: Node.js Express Todo, C# Web API + SQL
- **Statisch + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Productie-microservices (Lokaal)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (Lokaal)](../../../examples/container-app/simple-flask-api), [Microservices (Lokaal)](../../../examples/container-app/microservices), Java Microservices
- **AI-Powered**: **[Microsoft Foundry Models Chat (Lokaal)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent-oplossing**
- **Multi-Agent-architectuur**: **Retail Multi-Agent-oplossing**
- **Enterprise Multi-Service**: [Microservices (Lokaal)](../../../examples/container-app/microservices), **Retail Multi-Agent-oplossing**

### Per complexiteitsniveau
- **Beginner**: [Python Flask API (Lokaal)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Gemiddeld**: **[Microsoft Foundry Models Chat (Lokaal)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **Geavanceerd**: ML Pipeline
- **Enterprise productieklaar**: [Microservices (Lokaal)](../../../examples/container-app/microservices) (Multi-service met berichtwachtrij), **Retail Multi-Agent-oplossing** (Compleet multi-agent-systeem met ARM-sjabloonimplementatie)

## 📚 Aanvullende bronnen

### Documentatielinks
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep-documentatie](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architectuurcentrum](https://learn.microsoft.com/en-us/azure/architecture/)

### Communityvoorbeelden
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo-app met C# en Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo-app met Python en MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo-app met Node.js en PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web App with C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions with Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

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

### Structuur van voorbeeldsjabloon
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

**Handige tip**: Begin met het eenvoudigste voorbeeld dat bij je technologiestack past en werk vervolgens geleidelijk naar meer complexe scenario's. Elk voorbeeld bouwt voort op concepten uit de vorige!

## 🚀 Klaar om te beginnen?

### Je leerpad

1. **Helemaal nieuw?** → Begin met [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 min)
2. **Heb je basiskennis van AZD?** → Probeer [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 min)
3. **AI-apps bouwen?** → Begin met [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 min) of verken [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ uur)
4. **Op zoek naar een specifieke tech stack?** → Gebruik de sectie [Het juiste voorbeeld vinden](#-finding-the-right-example) hierboven

### Volgende stappen

- ✅ Bekijk de [Vereisten](#vereisten) hierboven
- ✅ Kies een voorbeeld dat bij je vaardigheidsniveau past (zie [Complexiteitslegende](#legenda-complexiteitsbeoordeling))
- ✅ Lees de README van het voorbeeld grondig voordat je implementeert
- ✅ Zet een herinnering om `azd down` uit te voeren na het testen
- ✅ Deel je ervaring via GitHub Issues of Discussions

### Hulp nodig?

- 📖 [FAQ](../resources/faq.md) - Veelgestelde vragen beantwoord
- 🐛 [Probleemoplossingsgids](../docs/chapter-07-troubleshooting/common-issues.md) - Los implementatieproblemen op
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Stel vragen aan de community
- 📚 [Studiegids](../resources/study-guide.md) - Versterk je kennis

---

**Navigatie**
- **📚 Cursus Startpagina**: [AZD For Beginners](../README.md)
- **📖 Studiematerialen**: [Studiegids](../resources/study-guide.md) | [Spiekbrief](../resources/cheat-sheet.md) | [Woordenlijst](../resources/glossary.md)
- **🔧 Hulpbronnen**: [FAQ](../resources/faq.md) | [Probleemoplossing](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Laatst bijgewerkt: november 2025 | [Meld problemen](https://github.com/microsoft/AZD-for-beginners/issues) | [Voorbeelden bijdragen](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->