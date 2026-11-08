# Woordenlijst - Azure en AZD Terminologie

**Referentie voor Alle Hoofdstukken**
- **📚 Cursus Startpagina**: [AZD Voor Beginners](../README.md)
- **📖 Leer Basiskennis**: [Hoofdstuk 1: AZD Basiskennis](../docs/chapter-01-foundation/azd-basics.md)
- **🤖 AI-termen**: [Hoofdstuk 2: AI-First Ontwikkeling](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)

## Inleiding

Deze uitgebreide woordenlijst biedt definities voor termen, concepten en afkortingen die worden gebruikt in Azure Developer CLI en Azure cloudontwikkeling. Essentiële referentie voor het begrijpen van technische documentatie, het oplossen van problemen en effectief communiceren over azd-projecten en Azure-diensten.

## Leerdoelen

Door deze woordenlijst te gebruiken, zult u:
- Essentiële terminologie en concepten van Azure Developer CLI begrijpen
- De woordenschat en technische termen van Azure cloudontwikkeling beheersen
- Efficiënt terminologie voor Infrastructure as Code en deployment kunnen raadplegen
- De namen van Azure-diensten, afkortingen en hun doeleinden begrijpen
- Definities voor probleemoplossing en debugging terminologie raadplegen
- Geavanceerde Azure architectuur- en ontwikkelingsconcepten leren

## Leerresultaten

Bij regelmatig gebruik van deze woordenlijst zult u in staat zijn om:
- Effectief te communiceren met juiste Azure Developer CLI terminologie
- Technische documentatie en foutmeldingen duidelijker te begrijpen
- Met vertrouwen door Azure-diensten en concepten te navigeren
- Problemen op te lossen met passende technische woordenschat
- Bij te dragen aan teamdiscussies met accurate technische taal
- Uw kennis van Azure cloudontwikkeling systematisch uit te breiden

## A

**ARM-sjabloon**  
Azure Resource Manager-sjabloon. JSON-gebaseerd Infrastructure as Code-formaat dat wordt gebruikt om Azure-resources declaratief te definiëren en te implementeren.

**App Service**  
Azure’s platform-als-een-dienst (PaaS) aanbod voor het hosten van webapplicaties, REST API’s en mobiele backends zonder infrastructuurbeheer.

**Application Insights**  
Azure’s applicatieprestatiebewakingsdienst (APM) die diepgaande inzichten biedt in prestatie, beschikbaarheid en gebruik van applicaties.

**Azure CLI**  
Commandoregelinterface voor het beheren van Azure-resources. Het vult AZD aan maar heeft een aparte login; de kern van AZD authenticatie gebruikt `azd auth login`.

**Azure Developer CLI (azd)**  
Developer-gericht commandoregelhulpmiddel dat het proces van het bouwen en implementeren van applicaties naar Azure versnelt met behulp van sjablonen en Infrastructure as Code.

**azure.yaml**  
Het hoofdconfiguratiebestand voor een azd-project dat diensten, infrastructuur en implementatiehooks definieert.

**Azure Resource Manager (ARM)**  
Azure’s implementatie- en beheerservice die een beheerlaag biedt voor het creëren, bijwerken en verwijderen van resources.

## B

**Bicep**  
Domeinspecifieke taal (DSL) ontwikkeld door Microsoft voor het implementeren van Azure-resources. Biedt eenvoudigere syntaxis dan ARM-sjablonen en compileert naar ARM.

**Build**  
Het proces van het compileren van broncode, installeren van afhankelijkheden en voorbereiden van applicaties voor deployment.

**Blue-Green Deployment**  
Implementatiestrategie die twee identieke productieomgevingen (blauw en groen) gebruikt om downtime en risico's te minimaliseren.

## C

**Container Apps**  
Azure's serverless container dienst die het draaien van containerized applicaties mogelijk maakt zonder beheer van complexe infrastructuur.

**CI/CD**  
Continuous Integration/Continuous Deployment. Geautomatiseerde praktijken voor het integreren van codewijzigingen en het uitrollen van applicaties.

