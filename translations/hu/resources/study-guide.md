<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee6549c72fe4271931326578e2379243",
  "translation_date": "2025-09-18T09:28:14+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "hu"
}
-->
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
- Magabiztosságot szerez a hibakeresésben és a telepítések optimalizálásában
- Megérti a termelésre kész telepítési gyakorlatokat és biztonsági szempontokat

## Tanulási Eredmények

Az útmutató összes szakaszának elvégzése után képes lesz:
- Teljes alkalmazásarchitektúrákat tervezni, telepíteni és kezelni az azd segítségével
- Átfogó monitorozási, biztonsági és költségoptimalizálási stratégiákat megvalósítani
- Önállóan hibakeresni összetett telepítési problémákat
- Egyedi sablonokat létrehozni és hozzájárulni az azd közösséghez

## 8 Fejezetes Tanulási Struktúra

### 1. fejezet: Alapok és Gyors Kezdés (1. hét)
**Időtartam**: 30-45 perc | **Komplexitás**: ⭐

#### Tanulási Célok
- Az Azure Developer CLI alapfogalmainak és terminológiájának megértése
- AZD sikeres telepítése és konfigurálása a fejlesztési platformján
- Első alkalmazás telepítése meglévő sablon használatával
- Az AZD parancssori felületének hatékony használata

#### Kulcsfogalmak, amelyeket el kell sajátítani
- AZD projektstruktúra és komponensek (azure.yaml, infra/, src/)
- Sablon-alapú telepítési munkafolyamatok
- Környezetkonfiguráció alapjai
- Erőforráscsoport és előfizetés kezelése

#### Gyakorlati Feladatok
1. **Telepítés Ellenőrzése**: Telepítse az AZD-t, és ellenőrizze az `azd version` paranccsal
2. **Első Telepítés**: Telepítse sikeresen a todo-nodejs-mongo sablont
3. **Környezet Beállítása**: Konfigurálja az első környezeti változóit
4. **Erőforrás Felfedezése**: Böngéssze a telepített erőforrásokat az Azure Portálon

#### Értékelési Kérdések
- Mik az AZD projekt alapvető komponensei?
- Hogyan inicializál egy új projektet sablonból?
- Mi a különbség az `azd up` és az `azd deploy` között?
- Hogyan kezel több környezetet az AZD segítségével?

---

### 2. fejezet: AI-első Fejlesztés (2. hét)
**Időtartam**: 1-2 óra | **Komplexitás**: ⭐⭐

#### Tanulási Célok
- Az Azure AI Foundry szolgáltatások integrálása az AZD munkafolyamatokkal
- AI-alapú alkalmazások telepítése és konfigurálása
- RAG (Retrieval-Augmented Generation) implementációs minták megértése
- AI modellek telepítésének és skálázásának kezelése

#### Kulcsfogalmak, amelyeket el kell sajátítani
- Azure OpenAI szolgáltatás integrációja és API kezelése
- AI keresés konfigurációja és vektorindexelés
- Modelltelepítési stratégiák és kapacitástervezés
- AI alkalmazások monitorozása és teljesítményoptimalizálása

#### Gyakorlati Feladatok
1. **AI Chat Telepítése**: Telepítse az azure-search-openai-demo sablont
2. **RAG Implementáció**: Dokumentumindexelés és visszakeresés konfigurálása
3. **Modell Konfiguráció**: Több AI modell beállítása különböző célokra
4. **AI Monitorozás**: Application Insights implementálása AI munkaterhelésekhez

#### Értékelési Kérdések
- Hogyan konfigurálja az Azure OpenAI szolgáltatásokat egy AZD sablonban?
- Mik az RAG architektúra kulcsfontosságú komponensei?
- Hogyan kezeli az AI modellek kapacitását és skálázását?
- Milyen monitorozási metrikák fontosak az AI alkalmazásokhoz?

---

### 3. fejezet: Konfiguráció és Hitelesítés (3. hét)
**Időtartam**: 45-60 perc | **Komplexitás**: ⭐⭐

