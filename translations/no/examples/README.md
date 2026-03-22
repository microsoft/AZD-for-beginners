# Eksempler - Praktiske AZD-maler og konfigurasjoner

**Læring gjennom eksempler - organisert etter kapittel**  
- **📚 Kursoversikt**: [AZD for nybegynnere](../README.md)  
- **📖 Kapittelkartlegging**: Eksempler organisert etter læringskompleksitet  
- **🚀 Lokalt eksempel**: [Retail Multi-Agent-løsning](retail-scenario.md)  
- **🤖 Eksterne AI-eksempler**: Lenker til Azure Samples-lagre  

> **📍 VIKTIG: Lokale vs Eksterne eksempler**  
> Dette depotet inneholder **4 komplette lokale eksempler** med full implementering:  
> - **Microsoft Foundry Models Chat** (gpt-4.1-distribusjon med chattegrensesnitt)  
> - **Container Apps** (Enkel Flask API + mikrotjenester)  
> - **Database App** (Web + SQL-database)  
> - **Retail Multi-Agent** (Enterprise AI-løsning)  
>  
> Ytterligere eksempler er **eksterne referanser** til Azure-Samples-lagre du kan klone.

## Introduksjon

Denne mappen tilbyr praktiske eksempler og referanser for å hjelpe deg å lære Azure Developer CLI gjennom praktisk erfaring. Retail Multi-Agent-scenarioet er en komplett, produksjonsklar implementering inkludert i dette depotet. Ytterligere eksempler refererer til offisielle Azure Samples som demonstrerer ulike AZD-mønstre.

### Kompleksitetsskala

- ⭐ **Nybegynner** - Grunnleggende konsepter, enkel tjeneste, 15-30 minutter  
- ⭐⭐ **Middels** - Flere tjenester, databaseintegrasjon, 30-60 minutter  
- ⭐⭐⭐ **Avansert** - Kompleks arkitektur, AI-integrasjon, 1-2 timer  
- ⭐⭐⭐⭐ **Ekspert** - Produksjonsklart, bedriftsmønstre, 2+ timer  

## 🎯 Hva som faktisk finnes i dette depotet

### ✅ Lokal implementering (klar til bruk)

#### [Microsoft Foundry Models Chat-applikasjon](azure-openai-chat/README.md) 🆕  
**Fullstendig gpt-4.1-distribusjon med chattegrensesnitt inkludert i dette repoet**

- **Plassering:** `examples/azure-openai-chat/`  
- **Kompleksitet:** ⭐⭐ (Middels)  
- **Hva det inkluderer:**  
  - Full Microsoft Foundry Models-distribusjon (gpt-4.1)  
  - Python kommandolinje-chattgrensesnitt  
  - Key Vault-integrasjon for sikre API-nøkler  
  - Bicep infrastrukturmaler  
  - Bruk av tokens og kostnadsoppfølging  
  - Ratebegrensning og feilhåndtering  

**Rask start:**  
```bash
# Naviger til eksempel
cd examples/azure-openai-chat

# Distribuer alt
azd up

# Installer avhengigheter og start samtale
pip install -r src/requirements.txt
python src/chat.py
```
  
**Teknologier:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep  

#### [Container App-eksempler](container-app/README.md) 🆕  
**Omfattende container-distribusjonseksempler inkludert i dette repoet**

- **Plassering:** `examples/container-app/`  
- **Kompleksitet:** ⭐-⭐⭐⭐⭐ (Nybegynner til avansert)  
- **Hva det inkluderer:**  
  - [Master Guide](container-app/README.md) - Full oversikt over container-distribusjoner  
  - [Enkel Flask API](../../../examples/container-app/simple-flask-api) - Grunnleggende REST API-eksempel  
  - [Mikrotjenestearkitektur](../../../examples/container-app/microservices) - Produksjonsklar multi-tjenestedistribusjon  
  - Rask start, produksjons- og avanserte mønstre  
  - Overvåkning, sikkerhet og kostnadsoptimalisering  

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

