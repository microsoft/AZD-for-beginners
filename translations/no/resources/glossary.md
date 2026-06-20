# Ordliste - Azure og AZD Terminologi

**Referanse for alle kapitler**  
- **📚 Kurs Hjem**: [AZD For Beginners](../README.md)  
- **📖 Lær Grunnleggende**: [Kapittel 1: AZD Grunnleggende](../docs/getting-started/azd-basics.md)  
- **🤖 AI Begreper**: [Kapittel 2: AI-Først Utvikling](../docs/microsoft-foundry/microsoft-foundry-integration.md)  

## Introduksjon

Denne omfattende ordlisten gir definisjoner for begreper, konsepter og akronymer som brukes i Azure Developer CLI og Azure skyutvikling. Essensiell referanse for å forstå teknisk dokumentasjon, feilsøke problemer og kommunisere effektivt om azd-prosjekter og Azure-tjenester.

## Læringsmål

Ved å bruke denne ordlisten vil du:  
- Forstå essensiell Azure Developer CLI terminologi og konsepter  
- Mestre Azure skyutviklingsvokabular og tekniske termer  
- Effektivt referere til Infrastructure as Code og utrullings-terminologi  
- Forstå Azure tjenestenavn, akronymer og deres formål  
- Få tilgang til definisjoner for feilsøking og debugging-terminologi  
- Lære avanserte Azure arkitektur- og utviklingskonsepter  

## Læringsutbytte

Med jevnlig bruk av denne ordlisten vil du kunne:  
- Kommunisere effektivt ved bruk av korrekt Azure Developer CLI terminologi  
- Forstå teknisk dokumentasjon og feilmeldinger tydeligere  
- Navigere Azure-tjenester og konsepter med selvtillit  
- Feilsøke problemer ved bruk av riktig teknisk vokabular  
- Bidra til diskusjoner i teamet med nøyaktig teknisk språk  
- Systematisk utvide din kunnskap om Azure skyutvikling  

## A

**ARM Template**  
Azure Resource Manager-mal. JSON-basert Infrastructure as Code-format som brukes til å definere og distribuere Azure-ressurser deklarativt.

**App Service**  
Azures plattform-som-en-tjeneste (PaaS) tilbud for hosting av webapplikasjoner, REST APIer og mobil-backender uten å håndtere infrastruktur.

**Application Insights**  
Azures tjeneste for overvåking av applikasjonsytelse (APM) som gir dyp innsikt i applikasjonens ytelse, tilgjengelighet og bruk.

**Azure CLI**  
Kommandolinjegrensesnitt for administrasjon av Azure-ressurser. Brukes av azd for autentisering og enkelte operasjoner.

**Azure Developer CLI (azd)**  
Utviklerfokusert kommandolinjeverktøy som akselererer prosessen med å bygge og deployere applikasjoner til Azure ved hjelp av maler og Infrastructure as Code.

**azure.yaml**  
Hovedkonfigurasjonsfilen for et azd-prosjekt som definerer tjenester, infrastruktur og deploy-hooks.

**Azure Resource Manager (ARM)**  
Azures tjeneste for distribusjon og administrasjon som gir et administrasjonslag for å opprette, oppdatere og slette ressurser.

## B

**Bicep**  
Domene-spesifikt språk (DSL) utviklet av Microsoft for deployering av Azure-ressurser. Gir enklere syntaks enn ARM-maler samtidig som det kompileres til ARM.

**Build**  
Prosessen med å kompilere kildekode, installere avhengigheter og forberede applikasjoner for deployering.

**Blue-Green Deployment**  
Deployeringsstrategi som bruker to identiske produksjonsmiljøer (blå og grønn) for å minimere nedetid og risiko.

## C

**Container Apps**  
Azures serverløse container-tjeneste som muliggjør kjøring av containeriserte applikasjoner uten å håndtere kompleks infrastruktur.

**CI/CD**  
Kontinuerlig integrasjon/kontinuerlig deployering. Automatiserte praksiser for å integrere kodeendringer og deployere applikasjoner.

**Cosmos DB**  
Azures globalt distribuerte, multi-modell database-tjeneste som tilbyr omfattende SLA-er for gjennomstrømning, latens, tilgjengelighet og konsistens.

**Configuration**  
Innstillinger og parametere som styrer applikasjonsatferd og deploy-alternativer.

## D

**Deployment**  
Prosessen med å installere og konfigurere applikasjoner og deres avhengigheter på mål-infrastruktur.

**Docker**  
Plattform for å utvikle, pakke og kjøre applikasjoner ved hjelp av containerteknologi.

**Dockerfile**  
Tekstfil som inneholder instrukser for bygging av et Docker-containerbilde.

## E

**Environment**  
En deployeringsmål som representerer en spesifikk instans av applikasjonen din (f.eks. utvikling, staging, produksjon).

**Environment Variables**  
Konfigurasjonsverdier lagret som nøkkel-verdi-par som applikasjoner kan bruke under kjøring.

