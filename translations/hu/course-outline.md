# AZD Kezdőknek: Tanfolyami vázlat és tanulási keret

## Tanfolyam áttekintése

Sajátítsd el az Azure Developer CLI-t (azd) strukturált fejezeteken keresztül, amelyek előrehaladó tanulásra vannak tervezve. **Különös hangsúly az AI alkalmazások telepítésén a Microsoft Foundry integrációval.**

### Miért elengedhetetlen ez a tanfolyam a modern fejlesztők számára

Az AI munkaterhelések telepítésével foglalkozó fejlesztők gyakran útmutatásra szorulnak:
- Bonyolult, többszolgáltatásos AI architektúrákról
- AI termelési telepítési legjobb gyakorlatokról  
- Azure AI szolgáltatások integrációjáról és konfigurációjáról
- AI munkaterhelések költségoptimalizációjáról
- AI-specifikus telepítési hibák hibaelhárításáról

### Fő tanulási célok

A tanfolyam elvégzésével Ön:
- **Elsajátítja az AZD alapjait**: Alapfogalmak, telepítés és konfiguráció
- **AI alkalmazásokat telepít**: AZD használata Microsoft Foundry szolgáltatásokkal
- **Infrastruktúrát kód formájában valósít meg**: Azure-erőforrások kezelése Bicep sablonokkal
- **Hibaelhárítja a telepítéseket**: Gyakori problémák megoldása és hibakeresés
- **Optimalizálja a termelési környezetet**: Biztonság, skálázás, felügyelet és költséggazdálkodás
- **Többügynökös megoldásokat épít**: Komplex AI architektúrák telepítése

## 🎓 Műhelymunka tanulási élmény

### Rugalmas tanulási lehetőségek
Ez a tanfolyam támogatja az **önálló ütemezésű egyéni tanulást** és a **vezetett műhelymunkákat**, lehetővé téve a résztvevők számára, hogy gyakorlatban tanuljanak és interaktív gyakorlatokon keresztül fejlesszék készségeiket az AZD segítségével.

#### 🚀 Önálló tanulási mód
**Tökéletes egyéni fejlesztők számára és folyamatos tanuláshoz**

**Jellemzők:**
- **Böngészőalapú felület**: MkDocs alapú teljes műhelymunka elérhető bármely webböngészőből
- **GitHub Codespaces integráció**: Egy kattintásos fejlesztői környezet előre konfigurált eszközökkel
- **Interaktív DevContainer környezet**: Nincs szükség helyi beállításra – azonnal kezdheted a kódolást
- **Előrehaladás követése**: Beépített ellenőrzőpontok és validációs gyakorlatok
- **Közösségi támogatás**: Azure Discord csatornák a kérdésekhez és együttműködéshez

**Tanulási felépítés:**
- **Rugalmas időbeosztás**: Fejezetek saját tempóban, napok vagy hetek alatt elvégezhetők
- **Ellenőrző pont rendszer**: Tanulás validálása a haladóbb témakörök előtt
- **Erőforrás könyvtár**: Átfogó dokumentáció, példák és hibaelhárítási útmutatók
- **Portfólió fejlesztése**: Telepíthető projektek építése szakmai portfóliókhoz

**Kezdés (önálló):**
```bash
# Option 1: GitHub Codespaces (Recommended)
# Navigate to the repository and click "Code" → "Create codespace on main"

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow setup instructions in workshop/README.md
```

#### 🏛️ Vezetett műhelymunkák
**Ideális vállalati képzésekhez, bootcamp-ekhez és oktatási intézményeknek**

**Műhelymunka formátum lehetőségek:**

**📚 Akadémiai tanfolyam integráció (8-12 hét)**
- **Egyetemi programok**: Féléves kurzus heti 2 órás alkalmakban
- **Bootcamp formátum**: Intenzív 3-5 napos program napi 6-8 órás alkalmakban
- **Vállalati képzés**: Havi csapat alkalmak gyakorlati projektmegvalósítással
- **Értékelési keret**: Értékelt feladatok, páros értékelések és záróprojektek

