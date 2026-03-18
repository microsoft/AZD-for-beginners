# Studijų vadovas - Išsamūs mokymosi tikslai

**Mokymosi kelio navigacija**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../README.md)
- **📖 Pradėti mokytis**: [1 skyrius: Pagrindai ir greitas pradėjimas](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Progreso stebėjimas**: [Kurso užbaigimas](../README.md#-course-completion--certification)

## Įvadas

Šis išsamus studijų vadovas pateikia struktūrizuotus mokymosi tikslus, pagrindines koncepcijas, praktinius užduočių pavyzdžius ir vertinimo medžiagą, padedančią įvaldyti Azure Developer CLI (azd). Naudokite šį vadovą savo pažangai sekti ir įsitikinti, kad apėmėte visus esminius dalykus.

## Mokymosi tikslai

Užbaigę šį studijų vadovą, jūs:
- Įvaldysite visus Azure Developer CLI pagrindinius ir pažengusius konceptus
- Išvystysite praktinius įgūdžius diegiant ir valdant Azure programas
- Įgysite pasitikėjimo sprendžiant problemas ir optimizuojant diegimus
- Suprasite gamybai paruoštas diegimo praktikas ir saugumo aspektus

## Mokymosi rezultatai

Užbaigę visas šio studijų vadovo dalis, sugebėsite:
- Kurti, diegti ir valdyti pilnas programų architektūras naudojant azd
- Įgyvendinti išsamią stebėseną, saugumą ir kaštų optimizavimo strategijas
- Nepriklausomai spręsti sudėtingas diegimo problemas
- Kurti pasirinktinius šablonus ir prisidėti prie azd bendruomenės

## 8 skyrių mokymosi struktūra

### 1 skyrius: Pagrindai ir greitas pradėjimas (1 savaitė)
**Trukmė**: 30-45 minučių | **Sunkumo lygis**: ⭐

#### Mokymosi tikslai
- Suprasti Azure Developer CLI (AZD) pagrindines koncepcijas ir terminologiją
- Sėkmingai įdiegti ir sukonfigūruoti AZD savo vystymo aplinkoje
- Pirmą kartą pakeisti programą, naudodami esamą šabloną
- Efektyviai naršyti AZD komandų eilutės sąsają

#### Pagrindinės koncepcijos, kurias reikia įsisavinti
- AZD projekto struktūra ir komponentai (azure.yaml, infra/, src/)
- Šablonais pagrįsti diegimo darbo srautai
- Aplinkos konfigūracijos pagrindai
- Išteklų grupių ir prenumeratų valdymas

#### Praktinės užduotys
1. **Įdiegimo patikra**: Įdiekite AZD ir patikrinkite su `azd version`
2. **Pirmasis diegimas**: Sėkmingai įdiekite todo-nodejs-mongo šabloną
3. **Aplinkos nustatymas**: Sukonfigūruokite pirmuosius aplinkos kintamuosius
4. **Išteklų tyrinėjimas**: Naršykite įdiegti išteklius Azure portale

#### Vertinimo klausimai
- Kokie yra pagrindiniai AZD projekto komponentai?
- Kaip inicializuoti naują projektą iš šablono?
- Kuo skiriasi `azd up` ir `azd deploy`?
- Kaip valdyti kelias aplinkas su AZD?

---

### 2 skyrius: AI orientuotas vystymas (2 savaitė)
**Trukmė**: 1-2 valandos | **Sunkumo lygis**: ⭐⭐

#### Mokymosi tikslai
- Integruoti Microsoft Foundry paslaugas į AZD darbo srautus
- Diegti ir konfigūruoti AI palaikomas programas
- Suprasti RAG (Retrieval-Augmented Generation) įgyvendinimo modelius
- Valdyti AI modelių diegimus ir mastelį

#### Pagrindinės koncepcijos, kurias reikia įsisavinti
- Microsoft Foundry Models paslaugos integracija ir API valdymas
- AI paieškos konfigūracija ir vektorinis indeksavimas
- Modelių diegimo strategijos ir pajėgumų planavimas
- AI programų stebėsena ir našumo optimizacija

#### Praktinės užduotys
1. **AI pokalbių diegimas**: Įdiekite azure-search-openai-demo šabloną
2. **RAG įgyvendinimas**: Konfigūruokite dokumentų indeksavimą ir gavimą
3. **Modelių konfigūravimas**: Apsibrėžkite kelis AI modelius skirtingiems tikslams
4. **AI stebėsena**: Įdiekite Application Insights AI apkrovoms

#### Vertinimo klausimai
- Kaip konfigūruoti Microsoft Foundry Models paslaugas AZD šablone?
- Kokie yra pagrindiniai RAG architektūros komponentai?
- Kaip valdyti AI modelių pajėgumą ir mastelį?
- Kokie stebėsenos metrikai svarbūs AI programoms?

---

### 3 skyrius: Konfigūracija ir autentifikacija (3 savaitė)
**Trukmė**: 45-60 minučių | **Sunkumo lygis**: ⭐⭐

#### Mokymosi tikslai
- Įsisavinti aplinkos konfigūracijos ir valdymo strategijas
- Įgyvendinti saugius autentifikacijos modelius ir valdomas identybes
- Organizuoti išteklius naudojant tinkamas pavadinimų konvencijas
- Konfigūruoti daugiaaplinkes diegimo schemas (dev, staging, prod)

#### Pagrindinės koncepcijos, kurias reikia įsisavinti
- Aplinkos hierarchija ir konfigūracijos prioritetai
- Valdoma identybė ir serviso principal autentifikacija
- Key Vault integracija slaptoms reikšmėms valdyti
- Aplinkai specifinių parametrų valdymas

#### Praktinės užduotys
1. **Daugiaplinkės aplinkos nustatymas**: Sukonfigūruokite dev, staging ir prod aplinkas
2. **Saugumo konfigūracija**: Įgyvendinkite valdoma identiteto autentifikaciją
3. **Slaptumų valdymas**: Integruokite Azure Key Vault jautriems duomenims
4. **Parametrų valdymas**: Sukurkite aplinkai specifines konfigūracijas

#### Vertinimo klausimai
- Kaip sukonfigūruoti skirtingas aplinkas su AZD?
- Kokie yra valdytos identiteto privalumai prieš serviso principal?
- Kaip saugiai valdyti programos slaptumus?
- Kokia yra konfigūracijos hierarchija AZD?

---

### 4 skyrius: Infrastruktūra kaip kodas ir diegimas (4-5 savaitės)
**Trukmė**: 1-1.5 valandos | **Sunkumo lygis**: ⭐⭐⭐

#### Mokymosi tikslai
- Kurti ir pritaikyti Bicep infrastruktūros šablonus
- Įgyvendinti pažangius diegimo modelius ir darbo srautus
- Suprasti išteklių teikimo strategijas
- Projektuoti mastomas daugiapaslaugines architektūras

- Diegti konteinerizuotas programas naudojant Azure Container Apps ir AZD


#### Pagrindinės koncepcijos, kurias reikia įsisavinti
- Bicep šablono struktūra ir geriausios praktikos
- Išteklų priklausomybės ir diegimo tvarka
- Parametrų failai ir šablonų moduliškumas
- Pasirinktiniai kabliai ir diegimo automatizavimas
- Container app diegimo modeliai (greitas startas, gamyba, mikropaslaugos)

#### Praktinės užduotys
1. **Pasirinktinio šablono kūrimas**: Sukurkite daugiapaslaugę programos šabloną
2. **Bicep įvaldymas**: Sukurkite moduliškus, pakartotinai naudojamus infrastruktūros komponentus
3. **Diegimo automatizavimas**: Įgyvendinkite prieš ir po diegimo kablius
4. **Architektūros projektavimas**: Įdiekite sudėtingą mikropaslaugų architektūrą
5. **Container App diegimas**: Įdiekite [Paprastas Flask API](../../../examples/container-app/simple-flask-api) ir [Mikropaslaugų architektūra](../../../examples/container-app/microservices) pavyzdžius naudojant AZD

#### Vertinimo klausimai
- Kaip sukurti pasirinktinius Bicep šablonus AZD?
- Kokios yra geriausios praktikos infrastruktūros kodo organizavimui?
- Kaip tvarkyti išteklių priklausomybes šablonuose?
- Kokie diegimo modeliai palaiko be prastovų atnaujinimus?

---

### 5 skyrius: Daugiaagentės AI sprendimai (6-7 savaitės)
**Trukmė**: 2-3 valandos | **Sunkumo lygis**: ⭐⭐⭐⭐

#### Mokymosi tikslai
- Projektuoti ir įgyvendinti daugiaagentes AI architektūras
- Orkestruoti agentų koordinaciją ir komunikaciją
- Diegti gamybai tinkamus AI sprendimus su stebėsena
- Suprasti agentų specializaciją ir darbo srautų modelius
- Integruoti konteinerizuotas mikropaslaugas kaip daugiaagentės sistemos dalį

#### Pagrindinės koncepcijos, kurias reikia įsisavinti
- Daugiaagentės architektūros modeliai ir projektavimo principai
- Agentų komunikacijos protokolai ir duomenų srautas
- Apkrovos balansavimo ir mastelio strategijos AI agentams
- Gamybinė stebėsena daugiaagentėms sistemoms
- Paslaugų tarpusavio komunikacija konteinerizuotose aplinkose

#### Praktinės užduotys
1. **Mažmeninės prekybos sprendimo diegimas**: Įdiekite visą daugiaagentį mažmeninės prekybos scenarijų
2. **Agentų pritaikymas**: Pakeiskite Kliento ir Atsargų agentų elgseną
3. **Architektūros mastelio keitimas**: Įgyvendinkite apkrovos balansavimą ir automatinį mastelį
4. **Gamybinė stebėsena**: Sukonfigūruokite išsamią stebėseną ir perspėjimus
5. **Mikropaslaugų integracija**: Išplėskite [Mikropaslaugų architektūra](../../../examples/container-app/microservices) pavyzdį, kad palaikytų agentų pagrindu veikiančius darbo srautus

#### Vertinimo klausimai
- Kaip suprojektuoti veiksmingus daugiaagentės komunikacijos modelius?
- Kokie yra pagrindiniai aspektai mastelėjant AI agentų apkrovas?
- Kaip stebėti ir derinti daugiaagentes AI sistemas?
- Kokie gamybiniai modeliai užtikrina patikimumą AI agentams?

---

### 6 skyrius: Priešdiegiamoji validacija ir planavimas (8 savaitė)
**Trukmė**: 1 valanda | **Sunkumo lygis**: ⭐⭐

#### Mokymosi tikslai
- Atlikti išsamų pajėgumų planavimą ir išteklių validaciją
- Pasirinkti optimalias Azure SKU kaštų efektyvumui
- Įgyvendinti automatizuotus priešdiegiamuosius patikrinimus ir validaciją
- Planuoti diegimus taikant kaštų optimizavimo strategijas

#### Pagrindinės koncepcijos, kurias reikia įsisavinti
- Azure išteklių kvotos ir pajėgumų apribojimai
- SKU pasirinkimo kriterijai ir kaštų optimizacija
- Automatizuoti validavimo skriptai ir testavimas
- Diegimo planavimas ir rizikų vertinimas

#### Praktinės užduotys
1. **Pajėgumų analizė**: Analizuokite jūsų programų išteklių reikalavimus
2. **SKU optimizacija**: Palyginkite ir pasirinkite kaštų efektyvias paslaugų klases
3. **Validacijos automatizavimas**: Įgyvendinkite priešdiegiamuosius patikrinimo skriptus
4. **Kaštų planavimas**: Sudarykite diegimo kaštų sąmatą ir biudžetą

#### Vertinimo klausimai
- Kaip patikrinti Azure pajėgumus prieš diegimą?
- Kokie veiksniai įtakoja SKU pasirinkimą?
- Kaip automatizuoti priešdiegiamąją validaciją?
- Kokios strategijos padeda optimizuoti diegimo kaštus?

---

### 7 skyrius: Trikčių šalinimas ir derinimas (9 savaitė)
**Trukmė**: 1-1.5 valandos | **Sunkumo lygis**: ⭐⭐

#### Mokymosi tikslai
- Sukurti sistemingus derinimo metodus AZD diegimams
- Išspręsti dažniausias diegimo ir konfigūracijos problemas
- Derinti AI specifines problemas ir našumo klausimus
- Įgyvendinti stebėseną ir perspėjimus proaktyviam problemų aptikimui

#### Pagrindinės koncepcijos, kurias reikia įsisavinti
- Diagnostikos technikos ir žurnalų strategijos
- Dažniausi gedimų modeliai ir jų sprendimai
- Našumo stebėsena ir optimizacija
- Incidentų valdymo ir atkūrimo procedūros

#### Praktinės užduotys
1. **Diagnostikos įgūdžiai**: Praktikuokitės su tyčia sulaužytais diegimais
2. **Žurnalų analizė**: Efektyviai naudokite Azure Monitor ir Application Insights
3. **Našumo tunningas**: Optimizuokite lėtai veikiančias programas
4. **Atkūrimo procedūros**: Įdiekite atsargines kopijas ir nelaimių atkūrimą

#### Vertinimo klausimai
- Kokie yra dažniausiai pasitaikantys AZD diegimo klaidų atvejai?
- Kaip derinti autentifikacijos ir leidimų problemas?
- Kokios stebėsenos strategijos padeda išvengti gamybinių problemų?
- Kaip optimizuoti programų našumą Azure aplinkoje?

---

### 8 skyrius: Gamybinės ir įmoninės praktikos (10-11 savaitės)
**Trukmė**: 2-3 valandos | **Sunkumo lygis**: ⭐⭐⭐⭐

#### Mokymosi tikslai
- Įgyvendinti įmonės lygio diegimo strategijas
- Projektuoti saugumo modelius ir atitikties karkasus
- Nustatyti stebėseną, valdymą ir kaštų kontrolę
- Kurti mastomas CI/CD pipelines su AZD integracija
- Taikyti geriausias praktikas gamybiniams container app diegimams (saugumas, stebėsena, kaštai, CI/CD)

#### Pagrindinės koncepcijos, kurias reikia įsisavinti
- Įmonės saugumo ir atitikties reikalavimai
- Valdymo karkasai ir politikos įgyvendinimas
- Pažangi stebėsena ir kaštų valdymas
- CI/CD integracija ir automatizuoti diegimo pipeline'ai
- Blue-green ir canary diegimo strategijos konteinerizuotoms apkrovoms

#### Praktinės užduotys
1. **Įmonės saugumas**: Įgyvendinkite išsamius saugumo modelius
2. **Valdymo karkasas**: Sukonfigūruokite Azure Policy ir išteklių valdymą
3. **Pažangi stebėsena**: Sukurkite informacijos suvestines ir automatizuotus perspėjimus
4. **CI/CD integracija**: Sukurkite automatizuotus diegimo pipeline'us
5. **Gamybinės Container Apps**: Taikykite saugumą, stebėseną ir kaštų optimizavimą [Mikropaslaugų architektūra](../../../examples/container-app/microservices) pavyzdyje

#### Vertinimo klausimai
- Kaip įgyvendinti įmonės saugumą AZD diegimuose?
- Kokie valdymo modeliai užtikrina atitiktį ir kaštų kontrolę?
- Kaip suprojektuoti mastomą stebėseną gamybos sistemoms?
- Kokie CI/CD modeliai geriausiai veikia su AZD darbo srautais?

#### Mokymosi tikslai
- Suprasti Azure Developer CLI pagrindus ir pagrindines koncepcijas
- Sėkmingai įdiegti ir sukonfigūruoti azd savo vystymo aplinkoje
- Atlikti pirmąjį diegimą naudodami esamą šabloną
- Naršyti azd projekto struktūrą ir suprasti pagrindinius komponentus

#### Pagrindinės koncepcijos, kurias reikia įsisavinti
- Šablonai, aplinkos ir paslaugos
- azure.yaml konfigūracijos struktūra
- Pagrindinės azd komandos (init, up, down, deploy)
- Infrastruktūra kaip kodas principai
- Azure autentifikacija ir autorizacija

#### Praktinės užduotys

**Užduotis 1.1: Įdiegimas ir nustatymas**
```bash
# Atlikite šias užduotis:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Užduotis 1.2: Pirmasis diegimas**
```bash
# Diegti paprastą žiniatinklio programą:
1. Initialize project: azd init --template todo-nodejs-mongo
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
1. Kokios yra trys pagrindinės azd architektūros koncepcijos?
2. Koks yra azure.yaml failo paskirtis?
3. Kaip aplinkos padeda valdyti skirtingus diegimo tikslus?
4. Kokie autentifikacijos metodai gali būti naudojami su azd?
5. Kas vyksta, kai pirmą kartą paleidžiate `azd up`?

---

## Progreso stebėjimas ir vertinimo sistema
```bash
# Sukurti ir sukonfigūruoti kelias aplinkas:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Užduotis 2.2: Pažanginta konfigūracija**
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Užduotis 2.3: Saugumo konfigūracija**
```bash
# Laikykitės geriausių saugumo praktikų:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Savianalizės klausimai
1. Kaip azd tvarko aplinkos kintamųjų prioritetus?
2. Kas yra diegimo kabliai ir kada juos naudoti?
3. Kaip konfigūruoti skirtingus SKU skirtingoms aplinkoms?
4. Kokios yra skirtingų autentifikacijos metodų saugumo pasekmės?
5. Kaip valdyti slaptus duomenis ir jautrią konfigūraciją?

### 3 modulis: Diegimas ir tiekimas (4 savaitė)

#### Mokymosi tikslai
- Įvaldyti diegimo darbo srautus ir geriausias praktikas
- Suprasti infrastruktūrą kaip kodą naudojant Bicep šablonus
- Įgyvendinti sudėtingas daugiapaslaugines architektūras
- Optimizuoti diegimo našumą ir patikimumą

#### Pagrindinės koncepcijos, kurias reikia įsisavinti
- Bicep šablono struktūra ir moduliai
- Išteklų priklausomybės ir tvarka
- Diegimo strategijos (blue-green, rolling updates)
- Daugiaregioniai diegimai
- Duomenų bazių migracijos ir duomenų valdymas

#### Praktinės užduotys

**Užduotis 3.1: Pasirinktinė infrastruktūra**
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Užduotis 3.2: Daugiapaslaugė programa**
```bash
# Diegti mikroservisų architektūrą:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Užduotis 3.3: Duomenų bazės integracija**
```bash
# Įgyvendinti duomenų bazės diegimo šablonus:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Savianalizės klausimai
1. Kokie yra Bicep privalumai prieš ARM šablonus?
2. Kaip tvarkyti duomenų bazių migracijas azd diegimuose?
3. Kokios strategijos egzistuoja be prastovų diegimams?
4. Kaip valdyti priklausomybes tarp paslaugų?
5. Kokie yra daugiaregionių diegimų aspektai?

### 4 modulis: Priešdiegiamoji validacija (5 savaitė)

#### Mokymosi tikslai
- Įgyvendinti išsamius prieš diegiant atliekamus patikrinimus
- Įvaldyti pajėgumų planavimą ir išteklių patvirtinimą
- Suprasti SKU pasirinkimą ir kaštų optimizavimą
- Kurti automatizuotus patikros srautus

#### Pagrindinės sąvokos, kurias reikia įvaldyti
- Azure išteklių kvotos ir apribojimai
- SKU pasirinkimo kriterijai ir kaštų pasekmės
- Automatizuoti patikros skriptai ir įrankiai
- Pajėgumų planavimo metodikos
- Veikimo testavimas ir optimizavimas

#### Praktikos užduotys

**Exercise 4.1: Capacity Planning**
```bash
# Įgyvendinti talpos patikrinimą:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Exercise 4.2: Pre-flight Validation**
```powershell
# Sukurkite išsamų patikros (validacijos) procesą:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Exercise 4.3: SKU Optimization**
```bash
# Optimizuoti paslaugų konfigūracijas:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Savęs įvertinimo klausimai
1. Kokie veiksniai turėtų įtakoti SKU pasirinkimo sprendimus?
2. Kaip patikrinti Azure išteklių prieinamumą prieš diegimą?
3. Kokie yra pagrindiniai priešdienių tikrinimo (pre-flight) sistemos komponentai?
4. Kaip įvertinti ir kontroliuoti diegimo kaštus?
5. Kokia stebėsena yra būtina pajėgumų planavimui?

### Modulis 5: Trikčių šalinimas ir derinimas (6 savaitė)

#### Mokymosi tikslai
- Įvaldyti sistemines trikčių šalinimo metodikas
- Įgyti įgūdžių derinant sudėtingas diegimo problemas
- Įdiegti išsamią stebėseną ir perspėjimus
- Parengti incidentų valdymo ir atkūrimo procedūras

#### Pagrindinės sąvokos, kurias reikia įvaldyti
- Dažniausios diegimo klaidų modeliai
- Taisyklingos žurnalų analizės ir koreliavimo technikos
- Veikimo stebėsena ir optimizavimas
- Saugumo incidentų aptikimas ir reagavimas
- Atsparumo gedimams ir verslo tęstinumo užtikrinimas

#### Praktikos užduotys

**Exercise 5.1: Troubleshooting Scenarios**
```bash
# Praktikuokite spręsti įprastas problemas:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Exercise 5.2: Monitoring Implementation**
```bash
# Nustatykite išsamią stebėseną:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Exercise 5.3: Incident Response**
```bash
# Sukurkite incidentų reagavimo procedūras:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Savęs įvertinimo klausimai
1. Koks yra sisteminis požiūris į azd diegimų trikčių šalinimą?
2. Kaip koreliuoti žurnalus tarp kelių paslaugų ir resursų?
3. Kokie stebėsenos metrikai yra kritiškai svarbūs ankstyvam problemų aptikimui?
4. Kaip įgyvendinti veiksmingas atsarginių atkūrimo procedūras?
5. Kokie yra pagrindiniai incidentų valdymo plano komponentai?

### Modulis 6: Pažangios temos ir geriausios praktikos (7-8 savaitės)

#### Mokymosi tikslai
- Taikyti įmonės lygio diegimo modelius
- Įvaldyti CI/CD integraciją ir automatizavimą
- Kurti pasirinktinius šablonus ir prisidėti prie bendruomenės
- Suprasti pažangius saugumo ir atitikties reikalavimus

#### Pagrindinės sąvokos, kurias reikia įvaldyti
- CI/CD vamzdynų integracijos modeliai
- Pasirinktinių šablonų kūrimas ir platinimas
- Įmonės valdymas ir atitiktis
- Pažangios tinklų ir saugumo konfigūracijos
- Veikimo optimizavimas ir kaštų valdymas

#### Praktikos užduotys

**Exercise 6.1: CI/CD Integration**
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**Exercise 6.2: Custom Template Development**
```bash
# Sukurti ir paskelbti pasirinktinius šablonus:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Exercise 6.3: Enterprise Implementation**
```bash
# Įgyvendinti įmonės lygio funkcijas:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Savęs įvertinimo klausimai
1. Kaip integruoti azd į esamus CI/CD darbo eigų procesus?
2. Kokie yra pagrindiniai aspektai kuriant pasirinktinius šablonus?
3. Kaip įgyvendinti valdymą ir atitiktį azd diegimuose?
4. Kokios yra geriausios praktikos įmonės mastelio diegimams?
5. Kaip efektyviai prisidėti prie azd bendruomenės?

## Praktiniai projektai

### Projektas 1: Asmeninė portfelio svetainė
**Sudėtingumas**: Pradedantiesiems  
**Trukmė**: 1–2 savaitės

Sukurkite ir įdiekite asmeninę portfelio svetainę naudodami:
- Statinį svetainės talpinimą Azure Storage
- Individualaus domeno konfigūracija
- CDN integracija globaliam našumui
- Automatizuotas diegimo vamzdynas

**Rezultatai**:
- Veikianti svetainė, įdiegta Azure
- Individualus azd šablonas portfelio diegimams
- Diegimo proceso dokumentacija
- Kaštų analizė ir optimizavimo rekomendacijos

### Projektas 2: Užduočių valdymo programa
**Sudėtingumas**: Vidutinis  
**Trukmė**: 2–3 savaitės

Sukurkite pilno stalo (full-stack) užduočių valdymo programą su:
- React frontend, įdiegtu į App Service
- Node.js API backend su autentifikacija
- PostgreSQL duomenų baze su migracijomis
- Application Insights stebėsena

**Rezultatai**:
- Pilna programa su vartotojų autentifikacija
- Duomenų bazės schema ir migracijos skriptai
- Stebėjimo informacijos suvestinės ir perspėjimų taisyklės
- Daugiaplokštės aplinkos diegimo konfigūracija

### Projektas 3: Mikroservisų el. prekybos platforma
**Sudėtingumas**: Pažengęs  
**Trukmė**: 4–6 savaitės

Sukurkite ir įgyvendinkite mikroservisais pagrįstą el. prekybos platformą:
- Kelios API paslaugos (katalogas, užsakymai, mokėjimai, vartotojai)
- Žinučių eilės integracija su Service Bus
- Redis talpykla našumo optimizavimui
- Išsami žurnalo kaupimo ir stebėsenos sistema

**Pavyzdys**: Žr. [Mikroservisų architektūra](../../../examples/container-app/microservices) dėl gamybai paruošto šablono ir diegimo vadovo

**Rezultatai**:
- Pilna mikroservisų architektūra
- Tarppaslauginė komunikacijos modeliai
- Veikimo testavimas ir optimizavimas
- Gamybai paruoštas saugumo įgyvendinimas

## Vertinimas ir sertifikacija

### Žinių patikrinimai

Atlikite šiuos vertinimus po kiekvieno modulio:

**Modulis 1 Vertinimas**: Pagrindinės sąvokos ir diegimas
- Klausimai su pasirinkimais apie pagrindines sąvokas
- Praktinės diegimo ir konfigūracijos užduotys
- Paprastas diegimo pratimas

**Modulis 2 Vertinimas**: Konfigūracija ir aplinkos
- Aplinkos valdymo scenarijai
- Konfigūracijos trikčių šalinimo užduotys
- Saugumo konfigūracijos įgyvendinimas

**Modulis 3 Vertinimas**: Diegimas ir provizionavimas
- Infrastruktūros projektavimo iššūkiai
- Daugiapaslaugio diegimo scenarijai
- Veikimo optimizavimo užduotys

**Modulis 4 Vertinimas**: Priešdiegiami patikrinimai
- Pajėgumų planavimo atvejų analizė
- Kaštų optimizavimo scenarijai
- Patikros vamzdyno įgyvendinimas

**Modulis 5 Vertinimas**: Trikčių šalinimas ir derinimas
- Problemų diagnozavimo užduotys
- Stebėsenos įgyvendinimo užduotys
- Incidentų valdymo simuliacijos

**Modulis 6 Vertinimas**: Pažangios temos
- CI/CD vamzdyno projektavimas
- Pasirinktinių šablonų kūrimas
- Įmonės architektūros scenarijai

### Baigiamasis projektas

Sukurkite ir įgyvendinkite pilną sprendimą, demonstruojantį visų koncepcijų išmanymą:

**Reikalavimai**:
- Daugiapakopė programos architektūra
- Kelios diegimo aplinkos
- Išsami stebėsena ir perspėjimai
- Saugumo ir atitikties įgyvendinimas
- Kaštų optimizavimas ir veikimo derinimas
- Pilna dokumentacija ir veikimo instrukcijos (runbooks)

**Vertinimo kriterijai**:
- Techninio įgyvendinimo kokybė
- Dokumentacijos pilnumas
- Saugumo ir geriausių praktikų laikymasis
- Veikimas ir kaštų optimizavimas
- Trikčių šalinimo ir stebėsenos efektyvumas

## Studijų ištekliai ir nuorodos

### Oficialioji dokumentacija
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

## Studijų tvarkaraščio rekomendacijos

### Pilno laiko studijos (8 savaitės)
- **1–2 savaitės**: Moduliai 1–2 (Pradžia, Konfigūracija)
- **3–4 savaitės**: Moduliai 3–4 (Diegimas, Priešdiegiami patikrinimai)
- **5–6 savaitės**: Moduliai 5–6 (Trikčių šalinimas, Pažangios temos)
- **7–8 savaitės**: Praktiniai projektai ir baigiamasis vertinimas

### Ne pilno laiko studijos (16 savaičių)
- **1–4 savaitės**: Modulis 1 (Pradžia)
- **5–7 savaitės**: Modulis 2 (Konfigūracija ir aplinkos)
- **8–10 savaitės**: Modulis 3 (Diegimas ir provizionavimas)
- **11–12 savaitės**: Modulis 4 (Priešdiegiami patikrinimai)
- **13–14 savaitės**: Modulis 5 (Trikčių šalinimas ir derinimas)
- **15–16 savaitės**: Modulis 6 (Pažangios temos ir vertinimas)

---

## Progreso sekimas ir vertinimo sistema

### Skyriaus užbaigimo kontrolinis sąrašas

Stebėkite savo pažangą per kiekvieną skyrių naudodami šiuos išmatuojamus rezultatus:

#### 📚 Skyrius 1: Pagrindai ir greitas startas
- [ ] **Įdiegimas baigtas**: AZD įdiegta ir patvirtinta jūsų platformoje
- [ ] **Pirmasis diegimas**: Sėkmingai įdiegtas todo-nodejs-mongo šablonas
- [ ] **Aplinkos nustatymas**: Sukonfigūruoti pirmieji aplinkos kintamieji
- [ ] **Resursų naršymas**: Peržiūrėti įdiegtus resursus Azure portale
- [ ] **Komandų įvaldymas**: Patogiai naudojatės pagrindinėmis AZD komandomis

#### 🤖 Skyrius 2: AI orientuotas vystymas  
- [ ] **AI šablono diegimas**: Sėkmingai įdiegtas azure-search-openai-demo
- [ ] **RAG įgyvendinimas**: Sukonfigūruotas dokumentų indeksavimas ir gavimas
- [ ] **Modelių konfigūravimas**: Nustatyti keli AI modeliai skirtingiems tikslams
- [ ] **AI stebėsena**: Įdiegta Application Insights AI apkrovoms
- [ ] **Veikimo optimizavimas**: Parinktas AI programos veikimo tobulinimas

#### ⚙️ Skyrius 3: Konfigūracija ir autentifikacija
- [ ] **Daugiaplokštė aplinka**: Sukonfigūruotos dev, staging ir prod aplinkos
- [ ] **Saugumo įgyvendinimas**: Nustatyta valdomos tapatybės autentifikacija
- [ ] **Slapukų valdymas**: Integruotas Azure Key Vault konfidencialiems duomenims
- [ ] **Parametrų valdymas**: Sukurta aplinkai specifiška konfigūracija
- [ ] **Autentifikacijos įvaldymas**: Įgyvendinti saugūs prieigos modeliai

#### 🏗️ Skyrius 4: Infrastruktūra kaip kodas ir diegimas
- [ ] **Pasirinktinio šablono kūrimas**: Sukurtas daugiaservisinės aplikacijos šablonas
- [ ] **Bicep įvaldymas**: Sukurti moduliniai, pakartotinai naudojami infrastruktūros komponentai
- [ ] **Diegimo automatizavimas**: Įdiegti prieš / po diegimo hook'ai
- [ ] **Architektūros dizainas**: Išdiegta sudėtinga mikroservisų architektūra
- [ ] **Šablono optimizavimas**: Optimizuoti šablonai našumui ir kaštams

#### 🎯 Skyrius 5: Multi-Agent AI sprendimai
- [ ] **Mažmeninės prekybos sprendimo diegimas**: Išdiegta pilna multi-agent mažmeninės prekybos situacija
- [ ] **Agentų pritaikymas**: Modifikuoti Kliento ir Inventoriaus agentų elgesiai
- [ ] **Architektūros mastelio didinimas**: Įdiegta apkrovos balansavimas ir auto-scaling
- [ ] **Gamybinė stebėsena**: Nustatyta išsami stebėsena ir perspėjimai
- [ ] **Veikimo derinimas**: Optimizuotas multi-agent sistemos veikimas

#### 🔍 Skyrius 6: Priešdiegiami patikrinimai ir planavimas
- [ ] **Pajėgumų analizė**: Įvertinti aplikacijų resursų poreikiai
- [ ] **SKU optimizavimas**: Parinkti kaštų efektyvūs paslaugų lygiai
- [ ] **Patikros automatizavimas**: Įdiegti priešdiegiami patikros skriptai
- [ ] **Kaštų planavimas**: Sukurti diegimo kaštų sąmatas ir biudžetus
- [ ] **Rizikos vertinimas**: Nustatyti ir mažinti diegimo rizikas

#### 🚨 Skyrius 7: Trikčių šalinimas ir derinimas
- [ ] **Diagnostikos įgūdžiai**: Sėkmingai išspręstos specialiai sukelto klaidingo diegimo problemos
- [ ] **Žurnalo analizė**: Efektyviai naudojamas Azure Monitor ir Application Insights
- [ ] **Veikimo tobulinimas**: Optimizuotos lėtai veikiančios aplikacijos
- [ ] **Atkūrimo procedūros**: Įdiegta atsarginių kopijų ir gedimų atkūrimo sistema
- [ ] **Stebėsenos nustatymas**: Sukurta proaktyvi stebėsena ir perspėjimai

#### 🏢 Skyrius 8: Gamybiniai ir įmonės modeliai
- [ ] **Įmonės saugumas**: Įgyvendintos išsamios saugumo praktikos
- [ ] **Valdymo sistema**: Nustatyta Azure Policy ir resursų valdymas
- [ ] **Pažangi stebėsena**: Sukurtos informacijos suvestinės ir automatizuoti perspėjimai
- [ ] **CI/CD integracija**: Sukurti automatizuoti diegimo vamzdynai
- [ ] **Atitikties įgyvendinimas**: Atitikta įmonės atitikties reikalavimai

### Mokymosi laiko planas ir etapai

#### 1–2 savaitės: Pagrindų formavimas
- **Tikslas**: Įdiegti pirmą AI aplikaciją naudojant AZD
- **Validacija**: Veikianti aplikacija pasiekiama per viešą URL
- **Įgūdžiai**: Baziniai AZD darbo srautai ir AI paslaugų integracija

#### 3–4 savaitės: Konfigūracijos įvaldymas
- **Tikslas**: Daugiaplokštis diegimas su saugia autentifikacija
- **Validacija**: Ta pati aplikacija išdiegta dev/staging/prod aplinkose
- **Įgūdžiai**: Aplinkos valdymas ir saugumo įgyvendinimas

#### 5–6 savaitės: Infrastruktūros kompetencija
- **Tikslas**: Pasirinktinis šablonas sudėtingai daugiaservisinei aplikacijai
- **Validacija**: Pakartotinai naudojamas šablonas įdiegtas kito komandos nario
- **Įgūdžiai**: Bicep įvaldymas ir infrastruktūros automatizavimas

#### 7–8 savaitės: Pažangus AI įgyvendinimas
- **Tikslas**: Gamybai paruoštas multi-agent AI sprendimas
- **Validacija**: Sistema tvarko realaus pasaulio apkrovą su stebėsena
- **Įgūdžiai**: Multi-agent orkestracija ir veikimo optimizavimas

#### 9–10 savaitės: Gamybinis pasirengimas
- **Tikslas**: Įmonės lygio diegimas su pilna atitiktimi
- **Validacija**: Praeina saugumo peržiūrą ir kaštų auditą
- **Įgūdžiai**: Valdymas, stebėsena ir CI/CD integracija

### Vertinimas ir sertifikacija

#### Žinių patikrinimo metodai
1. **Praktiniai diegimai**: Veikiančios aplikacijos kiekvienam skyriui
2. **Kodo peržiūros**: Šablonų ir konfigūracijos kokybės vertinimas
3. **Problemų sprendimas**: Trikčių šalinimo scenarijai ir sprendimai
4. **Mokymas bendraamžiams**: Paaiškinti koncepcijas kitiems besimokantiesiems
5. **Bendruomenės indėlis**: Dalintis šablonais ar patobulinimais

#### Profesinio tobulėjimo rezultatai
- **Portfelio projektai**: 8 gamybai paruošti diegimai
- **Techninės įgūdžiai**: AZD ir AI diegimo kompetencija pagal pramonės standartus
- **Gebėjimai spręsti problemas**: Nepriklausomas trikčių šalinimas ir optimizavimas
- **Bendruomenės pripažinimas**: Aktyvus dalyvavimas Azure kūrėjų bendruomenėje
- **Karjeros pažanga**: Įgūdžiai tiesiogiai pritaikomi debesų ir AI pareigoms

#### Sėkmės rodikliai
- **Diegimų sėkmės rodiklis**: >95% sėkmingų diegimų
- **Trikčių šalinimo laikas**: <30 minučių įprastoms problemoms
- **Našumo optimizavimas**: Matomi patobulinimai sąnaudų ir našumo srityje
- **Saugumo atitiktis**: VisI diegimai atitinka įmonės saugumo standartus
- **Žinių perdavimas**: Gebėjimas mentorinti kitus kūrėjus

### Nuolatinis mokymasis ir bendruomenės įsitraukimas

#### Sekite naujienas
- **Azure naujinimai**: Sekite Azure Developer CLI išleidimo pastabas
- **Bendruomenės renginiai**: Dalyvaukite Azure ir AI kūrėjų renginiuose
- **Dokumentacija**: Prisidėkite prie bendruomenės dokumentacijos ir pavyzdžių
- **Atsiliepimų ciklas**: Teikite atsiliepimus apie kurso turinį ir Azure paslaugas

#### Karjeros plėtra
- **Profesinis tinklas**: Užmegzkite ryšius su Azure ir AI ekspertais
- **Pranešimo galimybės**: Pristatykite įgytas žinias konferencijose ar susitikimuose
- **Indėlis į atvirojo kodo projektus**: Prisidėkite prie AZD šablonų ir įrankių
- **Mentorystė**: Veskite kitus kūrėjus jų AZD mokymosi kelyje

---

**Skyrių naršymas:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../README.md)
- **📖 Pradėkite mokytis**: [1 skyrius: Pagrindai ir greitas startas](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Pažangos sekimas**: Sekite savo pažangą per visapusišką 8 skyrių mokymosi sistemą
- **🤝 Bendruomenė**: [Azure Discord](https://discord.gg/microsoft-azure) pagalbos ir diskusijų tikslais

**Studijų pažangos sekimas**: Naudokite šį struktūruotą vadovą, kad įvaldytumėte Azure Developer CLI per palaipsninį, praktinį mokymąsi su išmatuojamais rezultatais ir profesinio tobulėjimo nauda.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant AI vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatizuoti vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Dėl svarbios informacijos rekomenduojamas profesionalus, žmogaus atliktas vertimas. Mes neatsakome už jokius nesusipratimus ar neteisingus aiškinimus, kilusius dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->