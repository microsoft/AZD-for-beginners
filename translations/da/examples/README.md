<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e45896a8acbafead1f195788780a4ab7",
  "translation_date": "2025-09-10T16:15:20+00:00",
  "source_file": "examples/README.md",
  "language_code": "da"
}
-->
# Eksempler - Praktiske AZD-skabeloner og konfigurationer

## Introduktion

Denne mappe indeholder praktiske eksempler, skabeloner og virkelige scenarier, der hjælper dig med at lære Azure Developer CLI gennem praktisk øvelse. Hvert eksempel leverer komplet fungerende kode, infrastrukturskabeloner og detaljerede instruktioner for forskellige applikationsarkitekturer og udrulningsmønstre.

## Læringsmål

Ved at arbejde med disse eksempler vil du:
- Øve Azure Developer CLI-workflows med realistiske applikationsscenarier
- Forstå forskellige applikationsarkitekturer og deres azd-implementeringer
- Mestre Infrastructure as Code-mønstre for forskellige Azure-tjenester
- Anvende konfigurationsstyring og miljøspecifikke udrulningsstrategier
- Implementere overvågnings-, sikkerheds- og skaleringsmønstre i praktiske kontekster
- Opbygge erfaring med fejlfinding og optimering af reelle udrulningsscenarier

## Læringsresultater

Når du har gennemført disse eksempler, vil du kunne:
- Udrulle forskellige applikationstyper med Azure Developer CLI med selvtillid
- Tilpasse de leverede skabeloner til dine egne applikationskrav
- Designe og implementere brugerdefinerede infrastruktursmønstre ved hjælp af Bicep
- Konfigurere komplekse applikationer med flere tjenester og korrekte afhængigheder
- Anvende sikkerheds-, overvågnings- og performance-best practices i virkelige scenarier
- Fejlsøge og optimere udrulninger baseret på praktisk erfaring

## Mappestruktur

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

