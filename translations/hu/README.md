<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "21dcf6a2d8a223a853d965138d4fb045",
  "translation_date": "2025-09-18T09:09:10+00:00",
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

Kövesd az alábbi lépéseket, hogy elindítsd az AZD tanulási utadat:

1. **Forkold a repót**: Kattints ide [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klónozd a repót**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Csatlakozz a közösséghez**: [Azure Discord közösségek](https://discord.com/invite/ByRwuEEgH4) szakértői támogatásért
4. **Válaszd ki a tanulási utadat**: Válassz egy fejezetet az alábbiak közül, amely megfelel a tapasztalati szintednek

### Többnyelvű támogatás

#### Automatikus fordítások (mindig naprakészek)

[Francia](../fr/README.md) | [Spanyol](../es/README.md) | [Német](../de/README.md) | [Orosz](../ru/README.md) | [Arab](../ar/README.md) | [Perzsa (Fárszi)](../fa/README.md) | [Urdu](../ur/README.md) | [Kínai (Egyszerűsített)](../zh/README.md) | [Kínai (Hagyományos, Makaó)](../mo/README.md) | [Kínai (Hagyományos, Hongkong)](../hk/README.md) | [Kínai (Hagyományos, Tajvan)](../tw/README.md) | [Japán](../ja/README.md) | [Koreai](../ko/README.md) | [Hindi](../hi/README.md) | [Bengáli](../bn/README.md) | [Marathi](../mr/README.md) | [Nepáli](../ne/README.md) | [Pandzsábi (Gurmukhi)](../pa/README.md) | [Portugál (Portugália)](../pt/README.md) | [Portugál (Brazília)](../br/README.md) | [Olasz](../it/README.md) | [Lengyel](../pl/README.md) | [Török](../tr/README.md) | [Görög](../el/README.md) | [Thai](../th/README.md) | [Svéd](../sv/README.md) | [Dán](../da/README.md) | [Norvég](../no/README.md) | [Finn](../fi/README.md) | [Holland](../nl/README.md) | [Héber](../he/README.md) | [Vietnámi](../vi/README.md) | [Indonéz](../id/README.md) | [Maláj](../ms/README.md) | [Tagalog (Filippínó)](../tl/README.md) | [Szuahéli](../sw/README.md) | [Magyar](./README.md) | [Cseh](../cs/README.md) | [Szlovák](../sk/README.md) | [Román](../ro/README.md) | [Bolgár](../bg/README.md) | [Szerb (Cirill)](../sr/README.md) | [Horvát](../hr/README.md) | [Szlovén](../sl/README.md) | [Ukrán](../uk/README.md) | [Burmai (Mianmar)](../my/README.md)

## Kurzus áttekintése

Sajátítsd el az Azure Developer CLI-t (azd) strukturált fejezeteken keresztül, amelyek progresszív tanulást biztosítanak. **Különös hangsúlyt fektetve az AI alkalmazások Azure AI Foundry integrációval történő telepítésére.**

### Miért elengedhetetlen ez a kurzus a modern fejlesztők számára?

Az Azure AI Foundry Discord közösség visszajelzései alapján **a fejlesztők 45%-a szeretné használni az AZD-t AI munkafolyamatokhoz**, de nehézségekbe ütköznek az alábbiak miatt:
- Bonyolult, több szolgáltatást érintő AI architektúrák
- AI alkalmazások éles környezetbe történő telepítésének legjobb gyakorlatai  
- Azure AI szolgáltatások integrációja és konfigurálása
- AI munkafolyamatok költségoptimalizálása
- AI-specifikus telepítési problémák elhárítása

### Tanulási célok

A kurzus elvégzésével:
- **Elsajátítod az AZD alapjait**: Alapfogalmak, telepítés és konfiguráció
- **AI alkalmazásokat telepítesz**: AZD használata Azure AI Foundry szolgáltatásokkal
- **Infrastruktúra mint kód**: Azure erőforrások kezelése Bicep sablonokkal
- **Telepítési hibák elhárítása**: Gyakori problémák megoldása és hibakeresés
- **Éles környezetre optimalizálás**: Biztonság, skálázás, monitorozás és költségkezelés
- **Többügynökös megoldások építése**: Komplex AI architektúrák telepítése

## 📚 Tanulási fejezetek

*Válaszd ki a tanulási utadat a tapasztalati szinted és céljaid alapján*

### 🚀 1. fejezet: Alapok és gyors kezdés
**Előfeltételek**: Azure előfizetés, alapvető parancssori ismeretek  
**Időtartam**: 30-45 perc  
**Nehézség**: ⭐

#### Amit megtanulsz
- Az Azure Developer CLI alapjainak megértése
- AZD telepítése a platformodra
- Az első sikeres telepítésed

#### Tanulási források
- **🎯 Kezd itt**: [Mi az Azure Developer CLI?](../..)
- **📖 Elmélet**: [AZD alapok](docs/getting-started/azd-basics.md) - Alapfogalmak és terminológia
- **⚙️ Beállítás**: [Telepítés és beállítás](docs/getting-started/installation.md) - Platformspecifikus útmutatók
- **🛠️ Gyakorlati rész**: [Az első projekted](docs/getting-started/first-project.md) - Lépésről lépésre útmutató
- **📋 Gyors referencia**: [Parancsok puskája](resources/cheat-sheet.md)

#### Gyakorlati feladatok
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 Fejezet eredménye**: Sikeresen telepítesz egy egyszerű webalkalmazást az Azure-ra AZD használatával

---

### 🤖 2. fejezet: AI-első fejlesztés (Ajánlott AI fejlesztőknek)
**Előfeltételek**: 1. fejezet elvégzése  
**Időtartam**: 1-2 óra  
**Nehézség**: ⭐⭐

#### Amit megtanulsz
- Azure AI Foundry integráció AZD-vel
- AI-alapú alkalmazások telepítése
- AI szolgáltatások konfigurációjának megértése

#### Tanulási források
- **🎯 Kezd itt**: [Azure AI Foundry integráció](docs/ai-foundry/azure-ai-foundry-integration.md)
- **📖 Minták**: [AI modell telepítés](docs/ai-foundry/ai-model-deployment.md) - AI modellek kezelése
- **🛠️ Workshop**: [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - AI megoldások AZD-re készítése
- **📋 Sablonok**: [Azure AI Foundry sablonok](../..)

#### Gyakorlati feladatok
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Fejezet eredménye**: Telepítesz és konfigurálsz egy AI-alapú chatalkalmazást RAG képességekkel

---

### ⚙️ 3. fejezet: Konfiguráció és hitelesítés
**Előfeltételek**: 1. fejezet elvégzése  
**Időtartam**: 45-60 perc  
**Nehézség**: ⭐⭐

#### Amit megtanulsz
- Környezetek konfigurálása és kezelése
- Hitelesítési és biztonsági legjobb gyakorlatok
- Erőforrások elnevezése és szervezése

#### Tanulási források
- **📖 Konfiguráció**: [Konfigurációs útmutató](docs/getting-started/configuration.md) - Környezetbeállítás
- **🔐 Biztonság**: Hitelesítési minták és kezelt identitás
- **📝 Példák**: [Adatbázis alkalmazás példa](../../examples/database-app) - Konfigurációs minták

#### Gyakorlati feladatok
- Több környezet konfigurálása (fejlesztés, tesztelés, éles)
- Kezelt identitás hitelesítés beállítása
- Környezet-specifikus konfigurációk megvalósítása

**💡 Fejezet eredménye**: Több környezet kezelése megfelelő hitelesítéssel és biztonsággal

---

### 🏗️ 4. fejezet: Infrastruktúra mint kód és telepítés
**Előfeltételek**: 1-3. fejezet elvégzése  
**Időtartam**: 1-1,5 óra  
**Nehézség**: ⭐⭐⭐

#### Amit megtanulsz
- Haladó telepítési minták
- Infrastruktúra mint kód Bicep segítségével
- Erőforrások biztosítási stratégiái

#### Tanulási források
- **📖 Telepítés**: [Telepítési útmutató](docs/deployment/deployment-guide.md) - Teljes munkafolyamatok
- **🏗️ Biztosítás**: [Erőforrások biztosítása](docs/deployment/provisioning.md) - Azure erőforrások kezelése
- **📝 Példák**: [Konténer alkalmazás példa](../../examples/container-app) - Konténerizált telepítések

#### Gyakorlati feladatok
- Egyedi Bicep sablonok létrehozása
- Több szolgáltatást érintő alkalmazások telepítése
- Kék-zöld telepítési stratégiák megvalósítása

**💡 Fejezet eredménye**: Komplex, több szolgáltatást érintő alkalmazások telepítése egyedi infrastruktúra sablonokkal

---

### 🎯 5. fejezet: Többügynökös AI megoldások (Haladó)
**Előfeltételek**: 1-2. fejezet elvégzése  
**Időtartam**: 2-3 óra  
**Nehézség**: ⭐⭐⭐⭐

#### Amit megtanulsz
- Többügynökös architektúra minták
- Ügynökök koordinációja és együttműködése
- Éles környezetre kész AI telepítések

#### Tanulási források
- **🤖 Kiemelt projekt**: [Kiskereskedelmi többügynökös megoldás](examples/retail-scenario.md) - Teljes megvalósítás
- **🛠️ ARM sablonok**: [ARM sablon csomag](../../examples/retail-multiagent-arm-template) - Egykattintásos telepítés
- **📖 Architektúra**: Többügynökös koordinációs minták

#### Gyakorlati feladatok
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Fejezet eredménye**: Éles környezetre kész többügynökös AI megoldás telepítése és kezelése ügyfél- és készletügynökökkel

---

### 🔍 6. fejezet: Telepítés előtti validáció és tervezés
**Előfeltételek**: 4. fejezet elvégzése  
**Időtartam**: 1 óra  
**Nehézség**: ⭐⭐

#### Amit megtanulsz
- Kapacitástervezés és erőforrás-validáció
- SKU kiválasztási stratégiák
- Előzetes ellenőrzések és automatizálás

#### Tanulási források
- **📊 Tervezés**: [Kapacitástervezés](docs/pre-deployment/capacity-planning.md) - Erőforrás-validáció
- **💰 Kiválasztás**: [SKU kiválasztás](docs/pre-deployment/sku-selection.md) - Költséghatékony választások
- **✅ Validáció**: [Előzetes ellenőrzések](docs/pre-deployment/preflight-checks.md) - Automatizált szkriptek

#### Gyakorlati feladatok
- Kapacitásvalidációs szkriptek futtatása
- SKU kiválasztás optimalizálása költségekhez
- Automatizált telepítés előtti ellenőrzések megvalósítása

**💡 Fejezet eredménye**: Telepítések validálása és optimalizálása végrehajtás előtt

---

### 🚨 7. fejezet: Hibakeresés és problémamegoldás
**Előfeltételek**: Bármely telepítési fejezet elvégzése  
**Időtartam**: 1-1,5 óra  
**Nehézség**: ⭐⭐

#### Amit megtanulsz
- Szisztematikus hibakeresési megközelítések
- Gyakori problémák és megoldások
- AI-specifikus hibakeresés

#### Tanulási források
- **🔧 Gyakori problémák**: [Gyakori problémák](docs/troubleshooting/common-issues.md) - GYIK és megoldások
- **🕵️ Hibakeresés**: [Hibakeresési útmutató](docs/troubleshooting/debugging.md) - Lépésről lépésre stratégiák
- **🤖 AI problémák**: [AI-specifikus hibakeresés](docs/troubleshooting/ai-troubleshooting.md) - AI szolgáltatások problémái

#### Gyakorlati feladatok
- Telepítési hibák diagnosztizálása
- Hitelesítési problémák megoldása
- AI szolgáltatások csatlakozási hibáinak hibakeresése

**💡 Fejezet eredménye**: Önállóan diagnosztizálod és megoldod a gyakori telepítési problémákat

---

### 🏢 8. fejezet: Éles környezet és vállalati minták
**Előfeltételek**: 1-4. fejezet elvégzése  
**Időtartam**: 2-3 óra  
**Nehézség**: ⭐⭐⭐⭐

#### Amit megtanulsz
- Éles környezetre történő telepítési stratégiák
- Vállalati biztonsági minták
- Monitorozás és költségoptimalizálás

#### Tanulási források
- **🏭 Éles környezet**: [AI éles környezet legjobb gyakorlatai](docs/ai-foundry/production-ai-practices.md) - Vállalati minták
- **📝 Példák**: [Mikroszolgáltatások példája](examples
- **📊 Felügyelet**: Application Insights integráció

#### Gyakorlati Feladatok
- Vállalati biztonsági minták megvalósítása
- Átfogó monitorozás beállítása
- Éles környezetbe telepítés megfelelő irányítással

**💡 Fejezet Eredménye**: Vállalati szintű alkalmazások telepítése teljes éles környezeti képességekkel

---

## 📖 Mi az Azure Developer CLI?

Az Azure Developer CLI (azd) egy fejlesztőközpontú parancssori eszköz, amely felgyorsítja az alkalmazások Azure-ba történő építését és telepítését. Az alábbiakat kínálja:

- **Sablon-alapú telepítések** - Előre elkészített sablonok használata gyakori alkalmazási mintákhoz
- **Infrastruktúra kódként** - Azure erőforrások kezelése Bicep vagy Terraform segítségével  
- **Integrált munkafolyamatok** - Alkalmazások zökkenőmentes előkészítése, telepítése és monitorozása
- **Fejlesztőbarát** - Optimalizált a fejlesztői produktivitás és élmény érdekében

### **AZD + Azure AI Foundry: Tökéletes AI telepítésekhez**

**Miért AZD az AI megoldásokhoz?** Az AZD megoldja az AI fejlesztők legnagyobb kihívásait:

- **AI-kész sablonok** - Előre konfigurált sablonok az Azure OpenAI, Cognitive Services és ML munkaterhelésekhez
- **Biztonságos AI telepítések** - Beépített biztonsági minták AI szolgáltatásokhoz, API kulcsokhoz és modell végpontokhoz  
- **Éles AI minták** - Legjobb gyakorlatok skálázható, költséghatékony AI alkalmazások telepítéséhez
- **Teljes körű AI munkafolyamatok** - Modellfejlesztéstől az éles telepítésig megfelelő monitorozással
- **Költségoptimalizálás** - Okos erőforrás-elosztási és skálázási stratégiák AI munkaterhelésekhez
- **Azure AI Foundry integráció** - Zökkenőmentes kapcsolat az AI Foundry modellkatalógushoz és végpontokhoz

---

## 🎯 Sablonok és Példák Könyvtára

### Kiemelt: Azure AI Foundry Sablonok
**Kezdd itt, ha AI alkalmazásokat telepítesz!**

| Sablon | Fejezet | Komplexitás | Szolgáltatások |
|--------|---------|-------------|----------------|
| [**AI chat indítása**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Fejezet 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |
| [**AI ügynökök indítása**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Fejezet 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|
| [**Több ügynökös munkafolyamat automatizálás**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Fejezet 5 | ⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Dokumentumok generálása adatokból**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Fejezet 4 | ⭐⭐⭐  | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|
| [**Ügyfélmegbeszélések javítása ügynökökkel**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Fejezet 5 | ⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |
| [**Kód modernizálása ügynökökkel**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Fejezet 5 | ⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Beszélgetési ügynök építése**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Fejezet 4 | ⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|
| [**Beszélgetési adatokból származó betekintések feltárása**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Fejezet 8 | ⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|
| [**Többmódú tartalomfeldolgozás**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Fejezet 8 | ⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|

### Kiemelt: Teljes Tanulási Forgatókönyvek
**Éles környezetre kész alkalmazási sablonok tanulási fejezetekhez igazítva**

| Sablon | Tanulási Fejezet | Komplexitás | Fő Tanulási Cél |
|--------|------------------|-------------|-----------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Fejezet 2 | ⭐ | Alapvető AI telepítési minták |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Fejezet 2 | ⭐⭐ | RAG megvalósítás Azure AI Search segítségével |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Fejezet 4 | ⭐⭐ | Dokumentum intelligencia integráció |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Fejezet 5 | ⭐⭐⭐ | Ügynök keretrendszer és funkcióhívás |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Fejezet 8 | ⭐⭐⭐ | Vállalati AI orkestráció |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Fejezet 5 | ⭐⭐⭐⭐ | Több ügynökös architektúra ügyfél- és készletügynökökkel |

### Példák Típus Szerint

#### Egyszerű Alkalmazások (1-2. fejezet)
- [Egyszerű Webalkalmazás](../../examples/simple-web-app) - Alapvető telepítési minták
- [Statikus Weboldal](../../examples/static-site) - Statikus tartalom telepítése
- [Alapvető API](../../examples/basic-api) - REST API telepítése

#### Adatbázis Integráció (3-4. fejezet)  
- [Adatbázis Alkalmazás](../../examples/database-app) - Adatbázis kapcsolódási minták
- [Adatfeldolgozás](../../examples/data-processing) - ETL munkafolyamat telepítése

#### Haladó Minták (4-8. fejezet)
- [Konténer Alkalmazások](../../examples/container-app) - Konténeres telepítések
- [Mikroszolgáltatások](../../examples/microservices) - Többszolgáltatásos architektúrák  
- [Vállalati Megoldások](../../examples/enterprise) - Éles környezetre kész minták

### Külső Sablon Gyűjtemények
- [**Azure-Samples AZD Sablonok**](https://github.com/Azure-Samples/azd-templates) - Hivatalos Microsoft minták
- [**Awesome AZD Galéria**](https://azure.github.io/awesome-azd/) - Közösségi hozzájárulások
- [**Példák Könyvtára**](examples/README.md) - Helyi tanulási példák részletes magyarázatokkal

---

## 📚 Tanulási Erőforrások és Hivatkozások

### Gyors Hivatkozások
- [**Parancsok Segédlete**](resources/cheat-sheet.md) - Alapvető azd parancsok fejezetek szerint rendezve
- [**Szójegyzék**](resources/glossary.md) - Azure és azd terminológia  
- [**GYIK**](resources/faq.md) - Gyakori kérdések fejezetek szerint rendezve
- [**Tanulási Útmutató**](resources/study-guide.md) - Átfogó gyakorlati feladatok

### Gyakorlati Workshopok
- [**AI Workshop Lab**](docs/ai-foundry/ai-workshop-lab.md) - AI megoldások AZD-kompatibilissé tétele
- [**AZD Kezdőknek Workshop**](workshop/README.md) - Teljes gyakorlati workshop anyagok

### Külső Tanulási Erőforrások
- [Azure Developer CLI Dokumentáció](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architektúra Központ](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Ár Kalkulátor](https://azure.microsoft.com/pricing/calculator/)
- [Azure Állapot](https://status.azure.com/)

---

## 🎓 Tanfolyam Befejezése és Tanúsítvány

### Haladás Követése
Kövesd tanulási előrehaladásodat minden fejezeten keresztül:

- [ ] **1. fejezet**: Alapok és Gyors Kezdés ✅
- [ ] **2. fejezet**: AI-első Fejlesztés ✅  
- [ ] **3. fejezet**: Konfiguráció és Hitelesítés ✅
- [ ] **4. fejezet**: Infrastruktúra kódként és Telepítés ✅
- [ ] **5. fejezet**: Több Ügynökös AI Megoldások ✅
- [ ] **6. fejezet**: Előtelepítési Validáció és Tervezés ✅
- [ ] **7. fejezet**: Hibakeresés és Debugolás ✅
- [ ] **8. fejezet**: Éles és Vállalati Minták ✅

### Tanulási Ellenőrzés
Minden fejezet befejezése után ellenőrizd tudásodat:
1. **Gyakorlati Feladat**: Teljesítsd a fejezet gyakorlati telepítését
2. **Tudás Ellenőrzés**: Nézd át a fejezet GYIK szekcióját
3. **Közösségi Megbeszélés**: Oszd meg tapasztalataidat az Azure Discordon
4. **Következő Fejezet**: Lépj a következő komplexitási szintre

### Tanfolyam Befejezési Előnyök
A fejezetek befejezése után:
- **Éles Tapasztalat**: Valós AI alkalmazásokat telepítettél Azure-ba
- **Professzionális Képességek**: Vállalati szintű telepítési képességek  
- **Közösségi Elismerés**: Aktív tagja lettél az Azure fejlesztői közösségnek
- **Karrier Előrelépés**: Keresett AZD és AI telepítési szakértelem

---

## 🤝 Közösség és Támogatás

### Segítség és Támogatás
- **Technikai Problémák**: [Hibák jelentése és funkciók kérése](https://github.com/microsoft/azd-for-beginners/issues)
- **Tanulási Kérdések**: [Microsoft Azure Discord Közösség](https://discord.gg/microsoft-azure)
- **AI-specifikus Segítség**: Csatlakozz az [#Azure csatornához](https://discord.gg/microsoft-azure) AZD + AI Foundry beszélgetésekhez
- **Dokumentáció**: [Hivatalos Azure Developer CLI dokumentáció](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Közösségi Érdekességek az Azure AI Foundry Discordról

**Legutóbbi Szavazási Eredmények az #Azure Csatornán:**
- **45%** fejlesztő szeretné AZD-t használni AI munkaterhelésekhez
- **Fő kihívások**: Több szolgáltatásos telepítések, hitelesítés kezelése, éles környezeti felkészültség  
- **Leginkább kért**: AI-specifikus sablonok, hibakeresési útmutatók, legjobb gyakorlatok

**Csatlakozz közösségünkhöz, hogy:**
- Megoszd AZD + AI tapasztalataidat és segítséget kapj
- Hozzáférj új AI sablonok korai előnézeteihez
- Hozzájárulj AI telepítési legjobb gyakorlatokhoz
- Hatással legyél a jövőbeli AI + AZD funkciófejlesztésekre

### Hozzájárulás a Tanfolyamhoz
Szívesen fogadjuk a hozzájárulásokat! Olvasd el [Hozzájárulási Útmutatónkat](CONTRIBUTING.md) a részletekért:
- **Tartalom Fejlesztések**: A meglévő fejezetek és példák javítása
- **Új Példák**: Valós forgatókönyvek és sablonok hozzáadása  
- **Fordítás**: Segíts a többnyelvű támogatás fenntartásában
- **Hibajelentések**: Pontosság és érthetőség javítása
- **Közösségi Normák**: Kövesd befogadó közösségi irányelveinket

---

## 📄 Tanfolyam Információ

### Licenc
Ez a projekt az MIT Licenc alatt van licencelve - részletekért lásd a [LICENSE](../../LICENSE) fájlt.

### Kapcsolódó Microsoft Tanulási Erőforrások

Csapatunk más átfogó tanfolyamokat is készít:

- [**ÚJ** Model Context Protocol (MCP) Kezdőknek](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
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
- [GitHub Copilot Elsajátítása AI Páros Programozáshoz](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [GitHub Copilot Elsajátítása C#/.NET Fejlesztőknek](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [Válaszd Ki Saját Copilot Kalandodat](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

## 🗺️ Tanfolyam Navigáció

**🚀 Készen állsz a tanulásra?**

**Kezdők**: Kezdd az [1. fejezet: Alapok és Gyors Kezdés](../..)  
**AI Fejlesztők**: Ugorj a [2. fejezet: AI-első Fejlesztés](../..) fejezethez
**Tapasztalt fejlesztők**: Kezdje a [3. fejezet: Konfiguráció és hitelesítés](../..) résznél

**Következő lépések**: [Kezdje az 1. fejezetet - AZD alapok](docs/getting-started/azd-basics.md) →

---

**Felelősség kizárása**:  
Ez a dokumentum az AI fordítási szolgáltatás [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével lett lefordítva. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Kritikus információk esetén javasolt professzionális emberi fordítást igénybe venni. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely a fordítás használatából eredhet.