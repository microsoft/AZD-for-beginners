# Szószedet - Azure és AZD Terminológia

**Hivatkozás az összes fejezethez**
- **📚 Tanfolyam kezdőlapja**: [AZD kezdőknek](../README.md)
- **📖 Alapok elsajátítása**: [1. fejezet: AZD alapok](../docs/getting-started/azd-basics.md)
- **🤖 MI kifejezések**: [2. fejezet: MI-központú fejlesztés](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## Bevezetés

Ez az átfogó szószedet meghatározza az Azure Developer CLI és az Azure felhőfejlesztés során használt kifejezéseket, fogalmakat és rövidítéseket. Alapvető hivatkozás a műszaki dokumentáció megértéséhez, hibakereséshez és az azd projektek és Azure szolgáltatások hatékony kommunikációjához.

## Tanulási célok

A szószedet használatával:
- Megérted az alapvető Azure Developer CLI terminológiát és fogalmakat
- Elsajátítod az Azure felhőfejlesztési szókincset és műszaki kifejezéseket
- Hatékonyan hivatkozol az Infrastructure as Code és telepítési fogalmakra
- Megérted az Azure szolgáltatások neveit, rövidítéseit és céljaikat
- Hozzáférsz hibaelhárítási és debug kifejezések definícióihoz
- Megtanulod a fejlett Azure architektúra és fejlesztési fogalmakat

## Tanulási eredmények

A szószedet rendszeres használatával képes leszel:
- Hatékonyan kommunikálni a megfelelő Azure Developer CLI terminológiával
- Világosabban érteni a műszaki dokumentációt és hibaüzeneteket
- Magabiztosan eligazodni az Azure szolgáltatások és fogalmak között
- Megfelelő műszaki szókincset használva hibákat elhárítani
- Pontos műszaki nyelvezetet használva hozzájárulni a csapatbeszélgetésekhez
- Rendszeresen bővíteni Azure felhőfejlesztési ismereteidet

## A

**ARM Template**  
Azure Resource Manager sablon. JSON alapú Infrastructure as Code formátum, amely deklaratívan definiálja és telepíti az Azure erőforrásokat.

**App Service**  
Az Azure platform szolgáltatása (PaaS), amely webalkalmazások, REST API-k és mobil háttérrendszerek hosztolására szolgál, infrastruktúra kezelése nélkül.

**Application Insights**  
Az Azure alkalmazás teljesítményfigyelő (APM) szolgáltatása, amely mélyreható betekintést nyújt az alkalmazás teljesítményébe, rendelkezésre állásába és használatába.

**Azure CLI**  
Parancssoros felület az Azure erőforrások kezelésére. Az azd által használatos hitelesítéshez és néhány művelethez.

**Azure Developer CLI (azd)**  
Fejlesztőközpontú parancssori eszköz, amely felgyorsítja az alkalmazások Azure-ba történő építését és telepítését sablonok és Infrastructure as Code használatával.

**azure.yaml**  
Az azd projekt fő konfigurációs fájlja, amely meghatározza a szolgáltatásokat, infrastruktúrát és telepítési horgonyokat.

**Azure Resource Manager (ARM)**  
Az Azure telepítési és menedzsment szolgáltatása, amely egy kezelőréteget biztosít erőforrások létrehozásához, frissítéséhez és törléséhez.

## B

**Bicep**  
Microsoft által fejlesztett domain-specifikus nyelv (DSL) az Azure erőforrások telepítésére. Egyszerűbb szintaxist kínál az ARM sablonokhoz képest, miközben ARM kódra fordul.

**Build**  
A forráskód lefordításának, függőségek telepítésének és az alkalmazások telepítésre előkészítésének folyamata.

**Blue-Green Deployment**  
Telepítési stratégia, amely két azonos termelési környezetet (kék és zöld) használ a leállás és kockázat minimalizálására.

## C

**Container Apps**  
Az Azure szerver nélküli konténer-szolgáltatása, amely lehetővé teszi konténerizált alkalmazások futtatását komplikált infrastruktúra kezelés nélkül.

**CI/CD**  
Continuous Integration/Continuous Deployment. Automatikus gyakorlatok a kódváltozások integrálására és alkalmazások telepítésére.

**Cosmos DB**  
Az Azure globálisan elosztott, többmodellű adatbázis szolgáltatása, amely átfogó SLA-kat biztosít átbocsátóképességre, késleltetésre, rendelkezésre állásra és konzisztenciára.

**Configuration**  
Beállítások és paraméterek, amelyek szabályozzák az alkalmazás viselkedését és telepítési opcióit.

## D

**Deployment**  
Az alkalmazások és azok függőségeinek a célinfrastruktúrára történő telepítési és konfigurációs folyamata.

**Docker**  
Platform alkalmazások fejlesztésére, szállítására és futtatására konténerizációs technológia használatával.

**Dockerfile**  
Szöveges fájl, amely utasításokat tartalmaz egy Docker konténerkép építéséhez.

## E

**Environment**  
Egy telepítési cél, amely az alkalmazás egy adott példányát jelenti (pl. fejlesztés, tesztelés, éles).

**Environment Variables**  
Konfigurációs értékek kulcs-érték párokként tárolva, amelyekhez az alkalmazások futtatás közben hozzáférhetnek.

**Endpoint**  
URL vagy hálózati cím, ahol egy alkalmazás vagy szolgáltatás elérhető.

## F

**Function App**  
Az Azure szerver nélküli számítási szolgáltatása, amely lehetővé teszi eseményvezérelt kódok futtatását infrastruktúra kezelése nélkül.

## G

**GitHub Actions**  
CI/CD platform, amely integrálva van GitHub tárhelyekkel munkafolyamatok automatizálásához.

**Git**  
Elosztott verziókövető rendszer, amely a forráskód változásainak nyomon követésére szolgál.

## H

**Hooks**  
Egyedi szkriptek vagy parancsok, amelyek a telepítési életciklus adott pontjain futnak (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Az Azure szolgáltatás típusa, ahol az alkalmazást telepítik (pl. appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Az infrastruktúra kód általi definiálásának és kezelésének gyakorlata manuális folyamatok helyett.

**Init**  
Új azd projekt inicializálási folyamata, általában sablonból.

## J

**JSON**  
JavaScript Object Notation. Adatcserére használt formátum, amely gyakran konfigurációs fájlokban és API válaszokban használatos.

**JWT**  
JSON Web Token. Szabvány biztonságos információátvitelre felek között JSON objektumként.

## K

**Key Vault**  
Az Azure szolgáltatása titkok, kulcsok és tanúsítványok biztonságos tárolására és kezelésére.

**Kusto Query Language (KQL)**  
Lekérdező nyelv az Azure Monitor, Application Insights és más Azure szolgáltatások adatainak elemzésére.

## L

**Load Balancer**  
Szolgáltatás, amely bejövő hálózati forgalmat oszt el több szerver vagy példány között.

**Log Analytics**  
Az Azure szolgáltatása telemetriai adatok gyűjtésére, elemzésére és reagálásra felhős és helyszíni környezetekből.

## M

**Managed Identity**  
Az Azure funkciója, amely automatikusan kezelt identitást biztosít Azure szolgáltatásoknak hitelesítéshez más Azure szolgáltatások felé.

**Microservices**  
Olyan architekturális megközelítés, ahol az alkalmazások kicsi, független szolgáltatások gyűjteményeként épülnek fel.

**Monitor**  
Az Azure egységes felügyeleti megoldása, amely teljes körű megfigyelhetőséget nyújt alkalmazások és infrastruktúra fölött.

## N

**Node.js**  
JavaScript futtatókörnyezet a Chrome V8 JavaScript motorján alapulva szerveroldali alkalmazások fejlesztéséhez.

**npm**  
Node.js csomagkezelő, amely kezeli a függőségeket és csomagokat.

## O

**Output**  
Olyan értékek, amelyeket az infrastruktúra telepítése ad vissza, amelyeket alkalmazások vagy más erőforrások használhatnak.

## P

**Package**  
Az alkalmazáskód és függőségek telepítéshez való előkészítési folyamata.

**Parameters**  
Bemeneti értékek, amelyeket az infrastruktúra sablonokhoz adnak a telepítés testreszabásához.

**PostgreSQL**  
Nyílt forráskódú relációs adatbázis rendszer, amely az Azure-ban menedzselt szolgáltatásként elérhető.

**Provisioning**  
Az Azure erőforrások létrehozásának és konfigurálásának folyamata az infrastruktúra sablonok alapján.

## Q

**Quota**  
Megszabott korlátok az Azure előfizetésen vagy régióban létrehozható erőforrásokra.

## R

**Resource Group**  
Logikai tároló az Azure erőforrásoknak, amelyek ugyanazzal az élettartammal, jogosultságokkal és szabályzatokkal rendelkeznek.

**Resource Token**  
Az azd által generált egyedi karakterlánc, amely biztosítja az erőforrásnevek egyediségét a telepítések között.

**REST API**  
Architekturális stílus hálózatos alkalmazások tervezéséhez HTTP metódusok használatával.

**Rollback**  
Folyamat, amely visszaállítja az alkalmazás vagy infrastruktúra konfiguráció korábbi verzióját.

## S

**Service**  
Az alkalmazás egy komponense, amely az azure.yaml-ban van definiálva (pl. web frontend, API backend, adatbázis).

**SKU**  
Stock Keeping Unit. Az Azure erőforrások különböző szolgáltatási szintjeit vagy teljesítményosztályait jelöli.

**SQL Database**  
Az Azure menedzselt relációs adatbázis szolgáltatása, amely Microsoft SQL Server alapokon működik.

**Static Web Apps**  
Az Azure szolgáltatása teljes stack webalkalmazások építésére és telepítésére forráskódtárakból.

**Storage Account**  
Az Azure szolgáltatása, amely felhőalapú tárhelyet biztosít adatobjektumok, például blobok, fájlok, sorok és táblák számára.

**Subscription**  
Azure fiók konténer, amely erőforráscsoportokat és erőforrásokat tartalmaz, valamint számlázási és hozzáférés-kezelési funkciókat.

## T

**Template**  
Előre elkészített projektstruktúra, amely alkalmazáskódot, infrastruktúra definíciókat és konfigurációkat tartalmaz gyakori forgatókönyvekhez.

**Terraform**  
Nyílt forráskódú Infrastructure as Code eszköz, amely több felhőszolgáltatót, köztük Azure-t támogat.

**Traffic Manager**  
Az Azure DNS alapú forgalomelosztó szolgáltatása, amely globális Azure régiók között osztja el a forgalmat.

## U

**URI**  
Uniform Resource Identifier. Karakterlánc, amely azonosít egy adott erőforrást.

**URL**  
Uniform Resource Locator. URI egy típusa, amely meghatározza az erőforrás helyét és elérési módját.

## V

**Virtual Network (VNet)**  
Alapvető építőelem az Azure privát hálózataihoz, izolációt és szeparációt biztosít.

**VS Code**  
Visual Studio Code. Népszerű kódszerkesztő kiváló Azure és azd integrációval.

## W

**Webhook**  
HTTP visszahívás, amely specifikus események hatására aktiválódik, gyakran használják CI/CD folyamatokban.

**What-if**  
Azure funkció, amely megmutatja egy telepítés várható változtatásait anélkül, hogy ténylegesen végrehajtaná azokat.

## Y

**YAML**  
YAML Ain't Markup Language. Ember által olvasható adat-szétosztási szabvány, amely konfigurációs fájlokban, például azure.yaml-ban használatos.

## Z

**Zone**  
Fizikailag különálló helyszínek egy Azure régión belül, amelyek redundanciát és magas rendelkezésre állást biztosítanak.

---

## Gyakori rövidítések

| Rövidítés | Teljes alak | Leírás |
|---------|-----------|-------------|
| AAD | Azure Active Directory | Identitás- és hozzáférés-kezelési szolgáltatás |
| ACR | Azure Container Registry | Konténerkép tároló szolgáltatás |
| AKS | Azure Kubernetes Service | Menedzselt Kubernetes szolgáltatás |
| API | Application Programming Interface | Szoftverépítő protokollok halmaza |
| ARM | Azure Resource Manager | Az Azure telepítési és menedzsment szolgáltatása |
| CDN | Content Delivery Network | Elosztott szerverhálózat |
| CI/CD | Continuous Integration/Continuous Deployment | Automatizált fejlesztési gyakorlatok |
| CLI | Command Line Interface | Szöveges felhasználói felület |
| DNS | Domain Name System | Tartománynév IP címre fordító rendszer |
| HTTPS | Hypertext Transfer Protocol Secure | HTTP titkosított változata |
| IaC | Infrastructure as Code | Infrastruktúra kód általi kezelése |
| JSON | JavaScript Object Notation | Adatcsere formátum |
| JWT | JSON Web Token | Biztonságos információátvitel token formátuma |
| KQL | Kusto Query Language | Lekérdező nyelv Azure adat szolgáltatásokhoz |
| RBAC | Role-Based Access Control | Szerepalapú hozzáférés-vezérlés |
| REST | Representational State Transfer | Webszolgáltatások architekturális stílusa |
| SDK | Software Development Kit | Fejlesztőeszközök gyűjteménye |
| SLA | Service Level Agreement | Szolgáltatási rendelkezés a rendelkezésre állásról/teljesítményről |
| SQL | Structured Query Language | Relációs adatbázisok kezelő nyelve |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Kriptográfiai protokollok |
| URI | Uniform Resource Identifier | Erőforrás azonosító karakterlánc |
| URL | Uniform Resource Locator | URI típusa, amely az erőforrás helyét meghatározza |
| VM | Virtual Machine | Számítógéprendszer emulációja |
| VNet | Virtual Network | Privát hálózat az Azure-ban |
| YAML | YAML Ain't Markup Language | Adatszerializációs szabvány |

---

## Azure szolgáltatásnév megfeleltetések

| Gyakori név | Hivatalos Azure szolgáltatás neve | azd host típus |
|-------------|------------------------------|---------------|
| Web App | Azure App Service | `appservice` |
| API App | Azure App Service | `appservice` |
| Container App | Azure Container Apps | `containerapp` |
| Function | Azure Functions | `function` |
| Static Site | Azure Static Web Apps | `staticwebapp` |
| Database | Azure Database for PostgreSQL | `postgres` |
| NoSQL DB | Azure Cosmos DB | `cosmosdb` |
| Storage | Azure Storage Account | `storage` |
| Cache | Azure Cache for Redis | `redis` |
| Search | Azure Cognitive Search | `search` |
| Messaging | Azure Service Bus | `servicebus` |

---

## Kontextspezifikus kifejezések

### Fejlesztési kifejezések
- **Hot Reload**: Az alkalmazások automatikus frissítése fejlesztés közben újraindítás nélkül
- **Build Pipeline**: Automatizált folyamat kód építésére és tesztelésére
- **Deployment Slot**: Tesztelési környezet egy App Service-en belül
- **Environment Parity**: Fejlesztési, tesztelési és éles környezetek hasonlóvá tétele

### Biztonsági kifejezések
- **Managed Identity**: Automatikus hitelesítés-kezelési funkció az Azure-ban
- **Key Vault**: Titkok, kulcsok és tanúsítványok biztonságos tárolása
- **RBAC**: Szerepalapú hozzáférés-vezérlés az Azure erőforrásokhoz
- **Network Security Group**: Virtuális tűzfal hálózati forgalom szabályozására

### Felügyeleti kifejezések
- **Telemetry**: Automatikus mérési és adatgyűjtési folyamat
- **Application Performance Monitoring (APM)**: Szoftver teljesítményének monitorozása
- **Log Analytics**: Naplóadatok gyűjtése és elemzése
- **Alert Rules**: Automatikus értesítések mérőszámok vagy feltételek alapján

### Telepítési kifejezések
- **Blue-Green Deployment**: Leállás nélküli telepítési stratégia
- **Canary Deployment**: Fokozatos bevezetés a felhasználók egy részének
- **Rolling Update**: Alkalmazáspéldányok szekvenciális cseréje
- **Rollback**: Korábbi alkalmazásverzióra visszaállás

---

**Használati tipp**: Használd a `Ctrl+F` billentyűkombinációt a konkrét kifejezések gyors kereséséhez ebben a szószedetben. A kifejezések kereszt-hivatkozottak, ahol alkalmazható.

---

**Navigáció**
- **Előző óra**: [Csalólap](cheat-sheet.md)
- **Következő óra**: [GYIK](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Nyilatkozat**:
Ezt a dokumentumot az AI fordító szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) használatával fordítottuk. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum anyanyelven tekintendő hiteles forrásnak. Kritikus információk esetén professzionális emberi fordítást javaslunk. Nem vállalunk felelősséget az ebből a fordításból eredő félreértésekért vagy félreértelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->