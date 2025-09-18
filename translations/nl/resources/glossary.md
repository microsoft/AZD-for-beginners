<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "f16d2988a24670d1b6aa2372de1a231a",
  "translation_date": "2025-09-18T07:02:28+00:00",
  "source_file": "resources/glossary.md",
  "language_code": "nl"
}
-->
# Glossarium - Azure en AZD Terminologie

**Referentie voor alle hoofdstukken**
- **📚 Cursus Home**: [AZD Voor Beginners](../README.md)
- **📖 Basis leren**: [Hoofdstuk 1: AZD Basisprincipes](../docs/getting-started/azd-basics.md)
- **🤖 AI Termen**: [Hoofdstuk 2: AI-First Ontwikkeling](../docs/ai-foundry/azure-ai-foundry-integration.md)

## Introductie

Dit uitgebreide glossarium biedt definities voor termen, concepten en acroniemen die worden gebruikt in Azure Developer CLI en Azure cloudontwikkeling. Essentiële referentie voor het begrijpen van technische documentatie, het oplossen van problemen en het effectief communiceren over azd-projecten en Azure-diensten.

## Leerdoelen

Door gebruik te maken van dit glossarium, zul je:
- Essentiële terminologie en concepten van Azure Developer CLI begrijpen
- De woordenschat en technische termen van Azure cloudontwikkeling beheersen
- Terminologie van Infrastructure as Code en implementatie efficiënt kunnen raadplegen
- Namen, acroniemen en doeleinden van Azure-diensten begrijpen
- Definities voor probleemoplossing en foutopsporingsterminologie kunnen raadplegen
- Geavanceerde concepten van Azure-architectuur en ontwikkeling leren

## Leerresultaten

Met regelmatig gebruik van dit glossarium zul je in staat zijn om:
- Effectief te communiceren met de juiste terminologie van Azure Developer CLI
- Technische documentatie en foutmeldingen duidelijker te begrijpen
- Vertrouwd te navigeren door Azure-diensten en concepten
- Problemen op te lossen met behulp van passende technische woordenschat
- Bij te dragen aan teamdiscussies met nauwkeurige technische taal
- Systematisch je kennis van Azure cloudontwikkeling uit te breiden

## A

**ARM Template**  
Azure Resource Manager-template. JSON-gebaseerd Infrastructure as Code-formaat dat wordt gebruikt om Azure-resources declaratief te definiëren en te implementeren.

**App Service**  
Azure's platform-as-a-service (PaaS)-aanbod voor het hosten van webapplicaties, REST API's en mobiele backends zonder infrastructuurbeheer.

**Application Insights**  
Azure's applicatieprestatiebewakingsdienst (APM) die diepgaande inzichten biedt in applicatieprestaties, beschikbaarheid en gebruik.

**Azure CLI**  
Command-line interface voor het beheren van Azure-resources. Gebruikt door azd voor authenticatie en sommige bewerkingen.

**Azure Developer CLI (azd)**  
Ontwikkelaarsgerichte command-line tool die het proces van het bouwen en implementeren van applicaties naar Azure versnelt met behulp van templates en Infrastructure as Code.

**azure.yaml**  
Het belangrijkste configuratiebestand voor een azd-project dat diensten, infrastructuur en implementatiehooks definieert.

**Azure Resource Manager (ARM)**  
Azure's implementatie- en beheerdienst die een beheerslaag biedt voor het maken, bijwerken en verwijderen van resources.

## B

**Bicep**  
Domeinspecifieke taal (DSL) ontwikkeld door Microsoft voor het implementeren van Azure-resources. Biedt een eenvoudiger syntaxis dan ARM-templates terwijl het compileert naar ARM.

**Build**  
Het proces van het compileren van broncode, installeren van afhankelijkheden en voorbereiden van applicaties voor implementatie.

**Blue-Green Deployment**  
Implementatiestrategie die twee identieke productieomgevingen (blauw en groen) gebruikt om downtime en risico te minimaliseren.

