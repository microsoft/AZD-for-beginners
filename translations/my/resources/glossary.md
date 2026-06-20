# Glossary - Azure and AZD Terminology

**Reference for All Chapters**
- **📚 သင်တန်း မူလစာမျက်နှာ**: [AZD For Beginners](../README.md)
- **📖 အခြေခံများ လေ့လာရန်**: [Chapter 1: AZD Basics](../docs/getting-started/azd-basics.md)
- **🤖 AI ဆိုင်ရာ သတ်မှတ်ချက်များ**: [Chapter 2: AI-First Development](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## Introduction

ဒီ အကျဉ်းချုံး အဘိဓာန်မှာ Azure Developer CLI နှင့် Azure cloud ဖွံ့ဖြိုးရေးတွင် အသုံးများသော အချက်အလက်များ၊ သင်္ကေတများနှင့် အက်ခ္ခရိုနီမ်များအတွက် အဓိပ္ပာယ်ရှင်းလင်းချက်များကို ပေးထားသည်။ နည်းပညာအရ လက်စွဲစာတမ်းများကို နားလည်ရန်၊ ပြဿနာဖြေရှင်းရာတွင် အသုံးချရန်နှင့် azd ပရောဂျက်များနှင့် Azure ဝန်ဆောင်မှုများအကြောင်း ထိထိရောက်ရောက် ဆက်သွယ်ဆွေးနွေးရာတွင် မရှိမဖြစ်အထောက်အကူဖြစ်မည့် အရင်းအမြစ်ဖြစ်သည်။

## Learning Goals

ဤ အဘိဓာန်ကို အသုံးပြုခြင်းဖြင့် သင်သည်:
- Azure Developer CLI အတွက် အဓိက သတ်မွတ်ချက်များနှင့် အယူအဆများကို နားလည်ပါလိမ့်မည်
- Azure cloud ဖွံ့ဖြိုးရေး ရဲ့ ပုံစံနှင့် နည်းပညာဆိုင်ရာ အသုံးအနှုန်းများကို ကျွမ်းကျင်ပါလိမ့်မည်
- Infrastructure as Code နှင့် deployment သတ်မှတ်ချက်များကို ထိရောက်စွာ ရှာဖွေကြည့်ရမှာ နားလည်နိုင်ပါလိမ့်မည်
- Azure ဝန်ဆောင်မှုအမည်များ၊ အက်ခ္ခရိုနီမ်များနှင့် ၎င်းတို့၏ ရည်ရွယ်ချက်များကို သိရှိနိုင်ပါလိမ့်မည်
- ပြဿနာရှာဖွေရေးနှင့် debugging သတ်မှတ်ချက်များအတွက် အဓိပ္ပာယ်ရှင်းလင်းချက်များကို ရယူနိုင်ပါလိမ့်မည်
- Azure ကိုယ်ပိုင် ဖွဲ့စည်းပုံနှင့် ဖွံ့ဖြိုးရေး အဆင့်မြင့် အယူအဆများကို သင်ယူနိုင်ပါလိမ့်မည်

## Learning Outcomes

ဤ အဘိဓာန်ကို အကြိမ်ကြိမ် ကိုးကားသုံးသပ်ခြင်းဖြင့် သင်သည်:
- မိမိ၏ ဆက်သွယ်မှုများတွင် သတ်မှတ်ထားသော Azure Developer CLI နည်းပညာအသုံးအနှုန်းများကို ထိထိရောက်ရောက် အသုံးပြုနိုင်မည်
- နည်းပညာ လက်စွဲစာတမ်းများနှင့် အမှားမက်ဆေ့ချ်များကို ပိုမိုရှင်းလင်းစွာ နားလည်နိုင်မည်
- Azure ဝန်ဆောင်မှုများနှင့် အယူအဆများကို ယုံကြည်စိတ်ချစွာ ရွေ့လျားနိုင်မည်
- သတ်မှတ်ထားသော နည်းပညာစကားလုံးများကို အသုံးပြုကာ ပြဿနာများကို ဖြေရှင်းနိုင်မည်
- အသင်းအဖွဲ့ ဆွေးနွေးပွဲများတွင် တိကျသော နည်းပညာဘာသာစကားဖြင့် ထောက်ပံ့မှု ပေးနိုင်မည်
- သွားလာပေးထားသည့် Azure cloud ဖွံ့ဖြိုးရေး အသိပညာကို စနစ်တကျ တိုးချဲ့နိုင်မည်

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
| AAD | Azure Active Directory (now Microsoft Entra ID) | Identity and access management service |
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
| Search | Azure AI Search | `search` |
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
**ပြောကြားချက်**
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးပမ်းနေသော်လည်း၊ စက်ကိရိယာဘာသာပြန်ခြင်းများတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါဝင်နိုင်ကြောင်း သတိပြုပါရန် လိုအပ်ပါသည်။ မူလစာတမ်းကို မူရင်းဘာသာဖြင့်သာ ယုံကြည်စိတ်ချရသော အချက်အလက်အဖြစ် သတ်မှတ်သင့်သည်။ အရေးကြီးသည့် သတင်းအချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူသားဘာသာပြန်သူဝန်ဆောင်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော နားလည်မှုကွာခြားမှုများ သို့မဟုတ် မမှန်ကန်သော အသုံးပြုမှုများအတွက် ကျွန်ုပ်တို့ တာဝန်မခံပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->