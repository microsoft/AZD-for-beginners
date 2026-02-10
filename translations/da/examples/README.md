# Eksempler - Praktiske AZD-skabeloner og konfigurationer

**Læring ved eksempler - organiseret efter kapitel**
- **📚 Kursusforside**: [AZD for begyndere](../README.md)
- **📖 Kapiteloversigt**: Eksempler organiseret efter læringskompleksitet
- **🚀 Lokalt eksempel**: [Retail Multi-Agent-løsning](retail-scenario.md)
- **🤖 Eksterne AI-eksempler**: Links til Azure Samples-repositorier

> **📍 VIGTIGT: Lokale vs. eksterne eksempler**  
> Dette repository indeholder **4 komplette lokale eksempler** med fulde implementeringer:  
> - **Azure OpenAI Chat** (GPT-4-implementering med chatgrænseflade)  
> - **Container Apps** (Simpel Flask-API + mikroservices)  
> - **Database-app** (Web + SQL-database)  
> - **Retail Multi-Agent** (virksomheds-AI-løsning)  
>  
> Yderligere eksempler er **eksterne henvisninger** til Azure-Samples-repositorier, som du kan klone.

## Introduktion

Dette bibliotek indeholder praktiske eksempler og referencer til at hjælpe dig med at lære Azure Developer CLI gennem praktisk øvelse. Retail Multi-Agent-scenariet er en komplet, produktionsklar implementering inkluderet i dette repository. Yderligere eksempler refererer til officielle Azure Samples, som demonstrerer forskellige AZD-mønstre.

### Kompleksitetsvurdering - forklaring

- ⭐ **Begynder** - Grundlæggende koncepter, enkelt tjeneste, 15-30 minutter
- ⭐⭐ **Mellem** - Flere tjenester, databaseintegration, 30-60 minutter
- ⭐⭐⭐ **Avanceret** - Kompleks arkitektur, AI-integration, 1-2 timer
- ⭐⭐⭐⭐ **Ekspert** - Produktionsklar, virksomhedsstandarder, 2+ timer

## 🎯 Hvad der faktisk er i dette repository

### ✅ Lokal implementering (klar til brug)

#### [Azure OpenAI Chat-applikation](azure-openai-chat/README.md) 🆕
**Komplet GPT-4-implementering med chatgrænseflade inkluderet i dette repository**

- **Placering:** `examples/azure-openai-chat/`
- **Kompleksitet:** ⭐⭐ (Mellem)
- **Hvad er inkluderet:**
  - Komplet Azure OpenAI-implementering (GPT-4)
  - Python kommandolinje-chatgrænseflade
  - Key Vault-integration for sikre API-nøgler
  - Bicep infrastruktur-skabeloner
  - Tokenforbrug og omkostningssporing
  - Ratebegrænsning og fejlhåndtering

**Hurtig start:**
```bash
# Naviger til eksemplet
cd examples/azure-openai-chat

# Udrul alt
azd up

# Installer afhængigheder og begynd at chatte
pip install -r src/requirements.txt
python src/chat.py
```

**Teknologier:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Container App-eksempler](container-app/README.md) 🆕
**Omfattende containerimplementeringseksempler inkluderet i dette repository**

- **Placering:** `examples/container-app/`
- **Kompleksitet:** ⭐-⭐⭐⭐⭐ (Begynder til Avanceret)
- **Hvad er inkluderet:**
  - [Masterguide](container-app/README.md) - Komplet oversigt over containerimplementeringer
  - [Simpelt Flask-API](../../../examples/container-app/simple-flask-api) - Grundlæggende REST API-eksempel
  - [Microservices-arkitektur](../../../examples/container-app/microservices) - Produktionsklar multi-service implementering
  - Hurtig start, produktions- og avancerede mønstre
  - Overvågning, sikkerhed og omkostningsoptimering

**Hurtig start:**
```bash
# Se hovedvejledning
cd examples/container-app

# Udrul et simpelt Flask-API
cd simple-flask-api
azd up

# Udrul et eksempel på mikrotjenester
cd ../microservices
azd up
```

**Teknologier:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent-løsning](retail-scenario.md) 🆕
**Komplet produktionsklar implementering inkluderet i dette repository**

