# Glossaryo - Terminolohiya ng Azure at AZD

**Sanggunian para sa Lahat ng Kabanata**
- **📚 Tahanan ng Kurso**: [AZD Para sa mga Nagsisimula](../README.md)
- **📖 Matutunan ang mga Pangunahing Kaalaman**: [Kabanata 1: Mga Pangunahing Kaalaman sa AZD](../docs/chapter-01-foundation/azd-basics.md)
- **🤖 Mga Termino sa AI**: [Kabanata 2: AI-Unang Pag-unlad](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)

## Panimula

Ang komprehensibong glossaryong ito ay nagbibigay ng mga kahulugan para sa mga termino, konsepto, at mga akronim na ginagamit sa Azure Developer CLI at pag-unlad ng Azure cloud. Mahalaga itong sanggunian para sa pag-unawa sa teknikal na dokumentasyon, paglutas ng mga isyu, at mabisang komunikasyon tungkol sa mga proyekto ng azd at mga serbisyo ng Azure.

## Mga Layunin sa Pagkatuto

Sa paggamit ng glossaryong ito, mauunawaan mo ang:
- Mahahalagang terminolohiya at konsepto ng Azure Developer CLI
- Malawak na bokabularyo at mga teknikal na termino sa pag-unlad ng Azure cloud
- Mabisang paggamit ng mga termino sa Infrastructure as Code at deployment
- Mga pangalan ng serbisyo ng Azure, mga akronim, at kanilang mga layunin 
- Mga kahulugan para sa paglutas ng mga problema at terminolohiya ng debugging
- Mga advanced na konsepto sa arkitektura at pag-unlad sa Azure

## Mga Resulta ng Pagkatuto

Sa regular na pagsangguni sa glossaryong ito, magagawa mong:
- Mabisang makipagkomunika gamit ang tamang terminolohiya ng Azure Developer CLI
- Mas malinaw na maunawaan ang teknikal na dokumentasyon at mga error messages
- Mag-navigate sa mga serbisyo at konsepto ng Azure nang may kumpiyansa
- Maglutas ng mga isyu gamit ang angkop na teknikal na bokabularyo
- Makibahagi sa mga talakayan ng koponan gamit ang tumpak na teknikal na wika
- Sistematikong mapalawak ang iyong kaalaman sa pag-unlad ng Azure cloud

## A

**ARM Template**  
Azure Resource Manager template. JSON-based na format ng Infrastructure as Code na ginagamit upang ideklara at i-deploy ang mga Azure resource.

**App Service**  
Plataporma ng Azure bilang serbisyo (PaaS) para sa pagho-host ng mga web application, REST API, at mga mobile backend nang hindi pinamamahalaan ang imprastruktura.

**Application Insights**  
Serbisyo sa Azure para sa pagpapanatili ng performance ng aplikasyon (APM) na nagbibigay ng malalim na pananaw sa performance, availability, at paggamit ng aplikasyon.

**Azure CLI**  
Command-line interface para sa pamamahala ng mga resource ng Azure. Kumpleto ito ng AZD ngunit may hiwalay na pag-login; ang pangunahing autentikasyon ng AZD ay gumagamit ng `azd auth login`.

**Azure Developer CLI (azd)**  
Command-line tool na nakatuon sa mga developer na nagpapabilis ng proseso ng paggawa at pag-deploy ng mga aplikasyon sa Azure gamit ang mga template at Infrastructure as Code.

**azure.yaml**  
Pangunahing configuration file para sa isang azd na proyekto na naglalaman ng mga serbisyo, imprastruktura, at mga deployment hooks.

**Azure Resource Manager (ARM)**  
Serbisyo ng Azure para sa deployment at pamamahala na nagbibigay ng management layer para sa paglikha, pag-update, at pagtanggal ng mga resource.

## B

**Bicep**  
Domain-specific language (DSL) na binuo ng Microsoft para sa pag-deploy ng mga Azure resource. Nagbibigay ito ng mas simpleng syntax kaysa sa ARM templates habang kino-compile papuntang ARM.

**Build**  
Proseso ng pag-compile ng source code, pag-install ng mga dependencies, at paghahanda ng mga aplikasyon para sa deployment.

**Blue-Green Deployment**  
Deployment strategy na gumagamit ng dalawang magkaparehong production environment (blue at green) upang mabawasan ang downtime at panganib.

## C

