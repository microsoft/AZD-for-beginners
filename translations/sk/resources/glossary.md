<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "59cb1c1635512e212da16d50f3259ca4",
  "translation_date": "2025-09-10T07:48:25+00:00",
  "source_file": "resources/glossary.md",
  "language_code": "sk"
}
-->
# Glosár - Terminológia Azure Developer CLI

## Úvod

Tento komplexný glosár poskytuje definície pojmov, konceptov a skratiek používaných v Azure Developer CLI a vývoji v Azure cloude. Je to nevyhnutná referencia na pochopenie technickej dokumentácie, riešenie problémov a efektívnu komunikáciu o azd projektoch a Azure službách.

## Ciele učenia

Používaním tohto glosára sa naučíte:
- Pochopiť základnú terminológiu a koncepty Azure Developer CLI
- Ovládnuť slovník a technické pojmy vývoja v Azure cloude
- Efektívne odkazovať na terminológiu infraštruktúry ako kódu a nasadzovania
- Porozumieť názvom služieb Azure, skratkám a ich účelom
- Získať definície pre terminológiu riešenia problémov a ladenia
- Naučiť sa pokročilé koncepty architektúry a vývoja v Azure

## Výsledky učenia

Pravidelným odkazovaním na tento glosár budete schopní:
- Efektívne komunikovať pomocou správnej terminológie Azure Developer CLI
- Jasnejšie rozumieť technickej dokumentácii a chybovým hláseniam
- S istotou sa orientovať v službách a konceptoch Azure
- Riešiť problémy pomocou vhodného technického slovníka
- Prispievať do tímových diskusií s presným technickým jazykom
- Systematicky rozširovať svoje znalosti o vývoji v Azure cloude

## A

**ARM Template**  
Šablóna Azure Resource Manager. Formát infraštruktúry ako kódu založený na JSON, používaný na deklaratívne definovanie a nasadzovanie Azure zdrojov.

**App Service**  
Platforma ako služba (PaaS) od Azure na hosťovanie webových aplikácií, REST API a mobilných backendov bez potreby správy infraštruktúry.

**Application Insights**  
Služba na monitorovanie výkonu aplikácií (APM) od Azure, ktorá poskytuje hlboké náhľady na výkon, dostupnosť a používanie aplikácií.

**Azure CLI**  
Príkazový riadok na správu Azure zdrojov. Používa sa v azd na autentifikáciu a niektoré operácie.

**Azure Developer CLI (azd)**  
Príkazový nástroj orientovaný na vývojárov, ktorý urýchľuje proces budovania a nasadzovania aplikácií do Azure pomocou šablón a infraštruktúry ako kódu.

**azure.yaml**  
Hlavný konfiguračný súbor pre azd projekt, ktorý definuje služby, infraštruktúru a nasadzovacie kroky.

**Azure Resource Manager (ARM)**  
Služba na nasadzovanie a správu Azure, ktorá poskytuje vrstvu na správu pre vytváranie, aktualizáciu a mazanie zdrojov.

## B

**Bicep**  
Doménovo špecifický jazyk (DSL) vyvinutý spoločnosťou Microsoft na nasadzovanie Azure zdrojov. Poskytuje jednoduchšiu syntax ako ARM šablóny, pričom sa kompiluje do ARM.

**Build**  
Proces kompilácie zdrojového kódu, inštalácie závislostí a prípravy aplikácií na nasadenie.

**Blue-Green Deployment**  
Stratégia nasadzovania, ktorá používa dve identické produkčné prostredia (modré a zelené) na minimalizáciu výpadkov a rizík.

## C

**Container Apps**  
Serverless kontajnerová služba Azure, ktorá umožňuje spúšťanie kontajnerizovaných aplikácií bez správy komplexnej infraštruktúry.

**CI/CD**  
Kontinuálna integrácia/kontinuálne nasadzovanie. Automatizované postupy na integráciu zmien v kóde a nasadzovanie aplikácií.

