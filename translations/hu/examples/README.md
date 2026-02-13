# Példák - Gyakorlati AZD sablonok és konfigurációk

**Tanulás példán keresztül - fejezetek szerint rendezve**
- **📚 Kurzus kezdőlap**: [AZD kezdőknek](../README.md)
- **📖 Fejezet térkép**: Példák a tanulási nehézség szerint rendezve
- **🚀 Helyi példa**: [Kiskereskedelmi többügynökös megoldás](retail-scenario.md)
- **🤖 Külső AI példák**: Hivatkozások Azure Samples adattárakra

> **📍 FONTOS: Helyi vs Külső példák**  
> Ez a tárház **4 teljes helyi példát** tartalmaz teljes implementációkkal:  
> - **Azure OpenAI Chat** (GPT-4 üzembe helyezés chat felülettel)  
> - **Container Apps** (Egyszerű Flask API + Mikroszolgáltatások)  
> - **Adatbázisos alkalmazás** (Web + SQL adatbázis)  
> - **Kiskereskedelmi többügynök** (Vállalati AI megoldás)  
>  
> További példák **külső hivatkozások** az Azure-Samples adattárakra, amelyeket klónozhatsz.

## Bevezetés

Ez a könyvtár gyakorlati példákat és hivatkozásokat kínál, hogy segítse az Azure Developer CLI elsajátítását gyakorlati példákon keresztül. A Kiskereskedelmi többügynökös forgatókönyv egy teljes, gyártásra kész implementáció, amely megtalálható ebben a tárházban. További példák hivatalos Azure Samples referencia implementációkra mutatnak, amelyek különböző AZD mintákat mutatnak be.

### Bonyolultsági szintek

- ⭐ **Kezdő** - Alapfogalmak, egy szolgáltatás, 15-30 perc
- ⭐⭐ **Középhaladó** - Több szolgáltatás, adatbázis integráció, 30-60 perc
- ⭐⭐⭐ **Haladó** - Összetett architektúra, AI integráció, 1-2 óra
- ⭐⭐⭐⭐ **Szakértő** - Gyártásra kész, vállalati minták, 2+ óra

## 🎯 Mi található ebben a tárban

### ✅ Helyi implementáció (azonnal használható)

#### [Azure OpenAI Chat alkalmazás](azure-openai-chat/README.md) 🆕  
**Teljes GPT-4 üzembe helyezés chat felülettel, benne ebben a tárban**

- **Hely:** `examples/azure-openai-chat/`
- **Bonyolultság:** ⭐⭐ (Középhaladó)
- **Tartalom:**
  - Teljes Azure OpenAI üzembe helyezés (GPT-4)
  - Python parancssoros chat felület
  - Key Vault integráció biztonságos API kulcsokhoz
  - Bicep infrastruktúra sablonok
  - Token használat és költség nyomon követés
  - Korlátozás és hibakezelés

**Gyors kezdés:**  
```bash
# Navigálás a példához
cd examples/azure-openai-chat

# Minden telepítése
azd up

# Függőségek telepítése és csevegés indítása
pip install -r src/requirements.txt
python src/chat.py
```
  
**Technológiák:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Container App példák](container-app/README.md) 🆕  
**Átfogó konténer telepítési példák ebben a tárban**

- **Hely:** `examples/container-app/`
- **Bonyolultság:** ⭐-⭐⭐⭐⭐ (Kezdő - Haladó)
- **Tartalom:**
  - [Mester útmutató](container-app/README.md) - Átfogó konténer telepítési áttekintés
  - [Egyszerű Flask API](../../../examples/container-app/simple-flask-api) - Alap REST API példa
  - [Mikroszolgáltatások architektúra](../../../examples/container-app/microservices) - Gyártásra kész több szolgáltatásos telepítés
  - Gyors kezdés, gyártás, haladó minták
  - Monitorozás, biztonság és költség optimalizálás

