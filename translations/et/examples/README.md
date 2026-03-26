# Näited - praktilised AZD mallid ja konfiguratsioonid

**Õppimine näidete kaudu - organiseeritud peatükkide kaupa**
- **📚 Kooliavaleht**: [AZD Algajatele](../README.md)
- **📖 Peatükkide kaardistus**: näited organiseeritud õppimise keerukuse järgi
- **🚀 Kohalik näide**: [Jaemüügi mitmeagendi lahendus](retail-scenario.md)
- **🤖 Välised AI näited**: lingid Azure Samples hoidlatele

> **📍 OLULINE: kohalikud vs välised näited**  
> See hoidla sisaldab **4 täielikku kohalikku näidet** koos täielike rakendustega:  
> - **Microsoft Foundry mudelid vestluseks** (gpt-4.1 juurutus vestlusliidesega)  
> - **Konteinerirakendused** (Lihtne Flask API + mikroteenused)  
> - **Andmebaasi rakendus** (Veeb + SQL andmebaas)  
> - **Jaemüügi mitmeagent** (ettevõtte AI lahendus)  
>  
> Täiendavad näited on **välised viited** Azure-Samples hoidlatele, mida saab kloonida.

## Sissejuhatus

See kataloog pakub praktilisi näiteid ja viiteid, mis aitavad sul Azure Developer CLI õppida käed-külge harjutuste kaudu. Jaemüügi mitmeagendi stsenaarium on täielik ja tootmiskõlbulik rakendus, mis on kaasatud sellesse hoidlasse. Täiendavad näited viitavad ametlikele Azure näidetele, mis demonstreerivad erinevaid AZD mustreid.

### Keerukuse hinnang

- ⭐ **Algaja** - Põhimõisted, üksikteenus, 15-30 minutit
- ⭐⭐ **Kesktase** - Mitmed teenused, andmebaasi integreerimine, 30-60 minutit
- ⭐⭐⭐ **Edasijõudnu** - Kompleksne arhitektuur, AI integreerimine, 1-2 tundi
- ⭐⭐⭐⭐ **Ekspert** - Tootmiskõlbulik, ettevõtte mustrid, üle 2 tunni

## 🎯 Mis selles hoidlas tegelikult on

### ✅ Kohalik rakendus (valmis kasutamiseks)

#### [Microsoft Foundry mudelid vestlusrakendus](azure-openai-chat/README.md) 🆕
**Täielik gpt-4.1 juurutus vestlusliidesega selle hoidla sees**

- **Asukoht:** `examples/azure-openai-chat/`
- **Keerukus:** ⭐⭐ (kesktase)
- **Sisaldab:**
  - Täielik Microsoft Foundry mudelite juurutus (gpt-4.1)
  - Pythoni käsurea vestlusliides
  - Key Vault integreerimine API-võtmete turvaliseks halduseks
  - Bicep infrastruktuuri mallid
  - Tokeni kasutuse ja kulude jälgimine
  - Piirangud ja vigade käitlemine

**Kiire algus:**
```bash
# Liigu näidisele
cd examples/azure-openai-chat

# Paiguta kõik
azd up

# Paigalda sõltuvused ja alusta vestlust
pip install -r src/requirements.txt
python src/chat.py
```

**Tehnoloogiad:** Microsoft Foundry mudelid, gpt-4.1, Key Vault, Python, Bicep

#### [Konteinerirakenduse näited](container-app/README.md) 🆕
**Konteinerite juurutamise põhjalikud näited selle hoidla sees**

- **Asukoht:** `examples/container-app/`
- **Keerukus:** ⭐-⭐⭐⭐⭐ (algajast edasijõudnuni)
- **Sisaldab:**
  - [Peamine juhend](container-app/README.md) - täielik ülevaade konteinerite juurutamisest
  - [Lihtne Flask API](../../../examples/container-app/simple-flask-api) - lihtne REST API näide
  - [Mikroteenuste arhitektuur](../../../examples/container-app/microservices) - tootmiskõlbulik mitmete teenustega juurutus
  - Kiire algus, tootmismustrid ja edasijõudnud mustrid
  - Jälgimine, turvalisus ja kulude optimeerimine

