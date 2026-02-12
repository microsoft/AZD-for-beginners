# Primeri - Praktične AZD predloge in konfiguracije

**Učenje z zgledom - organizirano po poglavjih**
- **📚 Domača stran tečaja**: [AZD For Beginners](../README.md)
- **📖 Preslikava poglavij**: Primeri razporejeni po zahtevnosti
- **🚀 Lokalni primer**: [Retail Multi-Agent Solution](retail-scenario.md)
- **🤖 Zunanji AI primeri**: Povezave do Azure Samples repozitorijev

> **📍 POMEMBNO: Lokalni proti zunanjemu primeri**  
> Ta repozitorij vsebuje **4 popolne lokalne primere** s popolnimi implementacijami:  
> - **Azure OpenAI Chat** (uvajanje GPT-4 z vmesnikom za klepet)  
> - **Container Apps** (preprost Flask API + mikroservisi)  
> - **Database App** (spletna aplikacija + SQL baza podatkov)  
> - **Retail Multi-Agent** (podjetniška AI rešitev)  
>  
> Dodatni primeri so **zunanje reference** na Azure-Samples repozitorije, ki jih lahko klonirate.

## Uvod

Ta imenik ponuja praktične primere in reference, ki vam pomagajo naučiti se Azure Developer CLI skozi praktično delo. Scenarij Retail Multi-Agent je popolna, za produkcijo pripravljena implementacija, vključena v ta repozitorij. Dodatni primeri se sklicujejo na uradne Azure Samples, ki prikazujejo različne AZD vzorce.

### Legenda ocene zahtevnosti

- ⭐ **Začetnik** - Osnovni koncepti, ena storitev, 15-30 minut
- ⭐⭐ **Vmesni** - Več storitev, integracija baze podatkov, 30-60 minut
- ⭐⭐⭐ **Napredno** - Kompleksna arhitektura, integracija AI, 1-2 uri
- ⭐⭐⭐⭐ **Strokovnjak** - Pripravljen za produkcijo, podjetniški vzorci, 2+ uri

## 🎯 Kaj je dejansko v tem repozitoriju

### ✅ Lokalna implementacija (Pripravljeno za uporabo)

#### [Aplikacija Azure OpenAI Chat](azure-openai-chat/README.md) 🆕
**Popolno uvajanje GPT-4 z vmesnikom za klepet, vključeno v ta repozitorij**

- **Lokacija:** `examples/azure-openai-chat/`
- **Zahtevnost:** ⭐⭐ (Vmesni)
- **Kaj je vključeno:**
  - Popolno uvajanje Azure OpenAI (GPT-4)
  - Ukazni vmesnik za klepet v Pythonu
  - Integracija s Key Vault za varne API ključe
  - Bicep predloge infrastrukture
  - Sledenje uporabi tokenov in stroškov
  - Omejevanje zahtev in obravnava napak

**Hiter začetek:**
```bash
# Pomaknite se do mape example
cd examples/azure-openai-chat

# Razporedite vse
azd up

# Namestite odvisnosti in začnite klepetati
pip install -r src/requirements.txt
python src/chat.py
```

**Tehnologije:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Primeri Container App](container-app/README.md) 🆕
**Celoviti primeri uvajanja kontejnerjev, vključeni v ta repozitorij**

- **Lokacija:** `examples/container-app/`
- **Zahtevnost:** ⭐-⭐⭐⭐⭐ (Začetnik do Strokovnjak)
- **Kaj je vključeno:**
  - [Glavni vodič](container-app/README.md) - Celovit pregled uvajanj kontejnerjev
  - [Preprost Flask API](../../../examples/container-app/simple-flask-api) - Osnovni primer REST API
  - [Mikroservisna arhitektura](../../../examples/container-app/microservices) - Proizvodno pripravljeno uvajanje več storitev
  - Hiter začetek, produkcija in napredni vzorci
  - Nadzor, varnost in optimizacija stroškov

