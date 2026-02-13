# AZD kezdőknek: Tanfolyam áttekintés & Tanulási keretrendszer

## Tanfolyam áttekintése

Sajátítsd el az Azure Developer CLI-t (azd) strukturált fejezeteken keresztül, amelyek fokozatos tanulásra épülnek. **Különös hangsúly az AI-alkalmazások telepítésén a Microsoft Foundry integrációval.**

### Miért elengedhetetlen ez a tanfolyam a modern fejlesztők számára

A Microsoft Foundry Discord közösség visszajelzései alapján, **a fejlesztők 45%-a szeretné az AZD-t AI munkaterhelésekhez használni**, de kihívásokba ütköznek:
- Összetett, több szolgáltatásból álló AI architektúrák
- Production AI telepítési legjobb gyakorlatok  
- Azure AI szolgáltatások integrálása és konfigurálása
- AI munkaterhelések költségoptimalizálása
- AI-specifikus telepítési hibák elhárítása

### Fő tanulási célok

A strukturált tanfolyam elvégzésével:
- **AZD alapjai mesterfokon**: Alapfogalmak, telepítés és konfiguráció
- **AI-alkalmazások telepítése**: AZD használata Microsoft Foundry szolgáltatásokkal
- **Infrastruktúra mint kód megvalósítása**: Azure erőforrások kezelése Bicep sablonokkal
- **Telepítések hibakeresése**: Gyakori problémák megoldása és hibakeresés
- **Éles környezetre optimalizálás**: Biztonság, skálázás, monitorozás és költségkezelés
- **Többügynökös megoldások építése**: Összetett AI architektúrák telepítése

## 🎓 Workshop tanulási élmény

### Rugalmas tanulási formák
A tanfolyam mind **önálló, saját tempójú tanulást**, mind **vezetett workshop üléseket** támogat, lehetővé téve, hogy a résztvevők gyakorlati tapasztalatot szerezzenek az AZD-vel interaktív feladatokon keresztül.

#### 🚀 Önálló, saját tempójú tanulási mód
**Tökéletes egyéni fejlesztőknek és folyamatos tanuláshoz**

**Jellemzők:**
- **Böngésző alapú felület**: MkDocs-vezérelt workshop bármely webböngészőből elérhető
- **GitHub Codespaces integráció**: Egy kattintásos fejlesztőkörnyezet előre konfigurált eszközökkel
- **Interaktív DevContainer környezet**: Nincs szükség helyi beállításra - azonnal kezdhetsz kódolni
- **Előrehaladás nyomon követése**: Beépített ellenőrzőpontok és validációs gyakorlatok
- **Közösségi támogatás**: Hozzáférés Azure Discord csatornákhoz kérdések és együttműködés céljából

**Tanulási struktúra:**
- **Rugalmas időbeosztás**: Befejezheted a fejezeteket a saját ütemedben, napok vagy hetek alatt
- **Ellenőrzőpont rendszer**: Tanulás érvényesítése a bonyolultabb témákhoz való továbblépés előtt
- **Erőforrás könyvtár**: Átfogó dokumentációk, példák és hibakeresési útmutatók
- **Portfólió fejlesztés**: Telepíthető projektek készítése szakmai portfólióhoz

**Kezdés (önálló tanulás):**
```bash
# Opció 1: GitHub Codespaces (Ajánlott)
# Navigáljon a tárolóhoz, és kattintson a "Code" → "Create codespace on main" gombra

# Opció 2: Helyi fejlesztés
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Kövesse a workshop/README.md-ben található beállítási utasításokat
```

#### 🏛️ Vezetett workshop ülések
**Ideális vállalati képzésekhez, bootcampekhez és oktatási intézményeknek**

**Workshop formátum opciók:**

**📚 Akadémiai kurzus integráció (8-12 hét)**
- **Egyetemi programok**: Féléves kurzus heti 2 órás alkalommal
- **Bootcamp formátum**: Intenzív 3-5 napos program napi 6-8 órás ülésekkel
- **Vállalati képzés**: Havi csapatülések gyakorlati projektmegvalósítással
- **Értékelési rendszer**: Értékelt feladatok, páros értékelések és záró projektek

