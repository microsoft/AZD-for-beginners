# Ordliste - Azure og AZD Terminologi

**Referanse for Alle Kapitler**
- **📚 Kurs Hjem**: [AZD For Nybegynnere](../README.md)
- **📖 Lær Grunnleggende**: [Kapittel 1: AZD Grunnleggende](../docs/chapter-01-foundation/azd-basics.md)
- **🤖 AI Termer**: [Kapittel 2: AI-Først Utvikling](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduksjon

Denne omfattende ordlisten gir definisjoner for termer, konsepter og forkortelser brukt i Azure Developer CLI og Azure skyutvikling. Essensiell referanse for å forstå teknisk dokumentasjon, feilsøking og effektiv kommunikasjon om azd prosjekter og Azure tjenester.

## Læringsmål

Ved å bruke denne ordlisten vil du:
- Forstå essensiell Azure Developer CLI terminologi og konsepter
- Mestre Azure skyutviklingsvokabular og tekniske begreper
- Referere til Infrastructure as Code og distribusjonsterminologi effektivt
- Forstå Azure tjenestenavn, forkortelser og deres formål
- Få tilgang til definisjoner for feilsøking og debugging terminologi
- Lære avanserte Azure arkitektur- og utviklingskonsepter

## Læringsutfall

Med jevnlig referanse til denne ordlisten vil du kunne:
- Kommunisere effektivt ved bruk av riktig Azure Developer CLI terminologi
- Forstå teknisk dokumentasjon og feilmeldinger tydeligere
- Navigere Azure tjenester og konsepter med selvtillit
- Feilsøke problemer ved hjelp av passende teknisk vokabular
- Bidra i teamdiskusjoner med nøyaktig teknisk språk
- Utvide din Azure skyutviklingskunnskap systematisk

## A

**ARM-mal**  
Azure Resource Manager mal. JSON-basert Infrastructure as Code format brukt for å definere og distribuere Azure ressurser deklarativt.

**App Service**  
Azures platform-as-a-service (PaaS) tilbud for hosting av webapplikasjoner, REST-APIer og mobile bakender uten å håndtere infrastruktur.

**Application Insights**  
Azures tjeneste for overvåking av applikasjonsytelse (APM) som gir dyp innsikt i applikasjonens ytelse, tilgjengelighet og bruk.

**Azure CLI**  
Kommandolinjegrensesnitt for administrasjon av Azure ressurser. Det utfyller AZD men har separat innlogging; kjernen i AZD autentisering bruker `azd auth login`.

**Azure Developer CLI (azd)**  
Utvikler-sentrert kommandolinjeverktøy som akselererer prosessen med å bygge og distribuere applikasjoner til Azure ved hjelp av maler og Infrastructure as Code.

**azure.yaml**  
Hovedkonfigurasjonsfilen for et azd prosjekt som definerer tjenester, infrastruktur og distribusjonshooks.

**Azure Resource Manager (ARM)**  
Azures distribusjons- og administrasjonstjeneste som gir et administrasjonslag for å opprette, oppdatere og slette ressurser.

## B

**Bicep**  
Domene-spesifikt språk (DSL) utviklet av Microsoft for distribusjon av Azure ressurser. Gir enklere syntaks enn ARM-maler samtidig som det kompileres til ARM.

**Bygg**  
Prosessen med å kompilere kildekode, installere avhengigheter og forberede applikasjoner for distribusjon.

**Blue-Green Distribusjon**  
Distribusjonsstrategi som bruker to identiske produksjonsmiljøer (blått og grønt) for å minimere nedetid og risiko.

## C

**Container Apps**  
Azures serverløse container-tjeneste som muliggjør kjøring av containeriserte applikasjoner uten å administrere kompleks infrastruktur.

**CI/CD**  
Kontinuerlig Integrasjon/Kontinuerlig Distribusjon. Automatiserte praksiser for integrering av kodeendringer og distribusjon av applikasjoner.

**Cosmos DB**  
Azures globalt distribuerte, multimodellte databaseservice som tilbyr omfattende SLA-er for gjennomstrømning, latenstid, tilgjengelighet og konsistens.

**Konfigurasjon**  
Innstillinger og parametere som styrer applikasjonsatferd og distribusjonsalternativer.

## D

**Distribusjon**  
Prosessen med å installere og konfigurere applikasjoner og deres avhengigheter på målrettet infrastruktur.

**Docker**  
Plattform for å utvikle, sende og kjøre applikasjoner ved hjelp av containeriseringsteknologi.

**Dockerfile**  
Tekstfil som inneholder instruksjoner for å bygge et Docker container-image.

## E

**Miljø**  
Et distribusjonsmål som representerer en spesifikk forekomst av applikasjonen din (f.eks. utvikling, staging, produksjon).

**Miljøvariabler**  
Konfigurasjonsverdier lagret som nøkkel-verdi-par som applikasjoner kan få tilgang til under kjøring.

**Endepunkt**  
URL eller nettverksadresse der en applikasjon eller tjeneste kan nås.

## F

**Function App**  
Azures serverløse beregningstjeneste som muliggjør kjøring av hendelsesdrevet kode uten å administrere infrastruktur.

## G

**GitHub Actions**  
CI/CD-plattform integrert med GitHub-repositorier for automatisering av arbeidsflyter.

**Git**  
Distribuert versjonskontrollsystem brukt for å spore endringer i kildekode.

## H

**Hooks**  
Egne skript eller kommandoer som kjøres på bestemte punkter i distribusjonslivssyklusen (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Azure tjenestetype der en applikasjon skal distribueres (f.eks. appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Praksisen med å definere og administrere infrastruktur gjennom kode i stedet for manuelle prosesser.

**Init**  
Prosessen med å initialisere et nytt azd prosjekt, vanligvis fra en mal.

## J

**JSON**  
JavaScript Object Notation. Datainterchange-format vanlig brukt for konfigurasjonsfiler og API-responser.

**JWT**  
JSON Web Token. Standard for sikker overføring av informasjon mellom parter som et JSON-objekt.

## K

**Key Vault**  
Azures tjeneste for sikker lagring og håndtering av hemmeligheter, nøkler og sertifikater.

**Kusto Query Language (KQL)**  
Spørringsspråk brukt for å analysere data i Azure Monitor, Application Insights og andre Azure tjenester.

## L

**Load Balancer**  
Tjeneste som fordeler innkommende nettverkstrafikk over flere servere eller instanser.

**Log Analytics**  
Azure tjeneste for innsamling, analyse og handling på telemetridata fra sky- og lokale miljøer.

## M

**Managed Identity**  
Azure-funksjon som gir Azure tjenester en automatisk håndtert identitet for autentisering til andre Azure tjenester.

**Mikrotjenester**  
Arkitektonisk tilnærming hvor applikasjoner bygges som en samling av små, uavhengige tjenester.

**Monitor**  
Azures sammenslåtte overvåkningsløsning som gir fullstendig overvåkbarhet på tvers av applikasjoner og infrastruktur.

## N

**Node.js**  
JavaScript-runtime bygget på Chrome's V8 JavaScript-motor for å bygge server-side applikasjoner.

**npm**  
Pakkehåndterer for Node.js som håndterer avhengigheter og pakker.

## O

**Output**  
Verdier som returneres fra infrastrukturdistribusjon som kan brukes av applikasjoner eller andre ressurser.

## P

**Pakke**  
Prosessen med å forberede applikasjonskode og avhengigheter for distribusjon.

**Parametere**  
Inndata-verdier levert til infrastrukturalemaler for å tilpasse distribusjoner.

**PostgreSQL**  
Åpen kilde relasjonsdatabasesystem støttet som en administrert tjeneste i Azure.

**Provisioning**  
Prosessen med å opprette og konfigurere Azure ressurser definert i infrastrukturenmaler.

## Q

**Kvote**  
Grense for mengden ressurser som kan opprettes i en Azure-abonnement eller region.

## R

**Ressursgruppe**  
Logisk beholder for Azure ressurser som deler samme livssyklus, tillatelser og policyer.

**Ressurs-token**  
Unik streng generert av azd for å sikre at ressursnavn er unike på tvers av distribusjoner.

**REST API**  
Arkitektonisk stil for design av nettverksapplikasjoner ved bruk av HTTP-metoder.

**Rollback**  
Prosess for å gå tilbake til en tidligere versjon av en applikasjon eller infrastrukturkonfigurasjon.

## S

**Tjeneste**  
En komponent av applikasjonen din definert i azure.yaml (f.eks. web-frontend, API-backend, database).

**SKU**  
Stock Keeping Unit. Representerer ulike tjenestenivåer eller ytelsesnivåer for Azure ressurser.

**SQL Database**  
Azures administrerte relasjonsdatabasetjeneste basert på Microsoft SQL Server.

**Static Web Apps**  
Azure tjeneste for å bygge og distribuere full-stack webapplikasjoner fra kildekoderepositorier.

**Storage Account**  
Azure tjeneste som tilbyr skylagring for dataobjekter inkludert blobs, filer, køer og tabeller.

**Abonnement**  
Azure kontobeholder som inneholder ressursgrupper og ressurser, med tilknyttet fakturering og tilgangsstyring.

## T

**Mal**  
Forhåndsbygget prosjektstruktur som inneholder applikasjonskode, infrastrukturoppløsninger og konfigurasjon for vanlige scenarier.

**Terraform**  
Åpen kilde Infrastructure as Code-verktøy som støtter flere skyløsninger inkludert Azure.

**Traffic Manager**  
Azures DNS-baserte trafikkfordeler for å distribuere trafikk på tvers av globale Azure-regioner.

## U

**URI**  
Uniform Resource Identifier. Streng som identifiserer en bestemt ressurs.

**URL**  
Uniform Resource Locator. Type URI som spesifiserer hvor en ressurs befinner seg og hvordan hente den.

## V

**Virtuelt Nettverk (VNet)**  
Grunnleggende byggekloss for private nettverk i Azure, som gir isolasjon og segmentering.

**VS Code**  
Visual Studio Code. Populær kodeeditor med utmerket Azure og azd integrasjon.

## W

**Webhook**  
HTTP callback som trigges av spesifikke hendelser, ofte brukt i CI/CD pipelines.

**What-if**  
Azure-funksjon som viser hvilke endringer som ville bli gjort av en distribusjon uten å utføre den.

## Y

**YAML**  
YAML Ain't Markup Language. Menneskelesbart dataseraliseringsstandard brukt for konfigurasjonsfiler som azure.yaml.

## Z

**Sone**  
Fysisk separate lokasjoner innenfor en Azure region som gir redundans og høy tilgjengelighet.

---

## Vanlige Forkortelser

| Forkortelse | Fullt Navn | Beskrivelse |
|---------|-----------|-------------|
| AAD | Azure Active Directory (nå Microsoft Entra ID) | Identitets- og tilgangsstyringstjeneste |
| ACR | Azure Container Registry | Container image registertjeneste |
| AKS | Azure Kubernetes Service | Administrert Kubernetes tjeneste |
| API | Application Programming Interface | Sett med protokoller for å bygge programvare |
| ARM | Azure Resource Manager | Azures distribusjons- og administrasjonstjeneste |
| CDN | Content Delivery Network | Distribuert nettverk av servere |
| CI/CD | Continuous Integration/Continuous Deployment | Automatiserte utviklingspraksiser |
| CLI | Command Line Interface | Tekstbasert brukergrensesnitt |
| DNS | Domain Name System | System for å oversette domenenavn til IP-adresser |
| HTTPS | Hypertext Transfer Protocol Secure | Sikker versjon av HTTP |
| IaC | Infrastructure as Code | Håndtering av infrastruktur gjennom kode |
| JSON | JavaScript Object Notation | Datainterchange-format |
| JWT | JSON Web Token | Tokenformat for sikker informasjonsformidling |
| KQL | Kusto Query Language | Spørringsspråk for Azure data tjenester |
| RBAC | Role-Based Access Control | Tilgangskontroll basert på brukerroller |
| REST | Representational State Transfer | Arkitektonisk stil for webtjenester |
| SDK | Software Development Kit | Samling utviklingsverktøy |
| SLA | Service Level Agreement | Forpliktelse til tjenestetilgjengelighet/ytelse |
| SQL | Structured Query Language | Språk for å håndtere relasjonsdatabaser |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Kryptografiske protokoller |
| URI | Uniform Resource Identifier | Streng som identifiserer en ressurs |
| URL | Uniform Resource Locator | Type URI som spesifiserer ressurslokasjon |
| VM | Virtuell Maskin | Emulering av et datasystem |
| VNet | Virtuelt Nettverk | Privat nettverk i Azure |
| YAML | YAML Ain't Markup Language | Dataserialiseringsstandard |

---

## Azure Tjenestenavn Kartlegging

| Vanlig Navn | Offisielt Azure Tjenestenavn | azd Host Type |
|-------------|------------------------------|---------------|
| Web App | Azure App Service | `appservice` |
| API App | Azure App Service | `appservice` |
| Container App | Azure Container Apps | `containerapp` |
| Function | Azure Functions | `function` |
| Static Site | Azure Static Web Apps | `staticwebapp` |
| Database | Azure Database for PostgreSQL | Infrastrukturressurs, ikke en applikasjon `host` |
| NoSQL DB | Azure Cosmos DB | Infrastrukturressurs, ikke en applikasjon `host` |
| Storage | Azure Storage Account | Infrastrukturressurs, ikke en innebygd applikasjon `host` |
| Cache | Azure Managed Redis | Infrastrukturressurs, ikke en applikasjon `host` |
| Search | Azure AI Search | Infrastrukturressurs, ikke en applikasjon `host` |
| Messaging | Azure Service Bus | Infrastrukturressurs, ikke en applikasjon `host` |

`services.<name>.host` velger et applikasjonsdistribusjonsmål; det er ikke en forkortelse for noen Azure-ressurstype. Databaser, cacher, søketjenester og køer blir normalt provisjonert gjennom infrastrukturleverandøren og koblet til applikasjonen via outputs/konfigurasjon.

---

## Kontekst-spesifikke Termer

### Utviklingstermer
- **Hot Reload**: Automatisk oppdatering av applikasjoner under utvikling uten omstart
- **Build Pipeline**: Automatisert prosess for bygging og testing av kode
- **Distribusjonslomme**: Staging miljø innenfor en App Service
- **Miljøparitet**: Holde utviklings-, staging- og produksjonsmiljøer like

### Sikkerhetstermer
- **Managed Identity**: Azure-funksjon som gir automatisk håndtering av legitimasjon
- **Key Vault**: Sikker lagring for hemmeligheter, nøkler og sertifikater
- **RBAC**: Rollebasert tilgangskontroll for Azure ressurser
- **Network Security Group**: Virtuell brannmur for å kontrollere nettverkstrafikk

### Overvåkningstermer
- **Telemetri**: Automatisk innsamling av målinger og data
- **Application Performance Monitoring (APM)**: Overvåkning av programvareytelse
- **Log Analytics**: Tjeneste for innsamling og analyse av loggdata
- **Varslingsregler**: Automatiserte varsler basert på metrikker eller betingelser

### Distribusjonstermer
- **Blue-Green Distribusjon**: Distribusjonsstrategi med null nedetid
- **Canary Distribusjon**: Gradvis utrulling til en delmengde av brukere
- **Rullerende Oppdatering**: Sekvensiell erstatning av applikasjonsinstanser
- **Rollback**: Tilbakestilling til tidligere applikasjonsversjon

---

**Brukertips**: Bruk `Ctrl+F` for raskt å søke etter spesifikke termer i denne ordlisten. Termer er kryssreferert der det er aktuelt.

---

**Navigasjon**
- **Forrige Lekse**: [Jukseside](cheat-sheet.md)
- **Neste Lekse**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->