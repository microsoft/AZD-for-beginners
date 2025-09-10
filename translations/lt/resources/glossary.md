<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "59cb1c1635512e212da16d50f3259ca4",
  "translation_date": "2025-09-10T07:56:56+00:00",
  "source_file": "resources/glossary.md",
  "language_code": "lt"
}
-->
# Žodynas - Azure Developer CLI Terminologija

## Įvadas

Šis išsamus žodynas pateikia terminų, sąvokų ir akronimų apibrėžimus, naudojamus Azure Developer CLI ir Azure debesų kūrimo srityje. Esminis šaltinis techninės dokumentacijos supratimui, problemų sprendimui ir efektyviam bendravimui apie azd projektus bei Azure paslaugas.

## Mokymosi tikslai

Naudodamiesi šiuo žodynu, jūs:
- Suprasite pagrindinę Azure Developer CLI terminologiją ir sąvokas
- Įvaldysite Azure debesų kūrimo žodyną ir techninius terminus
- Efektyviai naudosite infrastruktūros kaip kodo ir diegimo terminologiją
- Suprasite Azure paslaugų pavadinimus, akronimus ir jų paskirtį
- Pasieksite apibrėžimus, susijusius su problemų sprendimu ir derinimu
- Išmoksite pažangias Azure architektūros ir kūrimo sąvokas

## Mokymosi rezultatai

Reguliariai naudodamiesi šiuo žodynu, galėsite:
- Efektyviai bendrauti naudodami tinkamą Azure Developer CLI terminologiją
- Aiškiau suprasti techninę dokumentaciją ir klaidų pranešimus
- Pasitikėdami naršyti Azure paslaugas ir sąvokas
- Spręsti problemas naudodami tinkamą techninį žodyną
- Prisidėti prie komandos diskusijų naudodami tikslią techninę kalbą
- Sistemingai plėsti savo žinias apie Azure debesų kūrimą

## A

**ARM šablonas**  
Azure Resource Manager šablonas. JSON pagrindu sukurtas infrastruktūros kaip kodo formatas, naudojamas Azure ištekliams apibrėžti ir diegti deklaratyviai.

**App Service**  
Azure platformos kaip paslaugos (PaaS) pasiūlymas, skirtas talpinti žiniatinklio programas, REST API ir mobiliųjų įrenginių užkulisius be infrastruktūros valdymo.

**Application Insights**  
Azure paslauga, skirta programų našumo stebėjimui (APM), teikianti išsamią informaciją apie programų našumą, prieinamumą ir naudojimą.

**Azure CLI**  
Komandinės eilutės sąsaja, skirta Azure ištekliams valdyti. Naudojama azd autentifikacijai ir kai kurioms operacijoms.

**Azure Developer CLI (azd)**  
Kūrėjams orientuotas komandinės eilutės įrankis, kuris pagreitina programų kūrimo ir diegimo procesą Azure naudojant šablonus ir infrastruktūrą kaip kodą.

**azure.yaml**  
Pagrindinis azd projekto konfigūracijos failas, apibrėžiantis paslaugas, infrastruktūrą ir diegimo veiksmus.

**Azure Resource Manager (ARM)**  
Azure diegimo ir valdymo paslauga, teikianti valdymo sluoksnį ištekliams kurti, atnaujinti ir ištrinti.

## B

**Bicep**  
Microsoft sukurta domeno specifinė kalba (DSL), skirta Azure ištekliams diegti. Pateikia paprastesnę sintaksę nei ARM šablonai, tačiau kompiliuojama į ARM.

**Build**  
Procesas, kurio metu kompiliuojamas šaltinio kodas, įdiegiamos priklausomybės ir paruošiamos programos diegimui.

**Blue-Green Deployment**  
Diegimo strategija, naudojanti dvi identiškas gamybos aplinkas (mėlyną ir žalią), siekiant sumažinti prastovas ir riziką.

## C

**Container Apps**  
Azure serverless konteinerių paslauga, leidžianti paleisti konteinerizuotas programas be sudėtingos infrastruktūros valdymo.

**CI/CD**  
Nuolatinė integracija/nuolatinis diegimas. Automatizuotos praktikos, skirtos kodo pakeitimams integruoti ir programoms diegti.

