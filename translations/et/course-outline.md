# AZD Algajatele: Kursuse Ülevaade ja Õppimisraamistik

## Kursuse Ülevaade

Valda Azure Developer CLI (azd) läbi struktureeritud peatükkide, mis on loodud järkjärguliseks õppimiseks. **Eriti keskendutakse AI rakenduste juurutamisele Microsoft Foundry integratsiooniga.**

### Miks see kursus on kaasaegsetele arendajatele oluline

Arendajad, kes juurutavad AI töökoormusi, vajavad tavaliselt juhiseid:
- Komplekssete mitme-teenusega AI arhitektuuride kohta
- Tootmise AI juurutamise parimate tavade kohta  
- Azure AI teenuste integreerimise ja seadistamise kohta
- AI töökoormuste kulude optimeerimise kohta
- AI-spetsiifiliste juurutamisprobleemide tõrkeotsingu kohta

### Peamised õpieesmärgid

Selle struktureeritud kursuse läbimisel:
- **Valda AZD põhialuseid**: Põhimõtted, paigaldus ja seadistamine
- **Juuruta AI rakendusi**: Kasuta AZD-d Microsoft Foundry teenustega
- **Rakenda infrastruktuur koodina**: Halda Azure ressursse Bicep mallide abil
- **Tee juurutuste tõrkeotsingut**: Lahenda levinud probleeme ja silu vigu
- **Optimeeri tootmiseks**: Turvalisus, skaleerimine, jälgimine ja kulude juhtimine
- **Loo mitme-agendi lahendusi**: Juuruta keerukaid AI arhitektuure

## 🎓 Töötuba Õppimiskogemus

### Paindlikud õppemoodulid
See kursus on loodud toetama nii **isesugavalt õppimist** kui ka **juhendatud töötubasid**, võimaldades õppijatel saada praktilisi kogemusi AZD-ga, omandades oskusi interaktiivsete harjutuste kaudu.

#### 🚀 Iseseisev õppimisrežiim
**Täiuslik individuaalsetele arendajatele ja pidevaks eneseharimiseks**

**Omadused:**
- **Veebibrauseripõhine liides**: MkDocs-põhine töötuba, mis on kättesaadav igast veebi brauserist
- **GitHub Codespaces integratsioon**: Ühe klõpsuga arenduskeskkond eelseadistatud tööriistadega  
- **Interaktiivne DevContainer keskkond**: Ei mingeid lokaalseid seadistusi – alusta kohe kodeerimist
- **Edu jälgimine**: Sisseehitatud kontrollpunktid ja valideerimisharjutused
- **Kogukonna tugi**: Ligipääs Azure Discord kanalitele küsimuste ja koostöö jaoks

**Õpistruktuur:**
- **Paindlik ajakava**: Lõpeta peatükid omas tempos päevade või nädalate jooksul
- **Kontrollpunktisüsteem**: Kontrolli õpinguid enne keerukate teemade juurde liikumist
- **Ressursside kogumik**: Ulatuslik dokumentatsioon, näited ja tõrkeotsingu juhised
- **Portfoolio loomine**: Ehita juurutatavaid projekte professionaalse portfoolio jaoks

**Alustamine (Iseseisev):**
```bash
# Option 1: GitHub Codespaces (Recommended)
# Navigate to the repository and click "Code" → "Create codespace on main"

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow setup instructions in workshop/README.md
```

#### 🏛️ Juhendatud töötubade sessioonid
**Ideaalne korporatiivseks koolituseks, bootcampideks ja haridusasutustele**

**Töötubade vormingu valikud:**

**📚 Akadeemiline kursuse integreerimine (8-12 nädalat)**
- **Ülikooli programmid**: Semester pikk kursus, nädalas 2-tunnised sessioonid
- **Bootcamp vorming**: Intensiivne 3-5 päevane programm, iga päev 6-8 tundi
- **Korporatiivne koolitus**: Iga kuu tiimi sessioonid praktilise projektiteostusega
- **Hindamisraamistik**: Hindeid tegevad ülesanded, kaaslaste ülevaated ja lõppprojektid

