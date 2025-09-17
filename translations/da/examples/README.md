<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "0fd083f39ef5508994526bb18e9fcd78",
  "translation_date": "2025-09-17T23:32:54+00:00",
  "source_file": "examples/README.md",
  "language_code": "da"
}
-->
# Eksempler - Praktiske AZD-skabeloner og konfigurationer

**Lær ved eksempler - Organiseret efter kapitel**
- **📚 Kursushjem**: [AZD For Begyndere](../README.md)
- **📖 Kapiteloversigt**: Eksempler organiseret efter læringskompleksitet
- **🚀 Start simpelt**: [Kapitel 1 Eksempler](../../../examples)
- **🤖 AI Eksempler**: [Kapitel 2 & 5 AI-løsninger](../../../examples)

## Introduktion

Denne mappe indeholder praktiske eksempler, skabeloner og virkelighedsnære scenarier, der hjælper dig med at lære Azure Developer CLI gennem praktisk øvelse. Hvert eksempel giver komplet fungerende kode, infrastrukturskabeloner og detaljerede instruktioner for forskellige applikationsarkitekturer og udrulningsmønstre.

## Læringsmål

Ved at arbejde med disse eksempler vil du:
- Øve Azure Developer CLI-workflows med realistiske applikationsscenarier
- Forstå forskellige applikationsarkitekturer og deres azd-implementeringer
- Mestre Infrastructure as Code-mønstre for forskellige Azure-tjenester
- Anvende konfigurationsstyring og miljøspecifikke udrulningsstrategier
- Implementere overvågnings-, sikkerheds- og skaleringsmønstre i praktiske kontekster
- Opbygge erfaring med fejlfinding og debugging af reelle udrulningsscenarier

## Læringsresultater

Når du har gennemført disse eksempler, vil du kunne:
- Udrulle forskellige applikationstyper med Azure Developer CLI med selvtillid
- Tilpasse de medfølgende skabeloner til dine egne applikationskrav
- Designe og implementere brugerdefinerede infrastruktursmønstre ved hjælp af Bicep
- Konfigurere komplekse multi-service applikationer med korrekte afhængigheder
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

## Hurtigstart Eksempler

