# Primeri - Praktične AZD predloge in konfiguracije

**Učenje na primerih - organizirano po poglavjih**
- **📚 Domača stran tečaja**: [AZD za začetnike](../README.md)
- **📖 Povezava poglavij**: Primeri, organizirani glede na zahtevnost učenja
- **🚀 Lokalni primer**: [Rešitev za maloprodajo z več agenti](retail-scenario.md)
- **🤖 Zunanji primeri AI**: Povezave do repozitorijev Azure Samples

> **📍 POMEMBNO: Lokalni vs. zunanji primeri**  
> Ta repozitorij vsebuje **4 popolne lokalne primere** z vsemi implementacijami:  
> - **Azure OpenAI Chat** (GPT-4 implementacija s klepetalnim vmesnikom)  
> - **Container Apps** (Preprost Flask API + mikroservisi)  
> - **Aplikacija z bazo podatkov** (Splet + SQL baza podatkov)  
> - **Rešitev za maloprodajo z več agenti** (Enterprise AI rešitev)  
>  
> Dodatni primeri so **zunanje reference** na repozitorije Azure-Samples, ki jih lahko klonirate.

## Uvod

Ta mapa ponuja praktične primere in reference, ki vam pomagajo pri učenju Azure Developer CLI z uporabo praktičnih vaj. Scenarij za maloprodajo z več agenti je popolna, za produkcijo pripravljena implementacija, vključena v ta repozitorij. Dodatni primeri se nanašajo na uradne Azure Samples, ki prikazujejo različne vzorce AZD.

### Legenda o zahtevnosti

- ⭐ **Začetnik** - Osnovni koncepti, ena storitev, 15-30 minut
- ⭐⭐ **Srednje zahtevno** - Več storitev, integracija baze podatkov, 30-60 minut
- ⭐⭐⭐ **Napredno** - Kompleksna arhitektura, integracija AI, 1-2 uri
- ⭐⭐⭐⭐ **Strokovno** - Pripravljeno za produkcijo, vzorci za podjetja, 2+ ur

## 🎯 Kaj je v tem repozitoriju

### ✅ Lokalna implementacija (pripravljena za uporabo)

#### [Azure OpenAI Chat aplikacija](azure-openai-chat/README.md) 🆕
**Popolna GPT-4 implementacija s klepetalnim vmesnikom, vključena v ta repozitorij**

- **Lokacija:** `examples/azure-openai-chat/`
- **Zahtevnost:** ⭐⭐ (Srednje zahtevno)
- **Kaj je vključeno:**
  - Popolna Azure OpenAI implementacija (GPT-4)
  - Klepetalni vmesnik v Pythonu
  - Integracija s Key Vault za varne API ključe
  - Bicep predloge za infrastrukturo
  - Sledenje uporabi žetonov in stroškom
  - Omejevanje hitrosti in obravnava napak

**Hiter začetek:**
```bash
# Pojdite na primer
cd examples/azure-openai-chat

# Namestite vse
azd up

# Namestite odvisnosti in začnite klepetati
pip install -r src/requirements.txt
python src/chat.py
```

**Tehnologije:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Primeri aplikacij Container App](container-app/README.md) 🆕
**Celoviti primeri implementacije aplikacij v kontejnerjih, vključeni v ta repozitorij**

- **Lokacija:** `examples/container-app/`
- **Zahtevnost:** ⭐-⭐⭐⭐⭐ (Začetnik do strokovnjak)
- **Kaj je vključeno:**
  - [Glavni vodič](container-app/README.md) - Celovit pregled implementacij aplikacij v kontejnerjih
  - [Preprost Flask API](../../../examples/container-app/simple-flask-api) - Osnovni primer REST API
  - [Arhitektura mikroservisov](../../../examples/container-app/microservices) - Pripravljeno za produkcijo, večservisna implementacija
  - Vzorci za hiter začetek, produkcijo in napredne primere
  - Spremljanje, varnost in optimizacija stroškov

**Hiter začetek:**
```bash
# Ogled glavnega vodnika
cd examples/container-app

# Namestitev preproste Flask API
cd simple-flask-api
azd up

# Namestitev primera mikrostoritev
cd ../microservices
azd up
```

**Tehnologije:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Rešitev za maloprodajo z več agenti](retail-scenario.md) 🆕
**Popolna implementacija, pripravljena za produkcijo, vključena v ta repozitorij**

