<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee6549c72fe4271931326578e2379243",
  "translation_date": "2025-09-18T14:14:27+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "lt"
}
-->
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
- Suprasite pasirengimo gamybai diegimo praktikas ir saugumo aspektus

## Mokymosi rezultatai

Baigę visas šio studijų vadovo dalis, jūs galėsite:
- Kurti, diegti ir valdyti pilnas aplikacijų architektūras naudodami azd
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
- Efektyviai naršyti AZD komandinės eilutės sąsajoje

#### Pagrindinės sąvokos, kurias reikia įvaldyti
- AZD projekto struktūra ir komponentai (azure.yaml, infra/, src/)
- Diegimo darbo eiga pagal šablonus
- Aplinkos konfigūracijos pagrindai
- Resursų grupių ir prenumeratų valdymas

#### Praktiniai pratimai
1. **Diegimo patikrinimas**: Įdiekite AZD ir patikrinkite naudodami `azd version`
2. **Pirmasis diegimas**: Sėkmingai diegti todo-nodejs-mongo šabloną
3. **Aplinkos nustatymas**: Konfigūruokite pirmuosius aplinkos kintamuosius
4. **Resursų tyrinėjimas**: Naršykite diegtus resursus Azure portale

#### Vertinimo klausimai
- Kokie yra pagrindiniai AZD projekto komponentai?
- Kaip inicijuoti naują projektą iš šablono?
- Kuo skiriasi `azd up` ir `azd deploy`?
- Kaip valdyti kelias aplinkas naudojant AZD?

---

### 2 skyrius: AI pagrįstas kūrimas (2 savaitė)
**Trukmė**: 1-2 valandos | **Sudėtingumas**: ⭐⭐

#### Mokymosi tikslai
- Integruoti Azure AI Foundry paslaugas su AZD darbo eiga
- Diegti ir konfigūruoti AI pagrįstas aplikacijas
- Suprasti RAG (Retrieval-Augmented Generation) įgyvendinimo modelius
- Valdyti AI modelių diegimus ir mastelio keitimą

#### Pagrindinės sąvokos, kurias reikia įvaldyti
- Azure OpenAI paslaugų integracija ir API valdymas
- AI paieškos konfigūracija ir vektorinė indeksacija
- Modelių diegimo strategijos ir pajėgumų planavimas
- AI aplikacijų stebėjimas ir našumo optimizavimas

#### Praktiniai pratimai
1. **AI pokalbio diegimas**: Diegti azure-search-openai-demo šabloną
2. **RAG įgyvendinimas**: Konfigūruoti dokumentų indeksaciją ir paiešką
3. **Modelio konfigūracija**: Nustatyti kelis AI modelius skirtingiems tikslams
4. **AI stebėjimas**: Įgyvendinti Application Insights AI darbo krūviams

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
- Įgyvendinti saugius autentifikacijos modelius ir valdomą tapatybę
- Organizuoti resursus naudojant tinkamus pavadinimų konvencijas
- Konfigūruoti kelių aplinkų diegimus (dev, staging, prod)

#### Pagrindinės sąvokos, kurias reikia įvaldyti
- Aplinkos hierarchija ir konfigūracijos prioritetai
- Valdoma tapatybė ir paslaugų principų autentifikacija
- Key Vault integracija slaptažodžių valdymui
- Aplinkos specifinių parametrų valdymas

#### Praktiniai pratimai
1. **Kelių aplinkų nustatymas**: Konfigūruoti dev, staging ir prod aplinkas
2. **Saugumo konfigūracija**: Įgyvendinti valdomos tapatybės autentifikaciją
3. **Slaptažodžių valdymas**: Integruoti Azure Key Vault jautriems duomenims
4. **Parametrų valdymas**: Sukurti aplinkos specifines konfigūracijas

#### Vertinimo klausimai
- Kaip konfigūruoti skirtingas aplinkas naudojant AZD?
- Kokie yra valdomos tapatybės privalumai, palyginti su paslaugų principais?
- Kaip saugiai valdyti aplikacijos slaptažodžius?
- Kokia yra AZD konfigūracijos hierarchija?

---

