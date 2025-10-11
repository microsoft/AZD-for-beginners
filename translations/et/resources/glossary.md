<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "f16d2988a24670d1b6aa2372de1a231a",
  "translation_date": "2025-10-11T15:49:20+00:00",
  "source_file": "resources/glossary.md",
  "language_code": "et"
}
-->
# Sõnastik - Azure ja AZD terminoloogia

**Viide kõigile peatükkidele**
- **📚 Kursuse avaleht**: [AZD algajatele](../README.md)
- **📖 Õpi põhitõdesid**: [Peatükk 1: AZD põhitõed](../docs/getting-started/azd-basics.md)
- **🤖 AI terminid**: [Peatükk 2: AI-põhine arendus](../docs/ai-foundry/azure-ai-foundry-integration.md)

## Sissejuhatus

See põhjalik sõnastik sisaldab definitsioone terminitele, kontseptsioonidele ja lühenditele, mida kasutatakse Azure Developer CLI-s ja Azure'i pilvearenduses. Oluline viide tehnilise dokumentatsiooni mõistmiseks, probleemide lahendamiseks ja tõhusaks suhtlemiseks azd projektide ja Azure'i teenuste kohta.

## Õpieesmärgid

Sõnastikku kasutades õpid:
- Mõistma Azure Developer CLI olulisi termineid ja kontseptsioone
- Valdama Azure'i pilvearenduse sõnavara ja tehnilisi termineid
- Viitama tõhusalt infrastruktuuri kui koodi ja juurutamise terminoloogiale
- Mõistma Azure'i teenuste nimesid, lühendeid ja nende eesmärke
- Juurdepääsu definitsioonidele probleemide lahendamiseks ja silumiseks
- Õppima edasijõudnud Azure'i arhitektuuri ja arenduse kontseptsioone

## Õpitulemused

Sõnastikku regulaarselt viidates suudad:
- Suhelda tõhusalt, kasutades korrektset Azure Developer CLI terminoloogiat
- Mõista tehnilist dokumentatsiooni ja veateateid selgemalt
- Navigeerida Azure'i teenustes ja kontseptsioonides enesekindlalt
- Lahendada probleeme, kasutades sobivat tehnilist sõnavara
- Panustada meeskonna aruteludesse täpse tehnilise keele abil
- Süstemaatiliselt laiendada oma teadmisi Azure'i pilvearendusest

## A

**ARM Template**  
Azure Resource Manageri mall. JSON-põhine infrastruktuuri kui koodi formaat, mida kasutatakse Azure'i ressursside deklaratiivseks määratlemiseks ja juurutamiseks.

**App Service**  
Azure'i platvorm-teenus (PaaS) veebirakenduste, REST API-de ja mobiilsete taustsüsteemide majutamiseks ilma infrastruktuuri haldamata.

**Application Insights**  
Azure'i rakenduse jõudluse jälgimise (APM) teenus, mis pakub sügavaid teadmisi rakenduse jõudluse, kättesaadavuse ja kasutuse kohta.

**Azure CLI**  
Käsurealiides Azure'i ressursside haldamiseks. Kasutatakse azd-s autentimiseks ja mõnede toimingute jaoks.

**Azure Developer CLI (azd)**  
Arendajakeskne käsurea tööriist, mis kiirendab rakenduste loomise ja juurutamise protsessi Azure'i abil, kasutades malle ja infrastruktuuri kui koodi.

**azure.yaml**  
azd projekti peamine konfiguratsioonifail, mis määratleb teenused, infrastruktuuri ja juurutamise konksud.

**Azure Resource Manager (ARM)**  
Azure'i juurutamise ja haldamise teenus, mis pakub halduskihi ressursside loomiseks, uuendamiseks ja kustutamiseks.

## B

**Bicep**  
Microsofti poolt välja töötatud domeenispetsiifiline keel (DSL) Azure'i ressursside juurutamiseks. Pakub lihtsamat süntaksit kui ARM mallid, kompileerides ARM-iks.

**Build**  
Lähtekoodi kompileerimise, sõltuvuste installimise ja rakenduste juurutamiseks ettevalmistamise protsess.

**Blue-Green Deployment**  
Juurutamisstrateegia, mis kasutab kahte identset tootmiskeskkonda (sinine ja roheline), et vähendada seisakuid ja riske.

## C

**Container Apps**  
Azure'i serverivaba konteineriteenus, mis võimaldab konteineriseeritud rakendusi käitada ilma keerulist infrastruktuuri haldamata.

