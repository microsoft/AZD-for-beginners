<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "f16d2988a24670d1b6aa2372de1a231a",
  "translation_date": "2025-09-17T23:37:22+00:00",
  "source_file": "resources/glossary.md",
  "language_code": "da"
}
-->
# Glossar - Azure og AZD Terminologi

**Reference for alle kapitler**
- **📚 Kursushjem**: [AZD For Begyndere](../README.md)
- **📖 Lær Grundlæggende**: [Kapitel 1: AZD Grundlæggende](../docs/getting-started/azd-basics.md)
- **🤖 AI Termer**: [Kapitel 2: AI-First Udvikling](../docs/ai-foundry/azure-ai-foundry-integration.md)

## Introduktion

Dette omfattende glossar giver definitioner af termer, begreber og akronymer, der bruges i Azure Developer CLI og Azure cloud-udvikling. En essentiel reference til at forstå teknisk dokumentation, fejlfinde problemer og kommunikere effektivt om azd-projekter og Azure-tjenester.

## Læringsmål

Ved at bruge dette glossar vil du:
- Forstå essentielle Azure Developer CLI-termer og begreber
- Mestre ordforråd og tekniske termer inden for Azure cloud-udvikling
- Effektivt referere til Infrastructure as Code og udrulningstermer
- Forstå Azure-tjenestenavne, akronymer og deres formål
- Få adgang til definitioner for fejlfindings- og debugging-termer
- Lære avancerede Azure-arkitektur- og udviklingsbegreber

## Læringsresultater

Med regelmæssig brug af dette glossar vil du kunne:
- Kommunikere effektivt ved hjælp af korrekt Azure Developer CLI-terminologi
- Forstå teknisk dokumentation og fejlmeddelelser mere klart
- Navigere Azure-tjenester og begreber med selvtillid
- Fejlfinde problemer ved hjælp af passende teknisk ordforråd
- Bidrage til teamdiskussioner med præcis teknisk sprogbrug
- Udvide din viden om Azure cloud-udvikling systematisk

## A

**ARM Template**  
Azure Resource Manager-skabelon. JSON-baseret Infrastructure as Code-format, der bruges til at definere og udrulle Azure-ressourcer deklarativt.

**App Service**  
Azures platform-as-a-service (PaaS)-tilbud til hosting af webapplikationer, REST API'er og mobile backends uden behov for at administrere infrastruktur.

**Application Insights**  
Azures applikationsperformance-overvågningstjeneste (APM), der giver dyb indsigt i applikationsperformance, tilgængelighed og brug.

**Azure CLI**  
Kommandolinjegrænseflade til styring af Azure-ressourcer. Bruges af azd til autentificering og visse operationer.

**Azure Developer CLI (azd)**  
Udviklerfokuseret kommandolinjeværktøj, der fremskynder processen med at bygge og udrulle applikationer til Azure ved hjælp af skabeloner og Infrastructure as Code.

**azure.yaml**  
Hovedkonfigurationsfilen for et azd-projekt, der definerer tjenester, infrastruktur og udrulningshooks.

**Azure Resource Manager (ARM)**  
Azures udrulnings- og styringstjeneste, der giver et styringslag til oprettelse, opdatering og sletning af ressourcer.

## B

**Bicep**  
Domænespecifikt sprog (DSL) udviklet af Microsoft til udrulning af Azure-ressourcer. Giver enklere syntaks end ARM-skabeloner, mens det kompilerer til ARM.

**Build**  
Processen med at kompilere kildekode, installere afhængigheder og forberede applikationer til udrulning.

**Blue-Green Deployment**  
Udrulningsstrategi, der bruger to identiske produktionsmiljøer (blå og grøn) for at minimere nedetid og risiko.

## C

**Container Apps**  
Azures serverløse container-tjeneste, der gør det muligt at køre containeriserede applikationer uden at administrere kompleks infrastruktur.

**CI/CD**  
Continuous Integration/Continuous Deployment. Automatiserede praksisser til integration af kodeændringer og udrulning af applikationer.

**Cosmos DB**  
Azures globalt distribuerede, multi-model databaseservice, der tilbyder omfattende SLA'er for gennemløb, latenstid, tilgængelighed og konsistens.

**Configuration**  
Indstillinger og parametre, der styrer applikationsadfærd og udrulningsmuligheder.

## D

**Deployment**  
Processen med at installere og konfigurere applikationer og deres afhængigheder på mål-infrastruktur.

**Docker**  
Platform til udvikling, levering og kørsel af applikationer ved hjælp af containerteknologi.

**Dockerfile**  
Tekstfil, der indeholder instruktioner til opbygning af en Docker-containerbillede.

## E

**Environment**  
Et udrulningsmål, der repræsenterer en specifik instans af din applikation (f.eks. udvikling, staging, produktion).

**Environment Variables**  
Konfigurationsværdier gemt som nøgle-værdi-par, som applikationer kan tilgå under runtime.