**Cosmos DB**  
Azure’s wereldwijd gedistribueerde, multi-model databaseservice met uitgebreide SLA’s voor doorvoer, latency, beschikbaarheid en consistentie.

**Configuratie**  
Instellingen en parameters die het gedrag van applicaties en implementatieopties regelen.

## D

**Deployen**  
Het proces van het installeren en configureren van applicaties en hun afhankelijkheden op de doelinfrastructuur.

**Docker**  
Platform voor het ontwikkelen, verzenden en uitvoeren van applicaties met containerisatie technologie.

**Dockerfile**  
Tekstbestand met instructies voor het bouwen van een Docker container image.

## E

**Omgeving**  
Een implementatiedoel dat een specifieke instantie van uw applicatie vertegenwoordigt (bijv. ontwikkeling, staging, productie).

**Omgevingsvariabelen**  
Configuratiewaarden opgeslagen als sleutel-waardeparen die applicaties tijdens runtime kunnen benaderen.

**Eindpunt (Endpoint)**  
URL of netwerkadres waar een applicatie of dienst toegankelijk is.

## F

**Function App**  
Azure’s serverloze compute-dienst die het uitvoeren van event-gedreven code mogelijk maakt zonder infrastructuurbeheer.

## G

**GitHub Actions**  
CI/CD platform geïntegreerd met GitHub repositories voor het automatiseren van workflows.

**Git**  
Gedistribueerd versiebeheersysteem gebruikt voor het bijhouden van wijzigingen in broncode.

## H

