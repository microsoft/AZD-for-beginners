# Examples - Praktiska AZD-mallar och konfigurationer

**Lärande genom exempel - organiserat efter kapitel**
- **📚 Kursens startsida**: [AZD för nybörjare](../README.md)
- **📖 Kapitelkarta**: Exempel organiserade efter inlärningskomplexitet
- **🚀 Lokalt exempel**: [Retail Multi-Agent-lösning](retail-scenario.md)
- **🤖 Externa AI-exempel**: Länkar till Azure Samples-arkiv

> **📍 VIKTIGT: Lokala kontra externa exempel**  
> Detta förvar innehåller **4 kompletta lokala exempel** med fullständiga implementationer:  
> - **Microsoft Foundry Models Chat** (gpt-4.1-distribution med chattgränssnitt)  
> - **Container Apps** (Enkel Flask-API + mikrotjänster)  
> - **Database App** (Webb + SQL-databas)  
> - **Retail Multi-Agent** (Företags-AI-lösning)  
>  
> Ytterligare exempel är **externa referenser** till Azure-Samples-förråd som du kan klona.

## Introduktion

Denna katalog innehåller praktiska exempel och referenser för att hjälpa dig att lära dig Azure Developer CLI genom praktisk övning. Retail Multi-Agent-scenariot är en komplett, produktionsfärdig implementation som ingår i detta förvar. Ytterligare exempel refererar till officiella Azure Samples som visar olika AZD-mönster.

### Legend för komplexitetsbedömning

- ⭐ **Nybörjare** - Grundläggande koncept, en tjänst, 15–30 minuter
- ⭐⭐ **Medel** - Flera tjänster, databasintegration, 30–60 minuter
- ⭐⭐⭐ **Avancerad** - Komplex arkitektur, AI-integration, 1–2 timmar
- ⭐⭐⭐⭐ **Expert** - Produktionsfärdig, företagsmönster, 2+ timmar

## 🎯 Vad som faktiskt finns i detta förvar

### ✅ Lokal implementering (redo att använda)

#### [Microsoft Foundry Models Chat Application](azure-openai-chat/README.md) 🆕
**Komplett gpt-4.1-distribution med chattgränssnitt inkluderad i detta förvar**

- **Plats:** `examples/azure-openai-chat/`
- **Komplexitet:** ⭐⭐ (Medel)
- **Vad som ingår:**
  - Komplett Microsoft Foundry Models-distribution (gpt-4.1)
  - Python kommandorads-chattgränssnitt
  - Key Vault-integration för säkra API-nycklar
  - Bicep-infrastrukturmallar
  - Spårning av tokenanvändning och kostnader
  - Begränsning av anropstakt och felhantering

**Kom igång snabbt:**
```bash
# Navigera till exempel
cd examples/azure-openai-chat

# Distribuera allt
azd up

# Installera beroenden och börja chatta
pip install -r src/requirements.txt
python src/chat.py
```

**Tekniker:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Container App Examples](container-app/README.md) 🆕
**Omfattande exempel på containerdistributioner inkluderade i detta förvar**

- **Plats:** `examples/container-app/`
- **Komplexitet:** ⭐-⭐⭐⭐⭐ (Nybörjare till Avancerad)
- **Vad som ingår:**
  - [Huvudguide](container-app/README.md) - Fullständig översikt över containerdistributioner
  - [Enkel Flask-API](../../../examples/container-app/simple-flask-api) - Grundläggande REST API-exempel
  - [Mikrotjänstarkitektur](../../../examples/container-app/microservices) - Produktionsklar multi-tjänstdistribution
  - Snabbstart, produktions- och avancerade mönster
  - Övervakning, säkerhet och kostnadsoptimering

**Kom igång snabbt:**
```bash
# Visa huvudguiden
cd examples/container-app

# Distribuera ett enkelt Flask-API
cd simple-flask-api
azd up

# Distribuera ett exempel på mikrotjänster
cd ../microservices
azd up
```

**Tekniker:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent Solution](retail-scenario.md) 🆕
**Komplett produktionsfärdig implementering inkluderad i detta förvar**