#### [Retail Multi-Agent-løsning](retail-scenario.md) 🆕  
**Komplett produksjonsklar implementering inkludert i dette repoet**

- **Plassering:** `examples/retail-multiagent-arm-template/`  
- **Kompleksitet:** ⭐⭐⭐⭐ (Avansert)  
- **Hva det inkluderer:**  
  - Fullstendig ARM-distribusjonsmal  
  - Multi-agent arkitektur (Kunde + Lager)  
  - Microsoft Foundry Models-integrasjon  
  - AI Search med RAG  
  - Omfattende overvåkning  
  - Ett-klikk distribusjonsskript  

**Rask start:**  
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```
  
**Teknologier:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights  

---

## 🔗 Eksterne Azure Samples (klon for bruk)

Følgende eksempler vedlikeholdes i offisielle Azure-Samples-lagre. Klon dem for å utforske forskjellige AZD-mønstre:

### Enkle applikasjoner (Kapittel 1-2)

| Mal | Depot | Kompleksitet | Tjenester |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Lokal: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Mikrotjenester** | [Lokal: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-tjeneste, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Hvordan bruke:**  
```bash
# Klon et hvilket som helst eksempel
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Distribuer
azd up
```
  
### AI-applikasjonseksempler (Kapittel 2, 5, 8)

| Mal | Depot | Kompleksitet | Fokus |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [Lokal: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1-distribusjon |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Grunnleggende AI-chat |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agentrammeverk |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG-mønster |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Enterprise AI |

### Database & avanserte mønstre (Kapittel 3-8)

| Mal | Depot | Kompleksitet | Fokus |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Databaseintegrasjon |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverløs |
| **Java mikrotjenester** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-tjeneste |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Læringsmål

Ved å jobbe gjennom disse eksemplene vil du:  
- Øve på Azure Developer CLI-arbeidsflyter med realistiske applikasjonsscenarier  
- Forstå forskjellige applikasjonsarkitekturer og deres azd-implementeringer  
- Mestre Infrastructure as Code-mønstre for ulike Azure-tjenester  
- Anvende konfigurasjonsstyring og miljøspesifikke distribusjonsstrategier  
- Implementere overvåkning, sikkerhet og skalering i praktiske sammenhenger  
- Bygge erfaring med feilsøking og debugging av ekte distribusjonsscenarier  

## Læringsutbytte

Etter å ha fullført disse eksemplene, vil du kunne:  
- Distribuere ulike applikasjonstyper med Azure Developer CLI med selvtillit  
- Tilpasse tilgjengelige maler etter dine egne applikasjonsbehov  
- Designe og implementere tilpassede infrastruktur-mønstre ved hjelp av Bicep  
- Konfigurere komplekse multi-tjeneste applikasjoner med riktige avhengigheter  
- Anvende sikkerhet, overvåkning og ytelses beste praksis i reelle scenarier  
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

> **💡 Ny med AZD?** Start med eksempel #1 (Flask API) - det tar ~20 minutter og lærer deg grunnleggende konsepter.

### For nybegynnere  
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Lokalt) ⭐  
   Distribuer en enkel REST API med scale-to-zero  
   **Tid:** 20-25 minutter | **Kostnad:** $0-5/måned  
   **Du lærer:** Grunnleggende azd-arbeidsflyt, containerisering, helsesjekker  
   **Forventet resultat:** Funksjonell API-endepunkt som returnerer "Hello, World!" med overvåkning  

2. **[Enkel Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Distribuer en Node.js Express webapplikasjon med MongoDB  
   **Tid:** 25-35 minutter | **Kostnad:** $10-30/måned  
   **Du lærer:** Databaseintegrasjon, miljøvariabler, tilkoblingsstrenger  
   **Forventet resultat:** To-do liste-app med opprettelse, lesing, oppdatering og sletting  

3. **[Statisk nettsted - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Host en React statisk nettside med Azure Static Web Apps  
   **Tid:** 20-30 minutter | **Kostnad:** $0-10/måned  
   **Du lærer:** Statisk hosting, serverless funksjoner, CDN-distribusjon  
   **Forventet resultat:** React UI med API backend, automatisk SSL, global CDN  

### For middels brukere  
4. **[Microsoft Foundry Models Chat-applikasjon](../../../examples/azure-openai-chat)** (Lokalt) ⭐⭐  
   Distribuer gpt-4.1 med chattegrensesnitt og sikker API-nøkkelhåndtering  
   **Tid:** 35-45 minutter | **Kostnad:** $50-200/måned  
   **Du lærer:** Microsoft Foundry Models-distribusjon, Key Vault-integrasjon, token-sporing  
   **Forventet resultat:** Funksjonell chat-applikasjon med gpt-4.1 og kostnadsoppfølging  

5. **[Container App - Mikrotjenester](../../../examples/container-app/microservices)** (Lokalt) ⭐⭐⭐⭐  
   Produksjonsklar multi-tjenestearkitektur  
   **Tid:** 45-60 minutter | **Kostnad:** $50-150/måned  
   **Du lærer:** Tjenestekommunikasjon, meldingskø, distribuert sporing  
   **Forventet resultat:** 2-tjenestesystem (API Gateway + Produktservice) med overvåkning  

6. **[Database App - C# med Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Webapplikasjon med C# API og Azure SQL Database  
   **Tid:** 30-45 minutter | **Kostnad:** $20-80/måned  
   **Du lærer:** Entity Framework, databasemigrasjoner, sikker tilkobling  
   **Forventet resultat:** C# API med Azure SQL-backend, automatisk skjema distribusjon  

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions med HTTP-triggere og Cosmos DB  
   **Tid:** 30-40 minutter | **Kostnad:** $10-40/måned  
   **Du lærer:** Hendelsesdrevet arkitektur, serverløs skalering, NoSQL-integrasjon  
   **Forventet resultat:** Funksjonsapp som svarer på HTTP-forespørsler med Cosmos DB-lagring  

8. **[Mikrotjenester - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Multi-tjeneste Java-applikasjon med Container Apps og API-gateway  
   **Tid:** 60-90 minutter | **Kostnad:** $80-200/måned  
   **Du lærer:** Spring Boot-distribusjon, tjenestemesh, lastbalansering  
   **Forventet resultat:** Multi-tjeneste Java-system med tjenesteregistrering og ruting  

### Microsoft Foundry-maler

1. **[Microsoft Foundry Models Chat App - Lokalt eksempel](../../../examples/azure-openai-chat)** ⭐⭐  
   Fullstendig gpt-4.1-distribusjon med chattegrensesnitt  
   **Tid:** 35-45 minutter | **Kostnad:** $50-200/måned  
   **Forventet resultat:** Funksjonell chat-applikasjon med token-sporing og kostnadsoppfølging  

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Intelligent chat-applikasjon med RAG-arkitektur  
   **Tid:** 60-90 minutter | **Kostnad:** $100-300/måned  
   **Forventet resultat:** RAG-drevet chattegrensesnitt med dokumentsøk og referanser  

3. **[AI-dokumentbehandling](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Dokumentanalyse ved bruk av Azure AI-tjenester  
   **Tid:** 40-60 minutter | **Kostnad:** $20-80/måned  
   **Forventet resultat:** API som ekstraherer tekst, tabeller og enheter fra opplastede dokumenter  

4. **[Maskinlæringspipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps-arbeidsflyt med Azure Machine Learning  
   **Tid:** 2-3 timer | **Kostnad:** $150-500/måned  
   **Forventet resultat:** Automatisert ML-pipeline med trening, utrulling og overvåkning  

### Virkelige scenarier

#### **Retail Multi-Agent-løsning** 🆕  
**[Fullstendig implementeringsveiledning](./retail-scenario.md)**

En omfattende, produksjonsklar multi-agent kundestøtteløsning som demonstrerer enterprise-grade AI-applikasjonsdistribusjon med AZD. Dette scenariet gir:
- **Fullstendig Arkitektur**: Multi-agent system med spesialiserte kundeservice- og lagerstyringsagenter  
- **Produksjonsinfrastruktur**: Multi-region Microsoft Foundry Models-distribusjoner, AI Search, Container Apps, og omfattende overvåking  
- **Klar-til-Distribusjon ARM-mal**: Ett-klikk distribusjon med flere konfigurasjonsmoduser (Minimal/Standard/Premium)  
- **Avanserte Funksjoner**: Red teaming sikkerhetsvalidering, agentvurderingsrammeverk, kostnadsoptimalisering og feilsøkingsguider  
- **Reell Forretningskontekst**: Retailer kundestøtte brukstilfelle med filopplastinger, søkintegrasjon og dynamisk skalering  

**Teknologier**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API  

**Kompleksitet**: ⭐⭐⭐⭐ (Avansert - Klar for produksjon i bedriftsmiljø)  

**Perfekt for**: AI-utviklere, løsningsarkitekter og team som bygger produksjonsklare multi-agent systemer  

**Rask Start**: Distribuer hele løsningen på under 30 minutter med den inkluderte ARM-malen via `./deploy.sh -g myResourceGroup`  

## 📋 Bruksanvisning

### Forutsetninger

Før du kjører noen eksempler:  
- ✅ Azure-abonnement med Eier- eller Bidragsyter-tilgang  
- ✅ Azure Developer CLI installert ([Installasjonsveiledning](../docs/chapter-01-foundation/installation.md))  
- ✅ Docker Desktop kjørende (for container-eksempler)  
- ✅ Passende Azure-kvoter (sjekk eksempelspesifikke krav)  

> **💰 Kostnadsadvarsel:** Alle eksempler oppretter ekte Azure-ressurser som medfører kostnader. Se README-filer for hver enkelt for kostnadsoverslag. Husk å kjøre `azd down` når du er ferdig for å unngå løpende kostnader.  

### Kjøre eksempler lokalt

1. **Klon eller Kopier Eksempel**  
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
  
3. **Konfigurer Miljø**  
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
  
5. **Verifiser Distribusjon**  
   ```bash
   # Get service endpoints
   azd env get-values
   
   # Test the endpoint (example)
   curl https://your-app-url.azurecontainer.io/health
   ```
  
   **Forventede suksessindikatorer:**  
   - ✅ `azd up` fullfører uten feil  
   - ✅ Tjenesteendepunkt returnerer HTTP 200  
   - ✅ Azure-portalen viser "Running"-status  
   - ✅ Application Insights mottar telemetri  

> **⚠️ Problemer?** Se [Vanlige Problemer](../docs/chapter-07-troubleshooting/common-issues.md) for feilsøking av distribusjon  

### Tilpasse eksempler

Hvert eksempel inkluderer:  
- **README.md** – Detaljerte oppsett- og tilpasningsinstruksjoner  
- **azure.yaml** – AZD-konfigurasjon med kommentarer  
- **infra/** – Bicep-maler med parameterforklaringer  
- **src/** – Eksempelkode for applikasjon  
- **scripts/** – Hjelpeskript for vanlige oppgaver  

## 🎯 Læringsmål

### Eksempelkategorier

#### **Enkel Distribusjon**  
- Enkelttjenesteapplikasjoner  
- Enkle infrastrukturmønstre  
- Grunnleggende konfigurasjonsstyring  
- Kostnadseffektive utviklingsoppsett  

#### **Avanserte Scenarioer**  
- Multi-tjenestearkitekturer  
- Kompleks nettverkskonfigurasjon  
- Databaseintegrasjonsmønstre  
- Implementeringer av sikkerhet og samsvar  

#### **Produksjonsklare Mønstre**  
- Høy tilgjengelighetskonfigurasjoner  
- Overvåking og observabilitet  
- CI/CD-integrasjon  
- Gjenopprettingsoppsett ved katastrofer  

## 📖 Eksempelbeskrivelser

### Enkel Webapp - Node.js Express  
**Teknologier**: Node.js, Express, MongoDB, Container Apps  
**Kompleksitet**: Nybegynner  
**Konsepter**: Enkel distribusjon, REST API, NoSQL databaseintegrasjon  

### Statisk Nettside - React SPA  
**Teknologier**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Kompleksitet**: Nybegynner  
**Konsepter**: Statisk hosting, serverløs backend, moderne webutvikling  

### Container App - Python Flask  
**Teknologier**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Kompleksitet**: Nybegynner  
**Konsepter**: Containerisering, REST API, scale-to-zero, helsesjekker, overvåking  
**Plassering**: [Lokalt Eksempel](../../../examples/container-app/simple-flask-api)  

### Container App - Mikroservicearkitektur  
**Teknologier**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Kompleksitet**: Avansert  
**Konsepter**: Multi-tjenestearkitektur, tjenestekommunikasjon, meldingskø, distribuert sporing  
**Plassering**: [Lokalt Eksempel](../../../examples/container-app/microservices)  

### Database App - C# med Azure SQL  
**Teknologier**: C# ASP.NET Core, Azure SQL Database, App Service  
**Kompleksitet**: Middels  
**Konsepter**: Entity Framework, databaseforbindelser, web API-utvikling  

### Serverløs Funksjon - Python Azure Functions  
**Teknologier**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Kompleksitet**: Middels  
**Konsepter**: Hendelsesdrevet arkitektur, serverløs databehandling, full-stack utvikling  

### Mikroservice - Java Spring Boot  
**Teknologier**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Kompleksitet**: Middels  
**Konsepter**: Mikroservicekommunikasjon, distribuerte systemer, bedriftsmønstre  

### Microsoft Foundry Eksempler

#### Microsoft Foundry Models Chat App  
**Teknologier**: Microsoft Foundry Models, Cognitive Search, App Service  
**Kompleksitet**: Middels  
**Konsepter**: RAG-arkitektur, vektorsøk, LLM-integrasjon  

#### AI Dokumentbehandling  
**Teknologier**: Azure AI Document Intelligence, Storage, Functions  
**Kompleksitet**: Middels  
**Konsepter**: Dokumentanalyse, OCR, datautvinning  

#### Maskinlæringspipeline  
**Teknologier**: Azure ML, MLOps, Container Registry  
**Kompleksitet**: Avansert  
**Konsepter**: Modelltrening, distribusjonspipeline, overvåking  

## 🛠 Konfigurasjonseksempler

`configurations/`-mappen inneholder gjenbrukbare komponenter:  

### Miljøkonfigurasjoner  
- Utviklingsmiljøinnstillinger  
- Staging-miljøkonfigurasjoner  
- Produksjonsklare konfigurasjoner  
- Multi-region distribusjonsoppsett  

### Bicep-moduler  
- Gjenbrukbare infrastrukturkomponenter  
- Vanlige ressursmønstre  
- Sikkerhetsherdede maler  
- Kostnadsoptimaliserte konfigurasjoner  

### Hjelpeskript  
- Automatisering av miljøoppsett  
- Database-migrasjonsskript  
- Distribusjonsvalideringsverktøy  
- Kostnadsovervåkingsverktøy  

## 🔧 Tilpasningsveiledning

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

| Eksempel                         | Tjenester | Database | Auth      | Overvåking | Kompleksitet |
|---------------------------------|-----------|----------|-----------|------------|--------------|
| **Microsoft Foundry Models Chat** (Lokalt) | 2         | ❌       | Key Vault | Full       | ⭐⭐           |
| **Python Flask API** (Lokalt)              | 1         | ❌       | Grunnleggende | Full       | ⭐            |
| **Mikrotjenester** (Lokalt)                 | 5+        | ✅       | Enterprise | Avansert   | ⭐⭐⭐⭐         |
| Node.js Express Todo                       | 2         | ✅       | Grunnleggende | Grunnleggende | ⭐            |
| React SPA + Functions                      | 3         | ✅       | Grunnleggende | Full       | ⭐            |
| Python Flask Container                     | 2         | ❌       | Grunnleggende | Full       | ⭐            |
| C# Web API + SQL                          | 2         | ✅       | Full      | Full       | ⭐⭐           |
| Python Functions + SPA                     | 3         | ✅       | Full      | Full       | ⭐⭐           |
| Java Mikroservice                         | 5+        | ✅       | Full      | Full       | ⭐⭐           |
| Microsoft Foundry Models Chat              | 3         | ✅       | Full      | Full       | ⭐⭐⭐          |
| AI Dokumentbehandling                      | 2         | ❌       | Grunnleggende | Full       | ⭐⭐           |
| ML Pipeline                               | 4+        | ✅       | Full      | Full       | ⭐⭐⭐⭐         |
| **Retail Multi-Agent** (Lokalt)            | **8+**    | **✅**    | **Enterprise** | **Avansert** | **⭐⭐⭐⭐**     |

## 🎓 Læringssti

### Anbefalt progresjon

1. **Start med Enkel Webapp**  
   - Lær grunnleggende AZD-konsepter  
   - Forstå distribusjonsarbeidsflyt  
   - Øv på miljøstyring  

2. **Prøv Statisk Nettside**  
   - Utforsk ulike hostingvalg  
   - Lær om CDN-integrasjon  
   - Forstå DNS-konfigurasjon  

3. **Gå videre til Container App**  
   - Lær containeriseringsgrunnlag  
   - Forstå skalering  
   - Øv med Docker  

4. **Legg til Databaseintegrasjon**  
   - Lær databaseprovisjonering  
   - Forstå tilkoblingsstrenger  
   - Øv på hemmelighetshåndtering  

5. **Utforsk Serverløs**  
   - Forstå hendelsesdrevet arkitektur  
   - Lær om triggere og bindings  
   - Øv med API-er  

6. **Bygg Mikroservice**  
   - Lær tjenestekommunikasjon  
   - Forstå distribuerte systemer  
   - Øv på komplekse distribusjoner  

## 🔍 Finne riktig eksempel

### Etter Teknologistabel  
- **Container Apps**: [Python Flask API (Lokalt)](../../../examples/container-app/simple-flask-api), [Mikrotjenester (Lokalt)](../../../examples/container-app/microservices), Java Mikroservice  
- **Node.js**: Node.js Express Todo App, [Mikrotjenester API Gateway (Lokalt)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (Lokalt)](../../../examples/container-app/simple-flask-api), [Mikrotjenester Produktservice (Lokalt)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [Mikrotjenester Orderservice (Lokalt)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline  
- **Go**: [Mikrotjenester Userservice (Lokalt)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot Mikroservice  
- **React**: React SPA + Functions  
- **Containere**: [Python Flask (Lokalt)](../../../examples/container-app/simple-flask-api), [Mikrotjenester (Lokalt)](../../../examples/container-app/microservices), Java Mikroservice  
- **Databaser**: [Mikrotjenester (Lokalt)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **AI/ML**: **[Microsoft Foundry Models Chat (Lokalt)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Dokumentbehandling, ML Pipeline, **Retail Multi-Agent Solution**  
- **Multi-Agent Systemer**: **Retail Multi-Agent Solution**  
- **OpenAI Integrasjon**: **[Microsoft Foundry Models Chat (Lokalt)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution  
- **Enterprise Produksjon**: [Mikrotjenester (Lokalt)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### Etter Arkitekturmønster  
- **Enkel REST API**: [Python Flask API (Lokalt)](../../../examples/container-app/simple-flask-api)  
- **Monolittisk**: Node.js Express Todo, C# Web API + SQL  
- **Statisk + Serverløs**: React SPA + Functions, Python Functions + SPA  
- **Mikrotjenester**: [Produksjons-Mikrotjenester (Lokalt)](../../../examples/container-app/microservices), Java Spring Boot Mikroservice  
- **Containerisert**: [Python Flask (Lokalt)](../../../examples/container-app/simple-flask-api), [Mikrotjenester (Lokalt)](../../../examples/container-app/microservices)  
- **AI-drevet**: **[Microsoft Foundry Models Chat (Lokalt)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Dokumentbehandling, ML Pipeline, **Retail Multi-Agent Solution**  
- **Multi-Agent Arkitektur**: **Retail Multi-Agent Solution**  
- **Enterprise Multi-Tjeneste**: [Mikrotjenester (Lokalt)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### Etter Kompleksitetsnivå  
- **Nybegynner**: [Python Flask API (Lokalt)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **Middels**: **[Microsoft Foundry Models Chat (Lokalt)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Mikroservice, Microsoft Foundry Models Chat App, AI Dokumentbehandling  
- **Avansert**: ML Pipeline  
- **Enterprise Produksjonsklart**: [Mikrotjenester (Lokalt)](../../../examples/container-app/microservices) (Multi-tjeneste med meldingskø), **Retail Multi-Agent Solution** (Fullt multi-agent system med ARM-mal distribusjon)  

## 📚 Tilleggsressurser

### Dokumentasjonslenker  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Microsoft Foundry AZD Maler](https://github.com/Azure/ai-foundry-templates)  
- [Bicep Dokumentasjon](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure Arkitektur Senter](https://learn.microsoft.com/en-us/azure/architecture/)  

### Fellesskapseksempler
- [Azure Samples AZD-maler](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry-maler](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI-galleri](https://azure.github.io/awesome-azd/)
- [Todo-app med C# og Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo-app med Python og MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo-app med Node.js og PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React-nettapp med C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions med Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Beste praksis
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Bidra med eksempler

Har du et nyttig eksempel å dele? Vi tar imot bidrag!

### Retningslinjer for innsending
1. Følg den etablerte mappestrukturen
2. Inkluder en omfattende README.md
3. Legg til kommentarer i konfigurasjonsfiler
4. Test grundig før innsending
5. Inkluder kostnadsestimater og forutsetninger

### Struktur for eksempelmal
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

**Profftips**: Start med det enkleste eksempelet som matcher din teknologistabel, og jobb deg så gradvis opp til mer komplekse scenarier. Hvert eksempel bygger på konsepter fra det forrige!

## 🚀 Klar til å starte?

### Din læringssti

1. **Fullstendig nybegynner?** → Start med [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 minutter)
2. **Har grunnleggende AZD-kunnskap?** → Prøv [Mikrotjenester](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 minutter)
3. **Bygger AI-apper?** → Start med [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 minutter) eller utforsk [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ timer)
4. **Trenger spesifikk teknologistabel?** → Bruk delen [Finne riktig eksempel](#-finding-the-right-example) ovenfor

### Neste steg

- ✅ Gå gjennom [Forutsetninger](#forutsetninger) ovenfor
- ✅ Velg et eksempel som passer ditt ferdighetsnivå (se [Vanskelighetsgrad](#kompleksitetsskala))
- ✅ Les eksempels README nøye før du distribuerer
- ✅ Sett en påminnelse om å kjøre `azd down` etter testing
- ✅ Del dine erfaringer via GitHub Issues eller Diskusjoner

### Trenger du hjelp?

- 📖 [FAQ](../resources/faq.md) - Vanlige spørsmål besvart
- 🐛 [Feilsøkingsveiledning](../docs/chapter-07-troubleshooting/common-issues.md) - Løs distribusjonsproblemer
- 💬 [GitHub-diskusjoner](https://github.com/microsoft/AZD-for-beginners/discussions) - Spør fellesskapet
- 📚 [Studieveiledning](../resources/study-guide.md) - Forsterk læringen din

---

**Navigasjon**
- **📚 Kursstart**: [AZD For Beginners](../README.md)
- **📖 Studieressurser**: [Studieveiledning](../resources/study-guide.md) | [Jukseside](../resources/cheat-sheet.md) | [Ordlisten](../resources/glossary.md)
- **🔧 Ressurser**: [FAQ](../resources/faq.md) | [Feilsøking](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Sist oppdatert: november 2025 | [Rapporter problemer](https://github.com/microsoft/AZD-for-beginners/issues) | [Bidra med eksempler](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vennligst vær oppmerksom på at automatiserte oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på dets opprinnelige språk bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår som følge av bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->