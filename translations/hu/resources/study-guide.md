# Tanulmányi Útmutató - Átfogó Tanulási Célok

**Tanulási Útvonal Navigáció**
- **📚 Tanfolyam Kezdőlapja**: [AZD Kezdőknek](../README.md)
- **📖 Tanulás Megkezdése**: [1. fejezet: Alapok és Gyors Kezdés](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Haladás Követése**: [Tanfolyam Befejezése](../README.md#-course-completion--certification)

## Bevezetés

Ez az átfogó tanulmányi útmutató strukturált tanulási célokat, kulcsfontosságú fogalmakat, gyakorlati feladatokat és értékelési anyagokat nyújt, hogy segítsen elsajátítani az Azure Developer CLI (azd) használatát. Használd ezt az útmutatót a haladásod nyomon követésére és annak biztosítására, hogy minden lényeges témakört lefedtél.

## Tanulási Célok

Ennek a tanulmányi útmutatónak a teljesítésével:
- Mesteri szinten elsajátítod az Azure Developer CLI alapvető és fejlett fogalmait
- Gyakorlati készségeket fejlesztesz Azure alkalmazások telepítésében és kezelésében
- Magabiztosságot építesz ki hibakeresésben és telepítések optimalizálásában
- Megérted a produkcióra készen álló telepítési gyakorlatokat és biztonsági szempontokat

## Tanulási Eredmények

A tanulmányi útmutató összes fejezetének befejezése után képes leszel:
- Teljes alkalmazásarchitektúrákat tervezni, telepíteni és kezelni az azd segítségével
- Átfogó monitorozási, biztonsági és költségoptimalizálási stratégiákat megvalósítani
- Önállóan hibakeresni komplex telepítési problémákat
- Egyedi sablonokat készíteni és hozzájárulni az azd közösséghez

## 8-fejezetes Tanulási Struktúra

### 1. fejezet: Alapok és Gyors Kezdés (1. hét)
**Időtartam**: 30-45 perc | **Bonyolultság**: ⭐

#### Tanulási Célok
- Megérteni az Azure Developer CLI alapfogalmait és terminológiáját
- Sikeresen telepíteni és konfigurálni az AZD-t fejlesztői platformodon
- Első alkalmazásodat telepíteni meglévő sablon alapján
- Hatékonyan navigálni az AZD parancssori felületén

#### Megtanulandó Kulcsfogalmak
- AZD projekt struktúrája és komponensei (azure.yaml, infra/, src/)
- Sablonalapú telepítési munkafolyamatok
- Környezet-konfiguráció alapjai
- Erőforrás csoport és előfizetés kezelése

#### Gyakorlati Feladatok
1. **Telepítés Ellenőrzése**: Telepítsd az AZD-t és ellenőrizd `azd version`-val
2. **Első Telepítés**: Telepítsd sikeresen a todo-nodejs-mongo sablont
3. **Környezeti Beállítás**: Állítsd be első környezeti változóidat
4. **Erőforrás Felfedezés**: Böngéssz a telepített erőforrások között az Azure Portalban

#### Értékelő Kérdések
- Mik az AZD projekt legfontosabb összetevői?
- Hogyan inicializálsz új projektet sablonból?
- Mi a különbség `azd up` és `azd deploy` között?
- Hogyan kezeled az AZD-vel a több környezetet?

---

### 2. fejezet: AI-Előfejlesztés (2. hét)
**Időtartam**: 1-2 óra | **Bonyolultság**: ⭐⭐

#### Tanulási Célok
- Integráld a Microsoft Foundry szolgáltatásokat az AZD munkafolyamatokba
- Telepíts és konfigurálj AI-alapú alkalmazásokat
- Értsd meg a RAG (Retrieval-Augmented Generation) megvalósítási mintáit
- Kezeld az AI modell telepítéseket és skálázást

#### Megtanulandó Kulcsfogalmak
- Microsoft Foundry Models szolgáltatás integrációja és API-kezelés
- AI keresés konfiguráció és vektorindexelés
- Modell telepítési stratégiák és kapacitástervezés
- AI alkalmazás monitorozás és teljesítményoptimalizálás

#### Gyakorlati Feladatok
1. **AI Chat Telepítés**: Telepítsd az azure-search-openai-demo sablont
2. **RAG Megvalósítás**: Konfiguráld a dokumentum indexelést és lekérést
3. **Modell Konfiguráció**: Állíts be több AI modellt különböző célokra
4. **AI Monitorozás**: Valósítsd meg az Application Insights-ot AI munkaterhelésekhez

#### Értékelő Kérdések
- Hogyan konfigurálod a Microsoft Foundry Models szolgáltatásokat egy AZD sablonban?
- Mik a RAG architektúra kulcsfontosságú komponensei?
- Hogyan kezeled az AI modell kapacitást és skálázást?
- Milyen monitorozási metrikák fontosak AI alkalmazásoknál?

---

### 3. fejezet: Konfiguráció és Hitelesítés (3. hét)
**Időtartam**: 45-60 perc | **Bonyolultság**: ⭐⭐

#### Tanulási Célok
- Sajátítsd el a környezet-konfiguráció és kezelés stratégiáit
- Valósíts meg biztonságos hitelesítési mintákat és kezelt identitást
- Szervezd meg az erőforrásokat megfelelő elnevezési szabályok szerint
- Konfiguráld a többkörnyezetes telepítéseket (fejlesztés, staging, éles)

#### Megtanulandó Kulcsfogalmak
- Környezet-hierarchia és konfigurációs prioritások
- Kezelt identitás és szolgáltatási alany hitelesítés
- Key Vault integráció titkok kezeléséhez
- Környezet-specifikus paraméterkezelés

#### Gyakorlati Feladatok
1. **Többkörnyezetes Beállítás**: Állítsd be a fejlesztési, staging és éles környezeteket
2. **Biztonsági Konfiguráció**: Valósíts meg kezelt identitás alapú hitelesítést
3. **Titokkezelés**: Integráld az Azure Key Vaultot érzékeny adatokhoz
4. **Paraméterkezelés**: Készíts környezet-specifikus konfigurációkat

#### Értékelő Kérdések
- Hogyan konfigurálsz különböző környezeteket az AZD-vel?
- Milyen előnyei vannak a kezelt identitásnak a szolgáltatási alanyokkal szemben?
- Hogyan kezeled biztonságosan az alkalmazás titkait?
- Mi a konfiguráció hierarchiája az AZD-ben?

---

### 4. fejezet: Infrastruktúra Kódként & Telepítés (4-5. hét)
**Időtartam**: 1-1,5 óra | **Bonyolultság**: ⭐⭐⭐

#### Tanulási Célok
- Hozz létre és testreszabj Bicep infrastruktúra sablonokat
- Alkalmazz fejlett telepítési mintákat és munkafolyamatokat
- Értsd meg az erőforrás-kihelyezési stratégiákat
- Tervezzen skálázható, több szolgáltatásos architektúrákat

- Telepíts konténerizált alkalmazásokat Azure Container Apps és AZD segítségével


#### Megtanulandó Kulcsfogalmak
- Bicep sablon szerkezete és bevált gyakorlatok
- Erőforrás függőségek és telepítési sorrendek
- Paraméter fájlok és sablon modularitás
- Egyedi hook-ok és telepítés automatizálás
- Konténer alkalmazás telepítési minták (gyors kezdés, produkció, mikroszolgáltatások)

#### Gyakorlati Feladatok
1. **Egyedi Sablon Készítés**: Építs több szolgáltatásos alkalmazás sablont
2. **Bicep Mesterképzés**: Készíts moduláris, újrahasználható infrastruktúra komponenseket
3. **Telepítés Automatizálás**: Valósíts meg elő- és utótelepítési hook-okat
4. **Architektúra Tervezés**: Telepíts összetett mikroszolgáltatás architektúrát
5. **Konténer Alkalmazás Telepítés**: Telepítsd a [Simple Flask API](../../../examples/container-app/simple-flask-api) és [Microservices Architecture](../../../examples/container-app/microservices) példákat AZD-vel

#### Értékelő Kérdések
- Hogyan készítesz egyedi Bicep sablonokat az AZD számára?
- Mik az infrastruktúra kód szervezésének legjobb gyakorlatai?
- Hogyan kezeled az erőforrás függőségeket a sablonokban?
- Milyen telepítési minták támogatják a zéró leállásos frissítéseket?

---

### 5. fejezet: Többügynökös AI Megoldások (6-7. hét)
**Időtartam**: 2-3 óra | **Bonyolultság**: ⭐⭐⭐⭐

#### Tanulási Célok
- Tervezd és valósítsd meg többügynökös AI architektúrákat
- Koordináld az ügynökök együttműködését és kommunikációját
- Telepíts produkcióra készen álló AI megoldásokat monitorozással
- Értsd meg az ügynök specializációkat és munkafolyamat mintákat
- Integráld a konténerizált mikroszolgáltatásokat többügynökös megoldások részeként

#### Megtanulandó Kulcsfogalmak
- Többügynökös architektúra minták és tervezési alapelvek
- Ügynök kommunikációs protokollok és adatfolyamok
- Terheléselosztás és skálázási stratégiák AI ügynökök számára
- Produkciós monitorozás többügynökös rendszerekhez
- Szolgáltatás-szolgáltatás közti kommunikáció konténerizált környezetekben

#### Gyakorlati Feladatok
1. **Kiskereskedelmi Architektúra Áttekintés**: Elemezd az üzleti tervet és azonosítsd, mely alkalmazás komponenseket kell megvalósítani a telepítés előtt
2. **Ügynök Testreszabás**: Módosítsd az Ügyfél és Raktár ügynök viselkedését
3. **Architektúra Skálázás**: Valósíts meg terheléselosztást és automatikus skálázást
4. **Produkciós Monitorozás**: Állíts be átfogó monitorozást és riasztásokat
5. **Mikroszolgáltatások Integrációja**: Bővítsd a [Microservices Architecture](../../../examples/container-app/microservices) példát ügynök-alapú munkafolyamatok támogatására

#### Értékelő Kérdések
- Hogyan tervezz hatékony többügynökös kommunikációs mintákat?
- Mik a kulcsfontosságú szempontok AI ügynök munka terhelések skálázásakor?
- Hogyan monitorozod és hibakeresed többügynökös AI rendszereket?
- Milyen produkciós minták biztosítanak megbízhatóságot AI ügynökök számára?

---

### 6. fejezet: Előtelepítési Ellenőrzés és Tervezés (8. hét)
**Időtartam**: 1 óra | **Bonyolultság**: ⭐⭐

#### Tanulási Célok
- Végezz átfogó kapacitástervezést és erőforrás validációt
- Válaszd ki az optimális Azure SKU-kat költséghatékonyság érdekében
- Valósíts meg automatizált előtelepítési ellenőrzéseket
- Tervezd meg a telepítéseket költségoptimalizálási stratégiákkal

#### Megtanulandó Kulcsfogalmak
- Azure erőforrás kvóták és kapacitáskorlátok
- SKU kiválasztási szempontok és költségoptimalizálás
- Automatizált validációs szkriptek és tesztelés
- Telepítési tervezés és kockázatértékelés

#### Gyakorlati Feladatok
1. **Kapacitás Elemzés**: Elemezd az alkalmazásaid erőforrás igényeit
2. **SKU Optimalizálás**: Hasonlítsd össze és válaszd ki a költséghatékony szolgáltatási szinteket
3. **Validáció Automatizálás**: Valósíts meg előtelepítési ellenőrző szkripteket
4. **Költségtervezés**: Készíts telepítési költségbecsléseket és költségvetést

#### Értékelő Kérdések
- Hogyan validálod az Azure kapacitását telepítés előtt?
- Mely tényezők befolyásolják az SKU kiválasztási döntéseket?
- Hogyan automatizálod az előtelepítési validációt?
- Milyen stratégiák segítik a telepítési költségek optimalizálását?

---

### 7. fejezet: Hibakeresés és Hibajavítás (9. hét)
**Időtartam**: 1-1,5 óra | **Bonyolultság**: ⭐⭐

#### Tanulási Célok
- Fejleszd ki a rendszerezett hibakeresési megközelítéseket AZD telepítésekhez
- Oldj meg gyakori telepítési és konfigurációs problémákat
- Hibakeresd az AI-specifikus problémákat és teljesítmény gondokat
- Valósíts meg monitorozást és riasztást a proaktív hibafelismeréshez

#### Megtanulandó Kulcsfogalmak
- Diagnosztikai technikák és naplózási stratégiák
- Gyakori hibaminták és megoldásaik
- Teljesítmény monitorozás és optimalizálás
- Eseménykezelési és helyreállítási eljárások

#### Gyakorlati Feladatok
1. **Diagnosztikai Készségek**: Gyakorolj szándékosan hibás telepítésekkel
2. **Naplóelemzés**: Használd hatékonyan az Azure Monitor és Application Insights eszközöket
3. **Teljesítmény Hangolás**: Optimalizáld a lassú alkalmazásokat
4. **Helyreállítási Eljárások**: Valósíts meg mentési és katasztrófa-helyreállítási folyamatokat

#### Értékelő Kérdések
- Mik a leggyakoribb AZD telepítési hibák?
- Hogyan hibakeresel hitelesítési és jogosultsági problémákat?
- Milyen monitorozási stratégiák segítenek elkerülni a produkciós hibákat?
- Hogyan optimalizálod az alkalmazás teljesítményét az Azure-ban?

---

### 8. fejezet: Produkciós és Vállalati Minták (10-11. hét)
**Időtartam**: 2-3 óra | **Bonyolultság**: ⭐⭐⭐⭐

#### Tanulási Célok
- Valósíts meg vállalati szintű telepítési stratégiákat
- Tervezd meg a biztonsági mintákat és megfelelőségi keretrendszereket
- Alakíts ki monitorozási, irányítási és költségmenedzsment megoldásokat
- Hozz létre skálázható CI/CD folyamatokat AZD integrációval
- Alkalmazd a legjobb gyakorlatokat produkciós konténeralkalmazás telepítésekhez (biztonság, monitorozás, költség, CI/CD)

#### Megtanulandó Kulcsfogalmak
- Vállalati biztonsági és megfelelőségi követelmények
- Irányítási keretrendszerek és szabályzat végrehajtása
- Fejlett monitorozás és költségmenedzsment
- CI/CD integráció és automatizált telepítési folyamatok
- Blue-green és canary telepítési stratégiák konténerizált rendszerekhez

#### Gyakorlati Feladatok
1. **Vállalati Biztonság**: Valósíts meg átfogó biztonsági mintákat
2. **Irányítási Keretrendszer**: Állíts be Azure Policy-t és erőforrás kezelést
3. **Fejlett Monitorozás**: Készíts műszerfalakat és automatizált riasztásokat
4. **CI/CD Integráció**: Építs automatizált telepítési csővezetékeket
5. **Produkciós Konténeralkalmazások**: Alkalmazd a biztonságot, monitorozást és költségoptimalizálást a [Microservices Architecture](../../../examples/container-app/microservices) példán

#### Értékelő Kérdések
- Hogyan valósítod meg a vállalati szintű biztonságot AZD telepítésekben?
- Milyen irányítási minták biztosítják a megfelelőséget és költségkontrollt?
- Hogyan tervezz skálázható monitorozást produkciós rendszerekhez?
- Milyen CI/CD minták működnek legjobban az AZD munkafolyamatokkal?

#### Tanulási Célok
- Értsd meg az Azure Developer CLI alapjait és főbb fogalmait
- Sikeresen telepítsd és konfiguráld az azd-t fejlesztői környezetedben
- Hajtsd végre első telepítésed meglévő sablon alapján
- Navigáld az azd projekt szerkezetét és értsd meg a kulcskomponenseket

#### Megtanulandó Kulcsfogalmak
- Sablonok, környezetek és szolgáltatások
- azure.yaml konfigurációs szerkezet
- Alapvető azd parancsok (init, up, down, deploy)
- Infrastruktúra kódjaként elvek
- Azure hitelesítés és jogosultság kezelés

#### Gyakorlati Feladatok

**1.1. Gyakorlat: Telepítés és Beállítás**
```text
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI only for exercises or template hooks that explicitly use `az`; authenticate AZD independently
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**1.2. Gyakorlat: Első Telepítés**
```text
# Deploy a simple web application:
1. Initialize project in an empty directory: azd init --template todo-nodejs-mongo .
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**1.3. Gyakorlat: Projekt Szerkezet Elemzés**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### Önértékelő Kérdések
1. Mik az azd architektúra három kulcskoncepciója?
2. Mi az azure.yaml fájl célja?
3. Hogyan segítenek a környezetek különböző telepítési célpontok kezelésében?
4. Milyen hitelesítési módszerek használhatók az azd-vel?
5. Mi történik, amikor első alkalommal futtatod a `azd up` parancsot?

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

**2.2. Gyakorlat: Fejlett Konfiguráció**
```text
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**2.3. Gyakorlat: Biztonsági Konfiguráció**
```text
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Önértékelő Kérdések
1. Hogyan kezeli az azd a környezeti változók prioritását?
2. Mik a telepítési hook-ok, és mikor kell őket használni?
3. Hogyan konfigurálhatók különböző SKU-k különböző környezetekhez?
4. Milyen biztonsági következményei vannak a különböző hitelesítési módszereknek?
5. Hogyan kezeled a titkokat és érzékeny konfigurációs adatokat?

### 3. modul: Telepítés és Kihelyezés (4. hét)

#### Tanulási Célok
- Sajátítsd el a telepítési munkafolyamatokat és bevált gyakorlatokat
- Értsd meg az Infrastruktúrát Kódként Bicep sablonokkal
- Valósíts meg összetett több szolgáltatásos architektúrákat
- Optimalizáld a telepítés teljesítményét és megbízhatóságát

#### Megtanulandó Kulcsfogalmak
- Bicep sablon szerkezet és modulok
- Erőforrás függőségek és sorrendezés
- Telepítési stratégiák (blue-green, gördülő frissítések)
- Több régiós telepítések
- Adatbázis migrációk és adatkezelés

#### Gyakorlati Feladatok

**3.1. Gyakorlat: Egyedi Infrastruktúra**
```text
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**3.2. Gyakorlat: Több szolgáltatásos Alkalmazás**
```text
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**3.3. Gyakorlat: Adatbázis Integráció**
```text
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Önértékelő Kérdések
1. Mik az előnyei a Bicep használatának az ARM sablonokkal szemben?
2. Hogyan kezeled az adatbázis migrációkat az azd telepítések során?
3. Milyen stratégiák léteznek a zéró leállásos telepítésekhez?
4. Hogyan kezeled a szolgáltatások közötti függőségeket?
5. Milyen szempontokat kell figyelembe venni a több régiós telepítéseknél?

### 4. modul: Előtelepítési Validáció (5. hét)

#### Tanulási Célok
- Átfogó előtelepítési ellenőrzések végrehajtása
- Kapacitástervezés és erőforrás-validáció elsajátítása
- SKU kiválasztás és költségoptimalizálás megértése
- Automatizált validációs folyamatok kiépítése

#### Fontos fogalmak elsajátítása
- Azure erőforrás kvóták és korlátok
- SKU kiválasztási kritériumok és költséghatások
- Automatizált validációs szkriptek és eszközök
- Kapacitástervezési módszertanok
- Teljesítmény tesztelés és optimalizálás

#### Gyakorlati feladatok

**4.1. gyakorlat: Kapacitástervezés**
```text
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**4.2. gyakorlat: Előtelepítési validáció**
```text
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**4.3. gyakorlat: SKU optimalizálás**
```text
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Önálló értékelő kérdések
1. Milyen tényezők befolyásolják a SKU kiválasztás döntéseit?
2. Hogyan validálod az Azure erőforrások rendelkezésre állását telepítés előtt?
3. Mik az előtelepítési ellenőrzőrendszer kulcselemei?
4. Hogyan becsülöd és szabályozod a telepítési költségeket?
5. Milyen monitorozás elengedhetetlen a kapacitástervezéshez?

### 5. modul: Hibakeresés és hibajavítás (6. hét)

#### Tanulási célok
- A szisztematikus hibakeresési módszertanok elsajátítása
- Tapasztalat a bonyolult telepítési problémák hibajavításában
- Átfogó monitorozás és riasztás megvalósítása
- Esetkezelési és helyreállítási eljárások kidolgozása

#### Fontos fogalmak elsajátítása
- Gyakori telepítési hibaminták
- Naplóelemzési és korrelációs technikák
- Teljesítmény monitorozás és optimalizálás
- Biztonsági események észlelése és kezelése
- Katasztrófa utáni helyreállítás és üzletmenet-folytonosság

#### Gyakorlati feladatok

**5.1. gyakorlat: Hibakeresési forgatókönyvek**
```text
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**5.2. gyakorlat: Monitorozás megvalósítása**
```text
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**5.3. gyakorlat: Esetkezelés**
```text
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Önálló értékelő kérdések
1. Mi a szisztematikus megközelítés az azd telepítések hibakereséséhez?
2. Hogyan kösd össze a naplókat több szolgáltatás és erőforrás között?
3. Mely monitorozási mutatók kritikusak a korai problémafelismeréshez?
4. Hogyan valósítasz meg hatékony katasztrófa helyreállítási eljárásokat?
5. Mik az eseti reagálási terv kulcs elemei?

### 6. modul: Haladó témák és legjobb gyakorlatok (7-8. hét)

#### Tanulási célok
- Vállalati szintű telepítési minták megvalósítása
- CI/CD integráció és automatizálás elsajátítása
- Egyedi sablonok fejlesztése és közösségi hozzájárulás
- Haladó biztonsági és megfelelőségi követelmények megértése

#### Fontos fogalmak elsajátítása
- CI/CD folyamatok integrációs mintái
- Egyedi sablon fejlesztés és terjesztés
- Vállalati irányítás és megfelelőség
- Haladó hálózati és biztonsági konfigurációk
- Teljesítmény optimalizálás és költséggazdálkodás

#### Gyakorlati feladatok

**6.1. gyakorlat: CI/CD integráció**
```text
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**6.2. gyakorlat: Egyedi sablon fejlesztése**
```text
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**6.3. gyakorlat: Vállalati megvalósítás**
```text
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Önálló értékelő kérdések
1. Hogyan integrálod az azd-t meglévő CI/CD munkafolyamatokba?
2. Mik az egyedi sablon fejlesztés fontos szempontjai?
3. Hogyan valósítod meg az irányítás és megfelelőség szabályait az azd telepítésekben?
4. Mik a legjobb gyakorlatok vállalati szintű telepítésekhez?
5. Hogyan járulsz hozzá hatékonyan az azd közösséghez?

## Gyakorlati projektek

### 1. projekt: Személyes portfólió weboldal
**Komplexitás**: Kezdő  
**Időtartam**: 1-2 hét

Készíts és telepíts személyes portfólió weboldalt a következőkkel:
- Statikus weboldal hosting Azure Storage-on
- Egyedi domain konfiguráció
- CDN integrálása globális teljesítményhez
- Automatizált telepítési folyamat

**Eredmények**:
- Működő weboldal Azure-on
- Egyedi azd sablon portfólió telepítésekhez
- Telepítési folyamat dokumentálása
- Költségelemzés és optimalizálási javaslatok

### 2. projekt: Feladatkezelő alkalmazás
**Komplexitás**: Középhaladó  
**Időtartam**: 2-3 hét

Készíts full-stack feladatkezelő alkalmazást a következőkkel:
- React frontend App Service-re telepítve
- Node.js API backend hitelesítéssel
- PostgreSQL adatbázis migrációkkal
- Application Insights monitorozással

**Eredmények**:
- Teljes alkalmazás felhasználóhitelesítéssel
- Adatbázis séma és migrációs szkriptek
- Monitorozó irányítópultok és riasztási szabályok
- Többszörös környezetek telepítési konfigurációja

### 3. projekt: Mikroservices e-kereskedelmi platform
**Komplexitás**: Haladó  
**Időtartam**: 4-6 hét

Tervezd és valósítsd meg mikroservices alapú e-kereskedelmi platformot:
- Több API szolgáltatás (katalógus, rendelések, fizetés, felhasználók)
- Üzenetsor integráció Service Bus-szal
- Redis cache teljesítmény optimalizáláshoz
- Átfogó naplózás és monitorozás

**Referencia példa**: Lásd [Microservices Architecture](../../../examples/container-app/microservices) két szolgáltatásos tanulási példát és telepítési útmutatót. Sorok, perzisztencia, hitelesítés, fizetésfeldolgozás és éles környezetbe állítás külön projekt.

**Eredmények**:
- Teljes mikroservices architektúra
- Szolgáltatások közötti kommunikációs minták
- Teljesítmény tesztelés és optimalizálás
- Éles biztonsági megvalósítás

## Értékelés és tanúsítás

### Tudásellenőrzések

Ezeket az értékeléseket minden modul után végezd el:

**1. modul értékelés**: Alapfogalmak és telepítés
- Többválasztós kérdések a kulcsfogalmakról
- Gyakorlati telepítési és konfigurációs feladatok
- Egyszerű telepítési gyakorlat

**2. modul értékelés**: Konfiguráció és környezetek
- Környezetkezelési forgatókönyvek
- Konfigurációs hibakereső feladatok
- Biztonsági konfiguráció megvalósítása

**3. modul értékelés**: Telepítés és előkészítés
- Infrastruktúra tervezési kihívások
- Többszolgáltatásos telepítési forgatókönyvek
- Teljesítmény optimalizálási feladatok

**4. modul értékelés**: Előtelepítési validáció
- Kapacitástervezési esettanulmányok
- Költségoptimalizálási forgatókönyvek
- Validációs pipeline megvalósítása

**5. modul értékelés**: Hibakeresés és hibajavítás
- Probléma diagnosztikai gyakorlatok
- Monitorozási megvalósítási feladatok
- Esetkezelési szimulációk

**6. modul értékelés**: Haladó témák
- CI/CD folyamat tervezés
- Egyedi sablon fejlesztés
- Vállalati architektúra forgatókönyvek

### Záró projekt

Tervezd és valósíts meg egy teljes megoldást, amely minden fogalmat bemutat az alábbiak szerint:

**Követelmények**:
- Többrétegű alkalmazás architektúra
- Több telepítési környezet
- Átfogó monitorozás és riasztás
- Biztonság- és megfelelőség megvalósítás
- Költségoptimalizálás és teljesítményhangolás
- Teljes dokumentáció és üzemeltetési leírások

**Értékelési szempontok**:
- Műszaki megvalósítás minősége
- Dokumentáció teljessége
- Biztonság és legjobb gyakorlatok betartása
- Teljesítmény és költségoptimalizálás
- Hibakeresés és monitorozás hatékonysága

## Tanulási erőforrások és hivatkozások

### Hivatalos dokumentáció
- [Azure Developer CLI dokumentáció](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep dokumentáció](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Közösségi erőforrások
- [AZD sablongaléria](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub szervezet](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHub tároló](https://github.com/Azure/azure-dev)

### Gyakorló környezetek
- [Azure ingyenes fiók](https://azure.microsoft.com/free/)
- [Azure DevOps ingyenes szint](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### Egyéb eszközök
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Tanulási ütemterv ajánlások

### Teljes munkaidős tanulás (8 hét)
- **1-2. hét**: 1-2. modulok (Első lépések, konfiguráció)
- **3-4. hét**: 3-4. modulok (Telepítés, előtelepítés)
- **5-6. hét**: 5-6. modulok (Hibakeresés, haladó témák)
- **7-8. hét**: Gyakorlati projektek és záró értékelés

### Részmunkaidős tanulás (16 hét)
- **1-4. hét**: 1. modul (Első lépések)
- **5-7. hét**: 2. modul (Konfiguráció és környezetek)
- **8-10. hét**: 3. modul (Telepítés és előkészítés)
- **11-12. hét**: 4. modul (Előtelepítési validáció)
- **13-14. hét**: 5. modul (Hibakeresés és hibajavítás)
- **15-16. hét**: 6. modul (Haladó témák és értékelés)

---

## Előrehaladás követése és értékelési keretrendszer

### Fejezet teljesítési ellenőrzőlista

Kövesd nyomon előrehaladásodat minden fejezetben ezekkel a mérhető eredményekkel:

#### 📚 1. fejezet: Alapok és gyors kezdés
- [ ] **Telepítés befejezve**: Az AZD telepítve és ellenőrizve a platformodon
- [ ] **Első telepítés**: Sikeresen telepítetted a todo-nodejs-mongo sablont
- [ ] **Környezeti beállítás**: Első környezeti változók konfigurálva
- [ ] **Erőforrások böngészése**: Feltérképezted az Azure Portálon a telepített erőforrásokat
- [ ] **Parancsok elsajátítása**: Magabiztos vagy az alap AZD parancsokban

#### 🤖 2. fejezet: AI-első fejlesztés  
- [ ] **AI sablon telepítés**: Sikeresen telepítetted az azure-search-openai-demo-t
- [ ] **RAG megvalósítás**: Dokumentumindexelés és lekérdezés beállítása
- [ ] **Modell konfiguráció**: Több AI modell beállítása különböző célokra
- [ ] **AI monitorozás**: Application Insights implementálása AI munkaterhelésekhez
- [ ] **Teljesítmény optimalizálás**: AI alkalmazás hangolása

#### ⚙️ 3. fejezet: Konfiguráció és hitelesítés
- [ ] **Többkörnyezeti beállítás**: Fejlesztői, teszt és éles környezet konfigurálása
- [ ] **Biztonsági megvalósítás**: Felügyelt identitás hitelesítés beállítása
- [ ] **Titkok kezelése**: Azure Key Vault integrálása érzékeny adatokhoz
- [ ] **Paraméter kezelése**: Környezetspecifikus konfigurációk létrehozása
- [ ] **Hitelesítés elsajátítása**: Biztonságos hozzáférési minták megvalósítása

#### 🏗️ 4. fejezet: Infrastruktúra kódként és telepítés
- [ ] **Egyedi sablon létrehozása**: Többszolgáltatásos alkalmazás sablon építése
- [ ] **Bicep elsajátítása**: Moduláris, újrahasználható infrastruktúra komponensek létrehozása
- [ ] **Telepítési automatizálás**: Elő- és utótelepítési horgok megvalósítása
- [ ] **Architektúra tervezés**: Összetett mikroservices architektúra telepítése
- [ ] **Sablon optimalizáció**: Teljesítmény és költség optimalizált sablonok

#### 🎯 5. fejezet: Többügynökös AI megoldások
- [ ] **Kiskereskedelmi architektúra áttekintése**: Hiányzó alkalmazáskomponensek azonosítása és megvalósításuk, validációjuk megtervezése
- [ ] **Agent testreszabás**: Ügyfél és készlet kezelő agent viselkedésének módosítása
- [ ] **Architektúra skálázás**: Terheléselosztás és automatikus skálázás megvalósítása
- [ ] **Éles monitorozás**: Átfogó monitorozás és riasztás beállítása
- [ ] **Teljesítményhangolás**: Többügynökös rendszer teljesítményoptimalizálása

#### 🔍 6. fejezet: Előtelepítési validáció és tervezés
- [ ] **Kapacitáselemzés**: Alkalmazások erőforrásigényének elemzése
- [ ] **SKU optimalizálás**: Költséghatékony szolgáltatási szintek kiválasztása
- [ ] **Validáció automatizálás**: Előtelepítési ellenőrző szkriptek megvalósítása
- [ ] **Költségtervezés**: Telepítési költségbecslések és költségvetések készítése
- [ ] **Kockázatértékelés**: Telepítési kockázatok azonosítása és csökkentése

#### 🚨 7. fejezet: Hibakeresés és hibajavítás
- [ ] **Diagnosztikai készségek**: Szándékosan hibás telepítések sikeres hibakeresése
- [ ] **Naplóelemzés**: Azure Monitor és Application Insights hatékony használata
- [ ] **Teljesítményhangolás**: Lassú alkalmazások optimalizálása
- [ ] **Helyreállítási eljárások**: Biztonsági mentés és katasztrófa helyreállítás megvalósítása
- [ ] **Monitorozási beállítás**: Proaktív monitorozás és riasztás kialakítása

#### 🏢 8. fejezet: Éles és vállalati minták
- [ ] **Vállalati biztonság**: Átfogó biztonsági minták megvalósítása
- [ ] **Irányítási keretrendszer**: Azure Policy és erőforrás menedzsment beállítása
- [ ] **Haladó monitorozás**: Irányítópultok és automatizált riasztások létrehozása
- [ ] **CI/CD integráció**: Automatizált telepítési folyamatok kiépítése
- [ ] **Megfelelés megvalósítása**: Vállalati megfelelőségi követelmények teljesítése

### Tanulási ütemterv és mérföldkövek

#### 1-2. hét: Alapok megteremtése
- **Mérföldkő**: Az első AI alkalmazás telepítése AZD-vel
- **Ellenőrzés**: Működő alkalmazás elérhető nyilvános URL-en
- **Készségek**: Alap AZD munkafolyamatok és AI szolgáltatás integráció

#### 3-4. hét: Konfigurációs mesterfogás
- **Mérföldkő**: Többkörnyezeti telepítés biztonságos hitelesítéssel
- **Ellenőrzés**: Ugyanaz az alkalmazás telepítve dev/staging/prod környezetekben
- **Készségek**: Környezet kezelés és biztonsági megvalósítás

#### 5-6. hét: Infrastruktúra szakértői szint
- **Mérföldkő**: Egyedi sablon komplex többszolgáltatásos alkalmazáshoz
- **Ellenőrzés**: Újrahasználható sablont más csapattag is telepíti
- **Készségek**: Bicep elsajátítása és infrastruktúra automatizálás

#### 7-8. hét: Haladó AI megvalósítás
- **Mérföldkő**: Élesre kész többügynökös AI megoldás
- **Ellenőrzés**: Rendszer képes valós terhelés kezelésére monitorozással
- **Készségek**: Többügynökös koordináció és teljesítmény optimalizálás

#### 9-10. hét: Éles üzemre felkészülés
- **Mérföldkő**: Vállalati szintű telepítés teljes megfelelőséggel
- **Ellenőrzés**: Biztonsági ellenőrzést és költségoptimalizálási auditot teljesít
- **Készségek**: Irányítás, monitorozás és CI/CD integráció

### Értékelés és tanúsítás

#### Tudás validációs módszerek
1. **Gyakorlati telepítések**: Minden fejezethez működő alkalmazások
2. **Kódáttekintések**: Sablonok és konfiguráció minőség-ellenőrzése
3. **Problémamegoldás**: Hibakeresési forgatókönyvek és megoldások
4. **Társak oktatása**: Fogalmak magyarázata más tanulóknak
5. **Közösségi hozzájárulás**: Sablonok vagy fejlesztések megosztása

#### Szakmai fejlődési eredmények
- **Portfólió projektek**: Tanuló telepítések és architektúra gyakorlatok; éles üzemhez külön megvalósítás és felülvizsgálat szükséges
- **Műszaki készségek**: Iparági szintű AZD és AI telepítési szakértelem
- **Problémamegoldó képességek**: Önálló hibakeresés és optimalizálás
- **Közösségi elismerés**: Aktív részvétel az Azure fejlesztői közösségben
- **Karrierfejlesztés**: Közvetlenül a felhő- és AI szerepkörökre alkalmazható készségek

#### Sikermutatók
- **Telepítési sikerráta**: >95%-os sikeres telepítések
- **Hibakeresési idő**: <30 perc a gyakori problémákra
- **Teljesítményoptimalizálás**: Költség- és teljesítményjavulások bemutatása
- **Biztonsági áttekintés**: Dokumentált ellenőrzések és a szervezet követelményeihez képesti fennmaradó hiányosságok; a tanfolyam elvégzése nem minősül megfelelőségi igazolásnak
- **Tudás átadása**: Képesség más fejlesztők mentorálására

### Folyamatos tanulás és közösségi részvétel

#### Legyél naprakész
- **Azure frissítések**: Kövesd az Azure Developer CLI kiadási jegyzeteit
- **Közösségi események**: Vegyél részt Azure és AI fejlesztői eseményeken
- **Dokumentáció**: Adj hozzá közösségi dokumentációkat és példákat
- **Visszacsatolási kör**: Adj visszajelzést a tanfolyam tartalmáról és az Azure szolgáltatásokról

#### Karrierfejlesztés
- **Szakmai hálózat**: Kapcsolódj Azure és AI szakértőkhöz
- **Előadási lehetőségek**: Mutasd be tanulmányaidat konferenciákon vagy meetupokon
- **Nyílt forráskódú hozzájárulás**: Adj hozzá AZD sablonokhoz és eszközökhöz
- **Mentorálás**: Vezess más fejlesztőket AZD tanulmányaik során

---

**Fejezet navigáció:**
- **📚 Tanfolyam kezdőlapja**: [AZD kezdőknek](../README.md)
- **📖 Tanulás megkezdése**: [1. fejezet: Alapok és gyors kezdés](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Haladás nyomon követése**: Kövesd előrehaladásod a kiterjedt, 8 fejezetből álló tanulási rendszerben
- **🤝 Közösség**: [Azure Discord](https://discord.gg/microsoft-azure) támogatásért és vitákért

**Tanulási előrehaladás követése**: Használd ezt a strukturált útmutatót az Azure Developer CLI gyakorlati, fokozatos elsajátításához, mérhető eredményekkel és szakmai fejlődési előnyökkel.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->