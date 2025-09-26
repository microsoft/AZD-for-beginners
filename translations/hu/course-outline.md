<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "aace36eff845763a5b041a4ed9a33e02",
  "translation_date": "2025-09-25T00:48:48+00:00",
  "source_file": "course-outline.md",
  "language_code": "hu"
}
-->
# AZD Kezdőknek: Kurzusvázlat és Tanulási Keretrendszer

## Kurzus Áttekintés

Tanuld meg az Azure Developer CLI (azd) használatát strukturált fejezeteken keresztül, amelyek fokozatos tanulást biztosítanak. **Különös hangsúly az AI alkalmazások telepítésén az Azure AI Foundry integrációval.**

### Miért elengedhetetlen ez a kurzus a modern fejlesztők számára?

Az Azure AI Foundry Discord közösség visszajelzései alapján **a fejlesztők 45%-a szeretné az AZD-t AI munkaterhelésekhez használni**, de nehézségekbe ütköznek az alábbiak miatt:
- Összetett, több szolgáltatást igénylő AI architektúrák
- AI alkalmazások telepítésének legjobb gyakorlatai
- Azure AI szolgáltatások integrációja és konfigurációja
- AI munkaterhelések költségoptimalizálása
- AI-specifikus telepítési problémák elhárítása

### Fő Tanulási Célok

A kurzus elvégzésével:
- **Elsajátítod az AZD alapjait**: Alapfogalmak, telepítés és konfiguráció
- **AI alkalmazásokat telepítesz**: AZD használata az Azure AI Foundry szolgáltatásokkal
- **Infrastruktúra kódként**: Azure erőforrások kezelése Bicep sablonokkal
- **Telepítési problémák megoldása**: Gyakori hibák elhárítása és hibakeresés
- **Optimalizálás a termeléshez**: Biztonság, skálázás, monitorozás és költségkezelés
- **Többügynökös megoldások építése**: Összetett AI architektúrák telepítése

## 🎓 Workshop Tanulási Élmény

### Rugalmas Tanulási Módszerek
A kurzus úgy lett kialakítva, hogy támogassa mind az **egyéni, önálló tanulást**, mind a **vezetett workshopokat**, lehetőséget adva a résztvevőknek, hogy gyakorlati tapasztalatokat szerezzenek az AZD használatában interaktív gyakorlatokon keresztül.

#### 🚀 Önálló Tanulási Mód
**Tökéletes egyéni fejlesztők és folyamatos tanulás számára**

**Funkciók:**
- **Böngésző-alapú felület**: MkDocs-alapú workshop, amely bármely böngészőből elérhető
- **GitHub Codespaces integráció**: Egy kattintásos fejlesztési környezet előre konfigurált eszközökkel
- **Interaktív DevContainer környezet**: Nincs szükség helyi beállításra - azonnal kezdhetsz kódolni
- **Haladáskövetés**: Beépített ellenőrzőpontok és validációs gyakorlatok
- **Közösségi támogatás**: Azure Discord csatornák kérdésekhez és együttműködéshez

**Tanulási Struktúra:**
- **Rugalmas időbeosztás**: Fejezetek elvégzése saját tempóban, napok vagy hetek alatt
- **Ellenőrzőpont rendszer**: Tanulás validálása, mielőtt összetettebb témákba lépnél
- **Erőforrás könyvtár**: Átfogó dokumentáció, példák és hibaelhárítási útmutatók
- **Portfólió fejlesztés**: Telepíthető projektek építése szakmai portfólióhoz

**Kezdés (Önálló Tanulás):**
```bash
# Option 1: GitHub Codespaces (Recommended)
# Navigate to the repository and click "Code" → "Create codespace on main"

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow setup instructions in workshop/README.md
```

#### 🏛️ Vezetett Workshopok
**Ideális vállalati képzésekhez, bootcamp-ekhez és oktatási intézményekhez**

**Workshop Formátumok:**

**📚 Akadémiai Kurzus Integráció (8-12 hét)**
- **Egyetemi Programok**: Féléves kurzus heti 2 órás foglalkozásokkal
- **Bootcamp Formátum**: Intenzív 3-5 napos program napi 6-8 órás foglalkozásokkal
- **Vállalati Képzés**: Havi csapatfoglalkozások gyakorlati projektmegvalósítással
- **Értékelési Keretrendszer**: Osztályozott feladatok, társértékelések és záróprojektek

