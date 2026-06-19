# Eksempler - Praktiske AZD-maler og konfigurasjoner

**Læring gjennom eksempler - organisert etter kapittel**  
- **📚 Kurs Hjem**: [AZD For Beginners](../README.md)  
- **📖 Kapittelkartlegging**: Eksempler organisert etter læringskompleksitet  
- **🚀 Lokalt Eksempel**: [Retail Multi-Agent Solution](retail-scenario.md)  
- **🤖 Eksterne AI-eksempler**: Lenker til Azure Samples-repositorier  

> **📍 VIKTIG: Lokale vs Eksterne Eksempler**  
> Dette repositoriet inneholder **4 komplette lokale eksempler** med full implementering:  
> - **Microsoft Foundry Models Chat** (gpt-4.1-distribusjon med chat-grensesnitt)  
> - **Container Apps** (Enkel Flask API + mikrotjenester)  
> - **Database App** (Web + SQL Database)  
> - **Retail Multi-Agent** (Enterprise AI-løsning)  
>  
> Ytterligere eksempler er **eksterne referanser** til Azure-Samples repositorier som du kan klone.

## Introduksjon

Denne mappen tilbyr praktiske eksempler og referanser som hjelper deg å lære Azure Developer CLI gjennom hands-on praksis. Retail Multi-Agent-scenariet er en komplett, produksjonsklar implementering inkludert i dette repositoriet. Ytterligere eksempler refererer til offisielle Azure Samples som demonstrerer ulike AZD-mønstre.

### Kompleksitetsvurderingsnøkkel

- ⭐ **Nybegynner** - Grunnleggende konsepter, enkeltjeneste, 15-30 minutter  
- ⭐⭐ **Mellomnivå** - Flere tjenester, databaseintegrasjon, 30-60 minutter  
- ⭐⭐⭐ **Avansert** - Kompleks arkitektur, AI-integrasjon, 1-2 timer  
- ⭐⭐⭐⭐ **Ekspert** - Produksjonsklar, bedriftsmønstre, 2+ timer  

## 🎯 Hva finnes egentlig i dette repositoriet

### ✅ Lokal implementering (klar til bruk)

#### [Microsoft Foundry Models Chat Application](azure-openai-chat/README.md) 🆕  
**Komplett gpt-4.1 distribusjon med chat-grensesnitt inkludert i dette repoet**

- **Plassering:** `examples/azure-openai-chat/`  
- **Kompleksitet:** ⭐⭐ (Mellomnivå)  
- **Inkluderer:**  
  - Komplett Microsoft Foundry Models-distribusjon (gpt-4.1)  
  - Python kommandolinje chat-grensesnitt  
  - Key Vault-integrasjon for sikre API-nøkler  
  - Bicep infrastrukturmaler  
  - Sporingsverktøy for tokenbruk og kostnader  
  - Ratebegrensning og feilhåndtering  

**Rask start:**  
```bash
# Naviger til eksempel
cd examples/azure-openai-chat

# Distribuer alt
azd up

# Installer avhengigheter og start å chatte
pip install -r src/requirements.txt
python src/chat.py
```
  
**Teknologier:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep  

#### [Container App Eksempler](container-app/README.md) 🆕  
**Omfattende containermiljø-distribusjonseksempler inkludert i dette repoet**

- **Plassering:** `examples/container-app/`  
- **Kompleksitet:** ⭐-⭐⭐⭐⭐ (Nybegynner til avansert)  
- **Inkluderer:**  
  - [Master Guide](container-app/README.md) - Komplett oversikt over container-distribusjoner  
  - [Enkel Flask API](../../../examples/container-app/simple-flask-api) - Grunnleggende REST API-eksempel  
  - [Mikrotjenestearkitektur](../../../examples/container-app/microservices) - Produksjonsklar multi-tjeneste distribusjon  
  - Rask start, produksjon, og avanserte mønstre  
  - Overvåking, sikkerhet og kostnadsoptimalisering  

