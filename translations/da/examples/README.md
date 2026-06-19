# Eksempler - Praktiske AZD-skabeloner og konfigurationer

**Læring ved eksempel - organiseret efter kapitel**
- **📚 Kursusforside**: [AZD for begyndere](../README.md)
- **📖 Kapiteloversigt**: Eksempler organiseret efter læringskompleksitet
- **🚀 Lokalt eksempel**: [Retail Multi-Agent-løsning](retail-scenario.md)
- **🤖 Eksterne AI-eksempler**: Links til Azure-Samples-repositories

> **📍 VIGTIGT: Lokale vs eksterne eksempler**  
> Dette repository indeholder **4 komplette lokale eksempler** med fulde implementeringer:  
> - **Microsoft Foundry Models Chat** (gpt-4.1-udrulning med chatgrænseflade)  
> - **Container Apps** (simpel Flask API + mikrotjenester)  
> - **Database App** (Web + SQL-database)  
> - **Retail Multi-Agent** (Enterprise AI-løsning)  
>  
> Yderligere eksempler er **eksterne referencer** til Azure-Samples repositories, som du kan klone.

## Introduktion

Denne mappe indeholder praktiske eksempler og referencer, der hjælper dig med at lære Azure Developer CLI gennem praktisk øvelse. Retail Multi-Agent-scenariet er en komplet, produktionsklar implementering inkluderet i dette repository. Yderligere eksempler refererer til officielle Azure Samples, der demonstrerer forskellige AZD-mønstre.

### Kompleksitetsvurdering

- ⭐ **Begynder** - Grundlæggende koncepter, enkelt tjeneste, 15-30 minutter
- ⭐⭐ **Mellem** - Flere tjenester, databaseintegration, 30-60 minutter
- ⭐⭐⭐ **Avanceret** - Kompleks arkitektur, AI-integration, 1-2 timer
- ⭐⭐⭐⭐ **Ekspert** - Produktionsklar, enterprise-mønstre, 2+ timer

## 🎯 Hvad dette repository faktisk indeholder

### ✅ Lokal implementering (Klar til brug)

#### [Microsoft Foundry Models Chat-applikation](azure-openai-chat/README.md) 🆕
**Komplet gpt-4.1-udrulning med chatgrænseflade inkluderet i dette repo**

- **Placering:** `examples/azure-openai-chat/`
- **Kompleksitet:** ⭐⭐ (Mellem)
- **Hvad er inkluderet:**
  - Komplet Microsoft Foundry Models-udrulning (gpt-4.1)
  - Python kommandolinje-chatgrænseflade
  - Key Vault-integration for sikre API-nøgler
  - Bicep-infrastruktursskabeloner
  - Tokenbrug og omkostningssporing
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

**Teknologier:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Container App-eksempler](container-app/README.md) 🆕
**Omfattende container-udrulningseksempler inkluderet i dette repo**

- **Placering:** `examples/container-app/`
- **Kompleksitet:** ⭐-⭐⭐⭐⭐ (Begynder til Avanceret)
- **Hvad er inkluderet:**
  - [Hovedguide](container-app/README.md) - Fuld oversigt over container-udrulninger
  - [Simpel Flask API](../../../examples/container-app/simple-flask-api) - Grundlæggende REST API-eksempel
  - [Mikrotjenestearkitektur](../../../examples/container-app/microservices) - Produktionsklar multi-tjenesteudrulning
  - Hurtigstart-, produktions- og avancerede mønstre
  - Overvågning, sikkerhed og omkostningsoptimering

**Hurtig start:**
```bash
# Se mastervejledning
cd examples/container-app

# Udrul en simpel Flask-API
cd simple-flask-api
azd up

# Udrul et eksempel på mikroservices
cd ../microservices
azd up
```

**Teknologier:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent-løsning](retail-scenario.md) 🆕
**Komplet produktionsklar implementering inkluderet i dette repo**

- **Placering:** `examples/retail-multiagent-arm-template/`
- **Kompleksitet:** ⭐⭐⭐⭐ (Avanceret)
- **Hvad er inkluderet:**
  - Komplet ARM-udrulningsskabelon
  - Multi-agent-arkitektur (Kunde + Lager)
  - Microsoft Foundry Models-integration
  - AI Search med RAG
  - Omfattende overvågning
  - Én-klik udrulningsscript

