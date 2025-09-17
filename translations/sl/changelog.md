<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9736db53ea878e07688670ebcc8906bc",
  "translation_date": "2025-09-12T22:43:47+00:00",
  "source_file": "changelog.md",
  "language_code": "sl"
}
-->
# Dnevnik sprememb - AZD za začetnike

## Uvod

Ta dnevnik sprememb dokumentira vse pomembne spremembe, posodobitve in izboljšave v repozitoriju AZD za začetnike. Sledimo načelom semantičnega verzioniranja in vzdržujemo ta dnevnik, da uporabnikom pomagamo razumeti, kaj se je spremenilo med različicami.

## Cilji učenja

Z pregledovanjem tega dnevnika sprememb boste:
- Ostali obveščeni o novih funkcijah in dodatkih vsebine
- Razumeli izboljšave obstoječe dokumentacije
- Spremljali odpravljene napake in popravke za zagotavljanje natančnosti
- Sledili razvoju učnih gradiv skozi čas

## Rezultati učenja

Po pregledu vnosa v dnevniku sprememb boste lahko:
- Prepoznali novo vsebino in vire za učenje
- Razumeli, katere sekcije so bile posodobljene ali izboljšane
- Načrtovali svojo učno pot na podlagi najnovejših gradiv
- Prispevali povratne informacije in predloge za prihodnje izboljšave

## Zgodovina različic

### [v3.0.0] - 2025-09-12

#### Glavne spremembe - Osredotočenost na AI razvijalce in integracija Azure AI Foundry
**Ta različica preoblikuje repozitorij v celovit učni vir, osredotočen na AI, z integracijo Azure AI Foundry.**

#### Dodano
- **🤖 Učni načrt, osredotočen na AI**: Popolna prestrukturacija, ki daje prednost AI razvijalcem in inženirjem
- **Vodnik za integracijo Azure AI Foundry**: Celovita dokumentacija za povezovanje AZD z Azure AI Foundry storitvami
- **Vzorci za uvajanje AI modelov**: Podroben vodnik o izbiri modelov, konfiguraciji in strategijah uvajanja v produkcijo
- **Delavnica AI**: 2-3 urna praktična delavnica za pretvorbo AI aplikacij v rešitve, ki jih je mogoče uvajati z AZD
- **Najboljše prakse za produkcijo AI**: Vzorci, pripravljeni za podjetja, za skaliranje, spremljanje in varovanje AI delovnih obremenitev
- **Vodnik za odpravljanje težav, specifičnih za AI**: Celovito odpravljanje težav za Azure OpenAI, Cognitive Services in težave pri uvajanju AI
- **Galerija predlog AI**: Izbor predlog Azure AI Foundry z ocenami kompleksnosti
- **Gradiva za delavnice**: Popolna struktura delavnic s praktičnimi vajami in referenčnimi gradivi

#### Izboljšano
- **Struktura README**: Osredotočena na AI razvijalce z 45 % podatkov o zanimanju skupnosti iz Discorda Azure AI Foundry
- **Učni načrti**: Namenski učni načrt za AI razvijalce poleg tradicionalnih poti za študente in DevOps inženirje
- **Priporočila za predloge**: Izbrane AI predloge, vključno z azure-search-openai-demo, contoso-chat in openai-chat-app-quickstart
- **Integracija skupnosti**: Izboljšana podpora skupnosti Discord z AI-specifičnimi kanali in razpravami

#### Osredotočenost na varnost in produkcijo
- **Vzorce upravljane identitete**: Konfiguracije za avtentikacijo in varnost, specifične za AI
- **Optimizacija stroškov**: Sledenje uporabi žetonov in nadzor proračuna za AI delovne obremenitve
- **Uvajanje v več regijah**: Strategije za globalno uvajanje AI aplikacij
- **Spremljanje zmogljivosti**: Metrični podatki, specifični za AI, in integracija Application Insights

#### Kakovost dokumentacije
- **Linearna struktura tečaja**: Logičen napredek od začetnika do naprednih vzorcev uvajanja AI
- **Validirani URL-ji**: Vse zunanje povezave repozitorija preverjene in dostopne
- **Popolna referenca**: Vse notranje povezave dokumentacije preverjene in funkcionalne
- **Pripravljeno za produkcijo**: Vzorci uvajanja za podjetja z resničnimi primeri

### [v2.0.0] - 2025-09-09

