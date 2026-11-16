# Sõnastik - Azure ja AZD Terminoloogia

**Viide kõigile peatükkidele**
- **📚 Kursuse avaleht**: [AZD Algajatele](../README.md)
- **📖 Õpi aluseid**: [Peatükk 1: AZD alused](../docs/chapter-01-foundation/azd-basics.md)
- **🤖 tehisintellekti terminid**: [Peatükk 2: AI-Esimene arendus](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)

## Sissejuhatus

See põhjalik sõnastik annab määratlused Azure Developer CLI ja Azure pilve arenduses kasutatavatele terminitele, mõistetele ja akronüümidele. Oluline viide tehnilise dokumentatsiooni mõistmiseks, probleemide lahendamiseks ja tõhusa suhtluse tagamiseks azd projektide ja Azure teenuste kohta.

## Õpieesmärgid

Selle sõnastiku kasutamisel sa:
- Mõistad olulisi Azure Developer CLI terminoloogiat ja mõisteid
- Valdad Azure pilve arenduse sõnavara ja tehnilisi termineid
- Kasutad tõhusalt Infrastructure as Code ja juurutamise terminoloogiat
- Mõistad Azure teenuste nimesid, akronüüme ja nende otstarvet
- Saad ligi määratlustele vigade otsimiseks ja silumiseks kasutatava terminoloogia kohta
- Õpid edasijõudnud Azure arhitektuuri ja arendusmõisteid

## Õpitulemused

Regulaarse viitega sellele sõnastikule suudad sa:
- Suhelda tõhusalt kasutades õiget Azure Developer CLI terminoloogiat
- Mõista tehnilist dokumentatsiooni ja veateateid selgemalt
- Liikuda Azure teenuste ja kontseptsioonide vahel kindlalt
- Lahendada probleeme kasutades sobivat tehnilist sõnavara
- Panustada meeskonnaruteludesse täpse tehnilise keelega
- Laiendada oma Azure pilve arendusalaseid teadmisi süsteemselt

## A

**ARM mall**  
Azure Resource Manager mall. JSON-põhine Infrastructure as Code formaat, mida kasutatakse Azure ressursside defineerimiseks ja deklaratiivseks juurutamiseks.

**App Service**  
Azure platvormi teenusena (PaaS) pakutav keskkond veebi rakenduste, REST API-de ja mobiilsetel taustal töötavate teenuste majutamiseks, ilma infrastruktuuri haldamata.

**Application Insights**  
Azure rakenduse jõudluse jälgimise teenus (APM), mis annab sügavaid teadmisi rakenduse jõudluse, kättesaadavuse ja kasutuse kohta.

**Azure CLI**  
Käskude liides Azure ressursside haldamiseks. Täiendav AZD-le, kuid logimise jaoks eraldiseisev; AZD põhauthentimine kasutab `azd auth login`.

**Azure Developer CLI (azd)**  
Arendajale suunatud käsureatööriist, mis kiirendab rakenduste ülesehitamise ja juurutamise protsessi Azure'i mallide ja Infrastructure as Code abil.

**azure.yaml**  
Peamine konfiguratsioonifail azd projektis, mis määratleb teenused, infrastruktuuri ja juurutamise konksud.

**Azure Resource Manager (ARM)**  
Azure juurutamise ja haldusteenus, mis pakub halduskihti ressursside loomise, uuendamise ja kustutamise jaoks.

## B

**Bicep**  
Microsofti loodud domeenispetsiifiline keel (DSL) Azure ressursside juurutamiseks. Pakub lihtsamat süntaksit kui ARM mallid, samas kompileerub ARM-iks.

**Build (Kompileerimine)**  
Protsess, mille käigus kompileeritakse lähtekood, paigaldatakse sõltuvused ja valmistatakse rakendused juurutamiseks ette.

**Blue-Green Juurutamine**  
Juurutamisstrateegia, kus kasutatakse kahte identselt tootmiskeskkonda (sinine ja roheline), et minimeerida seisakuid ja riske.

## C

**Container Apps**  
Azure serverita konteineriteenus, mis lubab konteineriseeritud rakendusi käivitada ilma keerukat infrastruktuuri haldamata.

**CI/CD**  
Jätkuv integreerimine ja jätkuv juurutamine. Automatiseeritud praktika koodimuudatuste integreerimiseks ja rakenduste juurutanadmiseks.

**Cosmos DB**  
Azure globaalselt hajutatud mitmemudeline andmebaasiteenus, mis pakub ulatuslikke SLA-sid läbilaskevõime, latentsuse, kättesaadavuse ja järjepidevuse osas.

