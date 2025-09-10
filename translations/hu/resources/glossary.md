<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "59cb1c1635512e212da16d50f3259ca4",
  "translation_date": "2025-09-10T07:46:49+00:00",
  "source_file": "resources/glossary.md",
  "language_code": "hu"
}
-->
# Szószedet - Azure Developer CLI Terminológia

## Bevezetés

Ez az átfogó szószedet meghatározásokat nyújt az Azure Developer CLI és az Azure felhőfejlesztés során használt kifejezésekhez, fogalmakhoz és rövidítésekhez. Alapvető referenciaanyag a technikai dokumentáció megértéséhez, problémák elhárításához és az azd projektek és Azure szolgáltatások hatékony kommunikációjához.

## Tanulási célok

A szószedet használatával:
- Megérted az Azure Developer CLI alapvető terminológiáját és fogalmait
- Elsajátítod az Azure felhőfejlesztés szókincsét és technikai kifejezéseit
- Hatékonyan hivatkozol az Infrastructure as Code és telepítési terminológiára
- Megérted az Azure szolgáltatások neveit, rövidítéseit és céljait
- Hozzáférsz a hibakeresési és problémamegoldási terminológia meghatározásaihoz
- Megtanulod az Azure fejlett architektúráját és fejlesztési fogalmait

## Tanulási eredmények

A szószedet rendszeres használatával képes leszel:
- Hatékonyan kommunikálni az Azure Developer CLI megfelelő terminológiájával
- Könnyebben megérteni a technikai dokumentációt és hibaüzeneteket
- Magabiztosan eligazodni az Azure szolgáltatásokban és fogalmakban
- Problémákat elhárítani a megfelelő technikai szókincs használatával
- Pontos technikai nyelvezettel hozzájárulni csapatmegbeszélésekhez
- Rendszeresen bővíteni az Azure felhőfejlesztési ismereteidet

## A

**ARM Template**  
Azure Resource Manager sablon. JSON-alapú Infrastructure as Code formátum, amelyet Azure erőforrások deklaratív meghatározására és telepítésére használnak.

**App Service**  
Az Azure platformszolgáltatása (PaaS) webalkalmazások, REST API-k és mobil háttérrendszerek hosztolására infrastruktúra kezelés nélkül.

**Application Insights**  
Az Azure alkalmazásteljesítmény-figyelő (APM) szolgáltatása, amely mélyreható betekintést nyújt az alkalmazások teljesítményébe, elérhetőségébe és használatába.

**Azure CLI**  
Parancssori felület az Azure erőforrások kezelésére. Az azd hitelesítéshez és bizonyos műveletekhez használja.

**Azure Developer CLI (azd)**  
Fejlesztőközpontú parancssori eszköz, amely felgyorsítja az alkalmazások Azure-ba történő építését és telepítését sablonok és Infrastructure as Code használatával.

**azure.yaml**  
Az azd projekt fő konfigurációs fájlja, amely meghatározza a szolgáltatásokat, infrastruktúrát és telepítési horgokat.

**Azure Resource Manager (ARM)**  
Az Azure telepítési és kezelési szolgáltatása, amely egy kezelési réteget biztosít az erőforrások létrehozásához, frissítéséhez és törléséhez.

## B

**Bicep**  
Microsoft által fejlesztett domain-specifikus nyelv (DSL) Azure erőforrások telepítésére. Egyszerűbb szintaxist kínál, mint az ARM sablonok, miközben ARM-re fordít.

**Build**  
A forráskód fordításának, függőségek telepítésének és alkalmazások telepítésre való előkészítésének folyamata.

**Blue-Green Deployment**  
Telepítési stratégia, amely két azonos produkciós környezetet (kék és zöld) használ a leállási idő és kockázat minimalizálására.

## C

**Container Apps**  
Az Azure szerver nélküli konténer szolgáltatása, amely lehetővé teszi konténerizált alkalmazások futtatását komplex infrastruktúra kezelés nélkül.

