# Õppematerjal - Põhjalikud õpieesmärgid

**Õppeteekonna navigeerimine**
- **📚 Kursuse avaleht**: [AZD algajatele](../README.md)
- **📖 Alusta õppimist**: [1. peatükk: Alused ja kiire algus](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Edusammude jälgimine**: [Kursuse lõpetamine](../README.md#-course-completion--certification)

## Sissejuhatus

See põhjalik õppematerjal pakub struktureeritud õpieesmärke, võtmekontseptsioone, praktilisi harjutusi ja hindamismaterjale, et aidata sul omandada Azure Developer CLI (azd). Kasuta seda juhendit oma edusammude jälgimiseks ja veendu, et oled katnud kõik olulised teemad.

## Õpieesmärgid

Selle õppematerjali läbimisega:
- Omandad kõik Azure Developer CLI põhi- ja edasijõudnud kontseptsioonid
- Arendad praktilisi oskusi Azure'i rakenduste juurutamisel ja haldamisel
- Saad enesekindluse juurutuste tõrkeotsingus ja optimeerimises
- Mõistad tootmiskõlblike juurutuspraktikate ja turvalisuse kaalutlusi

## Õpitulemused

Pärast kõigi selle õppematerjali osade läbimist suudad:
- Kavandada, juurutada ja hallata terviklikke rakendusarhitektuure, kasutades azd-d
- Rakendada põhjalikke monitooringu-, turva- ja kulude optimeerimise strateegiaid
- Iseseisvalt lahendada keerulisi juurutusprobleeme
- Luua kohandatud malle ja panustada azd kogukonda

## 8-peatükiline õpistruktuur

### 1. peatükk: Alused ja kiire algus (1. nädal)
**Kestus**: 30-45 minutit | **Keerukus**: ⭐

#### Õpieesmärgid
- Mõista Azure Developer CLI põhimõisteid ja terminoloogiat
- Paigaldada ja seadistada AZD oma arendusplatvormil
- Juurutada oma esimene rakendus, kasutades olemasolevat malli
- Navigeerida tõhusalt AZD käsurealiideses

#### Võtmekontseptsioonid
- AZD projekti struktuur ja komponendid (azure.yaml, infra/, src/)
- Mallipõhised juurutusvood
- Keskkonna seadistamise alused
- Ressursigruppide ja tellimuste haldamine

#### Praktilised harjutused
1. **Paigaldamise kontrollimine**: Paigalda AZD ja kontrolli `azd version` abil
2. **Esimene juurutus**: Juuruta edukalt todo-nodejs-mongo mall
3. **Keskkonna seadistamine**: Konfigureeri oma esimesed keskkonnamuutujad
4. **Ressursside uurimine**: Navigeeri juurutatud ressursse Azure'i portaalis

#### Hindamisküsimused
- Millised on AZD projekti põhikomponendid?
- Kuidas algatada uut projekti mallist?
- Mis vahe on käskudel `azd up` ja `azd deploy`?
- Kuidas hallata mitut keskkonda AZD abil?

---

### 2. peatükk: AI-põhine arendus (2. nädal)
**Kestus**: 1-2 tundi | **Keerukus**: ⭐⭐

#### Õpieesmärgid
- Integreerida Microsoft Foundry teenused AZD töövoogudega
- Juurutada ja konfigureerida AI-põhiseid rakendusi
- Mõista RAG (Retrieval-Augmented Generation) rakendusmustreid
- Hallata AI mudelite juurutusi ja skaleerimist

#### Võtmekontseptsioonid
- Azure OpenAI teenuse integreerimine ja API haldamine
- AI otsingu seadistamine ja vektorindekseerimine
- Mudelite juurutusstrateegiad ja võimsuse planeerimine
- AI rakenduste monitooring ja jõudluse optimeerimine

#### Praktilised harjutused
1. **AI vestluse juurutus**: Juuruta azure-search-openai-demo mall
2. **RAG rakendamine**: Konfigureeri dokumentide indekseerimine ja otsing
3. **Mudelikonfiguratsioon**: Seadista mitu AI mudelit erinevateks eesmärkideks
4. **AI monitooring**: Rakenda Application Insights AI töökoormuste jaoks

#### Hindamisküsimused
- Kuidas konfigureerida Azure OpenAI teenuseid AZD mallis?
- Millised on RAG arhitektuuri põhikomponendid?
- Kuidas hallata AI mudelite võimsust ja skaleerimist?
- Millised monitooringu mõõdikud on olulised AI rakenduste jaoks?

---

### 3. peatükk: Konfiguratsioon ja autentimine (3. nädal)
**Kestus**: 45-60 minutit | **Keerukus**: ⭐⭐

#### Õpieesmärgid
- Omandada keskkonna konfiguratsiooni ja haldamise strateegiad
- Rakendada turvalisi autentimismustreid ja hallatud identiteeti
- Organiseerida ressursse korrektsete nimetamisreeglitega
- Konfigureerida mitme keskkonna juurutusi (arendus, testimine, tootmine)

#### Võtmekontseptsioonid
- Keskkondade hierarhia ja konfiguratsiooni prioriteedid
- Hallatud identiteet ja teenusepõhise autentimise printsiibid
- Key Vault integratsioon tundlike andmete haldamiseks
- Keskkonnaspetsiifiliste parameetrite haldamine

#### Praktilised harjutused
1. **Mitme keskkonna seadistamine**: Konfigureeri arendus-, testimis- ja tootmiskeskkonnad
2. **Turvakonfiguratsioon**: Rakenda hallatud identiteedi autentimine
3. **Saladuste haldamine**: Integreeri Azure Key Vault tundlike andmete jaoks
4. **Parameetrite haldamine**: Loo keskkonnaspetsiifilised konfiguratsioonid

#### Hindamisküsimused
- Kuidas konfigureerida erinevaid keskkondi AZD abil?
- Millised on hallatud identiteedi eelised võrreldes teenusepõhiste autentimismeetoditega?
- Kuidas turvaliselt hallata rakenduse saladusi?
- Mis on AZD konfiguratsiooni hierarhia?

---

### 4. peatükk: Koodina kirjeldatud infrastruktuur ja juurutus (4.-5. nädal)
**Kestus**: 1-1,5 tundi | **Keerukus**: ⭐⭐⭐

#### Õpieesmärgid
- Luua ja kohandada Bicep infrastruktuuri malle
- Rakendada edasijõudnud juurutusmustrid ja töövood
- Mõista ressursside ettevalmistamise strateegiaid
- Kavandada skaleeritavaid mitme teenuse arhitektuure

- Juurutada konteineripõhiseid rakendusi, kasutades Azure Container Apps ja AZD-d

#### Võtmekontseptsioonid
- Bicep mallide struktuur ja parimad tavad
- Ressursside sõltuvused ja juurutuse järjekord
- Parameetrifailid ja mallide modulaarsus
- Kohandatud hookid ja juurutuse automatiseerimine
- Konteinerirakenduste juurutusmustrid (kiire algus, tootmine, mikroteenused)

#### Praktilised harjutused
1. **Kohandatud mallide loomine**: Loo mitme teenuse rakenduse mall
2. **Bicep oskuste arendamine**: Loo modulaarseid ja taaskasutatavaid infrastruktuurikomponente
3. **Juurutuse automatiseerimine**: Rakenda eel- ja järeljuurutuse hookid
4. **Arhitektuuri disain**: Juuruta keeruline mikroteenuste arhitektuur
5. **Konteinerirakenduste juurutus**: Juuruta [Simple Flask API](../../../examples/container-app/simple-flask-api) ja [Microservices Architecture](../../../examples/container-app/microservices) näited, kasutades AZD-d

#### Hindamisküsimused
- Kuidas luua kohandatud Bicep malle AZD jaoks?
- Millised on parimad tavad infrastruktuurikoodi organiseerimiseks?
- Kuidas hallata ressursside sõltuvusi mallides?
- Millised juurutusmustrid toetavad nullseisakuga uuendusi?

---

### 5. peatükk: Mitmeagendilised AI lahendused (6.-7. nädal)
**Kestus**: 2-3 tundi | **Keerukus**: ⭐⭐⭐⭐

#### Õpieesmärgid
- Kavandada ja rakendada mitmeagendilisi AI arhitektuure
- Orkestreerida agentide koordineerimist ja suhtlust
- Juurutada tootmiskõlblikke AI lahendusi koos monitooringuga
- Mõista agentide spetsialiseerumise ja töövoo mustreid
- Integreerida konteineripõhiseid mikroteenuseid osana mitmeagendilistest lahendustest

#### Võtmekontseptsioonid
- Mitmeagendilised arhitektuurimustrid ja disainiprintsiibid
- Agentide suhtlusprotokollid ja andmevoog
- Koormuse tasakaalustamise ja skaleerimise strateegiad AI agentidele
- Tootmise monitooring mitmeagendiliste süsteemide jaoks
- Teenustevaheline suhtlus konteinerikeskkondades

#### Praktilised harjutused
1. **Jaemüügilahenduse juurutus**: Juuruta täielik mitmeagendiline jaemüügistsenaarium
2. **Agentide kohandamine**: Muuda kliendi- ja inventuuriagentide käitumist
3. **Arhitektuuri skaleerimine**: Rakenda koormuse tasakaalustamine ja automaatne skaleerimine
4. **Tootmise monitooring**: Seadista põhjalik monitooring ja häirete süsteem
5. **Mikroteenuste integreerimine**: Laienda [Microservices Architecture](../../../examples/container-app/microservices) näidet, et toetada agendipõhiseid töövooge

#### Hindamisküsimused
- Kuidas kavandada tõhusad mitmeagendilised suhtlusmustrid?
- Millised on võtmekaalutlused AI agentide töökoormuste skaleerimisel?
- Kuidas monitoorida ja siluda mitmeagendilisi AI süsteeme?
- Millised tootmismustrid tagavad AI agentide töökindluse?

---

### 6. peatükk: Eeljuurutuse valideerimine ja planeerimine (8. nädal)
**Kestus**: 1 tund | **Keerukus**: ⭐⭐

#### Õpieesmärgid
- Teha põhjalik võimsuse planeerimine ja ressursside valideerimine
- Valida optimaalsed Azure SKU-d kulutõhususe tagamiseks
- Rakendada automatiseeritud eelkontrollid ja valideerimine
- Planeerida juurutusi kulude optimeerimise strateegiatega

#### Võtmekontseptsioonid
- Azure'i ressursside kvoodid ja võimsuse piirangud
- SKU valikukriteeriumid ja kulude optimeerimine
- Automatiseeritud valideerimisskriptid ja testimine
- Juurutuse planeerimine ja riskide hindamine

#### Praktilised harjutused
1. **Võimsuse analüüs**: Analüüsi oma rakenduste ressursinõudeid
2. **SKU optimeerimine**: Võrdle ja vali kulutõhusad teenustasemed
3. **Valideerimise automatiseerimine**: Rakenda eeljuurutuse kontrollskriptid
4. **Kulude planeerimine**: Loo juurutuse kuluhinnangud ja eelarved

#### Hindamisküsimused
- Kuidas valideerida Azure'i võimsust enne juurutust?
- Millised tegurid mõjutavad SKU valikuid?
- Kuidas automatiseerida eeljuurutuse valideerimist?
- Millised strateegiad aitavad optimeerida juurutuskulusid?

---

### 7. peatükk: Tõrkeotsing ja silumine (9. nädal)
**Kestus**: 1-1,5 tundi | **Keerukus**: ⭐⭐

#### Õpieesmärgid
- Arendada süsteemseid tõrkeotsingu lähenemisviise AZD juurutuste jaoks
- Lahendada levinud juurutus- ja konfiguratsiooniprobleeme
- Siluda AI-spetsiifilisi probleeme ja jõudlusprobleeme
- Rakendada monitooringut ja häireid probleemide ennetavaks avastamiseks

#### Võtmekontseptsioonid
- Diagnostikatehnikad ja logimisstrateegiad
- Levinud tõrkemustrid ja nende lahendused
- Jõudluse monitooring ja optimeerimine
- Intsidendihaldus ja taastamisprotseduurid

#### Praktilised harjutused
1. **Diagnostikaoskused**: Harjuta tahtlikult vigaste juurutustega
2. **Logianalüüs**: Kasuta tõhusalt Azure Monitori ja Application Insightsi
3. **Jõudluse häälestamine**: Optimeeri aeglaselt töötavaid rakendusi
4. **Taastamisprotseduurid**: Rakenda varundus- ja katastroofitaaste lahendusi

#### Hindamisküsimused
- Millised on kõige levinumad AZD juurutusvead?
- Kuidas siluda autentimis- ja õiguste probleeme?
- Millised monitooringustrateegiad aitavad vältida tootmisprobleeme?
- Kuidas optimeerida rakenduse jõudlust Azure'is?

---

### 8. peatükk: Tootmise ja ettevõtte mustrid (10.-11. nädal)
**Kestus**: 2-3 tundi | **Keerukus**: ⭐⭐⭐⭐

#### Õpieesmärgid
- Rakendada ettevõtte tasemel juurutusstrateegiaid
- Kavandada turvamustreid ja vastavusraamistikke
- Luua monitooringu, halduse ja kulude juhtimise süsteemid
- Luua skaleeritavad CI/CD torustikud AZD integratsiooniga
- Rakendada parimaid tavasid tootmiskonteinerite rakenduste juurutamiseks (turvalisus, monitooring, kulud, CI/CD)

#### Võtmekontseptsioonid
- Ettevõtte turvalisuse ja vastavuse nõuded
- Haldusraamistikud ja poliitikate rakendamine
- Täiustatud monitooring ja kulude juhtimine
- CI/CD integratsioon ja automatiseeritud juurutustorustikud
- Blue-green ja kanarijuurutuse strateegiad konteineripõhiste töökoormuste jaoks

#### Praktilised harjutused
1. **Ettevõtte turvalisus**: Rakenda põhjalikud turvamustrid
2. **Haldusraamistik**: Seadista Azure Policy ja ressursside haldus
3. **Täiustatud monitooring**: Loo juhtpaneelid ja automatiseeritud häired
4. **CI/CD integratsioon**: Ehita automatiseeritud juurutustorustikud
5. **Tootmiskonteinerite rakendused**: Rakenda turvalisust, monitooringut ja kulude optimeerimist [Microservices Architecture](../../../examples/container-app/microservices) näitele

#### Hindamisküsimused
- Kuidas rakendada ettevõtte turvalisust AZD juurutustes?
- Millised haldusmustrid tagavad vastavuse ja kulude kontrolli?
- Kuidas kavandada skaleeritavat monitooringut tootmissüsteemidele?
- Millised CI/CD mustrid sobivad kõige paremini AZD töövoogudega?

#### Õpieesmärgid
- Mõista Azure Developer CLI põhitõdesid ja põhikontseptsioone
- Paigaldada ja seadistada azd oma arenduskeskkonnas
- Teha esimene juurutus, kasutades olemasolevat malli
- Navigeerida azd projekti struktuuris ja mõista võtmekomponente

#### Võtmekontseptsioonid
- Mallid, keskkonnad ja teenused
- azure.yaml konfiguratsioonistruktuur
- Põhilised azd käsud (init, up, down, deploy)
- Koodina kirjeldatud infrastruktuuri põhimõtted
- Azure'i autentimine ja autoriseerimine

#### Praktilised harjutused

**Harjutus 1.1: Paigaldamine ja seadistamine**
```bash
# Täida need ülesanded:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Harjutus 1.2: Esimene juurutus**
```bash
# Paigalda lihtne veebirakendus:
1. Initialize project: azd init --template todo-nodejs-mongo
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
2. Milleks kasutatakse azure.yaml faili?
3. Kuidas aitavad keskkonnad hallata erinevaid juurutuse sihtm
5. Millised kaalutlused on olulised mitme piirkonna juurutuste puhul?

### Moodul 4: Enne juurutamist tehtav valideerimine (5. nädal)

#### Õpieesmärgid
- Rakendada põhjalikke enne juurutamist tehtavaid kontrolle
- Valdada võimsuse planeerimist ja ressursside valideerimist
- Mõista SKU valikut ja kulude optimeerimist
- Luua automatiseeritud valideerimise torujuhtmeid

#### Põhimõisted, mida omandada
- Azure'i ressursside kvoodid ja piirangud
- SKU valiku kriteeriumid ja kulude mõjud
- Automatiseeritud valideerimise skriptid ja tööriistad
- Võimsuse planeerimise metoodikad
- Jõudluse testimine ja optimeerimine

#### Harjutused

**Harjutus 4.1: Võimsuse planeerimine**
```bash
# Rakenda mahutavuse valideerimine:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Harjutus 4.2: Kontroll enne juurutamist**
```powershell
# Koosta terviklik valideerimise torujuhe:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Harjutus 4.3: SKU optimeerimine**
```bash
# Optimeeri teenuse konfiguratsioonid:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Enesehindamise küsimused
1. Millised tegurid peaksid mõjutama SKU valiku otsuseid?
2. Kuidas valideerida Azure'i ressursside saadavust enne juurutamist?
3. Millised on süsteemi kontrolli enne juurutamist põhikomponendid?
4. Kuidas hinnata ja kontrollida juurutamise kulusid?
5. Milline jälgimine on oluline võimsuse planeerimiseks?

### Moodul 5: Tõrkeotsing ja silumine (6. nädal)

#### Õpieesmärgid
- Valdada süstemaatilisi tõrkeotsingu metoodikaid
- Arendada oskusi keerukate juurutamisprobleemide silumiseks
- Rakendada põhjalikku jälgimist ja hoiatussüsteeme
- Luua intsidentide lahendamise ja taastamise protseduurid

#### Põhimõisted, mida omandada
- Levinud juurutamisvigade mustrid
- Logide analüüsi ja korrelatsiooni tehnikad
- Jõudluse jälgimine ja optimeerimine
- Turvaintsidentide tuvastamine ja lahendamine
- Katastroofide taastamine ja ärikontinuitet

#### Harjutused

**Harjutus 5.1: Tõrkeotsingu stsenaariumid**
```bash
# Harjuta levinud probleemide lahendamist:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Harjutus 5.2: Jälgimise rakendamine**
```bash
# Seadistage põhjalik jälgimine:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Harjutus 5.3: Intsidentide lahendamine**
```bash
# Koosta intsidentide lahendamise protseduurid:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Enesehindamise küsimused
1. Mis on süstemaatiline lähenemine azd juurutuste tõrkeotsingule?
2. Kuidas korreleerida logisid mitme teenuse ja ressursi vahel?
3. Millised jälgimismõõdikud on kõige olulisemad probleemide varajaseks tuvastamiseks?
4. Kuidas rakendada tõhusaid katastroofide taastamise protseduure?
5. Millised on intsidentide lahendamise plaani põhikomponendid?

### Moodul 6: Täiustatud teemad ja parimad praktikad (7.-8. nädal)

#### Õpieesmärgid
- Rakendada ettevõtte tasemel juurutamismustreid
- Valdada CI/CD integreerimist ja automatiseerimist
- Arendada kohandatud malle ja panustada kogukonda
- Mõista täiustatud turva- ja vastavusnõudeid

#### Põhimõisted, mida omandada
- CI/CD torujuhtme integreerimise mustrid
- Kohandatud mallide arendamine ja levitamine
- Ettevõtte juhtimine ja vastavus
- Täiustatud võrgu- ja turvakonfiguratsioonid
- Jõudluse optimeerimine ja kulude haldamine

#### Harjutused

**Harjutus 6.1: CI/CD integreerimine**
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**Harjutus 6.2: Kohandatud mallide arendamine**
```bash
# Loo ja avalda kohandatud mallid:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Harjutus 6.3: Ettevõtte rakendamine**
```bash
# Rakenda ettevõtte tasemel funktsioone:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Enesehindamise küsimused
1. Kuidas integreerida azd olemasolevatesse CI/CD töövoogudesse?
2. Millised on kohandatud mallide arendamise peamised kaalutlused?
3. Kuidas rakendada juhtimist ja vastavust azd juurutustes?
4. Millised on parimad praktikad ettevõtte tasemel juurutuste jaoks?
5. Kuidas tõhusalt panustada azd kogukonda?

## Praktilised projektid

### Projekt 1: Isiklik portfoolio veebisait
**Keerukus**: Algaja  
**Kestus**: 1-2 nädalat

Loo ja juuruta isiklik portfoolio veebisait, kasutades:
- Staatilise veebisaidi majutust Azure Storage'is
- Kohandatud domeeni konfiguratsiooni
- CDN-i integreerimist globaalse jõudluse jaoks
- Automatiseeritud juurutamise torujuhet

**Tulemused**:
- Töötav veebisait, mis on juurutatud Azure'is
- Kohandatud azd mall portfoolio juurutamiseks
- Juurutamise protsessi dokumentatsioon
- Kulude analüüs ja optimeerimise soovitused

### Projekt 2: Ülesannete haldamise rakendus
**Keerukus**: Keskmine  
**Kestus**: 2-3 nädalat

Loo täisfunktsionaalne ülesannete haldamise rakendus, mis sisaldab:
- React frontend, mis on juurutatud App Service'ile
- Node.js API backend koos autentimisega
- PostgreSQL andmebaas koos migratsioonidega
- Application Insights jälgimine

**Tulemused**:
- Täielik rakendus koos kasutaja autentimisega
- Andmebaasi skeem ja migratsiooniskriptid
- Jälgimise armatuurlauad ja hoiatusreeglid
- Mitme keskkonna juurutamise konfiguratsioon

### Projekt 3: Mikroteenuste e-kaubanduse platvorm
**Keerukus**: Täiustatud  
**Kestus**: 4-6 nädalat

Disaini ja rakenda mikroteenustel põhinev e-kaubanduse platvorm:
- Mitmed API teenused (kataloog, tellimused, maksed, kasutajad)
- Sõnumijärjekorra integreerimine Service Busiga
- Redis vahemälu jõudluse optimeerimiseks
- Põhjalik logimine ja jälgimine

**Viite näide**: Vaata [Mikroteenuste arhitektuur](../../../examples/container-app/microservices) tootmisvalmis malli ja juurutamise juhendit

**Tulemused**:
- Täielik mikroteenuste arhitektuur
- Teenustevahelise kommunikatsiooni mustrid
- Jõudluse testimine ja optimeerimine
- Tootmisvalmis turvalisuse rakendamine

## Hindamine ja sertifitseerimine

### Teadmiste kontroll

Täida need hindamised pärast iga moodulit:

**Mooduli 1 hindamine**: Põhimõisted ja paigaldamine
- Valikvastustega küsimused põhikontseptsioonide kohta
- Praktilised paigaldamise ja konfiguratsiooni ülesanded
- Lihtne juurutamise harjutus

**Mooduli 2 hindamine**: Konfiguratsioon ja keskkonnad
- Keskkonna haldamise stsenaariumid
- Konfiguratsiooni tõrkeotsingu harjutused
- Turvalisuse konfiguratsiooni rakendamine

**Mooduli 3 hindamine**: Juurutamine ja ressursside ettevalmistamine
- Infrastruktuuri disaini väljakutsed
- Mitme teenuse juurutamise stsenaariumid
- Jõudluse optimeerimise harjutused

**Mooduli 4 hindamine**: Enne juurutamist tehtav valideerimine
- Võimsuse planeerimise juhtumiuuringud
- Kulude optimeerimise stsenaariumid
- Valideerimise torujuhtme rakendamine

**Mooduli 5 hindamine**: Tõrkeotsing ja silumine
- Probleemide diagnoosimise harjutused
- Jälgimise rakendamise ülesanded
- Intsidentide lahendamise simulatsioonid

**Mooduli 6 hindamine**: Täiustatud teemad
- CI/CD torujuhtme disain
- Kohandatud mallide arendamine
- Ettevõtte arhitektuuri stsenaariumid

### Lõplik projekt

Disaini ja rakenda täielik lahendus, mis näitab kõigi kontseptsioonide valdamist:

**Nõuded**:
- Mitmetasandiline rakenduse arhitektuur
- Mitme juurutamise keskkond
- Põhjalik jälgimine ja hoiatussüsteemid
- Turvalisuse ja vastavuse rakendamine
- Kulude optimeerimine ja jõudluse häälestamine
- Täielik dokumentatsioon ja juhendid

**Hindamiskriteeriumid**:
- Tehnilise rakendamise kvaliteet
- Dokumentatsiooni täielikkus
- Turvalisuse ja parimate praktikate järgimine
- Jõudluse ja kulude optimeerimine
- Tõrkeotsingu ja jälgimise tõhusus

## Õppematerjalid ja viited

### Ametlik dokumentatsioon
- [Azure Developer CLI dokumentatsioon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep dokumentatsioon](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure arhitektuurikeskus](https://learn.microsoft.com/en-us/azure/architecture/)

### Kogukonna ressursid
- [AZD malligalerii](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub organisatsioon](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHubi repositoorium](https://github.com/Azure/azure-dev)

### Praktilised keskkonnad
- [Azure tasuta konto](https://azure.microsoft.com/free/)
- [Azure DevOps tasuta tase](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### Täiendavad tööriistad
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Õppeplaani soovitused

### Täiskohaga õpe (8 nädalat)
- **1.-2. nädal**: Moodulid 1-2 (Alustamine, Konfiguratsioon)
- **3.-4. nädal**: Moodulid 3-4 (Juurutamine, Enne juurutamist)
- **5.-6. nädal**: Moodulid 5-6 (Tõrkeotsing, Täiustatud teemad)
- **7.-8. nädal**: Praktilised projektid ja lõplik hindamine

### Osalise ajaga õpe (16 nädalat)
- **1.-4. nädal**: Moodul 1 (Alustamine)
- **5.-7. nädal**: Moodul 2 (Konfiguratsioon ja keskkonnad)
- **8.-10. nädal**: Moodul 3 (Juurutamine ja ressursside ettevalmistamine)
- **11.-12. nädal**: Moodul 4 (Enne juurutamist tehtav valideerimine)
- **13.-14. nädal**: Moodul 5 (Tõrkeotsing ja silumine)
- **15.-16. nädal**: Moodul 6 (Täiustatud teemad ja hindamine)

---

## Edusammude jälgimine ja hindamisraamistik

### Peatüki lõpetamise kontrollnimekiri

Jälgi oma edusamme iga peatüki kaudu nende mõõdetavate tulemustega:

#### 📚 Peatükk 1: Alused ja kiire alustamine
- [ ] **Paigaldamine lõpetatud**: AZD paigaldatud ja platvormil kontrollitud
- [ ] **Esimene juurutamine**: Edukalt juurutatud todo-nodejs-mongo mall
- [ ] **Keskkonna seadistamine**: Esimeste keskkonnamuutujate seadistamine
- [ ] **Ressursside navigeerimine**: Azure'i portaalis juurutatud ressursside uurimine
- [ ] **Käskude valdamine**: Mugavus AZD põhiliste käskudega

#### 🤖 Peatükk 2: AI-põhine arendus  
- [ ] **AI malli juurutamine**: Edukalt juurutatud azure-search-openai-demo
- [ ] **RAG rakendamine**: Dokumentide indekseerimise ja otsingu seadistamine
- [ ] **Mudelite konfiguratsioon**: Mitme AI mudeli seadistamine erinevateks eesmärkideks
- [ ] **AI jälgimine**: Rakendatud Application Insights AI töökoormuste jaoks
- [ ] **Jõudluse optimeerimine**: AI rakenduse jõudluse häälestamine

#### ⚙️ Peatükk 3: Konfiguratsioon ja autentimine
- [ ] **Mitme keskkonna seadistamine**: Dev, staging ja prod keskkondade seadistamine
- [ ] **Turvalisuse rakendamine**: Hallatud identiteedi autentimise seadistamine
- [ ] **Saladuste haldamine**: Azure Key Vaulti integreerimine tundlike andmete jaoks
- [ ] **Parameetrite haldamine**: Keskkonnaspetsiifiliste konfiguratsioonide loomine
- [ ] **Autentimise valdamine**: Turvaliste juurdepääsumustrite rakendamine

#### 🏗️ Peatükk 4: Infrastruktuur kui kood ja juurutamine
- [ ] **Kohandatud malli loomine**: Mitme teenuse rakenduse malli loomine
- [ ] **Bicep valdamine**: Modulaarsete, korduvkasutatavate infrastruktuurikomponentide loomine
- [ ] **Juurutamise automatiseerimine**: Enne/pärast juurutamist tehtavate konksude rakendamine
- [ ] **Arhitektuuri disain**: Keeruka mikroteenuste arhitektuuri juurutamine
- [ ] **Malli optimeerimine**: Mallide optimeerimine jõudluse ja kulude jaoks

#### 🎯 Peatükk 5: Mitme agendi AI lahendused
- [ ] **Jaemüügi lahenduse juurutamine**: Täieliku mitme agendi jaemüügi stsenaariumi juurutamine
- [ ] **Agendi kohandamine**: Kliendi ja inventari agendi käitumise muutmine
- [ ] **Arhitektuuri skaleerimine**: Koormuse tasakaalustamise ja automaatse skaleerimise rakendamine
- [ ] **Tootmise jälgimine**: Põhjaliku jälgimise ja hoiatussüsteemide seadistamine
- [ ] **Jõudluse häälestamine**: Mitme agendi süsteemi jõudluse optimeerimine

#### 🔍 Peatükk 6: Enne juurutamist tehtav valideerimine ja planeerimine
- [ ] **Võimsuse analüüs**: Rakenduste ressursside nõuete analüüs
- [ ] **SKU optimeerimine**: Kulutõhusate teenustasandite valimine
- [ ] **Valideerimise automatiseerimine**: Enne juurutamist tehtavate kontrollskriptide rakendamine
- [ ] **Kulude planeerimine**: Juurutamise kulude hinnangute ja eelarvete loomine
- [ ] **Riskide hindamine**: Juurutamise riskide tuvastamine ja leevendamine

#### 🚨 Peatükk 7: Tõrkeotsing ja silumine
- [ ] **Diagnostika oskused**: Edukalt silutud tahtlikult katki tehtud juurutused
- [ ] **Logide analüüs**: Azure Monitori ja Application Insightsi tõhus kasutamine
- [ ] **Jõudluse häälestamine**: Aeglaselt töötavate rakenduste optimeerimine
- [ ] **Taastamisprotseduurid**: Varundamise ja katastroofide taastamise rakendamine
- [ ] **Jälgimise seadistamine**: Proaktiivse jälgimise ja hoiatussüsteemide loomine

#### 🏢 Peatükk 8: Tootmine ja ettevõtte mustrid
- [ ] **Ettevõtte turvalisus**: Põhjalike turvamustrite rakendamine
- [ ] **Juhtimise raamistik**: Azure Policy ja ressursside haldamise seadistamine
- [ ] **Täiustatud jälgimine**: Armatuurlauad ja automatiseeritud hoiatussüsteemid
- [ ] **CI/CD integreerimine**: Automatiseeritud juurutamise torujuhtmete loomine
- [ ] **Vastavuse rakendamine**: Ettevõtte vastavusnõuete täitmine

### Õppimise ajakava ja verstapostid

#### 1.-2. nädal: Aluste loomine
- **Verstapost**: Esimese AI rakend
5. **Kogukonna panus**: Jagage malle või täiustusi

#### Professionaalse arengu tulemused
- **Portfoolio projektid**: 8 tootmiskõlblikku juurutust
- **Tehnilised oskused**: Tööstusstandardile vastav AZD ja AI juurutamise ekspertteadmised
- **Probleemide lahendamise oskused**: Iseseisev tõrkeotsing ja optimeerimine
- **Kogukonna tunnustus**: Aktiivne osalemine Azure'i arendajate kogukonnas
- **Karjääri edendamine**: Oskused, mis on otseselt rakendatavad pilve- ja AI-rollides

#### Edu mõõdikud
- **Juurutuste edukuse määr**: >95% edukad juurutused
- **Tõrkeotsingu aeg**: <30 minutit tavaprobleemide lahendamiseks
- **Jõudluse optimeerimine**: Nähtavad parandused kuludes ja jõudluses
- **Turvastandardite järgimine**: Kõik juurutused vastavad ettevõtte turvastandarditele
- **Teadmiste jagamine**: Võime mentordada teisi arendajaid

### Pidev õppimine ja kogukonna kaasamine

#### Ole kursis
- **Azure'i uuendused**: Jälgige Azure Developer CLI väljalaskemärkmeid
- **Kogukonna üritused**: Osalege Azure'i ja AI arendajate üritustel
- **Dokumentatsioon**: Panustage kogukonna dokumentatsiooni ja näidete loomisse
- **Tagasiside**: Andke tagasisidet kursuse sisu ja Azure'i teenuste kohta

#### Karjääriarendus
- **Professionaalne võrgustik**: Looge kontakte Azure'i ja AI ekspertidega
- **Esinemisvõimalused**: Jagage oma õppetunde konverentsidel või kohtumistel
- **Avatud lähtekoodiga panus**: Panustage AZD mallidesse ja tööriistadesse
- **Mentorlus**: Juhendage teisi arendajaid nende AZD õppe teekonnal

---

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../README.md)
- **📖 Alusta õppimist**: [1. peatükk: Alused ja kiirstart](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Edusammude jälgimine**: Jälgige oma arengut tervikliku 8-peatükilise õppesüsteemi kaudu
- **🤝 Kogukond**: [Azure Discord](https://discord.gg/microsoft-azure) toe ja arutelu jaoks

**Õppe edenemise jälgimine**: Kasutage seda struktureeritud juhendit, et omandada Azure Developer CLI praktilise ja järkjärgulise õppimise kaudu koos mõõdetavate tulemuste ja professionaalse arengu eelistega.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:  
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame tagada täpsust, palume arvestada, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Algne dokument selle algses keeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitame kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste või valesti tõlgenduste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->