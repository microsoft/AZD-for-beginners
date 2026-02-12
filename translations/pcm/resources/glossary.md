# Glossary - Azure and AZD Terminology

**Reference for All Chapters**
- **📚 Course Home**: [AZD For Beginners](../README.md)
- **📖 Learn Basics**: [Chapter 1: AZD Basics](../docs/getting-started/azd-basics.md)
- **🤖 AI Terms**: [Chapter 2: AI-First Development](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## Introduction

Dis comprehensive glossary dey give meanings for terms, concepts, and acronyms wey dem dey use for Azure Developer CLI and Azure cloud development. Na important reference to help make technical documentation, troubleshoot wahala, and yan well about azd projects and Azure services.

## Learning Goals

By using dis glossary, you go:
- Understand important Azure Developer CLI termes and concepts
- Master Azure cloud development vocabulary and technical terms
- Refer Infrastructure as Code and deployment terminology sharp sharp
- Comprehend Azure service names, acronyms, and wetin dem dey do
- Access definitions wey go help for troubleshooting and debugging
- Learn advanced Azure architecture and development concepts

## Learning Outcomes

If you dey refer this glossary regular, you go fit:
- Communicate well using correct Azure Developer CLI terminology
- Understand technical documentation and error messages clear
- Move around Azure services and concepts with confidence
- Troubleshoot issues using the correct technical words
- Contribute for team discussions with accurate technical language
- Grow your Azure cloud development knowledge in organized way

## A

**ARM Template**  
Azure Resource Manager template. JSON-based Infrastructure as Code format wey dem dey use to define and deploy Azure resources declaratively.

**App Service**  
Azure's platform-as-a-service (PaaS) offering for hosting web applications, REST APIs, and mobile backends without managing infrastructure.

**Application Insights**  
Azure's application performance monitoring (APM) service wey dey give deep insight into how application dey perform, availability, and usage.

**Azure CLI**  
Command-line interface for managing Azure resources. Na wetin azd dey use for authentication and some operations.

**Azure Developer CLI (azd)**  
Developer-centered command-line tool wey dey speed up how person build and deploy applications to Azure using templates and Infrastructure as Code.

**azure.yaml**  
The main configuration file for an azd project wey dey define services, infrastructure, and deployment hooks.

**Azure Resource Manager (ARM)**  
Azure service wey dey handle deployment and management; e dey provide management layer for creating, updating, and deleting resources.

## B

**Bicep**  
Domain-specific language (DSL) wey Microsoft make for deploying Azure resources. E get simpler syntax pass ARM templates and e dey compile to ARM.

**Build**  
The process of compiling source code, installing dependencies, and preparing applications for deployment.

**Blue-Green Deployment**  
Deployment strategy wey dey use two identical production environments (blue and green) to reduce downtime and risk.

## C

**Container Apps**  
Azure's serverless container service wey allow you run containerized applications without managing complex infrastructure.

**CI/CD**  
Continuous Integration/Continuous Deployment. Na automated practices to integrate code changes and deploy applications.

**Cosmos DB**  
Azure's globally distributed, multi-model database service wey dey give strong SLAs for throughput, latency, availability, and consistency.

**Configuration**  
Settings and parameters wey control how application behave and deployment options.

## D

**Deployment**  
The process of installing and configuring applications and their dependencies on the target infrastructure.

**Docker**  
Platform for developing, shipping, and running applications using containerization technology.

**Dockerfile**  
Text file wey contain instructions for building a Docker container image.

## E

**Environment**  
Deployment target wey represent one specific instance of your application (for example, development, staging, production).

**Environment Variables**  
Configuration values wey dem store as key-value pairs wey applications fit access at runtime.

**Endpoint**  
URL or network address wey people fit use to reach an application or service.

## F

**Function App**  
Azure's serverless compute service wey make you run event-driven code without managing infrastructure.

## G

**GitHub Actions**  
CI/CD platform wey integrate with GitHub repositories to automate workflows.

**Git**  
Distributed version control system wey dem dey use to track changes for source code.

## H

**Hooks**  
Custom scripts or commands wey dey run for specific points during the deployment lifecycle (preprovision, postprovision, predeploy, postdeploy).

**Host**  
The Azure service type wey application go deploy for (for example, appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Practice wey dey define and manage infrastructure through code instead of doing am manually.

**Init**  
The process of initializing new azd project, normally from a template.

## J

**JSON**  
JavaScript Object Notation. Data interchange format wey people dey use for configuration files and API responses.

**JWT**  
JSON Web Token. Standard to securely send information between parties as a JSON object.

## K

**Key Vault**  
Azure service wey dey securely store and manage secrets, keys, and certificates.

**Kusto Query Language (KQL)**  
Query language wey dem dey use to analyze data for Azure Monitor, Application Insights, and other Azure services.

## L

**Load Balancer**  
Service wey dey distribute incoming network traffic across multiple servers or instances.

**Log Analytics**  
Azure service for collecting, analyzing, and acting on telemetry data from cloud and on-premises environments.

## M

**Managed Identity**  
Azure feature wey give Azure services automatic managed identity to authenticate to other Azure services.

**Microservices**  
Architecture approach wey make application as small, independent services.

**Monitor**  
Azure unified monitoring solution wey dey give full-stack observability across applications and infrastructure.

## N

**Node.js**  
JavaScript runtime wey build for Chrome's V8 engine for building server-side applications.

**npm**  
Package manager for Node.js wey dey manage dependencies and packages.

## O

**Output**  
Values wey infrastructure deployment return wey applications or other resources fit use.

## P

**Package**  
The process of preparing application code and dependencies for deployment.

**Parameters**  
Input values wey dem pass to infrastructure templates to customize deployments.

**PostgreSQL**  
Open-source relational database system wey Azure support as a managed service.

**Provisioning**  
The process of creating and configuring Azure resources wey definitions dey for infrastructure templates.

## Q

**Quota**  
Limits on how many resources person fit create for an Azure subscription or region.

## R

**Resource Group**  
Logical container for Azure resources wey share the same lifecycle, permissions, and policies.

**Resource Token**  
Unique string wey azd generate to make sure resource names remain unique across deployments.

**REST API**  
Architectural style for designing networked applications using HTTP methods.

**Rollback**  
Process of returning to previous version of application or infrastructure configuration.

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
Azure DNS-based traffic load balancer wey distribute traffic across global Azure regions.

## U

**URI**  
Uniform Resource Identifier. Na string wey identify particular resource.

**URL**  
Uniform Resource Locator. Type of URI wey tell where resource dey and how to fetch am.

## V

**Virtual Network (VNet)**  
Fundamental building block for private networks in Azure, wey provide isolation and segmentation.

**VS Code**  
Visual Studio Code. Popular code editor wey get strong Azure and azd integration.

## W

**Webhook**  
HTTP callback wey dey trigger by specific events, often used for CI/CD pipelines.

**What-if**  
Azure feature wey show wetin deployment go change before e actually run.

## Y

**YAML**  
YAML Ain't Markup Language. Human-readable data serialization standard wey dem dey use for configuration files like azure.yaml.

## Z

**Zone**  
Physically separate locations inside an Azure region wey provide redundancy and high availability.

---

## Common Acronyms

| Acronym | Full Form | Description |
|---------|-----------|-------------|
| AAD | Azure Active Directory | Identity and access management service |
| ACR | Azure Container Registry | Container image registry service |
| AKS | Azure Kubernetes Service | Managed Kubernetes service |
| API | Application Programming Interface | Set of protocols for building software |
| ARM | Azure Resource Manager | Azure's deployment and management service |
| CDN | Content Delivery Network | Distributed network of servers |
| CI/CD | Continuous Integration/Continuous Deployment | Automated development practices |
| CLI | Command Line Interface | Text-based user interface |
| DNS | Domain Name System | System for translating domain names to IP addresses |
| HTTPS | Hypertext Transfer Protocol Secure | Secure version of HTTP |
| IaC | Infrastructure as Code | Managing infrastructure through code |
| JSON | JavaScript Object Notation | Data interchange format |
| JWT | JSON Web Token | Token format for secure information transmission |
| KQL | Kusto Query Language | Query language for Azure data services |
| RBAC | Role-Based Access Control | Access control method based on user roles |
| REST | Representational State Transfer | Architectural style for web services |
| SDK | Software Development Kit | Collection of development tools |
| SLA | Service Level Agreement | Commitment to service availability/performance |
| SQL | Structured Query Language | Language for managing relational databases |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Cryptographic protocols |
| URI | Uniform Resource Identifier | String identifying a resource |
| URL | Uniform Resource Locator | Type of URI specifying resource location |
| VM | Virtual Machine | Emulation of a computer system |
| VNet | Virtual Network | Private network in Azure |
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
Disclaimer:
Dis document na AI translation wey dem do with Co-op Translator (https://github.com/Azure/co-op-translator). Even though we dey try make am correct, abeg note say automatic translations fit get errors or wrong parts. Di original document for im own language suppose be di official source. If na important information, make person wey sabi translate am do am (professional human translator). We no dey liable for any misunderstanding or wrong interpretation wey fit come from dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->