**Cosmos DB**  
Azure pasaulinė paskirstyta, daugiamodelinė duomenų bazės paslauga, teikianti išsamias SLA dėl pralaidumo, delsos, prieinamumo ir nuoseklumo.

**Konfigūracija**  
Nustatymai ir parametrai, kontroliuojantys programos elgesį ir diegimo parinktis.

## D

**Diegimas**  
Procesas, kurio metu programos ir jų priklausomybės įdiegiamos ir konfigūruojamos tikslinėje infrastruktūroje.

**Docker**  
Platforma, skirta programoms kurti, siųsti ir paleisti naudojant konteinerizacijos technologiją.

**Dockerfile**  
Tekstinis failas, kuriame pateikiamos instrukcijos Docker konteinerio vaizdui kurti.

## E

**Aplinka**  
Diegimo tikslas, atspindintis konkrečią jūsų programos instanciją (pvz., kūrimo, testavimo, gamybos).

**Aplinkos kintamieji**  
Konfigūracijos reikšmės, saugomos kaip raktų-reikšmių poros, kurias programos gali pasiekti vykdymo metu.

**Endpoint**  
URL arba tinklo adresas, kuriame galima pasiekti programą ar paslaugą.

## F

**Function App**  
Azure serverless skaičiavimo paslauga, leidžianti paleisti įvykių valdomą kodą be infrastruktūros valdymo.

## G

**GitHub Actions**  
CI/CD platforma, integruota su GitHub saugyklomis, skirta darbo eigoms automatizuoti.

**Git**  
Paskirstyta versijų valdymo sistema, naudojama šaltinio kodo pakeitimams sekti.

## H

