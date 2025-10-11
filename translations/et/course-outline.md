<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "aace36eff845763a5b041a4ed9a33e02",
  "translation_date": "2025-10-11T15:36:36+00:00",
  "source_file": "course-outline.md",
  "language_code": "et"
}
-->
# AZD algajatele: kursuse ülevaade ja õppe raamistik

## Kursuse ülevaade

Õpi tundma Azure Developer CLI-d (azd) läbi struktureeritud peatükkide, mis on loodud järkjärguliseks õppimiseks. **Eriline rõhk AI rakenduste juurutamisel koos Azure AI Foundry integreerimisega.**

### Miks see kursus on kaasaegsetele arendajatele oluline

Azure AI Foundry Discordi kogukonna ülevaadete põhjal **45% arendajatest soovib kasutada AZD-d AI töökoormuste jaoks**, kuid nad seisavad silmitsi väljakutsetega, nagu:
- Keerukad mitme teenusega AI arhitektuurid
- Parimad tavad AI juurutamiseks tootmises
- Azure AI teenuste integreerimine ja konfigureerimine
- AI töökoormuste kulude optimeerimine
- AI-spetsiifiliste juurutusprobleemide lahendamine

### Põhilised õpieesmärgid

Selle struktureeritud kursuse läbimisega:
- **Õpid AZD põhialuseid**: Põhikontseptsioonid, paigaldamine ja konfigureerimine
- **Juurutad AI rakendusi**: Kasuta AZD-d koos Azure AI Foundry teenustega
- **Rakenda infrastruktuuri kui koodi**: Halda Azure'i ressursse Bicep mallidega
- **Lahenda juurutusprobleeme**: Lahenda levinud probleeme ja veaotsingut
- **Optimeeri tootmiseks**: Turvalisus, skaleerimine, jälgimine ja kulude haldamine
- **Loo mitme agendiga lahendusi**: Juuruta keerukaid AI arhitektuure

## 🎓 Töötuba ja õpikogemus

### Paindlikud õppevormid
Kursus on loodud toetama nii **iseseisvat õppimist** kui ka **juhendatud töötubasid**, võimaldades õppijatel saada praktilisi kogemusi AZD-ga ja arendada oskusi interaktiivsete harjutuste kaudu.

#### 🚀 Iseseisev õppevorm
**Ideaalne individuaalsetele arendajatele ja pidevaks õppimiseks**

**Omadused:**
- **Brauseripõhine liides**: MkDocs-põhine töötuba, mis on kättesaadav igas veebibrauseris
- **GitHub Codespaces integratsioon**: Ühe klõpsuga arenduskeskkond eelkonfigureeritud tööriistadega
- **Interaktiivne DevContainer keskkond**: Kohalikku seadistust pole vaja - alusta kohe kodeerimist
- **Edenemise jälgimine**: Sisseehitatud kontrollpunktid ja valideerimisharjutused
- **Kogukonna tugi**: Juurdepääs Azure'i Discordi kanalitele küsimuste ja koostöö jaoks

**Õppestruktuur:**
- **Paindlik ajakava**: Lõpeta peatükid omas tempos päevade või nädalate jooksul
- **Kontrollpunktide süsteem**: Valideeri õpitut enne keerukamate teemade juurde liikumist
- **Ressursikogu**: Põhjalik dokumentatsioon, näited ja veaotsingu juhendid
- **Portfoolio arendamine**: Loo juurutatavaid projekte professionaalseks portfoolioks

**Alustamine (iseseisev):**
```bash
# Option 1: GitHub Codespaces (Recommended)
# Navigate to the repository and click "Code" → "Create codespace on main"

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow setup instructions in workshop/README.md
```

#### 🏛️ Juhendatud töötuba
**Ideaalne ettevõtete koolitusteks, kiirkursusteks ja haridusasutustele**

**Töötoa formaadi valikud:**

