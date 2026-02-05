# AZD za začetnike: Osnutek tečaja in učni okvir

## Pregled tečaja

Obvladajte Azure Developer CLI (azd) skozi strukturirana poglavja, zasnovana za postopno učenje. **Poseben poudarek na uvajanju AI aplikacij z integracijo Microsoft Foundry.**

### Zakaj je ta tečaj pomemben za sodobne razvijalce

Na podlagi vpogledov iz Microsoft Foundry Discord skupnosti **45 % razvijalcev želi uporabljati AZD za AI delovne obremenitve**, vendar se soočajo z izzivi, kot so:
- Kompleksne večstoritvene AI arhitekture
- Najboljše prakse za uvajanje AI v produkcijo  
- Integracija in konfiguracija Azure AI storitev
- Optimizacija stroškov za AI delovne obremenitve
- Odpravljanje težav pri uvajanju AI specifičnih rešitev

### Glavni učni cilji

Z zaključkom tega strukturiranega tečaja boste:
- **Obvladali osnove AZD**: Temeljni koncepti, namestitev in konfiguracija
- **Uvajali AI aplikacije**: Uporaba AZD z Microsoft Foundry storitvami
- **Implementirali infrastrukturo kot kodo**: Upravljanje Azure virov z Bicep predlogami
- **Reševali težave pri uvajanju**: Odpravljanje pogostih težav in odpravljanje napak
- **Optimizirali za produkcijo**: Varnost, skaliranje, spremljanje in upravljanje stroškov
- **Gradili rešitve z več agenti**: Uvajanje kompleksnih AI arhitektur

## 🎓 Učna izkušnja delavnice

### Prilagodljive možnosti izvedbe učenja
Ta tečaj je zasnovan tako, da podpira tako **samostojno učenje v lastnem tempu** kot tudi **vodene delavnice**, kar omogoča udeležencem praktične izkušnje z AZD in razvoj praktičnih veščin skozi interaktivne vaje.

#### 🚀 Način samostojnega učenja
**Idealno za posamezne razvijalce in kontinuirano učenje**

**Značilnosti:**
- **Vmesnik na osnovi brskalnika**: Delavnica, podprta z MkDocs, dostopna prek katerega koli spletnega brskalnika
- **Integracija z GitHub Codespaces**: Razvojno okolje z enim klikom in predhodno konfiguriranimi orodji
- **Interaktivno okolje DevContainer**: Brez potrebe po lokalni nastavitvi - začnite kodirati takoj
- **Sledenje napredku**: Vgrajene kontrolne točke in validacijske vaje
- **Podpora skupnosti**: Dostop do Azure Discord kanalov za vprašanja in sodelovanje

**Struktura učenja:**
- **Prilagodljiv časovni okvir**: Zaključite poglavja v svojem tempu v nekaj dneh ali tednih
- **Sistem kontrolnih točk**: Validirajte učenje pred prehodom na zahtevnejše teme
- **Knjižnica virov**: Obsežna dokumentacija, primeri in vodniki za odpravljanje težav
- **Razvoj portfelja**: Gradite projekte, ki jih lahko vključite v svoj profesionalni portfelj

**Začetek (samostojno učenje):**
```bash
# Možnost 1: GitHub Codespaces (Priporočeno)
# Pomaknite se do repozitorija in kliknite "Koda" → "Ustvari codespace na glavni"

# Možnost 2: Lokalni razvoj
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Sledite navodilom za nastavitev v workshop/README.md
```

#### 🏛️ Vodene delavnice
**Idealno za korporativno usposabljanje, bootcampe in izobraževalne ustanove**

**Možnosti formata delavnic:**

**📚 Integracija v akademske tečaje (8-12 tednov)**
- **Univerzitetni programi**: Semestrski tečaj z 2-urnimi tedenskimi srečanji
- **Bootcamp format**: Intenzivni 3-5 dnevni program z dnevnimi 6-8 urnimi srečanji
- **Korporativno usposabljanje**: Mesečne timske seje s praktično implementacijo projektov
- **Okvir za ocenjevanje**: Ocenjene naloge, medsebojne ocene in zaključni projekti

