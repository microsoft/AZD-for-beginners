<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "aace36eff845763a5b041a4ed9a33e02",
  "translation_date": "2025-09-25T01:32:42+00:00",
  "source_file": "course-outline.md",
  "language_code": "sl"
}
-->
# AZD za začetnike: Osnutek tečaja in učni okvir

## Pregled tečaja

Obvladajte Azure Developer CLI (azd) skozi strukturirana poglavja, zasnovana za postopno učenje. **Poseben poudarek na uvajanju AI aplikacij z integracijo Azure AI Foundry.**

### Zakaj je ta tečaj ključnega pomena za sodobne razvijalce

Na podlagi vpogledov iz skupnosti Azure AI Foundry Discord **45 % razvijalcev želi uporabljati AZD za AI delovne obremenitve**, vendar se soočajo z izzivi, kot so:
- Zapletene večstoritevne AI arhitekture
- Najboljše prakse za uvajanje AI v produkcijo  
- Integracija in konfiguracija storitev Azure AI
- Optimizacija stroškov za AI delovne obremenitve
- Odpravljanje težav pri uvajanju AI aplikacij

### Osnovni učni cilji

Z zaključkom tega strukturiranega tečaja boste:
- **Obvladali osnove AZD**: Temeljni koncepti, namestitev in konfiguracija
- **Uvajali AI aplikacije**: Uporaba AZD z Azure AI Foundry storitvami
- **Implementirali infrastrukturo kot kodo**: Upravljanje Azure virov z Bicep predlogami
- **Odpravljali težave pri uvajanju**: Reševanje pogostih težav in odpravljanje napak
- **Optimizirali za produkcijo**: Varnost, skaliranje, spremljanje in upravljanje stroškov
- **Gradili večagentne rešitve**: Uvajanje kompleksnih AI arhitektur

## 🎓 Izkušnja delavnice

### Prilagodljive možnosti izvedbe učenja
Ta tečaj je zasnovan tako, da podpira **samostojno učenje** in **vodene delavnice**, kar omogoča udeležencem pridobivanje praktičnih izkušenj z AZD ter razvoj uporabnih veščin skozi interaktivne vaje.

#### 🚀 Način samostojnega učenja
**Idealno za posamezne razvijalce in kontinuirano učenje**

**Značilnosti:**
- **Vmesnik na osnovi brskalnika**: Delavnica, ki temelji na MkDocs, dostopna prek katerega koli spletnega brskalnika
- **Integracija z GitHub Codespaces**: Razvojno okolje z enim klikom in predhodno konfiguriranimi orodji
- **Interaktivno okolje DevContainer**: Brez lokalne nastavitve - začnite kodirati takoj
- **Sledenje napredku**: Vgrajene kontrolne točke in validacijske vaje
- **Podpora skupnosti**: Dostop do kanalov Azure Discord za vprašanja in sodelovanje

**Struktura učenja:**
- **Prilagodljiv časovni okvir**: Zaključite poglavja v svojem tempu v nekaj dneh ali tednih
- **Sistem kontrolnih točk**: Validirajte učenje pred prehodom na kompleksnejše teme
- **Knjižnica virov**: Obsežna dokumentacija, primeri in vodniki za odpravljanje težav
- **Razvoj portfelja**: Gradite projekte, ki jih lahko vključite v profesionalni portfelj

**Začetek (samostojno učenje):**
```bash
# Option 1: GitHub Codespaces (Recommended)
# Navigate to the repository and click "Code" → "Create codespace on main"

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow setup instructions in workshop/README.md
```

#### 🏛️ Vodene delavnice
**Idealno za korporativno usposabljanje, bootcampe in izobraževalne ustanove**

**Možnosti formatov delavnic:**

**📚 Akademska integracija tečaja (8-12 tednov)**
- **Univerzitetni programi**: Semestrski tečaj z tedenskimi 2-urnimi sejami
- **Bootcamp format**: Intenzivni 3-5 dnevni program z dnevno 6-8 urami
- **Korporativno usposabljanje**: Mesečne timske seje s praktično implementacijo projektov
- **Okvir ocenjevanja**: Ocenjene naloge, pregled vrstnikov in zaključni projekti

