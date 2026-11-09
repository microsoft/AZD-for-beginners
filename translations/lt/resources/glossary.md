# Žodynas – Azure ir AZD terminologija

**Referencija visiems skyriams**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../README.md)
- **📖 Pagrindų mokymasis**: [1 skyrius: AZD pagrindai](../docs/chapter-01-foundation/azd-basics.md)
- **🤖 DI terminai**: [2 skyrius: DI-pirmojo kūrimo metodai](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)

## Įvadas

Šis išsamus žodynas pateikia apibrėžimus terminams, sąvokoms ir santrumpoms, naudotoms Azure Developer CLI ir Azure debesų kūrime. Esminė priemonė suprasti techninę dokumentaciją, spręsti problemas ir efektyviai bendrauti apie azd projektus ir Azure paslaugas.

## Mokymosi tikslai

Naudodami šį žodyną, jūs:
- Suprasite pagrindinę Azure Developer CLI terminiją ir sąvokas
- Išmoksitė Azure debesų kūrimo žodyną ir techninius terminus
- Efektyviai naudositės infrastruktūros kaip kodo ir diegimo terminija
- Suprasite Azure paslaugų pavadinimus, santrumpas ir jų paskirtis
- Gaunate apibrėžimus klaidų šalinimo ir derinimo terminų
- Išmoksite pažangias Azure architektūros ir kūrimo sąvokas

## Mokymosi rezultatai

Reguliariai naudodamiesi šiuo žodynu, galėsite:
- Efektyviai bendrauti vartodami tinkamą Azure Developer CLI terminiją
- Aiškiau suprasti techninę dokumentaciją ir klaidų pranešimus
- Užtikrintai naršyti Azure paslaugas ir sąvokas
- Šalinti problemas naudodami tinkamą techninę leksiką
- Tiksliai prisidėti prie komandos diskusijų technine kalba
- Sistemingai plėsti Azure debesų kūrimo žinias

## A

**ARM šablonas**  
Azure Resource Manager šablonas. JSON pagrindu sukurtas infrastruktūros kaip kodo formatas Azure ištekliams apibrėžti ir deklaratyviai diegti.

**App Service**  
Azure platformos kaip paslaugos (PaaS) siūlymas žiniatinklio programų, REST API ir mobiliųjų galinių sistemų talpinimui be infrastruktūros valdymo.

**Application Insights**  
Azure programų našumo stebėjimo (APM) paslauga, suteikianti išsamią informaciją apie programų našumą, prieinamumą ir naudojimą.

**Azure CLI**  
Komandinės eilutės sąsaja Azure ištekliams valdyti. Papildo AZD, bet turi atskirą prisijungimą; pagrindinė AZD autentifikacija naudoja `azd auth login`.

**Azure Developer CLI (azd)**  
Kūrėjo orientuotas komandų eilutės įrankis, kuris pagreitina programų kūrimo ir diegimo į Azure procesą naudojant šablonus ir infrastruktūrą kaip kodą.

**azure.yaml**  
Pagrindinis azd projekto konfigūracijos failas, apibrėžiantis paslaugas, infrastruktūrą ir diegimo kablius.

**Azure Resource Manager (ARM)**  
Azure diegimo ir valdymo paslauga, suteikianti valdymo sluoksnį išteklių kūrimui, atnaujinimui ir šalinimui.

## B

**Bicep**  
Domenui skirta kalba (DSL), sukurta Microsoft diegti Azure išteklius. Suteikia paprastesnę sintaksę nei ARM šablonai, kompiliuodama į ARM.

**Build**  
Procesas, kurio metu kompiliuojamas šaltinio kodas, įdiegiamos priklausomybės ir paruošiamos programos diegimui.

**Blue-Green Diegimas**  
Diegimo strategija, naudojanti du identiškus gamybinius aplinkas (mėlyną ir žalią), kad būtų sumažintas neveikimo laikas ir rizika.

## C

**Container Apps**  
Azure be serverių konteinerių paslauga, leidžianti vykdyti konteinerizuotas programas be sudėtingos infrastruktūros valdymo.

**CI/CD**  
Nuolatinė integracija/nuolatinis diegimas. Automatizuotos praktikos vykdant kodo pakeitimus ir diegiant programas.

**Cosmos DB**  
Azure pasauliniu mastu paskirstyta, daugiamodelė duomenų bazės paslauga, teikianti išsamias SLA užtikrinančias pralaidumą, delsą, prieinamumą ir nuoseklumą.

