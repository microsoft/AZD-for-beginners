<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "2a0861541126250c3558d667e9b13c50",
  "translation_date": "2025-11-23T10:14:19+00:00",
  "source_file": "course-outline.md",
  "language_code": "hu"
}
-->
# AZD Kezdőknek: Tanfolyamvázlat és Tanulási Keretrendszer

## Tanfolyam Áttekintés

Sajátítsd el az Azure Developer CLI (azd) használatát strukturált fejezeteken keresztül, amelyek progresszív tanulást biztosítanak. **Különös hangsúly az AI alkalmazások telepítésén Microsoft Foundry integrációval.**

### Miért elengedhetetlen ez a tanfolyam a modern fejlesztők számára?

A Microsoft Foundry Discord közösség visszajelzései alapján **a fejlesztők 45%-a szeretné használni az AZD-t AI munkaterhelésekhez**, de nehézségekbe ütköznek az alábbiakban:
- Összetett, több szolgáltatást magában foglaló AI architektúrák
- AI alkalmazások éles környezetbe történő telepítésének legjobb gyakorlatai  
- Azure AI szolgáltatások integrációja és konfigurálása
- AI munkaterhelések költségoptimalizálása
- AI-specifikus telepítési problémák elhárítása

### Fő tanulási célok

A tanfolyam elvégzésével:
- **Elsajátítod az AZD alapjait**: Alapfogalmak, telepítés és konfiguráció
- **AI alkalmazásokat telepítesz**: AZD használata Microsoft Foundry szolgáltatásokkal
- **Infrastruktúra kódként történő megvalósítása**: Azure erőforrások kezelése Bicep sablonokkal
- **Telepítési hibák elhárítása**: Gyakori problémák megoldása és hibakeresés
- **Éles környezetre optimalizálás**: Biztonság, skálázás, monitorozás és költségkezelés
- **Többügynökös megoldások építése**: Összetett AI architektúrák telepítése

## 🎓 Workshop Tanulási Élmény

### Rugalmas Tanulási Módszerek
Ez a tanfolyam mind **önálló tanulásra**, mind **vezetett workshopokra** alkalmas, lehetővé téve a tanulók számára, hogy gyakorlati tapasztalatokat szerezzenek az AZD használatában interaktív gyakorlatokon keresztül.

#### 🚀 Önálló Tanulási Mód
**Tökéletes egyéni fejlesztők és folyamatos tanulás számára**

**Jellemzők:**
- **Böngésző-alapú felület**: MkDocs-alapú workshop, amely bármely böngészőből elérhető
- **GitHub Codespaces integráció**: Egy kattintásos fejlesztési környezet előre konfigurált eszközökkel
- **Interaktív DevContainer környezet**: Nincs szükség helyi beállításra - azonnal kezdhetsz kódolni
- **Haladáskövetés**: Beépített ellenőrzőpontok és validációs gyakorlatok
- **Közösségi támogatás**: Hozzáférés az Azure Discord csatornákhoz kérdések és együttműködés céljából

**Tanulási Struktúra:**
- **Rugalmas időbeosztás**: Fejezetek elvégzése saját tempóban, napok vagy hetek alatt
- **Ellenőrzőpont rendszer**: A tanulás validálása, mielőtt bonyolultabb témákra térnél át
- **Forráskönyvtár**: Átfogó dokumentáció, példák és hibakeresési útmutatók
- **Portfóliófejlesztés**: Telepíthető projektek építése szakmai portfólióhoz

**Kezdés (Önálló Tanulás):**
```bash
# Opció 1: GitHub Codespaces (Ajánlott)
# Navigáljon a tárolóhoz, és kattintson a "Code" → "Create codespace on main" gombra

# Opció 2: Helyi fejlesztés
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Kövesse a workshop/README.md fájlban található beállítási utasításokat
```

#### 🏛️ Vezetett Workshopok
**Ideális vállalati képzésekhez, bootcamp-ekhez és oktatási intézményekhez**

**Workshop Formátumok:**

