# Slovník - terminológia Azure a AZD

**Referencie pre všetky kapitoly**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../README.md)
- **📖 Naučiť sa základy**: [Kapitola 1: Základy AZD](../docs/chapter-01-foundation/azd-basics.md)
- **🤖 Termíny AI**: [Kapitola 2: Vývoj orientovaný na AI](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)

## Úvod

Tento komplexný slovník poskytuje definície termínov, konceptov a akronymov používaných v Azure Developer CLI a vývoji v cloude Azure. Nevyhnutná referencia pre pochopenie technickej dokumentácie, riešenie problémov a efektívnu komunikáciu o projektoch azd a službách Azure.

## Ciele učenia sa

Používaním tohto slovníka budete:
- Rozumieť základnej terminológii a pojmom Azure Developer CLI
- Ovládať slovnú zásobu a technické termíny vývoja v cloud Azure
- Efektívne referencovať terminológiu infraštruktúry ako kódu a nasadzovania
- Pochopiť názvy služieb Azure, akronymy a ich účely
- Mať prístup k definíciám pre riešenie problémov a ladanie terminológie
- Naučiť sa pokročilé koncepty architektúry a vývoja Azure

## Výsledky učenia

Pri pravidelnom odkazovaní na tento slovník budete schopní:
- Efektívne komunikovať s použitím správnej terminológie Azure Developer CLI
- Jasnejšie rozumieť technickej dokumentácii a chybovým hláseniam
- Sebavedome prezerať služby a koncepty Azure
- Riešiť problémy použitím vhodnej technickej slovnej zásoby
- Prispievať do tímových diskusií presným technickým jazykom
- Systematicky rozširovať svoje znalosti vývoja v cloud Azure

## A

**ARM Template**  
Šablóna Azure Resource Manager. Formát Infrastructure as Code založený na JSON na deklaratívne definovanie a nasadzovanie zdrojov Azure.

**App Service**  
Platforma ako služba (PaaS) Azure na hosťovanie webových aplikácií, REST API a mobilných backendov bez správy infraštruktúry.

**Application Insights**  
Služba monitorovania výkonu aplikácií (APM) Azure poskytujúca hlboké poznatky o výkone, dostupnosti a používaní aplikácií.

**Azure CLI**  
Príkazové rozhranie na správu zdrojov Azure. Dopĺňa AZD, ale má samostatné prihlásenie; základná autentifikácia AZD používa `azd auth login`.

**Azure Developer CLI (azd)**  
Príkazový nástroj zameraný na vývojárov, ktorý urýchľuje tvorbu a nasadzovanie aplikácií do Azure použitím šablón a Infrastructure as Code.

**azure.yaml**  
Hlavný konfiguračný súbor projektu azd, ktorý definuje služby, infraštruktúru a deployment háky.

**Azure Resource Manager (ARM)**  
Služba na nasadzovanie a správu Azure, ktorá poskytuje riadiacu vrstvu pre vytváranie, aktualizáciu a odstraňovanie zdrojov.

## B

**Bicep**  
Doménovo špecifický jazyk (DSL) vyvinutý Microsoftom pre nasadzovanie zdrojov Azure. Poskytuje jednoduchšiu syntax než ARM šablóny a kompiluje sa do ARM.

**Build**  
Proces kompilácie zdrojového kódu, inštalácie závislostí a prípravy aplikácií na nasadenie.

**Blue-Green Deployment**  
Strategia nasadzovania využívajúca dva identické produkčné prostredia (modré a zelené) na minimalizáciu prestojov a rizika.

## C

**Container Apps**  
Serverless kontajnerová služba Azure umožňujúca spúšťanie kontajnerizovaných aplikácií bez správy zložitej infraštruktúry.

**CI/CD**  
Kontinuálna integrácia/kontinuálne nasadenie. Automatizované praktiky spájania zmien v kóde a nasadzovania aplikácií.

**Cosmos DB**  
Globálne distribuovaná viacmodelová databázová služba Azure s komplexnými SLA pre priepustnosť, latenciu, dostupnosť a konzistentnosť.

