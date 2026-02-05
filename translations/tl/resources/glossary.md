# Glossary - Azure at AZD Terminology

**Sanggunian para sa Lahat ng Kabanata**
- **📚 Course Home**: [AZD For Beginners](../README.md)
- **📖 Matutunan ang Mga Pangunahing Kaalaman**: [Kabanata 1: AZD Basics](../docs/getting-started/azd-basics.md)
- **🤖 Mga Terminong AI**: [Kabanata 2: AI-First Development](../docs/ai-foundry/azure-ai-foundry-integration.md)

## Panimula

Ang komprehensibong glossary na ito ay nagbibigay ng mga kahulugan para sa mga termino, konsepto, at akronim na ginagamit sa Azure Developer CLI at Azure cloud development. Mahalagang sanggunian para sa pag-unawa sa teknikal na dokumentasyon, pagresolba ng mga isyu, at epektibong pakikipag-usap tungkol sa mga proyekto ng azd at mga serbisyo ng Azure.

## Mga Layunin sa Pag-aaral

Sa paggamit ng glossary na ito, ikaw ay:
- Makakaunawa ng mahahalagang terminolohiya at konsepto ng Azure Developer CLI
- Magiging bihasa sa bokabularyo ng Azure cloud development at mga teknikal na termino
- Magagamit ang mga termino ng Infrastructure as Code at deployment nang epektibo
- Maiintindihan ang mga pangalan ng serbisyo ng Azure, mga akronim, at ang kanilang mga layunin
- Makakakuha ng mga kahulugan para sa troubleshooting at debugging terminology
- Matututo ng mga advanced na konsepto sa arkitektura at development ng Azure

## Mga Resulta ng Pag-aaral

Sa regular na paggamit ng glossary na ito, ikaw ay:
- Makakapag-usap nang epektibo gamit ang tamang terminolohiya ng Azure Developer CLI
- Mas malinaw na maiintindihan ang teknikal na dokumentasyon at mga error message
- Magiging kumpiyansa sa pag-navigate sa mga serbisyo at konsepto ng Azure
- Makakapagresolba ng mga isyu gamit ang angkop na teknikal na bokabularyo
- Makakapag-ambag sa mga talakayan ng team gamit ang tamang teknikal na wika
- Sistematikong mapapalawak ang iyong kaalaman sa Azure cloud development

## A

**ARM Template**  
Template ng Azure Resource Manager. JSON-based na format ng Infrastructure as Code na ginagamit para tukuyin at i-deploy ang mga resource ng Azure nang deklaratibo.

**App Service**  
Platform-as-a-service (PaaS) ng Azure para sa pagho-host ng mga web application, REST APIs, at mobile backends nang hindi kinakailangang pamahalaan ang imprastraktura.

**Application Insights**  
Serbisyo ng Azure para sa application performance monitoring (APM) na nagbibigay ng malalim na pananaw sa performance, availability, at paggamit ng application.

**Azure CLI**  
Command-line interface para sa pamamahala ng mga resource ng Azure. Ginagamit ng azd para sa authentication at ilang operasyon.

**Azure Developer CLI (azd)**  
Developer-centric na command-line tool na nagpapabilis sa proseso ng paggawa at pag-deploy ng mga application sa Azure gamit ang mga template at Infrastructure as Code.

**azure.yaml**  
Pangunahing configuration file para sa isang azd project na tumutukoy sa mga serbisyo, imprastraktura, at deployment hooks.

**Azure Resource Manager (ARM)**  
Serbisyo ng Azure para sa deployment at pamamahala na nagbibigay ng management layer para sa paglikha, pag-update, at pagtanggal ng mga resource.

## B

**Bicep**  
Domain-specific language (DSL) na binuo ng Microsoft para sa pag-deploy ng mga resource ng Azure. Nagbibigay ng mas simpleng syntax kaysa sa ARM templates habang nagko-compile sa ARM.

**Build**  
Proseso ng pag-compile ng source code, pag-install ng mga dependency, at paghahanda ng mga application para sa deployment.

