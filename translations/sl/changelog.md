<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1bc63a39d4cf8fc5cb5c7040344be859",
  "translation_date": "2025-11-23T21:11:11+00:00",
  "source_file": "changelog.md",
  "language_code": "sl"
}
-->
# Dnevnik sprememb - AZD za začetnike

## Uvod

Ta dnevnik sprememb dokumentira vse pomembne spremembe, posodobitve in izboljšave v repozitoriju AZD za začetnike. Sledimo načelom semantičnega verzioniranja in vzdržujemo ta dnevnik, da uporabnikom pomagamo razumeti, kaj se je spremenilo med različicami.

## Cilji učenja

Z branjem tega dnevnika sprememb boste:
- Obveščeni o novih funkcijah in dodatkih vsebine
- Razumeli izboljšave obstoječe dokumentacije
- Spremljali popravke napak in zagotavljali natančnost
- Sledili razvoju učnih materialov skozi čas

## Rezultati učenja

Po pregledu vnosa v dnevniku sprememb boste lahko:
- Prepoznali novo vsebino in vire za učenje
- Razumeli, kateri deli so bili posodobljeni ali izboljšani
- Načrtovali svojo učno pot na podlagi najnovejših materialov
- Prispevali povratne informacije in predloge za prihodnje izboljšave

## Zgodovina različic

### [v3.8.0] - 19. 11. 2025

#### Napredna dokumentacija: spremljanje, varnost in vzorci večagentnega delovanja
**Ta različica dodaja obsežne lekcije na visoki ravni o integraciji Application Insights, avtentikacijskih vzorcih in koordinaciji več agentov za produkcijske implementacije.**

#### Dodano
- **📊 Lekcija o integraciji Application Insights**: v `docs/pre-deployment/application-insights.md`:
  - Implementacija osredotočena na AZD z avtomatskim zagotavljanjem
  - Popolne Bicep predloge za Application Insights + Log Analytics
  - Delujoče Python aplikacije s prilagojeno telemetrijo (1.200+ vrstic)
  - Vzorci spremljanja AI/LLM (sledenje žetonom Azure OpenAI/stroškov)
  - 6 diagramov Mermaid (arhitektura, porazdeljeno sledenje, tok telemetrije)
  - 3 praktične vaje (opozorila, nadzorne plošče, spremljanje AI)
  - Primeri poizvedb Kusto in strategije optimizacije stroškov
  - Pretakanje živih metrik in odpravljanje napak v realnem času
  - 40-50 minut časa za učenje s produkcijsko pripravljenimi vzorci

- **🔐 Lekcija o avtentikacijskih in varnostnih vzorcih**: v `docs/getting-started/authsecurity.md`:
  - 3 avtentikacijski vzorci (povezovalne nize, Key Vault, upravljana identiteta)
  - Popolne Bicep predloge infrastrukture za varne implementacije
  - Koda aplikacije Node.js z integracijo Azure SDK
  - 3 popolne vaje (omogočanje upravljane identitete, uporabniško dodeljena identiteta, rotacija Key Vault)
  - Najboljše prakse varnosti in konfiguracije RBAC
  - Vodnik za odpravljanje napak in analiza stroškov
  - Produkcijsko pripravljeni vzorci avtentikacije brez gesel

- **🤖 Lekcija o vzorcih koordinacije več agentov**: v `docs/pre-deployment/coordination-patterns.md`:
  - 5 vzorcev koordinacije (zaporedno, vzporedno, hierarhično, dogodkovno, konsenz)
  - Popolna implementacija storitve orkestratorja (Python/Flask, 1.500+ vrstic)
  - 3 specializirane implementacije agentov (Raziskovalec, Pisec, Urednik)
  - Integracija Service Bus za sporočilne vrste
  - Upravljanje stanja Cosmos DB za porazdeljene sisteme
  - 6 diagramov Mermaid, ki prikazujejo interakcije agentov
  - 3 napredne vaje (upravljanje časovnih omejitev, logika ponovitev, prekinjevalnik tokokroga)
  - Razčlenitev stroškov (240-565 $/mesec) s strategijami optimizacije
  - Integracija Application Insights za spremljanje

#### Izboljšano
- **Poglavje pred implementacijo**: Zdaj vključuje obsežne vzorce spremljanja in koordinacije
- **Poglavje Začetek**: Izboljšano s profesionalnimi avtentikacijskimi vzorci
- **Pripravljenost za produkcijo**: Popolna pokritost od varnosti do opazljivosti
- **Osnutek tečaja**: Posodobljen z referencami na nove lekcije v poglavjih 3 in 6

