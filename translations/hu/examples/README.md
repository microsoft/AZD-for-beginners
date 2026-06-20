# Példák - Gyakorlati AZD Sablonok és Konfigurációk

**Tanulj példákon keresztül - fejezetek szerint rendezve**  
- **📚 Kurzus kezdőoldal**: [AZD kezdőknek](../README.md)  
- **📖 Fejezet térkép**: Példák tanulási nehézség szerint rendezve  
- **🚀 Helyi példa**: [Kiskereskedelmi Többügynökös Megoldás](retail-scenario.md)  
- **🤖 Külső AI példák**: Linkek az Azure Samples tárolókhoz  

> **📍 FONTOS: Helyi vs Külső példák**  
> Ez a tároló **4 teljes helyi példát** tartalmaz teljes megvalósítással:  
> - **Microsoft Foundry Models Chat** (gpt-4.1 telepítés csevegőfelülettel)  
> - **Konténer Alkalmazások** (Egyszerű Flask API + Mikroszolgáltatások)  
> - **Adatbázis Alkalmazás** (Web + SQL Adatbázis)  
> - **Kiskereskedelmi Többügynök** (Vállalati AI megoldás)  
>  
> Egyéb példák **külső hivatkozások** az Azure Samples tárolókra, amelyeket klónozhatsz.

## Bevezetés

Ez a könyvtár gyakorlati példákat és hivatkozásokat nyújt, hogy az Azure Developer CLI-t kézzelfogható gyakorlatokon keresztül sajátíthasd el. A Kiskereskedelmi Többügynökös forgatókönyv teljes, éles használatra kész megvalósítást tartalmaz ebben a tárolóban. Egyéb példák hivatalos Azure Samples tárolókra hivatkoznak, amelyek különféle AZD mintákat mutatnak be.

### Nehézségi szint magyarázat

- ⭐ **Kezdő** - Alapfogalmak, egy szolgáltatás, 15-30 perc  
- ⭐⭐ **Középhaladó** - Több szolgáltatás, adatbázis integráció, 30-60 perc  
- ⭐⭐⭐ **Haladó** - Komplex architektúra, AI integráció, 1-2 óra  
- ⭐⭐⭐⭐ **Szakértő** - Éles környezet, vállalati minták, 2+ óra  

## 🎯 Mi van valójában ebben a tárolóban

### ✅ Helyi megvalósítás (azonnal használható)

#### [Microsoft Foundry Models Chat Alkalmazás](azure-openai-chat/README.md) 🆕  
**Teljes gpt-4.1 telepítés csevegőfelülettel, ebben a tárolóban**

- **Hely:** `examples/azure-openai-chat/`  
- **Nehézség:** ⭐⭐ (Középhaladó)  
- **Tartalmazza:**
  - Teljes Microsoft Foundry Models telepítés (gpt-4.1)  
  - Python parancssori csevegőfelület  
  - Key Vault integráció az API kulcsok biztonságához  
  - Bicep infrastruktúra sablonok  
  - Token használat és költségkövetés  
  - Korlátozás és hiba kezelése  

**Gyors indulás:**  
```bash
# Navigálás a példához
cd examples/azure-openai-chat

# Minden telepítése
azd up

# Függőségek telepítése és csevegés indítása
pip install -r src/requirements.txt
python src/chat.py
```
  
**Technológiák:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Konténer Alkalmazás Példák](container-app/README.md) 🆕  
**Átfogó konténer telepítési példák ebben a tárolóban**

- **Hely:** `examples/container-app/`  
- **Nehézség:** ⭐-⭐⭐⭐⭐ (Kezdő – Haladó)  
- **Tartalmazza:**
  - [Fő útmutató](container-app/README.md) - Konténer telepítések teljes áttekintése  
  - [Egyszerű Flask API](../../../examples/container-app/simple-flask-api) - Alap REST API példa  
  - [Mikroszolgáltatások Architektúra](../../../examples/container-app/microservices) - Éles multi-szolgáltatásos telepítés  
  - Gyors indulás, Éles és Haladó minták  
  - Monitorozás, biztonság, költségoptimalizáció  

