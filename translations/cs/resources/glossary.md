<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "f16d2988a24670d1b6aa2372de1a231a",
  "translation_date": "2025-09-18T09:53:06+00:00",
  "source_file": "resources/glossary.md",
  "language_code": "cs"
}
-->
# Slovníček - Terminologie Azure a AZD

**Odkaz pro všechny kapitoly**
- **📚 Domovská stránka kurzu**: [AZD pro začátečníky](../README.md)
- **📖 Naučte se základy**: [Kapitola 1: Základy AZD](../docs/getting-started/azd-basics.md)
- **🤖 AI Termíny**: [Kapitola 2: Vývoj orientovaný na AI](../docs/ai-foundry/azure-ai-foundry-integration.md)

## Úvod

Tento komplexní slovníček poskytuje definice termínů, konceptů a zkratek používaných v Azure Developer CLI a vývoji v Azure cloudu. Je nezbytným referenčním nástrojem pro pochopení technické dokumentace, řešení problémů a efektivní komunikaci o projektech azd a službách Azure.

## Cíle učení

Používáním tohoto slovníku:
- Pochopíte základní terminologii a koncepty Azure Developer CLI
- Ovládnete slovník a technické termíny pro vývoj v Azure cloudu
- Efektivně budete odkazovat na terminologii infrastruktury jako kódu a nasazení
- Porozumíte názvům služeb Azure, zkratkám a jejich účelům
- Získáte definice pro terminologii řešení problémů a ladění
- Naučíte se pokročilé koncepty architektury a vývoje v Azure

## Výsledky učení

Pravidelným odkazováním na tento slovník budete schopni:
- Efektivně komunikovat pomocí správné terminologie Azure Developer CLI
- Jasněji chápat technickou dokumentaci a chybové zprávy
- S jistotou se orientovat ve službách a konceptech Azure
- Řešit problémy pomocí vhodné technické terminologie
- Přispívat do týmových diskusí s přesným technickým jazykem
- Systematicky rozšiřovat své znalosti o vývoji v Azure cloudu

## A

**ARM Template**  
Šablona Azure Resource Manager. Formát infrastruktury jako kódu založený na JSON, používaný k deklarativnímu definování a nasazení zdrojů Azure.

**App Service**  
Platforma jako služba (PaaS) od Azure pro hostování webových aplikací, REST API a mobilních backendů bez správy infrastruktury.

**Application Insights**  
Služba pro monitorování výkonu aplikací (APM) od Azure, která poskytuje hluboké přehledy o výkonu, dostupnosti a využití aplikací.

**Azure CLI**  
Příkazový řádek pro správu zdrojů Azure. Používá se azd pro autentizaci a některé operace.

**Azure Developer CLI (azd)**  
Příkazový nástroj zaměřený na vývojáře, který urychluje proces vytváření a nasazování aplikací do Azure pomocí šablon a infrastruktury jako kódu.

**azure.yaml**  
Hlavní konfigurační soubor projektu azd, který definuje služby, infrastrukturu a nasazovací kroky.

**Azure Resource Manager (ARM)**  
Služba pro nasazení a správu Azure, která poskytuje vrstvu pro správu vytváření, aktualizace a mazání zdrojů.

## B

**Bicep**  
Doménově specifický jazyk (DSL) vyvinutý společností Microsoft pro nasazování zdrojů Azure. Nabízí jednodušší syntaxi než ARM šablony a kompiluje se do ARM.

**Build**  
Proces kompilace zdrojového kódu, instalace závislostí a přípravy aplikací na nasazení.

**Blue-Green Deployment**  
Strategie nasazení, která využívá dvě identická produkční prostředí (modré a zelené) k minimalizaci výpadků a rizik.

## C

**Container Apps**  
Serverless kontejnerová služba Azure, která umožňuje provozování kontejnerizovaných aplikací bez správy složité infrastruktury.

**CI/CD**  
Průběžná integrace/průběžné nasazení. Automatizované postupy pro integraci změn kódu a nasazování aplikací.

**Cosmos DB**  
Globálně distribuovaná, multi-modelová databázová služba Azure, která poskytuje komplexní SLA pro propustnost, latenci, dostupnost a konzistenci.

**Configuration**  
Nastavení a parametry, které řídí chování aplikace a možnosti nasazení.

## D

**Deployment**  
Proces instalace a konfigurace aplikací a jejich závislostí na cílové infrastruktuře.

**Docker**  
Platforma pro vývoj, distribuci a provozování aplikací pomocí technologie kontejnerizace.

**Dockerfile**  
Textový soubor obsahující instrukce pro vytvoření obrazu kontejneru Docker.

## E

**Environment**  
Cílové nasazení, které představuje konkrétní instanci vaší aplikace (např. vývoj, staging, produkce).

**Environment Variables**  
Konfigurační hodnoty uložené jako páry klíč-hodnota, ke kterým mohou aplikace přistupovat za běhu.

**Endpoint**  
URL nebo síťová adresa, kde lze přistupovat k aplikaci nebo službě.

## F

**Function App**  
Serverless výpočetní služba Azure, která umožňuje provozování kódu řízeného událostmi bez správy infrastruktury.

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
JSON Web Token. Standard pro bezpečný přenos informací mezi stranami ve formě JSON objektu.

## K

**Key Vault**  
Služba Azure pro bezpečné ukládání a správu tajemství, klíčů a certifikátů.

