<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "4a896781acb2a7bebb3c4c66c4f46e7f",
  "translation_date": "2025-11-21T09:01:56+00:00",
  "source_file": "examples/README.md",
  "language_code": "da"
}
-->
# Eksempler - Praktiske AZD-skabeloner og konfigurationer

**Lær ved eksempler - Organiseret efter kapitel**
- **📚 Kursushjem**: [AZD For Begyndere](../README.md)
- **📖 Kapiteloversigt**: Eksempler organiseret efter læringskompleksitet
- **🚀 Lokalt eksempel**: [Detail Multi-Agent Løsning](retail-scenario.md)
- **🤖 Eksterne AI-eksempler**: Links til Azure Samples repositories

> **📍 VIGTIGT: Lokale vs Eksterne Eksempler**  
> Dette repository indeholder **4 komplette lokale eksempler** med fulde implementeringer:  
> - **Azure OpenAI Chat** (GPT-4 implementering med chat-interface)  
> - **Container Apps** (Simple Flask API + Mikroservices)  
> - **Database App** (Web + SQL Database)  
> - **Detail Multi-Agent** (Enterprise AI-løsning)  
>  
> Yderligere eksempler er **eksterne referencer** til Azure-Samples repositories, som du kan klone.

## Introduktion

Denne mappe giver praktiske eksempler og referencer til at hjælpe dig med at lære Azure Developer CLI gennem praktisk øvelse. Detail Multi-Agent-scenariet er en komplet, produktionsklar implementering inkluderet i dette repository. Yderligere eksempler refererer til officielle Azure Samples, der demonstrerer forskellige AZD-mønstre.

### Kompleksitetsvurdering

- ⭐ **Begynder** - Grundlæggende koncepter, enkelt service, 15-30 minutter
- ⭐⭐ **Mellem** - Flere services, databaseintegration, 30-60 minutter
- ⭐⭐⭐ **Avanceret** - Kompleks arkitektur, AI-integration, 1-2 timer
- ⭐⭐⭐⭐ **Ekspert** - Produktionsklar, enterprise-mønstre, 2+ timer

## 🎯 Hvad indeholder dette repository?

### ✅ Lokal implementering (klar til brug)

#### [Azure OpenAI Chat Applikation](azure-openai-chat/README.md) 🆕
**Komplet GPT-4 implementering med chat-interface inkluderet i dette repo**

- **Placering:** `examples/azure-openai-chat/`
- **Kompleksitet:** ⭐⭐ (Mellem)
- **Hvad er inkluderet:**
  - Komplet Azure OpenAI implementering (GPT-4)
  - Python kommandolinje chat-interface
  - Key Vault integration for sikre API-nøgler
  - Bicep infrastruktur skabeloner
  - Tokenforbrug og omkostningssporing
  - Ratebegrænsning og fejlhåndtering

**Hurtig start:**
```bash
# Naviger til eksempel
cd examples/azure-openai-chat

# Udrul alt
azd up

# Installer afhængigheder og begynd at chatte
pip install -r src/requirements.txt
python src/chat.py
```

**Teknologier:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Container App Eksempler](container-app/README.md) 🆕
**Omfattende container implementeringseksempler inkluderet i dette repo**

- **Placering:** `examples/container-app/`
- **Kompleksitet:** ⭐-⭐⭐⭐⭐ (Begynder til Ekspert)
- **Hvad er inkluderet:**
  - [Master Guide](container-app/README.md) - Komplet oversigt over container implementeringer
  - [Simple Flask API](../../../examples/container-app/simple-flask-api) - Grundlæggende REST API eksempel
  - [Mikroservices Arkitektur](../../../examples/container-app/microservices) - Produktionsklar multi-service implementering
  - Hurtig start, produktion og avancerede mønstre
  - Overvågning, sikkerhed og omkostningsoptimering

**Hurtig start:**
```bash
# Se mastervejledning
cd examples/container-app

# Udrul simpel Flask API
cd simple-flask-api
azd up

# Udrul mikroservices eksempel
cd ../microservices
azd up
```

**Teknologier:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Detail Multi-Agent Løsning](retail-scenario.md) 🆕
**Komplet produktionsklar implementering inkluderet i dette repo**

- **Placering:** `examples/retail-multiagent-arm-template/`
- **Kompleksitet:** ⭐⭐⭐⭐ (Avanceret)
- **Hvad er inkluderet:**
  - Komplet ARM implementeringsskabelon
  - Multi-agent arkitektur (Kunde + Lager)
  - Azure OpenAI integration
  - AI-søgning med RAG
  - Omfattende overvågning
  - One-click implementeringsscript

