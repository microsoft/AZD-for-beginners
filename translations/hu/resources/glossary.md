# Szószedet - Azure és AZD Terminológia

**Minden fejezet hivatkozása**
- **📚 Tanfolyam főoldal**: [AZD Kezdőknek](../README.md)
- **📖 Alapok elsajátítása**: [1. fejezet: AZD alapok](../docs/chapter-01-foundation/azd-basics.md)
- **🤖 Mesterséges intelligencia kifejezések**: [2. fejezet: AI-First fejlesztés](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)

## Bevezetés

Ez az átfogó szószedet definíciókat ad az Azure Developer CLI-ben és az Azure felhőfejlesztésben használt kifejezésekre, fogalmakra és mozaikszavakra. Lényeges referencia a műszaki dokumentáció megértéséhez, hibakereséshez és az azd projektek és Azure szolgáltatások hatékony kommunikációjához.

## Tanulási célok

A szószedet használatával:
- Megérti az alapvető Azure Developer CLI terminológiát és fogalmakat
- Elsajátítja az Azure felhőfejlesztés szókincsét és műszaki kifejezéseit
- Hatékonyan hivatkozik az Infrastructure as Code és telepítési terminológiára
- Megérti az Azure szolgáltatásneveket, mozaikszavakat és azok célját
- Hozzáférhet a hibakeresés és hibajavítás terminológiájához adott definíciókhoz
- Megtanulja az Azure fejlett architektúra és fejlesztési fogalmait

## Tanulási eredmények

A szószedet rendszeres használatával képes lesz:
- Hatékonyan kommunikálni a megfelelő Azure Developer CLI terminológiát használva
- Világosabban megérteni a műszaki dokumentációt és hibajelzéseket
- Magabiztosan eligazodni az Azure szolgáltatások és fogalmak között
- Megfelelő műszaki szókincset alkalmazva hibákat elhárítani
- Pontos műszaki nyelvezetet használva hozzájárulni a csapat megbeszéléseihez
- Rendszeresen bővíteni az Azure felhőfejlesztés ismereteit

## A

**ARM Template**  
Azure Resource Manager sablon. JSON alapú Infrastructure as Code formátum, amely deklaratív módon definiálja és telepíti az Azure erőforrásokat.

**App Service**  
Az Azure platform szolgáltatása (PaaS) webalkalmazások, REST API-k és mobil háttérrendszerek hosztolásához, infrastruktúra kezelés nélkül.

**Application Insights**  
Az Azure alkalmazás teljesítményfigyelő (APM) szolgáltatása, amely mélyreható betekintést nyújt az alkalmazás teljesítményébe, rendelkezésre állásába és használatába.

**Azure CLI**  
Parancssori felület az Azure erőforrások kezeléséhez. Kiegészíti az AZD-t, de külön bejelentkezést igényel; az AZD fő hitelesítése `azd auth login`-t használ.

**Azure Developer CLI (azd)**  
Fejlesztőközpontú parancssori eszköz, amely felgyorsítja az alkalmazások Azure-ba történő építését és telepítését sablonok és Infrastructure as Code használatával.

**azure.yaml**  
Az azd projekt fő konfigurációs fájlja, amely definiálja a szolgáltatásokat, infrastruktúrát és telepítési horgonyokat.

**Azure Resource Manager (ARM)**  
Az Azure telepítési és kezelési szolgáltatása, amely felügyeleti réteget biztosít az erőforrások létrehozásához, frissítéséhez és törléséhez.

## B

**Bicep**  
Microsoft által fejlesztett domain-specifikus nyelv (DSL) az Azure erőforrások telepítéséhez. Egyszerűbb szintaxist kínál, mint az ARM sablonok, miközben ARM-re fordítódik.

**Build**  
A forráskód lefordításának, a függőségek telepítésének és az alkalmazások telepítésre történő előkészítésének folyamata.

**Blue-Green Deployment**  
Telepítési stratégia, amely két azonos termelési környezetet (kék és zöld) használ a leállások és kockázatok minimalizálására.

## C

**Container Apps**  
Az Azure szerver nélküli konténer szolgáltatása, amely lehetővé teszi konténerizált alkalmazások futtatását bonyolult infrastruktúra kezelés nélkül.

**CI/CD**  
Folyamatos integráció/folyamatos telepítés. Automatizált gyakorlatok a kódváltozások integrálására és alkalmazások telepítésére.

