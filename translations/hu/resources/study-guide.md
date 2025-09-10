<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7634850a19864a183bc82ab5ac993c8a",
  "translation_date": "2025-09-10T07:08:21+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "hu"
}
-->
# Tanulási Útmutató - AZD Kezdőknek

## Bevezetés

Ez az átfogó tanulási útmutató strukturált tanulási célokat, kulcsfogalmakat, gyakorlati feladatokat és értékelési anyagokat biztosít, hogy elsajátítsd az Azure Developer CLI (azd) használatát. Használd ezt az útmutatót a haladásod nyomon követésére, és győződj meg róla, hogy minden lényeges témát lefedtél.

## Tanulási Célok

Az útmutató elvégzésével:
- Elsajátítod az Azure Developer CLI alapvető és haladó fogalmait
- Gyakorlati készségeket szerzel az Azure alkalmazások telepítésében és kezelésében
- Magabiztosságot építesz a hibakeresésben és a telepítések optimalizálásában
- Megérted a termelésre kész telepítési gyakorlatokat és a biztonsági szempontokat

## Tanulási Eredmények

Az útmutató összes szakaszának elvégzése után képes leszel:
- Teljes alkalmazásarchitektúrákat tervezni, telepíteni és kezelni az azd segítségével
- Átfogó monitorozási, biztonsági és költségoptimalizálási stratégiákat megvalósítani
- Önállóan elhárítani összetett telepítési problémákat
- Egyedi sablonokat létrehozni és hozzájárulni az azd közösséghez

## Tanfolyam Felépítése

### 1. Modul: Első Lépések (1-2. hét)

#### Tanulási Célok
- Megérteni az Azure Developer CLI alapjait és kulcsfogalmait
- Sikeresen telepíteni és konfigurálni az azd-t a fejlesztői környezetedben
- Végrehajtani az első telepítést egy meglévő sablon használatával
- Navigálni az azd projektstruktúrában és megérteni a kulcselemeket

#### Kulcsfogalmak
- Sablonok, környezetek és szolgáltatások
- azure.yaml konfigurációs struktúra
- Alapvető azd parancsok (init, up, down, deploy)
- Infrastruktúra mint kód elvek
- Azure hitelesítés és jogosultságkezelés

#### Gyakorlati Feladatok

**1.1 Gyakorlat: Telepítés és Beállítás**  
```bash
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**1.2 Gyakorlat: Első Telepítés**  
```bash
# Deploy a simple web application:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**1.3 Gyakorlat: Projektstruktúra Elemzése**  
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### Önellenőrző Kérdések
1. Mik az azd architektúra három alapfogalma?
2. Mi az azure.yaml fájl célja?
3. Hogyan segítenek a környezetek a különböző telepítési célok kezelésében?
4. Milyen hitelesítési módszerek használhatók az azd-vel?
5. Mi történik, amikor először futtatod az `azd up` parancsot?

### 2. Modul: Konfiguráció és Környezetek (3. hét)

#### Tanulási Célok
- Elsajátítani a környezetkezelést és konfigurációt
- Megérteni az azure.yaml haladó beállításait
- Környezet-specifikus beállításokat és változókat megvalósítani
- Hitelesítést konfigurálni különböző forgatókönyvekhez

#### Kulcsfogalmak
- Környezeti hierarchia és változóelsőbbség
- Szolgáltatáskonfiguráció és paraméterek
- Horgok és életciklus események
- Hitelesítési módszerek (felhasználó, szolgáltatási főnév, kezelt identitás)
- Konfigurációs fájlok kezelése

#### Gyakorlati Feladatok

**2.1 Gyakorlat: Több Környezet Beállítása**  
```bash
# Create and configure multiple environments:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**2.2 Gyakorlat: Haladó Konfiguráció**  
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**2.3 Gyakorlat: Biztonsági Konfiguráció**  
```bash
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Önellenőrző Kérdések
1. Hogyan kezeli az azd a környezeti változók elsőbbségét?
2. Mik azok a telepítési horgok, és mikor érdemes használni őket?
3. Hogyan konfigurálhatsz különböző SKU-kat különböző környezetekhez?
4. Milyen biztonsági következményei vannak a különböző hitelesítési módszereknek?
5. Hogyan kezelheted a titkokat és érzékeny konfigurációs adatokat?

### 3. Modul: Telepítés és Provisionálás (4. hét)

#### Tanulási Célok
- Elsajátítani a telepítési munkafolyamatokat és legjobb gyakorlatokat
- Megérteni az Infrastruktúra mint kódot Bicep sablonokkal
- Összetett, több szolgáltatásból álló architektúrákat megvalósítani
- Optimalizálni a telepítési teljesítményt és megbízhatóságot

#### Kulcsfogalmak
- Bicep sablonstruktúra és modulok
- Erőforrás-függőségek és sorrend
- Telepítési stratégiák (blue-green, gördülő frissítések)
- Több régiós telepítések
- Adatbázis-migrációk és adatkezelés

#### Gyakorlati Feladatok

**3.1 Gyakorlat: Egyedi Infrastruktúra**  
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**3.2 Gyakorlat: Több Szolgáltatásból Álló Alkalmazás**  
```bash
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**3.3 Gyakorlat: Adatbázis Integráció**  
```bash
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Önellenőrző Kérdések
1. Milyen előnyei vannak a Bicep használatának az ARM sablonokkal szemben?
2. Hogyan kezelheted az adatbázis-migrációkat az azd telepítések során?
3. Milyen stratégiák léteznek a nulla állásidős telepítésekhez?
4. Hogyan kezelheted a szolgáltatások közötti függőségeket?
5. Milyen szempontokat kell figyelembe venni a több régiós telepítéseknél?

