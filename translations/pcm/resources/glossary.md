# Glossary - Azure and AZD Terminology

**Reference for All Chapters**
- **📚 Course Home**: [AZD For Beginners](../README.md)
- **📖 Learn Basics**: [Chapter 1: AZD Basics](../docs/getting-started/azd-basics.md)
- **🤖 AI Terms**: [Chapter 2: AI-First Development](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## Introduction

Dis complete glossary dey give meaning for terms, concepts, and acronyms wey dem dey use for Azure Developer CLI and Azure cloud development. Na important reference to help you understand technical docs, solve wahala, and talk well about azd projects and Azure services.

## Learning Goals

If you dey use dis glossary, you go:
- Understand important Azure Developer CLI terminology and concepts
- Master Azure cloud development vocabulary and technical terms
- Refer Infrastructure as Code and deployment terminology quick
- Understand Azure service names, acronyms, and wetin dem dey do
- Get definitions wey fit help for troubleshooting and debugging
- Learn advanced Azure architecture and development concepts

## Learning Outcomes

If you dey refer this glossary regular, you go fit:
- Talk correct using proper Azure Developer CLI terminology
- Understand technical documentation and error messages well well
- Find your way around Azure services and concepts with confidence
- Troubleshoot problems using correct technical words
- Join team discussions with accurate technical language
- Grow your Azure cloud development knowledge step-by-step

## A

**ARM Template**  
Azure Resource Manager template. JSON-based Infrastructure as Code format wey dem dey use to define and deploy Azure resources declaratively.

**App Service**  
Azure's platform-as-a-service (PaaS) offering for hosting web applications, REST APIs, and mobile backends without you managing infrastructure.

**Application Insights**  
Azure's application performance monitoring (APM) service wey dey give deep insight into application performance, availability, and usage.

**Azure CLI**  
Command-line interface for managing Azure resources. na wetin azd dey use for authentication and some operations.

**Azure Developer CLI (azd)**  
Developer-centric command-line tool wey dey accelerate the process of building and deploying applications to Azure using templates and Infrastructure as Code.

**azure.yaml**  
Di main configuration file for an azd project wey dey define services, infrastructure, and deployment hooks.

**Azure Resource Manager (ARM)**  
Azure's deployment and management service wey dey provide management layer for creating, updating, and deleting resources.

## B

**Bicep**  
Domain-specific language (DSL) wey Microsoft develop for deploying Azure resources. E get simpler syntax pass ARM templates but e still compile go ARM.

**Build**  
Di process of compiling source code, installing dependencies, and preparing applications for deployment.

**Blue-Green Deployment**  
Deployment strategy wey dey use two identical production environments (blue and green) to reduce downtime and risk.

## C

**Container Apps**  
Azure's serverless container service wey allow you run containerized applications without managing complex infrastructure.

**CI/CD**  
Continuous Integration/Continuous Deployment. Automated practices for integrating code changes and deploying applications.

**Cosmos DB**  
Azure's globally distributed, multi-model database service wey dey give strong SLAs for throughput, latency, availability, and consistency.

**Configuration**  
Settings and parameters wey dey control application behavior and deployment options.

## D

**Deployment**  
Di process of installing and configuring applications and their dependencies on target infrastructure.

**Docker**  
Platform for developing, shipping, and running applications using containerization technology.

**Dockerfile**  
Text file wey get instructions for building a Docker container image.

## E

**Environment**  
A deployment target wey represent a specific instance of your application (for example, development, staging, production).

**Environment Variables**  
Configuration values wey dem store as key-value pairs wey applications fit access at runtime.

**Endpoint**  
URL or network address wey people or services fit use to access an application or service.

## F

**Function App**  
Azure's serverless compute service wey allow you run event-driven code without managing infrastructure.

## G

**GitHub Actions**  
CI/CD platform wey dey integrate with GitHub repositories to automate workflows.

**Git**  
Distributed version control system wey dem dey use to track changes for source code.

## H

**Hooks**  
Custom scripts or commands wey dey run at specific points during deployment lifecycle (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Di Azure service type wey application go deploy to (for example, appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Practice of defining and managing infrastructure using code instead of manual steps.

**Init**  
Di process of initializing new azd project, normally from a template.

## J

**JSON**  
JavaScript Object Notation. Data interchange format wey dem dey use for configuration files and API responses.

**JWT**  
JSON Web Token. Standard for securely transmitting information between parties as a JSON object.

## K

**Key Vault**  
Azure service wey dey securely store and manage secrets, keys, and certificates.

**Kusto Query Language (KQL)**  
Query language wey dem dey use for analyzing data for Azure Monitor, Application Insights, and other Azure services.

## L

**Load Balancer**  
Service wey dey distribute incoming network traffic across multiple servers or instances.

**Log Analytics**  
Azure service for collecting, analyzing, and acting on telemetry data from cloud and on-premises environments.

## M

**Managed Identity**  
Azure feature wey provide Azure services with automatically managed identity for authenticating to other Azure services.

**Microservices**  
Architectural approach wey applications dey build as collection of small, independent services.

**Monitor**  
Azure's unified monitoring solution wey dey provide full-stack observability across applications and infrastructure.

## N

**Node.js**  
JavaScript runtime wey dem build on Chrome's V8 JavaScript engine for building server-side applications.

**npm**  
Package manager for Node.js wey dey manage dependencies and packages.

## O

**Output**  
Values wey deployment of infrastructure return wey applications or other resources fit use.

## P

**Package**  
Di process of preparing application code and dependencies for deployment.

**Parameters**  
Input values wey dem pass to infrastructure templates to customize deployments.

**PostgreSQL**  
Open-source relational database system wey Azure support as managed service.

**Provisioning**  
Di process of creating and configuring Azure resources wey dey defined in infrastructure templates.

## Q

**Quota**  
Limits on how much resources fit create for an Azure subscription or region.

## R

**Resource Group**  
Logical container for Azure resources wey share same lifecycle, permissions, and policies.

**Resource Token**  
Unique string wey azd generate to make resource names unique across deployments.

**REST API**  
Architectural style for designing networked applications using HTTP methods.

**Rollback**  
Process of returning to previous version of an application or infrastructure configuration.

## S

**Service**  
Component of your application wey dem define inside azure.yaml (for example, web frontend, API backend, database).

**SKU**  
Stock Keeping Unit. E represent different service tiers or performance levels for Azure resources.

**SQL Database**  
Azure's managed relational database service wey base on Microsoft SQL Server.

**Static Web Apps**  
Azure service for building and deploying full-stack web applications from source code repositories.

**Storage Account**  
Azure service wey provide cloud storage for data objects like blobs, files, queues, and tables.

**Subscription**  
Azure account container wey hold resource groups and resources, plus billing and access management.

## T

**Template**  
Pre-built project structure wey get application code, infrastructure definitions, and configuration for common scenarios.

**Terraform**  
Open-source Infrastructure as Code tool wey support many cloud providers including Azure.

**Traffic Manager**  
Azure's DNS-based traffic load balancer wey dey distribute traffic across global Azure regions.

## U

**URI**  
Uniform Resource Identifier. String wey identify particular resource.

**URL**  
Uniform Resource Locator. Type of URI wey specify where a resource dey and how to get am.

## V

**Virtual Network (VNet)**  
Fundamental building block for private networks for Azure, e dey give isolation and segmentation.

**VS Code**  
Visual Studio Code. Popular code editor wey get good Azure and azd integration.

## W

**Webhook**  
HTTP callback wey dey trigger when specific events happen, dem dey use am for CI/CD pipelines.

**What-if**  
Azure feature wey show wetin go change if you deploy, without actually executing the deployment.

## Y

**YAML**  
YAML Ain't Markup Language. Human-readable data serialization standard wey dem dey use for configuration files like azure.yaml.

## Z

**Zone**  
Physically separate locations inside an Azure region wey dey provide redundancy and high availability.

---

## Common Acronyms

| Acronym | Full Form | Description |
|---------|-----------|-------------|
| AAD | Azure Active Directory (now Microsoft Entra ID) | Identity and access management service |
| ACR | Azure Container Registry | Container image registry service |
| AKS | Azure Kubernetes Service | Managed Kubernetes service |
| API | Application Programming Interface | Set of protocols for building software |
| ARM | Azure Resource Manager | Azure's deployment and management service |
| CDN | Content Delivery Network | Distributed network of servers wey dey deliver content nearer to users |
| CI/CD | Continuous Integration/Continuous Deployment | Automated development practices wey dey combine code and deploy am frequently |
| CLI | Command Line Interface | Text-based user interface wey you dey type commands for |
| DNS | Domain Name System | System wey dey translate domain names to IP addresses |
| HTTPS | Hypertext Transfer Protocol Secure | Secure version of HTTP |
| IaC | Infrastructure as Code | Managing infrastructure through code |
| JSON | JavaScript Object Notation | Data interchange format |
| JWT | JSON Web Token | Token format for secure information transmission |
| KQL | Kusto Query Language | Query language for Azure data services |
| RBAC | Role-Based Access Control | Access control method wey base on user roles |
| REST | Representational State Transfer | Architectural style for web services |
| SDK | Software Development Kit | Collection of development tools |
| SLA | Service Level Agreement | Commitment to service availability/performance |
| SQL | Structured Query Language | Language for managing relational databases |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Cryptographic protocols wey secure network communication |
| URI | Uniform Resource Identifier | String wey identify resource |
| URL | Uniform Resource Locator | Type of URI wey specify resource location |
| VM | Virtual Machine | Emulation of a computer system |
| VNet | Virtual Network | Private network for Azure |
| YAML | YAML Ain't Markup Language | Data serialization standard |

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
| Search | Azure AI Search | `search` |
| Messaging | Azure Service Bus | `servicebus` |

---

## Context-Specific Terms

### Development Terms
- **Hot Reload**: Automatically dey update applications during development without restart
- **Build Pipeline**: Automated process for building and testing code
- **Deployment Slot**: Staging environment wey dey inside an App Service
- **Environment Parity**: Make development, staging, and production environments dey similar

### Security Terms
- **Managed Identity**: Azure feature wey dey provide automatic credential management
- **Key Vault**: Secure storage for secrets, keys, and certificates
- **RBAC**: Role-based access control for Azure resources
- **Network Security Group**: Virtual firewall wey dey control network traffic

### Monitoring Terms
- **Telemetry**: Automated collection of measurements and data
- **Application Performance Monitoring (APM)**: Monitoring software performance
- **Log Analytics**: Service for collecting and analyzing log data
- **Alert Rules**: Automated notifications wey dey fire based on metrics or conditions

### Deployment Terms
- **Blue-Green Deployment**: Zero-downtime deployment strategy
- **Canary Deployment**: Gradual rollout to small group of users
- **Rolling Update**: Sequential replacement of application instances
- **Rollback**: Reverting back to previous application version

---

**Usage Tip**: Use `Ctrl+F` to quickly search for specific terms in this glossary. Terms dey cross-reference where e make sense.

---

**Navigation**
- **Previous Lesson**: [Cheat Sheet](cheat-sheet.md)
- **Next Lesson**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dis document don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even tho we dey try make am correct, abeg make you know say automated translation fit get errors or mistakes. Di original document for dia own language na im be di correct source. For important info, make person wey sabi human translation do am. We no go responsible for any misunderstanding or wrong understanding wey fit happen because of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->