**Hiter začetek:**
```bash
# Oglej si glavni vodič
cd examples/container-app

# Razporedi preprost Flask API
cd simple-flask-api
azd up

# Razporedi primer mikrostoritev
cd ../microservices
azd up
```

**Tehnologije:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent Solution](retail-scenario.md) 🆕
**Popolna, za produkcijo pripravljena implementacija, vključena v ta repozitorij**

- **Lokacija:** `examples/retail-multiagent-arm-template/`
- **Zahtevnost:** ⭐⭐⭐⭐ (Napredno)
- **Kaj je vključeno:**
  - Popolna ARM predloga za uvajanje
  - Arhitektura več agentov (stranka + upravljanje zalog)
  - Integracija z Azure OpenAI
  - AI Search z RAG
  - Celovito spremljanje
  - Skript za enoklikno uvajanje

**Hiter začetek:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Tehnologije:** Azure OpenAI, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Zunanji Azure Samples (Klonirajte za uporabo)

Naslednje primere vzdržujejo uradni Azure-Samples repozitoriji. Klonirajte jih, da raziščete različne AZD vzorce:

### Preproste aplikacije (Poglavja 1-2)

| Predloga | Repozitorij | Zahtevnost | Storitve |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Lokalno: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Mikroservisi** | [Lokalno: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Več storitev, Service Bus, Cosmos DB, SQL |
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

### AI primeri aplikacij (Poglavja 2, 5, 8)

| Predloga | Repozitorij | Zahtevnost | Fokus |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI Chat** | [Lokalno: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | Uvajanje GPT-4 |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Osnovni AI klepet |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Okvir za agente |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG vzorec |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Podjetniški AI |

### Baze podatkov in napredni vzorci (Poglavja 3-8)

| Predloga | Repozitorij | Zahtevnost | Fokus |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Integracija baz podatkov |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | Brezstrežni NoSQL |
| **Java mikroservisi** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Več storitev |
| **ML cevovod** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Cilji učenja

Z delom na teh primerih boste:
- Vadili delovne tokove Azure Developer CLI z realističnimi scenariji aplikacij
- Razumeli različne arhitekture aplikacij in njihove azd implementacije
- Obvladali vzorce Infrastructure as Code za različne Azure storitve
- Uporabili upravljanje konfiguracij in strategije uvajanja, specifične za okolje
- Implementirali vzorce spremljanja, varnosti in skaliranja v praktičnih kontekstih
- Pridobili izkušnje z odpravljanjem napak in razhroščevanjem dejanskih scenarijev uvajanja

## Pričakovani rezultati učenja

Po zaključku teh primerov boste sposobni:
- S samozavestjo uvajati različne vrste aplikacij z Azure Developer CLI
- Prilagoditi priložene predloge zahtevam vaše aplikacije
- Načrtovati in implementirati prilagojene infrastrukturne vzorce z uporabo Bicep
- Konfigurirati kompleksne večstorivne aplikacije z ustreznimi odvisnostmi
- Uporabiti najboljše prakse za varnost, spremljanje in zmogljivost v resničnih scenarijih
- Odpravljati težave in optimizirati uvajanja na osnovi praktičnih izkušenj

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

## Primeri za hiter začetek

> **💡 Nov pri AZD?** Začnite s primerom #1 (Flask API) - traja ~20 minut in vas nauči osnovnih konceptov.

### Za začetnike
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Lokalno) ⭐  
   Raziščite preprost REST API z možnostjo scale-to-zero  
   **Čas:** 20-25 minut | **Strošek:** $0-5/month  
   **Kar se boste naučili:** Osnovni azd delovni tok, kontejnerizacija, health probe-i  
   **Pričakovani rezultat:** Delujoča API končna točka, ki vrača "Hello, World!" z nadzorom

2. **[Preprosta spletna aplikacija - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Uvajanje spletne aplikacije Node.js Express z MongoDB  
   **Čas:** 25-35 minut | **Strošek:** $10-30/month  
   **Kar se boste naučili:** Integracija z bazo podatkov, okoljske spremenljivke, connection string-i  
   **Pričakovani rezultat:** Aplikacija Todo z ustvarjanjem/branjem/posodabljanjem/brisanje funkcionalnosti

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Gostovanje React statične spletne aplikacije z Azure Static Web Apps  
   **Čas:** 20-30 minut | **Strošek:** $0-10/month  
   **Kar se boste naučili:** Static hosting, serverless funkcije, CDN uvajanje  
   **Pričakovani rezultat:** React UI z API backendom, avtomatski SSL, globalni CDN

### Za vmesne uporabnike
4. **[Aplikacija Azure OpenAI Chat](../../../examples/azure-openai-chat)** (Lokalno) ⭐⭐  
   Uvajanje GPT-4 z vmesnikom za klepet in varnim upravljanjem API ključev  
   **Čas:** 35-45 minut | **Strošek:** $50-200/month  
   **Kar se boste naučili:** Uvajanje Azure OpenAI, integracija Key Vault, sledenje tokenov  
   **Pričakovani rezultat:** Delujoča klepetalna aplikacija z GPT-4 in spremljanjem stroškov

5. **[Container App - Mikroservisi](../../../examples/container-app/microservices)** (Lokalno) ⭐⭐⭐⭐  
   Produkcijsko pripravljena arhitektura več storitev  
   **Čas:** 45-60 minut | **Strošek:** $50-150/month  
   **Kar se boste naučili:** Komunikacija med storitvami, message queueing, distribuirano sledenje  
   **Pričakovani rezultat:** Sistem z 2 storitvama (API Gateway + Product Service) z nadzorom

6. **[Database App - C# z Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Spletna aplikacija z C# API in Azure SQL bazo podatkov  
   **Čas:** 30-45 minut | **Strošek:** $20-80/month  
   **Kar se boste naučili:** Entity Framework, migracije baze, varnost povezav  
   **Pričakovani rezultat:** C# API z Azure SQL backendom, samodejno uvajanje sheme

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions z HTTP sprožilci in Cosmos DB  
   **Čas:** 30-40 minut | **Strošek:** $10-40/month  
   **Kar se boste naučili:** Dogodkovno usmerjena arhitektura, serverless skaliranje, NoSQL integracija  
   **Pričakovani rezultat:** Funkcijska aplikacija, ki odgovarja na HTTP zahteve z Cosmos DB shrambo

8. **[Mikroservisi - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Večstoritvena Java aplikacija z Container Apps in API gatewayom  
   **Čas:** 60-90 minut | **Strošek:** $80-200/month  
   **Kar se boste naučili:** Uvajanje Spring Boot, service mesh, load balancing  
   **Pričakovani rezultat:** Večstoritven Java sistem z odkrivanjem storitev in usmerjanjem

### Microsoft Foundry predloge

1. **[Aplikacija Azure OpenAI Chat - Lokalni primer](../../../examples/azure-openai-chat)** ⭐⭐  
   Popolno uvajanje GPT-4 z vmesnikom za klepet  
   **Čas:** 35-45 minut | **Strošek:** $50-200/month  
   **Pričakovani rezultat:** Delujoča klepetalna aplikacija s sledenjem tokenov in nadzorom stroškov

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Inteligentna klepetalna aplikacija z RAG arhitekturo  
   **Čas:** 60-90 minut | **Strošek:** $100-300/month  
   **Pričakovani rezultat:** Klepetalni vmesnik, podprt z RAG, iskanjem dokumentov in citati

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Analiza dokumentov z uporabo Azure AI storitev  
   **Čas:** 40-60 minut | **Strošek:** $20-80/month  
   **Pričakovani rezultat:** API za izluščitev besedila, tabel in entitet iz naloženih dokumentov

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps delovni tok z Azure Machine Learning  
   **Čas:** 2-3 ure | **Strošek:** $150-500/month  
   **Pričakovani rezultat:** Avtomatiziran ML cevovod z učenjem, uvajanjem in nadzorom

### Scenariji iz resničnega sveta

#### **Retail Multi-Agent rešitev** 🆕
**[Celovit vodič za implementacijo](./retail-scenario.md)**

Celovita, za produkcijo pripravljena rešitev za podporo strankam z več agenti, ki prikazuje uvajanje podjetniške AI aplikacije z AZD. Ta scenarij ponuja:

- **Popolna arhitektura**: Sistem več agentov s specializiranimi agenti za podporo strankam in upravljanje zalog
- **Proizvodna infrastruktura**: Večregijske razmestitve Azure OpenAI, AI Search, Container Apps in celovito spremljanje
- **Pripravljen ARM predlog za razmestitev**: Namestitev z enim klikom z več načini konfiguracije (Minimalno/Standardno/Premium)
- **Napredne funkcije**: Rdeče moštvo (red teaming) za preverjanje varnosti, okvir za ocenjevanje agentov, optimizacija stroškov in vodniki za odpravljanje težav
- **Resnični poslovni kontekst**: Primer uporabe za podporo strankam trgovca z nalaganjem datotek, integracijo iskanja in dinamičnim skaliranjem

**Tehnologije**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Zahtevnost**: ⭐⭐⭐⭐ (Napredno - primerno za podjetniško produkcijo)

**Popolno za**: razvijalce AI, arhitekte rešitev in ekipe, ki gradijo proizvodne sisteme z več agenti

**Hiter začetek**: Namestite celotno rešitev v manj kot 30 minutah z vključenim ARM predlogom z `./deploy.sh -g myResourceGroup`

## 📋 Navodila za uporabo

### Predpogoji

Pred zagonom katerega koli primera:
- ✅ Azure naročnina z dostopom Owner ali Contributor
- ✅ Azure Developer CLI nameščen ([Vodnik za namestitev](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop v teku (za primere s kontejnerji)
- ✅ Ustrezne kvote Azure (preverite zahteve za posamezen primer)

> **💰 Opozorilo glede stroškov:** Vsi primeri ustvarijo dejanske Azure vire, za katere se zaračunava. Glejte posamezne datoteke README za ocene stroškov. Ne pozabite zagnati `azd down`, ko končate, da preprečite nadaljnje stroške.

### Zaganjanje primerov lokalno

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
   # Nastavite zahtevane spremenljivke
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Razmestitev**
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
   
   **Pričakovani indikatorji uspeha:**
   - ✅ `azd up` se zaključi brez napak
   - ✅ Končna točka storitve vrne HTTP 200
   - ✅ Azure Portal prikazuje status "Running"
   - ✅ Application Insights sprejema telemetrijo

> **⚠️ Težave?** Oglejte si [Pogoste težave](../docs/chapter-07-troubleshooting/common-issues.md) za odpravljanje težav pri razmestitvi

### Prilagajanje primerov

Vsak primer vključuje:
- **README.md** - Podrobna navodila za nastavitev in prilagoditev
- **azure.yaml** - AZD konfiguracija s komentarji
- **infra/** - Bicep predloge s pojasnili parametrov
- **src/** - Vzorec izvorne kode aplikacije
- **scripts/** - Pomožni skripti za pogoste naloge

## 🎯 Cilji učenja

### Kategorije primerov

#### **Osnovne razmestitve**
- Enostavne enostoritvene aplikacije
- Preprosti vzorci infrastrukture
- Osnovno upravljanje konfiguracij
- Stroškovno učinkovite razvojne postavitve

#### **Napredni scenariji**
- Arhitekture z več storitvami
- Kompleksne mrežne konfiguracije
- Vzorce integracije baz podatkov
- Implementacije varnosti in skladnosti

#### **Produkcijsko pripravljeni vzorci**
- Konfiguracije z visoko razpoložljivostjo
- Spremljanje in opazljivost
- Integracija CI/CD
- Načrti za obnovitev po nesrečah

## 📖 Opisi primerov

### Preprosta spletna aplikacija - Node.js Express
**Tehnologije**: Node.js, Express, MongoDB, Container Apps  
**Zahtevnost**: Začetna  
**Koncepti**: Osnovna razmestitev, REST API, integracija NoSQL baze podatkov

### Statična spletna stran - React SPA
**Tehnologije**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Zahtevnost**: Začetna  
**Koncepti**: Statično gostovanje, strežniško brez strežnika (serverless) backend, sodoben spletni razvoj

### Container App - Python Flask
**Tehnologije**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Zahtevnost**: Začetna  
**Koncepti**: Kontejnerizacija, REST API, scale-to-zero, health probe, nadzor  
**Lokacija**: [Lokalni primer](../../../examples/container-app/simple-flask-api)

### Container App - Arhitektura mikrostoritev
**Tehnologije**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Zahtevnost**: Napredna  
**Koncepti**: Arhitektura z več storitvami, komunikacija med storitvami, vrstni red sporočil, distribuirano sledenje  
**Lokacija**: [Lokalni primer](../../../examples/container-app/microservices)

### Aplikacija z bazo podatkov - C# z Azure SQL
**Tehnologije**: C# ASP.NET Core, Azure SQL Database, App Service  
**Zahtevnost**: Vmesna  
**Koncepti**: Entity Framework, povezave z bazo podatkov, razvoj spletnega API

### Funkcije brez strežnika - Python Azure Functions
**Tehnologije**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Zahtevnost**: Vmesna  
**Koncepti**: Dogodkovno vodena arhitektura, strežniško brez strežnika, polnovredno razvijanje

### Mikrostoritev - Java Spring Boot
**Tehnologije**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Zahtevnost**: Vmesna  
**Koncepti**: Komunikacija mikrostoritev, distribuirani sistemi, podjetniški vzorci

### Primeri Microsoft Foundry

#### Azure OpenAI Chat App
**Tehnologije**: Azure OpenAI, Cognitive Search, App Service  
**Zahtevnost**: Vmesna  
**Koncepti**: RAG arhitektura, vektorsko iskanje, integracija LLM

#### AI obdelava dokumentov
**Tehnologije**: Azure AI Document Intelligence, Storage, Functions  
**Zahtevnost**: Vmesna  
**Koncepti**: Analiza dokumentov, OCR, ekstrakcija podatkov

#### Strojno učenje - cevovod
**Tehnologije**: Azure ML, MLOps, Container Registry  
**Zahtevnost**: Napredna  
**Koncepti**: Treniranje modelov, razmestitveni cevovodi, spremljanje

## 🛠 Primeri konfiguracij

Mapa `configurations/` vsebuje ponovno uporabne komponente:

### Nastavitve okolij
- Nastavitve razvojnega okolja
- Konfiguracije za staging okolje
- Produkcijsko pripravljene konfiguracije
- Večregijske postavitve

### Bicep moduli
- Ponovno uporabni infrastrukturni elementi
- Pogosti vzorci virov
- Varnostno utrjene predloge
- Stroškovno optimizirane konfiguracije

### Pomožni skripti
- Avtomatizacija nastavitve okolja
- Skripti za migracijo baz podatkov
- Orodja za preverjanje razmestitve
- Pripomočki za spremljanje stroškov

## 🔧 Vodnik za prilagoditev

### Prilagoditev primerov za vaš primer uporabe

1. **Preglejte predpogoje**
   - Preverite zahteve storitev Azure
   - Potrdite omejitve naročnine
   - Razumite vpliv na stroške

2. **Spremenite konfiguracijo**
   - Posodobite definicije storitev v `azure.yaml`
   - Prilagodite Bicep predloge
   - Nastavite spremenljivke okolja

3. **Temeljito testirajte**
   - Najprej razmestite v razvojno okolje
   - Potrdite funkcionalnost
   - Preizkusite skaliranje in zmogljivost

4. **Pregled varnosti**
   - Preglejte kontrolne dostopa
   - Uvedite upravljanje skrivnosti
   - Omogočite spremljanje in opozorila

## 📊 Matrika primerjave

| Primer | Storitve | Baza podatkov | Avtentikacija | Nadzor | Zahtevnost |
|---------|----------|----------|------|------------|------------|
| **Azure OpenAI Chat** (Lokalno) | 2 | ❌ | Key Vault | Polno | ⭐⭐ |
| **Python Flask API** (Lokalno) | 1 | ❌ | Osnovno | Polno | ⭐ |
| **Mikrostoritve** (Lokalno) | 5+ | ✅ | Podjetniško | Napredno | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Osnovno | Osnovno | ⭐ |
| React SPA + Functions | 3 | ✅ | Osnovno | Polno | ⭐ |
| Python Flask Container | 2 | ❌ | Osnovno | Polno | ⭐ |
| C# Web API + SQL | 2 | ✅ | Polno | Polno | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Polno | Polno | ⭐⭐ |
| Java Mikrostoritev | 5+ | ✅ | Polno | Polno | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Polno | Polno | ⭐⭐⭐ |
| AI obdelava dokumentov | 2 | ❌ | Osnovno | Polno | ⭐⭐ |
| ML cevovod | 4+ | ✅ | Polno | Polno | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Lokalno) | **8+** | **✅** | **Podjetniško** | **Napredno** | **⭐⭐⭐⭐** |

## 🎓 Pot učenja

### Priporočeno zaporedje

1. **Začnite s preprosto spletno aplikacijo**
   - Naučite se osnov AZD
   - Razumite potek razmestitve
   - Vadite upravljanje okolij

2. **Preizkusite statično spletno stran**
   - Raziščite različne možnosti gostovanja
   - Naučite se o integraciji CDN
   - Razumite konfiguracijo DNS

3. **Preidite na Container App**
   - Naučite se osnov kontejnerizacije
   - Razumite koncepte skaliranja
   - Vadite z Dockerjem

4. **Dodajte integracijo baze podatkov**
   - Naučite se zagotavljanja baz podatkov
   - Razumite connection string-e
   - Vadite upravljanje skrivnosti

5. **Raziščite serverless**
   - Razumite dogodkovno vodeno arhitekturo
   - Naučite se o sprožilcih in vezavah
   - Vadite z API-ji

6. **Gradite mikrostoritev**
   - Naučite se komunikacije med storitvami
   - Razumite distribuirane sisteme
   - Vadite kompleksne razmestitve

## 🔍 Iskanje pravega primera

### Po tehnološki skladbi
- **Container Apps**: [Python Flask API (Lokalno)](../../../examples/container-app/simple-flask-api), [Mikrostoritve (Lokalno)](../../../examples/container-app/microservices), Java Mikrostoritev
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Lokalno)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Lokalno)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Lokalno)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Lokalno)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, ML cevovod
- **Go**: [Microservices User Service (Lokalno)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Mikroservisi
- **React**: React SPA + Functions
- **Kontejnerji**: [Python Flask (Lokalno)](../../../examples/container-app/simple-flask-api), [Microservices (Lokalno)](../../../examples/container-app/microservices), Java Mikroservisi
- **Baze podatkov**: [Microservices (Lokalno)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Azure OpenAI Chat (Lokalno)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI obdelava dokumentov, ML cevovod, **Retail Multi-Agent Solution**
- **Sistemi z več agenti**: **Retail Multi-Agent Solution**
- **Integracija OpenAI**: **[Azure OpenAI Chat (Lokalno)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Podjetniška produkcija**: [Microservices (Lokalno)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Po arhitekturnem vzorcu
- **Preprost REST API**: [Python Flask API (Lokalno)](../../../examples/container-app/simple-flask-api)
- **Monolit**: Node.js Express Todo, C# Web API + SQL
- **Statično + Serverless**: React SPA + Functions, Python Functions + SPA
- **Mikrostoritve**: [Produkcijske mikrostoritev (Lokalno)](../../../examples/container-app/microservices), Java Spring Boot Mikroservisi
- **Kontejnerizirano**: [Python Flask (Lokalno)](../../../examples/container-app/simple-flask-api), [Microservices (Lokalno)](../../../examples/container-app/microservices)
- **AI-podprto**: **[Azure OpenAI Chat (Lokalno)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI obdelava dokumentov, ML cevovod, **Retail Multi-Agent Solution**
- **Arhitektura z več agenti**: **Retail Multi-Agent Solution**
- **Podjetniška večstoritev**: [Microservices (Lokalno)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Po stopnji zahtevnosti
- **Začetna**: [Python Flask API (Lokalno)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Vmesna**: **[Azure OpenAI Chat (Lokalno)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Mikroservisi, Azure OpenAI Chat App, AI obdelava dokumentov
- **Napredna**: ML cevovod
- **Primerno za podjetniško produkcijo**: [Microservices (Lokalno)](../../../examples/container-app/microservices) (Večstoritev z vrstami sporočil), **Retail Multi-Agent Solution** (Celovit sistem z več agenti in ARM predlogo za razmestitev)

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
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo aplikacija z Node.js in PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React spletna aplikacija s C# API-jem](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions z Javo](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Najboljše prakse
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Prispevanje primerov

Imate uporaben primer, ki bi ga radi delili? Veseli bomo vaših prispevkov!

### Smernice za pošiljanje
1. Sledite vzpostavljeni strukturi imenikov
2. Vključite obsežen README.md
3. Dodajte komentarje v konfiguracijske datoteke
4. Temeljito testirajte pred pošiljanjem
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

**Namig**: Začnite z najpreprostejšim primerom, ki ustreza vašemu tehnološkemu naboru, nato postopoma preidite na bolj zapletene scenarije. Vsak primer gradi na konceptih iz prejšnjih!

## 🚀 Pripravljeni začeti?

### Vaša učna pot

1. **Popoln začetnik?** → Začnite z [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 min)
2. **Imate osnovno znanje AZD?** → Poskusite [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 min)
3. **Razvijate AI aplikacije?** → Začnite z [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 min) ali raziščite [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ ure)
4. **Potrebujete specifičen tehnološki sklad?** → Uporabite razdelek [Iskanje pravega primera](../../../examples) zgoraj

### Naslednji koraki

- ✅ Preglejte [Predpogoji](../../../examples) zgoraj
- ✅ Izberite primer, ki ustreza vaši ravni znanja (glejte [Legenda kompleksnosti](../../../examples))
- ✅ Pred uvajanjem natančno preberite README primera
- ✅ Nastavite opomnik, da po testiranju zaženete `azd down`
- ✅ Delite svoje izkušnje prek GitHub Issues ali Discussions

### Potrebujete pomoč?

- 📖 [FAQ](../resources/faq.md) - Odgovori na pogosta vprašanja
- 🐛 [Vodnik za odpravljanje težav](../docs/chapter-07-troubleshooting/common-issues.md) - Odpravite težave pri uvajanju
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Vprašajte skupnost
- 📚 [Vodnik za učenje](../resources/study-guide.md) - Okrepite svoje znanje

---

**Navigacija**
- **📚 Domača stran tečaja**: [AZD For Beginners](../README.md)
- **📖 Učna gradiva**: [Vodnik za učenje](../resources/study-guide.md) | [Hitri vodnik](../resources/cheat-sheet.md) | [Besednjak](../resources/glossary.md)
- **🔧 Viri**: [FAQ](../resources/faq.md) | [Vodnik za odpravljanje težav](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Zadnja posodobitev: november 2025 | [Prijavite težave](https://github.com/microsoft/AZD-for-beginners/issues) | [Prispevajte primere](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Izjava o omejitvi odgovornosti:
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco Co-op Translator (https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, upoštevajte, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v izvor­nem jeziku velja za avtoritativni vir. Za ključne informacije priporočamo strokoven človeški prevod. Ne odgovarjamo za kakršnekoli nesporazume ali napačne razlage, ki bi nastale zaradi uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->