**Konfiguratsioon**  
Seaded ja parameetrid, mis kontrollivad rakenduse käitumist ja juurutuse valikuid.

## D

**Juurutamine**  
Protsess, mille käigus paigaldatakse ja konfigureeritakse rakendused ning nende sõltuvused sihtarhitektuuril.

**Docker**  
Platvorm rakenduste arendamiseks, saatmiseks ja käivitamiseks konteineritehnoloogia abil.

**Dockerfile**  
Tekstifail, mis sisaldab juhiseid Docker konteineripildi ehitamiseks.

## E

**Keskkond**  
Juurutus sihtkoht, mis esindab konkreetset sinu rakenduse eksemplari (nt arendus, testimine, tootmine).

**Keskkonnamuutujad**  
Konfiguratsiooni väärtused, mis on salvestatud võtme-väärtuse paaridena ja mida rakendused saavad käituse ajal kasutada.

**Lõpp-punkt**  
URL või võrguaadress, kus rakendus või teenus on ligipääsetav.

## F

**Function App**  
Azure serverita arvutusressurss, mis lubab sündmuspõhist koodi käivitada ilma infrastruktuuri haldamata.

## G

**GitHub Actions**  
CI/CD platvorm, mis on integreeritud GitHubi repositoriumitega töövoogude automatiseerimiseks.

**Git**  
Hajutatud versioonihaldussüsteem, mida kasutatakse lähtekoodi muudatuste jälgimiseks.

## H

**Hooks (Konksud)**  
Kohandatud skriptid või käsud, mis käivituvad juurutustsükli kindlates punktides (nt preprovision, postprovision, predeploy, postdeploy).