**📚 Akadeemiline kursus (8-12 nädalat)**
- **Ülikooliprogrammid**: Semestripikkune kursus iganädalaste 2-tunniste sessioonidega
- **Kiirkursuse formaat**: Intensiivne 3-5 päevane programm igapäevaste 6-8 tunniste sessioonidega
- **Ettevõtete koolitus**: Igakuine meeskonna sessioon praktilise projekti rakendamisega
- **Hindamisraamistik**: Hinnatud ülesanded, kaaslaste ülevaated ja lõppprojektid

**🚀 Intensiivne töötuba (1-3 päeva)**
- **1. päev**: Põhitõed + AI arendus (peatükid 1-2) - 6 tundi
- **2. päev**: Konfiguratsioon + infrastruktuur (peatükid 3-4) - 6 tundi  
- **3. päev**: Täiustatud mustrid + tootmine (peatükid 5-8) - 8 tundi
- **Järeltegevus**: Valikuline 2-nädalane mentorlus projekti lõpetamiseks

**⚡ Juhtkonna briifing (4-6 tundi)**
- **Strateegiline ülevaade**: AZD väärtuspakkumine ja äriline mõju (1 tund)
- **Praktiline demo**: AI rakenduse juurutamine algusest lõpuni (2 tundi)
- **Arhitektuuri ülevaade**: Ettevõtte mustrid ja juhtimine (1 tund)
- **Rakendamise plaanimine**: Organisatsiooni kasutuselevõtu strateegia (1-2 tundi)

#### 🛠️ Töötoa õpimeetodid
**Avastamine → Juurutamine → Kohandamine oskuste praktiliseks arendamiseks**

**1. faas: Avastamine (45 minutit)**
- **Mallide uurimine**: Hindamine Azure AI Foundry mallide ja teenuste osas
- **Arhitektuuri analüüs**: Mitme agendi mustrite ja juurutusstrateegiate mõistmine
- **Nõuete hindamine**: Organisatsiooniliste vajaduste ja piirangute tuvastamine
- **Keskkonna seadistamine**: Arenduskeskkonna ja Azure'i ressursside konfigureerimine

**2. faas: Juurutamine (2 tundi)**
- **Juhendatud rakendamine**: Samm-sammuline AI rakenduste juurutamine AZD-ga
- **Teenuste konfigureerimine**: Azure AI teenuste, lõpp-punktide ja autentimise seadistamine
- **Turvalisuse rakendamine**: Ettevõtte turvalisuse mustrite ja juurdepääsukontrollide rakendamine
- **Valideerimise testimine**: Juurutuste kontrollimine ja levinud probleemide lahendamine

**3. faas: Kohandamine (45 minutit)**
- **Rakenduse muutmine**: Mallide kohandamine konkreetsete kasutusjuhtude ja nõuete jaoks
- **Tootmise optimeerimine**: Jälgimise, kulude haldamise ja skaleerimise strateegiate rakendamine
- **Täiustatud mustrid**: Mitme agendi koordineerimise ja keerukate arhitektuuride uurimine
- **Järgmiste sammude planeerimine**: Õppimistee määratlemine oskuste arendamiseks

#### 🎯 Töötoa õpitulemused
**Käed-külge praktika kaudu arendatud mõõdetavad oskused**

**Tehnilised kompetentsid:**
- **Juuruta AI rakendusi tootmises**: Juuruta ja konfigureeri edukalt AI-lahendusi
- **Infrastruktuuri kui koodi valdamine**: Loo ja halda kohandatud Bicep malle
- **Mitme agendi arhitektuur**: Rakenda koordineeritud AI agentide lahendusi
- **Tootmisvalmidus**: Rakenda turvalisuse, jälgimise ja juhtimise mustreid
- **Veaotsingu oskused**: Lahenda iseseisvalt juurutus- ja konfiguratsiooniprobleeme

