<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "2a0861541126250c3558d667e9b13c50",
  "translation_date": "2025-11-24T12:39:19+00:00",
  "source_file": "course-outline.md",
  "language_code": "et"
}
-->
# AZD Algajatele: Kursuse Ülevaade ja Õppimisraamistik

## Kursuse Ülevaade

Õpi Azure Developer CLI (azd) kasutamist läbi struktureeritud peatükkide, mis on loodud järkjärguliseks õppimiseks. **Eriline rõhk on AI-rakenduste juurutamisel koos Microsoft Foundry integratsiooniga.**

### Miks see kursus on kaasaegsetele arendajatele oluline

Microsoft Foundry Discordi kogukonna andmetel soovib **45% arendajatest kasutada AZD-d AI töökoormuste jaoks**, kuid nad seisavad silmitsi järgmiste väljakutsetega:
- Keerulised mitme teenusega AI arhitektuurid
- Parimad tavad AI juurutamiseks tootmises
- Azure AI teenuste integreerimine ja seadistamine
- AI töökoormuste kulude optimeerimine
- AI-spetsiifiliste juurutusprobleemide tõrkeotsing

### Põhilised Õpieesmärgid

Selle struktureeritud kursuse läbimisega:
- **Õpid AZD põhialuseid**: Põhimõisted, paigaldamine ja seadistamine
- **Juurutad AI rakendusi**: Kasuta AZD-d koos Microsoft Foundry teenustega
- **Rakendad infrastruktuuri koodina**: Halda Azure'i ressursse Bicep mallidega
- **Lahendad juurutusprobleeme**: Tuvasta ja paranda levinud vigu
- **Optimeerid tootmiseks**: Turvalisus, skaleerimine, monitooring ja kulude haldamine
- **Ehita mitmeagendilisi lahendusi**: Juuruta keerulisi AI arhitektuure

## 🎓 Töötuba ja Õppimiskogemus

### Paindlikud Õppimisvõimalused
See kursus on loodud toetama nii **iseseisvat õppimist** kui ka **juhendatud töötubasid**, võimaldades õppijatel omandada praktilisi oskusi AZD kasutamisel interaktiivsete harjutuste kaudu.

#### 🚀 Iseseisev Õppimisrežiim
**Ideaalne üksikarendajatele ja pidevaks õppimiseks**

**Omadused:**
- **Brauseripõhine liides**: MkDocs-põhine töötuba, mis on ligipääsetav igast veebibrauserist
- **GitHub Codespaces integratsioon**: Ühe klõpsuga arenduskeskkond eelkonfigureeritud tööriistadega
- **Interaktiivne DevContainer keskkond**: Kohalikku seadistust pole vaja - alusta kohe koodikirjutamist
- **Edenemise jälgimine**: Sisseehitatud kontrollpunktid ja valideerimisharjutused
- **Kogukonna tugi**: Juurdepääs Azure'i Discordi kanalitele küsimuste ja koostöö jaoks

**Õppimise Struktuur:**
- **Paindlik ajakava**: Lõpeta peatükid omas tempos päevade või nädalate jooksul
- **Kontrollpunktide süsteem**: Kinnita õpitut enne keerukamate teemade juurde liikumist
- **Ressursikogu**: Põhjalik dokumentatsioon, näited ja tõrkeotsingu juhendid
- **Portfoolio arendamine**: Loo juurutatavaid projekte oma professionaalse portfoolio jaoks

**Alustamine (iseseisev):**
```bash
# Valik 1: GitHub Codespaces (soovitatav)
# Liigu repositooriumisse ja klõpsa "Code" → "Create codespace on main"

# Valik 2: Kohalik arendus
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Järgi seadistusjuhiseid workshop/README.md failis
```

#### 🏛️ Juhendatud Töötuba
**Ideaalne ettevõtete koolitusteks, kiirkursusteks ja haridusasutustele**

**Töötoa Formaadid:**

