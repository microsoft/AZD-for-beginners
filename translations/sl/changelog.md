<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ae2cfa632f02df516d4e7cdddbb4a8b5",
  "translation_date": "2025-10-24T18:12:07+00:00",
  "source_file": "changelog.md",
  "language_code": "sl"
}
-->
# Dnevnik sprememb - AZD za začetnike

## Uvod

Ta dnevnik sprememb dokumentira vse pomembne spremembe, posodobitve in izboljšave v repozitoriju AZD za začetnike. Sledimo načelom semantičnega verzioniranja in vzdržujemo ta dnevnik, da uporabnikom pomagamo razumeti, kaj se je spremenilo med različicami.

## Cilji učenja

Z pregledovanjem tega dnevnika sprememb boste:
- Obveščeni o novih funkcijah in dodatkih vsebine
- Razumeli izboljšave obstoječe dokumentacije
- Spremljali popravke napak in zagotavljali natančnost
- Sledili razvoju učnih gradiv skozi čas

## Rezultati učenja

Po pregledu vnosa v dnevniku sprememb boste lahko:
- Prepoznali novo vsebino in vire za učenje
- Razumeli, katere sekcije so bile posodobljene ali izboljšane
- Načrtovali svojo učno pot na podlagi najnovejših gradiv
- Prispevali povratne informacije in predloge za prihodnje izboljšave

## Zgodovina različic

### [v3.4.0] - 24. oktober 2025

#### Izboljšave predogleda infrastrukture in validacije
**Ta različica uvaja celovito podporo za novo funkcijo predogleda Azure Developer CLI ter izboljšuje uporabniško izkušnjo delavnic.**

#### Dodano
- **🧪 Dokumentacija funkcije azd provision --preview**: Celovita pokritost nove zmogljivosti predogleda infrastrukture
  - Referenca ukazov in primeri uporabe v priročniku
  - Podrobna integracija v vodič za pripravo z uporabnimi primeri in prednostmi
  - Integracija preverjanja predhodnih korakov za varnejšo validacijo implementacije
  - Posodobitve vodiča za začetek z varnimi praksami implementacije
- **🚧 Pasica o statusu delavnice**: Profesionalna HTML pasica, ki označuje status razvoja delavnice
  - Gradientna zasnova z indikatorji gradnje za jasno komunikacijo z uporabniki
  - Čas zadnje posodobitve za transparentnost
  - Oblikovanje, ki se prilagaja mobilnim napravam

#### Izboljšano
- **Varnost infrastrukture**: Funkcionalnost predogleda integrirana v celotno dokumentacijo implementacije
- **Validacija pred implementacijo**: Avtomatizirani skripti zdaj vključujejo testiranje predogleda infrastrukture
- **Razvijalčev potek dela**: Posodobljeni zaporedni ukazi vključujejo predogled kot najboljšo prakso
- **Izkušnja delavnice**: Jasno postavljena pričakovanja za uporabnike glede statusa razvoja vsebine

#### Spremenjeno
- **Najboljše prakse implementacije**: Priporočen pristop zdaj temelji na predogledu
- **Tok dokumentacije**: Validacija infrastrukture premaknjena na zgodnejši del učnega procesa
- **Predstavitev delavnice**: Profesionalna komunikacija statusa z jasno časovnico razvoja

#### Izboljšano
- **Pristop "najprej varnost"**: Spremembe infrastrukture je zdaj mogoče validirati pred implementacijo
- **Sodelovanje ekipe**: Rezultate predogleda je mogoče deliti za pregled in odobritev
- **Zavedanje stroškov**: Boljše razumevanje stroškov virov pred pripravo
- **Zmanjšanje tveganja**: Zmanjšanje napak pri implementaciji z napredno validacijo

#### Tehnična izvedba
- **Integracija več dokumentov**: Funkcija predogleda dokumentirana v 4 ključnih datotekah
- **Vzorec ukazov**: Dosledna sintaksa in primeri v celotni dokumentaciji
- **Integracija najboljših praks**: Predogled vključen v validacijske tokove in skripte
- **Vizualni indikatorji**: Jasne oznake NOVIH funkcij za lažje odkrivanje

