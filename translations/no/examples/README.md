<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e45896a8acbafead1f195788780a4ab7",
  "translation_date": "2025-09-10T16:16:01+00:00",
  "source_file": "examples/README.md",
  "language_code": "no"
}
-->
# Eksempler - Praktiske AZD-maler og konfigurasjoner

## Introduksjon

Denne katalogen inneholder praktiske eksempler, maler og virkelige scenarier for å hjelpe deg med å lære Azure Developer CLI gjennom praktisk øving. Hvert eksempel gir komplett fungerende kode, infrastruktursmaler og detaljerte instruksjoner for ulike applikasjonsarkitekturer og distribusjonsmønstre.

## Læringsmål

Ved å jobbe gjennom disse eksemplene vil du:
- Øve på Azure Developer CLI-arbeidsflyter med realistiske applikasjonsscenarier
- Forstå ulike applikasjonsarkitekturer og deres azd-implementeringer
- Mestre Infrastructure as Code-mønstre for ulike Azure-tjenester
- Anvende konfigurasjonsstyring og distribusjonsstrategier for spesifikke miljøer
- Implementere overvåking, sikkerhet og skaleringsmønstre i praktiske kontekster
- Bygge erfaring med feilsøking og optimalisering av reelle distribusjonsscenarier

## Læringsutbytte

Når du har fullført disse eksemplene, vil du kunne:
- Trygt distribuere ulike applikasjonstyper ved hjelp av Azure Developer CLI
- Tilpasse de medfølgende malene til dine egne applikasjonsbehov
- Designe og implementere tilpassede infrastrukturmønstre ved hjelp av Bicep
- Konfigurere komplekse applikasjoner med flere tjenester og riktige avhengigheter
- Anvende beste praksis for sikkerhet, overvåking og ytelse i virkelige scenarier
- Feilsøke og optimalisere distribusjoner basert på praktisk erfaring

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

## Hurtigstart-eksempler

