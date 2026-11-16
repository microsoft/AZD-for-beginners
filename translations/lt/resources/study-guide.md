# Studijų vadovas – Išsamūs mokymosi tikslai

**Mokymosi kelio navigacija**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../README.md)
- **📖 Pradėti mokytis**: [1 skyrius: Pagrindai ir greitas pradėjimas](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Pažangos stebėjimas**: [Kurso baigimas](../README.md#-course-completion--certification)

## Įvadas

Šis išsamus studijų vadovas pateikia struktūruotus mokymosi tikslus, pagrindines sąvokas, praktines užduotis ir vertinimo priemones, kad padėtų jums įvaldyti Azure Developer CLI (azd). Naudokite šį vadovą pažangai sekti ir įsitikinkite, kad apėmėte visas svarbiausias temas.

## Mokymosi tikslai

Baigę šį studijų vadovą, jūs:
- Įvaldysite visas pagrindines ir pažangias Azure Developer CLI sąvokas
- Įgysite praktinių įgūdžių diegiant ir valdant Azure programas
- Įgysite pasitikėjimo sprendžiant problemas ir optimizuojant diegimus
- Suprasite gamybai paruoštas diegimo praktikas ir saugumo aspektus

## Mokymosi rezultatai

Baigę visas šio studijų vadovo dalis, galėsite:
- Kurti, diegti ir valdyti pilną programų architektūrą naudojant azd
- Įgyvendinti išsamią stebėjimą, saugumą ir kaštų optimizavimo strategijas
- Savarankiškai spręsti sudėtingas diegimo problemas
- Kurti pasirinktinius šablonus ir prisidėti prie azd bendruomenės

## 8 skyrių mokymosi struktūra

### 1 skyrius: Pagrindai ir greitas pradėjimas (1 savaitė)
**Trukmė**: 30–45 minutės | **Sudėtingumas**: ⭐

#### Mokymosi tikslai
- Suprasti Azure Developer CLI pagrindines sąvokas ir terminologiją
- Sėkmingai įdiegti ir sukonfigūruoti AZD savo kūrimo aplinkoje
- Diegti pirmąją programą naudodami esamą šabloną
- Efektyviai naviguoti AZD komandinės eilutės sąsajoje

#### Pagrindinės sąvokos, kurias reikia įvaldyti
- AZD projekto struktūra ir komponentai (azure.yaml, infra/, src/)
- Šablonais paremtos diegimo darbo eigos
- Aplinkos konfigūracijos pagrindai
- Išteklių grupių ir prenumeratos valdymas

#### Praktinės užduotys
1. **Įdiegimo patikra**: Įdiekite AZD ir patikrinkite su `azd version`
2. **Pirmasis diegimas**: Sėkmingai įdiekite todo-nodejs-mongo šabloną
3. **Aplinkos nustatymas**: Sukonfigūruokite pirmuosius aplinkos kintamuosius
4. **Ištekliai naršymas**: Naršykite įdiegtus išteklius Azure portale

#### Vertinimo klausimai
- Kokie yra pagrindiniai AZD projekto komponentai?
- Kaip inicijuoti naują projektą iš šablono?
- Kuo skiriasi `azd up` ir `azd deploy`?
- Kaip valdyti kelias aplinkas su AZD?

---

### 2 skyrius: AI pirmas vystymas (2 savaitė)
**Trukmė**: 1–2 valandos | **Sudėtingumas**: ⭐⭐

#### Mokymosi tikslai
- Integruoti Microsoft Foundry paslaugas su AZD darbo eigomis
- Diegti ir konfigūruoti dirbtinio intelekto pagrindu veikiančias programas
- Suprasti RAG (Retrieval-Augmented Generation) įgyvendinimo modelius
- Valdyti DI modelių diegimus ir skalavimą

#### Pagrindinės sąvokos, kurias reikia įvaldyti
- Microsoft Foundry Models paslaugų integracija ir API valdymas
- DI paieškos konfigūracija ir vektorinė indeksacija
- Modelių diegimo strategijos ir pajėgumų planavimas
- DI programų stebėjimas ir veikimo optimizavimas

#### Praktinės užduotys
1. **DI pokalbio diegimas**: Įdiekite azure-search-openai-demo šabloną
2. **RAG įgyvendinimas**: Konfigūruokite dokumentų indeksaciją ir paiešką
3. **Modelių konfigūracija**: Nustatykite kelis DI modelius skirtingiems tikslams
4. **DI stebėjimas**: Įdiekite Application Insights DI darbo krūviams

#### Vertinimo klausimai
- Kaip konfigūruoti Microsoft Foundry Models paslaugas AZD šablone?
- Kokie yra pagrindiniai RAG architektūros komponentai?
- Kaip valdyti DI modelių pajėgumus ir skalavimą?
- Kokie stebėjimo rodikliai yra svarbūs DI programoms?

---

### 3 skyrius: Konfigūracija ir autentifikacija (3 savaitė)
**Trukmė**: 45–60 minučių | **Sudėtingumas**: ⭐⭐

#### Mokymosi tikslai
- Įvaldyti aplinkos konfigūracijos ir valdymo strategijas
- Įgyvendinti saugios autentifikacijos modelius ir valdomą tapatybę
- Organizuoti išteklius su tinkamomis pavadinimų konvencijomis
- Konfigūruoti multi-aplinkos diegimus (dev, staging, prod)

#### Pagrindinės sąvokos, kurias reikia įvaldyti
- Aplinkos hierarchija ir konfigūracijos prioriteto taisyklės
- Valdomos tapatybės ir paslaugų pagrindinio autentifikacija
- Key Vault integracija slaptų duomenų valdymui
- Aplinkai būdingų parametrų valdymas

#### Praktinės užduotys
1. **Multi-aplinkos nustatymas**: Konfigūruokite dev, staging ir prod aplinkas
2. **Saugumo konfigūracija**: Įgyvendinkite valdomos tapatybės autentifikaciją
3. **Slaptų duomenų valdymas**: Integruokite Azure Key Vault jautriems duomenims
4. **Parametrų valdymas**: Sukurkite aplinkai būdingas konfigūracijas

#### Vertinimo klausimai
- Kaip konfigūruoti skirtingas aplinkas su AZD?
- Kokie yra valdomos tapatybės privalumai prieš paslaugų pagrindus?
- Kaip saugiai valdyti programos slaptažodžius?
- Kokia yra AZD konfigūracijos hierarchija?

---

### 4 skyrius: Infrastruktūra kaip Kodeksas ir diegimas (4–5 savaitė)
**Trukmė**: 1–1,5 valandos | **Sudėtingumas**: ⭐⭐⭐

#### Mokymosi tikslai
- Kurti ir pritaikyti Bicep infrastruktūros šablonus
- Įgyvendinti pažangias diegimo schemas ir darbo eigos
- Suprasti išteklių pateikimo strategijas
- Kurti mastelio keičiamas daugiaservises architektūras

- Diegti konteinerizuotas programas naudojant Azure Container Apps ir AZD


#### Pagrindinės sąvokos, kurias reikia įvaldyti
- Bicep šablonų struktūra ir geriausios praktikos
- Išteklių priklausomybės ir diegimo tvarka
- Parametrų failai ir šablonų modularumas
- Pasirinktiniai kabliai ir diegimo automatikos įgyvendinimas
- Konteinerinių programų diegimo modeliai (greitas startas, gamyba, mikroservisai)

#### Praktinės užduotys
1. **Pasirinktinio šablono kūrimas**: Sukurkite daugiaservisės programos šabloną
2. **Bicep įvaldymas**: Kūrkite modulinės, pakartotinai naudojamos infrastruktūros komponentus
3. **Diegimo automatizavimas**: Įgyvendinkite iš anksto ir po diegimo kablius
4. **Architektūros projektavimas**: Diegti sudėtingą mikroservisų architektūrą
5. **Konteinerinių programų diegimas**: Diegti [Paprasto Flask API](../../../examples/container-app/simple-flask-api) ir [Mikroservisų architektūros](../../../examples/container-app/microservices) pavyzdžius naudojant AZD

#### Vertinimo klausimai
- Kaip sukurti pasirinktinius Bicep šablonus AZD?
- Kokios yra geriausios praktikos infrastruktūros kodo organizavimui?
- Kaip šablonuose valdyti išteklių priklausomybes?
- Kokios diegimo modeliai palaiko atnaujinimus be prastovų?

---

### 5 skyrius: Daugiaagentės DI sprendimai (6–7 savaitė)
**Trukmė**: 2–3 valandos | **Sudėtingumas**: ⭐⭐⭐⭐

#### Mokymosi tikslai
- Kurti ir įgyvendinti daugiaagentų DI architektūras
- Koordinuoti agentų bendradarbiavimą ir komunikaciją
- Diegti gamybai paruoštus DI sprendimus su stebėsena
- Suprasti agentų specializaciją ir darbo eigos modelius
- Integruoti konteinerizuotus mikroservisus kaip daugiaagentės sistemos dalį

#### Pagrindinės sąvokos, kurias reikia įvaldyti
- Daugiaagentės architektūros modeliai ir projektavimo principai
- Agentų komunikacijos protokolai ir duomenų srautas
- Darbo krūvio paskirstymo ir skalavimo strategijos DI agentams
- Gamybinė daugiagentė sistemų stebėsena
- Paslaugų tarpusavio komunikacija konteinerizuotose aplinkose

#### Praktinės užduotys
1. **Mažmeninės prekybos architektūros peržiūra**: Išanalizuokite mažmeninės prekybos šabloną ir nustatykite, kokie programų komponentai turi būti įgyvendinti prieš diegimą
2. **Agentų pritaikymas**: Modifikuokite Kliento ir Inventoriaus agentų elgseną
3. **Architektūros skalavimas**: Įgyvendinkite darbo krūvio balansavimą ir automatinį skalavimą
4. **Gamybinė stebėsena**: Nustatykite išsamią stebėseną ir įspėjimus
5. **Mikroservisų integravimas**: Išplėskite [Mikroservisų architektūros](../../../examples/container-app/microservices) pavyzdį, kad palaikytų agentų pagrindu veikiančias darbo eigas

#### Vertinimo klausimai
- Kaip sukurti veiksmingus daugiaagentės komunikacijos modelius?
- Kokie yra pagrindiniai aspektai skalaujant DI agentų darbo krūvius?
- Kaip stebėti ir derinti daugiaagentės DI sistemas?
- Kokie gamybiniai modeliai užtikrina DI agentų patikimumą?

---

### 6 skyrius: Prieš diegimą skirtas patikrinimas ir planavimas (8 savaitė)
**Trukmė**: 1 valanda | **Sudėtingumas**: ⭐⭐

#### Mokymosi tikslai
- Atlikti išsamų pajėgumų planavimą ir išteklių patikrinimą
- Pasirinkti optimaliausius Azure SKU kaštų efektyvumui
- Įgyvendinti automatizuotus prieš diegimo patikrinimus
- Planuoti diegimus atsižvelgiant į kaštų optimizavimą

#### Pagrindinės sąvokos, kurias reikia įvaldyti
- Azure išteklių kvotos ir pajėgumų ribojimai
- SKU pasirinkimo kriterijai ir kaštų optimizavimas
- Automatizuoti patikrinimo scenarijai ir testavimas
- Diegimo planavimas ir rizikos vertinimas

#### Praktinės užduotys
1. **Pajėgumų analizė**: Išanalizuokite savo programų išteklių poreikius
2. **SKU optimizavimas**: Palyginkite ir pasirinkite ekonomiškiausias paslaugų klases
3. **Patikrinimo automatizavimas**: Įgyvendinkite prieš diegimo patikrinimo scenarijus
4. **Kaštų planavimas**: Sudarykite diegimo kaštų sąmatas ir biudžetus

#### Vertinimo klausimai
- Kaip patikrinti Azure pajėgumus prieš diegimą?
- Kokie veiksniai įtakoja SKU pasirinkimą?
- Kaip automatizuoti prieš diegimą skirtą patikrinimą?
- Kokios strategijos padeda optimizuoti diegimo kaštus?

---

### 7 skyrius: Gedimų paieška ir derinimas (9 savaitė)
**Trukmė**: 1–1,5 valandos | **Sudėtingumas**: ⭐⭐

#### Mokymosi tikslai
- Kurti sistemingus derinimo metodus AZD diegimams
- Spręsti dažniausias diegimo ir konfigūracijos problemas
- Derinti DI specifines problemas ir našumo klausimus
- Įdiegti stebėjimą ir įspėjimus proaktyviam problemų aptikimui

#### Pagrindinės sąvokos, kurias reikia įvaldyti
- Diagnostikos metodai ir žurnalo strategijos
- Dažnos klaidų modeliai ir jų sprendimai
- Veikimo stebėjimas ir optimizavimas
- Incidentų valdymo ir atkūrimo procedūros

#### Praktinės užduotys
1. **Diagnostikos įgūdžiai**: Praktikuokitės su sąmoningai sulaužytais diegimais
2. **Žurnalų analizė**: Naudokite Azure Monitor ir Application Insights efektyviai
3. **Veikimo optimizavimas**: Optimizuokite lėtai veikiančias programas
4. **Atkūrimo procesai**: Įgyvendinkite atsargines kopijas ir katastrofų atstatymą

#### Vertinimo klausimai
- Kokios yra dažniausios AZD diegimo klaidos?
- Kaip derinti autentifikacijos ir leidimų problemas?
- Kokios stebėjimo strategijos padeda išvengti gamybinių problemų?
- Kaip optimizuoti programos veikimą Azure aplinkoje?

---

### 8 skyrius: Gamybiniai ir įmonių modeliai (10–11 savaitė)
**Trukmė**: 2–3 valandos | **Sudėtingumas**: ⭐⭐⭐⭐

#### Mokymosi tikslai
- Įgyvendinti įmonių lygio diegimo strategijas
- Projektuoti saugumo modelius ir atitikties sistemas
- Nustatyti stebėseną, valdymą ir kaštų valdymą
- Kurti mastelio keičiamus CI/CD kanalus su AZD integracija
- Taikyti geriausias praktikas gamybiniams konteinerinių programų diegimams (sauga, stebėsena, kaštai, CI/CD)

#### Pagrindinės sąvokos, kurias reikia įvaldyti
- Įmonių saugumo ir atitikties reikalavimai
- Valdymo sistemos ir politikos įgyvendinimas
- Pažangi stebėsena ir kaštų valdymas
- CI/CD integracija ir automatizuoti diegimo kanalai
- Mėlynos-žalios ir kanarinių diegimo strategijos konteinerizuotiems darbo krūviams

#### Praktinės užduotys
1. **Įmonių saugumas**: Įgyvendinkite išsamius saugumo modelius
2. **Valdymo sistema**: Nustatykite Azure Policy ir išteklių valdymą
3. **Pažangi stebėsena**: Kurkite informacinius centrus ir automatizuotus įspėjimus
4. **CI/CD integracija**: Kurkite automatizuotus diegimo kanalus
5. **Gamybinės konteinerinės programos**: Taikykite saugumo, stebėsenos ir kaštų optimizavimo praktikas [Mikroservisų architektūros](../../../examples/container-app/microservices) pavyzdyje

#### Vertinimo klausimai
- Kaip įgyvendinti įmonių saugumą AZD diegimuose?
- Kokie valdymo modeliai užtikrina atitiktį ir kaštų kontrolę?
- Kaip projektuoti mastelio keičiamą gamybinių sistemų stebėseną?
- Kokie CI/CD modeliai geriausiai veikia su AZD darbo eigomis?

#### Mokymosi tikslai
- Suprasti Azure Developer CLI pagrindus ir svarbiausias sąvokas
- Sėkmingai įdiegti ir konfigūruoti azd savo kūrimo aplinkoje
- Atlikti pirmąjį diegimą naudojant esamą šabloną
- Naršyti azd projekto struktūrą ir suprasti pagrindinius komponentus

#### Pagrindinės sąvokos, kurias reikia įvaldyti
- Šablonai, aplinkos ir paslaugos
- azure.yaml konfigūracijos struktūra
- Pagrindinės azd komandos (init, up, down, deploy)
- Infrastruktūros kaip kodo principai
- Azure autentifikacija ir autorizacija

#### Praktinės užduotys

**Užduotis 1.1: Įdiegimas ir nustatymas**
```text
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI only for exercises or template hooks that explicitly use `az`; authenticate AZD independently
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Užduotis 1.2: Pirmas diegimas**
```text
# Deploy a simple web application:
1. Initialize project in an empty directory: azd init --template todo-nodejs-mongo .
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**Užduotis 1.3: Projekto struktūros analizė**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### Savianalizės klausimai
1. Kokios yra trys pagrindinės azd architektūros sąvokos?
2. Koks azure.yaml failo paskirtis?
3. Kaip aplinkos padeda valdyti skirtingus diegimo taikinius?
4. Kokie autentifikacijos metodai gali būti naudojami su azd?
5. Kas nutinka, kai pirmą kartą paleidžiate `azd up`?

---

## Pažangos sekimas ir vertinimo sistema
```text
# Create and configure multiple environments:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Užduotis 2.2: Pažangi konfigūracija**
```text
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Užduotis 2.3: Saugumo konfigūracija**
```text
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Savianalizės klausimai
1. Kaip azd valdo aplinkos kintamųjų prioritetus?
2. Kas yra diegimo kabliai ir kada juos naudoti?
3. Kaip sukonfigūruoti skirtingus SKU skirtingoms aplinkoms?
4. Kokios yra skirtingų autentifikacijos metodų saugumo pasekmės?
5. Kaip valdyti slaptus duomenis ir jautrią konfigūraciją?

### 3 modulis: Diegimas ir išteklių suteikimas (4 savaitė)

#### Mokymosi tikslai
- Įvaldyti diegimo darbo eigas ir geriausias praktikas
- Suprasti Infrastrukturą kaip Kodą naudojant Bicep šablonus
- Įgyvendinti sudėtingas daugiaservisės architektūras
- Optimizuoti diegimo našumą ir patikimumą

#### Pagrindinės sąvokos, kurias reikia įvaldyti
- Bicep šablonų struktūra ir moduliai
- Išteklių priklausomybės ir tvarka
- Diegimo strategijos (mėlyna-žalia, vykstantys atnaujinimai)
- Daugiaregioniniai diegimai
- Duomenų bazių migracijos ir duomenų valdymas

#### Praktinės užduotys

**Užduotis 3.1: Pasirinktinė infrastruktūra**
```text
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Užduotis 3.2: Daugiaservisinė programa**
```text
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Užduotis 3.3: Duomenų bazės integracija**
```text
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Savianalizės klausimai
1. Kokie yra Bicep pranašumai prieš ARM šablonus?
2. Kaip tvarkyti duomenų bazių migracijas azd diegimuose?
3. Kokios yra diegimo be prastovų strategijos?
4. Kaip valdyti priklausomybes tarp paslaugų?
5. Kokie aspektai svarbūs daugiaregioniniams diegimams?

### 4 modulis: Prieš diegimą skirtas patikrinimas (5 savaitė)

#### Mokymosi tikslai
- Įgyvendinkite išsamius išankstinius patikrinimus prieš diegiant
- Išmokite pajėgumų planavimo ir resursų patvirtinimo
- Supraskite SKU pasirinkimą ir sąnaudų optimizavimą
- Kurkite automatinio patvirtinimo srautus

#### Pagrindinės sąvokos, kurias reikia įvaldyti
- Azure resursų kvotos ir ribos
- SKU pasirinkimo kriterijai ir sąnaudų pasekmės
- Automatizuoti patvirtinimo scenarijai ir įrankiai
- Pajėgumų planavimo metodologijos
- Veikimo testavimas ir optimizavimas

#### Praktikos pratimai

**4.1 pratimas: Pajėgumų planavimas**
```text
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**4.2 pratimas: Išankstinis patikrinimas**
```text
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**4.3 pratimas: SKU optimizavimas**
```text
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Savarankiško įvertinimo klausimai
1. Kokie veiksniai turėtų įtakoti SKU pasirinkimo sprendimus?
2. Kaip patikrinate Azure resursų prieinamumą prieš diegiant?
3. Kokios yra pagrindinės išankstinio patikrinimo sistemos sudedamosios dalys?
4. Kaip įvertinate ir kontroliuojate diegimo sąnaudas?
5. Kokia yra esminė stebėsena pajėgumų planavimui?

### 5 modulis: Klaidų šalinimas ir derinimas (6 savaitė)

#### Mokymosi tikslai
- Įvaldykite sisteminius klaidų šalinimo metodus
- Tapkite ekspertu derinant sudėtingas diegimo problemas
- Įgyvendinkite išsamią stebėseną ir įspėjimus
- Sukurkite reagavimo į incidentus ir atkūrimo procedūras

#### Pagrindinės sąvokos, kurias reikia įvaldyti
- Įprasti diegimo trikdžių modeliai
- Žurnalų analizės ir koreliacijos technikos
- Veikimo stebėsena ir optimizavimas
- Saugumo incidentų aptikimas ir reagavimas
- Nenumatytų situacijų atkūrimas ir verslo tęstinumas

#### Praktikos pratimai

**5.1 pratimas: Klaidų šalinimo scenarijai**
```text
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**5.2 pratimas: Stebėsenos įgyvendinimas**
```text
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**5.3 pratimas: Incidentų reagavimas**
```text
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Savarankiško įvertinimo klausimai
1. Koks yra sisteminis požiūris į azd diegimų klaidų šalinimą?
2. Kaip koreliuojate žurnalus tarp kelių paslaugų ir išteklių?
3. Kokie stebėsenos metrikai yra svarbiausi ankstyvam problemų aptikimui?
4. Kaip įgyvendinate veiksmingas nenumatytų situacijų atkūrimo procedūras?
5. Kokios yra pagrindinės reagavimo į incidentus plano sudedamosios dalys?

### 6 modulis: Pažangios temos ir geriausios praktikos (7-8 savaitės)

#### Mokymosi tikslai
- Įgyvendinkite įmonės lygio diegimo modelius
- Įvaldykite CI/CD integraciją ir automatizavimą
- Kurkite pasirinktinės šablonus ir prisidėkite prie bendruomenės
- Supraskite pažangius saugumo ir atitikties reikalavimus

#### Pagrindinės sąvokos, kurias reikia įvaldyti
- CI/CD srauto integracijos modeliai
- Pasirinktinių šablonų kūrimas ir platinimas
- Įmonių valdymas ir atitiktis
- Pažangios tinklo ir saugumo konfigūracijos
- Veikimo optimizavimas ir išlaidų valdymas

#### Praktikos pratimai

**6.1 pratimas: CI/CD integracija**
```text
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**6.2 pratimas: Pasirinktinio šablono kūrimas**
```text
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**6.3 pratimas: Įmonės diegimas**
```text
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Savarankiško įvertinimo klausimai
1. Kaip integruoti azd į esamus CI/CD darbo srautus?
2. Kokie yra pagrindiniai aspektai kuriant pasirinktinį šabloną?
3. Kaip įgyvendinti valdymą ir atitiktį azd diegimuose?
4. Kokios yra geriausios praktikos įmonių dydžio diegimams?
5. Kaip efektyviai prisidėti prie azd bendruomenės?

## Praktiniai projektai

### Projekta 1: Asmeninė portfelio svetainė
**Sudėtingumas**: Pradedantysis  
**Trukmė**: 1-2 savaitės

Sukurkite ir diekite asmeninę portfelio svetainę, pasitelkdami:
- Stacionarų svetainės talpinimą Azure Storage
- Pasirinktinio domeno konfigūraciją
- CDN integracija globaliam veikimui
- Automatizuotas diegimo srautas

**Pristatomi darbai**:
- Veikianti svetainė, išdiegta Azure
- Pasirinktinis azd šablonas portfelio diegimams
- Diegimo proceso dokumentacija
- Sąnaudų analizė ir optimizavimo rekomendacijos

### Projekta 2: Užduočių valdymo programa
**Sudėtingumas**: Vidutinis  
**Trukmė**: 2-3 savaitės

Sukurkite pilnos aprėpties užduočių valdymo programą su:
- React frontend, įdiegtu App Service
- Node.js API backend su autentifikacija
- PostgreSQL duomenų bazė su migracijomis
- Application Insights stebėsena

**Pristatomi darbai**:
- Pilna programa su naudotojų autentifikacija
- Duomenų bazės schema ir migracijos scenarijai
- Stebėjimo informaciniai skydeliai ir įspėjimų taisyklės
- Konfigūracija kelioms aplinkoms diegti

### Projekta 3: Mikroservisų el. prekybos platforma
**Sudėtingumas**: Pažengęs  
**Trukmė**: 4-6 savaitės

Sukurkite mikroservisų pagrindu veikiančią el. prekybos platformą:
- Keli API servisai (katalogas, užsakymai, mokėjimai, naudotojai)
- Žinučių eilių integracija su Service Bus
- Redis talpykla veikimo optimizavimui
- Išsami žurnalų ir stebėsenos sistema

**Pavyzdinis šaltinis**: Žr. [Microservices Architecture](../../../examples/container-app/microservices) - dviejų servisų mokomąją pavyzdinę versiją ir diegimo vadovą. Eilės, duomenų saugojimas, autentifikacija, mokėjimų apdorojimas ir gamybos parengimas yra atskiri projektai.

**Pristatomi darbai**:
- Pilna mikroservisų architektūra
- Tarpservisinės komunikacijos modeliai
- Veikimo testavimas ir optimizavimas
- Gamybinės aplinkos saugumo įgyvendinimas

## Įvertinimas ir sertifikavimas

### Žinių patikros

Atlikite šiuos vertinimus po kiekvieno modulio:

**1 modulio vertinimas**: Pagrindinės sąvokos ir įdiegimas
- Kelių pasirinkimų klausimai apie pagrindines sąvokas
- Praktiniai įdiegimo ir konfigūracijos uždaviniai
- Paprastas diegimo pratimas

**2 modulio vertinimas**: Konfigūracija ir aplinkos
- Aplinkos valdymo scenarijai
- Konfigūracijos trikčių šalinimo pratimai
- Saugumo konfigūracijos įgyvendinimas

**3 modulio vertinimas**: Diegimas ir paruošimas
- Infrastruktūros dizaino iššūkiai
- Multi-paslaugų diegimo scenarijai
- Veikimo optimizavimo pratimai

**4 modulio vertinimas**: Išankstinis patvirtinimas
- Pajėgumų planavimo atvejų analizė
- Sąnaudų optimizavimo scenarijai
- Patvirtinimo srauto įgyvendinimas

**5 modulio vertinimas**: Klaidų šalinimas ir derinimas
- Problemų diagnozės pratimai
- Stebėsenos įgyvendinimo uždaviniai
- Incidentų reagavimo simuliacijos

**6 modulio vertinimas**: Pažangios temos
- CI/CD srauto dizainas
- Pasirinktinių šablonų kūrimas
- Įmonių architektūros scenarijai

### Baigiamasis integruotas projektas

Sukurkite ir įgyvendinkite visapusišką sprendimą, demonstruojantį visų sąvokų išmanymą:

**Reikalavimai**:
- Daugiasluoksnė programos architektūra
- Kelios diegimo aplinkos
- Išsami stebėsena ir įspėjimai
- Saugumo ir atitikties įgyvendinimas
- Sąnaudų optimizavimas ir veikimo tuningas
- Pilna dokumentacija ir naudojimo vadovai

**Įvertinimo kriterijai**:
- Techninio įgyvendinimo kokybė
- Dokumentacijos išsamumas
- Saugumo ir geriausių praktikų laikymasis
- Veikimo ir sąnaudų optimizavimas
- Klaidų šalinimo ir stebėsenos efektyvumas

## Mokymosi šaltiniai ir nuorodos

### Oficialios dokumentacijos
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Bendruomenės ištekliai
- [AZD Template Gallery](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub Organization](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHub Repository](https://github.com/Azure/azure-dev)

### Praktikos aplinkos
- [Azure Free Account](https://azure.microsoft.com/free/)
- [Azure DevOps Free Tier](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### Papildomi įrankiai
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Mokymosi tvarkaraščio rekomendacijos

### Pilnas studijavimas (8 savaitės)
- **1-2 savaitės**: 1-2 moduliai (Pradžia, Konfigūracija)
- **3-4 savaitės**: 3-4 moduliai (Diegimas, Išankstinis patvirtinimas)
- **5-6 savaitės**: 5-6 moduliai (Klaidų šalinimas, Pažangios temos)
- **7-8 savaitės**: Praktinės užduotys ir galutinis vertinimas

### Dalinis studijavimas (16 savaičių)
- **1-4 savaitės**: 1 modulis (Pradžia)
- **5-7 savaitės**: 2 modulis (Konfigūracija ir aplinkos)
- **8-10 savaitės**: 3 modulis (Diegimas ir paruošimas)
- **11-12 savaitės**: 4 modulis (Išankstinis patvirtinimas)
- **13-14 savaitės**: 5 modulis (Klaidų šalinimas ir derinimas)
- **15-16 savaitės**: 6 modulis (Pažangios temos ir vertinimas)

---

## Progreso stebėjimo ir vertinimo sistema

### Skyrelio užbaigimo kontrolinis sąrašas

Sekite pažangą per kiekvieną skyrių su šiais matuojamais rezultatais:

#### 📚 1 skyrius: Pagrindai ir greitas startas
- [ ] **Įdiegimas baigtas**: AZD įdiegtas ir patikrintas Jūsų platformoje
- [ ] **Pirmas diegimas**: Sėkmingai įdiegta todo-nodejs-mongo šablonas
- [ ] **Aplinkos nustatymas**: Konfigūruoti pirmieji aplinkos kintamieji
- [ ] **Resursų naršymas**: Išnagrinėtos išdiegtos Azure Portal resursai
- [ ] **Komandų valdymas**: Pasitikimas pagrindinėmis AZD komandomis

#### 🤖 2 skyrius: AI pirmenybės kūrimas  
- [ ] **AI šablono diegimas**: Sėkmingai įdiegta azure-search-openai-demo
- [ ] **RAG įgyvendinimas**: Konfigūruotas dokumentų indeksavimas ir paieška
- [ ] **Modelių konfigūracija**: Nustatyti keli skirtingų paskirčių AI modeliai
- [ ] **AI stebėsena**: Įdiegta Application Insights AI darbo krūviams
- [ ] **Veikimo optimizavimas**: Pritaikytas AI programos našumas

#### ⚙️ 3 skyrius: Konfigūracija ir autentifikavimas
- [ ] **Daugiaplatformių aplinkų kūrimas**: Konfigūruotos dev, staging ir prod aplinkos
- [ ] **Saugumo įgyvendinimas**: Įdiegta valdoma tapatybės autentifikacija
- [ ] **Slapukų valdymas**: Integruotas Azure Key Vault jautriems duomenims saugoti
- [ ] **Parametrų valdymas**: Sukurtos aplinkai specifinės konfigūracijos
- [ ] **Autentifikacijos valdymas**: Įgyvendinti saugūs prieigos modeliai

#### 🏗️ 4 skyrius: Infrastruktūra kaip kodas ir diegimas
- [ ] **Pasirinktinių šablonų kūrimas**: Sukurtas daugiapakopis programos šablonas
- [ ] **Bicep įvaldymas**: Sukurtos modulinės, pakartotinai naudojamos infrastruktūros dalys
- [ ] **Diegimo automatizavimas**: Įdiegta išankstinių/po diegimo kablių sistema
- [ ] **Architektūros dizainas**: Įdiegta sudėtinga mikroservisų architektūra
- [ ] **Šablonų optimizavimas**: Optimizuoti šablonai našumui ir sąnaudoms

#### 🎯 5 skyrius: Daugiagentės AI sistemos
- [ ] **Mažmeninės architektūros peržiūra**: Nustatyti trūkstami programos komponentai ir suplanuota jų diegimas bei patikrinimas
- [ ] **Agentų pritaikymas**: Pakeisti Customer ir Inventory agentų elgesys
- [ ] **Architektūros mastelio keitimas**: Įdiegta apkrovos balansavimo ir automatinio mastelio keitimo sistema
- [ ] **Gamybos stebėsena**: Sukurta išsami stebėsena ir įspėjimai
- [ ] **Veikimo tuningas**: Optimizuotas daugiagentinės sistemos našumas

#### 🔍 6 skyrius: Išankstiniai patikrinimai ir planavimas prieš diegimą
- [ ] **Pajėgumų analizė**: Išnagrinėti resursų reikalavimai programoms
- [ ] **SKU optimizavimas**: Pasirinkti ekonomiški paslaugų lygiai
- [ ] **Patvirtinimo automatizavimas**: Įdiegti išankstiniai patikrinimo scenarijai
- [ ] **Sąnaudų planavimas**: Sukurti diegimo sąnaudų įvertinimai ir biudžetai
- [ ] **Rizikos vertinimas**: Nustatyti ir sumažinti diegimo rizikas

#### 🚨 7 skyrius: Klaidų šalinimas ir derinimas
- [ ] **Diagnostikos įgūdžiai**: Sėkmingai išspręstos specialiai sugadintos diegimo problemos
- [ ] **Žurnalų analizė**: Efektyviai naudota Azure Monitor ir Application Insights
- [ ] **Veikimo optimizavimas**: Suprojektuotos lėtai veikiančios programos optimizacijos
- [ ] **Atkūrimo procedūros**: Įgyvendintos atsarginės kopijos ir katastrofų atkūrimas
- [ ] **Stebėsenos įdiegimas**: Sukurta proaktyvi stebėsenos ir įspėjimų sistema

#### 🏢 8 skyrius: Gamybos ir įmonių modeliai
- [ ] **Įmonių saugumas**: Įdiegti išsamūs saugumo modeliai
- [ ] **Valdymo sistema**: Nustatyta Azure Policy ir resursų valdymas
- [ ] **Pažangi stebėsena**: Sukurti informaciniai skydeliai ir automatizuoti įspėjimai
- [ ] **CI/CD integracija**: Sukurti automatizuoti diegimo srautai
- [ ] **Atitikties įgyvendinimas**: Įgyvendinti įmonių atitikties reikalavimai

### Mokymosi grafikas ir etapai

#### 1-2 savaitės: Pagrindų kūrimas
- **Etapas**: Įdiegti pirmąją AI programą naudojant AZD
- **Patvirtinimas**: Veikianti programa, pasiekiama viešu URL
- **Įgūdžiai**: Pagrindiniai AZD darbo srautai ir AI paslaugų integracija

#### 3-4 savaitės: Konfigūracijos įvaldymas
- **Etapas**: Diegimas kelioms aplinkoms su saugia autentifikacija
- **Patvirtinimas**: Ta pati programa įdiegta dev/staging/prod aplinkose
- **Įgūdžiai**: Aplinkos valdymas ir saugumo įgyvendinimas

#### 5-6 savaitės: Infrastruktūros ekspertizė
- **Etapas**: Pasirinktinis šablonas sudėtingai multi-paslaugų programai
- **Patvirtinimas**: Pakartotinai naudojamas šablonas, taikytas kito komandos nario
- **Įgūdžiai**: Bicep įvaldymas ir infrastruktūros automatizavimas

#### 7-8 savaitės: Pažangus AI įgyvendinimas
- **Etapas**: Gamybai paruoštas daugiagentės AI sprendimas
- **Patvirtinimas**: Sistema veikia realius apkrovimus su stebėsena
- **Įgūdžiai**: Daugiagentė orkestracija ir veikimo optimizavimas

#### 9-10 savaitės: Gamybinis pasirengimas
- **Etapas**: Įmonės lygio diegimas su pilna atitiktimi
- **Patvirtinimas**: Praėjęs saugumo apžvalgą ir sąnaudų auditą
- **Įgūdžiai**: Valdymas, stebėsena ir CI/CD integracija

### Vertinimas ir sertifikavimas

#### Žinių įvertinimo metodai
1. **Praktiniai diegimai**: Veikiančios programos kiekvienam skyriui
2. **Kodo peržiūros**: Šablonų ir konfigūracijos kokybės vertinimas
3. **Problemos sprendimas**: Trikčių šalinimo scenarijai ir sprendimai
4. **Bendrakaipimas**: Paaiškinkite sąvokas kitiems besimokantiesiems
5. **Bendruomenės indėlis**: Dalinkitės šablonais arba patobulinimais

#### Profesinės pažangos rezultatai
- **Portfolio projektai**: Diegimo mokymai ir architektūros pratimai; gamybinis paruošimas reikalauja atskiro įgyvendinimo ir apžvalgos
- **Techniniai įgūdžiai**: Pramonės standartų AZD ir AI diegimo kompetencijos
- **Problemos sprendimo gebėjimai**: Savarankiškas trikčių šalinimas ir optimizavimas
- **Bendruomenės pripažinimas**: Aktyvus dalyvavimas Azure kūrėjų bendruomenėje
- **Karjeros pažanga**: Įgūdžiai, tiesiogiai pritaikomi debesų ir DI vaidmenims

#### Sėkmės metrika
- **Diegimo sėkmės rodiklis**: >95% sėkmingų diegimų
- **Gedimų šalinimo laikas**: <30 minučių dažniausioms problemoms
- **Veiklos optimizavimas**: Aiškiai matomi kaštų ir veiklos patobulinimai
- **Saugumo peržiūra**: Dokumentuoti kontrolės mechanizmai ir likę trūkumai pagal jūsų organizacijos reikalavimus; kurso baigimas nereiškia atitikties sertifikavimo
- **Žinių perdavimas**: Gebėjimas mentorystei kitiems kūrėjams

### Nuolatinis mokymasis ir bendruomenės įsitraukimas

#### Būkite informuoti
- **Azure atnaujinimai**: Sekite Azure Developer CLI leidimo pastabas
- **Bendruomenės renginiai**: Dalyvaukite Azure ir DI kūrėjų renginiuose
- **Dokumentacija**: Prisidėkite prie bendruomenės dokumentacijos ir pavyzdžių
- **Atsiliepimų teikimas**: Teikite atsiliepimus apie kurso turinį ir Azure paslaugas

#### Karjeros plėtra
- **Profesinis tinklas**: Užmegzkite ryšius su Azure ir DI ekspertais
- **Kalbėjimo galimybės**: Praneškite apie įgytas žinias konferencijose ar susitikimuose
- **Atviro kodo indėlis**: Prisidėkite prie AZD šablonų ir įrankių
- **Mentorystė**: Vadovaukite kitiems kūrėjams jų AZD mokymosi kelionėje

---

**Skyriaus navigacija:**
- **📚 Kurso pradžia**: [AZD For Beginners](../README.md)
- **📖 Pradėti mokytis**: [1 skyrius: Pagrindai ir greitas startas](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Progreso sekimas**: Sekite savo pažangą per išsamų 8 skyrių mokymosi sistemą
- **🤝 Bendruomenė**: [Azure Discord](https://discord.gg/microsoft-azure) pagalbai ir diskusijoms

**Mokymosi pažangos sekimas**: Naudokite šį struktūrizuotą vadovą, kad įvaldytumėte Azure Developer CLI per pažangų, praktišką mokymąsi su matuojamais rezultatais ir profesinės plėtros privalumais.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->