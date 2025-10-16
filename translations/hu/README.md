<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "be5fd7bf2b02d878efdb442580d98d96",
  "translation_date": "2025-10-16T16:04:26+00:00",
  "source_file": "README.md",
  "language_code": "hu"
}
-->
# AZD Kezdőknek: Strukturált Tanulási Útmutató

![AZD-kezdőknek](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.hu.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Azure AI Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/kzRShWzttr)](https://discord.gg/kzRShWzttr)

## Hogyan kezdjük el ezt a kurzust?

Kövesd az alábbi lépéseket, hogy elkezdhesd AZD tanulási utadat:

1. **Forkold a repót**: Kattints [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klónozd a repót**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Csatlakozz a közösséghez**: [Azure Discord Közösségek](https://discord.com/invite/ByRwuEEgH4) szakértői támogatásért
4. **Válaszd ki a tanulási útvonalad**: Válassz egy fejezetet az alábbiak közül, amely megfelel a tapasztalati szintednek

### Többnyelvű támogatás

#### Automatikus fordítások (Mindig naprakészek)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arab](../ar/README.md) | [Bengáli](../bn/README.md) | [Bolgár](../bg/README.md) | [Burmai (Mianmar)](../my/README.md) | [Kínai (Egyszerűsített)](../zh/README.md) | [Kínai (Hagyományos, Hongkong)](../hk/README.md) | [Kínai (Hagyományos, Makaó)](../mo/README.md) | [Kínai (Hagyományos, Tajvan)](../tw/README.md) | [Horvát](../hr/README.md) | [Cseh](../cs/README.md) | [Dán](../da/README.md) | [Holland](../nl/README.md) | [Észt](../et/README.md) | [Finn](../fi/README.md) | [Francia](../fr/README.md) | [Német](../de/README.md) | [Görög](../el/README.md) | [Héber](../he/README.md) | [Hindi](../hi/README.md) | [Magyar](./README.md) | [Indonéz](../id/README.md) | [Olasz](../it/README.md) | [Japán](../ja/README.md) | [Koreai](../ko/README.md) | [Litván](../lt/README.md) | [Maláj](../ms/README.md) | [Maráthi](../mr/README.md) | [Nepáli](../ne/README.md) | [Norvég](../no/README.md) | [Perzsa (Fárszi)](../fa/README.md) | [Lengyel](../pl/README.md) | [Portugál (Brazília)](../br/README.md) | [Portugál (Portugália)](../pt/README.md) | [Pandzsábi (Gurmukhi)](../pa/README.md) | [Román](../ro/README.md) | [Orosz](../ru/README.md) | [Szerb (Cirill)](../sr/README.md) | [Szlovák](../sk/README.md) | [Szlovén](../sl/README.md) | [Spanyol](../es/README.md) | [Szuahéli](../sw/README.md) | [Svéd](../sv/README.md) | [Tagalog (Filippínó)](../tl/README.md) | [Tamil](../ta/README.md) | [Thai](../th/README.md) | [Török](../tr/README.md) | [Ukrán](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnámi](../vi/README.md)
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## Kurzus Áttekintés

Sajátítsd el az Azure Developer CLI (azd) használatát strukturált fejezeteken keresztül, amelyek progresszív tanulást biztosítanak. **Különös hangsúly az AI alkalmazások telepítésén az Azure AI Foundry integrációval.**

### Miért elengedhetetlen ez a kurzus a modern fejlesztők számára?

Az Azure AI Foundry Discord közösség visszajelzései alapján **a fejlesztők 45%-a szeretné az AZD-t AI munkaterhelésekhez használni**, de nehézségekbe ütköznek az alábbiak miatt:
- Összetett, több szolgáltatást igénylő AI architektúrák
- Legjobb gyakorlatok a termelési AI telepítéshez  
- Azure AI szolgáltatások integrációja és konfigurációja
- Költségoptimalizálás AI munkaterhelésekhez
- AI-specifikus telepítési problémák elhárítása

### Tanulási célok

A kurzus elvégzésével:
- **Elsajátítod az AZD alapjait**: Alapfogalmak, telepítés és konfiguráció
- **AI alkalmazásokat telepítesz**: AZD használata az Azure AI Foundry szolgáltatásokkal
- **Infrastruktúra kódként**: Azure erőforrások kezelése Bicep sablonokkal
- **Telepítési problémák megoldása**: Gyakori problémák elhárítása és hibakeresés
- **Optimalizálás termeléshez**: Biztonság, skálázás, monitorozás és költségkezelés
- **Többügynökös megoldások építése**: Összetett AI architektúrák telepítése

## 📚 Tanulási Fejezetek

*Válaszd ki a tanulási útvonalad a tapasztalati szinted és céljaid alapján*

### 🚀 1. fejezet: Alapok & Gyors kezdés
**Előfeltételek**: Azure előfizetés, alapvető parancssori ismeretek  
**Időtartam**: 30-45 perc  
**Komplexitás**: ⭐

#### Amit megtanulsz
- Az Azure Developer CLI alapjainak megértése
- AZD telepítése a platformodra
- Az első sikeres telepítésed

#### Tanulási források
- **🎯 Kezd itt**: [Mi az Azure Developer CLI?](../..)
- **📖 Elmélet**: [AZD Alapok](docs/getting-started/azd-basics.md) - Alapfogalmak és terminológia
- **⚙️ Beállítás**: [Telepítés és beállítás](docs/getting-started/installation.md) - Platform-specifikus útmutatók
- **🛠️ Gyakorlati rész**: [Az első projekted](docs/getting-started/first-project.md) - Lépésről lépésre útmutató
- **📋 Gyors referencia**: [Parancsok összefoglalója](resources/cheat-sheet.md)

#### Gyakorlati feladatok
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 Fejezet eredménye**: Sikeresen telepítesz egy egyszerű webalkalmazást az Azure-ra AZD segítségével

---

### 🤖 2. fejezet: AI-első fejlesztés (Ajánlott AI fejlesztőknek)
**Előfeltételek**: 1. fejezet elvégzése  
**Időtartam**: 1-2 óra  
**Komplexitás**: ⭐⭐

#### Amit megtanulsz
- Azure AI Foundry integráció AZD-vel
- AI-alapú alkalmazások telepítése
- AI szolgáltatások konfigurációjának megértése

#### Tanulási források
- **🎯 Kezd itt**: [Azure AI Foundry Integráció](docs/ai-foundry/azure-ai-foundry-integration.md)
- **📖 Minták**: [AI Modell Telepítés](docs/ai-foundry/ai-model-deployment.md) - AI modellek telepítése és kezelése
- **🛠️ Workshop**: [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - AI megoldások AZD-re való felkészítése
- **🎥 Interaktív útmutató**: [Workshop anyagok](workshop/README.md) - Böngészőalapú tanulás MkDocs * DevContainer környezetben
- **📋 Sablonok**: [Azure AI Foundry Sablonok](../..)

#### Gyakorlati feladatok
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Fejezet eredménye**: AI-alapú chat alkalmazás telepítése és konfigurálása RAG funkciókkal

---

### ⚙️ 3. fejezet: Konfiguráció & Hitelesítés
**Előfeltételek**: 1. fejezet elvégzése  
**Időtartam**: 45-60 perc  
**Komplexitás**: ⭐⭐

#### Amit megtanulsz
- Környezet konfiguráció és kezelés
- Hitelesítési és biztonsági legjobb gyakorlatok
- Erőforrások elnevezése és szervezése

#### Tanulási források
- **📖 Konfiguráció**: [Konfigurációs útmutató](docs/getting-started/configuration.md) - Környezet beállítása
- **🔐 Biztonság**: Hitelesítési minták és kezelt identitás
- **📝 Példák**: [Adatbázis alkalmazás példa](../../examples/database-app) - Konfigurációs minták

#### Gyakorlati feladatok
- Több környezet konfigurálása (fejlesztés, tesztelés, éles)
- Kezelt identitás hitelesítés beállítása
- Környezet-specifikus konfigurációk megvalósítása

**💡 Fejezet eredménye**: Több környezet kezelése megfelelő hitelesítéssel és biztonsággal

---

### 🏗️ 4. fejezet: Infrastruktúra kódként & Telepítés
**Előfeltételek**: 1-3. fejezet elvégzése  
**Időtartam**: 1-1,5 óra  
**Komplexitás**: ⭐⭐⭐

#### Amit megtanulsz
- Haladó telepítési minták
- Infrastruktúra kódként Bicep segítségével
- Erőforrások előkészítési stratégiái

#### Tanulási források
- **📖 Telepítés**: [Telepítési útmutató](docs/deployment/deployment-guide.md) - Teljes munkafolyamatok
- **🏗️ Előkészítés**: [Erőforrások előkészítése](docs/deployment/provisioning.md) - Azure erőforrás kezelés
- **📝 Példák**: [Konténer alkalmazás példa](../../examples/container-app) - Konténeres telepítések

#### Gyakorlati feladatok
- Egyedi Bicep sablonok létrehozása
- Több szolgáltatást tartalmazó alkalmazások telepítése
- Blue-green telepítési stratégiák megvalósítása

**💡 Fejezet eredménye**: Összetett, több szolgáltatást tartalmazó alkalmazások telepítése egyedi infrastruktúra sablonokkal

---

### 🎯 5. fejezet: Többügynökös AI megoldások (Haladó)
**Előfeltételek**: 1-2. fejezet elvégzése  
**Időtartam**: 2-3 óra  
**Komplexitás**: ⭐⭐⭐⭐

#### Amit megtanulsz
- Többügynökös architektúra minták
- Ügynökök összehangolása és koordinációja
- Termelésre kész AI telepítések

#### Tanulási források
- **🤖 Kiemelt projekt**: [Kiskereskedelmi Többügynökös Megoldás](examples/retail-scenario.md) - Teljes megvalósítás
- **🛠️ ARM sablonok**: [ARM Sablon Csomag](../../examples/retail-multiagent-arm-template) - Egykattintásos telepítés
- **📖 Architektúra**: Többügynökös koordinációs minták

#### Gyakorlati feladatok
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Fejezet eredménye**: Termelésre kész többügynökös AI megoldás telepítése és kezelése Ügyfél és Készlet ügynökökkel

---

### 🔍 6. fejezet: Telepítés előtti validáció & tervezés
**Előfeltételek**: 4. fejezet elvégzése  
**Időtartam**: 1 óra  
**Komplexitás**: ⭐⭐

#### Amit megtanulsz
- Kapacitástervezés és erőforrás validáció
- SKU kiválasztási stratégiák
- Előzetes ellenőrzések és automatizálás

#### Tanulási források
- **📊 Tervezés**: [Kapacitástervezés](docs/pre-deployment/capacity-planning.md) - Erőforrás validáció
- **💰 Kiválasztás**: [SKU Kiválasztás](docs/pre-deployment/sku-selection.md) - Költséghatékony választások
- **✅ Validáció**: [Előzetes ellenőrzések](docs/pre-deployment/preflight-checks.md) - Automatikus szkriptek

#### Gyakorlati feladatok
- Kapacitás validációs szkriptek futtatása
- SKU kiválasztások optimalizálása költségekhez
- Automatikus telepítés előtti ellenőrzések megvalósítása

**💡 Fejezet eredménye**: Telepítések validálása és optimalizálása végrehajtás előtt

---

### 🚨 7. fejezet: Hibakeresés & Debugolás
**Előfeltételek**: Bármely telepítési fejezet elvégzése  
**Időtartam**: 1-1,5 óra  
**Komplexitás**: ⭐⭐

#### Amit megtanulsz
- Szisztematikus hibakeresési megközelítések
- Gyakori problémák és megoldások
- AI-specifikus hibakeresés

#### Tanulási források
- **🔧 Gyakori problémák**: [Gyakori problémák](docs/troubleshooting/common-issues.md) - GYIK és megoldások
- **🕵️ Debugolás**: [Hibakeresési útmutató](docs/troubleshooting/debugging.md) - Lépésről lépésre stratégiák
- **🤖 AI problémák**: [AI-specifikus hibakeresés](docs/troubleshooting/ai-troubleshooting.md) - AI szolgáltatási problémák

#### Gyakorlati feladatok
- Telepítési hibák diagnosztizálása
- Hitelesítési problémák megoldása
- AI szolgáltatási kapcsolódási hibák debugolása

**💡 Fejezet eredménye**: Gyakori telepítési problémák önálló diagnosztizálása és megoldása

---

### 🏢 8. fejezet: Termelési & Vállalati Minták
**Előfeltételek**: 1-4. fejezet elvégzése  
**Időtartam**: 2-3 óra  

**Komplexitás**: ⭐⭐⭐⭐

#### Amit Megtanulsz
- Éles üzembe helyezési stratégiák
- Vállalati biztonsági minták
- Monitoring és költségoptimalizálás

#### Tanulási források
- **🏭 Éles üzem**: [Production AI Best Practices](docs/ai-foundry/production-ai-practices.md) - Vállalati minták
- **📝 Példák**: [Microservices Example](../../examples/microservices) - Komplex architektúrák
- **📊 Monitoring**: Application Insights integráció

#### Gyakorlati feladatok
- Vállalati biztonsági minták megvalósítása
- Átfogó monitoring beállítása
- Éles üzembe helyezés megfelelő irányítással

**💡 Fejezet eredménye**: Vállalati szintű alkalmazások éles üzembe helyezése teljes funkcionalitással

---

## 🎓 Workshop Áttekintés: Gyakorlati tanulási élmény

### Interaktív workshop anyagok
**Átfogó, gyakorlati tanulás böngészőalapú eszközökkel és irányított gyakorlatokkal**

Workshop anyagaink strukturált, interaktív tanulási élményt nyújtanak, amely kiegészíti a fent bemutatott fejezetalapú tananyagot. A workshop önálló tanulásra és oktató által vezetett foglalkozásokra egyaránt alkalmas.

#### 🛠️ Workshop jellemzők
- **Böngészőalapú felület**: Teljes MkDocs-alapú workshop keresési, másolási és témaválasztási funkciókkal
- **GitHub Codespaces integráció**: Egy kattintásos fejlesztési környezet beállítás
- **Strukturált tanulási útvonal**: 7 lépéses irányított gyakorlatok (összesen 3,5 óra)
- **Felfedezés → Üzembe helyezés → Testreszabás**: Fokozatos módszertan
- **Interaktív DevContainer környezet**: Előre konfigurált eszközök és függőségek

#### 📚 Workshop felépítése
A workshop a **Felfedezés → Üzembe helyezés → Testreszabás** módszertant követi:

1. **Felfedezési fázis** (45 perc)
   - Azure AI Foundry sablonok és szolgáltatások felfedezése
   - Többügynökös architektúra minták megértése
   - Üzembe helyezési követelmények és előfeltételek áttekintése

2. **Üzembe helyezési fázis** (2 óra)
   - AI alkalmazások gyakorlati üzembe helyezése AZD-vel
   - Azure AI szolgáltatások és végpontok konfigurálása
   - Biztonsági és hitelesítési minták megvalósítása

3. **Testreszabási fázis** (45 perc)
   - Alkalmazások módosítása specifikus felhasználási esetekhez
   - Optimalizálás éles üzembe helyezéshez
   - Monitoring és költségkezelés megvalósítása

#### 🚀 Workshop kezdése
```bash
# Option 1: GitHub Codespaces (Recommended)
# Click "Code" → "Create codespace on main" in the repository

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow the setup instructions in workshop/README.md
```

#### 🎯 Workshop tanulási eredmények
A workshop elvégzése után a résztvevők:
- **Éles AI alkalmazásokat helyeznek üzembe**: AZD használata Azure AI Foundry szolgáltatásokkal
- **Elsajátítják a többügynökös architektúrákat**: Koordinált AI ügynök megoldások megvalósítása
- **Biztonsági legjobb gyakorlatokat alkalmaznak**: Hitelesítés és hozzáférés-vezérlés konfigurálása
- **Skálázás optimalizálása**: Költséghatékony, teljesítményorientált üzembe helyezések tervezése
- **Üzembe helyezési hibák elhárítása**: Gyakori problémák önálló megoldása

#### 📖 Workshop források
- **🎥 Interaktív útmutató**: [Workshop anyagok](workshop/README.md) - Böngészőalapú tanulási környezet
- **📋 Lépésről lépésre útmutatók**: [Irányított gyakorlatok](../../workshop/docs/instructions) - Részletes útmutatók
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - AI-központú gyakorlatok
- **💡 Gyors kezdés**: [Workshop beállítási útmutató](workshop/README.md#quick-start) - Környezet konfigurálása

**Ideális**: Vállalati képzésekhez, egyetemi kurzusokhoz, önálló tanuláshoz és fejlesztői bootcamp-ekhez.

---

## 📖 Mi az az Azure Developer CLI?

Az Azure Developer CLI (azd) egy fejlesztőközpontú parancssori eszköz, amely felgyorsítja az alkalmazások Azure-ba történő építésének és üzembe helyezésének folyamatát. A következőket kínálja:

- **Sablon alapú üzembe helyezések** - Előre elkészített sablonok használata gyakori alkalmazási mintákhoz
- **Infrastruktúra kódként** - Azure erőforrások kezelése Bicep vagy Terraform segítségével  
- **Integrált munkafolyamatok** - Alkalmazások zökkenőmentes előkészítése, üzembe helyezése és monitorozása
- **Fejlesztőbarát** - Optimalizált a fejlesztői termelékenység és élmény érdekében

### **AZD + Azure AI Foundry: Tökéletes AI üzembe helyezésekhez**

**Miért AZD az AI megoldásokhoz?** Az AZD megoldja az AI fejlesztők legnagyobb kihívásait:

- **AI-ra kész sablonok** - Előre konfigurált sablonok Azure OpenAI, Cognitive Services és ML munkaterhelésekhez
- **Biztonságos AI üzembe helyezések** - Beépített biztonsági minták AI szolgáltatásokhoz, API kulcsokhoz és modell végpontokhoz  
- **Éles AI minták** - Legjobb gyakorlatok skálázható, költséghatékony AI alkalmazás üzembe helyezésekhez
- **Végponttól végig AI munkafolyamatok** - A modellfejlesztéstől az éles üzembe helyezésig megfelelő monitorozással
- **Költségoptimalizálás** - Okos erőforrás-elosztási és skálázási stratégiák AI munkaterhelésekhez
- **Azure AI Foundry integráció** - Zökkenőmentes kapcsolat az AI Foundry modellkatalógushoz és végpontokhoz

---

## 🎯 Sablonok és példák könyvtára

### Kiemelt: Azure AI Foundry sablonok
**Kezdd itt, ha AI alkalmazásokat helyezel üzembe!**

| Sablon | Fejezet | Komplexitás | Szolgáltatások |
|--------|---------|-------------|----------------|
| [**AI chat indítása**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 2. fejezet | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |
| [**AI ügynökök indítása**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 2. fejezet | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|
| [**Többügynökös munkafolyamat automatizálás**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 5. fejezet | ⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Dokumentumok generálása adataidból**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 4. fejezet | ⭐⭐⭐  | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|
| [**Ügyféltalálkozók javítása ügynökökkel**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 5. fejezet | ⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |
| [**Kód modernizálása ügynökökkel**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 5. fejezet | ⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Saját beszélgető ügynök létrehozása**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 4. fejezet | ⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|
| [**Beszélgetési adatokból származó betekintések feloldása**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 8. fejezet | ⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|
| [**Többmódú tartalomfeldolgozás**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 8. fejezet | ⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|

### Kiemelt: Teljes tanulási forgatókönyvek
**Éles üzemre kész alkalmazási sablonok a tanulási fejezetekhez igazítva**

| Sablon | Tanulási fejezet | Komplexitás | Kulcsfontosságú tanulás |
|--------|------------------|-------------|-------------------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 2. fejezet | ⭐ | Alapvető AI üzembe helyezési minták |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 2. fejezet | ⭐⭐ | RAG megvalósítás Azure AI Search-csel |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 4. fejezet | ⭐⭐ | Dokumentumintelligencia integráció |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 5. fejezet | ⭐⭐⭐ | Ügynök keretrendszer és funkcióhívás |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 8. fejezet | ⭐⭐⭐ | Vállalati AI szervezés |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 5. fejezet | ⭐⭐⭐⭐ | Többügynökös architektúra ügyfél- és készletügynökökkel |

### Példák típus szerinti tanulása

#### Egyszerű alkalmazások (1-2. fejezet)
- [Egyszerű webalkalmazás](../../examples/simple-web-app) - Alapvető üzembe helyezési minták
- [Statikus weboldal](../../examples/static-site) - Statikus tartalom üzembe helyezése
- [Alapvető API](../../examples/basic-api) - REST API üzembe helyezése

#### Adatbázis integráció (3-4. fejezet)  
- [Adatbázis alkalmazás](../../examples/database-app) - Adatbázis kapcsolódási minták
- [Adatfeldolgozás](../../examples/data-processing) - ETL munkafolyamat üzembe helyezése

#### Haladó minták (4-8. fejezet)
- [Kontejneres alkalmazások](../../examples/container-app) - Konténerizált üzembe helyezések
- [Mikroszolgáltatások](../../examples/microservices) - Többszolgáltatásos architektúrák  
- [Vállalati megoldások](../../examples/enterprise) - Éles üzemre kész minták

### Külső sablongyűjtemények
- [**Hivatalos AZD sablongaléria**](https://azure.github.io/awesome-azd/) - Hivatalos és közösségi sablonok válogatása
- [**Azure Developer CLI sablonok**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn sablondokumentáció
- [**Példák könyvtára**](examples/README.md) - Helyi tanulási példák részletes magyarázatokkal

---

## 📚 Tanulási források és hivatkozások

### Gyors hivatkozások
- [**Parancsok összefoglalója**](resources/cheat-sheet.md) - Alapvető azd parancsok fejezetek szerint rendezve
- [**Szójegyzék**](resources/glossary.md) - Azure és azd terminológia  
- [**GYIK**](resources/faq.md) - Gyakori kérdések fejezetek szerint rendezve
- [**Tanulási útmutató**](resources/study-guide.md) - Átfogó gyakorlati feladatok

### Gyakorlati workshopok
- [**AI Workshop Lab**](docs/ai-foundry/ai-workshop-lab.md) - Tedd AI megoldásaidat AZD-kompatibilissé (2-3 óra)
- [**Interaktív workshop útmutató**](workshop/README.md) - Böngészőalapú workshop MkDocs és DevContainer környezettel
- [**Strukturált tanulási útvonal**](../../workshop/docs/instructions) - 7 lépéses irányított gyakorlatok (Felfedezés → Üzembe helyezés → Testreszabás)
- [**AZD kezdőknek workshop**](workshop/README.md) - Teljes körű gyakorlati workshop anyagok GitHub Codespaces integrációval

### Külső tanulási források
- [Azure Developer CLI dokumentáció](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure árkalkulátor](https://azure.microsoft.com/pricing/calculator/)
- [Azure állapot](https://status.azure.com/)

---

## 🎓 Tanfolyam befejezése és tanúsítvány

### Haladás nyomon követése
Kövesd nyomon tanulási előrehaladásodat minden fejezeten keresztül:

- [ ] **1. fejezet**: Alapok és gyors kezdés ✅
- [ ] **2. fejezet**: AI-első fejlesztés ✅  
- [ ] **3. fejezet**: Konfiguráció és hitelesítés ✅
- [ ] **4. fejezet**: Infrastruktúra kódként és üzembe helyezés ✅
- [ ] **5. fejezet**: Többügynökös AI megoldások ✅
- [ ] **6. fejezet**: Előzetes üzembe helyezési ellenőrzés és tervezés ✅
- [ ] **7. fejezet**: Hibakeresés és hibaelhárítás ✅
- [ ] **8. fejezet**: Éles és vállalati minták ✅

### Tanulás ellenőrzése
Minden fejezet befejezése után ellenőrizd tudásodat:
1. **Gyakorlati feladat**: Teljesítsd a fejezet gyakorlati üzembe helyezését
2. **Tudásellenőrzés**: Tekintsd át a fejezet GYIK szekcióját
3. **Közösségi megbeszélés**: Oszd meg tapasztalataidat az Azure Discordon
4. **Következő fejezet**: Lépj a következő komplexitási szintre

### Tanfolyam befejezése utáni előnyök
A tanfolyam összes fejezetének elvégzése után:
- **Éles tapasztalat**: Valós AI alkalmazásokat helyeztél üzembe az Azure-ban
- **Szakmai készségek**: Vállalati szintű üzembe helyezési képességek  
- **Közösségi elismerés**: Az Azure fejlesztői közösség aktív tagja
- **Karrier előrelépés**: Keresett AZD és AI üzembe helyezési szakértelem

---

## 🤝 Közösség és támogatás

### Segítség és támogatás
- **Technikai problémák**: [Hibák jelentése és funkciókérések](https://github.com/microsoft/azd-for-beginners/issues)
- **Tanulási kérdések**: [Microsoft Azure Discord közösség](https://discord.gg/microsoft-azure)
- **AI-specifikus segítség**: Csatlakozz az [#Azure csatornához](https://
- **Új példák**: Valós életből vett forgatókönyvek és sablonok hozzáadása  
- **Fordítás**: Segítség a többnyelvű támogatás fenntartásában  
- **Hibajelentések**: Pontosság és érthetőség javítása  
- **Közösségi normák**: Kövesd az inkluzív közösségi irányelveinket  

---

## 📄 Kurzusinformációk

### Licenc
Ez a projekt az MIT Licenc alatt áll - részletekért lásd a [LICENSE](../../LICENSE) fájlt.

### Kapcsolódó Microsoft tanulási források

Csapatunk más átfogó tanfolyamokat is készít:

- [Model Context Protocol (MCP) Kezdőknek](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
- [AI Ügynökök Kezdőknek](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generatív AI Kezdőknek .NET használatával](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
- [Generatív AI Kezdőknek](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Generatív AI Kezdőknek Java használatával](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
- [ML Kezdőknek](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
- [Adattudomány Kezdőknek](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
- [AI Kezdőknek](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
- [Kiberbiztonság Kezdőknek](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)
- [Webfejlesztés Kezdőknek](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
- [IoT Kezdőknek](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
- [XR Fejlesztés Kezdőknek](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
- [GitHub Copilot Mesterfokon AI Páros Programozáshoz](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [GitHub Copilot Mesterfokon C#/.NET Fejlesztőknek](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [Válaszd ki a saját Copilot kalandodat](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

## 🗺️ Kurzus navigáció

**🚀 Készen állsz a tanulásra?**

**Kezdők**: Kezdd a [1. fejezet: Alapok és gyors kezdés](../..)  
**AI fejlesztők**: Ugorj a [2. fejezet: AI-első fejlesztés](../..) részhez  
**Tapasztalt fejlesztők**: Kezdd a [3. fejezet: Konfiguráció és hitelesítés](../..) résszel

**Következő lépések**: [Kezdd az 1. fejezetet - AZD alapok](docs/getting-started/azd-basics.md) →

---

**Felelősség kizárása**:  
Ez a dokumentum az [Co-op Translator](https://github.com/Azure/co-op-translator) AI fordítási szolgáltatás segítségével lett lefordítva. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Fontos információk esetén javasolt professzionális emberi fordítást igénybe venni. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely a fordítás használatából eredhet.