- **Plats:** `examples/retail-multiagent-arm-template/`
- **Komplexitet:** ⭐⭐⭐⭐ (Avancerad)
- **Vad som ingår:**
  - Komplett ARM-distributionsmall
  - Multi-agent-arkitektur (Kund + Lager)
  - Microsoft Foundry Models-integration
  - AI-sökning med RAG
  - Omfattande övervakning
  - Distributionsskript med ett klick

**Kom igång snabbt:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Tekniker:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Externa Azure Samples (klona för att använda)

Följande exempel underhålls i officiella Azure-Samples-arkiv. Klona dem för att utforska olika AZD-mönster:

### Enkla applikationer (Kapitel 1-2)

| Mall | Förvar | Komplexitet | Tjänster |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Lokal: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Lokal: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Fler-tjänst, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Hur man använder:**
```bash
# Klona valfritt exempel
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Distribuera
azd up
```

### AI Application Examples (Kapitel 2, 5, 8)

| Mall | Förvar | Komplexitet | Fokus |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [Lokal: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1-distribution |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Grundläggande AI-chatt |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agentramverk |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG-mönster |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Företags-AI |

### Databas- & avancerade mönster (Kapitel 3-8)

| Mall | Förvar | Komplexitet | Fokus |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Databasintegration |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverlöst |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Fler-tjänst |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Inlärningsmål

Genom att arbeta med dessa exempel kommer du att:
- Öva Azure Developer CLI-arbetsflöden med realistiska applikationsscenarier
- Förstå olika applikationsarkitekturer och deras azd-implementationer
- Bemästra Infrastructure as Code-mönster för olika Azure-tjänster
- Använda konfigurationshantering och miljöspecifika deploy-strategier
- Implementera övervakning, säkerhet och skalningsmönster i praktiska sammanhang
- Bygga erfarenhet av felsökning och debugging i verkliga distributionsscenarier

## Inlärningsresultat

Efter att ha slutfört dessa exempel kommer du att kunna:
- Distribuera olika applikationstyper med Azure Developer CLI med självförtroende
- Anpassa tillhandahållna mallar till dina egna applikationskrav
- Designa och implementera egna infrastrukturmönster med Bicep
- Konfigurera komplexa multi-tjänsteapplikationer med korrekta beroenden
- Tillämpa säkerhets-, övervaknings- och prestandabästa praxis i verkliga scenarier
- Felsöka och optimera distributioner baserat på praktisk erfarenhet

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

## Snabbstartsexempel

> **💡 Ny på AZD?** Börja med exempel nr 1 (Flask API) - det tar ~20 minuter och lär ut kärnkoncepten.

### För nybörjare
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Lokal) ⭐  
   Distribuera ett enkelt REST API med scale-to-zero  
   **Tid:** 20–25 minuter | **Kostnad:** $0–5/månad  
   **Du lär dig:** Grundläggande azd-arbetsflöde, containerisering, hälsokontroller  
   **Förväntat resultat:** Fungerande API-endpoint som returnerar "Hello, World!" med övervakning

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Distribuera en Node.js Express-webbapplikation med MongoDB  
   **Tid:** 25–35 minuter | **Kostnad:** $10–30/månad  
   **Du lär dig:** Databasintegration, miljövariabler, anslutningssträngar  
   **Förväntat resultat:** Todo-lista-app med skapa/läsa/uppdatera/radera-funktionalitet

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Hosta en React-statisk webbplats med Azure Static Web Apps  
   **Tid:** 20–30 minuter | **Kostnad:** $0–10/månad  
   **Du lär dig:** Statisk hosting, serverlösa funktioner, CDN-distribution  
   **Förväntat resultat:** React-gränssnitt med API-backend, automatisk SSL, global CDN

