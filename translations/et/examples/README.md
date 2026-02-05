# Näited - Praktilised AZD mallid ja konfiguratsioonid

**Õppimine näidete kaudu - jaotatud peatükkide kaupa**
- **📚 Kursuse avaleht**: [AZD algajatele](../README.md)
- **📖 Peatükkide jaotus**: Näited jaotatud õppimise keerukuse järgi
- **🚀 Kohalik näide**: [Jaemüügi mitme agendi lahendus](retail-scenario.md)
- **🤖 Välised AI näited**: Lingid Azure Samples repositooriumidele

> **📍 OLULINE: Kohalikud vs välised näited**  
> See repositoorium sisaldab **4 täielikku kohalikku näidet** koos täielike rakendustega:  
> - **Azure OpenAI vestlus** (GPT-4 juurutamine vestlusliidesega)  
> - **Container Apps** (Lihtne Flask API + mikroteenused)  
> - **Andmebaasi rakendus** (Veeb + SQL andmebaas)  
> - **Jaemüügi mitme agendi lahendus** (Ettevõtte AI lahendus)  
>  
> Täiendavad näited on **välised viited** Azure-Samples repositooriumidele, mida saate kloonida.

## Sissejuhatus

See kataloog pakub praktilisi näiteid ja viiteid, mis aitavad teil õppida Azure Developer CLI-d praktilise harjutamise kaudu. Jaemüügi mitme agendi stsenaarium on täielik, tootmisvalmis rakendus, mis on kaasatud sellesse repositooriumisse. Täiendavad näited viitavad ametlikele Azure Samples näidetele, mis demonstreerivad erinevaid AZD mustreid.

### Keerukuse reitingu legend

- ⭐ **Algaja** - Põhimõisted, üks teenus, 15-30 minutit
- ⭐⭐ **Kesktase** - Mitu teenust, andmebaasi integreerimine, 30-60 minutit
- ⭐⭐⭐ **Edasijõudnud** - Keeruline arhitektuur, AI integreerimine, 1-2 tundi
- ⭐⭐⭐⭐ **Ekspert** - Tootmisvalmis, ettevõtte mustrid, 2+ tundi

## 🎯 Mis tegelikult selles repositooriumis on

### ✅ Kohalik rakendus (valmis kasutamiseks)

#### [Azure OpenAI vestlusrakendus](azure-openai-chat/README.md) 🆕
**Täielik GPT-4 juurutamine koos vestlusliidesega, kaasatud sellesse repositooriumisse**

- **Asukoht:** `examples/azure-openai-chat/`
- **Keerukus:** ⭐⭐ (Kesktase)
- **Mis on kaasatud:**
  - Täielik Azure OpenAI juurutamine (GPT-4)
  - Python käsurea vestlusliides
  - Key Vault integratsioon turvaliste API võtmete jaoks
  - Bicep infrastruktuuri mallid
  - Tokenite kasutuse ja kulude jälgimine
  - Kiiruse piiramine ja vigade käsitlemine

**Kiire alustamine:**
```bash
# Navigeeri näitele
cd examples/azure-openai-chat

# Paigalda kõik
azd up

# Paigalda sõltuvused ja alusta vestlust
pip install -r src/requirements.txt
python src/chat.py
```

**Tehnoloogiad:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Container App näited](container-app/README.md) 🆕
**Ulatuslikud konteinerite juurutamise näited, kaasatud sellesse repositooriumisse**

- **Asukoht:** `examples/container-app/`
- **Keerukus:** ⭐-⭐⭐⭐⭐ (Algajast eksperdini)
- **Mis on kaasatud:**
  - [Peamine juhend](container-app/README.md) - Ülevaade konteinerite juurutamisest
  - [Lihtne Flask API](../../../examples/container-app/simple-flask-api) - Põhiline REST API näide
  - [Mikroteenuste arhitektuur](../../../examples/container-app/microservices) - Tootmisvalmis mitme teenuse juurutamine
  - Kiire alustamine, tootmine ja edasijõudnud mustrid
  - Jälgimine, turvalisus ja kulude optimeerimine

