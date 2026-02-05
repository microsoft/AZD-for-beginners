# Példák - Gyakorlati AZD sablonok és konfigurációk

**Tanulás példákon keresztül - Fejezetek szerint rendezve**
- **📚 Kurzus kezdőlapja**: [AZD Kezdőknek](../README.md)
- **📖 Fejezetek térképe**: Példák tanulási nehézség szerint rendezve
- **🚀 Helyi példa**: [Kiskereskedelmi többügynökös megoldás](retail-scenario.md)
- **🤖 Külső AI példák**: Hivatkozások az Azure Samples repozitóriumokra

> **📍 FONTOS: Helyi vs Külső példák**  
> Ez a repozitórium **4 teljes helyi példát** tartalmaz teljes implementációval:  
> - **Azure OpenAI Chat** (GPT-4 telepítés chat interfésszel)  
> - **Container Apps** (Egyszerű Flask API + Mikroszolgáltatások)  
> - **Adatbázis alkalmazás** (Web + SQL adatbázis)  
> - **Kiskereskedelmi többügynökös megoldás** (Vállalati AI megoldás)  
>  
> További példák **külső hivatkozások** az Azure-Samples repozitóriumokra, amelyeket klónozhatsz.

## Bevezetés

Ez a könyvtár gyakorlati példákat és hivatkozásokat biztosít, hogy az Azure Developer CLI-t gyakorlati tapasztalatokon keresztül tanulhassuk meg. A kiskereskedelmi többügynökös forgatókönyv egy teljes, gyártásra kész implementáció, amely ebben a repozitóriumban található. További példák hivatalos Azure Samples-re hivatkoznak, amelyek különböző AZD mintákat mutatnak be.

### Összetettségi szint jelmagyarázata

- ⭐ **Kezdő** - Alapfogalmak, egyetlen szolgáltatás, 15-30 perc
- ⭐⭐ **Középhaladó** - Több szolgáltatás, adatbázis integráció, 30-60 perc
- ⭐⭐⭐ **Haladó** - Összetett architektúra, AI integráció, 1-2 óra
- ⭐⭐⭐⭐ **Szakértő** - Gyártásra kész, vállalati minták, 2+ óra

## 🎯 Mi található ebben a repozitóriumban

### ✅ Helyi implementáció (Használatra kész)

#### [Azure OpenAI Chat alkalmazás](azure-openai-chat/README.md) 🆕
**Teljes GPT-4 telepítés chat interfésszel ebben a repozitóriumban**

- **Helyszín:** `examples/azure-openai-chat/`
- **Összetettség:** ⭐⭐ (Középhaladó)
- **Tartalom:**
  - Teljes Azure OpenAI telepítés (GPT-4)
  - Python parancssoros chat interfész
  - Key Vault integráció biztonságos API kulcsokhoz
  - Bicep infrastruktúra sablonok
  - Token használat és költségkövetés
  - Sebességkorlátozás és hibakezelés

**Gyors kezdés:**
```bash
# Navigáljon az példához
cd examples/azure-openai-chat

# Telepítsen mindent
azd up

# Telepítse a függőségeket és kezdjen el csevegni
pip install -r src/requirements.txt
python src/chat.py
```

**Technológiák:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Container App példák](container-app/README.md) 🆕
**Átfogó konténer telepítési példák ebben a repozitóriumban**

- **Helyszín:** `examples/container-app/`
- **Összetettség:** ⭐-⭐⭐⭐⭐ (Kezdőtől haladóig)
- **Tartalom:**
  - [Fő útmutató](container-app/README.md) - Teljes áttekintés a konténer telepítésekről
  - [Egyszerű Flask API](../../../examples/container-app/simple-flask-api) - Alapvető REST API példa
  - [Mikroszolgáltatások architektúra](../../../examples/container-app/microservices) - Gyártásra kész több szolgáltatás telepítés
  - Gyors kezdés, gyártás és haladó minták
  - Monitoring, biztonság és költségoptimalizálás