**CI/CD**  
Pidev integreerimine/pidev juurutamine. Automatiseeritud tavad koodimuudatuste integreerimiseks ja rakenduste juurutamiseks.

**Cosmos DB**  
Azure'i globaalselt jaotatud, mitmemudeliline andmebaasiteenus, mis pakub ulatuslikke SLA-sid läbilaskevõime, latentsuse, kättesaadavuse ja järjepidevuse jaoks.

**Configuration**  
Seaded ja parameetrid, mis kontrollivad rakenduse käitumist ja juurutamise valikuid.

## D

**Deployment**  
Rakenduste ja nende sõltuvuste installimise ja konfigureerimise protsess sihtinfrastruktuuril.

**Docker**  
Platvorm rakenduste arendamiseks, tarnimiseks ja käitamiseks, kasutades konteineritehnoloogiat.

**Dockerfile**  
Tekstifail, mis sisaldab juhiseid Docker konteineripildi loomiseks.

## E

**Environment**  
Juurutamise sihtkoht, mis esindab rakenduse konkreetset eksemplari (nt arendus, testimine, tootmine).

**Environment Variables**  
Konfiguratsiooniväärtused, mis on salvestatud võtme-väärtuse paaridena ja millele rakendused saavad käitamise ajal juurde pääseda.

**Endpoint**  
URL või võrgu aadress, kus rakendust või teenust saab kasutada.

## F

**Function App**  
Azure'i serverivaba arvutusteenus, mis võimaldab sündmustepõhist koodi käitada ilma infrastruktuuri haldamata.

## G

**GitHub Actions**  
CI/CD platvorm, mis on integreeritud GitHubi repositooriumidega töövoogude automatiseerimiseks.

**Git**  
Hajutatud versioonihaldussüsteem, mida kasutatakse lähtekoodi muudatuste jälgimiseks.

## H

**Hooks**  
Kohandatud skriptid või käsud, mis käivitatakse juurutamise elutsükli kindlates punktides (nt preprovision, postprovision, predeploy, postdeploy).

**Host**  
Azure'i teenuse tüüp, kuhu rakendus juurutatakse (nt appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Tava infrastruktuuri määratlemiseks ja haldamiseks koodi kaudu, mitte käsitsi protsesside abil.

**Init**  
Uue azd projekti initsialiseerimise protsess, tavaliselt mallist.

## J

**JSON**  
JavaScripti objektide märgistus. Andmevahetusformaat, mida kasutatakse sageli konfiguratsioonifailides ja API vastustes.

**JWT**  
JSON veebitoken. Standard teabe turvaliseks edastamiseks osapoolte vahel JSON objektina.

## K

**Key Vault**  
Azure'i teenus, mis võimaldab turvaliselt salvestada ja hallata paroole, võtmeid ja sertifikaate.

**Kusto Query Language (KQL)**  
Päringukeel, mida kasutatakse andmete analüüsimiseks Azure Monitoris, Application Insightsis ja teistes Azure'i teenustes.

## L

**Load Balancer**  
Teenuse liikluse jaotamine mitme serveri või eksemplari vahel.

**Log Analytics**  
Azure'i teenus pilve- ja kohapealsete keskkondade telemeetriaandmete kogumiseks, analüüsimiseks ja nende põhjal tegutsemiseks.

## M

**Managed Identity**  
Azure'i funktsioon, mis pakub Azure'i teenustele automaatselt hallatud identiteeti autentimiseks teiste Azure'i teenuste vastu.

**Microservices**  
Arhitektuuriline lähenemine, kus rakendused ehitatakse väikeste, sõltumatute teenuste kogumina.

**Monitor**  
Azure'i ühtne jälgimislahendus, mis pakub täisvaadet rakenduste ja infrastruktuuri kohta.

## N

**Node.js**  
JavaScripti käituskeskkond, mis põhineb Chrome'i V8 JavaScripti mootoril serveripoolsete rakenduste loomiseks.

**npm**  
Node.js-i paketihaldur, mis haldab sõltuvusi ja pakette.

## O

**Output**  
Väärtused, mis tagastatakse infrastruktuuri juurutamisest ja mida rakendused või muud ressursid saavad kasutada.

## P

**Package**  
Rakenduse koodi ja sõltuvuste juurutamiseks ettevalmistamise protsess.

**Parameters**  
Sisendväärtused, mis edastatakse infrastruktuuri mallidele juurutuste kohandamiseks.