#### Tanulási Célok
- Környezetkonfigurációs és kezelési stratégiák elsajátítása
- Biztonságos hitelesítési minták és kezelt identitás implementálása
- Erőforrások szervezése megfelelő elnevezési konvenciókkal
- Több környezet telepítésének konfigurálása (fejlesztés, tesztelés, éles)

#### Kulcsfogalmak, amelyeket el kell sajátítani
- Környezet hierarchia és konfigurációs prioritások
- Kezelt identitás és szolgáltatásazonosító hitelesítés
- Key Vault integráció titkok kezeléséhez
- Környezet-specifikus paraméterek kezelése

#### Gyakorlati Feladatok
1. **Több Környezet Beállítása**: Fejlesztési, tesztelési és éles környezetek konfigurálása
2. **Biztonsági Konfiguráció**: Kezelt identitás hitelesítés implementálása
3. **Titkok Kezelése**: Azure Key Vault integrálása érzékeny adatokhoz
4. **Paraméterek Kezelése**: Környezet-specifikus konfigurációk létrehozása

#### Értékelési Kérdések
- Hogyan konfigurál különböző környezeteket az AZD-ben?
- Miért előnyösebb a kezelt identitás a szolgáltatásazonosítókhoz képest?
- Hogyan kezeli biztonságosan az alkalmazás titkait?
- Mi az AZD konfigurációs hierarchiája?

---

### 4. fejezet: Infrastruktúra Kódként és Telepítés (4-5. hét)
**Időtartam**: 1-1,5 óra | **Komplexitás**: ⭐⭐⭐

#### Tanulási Célok
- Bicep infrastruktúra sablonok létrehozása és testreszabása
- Haladó telepítési minták és munkafolyamatok implementálása
- Erőforrások biztosítási stratégiáinak megértése
- Skálázható több szolgáltatásból álló architektúrák tervezése

#### Kulcsfogalmak, amelyeket el kell sajátítani
- Bicep sablon struktúra és legjobb gyakorlatok
- Erőforrás-függőségek és telepítési sorrend
- Paraméterfájlok és sablon modularitás
- Egyedi horgok és telepítési automatizálás

#### Gyakorlati Feladatok
1. **Egyedi Sablon Létrehozása**: Több szolgáltatásból álló alkalmazás sablon létrehozása
2. **Bicep Elsajátítása**: Moduláris, újrahasználható infrastruktúra komponensek létrehozása
3. **Telepítési Automatizálás**: Elő-/utótelepítési horgok implementálása
4. **Architektúra Tervezés**: Összetett mikroszolgáltatások architektúrájának telepítése

#### Értékelési Kérdések
- Hogyan hoz létre egyedi Bicep sablonokat az AZD-hez?
- Mik a legjobb gyakorlatok az infrastruktúra kódjának szervezéséhez?
- Hogyan kezeli az erőforrás-függőségeket a sablonokban?
- Milyen telepítési minták támogatják a zéró leállási időt?

---

### 5. fejezet: Több Ügynökös AI Megoldások (6-7. hét)
**Időtartam**: 2-3 óra | **Komplexitás**: ⭐⭐⭐⭐

#### Tanulási Célok
- Több ügynökös AI architektúrák tervezése és implementálása
- Ügynökök koordinációjának és kommunikációjának irányítása
- Termelésre kész AI megoldások telepítése monitorozással
- Ügynökök specializációjának és munkafolyamat mintáinak megértése

#### Kulcsfogalmak, amelyeket el kell sajátítani
- Több ügynökös architektúra minták és tervezési elvek
- Ügynökök kommunikációs protokolljai és adatáramlás
- Terheléselosztási és skálázási stratégiák AI ügynökökhöz
- Termelési monitorozás több ügynökös rendszerekhez