**Gyors kezdés:**
```bash
# Nézze meg a fő útmutatót
cd examples/container-app

# Egyszerű Flask API telepítése
cd simple-flask-api
azd up

# Mikroszolgáltatások példájának telepítése
cd ../microservices
azd up
```

**Technológiák:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Kiskereskedelmi többügynökös megoldás](retail-scenario.md) 🆕
**Teljes gyártásra kész implementáció ebben a repozitóriumban**

- **Helyszín:** `examples/retail-multiagent-arm-template/`
- **Összetettség:** ⭐⭐⭐⭐ (Haladó)
- **Tartalom:**
  - Teljes ARM telepítési sablon
  - Többügynökös architektúra (Ügyfél + Készlet)
  - Azure OpenAI integráció
  - AI keresés RAG-gal
  - Átfogó monitoring
  - Egykattintásos telepítési szkript

**Gyors kezdés:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Technológiák:** Azure OpenAI, AI keresés, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Külső Azure Samples (Klónozásra kész)

Az alábbi példák hivatalos Azure-Samples repozitóriumokban találhatók. Klónozd őket, hogy különböző AZD mintákat fedezhess fel:

### Egyszerű alkalmazások (1-2. fejezet)

| Sablon | Repozitórium | Összetettség | Szolgáltatások |
|:-------|:-------------|:-------------|:---------------|
| **Python Flask API** | [Helyi: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Mikroszolgáltatások** | [Helyi: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Több szolgáltatás, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Hogyan használd:**
```bash
# Klónozz bármilyen példát
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Telepítés
azd up
```

### AI alkalmazás példák (2., 5., 8. fejezet)

| Sablon | Repozitórium | Összetettség | Fókusz |
|:-------|:-------------|:-------------|:-------|
| **Azure OpenAI Chat** | [Helyi: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | GPT-4 telepítés |
| **AI Chat Gyorsindító** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Alapvető AI chat |
| **AI Ügynökök** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Ügynök keretrendszer |
| **Keresés + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG minta |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Vállalati AI |

### Adatbázis és haladó minták (3-8. fejezet)

| Sablon | Repozitórium | Összetettség | Fókusz |
|:-------|:-------------|:-------------|:-------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Adatbázis integráció |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Mikroszolgáltatások** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Több szolgáltatás |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Tanulási célok

Ezeken a példákon keresztül:
- Gyakorolhatod az Azure Developer CLI munkafolyamatokat valós alkalmazási forgatókönyvekkel
- Megértheted az alkalmazásarchitektúrákat és azok azd implementációit
- Elsajátíthatod az infrastruktúra mintákat különböző Azure szolgáltatásokhoz
- Alkalmazhatod a konfigurációkezelést és környezet-specifikus telepítési stratégiákat
- Monitoring, biztonság és skálázási mintákat valós kontextusban alkalmazhatsz
- Tapasztalatot szerezhetsz a hibakeresésben és valós telepítési forgatókönyvek optimalizálásában

## Tanulási eredmények

A példák befejezése után képes leszel:
- Magabiztosan telepíteni különböző alkalmazástípusokat az Azure Developer CLI segítségével
- Az adott sablonokat saját alkalmazási igényeidhez igazítani
- Egyedi infrastruktúra mintákat tervezni és implementálni Bicep segítségével
- Összetett több szolgáltatásból álló alkalmazásokat konfigurálni megfelelő függőségekkel
- Biztonsági, monitoring és teljesítmény legjobb gyakorlatokat alkalmazni valós forgatókönyvekben
- Hibakeresni és optimalizálni telepítéseket gyakorlati tapasztalatok alapján

## Könyvtárstruktúra

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

## Gyors kezdés példák

> **💡 Új az AZD-ben?** Kezdd az 1. példával (Flask API) - kb. 20 percet vesz igénybe, és megtanítja az alapfogalmakat.

### Kezdőknek
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Helyi) ⭐  
   Egyszerű REST API telepítése skálázás nullára  
   **Idő:** 20-25 perc | **Költség:** $0-5/hó  
   **Amit megtanulsz:** Alapvető azd munkafolyamat, konténerizáció, egészségügyi ellenőrzések  
   **Várható eredmény:** Működő API végpont, amely "Hello, World!"-ot ad vissza monitoringgal

2. **[Egyszerű webalkalmazás - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Node.js Express webalkalmazás telepítése MongoDB-vel  
   **Idő:** 25-35 perc | **Költség:** $10-30/hó  
   **Amit megtanulsz:** Adatbázis integráció, környezeti változók, kapcsolati karakterláncok  
   **Várható eredmény:** Teendőlista alkalmazás létrehozás/olvasás/módosítás/törlés funkcióval

3. **[Statikus weboldal - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   React statikus weboldal hosztolása Azure Static Web Apps segítségével  
   **Idő:** 20-30 perc | **Költség:** $0-10/hó  
   **Amit megtanulsz:** Statikus hosztolás, szerver nélküli funkciók, CDN telepítés  
   **Várható eredmény:** React UI API háttérrel, automatikus SSL, globális CDN

### Középhaladóknak
4. **[Azure OpenAI Chat alkalmazás](../../../examples/azure-openai-chat)** (Helyi) ⭐⭐  
   GPT-4 telepítése chat interfésszel és biztonságos API kulcskezeléssel  
   **Idő:** 35-45 perc | **Költség:** $50-200/hó  
   **Amit megtanulsz:** Azure OpenAI telepítés, Key Vault integráció, token követés  
   **Várható eredmény:** Működő chat alkalmazás GPT-4-gyel és költségkövetéssel

5. **[Container App - Mikroszolgáltatások](../../../examples/container-app/microservices)** (Helyi) ⭐⭐⭐⭐  
   Gyártásra kész több szolgáltatásból álló architektúra  
   **Idő:** 45-60 perc | **Költség:** $50-150/hó  
   **Amit megtanulsz:** Szolgáltatás kommunikáció, üzenet sorok, elosztott nyomkövetés  
   **Várható eredmény:** 2-szolgáltatásos rendszer (API Gateway + Termék szolgáltatás) monitoringgal

6. **[Adatbázis alkalmazás - C# Azure SQL-lel](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Webalkalmazás C# API-val és Azure SQL adatbázissal  
   **Idő:** 30-45 perc | **Költség:** $20-80/hó  
   **Amit megtanulsz:** Entity Framework, adatbázis migrációk, kapcsolat biztonság  
   **Várható eredmény:** C# API Azure SQL háttérrel, automatikus séma telepítéssel

7. **[Szerver nélküli funkció - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions HTTP triggerrel és Cosmos DB-vel  
   **Idő:** 30-40 perc | **Költség:** $10-40/hó  
   **Amit megtanulsz:** Eseményvezérelt architektúra, szerver nélküli skálázás, NoSQL integráció  
   **Várható eredmény:** Funkció alkalmazás HTTP kérésekre válaszolva Cosmos DB tárolással

8. **[Mikroszolgáltatások - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Több szolgáltatásból álló Java alkalmazás Container Apps és API gateway segítségével  
   **Idő:** 60-90 perc | **Költség:** $80-200/hó  
   **Amit megtanulsz:** Spring Boot telepítés, szolgáltatás hálózat, terheléselosztás  
   **Várható eredmény:** Több szolgáltatásból álló Java rendszer szolgáltatás felfedezéssel és útválasztással

### Azure AI Foundry sablonok

1. **[Azure OpenAI Chat App - Helyi példa](../../../examples/azure-openai-chat)** ⭐⭐  
   Teljes GPT-4 telepítés chat interfésszel  
   **Idő:** 35-45 perc | **Költség:** $50-200/hó  
   **Várható eredmény:** Működő chat alkalmazás token követéssel és költségkövetéssel

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Intelligens chat alkalmazás RAG architektúrával  
   **Idő:** 60-90 perc | **Költség:** $100-300/hó  
   **Várható eredmény:** RAG-alapú chat interfész dokumentum kereséssel és hivatkozásokkal

3. **[AI Dokumentumfeldolgozás](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Dokumentumelemzés Azure AI szolgáltatásokkal  
   **Idő:** 40-60 perc | **Költség:** $20-80/hó  
   **Várható eredmény:** API, amely szöveget, táblázatokat és entitásokat nyer ki feltöltött dokumentumokból

4. **[Gépi tanulási pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps munkafolyamat Azure Machine Learning segítségével  
   **Idő:** 2-3 óra | **Költség:** $150-500/hó  
   **Várható eredmény:** Automatizált ML pipeline tréninggel, telepítéssel és monitoringgal

### Valós forgatókönyvek

#### **Kiskereskedelmi többügynökös megoldás** 🆕
**[Teljes implementációs útmutató](./retail-scenario.md)**

Átfogó, gyártásra kész többügynökös ügyfélszolgálati megoldás, amely bemutatja a vállalati szintű AI alkalmazás telepítést AZD-vel. Ez a forgatókönyv biztosítja:

-
- **Gyártási infrastruktúra**: Több régiót lefedő Azure OpenAI telepítések, AI keresés, Container Apps és átfogó monitorozás  
- **Készen álló ARM sablon**: Egykattintásos telepítés több konfigurációs móddal (Minimal/Standard/Premium)  
- **Fejlett funkciók**: Red teaming biztonsági validáció, ügynökértékelési keretrendszer, költségoptimalizálás és hibaelhárítási útmutatók  
- **Valós üzleti kontextus**: Kiskereskedelmi ügyfélszolgálati esettanulmány fájlfeltöltéssel, keresési integrációval és dinamikus skálázással  

**Technológiák**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API  

**Komplexitás**: ⭐⭐⭐⭐ (Haladó - Vállalati gyártásra kész)  

**Ideális**: AI fejlesztők, megoldás-architektek és gyártási többügynökös rendszereket építő csapatok számára  

**Gyors kezdés**: Telepítse a teljes megoldást 30 percen belül a mellékelt ARM sablon segítségével: `./deploy.sh -g myResourceGroup`  

## 📋 Használati útmutató  

### Előfeltételek  

Mielőtt bármelyik példát futtatná:  
- ✅ Azure előfizetés Tulajdonos vagy Hozzáférési jogokkal  
- ✅ Telepített Azure Developer CLI ([Telepítési útmutató](../docs/getting-started/installation.md))  
- ✅ Futtatott Docker Desktop (konténeres példákhoz)  
- ✅ Megfelelő Azure kvóták (ellenőrizze az egyes példák specifikus követelményeit)  

> **💰 Költségfigyelmeztetés:** Minden példa valós Azure erőforrásokat hoz létre, amelyek költségeket generálnak. Az egyes README fájlokban található költségbecslések. Ne felejtse el futtatni az `azd down` parancsot, ha végzett, hogy elkerülje a folyamatos költségeket.  

### Példák futtatása helyben  

1. **Példa klónozása vagy másolása**  
   ```bash
   # Navigáljon a kívánt példához
   cd examples/simple-web-app
   ```
  
2. **AZD környezet inicializálása**  
   ```bash
   # Inicializálás meglévő sablonnal
   azd init
   
   # Vagy hozz létre új környezetet
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
   # Szerezze be a szolgáltatási végpontokat
   azd env get-values
   
   # Tesztelje a végpontot (példa)
   curl https://your-app-url.azurecontainer.io/health
   ```
  
   **Várt sikeres jelek:**  
   - ✅ `azd up` hiba nélkül befejeződik  
   - ✅ A szolgáltatás végpontja HTTP 200-at ad vissza  
   - ✅ Az Azure Portál "Fut" állapotot mutat  
   - ✅ Az Application Insights telemetriai adatokat kap  

> **⚠️ Problémák?** Lásd: [Gyakori problémák](../docs/troubleshooting/common-issues.md) a telepítési hibaelhárításhoz  

### Példák testreszabása  

Minden példa tartalmazza:  
- **README.md** - Részletes beállítási és testreszabási útmutató  
- **azure.yaml** - AZD konfiguráció megjegyzésekkel  
- **infra/** - Bicep sablonok paramétermagyarázatokkal  
- **src/** - Mintaalkalmazás kód  
- **scripts/** - Segédszkriptek gyakori feladatokhoz  

## 🎯 Tanulási célok  

### Példakategóriák  

#### **Alapvető telepítések**  
- Egyszolgáltatásos alkalmazások  
- Egyszerű infrastruktúra minták  
- Alapvető konfigurációkezelés  
- Költséghatékony fejlesztési beállítások  

#### **Haladó forgatókönyvek**  
- Többszolgáltatásos architektúrák  
- Komplex hálózati konfigurációk  
- Adatbázis-integrációs minták  
- Biztonsági és megfelelőségi megvalósítások  

#### **Gyártásra kész minták**  
- Magas rendelkezésre állású konfigurációk  
- Monitorozás és megfigyelhetőség  
- CI/CD integráció  
- Katasztrófa utáni helyreállítási beállítások  

## 📖 Példák leírása  

### Egyszerű webalkalmazás - Node.js Express  
**Technológiák**: Node.js, Express, MongoDB, Container Apps  
**Komplexitás**: Kezdő  
**Koncepciók**: Alapvető telepítés, REST API, NoSQL adatbázis integráció  

### Statikus weboldal - React SPA  
**Technológiák**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Komplexitás**: Kezdő  
**Koncepciók**: Statikus hosztolás, szerver nélküli háttér, modern webfejlesztés  

### Konténeres alkalmazás - Python Flask  
**Technológiák**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Komplexitás**: Kezdő  
**Koncepciók**: Konténerizáció, REST API, nullára skálázás, egészségügyi próbák, monitorozás  
**Helyszín**: [Helyi példa](../../../examples/container-app/simple-flask-api)  

### Konténeres alkalmazás - Mikroszolgáltatások architektúra  
**Technológiák**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Komplexitás**: Haladó  
**Koncepciók**: Többszolgáltatásos architektúra, szolgáltatáskommunikáció, üzenetsorok, elosztott nyomkövetés  
**Helyszín**: [Helyi példa](../../../examples/container-app/microservices)  

### Adatbázis alkalmazás - C# Azure SQL-lel  
**Technológiák**: C# ASP.NET Core, Azure SQL Database, App Service  
**Komplexitás**: Középhaladó  
**Koncepciók**: Entity Framework, adatbázis-kapcsolatok, web API fejlesztés  

### Szerver nélküli funkció - Python Azure Functions  
**Technológiák**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Komplexitás**: Középhaladó  
**Koncepciók**: Eseményvezérelt architektúra, szerver nélküli számítás, teljes stack fejlesztés  

### Mikroszolgáltatások - Java Spring Boot  
**Technológiák**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Komplexitás**: Középhaladó  
**Koncepciók**: Mikroszolgáltatások kommunikációja, elosztott rendszerek, vállalati minták  

### Azure AI Foundry példák  

#### Azure OpenAI Chat App  
**Technológiák**: Azure OpenAI, Cognitive Search, App Service  
**Komplexitás**: Középhaladó  
**Koncepciók**: RAG architektúra, vektorkeresés, LLM integráció  

#### AI dokumentumfeldolgozás  
**Technológiák**: Azure AI Document Intelligence, Storage, Functions  
**Komplexitás**: Középhaladó  
**Koncepciók**: Dokumentumelemzés, OCR, adatkinyerés  

#### Gépi tanulási csővezeték  
**Technológiák**: Azure ML, MLOps, Container Registry  
**Komplexitás**: Haladó  
**Koncepciók**: Modelltréning, telepítési csővezetékek, monitorozás  

## 🛠 Konfigurációs példák  

A `configurations/` könyvtár újrahasználható komponenseket tartalmaz:  

### Környezeti konfigurációk  
- Fejlesztési környezet beállításai  
- Tesztkörnyezet konfigurációk  
- Gyártásra kész konfigurációk  
- Több régiót lefedő telepítési beállítások  

### Bicep modulok  
- Újrahasználható infrastruktúra komponensek  
- Gyakori erőforrás minták  
- Biztonságos sablonok  
- Költséghatékony konfigurációk  

### Segédszkriptek  
- Környezetbeállítás automatizálása  
- Adatbázis-migrációs szkriptek  
- Telepítési validációs eszközök  
- Költségfigyelő segédletek  

## 🔧 Testreszabási útmutató  

### Példák testreszabása saját felhasználásra  

1. **Előfeltételek áttekintése**  
   - Ellenőrizze az Azure szolgáltatási követelményeket  
   - Ellenőrizze az előfizetési korlátokat  
   - Értse meg a költségvonzatokat  

2. **Konfiguráció módosítása**  
   - Frissítse az `azure.yaml` szolgáltatásdefiníciókat  
   - Testreszabja a Bicep sablonokat  
   - Állítsa be a környezeti változókat  

3. **Alapos tesztelés**  
   - Először telepítse a fejlesztési környezetbe  
   - Ellenőrizze a funkcionalitást  
   - Tesztelje a skálázást és a teljesítményt  

4. **Biztonsági áttekintés**  
   - Ellenőrizze a hozzáférés-vezérléseket  
   - Valósítsa meg a titkok kezelését  
   - Engedélyezze a monitorozást és riasztásokat  

## 📊 Összehasonlító mátrix  

| Példa | Szolgáltatások | Adatbázis | Hitelesítés | Monitorozás | Komplexitás |  
|---------|----------|----------|------|------------|------------|  
| **Azure OpenAI Chat** (Helyi) | 2 | ❌ | Key Vault | Teljes | ⭐⭐ |  
| **Python Flask API** (Helyi) | 1 | ❌ | Alap | Teljes | ⭐ |  
| **Mikroszolgáltatások** (Helyi) | 5+ | ✅ | Vállalati | Haladó | ⭐⭐⭐⭐ |  
| Node.js Express Todo | 2 | ✅ | Alap | Alap | ⭐ |  
| React SPA + Functions | 3 | ✅ | Alap | Teljes | ⭐ |  
| Python Flask Container | 2 | ❌ | Alap | Teljes | ⭐ |  
| C# Web API + SQL | 2 | ✅ | Teljes | Teljes | ⭐⭐ |  
| Python Functions + SPA | 3 | ✅ | Teljes | Teljes | ⭐⭐ |  
| Java Mikroszolgáltatások | 5+ | ✅ | Teljes | Teljes | ⭐⭐ |  
| Azure OpenAI Chat | 3 | ✅ | Teljes | Teljes | ⭐⭐⭐ |  
| AI Dokumentumfeldolgozás | 2 | ❌ | Alap | Teljes | ⭐⭐ |  
| ML Pipeline | 4+ | ✅ | Teljes | Teljes | ⭐⭐⭐⭐ |  
| **Kiskereskedelmi többügynökös** (Helyi) | **8+** | **✅** | **Vállalati** | **Haladó** | **⭐⭐⭐⭐** |  

## 🎓 Tanulási útvonal  

### Ajánlott haladási sorrend  

1. **Kezdje az Egyszerű Webalkalmazással**  
   - Ismerje meg az alapvető AZD fogalmakat  
   - Értse meg a telepítési munkafolyamatot  
   - Gyakorolja a környezetkezelést  

2. **Próbálja ki a Statikus Weboldalt**  
   - Fedezze fel a különböző hosztolási lehetőségeket  
   - Ismerje meg a CDN integrációt  
   - Értse meg a DNS konfigurációt  

3. **Lépjen tovább a Konténeres Alkalmazásra**  
   - Ismerje meg a konténerizáció alapjait  
   - Értse meg a skálázási koncepciókat  
   - Gyakorolja a Docker használatát  

4. **Adjon hozzá Adatbázis Integrációt**  
   - Ismerje meg az adatbázis-telepítést  
   - Értse meg a kapcsolati karakterláncokat  
   - Gyakorolja a titkok kezelését  

5. **Fedezze fel a Szerver nélküli megoldásokat**  
   - Értse meg az eseményvezérelt architektúrát  
   - Ismerje meg a triggerek és kötődések működését  
   - Gyakorolja az API-k használatát  

6. **Építsen Mikroszolgáltatásokat**  
   - Ismerje meg a szolgáltatáskommunikációt  
   - Értse meg az elosztott rendszereket  
   - Gyakorolja a komplex telepítéseket  

## 🔍 A megfelelő példa megtalálása  

### Technológiai stack alapján  
- **Container Apps**: [Python Flask API (Helyi)](../../../examples/container-app/simple-flask-api), [Mikroszolgáltatások (Helyi)](../../../examples/container-app/microservices), Java Mikroszolgáltatások  
- **Node.js**: Node.js Express Todo App, [Mikroszolgáltatások API Gateway (Helyi)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (Helyi)](../../../examples/container-app/simple-flask-api), [Mikroszolgáltatások Product Service (Helyi)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [Mikroszolgáltatások Order Service (Helyi)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline  
- **Go**: [Mikroszolgáltatások User Service (Helyi)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot Mikroszolgáltatások  
- **React**: React SPA + Functions  
- **Konténerek**: [Python Flask (Helyi)](../../../examples/container-app/simple-flask-api), [Mikroszolgáltatások (Helyi)](../../../examples/container-app/microservices), Java Mikroszolgáltatások  
- **Adatbázisok**: [Mikroszolgáltatások (Helyi)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **AI/ML**: **[Azure OpenAI Chat (Helyi)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Dokumentumfeldolgozás, ML Pipeline, **Kiskereskedelmi többügynökös megoldás**  
- **Többügynökös rendszerek**: **Kiskereskedelmi többügynökös megoldás**  
- **OpenAI integráció**: **[Azure OpenAI Chat (Helyi)](../../../examples/azure-openai-chat)**, Kiskereskedelmi többügynökös megoldás  
- **Vállalati gyártás**: [Mikroszolgáltatások (Helyi)](../../../examples/container-app/microservices), **Kiskereskedelmi többügynökös megoldás**  

### Architektúra minta alapján  
- **Egyszerű REST API**: [Python Flask API (Helyi)](../../../examples/container-app/simple-flask-api)  
- **Monolitikus**: Node.js Express Todo, C# Web API + SQL  
- **Statikus + Szerver nélküli**: React SPA + Functions, Python Functions + SPA  
- **Mikroszolgáltatások**: [Gyártási Mikroszolgáltatások (Helyi)](../../../examples/container-app/microservices), Java Spring Boot Mikroszolgáltatások  
- **Konténerizált**: [Python Flask (Helyi)](../../../examples/container-app/simple-flask-api), [Mikroszolgáltatások (Helyi)](../../../examples/container-app/microservices)  
- **AI-alapú**: **[Azure OpenAI Chat (Helyi)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Dokumentumfeldolgozás, ML Pipeline, **Kiskereskedelmi többügynökös megoldás**  
- **Többügynökös architektúra**: **Kiskereskedelmi többügynökös megoldás**  
- **Vállalati több szolgáltatásos**: [Mikroszolgáltatások (Helyi)](../../../examples/container-app/microservices), **Kiskereskedelmi többügynökös megoldás**  

### Komplexitási szint alapján  
- **Kezdő**: [Python Flask API (Helyi)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **Középhaladó**: **[Azure OpenAI Chat (Helyi)](azure-openai
- [Todo App Node.js és PostgreSQL használatával](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web App C# API-val](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions Java-val](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Legjobb gyakorlatok
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Példák hozzájárulása

Van egy hasznos példád, amit megosztanál? Örömmel fogadjuk a hozzájárulásokat!

### Beküldési irányelvek
1. Kövesd a meglévő könyvtárstruktúrát
2. Mellékelj részletes README.md fájlt
3. Adj hozzá megjegyzéseket a konfigurációs fájlokhoz
4. Alaposan teszteld le beküldés előtt
5. Tüntesd fel a költségbecsléseket és előfeltételeket

### Példa sablon struktúra
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

**Profi tipp**: Kezdd a legegyszerűbb példával, amely megfelel a technológiai stack-ednek, majd fokozatosan haladj bonyolultabb forgatókönyvek felé. Minden példa az előzőekben bemutatott koncepciókra épül!

## 🚀 Készen állsz a kezdésre?

### Tanulási útvonalad

1. **Teljesen kezdő vagy?** → Kezdd a [Flask API](../../../examples/container-app/simple-flask-api) példával (⭐, 20 perc)
2. **Van alapvető AZD ismereted?** → Próbáld ki a [Microservices](../../../examples/container-app/microservices) példát (⭐⭐⭐⭐, 60 perc)
3. **AI alkalmazásokat építesz?** → Kezdd az [Azure OpenAI Chat](../../../examples/azure-openai-chat) példával (⭐⭐, 35 perc), vagy fedezd fel a [Retail Multi-Agent](retail-scenario.md) példát (⭐⭐⭐⭐, 2+ óra)
4. **Specifikus technológiai stack-re van szükséged?** → Használd a [Megfelelő példa megtalálása](../../../examples) szekciót fentebb

### Következő lépések

- ✅ Tekintsd át a [Előfeltételek](../../../examples) szekciót fentebb
- ✅ Válassz egy példát, amely megfelel a tudásszintednek (lásd [Komplexitás jelölés](../../../examples))
- ✅ Olvasd el alaposan a példa README fájlját telepítés előtt
- ✅ Állíts be emlékeztetőt az `azd down` futtatására tesztelés után
- ✅ Oszd meg tapasztalataidat GitHub Issues vagy Discussions segítségével

### Segítségre van szükséged?

- 📖 [GYIK](../resources/faq.md) - Gyakran ismételt kérdések
- 🐛 [Hibaelhárítási útmutató](../docs/troubleshooting/common-issues.md) - Telepítési problémák megoldása
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Kérdezz a közösségtől
- 📚 [Tanulási útmutató](../resources/study-guide.md) - Erősítsd meg tudásodat

---

**Navigáció**
- **📚 Kurzus kezdőlapja**: [AZD Kezdőknek](../README.md)
- **📖 Tananyagok**: [Tanulási útmutató](../resources/study-guide.md) | [Cheat Sheet](../resources/cheat-sheet.md) | [Szószedet](../resources/glossary.md)
- **🔧 Erőforrások**: [GYIK](../resources/faq.md) | [Hibaelhárítás](../docs/troubleshooting/common-issues.md)

---

*Utolsó frissítés: 2025. november | [Hibák jelentése](https://github.com/microsoft/AZD-for-beginners/issues) | [Példák hozzájárulása](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Felelősség kizárása**:  
Ez a dokumentum az [Co-op Translator](https://github.com/Azure/co-op-translator) AI fordítási szolgáltatás segítségével lett lefordítva. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Fontos információk esetén javasolt professzionális emberi fordítást igénybe venni. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely a fordítás használatából eredhet.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->