**Endpoint**  
URL eller netværksadresse, hvor en applikation eller tjeneste kan tilgås.

## F

**Function App**  
Azures serverløse beregningstjeneste, der gør det muligt at køre begivenhedsdrevet kode uden at administrere infrastruktur.

## G

**GitHub Actions**  
CI/CD-platform integreret med GitHub-repositorier til automatisering af workflows.

**Git**  
Distribueret versionskontrolsystem, der bruges til at spore ændringer i kildekode.

## H

**Hooks**  
Brugerdefinerede scripts eller kommandoer, der kører på specifikke punkter under udrulningslivscyklussen (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Den Azure-tjenestetype, hvor en applikation vil blive udrullet (f.eks. appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Praksis med at definere og administrere infrastruktur gennem kode frem for manuelle processer.

**Init**  
Processen med at initialisere et nyt azd-projekt, typisk fra en skabelon.

## J

**JSON**  
JavaScript Object Notation. Dataudvekslingsformat, der ofte bruges til konfigurationsfiler og API-svar.

**JWT**  
JSON Web Token. Standard til sikker transmission af information mellem parter som en JSON-objekt.

## K

**Key Vault**  
Azures tjeneste til sikker opbevaring og styring af hemmeligheder, nøgler og certifikater.

**Kusto Query Language (KQL)**  
Forespørgselssprog, der bruges til at analysere data i Azure Monitor, Application Insights og andre Azure-tjenester.

## L

**Load Balancer**  
Tjeneste, der distribuerer indgående netværkstrafik på tværs af flere servere eller instanser.

**Log Analytics**  
Azure-tjeneste til indsamling, analyse og handling på telemetridata fra cloud- og on-premises-miljøer.

## M

**Managed Identity**  
Azure-funktion, der giver Azure-tjenester en automatisk administreret identitet til autentificering til andre Azure-tjenester.

**Microservices**  
Arkitektonisk tilgang, hvor applikationer bygges som en samling af små, uafhængige tjenester.

**Monitor**  
Azures samlede overvågningsløsning, der giver fuld-stack synlighed på tværs af applikationer og infrastruktur.

## N

**Node.js**  
JavaScript-runtime bygget på Chromes V8 JavaScript-motor til opbygning af server-side applikationer.

**npm**  
Pakkehåndtering til Node.js, der administrerer afhængigheder og pakker.

## O

**Output**  
Værdier returneret fra infrastrukturudrulning, der kan bruges af applikationer eller andre ressourcer.

## P

**Package**  
Processen med at forberede applikationskode og afhængigheder til udrulning.

**Parameters**  
Inputværdier, der sendes til infrastrukturskabeloner for at tilpasse udrulninger.

**PostgreSQL**  
Open-source relationsdatabasesystem understøttet som en administreret tjeneste i Azure.

**Provisioning**  
Processen med at oprette og konfigurere Azure-ressourcer defineret i infrastrukturskabeloner.

## Q

**Quota**  
Grænser for mængden af ressourcer, der kan oprettes i et Azure-abonnement eller en region.

## R

**Resource Group**  
Logisk container for Azure-ressourcer, der deler samme livscyklus, tilladelser og politikker.

**Resource Token**  
Unik streng genereret af azd for at sikre, at ressourcenavne er unikke på tværs af udrulninger.

**REST API**  
Arkitektonisk stil til design af netværksapplikationer ved hjælp af HTTP-metoder.

**Rollback**  
Processen med at vende tilbage til en tidligere version af en applikation eller infrastrukturkonfiguration.

## S

**Service**  
En komponent af din applikation defineret i azure.yaml (f.eks. web frontend, API backend, database).

**SKU**  
Stock Keeping Unit. Repræsenterer forskellige tjenesteniveauer eller ydelsesniveauer for Azure-ressourcer.

**SQL Database**  
Azures administrerede relationsdatabaseservice baseret på Microsoft SQL Server.

**Static Web Apps**  
Azure-tjeneste til opbygning og udrulning af full-stack webapplikationer fra kildekoderepositorier.

**Storage Account**  
Azure-tjeneste, der tilbyder cloud-lagring til dataobjekter, herunder blobs, filer, køer og tabeller.

**Subscription**  
Azure-kontocontainer, der indeholder resourcegrupper og ressourcer med tilhørende fakturering og adgangsstyring.

## T

**Template**  
Forudbygget projektstruktur, der indeholder applikationskode, infrastruktursdefinitioner og konfiguration til almindelige scenarier.

**Terraform**  
Open-source Infrastructure as Code-værktøj, der understøtter flere cloud-leverandører, herunder Azure.

**Traffic Manager**  
Azures DNS-baserede trafikbelastningsbalancer til distribution af trafik på tværs af globale Azure-regioner.

## U

**URI**  
Uniform Resource Identifier. Streng, der identificerer en bestemt ressource.

**URL**  
Uniform Resource Locator. Type af URI, der angiver, hvor en ressource er placeret, og hvordan den kan hentes.

## V

**Virtual Network (VNet)**  
Grundlæggende byggesten for private netværk i Azure, der giver isolation og segmentering.

**VS Code**  
Visual Studio Code. Populær kodeeditor med fremragende Azure- og azd-integration.

## W

**Webhook**  
HTTP-tilbagekald udløst af specifikke begivenheder, ofte brugt i CI/CD-pipelines.

**What-if**  
Azure-funktion, der viser, hvilke ændringer der ville blive foretaget af en udrulning uden faktisk at udføre den.

## Y

**YAML**  
YAML Ain't Markup Language. Menneskelæsbart data-serialiseringsstandard, der bruges til konfigurationsfiler som azure.yaml.

## Z

**Zone**  
Fysisk adskilte lokationer inden for en Azure-region, der giver redundans og høj tilgængelighed.

---

## Almindelige Akronymer

| Akronym | Fuld Form | Beskrivelse |
|---------|-----------|-------------|
| AAD | Azure Active Directory | Identitets- og adgangsstyringstjeneste |
| ACR | Azure Container Registry | Containerbilledregistertjeneste |
| AKS | Azure Kubernetes Service | Administreret Kubernetes-tjeneste |
| API | Application Programming Interface | Sæt af protokoller til opbygning af software |
| ARM | Azure Resource Manager | Azures udrulnings- og styringstjeneste |
| CDN | Content Delivery Network | Distribueret netværk af servere |
| CI/CD | Continuous Integration/Continuous Deployment | Automatiserede udviklingspraksisser |
| CLI | Command Line Interface | Tekstbaseret brugergrænseflade |
| DNS | Domain Name System | System til oversættelse af domænenavne til IP-adresser |
| HTTPS | Hypertext Transfer Protocol Secure | Sikker version af HTTP |
| IaC | Infrastructure as Code | Styring af infrastruktur gennem kode |
| JSON | JavaScript Object Notation | Dataudvekslingsformat |
| JWT | JSON Web Token | Token-format til sikker informationstransmission |
| KQL | Kusto Query Language | Forespørgselssprog til Azure-datatjenester |
| RBAC | Role-Based Access Control | Adgangsstyringsmetode baseret på brugerroller |
| REST | Representational State Transfer | Arkitektonisk stil til webtjenester |
| SDK | Software Development Kit | Samling af udviklingsværktøjer |
| SLA | Service Level Agreement | Forpligtelse til tjenestetilgængelighed/ydelse |
| SQL | Structured Query Language | Sprog til styring af relationsdatabaser |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Kryptografiske protokoller |
| URI | Uniform Resource Identifier | Streng, der identificerer en ressource |
| URL | Uniform Resource Locator | Type af URI, der angiver ressourceplacering |
| VM | Virtual Machine | Emulering af et computersystem |
| VNet | Virtual Network | Privat netværk i Azure |
| YAML | YAML Ain't Markup Language | Data-serialiseringsstandard |

---

## Azure Tjenestenavn Mapping

| Almindeligt Navn | Officielt Azure Tjenestenavn | azd Host Type |
|------------------|------------------------------|---------------|
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

## Kontekstspecifikke Termer

### Udviklingstermer
- **Hot Reload**: Automatisk opdatering af applikationer under udvikling uden genstart
- **Build Pipeline**: Automatiseret proces til opbygning og test af kode
- **Deployment Slot**: Staging-miljø inden for en App Service
- **Environment Parity**: At holde udviklings-, staging- og produktionsmiljøer ens

### Sikkerhedstermer
- **Managed Identity**: Azure-funktion, der giver automatisk styring af legitimationsoplysninger
- **Key Vault**: Sikker opbevaring til hemmeligheder, nøgler og certifikater
- **RBAC**: Rollebaseret adgangsstyring for Azure-ressourcer
- **Network Security Group**: Virtuel firewall til styring af netværkstrafik

### Overvågningstermer
- **Telemetry**: Automatisk indsamling af målinger og data
- **Application Performance Monitoring (APM)**: Overvågning af softwareperformance
- **Log Analytics**: Tjeneste til indsamling og analyse af logdata
- **Alert Rules**: Automatiske notifikationer baseret på metrikker eller betingelser

### Udrulningstermer
- **Blue-Green Deployment**: Udrulningsstrategi uden nedetid
- **Canary Deployment**: Gradvis udrulning til en delmængde af brugere
- **Rolling Update**: Sekventiel udskiftning af applikationsinstanser
- **Rollback**: Tilbagevenden til tidligere applikationsversion

---

**Brugertip**: Brug `Ctrl+F` til hurtigt at søge efter specifikke termer i dette glossar. Termer er krydsrefereret, hvor det er relevant.

---

**Navigation**
- **Forrige Lektion**: [Cheat Sheet](cheat-sheet.md)
- **Næste Lektion**: [FAQ](faq.md)

---

**Ansvarsfraskrivelse**:  
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.