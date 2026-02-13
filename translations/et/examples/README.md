# Näited – Praktilised AZD mallid ja konfiguratsioonid

**Õppimine näidete kaudu – peatükkide kaupa korraldatud**
- **📚 Kursuse avaleht**: [AZD algajatele](../README.md)
- **📖 Peatükkide kaardistus**: Näited korraldatud õppimise keerukuse järgi
- **🚀 Kohalik näide**: [Jaemüügi mitmeagendi lahendus](retail-scenario.md)
- **🤖 Välised AI näited**: Lingid Azure Samplesi hoidlatele

> **📍 TÄHTIS: Kohalikud vs välised näited**  
> See hoidla sisaldab **4 täielikku kohalikku näidet** koos täielike rakendustega:  
> - **Azure OpenAI Chat** (GPT-4 juurutus koos vestlusliidesega)  
> - **Container Apps** (Lihtne Flask API + mikroteenused)  
> - **Andmebaasi rakendus** (Veeb + SQL andmebaas)  
> - **Jaemüügi mitmeagendi lahendus** (ettevõtte AI lahendus)  
>  
> Täiendavad näited on **välised viited** Azure-Samples hoidlatele, mida saate kloonida.

## Sissejuhatus

See kataloog pakub praktilisi näiteid ja viiteid, mis aitavad teil õppida Azure Developer CLI-d läbi käed-külge harjutuste. Jaemüügi mitmeagendi stsenaarium on täielik, tootmisvalmis rakendus, mis on lisatud sellesse hoidlas. Täiendavad näited viitavad ametlikele Azure Samplesi näidetele, mis demonstreerivad erinevaid AZD mustreid.

### Keerukuse hinnangu legend

- ⭐ **Algaja** – Põhikontseptsioonid, üks teenus, 15-30 minutit
- ⭐⭐ **Kesktase** – Mitmed teenused, andmebaasi integratsioon, 30-60 minutit
- ⭐⭐⭐ **Edasijõudnu** – Keerukas arhitektuur, AI integratsioon, 1-2 tundi
- ⭐⭐⭐⭐ **Ekspert** – Tootmisvalmis, ettevõtte mustrid, 2+ tundi

## 🎯 Mis selles hoidlas tegelikult on

### ✅ Kohalik rakendus (valmis kasutamiseks)

#### [Azure OpenAI Chat rakendus](azure-openai-chat/README.md) 🆕  
**Täielik GPT-4 juurutus koos vestlusliidesega, kaasatud sellesse hoidlas**

- **Asukoht:** `examples/azure-openai-chat/`
- **Keerukus:** ⭐⭐ (Kesktase)
- **Kaasas:**
  - Täielik Azure OpenAI juurutus (GPT-4)
  - Python käsurea vestlusliides
  - Key Vault integreerimine turvaliste API võtmete jaoks
  - Bicep infrastruktuuri mallid
  - Tokeni kasutuse ja kulu jälgimine
  - Piirangu ja veahaldus

**Kiire algus:**  
```bash
# Liigu näidise juurde
cd examples/azure-openai-chat

# Loo kõik üles
azd up

# Paigalda sõltuvused ja hakka vestlema
pip install -r src/requirements.txt
python src/chat.py
```
  
**Tehnoloogiad:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Container App näited](container-app/README.md) 🆕  
**Üldised konteineri juurutamise näited, kaasatud sellesse hoidlas**

- **Asukoht:** `examples/container-app/`
- **Keerukus:** ⭐-⭐⭐⭐⭐ (algajast edasijõudnuni)
- **Kaasas:**
  - [Master Guide](container-app/README.md) – Täielik konteinerite juurutamise ülevaade
  - [Lihtne Flask API](../../../examples/container-app/simple-flask-api) – Põhiline REST API näide
  - [Mikroteenused arhitektuur](../../../examples/container-app/microservices) – Tootmisvalmis mitme-teenuse lahendus
  - Kiire algus, tootmine ja edasijõudnute mustrid
  - Monitooring, turvalisus ja kuluefektiivsus

**Kiire algus:**  
```bash
# Vaata põhijuhendit
cd examples/container-app

# Loo lihtne Flask API
cd simple-flask-api
azd up

# Loo mikroteenuste näide
cd ../microservices
azd up
```
  