**Hurtig start:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Teknologier:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Eksterne Azure Samples (Klon for at bruge)

Følgende eksempler vedligeholdes i officielle Azure-Samples-repositories. Klon dem for at udforske forskellige AZD-mønstre:

### Enkle applikationer (Kapitel 1-2)

| Skabelon | Repository | Kompleksitet | Tjenester |
|:---------|:-----------|:-----------:|:---------|
| **Python Flask API** | [Lokal: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Lokal: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Flere tjenester, Service Bus, Cosmos DB, SQL |
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
|:---------|:-----------|:-----------:|:------|
| **Microsoft Foundry Models Chat** | [Lokal: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1-udrulning |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Grundlæggende AI-chat |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agent-rammeværk |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG-mønster |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Enterprise AI |

### Database- og avancerede mønstre (Kapitel 3-8)

| Skabelon | Repository | Kompleksitet | Fokus |
|:---------|:-----------|:-----------:|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Databaseintegration |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverløs |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Flere tjenester |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Læringsmål

Ved at arbejde dig igennem disse eksempler vil du:
- Øve Azure Developer CLI-workflows med realistiske applikationsscenarier
- Forstå forskellige applikationsarkitekturer og deres azd-implementeringer
- Mestre Infrastructure as Code-mønstre for forskellige Azure-tjenester
- Anvende konfigurationsstyring og miljøspecifikke udrulningsstrategier
- Implementere overvågning, sikkerhed og skalering i praktiske sammenhænge
- Opbygge erfaring med fejlfinding og debugging af reelle udrulningsscenarier

## Læringsudbytte

Efter at have gennemført disse eksempler vil du være i stand til at:
- Udrulle forskellige applikationstyper ved hjælp af Azure Developer CLI med selvtillid
- Tilpasse de leverede skabeloner til dine egne applikationskrav
- Designe og implementere brugerdefinerede infrastruktur-mønstre ved hjælp af Bicep
- Konfigurere komplekse multi-tjenesteapplikationer med korrekte afhængigheder
- Anvende sikkerheds-, overvågnings- og ydelsesbest practices i reelle scenarier
- Fejlfinde og optimere udrulninger baseret på praktisk erfaring

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

> **💡 Ny til AZD?** Start med eksempel #1 (Flask API) - det tager ~20 minutter og lærer kernekoncepter.

### For begyndere
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Lokal) ⭐  
   Udrul en simpel REST API med scale-to-zero  
   **Tid:** 20-25 minutter | **Omkostning:** $0-5/måned  
   **Du vil lære:** Grundlæggende azd-workflow, containerisering, health probes  
   **Forventet resultat:** Arbejdende API-endpoint, der returnerer "Hello, World!" med overvågning

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Udrul en Node.js Express-webapplikation med MongoDB  
   **Tid:** 25-35 minutter | **Omkostning:** $10-30/måned  
   **Du vil lære:** Databaseintegration, miljøvariabler, connection strings  
   **Forventet resultat:** Todo-liste-app med opret/læs/opdater/slet-funktionalitet

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Host en React-statik hjemmeside med Azure Static Web Apps  
   **Tid:** 20-30 minutter | **Omkostning:** $0-10/måned  
   **Du vil lære:** Statisk hosting, serverless-funktioner, CDN-udrulning  
   **Forventet resultat:** React UI med API-backend, automatisk SSL, global CDN

### For mellemniveaubrugere
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (Lokal) ⭐⭐  
   Udrul gpt-4.1 med chatgrænseflade og sikker API-nøglehåndtering  
   **Tid:** 35-45 minutter | **Omkostning:** $50-200/måned  
   **Du vil lære:** Microsoft Foundry Models-udrulning, Key Vault-integration, token-sporing  
   **Forventet resultat:** Arbejdende chatapplikation med gpt-4.1 og omkostningsovervågning

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Lokal) ⭐⭐⭐⭐  
   Produktionsklar multi-tjenestearkitektur  
   **Tid:** 45-60 minutter | **Omkostning:** $50-150/måned  
   **Du vil lære:** Tjenestekommunikation, message queuing, distribueret tracing  
   **Forventet resultat:** 2-tjenesters system (API Gateway + Produktservice) med overvågning

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Webapplikation med C# API og Azure SQL Database  
   **Tid:** 30-45 minutter | **Omkostning:** $20-80/måned  
   **Du vil lære:** Entity Framework, database-migrationer, forbindelsessikkerhed  
   **Forventet resultat:** C# API med Azure SQL-backend, automatisk schema-udrulning

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions med HTTP-triggers og Cosmos DB  
   **Tid:** 30-40 minutter | **Omkostning:** $10-40/måned  
   **Du vil lære:** Event-drevet arkitektur, serverless-skalering, NoSQL-integration  
   **Forventet resultat:** Funktionsapp, der reagerer på HTTP-forespørgsler med Cosmos DB-lagring

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Multi-tjeneste Java-applikation med Container Apps og API-gateway  
   **Tid:** 60-90 minutter | **Omkostning:** $80-200/måned  
   **Du vil lære:** Spring Boot-udrulning, service mesh, load balancing  
   **Forventet resultat:** Multi-tjeneste Java-system med service discovery og routing

