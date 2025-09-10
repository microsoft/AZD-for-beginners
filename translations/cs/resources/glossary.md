<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "59cb1c1635512e212da16d50f3259ca4",
  "translation_date": "2025-09-10T07:47:36+00:00",
  "source_file": "resources/glossary.md",
  "language_code": "cs"
}
-->
# Slovník - Terminologie Azure Developer CLI

## Úvod

Tento obsáhlý slovník poskytuje definice termínů, konceptů a zkratek používaných v Azure Developer CLI a vývoji v Azure cloudu. Nezbytný referenční materiál pro pochopení technické dokumentace, řešení problémů a efektivní komunikaci o projektech azd a službách Azure.

## Cíle učení

Používáním tohoto slovníku:
- Porozumíte základní terminologii a konceptům Azure Developer CLI
- Ovládnete slovní zásobu a technické termíny pro vývoj v Azure cloudu
- Efektivně budete odkazovat na terminologii Infrastructure as Code a nasazování
- Pochopíte názvy služeb Azure, zkratky a jejich účely
- Získáte definice pro terminologii řešení problémů a ladění
- Naučíte se pokročilé koncepty architektury a vývoje v Azure

## Výsledky učení

Pravidelným odkazováním na tento slovník budete schopni:
- Efektivně komunikovat s použitím správné terminologie Azure Developer CLI
- Jasněji rozumět technické dokumentaci a chybovým zprávám
- S jistotou se orientovat v službách a konceptech Azure
- Řešit problémy s použitím vhodné technické slovní zásoby
- Přispívat do týmových diskusí s přesným technickým jazykem
- Systematicky rozšiřovat své znalosti o vývoji v Azure cloudu

## A

**ARM Template**  
Šablona Azure Resource Manager. Formát Infrastructure as Code založený na JSONu, používaný k deklarativnímu definování a nasazování zdrojů Azure.

**App Service**  
Platforma jako služba (PaaS) od Azure pro hostování webových aplikací, REST API a mobilních backendů bez správy infrastruktury.

**Application Insights**  
Služba monitorování výkonu aplikací (APM) od Azure, která poskytuje hluboké přehledy o výkonu, dostupnosti a využití aplikací.

**Azure CLI**  
Příkazový řádek pro správu zdrojů Azure. Používá se v azd pro autentizaci a některé operace.

**Azure Developer CLI (azd)**  
Příkazový nástroj zaměřený na vývojáře, který urychluje proces vytváření a nasazování aplikací do Azure pomocí šablon a Infrastructure as Code.

**azure.yaml**  
Hlavní konfigurační soubor projektu azd, který definuje služby, infrastrukturu a nasazovací kroky.

**Azure Resource Manager (ARM)**  
Služba nasazování a správy Azure, která poskytuje vrstvu pro správu při vytváření, aktualizaci a mazání zdrojů.

## B

**Bicep**  
Doménově specifický jazyk (DSL) vyvinutý společností Microsoft pro nasazování zdrojů Azure. Nabízí jednodušší syntaxi než ARM šablony a kompiluje se do ARM.

**Build**  
Proces kompilace zdrojového kódu, instalace závislostí a přípravy aplikací na nasazení.

**Blue-Green Deployment**  
Strategie nasazování, která využívá dvě identická produkční prostředí (modré a zelené) k minimalizaci výpadků a rizik.

## C

**Container Apps**  
Serverless služba Azure pro kontejnery, která umožňuje provoz kontejnerizovaných aplikací bez správy složité infrastruktury.

**CI/CD**  
Continuous Integration/Continuous Deployment. Automatizované postupy pro integraci změn kódu a nasazování aplikací.

**Cosmos DB**  
Globálně distribuovaná, multi-modelová databázová služba Azure, která poskytuje komplexní SLA pro propustnost, latenci, dostupnost a konzistenci.

**Configuration**  
Nastavení a parametry, které ovládají chování aplikace a možnosti nasazení.

## D

**Deployment**  
Proces instalace a konfigurace aplikací a jejich závislostí na cílové infrastruktuře.

**Docker**  
Platforma pro vývoj, distribuci a provoz aplikací pomocí technologie kontejnerizace.

**Dockerfile**  
Textový soubor obsahující instrukce pro vytvoření obrazu Docker kontejneru.

## E

**Environment**  
Cílové nasazení, které představuje konkrétní instanci vaší aplikace (např. vývoj, staging, produkce).

**Environment Variables**  
Konfigurační hodnoty uložené jako páry klíč-hodnota, které aplikace mohou přistupovat za běhu.

**Endpoint**  
URL nebo síťová adresa, kde lze přistupovat k aplikaci nebo službě.

## F

**Function App**  
Serverless výpočetní služba Azure, která umožňuje provoz událostmi řízeného kódu bez správy infrastruktury.

## G

**GitHub Actions**  
Platforma CI/CD integrovaná s repozitáři GitHub pro automatizaci pracovních postupů.

**Git**  
Distribuovaný systém pro správu verzí používaný ke sledování změn ve zdrojovém kódu.

## H