#### Infrastruktura delavnice
- **Komunikacija statusa**: Profesionalna HTML pasica z gradientnim oblikovanjem
- **Uporabniška izkušnja**: Jasno označen status razvoja preprečuje zmedo
- **Profesionalna predstavitev**: Ohranja kredibilnost repozitorija ob postavljanju pričakovanj
- **Transparentnost časovnice**: Čas zadnje posodobitve oktober 2025 za odgovornost

### [v3.3.0] - 24. september 2025

#### Izboljšani materiali delavnic in interaktivna učna izkušnja
**Ta različica uvaja celovite materiale delavnic z interaktivnimi vodiči v brskalniku in strukturiranimi učnimi potmi.**

#### Dodano
- **🎥 Interaktivni vodič delavnice**: Izkušnja delavnice v brskalniku z zmogljivostjo predogleda MkDocs
- **📝 Strukturirana navodila delavnice**: 7-stopenjska vodena učna pot od odkrivanja do prilagoditve
  - 0-Uvod: Pregled delavnice in nastavitev
  - 1-Izbor-AI-Predloge: Postopek odkrivanja in izbire predloge
  - 2-Validacija-AI-Predloge: Postopki implementacije in validacije
  - 3-Razčlenitev-AI-Predloge: Razumevanje arhitekture predloge
  - 4-Konfiguracija-AI-Predloge: Konfiguracija in prilagoditev
  - 5-Prilagoditev-AI-Predloge: Napredne modifikacije in iteracije
  - 6-Razgradnja-Infrastrukture: Čiščenje in upravljanje virov
  - 7-Zaključek: Povzetek in naslednji koraki
- **🛠️ Orodja delavnice**: Konfiguracija MkDocs z Material temo za izboljšano učno izkušnjo
- **🎯 Praktična učna pot**: 3-stopenjska metodologija (Odkrivanje → Implementacija → Prilagoditev)
- **📱 Integracija GitHub Codespaces**: Brezhibna nastavitev razvojnega okolja

#### Izboljšano
- **Laboratorij AI delavnice**: Razširjen s celovito 2-3 urno strukturirano učno izkušnjo
- **Dokumentacija delavnice**: Profesionalna predstavitev z navigacijo in vizualnimi pripomočki
- **Napredovanje učenja**: Jasno vodstvo korak za korakom od izbire predloge do implementacije v produkcijo
- **Izkušnja razvijalca**: Integrirana orodja za poenostavljene razvojne tokove

#### Izboljšano
- **Dostopnost**: Vmesnik v brskalniku z iskanjem, funkcijo kopiranja in preklopom teme
- **Samostojno učenje**: Prilagodljiva struktura delavnice za različne hitrosti učenja
- **Praktična uporaba**: Scenariji implementacije AI predlog v resničnem svetu
- **Integracija skupnosti**: Integracija Discorda za podporo delavnicam in sodelovanje

#### Funkcije delavnice
- **Vgrajeno iskanje**: Hitro odkrivanje ključnih besed in lekcij
- **Kopiranje blokov kode**: Funkcija kopiranja z lebdenjem za vse primere kode
- **Preklop teme**: Podpora za temen/svetel način za različne preference
- **Vizualna sredstva**: Posnetki zaslona in diagrami za boljše razumevanje
- **Integracija pomoči**: Neposreden dostop do Discorda za podporo skupnosti

### [v3.2.0] - 17. september 2025

#### Velika prestrukturiranja navigacije in sistem učenja po poglavjih
**Ta različica uvaja celovit sistem učenja po poglavjih z izboljšano navigacijo po celotnem repozitoriju.**

#### Dodano
- **📚 Sistem učenja po poglavjih**: Prestrukturiran celoten tečaj v 8 progresivnih učnih poglavij
  - Poglavje 1: Osnove in hitri začetek (⭐ - 30-45 min)
  - Poglavje 2: Razvoj z AI na prvem mestu (⭐⭐ - 1-2 uri)
  - Poglavje 3: Konfiguracija in avtentikacija (⭐⭐ - 45-60 min)
  - Poglavje 4: Infrastruktura kot koda in implementacija (⭐⭐⭐ - 1-1,5 ure)
  - Poglavje 5: Rešitve z več agenti AI (⭐⭐⭐⭐ - 2-3 ure)
  - Poglavje 6: Validacija pred implementacijo in načrtovanje (⭐⭐ - 1 ura)
  - Poglavje 7: Odpravljanje težav in razhroščevanje (⭐⭐ - 1-1,5 ure)
  - Poglavje 8: Vzorce za produkcijo in podjetja (⭐⭐⭐⭐ - 2-3 ure)
