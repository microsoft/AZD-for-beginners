<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6dbd1fe0dee10a4def58fdc663c59e1d",
  "translation_date": "2025-11-18T18:17:33+00:00",
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
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## Hogyan Kezdjük el ezt a Tanfolyamot

Kövesd az alábbi lépéseket, hogy elindítsd az AZD tanulási utadat:

1. **Forkold a Repozitóriumot**: Kattints ide [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klónozd a Repozitóriumot**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Csatlakozz a Közösséghez**: [Azure Discord Közösségek](https://discord.com/invite/ByRwuEEgH4) szakértői támogatásért
4. **Válaszd ki a Tanulási Útvonaladat**: Válassz egy fejezetet az alábbiak közül, amely megfelel a tapasztalati szintednek

### Többnyelvű Támogatás

#### Automatikus Fordítások (Mindig Naprakészek)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arab](../ar/README.md) | [Bengáli](../bn/README.md) | [Bolgár](../bg/README.md) | [Burmai (Mianmar)](../my/README.md) | [Kínai (Egyszerűsített)](../zh/README.md) | [Kínai (Hagyományos, Hongkong)](../hk/README.md) | [Kínai (Hagyományos, Makaó)](../mo/README.md) | [Kínai (Hagyományos, Tajvan)](../tw/README.md) | [Horvát](../hr/README.md) | [Cseh](../cs/README.md) | [Dán](../da/README.md) | [Holland](../nl/README.md) | [Észt](../et/README.md) | [Finn](../fi/README.md) | [Francia](../fr/README.md) | [Német](../de/README.md) | [Görög](../el/README.md) | [Héber](../he/README.md) | [Hindi](../hi/README.md) | [Magyar](./README.md) | [Indonéz](../id/README.md) | [Olasz](../it/README.md) | [Japán](../ja/README.md) | [Koreai](../ko/README.md) | [Litván](../lt/README.md) | [Maláj](../ms/README.md) | [Marathi](../mr/README.md) | [Nepáli](../ne/README.md) | [Nigériai Pidgin](../pcm/README.md) | [Norvég](../no/README.md) | [Perzsa (Fárszi)](../fa/README.md) | [Lengyel](../pl/README.md) | [Portugál (Brazília)](../br/README.md) | [Portugál (Portugália)](../pt/README.md) | [Pandzsábi (Gurmukhi)](../pa/README.md) | [Román](../ro/README.md) | [Orosz](../ru/README.md) | [Szerb (Cirill)](../sr/README.md) | [Szlovák](../sk/README.md) | [Szlovén](../sl/README.md) | [Spanyol](../es/README.md) | [Szuahéli](../sw/README.md) | [Svéd](../sv/README.md) | [Tagalog (Filippínó)](../tl/README.md) | [Tamil](../ta/README.md) | [Thai](../th/README.md) | [Török](../tr/README.md) | [Ukrán](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnámi](../vi/README.md)
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## Tanfolyam Áttekintése

Sajátítsd el az Azure Developer CLI (azd) használatát strukturált fejezeteken keresztül, amelyek progresszív tanulást biztosítanak. **Különös hangsúly az AI alkalmazások telepítésén az Azure AI Foundry integrációval.**

### Miért Fontos Ez a Tanfolyam a Modern Fejlesztők Számára?

Az Azure AI Foundry Discord közösség visszajelzései alapján **a fejlesztők 45%-a szeretné használni az AZD-t AI munkafolyamatokhoz**, de nehézségekbe ütköznek az alábbiakban:
- Összetett, több szolgáltatást igénylő AI architektúrák
- AI telepítési legjobb gyakorlatok a termelésben  
- Azure AI szolgáltatások integrációja és konfigurációja
- AI munkafolyamatok költségoptimalizálása
- AI-specifikus telepítési problémák elhárítása

### Tanulási Célok

A tanfolyam elvégzése után képes leszel:
- **AZD Alapok Elsajátítása**: Alapfogalmak, telepítés és konfiguráció
- **AI Alkalmazások Telepítése**: AZD használata az Azure AI Foundry szolgáltatásokkal
- **Infrastruktúra Kódként**: Azure erőforrások kezelése Bicep sablonokkal
- **Telepítési Hibák Elhárítása**: Gyakori problémák megoldása és hibakeresés
- **Termelési Optimalizálás**: Biztonság, skálázás, monitorozás és költségkezelés
- **Többügynökös Megoldások Kialakítása**: Összetett AI architektúrák telepítése

## 📚 Tanulási Fejezetek

*Válaszd ki a tanulási útvonaladat a tapasztalati szinted és céljaid alapján*

### 🚀 1. Fejezet: Alapok és Gyors Kezdés
**Előfeltételek**: Azure előfizetés, alapvető parancssori ismeretek  
**Időtartam**: 30-45 perc  
**Nehézség**: ⭐

#### Amit Megtanulsz
- Az Azure Developer CLI alapjainak megértése
- AZD telepítése a platformodra
- Az első sikeres telepítésed

#### Tanulási Források
- **🎯 Kezdj itt**: [Mi az Azure Developer CLI?](../..)
- **📖 Elmélet**: [AZD Alapok](docs/getting-started/azd-basics.md) - Alapfogalmak és terminológia
- **⚙️ Beállítás**: [Telepítés és Beállítás](docs/getting-started/installation.md) - Platformspecifikus útmutatók
- **🛠️ Gyakorlati Feladat**: [Az Első Projekted](docs/getting-started/first-project.md) - Lépésről lépésre útmutató
- **📋 Gyors Referencia**: [Parancsok Rövid Útmutatója](resources/cheat-sheet.md)

#### Gyakorlati Feladatok
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 Fejezet Eredménye**: Egy egyszerű webalkalmazás sikeres telepítése az Azure-ra AZD segítségével

---

### 🤖 2. Fejezet: AI-Orientált Fejlesztés (Ajánlott AI Fejlesztőknek)
**Előfeltételek**: 1. fejezet elvégzése  
**Időtartam**: 1-2 óra  
**Nehézség**: ⭐⭐

#### Amit Megtanulsz
- Azure AI Foundry integráció AZD-vel
- AI-alapú alkalmazások telepítése
- AI szolgáltatások konfigurációjának megértése

#### Tanulási Források
- **🎯 Kezdj itt**: [Azure AI Foundry Integráció](docs/ai-foundry/azure-ai-foundry-integration.md)
- **📖 Minták**: [AI Modell Telepítés](docs/ai-foundry/ai-model-deployment.md) - AI modellek telepítése és kezelése
- **🛠️ Workshop**: [AI Workshop Labor](docs/ai-foundry/ai-workshop-lab.md) - AI megoldások AZD-re való felkészítése
- **🎥 Interaktív Útmutató**: [Workshop Anyagok](workshop/README.md) - Böngészőalapú tanulás MkDocs * DevContainer környezetben
- **📋 Sablonok**: [Azure AI Foundry Sablonok](../..)

#### Gyakorlati Feladatok
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Fejezet Eredménye**: Egy AI-alapú chatalkalmazás telepítése és konfigurálása RAG képességekkel

---

### ⚙️ 3. Fejezet: Konfiguráció és Hitelesítés
**Előfeltételek**: 1. fejezet elvégzése  
**Időtartam**: 45-60 perc  
**Nehézség**: ⭐⭐

#### Amit Megtanulsz
- Környezetek konfigurálása és kezelése
- Hitelesítési és biztonsági legjobb gyakorlatok
- Erőforrások elnevezése és szervezése

#### Tanulási Források
- **📖 Konfiguráció**: [Konfigurációs Útmutató](docs/getting-started/configuration.md) - Környezet beállítása
- **🔐 Biztonság**: Hitelesítési minták és kezelt identitás
- **📝 Példák**: [Adatbázis Alkalmazás Példa](../../examples/database-app) - Konfigurációs minták

#### Gyakorlati Feladatok
- Több környezet konfigurálása (fejlesztés, tesztelés, éles)
- Kezelt identitás hitelesítés beállítása
- Környezetspecifikus konfigurációk implementálása

**💡 Fejezet Eredménye**: Több környezet kezelése megfelelő hitelesítéssel és biztonsággal

---

### 🏗️ 4. Fejezet: Infrastruktúra Kódként és Telepítés
**Előfeltételek**: 1-3. fejezet elvégzése  
**Időtartam**: 1-1,5 óra  
**Nehézség**: ⭐⭐⭐

#### Amit Megtanulsz
- Haladó telepítési minták
- Infrastruktúra kódként Bicep segítségével
- Erőforrás-ellátási stratégiák

#### Tanulási Források
- **📖 Telepítés**: [Telepítési Útmutató](docs/deployment/deployment-guide.md) - Teljes munkafolyamatok
- **🏗️ Erőforrás-ellátás**: [Erőforrások Ellátása](docs/deployment/provisioning.md) - Azure erőforrások kezelése
- **📝 Példák**: [Konténer Alkalmazás Példa](../../examples/container-app) - Konténerizált telepítések

#### Gyakorlati Feladatok
- Egyedi Bicep sablonok létrehozása
- Több szolgáltatást igénylő alkalmazások telepítése
- Kék-zöld telepítési stratégiák implementálása

**💡 Fejezet Eredménye**: Összetett, több szolgáltatást igénylő alkalmazások telepítése egyedi infrastruktúra sablonokkal

---

### 🎯 5. Fejezet: Többügynökös AI Megoldások (Haladó)
**Előfeltételek**: 1-2. fejezet elvégzése  
**Időtartam**: 2-3 óra  
**Nehézség**: ⭐⭐⭐⭐

#### Amit Megtanulsz
- Többügynökös architektúra minták
- Ügynökök összehangolása és koordinációja
- Termelésre kész AI telepítések

#### Tanulási Források
- **🤖 Kiemelt Projekt**: [Kiskereskedelmi Többügynökös Megoldás](examples/retail-scenario.md) - Teljes implementáció
- **🛠️ ARM Sablonok**: [ARM Sablon Csomag](../../examples/retail-multiagent-arm-template) - Egykattintásos telepítés
- **📖 Architektúra**: Többügynökös koordinációs minták

#### Gyakorlati Feladatok
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Fejezet Eredménye**: Termelésre kész többügynökös AI megoldás telepítése és kezelése Ügyfél- és Készletügynökökkel

---

### 🔍 6. Fejezet: Előzetes Telepítési Ellenőrzés és Tervezés
**Előfeltételek**: 4. fejezet elvégzése  
**Időtartam**: 1 óra  
**Nehézség**: ⭐⭐

#### Amit Megtanulsz
- Kapacitástervezés és erőforrás-ellenőrzés
- SKU kiválasztási stratégiák
- Előzetes ellenőrzések és automatizáció

#### Tanulási Források
- **📊 Tervezés**: [Kapacitástervezés](docs/pre-deployment/capacity-planning.md) - Erőforrás-ellenőrzés
- **💰 Kiválasztás**: [SKU Kiválasztás](docs/pre-deployment/sku-selection.md) - Költséghatékony választások
- **✅ Ellenőrzés**: [Előzetes Ellenőrzések](docs/pre-deployment/preflight-checks.md) - Automatizált szkriptek

#### Gyakorlati Feladatok
- Kapacitás-ellenőrző szkriptek futtatása
- SKU kiválasztások optimalizálása költségekhez
- Automatizált előzetes telepítési ellenőrzések implementálása

**💡 Fejezet Eredménye**: Telepítések validálása és optimalizálása végrehajtás előtt

---

### 🚨 7. Fejezet: Hibakeresés és Hibaelhárítás
**Előfeltételek**: Bármely telepítési fejezet elvégzése  
**Időtartam**: 1-1,5 óra  
**Nehézség**: ⭐⭐

#### Amit Megtanulsz
- Szisztematikus hibakeresési megközelítések
- Gyakori problémák és megoldások
- AI-specifikus hibakeresés

#### Tanulási Források
- **🔧 Gyakori Problémák**: [Gyakori Problémák](docs/troubleshooting/common-issues.md) - GYIK és megoldások
- **🕵️ Hibakeresés**: [Hibakeresési Útmutató](docs/troubleshooting/debugging.md) - Lépésről lépésre stratégiák
- **🤖 AI Problémák**: [AI-Specifikus Hibakeresés](docs/troubleshooting/ai-troubleshooting.md) - AI szolgáltatási problémák

#### Gyakorlati Feladatok
- Telepítési hibák diagnosztizálása
- Hitelesítési problémák megoldása
- AI szolgáltatási kapcsolódási hibák elhárítása

**💡 Fejezet Eredménye**: Gyakori telepítési problémák önálló diagn
**Időtartam**: 2-3 óra  
**Bonyolultság**: ⭐⭐⭐⭐

#### Amit megtanulsz
- Éles környezetbe történő telepítési stratégiák
- Vállalati biztonsági minták
- Felügyelet és költségoptimalizálás

#### Tanulási források
- **🏭 Éles környezet**: [Production AI Best Practices](docs/ai-foundry/production-ai-practices.md) - Vállalati minták
- **📝 Példák**: [Microservices Example](../../examples/microservices) - Összetett architektúrák
- **📊 Felügyelet**: Application Insights integráció

#### Gyakorlati feladatok
- Vállalati biztonsági minták megvalósítása
- Átfogó felügyeleti rendszer beállítása
- Telepítés éles környezetbe megfelelő irányítással

**💡 Fejezet eredménye**: Vállalati szintű alkalmazások telepítése teljes éles környezeti képességekkel

---

## 🎓 Workshop áttekintés: Gyakorlati tanulási élmény

### Interaktív workshop anyagok
**Átfogó gyakorlati tanulás böngészőalapú eszközökkel és irányított gyakorlatokkal**

Workshop anyagaink strukturált, interaktív tanulási élményt nyújtanak, amely kiegészíti a fent bemutatott fejezetalapú tananyagot. A workshop önálló tanulásra és oktató által vezetett foglalkozásokra egyaránt alkalmas.

#### 🛠️ Workshop jellemzők
- **Böngészőalapú felület**: Teljes MkDocs-alapú workshop keresési, másolási és témaválasztási funkciókkal
- **GitHub Codespaces integráció**: Egykattintásos fejlesztési környezet beállítás
- **Strukturált tanulási útvonal**: 7 lépéses irányított gyakorlatok (összesen 3,5 óra)
- **Felfedezés → Telepítés → Testreszabás**: Progresszív módszertan
- **Interaktív DevContainer környezet**: Előre konfigurált eszközök és függőségek

#### 📚 Workshop felépítése
A workshop a **Felfedezés → Telepítés → Testreszabás** módszertant követi:

1. **Felfedezési fázis** (45 perc)
   - Azure AI Foundry sablonok és szolgáltatások felfedezése
   - Többügynökös architektúra minták megértése
   - Telepítési követelmények és előfeltételek áttekintése

2. **Telepítési fázis** (2 óra)
   - AI alkalmazások gyakorlati telepítése AZD-vel
   - Azure AI szolgáltatások és végpontok konfigurálása
   - Biztonsági és hitelesítési minták megvalósítása

3. **Testreszabási fázis** (45 perc)
   - Alkalmazások módosítása specifikus felhasználási esetekhez
   - Optimalizálás éles környezeti telepítéshez
   - Felügyelet és költségkezelés megvalósítása

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
A workshop elvégzése után a résztvevők képesek lesznek:
- **Éles környezetbe telepíteni AI alkalmazásokat**: AZD használatával Azure AI Foundry szolgáltatásokkal
- **Többügynökös architektúrák elsajátítása**: Koordinált AI ügynök megoldások megvalósítása
- **Biztonsági legjobb gyakorlatok alkalmazása**: Hitelesítés és hozzáférés-vezérlés konfigurálása
- **Skálázás optimalizálása**: Költséghatékony, teljesítményorientált telepítések tervezése
- **Telepítési hibák elhárítása**: Gyakori problémák önálló megoldása

#### 📖 Workshop források
- **🎥 Interaktív útmutató**: [Workshop Materials](workshop/README.md) - Böngészőalapú tanulási környezet
- **📋 Lépésről lépésre útmutatók**: [Guided Exercises](../../workshop/docs/instructions) - Részletes útmutatók
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - AI-központú gyakorlatok
- **💡 Gyors kezdés**: [Workshop Setup Guide](workshop/README.md#quick-start) - Környezet konfigurálása

**Ideális**: Vállalati képzésekhez, egyetemi kurzusokhoz, önálló tanuláshoz és fejlesztői bootcamp-ekhez.

---

## 📖 Mi az Azure Developer CLI?

Az Azure Developer CLI (azd) egy fejlesztőközpontú parancssori eszköz, amely felgyorsítja az alkalmazások Azure-ba történő építésének és telepítésének folyamatát. Az alábbiakat kínálja:

- **Sablon alapú telepítések** - Előre elkészített sablonok használata gyakori alkalmazásmintákhoz
- **Infrastruktúra kódként** - Azure erőforrások kezelése Bicep vagy Terraform segítségével  
- **Integrált munkafolyamatok** - Alkalmazások zökkenőmentes előkészítése, telepítése és felügyelete
- **Fejlesztőbarát** - Optimalizált a fejlesztői termelékenység és élmény érdekében

### **AZD + Azure AI Foundry: Tökéletes AI telepítésekhez**

**Miért AZD az AI megoldásokhoz?** Az AZD megoldja az AI fejlesztők legnagyobb kihívásait:

- **AI-ra kész sablonok** - Előre konfigurált sablonok Azure OpenAI, Cognitive Services és ML munkaterhelésekhez
- **Biztonságos AI telepítések** - Beépített biztonsági minták AI szolgáltatásokhoz, API kulcsokhoz és modell végpontokhoz  
- **Éles környezeti AI minták** - Legjobb gyakorlatok skálázható, költséghatékony AI alkalmazások telepítéséhez
- **Végponttól végpontig AI munkafolyamatok** - Modellfejlesztéstől az éles környezeti telepítésig megfelelő felügyelettel
- **Költségoptimalizálás** - Okos erőforrás-allokáció és skálázási stratégiák AI munkaterhelésekhez
- **Azure AI Foundry integráció** - Zökkenőmentes kapcsolat az AI Foundry modellkatalógushoz és végpontokhoz

---

## 🎯 Sablonok és példák könyvtára

### Kiemelt: Azure AI Foundry sablonok
**Kezdd itt, ha AI alkalmazásokat telepítesz!**

| Sablon | Fejezet | Bonyolultság | Szolgáltatások |
|----------|---------|------------|----------|
| [**AI chat indítása**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 2. fejezet | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |
| [**AI ügynökök indítása**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 2. fejezet | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|
| [**Többügynökös munkafolyamat automatizálás**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 5. fejezet | ⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Dokumentumok generálása adatokból**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 4. fejezet | ⭐⭐⭐  | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|
| [**Ügyféltalálkozók javítása ügynökökkel**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 5. fejezet | ⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |
| [**Kód modernizálása ügynökökkel**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 5. fejezet | ⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Saját beszélgetési ügynök építése**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 4. fejezet | ⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|
| [**Beszélgetési adatokból származó betekintések feltárása**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 8. fejezet | ⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|
| [**Többmódú tartalomfeldolgozás**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 8. fejezet | ⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|

### Kiemelt: Teljes tanulási forgatókönyvek
**Éles környezetre kész alkalmazássablonok a tanulási fejezetekhez igazítva**

| Sablon | Tanulási fejezet | Bonyolultság | Fő tanulási cél |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 2. fejezet | ⭐ | Alapvető AI telepítési minták |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 2. fejezet | ⭐⭐ | RAG megvalósítás Azure AI Search segítségével |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 4. fejezet | ⭐⭐ | Dokumentumintelligencia integráció |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 5. fejezet | ⭐⭐⭐ | Ügynök keretrendszer és funkcióhívás |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 8. fejezet | ⭐⭐⭐ | Vállalati AI orkesztráció |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 5. fejezet | ⭐⭐⭐⭐ | Többügynökös architektúra ügyfél- és készletügynökökkel |

### Példák típus szerint

#### Egyszerű alkalmazások (1-2. fejezet)
- [Egyszerű webalkalmazás](../../examples/simple-web-app) - Alapvető telepítési minták
- [Statikus weboldal](../../examples/static-site) - Statikus tartalom telepítése
- [Alapvető API](../../examples/basic-api) - REST API telepítése

#### Adatbázis integráció (3-4. fejezet)  
- [Adatbázis alkalmazás](../../examples/database-app) - Adatbázis-kapcsolati minták
- [Adatfeldolgozás](../../examples/data-processing) - ETL munkafolyamat telepítése

#### Haladó minták (4-8. fejezet)
- [Kontejneres alkalmazások](../../examples/container-app) - Konténerizált telepítések
- [Mikroszolgáltatások](../../examples/microservices) - Többszolgáltatásos architektúrák  
- [Vállalati megoldások](../../examples/enterprise) - Éles környezetre kész minták

### Külső sablongyűjtemények
- [**Hivatalos AZD sablongaléria**](https://azure.github.io/awesome-azd/) - Hivatalos és közösségi sablonok válogatása
- [**Azure Developer CLI sablonok**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn sablondokumentáció
- [**Példák könyvtára**](examples/README.md) - Helyi tanulási példák részletes magyarázatokkal

---

## 📚 Tanulási források és hivatkozások

### Gyors hivatkozások
- [**Parancsok segédlete**](resources/cheat-sheet.md) - Alapvető azd parancsok fejezetenként rendezve
- [**Szójegyzék**](resources/glossary.md) - Azure és azd terminológia  
- [**GYIK**](resources/faq.md) - Gyakori kérdések fejezetenként rendezve
- [**Tanulási útmutató**](resources/study-guide.md) - Átfogó gyakorlati feladatok

### Gyakorlati workshopok
- [**AI Workshop Lab**](docs/ai-foundry/ai-workshop-lab.md) - AI megoldások AZD-vel történő telepítéséhez (2-3 óra)
- [**Interaktív workshop útmutató**](workshop/README.md) - Böngészőalapú workshop MkDocs és DevContainer környezettel
- [**Strukturált tanulási útvonal**](../../workshop/docs/instructions) - 7 lépéses irányított gyakorlatok (Felfedezés → Telepítés → Testreszabás)
- [**AZD kezdőknek workshop**](workshop/README.md) - Teljes gyakorlati workshop anyagok GitHub Codespaces integrációval

### Külső tanulási források
- [Azure Developer CLI dokumentáció](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architektúra Központ](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Ár kalkulátor](https://azure.microsoft.com/pricing/calculator/)
- [Azure Állapot](https://status.azure.com/)

---

## 🎓 Tanfolyam befejezése és tanúsítvány

### Haladás nyomon követése
Kövesd nyomon tanulási haladásodat minden fejezeten keresztül:

- [ ] **1. fejezet**: Alapok és gyors kezdés ✅
- [ ] **2. fejezet**: AI-első fejlesztés ✅  
- [ ] **3. fejezet**: Konfiguráció és hitelesítés ✅
- [ ] **4. fejezet**: Infrastruktúra kódként és telepítés ✅
- [ ] **5. fejezet**: Többügynökös AI megoldások ✅
- [ ] **6. fejezet**: Előtelepítési validáció és tervezés ✅
- [ ] **7. fejezet**: Hibakeresés és hibaelhárítás ✅
- [ ] **8. fejezet**: Éles környezet és vállalati minták ✅

### Tanulás ellenőrzése
Minden fejezet befejezése után ellenőrizd tudásodat:
1. **Gyakorlati feladat**: Teljesítsd a fejezet gyakorlati telepítését
2. **Tudásellenőrzés**: Tekintsd át a fejezet GYIK szekcióját
3. **Közösségi megbeszélés**: Oszd meg tapasztalataidat az Azure Discordon
4. **Következő fejezet**: Lépj a következő bonyolultsági szintre

### Tanfolyam befejezésének előnyei
A fejezetek elvégzése után rendelkezel:
- **Éles környezeti tapasztalat**: Valós AI alkalmazások telepítése Azure-ba
- **Szakmai készségek**: Vállalati szintű telepítési képességek  
- **Közösségi elismerés**: Aktív tagja az Azure fejlesztői közösségnek
- **Karrier előrelépés**: Keresett AZD és AI telepítési szakértelem

---

## 🤝 Közösség és támogatás

### Segítség és támogatás
- **Technikai problémák**: [Hibák jelentése és funkciókérések](https://github.com/microsoft/azd-for-beginners/issues)
- **Tanulási kérdések**: [Microsoft Azure Discord közösség](https://discord.gg/microsoft-azure) és [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-specifikus segítség**: C
- Hozzájárulás az AI bevezetési legjobb gyakorlatokhoz  
- Hatásgyakorlás a jövőbeli AI + AZD funkciók fejlesztésére  

### Hozzájárulás a tanfolyamhoz  
Örömmel fogadjuk a hozzájárulásokat! Kérjük, olvassa el a [Hozzájárulási útmutatót](CONTRIBUTING.md) a részletekért:  
- **Tartalomfejlesztés**: A meglévő fejezetek és példák fejlesztése  
- **Új példák**: Valós életből vett forgatókönyvek és sablonok hozzáadása  
- **Fordítás**: Segítség a többnyelvű támogatás fenntartásában  
- **Hibajelentések**: A pontosság és érthetőség javítása  
- **Közösségi normák**: Az inkluzív közösségi irányelveink követése  

---

## 📄 Tanfolyami információk  

### Licenc  
Ez a projekt az MIT Licenc alatt áll - részletekért lásd a [LICENSE](../../LICENSE) fájlt.  

### Kapcsolódó Microsoft tanulási források  

Csapatunk más átfogó tanfolyamokat is készít:  

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### Azure / Edge / MCP / Ügynökök  
[![AZD kezdőknek](https://img.shields.io/badge/AZD%20kezdőknek-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)  
[![Edge AI kezdőknek](https://img.shields.io/badge/Edge%20AI%20kezdőknek-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)  
[![MCP kezdőknek](https://img.shields.io/badge/MCP%20kezdőknek-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)  
[![AI ügynökök kezdőknek](https://img.shields.io/badge/AI%20ügynökök%20kezdőknek-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  

---

### Generatív AI sorozat  
[![Generatív AI kezdőknek](https://img.shields.io/badge/Generatív%20AI%20kezdőknek-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)  
[![Generatív AI (.NET)](https://img.shields.io/badge/Generatív%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)  
[![Generatív AI (Java)](https://img.shields.io/badge/Generatív%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)  
[![Generatív AI (JavaScript)](https://img.shields.io/badge/Generatív%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)  

---

### Alapvető tanulás  
[![ML kezdőknek](https://img.shields.io/badge/ML%20kezdőknek-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)  
[![Adattudomány kezdőknek](https://img.shields.io/badge/Adattudomány%20kezdőknek-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)  
[![AI kezdőknek](https://img.shields.io/badge/AI%20kezdőknek-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)  
[![Kiberbiztonság kezdőknek](https://img.shields.io/badge/Kiberbiztonság%20kezdőknek-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)  
[![Webfejlesztés kezdőknek](https://img.shields.io/badge/Webfejlesztés%20kezdőknek-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)  
[![IoT kezdőknek](https://img.shields.io/badge/IoT%20kezdőknek-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)  
[![XR fejlesztés kezdőknek](https://img.shields.io/badge/XR%20fejlesztés%20kezdőknek-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)  

---

### Copilot sorozat  
[![Copilot az AI páros programozáshoz](https://img.shields.io/badge/Copilot%20az%20AI%20páros%20programozáshoz-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)  
[![Copilot C#/.NET-hez](https://img.shields.io/badge/Copilot%20C%23/.NET-hez-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)  
[![Copilot kaland](https://img.shields.io/badge/Copilot%20kaland-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)  
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Tanfolyam navigáció  

**🚀 Készen áll a tanulásra?**  

**Kezdők**: Kezdje az [1. fejezettel: Alapok és gyors kezdés](../..)  
**AI fejlesztők**: Ugorjon a [2. fejezethez: AI-első fejlesztés](../..)  
**Tapasztalt fejlesztők**: Kezdje a [3. fejezettel: Konfiguráció és hitelesítés](../..)  

**Következő lépések**: [Kezdje az 1. fejezetet - AZD alapok](docs/getting-started/azd-basics.md) →  

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Felelősség kizárása**:  
Ezt a dokumentumot az [Co-op Translator](https://github.com/Azure/co-op-translator) AI fordítási szolgáltatás segítségével fordították le. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Kritikus információk esetén javasolt professzionális emberi fordítást igénybe venni. Nem vállalunk felelősséget a fordítás használatából eredő félreértésekért vagy téves értelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->