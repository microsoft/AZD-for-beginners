# AZD Algajatele: Kursuse ülevaade ja õpiraamistik

## Kursuse ülevaade

Õpi Azure Developer CLI (azd) valdamist struktureeritud peatükkide kaudu, mis on loodud järkjärguliseks õppimiseks. **Eriti rõhku pannakse tehisintellekti rakenduste juurutamisele Microsoft Foundry integratsiooniga.**

### Miks see kursus on tänapäeva arendajatele hädavajalik

Arendajad, kes juurutavad tehisintellekti töökoormusi, vajavad tihti juhiseid järgmises osas:
- Komplekssete mitme teenusega tehisintellekti arhitektuuride loomine
- Tootmise tehisintellekti juurutamise parimad tavad  
- Azure AI teenuste integratsioon ja seadistamine
- Kulude optimeerimine AI töökoormuste jaoks
- Tehisintellektile omaste juurutamisprobleemide tõrkeotsing

### Põhilised õpieesmärgid

Selle struktureeritud kursuse läbimisel õpid sa:
- **Hallata AZD põhialuseid**: Põhikonseptsioonid, paigaldus ja seadistamine
- **Juurutada tehisintellekti rakendusi**: Kasutades AZD-d Microsoft Foundry teenustega
- **Rakendada infrastruktuuri koodina**: Azure ressursside haldamine Bicep mallidega
- **Tõrkeotsing juurutamisel**: Lahendada levinud probleeme ja siluda tõrkeid
- **Optimeerida tootmiseks**: Turvalisus, skaleerimine, jälgimine ja kulude juhtimine
- **Luua mitme-agendi lahendusi**: Juurutada keerukaid tehisintellekti arhitektuure

## 🎓 Töötuba ja õppimiskogemus

### Paindlikud õppimisvõimalused
See kursus on loodud toetama nii **iseõppimist iseseisvalt** kui ka **juhendatud töötubade sessioone**, võimaldades õppijatel saada praktilist kogemust AZD-ga interaktiivsete harjutuste kaudu.

#### 🚀 Iseõppimise režiim
**Ideaalne individuaalsetele arendajatele ja pidevaks enesetäiendamiseks**

**Omadused:**
- **Veebipõhine liides**: Täielikult MkDocs-põhine töötuba, mis on ligipääsetav mis tahes veebibrauseris
- **GitHub Codespaces integratsioon**: Ühe klõpsuga arenduskeskkond eelseadistatud tööriistadega
- **Interaktiivne DevContainer keskkond**: Ei ole vaja kohalikku seadistust – alusta kohe koodikirjutamist
- **Jõudluse jälgimine**: Sisseehitatud kontrollpunktid ja valideerimisharjutused
- **Kogukonna tugi**: Juurdepääs Azure Discord kanalitele küsimuste ja koostöö jaoks

**Õppimise struktuur:**
- **Paindlik ajakava**: Täida peatükid omas tempos päevade või nädalate jooksul
- **Kontrollpunktide süsteem**: Õppimise valideerimine enne keerukamate teemade juurde liikumist
- **Ressursside kogu**: Ulatuslik dokumentatsioon, näited ja tõrkeotsingu juhendid
- **Portfoolio loomine**: Ehita juurutatavaid projekte professionaalseks portfoolioks

**Alustamine (iseõppimine):**
```bash
# Option 1: GitHub Codespaces (Recommended)
# Navigate to the repository and click "Code" → "Create codespace on main"

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow setup instructions in workshop/README.md
```

#### 🏛️ Juhendatud töötubade sessioonid
**Sobib ideaalselt ettevõtte koolituseks, bootcampideks ja haridusasutustele**

**Töötuba formaadi võimalused:**

**📚 Akadeemiline kursuse integreerimine (8-12 nädalat)**
- **Ülikooli programmid**: Semestri pikkune kursus nädalaste 2-tunniste sessioonidega
- **Bootcamp formaat**: Intensiivne 3-5 päevane programm iga päev 6-8 tunniste sessioonidega
- **Ettevõtte koolitus**: Igakuised meeskonna sessioonid praktilise projektiteostusega
- **Hindamissüsteem**: Hinded ülesanded, kaasõpilaste ülevaated ja lõppprojektid