**Gyors indulás:**  
```bash
# Nézze meg a fő útmutatót
cd examples/container-app

# Egyszerű Flask API telepítése
cd simple-flask-api
azd up

# Mikro-szolgáltatások példa telepítése
cd ../microservices
azd up
```
  
**Technológiák:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Kiskereskedelmi Többügynök Megoldás](retail-scenario.md) 🆕  
**Teljes, éles használatra kész megvalósítás ebben a tárolóban**

- **Hely:** `examples/retail-multiagent-arm-template/`  
- **Nehézség:** ⭐⭐⭐⭐ (Haladó)  
- **Tartalmazza:**
  - Teljes ARM telepítési sablon  
  - Többügynök architektúra (Ügyfél + Készlet)  
  - Microsoft Foundry Models integráció  
  - AI keresés RAG felépítéssel  
  - Átfogó monitorozás  
  - Egykattintásos telepítő script  

**Gyors indulás:**  
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```
  
**Technológiák:** Microsoft Foundry Models, AI Keresés, Konténer Alkalmazások, Cosmos DB, Application Insights

---

## 🔗 Külső Azure Samples (Klonozásra)

Az alábbi példák az Azure-Samples hivatalos tárolóiban vannak fenntartva. Klónozd őket az egyes AZD minták felfedezéséhez:

### Egyszerű alkalmazások (1-2. fejezet)

| Sablon | Tároló | Nehézség | Szolgáltatások |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Helyi: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Konténer Alkalmazások, Application Insights |
| **Mikroszolgáltatások** | [Helyi: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Több szolgáltatás, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Konténer Alkalmazások |
| **React + Funkciók** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Funkciók, SQL |
| **Python Flask Konténer** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Konténer Alkalmazások, API |

**Használat módja:**  
```bash
# Klónozzon bármilyen példát
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Telepítés
azd up
```


### AI Alkalmazás Példák (2., 5., 8. fejezet)

| Sablon | Tároló | Nehézség | Fókusz |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [Helyi: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 telepítés |
| **AI Chat Gyorsindítás** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Alap AI chat |
| **AI Ügynökök** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Ügynök keretrendszer |
| **Keresés + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG minta |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Vállalati AI |

### Adatbázis & Haladó minták (3-8. fejezet)

| Sablon | Tároló | Nehézség | Fókusz |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Adatbázis integráció |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL szerver nélküli |
| **Java Mikroszolgáltatások** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Több szolgáltatás |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Tanulási célok

Ezekkel a példákkal elvégezve:  
- Gyakorlatot szerzel az Azure Developer CLI munkafolyamatokban valós alkalmazási forgatókönyveken keresztül  
- Megérted a különböző alkalmazás architektúrákat és az azokat megvalósító azd mintákat  
- Mesterien alkalmazod az infrastruktúra kódmintákat különféle Azure szolgáltatásokhoz  
- Alkalmazod a konfiguráció kezelés és környezet specifikus telepítési stratégiákat  
- Megvalósítod a monitorozás, biztonság és skálázás mintáit gyakorlati helyzetekben  
- Tapasztalatot szerzel hibakeresés és üzemeltetési problémák megoldásában éles telepítésekben  

## Tanulási eredmények

A példák elvégzése után képes leszel:  
- Magabiztosan telepíteni különféle alkalmazásokat az Azure Developer CLI segítségével  
- A mellékelt sablonokat adaptálni a saját alkalmazás igényeidhez  
- Egyedi infrastruktúra mintákat tervezni és megvalósítani Bicep segítségével  
- Összetett több szolgáltatásos alkalmazásokat konfigurálni helyes függőségekkel  
- Biztonsági, monitorozási és teljesítménybeli bevált gyakorlatokat alkalmazni valós környezetekben  
- Hibákat elhárítani és telepítéseket optimalizálni a gyakorlati tapasztalat alapján  

## Könyvtárszerkezet

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


## Gyors kezdő példák

> **💡 Új vagy az AZD-ben?** Kezdd az 1-es példával (Flask API) - kb. 20 perc, és megtanítja az alapfogalmakat.

### Kezdőknek

1. **[Konténer Alkalmazás - Python Flask API](../../../examples/container-app/simple-flask-api)** (helyi) ⭐  
   Egyszerű REST API telepítése scale-to-zero lehetőséggel  
   **Idő:** 20-25 perc | **Költség:** $0-5/hónap  
   **Megtanulod:** Alap azd munkafolyamat, konténerizáció, egészség ellenőrzés  
   **Várt eredmény:** Működő API végpont, amely „Hello, World!” választ ad monitorozással  

2. **[Egyszerű Webalkalmazás - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Node.js Express webalkalmazás telepítése MongoDB-vel  
   **Idő:** 25-35 perc | **Költség:** $10-30/hónap  
   **Megtanulod:** Adatbázis integráció, környezeti változók, kapcsolati láncok  
   **Várt eredmény:** Todo lista alkalmazás létrehozás/olvasás/frissítés/törlés funkcióval  

3. **[Statikus Weboldal - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   React statikus weboldal hosztolása Azure Static Web Apps segítségével  
   **Idő:** 20-30 perc | **Költség:** $0-10/hónap  
   **Megtanulod:** Statikus hosztolás, serverless funkciók, CDN telepítés  
   **Várt eredmény:** React felület API háttérrel, automatikus SSL, globális CDN  

### Középhaladóknak

4. **[Microsoft Foundry Models Chat Alkalmazás](../../../examples/azure-openai-chat)** (helyi) ⭐⭐  
   gpt-4.1 telepítése csevegőfelülettel és biztonságos API kulcs kezeléssel  
   **Idő:** 35-45 perc | **Költség:** $50-200/hónap  
   **Megtanulod:** Microsoft Foundry Models telepítés, Key Vault integráció, token követés  
   **Várt eredmény:** Működő chat alkalmazás gpt-4.1-gyel és költségkövetéssel  

5. **[Konténer Alkalmazás - Mikroszolgáltatások](../../../examples/container-app/microservices)** (helyi) ⭐⭐⭐⭐  
   Éles, több szolgáltatásos architektúra  
   **Idő:** 45-60 perc | **Költség:** $50-150/hónap  
   **Megtanulod:** Szolgáltatások közti kommunikáció, üzenetsor, elosztott nyomkövetés  
   **Várt eredmény:** 2-szolgáltatásos rendszer (API Gateway + Termék Szolgáltatás) monitorozással  

6. **[Adatbázis Alkalmazás - C# Azure SQL-lel](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Webalkalmazás C# API-val és Azure SQL adatbázissal  
   **Idő:** 30-45 perc | **Költség:** $20-80/hónap  
   **Megtanulod:** Entity Framework, adatbázis migrációk, kapcsolati biztonság  
   **Várt eredmény:** C# API Azure SQL háttérrel, automatikus sématelepítés  

7. **[Serverless Funkció - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions HTTP triggerrel és Cosmos DB-vel  
   **Idő:** 30-40 perc | **Költség:** $10-40/hónap  
   **Megtanulod:** Eseményvezérelt architektúra, szerver nélküli skálázás, NoSQL integráció  
   **Várt eredmény:** Funkció alkalmazás HTTP kérésekre válaszolva, Cosmos DB tárolással  

8. **[Mikroszolgáltatások - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Több szolgáltatásos Java alkalmazás Konténer Alkalmazásokkal és API Gateway-jel  
   **Idő:** 60-90 perc | **Költség:** $80-200/hónap  
   **Megtanulod:** Spring Boot telepítés, szolgáltatás háló, terheléselosztás  
   **Várt eredmény:** Több szolgáltatásos Java rendszer szolgáltatás felfedezéssel és útválasztással  

### Microsoft Foundry Sablonok

1. **[Microsoft Foundry Models Chat App - Helyi példa](../../../examples/azure-openai-chat)** ⭐⭐  
   Teljes gpt-4.1 telepítés csevegőfelülettel  
   **Idő:** 35-45 perc | **Költség:** $50-200/hónap  
   **Várt eredmény:** Működő chat alkalmazás token követéssel és költségfigyeléssel  

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Intelligens chat alkalmazás RAG architektúrával  
   **Idő:** 60-90 perc | **Költség:** $100-300/hónap  
   **Várt eredmény:** RAG-alapú chat felület dokumentumkereséssel és hivatkozásokkal  

3. **[AI Dokumentum Feldolgozás](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Dokumentum elemzés Azure AI szolgáltatásokkal  
   **Idő:** 40-60 perc | **Költség:** $20-80/hónap  
   **Várt eredmény:** API szöveg, táblázatok és entitások kinyerésével feltöltött dokumentumokból  

4. **[Gépi Tanulás Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps munkafolyamat Azure Machine Learninggel  
   **Idő:** 2-3 óra | **Költség:** $150-500/hónap  
   **Várt eredmény:** Automatizált ML pipeline tréninggel, telepítéssel és monitorozással  

### Valós Világi Forgatókönyvek

#### **Kiskereskedelmi Többügynök Megoldás** 🆕  
**[Teljes Megvalósítási Útmutató](./retail-scenario.md)**

Átfogó, éles használatra kész többügynökös ügyféltámogató megoldás, amely vállalati szintű AI alkalmazás telepítést mutat be AZD-vel. Ez a forgatókönyv tartalmazza:

- **Teljes Architektúra**: Többügynökös rendszer specializált ügyfélszolgálati és készletkezelő ügynökökkel  
- **Éles környezet infrastruktúra**: Több régióra kiterjedő Microsoft Foundry Models telepítések, AI keresés, Container Apps és átfogó monitorozás  
- **Kész ARM sablon telepítéshez**: Egy kattintásos telepítés több konfigurációs móddal (Minimal/Standard/Premium)  
- **Fejlett funkciók**: Red teaming biztonsági validáció, ügynök értékelő keretrendszer, költségoptimalizálás és hibakeresési útmutatók  
- **Valódi üzleti környezet**: Kiskereskedelmi ügyféltámogatási példa fájlfeltöltéssel, keresés integrációval és dinamikus skálázással  

**Technológiák**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Bonyolultság**: ⭐⭐⭐⭐ (Fejlett – Vállalati éles üzemre kész)

**Ideális**: AI fejlesztőknek, megoldásarchitektúráknak és csapatoknak, akik több ügynökös éles rendszereket építenek

**Gyors indulás**: Telepítse a teljes megoldást 30 percen belül a mellékelt ARM sablonnal a `./deploy.sh -g myResourceGroup` parancs használatával

## 📋 Használati utasítások

### Előfeltételek

Mielőtt bármelyik példát futtatná:  
- ✅ Azure előfizetés tulajdonosi vagy közreműködői jogosultsággal  
- ✅ Azure Developer CLI telepítve ([Telepítési útmutató](../docs/chapter-01-foundation/installation.md))  
- ✅ Docker Desktop fut (konténeres példákhoz)  
- ✅ Megfelelő Azure kvóták (ellenőrizze az adott példa specifikus követelményeit)

> **💰 Költségfigyelmeztetés:** Minden példa valódi Azure erőforrásokat hoz létre, amelyek költséget vonnak maga után. A pontos költségbecsléseket az egyes README fájlok tartalmazzák. Ne felejtse el a használat után futtatni az `azd down` parancsot a folyamatos költségek elkerülése érdekében.

### Példák helyi futtatása

1. **Példa klónozása vagy másolása**  
   ```bash
   # Navigálás a kívánt példához
   cd examples/simple-web-app
   ```
  
2. **AZD környezet inicializálása**  
   ```bash
   # Inicializálás meglévő sablonnal
   azd init
   
   # Vagy új környezet létrehozása
   azd env new my-environment
   ```
  
3. **Környezet konfigurálása**  
   ```bash
   # Állítsa be a szükséges változókat
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```
  
4. **Telepítés**  
   ```bash
   # Infrastruktúra és alkalmazás telepítése
   azd up
   ```
  
5. **Telepítés ellenőrzése**  
   ```bash
   # Szolgáltatási végpontok lekérése
   azd env get-values
   
   # Végpont tesztelése (példa)
   curl https://your-app-url.azurecontainer.io/health
   ```
  
   **Várt siker jelek:**  
   - ✅ `azd up` hiba nélkül lefut  
   - ✅ A szolgáltatás végpont HTTP 200-as választ ad  
   - ✅ Az Azure Portal "Futó" állapotot mutat  
   - ✅ Az Application Insights fogad telemetriát

> **⚠️ Probléma?** Nézze meg a [Gyakori problémákat](../docs/chapter-07-troubleshooting/common-issues.md) a telepítési hibák elhárításához

### Példák testreszabása

Minden példa tartalmazza:  
- **README.md** – Részletes beállítási és testreszabási útmutató  
- **azure.yaml** – AZD konfiguráció megjegyzésekkel  
- **infra/** – Bicep sablonok paramétermagyarázatokkal  
- **src/** – Példaalkalmazás kódja  
- **scripts/** – Segédeszközök gyakori feladatokhoz

## 🎯 Tanulási célok

### Példa kategóriák

#### **Alap telepítések**  
- Egy szolgáltatásos alkalmazások  
- Egyszerű infrastruktúra minták  
- Alap konfigurációkezelés  
- Költséghatékony fejlesztési környezetek

#### **Fejlett forgatókönyvek**  
- Több szolgáltatásos architektúrák  
- Összetett hálózati konfigurációk  
- Adatbázis integrációs minták  
- Biztonsági és megfelelőségi megvalósítások

#### **Éles környezetre kész minták**  
- Magas rendelkezésre állás konfigurációk  
- Monitorozás és megfigyelhetőség  
- CI/CD integráció  
- Katasztrófa helyreállítási kialakítások

## 📖 Példa leírások

### Egyszerű webalkalmazás – Node.js Express  
**Technológiák**: Node.js, Express, MongoDB, Container Apps  
**Bonyolultság**: Kezdő  
**Fogalmak**: Alap telepítés, REST API, NoSQL adatbázis integráció

### Statikus weboldal – React SPA  
**Technológiák**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Bonyolultság**: Kezdő  
**Fogalmak**: Statikus hosztolás, szerver nélküli backend, modern webfejlesztés

### Container App – Python Flask  
**Technológiák**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Bonyolultság**: Kezdő  
**Fogalmak**: Konténerizáció, REST API, scale-to-zero, egészségellenőrzések, monitorozás  
**Hely**: [Helyi példa](../../../examples/container-app/simple-flask-api)

### Container App – Mikroszolgáltatások architektúrája  
**Technológiák**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Bonyolultság**: Fejlett  
**Fogalmak**: Több szolgáltatásos architektúra, szolgáltatás kommunikáció, üzenetsor, elosztott követés  
**Hely**: [Helyi példa](../../../examples/container-app/microservices)

### Adatbázis alkalmazás – C# Azure SQL-vel  
**Technológiák**: C# ASP.NET Core, Azure SQL Database, App Service  
**Bonyolultság**: Középhaladó  
**Fogalmak**: Entity Framework, adatbázis kapcsolatok, web API fejlesztés

### Serverless Function – Python Azure Functions  
**Technológiák**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Bonyolultság**: Középhaladó  
**Fogalmak**: Eseményvezérelt architektúra, szerver nélküli számítás, teljes stack fejlesztés

### Mikroszolgáltatások – Java Spring Boot  
**Technológiák**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Bonyolultság**: Középhaladó  
**Fogalmak**: Mikroszolgáltatások közötti kommunikáció, elosztott rendszerek, vállalati minták

### Microsoft Foundry példák

#### Microsoft Foundry Models chat alkalmazás  
**Technológiák**: Microsoft Foundry Models, Azure AI Search, App Service  
**Bonyolultság**: Középhaladó  
**Fogalmak**: RAG architektúra, vektoros keresés, LLM integráció

#### AI dokumentum feldolgozás  
**Technológiák**: Azure AI Document Intelligence, Storage, Functions  
**Bonyolultság**: Középhaladó  
**Fogalmak**: Dokumentum elemzés, OCR, adatkinyerés

#### Gépi tanulási pipeline  
**Technológiák**: Azure ML, MLOps, Container Registry  
**Bonyolultság**: Fejlett  
**Fogalmak**: Modellképzés, telepítési folyamatok, monitorozás

## 🛠 Konfigurációs példák

A `configurations/` könyvtár újrahasználható komponenseket tartalmaz:

### Környezeti konfigurációk  
- Fejlesztői környezet beállításai  
- Teszt/környezet konfigurációk  
- Éles környezetre kész konfigurációk  
- Több régióra kiterjedő telepítések

### Bicep modulok  
- Újrahasználható infrastruktúra komponensek  
- Általános erőforrás minták  
- Biztonsági szempontból megerősített sablonok  
- Költségoptimalizált beállítások

### Segítő szkriptek  
- Környezet beállítás automatizálás  
- Adatbázis migrációs szkriptek  
- Telepítés validáló eszközök  
- Költségkövető eszközök

## 🔧 Testreszabási útmutató

### Példák adaptálása az igényeihez

1. **Előfeltételek áttekintése**  
   - Azure szolgáltatások követelményeinek ellenőrzése  
   - Előfizetés korlátok ellenőrzése  
   - Költség hatások megértése  

2. **Konfiguráció módosítása**  
   - `azure.yaml` szolgáltatásdefiníciók frissítése  
   - Bicep sablonok testreszabása  
   - Környezeti változók módosítása  

3. **Alapos tesztelés**  
   - Elsőként fejlesztői környezetbe telepítés  
   - Funkcionalitás ellenőrzése  
   - Skálázási és teljesítmény tesztelés  

4. **Biztonsági ellenőrzés**  
   - Hozzáférés szabályozások áttekintése  
   - Titkos kezelés bevezetése  
   - Monitorozás és riasztás engedélyezése

## 📊 Összehasonlító táblázat

| Példa | Szolgáltatások | Adatbázis | Hitelesítés | Monitorozás | Bonyolultság |  
|-------|----------------|-----------|-------------|-------------|--------------|  
| **Microsoft Foundry Models Chat** (Helyi) | 2 | ❌ | Key Vault | Teljes | ⭐⭐ |  
| **Python Flask API** (Helyi) | 1 | ❌ | Alap | Teljes | ⭐ |  
| **Mikroszolgáltatások** (Helyi) | 5+ | ✅ | Vállalati | Fejlett | ⭐⭐⭐⭐ |  
| Node.js Express Todo | 2 | ✅ | Alap | Alap | ⭐ |  
| React SPA + Functions | 3 | ✅ | Alap | Teljes | ⭐ |  
| Python Flask Container | 2 | ❌ | Alap | Teljes | ⭐ |  
| C# Web API + SQL | 2 | ✅ | Teljes | Teljes | ⭐⭐ |  
| Python Functions + SPA | 3 | ✅ | Teljes | Teljes | ⭐⭐ |  
| Java Mikroszolgáltatások | 5+ | ✅ | Teljes | Teljes | ⭐⭐ |  
| Microsoft Foundry Models Chat | 3 | ✅ | Teljes | Teljes | ⭐⭐⭐ |  
| AI Document Processing | 2 | ❌ | Alap | Teljes | ⭐⭐ |  
| ML Pipeline | 4+ | ✅ | Teljes | Teljes | ⭐⭐⭐⭐ |  
| **Retail Multi-Agent** (Helyi) | **8+** | **✅** | **Vállalati** | **Fejlett** | **⭐⭐⭐⭐** |

## 🎓 Tanulási útvonal

### Ajánlott haladási sorrend

1. **Egyszerű webalkalmazással kezdje**  
   - AZD alapfogalmak megtanulása  
   - Telepítési munkafolyamat megértése  
   - Környezetkezelés gyakorlása

2. **Próbálja ki a statikus weboldalt**  
   - Különböző hosztolási lehetőségek felfedezése  
   - CDN integráció tanulmányozása  
   - DNS konfiguráció megértése

3. **Lépjen a Container App-hez**  
   - Konténerizáció alapjainak elsajátítása  
   - Skálázási koncepciók megértése  
   - Docker gyakorlása

4. **Adatbázis integráció hozzáadása**  
   - Adatbázis előkészítés tanulása  
   - Kapcsolati karakterláncok megértése  
   - Titkos kezelés gyakorlása

5. **Fedezze fel a serverless-t**  
   - Eseményvezérelt architektúra megértése  
   - Trigger-ek és kötésük tanulmányozása  
   - API-k használatának gyakorlása

6. **Építsen mikroszolgáltatásokat**  
   - Szolgáltatás közti kommunikáció megtanulása  
   - Elosztott rendszerek megértése  
   - Összetett telepítések gyakorlása

## 🔍 A megfelelő példa kiválasztása

### Technológia szerint  
- **Container Apps**: [Python Flask API (Helyi)](../../../examples/container-app/simple-flask-api), [Mikroszolgáltatások (Helyi)](../../../examples/container-app/microservices), Java Mikroszolgáltatások  
- **Node.js**: Node.js Express Todo App, [Mikroszolgáltatások API Gateway (Helyi)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (Helyi)](../../../examples/container-app/simple-flask-api), [Mikroszolgáltatások termék szolgáltatás (Helyi)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [Mikroszolgáltatások rendelési szolgáltatás (Helyi)](../../../examples/container-app/microservices), C# Web API + SQL adatbázis, Microsoft Foundry Models Chat App, ML Pipeline  
- **Go**: [Mikroszolgáltatások felhasználói szolgáltatás (Helyi)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot Mikroszolgáltatások  
- **React**: React SPA + Functions  
- **Konténerek**: [Python Flask (Helyi)](../../../examples/container-app/simple-flask-api), [Mikroszolgáltatások (Helyi)](../../../examples/container-app/microservices), Java Mikroszolgáltatások  
- **Adatbázisok**: [Mikroszolgáltatások (Helyi)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **AI/ML**: **[Microsoft Foundry Models Chat (Helyi)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent megoldás**  
- **Több-ügynökös rendszerek**: **Retail Multi-Agent megoldás**  
- **OpenAI integráció**: **[Microsoft Foundry Models Chat (Helyi)](../../../examples/azure-openai-chat)**, Retail Multi-Agent megoldás  
- **Vállalati éles üzem**: [Mikroszolgáltatások (Helyi)](../../../examples/container-app/microservices), **Retail Multi-Agent megoldás**

### Architektúra szerint  
- **Egyszerű REST API**: [Python Flask API (Helyi)](../../../examples/container-app/simple-flask-api)  
- **Monolitikus**: Node.js Express Todo, C# Web API + SQL  
- **Statikus + Serverless**: React SPA + Functions, Python Functions + SPA  
- **Mikroszolgáltatások**: [Éles mikroszolgáltatások (Helyi)](../../../examples/container-app/microservices), Java Spring Boot Mikroszolgáltatások  
- **Konténerizált**: [Python Flask (Helyi)](../../../examples/container-app/simple-flask-api), [Mikroszolgáltatások (Helyi)](../../../examples/container-app/microservices)  
- **AI-alapú**: **[Microsoft Foundry Models Chat (Helyi)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent megoldás**  
- **Több-ügynökös architektúra**: **Retail Multi-Agent megoldás**  
- **Vállalati több-szolgáltatásos**: [Mikroszolgáltatások (Helyi)](../../../examples/container-app/microservices), **Retail Multi-Agent megoldás**

### Bonyolultság szerint  
- **Kezdő**: [Python Flask API (Helyi)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **Középhaladó**: **[Microsoft Foundry Models Chat (Helyi)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Mikroszolgáltatások, Microsoft Foundry Models Chat App, AI Document Processing  
- **Fejlett**: ML Pipeline  
- **Vállalati éles üzemre kész**: [Mikroszolgáltatások (Helyi)](../../../examples/container-app/microservices) (Több szolgáltatás, üzenetsorral), **Retail Multi-Agent megoldás** (Teljes több-ügynökös rendszer ARM sablonos telepítéssel)

## 📚 További források

### Dokumentáció linkek  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)  
- [Bicep dokumentáció](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  

### Közösségi példák  
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)  
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)  
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)  
- [Todo App C#-val és Azure SQL-lel](https://github.com/Azure-Samples/todo-csharp-sql)  
- [Todo App Python-nal és MongoDB-vel](https://github.com/Azure-Samples/todo-python-mongo)  
- [Todo App Node.js-sel és PostgreSQL-lel](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Webalkalmazás C# API-val](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions Java-val](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Legjobb Gyakorlatok
- [Azure Well-Architected Keretrendszer](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Keretrendszer](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Példák Hozzájárulása

Van hasznos példád, amit megosztanál? Szívesen fogadjuk a hozzájárulásokat!

### Beküldési Útmutató
1. Kövesd a megállapított könyvtárszerkezetet
2. Tartalmazzon átfogó README.md fájlt
3. Adj hozzá megjegyzéseket a konfigurációs fájlokhoz
4. Teszteld alaposan, mielőtt beküldöd
5. Tartalmazzon költségbecsléseket és előfeltételeket

### Példa Sablon Szerkezete
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

**Pro Tipp**: Kezdj a leg egyszerűbb példával, ami megfelel a technológiai környezetednek, majd fokozatosan haladj a bonyolultabb forgatókönyvek felé. Minden példa az előzőek fogalmaira épül!

## 🚀 Készen állsz a kezdéshez?

### Tanulási Útvonalad

1. **Teljesen Kezdő?** → Kezdd a [Flask API-val](../../../examples/container-app/simple-flask-api) (⭐, 20 perc)
2. **Alap AZD Tudásod Van?** → Próbáld ki a [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 perc)
3. **Mesterséges Intelligencia Alkalmazásokat Építesz?** → Kezdd a [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 perc) vagy fedezd fel a [Retail Multi-Agent](retail-scenario.md)-t (⭐⭐⭐⭐, 2+ óra)
4. **Specifikus Technológiai Környezetre Van Szükséged?** → Használd a fenti [Megfelelő Példa Keresése](#-finding-the-right-example) részt

### Következő Lépések

- ✅ Tekintsd át a fenti [Előfeltételeket](#előfeltételek)
- ✅ Válassz példát a tudásszintednek megfelelően (lásd [Bonyolultsági Minősítés](#nehézségi-szint-magyarázat))
- ✅ Olvasd el alaposan a példa README-jét telepítés előtt
- ✅ Állíts be emlékeztetőt az `azd down` parancs futtatására tesztelés után
- ✅ Oszd meg tapasztalataid GitHub Issues vagy Discussions segítségével

### Segítségre Van Szükséged?

- 📖 [GYIK](../resources/faq.md) - Gyakori kérdések és válaszok
- 🐛 [Hibaelhárítási Útmutató](../docs/chapter-07-troubleshooting/common-issues.md) - Telepítési problémák megoldása
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Kérdezz a közösségtől
- 📚 [Tanulmányi Útmutató](../resources/study-guide.md) - Tanulás megerősítése

---

**Navigáció**
- **📚 Tanfolyam Kezdőlap**: [AZD Kezdőknek](../README.md)
- **📖 Tananyagok**: [Tanulmányi Útmutató](../resources/study-guide.md) | [Egylapos Összefoglaló](../resources/cheat-sheet.md) | [Fogalomtár](../resources/glossary.md)
- **🔧 Erőforrások**: [GYIK](../resources/faq.md) | [Hibaelhárítás](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Utolsó frissítés: 2025. november | [Hibabejelentés](https://github.com/microsoft/AZD-for-beginners/issues) | [Példák Hozzájárulása](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->