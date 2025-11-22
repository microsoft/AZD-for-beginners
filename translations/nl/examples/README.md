<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "4a896781acb2a7bebb3c4c66c4f46e7f",
  "translation_date": "2025-11-21T16:25:31+00:00",
  "source_file": "examples/README.md",
  "language_code": "nl"
}
-->
# Voorbeelden - Praktische AZD-sjablonen en configuraties

**Leren door voorbeelden - Georganiseerd per hoofdstuk**
- **📚 Cursus Home**: [AZD Voor Beginners](../README.md)
- **📖 Hoofdstukindeling**: Voorbeelden georganiseerd op leerniveau
- **🚀 Lokaal Voorbeeld**: [Retail Multi-Agent Oplossing](retail-scenario.md)
- **🤖 Externe AI Voorbeelden**: Links naar Azure Samples repositories

> **📍 BELANGRIJK: Lokale vs Externe Voorbeelden**  
> Deze repository bevat **4 complete lokale voorbeelden** met volledige implementaties:  
> - **Azure OpenAI Chat** (GPT-4 implementatie met chatinterface)  
> - **Container Apps** (Eenvoudige Flask API + Microservices)  
> - **Database App** (Web + SQL Database)  
> - **Retail Multi-Agent** (Enterprise AI Oplossing)  
>  
> Aanvullende voorbeelden zijn **externe referenties** naar Azure-Samples repositories die je kunt klonen.

## Introductie

Deze map biedt praktische voorbeelden en referenties om je te helpen Azure Developer CLI te leren door middel van hands-on praktijk. Het Retail Multi-Agent scenario is een complete, productieklare implementatie die in deze repository is opgenomen. Aanvullende voorbeelden verwijzen naar officiële Azure Samples die verschillende AZD-patronen demonstreren.

### Legenda voor Complexiteit

- ⭐ **Beginner** - Basisconcepten, enkele service, 15-30 minuten
- ⭐⭐ **Gemiddeld** - Meerdere services, database-integratie, 30-60 minuten
- ⭐⭐⭐ **Gevorderd** - Complexe architectuur, AI-integratie, 1-2 uur
- ⭐⭐⭐⭐ **Expert** - Productieklaar, enterprise-patronen, 2+ uur

## 🎯 Wat zit er eigenlijk in deze repository

### ✅ Lokale Implementatie (Klaar voor gebruik)

#### [Azure OpenAI Chat Applicatie](azure-openai-chat/README.md) 🆕
**Complete GPT-4 implementatie met chatinterface inbegrepen in deze repo**

- **Locatie:** `examples/azure-openai-chat/`
- **Complexiteit:** ⭐⭐ (Gemiddeld)
- **Wat is inbegrepen:**
  - Complete Azure OpenAI implementatie (GPT-4)
  - Python command-line chatinterface
  - Key Vault integratie voor veilige API-sleutels
  - Bicep infrastructuursjablonen
  - Tokengebruik en kostenbewaking
  - Rate limiting en foutafhandeling

**Snelstart:**
```bash
# Navigeer naar voorbeeld
cd examples/azure-openai-chat

# Alles implementeren
azd up

# Installeer afhankelijkheden en begin met chatten
pip install -r src/requirements.txt
python src/chat.py
```

**Technologieën:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Container App Voorbeelden](container-app/README.md) 🆕
**Uitgebreide containerimplementatievoorbeelden inbegrepen in deze repo**

- **Locatie:** `examples/container-app/`
- **Complexiteit:** ⭐-⭐⭐⭐⭐ (Beginner tot Expert)
- **Wat is inbegrepen:**
  - [Master Gids](container-app/README.md) - Compleet overzicht van containerimplementaties
  - [Eenvoudige Flask API](../../../examples/container-app/simple-flask-api) - Basis REST API voorbeeld
  - [Microservices Architectuur](../../../examples/container-app/microservices) - Productieklaar multi-service implementatie
  - Snelstart, productie- en geavanceerde patronen
  - Monitoring, beveiliging en kostenoptimalisatie

