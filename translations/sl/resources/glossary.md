# Slovar - Terminologija Azure in AZD

**Referenca za vse poglavja**
- **📚 Domača stran tečaja**: [AZD za začetnike](../README.md)
- **📖 Naučite se osnov**: [Poglavje 1: Osnove AZD](../docs/chapter-01-foundation/azd-basics.md)
- **🤖 Termini AI**: [Poglavje 2: AI-prvi razvoj](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)

## Uvod

Ta obsežni slovar zagotavlja definicije izrazov, konceptov in okrajšav, uporabljenih v Azure Developer CLI in razvoju v oblaku Azure. Ključna referenca za razumevanje tehnične dokumentacije, odpravljanje težav in učinkovito komunikacijo o azd projektih in Azure storitvah.

## Cilji učenja

Z uporabo tega slovarja boste:
- Razumeli temeljno terminologijo in koncepte Azure Developer CLI
- Obvladali besedišče in tehnične izraze za razvoj v oblaku Azure
- Učinkovito uporabljali izraze iz področja Infrastructure as Code in nameščanja
- Razumeli imena Azure storitev, okrajšave in njihove namene
- Imeli dostop do definicij za terminologijo odpravljanja težav in razhroščevanja
- Naučili se napredne koncepte Azure arhitekture in razvoja

## Rezultati učenja

Z rednimi sklicevanji na ta slovar boste lahko:
- Učinkovito komunicirali z uporabo pravilne terminologije Azure Developer CLI
- Bolje razumeli tehnično dokumentacijo in sporočila o napakah
- Z zaupanjem krmarili med Azure storitvami in koncepti
- Odpravljali težave z uporabo primernega tehničnega besedišča
- Prispevali k timskim razpravam z natančnim tehničnim jezikom
- Sistematično razširili svoje znanje o razvoju v oblaku Azure

## A

**ARM Template**  
Azure Resource Manager predloga. JSON-osnova infrastrukture kot kode, uporabljena za deklarativno definiranje in nameščanje Azure virov.

**App Service**  
Azure platforma kot storitev (PaaS) za gostovanje spletnih aplikacij, REST API-jev in mobilnih zaledij brez upravljanja infrastrukture.

**Application Insights**  
Azure storitev za nadzor zmogljivosti aplikacij, ki omogoča globoke vpoglede v delovanje, razpoložljivost in uporabo aplikacij.

**Azure CLI**  
Ukazna vrstica za upravljanje Azure virov. Dopolnjuje AZD, vendar ima ločeno prijavo; osnovno preverjanje pristnosti AZD uporablja `azd auth login`.

**Azure Developer CLI (azd)**  
Ukazno orodje osredotočeno na razvijalce, ki pospešuje proces gradnje in nameščanja aplikacij v Azure z uporabo predlog in Infrastructure as Code.

**azure.yaml**  
Glavna konfiguracijska datoteka za projekt azd, ki definira storitve, infrastrukturo in sprožilce nameščanja.

**Azure Resource Manager (ARM)**  
Azure storitev za nameščanje in upravljanje, ki zagotavlja upravljalsko plast za ustvarjanje, posodabljanje in brisanje virov.

## B

**Bicep**  
Domena-specifični jezik (DSL), ki ga je razvil Microsoft za nameščanje Azure virov. Ponuja enostavnejšo sintakso kot ARM predloge, medtem ko se prevaja v ARM.

**Build**  
Proces prevajanja izvorne kode, nameščanja odvisnosti in priprave aplikacij za nameščanje.

**Blue-Green Deployment**  
Strategija nameščanja, ki uporablja dve identični produkcijski okolji (modro in zeleno) za zmanjšanje izpadov in tveganj.

## C

**Container Apps**  
Azure servis brez strežnika za vsebnike, ki omogoča zagon aplikacij v vsebnikih brez upravljanja zapletene infrastrukture.

**CI/CD**  
Neprekinjena integracija/neprekinjeno nameščanje. Avtomatizirane prakse za vključevanje sprememb kode in nameščanje aplikacij.

**Cosmos DB**  
Globalno razporejena večmodelna podatkovna baza Azure, ki zagotavlja celovite SLA za prepustnost, zakasnitev, razpoložljivost in konsistenco.

