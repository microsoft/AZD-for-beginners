# Glosár - Terminológia Azure a AZD

**Referencie pre všetky kapitoly**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../README.md)
- **📖 Naučte sa základy**: [Kapitola 1: Základy AZD](../docs/getting-started/azd-basics.md)
- **🤖 AI Termíny**: [Kapitola 2: Vývoj orientovaný na AI](../docs/ai-foundry/azure-ai-foundry-integration.md)

## Úvod

Tento komplexný glosár poskytuje definície pojmov, konceptov a skratiek používaných v Azure Developer CLI a vývoji v Azure cloude. Je nevyhnutnou referenciou na pochopenie technickej dokumentácie, riešenie problémov a efektívnu komunikáciu o projektoch azd a službách Azure.

## Ciele učenia

Používaním tohto glosára budete:
- Rozumieť základnej terminológii a konceptom Azure Developer CLI
- Ovládať slovník a technické pojmy vývoja v Azure cloude
- Efektívne odkazovať na terminológiu infraštruktúry ako kódu a nasadzovania
- Pochopiť názvy služieb Azure, skratky a ich účely
- Získať definície na riešenie problémov a terminológiu ladenia
- Naučiť sa pokročilé koncepty architektúry a vývoja v Azure

## Výsledky učenia

Pravidelným používaním tohto glosára budete schopní:
- Efektívne komunikovať pomocou správnej terminológie Azure Developer CLI
- Jasnejšie rozumieť technickej dokumentácii a chybovým hláseniam
- S istotou sa orientovať v službách a konceptoch Azure
- Riešiť problémy pomocou vhodného technického slovníka
- Prispievať k tímovým diskusiám s presným technickým jazykom
- Systematicky rozširovať svoje znalosti vývoja v Azure cloude

## A

**ARM Template**  
Šablóna Azure Resource Manager. Formát infraštruktúry ako kódu založený na JSON, používaný na deklaratívne definovanie a nasadzovanie zdrojov Azure.

**App Service**  
Platforma ako služba (PaaS) od Azure na hosťovanie webových aplikácií, REST API a mobilných backendov bez správy infraštruktúry.

**Application Insights**  
Služba monitorovania výkonu aplikácií (APM) od Azure, ktorá poskytuje hlboké náhľady na výkon, dostupnosť a používanie aplikácií.

**Azure CLI**  
Rozhranie príkazového riadku na správu zdrojov Azure. Používané azd na autentifikáciu a niektoré operácie.

**Azure Developer CLI (azd)**  
Príkazový nástroj zameraný na vývojárov, ktorý urýchľuje proces vytvárania a nasadzovania aplikácií do Azure pomocou šablón a infraštruktúry ako kódu.

**azure.yaml**  
Hlavný konfiguračný súbor projektu azd, ktorý definuje služby, infraštruktúru a nasadzovacie háky.

**Azure Resource Manager (ARM)**  
Služba nasadzovania a správy Azure, ktorá poskytuje vrstvu na správu vytvárania, aktualizácie a odstraňovania zdrojov.

## B

**Bicep**  
Doménovo špecifický jazyk (DSL) vyvinutý spoločnosťou Microsoft na nasadzovanie zdrojov Azure. Poskytuje jednoduchšiu syntax ako ARM šablóny, pričom sa kompiluje do ARM.

**Build**  
Proces kompilácie zdrojového kódu, inštalácie závislostí a prípravy aplikácií na nasadenie.

**Blue-Green Deployment**  
Stratégia nasadzovania, ktorá používa dve identické produkčné prostredia (modré a zelené) na minimalizáciu prestojov a rizika.

## C

**Container Apps**  
Serverless kontajnerová služba Azure, ktorá umožňuje spúšťanie kontajnerizovaných aplikácií bez správy zložitej infraštruktúry.

**CI/CD**  
Kontinuálna integrácia/kontinuálne nasadzovanie. Automatizované postupy na integráciu zmien kódu a nasadzovanie aplikácií.

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
Textový súbor obsahujúci pokyny na vytvorenie obrazu kontajnera Docker.

## E

**Environment**  
Cieľ nasadenia, ktorý predstavuje konkrétnu inštanciu vašej aplikácie (napr. vývoj, staging, produkcia).

**Environment Variables**  
Konfiguračné hodnoty uložené ako páry kľúč-hodnota, ku ktorým aplikácie môžu pristupovať počas behu.

**Endpoint**  
URL alebo sieťová adresa, kde je možné pristupovať k aplikácii alebo službe.

## F

**Function App**  
Serverless výpočtová služba Azure, ktorá umožňuje spúšťanie kódu riadeného udalosťami bez správy infraštruktúry.

## G