**Hooks**  
Vlastní skripty nebo příkazy, které se spouštějí v konkrétních bodech během životního cyklu nasazení (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Typ služby Azure, kde bude aplikace nasazena (např. appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Praxe definování a správy infrastruktury prostřednictvím kódu namísto manuálních procesů.

**Init**  
Proces inicializace nového projektu azd, obvykle ze šablony.

## J

**JSON**  
JavaScript Object Notation. Formát pro výměnu dat běžně používaný pro konfigurační soubory a odpovědi API.

**JWT**  
JSON Web Token. Standard pro bezpečný přenos informací mezi stranami jako JSON objekt.

## K

**Key Vault**  
Služba Azure pro bezpečné ukládání a správu tajemství, klíčů a certifikátů.

**Kusto Query Language (KQL)**  
Dotazovací jazyk používaný pro analýzu dat v Azure Monitor, Application Insights a dalších službách Azure.

## L

**Load Balancer**  
Služba, která rozděluje příchozí síťový provoz mezi více serverů nebo instancí.

**Log Analytics**  
Služba Azure pro sběr, analýzu a reakci na telemetrická data z cloudových a on-premises prostředí.

## M

**Managed Identity**  
Funkce Azure, která poskytuje službám Azure automaticky spravovanou identitu pro autentizaci k jiným službám Azure.

**Microservices**  
Architektonický přístup, kde jsou aplikace postaveny jako kolekce malých, nezávislých služeb.

**Monitor**  
Jednotné řešení monitorování Azure, které poskytuje kompletní přehled o aplikacích a infrastruktuře.

## N

**Node.js**  
JavaScript runtime postavený na JavaScriptovém enginu V8 od Chrome pro vytváření serverových aplikací.

**npm**  
Správce balíčků pro Node.js, který spravuje závislosti a balíčky.

## O

**Output**  
Hodnoty vrácené z nasazení infrastruktury, které mohou být použity aplikacemi nebo jinými zdroji.

## P

**Package**  
Proces přípravy kódu aplikace a závislostí na nasazení.

**Parameters**  
Vstupní hodnoty předávané šablonám infrastruktury pro přizpůsobení nasazení.

**PostgreSQL**  
Open-source relační databázový systém podporovaný jako spravovaná služba v Azure.

**Provisioning**  
Proces vytváření a konfigurace zdrojů Azure definovaných v šablonách infrastruktury.

## Q

**Quota**  
Limity na množství zdrojů, které lze vytvořit v předplatném nebo regionu Azure.

## R

**Resource Group**  
Logický kontejner pro zdroje Azure, které sdílejí stejný životní cyklus, oprávnění a politiky.

**Resource Token**  
Unikátní řetězec generovaný azd pro zajištění jedinečnosti názvů zdrojů napříč nasazeními.

**REST API**  
Architektonický styl pro návrh síťových aplikací pomocí HTTP metod.

**Rollback**  
Proces návratu k předchozí verzi aplikace nebo konfigurace infrastruktury.

## S

**Service**  
Komponenta vaší aplikace definovaná v azure.yaml (např. webový frontend, API backend, databáze).

**SKU**  
Stock Keeping Unit. Reprezentuje různé úrovně služeb nebo výkonu pro zdroje Azure.

**SQL Database**  
Spravovaná relační databázová služba Azure založená na Microsoft SQL Serveru.

**Static Web Apps**  
Služba Azure pro vytváření a nasazování full-stack webových aplikací ze zdrojových repozitářů.

**Storage Account**  
Služba Azure, která poskytuje cloudové úložiště pro datové objekty včetně blobů, souborů, front a tabulek.

**Subscription**  
Kontejner účtu Azure, který obsahuje skupiny zdrojů a zdroje, s přidruženým účtováním a správou přístupu.

## T

**Template**  
Předem připravená struktura projektu obsahující kód aplikace, definice infrastruktury a konfiguraci pro běžné scénáře.

**Terraform**  
Open-source nástroj Infrastructure as Code, který podporuje více poskytovatelů cloudu včetně Azure.

**Traffic Manager**  
DNS-based load balancer Azure pro distribuci provozu mezi globálními regiony Azure.

## U

**URI**  
Uniform Resource Identifier. Řetězec, který identifikuje konkrétní zdroj.

**URL**  
Uniform Resource Locator. Typ URI, který specifikuje, kde se zdroj nachází a jak jej získat.

## V

**Virtual Network (VNet)**  
Základní stavební blok pro privátní sítě v Azure, poskytující izolaci a segmentaci.

**VS Code**  
Visual Studio Code. Populární editor kódu s vynikající integrací Azure a azd.

## W

**Webhook**  
HTTP zpětné volání spuštěné specifickými událostmi, běžně používané v CI/CD pipelinech.

**What-if**  
Funkce Azure, která ukazuje, jaké změny by byly provedeny nasazením, aniž by se skutečně provedly.

## Y

**YAML**  
YAML Ain't Markup Language. Standard pro serializaci dat, který je čitelný pro člověka, používaný pro konfigurační soubory jako azure.yaml.

## Z

**Zone**  
Fyzicky oddělené lokace v rámci regionu Azure, které poskytují redundanci a vysokou dostupnost.

---

## Běžné zkratky

| Zkratka | Plný název | Popis |
|---------|------------|-------|
| AAD | Azure Active Directory | Služba správy identit a přístupu |
| ACR | Azure Container Registry | Služba registru obrazů kontejnerů |
| AKS | Azure Kubernetes Service | Spravovaná služba Kubernetes |
| API | Application Programming Interface | Sada protokolů pro tvorbu softwaru |
| ARM | Azure Resource Manager | Služba nasazování a správy Azure |
| CDN | Content Delivery Network | Distribuovaná síť serverů |
| CI/CD | Continuous Integration/Continuous Deployment | Automatizované vývojové postupy |
| CLI | Command Line Interface | Textové uživatelské rozhraní |
| DNS | Domain Name System | Systém pro překlad doménových jmen na IP adresy |
| HTTPS | Hypertext Transfer Protocol Secure | Zabezpečená verze HTTP |
| IaC | Infrastructure as Code | Správa infrastruktury prostřednictvím kódu |
| JSON | JavaScript Object Notation | Formát pro výměnu dat |
| JWT | JSON Web Token | Formát tokenu pro bezpečný přenos informací |
| KQL | Kusto Query Language | Dotazovací jazyk pro datové služby Azure |
| RBAC | Role-Based Access Control | Metoda řízení přístupu založená na rolích uživatelů |
| REST | Representational State Transfer | Architektonický styl pro webové služby |
| SDK | Software Development Kit | Kolekce nástrojů pro vývoj |
| SLA | Service Level Agreement | Závazek k dostupnosti/výkonu služby |
| SQL | Structured Query Language | Jazyk pro správu relačních databází |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Kryptografické protokoly |
| URI | Uniform Resource Identifier | Řetězec identifikující zdroj |
| URL | Uniform Resource Locator | Typ URI specifikující umístění zdroje |
| VM | Virtual Machine | Emulace počítačového systému |
| VNet | Virtual Network | Privátní síť v Azure |
| YAML | YAML Ain't Markup Language | Standard pro serializaci dat |

---

## Mapování názvů služeb Azure

| Běžný název | Oficiální název služby Azure | Typ hostitele azd |
|-------------|------------------------------|-------------------|
| Webová aplikace | Azure App Service | `appservice` |
| API aplikace | Azure App Service | `appservice` |
| Kontejnerová aplikace | Azure Container Apps | `containerapp` |
| Funkce | Azure Functions | `function` |
| Statická stránka | Azure Static Web Apps | `staticwebapp` |
| Databáze | Azure Database for PostgreSQL | `postgres` |
| NoSQL DB | Azure Cosmos DB | `cosmosdb` |
| Úložiště | Azure Storage Account | `storage` |
| Cache | Azure Cache for Redis | `redis` |
| Vyhledávání | Azure Cognitive Search | `search` |
| Zprávy | Azure Service Bus | `servicebus` |

---

## Termíny specifické pro kontext

### Vývojové termíny
- **Hot Reload**: Automatická aktualizace aplikací během vývoje bez restartu
- **Build Pipeline**: Automatizovaný proces pro sestavení a testování kódu
- **Deployment Slot**: Stagingové prostředí v rámci App Service
- **Environment Parity**: Udržování podobnosti mezi vývojovým, stagingovým a produkčním prostředím

### Bezpečnostní termíny
- **Managed Identity**: Funkce Azure poskytující automatickou správu přihlašovacích údajů
- **Key Vault**: Bezpečné úložiště pro tajemství, klíče a certifikáty
- **RBAC**: Role-based access control pro zdroje Azure
- **Network Security Group**: Virtuální firewall pro řízení síťového provozu

### Monitorovací termíny
- **Telemetry**: Automatizovaný sběr měření a dat
- **Application Performance Monitoring (APM)**: Monitorování výkonu softwaru
- **Log Analytics**: Služba pro sběr a analýzu logů
- **Alert Rules**: Automatizovaná upozornění na základě metrik nebo podmínek

### Termíny nasazení
- **Blue-Green Deployment**: Strategie nasazení bez výpadků
- **Canary Deployment**: Postupné nasazení na podmnožinu uživatelů
- **Rolling Update**: Sekvenční nahrazování instancí aplikace
- **Rollback**: Návrat k předchozí verzi aplikace

---

**Tip pro použití**: Použijte `Ctrl+F` pro rychlé vyhledání konkrétních termínů v tomto slovníku. Termíny jsou vzájemně propojeny, kde je to relevantní.

---

**Navigace**
- **Předchozí lekce**: [Cheat Sheet](cheat-sheet.md)
- **Další lekce**: [FAQ](faq.md)

---

**Prohlášení**:  
Tento dokument byl přeložen pomocí služby pro automatický překlad [Co-op Translator](https://github.com/Azure/co-op-translator). I když se snažíme o co největší přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Za autoritativní zdroj by měl být považován původní dokument v jeho původním jazyce. Pro důležité informace doporučujeme profesionální lidský překlad. Neodpovídáme za žádná nedorozumění nebo nesprávné výklady vyplývající z použití tohoto překladu.