**Configuration**  
Nastavitve in parametri, ki nadzorujejo obnašanje aplikacije in možnosti nameščanja.

## D

**Deployment**  
Proces nameščanja in konfiguracije aplikacij ter njihovih odvisnosti na ciljni infrastrukturi.

**Docker**  
Platforma za razvoj, pošiljanje in zagon aplikacij z uporabo kontejnerizacijske tehnologije.

**Dockerfile**  
Besedilna datoteka z navodili za gradnjo Docker kontejnerske slike.

## E

**Environment**  
Cilj nameščanja, ki predstavlja specifičen primer vaše aplikacije (npr. razvoj, testiranje, produkcija).

**Environment Variables**  
Konfiguracijske vrednosti, shranjene kot par ključ-vrednost, do katerih lahko aplikacije dostopajo med zagonom.

**Endpoint**  
URL ali omrežni naslov, kjer je dostopna aplikacija ali storitev.

## F

**Function App**  
Azure strežniško brezplačna računska storitev, ki omogoča zagon dogodkovno vodenega kode brez upravljanja infrastrukture.

## G

**GitHub Actions**  
CI/CD platforma, integrirana z GitHub repozitoriji za avtomatizacijo delovnih tokov.

**Git**  
Razpršen sistem za nadzor različic, uporabljen za sledenje sprememb v izvorni kodi.

## H

**Hooks**  
Prilagojeni skripti ali ukazi, ki se izvajajo v določenih točkah življenjskega cikla nameščanja (pre-provision, post-provision, pre-deploy, post-deploy).

