# Szójegyzék - Azure és AZD Terminológia

**Minden fejezethez referencia**
- **📚 Tanfolyam kezdőoldal**: [AZD kezdőknek](../README.md)
- **📖 Alapok elsajátítása**: [1. fejezet: AZD alapok](../docs/getting-started/azd-basics.md)
- **🤖 MI kifejezések**: [2. fejezet: AI-első fejlesztés](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## Bevezetés

Ez az átfogó szójegyzék definíciókat nyújt az Azure Developer CLI és az Azure felhőfejlesztés során használt kifejezésekhez, fogalmakhoz és rövidítésekhez. Lényeges hivatkozás a műszaki dokumentáció megértéséhez, hibakereséshez és a hatékony kommunikációhoz az azd projektek és az Azure szolgáltatások kapcsán.

## Tanulási célok

E szójegyzék használatával Ön:
- Megérti az alapvető Azure Developer CLI terminológiát és fogalmakat
- Elsajátítja az Azure felhőfejlesztés szókincsét és műszaki kifejezéseit
- Hatékonyan hivatkozik az Infrastructure as Code (IaC) és telepítési terminológiára
- Megérti az Azure szolgáltatások neveit, rövidítéseit és céljait
- Hozzáfér a hibakeresési és debugolási terminológia definícióihoz
- Megismeri a fejlett Azure architektúra és fejlesztési fogalmakat

## Tanulási eredmények

A szójegyzék rendszeres használatával Ön képes lesz:
- Hatékonyan kommunikálni az Azure Developer CLI megfelelő terminológiájával
- Világosabban érteni a műszaki dokumentációt és a hibaüzeneteket
- Magabiztosan eligazodni az Azure szolgáltatások és fogalmak között
- Megfelelő műszaki szókincset használva hibákat elhárítani
- Pontos műszaki nyelvezettel hozzájárulni a csapat megbeszéléseihez
- Rendszeresen bővíteni Azure felhőfejlesztési ismereteit

## A

**ARM Template**  
Azure Resource Manager minta. JSON-alapú Infrastructure as Code formátum, amely deklaratívan határozza meg és telepíti az Azure erőforrásokat.

**App Service**  
Az Azure platform-szolgáltatása (PaaS) webalkalmazások, REST API-k és mobil hátterek hosztolására, infrastruktúra kezelés nélkül.

**Application Insights**  
Az Azure alkalmazásteljesítmény-monitorozási (APM) szolgáltatása, amely mélyreható betekintést nyújt az alkalmazás teljesítményébe, rendelkezésre állásába és használatába.

**Azure CLI**  
Parancssoros felület az Azure erőforrások kezeléséhez. Az azd hitelesítéshez és egyes műveletekhez használja.

**Azure Developer CLI (azd)**  
Fejlesztőközpontú parancssoros eszköz, amely felgyorsítja az alkalmazások Azure-ba történő építését és telepítését sablonok és Infrastructure as Code segítségével.

**azure.yaml**  
Az azd projekt fő konfigurációs fájlja, amely definiálja a szolgáltatásokat, infrastruktúrát és telepítési hook-okat.

**Azure Resource Manager (ARM)**  
Az Azure telepítési és felügyeleti szolgáltatása, amely kezelőréteget biztosít az erőforrások létrehozására, frissítésére és törlésére.

## B

**Bicep**  
Microsoft által fejlesztett domén-specifikus nyelv (DSL) Azure erőforrások telepítéséhez. Egyszerűbb szintaxist kínál, mint az ARM template-ek, miközben ARM-re fordul.

**Build**  
A forráskód fordításának, függőségek telepítésének és az alkalmazások telepítésre való előkészítésének folyamata.

**Blue-Green Deployment**  
Telepítési stratégia, amely két azonos működésű gyártási környezetet (kék és zöld) használ a leállás és kockázat minimalizálására.

## C

**Container Apps**  
Az Azure szerver nélküli konténer szolgáltatása, amely lehetővé teszi konténerizált alkalmazások futtatását összetett infrastruktúra kezelés nélkül.

**CI/CD**  
Folyamatos Integráció/Folyamatos Telepítés. Automatizált gyakorlatok a kódváltoztatások integrálására és az alkalmazások telepítésére.

**Cosmos DB**  
Az Azure globálisan elosztott, többmodellű adatbázis-szolgáltatása, amely átfogó SLA-kat nyújt átbocsátóképességre, késleltetésre, rendelkezésre állásra és konzisztenciára.

**Konfiguráció**  
Beállítások és paraméterek, amelyek irányítják az alkalmazás viselkedését és telepítési lehetőségeit.

## D

**Deployment**  
Az alkalmazások és azok függőségeinek telepítési és konfigurációs folyamata a cél infrastruktúrán.

**Docker**  
Platform az alkalmazások fejlesztésére, szállítására és futtatására konténerizációs technológia használatával.

**Dockerfile**  
Szöveges fájl, amely utasításokat tartalmaz egy Docker konténerkép építéséhez.

## E

**Environment**  
Egy telepítési célpont, amely az alkalmazás egy adott példányát képviseli (pl. fejlesztés, teszt, éles).

**Környezeti változók**  
Beállítási értékek kulcs-érték párok formájában, amelyeket az alkalmazások futásidőben elérnek.

**Endpoint**  
URL vagy hálózati cím, ahol egy alkalmazás vagy szolgáltatás elérhető.

## F

**Function App**  
Az Azure szerver nélküli számítási szolgáltatása, amely eseményvezérelt kód futtatását teszi lehetővé infrastruktúra kezelés nélkül.

## G

**GitHub Actions**  
CI/CD platform, amely integrálva van a GitHub tárolókkal a munkafolyamatok automatizálásához.

**Git**  
Elosztott verziókezelő rendszer a forráskód változásainak nyomon követésére.

## H

**Hooks**  
Egyedi scriptek vagy parancsok, amelyek a telepítési életciklus bizonyos pontjain futnak (előfeltétel, utófeltétel, előtelepítés, utótelepítés).

**Host**  
Az Azure szolgáltatástípus, amelyre az alkalmazás telepítésre kerül (pl. appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Az infrastruktúra kód általi definiálása és kezelése manuális folyamatok helyett.

**Init**  
Az új azd projekt inicializálásának folyamata, általában egy sablonból.

## J

**JSON**  
JavaScript Object Notation. Gyakran használt adatcsere formátum konfigurációs fájlokban és API válaszokban.

**JWT**  
JSON Web Token. Szabvány az adatok biztonságos JSON objektumként történő továbbítására felek között.

## K

**Key Vault**  
Az Azure szolgáltatása bizalmas adatok, kulcsok és tanúsítványok biztonságos tárolására és kezelésére.

**Kusto Query Language (KQL)**  
Lekérdező nyelv az Azure Monitor, Application Insights és egyéb Azure szolgáltatások adatainak elemzéséhez.

## L

**Load Balancer**  
Szolgáltatás, amely a bejövő hálózati forgalmat több szerver vagy példány között osztja el.

**Log Analytics**  
Az Azure szolgáltatása telemetriai adatok gyűjtésére, elemzésére és feldolgozására felhős és helyszíni környezetekben.

## M

**Managed Identity**  
Azure szolgáltatás, amely automatikusan kezelt identitást biztosít más Azure szolgáltatásokhoz való hitelesítéshez.

**Microservices**  
Olyan architekturális megközelítés, ahol az alkalmazás kis, független szolgáltatások gyűjteményeként épül fel.

**Monitor**  
Az Azure egységes megfigyelési megoldása, amely teljeskörű átláthatóságot biztosít alkalmazásokra és infrastruktúrára.

## N

**Node.js**  
JavaScript futtatókörnyezet, amely a Chrome V8 JavaScript motorjára épül, szerveroldali alkalmazások fejlesztéséhez.

**npm**  
Node.js csomagkezelő, amely kezeli a függőségeket és csomagokat.

## O

**Output**  
Az infrastruktúra telepítéséből visszatérő értékek, amelyeket az alkalmazások vagy más erőforrások használhatnak.

## P

**Package**  
Az alkalmazáskód és a függőségek telepítésre való előkészítése.

**Params (Parameters)**  
Bemeneti értékek, amelyeket infrastruktúra sablonoknak adunk át a telepítések testreszabásához.

**PostgreSQL**  
Nyílt forráskódú relációs adatbázis rendszer, amely Azure-ban menedzselt szolgáltatásként elérhető.

**Provisioning**  
Az infrastruktúra sablonokban definiált Azure erőforrások létrehozásának és konfigurálásának folyamata.

## Q

**Quota**  
Erőforrás létrehozási korlátok egy Azure előfizetés vagy régió esetén.

## R

**Resource Group**  
Logikai tároló az Azure erőforrások számára, amelyek azonos életciklust, jogosultságokat és szabályzatokat osztanak.

**Resource Token**  
Az azd által generált egyedi karakterlánc, amely biztosítja, hogy az erőforrásnevek telepítéskor egyediek legyenek.

**REST API**  
Architekturális stílus hálózati alkalmazások tervezésére HTTP metódusok használatával.

**Rollback**  
Folyamat, amely során az alkalmazás vagy infrastruktúra konfiguráció korábbi verziójára térnek vissza.

## S

**Service**  
Az alkalmazás olyan komponense, amely az azure.yaml fájlban definiált (pl. web frontend, API backend, adatbázis).

**SKU**  
Stock Keeping Unit. Az Azure erőforrások különböző szolgáltatási szintjeit vagy teljesítményszintjeit jelöli.

**SQL Database**  
Az Azure menedzselt relációs adatbázis szolgáltatása Microsoft SQL Server alapokon.

**Static Web Apps**  
Azure szolgáltatás teljes webalkalmazások forráskód-tárolóból való építésére és telepítésére.

**Storage Account**  
Azure szolgáltatás felhőtárhely biztosítására adatobjektumok (blobok, fájlok, sorok, táblák) számára.

**Subscription**  
Azure fiókkezelő konténer, amely erőforráscsoportokat és erőforrásokat tartalmaz, valamint számlázást és hozzáférés-kezelést biztosít.

## T

**Template**  
Előre elkészített projektstruktúra, amely tartalmazza az alkalmazáskódot, infrastruktúra definíciókat és konfigurációkat gyakori forgatókönyvekhez.

**Terraform**  
Nyílt forráskódú Infrastructure as Code eszköz, amely több felhőszolgáltató, köztük az Azure támogatását nyújtja.

**Traffic Manager**  
Az Azure DNS-alapú forgalomelosztó szolgáltatása, amely globális Azure régiók között osztja meg a forgalmat.

## U

**URI**  
Uniform Resource Identifier. Karakterlánc, amely egy adott erőforrást azonosít.

**URL**  
Uniform Resource Locator. Az URI típusa, amely megadja egy erőforrás helyét és hozzáférési módját.

## V

**Virtual Network (VNet)**  
Az Azure privát hálózatok alapvető építőköve, izolációt és szegmentálást biztosítva.

**VS Code**  
Visual Studio Code. Népszerű kódszerkesztő, amely kiváló Azure és azd integrációval rendelkezik.

## W

**Webhook**  
HTTP callback, amely adott események hatására aktiválódik, gyakran használják CI/CD folyamatokban.

**What-if**  
Azure funkció, amely megjeleníti, milyen változtatásokat hajtana végre egy telepítés anélkül, hogy ténylegesen végrehajtaná azt.

## Y

**YAML**  
YAML Ain't Markup Language. Ember által olvasható adat-szériázási szabvány, amelyet konfigurációs fájlokhoz, mint az azure.yaml, használnak.

## Z

**Zone**  
Fizikailag különálló helyek egy Azure régión belül, amelyek redundanciát és magas rendelkezésre állást biztosítanak.

---

## Gyakori rövidítések

| Rövidítés | Teljes név | Leírás |
|---------|-----------|-------------|
| AAD | Azure Active Directory (most Microsoft Entra ID) | Azonosítás és hozzáférés-kezelési szolgáltatás |
| ACR | Azure Container Registry | Konténer kép-tároló szolgáltatás |
| AKS | Azure Kubernetes Service | Menedzselt Kubernetes szolgáltatás |
| API | Application Programming Interface | Szoftverépítés protokoll-készlete |
| ARM | Azure Resource Manager | Azure telepítési és kezelési szolgáltatás |
| CDN | Content Delivery Network | Elosztott szerverhálózat |
| CI/CD | Continuous Integration/Continuous Deployment | Automatizált fejlesztési gyakorlatok |
| CLI | Command Line Interface | Szöveges felhasználói felület |
| DNS | Domain Name System | Domain nevek IP címekké fordítása |
| HTTPS | Hypertext Transfer Protocol Secure | Biztonságos HTTP változat |
| IaC | Infrastructure as Code | Infrastruktúra kód általi kezelése |
| JSON | JavaScript Object Notation | Adatcsere formátum |
| JWT | JSON Web Token | Biztonságos adatátviteli token formátum |
| KQL | Kusto Query Language | Azure adatelemző lekérdező nyelv |
| RBAC | Role-Based Access Control | Felhasználói szerepkör alapú hozzáférés-kezelés |
| REST | Representational State Transfer | Webszolgáltatások architekturális stílusa |
| SDK | Software Development Kit | Fejlesztői eszközkészlet |
| SLA | Service Level Agreement | Szolgáltatás rendelkezésre állási/teljesítmény vállalás |
| SQL | Structured Query Language | Relációs adatbázis kezelő nyelv |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Kriptográfiai protokollok |
| URI | Uniform Resource Identifier | Erőforrás azonosító karakterlánc |
| URL | Uniform Resource Locator | URI típus, ami erőforrás helyét határozza meg |
| VM | Virtual Machine | Számítógép rendszerek emulációja |
| VNet | Virtual Network | Azure privát hálózat |
| YAML | YAML Ain't Markup Language | Adatsorozat-szabvány |

---

## Azure szolgáltatás névillesztések

| Gyakori név | Hivatalos Azure szolgáltatásnév | azd hoszt típus |
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
| Search | Azure AI Search | `search` |
| Messaging | Azure Service Bus | `servicebus` |

---

## Kontextus-specifikus kifejezések

### Fejlesztési kifejezések
- **Hot Reload**: Automatikus frissítés fejlesztés közben újraindítás nélkül
- **Build Pipeline**: Automatizált folyamat a kód építésére és tesztelésére
- **Deployment Slot**: Tesztkörnyezet az App Service-ben
- **Environment Parity**: A fejlesztési, teszt és éles környezet hasonlóvá tétele

### Biztonsági kifejezések
- **Managed Identity**: Azure funkció az automatikus hitelesítő adatkezeléshez
- **Key Vault**: Titkok, kulcsok és tanúsítványok biztonságos tárolása
- **RBAC**: Szerepkör-alapú hozzáférés-kezelés Azure erőforrásokhoz
- **Network Security Group**: Virtuális tűzfal a hálózati forgalom szabályozásához

### Megfigyelési kifejezések
- **Telemetry**: Automatizált mérési és adatgyűjtési folyamat
- **Application Performance Monitoring (APM)**: Szoftver teljesítmény monitorozása
- **Log Analytics**: Szolgáltatás naplóadatok gyűjtésére és elemzésére
- **Alert Rules**: Automatizált értesítések metrikák és feltételek alapján

### Telepítési kifejezések
- **Blue-Green Deployment**: Leállás nélküli telepítési stratégia
- **Canary Deployment**: Fokozatos kiterjesztés egy alcsoportra
- **Rolling Update**: Az alkalmazás példányainak egymás utáni cseréje
- **Rollback**: Visszatérés az alkalmazás korábbi verziójára

---

**Használati tipp**: Használja a `Ctrl+F` billentyűkombinációt a kifejezések gyors kereséséhez ebben a szójegyzékben. A kifejezések keresztelhivatkozottak, ahol alkalmazható.

---

**Navigáció**
- **Előző lecke**: [Cheat Sheet](cheat-sheet.md)
- **Következő lecke**: [GYIK](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->