**🚀 Intenzivna delavnica (1-3 dni)**
- **1. dan**: Osnove + razvoj AI (Poglavja 1-2) - 6 ur
- **2. dan**: Konfiguracija + infrastruktura (Poglavja 3-4) - 6 ur  
- **3. dan**: Napredni vzorci + produkcija (Poglavja 5-8) - 8 ur
- **Nadaljevanje**: Opcijsko 2-tedensko mentorstvo za dokončanje projekta

**⚡ Izvršni povzetek (4-6 ur)**
- **Strateški pregled**: Vrednost AZD in vpliv na poslovanje (1 ura)
- **Praktična predstavitev**: Uvedba AI aplikacije od začetka do konca (2 uri)
- **Pregled arhitekture**: Vzorci za podjetja in upravljanje (1 ura)
- **Načrtovanje implementacije**: Strategija za sprejetje v organizaciji (1-2 uri)

#### 🛠️ Metodologija učenja delavnic
**Pristop Odkritje → Uvedba → Prilagoditev za praktičen razvoj veščin**

**Faza 1: Odkritje (45 minut)**
- **Raziskovanje predlog**: Ocenjevanje predlog in storitev Azure AI Foundry
- **Analiza arhitekture**: Razumevanje vzorcev z več agenti in strategij uvajanja
- **Ocena zahtev**: Identifikacija potreb in omejitev organizacije
- **Nastavitev okolja**: Konfiguracija razvojnega okolja in Azure virov

**Faza 2: Uvedba (2 uri)**
- **Vodena implementacija**: Korak za korakom uvedba AI aplikacij z AZD
- **Konfiguracija storitev**: Nastavitev Azure AI storitev, končnih točk in avtentikacije
- **Implementacija varnosti**: Uporaba vzorcev za varnost v podjetjih in nadzor dostopa
- **Validacijsko testiranje**: Preverjanje uvedb in odpravljanje pogostih težav

**Faza 3: Prilagoditev (45 minut)**
- **Prilagoditev aplikacije**: Prilagoditev predlog za specifične primere uporabe in zahteve
- **Optimizacija za produkcijo**: Implementacija strategij za spremljanje, upravljanje stroškov in skaliranje
- **Napredni vzorci**: Raziskovanje koordinacije več agentov in kompleksnih arhitektur
- **Načrtovanje naslednjih korakov**: Določitev učne poti za nadaljnji razvoj veščin

#### 🎯 Rezultati učenja delavnic
**Merljive veščine, razvite skozi praktično delo**

**Tehnične kompetence:**
- **Uvajanje produkcijskih AI aplikacij**: Uspešna uvedba in konfiguracija rešitev, ki temeljijo na AI
- **Obvladovanje infrastrukture kot kode**: Ustvarjanje in upravljanje prilagojenih Bicep predlog
- **Arhitektura z več agenti**: Implementacija koordiniranih rešitev z AI agenti
- **Pripravljenost na produkcijo**: Uporaba vzorcev za varnost, spremljanje in upravljanje
- **Strokovnost pri odpravljanju težav**: Samostojno reševanje težav pri uvajanju in konfiguraciji

**Profesionalne veščine:**
- **Vodenje projektov**: Vodenje tehničnih ekip pri pobudah za uvajanje v oblak
- **Oblikovanje arhitekture**: Načrtovanje skalabilnih in stroškovno učinkovitih Azure rešitev
- **Prenos znanja**: Usposabljanje in mentorstvo sodelavcev o najboljših praksah AZD
- **Strateško načrtovanje**: Vplivanje na strategije organizacijskega sprejemanja oblaka

#### 📋 Viri in materiali za delavnice
**Celovit komplet za izvajalce in udeležence**

**Za izvajalce:**
- **Vodnik za inštruktorje**: [Vodnik za izvedbo delavnice](workshop/docs/instructor-guide.md) - Nasveti za načrtovanje in izvedbo sej
- **Predstavitveni materiali**: Predstavitvene prosojnice, diagrami arhitekture in skripte za demonstracije
- **Orodja za ocenjevanje**: Praktične vaje, preverjanje znanja in ocenjevalni obrazci
- **Tehnična nastavitev**: Konfiguracija okolja, vodniki za odpravljanje težav in rezervni načrti

