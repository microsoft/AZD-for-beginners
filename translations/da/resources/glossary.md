# Ordliste - Azure og AZD-terminologi

**Reference for All Chapters**
- **📚 Kursusforside**: [AZD For Beginners](../README.md)
- **📖 Lær det grundlæggende**: [Chapter 1: AZD Basics](../docs/getting-started/azd-basics.md)
- **🤖 AI-termer**: [Chapter 2: AI-First Development](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## Introduction

Denne omfattende ordliste giver definitioner af termer, begreber og forkortelser, der bruges i Azure Developer CLI og Azure-cloududvikling. Værdifuld reference til at forstå teknisk dokumentation, fejlfinde problemer og kommunikere effektivt om azd-projekter og Azure-tjenester.

## Læringsmål

Ved at bruge denne ordliste vil du:
- Forstå væsentlig Azure Developer CLI-terminologi og -begreber
- Mestre Azure-cloududviklingsordforråd og tekniske termer
- Slå infrastruktur som kode og udrulningsterminologi hurtigt op
- Forstå Azure-tjenestenavne, forkortelser og deres formål
- Få adgang til definitioner til fejlfinding og debugging
- Lære avancerede Azure-arkitektur- og udviklingskoncepter

## Læringsresultater

Ved regelmæssig brug af denne ordliste vil du være i stand til at:
- Kommunikere effektivt ved hjælp af korrekt Azure Developer CLI-terminologi
- Forstå teknisk dokumentation og fejlkoder mere klart
- Navigere Azure-tjenester og koncepter med selvtillid
- Fejlsøge problemer ved hjælp af passende teknisk vokabular
- Bidrage til teamdiskussioner med præcist teknisk sprog
- Udvide din viden om Azure-cloududvikling systematisk

## A

**ARM-skabelon**  
Azure Resource Manager-skabelon. JSON-baseret infrastruktur-som-kode-format, der bruges til at definere og implementere Azure-ressourcer deklarativt.

**App Service**  
Azures platform-som-en-tjeneste (PaaS)-tilbud til hosting af webapplikationer, REST-API'er og mobile backends uden at skulle administrere infrastruktur.

**Application Insights**  
Azures applikationsperformanceovervågning (APM)-tjeneste, der giver dyb indsigt i applikationsydelse, tilgængelighed og brug.

**Azure CLI**  
Kommando-linjegrænseflade til administration af Azure-ressourcer. Bruges af azd til godkendelse og visse operationer.

**Azure Developer CLI (azd)**  
Udviklercentreret kommandolinjeværktøj, der accélérer processen med at bygge og udrulle applikationer til Azure ved hjælp af skabeloner og infrastruktur som kode.

**azure.yaml**  
Hovedkonfigurationsfilen for et azd-projekt, der definerer tjenester, infrastruktur og udrulningshooks.

**Azure Resource Manager (ARM)**  
Azures udrulnings- og administrationsservice, der leverer et administrationslag til oprettelse, opdatering og sletning af ressourcer.

## B

**Bicep**  
Domænespecifikt sprog (DSL) udviklet af Microsoft til udrulning af Azure-ressourcer. Tilbyder enklere syntaks end ARM-skabeloner og kompileres til ARM.

**Build**  
Processen med at kompilere kildekode, installere afhængigheder og forberede applikationer til udrulning.

**Blue-Green Deployment**  
Udrulningsstrategi, der bruger to identiske produktionsmiljøer (blue og green) for at minimere nedetid og risiko.

## C

**Container Apps**  
Azures serverløse containerservice, der muliggør kørsel af containeriserede applikationer uden at administrere kompleks infrastruktur.

**CI/CD**  
Continuous Integration/Continuous Deployment. Automatiserede praksisser til at integrere kodeændringer og udrulle applikationer.

**Cosmos DB**  
Azures globalt distribuerede, multimodel-databasetjeneste, der tilbyder omfattende SLA'er for gennemløb, latenstid, tilgængelighed og konsistens.

**Configuration**  
Indstillinger og parametre, der styrer applikationsadfærd og udrulningsmuligheder.

## D

**Deployment**  
Processen med at installere og konfigurere applikationer og deres afhængigheder på målrettet infrastruktur.

**Docker**  
Platform til at udvikle, levere og køre applikationer ved hjælp af containeriseringsteknologi.

**Dockerfile**  
Tekstfil, der indeholder instruktioner til at bygge et Docker-containerbillede.

## E

**Environment**  
Et udrulningsmål, der repræsenterer en specifik forekomst af din applikation (f.eks. udvikling, staging, produktion).

**Environment Variables**  
Konfigurationsværdier gemt som nøgle-værdi-par, som applikationer kan få adgang til ved runtime.

**Endpoint**  
URL eller netværksadresse, hvor en applikation eller tjeneste kan tilgås.

## F

**Function App**  
Azures serverløse compute-tjeneste, der muliggør kørsel af hændelsesdrevet kode uden at administrere infrastruktur.

## G

**GitHub Actions**  
CI/CD-platform integreret med GitHub-repositorier til automatisering af workflows.

**Git**  
Distribueret versionskontrolsystem brugt til at spore ændringer i kildekode.

## H

**Hooks**  
Brugerdefinerede scripts eller kommandoer, der kører på specifikke tidspunkter i udrulningslivscyklussen (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Den Azure-tjenestetype, hvor en applikation vil blive udrullet (f.eks. appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Praksis med at definere og administrere infrastruktur gennem kode frem for manuelle processer.

**Init**  
Processen med at initialisere et nyt azd-projekt, typisk fra en skabelon.

## J

**JSON**  
JavaScript Object Notation. Dataudvekslingsformat almindeligt brugt til konfigurationsfiler og API-responser.

**JWT**  
JSON Web Token. Standard til sikker overførsel af information mellem parter som et JSON-objekt.

## K

**Key Vault**  
Azures tjeneste til sikker lagring og administration af hemmeligheder, nøgler og certifikater.

**Kusto Query Language (KQL)**  
Forespørgselssprog brugt til at analysere data i Azure Monitor, Application Insights og andre Azure-tjenester.

## L

**Load Balancer**  
Tjeneste, der fordeler indkommende netværkstrafik på tværs af flere servere eller instanser.

**Log Analytics**  
Azure-tjeneste til indsamling, analyse og handling på telemetridata fra cloud- og on-premises-miljøer.

## M

**Managed Identity**  
Azure-funktion, der giver Azure-tjenester en automatisk administreret identitet til godkendelse mod andre Azure-tjenester.

**Microservices**  
Arkitektonisk tilgang, hvor applikationer bygges som en samling af små, uafhængige tjenester.

**Monitor**  
Azures samlede overvågningsløsning, der giver fuldstack-observabilitet på tværs af applikationer og infrastruktur.

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
Processen med at forberede applikationskode og afhængigheder til udrulning.

**Parameters**  
Inputværdier sendt til infrastrukturskabeloner for at tilpasse udrulninger.

**PostgreSQL**  
Open-source relationsdatabasesystem, der understøttes som en administreret tjeneste i Azure.

**Provisioning**  
Processen med at oprette og konfigurere Azure-ressourcer defineret i infrastrukturskabeloner.

## Q

**Quota**  
Begrænsninger på mængden af ressourcer, der kan oprettes i en Azure-abonnement eller region.

## R

**Resource Group**  
Logisk container for Azure-ressourcer, der deler samme livscyklus, tilladelser og politikker.

**Resource Token**  
Unik streng genereret af azd for at sikre, at ressourcenavne er unikke på tværs af udrulninger.

**REST API**  
Arkitektonisk stil til at designe netværksbaserede applikationer ved hjælp af HTTP-metoder.

**Rollback**  
Proces med at vende tilbage til en tidligere version af en applikation eller infrastrukturkonfiguration.

## S

**Service**  
En komponent af din applikation defineret i azure.yaml (f.eks. web frontend, API backend, database).

**SKU**  
Stock Keeping Unit. Repræsenterer forskellige tjenesteniveauer eller ydeevneklasser for Azure-ressourcer.

**SQL Database**  
Azures administrerede relationsdatabasetjeneste baseret på Microsoft SQL Server.

**Static Web Apps**  
Azure-tjeneste til at bygge og udrulle full-stack webapplikationer fra source code repositories.

**Storage Account**  
Azure-tjeneste, der tilbyder cloud-lagring til dataobjekter inklusive blobs, filer, queues og tabeller.

**Subscription**  
Azure-kontobeholder, der indeholder resource groups og ressourcer, med tilknyttet fakturering og adgangsstyring.

## T

**Template**  
Forudbygget projektstruktur, der indeholder applikationskode, infrastrukturoversigter og konfiguration til almindelige scenarier.

**Terraform**  
Open-source Infrastructure as Code-værktøj, der understøtter flere cloud-udbydere, herunder Azure.

**Traffic Manager**  
Azures DNS-baserede trafikloadbalancer til at fordele trafik på tværs af globale Azure-regioner.

## U

**URI**  
Uniform Resource Identifier. Streng, der identificerer en bestemt ressource.

**URL**  
Uniform Resource Locator. Type af URI, der specificerer, hvor en ressource er placeret og hvordan den hentes.

## V

**Virtual Network (VNet)**  
Grundlæggende byggesten for private netværk i Azure, der giver isolation og segmentering.

**VS Code**  
Visual Studio Code. Populær kodeeditor med fremragende Azure- og azd-integration.

## W

**Webhook**  
HTTP-callback udløst af specifikke hændelser, almindeligvis brugt i CI/CD-pipelines.

**What-if**  
Azure-funktion, der viser hvilke ændringer en udrulning ville foretage uden faktisk at udføre dem.

## Y

**YAML**  
YAML Ain't Markup Language. Menneskeligt læsbart data-serialiseringsstandard brugt til konfigurationsfiler som azure.yaml.

## Z

**Zone**  
Fysisk separate placeringer inden for en Azure-region, der giver redundans og høj tilgængelighed.

---

## Almindelige forkortelser

| Acronym | Fuld form | Beskrivelse |
|---------|-----------|-------------|
| AAD | Azure Active Directory | Identitets- og adgangsstyringstjeneste |
| ACR | Azure Container Registry | Container image registry-tjeneste |
| AKS | Azure Kubernetes Service | Administreret Kubernetes-tjeneste |
| API | Application Programming Interface | Sæt af protokoller til at bygge software |
| ARM | Azure Resource Manager | Azures udrulnings- og administrationsservice |
| CDN | Content Delivery Network | Distribueret netværk af servere |
| CI/CD | Continuous Integration/Continuous Deployment | Automatiserede udviklingspraksisser |
| CLI | Command Line Interface | Tekstbaseret brugergrænseflade |
| DNS | Domain Name System | System til at oversætte domænenavne til IP-adresser |
| HTTPS | Hypertext Transfer Protocol Secure | Sikker version af HTTP |
| IaC | Infrastructure as Code | Administration af infrastruktur gennem kode |
| JSON | JavaScript Object Notation | Dataudvekslingsformat |
| JWT | JSON Web Token | Tokenformat til sikker informationsudveksling |
| KQL | Kusto Query Language | Forespørgselssprog til Azure-datatjenester |
| RBAC | Role-Based Access Control | Adgangskontrolmetode baseret på brugerroller |
| REST | Representational State Transfer | Arkitektonisk stil for webtjenester |
| SDK | Software Development Kit | Samling af udviklingsværktøjer |
| SLA | Service Level Agreement | Forpligtelse til tjenestetilgængelighed/ydelse |
| SQL | Structured Query Language | Sprog til at håndtere relationsdatabaser |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Kryptografiske protokoller |
| URI | Uniform Resource Identifier | Streng, der identificerer en ressource |
| URL | Uniform Resource Locator | Type af URI, der specificerer ressourceplacering |
| VM | Virtual Machine | Emulering af et computersystem |
| VNet | Virtual Network | Privat netværk i Azure |
| YAML | YAML Ain't Markup Language | Data-serialiseringsstandard |

---

## Kortlægning af Azure-servicenavne

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

## Kontekst-specifikke termer

### Udviklingstermer
- **Hot Reload**: Automatisk opdatering af applikationer under udvikling uden genstart
- **Build Pipeline**: Automatiseret proces til at bygge og teste kode
- **Deployment Slot**: Staging-miljø inden for en App Service
- **Environment Parity**: At holde udviklings-, staging- og produktionsmiljøer lignende

### Sikkerhedstermer
- **Managed Identity**: Azure-funktion, der giver automatisk credential-administration
- **Key Vault**: Sikker opbevaring til hemmeligheder, nøgler og certifikater
- **RBAC**: Rollebaseret adgangskontrol til Azure-ressourcer
- **Network Security Group**: Virtuel firewall til kontrol af netværkstrafik

### Overvågningstermer
- **Telemetry**: Automatisk indsamling af målinger og data
- **Application Performance Monitoring (APM)**: Overvågning af softwareydelse
- **Log Analytics**: Tjeneste til indsamling og analyse af logdata
- **Alert Rules**: Automatiske notifikationer baseret på målinger eller betingelser

### Udrulningstermer
- **Blue-Green Deployment**: Udrulningsstrategi uden nedetid
- **Canary Deployment**: Gradvis udrulning til en delmængde af brugere
- **Rolling Update**: Sekventiel udskiftning af applikationsinstanser
- **Rollback**: Tilbagevenden til tidligere applikationsversion

---

**Brugertip**: Brug `Ctrl+F` til hurtigt at søge efter specifikke termer i denne ordliste. Termer er krydsrefereret, hvor det er relevant.

---

**Navigation**
- **Forrige lektion**: [Cheat Sheet](cheat-sheet.md)
- **Næste lektion**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, bedes du være opmærksom på, at automatiske oversættelser kan indeholde fejl eller unøjagtigheder. Det oprindelige dokument i dets oprindelige sprog bør betragtes som den autoritative kilde. For kritiske oplysninger anbefales en professionel, menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der måtte opstå som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->