**📚 Akadémiai Tanfolyam Integráció (8-12 hét)**
- **Egyetemi Programok**: Féléves tanfolyam heti 2 órás foglalkozásokkal
- **Bootcamp Formátum**: Intenzív 3-5 napos program napi 6-8 órás foglalkozásokkal
- **Vállalati Képzés**: Havi csapatfoglalkozások gyakorlati projektmegvalósítással
- **Értékelési Keretrendszer**: Osztályozott feladatok, társértékelések és záróprojektek

**🚀 Intenzív Workshop (1-3 nap)**
- **1. nap**: Alapok + AI Fejlesztés (1-2. fejezet) - 6 óra
- **2. nap**: Konfiguráció + Infrastruktúra (3-4. fejezet) - 6 óra  
- **3. nap**: Haladó minták + Éles környezet (5-8. fejezet) - 8 óra
- **Utánkövetés**: Opcionális 2 hetes mentorálás a projekt befejezéséhez

**⚡ Vezetői Tájékoztató (4-6 óra)**
- **Stratégiai Áttekintés**: AZD értékajánlat és üzleti hatás (1 óra)
- **Gyakorlati Bemutató**: AI alkalmazás telepítése elejétől a végéig (2 óra)
- **Architektúra Áttekintés**: Vállalati minták és irányelvek (1 óra)
- **Megvalósítási Terv**: Szervezeti bevezetési stratégia (1-2 óra)

#### 🛠️ Workshop Tanulási Módszertan
**Felfedezés → Telepítés → Testreszabás megközelítés a gyakorlati készségfejlesztéshez**

**1. Fázis: Felfedezés (45 perc)**
- **Sablonok Felfedezése**: Azure AI Foundry sablonok és szolgáltatások értékelése
- **Architektúra Elemzés**: Többügynökös minták és telepítési stratégiák megértése
- **Követelmények Felmérése**: Szervezeti igények és korlátok azonosítása
- **Környezet Beállítása**: Fejlesztési környezet és Azure erőforrások konfigurálása

**2. Fázis: Telepítés (2 óra)**
- **Irányított Megvalósítás**: AI alkalmazások lépésről lépésre történő telepítése AZD-vel
- **Szolgáltatás Konfiguráció**: Azure AI szolgáltatások, végpontok és hitelesítés beállítása
- **Biztonsági Megvalósítás**: Vállalati biztonsági minták és hozzáférés-vezérlés alkalmazása
- **Validációs Tesztelés**: Telepítések ellenőrzése és gyakori problémák elhárítása

**3. Fázis: Testreszabás (45 perc)**
- **Alkalmazás Módosítása**: Sablonok adaptálása specifikus felhasználási esetekhez és igényekhez
- **Éles Környezet Optimalizálása**: Monitorozás, költségkezelés és skálázási stratégiák megvalósítása
- **Haladó Minták**: Többügynökös koordináció és összetett architektúrák felfedezése
- **Következő Lépések Tervezése**: Tanulási útvonal meghatározása a további készségfejlesztéshez

#### 🎯 Workshop Tanulási Eredmények
**Mérhető készségek gyakorlati tapasztalatok révén**

**Technikai Kompetenciák:**
- **Éles AI Alkalmazások Telepítése**: Sikeres AI-alapú megoldások telepítése és konfigurálása
- **Infrastruktúra Kódként**: Egyedi Bicep sablonok létrehozása és kezelése
- **Többügynökös Architektúra**: Koordinált AI ügynök megoldások megvalósítása
- **Éles Környezetre Való Felkészültség**: Biztonsági, monitorozási és irányítási minták alkalmazása
- **Hibakeresési Szakértelem**: Telepítési és konfigurációs problémák önálló megoldása

**Szakmai Készségek:**
- **Projektvezetés**: Technikai csapatok vezetése felhőalapú telepítési kezdeményezésekben
- **Architektúra Tervezés**: Skálázható, költséghatékony Azure megoldások tervezése
- **Tudásmegosztás**: Kollégák képzése és mentorálása AZD legjobb gyakorlataiban
- **Stratégiai Tervezés**: Szervezeti felhőbevezetési stratégiák befolyásolása

#### 📋 Workshop Források és Anyagok
**Átfogó eszköztár oktatók és tanulók számára**

