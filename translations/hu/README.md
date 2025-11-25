<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6a804be263d09a0fd6f36d6ab251707a",
  "translation_date": "2025-11-25T12:19:26+00:00",
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

## Hogyan kezdjük el ezt a kurzust

Kövesd az alábbi lépéseket, hogy elkezdhesd AZD tanulási utadat:

1. **Forkold a repót**: Kattints [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klónozd a repót**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Csatlakozz a közösséghez**: [Azure Discord Közösségek](https://discord.com/invite/ByRwuEEgH4) szakértői támogatásért
4. **Válaszd ki a tanulási útvonaladat**: Válassz az alábbi fejezetek közül, amelyek megfelelnek a tapasztalati szintednek

### Többnyelvű támogatás

#### Automatikus fordítások (Mindig naprakész)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arab](../ar/README.md) | [Bengáli](../bn/README.md) | [Bolgár](../bg/README.md) | [Burmai (Mianmar)](../my/README.md) | [Kínai (Egyszerűsített)](../zh/README.md) | [Kínai (Hagyományos, Hongkong)](../hk/README.md) | [Kínai (Hagyományos, Makaó)](../mo/README.md) | [Kínai (Hagyományos, Tajvan)](../tw/README.md) | [Horvát](../hr/README.md) | [Cseh](../cs/README.md) | [Dán](../da/README.md) | [Holland](../nl/README.md) | [Észt](../et/README.md) | [Finn](../fi/README.md) | [Francia](../fr/README.md) | [Német](../de/README.md) | [Görög](../el/README.md) | [Héber](../he/README.md) | [Hindi](../hi/README.md) | [Magyar](./README.md) | [Indonéz](../id/README.md) | [Olasz](../it/README.md) | [Japán](../ja/README.md) | [Kannada](../kn/README.md) | [Koreai](../ko/README.md) | [Litván](../lt/README.md) | [Maláj](../ms/README.md) | [Malajálam](../ml/README.md) | [Maráthi](../mr/README.md) | [Nepáli](../ne/README.md) | [Nigériai Pidgin](../pcm/README.md) | [Norvég](../no/README.md) | [Perzsa (Fárszi)](../fa/README.md) | [Lengyel](../pl/README.md) | [Portugál (Brazília)](../br/README.md) | [Portugál (Portugália)](../pt/README.md) | [Pandzsábi (Gurmukhi)](../pa/README.md) | [Román](../ro/README.md) | [Orosz](../ru/README.md) | [Szerb (Cirill)](../sr/README.md) | [Szlovák](../sk/README.md) | [Szlovén](../sl/README.md) | [Spanyol](../es/README.md) | [Szuahéli](../sw/README.md) | [Svéd](../sv/README.md) | [Tagalog (Filippínó)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Török](../tr/README.md) | [Ukrán](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnámi](../vi/README.md)
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## Kurzus Áttekintése

Sajátítsd el az Azure Developer CLI-t (azd) strukturált fejezeteken keresztül, amelyek progresszív tanulásra lettek tervezve. **Különös hangsúly az AI alkalmazások telepítésére a Microsoft Foundry integrációval.**

### Miért elengedhetetlen ez a kurzus a modern fejlesztők számára?

A Microsoft Foundry Discord közösség visszajelzései alapján **a fejlesztők 45%-a szeretné az AZD-t AI munkaterhelésekhez használni**, de nehézségekbe ütköznek:
- Összetett, több szolgáltatást igénylő AI architektúrák
- AI telepítési legjobb gyakorlatok produkciós környezetben  
- Azure AI szolgáltatások integrációja és konfigurációja
- Költségoptimalizálás AI munkaterhelésekhez
- AI-specifikus telepítési problémák elhárítása

### Tanulási Célok

A kurzus elvégzésével:
- **Elsajátítod az AZD alapjait**: Alapfogalmak, telepítés és konfiguráció
- **AI alkalmazásokat telepítesz**: AZD használata Microsoft Foundry szolgáltatásokkal
- **Infrastruktúra kód formájában**: Azure erőforrások kezelése Bicep sablonokkal
- **Telepítési problémák megoldása**: Gyakori hibák elhárítása és problémák debugolása
- **Optimalizálás produkciós környezethez**: Biztonság, skálázás, monitorozás és költségkezelés
- **Többügynökös megoldások építése**: Összetett AI architektúrák telepítése

## 📚 Tanulási Fejezetek

*Válaszd ki a tanulási útvonaladat tapasztalati szint és célok alapján*

### 🚀 1. fejezet: Alapok és Gyors Kezdés
**Előfeltételek**: Azure előfizetés, alapvető parancssori ismeretek  
**Időtartam**: 30-45 perc  
**Komplexitás**: ⭐

#### Amit megtanulsz
- Az Azure Developer CLI alapjainak megértése
- AZD telepítése a platformodra
- Az első sikeres telepítésed

#### Tanulási Források
- **🎯 Kezd itt**: [Mi az Azure Developer CLI?](../..)
- **📖 Elmélet**: [AZD Alapok](docs/getting-started/azd-basics.md) - Alapfogalmak és terminológia
- **⚙️ Beállítás**: [Telepítés és Beállítás](docs/getting-started/installation.md) - Platform-specifikus útmutatók
- **🛠️ Gyakorlati rész**: [Az első projekted](docs/getting-started/first-project.md) - Lépésről lépésre útmutató
- **📋 Gyors Referencia**: [Parancs Cheat Sheet](resources/cheat-sheet.md)

#### Gyakorlati Feladatok
```bash
# Gyors telepítési ellenőrzés
azd version

# Telepítse az első alkalmazását
azd init --template todo-nodejs-mongo
azd up
```

**💡 Fejezet Eredménye**: Sikeresen telepítesz egy egyszerű webalkalmazást az Azure-ra AZD használatával

**✅ Siker Validálása:**
```bash
# Az 1. fejezet befejezése után képesnek kell lenned:
azd version              # Megjeleníti a telepített verziót
azd init --template todo-nodejs-mongo  # Inicializálja a projektet
azd up                  # Telepítés az Azure-ra
azd show                # Megjeleníti a futó alkalmazás URL-jét
# Az alkalmazás megnyílik a böngészőben és működik
azd down --force --purge  # Törli az erőforrásokat
```

**📊 Időbefektetés:** 30-45 perc  
**📈 Készségszint utána:** Képes vagy önállóan telepíteni alapvető alkalmazásokat

**✅ Siker Validálása:**
```bash
# Az 1. fejezet befejezése után képesnek kell lennie:
azd version              # Megjeleníti a telepített verziót
azd init --template todo-nodejs-mongo  # Inicializálja a projektet
azd up                  # Azure-ra telepít
azd show                # Megjeleníti a futó alkalmazás URL-jét
# Az alkalmazás megnyílik a böngészőben és működik
azd down --force --purge  # Törli az erőforrásokat
```

**📊 Időbefektetés:** 30-45 perc  
**📈 Készségszint utána:** Képes vagy önállóan telepíteni alapvető alkalmazásokat

---

### 🤖 2. fejezet: AI-első Fejlesztés (Ajánlott AI fejlesztőknek)
**Előfeltételek**: 1. fejezet elvégzése  
**Időtartam**: 1-2 óra  
**Komplexitás**: ⭐⭐

#### Amit megtanulsz
- Microsoft Foundry integráció AZD-vel
- AI-alapú alkalmazások telepítése
- AI szolgáltatások konfigurációjának megértése

#### Tanulási Források
- **🎯 Kezd itt**: [Microsoft Foundry Integráció](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 Minták**: [AI Modell Telepítés](docs/microsoft-foundry/ai-model-deployment.md) - AI modellek telepítése és kezelése
- **🛠️ Workshop**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - AI megoldások AZD-re való felkészítése
- **🎥 Interaktív Útmutató**: [Workshop Anyagok](workshop/README.md) - Böngésző-alapú tanulás MkDocs * DevContainer környezetben
- **📋 Sablonok**: [Microsoft Foundry Sablonok](../..)
- **📝 Példák**: [AZD Telepítési Példák](examples/README.md)

#### Gyakorlati Feladatok
```bash
# Telepítse az első AI alkalmazását
azd init --template azure-search-openai-demo
azd up

# Próbáljon ki további AI sablonokat
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Fejezet Eredménye**: AI-alapú chat alkalmazás telepítése és konfigurálása RAG képességekkel

**✅ Siker Validálása:**
```bash
# A 2. fejezet után képesnek kell lenned:
azd init --template azure-search-openai-demo
azd up
# Teszteld az AI chat felületet
# Tegyél fel kérdéseket, és kapj AI-alapú válaszokat forrásokkal
# Ellenőrizd, hogy a keresési integráció működik
azd monitor  # Ellenőrizd, hogy az Application Insights megjeleníti a telemetriát
azd down --force --purge
```

**📊 Időbefektetés:** 1-2 óra  
**📈 Készségszint utána:** Képes vagy produkciós AI alkalmazásokat telepíteni és konfigurálni  
**💰 Költségtudatosság:** Értsd meg a $80-150/hó fejlesztési költségeket, $300-3500/hó produkciós költségeket

#### 💰 AI Telepítések Költségszempontjai

**Fejlesztési Környezet (Becsült $80-150/hó):**
- Azure OpenAI (Pay-as-you-go): $0-50/hó (tokenhasználat alapján)
- AI Keresés (Alap szint): $75/hó
- Konténer Alkalmazások (Fogyasztás): $0-20/hó
- Tárhely (Standard): $1-5/hó

**Produkciós Környezet (Becsült $300-3,500+/hó):**
- Azure OpenAI (PTU a következetes teljesítményért): $3,000+/hó VAGY Pay-as-go nagy volumenű használattal
- AI Keresés (Standard szint): $250/hó
- Konténer Alkalmazások (Dedikált): $50-100/hó
- Alkalmazás Insights: $5-50/hó
- Tárhely (Prémium): $10-50/hó

**💡 Költségoptimalizálási Tippek:**
- Használj **Ingyenes Szintű** Azure OpenAI-t tanuláshoz (50,000 token/hó benne van)
- Futtasd az `azd down` parancsot, hogy felszabadítsd az erőforrásokat, amikor nem fejlesztesz aktívan
- Kezdd fogyasztás-alapú számlázással, frissíts PTU-ra csak produkciós környezetben
- Használj `azd provision --preview` parancsot, hogy becsüld meg a költségeket telepítés előtt
- Engedélyezd az automatikus skálázást: csak a tényleges használatért fizess

**Költségfigyelés:**
```bash
# Ellenőrizze a becsült havi költségeket
azd provision --preview

# Figyelje az aktuális költségeket az Azure Portálon
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 3. fejezet: Konfiguráció és Hitelesítés
**Előfeltételek**: 1. fejezet elvégzése  
**Időtartam**: 45-60 perc  
**Komplexitás**: ⭐⭐

#### Amit megtanulsz
- Környezet konfiguráció és kezelés
- Hitelesítési és biztonsági legjobb gyakorlatok
- Erőforrások elnevezése és szervezése

#### Tanulási Források
- **📖 Konfiguráció**: [Konfigurációs Útmutató](docs/getting-started/configuration.md) - Környezet beállítása
- **🔐 Biztonság**: [Hitelesítési minták és kezelt identitás](docs/getting-started/authsecurity.md) - Hitelesítési minták
- **📝 Példák**: [Adatbázis Alkalmazás Példa](examples/database-app/README.md) - AZD Adatbázis Példák

#### Gyakorlati Feladatok
- Több környezet konfigurálása (fejlesztés, tesztelés, produkció)
- Kezelt identitás hitelesítés beállítása
- Környezet-specifikus konfigurációk megvalósítása

**💡 Fejezet Eredménye**: Több környezet kezelése megfelelő hitelesítéssel és biztonsággal

---

### 🏗️ 4. fejezet: Infrastruktúra kódként és Telepítés
**Előfeltételek**: 1-3. fejezet elvégzése  
**Időtartam**: 1-1.5 óra  
**Komplexitás**: ⭐⭐⭐

#### Amit megtanulsz
- Haladó telepítési minták
- Infrastruktúra kódként Bicep segítségével
- Erőforrások előkészítési stratégiái

#### Tanulási Források
- **📖 Telepítés**: [Telepítési Útmutató](docs/deployment/deployment-guide.md) - Teljes munkafolyamatok
- **🏗️ Előkészítés**: [Erőforrások előkészítése](docs/deployment/provisioning.md) - Azure erőforrások kezelése
- **📝 Példák**: [Konténer Alkalmazás Példa](../../examples/container-app) - Konténeres telepítések

#### Gyakorlati Feladatok
- Egyedi Bicep sablonok létrehozása
- Több szolgáltatást igénylő alkalmazások telepítése
- Blue-green telepítési stratégiák megvalósítása

**💡 Fejezet Eredménye**: Összetett, több szolgáltatást igénylő alkalmazások telepítése egyedi infrastruktúra sablonokkal

---

### 🎯 5. fejezet: Többügynökös AI Megoldások (Haladó)
**Előfeltételek**: 1-2. fejezet elvégzése  
**Időtartam**: 2-3 óra  
**Komplexitás**: ⭐⭐⭐⭐

#### Amit megtanulsz
- Többügynökös architektúra minták
- Ügynökök koordinációja és irányítása
- Produkcióra kész AI telepítések

#### Tanulási Források
- **🤖 Kiemelt Projekt**: [Kiskereskedelmi Többügynökös Megoldás](examples/retail-scenario.md) - Teljes megvalósítás
- **🛠️ ARM sablonok**: [ARM sabloncsomag](../../examples/retail-multiagent-arm-template) - Egykattintásos telepítés
- **📖 Architektúra**: [Többügynökös koordinációs minták](/docs/pre-deployment/coordination-patterns.md) - Minták

#### Gyakorlati feladatok
```bash
# Telepítse a teljes kiskereskedelmi többügynökös megoldást
cd examples/retail-multiagent-arm-template
./deploy.sh

# Fedezze fel az ügynök konfigurációkat
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Fejezet eredménye**: Egy termelésre kész többügynökös AI megoldás telepítése és kezelése Ügyfél- és Készletügynökökkel

---

### 🔍 6. fejezet: Előtelepítési validáció és tervezés
**Előfeltételek**: 4. fejezet befejezve  
**Időtartam**: 1 óra  
**Bonyolultság**: ⭐⭐

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
- SKU kiválasztások optimalizálása költséghatékonyság érdekében
- Automatizált előtelepítési ellenőrzések végrehajtása

**💡 Fejezet eredménye**: Telepítések validálása és optimalizálása a végrehajtás előtt

---

### 🚨 7. fejezet: Hibakeresés és hibaelhárítás
**Előfeltételek**: Bármely telepítési fejezet befejezve  
**Időtartam**: 1-1,5 óra  
**Bonyolultság**: ⭐⭐

#### Amit megtanulsz
- Szisztematikus hibakeresési megközelítések
- Gyakori problémák és megoldások
- AI-specifikus hibaelhárítás

#### Tanulási források
- **🔧 Gyakori problémák**: [Gyakori problémák](docs/troubleshooting/common-issues.md) - GYIK és megoldások
- **🕵️ Hibakeresés**: [Hibakeresési útmutató](docs/troubleshooting/debugging.md) - Lépésről lépésre stratégiák
- **🤖 AI problémák**: [AI-specifikus hibaelhárítás](docs/troubleshooting/ai-troubleshooting.md) - AI szolgáltatási problémák

#### Gyakorlati feladatok
- Telepítési hibák diagnosztizálása
- Hitelesítési problémák megoldása
- AI szolgáltatáskapcsolati hibák elhárítása

**💡 Fejezet eredménye**: Gyakori telepítési problémák önálló diagnosztizálása és megoldása

---

### 🏢 8. fejezet: Termelési és vállalati minták
**Előfeltételek**: 1-4. fejezetek befejezve  
**Időtartam**: 2-3 óra  
**Bonyolultság**: ⭐⭐⭐⭐

#### Amit megtanulsz
- Termelési telepítési stratégiák
- Vállalati biztonsági minták
- Felügyelet és költségoptimalizálás

#### Tanulási források
- **🏭 Termelés**: [Termelési AI legjobb gyakorlatok](docs/microsoft-foundry/production-ai-practices.md) - Vállalati minták
- **📝 Példák**: [Mikroszolgáltatások példája](../../examples/microservices) - Összetett architektúrák
- **📊 Felügyelet**: [Application Insights integráció](docs/pre-deployment/application-insights.md) - Felügyelet

#### Gyakorlati feladatok
- Vállalati biztonsági minták megvalósítása
- Átfogó felügyelet beállítása
- Telepítés termelésbe megfelelő irányítással

**💡 Fejezet eredménye**: Vállalati szintű alkalmazások telepítése teljes termelési képességekkel

---

## 🎓 Workshop áttekintés: Gyakorlati tanulási élmény

> **⚠️ WORKSHOP ÁLLAPOT: Aktív fejlesztés alatt**  
> A workshop anyagai jelenleg fejlesztés és finomítás alatt állnak. Az alapmodulok működőképesek, de néhány haladó szekció még hiányos. Aktívan dolgozunk az összes tartalom befejezésén. [Haladás nyomon követése →](workshop/README.md)

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
   - Microsoft Foundry sablonok és szolgáltatások felfedezése
   - Többügynökös architektúra minták megértése
   - Telepítési követelmények és előfeltételek áttekintése

2. **Telepítési fázis** (2 óra)
   - AI alkalmazások gyakorlati telepítése AZD-vel
   - Azure AI szolgáltatások és végpontok konfigurálása
   - Biztonsági és hitelesítési minták megvalósítása

3. **Testreszabási fázis** (45 perc)
   - Alkalmazások módosítása specifikus felhasználási esetekhez
   - Optimalizálás termelési telepítéshez
   - Felügyelet és költségkezelés megvalósítása

#### 🚀 Workshop kezdése
```bash
# Opció 1: GitHub Codespaces (Ajánlott)
# Kattints a "Code" → "Create codespace on main" lehetőségre a repozitóriumban

# Opció 2: Helyi fejlesztés
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Kövesd a beállítási utasításokat a workshop/README.md fájlban
```

#### 🎯 Workshop tanulási eredmények
A workshop elvégzésével a résztvevők:
- **Termelési AI alkalmazásokat telepítenek**: AZD használata Microsoft Foundry szolgáltatásokkal
- **Elsajátítják a többügynökös architektúrákat**: Koordinált AI ügynökmegoldások megvalósítása
- **Biztonsági legjobb gyakorlatokat alkalmaznak**: Hitelesítés és hozzáférés-vezérlés konfigurálása
- **Optimalizálnak a skálázás érdekében**: Költséghatékony, teljesítményorientált telepítések tervezése
- **Telepítési hibákat hárítanak el**: Gyakori problémák önálló megoldása

#### 📖 Workshop források
- **🎥 Interaktív útmutató**: [Workshop anyagok](workshop/README.md) - Böngészőalapú tanulási környezet
- **📋 Lépésről lépésre útmutatók**: [Irányított gyakorlatok](../../workshop/docs/instructions) - Részletes útmutatók
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - AI-központú gyakorlatok
- **💡 Gyors kezdés**: [Workshop beállítási útmutató](workshop/README.md#quick-start) - Környezet konfigurálása

**Ideális**: Vállalati képzésekhez, egyetemi kurzusokhoz, önálló tanuláshoz és fejlesztői bootcamp-ekhez.

---

## 📖 Mi az az Azure Developer CLI?

Az Azure Developer CLI (azd) egy fejlesztőközpontú parancssori eszköz, amely felgyorsítja az alkalmazások Azure-ba történő építésének és telepítésének folyamatát. Az alábbiakat nyújtja:

- **Sablon alapú telepítések** - Előre elkészített sablonok használata gyakori alkalmazási mintákhoz
- **Infrastruktúra kódként** - Azure erőforrások kezelése Bicep vagy Terraform segítségével  
- **Integrált munkafolyamatok** - Alkalmazások zökkenőmentes előkészítése, telepítése és felügyelete
- **Fejlesztőbarát** - Optimalizált a fejlesztői termelékenység és élmény érdekében

### **AZD + Microsoft Foundry: Tökéletes AI telepítésekhez**

**Miért AZD az AI megoldásokhoz?** Az AZD az AI fejlesztők legnagyobb kihívásaira nyújt megoldást:

- **AI-ra kész sablonok** - Előre konfigurált sablonok Azure OpenAI, Cognitive Services és ML munkaterhelésekhez
- **Biztonságos AI telepítések** - Beépített biztonsági minták AI szolgáltatásokhoz, API kulcsokhoz és modell végpontokhoz  
- **Termelési AI minták** - Legjobb gyakorlatok skálázható, költséghatékony AI alkalmazások telepítéséhez
- **Végponttól végpontig AI munkafolyamatok** - A modellfejlesztéstől a termelési telepítésig megfelelő felügyelettel
- **Költségoptimalizálás** - Okos erőforrás-elosztási és skálázási stratégiák AI munkaterhelésekhez
- **Microsoft Foundry integráció** - Zökkenőmentes kapcsolat a Microsoft Foundry modellkatalógushoz és végpontokhoz

---

## 🎯 Sablonok és példák könyvtára

### Kiemelt: Microsoft Foundry sablonok
**Kezdd itt, ha AI alkalmazásokat telepítesz!**

> **Megjegyzés:** Ezek a sablonok különböző AI mintákat mutatnak be. Néhányuk külső Azure minták, mások helyi megvalósítások.

| Sablon | Fejezet | Bonyolultság | Szolgáltatások | Típus |
|----------|---------|------------|----------|------|
| [**AI chat indítása**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 2. fejezet | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Külső |
| [**AI ügynökök indítása**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 2. fejezet | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Külső |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 2. fejezet | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Külső |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 2. fejezet | ⭐ | AzureOpenAI + Container Apps + Application Insights | Külső |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 5. fejezet | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Külső |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | 8. fejezet | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Külső |
| [**Kiskereskedelmi többügynökös megoldás**](examples/retail-scenario.md) | 5. fejezet | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Helyi** |

### Kiemelt: Teljes tanulási forgatókönyvek
**Termelésre kész alkalmazási sablonok a tanulási fejezetekhez igazítva**

| Sablon | Tanulási fejezet | Bonyolultság | Kulcsfontosságú tanulás |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 2. fejezet | ⭐ | Alapvető AI telepítési minták |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 2. fejezet | ⭐⭐ | RAG megvalósítás Azure AI Search segítségével |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 4. fejezet | ⭐⭐ | Dokumentumintelligencia integráció |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 5. fejezet | ⭐⭐⭐ | Ügynökkeretrendszer és funkcióhívás |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 8. fejezet | ⭐⭐⭐ | Vállalati AI orkesztráció |
| [**kiskereskedelmi többügynökös megoldás**](examples/retail-scenario.md) | 5. fejezet | ⭐⭐⭐⭐ | Többügynökös architektúra Ügyfél- és Készletügynökökkel |

### Példák tanulása típus szerint

> **📌 Helyi vs. Külső példák:**  
> **Helyi példák** (ebben a repóban) = Azonnal használatra kész  
> **Külső példák** (Azure minták) = Klónozd a hivatkozott repókból

#### Helyi példák (Azonnal használható)
- [**Kiskereskedelmi többügynökös megoldás**](examples/retail-scenario.md) - Teljes termelésre kész megvalósítás ARM sablonokkal
  - Többügynökös architektúra (Ügyfél + Készletügynökök)
  - Átfogó felügyelet és értékelés
  - Egykattintásos telepítés ARM sablonnal

#### Helyi példák - Konténeralkalmazások (2-5. fejezetek)
**Átfogó konténertelepítési példák ebben a repóban:**
- [**Konténeralkalmazás példák**](examples/container-app/README.md) - Teljes útmutató konténeres telepítésekhez
  - [Egyszerű Flask API](../../examples/container-app/simple-flask-api) - Alapvető REST API nullára skálázással
  - [Mikroszolgáltatások architektúra](../../examples/container-app/microservices) - Termelésre kész több szolgáltatásos telepítés
  - Gyors kezdés, termelési és haladó telepítési minták
  - Felügyelet, biztonság és költségoptimalizálási útmutató

#### Külső példák - Egyszerű alkalmazások (1-2. fejezetek)
**Klónozd ezeket az Azure minták repókat a kezdéshez:**
- [Egyszerű webalkalmazás - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Alapvető telepítési minták
- [Statikus weboldal - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Statikus tartalom telepítése
- [Konténeralkalmazás - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API telepítés

#### Külső példák - Adatbázis integráció (3-
- [**Parancsok Gyorsreferenciája**](resources/cheat-sheet.md) - Alapvető azd parancsok fejezetek szerint rendszerezve
- [**Szójegyzék**](resources/glossary.md) - Azure és azd terminológia  
- [**GYIK**](resources/faq.md) - Gyakori kérdések tanulási fejezetek szerint rendszerezve
- [**Tanulási Útmutató**](resources/study-guide.md) - Átfogó gyakorlati feladatok

### Gyakorlati Workshopok
- [**AI Workshop Labor**](docs/microsoft-foundry/ai-workshop-lab.md) - Tegye AI megoldásait AZD-kompatibilissé (2-3 óra)
- [**Interaktív Workshop Útmutató**](workshop/README.md) - Böngészőalapú workshop MkDocs és DevContainer környezettel
- [**Strukturált Tanulási Út**](../../workshop/docs/instructions) - 7 lépéses irányított gyakorlatok (Felfedezés → Telepítés → Testreszabás)
- [**AZD Kezdőknek Workshop**](workshop/README.md) - Teljes gyakorlati workshop anyagok GitHub Codespaces integrációval

### Külső Tanulási Források
- [Azure Developer CLI Dokumentáció](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architektúra Központ](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Árkalkulátor](https://azure.microsoft.com/pricing/calculator/)
- [Azure Állapot](https://status.azure.com/)

---

## 🔧 Gyors Hibaelhárítási Útmutató

**Gyakori problémák kezdők számára és azonnali megoldások:**

### ❌ "azd: parancs nem található"

```bash
# Telepítse először az AZD-t
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Ellenőrizze a telepítést
azd version
```

### ❌ "Nincs előfizetés" vagy "Előfizetés nincs beállítva"

```bash
# Listázza az elérhető előfizetéseket
az account list --output table

# Alapértelmezett előfizetés beállítása
az account set --subscription "<subscription-id-or-name>"

# Beállítás az AZD környezethez
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Ellenőrzés
az account show
```

### ❌ "InsufficientQuota" vagy "Quota túllépve"

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

### ❌ "azd up" félúton leáll

```bash
# Opció 1: Tisztítás és újrapróbálkozás
azd down --force --purge
azd up

# Opció 2: Csak az infrastruktúra javítása
azd provision

# Opció 3: Részletes naplók ellenőrzése
azd show
azd logs
```

### ❌ "Hitelesítés sikertelen" vagy "Token lejárt"

```bash
# Újrahitelesítés
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

# Akkor próbálja újra friss környezettel
azd env new dev-v2
azd up
```

### ❌ Sablon telepítése túl sokáig tart

**Normál várakozási idők:**
- Egyszerű webalkalmazás: 5-10 perc
- Adatbázissal rendelkező alkalmazás: 10-15 perc
- AI alkalmazások: 15-25 perc (OpenAI előkészítés lassú)

```bash
# Ellenőrizze a haladást
azd show

# Ha több mint 30 percig elakad, ellenőrizze az Azure Portált:
azd monitor
# Keresse a sikertelen telepítéseket
```

### ❌ "Hozzáférés megtagadva" vagy "Tiltott"

```bash
# Ellenőrizze az Azure szerepkörét
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Legalább "Közreműködő" szerepkörre van szüksége
# Kérje meg az Azure adminisztrátort, hogy adja meg:
# - Közreműködő (erőforrásokhoz)
# - Felhasználói hozzáférés adminisztrátor (szerepkör-hozzárendelésekhez)
```

### ❌ Nem található a telepített alkalmazás URL-je

```bash
# Mutassa az összes szolgáltatási végpontot
azd show

# Vagy nyissa meg az Azure Portált
azd monitor

# Ellenőrizze a konkrét szolgáltatást
azd env get-values
# Keresse meg a *_URL változókat
```

### 📚 Teljes Hibaelhárítási Források

- **Gyakori Problémák Útmutatója:** [Részletes Megoldások](docs/troubleshooting/common-issues.md)
- **AI-Specifikus Problémák:** [AI Hibaelhárítás](docs/troubleshooting/ai-troubleshooting.md)
- **Hibakeresési Útmutató:** [Lépésről-lépésre Hibakeresés](docs/troubleshooting/debugging.md)
- **Segítségkérés:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 Gyors Hibaelhárítási Útmutató

**Gyakori problémák kezdők számára és azonnali megoldások:**

<details>
<summary><strong>❌ "azd: parancs nem található"</strong></summary>

```bash
# Telepítse először az AZD-t
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
<summary><strong>❌ "Nincs előfizetés" vagy "Előfizetés nincs beállítva"</strong></summary>

```bash
# Listázza az elérhető előfizetéseket
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
<summary><strong>❌ "InsufficientQuota" vagy "Quota túllépve"</strong></summary>

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
</details>

<details>
<summary><strong>❌ "azd up" félúton leáll</strong></summary>

```bash
# Opció 1: Tisztítás és újrapróbálkozás
azd down --force --purge
azd up

# Opció 2: Csak az infrastruktúra javítása
azd provision

# Opció 3: Részletes naplók ellenőrzése
azd show
azd logs
```
</details>

<details>
<summary><strong>❌ "Hitelesítés sikertelen" vagy "Token lejárt"</strong></summary>

```bash
# Újrahitelesítés
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
# AZD egyedi neveket generál, de ha ütközés van:
azd down --force --purge

# Akkor próbálja újra friss környezettel
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Sablon telepítése túl sokáig tart</strong></summary>

**Normál várakozási idők:**
- Egyszerű webalkalmazás: 5-10 perc
- Adatbázissal rendelkező alkalmazás: 10-15 perc
- AI alkalmazások: 15-25 perc (OpenAI előkészítés lassú)

```bash
# Ellenőrizze a haladást
azd show

# Ha több mint 30 percig elakad, ellenőrizze az Azure Portált:
azd monitor
# Keresse meg a sikertelen telepítéseket
```
</details>

<details>
<summary><strong>❌ "Hozzáférés megtagadva" vagy "Tiltott"</strong></summary>

```bash
# Ellenőrizze az Azure szerepkörét
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Legalább "Közreműködő" szerepkörre van szüksége
# Kérje meg az Azure adminisztrátort, hogy adja meg:
# - Közreműködő (az erőforrásokhoz)
# - Felhasználói hozzáférés adminisztrátor (a szerepkör-hozzárendelésekhez)
```
</details>

<details>
<summary><strong>❌ Nem található a telepített alkalmazás URL-je</strong></summary>

```bash
# Mutassa az összes szolgáltatási végpontot
azd show

# Vagy nyissa meg az Azure Portált
azd monitor

# Ellenőrizze az adott szolgáltatást
azd env get-values
# Keresse a *_URL változókat
```
</details>

### 📚 Teljes Hibaelhárítási Források

- **Gyakori Problémák Útmutatója:** [Részletes Megoldások](docs/troubleshooting/common-issues.md)
- **AI-Specifikus Problémák:** [AI Hibaelhárítás](docs/troubleshooting/ai-troubleshooting.md)
- **Hibakeresési Útmutató:** [Lépésről-lépésre Hibakeresés](docs/troubleshooting/debugging.md)
- **Segítségkérés:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Tanfolyam Befejezése és Tanúsítvány

### Haladás Nyomonkövetése
Kövesse nyomon tanulási haladását minden fejezeten keresztül:

- [ ] **1. fejezet**: Alapok és Gyors Kezdés ✅
- [ ] **2. fejezet**: AI-első Fejlesztés ✅  
- [ ] **3. fejezet**: Konfiguráció és Hitelesítés ✅
- [ ] **4. fejezet**: Infrastruktúra mint Kód és Telepítés ✅
- [ ] **5. fejezet**: Többügynökös AI Megoldások ✅
- [ ] **6. fejezet**: Telepítés Előtti Ellenőrzés és Tervezés ✅
- [ ] **7. fejezet**: Hibaelhárítás és Hibakeresés ✅
- [ ] **8. fejezet**: Termelési és Vállalati Minták ✅

### Tanulási Ellenőrzés
Minden fejezet befejezése után ellenőrizze tudását:
1. **Gyakorlati Feladat**: Végezze el a fejezet gyakorlati telepítését
2. **Tudásellenőrzés**: Tekintse át a fejezet GYIK szekcióját
3. **Közösségi Megbeszélés**: Ossza meg tapasztalatait az Azure Discordon
4. **Következő Fejezet**: Lépjen a következő komplexitási szintre

### Tanfolyam Befejezésének Előnyei
A fejezetek befejezése után Ön:
- **Gyakorlati Tapasztalatot** szerez: Valós AI alkalmazásokat telepített az Azure-ra
- **Szakmai Készségeket** fejleszt: Vállalati szintű telepítési képességek  
- **Közösségi Elismerést** kap: Az Azure fejlesztői közösség aktív tagja
- **Karrier Előrelépést** ér el: Keresett AZD és AI telepítési szakértelem

---

## 🤝 Közösség és Támogatás

### Segítség és Támogatás
- **Technikai Problémák**: [Hibák jelentése és funkciók kérése](https://github.com/microsoft/azd-for-beginners/issues)
- **Tanulási Kérdések**: [Microsoft Azure Discord Közösség](https://discord.gg/microsoft-azure) és [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-Specifikus Segítség**: Csatlakozzon a [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentáció**: [Hivatalos Azure Developer CLI dokumentáció](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Közösségi Érdekességek a Microsoft Foundry Discordról

**Legutóbbi Szavazási Eredmények az #Azure Csatornán:**
- **45%** a fejlesztők közül AI munkaterhelésekhez szeretné használni az AZD-t
- **Legnagyobb kihívások**: Többszolgáltatásos telepítések, hitelesítés kezelése, termelési készenlét  
- **Leggyakrabban kért**: AI-specifikus sablonok, hibaelhárítási útmutatók, legjobb gyakorlatok

**Csatlakozzon közösségünkhöz, hogy:**
- Ossza meg AZD + AI tapasztalatait és kapjon segítséget
- Hozzáférjen új AI sablonok korai előnézeteihez
- Hozzájáruljon AI telepítési legjobb gyakorlatokhoz
- Befolyásolja a jövőbeli AI + AZD funkciók fejlesztését

### Hozzájárulás a Tanfolyamhoz
Örömmel fogadjuk a hozzájárulásokat! Kérjük, olvassa el [Hozzájárulási Útmutatónkat](CONTRIBUTING.md) a részletekért:
- **Tartalomfejlesztés**: A meglévő fejezetek és példák javítása
- **Új Példák**: Valós forgatókönyvek és sablonok hozzáadása  
- **Fordítás**: Segítsen a többnyelvű támogatás fenntartásában
- **Hibajelentések**: Pontosság és érthetőség javítása
- **Közösségi Szabványok**: Kövesse befogadó közösségi irányelveinket

---

## 📄 Tanfolyam Információk

### Licenc
Ez a projekt az MIT Licenc alatt áll - részletekért lásd a [LICENSE](../../LICENSE) fájlt.

### Kapcsolódó Microsoft Tanulási Források

Csapatunk más átfogó tanfolyamokat is készít:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### Azure / Edge / MCP / Ügynökök
[![AZD Kezdőknek](https://img.shields.io/badge/AZD%20Kezdőknek-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI Kezdőknek](https://img.shields.io/badge/Edge%20AI%20Kezdőknek-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP Kezdőknek](https://img.shields.io/badge/MCP%20Kezdőknek-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Ügynökök Kezdőknek](https://img.shields.io/badge/AI%20Ügynökök%20Kezdőknek-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generatív AI Sorozat
[![Generatív AI Kezdőknek](https://img.shields.io/badge/Generatív%20AI%20Kezdőknek-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generatív AI (.NET)](https://img.shields.io/badge/Generatív%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generatív AI (Java)](https://img.shields.io/badge/Generatív%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generatív AI (JavaScript)](https://img.shields.io/badge/Generatív%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Alapvető Tanulás
[![ML Kezdőknek](https://img.shields.io/badge/ML%20Kezdőknek-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Adattudomány Kezdőknek](https://img.shields.io/badge/Adattudomány%20Kezdőknek-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Kezdőknek](https://img.shields.io/badge/AI%20Kezdőknek-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Kiberbiztonság Kezdőknek](https://img.shields.io/badge/Kiberbiztonság%20Kezdőknek-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Webfejlesztés kezdőknek](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)  
[![IoT kezdőknek](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)  
[![XR fejlesztés kezdőknek](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---

### Copilot sorozat  
[![Copilot mesterséges intelligencia páros programozáshoz](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)  
[![Copilot C#/.NET-hez](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)  
[![Copilot kaland](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)  
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Tanfolyam navigáció

**🚀 Készen állsz a tanulásra?**

**Kezdőknek**: Kezdd itt: [1. fejezet: Alapok és gyors kezdés](../..)  
**AI fejlesztőknek**: Ugorj ide: [2. fejezet: AI-első fejlesztés](../..)  
**Tapasztalt fejlesztőknek**: Kezdd itt: [3. fejezet: Konfiguráció és hitelesítés](../..)

**Következő lépések**: [Kezdd az 1. fejezetet - AZD alapok](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Felelősség kizárása**:  
Ez a dokumentum az [Co-op Translator](https://github.com/Azure/co-op-translator) AI fordítási szolgáltatás segítségével lett lefordítva. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Fontos információk esetén javasolt professzionális emberi fordítást igénybe venni. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely a fordítás használatából eredhet.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->