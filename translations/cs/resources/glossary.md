# Glossary - Azure and AZD Terminology

**Reference for All Chapters**
- **📚 Course Home**: [AZD For Beginners](../README.md)
- **📖 Learn Basics**: [Chapter 1: AZD Basics](../docs/getting-started/azd-basics.md)
- **🤖 AI Terms**: [Chapter 2: AI-First Development](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## Introduction

This comprehensive glossary provides definitions for terms, concepts, and acronyms used in Azure Developer CLI and Azure cloud development. Essential reference for understanding technical documentation, troubleshooting issues, and communicating effectively about azd projects and Azure services.

## Learning Goals

By using this glossary, you will:
- Understand essential Azure Developer CLI terminology and concepts
- Master Azure cloud development vocabulary and technical terms
- Reference Infrastructure as Code and deployment terminology efficiently
- Comprehend Azure service names, acronyms, and their purposes
- Access definitions for troubleshooting and debugging terminology
- Learn advanced Azure architecture and development concepts

## Learning Outcomes

With regular reference to this glossary, you will be able to:
- Communicate effectively using proper Azure Developer CLI terminology
- Understand technical documentation and error messages more clearly
- Navigate Azure services and concepts with confidence
- Troubleshoot issues using appropriate technical vocabulary
- Contribute to team discussions with accurate technical language
- Expand your Azure cloud development knowledge systematically

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

## Common Acronyms

| Acronym | Full Form | Description |
|---------|-----------|-------------|
| AAD | Azure Active Directory | Služba pro správu identit a přístupu |
| ACR | Azure Container Registry | Služba pro registraci kontejnerových obrazů |
| AKS | Azure Kubernetes Service | Spravovaná služba Kubernetes |
| API | Application Programming Interface | Sada protokolů pro tvorbu softwaru |
| ARM | Azure Resource Manager | Služba pro nasazování a správu v Azure |
| CDN | Content Delivery Network | Distribuovaná síť serverů pro doručování obsahu |
| CI/CD | Continuous Integration/Continuous Deployment | Automatizované postupy pro integraci a nasazování |
| CLI | Command Line Interface | Textové uživatelské rozhraní |
| DNS | Domain Name System | Systém pro překlad doménových jmen na IP adresy |
| HTTPS | Hypertext Transfer Protocol Secure | Zabezpečená verze HTTP |
| IaC | Infrastructure as Code | Správa infrastruktury pomocí kódu |
| JSON | JavaScript Object Notation | Formát pro výměnu dat |
| JWT | JSON Web Token | Formát tokenu pro bezpečný přenos informací |
| KQL | Kusto Query Language | Dotazovací jazyk pro služby s daty v Azure |
| RBAC | Role-Based Access Control | Řízení přístupu založené na rolích |
| REST | Representational State Transfer | Architektonický styl pro webové služby |
| SDK | Software Development Kit | Sada nástrojů pro vývoj |
| SLA | Service Level Agreement | Závazek ohledně dostupnosti a výkonu služby |
| SQL | Structured Query Language | Jazyk pro správu relačních databází |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Kryptografické protokoly |
| URI | Uniform Resource Identifier | Řetězec identifikující zdroj |
| URL | Uniform Resource Locator | Typ URI určující umístění zdroje |
| VM | Virtual Machine | Emulace počítačového systému |
| VNet | Virtual Network | Soukromá síť v Azure |
| YAML | YAML Ain't Markup Language | Standard serializace dat |

---

## Azure Service Name Mappings

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

## Context-Specific Terms

### Development Terms
- **Hot Reload**: Automatically updating applications during development without restart
- **Build Pipeline**: Automated process for building and testing code
- **Deployment Slot**: Staging environment within an App Service
- **Environment Parity**: Keeping development, staging, and production environments similar

### Security Terms
- **Managed Identity**: Azure feature providing automatic credential management
- **Key Vault**: Secure storage for secrets, keys, and certificates
- **RBAC**: Role-based access control for Azure resources
- **Network Security Group**: Virtual firewall for controlling network traffic

### Monitoring Terms
- **Telemetry**: Automated collection of measurements and data
- **Application Performance Monitoring (APM)**: Monitoring software performance
- **Log Analytics**: Service for collecting and analyzing log data
- **Alert Rules**: Automated notifications based on metrics or conditions

### Deployment Terms
- **Blue-Green Deployment**: Zero-downtime deployment strategy
- **Canary Deployment**: Gradual rollout to subset of users
- **Rolling Update**: Sequential replacement of application instances
- **Rollback**: Reverting to previous application version

---

**Usage Tip**: Use `Ctrl+F` to quickly search for specific terms in this glossary. Terms are cross-referenced where applicable.

---

**Navigation**
- **Previous Lesson**: [Cheat Sheet](cheat-sheet.md)
- **Next Lesson**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vyloučení odpovědnosti:
Tento dokument byl přeložen pomocí AI překladatelské služby Co-op Translator (https://github.com/Azure/co-op-translator). I když usilujeme o přesnost, vezměte prosím na vědomí, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho originálním jazyce by měl být považován za autoritativní zdroj. Pro zásadní informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za žádná nedorozumění ani nesprávné interpretace vyplývající z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->