**📚 Akadeemiline Kursus (8-12 nädalat)**
- **Ülikooliprogrammid**: Semestripikkune kursus iganädalaste 2-tunniste sessioonidega
- **Kiirkursuse Formaat**: Intensiivne 3-5-päevane programm igapäevaste 6-8-tunniste sessioonidega
- **Ettevõtete Koolitus**: Igakuised meeskonnasessioonid praktiliste projektide elluviimiseks
- **Hindamisraamistik**: Hinnatud ülesanded, kaaslaste ülevaated ja lõppprojektid

**🚀 Intensiivne Töötuba (1-3 päeva)**
- **1. päev**: Alused + AI arendus (peatükid 1-2) - 6 tundi
- **2. päev**: Seadistamine + Infrastruktuur (peatükid 3-4) - 6 tundi  
- **3. päev**: Täiustatud mustrid + Tootmine (peatükid 5-8) - 8 tundi
- **Järeltegevus**: Valikuline 2-nädalane mentorlus projekti lõpetamiseks

**⚡ Juhtide Lühikursus (4-6 tundi)**
- **Strateegiline Ülevaade**: AZD väärtuspakkumine ja äriline mõju (1 tund)
- **Praktiline Demo**: AI rakenduse juurutamine algusest lõpuni (2 tundi)
- **Arhitektuuri Ülevaade**: Ettevõtte mustrid ja haldus (1 tund)
- **Rakendamise Plaan**: Organisatsiooni kasutuselevõtu strateegia (1-2 tundi)

#### 🛠️ Töötoa Õppemetoodika
**Avastamine → Juurutamine → Kohandamine lähenemine praktiliste oskuste arendamiseks**

**1. Faas: Avastamine (45 minutit)**
- **Mallide Uurimine**: Hinda Azure AI Foundry malle ja teenuseid
- **Arhitektuuri Analüüs**: Mõista mitmeagendilisi mustreid ja juurutusstrateegiaid
- **Nõuete Hindamine**: Tuvasta organisatsiooni vajadused ja piirangud
- **Keskkonna Seadistamine**: Konfigureeri arenduskeskkond ja Azure'i ressursid

**2. Faas: Juurutamine (2 tundi)**
- **Juhendatud Rakendamine**: Samm-sammuline AI rakenduste juurutamine AZD-ga
- **Teenuste Seadistamine**: Konfigureeri Azure AI teenused, lõpp-punktid ja autentimine
- **Turvalisuse Rakendamine**: Kasuta ettevõtte turvamustreid ja juurdepääsukontrolle
- **Valideerimise Testimine**: Kinnita juurutused ja lahenda levinud probleemid

**3. Faas: Kohandamine (45 minutit)**
- **Rakenduse Kohandamine**: Kohanda malle konkreetsete kasutusjuhtude ja nõuete jaoks
- **Tootmise Optimeerimine**: Rakenda monitooringu, kulude haldamise ja skaleerimise strateegiaid
- **Täiustatud Mustrid**: Uuri mitmeagendilist koordineerimist ja keerulisi arhitektuure
- **Järgmiste Sammude Plaan**: Määra õpitee edasiste oskuste arendamiseks

#### 🎯 Töötoa Õpitulemused
**Mõõdetavad oskused, mis arendatakse praktilise harjutamise kaudu**

**Tehnilised Kompetentsid:**
- **Tootmiskõlblike AI Rakenduste Juurutamine**: Edukas AI-lahenduste juurutamine ja seadistamine
- **Infrastruktuuri Koodina Valdamine**: Kohandatud Bicep mallide loomine ja haldamine
- **Mitmeagendiline Arhitektuur**: Koordineeritud AI agentide lahenduste rakendamine
- **Tootmisvalmidus**: Turvalisuse, monitooringu ja haldusmustrite rakendamine
- **Tõrkeotsingu Oskused**: Juurutamis- ja seadistusprobleemide iseseisev lahendamine

**Professionaalsed Oskused:**
- **Projekti Juhtimine**: Juhi tehnilisi meeskondi pilve juurutamise algatustes
- **Arhitektuuri Kujundamine**: Kujunda skaleeritavaid ja kulutõhusaid Azure'i lahendusi
- **Teadmiste Edastamine**: Koolita ja juhenda kolleege AZD parimates tavades
- **Strateegiline Planeerimine**: Mõjuta organisatsiooni pilve kasutuselevõtu strateegiaid

