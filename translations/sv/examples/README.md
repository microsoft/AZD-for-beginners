# Exempel - Praktiska AZD-mallar och konfigurationer

**Lära genom exempel - organiserat efter kapitel**
- **📚 Kurshem**: [AZD For Beginners](../README.md)
- **📖 Kapitelkarta**: Exempel organiserade efter inlärningskomplexitet
- **🚀 Lokalt exempel**: [Retail Multi-Agent-lösning](retail-scenario.md)
- **🤖 Externa AI-exempel**: Länkar till Azure Samples-repositorier

> **📍 VIKTIGT: Lokala vs externa exempel**  
> Detta repository innehåller **4 kompletta lokala exempel** med fullständiga implementationer:  
> - **Azure OpenAI Chat** (GPT-4-distribution med chattgränssnitt)  
> - **Container Apps** (Enkel Flask-API + mikrotjänster)  
> - **Database App** (Webb + SQL-databas)  
> - **Retail Multi-Agent** (Enterprise AI-lösning)  
>  
> Ytterligare exempel är **externa referenser** till Azure-Samples-repositorier som du kan klona.

## Introduktion

Denna katalog tillhandahåller praktiska exempel och referenser för att hjälpa dig lära dig Azure Developer CLI genom praktisk övning. Retail Multi-Agent-scenariot är en komplett, produktionredo implementation som ingår i detta repository. Ytterligare exempel refererar till officiella Azure Samples som demonstrerar olika AZD-mönster.

### Legend för komplexitetsbetyg

- ⭐ **Nybörjare** - Grundläggande koncept, en tjänst, 15–30 minuter
- ⭐⭐ **Mellannivå** - Flera tjänster, databasintegration, 30–60 minuter
- ⭐⭐⭐ **Avancerad** - Komplex arkitektur, AI-integration, 1–2 timmar
- ⭐⭐⭐⭐ **Expert** - Produktionredo, företagsmönster, 2+ timmar

## 🎯 Vad som faktiskt finns i detta repository

### ✅ Lokal implementation (Redo att använda)

#### [Azure OpenAI Chattapplikation](azure-openai-chat/README.md) 🆕
**Komplett GPT-4-distribution med chattgränssnitt inkluderad i detta repo**

- **Plats:** `examples/azure-openai-chat/`
- **Komplexitet:** ⭐⭐ (Mellannivå)
- **Vad som ingår:**
  - Komplett Azure OpenAI-distribution (GPT-4)
  - Python kommandorads-chattgränssnitt
  - Key Vault-integrering för säkra API-nycklar
  - Bicep-infrastrukturmallar
  - Spårning av tokenanvändning och kostnader
  - Ratebegränsning och felhantering

**Quick Start:**
```bash
# Navigera till exempel
cd examples/azure-openai-chat

# Distribuera allt
azd up

# Installera beroenden och börja chatta
pip install -r src/requirements.txt
python src/chat.py
```

**Tekniker:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Container App-exempel](container-app/README.md) 🆕
**Omfattande containerdistributionsexempel inkluderade i detta repo**

- **Plats:** `examples/container-app/`
- **Komplexitet:** ⭐-⭐⭐⭐⭐ (Från nybörjare till avancerad)
- **Vad som ingår:**
  - [Huvudguide](container-app/README.md) - Fullständig översikt över containerdistributioner
  - [Enkel Flask-API](../../../examples/container-app/simple-flask-api) - Grundläggande REST-API-exempel
  - [Mikrotjänstarkitektur](../../../examples/container-app/microservices) - Produktionsredo distribution med flera tjänster
  - Snabbstart, produktions- och avancerade mönster
  - Övervakning, säkerhet och kostnadsoptimering

**Quick Start:**
```bash
# Visa huvudguiden
cd examples/container-app

# Driftsätt ett enkelt Flask-API
cd simple-flask-api
azd up

# Driftsätt ett exempel på mikrotjänster
cd ../microservices
azd up
```

**Tekniker:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent-lösning](retail-scenario.md) 🆕
**Fullständig produktionredo implementation inkluderad i detta repo**

