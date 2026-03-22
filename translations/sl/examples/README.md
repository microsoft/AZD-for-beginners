# Primeri - Praktične AZD predloge in konfiguracije

**Učenje z zgledi - organizirano po poglavjih**
- **📚 Domača stran tečaja**: [AZD za začetnike](../README.md)
- **📖 Pregled poglavij**: Primeri razporejeni po zahtevnosti učenja
- **🚀 Lokalni primer**: [Rešitev za maloprodajo z več agenti](retail-scenario.md)
- **🤖 Zunanji AI primeri**: Povezave do repozitorijev Azure-Samples

> **📍 POMEMBNO: Lokalni proti zunanjim primerom**  
> Ta repozitorij vsebuje **4 popolne lokalne primere** s polnimi implementacijami:  
> - **Microsoft Foundry Models Chat** (nameščanje gpt-4.1 z vmesnikom za klepet)  
> - **Container Apps** (preprost Flask API + mikroservisi)  
> - **Aplikacija z bazo podatkov** (splet + SQL baza podatkov)  
> - **Retail Multi-Agent** (podjetniška AI rešitev)  
>  
> Dodatni primeri so **zunanji sklici** na repozitorije Azure-Samples, ki jih lahko klonirate.

## Uvod

Ta imenik vsebuje praktične primere in sklice, ki vam pomagajo spoznati Azure Developer CLI skozi praktično delo. Scenarij Retail Multi-Agent je popolna, proizvodno pripravljena implementacija, vključena v ta repozitorij. Dodatni primeri sklicujejo na uradne Azure Samples, ki prikazujejo različne vzorce AZD.

### Legenda ocen zahtevnosti

- ⭐ **Začetnik** - Osnovni koncepti, ena storitev, 15-30 minut
- ⭐⭐ **Srednje** - Več storitev, integracija baze podatkov, 30-60 minut
- ⭐⭐⭐ **Napredno** - Kompleksna arhitektura, integracija AI, 1-2 uri
- ⭐⭐⭐⭐ **Strokovnjak** - Proizvodno pripravljeno, podjetniški vzorci, 2+ uri

## 🎯 Kaj pravzaprav vsebuje ta repozitorij

### ✅ Lokalna implementacija (pripravljeno za uporabo)

#### [Aplikacija za klepet Microsoft Foundry Models](azure-openai-chat/README.md) 🆕
**Popolna namestitev gpt-4.1 z vmesnikom za klepet vključena v ta repozitorij**

- **Lokacija:** `examples/azure-openai-chat/`
- **Zahtevnost:** ⭐⭐ (Srednje)
- **Vsebina:**
  - Popolna namestitev Microsoft Foundry Models (gpt-4.1)
  - Python ukazni vmesnik za klepet
  - Integracija Key Vault za varne API ključe
  - Bicep predloge infrastrukture
  - Sledenje porabi tokenov in stroškov
  - Omejevanje hitrosti in obravnava napak

**Hitri začetek:**
```bash
# Pojdite v mapo example
cd examples/azure-openai-chat

# Razporedite vse
azd up

# Namestite odvisnosti in začnite klepetati
pip install -r src/requirements.txt
python src/chat.py
```

**Tehnologije:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Primeri Container App](container-app/README.md) 🆕
**Celoviti primeri nameščanja kontejnerjev vključeni v ta repozitorij**

- **Lokacija:** `examples/container-app/`
- **Zahtevnost:** ⭐-⭐⭐⭐⭐ (od začetnika do naprednega)
- **Vsebina:**
  - [Glavni vodič](container-app/README.md) - Celovit pregled nameščanja kontejnerjev
  - [Preprost Flask API](../../../examples/container-app/simple-flask-api) - Osnovni primer REST API
  - [Arhitektura mikroservisov](../../../examples/container-app/microservices) - Proizvodno pripravljena večstoritvena namestitev
  - Hitri začetek, proizvodni in napredni vzorci
  - Nadzor, varnost in optimizacija stroškov