**🚀 Intenzív Workshop (1-3 nap)**
- **1. nap**: Alapok + AI fejlesztés (1-2. fejezet) - 6 óra
- **2. nap**: Konfiguráció + Infrastruktúra (3-4. fejezet) - 6 óra  
- **3. nap**: Haladó minták + Termelés (5-8. fejezet) - 8 óra
- **Utókövetés**: Opcionális 2 hetes mentorálás a projekt befejezéséhez

**⚡ Vezetői Tájékoztató (4-6 óra)**
- **Stratégiai Áttekintés**: AZD értékajánlat és üzleti hatás (1 óra)
- **Gyakorlati Bemutató**: AI alkalmazás telepítése elejétől a végéig (2 óra)
- **Architektúra Áttekintés**: Vállalati minták és irányítás (1 óra)
- **Megvalósítási Tervezés**: Szervezeti bevezetési stratégia (1-2 óra)

#### 🛠️ Workshop Tanulási Módszertan
**Felfedezés → Telepítés → Testreszabás megközelítés gyakorlati készségfejlesztéshez**

**1. Fázis: Felfedezés (45 perc)**
- **Sablonok Felfedezése**: Azure AI Foundry sablonok és szolgáltatások értékelése
- **Architektúra Elemzés**: Többügynökös minták és telepítési stratégiák megértése
- **Igényfelmérés**: Szervezeti igények és korlátok azonosítása
- **Környezet Beállítása**: Fejlesztési környezet és Azure erőforrások konfigurálása

**2. Fázis: Telepítés (2 óra)**
- **Irányított Megvalósítás**: AI alkalmazások lépésről lépésre történő telepítése AZD-vel
- **Szolgáltatás Konfiguráció**: Azure AI szolgáltatások, végpontok és hitelesítés beállítása
- **Biztonsági Megvalósítás**: Vállalati biztonsági minták és hozzáférés-vezérlés alkalmazása
- **Validációs Tesztelés**: Telepítések ellenőrzése és gyakori hibák elhárítása

**3. Fázis: Testreszabás (45 perc)**
- **Alkalmazás Módosítása**: Sablonok adaptálása specifikus esetekhez és igényekhez
- **Termelési Optimalizálás**: Monitorozás, költségkezelés és skálázási stratégiák megvalósítása
- **Haladó Minták**: Többügynökös koordináció és összetett architektúrák felfedezése
- **Következő Lépések Tervezése**: Tanulási útvonal meghatározása a folyamatos készségfejlesztéshez

#### 🎯 Workshop Tanulási Eredmények
**Mérhető készségek gyakorlati tapasztalatokon keresztül**

**Technikai Kompetenciák:**
- **Termelési AI Alkalmazások Telepítése**: AI-alapú megoldások sikeres telepítése és konfigurálása
- **Infrastruktúra Kódként**: Egyedi Bicep sablonok létrehozása és kezelése
- **Többügynökös Architektúra**: Koordinált AI ügynök megoldások megvalósítása
- **Termelési Készenlét**: Biztonsági, monitorozási és irányítási minták alkalmazása
- **Hibaelhárítási Szakértelem**: Telepítési és konfigurációs problémák önálló megoldása

**Szakmai Készségek:**
- **Projektvezetés**: Technikai csapatok vezetése felhőalapú telepítési kezdeményezésekben
- **Architektúra Tervezés**: Skálázható, költséghatékony Azure megoldások tervezése
- **Tudásmegosztás**: Kollégák képzése és mentorálása AZD legjobb gyakorlatokban
- **Stratégiai Tervezés**: Szervezeti felhőbevezetési stratégiák befolyásolása

#### 📋 Workshop Erőforrások és Anyagok
**Átfogó eszköztár oktatók és tanulók számára**