#### 📋 Töötoa Ressursid ja Materjalid
**Põhjalik tööriistakomplekt juhendajatele ja õppijatele**

**Juhendajatele:**
- **Juhendaja Juhend**: [Töötoa Juhend](workshop/docs/instructor-guide.md) - Sessioonide planeerimise ja läbiviimise näpunäited
- **Esitlusmaterjalid**: Slaidid, arhitektuuridiagrammid ja demo skriptid
- **Hindamisvahendid**: Praktilised harjutused, teadmiste kontrollid ja hindamisrubriigid
- **Tehniline Seadistus**: Keskkonna seadistamine, tõrkeotsingu juhendid ja varuplaanid

**Õppijatele:**
- **Interaktiivne Töötoa Keskkond**: [Töötoa Materjalid](workshop/README.md) - Brauseripõhine õppeplatvorm
- **Samm-sammult Juhised**: [Juhendatud Harjutused](../../workshop/docs/instructions) - Üksikasjalikud rakendamise juhendid  
- **Viitedokumentatsioon**: [AI Töötoa Labor](docs/ai-foundry/ai-workshop-lab.md) - AI-keskne süvitsi minek
- **Kogukonna Ressursid**: Azure'i Discordi kanalid, GitHubi arutelud ja ekspertide tugi

#### 🏢 Ettevõtte Töötoa Rakendamine
**Organisatsiooni juurutamise ja koolituse strateegiad**

**Ettevõtete Koolitusprogrammid:**
- **Arendajate Sisseelamine**: Uute töötajate orienteerumine AZD põhialustega (2-4 nädalat)
- **Meeskonna Oskuste Tõstmine**: Kvartalipõhised töötoad olemasolevatele arendajatele (1-2 päeva)
- **Arhitektuuri Ülevaade**: Igakuised sessioonid vaneminseneridele ja arhitektidele (4 tundi)
- **Juhtide Koolitused**: Tehniliste otsustajate töötoad (pool päeva)

**Rakendamise Tugi:**
- **Kohandatud Töötoa Kujundus**: Kohandatud sisu konkreetsete organisatsiooniliste vajaduste jaoks
- **Pilootprogrammi Juhtimine**: Struktureeritud juurutus koos edumõõdikute ja tagasiside tsüklitega  
- **Jätkuv Mentorlus**: Töötoa järgnev tugi projektide elluviimiseks
- **Kogukonna Loomine**: Sisemised Azure AI arendajate kogukonnad ja teadmiste jagamine

**Edu Mõõdikud:**
- **Oskuste Omandamine**: Eel- ja järelhindamised tehnilise pädevuse kasvu mõõtmiseks
- **Juurutamise Edu**: Osalejate protsent, kes edukalt juurutavad tootmislahendusi
- **Tootlikkuse Aeg**: Vähenenud sisseelamisaeg uute Azure AI projektide jaoks
- **Teadmiste Säilitamine**: Järelhindamised 3-6 kuud pärast töötuba

## 8-Peatükiline Õppimisstruktuur

### Peatükk 1: Alused ja Kiirstart (30-45 minutit) 🌱
**Eeltingimused**: Azure'i tellimus, põhiteadmised käsureast  
**Keerukus**: ⭐

#### Mida Õpid
- Azure Developer CLI põhialuste mõistmine
- AZD paigaldamine oma platvormile  
- Esimese eduka juurutuse tegemine
- Põhimõisted ja terminoloogia

#### Õppematerjalid
- [AZD Alused](docs/getting-started/azd-basics.md) - Põhimõisted
- [Paigaldus ja Seadistamine](docs/getting-started/installation.md) - Platvormispetsiifilised juhendid
- [Sinu Esimene Projekt](docs/getting-started/first-project.md) - Praktiline juhend
- [Käskude Spikker](resources/cheat-sheet.md) - Kiirviide

#### Praktiline Tulemus
Lihtsa veebirakenduse edukas juurutamine Azure'i kasutades AZD-d

---

### Peatükk 2: AI-Keskne Arendus (1-2 tundi) 🤖
**Eeltingimused**: Peatükk 1 lõpetatud  
**Keerukus**: ⭐⭐

