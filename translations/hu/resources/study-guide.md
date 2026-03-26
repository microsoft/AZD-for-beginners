# Tanulmányi útmutató - Átfogó tanulási célok

**Tanulási útvonal navigáció**
- **📚 Tanfolyam kezdőlap**: [AZD Kezdőknek](../README.md)
- **📖 Tanulás indítása**: [1. fejezet: Alapok és gyors kezdés](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Előrehaladás nyomon követése**: [Tanfolyam befejezése](../README.md#-course-completion--certification)

## Bevezetés

Ez az átfogó tanulmányi útmutató strukturált tanulási célokat, kulcsfogalmakat, gyakorlati feladatokat és értékelési anyagokat biztosít, hogy segítsen elsajátítani az Azure Developer CLI (azd) használatát. Használd ezt az útmutatót előrehaladásod nyomon követésére és annak biztosítására, hogy lefedj minden lényeges témát.

## Tanulási célok

A tanulmányi útmutató elvégzésével:
- Elsajátítod az Azure Developer CLI alap- és haladó fogalmait
- Gyakorlati készségeket fejlesztesz Azure alkalmazások telepítésében és kezelésében
- Magabiztosságot szerzel a hibakeresés és telepítések optimalizálása terén
- Megérted a gyártásra kész telepítési gyakorlatokat és biztonsági szempontokat

## Tanulási eredmények

A tanulmányi útmutató minden szakaszának elvégzése után képes leszel:
- Teljes alkalmazásarchitektúrákat tervezni, telepíteni és kezelni az azd segítségével
- Átfogó monitorozási, biztonsági és költségoptimalizálási stratégiákat alkalmazni
- Önállóan hibakeresni összetett telepítési problémákat
- Egyedi sablonokat készíteni és hozzájárulni az azd közösséghez

## 8 fejezetes tanulási struktúra

### 1. fejezet: Alapok és gyors kezdés (1. hét)
**Időtartam**: 30-45 perc | **Nehézség**: ⭐

#### Tanulási célok
- Megérteni az Azure Developer CLI alapfogalmait és terminológiáját
- Sikeresen telepíteni és konfigurálni az AZD-t a fejlesztői platformodon
- Első alkalmazásodat telepíteni meglévő sablon használatával
- Hatékonyan navigálni az AZD parancssori interfészen

#### Elsajátítandó kulcsfogalmak
- AZD projekt struktúrája és elemei (azure.yaml, infra/, src/)
- Sablonalapú telepítési munkafolyamatok
- Környezet konfiguráció alapjai
- Erőforráscsoport és előfizetés kezelése

#### Gyakorlati feladatok
1. **Telepítés ellenőrzése**: Telepítsd az AZD-t és ellenőrizd az `azd version` parancsal
2. **Első telepítés**: Sikeresen telepítsd a todo-nodejs-mongo sablont
3. **Környezet beállítása**: Konfiguráld első környezeti változóidat
4. **Erőforrások felfedezése**: Navigálj a telepített erőforrások között az Azure Portalon

#### Értékelő kérdések
- Mik az AZD projekt főbb összetevői?
- Hogyan inicializálsz új projektet sablonból?
- Mi a különbség az `azd up` és az `azd deploy` között?
- Hogyan kezeled az AZD-vel a több környezetet?

---

### 2. fejezet: AI-First fejlesztés (2. hét)
**Időtartam**: 1-2 óra | **Nehézség**: ⭐⭐

#### Tanulási célok
- Integrálni a Microsoft Foundry szolgáltatásokat az AZD munkafolyamatokba
- AI-alapú alkalmazásokat telepíteni és konfigurálni
- Megérteni a RAG (Retrieval-Augmented Generation) megvalósítási mintákat
- AI modellek telepítését és skálázását kezelni

#### Elsajátítandó kulcsfogalmak
- Microsoft Foundry Models szolgáltatás integráció és API kezelés
- AI keresés konfiguráció és vektor indexelés
- Modell telepítési stratégiák és kapacitás tervezés
- AI alkalmazások monitorozása és teljesítmény optimalizálása

#### Gyakorlati feladatok
1. **AI Chat telepítés**: Telepítsd az azure-search-openai-demo sablont
2. **RAG megvalósítás**: Konfiguráld dokumentum indexelést és lekérést
3. **Modell konfiguráció**: Állíts be több AI modellt különböző célokra
4. **AI monitorozás**: Implementáld az Application Insights-t AI terhelésekhez

#### Értékelő kérdések
- Hogyan konfigurálod a Microsoft Foundry Models szolgáltatásokat egy AZD sablonban?
- Mik az RAG architektúra kulcselemei?
- Hogyan kezeled az AI modellek kapacitását és skálázását?
- Milyen monitorozási metrikák fontosak az AI alkalmazások számára?

---

### 3. fejezet: Konfiguráció és hitelesítés (3. hét)
**Időtartam**: 45-60 perc | **Nehézség**: ⭐⭐

#### Tanulási célok
- Elsajátítani a környezet konfigurációs és kezelési stratégiákat
- Biztonságos hitelesítési mintákat és Managed Identity használatát megvalósítani
- Erőforrások rendszerezése megfelelő névkonvenciók szerint
- Többkörnyezetes telepítések konfigurálása (dev, staging, prod)

#### Elsajátítandó kulcsfogalmak
- Környezet hierarchia és konfigurációs prioritások
- Managed identity és service principal alapú hitelesítés
- Key Vault integráció titkok kezelésére
- Környezet specifikus paraméter kezelése

#### Gyakorlati feladatok
1. **Többkörnyezetes beállítás**: Konfiguráld a dev, staging és prod környezeteket
2. **Biztonsági konfiguráció**: Valósíts meg managed identity hitelesítést
3. **Titkok kezelése**: Integráld az Azure Key Vault-ot érzékeny adatokhoz
4. **Paraméter kezelés**: Hozz létre környezet specifikus konfigurációkat

#### Értékelő kérdések
- Hogyan konfigurálsz különböző környezeteket az AZD-vel?
- Milyen előnyei vannak a managed identity használatának a service principal-nal szemben?
- Hogyan kezeled biztonságosan az alkalmazás titkait?
- Mi az AZD konfigurációs hierarchiája?

---

### 4. fejezet: Infrastrukturális kód és telepítés (4-5. hét)
**Időtartam**: 1-1,5 óra | **Nehézség**: ⭐⭐⭐

#### Tanulási célok
- Bicep infrastruktúra sablonok készítése és testreszabása
- Haladó telepítési minták és munkafolyamatok megvalósítása
- Erőforrás biztosítási stratégiák megértése
- Skálázható többszolgáltatásos architektúrák tervezése

- Konténerizált alkalmazások telepítése Azure Container Apps segítségével és AZD-vel

#### Elsajátítandó kulcsfogalmak
- Bicep sablon struktúra és bevált gyakorlatok
- Erőforrás függőségek és telepítési sorrend
- Paraméter fájlok és sablon modularitás
- Egyedi hook-ok és telepítési automatizálás
- Konténer alkalmazás telepítési minták (gyors kezdés, gyártás, mikroszolgáltatások)

#### Gyakorlati feladatok
1. **Egyedi sablon készítése**: Készíts többszolgáltatásos alkalmazás sablont
2. **Bicep mesterfok**: Modularizált, újrahasználható infrastruktúra komponensek
3. **Telepítési automatizálás**: Elő- és utótelepítési hook-ok bevezetése
4. **Architektúra tervezés**: Bonyolult mikroszolgáltatásos architektúra telepítése
5. **Konténer app telepítés**: Telepítsd a [Simple Flask API](../../../examples/container-app/simple-flask-api) és [Microservices Architecture](../../../examples/container-app/microservices) példákat AZD-vel

#### Értékelő kérdések
- Hogyan készítesz egyedi Bicep sablonokat AZD számára?
- Mik az infrastruktúra kód szervezésének bevált gyakorlatai?
- Hogyan kezeled az erőforrás függőségeket sablonokban?
- Milyen telepítési minták támogatják a leállás nélküli frissítéseket?

---

### 5. fejezet: Több-ügynökös AI megoldások (6-7. hét)
**Időtartam**: 2-3 óra | **Nehézség**: ⭐⭐⭐⭐

#### Tanulási célok
- Több-ügynökös AI architektúrák tervezése és megvalósítása
- Ügynök koordináció és kommunikáció szervezése
- Gyártásra kész AI megoldások telepítése monitorozással
- Ügynök specializáció és munkafolyamat minták megértése
- Konténerizált mikroszolgáltatások integrálása több-ügynökös megoldások részeként

#### Elsajátítandó kulcsfogalmak
- Több-ügynökös architektúra minták és tervezési alapelvek
- Ügynök kommunikációs protokollok és adatfolyamok
- Terheléselosztás és skálázási stratégiák AI ügynökök számára
- Gyártás monitorozás több-ügynökös rendszerekben
- Szolgáltatás-szolgáltatás kommunikáció konténerizált környezetben

#### Gyakorlati feladatok
1. **Kiskereskedelmi megoldás telepítés**: Teljes több-ügynökös kiskereskedelmi forgatókönyv telepítése
2. **Ügynök testreszabás**: Ügyfél és készlet ügynökök viselkedésének módosítása
3. **Architektúra skálázás**: Terheléselosztás és automatikus skálázás implementálása
4. **Gyártás monitorozás**: Átfogó monitorozás és riasztások beállítása
5. **Mikroszolgáltatás integráció**: Bővítsd a [Microservices Architecture](../../../examples/container-app/microservices) példát ügynök alapú munkafolyamatok támogatására

#### Értékelő kérdések
- Hogyan tervezel hatékony több-ügynökös kommunikációs mintákat?
- Mik a főbb szempontok az AI ügynök terhelések skálázásához?
- Hogyan monitorozod és hibakeresed a több-ügynökös AI rendszereket?
- Milyen gyártási minták biztosítják az AI ügynökök megbízhatóságát?

---

### 6. fejezet: Telepítés előtti érvényesítés és tervezés (8. hét)
**Időtartam**: 1 óra | **Nehézség**: ⭐⭐

#### Tanulási célok
- Átfogó kapacitástervezést és erőforrás-ellenőrzést végezni
- Optimális Azure SKU-k kiválasztása költséghatékonyság érdekében
- Automatizált előzetes ellenőrzési és érvényesítési lépések megvalósítása
- Telepítési tervek készítése költségoptimalizálással

#### Elsajátítandó kulcsfogalmak
- Azure erőforrás kvóták és kapacitás korlátok
- SKU választási szempontok és költségoptimalizálás
- Automatizált validációs szkriptek és tesztelések
- Telepítési tervezés és kockázatértékelés

#### Gyakorlati feladatok
1. **Kapacitás elemzés**: Elemezd alkalmazásod erőforrásigényeit
2. **SKU optimalizálás**: Hasonlítsd össze és válassz költséghatékony szolgáltatási szinteket
3. **Validáció automatizálás**: Készíts előtelepítési ellenőrző szkripteket
4. **Költségtervezés**: Készíts telepítési költségbecsléseket és költségvetést

#### Értékelő kérdések
- Hogyan érvényesíted az Azure kapacitását telepítés előtt?
- Milyen tényezők befolyásolják a SKU választási döntést?
- Hogyan automatizálod az előtelepítési érvényesítést?
- Milyen stratégiák segítenek a telepítési költségek optimalizálásában?

---

### 7. fejezet: Hibakeresés és debuggolás (9. hét)
**Időtartam**: 1-1,5 óra | **Nehézség**: ⭐⭐

#### Tanulási célok
- Rendszeres hibakeresési módszerek fejlesztése AZD telepítésekhez
- Gyakori telepítési és konfigurációs problémák megoldása
- AI specifikus problémák és teljesítményproblémák debugolása
- Monitorozás és riasztás megvalósítása az előzetes hibafelismeréshez

#### Elsajátítandó kulcsfogalmak
- Diagnosztikai technikák és naplózási stratégiák
- Gyakori hibák mintái és megoldásaik
- Teljesítmény monitorozás és optimalizálás
- Incidens kezelési és helyreállítási eljárások

#### Gyakorlati feladatok
1. **Diagnosztikai készségek**: Gyakorlat hibás telepítésekkel
2. **Naplóelemzés**: Hatékony használata Azure Monitor és Application Insights-nak
3. **Teljesítmény hangolás**: Lassú alkalmazások optimalizálása
4. **Helyreállítási eljárások**: Biztonsági mentés és katasztrófa helyreállítás megvalósítása

#### Értékelő kérdések
- Mik a leggyakoribb AZD telepítési hibák?
- Hogyan debugolod az autentikációs és jogosultsági problémákat?
- Milyen monitorozási stratégiák segítenek megelőzni a termelési hibákat?
- Hogyan optimalizálod az alkalmazás teljesítményét az Azure-ban?

---

### 8. fejezet: Gyártás és vállalati minták (10-11. hét)
**Időtartam**: 2-3 óra | **Nehézség**: ⭐⭐⭐⭐

#### Tanulási célok
- Vállalati szintű telepítési stratégiák megvalósítása
- Biztonsági minták és megfelelőségi keretrendszerek tervezése
- Monitorozás, kormányzás és költségkezelés kialakítása
- Skálázható CI/CD pipeline-ok létrehozása AZD integrációval
- Legjobb gyakorlatok alkalmazása gyártásra szánt konténeralkalmazások telepítésénél (biztonság, monitorozás, költség, CI/CD)

#### Elsajátítandó kulcsfogalmak
- Vállalati biztonsági és megfelelőségi követelmények
- Kormányzási keretrendszerek és szabályzat alkalmazás
- Haladó monitorozás és költségkezelés
- CI/CD integráció és automatizált telepítési folyamatok
- Blue-green és canary telepítési stratégiák konténerizált terhelésekhez

#### Gyakorlati feladatok
1. **Vállalati biztonság**: Átfogó biztonsági minták megvalósítása
2. **Kormányzási keretrendszer**: Azure Policy és erőforrás kezelés beállítása
3. **Haladó monitorozás**: Műszerfalak és automatizált riasztások létrehozása
4. **CI/CD integráció**: Automatizált telepítési pipeline-ok építése
5. **Gyártási konténeralkalmazások**: Biztonság, monitorozás és költségoptimalizálás alkalmazása a [Microservices Architecture](../../../examples/container-app/microservices) példában

#### Értékelő kérdések
- Hogyan valósítod meg a vállalati biztonságot az AZD telepítésekben?
- Milyen kormányzási minták biztosítják a megfelelést és költségkontrollt?
- Hogyan tervezel skálázható monitorozást gyártási rendszerekhez?
- Mely CI/CD minták működnek legjobban az AZD munkafolyamatokkal?

#### Tanulási célok
- Megérteni az Azure Developer CLI alapjait és főbb fogalmait
- Sikeresen telepíteni és konfigurálni az azd-t fejlesztői környezetedben
- Első telepítésedet kivitelezni meglévő sablonnal
- Áttekinteni az azd projekt szerkezetét és megérteni a kulcselemeket

#### Elsajátítandó kulcsfogalmak
- Sablonok, környezetek és szolgáltatások
- azure.yaml konfigurációs struktúra
- Alapvető azd parancsok (init, up, down, deploy)
- Infrastrukturális kód elvei
- Azure hitelesítés és engedélyezés

#### Gyakorlati feladatok

**1.1. gyakorlat: Telepítés és beállítás**
```bash
# Fejezze be ezeket a feladatokat:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**1.2. gyakorlat: Első telepítés**
```bash
# Egy egyszerű webalkalmazás telepítése:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**1.3. gyakorlat: Projekt struktúra elemzése**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### Önálló értékelő kérdések
1. Mik az azd architektúra három fő fogalma?
2. Mi az azure.yaml fájl célja?
3. Hogyan segítik a környezetek a különböző telepítési célok kezelését?
4. Milyen hitelesítési módszerek használhatók az azd-vel?
5. Mi történik, amikor először futtatod az `azd up` parancsot?

---

## Előrehaladás nyomon követése és értékelési keretrendszer
```bash
# Több környezet létrehozása és konfigurálása:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**2.2. gyakorlat: Haladó konfiguráció**
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**2.3. gyakorlat: Biztonsági konfiguráció**
```bash
# Valósítsa meg a biztonsági legjobb gyakorlatokat:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Önálló értékelő kérdések
1. Hogyan kezeli az azd a környezeti változók prioritását?
2. Mik azok a telepítési hook-ok és mikor érdemes használni őket?
3. Hogyan konfigurálod a különböző SKU-kat különböző környezetekhez?
4. Milyen biztonsági következményei vannak a különböző hitelesítési módszereknek?
5. Hogyan kezeled a titkokat és érzékeny konfigurációs adatokat?

### 3. modul: Telepítés és biztosítás (4. hét)

#### Tanulási célok
- Elsajátítani a telepítési munkafolyamatokat és bevált gyakorlatokat
- Megérteni az infrastrukturális kódot Bicep sablonokkal
- Összetett többszolgáltatásos architektúrák megvalósítása
- Optimalizálni a telepítési teljesítményt és megbízhatóságot

#### Elsajátítandó kulcsfogalmak
- Bicep sablon struktúra és modulok
- Erőforrás függőségek és sorrend
- Telepítési stratégiák (blue-green, rolling update)
- Több régiós telepítések
- Adatbázis migrációk és adatkezelés

#### Gyakorlati feladatok

**3.1. gyakorlat: Egyedi infrastruktúra**
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**3.2. gyakorlat: Többszolgáltatásos alkalmazás**
```bash
# Mikroszolgáltatások architektúrájának telepítése:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**3.3. gyakorlat: Adatbázis integráció**
```bash
# Adatbázis telepítési minták megvalósítása:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Önálló értékelő kérdések
1. Milyen előnyei vannak a Bicep használatának az ARM sablonokkal szemben?
2. Hogyan kezeled az adatbázis migrációkat az azd telepítésekben?
3. Milyen stratégiák léteznek leállás nélküli telepítésekhez?
4. Hogyan kezeled a szolgáltatások közötti függőségeket?
5. Mik a több régiós telepítések szempontjai?

### 4. modul: Telepítés előtti érvényesítés (5. hét)

#### Tanulási célok
- Átfogó előtelepítési ellenőrzések végrehajtása  
- Kapacitástervezés és erőforrás-ellenőrzés elsajátítása  
- SKU kiválasztás és költségoptimalizálás megértése  
- Automatizált érvényesítési rendszerek kiépítése  

#### Fő fogalmak elsajátítása  
- Azure erőforrás kvóták és korlátok  
- SKU kiválasztási szempontok és költségvonzatok  
- Automatizált érvényesítési szkriptek és eszközök  
- Kapacitástervezési módszertanok  
- Teljesítménytesztelés és optimalizálás  

#### Gyakorlati feladatok  

**4.1. gyakorlat: Kapacitástervezés**  
```bash
# Valósítsa meg a kapacitás ellenőrzését:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```
  
**4.2. gyakorlat: Előzetes ellenőrzés**  
```powershell
# Átfogó érvényesítési folyamat felépítése:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```
  
**4.3. gyakorlat: SKU optimalizálás**  
```bash
# Szolgáltatáskonfigurációk optimalizálása:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```
  
#### Önvizsgálati kérdések  
1. Milyen tényezők befolyásolják az SKU kiválasztási döntéseket?  
2. Hogyan ellenőrzöd az Azure erőforrások elérhetőségét a telepítés előtt?  
3. Mik a kulcsfontosságú elemei egy előzetes ellenőrző rendszernek?  
4. Hogyan becsülöd meg és szabályozod a telepítési költségeket?  
5. Milyen monitorozás szükséges a kapacitástervezéshez?  

### 5. modul: Hibakeresés és Hibaelhárítás (6. hét)  

#### Tanulási célok  
- Szisztematikus hibakeresési módszertanok elsajátítása  
- Összetett telepítési problémák hibakeresésének fejlesztése  
- Átfogó monitorozás és riasztás bevezetése  
- Esetkezelési és helyreállítási eljárások kidolgozása  

#### Fő fogalmak elsajátítása  
- Gyakori telepítési hibaminták  
- Naplóelemzés és korrelációs technikák  
- Teljesítmény monitorozása és optimalizálása  
- Biztonsági incidensek felismerése és kezelése  
- Katasztrófa utáni helyreállítás és üzletmenet-folytonosság  

#### Gyakorlati feladatok  

**5.1. gyakorlat: Hibakeresési forgatókönyvek**  
```bash
# Gyakorold a gyakori problémák megoldását:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```
  
**5.2. gyakorlat: Monitorozás implementálása**  
```bash
# Átfogó megfigyelés beállítása:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```
  
**5.3. gyakorlat: Esetkezelés**  
```bash
# Készítsen eseménykezelési eljárásokat:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```
  
#### Önvizsgálati kérdések  
1. Mi a szisztematikus megközelítés az azd telepítések hibakereséséhez?  
2. Hogyan korrelálod a naplókat több szolgáltatás és erőforrás között?  
3. Mely monitorozási metrikák a legfontosabbak a korai problémafelismeréshez?  
4. Hogyan hajtasz végre hatékony katasztrófa-helyreállítási eljárásokat?  
5. Mik egy eseti választerv kulcselemei?  

### 6. modul: Haladó témák és legjobb gyakorlatok (7-8. hét)  

#### Tanulási célok  
- Vállalati szintű telepítési minták alkalmazása  
- CI/CD integráció és automatizálás elsajátítása  
- Egyedi sablonok fejlesztése és közösségi hozzájárulás  
- Haladó biztonsági és megfelelőségi követelmények megértése  

#### Fő fogalmak elsajátítása  
- CI/CD pipeline integrációs minták  
- Egyedi sablonfejlesztés és terjesztés  
- Vállalati kormányzás és megfelelőség  
- Haladó hálózati és biztonsági konfigurációk  
- Teljesítményoptimalizálás és költségmenedzsment  

#### Gyakorlati feladatok  

**6.1. gyakorlat: CI/CD integráció**  
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```
  
**6.2. gyakorlat: Egyedi sablon fejlesztés**  
```bash
# Egyéni sablonok létrehozása és közzététele:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```
  
**6.3. gyakorlat: Vállalati megvalósítás**  
```bash
# Vállalati szintű funkciók megvalósítása:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```
  
#### Önvizsgálati kérdések  
1. Hogyan integrálod az azd-t meglévő CI/CD munkafolyamatokba?  
2. Milyen szempontokat kell figyelembe venni egyedi sablon fejlesztésénél?  
3. Hogyan valósítod meg a kormányzást és megfelelőséget az azd telepítéseknél?  
4. Melyek a vállalati méretű telepítések legjobb gyakorlatai?  
5. Hogyan járulsz hozzá hatékonyan az azd közösséghez?  

## Gyakorlati projektek  

### 1. projekt: Személyes portfólió weboldal  
**Bonyolultság**: Kezdő  
**Időtartam**: 1-2 hét  

Készíts és telepíts személyes portfólió weboldalt az alábbiakkal:  
- Statikus weboldal hosztolás Azure Storage-on  
- Egyedi domain beállítás  
- CDN integráció globális teljesítményért  
- Automatizált telepítési pipeline  

**Szállítandók**:  
- Működő weboldal Azure-on  
- Egyedi azd sablon portfólió telepítésekhez  
- Telepítési folyamat dokumentációja  
- Költségelemzés és optimalizálási javaslatok  

### 2. projekt: Feladatkezelő alkalmazás  
**Bonyolultság**: Középhaladó  
**Időtartam**: 2-3 hét  

Készíts teljes körű feladatkezelő alkalmazást:  
- React frontend, App Service-re telepítve  
- Node.js API backend hitelesítéssel  
- PostgreSQL adatbázis migrációkkal  
- Application Insights monitorozás  

**Szállítandók**:  
- Teljes alkalmazás felhasználói hitelesítéssel  
- Adatbázis séma és migrációs szkriptek  
- Monitorozó dashboardok és riasztási szabályok  
- Több környezetre konfigurált telepítés  

### 3. projekt: Mikroszolgáltatásos e-kereskedelmi platform  
**Bonyolultság**: Haladó  
**Időtartam**: 4-6 hét  

Tervezd és valósítsd meg mikroszolgáltatás alapú e-kereskedelmi platformot:  
- Több API szolgáltatás (katalógus, rendelések, fizetések, felhasználók)  
- Üzenetsor integráció Service Bus-szal  
- Redis cache teljesítmény optimalizáláshoz  
- Átfogó naplózás és monitorozás  

**Referenciapélda**: Lásd a [Microservices Architecture](../../../examples/container-app/microservices) oldalon a gyártásra kész sablont és telepítési útmutatót  

**Szállítandók**:  
- Teljes mikroszolgáltatásos architektúra  
- Szolgáltatások közötti kommunikációs minták  
- Teljesítménytesztelés és optimalizálás  
- Gyártásra kész biztonsági megvalósítás  

## Értékelés és Tanúsítás  

### Tudásellenőrzések  

Teljesítsd ezeket az értékeléseket minden modul után:  

**1. modul értékelés**: Alapfogalmak és telepítés  
- Többszörös választásos kérdések alapfogalmakról  
- Gyakorlati telepítési és konfigurációs feladatok  
- Egyszerű telepítési gyakorlat  

**2. modul értékelés**: Konfiguráció és környezetek  
- Környezetkezelési forgatókönyvek  
- Konfigurációs hibakeresési gyakorlatok  
- Biztonsági konfigurációs implementáció  

**3. modul értékelés**: Telepítés és erőforrás kezelés  
- Infrastrukturális tervezési feladatok  
- Több szolgáltatás telepítési forgatókönyvek  
- Teljesítmény optimalizálási gyakorlatok  

**4. modul értékelés**: Előtelepítési validálás  
- Kapacitástervezési esettanulmányok  
- Költségoptimalizálási forgatókönyvek  
- Érvényesítési pipeline megvalósítás  

**5. modul értékelés**: Hibakeresés és hibaelhárítás  
- Probléma diagnosztikai gyakorlatok  
- Monitorozás implementálás  
- Esetkezelési szimulációk  

**6. modul értékelés**: Haladó témák  
- CI/CD pipeline tervezése  
- Egyedi sablon fejlesztése  
- Vállalati architektúra forgatókönyvek  

### Záró, összefoglaló projekt  

Tervezd meg és valósítsd meg a teljes megoldást, amely bizonyítja minden fogalom elsajátítását:  

**Követelmények**:  
- Többszintes alkalmazás architektúra  
- Több telepítési környezet  
- Teljes körű monitorozás és riasztás  
- Biztonsági és megfelelőségi implementáció  
- Költségoptimalizálás és teljesítményhangolás  
- Dokumentáció és működtetési útmutatók  

**Értékelési szempontok**:  
- Műszaki megvalósítás minősége  
- Dokumentáció teljessége  
- Biztonsági és legjobb gyakorlatok betartása  
- Teljesítmény és költségoptimalizálás  
- Hibakeresés és monitorozás hatékonysága  

## Tanulási források és hivatkozások  

### Hivatalos dokumentáció  
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  

### Közösségi források  
- [AZD Template Gallery](https://azure.github.io/awesome-azd/)  
- [Azure-Samples GitHub szervezet](https://github.com/Azure-Samples)  
- [Azure Developer CLI GitHub tároló](https://github.com/Azure/azure-dev)  

### Gyakorló környezetek  
- [Azure Ingyenes fiók](https://azure.microsoft.com/free/)  
- [Azure DevOps Ingyenes csomag](https://azure.microsoft.com/services/devops/)  
- [GitHub Actions](https://github.com/features/actions)  

### További eszközök  
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)  
- [Visual Studio Code](https://code.visualstudio.com/)  
- [Azure Tools bővítménycsomag](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)  

## Tanulási ütemezési ajánlások  

### Teljes munkaidős tanulás (8 hét)  
- **1-2. hét**: 1-2 modul (Kezdés, konfiguráció)  
- **3-4. hét**: 3-4 modul (Telepítés, előtelepítés)  
- **5-6. hét**: 5-6 modul (Hibakeresés, haladó témák)  
- **7-8. hét**: Gyakorlati projektek és záró értékelés  

### Részmunkaidős tanulás (16 hét)  
- **1-4. hét**: 1. modul (Kezdés)  
- **5-7. hét**: 2. modul (Konfiguráció és környezetek)  
- **8-10. hét**: 3. modul (Telepítés és erőforrás kezelés)  
- **11-12. hét**: 4. modul (Előtelepítési validálás)  
- **13-14. hét**: 5. modul (Hibakeresés és hibaelhárítás)  
- **15-16. hét**: 6. modul (Haladó témák és értékelés)  

---  

## Előrehaladás követés és értékelési keretrendszer  

### Fejezet teljesítési ellenőrzőlista  

Kövesd nyomon előrehaladásodat minden fejezetben ezekkel mérhető eredményekkel:  

#### 📚 1. fejezet: Alapok és gyors kezdés  
- [ ] **Telepítés kész**: AZD telepítve és ellenőrizve a platformodon  
- [ ] **Első telepítés**: sikeresen telepítetted a todo-nodejs-mongo sablont  
- [ ] **Környezeti beállítások**: kialakítottad az első környezeti változókat  
- [ ] **Erőforrások böngészése**: megismerted az Azure Portálon a telepített erőforrásokat  
- [ ] **Parancsok magabiztossága**: komfortosan használod az alap AZD parancsokat  

#### 🤖 2. fejezet: Mesterséges intelligencia alapú fejlesztés  
- [ ] **AI sablon telepítés**: sikeresen telepítetted az azure-search-openai-demo-t  
- [ ] **RAG megvalósítás**: konfiguráltad a dokumentum indexelést és lekérdezést  
- [ ] **Modellek beállítása**: több AI modellt állítottál be különböző célokra  
- [ ] **AI monitorozás**: implementáltad az Application Insights-ot AI munkaterhelésekhez  
- [ ] **Teljesítményoptimalizálás**: hangoltad az AI alkalmazás teljesítményét  

#### ⚙️ 3. fejezet: Konfiguráció és hitelesítés  
- [ ] **Több környezet beállítása**: konfiguráltad fejlesztői, teszt és éles környezeteket  
- [ ] **Biztonsági implementáció**: beállítottad a kezelt identitás alapú hitelesítést  
- [ ] **Titkok kezelése**: integráltad az Azure Key Vault-ot érzékeny adatokhoz  
- [ ] **Paraméterkezelés**: környezet specifikus konfigurációk létrehozása  
- [ ] **Hitelesítési tudás**: biztonságos hozzáférési minták implementálása  

#### 🏗️ 4. fejezet: Infrastrukturális kód és telepítés  
- [ ] **Egyedi sablon készítése**: több szolgáltatásos alkalmazás sablon elkészítése  
- [ ] **Bicep tudás**: moduláris, újrahasznosítható infrastrukturális komponensek létrehozása  
- [ ] **Telepítés automatizálása**: elő- és utótelepítési hookok megvalósítása  
- [ ] **Architektúra tervezés**: komplex mikroszolgáltatásos architektúra telepítése  
- [ ] **Sablon optimalizálás**: teljesítmény és költség szempontú sablonfinomítás  

#### 🎯 5. fejezet: Többagentes AI megoldások  
- [ ] **Kiskereskedelmi megoldás telepítése**: teljes többagentes forgatókönyv megvalósítása  
- [ ] **Agent testreszabás**: Ügyfél és Készlet agent viselkedésének módosítása  
- [ ] **Architektúra bővítése**: terheléselosztás és automatikus skálázás megvalósítása  
- [ ] **Gyártás monitorozás**: átfogó monitorozási és riasztási rendszer beállítása  
- [ ] **Teljesítményhangolás**: többagentes rendszer optimalizációja  

#### 🔍 6. fejezet: Előtelepítési validálás és tervezés  
- [ ] **Kapacitáselemzés**: alkalmazások erőforrás igényének elemzése  
- [ ] **SKU optimalizálás**: költséghatékony szolgáltatási szintek kiválasztása  
- [ ] **Validáció automatizálás**: előtelepítési ellenőrző szkriptek bevezetése  
- [ ] **Költségtervezés**: telepítési költségbecslések és költségvetés készítése  
- [ ] **Kockázatelemzés**: a telepítési kockázatok felismerése és kezelése  

#### 🚨 7. fejezet: Hibakeresés és hibaelhárítás  
- [ ] **Diagnosztikai készségek**: eredetileg hibás telepítések sikeres hibakeresése  
- [ ] **Naplóelemzés**: Azure Monitor és Application Insights hatékony használata  
- [ ] **Teljesítményhangolás**: lassú alkalmazások optimalizálása  
- [ ] **Helyreállítási eljárások**: biztonsági mentés és katasztrófa utáni helyreállítás megvalósítása  
- [ ] **Monitorozás beállítása**: proaktív monitorozás és riasztásszabályok létrehozása  

#### 🏢 8. fejezet: Gyártási és vállalati minták  
- [ ] **Vállalati biztonság**: átfogó biztonsági minták implementálása  
- [ ] **Kormányzati keretrendszer**: Azure Policy és erőforrás kezelés beállítása  
- [ ] **Haladó monitorozás**: dashboardok és automatikus riasztás létrehozása  
- [ ] **CI/CD integráció**: automatizált telepítési pipeline-ok megépítése  
- [ ] **Megfelelőségi implementáció**: vállalati megfelelőségi követelmények teljesítése  

### Tanulási idővonal és mérföldkövek  

#### 1-2. hét: Alapok kialakítása  
- **Mérföldkő**: Első AI alkalmazás telepítése az AZD használatával  
- **Érvényesítés**: Működő alkalmazás nyilvánosan elérhető URL-en  
- **Készségek**: Alap AZD munkafolyamatok és AI szolgáltatás integráció  

#### 3-4. hét: Konfigurációs mesteri szint  
- **Mérföldkő**: Többkörnyezeti telepítés biztonságos hitelesítéssel  
- **Érvényesítés**: Ugyanaz az alkalmazás dev/staging/prod környezetekbe telepítve  
- **Készségek**: Környezetkezelés és biztonsági implementáció  

#### 5-6. hét: Infrastruktúra szakértelem  
- **Mérföldkő**: Egyedi sablon összetett többszolgáltatásos alkalmazáshoz  
- **Érvényesítés**: Újrahasznosítható sablon telepítése más csapattag által  
- **Készségek**: Bicep tudás, infrastruktúra automatizáció  

#### 7-8. hét: Haladó AI megvalósítás  
- **Mérföldkő**: Gyártásba kész többagentes AI megoldás  
- **Érvényesítés**: Rendszer valós terhelés alatt monitorozással  
- **Készségek**: Többagentes koordináció és teljesítményoptimalizálás  

#### 9-10. hét: Gyártási készenlét  
- **Mérföldkő**: Vállalati szintű telepítés teljes megfelelőséggel  
- **Érvényesítés**: Biztonsági és költségoptimalizálási audit sikeres teljesítése  
- **Készségek**: Kormányzás, monitorozás, CI/CD integráció  

### Értékelés és tanúsítás  

#### Tudásellenőrzési módszerek  
1. **Gyakorlati telepítések**: működő alkalmazások minden fejezethez  
2. **Kódáttekintések**: sablonok és konfigurációk minőségi értékelése  
3. **Problémamegoldás**: hibakeresési szituációk és megoldásaik  
4. **Társas tanítás**: fogalmak más tanulóknak való elmagyarázása  
5. **Közösségi hozzájárulás**: sablonok vagy fejlesztések megosztása  

#### Szakmai fejlődési eredmények  
- **Portfólió projektek**: 8 éles bevezetés kész
- **Műszaki készségek**: Iparágvezető AZD és AI bevezetési szakértelem
- **Problémamegoldó képességek**: Független hibakeresés és optimalizálás
- **Közösségi elismerés**: Aktív részvétel az Azure fejlesztői közösségben
- **Karrierfejlődés**: Készségek közvetlenül alkalmazhatók felhő és AI feladatokra

#### Sikerességi mutatók
- **Bevezetési sikeresség**: >95% sikeres bevezetések
- **Hibakeresési idő**: <30 perc gyakori problémák esetén
- **Teljesítmény-optimalizálás**: Költség- és teljesítményjavulások igazolva
- **Biztonsági megfelelés**: Minden bevezetés vállalati biztonsági szabványoknak megfelelő
- **Tudás átadása**: Képes mentorálni más fejlesztőket

### Folyamatos tanulás és közösségi részvétel

#### Legyél naprakész
- **Azure frissítések**: Kövesd az Azure Developer CLI kiadási jegyzeteit
- **Közösségi események**: Vegyél részt Azure és AI fejlesztői eseményeken
- **Dokumentáció**: Adj hozzá közösségi dokumentációhoz és példákhoz
- **Visszajelzési kör**: Adj visszajelzést tanfolyam tartalomról és Azure szolgáltatásokról

#### Karrierfejlesztés
- **Szakmai hálózat**: Kapcsolódj Azure és AI szakértőkhöz
- **Előadási lehetőségek**: Ismertesd tapasztalataid konferenciákon vagy meetupokon
- **Nyílt forrású hozzájárulás**: Adj hozzá AZD sablonokhoz és eszközökhöz
- **Mentorálás**: Vezess más fejlesztőket AZD tanulmányaik során

---

**Fejezet navigáció:**
- **📚 Tanfolyam főoldal**: [AZD kezdőknek](../README.md)
- **📖 Tanulás megkezdése**: [1. fejezet: Alapok és gyors kezdés](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Előrehaladás követése**: Kövesd nyomon fejlődésedet a 8 fejezetből álló tanulási rendszerben
- **🤝 Közösség**: [Azure Discord](https://discord.gg/microsoft-azure) támogatás és beszélgetés céljából

**Tanulási előrehaladás követése**: Használd ezt a strukturált útmutatót, hogy az Azure Developer CLI-t fokozatos, gyakorlati tanulással sajátítsd el, mérhető eredményekkel és szakmai fejlődési előnyökkel.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kizáró nyilatkozat**:  
Ezt a dokumentumot az AI fordító szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) használatával fordítottuk. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum anyanyelvén tekintendő meghatározó forrásnak. Fontos információk esetén professzionális emberi fordítást javaslunk. Nem vállalunk felelősséget az ebből a fordításból eredő félreértésekért vagy félreértelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->