- **Lokacija:** `examples/retail-multiagent-arm-template/`
- **Zahtevnost:** ⭐⭐⭐⭐ (Napredno)
- **Kaj je vključeno:**
  - Popolna ARM predloga za implementacijo
  - Arhitektura z več agenti (stranka + zaloga)
  - Integracija Azure OpenAI
  - AI iskanje z RAG
  - Celovito spremljanje
  - Skripta za enostavno implementacijo

**Hiter začetek:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Tehnologije:** Azure OpenAI, AI iskanje, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Zunanji Azure primeri (klonirajte za uporabo)

Naslednji primeri so vzdrževani v uradnih repozitorijih Azure-Samples. Klonirajte jih za raziskovanje različnih vzorcev AZD:

### Preproste aplikacije (Poglavja 1-2)

| Predloga | Repozitorij | Zahtevnost | Storitve |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Lokalno: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Mikroservisi** | [Lokalno: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Večservisno, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Kako uporabiti:**
```bash
# Kloniraj kateri koli primer
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Namesti
azd up
```

### Primeri AI aplikacij (Poglavja 2, 5, 8)

| Predloga | Repozitorij | Zahtevnost | Fokus |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI Chat** | [Lokalno: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | GPT-4 implementacija |
| **Hiter začetek AI klepeta** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Osnovni AI klepet |
| **AI agenti** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Okvir za agente |
| **Iskanje + OpenAI demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG vzorec |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Enterprise AI |

### Baze podatkov in napredni vzorci (Poglavja 3-8)

| Predloga | Repozitorij | Zahtevnost | Fokus |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Integracija baze podatkov |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL brez strežnika |
| **Java mikroservisi** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Večservisno |
| **ML cevovod** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Cilji učenja

Z delom na teh primerih boste:
- Vadili delovne tokove Azure Developer CLI z realističnimi aplikacijskimi scenariji
- Razumeli različne arhitekture aplikacij in njihove AZD implementacije
- Obvladali vzorce infrastrukture kot kode za različne Azure storitve
- Uporabili upravljanje konfiguracije in strategije implementacije, specifične za okolje
- Implementirali vzorce spremljanja, varnosti in skaliranja v praktičnih kontekstih
- Pridobili izkušnje z odpravljanjem težav in optimizacijo resničnih implementacij

## Rezultati učenja

Po zaključku teh primerov boste lahko:
- Samozavestno implementirali različne vrste aplikacij z uporabo Azure Developer CLI
- Prilagodili ponujene predloge svojim lastnim zahtevam aplikacij
- Načrtovali in implementirali prilagojene vzorce infrastrukture z uporabo Bicep
- Konfigurirali kompleksne večservisne aplikacije s pravilnimi odvisnostmi
- Uporabili najboljše prakse za varnost, spremljanje in zmogljivost v resničnih scenarijih
- Odpravljali težave in optimizirali implementacije na podlagi praktičnih izkušenj

## Struktura mape

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

## Primeri za hiter začetek

> **💡 Novinec v AZD?** Začnite s primerom #1 (Flask API) - traja približno 20 minut in uči osnovne koncepte.

### Za začetnike
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Lokalno) ⭐  
   Implementirajte preprost REST API z možnostjo scale-to-zero  
   **Čas:** 20-25 minut | **Strošek:** $0-5/mesec  
   **Naučili se boste:** Osnovni AZD delovni tok, kontejnerizacija, zdravstveni pregledi  
   **Pričakovani rezultat:** Delujoča API končna točka, ki vrača "Hello, World!" s spremljanjem

2. **[Preprosta spletna aplikacija - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Implementirajte spletno aplikacijo Node.js Express z MongoDB  
   **Čas:** 25-35 minut | **Strošek:** $10-30/mesec  
   **Naučili se boste:** Integracija baze podatkov, okoljske spremenljivke, povezovalni nizi  
   **Pričakovani rezultat:** Aplikacija za seznam opravil s funkcionalnostmi ustvarjanja/branja/posodabljanja/brisanja

3. **[Statična spletna stran - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Gostite statično spletno stran React z Azure Static Web Apps  
   **Čas:** 20-30 minut | **Strošek:** $0-10/mesec  
   **Naučili se boste:** Statično gostovanje, brezstrežniške funkcije, implementacija CDN  
   **Pričakovani rezultat:** React uporabniški vmesnik z API zaledjem, samodejni SSL, globalni CDN

### Za srednje zahtevne uporabnike
4. **[Azure OpenAI Chat aplikacija](../../../examples/azure-openai-chat)** (Lokalno) ⭐⭐  
   Implementirajte GPT-4 s klepetalnim vmesnikom in varnim upravljanjem API ključev  
   **Čas:** 35-45 minut | **Strošek:** $50-200/mesec  
   **Naučili se boste:** Implementacija Azure OpenAI, integracija Key Vault, sledenje žetonom  
   **Pričakovani rezultat:** Delujoča klepetalna aplikacija z GPT-4 in spremljanjem stroškov

5. **[Container App - Mikroservisi](../../../examples/container-app/microservices)** (Lokalno) ⭐⭐⭐⭐  
   Večservisna arhitektura, pripravljena za produkcijo  
   **Čas:** 45-60 minut | **Strošek:** $50-150/mesec  
   **Naučili se boste:** Komunikacija med storitvami, sporočilne vrste, porazdeljeno sledenje  
   **Pričakovani rezultat:** Sistem z 2 storitvama (API Gateway + Product Service) s spremljanjem

6. **[Aplikacija z bazo podatkov - C# z Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Spletna aplikacija z API v C# in Azure SQL bazo podatkov  
   **Čas:** 30-45 minut | **Strošek:** $20-80/mesec  
   **Naučili se boste:** Entity Framework, migracije baze podatkov, varnost povezav  
   **Pričakovani rezultat:** API v C# z Azure SQL zaledjem, samodejna implementacija sheme

7. **[Brezstrežniška funkcija - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions z HTTP sprožilci in Cosmos DB  
   **Čas:** 30-40 minut | **Strošek:** $10-40/mesec  
   **Naučili se boste:** Arhitektura, ki temelji na dogodkih, brezstrežniško skaliranje, integracija NoSQL  
   **Pričakovani rezultat:** Funkcijska aplikacija, ki se odziva na HTTP zahteve s shranjevanjem v Cosmos DB

8. **[Mikroservisi - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Večservisna Java aplikacija z Container Apps in API prehodom  
   **Čas:** 60-90 minut | **Strošek:** $80-200/mesec  
   **Naučili se boste:** Implementacija Spring Boot, mreža storitev, uravnoteženje obremenitve  
   **Pričakovani rezultat:** Večservisni Java sistem z odkrivanjem storitev in usmerjanjem

### Predloge Azure AI Foundry

1. **[Azure OpenAI Chat aplikacija - Lokalni primer](../../../examples/azure-openai-chat)** ⭐⭐  
   Popolna GPT-4 implementacija s klepetalnim vmesnikom  
   **Čas:** 35-45 minut | **Strošek:** $50-200/mesec  
   **Pričakovani rezultat:** Delujoča klepetalna aplikacija s sledenjem žetonom in spremljanjem stroškov

2. **[Azure Search + OpenAI demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Inteligentna klepetalna aplikacija z RAG arhitekturo  
   **Čas:** 60-90 minut | **Strošek:** $100-300/mesec  
   **Pričakovani rezultat:** Klepetalni vmesnik, ki temelji na RAG, z iskanjem dokumentov in citati

3. **[AI obdelava dokumentov](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Analiza dokumentov z uporabo Azure AI storitev  
   **Čas:** 40-60 minut | **Strošek:** $20-80/mesec  
   **Pričakovani rezultat:** API za izvleček besedila, tabel in entitet iz naloženih dokumentov

4. **[Strojno učenje - cevovod](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps delovni tok z Azure Machine Learning  
   **Čas:** 2-3 ure | **Strošek:** $150-500/mesec  
   **Pričakovani rezultat:** Avtomatiziran ML cevovod z učenjem, implementacijo in spremljanjem

### Scenariji iz resničnega sveta

#### **Rešitev za maloprodajo z več agenti** 🆕
**[Celovit vodič za implementacijo](./retail-scenario.md)**

Celovita, za produkcijo pripravljena rešitev za podporo strankam z več agenti, ki prikazuje implementacijo AI aplikacij na ravni podjetja z AZD. Ta scenarij vključuje:

- **Popolna arhitektura**: Sistem z več agenti, specializiranimi za podporo strankam in upravljanje zalog
- **Proizvodna infrastruktura**: Večregionalne Azure OpenAI implementacije, AI iskanje, Container Apps in celovito spremljanje
- **Pripravljena ARM predloga za implementacijo**: En klik za implementacijo z več načini konfiguracije (Minimalno/Standardno/Premium)
- **Napredne funkcije**: Varnostna validacija z rdečimi ekipami, okvir za ocenjevanje agentov, optimizacija stroškov in vodniki za odpravljanje težav
- **Resnični poslovni kontekst**: Primer uporabe za podporo strankam v trgovini na drobno z nalaganjem datotek, integracijo iskanja in dinamičnim skaliranjem

**Tehnologije**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Kompleksnost**: ⭐⭐⭐⭐ (Napredno - Pripravljeno za proizvodnjo v podjetjih)

**Idealno za**: AI razvijalce, arhitekte rešitev in ekipe, ki gradijo proizvodne sisteme z več agenti

**Hiter začetek**: Implementirajte celotno rešitev v manj kot 30 minutah z vključeno ARM predlogo z `./deploy.sh -g myResourceGroup`

## 📋 Navodila za uporabo

### Predpogoji

Pred zagonom katerega koli primera:
- ✅ Azure naročnina z dostopom lastnika ali sodelavca
- ✅ Nameščen Azure Developer CLI ([Navodila za namestitev](../docs/getting-started/installation.md))
- ✅ Zagnan Docker Desktop (za primere s kontejnerji)
- ✅ Ustrezne Azure kvote (preverite zahteve specifične za primer)

> **💰 Opozorilo o stroških:** Vsi primeri ustvarjajo resnične Azure vire, ki povzročajo stroške. Glejte posamezne README datoteke za ocene stroškov. Ne pozabite zagnati `azd down`, ko končate, da se izognete nadaljnjim stroškom.

### Zagon primerov lokalno

1. **Klonirajte ali kopirajte primer**
   ```bash
   # Pomaknite se do želenega primera
   cd examples/simple-web-app
   ```

2. **Inicializirajte AZD okolje**
   ```bash
   # Inicializiraj z obstoječo predlogo
   azd init
   
   # Ali ustvari novo okolje
   azd env new my-environment
   ```

3. **Konfigurirajte okolje**
   ```bash
   # Nastavi zahtevane spremenljivke
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Implementirajte**
   ```bash
   # Namesti infrastrukturo in aplikacijo
   azd up
   ```

5. **Preverite implementacijo**
   ```bash
   # Pridobi končne točke storitve
   azd env get-values
   
   # Preizkusi končno točko (primer)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Pričakovani kazalniki uspeha:**
   - ✅ `azd up` se zaključi brez napak
   - ✅ Končna točka storitve vrne HTTP 200
   - ✅ Azure Portal prikazuje status "Running"
   - ✅ Application Insights prejema telemetrijo

> **⚠️ Težave?** Glejte [Pogoste težave](../docs/troubleshooting/common-issues.md) za odpravljanje težav pri implementaciji

### Prilagajanje primerov

Vsak primer vključuje:
- **README.md** - Podrobna navodila za nastavitev in prilagoditev
- **azure.yaml** - AZD konfiguracija s komentarji
- **infra/** - Bicep predloge z razlagami parametrov
- **src/** - Vzorec aplikacijske kode
- **scripts/** - Pomožni skripti za pogoste naloge

## 🎯 Učni cilji

### Kategorije primerov

#### **Osnovne implementacije**
- Aplikacije z eno storitvijo
- Preprosti infrastrukturni vzorci
- Osnovno upravljanje konfiguracije
- Stroškovno učinkovite razvojne nastavitve

#### **Napredni scenariji**
- Arhitekture z več storitvami
- Kompleksne mrežne konfiguracije
- Vzorci integracije podatkovnih baz
- Implementacije varnosti in skladnosti

#### **Vzorci pripravljeni za proizvodnjo**
- Konfiguracije visoke razpoložljivosti
- Spremljanje in opazovanje
- Integracija CI/CD
- Načrti za obnovitev po nesrečah

## 📖 Opisi primerov

### Preprosta spletna aplikacija - Node.js Express
**Tehnologije**: Node.js, Express, MongoDB, Container Apps  
**Kompleksnost**: Začetnik  
**Koncepti**: Osnovna implementacija, REST API, integracija NoSQL baze podatkov

### Statična spletna stran - React SPA
**Tehnologije**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Kompleksnost**: Začetnik  
**Koncepti**: Statično gostovanje, brezstrežni zaledni sistem, sodobni spletni razvoj

### Aplikacija s kontejnerji - Python Flask
**Tehnologije**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Kompleksnost**: Začetnik  
**Koncepti**: Kontejnerizacija, REST API, skaliranje na nič, zdravstveni pregledi, spremljanje  
**Lokacija**: [Lokalni primer](../../../examples/container-app/simple-flask-api)

### Aplikacija s kontejnerji - Arhitektura mikrostoritev
**Tehnologije**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Kompleksnost**: Napredno  
**Koncepti**: Arhitektura z več storitvami, komunikacija med storitvami, sporočilne vrste, porazdeljeno sledenje  
**Lokacija**: [Lokalni primer](../../../examples/container-app/microservices)

### Aplikacija z bazo podatkov - C# z Azure SQL
**Tehnologije**: C# ASP.NET Core, Azure SQL Database, App Service  
**Kompleksnost**: Srednje  
**Koncepti**: Entity Framework, povezave z bazo podatkov, razvoj spletnega API-ja

### Brezstrežna funkcija - Python Azure Functions
**Tehnologije**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Kompleksnost**: Srednje  
**Koncepti**: Arhitektura, ki temelji na dogodkih, brezstrežno računalništvo, razvoj celotnega sklada

### Mikrostoritve - Java Spring Boot
**Tehnologije**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Kompleksnost**: Srednje  
**Koncepti**: Komunikacija med mikrostoritvami, porazdeljeni sistemi, vzorci za podjetja

### Primeri Azure AI Foundry

#### Azure OpenAI Chat App
**Tehnologije**: Azure OpenAI, Cognitive Search, App Service  
**Kompleksnost**: Srednje  
**Koncepti**: RAG arhitektura, vektorsko iskanje, integracija LLM

#### AI obdelava dokumentov
**Tehnologije**: Azure AI Document Intelligence, Storage, Functions  
**Kompleksnost**: Srednje  
**Koncepti**: Analiza dokumentov, OCR, ekstrakcija podatkov

#### Strojno učenje - cevovod
**Tehnologije**: Azure ML, MLOps, Container Registry  
**Kompleksnost**: Napredno  
**Koncepti**: Usposabljanje modelov, implementacijski cevovodi, spremljanje

## 🛠 Primeri konfiguracij

Mapa `configurations/` vsebuje ponovno uporabne komponente:

### Konfiguracije okolja
- Nastavitve razvojnega okolja
- Konfiguracije okolja za testiranje
- Konfiguracije pripravljene za proizvodnjo
- Nastavitve za večregionalne implementacije

### Bicep moduli
- Ponovno uporabne infrastrukturne komponente
- Pogosti vzorci virov
- Varnostno utrjene predloge
- Stroškovno optimizirane konfiguracije

### Pomožni skripti
- Avtomatizacija nastavitve okolja
- Skripti za migracijo podatkovnih baz
- Orodja za validacijo implementacije
- Pripomočki za spremljanje stroškov

## 🔧 Vodnik za prilagoditev

### Prilagajanje primerov za vaš primer uporabe

1. **Preglejte predpogoje**
   - Preverite zahteve za Azure storitve
   - Preverite omejitve naročnine
   - Razumite stroškovne posledice

2. **Spremenite konfiguracijo**
   - Posodobite definicije storitev v `azure.yaml`
   - Prilagodite Bicep predloge
   - Prilagodite okoljske spremenljivke

3. **Temeljito testirajte**
   - Najprej implementirajte v razvojno okolje
   - Validirajte funkcionalnost
   - Testirajte skaliranje in zmogljivost

4. **Pregled varnosti**
   - Preglejte nadzore dostopa
   - Implementirajte upravljanje skrivnosti
   - Omogočite spremljanje in opozarjanje

## 📊 Primerjalna tabela

| Primer | Storitve | Baza podatkov | Avtentikacija | Spremljanje | Kompleksnost |
|---------|----------|----------|------|------------|------------|
| **Azure OpenAI Chat** (Lokalno) | 2 | ❌ | Key Vault | Polno | ⭐⭐ |
| **Python Flask API** (Lokalno) | 1 | ❌ | Osnovno | Polno | ⭐ |
| **Mikrostoritve** (Lokalno) | 5+ | ✅ | Podjetniško | Napredno | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Osnovno | Osnovno | ⭐ |
| React SPA + Functions | 3 | ✅ | Osnovno | Polno | ⭐ |
| Python Flask Container | 2 | ❌ | Osnovno | Polno | ⭐ |
| C# Web API + SQL | 2 | ✅ | Polno | Polno | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Polno | Polno | ⭐⭐ |
| Java Mikrostoritve | 5+ | ✅ | Polno | Polno | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Polno | Polno | ⭐⭐⭐ |
| AI obdelava dokumentov | 2 | ❌ | Osnovno | Polno | ⭐⭐ |
| Cevovod za strojno učenje | 4+ | ✅ | Polno | Polno | ⭐⭐⭐⭐ |
| **Trgovinska rešitev z več agenti** (Lokalno) | **8+** | **✅** | **Podjetniško** | **Napredno** | **⭐⭐⭐⭐** |

## 🎓 Učna pot

### Priporočeni vrstni red

1. **Začnite s preprosto spletno aplikacijo**
   - Naučite se osnovnih konceptov AZD
   - Razumite potek implementacije
   - Vadite upravljanje okolja

2. **Preizkusite statično spletno stran**
   - Raziščite različne možnosti gostovanja
   - Naučite se integracije CDN
   - Razumite konfiguracijo DNS

3. **Preidite na aplikacijo s kontejnerji**
   - Naučite se osnov kontejnerizacije
   - Razumite koncepte skaliranja
   - Vadite z Dockerjem

4. **Dodajte integracijo podatkovne baze**
   - Naučite se zagotavljanja podatkovnih baz
   - Razumite povezovalne nize
   - Vadite upravljanje skrivnosti

5. **Raziskujte brezstrežno**
   - Razumite arhitekturo, ki temelji na dogodkih
   - Naučite se o sprožilcih in vezavah
   - Vadite z API-ji

6. **Zgradite mikrostoritve**
   - Naučite se komunikacije med storitvami
   - Razumite porazdeljene sisteme
   - Vadite kompleksne implementacije

## 🔍 Iskanje pravega primera

### Po tehnološkem skladu
- **Container Apps**: [Python Flask API (Lokalno)](../../../examples/container-app/simple-flask-api), [Mikrostoritve (Lokalno)](../../../examples/container-app/microservices), Java Mikrostoritve
- **Node.js**: Node.js Express Todo App, [Mikrostoritve API Gateway (Lokalno)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Lokalno)](../../../examples/container-app/simple-flask-api), [Mikrostoritve Product Service (Lokalno)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Mikrostoritve Order Service (Lokalno)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Go**: [Mikrostoritve User Service (Lokalno)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Mikrostoritve
- **React**: React SPA + Functions
- **Kontejnerji**: [Python Flask (Lokalno)](../../../examples/container-app/simple-flask-api), [Mikrostoritve (Lokalno)](../../../examples/container-app/microservices), Java Mikrostoritve
- **Podatkovne baze**: [Mikrostoritve (Lokalno)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Azure OpenAI Chat (Lokalno)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI obdelava dokumentov, ML Pipeline, **Trgovinska rešitev z več agenti**
- **Sistemi z več agenti**: **Trgovinska rešitev z več agenti**
- **Integracija OpenAI**: **[Azure OpenAI Chat (Lokalno)](../../../examples/azure-openai-chat)**, Trgovinska rešitev z več agenti
- **Proizvodnja v podjetjih**: [Mikrostoritve (Lokalno)](../../../examples/container-app/microservices) (več storitev s sporočilnimi vrstami), **Trgovinska rešitev z več agenti** (celovit sistem z več agenti z implementacijo ARM predloge)

### Po vzorcu arhitekture
- **Preprost REST API**: [Python Flask API (Lokalno)](../../../examples/container-app/simple-flask-api)
- **Monolitno**: Node.js Express Todo, C# Web API + SQL
- **Statično + brezstrežno**: React SPA + Functions, Python Functions + SPA
- **Mikrostoritve**: [Proizvodne mikrostoritve (Lokalno)](../../../examples/container-app/microservices), Java Spring Boot Mikrostoritve
- **Kontejnerizirano**: [Python Flask (Lokalno)](../../../examples/container-app/simple-flask-api), [Mikrostoritve (Lokalno)](../../../examples/container-app/microservices)
- **AI-podprto**: **[Azure OpenAI Chat (Lokalno)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI obdelava dokumentov, ML Pipeline, **Trgovinska rešitev z več agenti**
- **Arhitektura z več agenti**: **Trgovinska rešitev z več agenti**
- **Podjetniška večstoritevna**: [Mikrostoritve (Lokalno)](../../../examples/container-app/microservices), **Trgovinska rešitev z več agenti**

### Po stopnji kompleksnosti
- **Začetnik**: [Python Flask API (Lokalno)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Srednje**: **[Azure OpenAI Chat (Lokalno)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Mikrostoritve, Azure OpenAI Chat App, AI obdelava dokumentov
- **Napredno**: ML Pipeline
- **Pripravljeno za proizvodnjo v podjetjih**: [Mikrostoritve (Lokalno)](../../../examples/container-app/microservices) (več storitev s sporočilnimi vrstami), **Trgovinska rešitev z več agenti** (celovit sistem z več agenti z implementacijo ARM predloge)

## 📚 Dodatni viri

### Povezave do dokumentacije
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep dokumentacija](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Primeri iz skupnosti
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App s C# in Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App s Python in MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Aplikacija Todo z Node.js in PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React spletna aplikacija z API-jem v C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions z Javo](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Najboljše prakse
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Prispevanje primerov

Imate koristen primer, ki bi ga radi delili? Veseli bomo vaših prispevkov!

### Smernice za oddajo
1. Upoštevajte obstoječo strukturo direktorijev
2. Vključite obsežen README.md
3. Dodajte komentarje v konfiguracijske datoteke
4. Temeljito preizkusite pred oddajo
5. Vključite ocene stroškov in predpogoje

### Struktura predloge za primer
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

**Nasvet**: Začnite z najpreprostejšim primerom, ki ustreza vaši tehnološki zasnovi, nato pa postopoma prehajajte na bolj zapletene scenarije. Vsak primer gradi na konceptih iz prejšnjih!

## 🚀 Pripravljeni na začetek?

### Vaša učna pot

1. **Popolni začetnik?** → Začnite z [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 minut)
2. **Imate osnovno znanje o AZD?** → Poskusite [Mikrostoritve](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 minut)
3. **Gradite AI aplikacije?** → Začnite z [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 minut) ali raziščite [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, več kot 2 uri)
4. **Potrebujete specifično tehnološko zasnovo?** → Uporabite razdelek [Iskanje pravega primera](../../../examples) zgoraj

### Naslednji koraki

- ✅ Preglejte [Predpogoje](../../../examples) zgoraj
- ✅ Izberite primer, ki ustreza vaši ravni znanja (glejte [Legenda o kompleksnosti](../../../examples))
- ✅ Pred namestitvijo temeljito preberite README primera
- ✅ Nastavite opomnik za zagon `azd down` po testiranju
- ✅ Delite svoje izkušnje prek GitHub Issues ali Discussions

### Potrebujete pomoč?

- 📖 [FAQ](../resources/faq.md) - Odgovori na pogosta vprašanja
- 🐛 [Vodnik za odpravljanje težav](../docs/troubleshooting/common-issues.md) - Rešite težave pri namestitvi
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Postavite vprašanja skupnosti
- 📚 [Vodnik za študij](../resources/study-guide.md) - Okrepite svoje znanje

---

**Navigacija**
- **📚 Domača stran tečaja**: [AZD za začetnike](../README.md)
- **📖 Študijski materiali**: [Vodnik za študij](../resources/study-guide.md) | [Pomočnik](../resources/cheat-sheet.md) | [Slovar](../resources/glossary.md)
- **🔧 Viri**: [FAQ](../resources/faq.md) | [Odpravljanje težav](../docs/troubleshooting/common-issues.md)

---

*Zadnja posodobitev: november 2025 | [Prijavite težave](https://github.com/microsoft/AZD-for-beginners/issues) | [Prispevajte primere](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:  
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem maternem jeziku je treba obravnavati kot avtoritativni vir. Za ključne informacije priporočamo profesionalni človeški prevod. Ne odgovarjamo za morebitne nesporazume ali napačne razlage, ki bi nastale zaradi uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->