**🚀 Intenzivna delavnica (1-3 dni)**
- **1. dan**: Osnove + AI razvoj (Poglavja 1-2) - 6 ur
- **2. dan**: Konfiguracija + infrastruktura (Poglavja 3-4) - 6 ur  
- **3. dan**: Napredni vzorci + produkcija (Poglavja 5-8) - 8 ur
- **Nadaljevanje**: Opcijsko 2-tedensko mentorstvo za dokončanje projektov

**⚡ Izvršni povzetek (4-6 ur)**
- **Strateški pregled**: Vrednost AZD in vpliv na poslovanje (1 ura)
- **Praktična demonstracija**: Uvajanje AI aplikacije od začetka do konca (2 uri)
- **Pregled arhitekture**: Vzorci za podjetja in upravljanje (1 ura)
- **Načrtovanje implementacije**: Strategija za sprejetje v organizaciji (1-2 uri)

#### 🛠️ Metodologija učenja na delavnici
**Pristop Odkritje → Uvajanje → Prilagoditev za razvoj praktičnih veščin**

**Faza 1: Odkritje (45 minut)**
- **Raziskovanje predlog**: Ocenite predloge in storitve Azure AI Foundry
- **Analiza arhitekture**: Razumevanje večagentnih vzorcev in strategij uvajanja
- **Ocena zahtev**: Identifikacija potreb in omejitev organizacije
- **Nastavitev okolja**: Konfiguracija razvojnega okolja in Azure virov

**Faza 2: Uvajanje (2 uri)**
- **Vodena implementacija**: Korak za korakom uvajanje AI aplikacij z AZD
- **Konfiguracija storitev**: Nastavitev storitev Azure AI, končnih točk in avtentikacije
- **Implementacija varnosti**: Uporaba vzorcev varnosti za podjetja in nadzor dostopa
- **Validacijsko testiranje**: Preverjanje uvajanja in odpravljanje pogostih težav

**Faza 3: Prilagoditev (45 minut)**
- **Modifikacija aplikacije**: Prilagoditev predlog za specifične primere uporabe
- **Optimizacija za produkcijo**: Implementacija spremljanja, upravljanja stroškov in strategij skaliranja
- **Napredni vzorci**: Raziskovanje koordinacije več agentov in kompleksnih arhitektur
- **Načrtovanje naslednjih korakov**: Določitev učne poti za nadaljnji razvoj veščin

#### 🎯 Rezultati učenja na delavnici
**Merljive veščine, pridobljene skozi praktično delo**

**Tehnične kompetence:**
- **Uvajanje produkcijskih AI aplikacij**: Uspešno uvajanje in konfiguracija AI rešitev
- **Obvladovanje infrastrukture kot kode**: Ustvarjanje in upravljanje prilagojenih Bicep predlog
- **Večagentna arhitektura**: Implementacija koordiniranih AI agentov
- **Pripravljenost za produkcijo**: Uporaba vzorcev za varnost, spremljanje in upravljanje
- **Strokovnost pri odpravljanju težav**: Samostojno reševanje težav pri uvajanju in konfiguraciji

**Profesionalne veščine:**
- **Vodenje projektov**: Vodenje tehničnih ekip pri pobudah za uvajanje v oblak
- **Oblikovanje arhitekture**: Oblikovanje skalabilnih in stroškovno učinkovitih rešitev Azure
- **Prenos znanja**: Usposabljanje in mentorstvo sodelavcev o najboljših praksah AZD
- **Strateško načrtovanje**: Vpliv na strategije sprejetja oblaka v organizaciji

#### 📋 Viri in materiali za delavnico
**Celovit komplet za voditelje in udeležence**

**Za voditelje:**
- **Vodnik za inštruktorje**: [Vodnik za izvedbo delavnice](workshop/docs/instructor-guide.md) - Nasveti za načrtovanje in izvedbo sej
- **Predstavitveni materiali**: Diaprojekcije, diagrami arhitekture in skripte za demonstracije
- **Orodja za ocenjevanje**: Praktične vaje, preverjanje znanja in ocenjevalni kriteriji
- **Tehnična nastavitev**: Konfiguracija okolja, vodniki za odpravljanje težav in rezervni načrti

**Za udeležence:**
- **Interaktivno okolje delavnice**: [Materiali za delavnico](workshop/README.md) - Platforma za učenje na osnovi brskalnika
- **Korak za korakom navodila**: [Vodene vaje](../../workshop/docs/instructions) - Podrobni postopki implementacije  
- **Referenčna dokumentacija**: [AI delavnica](docs/ai-foundry/ai-workshop-lab.md) - Poglobljeni vpogledi v AI
- **Viri skupnosti**: Kanali Azure Discord, GitHub razprave in strokovna podpora