**🚀 Intensiivne töötuba (1-3 päeva)**
- **1. päev**: Põhitõed + AI arendus (peatükid 1-2) - 6 tundi
- **2. päev**: Seadistamine + infrastruktuur (peatükid 3-4) - 6 tundi  
- **3. päev**: Täiustatud mustrid + tootmine (peatükid 5-8) - 8 tundi
- **Järeltegevus**: Valikuline 2-nädalane mentorlus projekti lõpetamiseks

**⚡ Juhtkonna ülevaade (4-6 tundi)**
- **Strateegiline ülevaade**: AZD väärtuspakkumine ja äriline mõju (1 tund)
- **Praktiline demo**: Tehisintellekti rakenduse lõplik juurutamine (2 tundi)  
- **Arhitektuuri ülevaade**: Ettevõtte mustrid ja juhtimine (1 tund)
- **Rakenduse planeerimine**: Organisatsiooni juurutamisstrateegia (1-2 tundi)

#### 🛠️ Töötuba õpimeetodid
**Avastus → Juurutamine → Kohandamine praktiliste oskuste arendamiseks**

**1. etapp: avastus (45 minutit)**
- **Mallide uurimine**: Microsoft Foundry mallide ja teenuste hindamine
- **Arhitektuuri analüüs**: Mõista mitme-agendi mustreid ja juurutamisstrateegiaid
- **Nõuete hindamine**: Tuvasta organisatsiooni vajadused ja piirangud
- **Keskkonna seadistamine**: Arenduskeskkonna ja Azure ressursside konfigureerimine

**2. etapp: juurutamine (2 tundi)**
- **Juhendatud rakendus**: Samm-sammuline tehisintellekti rakenduste juurutamine AZD-ga
- **Teenu seadistamine**: Azure AI teenuste, lõpp-punktide ja autentimise seadistamine
- **Turvalisuse rakendamine**: Ettevõtte turbe mustrite ja ligipääsu kontrollide rakendamine
- **Kinnitus- testimine**: Juurutuste valideerimine ja levinud probleemide tõrkeotsing

**3. etapp: kohandamine (45 minutit)**
- **Rakenduse muutmine**: Mallide kohandamine konkreetseteks kasutusjuhtudeks ja nõueteks
- **Tootmise optimeerimine**: Jälgimise, kulujuhtimise ja skaleerimisstrateegiate rakendamine
- **Täiustatud mustrid**: Uuri mitme-agendi koordineerimist ja keerukaid arhitektuure
- **Edasised sammud**: Määratle õpitee oskuste edasiseks arendamiseks

#### 🎯 Töötuba õpitulemused
**Mõõdetavad oskused, mis on arendatud praktilise harjutamise kaudu**

**Tehnilised pädevused:**
- **Juurutada tootmise AI-rakendusi**: Edukalt juurutada ja seadistada AI-põhiseid lahendusi
- **Infrastruktuuri kui koodi meistriklass**: Loo ja halda kohandatud Bicep-malle
- **Mitme-agendi arhitektuur**: Rakenda koordineeritud AI agentide lahendusi
- **Tootmisvalmidus**: Rakenda turva-, jälgimis- ja juhtimismustreid
- **Tõrkeotsingu oskused**: Lahenda iseseisvalt juurutamise ja seadistamise probleeme

**Professionaalsed oskused:**
- **Projektijuhtimine**: Juhi tehnilisi meeskondi pilvejuurutuse algatustes
- **Arhitektuuridisain**: Kujunda skaleeritavaid, kulutõhusaid Azure lahendusi
- **Teadmiste jagamine**: Koolita ja mentori kolleege AZD parimate tavade osas
- **Strateegiline planeerimine**: Mõjuta organisatsiooni pilve kasutuselevõtu strateegiaid

#### 📋 Töötuba ressursid ja materjalid
**Terviklik tööriistakast juhendajatele ja õppijatele**

**Juhendajatele:**
- **Juhendaja käsiraamat**: [Töötuba ülevaade](workshop/README.md) - Sessioonide planeerimise ja läbiviimise juhised
- **Presentatsiooni materjalid**: Esitlused, arhitektuuri skeemid ja demo stsenaariumid
- **Hindamisvahendid**: Praktilised harjutused, teadmiste kontroll ja hindamiskriteeriumid
- **Tehniline seadistus**: Keskkonna konfigureerimine, tõrkeotsingu juhendid ja varuplaanid