#### Glavne spremembe - Prestrukturiranje repozitorija in profesionalna izboljšava
**Ta različica predstavlja pomembno prenovo strukture repozitorija in predstavitve vsebine.**

#### Dodano
- **Strukturiran učni okvir**: Vse strani dokumentacije zdaj vključujejo uvod, cilje učenja in rezultate učenja
- **Navigacijski sistem**: Dodane povezave na prejšnje/naslednje lekcije po celotni dokumentaciji za usmerjeno učno pot
- **Vodnik za študij**: Celovit study-guide.md z učnimi cilji, praktičnimi vajami in ocenjevalnimi gradivi
- **Profesionalna predstavitev**: Odstranjeni vsi emoji ikoni za izboljšano dostopnost in profesionalni videz
- **Izboljšana struktura vsebine**: Izboljšana organizacija in tok učnih gradiv

#### Spremenjeno
- **Format dokumentacije**: Standardizirana vsa dokumentacija z dosledno strukturo, osredotočeno na učenje
- **Tok navigacije**: Uveden logičen napredek skozi vsa učna gradiva
- **Predstavitev vsebine**: Odstranjeni dekorativni elementi v prid jasnemu, profesionalnemu formatiranju
- **Struktura povezav**: Posodobljene vse notranje povezave za podporo novemu navigacijskemu sistemu

#### Izboljšano
- **Dostopnost**: Odstranjena odvisnost od emoji za boljšo združljivost z bralniki zaslona
- **Profesionalni videz**: Čista, akademska predstavitev, primerna za učenje v podjetjih
- **Učna izkušnja**: Strukturiran pristop z jasnimi cilji in rezultati za vsako lekcijo
- **Organizacija vsebine**: Boljši logični tok in povezava med sorodnimi temami

### [v1.0.0] - 2025-09-09

#### Prva izdaja - Celovit učni repozitorij AZD

#### Dodano
- **Osnovna struktura dokumentacije**
  - Popolna serija vodnikov za začetek
  - Celovita dokumentacija za uvajanje in pripravo
  - Podrobni viri za odpravljanje težav in vodniki za odpravljanje napak
  - Orodja in postopki za preverjanje pred uvajanjem

- **Modul za začetek**
  - Osnove AZD: Temeljni koncepti in terminologija
  - Vodnik za namestitev: Navodila za nastavitev, specifična za platformo
  - Vodnik za konfiguracijo: Nastavitev okolja in avtentikacija
  - Prvi projektni tutorial: Korak za korakom praktično učenje

- **Modul za uvajanje in pripravo**
  - Vodnik za uvajanje: Celovita dokumentacija delovnega toka
  - Vodnik za pripravo: Infrastruktura kot koda z Bicepom
  - Najboljše prakse za produkcijsko uvajanje
  - Vzorci arhitekture za več storitev

- **Modul za preverjanje pred uvajanjem**
  - Načrtovanje zmogljivosti: Preverjanje razpoložljivosti virov Azure
  - Izbor SKU: Celovita navodila za izbiro nivoja storitev
  - Preverjanje pred uvajanjem: Avtomatizirani skripti za preverjanje (PowerShell in Bash)
  - Orodja za oceno stroškov in načrtovanje proračuna

- **Modul za odpravljanje težav**
  - Pogoste težave: Pogosto srečane težave in rešitve
  - Vodnik za odpravljanje napak: Sistematične metodologije za odpravljanje težav
  - Napredne diagnostične tehnike in orodja
  - Spremljanje zmogljivosti in optimizacija

- **Viri in reference**
  - Seznam ukazov: Hitri referenčni seznam ključnih ukazov
  - Slovar: Celovite definicije terminologije in kratic
  - Pogosta vprašanja: Podrobni odgovori na pogosta vprašanja
  - Zunanje povezave virov in povezave skupnosti

- **Primeri in predloge**
  - Primer preproste spletne aplikacije
  - Predloga za uvajanje statične spletne strani
  - Konfiguracija aplikacije v kontejnerju
  - Vzorci integracije podatkovnih baz
  - Primeri arhitekture mikrostoritev
  - Implementacije funkcij brez strežnika

