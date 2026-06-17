# Sõnastik - Azure ja AZD terminoloogia

**Viide kõigile peatükkidele**
- **📚 Kursuse avaleht**: [AZD algajatele](../README.md)
- **📖 Õpi põhialuseid**: [Peatükk 1: AZD põhialused](../docs/getting-started/azd-basics.md)
- **🤖 Tehisintellekti terminid**: [Peatükk 2: AI-esimene arendus](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## Sissejuhatus

See põhjalik sõnastik annab määratlused Azure Developer CLI ja Azure pilve arenduses kasutatavatele terminitele, mõistetele ja lühenditele. Oluline allikas tehnilise dokumentatsiooni mõistmiseks, vigade lahendamiseks ja tõhusa suhtlemise jaoks azd projektide ja Azure teenuste osas.

## Õpieesmärgid

Selle sõnastiku kasutamisel:
- Mõistad olulisemaid Azure Developer CLI termineid ja mõisteid
- Valdad Azure pilve arenduse sõnavara ja tehnilisi termineid
- Kasutad efektiivselt infrastruktuuri koodi ja juurutusterminitikat
- Saad aru Azure teenuste nimedest, lühenditest ja nende eesmärkidest
- Ligipääs vigade otsimise ja silumise terminite määratlustele
- Õpid edasijõudnuid Azure arhitektuuri ja arenduse mõisteid

## Õpitulemused

Regulaarse viitamisega sellele sõnastikule saad:
- Suhelda tõhusalt, kasutades korrektset Azure Developer CLI terminoloogiat
- Mõista tehnilist dokumentatsiooni ja veateateid selgemalt
- Navigeerida Azure teenuste ja mõistetega kindlalt
- Lahendada probleeme sobiva tehnilise sõnavara abil
- Panustada meeskonna aruteludesse täpse tehnilise keelega
- Laiendada süsteemselt oma Azure pilve arenduse teadmisi

## A

**ARM mall**  
Azure Resource Manageri mall. JSON-põhine infrastruktuuri koodi formaat, mida kasutatakse Azure ressursside deklaratiivseks määratlemiseks ja juurutamiseks.

**App Service**  
Azure platvorm teenusena (PaaS) veebirakenduste, REST API-de ja mobiilitaustade majutamiseks ilma infrastruktuuri haldamata.

**Application Insights**  
Azure rakenduse jõudluse jälgimise (APM) teenus, mis pakub sügavaid teadmisi rakenduse jõudluse, saadavuse ja kasutamise kohta.

**Azure CLI**  
Käsurealiides Azure ressursside haldamiseks. Kasutatakse azd poolt autentimiseks ja mõningate toimingute jaoks.

**Azure Developer CLI (azd)**  
Arendajakeskne käsureatööriist, mis kiirendab rakenduste loomise ja Azure´le juurutamise protsessi, kasutades malle ja infrastruktuuri koodi.

**azure.yaml**  
Põhiline konfiguratsioonifail azd projekti jaoks, mis määratleb teenused, infrastruktuuri ja juurutuse konksud.

**Azure Resource Manager (ARM)**  
Azure juurutus- ja haldusteenus, mis pakub halduskihi ressursside loomiseks, uuendamiseks ja kustutamiseks.

## B

**Bicep**  
Microsofti loodud domeenispetsiifiline keel (DSL) Azure ressursside juurutamiseks. Pakub lihtsamat süntaksit kui ARM mallid, kompileerides ARM-iks.

**Build**  
Allikakoodi kompileerimise, sõltuvuste paigaldamise ja rakenduse juurutuseks ettevalmistamise protsess.

**Blue-Green Deployment**  
Juurutusstrateegia, mis kasutab kahte identselt tootmiskeskkonda (sinine ja roheline) seisakute ja riskide vähendamiseks.

## C

**Container Apps**  
Azure serverita konteineriteenus, mis võimaldab konteinerirakendusi käitada ilma keerukat infrastruktuuri haldamata.

**CI/CD**  
Jooksvalt integreerimine/jooksev juurutamine. Automatiseeritud praktika koodimuudatuste liitmiseks ja rakenduste juurutamiseks.

**Cosmos DB**  
Azure globaalne ja mitmemudeline andmebaasiteenus, mis pakub ulatuslikke teenusetaseme kokkuleppeid (SLA) läbilaskevõime, latentsuse, saadavuse ja järjepidevuse osas.

**Configuration**  
Seaded ja parameetrid, mis kontrollivad rakenduse käitumist ja juurutuse valikuid.

## D

**Deployment**  
Rakenduste ja nende sõltuvuste paigaldamise ja konfigureerimise protsess sihtinfrastruktuuril.

**Docker**  
Platvorm rakenduste arenduseks, tarnimiseks ja käitamiseks konteinertehnoloogiat kasutades.

**Dockerfile**  
Tekstifail, mis sisaldab juhiseid Docker konteineripildi ehitamiseks.

## E

**Environment**  
Juurutuse sihtkoht, mis esindab konkreetset rakenduse instantsi (nt arendus-, eeltootmise või tootmine).

**Environment Variables**  
Konfiguratsiooniväärtused, mis on salvestatud võtme-väärtuse paaridena ja millele rakendused ligi pääsevad jooksutamise ajal.

**Endpoint**  
URL või võrguaadress, kust rakendust või teenust saab kasutada.

## F

**Function App**  
Azure serverita arvutus teenus, mis võimaldab sündmuspõhise koodi käivitamist ilma infrastruktuuri haldamata.

## G

**GitHub Actions**  
CI/CD platvorm, mis on integreeritud GitHub hoidlatega töövoogude automatiseerimiseks.

**Git**  
Hajutatud versioonihaldussüsteem, mida kasutatakse allikakoodi muutuste jälgimiseks.

## H

**Hooks**  
Kohandatud skriptid või käsud, mis jooksevad juurutustsükli kindlatel hetkedel (eelprovisioon, järelprovisioon, eeljuurutus, järeljuurutus).

**Host**  
Azure teenuse tüüp, kus rakendus juurutatakse (nt appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Praktika infrastruktuuri määratlemiseks ja haldamiseks koodi kaudu, mitte käsitsi.

**Init**  
Uue azd projekti algatamise protsess, tavaliselt mallist.

## J

**JSON**  
JavaScripti objektide märgendussüsteem. Andmevahetuse formaat, mida sageli kasutatakse konfiguratsioonifailides ja API vastustes.

**JWT**  
JSON Web Token. Standard turvaliseks info edastamiseks osapoolte vahel JSON objektina.

## K

**Key Vault**  
Azure teenus saladuste, võtmete ja sertifikaatide turvaliseks hoimiseks ja haldamiseks.

**Kusto Query Language (KQL)**  
Päringukeel Azure Monitori, Application Insightsi ja teiste Azure teenuste andmete analüüsimiseks.

## L

**Load Balancer**  
Teenusekomponent, mis jaotab sissetuleva võrguliikluse mitme serveri või instantsi vahel.

**Log Analytics**  
Azure teenus telemeetriandmete kogumiseks, analüüsimiseks ja põhjalikuks käsitlemiseks pilvest ja kohalikest keskkondadest.

## M

**Managed Identity**  
Azure omadus, mis pakub Azure teenustele automaatselt hallatud identiteeti teiste Azure teenustega autentimiseks.

**Microservices**  
Arhitektuuriline lähenemine, kus rakendused koosnevad väikestest, sõltumatutest teenustest.

**Monitor**  
Azure ühtne jälgimislahendus, mis tagab põhjaliku jälgitavuse rakenduste ja infrastruktuuri kõigil tasanditel.

## N

**Node.js**  
JavaScripti töötluskeskkond, mis põhineb Chrome V8 mootoril ja sobib serveripoolsete rakenduste loomiseks.

**npm**  
Node.js pakettide haldur, mis haldab sõltuvusi ja pakette.

## O

**Output**  
Väärtused, mis tagastatakse infrastruktuuri juurutusest ja mida saab kasutada rakendused või muud ressursid.

## P

**Package**  
Rakenduse koodi ja sõltuvuste juurutuseks ettevalmistamise protsess.

**Parameters**  
Sisendväärtused, mida antakse infrastruktuuri mallidele juurutuste kohandamiseks.

**PostgreSQL**  
Avatud lähtekoodiga relatsioonandmebaasisüsteem, mida Azure toetab hallatud teenusena.

**Provisioning**  
Azure ressursside loomise ja konfigureerimise protsess, mis on määratletud infrastruktuuri mallides.

## Q

**Quota**  
Piirangud ressursside loomise mahule Azure tellimuse või piirkonna piires.

## R

**Resource Group**  
Loogiline konteiner Azure ressurssidele, mis jagavad sama elutsüklit, õiguseid ja poliitikaid.

**Resource Token**  
Ainulaadne string, mille genereerib azd ressursside nimede ainulaadsuse tagamiseks juurutuste vahel.

**REST API**  
Võrgurakenduste arhitektuuristiil, mis kasutab HTTP meetodeid.

**Rollback**  
Rakenduse või infrastruktuuri konfiguratsiooni varasema versiooni taastamise protsess.

## S

**Service**  
Sinu rakenduse komponent, mis on määratletud azure.yaml failis (nt veebiliides, API taust, andmebaas).

**SKU**  
Stock Keeping Unit. Azure ressursside teenustaseme või jõudlustaseme nüanss.

**SQL Database**  
Azure hallatud relatsioonandmebaasi teenus, mis põhineb Microsoft SQL Serveril.

**Static Web Apps**  
Azure teenus täisvirna veebirakenduste loomiseks ja juurutamiseks lähtekoodihaldusteenustest.

**Storage Account**  
Azure teenus, mis pakub pilvesalvestust andmeobjektidele nagu blobid, failid, järjekorrad ja tabelid.

**Subscription**  
Azure konto konteiner, mis sisaldab ressursside gruppe ja ressursse koos arvelduse ja juurdepääsuhaldusega.

## T

**Template**  
Eelmääratletud projekti struktuur, mis sisaldab rakenduse koodi, infrastruktuuri määratlusi ja konfiguratsiooni tüüpilisteks stsenaariumiteks.

**Terraform**  
Avatud lähtekoodiga infrastruktuuri koodi tööriist, mis toetab mitut pilveteenuse pakkujat, sealhulgas Azure.

**Traffic Manager**  
Azure DNS-põhine koormuse tasakaalustaja, mis jaotab liiklust üle globaalsete Azure piirkondade.

## U

**URI**  
Uniform Resource Identifier. String, mis identifitseerib konkreetset ressurssi.

**URL**  
Uniform Resource Locator. URI tüüp, mis määrab ressursi asukoha ja leidmise viisi.

## V

**Virtual Network (VNet)**  
Azure privaatvõrkude põhielement, mis pakub isolatsiooni ja segmentatsiooni.

**VS Code**  
Visual Studio Code. Populaarne koodiredaktor, millel on suurepärane Azure ja azd integratsioon.

## W

**Webhook**  
HTTP tagasikõne, mis käivitatakse kindlate sündmuste puhul ja mida sageli kasutatakse CI/CD torudes.

**What-if**  
Azure funktsioon, mis näitab, milliseid muudatusi juurutus teeks, ilma et seda tegelikult täidaks.

## Y

**YAML**  
YAML ei ole märgendikeel. Inimloetav andmeseriaalimise standard, mida kasutatakse konfiguratsioonifailides nagu azure.yaml.

## Z

**Zone**  
Füüsiliselt eraldatud asukohad Azure piirkonnas, mis tagavad redundantsuse ja kõrge kättesaadavuse.

---

## Levinumad lühendid

| Lühend | Täisvorm | Kirjeldus |
|---------|-----------|-------------|
| AAD | Azure Active Directory (nüüdsest Microsoft Entra ID) | Identiteedi- ja juurdepääsuhalduse teenus |
| ACR | Azure Container Registry | Konteineripiltide registriteenus |
| AKS | Azure Kubernetes Service | Hallatud Kubernetes teenus |
| API | Application Programming Interface | Tarkvaraehituse protokollide komplekt |
| ARM | Azure Resource Manager | Azure juurutus- ja haldusteenus |
| CDN | Content Delivery Network | Hajutatud serverite võrk |
| CI/CD | Continuous Integration/Continuous Deployment | Automatiseeritud arendustavad |
| CLI | Command Line Interface | Tekstipõhine kasutajaliides |
| DNS | Domain Name System | Domeeninimede IP aadressideks tõlkimise süsteem |
| HTTPS | Hypertext Transfer Protocol Secure | HTTP turvaline versioon |
| IaC | Infrastructure as Code | Infrastruktuuri haldamine koodi abil |
| JSON | JavaScript Object Notation | Andmevahetuse formaat |
| JWT | JSON Web Token | Tokeni formaat turvaliseks infosideks |
| KQL | Kusto Query Language | Azure andmeteenuste päringukeel |
| RBAC | Role-Based Access Control | Rollipõhine ligipääsukontrollimeetod |
| REST | Representational State Transfer | Veebiteenuste arhitektuuristiil |
| SDK | Software Development Kit | Arendustööriistade komplekt |
| SLA | Service Level Agreement | Lepitus teenuse saadavusele ja jõudlusele |
| SQL | Structured Query Language | Relatsioonandmebaaside halduskieli keel |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Krüptograafilised protokollid |
| URI | Uniform Resource Identifier | Ressursi identifitseeriv string |
| URL | Uniform Resource Locator | URI tüüp ressursi asukoha määramiseks |
| VM | Virtual Machine | Arvutisüsteemi emulatsioon |
| VNet | Virtual Network | Azure privaatvõrk |
| YAML | YAML ei ole märgendikeel | Andmeseriaalimise standard |

---

## Azure teenuste nimede vasted

| Levinud nimi | Azure ametlik teenuse nimi | azd Host tüüp |
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

## Kontekstispetsiifilised terminid

### Arenduse terminid
- **Hot Reload**: Rakenduste automaatne värskendamine arendamise ajal ilma taaskäivitamiseta
- **Build Pipeline**: Automatiseeritud protsess koodi ehitamiseks ja testimiseks
- **Deployment Slot**: Eeltootmiskeskkond App Service’is
- **Environment Parity**: Arendus-, eeltootmise ja tootmiskeskkondade sarnasus

### Turvalisuse terminid
- **Managed Identity**: Azure omadus, mis tagab automaatse tunnustushaldamise
- **Key Vault**: Saladuste, võtmete ja sertifikaatide turvaline hoiustamine
- **RBAC**: Rollipõhine ligipääsukontroll Azure ressurssidele
- **Network Security Group**: Virtuaalne tulemüür võrguliikluse kontrollimiseks

### Jälgimise terminid
- **Telemetry**: Mõõtmiste ja andmete automatiseeritud kogumine
- **Application Performance Monitoring (APM)**: Tarkvara jõudluse jälgimine
- **Log Analytics**: Teenus logiandmete kogumiseks ja analüüsimiseks
- **Alert Rules**: Automatiseeritud teavitused põhinedes mõõdikutel või tingimustel

### Juurutusterminid
- **Blue-Green Deployment**: Seisakuta juurutusstrateegia
- **Canary Deployment**: Juurutuse järkjärguline avamine väiksele kasutajate grupile
- **Rolling Update**: Rakenduse instantside järkjärguline asendamine
- **Rollback**: Eelmise rakendusversiooni taastamine

---

**Kasutusnõuanne**: Kasuta `Ctrl+F`, et kiiresti otsida sõnastiku konkreetseid termineid. Terminite vahel on vajadusel ristviited.

---

**Navigeerimine**
- **Eelmine õppetükk**: [Kiirjuhend](cheat-sheet.md)
- **Järgmine õppetükk**: [KKK](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->