#### Gyakorlati Feladatok
1. **Kiskereskedelmi Megoldás Telepítése**: Teljes több ügynökös kiskereskedelmi forgatókönyv telepítése
2. **Ügynök Testreszabása**: Vásárlói és Készlet ügynökök viselkedésének módosítása
3. **Architektúra Skálázása**: Terheléselosztás és automatikus skálázás implementálása
4. **Termelési Monitorozás**: Átfogó monitorozás és riasztás beállítása

#### Értékelési Kérdések
- Hogyan tervez hatékony több ügynökös kommunikációs mintákat?
- Melyek az AI ügynökök munkaterhelésének skálázására vonatkozó kulcsfontosságú szempontok?
- Hogyan monitorozza és hibakeresi a több ügynökös AI rendszereket?
- Milyen termelési minták biztosítják az AI ügynökök megbízhatóságát?

---

### 6. fejezet: Telepítés Előtti Érvényesítés és Tervezés (8. hét)
**Időtartam**: 1 óra | **Komplexitás**: ⭐⭐

#### Tanulási Célok
- Átfogó kapacitástervezés és erőforrás-érvényesítés végrehajtása
- Optimális Azure SKU-k kiválasztása költséghatékonyság érdekében
- Automatikus előzetes ellenőrzések és érvényesítés implementálása
- Telepítések tervezése költségoptimalizálási stratégiákkal

#### Kulcsfogalmak, amelyeket el kell sajátítani
- Azure erőforrás kvóták és kapacitáskorlátok
- SKU kiválasztási kritériumok és költségoptimalizálás
- Automatikus érvényesítési szkriptek és tesztelés
- Telepítési tervezés és kockázatértékelés

#### Gyakorlati Feladatok
1. **Kapacitáselemzés**: Elemezze az alkalmazásaihoz szükséges erőforrásokat
2. **SKU Optimalizálás**: Hasonlítsa össze és válassza ki a költséghatékony szolgáltatási szinteket
3. **Érvényesítés Automatizálása**: Telepítés előtti ellenőrzési szkriptek implementálása
4. **Költségtervezés**: Telepítési költségbecslések és költségvetések létrehozása

#### Értékelési Kérdések
- Hogyan érvényesíti az Azure kapacitást telepítés előtt?
- Milyen tényezők befolyásolják az SKU kiválasztási döntéseket?
- Hogyan automatizálja a telepítés előtti érvényesítést?
- Milyen stratégiák segítenek optimalizálni a telepítési költségeket?
2. Hogyan ellenőrizheted az Azure erőforrások elérhetőségét a telepítés előtt?  
3. Melyek egy előzetes ellenőrzési rendszer kulcsfontosságú elemei?  
4. Hogyan becsülheted meg és kontrollálhatod a telepítési költségeket?  
5. Milyen monitorozás szükséges a kapacitástervezéshez?

### 5. modul: Hibakeresés és hibaelhárítás (6. hét)

#### Tanulási célok  
- Ismerd meg a szisztematikus hibaelhárítási módszereket  
- Fejleszd a komplex telepítési problémák hibakeresési készségeit  
- Valósíts meg átfogó monitorozási és riasztási rendszereket  
- Építs incidenskezelési és helyreállítási eljárásokat  

#### Kulcsfogalmak, amelyeket el kell sajátítani  
- Gyakori telepítési hibák mintázatai  
- Naplóelemzési és korrelációs technikák  
- Teljesítményfigyelés és optimalizálás  
- Biztonsági incidensek észlelése és kezelése  
- Katasztrófa utáni helyreállítás és üzletmenet-folytonosság  

#### Gyakorlati feladatok  

**5.1 gyakorlat: Hibaelhárítási forgatókönyvek**  
```bash
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```  

**5.2 gyakorlat: Monitorozás megvalósítása**  
```bash
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```  

**5.3 gyakorlat: Incidenskezelés**  
```bash
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```  