**Kiire algus:**
```bash
# Vaata peamist juhendit
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
**Täielik tootmiskõlbulik rakendus selle hoidla sees**

- **Asukoht:** `examples/retail-multiagent-arm-template/`
- **Keerukus:** ⭐⭐⭐⭐ (edasijõudnu)
- **Sisaldab:**
  - Täielik ARM juurutusmall
  - Mitmeagendi arhitektuur (klient + laoseis)
  - Microsoft Foundry mudelid integreeritud
  - AI otsing RAG-ga
  - Täielik jälgimine
  - Ühe nupuvajutusega juurutusskript

**Kiire algus:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Tehnoloogiad:** Microsoft Foundry mudelid, AI otsing, konteinerirakendused, Cosmos DB, Application Insights

---

## 🔗 Välised Azure näited (klooni kasutamiseks)

Järgmised näited on hallatavad ametlikes Azure-Samples hoidlates. Klooni need, et uurida erinevaid AZD mustreid:

### Lihtsad rakendused (peatükid 1-2)

| Mall | Hoidla | Keerukus | Teenused |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Kohalik: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, konteinerirakendused, Application Insights |
| **Mikroteenused** | [Kohalik: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Mitme teenusega, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, konteinerirakendused |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask konteiner** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, konteinerirakendused, API |

**Kasutamisjuhend:**
```bash
# Klooni ükskõik milline näide
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Käivita rakendus
azd up
```

### AI rakenduste näited (peatükid 2, 5, 8)

| Mall | Hoidla | Keerukus | Fookus |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry mudelid vestlus** | [Kohalik: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 juurutus |
| **AI vestlus kiire algus** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | põhiline AI vestlus |
| **AI agendid** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | agendiraamistik |
| **Otsing + OpenAI demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG mustri demonstraator |
| **Contoso vestlus** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | ettevõtte AI |

### Andmebaas ja edasijõudnud mustrid (peatükid 3-8)

| Mall | Hoidla | Keerukus | Fookus |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | andmebaasi integratsioon |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | serverivaba NoSQL |
| **Java mikroteenused** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | mitme teenusega |
| **ML torujuhe** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Õpieesmärgid

Nende näidete töötlemise kaudu:
- Harjutad Azure Developer CLI töövoogusid realistlike rakenduste stsenaariumitega
- Mõistad erinevaid rakenduste arhitektuure ja nende azd rakendusi
- Valdad infrastruktuuri koodi mustrid eri Azure teenuste jaoks
- Rakendad konfiguratsiooni haldust ja keskkonnapõhiseid juurutusstrateegiaid
- Kasutad jälgimise, turvalisuse ja skaleerimise mustreid praktilises kontekstis
- Kogud kogemust tõrkeotsingus ja silumises päris juurutusstsenaariumitel

## Õppimise tulemused

Pärast nende näidete läbimist suudad:
- Juurutada erinevat tüüpi rakendusi Azure Developer CLI abil enesekindlalt
- Kohandada olemasolevaid malle vastavalt oma rakenduse vajadustele
- Kujundada ja rakendada kohandatud infrastruktuuri mustreid Bicepiga
- Konfigureerida keerukaid mitme teenusega rakendusi õigetesse sõltuvustesse
- Rakendada turvalisuse, jälgimise ja jõudluse parimaid tavasid päris olukordades
- Tõrkeotsingus ning juurutuste optimeerimises praktikal põhinevalt kontekteeruda

## Kataloogistruktuur

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

> **💡 Uus AZD kasutaja?** Alusta näitest #1 (Flask API) - see võtab ~20 minutit ja õpetab põhikontseptsioonid.

### Algajatele
1. **[Konteinerirakendus - Python Flask API](../../../examples/container-app/simple-flask-api)** (Kohalik) ⭐  
   Juuruta lihtne REST API koos nullini skaaleerimisega  
   **Aeg:** 20-25 minutit | **Kulu:** $0-5/kuu  
   **Õpid:** põhiline azd töövoog, konteineriseerimine, tervisekontroll  
   **Eeldatav tulemus:** toimiv API ots, mis tagastab "Hello, World!" koos jälgimisega

2. **[Lihtne veebirakendus - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Juuruta Node.js Express veebirakendus koos MongoDB-ga  
   **Aeg:** 25-35 minutit | **Kulu:** $10-30/kuu  
   **Õpid:** andmebaasi integratsioon, keskkonnamuutujad, ühendusstringid  
   **Eeldatav tulemus:** todo list rakendus, mis võimaldab luua/vaadata/muutma/kustutada

3. **[Staatiline veebisait - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Host React staatilist veebisaiti Azure Static Web Apps abil  
   **Aeg:** 20-30 minutit | **Kulu:** $0-10/kuu  
   **Õpid:** staatiline hostimine, serverivabad funktsioonid, CDN juurutamine  
   **Eeldatav tulemus:** React kasutajaliides API tagapoolsega, automaatne SSL, globaalne CDN

### Kesktaseme kasutajatele
4. **[Microsoft Foundry mudelid vestlusrakendus](../../../examples/azure-openai-chat)** (Kohalik) ⭐⭐  
   Juuruta gpt-4.1 vestlusliides ja turvaline API võtme haldus  
   **Aeg:** 35-45 minutit | **Kulu:** $50-200/kuu  
   **Õpid:** Microsoft Foundry mudelite juurutus, Key Vault integreerimine, tokenite jälgimine  
   **Eeldatav tulemus:** toimiv vestlusrakendus gpt-4.1-ga koos kulude jälgimisega

5. **[Konteinerirakendus - mikroteenused](../../../examples/container-app/microservices)** (Kohalik) ⭐⭐⭐⭐  
   Tootmiskõlbulik mitmeteenusega arhitektuur  
   **Aeg:** 45-60 minutit | **Kulu:** $50-150/kuu  
   **Õpid:** teenustevaheline suhtlus, sõnumijadad, hajutatud jälgimine  
   **Eeldatav tulemus:** 2-teenusega süsteem (API Gateway + Toote teenus) koos jälgimisega

6. **[Andmebaasi rakendus - C# koos Azure SQL-iga](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Veebirakendus C# API ja Azure SQL andmebaasiga  
   **Aeg:** 30-45 minutit | **Kulu:** $20-80/kuu  
   **Õpid:** Entity Framework, andmebaasi migratsioonid, ühenduste turve  
   **Eeldatav tulemus:** C# API Azure SQL tagapoolsega, skeemi automaatne juurutus

7. **[Serverivaba funktsioon - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions HTTP päästikute ja Cosmos DB-ga  
   **Aeg:** 30-40 minutit | **Kulu:** $10-40/kuu  
   **Õpid:** sündmuspõhine arhitektuur, serverivaba skaleerimine, NoSQL integreerimine  
   **Eeldatav tulemus:** funktsioonirakendus, mis reageerib HTTP päringutele Cosmos DB salvestusega

8. **[Mikroteenused - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Mitme teenusega Java rakendus konteinerirakenduste ja API Gateway ga  
   **Aeg:** 60-90 minutit | **Kulu:** $80-200/kuu  
   **Õpid:** Spring Boot juurutus, teenusvõrk, koormuse tasakaalustamine  
   **Eeldatav tulemus:** mitme teenusega Java süsteem teenuse avastamise ja marsruutimisega

### Microsoft Foundry mallid

1. **[Microsoft Foundry mudelid vestlusrakendus - kohalik näide](../../../examples/azure-openai-chat)** ⭐⭐  
   Täielik gpt-4.1 juurutus vestlusliidesega  
   **Aeg:** 35-45 minutit | **Kulu:** $50-200/kuu  
   **Eeldatav tulemus:** toimiv vestlusrakendus tokeni jälgimise ja kulude monitooringuga

2. **[Azure Search + OpenAI demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Intelligentsed vestlusrakendused RAG arhitektuuriga  
   **Aeg:** 60-90 minutit | **Kulu:** $100-300/kuu  
   **Eeldatav tulemus:** RAG-käivitatud vestlusliides dokumentide otsingu ja tsitaatidega

3. **[AI Dokumenditöötlus](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Dokumentide analüüs Azure AI teenustega  
   **Aeg:** 40-60 minutit | **Kulu:** $20-80/kuu  
   **Eeldatav tulemus:** API ekstraktib teksti, tabeleid ja üksusi üleslaaditud dokumentidest

4. **[Masinõppe torujuhe](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOpsi töövoog Azure Machine Learninguga  
   **Aeg:** 2-3 tundi | **Kulu:** $150-500/kuu  
   **Eeldatav tulemus:** automatiseeritud ML torujuhe koos treeningu, juurutuse ja jälgimisega

### Reaalsed stsenaariumid

#### **Jaemüügi mitmeagendi lahendus** 🆕
**[Täielik juurutusjuhend](./retail-scenario.md)**

Kõikehõlmav, tootmiskõlbulik mitmeagendi klienditoe lahendus, mis demonstreerib ettevõtte taseme AI rakenduse juurutust AZD-ga. See stsenaarium pakub:
- **Täielik arhitektuur**: Mitmeagendiline süsteem spetsialiseerunud klienditeeninduse ja laohalduse agentidega  
- **Tootmise infrastruktuur**: Mitme piirkonna Microsoft Foundry mudelite juurutused, AI otsing, konteineri rakendused ja ulatuslik jälgimine  
- **Valmis juurutamiseks ARM mall**: Ühe klõpsuga juurutamine mitme konfiguratsioonirežiimiga (Minimaalne/Standardne/Premium)  
- **Täpsemad funktsioonid**: Red teaming turvalisuse valideerimine, agentide hindamisraamistik, kulude optimeerimine ja tõrkeotsingu juhendid  
- **Tegelik äriline kontekst**: Jaemüüja klienditoe kasutusjuht koos failide üleslaadimise, otsingute integratsiooni ja dünaamilise skaleerimisega  

**Tehnoloogiad**: Microsoft Foundry mudelid (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API  

**Kompleksus**: ⭐⭐⭐⭐ (Täiustatud - Ettevõtte tootmiskõlblik)  

**Sobib ideaalselt**: tehisintellekti arendajatele, lahendusarhitektidele ja meeskondadele, kes ehitavad tootmiskõlblikke mitmeagentseid süsteeme  

**Kiire algus**: Juurutage täielik lahendus alla 30 minutiga, kasutades kaasasolevat ARM malli `./deploy.sh -g myResourceGroup` käsuga  

## 📋 Kasutusjuhised  

### Eeltingimused  

Enne näidete käivitamist:  
- ✅ Azure tellimus, millel on Omaniku või Kaasautorite juurdepääs  
- ✅ Paigaldatud Azure Developer CLI ([Paigaldusjuhend](../docs/chapter-01-foundation/installation.md))  
- ✅ Töötav Docker Desktop (konteineriteste jaoks)  
- ✅ Sobivad Azure kvotaadid (kontrollige näidete spetsiifilisi nõudeid)  

> **💰 Kulu hoiatus:** Kõik näited loovad reaalseid Azure ressursse, mis kaasnevad kuludega. Vaadake iga näite README faile kuluhinnangute kohta. Ärge unustage pärast töödlust käivitada `azd down`, et vältida jooksvaid kulusid.  

### Näidete lokaalne käivitamine  

1. **Kloonige või kopeerige näide**  
   ```bash
   # Liigu soovitud näite juurde
   cd examples/simple-web-app
   ```
  
2. **Initsialiseerige AZD keskkond**  
   ```bash
   # Algata olemasoleva malliga
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
  
