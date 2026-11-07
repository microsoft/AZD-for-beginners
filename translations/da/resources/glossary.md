# Ordliste - Azure og AZD Terminologi

**Reference for alle kapitler**
- **📚 Kursushjem**: [AZD For Begyndere](../README.md)
- **📖 Lær det grundlæggende**: [Kapitel 1: AZD Grundlæggende](../docs/chapter-01-foundation/azd-basics.md)
- **🤖 AI Termer**: [Kapitel 2: AI-First Udvikling](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduktion

Denne omfattende ordliste giver definitioner for termer, begreber og forkortelser brugt i Azure Developer CLI og Azure cloud-udvikling. En væsentlig reference for forståelse af teknisk dokumentation, fejlfinding og effektiv kommunikation om azd-projekter og Azure-tjenester.

## Læringsmål

Ved at bruge denne ordliste vil du:
- Forstå vigtige Azure Developer CLI-termer og begreber
- Mestre Azure cloud udviklingsordforråd og tekniske termer
- Effektivt referere til Infrastructure as Code og deployeringsterminologi
- Forstå Azure tjenestenavne, forkortelser og deres formål
- Få adgang til definitioner til fejlfinding og debugging-terminologi
- Lære avancerede Azure arkitektur- og udviklingskoncepter

## Læringsudbytte

Med regelmæssig reference til denne ordliste vil du være i stand til at:
- Kommunikere effektivt ved brug af korrekt Azure Developer CLI-terminologi
- Forstå teknisk dokumentation og fejlmeddelelser tydeligere
- Navigere selvstændigt i Azure tjenester og koncepter
- Fejlfinde problemer ved brug af passende teknisk sprog
- Bidrage til teamdiskussioner med præcist teknisk sprogbrug
- Udvide din Azure cloud udviklingsviden systematisk

## A

**ARM Template**  
Azure Resource Manager-template. JSON-baseret Infrastructure as Code-format brugt til at definere og deployere Azure-ressourcer deklarativt.

**App Service**  
Azures platform-som-en-tjeneste (PaaS) løsning til hosting af webapplikationer, REST API'er og mobile backend uden at skulle administrere infrastruktur.

**Application Insights**  
Azures overvågningstjeneste for applikationsperformance, der giver dyb indsigt i applikationsydelse, tilgængelighed og brug.

**Azure CLI**  
Kommandolinjegrænseflade til administration af Azure-ressourcer. Supplerer AZD, men har separat login; kerne-AZD-autentificering bruger `azd auth login`.

**Azure Developer CLI (azd)**  
Udviklerfokuseret kommandolinjeværktøj, der fremskynder processen med at bygge og deployere applikationer til Azure ved brug af templates og Infrastructure as Code.

**azure.yaml**  
Hovedkonfigurationsfilen for et azd-projekt, der definerer services, infrastruktur og deploy-hooks.

**Azure Resource Manager (ARM)**  
Azures deployerings- og administrationsservice, der tilbyder et lag til oprettelse, opdatering og sletning af ressourcer.

## B

**Bicep**  
Domænespecifikt sprog (DSL) udviklet af Microsoft til deployment af Azure-ressourcer. Tilbyder enklere syntaks end ARM-templates, samtidig med at den kompileres til ARM.

**Build**  
Processen med at kompilere kildetekst, installere afhængigheder og forberede applikationer til deployment.

**Blue-Green Deployment**  
Deploy-strategi, der anvender to identiske produktionsmiljøer (blå og grøn) for at minimere nedetid og risiko.

## C

**Container Apps**  
Azures serverløse container-tjeneste, der muliggør kørsel af containeriserede applikationer uden administration af kompleks infrastruktur.

**CI/CD**  
Continuous Integration/Continuous Deployment. Automatiserede processer til integration af kodeændringer og deployment af applikationer.

**Cosmos DB**  
Azures globalt distribuerede, multimodel database-service, der tilbyder omfattende SLA’er for gennemløb, latency, tilgængelighed og konsistens.

**Configuration**  
Indstillinger og parametre, der styrer applikationsadfærd og deploymentsmuligheder.

## D

**Deployment**  
Processen med at installere og konfigurere applikationer og deres afhængigheder på mål-infrastruktur.

**Docker**  
Platform til udvikling, forsendelse og kørsel af applikationer ved brug af container-teknologi.

**Dockerfile**  
Tekstfil indeholdende instruktioner til bygning af et Docker-containerimage.

## E

**Environment**  
Et deployeringsmål, der repræsenterer en specifik instans af din applikation (f.eks. udvikling, staging, produktion).

**Environment Variables**  
Konfigurationsværdier gemt som nøgle-værdi-par, som applikationer kan tilgå ved køretid.

**Endpoint**  
URL eller netværksadresse hvor en applikation eller tjeneste kan tilgås.

## F

**Function App**  
Azures serverløse compute-tjeneste, der muliggør kørsel af event-drevet kode uden infrastrukturadministration.

## G

**GitHub Actions**  
CI/CD-platform integreret med GitHub repositories til automatisering af workflows.

**Git**  
Distribueret versionskontrolsystem brugt til at spore ændringer i kildekode.

## H

**Hooks**  
Brugerdefinerede scripts eller kommandoer, der kører på specifikke tidspunkter under deploy-livscyklussen (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Azure tjenestetype hvor en applikation bliver deployeret (f.eks. appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Praksis med at definere og administrere infrastruktur gennem kode frem for manuelle processer.

**Init**  
Processen med at initialisere et nyt azd-projekt, typisk ud fra en template.

## J

**JSON**  
JavaScript Object Notation. Dataudvekslingsformat, der almindeligvis bruges til konfigurationsfiler og API-svar.

**JWT**  
JSON Web Token. Standard for sikker transmission af information mellem parter som et JSON-objekt.

## K

**Key Vault**  
Azures tjeneste til sikker lagring og administration af secrets, nøgler og certifikater.

**Kusto Query Language (KQL)**  
Forespørgselssprog brugt til at analysere data i Azure Monitor, Application Insights og andre Azure-tjenester.

## L

**Load Balancer**  
Tjeneste, der fordeler indkommende netværkstrafik over flere servere eller instanser.

**Log Analytics**  
Azure-tjeneste til at indsamle, analysere og reagere på telemetridata fra cloud og on-premises miljøer.

## M

**Managed Identity**  
Azure-funktion, der giver Azure-tjenester en automatisk administreret identitet til autentificering mod andre Azure-tjenester.

**Microservices**  
Arkitektonisk tilgang, hvor applikationer er bygget som en samling af små, uafhængige services.

**Monitor**  
Azures samlede overvågningsløsning, der giver fuldstændig observabilitet på tværs af applikationer og infrastruktur.

## N

**Node.js**  
JavaScript runtime bygget på Chromes V8 JavaScript-motor til opbygning af server-side applikationer.

**npm**  
Pakkehåndteringsværktøj til Node.js, der styrer afhængigheder og pakker.

## O

**Output**  
Værdier returneret fra infrastrukturdeployment, som kan bruges af applikationer eller andre ressourcer.

## P

**Package**  
Processen med at forberede applikationskode og afhængigheder til deployment.

**Parameters**  
Inputværdier overført til infrastrukturomskabeloner for at tilpasse deployment.

**PostgreSQL**  
Open source relationelt databasesystem, der understøttes som en administreret tjeneste i Azure.

**Provisioning**  
Processen med at oprette og konfigurere Azure-ressourcer defineret i infrastrukturomskabeloner.

## Q

**Quota**  
Begrænsninger på mængden af ressourcer, der kan oprettes i et Azure-abonnement eller -region.

## R

**Resource Group**  
Logisk container for Azure-ressourcer, der deler samme livscyklus, tilladelser og politikker.

**Resource Token**  
Unik streng genereret af azd til at sikre, at ressourcenavne er unikke på tværs af deployment.

**REST API**  
Arkitektonisk stil til design af netværksapplikationer ved brug af HTTP-metoder.

**Rollback**  
Proces med at gendanne en tidligere version af en applikation eller infrastrukturkonfiguration.

## S

**Service**  
En komponent af din applikation defineret i azure.yaml (f.eks. web frontend, API backend, database).

**SKU**  
Stock Keeping Unit. Repræsenterer forskellige serviceniveauer eller ydelsesniveauer for Azure-ressourcer.

**SQL Database**  
Azures administrerede relationelle databaseservice baseret på Microsoft SQL Server.

**Static Web Apps**  
Azure-tjeneste til at bygge og deployere fuld-stack webapplikationer fra kildekode-repositories.

**Storage Account**  
Azure-tjeneste, der tilbyder cloud-lagring til dataobjekter, herunder blobs, filer, køer og tabeller.

**Subscription**  
Azure-kontocontainer, der indeholder ressourcegrupper og ressourcer med tilknyttet fakturering og adgangsstyring.

## T

**Template**  
Forudbygget projektstruktur indeholdende applikationskode, infrastrukturopstillinger og konfiguration til almindelige scenarier.

**Terraform**  
Open source Infrastructure as Code-værktøj, der understøtter flere cloud-udbydere inklusive Azure.

**Traffic Manager**  
Azures DNS-baserede trafikloadbalancer til fordeling af trafik på tværs af globale Azure-regioner.

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
HTTP callback, der udløses af specifikke hændelser, ofte brugt i CI/CD pipelines.

**What-if**  
Azure-funktion, der viser hvilke ændringer der ville ske ved en deployment uden at udføre den.

## Y

**YAML**  
YAML Ain't Markup Language. Menneskelæsbart data-serialiseringsstandard brugt til konfigurationsfiler som azure.yaml.

## Z

**Zone**  
Fysisk adskilte steder inden for en Azure-region, der tilbyder redundans og høj tilgængelighed.

---

## Almindelige Forkortelser

| Forkortelse | Fuld Form | Beskrivelse |
|---------|-----------|-------------|
| AAD | Azure Active Directory (nu Microsoft Entra ID) | Tjeneste til identitets- og adgangsstyring |
| ACR | Azure Container Registry | Container image registry service |
| AKS | Azure Kubernetes Service | Administreret Kubernetes-tjeneste |
| API | Application Programming Interface | Sæt af protokoller til softwareudvikling |
| ARM | Azure Resource Manager | Azures deployerings- og administrationsservice |
| CDN | Content Delivery Network | Distribueret netværk af servere |
| CI/CD | Continuous Integration/Continuous Deployment | Automatiserede udviklingspraksisser |
| CLI | Command Line Interface | Tekstbaseret brugergrænseflade |
| DNS | Domain Name System | System til oversættelse af domænenavne til IP-adresser |
| HTTPS | Hypertext Transfer Protocol Secure | Sikker version af HTTP |
| IaC | Infrastructure as Code | Administration af infrastruktur gennem kode |
| JSON | JavaScript Object Notation | Dataudvekslingsformat |
| JWT | JSON Web Token | Tokenformat til sikker informationsoverførsel |
| KQL | Kusto Query Language | Forespørgselssprog til Azure data-tjenester |
| RBAC | Role-Based Access Control | Adgangskontrolmetode baseret på brugerroller |
| REST | Representational State Transfer | Arkitektonisk stil for webtjenester |
| SDK | Software Development Kit | Samling af udviklingsværktøjer |
| SLA | Service Level Agreement | Forpligtelse til tjeneste-tilgængelighed/performance |
| SQL | Structured Query Language | Sprog til administration af relationelle databaser |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Kryptografiske protokoller |
| URI | Uniform Resource Identifier | Streng, der identificerer en ressource |
| URL | Uniform Resource Locator | Type af URI, der angiver ressourceplacering |
| VM | Virtual Machine | Emulering af et computersystem |
| VNet | Virtual Network | Privat netværk i Azure |
| YAML | YAML Ain't Markup Language | Data-serialiseringsstandard |

---

## Kortlægning af Azure Tjenestenavne

| Almindeligt Navn | Officielt Azure Tjenestenavn | azd Host Type |
|-------------|------------------------------|---------------|
| Web App | Azure App Service | `appservice` |
| API App | Azure App Service | `appservice` |
| Container App | Azure Container Apps | `containerapp` |
| Function | Azure Functions | `function` |
| Static Site | Azure Static Web Apps | `staticwebapp` |
| Database | Azure Database for PostgreSQL | Infrastrukturressource, ikke en applikation `host` |
| NoSQL DB | Azure Cosmos DB | Infrastrukturressource, ikke en applikation `host` |
| Storage | Azure Storage Account | Infrastrukturressource, ikke en indbygget applikation `host` |
| Cache | Azure Managed Redis | Infrastrukturressource, ikke en applikation `host` |
| Search | Azure AI Search | Infrastrukturressource, ikke en applikation `host` |
| Messaging | Azure Service Bus | Infrastrukturressource, ikke en applikation `host` |

`services.<name>.host` vælger et deploymentsmål for en applikation; det er ikke en forkortelse for nogen Azure-ressourcetype. Databaser, caches, søgetjenester og køer provisioneres normalt gennem infrastrukturudbyderen og tilsluttes applikationen via outputs/konfiguration.

---

## Kontekst-specifikke Termer

### Udviklingstermer
- **Hot Reload**: Automatisk opdatering af applikationer under udvikling uden genstart
- **Build Pipeline**: Automatiseret proces til opbygning og test af kode
- **Deployment Slot**: Staging-miljø inden for en App Service
- **Environment Parity**: At holde udviklings-, staging- og produktionsmiljøer ensartede

### Sikkerhedstermer
- **Managed Identity**: Azure-funktion der giver automatisk credential-administration
- **Key Vault**: Sikker lagring af secrets, nøgler og certifikater
- **RBAC**: Rollebaseret adgangskontrol til Azure-ressourcer
- **Network Security Group**: Virtuel firewall til styring af netværkstrafik

### Overvågningstermer
- **Telemetry**: Automatisk indsamling af målinger og data
- **Application Performance Monitoring (APM)**: Overvågning af softwareperformance
- **Log Analytics**: Tjeneste til indsamling og analyse af logdata
- **Alert Rules**: Automatiske notifikationer baseret på målinger eller betingelser

### Deploymenttermer
- **Blue-Green Deployment**: Deployment-strategi uden nedetid
- **Canary Deployment**: Gradvis udrulning til en brugergruppe
- **Rolling Update**: Sekventiel udskiftning af applikationsinstanser
- **Rollback**: Tilbageførsel til tidligere applikationsversion

---

**Brugertip**: Brug `Ctrl+F` til hurtigt at søge efter specifikke termer i denne ordliste. Termer krydsrefereres hvor relevant.

---

**Navigation**
- **Forrige Lektion**: [Oversigtsskema](cheat-sheet.md)
- **Næste Lektion**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->