**🚀 Intensiivne töötuba (1-3 päeva)**
- **1. päev**: Alused + AI arendus (peatükid 1-2) - 6 tundi  
- **2. päev**: Seadistamine + infrastruktuur (peatükid 3-4) - 6 tundi  
- **3. päev**: Täiustatud mustrid + tootmine (peatükid 5-8) - 8 tundi
- **Järeltegevus**: Valikuline 2-nädalane mentorlus projektide viimiseks lõpule

**⚡ Juhtkonna ülevaade (4-6 tundi)**
- **Strateegiline ülevaade**: AZD väärtuspakkumine ja äriline mõju (1 tund)
- **Praktiline demo**: AI rakenduse juurutus täielikult (2 tundi)
- **Arhitektuuri ülevaade**: Ettevõtte mustrid ja valitsemine (1 tund)
- **Rakenduse planeerimine**: Organisatsiooni kasutuselevõtu strateegia (1-2 tundi)

#### 🛠️ Töötuba õppimismetoodika
**Avastamine → Juurutamine → Kohandamine praktiliste oskuste arendamiseks**

**Faasis 1: Avastamine (45 minutit)**
- **Mallide uurimine**: Hinda Microsoft Foundry malle ja teenuseid
- **Arhitektuuri analüüs**: Mõista mitme-agendi mustreid ja juurutamisstrateegiaid
- **Nõuete hindamine**: Tuvasta organisatsiooni vajadused ja piirangud
- **Keskkonna seadistamine**: Arenduskeskkonna ja Azure ressursside konfigureerimine

**Faasis 2: Juurutamine (2 tundi)**
- **Juhendatud rakendamine**: Samm-sammuline AI rakenduste juurutamine AZD-ga
- **Teenuse seadistamine**: Konfigureeri Azure AI teenuseid, lõpp-punkte ja autentimist
- **Turvaloendamine**: Rakenda ettevõtte turvalisuse mustrid ja ligipääsu kontrollid
- **Valideerimise testimine**: Kontrolli juurutusi ja tõrkeotsingu teostamine

**Faasis 3: Kohandamine (45 minutit)**
- **Rakenduse muutmine**: Kohanda malle spetsiifiliste juhtumite ja nõuete järgi
- **Tootmise optimeerimine**: Rakenda monitorimist, kulude juhamist ja skaleerimisstrateegiaid
- **Täiustatud mustrid**: Uuri mitme agenti koordineerimist ja keerukaid arhitektuure
- **Järgmised sammud**: Määra õppeteek jätkuvaks oskuse arendamiseks

#### 🎯 Töötuba õppimistulemused
**Mõõdetavad oskused, mis on arendatud praktilise harjutuse kaudu**

**Tehnilised pädevused:**
- **Juuruta tootmisvalmis AI rakendusi**: Edukas AI lahenduste juurutamine ja seadistamine
- **Infrastruktuur koodina valdamine**: Loo ja halda kohandatud Bicep malle
- **Mitme-agendi arhitektuur**: Rakenda koordineeritud AI agendi lahendusi
- **Tootmisküpsus**: Rakenda turvalisuse, jälgimise ja valitsemise mustreid
- **Tõrkeotsingu oskused**: Lahenda iseseisvalt juurutamise ja seadistamise probleeme

**Professionaalsed oskused:**
- **Projektijuhtimine**: Juhi tehnilisi meeskondi pilve juurutuse algatustes
- **Arhitektuuri kujundamine**: Kujunda skaleeritavaid ja kulutõhusaid Azure lahendusi
- **Teadmiste jagamine**: Koolita ja juhi kolleege AZD parimates tavades
- **Strateegiline planeerimine**: Mõjuta organisatsiooni pilve kasutuselevõtu strateegiaid

#### 📋 Töötuba ressursid ja materjalid
**Kõikehõlmav komplekt juhendajatele ja õppijatele**

**Juhendajale:**
- **Juhendaja Käsiraamat**: [Töötuba Ülevaade](workshop/README.md) - Sessiooni planeerimine ja läbiviimise juhised
- **Esitluse materjalid**: Esitlused, arhitektuuri diagrammid ja demo käsud
- **Hindamisvahendid**: Praktilised harjutused, teadmiste testid ja hindamisjuhised
- **Tehniline seadistus**: Keskkonna konfigureerimine, tõrkeotsingu juhendid ja varuplaanid