**Oktatóknak:**
- **Oktatói Útmutató**: [Workshop Vezetési Útmutató](workshop/docs/instructor-guide.md) - Foglalkozások tervezése és lebonyolítása
- **Prezentációs Anyagok**: Diák, architektúra diagramok és bemutató szkriptek
- **Értékelési Eszközök**: Gyakorlati feladatok, tudásellenőrzések és értékelési rubrikák
- **Technikai Beállítás**: Környezet konfiguráció, hibaelhárítási útmutatók és tartalék tervek

**Tanulóknak:**
- **Interaktív Workshop Környezet**: [Workshop Anyagok](workshop/README.md) - Böngésző-alapú tanulási platform
- **Lépésről Lépésre Útmutatók**: [Irányított Gyakorlatok](../../workshop/docs/instructions) - Részletes megvalósítási útmutatók  
- **Referenciadokumentáció**: [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - AI-központú mélyreható anyagok
- **Közösségi Erőforrások**: Azure Discord csatornák, GitHub viták és szakértői támogatás

#### 🏢 Vállalati Workshop Megvalósítás
**Szervezeti telepítési és képzési stratégiák**

**Vállalati Képzési Programok:**
- **Fejlesztői Bevezetés**: Új munkatársak orientációja AZD alapokkal (2-4 hét)
- **Csapatfejlesztés**: Negyedéves workshopok meglévő fejlesztői csapatok számára (1-2 nap)
- **Architektúra Áttekintés**: Havi foglalkozások vezető mérnökök és architekták számára (4 óra)
- **Vezetői Tájékoztatók**: Vezetői workshopok technikai döntéshozók számára (fél nap)

**Megvalósítási Támogatás:**
- **Egyedi Workshop Tervezés**: Testreszabott tartalom specifikus szervezeti igényekhez
- **Pilot Program Menedzsment**: Strukturált bevezetés sikerességi mutatókkal és visszacsatolási körökkel  
- **Folyamatos Mentorálás**: Workshop utáni támogatás projektmegvalósításhoz
- **Közösségépítés**: Belső Azure AI fejlesztői közösségek és tudásmegosztás

**Sikerességi Mutatók:**
- **Készségfejlesztés**: Előtte/utána értékelések technikai kompetencia növekedésének mérésére
- **Telepítési Siker**: Résztvevők százaléka, akik sikeresen telepítenek termelési alkalmazásokat
- **Termelékenységhez szükséges idő**: Új Azure AI projektek bevezetési idejének csökkentése
- **Tudásmegtartás**: Utólagos értékelések 3-6 hónappal a workshop után

## 8 Fejezetes Tanulási Struktúra

### 1. Fejezet: Alapok és Gyors Kezdés (30-45 perc) 🌱
**Előfeltételek**: Azure előfizetés, alapvető parancssori ismeretek  
**Komplexitás**: ⭐

#### Amit Megtanulsz
- Az Azure Developer CLI alapjainak megértése
- AZD telepítése a platformodra  
- Az első sikeres telepítésed
- Alapfogalmak és terminológia

#### Tanulási Erőforrások
- [AZD Alapok](docs/getting-started/azd-basics.md) - Alapfogalmak
- [Telepítés és Beállítás](docs/getting-started/installation.md) - Platform-specifikus útmutatók
- [Az Első Projekted](docs/getting-started/first-project.md) - Gyakorlati útmutató
- [Parancs Gyorslap](resources/cheat-sheet.md) - Gyors referencia

#### Gyakorlati Eredmény
Sikeresen telepítesz egy egyszerű webalkalmazást az Azure-ra AZD használatával

---

### 2. Fejezet: AI-első Fejlesztés (1-2 óra) 🤖
**Előfeltételek**: 1. fejezet elvégzése  
**Komplexitás**: ⭐⭐

#### Amit Megtanulsz
- Azure AI Foundry integráció AZD-vel
- AI-alapú alkalmazások telepítése
- AI szolgáltatások konfigurációjának megértése
- RAG (Retrieval-Augmented Generation) minták

#### Tanulási Erőforrások
- [Azure AI Foundry Integráció](docs/ai-foundry/azure-ai-foundry-integration.md)
- [AI Modell Telepítés](docs/ai-foundry/ai-model-deployment.md)
- [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - **ÚJ**: Átfogó 2-3 órás gyakorlati lab
- [Interaktív Workshop Útmutató](workshop/README.md) - **ÚJ**: Böngésző-alapú workshop MkDocs előnézettel
- [Azure AI Foundry Sablonok](README.md#featured-azure-ai-foundry-templates)
- [Workshop Útmutatók](../../workshop/docs/instructions) - **ÚJ**: Lépésről lépésre irányított gyakorlatok

#### Gyakorlati Eredmény
Telepítesz és konfigurálsz egy AI-alapú chat alkalmazást RAG képességekkel

#### Workshop Tanulási Útvonal (Opcionális Bővítés)
**ÚJ Interaktív Élmény**: [Teljes Workshop Útmutató](workshop/README.md)
1. **Felfedezés** (30 perc): Sablon kiválasztása és értékelése
2. **Telepítés** (45 perc): AI sablon funkcionalitásának telepítése és validálása  
3. **Szétszedés** (30 perc): Sablon architektúra és komponensek megértése
4. **Konfiguráció** (30 perc): Beállítások és paraméterek testreszabása
5. **Testreszabás** (45 perc): Módosítás és iteráció, hogy sajátoddá tedd
6. **Tisztítás** (15 perc): Erőforrások eltávolítása és életciklus megértése
7. **Zárás** (15 perc): Következő lépések és haladó tanulási útvonalak

---

### 3. Fejezet: Konfiguráció és Hitelesítés (45-60 perc) ⚙️
**Előfeltételek**: 1. fejezet elvégzése  
**Komplexitás**: ⭐⭐

#### Amit Megtanulsz
- Környezet konfigurációja és kezelése
- Hitelesítés és biztonsági legjobb gyakorlatok
- Erőforrások elnevezése és szervezése
- Több környezet telepítése

#### Tanulási Erőforrások
- [Konfigurációs Útmutató](docs/getting-started/configuration.md) - Környezet beállítása
- Biztonsági minták és kezelt identitás
- Több környezet példák

#### Gyakorlati Eredmény
Több környezet kezelése megfelelő hitelesítéssel és biztonsággal

---

### 4. Fejezet: Infrastruktúra Kódként és Telepítés (1-1.5 óra) 🏗️
**Előfeltételek**: 1-3. fejezet elvégzése  
**Komplexitás**: ⭐⭐⭐

#### Amit Megtanulsz
- Haladó telepítési minták
- Infrastruktúra kódként Bicep segítségével
- Erőfor
- [AI-Specifikus Hibakeresés](docs/troubleshooting/ai-troubleshooting.md) - AI szolgáltatási problémák

#### Gyakorlati Eredmény
Önállóan diagnosztizálni és megoldani a gyakori telepítési problémákat

---

### 8. fejezet: Produkciós és Vállalati Minták (2-3 óra) 🏢
**Előfeltételek**: 1-4. fejezetek elvégzése  
**Komplexitás**: ⭐⭐⭐⭐

#### Amit Megtanulsz
- Produkciós telepítési stratégiák
- Vállalati biztonsági minták
- Monitoring és költségoptimalizálás
- Skálázhatóság és irányítás

#### Tanulási Források
- [Produkciós AI Legjobb Gyakorlatok](docs/ai-foundry/production-ai-practices.md) - Vállalati minták
- Mikroszolgáltatások és vállalati példák
- Monitoring és irányítási keretrendszerek

#### Gyakorlati Eredmény
Vállalati szintű alkalmazások telepítése teljes produkciós képességekkel

---

## Tanulási Haladás és Komplexitás

### Fokozatos Készségfejlesztés

- **🌱 Kezdők**: Kezdj az 1. fejezettel (Alapok) → 2. fejezet (AI Fejlesztés)
- **🔧 Középhaladók**: 3-4. fejezetek (Konfiguráció és Infrastruktúra) → 6. fejezet (Érvényesítés)
- **🚀 Haladók**: 5. fejezet (Többügynökös Megoldások) → 7. fejezet (Hibakeresés)
- **🏢 Vállalati szint**: Az összes fejezet elvégzése, különös figyelemmel a 8. fejezetre (Produkciós Minták)

### Komplexitás Jelzők

- **⭐ Alap**: Egyedi koncepciók, irányított oktatóanyagok, 30-60 perc
- **⭐⭐ Középhaladó**: Több koncepció, gyakorlati feladatok, 1-2 óra  
- **⭐⭐⭐ Haladó**: Összetett architektúrák, egyedi megoldások, 1-3 óra
- **⭐⭐⭐⭐ Szakértő**: Produkciós rendszerek, vállalati minták, 2-4 óra

### Rugalmas Tanulási Útvonalak

#### 🎯 AI Fejlesztő Gyorsított Útvonal (4-6 óra)
1. **1. fejezet**: Alapok és Gyors Kezdés (45 perc)
2. **2. fejezet**: AI-első Fejlesztés (2 óra)  
3. **5. fejezet**: Többügynökös AI Megoldások (3 óra)
4. **8. fejezet**: Produkciós AI Legjobb Gyakorlatok (1 óra)

#### 🛠️ Infrastruktúra Szakértő Útvonal (5-7 óra)
1. **1. fejezet**: Alapok és Gyors Kezdés (45 perc)
2. **3. fejezet**: Konfiguráció és Hitelesítés (1 óra)
3. **4. fejezet**: Infrastruktúra mint Kód & Telepítés (1,5 óra)
4. **6. fejezet**: Előtelepítési Érvényesítés és Tervezés (1 óra)
5. **7. fejezet**: Hibakeresés és Hibajavítás (1,5 óra)
6. **8. fejezet**: Produkciós és Vállalati Minták (2 óra)

#### 🎓 Teljes Tanulási Út (8-12 óra)
Az összes 8 fejezet sorrendben történő elvégzése gyakorlati feladatokkal és érvényesítéssel

## Tanfolyam Teljesítési Keretrendszer

### Tudás Érvényesítése
- **Fejezet Ellenőrzőpontok**: Gyakorlati feladatok mérhető eredményekkel
- **Gyakorlati Ellenőrzés**: Működő megoldások telepítése minden fejezethez
- **Haladás Követése**: Vizualizált indikátorok és teljesítési jelvények
- **Közösségi Érvényesítés**: Tapasztalatok megosztása az Azure Discord csatornákon

### Tanulási Eredmények Értékelése

#### 1-2. fejezet Teljesítése (Alapok + AI)
- ✅ Egyszerű webalkalmazás telepítése AZD segítségével
- ✅ AI-alapú chat alkalmazás telepítése RAG használatával
- ✅ AZD alapfogalmak és AI integráció megértése

#### 3-4. fejezet Teljesítése (Konfiguráció + Infrastruktúra)  
- ✅ Több környezet telepítésének kezelése
- ✅ Egyedi Bicep infrastruktúra sablonok létrehozása
- ✅ Biztonságos hitelesítési minták megvalósítása

#### 5-6. fejezet Teljesítése (Többügynökös + Érvényesítés)
- ✅ Összetett többügynökös AI megoldás telepítése
- ✅ Kapacitástervezés és költségoptimalizálás végrehajtása
- ✅ Automatizált előtelepítési érvényesítés megvalósítása

#### 7-8. fejezet Teljesítése (Hibakeresés + Produkció)
- ✅ Telepítési problémák önálló hibakeresése és megoldása  
- ✅ Vállalati szintű monitoring és biztonság megvalósítása
- ✅ Produkciós kész alkalmazások telepítése irányítással

### Tanúsítvány és Elismerés
- **Tanfolyam Teljesítési Jelvény**: Az összes 8 fejezet gyakorlati érvényesítéssel történő elvégzése
- **Közösségi Elismerés**: Aktív részvétel az Azure AI Foundry Discord közösségben
- **Szakmai Fejlődés**: Iparágban releváns AZD és AI telepítési készségek
- **Karrier Előrelépés**: Vállalati szintű felhőtelepítési képességek

## 🎓 Átfogó Tanulási Eredmények

### Alap Szint (1-2. fejezet)
Az alap fejezetek elvégzése után a tanulók demonstrálják:

**Technikai Képességek:**
- Egyszerű webalkalmazások telepítése Azure-ra AZD parancsokkal
- AI-alapú chat alkalmazások konfigurálása és telepítése RAG funkciókkal
- AZD alapfogalmak megértése: sablonok, környezetek, provisioning munkafolyamatok
- Azure AI Foundry szolgáltatások integrálása AZD telepítésekkel
- Azure AI szolgáltatások konfigurációinak és API végpontjainak navigálása

**Szakmai Készségek:**
- Strukturált telepítési munkafolyamatok követése a konzisztens eredmények érdekében
- Alapvető telepítési problémák hibakeresése naplók és dokumentáció segítségével
- Hatékony kommunikáció a felhőtelepítési folyamatokról
- Legjobb gyakorlatok alkalmazása biztonságos AI szolgáltatási integrációhoz

**Tanulási Érvényesítés:**
- ✅ Sikeres telepítés `todo-nodejs-mongo` sablonnal
- ✅ `azure-search-openai-demo` telepítése és konfigurálása RAG funkcióval
- ✅ Interaktív workshop gyakorlatok elvégzése (Felfedezési fázis)
- ✅ Részvétel az Azure Discord közösségi beszélgetésekben

### Középhaladó Szint (3-4. fejezet)
A középhaladó fejezetek elvégzése után a tanulók demonstrálják:

**Technikai Képességek:**
- Több környezet telepítésének kezelése (fejlesztés, staging, produkció)
- Egyedi Bicep sablonok létrehozása infrastruktúra mint kódhoz
- Biztonságos hitelesítési minták megvalósítása kezelt identitással
- Összetett több szolgáltatásból álló alkalmazások telepítése egyedi konfigurációkkal
- Erőforrás provisioning stratégiák optimalizálása költség és teljesítmény szempontjából

**Szakmai Készségek:**
- Skálázható infrastruktúra architektúrák tervezése
- Biztonsági legjobb gyakorlatok megvalósítása felhőtelepítésekhez
- Infrastruktúra minták dokumentálása csapat együttműködéshez
- Megfelelő Azure szolgáltatások kiválasztása követelmények alapján

**Tanulási Érvényesítés:**
- ✅ Külön környezetek konfigurálása környezet-specifikus beállításokkal
- ✅ Egyedi Bicep sablon létrehozása és telepítése több szolgáltatásból álló alkalmazáshoz
- ✅ Kezelt identitás hitelesítés megvalósítása biztonságos hozzáféréshez
- ✅ Konfigurációkezelési gyakorlatok elvégzése valós forgatókönyvekkel

### Haladó Szint (5-6. fejezet)
A haladó fejezetek elvégzése után a tanulók demonstrálják:

**Technikai Képességek:**
- Többügynökös AI megoldások telepítése és koordinált munkafolyamatok irányítása
- Ügyfél és Készlet ügynök architektúrák megvalósítása kiskereskedelmi forgatókönyvekhez
- Átfogó kapacitástervezés és erőforrás érvényesítés végrehajtása
- Automatizált előtelepítési érvényesítés és optimalizálás végrehajtása
- Költséghatékony SKU kiválasztások tervezése munkaterhelési követelmények alapján

**Szakmai Készségek:**
- Összetett AI megoldások architektúrájának tervezése produkciós környezetekhez
- Technikai megbeszélések vezetése AI telepítési stratégiákról
- Junior fejlesztők mentorálása AZD és AI telepítési legjobb gyakorlatokban
- AI architektúra minták értékelése és ajánlása üzleti követelményekhez

**Tanulási Érvényesítés:**
- ✅ Teljes kiskereskedelmi többügynökös megoldás telepítése ARM sablonokkal
- ✅ Ügynök koordináció és munkafolyamat irányítás bemutatása
- ✅ Kapacitástervezési gyakorlatok elvégzése valós erőforrás korlátokkal
- ✅ Telepítési készenlét érvényesítése automatizált előellenőrzésekkel

### Szakértői Szint (7-8. fejezet)
A szakértői fejezetek elvégzése után a tanulók demonstrálják:

**Technikai Képességek:**
- Összetett telepítési problémák önálló diagnosztizálása és megoldása
- Vállalati szintű biztonsági minták és irányítási keretrendszerek megvalósítása
- Átfogó monitoring és riasztási stratégiák tervezése
- Produkciós telepítések optimalizálása skálázhatóság, költség és teljesítmény szempontjából
- CI/CD csővezetékek létrehozása megfelelő teszteléssel és érvényesítéssel

**Szakmai Készségek:**
- Vállalati felhő átalakítási kezdeményezések vezetése
- Szervezeti telepítési szabványok tervezése és megvalósítása
- Fejlesztői csapatok képzése haladó AZD gyakorlatokban
- Technikai döntéshozatal befolyásolása vállalati AI telepítésekhez

**Tanulási Érvényesítés:**
- ✅ Összetett több szolgáltatásból álló telepítési hibák megoldása
- ✅ Vállalati biztonsági minták megvalósítása megfelelőségi követelményekkel
- ✅ Produkciós monitoring tervezése és telepítése Application Insights segítségével
- ✅ Vállalati irányítási keretrendszer megvalósítása

## 🎯 Tanfolyam Teljesítési Tanúsítvány

### Haladás Követési Keretrendszer
Kövesd tanulási haladásodat strukturált ellenőrzőpontokon keresztül:

- [ ] **1. fejezet**: Alapok és Gyors Kezdés ✅
- [ ] **2. fejezet**: AI-első Fejlesztés ✅  
- [ ] **3. fejezet**: Konfiguráció és Hitelesítés ✅
- [ ] **4. fejezet**: Infrastruktúra mint Kód & Telepítés ✅
- [ ] **5. fejezet**: Többügynökös AI Megoldások ✅
- [ ] **6. fejezet**: Előtelepítési Érvényesítés és Tervezés ✅
- [ ] **7. fejezet**: Hibakeresés és Hibajavítás ✅
- [ ] **8. fejezet**: Produkciós és Vállalati Minták ✅

### Érvényesítési Folyamat
Minden fejezet elvégzése után érvényesítsd tudásodat:

1. **Gyakorlati Feladatok Teljesítése**: Működő megoldások telepítése minden fejezethez
2. **Tudás Értékelése**: GYIK szekciók áttekintése és önértékelések elvégzése
3. **Közösségi Részvétel**: Tapasztalatok megosztása és visszajelzés kérése az Azure Discordon
4. **Portfólió Fejlesztése**: Telepítések és tanulságok dokumentálása
5. **Társak Általi Értékelés**: Más tanulókkal való együttműködés összetett forgatókönyvekben

### Tanfolyam Teljesítési Előnyök
Az összes fejezet érvényesítésével történő elvégzése után a végzettek rendelkeznek:

**Technikai Szakértelem:**
- **Produkciós Tapasztalat**: Valós AI alkalmazások telepítése Azure környezetekbe
- **Szakmai Készségek**: Vállalati szintű telepítési és hibakeresési képességek  
- **Architektúra Tudás**: Többügynökös AI megoldások és összetett infrastruktúra minták
- **Hibakeresési Mesterség**: Telepítési és konfigurációs problémák önálló megoldása

**Szakmai Fejlődés:**
- **Iparági Elismerés**: Igazolható készségek a nagy keresletű AZD és AI telepítési területeken
- **Karrier Előrelépés**: Képesítések felhőarchitekt és AI telepítési szakértői szerepekhez
- **Közösségi Vezetés**: Aktív tagság az Azure fejlesztői és AI közösségekben
- **Folyamatos Tanulás**: Alap a haladó Azure AI Foundry specializációhoz

**Portfólió Eszközök:**
- **Telepített Megoldások**: Működő példák AI alkalmazásokra és infrastruktúra mintákra
- **Dokumentáció**: Átfogó telepítési útmutatók és hibakeresési eljárások  
- **Közösségi Hozzájárulások**: Megosztott példák és fejlesztések az Azure közösséggel
- **Szakmai Kapcsolatok**: Kapcsolatok Azure szakértőkkel és AI telepítési gyakorlókkal

### Tanfolyam Utáni Tanulási Útvonal
A végzettek felkészültek a haladó specializációra:
- **Azure AI Foundry Szakértő**: Mély specializáció AI modell telepítésben és irányításban
- **Felhőarchitektúra Vezetés**: Vállalati szintű telepítési tervezés és irányítás
- **Fejlesztői Közösségi Vezetés**: Hozzájárulás Azure mintákhoz és közösségi forrásokhoz
- **Vállalati Képzés**: AZD és AI tele

---