### 4 skyrius: Infrastruktūra kaip kodas ir diegimas (4-5 savaitė)
**Trukmė**: 1-1.5 valandos | **Sudėtingumas**: ⭐⭐⭐

#### Mokymosi tikslai
- Kurti ir pritaikyti Bicep infrastruktūros šablonus
- Įgyvendinti pažangius diegimo modelius ir darbo eigas
- Suprasti resursų teikimo strategijas
- Kurti mastelio keičiamas kelių paslaugų architektūras

#### Pagrindinės sąvokos, kurias reikia įvaldyti
- Bicep šablonų struktūra ir geriausios praktikos
- Resursų priklausomybės ir diegimo tvarka
- Parametrų failai ir šablonų moduliškumas
- Individualūs kabliukai ir diegimo automatizavimas

#### Praktiniai pratimai
1. **Individualaus šablono kūrimas**: Sukurti kelių paslaugų aplikacijos šabloną
2. **Bicep įvaldymas**: Kurti moduliškus, pakartotinai naudojamus infrastruktūros komponentus
3. **Diegimo automatizavimas**: Įgyvendinti prieš/po diegimo kabliukus
4. **Architektūros dizainas**: Diegti sudėtingą mikroservisų architektūrą

#### Vertinimo klausimai
- Kaip sukurti individualius Bicep šablonus AZD?
- Kokios yra geriausios praktikos organizuojant infrastruktūros kodą?
- Kaip tvarkyti resursų priklausomybes šablonuose?
- Kokie diegimo modeliai palaiko nulio prastovos atnaujinimus?

---

### 5 skyrius: Daugiaagentės AI sprendimai (6-7 savaitė)
**Trukmė**: 2-3 valandos | **Sudėtingumas**: ⭐⭐⭐⭐

#### Mokymosi tikslai
- Kurti ir įgyvendinti daugiaagentės AI architektūras
- Koordinuoti agentų bendradarbiavimą ir komunikaciją
- Diegti gamybai paruoštus AI sprendimus su stebėjimu
- Suprasti agentų specializaciją ir darbo modelius

#### Pagrindinės sąvokos, kurias reikia įvaldyti
- Daugiaagentės architektūros modeliai ir dizaino principai
- Agentų komunikacijos protokolai ir duomenų srautas
- Apkrovos balansavimas ir mastelio keitimo strategijos AI agentams
- Gamybos stebėjimas daugiaagentėms sistemoms

#### Praktiniai pratimai
1. **Mažmeninės prekybos sprendimo diegimas**: Diegti pilną daugiaagentės mažmeninės prekybos scenarijų
2. **Agentų pritaikymas**: Modifikuoti Kliento ir Inventoriaus agentų elgesį
3. **Architektūros mastelio keitimas**: Įgyvendinti apkrovos balansavimą ir automatinį mastelio keitimą
4. **Gamybos stebėjimas**: Nustatyti išsamų stebėjimą ir įspėjimus

#### Vertinimo klausimai
- Kaip sukurti efektyvius daugiaagentės komunikacijos modelius?
- Kokie yra pagrindiniai aspektai mastelio keičiant AI agentų darbo krūvius?
- Kaip stebėti ir šalinti problemas daugiaagentėse AI sistemose?
- Kokie gamybos modeliai užtikrina AI agentų patikimumą?

---

### 6 skyrius: Prieš diegimą patikra ir planavimas (8 savaitė)
**Trukmė**: 1 valanda | **Sudėtingumas**: ⭐⭐

#### Mokymosi tikslai
- Atlikti išsamią pajėgumų planavimo ir resursų patikrą
- Pasirinkti optimalias Azure SKU kaštų efektyvumui
- Įgyvendinti automatizuotus prieš diegimą patikros ir validacijos procesus
- Planuoti diegimus su kaštų optimizavimo strategijomis

#### Pagrindinės sąvokos, kurias reikia įvaldyti
- Azure resursų kvotos ir pajėgumų apribojimai
- SKU pasirinkimo kriterijai ir kaštų optimizavimas
- Automatizuoti validacijos skriptai ir testavimas
- Diegimo planavimas ir rizikos vertinimas