**Blue-Green Deployment**  
Strategiya ng deployment na gumagamit ng dalawang magkaparehong production environment (blue at green) upang mabawasan ang downtime at panganib.

## C

**Container Apps**  
Serverless container service ng Azure na nagbibigay-daan sa pagtakbo ng mga containerized application nang hindi kinakailangang pamahalaan ang kumplikadong imprastraktura.

**CI/CD**  
Continuous Integration/Continuous Deployment. Mga automated na praktis para sa pag-integrate ng mga pagbabago sa code at pag-deploy ng mga application.

**Cosmos DB**  
Globally distributed, multi-model database service ng Azure na nagbibigay ng komprehensibong SLAs para sa throughput, latency, availability, at consistency.

**Configuration**  
Mga setting at parameter na kumokontrol sa behavior ng application at mga opsyon sa deployment.

## D

**Deployment**  
Proseso ng pag-install at pag-configure ng mga application at ang kanilang mga dependency sa target na imprastraktura.

**Docker**  
Platform para sa pag-develop, pag-ship, at pagtakbo ng mga application gamit ang containerization technology.

**Dockerfile**  
Text file na naglalaman ng mga instruksyon para sa pagbuo ng Docker container image.

## E

**Environment**  
Deployment target na kumakatawan sa isang partikular na instance ng iyong application (hal., development, staging, production).

**Environment Variables**  
Mga configuration value na nakaimbak bilang key-value pairs na maaaring ma-access ng mga application sa runtime.

**Endpoint**  
URL o network address kung saan maaaring ma-access ang isang application o serbisyo.

## F

**Function App**  
Serverless compute service ng Azure na nagbibigay-daan sa pagtakbo ng event-driven code nang hindi kinakailangang pamahalaan ang imprastraktura.

## G

**GitHub Actions**  
CI/CD platform na integrated sa GitHub repositories para sa pag-automate ng workflows.

**Git**  
Distributed version control system na ginagamit para sa pagsubaybay sa mga pagbabago sa source code.

## H

