# AZD Kezdőknek: Tanfolyam áttekintés és tanulási keret

## Tanfolyam Áttekintés

Sajátítsd el az Azure Developer CLI (azd) használatát strukturált fejezeteken keresztül, amelyek fokozatos tanulásra lettek tervezve. **Különös hangsúly az AI alkalmazások telepítésén a Microsoft Foundry integrációval.**

### Miért fontos ez a tanfolyam a modern fejlesztők számára

Az AI munkaterhelések telepítésével foglalkozó fejlesztők gyakran igénylik a következő iránymutatásokat:
- Összetett, több szolgáltatásból álló AI architektúrák
- AI éles környezetbe telepítés legjobb gyakorlatai  
- Azure AI szolgáltatások integrációja és konfigurálása
- AI munkaterhelések költséghatékonyságának optimalizálása
- AI-specifikus telepítési problémák elhárítása

### Fő tanulási célok

A tanfolyam teljesítésével el fogod érni, hogy:
- **Mesteri szinten tudd az AZD alapjait**: Alapfogalmak, telepítés és konfiguráció
- **AI alkalmazásokat telepíts**: Használd az AZD-t Microsoft Foundry szolgáltatásokkal
- **Infrastruktúrát kód formájában valósíts meg**: Azure erőforrások kezelése Bicep sablonokkal
- **Hibakeresés a telepítéseknél**: Gyakori problémák megoldása és hibakeresés
- **Optimalizáld az éles környezetet**: Biztonság, skálázás, felügyelet és költségmenedzsment
- **Több-ügynökös megoldásokat építs**: Összetett AI architektúrák telepítése

## 🎓 Workshop tanulási élmény

### Rugalmas tanulási lehetőségek
A tanfolyam támogatja mind az **önálló, saját tempójú tanulást**, mind a **vezetett workshop üléseket**, így a résztvevők gyakorlatias képességeket szerezhetnek interaktív feladatokon keresztül az AZD használatával.

#### 🚀 Önálló tanulási mód
**Tökéletes egyéni fejlesztők és folyamatos tanulás számára**

**Jellemzők:**
- **Böngészőalapú felület**: Teljes értékű MkDocs által vezérelt workshop bármilyen webböngészőből elérhető
- **GitHub Codespaces integráció**: Egykattintásos fejlesztői környezet előre konfigurált eszközökkel
- **Interaktív DevContainer környezet**: Nincs szükség helyi beállításra - azonnal kezdheted a kódolást
- **Előrehaladás követése**: Beépített ellenőrzőpontok és érvényesítő gyakorlatok
- **Közösségi támogatás**: Hozzáférés az Azure Discord csatornákhoz kérdések és együttműködés céljából

**Tanulási struktúra:**
- **Rugalmas időbeosztás**: Teljesítsd a fejezeteket saját tempódban napok vagy hetek alatt
- **Ellenőrző rendszer**: Tanulás validálása a bonyolultabb témák felé haladva
- **Erőforrás könyvtár**: Átfogó dokumentáció, példák és problémamegoldó útmutatók
- **Portfólió fejlesztés**: Készíts telepíthető projekteket szakmai portfóliódhoz

**Kezdés (önálló):**
```bash
# Option 1: GitHub Codespaces (Recommended)
# Navigate to the repository and click "Code" → "Create codespace on main"

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow setup instructions in workshop/README.md
```

#### 🏛️ Vezetett workshop ülések
**Ideális vállalati képzéshez, bootcamp-ekhez és oktatási intézményeknek**

**Workshop formátum opciók:**

**📚 Akadémiai tanfolyam integráció (8-12 hét)**
- **Egyetemi programok**: Féléves tanfolyam heti 2 órás alkalmakban
- **Bootcamp formátum**: Intenzív 3-5 napos program napi 6-8 órás ülésekkel
- **Vállalati képzés**: Havi csapatülések gyakorlati projektek megvalósításával
- **Értékelési keretrendszer**: Értékelt feladatok, társértékelések és záróprojektek

