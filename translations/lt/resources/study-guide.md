# Studijų vadovas - Išsamūs mokymosi tikslai

**Mokymosi kelio navigacija**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../README.md)
- **📖 Pradėkite mokytis**: [1 skyrius: Pagrindai ir greitas startas](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Progreso sekimas**: [Kurso užbaigimas](../README.md#-course-completion--certification)

## Įvadas

Šis išsamus studijų vadovas pateikia struktūrizuotus mokymosi tikslus, pagrindines sąvokas, praktinius pratimus ir vertinimo medžiagą, kad padėtų jums įvaldyti Azure Developer CLI (azd). Naudokite šį vadovą, kad stebėtumėte savo pažangą ir užtikrintumėte, jog apėmėte visas svarbiausias temas.

## Mokymosi tikslai

Baigę šį studijų vadovą, jūs:
- Įvaldysite visus pagrindinius ir pažangius Azure Developer CLI konceptus
- Išsiugdysite praktinius įgūdžius diegiant ir valdant Azure aplikacijas
- Įgysite pasitikėjimo sprendžiant problemas ir optimizuojant diegimus
- Suprasite pasiruošimo gamybai diegimo praktikas ir saugumo aspektus

## Mokymosi rezultatai

Baigę visas šio studijų vadovo dalis, jūs galėsite:
- Kurti, diegti ir valdyti pilnas aplikacijų architektūras naudojant azd
- Įgyvendinti išsamias stebėjimo, saugumo ir kaštų optimizavimo strategijas
- Savarankiškai spręsti sudėtingas diegimo problemas
- Kurti individualius šablonus ir prisidėti prie azd bendruomenės

## 8 skyrių mokymosi struktūra

### 1 skyrius: Pagrindai ir greitas startas (1 savaitė)
**Trukmė**: 30-45 minutės | **Sudėtingumas**: ⭐

#### Mokymosi tikslai
- Suprasti Azure Developer CLI pagrindines sąvokas ir terminologiją
- Sėkmingai įdiegti ir sukonfigūruoti AZD savo kūrimo platformoje
- Pirmą kartą diegti aplikaciją naudojant esamą šabloną
- Efektyviai naršyti AZD komandų eilutės sąsajoje

#### Pagrindinės sąvokos, kurias reikia įvaldyti
- AZD projekto struktūra ir komponentai (azure.yaml, infra/, src/)
- Diegimo darbo eiga pagal šablonus
- Aplinkos konfigūracijos pagrindai
- Išteklių grupės ir prenumeratos valdymas

#### Praktiniai pratimai
1. **Diegimo patikrinimas**: Įdiekite AZD ir patikrinkite su `azd version`
2. **Pirmasis diegimas**: Sėkmingai diekite todo-nodejs-mongo šabloną
3. **Aplinkos nustatymas**: Konfigūruokite savo pirmuosius aplinkos kintamuosius
4. **Išteklių tyrinėjimas**: Naršykite diegtus išteklius Azure portale

#### Vertinimo klausimai
- Kokie yra pagrindiniai AZD projekto komponentai?
- Kaip inicijuoti naują projektą iš šablono?
- Kuo skiriasi `azd up` ir `azd deploy`?
- Kaip valdyti kelias aplinkas naudojant AZD?

---

### 2 skyrius: AI-pirmasis vystymas (2 savaitė)
**Trukmė**: 1-2 valandos | **Sudėtingumas**: ⭐⭐

#### Mokymosi tikslai
- Integruoti Microsoft Foundry paslaugas su AZD darbo eiga
- Diegti ir konfigūruoti AI pagrįstas aplikacijas
- Suprasti RAG (Retrieval-Augmented Generation) įgyvendinimo modelius
- Valdyti AI modelių diegimus ir mastelio keitimą

#### Pagrindinės sąvokos, kurias reikia įvaldyti
- Azure OpenAI paslaugų integracija ir API valdymas
- AI paieškos konfigūracija ir vektorinė indeksacija
- Modelių diegimo strategijos ir pajėgumų planavimas
- AI aplikacijų stebėjimas ir našumo optimizavimas

#### Praktiniai pratimai
1. **AI pokalbio diegimas**: Diekite azure-search-openai-demo šabloną
2. **RAG įgyvendinimas**: Konfigūruokite dokumentų indeksaciją ir paiešką
3. **Modelio konfigūracija**: Nustatykite kelis AI modelius skirtingiems tikslams
4. **AI stebėjimas**: Įgyvendinkite Application Insights AI darbo krūviams

#### Vertinimo klausimai
- Kaip konfigūruoti Azure OpenAI paslaugas AZD šablone?
- Kokie yra pagrindiniai RAG architektūros komponentai?
- Kaip valdyti AI modelių pajėgumus ir mastelio keitimą?
- Kokie stebėjimo rodikliai yra svarbūs AI aplikacijoms?

---

### 3 skyrius: Konfigūracija ir autentifikacija (3 savaitė)
**Trukmė**: 45-60 minutės | **Sudėtingumas**: ⭐⭐

#### Mokymosi tikslai
- Įvaldyti aplinkos konfigūracijos ir valdymo strategijas
- Įgyvendinti saugius autentifikacijos modelius ir valdomą identitetą
- Organizuoti išteklius naudojant tinkamus pavadinimų konvencijas
- Konfigūruoti kelių aplinkų diegimus (dev, staging, prod)

#### Pagrindinės sąvokos, kurias reikia įvaldyti
- Aplinkos hierarchija ir konfigūracijos prioritetai
- Valdomas identitetas ir paslaugų principų autentifikacija
- Key Vault integracija slaptažodžių valdymui
- Aplinkos specifinių parametrų valdymas

#### Praktiniai pratimai
1. **Kelių aplinkų nustatymas**: Konfigūruokite dev, staging ir prod aplinkas
2. **Saugumo konfigūracija**: Įgyvendinkite valdomo identiteto autentifikaciją
3. **Slaptažodžių valdymas**: Integruokite Azure Key Vault jautriems duomenims
4. **Parametrų valdymas**: Sukurkite aplinkos specifines konfigūracijas

#### Vertinimo klausimai
- Kaip konfigūruoti skirtingas aplinkas naudojant AZD?
- Kokie yra valdomo identiteto privalumai, palyginti su paslaugų principais?
- Kaip saugiai valdyti aplikacijų slaptažodžius?
- Kokia yra AZD konfigūracijos hierarchija?

---

### 4 skyrius: Infrastruktūra kaip kodas ir diegimas (4-5 savaitė)
**Trukmė**: 1-1,5 valandos | **Sudėtingumas**: ⭐⭐⭐

#### Mokymosi tikslai
- Kurti ir pritaikyti Bicep infrastruktūros šablonus
- Įgyvendinti pažangius diegimo modelius ir darbo eigas
- Suprasti išteklių teikimo strategijas
- Kurti mastelio keičiamas kelių paslaugų architektūras

- Diegti konteinerizuotas aplikacijas naudojant Azure Container Apps ir AZD

#### Pagrindinės sąvokos, kurias reikia įvaldyti
- Bicep šablonų struktūra ir geriausios praktikos
- Išteklių priklausomybės ir diegimo tvarka
- Parametrų failai ir šablonų moduliškumas
- Individualūs kabliukai ir diegimo automatizavimas
- Konteinerių aplikacijų diegimo modeliai (greitas startas, gamyba, mikroservisai)

#### Praktiniai pratimai
1. **Individualaus šablono kūrimas**: Sukurkite kelių paslaugų aplikacijos šabloną
2. **Bicep įvaldymas**: Sukurkite moduliškus, pakartotinai naudojamus infrastruktūros komponentus
3. **Diegimo automatizavimas**: Įgyvendinkite prieš/po diegimo kabliukus
4. **Architektūros dizainas**: Diekite sudėtingą mikroservisų architektūrą
5. **Konteinerių aplikacijų diegimas**: Diekite [Simple Flask API](../../../examples/container-app/simple-flask-api) ir [Microservices Architecture](../../../examples/container-app/microservices) pavyzdžius naudodami AZD

#### Vertinimo klausimai
- Kaip sukurti individualius Bicep šablonus AZD?
- Kokios yra geriausios praktikos infrastruktūros kodo organizavimui?
- Kaip tvarkyti išteklių priklausomybes šablonuose?
- Kokie diegimo modeliai palaiko diegimus be prastovų?

---

### 5 skyrius: Daugiaagentės AI sprendimai (6-7 savaitė)
**Trukmė**: 2-3 valandos | **Sudėtingumas**: ⭐⭐⭐⭐

#### Mokymosi tikslai
- Kurti ir įgyvendinti daugiaagentės AI architektūras
- Koordinuoti agentų bendradarbiavimą ir komunikaciją
- Diegti gamybai paruoštus AI sprendimus su stebėjimu
- Suprasti agentų specializaciją ir darbo modelius
- Integruoti konteinerizuotus mikroservisus kaip daugiaagentės sprendimų dalį

#### Pagrindinės sąvokos, kurias reikia įvaldyti
- Daugiaagentės architektūros modeliai ir dizaino principai
- Agentų komunikacijos protokolai ir duomenų srautas
- Apkrovos balansavimas ir mastelio keitimo strategijos AI agentams
- Gamybos stebėjimas daugiaagentėms sistemoms
- Paslaugų komunikacija konteinerizuotose aplinkose

#### Praktiniai pratimai
1. **Mažmeninės prekybos sprendimo diegimas**: Diekite pilną daugiaagentės mažmeninės prekybos scenarijų
2. **Agentų pritaikymas**: Modifikuokite Kliento ir Inventoriaus agentų elgesį
3. **Architektūros mastelio keitimas**: Įgyvendinkite apkrovos balansavimą ir automatinį mastelio keitimą
4. **Gamybos stebėjimas**: Nustatykite išsamų stebėjimą ir įspėjimus
5. **Mikroservisų integracija**: Išplėskite [Microservices Architecture](../../../examples/container-app/microservices) pavyzdį, kad palaikytų agentų darbo eigas

#### Vertinimo klausimai
- Kaip sukurti efektyvius daugiaagentės komunikacijos modelius?
- Kokie yra pagrindiniai AI agentų darbo krūvių mastelio keitimo aspektai?
- Kaip stebėti ir šalinti daugiaagentės AI sistemos problemas?
- Kokie gamybos modeliai užtikrina AI agentų patikimumą?

---

### 6 skyrius: Prieš diegimą patikra ir planavimas (8 savaitė)
**Trukmė**: 1 valanda | **Sudėtingumas**: ⭐⭐

#### Mokymosi tikslai
- Atlikti išsamų pajėgumų planavimą ir išteklių patikrą
- Pasirinkti optimalias Azure SKUs kaštų efektyvumui
- Įgyvendinti automatizuotus patikrinimus prieš diegimą
- Planuoti diegimus su kaštų optimizavimo strategijomis

#### Pagrindinės sąvokos, kurias reikia įvaldyti
- Azure išteklių kvotos ir pajėgumų apribojimai
- SKU pasirinkimo kriterijai ir kaštų optimizavimas
- Automatizuoti patikrinimo scenarijai ir testavimas
- Diegimo planavimas ir rizikos vertinimas

#### Praktiniai pratimai
1. **Pajėgumų analizė**: Analizuokite savo aplikacijų išteklių reikalavimus
2. **SKU optimizavimas**: Palyginkite ir pasirinkite kaštų efektyvius paslaugų lygius
3. **Patikrinimo automatizavimas**: Įgyvendinkite patikrinimo scenarijus prieš diegimą
4. **Kaštų planavimas**: Sukurkite diegimo kaštų įvertinimus ir biudžetus

#### Vertinimo klausimai
- Kaip patikrinti Azure pajėgumus prieš diegimą?
- Kokie veiksniai lemia SKU pasirinkimo sprendimus?
- Kaip automatizuoti patikrinimus prieš diegimą?
- Kokios strategijos padeda optimizuoti diegimo kaštus?

---

### 7 skyrius: Problemų sprendimas ir derinimas (9 savaitė)
**Trukmė**: 1-1,5 valandos | **Sudėtingumas**: ⭐⭐

#### Mokymosi tikslai
- Sukurti sistemingus derinimo metodus AZD diegimams
- Spręsti dažniausiai pasitaikančias diegimo ir konfigūracijos problemas
- Derinti AI specifines problemas ir našumo klausimus
- Įgyvendinti stebėjimą ir įspėjimus, kad proaktyviai aptiktumėte problemas

#### Pagrindinės sąvokos, kurias reikia įvaldyti
- Diagnostikos technikos ir žurnalų strategijos
- Dažniausiai pasitaikančios gedimų modeliai ir jų sprendimai
- Našumo stebėjimas ir optimizavimas
- Incidentų valdymo ir atkūrimo procedūros

#### Praktiniai pratimai
1. **Diagnostikos įgūdžiai**: Praktikuokitės su tyčia sugadintais diegimais
2. **Žurnalų analizė**: Efektyviai naudokite Azure Monitor ir Application Insights
3. **Našumo derinimas**: Optimizuokite lėtai veikiančias aplikacijas
4. **Atkūrimo procedūros**: Įgyvendinkite atsarginių kopijų ir nelaimių atkūrimą

#### Vertinimo klausimai
- Kokie yra dažniausiai pasitaikantys AZD diegimo gedimai?
- Kaip derinti autentifikacijos ir leidimų problemas?
- Kokios stebėjimo strategijos padeda išvengti gamybos problemų?
- Kaip optimizuoti aplikacijų našumą Azure?

---

### 8 skyrius: Gamybos ir įmonės modeliai (10-11 savaitė)
**Trukmė**: 2-3 valandos | **Sudėtingumas**: ⭐⭐⭐⭐

#### Mokymosi tikslai
- Įgyvendinti įmonės lygio diegimo strategijas
- Kurti saugumo modelius ir atitikties sistemas
- Nustatyti stebėjimą, valdymą ir kaštų valdymą
- Sukurti mastelio keičiamas CI/CD darbo eigas su AZD integracija
- Taikyti geriausias praktikas gamybos konteinerių aplikacijų diegimui (saugumas, stebėjimas, kaštai, CI/CD)

#### Pagrindinės sąvokos, kurias reikia įvaldyti
- Įmonės saugumo ir atitikties reikalavimai
- Valdymo sistemos ir politikos įgyvendinimas
- Pažangus stebėjimas ir kaštų valdymas
- CI/CD integracija ir automatizuotos diegimo darbo eigos
- Blue-green ir canary diegimo modeliai konteinerizuotoms darbo apkrovoms

#### Praktiniai pratimai
1. **Įmonės saugumas**: Įgyvendinkite išsamius saugumo modelius
2. **Valdymo sistema**: Nustatykite Azure Policy ir išteklių valdymą
3. **Pažangus stebėjimas**: Sukurkite prietaisų skydelius ir automatizuotus įspėjimus
4. **CI/CD integracija**: Sukurkite automatizuotas diegimo darbo eigas
5. **Gamybos konteinerių aplikacijos**: Taikykite saugumo, stebėjimo ir kaštų optimizavimą [Microservices Architecture](../../../examples/container-app/microservices) pavyzdžiui

#### Vertinimo klausimai
- Kaip įgyvendinti įmonės saugumą AZD diegimuose?
- Kokie valdymo modeliai užtikrina atitiktį ir kaštų kontrolę?
- Kaip sukurti mastelio keičiamą stebėjimą gamybos sistemoms?
- Kokie CI/CD modeliai geriausiai veikia su AZD darbo eiga?

#### Mokymosi tikslai
- Suprasti Azure Developer CLI
5. Kokie aspektai svarbūs diegiant sprendimus keliuose regionuose?

### 4 modulis: Diegimo patikrinimas prieš paleidimą (5 savaitė)

#### Mokymosi tikslai
- Įgyvendinti išsamius patikrinimus prieš diegimą
- Tobulinti pajėgumų planavimą ir išteklių patikrinimą
- Suprasti SKU pasirinkimą ir kaštų optimizavimą
- Kurti automatizuotas patikrinimo sistemas

#### Pagrindinės sąvokos
- „Azure“ išteklių kvotos ir limitai
- SKU pasirinkimo kriterijai ir kaštų pasekmės
- Automatizuoti patikrinimo scenarijai ir įrankiai
- Pajėgumų planavimo metodologijos
- Našumo testavimas ir optimizavimas

#### Praktinės užduotys

**Užduotis 4.1: Pajėgumų planavimas**  
```bash
# Įgyvendinti talpos patvirtinimą:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```
  
**Užduotis 4.2: Patikrinimas prieš paleidimą**  
```powershell
# Sukurkite išsamų validacijos procesą:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```
  
**Užduotis 4.3: SKU optimizavimas**  
```bash
# Optimizuokite paslaugų konfigūracijas:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```
  

#### Savarankiško vertinimo klausimai
1. Kokie veiksniai turėtų lemti SKU pasirinkimo sprendimus?
2. Kaip patikrinti „Azure“ išteklių prieinamumą prieš diegimą?
3. Kokie yra pagrindiniai patikrinimo prieš paleidimą sistemos komponentai?
4. Kaip apskaičiuoti ir kontroliuoti diegimo kaštus?
5. Kokie stebėjimo aspektai yra būtini pajėgumų planavimui?

### 5 modulis: Trikčių šalinimas ir klaidų taisymas (6 savaitė)

#### Mokymosi tikslai
- Įvaldyti sistemingus trikčių šalinimo metodus
- Tobulinti sudėtingų diegimo problemų taisymo įgūdžius
- Įgyvendinti išsamų stebėjimą ir įspėjimus
- Kurti incidentų valdymo ir atkūrimo procedūras

#### Pagrindinės sąvokos
- Dažniausi diegimo klaidų modeliai
- Žurnalų analizės ir koreliacijos technikos
- Našumo stebėjimas ir optimizavimas
- Saugumo incidentų aptikimas ir reagavimas
- Atsigavimas po nelaimių ir verslo tęstinumas

#### Praktinės užduotys

**Užduotis 5.1: Trikčių šalinimo scenarijai**  
```bash
# Praktikuokite spręsti dažnas problemas:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```
  
**Užduotis 5.2: Stebėjimo įgyvendinimas**  
```bash
# Nustatykite išsamų stebėjimą:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```
  
**Užduotis 5.3: Incidentų valdymas**  
```bash
# Sukurkite incidentų reagavimo procedūras:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```
  

#### Savarankiško vertinimo klausimai
1. Koks yra sistemingas požiūris į azd diegimų trikčių šalinimą?
2. Kaip koreliuoti žurnalus tarp kelių paslaugų ir išteklių?
3. Kokie stebėjimo rodikliai yra svarbiausi ankstyvam problemų aptikimui?
4. Kaip įgyvendinti veiksmingas atkūrimo po nelaimių procedūras?
5. Kokie yra pagrindiniai incidentų valdymo plano komponentai?

### 6 modulis: Pažangios temos ir geriausios praktikos (7-8 savaitės)

#### Mokymosi tikslai
- Įgyvendinti įmonės lygio diegimo modelius
- Tobulinti CI/CD integraciją ir automatizavimą
- Kurti individualizuotus šablonus ir prisidėti prie bendruomenės
- Suprasti pažangius saugumo ir atitikties reikalavimus

#### Pagrindinės sąvokos
- CI/CD sistemos integracijos modeliai
- Individualizuotų šablonų kūrimas ir platinimas
- Įmonės valdymas ir atitiktis
- Pažangūs tinklo ir saugumo konfigūracijos
- Našumo optimizavimas ir kaštų valdymas

#### Praktinės užduotys

**Užduotis 6.1: CI/CD integracija**  
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```
  
**Užduotis 6.2: Individualizuotų šablonų kūrimas**  
```bash
# Kurkite ir publikuokite pasirinktinius šablonus:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```
  
**Užduotis 6.3: Įmonės įgyvendinimas**  
```bash
# Įgyvendinti įmonės lygio funkcijas:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```
  

#### Savarankiško vertinimo klausimai
1. Kaip integruoti azd į esamus CI/CD darbo procesus?
2. Kokie yra pagrindiniai aspektai kuriant individualizuotus šablonus?
3. Kaip įgyvendinti valdymą ir atitiktį azd diegimuose?
4. Kokios yra geriausios praktikos diegiant įmonės mastu?
5. Kaip efektyviai prisidėti prie azd bendruomenės?

## Praktiniai projektai

### Projektas 1: Asmeninis portfolio tinklalapis  
**Sudėtingumas**: Pradedantysis  
**Trukmė**: 1-2 savaitės  

Sukurkite ir įdiekite asmeninį portfolio tinklalapį naudodami:  
- Statinio tinklalapio talpinimą „Azure Storage“  
- Individualizuoto domeno konfigūraciją  
- CDN integraciją globaliam našumui  
- Automatizuotą diegimo sistemą  

**Rezultatai**:  
- Veikiantis tinklalapis, įdiegtas „Azure“  
- Individualizuotas azd šablonas portfolio diegimams  
- Diegimo proceso dokumentacija  
- Kaštų analizė ir optimizavimo rekomendacijos  

### Projektas 2: Užduočių valdymo programa  
**Sudėtingumas**: Vidutinis  
**Trukmė**: 2-3 savaitės  

Sukurkite pilnos apimties užduočių valdymo programą su:  
- „React“ frontendu, įdiegtu „App Service“  
- „Node.js“ API backendu su autentifikacija  
- „PostgreSQL“ duomenų baze ir migracijomis  
- „Application Insights“ stebėjimu  

**Rezultatai**:  
- Pilna programa su vartotojų autentifikacija  
- Duomenų bazės schema ir migracijos scenarijai  
- Stebėjimo skydeliai ir įspėjimų taisyklės  
- Kelių aplinkų diegimo konfigūracija  

### Projektas 3: Mikroservisų e-komercijos platforma  
**Sudėtingumas**: Pažangus  
**Trukmė**: 4-6 savaitės  

Sukurkite ir įgyvendinkite mikroservisų pagrindu veikiančią e-komercijos platformą:  
- Keli API servisai (katalogas, užsakymai, mokėjimai, vartotojai)  
- Žinučių eilės integracija su „Service Bus“  
- „Redis“ talpykla našumo optimizavimui  
- Išsamus žurnalų ir stebėjimo sprendimas  

**Pavyzdys**: Žr. [Mikroservisų architektūra](../../../examples/container-app/microservices) dėl gamybai paruošto šablono ir diegimo vadovo  

**Rezultatai**:  
- Pilna mikroservisų architektūra  
- Tarpservisinės komunikacijos modeliai  
- Našumo testavimas ir optimizavimas  
- Gamybai paruošta saugumo įgyvendinimas  

## Vertinimas ir sertifikavimas

### Žinių patikrinimai

Atlikite šiuos vertinimus po kiekvieno modulio:

**1 modulio vertinimas**: Pagrindinės sąvokos ir diegimas  
- Pasirinkimo klausimai apie pagrindines sąvokas  
- Praktinės diegimo ir konfigūracijos užduotys  
- Paprasta diegimo užduotis  

**2 modulio vertinimas**: Konfigūracija ir aplinkos  
- Aplinkos valdymo scenarijai  
- Konfigūracijos trikčių šalinimo užduotys  
- Saugumo konfigūracijos įgyvendinimas  

**3 modulio vertinimas**: Diegimas ir išteklių paruošimas  
- Infrastruktūros projektavimo iššūkiai  
- Kelių paslaugų diegimo scenarijai  
- Našumo optimizavimo užduotys  

**4 modulio vertinimas**: Diegimo patikrinimas prieš paleidimą  
- Pajėgumų planavimo atvejų analizės  
- Kaštų optimizavimo scenarijai  
- Patikrinimo sistemų įgyvendinimas  

**5 modulio vertinimas**: Trikčių šalinimas ir klaidų taisymas  
- Problemų diagnozavimo užduotys  
- Stebėjimo įgyvendinimo užduotys  
- Incidentų valdymo simuliacijos  

**6 modulio vertinimas**: Pažangios temos  
- CI/CD sistemos projektavimas  
- Individualizuotų šablonų kūrimas  
- Įmonės architektūros scenarijai  

### Galutinis projektas

Sukurkite ir įgyvendinkite pilną sprendimą, kuris demonstruoja visų sąvokų įvaldymą:

**Reikalavimai**:  
- Daugiasluoksnė programos architektūra  
- Keli diegimo aplinkos  
- Išsamus stebėjimas ir įspėjimai  
- Saugumo ir atitikties įgyvendinimas  
- Kaštų optimizavimas ir našumo derinimas  
- Pilna dokumentacija ir veiklos vadovai  

**Vertinimo kriterijai**:  
- Techninio įgyvendinimo kokybė  
- Dokumentacijos išsamumas  
- Saugumo ir geriausių praktikų laikymasis  
- Našumo ir kaštų optimizavimas  
- Trikčių šalinimo ir stebėjimo efektyvumas  

## Mokymosi ištekliai ir nuorodos

### Oficialūs dokumentai
- [Azure Developer CLI dokumentacija](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Bicep dokumentacija](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure architektūros centras](https://learn.microsoft.com/en-us/azure/architecture/)  

### Bendruomenės ištekliai
- [AZD šablonų galerija](https://azure.github.io/awesome-azd/)  
- [Azure-Samples GitHub organizacija](https://github.com/Azure-Samples)  
- [Azure Developer CLI GitHub saugykla](https://github.com/Azure/azure-dev)  

### Praktinės aplinkos
- [Azure nemokama paskyra](https://azure.microsoft.com/free/)  
- [Azure DevOps nemokamas planas](https://azure.microsoft.com/services/devops/)  
- [GitHub Actions](https://github.com/features/actions)  

### Papildomi įrankiai
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)  
- [Visual Studio Code](https://code.visualstudio.com/)  
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)  

## Mokymosi grafiko rekomendacijos

### Pilno laiko mokymasis (8 savaitės)
- **1-2 savaitės**: 1-2 moduliai (Pradžia, Konfigūracija)  
- **3-4 savaitės**: 3-4 moduliai (Diegimas, Patikrinimas prieš paleidimą)  
- **5-6 savaitės**: 5-6 moduliai (Trikčių šalinimas, Pažangios temos)  
- **7-8 savaitės**: Praktiniai projektai ir galutinis vertinimas  

### Dalinio laiko mokymasis (16 savaičių)
- **1-4 savaitės**: 1 modulis (Pradžia)  
- **5-7 savaitės**: 2 modulis (Konfigūracija ir aplinkos)  
- **8-10 savaitės**: 3 modulis (Diegimas ir išteklių paruošimas)  
- **11-12 savaitės**: 4 modulis (Patikrinimas prieš paleidimą)  
- **13-14 savaitės**: 5 modulis (Trikčių šalinimas ir klaidų taisymas)  
- **15-16 savaitės**: 6 modulis (Pažangios temos ir vertinimas)  

---

## Progreso stebėjimas ir vertinimo sistema

### Skyrių užbaigimo kontrolinis sąrašas

Stebėkite savo progresą kiekviename skyriuje pagal šiuos pasiekiamus rezultatus:

#### 📚 1 skyrius: Pagrindai ir greitas startas  
- [ ] **Diegimas baigtas**: AZD įdiegtas ir patikrintas jūsų platformoje  
- [ ] **Pirmas diegimas**: Sėkmingai įdiegtas „todo-nodejs-mongo“ šablonas  
- [ ] **Aplinkos nustatymas**: Konfigūruoti pirmieji aplinkos kintamieji  
- [ ] **Išteklių naršymas**: Išnagrinėti įdiegti ištekliai „Azure Portal“  
- [ ] **Komandų įvaldymas**: Įsisavintos pagrindinės AZD komandos  

#### 🤖 2 skyrius: AI pirmasis vystymas  
- [ ] **AI šablono diegimas**: Sėkmingai įdiegtas „azure-search-openai-demo“  
- [ ] **RAG įgyvendinimas**: Konfigūruotas dokumentų indeksavimas ir paieška  
- [ ] **Modelio konfigūracija**: Nustatyti keli AI modeliai skirtingiems tikslams  
- [ ] **AI stebėjimas**: Įgyvendintas „Application Insights“ AI darbo krūviams  
- [ ] **Našumo optimizavimas**: Patobulintas AI programos našumas  

#### ⚙️ 3 skyrius: Konfigūracija ir autentifikacija  
- [ ] **Kelių aplinkų nustatymas**: Konfigūruotos dev, staging ir prod aplinkos  
- [ ] **Saugumo įgyvendinimas**: Nustatyta valdomos tapatybės autentifikacija  
- [ ] **Slaptų duomenų valdymas**: Integruotas „Azure Key Vault“ jautriems duomenims  
- [ ] **Parametrų valdymas**: Sukurtos aplinkai specifinės konfigūracijos  
- [ ] **Autentifikacijos įvaldymas**: Įgyvendinti saugūs prieigos modeliai  

#### 🏗️ 4 skyrius: Infrastruktūra kaip kodas ir diegimas  
- [ ] **Individualizuoto šablono kūrimas**: Sukurtas kelių paslaugų programos šablonas  
- [ ] **Bicep įvaldymas**: Sukurti moduliniai, pakartotinai naudojami infrastruktūros komponentai  
- [ ] **Diegimo automatizavimas**: Įgyvendinti prieš/po diegimo scenarijai  
- [ ] **Architektūros projektavimas**: Įdiegtas sudėtingas mikroservisų architektūros modelis  
- [ ] **Šablono optimizavimas**: Optimizuoti šablonai našumui ir kaštams  

#### 🎯 5 skyrius: Daugiaagentės AI sprendimai  
- [ ] **Mažmeninės prekybos sprendimo diegimas**: Įdiegtas pilnas daugiaagentės mažmeninės prekybos scenarijus  
- [ ] **Agentų pritaikymas**: Modifikuoti klientų ir inventoriaus agentų elgesiai  
- [ ] **Architektūros mastelio keitimas**: Įgyvendintas apkrovos balansavimas ir automatinis mastelio keitimas  
- [ ] **Gamybos stebėjimas**: Sukurtas išsamus stebėjimas ir įspėjimai  
- [ ] **Našumo derinimas**: Optimizuota daugiaagentės sistemos veikla  

#### 🔍 6 skyrius: Diegimo patikrinimas prieš paleidimą ir planavimas  
- [ ] **Pajėgumų analizė**: Išanalizuoti programų išteklių reikalavimai  
- [ ] **SKU optimizavimas**: Pasirinkti ekonomiški paslaugų lygiai  
- [ ] **Patikrinimo automatizavimas**: Įgyvendinti patikrinimo prieš paleidimą scenarijai  
- [ ] **Kaštų planavimas**: Sukurti diegimo kaštų įvertinimai ir biudžetai  
- [ ] **Rizikos vertinimas**: Identifikuotos ir sumažintos diegimo rizikos  

#### 🚨 7 skyrius: Trikčių šalinimas ir klaidų taisymas  
- [ ] **Diagnostikos įgūdžiai**: Sėkmingai ištaisyti tyčia sugadinti diegimai  
- [ ] **Žurnalų analizė**: Efektyviai naudoti „Azure Monitor“ ir „Application Insights“  
- [ ] **Našumo derinimas**: Optimizuotos l
5. **Bendruomenės indėlis**: Dalinkitės šablonais ar patobulinimais

#### Profesinio tobulėjimo rezultatai
- **Portfolio projektai**: 8 paruošti diegimai gamybai
- **Techniniai įgūdžiai**: Pramonės standartų AZD ir AI diegimo patirtis
- **Problemų sprendimo gebėjimai**: Savarankiškas trikčių šalinimas ir optimizavimas
- **Bendruomenės pripažinimas**: Aktyvus dalyvavimas Azure kūrėjų bendruomenėje
- **Karjeros pažanga**: Įgūdžiai, tiesiogiai pritaikomi debesų ir AI srityse

#### Sėkmės rodikliai
- **Diegimo sėkmės rodiklis**: >95% sėkmingų diegimų
- **Trikčių šalinimo laikas**: <30 minučių įprastoms problemoms
- **Našumo optimizavimas**: Akivaizdūs kaštų ir našumo patobulinimai
- **Saugumo atitiktis**: Visi diegimai atitinka įmonės saugumo standartus
- **Žinių perdavimas**: Gebėjimas mokyti kitus kūrėjus

### Nuolatinis mokymasis ir bendruomenės įsitraukimas

#### Būkite atnaujinti
- **Azure naujienos**: Sekite Azure Developer CLI atnaujinimų pastabas
- **Bendruomenės renginiai**: Dalyvaukite Azure ir AI kūrėjų renginiuose
- **Dokumentacija**: Prisidėkite prie bendruomenės dokumentacijos ir pavyzdžių
- **Grįžtamojo ryšio ciklas**: Teikite atsiliepimus apie kurso turinį ir Azure paslaugas

#### Karjeros plėtra
- **Profesinis tinklas**: Užmegzkite ryšius su Azure ir AI ekspertais
- **Pranešimų galimybės**: Pristatykite savo žinias konferencijose ar susitikimuose
- **Atvirojo kodo indėlis**: Prisidėkite prie AZD šablonų ir įrankių
- **Mentorystė**: Padėkite kitiems kūrėjams mokytis AZD

---

**Skyriaus navigacija:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../README.md)
- **📖 Pradėkite mokytis**: [1 skyrius: Pagrindai ir greitas startas](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Progreso sekimas**: Sekite savo pažangą per išsamų 8 skyrių mokymosi sistemą
- **🤝 Bendruomenė**: [Azure Discord](https://discord.gg/microsoft-azure) pagalbai ir diskusijoms

**Mokymosi progreso sekimas**: Naudokite šį struktūruotą vadovą, kad įvaldytumėte Azure Developer CLI per nuoseklų, praktinį mokymąsi su išmatuojamais rezultatais ir profesinio tobulėjimo privalumais.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:  
Šis dokumentas buvo išverstas naudojant AI vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Dėl svarbios informacijos rekomenduojama profesionali žmogaus vertimo paslauga. Mes neprisiimame atsakomybės už nesusipratimus ar neteisingus aiškinimus, atsiradusius naudojant šį vertimą.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->