**🚀 Intenzív workshop (1-3 nap)**
- **1. nap**: Alapok + AI fejlesztés (1–2. fejezetek) - 6 óra
- **2. nap**: Konfiguráció + Infrastruktúra (3–4. fejezetek) - 6 óra  
- **3. nap**: Haladó minták + Éles üzem (5–8. fejezetek) - 8 óra
- **Utókövetés**: Opcionális 2 hetes mentorálás a projekt befejezéséhez

**⚡ Vezetői rövid ismertető (4-6 óra)**
- **Stratégiai áttekintés**: AZD értékajánlata és üzleti hatása (1 óra)
- **Gyakorlati bemutató**: AI alkalmazás végponttól végpontig történő telepítése (2 óra)
- **Architektúra áttekintés**: Vállalati minták és irányelvek (1 óra)
- **Megvalósítási tervezés**: Szervezeti bevezetési stratégia (1-2 óra)

#### 🛠️ Workshop tanulási módszertan
**Felderítés → Telepítés → Testreszabás megközelítés a gyakorlati készségek fejlesztéséhez**

**1. fázis: Felderítés (45 perc)**
- **Sablonok feltérképezése**: Microsoft Foundry sablonok és szolgáltatások értékelése
- **Architektúra elemzés**: Többügynökös minták és telepítési stratégiák megértése
- **Követelményfelmérés**: Szervezeti igények és korlátok azonosítása
- **Környezet beállítása**: Fejlesztőkörnyezet és Azure erőforrások konfigurálása

**2. fázis: Telepítés (2 óra)**
- **Vezetett megvalósítás**: AI alkalmazások lépésről lépésre történő telepítése AZD-vel
- **Szolgáltatás konfiguráció**: Azure AI szolgáltatások, végpontok és hitelesítés beállítása
- **Biztonság megvalósítása**: Vállalati biztonsági minták és hozzáférés-szabályozás alkalmazása
- **Validációs tesztelés**: Telepítések ellenőrzése és gyakori problémák hibakeresése

**3. fázis: Testreszabás (45 perc)**
- **Alkalmazás módosítása**: Sablonok adaptálása specifikus esetekhez és követelményekhez
- **Élesítésre optimalizálás**: Monitorozás, költségkezelés és skálázási stratégiák megvalósítása
- **Haladó minták**: Többügynökös koordináció és összetett architektúrák feltérképezése
- **Következő lépések tervezése**: Tanulási útvonal meghatározása a további készségfejlesztéshez

#### 🎯 Workshop tanulási eredmények
**Mérhető készségek, melyek gyakorlati munkán keresztül fejlődnek**

**Technikai kompetenciák:**
- **Éles AI alkalmazások telepítése**: AI-vezérelt megoldások sikeres telepítése és konfigurálása
- **Infrastructure as Code elsajátítása**: Egyedi Bicep sablonok létrehozása és kezelése
- **Többügynökös architektúra**: Koordinált AI ügynök megoldások megvalósítása
- **Éles üzemre való felkészültség**: Biztonsági, monitorozási és irányítási minták alkalmazása
- **Hibakeresési szakértelem**: Telepítési és konfigurációs problémák önálló megoldása

**Szakmai készségek:**
- **Projektvezetés**: Műszaki csapatok vezetése felhőalapú telepítési kezdeményezésekben
- **Architektúra tervezés**: Skálázható, költséghatékony Azure megoldások tervezése
- **Ismeretátadás**: Kollégák képzése és mentorálása az AZD legjobb gyakorlataiban
- **Stratégiai tervezés**: Szervezeti felhő bevezetési stratégiák befolyásolása

#### 📋 Workshop források és anyagok
**Átfogó eszköztár oktatóknak és tanulóknak**

**Oktatóknak:**
- **Oktatói útmutató**: [Workshop Overview](workshop/README.md) - Ülés tervezés és lebonyolítási útmutató
- **Prezentációs anyagok**: Diavetítések, architektúra diagramok és demo forgatókönyvek
- **Értékelési eszközök**: Gyakorlati feladatok, tudásellenőrzések és értékelési rubrikák
- **Technikai beállítás**: Környezet konfiguráció, hibakeresési útmutatók és mentési tervek