**Za udeležence:**
- **Interaktivno okolje delavnice**: [Materiali za delavnico](workshop/README.md) - Platforma za učenje na osnovi brskalnika
- **Korak za korakom navodila**: [Vodene vaje](../../workshop/docs/instructions) - Podrobni postopki implementacije  
- **Referenčna dokumentacija**: [AI delavnica](docs/ai-foundry/ai-workshop-lab.md) - Poglobljeni vpogledi v AI
- **Viri skupnosti**: Azure Discord kanali, GitHub razprave in strokovna podpora

#### 🏢 Izvedba delavnic za podjetja
**Strategije za uvajanje in usposabljanje v organizacijah**

**Programi za korporativno usposabljanje:**
- **Uvajanje razvijalcev**: Orientacija novih zaposlenih z osnovami AZD (2-4 tedne)
- **Nadgradnja ekipe**: Četrtletne delavnice za obstoječe razvojne ekipe (1-2 dni)
- **Pregled arhitekture**: Mesečne seje za višje inženirje in arhitekte (4 ure)
- **Brifingi za vodstvo**: Delavnice za tehnične odločevalce (pol dneva)

**Podpora pri implementaciji:**
- **Oblikovanje prilagojenih delavnic**: Prilagojena vsebina za specifične potrebe organizacije
- **Upravljanje pilotnih programov**: Strukturirano uvajanje z merili uspeha in povratnimi informacijami  
- **Nadaljnje mentorstvo**: Podpora po delavnici za implementacijo projektov
- **Gradnja skupnosti**: Notranje Azure AI skupnosti razvijalcev in deljenje znanja

**Merila uspeha:**
- **Pridobivanje veščin**: Predhodne/naknadne ocene za merjenje rasti tehničnih kompetenc
- **Uspešnost uvajanja**: Delež udeležencev, ki uspešno uvajajo produkcijske aplikacije
- **Čas do produktivnosti**: Skrajšan čas uvajanja za nove Azure AI projekte
- **Ohranjanje znanja**: Naknadne ocene 3-6 mesecev po delavnici

## 8-poglavna struktura učenja

### Poglavje 1: Osnove in hiter začetek (30-45 minut) 🌱
**Predpogoji**: Azure naročnina, osnovno znanje ukazne vrstice  
**Kompleksnost**: ⭐

#### Kaj se boste naučili
- Razumevanje osnov Azure Developer CLI
- Namestitev AZD na vaši platformi  
- Vaša prva uspešna uvedba
- Temeljni koncepti in terminologija

#### Učni viri
- [Osnove AZD](docs/getting-started/azd-basics.md) - Temeljni koncepti
- [Namestitev in nastavitev](docs/getting-started/installation.md) - Vodniki za specifične platforme
- [Vaš prvi projekt](docs/getting-started/first-project.md) - Praktični vodič
- [Pomočnik za ukaze](resources/cheat-sheet.md) - Hiter referenčni vodnik

#### Praktični rezultat
Uspešno uvedite preprosto spletno aplikacijo na Azure z uporabo AZD

---

### Poglavje 2: Razvoj z AI v ospredju (1-2 uri) 🤖
**Predpogoji**: Zaključeno poglavje 1  
**Kompleksnost**: ⭐⭐

#### Kaj se boste naučili
- Integracija Microsoft Foundry z AZD
- Uvajanje aplikacij, ki temeljijo na AI
- Razumevanje konfiguracij AI storitev
- Vzorci RAG (Retrieval-Augmented Generation)