- **📚 Celovit navigacijski sistem**: Dosledni navigacijski glavi in nogi po celotni dokumentaciji
- **🎯 Sledenje napredku**: Seznam za preverjanje dokončanja tečaja in sistem verifikacije učenja
- **🗺️ Vodstvo učne poti**: Jasne vstopne točke za različne ravni izkušenj in cilje
- **🔗 Navigacija s križnimi referencami**: Jasno povezane sorodne poglavja in predpogoji

#### Izboljšano
- **Struktura README**: Pretvorjena v strukturirano učno platformo z organizacijo po poglavjih
- **Navigacija dokumentacije**: Vsaka stran zdaj vključuje kontekst poglavja in vodstvo napredovanja
- **Organizacija predlog**: Primeri in predloge povezani z ustreznimi učnimi poglavji
- **Integracija virov**: Priročniki, pogosta vprašanja in učni vodiči povezani z ustreznimi poglavji
- **Integracija delavnic**: Praktični laboratoriji povezani z več učnimi cilji poglavij

#### Spremenjeno
- **Napredovanje učenja**: Premik od linearne dokumentacije k fleksibilnemu učenju po poglavjih
- **Postavitev konfiguracije**: Premaknjeno vodilo za konfiguracijo kot Poglavje 3 za boljši tok učenja
- **Integracija AI vsebine**: Boljša integracija vsebine, specifične za AI, skozi celotno učno pot
- **Vsebina za produkcijo**: Napredni vzorci združeni v Poglavje 8 za podjetniške učence

#### Izboljšano
- **Uporabniška izkušnja**: Jasne navigacijske drobtinice in indikatorji napredovanja po poglavjih
- **Dostopnost**: Dosledni navigacijski vzorci za lažje premikanje po tečaju
- **Profesionalna predstavitev**: Struktura tečaja v univerzitetnem slogu, primerna za akademsko in korporativno usposabljanje
- **Učna učinkovitost**: Zmanjšan čas za iskanje relevantne vsebine z izboljšano organizacijo

#### Tehnična izvedba
- **Navigacijske glave**: Standardizirana navigacija po poglavjih v več kot 40 dokumentacijskih datotekah
- **Navigacija v nogi**: Dosledno vodstvo napredovanja in indikatorji dokončanja poglavij
- **Križno povezovanje**: Celovit sistem notranjih povezav, ki povezuje sorodne koncepte
- **Zemljevid poglavij**: Predloge in primeri jasno povezani z učnimi cilji

#### Izboljšan učni vodič
- **📚 Celoviti učni cilji**: Prestrukturiran učni vodič, ki se ujema s sistemom 8 poglavij
- **🎯 Ocena po poglavjih**: Vsako poglavje vključuje specifične učne cilje in praktične vaje
- **📋 Sledenje napredku**: Tedenski učni urnik z merljivimi rezultati in seznami za preverjanje dokončanja
- **❓ Ocena znanja**: Validacijska vprašanja za vsako poglavje z profesionalnimi rezultati
- **🛠️ Praktične vaje**: Praktične aktivnosti z resničnimi scenariji implementacije in odpravljanja težav
- **📊 Napredovanje veščin**: Jasno napredovanje od osnovnih konceptov do vzorcev za podjetja s fokusom na karierni razvoj
- **🎓 Okvir za certificiranje**: Profesionalni razvojni rezultati in sistem prepoznavanja skupnosti
- **⏱️ Upravljanje časovnice**: Strukturiran 10-tedenski učni načrt z validacijo mejnikov

### [v3.1.0] - 17. september 2025

#### Izboljšane rešitve z več agenti AI
**Ta različica izboljšuje rešitev za več agentov v maloprodaji z boljšim poimenovanjem agentov in izboljšano dokumentacijo.**

#### Spremenjeno
- **Terminologija več agentov**: Zamenjava "Cora agent" z "Customer agent" v celotni rešitvi za več agentov v maloprodaji za boljše razumevanje
- **Arhitektura agentov**: Posodobljena vsa dokumentacija, ARM predloge in primeri kode za dosledno uporabo poimenovanja "Customer agent"
- **Primeri konfiguracije**: Posodobljeni vzorci konfiguracije agentov z novimi poimenovalnimi konvencijami
- **Doslednost dokumentacije**: Zagotovljeno, da vsi sklici uporabljajo profesionalna, opisna imena agentov

