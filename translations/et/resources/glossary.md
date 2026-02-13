# Sõnastik - Azure ja AZD Terminoloogia

**Viide Kõigile Peatükkidele**
- **📚 Kursuse Avaleht**: [AZD Algajatele](../README.md)
- **📖 Õpi Põhitõed**: [1. Peatükk: AZD Põhitõed](../docs/getting-started/azd-basics.md)
- **🤖 tehisintellekti Terminid**: [2. Peatükk: AI-Esimene Arendus](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## Sissejuhatus

See põhjalik sõnastik annab definitsioonid Azure Developer CLI ja Azure pilve arenduses kasutatavatele terminitele, kontseptsioonidele ja lühenditele. Oluline abimees tehnilise dokumentatsiooni mõistmiseks, probleemide lahendamiseks ja tõhusa suhtluse tagamiseks azd projektide ja Azure teenustega.

## Õpieesmärgid

Selle sõnastiku kasutamisega:
- Mõistad Azure Developer CLI olulisi termineid ja kontseptsioone
- Omandad Azure pilve arenduse sõnavara ja tehnilisi termineid
- Kasutad tõhusalt infrastruktuuri koodi ja levitamise termineid
- Mõistad Azure teenuste nimesid, lühendeid ja nende eesmärke
- Saad juurdepääsu vigade otsimise ja tõrkeotsingu terminitele
- Õpid edasiarenenud Azure arhitektuuri ja arenduse kontseptsioone

## Õpitulemused

Regulaarse viitamisega sellele sõnastikule suudad:
- Suhelda tõhusalt õigete Azure Developer CLI terminitega
- Mõista tehnilist dokumentatsiooni ja veateateid selgemalt
- Navigeerida Azure teenustes ja kontseptsioonides kindlalt
- Lahendada probleeme sobiva tehnilise sõnavaraga
- Panustada meeskonnadiskussioonidesse täpse tehnilise keelega
- Laiendada oma Azure pilve arenduse teadmisi süsteemselt

## A

**ARM Mall**  
Azure Resource Manager mall. JSON-põhine infrastruktuuri koodi formaat, mida kasutatakse Azure ressursside määratlemiseks ja levitamiseks deklaratiivselt.

**App Service**  
Azure platvormi-teenus (PaaS), mis võimaldab majutada veebirakendusi, REST API-sid ja mobiilitaustasid ilma infrastruktuuri haldamata.

**Application Insights**  
Azure rakenduse jõudluse jälgimise (APM) teenus, mis annab põhjaliku ülevaate rakenduse jõudlusest, kättesaadavusest ja kasutusest.

**Azure CLI**  
Käsurealiides Azure ressursside haldamiseks. Kasutab azd autentimiseks ja mõnede toimingute tegemiseks.

**Azure Developer CLI (azd)**  
Arendajale suunatud käsurea tööriist, mis kiirendab rakenduste loomise ja Azure'isse levitamise protsessi mallide ja infrastruktuuri koodi abil.

**azure.yaml**  
Azur CLI projekti põhikonfiguratsioonifail, mis määratleb teenused, infrastruktuuri ja levitamise konksud.

**Azure Resource Manager (ARM)**  
Azure levitamise ja haldamise teenus, mis pakub halduskihti ressursside loomisel, uuendamisel ja kustutamisel.

## B

**Bicep**  
Microsofti välja töötatud domeenispetsiifiline keel (DSL) Azure ressursside levitamiseks. Pakub lihtsamat süntaksit kui ARM mallid, kompileerides ARM-i mallideks.

**Build**  
Protsess, mille käigus kompileeritakse lähtekood, paigaldatakse sõltuvused ja valmistatakse rakendused levitamiseks ette.

**Blue-Green Deployment**  
Levitamisstrateegia, kus kasutatakse kahte identsest tootmiskeskkonda (sinine ja roheline) seisakute ja riskide minimeerimiseks.

## C

**Container Apps**  
Azure serverita konteineriteenus, mis võimaldab käivitada konteineriseeritud rakendusi ilma keeruka infrastruktuuri haldamata.

**CI/CD**  
Jätkuv integreerimine/jätkuv levitamine. Automatiseeritud tööd koodimuudatuste integreerimiseks ja rakenduste juurutamiseks.

**Cosmos DB**  
Azure globaalne ja mitmemudeliline andmebaasi teenus, mis pakub ulatuslikke teenustaseme kokkuleppeid läbivoolu, latentsuse, kättesaadavuse ja järjepidevuse osas.

**Configuration**  
Seaded ja parameetrid, mis juhivad rakenduse käitumist ja levitamise valikuid.

## D

**Deployment**  
Protsess, mille käigus installeeritakse ja konfigureeritakse rakendused ja nende sõltuvused sihtinfrastruktuuril.

**Docker**  
Platvorm rakenduste arendamiseks, saatmiseks ja käitamiseks konteineritehnoloogia abil.

**Dockerfile**  
Tekstifail, mis sisaldab juhiseid Docker konteineripildi ehitamiseks.

## E

**Environment**  
Levitamise sihtkoht, mis esindab kindlat rakenduse eksemplari (nt arendus, testimine, tootmine).

**Keskkonnamuutujad**  
Konfiguratsiooniväärtused, mis talletatakse võtme-väärtuse paaridena ja millele rakendused saavad jooksvalt juurde pääseda.

**Endpoint**  
URL või võrguaadress, kust rakendust või teenust saab kasutada.

## F

**Function App**  
Azure serverita arvutuseenus, mis võimaldab käivitada sündmuspõhist koodi ilma infrastruktuuri haldamata.

## G

**GitHub Actions**  
CI/CD platvorm integreeritud GitHubi hoidlate automatiseeritud töövoogude jaoks.

**Git**  
Hajutatud versioonihaldussüsteem, mida kasutatakse lähtekoodi muudatuste jälgimiseks.

## H

**Hooks**  
Kohandatud skriptid või käsud, mis käivitatakse levitustsükli kindlates punktides (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Azure teenuse tüüp, kuhu rakendus paigaldatakse (nt appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Tava kirjeldada ja hallata infrastruktuuri koodi kaudu käsitsi tehtud protsesside asemel.

**Init**  
Uue azd projekti algatamise protsess, tavaliselt mallist lähtudes.

## J

**JSON**  
JavaScript Object Notation. Andmevahetuse formaat, mida sageli kasutatakse konfiguratsioonifailides ja API vastustes.

**JWT**  
JSON Web Token. Standard turvaliseks info edastamiseks osapoolte vahel JSON objektina.

## K

**Key Vault**  
Azure teenus saladuste, võtmete ja sertifikaatide turvaliseks hoidmiseks ja haldamiseks.

**Kusto Query Language (KQL)**  
Päringukeel Azure Monitori, Application Insightsi ja teiste Azure teenuste andmete analüüsimiseks.

## L

**Load Balancer**  
Teenust, mis jaotab sissetuleva võrguliikluse mitme serveri või instantsi vahel.

**Log Analytics**  
Azure teenus pilve- ja kohapealse telemeetria andmete kogumiseks, analüüsimiseks ja toimimiseks.

## M

**Managed Identity**  
Azure funktsioon, mis annab Azure teenustele automaatselt hallatava identiteedi autentimiseks teiste Azure teenustega.

**Mikroteenused**  
Arhitektuuri lähenemine, kus rakendused ehitatakse väikeste, iseseisvate teenuste kogumikena.

**Monitor**  
Azure ühtne jälgimislahendus, mis pakub täielikku nähtavust rakenduste ja infrastruktuuri kohta.

## N

**Node.js**  
JavaScripti käitus keskkond, mis põhineb Chrome V8 mootoril, serveripoolsete rakenduste loomiseks.

**npm**  
Node.js pakettide haldur, mis haldab sõltuvusi ja pakette.

## O

**Output**  
Väärtused, mis tagastatakse infrastruktuuri levitamise tulemusena ja mida saab kasutada rakenduste või teiste ressursside poolt.

## P

**Package**  
Protsess, mille käigus valmistatakse rakenduse kood ja sõltuvused levitamiseks ette.

**Parameetrid**  
Sisendväärtused, mida antakse infrastruktuuri mallidele levitamise kohandamiseks.

**PostgreSQL**  
Avatud lähtekoodiga relatsioonandmebaasisüsteem, mida toetatakse hallatud teenusena Azure'is.

**Provisioning**  
Protsess, mille käigus luuakse ja konfigureeritakse infrastruktuuri mallides määratletud Azure ressursid.

## Q

**Quota**  
Piirangud ressursside loomisele Azure tellimuses või piirkonnas.

## R

**Resource Group**  
Loogiline konteiner Azure ressursside jaoks, mis jagavad sama elutsüklit, õigusi ja poliitikaid.

**Resource Token**  
Unique string genereeritud azd poolt, et tagada ressursside nimede unikaalsus levituste vahel.

**REST API**  
Võrgurakenduste arhitektuuristiil, mis kasutab HTTP meetodeid.

**Rollback**  
Protsess, mille käigus naaseb rakendus või infrastruktuuri konfiguratsioon eelmisele versioonile.

## S

**Service**  
Komponent sinu rakendusest, mis on määratletud azure.yaml failis (nt veebiliides, API taust, andmebaas).

**SKU**  
Tooteühiku tüüp. Esindab erinevaid teenustasusid või jõudlustaset Azure ressurssidel.

**SQL Database**  
Azure hallatud relatsioonandmebaasi teenus, mis põhineb Microsoft SQL Serveril.

**Static Web Apps**  
Azure teenus täispikas veebirakenduste loomiseks ja juurutamiseks lähtekoodi hoidlatest.

**Storage Account**  
Azure teenus pilvesalvestuse pakkumiseks andmeobjektidele, sealhulgas blobid, failid, järjekorrad ja tabelid.

**Subscription**  
Azure konto konteiner, mis hoiab ressursside gruppe ja ressursse, koos arvelduse ja ligipääsuhaldusega.

## T

**Template**  
Eelnevalt ehitatud projektistruktuur, mis sisaldab rakenduse koodi, infrastruktuuri määratlusi ja konfiguratsiooni levinud olukordade jaoks.

**Terraform**  
Avatud lähtekoodiga Infrastructure as Code tööriist, mis toetab mitut pilveteenuse pakkujat, sh Azure.

**Traffic Manager**  
Azure DNS-põhine liikluse koormusjaotur, mis suunab liiklust üle globaalse Azure piirkondade.

## U

**URI**  
Uniform Resource Identifier. String, mis identifitseerib kindla ressursi.

**URL**  
Uniform Resource Locator. URI tüüp, mis määrab, kus ressurss asub ja kuidas sellele ligi pääseda.

## V

**Virtual Network (VNet)**  
Azure privaatvõrkude põhiline ehitusplokk, mis pakub isolatsiooni ja segmentatsiooni.

**VS Code**  
Visual Studio Code. Populaarne koodiredaktor, millel on suurepärane integratsioon Azure ja azd-ga.

## W

**Webhook**  
HTTP tagasikutse, mida vallandavad kindlad sündmused, sageli kasutatav CI/CD torustikes.

**What-if**  
Azure funktsioon, mis näitab, milliseid muudatusi levitamine teeks ilma seda tegelikult läbiviimata.

## Y

**YAML**  
YAML ei ole märkimiskeel. Inimesele loetav andmete serialiseerimise standard, mida kasutatakse konfiguratsioonifailides nagu azure.yaml.

## Z

**Zone**  
Füüsiliselt eraldiseisvad asukohad Azure regioonis, mis tagavad lühiajalise rikke korral ülekoormuse ja kõrge kättesaadavuse.

---

## Levinumad Lühendid

| Lühend | Täisvorm | Kirjeldus |
|---------|-----------|-------------|
| AAD | Azure Active Directory | Identiteedi ja ligipääsu haldamise teenus |
| ACR | Azure Container Registry | Konteineripiltide registriteenus |
| AKS | Azure Kubernetes Service | Hallatud Kubernetes teenus |
| API | Application Programming Interface | Tarkvara loomise protokollide komplekt |
| ARM | Azure Resource Manager | Azure levitamise ja haldamise teenus |
| CDN | Content Delivery Network | Hajutatud serverite võrk |
| CI/CD | Continuous Integration/Continuous Deployment | Automatiseeritud arenduspraktikad |
| CLI | Command Line Interface | Tekstipõhine kasutajaliides |
| DNS | Domain Name System | Süsteem domeeninimede tõlkimiseks IP-aadressideks |
| HTTPS | Hypertext Transfer Protocol Secure | Turvaline HTTP versioon |
| IaC | Infrastructure as Code | Infrastruktuuri haldamine koodi kaudu |
| JSON | JavaScript Object Notation | Andmevahetuse formaat |
| JWT | JSON Web Token | Token teabe turvaliseks edastamiseks |
| KQL | Kusto Query Language | Azure andmeteenuste päringukeel |
| RBAC | Role-Based Access Control | Juurdepääsu kontroll kasutajarollide alusel |
| REST | Representational State Transfer | veebiteenuste arhitektuuristiil |
| SDK | Software Development Kit | Arendustööriistade komplekt |
| SLA | Service Level Agreement | Teenuse kättesaadavuse ja jõudluse kokkulepe |
| SQL | Structured Query Language | Relatsioonandmebaaside haldamise keel |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Krüptograafilised protokollid |
| URI | Uniform Resource Identifier | Ressursi identifitseeriv string |
| URL | Uniform Resource Locator | URI tüüp, mis määrab ressursi asukoha |
| VM | Virtual Machine | Arvutisüsteemi emuleerimine |
| VNet | Virtual Network | Azure privaatvõrk |
| YAML | YAML ei ole märkimiskeel | Andmete serialiseerimise standard |

---

## Azure Teenuse Nime Kaardistused

| Levinud Nimi | Azure Ametlik Teenuse Nimi | azd Hosti Tüüp |
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

## Kontekstispetsiifilised Terminid

### Arenduse Terminid
- **Hot Reload**: Rakenduste automaatne uuendamine arenduse ajal ilma taaskäivituseta
- **Build Pipeline**: Automatiseeritud protsess koodi ehitamiseks ja testimiseks
- **Deployment Slot**: Töökeskkond App Service'i sees
- **Environment Parity**: Arendus-, testimis- ja tootmiskeskkondade sarnasus

### Turbe Terminid
- **Managed Identity**: Azure funktsioon, mis tagab automaatse tunnusehalduse
- **Key Vault**: Turvaline hoidla saladustele, võtmetele ja sertifikaatidele
- **RBAC**: Rollipõhine ligipääsukontroll Azure ressurssidele
- **Network Security Group**: Virtuaalne tulemüür võrguliikluse kontrollimiseks

### Jälgimise Terminid
- **Telemetry**: Automaatne mõõtmiste ja andmete kogumine
- **Application Performance Monitoring (APM)**: Tarkvara jõudluse jälgimine
- **Log Analytics**: Teenus logiandmete kogumiseks ja analüüsimiseks
- **Alert Rules**: Automaatteavitused mõõdikute või tingimuste alusel

### Levitamise Terminid
- **Blue-Green Deployment**: Nullseisaku levitamisstrateegia
- **Canary Deployment**: Järkjärguline juurutamine kasutajate alamhulgale
- **Rolling Update**: Rakenduse eksemplaride järjestikune väljavahetamine
- **Rollback**: Tagasi pöördumine rakenduse eelmise versiooni peale

---

**Kasutusnõuanne**: Kasuta `Ctrl+F`, et kiiresti leida konkreetseid termineid selles sõnastikus. Termid on ristviidatud, kus see on võimalik.

---

**Navigeerimine**
- **Eelmine Õpetus**: [Vabavara Leht](cheat-sheet.md)
- **Järgmine Õpetus**: [KKK](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastutusest loobumine**:
See dokument on tõlgitud kasutades tehisintellekti tõlke teenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palume arvestada, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Algne dokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse professionaalset inimtõlget. Me ei vastuta mis tahes arusaamatuste või valesti mõistmiste eest, mis võivad tekkida selle tõlke kasutamisest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->