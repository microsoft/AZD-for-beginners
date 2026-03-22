# Példák - Gyakorlati AZD Sablonok és Konfigurációk

**Tanulás példák alapján - fejezetenként szervezve**
- **📚 Kurzus kezdőoldal**: [AZD kezdőknek](../README.md)
- **📖 Fejezet térkép**: Példák a tanulási nehézség szerint rendszerezve
- **🚀 Lokális példa**: [Kiskereskedelmi több-ügynök megoldás](retail-scenario.md)
- **🤖 Külső MI példák**: Hivatkozások Azure Samples tárolókra

> **📍 FONTOS: Helyi vs Külső példák**  
> Ez a tároló **4 teljes helyi példát** tartalmaz teljes megvalósítással:  
> - **Microsoft Foundry Models Chat** (gpt-4.1 telepítés chat felülettel)  
> - **Konténer alkalmazások** (Egyszerű Flask API + mikroszolgáltatások)  
> - **Adatbázis alkalmazás** (Web + SQL adatbázis)  
> - **Kiskereskedelmi több-ügynök** (Vállalati MI megoldás)  
>  
> További példák a hivatalos Azure Samples tárolókra mutató **külső hivatkozások**, amelyeket leklónozhatsz.

## Bevezetés

Ez a könyvtár gyakorlati példákat és hivatkozásokat kínál, hogy az Azure Developer CLI-t kézzelfogható gyakorlatokon keresztül tanuld meg. A Kiskereskedelmi több-ügynök forgatókönyv egy teljes, éles üzembe helyezhető megvalósítás, amely megtalálható ebben a tárolóban. A további példák hivatalos Azure Samples projektjeire hivatkoznak, amelyek különféle AZD mintákat mutatnak be.

### Bonyolultsági besorolás

- ⭐ **Kezdő** - Alapfogalmak, egyetlen szolgáltatás, 15-30 perc
- ⭐⭐ **Középhaladó** - Több szolgáltatás, adatbázis integráció, 30-60 perc
- ⭐⭐⭐ **Haladó** - Összetett architektúra, MI integráció, 1-2 óra
- ⭐⭐⭐⭐ **Szakértő** - Éles, vállalati minták, 2+ óra

## 🎯 Mi található ebben a tárolóban

### ✅ Helyi megvalósítás (Használatra készen)

#### [Microsoft Foundry Models Chat Alkalmazás](azure-openai-chat/README.md) 🆕  
**Teljes gpt-4.1 telepítés chat felülettel, ebben a repo-ban**

- **Hely:** `examples/azure-openai-chat/`
- **Bonyolultság:** ⭐⭐ (Középhaladó)
- **Tartalom:**
  - Teljes Microsoft Foundry Models telepítés (gpt-4.1)
  - Python parancssori chat felület
  - Key Vault integráció az API kulcsok biztonságához
  - Bicep infrastruktúra sablonok
  - Token használat és költségkövetés
  - Korlátozás és hibakezelés

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

#### [Konténer alkalmazás példák](container-app/README.md) 🆕  
**Átfogó konténer telepítési példák ebben a repo-ban**

- **Hely:** `examples/container-app/`
- **Bonyolultság:** ⭐-⭐⭐⭐⭐ (Kezdő - Haladó)
- **Tartalom:**
  - [Fő útmutató](container-app/README.md) - Teljes áttekintés a konténer telepítésekről
  - [Egyszerű Flask API](../../../examples/container-app/simple-flask-api) - Alap REST API példa
  - [Mikroszolgáltatások architektúra](../../../examples/container-app/microservices) - Éles több-szolgáltatásos telepítés
  - Gyors indulás, éles és haladó minták
  - Monitorozás, biztonság és költség-optimalizálás

**Gyors indulás:**
```bash
# Nézze meg a fő útmutatót
cd examples/container-app

# Egyszerű Flask API telepítése
cd simple-flask-api
azd up

# Példa mikroszolgáltatások telepítésére
cd ../microservices
azd up
```

**Technológiák:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Kiskereskedelmi több-ügynök megoldás](retail-scenario.md) 🆕  
**Teljes, éles megvalósítás ebben a repo-ban**

- **Hely:** `examples/retail-multiagent-arm-template/`
- **Bonyolultság:** ⭐⭐⭐⭐ (Haladó)
- **Tartalom:**
  - Teljes ARM telepítési sablon
  - Több-ügynök architektúra (Vevő + Készlet)
  - Microsoft Foundry Models integráció
  - MI keresés RAG-mintával
  - Átfogó monitorozás
  - Egyszerű telepítő script

