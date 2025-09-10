<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7634850a19864a183bc82ab5ac993c8a",
  "translation_date": "2025-09-10T07:21:44+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "lt"
}
-->
# Mokymosi vadovas - AZD pradedantiesiems

## Įvadas

Šis išsamus mokymosi vadovas pateikia struktūrizuotus mokymosi tikslus, pagrindines sąvokas, praktinius pratimus ir vertinimo medžiagą, padėsiančią jums įvaldyti Azure Developer CLI (azd). Naudokite šį vadovą, kad stebėtumėte savo pažangą ir užtikrintumėte, jog apėmėte visas svarbiausias temas.

## Mokymosi tikslai

Baigę šį mokymosi vadovą, jūs:
- Įvaldysite visas pagrindines ir pažangias Azure Developer CLI sąvokas
- Išsiugdysite praktinius įgūdžius diegiant ir valdant Azure programas
- Įgysite pasitikėjimo sprendžiant problemas ir optimizuojant diegimus
- Suprasite gamybai paruoštų diegimų praktiką ir saugumo aspektus

## Mokymosi rezultatai

Baigę visas šio mokymosi vadovo dalis, jūs galėsite:
- Kurti, diegti ir valdyti pilnas programų architektūras naudodami azd
- Įgyvendinti išsamias stebėsenos, saugumo ir kaštų optimizavimo strategijas
- Savarankiškai spręsti sudėtingas diegimo problemas
- Kurti individualius šablonus ir prisidėti prie azd bendruomenės

## Kurso struktūra

### 1 modulis: Pradžia (1-2 savaitės)

#### Mokymosi tikslai
- Suprasti Azure Developer CLI pagrindus ir pagrindines sąvokas
- Sėkmingai įdiegti ir sukonfigūruoti azd savo kūrimo aplinkoje
- Atlikti pirmąjį diegimą naudojant esamą šabloną
- Naršyti azd projekto struktūrą ir suprasti pagrindinius komponentus

#### Pagrindinės sąvokos
- Šablonai, aplinkos ir paslaugos
- azure.yaml konfigūracijos struktūra
- Pagrindinės azd komandos (init, up, down, deploy)
- Infrastruktūra kaip kodas principai
- Azure autentifikacija ir autorizacija

#### Praktiniai pratimai

**Pratimas 1.1: Diegimas ir nustatymas**  
```bash
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Pratimas 1.2: Pirmasis diegimas**  
```bash
# Deploy a simple web application:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**Pratimas 1.3: Projekto struktūros analizė**  
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### Savikontrolės klausimai
1. Kokios yra trys pagrindinės azd architektūros sąvokos?
2. Kokia yra azure.yaml failo paskirtis?
3. Kaip aplinkos padeda valdyti skirtingus diegimo tikslus?
4. Kokie autentifikacijos metodai gali būti naudojami su azd?
5. Kas nutinka, kai pirmą kartą paleidžiate `azd up`?

### 2 modulis: Konfigūracija ir aplinkos (3 savaitė)

#### Mokymosi tikslai
- Įvaldyti aplinkų valdymą ir konfigūraciją
- Suprasti pažangias azure.yaml konfigūracijas
- Įgyvendinti aplinkai specifinius nustatymus ir kintamuosius
- Konfigūruoti autentifikaciją skirtingoms situacijoms

#### Pagrindinės sąvokos
- Aplinkų hierarchija ir kintamųjų prioriteto tvarka
- Paslaugų konfigūracija ir parametrai
- Kabliukai ir gyvavimo ciklo įvykiai
- Autentifikacijos metodai (vartotojas, paslaugų paskyra, valdomoji tapatybė)
- Konfigūracijos failų valdymas

#### Praktiniai pratimai

**Pratimas 2.1: Kelių aplinkų nustatymas**  
```bash
# Create and configure multiple environments:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Pratimas 2.2: Pažangi konfigūracija**  
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Pratimas 2.3: Saugumo konfigūracija**  
```bash
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Savikontrolės klausimai
1. Kaip azd tvarko aplinkos kintamųjų prioriteto tvarką?
2. Kas yra diegimo kabliukai ir kada juos naudoti?
3. Kaip konfigūruoti skirtingus SKUs skirtingoms aplinkoms?
4. Kokios yra skirtingų autentifikacijos metodų saugumo pasekmės?
5. Kaip valdyti slaptažodžius ir jautrius konfigūracijos duomenis?

### 3 modulis: Diegimas ir paruošimas (4 savaitė)

#### Mokymosi tikslai
- Įvaldyti diegimo darbo eigas ir geriausias praktikas
- Suprasti infrastruktūrą kaip kodą naudojant Bicep šablonus
- Įgyvendinti sudėtingas kelių paslaugų architektūras
- Optimizuoti diegimo našumą ir patikimumą

#### Pagrindinės sąvokos
- Bicep šablonų struktūra ir moduliai
- Išteklių priklausomybės ir tvarka
- Diegimo strategijos (mėlyna-žalia, laipsniški atnaujinimai)
- Kelių regionų diegimai
- Duomenų bazių migracijos ir valdymas

#### Praktiniai pratimai

**Pratimas 3.1: Individuali infrastruktūra**  
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Pratimas 3.2: Kelių paslaugų programa**  
```bash
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Pratimas 3.3: Duomenų bazės integracija**  
```bash
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Savikontrolės klausimai
1. Kokie yra Bicep privalumai, palyginti su ARM šablonais?
2. Kaip tvarkyti duomenų bazių migracijas azd diegimuose?
3. Kokios strategijos egzistuoja diegimams be prastovų?
4. Kaip valdyti priklausomybes tarp paslaugų?
5. Kokie yra kelių regionų diegimų aspektai?