**Cosmos DB**  
Az Azure globálisan elosztott, többmodellű adatbázis szolgáltatása, amely átfogó SLA-kat biztosít átbocsátóképességre, késleltetésre, rendelkezésre állásra és konzisztenciára.

**Configuration**  
Beállítások és paraméterek, amelyek szabályozzák az alkalmazás viselkedését és telepítési lehetőségeit.

## D

**Deployment**  
Az alkalmazások és függőségeik célinfrastruktúrán való telepítésének és konfigurálásának folyamata.

**Docker**  
Platform alkalmazások fejlesztésére, szállítására és futtatására konténerizációs technológia segítségével.

**Dockerfile**  
Szövegfájl, amely utasításokat tartalmaz egy Docker konténer kép felépítéséhez.

## E

**Environment**  
Egy telepítési cél, amely az alkalmazás egy adott példányát képviseli (pl. fejlesztés, tesztelés, éles környezet).

**Environment Variables**  
Konfigurációs értékek kulcs-érték párokban tárolva, amelyeket az alkalmazások futásidőben elérhetnek.

**Endpoint**  
URL vagy hálózati cím, ahol egy alkalmazás vagy szolgáltatás elérhető.

## F

**Function App**  
Az Azure szerver nélküli számítási szolgáltatása, amely eseményvezérelt kód futtatását teszi lehetővé infrastruktúra kezelés nélkül.

## G

**GitHub Actions**  
CI/CD platform, amely integrálva van a GitHub tárolókkal munkafolyamatok automatizálásához.

**Git**  
Elosztott verziókezelő rendszer, amelyet a forráskód változásainak nyomon követésére használnak.

## H

**Hooks**  
Egyedi parancsfájlok vagy parancsok, amelyek a telepítési életciklus bizonyos pontjain futnak (előtelepítés, utótelepítés, előtelepítés, utótelepítés).

