# Ordliste - Azure og AZD Terminologi

**Referanse for alle kapitler**
- **📚 Kursoversikt**: [AZD For Nybegynnere](../README.md)
- **📖 Lær Grunnleggende**: [Kapittel 1: AZD Grunnleggende](../docs/getting-started/azd-basics.md)
- **🤖 AI Begreper**: [Kapittel 2: AI-First Utvikling](../docs/ai-foundry/azure-ai-foundry-integration.md)

## Introduksjon

Denne omfattende ordlisten gir definisjoner for begreper, konsepter og forkortelser som brukes i Azure Developer CLI og Azure skyutvikling. En essensiell referanse for å forstå teknisk dokumentasjon, feilsøke problemer og kommunisere effektivt om azd-prosjekter og Azure-tjenester.

## Læringsmål

Ved å bruke denne ordlisten vil du:
- Forstå essensiell terminologi og konsepter for Azure Developer CLI
- Mestre vokabularet og tekniske begreper for Azure skyutvikling
- Effektivt referere til Infrastructure as Code og distribusjonsterminologi
- Forstå Azure-tjenestenavn, forkortelser og deres formål
- Få tilgang til definisjoner for feilsøking og debugging-terminologi
- Lære avanserte konsepter innen Azure-arkitektur og utvikling

## Læringsutbytte

Med regelmessig bruk av denne ordlisten vil du kunne:
- Kommunisere effektivt ved å bruke korrekt terminologi for Azure Developer CLI
- Forstå teknisk dokumentasjon og feilmeldinger tydeligere
- Navigere Azure-tjenester og konsepter med selvtillit
- Feilsøke problemer ved å bruke riktig teknisk vokabular
- Bidra til teamdiskusjoner med presist teknisk språk
- Systematisk utvide din kunnskap om Azure skyutvikling

## A

**ARM-mal**  
Azure Resource Manager-mal. JSON-basert format for Infrastructure as Code som brukes til å definere og distribuere Azure-ressurser deklarativt.

**App Service**  
Azure sin plattform-som-en-tjeneste (PaaS) for hosting av webapplikasjoner, REST API-er og mobile backend-tjenester uten å administrere infrastruktur.

**Application Insights**  
Azure sin tjeneste for applikasjonsytelsesovervåking (APM) som gir dyp innsikt i applikasjonsytelse, tilgjengelighet og bruk.

**Azure CLI**  
Kommandolinjegrensesnitt for administrasjon av Azure-ressurser. Brukes av azd for autentisering og enkelte operasjoner.

**Azure Developer CLI (azd)**  
Utviklerfokusert kommandolinjeverktøy som akselererer prosessen med å bygge og distribuere applikasjoner til Azure ved hjelp av maler og Infrastructure as Code.

**azure.yaml**  
Hovedkonfigurasjonsfilen for et azd-prosjekt som definerer tjenester, infrastruktur og distribusjonskoblinger.

**Azure Resource Manager (ARM)**  
Azure sin distribusjons- og administrasjonstjeneste som gir et administrasjonslag for oppretting, oppdatering og sletting av ressurser.

## B

**Bicep**  
Domene-spesifikt språk (DSL) utviklet av Microsoft for distribusjon av Azure-ressurser. Gir enklere syntaks enn ARM-maler mens det kompileres til ARM.

**Bygg**  
Prosessen med å kompilere kildekode, installere avhengigheter og forberede applikasjoner for distribusjon.

**Blue-Green Deployment**  
Distribusjonsstrategi som bruker to identiske produksjonsmiljøer (blå og grønn) for å minimere nedetid og risiko.

## C

**Container Apps**  
Azure sin serverløse container-tjeneste som gjør det mulig å kjøre containeriserte applikasjoner uten å administrere kompleks infrastruktur.

**CI/CD**  
Kontinuerlig integrasjon/kontinuerlig distribusjon. Automatiserte praksiser for integrering av kodeendringer og distribusjon av applikasjoner.

**Cosmos DB**  
Azure sin globalt distribuerte, multi-modell databasetjeneste som gir omfattende SLA-er for gjennomstrømning, latens, tilgjengelighet og konsistens.

**Konfigurasjon**  
Innstillinger og parametere som styrer applikasjonsatferd og distribusjonsalternativer.

## D

**Distribusjon**  
Prosessen med å installere og konfigurere applikasjoner og deres avhengigheter på mål-infrastruktur.

**Docker**  
Plattform for utvikling, levering og kjøring av applikasjoner ved bruk av containerteknologi.

**Dockerfile**  
Tekstfil som inneholder instruksjoner for å bygge en Docker container-image.

## E

**Miljø**  
Et distribusjonsmål som representerer en spesifikk instans av applikasjonen din (f.eks. utvikling, staging, produksjon).