**CI/CD**  
Folyamatos integráció/folyamatos telepítés. Automatizált gyakorlatok a kódváltozások integrálására és alkalmazások telepítésére.

**Cosmos DB**  
Az Azure globálisan elosztott, többmodellű adatbázis-szolgáltatása, amely átfogó SLA-kat kínál átbocsátásra, késleltetésre, elérhetőségre és konzisztenciára.

**Configuration**  
Beállítások és paraméterek, amelyek az alkalmazás viselkedését és telepítési lehetőségeit szabályozzák.

## D

**Deployment**  
Az alkalmazások és azok függőségeinek telepítési célinfrastruktúrára történő telepítésének és konfigurálásának folyamata.

**Docker**  
Platform alkalmazások fejlesztésére, szállítására és futtatására konténerizációs technológia használatával.

**Dockerfile**  
Szöveges fájl, amely utasításokat tartalmaz egy Docker konténerkép létrehozásához.

## E

**Environment**  
Telepítési cél, amely az alkalmazás egy adott példányát képviseli (pl. fejlesztés, tesztelés, produkció).

**Environment Variables**  
Konfigurációs értékek kulcs-érték párok formájában, amelyeket az alkalmazások futásidőben elérhetnek.

**Endpoint**  
URL vagy hálózati cím, ahol egy alkalmazás vagy szolgáltatás elérhető.

## F

**Function App**  
Az Azure szerver nélküli számítási szolgáltatása, amely lehetővé teszi eseményvezérelt kód futtatását infrastruktúra kezelés nélkül.

## G

**GitHub Actions**  
CI/CD platform, amely integrálva van a GitHub repozitóriumokkal munkafolyamatok automatizálására.

**Git**  
Elosztott verziókezelő rendszer, amelyet forráskód változásainak nyomon követésére használnak.

## H

**Hooks**  
Egyedi szkriptek vagy parancsok, amelyek a telepítési életciklus meghatározott pontjain futnak (pl. preprovision, postprovision, predeploy, postdeploy).

