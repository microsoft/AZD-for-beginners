# Rječnik - Azure i AZD Terminologija

**Referenca za sve poglavlja**
- **📚 Početna stranica tečaja**: [AZD za početnike](../README.md)
- **📖 Naučite osnove**: [Poglavlje 1: AZD Osnove](../docs/getting-started/azd-basics.md)
- **🤖 AI Pojmovi**: [Poglavlje 2: Razvoj usmjeren na AI](../docs/ai-foundry/azure-ai-foundry-integration.md)

## Uvod

Ovaj sveobuhvatni rječnik pruža definicije pojmova, koncepata i akronima koji se koriste u Azure Developer CLI i razvoju na Azure oblaku. Ključna referenca za razumijevanje tehničke dokumentacije, rješavanje problema i učinkovitu komunikaciju o azd projektima i Azure uslugama.

## Ciljevi učenja

Korištenjem ovog rječnika, naučit ćete:
- Razumjeti osnovnu terminologiju i koncepte Azure Developer CLI-a
- Ovladati vokabularom i tehničkim pojmovima razvoja na Azure oblaku
- Učinkovito koristiti terminologiju za infrastrukturu kao kod i implementaciju
- Shvatiti nazive Azure usluga, akronime i njihove svrhe
- Pristupiti definicijama za rješavanje problema i terminologiju za otklanjanje grešaka
- Naučiti napredne koncepte arhitekture i razvoja na Azure oblaku

## Ishodi učenja

Redovitim korištenjem ovog rječnika, moći ćete:
- Učinkovito komunicirati koristeći ispravnu terminologiju Azure Developer CLI-a
- Jasnije razumjeti tehničku dokumentaciju i poruke o greškama
- S povjerenjem navigirati kroz Azure usluge i koncepte
- Rješavati probleme koristeći odgovarajući tehnički vokabular
- Doprinijeti timskim raspravama koristeći točan tehnički jezik
- Sustavno proširiti svoje znanje o razvoju na Azure oblaku

## A

**ARM Predložak**  
Azure Resource Manager predložak. JSON-format za infrastrukturu kao kod koji se koristi za deklarativno definiranje i implementaciju Azure resursa.

**App Service**  
Azure-ova platforma kao usluga (PaaS) za hosting web aplikacija, REST API-ja i mobilnih pozadinskih sustava bez upravljanja infrastrukturom.

**Application Insights**  
Azure-ova usluga za praćenje performansi aplikacija (APM) koja pruža dubinski uvid u performanse, dostupnost i korištenje aplikacija.

**Azure CLI**  
Komandna linija za upravljanje Azure resursima. Koristi se u azd-u za autentifikaciju i neke operacije.

**Azure Developer CLI (azd)**  
Komandni alat usmjeren na razvoj koji ubrzava proces izgradnje i implementacije aplikacija na Azure koristeći predloške i infrastrukturu kao kod.

**azure.yaml**  
Glavna konfiguracijska datoteka za azd projekt koja definira usluge, infrastrukturu i implementacijske skripte.

**Azure Resource Manager (ARM)**  
Azure-ova usluga za implementaciju i upravljanje koja pruža sloj za upravljanje resursima.

## B

**Bicep**  
Specifični jezik za domenu (DSL) koji je razvio Microsoft za implementaciju Azure resursa. Pruža jednostavniju sintaksu od ARM predložaka dok se kompajlira u ARM.

**Build**  
Proces kompajliranja izvornog koda, instaliranja ovisnosti i pripreme aplikacija za implementaciju.

**Blue-Green Implementacija**  
Strategija implementacije koja koristi dva identična produkcijska okruženja (plavo i zeleno) kako bi se smanjilo vrijeme zastoja i rizik.

## C

**Container Apps**  
Azure-ova serverless usluga za kontejnere koja omogućuje pokretanje aplikacija u kontejnerima bez upravljanja složenom infrastrukturom.

