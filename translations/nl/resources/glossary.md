# Woordenlijst - Azure en AZD-terminologie

**Referentie voor alle hoofdstukken**
- **📚 Cursus Home**: [AZD voor beginners](../README.md)
- **📖 Leer de basis**: [Hoofdstuk 1: AZD basisprincipes](../docs/getting-started/azd-basics.md)
- **🤖 AI-termen**: [Hoofdstuk 2: AI-first ontwikkeling](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## Inleiding

Deze uitgebreide woordenlijst biedt definities voor termen, concepten en acroniemen die worden gebruikt in de Azure Developer CLI en Azure cloudontwikkeling. Essentiële referentie voor het begrijpen van technische documentatie, het oplossen van problemen en het effectief communiceren over azd-projecten en Azure-services.

## Leerdoelen

Door deze woordenlijst te gebruiken, zul je:
- Essentiële terminologie en concepten van de Azure Developer CLI begrijpen
- De vocabulaire en technische termen van Azure-cloudontwikkeling beheersen
- Efficiënt kunnen verwijzen naar Infrastructure as Code- en implementatieterminologie
- Azure-servicenamen, acroniemen en hun doeleinden begrijpen
- Definities raadplegen voor terminologie bij probleemoplossing en debugging
- Geavanceerde Azure-architectuur- en ontwikkelingsconcepten leren

## Leerresultaten

Met regelmatig gebruik van deze woordenlijst zul je in staat zijn om:
- Effectief te communiceren met de juiste terminologie van de Azure Developer CLI
- Technische documentatie en foutmeldingen duidelijker te begrijpen
- Met vertrouwen door Azure-services en -concepten te navigeren
- Problemen op te lossen met behulp van gepaste technische terminologie
- Bij te dragen aan teamdiscussies met nauwkeurige technische taal
- Je kennis van Azure-cloudontwikkeling systematisch uit te breiden

## A

**ARM-sjabloon**  
Azure Resource Manager template. JSON-gebaseerd Infrastructure as Code-formaat dat wordt gebruikt om Azure-resources declaratief te definiëren en te implementeren.

**App Service**  
Azure's platform-as-a-service (PaaS)-aanbieding voor het hosten van webapplicaties, REST API's en mobiele backends zonder dat je de infrastructuur hoeft te beheren.

**Application Insights**  
Azure's applicatieprestatiebewaking (APM)-service die diepgaande inzichten biedt in applicatieprestaties, beschikbaarheid en gebruik.

**Azure CLI**  
Command-line interface voor het beheren van Azure-resources. Gebruikt door azd voor authenticatie en sommige bewerkingen.

**Azure Developer CLI (azd)**  
Op ontwikkelaars gerichte commandoregeltool die het proces van het bouwen en implementeren van applicaties naar Azure versnelt met behulp van sjablonen en Infrastructure as Code.

**azure.yaml**  
Het hoofdconfiguratiebestand voor een azd-project dat services, infrastructuur en implementatiehooks definieert.

**Azure Resource Manager (ARM)**  
Azure's implementatie- en beheerservice die een beheerlaag biedt voor het maken, bijwerken en verwijderen van resources.

## B

**Bicep**  
Domeinspecifieke taal (DSL) ontwikkeld door Microsoft voor het implementeren van Azure-resources. Biedt eenvoudigere syntaxis dan ARM-sjablonen terwijl het compileert naar ARM.

**Build**  
Het proces van het compileren van broncode, installeren van afhankelijkheden en het voorbereiden van applicaties voor implementatie.

**Blue-Green Deployment**  
Implementatiestrategie die twee identieke productieomgevingen (blauw en groen) gebruikt om downtime en risico te minimaliseren.

## C

**Container Apps**  
Azure's serverless container-service die het uitvoeren van gecontaineriseerde applicaties mogelijk maakt zonder het beheren van complexe infrastructuur.

**CI/CD**  
Continuous Integration/Continuous Deployment. Geautomatiseerde praktijken voor het integreren van codewijzigingen en het implementeren van applicaties.

**Cosmos DB**  
Azure's wereldwijd gedistribueerde, multimodel-databaseservice die uitgebreide SLA's biedt voor throughput, latency, beschikbaarheid en consistentie.

**Configuratie**  
Instellingen en parameters die het gedrag van applicaties en implementatieopties regelen.

## D

**Implementatie**  
Het proces van het installeren en configureren van applicaties en hun afhankelijkheden op doelinfrastructuur.

**Docker**  
Platform voor het ontwikkelen, verpakken en uitvoeren van applicaties met containerisatie-technologie.

**Dockerfile**  
Tekstbestand met instructies voor het bouwen van een Docker-containerimage.

## E

**Omgeving**  
Een implementatiedoel dat een specifieke instantie van je applicatie vertegenwoordigt (bijv. development, staging, production).

**Omgevingsvariabelen**  
Configuratiewaarden opgeslagen als sleutel-waardeparen die applicaties bij runtime kunnen benaderen.

**Endpoint**  
URL of netwerkadres waar een applicatie of dienst toegankelijk is.

## F

**Function App**  
Azure's serverless compute-service die het uitvoeren van event-driven code mogelijk maakt zonder infrastructuur te beheren.

## G

**GitHub Actions**  
CI/CD-platform geïntegreerd met GitHub-repository's voor het automatiseren van workflows.

**Git**  
Gedistribueerd versiebeheersysteem gebruikt voor het bijhouden van wijzigingen in broncode.

## H

**Hooks**  
Aangepaste scripts of commando's die op specifieke momenten tijdens de implementatielevenscyclus worden uitgevoerd (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Het Azure-servicetype waar een applicatie wordt geïmplementeerd (bijv. appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Praktijk van het definiëren en beheren van infrastructuur via code in plaats van handmatige processen.

**Init**  
Het proces van het initialiseren van een nieuw azd-project, typisch vanuit een sjabloon.

## J

**JSON**  
JavaScript Object Notation. Data-uitwisselingsformaat dat veel wordt gebruikt voor configuratiebestanden en API-responses.

**JWT**  
JSON Web Token. Standaard voor het veilig overdragen van informatie tussen partijen als een JSON-object.

## K

**Key Vault**  
Azure's service voor het veilig opslaan en beheren van secrets, sleutels en certificaten.

**Kusto Query Language (KQL)**  
Querytaal gebruikt voor het analyseren van data in Azure Monitor, Application Insights en andere Azure-services.

## L

**Load Balancer**  
Service die inkomend netwerkverkeer over meerdere servers of instanties verdeelt.

**Log Analytics**  
Azure-service voor het verzamelen, analyseren en reageren op telemetriedata van cloud- en on-premisesomgevingen.

## M

**Managed Identity**  
Azure-functie die Azure-services een automatisch beheerde identiteit biedt voor authenticatie naar andere Azure-services.

**Microservices**  
Architecturale aanpak waarbij applicaties worden opgebouwd als een verzameling van kleine, onafhankelijke services.

**Monitor**  
Azure's geünificeerde monitoringoplossing die full-stack observability biedt voor applicaties en infrastructuur.

## N

**Node.js**  
JavaScript-runtime gebouwd op Chrome's V8 JavaScript-engine voor het bouwen van server-side applicaties.

**npm**  
Package manager voor Node.js die afhankelijkheden en pakketten beheert.

## O

**Output**  
Waarden die teruggegeven worden vanuit infrastructuurimplementatie en gebruikt kunnen worden door applicaties of andere resources.

## P

**Package**  
Het proces van het voorbereiden van applicatiecode en afhankelijkheden voor implementatie.

**Parameters**  
Invoerwaarden die aan infrastructuursjablonen worden doorgegeven om implementaties aan te passen.

**PostgreSQL**  
Open-source relationeel databasesysteem dat als beheerde service in Azure wordt ondersteund.

**Provisioning**  
Het proces van het creëren en configureren van Azure-resources gedefinieerd in infrastructuursjablonen.

## Q

**Quota**  
Limieten op de hoeveelheid resources die in een Azure-abonnement of regio aangemaakt kunnen worden.

## R

**Resource Group**  
Logische container voor Azure-resources die dezelfde levenscyclus, machtigingen en policies delen.

**Resource Token**  
Unieke tekenreeks gegenereerd door azd om ervoor te zorgen dat resource-namen uniek zijn over implementaties heen.

**REST API**  
Architectuurstijl voor het ontwerpen van netwerkapplicaties met gebruik van HTTP-methoden.

**Rollback**  
Proces van terugkeren naar een vorige versie van een applicatie of infrastructuurconfiguratie.

## S

**Service**  
Een component van je applicatie gedefinieerd in azure.yaml (bijv. web frontend, API backend, database).

**SKU**  
Stock Keeping Unit. Staat voor verschillende servicetiers of prestatieniveaus voor Azure-resources.

**SQL Database**  
Azure's beheerde relationele databaseservice gebaseerd op Microsoft SQL Server.

**Static Web Apps**  
Azure-service voor het bouwen en implementeren van full-stack webapplicaties vanuit source code-repository's.

**Storage Account**  
Azure-service die cloudopslag biedt voor data-objecten, inclusief blobs, files, queues en tables.

**Subscription**  
Azure-accountcontainer die resource groups en resources bevat, met bijbehorende facturatie en toegangsbeheer.

## T

**Template**  
Vooraf gebouwde projectstructuur die applicatiecode, infrastructuurdefinities en configuratie voor veelvoorkomende scenario's bevat.

**Terraform**  
Open-source Infrastructure as Code-tool die meerdere cloudproviders ondersteunt, waaronder Azure.

**Traffic Manager**  
Azure's DNS-gebaseerde verkeersloadbalancer voor het verdelen van verkeer over wereldwijde Azure-regio's.

## U

**URI**  
Uniform Resource Identifier. Tekenreeks die een bepaald resource identificeert.

**URL**  
Uniform Resource Locator. Type URI dat specificeert waar een resource zich bevindt en hoe deze opgehaald kan worden.

## V

**Virtual Network (VNet)**  
Fundamenteel bouwblok voor privé-netwerken in Azure, dat isolatie en segmentatie biedt.

**VS Code**  
Visual Studio Code. Populaire code-editor met uitstekende Azure- en azd-integratie.

## W

**Webhook**  
HTTP-callback geactiveerd door specifieke gebeurtenissen, vaak gebruikt in CI/CD-pipelines.

**What-if**  
Azure-functie die laat zien welke wijzigingen een implementatie zou uitvoeren zonder deze daadwerkelijk uit te voeren.

## Y

**YAML**  
YAML Ain't Markup Language. Menselijk leesbare data-serialisatiestandaard die wordt gebruikt voor configuratiebestanden zoals azure.yaml.

## Z

**Zone**  
Fysiek gescheiden locaties binnen een Azure-regio die redundantie en hoge beschikbaarheid bieden.

---

## Veelvoorkomende acroniemen

| Acroniem | Volledige naam | Beschrijving |
|---------|-----------|-------------|
| AAD | Azure Active Directory (now Microsoft Entra ID) | Service voor identiteits- en toegangsbeheer |
| ACR | Azure Container Registry | Container image registry-service |
| AKS | Azure Kubernetes Service | Beheerde Kubernetes-service |
| API | Application Programming Interface | Set van protocollen voor het bouwen van software |
| ARM | Azure Resource Manager | Azure's implementatie- en beheerservice |
| CDN | Content Delivery Network | Gedistribueerd netwerk van servers |
| CI/CD | Continuous Integration/Continuous Deployment | Geautomatiseerde ontwikkelpraktijken |
| CLI | Command Line Interface | Tekstgebaseerde gebruikersinterface |
| DNS | Domain Name System | Systeem voor het vertalen van domeinnamen naar IP-adressen |
| HTTPS | Hypertext Transfer Protocol Secure | Veilige versie van HTTP |
| IaC | Infrastructure as Code | Infrastructuur beheren via code |
| JSON | JavaScript Object Notation | Data-uitwisselingsformaat |
| JWT | JSON Web Token | Tokenformaat voor veilige informatieoverdracht |
| KQL | Kusto Query Language | Querytaal voor Azure-datadiensten |
| RBAC | Role-Based Access Control | Toegangscontrolemethode gebaseerd op gebruikersrollen |
| REST | Representational State Transfer | Architectuurstijl voor webservices |
| SDK | Software Development Kit | Verzameling ontwikkeltools |
| SLA | Service Level Agreement | Verbintenis betreffende beschikbaarheid/prestatie van een service |
| SQL | Structured Query Language | Taal voor het beheren van relationele databases |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Cryptografische protocollen |
| URI | Uniform Resource Identifier | Tekenreeks die een resource identificeert |
| URL | Uniform Resource Locator | Type URI dat de locatie van een resource specificeert |
| VM | Virtual Machine | Emulatie van een computersysteem |
| VNet | Virtual Network | Privénetwerk in Azure |
| YAML | YAML Ain't Markup Language | Data-serialisatiestandaard |

---

## Koppelingen van Azure-servicenamen

| Veelvoorkomende naam | Officiële Azure-servicenaam | azd Host Type |
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

## Contextspecifieke termen

### Ontwikkeltermen
- **Hot Reload**: Automatisch bijwerken van applicaties tijdens ontwikkeling zonder opnieuw te hoeven starten
- **Build Pipeline**: Geautomatiseerd proces voor het bouwen en testen van code
- **Deployment Slot**: Staging-omgeving binnen een App Service
- **Omgevingspariteit**: Ontwikkel-, staging- en productieomgevingen vergelijkbaar houden

### Beveiligingstermen
- **Managed Identity**: Azure-functie die automatische credentialbeheer biedt
- **Key Vault**: Veilige opslag voor secrets, sleutels en certificaten
- **RBAC**: Role-based access control voor Azure-resources
- **Network Security Group**: Virtuele firewall voor het controleren van netwerkverkeer

### Monitoringtermen
- **Telemetry**: Geautomatiseerde verzameling van metingen en data
- **Application Performance Monitoring (APM)**: Bewaking van softwareprestaties
- **Log Analytics**: Service voor het verzamelen en analyseren van loggegevens
- **Alert Rules**: Geautomatiseerde meldingen op basis van metrics of voorwaarden

### Implementatietermen
- **Blue-Green Deployment**: Implementatiestrategie zonder downtime
- **Canary Deployment**: Geleidelijke uitrol naar een subset van gebruikers
- **Rolling Update**: Sequentiële vervanging van applicatie-instanties
- **Rollback**: Terugkeren naar een vorige applicatieversie

---

**Tip voor gebruik**: Gebruik `Ctrl+F` om snel naar specifieke termen in deze woordenlijst te zoeken. Termen zijn, waar van toepassing, onderling verwezen.

---

**Navigatie**
- **Vorige les**: [Spiekbriefje](cheat-sheet.md)
- **Volgende les**: [Veelgestelde vragen](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->