- **Plats:** `examples/retail-multiagent-arm-template/`
- **Komplexitet:** ⭐⭐⭐⭐ (Avancerad)
- **Vad som ingår:**
  - Komplett ARM-distributionsmall
  - Multi-agentarkitektur (Kund + Lager)
  - Azure OpenAI-integration
  - AI Search med RAG
  - Omfattande övervakning
  - Distributionsskript med ett klick

**Quick Start:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Tekniker:** Azure OpenAI, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Externa Azure Samples (Klona för att använda)

Följande exempel underhålls i officiella Azure-Samples-repositorier. Klona dem för att utforska olika AZD-mönster:

### Enkla applikationer (Kapitel 1-2)

| Mall | Repository | Komplexitet | Tjänster |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Lokal: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Mikrotjänster** | [Lokal: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Flera tjänster, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask-container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Hur man använder:**
```bash
# Klona valfritt exempel
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Distribuera
azd up
```

### AI-applikationsexempel (Kapitel 2, 5, 8)

| Mall | Repository | Komplexitet | Fokus |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI Chat** | [Lokal: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | GPT-4-distribution |
| **AI Chat Snabbstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Grundläggande AI-chatt |
| **AI-agenter** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agentramverk |
| **Search + OpenAI-demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG-mönster |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Företags-AI |

### Databas- och avancerade mönster (Kapitel 3-8)

| Mall | Repository | Komplexitet | Fokus |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Databasintegration |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | Serverless NoSQL |
| **Java-mikrotjänster** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Flera tjänster |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Lärandemål

Genom att arbeta igenom dessa exempel kommer du att:
- Öva Azure Developer CLI-arbetsflöden med realistiska applikationsscenarier
- Förstå olika applikationsarkitekturer och deras azd-implementationer
- Bemästra Infrastructure as Code-mönster för olika Azure-tjänster
- Tillämpa konfigurationshantering och miljöspecifika distributionsstrategier
- Implementera övervaknings-, säkerhets- och skalningsmönster i praktiska sammanhang
- Bygga erfarenhet av felsökning och debugga verkliga distributionsscenarier

## Läranderesultat

Efter att ha slutfört dessa exempel kommer du att kunna:
- Distribuera olika applikationstyper med Azure Developer CLI med självförtroende
- Anpassa tillhandahållna mallar till dina egna applikationskrav
- Designa och implementera egna infrastrukturmönster med Bicep
- Konfigurera komplexa applikationer med flera tjänster och korrekta beroenden
- Tillämpa bästa praxis för säkerhet, övervakning och prestanda i verkliga scenarier
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

> **💡 Ny till AZD?** Börja med exempel nr 1 (Flask API) - det tar ~20 minuter och lär ut kärnkoncept.

### För nybörjare
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Local) ⭐  
   Distribuera ett enkelt REST-API med skala till noll  
   **Tid:** 20–25 minuter | **Kostnad:** $0-5/månad  
   **Du kommer att lära dig:** Grundläggande azd-arbetsflöde, containerisering, hälsokontroller  
   **Förväntat resultat:** Fungerande API-endpoint som returnerar "Hello, World!" med övervakning

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Distribuera en Node.js Express-webbapplikation med MongoDB  
   **Tid:** 25–35 minuter | **Kostnad:** $10-30/månad  
   **Du kommer att lära dig:** Databasintegration, miljövariabler, anslutningssträngar  
   **Förväntat resultat:** Todo-lista-app med skapa/läsa/uppdatera/radera-funktionalitet

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Hosta en React statisk webbplats med Azure Static Web Apps  
   **Tid:** 20–30 minuter | **Kostnad:** $0-10/månad  
   **Du kommer att lära dig:** Statisk hosting, serverlösa funktioner, CDN-distribution  
   **Förväntat resultat:** React-gränssnitt med API-backend, automatisk SSL, global CDN

### För mellannivåanvändare
4. **[Azure OpenAI Chat Application](../../../examples/azure-openai-chat)** (Local) ⭐⭐  
   Distribuera GPT-4 med chattgränssnitt och säker API-nyckelhantering  
   **Tid:** 35–45 minuter | **Kostnad:** $50-200/månad  
   **Du kommer att lära dig:** Azure OpenAI-distribution, Key Vault-integrering, tokenspårning  
   **Förväntat resultat:** Fungerande chattapplikation med GPT-4 och kostnadsövervakning

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Local) ⭐⭐⭐⭐  
   Produktionsredo arkitektur med flera tjänster  
   **Tid:** 45–60 minuter | **Kostnad:** $50-150/månad  
   **Du kommer att lära dig:** Tjänstkommunikation, meddelandeköer, distribuerad spårning  
   **Förväntat resultat:** 2-tjänstersystem (API-gateway + Produktservice) med övervakning

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Webbapplikation med C# API och Azure SQL Database  
   **Tid:** 30–45 minuter | **Kostnad:** $20-80/månad  
   **Du kommer att lära dig:** Entity Framework, databas-migrationer, anslutningssäkerhet  
   **Förväntat resultat:** C# API med Azure SQL-backend, automatisk schemadeployment

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions med HTTP-triggers och Cosmos DB  
   **Tid:** 30–40 minuter | **Kostnad:** $10-40/månad  
   **Du kommer att lära dig:** Händelsestyrd arkitektur, serverlös skalning, NoSQL-integrering  
   **Förväntat resultat:** Funktionsapp som svarar på HTTP-förfrågningar med Cosmos DB-lagring

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Fler-tjänsters Java-applikation med Container Apps och API-gateway  
   **Tid:** 60–90 minuter | **Kostnad:** $80-200/månad  
   **Du kommer att lära dig:** Spring Boot-distribution, servicemesh, lastbalansering  
   **Förväntat resultat:** Fler-tjänsters Java-system med serviceupptäckt och routning

