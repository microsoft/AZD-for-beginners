# Tanulmányi Útmutató - Átfogó Tanulási Célok

**Tanulási Útvonal Navigáció**
- **📚 Kurzus Főoldal**: [AZD Kezdőknek](../README.md)
- **📖 Tanulás Megkezdése**: [1. fejezet: Alapok és Gyors Kezdés](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Haladás Követése**: [Kurzus Teljesítés](../README.md#-course-completion--certification)

## Bevezetés

Ez az átfogó tanulmányi útmutató strukturált tanulási célokat, kulcsfontosságú fogalmakat, gyakorlati feladatokat és értékelési anyagokat tartalmaz, hogy segítsen elsajátítani az Azure Developer CLI-t (azd). Használd ezt az útmutatót a haladásod nyomon követésére, és biztosítsd, hogy minden alapvető témát lefedtél.

## Tanulási Célok

Az útmutató elvégzése után képes leszel:
- Az Azure Developer CLI alapvető és haladó fogalmainak teljes körű elsajátítása
- Gyakorlati készségek fejlesztése Azure alkalmazások telepítésében és kezelésében
- Magabiztosság építése hibakeresésben és telepítések optimalizálásában
- Megérteni az éles környezetre készült telepítési gyakorlatokat és a biztonsági megfontolásokat

## Tanulási Eredmények

Az útmutató minden szakaszának elvégzése után képes leszel:
- Teljes alkalmazás architektúrák tervezése, telepítése és kezelése az azd használatával
- Átfogó megfigyelési, biztonsági és költségoptimalizációs stratégiák megvalósítása
- Önállóan hibakeresni összetett telepítési problémákat
- Egyedi sablonok létrehozása és hozzájárulás az azd közösséghez

## 8-fejezetes Tanulási Struktúra

### 1. fejezet: Alapok és Gyors Kezdés (1. hét)
**Időtartam**: 30-45 perc | **Nehezségi szint**: ⭐

#### Tanulási Célok
- Megérteni az Azure Developer CLI fő fogalmait és terminológiáját
- Sikeresen telepíteni és konfigurálni az AZD-t a fejlesztési környezeteden
- Az első alkalmazás telepítése egy meglévő sablon segítségével
- Hatékonyan navigálni az AZD parancssori felületén

#### Megtanulandó Kulcsfogalmak
- AZD projekt struktúrája és összetevői (azure.yaml, infra/, src/)
- Sablon alapú telepítési munkafolyamatok
- Környezet konfiguráció alapjai
- Erőforráscsoport és előfizetés kezelése

#### Gyakorlati Feladatok
1. **Telepítés Ellenőrzése**: Telepítsd az AZD-t és ellenőrizd a `azd version` segítségével
2. **Első Telepítés**: Sikeresen telepítsd a todo-nodejs-mongo sablont
3. **Környezet Beállítása**: Konfiguráld az első környezeti változóidat
4. **Erőforrás Feltérképezés**: Navigálj a telepített erőforrások között az Azure Portalon

#### Értékelő Kérdések
- Mik az AZD projekt legfontosabb összetevői?
- Hogyan indítasz új projektet sablonból?
- Mi a különbség `azd up` és `azd deploy` között?
- Hogyan kezeled az AZD-vel a több környezetet?

---

### 2. fejezet: AI-első Fejlesztés (2. hét)
**Időtartam**: 4-5 óra, beleértve a workshopot | **Nehezségi szint**: ⭐⭐

#### Tanulási Célok
- Microsoft Foundry szolgáltatások integrálása az AZD munkafolyamatokba
- GA `microsoft.foundry` csomag használata az AZD 1.37.0+ verzióval tárolt-ügynök fejlesztéshez
- AI-alapú alkalmazások telepítése és konfigurálása
- RAG (Retrieval-Augmented Generation) megvalósítási minták megértése
- AI modellek telepítésének és skálázásának kezelése

#### Megtanulandó Kulcsfogalmak
- Microsoft Foundry Modellek szolgáltatás integráció és API-kezelés
- AI Keresési konfiguráció és vektoralapú indexelés
- Modell telepítési stratégiák és kapacitástervezés
- AI alkalmazás megfigyelése és teljesítmény optimalizálása
- Helyi Ügynök Ellenőr vs. felhő nyomkövetések, forráskód telepítés és értékelő eszközök verziókezelésben

#### Gyakorlati Feladatok
1. **AI Chat Telepítés**: Telepítsd az azure-search-openai-demo sablont
2. **RAG Implementáció**: Dokumentumindexelés és lekérdezés konfigurálása
3. **Modell Konfiguráció**: Több AI modell beállítása különböző célokra
4. **AI Megfigyelés**: Alkalmazásfüggő Insights megvalósítása AI terhelésekhez
5. **GA Tárolt Ügynök**: Kövesd a [hosted-agent walkthrough](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) útmutatót; hasonlítsd össze a helyi és felhőválaszokat, nézd át egy értékelési eredményt, és ellenőrizd a takarítási jogosultságokat

#### Értékelő Kérdések
- Hogyan konfigurálod a Microsoft Foundry Modellek szolgáltatásait egy AZD sablonban?
- Mik az RAG architektúra kulcselemei?
- Hogyan kezeled az AI modellek kapacitását és skálázását?
- Mely megfigyelési mutatók fontosak AI alkalmazásoknál?
- Mely kiterjesztések tartoznak az `microsoft.foundry`-hoz, és miért telepítik az értékeléseket külön?
- Miért számítanak a helyi ügynöktesztek is Azure modell költségeket?
- Mit hagy hátra `azd down`, amikor újrahasznosítasz egy meglévő Foundry projektet?

---

### 3. fejezet: Konfiguráció és Hitelesítés (3. hét)
**Időtartam**: 45-60 perc | **Nehezségi szint**: ⭐⭐

#### Tanulási Célok
- Mesteri szintű környezet konfiguráció és menedzsment stratégiák elsajátítása
- Biztonságos hitelesítési minták és kezelt identitás megvalósítása
- Erőforrások szervezése megfelelő elnevezési konvenciókkal
- Többkörnyezetes telepítések konfigurálása (fejlesztő, staging, éles)

#### Megtanulandó Kulcsfogalmak
- Környezeti hierarchia és konfigurációs előzmények
- Kezelt identitás és szolgáltatásazonosító hitelesítés
- Key Vault integráció titkok kezelésére
- Környezet-specifikus paraméterkezelés

#### Gyakorlati Feladatok
1. **Több Környezet Beállítása**: Konfiguráld a fejlesztő, staging és éles környezeteket
2. **Biztonsági Konfiguráció**: Valósítsd meg a kezelt identitás hitelesítést
3. **Titokkezelés**: Integráld az Azure Key Vault-ot érzékeny adatokhoz
4. **Paraméterkezelés**: Készíts környezet-specifikus konfigurációkat

#### Értékelő Kérdések
- Hogyan konfigurálsz különböző környezeteket az AZD-ben?
- Milyen előnyei vannak a kezelt identitásnak a szolgáltatásazonosítókkal szemben?
- Hogyan kezeled biztonságosan az alkalmazás titkait?
- Mi a konfigurációs hierarchia az AZD-ben?

---

### 4. fejezet: Infrastruktúra Kód formájában és Telepítés (4-5. hét)
**Időtartam**: 1-1,5 óra | **Nehezségi szint**: ⭐⭐⭐

#### Tanulási Célok
- Bicep infrastruktúra sablonok létrehozása és testreszabása
- Haladó telepítési minták és munkafolyamatok megvalósítása
- Erőforrás-ellátási stratégiák megértése
- Skálázható többszolgáltatásos architektúrák tervezése

- Konténeres alkalmazások telepítése Azure Container Apps és AZD segítségével


#### Megtanulandó Kulcsfogalmak
- Bicep sablon szerkezete és bevált gyakorlatok
- Erőforrásfüggőségek és telepítési sorrend
- Paraméter fájlok és sablon modularitás
- Egyedi horgok és telepítési automatizálás
- Konténeralkalmazás telepítési minták (gyors indítás, éles, mikroservices)

#### Gyakorlati Feladatok
1. **Egyedi Sablon Készítése**: Építs többszolgáltatásos alkalmazás sablont
2. **Bicep Jártasság**: Hozz létre moduláris, újrahasználható infrastruktúra komponenseket
3. **Telepítési Automatizálás**: Valósíts meg elõ- és utótelepítési horgokat
4. **Architektúra Tervezés**: Telepíts összetett mikroservices architektúrát
5. **Konténeralkalmazás Telepítés**: Telepítsd a [Simple Flask API](../../../examples/container-app/simple-flask-api) és a [Microservices Architecture](../../../examples/container-app/microservices) példákat AZD-vel

#### Értékelő Kérdések
- Hogyan készítesz egyedi Bicep sablonokat AZD-hez?
- Mik a legjobb gyakorlatok az infrastruktúra kód szervezésére?
- Hogyan kezeled az erőforrás függőségeket sablonokban?
- Mely telepítési minták támogatják a leállás nélküli frissítéseket?

---

### 5. fejezet: Több Ügynökös AI Megoldások (6-7. hét)
**Időtartam**: 2-3 óra | **Nehezségi szint**: ⭐⭐⭐⭐

#### Tanulási Célok
- Több ügynökös AI architektúrák tervezése és megvalósítása
- Ügynökök közötti koordináció és kommunikáció orchestrálása
- Élesbe kész AI megoldások telepítése megfigyeléssel
- Ügynök specializáció és munkafolyamat minták megértése
- Konténerizált mikroservices integrálása a több-ügynökös megoldásokba

#### Megtanulandó Kulcsfogalmak
- Több-ügynökös architektúra minták és tervezési elvek
- Ügynök kommunikációs protokollok és adatfolyam
- Terheléselosztási és skálázási stratégiák AI ügynökök számára
- Éles megfigyelés több-ügynökös rendszerekhez
- Szolgáltatás-szolgáltatás közötti kommunikáció konténerizált környezetben

#### Gyakorlati Feladatok
1. **Kiskereskedelmi Architektúra Áttekintése**: Elemezd a kiskereskedelmi tervet, és azonosítsd, mely alkalmazás komponenseket kell megvalósítani telepítés előtt
2. **Ügynök Testreszabás**: Módosítsd az Ügyfél és Készlet ügynök viselkedéseket
3. **Architektúra Skálázás**: Valósíts meg terheléselosztást és automatikus skálázást
4. **Éles Megfigyelés**: Állíts be átfogó megfigyelést és riasztásokat
5. **Mikroszolgáltatások Integrációja**: Bővítsd a [Microservices Architecture](../../../examples/container-app/microservices) példát ügynökalapú munkafolyamatok támogatására

#### Értékelő Kérdések
- Hogyan tervezel hatékony több-ügynökös kommunikációs mintákat?
- Mik a kulcsfontosságú szempontok AI ügynök munkaterhelések skálázásánál?
- Hogyan figyelsz és hibakeresel több-ügynökös AI rendszereket?
- Milyen éles üzemmódbeli minták biztosítják az AI ügynökök megbízhatóságát?

---

### 6. fejezet: Pre-Telepítési Érvényesítés és Tervezés (8. hét)
**Időtartam**: 1 óra | **Nehezségi szint**: ⭐⭐

#### Tanulási Célok
- Átfogó kapacitástervezés és erőforrás érvényesítés végrehajtása
- Optimális Azure SKU-k kiválasztása költséghatékonyság érdekében
- Automatizált előzetes ellenőrzések és érvényesítések megvalósítása
- Telepítési tervek készítése költségoptimalizációs stratégiákkal

#### Megtanulandó Kulcsfogalmak
- Azure erőforrás kvóták és kapacitáskorlátok
- SKU kiválasztási szempontok és költségoptimalizáció
- Automatizált érvényesítő szkriptek és tesztelés
- Telepítési tervezés és kockázatértékelés

#### Gyakorlati Feladatok
1. **Kapacitás Elemzés**: Elemezd az alkalmazásaid erőforrásigényeit
2. **SKU Optimalizáció**: Hasonlítsd össze és válaszd ki a költséghatékony szolgáltatási szinteket
3. **Érvényesítés Automatizálás**: Valósíts meg pre-telepítési ellenőrző szkripteket
4. **Költségtervezés**: Készíts telepítési költségbecsléseket és költségvetést

#### Értékelő Kérdések
- Hogyan érvényesíted az Azure kapacitást telepítés előtt?
- Milyen tényezők befolyásolják a SKU-k kiválasztását?
- Hogyan automatizálod az előzetes telepítési érvényesítést?
- Milyen stratégiák segítik a telepítési költségek optimalizálását?

---

### 7. fejezet: Hibakeresés és Hibadiagnosztika (9. hét)
**Időtartam**: 1-1,5 óra | **Nehezségi szint**: ⭐⭐

#### Tanulási Célok
- Szisztematikus hibadiagnosztikai megközelítések fejlesztése AZD telepítésekhez
- Gyakori telepítési és konfigurációs problémák megoldása
- AI-specifikus problémák és teljesítményhibák hibakeresése
- Megfigyelések és riasztások megvalósítása proaktív hibafelismeréshez

#### Megtanulandó Kulcsfogalmak
- Diagnosztikai technikák és naplózási stratégiák
- Gyakori hibaminták és megoldásaik
- Teljesítmény figyelés és optimalizálás
- Incidenskezelés és helyreállítási eljárások

#### Gyakorlati Feladatok
1. **Diagnosztikai Készségek**: Gyakorlat szándékosan hibás telepítésekkel
2. **Naplóelemzés**: Az Azure Monitor és Application Insights hatékony használata
3. **Teljesítményhangolás**: Lassú alkalmazások optimalizálása
4. **Helyreállítási Eljárások**: Biztonsági mentés és katasztrófa utáni helyreállítás megvalósítása

#### Értékelő Kérdések
- Mik a leggyakoribb AZD telepítési hibák?
- Hogyan hibakeresed az azonosítással és jogosultságokkal kapcsolatos problémákat?
- Milyen megfigyelési stratégiák segítenek a gyártási hibák megelőzésében?
- Hogyan optimalizálod az alkalmazás teljesítményét Azure-ban?

---

### 8. fejezet: Éles Üzem és Vállalati Minták (10-11. hét)
**Időtartam**: 2-3 óra | **Nehezségi szint**: ⭐⭐⭐⭐

#### Tanulási Célok
- Vállalati szintű telepítési stratégiák megvalósítása
- Biztonsági minták és megfelelőségi keretrendszerek tervezése
- Megfigyelési, kormányzási és költségkezelési stratégiák kialakítása
- Skálázható CI/CD csövek létrehozása AZD integrációval
- Legjobb gyakorlatok alkalmazása éles konténeralkalmazás telepítésekhez (biztonság, megfigyelés, költségek, CI/CD)

#### Megtanulandó Kulcsfogalmak
- Vállalati biztonsági és megfelelőségi követelmények
- Kormányzási keretrendszerek és szabályzatok megvalósítása
- Fejlett megfigyelés és költségkezelés
- CI/CD integráció és automatizált telepítési folyamatok
- Blue-green és kanári telepítési stratégiák konténeres terhelésekhez

#### Gyakorlati Feladatok
1. **Vállalati Biztonság**: Alkalmazz átfogó biztonsági mintákat
2. **Kormányzási Keretrendszer**: Állítsd be az Azure Policy-t és erőforrás kezelést
3. **Fejlett Megfigyelés**: Készíts dashboardokat és automatizált riasztásokat
4. **CI/CD Integráció**: Építs automatizált telepítési folyamatokat
5. **Éles Konténeralkalmazások**: Alkalmazz biztonságot, megfigyelést és költségoptimalizációt a [Microservices Architecture](../../../examples/container-app/microservices) példán

#### Értékelő Kérdések
- Hogyan valósítasz meg vállalati biztonságot AZD telepítésekben?
- Mely kormányzási minták biztosítják a megfelelést és a költségkontrollt?
- Hogyan tervezel skálázható megfigyelést éles rendszerekhez?
- Mely CI/CD minták működnek legjobban AZD munkafolyamatokban?

#### Tanulási Célok
- Megérteni az Azure Developer CLI alapjait és fő fogalmait
- Sikeresen telepíteni és konfigurálni az azd-t a fejlesztői környezetedben
- Teljesíteni az első telepítést meglévő sablon segítségével
- Navigálni az azd projekt struktúrájában és megérteni a kulcsösszetevőket

#### Megtanulandó Kulcsfogalmak
- Sablonok, környezetek és szolgáltatások
- azure.yaml konfigurációs struktúra
- Alapvető azd parancsok (init, up, down, deploy)
- Infrastruktúra kód formájában elvei
- Azure hitelesítés és engedélyezés

#### Gyakorlati Feladatok

**1.1 Feladat: Telepítés és Beállítás**
```text
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI only for exercises or template hooks that explicitly use `az`; authenticate AZD independently
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**1.2 Feladat: Első Telepítés**
```text
# Deploy a simple web application:
1. Initialize project in an empty directory: azd init --template todo-nodejs-mongo .
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**1.3 Feladat: Projekt Struktúra Elemzés**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### Önértékelő Kérdések
1. Mik az azd architektúra három fő fogalmai?
2. Mi a feladata az azure.yaml fájlnak?
3. Hogyan segítik a környezetek a különböző telepítési célok kezelését?
4. Milyen hitelesítési módszerek használhatók az azd-vel?
5. Mi történik, amikor először futtatod a `azd up`-ot?

---

## Haladás Követése és Értékelési Keretrendszer
```text
# Create and configure multiple environments:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**2.2 Feladat: Haladó Konfiguráció**
```text
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**2.3 Feladat: Biztonsági Konfiguráció**
```text
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Önértékelő Kérdések
1. Hogyan kezeli az azd a környezeti változók előzményeit?
2. Mik azok a telepítési horgok, és mikor érdemes használni őket?
3. Hogyan konfigurálsz különféle SKU-kat különböző környezetekhez?
4. Milyen biztonsági következményekkel járnak a különböző hitelesítési módszerek?
5. Hogyan kezeled a titkokat és érzékeny konfigurációs adatokat?

### 3. modul: Telepítés és Ellátás (4. hét)

#### Tanulási Célok
- Mesteri szintű telepítési munkafolyamatok és bevált gyakorlatok elsajátítása
- Infrastrukturakód megértése Bicep sablonokkal
- Összetett többszolgáltatásos architektúrák megvalósítása
- Telepítési teljesítmény és megbízhatóság optimalizálása

#### Megtanulandó Kulcsfogalmak
- Bicep sablon szerkezete és modulok
- Erőforrások függőségei és sorrendje
- Telepítési stratégiák (blue-green, folyamatos frissítések)
- Több régiós telepítések
- Adatmigrációk és adatkezelés

#### Gyakorlati Feladatok

**3.1. Gyakorlat: Egyedi infrastruktúra**
```text
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**3.2. Gyakorlat: Többszolgáltatásos alkalmazás**
```text
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**3.3. Gyakorlat: Adatbázis integráció**
```text
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Önálló értékelő kérdések
1. Milyen előnyei vannak a Bicep használatának az ARM-sablonokkal szemben?
2. Hogyan kezelik az adatbázis migrációkat az azd telepítések során?
3. Milyen stratégiák léteznek a nulla leállásos telepítésekre?
4. Hogyan kezelik a szolgáltatások közötti függőségeket?
5. Milyen szempontokat kell figyelembe venni a több régióra kiterjedő telepítések esetén?

### 4. modul: Előzetes telepítési ellenőrzés (5. hét)

#### Tanulási célok
- Átfogó előtelepítési ellenőrzések megvalósítása
- Kapacitástervezés és erőforrás-ellenőrzés elsajátítása
- SKU-kiválasztás és költségoptimalizálás megértése
- Automatikus validációs munkafolyamatok építése

#### Fontos fogalmak elsajátítása
- Azure erőforrás-kvóták és korlátok
- SKU választási kritériumok és költséghatás
- Automatizált ellenőrző szkriptek és eszközök
- Kapacitástervezési módszertanok
- Teljesítménytesztelés és optimalizálás

#### Gyakorlati gyakorlatok

**4.1. Gyakorlat: Kapacitástervezés**
```text
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**4.2. Gyakorlat: Előzetes ellenőrzés**
```text
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**4.3. Gyakorlat: SKU optimalizálás**
```text
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Önálló értékelő kérdések
1. Milyen tényezők befolyásolják a SKU kiválasztási döntéseket?
2. Hogyan ellenőrzik az Azure erőforrások elérhetőségét a telepítés előtt?
3. Mik a kulcsfontosságú elemei egy előzetes ellenőrző rendszernek?
4. Hogyan becsüljük és szabályozzuk a telepítési költségeket?
5. Milyen monitorozás szükséges a kapacitástervezéshez?

### 5. modul: Hibakeresés és hibaelhárítás (6. hét)

#### Tanulási célok
- Szisztematikus hibakeresési módszertanok elsajátítása
- Komplex telepítési problémák hibakeresési gyakorlatának fejlesztése
- Átfogó megfigyelés és riasztás bevezetése
- Esetkezelési és helyreállítási eljárások kialakítása

#### Fontos fogalmak elsajátítása
- Gyakori telepítési hibák mintázatai
- Naplóelemzési és összefüggéskeresési technikák
- Teljesítménymonitorozás és optimalizálás
- Biztonsági incidensek észlelése és kezelése
- Katasztrófa utáni helyreállítás, üzletmenet folytonosság

#### Gyakorlati gyakorlatok

**5.1. Gyakorlat: Hibakeresési forgatókönyvek**
```text
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**5.2. Gyakorlat: Megfigyelési implementáció**
```text
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**5.3. Gyakorlat: Esetkezelési gyakorlat**
```text
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Önálló értékelő kérdések
1. Mi a szisztematikus megközelítés az azd telepítések hibáinak kereséséhez?
2. Hogyan lehet naplókat összekapcsolni több szolgáltatás és erőforrás között?
3. Mely monitorozási mutatók legfontosabbak a korai problémafelismeréshez?
4. Hogyan valósítanak meg hatékony katasztrófavédelmi eljárásokat?
5. Mik a kulcselemei egy esetkezelési tervnek?

### 6. modul: Haladó témák és bevált gyakorlatok (7-8. hét)

#### Tanulási célok
- Vállalati szintű telepítési minták alkalmazása
- CI/CD integráció és automatizálás elsajátítása
- Egyedi sablonok fejlesztése és közösségi hozzájárulás
- Haladó biztonsági és megfelelőségi követelmények megértése

#### Fontos fogalmak elsajátítása
- CI/CD munkafolyamat-integrációs minták
- Egyedi sablonfejlesztés és terjesztés
- Vállalati irányítás és megfelelőség
- Haladó hálózat- és biztonsági konfigurációk
- Teljesítményoptimalizálás és költségmenedzsment

#### Gyakorlati gyakorlatok

**6.1. Gyakorlat: CI/CD integráció**
```text
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**6.2. Gyakorlat: Egyedi sablonfejlesztés**
```text
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**6.3. Gyakorlat: Vállalati megvalósítás**
```text
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Önálló értékelő kérdések
1. Hogyan integrálható az azd meglévő CI/CD munkafolyamatokba?
2. Mik a legfontosabb szempontok az egyedi sablonfejlesztésnél?
3. Hogyan valósítható meg irányítás és megfelelőség az azd telepítésekben?
4. Melyek a legjobb gyakorlatok vállalati méretű telepítésekhez?
5. Hogyan járulhat hozzá hatékonyan az azd közösséghez?

## Gyakorlati projektek

### 1. projekt: Személyes portfólió weboldal
**Bonyolultság**: Kezdő  
**Időtartam**: 1-2 hét

Készítsen és telepítsen egy személyes portfólió weboldalt az alábbiak felhasználásával:
- Statikus weboldal tárhely Azure Storage-on
- Egyedi domain konfiguráció
- CDN integráció a globális teljesítmény érdekében
- Automatikus telepítési folyamat

**Szállítandók**:
- Működő weboldal, Azure-ban telepítve
- Egyedi azd sablon portfólió telepítésekhez
- Telepítési folyamat dokumentációja
- Költségelemzés és optimalizálási ajánlások

### 2. projekt: Feladatkezelő alkalmazás
**Bonyolultság**: Középhaladó  
**Időtartam**: 2-3 hét

Készítsen teljes körű feladatkezelő alkalmazást az alábbiakkal:
- React frontend, App Service-re telepítve
- Node.js API backend hitelesítéssel
- PostgreSQL adatbázis migrációkkal
- Application Insights monitorozás

**Szállítandók**:
- Teljes alkalmazás felhasználói hitelesítéssel
- Adatbázis sémák és migrációs szkriptek
- Monitorozási műszerfalak és riasztási szabályok
- Több környezetre konfigurált telepítés

### 3. projekt: Microservices alapú e-kereskedelmi platform
**Bonyolultság**: Haladó  
**Időtartam**: 4-6 hét

Tervezzen és valósítson meg mikro-szolgáltatás alapú e-kereskedelmi platformot:
- Több API szolgáltatás (katalógus, rendelések, fizetések, felhasználók)
- Üzenetsor integráció Service Bus-szal
- Redis cache a teljesítményért
- Átfogó naplózás és monitorozás

**Referencia példa**: Lásd a [Microservices Architecture](../../../examples/container-app/microservices) két szolgáltatásos tanulási mintát és telepítési útmutatót. Sorok, perzisztencia, hitelesítés, fizetésfeldolgozás és éles környezetre alkalmassá tétel külön projektfeladatok.

**Szállítandók**:
- Teljes mikro-szolgáltatás architektúra
- Szolgáltatások közti kommunikációs minták
- Teljesítménytesztelés és optimalizálás
- Éles környezetre kész biztonsági megvalósítás

## Értékelés és tanúsítás

### Tudásellenőrzések

Teljesítse ezeket az értékeléseket minden modul után:

**1. modul értékelés**: Alapfogalmak és telepítés
- Választós kérdések az alapfogalmakról
- Gyakorlati telepítési és konfigurációs feladatok
- Egyszerű telepítési gyakorlat

**2. modul értékelés**: Konfiguráció és környezetek
- Környezetkezelési szcenáriók
- Konfigurációs hibakeresési gyakorlatok
- Biztonsági konfiguráció implementálása

**3. modul értékelés**: Telepítés és működtetés
- Infrastruktúra-tervezési feladatok
- Többszolgáltatásos telepítési szcenáriók
- Teljesítményoptimalizálási feladatok

**4. modul értékelés**: Előzetes validáció
- Kapacitástervezési esettanulmányok
- Költségoptimalizálási szcenáriók
- Validációs munkafolyamatok implementálása

**5. modul értékelés**: Hibakeresés és hibaelhárítás
- Probléma diagnosztikai gyakorlatok
- Monitorozás bevezetési feladatok
- Esetkezelési szimulációk

**6. modul értékelés**: Haladó témák
- CI/CD munkafolyamat tervezés
- Egyedi sablonfejlesztés
- Vállalati architektúra szcenáriók

### Záró projekt

Tervezzen és valósítson meg egy teljes megoldást, amely bizonyítja a szakértelmet minden témában:

**Követelmények**:
- Többrétegű alkalmazás architektúra
- Több környezetre történő telepítés
- Átfogó monitorozás és riasztás
- Biztonsági és megfelelőségi megvalósítás
- Költségoptimalizálás és teljesítményhangolás
- Teljes dokumentáció és üzemeltetési kézikönyv

**Értékelési kritériumok**:
- Műszaki megvalósítás minősége
- Dokumentáció teljessége
- Biztonság és bevált gyakorlatok betartása
- Teljesítmény- és költségoptimalizálás
- Hibakeresés és monitorozás hatékonysága

## Tanulási források és hivatkozások

### Hivatalos dokumentációk
- [Azure Developer CLI dokumentáció](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep dokumentáció](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Közösségi források
- [AZD Template Gallery](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub szervezet](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHub tároló](https://github.com/Azure/azure-dev)

### Gyakorló környezetek
- [Azure Free Account](https://azure.microsoft.com/free/)
- [Azure DevOps ingyenes szint](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### További eszközök
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Tanulási ütemterv javaslatok

### Teljes munkaidős tanulás (8 hét)
- **1-2. hét**: 1-2. modul (Bevezetés, Konfiguráció)
- **3-4. hét**: 3-4. modul (Telepítés, Előtelepítés)
- **5-6. hét**: 5-6. modul (Hibakeresés, Haladó témák)
- **7-8. hét**: Gyakorlati projektek és záró értékelés

### Részmunkaidős tanulás (16 hét)
- **1-4. hét**: 1. modul (Bevezetés)
- **5-7. hét**: 2. modul (Konfiguráció és környezetek)
- **8-10. hét**: 3. modul (Telepítés és működtetés)
- **11-12. hét**: 4. modul (Előzetes validáció)
- **13-14. hét**: 5. modul (Hibakeresés és hibaelhárítás)
- **15-16. hét**: 6. modul (Haladó témák és értékelés)

---

## Előrehaladás nyomon követése és értékelési keretrendszer

### Fejezetzáró ellenőrző lista

Kövesse nyomon előrehaladását minden fejezetben az alábbi mérhető eredmények alapján:

#### 📚 1. fejezet: Alapok & Gyors kezdés
- [ ] **Telepítés befejezve**: AZD telepítve és ellenőrizve az Ön platformján
- [ ] **Első telepítés**: Sikeresen telepítette a todo-nodejs-mongo sablont
- [ ] **Környezet beállítása**: Első környezeti változók konfigurálva
- [ ] **Erőforrás felfedezés**: Felfedezte a telepített erőforrásokat az Azure Portalon
- [ ] **Parancsok elsajátítása**: Magabiztos az alap AZD parancsok használatában

#### 🤖 2. fejezet: AI-központú fejlesztés  
- [ ] **AI Sablon telepítés**: Sikeresen telepítette az azure-search-openai-demo-t
- [ ] **RAG megvalósítás**: Dokumentumindexelés és visszakeresés konfigurálva
- [ ] **Modell konfiguráció**: Több AI modellt állított be különböző célokra
- [ ] **AI monitorozás**: Application Insights bevezetése AI munkaterhelésekhez
- [ ] **Teljesítményoptimalizálás**: Finomhangolta az AI alkalmazás teljesítményét

#### ⚙️ 3. fejezet: Konfiguráció & Hitelesítés
- [ ] **Több környezet létrehozása**: Fejlesztői, előkészítő és éles környezetek konfigurálva
- [ ] **Biztonsági megvalósítás**: Kezelt identitás alapú hitelesítés beállítása
- [ ] **Titkok kezelése**: Azure Key Vault integrálása érzékeny adatok kezelésére
- [ ] **Paraméter kezelő**: Környezetspecifikus konfigurációk létrehozása
- [ ] **Hitelesítés mesterfokon**: Biztonságos hozzáférési minták megvalósítása

#### 🏗️ 4. fejezet: Infrastruktúra mint kód & Telepítés
- [ ] **Egyedi sablon létrehozása**: Többszolgáltatásos alkalmazás sablon készítése
- [ ] **Bicep mesterfokon**: Moduláris, újrahasználható infrastruktúra komponensek létrehozása
- [ ] **Telepítési automatizáció**: Elő- és utótelepítési hook-ok alkalmazása
- [ ] **Architektúra tervezés**: Komplex mikro-szolgáltatás architektúra telepítése
- [ ] **Sablon optimalizálás**: Teljesítmény- és költségalapú optimalizálás végrehajtása

#### 🎯 5. fejezet: Több-ügynökös AI megoldások
- [ ] **Kiskereskedelmi architektúra áttekintése**: Hiányzó alkalmazás összetevők azonosítása, megvalósítási és ellenőrzési tervek készítése
- [ ] **Ügynök testreszabás**: Vásárlói és készletügynök viselkedések módosítása
- [ ] **Architektúra skálázás**: Terheléselosztás és automatikus skálázás megvalósítása
- [ ] **Éles környezet monitorozás**: Átfogó megfigyelési és riasztási rendszer beállítása
- [ ] **Teljesítményhangolás**: Több-ügynökös rendszer teljesítményének optimalizálása

#### 🔍 6. fejezet: Előtelepítési validáció & Tervezés
- [ ] **Kapacitáselemzés**: Alkalmazások erőforrásigényének elemzése
- [ ] **SKU optimalizálás**: Költséghatékony szolgáltatási szintek kiválasztása
- [ ] **Validáció automatizálás**: Előtelepítési ellenőrző szkriptek bevezetése
- [ ] **Költségtervezés**: Telepítési költségbecslések és költségvetések készítése
- [ ] **Kockázatértékelés**: Telepítési kockázatok azonosítása és csökkentése

#### 🚨 7. fejezet: Hibakeresés & Hibaelhárítás
- [ ] **Diagnosztikai képességek**: Szándékosan hibás telepítések sikeres hibakeresése
- [ ] **Naplóelemzés**: Azure Monitor és Application Insights hatékony használata
- [ ] **Teljesítményhangolás**: Lassú alkalmazások optimalizálása
- [ ] **Helyreállítási eljárások**: Biztonsági mentés és katasztrófa utáni helyreállítás megvalósítása
- [ ] **Monitorozás beállítása**: Proaktív megfigyelés és riasztás kialakítása

#### 🏢 8. fejezet: Éles és vállalati minták
- [ ] **Vállalati biztonság**: Átfogó biztonsági minták megvalósítása
- [ ] **Irányítási keretrendszer**: Azure Policy és erőforrás-menedzsment bevezetése
- [ ] **Haladó monitorozás**: Műszerfalak és automatizált riasztások létrehozása
- [ ] **CI/CD integráció**: Automatizált telepítési munkafolyamatok építése
- [ ] **Megfelelőség megvalósítása**: Vállalati megfelelőségi követelmények teljesítése

### Tanulási idővonal és mérföldkövek

#### 1-2. hét: Alapok lefektetése
- **Mérföldkő**: Az első AI alkalmazás telepítése AZD használatával
- **Ellenőrzés**: Működő alkalmazás, nyilvános URL-en elérhető
- **Készségek**: Alap AZD munkafolyamatok és AI szolgáltatás integráció

#### 3-4. hét: Konfiguráció elsajátítása
- **Mérföldkő**: Több környezetben történő telepítés biztonságos hitelesítéssel
- **Ellenőrzés**: Ugyanaz az alkalmazás telepítve dev/staging/prod környezetekbe
- **Készségek**: Környezetkezelés és biztonsági megvalósítás

#### 5-6. hét: Infrastruktúra szakértelem
- **Mérföldkő**: Egyedi sablon komplex többszolgáltatásos alkalmazáshoz
- **Ellenőrzés**: Újrahasználható sablon telepítése más csapattag által
- **Készségek**: Bicep mesterfok és infrastruktúra automatizáció

#### 7-8. hét: Haladó AI megvalósítás
- **Mérföldkő**: Éles környezetre kész több-ügynökös AI megoldás
- **Ellenőrzés**: Valós terhelést kezelő rendszer monitorozással
- **Készségek**: Több-ügynökös koordináció és teljesítményoptimalizálás

#### 9-10. hét: Élesbe helyezési készültség
- **Mérföldkő**: Vállalati szintű telepítés teljes megfeleléssel
- **Ellenőrzés**: Biztonsági felülvizsgálaton és költségoptimalizáló auditon átesett rendszer
- **Készségek**: Irányítás, monitorozás és CI/CD integráció

### Értékelés és tanúsítás

#### Tudásellenőrzési módszerek
1. **Gyakorlati telepítések**: Működő alkalmazások minden fejezethez
2. **Kódáttekintések**: Sablon és konfiguráció minőségi értékelése
3. **Problémamegoldás**: Hibakeresési forgatókönyvek és megoldások
4. **Társi tanítás**: Fogalmak magyarázata más tanulóknak
5. **Közösségi hozzájárulás**: Sablonok vagy fejlesztések megosztása

#### Szakmai fejlődési eredmények
- **Portfólió projektek**: Telepítési és architektúra gyakorlatok tanulása; az éles környezetre való alkalmasság külön megvalósítást és áttekintést igényel
- **Technikai készségek**: Iparág-szabványos AZD és mesterséges intelligencia telepítési szakértelem
- **Problémamegoldó képesség**: Önálló hibakeresés és optimalizálás
- **Közösségi elismerés**: Aktív részvétel az Azure fejlesztői közösségben
- **Karrier fejlődés**: Felhő- és MI szerepkörökhöz közvetlenül alkalmazható készségek

#### Sikermutatók
- **Telepítési sikeresség**: >95%-os sikeres telepítés
- **Hibakeresési idő**: <30 perc általános problémák esetén
- **Teljesítmény optimalizálás**: Költség- és teljesítményjavulás bemutatása
- **Biztonsági áttekintés**: Dokumentált controls és a szervezet követelményeihez képesti fennmaradó hiányosságok; a tanfolyam elvégzése nem garantálja a megfelelést
- **Tudásátadás**: Képesség más fejlesztők mentorálására

### Folyamatos tanulás és közösségi részvétel

#### Maradj naprakész
- **Azure frissítések**: Kövesd az Azure Developer CLI kiadási jegyzeteit
- **Közösségi események**: Vegyél részt Azure és MI fejlesztői eseményeken
- **Dokumentáció**: Hozzájárulás közösségi dokumentációkhoz és példákhoz
- **Visszacsatolási kör**: Adj visszajelzést a tanfolyami tartalomról és az Azure szolgáltatásokról

#### Karrierfejlesztés
- **Szakmai hálózat**: Kapcsolódj Azure és MI szakértőkhöz
- **Előadási lehetőségek**: Mutasd be tanulmányaid konferenciákon vagy találkozókon
- **Nyílt forráskódú hozzájárulás**: Adj hozzá AZD sablonokhoz és eszközökhöz
- **Mentorálás**: Vezess más fejlesztőket AZD tanulási útjukon

---

**Fejezet navigáció:**
- **📚 Tanfolyam kezdőlap**: [AZD kezdőknek](../README.md)
- **📖 Tanulás megkezdése**: [1. fejezet: Alapok és gyors kezdés](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Haladás követése**: Kövesd nyomon fejlődésed a részletes, 8 fejezetes tanulási rendszerben
- **🤝 Közösség**: [Azure Discord](https://discord.gg/microsoft-azure) támogatásért és beszélgetésekért

**Tanulási előrehaladás követése**: Használd ezt a strukturált útmutatót az Azure Developer CLI gyakorlati, fokozatos elsajátításához mérhető eredményekkel és szakmai fejlődési előnyökkel.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->