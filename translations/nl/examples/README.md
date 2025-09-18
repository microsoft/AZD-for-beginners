<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "0fd083f39ef5508994526bb18e9fcd78",
  "translation_date": "2025-09-18T06:56:32+00:00",
  "source_file": "examples/README.md",
  "language_code": "nl"
}
-->
# Voorbeelden - Praktische AZD-sjablonen en configuraties

**Leren door voorbeelden - Georganiseerd per hoofdstuk**
- **📚 Cursus Home**: [AZD Voor Beginners](../README.md)
- **📖 Hoofdstukindeling**: Voorbeelden georganiseerd op leercomplexiteit
- **🚀 Begin eenvoudig**: [Hoofdstuk 1 Voorbeelden](../../../examples)
- **🤖 AI Voorbeelden**: [Hoofdstuk 2 & 5 AI-oplossingen](../../../examples)

## Introductie

Deze map bevat praktische voorbeelden, sjablonen en realistische scenario's om je te helpen Azure Developer CLI te leren door middel van hands-on oefeningen. Elk voorbeeld biedt volledige werkende code, infrastructuursjablonen en gedetailleerde instructies voor verschillende applicatiearchitecturen en implementatiepatronen.

## Leerdoelen

Door deze voorbeelden te doorlopen, zul je:
- Azure Developer CLI-workflows oefenen met realistische applicatiescenario's
- Verschillende applicatiearchitecturen en hun azd-implementaties begrijpen
- Infrastructure as Code-patronen beheersen voor diverse Azure-diensten
- Configuratiebeheer en omgevingsspecifieke implementatiestrategieën toepassen
- Monitoring-, beveiligings- en schaalpatronen implementeren in praktische contexten
- Ervaring opdoen met het oplossen van problemen en debuggen van echte implementatiescenario's

## Leerresultaten

Na het voltooien van deze voorbeelden kun je:
- Verschillende applicatietypen met vertrouwen implementeren met Azure Developer CLI
- De meegeleverde sjablonen aanpassen aan je eigen applicatievereisten
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

## Voorbeelden voor een snelle start