#### Izboljšano
- **Paket ARM predlog**: Posodobljena maloprodajna večagentna ARM predloga z referencami na Customer agent
- **Arhitekturni diagrami**: Osveženi diagrami Mermaid z posodobljenim poimenovanjem agentov
- **Primeri kode**: Python razredi in primeri implementacije zdaj uporabljajo poimenovanje CustomerAgent
- **Spremenljivke okolja**: Posodobljeni vsi skripti implementacije za uporabo konvencij CUSTOMER_AGENT_NAME

#### Izboljšano
- **Izkušnja razvijalca**: Jasnejše vloge in odgovornosti agentov v dokumentaciji
- **Pripravljenost za produkcijo**: Boljše usklajevanje s podjetniškimi poimenovalnimi konvencijami
- **Učna gradiva**: Bolj intuitivno poimenovanje agentov za izobraževalne namene
- **Uporabnost predlog**: Poenostavljeno razumevanje funkcij agentov in vzorcev implementacije

#### Tehnični detajli
- Posodobljeni arhitekturni diagrami Mermaid z referencami na CustomerAgent
- Zamenjava imen razredov CoraAgent z CustomerAgent v Python primerih
- Spremenjene konfiguracije ARM predlog JSON za uporabo tipa agenta "customer"
- Posodobljene spremenljivke okolja iz CORA_AGENT_* v CUSTOMER_AGENT_* vzorce
- Osveženi vsi ukazi implementacije in konfiguracije kontejnerjev

### [v3.0.0] - 12. september 2025

#### Velike spremembe - Fokus na AI razvijalce in integracija Azure AI Foundry
**Ta različica preoblikuje repozitorij v celovito učno gradivo, osredotočeno na AI, z integracijo Azure AI Foundry.**

#### Dodano
- **🤖 Učna pot "AI na prvem mestu"**: Popolna prestrukturacija s prioriteto za AI razvijalce in inženirje
- **Vodnik za integracijo Azure AI Foundry**: Celovita dokumentacija za povezovanje AZD s storitvami Azure AI Foundry
- **Vzorce implementacije AI modelov**: Podroben vodič, ki pokriva izbiro modela, konfiguracijo in strategije implementacije v produkcijo
- **Laboratorij AI delavnice**: 2-3 urna praktična delavnica za pretvorbo AI aplikacij v AZD rešitve
- **Najboljše prakse za produkcijo AI**: Vzorci, pripravljeni za podjetja, za skaliranje, spremljanje in varovanje AI delovnih obremenitev
- **Vodnik za odpravljanje težav, specifičnih za AI**: Celovito odpravljanje težav za Azure OpenAI, Cognitive Services in težave pri implementaciji AI
- **Galerija predlog AI**: Izbor predlog Azure AI Foundry z oceno kompleksnosti
- **Materiali delavnic**: Popolna struktura delavnic s praktičnimi laboratoriji in referenčnimi gradivi

#### Izboljšano
- **Struktura README**: Osredotočena na AI razvijalce z 45 % podatkov o interesu skupnosti iz Discorda Azure AI Foundry
- **Učne poti**: Namenska pot za AI razvijalce poleg tradicionalnih poti za študente in DevOps inženirje
- **Priporočila predlog**: Izbrane AI predloge, vključno z azure-search-openai-demo, contoso-chat in openai-chat-app-quickstart
- **Integracija skupnosti**: Izboljšana podpora skupnosti Discord z AI specifičnimi kanali in razpravami


- **Oblika dokumentacije**: Standardizirana vsa dokumentacija z dosledno strukturo, osredotočeno na učenje
- **Tok navigacije**: Uveden logičen napredek skozi vse učne materiale
- **Predstavitev vsebine**: Odstranjeni dekorativni elementi v korist jasne in profesionalne oblike
- **Struktura povezav**: Posodobljene vse notranje povezave za podporo novemu navigacijskemu sistemu

#### Izboljšano
- **Dostopnost**: Odstranjena odvisnost od emojijev za boljšo združljivost z bralniki zaslona
- **Profesionalen videz**: Čista, akademska predstavitev, primerna za učenje v podjetjih
- **Učna izkušnja**: Strukturiran pristop z jasnimi cilji in rezultati za vsako lekcijo
- **Organizacija vsebine**: Bolj logičen tok in povezava med sorodnimi temami