#### Učni viri
- [Integracija Microsoft Foundry](docs/microsoft-foundry/microsoft-foundry-integration.md)
- [Uvajanje AI modelov](docs/microsoft-foundry/ai-model-deployment.md)
- [AI delavnica](docs/microsoft-foundry/ai-workshop-lab.md) - **NOVO**: Celovita 2-3 urna praktična delavnica
- [Interaktivni vodnik za delavnico](workshop/README.md) - **NOVO**: Delavnica na osnovi brskalnika z MkDocs predogledom
- [Predloge Microsoft Foundry](README.md#featured-microsoft-foundry-templates)
- [Navodila za delavnico](../../workshop/docs/instructions) - **NOVO**: Vodene vaje korak za korakom

#### Praktični rezultat
Uvedite in konfigurirajte AI-podprto klepetalno aplikacijo z zmogljivostmi RAG

#### Učna pot delavnice (opcijsko izboljšanje)
**NOVO Interaktivna izkušnja**: [Celoten vodnik za delavnico](workshop/README.md)
1. **Odkritje** (30 min): Izbira in ocena predlog
2. **Uvedba** (45 min): Uvedba in validacija funkcionalnosti AI predloge  
3. **Razčlenitev** (30 min): Razumevanje arhitekture in komponent predloge
4. **Konfiguracija** (30 min): Prilagoditev nastavitev in parametrov
5. **Prilagoditev** (45 min): Spreminjanje in prilagajanje predloge
6. **Odstranitev** (15 min): Čiščenje virov in razumevanje življenjskega cikla
7. **Zaključek** (15 min): Naslednji koraki in napredne učne poti

---

### Poglavje 3: Konfiguracija in avtentikacija (45-60 minut) ⚙️
**Predpogoji**: Zaključeno poglavje 1  
**Kompleksnost**: ⭐⭐

#### Kaj se boste naučili
- Konfiguracija in upravljanje okolja
- Najboljše prakse za avtentikacijo in varnost
- Poimenovanje virov in organizacija
- Uvajanje v več okoljih

#### Učni viri
- [Vodnik za konfiguracijo](docs/getting-started/configuration.md) - Nastavitev okolja
- [Varnostni vzorci za avtentikacijo](docs/getting-started/authsecurity.md) - Integracija z upravljano identiteto in Key Vault
- Primeri za več okolij

#### Praktični rezultat
Upravljajte več okolij z ustrezno avtentikacijo in varnostjo

---

### Poglavje 4: Infrastruktura kot koda in uvajanje (1-1,5 ure) 🏗️
**Predpogoji**: Zaključena poglavja 1-3  
**Kompleksnost**: ⭐⭐⭐

#### Kaj se boste naučili
- Napredni vzorci uvajanja
- Infrastruktura kot koda z Bicep
- Strategije za zagotavljanje virov
- Ustvarjanje prilagojenih predlog

- Uvajanje aplikacij v kontejnerjih z Azure Container Apps in AZD

#### Učni viri
- [Vodnik za uvajanje](docs/deployment/deployment-guide.md) - Celoviti delovni tokovi
- [Zagotavljanje virov](docs/deployment/provisioning.md) - Upravljanje virov
- Primeri kontejnerjev in mikrostoritev
- [Primeri aplikacij v kontejnerjih](examples/container-app/README.md) - Hiter začetek, produkcija in napredni vzorci uvajanja

#### Praktični rezultat
Uvedite kompleksne večstoritvene aplikacije z uporabo prilagojenih predlog za infrastrukturo

---

### Poglavje 5: Rešitve z več agenti AI (2-3 ure) 🤖🤖
**Predpogoji**: Zaključena poglavja 1-2  
**Kompleksnost**: ⭐⭐⭐⭐

#### Kaj se boste naučili
- Vzorci arhitekture z več agenti
- Orkestracija in koordinacija agentov
- Produkcijsko pripravljene AI uvedbe
- Implementacije agentov za stranke in zaloge

- Integracija mikrostoritev v kontejnerjih kot del rešitev z agenti

#### Učni viri
- [Rešitev z več agenti za maloprodajo](examples/retail-scenario.md) - Celovita implementacija
- [Paket ARM predlog](../../examples/retail-multiagent-arm-template) - Uvedba z enim klikom
- Vzorci koordinacije več agentov
- [Primer arhitekture mikrostoritev](../../examples/container-app/microservices) - Komunikacija med storitvami, asinhrono sporočanje in produkcijska uvedba

#### Praktični rezultat
Uvedite in upravljajte produkcijsko pripravljeno
Preverjanje in optimizacija uvajanj pred izvedbo

---

### Poglavje 7: Odpravljanje težav in razhroščevanje (1-1,5 ure) 🔧
**Predpogoji**: Zaključeno katerokoli poglavje o uvajanju  
**Kompleksnost**: ⭐⭐

#### Kaj se boste naučili
- Sistematični pristopi k razhroščevanju
- Pogoste težave in rešitve
- Odpravljanje težav, specifičnih za umetno inteligenco
- Optimizacija zmogljivosti

#### Učni viri
- [Pogoste težave](docs/troubleshooting/common-issues.md) - Pogosta vprašanja in rešitve
- [Vodnik za razhroščevanje](docs/troubleshooting/debugging.md) - Korak za korakom strategije
- [Odpravljanje težav pri umetni inteligenci](docs/troubleshooting/ai-troubleshooting.md) - Težave pri storitvah umetne inteligence

#### Praktični rezultat
Samostojno diagnosticiranje in reševanje pogostih težav pri uvajanju

---

### Poglavje 8: Proizvodni in poslovni vzorci (2-3 ure) 🏢
**Predpogoji**: Zaključena poglavja 1-4  
**Kompleksnost**: ⭐⭐⭐⭐

#### Kaj se boste naučili
- Strategije za uvajanje v produkcijo
- Varnostni vzorci za podjetja
- Spremljanje in optimizacija stroškov
- Razširljivost in upravljanje

- Najboljše prakse za uvajanje aplikacij v produkciji (varnost, spremljanje, stroški, CI/CD)

#### Učni viri
- [Najboljše prakse za umetno inteligenco v produkciji](docs/microsoft-foundry/production-ai-practices.md) - Poslovni vzorci
- Primeri mikrostoritev in poslovnih aplikacij
- Okviri za spremljanje in upravljanje
- [Primer arhitekture mikrostoritev](../../examples/container-app/microservices) - Uvajanje blue-green/canary, porazdeljeno sledenje in optimizacija stroškov

#### Praktični rezultat
Uvajanje aplikacij, pripravljenih za podjetja, z vsemi produkcijskimi zmogljivostmi

---

## Napredovanje učenja in kompleksnost

### Postopno pridobivanje veščin

- **🌱 Začetniki**: Začnite s poglavjem 1 (Osnove) → Poglavje 2 (Razvoj umetne inteligence)
- **🔧 Srednji nivo**: Poglavja 3-4 (Konfiguracija in infrastruktura) → Poglavje 6 (Preverjanje)
- **🚀 Napredni nivo**: Poglavje 5 (Rešitve z več agenti) → Poglavje 7 (Odpravljanje težav)
- **🏢 Poslovni nivo**: Zaključite vsa poglavja, osredotočite se na poglavje 8 (Produkcijski vzorci)

- **Pot aplikacij v vsebnikih**: Poglavja 4 (Uvajanje v vsebnikih), 5 (Integracija mikrostoritev), 8 (Najboljše prakse za produkcijo)

### Kazalniki kompleksnosti

- **⭐ Osnovno**: Posamezni koncepti, vodeni vodiči, 30-60 minut
- **⭐⭐ Srednje**: Več konceptov, praktične vaje, 1-2 uri  
- **⭐⭐⭐ Napredno**: Kompleksne arhitekture, prilagojene rešitve, 1-3 ure
- **⭐⭐⭐⭐ Strokovno**: Produkcijski sistemi, poslovni vzorci, 2-4 ure

### Prilagodljive učne poti

#### 🎯 Hitri tečaj za razvijalce umetne inteligence (4-6 ur)
1. **Poglavje 1**: Osnove in hiter začetek (45 minut)
2. **Poglavje 2**: Razvoj z umetno inteligenco (2 uri)  
3. **Poglavje 5**: Rešitve z več agenti (3 ure)
4. **Poglavje 8**: Najboljše prakse za umetno inteligenco v produkciji (1 ura)

#### 🛠️ Pot za specialiste za infrastrukturo (5-7 ur)
1. **Poglavje 1**: Osnove in hiter začetek (45 minut)
2. **Poglavje 3**: Konfiguracija in avtentikacija (1 ura)
3. **Poglavje 4**: Infrastruktura kot koda in uvajanje (1,5 ure)
4. **Poglavje 6**: Preverjanje in načrtovanje pred uvajanjem (1 ura)
5. **Poglavje 7**: Odpravljanje težav in razhroščevanje (1,5 ure)
6. **Poglavje 8**: Proizvodni in poslovni vzorci (2 uri)

#### 🎓 Celotna učna pot (8-12 ur)
Zaporedno dokončanje vseh 8 poglavij s praktičnimi vajami in preverjanjem

## Okvir za dokončanje tečaja

### Preverjanje znanja
- **Kontrolne točke poglavij**: Praktične vaje z merljivimi rezultati
- **Praktično preverjanje**: Uvajanje delujočih rešitev za vsako poglavje
- **Sledenje napredku**: Vizualni kazalniki in značke za dokončanje
- **Preverjanje skupnosti**: Deljenje izkušenj v Azure Discord kanalih

### Ocena učnih rezultatov

#### Dokončanje poglavij 1-2 (Osnove + Umetna inteligenca)
- ✅ Uvajanje osnovne spletne aplikacije z uporabo AZD
- ✅ Uvajanje aplikacije za klepet z umetno inteligenco z RAG
- ✅ Razumevanje osnovnih konceptov AZD in integracije umetne inteligence

#### Dokončanje poglavij 3-4 (Konfiguracija + Infrastruktura)  
- ✅ Upravljanje uvajanj v več okoljih
- ✅ Ustvarjanje prilagojenih Bicep predlog za infrastrukturo
- ✅ Implementacija varnih avtentikacijskih vzorcev

#### Dokončanje poglavij 5-6 (Več agentov + Preverjanje)
- ✅ Uvajanje kompleksne rešitve z več agenti
- ✅ Izvedba načrtovanja zmogljivosti in optimizacije stroškov
- ✅ Implementacija avtomatiziranega preverjanja pred uvajanjem

#### Dokončanje poglavij 7-8 (Odpravljanje težav + Produkcija)
- ✅ Samostojno odpravljanje težav pri uvajanju  
- ✅ Implementacija spremljanja in varnosti na ravni podjetja
- ✅ Uvajanje aplikacij, pripravljenih za produkcijo, z upravljanjem

### Certifikacija in priznanje
- **Značka za dokončanje tečaja**: Dokončanje vseh 8 poglavij s praktičnim preverjanjem
- **Priznanje skupnosti**: Aktivno sodelovanje v Microsoft Foundry Discord
- **Poklicni razvoj**: Spretnosti za uvajanje AZD in umetne inteligence, relevantne za industrijo
- **Napredovanje v karieri**: Zmožnosti za uvajanje v oblaku, pripravljene za podjetja

## 🎓 Celoviti učni rezultati

### Osnovna raven (Poglavja 1-2)
Po zaključku osnovnih poglavij bodo udeleženci pokazali:

**Tehnične sposobnosti:**
- Uvajanje preprostih spletnih aplikacij v Azure z uporabo ukazov AZD
- Konfiguracija in uvajanje aplikacij za klepet z umetno inteligenco z RAG funkcionalnostmi
- Razumevanje osnovnih konceptov AZD: predloge, okolja, delovni tokovi za zagotavljanje
- Integracija storitev Microsoft Foundry z uvajanji AZD
- Navigacija po konfiguracijah storitev Azure AI in API končnih točkah

**Poklicne veščine:**
- Sledenje strukturiranim delovnim tokovom uvajanja za dosledne rezultate
- Odpravljanje osnovnih težav pri uvajanju z uporabo dnevnikov in dokumentacije
- Učinkovita komunikacija o procesih uvajanja v oblaku
- Uporaba najboljših praks za varno integracijo storitev umetne inteligence

**Preverjanje učenja:**
- ✅ Uspešno uvajanje predloge `todo-nodejs-mongo`
- ✅ Uvajanje in konfiguracija `azure-search-openai-demo` z RAG
- ✅ Dokončanje interaktivnih delavnic (faza odkrivanja)
- ✅ Sodelovanje v razpravah skupnosti Azure Discord

### Srednja raven (Poglavja 3-4)
Po zaključku srednjih poglavij bodo udeleženci pokazali:

**Tehnične sposobnosti:**
- Upravljanje uvajanj v več okoljih (razvoj, testiranje, produkcija)
- Ustvarjanje prilagojenih Bicep predlog za infrastrukturo kot kodo
- Implementacija varnih avtentikacijskih vzorcev z upravljano identiteto
- Uvajanje kompleksnih aplikacij z več storitvami s prilagojenimi konfiguracijami
- Optimizacija strategij zagotavljanja virov za stroške in zmogljivost

**Poklicne veščine:**
- Načrtovanje razširljivih arhitektur infrastrukture
- Implementacija varnostnih najboljših praks za uvajanja v oblaku
- Dokumentiranje vzorcev infrastrukture za sodelovanje v ekipi
- Vrednotenje in izbira ustreznih storitev Azure za zahteve

**Preverjanje učenja:**
- ✅ Konfiguracija ločenih okolij z nastavitvami, specifičnimi za okolje
- ✅ Ustvarjanje in uvajanje prilagojene Bicep predloge za aplikacijo z več storitvami
- ✅ Implementacija avtentikacije z upravljano identiteto za varen dostop
- ✅ Dokončanje vaj za upravljanje konfiguracije z resničnimi scenariji

### Napredna raven (Poglavja 5-6)
Po zaključku naprednih poglavij bodo udeleženci pokazali:

**Tehnične sposobnosti:**
- Uvajanje in orkestracija rešitev z več agenti z usklajenimi delovnimi tokovi
- Implementacija arhitektur za stranke in agente za zaloge v maloprodajnih scenarijih
- Izvedba celovitega načrtovanja zmogljivosti in preverjanja virov
- Izvajanje avtomatiziranega preverjanja pred uvajanjem in optimizacije
- Načrtovanje stroškovno učinkovitih izbir SKU na podlagi zahtev delovne obremenitve

**Poklicne veščine:**
- Arhitektura kompleksnih rešitev umetne inteligence za produkcijska okolja
- Vodenje tehničnih razprav o strategijah uvajanja umetne inteligence
- Mentoriranje mlajših razvijalcev o najboljših praksah za uvajanje AZD in umetne inteligence
- Vrednotenje in priporočanje vzorcev arhitekture umetne inteligence za poslovne zahteve

**Preverjanje učenja:**
- ✅ Uvajanje celotne maloprodajne rešitve z več agenti z ARM predlogami
- ✅ Demonstracija usklajevanja agentov in orkestracije delovnih tokov
- ✅ Dokončanje vaj za načrtovanje zmogljivosti z resničnimi omejitvami virov
- ✅ Preverjanje pripravljenosti za uvajanje z avtomatiziranimi preverjanji

### Strokovna raven (Poglavja 7-8)
Po zaključku strokovnih poglavij bodo udeleženci pokazali:

**Tehnične sposobnosti:**
- Diagnosticiranje in reševanje kompleksnih težav pri uvajanju samostojno
- Implementacija varnostnih vzorcev in okvirov za upravljanje na ravni podjetja
- Načrtovanje celovitih strategij spremljanja in opozarjanja
- Optimizacija produkcijskih uvajanj za razširljivost, stroške in zmogljivost
- Vzpostavitev CI/CD cevovodov z ustreznim testiranjem in preverjanjem

**Poklicne veščine:**
- Vodenje iniciativ za preobrazbo oblaka v podjetjih
- Načrtovanje in implementacija organizacijskih standardov za uvajanje
- Usposabljanje in mentoriranje razvojnih ekip v naprednih praksah AZD
- Vplivanje na tehnične odločitve za uvajanja umetne inteligence v podjetjih

**Preverjanje učenja:**
- ✅ Reševanje kompleksnih napak pri uvajanju več storitev
- ✅ Implementacija varnostnih vzorcev za podjetja z zahtevami skladnosti
- ✅ Načrtovanje in uvajanje spremljanja produkcije z Application Insights
- ✅ Dokončanje implementacije okvira za upravljanje podjetij

## 🎯 Certifikacija za dokončanje tečaja

### Okvir za sledenje napredku
Spremljajte svoj napredek pri učenju skozi strukturirane kontrolne točke:

- [ ] **Poglavje 1**: Osnove in hiter začetek ✅
- [ ] **Poglavje 2**: Razvoj z umetno inteligenco ✅  
- [ ] **Poglavje 3**: Konfiguracija in avtentikacija ✅
- [ ] **Poglavje 4**: Infrastruktura kot koda in uvajanje ✅
- [ ] **Poglavje 5**: Rešitve z več agenti ✅
- [ ] **Poglavje 6**: Preverjanje in načrtovanje pred uvajanjem ✅
- [ ] **Poglavje 7**: Odpravljanje težav in razhroščevanje ✅
- [ ] **Poglavje 8**: Proizvodni in poslovni vzorci ✅

### Postopek preverjanja
Po zaključku vsakega poglavja preverite svoje znanje z:

1. **Dokončanje praktičnih vaj**: Uvajanje delujočih rešitev za vsako poglavje
2. **Ocena znanja**: Pregled poglavij s pogostimi vprašanji in samopreverjanje
3. **Sodelovanje v skupnosti**: Deljenje izkušenj in pridobivanje povratnih informacij v Azure Discord
4. **Razvoj portfelja**: Dokumentiranje uvajanj in pridobljenih lekcij
5. **Pregled vrstnikov**: Sodelovanje z drugimi udeleženci pri kompleksnih scenarijih

### Prednosti dokončanja tečaja
Po zaključku vseh poglavij s preverjanjem bodo diplomanti imeli:

**Tehnično strokovnost:**
- **Izkušnje v produkciji**: Uvajanje resničnih aplikacij z umetno inteligenco v okolja Azure
- **Poklicne veščine**: Sposobnosti za uvajanje in odpravljanje težav, pripravljene za podjetja  
- **Arhitekturno znanje**: Rešitve z več agenti in kompleksni infrastrukturni vzorci
- **Obvladovanje odpravljanja težav**: Samostojno reševanje težav pri uvajanju in konfiguraciji

**Poklicni razvoj:**
- **Priznanje v industriji**: Preverljive spretnosti na področju uvajanja AZD in umetne inteligence
- **Napredovanje v karieri**: Kvalifikacije za vloge arhitekta oblaka in specialista za uvajanje umetne inteligence
- **Vodenje skupnosti**: Aktivno članstvo v skupnostih razvijalcev Azure in umetne inteligence
- **Nadaljnje učenje**: Osnova za napredno specializacijo Microsoft Foundry

**Portfeljski dosežki:**
- **Uvedene rešitve**: Delujoči primeri aplikacij z umetno inteligenco in infrastrukturnih vzorcev
- **Dokumentacija**: Celoviti vodiči za uvajanje in postopki za odpravljanje težav  
- **Prispevki skupnosti**: Razprave, primeri in izboljšave, deljene s skupnostjo Azure
- **Poklicna mreža**: Povezave z Azure strokovnjaki in praktiki za uvajanje umetne inteligence

### Pot učenja po tečaju
Diplomanti so pripravljeni na napredno specializacijo v:
- **Microsoft Foundry Expert**: Globoka specializacija za uvajanje in orkestracijo modelov umetne inteligence
- **Vodenje arhitekture oblaka**: Načrtovanje in upravljanje uvajanj na ravni podjetja
- **Vodenje skupnosti razvijalcev**: Prispevanje k vzorcem Azure in virom skupnosti
- **Korporativno usposabljanje**: Poučevanje veščin za uvajanje AZD in umetne inteligence znotraj organizacij

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:  
Ta dokument je bil preveden z uporabo storitve za prevajanje AI [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za ključne informacije priporočamo profesionalni človeški prevod. Ne prevzemamo odgovornosti za morebitne nesporazume ali napačne razlage, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->