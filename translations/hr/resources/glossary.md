# Rječnik - Terminologija Azure i AZD

**Referenca za sve poglavlja**
- **📚 Početna stranica tečaja**: [AZD za početnike](../README.md)
- **📖 Nauči osnove**: [Poglavlje 1: Osnove AZD-a](../docs/chapter-01-foundation/azd-basics.md)
- **🤖 AI pojmovi**: [Poglavlje 2: AI-prvo razvoj](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)

## Uvod

Ovaj sveobuhvatan rječnik pruža definicije za pojmove, koncepte i akronime koji se koriste u Azure Developer CLI-u i razvoju u Azure oblaku. Neophodna referenca za razumijevanje tehničke dokumentacije, rješavanje problema i učinkovitu komunikaciju o azd projektima i Azure servisima.

## Ciljevi učenja

Korištenjem ovog rječnika ćete:
- Razumjeti osnovnu terminologiju i koncepte Azure Developer CLI-a
- Ovladati vokabularom i tehničkim pojmovima razvoja u Azure oblaku
- Efikasno referencirati terminologiju Infrastrukturе kao Koda i implementacije
- Shvatiti nazive Azure servisa, akronime i njihove svrhe
- Pristupiti definicijama terminologije za rješavanje problema i ispravljanje pogrešaka
- Naučiti napredne koncepte Azure arhitekture i razvoja

## Ishodi učenja

Redovitim korištenjem ovog rječnika moći ćete:
- Učinkovito komunicirati koristeći ispravnu terminologiju Azure Developer CLI-a
- Jasnije razumjeti tehničku dokumentaciju i poruke o pogreškama
- S pouzdanjem se kretati kroz Azure servise i koncepte
- Rješavati probleme koristeći odgovarajući tehnički vokabular
- Doprinositi timskim raspravama s preciznim tehničkim jezikom
- Sustavno proširivati svoje znanje o razvoju u Azure oblaku

## A

**ARM predložak**  
Azure Resource Manager predložak. JSON-based Infrastructure as Code format koji se koristi za deklarativno definiranje i implementaciju Azure resursa.

**App Service**  
Azure platforma kao usluga (PaaS) za hostanje web aplikacija, REST API-ja i mobilnih backendova bez upravljanja infrastrukturom.

**Application Insights**  
Azure servis za nadzor performansi aplikacija (APM) koji pruža duboke uvide u performanse, dostupnost i korištenje aplikacije.

**Azure CLI**  
Sučelje naredbenog retka za upravljanje Azure resursima. Dopunjava AZD, ali ima zasebnu prijavu; osnovna AZD autentifikacija koristi `azd auth login`.

**Azure Developer CLI (azd)**  
Alat naredbenog retka usredotočen na developere koji ubrzava proces izgradnje i implementacije aplikacija u Azure koristeći predloške i Infrastructure as Code.

**azure.yaml**  
Glavna konfiguracijska datoteka za azd projekt koja definira servise, infrastrukturu i deployment hooks.

**Azure Resource Manager (ARM)**  
Azure servis za implementaciju i upravljanje koji pruža sloj za kreiranje, ažuriranje i brisanje resursa.

## B

**Bicep**  
Domain-specific jezik (DSL) razvijen od Microsofta za implementaciju Azure resursa. Nudi jednostavniju sintaksu od ARM predložaka dok se prevodi u ARM.

**Build**  
Proces kompajliranja izvornog koda, instalacije ovisnosti i pripreme aplikacija za implementaciju.

**Plava-Zelena Implementacija (Blue-Green Deployment)**  
Strategija implementacije koja koristi dva identična produkcijska okruženja (plavo i zeleno) za minimiziranje zastoja i rizika.

## C

**Container Apps**  
Azure serverless kontejnerska usluga koja omogućuje pokretanje kontejneriziranih aplikacija bez upravljanja složenom infrastrukturom.

**CI/CD**  
Continuous Integration/Continuous Deployment. Automatizirane prakse integracije promjena koda i implementacije aplikacija.

