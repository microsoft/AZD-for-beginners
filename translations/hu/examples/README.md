<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9a24ebb49f185f0864813ce1178a3d8b",
  "translation_date": "2025-09-10T15:23:14+00:00",
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
- Megértheted az alkalmazásarchitektúrák különböző típusait és azok azd megvalósításait
- Elsajátíthatod az infrastruktúra mintakódolásának módszereit különböző Azure szolgáltatásokhoz
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
examples/
├── simple-web-app/          # Basic web application deployment
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── microservices/           # Multi-service application
│   ├── azure.yaml
│   ├── infra/
│   ├── services/
│   └── README.md
├── database-app/            # Application with database
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── container-app/           # Containerized application
│   ├── azure.yaml
│   ├── infra/
│   ├── Dockerfile
│   ├── src/
│   └── README.md
├── serverless-function/     # Azure Functions example
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── static-website/          # Static website deployment
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
└── configurations/          # Common configuration examples
    ├── environment-configs/
    ├── bicep-modules/
    └── scripts/
```

## Gyors kezdési példák

### Kezdőknek
1. **[Egyszerű webalkalmazás](../../../examples/simple-web-app)** - Alapvető Node.js webalkalmazás telepítése
2. **[Statikus weboldal](../../../examples/static-website)** - Statikus weboldal hosztolása Azure Storage-on
3. **[Konténeres alkalmazás](../../../examples/container-app)** - Konténerizált alkalmazás telepítése

### Haladó felhasználóknak
4. **[Adatbázis alkalmazás](../../../examples/database-app)** - Webalkalmazás PostgreSQL adatbázissal
5. **[Szerver nélküli funkció](../../../examples/serverless-function)** - Azure Functions HTTP triggerrel
6. **[Mikroszolgáltatások](../../../examples/microservices)** - Több szolgáltatást tartalmazó alkalmazás API átjáróval

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
- Alapvető infrastruktúra minták
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

### Egyszerű webalkalmazás
**Technológiák**: Node.js, App Service, Application Insights  
**Komplexitás**: Kezdő  
**Fogalmak**: Alapvető telepítés, környezeti változók, állapotellenőrzések

### Statikus weboldal
**Technológiák**: HTML/CSS/JS, Storage Account, CDN  
**Komplexitás**: Kezdő  
**Fogalmak**: Statikus hosztolás, CDN integráció, egyedi domainek

### Konténeres alkalmazás
**Technológiák**: Docker, Container Apps, Container Registry  
**Komplexitás**: Középhaladó  
**Fogalmak**: Konténerizáció, skálázás, belépési konfiguráció

### Adatbázis alkalmazás
**Technológiák**: Python Flask, PostgreSQL, App Service  
**Komplexitás**: Középhaladó  
**Fogalmak**: Adatbázis kapcsolatok, titkok kezelése, migrációk

### Szerver nélküli funkció
**Technológiák**: Azure Functions, Cosmos DB, API Management  
**Komplexitás**: Középhaladó  
**Fogalmak**: Eseményvezérelt architektúra, kötőelemek, API kezelés

### Mikroszolgáltatások
**Technológiák**: Több szolgáltatás, Service Bus, API Gateway  
**Komplexitás**: Haladó  
**Fogalmak**: Szolgáltatáskommunikáció, üzenetküldés, terheléselosztás

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

### Példák adaptálása saját igényeidhez

1. **Előfeltételek áttekintése**
   - Ellenőrizd az Azure szolgáltatási követelményeket
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
   - Vizsgáld meg a hozzáférés-vezérlést
   - Valósítsd meg a titkok kezelését
   - Engedélyezd a monitorozást és riasztásokat

## 📊 Összehasonlító mátrix

| Példa | Szolgáltatások | Adatbázis | Hitelesítés | Monitorozás | Komplexitás |
|-------|----------------|-----------|-------------|-------------|-------------|
| Egyszerű webalkalmazás | 1 | ❌ | Alap | Alap | ⭐ |
| Statikus weboldal | 1 | ❌ | ❌ | Alap | ⭐ |
| Konténeres alkalmazás | 1 | ❌ | Alap | Teljes | ⭐⭐ |
| Adatbázis alkalmazás | 2 | ✅ | Teljes | Teljes | ⭐⭐⭐ |
| Szerver nélküli funkció | 3 | ✅ | Teljes | Teljes | ⭐⭐⭐ |
| Mikroszolgáltatások | 5+ | ✅ | Teljes | Teljes | ⭐⭐⭐⭐ |

## 🎓 Tanulási útvonal

### Ajánlott sorrend

1. **Kezdd az Egyszerű webalkalmazással**
   - Ismerd meg az alapvető AZD fogalmakat
   - Értsd meg a telepítési munkafolyamatot
   - Gyakorold a környezetkezelést

2. **Próbáld ki a Statikus weboldalt**
   - Fedezd fel a különböző hosztolási lehetőségeket
   - Tanuld meg a CDN integrációt
   - Értsd meg a DNS konfigurációt

3. **Haladj a Konténeres alkalmazásra**
   - Ismerd meg a konténerizáció alapjait
   - Értsd meg a skálázási fogalmakat
   - Gyakorolj Dockerrel

4. **Adj hozzá adatbázis integrációt**
   - Tanuld meg az adatbázis előkészítést
   - Értsd meg a kapcsolati karakterláncokat
   - Gyakorold a titkok kezelését

5. **Fedezd fel a Szerver nélküli megoldásokat**
   - Értsd meg az eseményvezérelt architektúrát
   - Tanuld meg a trigger és kötőelemek használatát
   - Gyakorolj API-kkal

6. **Építs mikroszolgáltatásokat**
   - Tanuld meg a szolgáltatáskommunikációt
   - Értsd meg az elosztott rendszereket
   - Gyakorolj összetett telepítésekkel

## 🔍 Megfelelő példa kiválasztása

### Technológiai stack alapján
- **Node.js**: Egyszerű webalkalmazás, Mikroszolgáltatások
- **Python**: Adatbázis alkalmazás, Szerver nélküli funkció
- **Statikus oldalak**: Statikus weboldal
- **Konténerek**: Konténeres alkalmazás, Mikroszolgáltatások
- **Adatbázisok**: Adatbázis alkalmazás, Szerver nélküli funkció

### Architektúra minták alapján
- **Monolitikus**: Egyszerű webalkalmazás, Adatbázis alkalmazás
- **Statikus**: Statikus weboldal
- **Mikroszolgáltatások**: Mikroszolgáltatások példa
- **Szerver nélküli**: Szerver nélküli funkció
- **Hibrid**: Konténeres alkalmazás

### Komplexitási szint alapján
- **Kezdő**: Egyszerű webalkalmazás, Statikus weboldal
- **Középhaladó**: Konténeres alkalmazás, Adatbázis alkalmazás, Szerver nélküli funkció  
- **Haladó**: Mikroszolgáltatások

## 📚 További források

### Dokumentációs linkek
- [Azure AI Foundry AZD sablonok](https://github.com/Azure/ai-foundry-templates)
- [Bicep dokumentáció](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architektúra Központ](https://learn.microsoft.com/en-us/azure/architecture/)

### Közösségi példák
- [Azure Samples AZD sablonok](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry sablonok](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Galéria](https://azure.github.io/awesome-azd/)

### Legjobb gyakorlatok
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Példák hozzájárulása

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
- Oszd meg tapasztalataidat a közösséggel

---

**Navigáció**
- **Előző lecke**: [Tanulmányi útmutató](../resources/study-guide.md)
- **Vissza**: [Fő README](../README.md)

---

**Felelősség kizárása**:  
Ez a dokumentum az [Co-op Translator](https://github.com/Azure/co-op-translator) AI fordítási szolgáltatás segítségével került lefordításra. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Kritikus információk esetén javasolt professzionális emberi fordítást igénybe venni. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely a fordítás használatából eredhet.