#### Spremenjeno
- **Napredovanje učenja**: Boljša integracija varnosti in spremljanja skozi celoten tečaj
- **Kakovost dokumentacije**: Dosledni standardi visoke kakovosti (95-97%) v novih lekcijah
- **Produkcijski vzorci**: Popolna pokritost od začetka do konca za podjetniške implementacije

#### Izboljšano
- **Izkušnja razvijalca**: Jasna pot od razvoja do spremljanja v produkciji
- **Varnostni standardi**: Profesionalni vzorci za avtentikacijo in upravljanje skrivnosti
- **Opazljivost**: Popolna integracija Application Insights z AZD
- **AI delovne obremenitve**: Specializirano spremljanje za Azure OpenAI in sisteme z več agenti

#### Validirano
- ✅ Vse lekcije vključujejo popolno delujočo kodo (ne le odlomke)
- ✅ Diagrami Mermaid za vizualno učenje (19 skupaj v 3 lekcijah)
- ✅ Praktične vaje s koraki za preverjanje (9 skupaj)
- ✅ Produkcijsko pripravljene Bicep predloge, ki jih je mogoče implementirati z `azd up`
- ✅ Analiza stroškov in strategije optimizacije
- ✅ Vodniki za odpravljanje napak in najboljše prakse
- ✅ Preveritvene točke znanja z ukazi za preverjanje

#### Rezultati ocenjevanja dokumentacije
- **docs/pre-deployment/application-insights.md**: - Obsežen vodnik za spremljanje
- **docs/getting-started/authsecurity.md**: - Profesionalni varnostni vzorci
- **docs/pre-deployment/coordination-patterns.md**: - Napredne arhitekture več agentov
- **Skupna nova vsebina**: - Dosledni standardi visoke kakovosti

#### Tehnična implementacija
- **Application Insights**: Log Analytics + prilagojena telemetrija + porazdeljeno sledenje
- **Avtentikacija**: Upravljana identiteta + Key Vault + vzorci RBAC
- **Več agentov**: Service Bus + Cosmos DB + Container Apps + orkestracija
- **Spremljanje**: Žive metrike + poizvedbe Kusto + opozorila + nadzorne plošče
- **Upravljanje stroškov**: Strategije vzorčenja, politike hrambe, nadzor proračuna

### [v3.7.0] - 19. 11. 2025

#### Izboljšave kakovosti dokumentacije in nov primer Azure OpenAI
**Ta različica izboljšuje kakovost dokumentacije v celotnem repozitoriju in dodaja popoln primer implementacije Azure OpenAI z vmesnikom za klepet GPT-4.**

#### Dodano
- **🤖 Primer klepeta Azure OpenAI**: Popolna implementacija GPT-4 v `examples/azure-openai-chat/`:
  - Popolna infrastruktura Azure OpenAI (implementacija modela GPT-4)
  - Ukazni vmesnik za klepet v Pythonu z zgodovino pogovorov
  - Integracija Key Vault za varno shranjevanje API ključev
  - Sledenje uporabi žetonov in ocena stroškov
  - Omejevanje hitrosti in obravnava napak
  - Obsežen README z vodnikom za implementacijo (35-45 minut)
  - 11 produkcijsko pripravljenih datotek (Bicep predloge, Python aplikacija, konfiguracija)
- **📚 Vaje za dokumentacijo**: Dodane praktične vaje v vodnik za konfiguracijo:
  - Vaja 1: Konfiguracija za več okolij (15 minut)
  - Vaja 2: Praksa upravljanja skrivnosti (10 minut)
  - Jasna merila uspeha in koraki za preverjanje
- **✅ Preverjanje implementacije**: Dodan odsek za preverjanje v vodnik za implementacijo:
  - Postopki preverjanja stanja
  - Seznam meril uspeha
  - Pričakovani rezultati za vse ukaze implementacije
  - Hiter referenčni vodnik za odpravljanje napak

#### Izboljšano
- **examples/README.md**: Posodobljeno na kakovost A (93%):
  - Dodan azure-openai-chat v vse ustrezne odseke
  - Posodobljeno število lokalnih primerov s 3 na 4
  - Dodano v tabelo primerov AI aplikacij
  - Integrirano v Hiter začetek za srednje napredne uporabnike
  - Dodano v odsek predlog Microsoft Foundry za Azure AI
  - Posodobljena primerjalna matrika in odseki za iskanje tehnologij