**Oktatóknak:**
- **Oktatói Útmutató**: [Workshop Vezetési Útmutató](workshop/docs/instructor-guide.md) - Foglalkozások tervezése és lebonyolítása
- **Prezentációs Anyagok**: Diák, architektúra diagramok és bemutató szkriptek
- **Értékelési Eszközök**: Gyakorlati feladatok, tudásellenőrzések és értékelési szempontok
- **Technikai Beállítás**: Környezet konfiguráció, hibakeresési útmutatók és tartalék tervek

**Tanulóknak:**
- **Interaktív Workshop Környezet**: [Workshop Anyagok](workshop/README.md) - Böngésző-alapú tanulási platform
- **Lépésről-Lépésre Útmutatók**: [Irányított Gyakorlatok](../../workshop/docs/instructions) - Részletes megvalósítási útmutatók  
- **Referencia Dokumentáció**: [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - AI-központú mélyreható anyagok
- **Közösségi Források**: Azure Discord csatornák, GitHub viták és szakértői támogatás

#### 🏢 Vállalati Workshop Megvalósítás
**Szervezeti telepítési és képzési stratégiák**

**Vállalati Képzési Programok:**
- **Fejlesztői Bevezetés**: Új munkatársak betanítása AZD alapokkal (2-4 hét)
- **Csapatfejlesztés**: Negyedéves workshopok meglévő fejlesztői csapatok számára (1-2 nap)
- **Architektúra Áttekintés**: Havi foglalkozások vezető mérnökök és architekták számára (4 óra)
- **Vezetői Tájékoztatók**: Vezetői workshopok technikai döntéshozók számára (fél nap)

**Megvalósítási Támogatás:**
- **Egyedi Workshop Tervezés**: Testreszabott tartalom specifikus szervezeti igényekhez
- **Pilot Program Menedzsment**: Strukturált bevezetés sikerességi mutatókkal és visszacsatolási hurkokkal  
- **Folyamatos Mentorálás**: Workshop utáni támogatás a projektek megvalósításához
- **Közösségépítés**: Belső Azure AI fejlesztői közösségek és tudásmegosztás

**Sikerességi Mutatók:**
- **Készségfejlesztés**: Előtte/utána értékelések a technikai kompetenciák növekedésének mérésére
- **Telepítési Siker**: Résztvevők százaléka, akik sikeresen telepítenek éles alkalmazásokat
- **Termelékenységhez Szükséges Idő**: Csökkentett betanulási idő új Azure AI projektekhez
- **Tudásmegtartás**: Utánkövetési értékelések 3-6 hónappal a workshop után

## 8 Fejezetes Tanulási Struktúra

### 1. Fejezet: Alapok és Gyors Kezdés (30-45 perc) 🌱
**Előfeltételek**: Azure előfizetés, alapvető parancssori ismeretek  
**Bonyolultság**: ⭐

#### Amit Megtanulsz
- Azure Developer CLI alapjainak megértése
- AZD telepítése a platformodra  
- Első sikeres telepítésed
- Alapfogalmak és terminológia

#### Tanulási Források
- [AZD Alapok](docs/getting-started/azd-basics.md) - Alapfogalmak
- [Telepítés és Beállítás](docs/getting-started/installation.md) - Platformspecifikus útmutatók
- [Első Projekted](docs/getting-started/first-project.md) - Gyakorlati útmutató
- [Parancsok Segédlete](resources/cheat-sheet.md) - Gyors referencia

#### Gyakorlati Eredmény
Egy egyszerű webalkalmazás sikeres telepítése Azure-ra AZD használatával

---

### 2. Fejezet: AI-Orientált Fejlesztés (1-2 óra) 🤖
**Előfeltételek**: 1. fejezet elvégzése  
**Bonyolultság**: ⭐⭐

#### Amit Megtanulsz
- Microsoft Foundry integráció AZD-vel
- AI-alapú alkalmazások telepítése
- AI szolgáltatások konfigurációjának megértése
- RAG (Retrieval-Augmented Generation) minták

#### Tanulási Források
- [Microsoft Foundry Integráció](docs/microsoft-foundry/microsoft-foundry-integration.md)
- [AI Modell Telepítés](docs/microsoft-foundry/ai-model-deployment.md)
- [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - **ÚJ**: Átfogó 2-3 órás gyakorlati labor
- [Interaktív Workshop Útmutató](workshop/README.md) - **ÚJ**: Böngésző-alapú workshop MkDocs előnézettel
- [Microsoft Foundry Sablonok](README.md#featured-microsoft-foundry-templates)
- [Workshop Útmutatók](../../workshop/docs/instructions) - **ÚJ**: Lépésről-lépésre irányított gyakorlatok

#### Gyakorlati Eredmény
AI-alapú chatalkalmazás telepítése és konfigurálása RAG képességekkel

#### Workshop Tanulási Útvonal (Opcionális Kiegészítés)
**ÚJ Interaktív Élmény**: [Teljes Workshop Útmutató](workshop/README.md)
1. **Felfedezés** (30 perc): Sablon kiválasztása és értékelése
2. **Telepítés** (45 perc): AI sablon funkcióinak telepítése és validálása  
3. **Elemzés** (30 perc): Sablon architektúrájának és összetevőinek megértése
4. **Konfiguráció** (30 perc): Beállítások és paraméterek testreszabása
5. **Testreszabás** (45 perc): Módosítás és iteráció, hogy sajátoddá tedd
6. **Eltávolítás** (15 perc): Erőforrások törlése és életciklus megértése
7. **Összegzés** (15 perc): Következő lépések és haladó tanulási utak

--- 

### 3. Fejezet: Konfiguráció és Hitelesítés (45-60 perc) ⚙️
**Előfeltételek**: 1. fejezet elvégzése  
**Bonyolultság**: ⭐⭐

#### Amit Megtanulsz
- Környezet konfiguráció és kezelés
- Hitelesítési és biztonsági legjobb gyakorlatok
- Erőforrások elnevezése és szervezése
- Több környezet telepítése

#### Tanulási Források
- [Konfigurációs Útmutató](docs/getting-started/configuration.md) - Környezet beállítása
- [Hitelesítési és Biztonsági Minták](docs/getting-started/authsecurity.md) - Kezelt identitás és Key Vault integráció
- Több környezet példák

#### Gyakorlati Eredmény
Több környezet kezelése megfelelő hitelesítéssel és biztonsággal

---

### 4. Fejezet: Infrastruktúra Kódként & Telepítés (1-1,5 óra) 🏗️
**Előfeltételek**: 1-3. fejezet elvégzése  
**Bonyolultság**: ⭐⭐⭐

####
Érvényesítse és optimalizálja a telepítéseket a végrehajtás előtt

---

### 7. fejezet: Hibakeresés és hibaelhárítás (1-1,5 óra) 🔧
**Előfeltételek**: Bármely telepítési fejezet befejezése  
**Komplexitás**: ⭐⭐

#### Amit megtanul
- Szisztematikus hibakeresési megközelítések
- Gyakori problémák és megoldások
- AI-specifikus hibaelhárítás
- Teljesítményoptimalizálás

#### Tanulási források
- [Gyakori problémák](docs/troubleshooting/common-issues.md) - GYIK és megoldások
- [Hibakeresési útmutató](docs/troubleshooting/debugging.md) - Lépésről lépésre stratégiák
- [AI-specifikus hibaelhárítás](docs/troubleshooting/ai-troubleshooting.md) - AI szolgáltatások problémái

#### Gyakorlati eredmény
Önállóan diagnosztizálja és oldja meg a telepítési problémákat

---

### 8. fejezet: Produkciós és vállalati minták (2-3 óra) 🏢
**Előfeltételek**: 1-4 fejezetek befejezése  
**Komplexitás**: ⭐⭐⭐⭐

#### Amit megtanul
- Produkciós telepítési stratégiák
- Vállalati biztonsági minták
- Felügyelet és költségoptimalizálás
- Skálázhatóság és irányítás

- Legjobb gyakorlatok produkciós konténeres alkalmazások telepítéséhez (biztonság, felügyelet, költség, CI/CD)

#### Tanulási források
- [Produkciós AI legjobb gyakorlatok](docs/microsoft-foundry/production-ai-practices.md) - Vállalati minták
- Mikroszolgáltatások és vállalati példák
- Felügyeleti és irányítási keretrendszerek
- [Mikroszolgáltatások architektúra példa](../../examples/container-app/microservices) - Blue-green/canary telepítés, elosztott nyomkövetés és költségoptimalizálás

#### Gyakorlati eredmény
Vállalati szintű alkalmazások telepítése teljes produkciós képességekkel

---

## Tanulási haladás és komplexitás

### Fokozatos készségfejlesztés

- **🌱 Kezdők**: Kezdje az 1. fejezettel (Alapok) → 2. fejezet (AI fejlesztés)
- **🔧 Középhaladó**: 3-4 fejezetek (Konfiguráció és infrastruktúra) → 6. fejezet (Érvényesítés)
- **🚀 Haladó**: 5. fejezet (Többügynökös megoldások) → 7. fejezet (Hibaelhárítás)
- **🏢 Vállalati szint**: Az összes fejezet befejezése, különös figyelemmel a 8. fejezetre (Produkciós minták)

- **Konténeres alkalmazás útvonal**: 4. fejezet (Konténeres telepítés), 5. fejezet (Mikroszolgáltatások integrációja), 8. fejezet (Produkciós legjobb gyakorlatok)

### Komplexitás mutatók

- **⭐ Alap**: Egyetlen koncepció, irányított oktatóanyagok, 30-60 perc
- **⭐⭐ Középhaladó**: Több koncepció, gyakorlati feladatok, 1-2 óra  
- **⭐⭐⭐ Haladó**: Összetett architektúrák, egyedi megoldások, 1-3 óra
- **⭐⭐⭐⭐ Szakértő**: Produkciós rendszerek, vállalati minták, 2-4 óra

### Rugalmas tanulási útvonalak

#### 🎯 AI fejlesztő gyorsított pálya (4-6 óra)
1. **1. fejezet**: Alapok és gyors kezdés (45 perc)
2. **2. fejezet**: AI-első fejlesztés (2 óra)  
3. **5. fejezet**: Többügynökös AI megoldások (3 óra)
4. **8. fejezet**: Produkciós AI legjobb gyakorlatok (1 óra)

#### 🛠️ Infrastruktúra szakértői útvonal (5-7 óra)
1. **1. fejezet**: Alapok és gyors kezdés (45 perc)
2. **3. fejezet**: Konfiguráció és hitelesítés (1 óra)
3. **4. fejezet**: Infrastruktúra kódként és telepítés (1,5 óra)
4. **6. fejezet**: Telepítés előtti érvényesítés és tervezés (1 óra)
5. **7. fejezet**: Hibakeresés és hibaelhárítás (1,5 óra)
6. **8. fejezet**: Produkciós és vállalati minták (2 óra)

#### 🎓 Teljes tanulási út (8-12 óra)
Az összes 8 fejezet sorrendben történő befejezése gyakorlati feladatokkal és érvényesítéssel

## Tanfolyam befejezési keretrendszer

### Tudás érvényesítése
- **Fejezet ellenőrzőpontok**: Gyakorlati feladatok mérhető eredményekkel
- **Gyakorlati ellenőrzés**: Működő megoldások telepítése minden fejezethez
- **Haladás nyomon követése**: Vizualizált mutatók és befejezési jelvények
- **Közösségi érvényesítés**: Tapasztalatok megosztása az Azure Discord csatornákon

### Tanulási eredmények értékelése

#### 1-2 fejezet befejezése (Alapok + AI)
- ✅ Egyszerű webalkalmazás telepítése AZD használatával
- ✅ AI-alapú chatalkalmazás telepítése RAG segítségével
- ✅ AZD alapfogalmak és AI integráció megértése

#### 3-4 fejezet befejezése (Konfiguráció + Infrastruktúra)  
- ✅ Több környezet telepítésének kezelése
- ✅ Egyedi Bicep infrastruktúra sablonok létrehozása
- ✅ Biztonságos hitelesítési minták megvalósítása

#### 5-6 fejezet befejezése (Többügynökös + Érvényesítés)
- ✅ Összetett többügynökös AI megoldás telepítése
- ✅ Kapacitástervezés és költségoptimalizálás végrehajtása
- ✅ Automatikus telepítés előtti érvényesítés megvalósítása

#### 7-8 fejezet befejezése (Hibaelhárítás + Produkció)
- ✅ Telepítési problémák önálló hibaelhárítása  
- ✅ Vállalati szintű felügyelet és biztonság megvalósítása
- ✅ Produkciós kész alkalmazások telepítése irányítással

### Tanúsítvány és elismerés
- **Tanfolyam befejezési jelvény**: Az összes 8 fejezet befejezése gyakorlati érvényesítéssel
- **Közösségi elismerés**: Aktív részvétel a Microsoft Foundry Discordon
- **Szakmai fejlődés**: Iparág-specifikus AZD és AI telepítési készségek
- **Karrier előrelépés**: Vállalati szintű felhőtelepítési képességek

## 🎓 Átfogó tanulási eredmények

### Alap szint (1-2 fejezet)
Az alap fejezetek befejezése után a tanulók demonstrálják:

**Technikai képességek:**
- Egyszerű webalkalmazások telepítése Azure-ra AZD parancsokkal
- AI-alapú chatalkalmazások telepítése RAG funkciókkal
- AZD alapfogalmak megértése: sablonok, környezetek, előkészítési munkafolyamatok
- Microsoft Foundry szolgáltatások integrálása AZD telepítésekkel
- Azure AI szolgáltatások konfigurációinak és API végpontjainak navigálása

**Szakmai készségek:**
- Strukturált telepítési munkafolyamatok követése a konzisztens eredményekért
- Alapvető telepítési problémák hibaelhárítása naplók és dokumentáció segítségével
- Hatékony kommunikáció a felhőtelepítési folyamatokról
- Legjobb gyakorlatok alkalmazása biztonságos AI szolgáltatások integrációjához

**Tanulási érvényesítés:**
- ✅ Sikeres telepítés `todo-nodejs-mongo` sablonnal
- ✅ `azure-search-openai-demo` telepítése és konfigurálása RAG funkcióval
- ✅ Interaktív workshop gyakorlatok befejezése (Felfedezési fázis)
- ✅ Részvétel az Azure Discord közösségi beszélgetéseiben

### Középhaladó szint (3-4 fejezet)
A középhaladó fejezetek befejezése után a tanulók demonstrálják:

**Technikai képességek:**
- Több környezet telepítésének kezelése (fejlesztés, tesztelés, produkció)
- Egyedi Bicep sablonok létrehozása infrastruktúra kódként
- Biztonságos hitelesítési minták megvalósítása kezelt identitással
- Összetett több szolgáltatásból álló alkalmazások telepítése egyedi konfigurációkkal
- Erőforrás-előkészítési stratégiák optimalizálása költség és teljesítmény szempontjából

**Szakmai készségek:**
- Skálázható infrastruktúra architektúrák tervezése
- Biztonsági legjobb gyakorlatok megvalósítása felhőtelepítésekhez
- Infrastruktúra minták dokumentálása csapat együttműködéshez
- Megfelelő Azure szolgáltatások kiválasztása követelmények alapján

**Tanulási érvényesítés:**
- ✅ Külön környezetek konfigurálása környezet-specifikus beállításokkal
- ✅ Egyedi Bicep sablon létrehozása és telepítése több szolgáltatásból álló alkalmazáshoz
- ✅ Kezelt identitás hitelesítés megvalósítása biztonságos hozzáféréshez
- ✅ Konfigurációkezelési gyakorlatok befejezése valós forgatókönyvekkel

### Haladó szint (5-6 fejezet)
A haladó fejezetek befejezése után a tanulók demonstrálják:

**Technikai képességek:**
- Többügynökös AI megoldások telepítése és koordinált munkafolyamatokkal való vezérlése
- Ügyfél- és készletügynök architektúrák megvalósítása kiskereskedelmi forgatókönyvekhez
- Átfogó kapacitástervezés és erőforrás-érvényesítés végrehajtása
- Automatikus telepítés előtti érvényesítés és optimalizálás végrehajtása
- Költséghatékony SKU kiválasztások tervezése munkaterhelési követelmények alapján

**Szakmai készségek:**
- Összetett AI megoldások architektúrája produkciós környezetekhez
- Technikai megbeszélések vezetése AI telepítési stratégiákról
- Junior fejlesztők mentorálása AZD és AI telepítési legjobb gyakorlatokban
- AI architektúra minták értékelése és ajánlása üzleti követelményekhez

**Tanulási érvényesítés:**
- ✅ Teljes kiskereskedelmi többügynökös megoldás telepítése ARM sablonokkal
- ✅ Ügynök koordináció és munkafolyamat vezérlés bemutatása
- ✅ Kapacitástervezési gyakorlatok befejezése valós erőforrás-korlátokkal
- ✅ Telepítési készenlét érvényesítése automatikus előzetes ellenőrzésekkel

### Szakértői szint (7-8 fejezet)
A szakértői fejezetek befejezése után a tanulók demonstrálják:

**Technikai képességek:**
- Önállóan diagnosztizálja és oldja meg összetett telepítési problémákat
- Vállalati szintű biztonsági minták és irányítási keretrendszerek megvalósítása
- Átfogó felügyeleti és riasztási stratégiák tervezése
- Produkciós telepítések optimalizálása skálázhatóság, költség és teljesítmény szempontjából
- CI/CD csővezetékek létrehozása megfelelő teszteléssel és érvényesítéssel

**Szakmai készségek:**
- Vállalati felhő átalakítási kezdeményezések vezetése
- Szervezeti telepítési szabványok tervezése és megvalósítása
- Fejlesztői csapatok képzése haladó AZD gyakorlatokban
- Technikai döntéshozatal befolyásolása vállalati AI telepítésekhez

**Tanulási érvényesítés:**
- ✅ Összetett több szolgáltatásból álló telepítési hibák megoldása
- ✅ Vállalati biztonsági minták megvalósítása megfelelőségi követelményekkel
- ✅ Produkciós felügyelet tervezése és telepítése Application Insights segítségével
- ✅ Vállalati irányítási keretrendszer megvalósítása

## 🎯 Tanfolyam befejezési tanúsítvány

### Haladás nyomon követési keretrendszer
Kövesse tanulási haladását strukturált ellenőrzőpontokon keresztül:

- [ ] **1. fejezet**: Alapok és gyors kezdés ✅
- [ ] **2. fejezet**: AI-első fejlesztés ✅  
- [ ] **3. fejezet**: Konfiguráció és hitelesítés ✅
- [ ] **4. fejezet**: Infrastruktúra kódként és telepítés ✅
- [ ] **5. fejezet**: Többügynökös AI megoldások ✅
- [ ] **6. fejezet**: Telepítés előtti érvényesítés és tervezés ✅
- [ ] **7. fejezet**: Hibakeresés és hibaelhárítás ✅
- [ ] **8. fejezet**: Produkciós és vállalati minták ✅

### Érvényesítési folyamat
Minden fejezet befejezése után ellenőrizze tudását:

1. **Gyakorlati feladatok befejezése**: Működő megoldások telepítése minden fejezethez
2. **Tudásértékelés**: GYIK szekciók áttekintése és önértékelések elvégzése
3. **Közösségi részvétel**: Tapasztalatok megosztása és visszajelzés kérése az Azure Discordon
4. **Portfólió fejlesztés**: Telepítések és tanulságok dokumentálása
5. **Társak általi értékelés**: Együttműködés más tanulókkal összetett forgatókönyvekben

### Tanfolyam befejezési előnyök
Az összes fejezet érvényesítésével történő befejezése után a végzettek rendelkeznek:

**Technikai szakértelem:**
- **Produkciós tapasztalat**: Valós AI alkalmazások telepítése Azure környezetekbe
- **Szakmai készségek**: Vállalati szintű telepítési és hibaelhárítási képességek  
- **Architektúra ismeretek**: Többügynökös AI megoldások és összetett infrastruktúra minták
- **Hibaelhárítási jártasság**: Telepítési és konfigurációs problémák önálló megoldása

**Szakmai fejlődés:**
- **Iparági elismerés**: Igazolható készségek a nagy keresletű AZD és AI telepítési területeken
- **Karrier előrelépés**: Képesítések felhőarchitekt és AI telepítési szakértői szerepekhez
- **Közösségi vezetés**: Aktív tagság az

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Felelősség kizárása**:  
Ez a dokumentum az AI fordítási szolgáltatás [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével lett lefordítva. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Fontos információk esetén javasolt professzionális emberi fordítást igénybe venni. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely a fordítás használatából eredhet.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->