### För medelavancerade användare
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (Lokal) ⭐⭐  
   Distribuera gpt-4.1 med chattgränssnitt och säker hantering av API-nycklar  
   **Tid:** 35–45 minuter | **Kostnad:** $50–200/månad  
   **Du lär dig:** Microsoft Foundry Models-distribution, Key Vault-integration, tokenspårning  
   **Förväntat resultat:** Fungerande chattapplikation med gpt-4.1 och kostnadsövervakning

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Lokal) ⭐⭐⭐⭐  
   Produktionsklar multi-tjänstarkitektur  
   **Tid:** 45–60 minuter | **Kostnad:** $50–150/månad  
   **Du lär dig:** Tjänstkommunikation, meddelandeköning, distribuerad spårning  
   **Förväntat resultat:** 2-tjänsters system (API Gateway + Produktservice) med övervakning

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Webbapplikation med C# API och Azure SQL Database  
   **Tid:** 30–45 minuter | **Kostnad:** $20–80/månad  
   **Du lär dig:** Entity Framework, databas-migrationer, anslutningssäkerhet  
   **Förväntat resultat:** C# API med Azure SQL-backend, automatisk schemadeployment

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions med HTTP-triggers och Cosmos DB  
   **Tid:** 30–40 minuter | **Kostnad:** $10–40/månad  
   **Du lär dig:** Händelsestyrd arkitektur, serverlös skalning, NoSQL-integration  
   **Förväntat resultat:** Funktionsapp som svarar på HTTP-förfrågningar med Cosmos DB-lagring

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Multi-tjänst Java-applikation med Container Apps och API-gateway  
   **Tid:** 60–90 minuter | **Kostnad:** $80–200/månad  
   **Du lär dig:** Spring Boot-distribution, service mesh, lastbalansering  
   **Förväntat resultat:** Multi-tjänst Java-system med serviceupptäckt och routing

### Microsoft Foundry Templates