**Host**  
Az Azure szolgáltatás típusa, amelyre egy alkalmazást telepítenek (pl. appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Az a gyakorlat, amely az infrastruktúra kódon keresztüli definiálására és kezelésére épül manuális folyamatok helyett.

**Init**  
Egy új azd projekt inicializálásának folyamata, rendszerint sablonból.

## J

**JSON**  
JavaScript Object Notation. Adatcsere-formátum, amelyet gyakran használnak konfigurációs fájlokban és API válaszokban.

**JWT**  
JSON Web Token. Szabvány az információ biztonságos átadására felek között JSON objektumként.

## K

**Key Vault**  
Az Azure szolgáltatása bizalmas adatok, kulcsok és tanúsítványok biztonságos tárolására és kezelésére.

**Kusto Query Language (KQL)**  
Lekérdező nyelv az Azure Monitor, Application Insights és más Azure szolgáltatások adatelemzésére.

## L

**Load Balancer**  
Szolgáltatás, amely a bejövő hálózati forgalmat több szerver vagy példány között osztja el.

**Log Analytics**  
Azure szolgáltatás, amely gyűjti, elemzi és reagál a felhő- és helyszíni környezetek telemetriai adataira.

## M

**Managed Identity**  
Azure funkció, amely automatikusan kezelt azonosítót biztosít Azure szolgáltatásoknak más Azure szolgáltatásokhoz való hitelesítéshez.

**Microservices**  
Architektúra, amelyben az alkalmazásokat kicsi, független szolgáltatások gyűjteményeként építik fel.

**Monitor**  
Az Azure egységes megfigyelési megoldása, amely teljes körű átláthatóságot biztosít alkalmazásokra és infrastruktúrára.

## N

**Node.js**  
JavaScript futtatókörnyezet a Chrome V8 JavaScript motorjára építve szerveroldali alkalmazások fejlesztéséhez.

**npm**  
Node.js csomagkezelő, amely kezeli a függőségeket és csomagokat.

## O

**Output**  
Értékek, amelyeket az infrastruktúra telepítése ad vissza, és amelyeket alkalmazások vagy más erőforrások használhatnak.

## P

**Package**  
Az alkalmazáskód és függőségek telepítésre történő előkészítésének folyamata.

**Parameters**  
Bemeneti értékek, amelyeket az infrastruktúra sablonoknak adnak át a telepítés testreszabásához.

**PostgreSQL**  
Nyílt forráskódú relációs adatbázis rendszer, amelyet az Azure menedzselt szolgáltatásként támogat.

**Provisioning**  
Az Azure erőforrások létrehozásának és konfigurálásának folyamata, ahogy azt az infrastruktúra sablonok definiálják.

## Q

**Quota**  
Az Azure előfizetésben vagy régióban létrehozható erőforrások mennyiségének korlátai.

## R

**Resource Group**  
Logikai tároló az Azure erőforrások számára, amelyek közös életciklussal, jogosultságokkal és szabályzatokkal rendelkeznek.

**Resource Token**  
Az azd által generált egyedi karaktersorozat az erőforrásnevek telepítésenkénti egyediségének biztosítására.

**REST API**  
Architektúrális stílus hálózati alkalmazások tervezéséhez HTTP módszerek használatával.

**Rollback**  
Az alkalmazás vagy infrastruktúra konfiguráció egy korábbi verziójára való visszatérés folyamata.

## S

**Service**  
Az alkalmazásának egy komponense, amely az azure.yaml fájlban van definiálva (pl. web frontend, API háttér, adatbázis).

**SKU**  
Raktári egység. Az Azure erőforrások különböző szolgáltatási szintjeit vagy teljesítmény szintjeit jelenti.

**SQL Database**  
Az Azure menedzselt relációs adatbázis szolgáltatása, amely a Microsoft SQL Server-en alapul.

**Static Web Apps**  
Azure szolgáltatás, amelyet teljes stack webalkalmazások forráskód tárhelyből történő létrehozására és telepítésére használnak.

**Storage Account**  
Azure szolgáltatás, amely felhőalapú tárhelyet biztosít adatelemekhez, beleértve blobokat, fájlokat, sorokat és táblákat.

**Subscription**  
Azure fiókot tartalmazó tároló, amely erőforráscsoportokat és erőforrásokat foglal magába, valamint a kapcsolódó számlázást és hozzáférés-kezelést.

## T

**Template**  
Előre elkészített projektstruktúra, amely alkalmazáskódot, infrastruktúra definíciókat és közös forgatókönyvek konfigurációját tartalmazza.

**Terraform**  
Nyílt forráskódú Infrastructure as Code eszköz, amely több felhőszolgáltatót támogat, beleértve az Azure-t is.

**Traffic Manager**  
Az Azure DNS-alapú forgalomelosztója, amely a forgalmat globális Azure régiók között teríti szét.

## U

**URI**  
Uniform Resource Identifier. Karaktersorozat, amely egy adott erőforrást azonosít.

**URL**  
Uniform Resource Locator. URI típus, amely megadja az erőforrás helyét és elérésének módját.

## V

**Virtual Network (VNet)**  
Alapvető építőelem az Azure privát hálózataihoz, elszigetelést és szegmentálást biztosít.

**VS Code**  
Visual Studio Code. Népszerű kódszerkesztő, kiváló Azure és azd integrációval.

## W

**Webhook**  
HTTP visszahívás, amelyet konkrét események indítanak el, gyakran használják CI/CD folyamatokban.

**What-if**  
Azure funkció, amely megmutatja, milyen változtatásokat hajtana végre a telepítés anélkül, hogy ténylegesen végrehajtaná azt.

## Y

**YAML**  
YAML nem jelölőnyelv. Ember által olvasható adat sorosítási szabvány, amelyet konfigurációs fájlokhoz, például az azure.yaml-hoz használnak.

## Z

**Zone**  
Fizikailag elkülönült helyszínek egy Azure régión belül, amelyek redundanciát és magas rendelkezésre állást biztosítanak.

---

## Gyakori mozaikszavak

| Mozaikszó | Teljes alak | Leírás |
|---------|-----------|-------------|
| AAD | Azure Active Directory (most Microsoft Entra ID) | Identitás- és hozzáférés-kezelési szolgáltatás |
| ACR | Azure Container Registry | Konténerkép-regisztrációs szolgáltatás |
| AKS | Azure Kubernetes Service | Menedzselt Kubernetes szolgáltatás |
| API | Application Programming Interface | Szoftverek építésére szolgáló protokollkészlet |
| ARM | Azure Resource Manager | Az Azure telepítési és kezelési szolgáltatása |
| CDN | Content Delivery Network | Elosztott kiszolgálóhálózat |
| CI/CD | Continuous Integration/Continuous Deployment | Automatizált fejlesztési gyakorlatok |
| CLI | Command Line Interface | Szöveges felhasználói felület |
| DNS | Domain Name System | Domain nevek IP címekké alakítása |
| HTTPS | Hypertext Transfer Protocol Secure | HTTP biztonságos verziója |
| IaC | Infrastructure as Code | Infrastruktúra kódon keresztüli kezelése |
| JSON | JavaScript Object Notation | Adatcsere formátum |
| JWT | JSON Web Token | Token formátum biztonságos információátvitelhez |
| KQL | Kusto Query Language | Lekérdező nyelv Azure adat szolgáltatásokhoz |
| RBAC | Role-Based Access Control | Szerepalapú hozzáférés-vezérlés |
| REST | Representational State Transfer | Webszolgáltatások architektúrális stílusa |
| SDK | Software Development Kit | Fejlesztői eszközkészlet |
| SLA | Service Level Agreement | Szolgáltatási szint megállapodás |
| SQL | Structured Query Language | Relációs adatbázis-kezelő nyelv |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Kriptográfiai protokollok |
| URI | Uniform Resource Identifier | Erőforrás azonosító karaktersorozat |
| URL | Uniform Resource Locator | URI típus, amely meghatározza az erőforrás helyét |
| VM | Virtual Machine | Számítógéprendszer emulációja |
| VNet | Virtual Network | Privát hálózat az Azure-ban |
| YAML | YAML nem jelölőnyelv | Adat sorosítási szabvány |

---

## Azure szolgáltatásnév megfeleltetések

| Általános név | Hivatalos Azure szolgáltatásnév | azd Host típus |
|-------------|------------------------------|---------------|
| Web App | Azure App Service | `appservice` |
| API App | Azure App Service | `appservice` |
| Container App | Azure Container Apps | `containerapp` |
| Function | Azure Functions | `function` |
| Static Site | Azure Static Web Apps | `staticwebapp` |
| Database | Azure Database for PostgreSQL | Infrastruktúra erőforrás, nem alkalmazás `host` |
| NoSQL DB | Azure Cosmos DB | Infrastruktúra erőforrás, nem alkalmazás `host` |
| Storage | Azure Storage Account | Infrastruktúra erőforrás, nem beépített alkalmazás `host` |
| Cache | Azure Managed Redis | Infrastruktúra erőforrás, nem alkalmazás `host` |
| Search | Azure AI Search | Infrastruktúra erőforrás, nem alkalmazás `host` |
| Messaging | Azure Service Bus | Infrastruktúra erőforrás, nem alkalmazás `host` |

`services.<name>.host` alkalmazás telepítési célpontot választ; nem rövidítése bármely Azure erőforrástípusnak. Adatbázisokat, gyorsítótárakat, keresési szolgáltatásokat és sorokat általában az infrastruktúra szolgáltató telepíti, és kimenetek/konfiguráció által kapcsolódnak az alkalmazáshoz.

---

## Kontextus-specifikus kifejezések

### Fejlesztési kifejezések
- **Hot Reload**: Az alkalmazások automatikus frissítése fejlesztés közben újraindítás nélkül
- **Build Pipeline**: Automatikus folyamat kód építésére és tesztelésére
- **Deployment Slot**: Tesztelési környezet egy App Service-en belül
- **Environment Parity**: Fejlesztési, tesztelési és éles környezetek hasonlóvá tartása

### Biztonsági kifejezések
- **Managed Identity**: Azure funkció automatikus hitelesítő adat kezelésre
- **Key Vault**: Titkok, kulcsok és tanúsítványok biztonságos tárolása
- **RBAC**: Szerepalapú hozzáférés-vezérlés Azure erőforrásokhoz
- **Network Security Group**: Virtuális tűzfal a hálózati forgalom szabályozásához

### Megfigyelési kifejezések
- **Telemetry**: Mérések és adatok automatikus gyűjtése
- **Application Performance Monitoring (APM)**: Alkalmazás teljesítményének figyelése
- **Log Analytics**: Szolgáltatás naplóadatok gyűjtésére és elemzésére
- **Alert Rules**: Automatikus értesítések metrikák vagy feltételek alapján

### Telepítési kifejezések
- **Blue-Green Deployment**: Zéró leállásos telepítési stratégia
- **Canary Deployment**: Fokozatos bevezetés a felhasználók egy részének
- **Rolling Update**: Az alkalmazás példányainak fokozatos cseréje
- **Rollback**: Visszatérés az alkalmazás korábbi verziójára

---

**Használati tipp**: Használja `Ctrl+F`-t, hogy gyorsan keressen specifikus kifejezéseket ebben a szószedetben. Kifejezések hol alkalmazható, ott egymásra mutatnak.

---

**Navigáció**
- **Előző lecke**: [Összefoglaló](cheat-sheet.md)
- **Következő lecke**: [GYIK](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->