### [v1.0.0] - 2025-09-09

#### Prva izdaja - Celovita zbirka za učenje AZD

#### Dodano
- **Osnovna struktura dokumentacije**
  - Celotna serija vodnikov za začetek
  - Celovita dokumentacija za uvajanje in pripravo
  - Podrobni viri za odpravljanje težav in vodniki za odpravljanje napak
  - Orodja in postopki za preverjanje pred uvajanjem

- **Modul za začetek**
  - Osnove AZD: Temeljni pojmi in terminologija
  - Vodnik za namestitev: Navodila za nastavitev glede na platformo
  - Vodnik za konfiguracijo: Nastavitev okolja in avtentikacija
  - Vadnica za prvi projekt: Učenje korak za korakom

- **Modul za uvajanje in pripravo**
  - Vodnik za uvajanje: Celovita dokumentacija delovnega toka
  - Vodnik za pripravo: Infrastruktura kot koda z Bicep
  - Najboljše prakse za uvajanje v produkcijo
  - Vzorci arhitekture z več storitvami

- **Modul za preverjanje pred uvajanjem**
  - Načrtovanje zmogljivosti: Preverjanje razpoložljivosti virov Azure
  - Izbira SKU: Celovite smernice za izbiro nivoja storitev
  - Preverjanja pred uvajanjem: Samodejni validacijski skripti (PowerShell in Bash)
  - Orodja za oceno stroškov in načrtovanje proračuna

- **Modul za odpravljanje težav**
  - Pogoste težave: Pogosto srečane težave in rešitve
  - Vodnik za odpravljanje napak: Sistematične metodologije za odpravljanje težav
  - Napredne diagnostične tehnike in orodja
  - Spremljanje zmogljivosti in optimizacija

- **Viri in reference**
  - Kratki priročnik ukazov: Hitra referenca za ključne ukaze
  - Slovar: Celovite definicije terminologije in kratic
  - Pogosta vprašanja: Podrobni odgovori na pogosta vprašanja
  - Povezave do zunanjih virov in povezave s skupnostjo

- **Primeri in predloge**
  - Primer preproste spletne aplikacije
  - Predloga za uvajanje statične spletne strani
  - Konfiguracija aplikacije v vsebniku
  - Vzorci integracije podatkovnih baz
  - Primeri arhitekture mikrostoritev
  - Implementacije brezstrežnih funkcij

#### Funkcije
- **Podpora za več platform**: Vodniki za namestitev in konfiguracijo za Windows, macOS in Linux
- **Različne ravni znanja**: Vsebina za študente in profesionalne razvijalce
- **Praktična usmerjenost**: Praktični primeri in scenariji iz resničnega sveta
- **Celovita pokritost**: Od osnovnih pojmov do naprednih vzorcev za podjetja
- **Varnost na prvem mestu**: Najboljše prakse za varnost vključene povsod
- **Optimizacija stroškov**: Smernice za stroškovno učinkovito uvajanje in upravljanje virov

#### Kakovost dokumentacije
- **Podrobni primeri kode**: Praktični, preizkušeni primeri kode
- **Navodila korak za korakom**: Jasna, izvedljiva navodila
- **Celovito obravnavanje napak**: Odpravljanje pogostih težav
- **Integracija najboljših praks**: Industrijski standardi in priporočila
- **Združljivost različic**: Posodobljeno z najnovejšimi storitvami Azure in funkcijami azd

## Načrtovane prihodnje izboljšave

### Različica 3.1.0 (načrtovano)
#### Razširitev platforme za umetno inteligenco
- **Podpora za več modelov**: Vzorci integracije za Hugging Face, Azure Machine Learning in prilagojene modele
- **Okviri za AI agente**: Predloge za uvajanje LangChain, Semantic Kernel in AutoGen
- **Napredni vzorci RAG**: Možnosti za vektorske baze podatkov poleg Azure AI Search (Pinecone, Weaviate itd.)
- **Opazovanje AI**: Izboljšano spremljanje zmogljivosti modela, uporabe žetonov in kakovosti odgovorov

#### Izkušnja razvijalcev
- **Razširitev za VS Code**: Integrirana izkušnja razvoja AZD + AI Foundry
- **Integracija z GitHub Copilot**: Generiranje predlog AZD s pomočjo umetne inteligence
- **Interaktivne vadnice**: Praktične kodirne vaje z avtomatiziranim preverjanjem za scenarije AI
- **Video vsebine**: Dopolnilne video vadnice za vizualne učence, osredotočene na uvajanje AI

