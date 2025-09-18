<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "f16d2988a24670d1b6aa2372de1a231a",
  "translation_date": "2025-09-18T12:54:37+00:00",
  "source_file": "resources/glossary.md",
  "language_code": "en"
}
-->
# Glossary - Azure and AZD Terminology

**Reference for All Chapters**
- **📚 Course Home**: [AZD For Beginners](../README.md)
- **📖 Learn Basics**: [Chapter 1: AZD Basics](../docs/getting-started/azd-basics.md)
- **🤖 AI Terms**: [Chapter 2: AI-First Development](../docs/ai-foundry/azure-ai-foundry-integration.md)

## Introduction

This detailed glossary explains terms, concepts, and acronyms related to Azure Developer CLI and Azure cloud development. It's a vital resource for understanding technical documentation, resolving issues, and discussing azd projects and Azure services effectively.

## Learning Goals

By using this glossary, you will:
- Grasp key Azure Developer CLI terms and concepts
- Become familiar with Azure cloud development vocabulary and technical jargon
- Efficiently reference Infrastructure as Code and deployment terminology
- Understand Azure service names, acronyms, and their functions
- Access definitions for debugging and troubleshooting terminology
- Explore advanced Azure architecture and development concepts

## Learning Outcomes

By regularly consulting this glossary, you will:
- Use accurate Azure Developer CLI terminology in communication
- Better understand technical documentation and error messages
- Confidently navigate Azure services and concepts
- Troubleshoot issues with the right technical vocabulary
- Contribute to team discussions with precise technical language
- Systematically expand your knowledge of Azure cloud development

## A

**ARM Template**  
Azure Resource Manager template. A JSON-based format for defining and deploying Azure resources declaratively.

**App Service**  
Azure's platform-as-a-service (PaaS) solution for hosting web apps, REST APIs, and mobile backends without infrastructure management.

**Application Insights**  
Azure's application performance monitoring (APM) service offering insights into app performance, availability, and usage.

**Azure CLI**  
Command-line interface for managing Azure resources, used by azd for authentication and certain operations.

**Azure Developer CLI (azd)**  
Developer-focused command-line tool that simplifies building and deploying applications to Azure using templates and Infrastructure as Code.

**azure.yaml**  
The main configuration file for an azd project, specifying services, infrastructure, and deployment hooks.

**Azure Resource Manager (ARM)**  
Azure's management and deployment service providing a layer for creating, updating, and deleting resources.

## B

**Bicep**  
A domain-specific language (DSL) by Microsoft for deploying Azure resources, offering simpler syntax than ARM templates while compiling to ARM.

**Build**  
The process of compiling code, installing dependencies, and preparing applications for deployment.

**Blue-Green Deployment**  
A deployment strategy using two identical production environments (blue and green) to reduce downtime and risk.

## C

**Container Apps**  
Azure's serverless container service for running containerized applications without complex infrastructure management.

**CI/CD**  
Continuous Integration/Continuous Deployment. Automated practices for integrating code changes and deploying applications.

**Cosmos DB**  
Azure's globally distributed, multi-model database service with comprehensive SLAs for throughput, latency, availability, and consistency.

**Configuration**  
Settings and parameters that control application behavior and deployment options.

## D

**Deployment**  
The process of installing and configuring applications and their dependencies on target infrastructure.

**Docker**  
A platform for developing, shipping, and running applications using containerization technology.

**Dockerfile**  
A text file with instructions for building a Docker container image.

## E

**Environment**  
A deployment target representing a specific instance of your application (e.g., development, staging, production).

**Environment Variables**  
Configuration values stored as key-value pairs that applications can access during runtime.

**Endpoint**  
A URL or network address where an application or service can be accessed.

## F

**Function App**  
Azure's serverless compute service for running event-driven code without infrastructure management.

## G

**GitHub Actions**  
A CI/CD platform integrated with GitHub repositories for automating workflows.

**Git**  
A distributed version control system for tracking changes in source code.

## H

**Hooks**  
Custom scripts or commands executed at specific points during the deployment lifecycle (preprovision, postprovision, predeploy, postdeploy).