### For begyndere
1. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - Udrul en Node.js Express webapplikation med MongoDB
2. **[Statisk Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - Host en React statisk hjemmeside med Azure Static Web Apps
3. **[Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - Udrul en containeriseret Python Flask applikation

### For øvede brugere
4. **[Database App - C# med Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - Webapplikation med C# API og Azure SQL Database
5. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - Python Azure Functions med HTTP-triggers og Cosmos DB
6. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - Multi-service Java applikation med Container Apps og API gateway

### Azure AI Foundry Skabeloner

1. **[Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)** - Intelligent chatapplikation med Azure OpenAI
2. **[AI Dokumentbehandling](https://github.com/Azure-Samples/azure-ai-document-processing)** - Dokumentanalyse ved hjælp af Azure AI-tjenester
3. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** - MLOps workflow med Azure Machine Learning

### Virkelighedsnære scenarier

#### **Retail Multi-Agent Solution** 🆕
**[Komplet Implementeringsguide](./retail-scenario.md)**

En omfattende, produktionsklar multi-agent kundesupportløsning, der demonstrerer AI-applikationsudrulning i enterprise-kvalitet med AZD. Dette scenarie tilbyder:

- **Komplet Arkitektur**: Multi-agent system med specialiserede kundeservice- og lagerstyringsagenter
- **Produktionsinfrastruktur**: Multi-region Azure OpenAI udrulninger, AI Search, Container Apps og omfattende overvågning
- **Klar-til-udrulning ARM-skabelon**: Én-klik udrulning med flere konfigurationsmodi (Minimal/Standard/Premium)
- **Avancerede Funktioner**: Red teaming sikkerhedsvalidering, agent evalueringsramme, omkostningsoptimering og fejlsøgningsguider
- **Reel Forretningskontekst**: Detailhandels kundesupport use case med filuploads, søgeintegration og dynamisk skalering

**Teknologier**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Kompleksitet**: ⭐⭐⭐⭐ (Avanceret - Enterprise Produktionsklar)

**Perfekt til**: AI-udviklere, løsningsarkitekter og teams, der bygger produktionsklare multi-agent systemer

**Hurtigstart**: Udrul den komplette løsning på under 30 minutter ved hjælp af den medfølgende ARM-skabelon med `./deploy.sh -g myResourceGroup`

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

#### **Grundlæggende Udrulninger**
- Enkelt-service applikationer
- Simple infrastruktursmønstre
- Grundlæggende konfigurationsstyring
- Omkostningseffektive udviklingsopsætninger

#### **Avancerede Scenarier**
- Multi-service arkitekturer
- Komplekse netværkskonfigurationer
- Databaseintegrationsmønstre
- Sikkerheds- og compliance-implementeringer

#### **Produktionsklare Mønstre**
- Høj tilgængelighedskonfigurationer
- Overvågning og observabilitet
- CI/CD-integration
- Disaster recovery opsætninger

## 📖 Eksempelbeskrivelser

### Simple Web App - Node.js Express
**Teknologier**: Node.js, Express, MongoDB, Container Apps  
**Kompleksitet**: Begynder  
**Koncepter**: Grundlæggende udrulning, REST API, NoSQL databaseintegration

### Statisk Website - React SPA
**Teknologier**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Kompleksitet**: Begynder  
**Koncepter**: Statisk hosting, serverless backend, moderne webudvikling

### Container App - Python Flask
**Teknologier**: Python Flask, Docker, Container Apps, Container Registry  
**Kompleksitet**: Begynder  
**Koncepter**: Containerisering, mikroservices arkitektur, API-udvikling

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
**Koncepter**: Microservices kommunikation, distribuerede systemer, enterprise mønstre

### Azure AI Foundry Eksempler

#### Azure OpenAI Chat App
**Teknologier**: Azure OpenAI, Cognitive Search, App Service  
**Kompleksitet**: Øvet  
**Koncepter**: RAG arkitektur, vektorsøgning, LLM integration

#### AI Dokumentbehandling
**Teknologier**: Azure AI Document Intelligence, Storage, Functions  
**Kompleksitet**: Øvet  
**Koncepter**: Dokumentanalyse, OCR, dataudtræk

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
- Multi-region udrulningsopsætninger

### Bicep Moduler
- Genanvendelige infrastrukturkomponenter
- Almindelige ressource-mønstre
- Sikkerhedshærdede skabeloner
- Omkostningsoptimerede konfigurationer

### Hjælpescripts
- Automatisering af miljøopsætning
- Scripts til database-migrering
- Værktøjer til udrulningsvalidering
- Omkostningsovervågningsværktøjer

## 🔧 Tilpasningsguide

### Tilpasning af eksempler til din brugssituation

1. **Gennemgå forudsætninger**
   - Tjek krav til Azure-tjenester
   - Bekræft abonnementsgrænser
   - Forstå omkostningsimplikationer

2. **Ændr konfiguration**
   - Opdater `azure.yaml` service-definitioner
   - Tilpas Bicep-skabeloner
   - Juster miljøvariabler

3. **Test grundigt**
   - Udrul først til udviklingsmiljø
   - Valider funktionalitet
   - Test skalering og performance

4. **Sikkerhedsrevision**
   - Gennemgå adgangskontroller
   - Implementer hemmelighedshåndtering
   - Aktiver overvågning og alarmer

## 📊 Sammenligningsmatrix

| Eksempel | Tjenester | Database | Auth | Overvågning | Kompleksitet |
|----------|-----------|----------|------|-------------|--------------|
| Node.js Express Todo | 2 | ✅ | Basic | Basic | ⭐ |
| React SPA + Functions | 3 | ✅ | Basic | Full | ⭐ |
| Python Flask Container | 2 | ❌ | Basic | Full | ⭐ |
| C# Web API + SQL | 2 | ✅ | Full | Full | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Full | Full | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Full | Full | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Full | Full | ⭐⭐⭐ |
| AI Dokumentbehandling | 2 | ❌ | Basic | Full | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Full | Full | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** | **8+** | **✅** | **Enterprise** | **Advanced** | **⭐⭐⭐⭐** |

## 🎓 Læringssti

### Anbefalet progression

1. **Start med Simple Web App**
   - Lær grundlæggende AZD-koncepter
   - Forstå udrulningsworkflow
   - Øv miljøstyring

2. **Prøv Statisk Website**
   - Udforsk forskellige hostingmuligheder
   - Lær om CDN-integration
   - Forstå DNS-konfiguration

3. **Gå videre til Container App**
   - Lær containeriseringsgrundlag
   - Forstå skaleringskoncepter
   - Øv med Docker

4. **Tilføj Databaseintegration**
   - Lær databaseprovisionering
   - Forstå forbindelsesstrenge
   - Øv hemmelighedshåndtering

5. **Udforsk Serverless**
   - Forstå event-drevet arkitektur
   - Lær om triggers og bindings
   - Øv med API'er

6. **Byg Microservices**
   - Lær servicekommunikation
   - Forstå distribuerede systemer
   - Øv komplekse udrulninger

## 🔍 Find det rette eksempel

### Efter Teknologistak
- **Node.js**: Node.js Express Todo App
- **Python**: Python Flask Container App, Python Functions + SPA
- **C#**: C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: Python Flask Container App, Java Microservices
- **Databaser**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: Azure OpenAI Chat App, AI Dokumentbehandling, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systemer**: **Retail Multi-Agent Solution**
- **Enterprise Produktion**: **Retail Multi-Agent Solution**

### Efter Arkitektur Mønster
- **Monolitisk**: Node.js Express Todo, C# Web API + SQL
- **Statisk + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: Java Spring Boot Microservices
- **Containeriseret**: Python Flask Container App
- **AI-drevet**: Azure OpenAI Chat App, AI Dokumentbehandling, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Arkitektur**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: **Retail Multi-Agent Solution**

### Efter Kompleksitetsniveau
- **Begynder**: Node.js Express Todo, React SPA + Functions, Python Flask Container App
- **Øvet**: C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Dokumentbehandling
- **Avanceret**: ML Pipeline
- **Enterprise Produktionsklar**: **Retail Multi-Agent Solution** (Komplet multi-agent system med ARM-skabelon udrulning)

## 📚 Yderligere ressourcer

### Dokumentationslinks
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Azure AI Foundry AZD Skabeloner](https://github.com/Azure/ai-foundry-templates)
- [Bicep Dokumentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Arkitekturcenter](https://learn.microsoft.com/en-us/azure/architecture/)

### Community Eksempler
- [Azure Samples AZD Skabeloner](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry Skabeloner](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Galleri](https://azure.github.io/awesome-azd/)
- [Todo App med C# og Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App med Python og MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App med Node.js og PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web App med C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions med Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Bedste Fremgangsmåder
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Bidrag med Eksempler

Har du et nyttigt eksempel at dele? Vi modtager gerne bidrag!

### Retningslinjer for Indsendelse
1. Følg den etablerede mappestruktur
2. Inkluder en omfattende README.md
3. Tilføj kommentarer til konfigurationsfiler
4. Test grundigt før indsendelse
5. Inkluder omkostningsestimater og forudsætninger

### Eksempel på Skabelonstruktur
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

**Godt Tip**: Start med det enkleste eksempel, der passer til din teknologistak, og arbejd dig gradvist op til mere komplekse scenarier. Hvert eksempel bygger på koncepter fra de foregående!

**Næste Skridt**: 
- Vælg et eksempel, der passer til dit færdighedsniveau
- Følg opsætningsinstruktionerne i eksemplets README
- Eksperimentér med tilpasninger
- Del dine erfaringer med fællesskabet

---

**Navigation**
- **Forrige Lektion**: [Studieguide](../resources/study-guide.md)
- **Tilbage til**: [Hoved README](../README.md)

---

**Ansvarsfraskrivelse**:  
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på at sikre nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os ikke ansvar for eventuelle misforståelser eller fejltolkninger, der måtte opstå som følge af brugen af denne oversættelse.