**Container Apps**  
Serverless na container service ng Azure na nagpapahintulot sa pagpapatakbo ng mga containerized na aplikasyon nang hindi pinamamahalaan ang komplikadong imprastruktura.

**CI/CD**  
Continuous Integration/Continuous Deployment. Mga automated na praktis para sa pagsasanib ng mga pagbabago sa code at pag-deploy ng mga aplikasyon.

**Cosmos DB**  
Globally distributed, multi-model database service ng Azure na nagbibigay ng komprehensibong SLA para sa throughput, latency, availability, at consistency.

**Configuration**  
Mga setting at parameter na kumokontrol sa behavior ng aplikasyon at mga opsyon sa deployment.

## D

**Deployment**  
Proseso ng pag-install at pagsasaayos ng mga aplikasyon at kanilang mga dependencies sa target na imprastruktura.

**Docker**  
Plataporma para sa pagbuo, paghahatid, at pagpapatakbo ng mga aplikasyon gamit ang teknolohiyang containerization.

**Dockerfile**  
Text file na naglalaman ng mga instruksyon para sa pagbuo ng Docker container image.

## E

**Environment**  
Target na deployment na kumakatawan sa isang partikular na instance ng iyong aplikasyon (hal., development, staging, production).

**Environment Variables**  
Mga configuration value na naka-store bilang mga key-value pair na maaaring ma-access ng mga aplikasyon sa runtime.

**Endpoint**  
URL o network address kung saan maaring ma-access ang isang aplikasyon o serbisyo.

## F

**Function App**  
Serverless compute service ng Azure na nagpapahintulot sa pagpapatakbo ng event-driven code nang hindi pinamamahalaan ang imprastruktura.

## G

**GitHub Actions**  
CI/CD platform na integrated sa mga repository ng GitHub para sa pag-automate ng mga workflow.

**Git**  
Distributed version control system na ginagamit para i-track ang mga pagbabago sa source code.

## H

