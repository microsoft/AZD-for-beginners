<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "4a896781acb2a7bebb3c4c66c4f46e7f",
  "translation_date": "2025-11-21T08:21:11+00:00",
  "source_file": "examples/README.md",
  "language_code": "sv"
}
-->
# Exempel - Praktiska AZD-mallar och konfigurationer

**Lär dig genom exempel - Organiserat per kapitel**
- **📚 Kursens startsida**: [AZD För Nybörjare](../README.md)
- **📖 Kapitelindelning**: Exempel organiserade efter lärandekomplexitet
- **🚀 Lokalt exempel**: [Detaljhandel Multi-Agent Lösning](retail-scenario.md)
- **🤖 Externa AI-exempel**: Länkar till Azure Samples-repositorier

> **📍 VIKTIGT: Lokala vs Externa Exempel**  
> Detta repository innehåller **4 kompletta lokala exempel** med fullständiga implementationer:  
> - **Azure OpenAI Chat** (GPT-4-distribution med chattgränssnitt)  
> - **Container Apps** (Enkel Flask API + Mikrotjänster)  
> - **Databasapp** (Webb + SQL-databas)  
> - **Detaljhandel Multi-Agent** (Företagslösning med AI)  
>  
> Ytterligare exempel är **externa referenser** till Azure-Samples-repositorier som du kan klona.

## Introduktion

Denna katalog tillhandahåller praktiska exempel och referenser för att hjälpa dig att lära dig Azure Developer CLI genom praktisk övning. Detaljhandel Multi-Agent-scenariot är en komplett, produktionsklar implementation som ingår i detta repository. Ytterligare exempel hänvisar till officiella Azure Samples som demonstrerar olika AZD-mönster.

### Komplexitetsklassificering

- ⭐ **Nybörjare** - Grundläggande koncept, en tjänst, 15-30 minuter
- ⭐⭐ **Mellanliggande** - Flera tjänster, databasintegration, 30-60 minuter
- ⭐⭐⭐ **Avancerad** - Komplex arkitektur, AI-integration, 1-2 timmar
- ⭐⭐⭐⭐ **Expert** - Produktionsklar, företagsmönster, 2+ timmar

## 🎯 Vad finns faktiskt i detta repository

### ✅ Lokal implementation (Redo att använda)

#### [Azure OpenAI Chattapplikation](azure-openai-chat/README.md) 🆕
**Komplett GPT-4-distribution med chattgränssnitt ingår i detta repo**

- **Plats:** `examples/azure-openai-chat/`
- **Komplexitet:** ⭐⭐ (Mellanliggande)
- **Vad som ingår:**
  - Komplett Azure OpenAI-distribution (GPT-4)
  - Python-kommandoradsgränssnitt för chatt
  - Key Vault-integration för säkra API-nycklar
  - Bicep-infrastrukturmallar
  - Tokenanvändning och kostnadsspårning
  - Begränsning av hastighet och felhantering

**Snabbstart:**
```bash
# Navigera till exempel
cd examples/azure-openai-chat

# Distribuera allt
azd up

# Installera beroenden och börja chatta
pip install -r src/requirements.txt
python src/chat.py
```

**Teknologier:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Container App Exempel](container-app/README.md) 🆕
**Omfattande containerdistributions-exempel ingår i detta repo**

- **Plats:** `examples/container-app/`
- **Komplexitet:** ⭐-⭐⭐⭐⭐ (Nybörjare till Expert)
- **Vad som ingår:**
  - [Huvudguide](container-app/README.md) - Komplett översikt över containerdistributioner
  - [Enkel Flask API](../../../examples/container-app/simple-flask-api) - Grundläggande REST API-exempel
  - [Mikrotjänstarkitektur](../../../examples/container-app/microservices) - Produktionsklar multi-tjänstdistribution
  - Snabbstart, produktions- och avancerade mönster
  - Övervakning, säkerhet och kostnadsoptimering

**Snabbstart:**
```bash
# Visa huvudguide
cd examples/container-app

# Distribuera enkel Flask-API
cd simple-flask-api
azd up

# Distribuera exempel på mikrotjänster
cd ../microservices
azd up
```

