# Õppematerjal - Kõikehõlmavad õpieesmärgid

**Õppeteekonna navigeerimine**
- **📚 Kursuse avaleht**: [AZD algajatele](../README.md)
- **📖 Alusta õppimist**: [1. peatükk: Alused ja kiire algus](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Edenemise jälgimine**: [Kursuse lõpuleviimine](../README.md#-course-completion--certification)

## Sissejuhatus

See põhjalik õppematerjal pakub struktureeritud õpieesmärke, võtmekontseptsioone, praktilisi harjutusi ja hindematerjale, et aidata sul Azure Developer CLI (azd) valdamisel. Kasuta seda juhendit oma edenemise jälgimiseks ja veendumaks, et oled katnud kõik olulised teemad.

## Õpieesmärgid

Selle õppematerjali lõpetamisel saad:
- Valdada kõiki Azure Developer CLI põhiosa ja arenenud kontseptsioone
- Arendada praktilisi oskusi Azure rakenduste juurutamisel ja haldamisel
- Tõsta enesekindlust tõrkeotsingus ja juurutuste optimeerimises
- Mõista tootmiseks valmis juurutamise tavasid ja turvaküsimusi

## Õpitulemused

Pärast kõigi selle õppematerjali osade läbimist suudad:
- Kujundada, juurutada ja hallata täisväärtuslikke rakenduse arhitektuure, kasutades azd
- Rakendada terviklikke jälgimise, turvalisuse ja kulude optimeerimise strateegiaid
- Ise sõltumatult lahendada keerukaid juurutusprobleeme
- Luua kohandatud malle ja panustada azd kogukonda

## 8-peatükiline õpistruktuur

### 1. peatükk: Alused ja kiire algus (1. nädal)
**Kestus**: 30-45 minutit | **Raskusaste**: ⭐

#### Õpieesmärgid
- Mõista Azure Developer CLI põhikontseptsioone ja terminoloogiat
- Edukalt paigaldada ja konfigureerida AZD oma arendusplatvormil
- Juurutada oma esimene rakendus olemasolevat malli kasutades
- Tõhusalt navigeerida AZD käsureal

#### Olulised kontseptsioonid, mida valdada
- AZD projekti struktuur ja komponendid (azure.yaml, infra/, src/)
- Mallipõhised juurutusprotsessid
- Keskkonna konfiguratsiooni alused
- Ressursirühma ja tellimuse haldamine

#### Praktilised harjutused
1. **Paigalduse kontroll**: Paigalda AZD ja kontrolli `azd version` abil
2. **Esimene juurutus**: Juuruta edukalt todo-nodejs-mongo mall
3. **Keskkonna seadistus**: Määra oma esimene keskkonnamuutuja
4. **Ressursside uurimine**: Liigu Azure portaali juurutatud ressursside vahel

#### Hindamisküsimused
- Millised on AZD projekti põhikomponendid?
- Kuidas algatada uus projekt mallist?
- Mis vahe on `azd up` ja `azd deploy` vahel?
- Kuidas hallata mitut keskkonda AZD abil?

---

### 2. peatükk: AI-eelnev areng (2. nädal)
**Kestus**: 4-5 tundi koos töötubadega | **Raskusaste**: ⭐⭐

#### Õpieesmärgid
- Integreerida Microsoft Foundry teenused AZD töövoogudesse
- Kasutada GA `microsoft.foundry` paketti AZD 1.37.0+ versioonis majutatud-agendi arenduseks
- Juurutada ja konfigureerida tehisintellektil põhinevaid rakendusi
- Mõista RAG (Retrieval-Augmented Generation) rakenduspõhimõtteid
- Hallata AI mudelite juurutusi ja skaleerimist

#### Olulised kontseptsioonid, mida valdada
- Microsoft Foundry Models teenuse integreerimine ja API haldus
- AI otsingu konfiguratsioon ja vektorindekseerimine
- Mudeli juurutusstrateegiad ja mahu planeerimine
- AI rakenduste jälgimine ja jõudluse optimeerimine
- Kohalik agentuurija versus pilvejäljed, koodis juurutamine ja hindamisvarad versioonihalduses

#### Praktilised harjutused
1. **AI vestluse juurutus**: Juuruta azure-search-openai-demo mall
2. **RAG rakendus**: Seadista dokumentide indekseerimine ja otsing
3. **Mudeli konfiguratsioon**: Sea üles mitu AI mudelit erinevate eesmärkidega
4. **AI jälgimine**: Rakenda Application Insights AI töökoormustele
5. **GA majutatud agent**: Järgi [hosted-agent juhendit](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga); võrdle kohalikke ja pilveresponsse, vaata hindamistulemust ja kontrolli koristamise omandiõigust

#### Hindamisküsimused
- Kuidas konfigureerida Microsoft Foundry Models teenuseid AZD mallis?
- Millised on RAG arhitektuuri põhikomponendid?
- Kuidas hallata AI mudelite mahtu ja skaleerimist?
- Millised jälgimismõõdikud on AI rakenduste puhul olulised?
- Millised laiendused on kaasatud `microsoft.foundry` ja miks paigaldatakse hindamised eraldi?
- Miks kohalikud agenditestid põhjustavad ikkagi Azure mudelite tasusid?
- Mida `azd down` jätab maha, kui taaskasutad olemasolevat Foundry projekti?

---

### 3. peatükk: Konfiguratsioon ja autentimine (3. nädal)
**Kestus**: 45-60 minutit | **Raskusaste**: ⭐⭐

#### Õpieesmärgid
- Valdada keskkonna konfiguratsiooni ja halduse strateegiaid
- Rakendada turvalisi autentimismustreid ja hallatud identiteeti
- Korraldada ressursse õige nimetamiskonventsiooniga
- Konfigureerida mitmekeskkonna juurutusi (arendus, testimine, tootmine)

#### Olulised kontseptsioonid, mida valdada
- Keskkonna hierarhia ja konfiguratsiooni prioriteet
- Hallatud identiteet ja teenusepealkirja autentimine
- Key Vault integreerimine saladuste haldamiseks
- Keskkonnapõhine parameetrite haldus

#### Praktilised harjutused
1. **Mitmekeskkonna seadistus**: Konfigureeri arendus-, testimis- ja tootmiskeskkonnad
2. **Turvakonfiguratsioon**: Rakenda hallatud identiteedi autentimine
3. **Saladuste haldamine**: Integreeri Azure Key Vault tundlike andmete jaoks
4. **Parameetrite haldus**: Loo keskkonnapõhised konfiguratsioonid

#### Hindamisküsimused
- Kuidas konfigureerida erinevaid keskkondi AZD-s?
- Millised on hallatud identiteedi kasutamise eelised teenusepealkirjade ees?
- Kuidas turvaliselt hallata rakenduse saladusi?
- Milline on AZD konfiguratsiooni hierarhia?

---

### 4. peatükk: Infrastruktuur kui kood & juurutus (4.-5. nädal)
**Kestus**: 1-1,5 tundi | **Raskusaste**: ⭐⭐⭐

#### Õpieesmärgid
- Loo ja kohanda Bicep infrastruktuuri malle
- Rakenda keerukaid juurutusmustreid ja töövooge
- Mõista ressursside provisjonimise strateegiaid
- Kujunda skaleeritavaid mitme teenusega arhitektuure

- Juuruta konteineripõhiseid rakendusi Azure Container Apps ja AZD abil


#### Olulised kontseptsioonid, mida valdada
- Bicep malli struktuur ja parimad praktikad
- Ressursside sõltuvused ja juurutuse järjekord
- Parameetrite failid ja malli moodulisus
- Kohandatud hookid ja juurutamise automatiseerimine
- Konteinerirakenduse juurutusmustrid (kiire algus, tootmine, mikroteenused)

#### Praktilised harjutused
1. **Kohandatud malli loomine**: Koosta mitme teenusega rakenduse mall
2. **Bicep valdamine**: Loo modulaarseid, korduvkasutatavaid infrastruktuuri komponente
3. **Juurutamise automatiseerimine**: Rakenda eelsed ja järelsed juurutusega seotud hookid
4. **Arhitektuuri kujundus**: Juuruta keerukas mikroteenuste arhitektuur
5. **Konteinerirakenduse juurutus**: Juuruta [Lihtne Flask API](../../../examples/container-app/simple-flask-api) ja [Mikroteenuste arhitektuuri](../../../examples/container-app/microservices) näited AZD abil

#### Hindamisküsimused
- Kuidas luua kohandatud Bicep malle AZD jaoks?
- Millised on parimad praktikad infrastruktuuri koodi korraldamisel?
- Kuidas käsitleda ressursisõltuvusi mallides?
- Millised juurutusmustid toetavad katkestusteta uuendusi?

---

### 5. peatükk: Mitmeagendiline AI lahendused (6.-7. nädal)
**Kestus**: 2-3 tundi | **Raskusaste**: ⭐⭐⭐⭐

#### Õpieesmärgid
- Kujundada ja ellu viia mitmeagendilisi AI arhitektuure
- Otsustada agentide koordineerimine ja suhtlus
- Juurutada tootmisküpsed AI lahendused koos jälgimisega
- Mõista agentide spetsialiseerumist ja töövoo mustreid
- Integreerida konteineripõhiseid mikroteenuseid mitmeagentiliste lahendustena

#### Olulised kontseptsioonid, mida valdada
- Mitmeagendilise arhitektuuri mustrid ja disainiprintsiibid
- Agentide suhtlusprotokollid ja andmevoog
- Koormuse tasakaalustamine ja skaleerimisstrateegiad AI agentidele
- Tootmismehe jälgimine mitmeagendiliste süsteemide jaoks
- Teenustevaheline suhtlus konteinerikeskkondades

#### Praktilised harjutused
1. **Jaekaubanduse arhitektuuri ülevaade**: Analüüsi jaekaubanduse plaani ning märgi rakenduse komponendid, mida tuleb juurutuse eelselt ellu viia
2. **Agendi kohandamine**: Muuda Customer ja Inventory agendi käitumist
3. **Arhitektuuri skaleerimine**: Rakenda koormuse tasakaalustamine ja automaatne skaleerimine
4. **Tootmismehe jälgimine**: Sea üles põhjalik jälgimine ja alertimine
5. **Mikroteenuste integratsioon**: Laienda [Mikroteenuste arhitektuuri](../../../examples/container-app/microservices) näidet, et toetada agendipõhiseid töövooge

#### Hindamisküsimused
- Kuidas kujundada efektiivseid mitmeagendilisi suhtlusmustreid?
- Millised on võtmeküsimused AI agentatiivsete töökoormuste skaleerimisel?
- Kuidas jälgida ja siluda mitmeagendilisi AI süsteeme?
- Millised tootmispraktikad tagavad AI agentide töökindluse?

---

### 6. peatükk: Enne juurutust valideerimine ja planeerimine (8. nädal)
**Kestus**: 1 tund | **Raskusaste**: ⭐⭐

#### Õpieesmärgid
- Teosta põhjalik mahtude planeerimine ja ressursside valideerimine
- Vali optimaalsed Azure SKU-d kuluefektiivsuse tagamiseks
- Rakenda automatiseeritud eelkontrolle ja valideerimist
- Planeeri juurutusi koos kulude optimeerimise strateegiatega

#### Olulised kontseptsioonid, mida valdada
- Azure ressursside kvantiteedi- ja mahu piirangud
- SKU valikukriteeriumid ja kulude optimeerimine
- Automatiseeritud valideerimisskriptid ja testimine
- Juurutuse planeerimine ja riskihindamine

#### Praktilised harjutused
1. **Mahuanalüüs**: Hinda oma rakenduste ressursinõudeid
2. **SKU optimeerimine**: Võrdle ning vali kulutõhusad teenustasemed
3. **Valideerimise automatiseerimine**: Rakenda eeljooksvad valideerimisskriptid
4. **Kulude planeerimine**: Koosta juurutamise kulude hinnangud ja eelarved

#### Hindamisküsimused
- Kuidas teha Azure mahu valideerimist enne juurutust?
- Millised tegurid mõjutavad SKU valiku otsuseid?
- Kuidas automatiseerida juurutuseelsed valideerimised?
- Millised strateegiad aitavad optimeerida juurutuskulusid?

---

### 7. peatükk: Tõrkeotsing ja silumine (9. nädal)
**Kestus**: 1-1,5 tundi | **Raskusaste**: ⭐⭐

#### Õpieesmärgid
- Arenda süsteemseid silumismeetodeid AZD juurutuste jaoks
- Lahenda korduvaid juurutus- ja konfiguratsiooniprobleeme
- Silu AI-spetsiifilisi probleeme ja jõudlusküsimusi
- Rakenda jälgimist ja teavitusi probleemide varajaseks avastamiseks

#### Olulised kontseptsioonid, mida valdada
- Diagnostika tehnikad ja logimise strateegiad
- Levinud rikete mustrid ja nende lahendused
- Jõudluse jälgimine ja optimeerimine
- Intsidendi reageerimis- ja taastamistoimingud

#### Praktilised harjutused
1. **Diagnostikavõimed**: Harjuta tahtlikult rikete põhjustatud juurutustega
2. **Logide analüüs**: Kasuta tõhusalt Azure Monitorit ja Application Insightsi
3. **Jõudluse häälestus**: Optimeeri aeglaselt toimivaid rakendusi
4. **Taastamisprotseduurid**: Rakenda varundamist ja katastroofi taastamist

#### Hindamisküsimused
- Millised on kõige tavalisemad AZD juurutusvead?
- Kuidas siluda autentimis- ja õiguste küsimusi?
- Millised jälgimisstrateegiad aitavad tootmisprobleeme ennetada?
- Kuidas optimeerida rakenduste jõudlust Azure's?

---

### 8. peatükk: Tootmise ja ettevõtte mustrid (10.-11. nädal)
**Kestus**: 2-3 tundi | **Raskusaste**: ⭐⭐⭐⭐

#### Õpieesmärgid
- Rakenda ettevõtte taseme juurutusstrateegiaid
- Kujunda turva- ja vastavusraamistikke
- Loo jälgimise, juhtimise ja kulude halduse protsessid
- Loo skaleeritavaid CI/CD torustikke AZD integratsiooniga
- Rakenda parimaid tavasid tootmiskonteinerirakenduste juurutamiseks (turvalisus, jälgimine, kulud, CI/CD)

#### Olulised kontseptsioonid, mida valdada
- Ettevõtte turva- ja vastavusnõuded
- Juhtimisraamistikud ja poliitikate rakendamine
- Arendatud jälgimine ja kulude haldamine
- CI/CD integratsioon ja automatiseeritud juurutusprotsessid
- Sinine-roheline ja kanarinnatuse juurutusstrateegiad konteinerikoormustele

#### Praktilised harjutused
1. **Ettevõtte turvalisus**: Rakenda põhjalikke turvamustreid
2. **Juhtimisraamistik**: Sea üles Azure Policy ja ressursihaldus
3. **Arendatud jälgimine**: Loo juhtpaneelid ja automatiseeritud teavitused
4. **CI/CD integratsioon**: Koosta automatiseeritud juurutustorustikud
5. **Tootmiskonteinerirakendused**: Rakenda turbe-, jälgimis- ja kulude optimeerimist [Mikroteenuste arhitektuuri](../../../examples/container-app/microservices) näitele

#### Hindamisküsimused
- Kuidas rakendada ettevõtte turvalisust AZD juurutustes?
- Millised juhtimismustrid tagavad vastavuse ja kulude kontrolli?
- Kuidas kujundada skaleeritavat jälgimist tootmissüsteemide jaoks?
- Millised CI/CD mustrid sobivad kõige paremini AZD töövoogudega?

#### Õpieesmärgid
- Mõista Azure Developer CLI alust ja põhikontseptsioone
- Edukalt paigaldada ja konfigureerida azd oma arenduskeskkonnas
- Lõpetada oma esimene juurutus olemasolevat malli kasutades
- Navigeerida azd projekti struktuuris ja mõista võtmekomponente

#### Olulised kontseptsioonid, mida valdada
- Mallid, keskkonnad ja teenused
- azure.yaml konfiguratsiooni struktuur
- Põhilised azd käsud (init, up, down, deploy)
- Infrastruktuur kui kood printsiibid
- Azure autentimine ja autoriseerimine

#### Praktilised harjutused

**Harjutus 1.1: Paigaldamine ja seadistus**
```text
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI only for exercises or template hooks that explicitly use `az`; authenticate AZD independently
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Harjutus 1.2: Esimene juurutus**
```text
# Deploy a simple web application:
1. Initialize project in an empty directory: azd init --template todo-nodejs-mongo .
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**Harjutus 1.3: Projekti struktuuri analüüs**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### Enesehindamise küsimused
1. Millised on azd arhitektuuri kolm põhikontseptsiooni?
2. Mis on azure.yaml faili eesmärk?
3. Kuidas aitavad keskkonnad hallata erinevaid juurutuse sihtkohti?
4. Milliseid autentimismeetodeid saab azd-ga kasutada?
5. Mis juhtub, kui käivitad esimest korda `azd up`?

---

## Edenemise jälgimine ja hindamisraamistik
```text
# Create and configure multiple environments:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Harjutus 2.2: Täiustatud konfiguratsioon**
```text
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Harjutus 2.3: Turvakonfiguratsioon**
```text
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Enesehindamise küsimused
1. Kuidas korraldab azd keskkonnamuutujate prioriteete?
2. Mis on juurutus hookid ja millal neid kasutada?
3. Kuidas konfigureerida erinevaid SKU-sid erinevates keskkondades?
4. Millist turvariske kaasneb erinevate autentimismeetoditega?
5. Kuidas hallata saladusi ja tundlikku konfiguratsiooniteavet?

### Moodul 3: Juurutus ja provisjonimine (4. nädal)

#### Õpieesmärgid
- Valdada juurutustöövood ja parimaid praktikaid
- Mõista infrastruktuuri kui koodi Bicep mallidega
- Rakendada keerukaid mitme teenuse arhitektuure
- Optimeerida juurutuse jõudlust ja töökindlust

#### Olulised kontseptsioonid, mida valdada
- Bicep malli struktuur ja moodulid
- Ressursside sõltuvused ja juurutuse järjekord
- Juurutusstrateegiad (sinine-roheline, järkjärguline uuendus)
- Mitme regiooni juurutused
- Andmebaaside migratsioonid ja andmehooldus

#### Praktilised harjutused

**Harjutus 3.1: Kohandatud infrastruktuur**
```text
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Harjutus 3.2: Mitme teenusega rakendus**
```text
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Harjutus 3.3: Andmebaasi integratsioon**
```text
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Enesehindamise küsimused
1. Millised on Bicepi kasutamise eelised võrreldes ARM-mallidega?
2. Kuidas käsitled andmebaasi migratsioone azd juurutustes?
3. Millised strateegiad on olemas nullseisaku juurutusteks?
4. Kuidas haldad teenustevahelisi sõltuvusi?
5. Millised on mitmeregiooniliste juurutuste kaalutlused?

### Moodul 4: Eel-juurutuse valideerimine (5. nädal)

#### Õpieesmärgid
- Rakendada kõikehõlmavaid eel-juurutuse kontrollid
- Valdada mahukavandamist ja ressursside valideerimist
- Mõista SKU valikut ja kulu optimeerimist
- Luua automatiseeritud valideerimisread

#### Peamised mõisted, mida valdada
- Azure'i ressursside kvoodid ja piirangud
- SKU valikukriteeriumid ja kuluga seotud tagajärjed
- Automatiseeritud valideerimisskriptid ja tööriistad
- Mahukavandamise metoodikad
- Jõudluse testimine ja optimeerimine

#### Praktilised harjutused

**Harjutus 4.1: Mahukavandamine**
```text
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Harjutus 4.2: Eelkontroll**
```text
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Harjutus 4.3: SKU optimeerimine**
```text
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Enesehindamise küsimused
1. Millised tegurid peaksid mõjutama SKU valiku otsuseid?
2. Kuidas valideerid Azure'i ressursi saadavust enne juurutust?
3. Millised on eelkontrolli süsteemi võtmekomponendid?
4. Kuidas hindad ja kontrollid juurutuskulusid?
5. Millist jälgimist on mahukavandamiseks hädavajalik teha?

### Moodul 5: Tõrkeotsing ja silumine (6. nädal)

#### Õpieesmärgid
- Valdada süsteemsete tõrkeotsingu metoodikate kasutamist
- Arendada oskust siluda keerukaid juurutusprobleeme
- Rakendada kõikehõlmavat jälgimist ja hoiatussüsteeme
- Luua intsidentide reageerimise ja taastamise protseduurid

#### Peamised mõisted, mida valdada
- Levinud juurutusvigade mustrid
- Logianalüüsi ja seoste loomise tehnikad
- Jõudluse jälgimine ja optimeerimine
- Turvaintsidentide tuvastamine ja reageerimine
- Katastroofide taastamine ja ärikatkestuse juhtimine

#### Praktilised harjutused

**Harjutus 5.1: Tõrkeotsingu stsenaariumid**
```text
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Harjutus 5.2: Jälgimisrakenduse loomine**
```text
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Harjutus 5.3: Intsidentide reageerimine**
```text
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Enesehindamise küsimused
1. Milline on süsteemne lähenemine azd juurutuste tõrkeotsingule?
2. Kuidas korreleerid logisid mitme teenuse ja ressursi vahel?
3. Millised jälgimisnäitajad on kõige kriitilisemad varajase probleemide avastamise jaoks?
4. Kuidas rakendad tõhusaid katastroofitaastamise protseduure?
5. Millised on intsidentide reageerimiskava võtmekomponendid?

### Moodul 6: Täiustatud teemad ja parimad praktikad (7.-8. nädal)

#### Õpieesmärgid
- Rakendada ettevõttetaseme juurutusmustreid
- Valdada CI/CD integratsiooni ja automatiseerimist
- Arendada kohandatud malle ja panustada kogukonda
- Mõista täiustatud turva- ja vastavusnõudeid

#### Peamised mõisted, mida valdada
- CI/CD torujuhtme integratsioonimustrid
- Kohandatud mallide arendus ja levitamine
- Ettevõtte haldus ja vastavus
- Täiustatud võrgustike ja turvakonfiguratsioonid
- Jõudluse optimeerimine ja kulude juhtimine

#### Praktilised harjutused

**Harjutus 6.1: CI/CD integratsioon**
```text
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**Harjutus 6.2: Kohandatud malli arendus**
```text
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Harjutus 6.3: Ettevõtte juurutus**
```text
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Enesehindamise küsimused
1. Kuidas integreerida azd olemasolevatesse CI/CD töövoogudesse?
2. Millised on võtmekaalutlused kohandatud mallide arendamisel?
3. Kuidas rakendada haldus- ja vastavusnõudeid azd juurutustes?
4. Millised on parimad praktikad ettevõtte suurusega juurutusteks?
5. Kuidas panustada tõhusalt azd kogukonda?

## Praktilised projektid

### Projekt 1: Isiklik portfoolio veebisait
**Kompleksus**: Algaja  
**Kestus**: 1-2 nädalat

Ehita ja juuruta isiklik portfoolio veebisait kasutades:
- Staatiline veebimajutus Azure Storage'is
- Kohandatud domeeni konfiguratsioon
- CDN integratsioon globaalsete jõudluse tagamiseks
- Automatiseeritud juurutustorud

**Tulemid**:
- Töötav veebisait juurutatud Azure'is
- Kohandatud azd mall portfoolio juurutusteks
- Juurutuse protsessi dokumentatsioon
- Kulude analüüs ja optimeerimise soovitused

### Projekt 2: Ülesannete halduse rakendus
**Kompleksus**: Kesktase  
**Kestus**: 2-3 nädalat

Loo täisfunktsionaalne ülesannete halduse rakendus koos:
- React front-end App Service'is
- Node.js API taustalahendus autentimisega
- PostgreSQL andmebaas migratsioonidega
- Application Insights jälgimine

**Tulemid**:
- Täisfunktsionaalne rakendus kasutaja autentimisega
- Andmebaasi skeem ja migratsiooniskriptid
- Jälgimis-dashboardid ja hoiatusreeglid
- Mitmekesiste keskkondade juurutuse konfiguratsioon

### Projekt 3: Mikroteenuste e-kaubanduse platvorm
**Kompleksus**: Täiustatud  
**Kestus**: 4-6 nädalat

Kujunda ja rakenda mikroteenustel põhinev e-kaubanduse platvorm:
- Mitmed API-teenused (kataloog, tellimused, maksed, kasutajad)
- Sõnumijärjekorra integratsioon Service Bus'iga
- Redis vahemälu jõudluse optimeerimiseks
- Kõikehõlmav logimine ja jälgimine

**Võrdlusnäide**: Vaata [Microservices Architecture](../../../examples/container-app/microservices) kahe teenuse õpimudelit ja juurutusjuhendit. Järjekorrad, püsimine, autentimine, maksete töötlemine ja tootmisvalmiduse tugevdamine on eraldi projektitööd.

**Tulemid**:
- Täis mikroteenuste arhitektuur
- Teenustevahelised suhtlemismustrid
- Jõudluse testimine ja optimeerimine
- Tootmisvalmis turvalahendus

## Hindamine ja sertifitseerimine

### Teadmiste kontrollid

Täida need hinnangud pärast iga moodulit:

**Mooduli 1 hindamine**: Põhimõisted ja paigaldus
- Mitmevalikvastustega küsimused põhikontseptsioonidest
- Praktilised paigaldus- ja konfiguratsioonitööd
- Lihtne juurutusharjutus

**Mooduli 2 hindamine**: Konfiguratsioon ja keskkonnad
- Keskkonna halduse stsenaariumid
- Konfiguratsiooni tõrkeotsingu harjutused
- Turvakonfiguratsiooni rakendamine

**Mooduli 3 hindamine**: Juurutus ja provisioning
- Infrastruktuuri disaini väljakutsed
- Mitme teenuse juurutuse stsenaariumid
- Jõudluse optimeerimise harjutused

**Mooduli 4 hindamine**: Eel-juurutuse valideerimine
- Mahukavandamise juhtumiuuringud
- Kulude optimeerimise stsenaariumid
- Valideerimistoru rakendamine

**Mooduli 5 hindamine**: Tõrkeotsing ja silumine
- Probleemide diagnoosimise harjutused
- Jälgimise rakendamise ülesanded
- Intsidentidele reageerimise simulatsioonid

**Mooduli 6 hindamine**: Täiustatud teemad
- CI/CD torujuhtme disain
- Kohandatud mallide arendus
- Ettevõtte arhitektuuri stsenaariumid

### Lõplik lõputööprojekt

Kujunda ja rakenda täielik lahendus, mis demonstreerib kõigi kontseptsioonide valdamist:

**Nõuded**:
- Mitmekihiline rakendusarhitektuur
- Mitmed juurutuskeskkonnad
- Kõikehõlmav jälgimine ja teadete süsteem
- Turve ja vastavuse rakendamine
- Kulude optimeerimine ja jõudluse häälestus
- Täielik dokumentatsioon ja tööprotseduurid

**Hindamiskriteeriumid**:
- Tehnilise rakenduse kvaliteet
- Dokumentatsiooni täielikkus
- Turvalisuse ja parimate tavade järgimine
- Jõudluse ja kulu optimeerimine
- Tõrkeotsingu ja jälgimise tõhusus

## Õppematerjalid ja viited

### Ametlik dokumentatsioon
- [Azure Developer CLI dokumentatsioon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep dokumentatsioon](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architectuuri keskus](https://learn.microsoft.com/en-us/azure/architecture/)

### Kogukonna ressursid
- [AZD malligalerii](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub organisatsioon](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHub hoidla](https://github.com/Azure/azure-dev)

### Harjutuskeskkonnad
- [Azure tasuta konto](https://azure.microsoft.com/free/)
- [Azure DevOps tasuta tasand](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### Lisatööriistad
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Õppimise ajakava soovitused

### Täistööaegne õpe (8 nädalat)
- **1.-2. nädal**: Moodulid 1-2 (Sissejuhatus, konfiguratsioon)
- **3.-4. nädal**: Moodulid 3-4 (Juurutus, eeljuurutus)
- **5.-6. nädal**: Moodulid 5-6 (Tõrkeotsing, täiustatud teemad)
- **7.-8. nädal**: Praktilised projektid ja lõplik hindamine

### Osalise tööajaga õpe (16 nädalat)
- **1.-4. nädal**: Moodul 1 (Sissejuhatus)
- **5.-7. nädal**: Moodul 2 (Konfiguratsioon ja keskkonnad)
- **8.-10. nädal**: Moodul 3 (Juurutus ja provisioning)
- **11.-12. nädal**: Moodul 4 (Eeljuurutuse valideerimine)
- **13.-14. nädal**: Moodul 5 (Tõrkeotsing ja silumine)
- **15.-16. nädal**: Moodul 6 (Täiustatud teemad ja hindamine)

---

## Edenemise jälgimine ja hindamisraamistik

### Peatüki lõpetamise kontrollnimekiri

Jälgi oma edenemist iga peatüki jooksul nende mõõdetavate tulemustega:

#### 📚 Peatükk 1: Alused ja kiire algus
- [ ] **Paigaldus lõpetatud**: AZD paigaldatud ja kontrollitud sinu platvormil
- [ ] **Esimene juurutus**: Edukalt juurutatud todo-nodejs-mongo mall
- [ ] **Keskkonna seadistamine**: Konfigureeritud esimesed keskkonna muutujad
- [ ] **Ressursside uurimine**: Uuritud juurutatud ressursse Azure portaali kaudu
- [ ] **Käskude valdamine**: Mugav põhiliste AZD käskude kasutamisel

#### 🤖 Peatükk 2: AI-esimene arendus  
- [ ] **AI malli juurutus**: Juurutatud azure-search-openai-demo edukalt
- [ ] **RAG rakendus**: Konfigureeritud dokumendindeks ja päring
- [ ] **Mudeli konfiguratsioon**: Määratud mitu erinevat AI mudelit erinevate eesmärkidega
- [ ] **AI jälgimine**: Rakendatud Application Insights AI töökoormusele
- [ ] **Jõudluse optimeerimine**: Häälestatud AI rakenduse jõudlust

#### ⚙️ Peatükk 3: Konfiguratsioon ja autentimine
- [ ] **Mitmekeskkonna seadistus**: Konfigureeritud arendus-, testimis- ja tootmiskeskkonnad
- [ ] **Turbe rakendus**: Määratud haldatud identiteedi autentimine
- [ ] **Saladuste haldus**: Integreeritud Azure Key Vault tundlike andmete jaoks
- [ ] **Parameetrite haldus**: Loodud keskkonnapõhised konfiguratsioonid
- [ ] **Autentimise valdamine**: Rakendatud turvalised juurdepääsumustrid

#### 🏗️ Peatükk 4: Infrastruktuur koodina ja juurutus
- [ ] **Kohandatud malli loomine**: Koostatud mitme teenusega rakenduse mall
- [ ] **Bicepi valdumine**: Loodud modulaarseid, taaskasutatavaid infrastruktuurikomponente
- [ ] **Juurutuse automatiseerimine**: Rakendatud eel- ja järeljuurutuse kinnituspooled
- [ ] **Arhitektuuridisain**: Juurutatud keeruka mikroteenuste arhitektuuri
- [ ] **Malli optimeerimine**: Optimeeritud malle jõudluse ja kulude seisukohalt

#### 🎯 Peatükk 5: Mitmeagendi AI lahendused
- [ ] **Jaekauba arhitektuuri ülevaade**: Tuvastatud rakenduse puuduvad komponendid ning planeeritud nende rakendus ja valideerimine
- [ ] **Agendi kohandamine**: Muudetud Kliendi ja Laoseisu agendi käitumist
- [ ] **Arhitektuuri skaleerimine**: Rakendatud koormuse tasakaalustamine ja automaatne skaleerimine
- [ ] **Tootmise jälgimine**: Loodud kõikehõlmav jälgimis- ja hoiatussüsteem
- [ ] **Jõudluse häälestus**: Optimeeritud mitmeagendilise süsteemi jõudlust

#### 🔍 Peatükk 6: Eel-juurutuse valideerimine ja planeerimine
- [ ] **Mahtude analüüs**: Analüüsitud rakenduste ressursivajadused
- [ ] **SKU optimeerimine**: Valitud kuluefektiivsed teenusetasemed
- [ ] **Valideerimise automatiseerimine**: Rakendatud eeljuurutuse kontrollskriptid
- [ ] **Kulude planeerimine**: Koostatud juurutuse kulude hinnangud ja eelarved
- [ ] **Riskide hindamine**: Tuvastatud ja maandatud juurutusriskid

#### 🚨 Peatükk 7: Tõrkeotsing ja silumine
- [ ] **Diagnoosioskused**: Edukalt silunud intentionaalselt vigaseid juurutusi
- [ ] **Logianalüüs**: Kasutanud efektiivselt Azure Monitorit ja Application Insightsi
- [ ] **Jõudluse häälestus**: Optimeerinud aeglaselt töötavaid rakendusi
- [ ] **Taastamisprotseduurid**: Rakendanud varundust ja katastroofitaastust
- [ ] **Jälgimise seadistamine**: Loodud proaktiivsed jälgimis- ja hoiatussüsteemid

#### 🏢 Peatükk 8: Tootmis- ja ettevõtte mustrid
- [ ] **Ettevõtte turve**: Rakendanud kõikehõlmavaid turvamustreid
- [ ] **Haldusraamistik**: Määranud Azure Policy ja ressursside halduse
- [ ] **Täiustatud jälgimine**: Loodud dashboardid ja automatiseeritud hoiatused
- [ ] **CI/CD integratsioon**: Koostanud automatiseeritud juurutustorud
- [ ] **Vastavuse rakendus**: Täitnud ettevõtte vastavusnõuded

### Õppimise ajakava ja verstapostid

#### 1.-2. nädal: Aluste loomine
- **Verstapost**: Juurutada esimene AI rakendus AZD abil
- **Valideerimine**: Töötav rakendus avaliku URL-iga
- **Oskused**: Põhilised AZD töövood ja AI teenuste integratsioon

#### 3.-4. nädal: Konfiguratsiooni valdamine
- **Verstapost**: Mitmekeskkondne juurutus turvalise autentimisega
- **Valideerimine**: Sama rakendus juurutatud arendus-, testimis- ja tootmiskeskkondadesse
- **Oskused**: Keskkondade haldus ja turbe rakendus

#### 5.-6. nädal: Infrastruktuuri ekspertiis
- **Verstapost**: Kohandatud mall keeruka mitme teenusega rakenduse jaoks
- **Valideerimine**: Taaskasutatav mall juurutatud teise meeskonnaliikme poolt
- **Oskused**: Bicepi valdamine ja infrastruktuuri automatiseerimine

#### 7.-8. nädal: Täiustatud AI rakendus
- **Verstapost**: Tootmisvalmis mitmeagendiline AI lahendus
- **Valideerimine**: Süsteem haldab reaalmaailma koormust jälgimisega
- **Oskused**: Mitmeagendiline orkestreerimine ja jõudluse optimeerimine

#### 9.-10. nädal: Tootmisvalmidus
- **Verstapost**: Ettevõttetaseme juurutus täiskorraldusega
- **Valideerimine**: Läbinud turvalisuse ülevaate ja kulude optimeerimise audit
- **Oskused**: Haldus, jälgimine ja CI/CD integratsioon

### Hindamine ja sertifitseerimine

#### Teadmiste valideerimise meetodid
1. **Praktilised juurutused**: Töötavad rakendused iga peatüki jaoks
2. **Koodi ülevaated**: Mallide ja konfiguratsioonide kvaliteedi hindamine
3. **Probleemide lahendamine**: Tõrkeotsingu stsenaariumid ja lahendused
4. **Võrdõppimine**: Selgitage kontseptsioone teistele õppijatele
5. **Kogukonna panus**: Jagage malle või täiustusi

#### Professionaalse arengu tulemused
- **Portfoolio projektid**: Õppesuhted ja arhitektuuriharjutused; tootmiskõlblikkus nõuab eraldi rakendamist ja ülevaatust
- **Tehnilised oskused**: Tööstusharu standard AZD ja tehisintellekti juurutamise ekspertteadmised
- **Probleemide lahendamise võimed**: Iseseisev tõrkeotsing ja optimeerimine
- **Kogukonna tunnustus**: Aktiivne osalemine Azure arendajate kogukonnas
- **Karjääri areng**: Oskused, mis on otseselt rakendatavad pilve- ja tehisintellektiroolides

#### Edu mõõdikud
- **Juurutuste õnnestumise määr**: >95% edukad juurutused
- **Tõrkeotsingu aeg**: <30 minutit tavapäraste probleemide puhul
- **Jõudluse optimeerimine**: Märgatavad parandused kuludes ja jõudluses
- **Turvakontroll**: Kirjeldage oma organisatsiooni nõuetele vastavad kontrollid ja järelejäänud lüngad; kursuse lõpetamine ei kinnita vastavust
- **Teadmiste edasiandmine**: Võime juhendada teisi arendajaid

### Jätkuv õppimine ja kogukonna kaasamine

#### Ole kursis
- **Azure uuendused**: Jälgi Azure Developer CLI väljaannete märkusi
- **Kogukonna üritused**: Osale Azure ja tehisintellekti arendajate üritustel
- **Dokumentatsioon**: Panusta kogukonna dokumentatsiooni ja näidistesse
- **Tagasiside tsükkel**: Anna tagasisidet kursuse sisu ja Azure teenuste kohta

#### Karjääri areng
- **Professionaalne võrgustik**: Loo ühendus Azure ja tehisintellekti ekspertidega
- **Ettekandmisvõimalused**: Esitle oma õppimisi konverentsidel või kohtumistel
- **Avatud lähtekoodiga panus**: Panusta AZD mallidesse ja tööriistadesse
- **Mentorlus**: Juhenda teisi arendajaid nende AZD õpiteekonnal

---

**Peatükkide navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../README.md)
- **📖 Alusta õppimist**: [Peatükk 1: Alused & Kiire algus](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Edusammude jälgimine**: Jälgi oma edenemist põhjalikus 8-peatükilises õppesüsteemis
- **🤝 Kogukond**: [Azure Discord](https://discord.gg/microsoft-azure) toe ja arutelu jaoks

**Õppe edenemise jälgimine**: Kasuta seda struktureeritud juhendit Azure Developer CLI valdamiseks läbi järkjärgulise, praktilise õppimise mõõdetavate tulemite ja professionaalse arengu eelistega.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->