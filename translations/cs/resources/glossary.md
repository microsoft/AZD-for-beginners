# Slovník - Terminologie Azure a AZD

**Reference pro všechny kapitoly**
- **📚 Domů ke kurzu**: [AZD pro začátečníky](../README.md)
- **📖 Naučte se základy**: [Kapitola 1: Základy AZD](../docs/chapter-01-foundation/azd-basics.md)
- **🤖 AI pojmy**: [Kapitola 2: Vývoj zaměřený na AI](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)

## Úvod

Tento rozsáhlý slovník poskytuje definice pojmů, konceptů a zkratek používaných v Azure Developer CLI a vývoji v Azure cloudu. Nezbytná reference pro pochopení technické dokumentace, řešení problémů a efektivní komunikaci o projektech azd a službách Azure.

## Cíle učení

Používáním tohoto slovníku budete schopni:
- Pochopit základní terminologii a koncepty Azure Developer CLI
- Ovládnout slovník a technické pojmy vývoje v Azure cloudu
- Efektivně odkazovat na terminologii Infrastructure as Code a nasazení
- Porozumět názvům služeb Azure, zkratkám a jejich účelům
- Mít přístup k definicím terminologie pro řešení problémů a ladění
- Naučit se pokročilé koncepty architektury a vývoje na Azure

## Výsledky učení

Pravidelným odkazováním na tento slovník budete schopni:
- Efektivně komunikovat za použití správné terminologie Azure Developer CLI
- Lépe rozumět technické dokumentaci a chybovým hlášením
- S jistotou se orientovat ve službách a konceptech Azure
- Řešit problémy s použitím vhodné technické slovní zásoby
- Přispívat k týmovým diskuzím přesným technickým jazykem
- Systematicky rozšiřovat své znalosti vývoje v Azure cloudu

## A

**ARM Template**  
Šablona Azure Resource Manageru. Infrastrukturní formát Infrastructure as Code založený na JSONu používaný k deklarativnímu definování a nasazení zdrojů Azure.

**App Service**  
Platforma jako služba (PaaS) Azure pro hostování webových aplikací, REST API a mobilních backendů bez správy infrastruktury.

**Application Insights**  
Monitorovací služba aplikací Azure (APM), která poskytuje hluboké přehledy o výkonu, dostupnosti a používání aplikací.

**Azure CLI**  
Rozhraní příkazového řádku pro správu Azure zdrojů. Doplněk AZD, ale s odděleným přihlášením; jádrem autentizace AZD je `azd auth login`.

**Azure Developer CLI (azd)**  
Příkazový nástroj zaměřený na vývojáře, který zrychluje proces sestavení a nasazení aplikací do Azure pomocí šablon a Infrastructure as Code.

**azure.yaml**  
Hlavní konfigurační soubor projektu azd, který definuje služby, infrastrukturu a nasazovací háčky.

**Azure Resource Manager (ARM)**  
Služba Azure pro nasazení a správu, která poskytuje vrstvu pro vytváření, aktualizace a odstraňování zdrojů.

## B

**Bicep**  
Doménově specifický jazyk (DSL) vyvinutý společností Microsoft pro nasazování Azure zdrojů. Poskytuje jednodušší syntaxi než ARM šablony a kompiluje se do ARM.

**Build**  
Proces kompilace zdrojového kódu, instalace závislostí a přípravy aplikací k nasazení.

**Blue-Green Deployment**  
Nasazovací strategie využívající dvě identické produkční prostředí (modré a zelené) ke snížení prostojů a rizika.

## C

**Container Apps**  
Serverless kontejnerová služba Azure umožňující provoz kontejnerizovaných aplikací bez správy složité infrastruktury.

**CI/CD**  
Continuous Integration/Continuous Deployment. Automatizované postupy pro integraci změn kódu a nasazení aplikací.