**Cosmos DB**  
Globálne distribuovaná, multi-modelová databázová služba Azure, ktorá poskytuje komplexné SLA pre priepustnosť, latenciu, dostupnosť a konzistenciu.

**Configuration**  
Nastavenia a parametre, ktoré riadia správanie aplikácie a možnosti nasadenia.

## D

**Deployment**  
Proces inštalácie a konfigurácie aplikácií a ich závislostí na cieľovej infraštruktúre.

**Docker**  
Platforma na vývoj, distribúciu a spúšťanie aplikácií pomocou technológie kontajnerizácie.

**Dockerfile**  
Textový súbor obsahujúci inštrukcie na vytvorenie Docker kontajnerového obrazu.

## E

**Environment**  
Cieľ nasadenia, ktorý predstavuje konkrétnu inštanciu vašej aplikácie (napr. vývoj, staging, produkcia).

**Environment Variables**  
Konfiguračné hodnoty uložené ako páry kľúč-hodnota, ku ktorým majú aplikácie prístup počas behu.

**Endpoint**  
URL alebo sieťová adresa, kde je možné pristupovať k aplikácii alebo službe.

## F

**Function App**  
Serverless výpočtová služba Azure, ktorá umožňuje spúšťanie kódu na základe udalostí bez správy infraštruktúry.

## G

**GitHub Actions**  
Platforma CI/CD integrovaná s GitHub repozitármi na automatizáciu pracovných postupov.

**Git**  
Distribuovaný systém na správu verzií používaný na sledovanie zmien v zdrojovom kóde.

## H

