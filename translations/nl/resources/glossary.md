# Glossarium - Azure en AZD Terminologie

**Referentie voor alle hoofdstukken**
- **📚 Cursus Startpagina**: [AZD For Beginners](../README.md)
- **📖 Leer de basis**: [Chapter 1: AZD Basics](../docs/getting-started/azd-basics.md)
- **🤖 AI-termen**: [Chapter 2: AI-First Development](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## Inleiding

Dit uitgebreide glossarium biedt definities voor termen, concepten en acroniemen die worden gebruikt in de Azure Developer CLI en Azure cloudontwikkeling. Essentiële referentie voor het begrijpen van technische documentatie, het oplossen van problemen en het effectief communiceren over azd-projecten en Azure-services.

## Leerdoelen

Door dit woordenboek te gebruiken, zult u:
- De essentiële terminologie en concepten van de Azure Developer CLI begrijpen
- De woordenschat en technische termen van Azure-cloudontwikkeling beheersen
- Efficiënt verwijzen naar Infrastructure as Code- en implementatieterminologie
- Azure-servicenamen, acroniemen en hun doeleinden begrijpen
- Toegang krijgen tot definities voor probleemoplossing en debuggingterminologie
- Geavanceerde Azure-architectuur- en ontwikkelingsconcepten leren

## Leerresultaten

Met regelmatige verwijzing naar dit glossarium zult u in staat zijn om:
- Effectief te communiceren met de juiste terminologie van de Azure Developer CLI
- Technische documentatie en foutmeldingen duidelijker te begrijpen
- Zelfverzekerd door Azure-services en -concepten te navigeren
- Problemen op te lossen met geschikte technische terminologie
- Bij te dragen aan teamdiscussies met nauwkeurige technische taal
- Uw kennis van Azure-cloudontwikkeling systematisch uit te breiden

## A

**ARM Template**  
Azure Resource Manager-sjabloon. Op JSON gebaseerde Infrastructure as Code-indeling die wordt gebruikt om Azure-resources declaratief te definiëren en te implementeren.

**App Service**  
Azure's platform-as-a-service (PaaS)-aanbod voor het hosten van webapplicaties, REST-API's en mobiele backends zonder beheer van de onderliggende infrastructuur.

**Application Insights**  
Azure's application performance monitoring (APM)-service die diepgaande inzichten biedt in applicatieprestaties, beschikbaarheid en gebruik.

**Azure CLI**  
Commandoregelinterface voor het beheren van Azure-resources. Wordt door azd gebruikt voor authenticatie en enkele bewerkingen.

**Azure Developer CLI (azd)**  
Ontwikkelaarsgerichte commandoregeltool die het proces van het bouwen en implementeren van toepassingen naar Azure versnelt met behulp van sjablonen en Infrastructure as Code.

**azure.yaml**  
Het hoofdconfiguratiebestand voor een azd-project dat services, infrastructuur en implementatiehooks definieert.

**Azure Resource Manager (ARM)**  
Azure's implementatie- en beheerservice die een beheerslaag biedt voor het maken, bijwerken en verwijderen van resources.

## B

**Bicep**  
Domeinspecifieke taal (DSL) ontwikkeld door Microsoft voor het implementeren van Azure-resources. Biedt een eenvoudigere syntaxis dan ARM-sjablonen en compileert naar ARM.

**Build**  
Het proces van het compileren van broncode, installeren van afhankelijkheden en het voorbereiden van applicaties voor implementatie.

**Blue-Green Deployment**  
Implementatiestrategie die twee identieke productieomgevingen (blauw en groen) gebruikt om downtime en risico te minimaliseren.

## C

**Container Apps**  
Azure's serverless containerdienst die het uitvoeren van gecontaineriseerde applicaties mogelijk maakt zonder het beheren van complexe infrastructuur.

**CI/CD**  
Continuous Integration/Continuous Deployment. Geautomatiseerde praktijken voor het integreren van codewijzigingen en het implementeren van applicaties.

**Cosmos DB**  
Azure's wereldwijd gedistribueerde, multi-model databaseservice die uitgebreide SLA's biedt voor doorvoer, latentie, beschikbaarheid en consistentie.

**Configuration**  
Instellingen en parameters die het gedrag van de applicatie en implementatieopties regelen.

## D

**Deployment**  
Het proces van het installeren en configureren van applicaties en hun afhankelijkheden op de doelinfrastructuur.

**Docker**  
Platform voor het ontwikkelen, verzenden en uitvoeren van applicaties met containerisatietechnologie.

**Dockerfile**  
Tekstbestand met instructies voor het bouwen van een Docker-containerimage.

## E

**Environment**  
Een implementatiedoel dat een specifieke instantie van uw applicatie vertegenwoordigt (bijv. development, staging, production).

**Environment Variables**  
Configuratiewaarden opgeslagen als key-value paren die applicaties tijdens runtime kunnen benaderen.

**Endpoint**  
URL of netwerkadres waar een applicatie of service toegankelijk is.

## F

**Function App**  
Azure's serverless compute-service waarmee event-gedreven code kan worden uitgevoerd zonder dat infrastructuurbeheer nodig is.

## G

**GitHub Actions**  
CI/CD-platform geïntegreerd met GitHub-repositories voor het automatiseren van workflows.

**Git**  
Gedistribueerd versiebeheersysteem dat wordt gebruikt voor het bijhouden van wijzigingen in broncode.

## H

**Hooks**  
Aangepaste scripts of commando's die op specifieke momenten tijdens de implementatielevenscyclus worden uitgevoerd (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Het type Azure-service waarop een applicatie wordt geïmplementeerd (bijv. appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
De praktijk van het definiëren en beheren van infrastructuur via code in plaats van handmatige processen.

**Init**  
Het proces van het initialiseren van een nieuw azd-project, meestal vanuit een sjabloon.

## J

**JSON**  
JavaScript Object Notation. Gegevensuitwisselingsformaat dat vaak wordt gebruikt voor configuratiebestanden en API-responses.

**JWT**  
JSON Web Token. Standaard voor het veilig overdragen van informatie tussen partijen als een JSON-object.

## K

**Key Vault**  
Azure-service voor het veilig opslaan en beheren van secrets, sleutels en certificaten.

**Kusto Query Language (KQL)**  
Querytaal die wordt gebruikt voor het analyseren van gegevens in Azure Monitor, Application Insights en andere Azure-services.

## L

**Load Balancer**  
Service die binnenkomend netwerkverkeer verdeelt over meerdere servers of instanties.

**Log Analytics**  
Azure-service voor het verzamelen, analyseren en handelen op telemetriegegevens van cloud- en on-premisesomgevingen.

## M

**Managed Identity**  
Azure-functie die Azure-services een automatisch beheerde identiteit biedt voor authenticatie bij andere Azure-services.

**Microservices**  
Architecturale aanpak waarbij applicaties worden opgebouwd als een verzameling van kleine, onafhankelijke services.

**Monitor**  
Azure's uniforme monitoringoplossing die full-stack observability biedt over applicaties en infrastructuur.

## N

**Node.js**  
JavaScript-runtime gebouwd op Chrome's V8 JavaScript-engine voor het bouwen van server-side applicaties.

**npm**  
Pakketbeheerder voor Node.js die afhankelijkheden en pakketten beheert.

## O

**Output**  
Waarden die worden geretourneerd uit infrastructuurimplementatie en door applicaties of andere resources kunnen worden gebruikt.

## P

**Package**  
Het proces van het klaarmaken van applicatiecode en afhankelijkheden voor implementatie.

**Parameters**  
Invoegwaarden die worden doorgegeven aan infrastructuursjablonen om implementaties aan te passen.

**PostgreSQL**  
Open-source relationeel databasesysteem dat wordt ondersteund als een beheerde service in Azure.

**Provisioning**  
Het proces van het creëren en configureren van Azure-resources die zijn gedefinieerd in infrastructuursjablonen.

## Q

**Quota**  
Limieten op de hoeveelheid resources die in een Azure-subscriptie of regio kunnen worden aangemaakt.

## R

**Resource Group**  
Logische container voor Azure-resources die dezelfde levenscyclus, machtigingen en beleidsregels delen.

**Resource Token**  
Unieke tekenreeks gegenereerd door azd om te zorgen dat resourcenamen uniek zijn over implementaties heen.

**REST API**  
Architectuurstijl voor het ontwerpen van netwerkapplicaties met gebruik van HTTP-methoden.

**Rollback**  
Proces van terugkeren naar een vorige versie van een applicatie of infrastructuurconfiguratie.

## S

**Service**  
Een component van uw applicatie gedefinieerd in azure.yaml (bijv. web frontend, API backend, database).

**SKU**  
Stock Keeping Unit. Vertegenwoordigt verschillende servicetiers of prestatieniveaus voor Azure-resources.

**SQL Database**  
Azure's beheerde relationele databaseservice gebaseerd op Microsoft SQL Server.

**Static Web Apps**  
Azure-service voor het bouwen en implementeren van full-stack webapplicaties vanuit broncode-repositories.

**Storage Account**  
Azure-service die cloudopslag biedt voor dataobjecten waaronder blobs, bestanden, queues en tabellen.

**Subscription**  
Azure-accountcontainer die resourcegroepen en resources bevat, met bijbehorende facturering en toegangsbeheer.

## T

**Template**  
Vooraf opgebouwde projectstructuur met applicatiecode, infrastructuurdefinities en configuratie voor veelvoorkomende scenario's.

**Terraform**  
Open-source Infrastructure as Code-tool die meerdere cloudproviders ondersteunt, waaronder Azure.

**Traffic Manager**  
Azure's DNS-gebaseerde verkeersloadbalancer voor het verdelen van verkeer over wereldwijde Azure-regio's.

## U

**URI**  
Uniform Resource Identifier. Reeks die een bepaald resource identificeert.

**URL**  
Uniform Resource Locator. Type URI dat specificeert waar een resource zich bevindt en hoe deze kan worden opgehaald.

## V

**Virtual Network (VNet)**  
Fundamentele bouwsteen voor private netwerken in Azure, die isolatie en segmentatie biedt.

**VS Code**  
Visual Studio Code. Populaire code-editor met uitstekende Azure- en azd-integratie.

## W

**Webhook**  
HTTP-callback die wordt geactiveerd door specifieke gebeurtenissen, veelal gebruikt in CI/CD-pijplijnen.

**What-if**  
Azure-functie die toont welke wijzigingen een implementatie zou maken zonder deze daadwerkelijk uit te voeren.

## Y

**YAML**  
YAML Ain't Markup Language. Menselijk leesbare dataserialisatienorm die wordt gebruikt voor configuratiebestanden zoals azure.yaml.

## Z

**Zone**  
Fysiek gescheiden locaties binnen een Azure-regio die redundantie en hoge beschikbaarheid bieden.

---

## Veelvoorkomende acroniemen

| Acroniem | Volledige vorm | Beschrijving |
|---------|-----------|-------------|
| AAD | Azure Active Directory | Identiteits- en toegangsbeheer-service |
| ACR | Azure Container Registry | Container image registry-service |
| AKS | Azure Kubernetes Service | Beheerde Kubernetes-service |
| API | Application Programming Interface | Set protocollen voor het bouwen van software |
| ARM | Azure Resource Manager | Azure's implementatie- en beheerservice |
| CDN | Content Delivery Network | Gedistribueerd netwerk van servers |
| CI/CD | Continuous Integration/Continuous Deployment | Geautomatiseerde ontwikkelingspraktijken |
| CLI | Command Line Interface | Tekstgebaseerde gebruikersinterface |
| DNS | Domain Name System | Systeem voor het vertalen van domeinnamen naar IP-adressen |
| HTTPS | Hypertext Transfer Protocol Secure | Versleutelde versie van HTTP |
| IaC | Infrastructure as Code | Beheer van infrastructuur via code |
| JSON | JavaScript Object Notation | Gegevensuitwisselingsformaat |
| JWT | JSON Web Token | Tokenformaat voor veilige informatieoverdracht |
| KQL | Kusto Query Language | Querytaal voor Azure-gegevensservices |
| RBAC | Role-Based Access Control | Toegangscontrolemethode op basis van gebruikersrollen |
| REST | Representational State Transfer | Architectuurstijl voor webservices |
| SDK | Software Development Kit | Verzameling van ontwikkeltools |
| SLA | Service Level Agreement | Verplichting voor servicebeschikbaarheid/prestatie |
| SQL | Structured Query Language | Taal voor het beheren van relationele databases |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Cryptografische protocollen |
| URI | Uniform Resource Identifier | Reeks die een resource identificeert |
| URL | Uniform Resource Locator | Type URI dat de locatie van een resource specificeert |
| VM | Virtual Machine | Emulatie van een computersysteem |
| VNet | Virtual Network | Privénetwerk in Azure |
| YAML | YAML Ain't Markup Language | Dataserialisatienorm |

---

## Azure-servicenaam mapping

| Algemene naam | Officiële Azure-servicenaam | azd Host Type |
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

## Context-specifieke termen

### Ontwikkelingstermen
- **Hot Reload**: Automatisch bijwerken van applicaties tijdens ontwikkeling zonder opnieuw te starten
- **Build Pipeline**: Geautomatiseerd proces voor het bouwen en testen van code
- **Deployment Slot**: Staging-omgeving binnen een App Service
- **Environment Parity**: Het gelijktrekken van development-, staging- en productieomgevingen

### Beveiligingstermen
- **Managed Identity**: Azure-functie die automatische credentialbeheer biedt
- **Key Vault**: Veilige opslag voor secrets, sleutels en certificaten
- **RBAC**: Role-based access control voor Azure-resources
- **Network Security Group**: Virtuele firewall voor het controleren van netwerkverkeer

### Monitoringtermen
- **Telemetry**: Geautomatiseerde verzameling van metingen en gegevens
- **Application Performance Monitoring (APM)**: Monitoring van softwareprestaties
- **Log Analytics**: Service voor het verzamelen en analyseren van loggegevens
- **Alert Rules**: Geautomatiseerde meldingen gebaseerd op metriek of voorwaarden

### Implementatietermen
- **Blue-Green Deployment**: Zero-downtime implementatiestrategie
- **Canary Deployment**: Geleidelijke uitrol naar een subset van gebruikers
- **Rolling Update**: Sequentiële vervanging van applicatie-instanties
- **Rollback**: Terugkeren naar een vorige applicatieversie

---

**Gebruikstip**: Gebruik `Ctrl+F` om snel naar specifieke termen in dit woordenboek te zoeken. Termen zijn kruisverwezen waar van toepassing.

---

**Navigatie**
- **Vorige les**: [Cheat Sheet](cheat-sheet.md)
- **Volgende les**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Disclaimer:
Dit document is vertaald met behulp van de AI-vertalingsdienst Co-op Translator (https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het oorspronkelijke document in de oorspronkelijke taal moet als de gezaghebbende bron worden beschouwd. Voor kritieke informatie wordt een professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->