**Tehnoloogiad:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Jaemüügi mitmeagendi lahendus](retail-scenario.md) 🆕  
**Täielik tootmisvalmis rakendus, kaasatud sellesse hoidlas**

- **Asukoht:** `examples/retail-multiagent-arm-template/`
- **Keerukus:** ⭐⭐⭐⭐ (edasijõudnu)
- **Kaasas:**
  - Täielik ARM juurutusmall
  - Mitmeagendi arhitektuur (Kliendi + Laoseisu agent)
  - Azure OpenAI integratsioon
  - AI otsing koos RAG-iga
  - Ulatuslik monitooring
  - Ühe klõpsuga juurutusskript

**Kiire algus:**  
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```
  
**Tehnoloogiad:** Azure OpenAI, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Välised Azure Samples (kloonimiseks kasutamiseks)

Järgnevad näited asuvad ametlikes Azure-Samples hoidlates. Kloonige need, et uurida erinevaid AZD mustreid:

### Lihtsad rakendused (peatükid 1-2)

| Mall | Hoidla | Keerukus | Teenused |
|:-----|:-------|:---------|:---------|
| **Python Flask API** | [Kohalik: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Mikroteenused** | [Kohalik: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Mitme-teenus, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Kuidas kasutada:**  
```bash
# Klooni ükskõik milline näide
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Käivita rakendus
azd up
```
  
### AI rakenduste näited (peatükid 2, 5, 8)

| Mall | Hoidla | Keerukus | Fookus |
|:-----|:-------|:---------|:-------|
| **Azure OpenAI Chat** | [Kohalik: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | GPT-4 juurutus |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Põhiline AI vestlus |
| **AI agendid** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agendi raamistik |
| **Search + OpenAI demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG muster |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Ettevõtte AI |

### Andmebaasid ja edasijõudnud mustrid (peatükid 3-8)

| Mall | Hoidla | Keerukus | Fookus |
|:-----|:-------|:---------|:-------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Andmebaasi integratsioon |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverita |
| **Java mikroteenused** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Mitme-teenus |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Õpieesmärgid

Nende näidete läbi töötades saate:
- Harjutada Azure Developer CLI töövooge realistlike rakenduste stsenaariumitega
- Mõista erinevaid rakendusarhitektuure ja nende azd-lahendusi
- Valdada infrastruktuuri kui koodi mustreid erinevate Azure teenuste jaoks
- Rakendada konfiguratsioonihaldust ja keskkonnapõhiseid juurutusstrateegiaid
- Rakendada monitooringut, turvalisust ja skaleerimist praktilistes olukordades
- Koguda kogemust vigade otsimise ja silumisega tegelikes juurutusstsenaariumites

## Õpitulemused

Pärast nende näidete läbimist oskate:
- Juurutada erinevat tüüpi rakendusi kasutades Azure Developer CLI-d enesekindlalt
- Kohandada olemasolevaid malle oma rakenduse vajadustele
- Kujundada ja rakendada kohandatud infrastruktuuri mustreid Biceps
- Konfigureerida keerukaid mitme-teenuse rakendusi õigeteks sõltuvusteks
- Rakendada turvalisuse, monitooringu ja jõudluse parimaid tavasid reaalsetes stsenaariumites
- Tuvastada rikete põhjuseid ja optimeerida juurutusi praktilise kogemuse põhjal

## Kataloogi struktuur

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
  
## Kiire alguse näited

> **💡 Uus AZD-s?** Alustage näitest #1 (Flask API) – see võtab umbes 20 minutit ja õpetab põhikontseptsioone.

### Algajatele  
1. **[Container App – Python Flask API](../../../examples/container-app/simple-flask-api)** (Kohalik) ⭐  
   Juurutage lihtne REST API koos scale-to-zero-ga  
   **Aeg:** 20-25 minutit | **Kulu:** 0–5 $/kuu  
   **Õpite:** Põhiline azd töövoog, konteineriseerimine, tervisekontroll  
   **Oodatav tulemus:** Töötav API lõpp-punkt, mis tagastab "Hello, World!" koos monitooringuga

2. **[Lihtne veebirakendus – Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Juurutage Node.js Express veebirakendus MongoDB-ga  
   **Aeg:** 25-35 minutit | **Kulu:** 10–30 $/kuu  
   **Õpite:** Andmebaasi integratsioon, keskkonnamuutujad, ühendusstringid  
   **Oodatav tulemus:** Todo list rakendus, millel on loo/loe/muuda/kustuta funktsioonid

3. **[Staatiline veebisait – React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Hostige React staatilist veebisaiti Azure Static Web Apps abil  
   **Aeg:** 20-30 minutit | **Kulu:** 0–10 $/kuu  
   **Õpite:** Staatiline hostimine, serverita funktsioonid, CDN juurutus  
   **Oodatav tulemus:** React kasutajaliides API taustaga, automaatne SSL, globaalselt levitatud CDN

### Kesktaseme kasutajatele  
4. **[Azure OpenAI Chat rakendus](../../../examples/azure-openai-chat)** (Kohalik) ⭐⭐  
   Juurutage GPT-4 vestlusliidesega ja turvaliste API võtmete haldusega  
   **Aeg:** 35-45 minutit | **Kulu:** 50–200 $/kuu  
   **Õpite:** Azure OpenAI juurutus, Key Vault integratsioon, tokeni jälgimine  
   **Oodatav tulemus:** Töötav vestlusrakendus GPT-4-ga ja kulude jälgimisega

5. **[Container App – Mikroteenused](../../../examples/container-app/microservices)** (Kohalik) ⭐⭐⭐⭐  
   Tootmisvalmis mitme-teenuse arhitektuur  
   **Aeg:** 45-60 minutit | **Kulu:** 50–150 $/kuu  
   **Õpite:** Teenustevaheline kommunikatsioon, sõnumjärjekorrad, hajutatud jälgimine  
   **Oodatav tulemus:** 2-teenusel põhinev süsteem (API Gateway + toote teenus) monitooringuga

6. **[Andmebaasi rakendus – C# Azure SQL-iga](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Veebirakendus C# API ja Azure SQL andmebaasiga  
   **Aeg:** 30-45 minutit | **Kulu:** 20–80 $/kuu  
   **Õpite:** Entity Framework, andmebaasi migratsioonid, ühenduse turvalisus  
   **Oodatav tulemus:** C# API Azure SQL taustaga, automaatne skeemi juurutus

7. **[Serverita funktsioon – Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions HTTP käivitajate ja Cosmos DB-ga  
   **Aeg:** 30-40 minutit | **Kulu:** 10–40 $/kuu  
   **Õpite:** Sündmuspõhine arhitektuur, serverita skaleerimine, NoSQL integratsioon  
   **Oodatav tulemus:** Funktsioonirakendus, mis vastab HTTP päringutele koos Cosmos DB salvestusega

8. **[Mikroteenused – Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Mitme-teenuse Java rakendus koos Container Apps ja API väravaga  
   **Aeg:** 60-90 minutit | **Kulu:** 80–200 $/kuu  
   **Õpite:** Spring Boot juurutus, teenusevõrk, koormuse tasakaalustamine  
   **Oodatav tulemus:** Mitme-teenuse Java süsteem teenuste avastamise ja marsruutimisega

### Microsoft Foundry mallid

1. **[Azure OpenAI Chat rakendus – kohalik näide](../../../examples/azure-openai-chat)** ⭐⭐  
   Täielik GPT-4 juurutus koos vestlusliidesega  
   **Aeg:** 35-45 minutit | **Kulu:** 50–200 $/kuu  
   **Oodatav tulemus:** Töötav vestlusrakendus tokeni jälgimise ja kulude monitooringuga

2. **[Azure Search + OpenAI demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Intelligentsed vestlusrakendus RAG arhitektuuriga  
   **Aeg:** 60-90 minutit | **Kulu:** 100–300 $/kuu  
   **Oodatav tulemus:** RAG-toega vestlusliides dokumentide otsingu ja tsitaatide abil

3. **[AI dokumentide töötlemine](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Dokumentide analüüs Azure AI teenustega  
   **Aeg:** 40-60 minutit | **Kulu:** 20–80 $/kuu  
   **Oodatav tulemus:** API, mis eraldab teksti, tabeleid ja entiteete üleslaaditud dokumentidest

4. **[Masinõppe torujuhe](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps töövoog Azure Machine Learninguga  
   **Aeg:** 2-3 tundi | **Kulu:** 150–500 $/kuu  
   **Oodatav tulemus:** Automatiseeritud ML torujuhe koolituse, juurutuse ja monitooringuga

### Reaalsed stsenaariumid

#### **Jaemüügi mitmeagendi lahendus** 🆕  
**[Täielik rakendusjuhend](./retail-scenario.md)**

Ulatuslik, tootmisvalmis mitmeagendi klienditoe lahendus, mis demonstreerib ettevõtte taseme AI rakenduse juurutamist AZD-ga. See stsenaarium pakub:

- **Täielik arhitektuur**: Mitmeagendi süsteem, kus on spetsialiseeritud klienditeeninduse ja laohaldusagentide teenused
- **Tootmiskeskkond**: Mitme piirkonna Azure OpenAI juurutused, AI otsing, konteinerirakendused ja põhjalik jälgimine  
- **Koheseks Juurutamiseks ARM Mall**: Ühe klõpsuga juurutus mitme konfigureerimisrežiimiga (Minimaalne/Standard/Premium)  
- **Täpsemad Funktsioonid**: Red teaming turvakontroll, agendi hindamise raamistik, kuluoptimeerimine ja silumisjuhendid  
- **Reaalne Ärikontekst**: Jaemüüja klienditoe kasutusjuhtum failide üleslaadimise, otsingu integratsiooni ja dünaamilise skaleerimisega  

**Tehnoloogiad**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API  

**Kompleksus**: ⭐⭐⭐⭐ (Edasijõudnud - Ettevõtte tootmiskõlblik)  

**Täiuslik sobivus**: AI arendajad, lahenduste arhitektid ja meeskonnad, kes ehitavad tootmiskõlblikke mitmeagendilisi süsteeme  

**Kiire Algus**: Juuruta kogu lahendus alla 30 minutiga kaasasoleva ARM malliga `./deploy.sh -g myResourceGroup` käsuga  

## 📋 Kasutusjuhised  

### Eelteadmised  

Enne ükskõik millise näite käivitamist:  
- ✅ Azure tellimus koos omaniku või panustaja õigustega  
- ✅ Azure Developer CLI paigaldatud ([Paigaldusjuhend](../docs/chapter-01-foundation/installation.md))  
- ✅ Docker Desktop töötamas (konteinerinäidete jaoks)  
- ✅ Asjakohased Azure kvoodid (kontrolli näitepõhiseid nõudeid)  

> **💰 Kuluhoiatus:** Kõik näited loovad reaalseid Azure ressursse, mis toovad kaasa tasud. Kuluhinnanguid leiad vastavatest README failidest. Ära unusta pärast töö lõppu käivitada `azd down`, et vältida käimasolevaid kulutusi.  

### Näidete kohalik käivitamine  

1. **Kopeeri või klooni näide**  
   ```bash
   # Liigu soovitud näite juurde
   cd examples/simple-web-app
   ```
  
2. **Algatage AZD keskkond**  
   ```bash
   # Algata olemasoleva malliga
   azd init
   
   # Või loo uus keskkond
   azd env new my-environment
   ```
  
3. **Seadista keskkond**  
   ```bash
   # Määra nõutud muutujad
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```
  
4. **Juuruta**  
   ```bash
   # Paigaldage infrastruktuur ja rakendus
   azd up
   ```
  
5. **Kontrolli juurutust**  
   ```bash
   # Hangi teenuse lõpp-punktid
   azd env get-values
   
   # Testi lõpp-punkti (näide)
   curl https://your-app-url.azurecontainer.io/health
   ```
  
   **Oodatud edukuse märgid:**  
   - ✅ `azd up` lõpetab ilma vigadeta  
   - ✅ Teenuse lõpp-punkt tagastab HTTP 200  
   - ✅ Azure portaal näitab staatust "Running"  
   - ✅ Application Insights saab telemeetriaid  

> **⚠️ Probleemid?** Vaata [Levinumad probleemid](../docs/chapter-07-troubleshooting/common-issues.md) juurutusvigade lahendamiseks  

### Näidete kohandamine  

Iga näide sisaldab:  
- **README.md** - põhjalikud seadistus- ja kohandamisjuhised  
- **azure.yaml** - AZD konfiguratsioon kommentaaridega  
- **infra/** - Bicep mallid koos parameetrite selgitustega  
- **src/** - näidisrakenduse kood  
- **scripts/** - abiskriptid korduvate ülesannete jaoks  

## 🎯 Õpieesmärgid  

### Näidete kategooriad  

#### **Põhijuurutused**  
- Üksikteenuse rakendused  
- Lihtsad infrastruktuurimustrid  
- Põhine konfiguratsioonihaldus  
- Kuluefektiivsed arendusseaded  

#### **Täpsemad stsenaariumid**  
- Mitme teenuse arhitektuurid  
- Kompleksne võrgukonfiguratsioon  
- Andmebaasi integratsiooni mustrid  
- Turvalisuse ja vastavuse rakendused  

#### **Tootmiskõlblikud mustrid**  
- Kõrge kättesaadavuse konfiguratsioonid  
- Jälgimine ja vaatlusvõimalused  
- CI/CD integreerimine  
- Katastroofitaaste seadistused  

## 📖 Näidete kirjeldused  

### Lihtne veebirakendus - Node.js Express  
**Tehnoloogiad**: Node.js, Express, MongoDB, Container Apps  
**Kompleksus**: Algaja  
**Kontseptsioonid**: Põhijuurutus, REST API, NoSQL andmebaasi integratsioon  

### Staatiline veebisait - React SPA  
**Tehnoloogiad**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Kompleksus**: Algaja  
**Kontseptsioonid**: Staatiline majutus, serverivaba backend, kaasaegne veebiarendus  

### Konteinerirakendus - Python Flask  
**Tehnoloogiad**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Kompleksus**: Algaja  
**Kontseptsioonid**: Konteineriseerimine, REST API, skaleerimine nulli, tervisekontrollid, jälgimine  
**Asukoht**: [Kohalik näide](../../../examples/container-app/simple-flask-api)  

### Konteinerirakendus - Mikroteenuste arhitektuur  
**Tehnoloogiad**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Kompleksus**: Edasijõudnud  
**Kontseptsioonid**: Mitme teenuse arhitektuur, teenuste omavaheline kommunikatsioon, sõnumijärjekorraldus, hajutatud jälgimine  
**Asukoht**: [Kohalik näide](../../../examples/container-app/microservices)  

### Andmebaasirakendus - C# koos Azure SQL-iga  
**Tehnoloogiad**: C# ASP.NET Core, Azure SQL Database, App Service  
**Kompleksus**: Kesktase  
**Kontseptsioonid**: Entity Framework, andmebaasiühendused, veeb API arendus  

### Serverivaba funktsioon - Python Azure Functions  
**Tehnoloogiad**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Kompleksus**: Kesktase  
**Kontseptsioonid**: Sündmuspõhine arhitektuur, serverivaba arvutus, täisfunktsionaalne arendus  

### Mikroteenused - Java Spring Boot  
**Tehnoloogiad**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Kompleksus**: Kesktase  
**Kontseptsioonid**: Mikroteenuste kommunikatsioon, hajutatud süsteemid, ettevõtte mustrid  

### Microsoft Foundry näited  

#### Azure OpenAI Chat App  
**Tehnoloogiad**: Azure OpenAI, Cognitive Search, App Service  
**Kompleksus**: Kesktase  
**Kontseptsioonid**: RAG arhitektuur, vektoriotsing, LLM integratsioon  

#### AI dokumendi töötlemine  
**Tehnoloogiad**: Azure AI Document Intelligence, Storage, Functions  
**Kompleksus**: Kesktase  
**Kontseptsioonid**: Dokumendi analüüs, OCR, andmete väljavõte  

#### Masinõppe torujuhe  
**Tehnoloogiad**: Azure ML, MLOps, Container Registry  
**Kompleksus**: Edasijõudnud  
**Kontseptsioonid**: Mudelite treenimine, juurutustorud, jälgimine  

## 🛠 Konfiguratsiooni näited  

Kataloogis `configurations/` on korduvkasutatavad komponendid:  

### Keskkonna konfiguratsioonid  
- Arenduskeskkonna seaded  
- Testkeskkonna konfiguratsioonid  
- Tootmiskõlblikud seadistused  
- Mitme piirkonna juurutus  

### Bicep moodulid  
- Korduvkasutatavad infrastruktuurikomponendid  
- Üldised ressursimustrid  
- Turvalistetust tugevdatud mallid  
- Kuluoptimeeritud seadistused  

### Abiskriptid  
- Keskkonna ülesseadmist automatiseerivad skriptid  
- Andmebaasi migratsiooni skriptid  
- Juurutuse valideerimise tööriistad  
- Kulu jälgimise abivahendid  

## 🔧 Kohandamisjuhend  

### Näidete kohandamine oma kasutusjuhtumi jaoks  

1. **Vaata üle eelteadmised**  
   - Kontrolli Azure teenuste nõudeid  
   - Kinnita tellimuse piirangud  
   - Mõista kuluaspekte  

2. **Muuda konfiguratsiooni**  
   - Uuenda `azure.yaml` teenuse definitsioone  
   - Kohanda Bicep malle  
   - Reguleeri keskkonnamuutujaid  

3. **Testi põhjalikult**  
   - Juuruta esmalt arenduskeskkonda  
   - Kontrolli funktsionaalsust  
   - Katseta skaleerimist ja jõudlust  

4. **Turvalisuse ülevaade**  
   - Vaata üle ligipääsu kontrollid  
   - Rakenda saladuste haldus  
   - Lülita sisse jälgimine ja teavitamine  

## 📊 Võrdlustabel  

| Näide | Teenused | Andmebaas | Autentimine | Jälgimine | Kompleksus |  
|---------|----------|----------|------|------------|------------|  
| **Azure OpenAI Chat** (Kohalik) | 2 | ❌ | Key Vault | Täielik | ⭐⭐ |  
| **Python Flask API** (Kohalik) | 1 | ❌ | Põhiline | Täielik | ⭐ |  
| **Mikroteenused** (Kohalik) | 5+ | ✅ | Ettevõtte | Edasijõudnud | ⭐⭐⭐⭐ |  
| Node.js Express Todo | 2 | ✅ | Põhiline | Põhiline | ⭐ |  
| React SPA + Functions | 3 | ✅ | Põhiline | Täielik | ⭐ |  
| Python Flask Container | 2 | ❌ | Põhiline | Täielik | ⭐ |  
| C# Web API + SQL | 2 | ✅ | Täielik | Täielik | ⭐⭐ |  
| Python Functions + SPA | 3 | ✅ | Täielik | Täielik | ⭐⭐ |  
| Java Mikroteenused | 5+ | ✅ | Täielik | Täielik | ⭐⭐ |  
| Azure OpenAI Chat | 3 | ✅ | Täielik | Täielik | ⭐⭐⭐ |  
| AI dokumendi töötlemine | 2 | ❌ | Põhiline | Täielik | ⭐⭐ |  
| ML torujuhe | 4+ | ✅ | Täielik | Täielik | ⭐⭐⭐⭐ |  
| **Jaemüügi mitmeagendiline** (Kohalik) | **8+** | **✅** | **Ettevõtte** | **Edasijõudnud** | **⭐⭐⭐⭐** |  

## 🎓 Õppimine tee  

### Soovitatav arengurada  

1. **Alusta lihtsa veebirakendusega**  
   - Õpi põhikontseptsioone AZD-s  
   - Mõista juurutusvoogu  
   - Harjuta keskkonna haldust  

2. **Proovi staatilist veebisaiti**  
   - Uuri erinevaid majutusvõimalusi  
   - Õpi CDN integratsiooni  
   - Mõista DNS konfiguratsiooni  

3. **Liigu konteinerirakendusele**  
   - Õpi konteineriseerimise põhialuseid  
   - Mõista skaleerimise kontseptsioone  
   - Harjuta Dockeriga  

4. **Lisa andmebaasi integratsioon**  
   - Õpi andmebaasi valmis seadmist  
   - Mõista ühendusstringe  
   - Harjuta saladuste haldust  

5. **Uuri serverivaba lahendusi**  
   - Mõista sündmuspõhist arhitektuuri  
   - Õpi trigerite ja sidumiste kohta  
   - Harjuta API-dega  

6. **Ehita mikroteenuseid**  
   - Õpi teenustevahelist kommunikatsiooni  
   - Mõista hajutatud süsteeme  
   - Harjuta keerukate juurutuste kallal  

## 🔍 Õige näite leidmine  

### Tehnoloogiapinna järgi  
- **Container Apps**: [Python Flask API (Kohalik)](../../../examples/container-app/simple-flask-api), [Mikroteenused (Kohalik)](../../../examples/container-app/microservices), Java mikroteenused  
- **Node.js**: Node.js Express Todo App, [Mikroteenuste API Gateway (Kohalik)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (Kohalik)](../../../examples/container-app/simple-flask-api), [Mikroteenuste toote teenus (Kohalik)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [Mikroteenuste tellimuse teenus (Kohalik)](../../../examples/container-app/microservices), C# Web API + SQL andmebaas, Azure OpenAI Chat App, ML Pipeline  
- **Go**: [Mikroteenuste kasutajateenused (Kohalik)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot mikroteenused  
- **React**: React SPA + Functions  
- **Konteinerid**: [Python Flask (Kohalik)](../../../examples/container-app/simple-flask-api), [Mikroteenused (Kohalik)](../../../examples/container-app/microservices), Java mikroteenused  
- **Andmebaasid**: [Mikroteenused (Kohalik)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **AI/ML**: **[Azure OpenAI Chat (Kohalik)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI dokumendi töötlemine, ML Pipeline, **Jaemüügi mitmeagendiline lahendus**  
- **Mitmeagendi süsteemid**: **Jaemüügi mitmeagendiline lahendus**  
- **OpenAI integratsioon**: **[Azure OpenAI Chat (Kohalik)](../../../examples/azure-openai-chat)**, Jaemüügi mitmeagendiline lahendus  
- **Ettevõtte tootmises**: [Mikroteenused (Kohalik)](../../../examples/container-app/microservices), **Jaemüügi mitmeagendiline lahendus**  

### Arhitektuurimustri järgi  
- **Lihtne REST API**: [Python Flask API (Kohalik)](../../../examples/container-app/simple-flask-api)  
- **Monoliitne**: Node.js Express Todo, C# Web API + SQL  
- **Staatiline + Serverivaba**: React SPA + Functions, Python Functions + SPA  
- **Mikroteenused**: [Tootmismikroteenused (Kohalik)](../../../examples/container-app/microservices), Java Spring Boot mikroteenused  
- **Konteineriseeritud**: [Python Flask (Kohalik)](../../../examples/container-app/simple-flask-api), [Mikroteenused (Kohalik)](../../../examples/container-app/microservices)  
- **AI-toega**: **[Azure OpenAI Chat (Kohalik)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI dokumendi töötlemine, ML Pipeline, **Jaemüügi mitmeagendiline lahendus**  
- **Mitmeagendi arhitektuur**: **Jaemüügi mitmeagendiline lahendus**  
- **Ettevõtte mitmeteenus**: [Mikroteenused (Kohalik)](../../../examples/container-app/microservices), **Jaemüügi mitmeagendiline lahendus**  

### Kompleksuse taseme järgi  
- **Algaja**: [Python Flask API (Kohalik)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **Kesktase**: **[Azure OpenAI Chat (Kohalik)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java mikroteenused, Azure OpenAI Chat App, AI dokumendi töötlemine  
- **Edasijõudnud**: ML Pipeline  
- **Ettevõtte tootmiskõlblik**: [Mikroteenused (Kohalik)](../../../examples/container-app/microservices) (mitme teenusega koos sõnumijärjekorraga), **Jaemüügi mitmeagendiline lahendus** (täielik mitmeagendiline süsteem ARM malliga juurutamiseks)  

## 📚 Lisamaterjalid  

### Dokumentatsiooni lingid  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Microsoft Foundry AZD mallid](https://github.com/Azure/ai-foundry-templates)  
- [Bicep dokumentatsioon](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure arhitektuuri keskus](https://learn.microsoft.com/en-us/azure/architecture/)  

### Kogukonna näited  
- [Azure Samples AZD mallid](https://github.com/Azure-Samples/azd-templates)  
- [Microsoft Foundry mallid](https://github.com/Azure/ai-foundry-templates)  
- [Azure Developer CLI galerii](https://azure.github.io/awesome-azd/)  
- [Todo rakendus C# ja Azure SQL-iga](https://github.com/Azure-Samples/todo-csharp-sql)  
- [Todo rakendus Python ja MongoDB-ga](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo-rakendus Node.js ja PostgreSQL-iga](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React veebirakendus C# API-ga](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps töö](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions Java-ga](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Parimad Tavad
- [Azure Hästi Kujundatud Raamistik](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Pilve Omaks Võtmise Raamistik](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Näidete Panustamine

Kas sul on kasulik näide jagamiseks? Panuseid on teretulnud!

### Esitamise Juhised
1. Järgi kehtestatud kataloogistruktuuri
2. Lisa põhjalik README.md
3. Lisa kommentaarid konfiguratsioonifailidesse
4. Testi hoolikalt enne esitamist
5. Lisa maksumuse hinnangud ja eeldused

### Näidise Malli Struktuur
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

**Proffide Nipp**: Alusta kõige lihtsamast näitest, mis sobib sinu tehnoloogiapinuga, ja seejärel liigu järk-järgult keerukamate stsenaariumite poole. Iga näide tugineb eelnevate kontseptsioonidele!

## 🚀 Valmis Algama?

### Sinu Õppeteekond

1. **Täielik Algaja?** → Alusta [Flask API-ga](../../../examples/container-app/simple-flask-api) (⭐, 20 minutit)
2. **Omad Baasteadmisi AZD-st?** → Proovi [Mikroteenuseid](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 minutit)
3. **Ehita AI Rakendusi?** → Alusta [Azure OpenAI Chatiga](../../../examples/azure-openai-chat) (⭐⭐, 35 minutit) või avasta [Jaemüügi Mitmeagendi Stsenaarium](retail-scenario.md) (⭐⭐⭐⭐, 2+ tundi)
4. **Vajad Spetsiifilist Tehnoloogiat?** → Kasuta ülaltoodud peatükki [Õige Näidise Leidmine](../../../examples)

### Järgmised Sammud

- ✅ Vaata üle ülalmainitud [Eeldused](../../../examples)
- ✅ Vali näide oma oskuste tasemele vastav (vaata [Keerukuse Legend](../../../examples))
- ✅ Loe näidise README-d põhjalikult enne juurutamist
- ✅ Pane meeldetuletus käivitada `azd down` pärast testimist
- ✅ Jaga oma kogemust GitHubi Issues või Discussions-is

### Vajad Abi?

- 📖 [KKK](../resources/faq.md) - Levinud küsimused vastatud
- 🐛 [Tõrkeotsingu Juhend](../docs/chapter-07-troubleshooting/common-issues.md) - Juhtpõhjused ja lahendused
- 💬 [GitHub Arutelud](https://github.com/microsoft/AZD-for-beginners/discussions) - Küsi kogukonnalt
- 📚 [Õppematerjal](../resources/study-guide.md) - Tugevda oma teadmisi

---

**Navigeerimine**
- **📚 Kursuse Avaleht**: [AZD Algajatele](../README.md)
- **📖 Õppematerjalid**: [Õppematerjal](../resources/study-guide.md) | [Vihik](../resources/cheat-sheet.md) | [Sõnastik](../resources/glossary.md)
- **🔧 Ressursid**: [KKK](../resources/faq.md) | [Tõrkeotsing](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Viimati Uuendatud: november 2025 | [Teata Tõrgetest](https://github.com/microsoft/AZD-for-beginners/issues) | [Panusta Näidiseid](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastutusest loobumine**:  
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi me püüdleme täpsuse poole, palun pange tähele, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Originaaldokument selle algkeeles tuleks pidada autoriteetseks allikaks. Tähtsate andmete puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste ega ebatäpse tõlgendamise eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->