### For nybegynnere
1. **[Enkel webapp - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - Distribuer en Node.js Express-webapplikasjon med MongoDB
2. **[Statisk nettsted - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - Host et statisk React-nettsted med Azure Static Web Apps
3. **[Container-app - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - Distribuer en containerisert Python Flask-applikasjon

### For viderekomne brukere
4. **[Database-app - C# med Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - Webapplikasjon med C# API og Azure SQL Database
5. **[Serverless-funksjon - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - Python Azure Functions med HTTP-triggere og Cosmos DB
6. **[Mikrotjenester - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - Multi-service Java-applikasjon med Container Apps og API-gateway

### Azure AI Foundry-maler

1. **[Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)** - Intelligent chat-applikasjon med Azure OpenAI
2. **[AI-dokumentbehandling](https://github.com/Azure-Samples/azure-ai-document-processing)** - Dokumentanalyse ved hjelp av Azure AI-tjenester
3. **[Maskinlæringspipeline](https://github.com/Azure-Samples/mlops-v2)** - MLOps-arbeidsflyt med Azure Machine Learning

## 📋 Bruksanvisning

### Kjøre eksempler lokalt

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

4. **Distribuer**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### Tilpasse eksempler

Hvert eksempel inkluderer:
- **README.md** - Detaljerte oppsett- og tilpasningsinstruksjoner
- **azure.yaml** - AZD-konfigurasjon med kommentarer
- **infra/** - Bicep-maler med parameterforklaringer
- **src/** - Eksempelapplikasjonskode
- **scripts/** - Hjelpeskript for vanlige oppgaver

## 🎯 Læringsmål

### Eksempelkategorier

#### **Grunnleggende distribusjoner**
- Applikasjoner med én tjeneste
- Enkle infrastrukturmønstre
- Grunnleggende konfigurasjonsstyring
- Kostnadseffektive utviklingsoppsett

#### **Avanserte scenarier**
- Arkitekturer med flere tjenester
- Komplekse nettverkskonfigurasjoner
- Databasintegrasjonsmønstre
- Implementeringer for sikkerhet og samsvar

#### **Produksjonsklare mønstre**
- Konfigurasjoner for høy tilgjengelighet
- Overvåking og observabilitet
- CI/CD-integrasjon
- Oppsett for katastrofegjenoppretting

## 📖 Eksempelbeskrivelser

### Enkel webapp - Node.js Express
**Teknologier**: Node.js, Express, MongoDB, Container Apps  
**Kompleksitet**: Nybegynner  
**Konsepter**: Grunnleggende distribusjon, REST API, NoSQL-databasintegrasjon

### Statisk nettsted - React SPA
**Teknologier**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Kompleksitet**: Nybegynner  
**Konsepter**: Statisk hosting, serverless backend, moderne webutvikling

### Container-app - Python Flask
**Teknologier**: Python Flask, Docker, Container Apps, Container Registry  
**Kompleksitet**: Nybegynner  
**Konsepter**: Containerisering, mikrotjenestearkitektur, API-utvikling

### Database-app - C# med Azure SQL
**Teknologier**: C# ASP.NET Core, Azure SQL Database, App Service  
**Kompleksitet**: Viderekommen  
**Konsepter**: Entity Framework, databaseforbindelser, web API-utvikling

### Serverless-funksjon - Python Azure Functions
**Teknologier**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Kompleksitet**: Viderekommen  
**Konsepter**: Hendelsesdrevet arkitektur, serverless computing, full-stack utvikling

### Mikrotjenester - Java Spring Boot
**Teknologier**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Kompleksitet**: Viderekommen  
**Konsepter**: Kommunikasjon mellom tjenester, distribuerte systemer, bedriftsmønstre

### Azure AI Foundry-eksempler

#### Azure OpenAI Chat App
**Teknologier**: Azure OpenAI, Cognitive Search, App Service  
**Kompleksitet**: Viderekommen  
**Konsepter**: RAG-arkitektur, vektorsøk, LLM-integrasjon

#### AI-dokumentbehandling
**Teknologier**: Azure AI Document Intelligence, Storage, Functions  
**Kompleksitet**: Viderekommen  
**Konsepter**: Dokumentanalyse, OCR, datauttrekk

#### Maskinlæringspipeline
**Teknologier**: Azure ML, MLOps, Container Registry  
**Kompleksitet**: Avansert  
**Konsepter**: Modelltrening, distribusjonspipelines, overvåking

## 🛠 Konfigurasjonseksempler

Katalogen `configurations/` inneholder gjenbrukbare komponenter:

### Miljøkonfigurasjoner
- Innstillinger for utviklingsmiljø
- Konfigurasjoner for staging-miljø
- Produksjonsklare konfigurasjoner
- Distribusjonsoppsett for flere regioner

### Bicep-moduler
- Gjenbrukbare infrastrukturkomponenter
- Vanlige ressursmønstre
- Sikkerhetsherdede maler
- Kostnadsoptimaliserte konfigurasjoner

### Hjelpeskript
- Automatisering av miljøoppsett
- Skript for databasemigrering
- Verktøy for validering av distribusjoner
- Kostnadsovervåkingsverktøy

## 🔧 Tilpasningsveiledning

### Tilpasse eksempler til ditt brukstilfelle

1. **Gjennomgå forutsetninger**
   - Sjekk krav til Azure-tjenester
   - Verifiser abonnementsgrenser
   - Forstå kostnadsimplikasjoner

2. **Endre konfigurasjon**
   - Oppdater tjenestedefinisjoner i `azure.yaml`
   - Tilpass Bicep-maler
   - Juster miljøvariabler

3. **Test grundig**
   - Distribuer først til utviklingsmiljø
   - Valider funksjonalitet
   - Test skalerbarhet og ytelse

4. **Sikkerhetsgjennomgang**
   - Gjennomgå tilgangskontroller
   - Implementer hemmelighetshåndtering
   - Aktiver overvåking og varsling

## 📊 Sammenligningsmatrise

| Eksempel | Tjenester | Database | Autentisering | Overvåking | Kompleksitet |
|----------|-----------|----------|---------------|------------|--------------|
| Node.js Express Todo | 2 | ✅ | Grunnleggende | Grunnleggende | ⭐ |
| React SPA + Functions | 3 | ✅ | Grunnleggende | Full | ⭐ |
| Python Flask Container | 2 | ❌ | Grunnleggende | Full | ⭐ |
| C# Web API + SQL | 2 | ✅ | Full | Full | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Full | Full | ⭐⭐ |
| Java Mikrotjenester | 5+ | ✅ | Full | Full | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Full | Full | ⭐⭐⭐ |
| AI-dokumentbehandling | 2 | ❌ | Grunnleggende | Full | ⭐⭐ |
| ML-pipeline | 4+ | ✅ | Full | Full | ⭐⭐⭐⭐ |

## 🎓 Læringssti

### Anbefalt progresjon

1. **Start med enkel webapp**
   - Lær grunnleggende AZD-konsepter
   - Forstå distribusjonsarbeidsflyt
   - Øv på miljøstyring

2. **Prøv statisk nettsted**
   - Utforsk ulike hostingalternativer
   - Lær om CDN-integrasjon
   - Forstå DNS-konfigurasjon

3. **Gå videre til container-app**
   - Lær grunnleggende containerisering
   - Forstå skaleringskonsepter
   - Øv med Docker

4. **Legg til databasintegrasjon**
   - Lær databaseprovisjonering
   - Forstå tilkoblingsstrenger
   - Øv på hemmelighetshåndtering

5. **Utforsk serverless**
   - Forstå hendelsesdrevet arkitektur
   - Lær om triggere og bindinger
   - Øv med API-er

6. **Bygg mikrotjenester**
   - Lær tjenestekommunikasjon
   - Forstå distribuerte systemer
   - Øv på komplekse distribusjoner

## 🔍 Finne riktig eksempel

### Etter teknologistack
- **Node.js**: Node.js Express Todo App
- **Python**: Python Flask Container App, Python Functions + SPA
- **C#**: C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Java**: Java Spring Boot Mikrotjenester
- **React**: React SPA + Functions
- **Containere**: Python Flask Container App, Java Mikrotjenester
- **Databaser**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: Azure OpenAI Chat App, AI-dokumentbehandling, ML-pipeline

### Etter arkitekturmønster
- **Monolittisk**: Node.js Express Todo, C# Web API + SQL
- **Statisk + Serverless**: React SPA + Functions, Python Functions + SPA
- **Mikrotjenester**: Java Spring Boot Mikrotjenester
- **Containerisert**: Python Flask Container App
- **AI-drevet**: Azure OpenAI Chat App, AI-dokumentbehandling, ML-pipeline

### Etter kompleksitetsnivå
- **Nybegynner**: Node.js Express Todo, React SPA + Functions, Python Flask Container App
- **Viderekommen**: C# Web API + SQL, Python Functions + SPA, Java Mikrotjenester, Azure OpenAI Chat App, AI-dokumentbehandling
- **Avansert**: ML-pipeline

## 📚 Tilleggsressurser

### Dokumentasjonslenker
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep-dokumentasjon](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Fellesskapseksempler
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App med C# og Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App med Python og MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App med Node.js og PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web App med C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions med Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Beste praksis
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Bidra med eksempler

Har du et nyttig eksempel å dele? Vi ønsker bidrag velkommen!

### Retningslinjer for innsending
1. Følg den etablerte katalogstrukturen
2. Inkluder omfattende README.md
3. Legg til kommentarer i konfigurasjonsfiler
4. Test grundig før innsending
5. Inkluder kostnadsestimater og forutsetninger

### Eksempelmalestruktur
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

**Tips**: Start med det enkleste eksempelet som passer din teknologistack, og jobb deg gradvis opp til mer komplekse scenarier. Hvert eksempel bygger på konsepter fra de forrige!

**Neste steg**: 
- Velg et eksempel som passer ditt ferdighetsnivå
- Følg oppsettsinstruksjonene i eksempelets README
- Eksperimenter med tilpasninger
- Del dine erfaringer med fellesskapet

---

**Navigasjon**
- **Forrige leksjon**: [Studieguide](../resources/study-guide.md)
- **Tilbake til**: [Hoved-README](../README.md)

---

**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi tilstreber nøyaktighet, vær oppmerksom på at automatiserte oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på sitt opprinnelige språk bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.