**Teknologier:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Detaljhandel Multi-Agent Lösning](retail-scenario.md) 🆕
**Komplett produktionsklar implementation ingår i detta repo**

- **Plats:** `examples/retail-multiagent-arm-template/`
- **Komplexitet:** ⭐⭐⭐⭐ (Avancerad)
- **Vad som ingår:**
  - Komplett ARM-distributionsmall
  - Multi-agent arkitektur (Kund + Lager)
  - Azure OpenAI-integration
  - AI-sökning med RAG
  - Omfattande övervakning
  - Enklicksdistributionsskript

**Snabbstart:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Teknologier:** Azure OpenAI, AI-sökning, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Externa Azure Samples (Klona för att använda)

Följande exempel underhålls i officiella Azure-Samples-repositorier. Klona dem för att utforska olika AZD-mönster:

### Enkla applikationer (Kapitel 1-2)

| Mall | Repository | Komplexitet | Tjänster |
|:-----|:-----------|:------------|:---------|
| **Python Flask API** | [Lokal: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Mikrotjänster** | [Lokal: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-tjänst, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Hur man använder:**
```bash
# Klona ett exempel
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Distribuera
azd up
```

### AI-applikationsexempel (Kapitel 2, 5, 8)

| Mall | Repository | Komplexitet | Fokus |
|:-----|:-----------|:------------|:------|
| **Azure OpenAI Chat** | [Lokal: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | GPT-4-distribution |
| **AI Chat Snabbstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Grundläggande AI-chatt |
| **AI-agenter** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agentramverk |
| **Sök + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG-mönster |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Företags-AI |

### Databas & Avancerade mönster (Kapitel 3-8)

| Mall | Repository | Komplexitet | Fokus |
|:-----|:-----------|:------------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Databasintegration |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverlös |
| **Java Mikrotjänster** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-tjänst |
| **ML-pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Lärandemål

Genom att arbeta med dessa exempel kommer du att:
- Öva på Azure Developer CLI-arbetsflöden med realistiska applikationsscenarier
- Förstå olika applikationsarkitekturer och deras azd-implementationer
- Bemästra Infrastructure as Code-mönster för olika Azure-tjänster
- Tillämpa konfigurationshantering och miljöspecifika distributionsstrategier
- Implementera övervakning, säkerhet och skalningsmönster i praktiska sammanhang
- Bygga erfarenhet av felsökning och debugging av verkliga distributionsscenarier

## Läranderesultat

Efter att ha slutfört dessa exempel kommer du att kunna:
- Distribuera olika applikationstyper med Azure Developer CLI med självförtroende
- Anpassa tillhandahållna mallar till dina egna applikationskrav
- Designa och implementera anpassade infrastrukturmönster med Bicep
- Konfigurera komplexa multi-tjänstapplikationer med korrekta beroenden
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

> **💡 Ny på AZD?** Börja med exempel #1 (Flask API) - det tar ~20 minuter och lär ut kärnkoncept.

### För Nybörjare
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Lokal) ⭐  
   Distribuera ett enkelt REST API med scale-to-zero  
   **Tid:** 20-25 minuter | **Kostnad:** $0-5/månad  
   **Du lär dig:** Grundläggande azd-arbetsflöde, containerisering, hälsokontroller  
   **Förväntat resultat:** Fungerande API-slutpunkt som returnerar "Hello, World!" med övervakning

2. **[Enkel Webbapp - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Distribuera en Node.js Express-webbapplikation med MongoDB  
   **Tid:** 25-35 minuter | **Kostnad:** $10-30/månad  
   **Du lär dig:** Databasintegration, miljövariabler, anslutningssträngar  
   **Förväntat resultat:** Todo-lista-app med skapa/läsa/uppdatera/radera-funktionalitet

3. **[Statisk Webbplats - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Värd för en React statisk webbplats med Azure Static Web Apps  
   **Tid:** 20-30 minuter | **Kostnad:** $0-10/månad  
   **Du lär dig:** Statisk hosting, serverlösa funktioner, CDN-distribution  
   **Förväntat resultat:** React UI med API-backend, automatisk SSL, global CDN

### För Mellanliggande Användare
4. **[Azure OpenAI Chattapplikation](../../../examples/azure-openai-chat)** (Lokal) ⭐⭐  
   Distribuera GPT-4 med chattgränssnitt och säker API-nyckelhantering  
   **Tid:** 35-45 minuter | **Kostnad:** $50-200/månad  
   **Du lär dig:** Azure OpenAI-distribution, Key Vault-integration, token-spårning  
   **Förväntat resultat:** Fungerande chattapplikation med GPT-4 och kostnadsövervakning

5. **[Container App - Mikrotjänster](../../../examples/container-app/microservices)** (Lokal) ⭐⭐⭐⭐  
   Produktionsklar multi-tjänstarkitektur  
   **Tid:** 45-60 minuter | **Kostnad:** $50-150/månad  
   **Du lär dig:** Tjänstkommunikation, meddelandeköer, distribuerad spårning  
   **Förväntat resultat:** 2-tjänstsystem (API Gateway + Produktservice) med övervakning

6. **[Databasapp - C# med Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Webbapplikation med C# API och Azure SQL-databas  
   **Tid:** 30-45 minuter | **Kostnad:** $20-80/månad  
   **Du lär dig:** Entity Framework, databas-migreringar, anslutningssäkerhet  
   **Förväntat resultat:** C# API med Azure SQL-backend, automatisk schemadistribution

7. **[Serverlös Funktion - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions med HTTP-triggers och Cosmos DB  
   **Tid:** 30-40 minuter | **Kostnad:** $10-40/månad  
   **Du lär dig:** Händelsedriven arkitektur, serverlös skalning, NoSQL-integration  
   **Förväntat resultat:** Funktionsapp som svarar på HTTP-förfrågningar med Cosmos DB-lagring

8. **[Mikrotjänster - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Multi-tjänst Java-applikation med Container Apps och API-gateway  
   **Tid:** 60-90 minuter | **Kostnad:** $80-200/månad  
   **Du lär dig:** Spring Boot-distribution, tjänstnät, lastbalansering  
   **Förväntat resultat:** Multi-tjänst Java-system med tjänstupptäckt och routing

### Azure AI Foundry Mallar

1. **[Azure OpenAI Chattapp - Lokalt Exempel](../../../examples/azure-openai-chat)** ⭐⭐  
   Komplett GPT-4-distribution med chattgränssnitt  
   **Tid:** 35-45 minuter | **Kostnad:** $50-200/månad  
   **Förväntat resultat:** Fungerande chattapplikation med token-spårning och kostnadsövervakning

2. **[Azure Sök + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Intelligent chattapplikation med RAG-arkitektur  
   **Tid:** 60-90 minuter | **Kostnad:** $100-300/månad  
   **Förväntat resultat:** RAG-driven chattgränssnitt med dokumentsökning och citat

3. **[AI Dokumentbearbetning](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Dokumentanalys med Azure AI-tjänster  
   **Tid:** 40-60 minuter | **Kostnad:** $20-80/månad  
   **Förväntat resultat:** API som extraherar text, tabeller och entiteter från uppladdade dokument

4. **[Maskininlärningspipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps-arbetsflöde med Azure Machine Learning  
   **Tid:** 2-3 timmar | **Kostnad:** $150-500/månad  
   **Förväntat resultat:** Automatiserad ML-pipeline med träning, distribution och övervakning

### Verkliga Scenarier

#### **Detaljhandel Multi-Agent Lösning** 🆕
**[Komplett Implementeringsguide](./retail-scenario.md)**

En omfattande, produktionsklar multi-agent kundsupportlösning som demonstrerar företagsklass AI-applikationsdistribution med AZD. Detta scenario tillhandahåller:

- **Komplett Arkitektur**: Multi-agent system med specialiserade kundservice- och lagerhanteringsagenter
- **Produktionsinfrastruktur**: Multi-region Azure OpenAI-distributioner, AI-sökning, Container Apps och omfattande övervakning  
- **Färdig att distribuera ARM-mall**: Ett klick för distribution med flera konfigurationslägen (Minimal/Standard/Premium)  
- **Avancerade funktioner**: Säkerhetsvalidering med red teaming, ramverk för agentutvärdering, kostnadsoptimering och felsökningsguider  
- **Verklig affärskontext**: Användningsfall för kundsupport inom detaljhandel med filuppladdningar, sökintegration och dynamisk skalning  

**Teknologier**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API  

**Komplexitet**: ⭐⭐⭐⭐ (Avancerad - Klar för företagsproduktion)  

**Perfekt för**: AI-utvecklare, lösningsarkitekter och team som bygger produktionsklara multi-agent-system  

**Snabbstart**: Distribuera hela lösningen på under 30 minuter med den medföljande ARM-mallen med `./deploy.sh -g myResourceGroup`  

## 📋 Användarinstruktioner  

### Förutsättningar  

Innan du kör något exempel:  
- ✅ Azure-prenumeration med ägar- eller bidragsgivarbehörighet  
- ✅ Azure Developer CLI installerad ([Installationsguide](../docs/getting-started/installation.md))  
- ✅ Docker Desktop igång (för containerexempel)  
- ✅ Lämpliga Azure-kvoter (kontrollera krav för specifika exempel)  

> **💰 Kostnadsvarning:** Alla exempel skapar verkliga Azure-resurser som medför kostnader. Se individuella README-filer för kostnadsuppskattningar. Kom ihåg att köra `azd down` när du är klar för att undvika löpande kostnader.  

### Köra exempel lokalt  

1. **Klona eller kopiera exempel**  
   ```bash
   # Navigera till önskat exempel
   cd examples/simple-web-app
   ```
  
2. **Initiera AZD-miljö**  
   ```bash
   # Initiera med befintlig mall
   azd init
   
   # Eller skapa ny miljö
   azd env new my-environment
   ```
  
3. **Konfigurera miljö**  
   ```bash
   # Ställ in nödvändiga variabler
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```
  
4. **Distribuera**  
   ```bash
   # Distribuera infrastruktur och applikation
   azd up
   ```
  
5. **Verifiera distribution**  
   ```bash
   # Hämta tjänstendpunkter
   azd env get-values
   
   # Testa slutpunkten (exempel)
   curl https://your-app-url.azurecontainer.io/health
   ```
  
   **Förväntade framgångsindikatorer:**  
   - ✅ `azd up` slutförs utan fel  
   - ✅ Tjänstens slutpunkt returnerar HTTP 200  
   - ✅ Azure-portalen visar status "Körs"  
   - ✅ Application Insights tar emot telemetri  

> **⚠️ Problem?** Se [Vanliga problem](../docs/troubleshooting/common-issues.md) för felsökning av distribution  

### Anpassa exempel  

Varje exempel inkluderar:  
- **README.md** - Detaljerade instruktioner för installation och anpassning  
- **azure.yaml** - AZD-konfiguration med kommentarer  
- **infra/** - Bicep-mallar med parameterförklaringar  
- **src/** - Exempelkod för applikationer  
- **scripts/** - Hjälpskript för vanliga uppgifter  

## 🎯 Inlärningsmål  

### Exempelkategorier  

#### **Grundläggande distributioner**  
- Applikationer med en tjänst  
- Enkla infrastrukturmönster  
- Grundläggande konfigurationshantering  
- Kostnadseffektiva utvecklingsmiljöer  

#### **Avancerade scenarier**  
- Arkitekturer med flera tjänster  
- Komplexa nätverkskonfigurationer  
- Databasintegrationsmönster  
- Implementeringar för säkerhet och efterlevnad  

#### **Produktionsklara mönster**  
- Konfigurationer för hög tillgänglighet  
- Övervakning och observabilitet  
- CI/CD-integration  
- Återställningsplaner vid katastrofer  

## 📖 Exempelbeskrivningar  

### Enkel webbapp - Node.js Express  
**Teknologier**: Node.js, Express, MongoDB, Container Apps  
**Komplexitet**: Nybörjare  
**Koncept**: Grundläggande distribution, REST API, NoSQL-databasintegration  

### Statisk webbplats - React SPA  
**Teknologier**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Komplexitet**: Nybörjare  
**Koncept**: Statisk hosting, serverlös backend, modern webbutveckling  

### Container App - Python Flask  
**Teknologier**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Komplexitet**: Nybörjare  
**Koncept**: Containerisering, REST API, skalning till noll, hälsokontroller, övervakning  
**Plats**: [Lokalt exempel](../../../examples/container-app/simple-flask-api)  

### Container App - Mikrotjänstarkitektur  
**Teknologier**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Komplexitet**: Avancerad  
**Koncept**: Arkitektur med flera tjänster, tjänstekommunikation, meddelandeköer, distribuerad spårning  
**Plats**: [Lokalt exempel](../../../examples/container-app/microservices)  

### Databasapp - C# med Azure SQL  
**Teknologier**: C# ASP.NET Core, Azure SQL Database, App Service  
**Komplexitet**: Medel  
**Koncept**: Entity Framework, databasanslutningar, utveckling av web API  

### Serverlös funktion - Python Azure Functions  
**Teknologier**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Komplexitet**: Medel  
**Koncept**: Händelsedriven arkitektur, serverlös databehandling, fullstackutveckling  

### Mikrotjänster - Java Spring Boot  
**Teknologier**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Komplexitet**: Medel  
**Koncept**: Kommunikation mellan mikrotjänster, distribuerade system, företagsmönster  

### Azure AI Foundry-exempel  

#### Azure OpenAI Chat App  
**Teknologier**: Azure OpenAI, Cognitive Search, App Service  
**Komplexitet**: Medel  
**Koncept**: RAG-arkitektur, vektorsökning, LLM-integration  

#### AI-dokumentbehandling  
**Teknologier**: Azure AI Document Intelligence, Storage, Functions  
**Komplexitet**: Medel  
**Koncept**: Dokumentanalys, OCR, datautvinning  

#### Maskininlärningspipeline  
**Teknologier**: Azure ML, MLOps, Container Registry  
**Komplexitet**: Avancerad  
**Koncept**: Modellträning, distributionspipelines, övervakning  

## 🛠 Konfigurationsexempel  

Katalogen `configurations/` innehåller återanvändbara komponenter:  

### Miljökonfigurationer  
- Inställningar för utvecklingsmiljö  
- Konfigurationer för stagingmiljö  
- Produktionsklara konfigurationer  
- Distributioner över flera regioner  

### Bicep-moduler  
- Återanvändbara infrastrukturkomponenter  
- Vanliga resursmönster  
- Säkerhetshärdade mallar  
- Kostnadsoptimerade konfigurationer  

### Hjälpskript  
- Automatisering av miljöinställningar  
- Skript för databas-migrering  
- Verktyg för validering av distribution  
- Verktyg för kostnadsövervakning  

## 🔧 Anpassningsguide  

### Anpassa exempel för ditt användningsfall  

1. **Granska förutsättningar**  
   - Kontrollera krav för Azure-tjänster  
   - Verifiera prenumerationsgränser  
   - Förstå kostnadsimplikationer  

2. **Modifiera konfiguration**  
   - Uppdatera tjänstedefinitioner i `azure.yaml`  
   - Anpassa Bicep-mallar  
   - Justera miljövariabler  

3. **Testa noggrant**  
   - Distribuera först till utvecklingsmiljö  
   - Validera funktionalitet  
   - Testa skalning och prestanda  

4. **Säkerhetsgranskning**  
   - Granska åtkomstkontroller  
   - Implementera hantering av hemligheter  
   - Aktivera övervakning och larm  

## 📊 Jämförelsematris  

| Exempel | Tjänster | Databas | Autentisering | Övervakning | Komplexitet |  
|---------|----------|----------|---------------|-------------|-------------|  
| **Azure OpenAI Chat** (Lokalt) | 2 | ❌ | Key Vault | Full | ⭐⭐ |  
| **Python Flask API** (Lokalt) | 1 | ❌ | Grundläggande | Full | ⭐ |  
| **Mikrotjänster** (Lokalt) | 5+ | ✅ | Företag | Avancerad | ⭐⭐⭐⭐ |  
| Node.js Express Todo | 2 | ✅ | Grundläggande | Grundläggande | ⭐ |  
| React SPA + Functions | 3 | ✅ | Grundläggande | Full | ⭐ |  
| Python Flask Container | 2 | ❌ | Grundläggande | Full | ⭐ |  
| C# Web API + SQL | 2 | ✅ | Full | Full | ⭐⭐ |  
| Python Functions + SPA | 3 | ✅ | Full | Full | ⭐⭐ |  
| Java Mikrotjänster | 5+ | ✅ | Full | Full | ⭐⭐ |  
| Azure OpenAI Chat | 3 | ✅ | Full | Full | ⭐⭐⭐ |  
| AI-dokumentbehandling | 2 | ❌ | Grundläggande | Full | ⭐⭐ |  
| ML-pipeline | 4+ | ✅ | Full | Full | ⭐⭐⭐⭐ |  
| **Detaljhandel Multi-Agent** (Lokalt) | **8+** | **✅** | **Företag** | **Avancerad** | **⭐⭐⭐⭐** |  

## 🎓 Inlärningsväg  

### Rekommenderad progression  

1. **Börja med enkel webbapp**  
   - Lär dig grundläggande AZD-koncept  
   - Förstå distributionsflödet  
   - Öva på miljöhantering  

2. **Prova statisk webbplats**  
   - Utforska olika hostingalternativ  
   - Lär dig om CDN-integration  
   - Förstå DNS-konfiguration  

3. **Gå vidare till Container App**  
   - Lär dig grunderna i containerisering  
   - Förstå skalningskoncept  
   - Öva med Docker  

4. **Lägg till databasintegration**  
   - Lär dig databasprovisionering  
   - Förstå anslutningssträngar  
   - Öva på hantering av hemligheter  

5. **Utforska serverlös**  
   - Förstå händelsedriven arkitektur  
   - Lär dig om triggers och bindningar  
   - Öva med API:er  

6. **Bygg mikrotjänster**  
   - Lär dig tjänstekommunikation  
   - Förstå distribuerade system  
   - Öva på komplexa distributioner  

## 🔍 Hitta rätt exempel  

### Efter teknologistack  
- **Container Apps**: [Python Flask API (Lokalt)](../../../examples/container-app/simple-flask-api), [Mikrotjänster (Lokalt)](../../../examples/container-app/microservices), Java Mikrotjänster  
- **Node.js**: Node.js Express Todo App, [Mikrotjänster API Gateway (Lokalt)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (Lokalt)](../../../examples/container-app/simple-flask-api), [Mikrotjänster Produktservice (Lokalt)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [Mikrotjänster Order Service (Lokalt)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, ML-pipeline  
- **Go**: [Mikrotjänster Användarservice (Lokalt)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot Mikrotjänster  
- **React**: React SPA + Functions  
- **Containers**: [Python Flask (Lokalt)](../../../examples/container-app/simple-flask-api), [Mikrotjänster (Lokalt)](../../../examples/container-app/microservices), Java Mikrotjänster  
- **Databaser**: [Mikrotjänster (Lokalt)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **AI/ML**: **[Azure OpenAI Chat (Lokalt)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI-dokumentbehandling, ML-pipeline, **Detaljhandel Multi-Agent-lösning**  
- **Multi-Agent-system**: **Detaljhandel Multi-Agent-lösning**  
- **OpenAI-integration**: **[Azure OpenAI Chat (Lokalt)](../../../examples/azure-openai-chat)**, Detaljhandel Multi-Agent-lösning  
- **Företagsproduktion**: [Mikrotjänster (Lokalt)](../../../examples/container-app/microservices), **Detaljhandel Multi-Agent-lösning**  

### Efter arkitekturmönster  
- **Enkel REST API**: [Python Flask API (Lokalt)](../../../examples/container-app/simple-flask-api)  
- **Monolitisk**: Node.js Express Todo, C# Web API + SQL  
- **Statisk + Serverlös**: React SPA + Functions, Python Functions + SPA  
- **Mikrotjänster**: [Produktionsmikrotjänster (Lokalt)](../../../examples/container-app/microservices), Java Spring Boot Mikrotjänster  
- **Containeriserad**: [Python Flask (Lokalt)](../../../examples/container-app/simple-flask-api), [Mikrotjänster (Lokalt)](../../../examples/container-app/microservices)  
- **AI-drivet**: **[Azure OpenAI Chat (Lokalt)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI-dokumentbehandling, ML-pipeline, **Detaljhandel Multi-Agent-lösning**  
- **Multi-Agent-arkitektur**: **Detaljhandel Multi-Agent-lösning**  
- **Företagslösning med flera tjänster**: [Mikrotjänster (Lokalt)](../../../examples/container-app/microservices), **Detaljhandel Multi-Agent-lösning**  

### Efter komplexitetsnivå  
- **Nybörjare**: [Python Flask API (Lokalt)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **Medel**: **[Azure OpenAI Chat (Lokalt)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Mikrotjänster, Azure OpenAI Chat App, AI-dokumentbehandling  
- **Avancerad**: ML-pipeline  
- **Företagsproduktion**: [Mikrotjänster (Lokalt)](../../../examples/container-app/microservices) (Flera tjänster med meddelandeköer), **Detaljhandel Multi-Agent-lösning** (Komplett multi-agent-system med ARM-mall för distribution)  

## 📚 Ytterligare resurser  

### Dokumentationslänkar  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)  
- [Bicep-dokumentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  

### Community-exempel  
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)  
- [Azure AI Foundry Templates](https://github.com/Azure/ai-foundry-templates)  
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)  
- [Todo App med C# och Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)  
- [Todo App med Python och MongoDB](https://github.com/Azure-Samples/todo-python-mongo)  
- [Todo App med Node.js och PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web App med C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Jobb](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions med Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Bästa praxis
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Bidra med exempel

Har du ett användbart exempel att dela? Vi välkomnar bidrag!

### Riktlinjer för inskick
1. Följ den etablerade katalogstrukturen
2. Inkludera en omfattande README.md
3. Lägg till kommentarer i konfigurationsfiler
4. Testa noggrant innan du skickar in
5. Inkludera kostnadsuppskattningar och förutsättningar

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

**Tips**: Börja med det enklaste exemplet som matchar din teknologiska stack, och arbeta dig gradvis upp till mer komplexa scenarier. Varje exempel bygger på koncept från de tidigare!

## 🚀 Redo att börja?

### Din inlärningsväg

1. **Helt nybörjare?** → Börja med [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 min)
2. **Har grundläggande AZD-kunskaper?** → Testa [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 min)
3. **Bygger AI-appar?** → Börja med [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 min) eller utforska [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ timmar)
4. **Behöver specifik teknologisk stack?** → Använd avsnittet [Hitta rätt exempel](../../../examples) ovan

### Nästa steg

- ✅ Granska [Förutsättningar](../../../examples) ovan
- ✅ Välj ett exempel som matchar din kunskapsnivå (se [Komplexitetslegend](../../../examples))
- ✅ Läs igenom exempelns README noggrant innan du distribuerar
- ✅ Sätt en påminnelse att köra `azd down` efter testning
- ✅ Dela din erfarenhet via GitHub Issues eller Diskussioner

### Behöver du hjälp?

- 📖 [FAQ](../resources/faq.md) - Vanliga frågor besvarade
- 🐛 [Felsökningsguide](../docs/troubleshooting/common-issues.md) - Åtgärda distributionsproblem
- 💬 [GitHub Diskussioner](https://github.com/microsoft/AZD-for-beginners/discussions) - Fråga communityn
- 📚 [Studieguide](../resources/study-guide.md) - Förstärk din inlärning

---

**Navigering**
- **📚 Kursens startsida**: [AZD För Nybörjare](../README.md)
- **📖 Studiematerial**: [Studieguide](../resources/study-guide.md) | [Fuskblad](../resources/cheat-sheet.md) | [Ordlista](../resources/glossary.md)
- **🔧 Resurser**: [FAQ](../resources/faq.md) | [Felsökning](../docs/troubleshooting/common-issues.md)

---

*Senast uppdaterad: November 2025 | [Rapportera problem](https://github.com/microsoft/AZD-for-beginners/issues) | [Bidra med exempel](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:  
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, bör det noteras att automatiserade översättningar kan innehålla fel eller felaktigheter. Det ursprungliga dokumentet på dess ursprungliga språk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som uppstår vid användning av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->