4. **Juurutage**  
   ```bash
   # Juhi infrastruktuuri ja rakenduse juurutamine
   azd up
   ```
  
5. **Kontrollige juurutust**  
   ```bash
   # Hangi teenuse lõpp-punktid
   azd env get-values
   
   # Testi lõpp-punkti (näide)
   curl https://your-app-url.azurecontainer.io/health
   ```
  
   **Oodatavad õnnestumise näitajad:**  
   - ✅ `azd up` lõpetab veatult  
   - ✅ Teenuse lõpp-punkt tagastab HTTP 200  
   - ✅ Azure portaal kuvab olekut "Jooksmas"  
   - ✅ Application Insights vastu võtab telemeetriaid  

> **⚠️ Probleeme?** Vaadake [Levinud probleemid](../docs/chapter-07-troubleshooting/common-issues.md) juurutamise tõrkeotsingu jaoks  

### Näidete kohandamine  

Iga näide sisaldab:  
- **README.md** - üksikasjalikud seadistus- ja kohandamisjuhised  
- **azure.yaml** - AZD konfiguratsioon kommentaaridega  
- **infra/** - Bicep mallid parameetrite seletustega  
- **src/** - näidiskoodi rakendus  
- **scripts/** - abiskriptid sagedaste ülesannete jaoks  

## 🎯 Õpieesmärgid  

### Näiteliigid  

#### **Põhilised juurutused**  
- Üksikteenuste rakendused  
- Lihtsad infrastruktuurimustrid  
- Põhiseadistushaldus  
- Kuluefektiivsed arenduseadistused  

#### **Täpsemad stsenaariumid**  
- Mitme teenusega arhitektuurid  
- Keerukad võrgukonfiguratsioonid  
- Andmebaasi integreerimise mustrid  
- Turvalisuse ja vastavuse rakendused  

#### **Tootmiskõlblikud mustrid**  
- Kõrge kättesaadavusega konfiguratsioonid  
- Jälgimine ja jälgitavus  
- CI/CD integreerimine  
- Katastroofi taastumise seadistused  

## 📖 Näidete kirjeldused  

### Lihtne veebirakendus - Node.js Express  
**Tehnoloogiad**: Node.js, Express, MongoDB, Container Apps  
**Kompleksus**: Algaja  
**Kontseptsioonid**: lihtne juurutus, REST API, NoSQL andmebaasi integreerimine  

### Staatiline veebisait - React SPA  
**Tehnoloogiad**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Kompleksus**: Algaja  
**Kontseptsioonid**: staatiline majutamine, serveritu backend, kaasaegne veebiarendus  

### Konteineri rakendus - Python Flask  
**Tehnoloogiad**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Kompleksus**: Algaja  
**Kontseptsioonid**: konteinerdamine, REST API, skaleerimine nullini, tervisekontrollid, jälgimine  
**Asukoht**: [Lokaalne näide](../../../examples/container-app/simple-flask-api)  

### Konteineri rakendus - mikroteenuste arhitektuur  
**Tehnoloogiad**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Kompleksus**: Täiustatud  
**Kontseptsioonid**: mitme teenuse arhitektuur, teenuste omavaheline suhtlus, sõnumite järjekord, hajutatud jälgimine  
**Asukoht**: [Lokaalne näide](../../../examples/container-app/microservices)  

### Andmebaasi rakendus - C# Azure SQL-iga  
**Tehnoloogiad**: C# ASP.NET Core, Azure SQL Database, App Service  
**Kompleksus**: Kesktase  
**Kontseptsioonid**: Entity Framework, andmebaasiühendused, veebirakenduse API arendus  

### Serveritu funktsioon - Python Azure Functions  
**Tehnoloogiad**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Kompleksus**: Kesktase  
**Kontseptsioonid**: sündmuspõhine arhitektuur, serveritu arvutus, täispinu arendus  

### Mikroteenused - Java Spring Boot  
**Tehnoloogiad**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Kompleksus**: Kesktase  
**Kontseptsioonid**: mikroteenuste suhtlus, hajutatud süsteemid, ettevõtte mustrid  

### Microsoft Foundry näited  

#### Microsoft Foundry mudelite juturobot  
**Tehnoloogiad**: Microsoft Foundry mudelid, Cognitive Search, App Service  
**Kompleksus**: Kesktase  
**Kontseptsioonid**: RAG arhitektuur, vektoriotsing, suurte keelemudelite integreerimine  

#### AI dokumentide töötlemine  
**Tehnoloogiad**: Azure AI Document Intelligence, Storage, Functions  
**Kompleksus**: Kesktase  
**Kontseptsioonid**: dokumentide analüüs, OCR, andmeekstraktsioon  

#### Masinõppe töövoog  
**Tehnoloogiad**: Azure ML, MLOps, Container Registry  
**Kompleksus**: Täiustatud  
**Kontseptsioonid**: mudelite koolitus, juurutamise torud, jälgimine  

## 🛠 Konfiguratsiooni näited  

Kaust `configurations/` sisaldab taaskasutatavaid komponente:  

### Keskkonna konfiguratsioonid  
- Arenduskeskkonna seaded  
- Testkeskkonna konfiguratsioonid  
- Tootmiskõlblikud seadistused  
- Mitme piirkonna juurutussed  

### Bicep moodulid  
- Taaskasutatavad infrastruktuuri komponendid  
- Üldised ressursimustrid  
- Turvalisuse tugevdatud mallid  
- Kuluefektiivsed konfiguratsioonid  

### Abiskriptid  
- Keskkonna seadistamise automatiseerimine  
- Andmebaasi migratsiooniskriptid  
- Juurutuse valideerimise tööriistad  
- Kulude jälgimise utiliidid  

## 🔧 Kohandamisjuhend  

### Näidete kohandamine vastavalt kasutusjuhtumile  

1. **Eeltingimuste ülevaatus**  
   - Kontrolli Azure teenuste nõudeid  
   - Kinnita tellimuse piirangud  
   - Mõista kulude mõjusid  

2. **Konfiguratsiooni muutmine**  
   - Uuenda `azure.yaml` teenusedefinitsioone  
   - Kohanda Bicep malle  
   - Muuda keskkonnamuutujaid  

3. **Testi põhjalikult**  
   - Juuruta esmalt arenduskeskkonda  
   - Kinnita funktsionaalsus  
   - Testi skaleerimist ja jõudlust  

4. **Turvalisuse ülevaatus**  
   - Vaata juurdepääsukontrolli üle  
   - Rakenda saladuste haldus  
   - Lülita sisse jälgimine ja hoiatused  

## 📊 Võrdlustabel  

| Näide                     | Teenused | Andmebaas | Autentimine | Jälgimine | Kompleksus  |  
|---------------------------|----------|-----------|-------------|-----------|-------------|  
| **Microsoft Foundry Chat** (lokal) | 2        | ❌         | Key Vault   | Täielik   | ⭐⭐          |  
| **Python Flask API** (lokal)         | 1        | ❌         | Põhiline    | Täielik   | ⭐           |  
| **Mikroteenused** (lokal)            | 5+       | ✅         | Ettevõtte   | Täiustatud| ⭐⭐⭐⭐        |  
| Node.js Express Todo                 | 2        | ✅         | Põhiline    | Põhiline  | ⭐           |  
| React SPA + Functions                | 3        | ✅         | Põhiline    | Täielik   | ⭐           |  
| Python Flask Container               | 2        | ❌         | Põhiline    | Täielik   | ⭐           |  
| C# Web API + SQL                    | 2        | ✅         | Täielik    | Täielik   | ⭐⭐          |  
| Python Functions + SPA              | 3        | ✅         | Täielik    | Täielik   | ⭐⭐          |  
| Java Mikroteenused                  | 5+       | ✅         | Täielik    | Täielik   | ⭐⭐          |  
| Microsoft Foundry Chat              | 3        | ✅         | Täielik    | Täielik   | ⭐⭐⭐         |  
| AI dokumentide töötlemine           | 2        | ❌         | Põhiline   | Täielik   | ⭐⭐          |  
| ML töövoog                        | 4+       | ✅         | Täielik    | Täielik   | ⭐⭐⭐⭐        |  
| **Jaemüügi mitmeagendiline** (lokal) | **8+**  | **✅**     | **Ettevõtte** | **Täiustatud** | **⭐⭐⭐⭐** |  

## 🎓 Õppeteekond  

### Soovitatav järjepidevus  

1. **Alusta lihtsast veebirakendusest**  
   - Õpi AZD põhimõisteid  
   - Saa aru juurutusprotsessist  
   - Harjuta keskkonna haldust  

2. **Proovi staatilist veebisaiti**  
   - Uuri erinevaid majutamise võimalusi  
   - Õpi CDN integratsiooni  
   - Saa aru DNS-seadistusest  

3. **Liigu konteineri rakenduse suunas**  
   - Õpi konteinerdamise aluseid  
   - Saa aru skaleerimise kontseptsioonidest  
   - Harjuta Dockeriga  

4. **Lisa andmebaasi integratsioon**  
   - Õpi andmebaasi loomist  
   - Saa aru ühendusstringidest  
   - Harjuta saladuste haldust  

5. **Avasta serveritu arhitektuur**  
   - Saa aru sündmuspõhisest arhitektuurist  
   - Õpi päästikute ja sidemete kohta  
   - Harjuta API-dega  

6. **Ehita mikroteenuseid**  
   - Õpi teenustevahelist suhtlust  
   - Saa aru hajutatud süsteemidest  
   - Harjuta keerukaid juurutusi  

## 🔍 Õige näite leidmine  

### Tehnoloogiapinu järgi  
- **Container Apps**: [Python Flask API (lokal)](../../../examples/container-app/simple-flask-api), [Mikroteenused (lokal)](../../../examples/container-app/microservices), Java Mikroteenused  
- **Node.js**: Node.js Express Todo App, [Mikroteenuste API Gateway (lokal)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (lokal)](../../../examples/container-app/simple-flask-api), [Mikroteenuste toote teenus (lokal)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [Mikroteenuste tellimuste teenus (lokal)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry mudelite juturobot, ML töövoog  
- **Go**: [Mikroteenuste kasutajate teenus (lokal)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot mikroteenused  
- **React**: React SPA + Functions  
- **Konteinerid**: [Python Flask (lokal)](../../../examples/container-app/simple-flask-api), [Mikroteenused (lokal)](../../../examples/container-app/microservices), Java Mikroteenused  
- **Andmebaasid**: [Mikroteenused (lokal)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **AI/ML**: **[Microsoft Foundry mudelite juturobot (lokal)](../../../examples/azure-openai-chat)**, Microsoft Foundry mudelite juturobot, AI dokumentide töötlemine, ML töövoog, **Jaemüügi mitmeagendiline lahendus**  
- **Mitmeagentse süsteemid**: **Jaemüügi mitmeagendiline lahendus**  
- **OpenAI integratsioon**: **[Microsoft Foundry mudelite juturobot (lokal)](../../../examples/azure-openai-chat)**, Jaemüügi mitmeagendiline lahendus  
- **Ettevõtte tootmiskõlblik**: [Mikroteenused (lokal)](../../../examples/container-app/microservices), **Jaemüügi mitmeagendiline lahendus**  

### Arhitektuurimustri järgi  
- **Lihtne REST API**: [Python Flask API (lokal)](../../../examples/container-app/simple-flask-api)  
- **Monoliitne**: Node.js Express Todo, C# Web API + SQL  
- **Staatiline + serveritu**: React SPA + Functions, Python Functions + SPA  
- **Mikroteenused**: [Tootmise mikroteenused (lokal)](../../../examples/container-app/microservices), Java Spring Boot mikroteenused  
- **Konteineriseeritud**: [Python Flask (lokal)](../../../examples/container-app/simple-flask-api), [Mikroteenused (lokal)](../../../examples/container-app/microservices)  
- **AI-põhine**: **[Microsoft Foundry mudelite juturobot (lokal)](../../../examples/azure-openai-chat)**, Microsoft Foundry mudelite juturobot, AI dokumentide töötlemine, ML töövoog, **Jaemüügi mitmeagendiline lahendus**  
- **Mitmeagentne arhitektuur**: **Jaemüügi mitmeagendiline lahendus**  
- **Ettevõtte mitmete teenustega**: [Mikroteenused (lokal)](../../../examples/container-app/microservices), **Jaemüügi mitmeagendiline lahendus**  

### Kompleksusastme järgi  
- **Algaja**: [Python Flask API (lokal)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **Kesktase**: **[Microsoft Foundry mudelite juturobot (lokal)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Mikroteenused, Microsoft Foundry mudelite juturobot, AI dokumentide töötlemine  
- **Täiustatud**: ML töövoog  
- **Ettevõtte tootmiskõlblik**: [Mikroteenused (lokal)](../../../examples/container-app/microservices) (mitmete teenustega ja sõnumite järjepidevusega), **Jaemüügi mitmeagendiline lahendus** (täielik mitmeagentne süsteem ARM malli juurutusega)  

## 📚 Täiendavad allikad  

### Dokumentatsiooni lingid  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Microsoft Foundry AZD mallid](https://github.com/Azure/ai-foundry-templates)  
- [Bicep dokumentatsioon](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure arhitektuurikeskus](https://learn.microsoft.com/en-us/azure/architecture/)  

### Kogukonna näited  
- [Azure näidised AZD mallid](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry mallid](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI galerii](https://azure.github.io/awesome-azd/)
- [Todo rakendus C# ja Azure SQL-iga](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo rakendus Python ja MongoDB-ga](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo rakendus Node.js ja PostgreSQL-iga](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React veebiapp C# API-ga](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure konteinerirakenduste töö](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions Java-ga](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Parimad tavad
- [Azure hästi arhitektuuri raamistik](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Pilve kasutuselevõtu raamistik](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Näidiste panus

Kas sul on kasulik näide jagamiseks? Tunnustame panuseid!

### Esitamise juhised
1. Järgi kehtestatud kaustastruktuuri
2. Sisalda põhjalik README.md
3. Lisa kommentaarid konfiguratsioonifailidesse
4. Testi hoolikalt enne esitamist
5. Lisa kuluennustused ja eeltingimused

### Näidismalli struktuur
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

**Pro-nipp**: Alusta lihtsaimast näitest, mis sobib sinu tehnoloogiapuhvri jaoks, seejärel tööta järk-järgult keerukamate stsenaariumite suunas. Iga näide ehitab eelmiste kontseptsioonidele!

## 🚀 Valmis alustama?

### Sinu õppeteekond

1. **Täiesti algaja?** → Alusta [Flask API-ga](../../../examples/container-app/simple-flask-api) (⭐, 20 minutit)
2. **On põhiteadmised AZD-st?** → Proovi [Mikroteenuseid](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 minutit)
3. **AI-rakenduste loomine?** → Alusta [Microsoft Foundry mudelite vestlusest](../../../examples/azure-openai-chat) (⭐⭐, 35 minutit) või uurige [Jaemüügimultiagenti](retail-scenario.md) (⭐⭐⭐⭐, 2+ tundi)
4. **Vajate kindlat tehnoloogiauuringut?** → Kasuta ülalpool olevat jaotist [Õige näite leidmine](../../../examples)

### Järgmised sammud

- ✅ Vaata üle ülalpool [Eeltingimused](../../../examples)
- ✅ Vali oma oskustele vastav näide (vaata [Keerukuse legendi](../../../examples))
- ✅ Loe näite README põhjalikult enne juurutamist
- ✅ Pane meeldetuletus käivitada `azd down` pärast testimist
- ✅ Jaga oma kogemust GitHubi probleemide või arutelude kaudu

### Abi vaja?

- 📖 [KKK](../resources/faq.md) - Vastused korduma kippuvatele küsimustele
- 🐛 [Veaotsingu juhend](../docs/chapter-07-troubleshooting/common-issues.md) - Lahenda juurutusprobleeme
- 💬 [GitHubi arutelud](https://github.com/microsoft/AZD-for-beginners/discussions) - Küsi kogukonnalt
- 📚 [Õppejuhend](../resources/study-guide.md) - Oma õppimise kinnistamine

---

**Navigeerimine**
- **📚 Kursuse avaleht**: [AZD algajatele](../README.md)
- **📖 Õppematerjalid**: [Õppejuhend](../resources/study-guide.md) | [Vihik](../resources/cheat-sheet.md) | [Sõnastik](../resources/glossary.md)
- **🔧 Ressursid**: [KKK](../resources/faq.md) | [Veaotsing](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Viimati uuendatud: november 2025 | [Teata probleemidest](https://github.com/microsoft/AZD-for-beginners/issues) | [Panusta näidetega](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:  
See dokument on tõlgitud kasutades tehisintellekti tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüame täpsust tagada, palun arvestage, et automatiseeritud tõlked võivad sisaldada vigu või ebatäpsusi. Algne dokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise info puhul soovitatakse professionaalset inimtõlget. Me ei vastuta käesoleva tõlke kasutamisest tingitud arusaamatuste ega valesti mõistmiste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->