#### 🏢 Implementacija delavnic v podjetjih
**Strategije za uvajanje in usposabljanje v organizacijah**

**Programi korporativnega usposabljanja:**
- **Uvajanje razvijalcev**: Orientacija novih zaposlenih z osnovami AZD (2-4 tedne)
- **Nadgradnja ekipe**: Četrtletne delavnice za obstoječe razvojne ekipe (1-2 dni)
- **Pregled arhitekture**: Mesečne seje za višje inženirje in arhitekte (4 ure)
- **Delavnice za vodstvo**: Izvršne delavnice za tehnične odločevalce (pol dneva)

**Podpora pri implementaciji:**
- **Oblikovanje prilagojenih delavnic**: Vsebina prilagojena specifičnim potrebam organizacije
- **Upravljanje pilotnih programov**: Strukturiran uvod z merili uspeha in povratnimi informacijami  
- **Nadaljnje mentorstvo**: Podpora po delavnici za implementacijo projektov
- **Gradnja skupnosti**: Notranje skupnosti razvijalcev Azure AI in deljenje znanja

**Merila uspeha:**
- **Pridobivanje veščin**: Predhodne/naknadne ocene za merjenje rasti tehničnih kompetenc
- **Uspešnost uvajanja**: Delež udeležencev, ki uspešno uvajajo produkcijske aplikacije
- **Čas do produktivnosti**: Zmanjšan čas uvajanja za nove projekte Azure AI
- **Ohranjanje znanja**: Naknadne ocene 3-6 mesecev po delavnici

## Struktura učenja v 8 poglavjih

### Poglavje 1: Osnove in hitri začetek (30-45 minut) 🌱
**Predpogoji**: Azure naročnina, osnovno znanje ukazne vrstice  
**Kompleksnost**: ⭐

#### Kaj boste naučili
- Razumevanje osnov Azure Developer CLI
- Namestitev AZD na vaši platformi  
- Vaše prvo uspešno uvajanje
- Temeljni koncepti in terminologija

#### Učni viri
- [Osnove AZD](docs/getting-started/azd-basics.md) - Temeljni koncepti
- [Namestitev in nastavitev](docs/getting-started/installation.md) - Vodniki za specifične platforme
- [Vaš prvi projekt](docs/getting-started/first-project.md) - Praktični vodič
- [Ukazna kartica](resources/cheat-sheet.md) - Hitra referenca

#### Praktični rezultat
Uspešno uvajanje preproste spletne aplikacije na Azure z uporabo AZD

---

### Poglavje 2: Razvoj z AI v ospredju (1-2 ure) 🤖
**Predpogoji**: Zaključeno poglavje 1  
**Kompleksnost**: ⭐⭐

#### Kaj boste naučili
- Integracija Azure AI Foundry z AZD
- Uvajanje aplikacij, ki temeljijo na AI
- Razumevanje konfiguracij AI storitev
- Vzorci RAG (Retrieval-Augmented Generation)

