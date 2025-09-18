<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "f16d2988a24670d1b6aa2372de1a231a",
  "translation_date": "2025-09-18T09:33:07+00:00",
  "source_file": "resources/glossary.md",
  "language_code": "hu"
}
-->
# Szószedet - Azure és AZD Terminológia

**Hivatkozás minden fejezethez**
- **📚 Kurzus kezdőlapja**: [AZD Kezdőknek](../README.md)
- **📖 Alapok elsajátítása**: [1. fejezet: AZD Alapok](../docs/getting-started/azd-basics.md)
- **🤖 AI Kifejezések**: [2. fejezet: AI-First Fejlesztés](../docs/ai-foundry/azure-ai-foundry-integration.md)

## Bevezetés

Ez az átfogó szószedet meghatározásokat nyújt az Azure Developer CLI és az Azure felhőfejlesztés során használt kifejezésekhez, fogalmakhoz és rövidítésekhez. Alapvető referencia a technikai dokumentáció megértéséhez, problémák elhárításához és az azd projektek, valamint Azure szolgáltatások hatékony kommunikációjához.

## Tanulási célok

A szószedet használatával:
- Megérted az Azure Developer CLI alapvető terminológiáját és fogalmait
- Elsajátítod az Azure felhőfejlesztés szókincsét és technikai kifejezéseit
- Hatékonyan hivatkozol az infrastruktúra kódjaként és a telepítési terminológiára
- Megérted az Azure szolgáltatások neveit, rövidítéseit és céljait
- Hozzáférsz a hibaelhárítási és hibakeresési terminológia meghatározásaihoz
- Megtanulod az Azure fejlett architektúráját és fejlesztési fogalmait

## Tanulási eredmények

A szószedet rendszeres használatával képes leszel:
- Hatékonyan kommunikálni az Azure Developer CLI helyes terminológiájával
- Könnyebben megérteni a technikai dokumentációt és hibaüzeneteket
- Magabiztosan eligazodni az Azure szolgáltatásokban és fogalmakban
- Problémákat elhárítani a megfelelő technikai szókincs használatával
- Pontos technikai nyelvezettel hozzájárulni a csapatmegbeszélésekhez
- Rendszeresen bővíteni az Azure felhőfejlesztési ismereteidet

## A

**ARM Template**  
Azure Resource Manager sablon. JSON-alapú infrastruktúra kódjaként formátum, amelyet Azure erőforrások deklaratív meghatározására és telepítésére használnak.

**App Service**  
Azure platformszolgáltatása (PaaS) webalkalmazások, REST API-k és mobil háttérrendszerek hosztolására infrastruktúra kezelés nélkül.

**Application Insights**  
Azure alkalmazásteljesítmény-figyelő (APM) szolgáltatása, amely mélyreható betekintést nyújt az alkalmazás teljesítményébe, elérhetőségébe és használatába.

**Azure CLI**  
Parancssori felület Azure erőforrások kezelésére. Az azd hitelesítéshez és bizonyos műveletekhez használja.

**Azure Developer CLI (azd)**  
Fejlesztőközpontú parancssori eszköz, amely felgyorsítja az alkalmazások Azure-ba történő építését és telepítését sablonok és infrastruktúra kódjaként használatával.

**azure.yaml**  
Az azd projekt fő konfigurációs fájlja, amely meghatározza a szolgáltatásokat, infrastruktúrát és telepítési horgokat.

**Azure Resource Manager (ARM)**  
Azure telepítési és kezelési szolgáltatása, amely kezelési réteget biztosít az erőforrások létrehozásához, frissítéséhez és törléséhez.

## B

**Bicep**  
Microsoft által fejlesztett domain-specifikus nyelv (DSL) Azure erőforrások telepítésére. Egyszerűbb szintaxist kínál, mint az ARM sablonok, miközben ARM-re fordít.

**Build**  
A forráskód fordításának, függőségek telepítésének és alkalmazások telepítésre való előkészítésének folyamata.

**Blue-Green Deployment**  
Telepítési stratégia, amely két azonos produkciós környezetet (kék és zöld) használ a leállási idő és kockázat minimalizálására.

## C

**Container Apps**  
Azure szerver nélküli konténer szolgáltatása, amely lehetővé teszi konténerizált alkalmazások futtatását komplex infrastruktúra kezelés nélkül.

**CI/CD**  
Folyamatos integráció/folyamatos telepítés. Automatizált gyakorlatok a kódváltozások integrálására és alkalmazások telepítésére.

**Cosmos DB**  
Azure globálisan elosztott, többmodellű adatbázis-szolgáltatása, amely átfogó SLA-kat kínál az átbocsátásra, késleltetésre, elérhetőségre és konzisztenciára.