**Konfigurácia**  
Nastavenia a parametre, ktoré riadia správanie aplikácií a možnosti nasadenia.

## D

**Deployment**  
Proces inštalácie a konfigurácie aplikácií a ich závislostí na cieľovej infraštruktúre.

**Docker**  
Platforma na vývoj, distribúciu a spúšťanie aplikácií pomocou technológie kontajnerizácie.

**Dockerfile**  
Textový súbor obsahujúci inštrukcie na vytváranie Docker kontajnerových obrazov.

## E

**Prostredie**  
Cieľ nasadenia predstavujúci konkrétnu inštanciu vašej aplikácie (napr. vývoj, staging, produkcia).

**Premenné prostredia**  
Konfiguračné hodnoty uložené ako páry kľúč-hodnota, ku ktorým má aplikácia prístup počas behu.

**Endpoint**  
URL alebo sieťová adresa, kde je možné pristupovať k aplikácii alebo službe.

## F

**Function App**  
Serverless výpočtová služba Azure umožňujúca spúšťanie event-driven kódu bez správy infraštruktúry.

## G

**GitHub Actions**  
CI/CD platforma integrovaná s GitHub repozitármi na automatizáciu workflow.

**Git**  
Distribuovaný systém správy verzií používaný na sledovanie zmien v zdrojovom kóde.

## H

**Hooks**  
Vlastné skripty alebo príkazy, ktoré sa spúšťajú v určitých bodoch životného cyklu nasadenia (preprovision, postprovision, predeploy, postdeploy).

