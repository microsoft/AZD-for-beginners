# Exempel - Praktiska AZD-mallar och konfigurationer

**Lärande genom exempel - Organiserat per kapitel**
- **📚 Kursens startsida**: [AZD för nybörjare](../README.md)
- **📖 Kapitelkarta**: Exempel organiserade efter inlärningskomplexitet
- **🚀 Lokalt exempel**: [Detaljhandels Multiagent-lösning](retail-scenario.md)
- **🤖 Externa AI-exempel**: Länkar till Azure Samples-repositorier

> **📍 VIKTIGT: Lokala vs externa exempel**  
> Detta repository innehåller **4 kompletta lokala exempel** med fullständiga implementationer:  
> - **Microsoft Foundry Models Chat** (gpt-4.1 driftsättning med chattgränssnitt)  
> - **Container Apps** (Enkel Flask-API + mikrotjänster)  
> - **Database App** (Webb + SQL-databas)  
> - **Retail Multi-Agent** (företags-AI-lösning)  
>  
> Ytterligare exempel är **externa referenser** till Azure-Samples-repositorier som du kan klona.

## Introduktion

Denna mapp innehåller praktiska exempel och referenser som hjälper dig att lära dig Azure Developer CLI genom praktisk övning. Retail Multi-Agent-scenariot är en komplett, produktionsredo implementation som ingår i detta repository. Ytterligare exempel hänvisar till officiella Azure Samples som visar olika AZD-mönster.

### Komplexitetsnivå - förklaring

- ⭐ **Nybörjare** - Grundläggande koncept, en tjänst, 15–30 minuter
- ⭐⭐ **Medel** - Flera tjänster, databasintegration, 30–60 minuter
- ⭐⭐⭐ **Avancerad** - Komplex arkitektur, AI-integration, 1–2 timmar
- ⭐⭐⭐⭐ **Expert** - Produktionsredo, företagsmönster, 2+ timmar

## 🎯 Vad som faktiskt finns i detta repository

### ✅ Lokal implementation (Redo att använda)

#### [Microsoft Foundry Models Chattapplikation](azure-openai-chat/README.md) 🆕
**Komplett gpt-4.1-driftsättning med chattgränssnitt ingår i detta repo**

- **Plats:** `examples/azure-openai-chat/`
- **Komplexitet:** ⭐⭐ (Medel)
- **Innehåll:**
  - Komplett Microsoft Foundry Models-driftsättning (gpt-4.1)
  - Python kommandoradschattgränssnitt
  - Key Vault-integration för säkra API-nycklar
  - Bicep-infrastrukturmallar
  - Tokenanvändning och kostnadsspårning
  - Hastighetsbegränsning och felhantering

**Snabbstart:**
```bash
# Navigera till exemplet
cd examples/azure-openai-chat

# Distribuera allt
azd up

# Installera beroenden och börja chatta
pip install -r src/requirements.txt
python src/chat.py
```

**Teknologier:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Container App-exempel](container-app/README.md) 🆕
**Omfattande containerdriftsättnings-exempel ingår i detta repo**

- **Plats:** `examples/container-app/`
- **Komplexitet:** ⭐-⭐⭐⭐⭐ (Från nybörjare till avancerad)
- **Innehåll:**
  - [Huvudguide](container-app/README.md) - Komplett översikt över containerdriftsättningar
  - [Enkel Flask-API](../../../examples/container-app/simple-flask-api) - Grundläggande REST API-exempel
  - [Mikrotjänster-arkitektur](../../../examples/container-app/microservices) - Produktionsredo fler-tjänsters driftsättning
  - Snabbstart, produktions- och avancerade mönster
  - Övervakning, säkerhet och kostnadsoptimering

**Snabbstart:**
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

**Teknologier:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Detaljhandels Multiagent-lösning](retail-scenario.md) 🆕
**Fullständig produktionsredo implementation ingår i detta repo**

- **Plats:** `examples/retail-multiagent-arm-template/`
- **Komplexitet:** ⭐⭐⭐⭐ (Avancerad)
- **Innehåll:**
  - Komplett ARM-driftsättningsmall
  - Multiagent-arkitektur (Kund + Lager)
  - Microsoft Foundry Models-integration
  - AI-sökning med RAG
  - Omfattande övervakning
  - Driftsättningsskript med ett klick

