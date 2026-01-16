<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6d5c886052b605349d9219cea5f2f6a1",
  "translation_date": "2026-01-16T14:10:24+00:00",
  "source_file": "README.md",
  "language_code": "hu"
}
-->
# AZD Kezdőknek: Egy Strukturált Tanulási Utazás

![AZD-for-beginners](../../../../translated_images/hu/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## A Tanfolyam Kezdése

Kövesd ezeket a lépéseket, hogy elindítsd AZD tanulási utadat:

1. **Forkold a Tárolót**: Kattints ide [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klónozd a Tárolót**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Csatlakozz a Közösséghez**: [Azure Discord közösségek](https://discord.com/invite/ByRwuEEgH4) szakértői támogatásért
4. **Válassz Tanulási Utat**: Válaszd ki az alábbi fejezetek közül azt, amelyik a tapasztalati szintedhez leginkább illik

### Többnyelvű Támogatás

#### Automatikus Fordítások (Mindig naprakész)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](./README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../br/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Jobban szereted helyben klónozni?**

> Ez a tároló 50+ nyelvű fordítást tartalmaz, ami jelentősen növeli a letöltési méretet. Fordítások nélküli klónozáshoz használd a sparse checkoutot:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Ez mindent megad, amire szükséged van a tanfolyam elvégzéséhez, sokkal gyorsabb letöltéssel.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## Tanfolyam Áttekintése

Mesteri szintre fejlesztheted az Azure Developer CLI-t (azd) strukturált fejezeteken keresztül, amelyek progresszív tanulást kínálnak. **Különös hangsúly az AI alkalmazások telepítésén a Microsoft Foundry integrációval.**

### Miért elengedhetetlen ez a tanfolyam a modern fejlesztők számára

A Microsoft Foundry Discord közösség visszajelzései alapján, **a fejlesztők 45%-a AZD-t szeretne használni AI munkaterhelésekhez**, de kihívásokkal szembesülnek:
- Komplex többszolgáltatásos AI architektúrák
- AI termelési telepítési legjobb gyakorlatok  
- Azure AI szolgáltatás integráció és konfiguráció
- AI munkaterhelések költségoptimalizálása
- AI-specifikus telepítési problémák elhárítása

### Tanulási Célok

A strukturált tanfolyam elvégzésével:
- **Elsajátítod az AZD alapjait**: Alapfogalmak, telepítés, konfiguráció
- **AI alkalmazásokat telepítesz**: AZD és Microsoft Foundry szolgáltatások használatával
- **Infrastruktúrát kezelhetsz kódként**: Azure erőforrások kezelése Bicep sablonokkal
- **Hibákat háríthatsz el**: Gyakori problémák megoldása és hibakeresés
- **Optimalizálod a termelési környezetet**: Biztonság, skálázás, monitorozás, költségkezelés
- **Többügynökös AI megoldásokat építhetsz**: Komplex AI architektúrák telepítése

## 📚 Tanulási Fejezetek

*Válaszd ki a tapasztalati szintedhez és céljaidhoz leginkább illő tanulási utat*

### 🚀 1. Fejezet: Alapok & Gyors Kezdés
**Előfeltételek**: Azure előfizetés, alap parancssori ismeretek  
**Időtartam**: 30-45 perc  
**Bonyolultság**: ⭐

#### Amit megtanulsz
- Azure Developer CLI alapjainak megértése
- AZD telepítése a platformodra
- Az első sikeres telepítésed

#### Tanulási Források
- **🎯 Indulj innen**: [Mi az Azure Developer CLI?](../..)
- **📖 Elmélet**: [AZD alapok](docs/getting-started/azd-basics.md) - Alapfogalmak és szakkifejezések
- **⚙️ Beállítás**: [Telepítés & Beállítás](docs/getting-started/installation.md) - Platform-specifikus útmutatók
- **🛠️ Gyakorlati**: [Az első projekted](docs/getting-started/first-project.md) - Lépésről lépésre oktatóanyag
- **📋 Gyors referencia**: [Parancs összefoglaló](resources/cheat-sheet.md)

#### Gyakorlati Feladatok
```bash
# Gyors telepítés ellenőrzés
azd version

# Telepítse első alkalmazását
azd init --template todo-nodejs-mongo
azd up
```

**💡 Fejezet Eredménye**: Egy egyszerű webalkalmazás sikeres telepítése Azure-ra AZD segítségével

**✅ Sikerellenőrzés:**
```bash
# Az 1. fejezet befejezése után képesnek kell lenned a következőkre:
azd version              # Telepített verzió megjelenítése
azd init --template todo-nodejs-mongo  # Projekt inicializálása
azd up                  # Telepítés Azure-ra
azd show                # A futó alkalmazás URL-jének megjelenítése
# Az alkalmazás megnyílik a böngészőben és működik
azd down --force --purge  # Erőforrások törlése
```

**📊 Időráfordítás:** 30-45 perc  
**📈 Tudásszint a végén:** Alap alkalmazásokat képes önállóan telepíteni

**✅ Sikerellenőrzés:**
```bash
# Az 1. fejezet befejezése után képesnek kell lenned:
azd version              # Telepített verzió megjelenítése
azd init --template todo-nodejs-mongo  # Projekt inicializálása
azd up                  # Azure-ra telepítés
azd show                # Futó alkalmazás URL-jének megjelenítése
# Az alkalmazás megnyílik a böngészőben és működik
azd down --force --purge  # Erőforrások takarítása
```

**📊 Időráfordítás:** 30-45 perc  
**📈 Tudásszint a végén:** Alap alkalmazásokat képes önállóan telepíteni

---

### 🤖 2. Fejezet: AI-First Fejlesztés (Ajánlott AI fejlesztőknek)
**Előfeltételek**: 1. fejezet teljesítve  
**Időtartam**: 1-2 óra  
**Bonyolultság**: ⭐⭐

#### Amit megtanulsz
- Microsoft Foundry integráció AZD-vel
- AI-alapú alkalmazások telepítése
- AI szolgáltatások konfigurációinak megértése

#### Tanulási Források
- **🎯 Indulj innen**: [Microsoft Foundry integráció](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 Minták**: [AI modell telepítés](docs/microsoft-foundry/ai-model-deployment.md) - AI modellek telepítése és kezelése
- **🛠️ Műhelymunka**: [AI workshop lab](docs/microsoft-foundry/ai-workshop-lab.md) - Tedd AZD-kompatibilissé AI megoldásaidat
- **🎥 Interaktív útmutató**: [Workshop anyagok](workshop/README.md) - Böngésző alapú tanulás MkDocs * DevContainer környezetben
- **📋 Sablonok**: [Microsoft Foundry sablonok](../..)
- **📝 Példák**: [AZD telepítési példák](examples/README.md)

#### Gyakorlati Feladatok
```bash
# Telepítse első AI alkalmazását
azd init --template azure-search-openai-demo
azd up

# Próbáljon ki további AI sablonokat
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Fejezet Eredménye**: AI-alapú chatalkalmazás telepítése és konfigurálása RAG képességekkel

**✅ Sikerellenőrzés:**
```bash
# A 2. fejezet után képesnek kell lenned arra, hogy:
azd init --template azure-search-openai-demo
azd up
# Teszteld az AI csevegőfelületet
# Tegyél fel kérdéseket, és kapj AI által támogatott, forrásokkal ellátott válaszokat
# Ellenőrizd, hogy a keresés integráció működik
azd monitor  # Ellenőrizd, hogy az Application Insights mutatja a telemetriát
azd down --force --purge
```

**📊 Időráfordítás:** 1-2 óra  
**📈 Tudásszint a végén:** Képes termelésre kész AI alkalmazások telepítésére és konfigurálására  
**💰 Költségtudatosság:** Megérti a kb. havi 80-150 $ fejlesztési költséget és a 300-3500 $ havi termelési költséget

#### 💰 Költségszempontok az AI telepítésekhez

**Fejlesztési környezet (kb. 80-150 $/hó):**
- Azure OpenAI (fizess a használat után): 0-50 $/hó (token-felhasználás alapján)
- AI Search (alap szint): 75 $/hó
- Container Apps (fogyasztás alapú): 0-20 $/hó
- Tárolás (standard): 1-5 $/hó

**Termelési környezet (kb. 300-3500+ $/hó):**
- Azure OpenAI (PTU a stabil teljesítményért): 3000+ $/hó VAGY Fizess a használat után, nagy volumen esetén
- AI Search (standard szint): 250 $/hó
- Container Apps (dedikált): 50-100 $/hó
- Application Insights: 5-50 $/hó
- Tárolás (prémium): 10-50 $/hó

**💡 Költségoptimalizálási tippek:**
- Tanuláshoz használd az **ingyenes szintű** Azure OpenAI-t (havonta 50 000 token benne)
- Használd az `azd down` parancsot, hogy a fejlesztés szünetében felszabadítsd az erőforrásokat
- Kezdd fogyasztás alapú számlázással, PTU-t csak termelésre állíts be
- Használd az `azd provision --preview` parancsot a telepítési költségek becslésére
- Engedélyezd az automatikus skálázást: csak a tényleges használat után fizess

**Költségfigyelés:**
```bash
# Becslés szerinti havi költségek ellenőrzése
azd provision --preview

# A tényleges költségek figyelése az Azure Portalon
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 3. Fejezet: Konfiguráció és Hitelesítés
**Előfeltételek**: 1. fejezet teljesítve  
**Időtartam**: 45-60 perc  
**Bonyolultság**: ⭐⭐

#### Amit megtanulsz
- Környezet konfigurálása és kezelése
- Hitelesítési és biztonsági legjobb gyakorlatok
- Erőforrások nevezése és rendszerezése

#### Tanulási Források
- **📖 Konfiguráció**: [Konfigurációs útmutató](docs/getting-started/configuration.md) - Környezeti beállítások
- **🔐 Biztonság**: [Hitelesítési minták és kezelt identitás](docs/getting-started/authsecurity.md) - Hitelesítési minták
- **📝 Példák**: [Adatbázis alkalmazás példa](examples/database-app/README.md) - AZD adatbázis példák

#### Gyakorlati Feladatok
- Több környezet konfigurálása (dev, staging, prod)
- Kezelt identitás hitelesítés beállítása
- Környezet specifikus konfigurációk megvalósítása

**💡 Fejezet Eredménye**: Több környezet kezelése megfelelő hitelesítéssel és biztonsággal

---

### 🏗️ 4. Fejezet: Infrastruktúra Kódként & Telepítés
**Előfeltételek**: 1-3. fejezet teljesítve  
**Időtartam**: 1-1,5 óra  
**Bonyolultság**: ⭐⭐⭐

#### Amit megtanulsz
- Fejlett telepítési minták
- Infrastruktúra kódként Bicep segítségével
- Erőforrások előkészítési stratégiái

#### Tanulási Források
- **📖 Telepítés**: [Telepítési útmutató](docs/deployment/deployment-guide.md) - Teljes munkafolyamatok
- **🏗️ Előkészítés**: [Erőforrások előkészítése](docs/deployment/provisioning.md) - Azure erőforrás menedzsment
- **📝 Példák**: [Container App példa](../../examples/container-app) - Konténerizált telepítések

#### Gyakorlati Feladatok
- Egyedi Bicep sablonok készítése
- Többszolgáltatásos alkalmazások telepítése
- Blue-green telepítési stratégiák alkalmazása

**💡 Fejezet Eredménye**: Komplex többszolgáltatásos alkalmazások telepítése egyedi infrastrukturális sablonokkal

---

### 🎯 5. Fejezet: Több-ügynökös AI Megoldások (Haladó)
**Előfeltételek**: 1-2. fejezet teljesítve  
**Időtartam**: 2-3 óra  
**Bonyolultság**: ⭐⭐⭐⭐

#### Amit megtanulsz
- Több-ügynökös architektúra minták
- Ügynök orkestráció és koordináció
- Termelésre kész MI-telepítések

#### Tanulási források
- **🤖 Kiemelt projekt**: [Kiskereskedelmi több ügynökös megoldás](examples/retail-scenario.md) - Teljes megvalósítás
- **🛠️ ARM Sablonok**: [ARM sablon csomag](../../examples/retail-multiagent-arm-template) - Egykattintásos telepítés
- **📖 Architektúra**: [Több ügynökös koordinációs minták](/docs/pre-deployment/coordination-patterns.md) - Minták

#### Gyakorlati feladatok
```bash
# Telepítse a teljes kiskereskedelmi multi-agent megoldást
cd examples/retail-multiagent-arm-template
./deploy.sh

# Fedezze fel az ügynök konfigurációkat
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Fejezet eredménye**: Telepíts és kezeld a termelésre kész több ügynökös MI-megoldást Ügyfél és Készlet ügynökökkel

---

### 🔍 6. fejezet: Előtelepítési validálás és tervezés  
**Előfeltételek**: 4. fejezet teljesítve  
**Időtartam**: 1 óra  
**Bonyolultság**: ⭐⭐

#### Amit megtanulsz
- Kapacitástervezés és erőforrás-validálás  
- SKU kiválasztási stratégiák  
- Elővizsgálatok és automatizálás

#### Tanulási források
- **📊 Tervezés**: [Kapacitástervezés](docs/pre-deployment/capacity-planning.md) - Erőforrás-validálás  
- **💰 Kiválasztás**: [SKU kiválasztás](docs/pre-deployment/sku-selection.md) - Költséghatékony választások  
- **✅ Validálás**: [Elővizsgálatok](docs/pre-deployment/preflight-checks.md) - Automatizált szkriptek

#### Gyakorlati feladatok
- Futtass kapacitás-ellenőrző szkripteket  
- Optimalizáld SKU-k kiválasztását költség szerint  
- Valósíts meg automatizált előtelepítési ellenőrzéseket

**💡 Fejezet eredménye**: Validáld és optimalizáld a telepítéseket a végrehajtás előtt

---

### 🚨 7. fejezet: Hibakeresés és problémaelhárítás  
**Előfeltételek**: Bármely telepítési fejezet teljesítve  
**Időtartam**: 1-1,5 óra  
**Bonyolultság**: ⭐⭐

#### Amit megtanulsz
- Szisztematikus hibakeresési módszerek  
- Gyakori problémák és megoldások  
- MI-specifikus hibakeresés   

#### Tanulási források
- **🔧 Gyakori problémák**: [Gyakori problémák](docs/troubleshooting/common-issues.md) - GYIK és megoldások  
- **🕵️ Hibakeresés**: [Hibakeresési útmutató](docs/troubleshooting/debugging.md) - Lépésről lépésre stratégiák  
- **🤖 MI problémák**: [MI-specifikus hibaelhárítás](docs/troubleshooting/ai-troubleshooting.md) - MI szolgáltatás-problémák  

#### Gyakorlati feladatok
- Diagnosztizáld a telepítési hibákat  
- Oldd meg a hitelesítési problémákat  
- Hibakeresés MI szolgáltatás-kapcsolódásnál

**💡 Fejezet eredménye**: Önállóan diagnosztizáld és oldd meg a gyakori telepítési hibákat

---

### 🏢 8. fejezet: Termelési és vállalati minták  
**Előfeltételek**: 1-4. fejezetek teljesítve  
**Időtartam**: 2-3 óra  
**Bonyolultság**: ⭐⭐⭐⭐

#### Amit megtanulsz
- Termelési telepítési stratégiák  
- Vállalati biztonsági minták  
- Megfigyelés és költségoptimalizálás  

#### Tanulási források
- **🏭 Termelés**: [Termelési MI legjobb gyakorlatok](docs/microsoft-foundry/production-ai-practices.md) - Vállalati minták  
- **📝 Példák**: [Mikroszolgáltatások példa](../../examples/microservices) - Összetett architektúrák  
- **📊 Megfigyelés**: [Application Insights integráció](docs/pre-deployment/application-insights.md) - Megfigyelés  

#### Gyakorlati feladatok
- Valósíts meg vállalati biztonsági mintákat  
- Állíts be átfogó megfigyelést  
- Telepíts termelésbe megfelelő felügyelettel

**💡 Fejezet eredménye**: Telepíts vállalatkész alkalmazásokat teljes termelési képességekkel

---

## 🎓 Műhely áttekintés: Gyakorlati tanulási élmény

> **⚠️ MŰHELY ÁLLAPOT: Folyamatban lévő fejlesztés**  
> A műhely anyagai jelenleg fejlesztés és finomítás alatt állnak. Az alapmodulok működnek, de néhány haladó szakasz még hiányos. Aktívan dolgozunk a teljes tartalom befejezésén. [Nyomon követés →](workshop/README.md)

### Interaktív műhely anyagok  
**Átfogó gyakorlati tanulás böngészőalapú eszközökkel és irányított feladatokkal**

A műhely anyagai strukturált, interaktív tanulási élményt nyújtanak, amely kiegészíti a fentiekben bemutatott fejezetes tananyagot. A műhely mind önálló, mind oktatói vezetéssel is használható.

#### 🛠️ Műhely jellemzők
- **Böngészőalapú felület**: Teljes MkDocs-alapú műhely kereséssel, másolással, témával  
- **GitHub Codespaces integráció**: Egykattintásos fejlesztői környezet indítás  
- **Strukturált tanulási út**: 7 lépéses irányított feladatok (összesen 3,5 óra)  
- **Felfedezés → Telepítés → Testreszabás**: Fokozatos módszertan  
- **Interaktív DevContainer környezet**: Előkonfigurált eszközök és függőségek  

#### 📚 Műhely felépítés  
A műhely követi a **Felfedezés → Telepítés → Testreszabás** módszertant:

1. **Felfedezési fázis** (45 perc)  
   - Ismerd meg a Microsoft Foundry sablonokat és szolgáltatásokat  
   - Tanulmányozd a több ügynökös architektúra mintákat  
   - Vizsgáld meg a telepítési követelményeket és előfeltételeket

2. **Telepítési fázis** (2 óra)  
   - Gyakorlati MI alkalmazások telepítése AZD-vel  
   - Azure MI szolgáltatások és végpontok konfigurálása  
   - Biztonsági és hitelesítési minták megvalósítása  

3. **Testreszabási fázis** (45 perc)  
   - Alkalmazások módosítása konkrét esetekhez  
   - Optimalizálás termelési telepítéshez  
   - Megfigyelés és költségkezelés megvalósítása  

#### 🚀 Műhely indítása  
```bash
# 1. lehetőség: GitHub Codespaces (ajánlott)
# Kattints a "Code" → "Create codespace on main" elemre a tárolóban

# 2. lehetőség: Helyi fejlesztés
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Kövesd a workshop/README.md fájlban található telepítési utasításokat
```

#### 🎯 Műhely tanulási eredmények  
A műhely befejezésével a résztvevők:  
- **Termelési MI alkalmazásokat telepítenek**: AZD használata Microsoft Foundry szolgáltatásokkal  
- **Mesteri több ügynökös architektúrák**: Koordinált MI ügynökös megoldások megvalósítása  
- **Biztonsági legjobb gyakorlatokat alkalmaznak**: Hitelesítés és hozzáférés-kezelés konfigurálása  
- **Skálázhatóságra optimalizálnak**: Költséghatékony és teljesítmény-orientált telepítések tervezése  
- **Telepítéseket hibakeresnek**: Gyakori problémák önálló megoldása  

#### 📖 Műhely források  
- **🎥 Interaktív útmutató**: [Műhely anyagok](workshop/README.md) - Böngészőalapú tanulási környezet  
- **📋 Lépésről lépésre utasítások**: [Irányított feladatok](../../workshop/docs/instructions) - Részletes útmutatók  
- **🛠️ MI műhely labor**: [MI műhely labor](docs/microsoft-foundry/ai-workshop-lab.md) - MI fókuszú feladatok  
- **💡 Gyors indulás**: [Műhely beállítási útmutató](workshop/README.md#quick-start) - Környezet konfiguráció  

**Kiváló választás**: Vállalati képzéshez, egyetemi kurzusokhoz, önálló tanuláshoz és fejlesztői bootcamphez.

---

## 📖 Mi az Azure Developer CLI?

Az Azure Developer CLI (azd) egy fejlesztőközpontú parancssori eszköz, amely felgyorsítja az alkalmazások fejlesztését és telepítését Azure-ra. Jellemzői:

- **Sablon alapú telepítések** - Előre elkészített sablonok használata gyakori alkalmazásmintákhoz  
- **Infrastruktúra kódként** - Azure erőforrások kezelése Biceppel vagy Terraformmal  
- **Integrált munkafolyamatok** - Zökkenőmentes erőforrás-foglalás, telepítés és megfigyelés  
- **Fejlesztőbarát** - A fejlesztői hatékonyság és élmény optimalizálva  

### **AZD + Microsoft Foundry: Tökéletes MI telepítésekhez**

**Miért az AZD az MI megoldásokhoz?** AZD kezeli a legnagyobb kihívásokat, amikkel az MI fejlesztők szembesülnek:

- **MI-kész sablonok** - Előkonfigurált sablonok Azure OpenAI, Cognitive Services és gépi tanulási munkaterhelésekhez  
- **Biztonságos MI telepítések** - Beépített biztonsági minták MI szolgáltatásokhoz, API kulcsokhoz és modell végpontokhoz  
- **Termelési MI minták** - Legjobb gyakorlatok skálázható, költséghatékony MI alkalmazástelepítéshez  
- **End-to-end MI munkafolyamatok** - A modellfejlesztéstől a termelési telepítésig megfigyeléssel együtt  
- **Költségoptimalizálás** - Okos erőforrás-kiosztás és skálázási stratégiák az MI terhelésekhez  
- **Microsoft Foundry integráció** - Zökkenőmentes kapcsolat a Microsoft Foundry modell katalógussal és végpontokkal

---

## 🎯 Sablonok és példatár

### Kiemelt: Microsoft Foundry sablonok  
**Ide kezdj, ha MI alkalmazásokat telepítesz!**

> **Megjegyzés:** Ezek a sablonok különböző MI mintákat mutatnak be. Néhányuk külső Azure minta, mások helyi megvalósítások.

| Sablon | Fejezet | Bonyolultság | Szolgáltatások | Típus |
|--------|---------|--------------|----------------|-------|
| [**AI chat kezdőknek**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 2. fejezet | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Külső |
| [**AI ügynökök kezdőknek**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 2. fejezet | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights | Külső |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 2. fejezet | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Külső |
| [**OpenAI Chat App Gyorsindítás**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 2. fejezet | ⭐ | AzureOpenAI + Container Apps + Application Insights | Külső |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 5. fejezet | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Külső |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | 8. fejezet | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Külső |
| [**Kiskereskedelmi több ügynökös megoldás**](examples/retail-scenario.md) | 5. fejezet | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Helyi** |

### Kiemelt: Teljes tanulási forgatókönyvek  
**Termelésre kész alkalmazás sablonok, amelyek megfelelnek a tanulási fejezeteknek**

| Sablon | Tanulási fejezet | Bonyolultság | Fő tanulás |
|--------|------------------|--------------|------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 2. fejezet | ⭐ | Alapvető MI telepítési minták |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 2. fejezet | ⭐⭐ | RAG megvalósítás Azure AI Search szolgáltatással |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 4. fejezet | ⭐⭐ | Dokumentumintelligencia integráció |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 5. fejezet | ⭐⭐⭐ | Ügynök keretrendszer és funkcióhívás |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 8. fejezet | ⭐⭐⭐ | Vállalati MI orkestráció |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 5. fejezet | ⭐⭐⭐⭐ | Többrésztvevős architektúra Ügyfél és Készlet ügynökökkel |

### Tanulás példatípus szerint

> **📌 Helyi vs. Külső példák:**  
> **Helyi példák** (ebben a repóban) = Azonnal használatra kész  
> **Külső példák** (Azure Samples) = Hivatkozott repók klónozása  

#### Helyi példák (azonnal használható)
- [**Kiskereskedelmi több ügynökös megoldás**](examples/retail-scenario.md) - Teljes, termelésre kész megvalósítás ARM sablonokkal  
  - Több ügynökös architektúra (Ügyfél + Készlet ügynökök)  
  - Átfogó monitorozás és értékelés  
  - Egykattintásos telepítés ARM sablonnal  

#### Helyi példák - Konténer alkalmazások (2-5. fejezetek)  
**Átfogó konténer telepítési példák ebben a tárban:**  
- [**Konténer alkalmazás példák**](examples/container-app/README.md) - Teljes útmutató konténeres telepítésekhez  
  - [Egyszerű Flask API](../../examples/container-app/simple-flask-api) - Alap REST API skálázással nullára  
  - [Mikroszolgáltatások architektúra](../../examples/container-app/microservices) - Termelésre kész több szolgáltatásos telepítés  
  - Gyors indulás, termelés és haladó telepítési minták  
  - Megfigyelés, biztonság és költségoptimalizálási iránymutatás  

#### Külső példák - Egyszerű alkalmazások (1-2. fejezet)  
**Klónozd az alábbi Azure Sample repókat az induláshoz:**  
- [Egyszerű webalkalmazás - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Alapvető telepítési minták  
- [Statikus weboldal - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Statikus tartalom telepítése  
- [Konténer alkalmazás - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API telepítés  

#### Külső példák - Adatbázis integráció (3-4. fejezet)  
- [Adatbázis alkalmazás - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Adatbázis-kapcsolódási minták  
- [Funkciók + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Felskálázódó adatfolyam serverless módon  

#### Külső példák - Haladó minták (4-8. fejezet)  
- [Java mikroszolgáltatások](https://github.com/Azure-Samples/java-microservices-aca-lab) - Több szolgáltatásos architektúrák  
- [Konténer alkalmazás munkaütemezés](https://github.com/Azure-Samples/container-apps-jobs) - Háttérfeldolgozás  
- [Vállalati ML csővezeték](https://github.com/Azure-Samples/mlops-v2) - Termelésre kész ML minták

### Külső sablon gyűjtemények
- [**Hivatalos AZD sablongaléria**](https://azure.github.io/awesome-azd/) - Kiválasztott hivatalos és közösségi sablonok gyűjteménye  
- [**Azure Developer CLI sablonok**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn sablon dokumentáció
- [**Példák könyvtára**](examples/README.md) - Helyi tanulási példák részletes magyarázatokkal

---

## 📚 Tanulási források és hivatkozások

### Gyors hivatkozások
- [**Parancsösszesítő**](resources/cheat-sheet.md) - Fontos azd parancsok fejezetenként rendszerezve
- [**Szószedet**](resources/glossary.md) - Azure és azd terminológia  
- [**GYIK**](resources/faq.md) - Gyakori kérdések fejezetenként rendszerezve
- [**Tanulmányi útmutató**](resources/study-guide.md) - Átfogó gyakorlati feladatok

### Gyakorlati műhelyek
- [**AI Műhely Labor**](docs/microsoft-foundry/ai-workshop-lab.md) - Tegye AI megoldásait AZD-deployálhatóvá (2-3 óra)
- [**Interaktív műhely útmutató**](workshop/README.md) - Böngésző-alapú műhely MkDocs-szal és DevContainer környezettel
- [**Strukturált tanulási útvonal**](../../workshop/docs/instructions) - 7 lépéses vezetett gyakorlatok (Felfedezés → Telepítés → Testreszabás)
- [**AZD kezdőknek műhely**](workshop/README.md) - Teljes gyakorlati műhely anyagok GitHub Codespaces integrációval

### Külső tanulási források
- [Azure Developer CLI dokumentáció](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure árazási kalkulátor](https://azure.microsoft.com/pricing/calculator/)
- [Azure állapot](https://status.azure.com/)

---

## 🔧 Gyors hibakeresési útmutató

**Gyakori kezdői problémák és azonnali megoldásaik:**

### ❌ "azd: parancs nem található"

```bash
# Először telepítse az AZD-t
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Telepítés ellenőrzése
azd version
```

### ❌ "Nincs előfizetés" vagy "Előfizetés nincs beállítva"

```bash
# Elérhető előfizetések listázása
az account list --output table

# Alapértelmezett előfizetés beállítása
az account set --subscription "<subscription-id-or-name>"

# AZD környezet beállítása
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Ellenőrzés
az account show
```

### ❌ "InsufficientQuota" vagy "Kvóta túllépve"

```bash
# Próbáljon ki más Azure régiót
azd env set AZURE_LOCATION "westus2"
azd up

# Vagy használjon kisebb SKU-kat fejlesztéshez
# Szerkessze az infra/main.parameters.json fájlt:
{
  "sku": "B1"  // Instead of "P1V2"
}
```

### ❌ Félúton meghiúsul az "azd up"

```bash
# 1. lehetőség: Tisztítsa meg, és próbálja újra
azd down --force --purge
azd up

# 2. lehetőség: Csak az infrastruktúrát javítsa
azd provision

# 3. lehetőség: Ellenőrizze a részletes naplókat
azd show
azd logs
```

### ❌ "Hitelesítés sikertelen" vagy "Token lejárt"

```bash
# Újra hitelesítés
az logout
az login

azd auth logout
azd auth login

# Hitelesítés ellenőrzése
az account show
```

### ❌ "Erőforrás már létezik" vagy névütközések

```bash
# Az AZD egyedi neveket generál, de ha konfliktus van:
azd down --force --purge

# Akkor újra megpróbálja friss környezettel
azd env new dev-v2
azd up
```

### ❌ A sablon telepítés túl sokáig tart

**Átlagos várakozási idők:**
- Egyszerű webalkalmazás: 5-10 perc
- Adatbázisos alkalmazás: 10-15 perc
- AI alkalmazások: 15-25 perc (OpenAI provisioning lassú)

```bash
# Ellenőrizze a haladást
azd show

# Ha 30 percnél tovább elakadt, ellenőrizze az Azure Portált:
azd monitor
# Keresse a sikertelen telepítéseket
```

### ❌ "Engedély megtagadva" vagy "Tiltott"

```bash
# Ellenőrizze Azure szerepét
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Legalább "Contributor" szerepre van szüksége
# Kérje Azure adminisztrátorát, hogy adja meg:
# - Contributor (erőforrásokhoz)
# - User Access Administrator (szerepkiosztásokhoz)
```

### ❌ Nem található a telepített alkalmazás URL-je

```bash
# Az összes szolgáltatási végpont megjelenítése
azd show

# Vagy nyissa meg az Azure portált
azd monitor

# Egy adott szolgáltatás ellenőrzése
azd env get-values
# Keresés *_URL változókra
```

### 📚 Teljes hibakeresési források

- **Gyakori problémák útmutató:** [Részletes megoldások](docs/troubleshooting/common-issues.md)
- **AI-specifikus problémák:** [AI hibakeresés](docs/troubleshooting/ai-troubleshooting.md)
- **Hibakeresési útmutató:** [Lépésenkénti hibakeresés](docs/troubleshooting/debugging.md)
- **Segítségkérés:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 Gyors hibakeresési útmutató

**Gyakori kezdői problémák és azonnali megoldásaik:**

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

# Telepítés ellenőrzése
azd version
```
</details>

<details>
<summary><strong>❌ "Nincs előfizetés" vagy "Előfizetés nincs beállítva"</strong></summary>

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
<summary><strong>❌ "InsufficientQuota" vagy "Kvóta túllépve"</strong></summary>

```bash
# Próbáljon ki más Azure régiót
azd env set AZURE_LOCATION "westus2"
azd up

# Vagy használjon kisebb SKU-kat fejlesztés közben
# Szerkessze az infra/main.parameters.json fájlt:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ Félúton meghiúsul az "azd up"</strong></summary>

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
# Az AZD egyedi neveket hoz létre, de ha ütközés van:
azd down --force --purge

# Akkor próbáld újra friss környezettel
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ A sablon telepítés túl sokáig tart</strong></summary>

**Átlagos várakozási idők:**
- Egyszerű webalkalmazás: 5-10 perc
- Adatbázisos alkalmazás: 10-15 perc
- AI alkalmazások: 15-25 perc (OpenAI provisioning lassú)

```bash
# Ellenőrizze a haladást
azd show

# Ha 30 percnél tovább ragadt, ellenőrizze az Azure Portált:
azd monitor
# Keresse a sikertelen telepítéseket
```
</details>

<details>
<summary><strong>❌ "Engedély megtagadva" vagy "Tiltott"</strong></summary>

```bash
# Ellenőrizze az Azure szerepkörét
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Legalább "Contributor" szerepkör szükséges
# Kérje az Azure rendszergazdájától az alábbi szerepkörök engedélyezését:
# - Contributor (erőforrásokhoz)
# - Felhasználói hozzáférés-ellenőr (szerepkör-hozzárendelésekhez)
```
</details>

<details>
<summary><strong>❌ Nem található a telepített alkalmazás URL-je</strong></summary>

```bash
# Az összes szolgáltatási végpont megjelenítése
azd show

# Vagy nyissa meg az Azure Portált
azd monitor

# Egy adott szolgáltatás ellenőrzése
azd env get-values
# Keresd a *_URL változókat
```
</details>

### 📚 Teljes hibakeresési források

- **Gyakori problémák útmutató:** [Részletes megoldások](docs/troubleshooting/common-issues.md)
- **AI-specifikus problémák:** [AI hibakeresés](docs/troubleshooting/ai-troubleshooting.md)
- **Hibakeresési útmutató:** [Lépésenkénti hibakeresés](docs/troubleshooting/debugging.md)
- **Segítségkérés:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Tanfolyam befejezése és tanúsítvány

### Haladás követése
Nyomon követheted a tanulási folyamatodat fejezetenként:

- [ ] **1. fejezet**: Alapok és gyors kezdés ✅
- [ ] **2. fejezet**: AI-első fejlesztés ✅  
- [ ] **3. fejezet**: Konfiguráció és hitelesítés ✅
- [ ] **4. fejezet**: Infrastruktúra kód formájában és telepítés ✅
- [ ] **5. fejezet**: Többügynökös AI megoldások ✅
- [ ] **6. fejezet**: Előtelepítési ellenőrzés és tervezés ✅
- [ ] **7. fejezet**: Hibakeresés és debug ✅
- [ ] **8. fejezet**: Termelési és vállalati minták ✅

### Tanulás ellenőrzése
Minden fejezet befejezése után ellenőrizd a tudásodat az alábbiak szerint:
1. **Gyakorlati feladat**: Végezd el a fejezet gyakorlati telepítését
2. **Ismeretellenőrzés**: Nézd át a fejezet GYIK szekcióját
3. **Közösségi beszélgetés**: Oszd meg tapasztalataidat az Azure Discordon
4. **Következő fejezet**: Haladj a következő nehézségi szintre

### A tanfolyam befejezésének előnyei
A teljes tanfolyam elvégzése után az alábbiakat szerzed meg:
- **Termelési tapasztalat**: Valós AI alkalmazások telepítése Azure-ra
- **Szakmai készségek**: Vállalati szintű telepítési képességek  
- **Közösségi elismertség**: Aktív tagja az Azure fejlesztői közösségnek
- **Karrier előrelépés**: Keresett AZD és AI telepítési szakértelem

---

## 🤝 Közösség és támogatás

### Segítségkérés és támogatás
- **Technikai problémák**: [Hibabejelentés és funkciókérés](https://github.com/microsoft/azd-for-beginners/issues)
- **Tanulási kérdések**: [Microsoft Azure Discord közösség](https://discord.gg/microsoft-azure) és [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-specifikus segítség**: Csatlakozz a [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentáció**: [Hivatalos Azure Developer CLI dokumentáció](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Közösségi betekintés a Microsoft Foundry Discordról

**Legutóbbi szavazási eredmények a #Azure csatornán:**
- **45%** fejlesztő az AI feladatokhoz AZD-t szeretne használni
- **Legnagyobb kihívások**: Több szolgáltatás telepítése, hitelesítő adatok kezelése, termelési készenlét  
- **Leginkább kért**: AI-specifikus sablonok, hibakeresési útmutatók, legjobb gyakorlatok

**Csatlakozz közösségünkhöz, hogy:**
- Megoszd AZD + AI tapasztalataidat és segítséget kapj
- Korai verziókat érj el új AI sablonokból
- Hozzájárulj az AI telepítési legjobb gyakorlatokhoz
- Befolyásold a jövőbeli AI + AZD fejlesztéseket

### Hozzájárulás a tanfolyamhoz
Szívesen fogadjuk a hozzájárulásokat! Kérjük, olvasd el a [Hozzájárulási útmutatót](CONTRIBUTING.md) a részletekért:
- **Tartalomfejlesztés**: Fejleszd a meglévő fejezeteket és példákat
- **Új példák**: Valós szcenáriók és sablonok hozzáadása  
- **Fordítás**: Segíts többnyelvű támogatás fenntartásában
- **Hibajelentések**: Pontosság és érthetőség javítása
- **Közösségi szabályok**: Kövesd befogadó közösségi irányelveinket

---

## 📄 Tanfolyami információk

### Licenc
Ez a projekt az MIT Licenc alatt áll - lásd a [LICENSE](../../LICENSE) fájlt a részletekért.

### Kapcsolódó Microsoft tanulási források

Csapatunk más átfogó tanfolyamokat is készít:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j kezdőknek](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js kezdőknek](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)

---

### Azure / Edge / MCP / Ügynökök
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
 
### Alapvető tanfolyamok
[![ML kezdőknek](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Adattudomány kezdőknek](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot sorozat
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Tanfolyam navigáció

**🚀 Készen állsz a tanulásra?**

**Kezdőknek**: Kezdj a [1. fejezettel: Alapok és Gyors indulás](../..)  
**AI fejlesztőknek**: Ugorj a [2. fejezetre: AI-első fejlesztés](../..)  
**Tapasztalt fejlesztőknek**: Kezdd a [3. fejezettel: Konfiguráció és hitelesítés](../..)

**Következő lépések**: [Kezdd el az 1. fejezetet – AZD alapok](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Nyilatkozat**:  
Ezt a dokumentumot az [Co-op Translator](https://github.com/Azure/co-op-translator) AI fordító szolgáltatás segítségével fordítottuk. Bár pontos fordításra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások tartalmazhatnak hibákat vagy pontatlanságokat. Az eredeti dokumentum, anyanyelvén, tekintendő hiteles forrásnak. Fontos információk esetén szakmai emberi fordítást javaslunk. Nem vállalunk felelősséget az ebből a fordításból eredő félreértésekért vagy helytelen értelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->