**Kusto Query Language (KQL)**  
Dotazovací jazyk používaný pro analýzu dat v Azure Monitor, Application Insights a dalších službách Azure.

## L

**Load Balancer**  
Služba, která rozděluje příchozí síťový provoz mezi více serverů nebo instancí.

**Log Analytics**  
Služba Azure pro sběr, analýzu a akce na základě telemetrických dat z cloudových a on-premises prostředí.

## M

**Managed Identity**  
Funkce Azure, která poskytuje službám Azure automaticky spravovanou identitu pro autentizaci k jiným službám Azure.

**Microservices**  
Architektonický přístup, kde jsou aplikace budovány jako kolekce malých, nezávislých služeb.

**Monitor**  
Sjednocené monitorovací řešení Azure, které poskytuje plnou observabilitu napříč aplikacemi a infrastrukturou.

## N

**Node.js**  
JavaScript runtime postavený na V8 JavaScript enginu od Chrome pro vytváření serverových aplikací.

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
Stock Keeping Unit. Reprezentuje různé úrovně služeb nebo výkonnostní úrovně zdrojů Azure.

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
Open-source nástroj pro infrastrukturu jako kód, který podporuje více cloudových poskytovatelů včetně Azure.

**Traffic Manager**  
DNS-based load balancer Azure pro distribuci provozu napříč globálními regiony Azure.

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
HTTP zpětné volání spouštěné specifickými událostmi, běžně používané v CI/CD pipelinech.

**What-if**  
Funkce Azure, která ukazuje, jaké změny by byly provedeny nasazením, aniž by se skutečně provedly.

## Y

**YAML**  
YAML Ain't Markup Language. Standard pro serializaci dat čitelný pro člověka, používaný pro konfigurační soubory jako azure.yaml.

## Z

**Zone**  
Fyzicky oddělené lokace v rámci regionu Azure, které poskytují redundanci a vysokou dostupnost.

---

## Běžné zkratky

| Zkratka | Plný název | Popis |
|---------|------------|-------|
| AAD | Azure Active Directory | Služba pro správu identity a přístupu |
| ACR | Azure Container Registry | Služba pro registraci kontejnerových obrazů |
| AKS | Azure Kubernetes Service | Spravovaná Kubernetes služba |
| API | Application Programming Interface | Sada protokolů pro tvorbu softwaru |
| ARM | Azure Resource Manager | Služba pro nasazení a správu Azure |
| CDN | Content Delivery Network | Distribuovaná síť serverů |
| CI/CD | Continuous Integration/Continuous Deployment | Automatizované vývojové postupy |
| CLI | Command Line Interface | Textové uživatelské rozhraní |
| DNS | Domain Name System | Systém pro překlad doménových jmen na IP adresy |
| HTTPS | Hypertext Transfer Protocol Secure | Zabezpečená verze HTTP |
| IaC | Infrastructure as Code | Správa infrastruktury prostřednictvím kódu |
| JSON | JavaScript Object Notation | Formát pro výměnu dat |
| JWT | JSON Web Token | Formát tokenu pro bezpečný přenos informací |
| KQL | Kusto Query Language | Dotazovací jazyk pro služby Azure |
| RBAC | Role-Based Access Control | Metoda řízení přístupu založená na rolích uživatelů |
| REST | Representational State Transfer | Architektonický styl pro webové služby |
| SDK | Software Development Kit | Kolekce vývojářských nástrojů |
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

| Běžný název | Oficiální název služby Azure | azd Host Type |
|-------------|------------------------------|---------------|
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
- **Deployment Slot**: Staging prostředí v rámci App Service
- **Environment Parity**: Udržování podobnosti mezi vývojovým, staging a produkčním prostředím

### Bezpečnostní termíny
- **Managed Identity**: Funkce Azure poskytující automatickou správu přihlašovacích údajů
- **Key Vault**: Bezpečné úložiště pro tajemství, klíče a certifikáty
- **RBAC**: Řízení přístupu založené na rolích pro zdroje Azure
- **Network Security Group**: Virtuální firewall pro řízení síťového provozu

### Monitorovací termíny
- **Telemetry**: Automatizovaný sběr měření a dat
- **Application Performance Monitoring (APM)**: Monitorování výkonu softwaru
- **Log Analytics**: Služba pro sběr a analýzu logů
- **Alert Rules**: Automatická upozornění na základě metrik nebo podmínek

### Termíny nasazení
- **Blue-Green Deployment**: Strategie nasazení bez výpadků
- **Canary Deployment**: Postupné zavádění pro podmnožinu uživatelů
- **Rolling Update**: Sekvenční nahrazování instancí aplikace
- **Rollback**: Návrat k předchozí verzi aplikace

---

**Tip pro použití**: Použijte `Ctrl+F` pro rychlé vyhledání konkrétních termínů v tomto slovníku. Termíny jsou vzájemně propojeny, kde je to relevantní.

---

**Navigace**
- **Předchozí lekce**: [Tahák](cheat-sheet.md)
- **Další lekce**: [FAQ](faq.md)

---

**Prohlášení**:  
Tento dokument byl přeložen pomocí služby pro automatický překlad [Co-op Translator](https://github.com/Azure/co-op-translator). I když se snažíme o přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho původním jazyce by měl být považován za autoritativní zdroj. Pro důležité informace se doporučuje profesionální lidský překlad. Neodpovídáme za žádná nedorozumění nebo nesprávné interpretace vyplývající z použití tohoto překladu.