### Microsoft Foundry-mallar

1. **[Azure OpenAI Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   Komplett GPT-4-distribution med chattgränssnitt  
   **Tid:** 35–45 minuter | **Kostnad:** $50-200/månad  
   **Förväntat resultat:** Fungerande chattapplikation med tokenspårning och kostnadsövervakning

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Intelligent chattapplikation med RAG-arkitektur  
   **Tid:** 60–90 minuter | **Kostnad:** $100-300/månad  
   **Förväntat resultat:** RAG-driven chattgränssnitt med dokumentsökning och källhänvisningar

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Dokumentanalys med Azure AI-tjänster  
   **Tid:** 40–60 minuter | **Kostnad:** $20-80/månad  
   **Förväntat resultat:** API som extraherar text, tabeller och entiteter från uppladdade dokument

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps-arbetsflöde med Azure Machine Learning  
   **Tid:** 2-3 timmar | **Kostnad:** $150-500/månad  
   **Förväntat resultat:** Automatiserad ML-pipeline med träning, distribution och övervakning

### Verkliga scenarier

#### **Retail Multi-Agent-lösning** 🆕
**[Komplett implementationsguide](./retail-scenario.md)**

En omfattande, produktionredo multi-agent kundtjänstlösning som demonstrerar företagsklassad AI-applikationsdistribution med AZD. Detta scenario erbjuder:

- **Fullständig arkitektur**: Multi-agent-system med specialiserade kundtjänst- och lagerhanteringsagenter
- **Produktionsinfrastruktur**: Multi-region Azure OpenAI-distributioner, AI Search, Container Apps och omfattande övervakning
- **Klar att distribuera ARM-mall**: Ett-klicksdistribution med flera konfigurationslägen (Minimal/Standard/Premium)
- **Avancerade funktioner**: Red teaming-säkerhetsvalidering, agentutvärderingsramverk, kostnadsoptimering och felsökningsguider
- **Verklig affärskontext**: Kundtjänstfall för återförsäljare med filuppladdningar, sökintegration och dynamisk skalning

**Teknologier**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Komplexitet**: ⭐⭐⭐⭐ (Avancerad - Produktionsklar för företag)

**Perfekt för**: AI-utvecklare, lösningsarkitekter och team som bygger produktionssystem med flera agenter

**Komma igång snabbt**: Distribuera hela lösningen på under 30 minuter med den inkluderade ARM-mallen med `./deploy.sh -g myResourceGroup`

## 📋 Anvisningar för användning

### Förutsättningar

Innan du kör något exempel:
- ✅ Azure-prenumeration med Owner- eller Contributor-behörighet
- ✅ Azure Developer CLI installerad ([Installationsguide](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop igång (för containerexempel)
- ✅ Lämpliga Azure-kvoter (kontrollera exempelspecifika krav)

> **💰 Kostnadsvarning:** Alla exempel skapar riktiga Azure-resurser som medför kostnader. Se individuella README-filer för kostnadsuppskattningar. Kom ihåg att köra `azd down` när du är klar för att undvika löpande kostnader.

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
   # Ange nödvändiga variabler
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
   # Hämta tjänstens endpunkter
   azd env get-values
   
   # Testa endpunkten (exempel)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Förväntade tecken på framgång:**
   - ✅ `azd up` slutförs utan fel
   - ✅ Tjänstens endpoint returnerar HTTP 200
   - ✅ Azure Portal visar statusen "Körs"
   - ✅ Application Insights tar emot telemetri

> **⚠️ Problem?** Se [Vanliga problem](../docs/chapter-07-troubleshooting/common-issues.md) för felsökning av distributionen

### Anpassa exempel

Varje exempel innehåller:
- **README.md** - Detaljerade installations- och anpassningsinstruktioner
- **azure.yaml** - AZD-konfiguration med kommentarer
- **infra/** - Bicep-mallar med parameterförklaringar
- **src/** - Exempelapplikationskod
- **scripts/** - Hjälpskript för vanliga uppgifter

## 🎯 Lärandemål

### Exempelkategorier

#### **Grundläggande distributioner**
- Enkel-tjänst-applikationer
- Enkla infrastrukturmönster
- Grundläggande konfigurationshantering
- Kostnadseffektiva utvecklingsupplägg

#### **Avancerade scenarier**
- Multi-tjänst-arkitekturer
- Komplexa nätverkskonfigurationer
- Databasintegrationsmönster
- Säkerhets- och efterlevnadsimplementeringar

#### **Produktionsklara mönster**
- Konfigurationer för hög tillgänglighet
- Övervakning och observabilitet
- CI/CD-integration
- Upplägg för katastrofåterställning

## 📖 Exempelbeskrivningar

### Enkel webbapp - Node.js Express
**Teknologier**: Node.js, Express, MongoDB, Container Apps  
**Komplexitet**: Nybörjare  
**Koncept**: Enkel distribution, REST API, NoSQL-databasintegration

### Statisk webbplats - React SPA
**Teknologier**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Komplexitet**: Nybörjare  
**Koncept**: Statisk hosting, serverlös backend, modern webbfrontendutveckling

### Container-app - Python Flask
**Teknologier**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Komplexitet**: Nybörjare  
**Koncept**: Containerisering, REST API, skala-till-noll, hälsokontroller, övervakning  
**Plats**: [Lokalt exempel](../../../examples/container-app/simple-flask-api)

### Container-app - Mikrotjänstarkitektur
**Teknologier**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Komplexitet**: Avancerad  
**Koncept**: Multi-tjänst-arkitektur, tjänstkommunikation, meddelandeköning, distribuerad spårning  
**Plats**: [Lokalt exempel](../../../examples/container-app/microservices)

### Databasapp - C# med Azure SQL
**Teknologier**: C# ASP.NET Core, Azure SQL Database, App Service  
**Komplexitet**: Mellannivå  
**Koncept**: Entity Framework, databasanslutningar, web API-utveckling

### Serverlös funktion - Python Azure Functions
**Teknologier**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Komplexitet**: Mellannivå  
**Koncept**: Händelsestyrd arkitektur, serverlös databehandling, fullstackutveckling

### Mikrotjänster - Java Spring Boot
**Teknologier**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Komplexitet**: Mellannivå  
**Koncept**: Mikrotjänstkommunikation, distribuerade system, företagsmönster

### Microsoft Foundry-exempel

#### Azure OpenAI Chattapp
**Teknologier**: Azure OpenAI, Cognitive Search, App Service  
**Komplexitet**: Mellannivå  
**Koncept**: RAG-arkitektur, vektorsökning, LLM-integration

#### AI-dokumentbearbetning
**Teknologier**: Azure AI Document Intelligence, Storage, Functions  
**Komplexitet**: Mellannivå  
**Koncept**: Dokumentanalys, OCR, datautvinning

#### Maskininlärningspipeline
**Teknologier**: Azure ML, MLOps, Container Registry  
**Komplexitet**: Avancerad  
**Koncept**: Modellträning, deploymentspipelines, övervakning

## 🛠 Konfigurationsexempel

Katalogen `configurations/` innehåller återanvändbara komponenter:

### Miljökonfigurationer
- Utvecklingsmiljöinställningar
- Staging-miljökonfigurationer
- Produktionsklara konfigurationer
- Multi-region-distributionsupplägg

### Bicep-moduler
- Återanvändbara infrastrukturkomponenter
- Vanliga resursmönster
- Säkerhetshärdade mallar
- Kostnadsoptimerade konfigurationer

### Hjälpskript
- Automatisering av miljöinställning
- Databas-migrationsskript
- Verktyg för validering av distribution
- Kostnadsövervakningsverktyg

## 🔧 Anpassningsguide

### Anpassa exempel för ditt användningsfall

1. **Granska förutsättningar**
   - Kontrollera Azure-tjänstkrav
   - Verifiera prenumerationsgränser
   - Förstå kostnadsimplikationer

2. **Ändra konfiguration**
   - Uppdatera `azure.yaml` tjänstdefinitioner
   - Anpassa Bicep-mallar
   - Justera miljövariabler

3. **Testa noggrant**
   - Distribuera till utvecklingsmiljö först
   - Verifiera funktionalitet
   - Testa skalning och prestanda

4. **Säkerhetsgranskning**
   - Granska åtkomstkontroller
   - Implementera hantering av hemligheter
   - Aktivera övervakning och larm

## 📊 Jämförelsematris

| Exempel | Tjänster | Databas | Autentisering | Övervakning | Komplexitet |
|---------|----------|---------|---------------|-------------|------------|
| **Azure OpenAI Chat** (Lokal) | 2 | ❌ | Key Vault | Fullständig | ⭐⭐ |
| **Python Flask API** (Lokal) | 1 | ❌ | Grundläggande | Fullständig | ⭐ |
| **Microservices** (Lokal) | 5+ | ✅ | Företag | Avancerad | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Grundläggande | Grundläggande | ⭐ |
| React SPA + Functions | 3 | ✅ | Grundläggande | Fullständig | ⭐ |
| Python Flask Container | 2 | ❌ | Grundläggande | Fullständig | ⭐ |
| C# Web API + SQL | 2 | ✅ | Fullständig | Fullständig | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Fullständig | Fullständig | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Fullständig | Fullständig | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Fullständig | Fullständig | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Grundläggande | Fullständig | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Fullständig | Fullständig | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Lokal) | **8+** | **✅** | **Företag** | **Avancerad** | **⭐⭐⭐⭐** |

## 🎓 Lärandeväg

### Rekommenderad ordning

1. **Börja med Enkel webbapp**
   - Lär dig grundläggande AZD-koncept
   - Förstå distributionsflödet
   - Öva på miljöhantering

2. **Prova Statisk webbplats**
   - Utforska olika hostingalternativ
   - Lär dig om CDN-integration
   - Förstå DNS-konfiguration

3. **Gå vidare till Container-app**
   - Lär dig containeriseringskoncept
   - Förstå skalningskoncept
   - Öva med Docker

4. **Lägg till databasintegration**
   - Lär dig databasprovisionering
   - Förstå anslutningssträngar
   - Öva på hantering av hemligheter

5. **Utforska serverlöst**
   - Förstå händelsestyrd arkitektur
   - Lär dig om triggers och bindings
   - Öva med API:er

6. **Bygg mikrotjänster**
   - Lär dig tjänstkommunikation
   - Förstå distribuerade system
   - Öva på komplexa distributioner

## 🔍 Hitta rätt exempel

### Efter teknikstack
- **Container Apps**: [Python Flask API (Lokal)](../../../examples/container-app/simple-flask-api), [Microservices (Lokal)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Lokal)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Lokal)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Lokal)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Lokal)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Go**: [Microservices User Service (Lokal)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Lokal)](../../../examples/container-app/simple-flask-api), [Microservices (Lokal)](../../../examples/container-app/microservices), Java Microservices
- **Databaser**: [Microservices (Lokal)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Azure OpenAI Chat (Lokal)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Azure OpenAI Chat (Lokal)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (Lokal)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Efter arkitekturmönster
- **Enkel REST API**: [Python Flask API (Lokal)](../../../examples/container-app/simple-flask-api)
- **Monolitisk**: Node.js Express Todo, C# Web API + SQL
- **Statisk + Serverless**: React SPA + Functions, Python Functions + SPA
- **Mikrotjänster**: [Production Microservices (Lokal)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containeriserat**: [Python Flask (Lokal)](../../../examples/container-app/simple-flask-api), [Microservices (Lokal)](../../../examples/container-app/microservices)
- **AI-driven**: **[Azure OpenAI Chat (Lokal)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent-arkitektur**: **Retail Multi-Agent Solution**
- **Företags multi-tjänst**: [Microservices (Lokal)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Efter komplexitetsnivå
- **Nybörjare**: [Python Flask API (Lokal)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Mellannivå**: **[Azure OpenAI Chat (Lokal)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Avancerad**: ML Pipeline
- **Produktionsklar för företag**: [Microservices (Lokal)](../../../examples/container-app/microservices) (Multi-tjänst med meddelandeköning), **Retail Multi-Agent Solution** (Fullständigt multi-agent-system med ARM-mall för distribution)

## 📚 Ytterligare resurser

### Dokumentationslänkar
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Community-exempel
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo-app med Node.js och PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React-webbapp med C#-API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps-jobb](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions med Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Bästa praxis
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Bidra med exempel

Har du ett användbart exempel att dela? Vi välkomnar ditt bidrag!

### Riktlinjer för inlämning
1. Följ den etablerade katalogstrukturen
2. Inkludera en utförlig README.md
3. Lägg till kommentarer i konfigurationsfilerna
4. Testa noggrant innan du skickar in
5. Bifoga kostnadsuppskattningar och förutsättningar

### Struktur för exempelmall
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

**Proffstips**: Börja med det enklaste exemplet som matchar din teknikstack, och arbeta dig sedan gradvis upp till mer komplexa scenarier. Varje exempel bygger på koncept från de tidigare!

## 🚀 Redo att börja?

### Din inlärningsväg

1. **Helt nybörjare?** → Börja med [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 min)
2. **Har du grundläggande AZD-kunskaper?** → Prova [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 min)
3. **Bygger du AI-appar?** → Starta med [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 min) eller utforska [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ timmar)
4. **Behöver du en specifik teknikstack?** → Använd avsnittet [Hitta rätt exempel](../../../examples) ovan

### Nästa steg

- ✅ Granska [Förutsättningar](../../../examples) ovan
- ✅ Välj ett exempel som matchar din kunskapsnivå (se [Komplexitetslegend](../../../examples))
- ✅ Läs exempelns README noggrant innan du distribuerar
- ✅ Ställ en påminnelse att köra `azd down` efter testning
- ✅ Dela din erfarenhet via GitHub Issues eller Discussions

### Behöver du hjälp?

- 📖 [FAQ](../resources/faq.md) - Vanliga frågor besvarade
- 🐛 [Felsökningsguide](../docs/chapter-07-troubleshooting/common-issues.md) - Åtgärda distribueringsproblem
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Fråga communityn
- 📚 [Studieguide](../resources/study-guide.md) - Förstärk ditt lärande

---

**Navigering**
- **📚 Kursens startsida**: [AZD For Beginners](../README.md)
- **📖 Studiematerial**: [Studieguide](../resources/study-guide.md) | [Fusklista](../resources/cheat-sheet.md) | [Ordlista](../resources/glossary.md)
- **🔧 Resurser**: [FAQ](../resources/faq.md) | [Felsökning](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Senast uppdaterad: november 2025 | [Rapportera problem](https://github.com/microsoft/AZD-for-beginners/issues) | [Bidra med exempel](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet bör du vara medveten om att automatiska översättningar kan innehålla fel eller felaktigheter. Det ursprungliga dokumentet på dess ursprungliga språk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell, mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->