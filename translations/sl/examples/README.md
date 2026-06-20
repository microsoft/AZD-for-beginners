# Primeri - Praktične AZD predloge in konfiguracije

**Učenje preko primerov - urejeno po poglavjih**
- **📚 Course Home**: [AZD za začetnike](../README.md)
- **📖 Preslikava poglavij**: Primeri organizirani po zahtevnosti učenja
- **🚀 Lokalni primer**: [Rešitev za maloprodajo z več agenti](retail-scenario.md)
- **🤖 Zunanji AI primeri**: Povezave do repozitorijev Azure Samples

> **📍 POMEMBNO: Lokalni proti zunanjim primerom**  
> Ta repozitorij vsebuje **4 kompletne lokalne primere** s polnimi implementacijami:  
> - **Microsoft Foundry Models Chat** (namestitev gpt-4.1 s klepetalnim vmesnikom)  
> - **Container Apps** (Enostaven Flask API + mikroservisi)  
> - **Database App** (Splet + SQL baza)  
> - **Rešitev za maloprodajo z več agenti** (podjetnaška AI rešitev)  
>  
> Dodatni primeri so **zunanji viri** v repozitorijih Azure-Samples, ki jih lahko klonirate.

## Uvod

Ta imenik ponuja praktične primere in reference, ki vam pomagajo spoznati Azure Developer CLI skozi praktično delo. Scenarij Rešitve za maloprodajo z več agenti je popolna, produkcijsko pripravljena implementacija, vključena v ta repozitorij. Dodatni primeri se sklicujejo na uradne Azure Samples, ki prikazujejo različne AZD vzorce.

### Legenda ocene zahtevnosti

- ⭐ **Začetnik** - Osnovni koncepti, ena storitev, 15-30 minut
- ⭐⭐ **Srednje** - Več storitev, integracija baze podatkov, 30-60 minut
- ⭐⭐⭐ **Napredno** - Kompleksna arhitektura, integracija AI, 1-2 uri
- ⭐⭐⭐⭐ **Strokovno** - Produkcijsko pripravljeno, podjetniški vzorci, 2+ uri

## 🎯 Kaj je v tem repozitoriju

### ✅ Lokalna implementacija (Pripravljeno za uporabo)

#### [Microsoft Foundry Models Chat Aplikacija](azure-openai-chat/README.md) 🆕
**Popolna namestitev gpt-4.1 s klepetalnim vmesnikom, vključena v ta repozitorij**

- **Location:** `examples/azure-openai-chat/`
- **Complexity:** ⭐⭐ (Srednje)
- **What's Included:**
  - Popolna Microsoft Foundry Models namestitev (gpt-4.1)
  - Python ukazni klepetalni vmesnik
  - Integracija z Key Vault za varne API ključe
  - Bicep predloge infrastrukture
  - Sledenje uporabi tokenov in stroškom
  - Omejevanje hitrosti in ravnanje z napakami

**Hitri začetek:**
```bash
# Pojdi v mapo example
cd examples/azure-openai-chat

# Razporedi vse
azd up

# Namesti odvisnosti in začni klepetati
pip install -r src/requirements.txt
python src/chat.py
```

**Tehnologije:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Container App Examples](container-app/README.md) 🆕
**Obsežni primeri nameščanja kontejnerjev, vključeni v ta repozitorij**

- **Location:** `examples/container-app/`
- **Complexity:** ⭐-⭐⭐⭐⭐ (Začetnik do Napredno)
- **What's Included:**
  - [Glavni vodnik](container-app/README.md) - Celovit pregled nameščanja kontejnerjev
  - [Enostaven Flask API](../../../examples/container-app/simple-flask-api) - Osnovni primer REST API
  - [Arhitektura mikroservisov](../../../examples/container-app/microservices) - Produkcijsko pripravljen večstoritveni deployment
  - Hitri začetek, produkcijski in napredni vzorci
  - Nadzor, varnost in optimizacija stroškov