**Õppijatele:**
- **Interaktiivne töötuba keskkond**: [Töötuba materjalid](workshop/README.md) - Veebipõhine õppimisplatvorm
- **Samm-sammuline juhend**: [Juhendatud harjutused](../../workshop/docs/instructions) - Detailne rakenduse läbikäik  
- **Võrdlusdokumentatsioon**: [AI töötuba labor](docs/chapter-02-ai-development/ai-workshop-lab.md) - Tehisintellektile keskenduvad süvauuringud
- **Kogukonna ressursid**: Azure Discord kanaleid, GitHub arutelusid ja ekspertide tugi

#### 🏢 Ettevõtte töötuba rakendus
**Organisatsiooni juurutamise ja koolituse strateegiad**

**Ettevõtte koolitusprogrammid:**
- **Arendaja sisseelamine**: Uue töötaja orientatsioon AZD põhioskustega (2-4 nädalat)
- **Meeskonna täiendõpe**: Kvartali töötubade sessioonid olemasolevatele arendusmeeskondadele (1-2 päeva)
- **Arhitektuuri ülevaade**: Igakuised sessioonid vaneminseneridele ja arhitektidele (4 tundi)
- **Juhtkonna brifingud**: Juhtkondlike tehniliste otsustajate töötubade poolpäev

**Juurutamistugi:**
- **Kohandatud töötubade loomine**: Organisatsioonispetsiifiline sisu
- **Pilootprogrammi haldamine**: Struktureeritud juurutus koos tulemusnäitajate ja tagasisidega  
- **Jätkuv mentorlus**: Tugitöötoad projektide elluviimiseks
- **Kogukonna loomine**: Sisetooarendajate kogukonnad ja teadmusvahetus Azure AI teemadel

**Edu mõõdikud:**
- **Oskuste omandamine**: Eel- ja järeluuringud tehniliste pädevuste kasvu mõõtmiseks
- **Juurutuse edu**: Osalejate protsent, kes on edukalt tootmisse rakendanud rakendusi
- **Tootlikkuse ajastus**: Uute Azure AI projektide sisseelamisaja lühendamine
- **Teadmiste säilitamine**: Järelhindamised 3-6 kuud pärast töötuba

## 8 peatüki õppestruktuur

### Peatükk 1: Alused & kiire start (30-45 minutit) 🌱
**Eeltingimused**: Azure tellimus, algtaseme käsurea oskused  
**Keerukus**: ⭐

#### Mida sa õpid
- Azure Developer CLI põhialuste mõistmine
- AZD paigaldamine sinu platvormile  
- Esimene edukas juurutus
- Põhikonseptsioonid ja terminoloogia

#### Õppimise ressursid
- [AZD põhialused](docs/chapter-01-foundation/azd-basics.md) - Põhikonseptsioonid
- [Paigaldus & seadistus](docs/chapter-01-foundation/installation.md) - Platvormipõhised juhendid
- [Sinu esimene projekt](docs/chapter-01-foundation/first-project.md) - Praktiline juhend
- [Käsu kiirjuhend](resources/cheat-sheet.md) - Kiire viide

#### Praktiline tulemus
Juurutades AZD abil edukalt lihtsa veebiäpi Azure'i

---

### Peatükk 2: AI-eelistusega arendus (4-5 tundi koos töötoaga) 🤖
**Eeltingimused**: Peatükk 1 lõpetatud  
**Keerukus**: ⭐⭐

#### Mida sa õpid
- Microsoft Foundry integratsioon AZD-ga
- GA `microsoft.foundry` komplekti paigaldamine ja majutatud agendi koodi juurutamine
- Kohaliku agendi inspectori testimine ja eraldi hindamisandmekogumid/kriteeriumid
- AI-põhiste rakenduste juurutamine
- AI teenuste seadistuste mõistmine
- RAG (otsingu-põhine generatsioon) mustrid