**Hooks**  
Vlastné skripty alebo príkazy, ktoré sa spúšťajú v konkrétnych bodoch počas životného cyklu nasadzovania (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Typ služby Azure, kde bude aplikácia nasadená (napr. appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Praxe definovania a správy infraštruktúry prostredníctvom kódu namiesto manuálnych procesov.

**Init**  
Proces inicializácie nového azd projektu, zvyčajne zo šablóny.

## J

**JSON**  
JavaScript Object Notation. Formát na výmenu dát bežne používaný pre konfiguračné súbory a odpovede API.

**JWT**  
JSON Web Token. Štandard na bezpečný prenos informácií medzi stranami vo forme JSON objektu.

## K

**Key Vault**  
Služba Azure na bezpečné ukladanie a správu tajomstiev, kľúčov a certifikátov.

**Kusto Query Language (KQL)**  
Dotazovací jazyk používaný na analýzu dát v Azure Monitor, Application Insights a iných Azure službách.

## L

**Load Balancer**  
Služba, ktorá rozdeľuje prichádzajúcu sieťovú prevádzku medzi viaceré servery alebo inštancie.

**Log Analytics**  
Služba Azure na zhromažďovanie, analýzu a spracovanie telemetrických dát z cloudových a on-premises prostredí.

## M

**Managed Identity**  
Funkcia Azure, ktorá poskytuje Azure službám automaticky spravovanú identitu na autentifikáciu k iným Azure službám.

**Microservices**  
Architektonický prístup, kde sú aplikácie budované ako kolekcia malých, nezávislých služieb.

**Monitor**  
Zjednotená monitorovacia služba Azure, ktorá poskytuje úplnú observabilitu aplikácií a infraštruktúry.

## N

**Node.js**  
JavaScript runtime postavený na JavaScript engine V8 od Chrome na budovanie serverových aplikácií.

**npm**  
Správca balíkov pre Node.js, ktorý spravuje závislosti a balíky.

## O

**Output**  
Hodnoty vrátené z nasadenia infraštruktúry, ktoré môžu byť použité aplikáciami alebo inými zdrojmi.

## P

**Package**  
Proces prípravy kódu aplikácie a závislostí na nasadenie.

**Parameters**  
Vstupné hodnoty odovzdávané infraštruktúrnym šablónam na prispôsobenie nasadení.

**PostgreSQL**  
Open-source relačný databázový systém podporovaný ako spravovaná služba v Azure.

**Provisioning**  
Proces vytvárania a konfigurácie Azure zdrojov definovaných v infraštruktúrnych šablónach.

## Q

**Quota**  
Limity na množstvo zdrojov, ktoré môžu byť vytvorené v Azure predplatnom alebo regióne.

## R

**Resource Group**  
Logický kontajner pre Azure zdroje, ktoré zdieľajú rovnaký životný cyklus, povolenia a politiky.

**Resource Token**  
Unikátny reťazec generovaný azd na zabezpečenie jedinečnosti názvov zdrojov naprieč nasadeniami.

**REST API**  
Architektonický štýl na navrhovanie sieťových aplikácií pomocou HTTP metód.

**Rollback**  
Proces návratu k predchádzajúcej verzii aplikácie alebo konfigurácie infraštruktúry.

## S

**Service**  
Komponent vašej aplikácie definovaný v azure.yaml (napr. webový frontend, API backend, databáza).

**SKU**  
Stock Keeping Unit. Predstavuje rôzne úrovne služieb alebo výkonnostné úrovne pre Azure zdroje.

**SQL Database**  
Spravovaná relačná databázová služba Azure založená na Microsoft SQL Serveri.

**Static Web Apps**  
Služba Azure na budovanie a nasadzovanie full-stack webových aplikácií z repozitárov zdrojového kódu.

**Storage Account**  
Služba Azure, ktorá poskytuje cloudové úložisko pre dátové objekty vrátane blobov, súborov, frontov a tabuliek.

**Subscription**  
Kontejner Azure účtu, ktorý obsahuje skupiny zdrojov a zdroje, s pridruženým účtovaním a správou prístupu.

## T

**Template**  
Predpripravená štruktúra projektu obsahujúca kód aplikácie, definície infraštruktúry a konfiguráciu pre bežné scenáre.

**Terraform**  
Open-source nástroj infraštruktúry ako kódu, ktorý podporuje viacerých poskytovateľov cloudu vrátane Azure.

**Traffic Manager**  
DNS-based load balancer Azure na distribúciu prevádzky naprieč globálnymi Azure regiónmi.

## U

**URI**  
Uniform Resource Identifier. Reťazec, ktorý identifikuje konkrétny zdroj.

**URL**  
Uniform Resource Locator. Typ URI, ktorý špecifikuje, kde sa zdroj nachádza a ako ho získať.

## V

**Virtual Network (VNet)**  
Základný stavebný blok pre súkromné siete v Azure, poskytujúci izoláciu a segmentáciu.

**VS Code**  
Visual Studio Code. Populárny editor kódu s výbornou integráciou Azure a azd.

## W

**Webhook**  
HTTP spätné volanie spustené konkrétnymi udalosťami, bežne používané v CI/CD pipeline.

**What-if**  
Funkcia Azure, ktorá ukazuje, aké zmeny by boli vykonané nasadením bez ich skutočného vykonania.

## Y

**YAML**  
YAML Ain't Markup Language. Štandard na serializáciu dát čitateľný pre človeka, používaný pre konfiguračné súbory ako azure.yaml.

## Z

**Zone**  
Fyzicky oddelené lokality v rámci Azure regiónu, ktoré poskytujú redundanciu a vysokú dostupnosť.

---

## Bežné skratky

| Skratka | Plný názov | Popis |
|---------|-----------|-------|
| AAD | Azure Active Directory | Služba na správu identity a prístupu |
| ACR | Azure Container Registry | Služba na registráciu kontajnerových obrazov |
| AKS | Azure Kubernetes Service | Spravovaná Kubernetes služba |
| API | Application Programming Interface | Sada protokolov na tvorbu softvéru |
| ARM | Azure Resource Manager | Služba na nasadzovanie a správu Azure |
| CDN | Content Delivery Network | Distribuovaná sieť serverov |
| CI/CD | Continuous Integration/Continuous Deployment | Automatizované vývojové postupy |
| CLI | Command Line Interface | Textové používateľské rozhranie |
| DNS | Domain Name System | Systém na prekladanie doménových mien na IP adresy |
| HTTPS | Hypertext Transfer Protocol Secure | Bezpečná verzia HTTP |
| IaC | Infrastructure as Code | Správa infraštruktúry prostredníctvom kódu |
| JSON | JavaScript Object Notation | Formát na výmenu dát |
| JWT | JSON Web Token | Formát tokenu na bezpečný prenos informácií |
| KQL | Kusto Query Language | Dotazovací jazyk pre Azure dátové služby |
| RBAC | Role-Based Access Control | Metóda kontroly prístupu na základe rolí používateľov |
| REST | Representational State Transfer | Architektonický štýl pre webové služby |
| SDK | Software Development Kit | Kolekcia vývojárskych nástrojov |
| SLA | Service Level Agreement | Záväzok k dostupnosti/výkonu služby |
| SQL | Structured Query Language | Jazyk na správu relačných databáz |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Kryptografické protokoly |
| URI | Uniform Resource Identifier | Reťazec identifikujúci zdroj |
| URL | Uniform Resource Locator | Typ URI špecifikujúci umiestnenie zdroja |
| VM | Virtual Machine | Emulácia počítačového systému |
| VNet | Virtual Network | Súkromná sieť v Azure |
| YAML | YAML Ain't Markup Language | Štandard na serializáciu dát |

---

## Mapovanie názvov služieb Azure

| Bežný názov | Oficiálny názov služby Azure | azd Host Type |
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

## Kontextovo špecifické pojmy

### Vývojové pojmy
- **Hot Reload**: Automatická aktualizácia aplikácií počas vývoja bez reštartu
- **Build Pipeline**: Automatizovaný proces na zostavenie a testovanie kódu
- **Deployment Slot**: Staging prostredie v rámci App Service
- **Environment Parity**: Udržiavanie podobnosti vývojových, staging a produkčných prostredí

### Bezpečnostné pojmy
- **Managed Identity**: Funkcia Azure poskytujúca automatickú správu poverení
- **Key Vault**: Bezpečné úložisko pre tajomstvá, kľúče a certifikáty
- **RBAC**: Kontrola prístupu na základe rolí pre Azure zdroje
- **Network Security Group**: Virtuálny firewall na kontrolu sieťovej prevádzky

### Monitorovacie pojmy
- **Telemetry**: Automatizovaný zber meraní a dát
- **Application Performance Monitoring (APM)**: Monitorovanie výkonu softvéru
- **Log Analytics**: Služba na zber a analýzu logov
- **Alert Rules**: Automatizované notifikácie na základe metrík alebo podmienok

### Pojmy nasadzovania
- **Blue-Green Deployment**: Stratégia nasadzovania bez výpadkov
- **Canary Deployment**: Postupné nasadzovanie pre podmnožinu používateľov
- **Rolling Update**: Sekvenčná výmena inštancií aplikácie
- **Rollback**: Návrat k predchádzajúcej verzii aplikácie

---

**Tip na použitie**: Použite `Ctrl+F` na rýchle vyhľadanie konkrétnych pojmov v tomto glosári. Pojmy sú prepojené, kde je to relevantné.

---

**Navigácia**
- **Predchádzajúca lekcia**: [Cheat Sheet](cheat-sheet.md)
- **Nasledujúca lekcia**: [FAQ](faq.md)

---

**Upozornenie**:  
Tento dokument bol preložený pomocou služby na automatický preklad [Co-op Translator](https://github.com/Azure/co-op-translator). Aj keď sa snažíme o presnosť, upozorňujeme, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho pôvodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre dôležité informácie sa odporúča profesionálny ľudský preklad. Nezodpovedáme za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.