**Cosmos DB**  
Globálně distribuovaná, multimodelová databázová služba Azure poskytující komplexní SLA pro propustnost, latenci, dostupnost a konzistenci.

**Configuration**  
Nastavení a parametry, které řídí chování aplikace a možnosti nasazení.

## D

**Deployment**  
Proces instalace a konfigurace aplikací a jejich závislostí na cílové infrastruktuře.

**Docker**  
Platforma pro vývoj, doručování a provoz aplikací využívajících technologii kontejnerizace.

**Dockerfile**  
Textový soubor obsahující instrukce pro sestavení obrazu Docker kontejneru.

## E

**Environment**  
Cílové nasazení představující konkrétní instanci vaší aplikace (např. vývojové, stagingové, produkční).

**Environment Variables**  
Konfigurační hodnoty uložené jako páry klíč-hodnota, ke kterým aplikace může přistupovat za běhu.

**Endpoint**  
URL nebo síťová adresa, na které lze aplikaci nebo službu zpřístupnit.

## F

**Function App**  
Serverless výpočetní služba Azure umožňující spouštění kódu řízeného událostmi bez správy infrastruktury.

## G

**GitHub Actions**  
CI/CD platforma integrovaná s repozitáři GitHub pro automatizaci pracovních postupů.

**Git**  
Distribuovaný systém pro správu verzí používaný pro sledování změn v kódu.

## H