- **Placering:** `examples/retail-multiagent-arm-template/`
- **Kompleksitet:** ⭐⭐⭐⭐ (Avanceret)
- **Hvad er inkluderet:**
  - Komplet ARM-implementeringsskabelon
  - Multi-agent-arkitektur (Kunde + Lager)
  - Azure OpenAI-integration
  - AI Search med RAG
  - Omfattende overvågning
  - Et-klik-implementeringsscript

**Hurtig start:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Teknologier:** Azure OpenAI, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Eksterne Azure Samples (klon for at bruge)

Følgende eksempler vedligeholdes i officielle Azure-Samples-repositorier. Klon dem for at udforske forskellige AZD-mønstre:

### Enkle applikationer (Kapitel 1-2)

| Skabelon | Repository | Kompleksitet | Tjenester |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Lokal: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Lokal: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-service, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Sådan bruger du:**
```bash
# Klon et hvilket som helst eksempel
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Udrul
azd up
```

### AI-applikationseksempler (Kapitel 2, 5, 8)

| Skabelon | Repository | Kompleksitet | Fokus |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI Chat** | [Lokal: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | GPT-4-implementering |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Grundlæggende AI-chat |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agent-rammeværk |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG-mønster |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Virksomheds-AI |

### Database- og avancerede mønstre (Kapitel 3-8)

| Skabelon | Repository | Kompleksitet | Fokus |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Databaseintegration |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverløs |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-service |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Læringsmål

Ved at arbejde dig igennem disse eksempler vil du:
- Øve Azure Developer CLI-arbejdsgange med realistiske applikationsscenarier
- Forstå forskellige applikationsarkitekturer og deres azd-implementeringer
- Beherske Infrastructure as Code-mønstre for forskellige Azure-tjenester
- Anvende konfigurationsstyring og miljøspecifikke deploy-strategier
- Implementere overvågnings-, sikkerheds- og skaleringsmønstre i praktiske sammenhænge
- Opbygge erfaring med fejlsøgning og debugging af reelle implementeringsscenarier

## Læringsudbytte

Efter at have gennemført disse eksempler vil du være i stand til at:
- Udrulle forskellige applikationstyper med Azure Developer CLI
- Tilpasse de leverede skabeloner til dine egne applikationskrav
- Designe og implementere tilpassede infrastruktur-mønstre ved hjælp af Bicep
- Konfigurere komplekse multi-service-applikationer med korrekte afhængigheder
- Anvende bedste praksis for sikkerhed, overvågning og ydeevne i reelle scenarier
- Fejlsøge og optimere deployment baseret på praktisk erfaring

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

> **💡 Ny til AZD?** Start med eksempel #1 (Flask API) - det tager ~20 minutter og lærer dig kernekoncepter.

### For begyndere
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Local) ⭐  
   Udrul en simpel REST-API med skaler-til-nul  
   **Tid:** 20-25 minutter | **Omkostning:** $0-5/måned  
   **Du vil lære:** Grundlæggende azd-arbejdsgang, containerisering, sundhedskontroller  
   **Forventet resultat:** Arbejdende API-endpoint, der returnerer "Hello, World!" med overvågning