#### Praktiniai pratimai
1. **Pajėgumų analizė**: Analizuoti aplikacijų resursų poreikius
2. **SKU optimizavimas**: Palyginti ir pasirinkti kaštų efektyvias paslaugų klases
3. **Validacijos automatizavimas**: Įgyvendinti prieš diegimą patikros skriptus
4. **Kaštų planavimas**: Sukurti diegimo kaštų įvertinimus ir biudžetus

#### Vertinimo klausimai
- Kaip patikrinti Azure pajėgumus prieš diegimą?
- Kokie veiksniai lemia SKU pasirinkimo sprendimus?
- Kaip automatizuoti prieš diegimą validaciją?
- Kokios strategijos padeda optimizuoti diegimo kaštus?
2. Kaip patikrinti Azure resursų prieinamumą prieš diegimą?  
3. Kokie yra pagrindiniai sistemos patikrinimo prieš diegimą komponentai?  
4. Kaip įvertinti ir kontroliuoti diegimo išlaidas?  
5. Kokie stebėjimo veiksmai yra būtini planuojant pajėgumus?

### 5 modulis: Trikčių šalinimas ir derinimas (6 savaitė)

#### Mokymosi tikslai  
- Įvaldyti sistemingus trikčių šalinimo metodus  
- Tobulinti sudėtingų diegimo problemų derinimo įgūdžius  
- Įgyvendinti išsamų stebėjimą ir įspėjimus  
- Sukurti incidentų valdymo ir atkūrimo procedūras  

#### Pagrindinės sąvokos, kurias reikia įvaldyti  
- Dažniausi diegimo gedimų modeliai  
- Žurnalų analizės ir koreliacijos technikos  
- Našumo stebėjimas ir optimizavimas  
- Saugumo incidentų aptikimas ir reagavimas  
- Atsarginių kopijų kūrimas ir verslo tęstinumas  

#### Praktinės užduotys  

**Užduotis 5.1: Trikčių šalinimo scenarijai**  
```bash
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```  

**Užduotis 5.2: Stebėjimo įgyvendinimas**  
```bash
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```  

**Užduotis 5.3: Incidentų valdymas**  
```bash
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```  

#### Savarankiško vertinimo klausimai  
1. Koks yra sistemingas požiūris į azd diegimų trikčių šalinimą?  
2. Kaip koreliuoti žurnalus tarp kelių paslaugų ir resursų?  
3. Kokie stebėjimo rodikliai yra svarbiausi ankstyvam problemų aptikimui?  
4. Kaip įgyvendinti veiksmingas atsarginių kopijų kūrimo procedūras?  
5. Kokie yra pagrindiniai incidentų valdymo plano komponentai?  

### 6 modulis: Pažangios temos ir geriausios praktikos (7-8 savaitės)

#### Mokymosi tikslai  
- Įgyvendinti įmonės lygio diegimo modelius  
- Tobulinti CI/CD integraciją ir automatizavimą  
- Kurti individualius šablonus ir prisidėti prie bendruomenės  
- Suprasti pažangius saugumo ir atitikties reikalavimus  

#### Pagrindinės sąvokos, kurias reikia įvaldyti  
- CI/CD vamzdynų integracijos modeliai  
- Individualių šablonų kūrimas ir platinimas  
- Įmonės valdymas ir atitiktis  
- Pažangūs tinklų ir saugumo konfigūracijos  
- Našumo optimizavimas ir išlaidų valdymas  

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

**Užduotis 6.2: Individualių šablonų kūrimas**  
```bash
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```  

**Užduotis 6.3: Įmonės įgyvendinimas**  
```bash
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```  

#### Savarankiško vertinimo klausimai  
1. Kaip integruoti azd į esamus CI/CD darbo procesus?  
2. Kokie yra pagrindiniai aspektai kuriant individualius šablonus?  
3. Kaip įgyvendinti valdymą ir atitiktį azd diegimuose?  
4. Kokios yra geriausios praktikos diegiant įmonės mastu?  
5. Kaip efektyviai prisidėti prie azd bendruomenės?  

## Praktiniai projektai  