1. **[Microsoft Foundry Models Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   Komplett gpt-4.1-distribution med chattgränssnitt  
   **Tid:** 35–45 minuter | **Kostnad:** $50–200/månad  
   **Förväntat resultat:** Fungerande chattapplikation med tokenspårning och kostnadsövervakning

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Intelligent chattapplikation med RAG-arkitektur  
   **Tid:** 60–90 minuter | **Kostnad:** $100–300/månad  
   **Förväntat resultat:** RAG-driven chatt med dokumentsökning och källhänvisningar

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Dokumentanalys med Azure AI-tjänster  
   **Tid:** 40–60 minuter | **Kostnad:** $20–80/månad  
   **Förväntat resultat:** API som extraherar text, tabeller och entiteter från uppladdade dokument

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps-arbetsflöde med Azure Machine Learning  
   **Tid:** 2–3 timmar | **Kostnad:** $150–500/månad  
   **Förväntat resultat:** Automatisk ML-pipeline med träning, distribution och övervakning

### Verkliga scenarier

#### **Retail Multi-Agent-lösning** 🆕
**[Komplett implementeringsguide](./retail-scenario.md)**

En omfattande, produktionsfärdig multi-agent kundsupportlösning som visar hur man distribuerar företagsklassade AI-applikationer med AZD. Detta scenario erbjuder:

- **Komplett arkitektur**: Multi-agent-system med specialiserade kundtjänst- och lagerhanteringsagenter
- **Productionsinfrastruktur**: Multi-region-distributioner av Microsoft Foundry Models, AI Search, Container Apps och omfattande övervakning
- **Klar att distribuera ARM-mall**: Enkel distribution med flera konfigurationslägen (Minimal/Standard/Premium)
- **Avancerade funktioner**: Red teaming-säkerhetsvalidering, agentutvärderingsramverk, kostnadsoptimering och felsökningsguider
- **Verklig affärskontext**: Kundtjänstfall för återförsäljare med filuppladdningar, sökintegration och dynamisk skalning

**Tekniker**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Komplexitet**: ⭐⭐⭐⭐ (Avancerad - Företagsproduktionsklar)

**Perfekt för**: AI-utvecklare, lösningsarkitekter och team som bygger produktionssystem med flera agenter

**Snabbstart**: Distribuera hela lösningen på under 30 minuter med den inkluderade ARM-mallen med `./deploy.sh -g myResourceGroup`

## 📋 Anvisningar för användning

### Förutsättningar

Innan du kör något exempel:
- ✅ Azure-prenumeration med Owner- eller Contributor-behörighet
- ✅ Azure Developer CLI installerad ([Installationsguide](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop igång (för containerexempel)
- ✅ Lämpliga Azure-kvoter (kontrollera exempel-specifika krav)

> **💰 Kostnadsvarning:** Alla exempel skapar verkliga Azure-resurser som medför kostnader. Se individuella README-filer för kostnadsuppskattningar. Kom ihåg att köra `azd down` när du är klar för att undvika löpande kostnader.

### Köra exempel lokalt

1. **Klona eller kopiera exemplet**
   ```bash
   # Navigera till önskat exempel
   cd examples/simple-web-app
   ```

2. **Initiera AZD-miljön**
   ```bash
   # Initiera med befintlig mall
   azd init
   
   # Eller skapa en ny miljö
   azd env new my-environment
   ```

3. **Konfigurera miljön**
   ```bash
   # Ställ in nödvändiga variabler
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Distribuera**
   ```bash
   # Driftsätt infrastruktur och applikation
   azd up
   ```

5. **Verifiera distributionen**
   ```bash
   # Hämta tjänstens slutpunkter
   azd env get-values
   
   # Testa slutpunkten (exempel)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Förväntade framgångsindikatorer:**
   - ✅ `azd up` slutförs utan fel
   - ✅ Tjänstens slutpunkt returnerar HTTP 200
   - ✅ Azure-portalen visar status "Running"
   - ✅ Application Insights tar emot telemetri

> **⚠️ Problem?** Se [Vanliga problem](../docs/chapter-07-troubleshooting/common-issues.md) för felsökning av distribution

### Anpassa exemplen

Varje exempel innehåller:
- **README.md** - Detaljerade installations- och anpassningsinstruktioner
- **azure.yaml** - AZD-konfiguration med kommentarer
- **infra/** - Bicep-mallar med parameterförklaringar
- **src/** - Exempelkod för applikation
- **scripts/** - Hjälpskript för vanliga uppgifter

## 🎯 Lärandemål

### Exempelkategorier

#### **Grundläggande distributioner**
- Enkeltjänstapplikationer
- Enkla infrastrukturmönster
- Grundläggande konfigurationshantering
- Kostnadseffektiva utvecklingsuppsättningar

#### **Avancerade scenarier**
- Fler tjänster-arkitekturer
- Komplexa nätverkskonfigurationer
- Databasintegrationsmönster
- Säkerhets- och efterlevnadsimplementeringar

#### **Produktionsklara mönster**
- Hög tillgänglighet-konfigurationer
- Övervakning och observerbarhet
- CI/CD-integration
- Katastrofåterställningsuppsättningar

## 📖 Exempelbeskrivningar

### Enkel webbapp - Node.js Express
**Tekniker**: Node.js, Express, MongoDB, Container Apps  
**Komplexitet**: Nybörjare  
**Koncept**: Enkel distribution, REST API, NoSQL-databasintegration

### Statisk webbplats - React SPA
**Tekniker**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Komplexitet**: Nybörjare  
**Koncept**: Statisk hosting, serverlös backend, modern webb-utveckling

### Container App - Python Flask
**Tekniker**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Komplexitet**: Nybörjare  
**Koncept**: Containerisering, REST API, scale-to-zero, hälsokontroller, övervakning  
**Plats**: [Lokalt exempel](../../../examples/container-app/simple-flask-api)

### Container App - Mikrotjänstarkitektur
**Tekniker**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Komplexitet**: Avancerad  
**Koncept**: Fler-tjänster-arkitektur, tjänstkommunikation, meddelandeköning, distribuerad spårning  
**Plats**: [Lokalt exempel](../../../examples/container-app/microservices)

### Databasapp - C# med Azure SQL
**Tekniker**: C# ASP.NET Core, Azure SQL Database, App Service  
**Komplexitet**: Mellanliggande  
**Koncept**: Entity Framework, databasanslutningar, webb-API-utveckling

### Serverless Function - Python Azure Functions
**Tekniker**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Komplexitet**: Mellanliggande  
**Koncept**: Händelsedriven arkitektur, serverlös databehandling, fullstack-utveckling

### Mikrotjänster - Java Spring Boot
**Tekniker**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Komplexitet**: Mellanliggande  
**Koncept**: Mikrotjänstkommunikation, distribuerade system, företagsmönster

### Microsoft Foundry-exempel

#### Microsoft Foundry Models Chat App
**Tekniker**: Microsoft Foundry Models, Azure AI Search, App Service  
**Komplexitet**: Mellanliggande  
**Koncept**: RAG-arkitektur, vektorsökning, LLM-integration

#### AI Document Processing
**Tekniker**: Azure AI Document Intelligence, Storage, Functions  
**Komplexitet**: Mellanliggande  
**Koncept**: Dokumentanalys, OCR, datautvinning

#### Maskininlärningspipeline
**Tekniker**: Azure ML, MLOps, Container Registry  
**Komplexitet**: Avancerad  
**Koncept**: Modellträning, distributionspipelines, övervakning

## 🛠 Konfigurationsexempel

Katalogen `configurations/` innehåller återanvändbara komponenter:

### Miljökonfigurationer
- Utvecklingsmiljöinställningar
- Staging-miljökonfigurationer
- Produktionsklara konfigurationer
- Multi-region-distributionsuppsättningar

### Bicep-moduler
- Återanvändbara infrastrukturkomponenter
- Vanliga resursmönster
- Säkerhetshärdade mallar
- Kostnadsoptimerade konfigurationer

### Hjälpskript
- Automatisering för miljöinställning
- Databas-migrationsskript
- Verktyg för validering av distribution
- Verktyg för kostnadsövervakning

## 🔧 Anpassningsguide

### Anpassa exemplen för ditt användningsfall

1. **Granska förutsättningarna**
   - Kontrollera Azure-tjänstekrav
   - Verifiera prenumerationsgränser
   - Förstå kostnadskonsekvenser

2. **Ändra konfiguration**
   - Uppdatera `azure.yaml` service-definitioner
   - Anpassa Bicep-mallar
   - Justera miljövariabler

3. **Testa noggrant**
   - Distribuera först till utvecklingsmiljön
   - Validera funktionalitet
   - Testa skalning och prestanda

4. **Säkerhetsgranskning**
   - Granska åtkomstkontroller
   - Implementera hantering av hemligheter
   - Aktivera övervakning och aviseringar

## 📊 Jämförelsematris

| Example | Services | Database | Auth | Monitoring | Complexity |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (Lokalt) | 2 | ❌ | Key Vault | Full | ⭐⭐ |
| **Python Flask API** (Lokalt) | 1 | ❌ | Basic | Full | ⭐ |
| **Microservices** (Lokalt) | 5+ | ✅ | Enterprise | Advanced | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Basic | Basic | ⭐ |
| React SPA + Functions | 3 | ✅ | Basic | Full | ⭐ |
| Python Flask Container | 2 | ❌ | Basic | Full | ⭐ |
| C# Web API + SQL | 2 | ✅ | Full | Full | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Full | Full | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Full | Full | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | Full | Full | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Basic | Full | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Full | Full | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Lokalt) | **8+** | **✅** | **Enterprise** | **Advanced** | **⭐⭐⭐⭐** |

## 🎓 Lärandeväg

### Rekommenderad progression

1. **Börja med Enkel webbapp**
   - Lär dig grundläggande AZD-koncept
   - Förstå distributionsarbetsflödet
   - Öva miljöhantering

2. **Prova Statisk webbplats**
   - Utforska olika hostingalternativ
   - Lär dig om CDN-integration
   - Förstå DNS-konfiguration

3. **Gå vidare till Container App**
   - Lär dig containeriseringsgrunder
   - Förstå skalningskoncept
   - Öva med Docker

4. **Lägg till databasintegration**
   - Lär dig databasutprovning
   - Förstå connection strings
   - Öva hantering av hemligheter

5. **Utforska serverless**
   - Förstå händelsedriven arkitektur
   - Lär dig om triggers och bindings
   - Öva med API:er

6. **Bygg mikrotjänster**
   - Lär dig tjänstkommunikation
   - Förstå distribuerade system
   - Öva komplexa distributioner

## 🔍 Hitta rätt exempel

### Efter teknologistack
- **Container Apps**: [Python Flask API (Lokalt)](../../../examples/container-app/simple-flask-api), [Microservices (Lokalt)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Lokalt)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Lokalt)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Lokalt)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Lokalt)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Microservices User Service (Lokalt)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Lokalt)](../../../examples/container-app/simple-flask-api), [Microservices (Lokalt)](../../../examples/container-app/microservices), Java Microservices
- **Databaser**: [Microservices (Lokalt)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (Lokalt)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI-integration**: **[Microsoft Foundry Models Chat (Lokalt)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Företagsproduktion**: [Microservices (Lokalt)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Efter arkitekturpattern
- **Enkel REST API**: [Python Flask API (Lokalt)](../../../examples/container-app/simple-flask-api)
- **Monolit**: Node.js Express Todo, C# Web API + SQL
- **Statisk + serverless**: React SPA + Functions, Python Functions + SPA
- **Mikrotjänster**: [Produktion Mikrotjänster (Lokalt)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containeriserat**: [Python Flask (Lokalt)](../../../examples/container-app/simple-flask-api), [Microservices (Lokalt)](../../../examples/container-app/microservices)
- **AI-driven**: **[Microsoft Foundry Models Chat (Lokalt)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent-arkitektur**: **Retail Multi-Agent Solution**
- **Företags multi-tjänst**: [Microservices (Lokalt)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Efter svårighetsgrad
- **Nybörjare**: [Python Flask API (Lokalt)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Mellanliggande**: **[Microsoft Foundry Models Chat (Lokalt)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **Avancerad**: ML Pipeline
- **Företagsproduktionsklar**: [Microservices (Lokalt)](../../../examples/container-app/microservices) (Fler-tjänster med meddelandeköning), **Retail Multi-Agent Solution** (Fullständigt multi-agent-system med ARM-mallsdistribution)

## 📚 Ytterligare resurser

### Dokumentationslänkar
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep-dokumentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Community-exempel
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App med C# och Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App med Python och MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App med Node.js och PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React-webbapp med C#-API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps-jobb](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions med Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Bästa praxis
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Bidra med exempel

Har du ett användbart exempel att dela? Vi välkomnar bidrag!

### Riktlinjer för inskick
1. Följ den etablerade katalogstrukturen
2. Inkludera en omfattande README.md
3. Lägg till kommentarer i konfigurationsfilerna
4. Testa noggrant innan du skickar in
5. Inkludera kostnadsuppskattningar och förutsättningar

### Exempelmallstruktur
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

**Proffstips**: Börja med det enklaste exemplet som matchar din teknologistack, och arbeta dig sedan gradvis upp till mer komplexa scenarier. Varje exempel bygger på koncept från de tidigare!

## 🚀 Redo att börja?

### Din läranderesa

1. **Totalt nybörjare?** → Börja med [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 min)
2. **Har du grundläggande AZD-kunskaper?** → Prova [Mikrotjänster](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 min)
3. **Bygger du AI-appar?** → Börja med [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 min) eller utforska [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ timmar)
4. **Behöver du en specifik teknologistack?** → Använd avsnittet [Hitta rätt exempel](#-finding-the-right-example) ovan

### Nästa steg

- ✅ Granska [Prerequisites](#förutsättningar) ovan
- ✅ Välj ett exempel som matchar din kunskapsnivå (se [Complexity Legend](#legend-för-komplexitetsbedömning))
- ✅ Läs exempelns README noggrant innan du distribuerar
- ✅ Sätt en påminnelse att köra `azd down` efter testning
- ✅ Dela din erfarenhet via GitHub Issues eller Discussions

### Behöver du hjälp?

- 📖 [FAQ](../resources/faq.md) - Vanliga frågor besvarade
- 🐛 [Felsökningsguide](../docs/chapter-07-troubleshooting/common-issues.md) - Åtgärda distributionsproblem
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Fråga communityn
- 📚 [Study Guide](../resources/study-guide.md) - Fördjupa ditt lärande

---

**Navigering**
- **📚 Kursstart**: [AZD For Beginners](../README.md)
- **📖 Studiermaterial**: [Study Guide](../resources/study-guide.md) | [Cheat Sheet](../resources/cheat-sheet.md) | [Glossary](../resources/glossary.md)
- **🔧 Resurser**: [FAQ](../resources/faq.md) | [Felsökning](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Senast uppdaterad: November 2025 | [Report Issues](https://github.com/microsoft/AZD-for-beginners/issues) | [Contribute Examples](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->