**GitHub Actions**  
Platforma CI/CD integrovaná s repozitármi GitHub na automatizáciu pracovných postupov.

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
Proces inicializácie nového projektu azd, zvyčajne zo šablóny.

## J

**JSON**  
JavaScript Object Notation. Formát výmeny dát bežne používaný pre konfiguračné súbory a odpovede API.

**JWT**  
JSON Web Token. Štandard na bezpečný prenos informácií medzi stranami ako JSON objekt.

## K

**Key Vault**  
Služba Azure na bezpečné ukladanie a správu tajomstiev, kľúčov a certifikátov.

**Kusto Query Language (KQL)**  
Dotazovací jazyk používaný na analýzu dát v Azure Monitor, Application Insights a ďalších službách Azure.

## L

**Load Balancer**  
Služba, ktorá rozdeľuje prichádzajúcu sieťovú prevádzku medzi viaceré servery alebo inštancie.

**Log Analytics**  
Služba Azure na zhromažďovanie, analýzu a reakciu na telemetrické dáta z cloudových a lokálnych prostredí.

## M

**Managed Identity**  
Funkcia Azure, ktorá poskytuje službám Azure automaticky spravovanú identitu na autentifikáciu k iným službám Azure.

**Microservices**  
Architektonický prístup, kde sú aplikácie vytvorené ako kolekcia malých, nezávislých služieb.

**Monitor**  
Jednotné monitorovacie riešenie Azure, ktoré poskytuje úplnú observabilitu naprieč aplikáciami a infraštruktúrou.

## N

**Node.js**  
JavaScript runtime postavený na JavaScriptovom engine V8 od Chrome na vytváranie serverových aplikácií.

**npm**  
Správca balíkov pre Node.js, ktorý spravuje závislosti a balíky.

## O

**Output**  
Hodnoty vrátené z nasadenia infraštruktúry, ktoré môžu byť použité aplikáciami alebo inými zdrojmi.

## P

**Package**  
Proces prípravy kódu aplikácie a závislostí na nasadenie.

**Parameters**  
Vstupné hodnoty odovzdané šablónam infraštruktúry na prispôsobenie nasadení.

**PostgreSQL**  
Open-source relačný databázový systém podporovaný ako spravovaná služba v Azure.

**Provisioning**  
Proces vytvárania a konfigurácie zdrojov Azure definovaných v šablónach infraštruktúry.

## Q

**Quota**  
Limity na množstvo zdrojov, ktoré je možné vytvoriť v Azure predplatnom alebo regióne.

## R

**Resource Group**  
Logický kontajner pre zdroje Azure, ktoré zdieľajú rovnaký životný cyklus, povolenia a politiky.

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
Stock Keeping Unit. Reprezentuje rôzne úrovne služieb alebo výkonnostné úrovne pre zdroje Azure.

**SQL Database**  
Spravovaná relačná databázová služba Azure založená na Microsoft SQL Server.

**Static Web Apps**  
Služba Azure na vytváranie a nasadzovanie full-stack webových aplikácií zo zdrojových repozitárov.

**Storage Account**  
Služba Azure, ktorá poskytuje cloudové úložisko pre dátové objekty vrátane blobov, súborov, frontov a tabuliek.

**Subscription**  
Kontajner účtu Azure, ktorý obsahuje skupiny zdrojov a zdroje, s pridruženým účtovaním a správou prístupu.

## T

**Template**  
Predpripravená štruktúra projektu obsahujúca kód aplikácie, definície infraštruktúry a konfiguráciu pre bežné scenáre.

**Terraform**  
Open-source nástroj infraštruktúry ako kódu, ktorý podporuje viacerých poskytovateľov cloudu vrátane Azure.

**Traffic Manager**  
DNS-based load balancer Azure na rozdeľovanie prevádzky naprieč globálnymi regiónmi Azure.

## U

**URI**  
Uniform Resource Identifier. Reťazec, ktorý identifikuje konkrétny zdroj.

**URL**  
Uniform Resource Locator. Typ URI, ktorý špecifikuje, kde sa zdroj nachádza a ako ho získať.

## V

**Virtual Network (VNet)**  
Základný stavebný blok pre súkromné siete v Azure, poskytujúci izoláciu a segmentáciu.

**VS Code**  
Visual Studio Code. Populárny editor kódu s vynikajúcou integráciou Azure a azd.

## W

**Webhook**  
HTTP callback spustený konkrétnymi udalosťami, bežne používaný v CI/CD pipeline.

**What-if**  
Funkcia Azure, ktorá ukazuje, aké zmeny by boli vykonané nasadením bez jeho skutočného vykonania.

## Y

**YAML**  
YAML Ain't Markup Language. Štandard na serializáciu dát čitateľný pre človeka, používaný pre konfiguračné súbory ako azure.yaml.