**Cosmos DB**  
Azure globalno distribuirana, multi-model baza podataka koja nudi sveobuhvatne SLA-ove za kroz-put, latentnost, dostupnost i konzistentnost.

**Konfiguracija**  
Postavke i parametri koji kontroliraju ponašanje aplikacije i opcije implementacije.

## D

**Deployment**  
Proces instalacije i konfiguracije aplikacija i njihovih ovisnosti na ciljanom infrastrukturnom okruženju.

**Docker**  
Platforma za razvoj, isporuku i pokretanje aplikacija koristeći tehnologiju kontejnerizacije.

**Dockerfile**  
Tekstualna datoteka s uputama za izgradnju Docker kontejnerske slike.

## E

**Okruženje (Environment)**  
Cilj implementacije koji predstavlja specifičnu instancu vaše aplikacije (npr. razvoj, testiranje, produkcija).

**Varijable okruženja**  
Konfiguracijske vrijednosti pohranjene kao parovi ključ-vrijednost koje aplikacije mogu dohvatiti tijekom izvođenja.

**Endpoint**  
URL ili mrežna adresa gdje se aplikacija ili servis mogu pristupiti.

## F

**Function App**  
Azure serverless računalna usluga koja omogućuje pokretanje događajima upravljanog koda bez upravljanja infrastrukturom.

## G

**GitHub Actions**  
CI/CD platforma integrirana s GitHub repozitorijima za automatizaciju radnih tokova.

**Git**  
Distribuirani sustav kontrole verzija za praćenje promjena u izvornom kodu.

## H

