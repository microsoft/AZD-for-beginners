<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e45896a8acbafead1f195788780a4ab7",
  "translation_date": "2025-09-10T16:22:22+00:00",
  "source_file": "examples/README.md",
  "language_code": "hu"
}
-->
# Példák - Gyakorlati AZD sablonok és konfigurációk

## Bevezetés

Ez a könyvtár gyakorlati példákat, sablonokat és valós életből vett forgatókönyveket tartalmaz, amelyek segítenek az Azure Developer CLI elsajátításában gyakorlati tapasztalatok révén. Minden példa teljes működő kódot, infrastruktúra sablonokat és részletes útmutatást nyújt különböző alkalmazásarchitektúrákhoz és telepítési mintákhoz.

## Tanulási célok

Ezeken a példákon keresztül:
- Gyakorolhatod az Azure Developer CLI munkafolyamatokat valós alkalmazási forgatókönyvekkel
- Megértheted a különböző alkalmazásarchitektúrákat és azok azd megvalósításait
- Elsajátíthatod az infrastruktúra mintakódokat különböző Azure szolgáltatásokhoz
- Alkalmazhatod a konfigurációkezelési és környezet-specifikus telepítési stratégiákat
- Megvalósíthatod a monitorozási, biztonsági és skálázási mintákat gyakorlati környezetben
- Tapasztalatot szerezhetsz a telepítési problémák elhárításában és hibakeresésben

## Tanulási eredmények

A példák elvégzése után képes leszel:
- Magabiztosan telepíteni különböző alkalmazástípusokat az Azure Developer CLI segítségével
- Az adott sablonokat saját alkalmazási igényeidhez igazítani
- Egyedi infrastruktúra mintákat tervezni és megvalósítani Bicep segítségével
- Összetett, több szolgáltatást tartalmazó alkalmazásokat konfigurálni megfelelő függőségekkel
- Biztonsági, monitorozási és teljesítmény-optimalizálási legjobb gyakorlatokat alkalmazni valós forgatókönyvekben
- Telepítéseket hibaelhárítani és optimalizálni gyakorlati tapasztalatok alapján

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

## Gyors kezdési példák

