<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "f16d2988a24670d1b6aa2372de1a231a",
  "translation_date": "2025-09-18T14:18:13+00:00",
  "source_file": "resources/glossary.md",
  "language_code": "lt"
}
-->
# Žodynas - Azure ir AZD terminologija

**Nuoroda visiems skyriams**  
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../README.md)  
- **📖 Mokykitės pagrindų**: [1 skyrius: AZD pagrindai](../docs/getting-started/azd-basics.md)  
- **🤖 AI terminai**: [2 skyrius: AI-pirmasis vystymas](../docs/ai-foundry/azure-ai-foundry-integration.md)  

## Įvadas

Šis išsamus žodynas pateikia terminų, sąvokų ir akronimų apibrėžimus, naudojamus Azure Developer CLI ir Azure debesų vystymo srityje. Esminė nuoroda techninės dokumentacijos supratimui, problemų sprendimui ir efektyviam bendravimui apie azd projektus bei Azure paslaugas.

## Mokymosi tikslai

Naudodamiesi šiuo žodynu, jūs:  
- Suprasite esminę Azure Developer CLI terminologiją ir sąvokas  
- Įvaldysite Azure debesų vystymo žodyną ir techninius terminus  
- Efektyviai naudosite infrastruktūros kaip kodo ir diegimo terminologiją  
- Suprasite Azure paslaugų pavadinimus, akronimus ir jų paskirtį  
- Turėsite apibrėžimus problemų sprendimui ir derinimo terminologijai  
- Išmoksite pažangias Azure architektūros ir vystymo sąvokas  

## Mokymosi rezultatai

Reguliariai naudodamiesi šiuo žodynu, jūs galėsite:  
- Efektyviai bendrauti naudodami tinkamą Azure Developer CLI terminologiją  
- Aiškiau suprasti techninę dokumentaciją ir klaidų pranešimus  
- Pasitikėdami naršyti Azure paslaugas ir sąvokas  
- Spręsti problemas naudodami tinkamą techninį žodyną  
- Prisidėti prie komandos diskusijų naudodami tikslią techninę kalbą  
- Sistemingai plėsti savo žinias apie Azure debesų vystymą  

## A

**ARM šablonas**  
Azure Resource Manager šablonas. JSON pagrindu sukurta infrastruktūros kaip kodo forma, naudojama Azure resursų apibrėžimui ir diegimui deklaratyviai.

**App Service**  
Azure platformos kaip paslaugos (PaaS) pasiūlymas, skirtas talpinti internetines aplikacijas, REST API ir mobiliųjų aplikacijų užkulisius be infrastruktūros valdymo.

**Application Insights**  
Azure aplikacijų našumo stebėjimo (APM) paslauga, teikianti gilias įžvalgas apie aplikacijų našumą, prieinamumą ir naudojimą.

**Azure CLI**  
Komandinės eilutės sąsaja Azure resursų valdymui. Naudojama azd autentifikacijai ir kai kurioms operacijoms.

**Azure Developer CLI (azd)**  
Vystymo orientuotas komandinės eilutės įrankis, kuris pagreitina aplikacijų kūrimo ir diegimo procesą Azure naudojant šablonus ir infrastruktūrą kaip kodą.

**azure.yaml**  
Pagrindinis azd projekto konfigūracijos failas, apibrėžiantis paslaugas, infrastruktūrą ir diegimo veiksmus.

**Azure Resource Manager (ARM)**  
Azure diegimo ir valdymo paslauga, teikianti valdymo sluoksnį resursų kūrimui, atnaujinimui ir šalinimui.

## B

**Bicep**  
Microsoft sukurta domeno specifinė kalba (DSL), skirta Azure resursų diegimui. Pateikia paprastesnę sintaksę nei ARM šablonai, kompiliuojant į ARM.

**Build**  
Procesas, kurio metu kompiliuojamas šaltinio kodas, įdiegiamos priklausomybės ir paruošiamos aplikacijos diegimui.