**Hitri začetek:**
```bash
# Oglej si glavni vodič
cd examples/container-app

# Postavi preprost Flask API
cd simple-flask-api
azd up

# Postavi primer mikrostoritev
cd ../microservices
azd up
```

**Tehnologije:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Rešitev za maloprodajo z več agenti](retail-scenario.md) 🆕
**Popolna produkcijsko pripravljena implementacija vključena v ta repozitorij**

- **Location:** `examples/retail-multiagent-arm-template/`
- **Complexity:** ⭐⭐⭐⭐ (Napredno)
- **What's Included:**
  - Popolna ARM predloga za namestitev
  - Arhitektura z več agenti (stranka + inventar)
  - Integracija Microsoft Foundry Models
  - AI iskanje z RAG
  - Celovito spremljanje
  - Skript za namestitev z enim klikom

**Hitri začetek:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Tehnologije:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Zunanji Azure Samples (klonirajte za uporabo)

Naslednji primeri so vzdrževani v uradnih repozitorijih Azure-Samples. Klonirajte jih, da raziščete različne AZD vzorce:

### Enostavne aplikacije (Poglavja 1-2)

| Predloga | Repozitorij | Zahtevnost | Storitve |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Lokalno: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Lokalno: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-service, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Kako uporabljati:**
```bash
# Kloniraj poljuben primer
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Namesti
azd up
```

### AI aplikacijski primeri (Poglavja 2, 5, 8)

| Predloga | Repozitorij | Zahtevnost | Fokus |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [Lokalno: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | namestitev gpt-4.1 |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Osnovni AI klepet |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Okvir za agente |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG vzorec |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Podjetniški AI |

### Baze podatkov & napredni vzorci (Poglavja 3-8)

| Predloga | Repozitorij | Zahtevnost | Fokus |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Integracija baze podatkov |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL brez strežnika |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Večstoritvena arhitektura |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Cilji učenja

Z delom na teh primerih boste:
- Vadili delovne tokove Azure Developer CLI z realističnimi scenariji aplikacij
- Razumeli različne arhitekture aplikacij in njihove azd implementacije
- Obvladali vzorce Infrastructure as Code za različne Azure storitve
- Uporabili upravljanje konfiguracij in strategije nameščanja, specifične za okolje
- Uvedli vzorce nadzora, varnosti in skaliranja v praktičnih kontekstih
- Pridobili izkušnje z odpravljanjem napak in diagnostiko pri resničnih scenarijih nameščanja

## Rezultati učenja

Po zaključku teh primerov boste lahko:
- Z zaupanjem nameščali različne vrste aplikacij z uporabo Azure Developer CLI
- Prilagodili predloge svojim zahtevam aplikacij
- Oblikovali in implementirali prilagojene infrastrukturne vzorce z uporabo Bicep
- Konfigurirali kompleksne večstoritvene aplikacije s pravilnimi odvisnostmi
- Uporabili najboljše prakse za varnost, nadzor in zmogljivost v resničnih scenarijih
- Odpravljali težave in optimizirali nameščanja na podlagi praktičnih izkušenj

## Struktura imenika

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

## Hitri primeri za začetek

> **💡 Nov pri AZD?** Začnite s primerom #1 (Flask API) - traja približno 20 minut in uči osnovne koncepte.

### Za začetnike
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Lokalno) ⭐  
   Namestite preprost REST API s skaliranjem na nič  
   **Čas:** 20-25 minut | **Strošek:** $0-5/mesec  
   **Se boste naučili:** Osnovni azd delovni tok, kontejnerizacija, health probe  
   **Pričakovani rezultat:** Delujoč API endpoint, ki vrača "Hello, World!" z nadzorom

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Namestite Node.js Express spletno aplikacijo z MongoDB  
   **Čas:** 25-35 minut | **Strošek:** $10-30/mesec  
   **Se boste naučili:** Integracija baze podatkov, spremenljivke okolja, connection stringi  
   **Pričakovani rezultat:** Aplikacija za seznam opravil z ustvarjanjem/branjem/posodabljanjem/brisanje funkcionalnostjo

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Gostite React statično spletno aplikacijo z Azure Static Web Apps  
   **Čas:** 20-30 minut | **Strošek:** $0-10/mesec  
   **Se boste naučili:** Statično gostovanje, serverless funkcije, nameščanje CDN  
   **Pričakovani rezultat:** React vmesnik s API backendom, samodejni SSL, globalni CDN