**Host**  
Az Azure szolgáltatástípus, ahol egy alkalmazás telepítve lesz (pl. appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Az infrastruktúra kódon keresztüli meghatározásának és kezelésének gyakorlata manuális folyamatok helyett.

**Init**  
Egy új azd projekt inicializálásának folyamata, általában sablonból.

## J

**JSON**  
JavaScript Object Notation. Adatcsere formátum, amelyet gyakran használnak konfigurációs fájlokhoz és API válaszokhoz.

**JWT**  
JSON Web Token. Szabvány az információk biztonságos továbbítására JSON objektumként.

## K

**Key Vault**  
Az Azure szolgáltatása titkok, kulcsok és tanúsítványok biztonságos tárolására és kezelésére.

**Kusto Query Language (KQL)**  
Lekérdezési nyelv, amelyet az Azure Monitor, Application Insights és más Azure szolgáltatások adatainak elemzésére használnak.

## L

**Load Balancer**  
Szolgáltatás, amely az érkező hálózati forgalmat több szerver vagy példány között osztja el.

**Log Analytics**  
Az Azure szolgáltatása, amely felhő- és helyszíni környezetekből származó telemetriai adatok gyűjtésére, elemzésére és kezelésére szolgál.

## M

**Managed Identity**  
Az Azure funkciója, amely automatikusan kezelt identitást biztosít az Azure szolgáltatások számára más Azure szolgáltatások hitelesítéséhez.

**Microservices**  
Architekturális megközelítés, amelyben az alkalmazások kis, független szolgáltatások gyűjteményeként épülnek fel.

**Monitor**  
Az Azure egységes megfigyelési megoldása, amely teljes körű megfigyelhetőséget biztosít az alkalmazások és infrastruktúra számára.

## N

**Node.js**  
JavaScript futtatókörnyezet, amelyet szerveroldali alkalmazások építésére használnak.

**npm**  
A Node.js csomagkezelője, amely a függőségeket és csomagokat kezeli.

## O

**Output**  
Az infrastruktúra telepítéséből visszaadott értékek, amelyeket az alkalmazások vagy más erőforrások használhatnak.

## P

**Package**  
Az alkalmazáskód és függőségek telepítésre való előkészítésének folyamata.

**Parameters**  
Bemeneti értékek, amelyeket infrastruktúra sablonoknak adnak át a telepítések testreszabásához.

**PostgreSQL**  
Nyílt forráskódú relációs adatbázis rendszer, amelyet az Azure menedzselt szolgáltatásként támogat.

**Provisioning**  
Az infrastruktúra sablonokban meghatározott Azure erőforrások létrehozásának és konfigurálásának folyamata.

## Q

**Quota**  
Az Azure előfizetésben vagy régióban létrehozható erőforrások mennyiségének korlátai.

## R

**Resource Group**  
Logikai tároló az Azure erőforrások számára, amelyek ugyanazt az életciklust, jogosultságokat és szabályokat osztják meg.

**Resource Token**  
Egyedi karakterlánc, amelyet az azd generál az erőforrásnevek egyediségének biztosítására a telepítések között.

**REST API**  
Architekturális stílus hálózati alkalmazások tervezésére HTTP metódusok használatával.

**Rollback**  
Az alkalmazás vagy infrastruktúra konfiguráció korábbi verziójára való visszaállítás folyamata.

## S

**Service**  
Az alkalmazás egy komponense, amelyet az azure.yaml fájlban határoznak meg (pl. webes frontend, API backend, adatbázis).

**SKU**  
Stock Keeping Unit. Az Azure erőforrások különböző szolgáltatási szintjeit vagy teljesítményfokozatait képviseli.

**SQL Database**  
Az Azure menedzselt relációs adatbázis szolgáltatása, amely a Microsoft SQL Serveren alapul.

**Static Web Apps**  
Az Azure szolgáltatása teljes körű webalkalmazások építésére és telepítésére forráskód repozitóriumokból.

**Storage Account**  
Az Azure szolgáltatása, amely felhőalapú tárolást biztosít adatobjektumok, például blobok, fájlok, sorok és táblák számára.

**Subscription**  
Azure fiók tároló, amely erőforráscsoportokat és erőforrásokat tartalmaz, számlázási és hozzáféréskezelési társítással.

## T

**Template**  
Előre elkészített projektstruktúra, amely alkalmazáskódot, infrastruktúra meghatározásokat és konfigurációt tartalmaz gyakori forgatókönyvekhez.

**Terraform**  
Nyílt forráskódú Infrastructure as Code eszköz, amely több felhőszolgáltatót, köztük az Azure-t is támogat.

**Traffic Manager**  
Az Azure DNS-alapú forgalomterheléselosztója, amely globális Azure régiók között osztja el a forgalmat.

## U

**URI**  
Uniform Resource Identifier. Karakterlánc, amely egy adott erőforrást azonosít.

**URL**  
Uniform Resource Locator. Az URI egy típusa, amely meghatározza, hol található egy erőforrás és hogyan érhető el.

## V

**Virtual Network (VNet)**  
Az Azure privát hálózatok alapvető építőeleme, amely izolációt és szegmentációt biztosít.

**VS Code**  
Visual Studio Code. Népszerű kódszerkesztő, amely kiváló Azure és azd integrációval rendelkezik.

## W

**Webhook**  
HTTP visszahívás, amelyet meghatározott események váltanak ki, gyakran CI/CD folyamatokban használják.

**What-if**  
Az Azure funkciója, amely megmutatja, milyen változtatásokat hajtana végre egy telepítés anélkül, hogy ténylegesen végrehajtaná.

## Y

**YAML**  
YAML Ain't Markup Language. Ember által olvasható adat-szerializációs szabvány, amelyet konfigurációs fájlokhoz, például azure.yaml-hez használnak.

## Z

**Zone**  
Fizikailag elkülönített helyek egy Azure régión belül, amelyek redundanciát és magas rendelkezésre állást biztosítanak.

---

## Gyakori rövidítések

| Rövidítés | Teljes név | Leírás |
|-----------|------------|--------|
| AAD | Azure Active Directory | Identitás- és hozzáférés-kezelési szolgáltatás |
| ACR | Azure Container Registry | Konténerkép-regisztrációs szolgáltatás |
| AKS | Azure Kubernetes Service | Menedzselt Kubernetes szolgáltatás |
| API | Application Programming Interface | Protokollok halmaza szoftverek építéséhez |
| ARM | Azure Resource Manager | Az Azure telepítési és kezelési szolgáltatása |
| CDN | Content Delivery Network | Elosztott szerverhálózat |
| CI/CD | Continuous Integration/Continuous Deployment | Automatizált fejlesztési gyakorlatok |
| CLI | Command Line Interface | Szöveges felhasználói felület |
| DNS | Domain Name System | Rendszer domain nevek IP címekre fordítására |
| HTTPS | Hypertext Transfer Protocol Secure | A HTTP biztonságos verziója |
| IaC | Infrastructure as Code | Infrastruktúra kódon keresztüli kezelése |
| JSON | JavaScript Object Notation | Adatcsere formátum |
| JWT | JSON Web Token | Token formátum biztonságos információ továbbítására |
| KQL | Kusto Query Language | Lekérdezési nyelv Azure adat szolgáltatásokhoz |
| RBAC | Role-Based Access Control | Hozzáférés-kezelési módszer felhasználói szerepkörök alapján |
| REST | Representational State Transfer | Webszolgáltatások architekturális stílusa |
| SDK | Software Development Kit | Fejlesztési eszközök gyűjteménye |
| SLA | Service Level Agreement | Elérhetőségre/teljesítményre vonatkozó kötelezettségvállalás |
| SQL | Structured Query Language | Relációs adatbázisok kezelésére szolgáló nyelv |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Kriptográfiai protokollok |
| URI | Uniform Resource Identifier | Erőforrást azonosító karakterlánc |
| URL | Uniform Resource Locator | Az URI egy típusa, amely erőforrás helyét határozza meg |
| VM | Virtual Machine | Számítógépes rendszer emulációja |
| VNet | Virtual Network | Privát hálózat az Azure-ban |
| YAML | YAML Ain't Markup Language | Adat-szerializációs szabvány |

---

## Azure szolgáltatásnevek megfeleltetése

| Közismert név | Hivatalos Azure szolgáltatásnév | azd Host típus |
|---------------|--------------------------------|----------------|
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

## Kontextus-specifikus kifejezések

### Fejlesztési kifejezések
- **Hot Reload**: Az alkalmazások automatikus frissítése fejlesztés közben újraindítás nélkül
- **Build Pipeline**: Automatizált folyamat kód építésére és tesztelésére
- **Deployment Slot**: Tesztelési környezet egy App Service-en belül
- **Environment Parity**: A fejlesztési, tesztelési és produkciós környezetek hasonlóságának fenntartása

### Biztonsági kifejezések
- **Managed Identity**: Az Azure funkciója automatikus hitelesítési kezelés biztosítására
- **Key Vault**: Titkok, kulcsok és tanúsítványok biztonságos tárolása
- **RBAC**: Szerepkör-alapú hozzáférés-kezelés Azure erőforrásokhoz
- **Network Security Group**: Virtuális tűzfal hálózati forgalom szabályozására

### Megfigyelési kifejezések
- **Telemetry**: Mérések és adatok automatikus gyűjtése

---

**Felelősségkizárás**:  
Ez a dokumentum az [Co-op Translator](https://github.com/Azure/co-op-translator) AI fordítási szolgáltatás segítségével készült. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Kritikus információk esetén javasolt a professzionális, emberi fordítás igénybevétele. Nem vállalunk felelősséget a fordítás használatából eredő félreértésekért vagy téves értelmezésekért.