**Host**  
Vrsta Azure storitve, kamor bo aplikacija nameščena (npr. appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Praksa definiranja in upravljanja infrastrukture z uporabo kode namesto ročnih postopkov.

**Init**  
Proces inicializacije novega azd projekta, običajno iz predloge.

## J

**JSON**  
JavaScript Object Notation. Format za izmenjavo podatkov, pogosto uporabljen za konfiguracijske datoteke in API odgovore.

**JWT**  
JSON Web Token. Standard za varno prenašanje informacij med strankami kot JSON objekt.

## K

**Key Vault**  
Azure storitev za varno shranjevanje in upravljanje skrivnosti, ključev in potrdil.

**Kusto Query Language (KQL)**  
Jezik poizvedb, uporabljen za analizo podatkov v Azure Monitor, Application Insights in drugih Azure storitvah.

## L

**Load Balancer**  
Storitev, ki razporeja vhodni omrežni promet med več strežnikov ali instanc.

**Log Analytics**  
Azure storitev za zbiranje, analizo in ukrepanje na podlagi telemetričnih podatkov iz oblakov in lokalnih okolij.

## M

**Managed Identity**  
Azure funkcija, ki omogoča Azure storitvam samodejno upravljanje identitete za preverjanje pristnosti do drugih Azure storitev.

**Microservices**  
Arhitekturni pristop, kjer so aplikacije zgrajene kot zbirka majhnih, neodvisnih storitev.

**Monitor**  
Združena Azure rešitev za nadzor, ki zagotavlja celovit vpogled skozi aplikacije in infrastrukturo.

## N

**Node.js**  
JavaScript runtime okolje, zgrajeno na Chrome V8 JavaScript pogonu za gradnjo strežniških aplikacij.

**npm**  
Upravljalnik paketov za Node.js, ki upravlja odvisnosti in pakete.

## O

**Output**  
Vrednosti, ki jih vrne nameščanje infrastrukture in jih lahko uporabljajo aplikacije ali drugi viri.

## P

**Package**  
Proces priprave kode aplikacije in odvisnosti za nameščanje.

**Parameters**  
Vhodne vrednosti, posredovane infrastrukturi predlog, da prilagodijo nameščanja.

**PostgreSQL**  
Odprtokodni relacijski podatkovni sistem, podprt kot upravljana storitev v Azure.

**Provisioning**  
Proces ustvarjanja in konfiguriranja Azure virov, opredeljenih v infrastrukturi predlog.

## Q

**Quota**  
Omejitve glede količine virov, ki jih je mogoče ustvariti v Azure naročnini ali regiji.

## R

**Resource Group**  
Logičen vsebnik za Azure vire, ki si delijo enak življenjski cikel, dovoljenja in politike.

**Resource Token**  
Edinstvena niz, ki ga ustvari azd za zagotavljanje edinstvenosti imen virov v namestitvah.

**REST API**  
Arhitekturni slog za načrtovanje mrežnih aplikacij z uporabo HTTP metod.

**Rollback**  
Proces vračanja nazaj na prejšnjo različico aplikacije ali konfiguracije infrastrukture.

## S

**Service**  
Komponenta vaše aplikacije, definirana v azure.yaml (npr. spletni vmesnik, API zaledje, podatkovna baza).

**SKU**  
Stock Keeping Unit. Predstavlja različne stopnje storitev ali nivoje zmogljivosti za Azure vire.

**SQL Database**  
Azure upravljana relacijska podatkovna storitev na osnovi Microsoft SQL Serverja.

**Static Web Apps**  
Azure storitev za gradnjo in nameščanje popolnih spletnih aplikacij iz izvornih kodnih repozitorijev.

**Storage Account**  
Azure storitev, ki zagotavlja oblačno shrambo za podatkovne objekte, vključno z blobs, datotekami, čakalnimi vrstami in tabelami.

**Subscription**  
Azure račun, ki vsebuje skupine virov in vire ter upravlja obračunavanje in dostop.

## T

**Template**  
Vnaprej zgrajena struktura projekta, ki vsebuje kodo aplikacije, definicije infrastrukture in konfiguracijo za pogoste scenarije.

**Terraform**  
Odprtokodno orodje Infrastructure as Code, ki podpira več oblačnih ponudnikov vključno z Azure.

**Traffic Manager**  
Azure DNS-zasnovan usmerjevalnik omrežnega prometa za razporejanje prometa prek globalnih regij Azure.

## U

**URI**  
Uniform Resource Identifier. Niz, ki identificira določen vir.

**URL**  
Uniform Resource Locator. Vrsta URI, ki določa, kje je vir in kako ga pridobiti.

## V

**Virtual Network (VNet)**  
Temeljni gradnik zasebnih omrežij v Azure, ki zagotavlja izolacijo in segmentacijo.

**VS Code**  
Visual Studio Code. Priljubljen urejevalnik kode z odlično integracijo Azure in azd.

## W

**Webhook**  
HTTP povratni klic, sprožen ob določenih dogodkih, pogosto uporabljen v CI/CD cevovodih.

**What-if**  
Azure funkcija, ki prikazuje, katere spremembe bi izvedlo nameščanje, ne da bi ga dejansko izvedla.

## Y

**YAML**  
YAML Ain't Markup Language. Standard človeško berljive serializacije podatkov, uporabljen za konfiguracijske datoteke, kot je azure.yaml.

## Z

**Zone**  
Fizično ločena mesta znotraj Azure regije, ki zagotavljajo redundantnost in visoko razpoložljivost.

---

## Pogoste okrajšave

| Okrajšava | Polno ime | Opis |
|---------|-----------|-------------|
| AAD | Azure Active Directory (zdaj Microsoft Entra ID) | Storitve za upravljanje identitet in dostopa |
| ACR | Azure Container Registry | Storitve za registro slik vsebnikov |
| AKS | Azure Kubernetes Service | Upravljana Kubernetes storitev |
| API | Application Programming Interface | Nabor protokolov za gradnjo programske opreme |
| ARM | Azure Resource Manager | Azure storitev za nameščanje in upravljanje |
| CDN | Content Delivery Network | Porazdeljena mreža strežnikov |
| CI/CD | Neprekinjena integracija/neprekinjeno nameščanje | Avtomatizirane razvojne prakse |
| CLI | Ukazna vrstica | Besedilni uporabniški vmesnik |
| DNS | Domain Name System | Sistem za prevajanje domen v IP naslove |
| HTTPS | Hypertext Transfer Protocol Secure | Varnostna različica HTTP |
| IaC | Infrastructure as Code | Upravljanje infrastrukture s kodo |
| JSON | JavaScript Object Notation | Format za izmenjavo podatkov |
| JWT | JSON Web Token | Oblika tokena za varno prenašanje informacij |
| KQL | Kusto Query Language | Jezik za poizvedbe Azure podatkovnih storitev |
| RBAC | Role-Based Access Control | Metoda nadzora dostopa na osnovi vlog uporabnikov |
| REST | Representational State Transfer | Arhitekturni slog za spletne storitve |
| SDK | Software Development Kit | Zbirka razvojnih orodij |
| SLA | Service Level Agreement | Zaveza glede razpoložljivosti/zmogljivosti storitve |
| SQL | Structured Query Language | Jezik za upravljanje relacijskih podatkovnih baz |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Kriptografski protokoli |
| URI | Uniform Resource Identifier | Niz, ki identificira vir |
| URL | Uniform Resource Locator | Vrsta URI, ki določa lokacijo vira |
| VM | Virtual Machine | Emulacija računalniškega sistema |
| VNet | Virtual Network | Zasebno omrežje v Azure |
| YAML | YAML Ain't Markup Language | Standard serializacije podatkov |

---

## Preslikave imen Azure storitev

| Pogosto ime | Uradno ime Azure storitve | tip gostitelja azd |
|-------------|------------------------------|---------------|
| Web App | Azure App Service | `appservice` |
| API App | Azure App Service | `appservice` |
| Container App | Azure Container Apps | `containerapp` |
| Function | Azure Functions | `function` |
| Static Site | Azure Static Web Apps | `staticwebapp` |
| Database | Azure Database for PostgreSQL | Infrastrukturni vir, ne aplikacija `host` |
| NoSQL DB | Azure Cosmos DB | Infrastrukturni vir, ne aplikacija `host` |
| Storage | Azure Storage Account | Infrastrukturni vir, ne vgrajena aplikacija `host` |
| Cache | Azure Managed Redis | Infrastrukturni vir, ne aplikacija `host` |
| Search | Azure AI Search | Infrastrukturni vir, ne aplikacija `host` |
| Messaging | Azure Service Bus | Infrastrukturni vir, ne aplikacija `host` |

`services.<name>.host` izbere cilj nameščanja aplikacije; ni kratica za nobeno vrsto Azure vira. Podatkovne baze, predpomnilniki, storitve iskanja in čakalne vrste običajno zagotavlja ponudnik infrastrukture in so povezane z aplikacijo prek izhodov/konfiguracije.

---

## Kontekstno specifični izrazi

### Izrazi za razvoj
- **Hot Reload**: Samodejno posodabljanje aplikacij med razvojem brez ponovnega zagona
- **Build Pipeline**: Avtomatiziran proces gradnje in testiranja kode
- **Deployment Slot**: Testno okolje znotraj App Service
- **Environment Parity**: Ohranjanje podobnosti med razvojnim, testnim in produkcijskim okoljem

### Izrazi za varnost
- **Managed Identity**: Azure funkcija, ki zagotavlja samodejno upravljanje poverilnic
- **Key Vault**: Varnostna shramba za skrivnosti, ključe in potrdila
- **RBAC**: Nadzor dostopa na osnovi vlog za Azure vire
- **Network Security Group**: Virtualni požarni zid za nadzor omrežnega prometa

### Izrazi za nadzor
- **Telemetry**: Avtomatizirano zbiranje meritev in podatkov
- **Application Performance Monitoring (APM)**: Nadzor zmogljivosti programske opreme
- **Log Analytics**: Storitev za zbiranje in analizo dnevniških podatkov
- **Alert Rules**: Avtomatizirana obvestila na podlagi meritev ali pogojev

### Izrazi za nameščanje
- **Blue-Green Deployment**: Strategija nameščanja brez izpadov
- **Canary Deployment**: Postopen razporeditev za podmnožico uporabnikov
- **Rolling Update**: Zaporedna zamenjava instanc aplikacije
- **Rollback**: Vračanje nazaj na prejšnjo različico aplikacije

---

**Nasvet za uporabo**: Uporabite `Ctrl+F` za hitro iskanje določenih izrazov v tem slovarju. Izrazi so med seboj povezani, kjer je to ustrezno.

---

**Navigacija**
- **Prejšnja lekcija**: [Preverjalni list](cheat-sheet.md)
- **Naslednja lekcija**: [Pogosta vprašanja](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->