**🚀 Intenzív műhely (1-3 nap)**
- **1. nap**: Alapok + AI fejlesztés (1-2. fejezet) - 6 óra
- **2. nap**: Konfiguráció + infrastruktúra (3-4. fejezet) - 6 óra  
- **3. nap**: Haladó minták + termelés (5-8. fejezet) - 8 óra
- **Követés**: Opcionális 2 hetes mentorálás a projekt befejezéséhez

**⚡ Vezetői tájékoztató (4-6 óra)**
- **Stratégiai áttekintés**: AZD értékajánlat és üzleti hatás (1 óra)
- **Gyakorlati bemutató**: AI alkalmazás végponttól végpontig (2 óra)
- **Architektúra áttekintés**: Vállalati minták és irányítás (1 óra)
- **Megvalósítási terv**: Szervezeti elfogadási stratégia (1-2 óra)

#### 🛠️ Műhelymunka tanulási módszertan
**Felfedezés → Telepítés → Testreszabás megközelítés a gyakorlati készségfejlesztéshez**

**1. szakasz: Felfedezés (45 perc)**
- **Sablon felfedezés**: Microsoft Foundry sablonok és szolgáltatások értékelése
- **Architektúra elemzés**: Többügynökös minták és telepítési stratégiák megértése
- **Követelményfelmérés**: Szervezeti igények és korlátok azonosítása
- **Környezet beállítása**: Fejlesztői környezet és Azure erőforrások konfigurálása

**2. szakasz: Telepítés (2 óra)**
- **Vezetett megvalósítás**: Lépésről lépésre AI alkalmazások telepítése AZD-vel
- **Szolgáltatás konfiguráció**: Azure AI szolgáltatások, végpontok és hitelesítés beállítása
- **Biztonsági megvalósítás**: Vállalati biztonsági minták és hozzáférésvezérlés alkalmazása
- **Validációs tesztelés**: Telepítések ellenőrzése és gyakori problémák megoldása

**3. szakasz: Testreszabás (45 perc)**
- **Alkalmazás módosítása**: Sablonok adaptálása speciális használati esetekhez és követelményekhez
- **Termelési optimalizáció**: Felügyelet, költséggazdálkodás és skálázási stratégiák bevezetése
- **Haladó minták**: Többügynökös koordináció és összetett architektúrák felfedezése
- **Következő lépések tervezése**: Tanulási útvonal meghatározása a további készségfejlesztéshez

#### 🎯 Műhelymunka tanulási eredmények
**Mérhető készségek gyakorlati tapasztalaton keresztül**

**Műszaki kompetenciák:**
- **Termelési AI alkalmazások telepítése**: AI-alapú megoldások sikeres telepítése és konfigurálása
- **Infrastruktúra mint kód mesteri szintű kezelés**: Egyedi Bicep sablonok létrehozása és kezelése
- **Többügynökös architektúra**: Koordinált AI ügynök megoldások megvalósítása
- **Termelési készség**: Biztonsági, felügyeleti és irányítási minták alkalmazása
- **Hibaelhárítási szakértelem**: Telepítési és konfigurációs problémák független megoldása

**Szakmai készségek:**
- **Projektvezetés**: Műszaki csapatok vezetése felhőalapú telepítési kezdeményezésekben
- **Architektúra tervezés**: Skálázható, költséghatékony Azure megoldások tervezése
- **Tudásátadás**: Kollégák oktatása és mentorálása az AZD legjobb gyakorlataiban
- **Stratégiai tervezés**: Szervezeti felhőbejutatási stratégiák alakítása

#### 📋 Műhelyeszközök és anyagok
**Átfogó eszköztár facilitátorok és tanulók számára**

**Facilitátoroknak:**
- **Oktató útmutató**: [Műhely átfogó összefoglalója](workshop/README.md) - Az alkalmak tervezése és vezetése
- **Prezentációs anyagok**: Diavetítések, architektúra diagramok és demo szkriptek
- **Értékelő eszközök**: Gyakorlati feladatok, tudásellenőrzések és értékelési kritériumok
- **Műszaki beállítás**: Környezet konfiguráció, hibaelhárítási útmutatók és mentési tervek