**Tanulóknak:**
- **Interaktív workshop környezet**: [Workshop Materials](workshop/README.md) - Böngésző alapú tanulási platform
- **Lépésről lépésre útmutatók**: [Guided Exercises](../../workshop/docs/instructions) - Részletes megvalósítási ismertetők  
- **Referencia dokumentáció**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - AI-fókuszú mélyreható anyagok
- **Közösségi források**: Azure Discord csatornák, GitHub discussions és szakértői támogatás

#### 🏢 Vállalati workshop megvalósítása
**Szervezeti képzés és bevezetési stratégiák**

**Vállalati képzési programok:**
- **Fejlesztői onboarding**: Új belépők orientációja az AZD alapjaival (2-4 hét)
- **Csapat készségfejlesztés**: Negyedéves workshopok meglévő fejlesztőcsapatok számára (1-2 nap)
- **Architektúra áttekintés**: Havi ülések vezető mérnököknek és architektoknak (4 óra)
- **Vezetői tájékoztatók**: Vezetői workshopok műszaki döntéshozóknak (fél nap)

**Megvalósítási támogatás:**
- **Egyedi workshop tervezés**: Szervezeti igényekhez igazított tartalom
- **Pilot program menedzsment**: Strukturált bevezetés sikerességi mutatókkal és visszacsatolási hurkokkal  
- **Folyamatos mentorálás**: Utó-workshop támogatás a projektek megvalósításához
- **Közösségépítés**: Belső Azure AI fejlesztői közösségek és ismeretmegosztás

**Siker mutatói:**
- **Készségelsajátítás**: Elő-/utótesztek a műszaki kompetenciák növekedésének mérésére
- **Telepítési siker**: A résztvevők százaléka, akik sikeresen telepítettek éles alkalmazásokat
- **Termelékenységre jutási idő**: Az új Azure AI projektek bevezetési idejének csökkenése
- **Tudásmegőrzés**: Utóvizsgálatok 3-6 hónappal a workshop után

## 8 fejezetes tanulási struktúra

### 1. fejezet: Alapok & Gyors kezdés (30-45 perc) 🌱
**Előfeltételek**: Azure előfizetés, alapvető parancssori ismeretek  
**Bonyolultság**: ⭐

#### Mit fogsz megtanulni
- Az Azure Developer CLI alapjainak megértése
- AZD telepítése a platformodra  
- Az első sikeres telepítésed
- Alapfogalmak és terminológia

#### Tanulási források
- [AZD Basics](docs/getting-started/azd-basics.md) - Alapfogalmak
- [Installation & Setup](docs/getting-started/installation.md) - Platform specifikus útmutatók
- [Your First Project](docs/getting-started/first-project.md) - Gyakorlati útmutató
- [Command Cheat Sheet](resources/cheat-sheet.md) - Gyors referencia

#### Gyakorlati eredmény
Sikeresen telepítesz egy egyszerű webalkalmazást az Azure-ra AZD használatával

---

### 2. fejezet: AI-első fejlesztés (1-2 óra) 🤖
**Előfeltételek**: 1. fejezet befejezése  
**Bonyolultság**: ⭐⭐

#### Mit fogsz megtanulni
- Microsoft Foundry integráció az AZD-vel
- AI-vezérelt alkalmazások telepítése
- AI szolgáltatások konfigurációinak megértése
- RAG (Retrieval-Augmented Generation) minták