#### Funkcije
- **Podpora za več platform**: Vodniki za namestitev in konfiguracijo za Windows, macOS in Linux
- **Različne ravni znanja**: Vsebina zasnovana za študente in profesionalne razvijalce
- **Praktična osredotočenost**: Praktični primeri in scenariji iz resničnega sveta
- **Celovita pokritost**: Od osnovnih konceptov do naprednih vzorcev za podjetja
- **Pristop, osredotočen na varnost**: Najboljše prakse za varnost vključene povsod
- **Optimizacija stroškov**: Navodila za stroškovno učinkovito uvajanje in upravljanje virov

#### Kakovost dokumentacije
- **Podrobni primeri kode**: Praktični, preizkušeni primeri kode
- **Navodila korak za korakom**: Jasna, izvedljiva navodila
- **Celovito ravnanje z napakami**: Odpravljanje pogostih težav
- **Integracija najboljših praks**: Industrijski standardi in priporočila
- **Združljivost različic**: Posodobljeno z najnovejšimi storitvami Azure in funkcijami azd

## Načrtovane prihodnje izboljšave

### Različica 3.1.0 (Načrtovano)
#### Razširitev AI platforme
- **Podpora za več modelov**: Vzorci integracije za Hugging Face, Azure Machine Learning in prilagojene modele
- **Okviri za AI agente**: Predloge za uvajanje LangChain, Semantic Kernel in AutoGen
- **Napredni vzorci RAG**: Možnosti vektorskih baz podatkov poleg Azure AI Search (Pinecone, Weaviate itd.)
- **Opazovanje AI**: Izboljšano spremljanje zmogljivosti modelov, uporabe žetonov in kakovosti odgovorov

#### Izkušnja razvijalca
- **Razširitev za VS Code**: Integrirana izkušnja razvoja AZD + AI Foundry
- **Integracija GitHub Copilot**: AI-podprta generacija predlog AZD
- **Interaktivni tutoriali**: Praktične kodirne vaje z avtomatiziranim preverjanjem za AI scenarije
- **Video vsebine**: Dopolnilni video tutoriali za vizualne učence, osredotočeni na uvajanje AI

### Različica 4.0.0 (Načrtovano)
#### Vzorci AI za podjetja
- **Okvir upravljanja**: Upravljanje AI modelov, skladnost in revizijske sledi
- **AI za več najemnikov**: Vzorci za storitve AI, namenjene več strankam z izoliranimi storitvami
- **Uvajanje AI na robu**: Integracija z Azure IoT Edge in kontejnerskimi instancami
- **Hibridni oblak AI**: Vzorci za uvajanje AI delovnih obremenitev v več oblakih in hibridnih okoljih

#### Napredne funkcije
- **Avtomatizacija AI cevovodov**: Integracija MLOps z Azure Machine Learning cevovodi
- **Napredna varnost**: Vzorci ničelnega zaupanja, zasebne končne točke in napredna zaščita pred grožnjami
- **Optimizacija zmogljivosti**: Napredno prilagajanje in strategije skaliranja za aplikacije AI z visokim pretokom
- **Globalna distribucija**: Vzorci za dostavo vsebine in predpomnjenje na robu za AI aplikacije

### Različica 3.0.0 (Načrtovano) - Nadomeščena z aktualno izdajo
#### Predlagani dodatki - Zdaj implementirani v v3.0.0
- ✅ **Vsebina, osredotočena na AI**: Celovita integracija Azure AI Foundry (Zaključeno)
- ✅ **Interaktivni tutoriali**: Praktična delavnica AI (Zaključeno)
- ✅ **Napredni varnostni modul**: Varnostni vzorci, specifični za AI (Zaključeno)
- ✅ **Optimizacija zmogljivosti**: Strategije prilagajanja delovnih obremenitev AI (Zaključeno)

### Različica 2.1.0 (Načrtovano) - Delno implementirano v v3.0.0
#### Manjše izboljšave - Nekatere zaključene v aktualni izdaji
- ✅ **Dodatni primeri**: Scenariji uvajanja, osredotočeni na AI (Zaključeno)
- ✅ **Razširjen FAQ**: Vprašanja in odpravljanje težav, specifičnih za AI (Zaključeno)
- **Integracija orodij**: Izboljšani vodniki za integracijo IDE in urejevalnikov
- ✅ **Razširjeno spremljanje**: Vzorci spremljanja in opozarjanja, specifični za AI (Zaključeno)