### Različica 4.0.0 (načrtovano)
#### Vzorci za podjetniško umetno inteligenco
- **Okvir za upravljanje**: Upravljanje modelov AI, skladnost in sledenje
- **AI za več najemnikov**: Vzorci za zagotavljanje storitev AI več strankam z ločenimi storitvami
- **Uvajanje AI na robu**: Integracija z Azure IoT Edge in primerki vsebnikov
- **Hibridni oblak AI**: Vzorci uvajanja v več oblakih in hibridnih okoljih za delovne obremenitve AI

#### Napredne funkcije
- **Avtomatizacija AI cevovodov**: Integracija MLOps z Azure Machine Learning cevovodi
- **Napredna varnost**: Vzorci ničelnega zaupanja, zasebne končne točke in napredna zaščita pred grožnjami
- **Optimizacija zmogljivosti**: Napredne strategije prilagajanja in skaliranja za aplikacije z visoko prepustnostjo AI
- **Globalna distribucija**: Vzorci za dostavo vsebine in predpomnjenje na robu za AI aplikacije

### Različica 3.0.0 (načrtovano) - Nadomeščena z aktualno izdajo
#### Predlagane dodatke - zdaj implementirane v v3.0.0
- ✅ **Vsebina, osredotočena na AI**: Celovita integracija Azure AI Foundry (zaključeno)
- ✅ **Interaktivne vadnice**: Praktična delavnica za AI (zaključeno)
- ✅ **Napredni varnostni modul**: Varnostni vzorci, specifični za AI (zaključeno)
- ✅ **Optimizacija zmogljivosti**: Strategije prilagajanja delovnih obremenitev AI (zaključeno)

### Različica 2.1.0 (načrtovano) - Delno implementirano v v3.0.0
#### Manjše izboljšave - Nekatere zaključene v aktualni izdaji
- ✅ **Dodatni primeri**: Scenariji uvajanja, osredotočeni na AI (zaključeno)
- ✅ **Razširjen FAQ**: Vprašanja in odpravljanje težav, specifičnih za AI (zaključeno)
- **Integracija orodij**: Izboljšani vodniki za integracijo IDE in urejevalnikov
- ✅ **Razširjeno spremljanje**: Vzorci spremljanja in opozarjanja, specifični za AI (zaključeno)

#### Še vedno načrtovano za prihodnje izdaje
- **Dokumentacija prijazna za mobilne naprave**: Odzivna zasnova za učenje na mobilnih napravah
- **Dostop brez povezave**: Prenosljivi paketi dokumentacije
- **Izboljšana integracija IDE**: Razširitev za VS Code za delovne tokove AZD + AI
- **Nadzorna plošča skupnosti**: Meritve skupnosti v realnem času in sledenje prispevkom

## Prispevanje k dnevniku sprememb

### Poročanje o spremembah
Pri prispevanju v to zbirko zagotovite, da vnosi v dnevnik sprememb vključujejo:

1. **Številka različice**: Po semantičnem verzioniranju (glavna.manjsa.popravek)
2. **Datum**: Datum izdaje ali posodobitve v formatu LLLL-MM-DD
3. **Kategorija**: Dodano, Spremenjeno, Zastarelo, Odstranjeno, Popravljeno, Varnost
4. **Jasen opis**: Jedrnat opis spremembe
5. **Ocena vpliva**: Kako spremembe vplivajo na obstoječe uporabnike

### Kategorije sprememb

#### Dodano
- Nove funkcije, odseki dokumentacije ali zmogljivosti
- Novi primeri, predloge ali učni viri
- Dodatna orodja, skripti ali pripomočki

#### Spremenjeno
- Spremembe obstoječe funkcionalnosti ali dokumentacije
- Posodobitve za izboljšanje jasnosti ali natančnosti
- Prestrukturiranje vsebine ali organizacije

#### Zastarelo
- Funkcije ali pristopi, ki se opuščajo
- Odseki dokumentacije, načrtovani za odstranitev
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

### Smernice za semantično verzioniranje

#### Glavna različica (X.0.0)
- Prelomne spremembe, ki zahtevajo ukrepanje uporabnika
- Pomembno prestrukturiranje vsebine ali organizacije
- Spremembe, ki spreminjajo temeljni pristop ali metodologijo

