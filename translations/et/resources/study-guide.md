<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee6549c72fe4271931326578e2379243",
  "translation_date": "2025-10-11T15:53:24+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "et"
}
-->
# Õppejuhend - Põhjalikud õpieesmärgid

**Õppeteekonna navigeerimine**
- **📚 Kursuse avaleht**: [AZD algajatele](../README.md)
- **📖 Alusta õppimist**: [1. peatükk: Alused ja kiirstart](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Edusammude jälgimine**: [Kursuse lõpetamine](../README.md#-course-completion--certification)

## Sissejuhatus

See põhjalik õppejuhend pakub struktureeritud õpieesmärke, võtmekontseptsioone, praktilisi harjutusi ja hindamismaterjale, et aidata sul omandada Azure Developer CLI (azd). Kasuta seda juhendit oma edusammude jälgimiseks ja veendu, et oled katnud kõik olulised teemad.

## Õpieesmärgid

Selle õppejuhendi läbimisega:
- Omandad kõik Azure Developer CLI põhi- ja edasijõudnud kontseptsioonid
- Arendad praktilisi oskusi Azure'i rakenduste juurutamisel ja haldamisel
- Saad kindlustunde juurutuste tõrkeotsingus ja optimeerimises
- Mõistad tootmisvalmis juurutamise praktikaid ja turvalisuse kaalutlusi

## Õpitulemused

Pärast kõigi selle õppejuhendi osade läbimist suudad:
- Kavandada, juurutada ja hallata terviklikke rakendusarhitektuure azd abil
- Rakendada põhjalikke jälgimis-, turvalisuse ja kulude optimeerimise strateegiaid
- Lahendada keerulisi juurutusprobleeme iseseisvalt
- Luua kohandatud malle ja panustada azd kogukonda

## 8-peatüki õpistruktuur

### 1. peatükk: Alused ja kiirstart (1. nädal)
**Kestus**: 30-45 minutit | **Raskusaste**: ⭐

#### Õpieesmärgid
- Mõista Azure Developer CLI põhikontseptsioone ja terminoloogiat
- Paigalda ja konfigureeri AZD oma arenduskeskkonnas
- Juuruta oma esimene rakendus olemasoleva malli abil
- Navigeeri AZD käsurealiideses tõhusalt

#### Võtmekontseptsioonid
- AZD projekti struktuur ja komponendid (azure.yaml, infra/, src/)
- Mallipõhised juurutustöövood
- Keskkonna konfiguratsiooni alused
- Ressursigruppide ja tellimuste haldamine

#### Praktilised harjutused
1. **Paigalduse kontrollimine**: Paigalda AZD ja kontrolli `azd version` käsuga
2. **Esimene juurutus**: Juuruta todo-nodejs-mongo mall edukalt
3. **Keskkonna seadistamine**: Konfigureeri oma esimesed keskkonnamuutujad
4. **Ressursside uurimine**: Navigeeri juurutatud ressursse Azure'i portaalis

#### Hindamisküsimused
- Millised on AZD projekti põhikomponendid?
- Kuidas algatada uus projekt malli abil?
- Mis vahe on `azd up` ja `azd deploy` käskudel?
- Kuidas hallata mitut keskkonda AZD abil?

---

### 2. peatükk: AI-põhine arendus (2. nädal)
**Kestus**: 1-2 tundi | **Raskusaste**: ⭐⭐

#### Õpieesmärgid
- Integreeri Azure AI Foundry teenused AZD töövoogudega
- Juuruta ja konfigureeri AI-põhised rakendused
- Mõista RAG (Retrieval-Augmented Generation) rakendusmustreid
- Halda AI mudelite juurutamist ja skaleerimist

#### Võtmekontseptsioonid
- Azure OpenAI teenuse integreerimine ja API haldamine
- AI otsingu konfiguratsioon ja vektorindekseerimine
- Mudelite juurutamise strateegiad ja võimsuse planeerimine
- AI rakenduste jälgimine ja jõudluse optimeerimine

#### Praktilised harjutused
1. **AI vestluse juurutamine**: Juuruta azure-search-openai-demo mall
2. **RAG rakendamine**: Konfigureeri dokumentide indekseerimine ja otsing
3. **Mudelikonfiguratsioon**: Seadista mitmeid AI mudeleid erinevateks eesmärkideks
4. **AI jälgimine**: Rakenda Application Insights AI töökoormuste jaoks

#### Hindamisküsimused
- Kuidas konfigureerida Azure OpenAI teenuseid AZD mallis?
- Millised on RAG arhitektuuri põhikomponendid?
- Kuidas hallata AI mudelite võimsust ja skaleerimist?
- Millised jälgimismõõdikud on olulised AI rakenduste jaoks?

---

### 3. peatükk: Konfiguratsioon ja autentimine (3. nädal)
**Kestus**: 45-60 minutit | **Raskusaste**: ⭐⭐

#### Õpieesmärgid
- Omandada keskkonna konfiguratsiooni ja haldamise strateegiad
- Rakendada turvalisi autentimismustreid ja hallatud identiteeti
- Organiseerida ressursse korrektsete nimetamisreeglitega
- Konfigureerida mitmekeskkonna juurutusi (arendus, testimine, tootmine)

#### Võtmekontseptsioonid
- Keskkonna hierarhia ja konfiguratsiooni eelisjärjekord
- Hallatud identiteet ja teenusepõhimõtte autentimine
- Key Vault integratsioon salajaste andmete haldamiseks
- Keskkonnaspetsiifiliste parameetrite haldamine

#### Praktilised harjutused
1. **Mitmekeskkonna seadistamine**: Konfigureeri arendus-, testimis- ja tootmiskeskkonnad
2. **Turvalisuse konfiguratsioon**: Rakenda hallatud identiteedi autentimine
3. **Saladuste haldamine**: Integreeri Azure Key Vault tundlike andmete jaoks
4. **Parameetrite haldamine**: Loo keskkonnaspetsiifilised konfiguratsioonid

#### Hindamisküsimused
- Kuidas konfigureerida erinevaid keskkondi AZD abil?
- Millised on hallatud identiteedi eelised teenusepõhimõtete ees?
- Kuidas turvaliselt hallata rakenduse saladusi?
- Mis on AZD konfiguratsiooni hierarhia?

---

### 4. peatükk: Infrastruktuur kui kood ja juurutamine (4.-5. nädal)
**Kestus**: 1-1,5 tundi | **Raskusaste**: ⭐⭐⭐

#### Õpieesmärgid
- Loo ja kohanda Bicep infrastruktuuri malle
- Rakenda edasijõudnud juurutusmustrid ja töövood
- Mõista ressursi ettevalmistamise strateegiaid
- Kavanda skaleeritavaid mitmeteenuse arhitektuure

#### Võtmekontseptsioonid
- Bicep mallide struktuur ja parimad tavad
- Ressursi sõltuvused ja juurutamise järjekord
- Parameetrifailid ja mallide modulaarne ülesehitus
- Kohandatud konksud ja juurutamise automatiseerimine

#### Praktilised harjutused
1. **Kohandatud malli loomine**: Loo mitmeteenuse rakenduse mall
2. **Bicep meisterlikkus**: Loo modulaarseid, taaskasutatavaid infrastruktuurikomponente
3. **Juurutamise automatiseerimine**: Rakenda eel-/järgjuurutamise konksud
4. **Arhitektuuri disain**: Juuruta keerukas mikroteenuste arhitektuur

#### Hindamisküsimused
- Kuidas luua kohandatud Bicep malle AZD jaoks?
- Millised on infrastruktuurikoodi organiseerimise parimad tavad?
- Kuidas käsitleda ressursi sõltuvusi mallides?
- Millised juurutusmustrid toetavad null-seisakuga uuendusi?

---

### 5. peatükk: Mitmeagendilised AI lahendused (6.-7. nädal)
**Kestus**: 2-3 tundi | **Raskusaste**: ⭐⭐⭐⭐

#### Õpieesmärgid
- Kavanda ja rakenda mitmeagendilisi AI arhitektuure
- Orkestreeri agentide koordineerimist ja suhtlust
- Juuruta tootmisvalmis AI lahendusi koos jälgimisega
- Mõista agentide spetsialiseerumist ja töövoo mustreid

#### Võtmekontseptsioonid
- Mitmeagendilised arhitektuurimustrid ja disainiprintsiibid
- Agentide suhtlusprotokollid ja andmevoog
- Koormuse tasakaalustamise ja skaleerimise strateegiad AI agentide jaoks
- Tootmise jälgimine mitmeagendiliste süsteemide jaoks

#### Praktilised harjutused
1. **Jaemüügilahenduse juurutamine**: Juuruta täielik mitmeagendiline jaemüügistsenaarium
2. **Agendi kohandamine**: Muuda kliendi- ja inventuuriagendi käitumist
3. **Arhitektuuri skaleerimine**: Rakenda koormuse tasakaalustamine ja automaatne skaleerimine
4. **Tootmise jälgimine**: Seadista põhjalik jälgimine ja hoiatused

#### Hindamisküsimused
- Kuidas kavandada tõhusad mitmeagendilised suhtlusmustrid?
- Millised on AI agentide töökoormuste skaleerimise võtmekaalutlused?
- Kuidas jälgida ja siluda mitmeagendilisi AI süsteeme?
- Millised tootmismustrid tagavad AI agentide töökindluse?

---

### 6. peatükk: Eeljuurutuse valideerimine ja planeerimine (8. nädal)
**Kestus**: 1 tund | **Raskusaste**: ⭐⭐

#### Õpieesmärgid
- Teosta põhjalik võimsuse planeerimine ja ressursside valideerimine
- Vali optimaalsed Azure SKU-d kulutõhususe tagamiseks
- Rakenda automatiseeritud eelkontrollid ja valideerimine
- Planeeri juurutusi kulude optimeerimise strateegiatega

#### Võtmekontseptsioonid
- Azure'i ressursikvoodid ja võimsuse piirangud
- SKU valikukriteeriumid ja kulude optimeerimine
- Automatiseeritud valideerimisskriptid ja testimine
- Juurutamise planeerimine ja riskide hindamine

#### Praktilised harjutused
1. **Võimsuse analüüs**: Analüüsi oma rakenduste ressursinõudeid
2. **SKU optimeerimine**: Võrdle ja vali kulutõhusad teenusetasemed
3. **Valideerimise automatiseerimine**: Rakenda eeljuurutuse kontrollskriptid
4. **Kulude planeerimine**: Loo juurutamise kuluhinnangud ja eelarved

#### Hindamisküsimused
- Kuidas valideerida Azure'i võimsust enne juurutamist?
- Millised tegurid mõjutavad SKU valiku otsuseid?
- Kuidas automatiseerida eeljuurutuse valideerimist?
- Millised strateegiad aitavad optimeerida juurutamise kulusid?

---

### 7. peatükk: Tõrkeotsing ja silumine (9. nädal)
**Kestus**: 1-1,5 tundi | **Raskusaste**: ⭐⭐

#### Õpieesmärgid
- Arenda süsteemseid silumislähenemisi AZD juurutuste jaoks
- Lahenda levinud juurutus- ja konfiguratsiooniprobleeme
- Silu AI-spetsiifilisi probleeme ja jõudlusküsimusi
- Rakenda jälgimist ja hoiatusi probleemide ennetavaks tuvastamiseks

#### Võtmekontseptsioonid
- Diagnostikatehnikad ja logistrateegiad
- Levinud tõrkepõhjused ja nende lahendused
- Jõudluse jälgimine ja optimeerimine
- Intsidentide lahendamise ja taastamise protseduurid

#### Praktilised harjutused
1. **Diagnostikaoskused**: Harjuta tahtlikult vigaste juurutustega
2. **Logianalüüs**: Kasuta Azure Monitori ja Application Insightsi tõhusalt
3. **Jõudluse häälestamine**: Optimeeri aeglaseid rakendusi
4. **Taastamisprotseduurid**: Rakenda varundus- ja katastroofitaastamine

#### Hindamisküsimused
- Millised on kõige levinumad AZD juurutustõrked?
- Kuidas siluda autentimis- ja õiguste probleeme?
- Millised jälgimisstrateegiad aitavad vältida tootmisprobleeme?
- Kuidas optimeerida rakenduse jõudlust Azure'is?

---

### 8. peatükk: Tootmise ja ettevõtte mustrid (10.-11. nädal)
**Kestus**: 2-3 tundi | **Raskusaste**: ⭐⭐⭐⭐

#### Õpieesmärgid
- Rakenda ettevõtte tasemel juurutusstrateegiaid
- Kavanda turvalisuse mustrid ja vastavusraamistikud
- Loo jälgimis-, haldus- ja kulude juhtimise süsteemid
- Loo skaleeritavad CI/CD torud AZD integratsiooniga

#### Võtmekontseptsioonid
- Ettevõtte turvalisuse ja vastavuse nõuded
- Haldusraamistikud ja poliitikate rakendamine
- Täiustatud jälgimine ja kulude juhtimine
- CI/CD integratsioon ja automatiseeritud juurutustorud

#### Praktilised harjutused
1. **Ettevõtte turvalisus**: Rakenda põhjalikud turvalisuse mustrid
2. **Haldusraamistik**: Seadista Azure Policy ja ressursihaldus
3. **Täiustatud jälgimine**: Loo juhtpaneelid ja automatiseeritud hoiatused
4. **CI/CD integratsioon**: Ehita automatiseeritud juurutustorud

#### Hindamisküsimused
- Kuidas rakendada ettevõtte turvalisust AZD juurutustes?
- Millised haldusmustrid tagavad vastavuse ja kulude kontrolli?
- Kuidas kavandada skaleeritavat jälgimist tootmissüsteemide jaoks?
- Millised CI/CD mustrid sobivad kõige paremini AZD töövoogudega?
3. Millised on lennueelse kontrollisüsteemi peamised komponendid?  
4. Kuidas hinnata ja kontrollida juurutuskulusid?  
5. Milline jälgimine on oluline mahutavuse planeerimiseks?

### Moodul 5: Tõrkeotsing ja silumine (6. nädal)

#### Õpieesmärgid  
- Omandada süstemaatilised tõrkeotsingu meetodid  
- Arendada oskusi keeruliste juurutusprobleemide silumiseks  
- Rakendada põhjalikku jälgimist ja häirete süsteeme  
- Luua intsidentide lahendamise ja taastamise protseduurid  

#### Olulised mõisted  
- Levinud juurutusvigade mustrid  
- Logide analüüsi ja korrelatsiooni tehnikad  
- Jõudluse jälgimine ja optimeerimine  
- Turvaintsidentide tuvastamine ja lahendamine  
- Katastroofide taastamine ja ärikontinuitet  

#### Harjutused  

**Harjutus 5.1: Tõrkeotsingu stsenaariumid**  
```bash
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```
  
**Harjutus 5.2: Jälgimise rakendamine**  
```bash
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```
  
**Harjutus 5.3: Intsidentide lahendamine**  
```bash
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```
  

#### Enesehindamise küsimused  
1. Milline on süstemaatiline lähenemine azd juurutuste tõrkeotsingule?  
2. Kuidas korreleerida logisid mitme teenuse ja ressursi vahel?  
3. Millised jälgimismõõdikud on kõige olulisemad probleemide varajaseks tuvastamiseks?  
4. Kuidas rakendada tõhusaid katastroofide taastamise protseduure?  
5. Millised on intsidentide lahendamise plaani peamised komponendid?  

### Moodul 6: Täiustatud teemad ja parimad praktikad (7.–8. nädal)

#### Õpieesmärgid  
- Rakendada ettevõtte tasemel juurutusmustreid  
- Omandada CI/CD integreerimise ja automatiseerimise oskused  
- Arendada kohandatud malle ja panustada kogukonda  
- Mõista täiustatud turva- ja vastavusnõudeid  

#### Olulised mõisted  
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
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```
  
**Harjutus 6.3: Ettevõtte rakendamine**  
```bash
# Implement enterprise-grade features:
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
**Kestus**: 1–2 nädalat  

Loo ja juuruta isiklik portfoolio veebisait, kasutades:  
- Staatilise veebisaidi majutust Azure Storage'is  
- Kohandatud domeeni konfiguratsiooni  
- CDN-i integreerimist globaalse jõudluse jaoks  
- Automatiseeritud juurutustorustikku  

**Tulemused**:  
- Töötav veebisait, mis on juurutatud Azure'is  
- Kohandatud azd mall portfoolio juurutuste jaoks  
- Juurutusprotsessi dokumentatsioon  
- Kulude analüüs ja optimeerimise soovitused  

### Projekt 2: Ülesannete haldamise rakendus  
**Keerukus**: Keskmine  
**Kestus**: 2–3 nädalat  

Loo täisfunktsionaalne ülesannete haldamise rakendus, mis sisaldab:  
- Reacti esiosa, mis on juurutatud App Service'i  
- Node.js API tagapool koos autentimisega  
- PostgreSQL andmebaas koos migratsioonidega  
- Application Insights jälgimine  

**Tulemused**:  
- Täielik rakendus koos kasutaja autentimisega  
- Andmebaasi skeem ja migratsiooniskriptid  
- Jälgimisdashboadid ja häirete reeglid  
- Mitme keskkonna juurutuskonfiguratsioon  

### Projekt 3: Mikroteenuste e-kaubanduse platvorm  
**Keerukus**: Täiustatud  
**Kestus**: 4–6 nädalat  

Disaini ja rakenda mikroteenustel põhinev e-kaubanduse platvorm, mis sisaldab:  
- Mitut API teenust (kataloog, tellimused, maksed, kasutajad)  
- Sõnumijärjekorra integreerimist Service Busiga  
- Redis vahemälu jõudluse optimeerimiseks  
- Põhjalikku logimist ja jälgimist  

**Tulemused**:  
- Täielik mikroteenuste arhitektuur  
- Teenustevahelise suhtluse mustrid  
- Jõudluse testimine ja optimeerimine  
- Tootmisvalmis turvalisuse rakendamine  

## Hindamine ja sertifitseerimine  

### Teadmiste kontroll  

Täida need hindamised pärast iga moodulit:  

**Mooduli 1 hindamine**: Põhimõisted ja paigaldamine  
- Valikvastustega küsimused põhikontseptsioonide kohta  
- Praktilised paigaldamise ja konfiguratsiooni ülesanded  
- Lihtne juurutusharjutus  

**Mooduli 2 hindamine**: Konfiguratsioon ja keskkonnad  
- Keskkonna haldamise stsenaariumid  
- Konfiguratsiooni tõrkeotsingu harjutused  
- Turvakonfiguratsiooni rakendamine  

**Mooduli 3 hindamine**: Juurutus ja ettevalmistamine  
- Infrastruktuuri disaini väljakutsed  
- Mitme teenuse juurutamise stsenaariumid  
- Jõudluse optimeerimise harjutused  

**Mooduli 4 hindamine**: Juurutuseelne valideerimine  
- Mahutavuse planeerimise juhtumiuuringud  
- Kulude optimeerimise stsenaariumid  
- Valideerimistorustiku rakendamine  

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
- Mitme juurutuskeskkonna kasutamine  
- Põhjalik jälgimine ja häired  
- Turvalisuse ja vastavuse rakendamine  
- Kulude optimeerimine ja jõudluse häälestamine  
- Täielik dokumentatsioon ja juhendid  

**Hindamiskriteeriumid**:  
- Tehnilise rakenduse kvaliteet  
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
- [Azure Developer CLI GitHubi hoidla](https://github.com/Azure/azure-dev)  

### Harjutuskeskkonnad  
- [Azure tasuta konto](https://azure.microsoft.com/free/)  
- [Azure DevOps tasuta tase](https://azure.microsoft.com/services/devops/)  
- [GitHub Actions](https://github.com/features/actions)  

### Täiendavad tööriistad  
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)  
- [Visual Studio Code](https://code.visualstudio.com/)  
- [Azure tööriistade laienduste pakett](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)  

## Õppeplaani soovitused  

### Täiskohaga õpe (8 nädalat)  
- **1.–2. nädal**: Moodulid 1–2 (Alustamine, Konfiguratsioon)  
- **3.–4. nädal**: Moodulid 3–4 (Juurutus, Juurutuseelne)  
- **5.–6. nädal**: Moodulid 5–6 (Tõrkeotsing, Täiustatud teemad)  
- **7.–8. nädal**: Praktilised projektid ja lõplik hindamine  

### Osalise ajaga õpe (16 nädalat)  
- **1.–4. nädal**: Moodul 1 (Alustamine)  
- **5.–7. nädal**: Moodul 2 (Konfiguratsioon ja keskkonnad)  
- **8.–10. nädal**: Moodul 3 (Juurutus ja ettevalmistamine)  
- **11.–12. nädal**: Moodul 4 (Juurutuseelne valideerimine)  
- **13.–14. nädal**: Moodul 5 (Tõrkeotsing ja silumine)  
- **15.–16. nädal**: Moodul 6 (Täiustatud teemad ja hindamine)  

---

## Edusammude jälgimine ja hindamisraamistik  

### Peatüki lõpetamise kontrollnimekiri  

Jälgi oma edusamme iga peatüki kaudu nende mõõdetavate tulemuste abil:  

#### 📚 Peatükk 1: Alused ja kiire alustamine  
- [ ] **Paigaldamine lõpetatud**: AZD paigaldatud ja platvormil kontrollitud  
- [ ] **Esimene juurutus**: Edukalt juurutatud todo-nodejs-mongo mall  
- [ ] **Keskkonna seadistamine**: Esimeste keskkonnamuutujate konfigureerimine  
- [ ] **Ressursside navigeerimine**: Azure'i portaalis juurutatud ressursside uurimine  
- [ ] **Käskude valdamine**: Mugavus AZD põhiliste käskudega  

#### 🤖 Peatükk 2: AI-põhine arendus  
- [ ] **AI malli juurutus**: Edukalt juurutatud azure-search-openai-demo  
- [ ] **RAG rakendamine**: Dokumentide indekseerimise ja otsingu seadistamine  
- [ ] **Mudelite konfiguratsioon**: Mitme AI mudeli seadistamine erinevateks eesmärkideks  
- [ ] **AI jälgimine**: Application Insights rakendamine AI töökoormuste jaoks  
- [ ] **Jõudluse optimeerimine**: AI rakenduse jõudluse häälestamine  

#### ⚙️ Peatükk 3: Konfiguratsioon ja autentimine  
- [ ] **Mitme keskkonna seadistamine**: Dev, staging ja prod keskkondade konfigureerimine  
- [ ] **Turvalisuse rakendamine**: Hallatud identiteedi autentimise seadistamine  
- [ ] **Saladuste haldamine**: Azure Key Vaulti integreerimine tundlike andmete jaoks  
- [ ] **Parameetrite haldamine**: Keskkonnaspetsiifiliste konfiguratsioonide loomine  
- [ ] **Autentimise valdamine**: Turvaliste juurdepääsumustrite rakendamine  

#### 🏗️ Peatükk 4: Infrastruktuur koodina ja juurutus  
- [ ] **Kohandatud malli loomine**: Mitme teenuse rakenduse malli loomine  
- [ ] **Bicep valdamine**: Modulaarsete ja taaskasutatavate infrastruktuurikomponentide loomine  
- [ ] **Juurutuse automatiseerimine**: Eel-/järgjuurutuse konksude rakendamine  
- [ ] **Arhitektuuri disain**: Keeruka mikroteenuste arhitektuuri juurutamine  
- [ ] **Malli optimeerimine**: Mallide optimeerimine jõudluse ja kulude jaoks  

#### 🎯 Peatükk 5: Mitme agendi AI lahendused  
- [ ] **Jaemüügi lahenduse juurutus**: Täieliku mitme agendi jaemüügi stsenaariumi juurutamine  
- [ ] **Agentide kohandamine**: Kliendi ja inventari agentide käitumise muutmine  
- [ ] **Arhitektuuri skaleerimine**: Koormuse tasakaalustamise ja automaatse skaleerimise rakendamine  
- [ ] **Tootmise jälgimine**: Põhjaliku jälgimise ja häirete seadistamine  
- [ ] **Jõudluse häälestamine**: Mitme agendi süsteemi jõudluse optimeerimine  

#### 🔍 Peatükk 6: Juurutuseelne valideerimine ja planeerimine  
- [ ] **Mahutavuse analüüs**: Rakenduste ressursinõuete analüüsimine  
- [ ] **SKU optimeerimine**: Kulutõhusate teenustasandite valimine  
- [ ] **Valideerimise automatiseerimine**: Juurutuseelsete kontrollskriptide rakendamine  
- [ ] **Kulude planeerimine**: Juurutuskulude hinnangute ja eelarvete loomine  
- [ ] **Riskianalüüs**: Juurutusriskide tuvastamine ja leevendamine  

#### 🚨 Peatükk 7: Tõrkeotsing ja silumine  
- [ ] **Diagnostika oskused**: Edukalt silutud tahtlikult katki tehtud juurutused  
- [ ] **Logide analüüs**: Azure Monitori ja Application Insightsi tõhus kasutamine  
- [ ] **Jõudluse häälestamine**: Aeglaselt töötavate rakenduste optimeerimine  
- [ ] **Taastamisprotseduurid**: Varundamise ja katastroofide taastamise rakendamine  
- [ ] **Jälgimise seadistamine**: Proaktiivse jälgimise ja häirete loomine  

#### 🏢 Peatükk 8: Tootmine ja ettevõtte mustrid  
- [ ] **Ettevõtte turvalisus**: Põhjalike turvamustrite rakendamine  
- [ ] **Juhtimisraamistik**: Azure Policy ja ressursside haldamise seadistamine  
- [ ] **Täiustatud jälgimine**: Dashboadide ja automatiseeritud häirete loomine  
- [ ] **CI/CD integreerimine**: Automatiseeritud juurutustorustike loomine  
- [ ] **Vastavuse rakendamine**: Ettevõtte vastavusnõuete täitmine  

### Õppimise ajakava ja verstapostid  

#### 1.–2. nädal: Aluste loomine  
- **Verstapost**: Esimese AI rakenduse juurutamine AZD abil  
- **Valideerimine**: Töötav rakendus, mis on avalikult kättesaadav URL-i kaudu  
- **Oskused**: Põhilised AZD töövood ja AI teenuste integreerimine  

#### 3.–4. nädal: Konfiguratsiooni valdamine  
- **Verstapost**: Mitme keskkonna juurutus turvalise autentimisega  
- **Valideerimine**: Sama rakendus juurutatud dev/staging/prod keskkondadesse  
- **Oskused**: Keskkonna haldamine ja turvalisuse rakendamine  

#### 5.–6. nädal: Infrastruktuuri ekspertiis  
- **Verstapost**: Kohandatud mall keeruka mitme teenuse rakenduse jaoks  
- **Valideerimine**: Taaskasutatav mall, mille juurutab teine meeskonnaliige  
- **Oskused**: Bicep valdamine ja infrastruktuuri automatiseerimine  

#### 7.–8. nädal: Täiustatud AI rakendamine  
- **Verstapost**: Tootmisvalmis mitme agendi AI lahendus  
- **Valideerimine**: Süsteem, mis suudab käsitleda reaalmaailma koormust jälgimisega  
- **Oskused**: Mitme agendi orkestreerimine ja jõudl
- **Tagasiside tsükkel**: Anna tagasisidet kursuse sisu ja Azure'i teenuste kohta

#### Karjääriarendus
- **Professionaalne võrgustik**: Loo kontakte Azure'i ja AI ekspertidega
- **Esinemisvõimalused**: Jaga oma õpitut konverentsidel või kohtumistel
- **Avatud lähtekoodi panus**: Panusta AZD mallidesse ja tööriistadesse
- **Mentorlus**: Juhenda teisi arendajaid nende AZD õppe teekonnal

---

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../README.md)
- **📖 Alusta õppimist**: [1. peatükk: Alused ja kiirstart](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Edusammude jälgimine**: Jälgi oma arengut tervikliku 8-peatüki õppesüsteemi kaudu
- **🤝 Kogukond**: [Azure Discord](https://discord.gg/microsoft-azure) toetuseks ja aruteluks

**Õppe edenemise jälgimine**: Kasuta seda struktureeritud juhendit, et omandada Azure Developer CLI praktilise ja järkjärgulise õppimise kaudu, saavutades mõõdetavaid tulemusi ja karjäärialaseid eeliseid.

---

**Lahtiütlus**:  
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame tagada täpsust, palume arvestada, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Algne dokument selle algses keeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitame kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste või valesti tõlgenduste eest.