**Hooks**  
Vlastní skripty nebo příkazy spuštěné v konkrétních bodech životního cyklu nasazení (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Typ služby Azure, kam bude aplikace nasazena (např. appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Praxe definování a správy infrastruktury prostřednictvím kódu místo manuálních procesů.

**Init**  
Proces inicializace nového projektu azd, obvykle z šablony.

## J

**JSON**  
JavaScript Object Notation. Formát pro výměnu dat běžně používaný u konfiguračních souborů a odpovědí API.

**JWT**  
JSON Web Token. Standard pro bezpečný přenos informací mezi stranami jako JSON objekt.

## K

**Key Vault**  
Služba Azure pro bezpečné ukládání a správu tajemství, klíčů a certifikátů.

**Kusto Query Language (KQL)**  
Dotazovací jazyk používaný pro analýzu dat v Azure Monitor, Application Insights a dalších službách Azure.

## L

**Load Balancer**  
Služba, která distribuuje příchozí síťový provoz mezi více servery nebo instancemi.

**Log Analytics**  
Služba Azure pro sběr, analýzu a reakci na telemetrická data z cloudových a lokálních prostředí.

## M

**Managed Identity**  
Funkce Azure poskytující službám Azure automaticky spravovanou identitu pro autentizaci k jiným službám Azure.

**Microservices**  
Architektonický přístup, kdy jsou aplikace vytvářeny jako sbírka malých, nezávislých služeb.

**Monitor**  
Jednotné monitorovací řešení Azure poskytující plnou viditelnost napříč aplikacemi a infrastrukturou.

## N

**Node.js**  
JavaScript běhové prostředí postavené na Chrome V8 engine pro tvorbu serverových aplikací.

**npm**  
Správce balíčků pro Node.js, který spravuje závislosti a balíčky.

## O

**Output**  
Hodnoty vrácené z nasazení infrastruktury, které mohou být využity aplikacemi nebo jinými zdroji.

## P

**Package**  
Proces přípravy aplikačního kódu a závislostí pro nasazení.

**Parameters**  
Vstupní hodnoty předávané infrastrukturním šablonám pro přizpůsobení nasazení.

**PostgreSQL**  
Open-source relační databázový systém podporovaný jako spravovaná služba v Azure.

**Provisioning**  
Proces vytváření a konfigurace Azure zdrojů definovaných v infrastrukturních šablonách.

## Q

**Quota**  
Limity na množství zdrojů, které lze vytvořit v Azure předplatném nebo regionu.

## R

**Resource Group**  
Logický kontejner pro Azure zdroje, které sdílí stejný životní cyklus, oprávnění a politiky.

**Resource Token**  
Jedinečný řetězec generovaný azd k zajištění unikátnosti názvů zdrojů napříč nasazeními.

**REST API**  
Architektonický styl pro návrh síťových aplikací využívající HTTP metody.

**Rollback**  
Proces návratu k předchozí verzi aplikace nebo konfigurace infrastruktury.

## S

**Service**  
Komponenta vaší aplikace definovaná v azure.yaml (např. webové front-end, API back-end, databáze).

**SKU**  
Stock Keeping Unit. Představuje různé úrovně služeb nebo výkonnostní stupně pro Azure zdroje.

**SQL Database**  
Spravovaná relační databázová služba Azure založená na Microsoft SQL Serveru.

**Static Web Apps**  
Azure služba pro tvorbu a nasazení full-stack webových aplikací ze zdrojových repozitářů.

**Storage Account**  
Azure služba poskytující cloudové úložiště pro datové objekty včetně blobů, souborů, front a tabulek.

**Subscription**  
Kontejner účtu Azure obsahující resource groupy a zdroje, s fakturační a přístupovou správou.

## T

**Template**  
Přednastavená projektová struktura obsahující aplikační kód, infrastrukturu a konfiguraci pro běžné scénáře.

**Terraform**  
Open-source nástroj Infrastructure as Code podporující více poskytovatelů cloudu včetně Azure.

**Traffic Manager**  
DNS založený load balancer Azure pro distribuci provozu mezi globálními Azure regiony.

## U

**URI**  
Uniform Resource Identifier. Řetězec identifikující konkrétní zdroj.

**URL**  
Uniform Resource Locator. Typ URI specifikující umístění zdroje a způsob jeho získání.

## V

**Virtual Network (VNet)**  
Základní stavební kámen pro privátní sítě v Azure, poskytující izolaci a segmentaci.

**VS Code**  
Visual Studio Code. Oblíbený editor kódu s vynikající integrací Azure a azd.

## W

**Webhook**  
HTTP callback vyvolaný konkrétními událostmi, běžně používaný v CI/CD pipelinech.

**What-if**  
Funkce Azure, která ukazuje, jaké změny by nasazení provedlo, aniž by je skutečně provedla.

## Y

**YAML**  
YAML Ain't Markup Language. Čitelný datový serializační standard používaný pro konfigurační soubory jako azure.yaml.

## Z

**Zone**  
Fyzicky oddělená místa v Azure regionu poskytující redundanci a vysokou dostupnost.

---

## Běžné zkratky

| Zkratka | Celý název | Popis |
|---------|-----------|-------------|
| AAD | Azure Active Directory (nyní Microsoft Entra ID) | Služba správy identit a přístupu |
| ACR | Azure Container Registry | Služba registru kontejnerových image |
| AKS | Azure Kubernetes Service | Spravovaná Kubernetes služba |
| API | Application Programming Interface | Sada protokolů pro vývoj softwaru |
| ARM | Azure Resource Manager | Služba nasazení a správy Azure |
| CDN | Content Delivery Network | Distribuovaná síť serverů |
| CI/CD | Continuous Integration/Continuous Deployment | Automatizované praktiky vývoje |
| CLI | Command Line Interface | Textové uživatelské rozhraní |
| DNS | Domain Name System | Systém pro převod doménových jmen na IP adresy |
| HTTPS | Hypertext Transfer Protocol Secure | Bezpečná verze HTTP |
| IaC | Infrastructure as Code | Správa infrastruktury pomocí kódu |
| JSON | JavaScript Object Notation | Formát pro výměnu dat |
| JWT | JSON Web Token | Formát tokenu pro bezpečný přenos informací |
| KQL | Kusto Query Language | Dotazovací jazyk pro Azure datové služby |
| RBAC | Role-Based Access Control | Řízení přístupu založené na rolích |
| REST | Representational State Transfer | Architektonický styl webových služeb |
| SDK | Software Development Kit | Sada nástrojů pro vývoj softwaru |
| SLA | Service Level Agreement | Závazek k dostupnosti a výkonnosti služby |
| SQL | Structured Query Language | Jazyk pro správu relačních databází |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Kryptografické protokoly |
| URI | Uniform Resource Identifier | Řetězec identifikující zdroj |
| URL | Uniform Resource Locator | Typ URI určující umístění zdroje |
| VM | Virtual Machine | Emulace počítačového systému |
| VNet | Virtual Network | Privátní síť v Azure |
| YAML | YAML Ain't Markup Language | Standard serializace dat |

---

## Překlady názvů Azure služeb

| Běžný název | Oficiální název služby Azure | Typ hostitele azd |
|-------------|------------------------------|---------------|
| Web App | Azure App Service | `appservice` |
| API App | Azure App Service | `appservice` |
| Container App | Azure Container Apps | `containerapp` |
| Function | Azure Functions | `function` |
| Static Site | Azure Static Web Apps | `staticwebapp` |
| Database | Azure Database for PostgreSQL | Infrastrukturní zdroj, nikoli aplikace `host` |
| NoSQL DB | Azure Cosmos DB | Infrastrukturní zdroj, nikoli aplikace `host` |
| Storage | Azure Storage Account | Infrastrukturní zdroj, nikoli vestavěná aplikace `host` |
| Cache | Azure Managed Redis | Infrastrukturní zdroj, nikoli aplikace `host` |
| Search | Azure AI Search | Infrastrukturní zdroj, nikoli aplikace `host` |
| Messaging | Azure Service Bus | Infrastrukturní zdroj, nikoli aplikace `host` |

`services.<name>.host` vybírá cílové nasazení aplikace; není to zkratka pro žádný typ zdroje Azure. Databáze, cache, vyhledávací služby a fronty jsou běžně poskytovány přes infrastrukturní poskytovatele a připojovány k aplikaci přes výstupy/konfiguraci.

---

## Výrazy specifické pro kontext

### Vývojové pojmy
- **Hot Reload**: Automatická aktualizace aplikací během vývoje bez restartu
- **Build Pipeline**: Automatizovaný proces pro sestavení a testování kódu
- **Deployment Slot**: Stagingové prostředí v App Service
- **Environment Parity**: Udržování podobnosti vývojových, stagingových a produkčních prostředí

### Bezpečnostní pojmy
- **Managed Identity**: Funkce Azure poskytující automatickou správu úvěřovacích údajů
- **Key Vault**: Bezpečné úložiště pro tajemství, klíče a certifikáty
- **RBAC**: Řízení přístupu založené na rolích pro Azure zdroje
- **Network Security Group**: Virtuální firewall pro kontrolu síťového provozu

### Monitorovací pojmy
- **Telemetry**: Automatizovaný sběr měření a dat
- **Application Performance Monitoring (APM)**: Monitorování výkonnosti softwaru
- **Log Analytics**: Služba pro sběr a analýzu logovacích dat
- **Alert Rules**: Automatizovaná upozornění založená na metrikách nebo podmínkách

### Nasazovací pojmy
- **Blue-Green Deployment**: Strategie nasazení bez výpadku
- **Canary Deployment**: Postupné uvedení pro podmnožinu uživatelů
- **Rolling Update**: Postupná výměna instancí aplikace
- **Rollback**: Návrat k předchozí verzi aplikace

---

**Tip pro použití**: Použijte `Ctrl+F` pro rychlé hledání konkrétních pojmů v tomto slovníku. Termíny jsou mezi sebou křížově odkazovány tam, kde je to vhodné.

---

**Navigace**
- **Předchozí lekce**: [Cheat Sheet](cheat-sheet.md)
- **Další lekce**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->