**PostgreSQL**  
Avatud lähtekoodiga relatsiooniline andmebaasisüsteem, mida toetatakse Azure'is hallatud teenusena.

**Provisioning**  
Azure'i ressursside loomise ja konfigureerimise protsess, mis on määratletud infrastruktuuri mallides.

## Q

**Quota**  
Piirangud ressursside kogusele, mida saab Azure'i tellimuses või piirkonnas luua.

## R

**Resource Group**  
Loogiline konteiner Azure'i ressurssidele, millel on sama elutsükkel, õigused ja poliitikad.

**Resource Token**  
Unikaalne string, mille azd genereerib, et tagada ressursside nimede unikaalsus juurutuste vahel.

**REST API**  
Arhitektuuristiil võrgurakenduste kujundamiseks, kasutades HTTP meetodeid.

**Rollback**  
Protsess rakenduse või infrastruktuuri konfiguratsiooni eelmise versiooni taastamiseks.

## S

**Service**  
Komponent rakendusest, mis on määratletud azure.yaml failis (nt veebiesiosa, API taustsüsteem, andmebaas).

**SKU**  
Kaubaartikli kood. Esindab erinevaid teenusetasemeid või jõudlusastmeid Azure'i ressursside jaoks.

**SQL Database**  
Azure'i hallatud relatsiooniline andmebaasiteenus, mis põhineb Microsoft SQL Serveril.

**Static Web Apps**  
Azure'i teenus täisfunktsionaalsete veebirakenduste loomiseks ja juurutamiseks lähtekoodi repositooriumitest.

**Storage Account**  
Azure'i teenus, mis pakub pilvesalvestust andmeobjektidele, sealhulgas blobidele, failidele, järjekordadele ja tabelitele.

**Subscription**  
Azure'i konto konteiner, mis sisaldab ressursigruppe ja ressursse, koos seotud arvelduse ja juurdepääsuhaldusega.

## T

**Template**  
Eelnevalt loodud projekti struktuur, mis sisaldab rakenduse koodi, infrastruktuuri määratlusi ja konfiguratsiooni tavalisteks stsenaariumideks.

**Terraform**  
Avatud lähtekoodiga infrastruktuuri kui koodi tööriist, mis toetab mitmeid pilveteenuse pakkujaid, sealhulgas Azure'i.

**Traffic Manager**  
Azure'i DNS-põhine liikluse koormuse tasakaalustaja, mis jaotab liiklust üle globaalsete Azure'i piirkondade.

## U

**URI**  
Ühtne ressursi identifikaator. String, mis identifitseerib konkreetset ressurssi.

**URL**  
Ühtne ressursi asukoht. URI tüüp, mis määrab, kus ressurss asub ja kuidas seda hankida.

## V

**Virtual Network (VNet)**  
Privaatvõrkude põhiline ehituskivi Azure'is, mis pakub isolatsiooni ja segmentatsiooni.

**VS Code**  
Visual Studio Code. Populaarne koodiredaktor, millel on suurepärane Azure'i ja azd integratsioon.

## W

**Webhook**  
HTTP tagasiside, mis käivitatakse konkreetsete sündmuste korral, sageli CI/CD torujuhtmetes.

**What-if**  
Azure'i funktsioon, mis näitab, milliseid muudatusi juurutamine teeks, ilma et see tegelikult käivituks.

## Y

**YAML**  
YAML Ain't Markup Language. Inimloetav andmete serialiseerimise standard, mida kasutatakse konfiguratsioonifailides nagu azure.yaml.

## Z

**Zone**  
Füüsiliselt eraldatud asukohad Azure'i piirkonnas, mis pakuvad redundantsust ja kõrget kättesaadavust.

---

## Levinud lühendid