**Host**  
The Azure service type where an application is deployed (e.g., appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
The practice of defining and managing infrastructure through code instead of manual processes.

**Init**  
The process of initializing a new azd project, typically using a template.

## J

**JSON**  
JavaScript Object Notation. A data interchange format commonly used for configuration files and API responses.

**JWT**  
JSON Web Token. A standard for securely transmitting information between parties as a JSON object.

## K

**Key Vault**  
Azure's service for securely storing and managing secrets, keys, and certificates.

**Kusto Query Language (KQL)**  
A query language for analyzing data in Azure Monitor, Application Insights, and other Azure services.

## L

**Load Balancer**  
A service that distributes incoming network traffic across multiple servers or instances.

**Log Analytics**  
Azure's service for collecting, analyzing, and acting on telemetry data from cloud and on-premises environments.

## M

**Managed Identity**  
An Azure feature providing services with an automatically managed identity for authenticating to other Azure services.

**Microservices**  
An architectural approach where applications are built as a collection of small, independent services.

**Monitor**  
Azure's unified monitoring solution offering full-stack observability across applications and infrastructure.

## N

**Node.js**  
A JavaScript runtime built on Chrome's V8 JavaScript engine for server-side application development.

**npm**  
A package manager for Node.js that handles dependencies and packages.

## O

**Output**  
Values returned from infrastructure deployment that can be used by applications or other resources.

## P

**Package**  
The process of preparing application code and dependencies for deployment.

**Parameters**  
Input values passed to infrastructure templates to customize deployments.

**PostgreSQL**  
An open-source relational database system supported as a managed service in Azure.

**Provisioning**  
The process of creating and configuring Azure resources defined in infrastructure templates.

## Q

**Quota**  
Limits on the amount of resources that can be created in an Azure subscription or region.

## R

**Resource Group**  
A logical container for Azure resources that share the same lifecycle, permissions, and policies.

**Resource Token**  
A unique string generated by azd to ensure resource names are unique across deployments.

**REST API**  
An architectural style for designing networked applications using HTTP methods.

**Rollback**  
The process of reverting to a previous version of an application or infrastructure configuration.

## S

**Service**  
A component of your application defined in azure.yaml (e.g., web frontend, API backend, database).

**SKU**  
Stock Keeping Unit. Represents different service tiers or performance levels for Azure resources.

**SQL Database**  
Azure's managed relational database service based on Microsoft SQL Server.

**Static Web Apps**  
Azure's service for building and deploying full-stack web applications from source code repositories.

**Storage Account**  
Azure's service providing cloud storage for data objects like blobs, files, queues, and tables.

**Subscription**  
An Azure account container holding resource groups and resources, with associated billing and access management.

## T

**Template**  
A pre-built project structure containing application code, infrastructure definitions, and configuration for common scenarios.

**Terraform**  
An open-source Infrastructure as Code tool supporting multiple cloud providers, including Azure.

**Traffic Manager**  
Azure's DNS-based traffic load balancer for distributing traffic across global Azure regions.

## U

**URI**  
Uniform Resource Identifier. A string identifying a particular resource.

**URL**  
Uniform Resource Locator. A type of URI specifying where a resource is located and how to retrieve it.

## V

**Virtual Network (VNet)**  
A fundamental building block for private networks in Azure, providing isolation and segmentation.

**VS Code**  
Visual Studio Code. A popular code editor with excellent Azure and azd integration.

## W

**Webhook**  
An HTTP callback triggered by specific events, commonly used in CI/CD pipelines.

**What-if**  
An Azure feature showing what changes would be made by a deployment without actually executing it.

## Y

**YAML**  
YAML Ain't Markup Language. A human-readable data serialization standard used for configuration files like azure.yaml.

## Z

**Zone**  
Physically separate locations within an Azure region providing redundancy and high availability.

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
- **Hot Reload**: Automatically updates applications during development without restarting.
- **Build Pipeline**: Automated process for building and testing code.
- **Deployment Slot**: Staging environment within an App Service.
- **Environment Parity**: Ensuring development, staging, and production environments are similar.

### Security Terms
- **Managed Identity**: Azure feature providing automatic credential management.
- **Key Vault**: Secure storage for secrets, keys, and certificates.
- **RBAC**: Role-based access control for Azure resources.
- **Network Security Group**: Virtual firewall for controlling network traffic.

### Monitoring Terms
- **Telemetry**: Automated collection of measurements and data.
- **Application Performance Monitoring (APM)**: Monitoring software performance.
- **Log Analytics**: Service for collecting and analyzing log data.
- **Alert Rules**: Automated notifications based on metrics or conditions.

### Deployment Terms
- **Blue-Green Deployment**: Zero-downtime deployment strategy.
- **Canary Deployment**: Gradual rollout to a subset of users.
- **Rolling Update**: Sequential replacement of application instances.
- **Rollback**: Reverting to a previous application version.

---

**Usage Tip**: Use `Ctrl+F` to quickly search for specific terms in this glossary. Terms are cross-referenced where applicable.

---

**Navigation**
- **Previous Lesson**: [Cheat Sheet](cheat-sheet.md)
- **Next Lesson**: [FAQ](faq.md)

---

**Disclaimer**:  
This document has been translated using the AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). While we aim for accuracy, please note that automated translations may include errors or inaccuracies. The original document in its native language should be regarded as the authoritative source. For critical information, professional human translation is advised. We are not responsible for any misunderstandings or misinterpretations resulting from the use of this translation.