## C

**Container Apps**  
Azure's serverloze containerdienst waarmee containerized applicaties kunnen worden uitgevoerd zonder complexe infrastructuur te beheren.

**CI/CD**  
Continuous Integration/Continuous Deployment. Geautomatiseerde praktijken voor het integreren van codewijzigingen en het implementeren van applicaties.

**Cosmos DB**  
Azure's wereldwijd gedistribueerde, multi-model databaseservice die uitgebreide SLA's biedt voor doorvoer, latentie, beschikbaarheid en consistentie.

**Configuratie**  
Instellingen en parameters die het gedrag van applicaties en implementatieopties bepalen.

## D

**Implementatie**  
Het proces van het installeren en configureren van applicaties en hun afhankelijkheden op doelinfrastructuur.

**Docker**  
Platform voor het ontwikkelen, verzenden en uitvoeren van applicaties met behulp van containertechnologie.

**Dockerfile**  
Tekstbestand met instructies voor het bouwen van een Docker-containerimage.

## E

**Omgeving**  
Een implementatiedoel dat een specifieke instantie van je applicatie vertegenwoordigt (bijv. ontwikkeling, staging, productie).

**Omgevingsvariabelen**  
Configuratiewaarden opgeslagen als sleutel-waardeparen die applicaties tijdens runtime kunnen benaderen.

**Endpoint**  
URL of netwerkadres waar een applicatie of dienst toegankelijk is.

## F

**Function App**  
Azure's serverloze computerdienst waarmee event-driven code kan worden uitgevoerd zonder infrastructuurbeheer.

## G

**GitHub Actions**  
CI/CD-platform geïntegreerd met GitHub-repositories voor het automatiseren van workflows.

**Git**  
Gedistribueerd versiebeheersysteem dat wordt gebruikt voor het bijhouden van wijzigingen in broncode.

## H

**Hooks**  
Aangepaste scripts of commando's die op specifieke punten tijdens de implementatielevenscyclus worden uitgevoerd (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Het type Azure-dienst waar een applicatie wordt geïmplementeerd (bijv. appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Praktijk van het definiëren en beheren van infrastructuur via code in plaats van handmatige processen.

**Init**  
Het proces van het initialiseren van een nieuw azd-project, meestal vanuit een template.

## J

**JSON**  
JavaScript Object Notation. Gegevensuitwisselingsformaat dat vaak wordt gebruikt voor configuratiebestanden en API-responses.

**JWT**  
JSON Web Token. Standaard voor het veilig verzenden van informatie tussen partijen als een JSON-object.

## K

**Key Vault**  
Azure's dienst voor het veilig opslaan en beheren van geheimen, sleutels en certificaten.

**Kusto Query Language (KQL)**  
Querytaal die wordt gebruikt voor het analyseren van gegevens in Azure Monitor, Application Insights en andere Azure-diensten.

## L

**Load Balancer**  
Dienst die inkomend netwerkverkeer verdeelt over meerdere servers of instanties.

**Log Analytics**  
Azure-dienst voor het verzamelen, analyseren en reageren op telemetriegegevens van cloud- en on-premises omgevingen.

## M

**Managed Identity**  
Azure-functie die Azure-diensten voorziet van een automatisch beheerde identiteit voor authenticatie bij andere Azure-diensten.

**Microservices**  
Architecturale benadering waarbij applicaties worden gebouwd als een verzameling van kleine, onafhankelijke diensten.

**Monitor**  
Azure's uniforme bewakingsoplossing die volledige stack-observatie biedt over applicaties en infrastructuur.

## N

**Node.js**  
JavaScript-runtime gebouwd op Chrome's V8 JavaScript-engine voor het bouwen van server-side applicaties.

**npm**  
Pakketbeheerder voor Node.js die afhankelijkheden en pakketten beheert.

## O

**Output**  
Waarden die worden geretourneerd door infrastructuurimplementatie en kunnen worden gebruikt door applicaties of andere resources.

