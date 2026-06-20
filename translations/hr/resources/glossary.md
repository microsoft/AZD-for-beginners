# Rječnik - Azure i AZD terminologija

**Referenca za sve poglavlja**
- **📚 Početna stranica tečaja**: [AZD za početnike](../README.md)
- **📖 Učenje osnova**: [Poglavlje 1: Osnove AZD-a](../docs/getting-started/azd-basics.md)
- **🤖 AI pojmovi**: [Poglavlje 2: AI-prvo razvijanje](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## Uvod

Ovaj sveobuhvatni rječnik pruža definicije pojmova, koncepata i kratica koji se koriste u Azure Developer CLI i razvoju u Azure cloudu. Osnovna referenca za razumijevanje tehničke dokumentacije, rješavanje problema i učinkovitu komunikaciju o azd projektima i Azure uslugama.

## Ciljevi učenja

Korištenjem ovog rječnika, naučit ćete:
- Razumjeti osnovnu terminologiju i koncepte Azure Developer CLI-a
- Savladati vokabular i tehničke termine razvoja u Azure cloudu
- Efikasno referencirati terminologiju Infrastructure as Code i deploymenta
- Shvatiti nazive Azure usluga, kratica i njihove svrhe
- Pristupiti definicijama za rješavanje problema i terminologiju debugiranja
- Naučiti napredne Azure arhitekture i razvojne koncepte

## Ishodi učenja

Redovitim korištenjem ovog rječnika, bit ćete sposobni:
- Komunicirati učinkovito koristeći pravilnu terminologiju Azure Developer CLI-a
- Jasnije razumjeti tehničku dokumentaciju i poruke o pogreškama
- S pouzdanjem navigirati kroz Azure usluge i koncepte
- Rješavati probleme koristeći odgovarajući tehnički vokabular
- Doprinijeti timskim raspravama točnim tehničkim izrazima
- Sustavno proširivati svoje znanje o razvoju u Azure cloudu

## A

**ARM Template**  
Azure Resource Manager predložak. JSON bazirani Infrastructure as Code format korišten za deklarativno definiranje i deployment Azure resursa.

**App Service**  
Azure platforma kao usluga (PaaS) za hostanje web aplikacija, REST API-ja i mobilnih backendova bez upravljanja infrastrukturom.

**Application Insights**  
Azure-ova usluga za nadzor performansi aplikacija (APM) koja pruža duboke uvide u performanse, dostupnost i korištenje aplikacije.

**Azure CLI**  
Sučelje naredbenog retka za upravljanje Azure resursima. Koristi se u azd za autentikaciju i neke operacije.

**Azure Developer CLI (azd)**  
Alat naredbenog retka fokusiran na developere koji ubrzava proces izgradnje i deploymenta aplikacija u Azure koristeći predloške i Infrastructure as Code.

**azure.yaml**  
Glavna konfiguracijska datoteka za azd projekt koja definira servise, infrastrukturu i hooks za deployment.

**Azure Resource Manager (ARM)**  
Azure-ova usluga za deployment i upravljanje koja pruža sloj upravljanja za kreiranje, ažuriranje i brisanje resursa.

## B

**Bicep**  
Domain-specific jezik (DSL) razvijen od Microsofta za deployment Azure resursa. Pruža jednostavniju sintaksu od ARM predložaka dok se kompajlira u ARM.

**Build**  
Proces kompajliranja izvornog koda, instalacije ovisnosti i pripreme aplikacija za deployment.

**Blue-Green Deployment**  
Strategija deploymenta koja koristi dva identična produkcijska okruženja (plavo i zeleno) za minimiziranje downtimea i rizika.

## C

**Container Apps**  
Azure-ova serverless container usluga koja omogućuje pokretanje kontejneriziranih aplikacija bez upravljanja složenom infrastrukturom.

**CI/CD**  
Kontinuirana integracija/kontinuirani deployment. Automatizirane prakse integracije promjena koda i deploymenta aplikacija.

**Cosmos DB**  
Azure-ova globalno distribuirana, multi-model baza podataka koja pruža sveobuhvatne SLA-e za propusnost, latenciju, dostupnost i konzistentnost.

**Configuration**  
Postavke i parametri koji kontroliraju ponašanje aplikacije i opcije deploymenta.

## D

**Deployment**  
Proces instalacije i konfiguracije aplikacija i njihovih ovisnosti na ciljanom infrastrukturnom okruženju.

**Docker**  
Platforma za razvoj, isporuku i pokretanje aplikacija koristeći tehnologiju kontejnerizacije.

**Dockerfile**  
Tekstualna datoteka koja sadrži upute za izgradnju Docker container image-a.

## E

**Environment**  
Okruženje za deployment koje predstavlja specifičnu instancu vaše aplikacije (npr. razvojno, testno, produkcijsko).

**Environment Variables**  
Konfiguracijske vrijednosti pohranjene kao parovi ključ-vrijednost kojima aplikacije mogu pristupiti za vrijeme izvođenja.

**Endpoint**  
URL ili mrežna adresa na kojoj je aplikacija ili usluga dostupna.

## F

**Function App**  
Azure-ova serverless compute usluga koja omogućuje pokretanje event-driven koda bez upravljanja infrastrukturom.

## G

**GitHub Actions**  
CI/CD platforma integrirana s GitHub repozitorijima za automatizaciju workflow-a.

**Git**  
Distribuirani sustav za kontrolu verzija koji prati promjene u izvornom kodu.

## H

**Hooks**  
Prilagođeni skripti ili naredbe koje se izvršavaju u određenim točkama tijekom lifecycle-a deploymenta (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Tip Azure usluge na koju se aplikacija deploya (npr. appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Praksa definiranja i upravljanja infrastrukturom kroz kod umjesto ručnih procesa.

**Init**  
Proces inicijalizacije novog azd projekta, obično iz predloška.

## J

**JSON**  
JavaScript Object Notation. Format za razmjenu podataka često korišten za konfiguracijske datoteke i API odgovore.

**JWT**  
JSON Web Token. Standard za siguran prijenos informacija između strana kao JSON objekt.

## K

**Key Vault**  
Azure-ova usluga za sigurno pohranjivanje i upravljanje tajnama, ključevima i certifikatima.

**Kusto Query Language (KQL)**  
Upitni jezik korišten za analizu podataka u Azure Monitoru, Application Insights i drugim Azure uslugama.

## L

**Load Balancer**  
Usluga koja raspoređuje dolazni mrežni promet preko više servera ili instanci.

**Log Analytics**  
Azure usluga za prikupljanje, analizu i akciju nad telemetrijskim podacima iz cloud i on-premises okruženja.

## M

**Managed Identity**  
Azure značajka koja pruža Azure uslugama automatski upravljanu identitet za autentikaciju prema drugim Azure uslugama.

**Microservices**  
Arhitektonski pristup gdje su aplikacije izgrađene kao skup malih, neovisnih usluga.

**Monitor**  
Azure-ova jedinstvena monitoring platforma koja pruža cjelovitu uvidljivost kroz aplikacije i infrastrukturu.

## N

**Node.js**  
JavaScript runtime izgrađen na Chromeovom V8 JavaScript engine-u za razvoj server-side aplikacija.

**npm**  
Upravitelj paketa za Node.js koji upravlja ovisnostima i paketima.

## O

**Output**  
Vrijednosti vraćene iz deploymenta infrastrukture koje mogu koristiti aplikacije ili drugi resursi.

## P

**Package**  
Proces pripreme koda aplikacije i ovisnosti za deployment.

**Parameters**  
Ulazne vrijednosti predane infrastrukturi za prilagodbu deploymenta.

**PostgreSQL**  
Open-source relacijski sustav za baze podataka koji se u Azure-u pruža kao managed usluga.

**Provisioning**  
Proces kreiranja i konfiguracije Azure resursa definiranih u infrastrukturnim predlošcima.

## Q

**Quota**  
Ograničenja u količini resursa koji se mogu kreirati u određenom Azure pretplatničkom računu ili regiji.

## R

**Resource Group**  
Logički spremnik za Azure resurse koji dijele isti životni ciklus, dozvole i politike.

**Resource Token**  
Jedinstveni niz generiran od strane azd-a za osiguravanje jedinstvenosti imena resursa u svim deploymentima.

**REST API**  
Arhitektonski stil dizajna mrežnih aplikacija koristeći HTTP metode.

**Rollback**  
Proces vraćanja na prethodnu verziju aplikacije ili konfiguracije infrastrukture.

## S

**Service**  
Komponenta vaše aplikacije definirana u azure.yaml (npr. web frontend, API backend, baza podataka).

**SKU**  
Stock Keeping Unit. Predstavlja različite slojeve usluge ili razine performansi za Azure resurse.

**SQL Database**  
Azure-ova upravljana relacijska baza podataka bazirana na Microsoft SQL Serveru.

**Static Web Apps**  
Azure usluga za izgradnju i deployment full-stack web aplikacija iz izvornog koda.

**Storage Account**  
Azure usluga koja pruža cloud pohranu za podatkovne objekte uključujući blobove, datoteke, redove i tablice.

**Subscription**  
Azure račun koji sadrži resource grupe i resurse, s povezanim naplatama i upravljanjem pristupom.

## T

**Template**  
Unaprijed izgrađena struktura projekta koja sadrži kod aplikacije, definicije infrastrukture i konfiguraciju za uobičajene scenarije.

**Terraform**  
Open-source Infrastructure as Code alat koji podržava više cloud providera uključujući Azure.

**Traffic Manager**  
Azure DNS bazirani load balancer za raspodjelu mrežnog prometa preko globalnih Azure regija.

## U

**URI**  
Uniform Resource Identifier. Niz koji identificira određeni resurs.

**URL**  
Uniform Resource Locator. Tip URI-ja koji specificira lokaciju resursa i način pristupa.

## V

**Virtual Network (VNet)**  
Temeljni građevni blok za privatne mreže u Azure-u, koji pruža izolaciju i segmentaciju.

**VS Code**  
Visual Studio Code. Popularan editor koda s izvrsnom Azure i azd integracijom.

## W

**Webhook**  
HTTP callback okinut specifičnim događajima, često korišten u CI/CD pipeline-ima.

**What-if**  
Azure značajka koja pokazuje koje bi promjene deployment napravio bez stvarnog izvršenja.

## Y

**YAML**  
YAML nije Markup Language. Čitljiv standard za serijalizaciju podataka korišten u konfiguracijskim datotekama poput azure.yaml.

## Z

**Zone**  
Fizički odvojene lokacije unutar Azure regije koje pružaju redundanciju i visoku dostupnost.

---

## Uobičajene kratice

| Kratica | Puni naziv | Opis |
|---------|------------|-------|
| AAD | Azure Active Directory (sada Microsoft Entra ID) | Usluga za upravljanje identitetima i pristupom |
| ACR | Azure Container Registry | Usluga za registry container image-a |
| AKS | Azure Kubernetes Service | Managed Kubernetes usluga |
| API | Application Programming Interface | Skup protokola za izgradnju softvera |
| ARM | Azure Resource Manager | Azure-ova usluga za deployment i upravljanje |
| CDN | Content Delivery Network | Distribuirana mreža servera |
| CI/CD | Continuous Integration/Continuous Deployment | Automatizirane razvojne prakse |
| CLI | Command Line Interface | Tekstualno korisničko sučelje |
| DNS | Domain Name System | Sustav za prevođenje domena u IP adrese |
| HTTPS | Hypertext Transfer Protocol Secure | Sigurna verzija HTTP-a |
| IaC | Infrastructure as Code | Upravljanje infrastrukturom kroz kod |
| JSON | JavaScript Object Notation | Format za razmjenu podataka |
| JWT | JSON Web Token | Format tokena za sigurnu transmisiju informacija |
| KQL | Kusto Query Language | Upitni jezik za Azure podatkovne usluge |
| RBAC | Role-Based Access Control | Metoda kontrole pristupa bazirana na ulogama korisnika |
| REST | Representational State Transfer | Arhitektonski stil za web usluge |
| SDK | Software Development Kit | Kolekcija razvojnih alata |
| SLA | Service Level Agreement | Obveza za dostupnost/performance usluge |
| SQL | Structured Query Language | Jezik za upravljanje relacijskim bazama podataka |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Kriptografski protokoli |
| URI | Uniform Resource Identifier | Niz koji identificira resurs |
| URL | Uniform Resource Locator | Tip URI-ja koji specificira lokaciju resursa |
| VM | Virtual Machine | Emulacija računalnog sustava |
| VNet | Virtual Network | Privatna mreža u Azure-u |
| YAML | YAML nije Markup Language | Standard serijalizacije podataka |

---

## Mape naziva Azure usluga

| Uobičajeni naziv | Službeni naziv Azure usluge | azd tip hosta |
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
| Search | Azure AI Search | `search` |
| Messaging | Azure Service Bus | `servicebus` |

---

## Izrazi specifični za kontekst

### Termini za razvoj
- **Hot Reload**: Automatsko osvježavanje aplikacija tijekom razvoja bez ponovnog pokretanja
- **Build Pipeline**: Automatizirani proces izgradnje i testiranja koda
- **Deployment Slot**: Staging okruženje unutar App Service-a
- **Environment Parity**: Održavanje sličnosti razvojnih, staging i produkcijskih okruženja

### Sigurnosni termini
- **Managed Identity**: Azure značajka za automatsko upravljanje vjerodajnicama
- **Key Vault**: Sigurna pohrana tajni, ključeva i certifikata
- **RBAC**: Kontrola pristupa na temelju uloga za Azure resurse
- **Network Security Group**: Virtualni firewall za upravljanje mrežnim prometom

### Monitoring termini
- **Telemetry**: Automatizirano prikupljanje mjerenja i podataka
- **Application Performance Monitoring (APM)**: Nadzor performansi softvera
- **Log Analytics**: Usluga za prikupljanje i analizu podataka iz logova
- **Alert Rules**: Automatizirana obavijest na temelju metrika ili uvjeta

### Deployment termini
- **Blue-Green Deployment**: Strategija deploymenta bez zastoja
- **Canary Deployment**: Postupno uvođenje promjena malom dijelu korisnika
- **Rolling Update**: Sekvencijalna zamjena instanci aplikacije
- **Rollback**: Vraćanje na prethodnu verziju aplikacije

---

**Savjet za korištenje**: Koristite `Ctrl+F` za brzo pretraživanje određenih pojmova u ovom rječniku. Pojmovi su međusobno povezani gdje je primjenjivo.

---

**Navigacija**
- **Prethodna lekcija**: [Sažetak](cheat-sheet.md)
- **Sljedeća lekcija**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->