#### Učni viri
- [Integracija Azure AI Foundry](docs/ai-foundry/azure-ai-foundry-integration.md)
- [Uvajanje AI modelov](docs/ai-foundry/ai-model-deployment.md)
- [AI delavnica](docs/ai-foundry/ai-workshop-lab.md) - **NOVO**: Obsežna 2-3 urna praktična delavnica
- [Interaktivni vodič za delavnico](workshop/README.md) - **NOVO**: Delavnica na osnovi brskalnika z MkDocs predogledom
- [Predloge Azure AI Foundry](README.md#featured-azure-ai-foundry-templates)
- [Navodila za delavnico](../../workshop/docs/instructions) - **NOVO**: Korak za korakom vodene vaje

#### Praktični rezultat
Uvajanje in konfiguracija AI aplikacije za klepet z zmožnostmi RAG

#### Učna pot delavnice (opcijsko izboljšanje)
**NOVO Interaktivna izkušnja**: [Celoten vodič za delavnico](workshop/README.md)
1. **Odkritje** (30 min): Izbor in ocena predlog
2. **Uvajanje** (45 min): Uvajanje in validacija funkcionalnosti AI predloge  
3. **Razčlenitev** (30 min): Razumevanje arhitekture in komponent predloge
4. **Konfiguracija** (30 min): Prilagoditev nastavitev in parametrov
5. **Prilagoditev** (45 min): Modifikacija in iteracija za prilagoditev
6. **Odstranitev** (15 min): Čiščenje virov in razumevanje življenjskega cikla
7. **Zaključek** (15 min): Naslednji koraki in napredne učne poti

---

### Poglavje 3: Konfiguracija in avtentikacija (45-60 minut) ⚙️
**Predpogoji**: Zaključeno poglavje 1  
**Kompleksnost**: ⭐⭐

#### Kaj boste naučili
- Nastavitev in upravljanje okolja
- Najboljše prakse za avtentikacijo in varnost
- Poimenovanje virov in organizacija
- Uvajanje v več okoljih

#### Učni viri
- [Vodnik za konfiguracijo](docs/getting-started/configuration.md) - Nastavitev okolja
- Varnostni vzorci in upravljana identiteta
- Primeri za več okolij

#### Praktični rezultat
Upravljanje več okolij z ustrezno avtentikacijo in varnostjo

---

### Poglavje 4: Infrastruktura kot koda in uvajanje (1-1.5 ure) 🏗️
**Predpogoji**: Zaključena poglavja 1-3  
**Kompleksnost**: ⭐⭐⭐

#### Kaj boste naučili
- Napredni vzorci uvajanja
- Infrastruktura kot koda z Bicep
- Strategije za zagotavljanje virov
- Ustvarjanje prilagojenih predlog

#### Učni viri
- [Vodnik za uvajanje](docs/deployment/deployment-guide.md) - Celotni postopki
- [Zagotavljanje virov](docs/deployment/provisioning.md) - Upravljanje virov
- Primeri za kontejnere in mikrostoritve

#### Praktični rezultat
Uvajanje kompleksnih večstoritevnih aplikacij z uporabo prilagojenih infrastrukturnih predlog

---

### Poglavje 5: Večagentne AI rešitve (2-3 ure) 🤖🤖
**Predpogoji**: Zaključena poglavja 1-2  
**Kompleksnost**: ⭐⭐⭐⭐

#### Kaj boste naučili
- Vzorci večagentne arhitekture
- Orkestracija in koordinacija agentov
- Produkcijsko pripravljene AI uvajanja
- Implementacije agentov za stranke in zaloge

#### Učni viri
- [Večagentna rešitev za maloprodajo](examples/retail-scenario.md) - Celotna implementacija
- [ARM paket predlog](../../examples/retail-multiagent-arm-template) - Uvajanje z enim klikom
- Vzorci koordinacije več agentov

#### Praktični rezultat
Uvajanje in upravljanje produkcijsko pripravljene večagentne AI rešitve

---

### Poglavje 6: Validacija pred uvajanjem in načrtovanje (1 ura) 🔍
**Predpogoji**: Zaključeno poglavje 4  
**Kompleksnost**: ⭐⭐

#### Kaj boste naučili
- Načrtovanje kapacitet in validacija virov
- Strategije izbire SKU
- Predhodni pregledi in avtomatizacija
- Načrtovanje optimizacije stroškov

#### Učni viri
- [Načrtovanje kapacitet](docs/pre-deployment/capacity-planning.md) - Validacija virov
- [Izbira SKU](docs/pre-deployment/sku-selection.md) - Stroškovno učinkovite izbire
- [Predhodni pregledi](docs/pre-deployment/pre
- [AI-Specific Troubleshooting](docs/troubleshooting/ai-troubleshooting.md) - Težave s storitvami AI

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

#### Učni viri
- [Production AI Best Practices](docs/ai-foundry/production-ai-practices.md) - Poslovni vzorci
- Primeri mikroservisov in poslovnih aplikacij
- Okviri za spremljanje in upravljanje

#### Praktični rezultat
Uvajanje aplikacij, pripravljenih za podjetja, z vsemi produkcijskimi zmogljivostmi

---

## Napredovanje učenja in kompleksnost

### Postopno pridobivanje veščin

- **🌱 Začetniki**: Začnite s poglavjem 1 (Osnove) → Poglavje 2 (Razvoj AI)
- **🔧 Srednji nivo**: Poglavja 3-4 (Konfiguracija in infrastruktura) → Poglavje 6 (Validacija)
- **🚀 Napredni nivo**: Poglavje 5 (Rešitve z več agenti) → Poglavje 7 (Odpravljanje težav)
- **🏢 Poslovni nivo**: Zaključite vsa poglavja, osredotočite se na poglavje 8 (Proizvodni vzorci)

### Kazalniki kompleksnosti

- **⭐ Osnovno**: Posamezni koncepti, vodeni vodiči, 30-60 minut
- **⭐⭐ Srednje**: Več konceptov, praktično delo, 1-2 uri  
- **⭐⭐⭐ Napredno**: Kompleksne arhitekture, prilagojene rešitve, 1-3 ure
- **⭐⭐⭐⭐ Strokovno**: Produkcijski sistemi, poslovni vzorci, 2-4 ure

### Prilagodljive učne poti

#### 🎯 Hitri tečaj za razvijalce AI (4-6 ur)
1. **Poglavje 1**: Osnove in hitri začetek (45 minut)
2. **Poglavje 2**: Razvoj AI (2 uri)  
3. **Poglavje 5**: Rešitve z več agenti (3 ure)
4. **Poglavje 8**: Najboljše prakse za produkcijo AI (1 ura)

#### 🛠️ Pot infrastrukture (5-7 ur)
1. **Poglavje 1**: Osnove in hitri začetek (45 minut)
2. **Poglavje 3**: Konfiguracija in avtentikacija (1 ura)
3. **Poglavje 4**: Infrastruktura kot koda in uvajanje (1,5 ure)
4. **Poglavje 6**: Validacija in načrtovanje pred uvajanjem (1 ura)
5. **Poglavje 7**: Odpravljanje težav in odpravljanje napak (1,5 ure)
6. **Poglavje 8**: Proizvodni in poslovni vzorci (2 uri)

#### 🎓 Celotna učna pot (8-12 ur)
Zaporedno dokončanje vseh 8 poglavij s praktičnim delom in validacijo

## Okvir za dokončanje tečaja

### Validacija znanja
- **Kontrolne točke poglavij**: Praktične vaje z merljivimi rezultati
- **Praktična preverjanja**: Uvajanje delujočih rešitev za vsako poglavje
- **Sledenje napredku**: Vizualni kazalniki in značke za dokončanje
- **Validacija skupnosti**: Deljenje izkušenj v kanalih Azure Discord

### Ocena učnih rezultatov

#### Zaključek poglavij 1-2 (Osnove + AI)
- ✅ Uvajanje osnovne spletne aplikacije z uporabo AZD
- ✅ Uvajanje aplikacije za klepet, ki jo poganja AI, z RAG
- ✅ Razumevanje osnovnih konceptov AZD in integracije AI

#### Zaključek poglavij 3-4 (Konfiguracija + infrastruktura)  
- ✅ Upravljanje uvajanj v več okoljih
- ✅ Ustvarjanje prilagojenih predlog infrastrukture Bicep
- ✅ Uvajanje varnih vzorcev avtentikacije

#### Zaključek poglavij 5-6 (Več agentov + validacija)
- ✅ Uvajanje kompleksne rešitve z več agenti AI
- ✅ Izvedba načrtovanja zmogljivosti in optimizacije stroškov
- ✅ Uvajanje avtomatizirane validacije pred uvajanjem

#### Zaključek poglavij 7-8 (Odpravljanje težav + produkcija)
- ✅ Samostojno odpravljanje težav pri uvajanju  
- ✅ Uvajanje spremljanja in varnosti na ravni podjetja
- ✅ Uvajanje aplikacij, pripravljenih za produkcijo, z upravljanjem

### Certifikacija in priznanje
- **Značka za dokončanje tečaja**: Zaključite vseh 8 poglavij s praktično validacijo
- **Priznanje skupnosti**: Aktivno sodelovanje v Discord skupnosti Azure AI Foundry
- **Profesionalni razvoj**: Spretnosti za uvajanje AZD in AI, relevantne za industrijo
- **Napredovanje v karieri**: Zmožnosti za uvajanje v oblaku, pripravljene za podjetja

## 🎓 Celoviti učni rezultati

### Osnovna raven (Poglavja 1-2)
Po zaključku osnovnih poglavij bodo udeleženci pokazali:

**Tehnične sposobnosti:**
- Uvajanje preprostih spletnih aplikacij v Azure z ukazi AZD
- Konfiguracija in uvajanje aplikacij za klepet, ki jih poganja AI, z RAG
- Razumevanje osnovnih konceptov AZD: predloge, okolja, delovni tokovi za pripravo
- Integracija storitev Azure AI Foundry z uvajanji AZD
- Navigacija po konfiguracijah storitev Azure AI in API končnih točkah

**Profesionalne veščine:**
- Sledenje strukturiranim delovnim tokovom uvajanja za dosledne rezultate
- Odpravljanje osnovnih težav pri uvajanju z uporabo dnevnikov in dokumentacije
- Učinkovita komunikacija o procesih uvajanja v oblaku
- Uporaba najboljših praks za varno integracijo storitev AI

**Validacija učenja:**
- ✅ Uspešno uvajanje predloge `todo-nodejs-mongo`
- ✅ Uvajanje in konfiguracija `azure-search-openai-demo` z RAG
- ✅ Zaključek interaktivnih vaj delavnice (Faza odkrivanja)
- ✅ Sodelovanje v razpravah skupnosti Azure Discord

### Srednja raven (Poglavja 3-4)
Po zaključku srednjih poglavij bodo udeleženci pokazali:

**Tehnične sposobnosti:**
- Upravljanje uvajanj v več okoljih (razvoj, testiranje, produkcija)
- Ustvarjanje prilagojenih predlog Bicep za infrastrukturo kot kodo
- Uvajanje varnih vzorcev avtentikacije z upravljano identiteto
- Uvajanje kompleksnih aplikacij z več storitvami s prilagojenimi konfiguracijami
- Optimizacija strategij priprave virov za stroške in zmogljivost

**Profesionalne veščine:**
- Oblikovanje razširljivih arhitektur infrastrukture
- Uvajanje najboljših praks za varnost pri uvajanju v oblaku
- Dokumentiranje vzorcev infrastrukture za sodelovanje v ekipi
- Vrednotenje in izbira ustreznih storitev Azure glede na zahteve

**Validacija učenja:**
- ✅ Konfiguracija ločenih okolij z nastavitvami, specifičnimi za okolje
- ✅ Ustvarjanje in uvajanje prilagojene predloge Bicep za aplikacijo z več storitvami
- ✅ Uvajanje avtentikacije z upravljano identiteto za varen dostop
- ✅ Zaključek vaj za upravljanje konfiguracije z resničnimi scenariji

### Napredna raven (Poglavja 5-6)
Po zaključku naprednih poglavij bodo udeleženci pokazali:

**Tehnične sposobnosti:**
- Uvajanje in orkestracija rešitev z več agenti AI s koordiniranimi delovnimi tokovi
- Uvajanje arhitektur agentov za stranke in zaloge za maloprodajne scenarije
- Izvedba celovitega načrtovanja zmogljivosti in validacije virov
- Izvedba avtomatizirane validacije pred uvajanjem in optimizacije
- Oblikovanje stroškovno učinkovitih izbir SKU glede na zahteve delovne obremenitve

**Profesionalne veščine:**
- Arhitektura kompleksnih rešitev AI za produkcijska okolja
- Vodenje tehničnih razprav o strategijah uvajanja AI
- Mentoriranje mlajših razvijalcev o najboljših praksah za uvajanje AZD in AI
- Vrednotenje in priporočanje vzorcev arhitekture AI glede na poslovne zahteve

**Validacija učenja:**
- ✅ Uvajanje celotne maloprodajne rešitve z več agenti z ARM predlogami
- ✅ Demonstracija koordinacije agentov in orkestracije delovnih tokov
- ✅ Zaključek vaj za načrtovanje zmogljivosti z resničnimi omejitvami virov
- ✅ Validacija pripravljenosti za uvajanje z avtomatiziranimi preverjanji

### Strokovna raven (Poglavja 7-8)
Po zaključku strokovnih poglavij bodo udeleženci pokazali:

**Tehnične sposobnosti:**
- Diagnosticiranje in reševanje kompleksnih težav pri uvajanju samostojno
- Uvajanje varnostnih vzorcev na ravni podjetja in okvirov za upravljanje
- Oblikovanje celovitih strategij spremljanja in opozarjanja
- Optimizacija produkcijskih uvajanj za razširljivost, stroške in zmogljivost
- Ustanovitev CI/CD cevovodov z ustreznim testiranjem in validacijo

**Profesionalne veščine:**
- Vodenje iniciativ za preobrazbo oblaka na ravni podjetja
- Oblikovanje in uvajanje organizacijskih standardov za uvajanje
- Usposabljanje in mentoriranje razvojnih ekip o naprednih praksah AZD
- Vplivanje na tehnične odločitve za uvajanje AI na ravni podjetja

**Validacija učenja:**
- ✅ Reševanje kompleksnih napak pri uvajanju več storitev
- ✅ Uvajanje varnostnih vzorcev na ravni podjetja z zahtevami skladnosti
- ✅ Oblikovanje in uvajanje spremljanja produkcije z Application Insights
- ✅ Zaključek uvajanja okvira za upravljanje na ravni podjetja

## 🎯 Certifikacija za dokončanje tečaja

### Okvir za sledenje napredku
Sledite svojemu učnemu napredku skozi strukturirane kontrolne točke:

- [ ] **Poglavje 1**: Osnove in hitri začetek ✅
- [ ] **Poglavje 2**: Razvoj AI ✅  
- [ ] **Poglavje 3**: Konfiguracija in avtentikacija ✅
- [ ] **Poglavje 4**: Infrastruktura kot koda in uvajanje ✅
- [ ] **Poglavje 5**: Rešitve z več agenti AI ✅
- [ ] **Poglavje 6**: Validacija in načrtovanje pred uvajanjem ✅
- [ ] **Poglavje 7**: Odpravljanje težav in odpravljanje napak ✅
- [ ] **Poglavje 8**: Proizvodni in poslovni vzorci ✅

### Postopek validacije
Po zaključku vsakega poglavja preverite svoje znanje z:

1. **Zaključek praktičnih vaj**: Uvajanje delujočih rešitev za vsako poglavje
2. **Ocena znanja**: Pregled razdelkov FAQ in zaključek samoocen
3. **Sodelovanje v skupnosti**: Deljenje izkušenj in pridobivanje povratnih informacij v Discord skupnosti Azure
4. **Razvoj portfelja**: Dokumentiranje svojih uvajanj in pridobljenih lekcij
5. **Pregled vrstnikov**: Sodelovanje z drugimi udeleženci pri kompleksnih scenarijih

### Prednosti dokončanja tečaja
Po zaključku vseh poglavij z validacijo bodo diplomanti imeli:

**Tehnično strokovnost:**
- **Izkušnje s produkcijo**: Uvajanje resničnih AI aplikacij v okolja Azure
- **Profesionalne veščine**: Zmožnosti za uvajanje in odpravljanje težav, pripravljene za podjetja  
- **Arhitekturno znanje**: Rešitve z več agenti AI in kompleksni vzorci infrastrukture
- **Obvladovanje odpravljanja težav**: Samostojno reševanje težav pri uvajanju in konfiguraciji

**Profesionalni razvoj:**
- **Priznanje v industriji**: Preverljive spretnosti na področju AZD in uvajanja AI
- **Napredovanje v karieri**: Kvalifikacije za vloge arhitekta oblaka in strokovnjaka za uvajanje AI
- **Vodenje skupnosti**: Aktivno članstvo v skupnostih razvijalcev Azure in AI
- **Nadaljnje učenje**: Osnova za napredno specializacijo Azure AI Foundry

**Portfeljski dosežki:**
- **Uvedene rešitve**: Delujoči primeri AI aplikacij in vzorcev infrastrukture
- **Dokumentacija**: Celoviti vodiči za uvajanje in postopki odpravljanja težav  
- **Prispevki skupnosti**: Razprave, primeri in izboljšave, deljene s skupnostjo Azure
- **Profesionalna mreža**: Povezave z Azure strokovnjaki in praktiki za uvajanje AI

### Pot učenja po tečaju
Diplomanti so pripravljeni na napredno specializacijo v:
- **Azure AI Foundry Expert**: Globoka specializacija za uvajanje in orkestracijo AI modelov
- **Vodenje arhitekture oblaka**: Oblikovanje in upravljanje uvajanj na ravni podjetja
- **Vodenje skupnosti razvijalcev**: Prispevanje k vzorcem Azure in virom skupnosti
- **Korporativno usposabljanje**: Poučevanje spretnosti za uvajanje AZD in AI znotraj organizacij

---

