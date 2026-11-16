# Õppejuhend - Kõikehõlmavad õpieesmärgid

**Õpperaja navigeerimine**
- **📚 Kursuse avaleht**: [AZD algajatele](../README.md)
- **📖 Alusta õppimist**: [1. peatükk: Põhitõed ja kiire algus](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Edu jälgimine**: [Kursuse lõpetamine](../README.md#-course-completion--certification)

## Sissejuhatus

See põhjalik õppejuhend pakub struktureeritud õpieesmärke, võtmekontseptsioone, praktilisi harjutusi ja hindematerjale, et aidata teil Azure Developer CLI (azd) meistriks saada. Kasutage seda juhendit oma edusammu jälgimiseks ning tagamaks, et olete kaetanud kõik olulised teemad.

## Õpieesmärgid

Selle õppejuhendi läbimisel saate:
- Valdada kõiki Azure Developer CLI põhikäse ja keerukamaid mõisteid
- Arendada praktilisi oskusi Azure rakenduste juurutamisel ja haldamisel
- Ehitada üles kindlustunne tõrkeotsinguks ja juurutuste optimeerimiseks
- Mõista tootmisküpsete juurutuste tavasid ja turvakaalutlusi

## Õpitulemused

Pärast kõigi selle õppejuhendi osade läbimist saate:
- Kujundada, juurutada ja hallata täielikke rakenduste arhitektuure, kasutades azd-d
- Rakendada põhjalikke jälgimis-, turva- ja kulude optimeerimise strateegiaid
- Iseseisvalt lahendada keerukaid juurutuste probleeme
- Luua kohandatud malle ja panustada azd kogukonda

## 8-peatükiline õppeskeem

### 1. peatükk: Põhitõed ja kiire algus (1. nädal)
**Kestus**: 30-45 minutit | **Keerukus**: ⭐

#### Õpieesmärgid
- Mõista Azure Developer CLI põhikontseptsioone ja terminoloogiat
- Edukalt installida ja konfigureerida AZD oma arendusplatvormil
- Juurutada oma esimene rakendus olemasoleva malli abil
- Efektiivselt navigeerida AZD käsurea liideses

#### Põhikontseptsioonid, mida valdada
- AZD projekti struktuur ja komponendid (azure.yaml, infra/, src/)
- Mallipõhised juurutusvood
- Keskkonna konfiguratsiooni põhialused
- Ressursirühma ja tellimuse haldus

#### Praktilised harjutused
1. **Installatsiooni kontroll**: Installi AZD ja kontrolli seda `azd version` abil
2. **Esimene juurutus**: Juuruta edu@todo-nodejs-mongo mall
3. **Keskkonna seadistamine**: Sea üles oma esimesed keskkonnamuutujad
4. **Ressursside uurimine**: Sirvi juurutatud ressursse Azure Portalil

#### Hindamisküsimused
- Millised on AZD projekti põhikomponendid?
- Kuidas initsialiseerida uut projekti mallist?
- Mis vahe on `azd up` ja `azd deploy` vahel?
- Kuidas AZD-ga hallata mitut keskkonda?

---

### 2. peatükk: AI-esimene arendus (2. nädal)
**Kestus**: 1-2 tundi | **Keerukus**: ⭐⭐

#### Õpieesmärgid
- Integreerida Microsoft Foundry teenuseid AZD töövoogudega
- Juurutada ja seadistada tehisintellektist jõustatud rakendusi
- Mõista RAG-i (otsingu-täiendatud generatsiooni) rakendamise mustreid
- Hallata tehisintellekti mudelite juurutamist ja skaleerimist

#### Põhikontseptsioonid, mida valdada
- Microsoft Foundry mudelite teenuse integratsioon ja API haldus
- AI otsingu seadistamine ja vektorindekseerimine
- Mudeli juurutusstrateegiad ja mahukavandamine
- AI rakenduste jälgimine ja jõudluse optimeerimine

#### Praktilised harjutused
1. **AI vestluse juurutus**: Juuruta azure-search-openai-demo mall
2. **RAG rakendus**: Seadista dokumentide indekseerimine ja otsing
3. **Mudeli seadistamine**: Seadista mitu AI mudelit erinevate eesmärkidega
4. **AI jälgimine**: Rakenda Application Insights AI töökoormuse jaoks

#### Hindamisküsimused
- Kuidas seadistada Microsoft Foundry mudelite teenuseid AZD mallis?
- Millised on RAG arhitektuuri põhikomponendid?
- Kuidas hallata AI mudelite mahutalitust ja skaleerimist?
- Millised jälgimismõõdikud on AI rakenduste jaoks olulised?

---

### 3. peatükk: Konfiguratsioon ja autentimine (3. nädal)
**Kestus**: 45-60 minutit | **Keerukus**: ⭐⭐

#### Õpieesmärgid
- Valdada keskkonna konfiguratsiooni ja halduse strateegiaid
- Rakendada turvalisi autentimismustreid ja hallatud identiteeti
- Korraldada ressursse asjakohaste nimetamise tavadega
- Konfigureerida mitmekeskkondseid juurutusi (dev, staging, prod)

#### Põhikontseptsioonid, mida valdada
- Keskkonna hierarhia ja konfiguratsiooni prioriteet
- Hallatud identiteedi ja teenuslike volituste autentimine
- Key Vault integratsioon saladuste haldamiseks
- Keskkondade spetsiifiline parameetrite haldus

#### Praktilised harjutused
1. **Mitmekeskkondne seadistus**: Konfigureeri dev, staging ja prod keskkonnad
2. **Turvakonfiguratsioon**: Rakenda hallatud identiteedi autentimine
3. **Saladuste haldus**: Integreeri Azure Key Vault tundlike andmete jaoks
4. **Parameetrite haldus**: Loo keskkondade spetsiifilised konfiguratsioonid

#### Hindamisküsimused
- Kuidas konfigureerida erinevaid keskkondi AZD-s?
- Millised on hallatud identiteedi kasutamise eelised teenuslike volituste ees?
- Kuidas turvaliselt hallata rakenduse saladusi?
- Mis on AZD konfiguratsiooni hierarhia?

---

### 4. peatükk: Infrastruktuur koodina & juurutus (4.-5. nädal)
**Kestus**: 1-1,5 tundi | **Keerukus**: ⭐⭐⭐

#### Õpieesmärgid
- Luua ja kohandada Bicep infrastruktuuri malle
- Rakendada keerukaid juurutusmustreid ja töövooge
- Mõista ressursside provisjonimise strateegiaid
- Kujundada skaleeritavad mitme-teenusega arhitektuurid

- Juurutada konteineripõhiseid rakendusi Azure Container Apps ja AZD abil


#### Põhikontseptsioonid, mida valdada
- Bicep malli struktuur ja parimad tavad
- Ressursside sõltuvused ja juurutamise järjekord
- Parameetri failid ja malli moodulid
- Kohandatud konksud ja juurutuse automatiseerimine
- Konteinerirakenduse juurutusmustrit (kiire algus, tootmine, mikroteenused)

#### Praktilised harjutused
1. **Kohandatud malli loomine**: Ehita mitme-teenusega rakenduse mall
2. **Bicep valdamine**: Loo moodulaarseid, taaskasutatavaid infrastruktuuri komponente
3. **Juurutuse automatiseerimine**: Rakenda eelpõhi/järgjärgi konksud
4. **Arhitektuuri kujundus**: Juuruta keerukas mikroteenuste arhitektuur
5. **Konteinerirakenduse juurutus**: Juuruta näited [Simple Flask API](../../../examples/container-app/simple-flask-api) ja [Microservices Architecture](../../../examples/container-app/microservices) AZD abil

#### Hindamisküsimused
- Kuidas luua kohandatud Bicep malle AZD jaoks?
- Millised on parimad tavad infrastruktuuri koodi organiseerimisel?
- Kuidas käsitleda ressursside sõltuvusi mallides?
- Millised juurutusmustrid toetavad null-seiskamistega uuendusi?

---

### 5. peatükk: Mitmeagendilised AI lahendused (6.-7. nädal)
**Kestus**: 2-3 tundi | **Keerukus**: ⭐⭐⭐⭐

#### Õpieesmärgid
- Kujundada ja rakendada mitmeagendilisi AI arhitektuure
- Orkestreerida agentide koordineerimist ja suhtlust
- Juurutada tootmiskõlblikke AI lahendusi jälgimisega
- Mõista agentide spetsialiseerumist ja töövoo mustreid
- Integreerida konteineripõhised mikroteenused mitmeagentsetesse lahendustesse

#### Põhikontseptsioonid, mida valdada
- Mitmeagentsete arhitektuurimustrid ja disainipõhimõtted
- Agendi sideprotokollid ja andmevoog
- Koormuse tasakaalustamise ja skaleerimise strateegiad AI agentidele
- Tootmise jälgimine mitmeagentsetele süsteemidele
- Teenus-teenusele side konteineripõhistes keskkondades

#### Praktilised harjutused
1. **Jaekaubanduse arhitektuuri ülevaade**: Analüüsi jaekaubanduse plaan ja määra, millised rakenduskomponendid tuleb enne juurutust implementeerida
2. **Agendi kohandamine**: Muuda Customer ja Inventory agentide käitumist
3. **Arhitektuuri skaleerimine**: Rakenda koormuse tasakaalustamist ja automaatset skaleerimist
4. **Tootmise jälgimine**: Sea üles ulatuslik jälgimine ja häired
5. **Mikroteenuste integratsioon**: Laienda [Microservices Architecture](../../../examples/container-app/microservices) näidet, et toetada agentidele põhinevaid töövooge

#### Hindamisküsimused
- Kuidas kujundada tõhusaid mitmeagendilisi suhtlusmustreid?
- Millised on peamised kaalutlused AI agentide töökoormuse skaleerimiseks?
- Kuidas jälgida ja siluda mitmeagendilisi AI süsteeme?
- Millised tootmistavad tagavad usaldusväärsuse AI agentidele?

---

### 6. peatükk: Eeljuurutuse valideerimine ja planeerimine (8. nädal)
**Kestus**: 1 tund | **Keerukus**: ⭐⭐

#### Õpieesmärgid
- Teha põhjalikku suutlikkuse planeerimist ja ressursside valideerimist
- Valida optimaalsed Azure SKU-d kuluefektiivsuse tagamiseks
- Rakendada automatiseeritud eelfliidisüsteeme ja valideerimisi
- Planeerida juurutusi kulude optimeerimise strateegiatega

#### Põhikontseptsioonid, mida valdada
- Azure ressursside kvotid ja suutlikkuse piirangud
- SKU valiku kriteeriumid ja kulude optimeerimine
- Automatiseeritud valideerimisskriptid ja testimine
- Juurutuse planeerimine ja riskihindamine

#### Praktilised harjutused
1. **Suutlikkuse analüüs**: Analüüsi oma rakenduste ressursinõudeid
2. **SKU optimeerimine**: Võrdle ja vali kuluefektiivsed teenusetasemed
3. **Valideerimise automatiseerimine**: Rakenda eelfliidi kontrollskriptid
4. **Kulude planeerimine**: Loo juurutuste kulude eelarved ja hinnangud

#### Hindamisküsimused
- Kuidas valideerida Azure suutlikkust enne juurutust?
- Millised tegurid mõjutavad SKU valikut?
- Kuidas automatiseerida eelfliidi valideerimist?
- Millised strateegiad aitavad optimeerida juurutuskulusid?

---

### 7. peatükk: Tõrkeotsing ja silumine (9. nädal)
**Kestus**: 1-1,5 tundi | **Keerukus**: ⭐⭐

#### Õpieesmärgid
- Arendada süsteemseid silumisvõtteid AZD juurutusteks
- Lahendada tavalisi juurutus- ja konfiguratsiooniprobleeme
- Siluda AI spetsiifilisi probleeme ja jõudlusküsimusi
- Rakendada jälgimist ja häireid probleemide proaktiivseks avastamiseks

#### Põhikontseptsioonid, mida valdada
- Diagnostikatehnikad ja logimise strateegiad
- Levinud rikete mustrid ja nende lahendused
- Jõudluse jälgimine ja optimeerimine
- Intsidendi reageerimise ja taastamise protseduurid

#### Praktilised harjutused
1. **Diagnostikaoskused**: Harjuta teadlikult rikete tekitatud juurutustega
2. **Logi analüüs**: Kasuta Azure Monitori ja Application Insightsi tulemuslikult
3. **Jõudluse häälestus**: Optimeeri aeglaselt töötavaid rakendusi
4. **Taastamisprotseduurid**: Rakenda varundamist ja katastroofitaastamist

#### Hindamisküsimused
- Millised on kõige levinumad AZD juurutuse riketüübid?
- Kuidas siluda autentimise ja õiguste probleeme?
- Millised jälgimisstrateegiad aitavad ennetada tootmisprobleeme?
- Kuidas optimeerida rakenduse jõudlust Azure keskkonnas?

---

### 8. peatükk: Tootmis- ja ettevõtte mustrid (10.-11. nädal)
**Kestus**: 2-3 tundi | **Keerukus**: ⭐⭐⭐⭐

#### Õpieesmärgid
- Rakendada ettevõttetaseme juurutusstrateegiaid
- Kujundada turvamustreid ja vastavusraamistikke
- Luua jälgimine, valitsemine ja kulude haldus
- Luua skaleeritavad CI/CD torujuhtmed AZD integratsiooniga
- Rakendada parimaid tavasid tootmises konteinerirakenduste juurutamiseks (turvalisus, jälgimine, kulud, CI/CD)

#### Põhikontseptsioonid, mida valdada
- Ettevõtte turbe- ja vastavusnõuded
- Valitsemisraamistiku ja poliitika rakendamine
- Täiustatud jälgimine ja kulude haldus
- CI/CD integratsioon ja automatiseeritud juurutustoru
- Blue-green ja canary juurutusstrateegiad konteinerikoormustele

#### Praktilised harjutused
1. **Ettevõtte turvalisus**: Rakenda põhjalikke turvamustreid
2. **Valitsemisraamistik**: Sea üles Azure Policy ja ressursside haldus
3. **Täiustatud jälgimine**: Loo armatuurlauad ja automatiseeritud häired
4. **CI/CD integratsioon**: Ehita automatiseeritud juurutustorud
5. **Tootmiskonteinerirakendused**: Rakenda turvalisus, jälgimine ja kulude optimeerimine [Microservices Architecture](../../../examples/container-app/microservices) näitele

#### Hindamisküsimused
- Kuidas rakendada ettevõtte turvalisust AZD juurutustes?
- Millised valitsemismustrid tagavad vastavuse ja kulude kontrolli?
- Kuidas kujundada skaleeritav jälgimine tootmissüsteemidele?
- Millised CI/CD mustrid sobivad kõige paremini AZD töövoogudega?

#### Õpieesmärgid
- Mõista Azure Developer CLI aluseid ja põhikontseptsioone
- Edukalt installida ja konfigureerida azd arenduskeskkonnas
- Teha oma esimene juurutus olemasoleva malli abil
- Navigeerida azd projekti struktuuris ja mõista võtmekomponente

#### Põhikontseptsioonid, mida valdada
- Mallid, keskkonnad ja teenused
- azure.yaml konfiguratsioonistruktuur
- Põhilised azd käsud (init, up, down, deploy)
- Infrastruktuur koodina põhimõtted
- Azure autentimine ja autoriseerimine

#### Praktilised harjutused

**Harjutus 1.1: Installatsioon ja seadistamine**
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
3. Kuidas aitavad keskkonnad hallata erinevaid juurutusi?
4. Milliseid autentimismeetodeid saab azd-ga kasutada?
5. Mis juhtub, kui käivitate `azd up` esimest korda?

---

## Edu jälgimine ja hindamisraamistik
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
1. Kuidas käsitleb azd keskkonnamuutujate prioriteeti?
2. Mis on juurutuskonksud ja millal neid kasutada?
3. Kuidas seadistada erinevaid SKU-sid eri keskkondade jaoks?
4. Millised on turvariske erinevate autentimismeetodite puhul?
5. Kuidas hallata saladusi ja tundlikku konfiguratsiooniteavet?

### Moodul 3: Juurutus ja provisjonimine (4. nädal)

#### Õpieesmärgid
- Valdada juurutuse töövood ja parimad tavad
- Mõista infrastruktuuri koodina Bicep mallidega
- Rakendada keerukaid mitme-teenusega arhitektuure
- Optimeerida juurutuse jõudlust ja usaldusväärsust

#### Põhikontseptsioonid, mida valdada
- Bicep malli struktuur ja moodulid
- Ressursside sõltuvused ja juurutamise järjekord
- Juurutusstrateegiad (blue-green, järk-järguline uuendus)
- Mitme regiooni juurutused
- Andmebaasi migratsioonid ja andmehõive haldus

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

**Harjutus 3.2: Mitme-teenusega rakendus**
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
1. Millised on Bicep kasutamise eelised võrreldes ARM mallidega?
2. Kuidas hallata andmebaasi migratsioone azd juurutustes?
3. Millised strateegiad võimaldavad null-seiskamistega juurutusi?
4. Kuidas hallata teenustevahelisi sõltuvusi?
5. Millised kaalutlused kehtivad mitmeregiooniliste juurutuste puhul?

### Moodul 4: Eeljuurutuse valideerimine (5. nädal)

#### Õpieesmärgid
- Rakenda põhjalikke enne kasutuselevõttu tehtavaid kontrolle
- Õpi valitsema mahtude planeerimist ja ressursside valideerimist
- SAA aru SKU valikust ja kulude optimeerimisest
- Ehita automatiseeritud valideerimise torujuhtmeid

#### Peamised Mõisted, Mida Õppida
- Azure'i ressursipiirangud ja -mahtude limiidid
- SKU valiku kriteeriumid ja kulude mõjud
- Automatiseeritud valideerimisskriptid ja tööriistad
- Mahtude planeerimise metoodikad
- Jõudluse testimine ja optimeerimine

#### Harjutused

**Harjutus 4.1: Mahtude planeerimine**
```text
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Harjutus 4.2: Enne lennule minekut valideerimine**
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

#### Enesehindamise Küsimused
1. Millised tegurid peaksid mõjutama SKU valikuid?
2. Kuidas kontrollida Azure'i resursside saadavust enne kasutuselevõttu?
3. Millised on pre-lennu kontrollsüsteemi peamised komponendid?
4. Kuidas hinnata ja kontrollida juurutamise kulusid?
5. Milline jälgimine on vajalik mahtude planeerimiseks?

### Moodul 5: Tõrkeotsing ja silumine (6. nädal)

#### Õpieesmärgid
- Õpi valitsema süsteemseid tõrkeotsingu meetodeid
- Arenda oskust keerukate juurutamisprobleemide silumiseks
- Rakenda põhjalikku jälgimist ja teavitamist
- Ehita intsidentidele reageerimise ja taastamise protseduurid

#### Peamised Mõisted, Mida Õppida
- Levinumad juurutamise ebaõnnestumise mustrid
- Logianalüüsi ja korrelatsiooni tehnikad
- Jõudluse jälgimine ja optimeerimine
- Turvaintsidentide avastamine ja reaktsioon
- Katastroofitaastamine ja ärijätkusuutlikkus

#### Harjutused

**Harjutus 5.1: Tõrkeotsingu stsenaariumid**
```text
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Harjutus 5.2: Jälgimise rakendamine**
```text
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Harjutus 5.3: Intsidentidele reageerimine**
```text
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Enesehindamise Küsimused
1. Mis on süsteemne lähenemine azd juurutamise tõrkeotsingule?
2. Kuidas korreleerida logisid mitmete teenuste ja ressursside vahel?
3. Millised jälgimismeetrikud on kriitilise tähtsusega varajase probleemide avastamise jaoks?
4. Kuidas rakendada tõhusaid katastroofitaastamise protseduure?
5. Millised on peamised komponendid intsidentidele reageerimise plaanis?

### Moodul 6: Täiustatud Teemad ja Parimad Tavad (7.-8. nädal)

#### Õpieesmärgid
- Rakenda ettevõtte tasemel juurutamismustreid
- Õpi tundma CI/CD integratsiooni ja automatiseerimist
- Arenda kohandatud malle ja aita kogukonnal kaasa
- Saa aru täiustatud turbe- ja nõuetele vastavusest

#### Peamised Mõisted, Mida Õppida
- CI/CD torujuhtmete integreerimise mustrid
- Kohandatud mallide arendamine ja levitamine
- Ettevõtte haldus ja vastavus
- Täiustatud võrgustiku ja turbekonfiguratsioonid
- Jõudluse optimeerimine ja kulude juhtimine

#### Harjutused

**Harjutus 6.1: CI/CD integratsioon**
```text
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**Harjutus 6.2: Kohandatud malli arendamine**
```text
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Harjutus 6.3: Ettevõtte rakendus**
```text
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Enesehindamise Küsimused
1. Kuidas integreerida azd olemasolevatesse CI/CD töövoogudesse?
2. Millised on peamised kaalutlused kohandatud mallide arendamisel?
3. Kuidas rakendada haldust ja vastavust azd juurutustes?
4. Millised on parimad tavad ettevõtte tasemel juurutamiseks?
5. Kuidas panustada efektiivselt azd kogukonda?

## Praktilised Projektid

### Projekt 1: Isiklik Portfoolio Veebisait
**Keerukus**: Algaja  
**Kestus**: 1-2 nädalat

Ehita ja juuruta isiklik portfoolio veebisait kasutades:
- Staatilist veebimajutust Azure Storage’is
- Kohandatud domeeni konfiguratsiooni
- CDN integratsiooni ülemaailmseks jõudluseks
- Automatiseeritud juurutustoru

**Tarnitavad tulemused**:
- Töötav veebisait Azure’i peal
- Kohandatud azd mall portfoolio juurutamiseks
- Juurutamise protsessi dokumentatsioon
- Kuluanalüüs ja optimeerimissoovitused

### Projekt 2: Ülesannete Halduse Rakendus
**Keerukus**: Kesktase  
**Kestus**: 2-3 nädalat

Loo täispaketi ülesannete halduse rakendus, kaasa arvatud:
- Reacti kasutajaliides ja App Services juurutus
- Node.js API tagaplaan koos autentimisega
- PostgreSQL andmebaas koos migratsioonidega
- Application Insights jälgimine

**Tarnitavad tulemused**:
- Täisrakendus koos kasutaja autentimisega
- Andmebaasi skeem ja migratsiooniskriptid
- Jälgimisdashbordid ja teavitamissätted
- Mitmekesiste keskkondade juurutamise konfiguratsioon

### Projekt 3: Mikroteenuste E-kaubanduse Platvorm
**Keerukus**: Täiustatud  
**Kestus**: 4-6 nädalat

Disaini ja juuruta mikroteenustepõhine e-kaubanduse platvorm:
- Mitmed API teenused (kataloog, tellimused, maksed, kasutajad)
- Sõnumijärjekorra integratsioon Service Bus’iga
- Redis vahemälu jõudluse optimeerimiseks
- Põhjalik logimine ja jälgimine

**Võrdlusnäide**: Vaata [Microservices Architecture](../../../examples/container-app/microservices) kahte teenust hõlmavat õppematerjali ja juurutusjuhendit. Järjekorrad, püsivus, autentimine, maksete töötlemine ja tootmisvalmiduse tugevdamine on eraldi projektitöö osad.

**Tarnitavad tulemused**:
- Täielik mikroteenuste arhitektuur
- Teenustevahelise suhtluse mustrid
- Jõudluse testimine ja optimeerimine
- Tootmisvalmis turvastrateegia rakendus

## Hinnang ja Sertifitseerimine

### Teadmiste Kontrollid

Täida need testid pärast iga mooduli lõppu:

**Mooduli 1 hinnang**: Põhimõisted ja paigaldus
- Mitmevalikuvõimalustega küsimused põhikontseptsioonide kohta
- Praktilised paigaldamise ja seadistamise ülesanded
- Lihtne juurutusharjutus

**Mooduli 2 hinnang**: Konfiguratsioon ja keskkonnad
- Keskkonna haldustsenaariumid
- Konfiguratsiooni tõrkeotsingu harjutused
- Turvakonfiguratsiooni rakendamine

**Mooduli 3 hinnang**: Juurutamine ja provisjonimine
- Infrastruktuuri kujundamise ülesanded
- Mitme teenuse juurutussituatsioonid
- Jõudluse optimeerimise harjutused

**Mooduli 4 hinnang**: Enne juurutamist tehtavad kontrollid
- Mahtude planeerimise juhtumilood
- Kulude optimeerimise stsenaariumid
- Valideerimisprotsessi rakendus

**Mooduli 5 hinnang**: Tõrkeotsing ja silumine
- Probleemide diagnoosi harjutused
- Jälgimise seadistamise ülesanded
- Intsidentidele reageerimise simulatsioonid

**Mooduli 6 hinnang**: Täiustatud teemad
- CI/CD torujuhtme kujundamine
- Kohandatud mallide arendamine
- Ettevõtte arhitektuuri stsenaariumid

### Lõplik Lõputöö

Kujunda ja juuruta terviklik lahendus, mis demonstreerib kõigi kontseptsioonide valdamist:

**Nõuded**:
- Mitmekihiline rakenduse arhitektuur
- Mitmed juurutuskeskkonnad
- Põhjalik jälgimine ja teavitamine
- Turbe- ja vastavuse rakendus
- Kulude optimeerimine ja jõudluse häälestus
- Täielik dokumentatsioon ja tegevuskavad

**Hindamiskriteeriumid**:
- Tehnilise rakenduse kvaliteet
- Dokumentatsiooni täielikkus
- Turvalisus ja parimate tavade järgimine
- Jõudlus ja kulude optimeerimine
- Tõrkeotsingu ja jälgimise tõhusus

## Õppematerjalid ja Viited

### Ametlik Dokumentatsioon
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Kogukonna Ressursid
- [AZD Template Gallery](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub Organization](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHub Repository](https://github.com/Azure/azure-dev)

### Harjutuskeskkonnad
- [Azure Free Account](https://azure.microsoft.com/free/)
- [Azure DevOps Free Tier](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### Lisatööriistad
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Õppegraafiku Soovitused

### Täiskoormusega Õpe (8 nädalat)
- **1.-2. nädal**: Moodulid 1-2 (Sissejuhatus, Konfiguratsioon)
- **3.-4. nädal**: Moodulid 3-4 (Juurutamine, Enne juurutamist)
- **5.-6. nädal**: Moodulid 5-6 (Tõrkeotsing, Täiustatud teemad)
- **7.-8. nädal**: Praktilised projektid ja lõplik hindamine

### Osalise koormusega Õpe (16 nädalat)
- **1.-4. nädal**: Moodul 1 (Sissejuhatus)
- **5.-7. nädal**: Moodul 2 (Konfiguratsioon ja keskkonnad)
- **8.-10. nädal**: Moodul 3 (Juurutamine ja provisjonimine)
- **11.-12. nädal**: Moodul 4 (Enne juurutamist tehtav valideerimine)
- **13.-14. nädal**: Moodul 5 (Tõrkeotsing ja silumine)
- **15.-16. nädal**: Moodul 6 (Täiustatud teemad ja hindamine)

---

## Edusammude Jälgimise ja Hindamise Raamistik

### Peatüki Valmimise Kontrollnimekiri

Jälgi oma edenemist iga peatüki puhul nende mõõdetavate tulemustega:

#### 📚 Peatükk 1: Põhialused ja Kiire Algus
- [ ] **Paigaldus lõpetatud**: AZD installitud ja platvormil kinnitatud
- [ ] **Esimene juurutus**: Edukas todo-nodejs-mongo malli juurutus
- [ ] **Keskkonna seadistamine**: Esimeste keskkonnamuutujate seadistamine
- [ ] **Ressursside uurimine**: Juhtmestatud ressursid Azure Portaalis
- [ ] **Käsuvaldamine**: Mugavus põhiliste AZD käskudega

#### 🤖 Peatükk 2: Tehisintellekti esmane arendus  
- [ ] **AI malli juurutus**: Azure-search-openai-demo edukas juurutus
- [ ] **RAG rakendamine**: Dokumendindekseerimise ja taastamise seadistamine
- [ ] **Mudelite seadistus**: Mitme erinevate otstarvetega AI mudeli häälestamine
- [ ] **AI jälgimine**: Application Insights’i rakendamine AI töökoormatele
- [ ] **Jõudluse optimeerimine**: AI rakenduse soorituse häälestamine

#### ⚙️ Peatükk 3: Konfiguratsioon ja Autentimine
- [ ] **Mitmekesise keskkonna seadistus**: Arenduse, etapi ja tootmise keskkondade konfigureerimine
- [ ] **Turbe rakendus**: Halda identiteedi autentimise seadistamine
- [ ] **Salasõnade haldus**: Azure Key Vaulti integreerimine tundliku info jaoks
- [ ] **Parameetrite haldus**: Keskkonnaspetsiifiliste seadistuste loomine
- [ ] **Autentimise valdamine**: Turvaliste ligipääsu mustrite rakendamine

#### 🏗️ Peatükk 4: Infrastruktuur koodina ja Juurutamine
- [ ] **Kohandatud malli loomine**: Mitme teenuse rakenduse malli koostamine
- [ ] **Bicep oskus**: Modulaarsete ja korduvkasutatavate infrastruktuurikomponentide loomine
- [ ] **Juurutamise automatiseerimine**: Pre- ja post-juurutamise konksude rakendamine
- [ ] **Arhitektuuri kujundus**: Keeruka mikroteenuste arhitektuuri juurutamine
- [ ] **Malli optimeerimine**: Mallide optimeerimine jõudluse ja kulude jaoks

#### 🎯 Peatükk 5: Mitmeagendi tehisintellekti lahendused
- [ ] **Jaemüügi arhitektuuri ülevaade**: Tuvastati puuduvad rakenduse komponendid ning planeeriti nende rakendamine ja valideerimine
- [ ] **Agendi kohandamine**: Muudeti Kliendi ja Varude agentide käitumist
- [ ] **Arhitektuuri skaleerimine**: Rakendati koormuse tasakaalustamine ja automaatne skaleerimine
- [ ] **Tootmise jälgimine**: Seadistati põhjalik jälgimine ja teavitamine
- [ ] **Jõudluse häälestus**: Mitmeagendilise süsteemi jõudluse optimeerimine

#### 🔍 Peatükk 6: Enne juurutamist tehtav valideerimine ja planeerimine
- [ ] **Mahuanalüüs**: Rakenduste ressursinõuete analüüs
- [ ] **SKU optimeerimine**: Kuluefektiivsete teenusetasandite valimine
- [ ] **Valideerimise automatiseerimine**: Skriptide rakendamine enne juurutamist
- [ ] **Kulude planeerimine**: Juurutamiskulude hinnangute ja eelarvete loomine
- [ ] **Riskide hindamine**: Juurutamisriskide tuvastamine ja vähendamine

#### 🚨 Peatükk 7: Tõrkeotsing ja silumine
- [ ] **Diagnostikavõimed**: Edukas silumine sihipäraselt vigastatud juurutustel
- [ ] **Logianalüüs**: Azure Monitori ja Application Insights’i tõhus kasutamine
- [ ] **Jõudluse häälestus**: Aeglaste rakenduste optimeerimine
- [ ] **Taastamisprotseduurid**: Varundamise ja katastroofitaastamise rakendamine
- [ ] **Jälgimise seadistamine**: Proaktiivse jälgimise ja teavitamise loomine

#### 🏢 Peatükk 8: Tootmise ja ettevõtte mustrid
- [ ] **Ettevõtte turvalisus**: Põhjalike turbeskeemide rakendamine
- [ ] **Haldusraamistik**: Azure Policy ja ressursside halduse seadistamine
- [ ] **Täiustatud jälgimine**: Dashbordide ja automatiseeritud teavituste loomine
- [ ] **CI/CD integratsioon**: Automatiseeritud juurutustorude loomine
- [ ] **Vastavuse rakendus**: Ettevõtte nõuetele vastavuse täitmine

### Õppeajad ja Olulised Etapid

#### 1.-2. nädal: Põhialuste loomine
- **Oluline etapp**: Esimese AI rakenduse juurutamine AZD abil
- **Kontroll**: Töötav rakendus avaliku URL-iga
- **Oskused**: Põhilised AZD töövood ja AI teenuste integreerimine

#### 3.-4. nädal: Konfiguratsiooni omandamine
- **Oluline etapp**: Mitmekesise keskkonna juurutus turvalise autentimisega
- **Kontroll**: Sama rakendus arenduse/etapi/tootmise keskkonnas
- **Oskused**: Keskkondade haldamine ja turbe rakendamine

#### 5.-6. nädal: Infrastruktuuri asjatundlikkus
- **Oluline etapp**: Kohandatud mall keeruka mitme teenusega rakendusele
- **Kontroll**: Malli korduvkasutamine teise meeskonnaliikme poolt
- **Oskused**: Bicep oskus ja infrastruktuuri automatiseerimine

#### 7.-8. nädal: Täiustatud AI rakendus
- **Oluline etapp**: Tootmisvalmis mitmeagendiline AI lahendus
- **Kontroll**: Süsteem suudab hallata reaalse koormust jälgimisega
- **Oskused**: Mitmeagendiline orkestreerimine ja jõudluse optimeerimine

#### 9.-10. nädal: Tootmisvalmidus
- **Oluline etapp**: Ettevõtte tasemel juurutus täisvastavusega
- **Kontroll**: Läbib turvakontrolli ja kulude optimeerimise auditit
- **Oskused**: Haldus, jälgimine ja CI/CD integratsioon

### Hinnang ja Sertifitseerimine

#### Teadmiste Kontrollimise Meetodid
1. **Praktilised juurutused**: Töötavad rakendused iga peatüki jaoks
2. **Koodi ülevaated**: Malli ja konfiguratsiooni kvaliteedi hindamine
3. **Probleemilahendus**: Tõrkeotsingu stsenaariumid ja lahendused
4. **Võrdõppimine**: Selgitada kontseptsioone teistele õppijatele
5. **Kogukonna panus**: Jagada malle või parendusi

#### Professionaalse Arengu Tulemused
- **Portfoolio projektid**: Õppimisjuurutused ja arhitektuuri harjutused; tootmisvalmidus vajab eraldi rakendust ja ülevaatust
- **Tehnilised oskused**: Tööstusharu standard AZD ja AI juurutamise oskused
- **Probleemide lahendamise võimed**: Iseseisev tõrkeotsing ja optimeerimine
- **Kogukonna tunnustus**: Aktiivne osalus Azure arendajate kogukonnas
- **Karjääri edendamine**: Oskused, mida saab otseselt rakendada pilve- ja tehisintellekti rollides

#### Edu mõõdikud
- **Juurutamise õnnestumise määr**: >95% edukatest juurutamistest
- **Rikkeotsingu aeg**: <30 minutit tavapäraste probleemide korral
- **Tõhususe optimeerimine**: Näidatakse parendusi kulude ja jõudluse osas
- **Turvakontroll**: Dokumenteeritud kontrollmehhanismid ja järelejäänud lüngad teie organisatsiooni nõudmiste suhtes; kursuse lõpetamine ei taga vastavust
- **Teadmiste edasiandmine**: Võime juhendada teisi arendajaid

### Jätkuv õppimine ja kogukonna kaasamine

#### Ole kursis
- **Azure uuendused**: Jälgi Azure Developer CLI väljaannete märkmeid
- **Kogukonna üritused**: Osale Azure ja tehisintellekti arendajate üritustel
- **Dokumentatsioon**: Panusta kogukonna dokumentatsiooni ja näidete loomisesse
- **Tagasiside**: Anna tagasisidet kursuse sisu ja Azure teenuste kohta

#### Karjääri areng
- **Professionaalne võrgustik**: Loo ühendus Azure ja tehisintellekti ekspertidega
- **Ettekandevõimalused**: Esita oma õpitud teadmisi konverentsidel või kohtumistel
- **Avatud lähtekoodi panus**: Panusta AZD mallide ja tööriistade arendamisse
- **Mentorlus**: Juhenda teisi arendajaid nende AZD õppeteekonnal

---

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../README.md)
- **📖 Alusta õppimist**: [Peatükk 1: Alused ja kiire stardipakk](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Edusammude jälgimine**: Jälgi oma edenemist kogu 8-peatükilisest õppesüsteemist
- **🤝 Kogukond**: [Azure Discord](https://discord.gg/microsoft-azure) toe ja arutelu jaoks

**Õppimise edenemise jälgimine**: Kasuta seda struktureeritud juhendit, et omandada Azure Developer CLI praktilise ja samm-sammulise õppimise kaudu mõõdetavate tulemite ja professionaalsete arenguvõimalustega.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->