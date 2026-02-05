# Glosar - Terminologija Azure in AZD

**Referenca za vse poglavja**
- **📚 Domača stran tečaja**: [AZD za začetnike](../README.md)
- **📖 Naučite se osnov**: [Poglavje 1: Osnove AZD](../docs/getting-started/azd-basics.md)
- **🤖 AI izrazi**: [Poglavje 2: Razvoj z AI](../docs/ai-foundry/azure-ai-foundry-integration.md)

## Uvod

Ta obsežen glosar ponuja definicije izrazov, konceptov in kratic, ki se uporabljajo pri Azure Developer CLI in razvoju v oblaku Azure. Ključna referenca za razumevanje tehnične dokumentacije, reševanje težav in učinkovito komunikacijo o projektih azd ter storitvah Azure.

## Cilji učenja

Z uporabo tega glosarja boste:
- Razumeli ključne izraze in koncepte Azure Developer CLI
- Obvladali besedišče in tehnične izraze razvoja v oblaku Azure
- Učinkovito uporabljali terminologijo za infrastrukturo kot kodo in uvajanje
- Razumeli imena storitev Azure, kratice in njihove namene
- Dostopali do definicij za terminologijo odpravljanja težav in razhroščevanja
- Naučili se naprednih konceptov arhitekture in razvoja v Azure

## Rezultati učenja

Z redno uporabo tega glosarja boste lahko:
- Učinkovito komunicirali z uporabo pravilne terminologije Azure Developer CLI
- Jasneje razumeli tehnično dokumentacijo in sporočila o napakah
- Z zaupanjem navigirali med storitvami in koncepti Azure
- Reševali težave z uporabo ustreznega tehničnega besedišča
- Prispevali k timskim razpravam z natančnim tehničnim jezikom
- Sistematično širili svoje znanje o razvoju v oblaku Azure

## A

**ARM predloga**  
Predloga Azure Resource Manager. Format JSON za infrastrukturo kot kodo, ki se uporablja za deklarativno definiranje in uvajanje virov Azure.

**App Service**  
Azurejeva platforma kot storitev (PaaS) za gostovanje spletnih aplikacij, REST API-jev in mobilnih zaledij brez upravljanja infrastrukture.

**Application Insights**  
Azurejeva storitev za spremljanje zmogljivosti aplikacij (APM), ki ponuja poglobljen vpogled v zmogljivost, razpoložljivost in uporabo aplikacij.

**Azure CLI**  
Ukazna vrstica za upravljanje virov Azure. Uporablja jo azd za avtentikacijo in nekatere operacije.

**Azure Developer CLI (azd)**  
Razvijalcem prijazno orodje ukazne vrstice, ki pospeši proces gradnje in uvajanja aplikacij v Azure z uporabo predlog in infrastrukture kot kode.

**azure.yaml**  
Glavna konfiguracijska datoteka za projekt azd, ki definira storitve, infrastrukturo in uvajalne kljuke.

**Azure Resource Manager (ARM)**  
Azurejeva storitev za uvajanje in upravljanje, ki zagotavlja upravljalni sloj za ustvarjanje, posodabljanje in brisanje virov.

## B

**Bicep**  
Domeni specifičen jezik (DSL), ki ga je razvil Microsoft za uvajanje virov Azure. Ponuja enostavnejšo sintakso kot ARM predloge, medtem ko se prevaja v ARM.

**Gradnja**  
Proces prevajanja izvorne kode, nameščanja odvisnosti in priprave aplikacij za uvajanje.

**Blue-Green uvajanje**  
Strategija uvajanja, ki uporablja dve identični produkcijski okolji (modro in zeleno) za zmanjšanje izpadov in tveganja.

## C

**Container Apps**  
Azurejeva strežniška storitev za kontejnere, ki omogoča izvajanje aplikacij v kontejnerjih brez upravljanja kompleksne infrastrukture.

**CI/CD**  
Neprekinjena integracija/neprekinjeno uvajanje. Avtomatizirane prakse za integracijo sprememb kode in uvajanje aplikacij.

**Cosmos DB**  
Azurejeva globalno razporejena, večmodelna podatkovna storitev, ki zagotavlja celovite SLA-je za prepustnost, zakasnitve, razpoložljivost in doslednost.

