# Eksempler - Praktiske AZD-maler og konfigurasjoner

**Lære ved å gjøre - organisert etter kapittel**
- **📚 Kursstart**: [AZD For Nybegynnere](../README.md)
- **📖 Kapitteloversikt**: Eksempler organisert etter læringskompleksitet
- **🚀 Lokalt eksempel**: [Retail Multi-Agent-løsning](retail-scenario.md)
- **🤖 Eksterne AI-eksempler**: Lenker til Azure Samples repositories

> **📍 VIKTIG: Lokale vs Eksterne eksempler**  
> Dette depotet inneholder **4 komplette lokale eksempler** med fullstendige implementasjoner:  
> - **Azure OpenAI Chat** (GPT-4 distribusjon med chattegrensesnitt)  
> - **Container Apps** (Enkel Flask-API + Mikro-tjenester)  
> - **Databaseapp** (Web + SQL Database)  
> - **Retail Multi-Agent** (Enterprise AI-løsning)  
>  
> Ytterligere eksempler er **eksterne referanser** til Azure-Samples repositories som du kan klone.

## Introduksjon

Denne katalogen gir praktiske eksempler og referanser for å hjelpe deg å lære Azure Developer CLI gjennom praktisk øvelse. Retail Multi-Agent-scenariet er en komplett, produksjonsklar implementasjon inkludert i dette depotet. Ytterligere eksempler refererer til offisielle Azure Samples som demonstrerer ulike AZD-mønstre.

### Kompleksitetsvurdering

- ⭐ **Nybegynner** - Grunnleggende konsepter, enkeltjeneste, 15-30 minutter
- ⭐⭐ **Mellomnivå** - Flere tjenester, databaseintegrasjon, 30-60 minutter
- ⭐⭐⭐ **Avansert** - Kompleks arkitektur, AI-integrasjon, 1-2 timer
- ⭐⭐⭐⭐ **Ekspert** - Produksjonsklar, enterprise-mønstre, 2+ timer

## 🎯 Hva finnes faktisk i dette depotet

### ✅ Lokal implementasjon (Klar til bruk)

#### [Azure OpenAI Chat-applikasjon](azure-openai-chat/README.md) 🆕
**Fullstendig GPT-4 distribusjon med chattegrensesnitt inkludert i dette repoet**

- **Lokasjon:** `examples/azure-openai-chat/`
- **Kompleksitet:** ⭐⭐ (Mellomnivå)
- **Inkludert:**
  - Komplett Azure OpenAI distribusjon (GPT-4)
  - Python kommandolinje-chattegrensesnitt
  - Key Vault-integrasjon for sikre API-nøkler
  - Bicep infrastrukturmaler
  - Tokenbruk og kostnadsovervåking
  - Hastighetsbegrensning og feilhåndtering

**Rask start:**
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
**Omfattende containerdistribusjonseksempler inkludert i dette repoet**

- **Lokasjon:** `examples/container-app/`
- **Kompleksitet:** ⭐-⭐⭐⭐⭐ (Nybegynner til Avansert)
- **Inkludert:**
  - [Master Guide](container-app/README.md) - Komplett oversikt over containerdistribusjoner
  - [Enkel Flask API](../../../examples/container-app/simple-flask-api) - Grunnleggende REST API-eksempel
  - [Mikrotjenestearkitektur](../../../examples/container-app/microservices) - Produksjonsklar multi-tjeneste distribusjon
  - Rask start, produksjons- og avanserte mønstre
  - Overvåking, sikkerhet og kostnadsoptimalisering

