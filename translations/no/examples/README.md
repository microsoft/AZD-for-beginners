# Eksempler - Praktiske AZD-maler og konfigurasjoner

**Lær ved eksempler - Organisert etter kapittel**
- **📚 Kursoversikt**: [AZD For Nybegynnere](../README.md)
- **📖 Kapitteloversikt**: Eksempler organisert etter læringskompleksitet
- **🚀 Lokalt eksempel**: [Retail Multi-Agent Solution](retail-scenario.md)
- **🤖 Eksterne AI-eksempler**: Lenker til Azure Samples-repositorier

> **📍 VIKTIG: Lokale vs Eksterne eksempler**  
> Dette repositoriet inneholder **4 komplette lokale eksempler** med fullstendige implementasjoner:  
> - **Azure OpenAI Chat** (GPT-4 distribusjon med chat-grensesnitt)  
> - **Container Apps** (Enkel Flask API + Mikrotjenester)  
> - **Database App** (Web + SQL Database)  
> - **Retail Multi-Agent** (Enterprise AI-løsning)  
>  
> Ytterligere eksempler er **eksterne referanser** til Azure-Samples-repositorier som du kan klone.

## Introduksjon

Denne katalogen gir praktiske eksempler og referanser for å hjelpe deg med å lære Azure Developer CLI gjennom praktisk øvelse. Retail Multi-Agent-scenarioet er en komplett, produksjonsklar implementasjon inkludert i dette repositoriet. Ytterligere eksempler refererer til offisielle Azure Samples som demonstrerer ulike AZD-mønstre.

### Kompleksitetsvurdering

- ⭐ **Nybegynner** - Grunnleggende konsepter, én tjeneste, 15-30 minutter
- ⭐⭐ **Middels** - Flere tjenester, databaseintegrasjon, 30-60 minutter
- ⭐⭐⭐ **Avansert** - Kompleks arkitektur, AI-integrasjon, 1-2 timer
- ⭐⭐⭐⭐ **Ekspert** - Produksjonsklar, enterprise-mønstre, 2+ timer

## 🎯 Hva inneholder dette repositoriet?

### ✅ Lokal implementering (klar til bruk)

#### [Azure OpenAI Chat-applikasjon](azure-openai-chat/README.md) 🆕
**Komplett GPT-4 distribusjon med chat-grensesnitt inkludert i dette repositoriet**

- **Plassering:** `examples/azure-openai-chat/`
- **Kompleksitet:** ⭐⭐ (Middels)
- **Hva er inkludert:**
  - Komplett Azure OpenAI distribusjon (GPT-4)
  - Python kommandolinje-chat-grensesnitt
  - Key Vault-integrasjon for sikre API-nøkler
  - Bicep infrastrukturmaler
  - Tokenbruk og kostnadssporing
  - Ratebegrensning og feilhåndtering

**Hurtigstart:**
```bash
# Naviger til eksempel
cd examples/azure-openai-chat

# Distribuer alt
azd up

# Installer avhengigheter og start chatting
pip install -r src/requirements.txt
python src/chat.py
```

**Teknologier:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Container App Eksempler](container-app/README.md) 🆕
**Omfattende containerdistribusjonseksempler inkludert i dette repositoriet**

- **Plassering:** `examples/container-app/`
- **Kompleksitet:** ⭐-⭐⭐⭐⭐ (Nybegynner til Ekspert)
- **Hva er inkludert:**
  - [Hovedveiledning](container-app/README.md) - Komplett oversikt over containerdistribusjoner
  - [Enkel Flask API](../../../examples/container-app/simple-flask-api) - Grunnleggende REST API-eksempel
  - [Mikrotjenester Arkitektur](../../../examples/container-app/microservices) - Produksjonsklar multi-tjeneste distribusjon
  - Hurtigstart, produksjon og avanserte mønstre
  - Overvåking, sikkerhet og kostnadsoptimalisering

