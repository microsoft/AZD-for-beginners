# Näited - Praktilised AZD mallid ja konfiguratsioonid

**Õppimine näidete kaudu - organiseeritud peatükkide kaupa**  
- **📚 Kursuse avaleht**: [AZD algajatele](../README.md)  
- **📖 Peatükkide kaart**: näited organiseeritud õppimise keerukuse alusel  
- **🚀 Kohalik näide**: [Jaemüügi mitmeagendi lahendus](retail-scenario.md)  
- **🤖 Välised AI näited**: lingid Azure Samples repodele  

> **📍 TÄHTIS: Kohalikud vs välised näited**  
> See hoidla sisaldab **4 täiesti kohalikku näidet** täielike rakendustega:  
> - **Microsoft Foundry Models Chat** (gpt-4.1 juurutus koos jututulemiga)  
> - **Container Apps** (Lihtne Flask API + mikroteenused)  
> - **Andmebaasi rakendus** (Veeb + SQL andmebaas)  
> - **Jaemüügi mitmeagendi lahendus** (ettevõtte AI lahendus)  
>  
> Täiendavad näited on **välised viited** Azure-Samples repodele, mida saab kloonida.

## Sissejuhatus

See kaust pakub praktilisi näiteid ja viiteid, et aidata sul õppida Azure Developer CLI-d käed-külge harjutuste kaudu. Jaemüügi mitmeagendi stsenaarium on täielik, tootmiskõlblik rakendus, mis on lisatud sellesse hoidlas. Täiendavad näited viitavad ametlikele Azure Samples repodele, mis demonstreerivad erinevaid AZD mustreid.

### Keerukuse skaalatähised

- ⭐ **Algaja** – Põhimõisted, üks teenus, 15-30 minutit  
- ⭐⭐ **Kesktase** – Mitmed teenused, andmebaasi integratsioon, 30-60 minutit  
- ⭐⭐⭐ **Edasijõudnu** – Keerukas arhitektuur, AI integratsioon, 1-2 tundi  
- ⭐⭐⭐⭐ **Ekspert** – Tootmiskõlblik, ettevõtte mustrid, 2+ tundi  

## 🎯 Mis tegelikult selles hoidlas on

### ✅ Kohalik rakendus (valmis kasutamiseks)

#### [Microsoft Foundry Models juturakendus](azure-openai-chat/README.md) 🆕  
**Täielik gpt-4.1 juurutus koos jutuliidesega on selles hoidlas**

- **Asukoht:** `examples/azure-openai-chat/`  
- **Keerukus:** ⭐⭐ (kesktase)  
- **Sisaldab:**  
  - Täielik Microsoft Foundry Models juurutus (gpt-4.1)  
  - Python käsurea jutuliides  
  - Key Vault integratsioon turvaliste API võtmete jaoks  
  - Bicepi infrastruktuurimallid  
  - Tokenite kasutuse ja kulude jälgimine  
  - Piirangute seadmine ja veahaldus  

**Kiire alustamine:**  
```bash
# Navigeeri näidisele
cd examples/azure-openai-chat

# Paigalda kõik
azd up

# Paigalda sõltuvused ja alusta vestlust
pip install -r src/requirements.txt
python src/chat.py
```
  
**Tehnoloogiad:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep  

#### [Container App näited](container-app/README.md) 🆕  
**Üldised konteineri juurutuse näited selles hoidlas**

- **Asukoht:** `examples/container-app/`  
- **Keerukus:** ⭐-⭐⭐⭐⭐ (algajast edasijõudnuni)  
- **Sisaldab:**  
  - [Peamine juhend](container-app/README.md) - Täielik konteinerite juurutuste ülevaade  
  - [Lihtne Flask API](../../../examples/container-app/simple-flask-api) - Põhiline REST API näide  
  - [Mikroteenuste arhitektuur](../../../examples/container-app/microservices) - Tootmiskõlblik mitme teenuse juurutus  
  - Kiire algus, tootmismustrid ja edasijõudnute mustrid  
  - Jälgimine, turvalisus ja kulude optimeerimine  

**Kiire alustamine:**  
```bash
# Vaata peamist juhendit
cd examples/container-app

# Kasuta lihtsat Flask API-t
cd simple-flask-api
azd up

# Kasuta mikroteenuste näidet
cd ../microservices
azd up
```
  