#### Manjša različica (X.Y.0)
- Nove funkcije ali dodatki vsebine
- Izboljšave, ki ohranjajo združljivost za nazaj
- Dodatni primeri, orodja ali viri

#### Popravljena različica (X.Y.Z)
- Popravki napak in korekcije
- Manjše izboljšave obstoječe vsebine
- Poenostavitve in manjše izboljšave

## Povratne informacije in predlogi skupnosti

Aktivno spodbujamo povratne informacije skupnosti za izboljšanje tega učnega vira:

### Kako podati povratne informacije
- **GitHub Issues**: Poročajte o težavah ali predlagajte izboljšave (dobrodošle so tudi AI-specifične težave)
- **Discord razprave**: Delite ideje in sodelujte s skupnostjo Azure AI Foundry
- **Pull Requests**: Prispevajte neposredne izboljšave vsebine, še posebej predloge in vodnike za AI
- **Azure AI Foundry Discord**: Sodelujte v kanalu #Azure za razprave o AZD + AI
- **Forumi skupnosti**: Sodelujte v širših razpravah razvijalcev Azure

### Kategorije povratnih informacij
- **Natančnost vsebine AI**: Popravki informacij o integraciji in uvajanju storitev AI
- **Učna izkušnja**: Predlogi za izboljšanje učnega toka za razvijalce AI
- **Manjkajoča vsebina AI**: Zahteve za dodatne predloge, vzorce ali primere AI
- **Dostopnost**: Izboljšave za različne učne potrebe
- **Integracija orodij AI**: Predlogi za boljšo integracijo delovnih tokov razvoja AI
- **Vzorci za produkcijo AI**: Zahteve za vzorce uvajanja AI v podjetjih

### Zavezanost odzivom
- **Odziv na težave**: V 48 urah za prijavljene težave
- **Zahteve za funkcije**: Ocena v enem tednu
- **Prispevki skupnosti**: Pregled v enem tednu
- **Varnostne težave**: Takojšnja prioriteta z pospešenim odzivom

## Načrt vzdrževanja

### Redne posodobitve
- **Mesečni pregledi**: Natančnost vsebine in validacija povezav
- **Četrtletne posodobitve**: Večje dodatke in izboljšave vsebine
- **Polletni pregledi**: Celovito prestrukturiranje in izboljšave
- **Letne izdaje**: Glavne posodobitve različic z večjimi izboljšavami

### Spremljanje in zagotavljanje kakovosti
- **Samodejno testiranje**: Redna validacija primerov kode in povezav
- **Integracija povratnih informacij skupnosti**: Redno vključevanje predlogov uporabnikov
- **Posodobitve tehnologije**: Usklajevanje z najnovejšimi storitvami Azure in izdajami azd
- **Revizije dostopnosti**: Redni pregledi za vključujoča načela oblikovanja

## Politika podpore različic

### Podpora za trenutne različice
- **Najnovejša glavna različica**: Polna podpora z rednimi posodobitvami
- **Prejšnja glavna različica**: Varnostne posodobitve in kritični popravki za 12 mesecev
- **Zapuščene različice**: Podpora skupnosti, brez uradnih posodobitev

### Smernice za migracijo
Ko so izdane glavne različice, zagotavljamo:
- **Vodnike za migracijo**: Navodila za prehod korak za korakom
- **Opombe o združljivosti**: Podrobnosti o prelomnih spremembah
- **Podpora za orodja**: Skripte ali pripomočke za pomoč pri migraciji
- **Podpora skupnosti**: Namenski forumi za vprašanja o migraciji

---

**Navigacija**
- **Prejšnja lekcija**: [Študijski vodnik](resources/study-guide.md)
- **Naslednja lekcija**: Vrnitev na [Glavni README](README.md)

**Ostanite obveščeni**: Spremljajte to zbirko za obvestila o novih izdajah in pomembnih posodobitvah učnih materialov.

---

**Omejitev odgovornosti**:  
Ta dokument je bil preveden z uporabo storitve za prevajanje AI [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem maternem jeziku naj se šteje za avtoritativni vir. Za ključne informacije priporočamo profesionalni človeški prevod. Ne odgovarjamo za morebitna nesporazumevanja ali napačne razlage, ki izhajajo iz uporabe tega prevoda.