**🚀 Intenzív workshop (1-3 nap)**
- **1. nap**: Alapok + AI fejlesztés (1-2. fejezet) - 6 óra
- **2. nap**: Konfiguráció + Infrastruktúra (3-4. fejezet) - 6 óra  
- **3. nap**: Haladó minták + Éles környezet (5-8. fejezet) - 8 óra
- **Utánkövetés**: Opcionális 2 hetes mentorálás a projekt lezárásához

**⚡ Vezetői összefoglaló (4-6 óra)**
- **Stratégiai áttekintés**: AZD értékajánlat és üzleti hatás (1 óra)
- **Gyakorlati demó**: AI alkalmazás teljes körű telepítése (2 óra)
- **Architektúra áttekintés**: Vállalati minták és irányítás (1 óra)
- **Megvalósítási terv**: Szervezeti bevezetési stratégia (1-2 óra)

#### 🛠️ Workshop tanulási módszertan
**Felfedezés → Telepítés → Testreszabás megközelítés gyakorlati képességfejlesztéshez**

**1. fázis: Felfedezés (45 perc)**
- **Sablonok felfedezése**: Microsoft Foundry sablonok és szolgáltatások értékelése
- **Architektúra elemzés**: Több-ügynökös minták és telepítési stratégiák megértése
- **Követelmény felmérés**: Szervezeti igények és korlátok azonosítása
- **Környezet beállítás**: Fejlesztői környezet és Azure erőforrások konfigurálása

**2. fázis: Telepítés (2 óra)**
- **Vezetett megvalósítás**: Lépésről lépésre AI alkalmazások telepítése AZD-vel
- **Szolgáltatás konfiguráció**: Azure AI szolgáltatások, végpontok és hitelesítés beállítása
- **Biztonsági megvalósítás**: Vállalati biztonsági minták és hozzáférés-vezérlés alkalmazása
- **Érvényesítő tesztelés**: Telepítések ellenőrzése és gyakori hibák elhárítása

**3. fázis: Testreszabás (45 perc)**
- **Alkalmazás módosítás**: Sablonok adaptálása specifikus esetekhez és követelményekhez
- **Éles környezet optimalizálás**: Felügyelet, költségmenedzsment és skálázás megvalósítása
- **Haladó minták**: Több-ügynökös koordináció és összetett architektúrák feltérképezése
- **További lépések tervezése**: Tanulási útvonal meghatározása a folyamatos fejlődéshez

#### 🎯 Workshop tanulási eredmények
**Mérhető képességek gyakorlati tapasztalaton keresztül**

**Technikai kompetenciák:**
- **Éles AI alkalmazások telepítése**: AI-alapú megoldások sikeres telepítése és konfigurálása
- **Infrastruktúra mint kód mesteri szintű kezelése**: Egyedi Bicep sablonok készítése és kezelése
- **Több-ügynökös architektúra**: Koordinált AI-ügynök megoldások megvalósítása
- **Éles környezetre való felkészülés**: Biztonsági, felügyeleti és irányítási minták alkalmazása
- **Hibakeresési szakértelem**: Telepítési és konfigurációs problémák önálló megoldása

**Szakmai készségek:**
- **Projektvezetés**: Műszaki csapatok vezetése felhőalapú telepítési kezdeményezésekben
- **Architektúra tervezés**: Skálázható, költséghatékony Azure megoldások tervezése
- **Tudás átadás**: Kollégák oktatása és mentorálása az AZD legjobb gyakorlatairól
- **Stratégiai tervezés**: Szervezeti felhőbevezetési stratégiák befolyásolása

#### 📋 Workshop anyagok és források
**Átfogó eszköztár oktatóknak és tanulóknak**

**Oktatók számára:**
- **Oktatói útmutató**: [Workshop áttekintés](workshop/README.md) - Ülés tervezés és lebonyolítás
- **Prezentációs anyagok**: Diák, architektúra diagramok, demó szkriptek
- **Értékelő eszközök**: Gyakorlati feladatok, tudásellenőrzések, értékelési rubrikák
- **Technikai beállítás**: Környezet konfiguráció, problémamegoldó útmutatók, biztonsági tervek