**Gyors indulás:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Technológiák:** Microsoft Foundry Models, MI keresés, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Külső Azure Samples (Klónozással használható)

Az alábbi példák hivatalos Azure-Samples tárolókban vannak karbantartva. Klónozd őket, hogy különféle AZD mintákat fedezz fel:

### Egyszerű alkalmazások (1-2. fejezetek)

| Sablon | Tároló | Bonyolultság | Szolgáltatások |
|:-------|:--------|:-------------|:---------------|
| **Python Flask API** | [Helyi: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Mikroszolgáltatások** | [Helyi: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Több-szolgáltatásos, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Konténer** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Használat módja:**
```bash
# Klónozz bármely példányt
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Telepítés
azd up
```

### MI alkalmazás példák (2., 5., 8. fejezetek)

| Sablon | Tároló | Bonyolultság | Fókusz |
|:-------|:--------|:-------------|:--------|
| **Microsoft Foundry Models Chat** | [Helyi: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 telepítés |
| **MI Chat Gyorsstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Alap MI chat |
| **MI Ügynökök** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Ügynök keretrendszer |
| **Keresés + OpenAI Demó** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG minta |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Vállalati MI |

### Adatbázis & Haladó minták (3-8. fejezetek)

| Sablon | Tároló | Bonyolultság | Fókusz |
|:-------|:--------|:-------------|:--------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Adatbázis integráció |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL szerver nélküli |
| **Java Mikroszolgáltatások** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Több-szolgáltatásos |
| **MI folyamat** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Tanulási célok

Ezeket a példákat végighaladva képes leszel:
- Azure Developer CLI munkafolyamatokat gyakorolni valós alkalmazási forgatókönyvekkel
- Megérteni különböző alkalmazás architektúrákat és azok azd megvalósításait
- Mesteri szintre fejleszteni az Infrastructure as Code mintákat különböző Azure szolgáltatásokra
- Alkalmazni konfigurációkezelést és környezet-specifikus telepítési stratégiákat
- Megvalósítani monitorozási, biztonsági és skálázási mintákat gyakorlati környezetben
- Szerezni tapasztalatot valós telepítési hibakeresésben és problémamegoldásban

## Tanulási eredmények

A példák befejezése után képes leszel:
- Magabiztosan telepíteni különféle alkalmazástípusokat Azure Developer CLI segítségével
- A sablonokat saját alkalmazás igényeidhez igazítani
- Egyedi infrastruktúra mintákat megtervezni és megvalósítani Bicep segítségével
- Összetett több-szolgáltatásos alkalmazásokat megfelelő függőségekkel konfigurálni
- Biztonsági, monitorozási és teljesítmény-optimalizálási legjobb gyakorlatokat alkalmazni valós helyzetekben
- Gyakorlati tapasztalat alapján telepítési hibákat diagnosztizálni és optimalizálni

## Könyvtár struktúra

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

## Gyors indulási példák

> **💡 Új vagy az AZD-ben?** Kezdd az 1-es példával (Flask API) - ez körülbelül 20 perc és megtanítja az alapokat.

### Kezdőknek
1. **[Konténer alkalmazás - Python Flask API](../../../examples/container-app/simple-flask-api)** (Helyi) ⭐  
   Egyszerű REST API telepítése skálázással nulla példányra  
   **Idő:** 20-25 perc | **Költség:** $0-5/hó  
   **Amit tanulsz:** Alap azd munkafolyamat, konténerizáció, állapotellenőrzés  
   **Várható eredmény:** Működő API végpont, amely "Hello, World!"-ot ad vissza monitorozással

2. **[Egyszerű webalkalmazás - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Node.js Express webalkalmazás telepítése MongoDB-vel  
   **Idő:** 25-35 perc | **Költség:** $10-30/hó  
   **Amit tanulsz:** Adatbázis integráció, környezeti változók, kapcsolati láncok  
   **Várható eredmény:** Todo lista app létrehozás/olvasás/frissítés/törlés funkciókkal

3. **[Statikus webhely - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   React statikus weboldal tárolása Azure Static Web Apps segítségével  
   **Idő:** 20-30 perc | **Költség:** $0-10/hó  
   **Amit tanulsz:** Statikus hosztolás, szerver nélküli funkciók, CDN telepítés  
   **Várható eredmény:** React felület API háttérrel, automatikus SSL, globális CDN

### Középhaladóknak
4. **[Microsoft Foundry Models Chat Alkalmazás](../../../examples/azure-openai-chat)** (Helyi) ⭐⭐  
   gpt-4.1 telepítése chat felülettel és biztonságos API kulcs kezeléssel  
   **Idő:** 35-45 perc | **Költség:** $50-200/hó  
   **Amit tanulsz:** Microsoft Foundry Models telepítés, Key Vault integráció, token követés  
   **Várható eredmény:** Működő chat alkalmazás gpt-4.1-gyel és költségkövetéssel

5. **[Konténer alkalmazás - Mikroszolgáltatások](../../../examples/container-app/microservices)** (Helyi) ⭐⭐⭐⭐  
   Éles, több szolgáltatásból álló architektúra  
   **Idő:** 45-60 perc | **Költség:** $50-150/hó  
   **Amit tanulsz:** Szolgáltatás közötti kommunikáció, üzenetküldés, elosztott követés  
   **Várható eredmény:** 2-szolgáltatásos rendszer (API Gateway + Termék szolgáltatás) monitorozással

6. **[Adatbázis alkalmazás - C# Azure SQL-lel](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Webalkalmazás C# API-val és Azure SQL adatbázissal  
   **Idő:** 30-45 perc | **Költség:** $20-80/hó  
   **Amit tanulsz:** Entity Framework, adatbázis migrációk, kapcsolódás biztonság  
   **Várható eredmény:** C# API Azure SQL háttérrel, automatikus séma telepítés

7. **[Szerver nélküli funkció - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions HTTP triggerrel és Cosmos DB-vel  
   **Idő:** 30-40 perc | **Költség:** $10-40/hó  
   **Amit tanulsz:** Esemény alapú architektúra, szerver nélküli skálázás, NoSQL integráció  
   **Várható eredmény:** Funkció alkalmazás HTTP kérésekre válaszol Cosmos DB tárral

8. **[Mikroszolgáltatások - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Több-szolgáltatásos Java alkalmazás Container Apps-szel és API kapuval  
   **Idő:** 60-90 perc | **Költség:** $80-200/hó  
   **Amit tanulsz:** Spring Boot telepítés, szolgáltatás hálózat, terheléselosztás  
   **Várható eredmény:** Több-szolgáltatásos Java rendszer szolgáltatás felfedezéssel és útválasztással

### Microsoft Foundry sablonok

1. **[Microsoft Foundry Models Chat App - helyi példa](../../../examples/azure-openai-chat)** ⭐⭐  
   Teljes gpt-4.1 telepítés chat felülettel  
   **Idő:** 35-45 perc | **Költség:** $50-200/hó  
   **Várható eredmény:** Működő chat alkalmazás token követéssel és költség monitorozással

2. **[Azure Search + OpenAI Demó](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Intelligens chat alkalmazás RAG architektúrával  
   **Idő:** 60-90 perc | **Költség:** $100-300/hó  
   **Várható eredmény:** RAG-alapú chat felület dokumentumkereséssel és hivatkozásokkal

3. **[MI dokumentum feldolgozás](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Dokumentumelemzés Azure MI szolgáltatásokkal  
   **Idő:** 40-60 perc | **Költség:** $20-80/hó  
   **Várható eredmény:** API szöveg, táblázatok és entitások kinyerésére feltöltött dokumentumokból

4. **[Gépi tanulási folyamat](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps munkafolyamat Azure Machine Learninggel  
   **Idő:** 2-3 óra | **Költség:** $150-500/hó  
   **Várható eredmény:** Automatizált ML folyamat képzéssel, telepítéssel és monitorozással

### Valódi világ példák

#### **Kiskereskedelmi több-ügynök megoldás** 🆕  
**[Teljes megvalósítási útmutató](./retail-scenario.md)**

Egy átfogó, éles, több-ügynök ügyféltámogató megoldás, amely bemutatja vállalati szintű MI alkalmazás telepítését AZD-vel. Ez a forgatókönyv biztosítja:
- **Teljes architektúra**: Többügynökös rendszer, specializált ügyfélszolgálati és készletkezelési ügynökökkel
- **Termelési infrastruktúra**: Több régiós Microsoft Foundry Models telepítések, AI Search, Container Apps és átfogó monitorozás
- **Kész telepítésre alkalmas ARM sablon**: Egykattintásos telepítés több konfigurációs móddal (Minimal/Standard/Premium)
- **Fejlett funkciók**: Red teaming biztonsági érvényesítés, ügynökértékelő keretrendszer, költségoptimalizálás és hibakeresési útmutatók
- **Valós üzleti kontextus**: Kiskereskedői ügyféltámogatási eset fájlfeltöltésekkel, keresési integrációval és dinamikus skálázással

**Technológiák**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Bonyolultság**: ⭐⭐⭐⭐ (Haladó - Vállalati termelésre kész)

**Tökéletes**: AI fejlesztőknek, megoldásarchitektúráknak és többügynökös rendszereket építő csapatoknak

**Gyors kezdés**: Telepítse a teljes megoldást kevesebb mint 30 perc alatt a mellékelt ARM sablon használatával a `./deploy.sh -g myResourceGroup` paranccsal

## 📋 Használati utasítások

### Előfeltételek

Mielőtt bármilyen példát futtatna:
- ✅ Azure-előfizetés tulajdonosi vagy közreműködői jogosultsággal
- ✅ Azure Developer CLI telepítve ([Telepítési útmutató](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop fut (konténeres példákhoz)
- ✅ Megfelelő Azure kvóták (ellenőrizze az egyes példák követelményeit)

> **💰 Költségfigyelmeztetés:** Minden példa valódi Azure erőforrásokat hoz létre, amelyek költséggel járnak. A költségbecsléseket az egyes README fájlok tartalmazzák. Ne felejtse el a `azd down` parancsot futtatni a használat után a folyamatos költségek elkerülése érdekében.

### Példák helyi futtatása

1. **Példa klónozása vagy másolása**
   ```bash
   # Navigáljon a kívánt példára
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
   # Szerezze be a szolgáltatás végpontjait
   azd env get-values
   
   # Tesztelje a végpontot (példa)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Várt sikeres eredmények:**
   - ✅ Az `azd up` sikeresen, hibák nélkül lefut
   - ✅ A szolgáltatás végpont HTTP 200-as választ ad
   - ✅ Az Azure Portal „Futásban” állapotot mutat
   - ✅ Az Application Insights fogadja a telemetriát

> **⚠️ Probléma esetén?** Tekintse meg a [Gyakori hibák](../docs/chapter-07-troubleshooting/common-issues.md) oldalt a telepítési hibák elhárításához

### Példák testreszabása

Minden példa tartalmaz:
- **README.md** - Részletes telepítési és testreszabási útmutató
- **azure.yaml** - AZD konfiguráció megjegyzésekkel
- **infra/** - Bicep sablonok paramétermagyarázatokkal
- **src/** - Mintaalkalmazás kódja
- **scripts/** - Segéddszkriptek általános feladatokhoz

## 🎯 Tanulási célok

### Példakategóriák

#### **Alapvető telepítések**
- Egyszerű, egy szolgáltatásos alkalmazások
- Egyszerű infrastruktúra minták
- Alap konfigurációkezelés
- Költséghatékony fejlesztési környezetek

#### **Fejlett forgatókönyvek**
- Több szolgáltatást tartalmazó architektúrák
- Összetett hálózati konfigurációk
- Adatbázis-integrációs minták
- Biztonsági és megfelelőségi megoldások

#### **Termelésre kész minták**
- Magas rendelkezésre állás konfigurációk
- Monitorozás és megfigyelhetőség
- CI/CD integráció
- Katasztrófavédelmi beállítások

## 📖 Példaleírások

### Egyszerű webalkalmazás - Node.js Express
**Technológiák**: Node.js, Express, MongoDB, Container Apps  
**Bonyolultság**: Kezdő  
**Fogalmak**: Alap telepítés, REST API, NoSQL adatbázis integráció

### Statikus weboldal - React SPA
**Technológiák**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Bonyolultság**: Kezdő  
**Fogalmak**: Statikus hoszting, szerver nélküli backend, korszerű webfejlesztés

### Container App - Python Flask
**Technológiák**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Bonyolultság**: Kezdő  
**Fogalmak**: Konténerizáció, REST API, scale-to-zero, egészségellenőrzések, monitorozás  
**Helyszín**: [Helyi példa](../../../examples/container-app/simple-flask-api)

### Container App - Mikroszolgáltatások Architektúra
**Technológiák**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Bonyolultság**: Haladó  
**Fogalmak**: Több szolgáltatás architektúrája, szolgáltatásközi kommunikáció, üzenetközvetítés, elosztott nyomkövetés  
**Helyszín**: [Helyi példa](../../../examples/container-app/microservices)

### Adatbázis-alkalmazás - C# Azure SQL-lel
**Technológiák**: C# ASP.NET Core, Azure SQL Database, App Service  
**Bonyolultság**: Középhaladó  
**Fogalmak**: Entity Framework, adatbázis-kapcsolatok, web API fejlesztés

### Szerver nélküli függvény - Python Azure Functions
**Technológiák**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Bonyolultság**: Középhaladó  
**Fogalmak**: Eseményvezérelt architektúra, szerver nélküli számítás, teljes stack fejlesztés

### Mikroszolgáltatások - Java Spring Boot
**Technológiák**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Bonyolultság**: Középhaladó  
**Fogalmak**: Mikroszolgáltatások közti kommunikáció, elosztott rendszerek, vállalati minták

### Microsoft Foundry példák

#### Microsoft Foundry Models Chat App
**Technológiák**: Microsoft Foundry Models, Cognitive Search, App Service  
**Bonyolultság**: Középhaladó  
**Fogalmak**: RAG architektúra, vektoros keresés, LLM integráció

#### AI Dokumentumfeldolgozás
**Technológiák**: Azure AI Document Intelligence, Storage, Functions  
**Bonyolultság**: Középhaladó  
**Fogalmak**: Dokumentumelemzés, OCR, adatkinyerés

#### Gépi tanulási folyamat
**Technológiák**: Azure ML, MLOps, Container Registry  
**Bonyolultság**: Haladó  
**Fogalmak**: Modelltréning, telepítési folyamatok, monitorozás

## 🛠 Konfigurációs példák

A `configurations/` könyvtár újrahasználható komponenseket tartalmaz:

### Környezeti konfigurációk
- Fejlesztői környezet beállítások
- Tesztelő környezet konfigurációk
- Termelésre kész konfigurációk
- Többrégiós telepítési beállítások

### Bicep modulok
- Újrahasználható infrastruktúra komponensek
- Gyakori erőforrásminták
- Biztonságos sablonok
- Költségoptimalizált konfigurációk

### Segéd szkriptek
- Környezetbeállítás automatizálás
- Adatbázis migrációs szkriptek
- Telepítés érvényesítő eszközök
- Költségfigyelő eszközök

## 🔧 Testreszabási útmutató

### Példák adaptálása az Ön igényeihez

1. **Ellenőrizze az előfeltételeket**
   - Azure szolgáltatási követelmények átnézése
   - Előfizetési limitek ellenőrzése
   - Költségvonzatok megértése

2. **Konfiguráció módosítása**
   - `azure.yaml` szolgáltatásdefiníciók frissítése
   - Bicep sablonok testreszabása
   - Környezeti változók beállítása

3. **Alapos tesztelés**
   - Először fejlesztői környezetbe telepítés
   - Funkcionalitás validálása
   - Skálázás és teljesítmény tesztelése

4. **Biztonsági áttekintés**
   - Hozzáférés-ellenőrzések felülvizsgálata
   - Titkok kezelése
   - Monitorozás és riasztás engedélyezése

## 📊 Összehasonlító mátrix

| Példa | Szolgáltatások | Adatbázis | Hitelesítés | Monitorozás | Bonyolultság |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (Helyi) | 2 | ❌ | Key Vault | Teljes | ⭐⭐ |
| **Python Flask API** (Helyi) | 1 | ❌ | Alap | Teljes | ⭐ |
| **Mikroszolgáltatások** (Helyi) | 5+ | ✅ | Vállalati | Haladó | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Alap | Alap | ⭐ |
| React SPA + Functions | 3 | ✅ | Alap | Teljes | ⭐ |
| Python Flask Container | 2 | ❌ | Alap | Teljes | ⭐ |
| C# Web API + SQL | 2 | ✅ | Teljes | Teljes | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Teljes | Teljes | ⭐⭐ |
| Java Mikroszolgáltatások | 5+ | ✅ | Teljes | Teljes | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | Teljes | Teljes | ⭐⭐⭐ |
| AI Dokumentumfeldolgozás | 2 | ❌ | Alap | Teljes | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Teljes | Teljes | ⭐⭐⭐⭐ |
| **Kiskereskedelmi Többügynökös** (Helyi) | **8+** | **✅** | **Vállalati** | **Haladó** | **⭐⭐⭐⭐** |

## 🎓 Tanulási útvonal

### Ajánlott sorrend

1. **Kezdje Egy Egyszerű Webalkalmazással**
   - Alap AZD fogalmak megtanulása
   - Telepítési folyamat megértése
   - Környezetkezelési gyakorlat

2. **Próbálja ki a Statikus Weboldalt**
   - Különböző hoszting lehetőségek felfedezése
   - CDN integráció tanulmányozása
   - DNS konfiguráció megértése

3. **Lépjen a Container App-ra**
   - Konténerizáció alapjainak elsajátítása
   - Skálázási koncepciók megértése
   - Docker gyakorlása

4. **Adatbázis Integrálása**
   - Adatbázis-provizionálás megtanulása
   - Kapcsolati stringek megértése
   - Titkok kezelése gyakorlat

5. **Ismerje meg a Szerver Nélküli Megoldásokat**
   - Eseményvezérelt architektúra
   - Trigger és binding fogalmak
   - API-k gyakorlása

6. **Építsen Mikroszolgáltatásokat**
   - Szolgáltatásközi kommunikáció
   - Elosztott rendszerek megértése
   - Összetett telepítések gyakorlása

## 🔍 Megfelelő példa megtalálása

### Technológiai halmazonként
- **Container Apps**: [Python Flask API (Helyi)](../../../examples/container-app/simple-flask-api), [Mikroszolgáltatások (Helyi)](../../../examples/container-app/microservices), Java Mikroszolgáltatások
- **Node.js**: Node.js Express Todo App, [Mikroszolgáltatások API Gateway (Helyi)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Helyi)](../../../examples/container-app/simple-flask-api), [Mikroszolgáltatás Termék Szolgáltatás (Helyi)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Mikroszolgáltatás Rendelés Szolgáltatás (Helyi)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Mikroszolgáltatás Felhasználó Szolgáltatás (Helyi)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Mikroszolgáltatások
- **React**: React SPA + Functions
- **Konténerek**: [Python Flask (Helyi)](../../../examples/container-app/simple-flask-api), [Mikroszolgáltatások (Helyi)](../../../examples/container-app/microservices), Java Mikroszolgáltatások
- **Adatbázisok**: [Mikroszolgáltatások (Helyi)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (Helyi)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Dokumentumfeldolgozás, ML Pipeline, **Kiskereskedelmi Többügynökös Megoldás**
- **Többügynökös rendszerek**: **Kiskereskedelmi Többügynökös Megoldás**
- **OpenAI Integráció**: **[Microsoft Foundry Models Chat (Helyi)](../../../examples/azure-openai-chat)**, Kiskereskedelmi Többügynökös Megoldás
- **Vállalati termelés**: [Mikroszolgáltatások (Helyi)](../../../examples/container-app/microservices), **Kiskereskedelmi Többügynökös Megoldás**

### Architektúra minta szerint
- **Egyszerű REST API**: [Python Flask API (Helyi)](../../../examples/container-app/simple-flask-api)
- **Monolitikus**: Node.js Express Todo, C# Web API + SQL
- **Statikus + Szerver nélküli**: React SPA + Functions, Python Functions + SPA
- **Mikroszolgáltatások**: [Termelési Mikroszolgáltatások (Helyi)](../../../examples/container-app/microservices), Java Spring Boot Mikroszolgáltatások
- **Konténerizált**: [Python Flask (Helyi)](../../../examples/container-app/simple-flask-api), [Mikroszolgáltatások (Helyi)](../../../examples/container-app/microservices)
- **AI-vezérelt**: **[Microsoft Foundry Models Chat (Helyi)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Dokumentumfeldolgozás, ML Pipeline, **Kiskereskedelmi Többügynökös Megoldás**
- **Többügynökös architektúra**: **Kiskereskedelmi Többügynökös Megoldás**
- **Vállalati többszolgáltatós**: [Mikroszolgáltatások (Helyi)](../../../examples/container-app/microservices), **Kiskereskedelmi Többügynökös Megoldás**

### Bonyolultsági szint szerint
- **Kezdő**: [Python Flask API (Helyi)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Középhaladó**: **[Microsoft Foundry Models Chat (Helyi)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Mikroszolgáltatások, Microsoft Foundry Models Chat App, AI Dokumentumfeldolgozás
- **Haladó**: ML Pipeline
- **Vállalati termelésre kész**: [Mikroszolgáltatások (Helyi)](../../../examples/container-app/microservices) (Több szolgáltatás üzenetközvetítéssel), **Kiskereskedelmi Többügynökös Megoldás** (Teljes többszereplős rendszer ARM sablonos telepítéssel)

## 📚 További források

### Dokumentációs linkek
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD sablonok](https://github.com/Azure/ai-foundry-templates)
- [Bicep dokumentáció](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Közösségi példák
- [Azure Samples AZD Sablonok](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Sablonok](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Galéria](https://azure.github.io/awesome-azd/)
- [Todo alkalmazás C# és Azure SQL használatával](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo alkalmazás Python és MongoDB használatával](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo alkalmazás Node.js és PostgreSQL használatával](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Webalkalmazás C# API-val](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Feladat](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions Java-val](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Legjobb gyakorlatok
- [Azure Jól Megtervezett Keretrendszer](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Felhőalkalmazás-keretrendszer](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Példák hozzájárulása

Van hasznos példád, amit megosztanál? Szívesen fogadjuk a hozzájárulásokat!

### Beküldési irányelvek
1. Kövesd a kialakított könyvtárszerkezetet
2. Tartalmazzon átfogó README.md fájlt
3. Adj hozzá megjegyzéseket a konfigurációs fájlokhoz
4. Tesztelj alaposan beküldés előtt
5. Tartalmazzon költségbecslést és előfeltételeket

### Példa sablon szerkezete
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

**Pro Tipp**: Kezdd a legegyszerűbb példával, amely megfelel a technológiai felépítésednek, majd fokozatosan haladj a bonyolultabb forgatókönyvek felé. Minden példa az előzőek koncepcióira épül!

## 🚀 Készen állsz a kezdéshez?

### Tanulási utad

1. **Teljesen kezdő vagy?** → Kezd a [Flask API-val](../../../examples/container-app/simple-flask-api) (⭐, 20 perc)
2. **Van alap AZD ismereted?** → Próbáld ki a [Microservices-t](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 perc)
3. **AI alkalmazásokat építesz?** → Kezd a [Microsoft Foundry Models Chattel](../../../examples/azure-openai-chat) (⭐⭐, 35 perc) vagy fedezd fel a [Retail Multi-Agent-et](retail-scenario.md) (⭐⭐⭐⭐, 2+ óra)
4. **Specifikus technológiai stackre van szükséged?** → Használd a fenti [Megfelelő példa keresése](#-finding-the-right-example) részt

### Következő lépések

- ✅ Nézd át a fentiekben a [Előfeltételeket](#előfeltételek)
- ✅ Válassz példát a tudásszintednek megfelelően (lásd [Bonyolultsági jelmagyarázat](#bonyolultsági-besorolás))
- ✅ Olvasd el alaposan a példa README-jét telepítés előtt
- ✅ Állíts be emlékeztetőt az `azd down` parancs futtatására tesztelés után
- ✅ Oszd meg tapasztalatodat GitHub Issues vagy Discussions segítségével

### Segítségre van szükséged?

- 📖 [GYIK](../resources/faq.md) - Gyakori kérdések és válaszok
- 🐛 [Hibakeresési útmutató](../docs/chapter-07-troubleshooting/common-issues.md) - Telepítési problémák javítása
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Közösségi kérdések
- 📚 [Tanulmányi útmutató](../resources/study-guide.md) - Tanulás megerősítése

---

**Navigáció**
- **📚 Tanfolyam kezdőlap:** [AZD Kezdőknek](../README.md)
- **📖 Tananyagok:** [Tanulmányi útmutató](../resources/study-guide.md) | [Összefoglaló](../resources/cheat-sheet.md) | [Szójegyzék](../resources/glossary.md)
- **🔧 Források:** [GYIK](../resources/faq.md) | [Hibakeresés](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Utolsó frissítés: 2025 november | [Hibabejelentés](https://github.com/microsoft/AZD-for-beginners/issues) | [Példák hozzájárulása](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Felelősség kizárása**:
Ezt a dokumentumot az AI fordító szolgáltatás [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével fordítottuk. Bár pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum anyanyelvű változata tekintendő hivatalos forrásnak. Fontos információk esetén professzionális emberi fordítást javaslunk. Nem vállalunk felelősséget a fordítás használatából eredő félreértésekért vagy félreértelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->