- **Kakovost dokumentacije**: Izboljšano iz B+ (87%) → A- (92%) v mapi docs:
  - Dodani pričakovani rezultati za ključne primere ukazov
  - Vključeni koraki za preverjanje sprememb konfiguracije
  - Izboljšano praktično učenje s praktičnimi vajami

#### Spremenjeno
- **Napredovanje učenja**: Boljša integracija primerov AI za srednje napredne učence
- **Struktura dokumentacije**: Bolj uporabne vaje z jasnimi rezultati
- **Postopek preverjanja**: Dodana eksplicitna merila uspeha ključnim delovnim tokovom

#### Izboljšano
- **Izkušnja razvijalca**: Implementacija Azure OpenAI zdaj traja 35-45 minut (prej 60-90 za kompleksne alternative)
- **Preglednost stroškov**: Jasne ocene stroškov (50-200 $/mesec) za primer Azure OpenAI
- **Učna pot**: AI razvijalci imajo jasen vstopni točko z azure-openai-chat
- **Standardi dokumentacije**: Dosledni pričakovani rezultati in koraki za preverjanje

#### Validirano
- ✅ Primer Azure OpenAI popolnoma funkcionalen z `azd up`
- ✅ Vse 11 implementacijskih datotek sintaktično pravilnih
- ✅ Navodila README ustrezajo dejanski izkušnji implementacije
- ✅ Povezave dokumentacije posodobljene na več kot 8 lokacijah
- ✅ Indeks primerov natančno odraža 4 lokalne primere
- ✅ Nobenih podvojenih zunanjih povezav v tabelah
- ✅ Vse navigacijske reference pravilne

#### Tehnična implementacija
- **Arhitektura Azure OpenAI**: GPT-4 + Key Vault + Container Apps vzorec
- **Varnost**: Pripravljeno za upravljano identiteto, skrivnosti v Key Vault
- **Spremljanje**: Integracija Application Insights
- **Upravljanje stroškov**: Sledenje žetonom in optimizacija uporabe
- **Implementacija**: En sam ukaz `azd up` za popolno nastavitev

### [v3.6.0] - 19. 11. 2025

#### Glavna posodobitev: Primeri implementacije aplikacij v vsebnikih
**Ta različica uvaja obsežne, produkcijsko pripravljene primere implementacije aplikacij v vsebnikih z uporabo Azure Developer CLI (AZD), s popolno dokumentacijo in integracijo v učno pot.**

#### Dodano
- **🚀 Primeri aplikacij v vsebnikih**: Novi lokalni primeri v `examples/container-app/`:
  - [Glavni vodnik](examples/container-app/README.md): Popoln pregled implementacij v vsebnikih, hiter začetek, produkcija in napredni vzorci
  - [Preprosta Flask API](../../examples/container-app/simple-flask-api): Začetnikom prijazen REST API z možnostjo scale-to-zero, sondami zdravja, spremljanjem in odpravljanjem napak
  - [Arhitektura mikrostoritev](../../examples/container-app/microservices): Produkcijsko pripravljena večstoritvena implementacija (API Gateway, Product, Order, User, Notification), asinhrono sporočanje, Service Bus, Cosmos DB, Azure SQL, porazdeljeno sledenje, modro-zelena/kanarska implementacija