**Tanulók számára:**
- **Interaktív workshop környezet**: [Workshop anyagok](workshop/README.md) - Böngészőalapú tanulási platform
- **Lépésről lépésre útmutatók**: [Vezetett gyakorlatok](../../workshop/docs/instructions) - Részletes megvalósítási útmutatók  
- **Referencia dokumentáció**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI fókuszú mélyreható anyagok
- **Közösségi források**: Azure Discord csatornák, GitHub viták, szakértői támogatás

#### 🏢 Vállalati workshop megvalósítás
**Szervezeti telepítési és képzési stratégiák**

**Vállalati képzési programok:**
- **Fejlesztői betanítás**: Új alkalmazottak orientációja AZD alapokkal (2-4 hét)
- **Csapatfejlesztés**: Negyedéves workshopok a meglévő fejlesztői csoportoknak (1-2 nap)
- **Architektúra áttekintés**: Havi alkalmak vezető mérnököknek és tervezőknek (4 óra)
- **Vezetői tájékoztatók**: Vezetői workshopok műszaki döntéshozók számára (fél nap)

**Megvalósítástámogatás:**
- **Egyedi workshop tervezés**: Testreszabott tartalom speciális szervezeti igényekhez
- **Pilótaprogram menedzsment**: Strukturált bevezetés sikerességi mutatókkal és visszacsatolással  
- **Folyamatos mentorálás**: Workshop utáni támogatás projektmegvalósításhoz
- **Közösségépítés**: Belső Azure AI fejlesztői közösségek és tudásmegosztás

**Sikerességi mutatók:**
- **Képesség megszerzés**: Elő- és utóértékelések a technikai kompetencia fejlődés mérésére
- **Telepítési sikeresség**: Résztvevők százalékos aránya, akik sikeresen telepítettek éles alkalmazásokat
- **Produktivitási idő**: Új Azure AI projektek betanítási idejének csökkentése
- **Tudásmegtartás**: Utóértékelések 3-6 hónappal a workshop után

## 8 fejezetes tanulási struktúra

### 1. fejezet: Alapok és gyors kezdés (30-45 perc) 🌱
**Előfeltételek**: Azure előfizetés, alapvető parancssori ismeretek  
**Bonyolultság**: ⭐

#### Amit megtanulsz
- Az Azure Developer CLI alapfogalmainak megértése
- AZD telepítése a platformodra  
- Az első sikeres telepítésed
- Alapvető fogalmak és terminológia

#### Tanulási anyagok
- [AZD alapok](docs/chapter-01-foundation/azd-basics.md) - Alapfogalmak
- [Telepítés és beállítás](docs/chapter-01-foundation/installation.md) - Platform specifikus útmutatók
- [Az első projekted](docs/chapter-01-foundation/first-project.md) - Gyakorlati bemutató
- [Parancsgyorsító](resources/cheat-sheet.md) - Gyors referencia

#### Gyakorlati eredmény
Sikeresen telepítesz egy egyszerű webalkalmazást Azure-ra az AZD használatával

---

### 2. fejezet: AI-első fejlesztés (4-5 óra, beleértve a workshopot) 🤖
**Előfeltételek**: 1. fejezet teljesítve  
**Bonyolultság**: ⭐⭐

#### Amit megtanulsz
- Microsoft Foundry integráció AZD-vel
- GA `microsoft.foundry` csomag telepítése és hosted-agent kód telepítése
- Lokális Agent Inspector tesztelés és külön értékelő adathalmazok/rubrikák
- AI-alapú alkalmazások telepítése
- AI szolgáltatás konfigurációk megértése
- RAG (Retrieval-Augmented Generation) minták