**Õppijale:**
- **Interaktiivne töötuba keskkond**: [Töötoa materjalid](workshop/README.md) - Brauseripõhine õppimisplatvorm
- **Samm-sammuline juhend**: [Juhendatud harjutused](../../workshop/docs/instructions) - Detailne teostuse läbivaatus  
- **Võtmedokumendid**: [AI Töötuba Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI fookusega süvaõpe
- **Kogukonna ressursid**: Azure Discord kanalid, GitHub arutelud ja ekspertide tugi

#### 🏢 Ettevõtte töökodade rakendamine
**Organisatsiooni juurutamise ja koolituse strateegiad**

**Korporatiivsed koolitusprogrammid:**
- **Arendajate sissejuhatus**: Uute töötajate orienteerumine AZD põhialustega (2-4 nädalat)
- **Meeskonna oskuste arendamine**: Kvartaalased töökojad olemasolevatele arendusmeeskondadele (1-2 päeva)
- **Arhitektuuri ülevaated**: Igakuised sessioonid vaneminseneridele ja arhitektidele (4 tundi)
- **Juhikoolitused**: Juhtkonna töökojad tehniliste otsustajate jaoks (pool päeva)

**Juurutamise tugi:**
- **Kohandatud töötuba disain**: Sisuloome vastavalt organisatsiooni vajadustele
- **Pilootprogrammi juhtimine**: Struktureeritud juurutus koos edumõõdikute ja tagasisidega  
- **Jätkuv mentorlus**: Järeltoetus pärast töötoad projektide elluviimiseks
- **Kogukonna loomine**: Sisesed Azure AI arendajate kogukonnad ja teadmiste jagamine

**Edu mõõdikud:**
- **Oskuste omandamine**: Eel- ja järeltestid tehniliste pädevuste kasvamise mõõtmiseks
- **Juurutuse edukus**: Osalejate protsent, kes juurutasid edukalt tootmisrakendusi
- **Tõhususe aeg**: Lühem sisseelamisaeg uutes Azure AI projektides
- **Teadmiste säilitamine**: Järeltestid 3-6 kuud pärast töötuba

## 8 peatüki õpistruktuur

### Peatükk 1: Alused ja kiire alustamine (30-45 minutit) 🌱
**Nõuded**: Azure tellimus, põhiteadmised käsureast  
**Keerukus**: ⭐

#### Mida õpid
- Azure Developer CLI põhialuste mõistmine
- AZD paigaldamine oma platvormile  
- Sinu esimene edukas juurutus
- Põhikonseptsioonid ja terminoloogia

#### Õppimise ressursid
- [AZD Põhitõed](docs/chapter-01-foundation/azd-basics.md) - Põhimõisted
- [Paigaldus ja seadistamine](docs/chapter-01-foundation/installation.md) - Platvormispetsiifilised juhendid
- [Sinu esimene projekt](docs/chapter-01-foundation/first-project.md) - Praktiline juhend
- [Käsurea kiirjuhend](resources/cheat-sheet.md) - Kiire viide

#### Praktiline tulemus
Edukas lihtsa veebirakenduse juurutamine Azure’is AZD abil

---

### Peatükk 2: AI-eelkohane arendus (1-2 tundi) 🤖
**Nõuded**: Peatükk 1 läbitud  
**Keerukus**: ⭐⭐

#### Mida õpid
- Microsoft Foundry integratsioon AZD-ga
- AI-põhiste rakenduste juurutamine
- AI teenuste seadistuste mõistmine
- RAG (Retrieval-Augmented Generation) mustrid

#### Õppimise ressursid
- [Microsoft Foundry integratsioon](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- [AI mudelite juurutamine](docs/chapter-02-ai-development/ai-model-deployment.md)
- [AI töötuba labor](docs/chapter-02-ai-development/ai-workshop-lab.md) - **UUS**: Ulatuslik 2-3 tunnine praktiline labor
- [Interaktiivne töötuba juhend](workshop/README.md) - **UUS**: Brauseripõhine töötuba MkDocs eelvaatega
- [Microsoft Foundry mallid](README.md#featured-microsoft-foundry-templates)
- [Töötuba juhised](../../workshop/docs/instructions) - **UUS**: Samm-sammult juhendatud harjutused

#### Praktiline tulemus
Juuruta ja seadista AI-põhine juturakendus koos RAG võimekusega

#### Töötuba õpitee (valikuline täiendus)
**UUS interaktiivne kogemus**: [Täielik töötoa juhend](workshop/README.md)
1. **Avastamine** (30 min): Mallide valik ja hindamine
2. **Juurutamine** (45 min): AI malli juurutamine ja valideerimine  
3. **Lammutamine** (30 min): Malli arhitektuuri ja komponentide mõistmine
4. **Seadistamine** (30 min): Kohanda sätteid ja parameetreid
5. **Kohandamine** (45 min): Muuda ja itereri, et see oleks sinu oma
6. **Allalaskmine** (15 min): Ressursside koristamine ja elutsükli mõistmine
7. **Kokkuvõte** (15 min): Järgmised sammud ja täiustatud õppeteed

---

### Peatükk 3: Seadistamine ja autentimine (45-60 minutit) ⚙️
**Nõuded**: Peatükk 1 läbitud  
**Keerukus**: ⭐⭐

#### Mida õpid
- Keskkonna seadistamine ja haldus
- Autentimise ja turvalisuse parimad tavad
- Ressursside nimetamine ja organiseerimine
- Mitme keskkonna juurutused

#### Õppimise ressursid
- [Seadistamise juhend](docs/chapter-03-configuration/configuration.md) - Keskkonna ülesseadmine
- [Autentimise ja turbe mustrid](docs/chapter-03-configuration/authsecurity.md) - Halduse identiteet ja Key Vault integratsioon
- Mitme keskkonna näited

#### Praktiline tulemus
Halda mitut keskkonda õige autentimise ja turvalisusega

---

### Peatükk 4: Infrastruktuur koodina ja juurutamine (1-1.5 tundi) 🏗️
**Nõuded**: Peatükid 1-3 läbitud  
**Keerukus**: ⭐⭐⭐

#### Mida õpid
- Täiustatud juurutusmustrid
- Infrastruktuur koodina Bicepiga
- Ressursside hankimise strateegiad
- Kohandatud mallide loomine

- Konteineripõhiste rakenduste juurutamine Azure Container Appsi ja AZD abil

#### Õppimise ressursid
- [Juurutamise juhend](docs/chapter-04-infrastructure/deployment-guide.md) - Täielikud töövood
- [Ressursside hankimine](docs/chapter-04-infrastructure/provisioning.md) - Ressursside haldus
- Konteinerite ja mikroteenuste näited
- [Konteinerirakenduste näited](examples/container-app/README.md) - Kiire alustamine, tootmine ja täiustatud juurutusmustrid

#### Praktiline tulemus
Juuruta keerukaid mitme-teenusega rakendusi, kasutades kohandatud infrastruktuuri malle

---

### Peatükk 5: Mitme-agendi AI lahendused (2-3 tundi) 🤖🤖
**Nõuded**: Peatükid 1-2 läbitud  
**Keerukus**: ⭐⭐⭐⭐

#### Mida õpid
- Mitme-agendi arhitektuurimustrid
- Agendi orkestreerimine ja koordinatsioon
- Tootmisküpsed AI juurutused
- Kliendi- ja laoagendi rakendused

- Konteineripõhiste mikroteenuste integreerimine agendi lahenduste osana

#### Õppimise ressursid
- [Jaemüügi mitme-agendi lahendus](examples/retail-scenario.md) - Arhitektuuri plaan, mitte täielik rakendus
- [ARM malli pakett](../../examples/retail-multiagent-arm-template) - Infrastruktuuri raamistik koos teostuse eeltingimustega
- Mitme-agendi koordineerimismustrid
- [Mikroteenuste arhitektuuri näide](../../examples/container-app/microservices) - Teenus-teenusele suhtlus, asünkroonne sõnumivahetus ja tootmisse juurutamine

#### Praktiline tulemus
Kujunda mitme-agendi AI lahendus ja määra rakenduse teostuse, valideerimise ja operatsiooni töö, mis on vajalikud peale infrastruktuuri hankimist

---

### Peatükk 6: Eeljuurutuse valideerimine ja planeerimine (1 tund) 🔍
**Nõuded**: Peatükk 4 läbitud  
**Keerukus**: ⭐⭐

#### Mida õpid
- Mahuplaanimine ja ressursside valideerimine
- SKU valiku strateegiad
- Eelkontrollid ja automatiseerimine
- Kulude optimeerimise planeerimine

#### Õppimise ressursid
- [Mahuplaani juhend](docs/chapter-06-pre-deployment/capacity-planning.md) - Ressursside valideerimine
- [SKU valik](docs/chapter-06-pre-deployment/sku-selection.md) - Kulutõhusad valikud
- [Eelkontrolli skriptid](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatiseeritud skriptid
- [Application Insights integratsioon](docs/chapter-06-pre-deployment/application-insights.md) - Jälgimine ja jälgitavus
- [Mitme-agendi koordineerimismustrid](docs/chapter-06-pre-deployment/coordination-patterns.md) - Agendi orkestreerimise strateegiad

#### Praktiline tulemus
Kontrolli ja optimeeri juurutusi enne nende käivitamist

---

### Peatükk 7: Tõrkeotsing ja silumine (1-1.5 tundi) 🔧
**Eeldused**: Ükskõik milline juurutamise peatükk lõpetatud  
**Kompleksus**: ⭐⭐

#### Mida õpid
- Süsteemsed silumisstrateegiad
- Levinud probleemid ja lahendused
- AI-spetsiifiline tõrkeotsing
- Jõudluse optimeerimine

#### Õppematerjalid
- [Levinud probleemid](docs/chapter-07-troubleshooting/common-issues.md) - KKK ja lahendused
- [Silumise juhend](docs/chapter-07-troubleshooting/debugging.md) - Samm-sammult strateegiad
- [AI-spetsiifiline tõrkeotsing](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI-teenuse probleemid

#### Praktiline tulemus
Iseseisev levinud juurutamisprobleemide diagnoosimine ja lahendamine

---

### Peatükk 8: Tootmise ja ettevõtte mustrid (2-3 tundi) 🏢
**Eeldused**: Peatükid 1-4 lõpetatud  
**Kompleksus**: ⭐⭐⭐⭐

#### Mida õpid
- Tootmisjuurutamise strateegiad
- Ettevõtte turvatihed
- Jälgimine ja kulude optimeerimine
- Laiendatavus ja juhtimine

- Parimad tavad tootmis-konteinerirakenduste juurutamiseks (turve, jälgimine, kulud, CI/CD)

#### Õppematerjalid
- [Tootmis-AI parimad tavad](docs/chapter-08-production/production-ai-practices.md) - Ettevõtte mustrid
- Mikroteenuste ja ettevõtte näited
- Jälgimise ja juhtimiskadude raamistikud
- [Mikroteenuste arhitektuuri näide](../../examples/container-app/microservices) - Sinine-roheline / kattemenetlus, hajutatud jälgimine ja kulude optimeerimine

#### Praktiline tulemus
Juuruta ettevõttele valmis rakendusi täisväärtusliku tootmiskõlblikkusega

---

## Õppimise kulg ja keerukus

### Osavuste järkjärguline loomine

- **🌱 Algajad**: Alusta peatükist 1 (Alus) → peatükk 2 (AI arendus)
- **🔧 Kesktasemel**: Peatükid 3-4 (Konfiguratsioon & infrastruktuur) → peatükk 6 (Kinnitus)
- **🚀 Täiustatud**: Peatükk 5 (Mitmeagendi lahendused) → peatükk 7 (Tõrkeotsing)
- **🏢 Ettevõte**: Täida kõik peatükid, fookus peatükil 8 (Tootmise mustrid)

- **Konteinerirakenduste rada**: Peatükid 4 (Konteineriseeritud juurutamine), 5 (Mikroteenuste integratsioon), 8 (Tootmise parimad tavad)

### Keerukuse indikaatorid

- **⭐ Algeline**: Üksikud kontseptsioonid, juhendatud õppetunnid, 30-60 minutit
- **⭐⭐ Kesktasemel**: Mitmed kontseptsioonid, praktiline harjutus, 1-2 tundi  
- **⭐⭐⭐ Täiustatud**: Keerukad arhitektuurid, kohandatud lahendused, 1-3 tundi
- **⭐⭐⭐⭐ Ekspert**: Tootmissüsteemid, ettevõtte mustrid, 2-4 tundi

### Paindlikud õppimisrajad

#### 🎯 AI arendaja kiirtee (4-6 tundi)
1. **Peatükk 1**: Alused & kiire algus (45 minutit)
2. **Peatükk 2**: AI-esimene arendus (2 tundi)  
3. **Peatükk 5**: Mitmeagendi AI lahendused (3 tundi)
4. **Peatükk 8**: Tootmise AI parimad tavad (1 tund)

#### 🛠️ Infrastruktuuri spetsialisti rada (5-7 tundi)
1. **Peatükk 1**: Alused & kiire algus (45 minutit)
2. **Peatükk 3**: Konfiguratsioon & autentimine (1 tund)
3. **Peatükk 4**: Infrastruktuur kui kood & juurutamine (1,5 tundi)
4. **Peatükk 6**: Eeljuurutuse kinnitus & planeerimine (1 tund)
5. **Peatükk 7**: Tõrkeotsing & silumine (1,5 tundi)
6. **Peatükk 8**: Tootmise ja ettevõtte mustrid (2 tundi)

#### 🎓 Täielik õpiteekond (8-12 tundi)
Kõigi 8 peatüki järjestikune täitmine koos praktilise harjutuse ja kinnitusega

## Kooli lõpetamise raamistik

### Teadmiste kinnitamine
- **Peatükkide kontrollpunktid**: Praktilised harjutused mõõdetavate tulemustega
- **Praktiline kinnitamine**: Juuruta toimivad lahendused igas peatükis
- **Edusammude jälgimine**: Visuaalsed indikaatorid ja lõpetamise märgised
- **Kogukonna kinnitus**: Jaga kogemusi Azure Discord kanalites

### Õpitulemuste hindamine

#### Peatükk 1-2 lõpetamine (Alused + AI)
- ✅ Juuruta lihtne veebirakendus AZD abil
- ✅ Juuruta AI-põhine vestlusrakendus RAG tehnoloogiaga
- ✅ Saiti AZD põhikontseptsioonid ja AI integratsiooni mõistmine

#### Peatükk 3-4 lõpetamine (Konfiguratsioon + infrastruktuur)  
- ✅ Haldab mitmekeskkondade juurutamisi
- ✅ Loo kohandatud Bicep infrastruktuuri mallid
- ✅ Rakenda turvalisi autentimisstiile

#### Peatükk 5-6 lõpetamine (Mitmeagent + kinnitus)
- ✅ Juuruta keerukas mitmeagendi AI lahendus
- ✅ Tee võimsuse planeerimist ja kulude optimeerimist
- ✅ Rakenda automaatsed eeljuurutuse kinnitused

#### Peatükk 7-8 lõpetamine (Tõrkeotsing + tootmine)
- ✅ Silu ja lahenda juurutamisprobleeme iseseisvalt  
- ✅ Rakenda ettevõtte tasemel jälgimist ja turvatihendeid
- ✅ Juuruta tootmisele valmis rakendusi koos juhtimismudeliga

### Sertifitseerimine ja tunnustamine
- **Kursuse lõpetamise märk**: Lõpeta kõik 8 peatükki koos praktilise kinnitusega
- **Kogukonna tunnustus**: Aktiivne osalus Microsoft Foundry Discord teenuses
- **Ametialane areng**: Tööstusharu asjakohased AZD ja AI juurutamise oskused
- **Karjääri edendamine**: Ettevõttele valmis pilvejuurutamise võimed

## 🎓 Ulatuslikud õpitulemused

### Algtase (Peatükid 1-2)
Pärast aluste peatükkide lõpetamist näitavad õppijad:

**Tehnilised võimed:**
- Juurutada lihtsaid veebirakendusi Azure’i kasutades AZD käske
- Konfigureerida ja juurutada AI-võimelisi vestlusrakendusi RAG võimekusega
- Mõista AZD põhikontseptsioone: mallid, keskkonnad, provisioning töövood
- Integreerida Microsoft Foundry teenuseid AZD juurutamistega
- Navigeerida Azure AI teenuste konfiguratsioonides ja API otspunktides

**Ametialased oskused:**
- Järgida struktureeritud juurutusprotsesse stabiilsete tulemusteni
- Tõrkeotsing põhijuhtudel logide ja dokumentatsiooni abil
- Suhelda tõhusalt pilvejuurutuse protsessidest
- Rakendada parimaid tavasid turvalise AI teenuse integratsiooniks

**Õppimise verifitseerimine:**
- ✅ Eduka juurutuse `todo-nodejs-mongo` malliga
- ✅ Juuruta ja konfigureeri `azure-search-openai-demo` koos RAG-iga
- ✅ Täida interaktiivsete töötoade harjutused (Avastusfaas)
- ✅ Osale Azure Discord kogukonna aruteludes

### Kesktase (Peatükid 3-4)
Pärast kesktaseme peatükkide lõpetamist näitavad õppijad:

**Tehnilised võimed:**
- Haldada mitmekeskkondade juurutusi (arendus, etapp, tootmine)
- Luua kohandatud Bicep malle infrastruktuuri kui koodi jaoks
- Rakendada turvalisi autentimisstiile hallatud identiteediga
- Juurutada keerukaid mitme-teenuse rakendusi kohandatud seadistustega
- Optimeerida ressursside provisioneerimise strateegiaid kulude ja jõudluse jaoks

**Ametialased oskused:**
- Kujundada laiendatavaid infrastruktuuri arhitektuure
- Rakendada pilvejuurutuse turvasoovitusi
- Dokumenteerida infrastruktuuri mustreid meeskonnatöö jaoks
- Hinnata ja valida sobivaid Azure teenuseid nõuetele vastamiseks

**Õppimise verifitseerimine:**
- ✅ Konfigureerida eraldi keskkonnad spetsiifiliste seadistustega
- ✅ Luua ja juurutada kohandatud Bicep mall mitme-teenuse rakenduse jaoks
- ✅ Rakendada hallatud identiteedi autentimist turvaliseks juurdepääsuks
- ✅ Täita konfiguratsiooni halduse harjutusi tõeliste stsenaariumitega

### Täiustatud tase (Peatükid 5-6)
Pärast täiustatud peatükkide lõpetamist näitavad õppijad:

**Tehnilised võimed:**
- Juurutada ja koordineerida mitmeagendi AI lahendusi koordineeritud töövoogudega
- Rakendada kliendi- ja laoinformatsiooni agendi arhitektuure jaekaubanduse stsenaariumides
- Teostada põhjalikku võimsuse planeerimist ja ressursside kinnitamist
- Läbi viia automatiseeritud eeljuurutuse kinnitus ja optimeerimine
- Kujundada kulutõhusaid SKU valikuid töökoormuse vajaduste põhjal

**Ametialased oskused:**
- Kujundada keerukaid AI lahendusi tootmiskeskkondade jaoks
- Juhtida tehnilisi arutelusid AI juurutusstrateegiatest
- Mentorida algajaid arendajaid AZD ja AI parimate praktikate alal
- Hinnata ja soovitada AI arhitektuurimustreid ärivajadustele

**Õppimise verifitseerimine:**
- ✅ Läbivaatada jaekaubanduse mitmeagendi plaan ja eristada juurutatud infrastruktuur puuduvast rakenduste implementeerimisest
- ✅ Demonstreerida agendi koordineerimist ja töövoogude korraldust
- ✅ Täita võimsuse planeerimise harjutusi reaalsete ressursside piirangutega
- ✅ Kinnitada juurutamise valmisolekut automatiseeritud eelkontrollide kaudu

### Eksperdi tase (Peatükid 7-8)
Pärast eksperdi taseme peatükkide lõpetamist näitavad õppijad:

**Tehnilised võimed:**
- Diagnostiseerida ja lahendada keerulisi juurutamisprobleeme iseseisvalt
- Rakendada ettevõtte taseme turvamustreid ja juhtimiraamistikke
- Kujundada põhjalikke jälgimis- ja häirestrateegiaid
- Optimeerida tootmise juurutusi skaleeritavuse, kulude ja jõudluse osas
- Luua CI/CD torujuhtmeid korraliku testimise ja kinnitusega

**Ametialased oskused:**
- Juhtida ettevõtte pilvmuudatusalgatusi
- Kujundada ja rakendada organisatsiooni juurutusstandardeid
- Koolitada ja mentordada arendajatiime täiustatud AZD praktikates
- Mõjutada tehnilisi otsuseid ettevõttes AI juurutuse valdkonnas

**Õppimise verifitseerimine:**
- ✅ Lahendada keerukaid mitme-teenuse juurutamise rikkeid
- ✅ Rakendada ettevõtte turvamustreid koos vastavuse nõuetega
- ✅ Kujundada ja juurutada tootmise jälgimine Application Insights abil
- ✅ Täita ettevõtte juhtimismudeli rakendamine

## 🎯 Kursuse lõpetamise sertifikaat

### Edusammude jälgimise raamistik
Jälgi oma õppe edenemist läbi struktureeritud kontrollpunktide:

- [ ] **Peatükk 1**: Alused & kiire algus ✅
- [ ] **Peatükk 2**: AI-esimene arendus ✅  
- [ ] **Peatükk 3**: Konfiguratsioon & autentimine ✅
- [ ] **Peatükk 4**: Infrastruktuur kui kood & juurutamine ✅
- [ ] **Peatükk 5**: Mitme-agendi AI lahendused ✅
- [ ] **Peatükk 6**: Eeljuurutuse kinnitus & planeerimine ✅
- [ ] **Peatükk 7**: Tõrkeotsing & silumine ✅
- [ ] **Peatükk 8**: Tootmise & ettevõtte mustrid ✅

### Kinnituse protsess
Pärast iga peatüki lõpetamist kinnita oma teadmisi läbi:

1. **Praktiline harjutus**: Juuruta toimivad lahendused igas peatükis
2. **Teadmiste hindamine**: Vaata üle KKK ja täida enesehindamised
3. **Kogukonna kaasamine**: Jaga kogemusi ja saa tagasisidet Azure Discordis
4. **Portfoolio arendus**: Dokumenteeri oma juurutused ja õppetunnid
5. **Võrdõiguslik tagasiside**: Tee koostööd teiste õppijatega keerukates stsenaariumites

### Kursuse lõpetamise eelised
Pärast kõigi peatükkide lõpetamist koos kinnitustega saavad lõpetajad:

**Tehniline pädevus:**
- **Tootmiskogemus**: Juurutanud reaalseid AI rakendusi Azure keskkondadesse
- **Ametialased oskused**: Ettevõtte tasemel juurutamine ja tõrkeotsing  
- **Arhitektuuriteadmised**: Mitmeagendi AI lahendused ja keerukad infrastruktuurimustrid
- **Tõrkeotsingu meisterlikkus**: Iseseisev probleemide lahendamine juurutamises ja konfiguratsioonis

**Ametialane areng:**
- **Tööstusharu tunnustus**: Tõendatud oskused nõudlikes AZD ja AI juurutuse valdkondades
- **Karjääri edendamine**: Kvalifikatsioon pilvearhitekti ja AI juurutamise spetsialistina
- **Kogukonna juhtimine**: Aktiivne liikmelisus Azure arendajate ja AI kogukondades
- **Jätkuv õppimine**: Alus Microsoft Foundry täiustatud spetsialiseerumiseks

**Portfoolio varad:**
- **Juurutatud lahendused**: Toimivad näited AI rakendustest ja infrastruktuurimustritest
- **Dokumentatsioon**: Ulatuslikud juurutusjuhendid ja tõrkeotsingu protseduurid  
- **Kogukonna panused**: Arutelud, näited ja parendused, mida jagatakse Azure kogukonnaga
- **Ametialane võrgustik**: Sidemed Azure ekspertide ja AI juurutuse praktikantidega

### Pärast kursust õpperaad
Lõpetajad on valmis täiendavaks spetsialiseerumiseks:
- **Microsoft Foundry ekspert**: Süva spetsialiseerumine AI mudelite juurutamises ja orkestreerimises
- **Pilvearhitektuuri juhtimine**: Ettevõtte suurusega juurutuse kavandamine ja juhtimine
- **Arendajate kogukonna juhtimine**: Panustamine Azure näidistesse ja kogukonnaprojektidesse
- **Ettevõtte koolitus**: AZD ja AI juurutamise oskuste õpetamine organisatsioonides

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->