**Konfigūracija**  
Nustatymai ir parametrai, kontroliuojantys programų elgesį ir diegimo parinktis.

## D

**Diegimas**  
Procesas, kurio metu programos ir jų priklausomybės įdiegiamos ir konfigūruojamos tikslinėje infrastruktūroje.

**Docker**  
Platforma programų kūrimui, siuntimui ir vykdymui naudojant konteinerizacijos technologiją.

**Dockerfile**  
Tekstinis failas, kuriame pateikiamos instrukcijos Docker konteinerio atvaizdui kurti.

## E

**Aplinka**  
Diegimo taikinys, atspindintis konkrečią programos kopiją (pvz., kūrimo, patikros, gamybinę).

**Aplinkos kintamieji**  
Konfigūracijos reikšmės, saugomos kaip raktas-reikšmė, prieinamos programai vykdymo metu.

**Pabaigos taškas (Endpoint)**  
URL arba tinklo adresas, kuriuo galima pasiekti programą ar paslaugą.

## F

**Function App**  
Azure be serverių vykdymo paslauga, leidžianti vykdyti įvykius veikiančius kodus be infrastruktūros valdymo.

## G

**GitHub Actions**  
CI/CD platforma, integruota su GitHub saugyklomis, skirta automatizuoti darbo eigas.

**Git**  
Išskirstyta versijų kontrolės sistema, skirta sekti šaltinio kodo pakeitimus.

## H

**Kabliai (Hooks)**  
Individualūs scenarijai ar komandų rinkiniai, kurie vykdomi tam tikrais diegimo ciklo etapais (prieš ir po paruošimo ar diegimo).

**Šeimininkas (Host)**  
Azure paslaugos tipas, kuriame programa bus diegiama (pvz., appservice, containerapp, function).

## I

**Infrastruktūra kaip kodas (IaC)**  
Praktika apibrėžti ir valdyti infrastruktūrą per kodą, o ne rankines operacijas.

**Init**  
Procesas inicializuoti naują azd projektą, dažniausiai pagal šabloną.

## J

**JSON**  
JavaScript objektų žymėjimo formatas. Duomenų keitimosi formatas, dažnai naudojamas konfigūracijų failams ir API atsakymams.

**JWT**  
JSON Web Token. Standartas saugiai perduoti informaciją tarp šalių kaip JSON objektą.

## K

**Key Vault**  
Azure paslauga saugiai saugoti ir valdyti paslaptis, raktus ir sertifikatus.

**Kusto užklausų kalba (KQL)**  
Užklausų kalba, skirta analizuoti duomenis Azure Monitor, Application Insights ir kitose Azure paslaugose.

## L

**Load Balancer**  
Paslauga, skirstanti įeinantį tinklo srautą tarp kelių serverių ar instancijų.

**Log Analytics**  
Azure paslauga rinkti, analizuoti ir veikti remiantis debesų ir vietinių aplinkų telemetrijos duomenimis.

## M

**Valdomoji tapatybė (Managed Identity)**  
Azure funkcija, suteikianti paslaugoms automatiškai valdomą tapatybę autentifikavimuisi prie kitų Azure paslaugų.

**Mikropaslaugos (Microservices)**  
Architektūrinis požiūris, kai programos kuriamos kaip mažų, nepriklausomų paslaugų rinkinys.

**Monitor**  
Azure unifikuotas stebėjimo sprendimas, suteikiantis visapusišką stebėjimą tarp programų ir infrastruktūros.

## N

**Node.js**  
JavaScript vykdymo aplinka, sukurta Chrome V8 varikliui, skirta serverinėms programoms.

**npm**  
Paketo valdymo sistema Node.js, valdanti priklausomybes ir paketus.

## O

**Išvestis (Output)**  
Reikšmės, grąžinamos iš infrastruktūros diegimo, kurias gali naudoti programos ar kiti ištekliai.

## P

**Paketas (Package)**  
Procesas ruošiant programos kodą ir priklausomybes diegimui.

**Parametrai**  
Įėjimo reikšmės, perduodamos infrastruktūros šablonams diegimo pritaikymui.

**PostgreSQL**  
Atvirojo kodo reliacinė duomenų bazė, palaikoma kaip valdomoji paslauga Azure.

**Provisioning**  
Procesas kuriant ir konfigūruojant Azure išteklius, aprašytus infrastruktūros šablonuose.

## Q

**Kvotos (Quota)**  
Išteklių kiekio, kurį galima sukurti Azure prenumeratoje ar regione, apribojimai.

