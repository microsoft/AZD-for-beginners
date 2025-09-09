<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9b7074c8a39e77d2f10fb08b3c6ce34f",
  "translation_date": "2025-09-09T22:10:36+00:00",
  "source_file": "examples/README.md",
  "language_code": "da"
}
-->
# Eksempler - Praktiske AZD-skabeloner og konfigurationer

## Introduktion

Denne mappe indeholder praktiske eksempler, skabeloner og virkelige scenarier, der hjælper dig med at lære Azure Developer CLI gennem praktisk øvelse. Hvert eksempel leverer komplet fungerende kode, infrastrukturskabeloner og detaljerede instruktioner for forskellige applikationsarkitekturer og udrulningsmønstre.

## Læringsmål

Ved at arbejde med disse eksempler vil du:
- Øve Azure Developer CLI-arbejdsgange med realistiske applikationsscenarier
- Forstå forskellige applikationsarkitekturer og deres azd-implementeringer
- Mestre Infrastructure as Code-mønstre for forskellige Azure-tjenester
- Anvende konfigurationsstyring og miljøspecifikke udrulningsstrategier
- Implementere overvågnings-, sikkerheds- og skaleringsmønstre i praktiske sammenhænge
- Opbygge erfaring med fejlfinding og debugging af reelle udrulningsscenarier

## Læringsresultater

Når du har gennemført disse eksempler, vil du kunne:
- Udrulle forskellige applikationstyper med Azure Developer CLI med selvtillid
- Tilpasse de leverede skabeloner til dine egne applikationskrav
- Designe og implementere brugerdefinerede infrastruktursmønstre ved hjælp af Bicep
- Konfigurere komplekse multi-service applikationer med korrekte afhængigheder
- Anvende sikkerheds-, overvågnings- og performance-best practices i virkelige scenarier
- Fejlsøge og optimere udrulninger baseret på praktisk erfaring

## Mappestruktur

```
examples/
├── simple-web-app/          # Basic web application deployment
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── microservices/           # Multi-service application
│   ├── azure.yaml
│   ├── infra/
│   ├── services/
│   └── README.md
├── database-app/            # Application with database
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── container-app/           # Containerized application
│   ├── azure.yaml
│   ├── infra/
│   ├── Dockerfile
│   ├── src/
│   └── README.md
├── serverless-function/     # Azure Functions example
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── static-website/          # Static website deployment
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
└── configurations/          # Common configuration examples
    ├── environment-configs/
    ├── bicep-modules/
    └── scripts/
```

## Hurtigstartseksempler

### For begyndere
1. **[Simple Web App](../../../examples/simple-web-app)** - Udrul en grundlæggende Node.js-webapplikation
2. **[Static Website](../../../examples/static-website)** - Host en statisk hjemmeside på Azure Storage
3. **[Container App](../../../examples/container-app)** - Udrul en containeriseret applikation

### For øvede brugere
4. **[Database App](../../../examples/database-app)** - Webapplikation med PostgreSQL-database
5. **[Serverless Function](../../../examples/serverless-function)** - Azure Functions med HTTP-triggere
6. **[Microservices](../../../examples/microservices)** - Multi-service applikation med API-gateway

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
- Enkelt-service applikationer
- Enkle infrastruktursmønstre
- Grundlæggende konfigurationsstyring
- Omkostningseffektive udviklingsopsætninger

#### **Avancerede scenarier**
- Multi-service arkitekturer
- Komplekse netværkskonfigurationer
- Databaseintegrationsmønstre
- Sikkerheds- og compliance-implementeringer

#### **Produktionsklare mønstre**
- Høj tilgængelighedskonfigurationer
- Overvågning og observabilitet
- CI/CD-integration
- Disaster recovery-opsætninger

## 📖 Eksempeldeskriptioner

### Simple Web App
**Teknologier**: Node.js, App Service, Application Insights  
**Kompleksitet**: Begynder  
**Koncepter**: Grundlæggende udrulning, miljøvariabler, sundhedstjek

### Static Website
**Teknologier**: HTML/CSS/JS, Storage Account, CDN  
**Kompleksitet**: Begynder  
**Koncepter**: Statisk hosting, CDN-integration, brugerdefinerede domæner

### Container App
**Teknologier**: Docker, Container Apps, Container Registry  
**Kompleksitet**: Øvet  
**Koncepter**: Containerisering, skalering, ingress-konfiguration