### Projektas 1: Asmeninio portfelio svetainė  
**Sudėtingumas**: Pradedantysis  
**Trukmė**: 1-2 savaitės  

Sukurti ir įdiegti asmeninę portfelio svetainę naudojant:  
- Statinį svetainės talpinimą Azure Storage  
- Individualaus domeno konfigūraciją  
- CDN integraciją globaliam našumui  
- Automatizuotą diegimo vamzdyną  

**Rezultatai**:  
- Veikianti svetainė, įdiegta Azure  
- Individualus azd šablonas portfelio diegimams  
- Diegimo proceso dokumentacija  
- Išlaidų analizė ir optimizavimo rekomendacijos  

### Projektas 2: Užduočių valdymo programa  
**Sudėtingumas**: Vidutinis  
**Trukmė**: 2-3 savaitės  

Sukurti pilnos apimties užduočių valdymo programą su:  
- React frontend, įdiegtu App Service  
- Node.js API backend su autentifikacija  
- PostgreSQL duomenų baze ir migracijomis  
- Application Insights stebėjimu  

**Rezultatai**:  
- Pilna programa su vartotojų autentifikacija  
- Duomenų bazės schema ir migracijos skriptai  
- Stebėjimo skydeliai ir įspėjimų taisyklės  
- Daugiaplinkos diegimo konfigūracija  

### Projektas 3: Mikroservisų e-komercijos platforma  
**Sudėtingumas**: Pažangus  
**Trukmė**: 4-6 savaitės  

Sukurti ir įgyvendinti mikroservisų pagrindu veikiančią e-komercijos platformą:  
- Keli API servisai (katalogas, užsakymai, mokėjimai, vartotojai)  
- Žinučių eilės integracija su Service Bus  
- Redis talpykla našumo optimizavimui  
- Išsamus žurnalų kūrimas ir stebėjimas  

**Rezultatai**:  
- Pilna mikroservisų architektūra  
- Tarpservisinės komunikacijos modeliai  
- Našumo testavimas ir optimizavimas  
- Paruošta saugumo įgyvendinimas gamybai  

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

**3 modulio vertinimas**: Diegimas ir resursų paruošimas  
- Infrastruktūros dizaino iššūkiai  
- Kelių paslaugų diegimo scenarijai  
- Našumo optimizavimo užduotys  

**4 modulio vertinimas**: Patikrinimas prieš diegimą  
- Pajėgumų planavimo atvejų analizės  
- Išlaidų optimizavimo scenarijai  
- Patikrinimo vamzdyno įgyvendinimas  

**5 modulio vertinimas**: Trikčių šalinimas ir derinimas  
- Problemų diagnozavimo užduotys  
- Stebėjimo įgyvendinimo užduotys  
- Incidentų valdymo simuliacijos  

**6 modulio vertinimas**: Pažangios temos  
- CI/CD vamzdyno dizainas  
- Individualių šablonų kūrimas  
- Įmonės architektūros scenarijai  

### Galutinis projektas  

Sukurti ir įgyvendinti pilną sprendimą, kuris demonstruoja visų sąvokų įvaldymą:  

**Reikalavimai**:  
- Daugiasluoksnė programos architektūra  
- Keli diegimo aplinkos  
- Išsamus stebėjimas ir įspėjimai  
- Saugumo ir atitikties įgyvendinimas  
- Išlaidų optimizavimas ir našumo derinimas  
- Pilna dokumentacija ir veiklos vadovai  

**Vertinimo kriterijai**:  
- Techninio įgyvendinimo kokybė  
- Dokumentacijos išsamumas  
- Saugumo ir geriausių praktikų laikymasis  
- Našumo ir išlaidų optimizavimas  
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

## Mokymosi tvarkaraščio rekomendacijos  

### Pilno laiko mokymasis (8 savaitės)  
- **1-2 savaitės**: 1-2 moduliai (Pradžia, Konfigūracija)  
- **3-4 savaitės**: 3-4 moduliai (Diegimas, Patikrinimas prieš diegimą)  
- **5-6 savaitės**: 5-6 moduliai (Trikčių šalinimas, Pažangios temos)  
- **7-8 savaitės**: Praktiniai projektai ir galutinis vertinimas  