#### Tanulási anyagok
- [Microsoft Foundry integráció](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- [Hosted-Agent bemutató (GA)](docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) - Inicializálás, az `azure.yaml` áttekintése, szolgáltatás előkészítése, helyi tesztelés, telepítés, értékelés és takarítás
- [AI ügynökök útmutatója](docs/chapter-02-ai-development/agents.md)
- [AI modell telepítés](docs/chapter-02-ai-development/ai-model-deployment.md)
- [AI workshop labor](docs/chapter-02-ai-development/ai-workshop-lab.md) - **ÚJ**: Átfogó 2-3 órás gyakorlati labor
- [Interaktív workshop útmutató](workshop/README.md) - **ÚJ**: Böngészőalapú workshop MkDocs előnézettel
- [Microsoft Foundry sablonok](README.md#featured-microsoft-foundry-templates)
- [Workshop utasítások](../../workshop/docs/instructions) - **ÚJ**: Lépésenként vezetett gyakorlatok

#### Gyakorlati eredmény
Helyileg tesztelsz egy hosted-agent-et és Foundry-ban a GA csomaggal, áttekinted egy értékelés eredményét, valamint elkülöníted az új és újrahasznált projektek takarítását. A külön RAG/workshop útvonal egy AI-alapú chat alkalmazás konfigurációját fedi le.

#### Workshop tanulási útvonal (opcionális bővítés)
**ÚJ interaktív élmény**: [Teljes workshop útmutató](workshop/README.md)
1. **Felfedezés** (30 perc): Sablon kiválasztás és értékelés
2. **Telepítés** (45 perc): AI sablon funkcionalitás telepítése és validálása  
3. **Elemzés** (30 perc): Sablon architektúra és alkotóelemek megértése
4. **Konfiguráció** (30 perc): Beállítások és paraméterek testreszabása
5. **Testreszabás** (45 perc): Módosítás és iteráció, hogy saját legyen
6. **Leállítás** (15 perc): Erőforrások tisztítása és életciklus megértése
7. **Összegzés** (15 perc): Következő lépések és haladó tanulási utak

---

### 3. fejezet: Konfiguráció és hitelesítés (45-60 perc) ⚙️
**Előfeltételek**: 1. fejezet teljesítve  
**Bonyolultság**: ⭐⭐

#### Amit megtanulsz
- Környezet konfiguráció és kezelése
- Hitelesítés és biztonsági legjobb gyakorlatok
- Erőforrás elnevezés és szervezés
- Több környezetes telepítések

#### Tanulási anyagok
- [Konfigurációs útmutató](docs/chapter-03-configuration/configuration.md) - Környezet beállítása
- [Hitelesítés és biztonsági minták](docs/chapter-03-configuration/authsecurity.md) - Kezelt identitás és Key Vault integráció
- Több környezetes példák

#### Gyakorlati eredmény
Több környezet kezelése megfelelő hitelesítéssel és biztonsággal

---

### 4. fejezet: Infrastruktúra mint kód és telepítés (1-1,5 óra) 🏗️
**Előfeltételek**: 1-3. fejezetek teljesítve  
**Bonyolultság**: ⭐⭐⭐

#### Amit megtanulsz
- Haladó telepítési minták
- Infrastruktúra mint kód Bicep segítségével
- Erőforrás előkészítési stratégiák
- Egyedi sablonkészítés

- Konténeres alkalmazás telepítése Azure Container Apps és AZD használatával

#### Tanulási anyagok
- [Telepítési útmutató](docs/chapter-04-infrastructure/deployment-guide.md) - Teljes munkafolyamatok
- [Erőforrások előkészítése](docs/chapter-04-infrastructure/provisioning.md) - Erőforrás kezelés
- Konténeres és mikroszolgáltatás példák
- [Container App példák](examples/container-app/README.md) - Gyors kezdés, éles környezet és haladó telepítési minták

#### Gyakorlati eredmény
Összetett több szolgáltatásos alkalmazások telepítése egyedi infrastruktúra sablonokkal

---

### 5. fejezet: Több-ügynökös AI megoldások (2-3 óra) 🤖🤖
**Előfeltételek**: 1-2. fejezetek teljesítve  
**Bonyolultság**: ⭐⭐⭐⭐

#### Amit megtanulsz
- Több-ügynökös architektúra minták
- Ügynökök összehangolása és koordinációja
- Éles környezetre kész AI telepítések
- Ügyfél és készlet ügynök megvalósítások

- Konténeres mikroszolgáltatások integrálása ügynök-alapú megoldások részeként

#### Tanulási anyagok
- [Kiskereskedelmi több-ügynökös megoldás](examples/retail-scenario.md) - Architektúra terv, nem teljes alkalmazás
- [ARM sablon csomag](../../examples/retail-multiagent-arm-template) - Infrastruktúra alap, megvalósítási előfeltételekkel
- Több-ügynökös koordinációs minták
- [Mikroszolgáltatás architektúra példa](../../examples/container-app/microservices) - Szolgáltatás közti kommunikáció, aszinkron üzenetküldés és éles telepítés

#### Gyakorlati eredmény
Tervez egy több-ügynökös AI megoldást és azonosítja a megvalósításhoz, validáláshoz és üzemeltetéshez szükséges munkát az infrastruktúra előkészítésen túl

---

### 6. fejezet: Telepítés előtti validáció és tervezés (1 óra) 🔍
**Előfeltételek**: 4. fejezet teljesítve  
**Bonyolultság**: ⭐⭐

#### Amit megtanulsz
- Kapacitástervezés és erőforrás validáció
- SKU kiválasztási stratégiák
- Elő-ellenőrzések és automatizálás
- Költségoptimalizálási tervezés

#### Tanulási anyagok
- [Kapacitástervezés](docs/chapter-06-pre-deployment/capacity-planning.md) - Erőforrás validáció
- [SKU kiválasztás](docs/chapter-06-pre-deployment/sku-selection.md) - Költséghatékony választások
- [Repülés előtti ellenőrzések](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatizált szkriptek
- [Alkalmazás Insights integráció](docs/chapter-06-pre-deployment/application-insights.md) - Monitorozás és megfigyelhetőség
- [Többügynökös koordinációs minták](docs/chapter-06-pre-deployment/coordination-patterns.md) - Ügynök összehangolási stratégiák

#### Gyakorlati eredmény
Validáld és optimalizáld a telepítéseket végrehajtás előtt

---

### 7. fejezet: Hibakeresés és hibajavítás (1-1,5 óra) 🔧
**Előfeltételek**: Bármely telepítési fejezet elvégzése  
**Bonyolultság**: ⭐⭐

#### Amit megtanulsz
- Szisztematikus hibakeresési megközelítések
- Gyakori problémák és megoldások
- AI-specifikus hibakeresés
- Teljesítményoptimalizálás

#### Tanulási források
- [Gyakori problémák](docs/chapter-07-troubleshooting/common-issues.md) - GYIK és megoldások
- [Hibakeresési útmutató](docs/chapter-07-troubleshooting/debugging.md) - Lépésről lépésre stratégiák
- [AI-specifikus hibajavítás](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI szolgáltatási problémák

#### Gyakorlati eredmény
Önállóan diagnosztizáld és oldd meg a gyakori telepítési problémákat

---

### 8. fejezet: Üzemeltetési és vállalati minták (2-3 óra) 🏢
**Előfeltételek**: 1-4. fejezetek elvégzése  
**Bonyolultság**: ⭐⭐⭐⭐

#### Amit megtanulsz
- Üzemi telepítési stratégiák
- Vállalati biztonsági minták
- Monitorozás és költségoptimalizálás
- Skálázhatóság és irányítás

- Legjobb gyakorlatok konténeralkalmazások üzembe helyezéséhez (biztonság, monitorozás, költség, CI/CD)

#### Tanulási források
- [Üzemi AI legjobb gyakorlatok](docs/chapter-08-production/production-ai-practices.md) - Vállalati minták
- Mikroszervizek és vállalati példák
- Monitorozási és irányítási keretrendszerek
- [Mikroszerviz architektúra példa](../../examples/container-app/microservices) - Kék-zöld/canary telepítés, elosztott nyomon követés és költségoptimalizálás

#### Gyakorlati eredmény
Üzemkész vállalati alkalmazások telepítése teljes termelési képességekkel

---

## Tanulási előrehaladás és bonyolultság

### Fokozatos készségfejlesztés

- **🌱 Kezdők**: Kezdjék az 1. fejezettel (Alapok) → 2. fejezettel (AI fejlesztés)
- **🔧 Középhaladó**: 3-4. fejezetek (Konfiguráció és infrastruktúra) → 6. fejezet (Validálás)
- **🚀 Haladó**: 5. fejezet (Többügynökös megoldások) → 7. fejezet (Hibakeresés)
- **🏢 Vállalati**: Az összes fejezet elvégzése, fókusz a 8. fejezetre (Üzemeltetési minták)

- **Konténer alkalmazás út**: 4. fejezet (Konténerizált telepítés), 5. fejezet (Mikroszerviz integráció), 8. fejezet (Üzemi legjobb gyakorlatok)

### Bonyolultság jelzők

- **⭐ Alap**: Egyszerű fogalmak, vezetett oktatóanyagok, 30-60 perc
- **⭐⭐ Középhaladó**: Több fogalom, gyakorlati feladatok, 1-2 óra  
- **⭐⭐⭐ Haladó**: Összetett architektúrák, egyedi megoldások, 1-3 óra
- **⭐⭐⭐⭐ Szakértő**: Üzemi rendszerek, vállalati minták, 2-4 óra

### Rugalmas tanulási utak

#### 🎯 AI fejlesztő gyorsított út (4-6 óra)
1. **1. fejezet**: Alapok és gyors kezdés (45 perc)
2. **2. fejezet**: AI-központú fejlesztés (2 óra)  
3. **5. fejezet**: Többügynökös AI megoldások (3 óra)
4. **8. fejezet**: Üzemi AI legjobb gyakorlatok (1 óra)

#### 🛠️ Infrastruktúra szakértő út (5-7 óra)
1. **1. fejezet**: Alapok és gyors kezdés (45 perc)
2. **3. fejezet**: Konfiguráció és hitelesítés (1 óra)
3. **4. fejezet**: Infrastruktúra kód formájában & telepítés (1,5 óra)
4. **6. fejezet**: Telepítés előtti validálás és tervezés (1 óra)
5. **7. fejezet**: Hibakeresés és hibajavítás (1,5 óra)
6. **8. fejezet**: Üzemeltetési és vállalati minták (2 óra)

#### 🎓 Teljes tanulási út (8-12 óra)
Az összes 8 fejezet egymás utáni elvégzése gyakorlati feladatokkal és validálással

## Tanfolyam teljesítési keretrendszer

### Tudásvalidáció
- **Fejezeti ellenőrzőpontok**: Gyakorlati feladatok mérhető eredményekkel
- **Gyakorlati ellenőrzés**: Működő megoldások telepítése minden fejezethez
- **Előrehaladás nyomon követése**: Vizualizált mutatók és befejezési jelvények
- **Közösségi validáció**: Tapasztalatok megosztása az Azure Discord csatornákon

### Tanulási eredmények értékelése

#### 1-2. fejezet befejezése (Alapok + AI)
- ✅ Alap webalkalmazás telepítése AZD használatával
- ✅ AI-alapú csevegőalkalmazás telepítése RAG-gal
- ✅ AZD alapfogalmak és AI integráció megértése

#### 3-4. fejezet befejezése (Konfiguráció + Infrastruktúra)  
- ✅ Több környezetű telepítések kezelése
- ✅ Egyedi Bicep infrastruktúra sablonok készítése
- ✅ Biztonságos hitelesítési minták implementálása

#### 5-6. fejezet befejezése (Többügynök + Validálás)
- ✅ Összetett többügynökös AI megoldás telepítése
- ✅ Kapacitástervezés és költségoptimalizálás végrehajtása
- ✅ Automatizált telepítés előtti validálás

#### 7-8. fejezet befejezése (Hibakeresés + Üzemeltetés)
- ✅ Hibák önálló hibakeresése és megoldása  
- ✅ Vállalati szintű monitorozás és biztonság implementálása
- ✅ Üzemkész alkalmazások telepítése irányítással

### Tanúsítás és elismerés
- **Tanfolyam befejezési jelvény**: Az összes 8 fejezet gyakorlati validálással történő teljesítése
- **Közösségi elismerés**: Aktív részvétel a Microsoft Foundry Discord közösségben
- **Szakmai fejlődés**: Iparág-specifikus AZD és AI telepítési képességek
- **Karrier előrelépés**: Vállalati szintű felhőalapú telepítési képességek

## 🎓 Átfogó tanulási eredmények

### Alap szint (1-2. fejezet)
Az alapozó fejezetek elvégzése után a tanulók képesek lesznek:

**Műszaki képességek:**
- Egyszerű webalkalmazások telepítése Azure-ra AZD parancsokkal
- AI-alapú csevegőalkalmazások konfigurálása és telepítése RAG funkciókkal
- AZD alapkoncepciók megértése: sablonok, környezetek, előállítási munkafolyamatok
- Microsoft Foundry szolgáltatások integrálása AZD telepítésekbe
- Azure AI szolgáltatások konfigurációinak és API végpontjainak kezelése

**Szakmai készségek:**
- Strukturált telepítési munkafolyamatok követése egységes eredményekért
- Alapvető telepítési hibák hibaelhárítása naplók és dokumentáció alapján
- Hatékony kommunikáció a felhő telepítési folyamatokról
- Legjobb gyakorlatok alkalmazása az AI szolgáltatás biztonságos integrációjához

**Tanulás igazolása:**
- ✅ Sikeres telepítés `todo-nodejs-mongo` sablonnal
- ✅ RAG-gal konfigurált `azure-search-openai-demo` telepítése
- ✅ Interaktív workshop gyakorlatok teljesítése (Felfedezési fázis)
- ✅ Részvétel az Azure Discord közösségi beszélgetésekben

### Középhaladó szint (3-4. fejezet)
Az középhaladó fejezetek elvégzése után a tanulók képesek lesznek:

**Műszaki képességek:**
- Több környezet telepítésének kezelése (fejlesztés, tesztelés, éles)
- Egyedi Bicep sablonok készítése infrastruktúra kód formájában
- Biztonságos hitelesítési minták alkalmazása kezelt identitással
- Összetett több szolgáltatásos alkalmazások telepítése egyedi konfigurációkkal
- Erőforrás előállítási stratégiák optimalizálása költség és teljesítmény szerint

**Szakmai készségek:**
- Skálázható infrastruktúra architektúrák tervezése
- Biztonsági legjobb gyakorlatok alkalmazása felhő telepítésekhez
- Infrastruktúra minták dokumentálása csapatmunkához
- Megfelelő Azure szolgáltatások értékelése és kiválasztása igényekhez

**Tanulás igazolása:**
- ✅ Környezetek konfigurálása környezetspecifikus beállításokkal
- ✅ Egyedi Bicep sablon készítése és telepítése több szolgáltatásos alkalmazáshoz
- ✅ Kezelt identitás hitelesítés megvalósítása biztonságos hozzáféréshez
- ✅ Konfigurációs menedzsment gyakorlatok teljesítése valós helyzeteken

### Haladó szint (5-6. fejezet)
Az haladó fejezetek elvégzése után a tanulók képesek lesznek:

**Műszaki képességek:**
- Többügynökös AI megoldások telepítése és összehangolása munkafolyamatokkal
- Ügyfél- és készletügyintéző ügynök architektúrák megvalósítása kiskereskedelmi helyzetekhez
- Átfogó kapacitástervezés és erőforrás validálás végrehajtása
- Automatizált telepítés előtti validálás és optimalizálás végrehajtása
- Költséghatékony SKU választások tervezése a munkaterhelés alapján

**Szakmai készségek:**
- Összetett AI megoldások tervezése termelési környezetekhez
- Műszaki megbeszélések vezetése az AI telepítési stratégiákról
- Junior fejlesztők mentorálása AZD és AI telepítési legjobb gyakorlatokban
- AI architektúra minták értékelése és ajánlása üzleti igényeknek megfelelően

**Tanulás igazolása:**
- ✅ A kiskereskedelmi többügynökös terv áttekintése, az előállított infrastruktúra és hiányzó alkalmazási megvalósítás elkülönítése
- ✅ Ügynök koordináció és munkafolyamat összehangolás bemutatása
- ✅ Kapacitástervezési gyakorlatok teljesítése valós erőforrás-korlátokkal
- ✅ Telepítés előtti készenlét validálása automatizált repülés előtti ellenőrzésekkel

### Szakértői szint (7-8. fejezet)
Az szakértői fejezetek elvégzése után a tanulók képesek lesznek:

**Műszaki képességek:**
- Összetett telepítési problémák diagnosztizálása és önálló megoldása
- Vállalati szintű biztonsági minták és kormányzási keretrendszerek implementálása
- Átfogó monitorozási és figyelmeztetési stratégiák tervezése
- Üzemi telepítések optimalizálása skálázhatóság, költség és teljesítmény szempontjából
- CI/CD csővezetékek kialakítása megfelelő teszteléssel és validálással

**Szakmai készségek:**
- Vállalati felhőtranszformációs kezdeményezések vezetése
- Szervezeti telepítési szabványok tervezése és implementálása
- Fejlesztői csapatok oktatása és mentorálása haladó AZD gyakorlatokra
- Műszaki döntéshozatal befolyásolása vállalati AI telepítések terén

**Tanulás igazolása:**
- ✅ Összetett több szolgáltatásos telepítési hibák elhárítása
- ✅ Vállalati biztonsági minták végrehajtása megfelelőségi követelményekkel
- ✅ Üzemi monitorozás tervezése és telepítése Application Insights segítségével
- ✅ Vállalati irányítási keretrendszer teljes körű implementálása

## 🎯 Tanfolyam befejezési tanúsítvány

### Előrehaladás követési keretrendszer
Kövesd tanulási előrehaladásodat strukturált ellenőrzőpontokon keresztül:

- [ ] **1. fejezet**: Alapok és gyors kezdés ✅
- [ ] **2. fejezet**: AI-központú fejlesztés ✅  
- [ ] **3. fejezet**: Konfiguráció és hitelesítés ✅
- [ ] **4. fejezet**: Infrastruktúra kód formájában és telepítés ✅
- [ ] **5. fejezet**: Többügynökös AI megoldások ✅
- [ ] **6. fejezet**: Telepítés előtti validálás és tervezés ✅
- [ ] **7. fejezet**: Hibakeresés és hibajavítás ✅
- [ ] **8. fejezet**: Üzemeltetési és vállalati minták ✅

### Ellenőrzési folyamat
Minden fejezet befejezése után ellenőrizd tudásod a következő módokon:

1. **Gyakorlati feladatok teljesítése**: Működő megoldások telepítése minden fejezethez
2. **Tudás értékelése**: GYIK szakaszok áttekintése és önértékelések elvégzése
3. **Közösségi részvétel**: Tapasztalatok megosztása és visszajelzés kérés az Azure Discordon
4. **Portfólió fejlesztése**: Telepítések és tapasztalatok dokumentálása
5. **Párbeszédes értékelés**: Együttműködés más tanulókkal összetett helyzetekben

### Tanfolyam elvégzésének előnyei
Az összes fejezet ellenőrzéssel történő befejezése után a végzettek rendelkezni fognak:

**Műszaki szaktudás:**
- **Üzemi tapasztalat**: Valós AI alkalmazások telepítése Azure környezetekbe
- **Szakmai készségek**: Vállalati szintű telepítési és hibakeresési képességek  
- **Architektúra ismeretek**: Többügynökös AI megoldások és összetett infrastruktúra minták
- **Hibakeresési jártasság**: Önálló telepítési és konfigurációs problémák megoldása

**Szakmai fejlődés:**
- **Iparági elismerés**: Igazolható készségek a keresett AZD és AI telepítési területeken
- **Karrier előremenetel**: Képesítések felhőarchitekt és AI telepítési szakértő pozíciókra
- **Közösségi vezetés**: Aktív tagság Azure fejlesztői és AI közösségekben
- **Folyamatos tanulás**: Alap a haladó Microsoft Foundry szakosodáshoz

**Portfólió elemek:**
- **Telepített megoldások**: AI alkalmazások és infrastruktúra minták működő példái
- **Dokumentáció**: Átfogó telepítési útmutatók és hibakeresési eljárások  
- **Közösségi hozzájárulások**: Megosztott beszélgetések, példák és fejlesztések az Azure közösséggel
- **Szakmai hálózat**: Kapcsolatok Azure szakértőkkel és AI telepítési gyakorlókkal

### Tanfolyam utáni tanulási út
A végzettek készen állnak haladó szakosodásra:
- **Microsoft Foundry szakértő**: Mély AI modell telepítési és összehangolási szaktudás
- **Felhő architektúra vezető**: Vállalati méretű telepítési tervezés és kormányzás
- **Fejlesztői közösség vezető**: Hozzájárulás Azure mintákhoz és közösségi forrásokhoz
- **Vállalati képzés**: AZD és AI telepítési készségek oktatása szervezetekben

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->