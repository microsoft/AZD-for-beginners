# Žodynas - Azure ir AZD terminologija

**Nuoroda visiems skyriams**
- **📚 Kurso pradžia**: [AZD For Beginners](../README.md)
- **📖 Išmokite pagrindus**: [Chapter 1: AZD Basics](../docs/getting-started/azd-basics.md)
- **🤖 Dirbtinio intelekto terminai**: [Chapter 2: AI-First Development](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## Įvadas

Šis išsamus žodynas pateikia apibrėžimus terminams, sąvokoms ir akronimams, naudojamiems Azure Developer CLI ir Azure debesų kūrime. Esminė nuoroda norint suprasti techninę dokumentaciją, spręsti problemas ir veiksmingai bendrauti apie azd projektus ir Azure paslaugas.

## Mokymosi tikslai

Naudodami šį žodyną, jūs:
- Suprasite esminę Azure Developer CLI terminologiją ir sąvokas
- Įvaldysite Azure debesų kūrimo žargoną ir techninius terminus
- Efektyviai naudositės Infrastructure as Code ir diegimo terminologija
- Suprasite Azure paslaugų pavadinimus, akronimus ir jų paskirtis
- Gautas apibrėžimas padės sprendžiant trikčius ir derinant
- Išmoksite pažangias Azure architektūros ir kūrimo sąvokas

## Mokymosi rezultatai

Reguliariai naudodamiesi šiuo žodynu, galėsite:
- Veiksmingai komunikuoti naudodami tinkamą Azure Developer CLI terminologiją
- Aiškiau suprasti techninę dokumentaciją ir klaidų pranešimus
- Pasitikėti navigacija po Azure paslaugas ir sąvokas
- Spręsti problemas naudodami tinkamą techninį žodyną
- Prisidėti prie komandos diskusijų naudodami tikslią techninę kalbą
- Sistemingai plėsti savo Azure debesų kūrimo žinias

## A

**ARM Template**  
Azure Resource Manager šablonas. JSON pagrindu veikiantis Infrastructure as Code formatas, naudojamas deklaratyviai apibrėžti ir diegti Azure išteklius.

**App Service**  
Azure platformos kaip paslaugos (PaaS) pasiūlymas, skirtas talpinti žiniatinklio programas, REST API ir mobiliųjų programų back-end'us be infrastruktūros valdymo.

**Application Insights**  
Azure programų veiklos stebėjimo (APM) paslauga, suteikianti gilias įžvalgas apie programų našumą, prieinamumą ir naudojimą.

**Azure CLI**  
Komandinės eilutės sąsaja Azure ištekliams valdyti. Naudojama azd autentifikacijai ir kai kurioms operacijoms.

**Azure Developer CLI (azd)**  
Kūrėjams skirtas komandų eilutės įrankis, kuris pagreitina programų kūrimo ir diegimo į Azure procesą naudojant šablonus ir Infrastructure as Code.

**azure.yaml**  
Pagrindinis konfigūracijos failas azd projektui, apibrėžiantis paslaugas, infrastruktūrą ir diegimo kablius.

**Azure Resource Manager (ARM)**  
Azure diegimo ir valdymo paslauga, kuri suteikia valdymo sluoksnį kuriant, atnaujinant ir trinant išteklius.

## B

**Bicep**  
Domenui specifinė kalba (DSL), sukurta Microsoft, Azure ištekliams diegti. Siūlo paprastesnę sintaksę nei ARM šablonai ir kompiliuojasi į ARM.

**Build**  
Procesas, kuriuo kompiliuojamas šaltinio kodas, įdiegiami priklausomybių paketai ir ruošiamos programos diegimui.

**Blue-Green Deployment**  
Diegimo strategija, naudojanti dvi identiškas gamybines aplinkas (mėlyną ir žalią), siekiant sumažinti prastovas ir riziką.

## C

**Container Apps**  
Azure serverless konteinerių paslauga, leidžianti paleisti konteinerizuotas programas be sudėtingos infrastruktūros valdymo.

**CI/CD**  
Continuous Integration/Continuous Deployment. Automatizuotos praktikos, skirtos kodo pakeitimams integruoti ir programoms diegti.

**Cosmos DB**  
Azure globaliai paskirstyta, kelių modelių duomenų bazės paslauga, teikianti išsamias SLA dėl pralaidumo, delsos, prieinamumo ir nuoseklumo.

**Configuration**  
Nustatymai ir parametrai, kurie kontroliuoja programos elgesį ir diegimo parinktis.

## D

**Deployment**  
Procesas, kurio metu programos ir jų priklausomybės įdiegiamos ir konfigūruojamos tiksline infrastruktūra.

**Docker**  
Platforma programoms kurti, siųsti ir paleisti naudojant konteinerizacijos technologiją.

**Dockerfile**  
Tekstinis failas, kuriame yra instrukcijos Docker konteinerio vaizdui kurti.

## E

**Environment**  
Diegimo tikslas, kuris atstovauja konkrečią jūsų programos instanciją (pvz., development, staging, production).

**Environment Variables**  
Konfigūracijos reikšmės, saugomos kaip raktas-vertė poros, prieinamos programai vykdymo metu.

**Endpoint**  
URL arba tinklo adresas, kuriuo galima pasiekti programą arba paslaugą.

## F

**Function App**  
Azure serverless vykdymo paslauga, leidžianti paleisti įvykių valdomą kodą be infrastruktūros valdymo.

## G

**GitHub Actions**  
CI/CD platforma, integruota su GitHub saugyklomis darbo eigai automatizuoti.

**Git**  
Paskirstyta versijų kontrolės sistema, naudojama sekant šaltinio kodo pakeitimus.

## H

**Hooks**  
Vartotojo parašyti skriptai ar komandos, vykdomi tam tikrais diegimo ciklo momentais (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Azure paslaugos tipas, kuriame programa bus diegiama (pvz., appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Praktika, kai infrastruktūra apibrėžiama ir valdoma per kodą, o ne rankiniais veiksmais.

**Init**  
Naujo azd projekto inicializavimo procesas, paprastai naudojant šabloną.

## J

**JSON**  
JavaScript Object Notation. Duomenų mainų formatas, dažnai naudojamas konfigūracijų failams ir API atsakymams.

**JWT**  
JSON Web Token. Standartas saugiam informacijos perdavimui tarp šalių kaip JSON objekto.

## K

**Key Vault**  
Azure paslauga, skirta saugiai saugoti ir valdyti paslaptis, raktus ir sertifikatus.

**Kusto Query Language (KQL)**  
Užklausų kalba, naudojama duomenų analizavimui Azure Monitor, Application Insights ir kitose Azure paslaugose.

## L

**Load Balancer**  
Paslauga, paskirstanti įeinantį tinklo srautą per kelis serverius ar instancijas.

**Log Analytics**  
Azure paslauga telemetrijos duomenims rinkti, analizuoti ir veikti remiantis cloud ir on-prem aplinkų duomenimis.

## M

**Managed Identity**  
Azure funkcija, suteikianti Azure paslaugoms automatiškai valdomą tapatybę autentifikacijai į kitas Azure paslaugas.

**Microservices**  
Architektūrinis požiūris, kuriame programos kuriamos kaip mažų, nepriklausomų paslaugų rinkinys.

**Monitor**  
Azure vieninga stebėjimo sprendimų sistema, teikianti pilno spektro stebėjimą per programas ir infrastruktūrą.

## N

**Node.js**  
JavaScript vykdymo aplinka, sukurta ant Chrome V8 variklio, skirta serverinės pusės programoms kurti.

**npm**  
Paketo valdymo sistema Node.js, valdanti priklausomybes ir paketus.

## O

**Output**  
Reikšmės, grąžinamos iš infrastruktūros diegimo, kurias gali naudoti programos ar kiti ištekliai.

## P

**Package**  
Procesas, kurio metu paruošiamas programos kodas ir priklausomybės diegimui.

**Parameters**  
Įvesties reikšmės, perduodamos infrastruktūros šablonams diegimo pritaikymui.

**PostgreSQL**  
Atviro kodo reliacinė duomenų bazių sistema, palaikoma kaip valdomas servisas Azure.

**Provisioning**  
Procesas, kurio metu kuriami ir konfigūruojami Azure ištekliai, apibrėžti infrastruktūros šablonuose.

## Q

**Quota**  
Apribojimai dėl išteklių kiekio, kurį galima sukurti Azure prenumeratoje arba regione.

## R

**Resource Group**  
Loginis konteineris Azure ištekliams, kurie dalijasi tuo pačiu gyvavimo ciklu, teisėmis ir politikomis.

**Resource Token**  
Unikalus stringas, sugeneruotas azd, užtikrinantis, kad išteklių pavadinimai būtų unikalūs diegimuose.

**REST API**  
Architektūrinis stilius tinklo programoms kurti, naudojantis HTTP metodus.

**Rollback**  
Procesas, grąžinantis ankstesnę programos ar infrastruktūros konfigūracijos versiją.

## S

**Service**  
Komponentas jūsų programoje, apibrėžtas azure.yaml (pvz., web frontend, API backend, duomenų bazė).

**SKU**  
Stock Keeping Unit. Reiškia skirtingus paslaugų lygius arba našumo lygius Azure ištekliams.

**SQL Database**  
Azure valdomų reliacinių duomenų bazių paslauga, paremta Microsoft SQL Server.

**Static Web Apps**  
Azure paslauga pilno aplikacijos stalo kūrimui ir diegimui iš šaltinio kodo saugyklų.

**Storage Account**  
Azure paslauga, teikianti debesų saugyklą objektais, įskaitant blobs, files, queues ir tables.

**Subscription**  
Azure paskyros konteineris, kuriame laikomos resource group ir ištekliai, su susijusiu atsiskaitymu ir prieigos valdymu.

## T

**Template**  
Iš anksto paruošta projekto struktūra, talpinanti programos kodą, infrastruktūros apibrėžimus ir konfigūraciją dažnai pasitaikantiems scenarijams.

**Terraform**  
Atviro kodo Infrastructure as Code įrankis, palaikantis kelis debesų tiekėjus, įskaitant Azure.

**Traffic Manager**  
Azure DNS pagrindu veikiantis srauto paskirstymo balanceris, skirstantis srautą tarp pasaulinių Azure regionų.

## U

**URI**  
Uniform Resource Identifier. Stringas, identifikuojantis konkretų išteklių.

**URL**  
Uniform Resource Locator. URI tipas, nurodantis, kur išteklius yra ir kaip jį gauti.

## V

**Virtual Network (VNet)**  
Pagrindinis privatiems tinklams Azure elementas, teikiantis izoliaciją ir segmentaciją.

**VS Code**  
Visual Studio Code. Populiarus kodo redaktorius su puikia Azure ir azd integracija.

## W

**Webhook**  
HTTP atgalinis kvietimas, suveikiantis tam tikrų įvykių metu, dažnai naudojamas CI/CD pipeline'uose.

**What-if**  
Azure funkcija, rodanti, kokie pakeitimai būtų atlikti diegimo metu, neįvykdant jų iš tikrųjų.

## Y

**YAML**  
YAML Ain't Markup Language. Žmogui skaitoma duomenų serializacijos norma, naudojama konfigūracijos failams, pvz., azure.yaml.

## Z

**Zone**  
Fiziškai atskiros vietos Azure regione, suteikiančios redundantiškumą ir aukštą prieinamumą.

---

## Dažniausios santrumpos

| Acronym | Pilnas pavadinimas | Aprašymas |
|---------|-----------|-------------|
| AAD | Azure Active Directory | Tapatybės ir prieigos valdymo paslauga |
| ACR | Azure Container Registry | Konteinerio vaizdų registravimo paslauga |
| AKS | Azure Kubernetes Service | Valdomas Kubernetes servisas |
| API | Application Programming Interface | Protokolų rinkinys programinei įrangai kurti |
| ARM | Azure Resource Manager | Azure diegimo ir valdymo paslauga |
| CDN | Content Delivery Network | Paskirstyta serverių tinklo sistema |
| CI/CD | Continuous Integration/Continuous Deployment | Automatizuotos kūrimo praktikos |
| CLI | Command Line Interface | Tekstinė vartotojo sąsaja |
| DNS | Domain Name System | Sistema, verčianti domenų vardus į IP adresus |
| HTTPS | Hypertext Transfer Protocol Secure | Saugioji HTTP versija |
| IaC | Infrastructure as Code | Infrastruktūros valdymas per kodą |
| JSON | JavaScript Object Notation | Duomenų mainų formatas |
| JWT | JSON Web Token | Tokeno formatas saugiam informacijos perdavimui |
| KQL | Kusto Query Language | Užklausų kalba Azure duomenų paslaugoms |
| RBAC | Role-Based Access Control | Prieigos valdymas pagal vaidmenis |
| REST | Representational State Transfer | Architektūrinis stilius tinklo paslaugoms |
| SDK | Software Development Kit | Kūrimo įrankių rinkinys |
| SLA | Service Level Agreement | Įsipareigojimas dėl paslaugos prieinamumo/našumo |
| SQL | Structured Query Language | Kalba reliacinėms duomenų bazėms valdyti |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Kriptografiniai protokolai |
| URI | Uniform Resource Identifier | Stringas identifikuojantis išteklių |
| URL | Uniform Resource Locator | URI tipas nurodantis ištekliaus vietą |
| VM | Virtual Machine | Kompiuterio sistemos emuliacija |
| VNet | Virtual Network | Privatus tinklas Azure |
| YAML | YAML Ain't Markup Language | Duomenų serializacijos norma |

---

## Azure paslaugų pavadinimų atitikmenys

| Įprastas pavadinimas | Oficialus Azure paslaugos pavadinimas | azd talpinimo tipas |
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

## Kontekstui specifiški terminai

### Development Terms
- **Hot Reload**: Automatinis programų atnaujinimas kūrimo metu be perkrovimo
- **Build Pipeline**: Automatizuotas proceso etapas programos kūrimui ir testavimui
- **Deployment Slot**: Staginimo aplinka App Service viduje
- **Environment Parity**: Vystymo, staginimo ir gamybos aplinkų panašumo išlaikymas

### Security Terms
- **Managed Identity**: Azure funkcija, skirta automatinio kredencialų valdymo suteikimui
- **Key Vault**: Saugus paslapčių, raktų ir sertifikatų saugojimas
- **RBAC**: Prieigos valdymas pagal vaidmenis Azure ištekliams
- **Network Security Group**: Virtualus ugniasienės taisyklių rinkinys tinklo srautui kontroliuoti

### Monitoring Terms
- **Telemetry**: Automatinis matavimų ir duomenų rinkimas
- **Application Performance Monitoring (APM)**: Programų našumo stebėjimas
- **Log Analytics**: Paslauga žurnalų duomenims rinkti ir analizuoti
- **Alert Rules**: Automatiniai pranešimai pagal metrikas ar sąlygas

### Deployment Terms
- **Blue-Green Deployment**: Diegimo strategija be prastovų
- **Canary Deployment**: Palaipsnis išleidimas daliai vartotojų
- **Rolling Update**: Sekvencinis programos instancijų keitimas
- **Rollback**: Grąžinimas prie ankstesnės programos versijos

---

**Naudojimo patarimas**: Naudokite `Ctrl+F`, kad greitai surastumėte konkrečius terminus šiame žodyne. Terminai, kur taikoma, susieti tarpusavyje.

---

**Naršymas**
- **Ankstesnė pamoka**: [Greita atmintinė](cheat-sheet.md)
- **Kita pamoka**: [DUK](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Atsakomybės apribojimas:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, atkreipkite dėmesį, kad automatizuoti vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojamas profesionalus žmogiškas vertimas. Neatsakome už jokius nesusipratimus ar neteisingus aiškinimus, kylančius dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->