**Hurtigstart:**
```bash
# Vis hovedveiledning
cd examples/container-app

# Distribuer enkel Flask API
cd simple-flask-api
azd up

# Distribuer mikroservices eksempel
cd ../microservices
azd up
```

**Teknologier:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent Solution](retail-scenario.md) 🆕
**Komplett produksjonsklar implementering inkludert i dette repositoriet**

- **Plassering:** `examples/retail-multiagent-arm-template/`
- **Kompleksitet:** ⭐⭐⭐⭐ (Avansert)
- **Hva er inkludert:**
  - Komplett ARM distribusjonsmal
  - Multi-agent arkitektur (Kunde + Lager)
  - Azure OpenAI-integrasjon
  - AI-søk med RAG
  - Omfattende overvåking
  - Ett-klikks distribusjonsskript

**Hurtigstart:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Teknologier:** Azure OpenAI, AI-søk, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Eksterne Azure Samples (klon for bruk)

Følgende eksempler vedlikeholdes i offisielle Azure-Samples-repositorier. Klon dem for å utforske ulike AZD-mønstre:

### Enkle applikasjoner (Kapittel 1-2)

| Mal | Repository | Kompleksitet | Tjenester |
|:----|:-----------|:-------------|:----------|
| **Python Flask API** | [Lokal: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Mikrotjenester** | [Lokal: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-tjeneste, Service Bus, Cosmos DB, SQL |
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

### AI-applikasjonseksempler (Kapittel 2, 5, 8)

| Mal | Repository | Kompleksitet | Fokus |
|:----|:-----------|:-------------|:------|
| **Azure OpenAI Chat** | [Lokal: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | GPT-4 distribusjon |
| **AI Chat Hurtigstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Grunnleggende AI-chat |
| **AI-agenter** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agentrammeverk |
| **Søk + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG-mønster |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Enterprise AI |

### Database & Avanserte mønstre (Kapittel 3-8)

| Mal | Repository | Kompleksitet | Fokus |
|:----|:-----------|:-------------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Databaseintegrasjon |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverløs |
| **Java Mikrotjenester** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-tjeneste |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Læringsmål

Ved å jobbe gjennom disse eksemplene vil du:
- Øve på Azure Developer CLI-arbeidsflyter med realistiske applikasjonsscenarier
- Forstå ulike applikasjonsarkitekturer og deres AZD-implementasjoner
- Mestre Infrastructure as Code-mønstre for ulike Azure-tjenester
- Anvende konfigurasjonsstyring og miljøspesifikke distribusjonsstrategier
- Implementere overvåking, sikkerhet og skaleringsmønstre i praktiske kontekster
- Bygge erfaring med feilsøking og debugging av reelle distribusjonsscenarier

## Læringsutbytte

Når du har fullført disse eksemplene, vil du kunne:
- Distribuere ulike applikasjonstyper ved hjelp av Azure Developer CLI med selvtillit
- Tilpasse de gitte malene til dine egne applikasjonsbehov
- Designe og implementere tilpassede infrastrukturmønstre ved hjelp av Bicep
- Konfigurere komplekse multi-tjeneste applikasjoner med riktige avhengigheter
- Anvende sikkerhet, overvåking og ytelses beste praksis i reelle scenarier
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

## Hurtigstart Eksempler

> **💡 Ny til AZD?** Start med eksempel #1 (Flask API) - det tar ~20 minutter og lærer deg kjernekonsepter.

### For Nybegynnere
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Lokal) ⭐  
   Distribuer et enkelt REST API med scale-to-zero  
   **Tid:** 20-25 minutter | **Kostnad:** $0-5/måned  
   **Du vil lære:** Grunnleggende AZD-arbeidsflyt, containerisering, helseprober  
   **Forventet resultat:** Fungerende API-endepunkt som returnerer "Hello, World!" med overvåking

2. **[Enkel Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Distribuer en Node.js Express webapplikasjon med MongoDB  
   **Tid:** 25-35 minutter | **Kostnad:** $10-30/måned  
   **Du vil lære:** Databaseintegrasjon, miljøvariabler, tilkoblingsstrenger  
   **Forventet resultat:** Todo-liste app med oppretting/lesing/oppdatering/sletting funksjonalitet

3. **[Statisk Nettsted - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Host et React statisk nettsted med Azure Static Web Apps  
   **Tid:** 20-30 minutter | **Kostnad:** $0-10/måned  
   **Du vil lære:** Statisk hosting, serverløse funksjoner, CDN-distribusjon  
   **Forventet resultat:** React UI med API-backend, automatisk SSL, global CDN

### For Middels Brukere
4. **[Azure OpenAI Chat-applikasjon](../../../examples/azure-openai-chat)** (Lokal) ⭐⭐  
   Distribuer GPT-4 med chat-grensesnitt og sikker API-nøkkelhåndtering  
   **Tid:** 35-45 minutter | **Kostnad:** $50-200/måned  
   **Du vil lære:** Azure OpenAI distribusjon, Key Vault-integrasjon, token-sporing  
   **Forventet resultat:** Fungerende chat-applikasjon med GPT-4 og kostnadsovervåking

5. **[Container App - Mikrotjenester](../../../examples/container-app/microservices)** (Lokal) ⭐⭐⭐⭐  
   Produksjonsklar multi-tjeneste arkitektur  
   **Tid:** 45-60 minutter | **Kostnad:** $50-150/måned  
   **Du vil lære:** Tjenestekommunikasjon, meldingskøer, distribuert sporing  
   **Forventet resultat:** 2-tjeneste system (API Gateway + Produkt-tjeneste) med overvåking

6. **[Database App - C# med Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Webapplikasjon med C# API og Azure SQL Database  
   **Tid:** 30-45 minutter | **Kostnad:** $20-80/måned  
   **Du vil lære:** Entity Framework, database-migrasjoner, tilkoblingssikkerhet  
   **Forventet resultat:** C# API med Azure SQL backend, automatisk skjema-distribusjon

7. **[Serverløs Funksjon - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions med HTTP-triggere og Cosmos DB  
   **Tid:** 30-40 minutter | **Kostnad:** $10-40/måned  
   **Du vil lære:** Hendelsesdrevet arkitektur, serverløs skalering, NoSQL-integrasjon  
   **Forventet resultat:** Funksjonsapp som svarer på HTTP-forespørsler med Cosmos DB-lagring

8. **[Mikrotjenester - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Multi-tjeneste Java-applikasjon med Container Apps og API-gateway  
   **Tid:** 60-90 minutter | **Kostnad:** $80-200/måned  
   **Du vil lære:** Spring Boot distribusjon, tjenestemesh, lastbalansering  
   **Forventet resultat:** Multi-tjeneste Java-system med tjenesteoppdagelse og ruting

### Azure AI Foundry Maler

1. **[Azure OpenAI Chat App - Lokalt Eksempel](../../../examples/azure-openai-chat)** ⭐⭐  
   Komplett GPT-4 distribusjon med chat-grensesnitt  
   **Tid:** 35-45 minutter | **Kostnad:** $50-200/måned  
   **Forventet resultat:** Fungerende chat-applikasjon med token-sporing og kostnadsovervåking

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Intelligent chat-applikasjon med RAG-arkitektur  
   **Tid:** 60-90 minutter | **Kostnad:** $100-300/måned  
   **Forventet resultat:** RAG-drevet chat-grensesnitt med dokumentsøk og sitater

3. **[AI Dokumentbehandling](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Dokumentanalyse ved bruk av Azure AI-tjenester  
   **Tid:** 40-60 minutter | **Kostnad:** $20-80/måned  
   **Forventet resultat:** API som trekker ut tekst, tabeller og enheter fra opplastede dokumenter

4. **[Maskinlæringspipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps-arbeidsflyt med Azure Machine Learning  
   **Tid:** 2-3 timer | **Kostnad:** $150-500/måned  
   **Forventet resultat:** Automatisert ML-pipeline med trening, distribusjon og overvåking

### Virkelige Scenarier

#### **Retail Multi-Agent Solution** 🆕
**[Komplett Implementeringsveiledning](./retail-scenario.md)**

En omfattende, produksjonsklar multi-agent kundestøtteløsning som demonstrerer enterprise-grade AI-applikasjonsdistribusjon med AZD. Dette scenarioet gir:

- **Komplett Arkitektur**: Multi-agent system med spesialiserte kundeservice- og lagerstyringsagenter
- **Produksjonsinfrastruktur**: Multi-region Azure OpenAI-distribusjoner, AI-søk, Container Apps og omfattende overvåking  
- **Klar-til-distribusjon ARM-mal**: Ett-klikk distribusjon med flere konfigurasjonsmoduser (Minimal/Standard/Premium)  
- **Avanserte funksjoner**: Red teaming sikkerhetsvalidering, agent evalueringsrammeverk, kostnadsoptimalisering og feilsøkingsveiledninger  
- **Reell forretningskontekst**: Brukstilfelle for kundestøtte i detaljhandel med filopplastinger, søkeintegrasjon og dynamisk skalering  

**Teknologier**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API  

**Kompleksitet**: ⭐⭐⭐⭐ (Avansert - Klar for bedriftsproduksjon)  

**Perfekt for**: AI-utviklere, løsningsarkitekter og team som bygger produksjonsklare multi-agent systemer  

**Rask start**: Distribuer hele løsningen på under 30 minutter ved å bruke den inkluderte ARM-malen med `./deploy.sh -g myResourceGroup`  

## 📋 Bruksanvisning  

### Forutsetninger  

Før du kjører et eksempel:  
- ✅ Azure-abonnement med eier- eller bidragsytertilgang  
- ✅ Azure Developer CLI installert ([Installasjonsveiledning](../docs/getting-started/installation.md))  
- ✅ Docker Desktop kjører (for container-eksempler)  
- ✅ Passende Azure-kvoter (sjekk kravene for hvert eksempel)  

> **💰 Kostnadsadvarsel:** Alle eksempler oppretter reelle Azure-ressurser som påløper kostnader. Se individuelle README-filer for kostnadsestimater. Husk å kjøre `azd down` når du er ferdig for å unngå løpende kostnader.  

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
  
5. **Bekreft distribusjon**  
   ```bash
   # Hent tjenesteendepunkter
   azd env get-values
   
   # Test endepunktet (eksempel)
   curl https://your-app-url.azurecontainer.io/health
   ```
  
   **Forventede suksessindikatorer:**  
   - ✅ `azd up` fullføres uten feil  
   - ✅ Tjenesteendepunkt returnerer HTTP 200  
   - ✅ Azure-portalen viser status "Kjører"  
   - ✅ Application Insights mottar telemetri  

> **⚠️ Problemer?** Se [Vanlige problemer](../docs/troubleshooting/common-issues.md) for distribusjonsfeilsøking  

### Tilpasse eksempler  

Hvert eksempel inkluderer:  
- **README.md** - Detaljerte oppsett- og tilpasningsinstruksjoner  
- **azure.yaml** - AZD-konfigurasjon med kommentarer  
- **infra/** - Bicep-maler med parameterforklaringer  
- **src/** - Eksempelkode for applikasjoner  
- **scripts/** - Hjelpeskript for vanlige oppgaver  

## 🎯 Læringsmål  

### Eksempelkategorier  

#### **Enkle distribusjoner**  
- Applikasjoner med én tjeneste  
- Enkle infrastrukturmønstre  
- Grunnleggende konfigurasjonsstyring  
- Kostnadseffektive utviklingsoppsett  

#### **Avanserte scenarier**  
- Arkitekturer med flere tjenester  
- Komplekse nettverkskonfigurasjoner  
- Databaseintegrasjonsmønstre  
- Implementeringer for sikkerhet og samsvar  

#### **Produksjonsklare mønstre**  
- Konfigurasjoner for høy tilgjengelighet  
- Overvåking og observabilitet  
- CI/CD-integrasjon  
- Oppsett for katastrofegjenoppretting  

## 📖 Eksempelforklaringer  

### Enkel webapp - Node.js Express  
**Teknologier**: Node.js, Express, MongoDB, Container Apps  
**Kompleksitet**: Nybegynner  
**Konsepter**: Grunnleggende distribusjon, REST API, NoSQL-databaseintegrasjon  

### Statisk nettside - React SPA  
**Teknologier**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Kompleksitet**: Nybegynner  
**Konsepter**: Statisk hosting, serverløs backend, moderne webutvikling  

### Container App - Python Flask  
**Teknologier**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Kompleksitet**: Nybegynner  
**Konsepter**: Containerisering, REST API, skalering til null, helseprober, overvåking  
**Plassering**: [Lokalt eksempel](../../../examples/container-app/simple-flask-api)  

### Container App - Mikrotjenestearkitektur  
**Teknologier**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Kompleksitet**: Avansert  
**Konsepter**: Arkitektur med flere tjenester, tjenestekommunikasjon, meldingskøer, distribuert sporing  
**Plassering**: [Lokalt eksempel](../../../examples/container-app/microservices)  

### Databaseapp - C# med Azure SQL  
**Teknologier**: C# ASP.NET Core, Azure SQL Database, App Service  
**Kompleksitet**: Middels  
**Konsepter**: Entity Framework, databaseforbindelser, web API-utvikling  

### Serverløs funksjon - Python Azure Functions  
**Teknologier**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Kompleksitet**: Middels  
**Konsepter**: Hendelsesdrevet arkitektur, serverløs databehandling, fullstack-utvikling  

### Mikrotjenester - Java Spring Boot  
**Teknologier**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Kompleksitet**: Middels  
**Konsepter**: Mikrotjenestekommunikasjon, distribuerte systemer, bedriftsmønstre  

### Azure AI Foundry-eksempler  

#### Azure OpenAI Chat App  
**Teknologier**: Azure OpenAI, Cognitive Search, App Service  
**Kompleksitet**: Middels  
**Konsepter**: RAG-arkitektur, vektorsøk, LLM-integrasjon  

#### AI-dokumentbehandling  
**Teknologier**: Azure AI Document Intelligence, Storage, Functions  
**Kompleksitet**: Middels  
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
- Oppsett for distribusjon i flere regioner  

### Bicep-moduler  
- Gjenbrukbare infrastrukturkomponenter  
- Vanlige ressursmønstre  
- Sikkerhetsherdede maler  
- Kostnadsoptimaliserte konfigurasjoner  

### Hjelpeskript  
- Automatisering av miljøoppsett  
- Skript for databasemigrering  
- Verktøy for validering av distribusjon  
- Verktøy for kostnadsovervåking  

## 🔧 Tilpasningsveiledning  

### Tilpasse eksempler til ditt brukstilfelle  

1. **Gjennomgå forutsetninger**  
   - Sjekk krav til Azure-tjenester  
   - Verifiser abonnementsgrenser  
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

| Eksempel | Tjenester | Database | Autentisering | Overvåking | Kompleksitet |  
|---------|----------|----------|---------------|------------|--------------|  
| **Azure OpenAI Chat** (Lokal) | 2 | ❌ | Key Vault | Full | ⭐⭐ |  
| **Python Flask API** (Lokal) | 1 | ❌ | Grunnleggende | Full | ⭐ |  
| **Mikrotjenester** (Lokal) | 5+ | ✅ | Bedrift | Avansert | ⭐⭐⭐⭐ |  
| Node.js Express Todo | 2 | ✅ | Grunnleggende | Grunnleggende | ⭐ |  
| React SPA + Functions | 3 | ✅ | Grunnleggende | Full | ⭐ |  
| Python Flask Container | 2 | ❌ | Grunnleggende | Full | ⭐ |  
| C# Web API + SQL | 2 | ✅ | Full | Full | ⭐⭐ |  
| Python Functions + SPA | 3 | ✅ | Full | Full | ⭐⭐ |  
| Java Mikrotjenester | 5+ | ✅ | Full | Full | ⭐⭐ |  
| Azure OpenAI Chat | 3 | ✅ | Full | Full | ⭐⭐⭐ |  
| AI-dokumentbehandling | 2 | ❌ | Grunnleggende | Full | ⭐⭐ |  
| ML-pipeline | 4+ | ✅ | Full | Full | ⭐⭐⭐⭐ |  
| **Detaljhandel Multi-Agent** (Lokal) | **8+** | **✅** | **Bedrift** | **Avansert** | **⭐⭐⭐⭐** |  

## 🎓 Læringssti  

### Anbefalt progresjon  

1. **Start med enkel webapp**  
   - Lær grunnleggende AZD-konsepter  
   - Forstå distribusjonsflyt  
   - Øv på miljøhåndtering  

2. **Prøv statisk nettside**  
   - Utforsk ulike hostingalternativer  
   - Lær om CDN-integrasjon  
   - Forstå DNS-konfigurasjon  

3. **Gå videre til Container App**  
   - Lær grunnleggende containerisering  
   - Forstå skalering  
   - Øv med Docker  

4. **Legg til databaseintegrasjon**  
   - Lær databaseprovisjonering  
   - Forstå tilkoblingsstrenger  
   - Øv på hemmelighetshåndtering  

5. **Utforsk serverløst**  
   - Forstå hendelsesdrevet arkitektur  
   - Lær om triggere og bindinger  
   - Øv med API-er  

6. **Bygg mikrotjenester**  
   - Lær tjenestekommunikasjon  
   - Forstå distribuerte systemer  
   - Øv på komplekse distribusjoner  

## 🔍 Finne riktig eksempel  

### Etter teknologistabel  
- **Container Apps**: [Python Flask API (Lokal)](../../../examples/container-app/simple-flask-api), [Mikrotjenester (Lokal)](../../../examples/container-app/microservices), Java Mikrotjenester  
- **Node.js**: Node.js Express Todo App, [Mikrotjenester API Gateway (Lokal)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (Lokal)](../../../examples/container-app/simple-flask-api), [Mikrotjenester Produkt-tjeneste (Lokal)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [Mikrotjenester Ordre-tjeneste (Lokal)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, ML-pipeline  
- **Go**: [Mikrotjenester Bruker-tjeneste (Lokal)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot Mikrotjenester  
- **React**: React SPA + Functions  
- **Containere**: [Python Flask (Lokal)](../../../examples/container-app/simple-flask-api), [Mikrotjenester (Lokal)](../../../examples/container-app/microservices), Java Mikrotjenester  
- **Databaser**: [Mikrotjenester (Lokal)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **AI/ML**: **[Azure OpenAI Chat (Lokal)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI-dokumentbehandling, ML-pipeline, **Detaljhandel Multi-Agent-løsning**  
- **Multi-Agent-systemer**: **Detaljhandel Multi-Agent-løsning**  
- **OpenAI-integrasjon**: **[Azure OpenAI Chat (Lokal)](../../../examples/azure-openai-chat)**, Detaljhandel Multi-Agent-løsning  
- **Bedriftsproduksjon**: [Mikrotjenester (Lokal)](../../../examples/container-app/microservices), **Detaljhandel Multi-Agent-løsning**  

### Etter arkitekturmønster  
- **Enkel REST API**: [Python Flask API (Lokal)](../../../examples/container-app/simple-flask-api)  
- **Monolittisk**: Node.js Express Todo, C# Web API + SQL  
- **Statisk + serverløst**: React SPA + Functions, Python Functions + SPA  
- **Mikrotjenester**: [Produksjonsmikrotjenester (Lokal)](../../../examples/container-app/microservices), Java Spring Boot Mikrotjenester  
- **Containerisert**: [Python Flask (Lokal)](../../../examples/container-app/simple-flask-api), [Mikrotjenester (Lokal)](../../../examples/container-app/microservices)  
- **AI-drevet**: **[Azure OpenAI Chat (Lokal)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI-dokumentbehandling, ML-pipeline, **Detaljhandel Multi-Agent-løsning**  
- **Multi-Agent-arkitektur**: **Detaljhandel Multi-Agent-løsning**  
- **Bedrift Multi-tjeneste**: [Mikrotjenester (Lokal)](../../../examples/container-app/microservices), **Detaljhandel Multi-Agent-løsning**  

### Etter kompleksitetsnivå  
- **Nybegynner**: [Python Flask API (Lokal)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **Middels**: **[Azure OpenAI Chat (Lokal)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Mikrotjenester, Azure OpenAI Chat App, AI-dokumentbehandling  
- **Avansert**: ML-pipeline  
- **Klar for bedriftsproduksjon**: [Mikrotjenester (Lokal)](../../../examples/container-app/microservices) (Multi-tjeneste med meldingskøer), **Detaljhandel Multi-Agent-løsning** (Komplett multi-agent-system med ARM-maldistribusjon)  

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
- [Azure Container Apps Jobb](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions med Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Beste praksis
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Bidra med eksempler

Har du et nyttig eksempel å dele? Vi ønsker bidrag velkommen!

### Retningslinjer for innsending
1. Følg den etablerte mappestrukturen
2. Inkluder en omfattende README.md
3. Legg til kommentarer i konfigurasjonsfiler
4. Test grundig før innsending
5. Inkluder kostnadsestimater og forutsetninger

### Eksempel på malstruktur
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

**Tips**: Start med det enkleste eksempelet som passer til din teknologistack, og jobb deg gradvis opp til mer komplekse scenarier. Hvert eksempel bygger på konsepter fra de forrige!

## 🚀 Klar til å starte?

### Din læringsvei

1. **Helt nybegynner?** → Start med [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 minutter)
2. **Har grunnleggende AZD-kunnskap?** → Prøv [Mikrotjenester](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 minutter)
3. **Bygger AI-apper?** → Start med [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 minutter) eller utforsk [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ timer)
4. **Trenger spesifikk teknologistack?** → Bruk [Finn riktig eksempel](../../../examples)-seksjonen ovenfor

### Neste steg

- ✅ Gå gjennom [Forutsetninger](../../../examples) ovenfor
- ✅ Velg et eksempel som passer ditt ferdighetsnivå (se [Kompleksitetslegende](../../../examples))
- ✅ Les README for eksempelet grundig før du distribuerer
- ✅ Sett en påminnelse for å kjøre `azd down` etter testing
- ✅ Del din erfaring via GitHub Issues eller Diskusjoner

### Trenger du hjelp?

- 📖 [FAQ](../resources/faq.md) - Vanlige spørsmål besvart
- 🐛 [Feilsøkingsguide](../docs/troubleshooting/common-issues.md) - Løs distribusjonsproblemer
- 💬 [GitHub Diskusjoner](https://github.com/microsoft/AZD-for-beginners/discussions) - Spør fellesskapet
- 📚 [Studieguide](../resources/study-guide.md) - Styrk læringen din

---

**Navigasjon**
- **📚 Kursoversikt**: [AZD For Beginners](../README.md)
- **📖 Studiemateriell**: [Studieguide](../resources/study-guide.md) | [Huskeliste](../resources/cheat-sheet.md) | [Ordliste](../resources/glossary.md)
- **🔧 Ressurser**: [FAQ](../resources/faq.md) | [Feilsøking](../docs/troubleshooting/common-issues.md)

---

*Sist oppdatert: November 2025 | [Rapporter problemer](https://github.com/microsoft/AZD-for-beginners/issues) | [Bidra med eksempler](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi tilstreber nøyaktighet, vær oppmerksom på at automatiserte oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på dets opprinnelige språk bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->