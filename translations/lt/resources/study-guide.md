# Studijų vadovas - Išsamūs mokymosi tikslai

**Mokymosi kelio navigacija**
- **📚 Kursų pradžia**: [AZD pradedantiesiems](../README.md)
- **📖 Pradėkite mokytis**: [1 skyrius: Pagrindai ir greitas startas](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Pažangos stebėjimas**: [Kurso pabaiga](../README.md#-course-completion--certification)

## Įvadas

Šis išsamus studijų vadovas suteikia struktūruotus mokymosi tikslus, pagrindines sąvokas, praktikos užduotis ir vertinimo medžiagą, kad padėtų jums įvaldyti Azure Developer CLI (azd). Naudokitės šiuo vadovu, kad sektumėte savo pažangą ir įsitikintumėte, jog išmokote visas svarbiausias temas.

## Mokymosi tikslai

Baigę šį studijų vadovą, jūs:
- Įvaldysite visas pagrindines ir pažangias Azure Developer CLI sąvokas
- Išsiugdysite praktinius įgūdžius diegiant ir valdant Azure programas
- Įgysite pasitikėjimą sprendžiant ir optimizuojant diegimus
- Suprasite gamybai paruoštas diegimo praktikas ir saugumo aspektus

## Mokymosi rezultatai

Baigę visas šio studijų vadovo skyrius, galėsite:
- Projektuoti, diegti ir valdyti pilnas programų architektūras naudodami azd
- Įgyvendinti išsamias stebėjimo, saugumo ir sąnaudų optimizavimo strategijas
- Savarankiškai spręsti sudėtingas diegimo problemas
- Kurti pasirinktinius šablonus ir prisidėti prie azd bendruomenės

## 8 skyrių mokymosi struktūra

### 1 skyrius: Pagrindai ir greitas startas (1 savaitė)
**Trukmė**: 30-45 minutės | **Sudėtingumas**: ⭐

#### Mokymosi tikslai
- Suprasti Azure Developer CLI pagrindines sąvokas ir terminologiją
- Sėkmingai įdiegti ir sukonfigūruoti AZD savo kūrimo aplinkoje
- Pirma kartą naudoti esamą šabloną ir įdiegti programą
- Efektyviai naršyti AZD komandų eilutės sąsajoje

#### Pagrindinės sąvokos, kurias reikia įsisavinti
- AZD projekto struktūra ir komponentai (azure.yaml, infra/, src/)
- Šablonais pagrįsti diegimo srautai
- Aplinkos konfigūravimo pagrindai
- Išteklių grupių ir prenumeratų valdymas

#### Praktinės užduotys
1. **Diegimo patikrinimas**: Įdiekite AZD ir patikrinkite naudodami `azd version`
2. **Pirmas diegimas**: Sėkmingai įdiekite todo-nodejs-mongo šabloną
3. **Aplinkos nustatymas**: Sukonfigūruokite pirmuosius aplinkos kintamuosius
4. **Išteklių naršymas**: Naršykite įdiegtus išteklius Azure portale

#### Vertinimo klausimai
- Kokie yra pagrindiniai AZD projekto komponentai?
- Kaip inicijuoti naują projektą iš šablono?
- Kuo skiriasi `azd up` ir `azd deploy`?
- Kaip valdyti kelias aplinkas naudojant AZD?

---

### 2 skyrius: AI-pirmoji plėtra (2 savaitė)
**Trukmė**: 4-5 valandos įskaitant dirbtuves | **Sudėtingumas**: ⭐⭐

#### Mokymosi tikslai
- Integruoti Microsoft Foundry paslaugas į AZD darbo eigas
- Naudoti GA `microsoft.foundry` paketą su AZD 1.37.0+ vabzdžių kūrimui
- Diegti ir konfigūruoti DI pagrindu veikiančias programas
- Suprasti RAG (Retrieval-Augmented Generation) įgyvendinimo modelius
- Valdyti DI modelių diegimą ir mastelį

#### Pagrindinės sąvokos, kurias reikia įsisavinti
- Microsoft Foundry Models paslaugos integracija ir API valdymas
- AI paieškos konfigūravimas ir vektorinė indeksacija
- Modelių diegimo strategijos ir talpos planavimas
- DI programų stebėjimas ir našumo optimizavimas
- Vietinio agento inspektorius prieš debesies įrašus, šaltinio kodo diegimą ir vertinimo išteklius versijų valdyme

#### Praktinės užduotys
1. **DI pokalbių diegimas**: Įdiekite azure-search-openai-demo šabloną
2. **RAG įgyvendinimas**: Konfigūruokite dokumentų indeksavimą ir ištraukimą
3. **Modelio konfigūracija**: Nustatykite kelis DI modelius skirtingiems tikslams
4. **DI stebėjimas**: Įgyvendinkite Application Insights DI apkrovoms
5. **GA talpinamas agentas**: Sekite [talpinamo agente vedlį](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga); palyginkite vietinius ir debesies atsakymus, peržiūrėkite vertinimo rezultatą ir patikrinkite valymo nuosavybę

#### Vertinimo klausimai
- Kaip konfigūruoti Microsoft Foundry Models paslaugas AZD šablone?
- Kokie yra pagrindiniai RAG architektūros komponentai?
- Kaip valdyti DI modelių talpą ir mastelį?
- Kokie stebėjimo rodikliai yra svarbūs DI programoms?
- Kokie išplėtimai yra įtraukti į `microsoft.foundry` ir kodėl vertinimai įdiegti atskirai?
- Kodėl vietiniai agento testai vis tiek sukuria Azure modelio sąnaudas?
- Ką `azd down` palieka, kai pakartotinai naudojate esamą Foundry projektą?

---

### 3 skyrius: Konfigūravimas ir autentifikacija (3 savaitė)
**Trukmė**: 45-60 minučių | **Sudėtingumas**: ⭐⭐

#### Mokymosi tikslai
- Įvaldyti aplinkos konfigūracijos ir valdymo strategijas
- Įgyvendinti saugios autentifikacijos modelius ir valdomą tapatybę
- Tvarkyti išteklius pagal tinkamus vardijimo standartus
- Konfigūruoti daugiaplanį diegimą (dev, staging, prod)

#### Pagrindinės sąvokos, kurias reikia įsisavinti
- Aplinkos hierarchija ir konfigūracijos prioritetai
- Valdoma tapatybė ir paslaugų pagrindo autentifikacija
- Key Vault integracija slaptiesiems duomenims valdyti
- Aplinkai skirtų parametrų valdymas

#### Praktinės užduotys
1. **Daugiaplanio nustatymas**: Sukonfigūruokite dev, staging ir prod aplinkas
2. **Saugumo konfigūracija**: Įgyvendinkite valdoma tapatybės autentifikaciją
3. **Slaptumų valdymas**: Integruokite Azure Key Vault jautriems duomenims
4. **Parametrų valdymas**: Sukurkite aplinkai specifines konfigūracijas

#### Vertinimo klausimai
- Kaip konfigūruojate skirtingas aplinkas naudojant AZD?
- Kokie yra valdytos tapatybės privalumai prieš paslaugų pagrindus?
- Kaip saugiai valdyti programos slaptumus?
- Kokia yra konfigūracijos hierarchija AZD?

---

### 4 skyrius: Infrastruktūra kaip kodas ir diegimas (4-5 savaitės)
**Trukmė**: 1-1,5 valandos | **Sudėtingumas**: ⭐⭐⭐

#### Mokymosi tikslai
- Kurti ir pritaikyti Bicep infrastruktūros šablonus
- Įgyvendinti pažangias diegimo schemas ir darbo srautus
- Suprasti išteklių teikimo strategijas
- Projektuoti skalūruojamas kelių paslaugų architektūras

- Diegti konteinerizuotas programas naudojant Azure Container Apps ir AZD


#### Pagrindinės sąvokos, kurias reikia įsisavinti
- Bicep šablono struktūra ir geriausios praktikos
- Išteklių priklausomybės ir diegimo tvarka
- Parametrų failai ir šablonų moduliškumas
- Pasirinktinių kablių kūrimas ir diegimo automatizavimas
- Konteinerių programų diegimo modeliai (greitas startas, gamyba, mikropaslaugos)

#### Praktinės užduotys
1. **Pasirinktinio šablono kūrimas**: Sukurkite kelių paslaugų programos šabloną
2. **Bicep meistriškumas**: Kurkite moduliarius, pakartotinai naudojamus infrastruktūros komponentus
3. **Diegimo automatizavimas**: Įgyvendinkite prieš/daug po diegimo kablius
4. **Architektūros projektavimas**: Įdiekite sudėtingą mikropaslaugų architektūrą
5. **Konteinerių programų diegimas**: Naudodami AZD įdiekite [Simple Flask API](../../../examples/container-app/simple-flask-api) ir [Microservices Architecture](../../../examples/container-app/microservices) pavyzdžius

#### Vertinimo klausimai
- Kaip kuriate pasirinktinius Bicep šablonus AZD?
- Kokios yra geriausios infrastruktūros kodo organizavimo praktikos?
- Kaip tvarkote išteklių priklausomybes šablonuose?
- Kokios diegimo schemos palaiko nulinį prastovų laiką?

---

### 5 skyrius: Daugiapločio AI sprendimai (6-7 savaitės)
**Trukmė**: 2-3 valandos | **Sudėtingumas**: ⭐⭐⭐⭐

#### Mokymosi tikslai
- Kurti ir įgyvendinti daugiapločio AI architektūras
- Koordinuoti agentų bendradarbiavimą ir komunikaciją
- Diegti gamybai paruoštus AI sprendimus su stebėjimu
- Suprasti agentų specializaciją ir darbo eigų modelius
- Integruoti konteinerizuotas mikropaslaugas kaip daugiapoločio sprendimo dalį

#### Pagrindinės sąvokos, kurias reikia įsisavinti
- Daugiapločio architektūros modeliai ir dizaino principai
- Agentų komunikacijos protokolai ir duomenų srautai
- Apkrovos balansavimo ir mastelio didinimo strategijos AI agentams
- Gamybinio stebėjimo principai daugiapločiuose sistemose
- Paslaugų komunikacija konteinerizuotoje aplinkoje

#### Praktinės užduotys
1. **Mažmeninės prekybos architektūros peržiūra**: Išanalizuokite mažmeninės prekybos šabloną ir nustatykite, kuriuos programų komponentus reikia įgyvendinti prieš diegimą
2. **Agentų pritaikymas**: Modifikuokite Kliento ir Atsargų agentų elgseną
3. **Architektūros mastelio keitimas**: Įgyvendinkite apkrovos balansavimą ir automatinį mastelio keitimą
4. **Gamybinis stebėjimas**: Nustatykite išsamų stebėjimą ir aliarmų sistemą
5. **Mikropaslaugų integracija**: Išplėskite [Microservices Architecture](../../../examples/container-app/microservices) pavyzdį, kad palaikytumėte agentų darbo eigas

#### Vertinimo klausimai
- Kaip projektuojate efektyvias daugiapločio agentų komunikacijos schemas?
- Kokie yra pagrindiniai AI agentų apkrovos mastelio didinimo aspektai?
- Kaip stebėti ir derinti daugiapločius AI sistemų agentus?
- Kokios gamybinės schemos užtikrina AI agentų patikimumą?

---

### 6 skyrius: Išankstinė diegimo patikra ir planavimas (8 savaitė)
**Trukmė**: 1 valanda | **Sudėtingumas**: ⭐⭐

#### Mokymosi tikslai
- Atlikti išsamią talpos planavimo ir išteklių patikrą
- Pasirinkti optimalias Azure SKU versijas sąnaudų efektyvumui
- Įgyvendinti automatizuotus išankstinius patikrinimus ir validaciją
- Planuoti diegimus taikant sąnaudų optimizavimo strategijas

#### Pagrindinės sąvokos, kurias reikia įsisavinti
- Azure išteklių kvotos ir talpos apribojimai
- SKU pasirinkimo kriterijai ir sąnaudų optimizavimas
- Automatizuotos patikros scenarijai ir testavimas
- Diegimo planavimas ir rizikos vertinimas

#### Praktinės užduotys
1. **Talpos analizė**: Įvertinkite savo programų išteklių poreikius
2. **SKU optimizavimas**: Palyginkite ir pasirinkite sąnaudų efektyvius paslaugų lygius
3. **Patikros automatizavimas**: Įgyvendinkite išankstinių patikrų scenarijus
4. **Sąnaudų planavimas**: Paruoškite diegimo sąnaudų įvertinimus ir biudžetus

#### Vertinimo klausimai
- Kaip patikrinote Azure talpą prieš diegimą?
- Kokie veiksniai lemia SKU pasirinkimą?
- Kaip automatizuoti išankstinę diegimo validaciją?
- Kokios strategijos padeda optimizuoti diegimo sąnaudas?

---

### 7 skyrius: Trikčių šalinimas ir derinimas (9 savaitė)
**Trukmė**: 1-1,5 valandos | **Sudėtingumas**: ⭐⭐

#### Mokymosi tikslai
- Kurti sistemingas derinimo metodikas AZD diegimams
- Spręsti dažniausiai pasitaikančias diegimo ir konfigūracijos problemas
- Derinti DI specifines problemas ir našumo klausimus
- Įgyvendinti stebėjimą ir aliarmus proaktyviam problemų aptikimui

#### Pagrindinės sąvokos, kurias reikia įsisavinti
- Diagnostikos metodai ir žurnalo tvarkymo strategijos
- Dažniausi gedimų modeliai ir jų sprendimai
- Veiklos stebėjimas ir optimizavimas
- Incidentų valdymo ir atkūrimo procedūros

#### Praktinės užduotys
1. **Diagnostikos įgūdžiai**: Praktikuokitės su specialiai sugadintais diegimais
2. **Žurnalų analizė**: Efektyviai naudokite Azure Monitor ir Application Insights
3. **Veiklos tuningas**: Optimizuokite lėtai veikiančias programas
4. **Atkūrimo procedūros**: Įgyvendinkite atsarginius kopijavimus ir avarijų atkūrimą

#### Vertinimo klausimai
- Kokios yra dažniausios AZD diegimo klaidos?
- Kaip derinti autentifikacijos ir leidimų problemas?
- Kokios stebėjimo strategijos padeda išvengti gamybinių problemų?
- Kaip optimizuoti programos veikimą Azure platformoje?

---

### 8 skyrius: Gamybiniai ir įmonių modeliai (10-11 savaitės)
**Trukmė**: 2-3 valandos | **Sudėtingumas**: ⭐⭐⭐⭐

#### Mokymosi tikslai
- Įgyvendinti įmonių lygio diegimo strategijas
- Projektuoti saugumo modelius ir atitikties sistemas
- Užtikrinti stebėjimą, valdymą ir sąnaudų kontrolę
- Kurti skalūruojamus CI/CD kanalus su AZD integracija
- Taikyti geriausias praktikas gamybinių konteinerių programų diegimui (saugumas, stebėjimas, sąnaudų optimizavimas, CI/CD)

#### Pagrindinės sąvokos, kurias reikia įsisavinti
- Įmonių saugumo ir atitikties reikalavimai
- Valdymo sistemos ir politikos įgyvendinimas
- Pažangus stebėjimas ir sąnaudų valdymas
- CI/CD integracija ir automatizuoti diegimo kanalai
- Mėlyno-žalio ir kanarinių diegimo strategijos konteinerizuotose apkrovose

#### Praktinės užduotys
1. **Įmonių saugumas**: Įgyvendinkite išsamias saugumo schemas
2. **Valdymo sistema**: Nustatykite Azure politiką ir išteklių valdymą
3. **Pažangus stebėjimas**: Sukurkite prietaisų skydelius ir automatizuotą aliarmų sistemą
4. **CI/CD integracija**: Sukurkite automatizuotus diegimo kanalus
5. **Gamybinės konteinerių programos**: Pritaikykite saugumą, stebėjimą ir sąnaudų optimizavimą [Microservices Architecture](../../../examples/container-app/microservices) pavyzdyje

#### Vertinimo klausimai
- Kaip įgyvendinti įmonių saugumą AZD diegimuose?
- Kokios valdymo schemos užtikrina atitiktį ir sąnaudų kontrolę?
- Kaip projektuoti skalūruojamą stebėjimą gamybos sistemoms?
- Kokios CI/CD schemos geriausiai tinka AZD darbo eigoms?

#### Mokymosi tikslai
- Suprasti Azure Developer CLI pagrindus ir esmines sąvokas
- Sėkmingai įdiegti ir sukonfigūruoti azd savo kūrimo aplinkoje
- Atlikti pirmąjį diegimą naudojant esamą šabloną
- Naršyti azd projekto struktūrą ir suprasti pagrindinius komponentus

#### Pagrindinės sąvokos, kurias reikia įsisavinti
- Šablonai, aplinkos ir paslaugos
- azure.yaml konfigūracijos struktūra
- Pagrindinės azd komandos (init, up, down, deploy)
- Infrastruktūra kaip kodas principai
- Azure autentifikacija ir autorizacija

#### Praktinės užduotys

**Užduotis 1.1: Diegimas ir nustatymai**
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

#### Savarankiškos vertinimo klausimai
1. Kokios yra trys pagrindinės azd architektūros sąvokos?
2. Kokia azure.yaml failo paskirtis?
3. Kaip aplinkos padeda valdyti skirtingus diegimo tikslus?
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

#### Savarankiškos vertinimo klausimai
1. Kaip azd tvarko aplinkos kintamųjų prioritetus?
2. Kas yra diegimo kabliai ir kada juos naudoti?
3. Kaip konfigūruojate skirtingiems aplinkoms skirtus SKU?
4. Kokios saugumo pasekmės skirtingoms autentifikacijos priemonėms?
5. Kaip valdote slaptuosius ir jautrius konfigūracijos duomenis?

### Modulis 3: Diegimas ir tiekimas (4 savaitė)

#### Mokymosi tikslai
- Įvaldyti diegimo darbo eigos ir geriausias praktikas
- Suprasti infrastruktūros kaip kodo principus naudojant Bicep šablonus
- Įgyvendinti sudėtingas kelių paslaugų architektūras
- Optimizuoti diegimo našumą ir patikimumą

#### Pagrindinės sąvokos, kurias reikia įsisavinti
- Bicep šablono struktūra ir moduliai
- Išteklių priklausomybės ir tvarka
- Diegimo strategijos (mėlynas-žalias, palaipsniui atnaujinimai)
- Kelių regionų diegimai
- Duomenų bazių migracijos ir duomenų valdymas

#### Praktinės užduotys

**Praktinė užduotis 3.1: Individuali infrastruktūra**
```text
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Praktinė užduotis 3.2: Daugelio paslaugų programa**
```text
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Praktinė užduotis 3.3: Duomenų bazės integracija**
```text
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Savęs vertinimo klausimai
1. Kokie yra Bicep naudojimo pranašumai prieš ARM šablonus?
2. Kaip tvarkote duomenų bazės migracijas azd diegimuose?
3. Kokios strategijos egzistuoja diegimams be prastovų?
4. Kaip valdote priklausomybes tarp paslaugų?
5. Kokie yra daugiarajoninių diegimų aspektai?

### Modulis 4: Diegimo išankstinė patikra (5 savaitė)

#### Mokymosi tikslai
- Įgyvendinti išsamias diegimo išankstines patikras
- Įvaldyti pajėgumų planavimą ir išteklių patikrą
- Suprasti SKU pasirinkimą ir sąnaudų optimizavimą
- Sukurti automatizuotus patikros skirstinius

#### Pagrindinės sąvokos
- Azure išteklių kvotos ir apribojimai
- SKU pasirinkimo kriterijai ir sąnaudų poveikis
- Automatizuotos patikros skriptai ir įrankiai
- Pajėgumų planavimo metodikos
- Veikimo testavimas ir optimizavimas

#### Praktinės užduotys

**Praktinė užduotis 4.1: Pajėgumų planavimas**
```text
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Praktinė užduotis 4.2: Išankstinė patikra**
```text
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Praktinė užduotis 4.3: SKU optimizavimas**
```text
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Savęs vertinimo klausimai
1. Kokie veiksniai turi įtakos SKU pasirinkimui?
2. Kaip patikrinate Azure išteklių prieinamumą prieš diegimą?
3. Kokios sudedamosios dalys sudaro išankstinės patikros sistemą?
4. Kaip apskaičiuojate ir kontroliuojate diegimo sąnaudas?
5. Koks stebėjimas yra būtinas pajėgumų planavimui?

### Modulis 5: Gedimų nustatymas ir taisymas (6 savaitė)

#### Mokymosi tikslai
- Įvaldyti sistemines gedimų nustatymo metodikas
- Tobulinti sudėtingų diegimo problemų taisymo įgūdžius
- Įgyvendinti išsamų stebėjimą ir perspėjimą
- Kurti reagavimo į incidentus ir atkūrimo procedūras

#### Pagrindinės sąvokos
- Dažniausios diegimo gedimų modeliai
- Žurnalų analizės ir koreliacijos technikos
- Veikimo stebėjimas ir optimizavimas
- Saugumo incidentų aptikimas ir reagavimas
- Atsparumo katastrofoms ir verslo tęstinumas

#### Praktinės užduotys

**Praktinė užduotis 5.1: Gedimų scenarijai**
```text
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Praktinė užduotis 5.2: Stebėjimo įgyvendinimas**
```text
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Praktinė užduotis 5.3: Incidentų valdymas**
```text
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Savęs vertinimo klausimai
1. Koks yra sisteminis požiūris į azd diegimų gedimų taisymą?
2. Kaip koreliuojate žurnalus tarp kelių paslaugų ir išteklių?
3. Kokie stebėjimo metrika yra svarbiausi ankstyvam problemų nustatymui?
4. Kaip įgyvendinate efektyvias katastrofų atkūrimo procedūras?
5. Kokie yra pagrindiniai incidentų valdymo plano elementai?

### Modulis 6: Pažangios temos ir geriausios praktikos (7-8 savaitės)

#### Mokymosi tikslai
- Įgyvendinti įmonės lygmens diegimo šablonus
- Įvaldyti CI/CD integraciją ir automatizavimą
- Kurti individualius šablonus ir prisidėti prie bendruomenės
- Suprasti pažangius saugumo ir atitikties reikalavimus

#### Pagrindinės sąvokos
- CI/CD pipeline integracijos modeliai
- Individualių šablonų kūrimas ir platinimas
- Įmonių valdymas ir atitiktis
- Pažangios tinklų ir saugumo konfiguracijos
- Veikimo optimizavimas ir sąnaudų valdymas

#### Praktinės užduotys

**Praktinė užduotis 6.1: CI/CD integracija**
```text
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**Praktinė užduotis 6.2: Individualių šablonų kūrimas**
```text
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Praktinė užduotis 6.3: Įmonių įgyvendinimas**
```text
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Savęs vertinimo klausimai
1. Kaip integruojate azd į esamas CI/CD darbo eigas?
2. Kokie yra pagrindiniai aspektai kuriant individualius šablonus?
3. Kaip įgyvendinate valdymą ir atitiktį azd diegimuose?
4. Kokios yra geriausios praktikos įmonių lygmens diegimams?
5. Kaip efektyviai prisidedate prie azd bendruomenės?

## Praktiniai projektai

### Projektas 1: Asmeninis portfelio svetainė
**Sudėtingumas**: Pradedantysis  
**Trukmė**: 1-2 savaitės

Sukurkite ir paleiskite asmeninę portfelio svetainę naudojant:
- Statinį svetainės talpinimą Azure Storage
- Individualios domeno konfigūracijos
- CDN integraciją pasaulinei našumui
- Automatizuotą diegimo pipeline

**Rezultatai**:
- Veikianti svetainė, paleista Azure
- Individualus azd šablonas portfelio diegimams
- Dokumentacija diegimo procesui
- Sąnaudų analizė ir optimizavimo rekomendacijos

### Projektas 2: Užduočių valdymo programa
**Sudėtingumas**: Vidutinis  
**Trukmė**: 2-3 savaitės

Sukurkite pilną užduočių valdymo programą:
- React frontend, paleistas App Service
- Node.js API backend su autentifikacija
- PostgreSQL duomenų bazė su migracijomis
- Application Insights stebėjimas

**Rezultatai**:
- Baigta programa su vartotojų autentifikacija
- Duomenų bazės schema ir migracijos skriptai
- Stebėjimo prietaisų skydeliai ir įspėjimų taisyklės
- Konfigūracija daugiaplanėms aplinkoms

### Projektas 3: Mikroservisų e. komercijos platforma
**Sudėtingumas**: Pažengęs  
**Trukmė**: 4-6 savaitės

Suplanuokite ir įgyvendinkite mikroservisų pagrindu veikiančią e. komercijos platformą:
- Keli API paslaugos (katalogas, užsakymai, mokėjimai, vartotojai)
- Žinučių eilės integracija su Service Bus
- Redis talpykla našumo optimizavimui
- Išsamus žurnalavimas ir stebėjimas

**Nuorodinė pavyzdys**: Žr. [Microservices Architecture](../../../examples/container-app/microservices) dėl dviejų paslaugų mokymo pavyzdžio ir diegimo gido. Eilės, išlikimas, autentifikacija, mokėjimų apdorojimas ir gamybos išgryninimas – atskiri projektai.

**Rezultatai**:
- Pilnas mikroservisų architektūros įgyvendinimas
- Tarp paslaugų komunikacijos modeliai
- Veikimo testavimas ir optimizavimas
- Gamybai paruoštas saugumo įgyvendinimas

## Vertinimas ir sertifikavimas

### Žinių patikrinimai

Atlikite šiuos vertinimus po kiekvieno modulio:

**1 modulio vertinimas**: Pagrindinės sąvokos ir diegimas
- Daugiareikšmių klausimų apie pagrindines sąvokas
- Praktinės diegimo ir konfigūracijos užduotys
- Paprasta diegimo užduotis

**2 modulio vertinimas**: Konfigūracija ir aplinkos
- Aplinkos valdymo scenarijai
- Konfigūracijos trikčių šalinimo pratimai
- Saugumo konfigūracijos įgyvendinimas

**3 modulio vertinimas**: Diegimas ir teikimas
- Infrastruktūros projektavimo iššūkiai
- Daugelio paslaugų diegimo scenarijai
- Veikimo optimizavimo pratimai

**4 modulio vertinimas**: Išankstinė patikra
- Pajėgumų planavimo atvejai
- Sąnaudų optimizavimo scenarijai
- Patikros pipeline įgyvendinimas

**5 modulio vertinimas**: Gedimų nustatymas ir taisymas
- Problemų diagnozės pratimai
- Stebėjimo įgyvendinimo užduotys
- Incidentų valdymo simuliacijos

**6 modulio vertinimas**: Pažangios temos
- CI/CD pipeline projektavimas
- Individualių šablonų kūrimas
- Įmonių architektūros scenarijai

### Paskutinis baigiamasis projektas

Suplanuokite ir įgyvendinkite pilną sprendimą, demonstruojantį visų sąvokų įvaldymą:

**Reikalavimai**:
- Daugiapakopė programų architektūra
- Kelių diegimo aplinkų palaikymas
- Išsamus stebėjimas ir perspėjimas
- Saugumo ir atitikties įgyvendinimas
- Sąnaudų optimizavimas ir veikimo reguliavimas
- Visa dokumentacija ir procedūrų vadovai

**Vertinimo kriterijai**:
- Techninio įgyvendinimo kokybė
- Dokumentacijos pilnumas
- Saugumo ir geriausių praktikų laikymasis
- Veikimo ir sąnaudų optimizavimas
- Gedimų nustatymo ir stebėjimo efektyvumas

## Mokymosi ištekliai ir nuorodos

### Oficiali dokumentacija
- [Azure Developer CLI dokumentacija](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep dokumentacija](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure architektūros centras](https://learn.microsoft.com/en-us/azure/architecture/)

### Bendruomenės ištekliai
- [AZD šablonų galerija](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub organizacija](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHub saugykla](https://github.com/Azure/azure-dev)

### Praktikos aplinkos
- [Azure nemokama paskyra](https://azure.microsoft.com/free/)
- [Azure DevOps nemokamas sluoksnis](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### Papildomi įrankiai
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Mokymosi tvarkaraščio rekomendacijos

### Visą darbo dieną mokymasis (8 savaitės)
- **1-2 savaitės**: Moduliai 1-2 (Pradžia, konfigūracija)
- **3-4 savaitės**: Moduliai 3-4 (Diegimas, išankstinė patikra)
- **5-6 savaitės**: Moduliai 5-6 (Gedimų taisymas, pažangios temos)
- **7-8 savaitės**: Praktiniai projektai ir galutinis vertinimas

### Pusę etato mokymasis (16 savaičių)
- **1-4 savaitės**: Modulis 1 (Pradžia)
- **5-7 savaitės**: Modulis 2 (Konfigūracija ir aplinkos)
- **8-10 savaitės**: Modulis 3 (Diegimas ir teikimas)
- **11-12 savaitės**: Modulis 4 (Išankstinė patikra)
- **13-14 savaitės**: Modulis 5 (Gedimų nustatymas ir taisymas)
- **15-16 savaitės**: Modulis 6 (Pažangios temos ir vertinimas)

---

## Progreso sekimo ir vertinimo sistema

### Skyrelio užbaigimo kontrolinis sąrašas

Sekite savo pažangą per kiekvieną skyrių su šiais matuojamais rezultatais:

#### 📚 1 skyrius: Pagrindai ir greitas startas
- [ ] **Diegimas baigtas**: AZD įdiegta ir patvirtinta Jūsų platformoje
- [ ] **Pirmas diegimas**: Sėkmingai paleistas todo-nodejs-mongo šablonas
- [ ] **Aplinkos nustatymas**: Sukonfigūruoti pirmieji aplinkos kintamieji
- [ ] **Ištekliai peržiūrėti**: Apžiūrėti ištekliai Azure portale
- [ ] **Komandų valdymas**: Patogiai naudojatės pagrindinėmis AZD komandomis

#### 🤖 2 skyrius: AI pirmasis vystymas  
- [ ] **AI šablono diegimas**: Sėkmingai paleista azure-search-openai-demo programa
- [ ] **RAG įgyvendinimas**: Sukonfigūruotas dokumentų indeksavimas ir paieška
- [ ] **Modelių konfigūracija**: Nustatyti keli AI modeliai skirtingoms paskirtims
- [ ] **AI stebėjimas**: Įdiegta Application Insights AI darbiniams krūviams
- [ ] **Veikimo optimizavimas**: Patobulintas AI programos veikimas

#### ⚙️ 3 skyrius: Konfigūracija ir autentifikacija
- [ ] **Daugiaplanė aplinka**: Sukonfigūruotos dev, staging ir prod aplinkos
- [ ] **Saugumo įgyvendinimas**: Įdiegta valdomos tapatybės autentifikacija
- [ ] **Slaptumų valdymas**: Integruotas Azure Key Vault jautriems duomenims
- [ ] **Parametrų valdymas**: Sukurtos aplinkai specifinės konfigūracijos
- [ ] **Autentifikacijos įvaldymas**: Įgyvendintos saugios prieigos schemos

#### 🏗️ 4 skyrius: Infrastruktūra kaip kodas ir diegimas
- [ ] **Individualaus šablono kūrimas**: Sukurtas daugelio paslaugų programos šablonas
- [ ] **Bicep įvaldymas**: Sukurti moduliniai, pakartotinai naudojami infrastruktūros komponentai
- [ ] **Diegimo automatizavimas**: Įgyvendinti diegimo prieš ir po veiksmų kabliai
- [ ] **Architektūros projektavimas**: Įdiegtas sudėtingas mikroservisų architektūros modelis
- [ ] **Šablonų optimizavimas**: Optimizuoti šablonai našumui ir sąnaudoms

#### 🎯 5 skyrius: Multi-agentų AI sprendimai
- [ ] **Retail architektūros apžvalga**: Nustatyti trūkstami programos komponentai ir suplanuota jų įgyvendinimo bei patikros tvarka
- [ ] **Agentų pritaikymas**: Keisti Vartotojo ir Inventoriaus agentų elgesiai
- [ ] **Architektūros mastelio didinimas**: Įdiegta apkrovos balansavimas ir automatinis mastelio keitimas
- [ ] **Gamybos stebėjimas**: Sukurta išsami stebėjimo ir perspėjimo sistema
- [ ] **Veikimo reguliavimas**: Optimizuotas multi-agentų sistemos veikimas

#### 🔍 6 skyrius: Išankstinė patikra ir planavimas
- [ ] **Pajėgumų analizė**: Išnagrinėti programų išteklių poreikiai
- [ ] **SKU optimizavimas**: Pasirinkti ekonomiškai efektyvūs paslaugų lygiai
- [ ] **Patikros automatizavimas**: Įgyvendinti diegimo išankstinių patikrų skriptus
- [ ] **Sąnaudų planavimas**: Parengti diegimo sąnaudų sąmatą ir biudžetus
- [ ] **Rizikų vertinimas**: Nustatyti ir sumažinti diegimo rizikas

#### 🚨 7 skyrius: Gedimų nustatymas ir taisymas
- [ ] **Diagnostikos įgūdžiai**: Sėkmingai pataisyti sąmoningai sugadinti diegimai
- [ ] **Žurnalų analizė**: Efektyviai naudotas Azure Monitor ir Application Insights
- [ ] **Veikimo reguliavimas**: Optimizuotos lėtai veikiančios programos
- [ ] **Atkūrimo procedūros**: Įgyvendintos atsarginės kopijos ir katastrofų atkūrimas
- [ ] **Stebėjimo įrengimas**: Sukurta proaktyvi stebėjimo ir perspėjimo sistema

#### 🏢 8 skyrius: Gamybos ir įmonių šablonai
- [ ] **Įmonių saugumas**: Įgyvendinti išsamūs saugumo modeliai
- [ ] **Valdymo sistema**: Sukonfigūruota Azure politika ir išteklių valdymas
- [ ] **Pažangus stebėjimas**: Sukurti prietaisų skydeliai ir automatizuotas perspėjimo taisyklės
- [ ] **CI/CD integracija**: Sukurtos automatizuotos diegimo grandinės
- [ ] **Atitikties įgyvendinimas**: Atitikimas įmonių standartams

### Mokymosi laiko planas ir etapai

#### 1-2 savaitės: Pagrindų kūrimas
- **Etapas**: Pirmoji AI programos diegimas naudojant AZD
- **Patvirtinimas**: Veikianti programa prieinama per viešą URL
- **Įgūdžiai**: Pagrindinės AZD darbo eigos ir AI paslaugų integracija

#### 3-4 savaitės: Konfigūracijos įvaldymas
- **Etapas**: Daugiaplanis diegimas su saugia autentifikacija
- **Patvirtinimas**: Ta pati programa diegiama dev/staging/prod aplinkose
- **Įgūdžiai**: Aplinkos valdymas ir saugumo įgyvendinimas

#### 5-6 savaitės: Infrastruktūros meistriškumas
- **Etapas**: Individualus šablonas sudėtingai daugelio paslaugų programai
- **Patvirtinimas**: Pakartotinai naudojamas šablonas diegiamas kito komandos nario
- **Įgūdžiai**: Bicep įvaldymas ir infrastruktūros automatizavimas

#### 7-8 savaitės: Pažangus AI įgyvendinimas
- **Etapas**: Gamybos lygio daugiaagentė AI sistema
- **Patvirtinimas**: Sistema veikia realiomis apkrovomis su stebėjimu
- **Įgūdžiai**: Multi-agentų valdymas ir veikimo optimizavimas

#### 9-10 savaitės: Gamybos paruošimas
- **Etapas**: Įmonės lygmens diegimas su pilnu atitikimu
- **Patvirtinimas**: Praeina saugumo peržiūrą ir sąnaudų auditą
- **Įgūdžiai**: Valdymas, stebėjimas ir CI/CD integracija

### Vertinimas ir sertifikavimas

#### Žinių patvirtinimo būdai
1. **Praktinės diegimo užduotys**: Veikiančios programėlės kiekvienam skyriui
2. **Kodo peržiūros**: Šablono ir konfigūracijos kokybės vertinimas
3. **Problemos sprendimas**: Gedimų šalinimo scenarijai ir sprendimai
4. **Bendrų mokymų vedimas**: Paaiškinti sąvokas kitiems besimokantiesiems
5. **Bendruomenės indėlis**: Dalintis šablonais arba patobulinimais

#### Profesinis tobulėjimas
- **Portfelio projektai**: Mokymosi diegimai ir architektūros pratimai; gamybai paruošimas reikalauja atskiro įgyvendinimo ir peržiūros
- **Techniniai įgūdžiai**: Pramonės standartų AZD ir AI diegimo žinios
- **Problemų sprendimo gebėjimai**: Savarankiškas gedimų šalinimas ir optimizavimas
- **Bendruomenės pripažinimas**: Aktyvus dalyvavimas Azure programuotojų bendruomenėje
- **Karjeros augimas**: Įgūdžiai, tiesiogiai pritaikomi debesų ir AI vaidmenyse

#### Sėkmės rodikliai
- **Diegimo sėkmės rodiklis**: >95 % sėkmingų diegimų
- **Gedimų šalinimo laikas**: <30 minučių dažniausioms problemoms
- **Veiklos optimizavimas**: Įrodytas sąnaudų ir veikimo efektyvumo pagerėjimas
- **Saugumo peržiūra**: Dokumentuoti valdiklius ir likusias spragas pagal jūsų organizacijos reikalavimus; kurso baigimas nereiškia atitikties sertifikavimo
- **Žinių perdavimas**: Gebėjimas mentorystės kitiems programuotojams

### Nuolatinis mokymasis ir bendruomenės įsitraukimas

#### Sekite naujienas
- **Azure naujinimai**: Sekite Azure Developer CLI išleidimo pastabas
- **Bendruomenės renginiai**: Dalyvaukite Azure ir AI programuotojų renginiuose
- **Dokumentacija**: Prisidėkite prie bendruomenės dokumentacijos ir pavyzdžių
- **Atgalinis ryšys**: Teikite atsiliepimus apie kurso turinį ir Azure paslaugas

#### Karjeros vystymas
- **Profesinis tinklas**: Užmegzkite ryšius su Azure ir AI ekspertais
- **Pranešimų galimybės**: Pristatykite įgytas žinias konferencijose ar susitikimuose
- **Atvirojo kodo indėlis**: Prisidėkite prie AZD šablonų ir įrankių kūrimo
- **Mentorystė**: Vadovaukite kitiems programuotojams jų AZD mokymosi kelyje

---

**Skyriaus naršymas:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../README.md)
- **📖 Pradėti mokytis**: [1 skyrius: Pagrindai ir greitas startas](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Progreso sekimas**: Stebėkite pažangą per visą 8 skyrių mokymosi sistemą
- **🤝 Bendruomenė**: [Azure Discord](https://discord.gg/microsoft-azure) pagalbai ir diskusijoms

**Mokymosi pažangos sekimas**: Naudokite šį struktūruotą vadovą, kad įvaldytumėte Azure Developer CLI per nuoseklų, praktišką mokymąsi su matuojamais rezultatais ir profesinės raidos nauda.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->