**Endpoint**  
URL eller nettverksadresse hvor en applikasjon eller tjeneste kan nås.

## F

**Function App**  
Azures serverløse compute-tjeneste som muliggjør kjøring av hendelsesdrevet kode uten å håndtere infrastruktur.

## G

**GitHub Actions**  
CI/CD-plattform integrert med GitHub-repositorier for automatisering av arbeidsflyter.

**Git**  
Distribuert versjonskontrollsystem brukt til å spore endringer i kildekode.

## H

**Hooks**  
Tilpassede skript eller kommandoer som kjører på bestemte punkter i deploy-livssyklusen (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Azure tjenestetype hvor en applikasjon skal deployeres (f.eks. appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Praksisen med å definere og administrere infrastruktur ved hjelp av kode i stedet for manuelle prosesser.

**Init**  
Prosessen med å initialisere et nytt azd-prosjekt, vanligvis fra en mal.

## J

**JSON**  
JavaScript Object Notation. Datautvekslingsformat ofte brukt for konfigurasjonsfiler og API-responser.

**JWT**  
JSON Web Token. Standard for sikker overføring av informasjon mellom parter som et JSON-objekt.

## K

**Key Vault**  
Azures tjeneste for sikker lagring og håndtering av hemmeligheter, nøkler og sertifikater.

**Kusto Query Language (KQL)**  
Spørrespråk brukt for å analysere data i Azure Monitor, Application Insights og andre Azure-tjenester.

## L

**Load Balancer**  
Tjeneste som distribuerer innkommende nettverkstrafikk over flere servere eller instanser.

**Log Analytics**  
Azure-tjeneste for innsamling, analyse og handling på telemetridata fra sky- og lokaldistribuerte miljøer.

## M

**Managed Identity**  
Azure-funksjon som gir Azure-tjenester en automatisk håndtert identitet for autentisering mot andre Azure-tjenester.

**Microservices**  
Arkitekturstil hvor applikasjoner bygges som en samling små, uavhengige tjenester.

**Monitor**  
Azures enhetlige overvåkingsløsning som gir fullstendig synlighet over applikasjoner og infrastruktur.

## N

**Node.js**  
JavaScript-runtime bygget på Chromes V8 JavaScript-motor for server-side applikasjoner.

**npm**  
Pakkebehandler for Node.js som håndterer avhengigheter og pakker.

## O

**Output**  
Verdier returnert fra infrastrukturdeployering som kan brukes av applikasjoner eller andre ressurser.

## P

**Package**  
Prosessen med å forberede applikasjonskode og avhengigheter for deployering.

**Parameters**  
Inndata verdier sendt til infrastruktur-maler for å tilpasse deployeringer.

**PostgreSQL**  
Åpen kildekode relasjonsdatabase system støttet som en administrert tjeneste i Azure.

**Provisioning**  
Prosessen med å opprette og konfigurere Azure-ressurser definert i infrastruktur-maler.

## Q

**Quota**  
Begrensninger på antall ressurser som kan opprettes i et Azure-abonnement eller region.

## R

**Resource Group**  
Logisk beholder for Azure-ressurser som deler samme livssyklus, tillatelser og retningslinjer.

**Resource Token**  
Unik streng generert av azd for å sikre at ressursnavn er unike på tvers av deployeringer.

**REST API**  
Arkitekturstil for design av nettverksapplikasjoner ved bruk av HTTP-metoder.

**Rollback**  
Prosess for å gå tilbake til en tidligere versjon av en applikasjon eller infrastrukturkonfigurasjon.

## S

**Service**  
En komponent i applikasjonen din definert i azure.yaml (f.eks. web frontend, API backend, database).

**SKU**  
Stock Keeping Unit. Representerer ulike tjenestenivåer eller ytelsesnivåer for Azure-ressurser.

**SQL Database**  
Azures administrerte relasjonsdatabasetjeneste basert på Microsoft SQL Server.

**Static Web Apps**  
Azure-tjeneste for bygging og deployering av full-stack nettsider fra kildekoderepositorier.

**Storage Account**  
Azure-tjeneste som tilbyr skylagring for dataobjekter inklusiv blobs, filer, køer og tabeller.

**Subscription**  
Azure-kontobeholder som inneholder ressursgrupper og ressurser, med tilhørende fakturering og tilgangsstyring.

## T

**Template**  
Forhåndsbygget prosjektstruktur som inneholder applikasjonskode, infrastrukturoppsett og konfigurasjon for vanlige scenarier.

**Terraform**  
Åpen kildekode Infrastructure as Code-verktøy som støtter flere sky-leverandører inklusiv Azure.

**Traffic Manager**  
Azures DNS-baserte trafikkbelaster for distribusjon av trafikk på tvers av globale Azure-regioner.

## U

**URI**  
Uniform Resource Identifier. Streng som identifiserer en bestemt ressurs.

**URL**  
Uniform Resource Locator. Type URI som spesifiserer hvor en ressurs er lokalisert og hvordan den nås.

## V

**Virtual Network (VNet)**  
Grunnleggende byggestein for private nettverk i Azure som tilbyr isolasjon og segmentering.

**VS Code**  
Visual Studio Code. Populær kodeeditor med utmerket Azure- og azd-integrasjon.

## W

**Webhook**  
HTTP-tilbakekalling utløst av spesifikke hendelser, ofte brukt i CI/CD pipelines.

**What-if**  
Azure-funksjon som viser hvilke endringer en deployering ville gjort uten å faktisk utføre den.

## Y

**YAML**  
YAML er ikke et markeringsspråk. Målrettet data-serialiseringsstandard brukt for konfigurasjonsfiler som azure.yaml.

## Z

**Zone**  
Fysisk separate lokasjoner innenfor en Azure-region som gir redundans og høy tilgjengelighet.

---

## Vanlige Akronymer

| Akronym | Fullt navn | Beskrivelse |
|---------|------------|-------------|
| AAD | Azure Active Directory (nå Microsoft Entra ID) | Identitets- og tilgangsstyringstjeneste |
| ACR | Azure Container Registry | Container-bilde registry tjeneste |
| AKS | Azure Kubernetes Service | Administrert Kubernetes-tjeneste |
| API | Application Programming Interface | Sett av protokoller for programvarebygging |
| ARM | Azure Resource Manager | Azures distribusjons- og administrasjonstjeneste |
| CDN | Content Delivery Network | Distribuert nettverk av servere |
| CI/CD | Continuous Integration/Continuous Deployment | Automatiserte utviklingsprosesser |
| CLI | Command Line Interface | Tekstbasert brukergrensesnitt |
| DNS | Domain Name System | System for å oversette domenenavn til IP-adresser |
| HTTPS | Hypertext Transfer Protocol Secure | Sikker versjon av HTTP |
| IaC | Infrastructure as Code | Administrasjon av infrastruktur gjennom kode |
| JSON | JavaScript Object Notation | Datautvekslingsformat |
| JWT | JSON Web Token | Token-format for sikker informasjonsoverføring |
| KQL | Kusto Query Language | Spørrespråk for Azure dataservicer |
| RBAC | Role-Based Access Control | Tilgangskontroll basert på brukerroller |
| REST | Representational State Transfer | Arkitekturstil for webtjenester |
| SDK | Software Development Kit | Samling utviklingsverktøy |
| SLA | Service Level Agreement | Forpliktelse til tjenestetilgjengelighet/ytelse |
| SQL | Structured Query Language | Språk for håndtering av relasjonsdatabaser |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Kryptografiske protokoller |
| URI | Uniform Resource Identifier | Streng som identifiserer en ressurs |
| URL | Uniform Resource Locator | Type URI som angir ressursens plassering |
| VM | Virtual Machine | Emulering av et datasystem |
| VNet | Virtual Network | Privat nettverk i Azure |
| YAML | YAML Ain't Markup Language | Data-serialiseringstandard |

---

## Azure Tjenestenavn Mappings

| Vanlig navn | Offisielt Azure tjenestenavn | azd Host-type |
|-------------|-------------------------------|---------------|
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

## Kontekstspesifikke Termer

### Utviklingstermer  
- **Hot Reload**: Automatisk oppdatering av applikasjoner under utvikling uten omstart  
- **Build Pipeline**: Automatisert prosess for bygging og testing av kode  
- **Deployment Slot**: Staging-miljø innenfor en App Service  
- **Environment Parity**: Å holde utviklings-, staging- og produksjonsmiljøer like  

### Sikkerhetstermer  
- **Managed Identity**: Azure-funksjon som tilbyr automatisk håndtering av legitimasjon  
- **Key Vault**: Sikker lagring for hemmeligheter, nøkler og sertifikater  
- **RBAC**: Rollebasert tilgangskontroll for Azure-ressurser  
- **Network Security Group**: Virtuell brannmur for å kontrollere nettverkstrafikk  

### Overvåkningstermer  
- **Telemetry**: Automatisk innsamling av målinger og data  
- **Application Performance Monitoring (APM)**: Overvåking av programvareytelse  
- **Log Analytics**: Tjeneste for innsamling og analyse av loggdata  
- **Alert Rules**: Automatiserte varsler basert på målinger eller tilstander  

### Deployeringstermer  
- **Blue-Green Deployment**: Utrullingsstrategi uten nedetid  
- **Canary Deployment**: Gradvis utrulling til en brukergruppe  
- **Rolling Update**: Sekvensiell utskifting av applikasjonsinstanser  
- **Rollback**: Tilbakestilling til tidligere versjon av applikasjon  

---

**Brukertips**: Bruk `Ctrl+F` for raskt å søke etter spesifikke termer i denne ordlisten. Termer er kryssreferert der det er relevant.

---

**Navigasjon**  
- **Forrige leksjon**: [Cheat Sheet](cheat-sheet.md)  
- **Neste leksjon**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->