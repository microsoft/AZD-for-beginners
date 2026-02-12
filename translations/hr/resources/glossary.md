# Rječnik - Azure i AZD Terminologija

**Reference za Sve Poglavlja**
- **📚 Početna Tečaja**: [AZD Za Početnike](../README.md)
- **📖 Nauči Osnove**: [Poglavlje 1: AZD Osnove](../docs/getting-started/azd-basics.md)
- **🤖 AI Pojmovi**: [Poglavlje 2: AI-Pristup Razvoju](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## Uvod

Ovaj sveobuhvatni rječnik pruža definicije pojmova, koncepata i akronima korištenih u Azure Developer CLI i razvoju u Azure cloudu. Važan je izvor za razumijevanje tehničke dokumentacije, rješavanje problema i učinkovitu komunikaciju o azd projektima i Azure uslugama.

## Ciljevi Učenja

Korištenjem ovog rječnika ćete:
- Razumjeti osnovnu terminologiju i koncepte Azure Developer CLI-ja
- Ovladati vokabularom i tehničkim pojmovima razvoja u Azure cloudu
- Učinkovito se služiti terminologijom Infrastructure as Code i implementacije
- Shvatiti nazive Azure usluga, akronime i njihove svrhe
- Pristupati definicijama za terminologiju rješavanja problema i debugiranja
- Naučiti napredne koncepte Azure arhitekture i razvoja

## Ishodi Učenja

Redovitim korištenjem ovog rječnika, moći ćete:
- Učinkovito komunicirati koristeći ispravnu terminologiju Azure Developer CLI-ja
- Jasnije razumjeti tehničku dokumentaciju i poruke o pogreškama
- Pouzdano se snalaziti u Azure uslugama i konceptima
- Rješavati probleme koristeći odgovarajući tehnički vokabular
- Doprinositi timskim raspravama preciznim tehničkim jezikom
- Sustavno proširivati svoje znanje o razvoju u Azure cloudu

## A

**ARM Template**  
Azure Resource Manager predložak. JSON-based format Infrastructure as Code koji se koristi za deklarativno definiranje i implementaciju Azure resursa.

**App Service**  
Azure platforma kao usluga (PaaS) za hostanje web aplikacija, REST API-ja i mobilnih backendova bez upravljanja infrastrukturom.

**Application Insights**  
Azure usluga za nadzor performansi aplikacija (APM) koja pruža duboke uvide u performanse, dostupnost i korištenje aplikacije.

**Azure CLI**  
Alat naredbenog retka za upravljanje Azure resursima. Koristi ga azd za autentikaciju i neke operacije.

**Azure Developer CLI (azd)**  
Alat naredbenog retka usmjeren na developere koji ubrzava proces izrade i implementacije aplikacija u Azure koristeći predloške i Infrastructure as Code.

**azure.yaml**  
Glavna konfiguracijska datoteka za azd projekt koja definira usluge, infrastrukturu i implementacijske hookove.

**Azure Resource Manager (ARM)**  
Azure usluga za implementaciju i upravljanje koja pruža upravljački sloj za kreiranje, ažuriranje i brisanje resursa.

## B

**Bicep**  
Specijalizirani jezik (DSL) koji je razvio Microsoft za implementaciju Azure resursa. Pruža jednostavniju sintaksu od ARM predložaka dok se kompajlira u ARM.

**Build**  
Proces kompajliranja izvornog koda, instalacije ovisnosti i pripreme aplikacija za implementaciju.

**Blue-Green Deployment**  
Strategija implementacije koja koristi dva identična produkcijska okruženja (plavo i zeleno) za minimiziranje zastoja i rizika.

## C

**Container Apps**  
Azure serverless kontejnerska usluga koja omogućuje pokretanje kontejneriziranih aplikacija bez upravljanja složenom infrastrukturom.

**CI/CD**  
Continuous Integration/Continuous Deployment. Automatizirane prakse integracije promjena koda i implementacije aplikacija.

**Cosmos DB**  
Azure globalno distribuirana, višemodelna baza podataka koja pruža sveobuhvatne SLA-ove za propusnost, latenciju, dostupnost i konzistentnost.

**Configuration**  
Postavke i parametri koji kontroliraju ponašanje aplikacije i opcije implementacije.

## D

**Deployment**  
Proces instalacije i konfiguracije aplikacija i njihovih ovisnosti na ciljnoj infrastrukturi.

**Docker**  
Platforma za razvoj, isporuku i pokretanje aplikacija koristeći tehnologiju kontejnerizacije.

**Dockerfile**  
Tekstualna datoteka koja sadrži upute za izgradnju Docker kontejnerske slike.

## E

**Environment**  
Cilj implementacije koji predstavlja specifičnu instancu vaše aplikacije (npr. razvoj, testiranje, produkcija).

**Environment Variables**  
Konfiguracijske vrijednosti pohranjene kao ključ-vrijednost parovi kojima aplikacije pristupaju tijekom izvođenja.

**Endpoint**  
URL ili mrežna adresa na kojoj je aplikacija ili usluga dostupna.

## F

**Function App**  
Azure serverless compute usluga koja omogućava pokretanje event-driven koda bez upravljanja infrastrukturom.

## G

**GitHub Actions**  
CI/CD platforma integrirana s GitHub repozitorijima za automatizaciju radnih procesa.

**Git**  
Distribuirani sustav kontrole verzija za praćenje promjena u izvornom kodu.

## H

**Hooks**  
Prilagođeni skripti ili naredbe koje se izvršavaju u određenim točkama tijekom životnog ciklusa implementacije (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Vrsta Azure usluge na koju će se aplikacija implementirati (npr. appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Praksa definiranja i upravljanja infrastrukturom putem koda umjesto ručnih procesa.

**Init**  
Proces inicijalizacije novog azd projekta, obično iz predloška.

## J

**JSON**  
JavaScript Object Notation. Format za razmjenu podataka koji se često koristi za konfiguracijske datoteke i API odgovore.

**JWT**  
JSON Web Token. Standard za siguran prijenos informacija između strana u obliku JSON objekta.

## K

**Key Vault**  
Azure usluga za sigurno pohranjivanje i upravljanje tajnama, ključevima i certifikatima.

**Kusto Query Language (KQL)**  
Jezik upita koji se koristi za analizu podataka u Azure Monitoru, Application Insights i drugim Azure uslugama.

## L

**Load Balancer**  
Usluga koja raspoređuje dolazni mrežni promet preko više poslužitelja ili instanci.

**Log Analytics**  
Azure usluga za prikupljanje, analizu i djelovanje na temelju telemetrijskih podataka iz oblaka i lokalnih okruženja.

## M

**Managed Identity**  
Azure značajka koja pruža Azure uslugama automatski upravljanu identitet za autentikaciju prema drugim Azure uslugama.

**Microservices**  
Arhitektonski pristup gdje su aplikacije izgrađene kao kolekcija malih, neovisnih servisa.

**Monitor**  
Jedinstveno Azure rješenje za nadzor koje pruža uvid u cijeli sloj aplikacija i infrastrukture.

## N

**Node.js**  
JavaScript runtime okruženje izgrađeno na Chromiumovom V8 JavaScript engine-u za izgradnju serverskih aplikacija.

**npm**  
Upravitelj paketa za Node.js koji upravlja ovisnostima i paketima.

## O

**Output**  
Vrijednosti vraćene iz implementacije infrastrukture koje aplikacije ili drugi resursi mogu koristiti.

## P

**Package**  
Proces pripreme koda aplikacije i ovisnosti za implementaciju.

**Parameters**  
Ulazne vrijednosti proslijeđene infrastrukturnim predlošcima za prilagodbu implementacija.

**PostgreSQL**  
Open-source relacijski sustav baza podataka podržan kao upravljana usluga u Azureu.

**Provisioning**  
Proces kreiranja i konfiguracije Azure resursa definiranih u infrastrukturnim predlošcima.

## Q

**Quota**  
Ograničenja na količinu resursa koja se može kreirati u Azure pretplati ili regiji.

## R

**Resource Group**  
Logički spremnik za Azure resurse koji dijele isti životni ciklus, dozvole i politike.

**Resource Token**  
Jedinstveni niz generiran od strane azd-a za osiguravanje jedinstvenosti imena resursa prilikom implementacija.

**REST API**  
Arhitektonski stil za dizajniranje umreženih aplikacija koristeći HTTP metode.

**Rollback**  
Proces vraćanja na prethodnu verziju aplikacije ili konfiguracije infrastrukture.

## S

**Service**  
Komponenta vaše aplikacije definirana u azure.yaml (npr. web frontend, API backend, baza podataka).

**SKU**  
Stock Keeping Unit. Predstavlja različite razine usluga ili performansi za Azure resurse.

**SQL Database**  
Azure upravljana relacijska baza podataka temeljena na Microsoft SQL Serveru.

**Static Web Apps**  
Azure usluga za izradu i implementaciju full-stack web aplikacija iz repozitorija izvornog koda.

**Storage Account**  
Azure usluga koja pruža cloud pohranu za podatkovne objekte uključujući blobove, datoteke, redove i tablice.

**Subscription**  
Azure računski spremnik koji sadrži resource groups i resurse uz povezano upravljanje naplatom i pristupom.

## T

**Template**  
Unaprijed izrađena struktura projekta koja sadrži kôd aplikacije, definicije infrastrukture i konfiguracije za uobičajene scenarije.

**Terraform**  
Open-source alat Infrastructure as Code koji podržava više cloud providera uključujući Azure.

**Traffic Manager**  
Azure DNS-based load balancer za raspodjelu prometa po globalnim Azure regijama.

## U

**URI**  
Uniform Resource Identifier. Niz koji identificira određeni resurs.

**URL**  
Uniform Resource Locator. Tip URI-a koji specificira gdje se resurs nalazi i kako ga dohvatiti.

## V

**Virtual Network (VNet)**  
Temeljni gradivni blok za privatne mreže u Azureu, pruža izolaciju i segmentaciju.

**VS Code**  
Visual Studio Code. Popularni urednik koda s izvrsnom Azure i azd integracijom.

## W

**Webhook**  
HTTP povratni poziv pokrenut specifičnim događajima, često korišten u CI/CD procesima.

**What-if**  
Azure značajka koja pokazuje koje bi promjene bila napravljena implementacijom bez stvarnog izvršenja.

## Y

**YAML**  
YAML nije markup jezik. Ljudski čitljiv standard za serijalizaciju podataka korišten za konfiguracijske datoteke poput azure.yaml.

## Z

**Zone**  
Fizički odvojene lokacije unutar Azure regije koje pružaju redundanciju i visoku dostupnost.

---

## Uobičajeni Akronimi

| Akronim | Puni Naziv | Opis |
|---------|------------|------|
| AAD | Azure Active Directory | Usluga upravljanja identitetom i pristupom |
| ACR | Azure Container Registry | Registracija slika kontejnera |
| AKS | Azure Kubernetes Service | Upravljana Kubernetes usluga |
| API | Application Programming Interface | Skup protokola za izgradnju softvera |
| ARM | Azure Resource Manager | Azure usluga za implementaciju i upravljanje |
| CDN | Content Delivery Network | Distribuirana mreža poslužitelja |
| CI/CD | Continuous Integration/Continuous Deployment | Automatizirane razvojne prakse |
| CLI | Command Line Interface | Tekstualno korisničko sučelje |
| DNS | Domain Name System | Sustav za prevođenje domena u IP adrese |
| HTTPS | Hypertext Transfer Protocol Secure | Sigurna verzija HTTP-a |
| IaC | Infrastructure as Code | Upravljanje infrastrukturom kroz kod |
| JSON | JavaScript Object Notation | Format razmjene podataka |
| JWT | JSON Web Token | Format tokena za sigurnu razmjenu informacija |
| KQL | Kusto Query Language | Jezik upita za Azure podatkovne usluge |
| RBAC | Role-Based Access Control | Metoda kontrole pristupa temeljen na ulogama |
| REST | Representational State Transfer | Arhitekturalni stil za web usluge |
| SDK | Software Development Kit | Kolekcija razvojnih alata |
| SLA | Service Level Agreement | Ugovorna razina dostupnosti/performance usluge |
| SQL | Structured Query Language | Jezik za upravljanje relacijskim bazama podataka |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Kriptografski protokoli |
| URI | Uniform Resource Identifier | Niz koji identificira resurs |
| URL | Uniform Resource Locator | Tip URI-a koji specificira lokaciju resursa |
| VM | Virtual Machine | Emulacija računalnog sustava |
| VNet | Virtual Network | Privatna mreža u Azureu |
| YAML | YAML nije markup jezik | Standard serijalizacije podataka |

---

## Mapiranja Naziva Azure Usluga

| Uobičajeni Naziv | Službeni Naziv Azure Usluge | azd Tip Host-a |
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

## Kontekstualni Pojmovi

### Razvojni Pojmovi
- **Hot Reload**: Automatsko ažuriranje aplikacija tijekom razvoja bez ponovnog pokretanja
- **Build Pipeline**: Automatizirani proces izgradnje i testiranja koda
- **Deployment Slot**: Testno okruženje unutar App Service-a
- **Environment Parity**: Održavanje sličnosti razvojnih, testnih i produkcijskih okruženja

### Sigurnosni Pojmovi
- **Managed Identity**: Azure značajka koja pruža automatsko upravljanje vjerodajnicama
- **Key Vault**: Sigurna pohrana za tajne, ključeve i certifikate
- **RBAC**: Kontrola pristupa temeljena na ulogama za Azure resurse
- **Network Security Group**: Virtualni firewall za kontrolu mrežnog prometa

### Pojmovi Nadgledanja
- **Telemetry**: Automatsko prikupljanje mjerenja i podataka
- **Application Performance Monitoring (APM)**: Nadgledanje performansi softvera
- **Log Analytics**: Usluga za prikupljanje i analizu log podataka
- **Alert Rules**: Automatizirane obavijesti temeljene na metrikama ili uvjetima

### Pojmovi Implementacije
- **Blue-Green Deployment**: Strategija implementacije bez zastoja
- **Canary Deployment**: Postepeno uvođenje za podskup korisnika
- **Rolling Update**: Sekvencijalna zamjena instanci aplikacije
- **Rollback**: Vraćanje na prethodnu verziju aplikacije

---

**Savjet za Korištenje**: Koristite `Ctrl+F` za brzo pretraživanje određenih pojmova u ovom rječniku. Pojmovi su međusobno povezani gdje je primjenjivo.

---

**Navigacija**
- **Prethodna Lekcija**: [Cheat Sheet](cheat-sheet.md)
- **Sljedeća Lekcija**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:  
Ovaj dokument je preveden korištenjem AI usluge za prijevod [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati službenim i autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Ne preuzimamo odgovornost za bilo kakva nesporazuma ili krive interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->