- **Najboljše prakse**: Varnost, spremljanje, optimizacija stroškov in smernice za CI/CD za delovne obremenitve v vsebnikih
- **Primeri kode**: Popoln `azure.yaml`, Bicep predloge in večjezične implementacije storitev (Python, Node.js, C#, Go)
- **Testiranje in odpravljanje napak**: Scenariji testiranja od začetka do konca, ukazi za spremljanje, vodnik za odpravljanje napak

#### Spremenjeno
- **README.md**: Posodobljen za predstavitev in povezavo novih primerov aplikacij v vsebnikih pod "Lokalni primeri - aplikacije v vsebnikih"
- **examples/README.md**: Posodobljen za poudarjanje primerov aplikacij v vsebnikih, dodajanje vnosov v primerjalno matriko in posodobitev referenc na tehnologije/arhitekture
- **Osnutek tečaja in učni vodnik**: Posodobljen za referenciranje novih primerov aplikacij v vsebnikih in vzorcev implementacije v ustreznih poglavjih

#### Validirano
- ✅ Vsi novi primeri implementirani z `azd up` in sledijo najboljšim praksam
- ✅ Posodobljene povezave in navigacija dokumentacije
- ✅ Primeri pokrivajo začetniške do napredne scenarije, vključno s produkcijskimi mikrostoritvami

#### Opombe
- **Obseg**: Dokumentacija in primeri samo v angleščini
- **Naslednji koraki**: Razširitev z dodatnimi naprednimi vzorci vsebnikov in avtomatizacijo CI/CD v prihodnjih izdajah

### [v3.5.0] - 19. 11. 2025

#### Preimenovanje izdelka: Microsoft Foundry
**Ta različica uvaja celovito preimenovanje izdelka iz "Azure AI Foundry" v "Microsoft Foundry" v celotni angleški dokumentaciji, kar odraža uradno preimenovanje Microsofta.**

#### Spremenjeno
- **🔄 Posodobitev imena izdelka**: Popolno preimenovanje iz "Azure AI Foundry" v "Microsoft Foundry"
  - Posodobljene vse reference v angleški dokumentaciji v mapi `docs/`
  - Preimenovana mapa: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Preimenovana datoteka: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Skupaj: 23 vsebinskih referenc posodobljenih v 7 dokumentacijskih datotekah

- **📁 Spremembe strukture map**:
  - `docs/ai-foundry/` preimenovana v `docs/microsoft-foundry/`
  - Vse navzkrižne reference posodobljene za odražanje nove strukture map
  - Validirane navigacijske povezave v celotni dokumentaciji

- **📄 Preimenovanja datotek**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Vse notranje povezave posodobljene za referenciranje novega imena datoteke

#### Posodobljene datoteke
- **Dokumentacija poglavij** (7 datotek):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 posodobitve navigacijskih povezav
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 posodobljene reference na ime izdelka
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Že uporablja Microsoft Foundry (iz prejšnjih posodobitev)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 posodobljene reference (pregled, povratne informacije skupnosti, dokumentacija)
  - `docs/getting-started/azd-basics.md` - 4 posodobljene navzkrižne povezave
  - `docs/getting-started/first-project.md` - 2 posodobljeni navigacijski povezavi poglavij
  - `docs/getting-started/installation.md` - 2 posodobljeni povezavi na naslednje poglavje
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 posodobljene reference (navigacija, skupnost Discord)
  - `docs/troubleshooting/common-issues.md` - 1 posodobljena navigacijska povezava
  - `docs/troubleshooting/debugging.md` - 1 posodobljena navigacijska povezava

- **Strukturne datoteke tečaja** (2 datoteki):
  - `README.md` - 
- **Delavnica**: Gradivo za delavnico (`workshop/`) v tej različici ni posodobljeno
- **Primeri**: Datoteke primerov lahko še vedno vsebujejo stare poimenovalne konvencije (bodo urejene v prihodnji posodobitvi)
- **Zunanje povezave**: Zunanji URL-ji in reference na GitHub repozitorij ostajajo nespremenjeni

#### Vodnik za migracijo za sodelavce
Če imate lokalne veje ali dokumentacijo, ki se sklicuje na staro strukturo:
1. Posodobite reference map: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Posodobite reference datotek: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Zamenjajte ime izdelka: "Azure AI Foundry" → "Microsoft Foundry"
4. Preverite, ali vse notranje povezave v dokumentaciji še vedno delujejo

---

### [v3.4.0] - 2025-10-24

#### Predogled infrastrukture in izboljšave validacije
**Ta različica uvaja celovito podporo za novo funkcijo predogleda Azure Developer CLI in izboljšuje uporabniško izkušnjo delavnic.**

#### Dodano
- **🧪 Dokumentacija funkcije azd provision --preview**: Celovita pokritost nove zmogljivosti predogleda infrastrukture
  - Referenca ukazov in primeri uporabe v priročniku
  - Podrobna integracija v vodnik za zagotavljanje z uporabo primerov in prednosti
  - Integracija preverjanja predhodnih pogojev za varnejšo validacijo implementacije
  - Posodobitve vodnika za začetek z varnostno usmerjenimi praksami implementacije
- **🚧 Pasica o statusu delavnice**: Profesionalna HTML pasica, ki označuje status razvoja delavnice
  - Gradientna zasnova z gradbenimi indikatorji za jasno komunikacijo z uporabniki
  - Čas zadnje posodobitve za preglednost
  - Oblikovanje, prilagojeno mobilnim napravam, za vse vrste naprav

#### Izboljšano
- **Varnost infrastrukture**: Funkcionalnost predogleda integrirana v celotno dokumentacijo o implementaciji
- **Validacija pred implementacijo**: Avtomatizirani skripti zdaj vključujejo testiranje predogleda infrastrukture
- **Razvijalski potek dela**: Posodobljeni zaporedji ukazov vključujejo predogled kot najboljšo prakso
- **Izkušnja delavnice**: Jasno postavljena pričakovanja za uporabnike glede statusa razvoja vsebine

#### Spremenjeno
- **Najboljše prakse implementacije**: Priporočen pristop zdaj temelji na predogledu
- **Tok dokumentacije**: Validacija infrastrukture premaknjena na začetek učnega procesa
- **Predstavitev delavnice**: Profesionalna komunikacija statusa z jasno časovnico razvoja

#### Izboljšano
- **Pristop "varnost na prvem mestu"**: Spremembe infrastrukture je zdaj mogoče validirati pred implementacijo
- **Sodelovanje ekipe**: Rezultate predogleda je mogoče deliti za pregled in odobritev
- **Zavedanje stroškov**: Boljše razumevanje stroškov virov pred zagotavljanjem
- **Zmanjšanje tveganj**: Zmanjšanje napak pri implementaciji z napredno validacijo

#### Tehnična izvedba
- **Integracija več dokumentov**: Funkcija predogleda dokumentirana v 4 ključnih datotekah
- **Vzorec ukazov**: Dosledna sintaksa in primeri v celotni dokumentaciji
- **Integracija najboljših praks**: Predogled vključen v validacijske poteke dela in skripte
- **Vizualni indikatorji**: Jasne oznake NOVIH funkcij za boljšo odkritost

#### Infrastruktura delavnice
- **Komunikacija statusa**: Profesionalna HTML pasica z gradientnim oblikovanjem
- **Uporabniška izkušnja**: Jasno označen status razvoja preprečuje zmedo
- **Profesionalna predstavitev**: Ohranja verodostojnost repozitorija ob postavljanju pričakovanj
- **Preglednost časovnice**: Čas zadnje posodobitve oktober 2025 za odgovornost

### [v3.3.0] - 2025-09-24

#### Izboljšano gradivo za delavnice in interaktivna učna izkušnja
**Ta različica uvaja celovito gradivo za delavnice z interaktivnimi vodniki v brskalniku in strukturiranimi učnimi potmi.**

#### Dodano
- **🎥 Interaktivni vodnik za delavnice**: Izkušnja delavnice v brskalniku z možnostjo predogleda MkDocs
- **📝 Strukturirana navodila za delavnice**: 7-stopenjska vodena učna pot od odkrivanja do prilagajanja
  - 0-Uvod: Pregled in nastavitev delavnice
  - 1-Izbor-AI-Predloge: Postopek odkrivanja in izbire predloge
  - 2-Validacija-AI-Predloge: Postopki implementacije in validacije
  - 3-Razčlenitev-AI-Predloge: Razumevanje arhitekture predloge
  - 4-Konfiguracija-AI-Predloge: Konfiguracija in prilagoditev
  - 5-Prilagoditev-AI-Predloge: Napredne spremembe in iteracije
  - 6-Odstranitev-Infrastrukture: Čiščenje in upravljanje virov
  - 7-Zaključek: Povzetek in naslednji koraki
- **🛠️ Orodja za delavnice**: Konfiguracija MkDocs z Material temo za izboljšano učno izkušnjo
- **🎯 Praktična učna pot**: 3-stopenjska metodologija (Odkrivanje → Implementacija → Prilagoditev)
- **📱 Integracija GitHub Codespaces**: Brezhibna nastavitev razvojnega okolja

#### Izboljšano
- **AI laboratorij za delavnice**: Razširjen s celovito 2-3 urnim strukturiranim učnim procesom
- **Dokumentacija delavnic**: Profesionalna predstavitev z navigacijo in vizualnimi pripomočki
- **Napredovanje učenja**: Jasno vodstvo korak za korakom od izbire predloge do implementacije v produkcijo
- **Izkušnja razvijalcev**: Integrirana orodja za poenostavljene razvojne poteke dela

#### Izboljšano
- **Dostopnost**: Vmesnik v brskalniku z iskanjem, funkcijo kopiranja in preklopom teme
- **Samostojno učenje**: Prilagodljiva struktura delavnice za različne hitrosti učenja
- **Praktična uporaba**: Scenariji implementacije AI predlog v resničnem svetu
- **Integracija skupnosti**: Integracija Discorda za podporo in sodelovanje pri delavnicah

#### Funkcije delavnice
- **Vgrajeno iskanje**: Hitro iskanje ključnih besed in lekcij
- **Kopiranje kodnih blokov**: Funkcija kopiranja z lebdenjem za vse primere kode
- **Preklop teme**: Podpora za temni/svetli način za različne preference
- **Vizualna gradiva**: Posnetki zaslona in diagrami za boljše razumevanje
- **Integracija pomoči**: Neposreden dostop do Discorda za podporo skupnosti
- **Predstavitev vsebine**: Odstranjeni dekorativni elementi v korist jasne, profesionalne postavitve
- **Struktura povezav**: Posodobljene vse notranje povezave za podporo novemu navigacijskemu sistemu

#### Izboljšano
- **Dostopnost**: Odstranjena odvisnost od emojijev za boljšo združljivost z bralniki zaslona
- **Profesionalni videz**: Čista, akademska predstavitev, primerna za učenje v podjetjih
- **Izkušnja učenja**: Strukturiran pristop z jasnimi cilji in rezultati za vsako lekcijo
- **Organizacija vsebine**: Bolj logičen tok in povezava med sorodnimi temami

### [v1.0.0] - 2025-09-09

#### Prva izdaja - Celovita AZD učna zbirka

#### Dodano
- **Osnovna struktura dokumentacije**
  - Celoten niz vodičev za začetek
  - Celovita dokumentacija za uvajanje in pripravo
  - Podrobni viri za odpravljanje težav in vodiči za odpravljanje napak
  - Orodja in postopki za preverjanje pred uvajanjem

- **Modul za začetek**
  - Osnove AZD: Temeljni koncepti in terminologija
  - Vodič za namestitev: Navodila za nastavitev glede na platformo
  - Vodič za konfiguracijo: Nastavitev okolja in avtentikacija
  - Prvi projektni vodič: Korak za korakom praktično učenje

- **Modul za uvajanje in pripravo**
  - Vodič za uvajanje: Celovita dokumentacija delovnega procesa
  - Vodič za pripravo: Infrastruktura kot koda z Bicepom
  - Najboljše prakse za uvajanje v produkcijo
  - Vzorci arhitekture za več storitev

- **Modul za preverjanje pred uvajanjem**
  - Načrtovanje zmogljivosti: Preverjanje razpoložljivosti virov Azure
  - Izbira SKU: Celovita navodila za izbiro storitvenih nivojev
  - Preverjanje pred uvajanjem: Avtomatizirani skripti za preverjanje (PowerShell in Bash)
  - Orodja za oceno stroškov in načrtovanje proračuna

- **Modul za odpravljanje težav**
  - Pogoste težave: Pogosto srečane težave in rešitve
  - Vodič za odpravljanje napak: Sistematične metodologije za odpravljanje težav
  - Napredne diagnostične tehnike in orodja
  - Spremljanje zmogljivosti in optimizacija

- **Viri in reference**
  - Kratka referenca ukazov: Hitri vodič za ključne ukaze
  - Slovar: Celovite definicije terminologije in kratic
  - Pogosta vprašanja: Podrobni odgovori na pogosta vprašanja
  - Povezave do zunanjih virov in povezave s skupnostjo

- **Primeri in predloge**
  - Primer preproste spletne aplikacije
  - Predloga za uvajanje statične spletne strani
  - Konfiguracija aplikacije v kontejnerju
  - Vzorci integracije podatkovnih baz
  - Primeri arhitekture mikrostoritev
  - Implementacije funkcij brez strežnika

#### Funkcije
- **Podpora za več platform**: Vodiči za namestitev in konfiguracijo za Windows, macOS in Linux
- **Različne ravni znanja**: Vsebina zasnovana za študente in profesionalne razvijalce
- **Praktična usmerjenost**: Praktični primeri in scenariji iz resničnega sveta
- **Celovita pokritost**: Od osnovnih konceptov do naprednih vzorcev za podjetja
- **Varnost na prvem mestu**: Najboljše prakse za varnost vključene povsod
- **Optimizacija stroškov**: Navodila za stroškovno učinkovito uvajanje in upravljanje virov

#### Kakovost dokumentacije
- **Podrobni primeri kode**: Praktični, preizkušeni primeri kode
- **Navodila korak za korakom**: Jasna, izvedljiva navodila
- **Celovito obravnavanje napak**: Odpravljanje pogostih težav
- **Integracija najboljših praks**: Industrijski standardi in priporočila
- **Združljivost različic**: Posodobljeno z najnovejšimi storitvami Azure in funkcijami azd

## Načrtovane prihodnje izboljšave

### Različica 3.1.0 (Načrtovano)
#### Razširitev AI platforme
- **Podpora za več modelov**: Vzorci integracije za Hugging Face, Azure Machine Learning in prilagojene modele
- **Okviri za AI agente**: Predloge za uvajanje LangChain, Semantic Kernel in AutoGen
- **Napredni vzorci RAG**: Možnosti za vektorske baze podatkov poleg Azure AI Search (Pinecone, Weaviate itd.)
- **Opazovanje AI**: Izboljšano spremljanje zmogljivosti modelov, uporabe žetonov in kakovosti odgovorov

#### Izkušnja razvijalca
- **Razširitev za VS Code**: Integrirana izkušnja razvoja AZD + AI Foundry
- **Integracija GitHub Copilot**: Generiranje predlog AZD s pomočjo AI
- **Interaktivni vodiči**: Praktične vaje kodiranja z avtomatiziranim preverjanjem za scenarije AI
- **Video vsebine**: Dodatni video vodiči za vizualne učence, osredotočeni na uvajanje AI

### Različica 4.0.0 (Načrtovano)
#### Vzorci za AI v podjetjih
- **Okvir za upravljanje**: Upravljanje modelov AI, skladnost in revizijske sledi
- **AI za več najemnikov**: Vzorci za storitve AI za več strank z ločenimi storitvami
- **Uvajanje AI na robu**: Integracija z Azure IoT Edge in kontejnerskimi primerki
- **Hibridni oblak AI**: Vzorci za uvajanje AI delovnih obremenitev v več oblakih in hibridnih okoljih

#### Napredne funkcije
- **Avtomatizacija AI cevovodov**: Integracija MLOps z cevovodi Azure Machine Learning
- **Napredna varnost**: Vzorci ničelnega zaupanja, zasebne končne točke in napredna zaščita pred grožnjami
- **Optimizacija zmogljivosti**: Napredne strategije za prilagajanje in skaliranje za aplikacije AI z visokim pretokom
- **Globalna distribucija**: Vzorci za dostavo vsebine in predpomnjenje na robu za aplikacije AI

### Različica 3.0.0 (Načrtovano) - Nadomeščena z aktualno izdajo
#### Predlagane dodatke - Sedaj implementirani v v3.0.0
- ✅ **Vsebina osredotočena na AI**: Celovita integracija Azure AI Foundry (Zaključeno)
- ✅ **Interaktivni vodiči**: Praktična delavnica za AI (Zaključeno)
- ✅ **Napredni varnostni modul**: Vzorci varnosti specifični za AI (Zaključeno)
- ✅ **Optimizacija zmogljivosti**: Strategije za prilagajanje delovnih obremenitev AI (Zaključeno)

### Različica 2.1.0 (Načrtovano) - Delno implementirano v v3.0.0
#### Manjše izboljšave - Nekatere zaključene v aktualni izdaji
- ✅ **Dodatni primeri**: Scenariji uvajanja osredotočeni na AI (Zaključeno)
- ✅ **Razširjena pogosta vprašanja**: Vprašanja in odpravljanje težav specifičnih za AI (Zaključeno)
- **Integracija orodij**: Izboljšani vodiči za integracijo IDE in urejevalnikov
- ✅ **Razširjeno spremljanje**: Vzorci spremljanja in opozarjanja specifični za AI (Zaključeno)

#### Še vedno načrtovano za prihodnje izdaje
- **Dokumentacija prijazna mobilnim napravam**: Prilagodljiv dizajn za učenje na mobilnih napravah
- **Dostop brez povezave**: Prenosljivi paketi dokumentacije
- **Izboljšana integracija IDE**: Razširitev za VS Code za delovne tokove AZD + AI
- **Nadzorna plošča skupnosti**: Meritve skupnosti v realnem času in sledenje prispevkom

## Prispevanje k dnevniku sprememb

### Poročanje o spremembah
Pri prispevanju v to zbirko se prepričajte, da vnosi v dnevnik sprememb vključujejo:

1. **Številka različice**: Po semantičnem verzioniranju (glavna.manša.popravek)
2. **Datum**: Datum izdaje ali posodobitve v formatu LLLL-MM-DD
3. **Kategorija**: Dodano, Spremenjeno, Zastarelo, Odstranjeno, Popravljeno, Varnost
4. **Jasna opis**: Jedrnat opis spremembe
5. **Ocena vpliva**: Kako spremembe vplivajo na obstoječe uporabnike

### Kategorije sprememb

#### Dodano
- Nove funkcije, razdelki dokumentacije ali zmogljivosti
- Novi primeri, predloge ali učni viri
- Dodatna orodja, skripti ali pripomočki

#### Spremenjeno
- Spremembe obstoječe funkcionalnosti ali dokumentacije
- Posodobitve za izboljšanje jasnosti ali natančnosti
- Prestrukturiranje vsebine ali organizacije

#### Zastarelo
- Funkcije ali pristopi, ki se postopoma ukinjajo
- Razdelki dokumentacije, načrtovani za odstranitev
- Metode, ki imajo boljše alternative

#### Odstranjeno
- Funkcije, dokumentacija ali primeri, ki niso več relevantni
- Zastarele informacije ali zastareli pristopi
- Odvečne ali združene vsebine

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

## Povratne informacije skupnosti in predlogi

Aktivno spodbujamo povratne informacije skupnosti za izboljšanje tega učnega vira:

### Kako posredovati povratne informacije
- **GitHub Issues**: Prijavite težave ali predlagajte izboljšave (AI-specifične težave dobrodošle)
- **Discord razprave**: Delite ideje in sodelujte s skupnostjo Azure AI Foundry
- **Pull Requests**: Prispevajte neposredne izboljšave vsebine, zlasti predloge in vodiče za AI
- **Azure AI Foundry Discord**: Sodelujte v kanalu #Azure za razprave o AZD + AI
- **Forumi skupnosti**: Sodelujte v širših razpravah razvijalcev Azure

### Kategorije povratnih informacij
- **Natančnost AI vsebine**: Popravki informacij o integraciji in uvajanju storitev AI
- **Izkušnja učenja**: Predlogi za izboljšan tok učenja za razvijalce AI
- **Manjkajoča AI vsebina**: Zahteve za dodatne predloge, vzorce ali primere AI
- **Dostopnost**: Izboljšave za raznolike učne potrebe
- **Integracija AI orodij**: Predlogi za boljšo integracijo delovnih tokov razvoja AI
- **Vzorce za produkcijo AI**: Zahteve za vzorce uvajanja AI v podjetjih

### Zavezanost odzivu
- **Odziv na težave**: V 48 urah za prijavljene težave
- **Zahteve za funkcije**: Ocena v enem tednu
- **Prispevki skupnosti**: Pregled v enem tednu
- **Varnostne težave**: Takojšnja prioriteta z pospešenim odzivom

## Načrt vzdrževanja

### Redne posodobitve
- **Mesečni pregledi**: Natančnost vsebine in preverjanje povezav
- **Četrtletne posodobitve**: Glavne dodatke in izboljšave vsebine
- **Polletni pregledi**: Celovito prestrukturiranje in izboljšave
- **Letne izdaje**: Glavne posodobitve različic z znatnimi izboljšavami

### Spremljanje in zagotavljanje kakovosti
- **Avtomatizirano testiranje**: Redno preverjanje primerov kode in povezav
- **Integracija povratnih informacij skupnosti**: Redno vključevanje uporabniških predlogov
- **Posodobitve tehnologije**: Usklajenost z najnovejšimi storitvami Azure in izdaji azd
- **Revizije dostopnosti**: Redni pregledi za vključujoče oblikovalske principe

## Politika podpore različic

### Podpora za aktualne različice
- **Najnovejša glavna različica**: Polna podpora z rednimi posodobitvami
- **Prejšnja glavna različica**: Posodobitve varnosti in kritični popravki za 12 mesecev
- **Zastarele različice**: Podpora skupnosti, brez uradnih posodobitev

### Smernice za migracijo
Ko so izdane glavne različice, nudimo:
- **Vodiči za migracijo**: Navodila za prehod korak za korakom
- **Opombe o združljivosti**: Podrobnosti o spremembah, ki prekinjajo združljivost
- **Podpora za orodja**: Skripti ali pripomočki za pomoč pri migraciji
- **Podpora skupnosti**: Namenski forumi za vprašanja o migraciji

---

**Navigacija**
- **Prejšnja lekcija**: [Vodič za študij](resources/study-guide.md)
- **Naslednja lekcija**: Vrni se na [Glavni README](README.md)

**Ostanite obveščeni**: Spremljajte to zbirko za obvestila o novih izdajah in pomembnih posodobitvah učnih gradiv.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:  
Ta dokument je bil preveden z uporabo storitve za prevajanje AI [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem maternem jeziku naj se šteje za avtoritativni vir. Za ključne informacije priporočamo profesionalni človeški prevod. Ne odgovarjamo za morebitne nesporazume ali napačne razlage, ki bi nastale zaradi uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->