#### Õppimise ressursid
- [Microsoft Foundry integratsioon](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- [Majutatud agendi läbivaatus (GA)](docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) - Initsialiseerimine, `azure.yaml` ülevaatus, provisjonimine, kohalik testimine, juurutamine, hindamine ja puhastamine
- [AI agentide juhend](docs/chapter-02-ai-development/agents.md)
- [AI mudelite juurutamine](docs/chapter-02-ai-development/ai-model-deployment.md)
- [AI töötuba labor](docs/chapter-02-ai-development/ai-workshop-lab.md) - **UUS**: Terviklik 2-3 tunnine praktiline labor
- [Interaktiivne töötuba juhend](workshop/README.md) - **UUS**: Veebipõhine töötuba MkDocs eelvaatega
- [Microsoft Foundry mallid](README.md#featured-microsoft-foundry-templates)
- [Töötuba juhised](../../workshop/docs/instructions) - **UUS**: Samm-sammult juhendatud harjutused

#### Praktiline tulemus
Testi majutatud agenti kohalikult ja Foundry keskkonnas GA komplektiga, vaata üle hindamistulemus ja erista uute ja taaskasutatud projektide puhastusprotsesse. Eraldi RAG/töötuba rada hõlmab AI-põhise vestlusrakenduse seadistamist.

#### Töötuba õpitee (vabatahtlik täiendus)
**UUS interaktiivne kogemus**: [Täielik töötuba juhend](workshop/README.md)
1. **Avastus** (30 min): Malli valik ja hindamine
2. **Juurutamine** (45 min): AI malli funktsionaalsuse juurutamine ja valideerimine  
3. **Lammutamine** (30 min): Malli arhitektuuri ja komponentide mõistmine
4. **Seadistamine** (30 min): Sätete ja parameetrite kohandamine
5. **Kohandamine** (45 min): Muudatused ja iteratsioonid, et see oleks sinu oma
6. **Lammutamine** (15 min): Ressursside puhastamine ja elutsükli mõistmine
7. **Kokkuvõte** (15 min): Edasised sammud ja täiustatud õpiteed

---

### Peatükk 3: Seadistamine & autentimine (45-60 minutit) ⚙️
**Eeltingimused**: Peatükk 1 lõpetatud  
**Keerukus**: ⭐⭐

#### Mida sa õpid
- Keskkonna seadistamine ja haldamine
- Autentimis- ja turvalisuse parimad tavad
- Ressursside nimetamine ja korraldamine
- Mitme keskkonna juurutused

#### Õppimise ressursid
- [Seadistamise juhend](docs/chapter-03-configuration/configuration.md) - Keskkonna seadistamine
- [Autentimise ja turvalisuse mustrid](docs/chapter-03-configuration/authsecurity.md) - Hallatud identiteet ja Key Vault integratsioon
- Mitme keskkonna näited

#### Praktiline tulemus
Halda mitut keskkonda õige autentimise ja turvalisusega

---

### Peatükk 4: Infrastruktuur koodina & juurutamine (1-1.5 tundi) 🏗️
**Eeltingimused**: Peatükid 1-3 lõpetatud  
**Keerukus**: ⭐⭐⭐

#### Mida sa õpid
- Täiustatud juurutamismustrid
- Infrastruktuur koodina Bicep-mallidega
- Ressursside provisjonimise strateegiad
- Kohandatud mallide loomine

- Konteineripõhiste rakenduste juurutamine Azure Container Appsi ja AZD-ga

#### Õppimise ressursid
- [Juurutamise juhend](docs/chapter-04-infrastructure/deployment-guide.md) - Täielikud töövood
- [Ressursside provisjonimine](docs/chapter-04-infrastructure/provisioning.md) - Ressursside haldus
- Konteineri ja mikroteenuste näited
- [Container App näited](examples/container-app/README.md) - Kiirstart, tootmine ja täiustatud juurutamismustrid

#### Praktiline tulemus
Juuruta keerukaid mitme teenusega rakendusi, kasutades kohandatud infrastruktuuri malle

---

### Peatükk 5: Mitme-agendi AI lahendused (2-3 tundi) 🤖🤖
**Eeltingimused**: Peatükid 1-2 lõpetatud  
**Keerukus**: ⭐⭐⭐⭐

#### Mida sa õpid
- Mitme-agendi arhitektuurimustrid
- Agendi orkestreerimine ja koordineerimine
- Tootmisvalmid AI juurutused
- Kliendi- ja inventuuri agentide rakendused

- Konteineripõhiste mikroteenuste integreerimine agendipõhiste lahenduste osana

#### Õppimise ressursid
- [Jaemüügi mitme-agendi lahendus](examples/retail-scenario.md) - Arhitektuuriplaan, mitte täielik rakendus
- [ARM malli pakk](../../examples/retail-multiagent-arm-template) - Infrastruktuuri raamistik ja rakenduse eeltingimused
- Mitme-agendi koordineerimismustrid
- [Mikroteenuste arhitektuuri näide](../../examples/container-app/microservices) - Teenus-teenus kommunikatsioon, asünkroonne sõnumside ja tootmisjuurutus

#### Praktiline tulemus
Kujunda mitme-agendi AI lahendus ning tuvastage rakenduse rakendamise, valideerimise ja operatiivtöö vajadused, mis ületavad infrastruktuuri provisjonimist

---

### Peatükk 6: Eeljuurutamise valideerimine ja planeerimine (1 tund) 🔍
**Eeltingimused**: Peatükk 4 lõpetatud  
**Keerukus**: ⭐⭐

#### Mida sa õpid
- Võimekuse planeerimine ja ressursi valideerimine
- SKU valiku strateegiad
- Eelkontrollid ja automatiseerimine
- Kulu optimeerimise planeerimine

#### Õppimise ressursid
- [Võimekuse planeerimine](docs/chapter-06-pre-deployment/capacity-planning.md) - Ressursi valideerimine
- [SKU valik](docs/chapter-06-pre-deployment/sku-selection.md) - Kuluefektiivsed valikud
- [Eelkontroll lennuks](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatiseeritud skriptid
- [Application Insights integratsioon](docs/chapter-06-pre-deployment/application-insights.md) - Jälgimine ja jälgitavus
- [Mitme agente koordineerimise mustrid](docs/chapter-06-pre-deployment/coordination-patterns.md) - Agendi orkestreerimise strateegiad

#### Praktiline tulemus
Kontrolli ja optimeeri juurutusi enne täitmist

---

### 7. peatükk: Veaotsing ja silumine (1-1,5 tundi) 🔧
**Eeldused**: Mõni juurutuspeatükk lõpetatud  
**Kompleksus**: ⭐⭐

#### Mida sa õpid
- Süsteemsed silumise meetodid
- Levinumad probleemid ja lahendused
- AI-spetsiifiline veaotsing
- Jõudluse optimeerimine

#### Õppematerjalid
- [Levinumad probleemid](docs/chapter-07-troubleshooting/common-issues.md) - KKK ja lahendused
- [Silumise juhend](docs/chapter-07-troubleshooting/debugging.md) - Samm-sammult strateegiad
- [AI-spetsiifiline veaotsing](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI teenuste probleemid

#### Praktiline tulemus
Iseseisvalt diagnoosi panna ja lahendada levinud juurutusprobleeme

---

### 8. peatükk: Tootmise ja ettevõtte mustrid (2-3 tundi) 🏢
**Eeldused**: Peatükid 1-4 lõpetatud  
**Kompleksus**: ⭐⭐⭐⭐

#### Mida sa õpid
- Tootmise juurutusstrateegiad
- Ettevõtte turvaprofiilid
- Jälgimine ja kulude optimeerimine
- Mastaapsus ja haldus

- Parimad tavad tootmise konteinerirakenduste juurutamiseks (turve, jälgimine, kulud, CI/CD)

#### Õppematerjalid
- [Tootmise AI parimad tavad](docs/chapter-08-production/production-ai-practices.md) - Ettevõtte mustrid
- Mikroteenused ja ettevõtte näited
- Jälgimise ja haldusraamistikud
- [Mikroteenuste arhitektuuri näide](../../examples/container-app/microservices) - Sinine-roheline/kanarilangetamine, hajutatud jälgimine ja kulude optimeerimine

#### Praktiline tulemus
Juuruta ettevõtteklassi rakendused koos täismahus tootmiskõlblikkusega

---

## Õppimise edenemine ja keerukus

### Oskuste järkjärguline areng

- **🌱 Algajad**: Alusta 1. peatükist (Alus) → 2. peatükk (AI arendus)
- **🔧 Kesktase**: Peatükid 3-4 (Konfiguratsioon & infrastruktuur) → 6. peatükk (Kinnitamine)
- **🚀 Edasijõudnud**: 5. peatükk (Mitme agendi lahendused) → 7. peatükk (Veaotsing)
- **🏢 Ettevõtte tase**: Täida kõik peatükid, keskendu 8. peatükile (Tootmise mustrid)

- **Konteinerirakenduse rada**: Peatükid 4 (Konteineritud juurutus), 5 (Mikroteenuste integratsioon), 8 (Tootmise parimad tavad)

### Keerukuse näitajad

- **⭐ Algeline**: Üksikud mõisted, juhendatud õpetused, 30-60 minutit
- **⭐⭐ Kesktase**: Mitmed mõisted, praktiline harjutus, 1-2 tundi  
- **⭐⭐⭐ Edasijõudnud**: Kompleksne arhitektuur, kohandatud lahendused, 1-3 tundi
- **⭐⭐⭐⭐ Ekspert**: Tootmissüsteemid, ettevõtte mustrid, 2-4 tundi

### Paindlikud õppeteed

#### 🎯 AI arendaja kiirtee (4-6 tundi)
1. **1. peatükk**: Alus ja kiire algus (45 min)
2. **2. peatükk**: AI-eelnev arendus (2 tundi)  
3. **5. peatükk**: Mitme agendi AI lahendused (3 tundi)
4. **8. peatükk**: Tootmise AI parimad tavad (1 tund)

#### 🛠️ Infrastruktuuri spetsialisti rada (5-7 tundi)
1. **1. peatükk**: Alus ja kiire algus (45 min)
2. **3. peatükk**: Konfiguratsioon ja autentimine (1 tund)
3. **4. peatükk**: Infrastruktuur kui kood ja juurutus (1,5 tundi)
4. **6. peatükk**: Eeljuurutuse kinnitamine ja planeerimine (1 tund)
5. **7. peatükk**: Veaotsing ja silumine (1,5 tundi)
6. **8. peatükk**: Tootmise ja ettevõtte mustrid (2 tundi)

#### 🎓 Täielik õpperännak (8-12 tundi)
Kõik 8 peatükki järjestikku lõpetatud praktilise harjutuse ja kinnitusega

## Kursuse lõpetamise raamistik

### Teadmiste kontroll
- **Peatükkide kontrollpunktid**: Praktilised harjutused mõõdetavate tulemustega
- **Praktiline kontroll**: Juuruta toimivad lahendused iga peatüki jaoks
- **Edenemise jälgimine**: Visuaalsed näidikud ja lõpetamise märgid
- **Kogukonna kinnitamine**: Jagage kogemusi Azure Discord kanalites

### Õpitulemuste hindamine

#### 1.-2. peatüki lõpetamine (Alus + AI)
- ✅ Juuruta lihtne veebirakendus AZD-ga
- ✅ Juuruta AI-toega vestlusrakendus RAG abil
- ✅ Mõista AZD põhikontseptsioone ja AI integratsiooni

#### 3.-4. peatüki lõpetamine (Konfiguratsioon + infrastruktuur)  
- ✅ Halda mitme keskkonna juurutusi
- ✅ Loo kohandatud Bicep infrastruktuuri mallid
- ✅ Rakenda turvalised autentimismustrid

#### 5.-6. peatüki lõpetamine (Mitmeagendi lahendused + kinnitamine)
- ✅ Juuruta keerukas mitmeagendi AI lahendus
- ✅ Tee mahtude planeerimist ja kuluoptimeerimist
- ✅ Rakenda automatiseeritud eeljuurutuse kinnitamine

#### 7.-8. peatüki lõpetamine (Veaotsing + tootmine)
- ✅ Debugi ja lahenda juurutusprobleeme iseseisvalt  
- ✅ Rakenda ettevõtte tasemel jälgimist ja turvalisust
- ✅ Juuruta tootmiskõlblikke rakendusi koos haldusega

### Sertifitseerimine ja tunnustamine
- **Kursuse lõpetamise märk**: Täida kõik 8 peatükki praktilise kinnitusega
- **Kogukonna tunnustus**: Aktiivne osalemine Microsoft Foundry Discordis
- **Professionaalne areng**: Tööstusharu asjakohased AZD ja AI juurutamise oskused
- **Karjäärivõimalused**: Ettevõtteklassi pilvejuurutusvõimekus

## 🎓 Kõikehõlmavad õpitulemused

### Alustase (1.-2. peatükk)
Pärast alustavate peatükkide lõpetamist osalejad:

**Tehnilised võimed:**
- Juurutada lihtsaid veebirakendusi Azures AZD käskudega
- Konfigureerida ja juurutada AI-toega vestlusrakendusi RAG võimalustega
- Mõista AZD põhikontseptsioone: mallid, keskkonnad, juurutusprotsessid
- Integreerida Microsoft Foundry teenused AZD juurutustega
- Navigeerida Azure AI teenuste seadetes ja API lõpp-punktides

**Professionaalsed oskused:**
- Järgida struktureeritud juurutusprotsesse järjepidevate tulemuste saamiseks
- Lahendada lihtsaid juurutusvigu logide ja dokumentatsiooni abil
- Suhelda efektiivselt pilvejuurutuse protsessidest
- Rakendada parimaid tavasid turvaliseks AI teenuste integratsiooniks

**Õppimise kinnitamine:**
- ✅ Edukalt juurutada `todo-nodejs-mongo` mall
- ✅ Juurutada ja seadistada `azure-search-openai-demo` koos RAG võimalustega
- ✅ Läbida interaktiivsed töötubade harjutused (avastusetapp)
- ✅ Osaleda Azure Discordi kogukonna aruteludes

### Kesktase (3.-4. peatükk)
Pärast kesktaseme peatükkide lõpetamist osalejad:

**Tehnilised võimed:**
- Hallata mitut juurutuskeskkonda (arendus, katsetus, tootmine)
- Luua kohandatud Bicep malle infrastruktuuriks kui kood
- Rakendada turvalisi autentimismustreid hallatava identiteediga
- Juurutada keerukaid mitme-teenusega rakendusi kohandatud seadistustega
- Optimeerida ressursside juurutusstrateegiaid kulu ja jõudluse jaoks

**Professionaalsed oskused:**
- Kujundada mastaapseid infrastruktuuri arhitektuure
- Rakendada pilvejuurutamisel turvalisuse parimaid tavasid
- Dokumenteerida infrastruktuuri mustreid meeskonna koostöö jaoks
- Hinnata ja valida sobivaid Azure teenuseid nõuete jaoks

**Õppimise kinnitamine:**
- ✅ Konfigureerida eraldi keskkonnad keskkonnaspetsiifiliste seadistustega
- ✅ Luua ja juurutada kohandatud Bicep mall mitme-teenusega rakenduse jaoks
- ✅ Rakendada hallatud identiteedi autentimismaneeri turvaliseks ligipääsuks
- ✅ Läbida konfiguratsiooni halduse harjutused reaalses olukorras

### Edasijõudnud tase (5.-6. peatükk)
Pärast edasijõudnud peatükkide lõpetamist osalejad:

**Tehnilised võimed:**
- Juurutada ja korraldada mitme agendi AI lahendusi koordineeritud töövoogudega
- Rakendada Kliendi ja Laoseisu agendi arhitektuure jaekaubanduse stsenaariumides
- Teostada põhjalikku mahupõhist planeerimist ja ressursside kontrolli
- Käivitada automatiseeritud eeljuurutuse kontroll ja optimeerimine
- Kujundada kuluefektiivseid SKU valikuid töökoormuse nõuete põhjal

**Professionaalsed oskused:**
- Arhitektuuri keerukaid AI lahendusi tootmiskeskkondade jaoks
- Juhtida tehnilisi arutelusid AI juurutusstrateegiatest
- Mentorida nooremaid arendajaid AZD ja AI juurutusparimates
- Hinnata ja soovitada AI arhitektuuri mustreid ärinõuete põhjal

**Õppimise kinnitamine:**
- ✅ Vaadata ja hinnata jae-mitmeagendi mustrit, eristada juurutatud infrastruktuuri puuduvast rakenduse teostusest
- ✅ Näidata agendi koordineerimist ja töövoo orkestreerimist
- ✅ Läbida mahukuse planeerimise harjutused reaalseid ressurssi piiranguid arvestades
- ✅ Kontrollida juurutuse valmisolekut automatiseeritud eelkontrollidega

### Eksperdi tase (7.-8. peatükk)
Pärast eksperdistaadiumi peatükkide lõpetamist osalejad:

**Tehnilised võimed:**
- Diagnoseerida ja lahendada iseseisvalt keerukaid juurutusprobleeme
- Rakendada ettevõtte tasemel turbe- ja juhtimisraamistikke
- Kujundada põhjalikke jälgimis- ja häirestrateegiaid
- Optimeerida tootmisjuurutusi mastaabi, kulude ja jõudluse jaoks
- Luua CI/CD torujuhtmeid adekvaatse testimise ja kinnitusega

**Professionaalsed oskused:**
- Juhtida ettevõtte pilve transformatsiooni algatusi
- Kujundada ja rakendada organisatsiooni juurutusstandardeid
- Koolitada ja mentorida arendusmeeskondi arenenud AZD praktikas
- Mõjutada tehnilisi otsuseid ettevõtte AI juurutustes

**Õppimise kinnitamine:**
- ✅ Lahendada keerukaid mitme-teenusega juurutusvigu
- ✅ Rakendada ettevõtte turbemustreid koos nõuetele vastavusega
- ✅ Kujundada ja juurutada tootmise jälgimine Application Insights abil
- ✅ Teostada ettevõtte juhtimisraamistiku rakendamine

## 🎯 Kursuse lõpetamise sertifikaat

### Edenemise jälgimise raamistik
Jälgi oma õppimise edenemist struktureeritud kontrollpunktide kaudu:

- [ ] **1. peatükk**: Alus ja kiire algus ✅
- [ ] **2. peatükk**: AI-eelnev arendus ✅  
- [ ] **3. peatükk**: Konfiguratsioon ja autentimine ✅
- [ ] **4. peatükk**: Infrastruktuur kui kood ja juurutus ✅
- [ ] **5. peatükk**: Mitmeagendi AI lahendused ✅
- [ ] **6. peatükk**: Eeljuurutuse kinnitamine ja planeerimine ✅
- [ ] **7. peatükk**: Veaotsing ja silumine ✅
- [ ] **8. peatükk**: Tootmise ja ettevõtte mustrid ✅

### Kontrollprotsess
Iga peatüki lõpetamisel kontrolli oma teadmisi läbi:

1. **Praktiliste harjutuste lõpetamine**: Juuruta toimivad lahendused iga peatüki jaoks
2. **Teadmiste hindamine**: KKK sektsioonide ülevaatus ja enesehindamised
3. **Kogukonna kaasamine**: Jagamine ja tagasiside saamine Azure Discordis
4. **Portfoolio arendus**: Dokumenteeri oma juurutused ja õppimised
5. **Võrdluspartnerite ülevaade**: Teiste õppijatega koostöö keerukates stsenaariumites

### Kursuse lõpetamise eelised
Kõigi peatükkide lõpetamisel koos kinnitusega saavad lõpetajad:

**Tehniline pädevus:**
- **Tootmiskogemus**: Juurutanud reaalseid AI rakendusi Azure keskkondades
- **Professionaalsed oskused**: Ettevõtteklassi juurutus ja veaotsingu võimekus  
- **Arhitektuuritunnetus**: Mitmeagendi AI lahendused ja keerukad infrastruktuurimustrid
- **Veaotsingu meisterlikkus**: Iseseisev juurutuse ja konfiguratsiooni probleemide lahendamine

**Professionaalne areng:**
- **Tööstuse tunnustus**: Kontrollitud oskused nõutud AZD ja AI juurutusvaldkondades
- **Karjäärivõimalused**: Kvalifikatsioon pilvearhitekti ja AI juurutusspetsialistina
- **Kogukonna juhtimine**: Aktiivne koostöö Azure arendajate ja AI kogukondades
- **Jätkuv õppimine**: Baas arenenud Microsoft Foundry spetsialiseerumiseks

**Portfoolio varad:**
- **Juurutatud lahendused**: Töötavad AI rakenduste ja infrastruktuurimustrite näited
- **Dokumentatsioon**: Üksikasjalikud juurutusjuhendid ja veaotsingu protseduurid  
- **Kogukonna panus**: Arutelud, näited ja täiustused jagatud Azure kogukonnaga
- **Professionaalne võrgustik**: Kontaktid Azure ekspertide ja AI juurutuste praktikute vahel

### Pärast kursust õppimise rada
Lõpetajad on valmis edasiseks spetsialiseerumiseks:
- **Microsoft Foundry ekspert**: Süva spetsialiseerumine AI mudelite juurutamisel ja orkestreerimisel
- **Pilvearhitektuuri juhtimine**: Ettevõtte mastaabis juurutuste disain ja haldus
- **Arendajate kogukonna juhtimine**: Panustamine Azure näidete ja kogukonnamaterjalide loomisse
- **Ettevõtte koolitus**: AZD ja AI juurutusoskuste õpetamine organisatsioonides

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->