**Blue-Green Deployment**  
Diegimo strategija, naudojanti dvi identiškas gamybos aplinkas (mėlyną ir žalią), siekiant sumažinti prastovas ir riziką.

## C

**Container Apps**  
Azure serverless konteinerių paslauga, leidžianti paleisti konteinerizuotas aplikacijas be sudėtingos infrastruktūros valdymo.

**CI/CD**  
Nuolatinė integracija/nuolatinis diegimas. Automatizuotos praktikos, skirtos kodo pakeitimų integravimui ir aplikacijų diegimui.

**Cosmos DB**  
Azure globaliai paskirstyta, daugiamodelinė duomenų bazės paslauga, teikianti išsamias SLA dėl pralaidumo, vėlavimo, prieinamumo ir nuoseklumo.

**Konfigūracija**  
Nustatymai ir parametrai, kontroliuojantys aplikacijos elgesį ir diegimo parinktis.

## D

**Diegimas**  
Procesas, kurio metu aplikacijos ir jų priklausomybės įdiegiamos ir konfigūruojamos tikslinėje infrastruktūroje.

**Docker**  
Platforma aplikacijų kūrimui, pristatymui ir paleidimui naudojant konteinerizacijos technologiją.

**Dockerfile**  
Tekstinis failas, kuriame pateikiamos instrukcijos Docker konteinerio vaizdo kūrimui.

## E

**Aplinka**  
Diegimo tikslas, atspindintis specifinę jūsų aplikacijos instanciją (pvz., vystymo, testavimo, gamybos).

**Aplinkos kintamieji**  
Konfigūracijos reikšmės, saugomos kaip raktų-reikšmių poros, kurias aplikacijos gali pasiekti vykdymo metu.

**Endpoint**  
URL arba tinklo adresas, kuriame galima pasiekti aplikaciją ar paslaugą.

## F

**Function App**  
Azure serverless skaičiavimo paslauga, leidžianti paleisti įvykių pagrindu veikiančius kodus be infrastruktūros valdymo.

## G

**GitHub Actions**  
CI/CD platforma, integruota su GitHub saugyklomis, skirta darbo eigų automatizavimui.

**Git**  
Paskirstyta versijų kontrolės sistema, naudojama šaltinio kodo pakeitimų sekimui.

## H

