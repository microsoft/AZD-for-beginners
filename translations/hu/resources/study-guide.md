# Tanulási Útmutató - Átfogó Tanulási Célok

**Tanulási Útvonal Navigáció**
- **📚 Kurzus Kezdőlap**: [AZD Kezdőknek](../README.md)
- **📖 Tanulás Kezdése**: [1. fejezet: Alapok és Gyors Kezdés](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Haladás Követése**: [Kurzus Befejezése](../README.md#-course-completion--certification)

## Bevezetés

Ez az átfogó tanulási útmutató strukturált tanulási célokat, kulcsfogalmakat, gyakorlati feladatokat és értékelési anyagokat biztosít, hogy segítsen elsajátítani az Azure Developer CLI (azd) használatát. Használja ezt az útmutatót a haladás nyomon követésére, és győződjön meg róla, hogy minden lényeges témát lefedett.

## Tanulási Célok

Az útmutató elvégzésével:
- Elsajátítja az Azure Developer CLI alapvető és haladó fogalmait
- Gyakorlati készségeket fejleszt az Azure alkalmazások telepítésében és kezelésében
- Magabiztosságot szerez a telepítési problémák elhárításában és optimalizálásában
- Megérti a termelésre kész telepítési gyakorlatokat és biztonsági szempontokat

## Tanulási Eredmények

Az útmutató összes szakaszának elvégzése után képes lesz:
- Teljes alkalmazásarchitektúrákat tervezni, telepíteni és kezelni az azd segítségével
- Átfogó monitorozási, biztonsági és költségoptimalizálási stratégiákat megvalósítani
- Önállóan elhárítani összetett telepítési problémákat
- Egyedi sablonokat létrehozni és hozzájárulni az azd közösséghez

## 8 Fejezetes Tanulási Struktúra

### 1. fejezet: Alapok és Gyors Kezdés (1. hét)
**Időtartam**: 30-45 perc | **Komplexitás**: ⭐

#### Tanulási Célok
- Értsük meg az Azure Developer CLI alapfogalmait és terminológiáját
- Sikeresen telepítsük és konfiguráljuk az AZD-t a fejlesztési platformon
- Telepítsük az első alkalmazást egy meglévő sablon segítségével
- Hatékonyan navigáljunk az AZD parancssori felületén

#### Kulcsfogalmak, amelyeket el kell sajátítani
- AZD projektstruktúra és komponensek (azure.yaml, infra/, src/)
- Sablon-alapú telepítési munkafolyamatok
- Környezetkonfiguráció alapjai
- Erőforráscsoport és előfizetés kezelése

#### Gyakorlati Feladatok
1. **Telepítés Ellenőrzése**: Telepítse az AZD-t és ellenőrizze az `azd version` paranccsal
2. **Első Telepítés**: Telepítse sikeresen a todo-nodejs-mongo sablont
3. **Környezet Beállítása**: Konfigurálja az első környezeti változókat
4. **Erőforrás Felfedezése**: Navigáljon a telepített erőforrások között az Azure Portálon

#### Értékelési Kérdések
- Mik az AZD projekt alapvető komponensei?
- Hogyan inicializál egy új projektet egy sablonból?
- Mi a különbség az `azd up` és az `azd deploy` között?
- Hogyan kezel több környezetet az AZD segítségével?

---

### 2. fejezet: AI-első Fejlesztés (2. hét)
**Időtartam**: 1-2 óra | **Komplexitás**: ⭐⭐

#### Tanulási Célok
- Integrálja a Microsoft Foundry szolgáltatásokat az AZD munkafolyamatokkal
- Telepítse és konfigurálja AI-alapú alkalmazásokat
- Értsük meg a RAG (Retrieval-Augmented Generation) megvalósítási mintákat
- Kezelje az AI modellek telepítését és skálázását

#### Kulcsfogalmak, amelyeket el kell sajátítani
- Azure OpenAI szolgáltatás integrációja és API kezelése
- AI keresési konfiguráció és vektorindexelés
- Modell telepítési stratégiák és kapacitástervezés
- AI alkalmazás monitorozása és teljesítményoptimalizálása

#### Gyakorlati Feladatok
1. **AI Chat Telepítés**: Telepítse az azure-search-openai-demo sablont
2. **RAG Megvalósítás**: Konfigurálja a dokumentum indexelést és visszakeresést
3. **Modell Konfiguráció**: Állítson be több AI modellt különböző célokra
4. **AI Monitorozás**: Valósítsa meg az Application Insights-t az AI munkaterhelésekhez

#### Értékelési Kérdések
- Hogyan konfigurálja az Azure OpenAI szolgáltatásokat egy AZD sablonban?
- Mik az RAG architektúra kulcselemei?
- Hogyan kezeli az AI modellek kapacitását és skálázását?
- Milyen monitorozási metrikák fontosak az AI alkalmazásokhoz?

---

### 3. fejezet: Konfiguráció és Hitelesítés (3. hét)
**Időtartam**: 45-60 perc | **Komplexitás**: ⭐⭐

#### Tanulási Célok
- Sajátítsa el a környezetkonfiguráció és kezelési stratégiákat
- Valósítson meg biztonságos hitelesítési mintákat és kezelt identitást
- Szervezze az erőforrásokat megfelelő elnevezési konvenciókkal
- Konfigurálja a többkörnyezetes telepítéseket (fejlesztés, tesztelés, éles)

#### Kulcsfogalmak, amelyeket el kell sajátítani
- Környezet hierarchia és konfigurációs prioritás
- Kezelt identitás és szolgáltatásazonosító hitelesítés
- Key Vault integráció titkok kezeléséhez
- Környezet-specifikus paraméterek kezelése

#### Gyakorlati Feladatok
1. **Többkörnyezetes Beállítás**: Konfigurálja a fejlesztési, tesztelési és éles környezeteket
2. **Biztonsági Konfiguráció**: Valósítsa meg a kezelt identitás hitelesítést
3. **Titkok Kezelése**: Integrálja az Azure Key Vault-ot érzékeny adatokhoz
4. **Paraméterek Kezelése**: Hozzon létre környezet-specifikus konfigurációkat

#### Értékelési Kérdések
- Hogyan konfigurál különböző környezeteket az AZD-ben?
- Miért előnyösebb a kezelt identitás a szolgáltatásazonosítókhoz képest?
- Hogyan kezeli biztonságosan az alkalmazás titkait?
- Mi az AZD konfigurációs hierarchiája?

---

### 4. fejezet: Infrastruktúra Kódként és Telepítés (4-5. hét)
**Időtartam**: 1-1,5 óra | **Komplexitás**: ⭐⭐⭐

#### Tanulási Célok
- Hozzon létre és testreszabjon Bicep infrastruktúra sablonokat
- Valósítson meg haladó telepítési mintákat és munkafolyamatokat
- Értsük meg az erőforrások biztosítási stratégiáit
- Tervezzen skálázható, több szolgáltatásból álló architektúrákat

- Telepítsen konténeres alkalmazásokat az Azure Container Apps és AZD segítségével

#### Kulcsfogalmak, amelyeket el kell sajátítani
- Bicep sablon struktúra és legjobb gyakorlatok
- Erőforrás függőségek és telepítési sorrend
- Paraméterfájlok és sablon modularitás
- Egyedi horgok és telepítési automatizálás
- Konténeres alkalmazás telepítési minták (gyors kezdés, éles, mikroszolgáltatások)

#### Gyakorlati Feladatok
1. **Egyedi Sablon Létrehozása**: Építsen egy több szolgáltatásból álló alkalmazás sablont
2. **Bicep Elsajátítása**: Hozzon létre moduláris, újrahasználható infrastruktúra komponenseket
3. **Telepítési Automatizálás**: Valósítson meg elő-/utótelepítési horgokat
4. **Architektúra Tervezés**: Telepítsen összetett mikroszolgáltatási architektúrát
5. **Konténeres Alkalmazás Telepítése**: Telepítse a [Simple Flask API](../../../examples/container-app/simple-flask-api) és [Microservices Architecture](../../../examples/container-app/microservices) példákat az AZD segítségével

#### Értékelési Kérdések
- Hogyan hoz létre egyedi Bicep sablonokat az AZD-hez?
- Mik a legjobb gyakorlatok az infrastruktúra kód szervezéséhez?
- Hogyan kezeli az erőforrás függőségeket a sablonokban?
- Milyen telepítési minták támogatják a zéró leállási frissítéseket?

---

### 5. fejezet: Többügynökös AI Megoldások (6-7. hét)
**Időtartam**: 2-3 óra | **Komplexitás**: ⭐⭐⭐⭐

#### Tanulási Célok
- Tervezzen és valósítson meg többügynökös AI architektúrákat
- Orkestrálja az ügynökök koordinációját és kommunikációját
- Telepítsen termelésre kész AI megoldásokat monitorozással
- Értsük meg az ügynökök specializációját és munkafolyamat mintáit
- Integrálja konténeres mikroszolgáltatásokat a többügynökös megoldások részeként

#### Kulcsfogalmak, amelyeket el kell sajátítani
- Többügynökös architektúra minták és tervezési elvek
- Ügynök kommunikációs protokollok és adatáramlás
- Terheléselosztási és skálázási stratégiák AI ügynökökhöz
- Termelési monitorozás többügynökös rendszerekhez
- Szolgáltatás-szolgáltatás kommunikáció konténeres környezetekben

#### Gyakorlati Feladatok
1. **Kiskereskedelmi Megoldás Telepítése**: Telepítse a teljes többügynökös kiskereskedelmi forgatókönyvet
2. **Ügynök Testreszabása**: Módosítsa az Ügyfél és Készlet ügynök viselkedését
3. **Architektúra Skálázása**: Valósítson meg terheléselosztást és automatikus skálázást
4. **Termelési Monitorozás**: Állítson be átfogó monitorozást és riasztásokat
5. **Mikroszolgáltatások Integrációja**: Bővítse a [Microservices Architecture](../../../examples/container-app/microservices) példát, hogy támogassa az ügynök-alapú munkafolyamatokat

#### Értékelési Kérdések
- Hogyan tervez hatékony többügynökös kommunikációs mintákat?
- Melyek a legfontosabb szempontok az AI ügynökök munkaterhelésének skálázásához?
- Hogyan monitorozza és hibakeresi a többügynökös AI rendszereket?
- Milyen termelési minták biztosítják az AI ügynökök megbízhatóságát?

---

### 6. fejezet: Telepítés Előtti Érvényesítés és Tervezés (8. hét)
**Időtartam**: 1 óra | **Komplexitás**: ⭐⭐

#### Tanulási Célok
- Végezzen átfogó kapacitástervezést és erőforrás érvényesítést
- Válassza ki az optimális Azure SKU-kat költséghatékonyság érdekében
- Valósítson meg automatizált előzetes ellenőrzéseket és érvényesítést
- Tervezze meg a telepítéseket költségoptimalizálási stratégiákkal

#### Kulcsfogalmak, amelyeket el kell sajátítani
- Azure erőforrás kvóták és kapacitáskorlátok
- SKU kiválasztási kritériumok és költségoptimalizálás
- Automatizált érvényesítési szkriptek és tesztelés
- Telepítési tervezés és kockázatértékelés

#### Gyakorlati Feladatok
1. **Kapacitás Elemzés**: Elemezze az alkalmazások erőforrásigényeit
2. **SKU Optimalizálás**: Hasonlítsa össze és válassza ki a költséghatékony szolgáltatási szinteket
3. **Érvényesítés Automatizálása**: Valósítson meg előtelepítési ellenőrző szkripteket
4. **Költségtervezés**: Készítsen telepítési költségbecsléseket és költségvetéseket

#### Értékelési Kérdések
- Hogyan érvényesíti az Azure kapacitást telepítés előtt?
- Milyen tényezők befolyásolják az SKU kiválasztási döntéseket?
- Hogyan automatizálja az előtelepítési érvényesítést?
- Milyen stratégiák segítenek optimalizálni a telepítési költségeket?

---

### 7. fejezet: Hibakeresés és Debugolás (9. hét)
**Időtartam**: 1-1,5 óra | **Komplexitás**: ⭐⭐

#### Tanulási Célok
- Fejlesszen szisztematikus hibakeresési megközelítéseket az AZD telepítésekhez
- Oldja meg a gyakori telepítési és konfigurációs problémákat
- Debugolja az AI-specifikus problémákat és teljesítményproblémákat
- Valósítson meg monitorozást és riasztásokat a proaktív problémaészleléshez

#### Kulcsfogalmak, amelyeket el kell sajátítani
- Diagnosztikai technikák és naplózási stratégiák
- Gyakori hibaminták és megoldásaik
- Teljesítmény monitorozás és optimalizálás
- Incidens válasz és helyreállítási eljárások

#### Gyakorlati Feladatok
1. **Diagnosztikai Készségek**: Gyakoroljon szándékosan hibás telepítésekkel
2. **Naplóelemzés**: Használja hatékonyan az Azure Monitor és Application Insights eszközöket
3. **Teljesítmény Hangolás**: Optimalizálja a lassan működő alkalmazásokat
4. **Helyreállítási Eljárások**: Valósítson meg biztonsági mentést és katasztrófa helyreállítást

#### Értékelési Kérdések
- Mik a leggyakoribb AZD telepítési hibák?
- Hogyan debugolja a hitelesítési és engedélyezési problémákat?
- Milyen monitorozási stratégiák segítenek megelőzni a termelési problémákat?
- Hogyan optimalizálja az alkalmazás teljesítményét az Azure-ban?

---

### 8. fejezet: Termelési és Vállalati Minták (10-11. hét)
**Időtartam**: 2-3 óra | **Komplexitás**: ⭐⭐⭐⭐

#### Tanulási Célok
- Valósítson meg vállalati szintű telepítési stratégiákat
- Tervezzen biztonsági mintákat és megfelelőségi kereteket
- Alakítson ki monitorozási, irányítási és költségkezelési rendszereket
- Hozzon létre skálázható CI/CD csővezetékeket AZD integrációval
- Alkalmazza a legjobb gyakorlatokat termelési konténeres alkalmazások telepítéséhez (biztonság, monitorozás, költség, CI/CD)

#### Kulcsfogalmak, amelyeket el kell sajátítani
- Vállalati biztonsági és megfelelőségi követelmények
- Irányítási keretek és szabályzatok megval
5. Milyen szempontokat kell figyelembe venni a több régióra kiterjedő telepítések esetén?

### 4. modul: Telepítés előtti validáció (5. hét)

#### Tanulási célok
- Átfogó telepítés előtti ellenőrzések végrehajtása
- Kapacitástervezés és erőforrás-validáció elsajátítása
- SKU kiválasztás és költségoptimalizálás megértése
- Automatizált validációs folyamatok létrehozása

#### Kulcsfogalmak, amelyeket el kell sajátítani
- Azure erőforrás kvóták és korlátok
- SKU kiválasztási kritériumok és költségvonzatok
- Automatizált validációs szkriptek és eszközök
- Kapacitástervezési módszerek
- Teljesítménytesztelés és optimalizálás

#### Gyakorlati feladatok

**4.1 gyakorlat: Kapacitástervezés**
```bash
# Kapacitás érvényesítésének megvalósítása:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**4.2 gyakorlat: Telepítés előtti validáció**
```powershell
# Építsen átfogó validációs folyamatot:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**4.3 gyakorlat: SKU optimalizálás**
```bash
# Optimalizálja a szolgáltatás konfigurációit:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Önértékelési kérdések
1. Milyen tényezők befolyásolják a SKU kiválasztási döntéseket?
2. Hogyan validálja az Azure erőforrások elérhetőségét telepítés előtt?
3. Melyek a telepítés előtti ellenőrzési rendszer kulcselemei?
4. Hogyan becsüli meg és kontrollálja a telepítési költségeket?
5. Milyen monitorozás szükséges a kapacitástervezéshez?

### 5. modul: Hibakeresés és hibaelhárítás (6. hét)

#### Tanulási célok
- Szisztematikus hibakeresési módszerek elsajátítása
- Összetett telepítési problémák hibakeresésében való jártasság fejlesztése
- Átfogó monitorozás és riasztás megvalósítása
- Incidenskezelési és helyreállítási eljárások kidolgozása

#### Kulcsfogalmak, amelyeket el kell sajátítani
- Gyakori telepítési hibák mintázatai
- Naplóelemzési és korrelációs technikák
- Teljesítmény monitorozás és optimalizálás
- Biztonsági incidensek észlelése és kezelése
- Katasztrófa utáni helyreállítás és üzletmenet-folytonosság

#### Gyakorlati feladatok

**5.1 gyakorlat: Hibakeresési forgatókönyvek**
```bash
# Gyakorold a gyakori problémák megoldását:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**5.2 gyakorlat: Monitorozás megvalósítása**
```bash
# Állítsa be az átfogó monitorozást:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**5.3 gyakorlat: Incidenskezelés**
```bash
# Készítsen incidensreagálási eljárásokat:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Önértékelési kérdések
1. Mi a szisztematikus megközelítés az azd telepítések hibakereséséhez?
2. Hogyan korrelálja a naplókat több szolgáltatás és erőforrás között?
3. Mely monitorozási metrikák a legfontosabbak a korai problémaészleléshez?
4. Hogyan valósítja meg a hatékony katasztrófa utáni helyreállítási eljárásokat?
5. Melyek egy incidenskezelési terv kulcselemei?

### 6. modul: Haladó témák és legjobb gyakorlatok (7-8. hét)

#### Tanulási célok
- Vállalati szintű telepítési minták megvalósítása
- CI/CD integráció és automatizálás elsajátítása
- Egyedi sablonok fejlesztése és közösségi hozzájárulás
- Haladó biztonsági és megfelelőségi követelmények megértése

#### Kulcsfogalmak, amelyeket el kell sajátítani
- CI/CD folyamat integrációs minták
- Egyedi sablonok fejlesztése és terjesztése
- Vállalati irányítás és megfelelőség
- Haladó hálózati és biztonsági konfigurációk
- Teljesítményoptimalizálás és költségkezelés

#### Gyakorlati feladatok

**6.1 gyakorlat: CI/CD integráció**
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**6.2 gyakorlat: Egyedi sablon fejlesztése**
```bash
# Egyedi sablonok létrehozása és közzététele:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**6.3 gyakorlat: Vállalati megvalósítás**
```bash
# Vállalati szintű funkciók megvalósítása:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Önértékelési kérdések
1. Hogyan integrálja az azd-t meglévő CI/CD munkafolyamatokba?
2. Melyek az egyedi sablonok fejlesztésének kulcsfontosságú szempontjai?
3. Hogyan valósítja meg az irányítást és megfelelőséget az azd telepítésekben?
4. Melyek a legjobb gyakorlatok vállalati szintű telepítésekhez?
5. Hogyan járul hozzá hatékonyan az azd közösséghez?

## Gyakorlati projektek

### 1. projekt: Személyes portfólió weboldal
**Komplexitás**: Kezdő  
**Időtartam**: 1-2 hét

Készítsen és telepítsen egy személyes portfólió weboldalt az alábbiak használatával:
- Statikus weboldal hosztolása Azure Storage-on
- Egyedi domain konfiguráció
- CDN integráció globális teljesítmény érdekében
- Automatizált telepítési folyamat

**Leadandók**:
- Működő weboldal telepítve az Azure-ra
- Egyedi azd sablon portfólió telepítésekhez
- Telepítési folyamat dokumentációja
- Költségelemzés és optimalizálási ajánlások

### 2. projekt: Feladatkezelő alkalmazás
**Komplexitás**: Középhaladó  
**Időtartam**: 2-3 hét

Hozzon létre egy teljes körű feladatkezelő alkalmazást az alábbiakkal:
- React frontend telepítve az App Service-re
- Node.js API backend hitelesítéssel
- PostgreSQL adatbázis migrációkkal
- Application Insights monitorozás

**Leadandók**:
- Teljes alkalmazás felhasználói hitelesítéssel
- Adatbázis séma és migrációs szkriptek
- Monitorozási irányítópultok és riasztási szabályok
- Több környezetű telepítési konfiguráció

### 3. projekt: Mikroservices alapú e-kereskedelmi platform
**Komplexitás**: Haladó  
**Időtartam**: 4-6 hét

Tervezzen és valósítson meg egy mikroservices alapú e-kereskedelmi platformot:
- Több API szolgáltatás (katalógus, rendelések, fizetések, felhasználók)
- Üzenetküldési sor integráció Service Bus-szal
- Redis cache teljesítményoptimalizálásra
- Átfogó naplózás és monitorozás

**Referenciapélda**: Lásd [Microservices Architecture](../../../examples/container-app/microservices) egy gyártásra kész sablonért és telepítési útmutatóért

**Leadandók**:
- Teljes mikroservices architektúra
- Szolgáltatások közötti kommunikációs minták
- Teljesítménytesztelés és optimalizálás
- Gyártásra kész biztonsági megvalósítás

## Értékelés és tanúsítás

### Tudásellenőrzések

Töltse ki ezeket az értékeléseket minden modul után:

**1. modul értékelés**: Alapfogalmak és telepítés
- Feleletválasztós kérdések az alapfogalmakról
- Gyakorlati telepítési és konfigurációs feladatok
- Egyszerű telepítési gyakorlat

**2. modul értékelés**: Konfiguráció és környezetek
- Környezetkezelési forgatókönyvek
- Konfigurációs hibakeresési gyakorlatok
- Biztonsági konfiguráció megvalósítása

**3. modul értékelés**: Telepítés és erőforrások biztosítása
- Infrastruktúra tervezési kihívások
- Több szolgáltatás telepítési forgatókönyvei
- Teljesítményoptimalizálási gyakorlatok

**4. modul értékelés**: Telepítés előtti validáció
- Kapacitástervezési esettanulmányok
- Költségoptimalizálási forgatókönyvek
- Validációs folyamat megvalósítása

**5. modul értékelés**: Hibakeresés és hibaelhárítás
- Problémadiagnosztikai gyakorlatok
- Monitorozási megvalósítási feladatok
- Incidenskezelési szimulációk

**6. modul értékelés**: Haladó témák
- CI/CD folyamat tervezés
- Egyedi sablon fejlesztés
- Vállalati architektúra forgatókönyvek

### Záró projekt

Tervezzen és valósítson meg egy teljes megoldást, amely bemutatja az összes fogalom elsajátítását:

**Követelmények**:
- Többrétegű alkalmazás architektúra
- Több telepítési környezet
- Átfogó monitorozás és riasztás
- Biztonsági és megfelelőségi megvalósítás
- Költségoptimalizálás és teljesítményhangolás
- Teljes dokumentáció és üzemeltetési kézikönyvek

**Értékelési kritériumok**:
- Technikai megvalósítás minősége
- Dokumentáció teljessége
- Biztonsági és legjobb gyakorlatok betartása
- Teljesítmény és költségoptimalizálás
- Hibakeresési és monitorozási hatékonyság

## Tanulási források és hivatkozások

### Hivatalos dokumentáció
- [Azure Developer CLI Dokumentáció](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep Dokumentáció](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architektúra Központ](https://learn.microsoft.com/en-us/azure/architecture/)

### Közösségi források
- [AZD Sablon Galéria](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub Szervezet](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHub Repository](https://github.com/Azure/azure-dev)

### Gyakorlati környezetek
- [Azure Ingyenes Fiók](https://azure.microsoft.com/free/)
- [Azure DevOps Ingyenes Szint](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### További eszközök
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Tanulási ütemterv ajánlások

### Teljes munkaidős tanulás (8 hét)
- **1-2. hét**: 1-2. modul (Kezdetek, Konfiguráció)
- **3-4. hét**: 3-4. modul (Telepítés, Telepítés előtti validáció)
- **5-6. hét**: 5-6. modul (Hibakeresés, Haladó témák)
- **7-8. hét**: Gyakorlati projektek és záró értékelés

### Részmunkaidős tanulás (16 hét)
- **1-4. hét**: 1. modul (Kezdetek)
- **5-7. hét**: 2. modul (Konfiguráció és környezetek)
- **8-10. hét**: 3. modul (Telepítés és erőforrások biztosítása)
- **11-12. hét**: 4. modul (Telepítés előtti validáció)
- **13-14. hét**: 5. modul (Hibakeresés és hibaelhárítás)
- **15-16. hét**: 6. modul (Haladó témák és értékelés)

---

## Haladáskövetés és értékelési keretrendszer

### Fejezetek teljesítési ellenőrzőlistája

Kövesse nyomon haladását minden fejezetben az alábbi mérhető eredményekkel:

#### 📚 1. fejezet: Alapok és gyors kezdés
- [ ] **Telepítés befejezve**: AZD telepítve és ellenőrizve a platformján
- [ ] **Első telepítés**: Sikeresen telepítve a todo-nodejs-mongo sablon
- [ ] **Környezet beállítása**: Első környezeti változók konfigurálása
- [ ] **Erőforrások navigálása**: Telepített erőforrások felfedezése az Azure Portálon
- [ ] **Parancsok elsajátítása**: Magabiztosan használja az alapvető AZD parancsokat

#### 🤖 2. fejezet: AI-első fejlesztés  
- [ ] **AI sablon telepítése**: Sikeresen telepítve az azure-search-openai-demo
- [ ] **RAG megvalósítása**: Dokumentum indexelés és visszakeresés konfigurálása
- [ ] **Modellek konfigurálása**: Több AI modell beállítása különböző célokra
- [ ] **AI monitorozás**: Application Insights megvalósítása AI munkaterhelésekhez
- [ ] **Teljesítményoptimalizálás**: AI alkalmazás teljesítményének hangolása

#### ⚙️ 3. fejezet: Konfiguráció és hitelesítés
- [ ] **Több környezet beállítása**: Fejlesztési, tesztelési és éles környezetek konfigurálása
- [ ] **Biztonsági megvalósítás**: Kezelt identitás hitelesítés beállítása
- [ ] **Titkok kezelése**: Azure Key Vault integrálása érzékeny adatokhoz
- [ ] **Paraméterek kezelése**: Környezet-specifikus konfigurációk létrehozása
- [ ] **Hitelesítés elsajátítása**: Biztonságos hozzáférési minták megvalósítása

#### 🏗️ 4. fejezet: Infrastruktúra kódként és telepítés
- [ ] **Egyedi sablon létrehozása**: Több szolgáltatásból álló alkalmazás sablon készítése
- [ ] **Bicep elsajátítása**: Moduláris, újrahasználható infrastruktúra komponensek létrehozása
- [ ] **Telepítés automatizálása**: Telepítés előtti/utáni horgok megvalósítása
- [ ] **Architektúra tervezés**: Összetett mikroservices architektúra telepítése
- [ ] **Sablon optimalizálása**: Sablonok optimalizálása teljesítményre és költségre

#### 🎯 5. fejezet: Többügynökös AI megoldások
- [ ] **Kiskereskedelmi megoldás telepítése**: Teljes többügynökös kiskereskedelmi forgatókönyv telepítése
- [ ] **Ügynök testreszabása**: Ügyfél és készlet ügynök viselkedésének módosítása
- [ ] **Architektúra skálázása**: Terheléselosztás és automatikus skálázás megvalósítása
- [ ] **Gyártási monitorozás**: Átfogó monitorozás és riasztás beállítása
- [ ] **Teljesítményhangolás**: Többügynökös rendszer teljesítményének optimalizálása

#### 🔍 6. fejezet: Telepítés előtti validáció és tervezés
- [ ] **Kapacitáselemzés**: Alkalmazások erőforrásigényeinek elemzése
- [ ] **SKU optimalizálás**: Költséghatékony szolgáltatási szintek kiválasztása
- [ ] **Validáció automatizálása**: Telepítés előtti ellenőrzési szkriptek megvalósítása
- [ ] **Költségtervezés**: Telepítési költségbecslések és költségvetések készítése
- [ ] **Kockázatelemzés**: Telepítési kockázatok azonosítása és csökkentése

#### 🚨 7. fejezet: Hibakeresés és hibaelhárítás
- [ ] **Diagnosztikai készségek**: Szándékosan hibás telepítések sikeres
5. **Közösségi hozzájárulás**: Ossz meg sablonokat vagy fejlesztéseket

#### Szakmai fejlődési eredmények
- **Portfólió projektek**: 8 éles bevetésre kész telepítés
- **Technikai készségek**: Iparági szabvány AZD és AI telepítési szakértelem
- **Problémamegoldó képességek**: Önálló hibakeresés és optimalizálás
- **Közösségi elismerés**: Aktív részvétel az Azure fejlesztői közösségben
- **Karrierfejlesztés**: Felhő- és AI-szerepkörökhöz közvetlenül alkalmazható készségek

#### Sikerességi mutatók
- **Telepítési sikerességi arány**: >95% sikeres telepítés
- **Hibakeresési idő**: <30 perc a gyakori problémák esetén
- **Teljesítményoptimalizálás**: Költség- és teljesítményjavulás bemutatása
- **Biztonsági megfelelőség**: Minden telepítés megfelel a vállalati biztonsági szabványoknak
- **Tudásátadás**: Képesség más fejlesztők mentorálására

### Folyamatos tanulás és közösségi részvétel

#### Maradj naprakész
- **Azure frissítések**: Kövesd az Azure Developer CLI kiadási jegyzeteit
- **Közösségi események**: Vegyél részt Azure és AI fejlesztői eseményeken
- **Dokumentáció**: Járulj hozzá a közösségi dokumentációhoz és példákhoz
- **Visszacsatolás**: Adj visszajelzést a tanfolyami tartalomról és az Azure szolgáltatásokról

#### Karrierfejlesztés
- **Szakmai hálózat**: Kapcsolódj Azure és AI szakértőkhöz
- **Előadási lehetőségek**: Tarts előadásokat konferenciákon vagy találkozókon
- **Nyílt forráskódú hozzájárulás**: Járulj hozzá AZD sablonokhoz és eszközökhöz
- **Mentorálás**: Segíts más fejlesztőknek az AZD tanulási útjuk során

---

**Fejezet navigáció:**
- **📚 Tanfolyam kezdőlap**: [AZD Kezdőknek](../README.md)
- **📖 Tanulás kezdése**: [1. fejezet: Alapok és gyors kezdés](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Haladás nyomon követése**: Kövesd nyomon előrehaladásodat a 8 fejezetes tanulási rendszerben
- **🤝 Közösség**: [Azure Discord](https://discord.gg/microsoft-azure) támogatásért és megbeszélésekhez

**Tanulási haladás nyomon követése**: Használd ezt a strukturált útmutatót az Azure Developer CLI elsajátításához fokozatos, gyakorlati tanulással, mérhető eredményekkel és szakmai fejlődési előnyökkel.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Felelősség kizárása**:  
Ez a dokumentum az [Co-op Translator](https://github.com/Azure/co-op-translator) AI fordítási szolgáltatás segítségével lett lefordítva. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Kritikus információk esetén javasolt professzionális emberi fordítást igénybe venni. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely a fordítás használatából eredhet.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->