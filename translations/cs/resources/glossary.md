# Slovník - Terminologie Azure a AZD

**Reference for All Chapters**
- **📚 Course Home**: [AZD For Beginners](../README.md)
- **📖 Learn Basics**: [Chapter 1: AZD Basics](../docs/getting-started/azd-basics.md)
- **🤖 AI Terms**: [Chapter 2: AI-First Development](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## Úvod

Tento obsáhlý slovník poskytuje definice termínů, konceptů a zkratek používaných v Azure Developer CLI a vývoji v cloudu Azure. Základní reference pro pochopení technické dokumentace, řešení problémů a efektivní komunikaci o projektech azd a službách Azure.

## Cíle učení

Používáním tohoto slovníku budete:
- Rozumět základní terminologii a konceptům Azure Developer CLI
- Ovládat slovní zásobu a technické pojmy související s vývojem v cloudu Azure
- Efektivně odkazovat na termíny Infrastructure as Code a nasazování
- Pochopit názvy služeb Azure, zkratky a jejich účely
- Získat definice pro terminologii používanou při odstraňování problémů a debugování
- Naučit se pokročilé koncepty architektury a vývoje v Azure

## Očekávané výsledky

Pravidelným odkazováním na tento slovník budete schopni:
- Komunikovat efektivně s použitím správné terminologie Azure Developer CLI
- Jasněji rozumět technické dokumentaci a chybovým hlášením
- Pohybovat se mezi službami a koncepty Azure s jistotou
- Řešit problémy s použitím vhodné technické slovní zásoby
- Přispívat do týmových diskusí přesným technickým jazykem
- Systematicky rozšiřovat své znalosti vývoje v Azure

## A

**ARM Template**  
Šablona Azure Resource Manager. Formát Infrastructure as Code založený na JSONu používaný k deklarativnímu definování a nasazování zdrojů Azure.

**App Service**  
Platforma jako služba (PaaS) Azure pro hostování webových aplikací, REST API a mobilních backendů bez nutnosti spravovat infrastrukturu.

**Application Insights**  
Služba pro monitorování výkonu aplikací (APM) v Azure, která poskytuje hluboké poznatky o výkonu, dostupnosti a využití aplikací.

**Azure CLI**  
Příkazové rozhraní pro správu zdrojů Azure. Používá se azd pro autentizaci a některé operace.

**Azure Developer CLI (azd)**  
Příkazový nástroj zaměřený na vývojáře, který urychluje proces vytváření a nasazování aplikací do Azure pomocí šablon a Infrastructure as Code.

**azure.yaml**  
Hlavní konfigurační soubor projektu azd, který definuje služby, infrastrukturu a nasazovací hooky.

**Azure Resource Manager (ARM)**  
Nasazovací a správcová služba Azure, která poskytuje vrstvu pro vytváření, aktualizaci a odstraňování zdrojů.

## B

**Bicep**  
Specifický jazyk (DSL) vyvinutý Microsoftem pro nasazování zdrojů Azure. Nabízí jednodušší syntaxi než ARM šablony a překládá se do ARM.

**Build**  
Proces kompilace zdrojového kódu, instalace závislostí a přípravy aplikací pro nasazení.

**Blue-Green Deployment**  
Strategie nasazování využívající dvě identické produkční prostředí (blue a green) ke snížení výpadků a rizika.

## C

**Container Apps**  
Serverless kontejnerová služba Azure, která umožňuje spouštět kontejnerizované aplikace bez správy složité infrastruktury.

**CI/CD**  
Continuous Integration/Continuous Deployment. Automatizované postupy pro integraci změn kódu a nasazování aplikací.

**Cosmos DB**  
Globálně distribuovaná multi-model databázová služba Azure, která poskytuje komplexní SLA pro propustnost, latenci, dostupnost a konzistenci.

**Configuration**  
Nastavení a parametry, které řídí chování aplikace a možnosti nasazení.

## D

**Deployment**  
Proces instalace a konfigurace aplikací a jejich závislostí na cílové infrastruktuře.

**Docker**  
Platforma pro vývoj, distribuci a provoz aplikací pomocí kontejnerizace.

**Dockerfile**  
Textový soubor obsahující instrukce pro vytvoření Docker image kontejneru.

## E

**Environment**  
Cíl nasazení, který reprezentuje konkrétní instanci vaší aplikace (např. vývoj, staging, produkce).

**Environment Variables**  
Konfigurační hodnoty uložené jako páry klíč-hodnota, ke kterým má aplikace přístup za běhu.

**Endpoint**  
URL nebo síťová adresa, na které je aplikace nebo služba dostupná.

## F

**Function App**  
Serverless výpočetní služba Azure, která umožňuje spouštět kód reagující na události bez správy infrastruktury.

## G

**GitHub Actions**  
Platforma CI/CD integrovaná s repozitáři GitHub pro automatizaci pracovních postupů.

**Git**  
Distribuovaný systém správy verzí používaný pro sledování změn v zdrojovém kódu.

## H

**Hooks**  
Vlastní skripty nebo příkazy, které běží v konkrétních bodech životního cyklu nasazení (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Typ Azure služby, na kterou bude aplikace nasazena (např. appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Praktika definování a správy infrastruktury pomocí kódu místo manuálních procesů.

**Init**  
Proces inicializace nového projektu azd, obvykle z šablony.

## J

**JSON**  
JavaScript Object Notation. Formát pro výměnu dat běžně používaný pro konfigurační soubory a odpovědi API.

**JWT**  
JSON Web Token. Standard pro bezpečné přenosy informací mezi stranami jako JSON objekt.

## K

**Key Vault**  
Služba Azure pro bezpečné ukládání a správu tajemství, klíčů a certifikátů.

**Kusto Query Language (KQL)**  
Dotazovací jazyk používaný pro analýzu dat v Azure Monitor, Application Insights a dalších službách Azure.

## L

**Load Balancer**  
Služba, která rozděluje příchozí síťový provoz napříč více servery nebo instancemi.

**Log Analytics**  
Služba Azure pro sběr, analýzu a reakci na telemetrická data z cloudových i on-premises prostředí.

## M

**Managed Identity**  
Funkce Azure, která poskytuje službám Azure automaticky spravovanou identitu pro autentizaci k jiným službám Azure.

**Microservices**  
Architektonický přístup, kde jsou aplikace budovány jako soubor malých, nezávislých služeb.

**Monitor**  
Unifikované monitorovací řešení Azure, které poskytuje full-stack observability napříč aplikacemi a infrastrukturou.

## N

**Node.js**  
JavaScript runtime postavený na jádru V8 od Chrome pro vývoj serverových aplikací.

**npm**  
Správce balíčků pro Node.js, který spravuje závislosti a balíčky.

## O

**Output**  
Hodnoty vrácené z nasazení infrastruktury, které mohou být použity aplikacemi nebo jinými zdroji.

## P

**Package**  
Proces přípravy kódu aplikace a závislostí pro nasazení.

**Parameters**  
Vstupní hodnoty předávané do infrastrukturních šablon pro přizpůsobení nasazení.

**PostgreSQL**  
Open-source relační databázový systém podporovaný jako spravovaná služba v Azure.

**Provisioning**  
Proces vytváření a konfigurace zdrojů Azure definovaných v infrastrukturních šablonách.

## Q

**Quota**  
Limity na množství zdrojů, které lze vytvořit v Azure subscription nebo v regionu.

## R

**Resource Group**  
Logický kontejner pro zdroje Azure, které sdílejí stejný životní cyklus, oprávnění a zásady.

**Resource Token**  
Unikátní řetězec generovaný azd pro zajištění jedinečnosti názvů zdrojů napříč nasazeními.

**REST API**  
Architektonický styl pro navrhování síťových aplikací využívající HTTP metody.

**Rollback**  
Proces návratu k předchozí verzi aplikace nebo konfigurace infrastruktury.

## S

**Service**  
Komponenta vaší aplikace definovaná v azure.yaml (např. web frontend, API backend, databáze).

**SKU**  
Stock Keeping Unit. Představuje různé úrovně služby nebo výkonnostní třídy pro zdroje Azure.

**SQL Database**  
Spravovaná relační databázová služba Azure založená na Microsoft SQL Serveru.

**Static Web Apps**  
Služba Azure pro vytváření a nasazování full-stack webových aplikací z repozitářů zdrojového kódu.

**Storage Account**  
Služba Azure poskytující cloudové úložiště pro datové objekty včetně blobů, souborů, front a tabulek.

**Subscription**  
Kontejner Azure účtu, který obsahuje resource groups a zdroje, s přidruženým účtováním a správou přístupu.

## T

**Template**  
Předpřipravená struktura projektu obsahující kód aplikace, definice infrastruktury a konfiguraci pro běžné scénáře.

**Terraform**  
Open-source nástroj Infrastructure as Code, který podporuje více cloudových poskytovatelů včetně Azure.

**Traffic Manager**  
DNS založený load balancer Azure pro rozdělování provozu napříč globálními regiony Azure.

## U

**URI**  
Uniform Resource Identifier. Řetězec identifikující konkrétní zdroj.

**URL**  
Uniform Resource Locator. Typ URI, který specifikuje, kde se zdroj nachází a jak ho získat.

## V

**Virtual Network (VNet)**  
Základní stavební blok pro privátní sítě v Azure, poskytující izolaci a segmentaci.

**VS Code**  
Visual Studio Code. Oblíbený editor kódu s vynikající integrací Azure a azd.

## W

**Webhook**  
HTTP callback spouštěný při konkrétních událostech, běžně používaný v CI/CD pipelines.

**What-if**  
Funkce Azure, která ukazuje, jaké změny by nasazení provedlo, aniž by je skutečně provedla.

## Y

**YAML**  
YAML Ain't Markup Language. Čitelný formát serializace dat používaný pro konfigurační soubory jako azure.yaml.

## Z

**Zone**  
Fyzicky oddělená místa v rámci regionu Azure, která poskytují redundanci a vysokou dostupnost.

---

## Běžné zkratky

| Acronym | Plný název | Popis |
|---------|-----------|-------------|
| AAD | Azure Active Directory (now Microsoft Entra ID) | Služba pro správu identity a přístupu |
| ACR | Azure Container Registry | Služba registru kontejnerových obrazů |
| AKS | Azure Kubernetes Service | Spravovaná služba Kubernetes |
| API | Application Programming Interface | Sada protokolů pro vytváření softwaru |
| ARM | Azure Resource Manager | Nasazovací a správcová služba Azure |
| CDN | Content Delivery Network | Distribuovaná síť serverů |
| CI/CD | Continuous Integration/Continuous Deployment | Automatizované vývojové postupy |
| CLI | Command Line Interface | Textové uživatelské rozhraní |
| DNS | Domain Name System | Systém pro převod doménových jmen na IP adresy |
| HTTPS | Hypertext Transfer Protocol Secure | Zabezpečená verze HTTP |
| IaC | Infrastructure as Code | Správa infrastruktury pomocí kódu |
| JSON | JavaScript Object Notation | Formát pro výměnu dat |
| JWT | JSON Web Token | Formát tokenu pro bezpečný přenos informací |
| KQL | Kusto Query Language | Dotazovací jazyk pro služby s daty v Azure |
| RBAC | Role-Based Access Control | Metoda řízení přístupu založená na rolích uživatelů |
| REST | Representational State Transfer | Architektonický styl pro webové služby |
| SDK | Software Development Kit | Sada nástrojů pro vývoj |
| SLA | Service Level Agreement | Závazek k dostupnosti/výkonu služby |
| SQL | Structured Query Language | Jazyk pro správu relačních databází |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Kryptografické protokoly |
| URI | Uniform Resource Identifier | Řetězec identifikující zdroj |
| URL | Uniform Resource Locator | Typ URI specifikující umístění zdroje |
| VM | Virtual Machine | Emulace počítačového systému |
| VNet | Virtual Network | Privátní síť v Azure |
| YAML | YAML Ain't Markup Language | Standard serializace dat |

---

## Mapování názvů Azure služeb

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

## Termíny specifické pro kontext

### Vývojové termíny
- **Hot Reload**: Automatické aktualizace aplikací během vývoje bez restartu
- **Build Pipeline**: Automatizovaný proces pro sestavování a testování kódu
- **Deployment Slot**: Staging prostředí v rámci App Service
- **Environment Parity**: Udržování podobnosti vývojového, staging a produkčního prostředí

### Bezpečnostní termíny
- **Managed Identity**: Funkce Azure poskytující automatickou správu přihlašovacích údajů
- **Key Vault**: Bezpečné úložiště pro tajemství, klíče a certifikáty
- **RBAC**: Řízení přístupu na základě rolí pro zdroje Azure
- **Network Security Group**: Virtuální firewall pro řízení síťového provozu

### Monitorovací termíny
- **Telemetry**: Automatizovaný sběr měření a dat
- **Application Performance Monitoring (APM)**: Monitorování výkonu softwaru
- **Log Analytics**: Služba pro sběr a analýzu logovacích dat
- **Alert Rules**: Automatizovaná upozornění založená na metrikách nebo podmínkách

### Nasazovací termíny
- **Blue-Green Deployment**: Strategie nasazení bez výpadku
- **Canary Deployment**: Postupné nasazování pro podmnožinu uživatelů
- **Rolling Update**: Postupná výměna instancí aplikace
- **Rollback**: Návrat k předchozí verzi aplikace

---

**Usage Tip**: Use `Ctrl+F` to quickly search for specific terms in this glossary. Terms are cross-referenced where applicable.

---

**Navigation**
- **Previous Lesson**: [Cheat Sheet](cheat-sheet.md)
- **Next Lesson**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->