### Database App
**Teknologier**: Python Flask, PostgreSQL, App Service  
**Kompleksitet**: Øvet  
**Koncepter**: Databaseforbindelser, hemmelighedshåndtering, migrationer

### Serverless Function
**Teknologier**: Azure Functions, Cosmos DB, API Management  
**Kompleksitet**: Øvet  
**Koncepter**: Event-drevet arkitektur, bindings, API-styring

### Microservices
**Teknologier**: Flere tjenester, Service Bus, API Gateway  
**Kompleksitet**: Avanceret  
**Koncepter**: Servicekommunikation, beskedkøer, load balancing

## 🛠 Konfigurationseksempler

Mappen `configurations/` indeholder genanvendelige komponenter:

### Miljøkonfigurationer
- Indstillinger for udviklingsmiljø
- Konfigurationer for staging-miljø
- Produktionsklare konfigurationer
- Multi-region udrulningsopsætninger

### Bicep-moduler
- Genanvendelige infrastrukturskomponenter
- Almindelige ressource-mønstre
- Sikkerhedshærdede skabeloner
- Omkostningsoptimerede konfigurationer

### Hjælpescripts
- Automatisering af miljøopsætning
- Scripts til databasemigration
- Værktøjer til validering af udrulning
- Omkostningsovervågningsværktøjer

## 🔧 Tilpasningsvejledning

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
| Simple Web App | 1 | ❌ | Grundlæggende | Grundlæggende | ⭐ |
| Static Website | 1 | ❌ | ❌ | Grundlæggende | ⭐ |
| Container App | 1 | ❌ | Grundlæggende | Fuld | ⭐⭐ |
| Database App | 2 | ✅ | Fuld | Fuld | ⭐⭐⭐ |
| Serverless Function | 3 | ✅ | Fuld | Fuld | ⭐⭐⭐ |
| Microservices | 5+ | ✅ | Fuld | Fuld | ⭐⭐⭐⭐ |

## 🎓 Læringssti

### Anbefalet progression

1. **Start med Simple Web App**
   - Lær grundlæggende AZD-koncepter
   - Forstå udrulningsarbejdsgang
   - Øv miljøstyring

2. **Prøv Static Website**
   - Udforsk forskellige hostingmuligheder
   - Lær om CDN-integration
   - Forstå DNS-konfiguration

3. **Gå videre til Container App**
   - Lær grundlæggende containerisering
   - Forstå skalering
   - Øv med Docker

4. **Tilføj databaseintegration**
   - Lær databaseprovisionering
   - Forstå forbindelsesstrenge
   - Øv hemmelighedshåndtering

5. **Udforsk Serverless**
   - Forstå event-drevet arkitektur
   - Lær om triggere og bindings
   - Øv med API'er

6. **Byg Microservices**
   - Lær servicekommunikation
   - Forstå distribuerede systemer
   - Øv komplekse udrulninger

## 🔍 Find det rigtige eksempel

### Efter teknologistak
- **Node.js**: Simple Web App, Microservices
- **Python**: Database App, Serverless Function
- **Statisk**: Static Website
- **Containere**: Container App, Microservices
- **Databaser**: Database App, Serverless Function

### Efter arkitekturmønster
- **Monolitisk**: Simple Web App, Database App
- **Statisk**: Static Website
- **Microservices**: Microservices-eksempel
- **Serverless**: Serverless Function
- **Hybrid**: Container App

### Efter kompleksitetsniveau
- **Begynder**: Simple Web App, Static Website
- **Øvet**: Container App, Database App, Serverless Function  
- **Avanceret**: Microservices

## 📚 Yderligere ressourcer

### Dokumentationslinks
- [AZD Template Specification](https://aka.ms/azd/templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Community-eksempler
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [AZD Templates Gallery](https://azure.github.io/awesome-azd/)

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

**Næste skridt**: 
- Vælg et eksempel, der matcher dit færdighedsniveau
- Følg opsætningsinstruktionerne i eksemplets README
- Eksperimenter med tilpasninger
- Del dine erfaringer med communityet

---

**Navigation**
- **Forrige lektion**: [Studieguide](../resources/study-guide.md)
- **Tilbage til**: [Hoved-README](../README.md)

---

**Ansvarsfraskrivelse**:  
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der måtte opstå som følge af brugen af denne oversættelse.