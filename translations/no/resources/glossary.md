# Ordliste - Azure og AZD Terminologi

**Referanse for alle kapitler**
- **📚 Kurs Hjem**: [AZD For Nybegynnere](../README.md)
- **📖 Lær Grunnleggende**: [Kapittel 1: AZD Grunnleggende](../docs/getting-started/azd-basics.md)
- **🤖 AI-termer**: [Kapittel 2: AI-Først Utvikling](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## Introduksjon

Denne omfattende ordlisten gir definisjoner for termer, konsepter og forkortelser brukt i Azure Developer CLI og Azure skyutvikling. Essensiell referanse for å forstå teknisk dokumentasjon, feilsøking, og effektiv kommunikasjon om azd prosjekter og Azure-tjenester.

## Læringsmål

Ved å bruke denne ordlisten vil du:
- Forstå essensiell Azure Developer CLI terminologi og konsepter
- Mestre Azure skyutviklings vokabular og tekniske begreper
- Effektivt referere til Infrastructure as Code og distribusjonsterminologi
- Forstå Azure tjenestenavn, forkortelser og deres formål
- Få tilgang til definisjoner for feilsøkings- og debugging-termer
- Lære avanserte Azure arkitektur- og utviklingskonsepter

## Læringsutbytte

Med jevnlig referanse til denne ordlisten, vil du kunne:
- Kommunisere effektivt med korrekt Azure Developer CLI terminologi
- Forstå teknisk dokumentasjon og feilmeldinger klarere
- Navigere Azure-tjenester og konsepter med selvtillit
- Feilsøke problemer ved å bruke riktig teknisk vokabular
- Bidra i teamdiskusjoner med nøyaktig teknisk språk
- Utvide din kunnskap om Azure skyutvikling systematisk

## A

**ARM Template**  
Azure Resource Manager-mal. JSON-basert Infrastructure as Code-format brukt til å definere og distribuere Azure-ressurser deklarativt.

**App Service**  
Azures platform-as-a-service (PaaS) tilbud for hosting av webapplikasjoner, REST API-er, og mobile backend uten å administrere infrastruktur.

**Application Insights**  
Azures applikasjonsytelsesovervåkning (APM) tjeneste som gir dyp innsikt i applikasjonens ytelse, tilgjengelighet, og bruk.

**Azure CLI**  
Kommandolinjegrensesnitt for å administrere Azure-ressurser. Brukes av azd for autentisering og noen operasjoner.

**Azure Developer CLI (azd)**  
Utvikler-sentrert kommandolinjeverktøy som akselererer prosessen med å bygge og distribuere applikasjoner til Azure ved hjelp av maler og Infrastructure as Code.

**azure.yaml**  
Hovedkonfigurasjonsfil for et azd-prosjekt som definerer tjenester, infrastruktur og distribusjonshaker.

**Azure Resource Manager (ARM)**  
Azures distribusjons- og administrasjonstjeneste som tilbyr et administrasjonslag for å opprette, oppdatere, og slette ressurser.

## B

**Bicep**  
Domenespesifikt språk (DSL) utviklet av Microsoft for distribusjon av Azure-ressurser. Gir enklere syntaks enn ARM-maler samtidig som det kompileres til ARM.

**Build**  
Prosessen med å kompilere kildekode, installere avhengigheter, og forberede applikasjoner for distribusjon.

**Blue-Green Deployment**  
Distribusjonsstrategi som bruker to identiske produksjonsmiljøer (blått og grønt) for å minimere nedetid og risiko.

## C

**Container Apps**  
Azures serverløse kontenertjeneste som muliggjør kjøring av containeriserte applikasjoner uten å administrere kompleks infrastruktur.

**CI/CD**  
Kontinuerlig Integrasjon/Kontinuerlig Distribusjon. Automatiserte praksiser for å integrere kodeendringer og distribuere applikasjoner.

**Cosmos DB**  
Azures globalt distribuerte, multimodells database tjeneste som gir omfattende SLA-er for gjennomstrømning, latens, tilgjengelighet og konsistens.

**Configuration**  
Innstillinger og parametere som styrer applikasjonens oppførsel og distribusjonsalternativer.

## D

**Deployment**  
Prosessen med å installere og konfigurere applikasjoner og deres avhengigheter på målrettet infrastruktur.

**Docker**  
Plattform for å utvikle, distribuere og kjøre applikasjoner ved bruk av containerteknologi.

**Dockerfile**  
Tekstfil som inneholder instruksjoner for å bygge et Docker container-bilde.

## E

**Environment**  
Et distribusjonsmål som representerer en spesifikk instans av applikasjonen din (f.eks. utvikling, staging, produksjon).

**Environment Variables**  
Konfigurasjonsverdier lagret som nøkkel-verdi-par som applikasjoner kan hente under kjøring.

**Endpoint**  
URL eller nettverksadresse hvor en applikasjon eller tjeneste kan nås.

## F

**Function App**  
Azures serverløse kjøretjeneste som muliggjør kjøring av hendelsesdrevet kode uten å administrere infrastruktur.

## G

**GitHub Actions**  
CI/CD-plattform integrert med GitHub-repositorier for å automatisere arbeidsflyter.

**Git**  
Distribuert versjonskontrollsystem brukt for å spore endringer i kildekode.

## H

**Hooks**  
Egendefinerte skript eller kommandoer som kjører på bestemte punkter i distribusjonslivssyklusen (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Azure tjenestetype hvor en applikasjon skal distribueres (f.eks. appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Praksis for å definere og administrere infrastruktur gjennom kode fremfor manuelle prosesser.

**Init**  
Prosessen med å initialisere et nytt azd-prosjekt, vanligvis fra en mal.

## J

**JSON**  
JavaScript Object Notation. Datautvekslingsformat ofte brukt for konfigurasjonsfiler og API-svar.

**JWT**  
JSON Web Token. Standard for sikker overføring av informasjon mellom parter som et JSON-objekt.

## K

**Key Vault**  
Azures tjeneste for sikker lagring og håndtering av hemmeligheter, nøkler og sertifikater.

**Kusto Query Language (KQL)**  
Spørrespråk brukt for å analysere data i Azure Monitor, Application Insights, og andre Azure-tjenester.

## L

**Load Balancer**  
Tjeneste som fordeler innkommende nettverkstrafikk på flere servere eller instanser.

**Log Analytics**  
Azure-tjeneste for å samle inn, analysere og handle på telemetridata fra sky- og lokale miljøer.

## M

**Managed Identity**  
Azure-funksjon som gir Azure-tjenester en automatisk administrert identitet for autentisering til andre Azure-tjenester.

**Microservices**  
Arkitekturtilnærming hvor applikasjoner bygges som en samling små, uavhengige tjenester.

**Monitor**  
Azures enhetlige overvåkningsløsning som tilbyr full-stack observabilitet på tvers av applikasjoner og infrastruktur.

## N

**Node.js**  
JavaScript-runtime bygget på Chromes V8 JavaScript-motor for server-side applikasjoner.

**npm**  
Pakkehåndterer for Node.js som håndterer avhengigheter og pakker.

## O

**Output**  
Verdier returnert fra infrastrukturdistribusjon som kan brukes av applikasjoner eller andre ressurser.

## P

**Package**  
Prosessen med å klargjøre applikasjonskode og avhengigheter for distribusjon.

**Parameters**  
Inndata-verdier sendt til infrastrukturmaler for å tilpasse distribusjoner.

**PostgreSQL**  
Åpen kildekode-relasjonsdatabasesystem støttet som en håndtert tjeneste i Azure.

**Provisioning**  
Prosessen med å opprette og konfigurere Azure-ressurser definert i infrastrukturmaler.

## Q

**Quota**  
Begrensninger på mengden ressurser som kan opprettes i et Azure-abonnement eller region.

## R

**Resource Group**  
Logisk beholder for Azure-ressurser som deler samme livssyklus, tillatelser og policyer.

**Resource Token**  
Unik streng generert av azd for å sikre at ressursnavn er unike på tvers av distribusjoner.

**REST API**  
Arkitektonisk stil for å designe nettverksapplikasjoner ved bruk av HTTP-metoder.

**Rollback**  
Prosess med å gå tilbake til en tidligere versjon av en applikasjon eller infrastrukturkonfigurasjon.

## S

**Service**  
En komponent av applikasjonen definert i azure.yaml (f.eks. web frontend, API backend, database).

**SKU**  
Stock Keeping Unit. Representerer ulike servicelag eller ytelsesnivåer for Azure-ressurser.

**SQL Database**  
Azures håndterte relasjonsdatabasetjeneste basert på Microsoft SQL Server.

**Static Web Apps**  
Azure-tjeneste for å bygge og distribuere fullstack webapplikasjoner fra kildekoderepositorier.

**Storage Account**  
Azure-tjeneste som tilbyr skylagring for dataobjekter inkludert blobs, filer, køer og tabeller.

**Subscription**  
Azure-kontobeholder som inneholder ressursgrupper og ressurser med tilknyttet fakturering og tilgangsstyring.

## T

**Template**  
Forhåndsbygget prosjektstruktur som inneholder applikasjonskode, infrastrukturdefinisjoner og konfigurasjon for vanlige scenarier.

**Terraform**  
Åpen kildekode Infrastructure as Code-verktøy som støtter flere skyleverandører inkludert Azure.

**Traffic Manager**  
Azures DNS-baserte trafikkbelastningsfordeler for å distribuere trafikk på tvers av globale Azure-regioner.

## U

**URI**  
Uniform Resource Identifier. Streng som identifiserer en bestemt ressurs.

**URL**  
Uniform Resource Locator. Type URI som spesifiserer hvor en ressurs er lokalisert og hvordan den kan nås.

## V

**Virtual Network (VNet)**  
Grunnleggende byggestein for private nettverk i Azure som tilbyr isolasjon og segmentering.

**VS Code**  
Visual Studio Code. Populær kodeeditor med utmerket Azure og azd integrasjon.

## W

**Webhook**  
HTTP-kall tilbake trigget av spesifikke hendelser, vanlig brukt i CI/CD-pipelines.

**What-if**  
Azure-funksjon som viser hvilke endringer som ville blitt gjort av en distribusjon uten å faktisk utføre den.

## Y

**YAML**  
YAML Ain't Markup Language. Menneskelesbart dataserieringsformat som brukes for konfigurasjonsfiler som azure.yaml.

## Z

**Zone**  
Fysisk separate lokasjoner innen en Azure-region som gir redundans og høy tilgjengelighet.

---

## Vanlige Forkortelser

| Forkortelse | Fullt Navn | Beskrivelse |
|---------|-----------|-------------|
| AAD | Azure Active Directory | Identitets- og tilgangsstyringstjeneste |
| ACR | Azure Container Registry | Tjeneste for containerbilderegistre |
| AKS | Azure Kubernetes Service | Håndtert Kubernetes-tjeneste |
| API | Application Programming Interface | Sett av protokoller for programvarebygging |
| ARM | Azure Resource Manager | Azures distribusjons- og administrasjonstjeneste |
| CDN | Content Delivery Network | Distribuert nettverk av servere |
| CI/CD | Continuous Integration/Continuous Deployment | Automatiserte utviklingspraksiser |
| CLI | Command Line Interface | Tekstbasert brukergrensesnitt |
| DNS | Domain Name System | System for oversettelse av domenenavn til IP-adresser |
| HTTPS | Hypertext Transfer Protocol Secure | Sikker versjon av HTTP |
| IaC | Infrastructure as Code | Administrasjon av infrastruktur gjennom kode |
| JSON | JavaScript Object Notation | Datautvekslingsformat |
| JWT | JSON Web Token | Tokenformat for sikker informasjonsutveksling |
| KQL | Kusto Query Language | Spørrespråk for Azure-data tjenester |
| RBAC | Role-Based Access Control | Tilgangskontrollmetode basert på brukerroller |
| REST | Representational State Transfer | Arkitektonisk stil for webtjenester |
| SDK | Software Development Kit | Samling av utviklingsverktøy |
| SLA | Service Level Agreement | Forpliktelse til tjenestetilgjengelighet/ytelse |
| SQL | Structured Query Language | Språk for administrasjon av relasjonsdatabaser |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Kryptografiske protokoller |
| URI | Uniform Resource Identifier | Streng som identifiserer en ressurs |
| URL | Uniform Resource Locator | Type URI som spesifiserer ressurslokasjon |
| VM | Virtual Machine | Emulering av et datasystem |
| VNet | Virtual Network | Privat nettverk i Azure |
| YAML | YAML Ain't Markup Language | Dataserieringsstandard |

---

## Azure Tjenestenavn Mappings

| Vanlig Navn | Offisielt Azure Tjenestenavn | azd Host Type |
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

## Kontekstspesifikke Termer

### Utviklingstermer
- **Hot Reload**: Automatisk oppdatering av applikasjoner under utvikling uten omstart
- **Build Pipeline**: Automatisert prosess for bygging og testing av kode
- **Deployment Slot**: Staging-miljø innenfor en App Service
- **Environment Parity**: Å holde utviklings-, staging- og produksjonsmiljøer like

### Sikkerhetstermer
- **Managed Identity**: Azure-funksjon som tilbyr automatisk administrasjon av legitimasjon
- **Key Vault**: Sikker lagring for hemmeligheter, nøkler og sertifikater
- **RBAC**: Rollebasert tilgangskontroll for Azure-ressurser
- **Network Security Group**: Virtuell brannmur for å kontrollere nettverkstrafikk

### Overvåkningstermer
- **Telemetry**: Automatisk innsamling av målinger og data
- **Application Performance Monitoring (APM)**: Overvåkning av programvareytelse
- **Log Analytics**: Tjeneste for innsamling og analyse av loggdata
- **Alert Rules**: Automatiserte varsler basert på metrikker eller betingelser

### Distribusjonstermer
- **Blue-Green Deployment**: Null-nedetids distribusjonsstrategi
- **Canary Deployment**: Gradvis utrulling til en delmengde brukere
- **Rolling Update**: Sekvensiell utskifting av applikasjonsinstanser
- **Rollback**: Gå tilbake til tidligere applikasjonsversjon

---

**Brukertips**: Bruk `Ctrl+F` for raskt å søke etter spesifikke termer i denne ordlisten. Termer er kryssreferert der det er relevant.

---

**Navigasjon**
- **Forrige Leksjon**: [Cheat Sheet](cheat-sheet.md)
- **Neste Leksjon**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på dets opprinnelige språk bør betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår som følge av bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->