## Z

**Zone**  
Fyzicky oddelené lokality v rámci regiónu Azure, ktoré poskytujú redundanciu a vysokú dostupnosť.

---

## Bežné skratky

| Skratka | Plný názov | Popis |
|---------|-----------|-------|
| AAD | Azure Active Directory | Služba správy identít a prístupu |
| ACR | Azure Container Registry | Služba registrácie obrazov kontajnerov |
| AKS | Azure Kubernetes Service | Spravovaná služba Kubernetes |
| API | Application Programming Interface | Sada protokolov na tvorbu softvéru |
| ARM | Azure Resource Manager | Služba nasadzovania a správy Azure |
| CDN | Content Delivery Network | Distribuovaná sieť serverov |
| CI/CD | Continuous Integration/Continuous Deployment | Automatizované vývojové postupy |
| CLI | Command Line Interface | Textové užívateľské rozhranie |
| DNS | Domain Name System | Systém na prekladanie doménových mien na IP adresy |
| HTTPS | Hypertext Transfer Protocol Secure | Bezpečná verzia HTTP |
| IaC | Infrastructure as Code | Správa infraštruktúry prostredníctvom kódu |
| JSON | JavaScript Object Notation | Formát výmeny dát |
| JWT | JSON Web Token | Formát tokenu na bezpečný prenos informácií |
| KQL | Kusto Query Language | Dotazovací jazyk pre dátové služby Azure |
| RBAC | Role-Based Access Control | Metóda kontroly prístupu založená na rolách |
| REST | Representational State Transfer | Architektonický štýl pre webové služby |
| SDK | Software Development Kit | Kolekcia vývojových nástrojov |
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

| Bežný názov | Oficiálny názov služby Azure | Typ hostiteľa azd |
|-------------|------------------------------|-------------------|
| Webová aplikácia | Azure App Service | `appservice` |
| API aplikácia | Azure App Service | `appservice` |
| Kontajnerová aplikácia | Azure Container Apps | `containerapp` |
| Funkcia | Azure Functions | `function` |
| Statická stránka | Azure Static Web Apps | `staticwebapp` |
| Databáza | Azure Database for PostgreSQL | `postgres` |
| NoSQL DB | Azure Cosmos DB | `cosmosdb` |
| Úložisko | Azure Storage Account | `storage` |
| Cache | Azure Cache for Redis | `redis` |
| Vyhľadávanie | Azure Cognitive Search | `search` |
| Správy | Azure Service Bus | `servicebus` |

---

## Termíny špecifické pre kontext

### Vývojové termíny
- **Hot Reload**: Automatická aktualizácia aplikácií počas vývoja bez reštartu
- **Build Pipeline**: Automatizovaný proces na zostavenie a testovanie kódu
- **Deployment Slot**: Staging prostredie v rámci App Service
- **Environment Parity**: Udržiavanie podobnosti medzi vývojovým, staging a produkčným prostredím

### Bezpečnostné termíny
- **Managed Identity**: Funkcia Azure poskytujúca automatickú správu poverení
- **Key Vault**: Bezpečné úložisko pre tajomstvá, kľúče a certifikáty
- **RBAC**: Kontrola prístupu založená na rolách pre zdroje Azure
- **Network Security Group**: Virtuálny firewall na kontrolu sieťovej prevádzky

### Monitorovacie termíny
- **Telemetry**: Automatizované zhromažďovanie meraní a dát
- **Application Performance Monitoring (APM)**: Monitorovanie výkonu softvéru
- **Log Analytics**: Služba na zhromažďovanie a analýzu logov
- **Alert Rules**: Automatizované upozornenia na základe metrík alebo podmienok

### Termíny nasadzovania
- **Blue-Green Deployment**: Stratégia nasadzovania bez prestojov
- **Canary Deployment**: Postupné nasadzovanie pre podmnožinu používateľov
- **Rolling Update**: Sekvenčná výmena inštancií aplikácie
- **Rollback**: Návrat k predchádzajúcej verzii aplikácie

---

**Tip na použitie**: Použite `Ctrl+F` na rýchle vyhľadanie konkrétnych termínov v tomto glosári. Termíny sú vzájomne prepojené, kde je to vhodné.

---

**Navigácia**
- **Predchádzajúca lekcia**: [Cheat Sheet](cheat-sheet.md)
- **Nasledujúca lekcia**: [FAQ](faq.md)

---

**Zrieknutie sa zodpovednosti**:  
Tento dokument bol preložený pomocou služby AI prekladu [Co-op Translator](https://github.com/Azure/co-op-translator). Aj keď sa snažíme o presnosť, prosím, berte na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho rodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nenesieme zodpovednosť za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.