**Snelstart:**
```bash
# Bekijk mastergids
cd examples/container-app

# Implementeer eenvoudige Flask API
cd simple-flask-api
azd up

# Implementeer microservices voorbeeld
cd ../microservices
azd up
```

**Technologieën:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent Oplossing](retail-scenario.md) 🆕
**Complete productieklare implementatie inbegrepen in deze repo**

- **Locatie:** `examples/retail-multiagent-arm-template/`
- **Complexiteit:** ⭐⭐⭐⭐ (Expert)
- **Wat is inbegrepen:**
  - Complete ARM implementatiesjabloon
  - Multi-agent architectuur (Klant + Voorraad)
  - Azure OpenAI integratie
  - AI Zoeken met RAG
  - Uitgebreide monitoring
  - One-click implementatiescript

**Snelstart:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Technologieën:** Azure OpenAI, AI Zoeken, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Externe Azure Voorbeelden (Klonen om te gebruiken)

De volgende voorbeelden worden onderhouden in officiële Azure-Samples repositories. Kloon ze om verschillende AZD-patronen te verkennen:

### Eenvoudige Applicaties (Hoofdstukken 1-2)

| Sjabloon | Repository | Complexiteit | Services |
|:---------|:-----------|:-------------|:---------|
| **Python Flask API** | [Lokaal: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Lokaal: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-service, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Hoe te gebruiken:**
```bash
# Clone een voorbeeld
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Implementeren
azd up
```

### AI Applicatie Voorbeelden (Hoofdstukken 2, 5, 8)

| Sjabloon | Repository | Complexiteit | Focus |
|:---------|:-----------|:-------------|:------|
| **Azure OpenAI Chat** | [Lokaal: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | GPT-4 implementatie |
| **AI Chat Snelstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Basis AI chat |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agent framework |
| **Zoeken + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG patroon |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Enterprise AI |

### Database & Geavanceerde Patronen (Hoofdstukken 3-8)

| Sjabloon | Repository | Complexiteit | Focus |
|:---------|:-----------|:-------------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Database-integratie |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-service |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Leerdoelen

Door deze voorbeelden te doorlopen, leer je:
- Azure Developer CLI-workflows oefenen met realistische applicatiescenario's
- Verschillende applicatiearchitecturen en hun AZD-implementaties begrijpen
- Beheersing van Infrastructure as Code-patronen voor diverse Azure-services
- Configuratiebeheer en omgevingsspecifieke implementatiestrategieën toepassen
- Monitoring, beveiliging en schaalpatronen implementeren in praktische contexten
- Ervaring opdoen met het oplossen van problemen en het debuggen van echte implementatiescenario's

## Leerresultaten

Na het voltooien van deze voorbeelden kun je:
- Verschillende applicatietypen met vertrouwen implementeren met Azure Developer CLI
- Aangeleverde sjablonen aanpassen aan je eigen applicatievereisten
- Eigen infrastructuurpatronen ontwerpen en implementeren met Bicep
- Complexe multi-service applicaties configureren met de juiste afhankelijkheden
- Beveiligings-, monitoring- en prestatiebest practices toepassen in echte scenario's
- Implementaties oplossen en optimaliseren op basis van praktische ervaring

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

## Snelstart Voorbeelden

> **💡 Nieuw met AZD?** Begin met voorbeeld #1 (Flask API) - het duurt ~20 minuten en leert je de basisconcepten.

### Voor Beginners
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Lokaal) ⭐  
   Implementeer een eenvoudige REST API met schaal-tot-nul  
   **Tijd:** 20-25 minuten | **Kosten:** $0-5/maand  
   **Je leert:** Basis AZD-workflow, containerisatie, health probes  
   **Verwacht resultaat:** Werkend API-eindpunt dat "Hello, World!" retourneert met monitoring

2. **[Eenvoudige Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Implementeer een Node.js Express webapplicatie met MongoDB  
   **Tijd:** 25-35 minuten | **Kosten:** $10-30/maand  
   **Je leert:** Database-integratie, omgevingsvariabelen, verbindingsstrings  
   **Verwacht resultaat:** Todo-lijst app met maak/lezen/bijwerken/verwijderen functionaliteit

3. **[Statische Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Host een React statische website met Azure Static Web Apps  
   **Tijd:** 20-30 minuten | **Kosten:** $0-10/maand  
   **Je leert:** Statische hosting, serverloze functies, CDN-implementatie  
   **Verwacht resultaat:** React UI met API-backend, automatische SSL, wereldwijde CDN

### Voor Gemiddelde Gebruikers
4. **[Azure OpenAI Chat Applicatie](../../../examples/azure-openai-chat)** (Lokaal) ⭐⭐  
   Implementeer GPT-4 met chatinterface en veilige API-sleutelbeheer  
   **Tijd:** 35-45 minuten | **Kosten:** $50-200/maand  
   **Je leert:** Azure OpenAI implementatie, Key Vault integratie, tokenbewaking  
   **Verwacht resultaat:** Werkende chatapplicatie met GPT-4 en kostenbewaking

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Lokaal) ⭐⭐⭐⭐  
   Productieklaar multi-service architectuur  
   **Tijd:** 45-60 minuten | **Kosten:** $50-150/maand  
   **Je leert:** Servicecommunicatie, berichtwachtrijen, gedistribueerde tracing  
   **Verwacht resultaat:** 2-service systeem (API Gateway + Product Service) met monitoring

6. **[Database App - C# met Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Webapplicatie met C# API en Azure SQL Database  
   **Tijd:** 30-45 minuten | **Kosten:** $20-80/maand  
   **Je leert:** Entity Framework, database-migraties, verbindingsbeveiliging  
   **Verwacht resultaat:** C# API met Azure SQL backend, automatische schema-implementatie

7. **[Serverloze Functie - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions met HTTP-triggers en Cosmos DB  
   **Tijd:** 30-40 minuten | **Kosten:** $10-40/maand  
   **Je leert:** Event-driven architectuur, serverloze schaalvergroting, NoSQL-integratie  
   **Verwacht resultaat:** Functie-app die reageert op HTTP-verzoeken met Cosmos DB-opslag

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Multi-service Java applicatie met Container Apps en API-gateway  
   **Tijd:** 60-90 minuten | **Kosten:** $80-200/maand  
   **Je leert:** Spring Boot implementatie, service mesh, load balancing  
   **Verwacht resultaat:** Multi-service Java systeem met service discovery en routing

### Azure AI Foundry Sjablonen

1. **[Azure OpenAI Chat App - Lokaal Voorbeeld](../../../examples/azure-openai-chat)** ⭐⭐  
   Complete GPT-4 implementatie met chatinterface  
   **Tijd:** 35-45 minuten | **Kosten:** $50-200/maand  
   **Verwacht resultaat:** Werkende chatapplicatie met tokenbewaking en kostenmonitoring

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Intelligente chatapplicatie met RAG-architectuur  
   **Tijd:** 60-90 minuten | **Kosten:** $100-300/maand  
   **Verwacht resultaat:** RAG-aangedreven chatinterface met documentzoekfunctie en citaties

3. **[AI Documentverwerking](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Documentanalyse met Azure AI-services  
   **Tijd:** 40-60 minuten | **Kosten:** $20-80/maand  
   **Verwacht resultaat:** API die tekst, tabellen en entiteiten uit geüploade documenten extraheert

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps-workflow met Azure Machine Learning  
   **Tijd:** 2-3 uur | **Kosten:** $150-500/maand  
   **Verwacht resultaat:** Geautomatiseerde ML-pipeline met training, implementatie en monitoring

### Realistische Scenario's

#### **Retail Multi-Agent Oplossing** 🆕
**[Complete Implementatiegids](./retail-scenario.md)**

Een uitgebreide, productieklare multi-agent klantenondersteuningsoplossing die enterprise-grade AI applicatie-implementatie met AZD demonstreert. Dit scenario biedt:

- **Complete Architectuur**: Multi-agent systeem met gespecialiseerde klantenservice- en voorraadbeheeragents
- **Productie-infrastructuur**: Multi-regio Azure OpenAI-implementaties, AI Search, Container Apps en uitgebreide monitoring  
- **Klaar-om-te-implementeren ARM-template**: Eén klik implementatie met meerdere configuratiemodi (Minimal/Standard/Premium)  
- **Geavanceerde functies**: Red teaming beveiligingsvalidatie, agent evaluatie framework, kostenoptimalisatie en probleemoplossingsgidsen  
- **Echte zakelijke context**: Klantenservice use case voor retailers met bestanduploads, zoekintegratie en dynamische schaalbaarheid  

**Technologieën**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API  

**Complexiteit**: ⭐⭐⭐⭐ (Geavanceerd - Klaar voor productie op ondernemingsniveau)  

**Perfect voor**: AI-ontwikkelaars, solution architects en teams die productie multi-agent systemen bouwen  

**Snelle start**: Implementeer de complete oplossing in minder dan 30 minuten met de meegeleverde ARM-template via `./deploy.sh -g myResourceGroup`  

## 📋 Gebruiksinstructies  

### Vereisten  

Voordat je een voorbeeld uitvoert:  
- ✅ Azure-abonnement met eigenaar- of bijdragerstoegang  
- ✅ Azure Developer CLI geïnstalleerd ([Installatiegids](../docs/getting-started/installation.md))  
- ✅ Docker Desktop actief (voor container voorbeelden)  
- ✅ Geschikte Azure-quota's (controleer de specifieke vereisten per voorbeeld)  

> **💰 Kostenwaarschuwing:** Alle voorbeelden maken echte Azure-resources aan die kosten met zich meebrengen. Zie de individuele README-bestanden voor kostenramingen. Vergeet niet `azd down` uit te voeren wanneer je klaar bent om doorlopende kosten te vermijden.  

### Voorbeelden lokaal uitvoeren  

1. **Clone of kopieer voorbeeld**  
   ```bash
   # Navigeer naar gewenst voorbeeld
   cd examples/simple-web-app
   ```
  
2. **Initialiseer AZD-omgeving**  
   ```bash
   # Initialiseer met bestaande sjabloon
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
  
5. **Controleer implementatie**  
   ```bash
   # Haal service-eindpunten op
   azd env get-values
   
   # Test het eindpunt (voorbeeld)
   curl https://your-app-url.azurecontainer.io/health
   ```
  
   **Verwachte succesindicatoren:**  
   - ✅ `azd up` voltooit zonder fouten  
   - ✅ Service endpoint retourneert HTTP 200  
   - ✅ Azure Portal toont status "Running"  
   - ✅ Application Insights ontvangt telemetrie  

> **⚠️ Problemen?** Zie [Veelvoorkomende problemen](../docs/troubleshooting/common-issues.md) voor hulp bij implementatieproblemen  

### Voorbeelden aanpassen  

Elk voorbeeld bevat:  
- **README.md** - Gedetailleerde setup- en aanpassingsinstructies  
- **azure.yaml** - AZD-configuratie met opmerkingen  
- **infra/** - Bicep-templates met parameteruitleg  
- **src/** - Voorbeeldapplicatiecode  
- **scripts/** - Hulpscripts voor veelvoorkomende taken  

## 🎯 Leerdoelen  

### Voorbeeldcategorieën  

#### **Basisimplementaties**  
- Applicaties met één service  
- Eenvoudige infrastructuurpatronen  
- Basisconfiguratiebeheer  
- Kostenbesparende ontwikkelomgevingen  

#### **Geavanceerde scenario's**  
- Architecturen met meerdere services  
- Complexe netwerkconfiguraties  
- Database-integratiepatronen  
- Beveiligings- en compliance-implementaties  

#### **Productieklaar**  
- Configuraties voor hoge beschikbaarheid  
- Monitoring en observatie  
- CI/CD-integratie  
- Noodhersteloplossingen  

## 📖 Voorbeeldbeschrijvingen  

### Eenvoudige webapp - Node.js Express  
**Technologieën**: Node.js, Express, MongoDB, Container Apps  
**Complexiteit**: Beginner  
**Concepten**: Basisimplementatie, REST API, NoSQL-database-integratie  

### Statische website - React SPA  
**Technologieën**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complexiteit**: Beginner  
**Concepten**: Statische hosting, serverloze backend, moderne webontwikkeling  

### Container App - Python Flask  
**Technologieën**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Complexiteit**: Beginner  
**Concepten**: Containerisatie, REST API, schaal-tot-nul, gezondheidscontroles, monitoring  
**Locatie**: [Lokaal voorbeeld](../../../examples/container-app/simple-flask-api)  

### Container App - Microservices Architectuur  
**Technologieën**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complexiteit**: Geavanceerd  
**Concepten**: Architectuur met meerdere services, servicecommunicatie, berichtwachtrijen, gedistribueerde tracing  
**Locatie**: [Lokaal voorbeeld](../../../examples/container-app/microservices)  

### Database App - C# met Azure SQL  
**Technologieën**: C# ASP.NET Core, Azure SQL Database, App Service  
**Complexiteit**: Gemiddeld  
**Concepten**: Entity Framework, databaseverbindingen, web API-ontwikkeling  

### Serverloze functie - Python Azure Functions  
**Technologieën**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complexiteit**: Gemiddeld  
**Concepten**: Event-driven architectuur, serverloos computeren, full-stack ontwikkeling  

### Microservices - Java Spring Boot  
**Technologieën**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Complexiteit**: Gemiddeld  
**Concepten**: Microservices communicatie, gedistribueerde systemen, ondernemingspatronen  

### Azure AI Foundry Voorbeelden  

#### Azure OpenAI Chat App  
**Technologieën**: Azure OpenAI, Cognitive Search, App Service  
**Complexiteit**: Gemiddeld  
**Concepten**: RAG-architectuur, vectorzoekopdrachten, LLM-integratie  

#### AI Documentverwerking  
**Technologieën**: Azure AI Document Intelligence, Storage, Functions  
**Complexiteit**: Gemiddeld  
**Concepten**: Documentanalyse, OCR, data-extractie  

#### Machine Learning Pipeline  
**Technologieën**: Azure ML, MLOps, Container Registry  
**Complexiteit**: Geavanceerd  
**Concepten**: Modeltraining, implementatiepijplijnen, monitoring  

## 🛠 Configuratievoorbeelden  

De `configurations/`-directory bevat herbruikbare componenten:  

### Omgevingsconfiguraties  
- Instellingen voor ontwikkelomgevingen  
- Configuraties voor stagingomgevingen  
- Productieklare configuraties  
- Multi-regio implementatieopstellingen  

### Bicep-modules  
- Herbruikbare infrastructuurcomponenten  
- Veelvoorkomende resourcepatronen  
- Beveiligingsgeharde templates  
- Kosten-geoptimaliseerde configuraties  

### Hulpscripts  
- Automatisering van omgevingsinstellingen  
- Database-migratiescripts  
- Tools voor validatie van implementaties  
- Hulpmiddelen voor kostenmonitoring  

## 🔧 Aanpassingsgids  

### Voorbeelden aanpassen aan jouw use case  

1. **Controleer vereisten**  
   - Controleer Azure-servicevereisten  
   - Verifieer abonnementslimieten  
   - Begrijp kostenimplicaties  

2. **Wijzig configuratie**  
   - Werk `azure.yaml` service-definities bij  
   - Pas Bicep-templates aan  
   - Stel omgevingsvariabelen in  

3. **Test grondig**  
   - Implementeer eerst in ontwikkelomgeving  
   - Valideer functionaliteit  
   - Test schaalbaarheid en prestaties  

4. **Beveiligingscontrole**  
   - Controleer toegangsbeheer  
   - Implementeer geheimenbeheer  
   - Schakel monitoring en waarschuwingen in  

## 📊 Vergelijkingsmatrix  

| Voorbeeld | Services | Database | Auth | Monitoring | Complexiteit |  
|-----------|----------|----------|------|------------|--------------|  
| **Azure OpenAI Chat** (Lokaal) | 2 | ❌ | Key Vault | Volledig | ⭐⭐ |  
| **Python Flask API** (Lokaal) | 1 | ❌ | Basis | Volledig | ⭐ |  
| **Microservices** (Lokaal) | 5+ | ✅ | Onderneming | Geavanceerd | ⭐⭐⭐⭐ |  
| Node.js Express Todo | 2 | ✅ | Basis | Basis | ⭐ |  
| React SPA + Functions | 3 | ✅ | Basis | Volledig | ⭐ |  
| Python Flask Container | 2 | ❌ | Basis | Volledig | ⭐ |  
| C# Web API + SQL | 2 | ✅ | Volledig | Volledig | ⭐⭐ |  
| Python Functions + SPA | 3 | ✅ | Volledig | Volledig | ⭐⭐ |  
| Java Microservices | 5+ | ✅ | Volledig | Volledig | ⭐⭐ |  
| Azure OpenAI Chat | 3 | ✅ | Volledig | Volledig | ⭐⭐⭐ |  
| AI Documentverwerking | 2 | ❌ | Basis | Volledig | ⭐⭐ |  
| ML Pipeline | 4+ | ✅ | Volledig | Volledig | ⭐⭐⭐⭐ |  
| **Retail Multi-Agent** (Lokaal) | **8+** | **✅** | **Onderneming** | **Geavanceerd** | **⭐⭐⭐⭐** |  

## 🎓 Leerpad  

### Aanbevolen volgorde  

1. **Begin met eenvoudige webapp**  
   - Leer basisconcepten van AZD  
   - Begrijp implementatieworkflow  
   - Oefen met omgevingsbeheer  

2. **Probeer statische website**  
   - Verken verschillende hostingopties  
   - Leer over CDN-integratie  
   - Begrijp DNS-configuratie  

3. **Ga verder met Container App**  
   - Leer basisprincipes van containerisatie  
   - Begrijp schaalconcepten  
   - Oefen met Docker  

4. **Voeg database-integratie toe**  
   - Leer databasevoorziening  
   - Begrijp verbindingsstrings  
   - Oefen geheimenbeheer  

5. **Verken serverloos**  
   - Begrijp event-driven architectuur  
   - Leer over triggers en bindings  
   - Oefen met API's  

6. **Bouw microservices**  
   - Leer servicecommunicatie  
   - Begrijp gedistribueerde systemen  
   - Oefen complexe implementaties  

## 🔍 Het juiste voorbeeld vinden  

### Op technologie stack  
- **Container Apps**: [Python Flask API (Lokaal)](../../../examples/container-app/simple-flask-api), [Microservices (Lokaal)](../../../examples/container-app/microservices), Java Microservices  
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Lokaal)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (Lokaal)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Lokaal)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [Microservices Order Service (Lokaal)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline  
- **Go**: [Microservices User Service (Lokaal)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot Microservices  
- **React**: React SPA + Functions  
- **Containers**: [Python Flask (Lokaal)](../../../examples/container-app/simple-flask-api), [Microservices (Lokaal)](../../../examples/container-app/microservices), Java Microservices  
- **Databases**: [Microservices (Lokaal)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **AI/ML**: **[Azure OpenAI Chat (Lokaal)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Documentverwerking, ML Pipeline, **Retail Multi-Agent Solution**  
- **Multi-Agent Systemen**: **Retail Multi-Agent Solution**  
- **OpenAI-integratie**: **[Azure OpenAI Chat (Lokaal)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution  
- **Onderneming Productie**: [Microservices (Lokaal)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### Op architectuurpatroon  
- **Eenvoudige REST API**: [Python Flask API (Lokaal)](../../../examples/container-app/simple-flask-api)  
- **Monolithisch**: Node.js Express Todo, C# Web API + SQL  
- **Statisch + Serverloos**: React SPA + Functions, Python Functions + SPA  
- **Microservices**: [Productie Microservices (Lokaal)](../../../examples/container-app/microservices), Java Spring Boot Microservices  
- **Containerized**: [Python Flask (Lokaal)](../../../examples/container-app/simple-flask-api), [Microservices (Lokaal)](../../../examples/container-app/microservices)  
- **AI-gestuurd**: **[Azure OpenAI Chat (Lokaal)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Documentverwerking, ML Pipeline, **Retail Multi-Agent Solution**  
- **Multi-Agent Architectuur**: **Retail Multi-Agent Solution**  
- **Onderneming Multi-Service**: [Microservices (Lokaal)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### Op complexiteitsniveau  
- **Beginner**: [Python Flask API (Lokaal)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **Gemiddeld**: **[Azure OpenAI Chat (Lokaal)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Documentverwerking  
- **Geavanceerd**: ML Pipeline  
- **Onderneming Productieklaar**: [Microservices (Lokaal)](../../../examples/container-app/microservices) (Multi-service met berichtwachtrijen), **Retail Multi-Agent Solution** (Compleet multi-agent systeem met ARM-template implementatie)  

## 📚 Aanvullende bronnen  

### Documentatielinks  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)  
- [Bicep Documentatie](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure Architectuurcentrum](https://learn.microsoft.com/en-us/azure/architecture/)  

### Communityvoorbeelden  
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)  
- [Azure AI Foundry Templates](https://github.com/Azure/ai-foundry-templates)  
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)  
- [Todo App met C# en Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)  
- [Todo App met Python en MongoDB](https://github.com/Azure-Samples/todo-python-mongo)  
- [Todo App met Node.js en PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web App met C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions met Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Best Practices
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Voorbeelden Bijdragen

Heb je een nuttig voorbeeld om te delen? We verwelkomen bijdragen!

### Richtlijnen voor Inzending
1. Volg de bestaande mapstructuur
2. Voeg een uitgebreide README.md toe
3. Voeg opmerkingen toe aan configuratiebestanden
4. Test grondig voordat je indient
5. Voeg kostenramingen en vereisten toe

### Voorbeeld Template Structuur
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

**Pro Tip**: Begin met het eenvoudigste voorbeeld dat past bij jouw technologie-stack en werk geleidelijk naar complexere scenario's. Elk voorbeeld bouwt voort op concepten uit de vorige!

## 🚀 Klaar om te Beginnen?

### Jouw Leerpad

1. **Helemaal nieuw?** → Begin met [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 minuten)
2. **Basiskennis van AZD?** → Probeer [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 minuten)
3. **AI-apps bouwen?** → Begin met [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 minuten) of verken [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ uur)
4. **Specifieke technologie-stack nodig?** → Gebruik [Het juiste voorbeeld vinden](../../../examples) sectie hierboven

### Volgende Stappen

- ✅ Bekijk [Vereisten](../../../examples) hierboven
- ✅ Kies een voorbeeld dat past bij jouw vaardigheidsniveau (zie [Complexiteit Legenda](../../../examples))
- ✅ Lees de README van het voorbeeld grondig door voordat je het implementeert
- ✅ Stel een herinnering in om `azd down` uit te voeren na het testen
- ✅ Deel je ervaring via GitHub Issues of Discussies

### Hulp Nodig?

- 📖 [FAQ](../resources/faq.md) - Veelgestelde vragen beantwoord
- 🐛 [Probleemoplossingsgids](../docs/troubleshooting/common-issues.md) - Los implementatieproblemen op
- 💬 [GitHub Discussies](https://github.com/microsoft/AZD-for-beginners/discussions) - Stel vragen aan de community
- 📚 [Studiegids](../resources/study-guide.md) - Versterk je kennis

---

**Navigatie**
- **📚 Cursus Home**: [AZD Voor Beginners](../README.md)
- **📖 Studiematerialen**: [Studiegids](../resources/study-guide.md) | [Cheat Sheet](../resources/cheat-sheet.md) | [Woordenlijst](../resources/glossary.md)
- **🔧 Hulpbronnen**: [FAQ](../resources/faq.md) | [Probleemoplossing](../docs/troubleshooting/common-issues.md)

---

*Laatst bijgewerkt: november 2025 | [Meld Problemen](https://github.com/microsoft/AZD-for-beginners/issues) | [Bijdragen Voorbeelden](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Dit document is vertaald met behulp van de AI-vertalingsservice [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u zich ervan bewust te zijn dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->