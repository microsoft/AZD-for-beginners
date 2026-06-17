# Slovarček - Azure in AZD terminologija

**Referenca za vsa poglavja**
- **📚 Course Home**: [AZD For Beginners](../README.md)
- **📖 Learn Basics**: [Chapter 1: AZD Basics](../docs/getting-started/azd-basics.md)
- **🤖 AI Terms**: [Chapter 2: AI-First Development](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## Uvod

Ta obsežen slovarček nudi definicije za izraze, koncepte in kratico, uporabljene v Azure Developer CLI in razvoju v oblaku Azure. Ključna referenca za razumevanje tehnične dokumentacije, odpravljanje težav in učinkovito komunikacijo o azd projektih in Azure storitvah.

## Cilji učenja

Z uporabo tega slovarčka boste:
- Razumeli bistveno terminologijo in koncepte Azure Developer CLI
- Obvladali slovar Azure oblaka in tehnične izraze
- Hitro našli izraze za Infrastructure as Code in naslove za nameščanje
- Razumeli imena Azure storitev, kratice in njihov namen
- Dostopali do definicij za odpravljanje težav in razhroščevanje
- Naučili se naprednih konceptov arhitekture in razvoja v Azure

## Pričakovani izidi učenja

Z rednim sklicevanjem na ta slovarček boste lahko:
- Učinkovito komunicirali z uporabo pravilne terminologije Azure Developer CLI
- Jasneje razumeli tehnično dokumentacijo in sporočila o napakah
- Z zaupanjem krmarili po Azure storitvah in konceptih
- Odpravljali težave z uporabo primerne tehnične terminologije
- Prispevali k pogovorom v ekipi z natančnim tehničnim jezikom
- Sistematično širili svoje znanje razvoja v Azure oblaku

## A

**ARM Template**  
Azure Resource Manager predloga. JSON-podprt format Infrastructure as Code, ki se uporablja za deklarativno definiranje in nameščanje Azure virov.

**App Service**  
Azure storitev platforme kot storitev (PaaS) za gostovanje spletnih aplikacij, REST API-jev in mobilnih zaledij brez upravljanja infrastrukture.

**Application Insights**  
Azure-jeva storitev za spremljanje zmogljivosti aplikacij (APM), ki nudi globok vpogled v zmogljivost, razpoložljivost in uporabo aplikacij.

**Azure CLI**  
Vmesnik ukazne vrstice za upravljanje Azure virov. Uporablja ga azd za avtentikacijo in nekatere operacije.

**Azure Developer CLI (azd)**  
Ukazno orodje osredotočeno na razvijalce, ki pospešuje proces izdelave in nameščanja aplikacij v Azure z uporabo predlog in Infrastructure as Code.

**azure.yaml**  
Glavna konfiguracijska datoteka za azd projekt, ki definira storitve, infrastrukturo in namestitvene kuke.

**Azure Resource Manager (ARM)**  
Azure-jev servis za nameščanje in upravljanje, ki nudi upravljalno plast za ustvarjanje, posodabljanje in brisanje virov.

## B

**Bicep**  
Domeno-specifičen jezik (DSL), ki ga je razvil Microsoft za nameščanje Azure virov. Ponuja preprostejšo sintakso kot ARM predloge in se prevede v ARM.

**Build**  
Proces prevajanja izvorne kode, nameščanja odvisnosti in priprave aplikacij za nameščanje.

**Blue-Green Deployment**  
Strategija nameščanja, ki uporablja dve identični produkcijski okolji (modro in zeleno) za zmanjšanje izpadov in tveganj.

## C

**Container Apps**  
Azure-ova strežba brez strežnika za vsebnike, ki omogoča poganjanje vsebnikiziranih aplikacij brez upravljanja kompleksne infrastrukture.

**CI/CD**  
Continuous Integration/Continuous Deployment. Avtomatizirane prakse za integracijo sprememb v kodo in nameščanje aplikacij.

**Cosmos DB**  
Globalno distribuirana, večmodelna podatkovna storitev Azure, ki zagotavlja celovite SLA-je za prepustnost, zakasnitev, razpoložljivost in konsistentnost.

**Configuration**  
Nastavitve in parametri, ki nadzorujejo vedenje aplikacije in možnosti nameščanja.

## D

**Deployment**  
Proces nameščanja in konfiguracije aplikacij ter njihovih odvisnosti na ciljno infrastrukturo.

**Docker**  
Platforma za razvoj, pošiljanje in poganjanje aplikacij z uporabo tehnologije vsebnikov.

**Dockerfile**  
Besedilna datoteka, ki vsebuje navodila za izgradnjo slike Docker kontejnerja.

## E

**Environment**  
Cilj nameščanja, ki predstavlja specifičen primer vaše aplikacije (npr. razvoj, priprava, produkcija).

**Environment Variables**  
Konfiguracijske vrednosti shranjene kot pari ključ-vrednost, do katerih lahko aplikacije dostopajo v času izvajanja.

**Endpoint**  
URL ali omrežni naslov, kjer je aplikacija ali storitev dostopna.

## F

**Function App**  
Azure-ova strežba brez strežnika za izvajanje dogodkovno vodenih kod brez upravljanja infrastrukture.

## G

**GitHub Actions**  
CI/CD platforma integrirana z GitHub repozitoriji za avtomatizacijo potekov dela.

**Git**  
Distribuiran sistem za nadzor različic, ki se uporablja za sledenje spremembam v izvorni kodi.

## H

**Hooks**  
Po meri napisani skripti ali ukazi, ki se izvajajo v določenih točkah življenjskega cikla nameščanja (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Tip Azure storitve, kamor bo aplikacija nameščena (npr. appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Praksa definiranja in upravljanja infrastrukture preko kode namesto ročnih postopkov.

**Init**  
Proces inicializacije novega azd projekta, običajno iz predloge.

## J

**JSON**  
JavaScript Object Notation. Format za izmenjavo podatkov, pogosto uporabljen za konfiguracijske datoteke in odgovore API-jev.

**JWT**  
JSON Web Token. Standard za varno prenašanje informacij med strankami kot JSON objekt.

## K

**Key Vault**  
Azure-ova storitev za varno shranjevanje in upravljanje skrivnosti, ključev in certifikatov.

**Kusto Query Language (KQL)**  
Poizvedbeni jezik, uporabljen za analizo podatkov v Azure Monitorju, Application Insights in drugih Azure storitvah.

## L

**Load Balancer**  
Storitev, ki razporeja prihajajoči omrežni promet med več strežniki ali primerki.

**Log Analytics**  
Azure storitev za zbiranje, analizo in ukrepanje na telemetrijskih podatkih iz oblačnih in lokalnih okolij.

## M

**Managed Identity**  
Funkcija Azure, ki zagotavlja storitvam Azure samodejno upravljan identiteto za avtentikacijo do drugih Azure storitev.

**Microservices**  
Arhitekturni pristop, kjer so aplikacije zgrajene kot zbirka majhnih, neodvisnih storitev.

**Monitor**  
Azure-ova združena rešitev za spremljanje, ki nudi opaznost celotne skladbe aplikacij in infrastrukture.

## N

**Node.js**  
JavaScript runtime zgrajen na V8 JavaScript motorju Chrom-a za izdelavo strežniških aplikacij.

**npm**  
Upravitelj paketov za Node.js, ki upravlja odvisnosti in pakete.

## O

**Output**  
Vrednosti, vrnjene z nameščanjem infrastrukture, ki jih lahko uporabijo aplikacije ali drugi viri.

## P

**Package**  
Proces priprave kode aplikacije in odvisnosti za nameščanje.

**Parameters**  
Vhodne vrednosti, posredovane infrastrukturnim predlogam za prilagajanje nameščanj.

**PostgreSQL**  
Odprtokodni relacijski podatkovni sistem, podprt kot upravljana storitev v Azure.

**Provisioning**  
Proces ustvarjanja in konfiguracije Azure virov, definiranih v infrastrukturnih predlogah.

## Q

**Quota**  
Omejitve glede količine virov, ki jih je mogoče ustvariti v Azure naročniškem računu ali regiji.

## R

**Resource Group**  
Logični vsebnik za Azure vire, ki imajo isto življenjsko dobo, dovoljenja in politike.

**Resource Token**  
Edinstven niz, ustvarjen z azd za zagotovitev edinstvenosti imen virov med nameščanji.

**REST API**  
Arhitekturni slog za oblikovanje mrežnih aplikacij z uporabo HTTP metod.

**Rollback**  
Postopek vračanja na prejšnjo različico aplikacije ali konfiguracije infrastrukture.

## S

**Service**  
Komponenta vaše aplikacije, definirana v azure.yaml (npr. spletni vmesnik, API zaledje, podatkovna baza).

**SKU**  
Stock Keeping Unit. Predstavlja različne ravni storitev ali zmogljivosti za Azure vire.

**SQL Database**  
Azure-ova upravljana relacijska podatkovna storitev, temelječ na Microsoft SQL Serverju.

**Static Web Apps**  
Azure storitev za gradnjo in nameščanje celostnih spletnih aplikacij iz repozitorijev izvorne kode.

**Storage Account**  
Azure storitev, ki nudi oblačno shrambo za podatkovne objekte, vključno z blobs, files, queues in tables.

**Subscription**  
Azure račun kot vsebnik, ki vsebuje resource groups in vire, z ustreznim obračunavanjem in upravljanjem dostopa.

## T

**Template**  
Vnaprej izdelana struktura projekta, ki vsebuje kodo aplikacije, definicije infrastrukture in konfiguracijo za pogoste scenarije.

**Terraform**  
Odprtokodno orodje Infrastructure as Code, ki podpira več ponudnikov oblaka, vključno z Azure.

**Traffic Manager**  
Azure-ov DNS-podprt usmerjevalnik prometa za distribuiranje prometa po svetovnih Azure regijah.

## U

**URI**  
Uniform Resource Identifier. Niz, ki identificira določen vir.

**URL**  
Uniform Resource Locator. Tip URI, ki določa, kje se vir nahaja in kako ga pridobiti.

## V

**Virtual Network (VNet)**  
Temeljni gradnik za zasebna omrežja v Azure, ki nudi izolacijo in segmentacijo.

**VS Code**  
Visual Studio Code. Priljubljeno urejevalnik kode z odlično integracijo z Azure in azd.

## W

**Webhook**  
HTTP klic nazaj, sprožen z določenimi dogodki, pogosto uporabljen v CI/CD cevovodih.

**What-if**  
Azure funkcija, ki prikaže, katere spremembe bi bile narejene z nameščanjem, brez dejanskega izvajanja.

## Y

**YAML**  
YAML Ain't Markup Language. Človeško berljiv standard za serializacijo podatkov, uporabljen za konfiguracijske datoteke, kot je azure.yaml.

## Z

**Zone**  
Fizično ločena lokacija znotraj Azure regije, ki nudi redundanco in visoko razpoložljivost.

---

## Pogoste kratice

| Acronym | Full Form | Description |
|---------|-----------|-------------|
| AAD | Azure Active Directory (now Microsoft Entra ID) | Storitev za upravljanje identitet in dostopa |
| ACR | Azure Container Registry | Storitev za registracijo slik vsebnikov |
| AKS | Azure Kubernetes Service | Urejena storitev Kubernetes |
| API | Application Programming Interface | Nabor protokolov za gradnjo programske opreme |
| ARM | Azure Resource Manager | Azure-jev servis za nameščanje in upravljanje |
| CDN | Content Delivery Network | Distribuirano omrežje strežnikov |
| CI/CD | Continuous Integration/Continuous Deployment | Avtomatizirane prakse razvoja |
| CLI | Command Line Interface | Besedilni uporabniški vmesnik |
| DNS | Domain Name System | Sistem za prevajanje domen v IP naslove |
| HTTPS | Hypertext Transfer Protocol Secure | Varna različica HTTP |
| IaC | Infrastructure as Code | Upravljanje infrastrukture preko kode |
| JSON | JavaScript Object Notation | Format za izmenjavo podatkov |
| JWT | JSON Web Token | Format žetona za varno prenašanje informacij |
| KQL | Kusto Query Language | Poizvedbeni jezik za Azure podatkovne storitve |
| RBAC | Role-Based Access Control | Metoda nadzora dostopa temelječa na vlogah uporabnikov |
| REST | Representational State Transfer | Arhitekturni slog za spletne storitve |
| SDK | Software Development Kit | Zbirka orodij za razvoj |
| SLA | Service Level Agreement | Zaveza glede razpoložljivosti/zmogljivosti storitve |
| SQL | Structured Query Language | Jezik za upravljanje relacijskih podatkovnih baz |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Kriptografski protokoli |
| URI | Uniform Resource Identifier | Niz, ki identificira vir |
| URL | Uniform Resource Locator | Tip URI, ki določa lokacijo vira |
| VM | Virtual Machine | Emulacija računalniškega sistema |
| VNet | Virtual Network | Zasebno omrežje v Azure |
| YAML | YAML Ain't Markup Language | Standard za serializacijo podatkov |

---

## Preslikave imen Azure storitev

| Common Name | Official Azure Service Name | azd Host Type |
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
| Search | Azure AI Search | `search` |
| Messaging | Azure Service Bus | `servicebus` |

---

## Pojmi, specifični za kontekst

### Razvojni pojmi
- **Hot Reload**: Samodejna osvežitev aplikacij med razvojem brez ponovnega zagona
- **Build Pipeline**: Avtomatiziran proces za izgradnjo in testiranje kode
- **Deployment Slot**: Pripravljeno okolje znotraj App Service
- **Environment Parity**: Ohranjanje podobnosti med razvojnimi, pripravljalnimi in produkcijskimi okolji

### Varnostni pojmi
- **Managed Identity**: Azure funkcija, ki nudi samodejno upravljanje poverilnic
- **Key Vault**: Varen prostor za shranjevanje skrivnosti, ključev in certifikatov
- **RBAC**: Nadzor dostopa, temelječ na vlogah za Azure vire
- **Network Security Group**: Virtualni požarni zid za nadzor omrežnega prometa

### Pojmi za spremljanje
- **Telemetry**: Samodejno zbiranje meritev in podatkov
- **Application Performance Monitoring (APM)**: Spremljanje zmogljivosti programske opreme
- **Log Analytics**: Storitev za zbiranje in analizo dnevniških podatkov
- **Alert Rules**: Samodejna obvestila na podlagi meritev ali pogojev

### Pojmi za nameščanje
- **Blue-Green Deployment**: Strategija nameščanja brez izpadov
- **Canary Deployment**: Postopno uvajanje pri delu z delom uporabnikov
- **Rolling Update**: Zaporedna zamenjava primerkov aplikacije
- **Rollback**: Vrnitev na prejšnjo različico aplikacije

---

**Usage Tip**: Use `Ctrl+F` to quickly search for specific terms in this glossary. Terms are cross-referenced where applicable.

---

**Navigation**
- **Previous Lesson**: [Cheat Sheet](cheat-sheet.md)
- **Next Lesson**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->