**Gyors kezdés:**  
```bash
# Fő útmutató megtekintése
cd examples/container-app

# Egyszerű Flask API telepítése
cd simple-flask-api
azd up

# Mikroszolgáltatások példa telepítése
cd ../microservices
azd up
```
  
**Technológiák:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Kiskereskedelmi többügynökös megoldás](retail-scenario.md) 🆕  
**Teljes gyártásra kész implementáció ebben a tárban**

- **Hely:** `examples/retail-multiagent-arm-template/`
- **Bonyolultság:** ⭐⭐⭐⭐ (Haladó)
- **Tartalom:**
  - Teljes ARM telepítő sablon
  - Többügynök architektúra (Ügyfél + Készlet)
  - Azure OpenAI integráció
  - AI Keresés RAG-mintával
  - Átfogó monitorozás
  - Egykattintásos telepítő script

**Gyors kezdés:**  
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```
  
**Technológiák:** Azure OpenAI, AI keresés, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Külső Azure Samples (Klónozd a használathoz)

A következő példák hivatalos Azure-Samples adattárakban találhatók. Klónozd őket a különböző AZD minták megismeréséhez:

### Egyszerű alkalmazások (1-2. fejezet)

| Sablon | Adattár | Bonyolultság | Szolgáltatások |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Helyi: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Mikroszolgáltatások** | [Helyi: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Több szolgáltatás, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask konténer** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Használati útmutató:**  
```bash
# Bármely példány klónozása
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Telepítés
azd up
```
  
### AI alkalmazás példák (2., 5., 8. fejezet)

| Sablon | Adattár | Bonyolultság | Fókusz |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI Chat** | [Helyi: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | GPT-4 üzembe helyezés |
| **AI Chat Gyorsstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Alap AI chat |
| **AI Ügynökök** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Ügynök keretrendszer |
| **Keresés + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG minta |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Vállalati AI |

### Adatbázis & haladó minták (3-8. fejezet)

| Sablon | Adattár | Bonyolultság | Fókusz |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Adatbázis integráció |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL szerver nélküli |
| **Java Mikroszolgáltatások** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Több szolgáltatás |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Tanulási célok

Ezeknek a példáknak a megoldásával:  
- Gyakorolhatod az Azure Developer CLI munkafolyamatait valós alkalmazási forgatókönyveken keresztül  
- Megérted a különböző alkalmazás architektúrákat és azok azd implementációit  
- Mesteri szintre jutsz a különböző Azure szolgáltatások infrastruktúra kód mintáinak alkalmazásában  
- Megismered a konfigurációkezelést és a környezet specifikus telepítési stratégiákat  
- Képes leszel monitorozási, biztonsági és skálázási minták megvalósítására gyakorlati környezetben  
- Tapasztalatot szerzel a hibakeresés és diagnosztika terén valós telepítési forgatókönyvekben

## Tanulási eredmények

Ezeknek a példáknak a befejeztével képes leszel:  
- Magabiztosan telepíteni különféle alkalmazás típusokat az Azure Developer CLI segítségével  
- Az itt található sablonokat saját alkalmazás igényeidhez alakítani  
- Egyedi infrastruktúra mintákat tervezni és implementálni Bicep használatával  
- Összetett több szolgáltatásos alkalmazásokat megfelelő függőségek konfigurálásával telepíteni  
- Biztonsági, monitorozási és teljesítmény optimalizálási legjobb gyakorlatokat alkalmazni  
- Gyakorlatias tapasztalatok alapján hibákat elhárítani és telepítéseket optimalizálni

## Könyvtár felépítés

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
  
## Gyors kezdési példák

> **💡 Új vagy az AZD-ben?** Kezdd az 1. példával (Flask API) - kb. 20 perc alatt megtanulod az alapokat.

### Kezdőknek
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Helyi) ⭐  
   Egyszerű REST API telepítés scale-to-zero funkcióval  
   **Idő:** 20-25 perc | **Költség:** 0-5 USD/hó  
   **Tanulási cél:** alap azd munkafolyamat, konténerizáció, egészség ellenőrzések  
   **Várt eredmény:** működő API végpont "Hello, World!" válasszal monitorozással

2. **[Egyszerű webalkalmazás - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Node.js Express webalkalmazás telepítés MongoDB-vel  
   **Idő:** 25-35 perc | **Költség:** 10-30 USD/hó  
   **Tanulási cél:** adatbázis integráció, környezeti változók, kapcsolati stringek  
   **Várt eredmény:** teendők listázó alkalmazás létrehozás/olvasás/frissítés/törlés funkcióval

3. **[Statikus weboldal - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   React statikus weboldal hosztolása Azure Static Web Apps-el  
   **Idő:** 20-30 perc | **Költség:** 0-10 USD/hó  
   **Tanulási cél:** statikus hoszting, szerver nélküli függvények, CDN telepítés  
   **Várt eredmény:** React UI API háttérrel, automatikus SSL, globális CDN

### Középhaladóknak
4. **[Azure OpenAI Chat alkalmazás](../../../examples/azure-openai-chat)** (Helyi) ⭐⭐  
   GPT-4 telepítése chates felülettel és biztonságos API kulcs kezeléssel  
   **Idő:** 35-45 perc | **Költség:** 50-200 USD/hó  
   **Tanulási cél:** Azure OpenAI telepítés, Key Vault integráció, token követés  
   **Várt eredmény:** működő chat alkalmazás GPT-4-gyel és költségkövetéssel

5. **[Container App - Mikroszolgáltatások](../../../examples/container-app/microservices)** (Helyi) ⭐⭐⭐⭐  
   Gyártásra kész több szolgáltatásos architektúra  
   **Idő:** 45-60 perc | **Költség:** 50-150 USD/hó  
   **Tanulási cél:** szolgáltatás közti kommunikáció, üzenetsor, elosztott követés  
   **Várt eredmény:** 2 szolgáltatásos rendszer (API Gateway + Termék szolgáltatás) monitorozással

6. **[Adatbázisos alkalmazás - C# Azure SQL-lel](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Webalkalmazás C# API-val és Azure SQL adatbázissal  
   **Idő:** 30-45 perc | **Költség:** 20-80 USD/hó  
   **Tanulási cél:** Entity Framework, adatbázis migrációk, kapcsolatbiztonság  
   **Várt eredmény:** C# API Azure SQL háttérrel, automatikus séma telepítés

7. **[Serverless funkció - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions HTTP triggerrel és Cosmos DB integrációval  
   **Idő:** 30-40 perc | **Költség:** 10-40 USD/hó  
   **Tanulási cél:** eseményvezérelt architektúra, szerver nélküli skálázás, NoSQL integráció  
   **Várt eredmény:** HTTP kérdésekre válaszoló funkció app Cosmos DB tárolással

8. **[Mikroszolgáltatások - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Több szolgáltatásos Java alkalmazás Container Apps-el és API gateway-jel  
   **Idő:** 60-90 perc | **Költség:** 80-200 USD/hó  
   **Tanulási cél:** Spring Boot telepítés, szolgáltatás háló, terheléselosztás  
   **Várt eredmény:** több szolgáltatásos Java rendszer szolgáltatás felfedezéssel és routinggal

### Microsoft Foundry sablonok

1. **[Azure OpenAI Chat App - helyi példa](../../../examples/azure-openai-chat)** ⭐⭐  
   Teljes GPT-4 telepítés chat felülettel  
   **Idő:** 35-45 perc | **Költség:** 50-200 USD/hó  
   **Várt eredmény:** működő chat alkalmazás token követéssel és költség monitorozással

2. **[Azure Search + OpenAI demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Intelligens chat alkalmazás RAG architektúrával  
   **Idő:** 60-90 perc | **Költség:** 100-300 USD/hó  
   **Várt eredmény:** RAG vezérelt chat felület dokumentum kereséssel és hivatkozásokkal

3. **[AI Dokumentum feldolgozás](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Dokumentumelemzés Azure AI szolgáltatásokkal  
   **Idő:** 40-60 perc | **Költség:** 20-80 USD/hó  
   **Várt eredmény:** API szöveg, táblázatok és entitások kinyerésére feltöltött dokumentumokból

4. **[Gépi tanulási pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps munkafolyamat Azure Machine Learninggel  
   **Idő:** 2-3 óra | **Költség:** 150-500 USD/hó  
   **Várt eredmény:** automatizált ML pipeline tanítással, telepítéssel és monitorozással

### Valós forgatókönyvek

#### **Kiskereskedelmi többügynökös megoldás** 🆕  
**[Teljes implementációs útmutató](./retail-scenario.md)**

Átfogó, gyártásra kész többügynökös ügyféltámogatási megoldás, amely vállalati szintű AI alkalmazás telepítést mutat be az AZD használatával. Ez a forgatókönyv tartalmazza:

- **Teljes architektúra**: Többügynökös rendszer speciális ügyfélszolgálati és készletkezelő ügynökökkel
- **Termelési infrastruktúra**: Több régiós Azure OpenAI telepítések, AI Keresés, Konténeralkalmazások és átfogó monitorozás
- **Kész Telepíthető ARM-sablon**: Egykattintásos telepítés több konfigurációs móddal (Minimális/Standard/Prémium)
- **Fejlett funkciók**: Red teaming biztonsági validáció, ügynökértékelési keretrendszer, költségoptimalizálás és hibakeresési útmutatók
- **Valós Üzleti Kontextus**: Kiskereskedelmi ügyfélszolgálati eset fájlfeltöltéssel, keresés integrációval és dinamikus skálázással

**Technológiák**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Keresés, Konténeralkalmazások, Cosmos DB, Application Insights, Dokumentumintelligencia, Bing Keresés API

**Bonyolultság**: ⭐⭐⭐⭐ (Fejlett – Vállalati Termelésre Kész)

**Tökéletes:** AI fejlesztőknek, megoldásarchitekteknek és csapatoknak, akik termelési többügynökös rendszereket építenek

**Gyors kezdés**: Telepítse a teljes megoldást 30 percen belül a mellékelt ARM-sablonnal a `./deploy.sh -g myResourceGroup` paranccsal

## 📋 Használati útmutató

### Előfeltételek

Bármely példa futtatása előtt:
- ✅ Azure előfizetés Tulajdonosi vagy Közreműködői hozzáféréssel
- ✅ Azure Developer CLI telepítve ([Telepítési Útmutató](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop fut (konténer példákhoz)
- ✅ Megfelelő Azure kvóták (ellenőrizze a példa specifikus követelményeket)

> **💰 Költség Figyelmeztetés:** Minden példa valós Azure erőforrásokat hoz létre, amelyek költséget generálnak. Lásd a külön README fájlokat a költségbecslésekhez. A folyamatos költségek elkerülése érdekében futtassa az `azd down` parancsot a befejezés után.

### Példák helyi futtatása

1. **Klónozza vagy másolja a példát**  
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
   # Szolgáltatás végpontjainak lekérése
   azd env get-values
   
   # Végpont tesztelése (példa)
   curl https://your-app-url.azurecontainer.io/health
   ```
  
   **Várt sikeres eredmények:**  
   - ✅ `azd up` hibamentesen lefut  
   - ✅ Szolgáltatás végpont HTTP 200-at ad vissza  
   - ✅ Azure Portal "Futásban" állapotot mutat  
   - ✅ Application Insights telemetria adatokat fogad  