**Professionaalsed oskused:**
- **Projekti juhtimine**: Juhi tehnilisi meeskondi pilve juurutamise algatustes
- **Arhitektuuri disain**: Kujunda skaleeritavaid ja kulutõhusaid Azure'i lahendusi
- **Teadmiste edastamine**: Koolita ja juhenda kolleege AZD parimate tavade osas
- **Strateegiline planeerimine**: Mõjuta organisatsiooni pilve kasutuselevõtu strateegiaid

#### 📋 Töötoa ressursid ja materjalid
**Põhjalik tööriistakomplekt juhendajatele ja õppijatele**

**Juhendajatele:**
- **Juhendaja juhend**: [Töötoa juhend](workshop/docs/instructor-guide.md) - Sessiooni planeerimise ja läbiviimise näpunäited
- **Esitlusmaterjalid**: Slideshow'd, arhitektuuri diagrammid ja demo skriptid
- **Hindamisvahendid**: Praktilised harjutused, teadmiste kontrollid ja hindamisjuhendid
- **Tehniline seadistus**: Keskkonna konfigureerimine, veaotsingu juhendid ja varuplaanid

**Õppijatele:**
- **Interaktiivne töötoa keskkond**: [Töötoa materjalid](workshop/README.md) - Brauseripõhine õppeplatvorm
- **Samm-sammult juhised**: [Juhendatud harjutused](../../workshop/docs/instructions) - Üksikasjalikud rakendamise juhendid  
- **Viitedokumentatsioon**: [AI töötuba](docs/ai-foundry/ai-workshop-lab.md) - AI-le keskenduvad süvitsi minevad materjalid
- **Kogukonna ressursid**: Azure Discordi kanalid, GitHubi arutelud ja ekspertide tugi

#### 🏢 Ettevõtte töötoa rakendamine
**Organisatsiooni juurutamise ja koolituse strateegiad**

**Ettevõtete koolitusprogrammid:**
- **Arendajate sisseelamine**: Uute töötajate orientatsioon AZD põhialustega (2-4 nädalat)
- **Meeskonna oskuste arendamine**: Kvartali töötubade korraldamine olemasolevatele arendajatele (1-2 päeva)
- **Arhitektuuri ülevaade**: Igakuised sessioonid vaneminseneridele ja arhitektidele (4 tundi)
- **Juhtkonna briifingud**: Tehniliste otsustajate töötoad (pool päeva)

**Rakendamise tugi:**
- **Kohandatud töötoa disain**: Kohandatud sisu konkreetsete organisatsiooniliste vajaduste jaoks
- **Pilootprogrammi haldamine**: Struktureeritud juurutus koos edumõõdikute ja tagasiside tsüklitega  
- **Jätkuv mentorlus**: Töötoa järgne tugi projekti rakendamiseks
- **Kogukonna loomine**: Sisemised Azure AI arendajate kogukonnad ja teadmiste jagamine

**Edu mõõdikud:**
- **Oskuste omandamine**: Eel/järgne hindamine tehnilise kompetentsi kasvu mõõtmiseks
- **Juurutuse edu**: Osalejate protsent, kes edukalt juurutavad tootmisrakendusi
- **Tootlikkuse aeg**: Vähendatud sisseelamisaeg uute Azure AI projektide jaoks
- **Teadmiste säilitamine**: Järelhindamised 3-6 kuud pärast töötuba

## 8 peatüki õpistruktuur

### Peatükk 1: Põhitõed ja kiire alustamine (30-45 minutit) 🌱
**Eeltingimused**: Azure'i tellimus, põhilised käsurea teadmised  
**Keerukus**: ⭐

#### Mida õpid
- Azure Developer CLI põhialuste mõistmine
- AZD paigaldamine oma platvormile  
- Esimene edukas juurutus
- Põhikontseptsioonid ja terminoloogia

#### Õppematerjalid
- [AZD põhialused](docs/getting-started/azd-basics.md) - Põhikontseptsioonid
- [Paigaldamine ja seadistamine](docs/getting-started/installation.md) - Platvormipõhised juhendid
- [Sinu esimene projekt](docs/getting-started/first-project.md) - Praktiline juhend
- [Käskude spikker](resources/cheat-sheet.md) - Kiirviide