## R

**Išteklių grupė (Resource Group)**  
Loginis konteineris Azure ištekliams, kurie dalijasi tuo pačiu gyvenimo ciklu, prieigos teisėmis ir politikomis.

**Išteklių žetonas (Resource Token)**  
Unikalus azd sugeneruotas tekstas, užtikrinantis unikalius išteklių pavadinimus diegimuose.

**REST API**  
Architektūrinis stilius tinklo programoms projektuoti, naudojant HTTP metodus.

**Rollback**  
Procesas grįžti prie ankstesnės programos ar infrastruktūros konfigūracijos versijos.

## S

**Paslauga (Service)**  
Jūsų programos komponentas, apibrėžtas azure.yaml faile (pvz., žiniatinklio priekinė dalis, API galinė dalis, duomenų bazė).

**SKU**  
Sandėlio vienetas. Atspindi skirtingus paslaugų lygius arba našumo klases Azure ištekliams.

**SQL Database**  
Azure valdomoji reliacinė duomenų bazės paslauga, paremta Microsoft SQL Server.

**Static Web Apps**  
Azure paslauga pilno kelio žiniatinklio programoms kurti ir diegti iš šaltinio kodų saugyklų.

**Saugyklos paskyra (Storage Account)**  
Azure paslauga, suteikianti debesų saugyklą duomenų objektams, įskaitant blob’us, failus, eiles ir lenteles.

**Prenumerata (Subscription)**  
Azure paskyros konteineris, kuriame yra išteklių grupės ir ištekliai, su sąskaitų apmokėjimu ir prieigos valdymu.

## T

**Šablonas (Template)**  
Iš anksto paruošta projekto struktūra, kurioje yra programos kodas, infrastruktūros aprašai ir konfigūracija dažnai pasitaikančioms situacijoms.

**Terraform**  
Atvirojo kodo infrastruktūros kaip kodo įrankis, palaikantis kelis debesų tiekėjus, įskaitant Azure.

**Traffic Manager**  
Azure DNS pagrindu veikiantis srauto balansavimo įrankis, skirstantis srautą tarp pasaulinių Azure regionų.

## U

**URI**  
Uniform Resource Identifier. Grandinė, identifikuojanti konkretų išteklių.

**URL**  
Uniform Resource Locator. URI tipas, nurodantis kur yra išteklius ir kaip jį pasiekti.

## V

**Virtual Network (VNet)**  
Pagrindinis privatiems tinklams Azure blokas, suteikiantis atskyrimą ir segmentaciją.

**VS Code**  
Visual Studio Code. Populiarus kodo redaktorius su puikia Azure ir azd integracija.

## W

**Webhook**  
HTTP atgalinis kvietimas, aktyvuojamas tam tikrų įvykių, dažnai naudojamas CI/CD procesuose.

**What-if**  
Azure funkcija, rodanti, kokie pakeitimai būtų atlikti diegimo metu, nepaleidžiant jo iš tikrųjų.

## Y

**YAML**  
YAML Ain't Markup Language. Žmogui skaitomas duomenų serijalizavimo standartas, naudojamas konfigūracijos failams kaip azure.yaml.

## Z

**Zona**  
Fiziškai atskiri vietovės Azure regione taškai, užtikrinantys atsarginį kopijavimą ir aukštą prieinamumą.

---

## Dažniausios santrumpos

