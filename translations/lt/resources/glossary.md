# Žodynas - Azure ir AZD terminologija

**Nuoroda į visus skyrius**
- **📚 Kurso pradžia**: [AZD For Beginners](../README.md)
- **📖 Išmokite pagrindų**: [Chapter 1: AZD Basics](../docs/getting-started/azd-basics.md)
- **🤖 Dirbtinio intelekto terminai**: [Chapter 2: AI-First Development](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## Įvadas

Šis išsamus žodynas pateikia apibrėžimus terminams, sąvokoms ir santrumpoms, naudojamoms Azure Developer CLI ir Azure debesų vystyme. Esminė priemonė suprasti techninę dokumentaciją, šalinti gedimus ir aiškiai bendrauti apie azd projektus bei Azure paslaugas.

## Mokymosi tikslai

Naudodami šį žodyną jūs:
- Suprasite esminę Azure Developer CLI terminologiją ir sąvokas
- Įvaldysite Azure debesų vystymo žodyną ir techninius terminus
- Greitai rasite Infrastructure as Code ir diegimo terminus
- Suprasite Azure paslaugų pavadinimus, santrumpas ir jų paskirtį
- Gaunate apibrėžimus trikčių šalinimo ir derinimo terminams
- Išmoksite pažangesnes Azure architektūros ir vystymo sąvokas

## Mokymosi rezultatai

Reguliariai naudodamiesi šiuo žodynu galėsite:
- Efektyviai bendrauti, naudodami tinkamą Azure Developer CLI terminologiją
- Aiškiau suprasti techninę dokumentaciją ir klaidų pranešimus
- Pasitikėdami naršyti Azure paslaugas ir sąvokas
- Spręsti problemas naudodami tinkamą techninę leksiką
- Prisidėti prie komandos diskusijų naudodami tikslią techninę kalbą
- Sistemiškai plėsti savo Azure debesų vystymo žinias

## A

**ARM šablonas**  
Azure Resource Manager šablonas. JSON pagrindu veikiantis Infrastructure as Code formatas, naudojamas deklaratyviai apibrėžti ir diegti Azure išteklius.

**App Service**  
Azure platformos kaip paslaugos (PaaS) pasiūlymas internetinėms programoms, REST API ir mobiliųjų servisų back-endams talpinti be infrastruktūros valdymo.

**Application Insights**  
Azure taikomosios programos veiklos stebėjimo (APM) paslauga, suteikianti gilias įžvalgas apie programos veikimą, prieinamumą ir naudojimą.

**Azure CLI**  
Komandinės eilutės sąsaja Azure ištekliams valdyti. Naudojama azd autentifikacijai ir kai kurioms operacijoms.

**Azure Developer CLI (azd)**  
Vystytojams pritaikytas komandinis įrankis, pagreitinantis programų kūrimo ir diegimo procesą į Azure naudojant šablonus ir Infrastructure as Code.

**azure.yaml**  
Pagrindinis azd projekto konfigūracijos failas, apibrėžiantis paslaugas, infrastruktūrą ir diegimo kablius.

**Azure Resource Manager (ARM)**  
Azure diegimo ir valdymo paslauga, suteikianti valdymo sluoksnį kuriant, atnaujinant ir trinant išteklius.

## B

**Bicep**  
Domenui pritaikyta kalba (DSL), sukurta Microsoft, skirta Azure ištekliams diegti. Turi paprastesnę sintaksę nei ARM šablonai ir kompiliuojasi į ARM.

**Kompiliacija (Build)**  
Procesas, kurio metu kompiliuojamas šaltinio kodas, įdiegiamos priklausomybės ir paruošiamos programos diegimui.

**Blue-Green diegimas**  
Diegimo strategija, naudojanti dvi identiškas gamybos aplinkas (mėlynąją ir žaliąją), siekiant sumažinti prastovas ir riziką.

## C

**Container Apps**  
Azure serverless konteinerių paslauga, leidžianti vykdyti konteinerizuotas programas be sudėtingos infrastruktūros valdymo.

**CI/CD**  
Continuous Integration/Continuous Deployment. Automatizuotos praktikos kodui integruoti ir programoms diegti.

**Cosmos DB**  
Globaliai paskirstyta, daugmodelinė duomenų bazės paslauga Azure, teikianti išsamius SLA pralaidumui, delsai, prieinamumui ir nuoseklumui.

**Konfigūracija**  
Nustatymai ir parametrai, valdantys programos elgseną ir diegimo parinktis.

## D

**Diegimas (Deployment)**  
Procesas, kurio metu programos ir jų priklausomybės įdiegiamos ir konfigūruojamos tikslinei infrastruktūrai.

**Docker**  
Platforma programoms kurti, pristatyti ir vykdyti naudojant konteinerizacijos technologiją.

**Dockerfile**  
Tekstinis failas, kuriame pateiktos instrukcijos Docker konteinerio vaizdui kurti.

## E

**Aplinka (Environment)**  
Diegimo tikslas, atstovaujantis konkrečiai jūsų programos egzemplioriaus versijai (pvz., development, staging, production).

**Aplinkos kintamieji**  
Konfigūracijos reikšmės, saugomos raktas-reikšmė poromis, kurias programos gali pasiekti vykdymo metu.

**Galutinis taškas (Endpoint)**  
URL arba tinklo adresas, kuriuo galima pasiekti programą ar paslaugą.

## F

**Function App**  
Azure serverless skaičiavimo paslauga, leidžianti vykdyti įvykiams reaguojantį kodą be infrastruktūros valdymo.

## G

**GitHub Actions**  
CI/CD platforma, integruota su GitHub saugyklomis automatiškai darbo eigai (workflow) vykdyti.

**Git**  
Distribuota versijų valdymo sistema, skirta šaltinio kodo pakeitimams sekti.

## H

**Hooks**  
Pasirinktinių scenarijų ar komandų rinkinys, vykdomas tam tikrais diegimo gyvavimo ciklo momentais (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Azure paslaugos tipas, į kurį bus diegiama programa (pvz., appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Praktika, kai infrastruktūra apibrėžiama ir valdomas per kodą, o ne rankiniais procesais.

**Init**  
Naujo azd projekto inicijavimo procesas, paprastai iš šablono.

## J

**JSON**  
JavaScript Object Notation. Duomenų mainų formatas, dažnai naudojamas konfigūracijų failams ir API atsakymams.

**JWT**  
JSON Web Token. Standartas saugiam informacijos perdavimui tarp šalių kaip JSON objekto.

## K

**Key Vault**  
Azure paslauga saugiai saugoti ir valdyti slaptus duomenis, raktus ir sertifikatus.

**Kusto užklausų kalba (KQL)**  
Užklausų kalba, naudojama analizuoti duomenis Azure Monitor, Application Insights ir kitose Azure paslaugose.

## L

**Load Balancer**  
Paslauga, paskirstanti įeinantį tinklo srautą tarp kelių serverių arba egzempliorių.

**Log Analytics**  
Azure paslauga telemetrijos duomenims rinkti, analizuoti ir imtis veiksmų iš debesų ir vietinių aplinkų.

## M

**Managed Identity**  
Azure funkcija, suteikianti Azure paslaugoms automatiškai valdomą identitetą autentifikacijai į kitus Azure servisus.

**Mikropaslaugos (Microservices)**  
Architektūrinis požiūris, kai programos kuriamos kaip mažų, nepriklausomų paslaugų rinkinys.

**Monitor**  
Azure suvienyta stebėjimo sprendimų sistema, teikianti viso stako stebėjimą per programas ir infrastruktūrą.

## N

**Node.js**  
JavaScript vykdymo laikas, sukurtas ant Chrome V8 variklio, skirtas serverinės pusės programoms kurti.

**npm**  
Paketu vadybininkas Node.js, valdantis priklausomybes ir paketus.

## O

**Išvestis (Output)**  
Reikšmės, grąžinamos iš infrastruktūros diegimo, kurias gali naudoti programos ar kiti ištekliai.

## P

**Pakuotė (Package)**  
Procesas, paruošiantis programos kodą ir priklausomybes diegimui.

**Parametrai**  
Įvesties reikšmės, perduodamos infrastruktūros šablonams, norint suasmeninti diegimus.

**PostgreSQL**  
Atviro kodo reliacinė duomenų bazė, palaikoma kaip valdomas servisas Azure.

**Provisioning**  
Procesas, kuriuo sukuriami ir konfigūruojami Azure ištekliai, apibrėžti infrastruktūros šablonuose.

## Q

**Quota**  
Ribos, nustatančios, kiek išteklių galima sukurti Azure prenumeratoje arba regione.

## R

**Resource Group**  
Loginis konteineris Azure ištekliams, kurie dalijasi tuo pačiu gyvenimo ciklu, leidimais ir politika.

**Resource Token**  
Unikalus eilutės pavidalo žymuo, generuojamas azd, užtikrinantis, kad išteklių pavadinimai būtų unikalūs diegimų metu.

**REST API**  
Architektūrinis stilius tinklo programoms kurti naudojant HTTP metodus.

**Rollback**  
Procesas, kai grįžtama prie ankstesnės programos arba infrastruktūros konfigūracijos versijos.

## S

**Service**  
Jūsų programos komponentas, apibrėžtas azure.yaml (pvz., web frontend, API backend, duomenų bazė).

**SKU**  
Stock Keeping Unit. Reiškia skirtingus paslaugos lygius arba našumo klases Azure ištekliams.

**SQL Database**  
Azure valdomos reliacinės duomenų bazės paslauga, paremta Microsoft SQL Server.

**Static Web Apps**  
Azure paslauga pilnaverčioms interneto programoms kurti ir diegti iš šaltinio kodų saugyklų.

**Storage Account**  
Azure paslauga, teikianti debesų saugyklą duomenų objektams, įskaitant blob'us, failus, eilutes ir lenteles.

**Subscription**  
Azure sąskaitos konteineris, kuriame yra resource group'ai ir ištekliai, su susijusiu atsiskaitymu ir prieigos valdymu.

## T

**Template**  
Iš anksto paruošta projekto struktūra, apimanti programos kodą, infrastruktūros apibrėžimus ir konfigūraciją įprastoms scenarijoms.

**Terraform**  
Atviro kodo Infrastructure as Code įrankis, palaikantis kelis debesų tiekėjus, įskaitant Azure.

**Traffic Manager**  
Azure DNS pagrįstas eismo balansavimo sprendimas, paskirstantis srautą tarp pasaulinių Azure regionų.

## U

**URI**  
Uniform Resource Identifier. Eilutė, identifikuojanti konkretų išteklių.

**URL**  
Uniform Resource Locator. URI tipas, nurodantis, kur išteklius yra ir kaip jį gauti.

## V

**Virtual Network (VNet)**  
Pagrindinis privačių tinklų Azure elementas, teikiantis izoliaciją ir segmentaciją.

**VS Code**  
Visual Studio Code. Populiarus kodo redaktorius su puikia Azure ir azd integracija.

## W

**Webhook**  
HTTP atgalinis kvietimas, suveikiantis konkrečių įvykių metu, dažnai naudojamas CI/CD procesuose.

**What-if**  
Azure funkcija, rodanti, kokie pakeitimai būtų atlikti diegimo metu, neįvykdant jų realiai.

## Y

**YAML**  
YAML Ain't Markup Language. Žmonėms skaitomas duomenų serializacijos standartas, naudojamas konfigūracijos failams, pvz., azure.yaml.

## Z

**Zone**  
Fiziškai atskiros vietovės regione Azure, suteikiančios atsparumą gedimams ir didelį prieinamumą.

---

## Dažnos santrumpos

| Acronym | Pilnas pavadinimas | Aprašymas |
|---------|--------------------|-----------|
| AAD | Azure Active Directory (now Microsoft Entra ID) | Tapatybės ir prieigos valdymo paslauga |
| ACR | Azure Container Registry | Konteinerių vaizdų registravimo paslauga |
| AKS | Azure Kubernetes Service | Valdomos Kubernetes paslaugos |
| API | Application Programming Interface | Protokolų rinkinys programinei įrangai kurti |
| ARM | Azure Resource Manager | Azure diegimo ir valdymo paslauga |
| CDN | Content Delivery Network | Išskaidytas serverių tinklas |
| CI/CD | Continuous Integration/Continuous Deployment | Automatizuotos vystymo praktikos |
| CLI | Command Line Interface | Tekstinė vartotojo sąsaja |
| DNS | Domain Name System | Sistema domenų vardams versti į IP adresus |
| HTTPS | Hypertext Transfer Protocol Secure | Saugioji HTTP versija |
| IaC | Infrastructure as Code | Infrastruktūros valdymas per kodą |
| JSON | JavaScript Object Notation | Duomenų mainų formatas |
| JWT | JSON Web Token | Žyma saugiam informacijos perdavimui |
| KQL | Kusto Query Language | Užklausų kalba Azure duomenų paslaugoms |
| RBAC | Role-Based Access Control | Prieigos valdymas pagal vartotojų vaidmenis |
| REST | Representational State Transfer | Architektūrinis stilius žiniatinklio paslaugoms |
| SDK | Software Development Kit | Vystymo įrankių rinkinys |
| SLA | Service Level Agreement | Įsipareigojimas dėl paslaugos prieinamumo/veikimo |
| SQL | Structured Query Language | Kalba reliacinėms duomenų bazėms valdyti |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Kriptografiniai protokolai |
| URI | Uniform Resource Identifier | Eilutė identifikuojanti išteklių |
| URL | Uniform Resource Locator | URI tipas, nurodantis išteklių vietą |
| VM | Virtual Machine | Kompiuterio sistemos emuliacija |
| VNet | Virtual Network | Privatus tinklas Azure |
| YAML | YAML Ain't Markup Language | Duomenų serializacijos standartas |

---

## Azure paslaugų pavadinimų žemėlapiai

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

## Kontekstui būdingi terminai

### Vystymo terminai
- **Hot Reload**: Automatinis programų atnaujinimas vystymo metu be perkrovimo
- **Build Pipeline**: Automatizuotas procesas kodo kūrimui ir testavimui
- **Deployment Slot**: Parengimo (staging) aplinka App Service viduje
- **Environment Parity**: Vystymo, parengimo ir gamybos aplinkų panašumo išlaikymas

### Saugaus darbų terminai
- **Managed Identity**: Azure funkcija, teikianti automatinį kredencialų valdymą
- **Key Vault**: Saugus slaptųjų duomenų, raktų ir sertifikatų saugojimas
- **RBAC**: Vaidmenimis grindžiamas prieigos valdymas Azure ištekliams
- **Network Security Group**: Virtualus ugniasienės sluoksnis tinklo srautui valdyti

### Stebėjimo terminai
- **Telemetry**: Automatizuotas matavimų ir duomenų rinkimas
- **Application Performance Monitoring (APM)**: Programų veiklos stebėjimas
- **Log Analytics**: Paslauga žurnalo duomenų rinkimui ir analizei
- **Alert Rules**: Automatizuoti pranešimai, paremti metrikomis arba sąlygomis

### Diegimo terminai
- **Blue-Green Deployment**: Diegimo strategija be prastovų
- **Canary Deployment**: Postepinis išleidimas daliai vartotojų
- **Rolling Update**: Sekanti programos egzempliorių pakeitimo strategija
- **Rollback**: Grįžimas prie ankstesnės programos versijos

---

**Naudojimo patarimas**: Naudokite `Ctrl+F`, kad greitai rastumėte konkrečius terminus šiame žodyne. Terminai yra tarpusavyje susieti, kai tai taikoma.

---

**Naršymas**
- **Ankstesnė pamoka**: [Cheat Sheet](cheat-sheet.md)
- **Kita pamoka**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->