### 4 modulis: Prieš diegimą atliekama patikra (5 savaitė)

#### Mokymosi tikslai
- Įgyvendinti išsamias prieš diegimą atliekamas patikras
- Įvaldyti pajėgumų planavimą ir išteklių patikrą
- Suprasti SKU pasirinkimą ir kaštų optimizavimą
- Kurti automatizuotas patikros darbo eigas

#### Pagrindinės sąvokos
- Azure išteklių kvotos ir limitai
- SKU pasirinkimo kriterijai ir kaštų pasekmės
- Automatizuoti patikros scenarijai ir įrankiai
- Pajėgumų planavimo metodologijos
- Našumo testavimas ir optimizavimas

#### Praktiniai pratimai

**Pratimas 4.1: Pajėgumų planavimas**  
```bash
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Pratimas 4.2: Prieš diegimą atliekama patikra**  
```powershell
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Pratimas 4.3: SKU optimizavimas**  
```bash
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Savikontrolės klausimai
1. Kokie veiksniai turėtų lemti SKU pasirinkimo sprendimus?
2. Kaip patikrinti Azure išteklių prieinamumą prieš diegimą?
3. Kokie yra pagrindiniai prieš diegimą atliekamos patikros sistemos komponentai?
4. Kaip įvertinti ir kontroliuoti diegimo kaštus?
5. Kokie stebėjimo aspektai yra būtini pajėgumų planavimui?

### 5 modulis: Trikčių šalinimas ir derinimas (6 savaitė)

#### Mokymosi tikslai
- Įvaldyti sistemingas trikčių šalinimo metodikas
- Įgyti patirties derinant sudėtingas diegimo problemas
- Įgyvendinti išsamią stebėseną ir įspėjimus
- Kurti incidentų valdymo ir atkūrimo procedūras

#### Pagrindinės sąvokos
- Dažniausi diegimo klaidų modeliai
- Žurnalų analizės ir koreliacijos technikos
- Našumo stebėjimas ir optimizavimas
- Saugumo incidentų aptikimas ir reagavimas
- Atsigavimas po nelaimių ir verslo tęstinumas

#### Praktiniai pratimai

**Pratimas 5.1: Trikčių šalinimo scenarijai**  
```bash
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Pratimas 5.2: Stebėjimo įgyvendinimas**  
```bash
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Pratimas 5.3: Incidentų valdymas**  
```bash
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Savikontrolės klausimai
1. Koks yra sistemingas požiūris į azd diegimų trikčių šalinimą?
2. Kaip koreliuoti žurnalus tarp kelių paslaugų ir išteklių?
3. Kokie stebėjimo rodikliai yra svarbiausi ankstyvam problemų aptikimui?
4. Kaip įgyvendinti veiksmingas atkūrimo po nelaimių procedūras?
5. Kokie yra pagrindiniai incidentų valdymo plano komponentai?

### 6 modulis: Pažangios temos ir geriausios praktikos (7-8 savaitės)

#### Mokymosi tikslai
- Įgyvendinti įmonės lygio diegimo modelius
- Įvaldyti CI/CD integraciją ir automatizavimą
- Kurti individualius šablonus ir prisidėti prie bendruomenės
- Suprasti pažangius saugumo ir atitikties reikalavimus

#### Pagrindinės sąvokos
- CI/CD darbo eigų integracijos modeliai
- Individualių šablonų kūrimas ir platinimas
- Įmonės valdymas ir atitiktis
- Pažangios tinklų ir saugumo konfigūracijos
- Našumo optimizavimas ir kaštų valdymas

#### Praktiniai pratimai

**Pratimas 6.1: CI/CD integracija**  
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**Pratimas 6.2: Individualių šablonų kūrimas**  
```bash
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Pratimas 6.3: Įmonės įgyvendinimas**  
```bash
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Savikontrolės klausimai
1. Kaip integruoti azd į esamas CI/CD darbo eigas?
2. Kokie yra pagrindiniai individualių šablonų kūrimo aspektai?
3. Kaip įgyvendinti valdymą ir atitiktį azd diegimuose?
4. Kokios yra geriausios praktikos diegiant įmonės mastu?
5. Kaip efektyviai prisidėti prie azd bendruomenės?
3. **Prisidėkite prie atvirojo kodo**: Dalinkitės savo šablonais ir sprendimais su bendruomene  
4. **Mokykite kitus**: Aiškinant koncepcijas kitiems, sustiprinsite savo supratimą  
5. **Išlikite smalsūs**: Nuolat tyrinėkite naujas Azure paslaugas ir integracijos modelius  

---

**Navigacija**  
- **Ankstesnė pamoka**: [DUK](faq.md)  
- **Kita pamoka**: [Pakeitimų žurnalas](../changelog.md)  

**Mokymosi pažangos stebėjimas**: Naudokite šį vadovą, kad stebėtumėte savo mokymosi kelionę ir užtikrintumėte visapusišką Azure Developer CLI koncepcijų ir praktikų aprėptį.  

---

**Atsakomybės apribojimas**:  
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, atkreipiame dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Dėl svarbios informacijos rekomenduojama naudotis profesionalių vertėjų paslaugomis. Mes neprisiimame atsakomybės už nesusipratimus ar klaidingus aiškinimus, kylančius dėl šio vertimo naudojimo.