2. **[Simpel webapp - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Udrul en Node.js Express-webapplikation med MongoDB  
   **Tid:** 25-35 minutter | **Omkostning:** $10-30/måned  
   **Du vil lære:** Databaseintegration, miljøvariabler, forbindelsesstrenge  
   **Forventet resultat:** Todo-liste-app med opret/læs/opdater/slet-funktionalitet

3. **[Statisk websted - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Host et React statisk websted med Azure Static Web Apps  
   **Tid:** 20-30 minutter | **Omkostning:** $0-10/måned  
   **Du vil lære:** Statisk hosting, serverløse funktioner, CDN-implementering  
   **Forventet resultat:** React-brugerflade med API-backend, automatisk SSL, global CDN

### For øvede brugere
4. **[Azure OpenAI Chat-applikation](../../../examples/azure-openai-chat)** (Local) ⭐⭐  
   Udrul GPT-4 med chatgrænseflade og sikker API-nøglehåndtering  
   **Tid:** 35-45 minutter | **Omkostning:** $50-200/måned  
   **Du vil lære:** Azure OpenAI-implementering, Key Vault-integration, token-sporing  
   **Forventet resultat:** Fungerende chatapplikation med GPT-4 og omkostningsovervågning

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Local) ⭐⭐⭐⭐  
   Produktionsklar multi-service-arkitektur  
   **Tid:** 45-60 minutter | **Omkostning:** $50-150/måned  
   **Du vil lære:** Tjenestekommunikation, beskedkøning, distribueret tracing  
   **Forventet resultat:** 2-tjenestersystem (API Gateway + Product Service) med overvågning

6. **[Database-app - C# med Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Webapplikation med C# API og Azure SQL Database  
   **Tid:** 30-45 minutter | **Omkostning:** $20-80/måned  
   **Du vil lære:** Entity Framework, database-migrationer, sikker forbindelse  
   **Forventet resultat:** C# API med Azure SQL-backend, automatisk skemadeployment

7. **[Serverløs funktion - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions med HTTP-triggers og Cosmos DB  
   **Tid:** 30-40 minutter | **Omkostning:** $10-40/måned  
   **Du vil lære:** Begivenhedsdrevet arkitektur, serverløs skalering, NoSQL-integration  
   **Forventet resultat:** Funktionsapp, der svarer på HTTP-anmodninger med Cosmos DB-lagring

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Multi-service Java-applikation med Container Apps og API-gateway  
   **Tid:** 60-90 minutter | **Omkostning:** $80-200/måned  
   **Du vil lære:** Spring Boot-implementering, service mesh, load balancing  
   **Forventet resultat:** Multi-service Java-system med tjenesteopdagelse og routing

### Microsoft Foundry-skabeloner

1. **[Azure OpenAI Chat-app - lokalt eksempel](../../../examples/azure-openai-chat)** ⭐⭐  
   Komplet GPT-4-implementering med chatgrænseflade  
   **Tid:** 35-45 minutter | **Omkostning:** $50-200/måned  
   **Forventet resultat:** Fungerende chatapplikation med token-sporing og omkostningsovervågning

2. **[Azure Search + OpenAI-demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Intelligent chatapplikation med RAG-arkitektur  
   **Tid:** 60-90 minutter | **Omkostning:** $100-300/måned  
   **Forventet resultat:** RAG-drevet chatgrænseflade med dokumentsøgning og kildehenvisninger

3. **[AI Dokumentbehandling](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Dokumentanalyse ved hjælp af Azure AI-tjenester  
   **Tid:** 40-60 minutter | **Omkostning:** $20-80/måned  
   **Forventet resultat:** API, der udtrækker tekst, tabeller og entiteter fra uploadede dokumenter

4. **[Maskinlæringspipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps-arbejdsgang med Azure Machine Learning  
   **Tid:** 2-3 timer | **Omkostning:** $150-500/måned  
   **Forventet resultat:** Automatiseret ML-pipeline med træning, deployment og overvågning

### Virkelige scenarier

#### **Retail Multi-Agent-løsning** 🆕
**[Komplet implementeringsvejledning](./retail-scenario.md)**

En omfattende, produktionsklar multi-agent kundesupportløsning, der demonstrerer virksomhedsniveau AI-applikationsimplementering med AZD. Dette scenarie giver:

- **Komplet arkitektur**: Multi-agent-system med specialiserede kundeservice- og lagerstyringsagenter
- **Produktionsinfrastruktur**: multipregion Azure OpenAI-implementeringer, AI Search, Container Apps og omfattende overvågning
- **Klar-til-implementering ARM-skabelon**: Én-klik-implementering med flere konfigurationsindstillinger (Minimal/Standard/Premium)
- **Avancerede funktioner**: red teaming-sikkerhedsvalidering, agent-evalueringsramme, omkostningsoptimering og fejlsøgningsvejledninger
- **Reel forretningskontekst**: kundesupport-tilfælde for detailhandlere med filuploads, søgeintegration og dynamisk skalering

**Teknologier**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Kompleksitet**: ⭐⭐⭐⭐ (Avanceret - Klar til enterprise-produktion)

**Perfekt til**: AI-udviklere, løsningsarkitekter og teams, der bygger produktions-multi-agent-systemer

**Hurtig start**: Implementér den komplette løsning på under 30 minutter ved hjælp af den medfølgende ARM-skabelon med `./deploy.sh -g myResourceGroup`

## 📋 Brugsanvisning

### Forudsætninger

Før du kører noget eksempel:
- ✅ Azure-abonnement med rollen Owner eller Contributor
- ✅ Azure Developer CLI installeret ([Installationsvejledning](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop kørende (til container-eksempler)
- ✅ Passende Azure-kvoter (tjek eksempel-specifikke krav)

> **💰 Omkostningsadvarsel:** Alle eksempler opretter rigtige Azure-ressourcer, som medfører omkostninger. Se de enkelte README-filer for prisoverslag. Husk at køre `azd down` når du er færdig for at undgå løbende omkostninger.

### Kørsel af eksempler lokalt

1. **Klon eller kopier eksempel**
   ```bash
   # Naviger til det ønskede eksempel
   cd examples/simple-web-app
   ```

2. **Initialiser AZD-miljøet**
   ```bash
   # Initialiser med eksisterende skabelon
   azd init
   
   # Eller opret nyt miljø
   azd env new my-environment
   ```

3. **Konfigurer miljøet**
   ```bash
   # Angiv de nødvendige variabler
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Implementér**
   ```bash
   # Udrul infrastruktur og applikation
   azd up
   ```

5. **Bekræft implementeringen**
   ```bash
   # Get service endpoints
   azd env get-values
   
   # Test the endpoint (example)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Forventede succesindikatorer:**
   - ✅ `azd up` fuldføres uden fejl
   - ✅ Service-endpoint returnerer HTTP 200
   - ✅ Azure-portalen viser status "Running"
   - ✅ Application Insights modtager telemetri

> **⚠️ Problemer?** Se [Almindelige problemer](../docs/chapter-07-troubleshooting/common-issues.md) til fejlsøgning af implementering

### Tilpasning af eksempler

Hvert eksempel indeholder:
- **README.md** - Detaljerede opsætnings- og tilpasningsinstruktioner
- **azure.yaml** - AZD-konfiguration med kommentarer
- **infra/** - Bicep-skabeloner med parameterforklaringer
- **src/** - Eksempelkildekode til applikation
- **scripts/** - Hjælpescripts til almindelige opgaver

## 🎯 Læringsmål

### Eksempelkategorier

#### **Grundlæggende implementeringer**
- Enkelt-service-applikationer
- Enkle infrastrukturmønstre
- Grundlæggende konfigurationsstyring
- Omkostningseffektive udviklingsopsætninger

#### **Avancerede scenarier**
- Multiservice-arkitekturer
- Komplekse netværkskonfigurationer
- Databasintegrationsmønstre
- Sikkerheds- og compliance-implementeringer

#### **Produktionsklare mønstre**
- Konfigurationer for høj tilgængelighed
- Overvågning og observabilitet
- CI/CD-integration
- Opsætninger til katastrofegendannelse

## 📖 Eksempelbeskrivelser

### Simpel webapp - Node.js Express
**Teknologier**: Node.js, Express, MongoDB, Container Apps  
**Kompleksitet**: Begynder  
**Koncepter**: Grundlæggende implementering, REST API, NoSQL-databaseintegration

### Statisk hjemmeside - React SPA
**Teknologier**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Kompleksitet**: Begynder  
**Koncepter**: Statisk hosting, serverløs backend, moderne webudvikling

### Container-app - Python Flask
**Teknologier**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Kompleksitet**: Begynder  
**Koncepter**: Containerisering, REST API, scale-to-zero, health probes, overvågning  
**Placering**: [Lokalt eksempel](../../../examples/container-app/simple-flask-api)

### Container-app - Mikroservices-arkitektur
**Teknologier**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Kompleksitet**: Avanceret  
**Koncepter**: Multiservice-arkitektur, servicekommunikation, message queuing, distribueret tracing  
**Placering**: [Lokalt eksempel](../../../examples/container-app/microservices)

### Database-app - C# med Azure SQL
**Teknologier**: C# ASP.NET Core, Azure SQL Database, App Service  
**Kompleksitet**: Mellemniveau  
**Koncepter**: Entity Framework, databaseforbindelser, web API-udvikling

### Serverløs funktion - Python Azure Functions
**Teknologier**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Kompleksitet**: Mellemniveau  
**Koncepter**: Hændelsesdrevet arkitektur, serverløs computing, full-stack udvikling

### Mikroservices - Java Spring Boot
**Teknologier**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Kompleksitet**: Mellemniveau  
**Koncepter**: Mikroservices-kommunikation, distribuerede systemer, enterprise-mønstre

### Microsoft Foundry-eksempler

#### Azure OpenAI Chat-app
**Teknologier**: Azure OpenAI, Cognitive Search, App Service  
**Kompleksitet**: Mellemniveau  
**Koncepter**: RAG-arkitektur, vektorsøgning, LLM-integration

#### AI-dokumentbehandling
**Teknologier**: Azure AI Document Intelligence, Storage, Functions  
**Kompleksitet**: Mellemniveau  
**Koncepter**: Dokumentanalyse, OCR, dataudtræk

#### Maskinlæringspipeline
**Teknologier**: Azure ML, MLOps, Container Registry  
**Kompleksitet**: Avanceret  
**Koncepter**: Modeltræning, implementeringspipelines, overvågning

## 🛠 Konfigurationseksempler

Mappen `configurations/` indeholder genanvendelige komponenter:

### Miljøkonfigurationer
- Udviklingsmiljøindstillinger
- Staging-miljøkonfigurationer
- Produktionsklare konfigurationer
- Opsætninger til multiregional implementering

### Bicep-moduler
- Genanvendelige infrastrukturkomponenter
- Almindelige ressource-mønstre
- Sikkerhedshærdede skabeloner
- Omkostningsoptimerede konfigurationer

### Hjælpescripts
- Automatisering af miljøopsætning
- Database-migrationsscripts
- Værktøjer til validering af implementering
- Værktøjer til omkostningsovervågning

## 🔧 Tilpasningsguide

### Tilpas eksempler til dit brugstilfælde

1. **Gennemgå forudsætninger**
   - Kontrollér Azure-tjenestekravene
   - Bekræft abonnementsgrænser
   - Forstå omkostningsimplikationerne

2. **Rediger konfiguration**
   - Opdater service-definitionerne i `azure.yaml`
   - Tilpas Bicep-skabelonerne
   - Justér miljøvariablerne

3. **Test grundigt**
   - Implementér først til udviklingsmiljøet
   - Valider funktionaliteten
   - Test skalering og ydeevne

4. **Sikkerhedsgennemgang**
   - Gennemgå adgangskontroller
   - Implementér håndtering af hemmeligheder
   - Aktivér overvågning og alarmering

## 📊 Sammenligningstabel

| Eksempel | Tjenester | Database | Godkendelse | Overvågning | Kompleksitet |
|---------|----------|----------|------|------------|------------|
| **Azure OpenAI Chat** (Lokalt) | 2 | ❌ | Key Vault | Fuld | ⭐⭐ |
| **Python Flask API** (Lokalt) | 1 | ❌ | Basal | Fuld | ⭐ |
| **Microservices** (Lokalt) | 5+ | ✅ | Enterprise | Avanceret | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Basal | Basal | ⭐ |
| React SPA + Functions | 3 | ✅ | Basal | Fuld | ⭐ |
| Python Flask Container | 2 | ❌ | Basal | Fuld | ⭐ |
| C# Web API + SQL | 2 | ✅ | Fuld | Fuld | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Fuld | Fuld | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Fuld | Fuld | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Fuld | Fuld | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Basal | Fuld | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Fuld | Fuld | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Lokalt) | **8+** | **✅** | **Enterprise** | **Avanceret** | **⭐⭐⭐⭐** |

## 🎓 Læringssti

### Anbefalet rækkefølge

1. **Start med simpel webapp**
   - Lær grundlæggende AZD-koncepter
   - Forstå implementeringsworkflow
   - Øv dig i miljøstyring

2. **Prøv en statisk hjemmeside**
   - Undersøg forskellige hostingmuligheder
   - Lær om CDN-integration
   - Forstå DNS-konfiguration

3. **Gå videre til container-app**
   - Lær containeriseringsgrundlag
   - Forstå skaleringskoncepter
   - Øv dig med Docker

4. **Tilføj databaseintegration**
   - Lær databaseprovisionering
   - Forstå forbindelsesstrenge
   - Øv dig i håndtering af hemmeligheder

5. **Udforsk serverløst**
   - Forstå hændelsesdrevet arkitektur
   - Lær om triggers og bindings
   - Øv dig med API'er

6. **Byg mikroservices**
   - Lær servicekommunikation
   - Forstå distribuerede systemer
   - Øv dig i komplekse implementeringer

## 🔍 Find det rigtige eksempel

### Efter teknologistak
- **Container Apps**: [Python Flask API (Lokalt)](../../../examples/container-app/simple-flask-api), [Microservices (Lokalt)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Lokalt)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Lokalt)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Lokalt)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Lokalt)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Go**: [Microservices User Service (Lokalt)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Lokalt)](../../../examples/container-app/simple-flask-api), [Microservices (Lokalt)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (Lokalt)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Azure OpenAI Chat (Lokalt)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent-løsning**
- **Multi-agent-systemer**: **Retail Multi-Agent-løsning**
- **OpenAI-integration**: **[Azure OpenAI Chat (Lokalt)](../../../examples/azure-openai-chat)**, Retail Multi-Agent-løsning
- **Enterprise-produktion**: [Microservices (Lokalt)](../../../examples/container-app/microservices), **Retail Multi-Agent-løsning**

### Efter arkitekturmønster
- **Simple REST API**: [Python Flask API (Lokalt)](../../../examples/container-app/simple-flask-api)
- **Monolitisk**: Node.js Express Todo, C# Web API + SQL
- **Statisk + Serverløs**: React SPA + Functions, Python Functions + SPA
- **Mikroservices**: [Production Microservices (Lokalt)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containeriseret**: [Python Flask (Lokalt)](../../../examples/container-app/simple-flask-api), [Microservices (Lokalt)](../../../examples/container-app/microservices)
- **AI-drevet**: **[Azure OpenAI Chat (Lokalt)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent-løsning**
- **Multi-agent-arkitektur**: **Retail Multi-Agent-løsning**
- **Enterprise multi-service**: [Microservices (Lokalt)](../../../examples/container-app/microservices), **Retail Multi-Agent-løsning**

### Efter kompleksitetsniveau
- **Begynder**: [Python Flask API (Lokalt)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Mellemniveau**: **[Azure OpenAI Chat (Lokalt)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Avanceret**: ML Pipeline
- **Klar til enterprise-produktion**: [Microservices (Lokalt)](../../../examples/container-app/microservices) (Multi-service med message queuing), **Retail Multi-Agent-løsning** (Komplet multi-agent-system med ARM-skabelon-implementering)

## 📚 Yderligere ressourcer

### Dokumentationslinks
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Fællesskabseksempler
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo-app med Node.js og PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React-webapp med C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps-job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions med Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Bedste praksis
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Bidragseksempler

Har du et nyttigt eksempel at dele? Vi tager imod bidrag!

### Retningslinjer for indsendelse
1. Følg den etablerede mappestruktur
2. Inkluder en fyldestgørende README.md
3. Tilføj kommentarer til konfigurationsfiler
4. Test grundigt inden indsendelse
5. Inkluder omkostningsoverslag og forudsætninger

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

**Pro Tip**: Start med det simpleste eksempel, der passer til din teknologistak, og arbejd dig derefter gradvist op til mere komplekse scenarier. Hvert eksempel bygger videre på koncepter fra de foregående!

## 🚀 Klar til at komme i gang?

### Din læringsvej

1. **Komplet begynder?** → Start med [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 min)
2. **Har grundlæggende AZD-viden?** → Prøv [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 min)
3. **Bygger du AI-apps?** → Start med [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 min) eller udforsk [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ timer)
4. **Har du brug for en specifik teknologistak?** → Brug sektionen [Find det rigtige eksempel](../../../examples) ovenfor

### Næste skridt

- ✅ Gennemgå [Forudsætninger](../../../examples) ovenfor
- ✅ Vælg et eksempel, der matcher dit færdighedsniveau (se [Kompleksitetsforklaring](../../../examples))
- ✅ Læs eksemplets README grundigt inden udrulning
- ✅ Sæt en påmindelse om at køre `azd down` efter test
- ✅ Del din oplevelse via GitHub Issues eller Discussions

### Brug for hjælp?

- 📖 [FAQ](../resources/faq.md) - Almindelige spørgsmål besvaret
- 🐛 [Troubleshooting Guide](../docs/chapter-07-troubleshooting/common-issues.md) - Ret udrulningsproblemer
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Spørg fællesskabet
- 📚 [Study Guide](../resources/study-guide.md) - Styrk din læring

---

**Navigation**
- **📚 Kursusforside**: [AZD For Beginners](../README.md)
- **📖 Studiemateriale**: [Study Guide](../resources/study-guide.md) | [Cheat Sheet](../resources/cheat-sheet.md) | [Glossary](../resources/glossary.md)
- **🔧 Ressourcer**: [FAQ](../resources/faq.md) | [Fejlfinding](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Sidst opdateret: November 2025 | [Rapporter problemer](https://github.com/microsoft/AZD-for-beginners/issues) | [Bidrag med eksempler](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Ansvarsfraskrivelse:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten Co-op Translator (https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiske oversættelser kan indeholde fejl eller unøjagtigheder. Det oprindelige dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der måtte opstå som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->