**CI/CD**  
Kontinuirana integracija/kontinuirana implementacija. Automatizirane prakse za integraciju promjena koda i implementaciju aplikacija.

**Cosmos DB**  
Azure-ova globalno distribuirana, višemodelna baza podataka koja pruža sveobuhvatne SLA-ove za propusnost, latenciju, dostupnost i konzistentnost.

**Konfiguracija**  
Postavke i parametri koji kontroliraju ponašanje aplikacije i opcije implementacije.

## D

**Implementacija**  
Proces instaliranja i konfiguriranja aplikacija i njihovih ovisnosti na ciljnu infrastrukturu.

**Docker**  
Platforma za razvoj, isporuku i pokretanje aplikacija koristeći tehnologiju kontejnerizacije.

**Dockerfile**  
Tekstualna datoteka koja sadrži upute za izgradnju Docker slike kontejnera.

## E

**Okruženje**  
Cilj implementacije koji predstavlja specifičnu instancu vaše aplikacije (npr. razvoj, testiranje, produkcija).

**Varijable okruženja**  
Konfiguracijske vrijednosti pohranjene kao parovi ključ-vrijednost koje aplikacije mogu pristupiti tijekom izvođenja.

**Endpoint**  
URL ili mrežna adresa na kojoj se može pristupiti aplikaciji ili usluzi.

## F

**Function App**  
Azure-ova serverless usluga za računalne funkcije koja omogućuje pokretanje koda temeljenog na događajima bez upravljanja infrastrukturom.

## G

**GitHub Actions**  
CI/CD platforma integrirana s GitHub repozitorijima za automatizaciju tijekova rada.

**Git**  
Distribuirani sustav za kontrolu verzija koji se koristi za praćenje promjena u izvornom kodu.

## H