**Konfiguracija**  
Nastavitve in parametri, ki nadzorujejo vedenje aplikacije in možnosti uvajanja.

## D

**Uvajanje**  
Proces nameščanja in konfiguriranja aplikacij ter njihovih odvisnosti na ciljno infrastrukturo.

**Docker**  
Platforma za razvoj, dostavo in izvajanje aplikacij z uporabo tehnologije kontejnerizacije.

**Dockerfile**  
Besedilna datoteka, ki vsebuje navodila za gradnjo slike Docker kontejnerja.

## E

**Okolje**  
Cilj uvajanja, ki predstavlja specifično instanco vaše aplikacije (npr. razvoj, testiranje, produkcija).

**Okoljske spremenljivke**  
Konfiguracijske vrednosti, shranjene kot ključ-vrednost pari, ki jih aplikacije lahko dostopajo med izvajanjem.

**Končna točka**  
URL ali omrežni naslov, kjer je mogoče dostopati do aplikacije ali storitve.

## F

**Function App**  
Azurejeva strežniška storitev za računalništvo, ki omogoča izvajanje dogodkovno usmerjene kode brez upravljanja infrastrukture.

## G

**GitHub Actions**  
Platforma CI/CD, integrirana z GitHub repozitoriji za avtomatizacijo delovnih tokov.

**Git**  
Porazdeljen sistem za nadzor različic, ki se uporablja za sledenje spremembam v izvorni kodi.

## H

**Ključi**  
Prilagojeni skripti ali ukazi, ki se izvajajo na specifičnih točkah med življenjskim ciklom uvajanja (predpriprava, popopriprava, preduvajanje, popouvajanje).

**Gostitelj**  
Tip storitve Azure, kjer bo aplikacija uvedena (npr. appservice, containerapp, function).

## I

**Infrastruktura kot koda (IaC)**  
Praksa definiranja in upravljanja infrastrukture prek kode namesto ročnih procesov.

**Init**  
Proces inicializacije novega projekta azd, običajno iz predloge.

## J

**JSON**  
JavaScript Object Notation. Format za izmenjavo podatkov, ki se pogosto uporablja za konfiguracijske datoteke in odgovore API-jev.

**JWT**  
JSON Web Token. Standard za varno prenašanje informacij med strankami kot JSON objekt.

## K

**Key Vault**  
Azurejeva storitev za varno shranjevanje in upravljanje skrivnosti, ključev in certifikatov.

**Kusto Query Language (KQL)**  
Jezik poizvedb, ki se uporablja za analizo podatkov v Azure Monitorju, Application Insights in drugih storitvah Azure.

## L

**Load Balancer**  
Storitev, ki razporeja dohodni omrežni promet med več strežniki ali instancami.

**Log Analytics**  
Azurejeva storitev za zbiranje, analizo in ukrepanje na podlagi telemetrijskih podatkov iz oblačnih in lokalnih okolij.

## M

**Upravljana identiteta**  
Funkcija Azure, ki storitvam Azure zagotavlja samodejno upravljano identiteto za avtentikacijo do drugih storitev Azure.

**Mikrostoritve**  
Arhitekturni pristop, kjer so aplikacije zgrajene kot zbirka majhnih, neodvisnih storitev.

**Monitor**  
Azurejeva rešitev za spremljanje, ki zagotavlja celovito opazovanje aplikacij in infrastrukture.

## N

**Node.js**  
JavaScript runtime, zgrajen na JavaScript motorju V8 za gradnjo strežniških aplikacij.

**npm**  
Upravitelj paketov za Node.js, ki upravlja odvisnosti in pakete.

## O

**Izhod**  
Vrednosti, vrnjene iz uvajanja infrastrukture, ki jih lahko uporabljajo aplikacije ali drugi viri.

## P

**Paketiranje**  
Proces priprave kode aplikacije in odvisnosti za uvajanje.

**Parametri**  
Vhodne vrednosti, posredovane predlogam infrastrukture za prilagoditev uvajanj.

**PostgreSQL**  
Odprtokodni sistem relacijskih podatkovnih baz, podprt kot upravljana storitev v Azure.

**Priprava**  
Proces ustvarjanja in konfiguriranja virov Azure, definiranih v predlogah infrastrukture.

