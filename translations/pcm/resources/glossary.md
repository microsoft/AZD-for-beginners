# Glossary - Azure and AZD Terminology

**Reference for All Chapters**
- **📚 Course Home**: [AZD For Beginners](../README.md)
- **📖 Learn Basics**: [Chapter 1: AZD Basics](../docs/chapter-01-foundation/azd-basics.md)
- **🤖 AI Terms**: [Chapter 2: AI-First Development](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduction

Dis full glossary na for define terms, concepts, and acronyms wey dem dey use for Azure Developer CLI and Azure cloud development. E important reference to sabi technical documentation, troubleshoot problem, and communicate well about azd projects and Azure services.

## Learning Goals

If you use dis glossary, you go:
- Understand important Azure Developer CLI terminology and concepts
- Master Azure cloud development vocabulary and tech terms
- Reference Infrastructure as Code and deployment terminology correct correct
- Comprehend Azure service names, acronyms, and wetin dem mean
- Access definitions for troubleshooting and debugging talk dem
- Learn better Azure architecture and development concepts

## Learning Outcomes

If you dey use dis glossary often, you go fit:
- Talk well well using correct Azure Developer CLI terminology
- Understand technical documentation and error messages sharp sharp
- Sabi how to waka inside Azure services and concepts with confidence
- Solve wahala using correct technical words
- Take part for team talks with correct technical language
- Grow your Azure cloud development knowledge step by step

## A

**ARM Template**  
Azure Resource Manager template. Na JSON-based Infrastructure as Code format wey dem dey use to define and deploy Azure resources for clear way.

**App Service**  
Azure platform-as-a-service (PaaS) wey dem dey use to host web applications, REST APIs, and mobile backends without managing infrastructure.

**Application Insights**  
Azure application performance monitoring (APM) service wey dey give deep insights inside how application dey perform, availability, and how people dey use am.

**Azure CLI**  
Command-line interface wey dem dey use to manage Azure resources. E dey complement AZD but get separate login; core AZD dey use `azd auth login` for authentication.

**Azure Developer CLI (azd)**  
Developer-centered command-line tool wey dey quicken how you take build and deploy applications to Azure using templates and Infrastructure as Code.

**azure.yaml**  
Main configuration file for azd project wey dey define services, infrastructure, and deployment hooks.

**Azure Resource Manager (ARM)**  
Azure deployment and management service wey dey manage how you go create, update, and delete resources.

## B

**Bicep**  
Domain-specific language (DSL) wey Microsoft create for deploying Azure resources. E get easier syntax pass ARM templates and e still dey compile go ARM.

**Build**  
Process to compile source code, install dependencies, and prepare applications to deploy.

**Blue-Green Deployment**  
Deployment strategy wey use two exact same production environments (blue and green) to reduce downtime and risk.

## C

**Container Apps**  
Azure serverless container service wey allow you run containerized applications without managing complex infrastructure.

**CI/CD**  
Continuous Integration/Continuous Deployment. Na automated ways to integrate code changes and deploy applications.

**Cosmos DB**  
Azure globally spread, multi-model database service wey dey provide strong SLAs for throughput, latency, availability, and consistency.

**Configuration**  
Settings and parameters wey control how application dey behave and deployment options.

## D

**Deployment**  
Process to install and configure applications and their dependencies for the target infrastructure.

**Docker**  
Platform to develop, ship, and run applications using containerization technology.

**Dockerfile**  
Text file wey get instructions for building Docker container image.

## E

**Environment**  
Deployment target wey mean one exact instance of your application (like development, staging, production).

**Environment Variables**  
Configuration values wey store as key-value pairs wey applications fit use during runtime.

**Endpoint**  
URL or network address wey you fit access application or service for there.

## F

**Function App**  
Azure serverless compute service wey allow you run event-driven code without managing infrastructure.

## G

**GitHub Actions**  
CI/CD platform wey integrate with GitHub repositories for automate workflows.

**Git**  
Distributed version control system wey dem dey use track changes for source code.

## H

**Hooks**  
Custom scripts or commands wey run for special points during deployment lifecycle (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Azure service type wey application go deploy to (e.g., appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Practice wey mean to define and manage infrastructure through code instead of manual process.

**Init**  
Process to start new azd project, usually from template.

## J

**JSON**  
JavaScript Object Notation. Data interchange format wey dem dey use for configuration files and API responses.

**JWT**  
JSON Web Token. Standard to pass information securely between parties as JSON object.

## K

**Key Vault**  
Azure service wey dey store and manage secrets, keys, and certificates securely.

**Kusto Query Language (KQL)**  
Query language wey dem use analyze data for Azure Monitor, Application Insights, and other Azure services.

## L

**Load Balancer**  
Service wey distribute incoming network traffic across many servers or instances.

**Log Analytics**  
Azure service wey collect, analyze, and act based on telemetry data from cloud and on-premises environment dem.

## M

**Managed Identity**  
Azure feature wey give Azure services automatic identity for authentication to other Azure services.

**Microservices**  
Architecture wey mean build applications from small, independent services.

**Monitor**  
Azure unified monitoring solution wey provide full-stack observability for applications and infrastructure.

## N

**Node.js**  
JavaScript runtime wey dem build on top Chrome V8 JavaScript engine for server-side applications.

**npm**  
Package manager for Node.js wey dey manage dependencies and packages.

## O

**Output**  
Values wey infrastructure deployment return wey applications or other resources fit use.

## P

**Package**  
Process to prepare application code and dependencies for deployment.

**Parameters**  
Input values wey dem pass to infrastructure templates to change how deployment go be.

**PostgreSQL**  
Open-source relational database system wey Azure dey support as managed service.

**Provisioning**  
Process to create and configure Azure resources wey infrastructure templates define.

## Q

**Quota**  
Limit wey dem set for how much resources person fit create for Azure subscription or region.

## R

**Resource Group**  
Logical container for Azure resources wey share same lifecycle, permissions, and policies.

**Resource Token**  
Unique string wey azd dey generate to make sure resource names no dey duplicate for deployments.

**REST API**  
Architectural style to design networked applications using HTTP methods.

**Rollback**  
Process to go back to previous version of application or infrastructure configuration.

## S

**Service**  
Part of your application wey you define for azure.yaml (e.g., web frontend, API backend, database).

**SKU**  
Stock Keeping Unit. E mean different service tiers or performance levels for Azure resources.

**SQL Database**  
Azure managed relational database service wey base on Microsoft SQL Server.

**Static Web Apps**  
Azure service wey dem use build and deploy full-stack web applications from source code repositories.

**Storage Account**  
Azure service wey provide cloud storage for data objects like blobs, files, queues, and tables.

**Subscription**  
Azure account container wey hold resource groups and resources, plus e get billing and access management.

## T

**Template**  
Pre-built project structure wey get application code, infrastructure definitions, and configuration for common use cases.

**Terraform**  
Open-source Infrastructure as Code tool wey support many cloud providers including Azure.

**Traffic Manager**  
Azure DNS-based traffic load balancer wey distribute traffic across global Azure regions.

## U

**URI**  
Uniform Resource Identifier. Na string wey identify one particular resource.

**URL**  
Uniform Resource Locator. Type of URI wey show where resource dey and how to find am.

## V

**Virtual Network (VNet)**  
Basic building block for private networks for Azure, wey provide isolation and segmentation.

**VS Code**  
Visual Studio Code. Popular code editor wey get better Azure and azd integration.

## W

**Webhook**  
HTTP callback wey dem trigger by specific events, usually for CI/CD pipelines.

**What-if**  
Azure feature wey show wetin changes deployment go bring without actually running am.

## Y

**YAML**  
YAML Ain't Markup Language. Na human-readable data serialization standard wey dem use for configuration files like azure.yaml.

## Z

**Zone**  
Different physical places inside one Azure region wey dey provide redundancy and better availability.

---

## Common Acronyms

| Acronym | Full Form | Description |
|---------|-----------|-------------|
| AAD | Azure Active Directory (now Microsoft Entra ID) | Identity and access management service |
| ACR | Azure Container Registry | Container image registry service |
| AKS | Azure Kubernetes Service | Managed Kubernetes service |
| API | Application Programming Interface | Set of protocols for building software |
| ARM | Azure Resource Manager | Azure deployment and management service |
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
| Database | Azure Database for PostgreSQL | Infrastructure resource, not an application `host` |
| NoSQL DB | Azure Cosmos DB | Infrastructure resource, not an application `host` |
| Storage | Azure Storage Account | Infrastructure resource, not a built-in application `host` |
| Cache | Azure Managed Redis | Infrastructure resource, not an application `host` |
| Search | Azure AI Search | Infrastructure resource, not an application `host` |
| Messaging | Azure Service Bus | Infrastructure resource, not an application `host` |

`services.<name>.host` selects an application deployment target; it is not a shorthand for any Azure resource type. Databases, caches, search services, and queues are normally provisioned through the infrastructure provider and connected to the application through outputs/configuration.

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

**Usage Tip**: Use `Ctrl+F` to quickly search for specific terms inside dis glossary. Terms dem go dey cross-referenced where e fit.

---

**Navigation**
- **Previous Lesson**: [Cheat Sheet](cheat-sheet.md)
- **Next Lesson**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dis document don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even tho we dey try make am correct, abeg make you know say automated translation fit get errors or mistakes. Di original document for dia own language na im be di correct source. For important info, make person wey sabi human translation do am. We no go responsible for any misunderstanding or wrong understanding wey fit happen because of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->