**Tanulóknak:**
- **Interaktív műhelyi környezet**: [Műhelyi anyagok](workshop/README.md) - Böngésző alapú tanulási platform
- **Lépésről lépésre útmutatók**: [Vezetett gyakorlatok](../../workshop/docs/instructions) - Részletes megvalósítási útmutatók  
- **Referencia dokumentáció**: [AI műhely labor](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI fókuszú mélyreható anyagok
- **Közösségi források**: Azure Discord csatornák, GitHub viták és szakértői támogatás

#### 🏢 Vállalati műhely megvalósítás
**Szervezeti telepítési és képzési stratégiák**

**Vállalati képzési programok:**
- **Fejlesztői beillesztés**: Új munkatársak orientációja az AZD alapjaival (2-4 hét)
- **Csapat fejlesztés**: Negyedéves műhelyek meglévő fejlesztői csapatoknak (1-2 nap)
- **Architektúra áttekintés**: Havi alkalmak vezető mérnököknek és tervezőknek (4 óra)
- **Vezetői tájékoztató**: Vezetői műhelyek műszaki döntéshozóknak (fél nap)

**Megvalósítási támogatás:**
- **Egyedi műhelytervezés**: Specifikus szervezeti igényekhez igazított tartalom
- **Pilot program menedzsment**: Strukturált bevezetés sikerességi mérőszámokkal és visszacsatolással  
- **Folyamatos mentorálás**: Műhely utáni támogatás a projektmegvalósításhoz
- **Közösségépítés**: Belső Azure AI fejlesztői közösségek és tudásmegosztás

**Sikerességi mutatók:**
- **Készségfejlődés**: Szakmai kompetenciák előtti és utáni értékelése
- **Telepítési sikeresség**: Résztvevők százaléka, aki sikeresen telepít éles alkalmazást
- **Produktivitási idő**: Új Azure AI projektek beillesztési idejének csökkenése
- **Tudásmegtartás**: 3-6 hónappal a műhely után végzett ellenőrzések

## 8 fejezetes tanulási struktúra

### 1. fejezet: Alapok és gyors kezdés (30-45 perc) 🌱
**Előfeltételek**: Azure előfizetés, alapvető parancssori ismeretek  
**Bonyolultság**: ⭐

#### Amit tanulni fogsz
- Az Azure Developer CLI alapjai
- AZD telepítése a platformodra  
- Az első sikeres telepítésed
- Alapfogalmak és szakszavak

#### Tanulási források
- [AZD alapok](docs/chapter-01-foundation/azd-basics.md) - Alapfogalmak
- [Telepítés és beállítás](docs/chapter-01-foundation/installation.md) - Platformspecifikus útmutatók
- [Az első projekted](docs/chapter-01-foundation/first-project.md) - Gyakorlati útmutató
- [Parancsok gyors referenciája](resources/cheat-sheet.md) - Gyors segédlet

#### Gyakorlati eredmény
Egy egyszerű webalkalmazás sikeres telepítése Azure-ra az AZD segítségével

---

### 2. fejezet: AI-First fejlesztés (1-2 óra) 🤖
**Előfeltételek**: 1. fejezet befejezése  
**Bonyolultság**: ⭐⭐

#### Amit tanulni fogsz
- Microsoft Foundry integráció az AZD-vel
- AI által vezérelt alkalmazások telepítése
- AI szolgáltatás konfigurációk megértése
- RAG (Retrieval-Augmented Generation) minták

#### Tanulási források
- [Microsoft Foundry integráció](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- [AI modell telepítése](docs/chapter-02-ai-development/ai-model-deployment.md)
- [AI műhely labor](docs/chapter-02-ai-development/ai-workshop-lab.md) - **ÚJ**: Átfogó 2-3 órás gyakorlati labor
- [Interaktív műhelyi útmutató](workshop/README.md) - **ÚJ**: MkDocs előnézettel böngészőalapú műhely
- [Microsoft Foundry sablonok](README.md#featured-microsoft-foundry-templates)
- [Műhelyi útmutatók](../../workshop/docs/instructions) - **ÚJ**: Lépésről lépésre vezetett gyakorlatok

#### Gyakorlati eredmény
Telepíts és konfigurálj AI-alapú chat alkalmazást RAG funkciókkal

#### Műhely munkamenet tanulási útvonal (opcionális bővítés)
**ÚJ interaktív élmény**: [Teljes műhelyi útmutató](workshop/README.md)
1. **Felfedezés** (30 perc): Sablon kiválasztás és értékelés
2. **Telepítés** (45 perc): AI sablon funkcióinak telepítése és validálása  
3. **Szétszedés** (30 perc): Sablon architektúra és elemek megértése
4. **Konfiguráció** (30 perc): Beállítások és paraméterek testreszabása
5. **Testreszabás** (45 perc): Sablon módosítása és iterálása a saját igényedre
6. **Leszerelés** (15 perc): Erőforrások törlése és életciklus megértése
7. **Lezárás** (15 perc): Következő lépések és haladó tanulási útvonalak

---

### 3. fejezet: Konfiguráció és hitelesítés (45-60 perc) ⚙️
**Előfeltételek**: 1. fejezet befejezése  
**Bonyolultság**: ⭐⭐

#### Amit tanulni fogsz
- Környezet konfiguráció és kezelése
- Hitelesítési és biztonsági legjobb gyakorlatok
- Erőforrás elnevezés és szervezés
- Többkörnyezetes telepítések

#### Tanulási források
- [Konfigurációs útmutató](docs/chapter-03-configuration/configuration.md) - Környezet beállítása
- [Hitelesítés és biztonsági minták](docs/chapter-03-configuration/authsecurity.md) - Kezelt identitás és Key Vault integráció
- Többkörnyezetes példák

#### Gyakorlati eredmény
Több környezet kezelése megfelelő hitelesítéssel és biztonsággal

---

### 4. fejezet: Infrastruktúra kódként és telepítés (1-1,5 óra) 🏗️
**Előfeltételek**: 1-3. fejezetek befejezése  
**Bonyolultság**: ⭐⭐⭐

#### Amit tanulni fogsz
- Haladó telepítési minták
- Infrastruktúra kódként Bicep használatával
- Erőforrás biztosítási stratégiák
- Egyedi sablonok létrehozása

- Konténeres alkalmazások telepítése Azure Container Apps és AZD segítségével

#### Tanulási források
- [Telepítési útmutató](docs/chapter-04-infrastructure/deployment-guide.md) - Teljes munkafolyamatok
- [Erőforrás biztosítás](docs/chapter-04-infrastructure/provisioning.md) - Erőforrás kezelés
- Konténer és mikroszolgáltatásos példák
- [Container App példák](examples/container-app/README.md) - Gyors kezdés, termelési és haladó telepítési minták

#### Gyakorlati eredmény
Komplex, többszolgáltatásos alkalmazások telepítése egyedi infrastruktúra sablonokkal

---

### 5. fejezet: Többügynökös AI megoldások (2-3 óra) 🤖🤖
**Előfeltételek**: 1-2. fejezetek befejezése  
**Bonyolultság**: ⭐⭐⭐⭐

#### Amit tanulni fogsz
- Többügynökös architektúra minták
- Ügynökök irányítása és koordinációja
- Termelési kész AI telepítések
- Ügyfél és készlet ügynök megvalósítások

- Konténerizált mikroszolgáltatások integrációja ügynök alapú megoldások részeként

#### Tanulási források
- [Kiskereskedelmi többügynökös megoldás](examples/retail-scenario.md) - Architektúra terv, nem végleges alkalmazás
- [ARM sablon csomag](../../examples/retail-multiagent-arm-template) - Infrastruktúra vázlat megvalósítási előfeltételekkel
- Többügynökös koordinációs minták
- [Mikroszolgáltatás architektúra példa](../../examples/container-app/microservices) - Szolgáltatás-szolgáltatás közötti kommunikáció, aszinkron üzenetküldés és termelési telepítés

#### Gyakorlati eredmény
Többügynökös AI megoldás tervezése és a megvalósításon, validáláson és működtetésen túlmutató infrastruktúra biztosítási munkák azonosítása

---

### 6. fejezet: Telepítés előtti validáció és tervezés (1 óra) 🔍
**Előfeltételek**: 4. fejezet befejezése  
**Bonyolultság**: ⭐⭐

#### Amit tanulni fogsz
- Kapacitástervezés és erőforrás validáció
- SKU kiválasztási stratégiák
- Előkészítő ellenőrzések és automatizálás
- Költségoptimalizációs tervezés

#### Tanulási források
- [Kapacitástervezés](docs/chapter-06-pre-deployment/capacity-planning.md) - Erőforrás validáció
- [SKU kiválasztás](docs/chapter-06-pre-deployment/sku-selection.md) - Költséghatékony választások
- [Előkészítő ellenőrzések](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatikus szkriptek
- [Application Insights integráció](docs/chapter-06-pre-deployment/application-insights.md) - Felügyelet és megfigyelhetőség
- [Többügynökös koordinációs minták](docs/chapter-06-pre-deployment/coordination-patterns.md) - Ügynök irányítási stratégiák

#### Gyakorlati eredmény
Validáld és optimalizáld a telepítéseket azok végrehajtása előtt

---

### 7. fejezet: Hibaelhárítás és hibakeresés (1-1,5 óra) 🔧
**Előfeltételek**: Bármely telepítési fejezet teljesítése  
**Bonyolultság**: ⭐⭐

#### Amit megtanulhatsz
- Szisztematikus hibakeresési megközelítések
- Gyakori problémák és megoldások
- AI-specifikus hibakeresés
- Teljesítményoptimalizálás

#### Tanulási források
- [Gyakori problémák](docs/chapter-07-troubleshooting/common-issues.md) - GYIK és megoldások
- [Hibakeresési útmutató](docs/chapter-07-troubleshooting/debugging.md) - Lépésről lépésre stratégiák
- [AI-specifikus hibakeresés](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI szolgáltatási problémák

#### Gyakorlati eredmény
Önállóan diagnosztizáld és oldd meg a gyakori telepítési problémákat

---

### 8. fejezet: Termelési és vállalati minták (2-3 óra) 🏢
**Előfeltételek**: 1-4. fejezet teljesítése  
**Bonyolultság**: ⭐⭐⭐⭐

#### Amit megtanulhatsz
- Termelési telepítési stratégiák
- Vállalati biztonsági minták
- Monitorozás és költségoptimalizálás
- Skálázhatóság és kormányzás

- Legjobb gyakorlatok termelési konténeralkalmazások telepítésére (biztonság, monitorozás, költség, CI/CD)

#### Tanulási források
- [Termelési AI legjobb gyakorlatok](docs/chapter-08-production/production-ai-practices.md) - Vállalati minták
- Mikroszolgáltatások és vállalati példák
- Monitorozási és kormányzási keretrendszerek
- [Mikroszolgáltatások architektúra példa](../../examples/container-app/microservices) - Kék-zöld/canary telepítés, elosztott nyomonkövetés és költségoptimalizálás

#### Gyakorlati eredmény
Vállalati kész alkalmazások telepítése teljes termelési képességekkel

---

## Tanulási előrehaladás és bonyolultság

### Fokozatos képességfejlesztés

- **🌱 Kezdők**: Kezdd az 1. fejezettel (Alapok) → 2. fejezet (AI fejlesztés)
- **🔧 Középhaladók**: 3-4. fejezet (Konfiguráció és infrastruktúra) → 6. fejezet (Ellenőrzés)
- **🚀 Haladók**: 5. fejezet (Többügynökös megoldások) → 7. fejezet (Hibakeresés)
- **🏢 Vállalati**: Minden fejezet teljesítése, különös tekintettel a 8. fejezetre (Termelési minták)

- **Konténeralkalmazás útvonal**: 4. fejezet (Konténeres telepítés), 5. fejezet (Mikroszolgáltatások integrációja), 8. fejezet (Termelési legjobb gyakorlatok)

### Bonyolultság jelzők

- **⭐ Alap**: Egyszerű fogalmak, irányított oktatóanyagok, 30-60 perc
- **⭐⭐ Középhaladó**: Több fogalom, gyakorlati feladatok, 1-2 óra  
- **⭐⭐⭐ Haladó**: Összetett architektúrák, egyedi megoldások, 1-3 óra
- **⭐⭐⭐⭐ Szakértő**: Termelési rendszerek, vállalati minták, 2-4 óra

### Rugalmas tanulási utak

#### 🎯 AI Fejlesztő Gyorsított Tanfolyam (4-6 óra)
1. **1. fejezet**: Alapok és gyors kezdés (45 perc)
2. **2. fejezet**: AI-első fejlesztés (2 óra)  
3. **5. fejezet**: Többügynökös AI megoldások (3 óra)
4. **8. fejezet**: Termelési AI legjobb gyakorlatok (1 óra)

#### 🛠️ Infrastruktúra szakértő útvonal (5-7 óra)
1. **1. fejezet**: Alapok és gyors kezdés (45 perc)
2. **3. fejezet**: Konfiguráció és hitelesítés (1 óra)
3. **4. fejezet**: Infrastruktúra kódként és telepítés (1,5 óra)
4. **6. fejezet**: Előtelepítési ellenőrzés és tervezés (1 óra)
5. **7. fejezet**: Hibakeresés és debugolás (1,5 óra)
6. **8. fejezet**: Termelési és vállalati minták (2 óra)

#### 🎓 Teljes tanulási út (8-12 óra)
Az összes 8 fejezet egymás utáni teljesítése gyakorlati gyakorlattal és ellenőrzéssel

## Tanfolyam teljesítési keretrendszer

### Tudásellenőrzés
- **Fejezeti mérföldkövek**: Gyakorlati feladatok mérhető eredményekkel
- **Gyakorlati ellenőrzés**: Működő megoldások telepítése minden fejezethez
- **Előrehaladás követése**: Vizualizált indikátorok és teljesítési jelvények
- **Közösségi ellenőrzés**: Tapasztalatok megosztása az Azure Discord csatornákon

### Tanulási eredmények értékelése

#### 1-2. fejezet teljesítése (Alapok + AI)
- ✅ Egyszerű webalkalmazás telepítése AZD-vel
- ✅ AI-alapú chatalkalmazás telepítése RAG-gal
- ✅ AZD alapfogalmak és AI integráció megértése

#### 3-4. fejezet teljesítése (Konfiguráció + infrastruktúra)  
- ✅ Több környezet telepítésének kezelése
- ✅ Egyedi Bicep infrastruktúratemplétek készítése
- ✅ Biztonságos hitelesítési minták megvalósítása

#### 5-6. fejezet teljesítése (Többügynök + ellenőrzés)
- ✅ Összetett többügynökös AI megoldás telepítése
- ✅ Kapacitástervezés és költségoptimalizálás végrehajtása
- ✅ Automatizált előtelepítési ellenőrzés implementálása

#### 7-8. fejezet teljesítése (Hibakeresés + termelés)
- ✅ Önálló hibakeresés és telepítési problémamegoldás  
- ✅ Vállalati szintű monitorozás és biztonság megvalósítása
- ✅ Termelésre kész alkalmazások telepítése kormányzással

### Tanúsítvány és elismerés
- **Tanfolyam Teljesítési Jelvény**: Az összes 8 fejezet gyakorlati ellenőrzéssel való teljesítése
- **Közösségi elismerés**: Aktív részvétel a Microsoft Foundry Discordban
- **Szakmai fejlődés**: Iparági relevanciájú AZD és AI telepítési készségek
- **Karrier előrelépés**: Vállalati készségű felhőalapú telepítési képességek

## 🎓 Átfogó tanulási eredmények

### Alapszint (1-2. fejezet)
Az alapokat bemutató fejezetek teljesítése után a tanulók képesek lesznek:

**Műszaki képességek:**
- Egyszerű webalkalmazások telepítése Azure-ra AZD parancsokkal
- AI-alapú chatalkalmazások konfigurálása és telepítése RAG funkciókkal
- AZD alapfogalmak megértése: sablonok, környezetek, szolgáltatásellátási munkafolyamatok
- Microsoft Foundry szolgáltatások integrálása AZD telepítésekkel
- Azure AI szolgáltatás konfigurációk és API végpontok használata

**Szakmai készségek:**
- Strukturált telepítési munkafolyamatok követése következetes eredményekért
- Alapvető telepítési problémák hibakeresése naplók és dokumentáció alapján
- Hatékony kommunikáció a felhőalapú telepítési folyamatokról
- Legjobb gyakorlatok alkalmazása az AI szolgáltatásbiztonság integrálásában

**Tanulás ellenőrzése:**
- ✅ Sikeres `todo-nodejs-mongo` sablon telepítés
- ✅ `azure-search-openai-demo` telepítése és konfigurálása RAG-gal
- ✅ Interaktív műhelygyakorlatok teljesítése (Felfedezési fázis)
- ✅ Részvétel az Azure Discord közösségi beszélgetéseken

### Középszint (3-4. fejezet)
Az középhaladó fejezetek teljesítése után a tanulók képesek lesznek:

**Műszaki képességek:**
- Több környezet telepítésének kezelése (fejlesztői, teszt és termelési)
- Egyedi Bicep sablonok létrehozása infrastruktúra kódként
- Biztonságos hitelesítési minták megvalósítása kezelt identitással
- Összetett többszolgáltatásos alkalmazások telepítése egyedi konfigurációkkal
- Erőforrásszolgáltatási stratégiák optimalizálása költség és teljesítmény szempontjából

**Szakmai készségek:**
- Skálázható infrastruktúra-architektúrák tervezése
- Biztonsági legjobb gyakorlatok megvalósítása felhőtelepítésekhez
- Infrastruktúra minták dokumentálása csapatmunkához
- Megfelelő Azure szolgáltatások kiválasztása a követelményekhez

**Tanulás ellenőrzése:**
- ✅ Elkülönített környezetek konfigurálása környezetspecifikus beállításokkal
- ✅ Egyedi Bicep sablon készítése és telepítése többszolgáltatásos alkalmazáshoz
- ✅ Kezelt identitás hitelesítés megvalósítása biztonságos hozzáféréshez
- ✅ Konfigurációkezelési gyakorlatok végrehajtása valós helyzetekkel

### Haladó szint (5-6. fejezet)
Az haladó fejezetek teljesítése után a tanulók képesek lesznek:

**Műszaki képességek:**
- Többügynökös AI megoldások telepítése és összehangolt munkafolyamatok irányítása
- Ügyfél- és készletügynök-architektúrák megvalósítása kiskereskedelmi helyzetekhez
- Átfogó kapacitástervezés és erőforrás-ellenőrzés végrehajtása
- Automatizált előtelepítési ellenőrzés és optimalizálás végrehajtása
- Költséghatékony SKU kiválasztás tervezése a munkaterhelés igényei alapján

**Szakmai készségek:**
- Összetett AI megoldások megtervezése termelési környezetekhez
- Műszaki megbeszélések vezetése AI telepítési stratégiákról
- Juniord fejlesztők mentorálása AZD és AI telepítési legjobb gyakorlatokban
- AI architektúra minták értékelése és ajánlása üzleti igényekhez

**Tanulás ellenőrzése:**
- ✅ Kiskereskedelmi többügynökös terv áttekintése és különbségtétel a biztosított infrastruktúra és a hiányzó alkalmazásimplementáció között
- ✅ Ügynök-összehangolás és munkafolyamat-orchestration bemutatása
- ✅ Kapacitástervezési gyakorlatok teljesítése valós erőforrás-korlátokkal
- ✅ Telepítési készenlét validálása automatizált előfutási ellenőrzésekkel

### Szakértői szint (7-8. fejezet)
Az szakértői fejezetek teljesítése után a tanulók képesek lesznek:

**Műszaki képességek:**
- Önállóan diagnosztizálni és megoldani összetett telepítési problémákat
- Vállalati szintű biztonsági minták és kormányzási keretrendszerek megvalósítása
- Átfogó monitorozási és riasztási stratégiák tervezése
- Termelési telepítések optimalizálása skálázhatóság, költség és teljesítmény szempontjából
- CI/CD folyamatok létrehozása megfelelő teszteléssel és validációval

**Szakmai készségek:**
- Vállalati felhőtranszformációs kezdeményezések vezetése
- Szervezeti telepítési szabványok tervezése és megvalósítása
- Fejlesztői csapatok képzése és mentorálása haladó AZD gyakorlatokban
- Műszaki döntéshozatal befolyásolása vállalati AI telepítéseknél

**Tanulás ellenőrzése:**
- ✅ Összetett többszolgáltatásos telepítési hibák megoldása
- ✅ Vállalati biztonsági minták megvalósítása megfelelőségi követelményekkel
- ✅ Termelési monitorozás tervezése és telepítése Application Insights segítségével
- ✅ Vállalati kormányzási keretrendszer implementálásának befejezése

## 🎯 Tanfolyam teljesítési tanúsítvány

### Előrehaladás követési keretrendszer
Kövesd tanulási előrehaladásodat a strukturált mérföldköveken keresztül:

- [ ] **1. fejezet**: Alapok és gyors kezdés ✅
- [ ] **2. fejezet**: AI-első fejlesztés ✅  
- [ ] **3. fejezet**: Konfiguráció és hitelesítés ✅
- [ ] **4. fejezet**: Infrastruktúra kódként és telepítés ✅
- [ ] **5. fejezet**: Többügynökös AI megoldások ✅
- [ ] **6. fejezet**: Előtelepítési ellenőrzés és tervezés ✅
- [ ] **7. fejezet**: Hibakeresés és debugolás ✅
- [ ] **8. fejezet**: Termelési és vállalati minták ✅

### Ellenőrzési folyamat
Minden fejezet teljesítése után ellenőrizd tudásodat:

1. **Gyakorlati feladat teljesítése**: Működő megoldások telepítése minden fejezethez
2. **Tudásfelmérés**: GYIK szekciók áttekintése és önellenőrzések elvégzése
3. **Közösségi részvétel**: Tapasztalatok megosztása és visszajelzés kérése az Azure Discordban
4. **Portfólió fejlesztés**: Telepítések és tanulságok dokumentálása
5. **Párhuzamos értékelés**: Együttműködés más tanulókkal összetett szituációkban

### Tanfolyam teljesítési előnyei
Az összes fejezet ellenőrzéssel történő teljesítése után a végzettek rendelkeznek:

**Műszaki szakértelem:**
- **Termelési tapasztalat**: Valós AI alkalmazások telepítése Azure környezetekre
- **Szakmai készségek**: Vállalati szintű telepítési és hibakezelési képességek  
- **Architektúra ismeretek**: Többügynökös AI megoldások és összetett infrastruktúra minták
- **Hibakeresési jártasság**: Önálló telepítési és konfigurációs problémamegoldás

**Szakmai fejlődés:**
- **Iparági elismerés**: Igazolható készségek nagy keresletű AZD és AI telepítési területeken
- **Karrier előrelépés**: Képesítések felhőarchitekt és AI telepítési szakértő szerepekhez
- **Közösségi vezetés**: Aktív tagság Azure fejlesztői és AI közösségekben
- **Folyamatos tanulás**: Alap a Microsoft Foundry haladó specializációhoz

**Portfólió elemek:**
- **Telepített megoldások**: Működő AI alkalmazások és infrastruktúra minták példái
- **Dokumentáció**: Átfogó telepítési útmutatók és hibakeresési eljárások  
- **Közösségi hozzájárulások**: Megbeszélések, példák és fejlesztések megosztása az Azure közösséggel
- **Szakmai hálózat**: Kapcsolatok Azure szakértőkkel és AI telepítési szakemberekkel

### Tanfolyam utáni tanulási út
A végzettek felkészültek haladó specializációkra:
- **Microsoft Foundry szakértő**: Mélyreható specializáció AI modell telepítésben és szervezésben
- **Felhőarchitektúra vezetés**: Vállalati méretű telepítési tervezés és kormányzás
- **Fejlesztői közösségi vezetés**: Hozzájárulás Azure mintákhoz és közösségi erőforrásokhoz
- **Vállalati képzés**: AZD és AI telepítési készségek oktatása szervezeti környezetben

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->