**Kiire alustamine:**
```bash
# Vaata põhijuhendit
cd examples/container-app

# Paigalda lihtne Flask API
cd simple-flask-api
azd up

# Paigalda mikroteenuste näide
cd ../microservices
azd up
```

**Tehnoloogiad:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Jaemüügi mitme agendi lahendus](retail-scenario.md) 🆕
**Täielik tootmisvalmis rakendus, kaasatud sellesse repositooriumisse**

- **Asukoht:** `examples/retail-multiagent-arm-template/`
- **Keerukus:** ⭐⭐⭐⭐ (Edasijõudnud)
- **Mis on kaasatud:**
  - Täielik ARM juurutamise mall
  - Mitme agendi arhitektuur (Kliendi + Inventari)
  - Azure OpenAI integratsioon
  - AI otsing RAG mustriga
  - Ulatuslik jälgimine
  - Ühe klõpsuga juurutamise skript

**Kiire alustamine:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Tehnoloogiad:** Azure OpenAI, AI otsing, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Välised Azure Samples (kloonimiseks)

Järgnevad näited on hallatud ametlikes Azure-Samples repositooriumides. Kloonige need, et uurida erinevaid AZD mustreid:

### Lihtsad rakendused (Peatükid 1-2)

| Mall | Repositoorium | Keerukus | Teenused |
|:-----|:--------------|:---------|:---------|
| **Python Flask API** | [Kohalik: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Mikroteenused** | [Kohalik: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Mitme teenuse, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Kuidas kasutada:**
```bash
# Klooni ükskõik milline näide
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Paigalda
azd up
```

### AI rakenduste näited (Peatükid 2, 5, 8)

| Mall | Repositoorium | Keerukus | Fookus |
|:-----|:--------------|:---------|:------|
| **Azure OpenAI vestlus** | [Kohalik: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | GPT-4 juurutamine |
| **AI vestluse kiirstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Põhiline AI vestlus |
| **AI agendid** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agendi raamistik |
| **Otsing + OpenAI demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG muster |
| **Contoso vestlus** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Ettevõtte AI |

### Andmebaas & edasijõudnud mustrid (Peatükid 3-8)

| Mall | Repositoorium | Keerukus | Fookus |
|:-----|:--------------|:---------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Andmebaasi integreerimine |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java mikroteenused** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Mitme teenuse |
| **ML torujuhe** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Õppimise eesmärgid

Nende näidete läbimisel saate:
- Harjutada Azure Developer CLI töövooge realistlike rakenduste stsenaariumidega
- Mõista erinevaid rakenduste arhitektuure ja nende AZD rakendusi
- Valdada infrastruktuuri kui koodi mustreid erinevate Azure teenuste jaoks
- Rakendada konfiguratsioonihaldust ja keskkonnaspetsiifilisi juurutamisstrateegiaid
- Rakendada jälgimise, turvalisuse ja skaleerimise mustreid praktilises kontekstis
- Omandada kogemusi tõrkeotsingus ja reaalsete juurutamisstsenaariumide optimeerimises

## Õppimise tulemused

Pärast nende näidete läbimist suudate:
- Juurutada erinevaid rakenduste tüüpe enesekindlalt Azure Developer CLI abil
- Kohandada pakutud malle oma rakenduste nõuetele
- Kavandada ja rakendada kohandatud infrastruktuuri mustreid Bicepiga
- Konfigureerida keerulisi mitme teenuse rakendusi õige sõltuvusega
- Rakendada turvalisuse, jälgimise ja jõudluse parimaid tavasid reaalsetes stsenaariumides
- Lahendada probleeme ja optimeerida juurutusi praktilise kogemuse põhjal

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

## Kiire alustamise näited

> **💡 Uus AZD-s?** Alustage näitest #1 (Flask API) - see võtab ~20 minutit ja õpetab põhikontseptsioone.

### Algajatele
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Kohalik) ⭐  
   Juurutage lihtne REST API, mis skaleerub nullini  
   **Aeg:** 20-25 minutit | **Kulu:** $0-5/kuus  
   **Õpite:** Põhiline azd töövoog, konteineriseerimine, terviseproovid  
   **Oodatav tulemus:** Töötav API lõpp-punkt, mis tagastab "Hello, World!" koos jälgimisega

2. **[Lihtne veebirakendus - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Juurutage Node.js Express veebirakendus MongoDB-ga  
   **Aeg:** 25-35 minutit | **Kulu:** $10-30/kuus  
   **Õpite:** Andmebaasi integreerimine, keskkonnamuutujad, ühenduse stringid  
   **Oodatav tulemus:** Todo list rakendus koos loomise/lugemise/uuendamise/kustutamise funktsionaalsusega

3. **[Staatiline veebisait - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Hostige React staatilist veebisaiti Azure Static Web Apps abil  
   **Aeg:** 20-30 minutit | **Kulu:** $0-10/kuus  
   **Õpite:** Staatiline hostimine, serverless funktsioonid, CDN juurutamine  
   **Oodatav tulemus:** React UI koos API backendiga, automaatne SSL, globaalne CDN

### Kesktaseme kasutajatele
4. **[Azure OpenAI vestlusrakendus](../../../examples/azure-openai-chat)** (Kohalik) ⭐⭐  
   Juurutage GPT-4 vestlusliidesega ja turvalise API võtme haldusega  
   **Aeg:** 35-45 minutit | **Kulu:** $50-200/kuus  
   **Õpite:** Azure OpenAI juurutamine, Key Vault integratsioon, tokenite jälgimine  
   **Oodatav tulemus:** Töötav vestlusrakendus GPT-4-ga ja kulude jälgimisega

5. **[Container App - Mikroteenused](../../../examples/container-app/microservices)** (Kohalik) ⭐⭐⭐⭐  
   Tootmisvalmis mitme teenuse arhitektuur  
   **Aeg:** 45-60 minutit | **Kulu:** $50-150/kuus  
   **Õpite:** Teenustevaheline suhtlus, sõnumite järjekord, hajutatud jälgimine  
   **Oodatav tulemus:** 2-teenuse süsteem (API Gateway + Product Service) koos jälgimisega

6. **[Andmebaasi rakendus - C# koos Azure SQL-ga](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Veebirakendus C# API ja Azure SQL andmebaasiga  
   **Aeg:** 30-45 minutit | **Kulu:** $20-80/kuus  
   **Õpite:** Entity Framework, andmebaasi migratsioonid, ühenduse turvalisus  
   **Oodatav tulemus:** C# API koos Azure SQL backendiga, automaatne skeemi juurutamine

7. **[Serverless funktsioon - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions koos HTTP triggeritega ja Cosmos DB-ga  
   **Aeg:** 30-40 minutit | **Kulu:** $10-40/kuus  
   **Õpite:** Sündmuspõhine arhitektuur, serverless skaleerimine, NoSQL integratsioon  
   **Oodatav tulemus:** Funktsioonirakendus, mis vastab HTTP päringutele Cosmos DB salvestusega

8. **[Mikroteenused - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Mitme teenuse Java rakendus Container Apps ja API gatewayga  
   **Aeg:** 60-90 minutit | **Kulu:** $80-200/kuus  
   **Õpite:** Spring Boot juurutamine, teenuste võrk, koormuse tasakaalustamine  
   **Oodatav tulemus:** Mitme teenuse Java süsteem teenuste avastamise ja marsruutimisega

### Azure AI Foundry mallid

1. **[Azure OpenAI vestlusrakendus - Kohalik näide](../../../examples/azure-openai-chat)** ⭐⭐  
   Täielik GPT-4 juurutamine vestlusliidesega  
   **Aeg:** 35-45 minutit | **Kulu:** $50-200/kuus  
   **Oodatav tulemus:** Töötav vestlusrakendus tokenite jälgimise ja kulude jälgimisega

2. **[Azure otsing + OpenAI demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Nutikas vestlusrakendus RAG arhitektuuriga  
   **Aeg:** 60-90 minutit | **Kulu:** $100-300/kuus  
   **Oodatav tulemus:** RAG-põhine vestlusliides dokumentide otsingu ja viidetega

3. **[AI dokumenditöötlus](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Dokumentide analüüs Azure AI teenuste abil  
   **Aeg:** 40-60 minutit | **Kulu:** $20-80/kuus  
   **Oodatav tulemus:** API, mis eraldab tekstid, tabelid ja üksused üleslaaditud dokumentidest

4. **[Masinõppe torujuhe](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps töövoog Azure Machine Learningiga  
   **Aeg:** 2-3 tundi | **Kulu:** $150-500/kuus  
   **Oodatav tulemus:** Automaatne ML torujuhe koos treeningu, juurutamise ja jälgimisega

### Reaalsed stsenaariumid

#### **Jaemüügi mitme agendi lahendus** 🆕
**[Täielik rakendusjuhend](./retail-scenario.md)**

Ulatuslik, tootmisvalmis mitme agendi klienditoe lahendus, mis demonstreerib ettevõtte tasemel AI rakenduse juurutamist AZD-ga. See stsenaarium pakub:

- **Täielik arhitektuur**: Mitme agendi süsteem spetsialiseeritud klienditeeninduse ja inventari halduse agentidega
- **Tootmiskeskkond**: Mitme piirkonna Azure OpenAI juurutused, AI otsing, konteinerirakendused ja põhjalik monitooring  
- **Valmis ARM-mall**: Ühe klõpsuga juurutamine mitme konfiguratsioonirežiimiga (Minimal/Standard/Premium)  
- **Täiustatud funktsioonid**: Turvalisuse testimine (red teaming), agentide hindamisraamistik, kulude optimeerimine ja tõrkeotsingu juhendid  
- **Reaalne ärikontekst**: Jaemüüja klienditoe kasutusjuhtum koos failide üleslaadimise, otsingu integreerimise ja dünaamilise skaleerimisega  

**Tehnoloogiad**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API  

**Keerukus**: ⭐⭐⭐⭐ (Täpsem - ettevõtte tootmiskeskkonna jaoks valmis)  

**Sobib ideaalselt**: AI arendajatele, lahenduste arhitektidele ja meeskondadele, kes loovad tootmiskeskkonna mitmeagendilisi süsteeme  

**Kiire alustamine**: Juuruta täielik lahendus vähem kui 30 minutiga, kasutades kaasasolevat ARM-malli käsuga `./deploy.sh -g myResourceGroup`  

## 📋 Kasutusjuhised  

### Eeltingimused  

Enne näidete käivitamist:  
- ✅ Azure'i tellimus koos omaniku või kaastöötaja juurdepääsuga  
- ✅ Azure Developer CLI paigaldatud ([Paigaldusjuhend](../docs/getting-started/installation.md))  
- ✅ Docker Desktop töötab (konteinerite näidete jaoks)  
- ✅ Sobivad Azure'i kvoodid (kontrollige näitepõhiseid nõudeid)  

> **💰 Kulude hoiatus:** Kõik näited loovad reaalseid Azure'i ressursse, mis võivad tekitada kulusid. Vaadake üksikute README-failide kuluhinnanguid. Pärast lõpetamist käivitage `azd down`, et vältida jätkuvaid kulusid.  

### Näidete käivitamine kohapeal  

1. **Näite kloonimine või kopeerimine**  
   ```bash
   # Liigu soovitud näite juurde
   cd examples/simple-web-app
   ```
  
2. **AZD keskkonna initsialiseerimine**  
   ```bash
   # Initsialiseeri olemasoleva malliga
   azd init
   
   # Või loo uus keskkond
   azd env new my-environment
   ```
  
3. **Keskkonna seadistamine**  
   ```bash
   # Määra vajalikud muutujad
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```
  
4. **Juurutamine**  
   ```bash
   # Paigalda infrastruktuur ja rakendus
   azd up
   ```
  
5. **Juurutamise kontrollimine**  
   ```bash
   # Hankige teenuse lõpp-punktid
   azd env get-values
   
   # Testige lõpp-punkti (näide)
   curl https://your-app-url.azurecontainer.io/health
   ```
  
   **Oodatavad edukuse näitajad:**  
   - ✅ `azd up` lõpeb vigadeta  
   - ✅ Teenuse lõpp-punkt tagastab HTTP 200  
   - ✅ Azure'i portaal näitab olekut "Running"  
   - ✅ Application Insights saab telemeetriat  

> **⚠️ Probleemid?** Vaadake [Levinud probleemid](../docs/troubleshooting/common-issues.md) juurutamise tõrkeotsingu jaoks  

### Näidete kohandamine  

Iga näide sisaldab:  
- **README.md** - Üksikasjalikud seadistamise ja kohandamise juhised  
- **azure.yaml** - AZD konfiguratsioon koos kommentaaridega  
- **infra/** - Bicep-mallid koos parameetrite selgitustega  
- **src/** - Näidisrakenduse kood  
- **scripts/** - Abiskriptid tavaliste ülesannete jaoks  

## 🎯 Õpieesmärgid  

### Näidete kategooriad  

#### **Põhilised juurutused**  
- Ühe teenuse rakendused  
- Lihtsad infrastruktuurimustrid  
- Põhiline konfiguratsioonihaldus  
- Kulutõhusad arenduskeskkonnad  

#### **Täpsemad stsenaariumid**  
- Mitme teenuse arhitektuurid  
- Keerulised võrgukonfiguratsioonid  
- Andmebaasi integreerimise mustrid  
- Turvalisuse ja vastavuse rakendused  

#### **Tootmiskeskkonna mustrid**  
- Kõrge kättesaadavuse konfiguratsioonid  
- Monitooring ja jälgitavus  
- CI/CD integratsioon  
- Katastroofist taastumise seadistused  

## 📖 Näidete kirjeldused  

### Lihtne veebirakendus - Node.js Express  
**Tehnoloogiad**: Node.js, Express, MongoDB, Container Apps  
**Keerukus**: Algaja  
**Kontseptsioonid**: Põhiline juurutamine, REST API, NoSQL andmebaasi integreerimine  

### Staatiline veebisait - React SPA  
**Tehnoloogiad**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Keerukus**: Algaja  
**Kontseptsioonid**: Staatiline hostimine, serverivaba taustsüsteem, kaasaegne veebiarendus  

### Konteinerirakendus - Python Flask  
**Tehnoloogiad**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Keerukus**: Algaja  
**Kontseptsioonid**: Konteineriseerimine, REST API, nullini skaleerimine, tervisekontrollid, monitooring  
**Asukoht**: [Kohalik näide](../../../examples/container-app/simple-flask-api)  

### Konteinerirakendus - Mikroteenuste arhitektuur  
**Tehnoloogiad**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Keerukus**: Täpsem  
**Kontseptsioonid**: Mitme teenuse arhitektuur, teenustevaheline suhtlus, sõnumijärjekorrad, hajutatud jälgimine  
**Asukoht**: [Kohalik näide](../../../examples/container-app/microservices)  

### Andmebaasirakendus - C# koos Azure SQL-iga  
**Tehnoloogiad**: C# ASP.NET Core, Azure SQL Database, App Service  
**Keerukus**: Keskmine  
**Kontseptsioonid**: Entity Framework, andmebaasiühendused, veebirakenduse API arendus  

### Serverivaba funktsioon - Python Azure Functions  
**Tehnoloogiad**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Keerukus**: Keskmine  
**Kontseptsioonid**: Sündmuspõhine arhitektuur, serverivaba arvutus, täisstack arendus  

### Mikroteenused - Java Spring Boot  
**Tehnoloogiad**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Keerukus**: Keskmine  
**Kontseptsioonid**: Mikroteenuste suhtlus, hajutatud süsteemid, ettevõttemustrid  

### Azure AI Foundry näited  

#### Azure OpenAI vestlusrakendus  
**Tehnoloogiad**: Azure OpenAI, Cognitive Search, App Service  
**Keerukus**: Keskmine  
**Kontseptsioonid**: RAG arhitektuur, vektoriotsing, LLM integratsioon  

#### AI dokumenditöötlus  
**Tehnoloogiad**: Azure AI Document Intelligence, Storage, Functions  
**Keerukus**: Keskmine  
**Kontseptsioonid**: Dokumendianalüüs, OCR, andmete eraldamine  

#### Masinõppe torujuhe  
**Tehnoloogiad**: Azure ML, MLOps, Container Registry  
**Keerukus**: Täpsem  
**Kontseptsioonid**: Mudelite treenimine, juurutustorud, monitooring  

## 🛠 Konfiguratsiooninäited  

Kataloog `configurations/` sisaldab korduvkasutatavaid komponente:  

### Keskkonnakonfiguratsioonid  
- Arenduskeskkonna seaded  
- Testkeskkonna konfiguratsioonid  
- Tootmiskeskkonna valmis konfiguratsioonid  
- Mitme piirkonna juurutuse seadistused  

### Bicep-moodulid  
- Korduvkasutatavad infrastruktuurikomponendid  
- Levinud ressursimustrid  
- Turvalisuse tugevdamise mallid  
- Kulutõhusad konfiguratsioonid  

### Abiskriptid  
- Keskkonna seadistamise automatiseerimine  
- Andmebaasi migratsiooniskriptid  
- Juurutamise valideerimise tööriistad  
- Kulude jälgimise utiliidid  

## 🔧 Kohandamise juhend  

### Näidete kohandamine oma kasutusjuhtumi jaoks  

1. **Vaadake üle eeltingimused**  
   - Kontrollige Azure'i teenuste nõudeid  
   - Veenduge tellimuse limiitides  
   - Mõistke kulude mõju  

2. **Muuda konfiguratsiooni**  
   - Uuendage `azure.yaml` teenuse määratlusi  
   - Kohandage Bicep-malle  
   - Kohandage keskkonnamuutujaid  

3. **Testige põhjalikult**  
   - Juurutage esmalt arenduskeskkonda  
   - Kontrollige funktsionaalsust  
   - Testige skaleerimist ja jõudlust  

4. **Turvalisuse ülevaade**  
   - Kontrollige juurdepääsukontrolle  
   - Rakendage saladuste haldust  
   - Lubage monitooring ja hoiatused  

## 📊 Võrdlustabel  

| Näide | Teenused | Andmebaas | Autentimine | Monitooring | Keerukus |  
|---------|----------|----------|------|------------|------------|  
| **Azure OpenAI vestlus** (Kohalik) | 2 | ❌ | Key Vault | Täielik | ⭐⭐ |  
| **Python Flask API** (Kohalik) | 1 | ❌ | Põhiline | Täielik | ⭐ |  
| **Mikroteenused** (Kohalik) | 5+ | ✅ | Ettevõtte | Täpsem | ⭐⭐⭐⭐ |  
| Node.js Express Todo | 2 | ✅ | Põhiline | Põhiline | ⭐ |  
| React SPA + Functions | 3 | ✅ | Põhiline | Täielik | ⭐ |  
| Python Flask Container | 2 | ❌ | Põhiline | Täielik | ⭐ |  
| C# Web API + SQL | 2 | ✅ | Täielik | Täielik | ⭐⭐ |  
| Python Functions + SPA | 3 | ✅ | Täielik | Täielik | ⭐⭐ |  
| Java Mikroteenused | 5+ | ✅ | Täielik | Täielik | ⭐⭐ |  
| Azure OpenAI vestlus | 3 | ✅ | Täielik | Täielik | ⭐⭐⭐ |  
| AI dokumenditöötlus | 2 | ❌ | Põhiline | Täielik | ⭐⭐ |  
| ML torujuhe | 4+ | ✅ | Täielik | Täielik | ⭐⭐⭐⭐ |  
| **Jaemüügi mitmeagendiline lahendus** (Kohalik) | **8+** | **✅** | **Ettevõtte** | **Täpsem** | **⭐⭐⭐⭐** |  

## 🎓 Õppimistee  

### Soovitatav järjekord  

1. **Alustage lihtsast veebirakendusest**  
   - Õppige põhilisi AZD kontseptsioone  
   - Mõistke juurutamise töövoogu  
   - Harjutage keskkonna haldamist  

2. **Proovige staatilist veebisaiti**  
   - Avastage erinevaid hostimisvõimalusi  
   - Õppige CDN-i integreerimist  
   - Mõistke DNS-i konfiguratsiooni  

3. **Liikuge konteinerirakenduse juurde**  
   - Õppige konteineriseerimise aluseid  
   - Mõistke skaleerimise kontseptsioone  
   - Harjutage Dockeriga  

4. **Lisage andmebaasi integreerimine**  
   - Õppige andmebaasi seadistamist  
   - Mõistke ühendusstringe  
   - Harjutage saladuste haldamist  

5. **Uurige serverivaba arhitektuuri**  
   - Mõistke sündmuspõhist arhitektuuri  
   - Õppige päästikute ja sidemete kohta  
   - Harjutage API-dega  

6. **Ehitage mikroteenuseid**  
   - Õppige teenustevahelist suhtlust  
   - Mõistke hajutatud süsteeme  
   - Harjutage keerukaid juurutusi  

## 🔍 Õige näite leidmine  

### Tehnoloogiapõhiselt  
- **Konteinerirakendused**: [Python Flask API (Kohalik)](../../../examples/container-app/simple-flask-api), [Mikroteenused (Kohalik)](../../../examples/container-app/microservices), Java mikroteenused  
- **Node.js**: Node.js Express Todo rakendus, [Mikroteenuste API Gateway (Kohalik)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (Kohalik)](../../../examples/container-app/simple-flask-api), [Mikroteenuste toote teenus (Kohalik)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [Mikroteenuste tellimuse teenus (Kohalik)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI vestlusrakendus, ML torujuhe  
- **Go**: [Mikroteenuste kasutaja teenus (Kohalik)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot mikroteenused  
- **React**: React SPA + Functions  
- **Konteinerid**: [Python Flask (Kohalik)](../../../examples/container-app/simple-flask-api), [Mikroteenused (Kohalik)](../../../examples/container-app/microservices), Java mikroteenused  
- **Andmebaasid**: [Mikroteenused (Kohalik)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **AI/ML**: **[Azure OpenAI vestlus (Kohalik)](../../../examples/azure-openai-chat)**, Azure OpenAI vestlusrakendus, AI dokumenditöötlus, ML torujuhe, **Jaemüügi mitmeagendiline lahendus**  
- **Mitmeagendilised süsteemid**: **Jaemüügi mitmeagendiline lahendus**  
- **OpenAI integratsioon**: **[Azure OpenAI vestlus (Kohalik)](../../../examples/azure-openai-chat)**, Jaemüügi mitmeagendiline lahendus  
- **Ettevõtte tootmiskeskkond**: [Mikroteenused (Kohalik)](../../../examples/container-app/microservices), **Jaemüügi mitmeagendiline lahendus**  

### Arhitektuurimustri järgi  
- **Lihtne REST API**: [Python Flask API (Kohalik)](../../../examples/container-app/simple-flask-api)  
- **Monoliitne**: Node.js Express Todo, C# Web API + SQL  
- **Staatiline + serverivaba**: React SPA + Functions, Python Functions + SPA  
- **Mikroteenused**: [Tootmiskeskkonna mikroteenused (Kohalik)](../../../examples/container-app/microservices), Java Spring Boot mikroteenused  
- **Konteineriseeritud**: [Python Flask (Kohalik)](../../../examples/container-app/simple-flask-api), [Mikroteenused (Kohalik)](../../../examples/container-app/microservices)  
- **AI-toega**: **[Azure OpenAI vestlus (Kohalik)](../../../examples/azure-openai-chat)**, Azure OpenAI vestlusrakendus, AI dokumenditöötlus, ML torujuhe, **Jaemüügi mitmeagendiline lahendus**  
- **Mitmeagendiline arhitektuur**: **Jaemüügi mitmeagendiline lahendus**  
- **Ettevõtte mitme teenuse lahendus**: [Mikroteenused (Kohalik)](../../../examples/container-app/microservices), **Jaemüügi mitmeagendiline lahendus**  

### Keerukuse taseme järgi  
- **Algaja**: [Python Flask API (Kohalik)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **Keskmine**: **[Azure OpenAI vestlus (Kohalik)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java mikroteenused, Azure OpenAI vestlusrakendus, AI dokumenditöötlus  
- **Täpsem**: ML torujuhe  
- **Ettevõtte tootmiskeskkond**: [Mikroteenused (Kohalik)](../../../examples/container-app/microservices) (Mitme teenusega sõnumijärjekorrad), **Jaemüügi mitmeagendiline lahendus** (Täielik mitmeagendiline süsteem ARM-malli juurutusega)  

## 📚 Lisamaterjalid  

### Dokumentatsiooni lingid  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Azure AI Foundry AZD mallid](https://github.com/Azure/ai-foundry-templates)  
- [Bicep dokumentatsioon](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure arhitektuurikeskus](https://learn.microsoft.com/en-us/azure/architecture/)  

### Kogukonna näited  
- [Azure näidised AZD mallid](https://github.com/Azure-Samples/azd-templates)  
- [Azure AI Foundry mallid](https://github.com/Azure/ai-found
- [Todo rakendus Node.js ja PostgreSQL-iga](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React veebirakendus C# API-ga](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps töö](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions Java-ga](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Parimad praktikad
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Näidete panustamine

Kas sul on kasulik näide, mida jagada? Ootame sinu panust!

### Esitamise juhised
1. Järgi kehtestatud kaustastruktuuri
2. Lisa põhjalik README.md
3. Lisa kommentaarid konfiguratsioonifailidesse
4. Testi põhjalikult enne esitamist
5. Lisa kuluhinnangud ja eeldused

### Näidise mallistruktuur
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

**Nipp**: Alusta kõige lihtsamast näitest, mis sobib sinu tehnoloogiaga, ja liigu järk-järgult keerukamate stsenaariumide poole. Iga näide tugineb eelmistele kontseptsioonidele!

## 🚀 Valmis alustama?

### Sinu õpiteekond

1. **Täiesti algaja?** → Alusta [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 min)
2. **Põhilised AZD teadmised olemas?** → Proovi [Mikroteenuseid](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 min)
3. **Ehitate AI rakendusi?** → Alusta [Azure OpenAI vestlusest](../../../examples/azure-openai-chat) (⭐⭐, 35 min) või avasta [Jaemüügi multi-agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ tundi)
4. **Vajate konkreetset tehnoloogiaplatvormi?** → Kasutage jaotist [Õige näite leidmine](../../../examples) ülal

### Järgmised sammud

- ✅ Vaata üle [Eeldused](../../../examples) ülal
- ✅ Vali näide, mis vastab sinu oskuste tasemele (vaata [Keerukuse legend](../../../examples))
- ✅ Loe näite README põhjalikult enne juurutamist
- ✅ Pane meeldetuletus käivitada `azd down` pärast testimist
- ✅ Jaga oma kogemust GitHub Issues või Discussions kaudu

### Vajad abi?

- 📖 [KKK](../resources/faq.md) - Vastused levinud küsimustele
- 🐛 [Tõrkeotsingu juhend](../docs/troubleshooting/common-issues.md) - Lahenda juurutamise probleeme
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Küsi kogukonnalt
- 📚 [Õppematerjalid](../resources/study-guide.md) - Tugevda oma teadmisi

---

**Navigeerimine**
- **📚 Kursuse avaleht**: [AZD algajatele](../README.md)
- **📖 Õppematerjalid**: [Õppematerjalid](../resources/study-guide.md) | [Spikker](../resources/cheat-sheet.md) | [Sõnastik](../resources/glossary.md)
- **🔧 Ressursid**: [KKK](../resources/faq.md) | [Tõrkeotsing](../docs/troubleshooting/common-issues.md)

---

*Viimati uuendatud: november 2025 | [Teata probleemidest](https://github.com/microsoft/AZD-for-beginners/issues) | [Panusta näidetega](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:  
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame tagada täpsust, palume arvestada, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Algne dokument selle algses keeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitame kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste või valesti tõlgenduste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->