**Hooks**  
Custom scripts o mga command na tumatakbo sa mga tiyak na punto ng lifecycle ng deployment (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Uri ng Azure service kung saan ide-deploy ang isang aplikasyon (hal., appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Praktis ng pagdedeklara at pamamahala sa imprastruktura gamit ang code sa halip na manu-manong proseso.

**Init**  
Proseso ng pag-initialize ng bagong azd na proyekto, karaniwang mula sa isang template.

## J

**JSON**  
JavaScript Object Notation. Data interchange format na karaniwang ginagamit para sa mga configuration file at mga tugon mula sa API.

**JWT**  
JSON Web Token. Standard para sa secure na pagpapadala ng impormasyon sa pagitan ng mga partido bilang isang JSON na object.

## K

**Key Vault**  
Serbisyo ng Azure para sa secure na pagtatago at pamamahala ng mga lihim, susi, at sertipiko.

**Kusto Query Language (KQL)**  
Wika sa pag-query na ginagamit para sa pagsusuri ng data sa Azure Monitor, Application Insights, at iba pang Azure services.

## L

**Load Balancer**  
Serbisyo na nagpapamahagi ng papasok na network traffic sa maraming server o instance.

**Log Analytics**  
Serbisyo ng Azure para sa pagkolekta, pagsusuri, at pagtugon sa telemetry data mula sa cloud at on-premises na mga kapaligiran.

## M

**Managed Identity**  
Tampok ng Azure na nagbibigay sa mga serbisyo ng Azure ng awtomatikong pinamamahalaang pagkakakilanlan para sa authentication sa ibang Azure services.

**Microservices**  
Arkitekturang pamamaraan kung saan ang mga aplikasyon ay binubuo bilang koleksyon ng maliliit, independiyenteng serbisyo.

**Monitor**  
Pinagsanib na solusyon sa pagmo-monitor ng Azure na nagbibigay ng full-stack observability sa mga aplikasyon at imprastruktura.

## N

**Node.js**  
JavaScript runtime na binuo sa Chrome's V8 JavaScript engine para sa paggawa ng server-side na mga aplikasyon.

**npm**  
Package manager para sa Node.js na namamahala ng mga dependencies at mga package.

## O

**Output**  
Mga halaga na ibinabalik mula sa deployment ng imprastruktura na maaaring gamitin ng mga aplikasyon o ibang mga resource.

## P

**Package**  
Proseso ng paghahanda ng code ng aplikasyon at mga dependencies para sa deployment.

**Parameters**  
Mga input value na ipinapasa sa mga infrastructure template para i-customize ang mga deployment.

**PostgreSQL**  
Open-source relational database system na suportado bilang managed service sa Azure.

**Provisioning**  
Proseso ng paglikha at pagsasaayos ng mga Azure resource na tinukoy sa mga infrastructure template.

## Q

**Quota**  
Mga limitasyon sa dami ng resource na maaaring malikha sa isang Azure subscription o rehiyon.

## R

**Resource Group**  
Lohikal na lalagyan para sa mga Azure resource na may magkakaparehong lifecycle, permiso, at polisiya.

**Resource Token**  
Natatanging string na ginawang ng azd upang matiyak na ang mga pangalan ng resource ay natatangi sa mga deployment.

**REST API**  
Architectural style para sa pagdidisenyo ng networked applications gamit ang HTTP methods.

**Rollback**  
Proseso ng pagbabalik sa naunang bersyon ng isang aplikasyon o configuration ng imprastruktura.

## S

**Service**  
Isang bahagi ng iyong aplikasyon na tinukoy sa azure.yaml (hal., web frontend, API backend, database).

**SKU**  
Stock Keeping Unit. Kumakatawan sa iba't ibang tier ng serbisyo o antas ng performance para sa mga Azure resource.

**SQL Database**  
Managed relational database service ng Azure na batay sa Microsoft SQL Server.

**Static Web Apps**  
Serbisyo ng Azure para sa paggawa at pag-deploy ng full-stack web application mula sa mga source code repository.

**Storage Account**  
Serbisyo ng Azure na nagbibigay ng cloud storage para sa mga data object kabilang ang blobs, files, queues, at tables.

**Subscription**  
Lalagyan ng Azure account na nagtataglay ng mga resource group at mga resource, pati na rin ng kaugnay na billing at pamamahala ng access.

## T

**Template**  
Pre-built na istruktura ng proyekto na naglalaman ng code ng aplikasyon, mga depinisyon ng imprastruktura, at configuration para sa mga karaniwang senaryo.

**Terraform**  
Open-source na Infrastructure as Code tool na sumusuporta sa maramihang cloud provider kabilang ang Azure.

**Traffic Manager**  
DNS-based na traffic load balancer ng Azure para sa pamamahagi ng trapiko sa mga global Azure region.

## U

**URI**  
Uniform Resource Identifier. String na kumikilala sa isang partikular na resource.

**URL**  
Uniform Resource Locator. Uri ng URI na nagtutukoy kung saan matatagpuan ang isang resource at kung paano ito makukuha.

## V

**Virtual Network (VNet)**  
Pangunahing building block para sa mga pribadong network sa Azure, na nagbibigay ng isolation at segmentation.

**VS Code**  
Visual Studio Code. Sikat na code editor na may mahusay na integrasyon sa Azure at azd.

## W

**Webhook**  
HTTP callback na pinu-trigger ng mga partikular na pangyayari, karaniwang gamit sa mga CI/CD pipeline.

**What-if**  
Tampok ng Azure na nagpapakita kung anong mga pagbabago ang gagawin ng isang deployment nang hindi ito isinasagawa.

## Y

**YAML**  
YAML Ain't Markup Language. Human-readable na data serialization standard na ginagamit para sa mga configuration file tulad ng azure.yaml.

## Z

**Zone**  
Pisikal na hiwalay na lokasyon sa loob ng isang Azure region na nagbibigay ng redundancy at mataas na availability.

---

## Mga Karaniwang Akronim

| Akronim | Buong Katawagan | Paglalarawan |
|---------|-----------|-------------|
| AAD | Azure Active Directory (ngayon Microsoft Entra ID) | Identity at access management service |
| ACR | Azure Container Registry | Serbisyo para sa container image registry |
| AKS | Azure Kubernetes Service | Managed Kubernetes service |
| API | Application Programming Interface | Set ng mga protocol para sa paggawa ng software |
| ARM | Azure Resource Manager | Serbisyo ng Azure para sa deployment at pamamahala |
| CDN | Content Delivery Network | Distributed na network ng mga server |
| CI/CD | Continuous Integration/Continuous Deployment | Mga automated na praktis sa pag-unlad |
| CLI | Command Line Interface | Text-based na user interface |
| DNS | Domain Name System | Sistema para sa pagsasalin ng mga domain name sa IP address |
| HTTPS | Hypertext Transfer Protocol Secure | Secure na bersyon ng HTTP |
| IaC | Infrastructure as Code | Pamamahala ng imprastruktura gamit ang code |
| JSON | JavaScript Object Notation | Data interchange format |
| JWT | JSON Web Token | Token format para sa secure na pagpapadala ng impormasyon |
| KQL | Kusto Query Language | Wika sa pag-query para sa mga Azure data service |
| RBAC | Role-Based Access Control | Paraan ng access control base sa mga role ng user |
| REST | Representational State Transfer | Architectural style para sa mga web service |
| SDK | Software Development Kit | Koleksyon ng mga development tool |
| SLA | Service Level Agreement | Pangako sa availability/performance ng serbisyo |
| SQL | Structured Query Language | Wika para sa pamamahala ng relational databases |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Mga cryptographic protocol |
| URI | Uniform Resource Identifier | String na nagpapakilala sa isang resource |
| URL | Uniform Resource Locator | Uri ng URI na nagtutukoy ng lokasyon ng resource |
| VM | Virtual Machine | Emulasyon ng isang computer system |
| VNet | Virtual Network | Pribadong network sa Azure |
| YAML | YAML Ain't Markup Language | Data serialization standard |

---

## Mga Pagmamapa ng Pangalan ng Serbisyo ng Azure

| Karaniwang Pangalan | Opisyal na Pangalan ng Serbisyo ng Azure | Uri ng Host ng azd |
|-------------|------------------------------|---------------|
| Web App | Azure App Service | `appservice` |
| API App | Azure App Service | `appservice` |
| Container App | Azure Container Apps | `containerapp` |
| Function | Azure Functions | `function` |
| Static Site | Azure Static Web Apps | `staticwebapp` |
| Database | Azure Database for PostgreSQL | Infrastructure resource, hindi isang aplikasyon `host` |
| NoSQL DB | Azure Cosmos DB | Infrastructure resource, hindi isang aplikasyon `host` |
| Storage | Azure Storage Account | Infrastructure resource, hindi isang built-in na aplikasyon `host` |
| Cache | Azure Managed Redis | Infrastructure resource, hindi isang aplikasyon `host` |
| Search | Azure AI Search | Infrastructure resource, hindi isang aplikasyon `host` |
| Messaging | Azure Service Bus | Infrastructure resource, hindi isang aplikasyon `host` |

`services.<name>.host` ay pumipili ng isang application deployment target; ito ay hindi shorthand para sa anumang uri ng Azure resource. Karaniwang pinoprovide ang mga database, cache, search service, at queues sa pamamagitan ng infrastructure provider at nakakonekta sa application gamit ang outputs/configuration.

---

## Mga Termino na Espesipiko sa Konteksto

### Mga Termino sa Pag-unlad
- **Hot Reload**: Awtomatikong pag-update ng mga aplikasyon habang nagde-develop nang hindi nire-restart
- **Build Pipeline**: Automated na proseso para sa pagbuo at pagsubok ng code
- **Deployment Slot**: Staging environment sa loob ng isang App Service
- **Environment Parity**: Pagpapareho ng development, staging, at production environment

### Mga Termino sa Seguridad
- **Managed Identity**: Tampok ng Azure na nagbibigay ng awtomatikong pamamahala ng kredensyal
- **Key Vault**: Secure na storage para sa mga lihim, susi, at sertipiko
- **RBAC**: Role-based access control para sa mga resource ng Azure
- **Network Security Group**: Virtual firewall para sa pagkontrol ng network traffic

### Mga Termino sa Pagmo-monitor
- **Telemetry**: Awtomatikong pagkolekta ng mga sukat at data
- **Application Performance Monitoring (APM)**: Pagmo-monitor ng performance ng software
- **Log Analytics**: Serbisyo para sa pagkolekta at pagsusuri ng log data
- **Alert Rules**: Automated na mga notification base sa mga metric o kondisyon

### Mga Termino sa Deployment
- **Blue-Green Deployment**: Deployment strategy na walang downtime
- **Canary Deployment**: Unti-unting pag-rollout sa subset ng mga user
- **Rolling Update**: Sunud-sunod na pagpapalit ng mga instance ng aplikasyon
- **Rollback**: Pagbabalik sa naunang bersyon ng aplikasyon

---

**Usage Tip**: Gamitin ang `Ctrl+F` upang mabilis na maghanap ng mga partikular na termino sa glossaryo na ito. Ang mga termino ay naka-cross reference kapag naaangkop.

---

**Navigasyon**
- **Nakalipas na Aralin**: [Cheat Sheet](cheat-sheet.md)
- **Susunod na Aralin**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->