**Miljøvariabler**  
Konfigurasjonsverdier lagret som nøkkel-verdi-par som applikasjoner kan få tilgang til under kjøring.

**Endepunkt**  
URL eller nettverksadresse der en applikasjon eller tjeneste kan nås.

## F

**Function App**  
Azure sin serverløse beregningstjeneste som gjør det mulig å kjøre hendelsesdrevet kode uten å administrere infrastruktur.

## G

**GitHub Actions**  
CI/CD-plattform integrert med GitHub-repositorier for automatisering av arbeidsflyter.

**Git**  
Distribuert versjonskontrollsystem brukt for å spore endringer i kildekode.

## H

**Hooks**  
Egendefinerte skript eller kommandoer som kjøres på spesifikke punkter i distribusjonslivssyklusen (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Azure-tjenestetypen der en applikasjon vil bli distribuert (f.eks. appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Praksis med å definere og administrere infrastruktur gjennom kode i stedet for manuelle prosesser.

**Init**  
Prosessen med å initialisere et nytt azd-prosjekt, vanligvis fra en mal.

## J

**JSON**  
JavaScript Object Notation. Datautvekslingsformat som ofte brukes for konfigurasjonsfiler og API-responser.

**JWT**  
JSON Web Token. Standard for sikker overføring av informasjon mellom parter som et JSON-objekt.

## K

**Key Vault**  
Azure sin tjeneste for sikker lagring og administrasjon av hemmeligheter, nøkler og sertifikater.

**Kusto Query Language (KQL)**  
Spørrespråk brukt for analyse av data i Azure Monitor, Application Insights og andre Azure-tjenester.

## L

**Load Balancer**  
Tjeneste som fordeler innkommende nettverkstrafikk over flere servere eller instanser.

**Log Analytics**  
Azure-tjeneste for innsamling, analyse og handling på telemetridata fra sky- og lokale miljøer.

## M

**Managed Identity**  
Azure-funksjon som gir Azure-tjenester en automatisk administrert identitet for autentisering til andre Azure-tjenester.

**Mikrotjenester**  
Arkitektonisk tilnærming der applikasjoner bygges som en samling av små, uavhengige tjenester.

**Monitor**  
Azure sin enhetlige overvåkningsløsning som gir fullstendig observasjon av applikasjoner og infrastruktur.

## N

**Node.js**  
JavaScript-runtime bygget på Chrome sin V8 JavaScript-motor for bygging av server-side applikasjoner.

**npm**  
Pakkehåndterer for Node.js som administrerer avhengigheter og pakker.

## O

**Output**  
Verdier returnert fra infrastrukturdistribusjon som kan brukes av applikasjoner eller andre ressurser.

## P

**Pakke**  
Prosessen med å forberede applikasjonskode og avhengigheter for distribusjon.

**Parametere**  
Inndata verdier sendt til infrastrukturmaler for å tilpasse distribusjoner.

**PostgreSQL**  
Åpen kildekode relasjonsdatabasesystem støttet som en administrert tjeneste i Azure.

**Provisioning**  
Prosessen med å opprette og konfigurere Azure-ressurser definert i infrastrukturmaler.

## Q

**Kvoter**  
Begrensninger på mengden ressurser som kan opprettes i et Azure-abonnement eller region.

## R

**Ressursgruppe**  
Logisk container for Azure-ressurser som deler samme livssyklus, tillatelser og policyer.

**Ressurstoken**  
Unik streng generert av azd for å sikre at ressursnavn er unike på tvers av distribusjoner.

**REST API**  
Arkitektonisk stil for design av nettverksapplikasjoner ved bruk av HTTP-metoder.

**Rollback**  
Prosessen med å gå tilbake til en tidligere versjon av en applikasjon eller infrastrukturkonfigurasjon.

## S

**Tjeneste**  
En komponent av applikasjonen din definert i azure.yaml (f.eks. web frontend, API backend, database).

**SKU**  
Stock Keeping Unit. Representerer ulike tjenestenivåer eller ytelsesnivåer for Azure-ressurser.

**SQL Database**  
Azure sin administrerte relasjonsdatabasetjeneste basert på Microsoft SQL Server.

**Static Web Apps**  
Azure-tjeneste for bygging og distribusjon av full-stack webapplikasjoner fra kildekoderepositorier.

**Storage Account**  
Azure-tjeneste som gir skylagring for dataobjekter inkludert blobs, filer, køer og tabeller.

**Abonnement**  
Azure-konto container som holder ressursgrupper og ressurser, med tilhørende fakturering og tilgangsadministrasjon.

## T

**Mal**  
Forhåndsbygget prosjektstruktur som inneholder applikasjonskode, infrastrukturdefinisjoner og konfigurasjon for vanlige scenarier.

**Terraform**  
Åpen kildekode Infrastructure as Code-verktøy som støtter flere skyleverandører inkludert Azure.

**Traffic Manager**  
Azure sin DNS-baserte trafikkbelastningsbalanserer for distribusjon av trafikk på tvers av globale Azure-regioner.

## U

**URI**  
Uniform Resource Identifier. Streng som identifiserer en bestemt ressurs.

**URL**  
Uniform Resource Locator. Type URI som spesifiserer hvor en ressurs er lokalisert og hvordan den kan hentes.

## V

**Virtuelt Nettverk (VNet)**  
Grunnleggende byggestein for private nettverk i Azure, som gir isolasjon og segmentering.

**VS Code**  
Visual Studio Code. Populær kodeeditor med utmerket Azure og azd-integrasjon.

## W

**Webhook**  
HTTP-tilbakekall utløst av spesifikke hendelser, ofte brukt i CI/CD-pipelines.

**What-if**  
Azure-funksjon som viser hvilke endringer som ville bli gjort av en distribusjon uten faktisk å utføre den.

## Y

**YAML**  
YAML Ain't Markup Language. Menneskelesbart data-serialiseringsstandard brukt for konfigurasjonsfiler som azure.yaml.

## Z

**Sone**  
Fysisk separate lokasjoner innenfor en Azure-region som gir redundans og høy tilgjengelighet.

---

## Vanlige Forkortelser

| Forkortelse | Full Form | Beskrivelse |
|-------------|-----------|-------------|
| AAD | Azure Active Directory | Identitets- og tilgangsstyringstjeneste |
| ACR | Azure Container Registry | Tjeneste for container-image register |
| AKS | Azure Kubernetes Service | Administrert Kubernetes-tjeneste |
| API | Application Programming Interface | Sett med protokoller for bygging av programvare |
| ARM | Azure Resource Manager | Azure sin distribusjons- og administrasjonstjeneste |
| CDN | Content Delivery Network | Distribuert nettverk av servere |
| CI/CD | Continuous Integration/Continuous Deployment | Automatiserte utviklingspraksiser |
| CLI | Command Line Interface | Tekstbasert brukergrensesnitt |
| DNS | Domain Name System | System for oversettelse av domenenavn til IP-adresser |
| HTTPS | Hypertext Transfer Protocol Secure | Sikker versjon av HTTP |
| IaC | Infrastructure as Code | Administrasjon av infrastruktur gjennom kode |
| JSON | JavaScript Object Notation | Datautvekslingsformat |
| JWT | JSON Web Token | Token-format for sikker informasjonsoverføring |
| KQL | Kusto Query Language | Spørrespråk for Azure datatjenester |
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
| YAML | YAML Ain't Markup Language | Data-serialiseringsstandard |

---

## Azure Tjenestenavn Kartlegging

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

## Kontekstspesifikke Begreper

### Utviklingsbegreper
- **Hot Reload**: Automatisk oppdatering av applikasjoner under utvikling uten omstart
- **Byggepipeline**: Automatisert prosess for bygging og testing av kode
- **Distribusjonsspor**: Staging-miljø innenfor en App Service
- **Miljøparitet**: Holde utviklings-, staging- og produksjonsmiljøer like

### Sikkerhetsbegreper
- **Managed Identity**: Azure-funksjon som gir automatisk administrasjon av legitimasjon
- **Key Vault**: Sikker lagring for hemmeligheter, nøkler og sertifikater
- **RBAC**: Rollebasert tilgangskontroll for Azure-ressurser
- **Network Security Group**: Virtuell brannmur for kontroll av nettverkstrafikk

### Overvåkningsbegreper
- **Telemetri**: Automatisk innsamling av målinger og data
- **Applikasjonsytelsesovervåking (APM)**: Overvåking av programvareytelse
- **Log Analytics**: Tjeneste for innsamling og analyse av loggdata
- **Varslingsregler**: Automatiserte varsler basert på metrikker eller betingelser

### Distribusjonsbegreper
- **Blue-Green Deployment**: Null-nedetid distribusjonsstrategi
- **Canary Deployment**: Gradvis utrulling til en delmengde av brukere
- **Rullerende oppdatering**: Sekvensiell erstatning av applikasjonsinstanser
- **Rollback**: Tilbakeføring til tidligere applikasjonsversjon

---

**Brukertips**: Bruk `Ctrl+F` for raskt å søke etter spesifikke begreper i denne ordlisten. Begreper er kryssreferert der det er relevant.

---

**Navigasjon**
- **Forrige Leksjon**: [Jukselapp](cheat-sheet.md)
- **Neste Leksjon**: [FAQ](faq.md)

---

**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på sitt opprinnelige språk bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.