**Hooks**  
Aangepaste scripts of commando’s die op specifieke momenten tijdens de deployment lifecycle draaien (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Het Azure servicetype waar een applicatie wordt gedeployed (bijv. appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Praktijk van het definiëren en beheren van infrastructuur via code in plaats van handmatige processen.

**Init**  
Het proces van het initialiseren van een nieuw azd-project, meestal vanuit een sjabloon.

## J

**JSON**  
JavaScript Object Notation. Data-uitwisselingsformaat dat vaak wordt gebruikt voor configuratiebestanden en API-responses.

**JWT**  
JSON Web Token. Standaard voor het veilig verzenden van informatie tussen partijen als een JSON-object.

## K

**Key Vault**  
Azure’s dienst voor het veilig opslaan en beheren van geheimen, sleutels en certificaten.

**Kusto Query Language (KQL)**  
Query-taal gebruikt voor het analyseren van data in Azure Monitor, Application Insights en andere Azure-diensten.

## L

**Load Balancer**  
Dienst die binnenkomend netwerkverkeer verdeelt over meerdere servers of instanties.

**Log Analytics**  
Azure-dienst voor het verzamelen, analyseren en reageren op telemetriedata van cloud- en on-premisesomgevingen.

## M

**Managed Identity**  
Azure-functionaliteit die Azure-diensten een automatisch beheerde identiteit biedt voor authenticatie bij andere Azure-diensten.

**Microservices**  
Architectuurbenadering waarbij applicaties worden opgebouwd als een verzameling van kleine, onafhankelijke services.

**Monitor**  
Azure’s uniforme monitoringoplossing die full-stack observability biedt over applicaties en infrastructuur.

## N

**Node.js**  
JavaScript-runtime gebouwd op Chrome’s V8 JavaScript-engine voor het bouwen van server-side applicaties.

**npm**  
Pakketbeheerder voor Node.js die afhankelijkheden en pakketten beheert.

## O

**Output**  
Waarden die teruggegeven worden vanuit infrastructuurimplementaties en gebruikt kunnen worden door applicaties of andere resources.

## P

**Package**  
Het proces van het voorbereiden van applicatiecode en afhankelijkheden voor deployment.

**Parameters**  
Invoergegevens die aan infrastructuursjablonen worden doorgegeven om deployments te customizen.

**PostgreSQL**  
Open-source relationeel databasesysteem dat wordt ondersteund als een managed service in Azure.

**Provisioning**  
Het proces van het creëren en configureren van Azure-resources die in infrastructuursjablonen zijn gedefinieerd.

## Q

**Quota**  
Limieten aan de hoeveelheid resources die kunnen worden aangemaakt binnen een Azure-abonnement of regio.

## R

**Resource Groep**  
Logische container voor Azure-resources die dezelfde levenscyclus, rechten en policies delen.

**Resource Token**  
Unieke string gegenereerd door azd om resource-namen uniek te maken over deployments heen.

**REST API**  
Architectuurstijl voor het ontwerpen van netwerk-applicaties met behulp van HTTP-methoden.

**Rollback**  
Proces van teruggaan naar een vorige versie van een applicatie of infrastructuurconfiguratie.

## S

**Service**  
Een component van uw applicatie gedefinieerd in azure.yaml (bijv. web frontend, API backend, database).

**SKU**  
Stock Keeping Unit. Vertegenwoordigt verschillende servicetiers of prestatieniveaus voor Azure-resources.

**SQL Database**  
Azure’s managed relationele databaseservice gebaseerd op Microsoft SQL Server.

**Static Web Apps**  
Azure-dienst voor het bouwen en deployen van full-stack webapplicaties vanuit broncode repositories.

**Storage Account**  
Azure-dienst die cloudopslag biedt voor dataobjecten zoals blobs, bestanden, wachtrijen en tabellen.

**Subscription**  
Azure-accountcontainer die resourcegroepen en resources bevat, met bijbehorende facturatie en toegangsbeheer.

## T

**Sjabloon**  
Vooraf gebouwde projectstructuur met applicatiecode, infrastructuurdefinities en configuratie voor veelvoorkomende scenario’s.

**Terraform**  
Open-source Infrastructure as Code-tool die meerdere cloudproviders ondersteunt, waaronder Azure.

**Traffic Manager**  
Azure’s DNS-gebaseerde traffic load balancer voor het verdelen van verkeer over globale Azure-regio’s.

## U

**URI**  
Uniform Resource Identifier. String die een specifieke resource identificeert.

**URL**  
Uniform Resource Locator. Type URI dat specificeert waar een resource zich bevindt en hoe deze te benaderen.

## V

**Virtueel Netwerk (VNet)**  
Fundamenteel bouwblok voor privé-netwerken in Azure, dat isolatie en segmentatie biedt.

**VS Code**  
Visual Studio Code. Populaire code-editor met uitstekende Azure en azd integratie.

## W

**Webhook**  
HTTP callback die wordt getriggerd door specifieke gebeurtenissen, vaak gebruikt in CI/CD pipelines.

**What-if**  
Azure-functie die toont welke wijzigingen door een deployment gemaakt zouden worden zonder deze daadwerkelijk uit te voeren.

## Y

**YAML**  
YAML is geen opmaaktaal. Menselijk leesbare dataserialisatie-standaard gebruikt voor configuratiebestanden zoals azure.yaml.

## Z

**Zone**  
Fysiek gescheiden locaties binnen een Azure-regio die redundantie en hoge beschikbaarheid bieden.

---

## Veelvoorkomende Afkortingen

| Afkorting | Volledige Naam | Beschrijving |
|---------|-----------|-------------|
| AAD | Azure Active Directory (nu Microsoft Entra ID) | Identiteits- en toegangsbeheer service |
| ACR | Azure Container Registry | Dienst voor container image registratie |
| AKS | Azure Kubernetes Service | Beheerde Kubernetes-dienst |
| API | Application Programming Interface | Set van protocollen voor softwareontwikkeling |
| ARM | Azure Resource Manager | Azure's implementatie- en beheerservice |
| CDN | Content Delivery Network | Gedistribueerd netwerk van servers |
| CI/CD | Continuous Integration/Continuous Deployment | Geautomatiseerde ontwikkelingspraktijken |
| CLI | Command Line Interface | Tekstgebaseerde gebruikersinterface |
| DNS | Domain Name System | Systeem voor vertalen van domeinnamen naar IP-adressen |
| HTTPS | Hypertext Transfer Protocol Secure | Beveiligde versie van HTTP |
| IaC | Infrastructure as Code | Infrastructuur beheren via code |
| JSON | JavaScript Object Notation | Data-uitwisselingsformaat |
| JWT | JSON Web Token | Tokenformaat voor veilige informatieoverdracht |
| KQL | Kusto Query Language | Query-taal voor Azure dataservices |
| RBAC | Role-Based Access Control | Toegangscontrole op basis van gebruikersrollen |
| REST | Representational State Transfer | Architectuurstijl voor webservices |
| SDK | Software Development Kit | Verzameling ontwikkeltools |
| SLA | Service Level Agreement | Servicebeschikbaarheid- en prestatieafspraken |
| SQL | Structured Query Language | Taal voor het beheren van relationele databases |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Cryptografische protocollen |
| URI | Uniform Resource Identifier | String die een resource identificeert |
| URL | Uniform Resource Locator | Type URI die locatie van resource specificeert |
| VM | Virtual Machine | Emulatie van een computersysteem |
| VNet | Virtual Network | Privénetwerk in Azure |
| YAML | YAML is geen opmaaktaal | Dataserialisatiestandaard |

---

## Mappings van Azure Dienstnamen

| Gebruikelijke Naam | Officiële Azure Dienstnaam | azd Host Type |
|-------------|------------------------------|---------------|
| Web App | Azure App Service | `appservice` |
| API App | Azure App Service | `appservice` |
| Container App | Azure Container Apps | `containerapp` |
| Function | Azure Functions | `function` |
| Static Site | Azure Static Web Apps | `staticwebapp` |
| Database | Azure Database for PostgreSQL | Infrastructuurresource, geen applicatie `host` |
| NoSQL DB | Azure Cosmos DB | Infrastructuurresource, geen applicatie `host` |
| Storage | Azure Storage Account | Infrastructuurresource, geen ingebouwde applicatie `host` |
| Cache | Azure Managed Redis | Infrastructuurresource, geen applicatie `host` |
| Search | Azure AI Search | Infrastructuurresource, geen applicatie `host` |
| Messaging | Azure Service Bus | Infrastructuurresource, geen applicatie `host` |

`services.<name>.host` selecteert een applicatie-implementatiedoel; het is geen afkorting voor een Azure-resourcetype. Databases, caches, zoekdiensten en wachtrijen worden normaal gesproken via de infrastructuuraanbieder geprovisiond en verbonden met de applicatie via outputs/configuratie.

---

## Contextspecifieke Termen

### Ontwikkelingstermen
- **Hot Reload**: Automatisch bijwerken van applicaties tijdens ontwikkeling zonder herstart
- **Build Pipeline**: Geautomatiseerd proces voor bouwen en testen van code
- **Deployment Slot**: Stagingomgeving binnen een App Service
- **Environment Parity**: Het gelijktrekken van ontwikkel-, staging- en productieomgevingen

### Beveiligingstermen
- **Managed Identity**: Azure-functie voor automatische credential management
- **Key Vault**: Veilige opslag voor geheimen, sleutels en certificaten
- **RBAC**: Rolgebaseerde toegangscontrole voor Azure-resources
- **Network Security Group**: Virtuele firewall voor netwerkverkeercontrole

### Monitoringtermen
- **Telemetry**: Geautomatiseerde verzameling van metingen en data
- **Application Performance Monitoring (APM)**: Bewaken van softwareprestaties
- **Log Analytics**: Dienst voor verzamelen en analyseren van logdata
- **Alert Rules**: Geautomatiseerde meldingen op basis van metrics of voorwaarden

### Deploymenttermen
- **Blue-Green Deployment**: Zero-downtime implementatiestrategie
- **Canary Deployment**: Geleidelijke uitrol naar een subset van gebruikers
- **Rolling Update**: Opeenvolgende vervanging van applicatie-instanties
- **Rollback**: Terugzetten naar een vorige applicatieversie

---

**Gebruikstip**: Gebruik `Ctrl+F` om snel naar specifieke termen in deze woordenlijst te zoeken. Termen zijn waar van toepassing onderling verwezen.

---

**Navigatie**
- **Vorige Les**: [Cheatsheet](cheat-sheet.md)
- **Volgende Les**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->