# Slovník - Terminológia Azure a AZD

**Odkaz pre všetky kapitoly**
- **📚 Domov kurzu**: [AZD For Beginners](../README.md)
- **📖 Naučiť sa základy**: [Chapter 1: AZD Basics](../docs/getting-started/azd-basics.md)
- **🤖 Termíny AI**: [Chapter 2: AI-First Development](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## Úvod

Tento komplexný slovník poskytuje definície pre pojmy, koncepty a skratky používané v Azure Developer CLI a vývoji v cloude Azure. Základný odkaz pre porozumenie technickej dokumentácie, riešenie problémov a efektívnu komunikáciu o projektoch azd a službách Azure.

## Ciele učenia

Používaním tohto slovníka budete:
- Rozumieť základnej terminológii a konceptom Azure Developer CLI
- Ovládať slovnú zásobu a technické pojmy vývoja v Azure cloude
- Efektívne odkazovať na terminológiu Infrastructure as Code a nasadzovania
- Pochopiť názvy služieb Azure, skratky a ich účely
- Získať definície pre terminológiu pri riešení problémov a ladení
- Naučiť sa pokročilé koncepty architektúry a vývoja v Azure

## Výsledky učenia

Pravidelným odkazovaním na tento slovník budete schopní:
- Efektívne komunikovať s použitím správnej terminológie Azure Developer CLI
- Jasnejšie rozumieť technickej dokumentácii a chybovým hláseniam
- Sebavedomo sa orientovať v službách a konceptoch Azure
- Riešiť problémy s použitím vhodnej technickej slovnej zásoby
- Prispievať do tímových diskusií presným technickým jazykom
- Systematicky rozširovať svoje znalosti vývoja v Azure cloude

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
The process of compiling source code, installing dependencies, and preparing applications for deployment.

**Blue-Green Deployment**  
Deployment strategy that uses two identical production environments (blue and green) to minimize downtime and risk.

## C

**Container Apps**  
Azure's serverless container service that enables running containerized applications without managing complex infrastructure.

**CI/CD**  
Continuous Integration/Continuous Deployment. Automated practices for integrating code changes and deploying applications.

**Cosmos DB**  
Azure's globally distributed, multi-model database service that provides comprehensive SLAs for throughput, latency, availability, and consistency.

**Configuration**  
Settings and parameters that control application behavior and deployment options.

## D

**Deployment**  
The process of installing and configuring applications and their dependencies on target infrastructure.

**Docker**  
Platform for developing, shipping, and running applications using containerization technology.

**Dockerfile**  
Text file containing instructions for building a Docker container image.

## E

**Environment**  
A deployment target that represents a specific instance of your application (e.g., development, staging, production).

**Environment Variables**  
Configuration values stored as key-value pairs that applications can access at runtime.

**Endpoint**  
URL or network address where an application or service can be accessed.

## F

**Function App**  
Azure's serverless compute service that enables running event-driven code without managing infrastructure.

## G

**GitHub Actions**  
CI/CD platform integrated with GitHub repositories for automating workflows.

**Git**  
Distributed version control system used for tracking changes in source code.

## H

**Hooks**  
Custom scripts or commands that run at specific points during the deployment lifecycle (preprovision, postprovision, predeploy, postdeploy).

**Host**  
The Azure service type where an application will be deployed (e.g., appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Practice of defining and managing infrastructure through code rather than manual processes.

**Init**  
The process of initializing a new azd project, typically from a template.

## J

**JSON**  
JavaScript Object Notation. Data interchange format commonly used for configuration files and API responses.

**JWT**  
JSON Web Token. Standard for securely transmitting information between parties as a JSON object.

## K

**Key Vault**  
Azure's service for securely storing and managing secrets, keys, and certificates.

**Kusto Query Language (KQL)**  
Query language used for analyzing data in Azure Monitor, Application Insights, and other Azure services.

## L

**Load Balancer**  
Service that distributes incoming network traffic across multiple servers or instances.

**Log Analytics**  
Azure service for collecting, analyzing, and acting on telemetry data from cloud and on-premises environments.

## M

**Managed Identity**  
Azure feature that provides Azure services with an automatically managed identity for authenticating to other Azure services.

**Microservices**  
Architectural approach where applications are built as a collection of small, independent services.

**Monitor**  
Azure's unified monitoring solution that provides full-stack observability across applications and infrastructure.

## N

**Node.js**  
JavaScript runtime built on Chrome's V8 JavaScript engine for building server-side applications.

**npm**  
Package manager for Node.js that manages dependencies and packages.

## O

**Output**  
Values returned from infrastructure deployment that can be used by applications or other resources.

## P

**Package**  
The process of preparing application code and dependencies for deployment.

**Parameters**  
Input values passed to infrastructure templates to customize deployments.

**PostgreSQL**  
Open-source relational database system supported as a managed service in Azure.

**Provisioning**  
The process of creating and configuring Azure resources defined in infrastructure templates.

## Q

**Quota**  
Limits on the amount of resources that can be created in an Azure subscription or region.

## R

**Resource Group**  
Logical container for Azure resources that share the same lifecycle, permissions, and policies.

**Resource Token**  
Unique string generated by azd to ensure resource names are unique across deployments.

**REST API**  
Architectural style for designing networked applications using HTTP methods.

**Rollback**  
Process of reverting to a previous version of an application or infrastructure configuration.

## S

**Service**  
A component of your application defined in azure.yaml (e.g., web frontend, API backend, database).

**SKU**  
Stock Keeping Unit. Represents different service tiers or performance levels for Azure resources.

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
Pre-built project structure containing application code, infrastructure definitions, and configuration for common scenarios.

**Terraform**  
Open-source Infrastructure as Code tool that supports multiple cloud providers including Azure.

**Traffic Manager**  
Azure's DNS-based traffic load balancer for distributing traffic across global Azure regions.

## U

**URI**  
Uniform Resource Identifier. String that identifies a particular resource.

**URL**  
Uniform Resource Locator. Type of URI that specifies where a resource is located and how to retrieve it.

## V

**Virtual Network (VNet)**  
Fundamental building block for private networks in Azure, providing isolation and segmentation.

**VS Code**  
Visual Studio Code. Popular code editor with excellent Azure and azd integration.

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

## Bežné skratky

| Skratka | Plný názov | Popis |
|---------|-----------|-------------|
| AAD | Azure Active Directory | Služba na správu identity a prístupu |
| ACR | Azure Container Registry | Služba pre registry kontajnerových obrazov |
| AKS | Azure Kubernetes Service | Spravovaná služba Kubernetes |
| API | Application Programming Interface | Sada protokolov pre tvorbu softvéru |
| ARM | Azure Resource Manager | Nasadzovacia a správcovská služba Azure |
| CDN | Content Delivery Network | Distribuovaná sieť serverov pre doručovanie obsahu |
| CI/CD | Continuous Integration/Continuous Deployment | Automatizované praktiky vývoja a nasadzovania |
| CLI | Command Line Interface | Textové používateľské rozhranie |
| DNS | Domain Name System | Systém pre preklad doménových mien na IP adresy |
| HTTPS | Hypertext Transfer Protocol Secure | Zabezpečená verzia HTTP |
| IaC | Infrastructure as Code | Správa infraštruktúry pomocou kódu |
| JSON | JavaScript Object Notation | Formát na výmenu dát |
| JWT | JSON Web Token | Formát tokenu pre bezpečný prenos informácií |
| KQL | Kusto Query Language | Dotazovací jazyk pre dátové služby Azure |
| RBAC | Role-Based Access Control | Riadenie prístupu založené na rolách |
| REST | Representational State Transfer | Architektonický štýl pre webové služby |
| SDK | Software Development Kit | Zostava nástrojov pre vývoj |
| SLA | Service Level Agreement | Záväzok k dostupnosti/výkonnosti služby |
| SQL | Structured Query Language | Jazyk na správu relačných databáz |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Kryptografické protokoly |
| URI | Uniform Resource Identifier | Reťazec identifikujúci zdroj |
| URL | Uniform Resource Locator | Typ URI špecifikujúci umiestnenie zdroja |
| VM | Virtual Machine | Emulácia počítačového systému |
| VNet | Virtual Network | Súkromná sieť v Azure |
| YAML | YAML Ain't Markup Language | Štandard serializácie dát |

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
- **Hot Reload**: Automatické aktualizovanie aplikácií počas vývoja bez reštartu
- **Build Pipeline**: Automatizovaný proces na zostavenie a testovanie kódu
- **Deployment Slot**: Stagingové prostredie v rámci App Service
- **Environment Parity**: Zachovanie podobnosti medzi vývojovým, stagingovým a produkčným prostredím

### Bezpečnostné pojmy
- **Managed Identity**: Funkcia Azure poskytujúca automatickú správu prihlasovacích údajov
- **Key Vault**: Bezpečné úložisko pre tajomstvá, kľúče a certifikáty
- **RBAC**: Riadenie prístupu založené na rolách pre prostriedky Azure
- **Network Security Group**: Virtuálny firewall na riadenie sieťovej prevádzky

### Monitorovacie pojmy
- **Telemetry**: Automatizované zhromažďovanie meraní a dát
- **Application Performance Monitoring (APM)**: Monitorovanie výkonnosti softvéru
- **Log Analytics**: Služba na zhromažďovanie a analýzu logov
- **Alert Rules**: Automatizované oznámenia založené na metrikách alebo podmienkach

### Nasadzovacie pojmy
- **Blue-Green Deployment**: Stratégiu nasadenia bez prestojov
- **Canary Deployment**: Postupné nasadenie pre podmnožinu používateľov
- **Rolling Update**: Sekvenčná výmena inštancií aplikácie
- **Rollback**: Návrat k predchádzajúcej verzii aplikácie

---

**Tip na použitie**: Použite `Ctrl+F` na rýchle vyhľadanie konkrétnych pojmov v tomto slovníku. Pojmy sú kde to je vhodné prepojené naprieč.

---

**Navigácia**
- **Predchádzajúca lekcia**: [Cheat Sheet](cheat-sheet.md)
- **Nasledujúca lekcia**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vylúčenie zodpovednosti:
Tento dokument bol preložený pomocou AI prekladateľskej služby Co-op Translator (https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho pôvodnom jazyku by sa mal považovať za autoritatívny zdroj. Pri kritických informáciách sa odporúča profesionálny ľudský preklad. Nezodpovedáme za žiadne nedorozumenia ani nesprávne výklady, ktoré by vznikli použitím tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->