#### Tanulási források
- [Microsoft Foundry Integration](docs/microsoft-foundry/microsoft-foundry-integration.md)
- [AI Model Deployment](docs/microsoft-foundry/ai-model-deployment.md)
- [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - **ÚJ**: Átfogó 2-3 órás gyakorlati labor
- [Interactive Workshop Guide](workshop/README.md) - **ÚJ**: Böngésző alapú workshop MkDocs előnézettel
- [Microsoft Foundry Templates](README.md#featured-microsoft-foundry-templates)
- [Workshop Instructions](../../workshop/docs/instructions) - **ÚJ**: Lépésről lépésre vezetett gyakorlatok

#### Gyakorlati eredmény
Telepíts és konfigurálj egy AI-vezérelt chat alkalmazást RAG képességekkel

#### Workshop tanulási útvonal (opcionális kiterjesztés)
**ÚJ interaktív élmény**: [Complete Workshop Guide](workshop/README.md)
1. **Felderítés** (30 perc): Sablon kiválasztás és értékelés
2. **Telepítés** (45 perc): AI sablon telepítése és funkcionalitásának validálása  
3. **Szétszedés** (30 perc): A sablon architektúrájának és komponenseinek megértése
4. **Konfiguráció** (30 perc): Beállítások és paraméterek testreszabása
5. **Testreszabás** (45 perc): Módosítás és iterálás, hogy a sajátoddá tedd
6. **Erőforrások felszámolása** (15 perc): Erőforrások eltávolítása és az életciklus megértése
7. **Összegzés** (15 perc): Következő lépések és haladó tanulási útvonalak

---

### 3. fejezet: Konfiguráció & Hitelesítés (45-60 perc) ⚙️
**Előfeltételek**: 1. fejezet befejezése  
**Bonyolultság**: ⭐⭐

#### Mit fogsz megtanulni
- Környezet konfigurációja és kezelése
- Hitelesítési és biztonsági legjobb gyakorlatok
- Erőforrás elnevezési és szervezési minták
- Több környezetre kiterjedő telepítések

#### Tanulási források
- [Configuration Guide](docs/getting-started/configuration.md) - Környezet beállítása
- [Authentication & Security Patterns](docs/getting-started/authsecurity.md) - Kezelt identitás és Key Vault integráció
- Többkörnyezetes példák

#### Gyakorlati eredmény
Több környezet kezelése megfelelő hitelesítéssel és biztonsággal

---

### 4. fejezet: Infrastruktúra mint kód & Telepítés (1-1.5 óra) 🏗️
**Előfeltételek**: 1–3. fejezetek befejezése  
**Bonyolultság**: ⭐⭐⭐

#### Mit fogsz megtanulni
- Haladó telepítési minták
- Infrastruktúra mint kód Biceppel
- Erőforrás-provisioning stratégiák
- Egyedi sablonok létrehozása

- Konténerizált alkalmazások telepítése Azure Container Apps-szel és AZD-vel

#### Tanulási források
- [Deployment Guide](docs/deployment/deployment-guide.md) - Teljes munkafolyamatok
- [Provisioning Resources](docs/deployment/provisioning.md) - Erőforráskezelés
- Konténer és mikroszolgáltatás példák
- [Container App Examples](examples/container-app/README.md) - Gyors kezdés, éles üzem és haladó telepítési minták

#### Gyakorlati eredmény
Összetett, több szolgáltatásból álló alkalmazások telepítése egyedi infrastruktúra sablonokkal

---

### 5. fejezet: Többügynökös AI megoldások (2-3 óra) 🤖🤖
**Előfeltételek**: 1–2. fejezetek befejezése  
**Bonyolultság**: ⭐⭐⭐⭐

#### Mit fogsz megtanulni
- Többügynökös architektúra minták
- Ügynök koordináció és orchestration
- Élesre kész AI telepítések
- Ügyfél- és készletkezelő ügynökök implementációi

- Konténerizált mikroszolgáltatások integrálása ügynök-alapú megoldások részeként

#### Tanulási források
- [Retail Multi-Agent Solution](examples/retail-scenario.md) - Teljes implementáció
- [ARM Template Package](../../examples/retail-multiagent-arm-template) - Egykattintásos telepítés
- Többügynökös koordinációs minták
- [Microservices Architecture Example](../../examples/container-app/microservices) - Szolgáltatás-szolgáltatás kommunikáció, aszinkron üzenetküldés és éles telepítés

#### Gyakorlati eredmény
Élesre kész többügynökös AI megoldás telepítése és kezelése

---

### 6. fejezet: Előtelepítési validáció & Tervezés (1 óra) 🔍
**Előfeltételek**: 4. fejezet befejezése  
**Bonyolultság**: ⭐⭐

#### Mit fogsz megtanulni
- Kapacitástervezés és erőforrás-validáció
- SKU kiválasztási stratégiák
- Pre-flight ellenőrzések és automatizálás
- Költségoptimalizálási tervek

#### Tanulási források
- [Capacity Planning](docs/pre-deployment/capacity-planning.md) - Erőforrás validáció
- [SKU Selection](docs/pre-deployment/sku-selection.md) - Költséghatékony választások
- [Pre-flight Checks](docs/pre-deployment/preflight-checks.md) - Automatizált szkriptek
- [Application Insights Integration](docs/pre-deployment/application-insights.md) - Monitorozás és megfigyelhetőség
- [Multi-Agent Coordination Patterns](docs/pre-deployment/coordination-patterns.md) - Ügynök orchestration stratégiák

#### Gyakorlati eredmény
Validáld és optimalizáld a telepítéseket a végrehajtás előtt
---
### 7. fejezet: Hibakeresés és hibajavítás (1–1,5 óra) 🔧
**Előfeltételek**: Bármely telepítési fejezet elvégzése  
**Bonyolultság**: ⭐⭐

#### Mit fogsz megtanulni
- Szisztematikus hibakeresési megközelítések
- Gyakori problémák és megoldások
- AI-specifikus hibakeresés
- Teljesítményoptimalizálás

#### Tanulási források
- [Gyakori problémák](docs/troubleshooting/common-issues.md) - GYIK és megoldások
- [Hibakeresési útmutató](docs/troubleshooting/debugging.md) - Lépésről lépésre stratégiák
- [AI-specifikus hibakeresés](docs/troubleshooting/ai-troubleshooting.md) - AI szolgáltatások problémái

#### Gyakorlati eredmény
Önállóan diagnosztizálja és megoldja a gyakori telepítési problémákat

---

### 8. fejezet: Éles üzem & Vállalati minták (2–3 óra) 🏢
**Előfeltételek**: 1–4. fejezetek elvégzése  
**Bonyolultság**: ⭐⭐⭐⭐

#### Mit fogsz megtanulni
- Éles üzemre való telepítési stratégiák
- Vállalati szintű biztonsági minták
- Megfigyelés és költségoptimalizálás
- Skálázhatóság és kormányzás

- Legjobb gyakorlatok konténeralkalmazások éles üzembe helyezéséhez (biztonság, megfigyelés, költség, CI/CD)

#### Tanulási források
- [Production AI Best Practices](docs/microsoft-foundry/production-ai-practices.md) - Vállalati minták
- Mikroszolgáltatások és vállalati példák
- Megfigyelési és kormányzati keretrendszerek
- [Microservices Architecture Example](../../examples/container-app/microservices) - Blue-green/kanári telepítés, elosztott trace-elés és költségoptimalizálás

#### Gyakorlati eredmény
Telepítsen vállalati szintű alkalmazásokat teljes gyártási képességekkel

---

## Tanulási előrehaladás és bonyolultság

### Fokozatos készségfejlesztés

- **🌱 Kezdők**: Kezdje az 1. fejezettel (Alapok) → 2. fejezet (AI fejlesztés)
- **🔧 Középhaladók**: 3–4. fejezetek (Konfiguráció & Infrastruktúra) → 6. fejezet (Érvényesítés)
- **🚀 Haladók**: 5. fejezet (Többügynökös megoldások) → 7. fejezet (Hibakeresés)
- **🏢 Vállalati**: Fejezze be az összes fejezetet, fókuszban a 8. fejezettel (Éles üzem minták)

- **Konténeralkalmazás útvonala**: 4. fejezet (Konténerizált telepítés), 5. fejezet (Mikroszolgáltatások integrációja), 8. fejezet (Éles üzem legjobb gyakorlatai)

### Bonyolultsági jelzők

- **⭐ Alap**: Egyetlen koncepciók, vezetett oktatóanyagok, 30–60 perc
- **⭐⭐ Középhaladó**: Több koncepció, gyakorlati feladatok, 1–2 óra  
- **⭐⭐⭐ Haladó**: Összetett architektúrák, egyedi megoldások, 1–3 óra
- **⭐⭐⭐⭐ Szakértő**: Gyártási rendszerek, vállalati minták, 2–4 óra

### Rugalmas tanulási utak

#### 🎯 AI fejlesztő gyorsított út (4–6 óra)
1. **1. fejezet**: Alapok & Gyors kezdés (45 perc)
2. **2. fejezet**: AI-első fejlesztés (2 óra)  
3. **5. fejezet**: Többügynökös AI megoldások (3 óra)
4. **8. fejezet**: Éles üzem AI legjobb gyakorlatai (1 óra)

#### 🛠️ Infrastruktúra szakértő útvonal (5–7 óra)
1. **1. fejezet**: Alapok & Gyors kezdés (45 perc)
2. **3. fejezet**: Konfiguráció & Hitelesítés (1 óra)
3. **4. fejezet**: Infrastrukturakód & Telepítés (1,5 óra)
4. **6. fejezet**: Telepítés előtti érvényesítés & Tervezés (1 óra)
5. **7. fejezet**: Hibakeresés & Hibajavítás (1,5 óra)
6. **8. fejezet**: Éles üzem & Vállalati minták (2 óra)

#### 🎓 Teljes tanulási út (8–12 óra)
Az összes 8 fejezet egymás után történő elvégzése gyakorlati feladatokkal és érvényesítéssel

## Tanfolyam befejezési keretrendszer

### Tudás ellenőrzése
- **Fejezet ellenőrzőpontok**: Gyakorlati feladatok mérhető eredményekkel
- **Gyakorlati ellenőrzés**: Minden fejezethez működő megoldások telepítése
- **Előrehaladás követése**: Vizuális jelzők és teljesítési jelvények
- **Közösségi érvényesítés**: Tapasztalatok megosztása az Azure Discord csatornákon

### A tanulási eredmények értékelése

#### 1–2. fejezet teljesítése (Alapok + AI)
- ✅ Telepítsen egy alap webalkalmazást AZD használatával
- ✅ Telepítsen AI-alapú chatalkalmazást RAG használatával
- ✅ Értse meg az AZD alapfogalmait és az AI integrációt

#### 3–4. fejezet teljesítése (Konfiguráció + Infrastruktúra)  
- ✅ Többkörnyezeti telepítések kezelése
- ✅ Egyéni Bicep infrastruktúra sablonok létrehozása
- ✅ Biztonságos hitelesítési minták megvalósítása

#### 5–6. fejezet teljesítése (Többügynök + Érvényesítés)
- ✅ Összetett többügynökös AI megoldás telepítése
- ✅ Kapacitástervezés és költségoptimalizálás elvégzése
- ✅ Automatizált telepítés előtti érvényesítés megvalósítása

#### 7–8. fejezet teljesítése (Hibakeresés + Éles üzem)
- ✅ Hibák feltárása és megoldása telepítési problémák esetén önállóan  
- ✅ Vállalati szintű megfigyelés és biztonság megvalósítása
- ✅ Éles üzemre kész alkalmazások telepítése kormányzással

### Tanúsítás és elismerés
- **Tanfolyam elvégzési jelvény**: Az összes 8 fejezet gyakorlati érvényesítésének befejezése
- **Közösségi elismerés**: Aktív részvétel a Microsoft Foundry Discord közösségben
- **Szakmai fejlődés**: Iparágilag releváns AZD és AI telepítési készségek
- **Karrierfejlesztés**: Vállalati szintű felhőtelepítési kompetenciák

## 🎓 Átfogó tanulási eredmények

### Alap szint (1–2. fejezet)
Az alapozó fejezetek elvégzése után a tanulók képesek lesznek:

**Technikai képességek:**
- Egyszerű webalkalmazások telepítése Azure-ba AZD parancsokkal
- AI-alapú chatalkalmazások konfigurálása és telepítése RAG képességekkel
- Az AZD alapfogalmainak megértése: sablonok, környezetek, provisionálási munkafolyamatok
- Microsoft Foundry szolgáltatások integrálása AZD telepítésekkel
- Azure AI szolgáltatások konfigurációinak és API végpontjainak áttekintése

**Szakmai készségek:**
- Strukturált telepítési munkafolyamatok követése konzisztens eredményekért
- Alap telepítési problémák hibakeresése naplók és dokumentáció alapján
- Hatékony kommunikáció a felhőtelepítési folyamatokról
- Biztonságos AI szolgáltatás integráció legjobb gyakorlatai alkalmazása

**Tanulás érvényesítése:**
- ✅ Sikeres telepítés a `todo-nodejs-mongo` sablonnal
- ✅ A `azure-search-openai-demo` telepítése és konfigurálása RAG használatával
- ✅ Interaktív workshop feladatok befejezése (Felderítési fázis)
- ✅ Részvétel az Azure Discord közösségi beszélgetésekben

### Középhaladó szint (3–4. fejezet)
A középhaladó fejezetek elvégzése után a tanulók képesek lesznek:

**Technikai képességek:**
- Többkörnyezeti telepítések kezelése (dev, staging, production)
- Egyedi Bicep sablonok létrehozása infrastruktúra-kódként
- Biztonságos hitelesítési minták megvalósítása kezelt identitással
- Összetett többszolgáltatásos alkalmazások telepítése egyéni konfigurációkkal
- Erőforrás-provisionálási stratégiák optimalizálása költség és teljesítmény szempontjából

**Szakmai készségek:**
- Skálázható infrastruktúra architektúrák tervezése
- Felhőtelepítések biztonsági legjobb gyakorlatainek alkalmazása
- Infrastruktúra minták dokumentálása csapatmunka támogatására
- Megfelelő Azure szolgáltatások kiválasztása az igényekhez

**Tanulás érvényesítése:**
- ✅ Környezetek konfigurálása környezet-specifikus beállításokkal
- ✅ Egyedi Bicep sablon létrehozása többszolgáltatásos alkalmazáshoz
- ✅ Kezelt identitás alapú hitelesítés megvalósítása biztonságos hozzáféréshez
- ✅ Konfigurációkezelési gyakorlatok elvégzése valós forgatókönyvekkel

### Haladó szint (5–6. fejezet)
A haladó fejezetek elvégzése után a tanulók képesek lesznek:

**Technikai képességek:**
- Többügynökös AI megoldások telepítése és koordinálása munkafolyamatokkal
- Ügyfél- és Készlet ügynök architektúrák megvalósítása kiskereskedelmi forgatókönyvekhez
- Átfogó kapacitástervezés és erőforrás-ellenőrzés végrehajtása
- Automatizált telepítés előtti érvényesítés és optimalizálás végrehajtása
- Költséghatékony SKU kiválasztás tervezése munkaterhelés alapján

**Szakmai készségek:**
- Összetett AI megoldások architektúrájának tervezése éles környezetekhez
- Műszaki viták vezetése AI telepítési stratégiákról
- Junior fejlesztők mentorálása AZD és AI telepítési gyakorlatokban
- AI architektúra minták értékelése és ajánlása üzleti igényekhez

**Tanulás érvényesítése:**
- ✅ Teljes kiskereskedelmi többügynökös megoldás telepítése ARM sablonokkal
- ✅ Ügynökök koordinációjának és munkafolyamat-orchestration bemutatása
- ✅ Kapacitástervezési gyakorlatok elvégzése valós erőforrás-korlátokkal
- ✅ Telepítésre való felkészültség érvényesítése automatizált pre-flight ellenőrzésekkel

### Szakértői szint (7–8. fejezet)
A szakértői fejezetek elvégzése után a tanulók képesek lesznek:

**Technikai képességek:**
- Önállóan diagnosztizálni és megoldani összetett telepítési hibákat
- Vállalati szintű biztonsági minták és kormányzási keretrendszerek megvalósítása
- Átfogó megfigyelési és riasztási stratégiák tervezése
- Éles üzemre optimalizálni a telepítéseket skálázhatóság, költség és teljesítmény szempontjából
- CI/CD csővezetékek létrehozása megfelelő teszteléssel és érvényesítéssel

**Szakmai készségek:**
- Vállalati felhőtranszformációs kezdeményezések vezetése
- Szervezeti telepítési szabványok tervezése és végrehajtása
- Fejlesztői csapatok képzése és mentorálása haladó AZD gyakorlatokban
- Műszaki döntéshozatal befolyásolása vállalati AI telepítések esetén

**Tanulás érvényesítése:**
- ✅ Összetett többszolgáltatásos telepítési hibák megoldása
- ✅ Vállalati biztonsági minták megvalósítása megfelelőségi követelményekkel
- ✅ Éles megfigyelés tervezése és telepítése Application Insights használatával
- ✅ Vállalati kormányzási keretrendszer implementációjának befejezése

## 🎯 Tanfolyam befejezési tanúsítvány

### Előrehaladás nyomon követési keretrendszer
Kövesse tanulási előrehaladását strukturált ellenőrzőpontokon keresztül:

- [ ] **1. fejezet**: Alapok & Gyors kezdés ✅
- [ ] **2. fejezet**: AI-első fejlesztés ✅  
- [ ] **3. fejezet**: Konfiguráció & Hitelesítés ✅
- [ ] **4. fejezet**: Infrastrukturakód & Telepítés ✅
- [ ] **5. fejezet**: Többügynökös AI megoldások ✅
- [ ] **6. fejezet**: Telepítés előtti érvényesítés & Tervezés ✅
- [ ] **7. fejezet**: Hibakeresés & Hibajavítás ✅
- [ ] **8. fejezet**: Éles üzem & Vállalati minták ✅

### Érvényesítési folyamat
Minden fejezet befejezése után ellenőrizze tudását az alábbiak szerint:

1. **Gyakorlati feladatok befejezése**: Minden fejezethez működő megoldások telepítése
2. **Tudásfelmérés**: GYIK szekciók áttekintése és önértékelések kitöltése
3. **Közösségi részvétel**: Tapasztalatok megosztása és visszajelzés kérése az Azure Discordon
4. **Portfólió kialakítása**: Dokumentálja telepítéseit és a tanulságokat
5. **Társak általi felülvizsgálat**: Együttműködés más tanulókkal összetett forgatókönyvekben

### A tanfolyam elvégzésének előnyei
Az összes fejezet érvényesítésével a végzettek rendelkezni fognak:

**Technikai szakértelem:**
- **Éles üzem tapasztalat**: Valódi AI alkalmazások telepítése Azure környezetekbe
- **Szakmai készségek**: Vállalati szintű telepítési és hibakeresési kompetenciák  
- **Architektúra ismeretek**: Többügynökös AI megoldások és összetett infrastruktúra minták
- **Hibakeresési jártasság**: Önálló megoldások telepítési és konfigurációs problémák esetén

**Szakmai fejlődés:**
- **Iparági elismerés**: Igazolható készségek a keresett AZD és AI telepítési területeken
- **Karrierelőrelépés**: Képesítések felhőarchitekt és AI telepítési specialista pozíciókhoz
- **Közösségi vezetés**: Aktív tagság az Azure fejlesztői és AI közösségekben
- **Folyamatos tanulás**: Alap a mélyebb Microsoft Foundry specializációkhoz

**Portfólió elemek:**
- **Telepített megoldások**: Működő AI alkalmazások és infrastruktúra minták példái
- **Dokumentáció**: Átfogó telepítési útmutatók és hibakeresési eljárások  
- **Közösségi hozzájárulások**: Beszélgetések, példák és fejlesztések megosztása az Azure közösséggel
- **Szakmai hálózat**: Kapcsolatok Azure szakértőkkel és AI telepítési gyakorlókkal

### Tanfolyam utáni tanulási út
A végzettek felkészültek további specializációkra:
- **Microsoft Foundry Szakértő**: Mély specializáció AI modell telepítésében és orkestrációjában
- **Felhőarchitektúra vezetés**: Vállalati méretű telepítési tervezés és kormányzás
- **Fejlesztői közösségi vezetés**: Hozzájárulás Azure példákhoz és közösségi forrásokhoz
- **Vállalati képzés**: AZD és AI telepítési készségek oktatása szervezeten belül

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Jogi nyilatkozat:
Ezt a dokumentumot az AI fordító szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) használatával fordítottuk. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. A dokumentum eredeti, anyanyelvi változatát kell tekinteni irányadónak. Kritikus jelentőségű információk esetén profi, emberi fordítást javasolunk. Nem vállalunk felelősséget az ezen fordítás használatából eredő félreértésekért vagy téves értelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->