### Za vmesne uporabnike
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (Lokalno) ⭐⭐  
   Namestite gpt-4.1 s klepetalnim vmesnikom in varnim upravljanjem API ključev  
   **Čas:** 35-45 minut | **Strošek:** $50-200/mesec  
   **Se boste naučili:** Namestitev Microsoft Foundry Models, integracija Key Vault, sledenje tokenov  
   **Pričakovani rezultat:** Delujoča klepetalna aplikacija z gpt-4.1 in spremljanjem stroškov

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Lokalno) ⭐⭐⭐⭐  
   Produkcijsko pripravljena večstoritvena arhitektura  
   **Čas:** 45-60 minut | **Strošek:** $50-150/mesec  
   **Se boste naučili:** Komunikacija med storitvami, čakalne vrste sporočil, distribuirano sledenje  
   **Pričakovani rezultat:** Sistem z 2 storitvama (API Gateway + Product Service) z nadzorom

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Spletna aplikacija z C# API in Azure SQL bazo  
   **Čas:** 30-45 minut | **Strošek:** $20-80/mesec  
   **Se boste naučili:** Entity Framework, migracije baze, varnost povezav  
   **Pričakovani rezultat:** C# API z Azure SQL backendom in samodejno namestitvijo sheme

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions z HTTP sprožilci in Cosmos DB  
   **Čas:** 30-40 minut | **Strošek:** $10-40/mesec  
   **Se boste naučili:** Dogodkovno usmerjena arhitektura, serverless skaliranje, NoSQL integracija  
   **Pričakovani rezultat:** Function app, ki odgovarja na HTTP zahteve s shranjevanjem v Cosmos DB

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Večstoritvena Java aplikacija z Container Apps in API gateway  
   **Čas:** 60-90 minut | **Strošek:** $80-200/mesec  
   **Se boste naučili:** Nameščanje Spring Boot, service mesh, uravnoteženje obremenitve  
   **Pričakovani rezultat:** Večstoritveni Java sistem s service discovery in usmerjanjem

### Microsoft Foundry predloge

