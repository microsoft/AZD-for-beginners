# Õppejuhend - Kõikehõlmavad õpieesmärgid

**Õpperaja navigeerimine**
- **📚 Kursuse avaleht**: [AZD algajatele](../README.md)
- **📖 Alusta õppimist**: [1. peatükk: Alused ja kiire alustamine](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Edusammude jälgimine**: [Kursuse lõpetamine](../README.md#-course-completion--certification)

## Sissejuhatus

See põhjalik õppejuhend pakub struktureeritud õpieesmärke, põhikontseptsioone, praktilisi harjutusi ja hindematerjale, et aidata sul valdab Azure Developer CLI-d (azd). Kasuta seda juhendit oma edusammude jälgimiseks ja veendumiseks, et oled käsitlenud kõiki olulisi teemasid.

## Õpieesmärgid

Selle õppejuhendi lõpetamisel:
- Valdad kõiki Azure Developer CLI põhialuseid ja edasijõudnuid kontseptsioone
- Arendad praktilisi oskusi Azure rakenduste juurutamisel ja haldamisel
- Saad kindlustunde vigade otsimisel ja juurutuste optimeerimisel
- Mõistad tootmisvalmis juurutuspraktikaid ning turvaküsimusi

## Õpitulemused

Pärast kõigi selle õppejuhendi osade läbimist oskad:
- Disainida, juurutada ja hallata täielikke rakendusarhitektuure azd abil
- Rakendada põhjalikku jälgimist, turvalisust ja kulude optimeerimist
- Iseseisvalt tõrkeotsingut keerukatel juurutustel teha
- Luua kohandatud malle ja panustada azd kogukonda

## 8-peatükiline õpistruktuur

### 1. peatükk: Alused ja kiire alustamine (1. nädal)  
**Kestus**: 30–45 minutit | **Raskusaste**: ⭐

#### Õpieesmärgid
- Mõista Azure Developer CLI põhimõisteid ja terminoloogiat
- Edukalt paigalda ja konfigureeri AZD oma arenduskeskkonnas
- Juurutamine esimest rakendust olemasoleva malliga
- Efektiivselt navigeerida AZD käsurealiideses

#### Olulised kontseptsioonid
- AZD projekti struktuur ja komponendid (azure.yaml, infra/, src/)
- Mallipõhised juurutusvood
- Keskkonnavalikute alused
- Ressursside ja tellimuste haldus

#### Praktilised harjutused
1. **Paigaldamise kontroll**: Paigalda AZD ja kontrolli `azd version` käsuga
2. **Esimene juurutamine**: Juuruta edukalt todo-nodejs-mongo mall
3. **Keskkonna seadistamine**: Määra esimesed keskkonnamuutujad
4. **Ressursside uurimine**: Sirvi Azure portaali juurutatud ressursse

#### Hinnanguküsimused
- Millised on AZD projekti põhisammud?
- Kuidas algatada uus projekt mallist?
- Mis vahe on `azd up` ja `azd deploy` käskudel?
- Kuidas hallata mitut keskkonda AZD-ga?

---

### 2. peatükk: AI-Eelne Arendus (2. nädal)  
**Kestus**: 1–2 tundi | **Raskusaste**: ⭐⭐

#### Õpieesmärgid
- Integreeri Microsoft Foundry teenused AZD töövoogudesse
- Juuruta ja konfigureeri tehisintellektil põhinevaid rakendusi
- Mõista RAG (Retrieval-Augmented Generation) rakendusmustreid
- Haldada tehisintellekti mudelite juurutust ja skaleerimist

#### Olulised kontseptsioonid
- Microsoft Foundry Models teenuse integreerimine ja API haldus
- AI otsingu konfiguratsioon ja vektoriindekseerimine
- Mudelite juurutusstrateegiad ja mahuprognoosimine
- AI rakenduste jälgimine ja jõudluse optimeerimine

#### Praktilised harjutused
1. **AI vestlusjuurutus**: Juuruta azure-search-openai-demo mall
2. **RAG rakendamine**: Konfigureeri dokumentide indekseerimine ja otsing
3. **Mudelite seadistus**: Seadista mitu AI mudelit erinevate vajadustega
4. **AI jälgimine**: Rakenda Application Insights AI koormuste jaoks

#### Hinnanguküsimused
- Kuidas seadistada Microsoft Foundry Models teenuseid AZD mallis?
- Millised on RAG arhitektuuri peamised komponendid?
- Kuidas hallata AI mudelite mahutavust ja skaleerimist?
- Millised jälgimismõõdikud on olulised AI rakenduste jaoks?

---

### 3. peatükk: Konfiguratsioon ja Autentimine (3. nädal)  
**Kestus**: 45–60 minutit | **Raskusaste**: ⭐⭐

#### Õpieesmärgid
- Valda keskkonna konfiguratsiooni ja haldusstrateegiaid
- Rakenda turvalisi autentimismustreid ja hallatud identiteeti
- Korralda ressursse õigete nimetamisreeglitega
- Konfigureeri mitmekeskkondseid juurutusi (dev, staging, prod)

#### Olulised kontseptsioonid
- Keskkonna hierarhia ja konfiguratsiooni prioriteedid
- Hallatud identiteet ja teenusepõhine autentimine
- Key Vault integratsioon saladuste halduseks
- Keskkonnaspetsiifiline parameetrite haldus

#### Praktilised harjutused
1. **Mitmekeskkonna seadistus**: Konfigureeri dev, staging ja prod keskkonnad
2. **Turvakonfiguratsioon**: Rakenda hallatud identiteedi autentimine
3. **Saladuste haldus**: Integreeri Azure Key Vault tundliku info jaoks
4. **Parameetrite haldus**: Loo keskkonnaspetsiifilised seadistused

#### Hinnanguküsimused
- Kuidas konfigureerida erinevaid keskkondi AZD-ga?
- Millised on hallatud identiteedi eelised teenusekontode ees?
- Kuidas turvaliselt hallata rakenduse saladusi?
- Milline on konfiguratsiooni hierarhia AZD-s?

---

### 4. peatükk: Infrastruktuur koodina & Juurutamine (4.–5. nädal)  
**Kestus**: 1–1,5 tundi | **Raskusaste**: ⭐⭐⭐

#### Õpieesmärgid
- Loo ja kohanda Bicep infrastruktuuri malle
- Rakenda keerukaid juurutusmustreid ja töövooge
- Mõista ressursside provisioneerimise strateegiaid
- Kujunda skaleeritavaid mitmeteenusega arhitektuure

- Juuruta konteineripõhised rakendused Azure Container Apps ja AZD abil

#### Olulised kontseptsioonid
- Bicep mallide struktuur ja parimad praktikad
- Ressursside sõltuvused ja juurutuse järjekord
- Parameetrite failid ja mallide moodulid
- Kohandatud konksud ja juurutuse automatiseerimine
- Konteinerirakenduste juurutusmustrid (kiire algus, tootmine, mikroteenused)

#### Praktilised harjutused
1. **Kohandatud malli loomine**: Ehita mitmeteenusega rakenduse mall
2. **Bicep valdamine**: Loo modulaarseid, taaskasutatavaid infrastruktuurikomponente
3. **Juurutuse automatiseerimine**: Rakenda pre-/post-juurutuse konksud
4. **Arhitektuuri disain**: Juuruta keerukas mikroteenuste arhitektuur
5. **Konteinerirakenduse juurutus**: Juuruta [Simple Flask API](../../../examples/container-app/simple-flask-api) ja [Microservices Architecture](../../../examples/container-app/microservices) näited AZD-ga

#### Hinnanguküsimused
- Kuidas luua kohandatud Bicep malle AZD jaoks?
- Millised on head tavad infrastruktuurikoodi korraldamisel?
- Kuidas käsitleda ressursside sõltuvusi mallides?
- Millised juurutusmustrid toetavad katkestusteta uuendusi?

---

### 5. peatükk: Mitme agendiga AI lahendused (6.–7. nädal)  
**Kestus**: 2–3 tundi | **Raskusaste**: ⭐⭐⭐⭐

#### Õpieesmärgid
- Kujunda ja rakenda mitme agendiga tehisintellekti arhitektuure
- Orkestreeri agentide koordineerimist ja suhtlust
- Juuruta tootmisvalmis AI lahendusi koos jälgimisega
- Mõista agentide spetsialiseerumist ja töövoogude mustreid
- Integreeri konteineripõhised mikroteenused mitme agendi lahendustesse

#### Olulised kontseptsioonid
- Mitme agendi arhitektuurimustrid ja disainiprintsiibid
- Agentide kommunikatsiooniprotokollid ja andmevoog
- Koormuse tasakaalustamine ja AI agendi skaleerimine
- Tootmise jälgimine mitme agenti süsteemides
- Teenus-teenuse suhtlus konteinerikeskkondades

#### Praktilised harjutused
1. **Jaemüügilahenduse juurutus**: Juuruta täielik mitme agendi jaemüügistsenaarium
2. **Agendi kohandamine**: Muuda kliendi ja laohalduri agendi käitumist
3. **Arhitektuuri skaleerimine**: Rakenda koormuse tasakaalustamist ja automaatset skaleerimist
4. **Tootmise jälgimine**: Sea sisse põhjalik jälgimine ja häireregistrid
5. **Mikroteenuste integratsioon**: Laienda [Microservices Architecture](../../../examples/container-app/microservices) näidet agentide töövoogude toetamiseks

#### Hinnanguküsimused
- Kuidas kujundada tõhusaid mitme agendi suhtlusmustreid?
- Millised on tähtsad kaalutlused AI agentide koormuse skaleerimisel?
- Kuidas jälgida ja tõrkeotsingut teha mitme agendi AI süsteemides?
- Millised tootmispraktikad tagavad AI agentide töökindluse?

---

### 6. peatükk: Enne juurutamist valideerimine ja planeerimine (8. nädal)  
**Kestus**: 1 tund | **Raskusaste**: ⭐⭐

#### Õpieesmärgid
- Teosta põhjalik mahuprognoos ja ressursside valideerimine
- Vali kulutõhusad Azure SKU-d
- Rakenda automatiseeritud eelkontrolli ja valideerimist
- Planeeri juurutused koos kulude optimeerimise strateegiatega

#### Olulised kontseptsioonid
- Azure ressursside kvoodid ja mahupiirangud
- SKU valiku kriteeriumid ja kulude optimeerimine
- Automatiseeritud valideerimiskäsud ja testimine
- Juurutuse planeerimine ja riskihindamine

#### Praktilised harjutused
1. **Mahuanalüüs**: Analüüsi rakenduste ressursside nõudeid
2. **SKU optimeerimine**: Võrdle ja vali kulutõhusad tasemed
3. **Valideerimise automatiseerimine**: Rakenda eeljooksu kontrolliskriptid
4. **Kulude planeerimine**: Koosta juurutuse kulude hinnang ja eelarve

#### Hinnanguküsimused
- Kuidas valideerida Azure mahutavust enne juurutust?
- Millised tegurid mõjutavad SKU valikut?
- Kuidas automatiseerida eelpiloodi valideerimist?
- Millised strateegiad aitavad kulusid optimeerida?

---

### 7. peatükk: Tõrkeotsing ja silumine (9. nädal)  
**Kestus**: 1–1,5 tundi | **Raskusaste**: ⭐⭐

#### Õpieesmärgid
- Arenda süsteemseid silumisstrateegiaid AZD juurutuste jaoks
- Lahenda levinud juurutus- ja konfiguratsiooniprobleeme
- Mõista AI-spetsiifilisi tõrkeid ja jõudlusküsimusi
- Rakenda jälgimist ja häireid ennetava probleemide avastamiseks

#### Olulised kontseptsioonid
- Diagnostika tehnikad ja logimise strateegiad
- Levinud rikete mustrid ja lahendused
- Jõudluse jälgimine ja optimeerimine
- Juhtumite reageerimine ja taasteprotseduurid

#### Praktilised harjutused
1. **Diagnostika oskused**: Harjuta sihilikult vigaseid juurutusi
2. **Logianalüüs**: Kasuta Azure Monitorit ja Application Insightsi tõhusalt
3. **Jõudluse häälestus**: Optimeeri aeglaselt töötavaid rakendusi
4. **Taasteprotseduurid**: Rakenda varundamist ja ärikatkestuse taaste

#### Hinnanguküsimused
- Millised on levinumad AZD juurutusvead?
- Kuidas tõrkeid autentimises ja õigustes lahendada?
- Millised jälgimisstrateegiad aitavad tootmise vigu ennetada?
- Kuidas optimeerida rakenduse jõudlust Azure’is?

---

### 8. peatükk: Tootmis- ja ettevõttetasandi mustrid (10.–11. nädal)  
**Kestus**: 2–3 tundi | **Raskusaste**: ⭐⭐⭐⭐

#### Õpieesmärgid
- Rakenda ettevõttetasandi juurutusstrateegiaid
- Kujunda turvamustrid ja vastavusraamistikud
- Loo jälgimise, valitsemise ja kulude halduse süsteeme
- Ehita skaleeritavaid CI/CD torustikke AZD integratsiooniga
- Kasuta parimaid tavasid tootmis konteinerirakenduste juurutamisel (turvalisus, jälgimine, kulud, CI/CD)

#### Olulised kontseptsioonid
- Ettevõtte turva- ja vastavusnõuded
- Valitsemisraamistikud ja poliitika rakendamine
- Täiustatud jälgimine ja kulude juhtimine
- CI/CD integratsioon ja automatiseeritud juurutustorustikud
- Sinine-roheline ja kanarindjuurutus konteinerkoormustele

#### Praktilised harjutused
1. **Ettevõtte turvalisus**: Rakenda põhjalikud turvamustrid
2. **Valitsemisraamistik**: Sea sisse Azure Policy ja ressursside haldus
3. **Täiustatud jälgimine**: Loo juhtpaneelid ja automaatsed häired
4. **CI/CD integratsioon**: Ehita automatiseeritud juurutustorustikud
5. **Tootmis konteinerirakendused**: Rakenda turvalisus, jälgimine ja kulude optimeerimine [Microservices Architecture](../../../examples/container-app/microservices) näitel

#### Hinnanguküsimused
- Kuidas rakendada ettevõtte turvalisust AZD juurutustes?
- Millised valitsemispraktikad tagavad vastavuse ja kulude kontrolli?
- Kuidas kujundada skaleerivat jälgimist tootmissüsteemidele?
- Millised CI/CD mustrid sobivad AZD töövoogudega kõige paremini?

#### Õpieesmärgid
- Mõista Azure Developer CLI põhitõdesid ja põhikontseptsioone
- Edukalt paigalda ja konfigureeri azd oma arenduskeskkonnas
- Lõpeta esimene juurutus olemasoleva malliga
- Navigeeri azd projekti struktuuris ja mõista peamisi komponente

#### Olulised kontseptsioonid
- Mallid, keskkonnad ja teenused
- azure.yaml konfiguratsiooni struktuur
- Põhilised azd käsud (init, up, down, deploy)
- Infrastruktuur koodina põhimõtted
- Azure autentimine ja autoriseerimine

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
# Käivita lihtne veebirakendus:
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
2. Mis on azure.yaml faili eesmärk?
3. Kuidas keskkonnad aitavad hallata erinevaid juurutuskohtasid?
4. Milliseid autentimismeetodeid saab azd-ga kasutada?
5. Mis juhtub, kui käivitad esimest korda `azd up`?

---

## Edusammude jälgimine ja hindamisraamistik  
```bash
# Loo ja seadista mitu keskkonda:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```
  
**Harjutus 2.2: Täpsem konfiguratsioon**  
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```
  
**Harjutus 2.3: Turvakonfiguratsioon**  
```bash
# Rakenda turvalisuse parimaid tavasid:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```
  
#### Enesehindamise küsimused
1. Kuidas azd haldab keskkonnamuutuja prioriteeti?
2. Mis on juurutuskõrvalkäsud ja millal neid kasutada?
3. Kuidas seada erinevaid SKUid erinevatele keskkondadele?
4. Millised on erinevate autentimismeetodite turvariskid?
5. Kuidas hallata saladusi ja tundlikku konfiguratsiooni?

### Moodul 3: Juurutamine ja Provisioneerimine (4. nädal)

#### Õpieesmärgid
- Valda juurutusvoogusid ja parimaid tavasid
- Mõista infrastruktuuri koodina Bicep mallidega
- Rakenda keerukaid mitmeteenusega arhitektuure
- Optimeeri juurutuste jõudlust ja töökindlust

#### Olulised kontseptsioonid
- Bicep mallide struktuur ja moodulid
- Ressursside sõltuvused ja järjekord
- Juurutusstrateegiad (sinine-roheline, samm-sammuline uuendus)
- Mitme regiooni juurutused
- Andmebaasi migreerimine ja andmehaldus

#### Praktilised harjutused

**Harjutus 3.1: Kohandatud infrastruktuur**  
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```
  
**Harjutus 3.2: Mitmeteenusega rakendus**  
```bash
# Paigaldage mikroteenuste arhitektuur:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```
  
**Harjutus 3.3: Andmebaasi integratsioon**  
```bash
# Rakenda andmebaasi juurutamise mustrid:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```
  
#### Enesehindamise küsimused
1. Millised eelised on Bicepi kasutamisel ARM mallide ees?
2. Kuidas hallata andmebaasi migreerimisi azd juurutustes?
3. Millised strateegiad toetavad katkestusteta juurutusi?
4. Kuidas hallata sõltuvusi teenuste vahel?
5. Millised kaalutlused on mitmeregiooniliste juurutuste puhul?

### Moodul 4: Enne juurutamist valideerimine (5. nädal)

#### Õpieesmärgid
- Rakenda põhjalikke eelpaigalduskontrolle
- Oska mahupõhist planeerimist ja ressursside valideerimist
- Mõista SKU valikut ja kulude optimeerimist
- Ehita automatiseeritud valideerimisliinid

#### Olulised mõisted, mida valdad
- Azure’i ressursside kvantiteedid ja piirangud
- SKU valiku kriteeriumid ja kulutused
- Automaatsete valideerimursskriptide ja tööriistade kasutamine
- Mahu planeerimise metoodikad
- Tulemuslikkuse testimine ja optimeerimine

#### Harjutused

**Harjutus 4.1: Mahu planeerimine**
```bash
# Rakenda mahutavuse valideerimine:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Harjutus 4.2: Eelkontrollid**
```powershell
# Koosta ulatuslik valideerimisvoog:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Harjutus 4.3: SKU optimeerimine**
```bash
# Optimeeri teenuse konfiguratsioone:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Enesehindamise küsimused
1. Millised tegurid peaksid mõjutama SKU valikut?
2. Kuidas valideerid Azure’i ressursside kättesaadavust enne juurutamist?
3. Millised on eelkontrolli süsteemi põhikomponendid?
4. Kuidas hinnata ja kontrollida juurutamise kulusid?
5. Milline jälgimine on oluline mahu planeerimiseks?

### Moodul 5: Tõrkeotsing ja silumine (6. nädal)

#### Õpieesmärgid
- Saa meistriks süsteemsete tõrkeotsingu metoodikate valdamisel
- Arenda oskusi keerukate juurutamisprobleemide silumisel
- Rakenda põhjalikku jälgimist ja teavitamist
- Koosta intsidentide reageerimise ja taastamise protseduurid

#### Olulised mõisted, mida valdad
- Levinud juurutamisvead ja nende mustrid
- Logianalüüsi ja seostamise tehnikad
- Tulemuslikkuse jälgimine ja optimeerimine
- Turvaintsidentide tuvastamine ja reageerimine
- Katastroofide taastamine ja ärijätkusuutlikkus

#### Harjutused

**Harjutus 5.1: Tõrkeotsingu stsenaariumid**
```bash
# Harjuta tavapäraste probleemide lahendamist:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Harjutus 5.2: Jälgimise rakendamine**
```bash
# Seadista põhjalik jälgimine:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Harjutus 5.3: Intsidenti reageerimine**
```bash
# Koostage intsidentidele reageerimise protseduurid:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Enesehindamise küsimused
1. Milline on süsteemne lähenemine azd juurutuste tõrkeotsingule?
2. Kuidas seostad logisid mitme teenuse ja ressursi vahel?
3. Millised jälgimisnäitajad on kriitilised probleemide varajaseks avastamiseks?
4. Kuidas rakendada tõhusaid katastroofide taastamise protseduure?
5. Millised on intsidentide reageerimise plaani põhikomponendid?

### Moodul 6: Täiustatud teemad ja parimad praktikad (7.-8. nädal)

#### Õpieesmärgid
- Rakenda ettevõttetaseme juurutusmustreid
- Saa meister CI/CD integratsiooni ja automatiseerimise valdkonnas
- Arenda kohandatud malle ja aita kogukonda
- Mõista täiustatud turva- ja vastavusnõudeid

#### Olulised mõisted, mida valdad
- CI/CD torujuhtme integreerimise mustrid
- Kohandatud mallide arendus ja levitamine
- Ettevõtte haldus ja vastavus
- Täiustatud võrgustik ja turvakonfiguratsioonid
- Tulemuslikkuse optimeerimine ja kulude juhtimine

#### Harjutused

**Harjutus 6.1: CI/CD integratsioon**
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**Harjutus 6.2: Kohandatud mallide arendus**
```bash
# Loo ja avalda kohandatud malle:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Harjutus 6.3: Ettevõttesisene rakendamine**
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
2. Millised on põhipunktid kohandatud mallide arendamisel?
3. Kuidas rakendada haldust ja vastavust azd juurutustes?
4. Millised on parimad praktikad ettevõtte suuruses juurutusteks?
5. Kuidas panustada efektiivselt azd kogukonda?

## Praktilised projektid

### Projekt 1: Isiklik portfoolio veebisait
**Raskusaste**: Algaja  
**Kestus**: 1-2 nädalat

Loo ja juuruta isiklik portfoolio veebisait, kasutades:
- Staatilist veebimajutust Azure Storage’il
- Kohandatud domeeni konfigureerimist
- CDN integratsiooni globaalse jõudluse jaoks
- Automatiseeritud juurutusliini

**Töö tulemused**:
- Töötav veebisait paigaldatud Azure’i keskkonda
- Kohandatud azd mall portfoolio juurutuseks
- Juurutuse protsessi dokumentatsioon
- Kulude analüüs ja optimeerimissoovitused

### Projekt 2: Ülesannete haldamise rakendus
**Raskusaste**: Kesktase  
**Kestus**: 2-3 nädalat

Loo täispinu ülesannete haldamise rakendus koos:
- React frontend, juurutatud App Service’is
- Node.js API backend autentimisega
- PostgreSQL andmebaas koos migratsioonidega
- Application Insights jälgimine

**Töö tulemused**:
- Täielik rakendus kasutaja autentimisega
- Andmebaasi skeem ja migratsiooniskriptid
- Jälgimisarmatuurlaudade ja teavituse reeglid
- Mitmekesiste keskkondade juurutuskonfiguratsioon

### Projekt 3: Mikroteenuste e-kaubanduse platvorm
**Raskusaste**: Täiustatud  
**Kestus**: 4-6 nädalat

Disaini ja rakenda mikroteenustepõhine e-kaubanduse platvorm:
- Mitmed API teenused (kataloog, tellimused, maksed, kasutajad)
- Sõnumijärjekorra integratsioon Service Bus’iga
- Redis vahemälu jõudluse optimeerimiseks
- Põhjalik logimine ja jälgimine

**Näidisprojekt**: Vaata [Microservices Architecture](../../../examples/container-app/microservices) tootmisvalmis malli ja juurutusjuhendit

**Töö tulemused**:
- Täielik mikroteenuste arhitektuur
- Teenustevahelised suhtlusmustrid
- Tulemuslikkuse testimine ja optimeerimine
- Tootmisvalmis turvalahenduste rakendus

## Hindamine ja sertifitseerimine

### Teadmiste kontrollid

Lõpeta need testid pärast iga moodulit:

**Moodul 1 test**: Põhimõisted ja paigaldus
- Valikvastustega küsimused põhiteemadel
- Praktilised paigaldus- ja konfiguratsioonitööd
- Lihtne juurutusharjutus

**Moodul 2 test**: Konfiguratsioon ja keskkonnad
- Keskkonna haldamise stsenaariumid
- Konfiguratsiooni tõrkeotsingu harjutused
- Turvakonfiguratsioonide rakendamine

**Moodul 3 test**: Juurutus ja varustamine
- Taristu kujundamise ülesanded
- Mitme teenuse juurutusstsenaariumid
- Tulemuslikkuse optimeerimise harjutused

**Moodul 4 test**: Eelpaigalduskontrollid
- Mahu planeerimise juhtumiuuringud
- Kuluoptimeerimise stsenaariumid
- Valideerimisliini rakendamine

**Moodul 5 test**: Tõrkeotsing ja silumine
- Probleemi diagnoosimise harjutused
- Jälgimise rakendamise ülesanded
- Intsidentidele reageerimise simulatsioonid

**Moodul 6 test**: Täiustatud teemad
- CI/CD torujuhtme kavandamine
- Kohandatud mallide arendus
- Ettevõtte arhitektuuri stsenaariumid

### Lõpp-projekt

Disaini ja rakenda täielik lahendus, mis demonstreerib kõigi mõistete valdamist:

**Nõuded**:
- Mitmetasandiline rakenduste arhitektuur
- Mitmekesised juurutuskeskkonnad
- Põhjalik jälgimine ja teavitamine
- Turva- ja vastavusnõuete täitmine
- Kulude optimeerimine ja tulemuslikkuse häälestus
- Terviklik dokumentatsioon ja tööjuhendid

**Hindamiskriteeriumid**:
- Tehnilise rakenduse kvaliteet
- Dokumentatsiooni täielikkus
- Turvalisus ja parimate praktikate järgimine
- Tulemuslikkus ja kulude juhtimine
- Tõrkeotsingu ja jälgimise efektiivsus

## Õppematerjalid ja viited

### Ametlik dokumentatsioon
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Kogukonna ressursid
- [AZD Template Gallery](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub Organization](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHub Repository](https://github.com/Azure/azure-dev)

### Harjutuskeskkonnad
- [Azure Free Account](https://azure.microsoft.com/free/)
- [Azure DevOps Free Tier](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### Täiendavad tööriistad
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Õppimise ajakava soovitused

### Täistööajaga õppimine (8 nädalat)
- **1.-2. nädal**: Moodulid 1-2 (Sissejuhatus, Konfiguratsioon)
- **3.-4. nädal**: Moodulid 3-4 (Juurutus, Eelpaigaldus)
- **5.-6. nädal**: Moodulid 5-6 (Tõrkeotsing, Täiustatud teemad)
- **7.-8. nädal**: Praktikaprojektid ja lõpphindamine

### Osalise tööajaga õppimine (16 nädalat)
- **1.-4. nädal**: Moodul 1 (Sissejuhatus)
- **5.-7. nädal**: Moodul 2 (Konfiguratsioon ja keskkonnad)
- **8.-10. nädal**: Moodul 3 (Juurutus ja varustamine)
- **11.-12. nädal**: Moodul 4 (Eelpaigalduskontrollid)
- **13.-14. nädal**: Moodul 5 (Tõrkeotsing ja silumine)
- **15.-16. nädal**: Moodul 6 (Täiustatud teemad ja hindamine)

---

## Progressi jälgimine ja hindamisskeem

### Peatüki lõpuleviimise kontrollnimekiri

Jälgi oma edenemist iga peatüki läbimisel nende mõõdetavate tulemustega:

#### 📚 Peatükk 1: Alused ja kiire stardipakett
- [ ] **Paigaldus lõpetatud**: AZD on installeeritud ja platvormil kontrollitud
- [ ] **Esimene juurutus**: Edukas todo-nodejs-mongo malli juurutus
- [ ] **Keskkonna seadistamine**: Esimeste keskkonnamuutujate konfigureerimine
- [ ] **Ressursside uurimine**: Juurutatud ressursside vaatamine Azure portaalis
- [ ] **Käsurea oskus**: AZD põhiliste käskude valdamine

#### 🤖 Peatükk 2: AI-esmane arendus  
- [ ] **AI malli juurutus**: azure-search-openai-demo edukas juurutus
- [ ] **RAG rakendus**: Dokumentide indekseerimise jaotsimine ja päring
- [ ] **Mudelite seadistamine**: Mitme AI mudeli seadistamine erinevateks eesmärkideks
- [ ] **AI jälgimine**: Application Insights rakendamine AI töökoormustele
- [ ] **Tulemuslikkuse optimeerimine**: AI rakenduse jõudluse häälestus

#### ⚙️ Peatükk 3: Konfiguratsioon ja autentimine
- [ ] **Mitmekesiste keskkondade seadistamine**: Dev-, staging- ja tootmiskeskkondade konfigureerimine
- [ ] **Turvalisuse rakendamine**: Haldatava identiteedi autentimise seadistamine
- [ ] **Salasõnade haldus**: Azure Key Vault’i integreerimine tundlike andmete jaoks
- [ ] **Parameetrite haldus**: Keskkonnapõhiste konfiguratsioonide loomine
- [ ] **Autentimise valdamine**: Turvaliste juurdepääsukordade rakendamine

#### 🏗️ Peatükk 4: Taristu koodina ja juurutamine
- [ ] **Kohandatud mallide loomine**: Mitme teenusega rakenduse malli loomine
- [ ] **Bicep valdamine**: Moodulite ja korduvkasutatavate taristu komponentide loomine
- [ ] **Juurutuse automatiseerimine**: Eel- ja järgjuurutuse konksude rakendamine
- [ ] **Arhitektuuri kujundus**: Keeruka mikroteenuste arhitektuuri juurutamine
- [ ] **Malli optimeerimine**: Mallide optimeerimine jõudluse ja kulude osas

#### 🎯 Peatükk 5: Multi-agent AI lahendused
- [ ] **Jaemüügi lahenduse juurutus**: Täielik multi-agenti jaemüügistsenaariumi paigaldus
- [ ] **Agentide kohandamine**: Kliendi- ja varudeagentide käitumise muutmine
- [ ] **Arhitektuuri skaleerimine**: Koormuse ja automaatse skaaleerimise rakendamine
- [ ] **Tootmise jälgimine**: Põhjaliku jälgimise ja teavituse seadistamine
- [ ] **Jõudluse häälestamine**: Multi-agent süsteemi jõudluse optimeerimine

#### 🔍 Peatükk 6: Eelpaigalduskontroll ja planeerimine
- [ ] **Mahuanalüüs**: Rakenduste ressursonõuete analüüs
- [ ] **SKU optimeerimine**: Kulutõhusate teenustasandite valimine
- [ ] **Valideerimise automatiseerimine**: Eelpaigalduskontrolliskriptide loomine
- [ ] **Kuluplaneerimine**: Juurutuskulude eelarvete koostamine
- [ ] **Riskide hindamine**: Juurutusriskide tuvastamine ja maandamine

#### 🚨 Peatükk 7: Tõrkeotsing ja silumine
- [ ] **Diagnostikaoskused**: Eesmärgipäraselt katki lastud juurutuste silumine
- [ ] **Logianalüüs**: Azure Monitori ja Application Insightsi efektiivne kasutamine
- [ ] **Jõudluse optimeerimine**: aeglaselt töötavate rakenduste kiirendamine
- [ ] **Taastamisprotseduurid**: Varundamise ja katastroofi taastamise rakendamine
- [ ] **Jälgimise seadistamine**: Proaktiivse jälgimise ja teavituse loomine

#### 🏢 Peatükk 8: Tootmis- ja ettevõttetaseme mustrid
- [ ] **Ettevõtte turvalisus**: Põhjalike turvamustrite rakendamine
- [ ] **Haldusraamistik**: Azure Policy ja ressursside halduse seadistamine
- [ ] **Täiustatud jälgimine**: Armatuurlaudade ja automatiseeritud teavituse loomine
- [ ] **CI/CD integratsioon**: Automatiseeritud juurutusliinide loomine
- [ ] **Vastavuse rakendamine**: Ettevõtte vastavusnõuete täitmine

### Õppe ajakava ja olulised punktid

#### 1.-2. nädal: Aluste loomine
- **Märkimisväärne asi**: Esimese AI rakenduse juurutus AZD abil
- **Kontrollpunkt**: Töötav rakendus avalikult ligipääsetav
- **Oskused**: Põhilised AZD töövood ja AI teenuste integreerimine

#### 3.-4. nädal: Konfiguratsiooni valdamine
- **Märkimisväärne asi**: Mitmekesise keskkonna juurutus turvalise autentimisega
- **Kontrollpunkt**: Sama rakendus arendus-, staging- ja tootmiskeskkonnas
- **Oskused**: Keskkonna haldus ja turvaeeskirjade rakendamine

#### 5.-6. nädal: Taristu spetsialist
- **Märkimisväärne asi**: Kohandatud mall keeruka mitme teenusega rakenduse jaoks
- **Kontrollpunkt**: Malli kasutab teine meeskonnaliige
- **Oskused**: Bicep ja infrastruktuuri automatiseerimine

#### 7.-8. nädal: Täiustatud AI rakendus
- **Märkimisväärne asi**: Tootmisvalmis multi-agent AI lahendus
- **Kontrollpunkt**: Süsteem suudab reaalset koormust jälgides hallata
- **Oskused**: Multi-agent orkestreerimine ja jõudluse optimeerimine

#### 9.-10. nädal: Tootmisvalmidus
- **Märkimisväärne asi**: Ettevõttetaseme juurutus täieliku vastavusega
- **Kontrollpunkt**: Läbib turvaauditi ja kulude optimeerimise kontrolli
- **Oskused**: Haldus, jälgimine ja CI/CD integreerimine

### Hindamine ja sertifitseerimine

#### Teadmiste valideerimise meetodid
1. **Praktilised juurutused**: Töötavad rakendused iga peatüki jaoks
2. **Koodi ülevaatused**: Mallide ja konfiguratsioonide kvaliteedikontroll
3. **Probleemide lahendamine**: Tõrkeotsingu stsenaariumid ja lahendused
4. **Võrdsete õpetamine**: Kontseptsioonide selgitamine teistele õppijatele
5. **Kogukonna panus**: Mallide või parenduste jagamine

#### Professionaalse arengu tulemused
- **Portfoolio projektid**: 8 tootmiskõlblikku juurutust  
- **Tehnilised oskused**: Töövalmis tööstusharu standarditele vastav AZD ja tehisintellekti juurutamise oskus  
- **Probleemide lahendamise võimed**: Iseseisev tõrkeotsing ja optimeerimine  
- **Kogukonna tunnustus**: Aktiivne osalemine Azure arendajate kogukonnas  
- **Karjääri edenemine**: Oskused, mis on otseselt rakendatavad pilve- ja AI-rollides  

#### Edu mõõdikud  
- **Juurutamise edukuse määr**: >95% edukad juurutused  
- **Tõrkeotsingu aeg**: <30 minutit levinud probleemide puhul  
- **Tulemuste optimeerimine**: Tõestatavad parendused kulus ja jõudluses  
- **Turvastandardite järgimine**: Kõik juurutused vastavad ettevõtte turvanõuetele  
- **Teadmiste ülekanne**: Võime juhendada teisi arendajaid  

### Jätkuv õppimine ja kogukonna kaasamine  

#### Ole kursis  
- **Azure uuendused**: Jälgi Azure Developer CLI versioonimärkmeid  
- **Kogukonna sündmused**: Osale Azure ja AI arendajate sündmustel  
- **Dokumentatsioon**: Panusta kogukonna dokumentatsiooni ja näidistesse  
- **Tagasiside ring**: Anna tagasisidet kursuse sisu ja Azure teenuste kohta  

#### Karjääri areng  
- **Professionaalne võrgustik**: Loo kontakte Azure ja AI ekspertidega  
- **Esinemisvõimalused**: Esitle oma teadmisi konverentsidel või üritustel  
- **Avatud lähtekoodiga panus**: Panusta AZD mallidesse ja tööriistadesse  
- **Mentorlus**: Juhenda teisi arendajaid nende AZD õppeteekonnal  

---

**Peatükkide navigeerimine:**  
- **📚 Kursuse avaleht**: [AZD algajatele](../README.md)  
- **📖 Alusta õppimist**: [1. peatükk: Alused ja kiire algus](../README.md#-chapter-1-foundation--quick-start)  
- **🎯 Edusamme jälgimine**: Jälgi oma edenemist põhjaliku 8-peatükilise õppesüsteemi kaudu  
- **🤝 Kogukond**: [Azure Discord](https://discord.gg/microsoft-azure) toetuseks ja aruteluks  

**Õppimise edenemise jälgimine:** Kasuta seda struktureeritud juhendit, et omandada Azure Developer CLI teadmised samm-sammult praktilise õppimise kaudu koos mõõdetavate tulemustega ja professionaalse arengu võimalustega.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastutusest loobumine**:  
See dokument on tõlgitud kasutades tehisintellekti tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi püüdleme täpsuse poole, palun pidage meeles, et automatiseeritud tõlked võivad sisaldada vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks lugeda usaldusväärseks allikaks. Olulise teabe puhul soovitatakse professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tingitud arusaamatuste ega valesti mõistmiste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->