**Hooks**  
Prilagođeni skripti ili naredbe koje se izvršavaju u specifičnim točkama tijekom životnog ciklusa implementacije (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Tip Azure usluge na kojoj će aplikacija biti implementirana (npr. appservice, containerapp, function).

## I

**Infrastruktura kao kod (IaC)**  
Praksa definiranja i upravljanja infrastrukturom putem koda umjesto ručnih procesa.

**Init**  
Proces inicijalizacije novog azd projekta, obično iz predloška.

## J

**JSON**  
JavaScript Object Notation. Format za razmjenu podataka koji se često koristi za konfiguracijske datoteke i API odgovore.

**JWT**  
JSON Web Token. Standard za sigurno prenošenje informacija između strana kao JSON objekt.

## K

**Key Vault**  
Azure-ova usluga za sigurno pohranjivanje i upravljanje tajnama, ključevima i certifikatima.

**Kusto Query Language (KQL)**  
Jezik upita koji se koristi za analizu podataka u Azure Monitoru, Application Insightsu i drugim Azure uslugama.

## L

**Load Balancer**  
Usluga koja raspodjeljuje dolazni mrežni promet na više servera ili instanci.

**Log Analytics**  
Azure usluga za prikupljanje, analizu i djelovanje na telemetrijskim podacima iz oblaka i lokalnih okruženja.

## M

**Managed Identity**  
Azure značajka koja pruža automatski upravljani identitet za Azure usluge za autentifikaciju prema drugim Azure uslugama.

**Mikroservisi**  
Arhitektonski pristup gdje se aplikacije grade kao zbirka malih, neovisnih usluga.

**Monitor**  
Azure-ovo rješenje za praćenje koje pruža cjelovitu vidljivost aplikacija i infrastrukture.

## N

**Node.js**  
JavaScript runtime izgrađen na Chrome-ovom V8 JavaScript motoru za izgradnju aplikacija na strani servera.

**npm**  
Upravitelj paketa za Node.js koji upravlja ovisnostima i paketima.

## O

**Output**  
Vrijednosti koje se vraćaju iz implementacije infrastrukture i koje aplikacije ili drugi resursi mogu koristiti.

## P

**Package**  
Proces pripreme koda aplikacije i ovisnosti za implementaciju.

**Parametri**  
Ulazne vrijednosti koje se prosljeđuju predlošcima infrastrukture za prilagodbu implementacija.

**PostgreSQL**  
Open-source sustav relacijskih baza podataka podržan kao upravljana usluga u Azure-u.

**Provisioning**  
Proces stvaranja i konfiguriranja Azure resursa definiranih u predlošcima infrastrukture.

## Q

**Quota**  
Ograničenja na količinu resursa koji se mogu stvoriti u Azure pretplati ili regiji.

## R

**Resource Group**  
Logički spremnik za Azure resurse koji dijele isti životni ciklus, dozvole i politike.

**Resource Token**  
Jedinstveni niz koji generira azd kako bi osigurao jedinstvenost naziva resursa u implementacijama.

**REST API**  
Arhitektonski stil za dizajniranje mrežnih aplikacija koristeći HTTP metode.

**Rollback**  
Proces vraćanja na prethodnu verziju aplikacije ili konfiguracije infrastrukture.

## S

**Usluga**  
Komponenta vaše aplikacije definirana u azure.yaml (npr. web frontend, API backend, baza podataka).

**SKU**  
Stock Keeping Unit. Predstavlja različite razine usluga ili performansi za Azure resurse.

**SQL Database**  
Azure-ova upravljana relacijska baza podataka temeljena na Microsoft SQL Serveru.

**Static Web Apps**  
Azure usluga za izgradnju i implementaciju full-stack web aplikacija iz repozitorija izvornog koda.

**Storage Account**  
Azure usluga koja pruža pohranu u oblaku za podatkovne objekte uključujući blobove, datoteke, redove i tablice.

**Pretplata**  
Azure račun koji sadrži grupe resursa i resurse, s pridruženim upravljanjem naplatom i pristupom.

## T

**Predložak**  
Unaprijed izgrađena struktura projekta koja sadrži kod aplikacije, definicije infrastrukture i konfiguraciju za uobičajene scenarije.

**Terraform**  
Open-source alat za infrastrukturu kao kod koji podržava više pružatelja usluga oblaka, uključujući Azure.

**Traffic Manager**  
Azure-ov DNS-based load balancer za distribuciju prometa između globalnih Azure regija.

## U

**URI**  
Uniform Resource Identifier. Niz koji identificira određeni resurs.

**URL**  
Uniform Resource Locator. Tip URI-ja koji specificira gdje se resurs nalazi i kako ga dohvatiti.

## V

**Virtual Network (VNet)**  
Osnovni građevni blok za privatne mreže u Azure-u, pružajući izolaciju i segmentaciju.

**VS Code**  
Visual Studio Code. Popularni editor koda s izvrsnom integracijom za Azure i azd.

## W

**Webhook**  
HTTP povratni poziv koji se aktivira specifičnim događajima, često korišten u CI/CD tijekovima rada.

**What-if**  
Azure značajka koja prikazuje koje bi promjene bile napravljene implementacijom bez stvarnog izvršavanja.

## Y

**YAML**  
YAML Ain't Markup Language. Standard za serijalizaciju podataka koji je čitljiv ljudima, koristi se za konfiguracijske datoteke poput azure.yaml.

## Z

**Zona**  
Fizički odvojene lokacije unutar Azure regije koje pružaju redundanciju i visoku dostupnost.

---

## Uobičajeni Akronimi

| Akronim | Puno ime | Opis |
|---------|----------|------|
| AAD | Azure Active Directory | Usluga za upravljanje identitetom i pristupom |
| ACR | Azure Container Registry | Usluga za registraciju slika kontejnera |
| AKS | Azure Kubernetes Service | Upravljana Kubernetes usluga |
| API | Application Programming Interface | Skup protokola za izgradnju softvera |
| ARM | Azure Resource Manager | Azure-ova usluga za implementaciju i upravljanje |
| CDN | Content Delivery Network | Distribuirana mreža servera |
| CI/CD | Continuous Integration/Continuous Deployment | Automatizirane razvojne prakse |
| CLI | Command Line Interface | Tekstualno korisničko sučelje |
| DNS | Domain Name System | Sustav za prevođenje domena u IP adrese |
| HTTPS | Hypertext Transfer Protocol Secure | Sigurna verzija HTTP-a |
| IaC | Infrastructure as Code | Upravljanje infrastrukturom putem koda |
| JSON | JavaScript Object Notation | Format za razmjenu podataka |
| JWT | JSON Web Token | Format tokena za sigurno prenošenje informacija |
| KQL | Kusto Query Language | Jezik upita za Azure podatkovne usluge |
| RBAC | Role-Based Access Control | Metoda kontrole pristupa temeljena na ulogama |
| REST | Representational State Transfer | Arhitektonski stil za web usluge |
| SDK | Software Development Kit | Zbirka alata za razvoj |
| SLA | Service Level Agreement | Obveza dostupnosti/performansi usluge |
| SQL | Structured Query Language | Jezik za upravljanje relacijskim bazama podataka |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Kriptografski protokoli |
| URI | Uniform Resource Identifier | Niz koji identificira resurs |
| URL | Uniform Resource Locator | Tip URI-ja koji specificira lokaciju resursa |
| VM | Virtual Machine | Emulacija računalnog sustava |
| VNet | Virtual Network | Privatna mreža u Azure-u |
| YAML | YAML Ain't Markup Language | Standard za serijalizaciju podataka |

---

## Mape naziva Azure usluga

| Uobičajeni naziv | Službeni naziv Azure usluge | azd Host tip |
|------------------|-----------------------------|--------------|
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

## Pojmovi specifični za kontekst

### Pojmovi razvoja
- **Hot Reload**: Automatsko ažuriranje aplikacija tijekom razvoja bez ponovnog pokretanja
- **Build Pipeline**: Automatizirani proces za izgradnju i testiranje koda
- **Deployment Slot**: Testno okruženje unutar App Service-a
- **Environment Parity**: Održavanje sličnosti između razvojnih, testnih i produkcijskih okruženja

### Pojmovi sigurnosti
- **Managed Identity**: Azure značajka koja pruža automatsko upravljanje vjerodajnicama
- **Key Vault**: Sigurna pohrana za tajne, ključeve i certifikate
- **RBAC**: Kontrola pristupa temeljena na ulogama za Azure resurse
- **Network Security Group**: Virtualni firewall za kontrolu mrežnog prometa

### Pojmovi praćenja
- **Telemetrija**: Automatizirano prikupljanje mjerenja i podataka
- **Praćenje performansi aplikacija (APM)**: Praćenje performansi softvera
- **Log Analytics**: Usluga za prikupljanje i analizu log podataka
- **Pravila upozorenja**: Automatizirane obavijesti temeljene na metrima ili uvjetima

### Pojmovi implementacije
- **Blue-Green Implementacija**: Strategija implementacije bez zastoja
- **Canary Implementacija**: Postupno uvođenje za podskup korisnika
- **Rolling Update**: Sekvencijalna zamjena instanci aplikacije
- **Rollback**: Vraćanje na prethodnu verziju aplikacije

---

**Savjet za korištenje**: Koristite `Ctrl+F` za brzo pretraživanje specifičnih pojmova u ovom rječniku. Pojmovi su međusobno povezani gdje je primjenjivo.

---

**Navigacija**
- **Prethodna lekcija**: [Cheat Sheet](cheat-sheet.md)
- **Sljedeća lekcija**: [FAQ](faq.md)

---

**Odricanje od odgovornosti**:  
Ovaj dokument je preveden pomoću AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za ključne informacije preporučuje se profesionalni prijevod od strane ljudskog prevoditelja. Ne preuzimamo odgovornost za nesporazume ili pogrešna tumačenja koja mogu proizaći iz korištenja ovog prijevoda.