**Hooks**  
Prilagođeni skripti ili naredbe koje se izvršavaju u određenim točkama tijekom životnog ciklusa implementacije (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Tip Azure servisa na koji će aplikacija biti implementirana (npr. appservice, containerapp, function).

## I

**Infrastruktura kao Kod (IaC)**  
Praksa definiranja i upravljanja infrastrukturom putem koda umjesto ručnih procesa.

**Init**  
Proces inicijalizacije novog azd projekta, obično iz predloška.

## J

**JSON**  
JavaScript Object Notation. Format za razmjenu podataka često korišten za konfiguracijske datoteke i API odgovore.

**JWT**  
JSON Web Token. Standard za siguran prijenos informacija između strana u JSON objektu.

## K

**Key Vault**  
Azure servis za sigurno pohranjivanje i upravljanje tajnama, ključevima i certifikatima.

**Kusto Query Language (KQL)**  
Jezik za upite koji se koristi za analizu podataka u Azure Monitoru, Application Insights i drugim Azure servisima.

## L

**Load Balancer**  
Servis koji raspoređuje dolazni mrežni promet preko više servera ili instanci.

**Log Analytics**  
Azure servis za prikupljanje, analizu i reagiranje na telemetry podatke iz cloud i lokalnih okruženja.

## M

**Managed Identity**  
Azure značajka koja pruža Azure servisima automatski upravljani identitet za autentifikaciju kod drugih Azure servisa.

**Mikroservisi**  
Arhitektonski pristup gdje se aplikacije grade kao skup malih, neovisnih servisa.

**Monitor**  
Unified monitoring rješenje Azure-a koje pruža promatranje pune strukture kroz aplikacije i infrastrukturu.

## N

**Node.js**  
JavaScript runtime izgrađen na Chromiumovom V8 JavaScript engineu za razvoj serverskih aplikacija.

**npm**  
Package manager za Node.js koji upravlja ovisnostima i paketima.

## O

**Output**  
Vrijednosti vraćene iz implementacije infrastrukture koje aplikacije ili drugi resursi mogu koristiti.

## P

**Package**  
Proces pripreme izvornog koda aplikacije i ovisnosti za implementaciju.

**Parametri**  
Ulazne vrijednosti proslijeđene infrastrukturalnim predlošcima za prilagodbu implementacija.

**PostgreSQL**  
Open-source sustav relacijske baze podataka podržan kao upravljana usluga u Azure-u.

**Provisioning**  
Proces kreiranja i konfiguracije Azure resursa definiranih u infrastrukturnim predlošcima.

## Q

**Quota**  
Ograničenja na količinu resursa koji se mogu stvoriti u Azure pretplati ili regiji.

## R

**Resource Group**  
Logički spremnik za Azure resurse koji dijele isti životni ciklus, dopuštenja i politike.

**Resource Token**  
Jedinstveni niz generiran od azd-a koji osigurava jedinstvenost naziva resursa preko implementacija.

**REST API**  
Arhitektonski stil za dizajn mrežnih aplikacija korištenjem HTTP metoda.

**Rollback**  
Proces vraćanja na prethodnu verziju aplikacije ili konfiguracije infrastrukture.

## S

**Service**  
Komponenta vaše aplikacije definirana u azure.yaml (npr. web frontend, API backend, baza podataka).

**SKU**  
Stock Keeping Unit. Predstavlja različite razine usluge ili performansi za Azure resurse.

**SQL Database**  
Azure upravljana relacijska baza podataka temeljena na Microsoft SQL Serveru.

**Static Web Apps**  
Azure servis za izgradnju i implementaciju full-stack web aplikacija iz izvornog koda repozitorija.

**Storage Account**  
Azure servis koji pruža cloud pohranu za podatkovne objekte uključujući blobove, datoteke, queue-e i tablice.

**Subscription**  
Azure račun/spremnik koji sadrži grupe resursa i resurse, s pripadajućim naplatama i upravljanjem pristupa.

## T

**Template**  
Predstrukturirani projekt koji sadrži izvorni kod aplikacije, definicije infrastrukture i konfiguraciju za uobičajene scenarije.

**Terraform**  
Open-source Infrastructure as Code alat koji podržava više cloud providera uključujući Azure.

**Traffic Manager**  
Azure DNS-bazirani load balancer za distribuciju prometa preko globalnih Azure regija.

## U

**URI**  
Uniform Resource Identifier. Niz koji identificira određeni resurs.

**URL**  
Uniform Resource Locator. Vrsta URI-ja koja specificira lokaciju resursa i način preuzimanja.

## V

**Virtual Network (VNet)**  
Temeljni građevni blok privatnih mreža u Azure-u, pružajući izolaciju i segmentaciju.

**VS Code**  
Visual Studio Code. Popularan uređivač koda s izvrsnom Azure i azd integracijom.

## W

**Webhook**  
HTTP povratni poziv pokrenut specifičnim događajima, često korišten u CI/CD pipeline-ima.

**What-if**  
Azure značajka koja prikazuje koje bi se promjene dogodile implementacijom bez stvarne izvedbe.

## Y

**YAML**  
YAML Ain't Markup Language. Standard za serijalizaciju podataka čitljiv ljudskom oku, korišten za konfiguracijske datoteke poput azure.yaml.

## Z

**Zone**  
Fizički odvojene lokacije unutar Azure regije koje pružaju redundanciju i visoku dostupnost.

---

## Česti akronimi

| Akronim | Puni naziv | Opis |
|---------|-----------|-------------|
| AAD | Azure Active Directory (sada Microsoft Entra ID) | Usluga upravljanja identitetima i pristupom |
| ACR | Azure Container Registry | Servis za pohranu imidža kontejnera |
| AKS | Azure Kubernetes Service | Upravljačka Kubernetes usluga |
| API | Application Programming Interface | Skup protokola za izradu softvera |
| ARM | Azure Resource Manager | Azure usluga za implementaciju i upravljanje |
| CDN | Content Delivery Network | Distribuirana mreža servera |
| CI/CD | Continuous Integration/Continuous Deployment | Automatizirane razvojne prakse |
| CLI | Command Line Interface | Tekstualno korisničko sučelje |
| DNS | Domain Name System | Sustav za prevođenje domena u IP adrese |
| HTTPS | Hypertext Transfer Protocol Secure | Sigurna verzija HTTP-a |
| IaC | Infrastructure as Code | Upravljanje infrastrukturom putem koda |
| JSON | JavaScript Object Notation | Format za razmjenu podataka |
| JWT | JSON Web Token | Format tokena za siguran prijenos informacija |
| KQL | Kusto Query Language | Jezik za upite za Azure podatkovne servise |
| RBAC | Role-Based Access Control | Metoda upravljanja pristupom bazirana na ulogama korisnika |
| REST | Representational State Transfer | Arhitektonski stil za web servise |
| SDK | Software Development Kit | Skup razvojnih alata |
| SLA | Service Level Agreement | Obveza dostupnosti i izvedbe usluge |
| SQL | Structured Query Language | Jezik za upravljanje relacijskim bazama podataka |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Kriptografski protokoli |
| URI | Uniform Resource Identifier | Niz za identifikaciju resursa |
| URL | Uniform Resource Locator | Vrsta URI-ja koja specificira lokaciju resursa |
| VM | Virtual Machine | Emulacija računalnog sustava |
| VNet | Virtual Network | Privatna mreža u Azure-u |
| YAML | YAML Ain't Markup Language | Standard za serijalizaciju podataka |

---

## Mape naziva Azure servisa

| Uobičajeni naziv | Službeni naziv Azure servisa | azd Host Tip |
|-------------|------------------------------|---------------|
| Web App | Azure App Service | `appservice` |
| API App | Azure App Service | `appservice` |
| Container App | Azure Container Apps | `containerapp` |
| Function | Azure Functions | `function` |
| Static Site | Azure Static Web Apps | `staticwebapp` |
| Database | Azure Database for PostgreSQL | Infrastrukturni resurs, nije aplikacija `host` |
| NoSQL DB | Azure Cosmos DB | Infrastrukturni resurs, nije aplikacija `host` |
| Storage | Azure Storage Account | Infrastrukturni resurs, nije ugrađena aplikacija `host` |
| Cache | Azure Managed Redis | Infrastrukturni resurs, nije aplikacija `host` |
| Search | Azure AI Search | Infrastrukturni resurs, nije aplikacija `host` |
| Messaging | Azure Service Bus | Infrastrukturni resurs, nije aplikacija `host` |

`services.<name>.host` odabire cilj implementacije aplikacije; nije kratica za bilo koju Azure vrstu resursa. Baze podataka, cache-i, pretraživačke usluge i queue-e obično se provisioniraju putem infrastrukture i povezuju s aplikacijom putem outputa/konfiguracije.

---

## Kontekstualni pojmovi

### Razvojni pojmovi
- **Hot Reload**: Automatsko osvježavanje aplikacija tijekom razvoja bez ponovnog pokretanja
- **Build Pipeline**: Automatizirani proces za izgradnju i testiranje koda
- **Deployment Slot**: Testno okruženje unutar App Service-a
- **Environment Parity**: Održavanje sličnosti razvojnog, testnog i produkcijskog okruženja

### Sigurnosni pojmovi
- **Managed Identity**: Azure značajka koja pruža automatsko upravljanje vjerodajnicama
- **Key Vault**: Sigurna pohrana tajni, ključeva i certifikata
- **RBAC**: Kontrola pristupa temeljena na ulogama za Azure resurse
- **Network Security Group**: Virtualni firewall za kontrolu mrežnog prometa

### Pojmovi praćenja
- **Telemetry**: Automatizirano prikupljanje mjerenja i podataka
- **Application Performance Monitoring (APM)**: Praćenje performansi softvera
- **Log Analytics**: Servis za prikupljanje i analizu log podataka
- **Alert Rules**: Automatizirane obavijesti temeljene na metrikama ili uvjetima

### Pojmovi implementacije
- **Blue-Green Deployment**: Strategija implementacije bez zastoja
- **Canary Deployment**: Postupni rollout prema podskupu korisnika
- **Rolling Update**: Sekvencijalna zamjena instanci aplikacije
- **Rollback**: Povratak na prethodnu verziju aplikacije

---

**Savjet za upotrebu**: Koristite `Ctrl+F` za brzo pretraživanje određenih pojmova u ovom rječniku. Pojmovi su križno referencirani gdje je primjenjivo.

---

**Navigacija**
- **Prethodna lekcija**: [Cheat Sheet](cheat-sheet.md)
- **Sljedeća lekcija**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->