### Dalinio laiko mokymasis (16 savaičių)  
- **1-4 savaitės**: 1 modulis (Pradžia)  
- **5-7 savaitės**: 2 modulis (Konfigūracija ir aplinkos)  
- **8-10 savaitės**: 3 modulis (Diegimas ir resursų paruošimas)  
- **11-12 savaitės**: 4 modulis (Patikrinimas prieš diegimą)  
- **13-14 savaitės**: 5 modulis (Trikčių šalinimas ir derinimas)  
- **15-16 savaitės**: 6 modulis (Pažangios temos ir vertinimas)  

---

## Progreso stebėjimas ir vertinimo sistema  

### Skyriaus užbaigimo kontrolinis sąrašas  

Sekite savo progresą kiekviename skyriuje pagal šiuos matomus rezultatus:  

#### 📚 1 skyrius: Pagrindai ir greitas startas  
- [ ] **Diegimas baigtas**: AZD įdiegtas ir patikrintas jūsų platformoje  
- [ ] **Pirmas diegimas**: Sėkmingai įdiegtas todo-nodejs-mongo šablonas  
- [ ] **Aplinkos nustatymas**: Sukonfigūruoti pirmieji aplinkos kintamieji  
- [ ] **Resursų naršymas**: Išnagrinėti įdiegti resursai Azure portale  
- [ ] **Komandų įvaldymas**: Pasitikėjimas pagrindinėmis AZD komandomis  

#### 🤖 2 skyrius: AI-pirmasis vystymas  
- [ ] **AI šablono diegimas**: Sėkmingai įdiegtas azure-search-openai-demo  
- [ ] **RAG įgyvendinimas**: Sukonfigūruotas dokumentų indeksavimas ir paieška  
- [ ] **Modelio konfigūracija**: Nustatyti keli AI modeliai skirtingiems tikslams  
- [ ] **AI stebėjimas**: Įgyvendintas Application Insights AI darbo krūviams  
- [ ] **Našumo optimizavimas**: Patobulintas AI programos našumas  

#### ⚙️ 3 skyrius: Konfigūracija ir autentifikacija  
- [ ] **Daugiaplinkos nustatymas**: Sukonfigūruotos dev, staging ir prod aplinkos  
- [ ] **Saugumo įgyvendinimas**: Nustatyta valdomos tapatybės autentifikacija  
- [ ] **Slaptų duomenų valdymas**: Integruotas Azure Key Vault jautriems duomenims  
- [ ] **Parametrų valdymas**: Sukurta aplinkai specifinė konfigūracija  
- [ ] **Autentifikacijos įvaldymas**: Įgyvendinti saugūs prieigos modeliai  

#### 🏗️ 4 skyrius: Infrastruktūra kaip kodas ir diegimas  
- [ ] **Individualių šablonų kūrimas**: Sukurtas daugiapaslaugų programos šablonas  
- [ ] **Bicep įvaldymas**: Sukurti moduliniai, pakartotinai naudojami infrastruktūros komponentai  
- [ ] **Diegimo automatizavimas**: Įgyvendinti prieš/po diegimo veiksmai  
- [ ] **Architektūros dizainas**: Įdiegtas sudėtingas mikroservisų architektūros modelis  
- [ ] **Šablonų optimizavimas**: Optimizuoti šablonai našumui ir išlaidoms  

#### 🎯 5 skyrius: Daugiaagentės AI sprendimai  
- [ ] **Mažmeninės prekybos sprendimo diegimas**: Įdiegtas pilnas daugiaagentės mažmeninės prekybos scenarijus  
- [ ] **Agentų pritaikymas**: Modifikuoti klientų ir inventoriaus agentų elgesiai  
- [ ] **Architektūros mastelio keitimas**: Įgyvendintas apkrovos balansavimas ir automatinis mastelio keitimas  
- [ ] **Gamybos stebėjimas**: Sukurta išsami stebėjimo ir įspėjimų sistema  
- [ ] **Našumo derinimas**: Optimizuota daugiaagentės sistemos veikla  