**Configuration**  
Beállítások és paraméterek, amelyek az alkalmazás viselkedését és telepítési lehetőségeit szabályozzák.

## D

**Deployment**  
Az alkalmazások és azok függőségeinek telepítési célinfrastruktúrára történő telepítésének és konfigurálásának folyamata.

**Docker**  
Platform alkalmazások fejlesztésére, szállítására és futtatására konténerizációs technológia használatával.

**Dockerfile**  
Szöveges fájl, amely utasításokat tartalmaz egy Docker konténer képének létrehozásához.

## E

**Environment**  
Telepítési cél, amely az alkalmazás egy adott példányát képviseli (pl. fejlesztés, tesztelés, produkció).

**Environment Variables**  
Konfigurációs értékek kulcs-érték párok formájában, amelyeket az alkalmazások futásidőben elérhetnek.

**Endpoint**  
URL vagy hálózati cím, ahol egy alkalmazás vagy szolgáltatás elérhető.

## F

**Function App**  
Azure szerver nélküli számítási szolgáltatása, amely lehetővé teszi eseményvezérelt kód futtatását infrastruktúra kezelés nélkül.

## G

**GitHub Actions**  
CI/CD platform, amely GitHub repozitóriumokkal integrálva automatizálja a munkafolyamatokat.

**Git**  
Elosztott verziókezelő rendszer, amelyet forráskód változásainak nyomon követésére használnak.

## H