1. **[Microsoft Foundry Models Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   Popolna namestitev gpt-4.1 s klepetalnim vmesnikom  
   **Čas:** 35-45 minut | **Strošek:** $50-200/mesec  
   **Pričakovani rezultat:** Delujoča klepetalna aplikacija s sledenjem tokenov in spremljanjem stroškov

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Inteligentna klepetalna aplikacija z RAG arhitekturo  
   **Čas:** 60-90 minut | **Strošek:** $100-300/mesec  
   **Pričakovani rezultat:** Klepetalni vmesnik, podprt z RAG, z iskanjem dokumentov in citiranjem virov

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Analiza dokumentov z uporabo Azure AI storitev  
   **Čas:** 40-60 minut | **Strošek:** $20-80/mesec  
   **Pričakovani rezultat:** API, ki iz dokumentov izvleče besedilo, tabele in entitete

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps delovni tok z Azure Machine Learning  
   **Čas:** 2-3 ure | **Strošek:** $150-500/mesec  
   **Pričakovani rezultat:** Avtomatiziran ML pipeline z usposabljanjem, nameščanjem in spremljanjem

### Resnični scenariji

#### **Rešitev za maloprodajo z več agenti** 🆕  
**[Celovit vodič za implementacijo](./retail-scenario.md)**

Celovita, produkcijsko pripravljena večagentna rešitev za podporo strankam, ki prikazuje uvajanje podjetniških AI aplikacij z AZD. Ta scenarij ponuja:

- **Celotna arhitektura**: Sistem z več agenti z namensko podporo strankam in upravljanjem inventarja
- **Produkcijska infrastruktura**: Večregijska nameščanja Microsoft Foundry Models, AI Search, Container Apps, in celovito spremljanje
- **Predloga ARM pripravljena za nameščanje**: Enoklikovna namestitev z več načini konfiguracije (Minimalni/Standardni/Premium)
- **Napredne funkcije**: Validacija varnosti z red teamingom, okvir za ocenjevanje agentov, optimizacija stroškov in vodniki za odpravljanje težav
- **Resnični poslovni kontekst**: Primer uporabe podpore strankam trgovca z nalaganjem datotek, integracijo iskanja in dinamičnim skaliranjem

**Tehnologije**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Kompleksnost**: ⭐⭐⭐⭐ (Napredno - pripravljeno za proizvodnjo v podjetju)

**Popolno za**: AI razvijalce, arhitekte rešitev in ekipe, ki gradijo proizvodne sisteme z več agenti

**Hiter začetek**: Namestite celotno rešitev v manj kot 30 minutah z vključeno ARM predlogo z `./deploy.sh -g myResourceGroup`

## 📋 Navodila za uporabo

### Predpogoji

Pred izvajanjem katerega koli primera:
- ✅ Azure naročnina z dovoljenji v vlogi Lastnik ali Sodelavec
- ✅ Azure Developer CLI je nameščen ([Vodnik za namestitev](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop zaženjen (za primere s kontejnerji)
- ✅ Ustrezne Azure kvote (preverite zahteve za posamezne primere)

> **💰 Opozorilo glede stroškov:** Vsi primeri ustvarijo dejanske Azure vire, ki povzročajo stroške. Za ocene stroškov preverite posamezne datoteke README. Ne pozabite zagnati `azd down`, ko končate, da se izognete nadaljnjim stroškom.

### Zagon primerov lokalno

1. **Klonirajte ali kopirajte primer**
   ```bash
   # Pojdite do želenega primera
   cd examples/simple-web-app
   ```

2. **Inicializirajte AZD okolje**
   ```bash
   # Inicializirajte z obstoječo predlogo
   azd init
   
   # Ali pa ustvarite novo okolje
   azd env new my-environment
   ```

3. **Konfigurirajte okolje**
   ```bash
   # Nastavi zahtevane spremenljivke
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Razmestitev**
   ```bash
   # Razmestite infrastrukturo in aplikacijo
   azd up
   ```

5. **Preverite razmestitev**
   ```bash
   # Pridobi končne točke storitve
   azd env get-values
   
   # Preizkusi končno točko (primer)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Pričakovani kazalci uspeha:**
   - ✅ `azd up` se izvede brez napak
   - ✅ Končna točka storitve vrne HTTP 200
   - ✅ Azure Portal prikazuje stanje "Running"
   - ✅ Application Insights prejema telemetrijo

> **⚠️ Težave?** Oglejte si [Pogoste težave](../docs/chapter-07-troubleshooting/common-issues.md) za odpravljanje težav pri razmestitvi

### Prilagajanje primerov

Vsak primer vsebuje:
- **README.md** - Podrobna navodila za nastavitev in prilagoditev
- **azure.yaml** - AZD konfiguracija s komentarji
- **infra/** - Bicep predloge z razlagami parametrov
- **src/** - Primer vzorčne aplikacijske kode
- **scripts/** - Pomožni skripti za pogosta opravila

## 🎯 Cilji učenja

### Kategorije primerov

#### **Osnovne razmestitve**
- Aplikacije z eno storitvijo
- Enostavni vzorci infrastrukture
- Osnovno upravljanje konfiguracij
- Stroškovno učinkovite razvojne nastavitve

#### **Napredni scenariji**
- Arhitekture z več storitvami
- Kompleksne mrežne konfiguracije
- Vzorci integracije baz podatkov
- Implementacije varnosti in skladnosti

#### **Vzorci pripravljeni za proizvodnjo**
- Konfiguracije za visoko razpoložljivost
- Spremljanje in opazovanje
- Integracija CI/CD
- Nastavitve za obnovo po nesreči

## 📖 Opisi primerov

### Preprosta spletna aplikacija - Node.js Express
**Tehnologije**: Node.js, Express, MongoDB, Container Apps  
**Kompleksnost**: Začetni  
**Koncepti**: Osnovna razmestitev, REST API, integracija NoSQL baze podatkov

### Statična spletna stran - React SPA
**Tehnologije**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Kompleksnost**: Začetni  
**Koncepti**: Statično gostovanje, brezstrežni backend, sodobni spletni razvoj

### Container App - Python Flask
**Tehnologije**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Kompleksnost**: Začetni  
**Koncepti**: Kontejnerizacija, REST API, scale-to-zero, preverjanje stanja, spremljanje  
**Lokacija**: [Lokalni primer](../../../examples/container-app/simple-flask-api)

### Container App - Arhitektura mikrostoritev
**Tehnologije**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Kompleksnost**: Napredno  
**Koncepti**: Arhitektura z več storitvami, komunikacija med storitvami, čakalne vrste sporočil, distribuirano sledenje  
**Lokacija**: [Lokalni primer](../../../examples/container-app/microservices)

### Aplikacija z bazo - C# z Azure SQL
**Tehnologije**: C# ASP.NET Core, Azure SQL Database, App Service  
**Kompleksnost**: Vmesno  
**Koncepti**: Entity Framework, povezave do baze podatkov, razvoj spletnega API-ja

### Brezstrežna funkcija - Python Azure Functions
**Tehnologije**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Kompleksnost**: Vmesno  
**Koncepti**: Dogodkovno usmerjena arhitektura, brezstrežno računalništvo, razvoj celostne aplikacije

### Mikroservisi - Java Spring Boot
**Tehnologije**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Kompleksnost**: Vmesno  
**Koncepti**: Komunikacija mikroservisov, distribuirani sistemi, podjetniški vzorci

### Primeri Microsoft Foundry

#### Pogovorna aplikacija Microsoft Foundry Models
**Tehnologije**: Microsoft Foundry Models, Azure AI Search, App Service  
**Kompleksnost**: Vmesno  
**Koncepti**: RAG arhitektura, vektorsko iskanje, integracija LLM

#### Obdelava dokumentov z AI
**Tehnologije**: Azure AI Document Intelligence, Storage, Functions  
**Kompleksnost**: Vmesno  
**Koncepti**: Analiza dokumentov, OCR, izločanje podatkov

#### Cevovod strojnega učenja
**Tehnologije**: Azure ML, MLOps, Container Registry  
**Kompleksnost**: Napredno  
**Koncepti**: Učenje modelov, cevovodi za razmestitev, spremljanje

## 🛠 Primeri konfiguracij

Direktorij `configurations/` vsebuje ponovno uporabne komponente:

### Konfiguracije okolja
- Nastavitve razvojnega okolja
- Konfiguracije pripravljalnega okolja
- Konfiguracije pripravljene za proizvodnjo
- Nastavitve razmestitve več regij

### Bicep moduli
- Ponovno uporabne komponente infrastrukture
- Pogosti vzorci virov
- Varnostno utrjene predloge
- Konfiguracije optimizirane glede stroškov

### Pomožni skripti
- Avtomatizacija nastavitve okolja
- Skripti za migracijo baze podatkov
- Orodja za validacijo razmestitve
- Orodja za spremljanje stroškov

## 🔧 Vodič za prilagajanje

### Prilagajanje primerov za vaš primer uporabe

1. **Preglejte predpogoje**
   - Preverite zahteve storitev Azure
   - Potrdite omejitve naročnine
   - Razumite posledice glede stroškov

2. **Spremenite konfiguracijo**
   - Posodobite definicije storitev v `azure.yaml`
   - Prilagodite Bicep predloge
   - Prilagodite spremenljivke okolja

3. **Temeljito preizkusite**
   - Najprej razmestite v razvojno okolje
   - Preverite delovanje
   - Preizkusite skaliranje in zmogljivost

4. **Pregled varnosti**
   - Preglejte kontrole dostopa
   - Uvedite upravljanje skrivnosti
   - Omogočite spremljanje in opozarjanje

## 📊 Primerjalna matrika

| Primer | Storitve | Baza podatkov | Avtentikacija | Spremljanje | Kompleksnost |
|--------|----------|---------------|---------------|-------------|--------------|
| **Microsoft Foundry Models Chat** (Lokalno) | 2 | ❌ | Key Vault | Popolno | ⭐⭐ |
| **Python Flask API** (Lokalno) | 1 | ❌ | Osnovno | Popolno | ⭐ |
| **Microservices** (Lokalno) | 5+ | ✅ | Podjetniško | Napredno | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Osnovno | Osnovno | ⭐ |
| React SPA + Functions | 3 | ✅ | Osnovno | Popolno | ⭐ |
| Python Flask Container | 2 | ❌ | Osnovno | Popolno | ⭐ |
| C# Web API + SQL | 2 | ✅ | Popolno | Popolno | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Popolno | Popolno | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Popolno | Popolno | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | Popolno | Popolno | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Osnovno | Popolno | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Popolno | Popolno | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Lokalno) | **8+** | **✅** | **Podjetniško** | **Napredno** | **⭐⭐⭐⭐** |

## 🎓 Pot učenja

### Priporočeno zaporedje

1. **Začnite s preprosto spletno aplikacijo**
   - Spoznajte osnovne koncepte AZD
   - Razumite potek razmestitve
   - Vadite upravljanje okolij

2. **Preizkusite statično spletno stran**
   - Raziskujte različne možnosti gostovanja
   - Naučite se integracije CDN
   - Razumite konfiguracijo DNS

3. **Prehod na Container App**
   - Naučite se osnov kontejnerizacije
   - Razumite koncepte skaliranja
   - Vadite z Dockerjem

4. **Dodajte integracijo baze podatkov**
   - Naučite se zagotavljanja baz podatkov
   - Razumite nize povezav
   - Vadite upravljanje skrivnosti

5. **Raziščite brezstrežno**
   - Razumite dogodkovno usmerjeno arhitekturo
   - Naučite se o sprožilcih in vezavah
   - Vadite z API-ji

6. **Zgradite mikroservise**
   - Naučite se komunikacije storitev
   - Razumite distribuirane sisteme
   - Vadite kompleksne razmestitve

## 🔍 Iskanje pravega primera

### Po tehnološki sestavi
- **Container Apps**: [Python Flask API (Lokalno)](../../../examples/container-app/simple-flask-api), [Microservices (Lokalno)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Lokalno)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Lokalno)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Lokalno)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Lokalno)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Microservices User Service (Lokalno)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Lokalno)](../../../examples/container-app/simple-flask-api), [Microservices (Lokalno)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (Lokalno)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (Lokalno)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Sistemi z več agenti**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Microsoft Foundry Models Chat (Lokalno)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Pripravljeno za podjetje**: [Microservices (Lokalno)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Po arhitekturnem vzorcu
- **Simple REST API**: [Python Flask API (Lokalno)](../../../examples/container-app/simple-flask-api)
- **Monolitno**: Node.js Express Todo, C# Web API + SQL
- **Statično + Brezstrežno**: React SPA + Functions, Python Functions + SPA
- **Mikroservisi**: [Production Microservices (Lokalno)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Kontejnerizirano**: [Python Flask (Lokalno)](../../../examples/container-app/simple-flask-api), [Microservices (Lokalno)](../../../examples/container-app/microservices), Java Microservices
- **AI-podprto**: **[Microsoft Foundry Models Chat (Lokalno)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Arhitektura z več agenti**: **Retail Multi-Agent Solution**
- **Podjetniška večstoritev**: [Microservices (Lokalno)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Po nivoju kompleksnosti
- **Začetni**: [Python Flask API (Lokalno)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Vmesno**: **[Microsoft Foundry Models Chat (Lokalno)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **Napredno**: ML Pipeline
- **Pripravljeno za proizvodnjo v podjetju**: [Microservices (Lokalno)](../../../examples/container-app/microservices) (Multi-service with message queuing), **Retail Multi-Agent Solution** (Complete multi-agent system with ARM template deployment)

## 📚 Dodatni viri

### Povezave do dokumentacije
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Skupnostni primeri
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App with Node.js and PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React spletna aplikacija z C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps opravilo](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions z Javo](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Najboljše prakse
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Okvir za uvajanje v oblak](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Prispevanje primerov

Imate uporaben primer za deljenje? Veseli smo prispevkov!

### Smernice za oddajo
1. Sledite vzpostavljeni strukturi imenikov
2. Vključite obsežen README.md
3. Dodajte komentarje v konfiguracijske datoteke
4. Temeljito testirajte pred oddajo
5. Priložite ocene stroškov in predpogoje

### Struktura predloge primera
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

**Pro nasvet**: Začnite z najpreprostejšim primerom, ki ustreza vašemu tehnološkemu naboru, nato postopoma preidite k bolj zapletenim scenarijem. Vsak primer gradi na konceptih iz prejšnjih!

## 🚀 Pripravljeni za začetek?

### Vaša učna pot

1. **Popoln začetnik?** → Začnite z [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 min)
2. **Osnovno znanje AZD?** → Poskusite [Mikrostoritve](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 min)
3. **Gradite AI aplikacije?** → Začnite z [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 min) ali raziščite [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ ure)
4. **Potrebujete določen tehnološki sklad?** → Uporabite razdelek [Iskanje pravega primera](#-finding-the-right-example) zgoraj

### Naslednji koraki

- ✅ Preverite [Predpogoje](#predpogoji) zgoraj
- ✅ Izberite primer, ki ustreza vaši ravni znanja (glejte [Legenda kompleksnosti](#legenda-ocene-zahtevnosti))
- ✅ Pred uvajanjem natančno preberite README primera
- ✅ Nastavite opomnik, da po testiranju zaženete `azd down`
- ✅ Delite svoje izkušnje prek GitHub Issues ali Discussions

### Potrebujete pomoč?

- 📖 [Pogosta vprašanja (FAQ)](../resources/faq.md) - Pogosto zastavljena vprašanja
- 🐛 [Vodnik za odpravljanje težav](../docs/chapter-07-troubleshooting/common-issues.md) - Odprava težav pri uvajanju
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Vprašajte skupnost
- 📚 [Vodnik za učenje](../resources/study-guide.md) - Okrepite svoje znanje

---

**Navigacija**
- **📚 Domača stran tečaja**: [AZD za začetnike](../README.md)
- **📖 Študijski materiali**: [Vodnik za učenje](../resources/study-guide.md) | [Hiter pregled (Cheat Sheet)](../resources/cheat-sheet.md) | [Slovarček](../resources/glossary.md)
- **🔧 Viri**: [Pogosta vprašanja (FAQ)](../resources/faq.md) | [Odpravljanje težav](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Zadnje posodobljeno: november 2025 | [Prijavi težave](https://github.com/microsoft/AZD-for-beginners/issues) | [Prispevajte primere](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->