**Hostiteľ**  
Typ služby Azure, kam bude aplikácia nasadená (napr. appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Praktika definovania a správy infraštruktúry pomocou kódu namiesto manuálnych procesov.

**Init**  
Proces inicializácie nového projektu azd, obvykle z šablóny.

## J

**JSON**  
JavaScript Object Notation. Formát výmeny dát bežne používaný pre konfiguračné súbory a odpovede API.

**JWT**  
JSON Web Token. Štandard na bezpečný prenos informácií medzi stranami vo formáte JSON objektu.

## K

**Key Vault**  
Služba Azure na bezpečné ukladanie a správu tajomstiev, kľúčov a certifikátov.

**Kusto Query Language (KQL)**  
Dotazovací jazyk používaný na analýzu dát v Azure Monitor, Application Insights a ďalších službách Azure.

## L

**Load Balancer**  
Služba rozdeľujúca prichádzajúcu sieťovú prevádzku medzi viaceré servery alebo inštancie.

**Log Analytics**  
Služba Azure na zbieranie, analýzu a reakciu na telemetrické dáta z cloudového a on-premises prostredia.

## M

**Managed Identity**  
Funkcia Azure poskytujúca Azure službám automaticky spravovanú identitu na autentifikáciu k iným službám Azure.

**Mikroslužby**  
Architektonický prístup, kde sú aplikácie vybudované ako zbierka malých, nezávislých služieb.

**Monitor**  
Jednotné monitorovacie riešenie Azure poskytujúce full-stack pozorovateľnosť naprieč aplikáciami a infraštruktúrou.

## N

**Node.js**  
JavaScript runtime postavený na Chrome V8 JavaScript engine na tvorbu serverových aplikácií.

**npm**  
Správca balíkov pre Node.js, ktorý spravuje závislosti a balíky.

## O

**Výstup**  
Hodnoty vrátené z nasadenia infraštruktúry, ktoré môžu používať aplikácie alebo iné zdroje.

## P

**Balík**  
Proces prípravy aplikačného kódu a závislostí na nasadenie.

**Parametre**  
Vstupné hodnoty odovzdávané infraštruktúrnym šablónam na prispôsobenie nasadenia.

**PostgreSQL**  
Open-source relačný databázový systém podporovaný ako spravovaná služba v Azure.

**Provisioning**  
Proces vytvárania a konfigurácie Azure zdrojov definovaných v infraštruktúrnych šablónach.

## Q

**Kvóta**  
Limity na množstvo zdrojov, ktoré môžu byť vytvorené v predplatnom alebo regióne Azure.

## R

**Resource Group**  
Logický kontajner Azure zdrojov, ktoré zdieľajú rovnaký životný cyklus, oprávnenia a pravidlá.

**Resource Token**  
Jedinečný reťazec generovaný azd na zabezpečenie unikátnosti mien zdrojov v nasadeniach.

**REST API**  
Architektonický štýl na navrhovanie sieťových aplikácií využívajúci HTTP metódy.

**Rollback**  
Proces návratu k predchádzajúcej verzii aplikácie alebo konfigurácie infraštruktúry.

## S

**Služba**  
Komponent vašej aplikácie definovaný v azure.yaml (napr. webové frontend, API backend, databáza).

**SKU**  
Stock Keeping Unit. Predstavuje rôzne úrovne služieb alebo výkonu pre Azure zdroje.

**SQL Database**  
Spravovaná relačná databázová služba Azure založená na Microsoft SQL Server.

**Static Web Apps**  
Azure služba na tvorbu a nasadzovanie full-stack webových aplikácií zo zdrojových repozitárov.

**Storage Account**  
Služba Azure poskytujúca cloudové úložisko pre dátové objekty vrátane blobov, súborov, front a tabuliek.

**Predplatné**  
Kontajner Azure účtu, ktorý obsahuje resource groupy a zdroje, vrátane fakturácie a správy prístupu.

## T

**Šablóna**  
Predpripravená projektová štruktúra obsahujúca aplikačný kód, definície infraštruktúry a konfigurácie pre bežné scenáre.

**Terraform**  
Open-source nástroj Infrastructure as Code podporujúci viacerých poskytovateľov cloudu vrátane Azure.

**Traffic Manager**  
DNS založený určovač záťaže Azure na distribúciu prevádzky naprieč globálnymi Azure regiónmi.

## U

**URI**  
Uniform Resource Identifier. Reťazec, ktorý identifikuje konkrétny zdroj.

**URL**  
Uniform Resource Locator. Typ URI, ktorý určuje, kde sa zdroj nachádza a ako ho získať.

## V

**Virtuálna sieť (VNet)**  
Základný stavebný prvok pre súkromné siete v Azure, poskytujúci izoláciu a segmentáciu.

**VS Code**  
Visual Studio Code. Populárny editor kódu s výbornou integráciou Azure a azd.

## W

**Webhook**  
HTTP callback spustený v reakcii na špecifické udalosti, bežne používaný v CI/CD pipeline.

**What-if**  
Funkcia Azure, ktorá zobrazuje, aké zmeny by nasadenie vykonalo bez jeho skutočného spustenia.

## Y

**YAML**  
YAML Ain't Markup Language. Ľudsky čitateľný štandard serializácie dát používaný pre konfiguračné súbory ako azure.yaml.

## Z

**Zóna**  
Fyzicky oddelené lokality v rámci Azure regiónu poskytujúce redundanciu a vysokú dostupnosť.

---

## Bežné akronymy

| Akronym | Plný názov | Popis |
|---------|-----------|-------------|
| AAD | Azure Active Directory (teraz Microsoft Entra ID) | Služba identifikácie a správy prístupu |
| ACR | Azure Container Registry | Služba registrácie kontajnerových obrazov |
| AKS | Azure Kubernetes Service | Spravovaná Kubernetes služba |
| API | Application Programming Interface | Sada protokolov pre tvorbu softvéru |
| ARM | Azure Resource Manager | Služba nasadzovania a správy Azure |
| CDN | Content Delivery Network | Distribuovaná sieť serverov |
| CI/CD | Continuous Integration/Continuous Deployment | Automatizované vývojové praktiky |
| CLI | Command Line Interface | Textové užívateľské rozhranie |
| DNS | Domain Name System | Systém na preklad doménových mien na IP adresy |
| HTTPS | Hypertext Transfer Protocol Secure | Bezpečná verzia HTTP |
| IaC | Infrastructure as Code | Správa infraštruktúry prostredníctvom kódu |
| JSON | JavaScript Object Notation | Formát výmeny dát |
| JWT | JSON Web Token | Formát tokenu na bezpečný prenos informácií |
| KQL | Kusto Query Language | Dotazovací jazyk pre Azure dátové služby |
| RBAC | Role-Based Access Control | Metóda kontroly prístupu založená na rolách |
| REST | Representational State Transfer | Architektonický štýl pre webové služby |
| SDK | Software Development Kit | Kolekcia nástrojov na vývoj softvéru |
| SLA | Service Level Agreement | Záväzok k dostupnosti/výkonu služby |
| SQL | Structured Query Language | Jazyk na správu relačných databáz |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Kryptografické protokoly |
| URI | Uniform Resource Identifier | Reťazec identifikujúci zdroj |
| URL | Uniform Resource Locator | Typ URI špecifikujúci polohu zdroja |
| VM | Virtual Machine | Emulácia počítačového systému |
| VNet | Virtual Network | Súkromná sieť v Azure |
| YAML | YAML Ain't Markup Language | Štandard serializácie dát |

---

## Mapovanie názvov služieb Azure

| Bežný názov | Oficiálny názov služby Azure | Hostiteľský typ azd |
|-------------|------------------------------|---------------|
| Webová aplikácia | Azure App Service | `appservice` |
| API aplikácia | Azure App Service | `appservice` |
| Kontajnerová aplikácia | Azure Container Apps | `containerapp` |
| Funkcia | Azure Functions | `function` |
| Statická stránka | Azure Static Web Apps | `staticwebapp` |
| Databáza | Azure Database for PostgreSQL | Infraštruktúrny zdroj, nie aplikácia `host` |
| NoSQL DB | Azure Cosmos DB | Infraštruktúrny zdroj, nie aplikácia `host` |
| Úložisko | Azure Storage Account | Infraštruktúrny zdroj, nie vstavaná aplikácia `host` |
| Keš | Azure Managed Redis | Infraštruktúrny zdroj, nie aplikácia `host` |
| Vyhľadávanie | Azure AI Search | Infraštruktúrny zdroj, nie aplikácia `host` |
| Messaging | Azure Service Bus | Infraštruktúrny zdroj, nie aplikácia `host` |

`services.<name>.host` vyberá cieľ nasadenia aplikácie; nie je to skratka pre žiadny typ zdroja Azure. Databázy, keše, vyhľadávacie služby a fronty sa zvyčajne provisionujú cez poskytovateľa infraštruktúry a pripájajú k aplikácii cez výstupy/konfiguráciu.

---

## Konkrétne termíny pre kontext

### Vývojové termíny
- **Hot Reload**: Automatická aktualizácia aplikácií počas vývoja bez reštartu
- **Build Pipeline**: Automatizovaný proces skladania a testovania kódu
- **Deployment Slot**: Staging prostredie v rámci App Service
- **Environment Parity**: Udržiavanie rovnakosti vývojového, staging a produkčného prostredia

### Bezpečnostné termíny
- **Managed Identity**: Funkcia Azure poskytujúca automatickú správu poverení
- **Key Vault**: Bezpečné úložisko tajomstiev, kľúčov a certifikátov
- **RBAC**: Riadenie prístupu založené na rolách pre Azure zdroje
- **Network Security Group**: Virtuálny firewall na riadenie sieťovej prevádzky

### Monitorovacie termíny
- **Telemetry**: Automatizovaný zber meraní a dát
- **Application Performance Monitoring (APM)**: Monitorovanie výkonu softvéru
- **Log Analytics**: Služba na zber a analýzu údajov denníkov
- **Alert Rules**: Automatizované upozornenia na základe metrík alebo podmienok

### Termíny nasadenia
- **Blue-Green Deployment**: Strategia nasadenia bez odstávky
- **Canary Deployment**: Postupné nasadzovanie podskupine používateľov
- **Rolling Update**: Sekvenčná výmena inštancií aplikácie
- **Rollback**: Návrat k predchádzajúcej verzii aplikácie

---

**Tip na používanie**: Použite `Ctrl+F` na rýchle vyhľadávanie konkrétnych termínov v tomto slovníku. Termíny sú prepojené tam, kde je to vhodné.

---

**Navigácia**
- **Predchádzajúca lekcia**: [Cheat Sheet](cheat-sheet.md)
- **Ďalšia lekcia**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->