**Hooks**  
Mga custom script o command na tumatakbo sa mga partikular na punto sa deployment lifecycle (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Uri ng Azure service kung saan ide-deploy ang isang application (hal., appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Praktis ng pagtukoy at pamamahala ng imprastraktura sa pamamagitan ng code sa halip na manual na proseso.

**Init**  
Proseso ng pag-initialize ng bagong azd project, kadalasang mula sa isang template.

## J

**JSON**  
JavaScript Object Notation. Format ng data interchange na karaniwang ginagamit para sa mga configuration file at API responses.

**JWT**  
JSON Web Token. Pamantayan para sa ligtas na pagpapadala ng impormasyon sa pagitan ng mga partido bilang JSON object.

## K

**Key Vault**  
Serbisyo ng Azure para sa ligtas na pag-iimbak at pamamahala ng mga secrets, keys, at certificates.

**Kusto Query Language (KQL)**  
Query language na ginagamit para sa pagsusuri ng data sa Azure Monitor, Application Insights, at iba pang serbisyo ng Azure.

## L

**Load Balancer**  
Serbisyo na nagdi-distribute ng incoming network traffic sa maraming server o instance.

**Log Analytics**  
Serbisyo ng Azure para sa pagkolekta, pagsusuri, at pag-aksyon sa telemetry data mula sa cloud at on-premises environments.

## M

**Managed Identity**  
Feature ng Azure na nagbibigay sa mga serbisyo ng Azure ng awtomatikong managed identity para sa authentication sa iba pang serbisyo ng Azure.

**Microservices**  
Arkitektural na approach kung saan ang mga application ay binubuo bilang koleksyon ng maliliit, independent na serbisyo.

**Monitor**  
Unified monitoring solution ng Azure na nagbibigay ng full-stack observability sa mga application at imprastraktura.

## N

**Node.js**  
JavaScript runtime na binuo sa Chrome's V8 JavaScript engine para sa paggawa ng server-side applications.

**npm**  
Package manager para sa Node.js na namamahala sa mga dependency at package.

## O

**Output**  
Mga value na ibinabalik mula sa infrastructure deployment na maaaring gamitin ng mga application o iba pang resource.

## P

**Package**  
Proseso ng paghahanda ng application code at mga dependency para sa deployment.

**Parameters**  
Mga input value na ipinapasa sa infrastructure templates para i-customize ang deployments.

**PostgreSQL**  
Open-source relational database system na sinusuportahan bilang managed service sa Azure.

**Provisioning**  
Proseso ng paglikha at pag-configure ng mga resource ng Azure na tinukoy sa infrastructure templates.

## Q

**Quota**  
Mga limitasyon sa dami ng mga resource na maaaring likhain sa isang Azure subscription o rehiyon.

## R

**Resource Group**  
Logical container para sa mga resource ng Azure na may parehong lifecycle, permissions, at policies.

**Resource Token**  
Natatanging string na binuo ng azd upang matiyak na ang mga pangalan ng resource ay natatangi sa mga deployment.

**REST API**  
Arkitektural na estilo para sa pagdidisenyo ng mga networked application gamit ang HTTP methods.

**Rollback**  
Proseso ng pagbabalik sa nakaraang bersyon ng application o configuration ng imprastraktura.

## S

**Service**  
Isang bahagi ng iyong application na tinukoy sa azure.yaml (hal., web frontend, API backend, database).

**SKU**  
Stock Keeping Unit. Kumakatawan sa iba't ibang service tiers o performance levels para sa mga resource ng Azure.

**SQL Database**  
Managed relational database service ng Azure na batay sa Microsoft SQL Server.

**Static Web Apps**  
Serbisyo ng Azure para sa paggawa at pag-deploy ng full-stack web applications mula sa source code repositories.

**Storage Account**  
Serbisyo ng Azure na nagbibigay ng cloud storage para sa mga data object kabilang ang blobs, files, queues, at tables.

**Subscription**  
Container ng Azure account na naglalaman ng mga resource group at resource, na may kaugnay na billing at access management.

## T

**Template**  
Pre-built na istruktura ng proyekto na naglalaman ng application code, infrastructure definitions, at configuration para sa mga karaniwang senaryo.

**Terraform**  
Open-source na Infrastructure as Code tool na sumusuporta sa maraming cloud provider kabilang ang Azure.

**Traffic Manager**  
DNS-based na traffic load balancer ng Azure para sa pagdi-distribute ng traffic sa mga global Azure region.

## U

**URI**  
Uniform Resource Identifier. String na tumutukoy sa isang partikular na resource.

**URL**  
Uniform Resource Locator. Uri ng URI na tumutukoy kung saan matatagpuan ang isang resource at kung paano ito makukuha.

## V

**Virtual Network (VNet)**  
Pangunahing building block para sa mga pribadong network sa Azure, na nagbibigay ng isolation at segmentation.

**VS Code**  
Visual Studio Code. Popular na code editor na may mahusay na integration sa Azure at azd.

## W

**Webhook**  
HTTP callback na na-trigger ng mga partikular na event, karaniwang ginagamit sa CI/CD pipelines.

**What-if**  
Feature ng Azure na nagpapakita kung anong mga pagbabago ang gagawin ng isang deployment nang hindi ito aktwal na isinasagawa.

## Y

**YAML**  
YAML Ain't Markup Language. Human-readable na data serialization standard na ginagamit para sa mga configuration file tulad ng azure.yaml.

## Z

**Zone**  
Pisikal na magkakahiwalay na lokasyon sa loob ng isang Azure region na nagbibigay ng redundancy at mataas na availability.

---

## Karaniwang Akronim

| Akronim | Buong Kahulugan | Deskripsyon |
|---------|-----------------|-------------|
| AAD | Azure Active Directory | Serbisyo para sa identity at access management |
| ACR | Azure Container Registry | Serbisyo para sa container image registry |
| AKS | Azure Kubernetes Service | Managed Kubernetes service |
| API | Application Programming Interface | Set ng mga protocol para sa paggawa ng software |
| ARM | Azure Resource Manager | Serbisyo ng Azure para sa deployment at pamamahala |
| CDN | Content Delivery Network | Distributed network ng mga server |
| CI/CD | Continuous Integration/Continuous Deployment | Mga automated na praktis sa development |
| CLI | Command Line Interface | Text-based na user interface |
| DNS | Domain Name System | Sistema para sa pagsasalin ng domain names sa IP addresses |
| HTTPS | Hypertext Transfer Protocol Secure | Secure na bersyon ng HTTP |
| IaC | Infrastructure as Code | Pamamahala ng imprastraktura sa pamamagitan ng code |
| JSON | JavaScript Object Notation | Format ng data interchange |
| JWT | JSON Web Token | Format ng token para sa ligtas na pagpapadala ng impormasyon |
| KQL | Kusto Query Language | Query language para sa mga serbisyo ng data ng Azure |
| RBAC | Role-Based Access Control | Paraan ng access control batay sa mga role ng user |
| REST | Representational State Transfer | Arkitektural na estilo para sa web services |
| SDK | Software Development Kit | Koleksyon ng mga tool para sa development |
| SLA | Service Level Agreement | Commitment sa availability/performance ng serbisyo |
| SQL | Structured Query Language | Wika para sa pamamahala ng relational databases |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Mga cryptographic protocol |
| URI | Uniform Resource Identifier | String na tumutukoy sa isang resource |
| URL | Uniform Resource Locator | Uri ng URI na tumutukoy sa lokasyon ng resource |
| VM | Virtual Machine | Emulasyon ng isang computer system |
| VNet | Virtual Network | Pribadong network sa Azure |
| YAML | YAML Ain't Markup Language | Data serialization standard |

---

## Mga Pangalan ng Serbisyo ng Azure

| Karaniwang Pangalan | Opisyal na Pangalan ng Serbisyo ng Azure | azd Host Type |
|---------------------|-----------------------------------------|---------------|
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

## Mga Terminong May Konteksto

### Mga Terminong Pang-Development
- **Hot Reload**: Awtomatikong pag-update ng mga application habang nasa development nang hindi nire-restart
- **Build Pipeline**: Automated na proseso para sa pagbuo at pagsusuri ng code
- **Deployment Slot**: Staging environment sa loob ng App Service
- **Environment Parity**: Pagpapanatili ng pagkakapareho ng development, staging, at production environments

### Mga Terminong Pang-Seguridad
- **Managed Identity**: Feature ng Azure na nagbibigay ng awtomatikong pamamahala ng kredensyal
- **Key Vault**: Ligtas na imbakan para sa mga secrets, keys, at certificates
- **RBAC**: Role-based access control para sa mga resource ng Azure
- **Network Security Group**: Virtual firewall para sa pagkontrol ng network traffic

### Mga Terminong Pang-Monitoring
- **Telemetry**: Awtomatikong pagkolekta ng mga sukat at data
- **Application Performance Monitoring (APM)**: Pag-monitor ng performance ng software
- **Log Analytics**: Serbisyo para sa pagkolekta at pagsusuri ng log data
- **Alert Rules**: Awtomatikong notification batay sa mga metrics o kondisyon

### Mga Terminong Pang-Deployment
- **Blue-Green Deployment**: Strategiya ng deployment na walang downtime
- **Canary Deployment**: Gradual na rollout sa subset ng mga user
- **Rolling Update**: Sunud-sunod na pagpapalit ng mga application instance
- **Rollback**: Pagbabalik sa nakaraang bersyon ng application

---

**Tip sa Paggamit**: Gamitin ang `Ctrl+F` para mabilis na hanapin ang partikular na mga termino sa glossary na ito. Ang mga termino ay naka-cross-reference kung saan naaangkop.

---

**Navigasyon**
- **Nakaraang Aralin**: [Cheat Sheet](cheat-sheet.md)
- **Susunod na Aralin**: [FAQ](faq.md)

---

**Paunawa**:  
Ang dokumentong ito ay isinalin gamit ang AI translation service na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't sinisikap naming maging tumpak, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa kanyang katutubong wika ang dapat ituring na opisyal na sanggunian. Para sa mahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na maaaring magmula sa paggamit ng pagsasaling ito.