## Q

**Kvota**  
Omejitve glede količine virov, ki jih je mogoče ustvariti v naročnini ali regiji Azure.

## R

**Skupina virov**  
Logična posoda za vire Azure, ki delijo isti življenjski cikel, dovoljenja in politike.

**Žeton virov**  
Edinstven niz, ki ga ustvari azd za zagotavljanje edinstvenosti imen virov med uvajanji.

**REST API**  
Arhitekturni slog za oblikovanje omrežnih aplikacij z uporabo metod HTTP.

**Povrnitev**  
Proces vračanja na prejšnjo različico aplikacije ali konfiguracije infrastrukture.

## S

**Storitev**  
Komponenta vaše aplikacije, definirana v azure.yaml (npr. spletni frontend, API backend, podatkovna baza).

**SKU**  
Stock Keeping Unit. Predstavlja različne nivoje storitev ali zmogljivosti za vire Azure.

**SQL podatkovna baza**  
Azurejeva upravljana storitev relacijskih podatkovnih baz, ki temelji na Microsoft SQL Serverju.

**Static Web Apps**  
Azurejeva storitev za gradnjo in uvajanje spletnih aplikacij iz repozitorijev izvorne kode.

**Račun za shranjevanje**  
Azurejeva storitev, ki zagotavlja oblačno shranjevanje za podatkovne objekte, vključno z blobi, datotekami, vrstami in tabelami.

**Naročnina**  
Posoda za račun Azure, ki vsebuje skupine virov in vire, z povezanimi obračuni in upravljanjem dostopa.

## T

**Predloga**  
Vnaprej zgrajena struktura projekta, ki vsebuje kodo aplikacije, definicije infrastrukture in konfiguracijo za pogoste scenarije.

**Terraform**  
Orodje za infrastrukturo kot kodo, ki podpira več ponudnikov oblakov, vključno z Azure.

**Upravitelj prometa**  
Azurejev DNS-uravnoteževalnik prometa za razporejanje prometa med globalnimi regijami Azure.

## U

**URI**  
Uniform Resource Identifier. Niz, ki identificira določen vir.

**URL**  
Uniform Resource Locator. Tip URI, ki določa, kje se vir nahaja in kako ga pridobiti.

## V

**Virtualno omrežje (VNet)**  
Temeljni gradnik za zasebna omrežja v Azure, ki zagotavlja izolacijo in segmentacijo.

**VS Code**  
Visual Studio Code. Priljubljen urejevalnik kode z odlično integracijo Azure in azd.

## W

**Webhook**  
HTTP povratni klic, sprožen s specifičnimi dogodki, pogosto uporabljen v CI/CD tokovih.

**What-if**  
Funkcija Azure, ki prikazuje, katere spremembe bi bile izvedene z uvajanjem, ne da bi ga dejansko izvedli.

## Y

**YAML**  
YAML Ain't Markup Language. Standard za serializacijo podatkov, ki je berljiv za ljudi, uporabljen za konfiguracijske datoteke, kot je azure.yaml.

## Z

**Cona**  
Fizično ločene lokacije znotraj regije Azure, ki zagotavljajo redundanco in visoko razpoložljivost.

---

## Pogoste kratice

