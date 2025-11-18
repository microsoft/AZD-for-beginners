<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "f16d2988a24670d1b6aa2372de1a231a",
  "translation_date": "2025-11-18T19:09:46+00:00",
  "source_file": "resources/glossary.md",
  "language_code": "pcm"
}
-->
# Glossary - Azure and AZD Terminology

**Reference for All Chapters**
- **📚 Course Home**: [AZD For Beginners](../README.md)
- **📖 Learn Basics**: [Chapter 1: AZD Basics](../docs/getting-started/azd-basics.md)
- **🤖 AI Terms**: [Chapter 2: AI-First Development](../docs/ai-foundry/azure-ai-foundry-integration.md)

## Introduction

Dis glossary na full list wey explain di meaning of di terms, ideas, and short forms wey dem dey use for Azure Developer CLI and Azure cloud development. E go help you sabi di technical docs, solve wahala, and talk well about azd projects and Azure services.

## Learning Goals

If you dey use dis glossary, you go:
- Sabi di main terms and ideas for Azure Developer CLI
- Master di words and technical terms for Azure cloud development
- Fit use Infrastructure as Code and deployment terms well
- Understand di names, short forms, and wetin Azure services dey do
- Get di meaning of terms wey dey help for troubleshooting and debugging
- Learn di advanced ideas for Azure architecture and development

## Learning Outcomes

If you dey check dis glossary often, you go fit:
- Talk well using correct Azure Developer CLI terms
- Understand technical docs and error messages better
- Move around Azure services and ideas with confidence
- Solve wahala using di right technical words
- Join team discussions with correct technical language
- Grow your knowledge for Azure cloud development step by step

## A

**ARM Template**  
Azure Resource Manager template. JSON-based Infrastructure as Code format wey dem dey use to define and deploy Azure resources.

**App Service**  
Azure platform-as-a-service (PaaS) wey dey host web apps, REST APIs, and mobile backends without you managing di infrastructure.

**Application Insights**  
Azure service wey dey monitor app performance, availability, and usage.

**Azure CLI**  
Command-line tool wey dey manage Azure resources. azd dey use am for authentication and some operations.

**Azure Developer CLI (azd)**  
Developer-friendly command-line tool wey dey make am easy to build and deploy apps to Azure using templates and Infrastructure as Code.

**azure.yaml**  
Di main config file for azd project wey dey define services, infrastructure, and deployment hooks.

**Azure Resource Manager (ARM)**  
Azure service wey dey help manage and deploy resources.

## B

**Bicep**  
Microsoft language wey dey make am easy to deploy Azure resources. E simple pass ARM templates but e dey compile to ARM.

**Build**  
Di process wey dey compile code, install dependencies, and prepare apps for deployment.

**Blue-Green Deployment**  
Deployment strategy wey dey use two production environments (blue and green) to reduce downtime and risk.

## C

**Container Apps**  
Azure serverless container service wey dey run containerized apps without you managing di infrastructure.

**CI/CD**  
Continuous Integration/Continuous Deployment. Automated way to dey integrate code changes and deploy apps.

**Cosmos DB**  
Azure global database service wey dey support different models and dey give strong SLAs for throughput, latency, availability, and consistency.

**Configuration**  
Settings and parameters wey dey control how app go behave and deployment options.

## D

**Deployment**  
Di process wey dey install and configure apps and di things wey dem need for di infrastructure.

**Docker**  
Platform wey dey help develop, ship, and run apps using container technology.

**Dockerfile**  
Text file wey get instructions for building Docker container image.

## E

**Environment**  
Di deployment target wey represent one instance of your app (e.g., development, staging, production).

**Environment Variables**  
Key-value pairs wey dey store config values wey app fit use when e dey run.

**Endpoint**  
URL or network address wey you fit use access app or service.

## F

**Function App**  
Azure serverless compute service wey dey run event-driven code without you managing di infrastructure.