| Lühend | Täisnimi | Kirjeldus |
|--------|----------|-----------|
| AAD | Azure Active Directory | Identiteedi ja juurdepääsu haldamise teenus |
| ACR | Azure Container Registry | Konteineripiltide registriteenus |
| AKS | Azure Kubernetes Service | Hallatud Kubernetes teenus |
| API | Application Programming Interface | Protokollide kogum tarkvara loomiseks |
| ARM | Azure Resource Manager | Azure'i juurutamise ja haldamise teenus |
| CDN | Content Delivery Network | Jaotatud serverite võrk |
| CI/CD | Continuous Integration/Continuous Deployment | Automatiseeritud arendustavad |
| CLI | Command Line Interface | Tekstipõhine kasutajaliides |
| DNS | Domain Name System | Süsteem domeeninimede IP-aadressideks tõlkimiseks |
| HTTPS | Hypertext Transfer Protocol Secure | HTTP turvaline versioon |
| IaC | Infrastructure as Code | Infrastruktuuri haldamine koodi kaudu |
| JSON | JavaScript Object Notation | Andmevahetusformaat |
| JWT | JSON Web Token | Tokeniformaat turvaliseks teabe edastamiseks |
| KQL | Kusto Query Language | Päringukeel Azure'i andmeteenuste jaoks |
| RBAC | Role-Based Access Control | Juurdepääsukontrolli meetod, mis põhineb kasutajarollidel |
| REST | Representational State Transfer | Arhitektuuristiil veebiteenuste jaoks |
| SDK | Software Development Kit | Arendustööriistade kogum |
| SLA | Service Level Agreement | Kohustus teenuse kättesaadavuse/jõudluse osas |
| SQL | Structured Query Language | Relatsiooniliste andmebaaside haldamise keel |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Krüptograafilised protokollid |
| URI | Uniform Resource Identifier | String, mis identifitseerib ressurssi |
| URL | Uniform Resource Locator | URI tüüp, mis määrab ressursi asukoha |
| VM | Virtual Machine | Arvutisüsteemi emulatsioon |
| VNet | Virtual Network | Privaatvõrk Azure'is |
| YAML | YAML Ain't Markup Language | Andmete serialiseerimise standard |

---

## Azure'i teenuste nimede vastavused

| Üldnimetus | Ametlik Azure'i teenuse nimi | azd Host tüüp |
|------------|------------------------------|---------------|
| Veebirakendus | Azure App Service | `appservice` |
| API rakendus | Azure App Service | `appservice` |
| Konteinerirakendus | Azure Container Apps | `containerapp` |
| Funktsioon | Azure Functions | `function` |
| Staatiline sait | Azure Static Web Apps | `staticwebapp` |
| Andmebaas | Azure Database for PostgreSQL | `postgres` |
| NoSQL andmebaas | Azure Cosmos DB | `cosmosdb` |
| Salvestus | Azure Storage Account | `storage` |
| Vahemälu | Azure Cache for Redis | `redis` |
| Otsing | Azure Cognitive Search | `search` |
| Sõnumivahetus | Azure Service Bus | `servicebus` |

---

## Kontekstispetsiifilised terminid

### Arendusterminid
- **Hot Reload**: Rakenduste automaatne uuendamine arenduse ajal ilma taaskäivitamiseta
- **Build Pipeline**: Automatiseeritud protsess koodi ehitamiseks ja testimiseks
- **Deployment Slot**: Staging-keskkond App Service'is
- **Environment Parity**: Arendus-, testimis- ja tootmiskeskkondade sarnasus

### Turvalisuse terminid
- **Managed Identity**: Azure'i funktsioon, mis pakub automaatset mandaadihaldust
- **Key Vault**: Turvaline salvestuskoht paroolide, võtmete ja sertifikaatide jaoks
- **RBAC**: Rollipõhine juurdepääsukontroll Azure'i ressurssidele
- **Network Security Group**: Virtuaalne tulemüür võrgu liikluse kontrollimiseks

### Jälgimise terminid
- **Telemetry**: Automaatne mõõtmiste ja andmete kogumine
- **Application Performance Monitoring (APM)**: Tarkvara jõudluse jälgimine
- **Log Analytics**: Teenus logiandmete kogumiseks ja analüüsimiseks
- **Alert Rules**: Automaatne teavitamine metrikate või tingimuste alusel

### Juurutamise terminid
- **Blue-Green Deployment**: Nullseisakuga juurutamise strateegia
- **Canary Deployment**: Järk-järguline juurutamine kasutajate alamhulgale
- **Rolling Update**: Rakenduse eksemplaride järkjärguline asendamine
- **Rollback**: Rakenduse eelmise versiooni taastamine

---

**Kasutusnipp**: Kasuta `Ctrl+F`, et kiiresti otsida konkreetseid termineid sellest sõnastikust. Terminid on ristviidatud, kus see on asjakohane.

---

**Navigeerimine**
- **Eelmine õppetund**: [Spikri leht](cheat-sheet.md)
- **Järgmine õppetund**: [KKK](faq.md)

---

**Lahtiütlus**:  
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame tagada täpsust, palume arvestada, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Algne dokument selle algses keeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitame kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste või valesti tõlgenduste eest.