### Microsoft Foundry-skabeloner

1. **[Microsoft Foundry Models Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   Komplet gpt-4.1-udrulning med chatgrænseflade  
   **Tid:** 35-45 minutter | **Omkostning:** $50-200/måned  
   **Forventet resultat:** Arbejdende chatapplikation med token-sporing og omkostningsovervågning

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Intelligent chatapplikation med RAG-arkitektur  
   **Tid:** 60-90 minutter | **Omkostning:** $100-300/måned  
   **Forventet resultat:** RAG-drevet chatgrænseflade med dokumentsøgning og citater

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Dokumentanalyse ved brug af Azure AI-tjenester  
   **Tid:** 40-60 minutter | **Omkostning:** $20-80/måned  
   **Forventet resultat:** API, der udtrækker tekst, tabeller og entiteter fra uploadede dokumenter

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps-workflow med Azure Machine Learning  
   **Tid:** 2-3 timer | **Omkostning:** $150-500/måned  
   **Forventet resultat:** Automatisk ML-pipeline med træning, udrulning og overvågning

### Virkelige scenarier

#### **Retail Multi-Agent Solution** 🆕
**[Complete Implementation Guide](./retail-scenario.md)**

En omfattende, produktionsklar multi-agent kundesupportløsning, der demonstrerer enterprise-grade AI-applikationsudrulning med AZD. Dette scenarie tilbyder:

- **Komplet arkitektur**: Multi-agent system med specialiserede kundeservice- og lagerstyringsagenter
- **Produktionsinfrastruktur**: Multi-region Microsoft Foundry Models-implementeringer, AI Search, Container Apps og omfattende overvågning
- **Klar-til-udrulning ARM-skabelon**: Én-klik-udrulning med flere konfigurationsformer (Minimal/Standard/Premium)
- **Avancerede funktioner**: Red teaming sikkerhedsvalidering, agent evalueringsramme, omkostningsoptimering og fejlfinding guides
- **Ægte forretningskontekst**: Use case for kundesupport i detailhandlen med filupload, søgeintegration og dynamisk skalering

**Teknologier**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Kompleksitet**: ⭐⭐⭐⭐ (Avanceret - Produktionsklar til enterprise)

**Perfekt til**: AI-udviklere, løsningsarkitekter og teams, der bygger produktionsmulti-agent systemer

**Hurtig start**: Udrul den komplette løsning på under 30 minutter ved hjælp af den medfølgende ARM-skabelon med `./deploy.sh -g myResourceGroup`

## 📋 Brugervejledning

### Forudsætninger

Før du kører et eksempel:
- ✅ Azure-abonnement med Owner- eller Contributor-adgang
- ✅ Azure Developer CLI installeret ([Installationsvejledning](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop kørende (til container-eksempler)
- ✅ Passende Azure-kvoter (tjek krav for hvert eksempel)

> **💰 Omkostningsadvarsel:** Alle eksempler opretter rigtige Azure-ressourcer, som medfører omkostninger. Se de enkelte README-filer for omkostningsestimater. Husk at køre `azd down`, når du er færdig, for at undgå løbende omkostninger.

### Køre eksempler lokalt

1. **Clone eller kopier eksempel**
   ```bash
   # Naviger til det ønskede eksempel
   cd examples/simple-web-app
   ```

2. **Initialiser AZD-miljø**
   ```bash
   # Initialiser med eksisterende skabelon
   azd init
   
   # Eller opret et nyt miljø
   azd env new my-environment
   ```

3. **Konfigurer miljø**
   ```bash
   # Angiv nødvendige variabler
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Udrul**
   ```bash
   # Udrul infrastruktur og applikation
   azd up
   ```

5. **Verificer udrulning**
   ```bash
   # Hent tjenesteendepunkter
   azd env get-values
   
   # Test endepunktet (eksempel)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Forventede succesindikatorer:**
   - ✅ `azd up` fuldføres uden fejl
   - ✅ Service-endpoint returnerer HTTP 200
   - ✅ Azure-portalen viser "Running" status
   - ✅ Application Insights modtager telemetri

> **⚠️ Problemer?** Se [Almindelige problemer](../docs/chapter-07-troubleshooting/common-issues.md) for fejlfinding ved udrulning

### Tilpasning af eksempler

Hvert eksempel indeholder:
- **README.md** - Detaljerede opsætnings- og tilpasningsinstruktioner
- **azure.yaml** - AZD-konfiguration med kommentarer
- **infra/** - Bicep-skabeloner med parameterforklaringer
- **src/** - Eksempelkode
- **scripts/** - Hjælpescripts til almindelige opgaver

## 🎯 Læringsmål

### Eksempelkategorier

#### **Grundlæggende implementeringer**
- Enkelt-tjeneste applikationer
- Simple infrastrukturmønstre
- Grundlæggende konfigurationsstyring
- Omkostningseffektive udviklingsopsætninger

#### **Avancerede scenarier**
- Multi-tjeneste arkitekturer
- Komplekse netværkskonfigurationer
- Databaseintegrationsmønstre
- Sikkerheds- og compliance-implementeringer

#### **Produktionsklare mønstre**
- Konfigurationer for høj tilgængelighed
- Overvågning og observability
- CI/CD-integration
- Disaster recovery opsætninger

## 📖 Eksempelbeskrivelser

### Simpel webapp - Node.js Express
**Teknologier**: Node.js, Express, MongoDB, Container Apps  
**Kompleksitet**: Begynder  
**Koncepter**: Grundlæggende udrulning, REST API, NoSQL-databaseintegration

### Statisk websted - React SPA
**Teknologier**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Kompleksitet**: Begynder  
**Koncepter**: Statisk hosting, serverless backend, moderne webudvikling

### Container-app - Python Flask
**Teknologier**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Kompleksitet**: Begynder  
**Koncepter**: Containerisering, REST API, scale-to-zero, health probes, overvågning  
**Lokation**: [Lokalt eksempel](../../../examples/container-app/simple-flask-api)

### Container-app - Mikroservicearkitektur
**Teknologier**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Kompleksitet**: Avanceret  
**Koncepter**: Multi-tjeneste arkitektur, servicekommunikation, message queuing, distribueret tracing  
**Lokation**: [Lokalt eksempel](../../../examples/container-app/microservices)

### Databaseapp - C# med Azure SQL
**Teknologier**: C# ASP.NET Core, Azure SQL Database, App Service  
**Kompleksitet**: Mellem  
**Koncepter**: Entity Framework, databaseforbindelser, web API-udvikling

### Serverløs funktion - Python Azure Functions
**Teknologier**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Kompleksitet**: Mellem  
**Koncepter**: Event-drevet arkitektur, serverless computing, full-stack udvikling

### Mikrotjenester - Java Spring Boot
**Teknologier**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Kompleksitet**: Mellem  
**Koncepter**: Mikrotjenesterkommunikation, distribuerede systemer, enterprise-mønstre

### Microsoft Foundry-eksempler

#### Microsoft Foundry Models Chat App
**Teknologier**: Microsoft Foundry Models, Azure AI Search, App Service  
**Kompleksitet**: Mellem  
**Koncepter**: RAG-arkitektur, vektorsøgning, LLM-integration

#### AI-dokumentbehandling
**Teknologier**: Azure AI Document Intelligence, Storage, Functions  
**Kompleksitet**: Mellem  
**Koncepter**: Dokumentanalyse, OCR, dataudtræk

#### Maskinlæringspipeline
**Teknologier**: Azure ML, MLOps, Container Registry  
**Kompleksitet**: Avanceret  
**Koncepter**: Modeltræning, udrulningspipelines, overvågning

## 🛠 Konfigurations-eksempler

`configurations/`-mappen indeholder genbrugelige komponenter:

### Miljøkonfigurationer
- Udviklingsmiljøindstillinger
- Staging-miljøkonfigurationer
- Produktionsklare konfigurationer
- Multi-region udrulningsopsætninger

### Bicep-moduler
- Genbrugelige infrastrukturkomponenter
- Almindelige ressourcemønstre
- Sikkerhedshærdede skabeloner
- Omkostningsoptimerede konfigurationer

### Hjælpescripts
- Automatisering af miljøopsætning
- Database-migrationsscripts
- Værktøjer til validering af udrulning
- Værktøjer til omkostningsovervågning

## 🔧 Tilpasningsguide

### Tilpasning af eksempler til din brug

1. **Gennemgå forudsætninger**
   - Tjek Azure-servicekrav
   - Verificer abonnementgrænser
   - Forstå omkostningsimplikationer

2. **Ændr konfiguration**
   - Opdater `azure.yaml` service-definitioner
   - Tilpas Bicep-skabelonerne
   - Juster miljøvariabler

3. **Test grundigt**
   - Udrul først til udviklingsmiljø
   - Valider funktionalitet
   - Test skalering og ydeevne

4. **Sikkerhedsgennemgang**
   - Gennemgå adgangskontroller
   - Implementer secrets management
   - Aktivér overvågning og alarmere

## 📊 Sammenligningsmatrix

| Eksempel | Tjenester | Database | Auth | Overvågning | Kompleksitet |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (Lokal) | 2 | ❌ | Key Vault | Fuld | ⭐⭐ |
| **Python Flask API** (Lokal) | 1 | ❌ | Grundlæggende | Fuld | ⭐ |
| **Microservices** (Lokal) | 5+ | ✅ | Enterprise | Avanceret | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Grundlæggende | Grundlæggende | ⭐ |
| React SPA + Functions | 3 | ✅ | Grundlæggende | Fuld | ⭐ |
| Python Flask Container | 2 | ❌ | Grundlæggende | Fuld | ⭐ |
| C# Web API + SQL | 2 | ✅ | Fuld | Fuld | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Fuld | Fuld | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Fuld | Fuld | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | Fuld | Fuld | ⭐⭐⭐ |
| AI-dokumentbehandling | 2 | ❌ | Grundlæggende | Fuld | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Fuld | Fuld | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Lokal) | **8+** | **✅** | **Enterprise** | **Avanceret** | **⭐⭐⭐⭐** |

## 🎓 Læringssti

### Anbefalet progression

1. **Start med simpel webapp**
   - Lær grundlæggende AZD-koncepter
   - Forstå udrulningsworkflow
   - Øv miljøstyring

2. **Prøv statisk website**
   - Udforsk forskellige hostingmuligheder
   - Lær om CDN-integration
   - Forstå DNS-konfiguration

3. **Gå videre til Container App**
   - Lær containeriseringsgrundlæggende
   - Forstå skaleringskoncepter
   - Øv dig med Docker

4. **Tilføj databaseintegration**
   - Lær databaseprovisionering
   - Forstå connection strings
   - Øv secrets management

5. **Udforsk serverless**
   - Forstå event-drevet arkitektur
   - Lær om triggers og bindings
   - Øv med API'er

6. **Byg mikrotjenester**
   - Lær servicekommunikation
   - Forstå distribuerede systemer
   - Øv komplekse udrulninger

## 🔍 Find det rigtige eksempel

### Efter teknologistak
- **Container Apps**: [Python Flask API (Lokal)](../../../examples/container-app/simple-flask-api), [Microservices (Lokal)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Lokal)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Lokal)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Lokal)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Lokal)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Microservices User Service (Lokal)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Lokal)](../../../examples/container-app/simple-flask-api), [Microservices (Lokal)](../../../examples/container-app/microservices), Java Microservices
- **Databaser**: [Microservices (Lokal)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (Lokal)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI-dokumentbehandling, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Microsoft Foundry Models Chat (Lokal)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (Lokal)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Efter arkitekturmønster
- **Simple REST API**: [Python Flask API (Lokal)](../../../examples/container-app/simple-flask-api)
- **Monolitisk**: Node.js Express Todo, C# Web API + SQL
- **Statisk + Serverless**: React SPA + Functions, Python Functions + SPA
- **Mikrotjenester**: [Production Microservices (Lokal)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containeriseret**: [Python Flask (Lokal)](../../../examples/container-app/simple-flask-api), [Microservices (Lokal)](../../../examples/container-app/microservices)
- **AI-drevet**: **[Microsoft Foundry Models Chat (Lokal)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI-dokumentbehandling, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent-arkitektur**: **Retail Multi-Agent Solution**
- **Enterprise multi-service**: [Microservices (Lokal)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Efter kompleksitetsniveau
- **Begynder**: [Python Flask API (Lokal)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Mellem**: **[Microsoft Foundry Models Chat (Lokal)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI-dokumentbehandling
- **Avanceret**: ML Pipeline
- **Produktionsklar til enterprise**: [Microservices (Lokal)](../../../examples/container-app/microservices) (Multi-tjeneste med message queuing), **Retail Multi-Agent Solution** (Komplet multi-agent system med ARM-skabelonsudrulning)

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
- [Todo App with Node.js and PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React-webapp med C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps-job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions med Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Bedste praksis
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Bidrag med eksempler

Har du et nyttigt eksempel at dele? Vi byder bidrag velkommen!

### Retningslinjer for indsendelse
1. Følg den etablerede mappestruktur
2. Inkluder en omfattende README.md
3. Tilføj kommentarer til konfigurationsfiler
4. Test grundigt inden indsendelse
5. Medtag omkostningsoverslag og forudsætninger

### Eksempel på skabelonstruktur
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

**Pro Tip**: Start med det enkleste eksempel, der matcher din teknologistak, og arbejd derefter gradvist op til mere komplekse scenarier. Hvert eksempel bygger på koncepter fra de foregående!

## 🚀 Klar til at komme i gang?

### Din læringsvej

1. **Komplet begynder?** → Start med [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 min)
2. **Har du grundlæggende AZD-viden?** → Prøv [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 min)
3. **Bygger du AI-apps?** → Start med [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 min) eller udforsk [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ timer)
4. **Brug for en specifik teknologistak?** → Se afsnittet [Finding the Right Example](#-finding-the-right-example) ovenfor

### Næste skridt

- ✅ Gennemgå [Forudsætninger](#forudsætninger) ovenfor
- ✅ Vælg et eksempel, der matcher dit færdighedsniveau (se [Kompleksitetslegende](#kompleksitetsvurdering))
- ✅ Læs eksempelets README grundigt inden udrulning
- ✅ Sæt en påmindelse om at køre `azd down` efter test
- ✅ Del din erfaring via GitHub Issues eller Discussions

### Har du brug for hjælp?

- 📖 [FAQ](../resources/faq.md) - Almindelige spørgsmål besvaret
- 🐛 [Fejlfindingsguide](../docs/chapter-07-troubleshooting/common-issues.md) - Ret udrulningsproblemer
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Spørg fællesskabet
- 📚 [Studieguide](../resources/study-guide.md) - Styrk din læring

---

**Navigation**
- **📚 Kursusforside**: [AZD For Beginners](../README.md)
- **📖 Studie materialer**: [Studieguide](../resources/study-guide.md) | [Hurtigoversigt](../resources/cheat-sheet.md) | [Ordliste](../resources/glossary.md)
- **🔧 Ressourcer**: [FAQ](../resources/faq.md) | [Fejlfinding](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Sidst opdateret: November 2025 | [Rapportér problemer](https://github.com/microsoft/AZD-for-beginners/issues) | [Bidrag med eksempler](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->