### Voor beginners
1. **[Eenvoudige Webapp - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - Implementeer een Node.js Express-webapplicatie met MongoDB
2. **[Statische Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - Host een React statische website met Azure Static Web Apps
3. **[Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - Implementeer een gecontaineriseerde Python Flask-applicatie

### Voor gevorderde gebruikers
4. **[Database App - C# met Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - Webapplicatie met C# API en Azure SQL Database
5. **[Serverless Functie - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - Python Azure Functions met HTTP-triggers en Cosmos DB
6. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - Multi-service Java-applicatie met Container Apps en API-gateway

### Azure AI Foundry-sjablonen

1. **[Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)** - Intelligente chatapplicatie met Azure OpenAI
2. **[AI Documentverwerking](https://github.com/Azure-Samples/azure-ai-document-processing)** - Documentanalyse met Azure AI-diensten
3. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** - MLOps-workflow met Azure Machine Learning

### Realistische scenario's

#### **Retail Multi-Agent Oplossing** 🆕
**[Volledige Implementatiehandleiding](./retail-scenario.md)**

Een uitgebreide, productieklare multi-agent klantenondersteuningsoplossing die een AI-applicatie op ondernemingsniveau demonstreert met AZD. Dit scenario biedt:

- **Volledige Architectuur**: Multi-agent systeem met gespecialiseerde klantenservice- en voorraadbeheeragents
- **Productie-infrastructuur**: Multi-regio Azure OpenAI-implementaties, AI Search, Container Apps en uitgebreide monitoring
- **Klaar-om-te-implementeren ARM-sjabloon**: Eén-klik implementatie met meerdere configuratiemodi (Minimal/Standard/Premium)
- **Geavanceerde functies**: Red teaming beveiligingsvalidatie, agent evaluatiekader, kostenoptimalisatie en probleemoplossingsgidsen
- **Echte zakelijke context**: Klantenondersteuningsgebruiksscenario voor detailhandel met bestanduploads, zoekintegratie en dynamische schaalvergroting

**Technologieën**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Complexiteit**: ⭐⭐⭐⭐ (Geavanceerd - Productieklaar voor ondernemingen)

**Perfect voor**: AI-ontwikkelaars, oplossingsarchitecten en teams die productieklare multi-agent systemen bouwen

**Snelle start**: Implementeer de volledige oplossing in minder dan 30 minuten met de meegeleverde ARM-sjabloon via `./deploy.sh -g myResourceGroup`

## 📋 Gebruiksinstructies

### Voorbeelden lokaal uitvoeren

1. **Clone of kopieer voorbeeld**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **Initialiseer AZD-omgeving**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **Configureer omgeving**
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Implementeer**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### Voorbeelden aanpassen

Elk voorbeeld bevat:
- **README.md** - Gedetailleerde setup- en aanpassingsinstructies
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
- Kostenbesparende ontwikkelomgevingen

#### **Geavanceerde scenario's**
- Multi-service architecturen
- Complexe netwerkconfiguraties
- Database-integratiepatronen
- Beveiligings- en compliance-implementaties

#### **Productieklare patronen**
- Configuraties voor hoge beschikbaarheid
- Monitoring en observatie
- CI/CD-integratie
- Herstelstrategieën bij rampen

## 📖 Voorbeeldbeschrijvingen

### Eenvoudige Webapp - Node.js Express
**Technologieën**: Node.js, Express, MongoDB, Container Apps  
**Complexiteit**: Beginner  
**Concepten**: Basisimplementatie, REST API, NoSQL database-integratie

### Statische Website - React SPA
**Technologieën**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complexiteit**: Beginner  
**Concepten**: Statische hosting, serverloze backend, moderne webontwikkeling

### Container App - Python Flask
**Technologieën**: Python Flask, Docker, Container Apps, Container Registry  
**Complexiteit**: Beginner  
**Concepten**: Containerisatie, microservicesarchitectuur, API-ontwikkeling

### Database App - C# met Azure SQL
**Technologieën**: C# ASP.NET Core, Azure SQL Database, App Service  
**Complexiteit**: Intermediate  
**Concepten**: Entity Framework, databaseverbindingen, web API-ontwikkeling

### Serverless Functie - Python Azure Functions
**Technologieën**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complexiteit**: Intermediate  
**Concepten**: Event-driven architectuur, serverloze computing, full-stack ontwikkeling

### Microservices - Java Spring Boot
**Technologieën**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Complexiteit**: Intermediate  
**Concepten**: Microservicescommunicatie, gedistribueerde systemen, ondernemingspatronen

### Azure AI Foundry Voorbeelden

#### Azure OpenAI Chat App
**Technologieën**: Azure OpenAI, Cognitive Search, App Service  
**Complexiteit**: Intermediate  
**Concepten**: RAG-architectuur, vectorzoekopdrachten, LLM-integratie

#### AI Documentverwerking
**Technologieën**: Azure AI Document Intelligence, Storage, Functions  
**Complexiteit**: Intermediate  
**Concepten**: Documentanalyse, OCR, data-extractie

#### Machine Learning Pipeline
**Technologieën**: Azure ML, MLOps, Container Registry  
**Complexiteit**: Geavanceerd  
**Concepten**: Modeltraining, implementatiepijplijnen, monitoring

## 🛠 Configuratievoorbeelden

De map `configurations/` bevat herbruikbare componenten:

### Omgevingsconfiguraties
- Instellingen voor ontwikkelomgevingen
- Configuraties voor stagingomgevingen
- Productieklare configuraties
- Multi-regio implementatie-instellingen

### Bicep Modules
- Herbruikbare infrastructuurcomponenten
- Veelvoorkomende resourcepatronen
- Beveiligingsgeharde sjablonen
- Kosten geoptimaliseerde configuraties

### Hulpscripts
- Automatisering van omgevingsinstellingen
- Scripts voor database-migratie
- Tools voor validatie van implementaties
- Hulpmiddelen voor kostenmonitoring

## 🔧 Aanpassingsgids

### Voorbeelden aanpassen aan jouw gebruiksscenario

1. **Controleer vereisten**
   - Controleer Azure-dienstvereisten
   - Verifieer abonnementslimieten
   - Begrijp kostenimplicaties

2. **Wijzig configuratie**
   - Werk `azure.yaml` servicedefinities bij
   - Pas Bicep-sjablonen aan
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
| Node.js Express Todo | 2 | ✅ | Basis | Basis | ⭐ |
| React SPA + Functions | 3 | ✅ | Basis | Volledig | ⭐ |
| Python Flask Container | 2 | ❌ | Basis | Volledig | ⭐ |
| C# Web API + SQL | 2 | ✅ | Volledig | Volledig | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Volledig | Volledig | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Volledig | Volledig | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Volledig | Volledig | ⭐⭐⭐ |
| AI Documentverwerking | 2 | ❌ | Basis | Volledig | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Volledig | Volledig | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** | **8+** | **✅** | **Enterprise** | **Geavanceerd** | **⭐⭐⭐⭐** |

## 🎓 Leerpad

### Aanbevolen volgorde

1. **Begin met eenvoudige webapp**
   - Leer basisconcepten van AZD
   - Begrijp implementatieworkflow
   - Oefen omgevingsbeheer

2. **Probeer statische website**
   - Verken verschillende hostingopties
   - Leer over CDN-integratie
   - Begrijp DNS-configuratie

3. **Ga verder met containerapp**
   - Leer basisprincipes van containerisatie
   - Begrijp schaalconcepten
   - Oefen met Docker

4. **Voeg database-integratie toe**
   - Leer databasevoorziening
   - Begrijp verbindingsstrings
   - Oefen geheimenbeheer

5. **Verken serverless**
   - Begrijp event-driven architectuur
   - Leer over triggers en bindings
   - Oefen met API's

6. **Bouw microservices**
   - Leer servicecommunicatie
   - Begrijp gedistribueerde systemen
   - Oefen complexe implementaties

## 🔍 Het juiste voorbeeld vinden

### Op technologie stack
- **Node.js**: Node.js Express Todo App
- **Python**: Python Flask Container App, Python Functions + SPA
- **C#**: C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: Python Flask Container App, Java Microservices
- **Databases**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: Azure OpenAI Chat App, AI Documentverwerking, ML Pipeline, **Retail Multi-Agent Oplossing**
- **Multi-Agent Systemen**: **Retail Multi-Agent Oplossing**
- **Enterprise Productie**: **Retail Multi-Agent Oplossing**

### Op architectuurpatroon
- **Monolithisch**: Node.js Express Todo, C# Web API + SQL
- **Statisch + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: Java Spring Boot Microservices
- **Gecontaineriseerd**: Python Flask Container App
- **AI-gedreven**: Azure OpenAI Chat App, AI Documentverwerking, ML Pipeline, **Retail Multi-Agent Oplossing**
- **Multi-Agent Architectuur**: **Retail Multi-Agent Oplossing**
- **Enterprise Multi-Service**: **Retail Multi-Agent Oplossing**

### Op complexiteitsniveau
- **Beginner**: Node.js Express Todo, React SPA + Functions, Python Flask Container App
- **Intermediate**: C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Documentverwerking
- **Geavanceerd**: ML Pipeline
- **Enterprise Productieklaar**: **Retail Multi-Agent Oplossing** (Volledig multi-agent systeem met ARM-sjabloonimplementatie)

## 📚 Aanvullende bronnen

### Documentatielinks
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentatie](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architectuurcentrum](https://learn.microsoft.com/en-us/azure/architecture/)

### Community Voorbeelden
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App met C# en Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App met Python en MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App met Node.js en PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web App met C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions met Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Beste Praktijken
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Voorbeelden Bijdragen

Heb je een nuttig voorbeeld om te delen? We verwelkomen bijdragen!

### Richtlijnen voor Indienen
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

**Handige Tip**: Begin met het eenvoudigste voorbeeld dat aansluit bij jouw technologie-stack en werk geleidelijk toe naar complexere scenario's. Elk voorbeeld bouwt voort op concepten uit de vorige!

**Volgende Stappen**: 
- Kies een voorbeeld dat past bij jouw vaardigheidsniveau
- Volg de installatie-instructies in de README van het voorbeeld
- Experimenteer met aanpassingen
- Deel je ervaringen met de community

---

**Navigatie**
- **Vorige Les**: [Studiegids](../resources/study-guide.md)
- **Terug naar**: [Hoofd README](../README.md)

---

**Disclaimer**:  
Dit document is vertaald met behulp van de AI-vertalingsservice [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u zich ervan bewust te zijn dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in zijn oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor cruciale informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.