**Rask start:**  
```bash
# Vis hovedveiledning
cd examples/container-app

# Distribuer enkel Flask API
cd simple-flask-api
azd up

# Distribuer eksempel på mikrotjenester
cd ../microservices
azd up
```
  
**Teknologier:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights  

#### [Retail Multi-Agent Solution](retail-scenario.md) 🆕  
**Komplett produksjonsklar implementering inkludert i dette repoet**

- **Plassering:** `examples/retail-multiagent-arm-template/`  
- **Kompleksitet:** ⭐⭐⭐⭐ (Avansert)  
- **Inkluderer:**  
  - Komplett ARM-distribusjonsmal  
  - Multi-agent arkitektur (Kunde + Lager)  
  - Microsoft Foundry Models-integrasjon  
  - AI-søk med RAG  
  - Omfattende overvåking  
  - Ett-klikks distribusjonsskript  

**Rask start:**  
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```
  
**Teknologier:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights  

---

## 🔗 Eksterne Azure Samples (klon for bruk)

Følgende eksempler vedlikeholdes i offisielle Azure-Samples repositorier. Klon dem for å utforske ulike AZD-mønstre:

### Enkle applikasjoner (kapittel 1-2)

| Mal | Repositorium | Kompleksitet | Tjenester |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Lokalt: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Mikrotjenester** | [Lokalt: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multitjeneste, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Hvordan bruke:**  
```bash
# Klon et eksempel
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Distribuer
azd up
```
  
### AI applikasjonseksempler (kapittel 2, 5, 8)

| Mal | Repositorium | Kompleksitet | Fokus |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [Lokalt: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1-distribusjon |
| **AI Chat Hurtigstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Grunnleggende AI-chat |
| **AI Agenter** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agent-rammeverk |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG-mønster |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Enterprise AI |

### Database & Avanserte mønstre (kapittel 3-8)

| Mal | Repositorium | Kompleksitet | Fokus |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Databaseintegrasjon |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | Serverløs NoSQL |
| **Java Mikrotjenester** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multitjeneste |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Læringsmål

Ved å jobbe gjennom disse eksemplene vil du:  
- Øve på Azure Developer CLI-arbeidsflyter med realistiske applikasjonsscenarier  
- Forstå forskjellige applikasjonsarkitekturer og deres azd-implementeringer  
- Mestre Infrastructure as Code-mønstre for ulike Azure-tjenester  
- Anvende konfigurasjonsstyring og miljøspesifikke distribusjonsstrategier  
- Implementere overvåking, sikkerhet og skaleringsmønstre i praktiske kontekster  
- Bygge erfaring med feilsøking og debugging av ekte distribusjonsscenarier  

## Læringsutbytte

Etter å ha fullført disse eksemplene vil du kunne:  
- Distribuere ulike applikasjonstyper med Azure Developer CLI med selvtillit  
- Tilpasse tilgjengelige maler til dine egne applikasjonsbehov  
- Designe og implementere tilpassede infrastrukturmønstre ved bruk av Bicep  
- Konfigurere komplekse multitjeneste-applikasjoner med riktige avhengigheter  
- Anvende sikkerhets-, overvåkings- og ytelsesbeste praksiser i reelle scenarier  
- Feilsøke og optimalisere distribusjoner basert på praktisk erfaring  

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
  
## Rask start-eksempler

> **💡 Ny til AZD?** Start med eksempel #1 (Flask API) - det tar ca. 20 minutter og lærer deg kjernebegrepene.

### For nybegynnere  
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Lokalt) ⭐  
   Distribuer en enkel REST API med scale-to-zero  
   **Tid:** 20-25 minutter | **Kostnad:** 0-5 USD/måned  
   **Du vil lære:** Grunnleggende azd-arbeidsflyt, containerisering, helsesjekker  
   **Forventet resultat:** Fungerende API-endepunkt som returnerer "Hello, World!" med overvåking  

2. **[Enkel webapp - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Distribuer et Node.js Express webapplikasjon med MongoDB  
   **Tid:** 25-35 minutter | **Kostnad:** 10-30 USD/måned  
   **Du vil lære:** Databaseintegrasjon, miljøvariabler, tilkoblingsstrenger  
   **Forventet resultat:** Todo-listeapp med opprett/les/oppdater/slett-funksjonalitet  

3. **[Statisk nettside - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Host en React statisk nettside med Azure Static Web Apps  
   **Tid:** 20-30 minutter | **Kostnad:** 0-10 USD/måned  
   **Du vil lære:** Statisk hosting, serverløse funksjoner, CDN-distribusjon  
   **Forventet resultat:** React UI med API-backend, automatisk SSL, global CDN  

### For middels erfarne brukere  
4. **[Microsoft Foundry Models Chat-applikasjon](../../../examples/azure-openai-chat)** (Lokalt) ⭐⭐  
   Distribuer gpt-4.1 med chat-grensesnitt og sikker API-nøkkelhåndtering  
   **Tid:** 35-45 minutter | **Kostnad:** 50-200 USD/måned  
   **Du vil lære:** Microsoft Foundry Models distribusjon, Key Vault-integrasjon, token-sporing  
   **Forventet resultat:** Fungerende chat-applikasjon med gpt-4.1 og kostnadsovervåking  

5. **[Container App - Mikrotjenester](../../../examples/container-app/microservices)** (Lokalt) ⭐⭐⭐⭐  
   Produksjonsklar multitenestearkitektur  
   **Tid:** 45-60 minutter | **Kostnad:** 50-150 USD/måned  
   **Du vil lære:** Tjenestekommunikasjon, meldingkø, distribuert sporing  
   **Forventet resultat:** 2-tjeneste system (API Gateway + Produktservice) med overvåking  

6. **[Database App - C# med Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Webapplikasjon med C# API og Azure SQL Database  
   **Tid:** 30-45 minutter | **Kostnad:** 20-80 USD/måned  
   **Du vil lære:** Entity Framework, databasemigrasjoner, tilkoblingssikkerhet  
   **Forventet resultat:** C# API med Azure SQL backend, automatisk skjemadistribusjon  

7. **[Serverløs funksjon - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions med HTTP-triggere og Cosmos DB  
   **Tid:** 30-40 minutter | **Kostnad:** 10-40 USD/måned  
   **Du vil lære:** Hendelsesdrevet arkitektur, serverløs skalering, NoSQL-integrasjon  
   **Forventet resultat:** Funksjon app som svarer på HTTP-forespørsler med Cosmos DB-lagring  

8. **[Mikrotjenester - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Multiteneste Java-applikasjon med Container Apps og API-gateway  
   **Tid:** 60-90 minutter | **Kostnad:** 80-200 USD/måned  
   **Du vil lære:** Spring Boot distribusjon, tjenestemesh, lastbalansering  
   **Forventet resultat:** Multitjeneste Java-system med tjenesteoppdagelse og ruting  

### Microsoft Foundry-maler

1. **[Microsoft Foundry Models Chat App - Lokalt eksempel](../../../examples/azure-openai-chat)** ⭐⭐  
   Komplett gpt-4.1 distribusjon med chat-grensesnitt  
   **Tid:** 35-45 minutter | **Kostnad:** 50-200 USD/måned  
   **Forventet resultat:** Fungerende chat-applikasjon med token-sporing og kostnadsovervåking  

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Intelligente chat-applikasjon med RAG-arkitektur  
   **Tid:** 60-90 minutter | **Kostnad:** 100-300 USD/måned  
   **Forventet resultat:** RAG-drevet chat-grensesnitt med dokumentsøk og henvisninger  

3. **[AI Dokumentprosessering](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Dokumentanalyse ved bruk av Azure AI-tjenester  
   **Tid:** 40-60 minutter | **Kostnad:** 20-80 USD/måned  
   **Forventet resultat:** API som trekker ut tekst, tabeller og enheter fra opplastede dokumenter  

4. **[Maskinlæringspipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps-arbeidsflyt med Azure Machine Learning  
   **Tid:** 2-3 timer | **Kostnad:** 150-500 USD/måned  
   **Forventet resultat:** Automatisert ML-pipeline med trening, distribusjon og overvåking  

### Virkelige scenarier

#### **Retail Multi-Agent Solution** 🆕  
**[Fullstendig implementeringsguide](./retail-scenario.md)**

En omfattende, produksjonsklar multi-agent kundeserviceløsning som demonstrerer enterprise-grad AI-applikasjonsdistribusjon med AZD. Dette scenariet tilbyr:

- **Fullstendig arkitektur**: Multi-agent system med spesialiserte kundeservice- og lagerstyringsagenter
- **Produksjonsinfrastruktur**: Multi-region Microsoft Foundry Models-distribusjoner, AI Search, Container Apps og omfattende overvåking
- **Klar-til-distribusjon ARM-mal**: Én-klikk distribusjon med flere konfigurasjonsmoduser (Minimal/Standard/Premium)
- **Avanserte funksjoner**: Red teaming sikkerhetsvalidering, agent evalueringsrammeverk, kostnadsoptimalisering og feilsøkingsguider
- **Reell forretningskontekst**: Brukstilfelle for kundestøtte i detaljhandel med filopplastinger, søkintegrasjon og dynamisk skalering

**Teknologier**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Kompleksitet**: ⭐⭐⭐⭐ (Avansert - Enterprise produksjonsklar)

**Perfekt for**: AI-utviklere, løsningsarkitekter og team som bygger produksjonsklare multi-agent systemer

**Rask start**: Distribuer hele løsningen på under 30 minutter ved å bruke inkludert ARM-mal med `./deploy.sh -g myResourceGroup`

## 📋 Bruksanvisning

### Forutsetninger

Før du kjører noen eksempler:
- ✅ Azure-abonnement med Eier- eller Bidragsyter-tilgang
- ✅ Azure Developer CLI installert ([Installasjonsveiledning](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop kjørende (for container-eksempler)
- ✅ Passende Azure-kvoter (sjekk eksempelspesifikke krav)

> **💰 Kostnadsadvarsel:** Alle eksempler oppretter ekte Azure-ressurser som medfører kostnader. Se individuelle README-filer for kostnadsestimater. Husk å kjøre `azd down` når du er ferdig for å unngå løpende kostnader.

### Kjøre eksempler lokalt

1. **Klon eller kopier eksempel**
   ```bash
   # Naviger til ønsket eksempel
   cd examples/simple-web-app
   ```

2. **Initialiser AZD-miljø**
   ```bash
   # Initialiser med eksisterende mal
   azd init
   
   # Eller opprett nytt miljø
   azd env new my-environment
   ```

3. **Konfigurer miljø**
   ```bash
   # Sett nødvendige variabler
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Distribuer**
   ```bash
   # Distribuer infrastruktur og applikasjon
   azd up
   ```