#### Praktiline tulemus
Edukas lihtsa veebirakenduse juurutamine Azure'i kasutades AZD-d

---

### Peatükk 2: AI-põhine arendus (1-2 tundi) 🤖
**Eeltingimused**: Peatükk 1 läbitud  
**Keerukus**: ⭐⭐

#### Mida õpid
- Azure AI Foundry integreerimine AZD-ga
- AI-põhiste rakenduste juurutamine
- AI teenuste konfiguratsioonide mõistmine
- RAG (Retrieval-Augmented Generation) mustrid

#### Õppematerjalid
- [Azure AI Foundry integreerimine](docs/ai-foundry/azure-ai-foundry-integration.md)
- [AI mudeli juurutamine](docs/ai-foundry/ai-model-deployment.md)
- [AI töötuba](docs/ai-foundry/ai-workshop-lab.md) - **UUS**: Põhjalik 2-3 tunnine praktiline töötuba
- [Interaktiivne töötoa juhend](workshop/README.md) - **UUS**: Brauseripõhine töötuba MkDocs eelvaatega
- [Azure AI Foundry mallid](README.md#featured-azure-ai-foundry-templates)
- [Töötoa juhised](../../workshop/docs/instructions) - **UUS**: Samm-sammult juhendatud harjutused

#### Praktiline tulemus
Juuruta ja konfigureeri AI-põhine vestlusrakendus RAG funktsionaalsusega

#### Töötoa õpitee (valikuline täiendus)
**UUS interaktiivne kogemus**: [Täielik töötoa juhend](workshop/README.md)
1. **Avastamine** (30 min): Malli valik ja hindamine
2. **Juurutamine** (45 min): Juuruta ja valideeri AI malli funktsionaalsus  
3. **Lahkamine** (30 min): Mõista malli arhitektuuri ja komponente
4. **Konfiguratsioon** (30 min): Kohanda seadeid ja parameetreid
5. **Kohandamine** (45 min): Muuda ja iteratsiooni, et teha see enda omaks
6. **Lõpetamine** (15 min): Ressursside puhastamine ja elutsükli mõistmine
7. **Kokkuvõte** (15 min): Järgmised sammud ja täiustatud õpiteed

---

### Peatükk 3: Konfiguratsioon ja autentimine (45-60 minutit) ⚙️
**Eeltingimused**: Peatükk 1 läbitud  
**Keerukus**: ⭐⭐

#### Mida õpid
- Keskkonna konfiguratsioon ja haldamine
- Autentimise ja turvalisuse parimad tavad
- Ressursside nimetamine ja organiseerimine
- Mitme keskkonna juurutused

#### Õppematerjalid
- [Konfiguratsiooni juhend](docs/getting-started/configuration.md) - Keskkonna seadistamine
- Turvalisuse mustrid ja hallatud identiteet
- Mitme keskkonna näited

#### Praktiline tulemus
Halda mitut keskkonda õige autentimise ja turvalisusega

---

### Peatükk 4: Infrastruktuur kui kood ja juurutamine (1-1.5 tundi) 🏗️
**Eeltingimused**: Peatükid 1-3 läbitud  
**Keerukus**: ⭐⭐⭐

#### Mida õpid
- Täiustatud juurutusmustrid
- Infrastruktuur kui kood Bicepiga
- Ressursside hankimise strateegiad
- Kohandatud mallide loomine

#### Õppematerjalid
- [Juurutuse juhend](docs/deployment/deployment-guide.md) - Täielikud töövood
- [Ressursside hankimine](docs/deployment/provisioning.md) - Ressursside haldamine
- Konteinerite ja mikroteenuste näited

#### Praktiline tulemus
Juuruta keerukaid mitme teenusega rakendusi, kasutades kohandatud infrastruktuuri malle

---

### Peatükk 5: Mitme agendiga AI lahendused (2-3 tundi) 🤖🤖
**Eeltingimused**: Peatükid 1-2 läbitud  
**Keerukus**: ⭐⭐⭐⭐

#### Mida õpid
- Mitme agendi arhitektuuri mustrid
- Agentide orkestreerimine ja koordineerimine
- Tootmisvalmis AI juurutused
- Kliendi ja inventari agentide rakendused

#### Õppematerjalid
- [Jaemüügi mitme agendi lahendus](examples/retail-scenario.md) - Täielik rakendus
- [ARM malli pakett](../../examples/retail-multiagent-arm-template) - Ühe klõpsuga juurutus
- Mitme agendi koordineerimise mustrid

#### Praktiline tulemus
Juuruta ja halda tootmisvalmis mitme agendi AI lahendust

---

### Peatükk 6
- [AI-spetsiifiline tõrkeotsing](docs/troubleshooting/ai-troubleshooting.md) - AI-teenuse probleemid

#### Praktiline tulemus
Iseseisev oskus diagnoosida ja lahendada levinud juurutusprobleeme

---

### 8. peatükk: Tootmine ja ettevõtte mustrid (2-3 tundi) 🏢
**Eeltingimused**: Peatükid 1-4 läbitud  
**Keerukus**: ⭐⭐⭐⭐

#### Mida õpid
- Tootmise juurutamise strateegiad
- Ettevõtte turvalisuse mustrid
- Jälgimine ja kulude optimeerimine
- Skaalautuvus ja juhtimine

#### Õppematerjalid
- [Tootmise AI parimad praktikad](docs/ai-foundry/production-ai-practices.md) - Ettevõtte mustrid
- Mikroteenused ja ettevõtte näited
- Jälgimise ja juhtimise raamistikud

#### Praktiline tulemus
Juurutada ettevõttevalmis rakendusi täis tootmisvõimekusega

---

## Õppimise progressioon ja keerukus

### Järkjärguline oskuste arendamine

- **🌱 Algajad**: Alusta 1. peatükist (Alused) → 2. peatükk (AI arendus)
- **🔧 Kesktase**: Peatükid 3-4 (Konfiguratsioon ja infrastruktuur) → 6. peatükk (Valideerimine)
- **🚀 Edasijõudnud**: 5. peatükk (Multi-agent lahendused) → 7. peatükk (Tõrkeotsing)
- **🏢 Ettevõtte tasand**: Läbi kõik peatükid, keskendu 8. peatükile (Tootmise mustrid)

### Keerukuse näitajad

- **⭐ Põhiline**: Üksikud kontseptsioonid, juhendatud õpetused, 30-60 minutit
- **⭐⭐ Kesktase**: Mitu kontseptsiooni, praktiline harjutamine, 1-2 tundi  
- **⭐⭐⭐ Edasijõudnud**: Keerukad arhitektuurid, kohandatud lahendused, 1-3 tundi
- **⭐⭐⭐⭐ Ekspert**: Tootmissüsteemid, ettevõtte mustrid, 2-4 tundi

### Paindlikud õpiteed

#### 🎯 Kiirtee AI arendajatele (4-6 tundi)
1. **1. peatükk**: Alused ja kiire algus (45 minutit)
2. **2. peatükk**: AI-põhine arendus (2 tundi)  
3. **5. peatükk**: Multi-agent AI lahendused (3 tundi)
4. **8. peatükk**: Tootmise AI parimad praktikad (1 tund)

#### 🛠️ Infrastruktuuri spetsialisti tee (5-7 tundi)
1. **1. peatükk**: Alused ja kiire algus (45 minutit)
2. **3. peatükk**: Konfiguratsioon ja autentimine (1 tund)
3. **4. peatükk**: Infrastruktuur kui kood ja juurutamine (1,5 tundi)
4. **6. peatükk**: Eeljuurutuse valideerimine ja planeerimine (1 tund)
5. **7. peatükk**: Tõrkeotsing ja silumine (1,5 tundi)
6. **8. peatükk**: Tootmise ja ettevõtte mustrid (2 tundi)

#### 🎓 Täielik õpiteekond (8-12 tundi)
Kõigi 8 peatüki järjestikune läbimine koos praktilise harjutamise ja valideerimisega

## Kursuse lõpetamise raamistik

### Teadmiste valideerimine
- **Peatüki kontrollpunktid**: Praktilised harjutused mõõdetavate tulemustega
- **Praktiline kontroll**: Töötavate lahenduste juurutamine iga peatüki jaoks
- **Progressi jälgimine**: Visuaalsed indikaatorid ja lõpetamise märgid
- **Kogukonna valideerimine**: Kogemuste jagamine Azure Discord kanalites

### Õpitulemuste hindamine

#### Peatükkide 1-2 lõpetamine (Alused + AI)
- ✅ Juurutada lihtne veebirakendus AZD abil
- ✅ Juurutada AI-põhine vestlusrakendus RAG-ga
- ✅ Mõista AZD põhikontseptsioone ja AI integratsiooni

#### Peatükkide 3-4 lõpetamine (Konfiguratsioon + infrastruktuur)  
- ✅ Hallata mitme keskkonna juurutusi
- ✅ Luua kohandatud Bicep infrastruktuuri mallid
- ✅ Rakendada turvalisi autentimismustreid

#### Peatükkide 5-6 lõpetamine (Multi-agent + valideerimine)
- ✅ Juurutada keerukas multi-agent AI lahendus
- ✅ Teostada mahutavuse planeerimist ja kulude optimeerimist
- ✅ Rakendada automatiseeritud eeljuurutuse valideerimist

#### Peatükkide 7-8 lõpetamine (Tõrkeotsing + tootmine)
- ✅ Siluda ja lahendada juurutusprobleeme iseseisvalt  
- ✅ Rakendada ettevõtte tasemel jälgimist ja turvalisust
- ✅ Juurutada tootmisvalmis rakendusi koos juhtimisega

### Sertifitseerimine ja tunnustus
- **Kursuse lõpetamise märk**: Kõigi 8 peatüki praktilise valideerimisega lõpetamine
- **Kogukonna tunnustus**: Aktiivne osalemine Azure AI Foundry Discordis
- **Professionaalne areng**: Tööstusele vastavad AZD ja AI juurutamise oskused
- **Karjäärivõimalused**: Ettevõtte tasemel pilvejuurutuse oskused

## 🎓 Põhjalikud õpitulemused

### Algtase (Peatükid 1-2)
Pärast algtaseme peatükkide läbimist oskavad õppijad:

**Tehnilised oskused:**
- Juurutada lihtsaid veebirakendusi Azure'i AZD käskude abil
- Konfigureerida ja juurutada AI-põhiseid vestlusrakendusi RAG funktsioonidega
- Mõista AZD põhikontseptsioone: mallid, keskkonnad, ettevalmistusprotsessid
- Integreerida Azure AI Foundry teenuseid AZD juurutustega
- Navigeerida Azure AI teenuste konfiguratsioonides ja API lõpp-punktides

**Professionaalsed oskused:**
- Järgida struktureeritud juurutusprotsesse järjepidevate tulemuste saavutamiseks
- Lahendada põhilisi juurutusprobleeme logide ja dokumentatsiooni abil
- Suhelda tõhusalt pilvejuurutuse protsesside teemal
- Rakendada parimaid praktikaid turvalise AI-teenuse integreerimiseks

**Õppimise valideerimine:**
- ✅ Edukalt juurutada `todo-nodejs-mongo` mall
- ✅ Juurutada ja konfigureerida `azure-search-openai-demo` RAG-ga
- ✅ Lõpetada interaktiivsed töötoa harjutused (Avastamise faas)
- ✅ Osaleda Azure Discord kogukonna aruteludes

### Kesktase (Peatükid 3-4)
Pärast kesktaseme peatükkide läbimist oskavad õppijad:

**Tehnilised oskused:**
- Hallata mitme keskkonna juurutusi (arendus, testimine, tootmine)
- Luua kohandatud Bicep malle infrastruktuuri kui koodi jaoks
- Rakendada turvalisi autentimismustreid hallatud identiteediga
- Juurutada keerukaid mitme teenuse rakendusi kohandatud konfiguratsioonidega
- Optimeerida ressursside ettevalmistamise strateegiaid kulude ja jõudluse jaoks

**Professionaalsed oskused:**
- Kavandada skaleeritavaid infrastruktuuri arhitektuure
- Rakendada turvalisuse parimaid praktikaid pilvejuurutustes
- Dokumenteerida infrastruktuuri mustreid meeskonnatööks
- Hinnata ja valida sobivaid Azure'i teenuseid vastavalt nõuetele

**Õppimise valideerimine:**
- ✅ Konfigureerida eraldi keskkonnad keskkonnaspetsiifiliste seadistustega
- ✅ Luua ja juurutada kohandatud Bicep mall mitme teenuse rakenduse jaoks
- ✅ Rakendada hallatud identiteedi autentimist turvaliseks juurdepääsuks
- ✅ Lõpetada konfiguratsioonihalduse harjutused reaalses olukorras

### Edasijõudnud tase (Peatükid 5-6)
Pärast edasijõudnud peatükkide läbimist oskavad õppijad:

**Tehnilised oskused:**
- Juurutada ja orkestreerida multi-agent AI lahendusi koordineeritud töövoogudega
- Rakendada kliendi ja inventari agentide arhitektuure jaemüügi stsenaariumide jaoks
- Teostada põhjalikku mahutavuse planeerimist ja ressursside valideerimist
- Teostada automatiseeritud eeljuurutuse valideerimist ja optimeerimist
- Kavandada kulutõhusaid SKU valikuid töökoormuse nõuete alusel

**Professionaalsed oskused:**
- Arhitektuuri keerukate AI lahenduste jaoks tootmiskeskkonnas
- Juhtida tehnilisi arutelusid AI juurutusstrateegiate üle
- Juhendada nooremaid arendajaid AZD ja AI juurutamise parimates praktikates
- Hinnata ja soovitada AI arhitektuurimustreid ärivajaduste jaoks

**Õppimise valideerimine:**
- ✅ Juurutada täielik jaemüügi multi-agent lahendus ARM mallidega
- ✅ Näidata agentide koordineerimist ja töövoogude orkestreerimist
- ✅ Lõpetada mahutavuse planeerimise harjutused reaalse ressursside piirangutega
- ✅ Valideerida juurutuse valmisolekut automatiseeritud kontrollide kaudu

### Ekspert tase (Peatükid 7-8)
Pärast eksperttaseme peatükkide läbimist oskavad õppijad:

**Tehnilised oskused:**
- Diagnoosida ja lahendada keerukaid juurutusprobleeme iseseisvalt
- Rakendada ettevõtte tasemel turvalisuse mustreid ja juhtimisraamistikke
- Kavandada põhjalikke jälgimis- ja hoiatustrateegiaid
- Optimeerida tootmise juurutusi skaleeritavuse, kulude ja jõudluse jaoks
- Luua CI/CD torustikke koos korrektse testimise ja valideerimisega

**Professionaalsed oskused:**
- Juhtida ettevõtte pilve transformatsiooni algatusi
- Kavandada ja rakendada organisatsioonilisi juurutusstandardeid
- Koolitada ja juhendada arendustiime edasijõudnud AZD praktikates
- Mõjutada tehnilisi otsuseid ettevõtte AI juurutuste jaoks

**Õppimise valideerimine:**
- ✅ Lahendada keerukaid mitme teenuse juurutuse tõrkeid
- ✅ Rakendada ettevõtte turvalisuse mustreid vastavusnõuetega
- ✅ Kavandada ja juurutada tootmise jälgimist Application Insights abil
- ✅ Lõpetada ettevõtte juhtimisraamistiku rakendamine

## 🎯 Kursuse lõpetamise sertifikaat

### Progressi jälgimise raamistik
Jälgi oma õppeprogressi struktureeritud kontrollpunktide kaudu:

- [ ] **1. peatükk**: Alused ja kiire algus ✅
- [ ] **2. peatükk**: AI-põhine arendus ✅  
- [ ] **3. peatükk**: Konfiguratsioon ja autentimine ✅
- [ ] **4. peatükk**: Infrastruktuur kui kood ja juurutamine ✅
- [ ] **5. peatükk**: Multi-agent AI lahendused ✅
- [ ] **6. peatükk**: Eeljuurutuse valideerimine ja planeerimine ✅
- [ ] **7. peatükk**: Tõrkeotsing ja silumine ✅
- [ ] **8. peatükk**: Tootmise ja ettevõtte mustrid ✅

### Verifitseerimise protsess
Pärast iga peatüki lõpetamist kinnita oma teadmised läbi:

1. **Praktiliste harjutuste lõpetamine**: Juuruta töötavad lahendused iga peatüki jaoks
2. **Teadmiste hindamine**: Vaata KKK sektsioone ja täida enesehindamised
3. **Kogukonna kaasamine**: Jaga kogemusi ja saa tagasisidet Azure Discordis
4. **Portfoolio arendamine**: Dokumenteeri oma juurutused ja õppetunnid
5. **Kaaskolleegide ülevaade**: Tee koostööd teiste õppijatega keerukates stsenaariumides

### Kursuse lõpetamise eelised
Pärast kõigi peatükkide lõpetamist ja valideerimist saavad lõpetajad:

**Tehniline ekspertiis:**
- **Tootmise kogemus**: Juurutatud reaalsed AI rakendused Azure'i keskkondades
- **Professionaalsed oskused**: Ettevõttevalmis juurutamise ja tõrkeotsingu oskused  
- **Arhitektuuri teadmised**: Multi-agent AI lahendused ja keerukad infrastruktuuri mustrid
- **Tõrkeotsingu meisterlikkus**: Iseseisev juurutuse ja konfiguratsiooni probleemide lahendamine

**Professionaalne areng:**
- **Tööstuse tunnustus**: Kontrollitavad oskused kõrge nõudlusega AZD ja AI juurutamise valdkondades
- **Karjäärivõimalused**: Kvalifikatsioonid pilvearhitekti ja AI juurutamise spetsialisti rollide jaoks
- **Kogukonna juhtimine**: Aktiivne liikmelisus Azure'i arendajate ja AI kogukondades
- **Pidev õppimine**: Alus edasijõudnud Azure AI Foundry spetsialiseerumiseks

**Portfoolio varad:**
- **Juurutatud lahendused**: Töötavad näited AI rakendustest ja infrastruktuuri mustritest
- **Dokumentatsioon**: Põhjalikud juurutusjuhendid ja tõrkeotsingu protseduurid  
- **Kogukonna panused**: Arutelud, näited ja täiustused jagatud Azure'i kogukonnaga
- **Professionaalne võrgustik**: Kontaktid Azure'i ekspertide ja AI juurutamise praktikutega

### Kursusejärgne õpitee
Lõpetajad on valmis edasijõudnud spetsialiseerumiseks:
- **Azure AI Foundry ekspert**: Sügav spetsialiseerumine AI mudelite juurutamisele ja orkestreerimisele
- **Pilvearhitektuuri juhtimine**: Ettevõtte tasemel juurutuse disain ja juhtimine
- **Arendajate kogukonna juhtimine**: Panustamine Azure'i näidiste ja kogukonna ressurssidesse
- **Ettevõtte koolitus**: AZD ja AI juurutamise oskuste õpetamine organisatsioonides

---

**Lahtiütlus**:  
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame tagada täpsust, palume arvestada, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Algne dokument selle algses keeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitame kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste või valesti tõlgenduste eest.