**Snabbstart:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Teknologier:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Externa Azure Samples (Klona för användning)

Följande exempel underhålls i officiella Azure-Samples-repositorier. Klona dem för att utforska olika AZD-mönster:

### Enkla applikationer (Kapitel 1-2)

| Mall | Repository | Komplexitet | Tjänster |
|:---------|:-----------|:-----------|:---------|
| **Python Flask-API** | [Lokal: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Mikrotjänster** | [Lokal: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Fler-tjänster, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask-container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Hur du använder:**
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
| **Microsoft Foundry Models Chatt** | [Lokal: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1-driftsättning |
| **AI Chat Snabbstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Grundläggande AI-chatt |
| **AI-agenter** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agentramverk |
| **Search + OpenAI-demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG-mönster |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Företags-AI |

### Databas & avancerade mönster (Kapitel 3-8)

| Mall | Repository | Komplexitet | Fokus |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Databasintegration |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverlöst |
| **Java-mikrotjänster** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Fler-tjänster |
| **ML-pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Lärandemål

Genom att arbeta med dessa exempel kommer du att:
- Öva Azure Developer CLI-arbetsflöden med realistiska applikationsscenarier
- Förstå olika applikationsarkitekturer och deras azd-implementationer
- Bemästra Infrastructure as Code-mönster för olika Azure-tjänster
- Tillämpa konfigurationshantering och miljöspecifika driftsättningsstrategier
- Implementera övervakning, säkerhet och skalningsmönster i praktiska sammanhang
- Bygga erfarenhet av felsökning och debugging av verkliga driftsättningsscenarier

## Läranderesultat

När du har slutfört dessa exempel kommer du att kunna:
- Driftsätta olika applikationstyper med Azure Developer CLI med självförtroende
- Anpassa tillhandahållna mallar till dina egna applikationskrav
- Designa och implementera anpassade infrastrukturmönster med Bicep
- Konfigurera komplexa flertjänstapplikationer med korrekta beroenden
- Tillämpa säkerhets-, övervaknings- och prestandabästa praxis i verkliga scenarier
- Felsöka och optimera driftsättningar baserat på praktisk erfarenhet

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

## Snabbstarts-exempel

> **💡 Ny till AZD?** Börja med exempel #1 (Flask-API) - det tar ~20 minuter och lär ut kärnkoncepten.

### För nybörjare
1. **[Container App - Python Flask-API](../../../examples/container-app/simple-flask-api)** (Lokal) ⭐  
   Driftsätt ett enkelt REST API med skalning till noll  
   **Tid:** 20–25 minuter | **Kostnad:** $0-5/månad  
   **Du lär dig:** Grundläggande azd-arbetsflöde, containerisering, hälsokontroller  
   **Förväntat resultat:** Funktionell API-endpoint som returnerar "Hello, World!" med övervakning

2. **[Enkel webbapp - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Driftsätt en Node.js Express-webbapplikation med MongoDB  
   **Tid:** 25–35 minuter | **Kostnad:** $10-30/månad  
   **Du lär dig:** Databasintegration, miljövariabler, anslutningssträngar  
   **Förväntat resultat:** Todo-listapp med skapa/läsa/uppdatera/radera-funktionalitet

3. **[Statisk webbplats - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Distribuera en statisk React-webbplats med Azure Static Web Apps  
   **Tid:** 20–30 minuter | **Kostnad:** $0-10/månad  
   **Du lär dig:** Statisk hosting, serverlösa funktioner, CDN-distribution  
   **Förväntat resultat:** React-gränssnitt med API-backend, automatisk SSL, global CDN

### För medelavancerade användare
4. **[Microsoft Foundry Models Chattapplikation](../../../examples/azure-openai-chat)** (Lokal) ⭐⭐  
   Driftsätt gpt-4.1 med chattgränssnitt och säker hantering av API-nycklar  
   **Tid:** 35–45 minuter | **Kostnad:** $50-200/månad  
   **Du lär dig:** Microsoft Foundry Models-driftsättning, Key Vault-integration, tokenspårning  
   **Förväntat resultat:** Fungerande chattapplikation med gpt-4.1 och kostnadsövervakning

5. **[Container App - Mikrotjänster](../../../examples/container-app/microservices)** (Lokal) ⭐⭐⭐⭐  
   Produktionsredo flertjänstarkitektur  
   **Tid:** 45–60 minuter | **Kostnad:** $50–150/månad  
   **Du lär dig:** Tjänstkommunikation, meddelandeköning, distribuerad spårning  
   **Förväntat resultat:** 2-tjänstersystem (API Gateway + Produkttjänst) med övervakning

6. **[Databasapp - C# med Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Webbapplikation med C#-API och Azure SQL-databas  
   **Tid:** 30–45 minuter | **Kostnad:** $20-80/månad  
   **Du lär dig:** Entity Framework, databas-migrationer, anslutningssäkerhet  
   **Förväntat resultat:** C#-API med Azure SQL-backend, automatisk schemadriftsättning

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions med HTTP-triggers och Cosmos DB  
   **Tid:** 30–40 minuter | **Kostnad:** $10–40/månad  
   **Du lär dig:** Händelsestyrd arkitektur, serverlös skalning, NoSQL-integration  
   **Förväntat resultat:** Funktionsapp som svarar på HTTP-förfrågningar med Cosmos DB-lagring

8. **[Mikrotjänster - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Fler-tjänsters Java-applikation med Container Apps och API-gateway  
   **Tid:** 60–90 minuter | **Kostnad:** $80-200/månad  
   **Du lär dig:** Spring Boot-driftsättning, service mesh, lastbalansering  
   **Förväntat resultat:** Flertjänstigt Java-system med tjänsteupptäckt och routning

### Microsoft Foundry-mallar

1. **[Microsoft Foundry Models Chattapp - Lokalt exempel](../../../examples/azure-openai-chat)** ⭐⭐  
   Komplett gpt-4.1-driftsättning med chattgränssnitt  
   **Tid:** 35–45 minuter | **Kostnad:** $50-200/månad  
   **Förväntat resultat:** Fungerande chattapplikation med tokenspårning och kostnadsövervakning

2. **[Azure Search + OpenAI-demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Intelligent chattapplikation med RAG-arkitektur  
   **Tid:** 60–90 minuter | **Kostnad:** $100-300/månad  
   **Förväntat resultat:** RAG-drivet chattgränssnitt med dokumentsökning och referenser

3. **[AI-dokumentbearbetning](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Dokumentanalys med Azure AI-tjänster  
   **Tid:** 40–60 minuter | **Kostnad:** $20-80/månad  
   **Förväntat resultat:** API som extraherar text, tabeller och entiteter från uppladdade dokument

4. **[Maskininlärningspipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps-arbetsflöde med Azure Machine Learning  
   **Tid:** 2–3 timmar | **Kostnad:** $150-500/månad  
   **Förväntat resultat:** Automatiserad ML-pipeline med träning, driftsättning och övervakning

### Verkliga scenarier

#### **Detaljhandels Multiagent-lösning** 🆕
**[Fullständig implementationsguide](./retail-scenario.md)**

En omfattande, produktionsredo multiagent kundsupportlösning som demonstrerar företagsklassad driftsättning av AI-applikationer med AZD. Detta scenario erbjuder:
- **Komplett arkitektur**: Multi-agent-system med specialiserade agenter för kundservice och lagerhantering
- **Produktionsinfrastruktur**: Distributioner av Microsoft Foundry Models i flera regioner, AI Search, Container Apps och omfattande övervakning
- **Klar att distribuera ARM-mall**: Enklicksdistribution med flera konfigurationslägen (Minimal/Standard/Premium)
- **Avancerade funktioner**: Red teaming-säkerhetsvalidering, ramverk för agentevaluering, kostnadsoptimering och felsökningsguider
- **Verklig affärskontext**: Kundsupportfall för detaljhandel med filuppladdningar, sökintegration och dynamisk skalning

**Tekniker**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Komplexitet**: ⭐⭐⭐⭐ (Avancerad - Produktionsklar för företag)

**Perfekt för**: AI-utvecklare, lösningsarkitekter och team som bygger produktionsklara multi-agent-system

**Snabbstart**: Distribuera hela lösningen på under 30 minuter med den medföljande ARM-mallen med `./deploy.sh -g myResourceGroup`

## 📋 Användarinstruktioner

### Förutsättningar

Innan du kör något exempel:
- ✅ Azure-prenumeration med Ägare- eller Bidragsgivare-behörighet
- ✅ Azure Developer CLI installerad ([Installationsguide](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop igång (för container-exempel)
- ✅ Lämpliga Azure-kvoter (kontrollera krav för varje exempel)

> **💰 Kostnadsvarning:** Alla exempel skapar riktiga Azure-resurser som medför kostnader. Se respektive README-filer för kostnadsuppskattningar. Kom ihåg att köra `azd down` när du är klar för att undvika fortsatt debitering.

### Köra exempel lokalt

1. **Klona eller kopiera exemplet**
   ```bash
   # Navigera till önskat exempel
   cd examples/simple-web-app
   ```

2. **Initiera AZD-miljö**
   ```bash
   # Initiera med befintlig mall
   azd init
   
   # Eller skapa en ny miljö
   azd env new my-environment
   ```

3. **Konfigurera miljön**
   ```bash
   # Sätt nödvändiga variabler
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
   - ✅ Azure-portalen visar status 'Körs'
   - ✅ Application Insights tar emot telemetri

> **⚠️ Problem?** Se [Vanliga problem](../docs/chapter-07-troubleshooting/common-issues.md) för felsökning vid distribution

### Anpassa exemplen

Varje exempel innehåller:
- **README.md** - Detaljerade installations- och anpassningsinstruktioner
- **azure.yaml** - AZD-konfiguration med kommentarer
- **infra/** - Bicep-mallar med parameterförklaringar
- **src/** - Exempelkod
- **scripts/** - Hjälpskript för vanliga uppgifter

## 🎯 Lärandemål

### Exempelkategorier

#### **Grundläggande distributioner**
- En-tjänst-applikationer
- Enkla infrastrukturmönster
- Grundläggande konfigurationshantering
- Kostnadseffektiva utvecklingsmiljöer

#### **Avancerade scenarier**
- Arkitekturer med flera tjänster
- Komplexa nätverkskonfigurationer
- Mönster för databasintegration
- Säkerhets- och regelefterlevnadsimplementationer

#### **Mönster redo för produktion**
- Hög tillgänglighet-konfigurationer
- Övervakning och observabilitet
- CI/CD-integration
- Återhämtningslösningar vid katastrof

## 📖 Exempelbeskrivningar

### Enkel webbapp - Node.js Express
**Tekniker**: Node.js, Express, MongoDB, Container Apps  
**Komplexitet**: Nybörjare  
**Koncept**: Grundläggande distribution, REST-API, NoSQL-databasintegration

### Statisk webbplats - React SPA
**Tekniker**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Komplexitet**: Nybörjare  
**Koncept**: Statisk hosting, serverlös backend, modern webbutveckling

### Container-app - Python Flask
**Tekniker**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Komplexitet**: Nybörjare  
**Koncept**: Containerisering, REST-API, scale-to-zero, health probes, övervakning  
**Plats**: [Lokalt exempel](../../../examples/container-app/simple-flask-api)

### Container-app - Mikrotjänstarkitektur
**Tekniker**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Komplexitet**: Avancerad  
**Koncept**: Arkitektur med flera tjänster, tjänstkommunikation, meddelandeköer, distribuerad spårning  
**Plats**: [Lokalt exempel](../../../examples/container-app/microservices)

### Databasapp - C# med Azure SQL
**Tekniker**: C# ASP.NET Core, Azure SQL Database, App Service  
**Komplexitet**: Medel  
**Koncept**: Entity Framework, databasanslutningar, web API-utveckling

### Serverlös funktion - Python Azure Functions
**Tekniker**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Komplexitet**: Medel  
**Koncept**: Händelsestyrd arkitektur, serverlös databehandling, fullstack-utveckling

### Mikrotjänster - Java Spring Boot
**Tekniker**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Komplexitet**: Medel  
**Koncept**: Tjänstkommunikation, distribuerade system, företagsmönster

### Microsoft Foundry-exempel

#### Microsoft Foundry Models Chatt-app
**Tekniker**: Microsoft Foundry Models, Cognitive Search, App Service  
**Komplexitet**: Medel  
**Koncept**: RAG-arkitektur, vektorsökning, LLM-integration

#### AI-dokumentbearbetning
**Tekniker**: Azure AI Document Intelligence, Storage, Functions  
**Komplexitet**: Medel  
**Koncept**: Dokumentanalys, OCR, datautvinning

#### Maskininlärningspipeline
**Tekniker**: Azure ML, MLOps, Container Registry  
**Komplexitet**: Avancerad  
**Koncept**: Modellträning, distributionspipelines, övervakning

## 🛠 Konfigurationsexempel

Mappen `configurations/` innehåller återanvändbara komponenter:

### Miljökonfigurationer
- Utvecklingsmiljöinställningar
- Staging-miljökonfigurationer
- Produktionsklara konfigurationer
- Distribueringsinställningar för flera regioner

### Bicep-moduler
- Återanvändbara infrastrukturkomponenter
- Vanliga resursmönster
- Säkerhetshärdade mallar
- Kostnadsoptimerade konfigurationer

### Hjälpskript
- Automatisering av miljöuppsättning
- Databas-migreringsskript
- Verktyg för validering av distribution
- Verktyg för kostnadsövervakning

## 🔧 Anpassningsguide

### Anpassa exempel för ditt användningsfall

1. **Granska förutsättningar**
   - Kontrollera Azure-tjänsternas krav
   - Verifiera prenumerationsgränser
   - Förstå kostnadsimplikationerna

2. **Ändra konfigurationen**
   - Uppdatera service-definitionerna i `azure.yaml`
   - Anpassa Bicep-mallar
   - Justera miljövariabler

3. **Testa noggrant**
   - Distribuera till utvecklingsmiljön först
   - Validera funktionalitet
   - Testa skalning och prestanda

4. **Säkerhetsgranskning**
   - Granska åtkomstkontroller
   - Implementera hantering av hemligheter
   - Aktivera övervakning och larm

## 📊 Jämförelsematris

| Exempel | Tjänster | Databas | Autentisering | Övervakning | Komplexitet |
|---------|----------|----------|---------------|------------|------------|
| **Microsoft Foundry Models Chat** (Lokalt) | 2 | ❌ | Key Vault | Fullständig | ⭐⭐ |
| **Python Flask API** (Lokalt) | 1 | ❌ | Grundläggande | Fullständig | ⭐ |
| **Microservices** (Lokalt) | 5+ | ✅ | Företag | Avancerad | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Grundläggande | Grundläggande | ⭐ |
| React SPA + Functions | 3 | ✅ | Grundläggande | Fullständig | ⭐ |
| Python Flask Container | 2 | ❌ | Grundläggande | Fullständig | ⭐ |
| C# Web API + SQL | 2 | ✅ | Fullständig | Fullständig | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Fullständig | Fullständig | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Fullständig | Fullständig | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | Fullständig | Fullständig | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Grundläggande | Fullständig | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Fullständig | Fullständig | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Lokalt) | **8+** | **✅** | **Företag** | **Avancerad** | **⭐⭐⭐⭐** |

## 🎓 Lärandespår

### Rekommenderad ordning

1. **Börja med enkel webbapp**
   - Lär dig grundläggande AZD-koncept
   - Förstå distributionsarbetsflödet
   - Öva miljöhantering

2. **Prova statisk webbplats**
   - Utforska olika hostingalternativ
   - Lär dig om CDN-integration
   - Förstå DNS-konfiguration

3. **Gå vidare till Container App**
   - Lär dig containeriseringsgrunder
   - Förstå skalningskoncept
   - Öva med Docker

4. **Lägg till databasintegration**
   - Lär dig databasprovisionering
   - Förstå connection strings
   - Öva hantering av hemligheter

5. **Utforska serverless**
   - Förstå händelsestyrd arkitektur
   - Lär dig om triggers och bindings
   - Öva med API:er

6. **Bygg mikrotjänster**
   - Lär dig tjänstkommunikation
   - Förstå distribuerade system
   - Öva komplexa distributioner

## 🔍 Hitta rätt exempel

### Efter teknologistack
- **Container Apps**: [Python Flask API (Lokalt)](../../../examples/container-app/simple-flask-api), [Microservices (Lokalt)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo-app, [Microservices API Gateway (Lokalt)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Lokalt)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Lokalt)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Lokalt)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Microservices User Service (Lokalt)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Lokalt)](../../../examples/container-app/simple-flask-api), [Microservices (Lokalt)](../../../examples/container-app/microservices), Java Microservices
- **Databaser**: [Microservices (Lokalt)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (Lokalt)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Microsoft Foundry Models Chat (Lokalt)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (Lokalt)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Efter arkitekturpattern
- **Enkel REST API**: [Python Flask API (Lokalt)](../../../examples/container-app/simple-flask-api)
- **Monolitisk**: Node.js Express Todo, C# Web API + SQL
- **Statisk + serverless**: React SPA + Functions, Python Functions + SPA
- **Mikrotjänster**: [Production Microservices (Lokalt)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containeriserad**: [Python Flask (Lokalt)](../../../examples/container-app/simple-flask-api), [Microservices (Lokalt)](../../../examples/container-app/microservices)
- **AI-driven**: **[Microsoft Foundry Models Chat (Lokalt)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-agent-arkitektur**: **Retail Multi-Agent Solution**
- **Företags-multi-tjänst**: [Microservices (Lokalt)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Efter komplexitetsnivå
- **Nybörjare**: [Python Flask API (Lokalt)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Medel**: **[Microsoft Foundry Models Chat (Lokalt)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **Avancerad**: ML Pipeline
- **Produktionsklar för företag**: [Microservices (Lokalt)](../../../examples/container-app/microservices) (Flera tjänster med meddelandeköning), **Retail Multi-Agent Solution** (Komplett multi-agent-system med ARM-mall för distribution)

## 📚 Ytterligare resurser

### Dokumentlänkar
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
- [Todo App with Node.js and PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web App with C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions with Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Bästa praxis
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Bidra med exempel

Har du ett användbart exempel att dela? Vi välkomnar bidrag!

### Inlämningsriktlinjer
1. Följ den etablerade katalogstrukturen
2. Inkludera en omfattande README.md
3. Lägg till kommentarer i konfigurationsfiler
4. Testa noggrant innan du skickar in
5. Bifoga kostnadsuppskattningar och förutsättningar

### Exempel på mallstruktur
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

**Proffstips**: Börja med det enklaste exemplet som matchar din teknologistack, och arbeta sedan gradvis upp till mer komplexa scenarier. Varje exempel bygger på koncept från de föregående!

## 🚀 Redo att komma igång?

### Din inlärningsväg

1. **Helt nybörjare?** → Börja med [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 min)
2. **Har du grundläggande AZD-kunskaper?** → Prova [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 min)
3. **Bygger du AI-appar?** → Börja med [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 min) eller utforska [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ timmar)
4. **Behöver du en viss teknologistack?** → Använd avsnittet [Finding the Right Example](../../../examples) ovan

### Nästa steg

- ✅ Granska [Förutsättningar](../../../examples) ovan
- ✅ Välj ett exempel som matchar din kunskapsnivå (se [Complexity Legend](../../../examples))
- ✅ Läs exemplets README noggrant innan distribution
- ✅ Sätt en påminnelse att köra `azd down` efter testning
- ✅ Dela dina erfarenheter via GitHub Issues eller Discussions

### Behöver hjälp?

- 📖 [FAQ](../resources/faq.md) - Vanliga frågor besvarade
- 🐛 [Troubleshooting Guide](../docs/chapter-07-troubleshooting/common-issues.md) - Åtgärda distributionsproblem
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Fråga communityn
- 📚 [Study Guide](../resources/study-guide.md) - Fördjupa din inlärning

---

**Navigering**
- **📚 Kursens startsida**: [AZD For Beginners](../README.md)
- **📖 Studiematerial**: [Study Guide](../resources/study-guide.md) | [Cheat Sheet](../resources/cheat-sheet.md) | [Glossary](../resources/glossary.md)
- **🔧 Resurser**: [FAQ](../resources/faq.md) | [Troubleshooting](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Senast uppdaterad: November 2025 | [Rapportera problem](https://github.com/microsoft/AZD-for-beginners/issues) | [Bidra med exempel](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Ansvarsfriskrivning:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, vänligen observera att automatiska översättningar kan innehålla fel eller brister. Originaldokumentet på dess ursprungliga språk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->