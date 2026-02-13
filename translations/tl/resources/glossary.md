# Talatinigan - Azure at Terminolohiya ng AZD

**Sanggunian para sa Lahat ng Kabanata**
- **📚 Tahanan ng Kurso**: [AZD Para sa Mga Nagsisimula](../README.md)
- **📖 Matutunan ang Mga Batayan**: [Kabanata 1: Mga Batayan ng AZD](../docs/getting-started/azd-basics.md)
- **🤖 Mga Termino ng AI**: [Kabanata 2: Pag-unlad na Una ang AI](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## Panimula

Ang komprehensibong talatinigang ito ay nagbibigay ng mga depinisyon para sa mga termino, konsepto, at akronim na ginagamit sa Azure Developer CLI at pag-develop sa cloud ng Azure. Mahalaga itong sanggunian para sa pag-unawa ng teknikal na dokumentasyon, pag-troubleshoot ng mga isyu, at epektibong komunikasyon tungkol sa mga proyekto ng azd at mga serbisyo ng Azure.

## Mga Layunin sa Pagkatuto

Sa paggamit ng talatinigan na ito, ikaw ay:
- Mauunawaan ang mahahalagang terminolohiya at konsepto ng Azure Developer CLI
- Mamahalaan ang bokabularyo at teknikal na mga termino sa pag-develop sa Azure cloud
- Magagamit nang mahusay ang sanggunian para sa Infrastructure as Code at terminolohiya ng deployment
- Maiintindihan ang mga pangalan ng serbisyo ng Azure, mga akronim, at ang kanilang mga layunin
- Makakakuha ng mga depinisyon para sa terminolohiya ng troubleshooting at debugging
- Matututo ng mga mas advanced na konsepto sa arkitektura at pag-develop sa Azure

## Mga Kinalabasan ng Pagkatuto

Sa regular na paggamit ng talatinigan na ito, magagawa mong:
- Makipagkomunika nang epektibo gamit ang wastong terminolohiya ng Azure Developer CLI
- Mas malinaw na maunawaan ang teknikal na dokumentasyon at mga mensahe ng error
- Maglibot sa mga serbisyo at konsepto ng Azure nang may kumpiyansa
- Mag-troubleshoot ng mga isyu gamit ang angkop na teknikal na bokabularyo
- Makibahagi sa mga diskusyon ng koponan gamit ang tumpak na teknikal na wika
- Palawakin ang iyong kaalaman sa pag-develop sa Azure cloud nang sistematiko

## A

**ARM Template**  
Azure Resource Manager template. JSON-based na format ng Infrastructure as Code na ginagamit para ideklara at i-deploy ang mga Azure resource.

**App Service**  
Ang platform-as-a-service (PaaS) ng Azure para sa pagho-host ng mga web application, REST API, at mobile backends nang hindi kinakailangang pamahalaan ang imprastruktura.

**Application Insights**  
Serbisyo ng Azure para sa application performance monitoring (APM) na nagbibigay ng malalim na pananaw sa performance, availability, at paggamit ng application.

**Azure CLI**  
Command-line interface para sa pamamahala ng mga Azure resource. Ginagamit ng azd para sa authentication at ilang operasyon.

**Azure Developer CLI (azd)**  
Developer-centric na command-line tool na nagpapabilis ng proseso ng pagbuo at pag-deploy ng mga application sa Azure gamit ang mga template at Infrastructure as Code.

**azure.yaml**  
Ang pangunahing configuration file para sa isang azd na proyekto na naglalarawan ng mga serbisyo, imprastruktura, at deployment hooks.

**Azure Resource Manager (ARM)**  
Serbisyo ng Azure para sa deployment at pamamahala na nagbibigay ng management layer para sa paglikha, pag-update, at pagtanggal ng mga resource.

## B

**Bicep**  
Domain-specific language (DSL) na dinevelop ng Microsoft para sa pag-deploy ng mga Azure resource. Nagbibigay ng mas simple na sintaks kaysa sa ARM templates habang kino-compile papunta sa ARM.

**Build**  
Proseso ng pag-compile ng source code, pag-install ng dependencies, at paghahanda ng mga application para sa deployment.

**Blue-Green Deployment**  
Estratehiya ng deployment na gumagamit ng dalawang magkakaparehong production environment (blue at green) upang mabawasan ang downtime at panganib.

## C

**Container Apps**  
Serverless container service ng Azure na nagpapahintulot magpatakbo ng mga containerized na application nang hindi pinamamahalaan ang kumplikadong imprastruktura.

**CI/CD**  
Continuous Integration/Continuous Deployment. Mga automated na pamamaraan para sa pag-iintegrate ng mga pagbabago sa code at pag-deploy ng mga application.

**Cosmos DB**  
Globally distributed, multi-model na database service ng Azure na nagbibigay ng komprehensibong SLA para sa throughput, latency, availability, at consistency.

**Configuration**  
Mga setting at parametro na kumokontrol sa ugali ng application at mga opsyon sa deployment.

## D

**Deployment**  
Proseso ng pag-install at pagsasaayos ng mga application at kanilang mga dependencies sa target na imprastruktura.

**Docker**  
Platform para sa pagde-develop, pagpapadala, at pagpapatakbo ng mga application gamit ang containerization technology.

**Dockerfile**  
Text file na naglalaman ng mga instruksyon para sa pag-build ng Docker container image.

## E

**Environment**  
Target na deployment na kumakatawan sa isang tiyak na instance ng iyong application (hal., development, staging, production).

**Environment Variables**  
Mga halaga ng configuration na iniimbak bilang mga key-value pair na maaaring i-access ng mga application sa runtime.

**Endpoint**  
URL o network address kung saan maaring ma-access ang isang application o serbisyo.

## F

**Function App**  
Serverless compute service ng Azure na nagpapahintulot magpatakbo ng event-driven na code nang hindi pinamamahalaan ang imprastruktura.

## G

**GitHub Actions**  
CI/CD platform na naka-integrate sa mga GitHub repository para sa pag-automate ng mga workflow.

**Git**  
Distributed version control system na ginagamit para subaybayan ang mga pagbabago sa source code.

## H

**Hooks**  
Custom na mga script o utos na tumatakbo sa partikular na puntos sa lifecycle ng deployment (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Uri ng serbisyo sa Azure kung saan ide-deploy ang isang application (hal., appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Gawain ng pagde-define at pamamahala ng imprastruktura sa pamamagitan ng code sa halip na manu-manong proseso.

**Init**  
Proseso ng pag-i-initialize ng bagong azd na proyekto, karaniwang mula sa isang template.

## J

**JSON**  
JavaScript Object Notation. Format ng palitan ng datos na karaniwang ginagamit para sa mga configuration file at API responses.

**JWT**  
JSON Web Token. Pamantayan para sa ligtas na pagpapadala ng impormasyon sa pagitan ng mga partido bilang isang JSON object.

## K

**Key Vault**  
Serbisyo ng Azure para sa ligtas na pag-iimbak at pamamahala ng mga secret, key, at sertipiko.

**Kusto Query Language (KQL)**  
Wika ng query na ginagamit para sa pagsuri ng datos sa Azure Monitor, Application Insights, at iba pang serbisyo ng Azure.

## L

**Load Balancer**  
Serbisyong nagdi-distribute ng papasok na network traffic sa maraming server o instance.

**Log Analytics**  
Serbisyo ng Azure para sa pagkolekta, pagsusuri, at pag-aksyon sa telemetry data mula sa cloud at on-premises na mga environment.

## M

**Managed Identity**  
Feature ng Azure na nagbibigay sa mga serbisyo ng Azure ng awtomatikong pinamamahalaang identity para sa authentication sa iba pang Azure na serbisyo.

**Microservices**  
Paraan ng arkitektura kung saan ang mga application ay binubuo ng koleksyon ng maliliit, independiyenteng serbisyo.

**Monitor**  
Unified monitoring solution ng Azure na nagbibigay ng full-stack observability sa mga application at imprastruktura.

## N

**Node.js**  
JavaScript runtime na binuo sa Chrome V8 JavaScript engine para sa pagbuo ng server-side na mga application.

**npm**  
Package manager para sa Node.js na namamahala ng dependencies at mga package.

## O

**Output**  
Mga halagang ibinabalik mula sa deployment ng imprastruktura na maaaring gamitin ng mga application o iba pang resource.

## P

**Package**  
Proseso ng paghahanda ng code ng application at mga dependencies para sa deployment.

**Parameters**  
Mga input na halaga na ipinapasa sa mga infrastructure template para i-customize ang mga deployment.

**PostgreSQL**  
Open-source na relational database system na sinusuportahan bilang managed service sa Azure.

**Provisioning**  
Proseso ng paglikha at pagsasaayos ng mga Azure resource na tinukoy sa infrastructure template.

## Q

**Quota**  
Mga limitasyon sa dami ng mga resource na maaaring malikha sa isang Azure subscription o rehiyon.

## R

**Resource Group**  
Lohikong lalagyan para sa mga Azure resource na may parehong lifecycle, permissions, at mga polisiya.

**Resource Token**  
Natanging string na ginawa ng azd upang matiyak na ang mga pangalan ng resource ay natatangi sa mga deployment.

**REST API**  
Architectural style para sa pagdidisenyo ng mga networked application gamit ang HTTP methods.

**Rollback**  
Proseso ng pagbalik sa isang naunang bersyon ng application o configuration ng imprastruktura.

## S

**Service**  
Isang bahagi ng iyong application na tinukoy sa azure.yaml (hal., web frontend, API backend, database).

**SKU**  
Stock Keeping Unit. Kumakatawan sa iba't ibang tier ng serbisyo o antas ng performance para sa mga Azure resource.

**SQL Database**  
Managed relational database service ng Azure na batay sa Microsoft SQL Server.

**Static Web Apps**  
Serbisyo ng Azure para sa pagbuo at pag-deploy ng full-stack web application mula sa source code repositories.

**Storage Account**  
Serbisyo ng Azure na nagbibigay ng cloud storage para sa mga data object kabilang ang blobs, files, queues, at tables.

**Subscription**  
Lalagyan ng Azure account na humahawak ng mga resource group at resource, kasama ang kaugnay na billing at pamamahala ng access.

## T

**Template**  
Pre-built na estruktura ng proyekto na naglalaman ng application code, mga definition ng imprastruktura, at configuration para sa karaniwang mga scenario.

**Terraform**  
Open-source na Infrastructure as Code tool na sumusuporta sa maraming cloud provider kabilang ang Azure.

**Traffic Manager**  
DNS-based traffic load balancer ng Azure para sa pagdi-distribute ng traffic sa mga global na rehiyon ng Azure.

## U

**URI**  
Uniform Resource Identifier. String na tumutukoy sa isang partikular na resource.

**URL**  
Uniform Resource Locator. Uri ng URI na nagsasaad kung saan matatagpuan ang isang resource at kung paano ito kukunin.

## V

**Virtual Network (VNet)**  
Pangunahing bahagi para sa mga pribadong network sa Azure, nagbibigay ng isolation at segmentation.

**VS Code**  
Visual Studio Code. Popular na code editor na may mahusay na integrasyon para sa Azure at azd.

## W

**Webhook**  
HTTP callback na na-trigger ng mga partikular na kaganapan, karaniwang ginagamit sa CI/CD pipeline.

**What-if**  
Tampok ng Azure na nagpapakita kung anong mga pagbabago ang gagawin ng isang deployment nang hindi ito aktwal na isinasagawa.

## Y

**YAML**  
YAML Ain't Markup Language. Madaling mabasang pamantayan para sa serialization ng datos na ginagamit para sa mga configuration file gaya ng azure.yaml.

## Z

**Zone**  
Mga pisikal na hiwalay na lokasyon sa loob ng isang Azure rehiyon na nagbibigay ng redundancy at mataas na availability.

---

## Karaniwang mga Akronim

| Akronim | Buong Pangalan | Paglalarawan |
|---------|----------------|--------------|
| AAD | Azure Active Directory | Serbisyo para sa pamamahala ng pagkakakilanlan at access |
| ACR | Azure Container Registry | Serbisyo ng registry para sa container image |
| AKS | Azure Kubernetes Service | Managed Kubernetes service |
| API | Application Programming Interface | Mga protocol para sa pagbuo ng software |
| ARM | Azure Resource Manager | Serbisyo ng Azure para sa deployment at pamamahala |
| CDN | Content Delivery Network | Distributed na network ng mga server |
| CI/CD | Continuous Integration/Continuous Deployment | Mga automated na kasanayan sa pag-develop |
| CLI | Command Line Interface | Text-based na user interface |
| DNS | Domain Name System | Sistema para isalin ang mga domain name sa IP address |
| HTTPS | Hypertext Transfer Protocol Secure | Secure na bersyon ng HTTP |
| IaC | Infrastructure as Code | Pamamahala ng imprastruktura sa pamamagitan ng code |
| JSON | JavaScript Object Notation | Format ng palitan ng datos |
| JWT | JSON Web Token | Format ng token para sa ligtas na pagpapadala ng impormasyon |
| KQL | Kusto Query Language | Wika ng query para sa mga Azure data service |
| RBAC | Role-Based Access Control | Paraan ng kontrol ng access base sa mga tungkulin ng user |
| REST | Representational State Transfer | Architectural style para sa web services |
| SDK | Software Development Kit | Koleksyon ng mga tool para sa pag-develop |
| SLA | Service Level Agreement | Pangako sa availability/performance ng serbisyo |
| SQL | Structured Query Language | Wika para sa pamamahala ng relational databases |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Mga cryptographic protocol |
| URI | Uniform Resource Identifier | String na tumutukoy sa isang resource |
| URL | Uniform Resource Locator | Uri ng URI na tumutukoy sa lokasyon ng resource |
| VM | Virtual Machine | Emulasyon ng isang computer system |
| VNet | Virtual Network | Pribadong network sa Azure |
| YAML | YAML Ain't Markup Language | Pamantayan sa serialization ng datos |

---

## Pagmamapa ng Pangalan ng Serbisyo sa Azure

| Karaniwang Pangalan | Opisyal na Pangalan ng Serbisyo sa Azure | azd Host Type |
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

## Mga Termino na Tiyak sa Konteksto

### Mga Termino sa Pag-develop
- **Hot Reload**: Awtomatikong pag-update ng mga application habang nagde-develop nang hindi nire-restart
- **Build Pipeline**: Awtomatikong proseso para mag-build at mag-test ng code
- **Deployment Slot**: Staging environment sa loob ng App Service
- **Environment Parity**: Pagpapanatiling magkatulad ang development, staging, at production na mga environment

### Mga Termino sa Seguridad
- **Managed Identity**: Feature ng Azure na nagbibigay ng awtomatikong pamamahala ng kredensyal
- **Key Vault**: Ligtas na imbakan para sa mga secret, key, at sertipiko
- **RBAC**: Role-based access control para sa mga Azure resource
- **Network Security Group**: Virtual firewall para kontrolin ang network traffic

### Mga Termino sa Pagmo-monitor
- **Telemetry**: Awtomatikong pagkolekta ng mga sukat at datos
- **Application Performance Monitoring (APM)**: Pagmo-monitor ng performance ng software
- **Log Analytics**: Serbisyo para sa pagkolekta at pagsusuri ng log data
- **Alert Rules**: Awtomatikong mga notipikasyon base sa mga metric o kondisyon

### Mga Termino sa Deployment
- **Blue-Green Deployment**: Estratehiya ng deployment na walang downtime
- **Canary Deployment**: Dahan-dahang rollout sa isang subset ng mga user
- **Rolling Update**: Sunud-sunod na pagpapalit ng mga instance ng application
- **Rollback**: Pagbabalik sa naunang bersyon ng application

---

**Usage Tip**: Gamitin ang `Ctrl+F` para mabilis na maghanap ng partikular na termino sa talatinigang ito. Ang mga termino ay may cross-reference kung saan naaangkop.

---

**Navigation**
- **Nakaraang Aralin**: [Cheat Sheet](cheat-sheet.md)
- **Susunod na Aralin**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Paunawa:
Isinalin ang dokumentong ito gamit ang serbisyong pagsasalin ng AI na Co-op Translator (https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami para sa katumpakan, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring may mga pagkakamali o di-tumpak na bahagi. Dapat ituring na awtoritatibong sanggunian ang orihinal na dokumento sa orihinal nitong wika. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaintindihan o maling interpretasyon na maaaring magmula sa paggamit ng salin na ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->