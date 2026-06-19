# Opslagsordbog - Azure og AZD-terminologi

**Reference for alle kapitler**
- **📚 Kursusforside**: [AZD for begyndere](../README.md)
- **📖 Lær det grundlæggende**: [Kapitel 1: AZD-grundlæggende](../docs/getting-started/azd-basics.md)
- **🤖 AI-begreber**: [Kapitel 2: AI-først udvikling](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## Introduktion

Denne omfattende opslagsordbog giver definitioner for termer, koncepter og forkortelser, der bruges i Azure Developer CLI og Azure cloud-udvikling. En væsentlig reference til at forstå teknisk dokumentation, fejlfinde problemer og kommunikere effektivt om azd-projekter og Azure-tjenester.

## Læringsmål

By using this glossary, you will:
- Forstå centrale Azure Developer CLI-termer og koncepter
- Beherske Azure cloud-udviklingsordforråd og tekniske termer
- Referere til Infrastruktur som kode og udrulningsterminologi effektivt
- Forstå Azure-tjenestenavne, forkortelser og deres formål
- Få adgang til definitioner for fejlfinding og debugging-terminologi
- Lære avancerede Azure-arkitektur- og udviklingskoncepter

## Læringsudbytte

With regular reference to this glossary, you will be able to:
- Kommunikere effektivt ved brug af korrekt Azure Developer CLI-terminologi
- Forstå teknisk dokumentation og fejlmeddelelser tydeligere
- Navigere i Azure-tjenester og -koncepter med selvtillid
- Fejlfinde problemer ved brug af passende teknisk ordforråd
- Bidrage til teamdiskussioner med præcist teknisk sprog
- Udvide din viden om Azure cloud-udvikling systematisk

## A

**ARM-skabelon**  
Azure Resource Manager-skabelon. JSON-baseret Infrastruktur som kode-format, der bruges til deklarativt at definere og udrulle Azure-ressourcer.

**App Service**  
Azures platform-as-a-service (PaaS)-tilbud til hosting af webapplikationer, REST-API'er og mobile backends uden at skulle administrere infrastruktur.

**Application Insights**  
Azures applikationsperformance-overvågningstjeneste (APM), der giver dyb indsigt i applikationers ydeevne, tilgængelighed og brug.

**Azure CLI**  
Kommandolinjegrænseflade til at administrere Azure-ressourcer. Bruges af azd til autentificering og nogle operationer.

**Azure Developer CLI (azd)**  
Udviklercentreret kommandolinjeværktøj, der fremskynder processen med at bygge og udrulle applikationer til Azure ved hjælp af skabeloner og Infrastruktur som kode.

**azure.yaml**  
Hovedkonfigurationsfilen for et azd-projekt, der definerer services, infrastruktur og udrulningshooks.

**Azure Resource Manager (ARM)**  
Azures udrulnings- og administrationsservice, der leverer et administreringslag til oprettelse, opdatering og sletning af ressourcer.

## B

**Bicep**  
Domænespecifikt sprog (DSL) udviklet af Microsoft til udrulning af Azure-ressourcer. Giver en simplere syntaks end ARM-skabeloner, mens det kompileres til ARM.

**Build**  
Processen med at kompilere kildekode, installere afhængigheder og forberede applikationer til udrulning.

**Blue-Green Deployment**  
Udrulningsstrategi, der bruger to identiske produktionsmiljøer (blue og green) for at minimere nedetid og risiko.

## C

**Container Apps**  
Azures serverløse container-tjeneste, der muliggør kørsel af containeriserede applikationer uden at administrere kompleks infrastruktur.

**CI/CD**  
Kontinuerlig integration/kontinuerlig udrulning. Automatiserede praksisser for at integrere kodeændringer og udrulle applikationer.

**Cosmos DB**  
Azures globalt distribuerede multimodel-databasetjeneste, der tilbyder omfattende SLA'er for gennemløb, latenstid, tilgængelighed og konsistens.

**Configuration**  
Indstillinger og parametre, der styrer applikationens adfærd og udrulningsmuligheder.

## D

**Deployment**  
Processen med at installere og konfigurere applikationer og deres afhængigheder på mål-infrastrukturen.

**Docker**  
Platform til at udvikle, levere og køre applikationer ved hjælp af containerteknologi.

**Dockerfile**  
Tekstfil med instruktioner til at bygge et Docker-containerbillede.

## E

**Environment**  
Et udrulningsmål, der repræsenterer en specifik instans af din applikation (f.eks. udvikling, staging, produktion).

**Environment Variables**  
Konfigurationsværdier gemt som nøgle-værdi-par, som applikationer kan få adgang til ved køretid.

**Endpoint**  
URL eller netværksadresse, hvor en applikation eller tjeneste kan tilgås.

## F

**Function App**  
Azures serverløse compute-tjeneste, der muliggør kørsel af event-drevet kode uden at administrere infrastruktur.

## G

**GitHub Actions**  
CI/CD-platform integreret med GitHub-repositorier til automatisering af workflows.

**Git**  
Distribueret versionskontrolsystem brugt til at spore ændringer i kildekode.

## H

**Hooks**  
Tilpassede scripts eller kommandoer, der kører på bestemte tidspunkter i udrulningslivscyklussen (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Den Azure-tjenestetype, hvor en applikation vil blive udrullet (f.eks. appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Praksis med at definere og administrere infrastruktur gennem kode i stedet for manuelle processer.

**Init**  
Processen med at initialisere et nyt azd-projekt, typisk fra en skabelon.

## J

**JSON**  
JavaScript Object Notation. Dataudvekslingsformat, der ofte bruges til konfigurationsfiler og API-svar.

**JWT**  
JSON Web Token. Standard for sikkert at overføre information mellem parter som et JSON-objekt.

## K

**Key Vault**  
Azures tjeneste til sikker opbevaring og håndtering af hemmeligheder, nøgler og certifikater.

**Kusto Query Language (KQL)**  
Forespørgselssprog brugt til at analysere data i Azure Monitor, Application Insights og andre Azure-tjenester.

## L

**Load Balancer**  
Tjeneste, der fordeler indkommende netværkstrafik på tværs af flere servere eller instanser.

**Log Analytics**  
Azure-tjeneste til at indsamle, analysere og handle på telemetridata fra cloud- og lokale miljøer.

## M

**Managed Identity**  
Azure-funktion, der giver Azure-tjenester en automatisk administreret identitet til autentificering mod andre Azure-tjenester.

**Microservices**  
Arkitektonisk tilgang, hvor applikationer bygges som en samling af små, uafhængige tjenester.

**Monitor**  
Azures samlede overvågningsløsning, der giver fuld-stack observabilitet på tværs af applikationer og infrastruktur.

## N

**Node.js**  
JavaScript-runtime bygget på Chromes V8 JavaScript-engine til at bygge server-side applikationer.

**npm**  
Pakkestyringsværktøj til Node.js, der håndterer afhængigheder og pakker.

## O

**Output**  
Værdier returneret fra infrastrukturudrulning, som kan bruges af applikationer eller andre ressourcer.

## P

**Package**  
Processen med at pakke applikationskode og afhængigheder til udrulning.

**Parameters**  
Inputværdier, der gives til infrastruktur-skabeloner for at tilpasse udrulninger.

**PostgreSQL**  
Open-source relationsdatabasesystem understøttet som en administreret tjeneste i Azure.

**Provisioning**  
Processen med at oprette og konfigurere Azure-ressourcer defineret i infrastruktur-skabeloner.

## Q

**Quota**  
Begrænsninger for mængden af ressourcer, der kan oprettes i et Azure-abonnement eller en region.

## R

**Resource Group**  
Logisk container for Azure-ressourcer, der deler samme livscyklus, tilladelser og politikker.

**Resource Token**  
Unik streng genereret af azd for at sikre, at ressource-navne er unikke på tværs af udrulninger.

**REST API**  
Arkitektonisk stil til at designe netværksbaserede applikationer ved hjælp af HTTP-metoder.

**Rollback**  
Proces med at rulle tilbage til en tidligere version af en applikation eller infrastrukturkonfiguration.

## S

**Service**  
En komponent af din applikation defineret i azure.yaml (f.eks. web frontend, API-backend, database).

**SKU**  
Stock Keeping Unit. Repræsenterer forskellige servicelag eller ydeevneniveauer for Azure-ressourcer.

**SQL Database**  
Azures administrerede relationsdatabasetjeneste baseret på Microsoft SQL Server.

**Static Web Apps**  
Azure-tjeneste til at bygge og udrulle fuldstack-webapplikationer fra kildekoderepositorier.

**Storage Account**  
Azure-tjeneste, der tilbyder cloud-lagring til dataobjekter, inklusiv blobs, filer, queues og tabeller.

**Subscription**  
Azure-konto-container, der indeholder resource groups og ressourcer, med tilhørende fakturering og adgangsstyring.

## T

**Template**  
Forudbygget projektstruktur indeholdende applikationskode, infrastrukturdefinitioner og konfiguration til almindelige scenarier.

**Terraform**  
Open-source Infrastructure as Code-værktøj, der understøtter flere cloud-udbydere, inklusive Azure.

**Traffic Manager**  
Azures DNS-baserede trafikloadbalancer til at fordele trafik på tværs af globale Azure-regioner.

## U

**URI**  
Uniform Resource Identifier. Streng, der identificerer en bestemt ressource.

**URL**  
Uniform Resource Locator. Type af URI, der angiver, hvor en ressource er placeret, og hvordan den hentes.

## V

**Virtual Network (VNet)**  
Grundlæggende byggesten for private netværk i Azure, der giver isolation og segmentering.

**VS Code**  
Visual Studio Code. Populær kodeeditor med fremragende Azure- og azd-integration.

## W

**Webhook**  
HTTP-callback udløst af specifikke hændelser, ofte brugt i CI/CD-pipelines.

**What-if**  
Azure-funktion, der viser hvilke ændringer der ville blive foretaget af en udrulning uden rent faktisk at udføre den.

## Y

**YAML**  
YAML Ain't Markup Language. Menneskelæselig data-serialiseringsstandard brugt til konfigurationsfiler som azure.yaml.

## Z

**Zone**  
Fysisk separate placeringer inden for en Azure-region, der giver redundans og høj tilgængelighed.

---

## Almindelige forkortelser

| Forkortelse | Udvidet form | Beskrivelse |
|---------|-----------|-------------|
| AAD | Azure Active Directory (nu Microsoft Entra ID) | Identitets- og adgangsstyringstjeneste |
| ACR | Azure Container Registry | Registreringstjeneste for containerbilleder |
| AKS | Azure Kubernetes Service | Administreret Kubernetes-tjeneste |
| API | Application Programming Interface | Sæt af protokoller til at bygge software |
| ARM | Azure Resource Manager | Azures udrulnings- og administrationsservice |
| CDN | Content Delivery Network | Distribueret netværk af servere |
| CI/CD | Kontinuerlig integration/kontinuerlig udrulning | Automatiserede udviklingspraksisser |
| CLI | Command Line Interface | Tekstbaseret brugergrænseflade |
| DNS | Domain Name System | System til at oversætte domænenavne til IP-adresser |
| HTTPS | Hypertext Transfer Protocol Secure | Sikker version af HTTP |
| IaC | Infrastructure as Code | At administrere infrastruktur gennem kode |
| JSON | JavaScript Object Notation | Dataudvekslingsformat |
| JWT | JSON Web Token | Tokenformat for sikker informationsoverførsel |
| KQL | Kusto Query Language | Forespørgselssprog til Azure-datatjenester |
| RBAC | Role-Based Access Control | Rollebaseret adgangskontrol |
| REST | Representational State Transfer | Arkitektonisk stil til webtjenester |
| SDK | Software Development Kit | Samling af udviklingsværktøjer |
| SLA | Service Level Agreement | Serviceniveauaftale |
| SQL | Structured Query Language | Sprog til at administrere relationsdatabaser |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Kryptografiske protokoller |
| URI | Uniform Resource Identifier | Streng, der identificerer en ressource |
| URL | Uniform Resource Locator | Type af URI, der angiver ressourceplacering |
| VM | Virtual Machine | Emulering af et computersystem |
| VNet | Virtual Network | Privat netværk i Azure |
| YAML | YAML Ain't Markup Language | Data-serialiseringsstandard |

---

## Kortlægning af Azure-tjenestenavne

| Almindeligt navn | Officielt Azure-tjenestenavn | azd-værtstype |
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

## Kontekstspecifikke termer

### Udviklingstermer
- **Hot Reload**: Automatisk opdatering af applikationer under udvikling uden genstart
- **Build Pipeline**: Automatiseret proces til at bygge og teste kode
- **Deployment Slot**: Staging-miljø inden for en App Service
- **Environment Parity**: Holde udviklings-, staging- og produktionsmiljøer ensartede

### Sikkerhedstermer
- **Managed Identity**: Azure-funktion der leverer automatisk håndtering af legitimationsoplysninger
- **Key Vault**: Sikker opbevaring for hemmeligheder, nøgler og certifikater
- **RBAC**: Rollebaseret adgangskontrol for Azure-ressourcer
- **Network Security Group**: Virtuel firewall til at kontrollere netværkstrafik

### Overvågningstermer
- **Telemetry**: Automatiseret indsamling af målinger og data
- **Application Performance Monitoring (APM)**: Overvågning af softwares ydeevne
- **Log Analytics**: Tjeneste til at indsamle og analysere logdata
- **Alert Rules**: Automatiserede notifikationer baseret på målinger eller betingelser

### Udrulningstermer
- **Blue-Green Deployment**: Udrulningsstrategi uden nedetid
- **Canary Deployment**: Gradvis udrulning til en delmængde af brugere
- **Rolling Update**: Sekventiel udskiftning af applikationsinstanser
- **Rollback**: Tilbageførsel til tidligere applikationsversion

---

**Brugertip**: Brug `Ctrl+F` for hurtigt at søge efter specifikke termer i denne opslagsordbog. Termer krydsreference hvor det er relevant.

---

**Navigation**
- **Forrige lektion**: [Snydeark](cheat-sheet.md)
- **Næste lektion**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->