**Hooks**  
Egyedi szkriptek vagy parancsok, amelyek a telepítési életciklus meghatározott pontjain futnak (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Az Azure szolgáltatás típusa, ahol egy alkalmazás telepítve lesz (pl. appservice, containerapp, function).

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
Azure szolgáltatás titkok, kulcsok és tanúsítványok biztonságos tárolására és kezelésére.

**Kusto Query Language (KQL)**  
Lekérdezési nyelv, amelyet az Azure Monitor, Application Insights és más Azure szolgáltatások adatainak elemzésére használnak.

## L

**Load Balancer**  
Szolgáltatás, amely az érkező hálózati forgalmat több szerver vagy példány között osztja el.

**Log Analytics**  
Azure szolgáltatás, amely felhő- és helyszíni környezetekből származó telemetriai adatok gyűjtésére, elemzésére és kezelésére szolgál.

## M

**Managed Identity**  
Azure funkció, amely automatikusan kezelt identitást biztosít Azure szolgáltatások számára más Azure szolgáltatások hitelesítéséhez.

**Microservices**  
Architekturális megközelítés, amelyben az alkalmazások kis, független szolgáltatások gyűjteményeként épülnek fel.

**Monitor**  
Azure egységes megfigyelési megoldása, amely teljes körű megfigyelést biztosít az alkalmazások és infrastruktúra számára.

## N

**Node.js**  
JavaScript futtatókörnyezet, amely a Chrome V8 JavaScript motorjára épül, szerveroldali alkalmazások építésére.

**npm**  
Node.js csomagkezelő, amely a függőségeket és csomagokat kezeli.

## O

**Output**  
Az infrastruktúra telepítéséből visszaadott értékek, amelyeket alkalmazások vagy más erőforrások használhatnak.

## P

**Package**  
Az alkalmazáskód és függőségek telepítésre való előkészítésének folyamata.

**Parameters**  
Bemeneti értékek, amelyeket infrastruktúra sablonoknak adnak át a telepítések testreszabásához.

**PostgreSQL**  
Nyílt forráskódú relációs adatbázis rendszer, amelyet Azure-ban kezelt szolgáltatásként támogatnak.

**Provisioning**  
Az infrastruktúra sablonokban meghatározott Azure erőforrások létrehozásának és konfigurálásának folyamata.

## Q

**Quota**  
Az Azure előfizetésben vagy régióban létrehozható erőforrások mennyiségére vonatkozó korlátok.

## R

**Resource Group**  
Logikai tároló az Azure erőforrások számára, amelyek ugyanazt az életciklust, jogosultságokat és házirendeket osztják meg.

**Resource Token**  
Egyedi karakterlánc, amelyet az azd generál az erőforrásnevek telepítések közötti egyediségének biztosítására.

**REST API**  
Architekturális stílus hálózati alkalmazások tervezésére HTTP metódusok használatával.

**Rollback**  
Az alkalmazás vagy infrastruktúra konfiguráció korábbi verziójára való visszaállítás folyamata.

## S

**Service**  
Az alkalmazás egy komponense, amelyet az azure.yaml határoz meg (pl. webes frontend, API backend, adatbázis).

**SKU**  
Stock Keeping Unit. Az Azure erőforrások különböző szolgáltatási szintjeit vagy teljesítményfokozatait képviseli.

**SQL Database**  
Azure kezelt relációs adatbázis szolgáltatása, amely a Microsoft SQL Serveren alapul.

**Static Web Apps**  
Azure szolgáltatás teljes körű webalkalmazások építésére és telepítésére forráskód repozitóriumokból.

**Storage Account**  
Azure szolgáltatás, amely felhőalapú tárolást biztosít adatobjektumok, például blobok, fájlok, sorok és táblák számára.

**Subscription**  
Azure fiók tároló, amely erőforráscsoportokat és erőforrásokat tartalmaz, számlázási és hozzáféréskezelési társítással.

## T

**Template**  
Előre elkészített projektstruktúra, amely alkalmazáskódot, infrastruktúra meghatározásokat és konfigurációt tartalmaz gyakori forgatókönyvekhez.

**Terraform**  
Nyílt forráskódú infrastruktúra kódjaként eszköz, amely több felhőszolgáltatót, köztük Azure-t támogat.

**Traffic Manager**  
Azure DNS-alapú forgalomterheléselosztó, amely globális Azure régiók között osztja el a forgalmat.

## U

**URI**  
Egységes erőforrás-azonosító. Karakterlánc, amely egy adott erőforrást azonosít.

**URL**  
Egységes erőforrás-helymeghatározó. Az URI egy típusa, amely megadja, hol található egy erőforrás és hogyan érhető el.

## V

**Virtual Network (VNet)**  
Az Azure privát hálózatok alapvető építőeleme, amely izolációt és szegmentációt biztosít.

**VS Code**  
Visual Studio Code. Népszerű kódszerkesztő, amely kiváló Azure és azd integrációval rendelkezik.

## W

**Webhook**  
HTTP visszahívás, amelyet meghatározott események váltanak ki, gyakran CI/CD folyamatokban használják.

**What-if**  
Azure funkció, amely megmutatja, milyen változtatásokat hajtana végre egy telepítés anélkül, hogy ténylegesen végrehajtaná.

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
| AKS | Azure Kubernetes Service | Kezelt Kubernetes szolgáltatás |
| API | Application Programming Interface | Protokollok halmaza szoftverek építéséhez |
| ARM | Azure Resource Manager | Azure telepítési és kezelési szolgáltatása |
| CDN | Content Delivery Network | Elosztott szerverhálózat |
| CI/CD | Continuous Integration/Continuous Deployment | Automatizált fejlesztési gyakorlatok |
| CLI | Command Line Interface | Szöveges felhasználói felület |
| DNS | Domain Name System | Rendszer domain nevek IP címekre történő fordítására |
| HTTPS | Hypertext Transfer Protocol Secure | HTTP biztonságos verziója |
| IaC | Infrastructure as Code | Infrastruktúra kódon keresztüli kezelése |
| JSON | JavaScript Object Notation | Adatcsere formátum |
| JWT | JSON Web Token | Token formátum biztonságos információátvitelhez |
| KQL | Kusto Query Language | Lekérdezési nyelv Azure adat szolgáltatásokhoz |
| RBAC | Role-Based Access Control | Hozzáférés-kezelési módszer felhasználói szerepkörök alapján |
| REST | Representational State Transfer | Webszolgáltatások architekturális stílusa |
| SDK | Software Development Kit | Fejlesztési eszközök gyűjteménye |
| SLA | Service Level Agreement | Elérhetőségi/teljesítmény kötelezettségvállalás |
| SQL | Structured Query Language | Relációs adatbázisok kezelésére szolgáló nyelv |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Kriptográfiai protokollok |
| URI | Uniform Resource Identifier | Karakterlánc, amely egy erőforrást azonosít |
| URL | Uniform Resource Locator | Az URI egy típusa, amely megadja az erőforrás helyét |
| VM | Virtual Machine | Számítógépes rendszer emulációja |
| VNet | Virtual Network | Privát hálózat Azure-ban |
| YAML | YAML Ain't Markup Language | Adat-szerializációs szabvány |

---

## Azure szolgáltatásnév megfeleltetések

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
- **Managed Identity**: Azure funkció automatik

---

**Felelősségkizárás**:  
Ez a dokumentum az [Co-op Translator](https://github.com/Azure/co-op-translator) AI fordítási szolgáltatás segítségével készült. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Kritikus információk esetén javasolt professzionális, emberi fordítást igénybe venni. Nem vállalunk felelősséget a fordítás használatából eredő félreértésekért vagy téves értelmezésekért.