#### Še načrtovano za prihodnje izdaje
- **Dokumentacija, prijazna mobilnim napravam**: Prilagodljiv dizajn za učenje na mobilnih napravah
- **Dostop brez povezave**: Prenosljivi paketi dokumentacije
- **Izboljšana integracija IDE**: Razširitev za VS Code za delovne tokove AZD + AI
- **Nadzorna plošča skupnosti**: Meritve skupnosti v realnem času in sledenje prispevkom

## Prispevanje k dnevniku sprememb

### Poročanje o spremembah
Pri prispevanju v ta repozitorij poskrbite, da vnosi v dnevnik sprememb vključujejo:

1. **Številka različice**: Po načelih semantičnega verzioniranja (glavna.manša.popravek)
2. **Datum**: Datum izdaje ali posodobitve v formatu YYYY-MM-DD
3. **Kategorija**: Dodano, Spremenjeno, Zastarelo, Odstranjeno, Popravljeno, Varnost
4. **Jasen opis**: Jedrnat opis, kaj se je spremenilo
5. **Ocena vpliva**: Kako spremembe vplivajo na obstoječe uporabnike

### Kategorije sprememb

#### Dodano
- Nove funkcije, sekcije dokumentacije ali zmogljivosti
- Novi primeri, predloge ali učni viri
- Dodatna orodja, skripti ali pripomočki

#### Spremenjeno
- Spremembe obstoječe funkcionalnosti ali dokumentacije
- Posodobitve za izboljšanje jasnosti ali natančnosti
- Prestrukturiranje vsebine ali organizacije

#### Zastarelo
- Funkcije ali pristopi, ki se opuščajo
- Sekcije dokumentacije, načrtovane za odstranitev
- Metode, ki imajo boljše alternative

#### Odstranjeno
- Funkcije, dokumentacija ali primeri, ki niso več relevantni
- Zastarele informacije ali opuščeni pristopi
- Odvečna ali združena vsebina

#### Popravljeno
- Popravki napak v dokumentaciji ali kodi
- Reševanje prijavljenih težav ali problemov
- Izboljšave natančnosti ali funkcionalnosti

#### Varnost
- Izboljšave ali popravki, povezani z varnostjo
- Posodobitve najboljših praks za varnost
- Reševanje varnostnih ranljivosti

### Načela semantičnega verzioniranja

#### Glavna različica (X.0.0)
- Spremembe, ki zahtevajo ukrepanje uporabnika
- Pomembno prestrukturiranje vsebine ali organizacije
- Spremembe, ki spreminjajo temeljni pristop ali metodologijo

#### Manjša različica (X.Y.0)
- Nove funkcije ali dodatki vsebine
- Izboljšave, ki ohranjajo združljivost nazaj
- Dodatni primeri, orodja ali viri

#### Popravki (X.Y.Z)
- Popravki napak in korekcije
- Manjše izboljšave obstoječe vsebine
- Pojasnila in majhne izboljšave

## Povratne informacije in predlogi skupnosti

Aktivno spodbujamo povratne informacije skupnosti za izboljšanje tega učnega vira:

### Kako podati povratne informacije
- **GitHub Issues**: Prijavite težave ali predlagajte izboljšave (dobrodošle AI-specifične
- **Najbolj sveža glavna različica**: Polna podpora z rednimi posodobitvami  
- **Prejšnja glavna različica**: Varnostne posodobitve in kritični popravki za 12 mesecev  
- **Zapuščene različice**: Podpora skupnosti, brez uradnih posodobitev  

### Navodila za migracijo  
Ko so izdane glavne različice, nudimo:  
- **Vodnike za migracijo**: Navodila po korakih za prehod  
- **Opombe o združljivosti**: Podrobnosti o spremembah, ki niso združljive  
- **Podpora z orodji**: Skripte ali pripomočke za pomoč pri migraciji  
- **Podpora skupnosti**: Namenski forumi za vprašanja o migraciji  

---

**Navigacija**  
- **Prejšnja lekcija**: [Učni vodnik](resources/study-guide.md)  
- **Naslednja lekcija**: Vrnitev na [Glavni README](README.md)  

**Ostanite obveščeni**: Spremljajte to repozitorij za obvestila o novih izdajah in pomembnih posodobitvah učnih gradiv.  

---

**Omejitev odgovornosti**:  
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za ključne informacije priporočamo profesionalni človeški prevod. Ne prevzemamo odgovornosti za morebitna nesporazumevanja ali napačne razlage, ki bi nastale zaradi uporabe tega prevoda.