## G

**GitHub Actions**  
CI/CD platform wey dey work with GitHub repositories to automate workflows.

**Git**  
Distributed version control system wey dey track changes for source code.

## H

**Hooks**  
Custom scripts or commands wey dey run for specific points during deployment lifecycle (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Di Azure service type wey app go dey deploy to (e.g., appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Di way wey people dey define and manage infrastructure through code instead of manual processes.

**Init**  
Di process wey dey start new azd project, usually from template.

## J

**JSON**  
JavaScript Object Notation. Format wey people dey use for config files and API responses.

**JWT**  
JSON Web Token. Standard wey dey help transmit information securely between people as JSON object.

## K

**Key Vault**  
Azure service wey dey store and manage secrets, keys, and certificates securely.

**Kusto Query Language (KQL)**  
Query language wey dey analyze data for Azure Monitor, Application Insights, and other Azure services.

## L

**Load Balancer**  
Service wey dey share incoming network traffic across many servers or instances.

**Log Analytics**  
Azure service wey dey collect, analyze, and act on telemetry data from cloud and on-premises environments.

## M

**Managed Identity**  
Azure feature wey dey give Azure services automatic identity to authenticate to other Azure services.

**Microservices**  
Di way wey people dey build apps as small, independent services.

**Monitor**  
Azure monitoring solution wey dey give full-stack observability across apps and infrastructure.

## N

**Node.js**  
JavaScript runtime wey dey use Chrome V8 engine to build server-side apps.

**npm**  
Package manager for Node.js wey dey manage dependencies and packages.

## O

**Output**  
Values wey dey come from infrastructure deployment wey apps or other resources fit use.

## P

**Package**  
Di process wey dey prepare app code and dependencies for deployment.

**Parameters**  
Input values wey dey pass to infrastructure templates to customize deployments.

**PostgreSQL**  
Open-source relational database system wey Azure dey support as managed service.

**Provisioning**  
Di process wey dey create and configure Azure resources wey dey defined for infrastructure templates.

## Q

**Quota**  
Limits wey dey for di amount of resources wey you fit create for Azure subscription or region.

## R

**Resource Group**  
Logical container wey dey hold Azure resources wey get di same lifecycle, permissions, and policies.

**Resource Token**  
Unique string wey azd dey generate to make sure resource names dey unique across deployments.

**REST API**  
Style for designing networked apps using HTTP methods.

**Rollback**  
Di process wey dey go back to di previous version of app or infrastructure config.

## S

**Service**  
One part of your app wey dey defined for azure.yaml (e.g., web frontend, API backend, database).

**SKU**  
Stock Keeping Unit. E represent di different service tiers or performance levels for Azure resources.

**SQL Database**  
Azure managed relational database service wey dey use Microsoft SQL Server.

**Static Web Apps**  
Azure service wey dey build and deploy full-stack web apps from source code repositories.

**Storage Account**  
Azure service wey dey provide cloud storage for data objects like blobs, files, queues, and tables.

**Subscription**  
Azure account container wey dey hold resource groups and resources, with billing and access management.

## T

**Template**  
Pre-built project structure wey get app code, infrastructure definitions, and config for common scenarios.

**Terraform**  
Open-source Infrastructure as Code tool wey dey support many cloud providers including Azure.

**Traffic Manager**  
Azure DNS-based traffic load balancer wey dey share traffic across global Azure regions.

## U

**URI**  
Uniform Resource Identifier. String wey dey identify one resource.

**URL**  
Uniform Resource Locator. Type of URI wey dey show where resource dey and how to get am.

## V

**Virtual Network (VNet)**  
Di main building block for private networks for Azure, e dey provide isolation and segmentation.

**VS Code**  
Visual Studio Code. Popular code editor wey dey work well with Azure and azd.

## W

**Webhook**  
HTTP callback wey dey trigger when specific events happen, e dey common for CI/CD pipelines.

**What-if**  
Azure feature wey dey show wetin go change for deployment without actually running am.

## Y

**YAML**  
YAML Ain't Markup Language. Human-readable format wey people dey use for config files like azure.yaml.

## Z

**Zone**  
Separate physical locations inside Azure region wey dey provide redundancy and high availability.

---

## Common Acronyms

| Acronym | Full Form | Description |
|---------|-----------|-------------|
| AAD | Azure Active Directory | Identity and access management service |
| ACR | Azure Container Registry | Container image registry service |
| AKS | Azure Kubernetes Service | Managed Kubernetes service |
| API | Application Programming Interface | Set of protocols for building software |
| ARM | Azure Resource Manager | Azure deployment and management service |
| CDN | Content Delivery Network | Distributed network of servers |
| CI/CD | Continuous Integration/Continuous Deployment | Automated development practices |
| CLI | Command Line Interface | Text-based user interface |
| DNS | Domain Name System | System wey dey translate domain names to IP addresses |
| HTTPS | Hypertext Transfer Protocol Secure | Secure version of HTTP |
| IaC | Infrastructure as Code | Managing infrastructure through code |
| JSON | JavaScript Object Notation | Data interchange format |
| JWT | JSON Web Token | Token format for secure information transmission |
| KQL | Kusto Query Language | Query language for Azure data services |
| RBAC | Role-Based Access Control | Access control method based on user roles |
| REST | Representational State Transfer | Style for web services |
| SDK | Software Development Kit | Collection of development tools |
| SLA | Service Level Agreement | Commitment to service availability/performance |
| SQL | Structured Query Language | Language for managing relational databases |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Cryptographic protocols |
| URI | Uniform Resource Identifier | String wey dey identify resource |
| URL | Uniform Resource Locator | Type of URI wey dey show resource location |
| VM | Virtual Machine | Emulation of computer system |
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
| Search | Azure Cognitive Search | `search` |
| Messaging | Azure Service Bus | `servicebus` |

---

## Context-Specific Terms

### Development Terms
- **Hot Reload**: E dey update apps automatically during development without restart
- **Build Pipeline**: Automated process wey dey build and test code
- **Deployment Slot**: Staging environment inside App Service
- **Environment Parity**: Making sure development, staging, and production environments dey similar

### Security Terms
- **Managed Identity**: Azure feature wey dey manage credentials automatically
- **Key Vault**: Secure place for secrets, keys, and certificates
- **RBAC**: Role-based access control for Azure resources
- **Network Security Group**: Virtual firewall wey dey control network traffic

### Monitoring Terms
- **Telemetry**: Automated way to collect measurements and data
- **Application Performance Monitoring (APM)**: Monitoring how software dey perform
- **Log Analytics**: Service wey dey collect and analyze log data
- **Alert Rules**: Notifications wey dey trigger based on metrics or conditions

### Deployment Terms
- **Blue-Green Deployment**: Deployment strategy wey no dey cause downtime
- **Canary Deployment**: Gradual rollout to small group of users
- **Rolling Update**: Sequential replacement of app instances
- **Rollback**: Going back to di previous version of app

---

**Usage Tip**: Use `Ctrl+F` to quickly find di term wey you dey look for inside dis glossary. Terms dey cross-referenced where e dey necessary.

---

**Navigation**
- **Previous Lesson**: [Cheat Sheet](cheat-sheet.md)
- **Next Lesson**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Dis dokyument don use AI transleshion service [Co-op Translator](https://github.com/Azure/co-op-translator) do di transleshion. Even as we dey try make am accurate, abeg make you sabi say machine transleshion fit get mistake or no dey correct well. Di original dokyument wey dey for im native language na di main source wey you go fit trust. For important mata, e good make you use professional human transleshion. We no go fit take blame for any misunderstanding or wrong interpretation wey fit happen because you use dis transleshion.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->