#### 🔍 6 skyrius: Patikrinimas prieš diegimą ir planavimas  
- [ ] **Pajėgumų analizė**: Išanalizuoti programų resursų reikalavimai  
- [ ] **SKU optimizavimas**: Pasirinkti ekonomiški paslaugų lygiai  
- [ ] **Patikrinimo automatizavimas**: Įgyvendinti patikrinimo prieš diegimą scenarijai  
- [ ] **Išlaidų planavimas**: Sukurti diegimo išlaidų įvertinimai ir biudžetai  
- [ ] **Rizikos vertinimas**: Identifikuoti ir sumažinti diegimo rizikas  

#### 🚨 7 skyrius: Trikčių šalinimas ir derinimas  
- [ ] **Diagnostikos įgūdžiai**: Sėkmingai išspręstos tyčia sugadintos diegimo problemos  
- [ ] **Žurnalų analizė**: Efektyviai naudoti Azure Monitor ir Application Insights  
- [ ] **Našumo derinimas**: Optimizuotos lėtai veikiančios programos  
- [ ] **Atkūrimo procedūros**: Įgyvendintos atsarginės kopijos ir atkūrimo sprendimai  
- [ ] **Stebėjimo nustatymas**: Sukurta proaktyvi stebėjimo ir įspėjimų sistema  

#### 🏢 8 skyrius: Gamyba ir įmonės modeliai  
- [ ] **Įmonės saugumas**: Įgyvendinti išsamūs saugumo modeliai  
- [ ] **Valdymo sistema**: Sukurta Azure Policy ir resursų valdymo sistema  
- [ ] **Pažangus stebėjimas**: Sukurti skydeliai ir automatizuoti įspėjimai  
- [ ] **CI/CD integracija**: Sukurti automatizuoti diegimo vamzdynai  
- [ ] **Atitikties įgyvendinimas**: Įvykdyti įmonės atitikties reikalavimai  

### Mokymosi laiko juosta ir etapai  

#### 1-2 savaitės: Pagrindų kūrimas  
- **Etapas**: Pirmojo AI programos diegimas naudojant AZD  
- **Patikrinimas**: Veikianti programa, pasiekiama per viešą URL  
- **Įgūdžiai**: Pagrindiniai AZD darbo procesai ir AI paslaugų integracija  

#### 3-4 savaitės: Konfigūracijos įvaldymas  
- **Etapas**: Daugiaplinkos diegimas su saugia autentifikacija  
- **Patikrinimas**: Ta
- **Dokumentacija**: Prisidėkite prie bendruomenės dokumentacijos ir pavyzdžių
- **Grįžtamojo ryšio ciklas**: Teikite atsiliepimus apie kurso turinį ir Azure paslaugas

#### Karjeros plėtra
- **Profesionalus tinklas**: Užmegzkite ryšius su Azure ir AI ekspertais
- **Kalbėjimo galimybės**: Dalinkitės savo žiniomis konferencijose ar susitikimuose
- **Atvirojo kodo indėlis**: Prisidėkite prie AZD šablonų ir įrankių
- **Mentorystė**: Padėkite kitiems programuotojams jų AZD mokymosi kelionėje

---

**Skyriaus navigacija:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../README.md)
- **📖 Pradėkite mokytis**: [1 skyrius: Pagrindai ir greitas startas](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Progresas**: Sekite savo pažangą per išsamų 8 skyrių mokymosi sistemą
- **🤝 Bendruomenė**: [Azure Discord](https://discord.gg/microsoft-azure) pagalbai ir diskusijoms

**Mokymosi progreso sekimas**: Naudokitės šiuo struktūrizuotu vadovu, kad įvaldytumėte Azure Developer CLI per nuoseklų, praktinį mokymąsi su apčiuopiamais rezultatais ir profesinio tobulėjimo privalumais.

---

**Atsakomybės apribojimas**:  
Šis dokumentas buvo išverstas naudojant AI vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors stengiamės užtikrinti tikslumą, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Kritinei informacijai rekomenduojama naudoti profesionalų žmogaus vertimą. Mes neprisiimame atsakomybės už nesusipratimus ar klaidingus interpretavimus, atsiradusius dėl šio vertimo naudojimo.