### 4. Modul: Telepítés Előtti Ellenőrzés (5. hét)

#### Tanulási Célok
- Átfogó telepítés előtti ellenőrzéseket megvalósítani
- Kapacitástervezést és erőforrás-ellenőrzést elsajátítani
- SKU kiválasztást és költségoptimalizálást megérteni
- Automatizált ellenőrzési folyamatokat építeni

#### Kulcsfogalmak
- Azure erőforrás-kvóták és korlátok
- SKU kiválasztási kritériumok és költségvonzatok
- Automatizált ellenőrzési szkriptek és eszközök
- Kapacitástervezési módszerek
- Teljesítménytesztelés és optimalizálás

#### Gyakorlati Feladatok

**4.1 Gyakorlat: Kapacitástervezés**  
```bash
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**4.2 Gyakorlat: Telepítés Előtti Ellenőrzés**  
```powershell
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**4.3 Gyakorlat: SKU Optimalizálás**  
```bash
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Önellenőrző Kérdések
1. Milyen tényezők befolyásolják az SKU kiválasztási döntéseket?
2. Hogyan ellenőrizheted az Azure erőforrások elérhetőségét telepítés előtt?
3. Mik az alapvető elemei egy telepítés előtti ellenőrzési rendszernek?
4. Hogyan becsülheted meg és szabályozhatod a telepítési költségeket?
5. Milyen monitorozás szükséges a kapacitástervezéshez?

### 5. Modul: Hibakeresés és Hibaelhárítás (6. hét)

#### Tanulási Célok
- Szisztematikus hibakeresési módszertanokat elsajátítani
- Összetett telepítési problémák hibakeresésében jártasságot szerezni
- Átfogó monitorozást és riasztásokat megvalósítani
- Incidenskezelési és helyreállítási eljárásokat kidolgozni

#### Kulcsfogalmak
- Gyakori telepítési hibaminták
- Naplóelemzési és korrelációs technikák
- Teljesítményfigyelés és optimalizálás
- Biztonsági incidensek észlelése és kezelése
- Katasztrófa utáni helyreállítás és üzletmenet-folytonosság

#### Gyakorlati Feladatok

**5.1 Gyakorlat: Hibakeresési Forgatókönyvek**  
```bash
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**5.2 Gyakorlat: Monitorozás Megvalósítása**  
```bash
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**5.3 Gyakorlat: Incidenskezelés**  
```bash
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Önellenőrző Kérdések
1. Mi a szisztematikus megközelítés az azd telepítések hibakereséséhez?
2. Hogyan korrelálhatod a naplókat több szolgáltatás és erőforrás között?
3. Mely monitorozási metrikák a legkritikusabbak a problémák korai észleléséhez?
4. Hogyan valósíthatsz meg hatékony katasztrófa utáni helyreállítási eljárásokat?
5. Mik az incidenskezelési terv kulcselemei?

### 6. Modul: Haladó Témák és Legjobb Gyakorlatok (7-8. hét)

#### Tanulási Célok
- Vállalati szintű telepítési minták megvalósítása
- CI/CD integráció és automatizálás elsajátítása
- Egyedi sablonok fejlesztése és közösségi hozzájárulás
- Haladó biztonsági és megfelelőségi követelmények megértése

#### Kulcsfogalmak
- CI/CD folyamat integrációs minták
- Egyedi sablonfejlesztés és terjesztés
- Vállalati irányítás és megfelelőség
- Haladó hálózati és biztonsági konfigurációk
- Teljesítményoptimalizálás és költségkezelés

#### Gyakorlati Feladatok

**6.1 Gyakorlat: CI/CD Integráció**  
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**6.2 Gyakorlat: Egyedi Sablonfejlesztés**  
```bash
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**6.3 Gyakorlat: Vállalati Megvalósítás**  
```bash
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Önellenőrző Kérdések
1. Hogyan integrálhatod az azd-t meglévő CI/CD munkafolyamatokba?
2. Melyek az egyedi sablonfejlesztés kulcsfontosságú szempontjai?
3. Hogyan valósíthatod meg az irányítást és megfelelést az azd telepítésekben?
4. Melyek a legjobb gyakorlatok vállalati szintű telepítésekhez?
5. Hogyan járulhatsz hozzá hatékonyan az azd közösséghez?
3. **Járulj hozzá az Open Source-hoz**: Oszd meg sablonjaidat és megoldásaidat a közösséggel  
4. **Taníts másokat**: A fogalmak magyarázata másoknak erősíti a saját megértésedet  
5. **Légy kíváncsi**: Folyamatosan fedezz fel új Azure szolgáltatásokat és integrációs mintákat  

---

**Navigáció**  
- **Előző lecke**: [GYIK](faq.md)  
- **Következő lecke**: [Változásnapló](../changelog.md)  

**Tanulási folyamat nyomon követése**: Használd ezt az útmutatót, hogy nyomon kövesd tanulási utadat, és biztosítsd az Azure Developer CLI összes fogalmának és gyakorlatának átfogó elsajátítását.  

---

**Felelősségkizárás**:  
Ezt a dokumentumot az [Co-op Translator](https://github.com/Azure/co-op-translator) AI fordítószolgáltatás segítségével fordítottuk le. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Kritikus információk esetén javasolt professzionális, emberi fordítást igénybe venni. Nem vállalunk felelősséget a fordítás használatából eredő félreértésekért vagy téves értelmezésekért.