| Kratica | Polni naziv | Opis |
|---------|-------------|------|
| AAD | Azure Active Directory | Storitev za upravljanje identitete in dostopa |
| ACR | Azure Container Registry | Storitev za registracijo slik kontejnerjev |
| AKS | Azure Kubernetes Service | Upravljana storitev Kubernetes |
| API | Application Programming Interface | Nabor protokolov za gradnjo programske opreme |
| ARM | Azure Resource Manager | Azurejeva storitev za uvajanje in upravljanje |
| CDN | Content Delivery Network | Razpršeno omrežje strežnikov |
| CI/CD | Continuous Integration/Continuous Deployment | Avtomatizirane razvojne prakse |
| CLI | Command Line Interface | Besedilni uporabniški vmesnik |
| DNS | Domain Name System | Sistem za prevajanje domen v IP naslove |
| HTTPS | Hypertext Transfer Protocol Secure | Varna različica HTTP |
| IaC | Infrastructure as Code | Upravljanje infrastrukture prek kode |
| JSON | JavaScript Object Notation | Format za izmenjavo podatkov |
| JWT | JSON Web Token | Format žetona za varno prenašanje informacij |
| KQL | Kusto Query Language | Jezik poizvedb za podatkovne storitve Azure |
| RBAC | Role-Based Access Control | Metoda nadzora dostopa na podlagi vlog |
| REST | Representational State Transfer | Arhitekturni slog za spletne storitve |
| SDK | Software Development Kit | Zbirka razvojnih orodij |
| SLA | Service Level Agreement | Zaveza glede razpoložljivosti/zmogljivosti storitve |
| SQL | Structured Query Language | Jezik za upravljanje relacijskih podatkovnih baz |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Kriptografski protokoli |
| URI | Uniform Resource Identifier | Niz, ki identificira vir |
| URL | Uniform Resource Locator | Tip URI, ki določa lokacijo vira |
| VM | Virtual Machine | Emulacija računalniškega sistema |
| VNet | Virtual Network | Zasebno omrežje v Azure |
| YAML | YAML Ain't Markup Language | Standard za serializacijo podatkov |

---

## Preslikave imen storitev Azure

| Splošno ime | Uradno ime storitve Azure | Tip gostitelja azd |
|-------------|----------------------------|--------------------|
| Spletna aplikacija | Azure App Service | `appservice` |
| API aplikacija | Azure App Service | `appservice` |
| Kontejnerska aplikacija | Azure Container Apps | `containerapp` |
| Funkcija | Azure Functions | `function` |
| Statična stran | Azure Static Web Apps | `staticwebapp` |
| Podatkovna baza | Azure Database for PostgreSQL | `postgres` |
| NoSQL DB | Azure Cosmos DB | `cosmosdb` |
| Shranjevanje | Azure Storage Account | `storage` |
| Predpomnilnik | Azure Cache for Redis | `redis` |
| Iskanje | Azure Cognitive Search | `search` |
| Sporočanje | Azure Service Bus | `servicebus` |

---

## Izrazi, specifični za kontekst

### Razvojni izrazi
- **Hot Reload**: Samodejno posodabljanje aplikacij med razvojem brez ponovnega zagona
- **Build Pipeline**: Avtomatiziran proces za gradnjo in testiranje kode
- **Deployment Slot**: Testno okolje znotraj App Service
- **Environment Parity**: Ohranjanje podobnosti med razvojnimi, testnimi in produkcijskimi okolji

### Varnostni izrazi
- **Upravljana identiteta**: Funkcija Azure za samodejno upravljanje poverilnic
- **Key Vault**: Varno shranjevanje za skrivnosti, ključe in certifikate
- **RBAC**: Nadzor dostopa na podlagi vlog za vire Azure
- **Network Security Group**: Virtualni požarni zid za nadzor omrežnega prometa

### Izrazi za spremljanje
- **Telemetrija**: Avtomatizirano zbiranje meritev in podatkov
- **Spremljanje zmogljivosti aplikacij (APM)**: Spremljanje zmogljivosti programske opreme
- **Log Analytics**: Storitev za zbiranje in analizo dnevniških podatkov
- **Pravila opozoril**: Avtomatizirana obvestila na podlagi metrik ali pogojev

### Izrazi za uvajanje
- **Blue-Green uvajanje**: Strategija uvajanja brez izpadov
- **Canary uvajanje**: Postopno uvajanje na podmnožico uporabnikov
- **Rolling Update**: Zaporedna zamenjava instanc aplikacije
- **Povrnitev**: Vračanje na prejšnjo različico aplikacije

---

**Nasvet za uporabo**: Uporabite `Ctrl+F` za hitro iskanje specifičnih izrazov v tem glosarju. Izrazi so medsebojno povezani, kjer je to primerno.

---

**Navigacija**
- **Prejšnja lekcija**: [Pomočnik](cheat-sheet.md)
- **Naslednja lekcija**: [Pogosta vprašanja](faq.md)

---

**Omejitev odgovornosti**:  
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem maternem jeziku je treba obravnavati kot avtoritativni vir. Za ključne informacije priporočamo profesionalni človeški prevod. Ne prevzemamo odgovornosti za morebitna nesporazumevanja ali napačne razlage, ki bi nastale zaradi uporabe tega prevoda.