**Host**  
Azure teenuse tüüp, kuhu rakendus juurutatakse (nt appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Praktika infrastruktuuri defineerimiseks ja haldamiseks läbi koodi, mitte käsitsi protsesside abil.

**Init**  
Protsess uue azd projekti algatamiseks, tavaliselt mallist.

## J

**JSON**  
JavaScript Object Notation. Andmevahetuse formaat, mida tavaliselt kasutatakse konfiguratsioonifailides ja API vastustes.

**JWT**  
JSON Web Token. Standard turvaliseks info edastamiseks kahe poole vahel JSON objektina.

## K

**Key Vault**  
Azure teenus saladuste, võtmete ja sertifikaatide turvaliseks hoidmiseks ja haldamiseks.

**Kusto Query Language (KQL)**  
Päringukeel, mida kasutatakse andmete analüüsimiseks Azure Monitoris, Application Insightsis ja teistes Azure teenustes.

## L

**Load Balancer (koormuse tasandaja)**  
Teenus, mis jaotab sissetuleva võrguliikluse mitme serveri või eksemplari vahel.

**Log Analytics**  
Azure teenus telemeetria andmete kogumiseks, analüüsiks ja toiminguteks pilve- ja kohapealsetes keskkondades.

## M

**Managed Identity**  
Azure funktsioon, mis annab Azure teenustele automaatselt hallatava identiteedi identifitseerimiseks teistele Azure teenustele.

**Microservices (mikroteenused)**  
Arhitektuuriline lähenemine, kus rakendused on ehitatud väikeste, iseseisvate teenuste kogumikuna.

**Monitor**  
Azure ühtne jälgimislahendus, mis pakub täielikku observatsiooni rakenduste ja infrastruktuuri kohta.

## N

**Node.js**  
JavaScripti käitusaeg, mis põhineb Chrome'i V8 mootoril serveripoolsete rakenduste loomiseks.

**npm**  
Node.js pakihaldur, mis haldab sõltuvusi ja pakette.

## O

**Output (väljund)**  
Väärtused, mis tagastatakse infrastruktuuri juurutamise käigus ning mida rakendused või muud ressursid saavad kasutada.

## P

**Package (pakettimine)**  
Protsess, mille käigus valmistatakse rakenduse kood ja sõltuvused juurutamiseks ette.

**Parameetrid**  
Sisendväärtused, mis antakse infrastruktuuri mallidele juurutuste kohandamiseks.

**PostgreSQL**  
Avatud lähtekoodiga relaandmebaasisüsteem, mida Azure toetab hallatud teenusena.

**Provisioning (provisioneerimine)**  
Protsess, mille käigus luuakse ja konfigureeritakse Azure ressursid, mis on defineeritud infrastruktuuri mallides.

## Q

**Quota (kvoot)**  
Piirangud ressursside hulga kohta, mida saab luua Azure tellimuses või regioonis.

## R

**Resource Group (ressursigrupp)**  
Loogiline konteiner Azure ressurssidele, mis jagavad sama elutsüklit, õiguseid ja poliitikaid.

**Resource Token**  
Unikaalne string, mille azd genereerib, et tagada ressursside nimede unikaalsus juurutuste vahel.

**REST API**  
Võrkudega rakenduste projekteerimise arhitektuuristiil, kasutades HTTP meetodeid.

**Rollback (tagasipööre)**  
Protsess, mille käigus taastatakse rakenduse või infrastruktuuri konfiguratsiooni eelmise versiooni seisund.

## S

**Service (teenus)**  
Komponent sinu rakendusest, mis on defineeritud azure.yaml failis (nt veebiliides, API tagapool, andmebaas).

**SKU**  
Lao säilitamise ühik. Esindab erinevaid teenuse tasemeid või jõudlustasemeid Azure ressurssidele.

**SQL Database**  
Azure hallatud relaandmebaasi teenus, mis põhineb Microsoft SQL Serveril.

**Static Web Apps**  
Azure teenus täielike veebirakenduste ehitamiseks ja juurutamiseks lähtekoodide repositoriumitest.

**Storage Account (salvestuskonto)**  
Azure teenus, mis pakub pilvesalvestust andmeobjektidele, sh blobid, failid, järjekorrad ja tabelid.

**Subscription (tellimus)**  
Azure konto konteiner, mis sisaldab ressursigruppe ja ressursse koos arveldus- ja juurdepääsuhaldusega.

## T

**Template (mall)**  
Ettevalmistatud projekti struktuur, mis sisaldab rakenduse koodi, infrastruktuuri määratlusi ja konfiguratsiooni tavapäraste stsenaariumite jaoks.

**Terraform**  
Avatud lähtekoodiga Infrastructure as Code tööriist, mis toetab mitut pilveteenuse pakkujat, sealhulgas Azure.

**Traffic Manager**  
Azure'i DNS-põhine liikluse koormuse tasandaja, mis suunab liiklust üle globaalse Azure regioonide.

## U

**URI**  
Uniform Resource Identifier. String, mis identifitseerib konkreetse ressursi.

**URL**  
Uniform Resource Locator. URI tüüp, mis määrab, kus ressurss asub ja kuidas seda kätte saada.

## V

**Virtual Network (VNet)**  
Põhiline ehitusplokk Azure privaatvõrkude jaoks, mis pakub isolatsiooni ja segmentatsiooni.

**VS Code**  
Visual Studio Code. Populaarne koodiredaktor, millel on suurepärane Azure ja azd integreeritus.

## W

**Webhook**  
HTTP tagasikutse, mis käivitatakse kindlate sündmuste puhul, sageli kasutatuna CI/CD torudes.

**What-if (Mis siis kui)**  
Azure funktsioon, mis näitab, millised muudatused juurutamisega tehtaks, ilma seda tegelikult täide viimata.

## Y

**YAML**  
YAML ei ole märgistuskeel. Inimloetav andmete serialiseerimise standard, mida kasutatakse näiteks konfiguratsioonifailides nagu azure.yaml.

## Z

**Zone**  
Füüsiliselt eraldatud asukohad Azure regiooni piires, mis pakuvad kõrget kättesaadavust ja varundust.

---

## Levinumad akronüümid

| Akronüüm | Täisvorm | Kirjeldus |
|---------|-----------|-------------|
| AAD | Azure Active Directory (nüüd Microsoft Entra ID) | Identiteedi ja juurdepääsu haldusteenus |
| ACR | Azure Container Registry | Konteineripiltide registreerimisteenus |
| AKS | Azure Kubernetes Service | Hallatav Kubernetes teenus |
| API | Application Programming Interface | Tarkvara loomise protokollid |
| ARM | Azure Resource Manager | Azure juurutamise ja haldusteenus |
| CDN | Content Delivery Network | Hajutatud serverite võrk |
| CI/CD | Continuous Integration/Continuous Deployment | Automatiseeritud arenduspraktikad |
| CLI | Command Line Interface | Tekstipõhine kasutajaliides |
| DNS | Domain Name System | Domeeninimede IP-aadressideks tõlkimise süsteem |
| HTTPS | Hypertext Transfer Protocol Secure | HTTP turvaline versioon |
| IaC | Infrastructure as Code | Infrastruktuuri haldamine läbi koodi |
| JSON | JavaScript Object Notation | Andmevahetuse formaat |
| JWT | JSON Web Token | Turvalise info edastuse tokeni formaat |
| KQL | Kusto Query Language | Azure andmeteenuste päringukeel |
| RBAC | Role-Based Access Control | Juurdepääsu kontrolli meetod kasutajarollide alusel |
| REST | Representational State Transfer | Veebiteenuste arhitektuuristiil |
| SDK | Software Development Kit | Arendustööriistade komplekt |
| SLA | Service Level Agreement | Kohustus teenuse kättesaadavuse/jõudluse osas |
| SQL | Structured Query Language | Keel relaandmebaaside haldamiseks |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Krüptograafilised protokollid |
| URI | Uniform Resource Identifier | Ressiursi identifitseeriv string |
| URL | Uniform Resource Locator | URI tüüp, mis määrab ressursi asukoha |
| VM | Virtual Machine | Arvutisüsteemi emulatsioon |
| VNet | Virtual Network | Privaatvõrk Azure'is |
| YAML | YAML ei ole märgistuskeel | Andmete serialiseerimise standard |

---

## Azure teenuste nimede vasted

| Levinud nimi | Ametlik Azure teenuse nimi | azd hosti tüüp |
|-------------|------------------------------|---------------|
| Web App | Azure App Service | `appservice` |
| API App | Azure App Service | `appservice` |
| Container App | Azure Container Apps | `containerapp` |
| Function | Azure Functions | `function` |
| Static Site | Azure Static Web Apps | `staticwebapp` |
| Database | Azure Database for PostgreSQL | Infrastruktuuriresurss, mitte rakendus `host` |
| NoSQL DB | Azure Cosmos DB | Infrastruktuuriresurss, mitte rakendus `host` |
| Storage | Azure Storage Account | Infrastruktuuriresurss, mitte sisseehitatud rakendus `host` |
| Cache | Azure Managed Redis | Infrastruktuuriresurss, mitte rakendus `host` |
| Search | Azure AI Search | Infrastruktuuriresurss, mitte rakendus `host` |
| Messaging | Azure Service Bus | Infrastruktuuriresurss, mitte rakendus `host` |

`services.<name>.host` valib rakenduse juurutamise sihtkoha; see ei ole lühend ühelegi Azure ressursi tüübile. Andmebaasid, vahemälud, otsinguteenused ja järjekorrad juurutatakse tavaliselt infrastruktuuri pakkuja kaudu ning ühendatakse rakendusega väljundite/konfiguratsiooni kaudu.

---

## Kontekstitundlikud terminid

### Arenduse terminid
- **Hot Reload**: Rakenduse automaatne värskendamine arenduse ajal ilma taaskäivituseta
- **Build Pipeline**: Automatiseeritud protsess koodi ehitamiseks ja testimiseks
- **Deployment Slot**: Testkeskkond App Service sees
- **Environment Parity**: Arendus-, testimis- ja tootmiskeskkondade omavahelise sarnasuse hoidmine

### Turvaterminid
- **Managed Identity**: Azure funktsioon, mis pakub automaatset tunnistuse haldamist
- **Key Vault**: Turvaline hoidla saladuste, võtmete ja sertifikaatide jaoks
- **RBAC**: Rollipõhine juurdepääsukontroll Azure ressurssidele
- **Network Security Group**: Virtuaalne tulemüür võrguliikluse kontrollimiseks

### Jälgimise terminid
- **Telemetry**: Automatiseeritud mõõtmiste ja andmete kogumine
- **Application Performance Monitoring (APM)**: Tarkvara jõudluse jälgimine
- **Log Analytics**: Teenus logiandmete kogumiseks ja analüüsiks
- **Alert Rules**: Automatiseeritud teavitused mõõdikute või tingimuste alusel

### Juurutamise terminid
- **Blue-Green Deployment**: Seisakuid mittetoksuv juurutamisstrateegia
- **Canary Deployment**: Juurutuse järkjärguline esitamine kasutajate alamhulgale
- **Rolling Update**: Rakenduse eksemplaride järjestikune asendamine
- **Rollback**: Tagasipöördumine eelmise rakendusversiooni juurde

---

**Kasutusnõuanne**: Kasuta `Ctrl+F`, et kiiresti otsida konkreetseid termineid selles sõnastikus. Terminid on vajadusel ristviidatud.

---

**Navigatsioon**
- **Eelmine õppetükk**: [Petturlusleht](cheat-sheet.md)
- **Järgmine õppetükk**: [KKK](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->