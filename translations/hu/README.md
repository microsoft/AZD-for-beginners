# AZD Kezdőknek: Egy Strukturált Tanulási Út

![AZD-for-beginners](../../translated_images/hu/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## A tanfolyam megkezdése

Kövesd ezeket a lépéseket, hogy elkezdd AZD tanulási utadat:

1. **Forkold a tárolót**: Kattints [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klonozd a tárolót**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Csatlakozz a közösséghez**: [Azure Discord közösségek](https://discord.com/invite/ByRwuEEgH4) szakértői támogatáshoz
4. **Válaszd ki a tanulási utadat**: Válassz az alábbi fejezetek közül a tapasztalati szintednek megfelelően

### Többnyelvű támogatás

#### Automatikus fordítások (Mindig naprakészek)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](./README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Inkább helyben klónoznál?**

> Ez a tároló több mint 50 nyelvi fordítást tartalmaz, ami jelentősen megnöveli a letöltési méretet. Ha fordítások nélkül szeretnéd klónozni, használd a sparse checkout-ot:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Ez mindent megad, amire szükséged van a tanfolyam teljesítéséhez sokkal gyorsabb letöltéssel.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## Tanfolyam áttekintése

Sajátítsd el az Azure Developer CLI (azd) használatát strukturált fejezetekben, amelyek fokozatos tanulásra lettek tervezve. **Külön figyelem az AI alkalmazások telepítésére a Microsoft Foundry integrációval.**

### Miért elengedhetetlen ez a tanfolyam a modern fejlesztőknek

A Microsoft Foundry Discord közösség visszajelzései alapján, **a fejlesztők 45%-a AI munkaterhelésekhez szeretné használni az AZD-t**, de problémákkal találkoznak:
- Összetett többszolgáltatásos AI architektúrák
- AI alkalmazások gyártási telepítésének bevált módszerei  
- Azure AI szolgáltatások integrációja és konfigurálása
- AI munkaterhelések költségoptimalizálása
- AI-specifikus telepítési hibák hibaelhárítása

### Tanulási célok

A strukturált tanfolyam elvégzésével:
- **Mesterien kezeled az AZD alapjait**: Alapfogalmak, telepítés és konfiguráció
- **AI alkalmazásokat telepítesz**: Használod az AZD-t Microsoft Foundry szolgáltatásokkal
- **Megvalósítod az infrastruktúrát kódként**: Azure-erőforrásokat kezeled Bicep sablonokkal
- **Hibakeresed a telepítéseket**: Megoldod a gyakori problémákat és hibákat
- **Optimalizálod a gyártást**: Biztonság, skálázás, monitorozás és költségmenedzsment
- **Többügynökös megoldásokat építesz**: Összetett AI architektúrákat telepítesz

## 📚 Tanulási fejezetek

*Válaszd ki a tapasztalati szintednek és céljaidnak megfelelő tanulási utat*

### 🚀 1. fejezet: Alapok & Gyors Kezdés
**Előfeltételek**: Azure előfizetés, alapvető parancssoros ismeretek  
**Időtartam**: 30-45 perc  
**Bonyolultság**: ⭐

#### Amit megtanulsz
- Az Azure Developer CLI alapelveinek megértése
- AZD telepítése a rendszeren
- Az első sikeres telepítés

#### Tanulási források
- **🎯 Kezdj itt**: [Mi az Azure Developer CLI?](../..)
- **📖 Elmélet**: [AZD Alapok](docs/getting-started/azd-basics.md) - Alapfogalmak és terminológia
- **⚙️ Beállítás**: [Telepítés & Beállítás](docs/getting-started/installation.md) - Platform-specifikus útmutatók
- **🛠️ Gyakorlati**: [Az első projekted](docs/getting-started/first-project.md) - Lépésről-lépésre útmutató
- **📋 Gyors hivatkozás**: [Parancs Cheat Sheet](resources/cheat-sheet.md)

#### Gyakorlati feladatok
```bash
# Gyors telepítés ellenőrzése
azd version

# Telepítse első alkalmazását
azd init --template todo-nodejs-mongo
azd up
```

**💡 Fejezet eredmény**: Egy egyszerű webalkalmazás sikeres telepítése Azure-ra AZD segítségével

**✅ Siker igazolása:**
```bash
# Az 1. fejezet befejezése után képesnek kell lenned a következőkre:
azd version              # Telepített verzió megjelenítése
azd init --template todo-nodejs-mongo  # Projekt inicializálása
azd up                  # Telepítés Azure-ra
azd show                # Futó alkalmazás URL-jének megjelenítése
# Az alkalmazás megnyílik a böngészőben és működik
azd down --force --purge  # Erőforrások takarítása
```

**📊 Időráfordítás:** 30-45 perc  
**📈 Készség szint később:** Képes vagy önállóan alapszintű alkalmazásokat telepíteni

**✅ Siker igazolása:**
```bash
# Az 1. fejezet befejezése után képesnek kell lenned:
azd version              # Megjeleníti a telepített verziót
azd init --template todo-nodejs-mongo  # Inicializálja a projektet
azd up                  # Telepít Azure-ba
azd show                # Megjeleníti a futó alkalmazás URL-jét
# Az alkalmazás megnyílik a böngészőben és működik
azd down --force --purge  # Kitakarítja az erőforrásokat
```

**📊 Időráfordítás:** 30-45 perc  
**📈 Készség szint később:** Képes vagy önállóan alapszintű alkalmazásokat telepíteni

---

### 🤖 2. fejezet: AI-első fejlesztés (AI fejlesztőknek ajánlott)
**Előfeltételek**: 1. fejezet befejezése  
**Időtartam**: 1-2 óra  
**Bonyolultság**: ⭐⭐

#### Amit megtanulsz
- Microsoft Foundry integráció AZD-vel
- AI-alapú alkalmazások telepítése
- AI szolgáltatás konfigurációinak megértése

#### Tanulási források
- **🎯 Kezdj itt**: [Microsoft Foundry integráció](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 Minták**: [AI modell telepítés](docs/microsoft-foundry/ai-model-deployment.md) - AI modellek telepítése és kezelése
- **🛠️ Műhely**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - Készítsd fel AI megoldásaid AZD-re
- **🎥 Interaktív útmutató**: [Workshop anyagok](workshop/README.md) - Böngészőalapú tanulás MkDocs * DevContainer környezetben
- **📋 Sablonok**: [Microsoft Foundry sablonok](../..)
- **📝 Példák**: [AZD telepítési példák](examples/README.md)

#### Gyakorlati feladatok
```bash
# Telepítse első MI-alkalmazását
azd init --template azure-search-openai-demo
azd up

# Próbáljon ki további MI-sablonokat
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Fejezet eredmény**: AI-alapú chatalkalmazás telepítése és konfigurálása RAG képességekkel

**✅ Siker igazolása:**
```bash
# A 2. fejezet után képesnek kell lenned arra, hogy:
azd init --template azure-search-openai-demo
azd up
# Teszteld az AI csevegőfelületet
# Kérdéseket tegyél fel, és AI által támogatott válaszokat kapj forrásokkal
# Ellenőrizd, hogy a keresési integráció működik-e
azd monitor  # Ellenőrizd, hogy az Application Insights telemetriát mutat-e
azd down --force --purge
```

**📊 Időráfordítás:** 1-2 óra  
**📈 Készség szint később:** Képes vagy gyártásra kész AI alkalmazásokat telepíteni és konfigurálni  
**💰 Költségtudatosság:** Érted az $80-150/hó fejlesztési és $300-3500/hó gyártási költségeket

#### 💰 AI telepítések költségei

**Fejlesztői környezet (Becsült $80-150/hó):**
- Azure OpenAI (fizess a használat után): $0-50/hó (tokenhasználattól függ)
- AI keresés (Alap szint): $75/hó
- Container Apps (Fogyasztás alapján): $0-20/hó
- Tárolás (Standard): $1-5/hó

**Gyártási környezet (Becsült $300-3,500+/hó):**
- Azure OpenAI (PTU a stabil teljesítményért): $3,000+/hó VAGY fogyasztás alapú magas volumen mellett
- AI keresés (Standard szint): $250/hó
- Container Apps (Dedikált): $50-100/hó
- Application Insights: $5-50/hó
- Tárolás (Prémium): $10-50/hó

**💡 Költségoptimalizációs tippek:**
- Használd az **Ingyenes szintű** Azure OpenAI-t tanuláshoz (beleértve havi 50,000 tokent)
- Futtasd az `azd down` parancsot, ha nem fejlesztesz aktívan, hogy felszabadítsd az erőforrásokat
- Kezdd fogyasztás alapú számlázással, PTU-ra csak gyártáskor válts
- Használd az `azd provision --preview` parancsot a költségek előzetes becslésére telepítés előtt
- Engedélyezd az automatikus skálázást: csak a tényleges használatért fizess

**Költségkövetés:**
```bash
# Ellenőrizze a becsült havi költségeket
azd provision --preview

# Kövesse nyomon a tényleges költségeket az Azure Portálon
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 3. fejezet: Konfiguráció & Hitelesítés
**Előfeltételek**: 1. fejezet befejezése  
**Időtartam**: 45-60 perc  
**Bonyolultság**: ⭐⭐

#### Amit megtanulsz
- Környezeti konfiguráció és kezelés
- Hitelesítési és biztonsági bevált gyakorlatok
- Erőforrások elnevezése és rendszerezése

#### Tanulási források
- **📖 Konfiguráció**: [Konfigurációs útmutató](docs/getting-started/configuration.md) - Környezet beállítása
- **🔐 Biztonság**: [Hitelesítési minták és kezelt identitás](docs/getting-started/authsecurity.md) - Hitelesítési minták
- **📝 Példák**: [Adatbázis alkalmazás példa](examples/database-app/README.md) - AZD adatbázisos példák

#### Gyakorlati feladatok
- Több környezet konfigurálása (dev, staging, prod)
- Kezelt identitás alapú hitelesítés beállítása
- Környezet-specifikus konfigurációk implementálása

**💡 Fejezet eredmény**: Több környezet kezelése megfelelő hitelesítéssel és biztonsággal

---

### 🏗️ 4. fejezet: Infrastrukturális kód & Telepítés
**Előfeltételek**: 1-3. fejezetek befejezése  
**Időtartam**: 1-1,5 óra  
**Bonyolultság**: ⭐⭐⭐

#### Amit megtanulsz
- Fejlett telepítési minták
- Infrastrukturális kód Biceppel
- Erőforrás-províziós stratégiák

#### Tanulási források
- **📖 Telepítés**: [Telepítési útmutató](docs/deployment/deployment-guide.md) - Teljes munkafolyamatok
- **🏗️ Erőforrások létrehozása**: [Erőforrás-provízió](docs/deployment/provisioning.md) - Azure erőforrás kezelése
- **📝 Példák**: [Container App példa](../../examples/container-app) - Konténeres telepítések

#### Gyakorlati feladatok
- Egyedi Bicep sablonok létrehozása
- Többszolgáltatásos alkalmazások telepítése
- Blue-green telepítési stratégiák alkalmazása

**💡 Fejezet eredmény**: Összetett többszolgáltatásos alkalmazások telepítése egyedi infrastruktúra sablonokkal

---

### 🎯 5. fejezet: Többügynökös AI megoldások (Haladó)
**Előfeltételek**: 1-2. fejezetek befejezése  
**Időtartam**: 2-3 óra  
**Bonyolultság**: ⭐⭐⭐⭐
#### Amit meg fogsz tanulni
- Többügynökös architektúra minták
- Ügynökök összehangolása és koordinációja
- Termelésre kész AI telepítések

#### Tanulási források
- **🤖 Kiemelt projekt**: [Kiskereskedelmi többügynökös megoldás](examples/retail-scenario.md) - Teljes megvalósítás
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

**💡 Fejezet eredménye**: Termelésre kész többügynökös AI megoldás telepítése és kezelése Ügyfél és Készlet ügynökökkel

---

### 🔍 6. fejezet: Telepítés előtti ellenőrzés és tervezés
**Előfeltételek**: 4. fejezet végrehajtva  
**Időtartam**: 1 óra  
**Bonyolultság**: ⭐⭐

#### Amit meg fogsz tanulni
- Kapacitástervezés és erőforrás-ellenőrzés
- SKU kiválasztási stratégiák
- Pre-flight ellenőrzések és automatizálás

#### Tanulási források
- **📊 Tervezés**: [Kapacitástervezés](docs/pre-deployment/capacity-planning.md) - Erőforrás-ellenőrzés
- **💰 Kiválasztás**: [SKU kiválasztás](docs/pre-deployment/sku-selection.md) - Költséghatékony választások
- **✅ Ellenőrzés**: [Pre-flight ellenőrzések](docs/pre-deployment/preflight-checks.md) - Automatikus szkriptek

#### Gyakorlati feladatok
- Kapacitásellenőrző szkriptek futtatása
- SKU-k költséghatékonyság szerinti optimalizálása
- Telepítés előtti automatizált ellenőrzések bevezetése

**💡 Fejezet eredménye**: Telepítés előtti ellenőrzés és optimalizálás

---

### 🚨 7. fejezet: Hibakeresés és hibajavítás
**Előfeltételek**: Bármely telepítési fejezet teljesítése  
**Időtartam**: 1-1,5 óra  
**Bonyolultság**: ⭐⭐

#### Amit meg fogsz tanulni
- Szisztematikus hibakeresési módszerek
- Gyakori problémák és megoldások
- AI-specifikus hibaelhárítás

#### Tanulási források
- **🔧 Gyakori problémák**: [Gyakori problémák](docs/troubleshooting/common-issues.md) - GYIK és megoldások
- **🕵️ Hibakeresés**: [Hibakeresési útmutató](docs/troubleshooting/debugging.md) - Lépésenkénti stratégiák
- **🤖 AI problémák**: [AI-specifikus hibaelhárítás](docs/troubleshooting/ai-troubleshooting.md) - AI szolgáltatási problémák

#### Gyakorlati feladatok
- Telepítési hibák diagnosztizálása
- Hitelesítési problémák megoldása
- AI szolgáltatás kapcsolódási hibáinak hibakeresése

**💡 Fejezet eredménye**: Önállóan diagnosztizálni és megoldani a gyakori telepítési problémákat

---

### 🏢 8. fejezet: Termelési és vállalati minták
**Előfeltételek**: 1-4. fejezetek teljesítve  
**Időtartam**: 2-3 óra  
**Bonyolultság**: ⭐⭐⭐⭐

#### Amit meg fogsz tanulni
- Termelési telepítési stratégiák
- Vállalati biztonsági minták
- Monitorozás és költségoptimalizálás

#### Tanulási források
- **🏭 Termelés**: [Termelési AI legjobb gyakorlatok](docs/microsoft-foundry/production-ai-practices.md) - Vállalati minták
- **📝 Példák**: [Mikroszolgáltatások példa](../../examples/microservices) - Összetett architektúrák
- **📊 Monitorozás**: [Application Insights integráció](docs/pre-deployment/application-insights.md) - Monitorozás

#### Gyakorlati feladatok
- Vállalati biztonsági minták megvalósítása
- Átfogó monitorozás beállítása
- Termelési telepítés és megfelelő irányítás

**💡 Fejezet eredménye**: Teljes termelési képességekkel rendelkező vállalati alkalmazások telepítése

---

## 🎓 Workshop áttekintés: Gyakorlati tanulási élmény

> **⚠️ WORKSHOP ÁLLAPOT: Aktív fejlesztés**  
> A workshop anyagai jelenleg fejlesztés és finomítás alatt állnak. Az alapmodulok működőképesek, de néhány haladó rész még nincs kész. Aktívan dolgozunk minden tartalom befejezésén. [Haladás követése →](workshop/README.md)

### Interaktív workshop anyagok
**Átfogó gyakorlati tanulás böngésző-alapú eszközökkel és vezetett feladatokkal**

Workshop anyagaink egy strukturált, interaktív tanulási élményt nyújtanak, amely kiegészíti a fentebb bemutatott fejezet alapú tananyagot. A workshop önálló ütemű és oktató által vezetett foglalkozásokra egyaránt alkalmas.

#### 🛠️ Workshop funkciók
- **Böngésző-alapú felület**: Teljes MkDocs alapú workshop kereséssel, másolási és témázási funkciókkal
- **GitHub Codespaces integráció**: Egykattintásos fejlesztői környezet beállítása
- **Strukturált tanulási útvonal**: 7 lépéses vezetett gyakorlatok (összesen 3,5 óra)
- **Felfedezés → Telepítés → Testreszabás**: Fokozatos módszertan
- **Interaktív DevContainer környezet**: Előre konfigurált eszközök és függőségek

#### 📚 Workshop felépítés
A workshop a **Felfedezés → Telepítés → Testreszabás** módszert követi:

1. **Felfedezési szakasz** (45 perc)
   - Microsoft Foundry sablonok és szolgáltatások felfedezése
   - Többügynökös architektúra minták megértése
   - Telepítési követelmények és előfeltételek áttekintése

2. **Telepítési szakasz** (2 óra)
   - AI alkalmazások kézzel fogható telepítése AZD használatával
   - Azure AI szolgáltatások és végpontok konfigurálása
   - Biztonsági és hitelesítési minták megvalósítása

3. **Testreszabási szakasz** (45 perc)
   - Alkalmazások módosítása specifikus use case-ekhez
   - Termelési telepítés optimalizálása
   - Monitorozás és költségkezelés megvalósítása

#### 🚀 Workshop indítása
```bash
# 1. lehetőség: GitHub Codespaces (Ajánlott)
# Kattintson a "Code" → "Create codespace on main" elemre a tárházban

# 2. lehetőség: Helyi fejlesztés
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Kövesse a workshop/README.md fájlban található beállítási utasításokat
```

#### 🎯 Workshop tanulási eredmények
A workshop elvégzése után a résztvevők:
- **Termelési AI alkalmazások telepítése**: AZD használata Microsoft Foundry szolgáltatásokkal
- **Többügynökös architektúrák elsajátítása**: Koordinált AI ügynök megoldások megvalósítása
- **Biztonsági legjobb gyakorlatok alkalmazása**: Hitelesítés és hozzáférés-vezérlés beállítása
- **Skálázhatóság optimalizálása**: Költséghatékony, nagy teljesítményű telepítések tervezése
- **Hibakeresés és megoldás**: Gyakori telepítési problémák önálló megoldása

#### 📖 Workshop források
- **🎥 Interaktív útmutató**: [Workshop anyagai](workshop/README.md) - Böngésző-alapú tanulási környezet
- **📋 Lépésről lépésre útmutatók**: [Vezetett gyakorlatok](../../workshop/docs/instructions) - Részletes útmutatók
- **🛠️ AI workshop labor**: [AI workshop labor](docs/microsoft-foundry/ai-workshop-lab.md) - AI fókuszú gyakorlatok
- **💡 Gyors kezdés**: [Workshop beállítási útmutató](workshop/README.md#quick-start) - Környezet konfigurálása

**Különösen ajánlott**: Vállalati képzésekhez, egyetemi kurzusokhoz, önálló tanuláshoz és fejlesztői bootcamp-ekhez.

---

## 📖 Mi az az Azure Developer CLI?

Az Azure Developer CLI (azd) egy fejlesztőközpontú parancssori eszköz, amely felgyorsítja alkalmazások az Azure-ba történő építését és telepítését. Szolgáltatásai:

- **Sablon alapú telepítések** - Gyakori alkalmazásminták előre elkészített sablonokkal
- **Infrastructure as Code** - Azure erőforrások kezelése Bicep vagy Terraform segítségével  
- **Integrált munkafolyamatok** - Alkalmazások zökkenőmentes előkészítése, telepítése és monitorozása
- **Fejlesztőbarát** - Optimalizált a fejlesztői termelékenység és élmény érdekében

### **AZD + Microsoft Foundry: Tökéletes AI telepítésekhez**

**Miért AZD az AI megoldásokhoz?** AZD a legfontosabb AI fejlesztői kihívásokat kezeli:

- **AI-Ready sablonok** - Előre konfigurált sablonok Azure OpenAI, Cognitive Services és ML terhelésekhez
- **Biztonságos AI telepítések** - Beépített biztonsági minták AI szolgáltatásokhoz, API kulcsokhoz és modell végpontokhoz  
- **Termelési AI minták** - Legjobb gyakorlatok skálázható, költséghatékony AI alkalmazások telepítéséhez
- **Végponttól végpontig AI munkafolyamatok** - Modellfejlesztéstől a termelésig megfelelő monitorozással
- **Költségoptimalizálás** - Intelligens erőforrás-elosztás és skálázási stratégiák AI terhelésekhez
- **Microsoft Foundry integráció** - Zökkenőmentes csatlakozás a Microsoft Foundry modell katalógusához és végpontjaihoz

---

## 🎯 Sablonok és példatár

### Kiemelt: Microsoft Foundry sablonok
**Innen érdemes kezdeni, ha AI alkalmazásokat telepítesz!**

> **Megjegyzés:** Ezek a sablonok különféle AI mintákat mutatnak be. Néhány külső Azure mintagyűjtemény, mások helyi megvalósítások.

| Sablon | Fejezet | Bonyolultság | Szolgáltatások | Típus |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 2. fejezet | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Külső |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 2. fejezet | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Külső |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 2. fejezet | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Külső |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 2. fejezet | ⭐ | AzureOpenAI + Container Apps + Application Insights | Külső |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 5. fejezet | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Külső |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | 8. fejezet | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Külső |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | 5. fejezet | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Helyi** |

### Kiemelt: Teljes tanulási szcenáriók
**Termelésre kész alkalmazás sablonok tanulási fejezetekhez igazítva**

| Sablon | Tanulási fejezet | Bonyolultság | Fő tanulási pont |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 2. fejezet | ⭐ | Alap AI telepítési minták |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 2. fejezet | ⭐⭐ | RAG megvalósítás Azure AI Search segítségével |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 4. fejezet | ⭐⭐ | Dokumentumintelligencia integráció |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 5. fejezet | ⭐⭐⭐ | Ügynök keretrendszer és függvényhívás |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 8. fejezet | ⭐⭐⭐ | Vállalati AI összehangolás |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 5. fejezet | ⭐⭐⭐⭐ | Többügynökös architektúra Vásárló és Készlet ügynökökkel |

### Tanulás példa típus szerint

> **📌 Helyi vs. Külső példák:**  
> **Helyi példák** (ebben a repo-ban) = Azonnal használatra készek  
> **Külső példák** (Azure minták) = Linked repo-kból klónozandók

#### Helyi példák (azonnal használható)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Teljes termelésre kész megvalósítás ARM sablonokkal
  - Többügynökös architektúra (Vásárló + Készlet ügynökök)
  - Átfogó monitorozás és értékelés
  - Egykattintásos deploy ARM sablonnal

#### Helyi példák - Konténer alkalmazások (2-5. fejezet)
**Átfogó konténeres telepítési példák ebben a repóban:**
- [**Konténer alkalmazás példák**](examples/container-app/README.md) - Teljes útmutató konténeres telepítésekhez
  - [Egyszerű Flask API](../../examples/container-app/simple-flask-api) - Alap REST API skálázással nullára
  - [Mikroszolgáltatások architektúrája](../../examples/container-app/microservices) - Termelésre kész többszolgáltatásos telepítés
  - Gyors kezdés, termelés és haladó telepítési minták
  - Monitorozás, biztonság és költségoptimalizálási útmutató

#### Külső példák - Egyszerű alkalmazások (1-2. fejezet)
**Ezeket az Azure minták repóját klónozd a kezdéshez:**
- [Egyszerű Webalkalmazás - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Alap telepítési minták
- [Statikus weboldal - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Statikus tartalom telepítés
- [Konténeres alkalmazás - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API telepítés

#### Külső példák - Adatbázis integráció (3-4. fejezet)  
- [Adatbázis alkalmazás - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Adatbázis kapcsolódási minták
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless adatfolyam

#### Külső példák - Haladó minták (4-8. fejezet)
- [Java mikroszolgáltatások](https://github.com/Azure-Samples/java-microservices-aca-lab) - Többszolgáltatásos architektúrák
- [Konténer alkalmazás jobok](https://github.com/Azure-Samples/container-apps-jobs) - Háttérfeldolgozás  
- [Vállalati ML pipeline](https://github.com/Azure-Samples/mlops-v2) - Termelésre kész ML minták

### Külső sablon gyűjtemények
- [**Hivatalos AZD sablongaléria**](https://azure.github.io/awesome-azd/) - Hivatalos és közösségi sablonok válogatott gyűjteménye
- [**Azure Developer CLI Sablonok**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn sablon dokumentáció
- [**Példák Könyvtára**](examples/README.md) - Helyi tanulási példák részletes magyarázatokkal

---

## 📚 Tanulási Források & Hivatkozások

### Gyors Hivatkozások
- [**Parancsösszefoglaló**](resources/cheat-sheet.md) - Alapvető azd parancsok fejezetek szerint rendezve
- [**Szószedet**](resources/glossary.md) - Azure és azd kifejezések  
- [**GYIK**](resources/faq.md) - Gyakori kérdések fejezetenként rendszerezve
- [**Tanulási Útmutató**](resources/study-guide.md) - Átfogó gyakorlati feladatok

### Gyakorlati Műhelyek
- [**AI Műhely Labor**](docs/microsoft-foundry/ai-workshop-lab.md) - Tegye AI megoldásait AZD telepíthetővé (2-3 óra)
- [**Interaktív Műhely Útmutató**](workshop/README.md) - Böngésző-alapú műhely MkDocs és DevContainer környezettel
- [**Strukturált Tanulási Útvonal**](../../workshop/docs/instructions) -7 lépéses vezetett gyakorlatok (Felfedezés → Telepítés → Testreszabás)
- [**AZD Kezdőknek Műhely**](workshop/README.md) - Teljes gyakorlati műhelyanyag GitHub Codespaces integrációval

### Külső Tanulási Források
- Azure Developer CLI Dokumentáció
- Azure Architektúra Központ
- Azure Árkalkulátor
- Azure Állapot

---

## 🔧 Gyors Hibakeresési Útmutató

**Gyakori kezdői problémák és azonnali megoldások:**

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

### ❌ "Előfizetés nem található" vagy "Előfizetés nincs beállítva"

```bash
# Elérhető előfizetések listázása
az account list --output table

# Alapértelmezett előfizetés beállítása
az account set --subscription "<subscription-id-or-name>"

# Beállítás AZD környezethez
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Ellenőrzés
az account show
```

### ❌ "ElégtelenQuota" vagy "Kvóta túllépve"

```bash
# Próbáljon meg más Azure régiót
azd env set AZURE_LOCATION "westus2"
azd up

# Vagy használjon kisebb SKU-kat fejlesztéskor
# Szerkessze az infra/main.parameters.json fájlt:
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

# Akkor próbálkozik újra egy friss környezettel
azd env new dev-v2
azd up
```

### ❌ Sablon telepítés túl hosszú ideig tart

**Normál várakozási idők:**
- Egyszerű webalkalmazás: 5-10 perc
- Adatbázissal rendelkező alkalmazás: 10-15 perc
- AI alkalmazások: 15-25 perc (OpenAI előkészítés lassú)

```bash
# Ellenőrizze az előrehaladást
azd show

# Ha 30 percnél tovább elakad, ellenőrizze az Azure Portal-t:
azd monitor
# Keressen sikertelen telepítéseket
```

### ❌ "Engedély megtagadva" vagy "Tiltott"

```bash
# Ellenőrizze az Azure szerepkörét
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Legalább "Közreműködő" szerepkörre van szüksége
# Kérje meg az Azure rendszergazdáját, hogy adja meg:
# - Közreműködő (erőforrásokhoz)
# - Felhasználói hozzáférés-kezelő (szerepkör-hozzárendelésekhez)
```

### ❌ Nem található a telepített alkalmazás URL-je

```bash
# Az összes szolgáltatási végpont megjelenítése
azd show

# Vagy nyissa meg az Azure Portált
azd monitor

# Ellenőrizze a konkrét szolgáltatást
azd env get-values
# Keresse meg a *_URL változókat
```

### 📚 Teljes Hibakeresési Források

- **Gyakori Problémák Útmutató:** [Részletes Megoldások](docs/troubleshooting/common-issues.md)
- **AI Specifikus Problémák:** [AI hibakeresés](docs/troubleshooting/ai-troubleshooting.md)
- **Hibakeresési Útmutató:** [Lépésről-lépésre Hibakeresés](docs/troubleshooting/debugging.md)
- **Segítség Kérése:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 Gyors Hibakeresési Útmutató

**Gyakori kezdői problémák és azonnali megoldások:**

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
<summary><strong>❌ "Előfizetés nem található" vagy "Előfizetés nincs beállítva"</strong></summary>

```bash
# Elérhető előfizetések listázása
az account list --output table

# Alapértelmezett előfizetés beállítása
az account set --subscription "<subscription-id-or-name>"

# Beállítás AZD környezethez
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Ellenőrzés
az account show
```
</details>

<details>
<summary><strong>❌ "ElégtelenQuota" vagy "Kvóta túllépve"</strong></summary>

```bash
# Próbáljon ki másik Azure régiót
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
<summary><strong>❌ "azd up" félúton meghiúsul</strong></summary>

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
# Újra hitelesítés
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

# Akkor próbáld újra friss környezettel
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Sablon telepítés túl hosszú ideig tart</strong></summary>

**Normál várakozási idők:**
- Egyszerű webalkalmazás: 5-10 perc
- Adatbázissal rendelkező alkalmazás: 10-15 perc
- AI alkalmazások: 15-25 perc (OpenAI előkészítés lassú)

```bash
# Ellenőrizze az előrehaladást
azd show

# Ha több mint 30 percig elakad, ellenőrizze az Azure Portált:
azd monitor
# Keresse a sikertelen telepítéseket
```
</details>

<details>
<summary><strong>❌ "Engedély megtagadva" vagy "Tiltott"</strong></summary>

```bash
# Ellenőrizze az Azure szerepkörét
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Legalább "Közreműködő" szerepkör szükséges
# Kérje meg Azure rendszergazdáját, hogy adja meg:
# - Közreműködő (erőforrásokhoz)
# - Felhasználói Hozzáférés Adminisztrátor (szerepkör-hozzárendelésekhez)
```
</details>

<details>
<summary><strong>❌ Nem található a telepített alkalmazás URL-je</strong></summary>

```bash
# Az összes szolgáltatási végpont megjelenítése
azd show

# Vagy nyissa meg az Azure Portált
azd monitor

# Ellenőrizze a konkrét szolgáltatást
azd env get-values
# Keresse meg a *_URL változókat
```
</details>

### 📚 Teljes Hibakeresési Források

- **Gyakori Problémák Útmutató:** [Részletes Megoldások](docs/troubleshooting/common-issues.md)
- **AI Specifikus Problémák:** [AI hibakeresés](docs/troubleshooting/ai-troubleshooting.md)
- **Hibakeresési Útmutató:** [Lépésről-lépésre Hibakeresés](docs/troubleshooting/debugging.md)
- **Segítség Kérése:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Tanfolyam Befejezés & Tanúsítás

### Haladás Követése
Kövesse nyomon tanulási előrehaladását minden fejezeten keresztül:

- [ ] **1. fejezet**: Alapok & Gyors Kezdés ✅
- [ ] **2. fejezet**: AI-Alapú Fejlesztés ✅  
- [ ] **3. fejezet**: Konfiguráció & Hitelesítés ✅
- [ ] **4. fejezet**: Infrastruktúra Kód formájában & Telepítés ✅
- [ ] **5. fejezet**: Többügynök AI Megoldások ✅
- [ ] **6. fejezet**: Telepítés Előtti Érvényesítés & Tervezés ✅
- [ ] **7. fejezet**: Hibakeresés & Debugging ✅
- [ ] **8. fejezet**: Üzemeltetés & Vállalati Minták ✅

### Tanulás Ellenőrzése
Minden fejezet befejezése után ellenőrizze tudását:
1. **Gyakorlati Feladat**: Fejezeti gyakorlati telepítés végrehajtása
2. **Tudásellenőrzés**: Gyakran Ismételt Kérdések átnézése fejezetre vonatkozóan
3. **Közösségi Megbeszélés**: Ossza meg tapasztalatait az Azure Discordban
4. **Következő fejezet**: Lépjen a következő komplexitási szintre

### Tanfolyam Befejezés Előnyei
Az összes fejezet befejezése után Ön rendelkezni fog:
- **Termelési Tapasztalattal**: Valódi AI alkalmazásokat telepített Azure-ba
- **Szakmai Készségekkel**: Vállalati szintű telepítési képességek  
- **Közösségi Elismeréssel**: Aktív tagja az Azure fejlesztői közösségnek
- **Karrierfejlődéssel**: Keresett AZD és AI telepítési szakértelem

---

## 🤝 Közösség & Támogatás

### Segítség & Támogatás Kérése
- **Technikai Problémák**: [Hibabejelentés és funkciókérések](https://github.com/microsoft/azd-for-beginners/issues)
- **Tanulással Kapcsolatos Kérdések**: [Microsoft Azure Discord Közösség](https://discord.gg/microsoft-azure) és [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI Specifikus Segítség**: Csatlakozzon a [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentáció**: [Hivatalos Azure Developer CLI dokumentáció](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Közösségi Információk a Microsoft Foundry Discordból

**Legutóbbi Szavazási Eredmények a #Azure Csatornán:**
- **45%** fejlesztő használni szeretné az AZD-t AI feladatokra
- **Fő kihívások**: Többcélú szolgáltatás telepítések, hitelesítési kezelés, termelési készség  
- **Leggyakrabban kért**: AI-specifikus sablonok, hibakeresési útmutatók, legjobb gyakorlatok

**Csatlakozzon közösségünkhöz, hogy:**
- Ossza meg AZD + AI tapasztalatait és kapjon segítséget
- Előzetes hozzáférést kapjon új AI sablonokhoz
- Hozzájáruljon AI telepítési legjobb gyakorlatokhoz
- Befolyásolja a jövőbeni AI + AZD funkciófejlesztést

### Hozzájárulás a Tanfolyamhoz
Örömmel fogadjuk a hozzájárulásokat! Kérjük, olvassa el a [Hozzájárulási Útmutatót](CONTRIBUTING.md) részletekért az alábbiakról:
- **Tartalomfejlesztések**: Fejeztek és példák továbbfejlesztése
- **Új Példák**: Valós forgatókönyvek és sablonok hozzáadása  
- **Fordítás**: Többnyelvű támogatás fenntartása
- **Hibajelentések**: Pontosság és érthetőség javítása
- **Közösségi Szabályok**: Befogadó közösségi irányelveink követése

---

## 📄 Tanfolyam Információk

### Licenc
Ez a projekt az MIT Licenc alatt áll - további részletek a [LICENSE](../../LICENSE) fájlban.

### Kapcsolódó Microsoft Tanulási Források

Csapatunk más átfogó tanulási tanfolyamokat is készít:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j kezdőknek](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js kezdőknek](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain kezdőknek](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Ügynökök
[![AZD kezdőknek](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI kezdőknek](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP kezdőknek](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Ügynökök kezdőknek](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generatív AI Sorozat
[![Generatív AI kezdőknek](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generatív AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generatív AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generatív AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Alaptanulás
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
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

**Kezdők**: Kezdd el a [1. fejezettel: Alapok & Gyors kezdés](../..)  
**AI fejlesztők**: Ugorj a [2. fejezethez: AI-első fejlesztés](../..)  
**Tapasztalt fejlesztők**: Kezdd a [3. fejezettel: Konfiguráció & Hitelesítés](../..)

**Következő lépések**: [Kezdd el az 1. fejezetet - AZD Alapok](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ezt a dokumentumot az [Co-op Translator](https://github.com/Azure/co-op-translator) AI fordító szolgáltatás segítségével fordítottuk le. Bár igyekszünk pontosak lenni, kérjük, vegye figyelembe, hogy az automatikus fordítások tartalmazhatnak hibákat vagy pontatlanságokat. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Kritikus információk esetén szakmai emberi fordítást javaslunk. Nem vállalunk felelősséget a fordítás használatából eredő félreértésekért vagy félreértelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->