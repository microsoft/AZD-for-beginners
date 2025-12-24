<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1caf5e63f84a4cdffbeb8d0fe5fa3fa8",
  "translation_date": "2025-12-21T18:54:59+00:00",
  "source_file": "README.md",
  "language_code": "hu"
}
-->
# AZD kezdőknek: Strukturált tanulási út

![AZD kezdőknek](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.hu.png) 

[![GitHub figyelők](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forkok](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub csillagok](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord közösség](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord közösség](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## Kezdés ezzel a tanfolyammal

Kövesd ezeket a lépéseket az AZD tanulási utad elkezdéséhez:

1. **Forkold a tárolót**: Kattints [![GitHub forkok](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klónozd a tárolót**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Csatlakozz a közösséghez**: [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) szakértői támogatásért
4. **Válaszd ki a tanulási utadat**: Válassz egy fejezetet az alábbiak közül, amely megfelel a tapasztalatodnak

### Többnyelvű támogatás

#### Automatikus fordítások (mindig naprakész)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arab](../ar/README.md) | [Bengáli](../bn/README.md) | [Bolgár](../bg/README.md) | [Burmai (Myanmar)](../my/README.md) | [Kínai (egyszerűsített)](../zh/README.md) | [Kínai (hagyományos, Hong Kong)](../hk/README.md) | [Kínai (hagyományos, Macau)](../mo/README.md) | [Kínai (hagyományos, Taiwan)](../tw/README.md) | [Horvát](../hr/README.md) | [Cseh](../cs/README.md) | [Dán](../da/README.md) | [Holland](../nl/README.md) | [Észt](../et/README.md) | [Finn](../fi/README.md) | [Francia](../fr/README.md) | [Német](../de/README.md) | [Görög](../el/README.md) | [Héber](../he/README.md) | [Hindi](../hi/README.md) | [Magyar](./README.md) | [Indonéz](../id/README.md) | [Olasz](../it/README.md) | [Japán](../ja/README.md) | [Kannada](../kn/README.md) | [Koreai](../ko/README.md) | [Litván](../lt/README.md) | [Maláj](../ms/README.md) | [Malajálam](../ml/README.md) | [Maráthi](../mr/README.md) | [Nepáli](../ne/README.md) | [Nigériai pidgin](../pcm/README.md) | [Norvég](../no/README.md) | [Perzsa (fárszi)](../fa/README.md) | [Lengyel](../pl/README.md) | [Portugál (Brazília)](../br/README.md) | [Portugál (Portugália)](../pt/README.md) | [Pandzsábi (Gurmukhi)](../pa/README.md) | [Román](../ro/README.md) | [Orosz](../ru/README.md) | [Szerb (cirill)](../sr/README.md) | [Szlovák](../sk/README.md) | [Szlovén](../sl/README.md) | [Spanyol](../es/README.md) | [Svahili](../sw/README.md) | [Svéd](../sv/README.md) | [Tagalog (filippínó)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Török](../tr/README.md) | [Ukrán](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnami](../vi/README.md)
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## Tanfolyam áttekintése

Sajátítsd el az Azure Developer CLI-t (azd) strukturált fejezeteken keresztül, amelyek a fokozatos tanulást szolgálják. **Különös hangsúly az AI-alkalmazások telepítésén a Microsoft Foundry integrációval.**

### Miért fontos ez a tanfolyam a modern fejlesztők számára

A Microsoft Foundry Discord közösség visszajelzései alapján, **a fejlesztők 45%-a szeretné az AZD-t AI munkaterhelésekhez használni**, de a következő kihívásokkal találkoznak:
- Komplex, több szolgáltatást magában foglaló AI-architektúrák
- AI üzembe helyezés gyártásban: bevált gyakorlatok  
- Azure AI szolgáltatások integrációja és konfigurálása
- Költségoptimalizálás AI munkaterhelésekhez
- AI-specifikus telepítési problémák hibakeresése

### Tanulási célok

A tanfolyam elvégzése után:
- **Az AZD alapjainak elsajátítása**: Alapfogalmak, telepítés és konfiguráció
- **AI-alkalmazások telepítése**: AZD használata Microsoft Foundry szolgáltatásokkal
- **Infrastruktúra mint kód megvalósítása**: Azure erőforrások kezelése Bicep sablonokkal
- **Telepítések hibakeresése**: Gyakori problémák megoldása és hibakeresés
- **Gyártásra optimalizálás**: Biztonság, skálázás, monitorozás és költségkezelés
- **Többügynökös megoldások építése**: Komplex AI architektúrák telepítése

## 📚 Tanulási fejezetek

*Válaszd ki tanulási utadat a tapasztalatod és céljaid alapján*

### 🚀 1. fejezet: Alapok és gyors kezdés
**Előfeltételek**: Azure előfizetés, alapvető parancssori ismeretek  
**Időtartam**: 30-45 perc  
**Bonyolultság**: ⭐

#### Mit fogsz megtanulni
- Az Azure Developer CLI alapjainak megértése
- AZD telepítése a platformodra
- Az első sikeres telepítésed

#### Tanulási források
- **🎯 Kezdd itt**: [Mi az Azure Developer CLI?](../..)
- **📖 Elmélet**: [AZD alapok](docs/getting-started/azd-basics.md) - Alapfogalmak és terminológia
- **⚙️ Beállítás**: [Telepítés & Beállítás](docs/getting-started/installation.md) - Platformspecifikus útmutatók
- **🛠️ Gyakorlati**: [Az első projekted](docs/getting-started/first-project.md) - Lépésről lépésre útmutató
- **📋 Gyors hivatkozás**: [Parancs összefoglaló](resources/cheat-sheet.md)

#### Gyakorlati feladatok
```bash
# Gyors telepítés ellenőrzése
azd version

# Telepítse az első alkalmazását
azd init --template todo-nodejs-mongo
azd up
```

**💡 A fejezet eredménye**: Sikeresen telepítesz egy egyszerű webalkalmazást az Azure-ra AZD használatával

**✅ Siker ellenőrzése:**
```bash
# Az 1. fejezet befejezése után képesnek kell lenned a következőkre:
azd version              # Megjeleníti a telepített verziót
azd init --template todo-nodejs-mongo  # Inicializálja a projektet
azd up                  # Telepít Azure-ra
azd show                # Megjeleníti a futó alkalmazás URL-jét
# Az alkalmazás megnyílik a böngészőben és működik
azd down --force --purge  # Eltávolítja az erőforrásokat
```

**📊 Időráfordítás:** 30-45 perc  
**📈 Készségszint a végén:** Képes önállóan telepíteni alap alkalmazásokat

**✅ Siker ellenőrzése:**
```bash
# Az 1. fejezet elvégzése után képes leszel:
azd version              # Megjeleníti a telepített verziót
azd init --template todo-nodejs-mongo  # Inicializálja a projektet
azd up                  # Azure-ba telepíti
azd show                # Megjeleníti a futó alkalmazás URL-jét
# Az alkalmazás megnyílik a böngészőben és működik
azd down --force --purge  # Eltávolítja az erőforrásokat
```

**📊 Időráfordítás:** 30-45 perc  
**📈 Készségszint a végén:** Képes önállóan telepíteni alap alkalmazásokat

---

### 🤖 2. fejezet: AI-első fejlesztés (ajánlott AI fejlesztőknek)
**Előfeltételek**: 1. fejezet elvégzése  
**Időtartam**: 1-2 óra  
**Bonyolultság**: ⭐⭐

#### Mit fogsz megtanulni
- Microsoft Foundry integráció az AZD-vel
- AI-vezérelt alkalmazások telepítése
- AI szolgáltatások konfigurációinak megértése

#### Tanulási források
- **🎯 Kezdd itt**: [Microsoft Foundry integráció](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 Minták**: [AI modell telepítése](docs/microsoft-foundry/ai-model-deployment.md) - AI modellek telepítése és kezelése
- **🛠️ Műhely**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - Tedd AI megoldásaidat AZD-kompatibilissé
- **🎥 Interaktív útmutató**: [Workshop anyagok](workshop/README.md) - Böngészőalapú tanulás MkDocs * DevContainer Environment
- **📋 Sablonok**: [Microsoft Foundry sablonok](../..)
- **📝 Példák**: [AZD telepítési példák](examples/README.md)

#### Gyakorlati feladatok
```bash
# Telepítse az első mesterséges intelligencia-alkalmazását
azd init --template azure-search-openai-demo
azd up

# Próbáljon ki további mesterséges intelligencia-sablonokat
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 A fejezet eredménye**: AI-vezérelt chatalkalmazás telepítése és konfigurálása RAG képességekkel

**✅ Siker ellenőrzése:**
```bash
# A 2. fejezet után képesnek kell lenned a következőkre:
azd init --template azure-search-openai-demo
azd up
# Tesztelni az MI csevegőfelületet
# Kérdéseket feltenni és MI-alapú válaszokat kapni forrásokkal
# Ellenőrizni, hogy a keresési integráció működik
azd monitor  # Ellenőrizni, hogy az Application Insights megjeleníti a telemetriát
azd down --force --purge
```

**📊 Időráfordítás:** 1-2 óra  
**📈 Készségszint a végén:** Képes telepíteni és konfigurálni gyártásra kész AI alkalmazásokat  
**💰 Költségtudatosság:** Értsd meg az kb. $80-150/hó fejlesztési költségeket, $300-3500/hó gyártási költségeket

#### 💰 Költségmegfontolások AI telepítésekhez

**Fejlesztési környezet (becsült $80-150/hó):**
- Azure OpenAI (Pay-as-you-go): $0-50/hó (a tokenhasználattól függ)
- AI Search (Basic szint): $75/hó
- Container Apps (Consumption): $0-20/hó
- Tárhely (Standard): $1-5/hó

**Gyártási környezet (becsült $300-3,500+/hó):**
- Azure OpenAI (PTU a következetes teljesítményért): $3,000+/hó VAGY Pay-as-you-go nagy forgalom esetén
- AI Search (Standard szint): $250/hó
- Container Apps (Dedicated): $50-100/hó
- Application Insights: $5-50/hó
- Tárhely (Premium): $10-50/hó

**💡 Költségoptimalizálási tippek:**
- Használd az **ingyenes réteget** Azure OpenAI tanuláshoz (havonta 50,000 token jár)
- Futtasd a `azd down` parancsot a források felszabadításához, amikor nem fejlesztesz aktívan
- Kezdd fogyasztás-alapú számlázással, PTU-ra csak gyártásnál válts
- Használd a `azd provision --preview` parancsot a költségbecsléshez a telepítés előtt
- Engedélyezd az automatikus skálázást: csak a tényleges használat után fizetsz

**Költségfigyelés:**
```bash
# Ellenőrizze a becsült havi költségeket
azd provision --preview

# Kövesse nyomon a tényleges költségeket az Azure Portalon
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 3. fejezet: Konfiguráció és hitelesítés
**Előfeltételek**: 1. fejezet elvégzése  
**Időtartam**: 45-60 perc  
**Bonyolultság**: ⭐⭐

#### Mit fogsz megtanulni
- Környezeti konfiguráció és kezelés
- Hitelesítés és biztonsági bevált gyakorlatok
- Erőforrások elnevezése és szervezése

#### Tanulási források
- **📖 Konfiguráció**: [Konfigurációs útmutató](docs/getting-started/configuration.md) - Környezet beállítása
- **🔐 Biztonság**: [Hitelesítési minták és managed identity](docs/getting-started/authsecurity.md) - Hitelesítési minták
- **📝 Példák**: [Adatbázis alkalmazás példa](examples/database-app/README.md) - AZD adatbázis példák

#### Gyakorlati feladatok
- Konfigurálj több környezetet (dev, staging, prod)
- Állítsd be a managed identity alapú hitelesítést
- Valósíts meg környezet-specifikus konfigurációkat

**💡 A fejezet eredménye**: Több környezet kezelése megfelelő hitelesítéssel és biztonsággal

---

### 🏗️ 4. fejezet: Infrastruktúra mint kód és telepítés
**Előfeltételek**: 1-3. fejezetek elvégzése  
**Időtartam**: 1-1,5 óra  
**Bonyolultság**: ⭐⭐⭐

#### Mit fogsz megtanulni
- Fejlett telepítési minták
- Infrastruktúra mint kód Bicep használatával
- Erőforrások létrehozási stratégiái

#### Tanulási források
- **📖 Telepítés**: [Telepítési útmutató](docs/deployment/deployment-guide.md) - Teljes munkafolyamatok
- **🏗️ Provisioning**: [Erőforrások provisionálása](docs/deployment/provisioning.md) - Azure erőforrás-kezelés
- **📝 Példák**: [Container App példa](../../examples/container-app) - Konténerizált telepítések

#### Gyakorlati feladatok
- Készíts egyedi Bicep sablonokat
- Telepíts több szolgáltatásból álló alkalmazásokat
- Valósíts meg blue-green telepítési stratégiákat

**💡 A fejezet eredménye**: Bonyolult, több szolgáltatásból álló alkalmazások telepítése egyedi infrastruktúra sablonokkal

---

### 🎯 5. fejezet: Többügynökös AI megoldások (haladó)
**Előfeltételek**: 1-2. fejezetek elvégzése  
**Időtartam**: 2-3 óra  
**Bonyolultság**: ⭐⭐⭐⭐

#### Mit fogsz megtanulni
- Többügynökös architektúra minták
- Ügynök-orkesztráció és koordináció
- Gyártásra kész AI-telepítések

#### Tanulási források
- **🤖 Kiemelt projekt**: [Kiskereskedelmi többügynökös megoldás](examples/retail-scenario.md) - Teljes megvalósítás
- **🛠️ ARM-sablonok**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Egykattintásos telepítés
- **📖 Architektúra**: [Többügynökös koordinációs minták](/docs/pre-deployment/coordination-patterns.md) - Minták

#### Gyakorlati feladatok
```bash
# Telepítse a teljes kiskereskedelmi többügynökös megoldást
cd examples/retail-multiagent-arm-template
./deploy.sh

# Fedezze fel az ügynökök konfigurációit
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Fejezet eredménye**: Telepítsen és kezeljen egy éles, többügynökös AI-megoldást Ügyfél és Készlet ügynökökkel

---

### 🔍 6. fejezet: Telepítés előtti érvényesítés és tervezés
**Előfeltételek**: 4. fejezet befejezve  
**Időtartam**: 1 óra  
**Komplexitás**: ⭐⭐

#### Mit fogsz megtanulni
- Kapacitástervezés és erőforrások érvényesítése
- SKU kiválasztási stratégiák
- Előzetes ellenőrzések és automatizálás

#### Tanulási források
- **📊 Tervezés**: [Kapacitástervezés](docs/pre-deployment/capacity-planning.md) - Erőforrások érvényesítése
- **💰 Kiválasztás**: [SKU Selection](docs/pre-deployment/sku-selection.md) - Költséghatékony választások
- **✅ Érvényesítés**: [Előzetes ellenőrzések](docs/pre-deployment/preflight-checks.md) - Automatizált szkriptek

#### Gyakorlati feladatok
- Futtassa a kapacitás-ellenőrző szkripteket
- Optimalizálja a SKU-k kiválasztását a költségek érdekében
- Valósítson meg automatizált telepítés előtti ellenőrzéseket

**💡 Fejezet eredménye**: Érvényesítse és optimalizálja a telepítéseket a végrehajtás előtt

---

### 🚨 7. fejezet: Hibakeresés és hibajavítás
**Előfeltételek**: Bármely telepítési fejezet teljesítve  
**Időtartam**: 1-1,5 óra  
**Komplexitás**: ⭐⭐

#### Mit fogsz megtanulni
- Szisztematikus hibakeresési megközelítések
- Gyakori problémák és megoldások
- AI-specifikus hibakeresés

#### Tanulási források
- **🔧 Gyakori problémák**: [Common Issues](docs/troubleshooting/common-issues.md) - GYIK és megoldások
- **🕵️ Hibakeresés**: [Hibakeresési útmutató](docs/troubleshooting/debugging.md) - Lépésről lépésre stratégiák
- **🤖 AI-problémák**: [AI-specifikus hibakeresés](docs/troubleshooting/ai-troubleshooting.md) - AI szolgáltatások problémái

#### Gyakorlati feladatok
- Diagnosztizálja a telepítési hibákat
- Oldja meg a hitelesítési problémákat
- AI szolgáltatások kapcsolódási hibáinak elhárítása

**💡 Fejezet eredménye**: Önállóan diagnosztizálja és megoldja a gyakori telepítési problémákat

---

### 🏢 8. fejezet: Gyártási és vállalati minták
**Előfeltételek**: 1–4. fejezetek teljesítve  
**Időtartam**: 2-3 óra  
**Komplexitás**: ⭐⭐⭐⭐

#### Mit fogsz megtanulni
- Éles telepítési stratégiák
- Vállalati biztonsági minták
- Megfigyelés és költségoptimalizálás

#### Tanulási források
- **🏭 Éles üzem**: [Production AI Best Practices](docs/microsoft-foundry/production-ai-practices.md) - Vállalati minták
- **📝 Példák**: [Microservices Example](../../examples/microservices) - Összetett architektúrák
- **📊 Monitoring**: [Application Insights integration](docs/pre-deployment/application-insights.md) - Megfigyelés

#### Gyakorlati feladatok
- Vállalati biztonsági minták megvalósítása
- Teljes körű megfigyelés beállítása
- Telepítés éles környezetbe megfelelő irányítással

**💡 Fejezet eredménye**: Telepítsen vállalati szintű alkalmazásokat teljes éles üzem képességekkel

---

## 🎓 Műhely áttekintése: Gyakorlati tanulási élmény

> **⚠️ MŰHELY ÁLLAPOT: Folyamatban lévő fejlesztés**  
> A műhely anyagai jelenleg fejlesztés és tökéletesítés alatt állnak. A fő modulok működőképesek, de néhány haladó rész még hiányos. Aktívan dolgozunk a teljes tartalom befejezésén. [Nyomon követés →](workshop/README.md)

### Interaktív műhely anyagok
**Átfogó, gyakorlatorientált tanulás böngésző alapú eszközökkel és vezetett gyakorlatokkal**

A műhely anyagai strukturált, interaktív tanulási élményt nyújtanak, amely kiegészíti a fent ismertetett fejezetalapú tananyagot. A műhely mind önálló tanuláshoz, mind oktató által vezetett foglalkozásokhoz lett tervezve.

#### 🛠️ Műhely jellemzői
- **Böngésző alapú felület**: Teljes MkDocs-alapú műhely keresési, másolási és témabeállítási funkciókkal
- **GitHub Codespaces integráció**: Egykattintásos fejlesztőkörnyezet beállítás
- **Strukturált tanulási útvonal**: 7 lépéses vezetett gyakorlatok (összesen 3,5 óra)
- **Felfedezés → Telepítés → Testreszabás**: Progresszív módszertan
- **Interaktív DevContainer környezet**: Előre konfigurált eszközök és függőségek

#### 📚 Műhely felépítése
A műhely a **Felfedezés → Telepítés → Testreszabás** módszertant követi:

1. **Felfedezési fázis** (45 perc)
   - Ismerje meg a Microsoft Foundry sablonjait és szolgáltatásait
   - Ismerje meg a többügynökös architektúra mintáit
   - Tekintse át a telepítési követelményeket és előfeltételeket

2. **Telepítési fázis** (2 óra)
   - Gyakorlati AI-alkalmazás telepítése AZD-vel
   - Azure AI szolgáltatások és végpontok konfigurálása
   - Biztonsági és hitelesítési minták megvalósítása

3. **Testreszabási fázis** (45 perc)
   - Alkalmazások módosítása specifikus használati esetekhez
   - Optimalizálás éles telepítésre
   - Megfigyelés és költségkezelés megvalósítása

#### 🚀 A műhely elindítása
```bash
# 1. opció: GitHub Codespaces (ajánlott)
# Kattints a "Code" → "Create codespace on main" lehetőségre a repozitóriumban

# 2. opció: Helyi fejlesztés
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Kövesd a workshop/README.md fájlban található beállítási utasításokat.
```

#### 🎯 A műhely tanulási eredményei
A műhely elvégzésével a résztvevők:
- **Éles AI-alkalmazások telepítése**: AZD használata a Microsoft Foundry szolgáltatásaival
- **Többügynökös architektúrák elsajátítása**: Koordinált AI-ügynök megoldások megvalósítása
- **Biztonsági legjobb gyakorlatok megvalósítása**: Hitelesítés és hozzáférés-szabályozás beállítása
- **Skálázás optimalizálása**: Költséghatékony, jó teljesítményű telepítések tervezése
- **Telepítések hibakeresése**: Gyakori problémák önálló megoldása

#### 📖 Műhely források
- **🎥 Interaktív útmutató**: [Workshop Materials](workshop/README.md) - Böngésző alapú tanulási környezet
- **📋 Lépésről lépésre utasítások**: [Guided Exercises](../../workshop/docs/instructions) - Részletes útmutatók
- **🛠️ AI műhely labor**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - AI-központú gyakorlatok
- **💡 Gyors kezdés**: [Workshop Setup Guide](workshop/README.md#quick-start) - Környezet konfiguráció

**Tökéletes**: Vállalati képzésekhez, egyetemi tanfolyamokhoz, önálló tanuláshoz és fejlesztői bootcampokhoz.

---

## 📖 Mi az Azure Developer CLI?

Az Azure Developer CLI (azd) egy fejlesztőközpontú parancssori felület, amely felgyorsítja az alkalmazások Azure-ba történő fejlesztését és telepítését. Ez a következőket nyújtja:

- **Sablonalapú telepítések** - Használjon előre elkészített sablonokat gyakori alkalmazásmintákhoz
- **Infrastruktúra kódként** - Azure erőforrások kezelése Bicep vagy Terraform segítségével  
- **Integrált munkafolyamatok** - Alkalmazások zökkenőmentes előkészítése, telepítése és megfigyelése
- **Fejlesztőbarát** - A fejlesztői termelékenységre és élményre optimalizálva

### **AZD + Microsoft Foundry: Tökéletes AI-telepítésekhez**

**Miért az AZD AI-megoldásokhoz?** Az AZD a legfőbb kihívásokat kezeli, amelyekkel az AI fejlesztők szembesülnek:

- **AI-hoz készen álló sablonok** - Előre konfigurált sablonok Azure OpenAI, Cognitive Services és ML terhelésekhez
- **Biztonságos AI-telepítések** - Beépített biztonsági minták AI szolgáltatásokhoz, API-kulcsokhoz és modellvégpontokhoz  
- **Éles AI minták** - Legjobb gyakorlatok skálázható, költséghatékony AI alkalmazás telepítésekhez
- **Végponttól végpontig AI munkafolyamatok** - A modell fejlesztésétől az éles telepítésig megfelelő megfigyeléssel
- **Költségoptimalizálás** - Intelligens erőforrás-elosztás és skálázási stratégiák AI terhelésekhez
- **Microsoft Foundry integráció** - Zökkenőmentes kapcsolódás a Microsoft Foundry modellkatalógusához és végpontjaihoz

---

## 🎯 Sablonok és példatár

### Kiemelt: Microsoft Foundry sablonok
**Kezdje itt, ha AI-alkalmazásokat telepít!**

> **Megjegyzés:** Ezek a sablonok különböző AI-mintákat mutatnak be. Néhány külső Azure Samples, mások helyi megvalósítások.

| Sablon | Fejezet | Komplexitás | Szolgáltatások | Típus |
|----------|---------|------------|----------|------|
| [**Kezdés AI-csevegéssel**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 2. fejezet | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Külső |
| [**Kezdés AI-ügynökökkel**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 2. fejezet | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Külső |
| [**Azure Search + OpenAI demó**](https://github.com/Azure-Samples/azure-search-openai-demo) | 2. fejezet | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Külső |
| [**OpenAI Chat App gyorsstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 2. fejezet | ⭐ | AzureOpenAI + Container Apps + Application Insights | Külső |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 5. fejezet | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Külső |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | 8. fejezet | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Külső |
| [**Kiskereskedelmi többügynökös megoldás**](examples/retail-scenario.md) | 5. fejezet | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Helyi** |

### Kiemelt: Teljes tanulási forgatókönyvek
**Éles üzemre kész alkalmazás sablonok, a tanulási fejezetekhez rendelve**

| Sablon | Tanulási fejezet | Komplexitás | Fő tanulság |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 2. fejezet | ⭐ | Alap AI telepítési minták |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 2. fejezet | ⭐⭐ | RAG megvalósítás Azure AI Search-szel |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 4. fejezet | ⭐⭐ | Dokumentumintelligencia integráció |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 5. fejezet | ⭐⭐⭐ | Ügynök keretrendszer és függvényhívások |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 8. fejezet | ⭐⭐⭐ | Vállalati AI-orchestration |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 5. fejezet | ⭐⭐⭐⭐ | Többügynökös architektúra Ügyfél és Készlet ügynökökkel |

### Példák típus szerint

> **📌 Helyi vs. Külső példák:**  
> **Helyi példák** (ebben a repo-ban) = Azonnal használatra kész  
> **Külső példák** (Azure Samples) = Klónozzon a linkelt tárolókból

#### Helyi példák (azonnal használható)
- [**Kiskereskedelmi többügynökös megoldás**](examples/retail-scenario.md) - Teljes, élesre kész megvalósítás ARM sablonokkal
  - Többügynökös architektúra (Ügyfél + Készlet ügynökök)
  - Átfogó megfigyelés és értékelés
  - Egykattintásos telepítés ARM sablonnal

#### Helyi példák - Konténeralkalmazások (2-5. fejezet)
**Átfogó konténer telepítési példák ebben a tárolóban:**
- [**Container App Examples**](examples/container-app/README.md) - Teljes útmutató a konténerizált telepítésekhez
  - [Egyszerű Flask API](../../examples/container-app/simple-flask-api) - Alap REST API scale-to-zero támogatással
  - [Mikroszolgáltatások architektúra](../../examples/container-app/microservices) - Élesre kész több-szolgáltatásos telepítés
  - Gyorsindítás, Éles üzem és Haladó telepítési minták
  - Megfigyelés, biztonság és költségoptimalizálási útmutatás

#### Külső példák - Egyszerű alkalmazások (1-2. fejezet)
**Klónozza ezeket az Azure Samples tárolókat a kezdéshez:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Alap telepítési minták
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Statikus tartalom telepítése
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API telepítés

#### Külső példák - Adatbázis integráció (3-4. fejezet)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Adatbázis-kapcsolódási minták
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless adatfolyamat

#### Külső példák - Haladó minták (4-8. fejezet)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Több-szolgáltatásos architektúrák
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Háttérfeldolgozás  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Élesre kész ML minták

### Külső sablon gyűjtemények
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Válogatott gyűjtemény hivatalos és közösségi sablonokból
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn sablon dokumentáció
- [**Examples Directory**](examples/README.md) - Helyi tanulási példák részletes magyarázatokkal

---

## 📚 Tanulási források & Hivatkozások

### Gyors hivatkozások
- [**Parancs gyorsreferencia**](resources/cheat-sheet.md) - Alapvető azd parancsok fejezetenként rendezve
- [**Fogalomtár**](resources/glossary.md) - Azure és azd terminológia  
- [**GYIK**](resources/faq.md) - Gyakori kérdések fejezetenként rendezve
- [**Tanulási útmutató**](resources/study-guide.md) - Átfogó gyakorlati feladatok

### Gyakorlati műhelyek
- [**AI Workshop Lab**](docs/microsoft-foundry/ai-workshop-lab.md) - Tegye AI megoldásait AZD-vel telepíthetővé (2–3 óra)
- [**Interaktív műhely útmutató**](workshop/README.md) - Böngészőalapú műhely MkDocs és DevContainer környezettel
- [**Strukturált tanulási útvonal**](../../workshop/docs/instructions) -7 lépéses vezetett gyakorlatok (Felfedezés → Telepítés → Testreszabás)
- [**AZD Kezdőknek műhely**](workshop/README.md) - Teljes gyakorlati műhelyanyag GitHub Codespaces integrációval

### Külső tanulási források
- [Azure Developer CLI dokumentáció](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure architektúra központ](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure árkalkulátor](https://azure.microsoft.com/pricing/calculator/)
- [Azure állapot](https://status.azure.com/)

---

## 🔧 Gyors hibaelhárítási útmutató

**Gyakori problémák, amelyekkel a kezdők találkoznak, és azonnali megoldások:**

### ❌ "azd: parancs nem található"

```bash
# Először telepítse az AZD-t
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Ellenőrizze a telepítést
azd version
```

### ❌ "Előfizetés nem található" vagy "Előfizetés nincs beállítva"

```bash
# Elérhető előfizetések listázása
az account list --output table

# Alapértelmezett előfizetés beállítása
az account set --subscription "<subscription-id-or-name>"

# Beállítás az AZD környezethez
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Ellenőrzés
az account show
```

### ❌ "InsufficientQuota" or "Quota exceeded"

```bash
# Próbálj ki másik Azure-régiót
azd env set AZURE_LOCATION "westus2"
azd up

# Vagy fejlesztéshez használj kisebb SKU-kat
# Szerkeszd az infra/main.parameters.json fájlt:
{
  "sku": "B1"  // Instead of "P1V2"
}
```

### ❌ "azd up" félúton meghiúsul

```bash
# 1. lehetőség: Tisztítás és újrapróbálkozás
azd down --force --purge
azd up

# 2. lehetőség: Csak az infrastruktúra javítása
azd provision

# 3. lehetőség: Részletes naplók ellenőrzése
azd show
azd logs
```

### ❌ "Hitelesítés sikertelen" vagy "Token lejárt"

```bash
# Ismételt hitelesítés
az logout
az login

azd auth logout
azd auth login

# Hitelesítés ellenőrzése
az account show
```

### ❌ "Erőforrás már létezik" vagy névütközések

```bash
# AZD egyedi neveket generál, de ha ütközés van:
azd down --force --purge

# Ezután ismételd meg friss környezettel
azd env new dev-v2
azd up
```

### ❌ A sablon telepítése túl sokáig tart

**Normál várakozási idők:**
- Egyszerű webalkalmazás: 5–10 perc
- Adatbázissal rendelkező alkalmazás: 10–15 perc
- AI alkalmazások: 15–25 perc (az OpenAI erőforrások előkészítése lassú)

```bash
# Ellenőrizze az előrehaladást
azd show

# Ha több mint 30 percig elakadt, ellenőrizze az Azure Portált:
azd monitor
# Keresse a sikertelen telepítéseket
```

### ❌ "Permission denied" or "Forbidden"

```bash
# Ellenőrizze az Azure szerepkörét
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Legalább a "Contributor" szerepkörre van szüksége
# Kérje meg az Azure rendszergazdáját, hogy adja meg:
# - Contributor (erőforrásokhoz)
# - User Access Administrator (szerepkör-hozzárendelésekhez)
```

### ❌ Nem találom a telepített alkalmazás URL-jét

```bash
# Az összes szolgáltatás-végpont megjelenítése
azd show

# Vagy nyissa meg az Azure portált
azd monitor

# Ellenőrizze a konkrét szolgáltatást
azd env get-values
# Keresse a *_URL változókat
```

### 📚 Teljes hibaelhárítási források

- **Gyakori problémák útmutató:** [Részletes megoldások](docs/troubleshooting/common-issues.md)
- **AI-specifikus problémák:** [AI hibaelhárítás](docs/troubleshooting/ai-troubleshooting.md)
- **Hibakeresési útmutató:** [Lépésről lépésre hibakeresés](docs/troubleshooting/debugging.md)
- **Kérj segítséget:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 Gyors hibaelhárítási útmutató

**Gyakori problémák, amelyekkel a kezdők találkoznak, és azonnali megoldások:**

<details>
<summary><strong>❌ "azd: parancs nem található"</strong></summary>

```bash
# Először telepítse az AZD-t
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Ellenőrizze a telepítést
azd version
```
</details>

<details>
<summary><strong>❌ "Előfizetés nem található" vagy "Előfizetés nincs beállítva"</strong></summary>

```bash
# Elérhető előfizetések listázása
az account list --output table

# Alapértelmezett előfizetés beállítása
az account set --subscription "<subscription-id-or-name>"

# Beállítás az AZD környezethez
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Ellenőrzés
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

```bash
# Próbáljon ki másik Azure-régiót
azd env set AZURE_LOCATION "westus2"
azd up

# Vagy fejlesztésben használjon kisebb SKU-kat
# Szerkessze az infra/main.parameters.json fájlt:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" félúton meghiúsul"</strong></summary>

```bash
# Opció 1: Tisztítsa meg és próbálja újra
azd down --force --purge
azd up

# Opció 2: Csak az infrastruktúrát javítsa
azd provision

# Opció 3: Ellenőrizze a részletes naplókat
azd show
azd logs
```
</details>

<details>
<summary><strong>❌ "Hitelesítés sikertelen" vagy "Token lejárt"</strong></summary>

```bash
# Ismételt hitelesítés
az logout
az login

azd auth logout
azd auth login

# Hitelesítés ellenőrzése
az account show
```
</details>

<details>
<summary><strong>❌ "Erőforrás már létezik" vagy névütközések</strong></summary>

```bash
# AZD egyedi neveket generál, de ha ütközés történik:
azd down --force --purge

# Akkor próbálkozzon újra friss környezettel
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ A sablon telepítése túl sokáig tart</strong></summary>

**Normál várakozási idők:**
- Egyszerű webalkalmazás: 5–10 perc
- Adatbázissal rendelkező alkalmazás: 10–15 perc
- AI alkalmazások: 15–25 perc (az OpenAI erőforrások előkészítése lassú)

```bash
# Ellenőrizze a haladást
azd show

# Ha több mint 30 percig elakad, ellenőrizze az Azure Portalt:
azd monitor
# Keresse a sikertelen telepítéseket
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# Ellenőrizze az Azure szerepkörét
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Legalább a „Contributor” szerepkör szükséges
# Kérje az Azure rendszergazdától, hogy adja meg:
# - Contributor (erőforrásokhoz)
# - User Access Administrator (a szerepkör-hozzárendelésekhez)
```
</details>

<details>
<summary><strong>❌ Nem találom a telepített alkalmazás URL-jét</strong></summary>

```bash
# Az összes szolgáltatási végpont megjelenítése
azd show

# Vagy nyissa meg az Azure portált
azd monitor

# Ellenőrizze a konkrét szolgáltatást
azd env get-values
# Keresse a *_URL változókat
```
</details>

### 📚 Teljes hibaelhárítási források

- **Gyakori problémák útmutató:** [Részletes megoldások](docs/troubleshooting/common-issues.md)
- **AI-specifikus problémák:** [AI hibaelhárítás](docs/troubleshooting/ai-troubleshooting.md)
- **Hibakeresési útmutató:** [Lépésről lépésre hibakeresés](docs/troubleshooting/debugging.md)
- **Kérj segítséget:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Tanfolyam befejezése és tanúsítás

### Előrehaladás követése
Kövessd nyomon a tanulási előrehaladásodat fejezetenként:

- [ ] **1. fejezet**: Alapok és gyors kezdés ✅
- [ ] **2. fejezet**: AI-első fejlesztés ✅  
- [ ] **3. fejezet**: Konfiguráció és hitelesítés ✅
- [ ] **4. fejezet**: Infrastruktúra kódként & telepítés ✅
- [ ] **5. fejezet**: Többügynökös AI megoldások ✅
- [ ] **6. fejezet**: Előtelepítési ellenőrzés és tervezés ✅
- [ ] **7. fejezet**: Hibaelhárítás & hibakeresés ✅
- [ ] **8. fejezet**: Termelési & vállalati minták ✅

### Tudás ellenőrzése
Minden fejezet elvégzése után ellenőrizd tudásodat az alábbiak szerint:
1. **Gyakorlati feladat**: Hajtsd végre a fejezet gyakorlati telepítését
2. **Tudásellenőrzés**: Nézd át a fejezet GYIK részét
3. **Közösségi megbeszélés**: Oszd meg tapasztalataidat az Azure Discordon
4. **Következő fejezet**: Térj át a következő bonyolultsági szintre

### A tanfolyam elvégzésének előnyei
A fejezetek elvégzését követően elsajátítod:
- **Gyakorlati tapasztalat**: Valódi AI alkalmazások telepítése Azure-ra
- **Szakmai készségek**: Vállalati szintű telepítési képességek  
- **Közösségi elismerés**: Aktív tag az Azure fejlesztői közösségben
- **Karrierelőrelépés**: Keresett AZD és AI telepítési szakértelem

---

## 🤝 Közösség és támogatás

### Segítség és támogatás
- **Technikai problémák**: [Hibák bejelentése és funkciók kérése](https://github.com/microsoft/azd-for-beginners/issues)
- **Tanulási kérdések**: [Microsoft Azure Discord közösség](https://discord.gg/microsoft-azure) és [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-specifikus segítség**: Csatlakozz a [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentáció**: [Hivatalos Azure Developer CLI dokumentáció](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Közösségi betekintések a Microsoft Foundry Discordból

**Legutóbbi felmérés eredményei a #Azure csatornából:**
- **45%** fejlesztő szeretné használni az AZD-t AI feladatokhoz
- **Fő kihívások**: Több szolgáltatás telepítése, hitelesítő adatok kezelése, éles üzemre való felkészülés  
- **Leginkább kért**: AI-specifikus sablonok, hibaelhárítási útmutatók, legjobb gyakorlatok

**Csatlakozz közösségünkhöz, hogy:**
- Oszd meg AZD + AI tapasztalataidat és kérj segítséget
- Hozzáférj új AI sablonok korai verzióihoz
- Hozzájárulj az AI telepítési legjobb gyakorlatokhoz
- Befolyásold a jövőbeli AI + AZD funkciófejlesztést

### Hozzájárulás a tanfolyamhoz
Örömmel fogadjuk a hozzájárulásokat! Kérjük olvasd el a [Hozzájárulási útmutatót](CONTRIBUTING.md) a részletekért:
- **Tartalom fejlesztése**: Javítsd a meglévő fejezeteket és példákat
- **Új példák**: Adj hozzá valós példákat és sablonokat  
- **Fordítás**: Segíts a többnyelvű támogatás fenntartásában
- **Hibabejelentések**: Javítsd a pontosságot és az érthetőséget
- **Közösségi irányelvek**: Kövesd befogadó közösségi irányelveinket

---

## 📄 Tanfolyami információk

### Licenc
Ez a projekt az MIT License alatt áll - a részletekért lásd a [LICENSE](../../LICENSE) fájlt.

### Kapcsolódó Microsoft tanulási források

Csapatunk más átfogó tanfolyamokat is készít:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j kezdőknek](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js kezdőknek](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)

---

### Azure / Edge / MCP / Agents
[![AZD kezdőknek](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI kezdőknek](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP kezdőknek](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI ügynökök kezdőknek](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generatív AI sorozat
[![Generatív AI kezdőknek](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generatív AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generatív AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generatív AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Alapozó tanfolyamok
[![Gépi tanulás kezdőknek](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Adattudomány kezdőknek](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![Mesterséges intelligencia kezdőknek](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Kiberbiztonság kezdőknek](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Webfejlesztés kezdőknek](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT kezdőknek](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR fejlesztés kezdőknek](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot sorozat
[![Copilot az AI páros programozáshoz](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot C#/.NET-hez](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot kaland](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Tanfolyam navigáció

**🚀 Készen állsz a tanulás megkezdésére?**

**Kezdők**: Kezdd ezzel [1. fejezet: Alapok és gyors kezdés](../..)  
**AI fejlesztők**: Ugrás a [2. fejezet: AI-központú fejlesztés](../..)  
**Tapasztalt fejlesztők**: Kezdd ezzel [3. fejezet: Konfiguráció és hitelesítés](../..)

**Következő lépések**: [Kezdd a 1. fejezettel - AZD alapok](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Felelősségkizárás**:
Ezt a dokumentumot az AI-alapú fordító szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével fordították. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti, eredeti nyelvű dokumentumot kell tekinteni a hiteles forrásnak. Kritikus információk esetén javasolt professzionális, emberi fordítást igénybe venni. Nem vállalunk felelősséget az ebből a fordításból eredő félreértésekért vagy téves értelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->