### For begyndere
1. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - Udrul en Node.js Express-webapplikation med MongoDB
2. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - Host en React-statisk hjemmeside med Azure Static Web Apps
3. **[Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - Udrul en containeriseret Python Flask-applikation

### For øvede brugere
4. **[Database App - C# med Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - Webapplikation med C# API og Azure SQL Database
5. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - Python Azure Functions med HTTP-triggers og Cosmos DB
6. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - Multi-service Java-applikation med Container Apps og API-gateway

### Azure AI Foundry-skabeloner

1. **[Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)** - Intelligent chatapplikation med Azure OpenAI
2. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** - Dokumentanalyse ved hjælp af Azure AI-tjenester
3. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** - MLOps-workflow med Azure Machine Learning

## 📋 Brugsanvisning

### Kør eksempler lokalt

1. **Klon eller kopier eksempel**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **Initialiser AZD-miljø**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **Konfigurer miljø**
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Udrul**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### Tilpasning af eksempler

Hvert eksempel inkluderer:
- **README.md** - Detaljerede opsætnings- og tilpasningsinstruktioner
- **azure.yaml** - AZD-konfiguration med kommentarer
- **infra/** - Bicep-skabeloner med parameterforklaringer
- **src/** - Eksempelapplikationskode
- **scripts/** - Hjælpescripts til almindelige opgaver

## 🎯 Læringsmål

### Eksempelkategorier

#### **Grundlæggende udrulninger**
- Applikationer med én tjeneste
- Enkle infrastruktursmønstre
- Grundlæggende konfigurationsstyring
- Omkostningseffektive udviklingsopsætninger

#### **Avancerede scenarier**
- Arkitekturer med flere tjenester
- Komplekse netværkskonfigurationer
- Databaseintegrationsmønstre
- Implementeringer af sikkerhed og compliance

#### **Produktionsklare mønstre**
- Konfigurationer med høj tilgængelighed
- Overvågning og observabilitet
- CI/CD-integration
- Opsætninger til katastrofeberedskab

## 📖 Eksempelbeskrivelser

### Simple Web App - Node.js Express
**Teknologier**: Node.js, Express, MongoDB, Container Apps  
**Kompleksitet**: Begynder  
**Koncepter**: Grundlæggende udrulning, REST API, NoSQL-databaseintegration

### Static Website - React SPA
**Teknologier**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Kompleksitet**: Begynder  
**Koncepter**: Statisk hosting, serverless backend, moderne webudvikling

### Container App - Python Flask
**Teknologier**: Python Flask, Docker, Container Apps, Container Registry  
**Kompleksitet**: Begynder  
**Koncepter**: Containerisering, mikroservicearkitektur, API-udvikling

### Database App - C# med Azure SQL
**Teknologier**: C# ASP.NET Core, Azure SQL Database, App Service  
**Kompleksitet**: Øvet  
**Koncepter**: Entity Framework, databaseforbindelser, web API-udvikling

### Serverless Function - Python Azure Functions
**Teknologier**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Kompleksitet**: Øvet  
**Koncepter**: Event-drevet arkitektur, serverless computing, full-stack udvikling

### Microservices - Java Spring Boot
**Teknologier**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Kompleksitet**: Øvet  
**Koncepter**: Kommunikation mellem tjenester, distribuerede systemer, enterprise-mønstre

### Azure AI Foundry-eksempler

#### Azure OpenAI Chat App
**Teknologier**: Azure OpenAI, Cognitive Search, App Service  
**Kompleksitet**: Øvet  
**Koncepter**: RAG-arkitektur, vektorsøgning, LLM-integration

#### AI Document Processing
**Teknologier**: Azure AI Document Intelligence, Storage, Functions  
**Kompleksitet**: Øvet  
**Koncepter**: Dokumentanalyse, OCR, dataudtrækning

#### Machine Learning Pipeline
**Teknologier**: Azure ML, MLOps, Container Registry  
**Kompleksitet**: Avanceret  
**Koncepter**: Modeltræning, udrulningspipelines, overvågning

## 🛠 Konfigurationseksempler

Mappen `configurations/` indeholder genanvendelige komponenter:

### Miljøkonfigurationer
- Indstillinger for udviklingsmiljø
- Konfigurationer for staging-miljø
- Produktionsklare konfigurationer
- Opsætninger til udrulning i flere regioner

### Bicep-moduler
- Genanvendelige infrastrukturkomponenter
- Almindelige ressource-mønstre
- Sikkerhedshærdede skabeloner
- Omkostningsoptimerede konfigurationer

### Hjælpescripts
- Automatisering af miljøopsætning
- Scripts til databasemigrering
- Værktøjer til validering af udrulning
- Omkostningsovervågningsværktøjer

## 🔧 Tilpasningsvejledning

### Tilpasning af eksempler til din brugssag

1. **Gennemgå forudsætninger**
   - Tjek krav til Azure-tjenester
   - Bekræft abonnementsgrænser
   - Forstå omkostningsimplikationer

2. **Ændr konfiguration**
   - Opdater `azure.yaml`-tjenestedefinitioner
   - Tilpas Bicep-skabeloner
   - Juster miljøvariabler

3. **Test grundigt**
   - Udrul først til udviklingsmiljø
   - Valider funktionalitet
   - Test skalering og performance

4. **Sikkerhedsrevision**
   - Gennemgå adgangskontroller
   - Implementer hemmelighedsstyring
   - Aktiver overvågning og alarmer

## 📊 Sammenligningsmatrix

| Eksempel | Tjenester | Database | Auth | Overvågning | Kompleksitet |
|----------|-----------|----------|------|-------------|--------------|
| Node.js Express Todo | 2 | ✅ | Grundlæggende | Grundlæggende | ⭐ |
| React SPA + Functions | 3 | ✅ | Grundlæggende | Fuld | ⭐ |
| Python Flask Container | 2 | ❌ | Grundlæggende | Fuld | ⭐ |
| C# Web API + SQL | 2 | ✅ | Fuld | Fuld | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Fuld | Fuld | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Fuld | Fuld | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Fuld | Fuld | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Grundlæggende | Fuld | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Fuld | Fuld | ⭐⭐⭐⭐ |

## 🎓 Læringssti

### Anbefalet progression

1. **Start med Simple Web App**
   - Lær grundlæggende AZD-koncepter
   - Forstå udrulningsworkflow
   - Øv miljøstyring

2. **Prøv Static Website**
   - Udforsk forskellige hostingmuligheder
   - Lær om CDN-integration
   - Forstå DNS-konfiguration

3. **Gå videre til Container App**
   - Lær containeriseringsgrundlag
   - Forstå skalering
   - Øv med Docker

4. **Tilføj databaseintegration**
   - Lær databaseprovisionering
   - Forstå forbindelsesstrenge
   - Øv hemmelighedsstyring

5. **Udforsk Serverless**
   - Forstå event-drevet arkitektur
   - Lær om triggers og bindings
   - Øv med API'er

6. **Byg Microservices**
   - Lær tjenestekommunikation
   - Forstå distribuerede systemer
   - Øv komplekse udrulninger

## 🔍 Find det rette eksempel

### Efter teknologistak
- **Node.js**: Node.js Express Todo App
- **Python**: Python Flask Container App, Python Functions + SPA
- **C#**: C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: Python Flask Container App, Java Microservices
- **Databaser**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline

### Efter arkitekturmønster
- **Monolitisk**: Node.js Express Todo, C# Web API + SQL
- **Statisk + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: Java Spring Boot Microservices
- **Containeriseret**: Python Flask Container App
- **AI-drevet**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline

### Efter kompleksitetsniveau
- **Begynder**: Node.js Express Todo, React SPA + Functions, Python Flask Container App
- **Øvet**: C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Avanceret**: ML Pipeline

## 📚 Yderligere ressourcer

### Dokumentationslinks
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Dokumentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Arkitekturcenter](https://learn.microsoft.com/en-us/azure/architecture/)

### Community-eksempler
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App med C# og Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App med Python og MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App med Node.js og PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web App med C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions med Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Best Practices
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Bidrag med eksempler

Har du et nyttigt eksempel at dele? Vi byder bidrag velkommen!

### Retningslinjer for indsendelse
1. Følg den etablerede mappestruktur
2. Inkluder omfattende README.md
3. Tilføj kommentarer til konfigurationsfiler
4. Test grundigt før indsendelse
5. Inkluder omkostningsestimater og forudsætninger

### Eksempelskabelonstruktur
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

**Tip**: Start med det enkleste eksempel, der matcher din teknologistak, og arbejd dig gradvist op til mere komplekse scenarier. Hvert eksempel bygger på koncepter fra de foregående!

**Næste trin**: 
- Vælg et eksempel, der matcher dit færdighedsniveau
- Følg opsætningsinstruktionerne i eksemplets README
- Eksperimenter med tilpasninger
- Del dine erfaringer med fællesskabet

---

**Navigation**
- **Forrige lektion**: [Studieguide](../resources/study-guide.md)
- **Tilbage til**: [Hoved README](../README.md)

---

**Ansvarsfraskrivelse**:  
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os ikke ansvar for eventuelle misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.