**Hooks**  
Pasirinktiniai scenarijai ar komandos, vykdomos tam tikruose diegimo gyvavimo ciklo taškuose (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Azure paslaugos tipas, kuriame bus diegiama programa (pvz., appservice, containerapp, function).

## I

**Infrastruktūra kaip kodas (IaC)**  
Praktika, kai infrastruktūra apibrėžiama ir valdoma per kodą, o ne rankiniu būdu.

**Init**  
Procesas, kurio metu inicijuojamas naujas azd projektas, paprastai iš šablono.

## J

**JSON**  
JavaScript Object Notation. Duomenų mainų formatas, dažnai naudojamas konfigūracijos failams ir API atsakymams.

**JWT**  
JSON Web Token. Standartas, skirtas saugiai perduoti informaciją tarp šalių kaip JSON objektą.

## K

**Key Vault**  
Azure paslauga, skirta saugiai saugoti ir valdyti slaptažodžius, raktus ir sertifikatus.

**Kusto Query Language (KQL)**  
Užklausų kalba, naudojama duomenims analizuoti Azure Monitor, Application Insights ir kitose Azure paslaugose.

## L

**Load Balancer**  
Paslauga, paskirstanti gaunamą tinklo srautą tarp kelių serverių ar instancijų.

**Log Analytics**  
Azure paslauga, skirta rinkti, analizuoti ir veikti pagal telemetrijos duomenis iš debesų ir vietinių aplinkų.

## M

**Managed Identity**  
Azure funkcija, suteikianti Azure paslaugoms automatiškai valdomą tapatybę autentifikacijai kitose Azure paslaugose.

**Microservices**  
Architektūrinis požiūris, kai programos kuriamos kaip mažų, nepriklausomų paslaugų rinkinys.

**Monitor**  
Azure vieninga stebėjimo sprendimas, teikiantis visapusišką stebėjimą per programas ir infrastruktūrą.

## N

**Node.js**  
JavaScript vykdymo aplinka, sukurta ant Chrome V8 JavaScript variklio, skirta serverio pusės programoms kurti.

**npm**  
Node.js paketų tvarkyklė, valdanti priklausomybes ir paketus.

## O

**Output**  
Reikšmės, grąžinamos infrastruktūros diegimo metu, kurias gali naudoti programos ar kiti ištekliai.

## P

**Package**  
Procesas, kurio metu paruošiamas programos kodas ir priklausomybės diegimui.

**Parameters**  
Įvesties reikšmės, perduodamos infrastruktūros šablonams, siekiant pritaikyti diegimus.

**PostgreSQL**  
Atvirojo kodo reliacinė duomenų bazių sistema, palaikoma kaip valdomoji paslauga Azure.

**Provisioning**  
Procesas, kurio metu kuriami ir konfigūruojami Azure ištekliai, apibrėžti infrastruktūros šablonuose.

## Q

**Quota**  
Išteklių, kuriuos galima sukurti Azure prenumeratoje ar regione, apribojimai.

## R

**Resource Group**  
Logiškas Azure išteklių konteineris, turintis bendrą gyvavimo ciklą, leidimus ir politiką.

**Resource Token**  
Unikalus eilutės kodas, generuojamas azd, siekiant užtikrinti išteklių pavadinimų unikalumą diegimuose.

**REST API**  
Architektūrinis stilius, skirtas tinklo programoms kurti naudojant HTTP metodus.

**Rollback**  
Procesas, kurio metu grįžtama prie ankstesnės programos ar infrastruktūros konfigūracijos versijos.

## S

**Service**  
Komponentas jūsų programoje, apibrėžtas azure.yaml (pvz., žiniatinklio priekinė dalis, API užkulisis, duomenų bazė).

**SKU**  
Prekės kodas. Atspindi skirtingus paslaugų lygius ar našumo lygius Azure ištekliams.

**SQL Database**  
Azure valdomoji reliacinė duomenų bazių paslauga, pagrįsta Microsoft SQL Server.

**Static Web Apps**  
Azure paslauga, skirta kurti ir diegti pilno funkcionalumo žiniatinklio programas iš šaltinio kodų saugyklų.

**Storage Account**  
Azure paslauga, teikianti debesų saugyklą duomenų objektams, įskaitant blobus, failus, eilutes ir lenteles.

**Subscription**  
Azure paskyros konteineris, kuriame saugomi išteklių grupės ir ištekliai, susiję su sąskaitų apmokėjimu ir prieigos valdymu.

## T

**Template**  
Iš anksto sukurtas projekto struktūros šablonas, kuriame yra programos kodas, infrastruktūros apibrėžimai ir konfigūracija dažniems scenarijams.

**Terraform**  
Atvirojo kodo infrastruktūros kaip kodo įrankis, palaikantis kelis debesų tiekėjus, įskaitant Azure.

**Traffic Manager**  
Azure DNS pagrindu veikiantis srauto apkrovos balansavimo įrankis, skirtas srautui paskirstyti tarp pasaulinių Azure regionų.

## U

**URI**  
Vieningas išteklių identifikatorius. Eilutė, identifikuojanti konkretų išteklių.

**URL**  
Vieningas išteklių lokatorius. URI tipas, nurodantis, kur išteklius yra ir kaip jį pasiekti.

## V

**Virtual Network (VNet)**  
Pagrindinis Azure privačių tinklų kūrimo blokas, teikiantis izoliaciją ir segmentaciją.

**VS Code**  
Visual Studio Code. Populiarus kodo redaktorius, turintis puikią Azure ir azd integraciją.

## W

**Webhook**  
HTTP atgalinis skambutis, aktyvuojamas specifiniais įvykiais, dažnai naudojamas CI/CD procesuose.

**What-if**  
Azure funkcija, rodanti, kokie pakeitimai būtų atlikti diegimo metu, jų faktiškai nevykdant.

## Y

**YAML**  
YAML Ain't Markup Language. Žmogui suprantamas duomenų serializacijos standartas, naudojamas konfigūracijos failams, pvz., azure.yaml.

## Z

**Zone**  
Fiziškai atskirtos vietos Azure regione, teikiančios redundanciją ir aukštą prieinamumą.

---

## Dažniausiai naudojami akronimai

| Akronimas | Pilnas pavadinimas | Aprašymas |
|-----------|--------------------|-----------|
| AAD | Azure Active Directory | Tapatybės ir prieigos valdymo paslauga |
| ACR | Azure Container Registry | Konteinerių vaizdų registravimo paslauga |
| AKS | Azure Kubernetes Service | Valdoma Kubernetes paslauga |
| API | Application Programming Interface | Protokolų rinkinys programinei įrangai kurti |
| ARM | Azure Resource Manager | Azure diegimo ir valdymo paslauga |
| CDN | Content Delivery Network | Paskirstytas serverių tinklas |
| CI/CD | Continuous Integration/Continuous Deployment | Automatizuotos kūrimo praktikos |
| CLI | Command Line Interface | Teksto pagrindu veikianti vartotojo sąsaja |
| DNS | Domain Name System | Sistema, verčianti domenų vardus į IP adresus |
| HTTPS | Hypertext Transfer Protocol Secure | Saugus HTTP protokolo variantas |
| IaC | Infrastructure as Code | Infrastruktūros valdymas per kodą |
| JSON | JavaScript Object Notation | Duomenų mainų formatas |
| JWT | JSON Web Token | Tokenų formatas saugiam informacijos perdavimui |
| KQL | Kusto Query Language | Užklausų kalba Azure duomenų paslaugoms |
| RBAC | Role-Based Access Control | Prieigos kontrolės metodas pagal vartotojų roles |
| REST | Representational State Transfer | Architektūrinis stilius žiniatinklio paslaugoms |
| SDK | Software Development Kit | Kūrimo įrankių rinkinys |
| SLA | Service Level Agreement | Įsipareigojimas dėl paslaugos prieinamumo/našumo |
| SQL | Structured Query Language | Kalba reliacinėms duomenų bazėms valdyti |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Kriptografiniai protokolai |
| URI | Uniform Resource Identifier | Eilutė, identifikuojanti išteklių |
| URL | Uniform Resource Locator | URI tipas, nurodantis išteklių vietą |
| VM | Virtual Machine | Kompiuterinės sistemos emuliacija |
| VNet | Virtual Network | Privatus tinklas Azure |
| YAML | YAML Ain't Markup Language | Duomenų serializacijos standartas |

---

## Azure paslaugų pavadinimų atitikmenys

| Bendras pavadinimas | Oficialus Azure paslaugos pavadinimas | azd Host tipas |
|---------------------|---------------------------------------|----------------|
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

## Kontekstui specifiniai terminai

### Kūrimo terminai
- **Hot Reload**: Automatinis programų atnaujinimas kūrimo metu be perkrovimo
- **Build Pipeline**: Automatizuotas kodo kūrimo ir testavimo procesas
- **Deployment Slot**: Testavimo aplinka App Service viduje
- **Environment Parity**: Kūrimo, testavimo ir gamybos aplinkų panašumo užtikrinimas

### Saugumo terminai
- **Managed Identity**: Azure funkcija, teikianti automatinį kredencialų valdymą
- **Key Vault**: Saugus slaptažodžių, raktų ir sertifikatų saugojimas
- **RBAC**: Rolėmis pagrįsta prieigos kontrolė Azure ištekliams
- **Network Security Group**: Virtualus ugniasienė, kontroliuojanti tinklo srautą

### Stebėjimo terminai
- **Telemetry**: Automatinis matavimų ir duomenų rinkimas
- **Application Performance Monitoring (APM)**: Programų našumo stebėjimas
- **Log Analytics**: Paslauga, skirta rinkti ir analizuoti žurnalų duomenis
- **Alert Rules**: Automatiniai pranešimai pagal metrikas ar sąlygas

### Diegimo terminai
- **Blue-Green Deployment**: Diegimo strategija be prastovų
- **Canary Deployment**: Palaipsnis diegimas daliai vartotojų
- **Rolling Update**: Sekvencinis programos instancijų pakeitimas
- **Rollback**: Grįžimas prie ankstesnės programos versijos

---

**Naudojimo patarimas**: Naudokite `Ctrl+F`, kad greitai surastumėte konkrečius terminus šiame žodyne.

---

**Atsakomybės apribojimas**:  
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, atkreipiame dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Kritinei informacijai rekomenduojama naudotis profesionalių vertėjų paslaugomis. Mes neprisiimame atsakomybės už nesusipratimus ar klaidingus aiškinimus, kylančius dėl šio vertimo naudojimo.