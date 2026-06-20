# Slovník - Azure a terminológia AZD

**Referencie pre všetky kapitoly**
- **📚 Domov kurzu**: [AZD For Beginners](../README.md)
- **📖 Naučiť sa základy**: [Kapitola 1: Základy AZD](../docs/getting-started/azd-basics.md)
- **🤖 Pojmy AI**: [Kapitola 2: Vývoj zameraný na AI](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## Úvod

Tento komplexný slovník poskytuje definície pojmov, konceptov a skratiek používaných v Azure Developer CLI a pri vývoji v cloude Azure. Základný odkaz na pochopenie technickej dokumentácie, riešenie problémov a efektívnu komunikáciu o projektoch azd a službách Azure.

## Ciele učenia

Používaním tohto slovníka budete:
- Rozumieť základnej terminológii a konceptom Azure Developer CLI
- Ovládnuť slovnú zásobu Azure cloudového vývoja a technické pojmy
- Efektívne vyhľadávať pojmy týkajúce sa Infrastructure as Code a nasadzovania
- Pochopiť názvy služieb Azure, skratky a ich účel
- Získať definície na riešenie problémov a ladenie
- Naučiť sa pokročilé koncepty architektúry a vývoja v Azure

## Očakávané výsledky

Pravidelným používaním tohto slovníka budete schopní:
- Efektívne komunikovať s použitím správnej terminológie Azure Developer CLI
- Jasnejšie rozumieť technickej dokumentácii a chybovým hláseniam
- Sebavedomo sa orientovať v službách a konceptoch Azure
- Riešiť problémy pomocou vhodnej technickej slovnej zásoby
- Prispievať do tímových diskusií s presným technickým vyjadrovaním
- Systematicky rozširovať svoje znalosti vývoja v Azure

## A

**ARM Template**  
Šablóna Azure Resource Manager. Formát Infrastructure as Code založený na JSON používaný na deklaratívne definovanie a nasadzovanie prostriedkov v Azure.

**App Service**  
Ponuka platformy ako služby (PaaS) od Azure na hostovanie webových aplikácií, REST API a mobilných backendov bez potreby spravovať infraštruktúru.

**Application Insights**  
Služba Azure na monitorovanie výkonu aplikácií (APM), ktorá poskytuje hlboký prehľad o výkone, dostupnosti a používaní aplikácií.

**Azure CLI**  
Rozhranie príkazového riadku na správu prostriedkov Azure. Používa sa aj v azd na overovanie a niektoré operácie.

**Azure Developer CLI (azd)**  
Nástroj príkazového riadku zameraný na vývojárov, ktorý urýchľuje proces tvorby a nasadzovania aplikácií do Azure pomocou šablón a Infrastructure as Code.

**azure.yaml**  
Hlavný konfiguračný súbor projektu azd, ktorý definuje služby, infraštruktúru a nasadzovacie háčiky.

**Azure Resource Manager (ARM)**  
Služba Azure pre nasadzovanie a správu, ktorá poskytuje vrstvu správy na vytváranie, aktualizovanie a mazaní prostriedkov.

## B

**Bicep**  
Domain-specific language (DSL) vyvinutý spoločnosťou Microsoft na nasadzovanie prostriedkov Azure. Poskytuje jednoduchšiu syntax ako ARM šablóny a pritom sa kompiluje do ARM.

**Build**  
Proces kompilácie zdrojového kódu, inštalácie závislostí a prípravy aplikácií na nasadenie.

**Blue-Green Deployment**  
Stratégia nasadzovania, ktorá využíva dve identické produkčné prostredia (blue a green) na minimalizáciu prestojov a rizika.

## C

**Container Apps**  
Serverless služba pre kontajnery od Azure, ktorá umožňuje spúšťať kontajnerizované aplikácie bez správy komplexnej infraštruktúry.

**CI/CD**  
Continuous Integration/Continuous Deployment. Automatizované postupy pre integráciu zmien v kóde a nasadzovanie aplikácií.

**Cosmos DB**  
Globálne distribuovaná multi-model databázová služba v Azure, ktorá poskytuje komplexné SLA pre priepustnosť, latenciu, dostupnosť a konzistenciu.

**Configuration**  
Nastavenia a parametre, ktoré riadia správanie aplikácie a možnosti nasadenia.

## D

**Deployment**  
Proces inštalovania a konfigurácie aplikácií a ich závislostí na cieľovej infraštruktúre.

**Docker**  
Platforma na vývoj, distribúciu a spúšťanie aplikácií pomocou kontajnerizácie.

**Dockerfile**  
Textový súbor obsahujúci inštrukcie na vytvorenie Docker image kontajnera.

## E

**Environment**  
Cieľ nasadenia, ktorý predstavuje konkrétnu inštanciu vašej aplikácie (napr. development, staging, production).

**Environment Variables**  
Konfiguračné hodnoty uložené ako páry kľúč-hodnota, ku ktorým majú aplikácie prístup za behu.

**Endpoint**  
URL alebo sieťová adresa, kde je možné pristupovať k aplikácii alebo službe.

## F

**Function App**  
Serverless výpočtová služba Azure, ktorá umožňuje spúšťať udalosťami riadený kód bez správy infraštruktúry.

## G

**GitHub Actions**  
Platforma CI/CD integrovaná s repozitármi GitHub na automatizáciu pracovných postupov.

**Git**  
Distribuovaný systém na správu verzií používaný na sledovanie zmien v zdrojovom kóde.

## H

**Hooks**  
Vlastné skripty alebo príkazy, ktoré sa spúšťajú v konkrétnych bodoch životného cyklu nasadenia (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Typ služby Azure, kam bude aplikácia nasadená (napr. appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Praktika definovania a správy infraštruktúry pomocou kódu namiesto manuálnych procesov.

**Init**  
Proces inicializácie nového projektu azd, typicky z šablóny.

## J

**JSON**  
JavaScript Object Notation. Formát pre výmenu dát bežne používaný pre konfiguračné súbory a odpovede API.

**JWT**  
JSON Web Token. Štandard na bezpečný prenos informácií medzi stranami ako JSON objekt.

## K

**Key Vault**  
Služba Azure na bezpečné ukladanie a správu tajomstiev, kľúčov a certifikátov.

**Kusto Query Language (KQL)**  
Query jazyk používaný na analýzu dát v Azure Monitor, Application Insights a ďalších službách Azure.

## L

**Load Balancer**  
Služba, ktorá rozdeľuje prichádzajúcu sieťovú prevádzku medzi viacero serverov alebo inštancií.

**Log Analytics**  
Služba Azure na zber, analýzu a reakciu na telemetrické dáta z cloudových a lokálnych prostredí.

## M

**Managed Identity**  
Funkcia Azure, ktorá poskytuje automaticky spravovanú identitu pre autentifikáciu voči iným službám Azure.

**Microservices**  
Architektonický prístup, kde sú aplikácie postavené ako zbierka malých, nezávislých služieb.

**Monitor**  
Unifikované monitorovacie riešenie Azure, ktoré poskytuje observabilitu naprieč aplikáciami a infraštruktúrou.

## N

**Node.js**  
JavaScript runtime postavený na engine V8 od Chrome na vytváranie server-side aplikácií.

**npm**  
Správca balíkov pre Node.js, ktorý spravuje závislosti a balíčky.

## O

**Output**  
Hodnoty vrátené z nasadenia infraštruktúry, ktoré môžu byť použité aplikáciami alebo inými prostriedkami.

## P

**Package**  
Proces prípravy kódu aplikácie a závislostí na nasadenie.

**Parameters**  
Vstupné hodnoty odovzdávané do infraštruktúrnych šablón na prispôsobenie nasadení.

**PostgreSQL**  
Open-source relačný databázový systém podporovaný ako spravovaná služba v Azure.

**Provisioning**  
Proces vytvárania a konfigurácie prostriedkov Azure definovaných v infraštruktúrnych šablónach.

## Q

**Quota**  
Limity na množstvo prostriedkov, ktoré je možné vytvoriť v Azure subskripcii alebo regióne.

## R

**Resource Group**  
Logický kontajner pre prostriedky Azure, ktoré zdieľajú rovnaký životný cyklus, oprávnenia a politiky.

**Resource Token**  
Jedinečný reťazec generovaný azd na zabezpečenie jedinečnosti mien prostriedkov naprieč nasadeniami.

**REST API**  
Architektonický štýl pre navrhovanie sieťových aplikácií používajúci HTTP metódy.

**Rollback**  
Proces vrátenia sa na predchádzajúcu verziu aplikácie alebo konfigurácie infraštruktúry.

## S

**Service**  
Komponent vašej aplikácie definovaný v azure.yaml (napr. web frontend, API backend, databáza).

**SKU**  
Stock Keeping Unit. Predstavuje rôzne úrovne služieb alebo výkonnostné triedy pre prostriedky Azure.

**SQL Database**  
Spravovaná relačná databázová služba Azure založená na Microsoft SQL Server.

**Static Web Apps**  
Služba Azure na budovanie a nasadzovanie full-stack webových aplikácií z repozitárov so zdrojovým kódom.

**Storage Account**  
Služba Azure poskytujúca cloudové úložisko pre dátové objekty vrátane blobov, súborov, front a tabuliek.

**Subscription**  
Kontajner účtu Azure, ktorý obsahuje resource groupy a prostriedky vrátane fakturácie a správy prístupu.

## T

**Template**  
Predpripravená projektová štruktúra obsahujúca kód aplikácie, definície infraštruktúry a konfiguráciu pre bežné scenáre.

**Terraform**  
Open-source nástroj Infrastructure as Code, ktorý podporuje viacerých cloudových poskytovateľov vrátane Azure.

**Traffic Manager**  
DNS-based load balancer Azure na rozdeľovanie prevádzky naprieč globálnymi regiónmi Azure.

## U

**URI**  
Uniform Resource Identifier. Reťazec identifikujúci konkrétny zdroj.

**URL**  
Uniform Resource Locator. Typ URI, ktorý špecifikuje, kde sa zdroj nachádza a ako ho získať.

## V

**Virtual Network (VNet)**  
Základný stavebný prvok pre súkromné siete v Azure, poskytujúci izoláciu a segmentáciu.

**VS Code**  
Visual Studio Code. Populárny editor kódu s vynikajúcou integráciou s Azure a azd.

## W

**Webhook**  
HTTP callback spustený pri konkrétnych udalostiach, bežne používaný v CI/CD pipeline.

**What-if**  
Funkcia Azure, ktorá zobrazuje, aké zmeny by vykonalo nasadenie bez jeho skutočnej realizácie.

## Y

**YAML**  
YAML Ain't Markup Language. Ľudsky čitateľný štandard serializácie dát používaný pre konfiguračné súbory ako azure.yaml.

## Z

**Zone**  
Fyzicky oddelené lokality v rámci regiónu Azure, ktoré poskytujú redundanciu a vysokú dostupnosť.

---

## Bežné skratky

| Acronym | Full Form | Description |
|---------|-----------|-------------|
| AAD | Azure Active Directory (now Microsoft Entra ID) | Služba na správu identity a prístupu |
| ACR | Azure Container Registry | Služba registra obrazov kontajnerov |
| AKS | Azure Kubernetes Service | Spravovaná služba Kubernetes |
| API | Application Programming Interface | Sada protokolov na vytváranie softvéru |
| ARM | Azure Resource Manager | Služba Azure pre nasadzovanie a správu |
| CDN | Content Delivery Network | Distribuovaná sieť serverov na doručovanie obsahu |
| CI/CD | Continuous Integration/Continuous Deployment | Automatizované vývojové postupy |
| CLI | Command Line Interface | Textové používateľské rozhranie |
| DNS | Domain Name System | Systém na preklad doménových mien na IP adresy |
| HTTPS | Hypertext Transfer Protocol Secure | Zabezpečená verzia HTTP |
| IaC | Infrastructure as Code | Správa infraštruktúry cez kód |
| JSON | JavaScript Object Notation | Formát pre výmenu dát |
| JWT | JSON Web Token | Formát tokenu na bezpečný prenos informácií |
| KQL | Kusto Query Language | Dotazovací jazyk pre dátové služby Azure |
| RBAC | Role-Based Access Control | Metóda riadenia prístupu na základe rolí |
| REST | Representational State Transfer | Architektonický štýl pre webové služby |
| SDK | Software Development Kit | Kolekcia nástrojov pre vývoj |
| SLA | Service Level Agreement | Záväzok k dostupnosti/výkonu služby |
| SQL | Structured Query Language | Jazyk na správu relačných databáz |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Kryptografické protokoly |
| URI | Uniform Resource Identifier | Reťazec identifikujúci zdroj |
| URL | Uniform Resource Locator | Typ URI určujúci umiestnenie zdroja |
| VM | Virtual Machine | Emulácia počítačového systému |
| VNet | Virtual Network | Súkromná sieť v Azure |
| YAML | YAML Ain't Markup Language | Štandard serializácie dát |

---

## Mapovania názvov služieb Azure

| Common Name | Official Azure Service Name | azd Host Type |
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

## Termíny špecifické pre kontext

### Termíny vývoja
- **Hot Reload**: Automatická aktualizácia aplikácií počas vývoja bez potreby reštartu
- **Build Pipeline**: Automatizovaný proces na zostavovanie a testovanie kódu
- **Deployment Slot**: Staging prostredie v rámci App Service
- **Environment Parity**: Udržiavanie vývoja, stagingu a produkcie v podobnom stave

### Termíny bezpečnosti
- **Managed Identity**: Funkcia Azure poskytujúca automatické spravovanie poverení
- **Key Vault**: Bezpečné úložisko pre tajomstvá, kľúče a certifikáty
- **RBAC**: Riadenie prístupu na základe rolí pre prostriedky Azure
- **Network Security Group**: Virtuálny firewall na riadenie sieťovej prevádzky

### Termíny monitorovania
- **Telemetry**: Automatizovaný zber meraní a dát
- **Application Performance Monitoring (APM)**: Monitorovanie výkonu softvéru
- **Log Analytics**: Služba na zber a analýzu logovacích dát
- **Alert Rules**: Automatizované upozornenia založené na metrikách alebo podmienkach

### Termíny nasadzovania
- **Blue-Green Deployment**: Stratégia nasadzovania bez výpadku
- **Canary Deployment**: Postupné uvoľňovanie pre podmnožinu používateľov
- **Rolling Update**: Sekvenčná výmena inštancií aplikácie
- **Rollback**: Vrátenie sa k predchádzajúcej verzii aplikácie

---

**Tip na použitie**: Použite `Ctrl+F` na rýchle vyhľadanie konkrétnych pojmov v tomto slovníku. Pojmy sú vzájomne prepojené tam, kde je to relevantné.

---

**Navigácia**
- **Predchádzajúca lekcia**: [Cheat Sheet](cheat-sheet.md)
- **Nasledujúca lekcia**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->