**Rask start:**
```bash
# Vis hovedguide
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
**Komplett produksjonsklar implementasjon inkludert i dette repoet**

- **Lokasjon:** `examples/retail-multiagent-arm-template/`
- **Kompleksitet:** ⭐⭐⭐⭐ (Avansert)
- **Inkludert:**
  - Komplett ARM distribusjonsmal
  - Multi-agent arkitektur (Kunde + Lager)
  - Azure OpenAI-integrasjon
  - AI Search med RAG
  - Omfattende overvåking
  - Ett-klikk distribusjonsskript

**Rask start:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Teknologier:** Azure OpenAI, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Eksterne Azure Samples (klon for å bruke)

Følgende eksempler vedlikeholdes i offisielle Azure-Samples repositories. Klon dem for å utforske forskjellige AZD-mønstre:

### Enkle applikasjoner (Kapittel 1-2)

| Mal | Repository | Kompleksitet | Tjenester |
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

### AI Applikasjonseksempler (Kapittel 2, 5, 8)

| Mal | Repository | Kompleksitet | Fokus |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI Chat** | [Lokal: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | GPT-4 distribusjon |
| **AI Chat Hurtigstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Grunnleggende AI-chat |
| **AI-agenter** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agent-rammeverk |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG-mønster |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Enterprise AI |

### Database & Avanserte mønstre (Kapittel 3-8)

| Mal | Repository | Kompleksitet | Fokus |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Databaseintegrasjon |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverløs |
| **Java Mikrotjenester** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-tjeneste |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Læringsmål

Ved å jobbe gjennom disse eksemplene vil du:
- Øve på Azure Developer CLI arbeidsflyter med realistiske applikasjonsscenarier
- Forstå ulike applikasjonsarkitekturer og deres azd-implementasjoner
- Mestre Infrastruktur som kode-mønstre for ulike Azure-tjenester
- Anvende konfigurasjonsstyring og miljøspesifikke distribusjonsstrategier
- Implementere overvåking, sikkerhet og skaleringsmønstre i praktiske kontekster
- Bygge erfaring med feilsøking og debugging av reelle distribusjonsscenarier

## Læringsutbytte

Etter å ha fullført disse eksemplene vil du kunne:
- Distribuere ulike applikasjonstyper ved bruk av Azure Developer CLI med selvtillit
- Tilpasse leverte maler til dine egne applikasjonskrav
- Designe og implementere egendefinerte infrastruktur-mønstre ved bruk av Bicep
- Konfigurere komplekse multi-tjenesteapplikasjoner med riktige avhengigheter
- Anvende sikkerhets-, overvåkings- og ytelsesbest practices i reelle scenarier
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

## Rask start-eksempler

> **💡 Ny til AZD?** Start med eksempel #1 (Flask API) - det tar ~20 minutter og lærer kjernebegreper.

### For Nybegynnere
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Lokalt) ⭐  
   Distribuer et enkelt REST API med skaler-til-null  
   **Tid:** 20-25 minutter | **Kostnad:** $0-5/måned  
   **Du vil lære:** Grunnleggende azd arbeidsflyt, containerisering, helsesjekker  
   **Forventet resultat:** Funksjonell API-endpoint som returnerer "Hello, World!" med overvåking

2. **[Enkel Webapp - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Distribuer en Node.js Express webapplikasjon med MongoDB  
   **Tid:** 25-35 minutter | **Kostnad:** $10-30/måned  
   **Du vil lære:** Databaseintegrasjon, miljøvariabler, tilkoblingsstrenger  
   **Forventet resultat:** Todo-liste-app med opprett/les/oppdater/slett-funksjonalitet

3. **[Statisk nettside - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Host en React statisk nettside med Azure Static Web Apps  
   **Tid:** 20-30 minutter | **Kostnad:** $0-10/måned  
   **Du vil lære:** Statisk hosting, serverløse funksjoner, CDN-distribusjon  
   **Forventet resultat:** React UI med API backend, automatisk SSL, global CDN

### For Mellomnivåbrukere
4. **[Azure OpenAI Chat-applikasjon](../../../examples/azure-openai-chat)** (Lokalt) ⭐⭐  
   Distribuer GPT-4 med chattegrensesnitt og sikker API-nøkkelhåndtering  
   **Tid:** 35-45 minutter | **Kostnad:** $50-200/måned  
   **Du vil lære:** Azure OpenAI distribusjon, Key Vault-integrasjon, tokensporing  
   **Forventet resultat:** Funksjonell chatteapplikasjon med GPT-4 og kostnadsmonitorering

5. **[Container App - Mikrotjenester](../../../examples/container-app/microservices)** (Lokalt) ⭐⭐⭐⭐  
   Produksjonsklar multi-tjenestearkitektur  
   **Tid:** 45-60 minutter | **Kostnad:** $50-150/måned  
   **Du vil lære:** Tjenestekommunikasjon, meldingkø, distribuert sporing  
   **Forventet resultat:** 2-tjeneste system (API Gateway + Produktjeneste) med overvåking

6. **[Databaseapp - C# med Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Webapplikasjon med C# API og Azure SQL Database  
   **Tid:** 30-45 minutter | **Kostnad:** $20-80/måned  
   **Du vil lære:** Entity Framework, databasemigrasjoner, sikker tilkobling  
   **Forventet resultat:** C# API med Azure SQL backend, automatisk skjema-distribusjon

7. **[Serverløs funksjon - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions med HTTP-utløsere og Cosmos DB  
   **Tid:** 30-40 minutter | **Kostnad:** $10-40/måned  
   **Du vil lære:** Hendelsesdrevet arkitektur, serverløs skalering, NoSQL-integrasjon  
   **Forventet resultat:** Funksjonsapp som reagerer på HTTP-forespørsler med Cosmos DB lagring

8. **[Mikrotjenester - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Multi-tjeneste Java-applikasjon med Container Apps og API-gateway  
   **Tid:** 60-90 minutter | **Kostnad:** $80-200/måned  
   **Du vil lære:** Spring Boot distribusjon, tjenestemesh, lastbalansering  
   **Forventet resultat:** Multi-tjenestesystem i Java med tjenesteoppdagelse og ruting

### Microsoft Foundry Maler

1. **[Azure OpenAI Chat App - Lokalt eksempel](../../../examples/azure-openai-chat)** ⭐⭐  
   Komplett GPT-4 distribusjon med chattegrensesnitt  
   **Tid:** 35-45 minutter | **Kostnad:** $50-200/måned  
   **Forventet resultat:** Funksjonell chatteapplikasjon med token-sporing og kostnadsmonitorering

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Intelligent chatteapplikasjon med RAG-arkitektur  
   **Tid:** 60-90 minutter | **Kostnad:** $100-300/måned  
   **Forventet resultat:** RAG-drevet chattegrensesnitt med dokumentsøk og henvisninger

3. **[AI Dokumentbehandling](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Dokumentanalyse ved bruk av Azure AI-tjenester  
   **Tid:** 40-60 minutter | **Kostnad:** $20-80/måned  
   **Forventet resultat:** API som trekker ut tekst, tabeller og enheter fra opplastede dokumenter

4. **[Maskinlæringspipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps arbeidsflyt med Azure Machine Learning  
   **Tid:** 2-3 timer | **Kostnad:** $150-500/måned  
   **Forventet resultat:** Automatisert ML-pipeline med trening, distribusjon og overvåking

### Virkelige scenarier

#### **Retail Multi-Agent-løsning** 🆕
**[Komplett implementasjonsveiledning](./retail-scenario.md)**

En omfattende, produksjonsklar multi-agent kundestøtteløsning som demonstrerer enterprise-grad AI-applikasjonsdistribusjon med AZD. Dette scenariet tilbyr:

- **Komplett arkitektur**: Multi-agent system med spesialiserte kundeservice- og lagerstyrings-agenter
- **Produksjonsinfrastruktur**: Multi-region Azure OpenAI-distribusjoner, AI Search, Container Apps, og omfattende overvåking  
- **Klar-til-distribusjon ARM-mal**: Ett-klikks distribusjon med flere konfigurasjonsmodi (Minimal/Standard/Premium)  
- **Avanserte funksjoner**: Red teaming sikkerhetsvalidering, agent evalueringsrammeverk, kostnadsoptimalisering og feilsøkingsguider  
- **Reell forretningskontekst**: Brukstilfelle for kundestøtte hos detaljhandel med filopplasting, søkintegrasjon og dynamisk skalering  

**Teknologier**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API  

**Kompleksitet**: ⭐⭐⭐⭐ (Avansert - Klar for bedriftsproduksjon)  

**Perfekt for**: AI-utviklere, løsningsarkitekter og team som bygger produksjonsklare multi-agent systemer  

**Rask start**: Distribuer hele løsningen på under 30 minutter ved hjelp av inkludert ARM-mal med `./deploy.sh -g myResourceGroup`  

## 📋 Bruksanvisning

### Forutsetninger

Før du kjører noen eksempler:  
- ✅ Azure-abonnement med Eier eller Bidragsyter-tilgang  
- ✅ Azure Developer CLI installert ([Installasjonsguide](../docs/chapter-01-foundation/installation.md))  
- ✅ Docker Desktop kjørende (for container-eksempler)  
- ✅ Passende Azure-kvoter (sjekk eksempelspesifikke krav)  

> **💰 Kostnadsadvarsel:** Alle eksempler oppretter ekte Azure-ressurser som påløper kostnader. Se individuelle README-filer for kostnadsestimater. Husk å kjøre `azd down` når du er ferdig for å unngå løpende kostnader.  

### Kjøre eksempler lokalt

1. **Klon eller kopier eksempel**  
   ```bash
   # Naviger til ønsket eksempel
   cd examples/simple-web-app
   ```
  
2. **Initialiser AZD-miljøet**  
   ```bash
   # Initialiser med eksisterende mal
   azd init
   
   # Eller opprett nytt miljø
   azd env new my-environment
   ```
  
3. **Konfigurer miljøet**  
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
  
5. **Verifiser distribusjonen**  
   ```bash
   # Get service endpoints
   azd env get-values
   
   # Test the endpoint (example)
   curl https://your-app-url.azurecontainer.io/health
   ```
    
   **Forventede suksessindikatorer:**  
   - ✅ `azd up` fullfører uten feil  
   - ✅ Tjenende endepunkt returnerer HTTP 200  
   - ✅ Azure-portalen viser statusen "Kjører"  
   - ✅ Application Insights mottar telemetri  

> **⚠️ Problemer?** Se [Vanlige problemer](../docs/chapter-07-troubleshooting/common-issues.md) for feilsøking ved distribusjon  

### Tilpasse eksempler

Hvert eksempel inkluderer:  
- **README.md** - Detaljerte oppsett- og tilpasningsinstruksjoner  
- **azure.yaml** - AZD-konfigurasjon med kommentarer  
- **infra/** - Bicep-maler med parameterforklaringer  
- **src/** - Eksempelkode for applikasjon  
- **scripts/** - Hjelpeskript for vanlige oppgaver  

## 🎯 Læringsmål

### Eksempelkategorier

#### **Grunnleggende distribusjoner**  
- Enkelttjenesteapplikasjoner  
- Enkle infrastrukturmønstre  
- Grunnleggende konfigurasjonsadministrasjon  
- Kostnadseffektive utviklingsoppsett  

#### **Avanserte scenarioer**  
- Arkitektur med flere tjenester  
- Komplekse nettverkskonfigurasjoner  
- Databaseintegrasjonsmønstre  
- Sikkerhets- og samsvarsgjennomføringer  

#### **Produksjonsklare mønstre**  
- Høy tilgjengelighetskonfigurasjoner  
- Overvåking og observabilitet  
- CI/CD-integrasjon  
- Oppsett for katastrofegjenoppretting  

## 📖 Eksempelbeskrivelser

### Enkel Web-app - Node.js Express  
**Teknologier**: Node.js, Express, MongoDB, Container Apps  
**Kompleksitet**: Nybegynner  
**Konsepter**: Grunnleggende distribusjon, REST API, NoSQL-databaseintegrasjon  

### Statisk nettsted - React SPA  
**Teknologier**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Kompleksitet**: Nybegynner  
**Konsepter**: Statisk hosting, serverløs backend, moderne webutvikling  

### Container App - Python Flask  
**Teknologier**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Kompleksitet**: Nybegynner  
**Konsepter**: Containerisering, REST API, scale-to-zero, helsesjekk, overvåking  
**Lokasjon**: [Lokalt eksempel](../../../examples/container-app/simple-flask-api)  

### Container App - Mikrotjenestearkitektur  
**Teknologier**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Kompleksitet**: Avansert  
**Konsepter**: Arkitektur med flere tjenester, tjenestekommunikasjon, meldingskø, distribuert sporing  
**Lokasjon**: [Lokalt eksempel](../../../examples/container-app/microservices)  

### Database-app - C# med Azure SQL  
**Teknologier**: C# ASP.NET Core, Azure SQL Database, App Service  
**Kompleksitet**: Mellomnivå  
**Konsepter**: Entity Framework, databasetilkoblinger, web-API-utvikling  

### Serverløs funksjon - Python Azure Functions  
**Teknologier**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Kompleksitet**: Mellomnivå  
**Konsepter**: Hendelsesdrevet arkitektur, serverløs databehandling, full-stack utvikling  

### Mikrotjenester - Java Spring Boot  
**Teknologier**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Kompleksitet**: Mellomnivå  
**Konsepter**: Mikrotjenestekommunikasjon, distribuerte systemer, bedriftsmønstre  

### Microsoft Foundry-eksempler

#### Azure OpenAI Chat App  
**Teknologier**: Azure OpenAI, Cognitive Search, App Service  
**Kompleksitet**: Mellomnivå  
**Konsepter**: RAG-arkitektur, vektorsøk, LLM-integrasjon  

#### AI Dokumentbehandling  
**Teknologier**: Azure AI Document Intelligence, Storage, Functions  
**Kompleksitet**: Mellomnivå  
**Konsepter**: Dokumentanalyse, OCR, datauthenting  

#### Maskinlærings-pipeline  
**Teknologier**: Azure ML, MLOps, Container Registry  
**Kompleksitet**: Avansert  
**Konsepter**: Modelltrening, distribusjonspipelines, overvåking  

## 🛠 Konfigurasjonseksempler

Katalogen `configurations/` inneholder gjenbrukbare komponenter:  

### Miljøkonfigurasjoner  
- Innstillinger for utviklingsmiljø  
- Konfigurasjoner for staging-miljø  
- Produksjonsklare konfigurasjoner  
- Oppsett for multi-region distribusjon  

### Bicep-moduler  
- Gjenbrukbare infrastrukturkomponenter  
- Vanlige ressursmønstre  
- Sikkerhetsharde maler  
- Kostnadsoptimaliserte konfigurasjoner  

### Hjelpeskript  
- Automatisering av miljøoppsett  
- Skript for database-migrering  
- Verktøy for validering av distribusjon  
- Verktøy for kostnadsovervåking  

## 🔧 Tilpasningsveiledning

### Tilpasse eksempler til ditt brukstilfelle

1. **Gå gjennom forutsetninger**  
   - Sjekk Azure-tjeneste krav  
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
   - Gå gjennom tilgangskontroller  
   - Implementer hemmelighetshåndtering  
   - Aktiver overvåking og varsling  

## 📊 Sammenligningsmatrise

| Eksempel                  | Tjenester | Database | Autentisering | Overvåking | Kompleksitet |
|---------------------------|-----------|----------|---------------|------------|--------------|
| **Azure OpenAI Chat** (Lokalt) | 2         | ❌        | Key Vault     | Full       | ⭐⭐           |
| **Python Flask API** (Lokalt)   | 1         | ❌        | Grunnleggende | Full       | ⭐            |
| **Mikrotjenester** (Lokalt)     | 5+        | ✅        | Enterprise    | Avansert   | ⭐⭐⭐⭐         |
| Node.js Express Todo            | 2         | ✅        | Grunnleggende | Grunnleggende | ⭐          |
| React SPA + Functions           | 3         | ✅        | Grunnleggende | Full       | ⭐            |
| Python Flask Container          | 2         | ❌        | Grunnleggende | Full       | ⭐            |
| C# Web API + SQL                | 2         | ✅        | Full          | Full       | ⭐⭐           |
| Python Functions + SPA          | 3         | ✅        | Full          | Full       | ⭐⭐           |
| Java Mikrotjenester             | 5+        | ✅        | Full          | Full       | ⭐⭐           |
| Azure OpenAI Chat               | 3         | ✅        | Full          | Full       | ⭐⭐⭐          |
| AI Dokumentbehandling           | 2         | ❌        | Grunnleggende | Full       | ⭐⭐           |
| ML Pipeline                    | 4+        | ✅        | Full          | Full       | ⭐⭐⭐⭐         |
| **Retail Multi-Agent** (Lokalt) | **8+**    | **✅**    | **Enterprise**| **Avansert**| **⭐⭐⭐⭐**     |

## 🎓 Læringssti

### Anbefalt progresjon

1. **Start med enkel Web-app**  
   - Lær grunnleggende AZD-konsepter  
   - Forstå distribusjonsflyt  
   - Øv på miljøhåndtering  

2. **Prøv statisk nettsted**  
   - Utforsk ulike hostingalternativer  
   - Lær om CDN-integrasjon  
   - Forstå DNS-konfigurasjon  

3. **Gå videre til Container App**  
   - Lær grunnleggende containerisering  
   - Forstå skalering  
   - Øv med Docker  

4. **Legg til databaseintegrasjon**  
   - Lær om databaseprovisjonering  
   - Forstå tilkoblingsstrenger  
   - Øv på hemmelighetshåndtering  

5. **Utforsk serverløst**  
   - Forstå hendelsesdrevet arkitektur  
   - Lær om triggere og bindings  
   - Øv med API-er  

6. **Bygg mikrotjenester**  
   - Lær tjenestekommunikasjon  
   - Forstå distribuerte systemer  
   - Øv på komplekse distribusjoner  

## 🔍 Finne riktig eksempel

### Etter teknologistakk  
- **Container Apps**: [Python Flask API (Lokalt)](../../../examples/container-app/simple-flask-api), [Mikrotjenester (Lokalt)](../../../examples/container-app/microservices), Java Mikrotjenester  
- **Node.js**: Node.js Express Todo App, [Mikrotjenester API Gateway (Lokalt)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (Lokalt)](../../../examples/container-app/simple-flask-api), [Mikrotjenester Produktservice (Lokalt)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [Mikrotjenester Ordreservice (Lokalt)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline  
- **Go**: [Mikrotjenester Brukerservice (Lokalt)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot Mikrotjenester  
- **React**: React SPA + Functions  
- **Containere**: [Python Flask (Lokalt)](../../../examples/container-app/simple-flask-api), [Mikrotjenester (Lokalt)](../../../examples/container-app/microservices), Java Mikrotjenester  
- **Databaser**: [Mikrotjenester (Lokalt)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **AI/ML**: **[Azure OpenAI Chat (Lokalt)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Dokumentbehandling, ML Pipeline, **Retail Multi-Agent Solution**  
- **Multi-Agent Systemer**: **Retail Multi-Agent Solution**  
- **OpenAI-integrasjon**: **[Azure OpenAI Chat (Lokalt)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution  
- **Enterprise-produksjon**: [Mikrotjenester (Lokalt)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### Etter arkitekturmønster  
- **Enkel REST API**: [Python Flask API (Lokalt)](../../../examples/container-app/simple-flask-api)  
- **Monolittisk**: Node.js Express Todo, C# Web API + SQL  
- **Statisk + Serverløs**: React SPA + Functions, Python Functions + SPA  
- **Mikrotjenester**: [Produksjon Mikrotjenester (Lokalt)](../../../examples/container-app/microservices), Java Spring Boot Mikrotjenester  
- **Containerbasert**: [Python Flask (Lokalt)](../../../examples/container-app/simple-flask-api), [Mikrotjenester (Lokalt)](../../../examples/container-app/microservices)  
- **AI-drevet**: **[Azure OpenAI Chat (Lokalt)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Dokumentbehandling, ML Pipeline, **Retail Multi-Agent Solution**  
- **Multi-Agent Arkitektur**: **Retail Multi-Agent Solution**  
- **Enterprise Multi-Tjeneste**: [Mikrotjenester (Lokalt)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### Etter kompleksitetsnivå  
- **Nybegynner**: [Python Flask API (Lokalt)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **Mellomnivå**: **[Azure OpenAI Chat (Lokalt)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Mikrotjenester, Azure OpenAI Chat App, AI Dokumentbehandling  
- **Avansert**: ML Pipeline  
- **Enterprise produksjonsklar**: [Mikrotjenester (Lokalt)](../../../examples/container-app/microservices) (Multi-tjeneste med meldingskø), **Retail Multi-Agent Solution** (Fullt multi-agent system med ARM-mal distribusjon)  

## 📚 Tilleggsressurser

### Dokumentasjonslenker  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)  
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  

### Fellesskaps-eksempler  
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)  
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)  
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)  
- [Todo App med C# og Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)  
- [Todo App med Python og MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo-app med Node.js og PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web App med C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions med Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Beste praksis
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Bidra med eksempler

Har du et nyttig eksempel å dele? Vi tar imot bidrag!

### Retningslinjer for innsending
1. Følg den etablerte katalogstrukturen
2. Inkluder omfattende README.md
3. Legg til kommentarer i konfigurasjonsfiler
4. Test grundig før innsending
5. Inkluder kostnadsestimater og forutsetninger

### Eksempels malstruktur
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

**Profftips**: Start med det enkleste eksempelet som matcher din teknologistabel, og jobb deg gradvis opp til mer komplekse scenarier. Hvert eksempel bygger på konsepter fra de foregående!

## 🚀 Klar til å starte?

### Din læringssti

1. **Fullstendig nybegynner?** → Start med [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 min)
2. **Har grunnleggende AZD-kunnskap?** → Prøv [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 min)
3. **Bygger AI-apper?** → Start med [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 min) eller utforsk [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ timer)
4. **Trenger spesifikk teknologistabel?** → Bruk [Finne riktig eksempel](../../../examples) seksjonen ovenfor

### Neste steg

- ✅ Gå gjennom [Forutsetninger](../../../examples) ovenfor
- ✅ Velg et eksempel som passer ditt ferdighetsnivå (se [Kompleksitetslegende](../../../examples))
- ✅ Les eksempelets README nøye før distribusjon
- ✅ Sett en påminnelse om å kjøre `azd down` etter testing
- ✅ Del din erfaring via GitHub Issues eller Discussions

### Trenger du hjelp?

- 📖 [FAQ](../resources/faq.md) - Vanlige spørsmål besvart
- 🐛 [Feilsøkingsguide](../docs/chapter-07-troubleshooting/common-issues.md) - Fiks distribusjonsproblemer
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Still spørsmål til fellesskapet
- 📚 [Studieguide](../resources/study-guide.md) - Forsterk læringen din

---

**Navigasjon**
- **📚 Kursstart**: [AZD For Beginners](../README.md)
- **📖 Studieressurser**: [Studieguide](../resources/study-guide.md) | [Jukseside](../resources/cheat-sheet.md) | [Ordlista](../resources/glossary.md)
- **🔧 Ressurser**: [FAQ](../resources/faq.md) | [Feilsøking](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Sist oppdatert: November 2025 | [Rapporter problemer](https://github.com/microsoft/AZD-for-beginners/issues) | [Bidra med eksempler](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vennligst vær oppmerksom på at automatiserte oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->