## P

**Package**  
Het proces van het voorbereiden van applicatiecode en afhankelijkheden voor implementatie.

**Parameters**  
Invoerwaarden die worden doorgegeven aan infrastructuurtemplates om implementaties aan te passen.

**PostgreSQL**  
Open-source relationeel databasesysteem dat wordt ondersteund als een beheerde dienst in Azure.

**Provisioning**  
Het proces van het maken en configureren van Azure-resources die zijn gedefinieerd in infrastructuurtemplates.

## Q

**Quota**  
Limieten op de hoeveelheid resources die kunnen worden gemaakt in een Azure-abonnement of regio.

## R

**Resource Group**  
Logische container voor Azure-resources die dezelfde levenscyclus, machtigingen en beleidsregels delen.

**Resource Token**  
Unieke string gegenereerd door azd om ervoor te zorgen dat resourcenamen uniek zijn over implementaties.

**REST API**  
Architecturale stijl voor het ontwerpen van netwerkapplicaties met behulp van HTTP-methoden.

**Rollback**  
Proces van terugkeren naar een eerdere versie van een applicatie of infrastructuurconfiguratie.

## S

**Service**  
Een component van je applicatie gedefinieerd in azure.yaml (bijv. web frontend, API backend, database).

**SKU**  
Stock Keeping Unit. Vertegenwoordigt verschillende serviceniveaus of prestatieniveaus voor Azure-resources.

**SQL Database**  
Azure's beheerde relationele databaseservice gebaseerd op Microsoft SQL Server.

**Static Web Apps**  
Azure-dienst voor het bouwen en implementeren van full-stack webapplicaties vanuit broncode-repositories.

**Storage Account**  
Azure-dienst die cloudopslag biedt voor gegevensobjecten zoals blobs, bestanden, wachtrijen en tabellen.

**Subscription**  
Azure-accountcontainer die resourcegroepen en resources bevat, met bijbehorende facturering en toegangsbeheer.

## T

**Template**  
Voorgebouwde projectstructuur met applicatiecode, infrastructuurdefinities en configuratie voor veelvoorkomende scenario's.

**Terraform**  
Open-source Infrastructure as Code-tool die meerdere cloudproviders ondersteunt, waaronder Azure.

**Traffic Manager**  
Azure's DNS-gebaseerde verkeersloadbalancer voor het verdelen van verkeer over wereldwijde Azure-regio's.

## U

**URI**  
Uniform Resource Identifier. String die een specifieke resource identificeert.

**URL**  
Uniform Resource Locator. Type URI dat specificeert waar een resource zich bevindt en hoe deze kan worden opgehaald.

## V

**Virtual Network (VNet)**  
Fundamenteel bouwblok voor privé-netwerken in Azure, dat isolatie en segmentatie biedt.

**VS Code**  
Visual Studio Code. Populaire code-editor met uitstekende Azure- en azd-integratie.

## W

**Webhook**  
HTTP-callback die wordt geactiveerd door specifieke gebeurtenissen, vaak gebruikt in CI/CD-pijplijnen.

**What-if**  
Azure-functie die laat zien welke wijzigingen zouden worden aangebracht door een implementatie zonder deze daadwerkelijk uit te voeren.

## Y

**YAML**  
YAML Ain't Markup Language. Menselijk leesbare gegevensserialisatiestandaard die wordt gebruikt voor configuratiebestanden zoals azure.yaml.

## Z

**Zone**  
Fysiek gescheiden locaties binnen een Azure-regio die redundantie en hoge beschikbaarheid bieden.

---

## Veelvoorkomende Acroniemen