**Hooks**  
Individualūs scenarijai ar komandos, vykdomos tam tikruose diegimo gyvavimo ciklo taškuose (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Azure paslaugos tipas, kuriame bus diegiama aplikacija (pvz., appservice, containerapp, function).

## I

**Infrastruktūra kaip kodas (IaC)**  
Praktika, kai infrastruktūra apibrėžiama ir valdoma per kodą, o ne rankiniu būdu.

**Init**  
Procesas, kurio metu inicijuojamas naujas azd projektas, paprastai iš šablono.

## J

**JSON**  
JavaScript Object Notation. Duomenų mainų formatas, dažnai naudojamas konfigūracijos failams ir API atsakymams.

**JWT**  
JSON Web Token. Standartas saugiam informacijos perdavimui tarp šalių kaip JSON objektas.

## K

**Key Vault**  
Azure paslauga, skirta saugiam paslapčių, raktų ir sertifikatų saugojimui ir valdymui.

**Kusto Query Language (KQL)**  
Užklausų kalba, naudojama duomenų analizei Azure Monitor, Application Insights ir kitose Azure paslaugose.

## L

**Load Balancer**  
Paslauga, paskirstanti įeinantį tinklo srautą tarp kelių serverių ar instancijų.

**Log Analytics**  
Azure paslauga, skirta telemetrijos duomenų rinkimui, analizei ir veiksmų atlikimui.

## M

**Managed Identity**  
Azure funkcija, suteikianti Azure paslaugoms automatiškai valdomą identitetą autentifikacijai kitose Azure paslaugose.

**Microservices**  
Architektūrinis požiūris, kai aplikacijos kuriamos kaip mažų, nepriklausomų paslaugų rinkinys.

**Monitor**  
Azure vieninga stebėjimo sprendimas, teikiantis pilną stebėjimą per aplikacijas ir infrastruktūrą.

## N

**Node.js**  
JavaScript vykdymo aplinka, sukurta ant Chrome V8 JavaScript variklio, skirta serverio pusės aplikacijų kūrimui.

**npm**  
Node.js paketų tvarkyklė, valdanti priklausomybes ir paketus.

## O

**Output**  
Reikšmės, grąžinamos infrastruktūros diegimo metu, kurios gali būti naudojamos aplikacijose ar kituose resursuose.

## P

**Package**  
Procesas, kurio metu paruošiamas aplikacijos kodas ir priklausomybės diegimui.

**Parametrai**  
Įvesties reikšmės, perduodamos infrastruktūros šablonams, siekiant pritaikyti diegimus.

**PostgreSQL**  
Atvirojo kodo reliacinė duomenų bazės sistema, palaikoma kaip valdomoji paslauga Azure.

**Provisioning**  
Procesas, kurio metu kuriami ir konfigūruojami Azure resursai, apibrėžti infrastruktūros šablonuose.

## Q

**Quota**  
Resursų kiekio, kurį galima sukurti Azure prenumeratoje ar regione, apribojimai.

## R

**Resource Group**  
Logiškas Azure resursų konteineris, turintis bendrą gyvavimo ciklą, leidimus ir politiką.

**Resource Token**  
Unikalus eilutės kodas, generuojamas azd, siekiant užtikrinti resursų pavadinimų unikalumą diegimuose.

**REST API**  
Architektūrinis stilius tinklo aplikacijų kūrimui naudojant HTTP metodus.

**Rollback**  
Procesas, kurio metu grįžtama prie ankstesnės aplikacijos ar infrastruktūros konfigūracijos versijos.

## S

**Paslauga**  
Komponentas jūsų aplikacijoje, apibrėžtas azure.yaml (pvz., interneto sąsaja, API užkulisiai, duomenų bazė).

**SKU**  
Prekės kodas. Atspindi skirtingus paslaugų lygius ar našumo lygius Azure resursams.

**SQL Database**  
Azure valdomoji reliacinė duomenų bazės paslauga, pagrįsta Microsoft SQL Server.

**Static Web Apps**  
Azure paslauga, skirta pilno funkcionalumo interneto aplikacijų kūrimui ir diegimui iš šaltinio kodo saugyklų.

**Storage Account**  
Azure paslauga, teikianti debesų saugyklą duomenų objektams, įskaitant blobus, failus, eilutes ir lenteles.

**Prenumerata**  
Azure paskyros konteineris, kuriame saugomi resursų grupės ir resursai, su susijusiu atsiskaitymu ir prieigos valdymu.

## T

**Šablonas**  
Iš anksto sukurtas projekto struktūra, turinti aplikacijos kodą, infrastruktūros apibrėžimus ir konfigūraciją bendriems scenarijams.

**Terraform**  
Atvirojo kodo infrastruktūros kaip kodo įrankis, palaikantis kelis debesų tiekėjus, įskaitant Azure.

**Traffic Manager**  
Azure DNS pagrindu veikiantis srauto apkrovos balansavimo įrankis, skirtas srauto paskirstymui tarp globalių Azure regionų.

## U

**URI**  
Vieningas resurso identifikatorius. Eilutė, identifikuojanti konkretų resursą.

**URL**  
Vieningas resurso lokatorius. URI tipas, nurodantis, kur resursas yra ir kaip jį pasiekti.

## V

**Virtual Network (VNet)**  
Pagrindinis Azure privačių tinklų kūrimo blokas, teikiantis izoliaciją ir segmentaciją.

**VS Code**  
Visual Studio Code. Populiarus kodo redaktorius su puikia Azure ir azd integracija.

## W

**Webhook**  
HTTP atgalinis skambutis, aktyvuojamas specifiniais įvykiais, dažnai naudojamas CI/CD procesuose.

**What-if**  
Azure funkcija, rodanti, kokie pakeitimai būtų atlikti diegimo metu, jų neįvykdant.

## Y

**YAML**  
YAML Ain't Markup Language. Žmogui suprantamas duomenų serializacijos standartas, naudojamas konfigūracijos failams, pvz., azure.yaml.

## Z

**Zona**  
Fiziškai atskirtos vietos Azure regione, teikiančios redundanciją ir aukštą prieinamumą.

---

## Dažniausiai naudojami akronimai

| Akronimas | Pilnas pavadinimas | Aprašymas |  
|-----------|--------------------|-----------|  
| AAD | Azure Active Directory | Tapatybės ir prieigos valdymo paslauga |  
| ACR | Azure Container Registry | Konteinerių vaizdų registravimo paslauga |  
| AKS | Azure Kubernetes Service | Valdomoji Kubernetes paslauga |  
| API | Application Programming Interface | Protokolų rinkinys programinės įrangos kūrimui |  
| ARM | Azure Resource Manager | Azure diegimo ir valdymo paslauga |  
| CDN | Content Delivery Network | Paskirstytas serverių tinklas |  
| CI/CD | Continuous Integration/Continuous Deployment | Automatizuotos vystymo praktikos |  
| CLI | Command Line Interface | Teksto pagrindu veikianti vartotojo sąsaja |  
| DNS | Domain Name System | Sistema domenų vardų vertimui į IP adresus |  
| HTTPS | Hypertext Transfer Protocol Secure | Saugus HTTP versija |  
| IaC | Infrastructure as Code | Infrastruktūros valdymas per kodą |  
| JSON | JavaScript Object Notation | Duomenų mainų formatas |  
| JWT | JSON Web Token | Tokenų formatas saugiam informacijos perdavimui |  
| KQL | Kusto Query Language | Užklausų kalba Azure duomenų paslaugoms |  
| RBAC | Role-Based Access Control | Prieigos kontrolės metodas pagal vartotojų roles |  
| REST | Representational State Transfer | Architektūrinis stilius interneto paslaugoms |  
| SDK | Software Development Kit | Vystymo įrankių rinkinys |  
| SLA | Service Level Agreement | Įsipareigojimas dėl paslaugos prieinamumo/našumo |  
| SQL | Structured Query Language | Kalba reliacinių duomenų bazių valdymui |  
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Kriptografiniai protokolai |  
| URI | Uniform Resource Identifier | Eilutė, identifikuojanti resursą |  
| URL | Uniform Resource Locator | URI tipas, nurodantis resurso vietą |  
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

### Vystymo terminai  
- **Hot Reload**: Automatinis aplikacijų atnaujinimas vystymo metu be perkrovimo  
- **Build Pipeline**: Automatizuotas kodo kūrimo ir testavimo procesas  
- **Deployment Slot**: Testavimo aplinka App Service viduje  
- **Environment Parity**: Vystymo, testavimo ir gamybos aplinkų panašumo palaikymas  

### Saugumo terminai  
- **Managed Identity**: Azure funkcija, teikianti automatinį kredencialų valdymą  
- **Key Vault**: Saugus saugojimas paslaptims, raktams ir sertifikatams  
- **RBAC**: Rolėmis pagrįsta prieigos kontrolė Azure resursams  
- **Network Security Group**: Virtualus ugniasienė tinklo srauto valdymui  

### Stebėjimo terminai  
- **Telemetry**: Automatinis matavimų ir duomenų rinkimas  
- **Application Performance Monitoring (APM)**: Aplikacijų našumo stebėjimas  
- **Log Analytics**: Paslauga logų duomenų rinkimui ir analizei  
- **Alert Rules**: Automatiniai pranešimai pagal metrikas ar sąlygas  

### Diegimo termin

---

**Atsakomybės apribojimas**:  
Šis dokumentas buvo išverstas naudojant AI vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Kritinei informacijai rekomenduojama naudoti profesionalų žmogaus vertimą. Mes neprisiimame atsakomybės už nesusipratimus ar klaidingus interpretavimus, atsiradusius dėl šio vertimo naudojimo.