#### Önértékelési kérdések  
1. Mi a szisztematikus megközelítés az azd telepítések hibaelhárításához?  
2. Hogyan korrelálhatod a naplókat több szolgáltatás és erőforrás között?  
3. Mely monitorozási metrikák a legkritikusabbak a korai problémák észleléséhez?  
4. Hogyan valósíthatsz meg hatékony katasztrófa utáni helyreállítási eljárásokat?  
5. Melyek egy incidenskezelési terv kulcsfontosságú elemei?  

### 6. modul: Haladó témák és legjobb gyakorlatok (7-8. hét)

#### Tanulási célok  
- Valósíts meg vállalati szintű telepítési mintákat  
- Sajátítsd el a CI/CD integrációt és automatizálást  
- Fejlessz egyedi sablonokat és járulj hozzá a közösséghez  
- Értsd meg a haladó biztonsági és megfelelőségi követelményeket  

#### Kulcsfogalmak, amelyeket el kell sajátítani  
- CI/CD csővezeték integrációs minták  
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
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```  

**6.3 gyakorlat: Vállalati megvalósítás**  
```bash
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```  

#### Önértékelési kérdések  
1. Hogyan integrálhatod az azd-t meglévő CI/CD munkafolyamatokba?  
2. Melyek az egyedi sablonfejlesztés kulcsfontosságú szempontjai?  
3. Hogyan valósíthatsz meg irányítást és megfelelőséget az azd telepítésekben?  
4. Melyek a legjobb gyakorlatok vállalati szintű telepítésekhez?  
5. Hogyan járulhatsz hozzá hatékonyan az azd közösséghez?  

## Gyakorlati projektek  

### 1. projekt: Személyes portfólió weboldal  
**Komplexitás**: Kezdő  
**Időtartam**: 1-2 hét  

Készíts és telepíts egy személyes portfólió weboldalt az alábbiak használatával:  
- Statikus weboldal hosztolása Azure Storage-on  
- Egyedi domain konfiguráció  
- CDN integráció globális teljesítmény érdekében  
- Automatizált telepítési csővezeték  

**Leadandók**:  
- Működő weboldal telepítve az Azure-ra  
- Egyedi azd sablon portfólió telepítésekhez  
- Telepítési folyamat dokumentációja  
- Költségelemzés és optimalizálási ajánlások  

### 2. projekt: Feladatkezelő alkalmazás  
**Komplexitás**: Középhaladó  
**Időtartam**: 2-3 hét  

Hozz létre egy teljes stack feladatkezelő alkalmazást az alábbiakkal:  
- React frontend App Service-re telepítve  
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

Tervezd meg és valósítsd meg egy mikroservices alapú e-kereskedelmi platformot:  
- Több API szolgáltatás (katalógus, rendelések, fizetések, felhasználók)  
- Üzenetsor integráció Service Bus-szal  
- Redis cache teljesítményoptimalizáláshoz  
- Átfogó naplózás és monitorozás  

**Leadandók**:  
- Teljes mikroservices architektúra  
- Szolgáltatások közötti kommunikációs minták  
- Teljesítménytesztelés és optimalizálás  
- Produkcióra kész biztonsági megvalósítás  

## Értékelés és tanúsítás  

### Tudásellenőrzések  

Végezd el ezeket az értékeléseket minden modul után:  

**1. modul értékelés**: Alapfogalmak és telepítés  
- Feleletválasztós kérdések az alapfogalmakról  
- Gyakorlati telepítési és konfigurációs feladatok  
- Egyszerű telepítési gyakorlat  

**2. modul értékelés**: Konfiguráció és környezetek  
- Környezetkezelési forgatókönyvek  
- Konfigurációs hibaelhárítási gyakorlatok  
- Biztonsági konfiguráció megvalósítása  

**3. modul értékelés**: Telepítés és erőforrások létrehozása  
- Infrastruktúra tervezési kihívások  
- Több szolgáltatás telepítési forgatókönyvei  
- Teljesítményoptimalizálási gyakorlatok  

**4. modul értékelés**: Telepítés előtti validáció  
- Kapacitástervezési esettanulmányok  
- Költségoptimalizálási forgatókönyvek  
- Validációs csővezeték megvalósítása  

**5. modul értékelés**: Hibakeresés és hibaelhárítás  
- Problémadiagnosztikai gyakorlatok  
- Monitorozási megvalósítási feladatok  
- Incidenskezelési szimulációk  

**6. modul értékelés**: Haladó témák  
- CI/CD csővezeték tervezés  
- Egyedi sablon fejlesztés  
- Vállalati architektúra forgatókönyvek  

### Záró projekt  

Tervezd meg és valósítsd meg egy teljes megoldást, amely bemutatja az összes fogalom elsajátítását:  

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
- **5-6. hét**: 5-6. modul (Hibaelhárítás, Haladó témák)  
- **7-8. hét**: Gyakorlati projektek és záró értékelés  

### Részmunkaidős tanulás (16 hét)  
- **1-4. hét**: 1. modul (Kezdetek)  
- **5-7. hét**: 2. modul (Konfiguráció és környezetek)  
- **8-10. hét**: 3. modul (Telepítés és erőforrások létrehozása)  
- **11-12. hét**: 4. modul (Telepítés előtti validáció)  
- **13-14. hét**: 5. modul (Hibaelhárítás és hibaelhárítás)  
- **15-16. hét**: 6. modul (Haladó témák és értékelés)  

---

## Haladáskövetés és értékelési keretrendszer  

### Fejezetek teljesítési ellenőrzőlistája  

Kövesd nyomon a haladásodat minden fejezetben az alábbi mérhető eredményekkel:  

#### 📚 1. fejezet: Alapok és gyors kezdés  
- [ ] **Telepítés befejezve**: AZD telepítve és ellenőrizve a platformodon  
- [ ] **Első telepítés**: Sikeresen telepítve a todo-nodejs-mongo sablon  
- [ ] **Környezet beállítása**: Első környezeti változók konfigurálva  
- [ ] **Erőforrás navigáció**: Telepített erőforrások felfedezése az Azure Portálon  
- [ ] **Parancsok elsajátítása**: Magabiztosan használod az alapvető AZD parancsokat  

#### 🤖 2. fejezet: AI-első fejlesztés  
- [ ] **AI sablon telepítése**: Sikeresen telepítve az azure-search-openai-demo  
- [ ] **RAG megvalósítása**: Dokumentum indexelés és visszakeresés konfigurálva  
- [ ] **Modell konfiguráció**: Több AI modell beállítva különböző célokra  
- [ ] **AI monitorozás**: Application Insights megvalósítva AI munkaterhelésekhez  
- [ ] **Teljesítményoptimalizálás**: AI alkalmazás teljesítményének hangolása  

#### ⚙️ 3. fejezet: Konfiguráció és hitelesítés  
- [ ] **Több környezet beállítása**: Fejlesztési, tesztelési és éles környezetek konfigurálva  
- [ ] **Biztonsági megvalósítás**: Kezelt identitás hitelesítés beállítva  
- [ ] **Titkok kezelése**: Azure Key Vault integrálva érzékeny adatokhoz  
- [ ] **Paraméterek kezelése**: Környezet-specifikus konfigurációk létrehozva  
- [ ] **Hitelesítés elsajátítása**: Biztonságos hozzáférési minták megvalósítva  

#### 🏗️ 4. fejezet: Infrastruktúra kódként és telepítés  
- [ ] **Egyedi sablon létrehozása**: Több szolgáltatásból álló alkalmazás sablonja elkészítve  
- [ ] **Bicep elsajátítása**: Moduláris, újrahasználható infrastruktúra komponensek létrehozva  
- [ ] **Telepítési automatizálás**: Telepítés előtti/utáni horgok megvalósítva  
- [ ] **Architektúra tervezés**: Komplex mikroservices architektúra telepítve  
- [ ] **Sablon optimalizálás**: Sablonok optimalizálva teljesítményre és költségre  

#### 🎯 5. fejezet: Többügynökös AI megoldások  
- [ ] **Kiskereskedelmi megoldás telepítése**: Teljes többügynökös kiskereskedelmi forgatókönyv telepítve  
- [ ] **Ügynök testreszabása**: Ügyfél és készlet ügynök viselkedésének módosítása  
- [ ] **Architektúra skálázása**: Terheléselosztás és automatikus skálázás megvalósítva  
- [ ] **Produkciós monitorozás**: Átfogó monitorozás és riasztás beállítva  
- [ ] **Teljesítményhangolás**: Többügynökös rendszer teljesítményének optimalizálása  

#### 🔍 6. fejezet: Telepítés előtti validáció és tervezés  
- [ ] **Kapacitáselemzés**: Alkalmazások erőforrásigényeinek elemzése  
- [ ] **SKU optimalizálás**: Költséghatékony szolgáltatási szintek kiválasztása  
- [ ] **Validációs automatizálás**: Telepítés előtti ellenőrzési szkriptek megvalósítása  
- [ ] **Költségtervezés**: Telepítési költségbecslések és költségvetések létrehozása  
- [ ] **Kockázatelemzés**: Telepítési kockázatok azonosítása és csökkentése  

#### 🚨 7. fejezet: Hibakeresés és hibaelhárítás  
- [ ] **Diagnosztikai készségek**: Sikeresen hibakeresett szándékosan hibás telepítések  
- [ ] **Naplóelemzés**: Azure Monitor és Application Insights hatékony használata  
- [ ] **Teljesítményhangolás**: Lassú alkalmazások optimalizálása  
- [ ] **Helyreállítási eljárások**: Biztonsági mentés és katasztrófa utáni helyreállítás megvalósítása  
- [ ] **Monitorozás beállítása**: Proaktív monitorozás és riasztás létrehozása  

#### 🏢 8. fejezet: Produkciós és vállalati minták  
- [ ] **Vállalati biztonság**: Átfogó biztonsági minták megvalósítása  
- [ ] **Irányítási keretrendszer**: Azure Policy és erőforráskezelés beállítása  
- [ ] **Haladó monitorozás**: Irányítópultok és automatizált riasztás létrehozása  
- [ ] **CI/CD integráció**: Automatizált telepítési csővezetékek létrehozása  
- [ ] **Megfelelőség megvalósítása**: V
- **Dokumentáció**: Közösségi dokumentációhoz és példákhoz való hozzájárulás
- **Visszacsatolási kör**: Vélemény megosztása a tanfolyami tartalomról és az Azure szolgáltatásokról

#### Karrierfejlesztés
- **Szakmai hálózat**: Kapcsolatépítés Azure és AI szakértőkkel
- **Előadási lehetőségek**: Tanulságok bemutatása konferenciákon vagy találkozókon
- **Nyílt forráskódú hozzájárulás**: Közreműködés AZD sablonok és eszközök fejlesztésében
- **Mentorálás**: Más fejlesztők segítése az AZD tanulási folyamatukban

---

**Fejezet navigáció:**
- **📚 Tanfolyam kezdőlapja**: [AZD Kezdőknek](../README.md)
- **📖 Tanulás kezdése**: [1. fejezet: Alapok és gyors kezdés](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Haladás nyomon követése**: Kövesd előrehaladásodat a 8 fejezetből álló átfogó tanulási rendszerben
- **🤝 Közösség**: [Azure Discord](https://discord.gg/microsoft-azure) támogatásért és megbeszélésekhez

**Tanulási haladás nyomon követése**: Használd ezt a strukturált útmutatót az Azure Developer CLI elsajátításához, fokozatos, gyakorlati tanulással, mérhető eredményekkel és szakmai fejlődési lehetőségekkel.

---

**Felelősség kizárása**:  
Ez a dokumentum az AI fordítási szolgáltatás [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével lett lefordítva. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Kritikus információk esetén javasolt professzionális emberi fordítást igénybe venni. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely a fordítás használatából eredhet.