### Kezdőknek
1. **[Egyszerű webalkalmazás - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - Node.js Express webalkalmazás telepítése MongoDB-vel
2. **[Statikus weboldal - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - React statikus weboldal hosztolása Azure Static Web Apps segítségével
3. **[Konténeres alkalmazás - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - Konténeres Python Flask alkalmazás telepítése

### Haladó felhasználóknak
4. **[Adatbázis alkalmazás - C# Azure SQL-lel](https://github.com/Azure-Samples/todo-csharp-sql)** - Webalkalmazás C# API-val és Azure SQL adatbázissal
5. **[Szerver nélküli funkció - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - Python Azure Functions HTTP triggerrel és Cosmos DB-vel
6. **[Mikroszolgáltatások - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - Több szolgáltatást tartalmazó Java alkalmazás Container Apps és API gateway használatával

### Azure AI Foundry sablonok

1. **[Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)** - Intelligens chat alkalmazás Azure OpenAI-val
2. **[AI dokumentumfeldolgozás](https://github.com/Azure-Samples/azure-ai-document-processing)** - Dokumentumelemzés Azure AI szolgáltatásokkal
3. **[Gépi tanulási folyamat](https://github.com/Azure-Samples/mlops-v2)** - MLOps munkafolyamat Azure Machine Learning segítségével

## 📋 Használati útmutató

### Példák futtatása helyben

1. **Példa klónozása vagy másolása**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **AZD környezet inicializálása**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **Környezet konfigurálása**
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Telepítés**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### Példák testreszabása

Minden példa tartalmazza:
- **README.md** - Részletes beállítási és testreszabási útmutató
- **azure.yaml** - AZD konfiguráció megjegyzésekkel
- **infra/** - Bicep sablonok paramétermagyarázatokkal
- **src/** - Mintakód az alkalmazáshoz
- **scripts/** - Segédszkriptek gyakori feladatokhoz

## 🎯 Tanulási célok

### Példakategóriák

#### **Alapvető telepítések**
- Egyszerű szolgáltatásokat tartalmazó alkalmazások
- Egyszerű infrastruktúra minták
- Alapvető konfigurációkezelés
- Költséghatékony fejlesztési környezetek

#### **Haladó forgatókönyvek**
- Több szolgáltatást tartalmazó architektúrák
- Összetett hálózati konfigurációk
- Adatbázis integrációs minták
- Biztonsági és megfelelőségi megvalósítások

#### **Gyártásra kész minták**
- Magas rendelkezésre állású konfigurációk
- Monitorozás és megfigyelhetőség
- CI/CD integráció
- Katasztrófa utáni helyreállítási beállítások

## 📖 Példaleírások

### Egyszerű webalkalmazás - Node.js Express
**Technológiák**: Node.js, Express, MongoDB, Container Apps  
**Komplexitás**: Kezdő  
**Fogalmak**: Alapvető telepítés, REST API, NoSQL adatbázis integráció

### Statikus weboldal - React SPA
**Technológiák**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Komplexitás**: Kezdő  
**Fogalmak**: Statikus hosztolás, szerver nélküli háttér, modern webfejlesztés

### Konténeres alkalmazás - Python Flask
**Technológiák**: Python Flask, Docker, Container Apps, Container Registry  
**Komplexitás**: Kezdő  
**Fogalmak**: Konténerizáció, mikroszolgáltatások architektúrája, API fejlesztés

### Adatbázis alkalmazás - C# Azure SQL-lel
**Technológiák**: C# ASP.NET Core, Azure SQL Database, App Service  
**Komplexitás**: Haladó  
**Fogalmak**: Entity Framework, adatbázis kapcsolatok, web API fejlesztés

### Szerver nélküli funkció - Python Azure Functions
**Technológiák**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Komplexitás**: Haladó  
**Fogalmak**: Eseményvezérelt architektúra, szerver nélküli számítás, teljes stack fejlesztés

### Mikroszolgáltatások - Java Spring Boot
**Technológiák**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Komplexitás**: Haladó  
**Fogalmak**: Mikroszolgáltatások kommunikációja, elosztott rendszerek, vállalati minták

### Azure AI Foundry példák

#### Azure OpenAI Chat App
**Technológiák**: Azure OpenAI, Cognitive Search, App Service  
**Komplexitás**: Haladó  
**Fogalmak**: RAG architektúra, vektorkeresés, LLM integráció

#### AI dokumentumfeldolgozás
**Technológiák**: Azure AI Document Intelligence, Storage, Functions  
**Komplexitás**: Haladó  
**Fogalmak**: Dokumentumelemzés, OCR, adatkinyerés

#### Gépi tanulási folyamat
**Technológiák**: Azure ML, MLOps, Container Registry  
**Komplexitás**: Haladó  
**Fogalmak**: Modelltréning, telepítési folyamatok, monitorozás

## 🛠 Konfigurációs példák

A `configurations/` könyvtár újrahasznosítható komponenseket tartalmaz:

### Környezetkonfigurációk
- Fejlesztési környezet beállításai
- Tesztkörnyezet konfigurációk
- Gyártásra kész konfigurációk
- Több régiót érintő telepítési beállítások

### Bicep modulok
- Újrahasznosítható infrastruktúra komponensek
- Gyakori erőforrás minták
- Biztonságos sablonok
- Költséghatékony konfigurációk

### Segédszkriptek
- Környezetbeállítás automatizálása
- Adatbázis migrációs szkriptek
- Telepítési validációs eszközök
- Költségfigyelési segédletek

## 🔧 Testreszabási útmutató

### Példák testreszabása saját igényekhez

1. **Előfeltételek áttekintése**
   - Ellenőrizd az Azure szolgáltatások követelményeit
   - Vizsgáld meg az előfizetési korlátokat
   - Értsd meg a költségvonzatokat

2. **Konfiguráció módosítása**
   - Frissítsd az `azure.yaml` szolgáltatásdefiníciókat
   - Testreszabhatod a Bicep sablonokat
   - Állítsd be a környezeti változókat

3. **Alapos tesztelés**
   - Először telepítsd fejlesztési környezetbe
   - Ellenőrizd a funkcionalitást
   - Teszteld a skálázást és teljesítményt

4. **Biztonsági ellenőrzés**
   - Vizsgáld meg a hozzáférés-vezérléseket
   - Valósítsd meg a titokkezelést
   - Engedélyezd a monitorozást és riasztásokat

## 📊 Összehasonlító mátrix

| Példa | Szolgáltatások | Adatbázis | Auth | Monitorozás | Komplexitás |
|-------|----------------|-----------|------|-------------|-------------|
| Node.js Express Todo | 2 | ✅ | Alap | Alap | ⭐ |
| React SPA + Functions | 3 | ✅ | Alap | Teljes | ⭐ |
| Python Flask Container | 2 | ❌ | Alap | Teljes | ⭐ |
| C# Web API + SQL | 2 | ✅ | Teljes | Teljes | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Teljes | Teljes | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Teljes | Teljes | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Teljes | Teljes | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Alap | Teljes | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Teljes | Teljes | ⭐⭐⭐⭐ |

## 🎓 Tanulási útvonal

### Ajánlott sorrend

1. **Kezdd az Egyszerű Webalkalmazással**
   - Ismerd meg az alapvető AZD fogalmakat
   - Értsd meg a telepítési munkafolyamatot
   - Gyakorold a környezetkezelést

2. **Próbáld ki a Statikus Weboldalt**
   - Fedezd fel a különböző hosztolási lehetőségeket
   - Ismerd meg a CDN integrációt
   - Értsd meg a DNS konfigurációt

3. **Haladj a Konténeres Alkalmazásra**
   - Ismerd meg a konténerizáció alapjait
   - Értsd meg a skálázási fogalmakat
   - Gyakorold a Docker használatát

4. **Adj hozzá Adatbázis Integrációt**
   - Ismerd meg az adatbázis előkészítést
   - Értsd meg a kapcsolati karakterláncokat
   - Gyakorold a titokkezelést

5. **Fedezd fel a Szerver nélküli megoldásokat**
   - Értsd meg az eseményvezérelt architektúrát
   - Ismerd meg a triggerek és kötéseket
   - Gyakorold az API-kat

6. **Építs Mikroszolgáltatásokat**
   - Ismerd meg a szolgáltatások közötti kommunikációt
   - Értsd meg az elosztott rendszereket
   - Gyakorold az összetett telepítéseket

## 🔍 Megfelelő példa kiválasztása

### Technológiai stack alapján
- **Node.js**: Node.js Express Todo App
- **Python**: Python Flask Container App, Python Functions + SPA
- **C#**: C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Konténerek**: Python Flask Container App, Java Microservices
- **Adatbázisok**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline

### Architektúra minták alapján
- **Monolitikus**: Node.js Express Todo, C# Web API + SQL
- **Statikus + Szerver nélküli**: React SPA + Functions, Python Functions + SPA
- **Mikroszolgáltatások**: Java Spring Boot Microservices
- **Konténerizált**: Python Flask Container App
- **AI-alapú**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline

### Komplexitási szint alapján
- **Kezdő**: Node.js Express Todo, React SPA + Functions, Python Flask Container App
- **Haladó**: C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Profi**: ML Pipeline

## 📚 További források

### Dokumentációs linkek
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Dokumentáció](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architektúra Központ](https://learn.microsoft.com/en-us/azure/architecture/)

### Közösségi példák
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Galéria](https://azure.github.io/awesome-azd/)
- [Todo App C# és Azure SQL-lel](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App Python és MongoDB-vel](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App Node.js és PostgreSQL-lel](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web App C# API-val](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions Java-val](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Legjobb gyakorlatok
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Példák beküldése

Van egy hasznos példád, amit megosztanál? Örömmel fogadjuk a hozzájárulásokat!

### Beküldési irányelvek
1. Kövesd a meglévő könyvtárstruktúrát
2. Tartalmazz részletes README.md fájlt
3. Adj megjegyzéseket a konfigurációs fájlokhoz
4. Teszteld alaposan a beküldés előtt
5. Tüntesd fel a költségbecsléseket és előfeltételeket

### Példa sablonstruktúra
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

**Tipp**: Kezdd a legegyszerűbb példával, amely megfelel a technológiai stack-ednek, majd fokozatosan haladj az összetettebb forgatókönyvek felé. Minden példa az előzőekben tanult fogalmakra épül!

**Következő lépések**: 
- Válassz egy példát, amely megfelel a tudásszintednek
- Kövesd az adott példa README-jében található beállítási útmutatót
- Kísérletezz testreszabásokkal
- Oszd meg tapasztalataidat a közössé

---

**Felelősség kizárása**:  
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével lett lefordítva. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Kritikus információk esetén javasolt professzionális emberi fordítást igénybe venni. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely a fordítás használatából eredhet.