| Acroniem | Volledige Naam | Beschrijving |
|---------|----------------|--------------|
| AAD | Azure Active Directory | Identiteits- en toegangsbeheer |
| ACR | Azure Container Registry | Container image registry service |
| AKS | Azure Kubernetes Service | Beheerde Kubernetes-dienst |
| API | Application Programming Interface | Protocolset voor softwareontwikkeling |
| ARM | Azure Resource Manager | Azure's implementatie- en beheerdienst |
| CDN | Content Delivery Network | Gedistribueerd netwerk van servers |
| CI/CD | Continuous Integration/Continuous Deployment | Geautomatiseerde ontwikkelingspraktijken |
| CLI | Command Line Interface | Tekstgebaseerde gebruikersinterface |
| DNS | Domain Name System | Systeem voor het vertalen van domeinnamen naar IP-adressen |
| HTTPS | Hypertext Transfer Protocol Secure | Veilige versie van HTTP |
| IaC | Infrastructure as Code | Infrastructuurbeheer via code |
| JSON | JavaScript Object Notation | Gegevensuitwisselingsformaat |
| JWT | JSON Web Token | Tokenformaat voor veilige informatieoverdracht |
| KQL | Kusto Query Language | Querytaal voor Azure-datadiensten |
| RBAC | Role-Based Access Control | Toegangsbeheer op basis van gebruikersrollen |
| REST | Representational State Transfer | Architecturale stijl voor webservices |
| SDK | Software Development Kit | Verzameling ontwikkeltools |
| SLA | Service Level Agreement | Garantie voor servicebeschikbaarheid/prestaties |
| SQL | Structured Query Language | Taal voor relationele databases |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Cryptografische protocollen |
| URI | Uniform Resource Identifier | String die een resource identificeert |
| URL | Uniform Resource Locator | Type URI dat de locatie van een resource specificeert |
| VM | Virtual Machine | Emulatie van een computersysteem |
| VNet | Virtual Network | Privé-netwerk in Azure |
| YAML | YAML Ain't Markup Language | Gegevensserialisatiestandaard |

---

## Azure Service Naam Mapping

| Algemene Naam | Officiële Azure Service Naam | azd Host Type |
|---------------|------------------------------|---------------|
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

## Contextspecifieke Termen

### Ontwikkelingstermen
- **Hot Reload**: Automatisch bijwerken van applicaties tijdens ontwikkeling zonder herstart
- **Build Pipeline**: Geautomatiseerd proces voor het bouwen en testen van code
- **Deployment Slot**: Stagingomgeving binnen een App Service
- **Environment Parity**: Ontwikkeling, staging en productieomgevingen gelijk houden

### Beveiligingstermen
- **Managed Identity**: Azure-functie die automatische inloggegevensbeheer biedt
- **Key Vault**: Veilige opslag voor geheimen, sleutels en certificaten
- **RBAC**: Rolgebaseerde toegangscontrole voor Azure-resources
- **Network Security Group**: Virtuele firewall voor het beheren van netwerkverkeer

### Bewakingstermen
- **Telemetrie**: Geautomatiseerde verzameling van metingen en gegevens
- **Application Performance Monitoring (APM)**: Bewaking van softwareprestaties
- **Log Analytics**: Dienst voor het verzamelen en analyseren van loggegevens
- **Alert Rules**: Geautomatiseerde meldingen op basis van metrics of voorwaarden

### Implementatietermen
- **Blue-Green Deployment**: Implementatiestrategie zonder downtime
- **Canary Deployment**: Geleidelijke uitrol naar een subset van gebruikers
- **Rolling Update**: Sequentiële vervanging van applicatie-instanties
- **Rollback**: Terugkeren naar een eerdere applicatieversie

---

**Gebruikstip**: Gebruik `Ctrl+F` om snel specifieke termen in dit glossarium te zoeken. Termen zijn waar van toepassing onderling gekoppeld.

---

**Navigatie**
- **Vorige Les**: [Cheat Sheet](cheat-sheet.md)
- **Volgende Les**: [FAQ](faq.md)

---

**Disclaimer**:  
Dit document is vertaald met behulp van de AI-vertalingsservice [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u zich ervan bewust te zijn dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in zijn oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.