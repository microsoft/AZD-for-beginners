# Slovar - Terminologija Azure in AZD

**Referenca za vsa poglavja**
- **📚 Domov tečaja**: [AZD For Beginners](../README.md)
- **📖 Naučite se osnov**: [Chapter 1: AZD Basics](../docs/getting-started/azd-basics.md)
- **🤖 Pojmi AI**: [Chapter 2: AI-First Development](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## Uvod

Ta obsežen slovar nudi definicije za izraze, koncepte in okrajšave, ki se uporabljajo v Azure Developer CLI in pri razvoju v oblaku Azure. Ključna referenca za razumevanje tehnične dokumentacije, odpravljanje težav in učinkovito komunikacijo o azd projektih in Azure storitvah.

## Cilji učenja

Z uporabo tega slovarja boste:
- Razumeli ključne izraze in koncepte Azure Developer CLI
- Obvladali besedišče in tehnične izraze za razvoj v oblaku Azure
- Uporabno referenco za terminologijo Infrastructure as Code in nameščanja
- Razumeli imena Azure storitev, okrajšave in njihov namen
- Imeli dostop do definicij za terminologijo pri odpravljanju in razhroščevanju napak
- Naučili se naprednih konceptov arhitekture in razvoja v Azure

## Rezultati učenja

Ob redni rabi tega slovarja boste lahko:
- Učinkovito komunicirali z ustrezno terminologijo Azure Developer CLI
- Jasneje razumeli tehnično dokumentacijo in sporočila o napakah
- Zaupno krmarili po Azure storitvah in konceptih
- Odpravljali težave z uporabo primernega tehničnega besedišča
- Prispevali k timskim razpravam z natančnim tehničnim izrazoslovjem
- Sistematično razširili svoje znanje razvoja v oblaku Azure

## A

**ARM Template**  
Azure Resource Manager template. JSON-based Infrastructure as Code format used to define and deploy Azure resources declaratively.
  
**App Service**  
Azure's platform-as-a-service (PaaS) offering for hosting web applications, REST APIs, and mobile backends without managing infrastructure.

**Application Insights**  
Azure's application performance monitoring (APM) service that provides deep insights into application performance, availability, and usage.

**Azure CLI**  
Command-line interface for managing Azure resources. Used by azd for authentication and some operations.

**Azure Developer CLI (azd)**  
Developer-centric command-line tool that accelerates the process of building and deploying applications to Azure using templates and Infrastructure as Code.

**azure.yaml**  
The main configuration file for an azd project that defines services, infrastructure, and deployment hooks.

**Azure Resource Manager (ARM)**  
Azure's deployment and management service that provides a management layer for creating, updating, and deleting resources.

## B

**Bicep**  
Domain-specific language (DSL) developed by Microsoft for deploying Azure resources. Provides simpler syntax than ARM templates while compiling to ARM.

**Build**  
Proces prevajanja izvorne kode, nameščanja odvisnosti in priprave aplikacij za nameščanje.

**Blue-Green Deployment**  
Strategija nameščanja, ki uporablja dve enaki produkcijski okolji (blue in green) za zmanjšanje izpadov in tveganja.

## C

**Container Apps**  
Azure's serverless container service that enables running containerized applications without managing complex infrastructure.

**CI/CD**  
Continuous Integration/Continuous Deployment. Avtomatizirane prakse za integracijo sprememb kode in nameščanje aplikacij.

**Cosmos DB**  
Azure's globally distributed, multi-model database service that provides comprehensive SLAs for throughput, latency, availability, and consistency.

**Configuration**  
Nastavitve in parametri, ki nadzorujejo vedenje aplikacije in možnosti nameščanja.

## D

**Deployment**  
Proces nameščanja in konfiguracije aplikacij ter njihovih odvisnosti na ciljno infrastrukturo.

**Docker**  
Platforma za razvoj, pošiljanje in zagon aplikacij z uporabo tehnologije kontejnerizacije.

**Dockerfile**  
Besedilna datoteka, ki vsebuje navodila za gradnjo Docker slike kontejnerja.

## E

**Environment**  
Ciljni prostor za nameščanje, ki predstavlja specifično instanco vaše aplikacije (npr. razvoj, staging, produkcija).

**Environment Variables**  
Konfiguracijske vrednosti shranjene kot pari ključ-vrednost, do katerih lahko aplikacije dostopajo med izvajanjem.

**Endpoint**  
URL ali omrežni naslov, kjer je aplikacija ali storitev dostopna.

## F

**Function App**  
Azure's serverless compute service that enables running event-driven code without managing infrastructure.

## G

**GitHub Actions**  
CI/CD platforma integrirana z GitHub repozitoriji za avtomatizacijo potekov dela.

**Git**  
Porazdeljeni sistem za nadzor različic, uporabljen za sledenje sprememb v izvorni kodi.

## H

**Hooks**  
Prilagojeni skripti ali ukazi, ki se izvajajo na določenih točkah življenjskega cikla nameščanja (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Azure service type where an application will be deployed (e.g., appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Praksa definiranja in upravljanja infrastrukture z uporabo kode namesto ročnih postopkov.

**Init**  
Proces inicializacije novega azd projekta, običajno iz predloge.

## J

**JSON**  
JavaScript Object Notation. Format za izmenjavo podatkov, pogosto uporabljen za konfiguracijske datoteke in API odgovore.

**JWT**  
JSON Web Token. Standard za varno prenašanje informacij med strankami kot JSON objekt.

## K

**Key Vault**  
Azure's service for securely storing and managing secrets, keys, and certificates.

**Kusto Query Language (KQL)**  
Query language used for analyzing data in Azure Monitor, Application Insights, and other Azure services.

## L

**Load Balancer**  
Storitev, ki porazdeli dohodni omrežni promet med več strežniki ali instanc.

**Log Analytics**  
Azure service for collecting, analyzing, and acting on telemetry data from cloud and on-premises environments.

## M

**Managed Identity**  
Azure feature that provides Azure services with an automatically managed identity for authenticating to other Azure services.

**Microservices**  
Arhitekturni pristop, kjer so aplikacije zgrajene kot zbirka majhnih, neodvisnih storitev.

**Monitor**  
Azure's unified monitoring solution that provides full-stack observability across applications and infrastructure.

## N

**Node.js**  
JavaScript runtime built on Chrome's V8 JavaScript engine for building server-side applications.

**npm**  
Package manager for Node.js that manages dependencies and packages.

## O

**Output**  
Vrednosti, ki jih vrne postopek nameščanja infrastrukture in jih lahko uporabljajo aplikacije ali drugi viri.

## P

**Package**  
Proces priprave izvorne kode aplikacije in odvisnosti za nameščanje.

**Parameters**  
Vhodne vrednosti, posredovane infrastrukturnim predlogam za prilagajanje nameščanj.

**PostgreSQL**  
Open-source relational database system supported as a managed service in Azure.

**Provisioning**  
Proces ustvarjanja in konfiguracije Azure virov, definiranih v infrastrukturnih predlogah.

## Q

**Quota**  
Omejitve glede števila virov, ki jih je mogoče ustvariti v naročnini Azure ali regiji.

## R

**Resource Group**  
Logični vsebnik za Azure vire, ki imajo skupno življenjsko dobo, dovoljenja in politike.

**Resource Token**  
Enoličen niz, ustvarjen z azd za zagotavljanje unikativnosti imen virov pri nameščanju.

**REST API**  
Arhitekturni slog za načrtovanje omrežnih aplikacij z uporabo HTTP metod.

**Rollback**  
Postopek vrnitve na prejšnjo različico aplikacije ali konfiguracije infrastrukture.

## S

**Service**  
Komponenta vaše aplikacije določena v azure.yaml (npr. spletni frontend, API backend, baza podatkov).

**SKU**  
Stock Keeping Unit. Predstavlja različne ravni storitev ali zmogljivostne stopnje za Azure vire.

**SQL Database**  
Azure's managed relational database service based on Microsoft SQL Server.

**Static Web Apps**  
Azure service for building and deploying full-stack web applications from source code repositories.

**Storage Account**  
Azure service that provides cloud storage for data objects including blobs, files, queues, and tables.

**Subscription**  
Azure account container that holds resource groups and resources, with associated billing and access management.

## T

**Template**  
Predhodno pripravljena struktura projekta, ki vsebuje izvorno kodo aplikacije, definicije infrastrukture in konfiguracijo za pogoste primere uporabe.

**Terraform**  
Open-source Infrastructure as Code tool that supports multiple cloud providers including Azure.

**Traffic Manager**  
Azure's DNS-based traffic load balancer for distributing traffic across global Azure regions.

## U

**URI**  
Uniform Resource Identifier. Niz, ki identificira določen vir.

**URL**  
Uniform Resource Locator. Tip URI, ki določa, kje se vir nahaja in kako ga pridobiti.

## V

**Virtual Network (VNet)**  
Fundamental building block for private networks in Azure, providing isolation and segmentation.

**VS Code**  
Visual Studio Code. Priljubljeno urejevalnik kode z odlično integracijo za Azure in azd.

## W

**Webhook**  
HTTP callback triggered by specific events, commonly used in CI/CD pipelines.

**What-if**  
Azure feature that shows what changes would be made by a deployment without actually executing it.

## Y

**YAML**  
YAML Ain't Markup Language. Human-readable data serialization standard used for configuration files like azure.yaml.

## Z

**Zone**  
Physically separate locations within an Azure region that provide redundancy and high availability.

---

## Pogoste okrajšave

| Acronym | Celotna oblika | Opis |
|---------|----------------|------|
| AAD | Azure Active Directory | Storitev za upravljanje identitet in dostopa |
| ACR | Azure Container Registry | Storitev za registracijo slik kontejnerjev |
| AKS | Azure Kubernetes Service | Upravljen Kubernetes servis |
| API | Application Programming Interface | Nabor protokolov za gradnjo programske opreme |
| ARM | Azure Resource Manager | Azurejeva storitev za nameščanje in upravljanje |
| CDN | Content Delivery Network | Porazdeljena mreža strežnikov za dostavo vsebin |
| CI/CD | Continuous Integration/Continuous Deployment | Avtomatizirane razvojne prakse |
| CLI | Command Line Interface | Besedilni uporabniški vmesnik |
| DNS | Domain Name System | Sistem za prevajanje domen v IP naslove |
| HTTPS | Hypertext Transfer Protocol Secure | Varnostna različica HTTP |
| IaC | Infrastructure as Code | Upravljanje infrastrukture z uporabo kode |
| JSON | JavaScript Object Notation | Format za izmenjavo podatkov |
| JWT | JSON Web Token | Oblika žetona za varen prenos informacij |
| KQL | Kusto Query Language | Jezik poizvedb za Azure podatkovne storitve |
| RBAC | Role-Based Access Control | Metoda nadzora dostopa na osnovi vlog |
| REST | Representational State Transfer | Arhitekturni slog za spletne storitve |
| SDK | Software Development Kit | Zbirka orodij za razvoj |
| SLA | Service Level Agreement | Dogovor o razpoložljivosti/zmogljivosti storitve |
| SQL | Structured Query Language | Jezik za upravljanje relacijskih baz podatkov |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Kriptografski protokoli |
| URI | Uniform Resource Identifier | Niz, ki identificira vir |
| URL | Uniform Resource Locator | Tip URI, ki določa lokacijo vira |
| VM | Virtual Machine | Emulacija računalniškega sistema |
| VNet | Virtual Network | Zasebno omrežje v Azure |
| YAML | YAML Ain't Markup Language | Standard za serializacijo podatkov |

---

## Preslikave imen Azure storitev

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
| Search | Azure Cognitive Search | `search` |
| Messaging | Azure Service Bus | `servicebus` |

---

## Kontekstno specifični izrazi

### Razvojni izrazi
- **Hot Reload**: Samodejna osvežitev aplikacij med razvojem brez ponovnega zagona
- **Build Pipeline**: Avtomatiziran proces za gradnjo in testiranje kode
- **Deployment Slot**: Staging okolje znotraj App Service
- **Environment Parity**: Ohranjanje podobnosti razvojnih, staging in produkcijskih okolij

### Varnostni izrazi
- **Managed Identity**: Azure feature providing automatic credential management
- **Key Vault**: Secure storage for secrets, keys, and certificates
- **RBAC**: Role-based access control for Azure resources
- **Network Security Group**: Virtual firewall for controlling network traffic

### Nadzorni izrazi
- **Telemetry**: Samodejno zbiranje meritev in podatkov
- **Application Performance Monitoring (APM)**: Nadzorovanje zmogljivosti programske opreme
- **Log Analytics**: Storitev za zbiranje in analizo dnevniških podatkov
- **Alert Rules**: Samodejna obvestila na podlagi metrik ali pogojev

### Izrazi za nameščanje
- **Blue-Green Deployment**: Strategija nameščanja z ničelnim izpadom
- **Canary Deployment**: Postopno uvajanje za podmnožico uporabnikov
- **Rolling Update**: Zaporedna zamenjava instanc aplikacije
- **Rollback**: Vrnitev na prejšnjo različico aplikacije

---

**Nasvet za uporabo**: Uporabite `Ctrl+F` za hitro iskanje specifičnih izrazov v tem slovarju. Izrazi so medsebojno povezani, kjer je to primerno.

---

**Navigacija**
- **Prejšnja lekcija**: [Cheat Sheet](cheat-sheet.md)
- **Naslednja lekcija**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Izjava o omejitvi odgovornosti:
Ta dokument je bil preveden z uporabo storitve za avtomatsko prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, upoštevajte, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku velja za avtoritativni vir. Za pomembne informacije priporočamo strokovni človeški prevod. Ne odgovarjamo za morebitne nesporazume ali napačne razlage, ki bi izhajale iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->