> **⚠️ Probléma?** Lásd: [Gyakori Problémák](../docs/chapter-07-troubleshooting/common-issues.md) a telepítési hibák elhárításához

### Példák testreszabása

Minden példa tartalmaz:
- **README.md** – Részletes telepítési és testreszabási útmutató  
- **azure.yaml** – AZD konfiguráció kommentekkel  
- **infra/** – Bicep sablonok paraméter magyarázatokkal  
- **src/** – Minta alkalmazáskód  
- **scripts/** – Segédszkriptek gyakori feladatokhoz  

## 🎯 Tanulási célok

### Példa kategóriák

#### **Alap telepítések**  
- Egyszolgáltatásos alkalmazások  
- Egyszerű infrastruktúra minták  
- Alap konfigurációkezelés  
- Költséghatékony fejlesztési környezetek  

#### **Fejlett forgatókönyvek**  
- Többszolgáltatásos architektúrák  
- Összetett hálózati konfigurációk  
- Adatbázisintegrációs minták  
- Biztonsági és megfelelőségi megvalósítások  

#### **Termelésre kész minták**  
- Magas rendelkezésre állás beállítások  
- Monitorozás és megfigyelhetőség  
- CI/CD integráció  
- Katasztrófa utáni helyreállítási beállítások  

## 📖 Példa leírások

### Egyszerű Webalkalmazás - Node.js Express  
**Technológiák**: Node.js, Express, MongoDB, Konténeralkalmazások  
**Bonyolultság**: Kezdő  
**Koncepciók**: Alap telepítés, REST API, NoSQL adatbázsintegráció  

### Statikus Weboldal - React SPA  
**Technológiák**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Bonyolultság**: Kezdő  
**Koncepciók**: Statikus hoszting, szerver nélküli háttér, modern webfejlesztés  

### Konténeralkalmazás - Python Flask  
**Technológiák**: Python Flask, Docker, Konténeralkalmazások, Konténerregisztráció, Application Insights  
**Bonyolultság**: Kezdő  
**Koncepciók**: Konténerizáció, REST API, skálázás nullára, egészségvizsgálatok, monitorozás  
**Hely**: [Helyi példa](../../../examples/container-app/simple-flask-api)  

### Konténeralkalmazás - Mikroservices architektúra  
**Technológiák**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Konténeralkalmazások  
**Bonyolultság**: Fejlett  
**Koncepciók**: Többszolgáltatásos architektúra, szolgáltatáskommunikáció, üzenet sorban állítás, elosztott nyomkövetés  
**Hely**: [Helyi példa](../../../examples/container-app/microservices)  

### Adatbázis alkalmazás - C# Azure SQL-lel  
**Technológiák**: C# ASP.NET Core, Azure SQL Adatbázis, App Service  
**Bonyolultság**: Középhaladó  
**Koncepciók**: Entity Framework, adatbázis kapcsolatok, web API fejlesztés  

### Szerver nélküli függvény - Python Azure Functions  
**Technológiák**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Bonyolultság**: Középhaladó  
**Koncepciók**: Eseményvezérelt architektúra, szerver nélküli számítás, full-stack fejlesztés  

### Mikroservices - Java Spring Boot  
**Technológiák**: Java Spring Boot, Konténeralkalmazások, Service Bus, API Gateway  
**Bonyolultság**: Középhaladó  
**Koncepciók**: Mikroservices kommunikáció, elosztott rendszerek, vállalati minták  

### Microsoft Foundry példák

#### Azure OpenAI Csevegőalkalmazás  
**Technológiák**: Azure OpenAI, Cognitive Search, App Service  
**Bonyolultság**: Középhaladó  
**Koncepciók**: RAG architektúra, vektoros keresés, LLM integráció  

#### AI Dokumentumfeldolgozás  
**Technológiák**: Azure AI Dokumentumintelligencia, Tárolás, Functions  
**Bonyolultság**: Középhaladó  
**Koncepciók**: Dokumentumelemzés, OCR, adatkinyerés  

#### Gépi tanulási adatfolyam  
**Technológiák**: Azure ML, MLOps, Konténerregisztráció  
**Bonyolultság**: Fejlett  
**Koncepciók**: Modell tanítás, telepítési adatfolyamok, monitorozás  

## 🛠 Konfigurációs példák

A `configurations/` mappa újrafelhasználható komponenseket tartalmaz:

### Környezet konfigurációk  
- Fejlesztési környezet beállítások  
- Teszt környezet konfigurációk  
- Termelésre kész konfigurációk  
- Több régiós telepítési beállítások  

### Bicep modulok  
- Újrafelhasználható infrastruktúra komponensek  
- Általános erőforrás minták  
- Biztonságos sablonok  
- Költségoptimalizált konfigurációk  

### Segédszkriptek  
- Környezeti beállítás automatizálás  
- Adatbázis migrációs szkriptek  
- Telepítés érvényesítő eszközök  
- Költségfigyelő eszközök  

## 🔧 Testreszabási útmutató

### Példák adaptálása az Ön használati esetéhez

1. **Előfeltételek felülvizsgálata**  
   - Ellenőrizze az Azure szolgáltatás követelményeket  
   - Ellenőrizze az előfizetés korlátait  
   - Ismerje meg a költségimpaktot  

2. **Konfiguráció módosítása**  
   - Frissítse az `azure.yaml` szolgáltatás definíciókat  
   - Testreszabja a Bicep sablonokat  
   - Állítsa be a környezeti változókat  

3. **Alapos tesztelés**  
   - Először telepítsen a fejlesztői környezetbe  
   - Érvényesítse a funkciókat  
   - Tesztelje a skálázást és a teljesítményt  

4. **Biztonsági áttekintés**  
   - Vizsgálja felül a hozzáférésvezérlést  
   - Valósítsa meg a titkok kezelését  
   - Engedélyezze a monitorozást és riasztásokat  

## 📊 Összehasonlító mátrix

| Példa | Szolgáltatások | Adatbázis | Hitelesítés | Monitorozás | Bonyolultság |
|---------|--------------|-----------|-------------|-------------|--------------|
| **Azure OpenAI Chat** (Helyi) | 2 | ❌ | Key Vault | Teljes | ⭐⭐ |
| **Python Flask API** (Helyi) | 1 | ❌ | Alap | Teljes | ⭐ |
| **Microservices** (Helyi) | 5+ | ✅ | Vállalati | Fejlett | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Alap | Alap | ⭐ |
| React SPA + Functions | 3 | ✅ | Alap | Teljes | ⭐ |
| Python Flask Konténer | 2 | ❌ | Alap | Teljes | ⭐ |
| C# Web API + SQL | 2 | ✅ | Teljes | Teljes | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Teljes | Teljes | ⭐⭐ |
| Java Mikroservices | 5+ | ✅ | Teljes | Teljes | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Teljes | Teljes | ⭐⭐⭐ |
| AI Dokumentumfeldolgozás | 2 | ❌ | Alap | Teljes | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Teljes | Teljes | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Helyi) | **8+** | **✅** | **Vállalati** | **Fejlett** | **⭐⭐⭐⭐** |

## 🎓 Tanulási útvonal

### Ajánlott sorrend

1. **Kezdje egyszerű webalkalmazással**  
   - Tanulja meg az alap AZD fogalmakat  
   - Értse meg a telepítési munkafolyamatot  
   - Gyakorolja a környezet kezelését  

2. **Próbálja ki a statikus weboldalt**  
   - Fedezze fel a különböző hoszting lehetőségeket  
   - Ismerje meg a CDN integrációt  
   - Értse meg a DNS konfigurációt  

3. **Lépjen a konténeralkalmazáshoz**  
   - Tanulja meg a konténerizáció alapjait  
   - Értse meg a skálázási koncepciókat  
   - Gyakoroljon Dockerrel  

4. **Adjon hozzá adatbázisintegrációt**  
   - Tanulja meg az adatbázis kihelyezést  
   - Értse meg a kapcsolati karakterláncokat  
   - Gyakorolja a titkok kezelését  

5. **Fedezze fel a szerver nélküli megoldásokat**  
   - Értse meg az eseményvezérelt architektúrát  
   - Tanuljon a trigger-ekről és kötésekről  
   - Gyakoroljon API-kkal  

6. **Építsen mikroservices rendszert**  
   - Tanulja meg a szolgáltatáskommunikációt  
   - Értse meg az elosztott rendszereket  
   - Gyakorolja az összetett telepítéseket  

## 🔍 Megfelelő példa megtalálása

### Technológiai stáb szerint
- **Konténeralkalmazások**: [Python Flask API (Helyi)](../../../examples/container-app/simple-flask-api), [Microservices (Helyi)](../../../examples/container-app/microservices), Java Mikroservices  
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Helyi)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (Helyi)](../../../examples/container-app/simple-flask-api), [Microservices Termék Szolgáltatás (Helyi)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [Microservices Rendelés Szolgáltatás (Helyi)](../../../examples/container-app/microservices), C# Web API + SQL Adatbázis, Azure OpenAI Chat App, ML Pipeline  
- **Go**: [Microservices Felhasználói Szolgáltatás (Helyi)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot Mikroservices  
- **React**: React SPA + Functions  
- **Konténerek**: [Python Flask (Helyi)](../../../examples/container-app/simple-flask-api), [Microservices (Helyi)](../../../examples/container-app/microservices), Java Mikroservices  
- **Adatbázisok**: [Microservices (Helyi)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **AI/ML**: **[Azure OpenAI Chat (Helyi)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Dokumentumfeldolgozás, ML Pipeline, **Kiskereskedelmi Többügynökös Megoldás**  
- **Többügynökös rendszerek**: **Kiskereskedelmi Többügynökös Megoldás**  
- **OpenAI integráció**: **[Azure OpenAI Chat (Helyi)](../../../examples/azure-openai-chat)**, Kiskereskedelmi Többügynökös Megoldás  
- **Vállalati termelés**: [Microservices (Helyi)](../../../examples/container-app/microservices), **Kiskereskedelmi Többügynökös Megoldás**  

### Architektúra minta szerint
- **Egyszerű REST API**: [Python Flask API (Helyi)](../../../examples/container-app/simple-flask-api)  
- **Monolitikus**: Node.js Express Todo, C# Web API + SQL  
- **Statikus + szerver nélküli**: React SPA + Functions, Python Functions + SPA  
- **Mikroservices**: [Termelési Mikroservices (Helyi)](../../../examples/container-app/microservices), Java Spring Boot Mikroservices  
- **Konténerizált**: [Python Flask (Helyi)](../../../examples/container-app/simple-flask-api), [Microservices (Helyi)](../../../examples/container-app/microservices)  
- **AI-vezérelt**: **[Azure OpenAI Chat (Helyi)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Dokumentumfeldolgozás, ML Pipeline, **Kiskereskedelmi Többügynökös Megoldás**  
- **Többügynökös architektúra**: **Kiskereskedelmi Többügynökös Megoldás**  
- **Vállalati többszolgáltatásos**: [Microservices (Helyi)](../../../examples/container-app/microservices), **Kiskereskedelmi Többügynökös Megoldás**  

### Bonyolultsági szint szerint
- **Kezdő**: [Python Flask API (Helyi)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **Középhaladó**: **[Azure OpenAI Chat (Helyi)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Mikroservices, Azure OpenAI Chat App, AI Dokumentumfeldolgozás  
- **Fejlett**: ML Pipeline  
- **Vállalati termelésre kész**: [Microservices (Helyi)](../../../examples/container-app/microservices) (Többszolgáltatásos üzenetsorral), **Kiskereskedelmi Többügynökös Megoldás** (Teljes többügynökös rendszer ARM sablon telepítéssel)  

## 📚 További források

### Dokumentációs linkek  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Microsoft Foundry AZD Sablonok](https://github.com/Azure/ai-foundry-templates)  
- [Bicep dokumentáció](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure Architektúra Központ](https://learn.microsoft.com/en-us/azure/architecture/)  

### Közösségi példák  
- [Azure Samples AZD Sablonok](https://github.com/Azure-Samples/azd-templates)  
- [Microsoft Foundry Sablonok](https://github.com/Azure/ai-foundry-templates)  
- [Azure Developer CLI Galéria](https://azure.github.io/awesome-azd/)  
- [Todo App C#-ral és Azure SQL-lel](https://github.com/Azure-Samples/todo-csharp-sql)  
- [Todo App Pythonnal és MongoDB-vel](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo alkalmazás Node.js-sel és PostgreSQL-lel](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React webalkalmazás C# API-val](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Feladat](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions Java-val](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Legjobb Gyakorlatok
- [Azure Well-Architected Keretrendszer](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Keretrendszer](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Példák Hozzájárulása

Van hasznos példád, amit megosztanál? Örömmel fogadjuk a hozzájárulásokat!

### Beküldési Irányelvek
1. Kövesd a kialakított könyvtárstruktúrát
2. Tartalmazzon átfogó README.md fájlt
3. Kommentáld a konfigurációs fájlokat
4. Alaposan tesztelj beküldés előtt
5. Foglald bele a költségbecslést és előfeltételeket

### Példa Sablon Struktúra
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

**Pro Tipp**: Kezdd a legegyszerűbb példával, ami illeszkedik a technológiai stack-hez, majd fokozatosan haladj a bonyolultabb forgatókönyvek felé. Minden példa az előzőek koncepcióira épül!

## 🚀 Készen állsz a kezdésre?

### Tanulási Útvonalad

1. **Teljesen Kezdő vagy?** → Kezdd a [Flask API-val](../../../examples/container-app/simple-flask-api) (⭐, 20 perc)
2. **Alap AZD Tudásod van?** → Próbáld ki a [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 perc) példát
3. **AI Alkalmazásokat Építesz?** → Kezdd az [Azure OpenAI Chat]-kel (azure-openai-chat/) (⭐⭐, 35 perc) vagy fedezd fel a [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ óra) példát
4. **Specifikus Technológiai Stack-re van szükséged?** → Használd a fentebb lévő [Megfelelő Példa Keresése](../../../examples) szekciót

### Következő Lépések

- ✅ Nézd át a fentiekben a [Előfeltételeket](../../../examples)
- ✅ Válassz példát a képességeidnek megfelelően (lásd [Bonyolultsági Jelmagyarázat](../../../examples))
- ✅ Olvasd el alaposan a példa README-jét telepítés előtt
- ✅ Állíts be emlékeztetőt az `azd down` futtatására a tesztelés után
- ✅ Oszd meg élményeidet GitHub Issues vagy Discussions útján

### Segítségre van szükséged?

- 📖 [GYIK](../resources/faq.md) - Gyakori kérdések megválaszolva
- 🐛 [Hibaelhárítási Útmutató](../docs/chapter-07-troubleshooting/common-issues.md) - Telepítési problémák javítása
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Közösségi kérdezés
- 📚 [Tanulási Útmutató](../resources/study-guide.md) - Tanulás megerősítése

---

**Navigáció**
- **📚 Tanfolyam Főoldal**: [AZD Kezdőknek](../README.md)
- **📖 Tananyagok**: [Tanulási Útmutató](../resources/study-guide.md) | [Gyorsreferencia](../resources/cheat-sheet.md) | [Fogalomtár](../resources/glossary.md)
- **🔧 Források**: [GYIK](../resources/faq.md) | [Hibaelhárítás](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Utoljára frissítve: 2025 november | [Hibabejelentés](https://github.com/microsoft/AZD-for-beginners/issues) | [Példák hozzájárulása](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Felelősség kizárása**:
Ezt a dokumentumot az AI fordító szolgáltatás [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével fordítottuk le. Bár igyekszünk pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti, anyanyelvi dokumentum tekintendő hiteles forrásnak. Kritikus információk esetén szakmai, emberi fordítást javaslunk. Nem vállalunk felelősséget a fordítás használatából eredő félreértésekért vagy félreértelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->