**Tehnoloogiad:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights  

#### [Jaemüügi mitmeagendi lahendus](retail-scenario.md) 🆕  
**Täielik tootmiskõlblik rakendus sisaldub selles hoidlas**

- **Asukoht:** `examples/retail-multiagent-arm-template/`  
- **Keerukus:** ⭐⭐⭐⭐ (edasijõudnu)  
- **Sisaldab:**  
  - Täielik ARM juurutuse mall  
  - Mitmeagendi arhitektuur (kliendi- ja laoseisuagent)  
  - Microsoft Foundry Models integratsioon  
  - AI otsing koos RAG-ga  
  - Põhjalik jälgimine  
  - Ühe klõpsuga juurutusskript  

**Kiire alustamine:**  
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```
  
**Tehnoloogiad:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights  

---

## 🔗 Välised Azure Samples (klooni kasutamiseks)

Järgnevad näited on ametlikult hoitud Azure-Samples repodes. Klooni need, et uurida erinevaid AZD mustreid:

### Lihtsad rakendused (Peatükid 1–2)

| Mall | Hoidla | Keerukus | Teenused |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Kohalik: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Mikroteenused** | [Kohalik: mikroteenused](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Mitme teenuse, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + funktsioonid** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, funktsioonid, SQL |
| **Python Flask konteiner** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Kasutusjuhend:**  
```bash
# Kloneeri ükskõik milline näide
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Rakenda
azd up
```
  
### AI rakenduste näited (Peatükid 2, 5, 8)

| Mall | Hoidla | Keerukus | Fookus |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [Kohalik: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 juurutus |
| **AI jutuvestluse kiire algus** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Põhiline AI jutuvestlus |
| **AI agendid** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agendi raamistik |
| **Otsing + OpenAI demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG muster |
| **Contoso jututuba** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Ettevõtte AI |

### Andmebaas & edasijõudnud mustrid (Peatükid 3–8)

| Mall | Hoidla | Keerukus | Fookus |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Andmebaasi integratsioon |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java mikroteenused** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Mitme teenuse |
| **ML torujuhe** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Õpieesmärgid

Nende näidete läbimängimisel:  
- Harjutad Azure Developer CLI töövooge realistlike rakenduste stsenaariumitega  
- Mõistad erinevaid rakendusarhitektuure ja nende azd rakendusi  
- Valdad infrastruktuuri koodi mustreid erinevate Azure teenuste jaoks  
- Rakendad konfiguratsiooni haldust ja keskkonnapõhist juurutusstrateegiat  
- Rakendad jälgimise, turvalisuse ja skaleerimise mustreid praktilistes tingimustes  
- Hangid kogemusi tõrkeotsingus ja silumises päris juurutussituatsioonides  

## Õpitulemused

Pärast nende näidete lõpetamist suudad:  
- Usaldusväärselt juurutada erinevaid rakendustüüpe Azure Developer CLI-ga  
- Kohandada antud malle vastavalt oma rakenduse nõuetele  
- Kujundada ja rakendada kohandatud infrastruktuuri mustreid Bicepiga  
- Konfigureerida keerukaid mitme teenusega rakendusi korralike sõltuvustega  
- Rakendada turbe-, jälgimis- ja jõudluse parimaid praktikaid päris stsenaariumites  
- Tõrkeotsida ja optimeerida juurutusi praktilise kogemuse põhjal  

## Kausta struktuur

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
  
## Kiired stardinäited

> **💡 Uus AZD-s?** Alusta näitega #1 (Flask API) - võtab ~20 minutit ja õpetab põhitõdesid.

### Algajatele  
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (kohalik) ⭐  
   Juhi lihtsat REST API-d koos scale-to-zero-ga  
   **Aeg:** 20-25 minutit | **Kulu:** $0-5/kuus  
   **Õpid:** põhilise azd töövoo, konteineriseerimise, tervisekontrolli  
   **Oodatav tulemus:** töökas API lõpp-punkt, mis tagastab "Hello, World!" koos jälgimisega  

2. **[Lihtne veebirakendus - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Juhi Node.js Express veebirakendus MongoDB-ga  
   **Aeg:** 25-35 minutit | **Kulu:** $10-30/kuus  
   **Õpid:** andmebaasi integratsioon, keskkonnamuutujad, ühendusstringid  
   **Oodatav tulemus:** Todo nimekirja rakendus, mis toetab loomist/lugemist/uuendamist/kustutamist  

3. **[Staatiline veebisait - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Host React staatilist veebisaiti Azure Static Web Apps abil  
   **Aeg:** 20-30 minutit | **Kulu:** $0-10/kuus  
   **Õpid:** staatiline hostimine, serverless funktsioonid, CDN juurutus  
   **Oodatav tulemus:** React kasutajaliides API backendiga, automaatne SSL, globaalne CDN  

### Kesktaseme kasutajatele  
4. **[Microsoft Foundry Models juturakendus](../../../examples/azure-openai-chat)** (kohalik) ⭐⭐  
   Juhi gpt-4.1 jutuliidesega ja turvalise API võtme haldusega  
   **Aeg:** 35-45 minutit | **Kulu:** $50-200/kuus  
   **Õpid:** Microsoft Foundry Models juurutust, Key Vault integratsiooni, tokenite jälgimist  
   **Oodatav tulemus:** töökas juturakendus gpt-4.1 ja kulu jälgimisega  

5. **[Container App - Mikroteenused](../../../examples/container-app/microservices)** (kohalik) ⭐⭐⭐⭐  
   Tootmiskõlblik mitme teenuse arhitektuur  
   **Aeg:** 45-60 minutit | **Kulu:** $50-150/kuus  
   **Õpid:** teenustevahelist kommunikatsiooni, sõnumijärjekordi, hajutatud jälgimist  
   **Oodatav tulemus:** 2-teenusega süsteem (API Gateway + toote teenus) koos jälgimisega  

6. **[Andmebaasi rakendus - C# Azure SQL-iga](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Veebirakendus C# API ja Azure SQL andmebaasiga  
   **Aeg:** 30-45 minutit | **Kulu:** $20-80/kuus  
   **Õpid:** Entity Framework, andmebaasi migratsioonid, ühenduste turve  
   **Oodatav tulemus:** C# API Azure SQL tagapõhja ja automaatse skeemi juurutusega  

7. **[Serverless funktsioon - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure funktsioonid HTTP päästikutega ja Cosmos DB-ga  
   **Aeg:** 30-40 minutit | **Kulu:** $10-40/kuus  
   **Õpid:** sündmuspõhine arhitektuur, serverless skaleerimine, NoSQL integratsioon  
   **Oodatav tulemus:** funktsioonirakendus, mis reageerib HTTP päringutele Cosmos DB salvestusega  

8. **[Mikroteenused - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Mitme teenusega Java rakendus Container Apps ja API Gatewayga  
   **Aeg:** 60-90 minutit | **Kulu:** $80-200/kuus  
   **Õpid:** Spring Boot juurutus, teenusevõrk, koormuse tasakaalustamine  
   **Oodatav tulemus:** Java mitme teenuse süsteem teenuste avastuse ja marsruutimisega  

### Microsoft Foundry mallid

1. **[Microsoft Foundry Models juturakendus - kohalik näide](../../../examples/azure-openai-chat)** ⭐⭐  
   Täielik gpt-4.1 juurutus jutuliidesega  
   **Aeg:** 35-45 minutit | **Kulu:** $50-200/kuus  
   **Oodatav tulemus:** töökas juturakendus tokeni jälgimise ja kulu jälgimisega  

2. **[Azure Search + OpenAI demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Intelligentselt juhitud jutuliides RAG arhitektuuriga  
   **Aeg:** 60-90 minutit | **Kulu:** $100-300/kuus  
   **Oodatav tulemus:** RAG-põhine jutuliides dokumentide otsingu ja viidetega  

3. **[AI dokumenditöötlus](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Dokumentide analüüs Azure AI teenustega  
   **Aeg:** 40-60 minutit | **Kulu:** $20-80/kuus  
   **Oodatav tulemus:** API, mis ekstraheerib teksti, tabeleid ja entiteete üleslaaditud dokumentidest  

4. **[Masinõppe torujuhe](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps töövoog Azure Machine Learninguga  
   **Aeg:** 2-3 tundi | **Kulu:** $150-500/kuus  
   **Oodatav tulemus:** automatiseeritud ML torujuhe koolituse, juurutuse ja jälgimisega  

### Reaalsed stsenaariumid

#### **Jaemüügi mitmeagendi lahendus** 🆕  
**[Täielik rakenduse juhend](./retail-scenario.md)**

Põhjalik, tootmiskõlblik mitmeagendi klienditoe lahendus, mis demonstreerib ettevõtte taseme AI rakenduse juurutust AZD-ga. See stsenaarium pakub:

- **Täielik arhitektuur**: mitmeagendiga süsteem eraldiseisvate klienditeeninduse ja laohalduse agentidega
- **Tootmiskeskkond**: Mitme regiooni Microsoft Foundry mudelite paigaldused, AI otsing, konteinerirakendused ja põhjalik monitooring  
- **Koheseks kasutamiseks valmis ARM mall**: Ühe klõpsuga paigaldus mitme konfiguratsioonirežiimiga (Minimal/Standard/Premium)  
- **Täpsemad funktsioonid**: Punase meeskonna turvakontroll, agendi hindamise raamistik, kulude optimeerimine ja tõrkeotsingu juhendid  
- **Reaalne ärikontekst**: Jaemüüja klienditoe kasutusjuhtum failide üleslaadimise, otsingute integreerimise ja dünaamilise skaleerimisega  

**Tehnoloogiad**: Microsoft Foundry mudelid (gpt-4.1, gpt-4.1-mini), Azure AI Search, konteinerirakendused, Cosmos DB, Application Insights, Document Intelligence, Bing Search API  

**Kompleksus**: ⭐⭐⭐⭐ (Täpsem - ettevõttekeskkonnaks valmis)

**Täiuslik valik**: AI arendajatele, lahenduste arhitektidele ja meeskondadele, kes ehitavad tootmiskasutuseks mitmeagendilisi süsteeme  

**Kiire alustamine**: Paigaldage kogu lahendus vähem kui 30 minutiga kaasasoleva ARM malliga käsuga `./deploy.sh -g myResourceGroup`  

## 📋 Kasutusjuhised

### Eeldused

Enne mõne näite käivitamist:  
- ✅ Azure tellimus, millel on omaniku või panustaja ligipääs  
- ✅ Azure Developer CLI on paigaldatud ([paigaldusjuhend](../docs/chapter-01-foundation/installation.md))  
- ✅ Docker Desktop töötab (konteinerinäidete jaoks)  
- ✅ Sobivad Azure kvoodid (kontrollige näidete erisoove)  

> **💰 Kuluhoiatus:** Kõik näited loovad päris Azure ressursse, mis toovad kaasa tasusid. Vaadake iga README faili kulueeskirjade kohta. Pärast kasutamist käivitage `azd down`, et vältida jätkuvaid kulusid.  

### Näidete kohalik käivitamine

1. **Kloonige või kopeerige näide**  
   ```bash
   # Liigu soovitud näite juurde
   cd examples/simple-web-app
   ```
  
2. **Initsialiseerige AZD keskkond**  
   ```bash
   # Initsialiseeri olemasoleva malliga
   azd init
   
   # Või loo uus keskkond
   azd env new my-environment
   ```
  
3. **Seadistage keskkond**  
   ```bash
   # Määra vajalikud muutujad
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```
  
4. **Paigaldage**  
   ```bash
   # Paigalda infrastruktuur ja rakendus
   azd up
   ```
  
5. **Kontrollige paigaldust**  
   ```bash
   # Saa teenuse lõpp-punktid
   azd env get-values
   
   # Testi lõpp-punkti (näide)
   curl https://your-app-url.azurecontainer.io/health
   ```
  
   **Oodatavad õnnestumise tunnused:**  
   - ✅ `azd up` lõpetab ilma vigadeta  
   - ✅ Teenuse lõpp-punkt tagastab HTTP 200  
   - ✅ Azure portaal näitab olekut "Running"  
   - ✅ Application Insights vastuvõtmas telemeetriaid  

> **⚠️ Probleemid?** Vaadake [tuntud probleemid](../docs/chapter-07-troubleshooting/common-issues.md) tõrkeotsingu abiks  

### Näidete kohandamine

Igal näitel on kaasas:  
- **README.md** - Üksikasjalikud seadistus- ja kohandamisjuhised  
- **azure.yaml** - AZD konfiguratsioon kommentaaridega  
- **infra/** - Bicep mallid koos parameetrite seletustega  
- **src/** - Näidiskoodi rakendus  
- **scripts/** - Abi skriptid sagedasteks ülesanneteks  

## 🎯 Õpieesmärgid

### Näidete kategooriad

#### **Põhilised paigaldused**  
- Ühetegevuslikud rakendused  
- Lihtsad infrastruktuuri mustrid  
- Põhiline konfiguratsioonihaldus  
- Kulutõhusad arenduskeskkonnad  

#### **Täpsemad stsenaariumid**  
- Mitmekihilised arhitektuurid  
- Keerukad võrgukonfiguratsioonid  
- Andmebaasi integratsiooni mustrid  
- Turva- ja vastavuslahendused  

#### **Toodanguks valmis mustrid**  
- Kõrge kättesaadavuse konfiguratsioonid  
- Monitooring ja jälgitavus  
- CI/CD integreerimine  
- Katastroofitaaste lahendused  

## 📖 Näidete kirjelduse

### Lihtne veebirakendus - Node.js Express  
**Tehnoloogiad**: Node.js, Express, MongoDB, konteinerirakendused  
**Kompleksus**: Algaja  
**Kontseptsioonid**: Põhiline paigaldus, REST API, NoSQL andmebaasi integratsioon  

### Staatiline veebileht - React SPA  
**Tehnoloogiad**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Kompleksus**: Algaja  
**Kontseptsioonid**: Staatiline majutus, serverivaba backend, kaasaegne veebiarendus  

### Konteinerirakendus - Python Flask  
**Tehnoloogiad**: Python Flask, Docker, konteinerirakendused, konteineriregister, Application Insights  
**Kompleksus**: Algaja  
**Kontseptsioonid**: Konteiner kasutamine, REST API, skaleerimine nulli, terviseprobe, monitooring  
**Asukoht**: [Kohalik näide](../../../examples/container-app/simple-flask-api)  

### Konteinerirakendus - mikroteenuste arhitektuur  
**Tehnoloogiad**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, konteinerirakendused  
**Kompleksus**: Täpsem  
**Kontseptsioonid**: Mitmete teenuste arhitektuur, teenustevaheline suhtlus, sõnumite järjekord, hajutatud jälgimine  
**Asukoht**: [Kohalik näide](../../../examples/container-app/microservices)  

### Andmebaasirakendus - C# Azure SQL-iga  
**Tehnoloogiad**: C# ASP.NET Core, Azure SQL andmebaas, App Service  
**Kompleksus**: Kesktase  
**Kontseptsioonid**: Entity Framework, andmebaasiühendused, veebirakenduse API arendus  

### Serverivaba funktsioon - Python Azure Functions  
**Tehnoloogiad**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Kompleksus**: Kesktase  
**Kontseptsioonid**: Sündmustepõhine arhitektuur, serverivaba arvutus, täispinu arendus  

### Mikroteenused - Java Spring Boot  
**Tehnoloogiad**: Java Spring Boot, konteinerirakendused, Service Bus, API Gateway  
**Kompleksus**: Kesktase  
**Kontseptsioonid**: Mikroteenuste side, hajutatud süsteemid, ettevõtte mustrid  

### Microsoft Foundry näited

#### Microsoft Foundry mudelite vestlusrakendus  
**Tehnoloogiad**: Microsoft Foundry mudelid, Azure AI Search, App Service  
**Kompleksus**: Kesktase  
**Kontseptsioonid**: RAG arhitektuur, vektorotsing, LLM integratsioon  

#### AI dokumenditöötlus  
**Tehnoloogiad**: Azure AI Document Intelligence, Storage, Functions  
**Kompleksus**: Kesktase  
**Kontseptsioonid**: Dokumendianalüüs, OCR, andmete väljavõte  

#### Masinõppe torujuhe  
**Tehnoloogiad**: Azure ML, MLOps, konteineriregister  
**Kompleksus**: Täpsem  
**Kontseptsioonid**: Mudelite treening, paigaldustoru, monitooring  

## 🛠 Konfiguratsiooni näited

Kataloog `configurations/` sisaldab taaskasutatavaid komponente:  

### Keskkonna konfiguratsioonid  
- Arenduskeskkonna seaded  
- Staging keskkonna konfiguratsioonid  
- Toodanguks valmis konfiguratsioonid  
- Mitme regiooni paigaldised  

### Bicep moodulid  
- Taaskasutavad infrastruktuuri komponendid  
- Levinud ressursimustrid  
- Turvaliselt tugevdunud mallid  
- Kuluefektiivsed konfiguratsioonid  

### Abiskriptid  
- Keskkonna seadistamise automatiseerimine  
- Andmebaasi migratsiooniskriptid  
- Paigalduse valideerimise tööriistad  
- Kulude jälgimise utiliidid  

## 🔧 Kohandamise juhend

### Näidete kohandamine oma kasutusvajadustele

1. **Eelduste kontroll**  
   - Kontrollige Azure teenuste nõudeid  
   - Vaadake üle tellimuse limiidid  
   - Mõistke kulude mõju  

2. **Konfiguratsiooni muutmine**  
   - Uuendage `azure.yaml` teenuste definitsioone  
   - Kohandage Bicep malle  
   - Muutke keskkonnamuutujaid  

3. **Testige põhjalikult**  
   - Paigaldage esmalt arenduskeskkonda  
   - Kontrollige funktsionaalsust  
   - Testige skaleerimist ja jõudlust  

4. **Turvakontroll**  
   - Vaadake ligipääsukontrollid üle  
   - Rakendage saladuste haldus  
   - Lubage monitooringu ja häirete teavitamine  

## 📊 Võrdlustabel

| Näide                          | Teenused | Andmebaas | Autentimine | Monitooring | Kompleksus |
|--------------------------------|----------|-----------|-------------|-------------|------------|
| **Microsoft Foundry mudelite vestlus** (kohalik) | 2        | ❌        | Key Vault   | Täielik     | ⭐⭐         |
| **Python Flask API** (kohalik) | 1        | ❌        | Põhiline    | Täielik     | ⭐          |
| **Mikroteenused** (kohalik)    | 5+       | ✅        | Ettevõtte   | Täpsem      | ⭐⭐⭐⭐       |
| Node.js Express Todo           | 2        | ✅        | Põhiline    | Põhiline    | ⭐          |
| React SPA + Functions          | 3        | ✅        | Põhiline    | Täielik     | ⭐          |
| Python Flask konteiner         | 2        | ❌        | Põhiline    | Täielik     | ⭐          |
| C# Web API + SQL              | 2        | ✅        | Täielik     | Täielik     | ⭐⭐         |
| Python Functions + SPA         | 3        | ✅        | Täielik     | Täielik     | ⭐⭐         |
| Java mikroteenused             | 5+       | ✅        | Täielik     | Täielik     | ⭐⭐         |
| Microsoft Foundry mudelite vestlus | 3     | ✅        | Täielik     | Täielik     | ⭐⭐⭐        |
| AI dokumenditöötlus            | 2        | ❌        | Põhiline    | Täielik     | ⭐⭐         |
| ML torujuhe                   | 4+       | ✅        | Täielik     | Täielik     | ⭐⭐⭐⭐       |
| **Jaemüügi mitmeagendiline** (kohalik) | **8+**  | **✅**    | **Ettevõtte** | **Täpsem**  | **⭐⭐⭐⭐**   |

## 🎓 Õpitee

### Soovitatud järjekord

1. **Alustage lihtsast veebirakendusest**  
   - Õppige AZD põhimõtteid  
   - Mõistke paigaldustöövoogu  
   - Harjutage keskkondade haldamist  

2. **Proovige staatilist veebilehte**  
   - Uurige erinevaid majutusvõimalusi  
   - Õppige CDN integreerimisest  
   - Mõistke DNS konfiguratsiooni  

3. **Liikuge konteinerirakenduste poole**  
   - Õppige konteineriseerimise aluseid  
   - Mõistke skaleerimise kontseptsioone  
   - Harjutage Dockeriga  

4. **Lisage andmebaasi integratsioon**  
   - Õppige andmebaasi provisjoneerimist  
   - Mõistke ühendusstringide tähendust  
   - Harjutage saladuste haldust  

5. **Uurige serverivaba tehnoloogiat**  
   - Mõistke sündmustepõhist arhitektuuri  
   - Õppige käivitajatest ja sidumistest  
   - Harjutage APIdega  

6. **Ehitage mikroteenuseid**  
   - Õppige teenustevahelist suhtlust  
   - Mõistke hajutatud süsteeme  
   - Harjutage keerukate paigaldustega  

## 🔍 Sobiva näite leidmine

### Tehnoloogiapinu järgi  
- **Konteinerirakendused**: [Python Flask API (kohalik)](../../../examples/container-app/simple-flask-api), [Mikroteenused (kohalik)](../../../examples/container-app/microservices), Java mikroteenused  
- **Node.js**: Node.js Express Todo App, [Mikroteenuste API Gateway (kohalik)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (kohalik)](../../../examples/container-app/simple-flask-api), [Mikroteenuste tooteteenus (kohalik)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [Mikroteenuste tellimisteenus (kohalik)](../../../examples/container-app/microservices), C# Web API + SQL andmebaas, Microsoft Foundry mudelite vestlusrakendus, ML torujuhe  
- **Go**: [Mikroteenuste kasutajateenus (kohalik)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot mikroteenused  
- **React**: React SPA + Functions  
- **Konteinerid**: [Python Flask (kohalik)](../../../examples/container-app/simple-flask-api), [Mikroteenused (kohalik)](../../../examples/container-app/microservices), Java mikroteenused  
- **Andmebaasid**: [Mikroteenused (kohalik)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **AI/ML**: **[Microsoft Foundry mudelite vestlus (kohalik)](../../../examples/azure-openai-chat)**, Microsoft Foundry mudelite vestlusrakendus, AI dokumenditöötlus, ML torujuhe, **Jaemüügi mitmeagendiline lahendus**  
- **Mitmeagendilised süsteemid**: **Jaemüügi mitmeagendiline lahendus**  
- **OpenAI integratsioon**: **[Microsoft Foundry mudelite vestlus (kohalik)](../../../examples/azure-openai-chat)**, Jaemüügi mitmeagendiline lahendus  
- **Ettevõtte tootmine**: [Mikroteenused (kohalik)](../../../examples/container-app/microservices), **Jaemüügi mitmeagendiline lahendus**  

### Arhitektuurimustri järgi  
- **Lihtne REST API**: [Python Flask API (kohalik)](../../../examples/container-app/simple-flask-api)  
- **Monoliitne**: Node.js Express Todo, C# Web API + SQL  
- **Staatiline + serverivaba**: React SPA + Functions, Python Functions + SPA  
- **Mikroteenused**: [Tootmismikroteenused (kohalik)](../../../examples/container-app/microservices), Java Spring Boot mikroteenused  
- **Konteineriseeritud**: [Python Flask (kohalik)](../../../examples/container-app/simple-flask-api), [Mikroteenused (kohalik)](../../../examples/container-app/microservices)  
- **AI-toega**: **[Microsoft Foundry mudelite vestlus (kohalik)](../../../examples/azure-openai-chat)**, Microsoft Foundry mudelite vestlusrakendus, AI dokumenditöötlus, ML torujuhe, **Jaemüügi mitmeagendiline lahendus**  
- **Mitmeagendi arhitektuur**: **Jaemüügi mitmeagendiline lahendus**  
- **Ettevõtte mitmete teenustega**: [Mikroteenused (kohalik)](../../../examples/container-app/microservices), **Jaemüügi mitmeagendiline lahendus**  

### Raskeustaseme järgi  
- **Algaja**: [Python Flask API (kohalik)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **Kesktase**: **[Microsoft Foundry mudelite vestlus (kohalik)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java mikroteenused, Microsoft Foundry mudelite vestlusrakendus, AI dokumenditöötlus  
- **Täpsem**: ML torujuhe  
- **Ettevõtte tootmiskeskkond**: [Mikroteenused (kohalik)](../../../examples/container-app/microservices) (Mitme teenusega koos sõnumite järjekorraga), **Jaemüügi mitmeagendiline lahendus** (Täielik mitmeagendiline süsteem ARM malli paigaldusega)  

## 📚 Lisamaterjalid

### Dokumentatsiooni lingid  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Microsoft Foundry AZD mallid](https://github.com/Azure/ai-foundry-templates)  
- [Bicepi dokumentatsioon](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure arhitektuurikeskus](https://learn.microsoft.com/en-us/azure/architecture/)  

### Kogukonnanäited  
- [Azure näidiste AZD mallid](https://github.com/Azure-Samples/azd-templates)  
- [Microsoft Foundry mallid](https://github.com/Azure/ai-foundry-templates)  
- [Azure Developer CLI galerii](https://azure.github.io/awesome-azd/)  
- [Todo rakendus C# ja Azure SQL-iga](https://github.com/Azure-Samples/todo-csharp-sql)  
- [Todo rakendus Pythoniga ja MongoDB-ga](https://github.com/Azure-Samples/todo-python-mongo)  
- [Todo rakendus Node.js ja PostgreSQL-iga](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [Reacti veebirakendus C# API-ga](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions Java keeles](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Parimad tavad
- [Azure hästi arhitektuuritud raamistik](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Pilve kasutuselevõtu raamistik](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Näidete panustamine

Kas sul on kasulik näide jagada? Ootame panuseid!

### Esitamistingimused
1. Järgi kehtestatud kataloogistruktuuri
2. Lisa põhjalik README.md
3. Lisa kommentaarid konfiguratsioonifailidele
4. Testi hoolikalt enne esitamist
5. Lisa kuluhinnangud ja eeltingimused

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

**Pro näpunäide**: Alusta lihtsaimast näitest, mis vastab sinu tehnoloogiapinu, ja liikudes järk-järgult keerukamate stsenaariumite juurde. Iga näide põhineb eelnevate kontseptsioonidel!

## 🚀 Valmis alustama?

### Sinu õppimise tee

1. **Täielik algaja?** → Alusta [Flaski API-ga](../../../examples/container-app/simple-flask-api) (⭐, 20 minutit)
2. **On AZD põhiteadmised?** → Proovi [Mikroteenuseid](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 minutit)
3. **Loote AI-rakendusi?** → Alusta [Microsoft Foundry mudelite vestlusest](../../../examples/azure-openai-chat) (⭐⭐, 35 minutit) või avasta [Jahutusmüügi mitmeagendi](retail-scenario.md) (⭐⭐⭐⭐, 2+ tundi)
4. **Vajate spetsiifilist tehnoloogiapinu?** → Kasutage ülalolevat jaotist [Õige näite leidmine](#-finding-the-right-example)

### Järgmised sammud

- ✅ Vaata üle ülaltoodud [Eeltingimused](#eeldused)
- ✅ Vali oma oskustasemele vastav näide (vaata [Keerukuse legendi](#keerukuse-skaalatähised))
- ✅ Loe näite README põhjalikult enne kasutuselevõttu
- ✅ Sea meeldetuletus käivitada `azd down` pärast testimist
- ✅ Jaga oma kogemust GitHubi Issues'i või Discussions abil

### Vajate abi?

- 📖 [KKK](../resources/faq.md) - Levinud küsimustele vastused
- 🐛 [Tõrkeotsingu juhend](../docs/chapter-07-troubleshooting/common-issues.md) - Lahenda kasutuselevõtu probleeme
- 💬 [GitHubi arutelud](https://github.com/microsoft/AZD-for-beginners/discussions) - Küsi kogukonnalt
- 📚 [Õppejuhend](../resources/study-guide.md) - Tugevda oma teadmisi

---

**Navigeerimine**
- **📚 Kooli koduleht**: [AZD algajatele](../README.md)
- **📖 Õppematerjalid**: [Õppejuhend](../resources/study-guide.md) | [Petuleht](../resources/cheat-sheet.md) | [Sõnastik](../resources/glossary.md)
- **🔧 Ressursid**: [KKK](../resources/faq.md) | [Tõrkeotsing](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Viimati uuendatud: november 2025 | [Teata probleemidest](https://github.com/microsoft/AZD-for-beginners/issues) | [Panusta näiteid](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->