**Hurtig start:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Teknologier:** Azure OpenAI, AI-søgning, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Eksterne Azure Samples (klon for at bruge)

Følgende eksempler vedligeholdes i officielle Azure-Samples repositories. Klon dem for at udforske forskellige AZD-mønstre:

### Simple Applikationer (Kapitel 1-2)

| Skabelon | Repository | Kompleksitet | Services |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Lokal: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Mikroservices** | [Lokal: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-service, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Sådan bruges:**
```bash
# Klon et eksempel
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Udrul
azd up
```

### AI Applikation Eksempler (Kapitel 2, 5, 8)

| Skabelon | Repository | Kompleksitet | Fokus |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI Chat** | [Lokal: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | GPT-4 implementering |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Grundlæggende AI chat |
| **AI Agenter** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agent framework |
| **Søgning + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG mønster |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Enterprise AI |

### Database & Avancerede Mønstre (Kapitel 3-8)

| Skabelon | Repository | Kompleksitet | Fokus |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Databaseintegration |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Mikroservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-service |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Læringsmål

Ved at arbejde med disse eksempler vil du:
- Øve Azure Developer CLI workflows med realistiske applikationsscenarier
- Forstå forskellige applikationsarkitekturer og deres azd-implementeringer
- Mestre Infrastructure as Code mønstre for forskellige Azure services
- Anvende konfigurationsstyring og miljøspecifikke implementeringsstrategier
- Implementere overvågning, sikkerhed og skaleringsmønstre i praktiske kontekster
- Opbygge erfaring med fejlfinding og debugging af reelle implementeringsscenarier

## Læringsresultater

Når du har gennemført disse eksempler, vil du kunne:
- Implementere forskellige applikationstyper med Azure Developer CLI med selvtillid
- Tilpasse de leverede skabeloner til dine egne applikationskrav
- Designe og implementere brugerdefinerede infrastrukturmønstre med Bicep
- Konfigurere komplekse multi-service applikationer med korrekte afhængigheder
- Anvende sikkerheds-, overvågnings- og performance-best practices i reelle scenarier
- Fejlsøge og optimere implementeringer baseret på praktisk erfaring

## Mappeoversigt

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

## Hurtig Start Eksempler

> **💡 Ny til AZD?** Start med eksempel #1 (Flask API) - det tager ~20 minutter og lærer dig kernekoncepter.

### For Begyndere
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Lokal) ⭐  
   Implementer en simpel REST API med scale-to-zero  
   **Tid:** 20-25 minutter | **Omkostning:** $0-5/måned  
   **Du vil lære:** Grundlæggende azd workflow, containerisering, sundhedsprober  
   **Forventet resultat:** Arbejdende API-endpoint, der returnerer "Hello, World!" med overvågning

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Implementer en Node.js Express webapplikation med MongoDB  
   **Tid:** 25-35 minutter | **Omkostning:** $10-30/måned  
   **Du vil lære:** Databaseintegration, miljøvariabler, forbindelsesstrenge  
   **Forventet resultat:** Todo-liste app med opret/læs/opdater/slet funktionalitet

3. **[Statisk Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Host et React statisk website med Azure Static Web Apps  
   **Tid:** 20-30 minutter | **Omkostning:** $0-10/måned  
   **Du vil lære:** Statisk hosting, serverløse funktioner, CDN implementering  
   **Forventet resultat:** React UI med API backend, automatisk SSL, global CDN

### For Mellembrugere
4. **[Azure OpenAI Chat Applikation](../../../examples/azure-openai-chat)** (Lokal) ⭐⭐  
   Implementer GPT-4 med chat-interface og sikker API-nøglehåndtering  
   **Tid:** 35-45 minutter | **Omkostning:** $50-200/måned  
   **Du vil lære:** Azure OpenAI implementering, Key Vault integration, token sporing  
   **Forventet resultat:** Arbejdende chat-applikation med GPT-4 og omkostningsovervågning

5. **[Container App - Mikroservices](../../../examples/container-app/microservices)** (Lokal) ⭐⭐⭐⭐  
   Produktionsklar multi-service arkitektur  
   **Tid:** 45-60 minutter | **Omkostning:** $50-150/måned  
   **Du vil lære:** Servicekommunikation, beskedkøer, distribueret sporing  
   **Forventet resultat:** 2-service system (API Gateway + Produktservice) med overvågning

6. **[Database App - C# med Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Webapplikation med C# API og Azure SQL Database  
   **Tid:** 30-45 minutter | **Omkostning:** $20-80/måned  
   **Du vil lære:** Entity Framework, database migrationer, forbindelsessikkerhed  
   **Forventet resultat:** C# API med Azure SQL backend, automatisk skema implementering

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions med HTTP triggers og Cosmos DB  
   **Tid:** 30-40 minutter | **Omkostning:** $10-40/måned  
   **Du vil lære:** Event-drevet arkitektur, serverløs skalering, NoSQL integration  
   **Forventet resultat:** Funktionsapp, der reagerer på HTTP-anmodninger med Cosmos DB-lagring

8. **[Mikroservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Multi-service Java applikation med Container Apps og API gateway  
   **Tid:** 60-90 minutter | **Omkostning:** $80-200/måned  
   **Du vil lære:** Spring Boot implementering, service mesh, load balancing  
   **Forventet resultat:** Multi-service Java system med serviceopdagelse og routing

### Azure AI Foundry Skabeloner

1. **[Azure OpenAI Chat App - Lokalt Eksempel](../../../examples/azure-openai-chat)** ⭐⭐  
   Komplet GPT-4 implementering med chat-interface  
   **Tid:** 35-45 minutter | **Omkostning:** $50-200/måned  
   **Forventet resultat:** Arbejdende chat-applikation med token sporing og omkostningsovervågning

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Intelligent chat-applikation med RAG arkitektur  
   **Tid:** 60-90 minutter | **Omkostning:** $100-300/måned  
   **Forventet resultat:** RAG-drevet chat-interface med dokumentsøgning og citater

3. **[AI Dokumentbehandling](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Dokumentanalyse ved hjælp af Azure AI services  
   **Tid:** 40-60 minutter | **Omkostning:** $20-80/måned  
   **Forventet resultat:** API, der udtrækker tekst, tabeller og enheder fra uploadede dokumenter

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps workflow med Azure Machine Learning  
   **Tid:** 2-3 timer | **Omkostning:** $150-500/måned  
   **Forventet resultat:** Automatiseret ML pipeline med træning, implementering og overvågning

### Virkelige Scenarier

#### **Detail Multi-Agent Løsning** 🆕
**[Komplet Implementeringsguide](./retail-scenario.md)**

En omfattende, produktionsklar multi-agent kundesupport løsning, der demonstrerer enterprise-grade AI applikationsimplementering med AZD. Dette scenarie tilbyder:

- **Komplet Arkitektur**: Multi-agent system med specialiserede kundeservice- og lagerstyringsagenter
- **Produktionsinfrastruktur**: Multi-region Azure OpenAI-implementeringer, AI-søgning, Container Apps og omfattende overvågning  
- **Klar-til-implementering ARM-skabelon**: Én-klik implementering med flere konfigurationsmodi (Minimal/Standard/Premium)  
- **Avancerede funktioner**: Red teaming sikkerhedsvalidering, agent evalueringsramme, omkostningsoptimering og fejlfinding  
- **Reel forretningskontekst**: Detailkundesupport brugsscenarie med filupload, søgeintegration og dynamisk skalering  

**Teknologier**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API  

**Kompleksitet**: ⭐⭐⭐⭐ (Avanceret - Klar til produktionsbrug i virksomheder)  

**Perfekt til**: AI-udviklere, løsningsarkitekter og teams, der bygger produktionsklare multi-agent systemer  

**Hurtig start**: Implementer den komplette løsning på under 30 minutter ved hjælp af den medfølgende ARM-skabelon med `./deploy.sh -g myResourceGroup`  

## 📋 Brugsanvisning  

### Forudsætninger  

Før du kører et eksempel:  
- ✅ Azure-abonnement med ejer- eller bidragsyderadgang  
- ✅ Azure Developer CLI installeret ([Installationsvejledning](../docs/getting-started/installation.md))  
- ✅ Docker Desktop kørende (til container-eksempler)  
- ✅ Passende Azure-kvoter (tjek krav for specifikke eksempler)  

> **💰 Omkostningsadvarsel:** Alle eksempler opretter reelle Azure-ressourcer, der medfører omkostninger. Se individuelle README-filer for omkostningsestimater. Husk at køre `azd down`, når du er færdig, for at undgå løbende omkostninger.  

### Kør eksempler lokalt  

1. **Klon eller kopier eksempel**  
   ```bash
   # Naviger til ønsket eksempel
   cd examples/simple-web-app
   ```
  
2. **Initialiser AZD-miljø**  
   ```bash
   # Initialiser med eksisterende skabelon
   azd init
   
   # Eller opret nyt miljø
   azd env new my-environment
   ```
  
3. **Konfigurer miljø**  
   ```bash
   # Indstil nødvendige variabler
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```
  
4. **Implementer**  
   ```bash
   # Udrul infrastruktur og applikation
   azd up
   ```
  
5. **Bekræft implementering**  
   ```bash
   # Hent serviceendepunkter
   azd env get-values
   
   # Test endepunktet (eksempel)
   curl https://your-app-url.azurecontainer.io/health
   ```
  
   **Forventede succesindikatorer:**  
   - ✅ `azd up` fuldføres uden fejl  
   - ✅ Service-endpoint returnerer HTTP 200  
   - ✅ Azure Portal viser "Running"-status  
   - ✅ Application Insights modtager telemetri  

> **⚠️ Problemer?** Se [Almindelige problemer](../docs/troubleshooting/common-issues.md) for fejlfinding af implementering  

### Tilpasning af eksempler  

Hvert eksempel inkluderer:  
- **README.md** - Detaljerede opsætnings- og tilpasningsinstruktioner  
- **azure.yaml** - AZD-konfiguration med kommentarer  
- **infra/** - Bicep-skabeloner med parameterforklaringer  
- **src/** - Eksempel på applikationskode  
- **scripts/** - Hjælpescripts til almindelige opgaver  

## 🎯 Læringsmål  

### Eksempelkategorier  

#### **Grundlæggende implementeringer**  
- Enkelt-service applikationer  
- Enkle infrastrukturmønstre  
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
- Katastrofeberedskabsopsætninger  

## 📖 Eksempelbeskrivelser  

### Simpel webapp - Node.js Express  
**Teknologier**: Node.js, Express, MongoDB, Container Apps  
**Kompleksitet**: Begynder  
**Koncepter**: Grundlæggende implementering, REST API, NoSQL databaseintegration  

### Statisk hjemmeside - React SPA  
**Teknologier**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Kompleksitet**: Begynder  
**Koncepter**: Statisk hosting, serverless backend, moderne webudvikling  

### Container App - Python Flask  
**Teknologier**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Kompleksitet**: Begynder  
**Koncepter**: Containerisering, REST API, scale-to-zero, sundhedsprober, overvågning  
**Placering**: [Lokalt eksempel](../../../examples/container-app/simple-flask-api)  

### Container App - Microservices arkitektur  
**Teknologier**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Kompleksitet**: Avanceret  
**Koncepter**: Multi-service arkitektur, servicekommunikation, beskedkøer, distribueret sporing  
**Placering**: [Lokalt eksempel](../../../examples/container-app/microservices)  

### Database App - C# med Azure SQL  
**Teknologier**: C# ASP.NET Core, Azure SQL Database, App Service  
**Kompleksitet**: Mellem  
**Koncepter**: Entity Framework, databaseforbindelser, web API-udvikling  

### Serverless funktion - Python Azure Functions  
**Teknologier**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Kompleksitet**: Mellem  
**Koncepter**: Event-drevet arkitektur, serverless computing, fuld-stack udvikling  

### Microservices - Java Spring Boot  
**Teknologier**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Kompleksitet**: Mellem  
**Koncepter**: Microservices kommunikation, distribuerede systemer, virksomhedsmønstre  

### Azure AI Foundry eksempler  

#### Azure OpenAI Chat App  
**Teknologier**: Azure OpenAI, Cognitive Search, App Service  
**Kompleksitet**: Mellem  
**Koncepter**: RAG-arkitektur, vektorsøgning, LLM-integration  

#### AI-dokumentbehandling  
**Teknologier**: Azure AI Document Intelligence, Storage, Functions  
**Kompleksitet**: Mellem  
**Koncepter**: Dokumentanalyse, OCR, dataudtræk  

#### Maskinlæringspipeline  
**Teknologier**: Azure ML, MLOps, Container Registry  
**Kompleksitet**: Avanceret  
**Koncepter**: Modeltræning, implementeringspipelines, overvågning  

## 🛠 Konfigurationseksempler  

Mappen `configurations/` indeholder genanvendelige komponenter:  

### Miljøkonfigurationer  
- Indstillinger for udviklingsmiljø  
- Konfigurationer for staging-miljø  
- Produktionsklare konfigurationer  
- Multi-region implementeringsopsætninger  

### Bicep-moduler  
- Genanvendelige infrastrukturkomponenter  
- Almindelige ressource-mønstre  
- Sikkerhedshærdede skabeloner  
- Omkostningsoptimerede konfigurationer  

### Hjælpescripts  
- Automatisering af miljøopsætning  
- Scripts til database-migrering  
- Værktøjer til validering af implementering  
- Omkostningsovervågningsværktøjer  

## 🔧 Tilpasningsvejledning  

### Tilpasning af eksempler til din brugssag  

1. **Gennemgå forudsætninger**  
   - Tjek krav til Azure-tjenester  
   - Bekræft abonnementsgrænser  
   - Forstå omkostningsimplikationer  

2. **Ændr konfiguration**  
   - Opdater `azure.yaml` service-definitioner  
   - Tilpas Bicep-skabeloner  
   - Juster miljøvariabler  

3. **Test grundigt**  
   - Implementer først i udviklingsmiljø  
   - Bekræft funktionalitet  
   - Test skalering og ydeevne  

4. **Sikkerhedsgennemgang**  
   - Gennemgå adgangskontroller  
   - Implementer hemmelighedshåndtering  
   - Aktiver overvågning og alarmer  

## 📊 Sammenligningsmatrix  

| Eksempel | Tjenester | Database | Auth | Overvågning | Kompleksitet |  
|---------|----------|----------|------|------------|------------|  
| **Azure OpenAI Chat** (Lokalt) | 2 | ❌ | Key Vault | Fuld | ⭐⭐ |  
| **Python Flask API** (Lokalt) | 1 | ❌ | Basis | Fuld | ⭐ |  
| **Microservices** (Lokalt) | 5+ | ✅ | Enterprise | Avanceret | ⭐⭐⭐⭐ |  
| Node.js Express Todo | 2 | ✅ | Basis | Basis | ⭐ |  
| React SPA + Functions | 3 | ✅ | Basis | Fuld | ⭐ |  
| Python Flask Container | 2 | ❌ | Basis | Fuld | ⭐ |  
| C# Web API + SQL | 2 | ✅ | Fuld | Fuld | ⭐⭐ |  
| Python Functions + SPA | 3 | ✅ | Fuld | Fuld | ⭐⭐ |  
| Java Microservices | 5+ | ✅ | Fuld | Fuld | ⭐⭐ |  
| Azure OpenAI Chat | 3 | ✅ | Fuld | Fuld | ⭐⭐⭐ |  
| AI-dokumentbehandling | 2 | ❌ | Basis | Fuld | ⭐⭐ |  
| ML-pipeline | 4+ | ✅ | Fuld | Fuld | ⭐⭐⭐⭐ |  
| **Detail Multi-Agent** (Lokalt) | **8+** | **✅** | **Enterprise** | **Avanceret** | **⭐⭐⭐⭐** |  

## 🎓 Læringssti  

### Anbefalet progression  

1. **Start med simpel webapp**  
   - Lær grundlæggende AZD-koncepter  
   - Forstå implementeringsworkflow  
   - Øv miljøstyring  

2. **Prøv statisk hjemmeside**  
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
   - Øv hemmelighedshåndtering  

5. **Udforsk serverless**  
   - Forstå event-drevet arkitektur  
   - Lær om triggers og bindings  
   - Øv med API'er  

6. **Byg microservices**  
   - Lær servicekommunikation  
   - Forstå distribuerede systemer  
   - Øv komplekse implementeringer  

## 🔍 Find det rigtige eksempel  

### Efter teknologistak  
- **Container Apps**: [Python Flask API (Lokalt)](../../../examples/container-app/simple-flask-api), [Microservices (Lokalt)](../../../examples/container-app/microservices), Java Microservices  
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Lokalt)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (Lokalt)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Lokalt)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [Microservices Order Service (Lokalt)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, ML-pipeline  
- **Go**: [Microservices User Service (Lokalt)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot Microservices  
- **React**: React SPA + Functions  
- **Containers**: [Python Flask (Lokalt)](../../../examples/container-app/simple-flask-api), [Microservices (Lokalt)](../../../examples/container-app/microservices), Java Microservices  
- **Databaser**: [Microservices (Lokalt)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **AI/ML**: **[Azure OpenAI Chat (Lokalt)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI-dokumentbehandling, ML-pipeline, **Detail Multi-Agent løsning**  
- **Multi-Agent Systemer**: **Detail Multi-Agent løsning**  
- **OpenAI Integration**: **[Azure OpenAI Chat (Lokalt)](../../../examples/azure-openai-chat)**, Detail Multi-Agent løsning  
- **Enterprise Produktion**: [Microservices (Lokalt)](../../../examples/container-app/microservices), **Detail Multi-Agent løsning**  

### Efter arkitekturmønster  
- **Simpel REST API**: [Python Flask API (Lokalt)](../../../examples/container-app/simple-flask-api)  
- **Monolitisk**: Node.js Express Todo, C# Web API + SQL  
- **Statisk + Serverless**: React SPA + Functions, Python Functions + SPA  
- **Microservices**: [Produktions-Microservices (Lokalt)](../../../examples/container-app/microservices), Java Spring Boot Microservices  
- **Containeriseret**: [Python Flask (Lokalt)](../../../examples/container-app/simple-flask-api), [Microservices (Lokalt)](../../../examples/container-app/microservices)  
- **AI-drevet**: **[Azure OpenAI Chat (Lokalt)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI-dokumentbehandling, ML-pipeline, **Detail Multi-Agent løsning**  
- **Multi-Agent Arkitektur**: **Detail Multi-Agent løsning**  
- **Enterprise Multi-Service**: [Microservices (Lokalt)](../../../examples/container-app/microservices), **Detail Multi-Agent løsning**  

### Efter kompleksitetsniveau  
- **Begynder**: [Python Flask API (Lokalt)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **Mellem**: **[Azure OpenAI Chat (Lokalt)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI-dokumentbehandling  
- **Avanceret**: ML-pipeline  
- **Enterprise Produktionsklar**: [Microservices (Lokalt)](../../../examples/container-app/microservices) (Multi-service med beskedkøer), **Detail Multi-Agent løsning** (Komplet multi-agent system med ARM-skabelon implementering)  

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

### Bedste Praksis
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Bidrag med Eksempler

Har du et nyttigt eksempel at dele? Vi byder bidrag velkommen!

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

**Tip**: Start med det simpleste eksempel, der passer til din teknologistak, og arbejd dig gradvist op til mere komplekse scenarier. Hvert eksempel bygger videre på koncepter fra de foregående!

## 🚀 Klar til at Starte?

### Din Læringssti

1. **Helt Nybegynder?** → Start med [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 min)
2. **Har Grundlæggende AZD Viden?** → Prøv [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 min)
3. **Bygger AI Apps?** → Start med [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 min) eller udforsk [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ timer)
4. **Bruger Specifik Teknologistak?** → Brug [Find det Rette Eksempel](../../../examples) sektionen ovenfor

### Næste Skridt

- ✅ Gennemgå [Forudsætninger](../../../examples) ovenfor
- ✅ Vælg et eksempel, der matcher dit færdighedsniveau (se [Kompleksitetslegende](../../../examples))
- ✅ Læs eksemplets README grundigt før implementering
- ✅ Sæt en påmindelse om at køre `azd down` efter test
- ✅ Del din oplevelse via GitHub Issues eller Diskussioner

### Brug for Hjælp?

- 📖 [FAQ](../resources/faq.md) - Almindelige spørgsmål besvaret
- 🐛 [Fejlfindingsguide](../docs/troubleshooting/common-issues.md) - Løs implementeringsproblemer
- 💬 [GitHub Diskussioner](https://github.com/microsoft/AZD-for-beginners/discussions) - Spørg fællesskabet
- 📚 [Studieguide](../resources/study-guide.md) - Styrk din læring

---

**Navigation**
- **📚 Kursushjem**: [AZD For Beginners](../README.md)
- **📖 Studiematerialer**: [Studieguide](../resources/study-guide.md) | [Huskeliste](../resources/cheat-sheet.md) | [Ordliste](../resources/glossary.md)
- **🔧 Ressourcer**: [FAQ](../resources/faq.md) | [Fejlfinding](../docs/troubleshooting/common-issues.md)

---

*Sidst Opdateret: November 2025 | [Rapportér Problemer](https://github.com/microsoft/AZD-for-beginners/issues) | [Bidrag med Eksempler](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:  
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->