#### Mida Õpid
- Microsoft Foundry integratsioon AZD-ga
- AI-toega rakenduste juurutamine
- AI-teenuste seadistuste mõistmine
- RAG (Retrieval-Augmented Generation) mustrid

#### Õppematerjalid
- [Microsoft Foundry Integratsioon](docs/microsoft-foundry/microsoft-foundry-integration.md)
- [AI Mudeli Juurutamine](docs/microsoft-foundry/ai-model-deployment.md)
- [AI Töötoa Labor](docs/microsoft-foundry/ai-workshop-lab.md) - **UUS**: Põhjalik 2-3-tunnine praktiline labor
- [Interaktiivne Töötoa Juhend](workshop/README.md) - **UUS**: Brauseripõhine töötuba MkDocs eelvaatega
- [Microsoft Foundry Mallid](README.md#featured-microsoft-foundry-templates)
- [Töötoa Juhised](../../workshop/docs/instructions) - **UUS**: Samm-sammult juhendatud harjutused

#### Praktiline Tulemus
AI-toega vestlusrakenduse juurutamine ja seadistamine RAG võimekusega

#### Töötoa Õppimistee (Valikuline Täiendus)
**UUS Interaktiivne Kogemus**: [Täielik Töötoa Juhend](workshop/README.md)
1. **Avastamine** (30 min): Malli valik ja hindamine
2. **Juurutamine** (45 min): AI malli funktsionaalsuse juurutamine ja valideerimine  
3. **Lammutamine** (30 min): Malli arhitektuuri ja komponentide mõistmine
4. **Seadistamine** (30 min): Seadete ja parameetrite kohandamine
5. **Kohandamine** (45 min): Muuda ja täiusta, et see vastaks sinu vajadustele
6. **Eemaldamine** (15 min): Ressursside puhastamine ja elutsükli mõistmine
7. **Kokkuvõte** (15 min): Järgmised sammud ja täiustatud õppimisteed

---

### Peatükk 3: Seadistamine ja Autentimine (45-60 minutit) ⚙️
**Eeltingimused**: Peatükk 1 lõpetatud  
**Keerukus**: ⭐⭐

#### Mida Õpid
- Keskkonna seadistamine ja haldamine
- Autentimise ja turvalisuse parimad tavad
- Ressursside nimetamine ja organiseerimine
- Mitme keskkonna juurutused

#### Õppematerjalid
- [Seadistamise Juhend](docs/getting-started/configuration.md) - Keskkonna seadistamine
- [Autentimise ja Turvalisuse Mustrid](docs/getting-started/authsecurity.md) - Hallatud identiteet ja Key Vault integratsioon
- Mitme keskkonna näited

#### Praktiline Tulemus
Mitme keskkonna haldamine koos korrektse autentimise ja turvalisusega

---

### Peatükk 4: Infrastruktuur Koodina ja Juurutamine (1-1.5 tundi) 🏗️
**Eeltingimused**: Peatükid 1-3 lõpetatud  
**Keerukus**: ⭐⭐⭐

#### Mida Õpid
- Täiustatud juurutusmustrid
- Infrastruktuur koodina Bicepiga
- Ressursside varustamise strateegiad
- Kohandatud mallide loomine

- Konteineriseeritud rakenduste juurutamine Azure Container Apps ja AZD abil

#### Õppematerjalid
- [Juurutamise Juhend](docs/deployment/deployment-guide.md) - Täielikud töövood
- [Ressursside Varustamine](docs/deployment/provisioning.md) - Ressursside haldamine
- Konteinerite ja mikroteenuste näited
- [Konteinerirakenduste Näited](examples/container-app/README.md) - Kiirstart, tootmine ja täiustatud juurutusmustrid

#### Praktiline Tulemus
Keeruliste mitme teenusega rakenduste juurutamine kohandatud infrastruktuurimallide abil

---

### Peatükk 5: Mitmeagendilised AI Lahendused (2-3 tundi) 🤖🤖
**Eeltingimused**: Peatükid 1-2 lõpetatud  
**Keerukus**: ⭐⭐⭐⭐

#### Mida Õpid
- Mitmeagendilised arhitektuurimustrid
- Agentide orkestreerimine ja koordineerimine
- Tootmiskõlblikud AI juurutused
- Kliendi
Valideeri ja optimeeri juurutused enne täideviimist

---

### 7. peatükk: Tõrkeotsing ja silumine (1-1,5 tundi) 🔧
**Eeltingimused**: Mis tahes juurutuspeatükk lõpetatud  
**Keerukus**: ⭐⭐

#### Mida õpid
- Süsteemsed silumismeetodid
- Levinumad probleemid ja lahendused
- AI-spetsiifiline tõrkeotsing
- Jõudluse optimeerimine

#### Õppematerjalid
- [Levinumad probleemid](docs/troubleshooting/common-issues.md) - KKK ja lahendused
- [Silumisjuhend](docs/troubleshooting/debugging.md) - Samm-sammuline juhend
- [AI-spetsiifiline tõrkeotsing](docs/troubleshooting/ai-troubleshooting.md) - AI-teenuste probleemid

#### Praktiline tulemus
Iseseisev võime diagnoosida ja lahendada levinud juurutusprobleeme

---

### 8. peatükk: Tootmine ja ettevõtte mustrid (2-3 tundi) 🏢
**Eeltingimused**: Peatükid 1-4 lõpetatud  
**Keerukus**: ⭐⭐⭐⭐

#### Mida õpid
- Tootmisesse juurutamise strateegiad
- Ettevõtte turvalisuse mustrid
- Jälgimine ja kulude optimeerimine
- Laiendatavus ja haldus

- Parimad tavad tootmiskonteinerite rakenduste juurutamiseks (turvalisus, jälgimine, kulud, CI/CD)

#### Õppematerjalid
- [Tootmise AI parimad tavad](docs/microsoft-foundry/production-ai-practices.md) - Ettevõtte mustrid
- Mikroteenuste ja ettevõtte näited
- Jälgimise ja halduse raamistikud
- [Mikroteenuste arhitektuuri näide](../../examples/container-app/microservices) - Blue-green/kanarijuurutus, hajutatud jälgimine ja kulude optimeerimine

#### Praktiline tulemus
Juurutada ettevõttevalmis rakendusi täielike tootmisvõimalustega

---

## Õppimise edenemine ja keerukus

### Oskuste järkjärguline arendamine

- **🌱 Algajad**: Alusta 1. peatükist (Alused) → 2. peatükk (AI arendus)
- **🔧 Kesktase**: Peatükid 3-4 (Konfiguratsioon ja infrastruktuur) → 6. peatükk (Valideerimine)
- **🚀 Edasijõudnud**: 5. peatükk (Multi-agent lahendused) → 7. peatükk (Tõrkeotsing)
- **🏢 Ettevõtte tase**: Lõpeta kõik peatükid, keskendu 8. peatükile (Tootmise mustrid)

- **Konteinerirakenduste tee**: Peatükid 4 (Konteineriseeritud juurutus), 5 (Mikroteenuste integreerimine), 8 (Tootmise parimad tavad)

### Keerukuse näitajad

- **⭐ Põhitase**: Üksikud kontseptsioonid, juhendatud õpetused, 30-60 minutit
- **⭐⭐ Kesktase**: Mitu kontseptsiooni, praktiline harjutus, 1-2 tundi  
- **⭐⭐⭐ Edasijõudnud**: Keerukad arhitektuurid, kohandatud lahendused, 1-3 tundi
- **⭐⭐⭐⭐ Ekspert**: Tootmissüsteemid, ettevõtte mustrid, 2-4 tundi

### Paindlikud õpiteed

#### 🎯 AI arendaja kiirtee (4-6 tundi)
1. **1. peatükk**: Alused ja kiire algus (45 minutit)
2. **2. peatükk**: AI-põhine arendus (2 tundi)  
3. **5. peatükk**: Multi-agent AI lahendused (3 tundi)
4. **8. peatükk**: Tootmise AI parimad tavad (1 tund)

#### 🛠️ Infrastruktuuri spetsialisti tee (5-7 tundi)
1. **1. peatükk**: Alused ja kiire algus (45 minutit)
2. **3. peatükk**: Konfiguratsioon ja autentimine (1 tund)
3. **4. peatükk**: Infrastruktuur koodina ja juurutus (1,5 tundi)
4. **6. peatükk**: Eeljuurutuse valideerimine ja planeerimine (1 tund)
5. **7. peatükk**: Tõrkeotsing ja silumine (1,5 tundi)
6. **8. peatükk**: Tootmine ja ettevõtte mustrid (2 tundi)

#### 🎓 Täielik õpiteekond (8-12 tundi)
Kõigi 8 peatüki järjestikune läbimine koos praktilise harjutamise ja valideerimisega

## Kursuse lõpetamise raamistik

### Teadmiste valideerimine
- **Peatüki kontrollpunktid**: Praktilised harjutused mõõdetavate tulemustega
- **Käed-külge kinnitamine**: Töötavate lahenduste juurutamine iga peatüki jaoks
- **Edenemise jälgimine**: Visuaalsed näitajad ja lõpetamise märgid
- **Kogukonna valideerimine**: Kogemuste jagamine Azure Discordi kanalites

### Õpitulemuste hindamine

#### Peatükkide 1-2 lõpetamine (Alused + AI)
- ✅ Lihtsa veebirakenduse juurutamine AZD abil
- ✅ AI-toega vestlusrakenduse juurutamine RAG-iga
- ✅ AZD põhikontseptsioonide ja AI integratsiooni mõistmine

#### Peatükkide 3-4 lõpetamine (Konfiguratsioon + infrastruktuur)  
- ✅ Mitme keskkonna juurutuste haldamine
- ✅ Kohandatud Bicep infrastruktuuri mallide loomine
- ✅ Turvaliste autentimismustrite rakendamine

#### Peatükkide 5-6 lõpetamine (Multi-agent + valideerimine)
- ✅ Keeruka multi-agent AI lahenduse juurutamine
- ✅ Mahu planeerimine ja kulude optimeerimine
- ✅ Automatiseeritud eeljuurutuse valideerimise rakendamine

#### Peatükkide 7-8 lõpetamine (Tõrkeotsing + tootmine)
- ✅ Tõrkeotsing ja juurutusprobleemide iseseisev lahendamine  
- ✅ Ettevõtte tasemel jälgimise ja turvalisuse rakendamine
- ✅ Tootmisvalmis rakenduste juurutamine koos haldusega

### Sertifitseerimine ja tunnustus
- **Kursuse lõpetamise märk**: Kõigi 8 peatüki praktilise valideerimisega lõpetamine
- **Kogukonna tunnustus**: Aktiivne osalemine Microsoft Foundry Discordis
- **Professionaalne areng**: Tööstusele vastavad AZD ja AI juurutusoskused
- **Karjääri edendamine**: Ettevõttevalmis pilvejuurutusvõimalused

## 🎓 Põhjalikud õpitulemused

### Algtase (Peatükid 1-2)
Pärast algtaseme peatükkide läbimist näitavad õppijad:

**Tehnilised oskused:**
- Lihtsate veebirakenduste juurutamine Azure'i AZD käskude abil
- AI-toega vestlusrakenduste konfigureerimine ja juurutamine RAG-iga
- AZD põhikontseptsioonide mõistmine: mallid, keskkonnad, ettevalmistusvood
- Microsoft Foundry teenuste integreerimine AZD juurutustega
- Azure AI teenuste konfiguratsioonide ja API lõpp-punktide navigeerimine

**Professionaalsed oskused:**
- Struktureeritud juurutusvoogude järgimine järjepidevate tulemuste saavutamiseks
- Põhiliste juurutusprobleemide tõrkeotsing logide ja dokumentatsiooni abil
- Pilvejuurutusprotsesside tõhus selgitamine
- Parimate tavade rakendamine turvaliseks AI-teenuste integreerimiseks

**Õppimise valideerimine:**
- ✅ Edukas `todo-nodejs-mongo` malli juurutamine
- ✅ `azure-search-openai-demo` juurutamine ja konfigureerimine RAG-iga
- ✅ Interaktiivsete töötubade harjutuste lõpetamine (Avastusfaas)
- ✅ Osalemine Azure Discordi kogukonna aruteludes

### Kesktase (Peatükid 3-4)
Pärast kesktaseme peatükkide läbimist näitavad õppijad:

**Tehnilised oskused:**
- Mitme keskkonna juurutuste haldamine (arendus, testimine, tootmine)
- Kohandatud Bicep mallide loomine infrastruktuuri koodina
- Turvaliste autentimismustrite rakendamine hallatud identiteediga
- Keerukate mitme teenuse rakenduste juurutamine kohandatud konfiguratsioonidega
- Ressursside ettevalmistusstrateegiate optimeerimine kulude ja jõudluse jaoks

**Professionaalsed oskused:**
- Laiendatavate infrastruktuuriarhitektuuride kujundamine
- Pilvejuurutuste turvalisuse parimate tavade rakendamine
- Infrastruktuurimustrite dokumenteerimine meeskonnatööks
- Sobivate Azure'i teenuste hindamine ja valimine nõuete alusel

**Õppimise valideerimine:**
- ✅ Eraldi keskkondade konfigureerimine keskkonnaspetsiifiliste seadistustega
- ✅ Kohandatud Bicep malli loomine ja juurutamine mitme teenuse rakenduse jaoks
- ✅ Hallatud identiteedi autentimise rakendamine turvaliseks juurdepääsuks
- ✅ Konfiguratsioonihalduse harjutuste lõpetamine reaalsete stsenaariumidega

### Edasijõudnud tase (Peatükid 5-6)
Pärast edasijõudnud peatükkide läbimist näitavad õppijad:

**Tehnilised oskused:**
- Multi-agent AI lahenduste juurutamine ja orkestreerimine koordineeritud töövoogudega
- Kliendi- ja inventuuragentide arhitektuuride rakendamine jaekaubanduse stsenaariumide jaoks
- Põhjalik mahu planeerimine ja ressursside valideerimine
- Automatiseeritud eeljuurutuse valideerimise ja optimeerimise täideviimine
- Kulutõhusate SKU valikute kujundamine töökoormuse nõuete alusel

**Professionaalsed oskused:**
- Keerukate AI lahenduste arhitektuur tootmiskeskkondade jaoks
- Tehniliste arutelude juhtimine AI juurutusstrateegiate üle
- Nooremate arendajate juhendamine AZD ja AI juurutuse parimates tavades
- AI arhitektuurimustrite hindamine ja soovitamine ärinõuete jaoks

**Õppimise valideerimine:**
- ✅ Täieliku jaekaubanduse multi-agent lahenduse juurutamine ARM mallidega
- ✅ Agentide koordineerimise ja töövoogude orkestreerimise demonstreerimine
- ✅ Mahu planeerimise harjutuste lõpetamine reaalsete ressursipiirangutega
- ✅ Juurutuse valmisoleku valideerimine automatiseeritud eelkontrollide kaudu

### Ekspertide tase (Peatükid 7-8)
Pärast ekspertide peatükkide läbimist näitavad õppijad:

**Tehnilised oskused:**
- Keerukate juurutusprobleemide iseseisev diagnoosimine ja lahendamine
- Ettevõtte tasemel turvalisuse mustrite ja haldusraamistike rakendamine
- Põhjalike jälgimis- ja häirestrateegiate kujundamine
- Tootmisjuurutuste optimeerimine ulatuse, kulude ja jõudluse jaoks
- CI/CD torujuhtmete loomine koos testimise ja valideerimisega

**Professionaalsed oskused:**
- Ettevõtte pilvetransformatsiooni algatuste juhtimine
- Organisatsiooniliste juurutusstandardite kujundamine ja rakendamine
- Arendustiimide koolitamine edasijõudnud AZD praktikates
- Tehniliste otsuste mõjutamine ettevõtte AI juurutuste jaoks

**Õppimise valideerimine:**
- ✅ Keerukate mitme teenuse juurutusvigade lahendamine
- ✅ Ettevõtte turvalisuse mustrite rakendamine vastavusnõuetega
- ✅ Tootmise jälgimise kujundamine ja juurutamine Application Insightsiga
- ✅ Ettevõtte haldusraamistiku rakendamise lõpetamine

## 🎯 Kursuse lõpetamise sertifikaat

### Edenemise jälgimise raamistik
Jälgi oma õppeprotsessi struktureeritud kontrollpunktide kaudu:

- [ ] **1. peatükk**: Alused ja kiire algus ✅
- [ ] **2. peatükk**: AI-põhine arendus ✅  
- [ ] **3. peatükk**: Konfiguratsioon ja autentimine ✅
- [ ] **4. peatükk**: Infrastruktuur koodina ja juurutus ✅
- [ ] **5. peatükk**: Multi-agent AI lahendused ✅
- [ ] **6. peatükk**: Eeljuurutuse valideerimine ja planeerimine ✅
- [ ] **7. peatükk**: Tõrkeotsing ja silumine ✅
- [ ] **8. peatükk**: Tootmine ja ettevõtte mustrid ✅

### Verifitseerimisprotsess
Pärast iga peatüki lõpetamist kinnita oma teadmised järgmiselt:

1. **Praktiliste harjutuste lõpetamine**: Töötavate lahenduste juurutamine iga peatüki jaoks
2. **Teadmiste hindamine**: KKK ja enesehindamiste läbivaatamine
3. **Kogukonna kaasamine**: Kogemuste jagamine ja tagasiside saamine Azure Discordis
4. **Portfoolio arendamine**: Oma juurutuste ja õppetundide dokumenteerimine
5. **Kaastöötajate ülevaade**: Koostöö teiste õppijatega keerukate stsenaariumide lahendamisel

### Kursuse lõpetamise eelised
Kõigi peatükkide valideerimisega lõpetajad omandavad:

**Tehniline ekspertiis:**
- **Tootmiskogemus**: Reaalsete AI rakenduste juurutamine Azure'i keskkondadesse
- **Professionaalsed oskused**: Ettevõttevalmis juurutus- ja tõrkeotsinguvõimalused  
- **Arhitektuuri teadmised**: Multi-agent AI lahendused ja keerukad infrastruktuurimustrid
- **Tõrkeotsingu meisterlikkus**: Juurutuse ja konfiguratsiooniprobleemide iseseisev lahendamine

**Professionaalne areng:**
- **Tööstuse tunnustus**: Tõendatavad oskused kõrge nõudlusega AZD ja AI juurutusvaldkondades
- **Karjääri edendamine**: Kvalifikatsioonid pilvearhitekti ja AI juurutusspetsialisti rollide jaoks
- **Kogukonna juhtimine**: Aktiivne liikmelisus Azure'i arendajate ja AI kogukondades
- **Pidev õppimine**: Alus edasijõudnud Microsoft Foundry spetsialiseerumiseks

**Portfoolio varad:**
- **Juurutatud lahendused**: Töötavad näited AI rakendustest ja infrastruktuurimustritest
- **Dokumentatsioon**: Põhjalikud juurutusjuhendid ja tõrkeotsingu protseduurid  
- **Kogukonna panused**: Arutelud, näited ja täiustused jagatud Azure'i kogukonnaga
- **Professionaalne võrgustik**: Kontaktid Azure'i ekspertide ja AI juurutuspraktikutega

### Kursusejärgne õpitee
Lõpetajad on valmis edasijõudnud spetsialiseerumiseks:
- **Microsoft Foundry ekspert**: Sügav spetsialiseerumine AI mudelite juurutamisele ja orkestreerimisele
- **Pilvearhitektuuri juhtimine**: Ettevõtte ulatusega juurutuskujundus ja haldus
- **Arendajate kogukonna juhtimine**: Azure'i näidete ja kogukonna ressursside panustamine
- **Ettevõttesisene koolitus**: AZD ja AI juurutusoskuste õpetamine organisatsioonides

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:  
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame tagada täpsust, palume arvestada, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Algne dokument selle algses keeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitame kasutada professionaalset inimtõlget. Me ei vastuta arusaamatuste või valesti tõlgenduste eest, mis võivad tekkida selle tõlke kasutamise tõttu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->