| Santrumpa | Pilnas pavadinimas | Aprašymas |
|---------|-----------|-------------|
| AAD | Azure Active Directory (dabar Microsoft Entra ID) | Tapatybės ir prieigos valdymo paslauga |
| ACR | Azure Container Registry | Konteinerių atvaizdų registracijos paslauga |
| AKS | Azure Kubernetes Service | Valdomoji Kubernetes paslauga |
| API | Application Programming Interface | Programinės įrangos kūrimo protokolų rinkinys |
| ARM | Azure Resource Manager | Azure diegimo ir valdymo paslauga |
| CDN | Content Delivery Network | Išskirstytas serverių tinklas |
| CI/CD | Nuolatinė integracija/nuolatinis diegimas | Automatizuotos kūrimo praktikos |
| CLI | Komandinės eilutės sąsaja | Tekstinė naudotojo sąsaja |
| DNS | Domain Name System | Sistema domenų vardams versti į IP adresus |
| HTTPS | Hypertext Transfer Protocol Secure | Saugioji HTTP versija |
| IaC | Infrastruktūra kaip kodas | Infrastruktūros valdymas per kodą |
| JSON | JavaScript Object Notation | Duomenų keitimosi formatas |
| JWT | JSON Web Token | Saugios informacijos perdavimo formatas |
| KQL | Kusto užklausų kalba | Užklausų kalba Azure duomenų paslaugoms |
| RBAC | Role-Based Access Control | Prieigos valdymo metodas pagal naudotojo roles |
| REST | Representational State Transfer | Aukštos lygio stilius interneto paslaugoms |
| SDK | Programinės įrangos kūrimo rinkinys | Kūrimo įrankių kolekcija |
| SLA | Service Level Agreement | Paslaugos prieinamumo/našumo įsipareigojimas |
| SQL | Structured Query Language | Kalba reliacinių duomenų bazių valdymui |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Kriptografijos protokolai |
| URI | Uniform Resource Identifier | Grandinė, identifikuojanti išteklių |
| URL | Uniform Resource Locator | URI tipas, nurodantis išteklių vietą |
| VM | Virtual Machine | Kompiuterinės sistemos emuliacija |
| VNet | Virtual Network | Privatus Azure tinklas |
| YAML | YAML Ain't Markup Language | Duomenų serijalizavimo standartas |

---

## Azure paslaugų pavadinimų atitikmenys

| Dažnas pavadinimas | Oficialus Azure paslaugos pavadinimas | azd šeimininko tipas |
|-------------|------------------------------|---------------|
| Web App | Azure App Service | `appservice` |
| API App | Azure App Service | `appservice` |
| Container App | Azure Container Apps | `containerapp` |
| Function | Azure Functions | `function` |
| Static Site | Azure Static Web Apps | `staticwebapp` |
| Database | Azure Database for PostgreSQL | Infrastruktūros išteklius, ne programa `host` |
| NoSQL DB | Azure Cosmos DB | Infrastruktūros išteklius, ne programa `host` |
| Storage | Azure Storage Account | Infrastruktūros išteklius, ne pagrindinė programa `host` |
| Cache | Azure Managed Redis | Infrastruktūros išteklius, ne programa `host` |
| Search | Azure AI Search | Infrastruktūros išteklius, ne programa `host` |
| Messaging | Azure Service Bus | Infrastruktūros išteklius, ne programa `host` |

`services.<name>.host` parenka programos diegimo tikslą; tai nėra santrumpa jokiai Azure išteklių rūšiai. Duomenų bazės, talpyklos, paieškos paslaugos ir eilės paprastai diegiamos per infrastruktūros tiekėją ir prijungiamos prie programos per išvestis/konfigūraciją.

---

## Kontekstui specifiniai terminai

### Kūrimo terminai
- **Hot Reload**: Automatiškai atnaujina programas kūrimo metu be perkrovimo
- **Build Pipeline**: Automatizuotas kodų kūrimo ir testavimo procesas
- **Deployment Slot**: Vienas iš patikros aplinkų App Service viduje
- **Environment Parity**: Kūrybos, patikros ir gamybos aplinkų suderinamumas

### Saugumo terminai
- **Managed Identity**: Azure funkcija, suteikianti automatinį kredencialų valdymą
- **Key Vault**: Saugi paslapčių, raktų ir sertifikatų saugykla
- **RBAC**: Rolėmis grįstas Azure išteklių prieigos valdymas
- **Network Security Group**: Virtualus ugniasienės sprendimas tinklo srautui valdyti

### Stebėjimo terminai
- **Telemetry**: Automatizuotas matavimų ir duomenų rinkimas
- **Application Performance Monitoring (APM)**: Programų našumo stebėjimas
- **Log Analytics**: Paslauga logų duomenų rinkimui ir analizei
- **Alert Rules**: Automatizuoti pranešimai pagal metrikas ar sąlygas

### Diegimo terminai
- **Blue-Green Deployment**: Diegimo strategija be neveikimo laiko
- **Canary Deployment**: Palaipsnis diegimas daliai naudotojų
- **Rolling Update**: Nuoseklus programos instancijų keitimas
- **Rollback**: Grįžimas prie ankstesnės programos versijos

---

**Naudojimo patarimas**: Naudokite `Ctrl+F` greitai ieškoti tam tikrų terminų šiame žodyne. Terminai kryžmiškai nurodomi, kai taikoma.

---

**Navigacija**
- **Ankstesnė pamoka**: [Santrauka](cheat-sheet.md)
- **Kita pamoka**: [DUK](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->