**Hitri začetek:**
```bash
# Prikaži glavni vodič
cd examples/container-app

# Razporedi preprost Flask API
cd simple-flask-api
azd up

# Razporedi primer mikrostoritev
cd ../microservices
azd up
```

**Tehnologije:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Rešitev za maloprodajo z več agenti](retail-scenario.md) 🆕
**Popolna proizvodno pripravljena implementacija vključena v ta repozitorij**

- **Lokacija:** `examples/retail-multiagent-arm-template/`
- **Zahtevnost:** ⭐⭐⭐⭐ (Napredno)
- **Vsebina:**
  - Popolna ARM predloga za nameščanje
  - Arhitektura z več agenti (Stranka + Inventar)
  - Integracija Microsoft Foundry Models
  - AI Search z RAG
  - Celovito spremljanje
  - Skripta za enoklikovno nameščanje

**Hitri začetek:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Tehnologije:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Zunanji Azure Samples (klonirajte za uporabo)

Naslednji primeri so vzdrževani v uradnih repozitorijih Azure-Samples. Klonirajte jih, da raziščete različne vzorce AZD:

### Enostavne aplikacije (poglavji 1-2)

| Predloga | Repozitorij | Zahtevnost | Storitve |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Lokalno: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Mikroservisi** | [Lokalno: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Več storitev, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Kako uporabljati:**
```bash
# Kloniraj kateri koli primer
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Razporedi
azd up
```

### Primeri AI aplikacij (poglavja 2, 5, 8)

| Predloga | Repozitorij | Zahtevnost | Poudarek |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [Lokalno: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | namestitev gpt-4.1 |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Osnovni AI klepet |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Okvir za agente |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG vzorec |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Podjetniški AI |

### Baze podatkov in napredni vzorci (poglavja 3-8)

| Predloga | Repozitorij | Zahtevnost | Poudarek |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Integracija baze podatkov |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL brez strežnika |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Več storitev |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Cilji učenja

Z delom na teh primerih boste:
- Vadili poteke dela Azure Developer CLI z realističnimi aplikacijskimi scenariji
- Razumeli različne arhitekture aplikacij in njihove implementacije azd
- Obvladali vzorce Infrastructure as Code za različne Azure storitve
- Uporabili upravljanje konfiguracij in strategije nameščanja, specifične za okolje
- Implementirali vzorce nadzora, varnosti in skaliranja v praktičnih kontekstih
- Pridobili izkušnje s odpravljanjem napak in razhroščevanjem v realnih scenarijih nameščanja

## Pričakovani rezultati učenja

Po zaključku teh primerov boste sposobni:
- Zaupanja vredno namestiti različne vrste aplikacij z Azure Developer CLI
- Prilagoditi predložene predloge svojim zahtevam aplikacij
- Načrtovati in implementirati prilagojene infrastrukturne vzorce z uporabo Bicep
- Konfigurirati kompleksne večstoritvene aplikacije s pravilnimi odvisnostmi
- Uporabiti najboljše prakse varnosti, nadzora in zmogljivosti v resničnih scenarijih
- Upravljati odpravljanje napak in optimizacijo nameščanj na podlagi praktičnih izkušenj

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

> **💡 Nova pri AZD?** Začnite s primerom št. 1 (Flask API) - traja ~20 minut in pouči osnovne koncepte.

### Za začetnike
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Lokalno) ⭐  
   Namestite preprost REST API s scale-to-zero  
   **Čas:** 20-25 minut | **Strošek:** $0-5/mesec  
   **Kaj se boste naučili:** osnovni potek dela z azd, kontejnerizacija, health probes  
   **Pričakovani rezultat:** Delujoč API endpoint, ki vrača "Hello, World!" z nadzorom

2. **[Preprosta spletna aplikacija - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Namestite spletno aplikacijo Node.js Express z MongoDB  
   **Čas:** 25-35 minut | **Strošek:** $10-30/mesec  
   **Kaj se boste naučili:** integracija baze podatkov, okoljske spremenljivke, nizi za povezavo  
   **Pričakovani rezultat:** Aplikacija za seznam opravil z omogočeno funkcionalnostjo ustvarjanja/odčitavanja/posodabljanja/brisanja

3. **[Statična spletna stran - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Gostite statično React spletno stran z Azure Static Web Apps  
   **Čas:** 20-30 minut | **Strošek:** $0-10/mesec  
   **Kaj se boste naučili:** statično gostovanje, serverless funkcije, nameščanje na CDN  
   **Pričakovani rezultat:** React vmesnik s API backendom, samodejni SSL, globalni CDN

### Za srednje zahtevne uporabnike
4. **[Aplikacija za klepet Microsoft Foundry Models](../../../examples/azure-openai-chat)** (Lokalno) ⭐⭐  
   Namestite gpt-4.1 z vmesnikom za klepet in varnim upravljanjem API ključev  
   **Čas:** 35-45 minut | **Strošek:** $50-200/mesec  
   **Kaj se boste naučili:** namestitev Microsoft Foundry Models, integracija Key Vault, sledenje tokenom  
   **Pričakovani rezultat:** Delujoča aplikacija za klepet z gpt-4.1 in spremljanjem stroškov

5. **[Container App - Mikroservisi](../../../examples/container-app/microservices)** (Lokalno) ⭐⭐⭐⭐  
   Proizvodno pripravljena večstoritvena arhitektura  
   **Čas:** 45-60 minut | **Strošek:** $50-150/mesec  
   **Kaj se boste naučili:** komunikacija storitev, čakalne vrste sporočil, distribuirano sledenje  
   **Pričakovani rezultat:** Sistem z dvema storitvama (API Gateway + Product Service) z nadzorom

6. **[Aplikacija z bazo podatkov - C# z Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Spletna aplikacija s C# API in Azure SQL bazo podatkov  
   **Čas:** 30-45 minut | **Strošek:** $20-80/mesec  
   **Kaj se boste naučili:** Entity Framework, migracije baze podatkov, varnost povezav  
   **Pričakovani rezultat:** C# API z Azure SQL backendom, samodejna namestitev sheme

7. **[Brezstrežna funkcija - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions s HTTP sprožilci in Cosmos DB  
   **Čas:** 30-40 minut | **Strošek:** $10-40/mesec  
   **Kaj se boste naučili:** dogodkovno vodena arhitektura, brezstrežno skaliranje, integracija NoSQL  
   **Pričakovani rezultat:** Function app, ki odgovarja na HTTP zahteve s shranjevanjem v Cosmos DB

8. **[Mikroservisi - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Večstoritvena Java aplikacija z Container Apps in API prehodom  
   **Čas:** 60-90 minut | **Strošek:** $80-200/mesec  
   **Kaj se boste naučili:** namestitev Spring Boot, service mesh, uravnoteženje obremenitve  
   **Pričakovani rezultat:** Večstoritveni Java sistem z odkrivanjem storitev in usmerjanjem

### Predloge Microsoft Foundry

1. **[Microsoft Foundry Models Chat App - lokalni primer](../../../examples/azure-openai-chat)** ⭐⭐  
   Popolna namestitev gpt-4.1 z vmesnikom za klepet  
   **Čas:** 35-45 minut | **Strošek:** $50-200/mesec  
   **Pričakovani rezultat:** Delujoča aplikacija za klepet s sledenjem tokenov in spremljanjem stroškov

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Inteligentna aplikacija za klepet z RAG arhitekturo  
   **Čas:** 60-90 minut | **Strošek:** $100-300/mesec  
   **Pričakovani rezultat:** Vmesnik za klepet z RAG, iskanjem dokumentov in citiranjem virov

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Obdelava dokumentov z uporabo Azure AI storitev  
   **Čas:** 40-60 minut | **Strošek:** $20-80/mesec  
   **Pričakovani rezultat:** API, ki izvleče besedilo, tabele in entitete iz naloženih dokumentov

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps potek dela z Azure Machine Learning  
   **Čas:** 2-3 ure | **Strošek:** $150-500/mesec  
   **Pričakovani rezultat:** Avtomatiziran ML potek dela z učenjem, nameščanjem in spremljanjem

### Resnični scenariji

#### **Rešitev za maloprodajo z več agenti** 🆕
**[Celovit vodnik za implementacijo](./retail-scenario.md)**

Celovita, za proizvodnjo pripravljena večagentna rešitev za podporo strankam, ki prikazuje nameščanje AI aplikacij na ravni podjetja z uporabo AZD. Ta scenarij ponuja:
- **Celotna arhitektura**: Večagentni sistem s specializiranimi agenti za podporo strankam in upravljanje zalog
- **Infrastruktura za produkcijo**: Razmestitve Microsoft Foundry Models v več regijah, AI Search, Container Apps in obsežno spremljanje
- **ARM predloga pripravljena za razmestitev**: Namestitev z enim klikom z več načini konfiguracije (Minimal/Standard/Premium)
- **Napredne funkcije**: Validacija varnosti z red teamingom, okvir za ocenjevanje agentov, optimizacija stroškov in vodniki za odpravljanje težav
- **Resnični poslovni kontekst**: Uporaba pri podpori strankam trgovca z nalaganjem datotek, integracijo iskanja in dinamičnim skaliranjem

**Tehnologije**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Zahtevnost**: ⭐⭐⭐⭐ (Napredno - pripravljeno za podjetniško produkcijo)

**Popolno za**: razvijalce AI, arhitekte rešitev in ekipe, ki gradijo produkcijske večagentne sisteme

**Hiter začetek**: Razmestite celotno rešitev v manj kot 30 minutah z vključenim ARM predlogo z `./deploy.sh -g myResourceGroup`

## 📋 Navodila za uporabo

### Predpogoji

Pred izvajanjem katerega koli primera:
- ✅ Azure naročnina z dostopom Owner ali Contributor
- ✅ Azure Developer CLI nameščen ([Navodila za namestitev](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop teče (za primere s kontejnerji)
- ✅ Ustrezne Azure kvote (preverite zahteve za posamezen primer)

> **💰 Opozorilo glede stroškov:** Vsi primeri ustvarijo prava Azure sredstva, ki prinašajo stroške. Za ocene stroškov si oglejte posamezne README datoteke. Ne pozabite zagnati `azd down`, ko končate, da se izognete trajnim stroškom.

### Zagon primerov lokalno

1. **Klonirajte ali kopirajte primer**
   ```bash
   # Navigirajte do želenega primera
   cd examples/simple-web-app
   ```

2. **Inicializirajte AZD okolje**
   ```bash
   # Inicializiraj z obstoječo predlogo
   azd init
   
   # Ali pa ustvari novo okolje
   azd env new my-environment
   ```

3. **Konfigurirajte okolje**
   ```bash
   # Nastavi zahtevane spremenljivke
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Razmestite**
   ```bash
   # Razporedi infrastrukturo in aplikacijo
   azd up
   ```

5. **Preverite razmestitev**
   ```bash
   # Pridobi končne točke storitve
   azd env get-values
   
   # Preizkusi končno točko (primer)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Pričakovani znaki uspeha:**
   - ✅ `azd up` se zaključi brez napak
   - ✅ Končna točka storitve vrne HTTP 200
   - ✅ Azure Portal prikaže status "Running"
   - ✅ Application Insights prejema telemetrijo

> **⚠️ Težave?** Oglejte si [Pogoste težave](../docs/chapter-07-troubleshooting/common-issues.md) za odpravljanje težav pri razmestitvi

### Prilagajanje primerov

Vsak primer vsebuje:
- **README.md** - Podrobna navodila za nastavitev in prilagoditev
- **azure.yaml** - AZD konfiguracija z opombami
- **infra/** - Bicep predloge z razlagami parametrov
- **src/** - Vzorčna aplikacijska koda
- **scripts/** - Pomožni skripti za pogoste naloge

## 🎯 Cilji učenja

### Kategorije primerov

#### **Osnovne razmestitve**
- Aplikacije z eno storitvijo
- Preprosti infrastrukturni vzorci
- Osnovno upravljanje konfiguracij
- Stroškovno učinkovite razvojne nastavitve

#### **Napredni scenariji**
- Arhitekture z več storitvami
- Zahtevne omrežne konfiguracije
- Vzorci integracije podatkovnih baz
- Vpeljave varnosti in skladnosti

#### **Vzorce pripravljene za produkcijo**
- Konfiguracije visoke razpoložljivosti
- Spremljanje in opazovanje
- Integracija CI/CD
- Nastavitve za obnovitev po katastrofi

## 📖 Opisi primerov

### Preprosta spletna aplikacija - Node.js Express
**Tehnologije**: Node.js, Express, MongoDB, Container Apps  
**Zahtevnost**: Začetna  
**Koncepti**: Osnovna razmestitev, REST API, integracija NoSQL podatkovne baze

### Statična spletna stran - React SPA
**Tehnologije**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Zahtevnost**: Začetna  
**Koncepti**: Statično gostovanje, serverless backend, sodoben spletni razvoj

### Kontejnerska aplikacija - Python Flask
**Tehnologije**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Zahtevnost**: Začetna  
**Koncepti**: Kontejnerizacija, REST API, skaliranje do nič, zdravstveni pregledi, spremljanje  
**Lokacija**: [Lokalni primer](../../../examples/container-app/simple-flask-api)

### Kontejnerska aplikacija - arhitektura mikrostoritev
**Tehnologije**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Zahtevnost**: Napredno  
**Koncepti**: Arhitektura z več storitvami, komunikacija med storitvami, vrstica sporočil, porazdeljeno sledenje  
**Lokacija**: [Lokalni primer](../../../examples/container-app/microservices)

### Aplikacija z bazo podatkov - C# z Azure SQL
**Tehnologije**: C# ASP.NET Core, Azure SQL Database, App Service  
**Zahtevnost**: Vmesna  
**Koncepti**: Entity Framework, povezave do podatkovne baze, razvoj spletnega API-ja

### Serverless funkcija - Python Azure Functions
**Tehnologije**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Zahtevnost**: Vmesna  
**Koncepti**: Dogodkovno usmerjena arhitektura, brezstrežni računalništvo, celoviti razvoj

### Mikrostoritve - Java Spring Boot
**Tehnologije**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Zahtevnost**: Vmesna  
**Koncepti**: Komunikacija med mikrostoritvami, porazdeljeni sistemi, podjetniški vzorci

### Primeri Microsoft Foundry

#### Microsoft Foundry Models klepetalna aplikacija
**Tehnologije**: Microsoft Foundry Models, Cognitive Search, App Service  
**Zahtevnost**: Vmesna  
**Koncepti**: RAG arhitektura, vektorsko iskanje, integracija LLM

#### Obdelava dokumentov z AI
**Tehnologije**: Azure AI Document Intelligence, Storage, Functions  
**Zahtevnost**: Vmesna  
**Koncepti**: Analiza dokumentov, OCR, ekstrakcija podatkov

#### Cevovod strojnega učenja
**Tehnologije**: Azure ML, MLOps, Container Registry  
**Zahtevnost**: Napredno  
**Koncepti**: Usposabljanje modelov, cevovodi za razmestitev, spremljanje

## 🛠 Primeri konfiguracij

Mapa `configurations/` vsebuje ponovno uporabne komponente:

### Konfiguracije okolja
- Nastavitve razvojnega okolja
- Konfiguracije predprodukcije
- Konfiguracije pripravljene za produkcijo
- Nastavitve za razmestitev v več regijah

### Bicep moduli
- Ponovno uporabne infrastrukturne komponente
- Pogosti vzorci virov
- Varnostno okrepljene predloge
- Konfiguracije optimizirane za stroške

### Pomožni skripti
- Avtomatizacija nastavitve okolja
- Skripti za migracijo podatkovnih baz
- Orodja za preverjanje razmestitve
- Orodja za spremljanje stroškov

## 🔧 Vodnik za prilagoditev

### Prilagajanje primerov za vaš primer uporabe

1. **Preglejte predpogoje**
   - Preverite zahteve Azure storitev
   - Preverite omejitve naročnine
   - Razumite vpliv na stroške

2. **Spremenite konfiguracijo**
   - Posodobite definicije storitev v `azure.yaml`
   - Prilagodite Bicep predloge
   - Prilagodite okoljske spremenljivke

3. **Temeljito testirajte**
   - Najprej razmestite v razvojno okolje
   - Preverite delovanje
   - Preizkusite skaliranje in zmogljivost

4. **Pregled varnosti**
   - Preglejte kontrole dostopa
   - Uvedite upravljanje skrivnosti
   - Omogočite spremljanje in opozarjanje

## 📊 Primerjalna matrika

| Primer | Storitve | Baza podatkov | Avtentikacija | Spremljanje | Zahtevnost |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (Lokalno) | 2 | ❌ | Key Vault | Popolno | ⭐⭐ |
| **Python Flask API** (Lokalno) | 1 | ❌ | Osnovno | Popolno | ⭐ |
| **Microservices** (Lokalno) | 5+ | ✅ | Podjetniška | Napredno | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Osnovno | Osnovno | ⭐ |
| React SPA + Functions | 3 | ✅ | Osnovno | Popolno | ⭐ |
| Python Flask Container | 2 | ❌ | Osnovno | Popolno | ⭐ |
| C# Web API + SQL | 2 | ✅ | Popolno | Popolno | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Popolno | Popolno | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Popolno | Popolno | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | Popolno | Popolno | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Osnovno | Popolno | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Popolno | Popolno | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Lokalno) | **8+** | **✅** | **Podjetniška** | **Napredno** | **⭐⭐⭐⭐** |

## 🎓 Pot učenja

### Priporočeni napredek

1. **Začnite s preprosto spletno aplikacijo**
   - Spoznajte osnovne koncepte AZD
   - Razumite potek dela razmestitve
   - Vadite upravljanje okolij

2. **Preizkusite statično spletno stran**
   - Raziščite različne možnosti gostovanja
   - Spoznajte integracijo CDN
   - Razumite DNS konfiguracijo

3. **Preidite na kontejnersko aplikacijo**
   - Spoznajte osnove kontejnerizacije
   - Razumite koncepte skaliranja
   - Vadite z Dockerjem

4. **Dodajte integracijo baze podatkov**
   - Spoznajte pripravo baze podatkov
   - Razumite niz povezave
   - Vadite upravljanje skrivnosti

5. **Raziščite serverless**
   - Razumite dogodkovno usmerjeno arhitekturo
   - Spoznajte sprožilce in vezave
   - Vadite z API-ji

6. **Gradite mikrostoritve**
   - Spoznajte komunikacijo med storitvami
   - Razumite porazdeljene sisteme
   - Vadite zahtevne razmestitve

## 🔍 Iskanje pravega primera

### Po tehnološkem sklopu
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
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Microsoft Foundry Models Chat (Lokalno)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (Lokalno)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Po arhitekturnem vzorcu
- **Simple REST API**: [Python Flask API (Lokalno)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Lokalno)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (Lokalno)](../../../examples/container-app/simple-flask-api), [Microservices (Lokalno)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Microsoft Foundry Models Chat (Lokalno)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (Lokalno)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Po ravni zahtevnosti
- **Začetna**: [Python Flask API (Lokalno)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Vmesna**: **[Microsoft Foundry Models Chat (Lokalno)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **Napredno**: ML Pipeline
- **Pripravljeno za podjetniško produkcijo**: [Microservices (Lokalno)](../../../examples/container-app/microservices) (Večstoritevno z vrsticami sporočil), **Retail Multi-Agent Solution** (Celoten večagentni sistem z ARM predlogo za razmestitev)

## 📚 Dodatni viri

### Povezave do dokumentacije
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Primeri skupnosti
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Aplikacija Todo s C# in Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Aplikacija Todo s Pythonom in MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Aplikacija Todo z Node.js in PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React spletna aplikacija s C# API-jem](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Opravilo Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions v Javi](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Najboljše prakse
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Prispevanje primerov

Imate uporaben primer za deliti? Prispevke sprejemamo!

### Smernice za oddajo
1. Upoštevajte vzpostavljeno strukturo imenikov
2. Vključite obsežen README.md
3. Dodajte komentarje v konfiguracijske datoteke
4. Temeljito preizkusite pred oddajo
5. Vključite ocene stroškov in predpogoje

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

**Nasvet**: Začnite z najpreprostejšim primerom, ki ustreza vaši tehnološki skladbi, nato postopoma preidite na bolj zapletene scenarije. Vsak primer gradi na konceptih iz prejšnjih!

## 🚀 Pripravljeni za začetek?

### Vaša učna pot

1. **Popoln začetnik?** → Začnite z [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 min)
2. **Imate osnovno znanje AZD?** → Preizkusite [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 min)
3. **Gradite AI aplikacije?** → Začnite z [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 min) ali raziščite [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ ure)
4. **Potrebujete določen tehnološki sklad?** → Uporabite razdelek [Kako najti pravi primer](#-finding-the-right-example) zgoraj

### Naslednji koraki

- ✅ Preglejte [Predpogoji](#predpogoji) zgoraj
- ✅ Izberite primer, ki ustreza vaši ravni znanja (glejte [Legenda kompleksnosti](#legenda-ocen-zahtevnosti))
- ✅ Natančno preberite README izbranega primera pred uvajanjem
- ✅ Nastavite opomnik, da zaženete `azd down` po testiranju
- ✅ Delite svoje izkušnje prek GitHub Issues ali Discussions

### Potrebujete pomoč?

- 📖 [Pogosta vprašanja (FAQ)](../resources/faq.md) - Pogosta vprašanja in odgovori
- 🐛 [Vodnik za odpravljanje težav](../docs/chapter-07-troubleshooting/common-issues.md) - Odpravljanje težav pri uvajanju
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Vprašajte skupnost
- 📚 [Učni vodič](../resources/study-guide.md) - Okrepite svoje znanje

---

**Navigacija**
- **📚 Domača stran tečaja**: [AZD For Beginners](../README.md)
- **📖 Študijsko gradivo**: [Učni vodič](../resources/study-guide.md) | [Hitri priročnik](../resources/cheat-sheet.md) | [Slovarček](../resources/glossary.md)
- **🔧 Viri**: [Pogosta vprašanja (FAQ)](../resources/faq.md) | [Odpravljanje težav](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Zadnja posodobitev: november 2025 | [Prijavi težave](https://github.com/microsoft/AZD-for-beginners/issues) | [Prispevaj primere](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Izjava o omejitvi odgovornosti**:
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, upoštevajte, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku naj velja za avtoritativni vir. Za pomembne informacije priporočamo strokovni človeški prevod. Ne odgovarjamo za kakršnekoli nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->