5. **Verifiser distribusjon**
   ```bash
   # Hent tjenesteendepunkter
   azd env get-values
   
   # Test endepunktet (eksempel)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Forventede suksessindikatorer:**
   - ✅ `azd up` fullfører uten feil
   - ✅ Tjenende endepunkt returnerer HTTP 200
   - ✅ Azure-portalen viser status "Running"
   - ✅ Application Insights mottar telemetri

> **⚠️ Problemer?** Se [Vanlige problemer](../docs/chapter-07-troubleshooting/common-issues.md) for feilsøking av distribusjon

### Tilpasse eksempler

Hvert eksempel inneholder:
- **README.md** - Detaljerte oppsett- og tilpasningsinstruksjoner
- **azure.yaml** - AZD-konfigurasjon med kommentarer
- **infra/** - Bicep-maler med parameterforklaringer
- **src/** - Eksempelkode for applikasjon
- **scripts/** - Hjelpeskript for vanlige oppgaver

## 🎯 Læringsmål

### Eksempelkategorier

#### **Enkle distribusjoner**
- Enkeltjenesteapplikasjoner
- Enkle infrastrukturmønstre
- Grunnleggende konfigurasjonsstyring
- Kostnadseffektive utviklingsoppsett

#### **Avanserte scenarier**
- Multi-tjenestearkitekturer
- Kompleks nettverkskonfigurasjon
- Databaseintegrasjonsmønstre
- Sikkerhets- og samsvarsimplementeringer

#### **Produksjonsklare mønstre**
- Konfigurasjoner for høy tilgjengelighet
- Overvåking og observabilitet
- CI/CD-integrasjoner
- Disaster recovery-oppsett

## 📖 Eksempeldeskripsjoner

### Enkel nettapp – Node.js Express
**Teknologier**: Node.js, Express, MongoDB, Container Apps  
**Kompleksitet**: Nybegynner  
**Konsepter**: Grunnleggende distribusjon, REST API, NoSQL databaseintegrasjon

### Statisk nettside – React SPA
**Teknologier**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Kompleksitet**: Nybegynner  
**Konsepter**: Statisk hosting, serverløs backend, moderne webutvikling

### Container App – Python Flask
**Teknologier**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Kompleksitet**: Nybegynner  
**Konsepter**: Containerisering, REST API, scale-to-zero, helsesjekker, overvåking  
**Lokasjon**: [Lokalt eksempel](../../../examples/container-app/simple-flask-api)

### Container App – Mikrotjenestearkitektur
**Teknologier**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Kompleksitet**: Avansert  
**Konsepter**: Multi-tjenestearkitektur, tjenestekommunikasjon, meldingkø, distribuert sporing  
**Lokasjon**: [Lokalt eksempel](../../../examples/container-app/microservices)

### Databaseapp – C# med Azure SQL
**Teknologier**: C# ASP.NET Core, Azure SQL Database, App Service  
**Kompleksitet**: Middels  
**Konsepter**: Entity Framework, databaseforbindelser, web-API-utvikling

### Serverløs funksjon – Python Azure Functions
**Teknologier**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Kompleksitet**: Middels  
**Konsepter**: Hendelsesdrevet arkitektur, serverløs databehandling, fullstack utvikling

### Mikrotjenester – Java Spring Boot
**Teknologier**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Kompleksitet**: Middels  
**Konsepter**: Mikrotjenestekommunikasjon, distribuerte systemer, bedriftsmønstre

### Microsoft Foundry-eksempler

#### Microsoft Foundry Models Chat App
**Teknologier**: Microsoft Foundry Models, Azure AI Search, App Service  
**Kompleksitet**: Middels  
**Konsepter**: RAG-arkitektur, vektorsøk, LLM-integrasjon

#### AI dokumentprosessering
**Teknologier**: Azure AI Document Intelligence, Storage, Functions  
**Kompleksitet**: Middels  
**Konsepter**: Dokumentanalyse, OCR, datauttrekk

#### Maskinlæringspipeline
**Teknologier**: Azure ML, MLOps, Container Registry  
**Kompleksitet**: Avansert  
**Konsepter**: Modelltrening, distribusjonspipelines, overvåking

## 🛠 Konfigurasjonseksempler

Mappen `configurations/` inneholder gjenbrukbare komponenter:

### Miljøkonfigurasjoner
- Utviklingsmiljøinnstillinger
- Staging-miljøkonfigurasjoner
- Produksjonsklare konfigurasjoner
- Multi-region distribusjonsoppsett

### Bicep-moduler
- Gjenbrukbare infrastrukturskomponenter
- Vanlige ressursmønstre
- Sikkerhetsharde maler
- Kostnadsoptimaliserte konfigurasjoner

### Hjelpeskript
- Automatisering av miljøoppsett
- Database-migrasjonsskript
- Verktøy for distribusjonsvalidering
- Verktøy for kostnadsovervåking

## 🔧 Tilpasningsguide

### Tilpasse eksempler for ditt brukstilfelle

1. **Gå gjennom forutsetninger**
   - Sjekk Azure-tjenestekrav
   - Verifiser abonnementgrenser
   - Forstå kostnadsimplikasjoner

2. **Endre konfigurasjon**
   - Oppdater `azure.yaml` tjenestedefinisjoner
   - Tilpass Bicep-maler
   - Juster miljøvariabler

3. **Test grundig**
   - Distribuer først til utviklingsmiljø
   - Valider funksjonalitet
   - Test skalering og ytelse

4. **Sikkerhetsgjennomgang**
   - Gjennomgå tilgangskontroller
   - Implementer hemmelighetshåndtering
   - Aktiver overvåking og varsling

## 📊 Sammenligningsmatrise

| Eksempel | Tjenester | Database | Auth | Overvåking | Kompleksitet |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (Lokalt) | 2 | ❌ | Key Vault | Full | ⭐⭐ |
| **Python Flask API** (Lokalt) | 1 | ❌ | Enkel | Full | ⭐ |
| **Mikrotjenester** (Lokalt) | 5+ | ✅ | Enterprise | Avansert | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Enkel | Enkel | ⭐ |
| React SPA + Functions | 3 | ✅ | Enkel | Full | ⭐ |
| Python Flask Container | 2 | ❌ | Enkel | Full | ⭐ |
| C# Web API + SQL | 2 | ✅ | Full | Full | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Full | Full | ⭐⭐ |
| Java Mikrotjenester | 5+ | ✅ | Full | Full | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | Full | Full | ⭐⭐⭐ |
| AI Dokumentprosessering | 2 | ❌ | Enkel | Full | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Full | Full | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Lokalt) | **8+** | **✅** | **Enterprise** | **Avansert** | **⭐⭐⭐⭐** |

## 🎓 Læringsløp

### Anbefalt progresjon

1. **Start med enkel nettapp**
   - Lær grunnleggende AZD-konsepter
   - Forstå distribusjonsflyt
   - Øv på miljøhåndtering

2. **Prøv statisk nettside**
   - Utforsk ulike hosting-muligheter
   - Lær om CDN-integrasjon
   - Forstå DNS-konfigurasjon

3. **Gå videre til Container App**
   - Lær containeriseringsgrunnlag
   - Forstå skalering
   - Øv med Docker

4. **Legg til databaseintegrasjon**
   - Lær databaseprovisjonering
   - Forstå tilkoblingsstrenger
   - Øv på hemmelighetshåndtering

5. **Utforsk serverløs**
   - Forstå hendelsesdrevet arkitektur
   - Lær om triggere og bindinger
   - Øv med API-er

6. **Bygg mikrotjenester**
   - Lær tjenestekommunikasjon
   - Forstå distribuerte systemer
   - Øv på komplekse distribusjoner

## 🔍 Finne riktig eksempel

### Etter teknologistabel
- **Container Apps**: [Python Flask API (Lokalt)](../../../examples/container-app/simple-flask-api), [Mikrotjenester (Lokalt)](../../../examples/container-app/microservices), Java Mikrotjenester
- **Node.js**: Node.js Express Todo App, [Mikrotjenester API Gateway (Lokalt)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Lokalt)](../../../examples/container-app/simple-flask-api), [Mikrotjenester Produktservice (Lokalt)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Mikrotjenester Bestillingstjeneste (Lokalt)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Mikrotjenester Brukertjeneste (Lokalt)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Mikrotjenester
- **React**: React SPA + Functions
- **Containere**: [Python Flask (Lokalt)](../../../examples/container-app/simple-flask-api), [Mikrotjenester (Lokalt)](../../../examples/container-app/microservices), Java Mikrotjenester
- **Databaser**: [Mikrotjenester (Lokalt)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (Lokalt)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Dokumentprosessering, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systemer**: **Retail Multi-Agent Solution**
- **OpenAI-integrasjon**: **[Microsoft Foundry Models Chat (Lokalt)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Produksjon**: [Mikrotjenester (Lokalt)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Etter arkitekturmønster
- **Enkelt REST API**: [Python Flask API (Lokalt)](../../../examples/container-app/simple-flask-api)
- **Monolittisk**: Node.js Express Todo, C# Web API + SQL
- **Statisk + Serverløs**: React SPA + Functions, Python Functions + SPA
- **Mikrotjenester**: [Produksjon Mikrotjenester (Lokalt)](../../../examples/container-app/microservices), Java Spring Boot Mikrotjenester
- **Containerisert**: [Python Flask (Lokalt)](../../../examples/container-app/simple-flask-api), [Mikrotjenester (Lokalt)](../../../examples/container-app/microservices)
- **AI-drevet**: **[Microsoft Foundry Models Chat (Lokalt)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Dokumentprosessering, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Arkitektur**: **Retail Multi-Agent Solution**
- **Enterprise Multi-tjeneste**: [Mikrotjenester (Lokalt)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Etter kompleksitetsnivå
- **Nybegynner**: [Python Flask API (Lokalt)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Middels**: **[Microsoft Foundry Models Chat (Lokalt)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Mikrotjenester, Microsoft Foundry Models Chat App, AI Dokumentprosessering
- **Avansert**: ML Pipeline
- **Enterprise Produksjonsklar**: [Mikrotjenester (Lokalt)](../../../examples/container-app/microservices) (Multi-tjeneste med meldingkø), **Retail Multi-Agent Solution** (Fullt multi-agent system med ARM-mal distribusjon)

## 📚 Ekstra ressurser

### Dokumentasjonslenker
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Fellesskapseksempler
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App med C# og Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App med Python og MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App med Node.js og PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web App med C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions med Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Beste Praksis
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Bidra med Eksempler

Har du et nyttig eksempel å dele? Vi ønsker bidrag velkommen!

### Retningslinjer for Innsending
1. Følg den etablerte mappestrukturen
2. Inkluder en omfattende README.md
3. Legg til kommentarer i konfigurasjonsfiler
4. Test grundig før innsending
5. Inkluder kostnadsestimater og forutsetninger

### Eksempel Malstruktur
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

**Pro Tip**: Start med det enkleste eksemplet som passer din teknologistabel, og jobb deg gradvis opp til mer komplekse scenarier. Hvert eksempel bygger på konsepter fra de forrige!

## 🚀 Klar til å Starte?

### Din Læringsvei

1. **Fullstendig Nybegynner?** → Start med [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 min)
2. **Har Grunnleggende AZD Kunnskap?** → Prøv [Mikrotjenester](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 min)
3. **Bygger AI Apper?** → Start med [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 min) eller utforsk [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ timer)
4. **Trenger Spesifikk Tech Stack?** → Bruk avsnittet [Finding the Right Example](#-finding-the-right-example) ovenfor

### Neste Steg

- ✅ Gå gjennom [Forutsetninger](#forutsetninger) ovenfor
- ✅ Velg et eksempel som matcher ditt ferdighetsnivå (se [Complexity Legend](#kompleksitetsvurderingsnøkkel))
- ✅ Les READMEn for eksemplet grundig før distribusjon
- ✅ Sett en påminnelse om å kjøre `azd down` etter testing
- ✅ Del din opplevelse via GitHub Issues eller Discussions

### Trenger du Hjelp?

- 📖 [FAQ](../resources/faq.md) - Vanlige spørsmål besvart
- 🐛 [Feilsøkingsguide](../docs/chapter-07-troubleshooting/common-issues.md) - Løs distribusjonsproblemer
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Spør fellesskapet
- 📚 [Studieguide](../resources/study-guide.md) - Forsterk din læring

---

**Navigasjon**
- **📚 Kurs Hjem**: [AZD For Nybegynnere](../README.md)
- **📖 Studieressurser**: [Studieguide](../resources/study-guide.md) | [Fuskelapp](../resources/cheat-sheet.md) | [Ordlista](../resources/glossary.md)
- **🔧 Ressurser**: [FAQ](../resources/faq.md) | [Feilsøking](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Sist Oppdatert: November 2025 | [Rapporter Problemer](https://github.com/microsoft/AZD-for-beginners/issues) | [Bidra med Eksempler](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->