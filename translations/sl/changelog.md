<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "73f4ab6147d5fac5f8c5ad72742e8e1d",
  "translation_date": "2025-09-18T12:56:34+00:00",
  "source_file": "changelog.md",
  "language_code": "sl"
}
-->
# Dnevnik sprememb - AZD za začetnike

## Uvod

Ta dnevnik sprememb dokumentira vse pomembne spremembe, posodobitve in izboljšave v repozitoriju AZD za začetnike. Sledimo načelom semantičnega verzioniranja in vzdržujemo ta dnevnik, da uporabnikom pomagamo razumeti, kaj se je spremenilo med različicami.

## Cilji učenja

Z pregledom tega dnevnika sprememb boste:
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

### [v3.2.0] - 17. september 2025

#### Glavna prestrukturacija navigacije in sistem učenja po poglavjih
**Ta različica uvaja celovito strukturo učenja po poglavjih z izboljšano navigacijo po celotnem repozitoriju.**

#### Dodano
- **📚 Sistem učenja po poglavjih**: Prestrukturiran celoten tečaj v 8 progresivnih učnih poglavij
  - Poglavje 1: Osnove in hitri začetek (⭐ - 30-45 minut)
  - Poglavje 2: Razvoj z AI na prvem mestu (⭐⭐ - 1-2 uri)
  - Poglavje 3: Konfiguracija in avtentikacija (⭐⭐ - 45-60 minut)
  - Poglavje 4: Infrastruktura kot koda in uvajanje (⭐⭐⭐ - 1-1,5 ure)
  - Poglavje 5: Rešitve z več agenti AI (⭐⭐⭐⭐ - 2-3 ure)
  - Poglavje 6: Validacija pred uvajanjem in načrtovanje (⭐⭐ - 1 ura)
  - Poglavje 7: Odpravljanje težav in razhroščevanje (⭐⭐ - 1-1,5 ure)
  - Poglavje 8: Proizvodni in podjetniški vzorci (⭐⭐⭐⭐ - 2-3 ure)
- **📚 Celovit navigacijski sistem**: Dosledni navigacijski glavi in nogi v celotni dokumentaciji
- **🎯 Sledenje napredku**: Seznam za preverjanje dokončanja tečaja in sistem za preverjanje učenja
- **🗺️ Vodnik po učni poti**: Jasne vstopne točke za različne ravni izkušenj in cilje
- **🔗 Navzkrižna navigacija**: Jasno povezane povezave med povezanimi poglavji in predpogoji

#### Izboljšano
- **Struktura README**: Pretvorjena v strukturirano učno platformo z organizacijo po poglavjih
- **Navigacija dokumentacije**: Vsaka stran zdaj vključuje kontekst poglavja in smernice za napredovanje
- **Organizacija predlog**: Primeri in predloge povezani z ustreznimi učnimi poglavji
- **Integracija virov**: Pomožne liste, pogosta vprašanja in študijski vodiči povezani z ustreznimi poglavji
- **Integracija delavnic**: Praktične laboratorijske vaje povezane z več učnimi cilji poglavij

#### Spremenjeno
- **Napredovanje učenja**: Premik iz linearne dokumentacije na prilagodljivo učenje po poglavjih
- **Postavitev konfiguracije**: Premeščena konfiguracijska navodila v poglavje 3 za boljši učni tok
- **Integracija AI vsebine**: Boljša integracija vsebine, povezane z AI, skozi celotno učno pot
- **Proizvodna vsebina**: Napredni vzorci združeni v poglavje 8 za podjetniške učence

#### Izboljšano
- **Uporabniška izkušnja**: Jasne navigacijske poti in kazalniki napredovanja po poglavjih
- **Dostopnost**: Dosledni navigacijski vzorci za lažje premikanje po tečaju
- **Profesionalna predstavitev**: Struktura tečaja v univerzitetnem slogu, primerna za akademsko in korporativno usposabljanje
- **Učna učinkovitost**: Zmanjšan čas za iskanje ustrezne vsebine z izboljšano organizacijo

#### Tehnična izvedba
- **Navigacijski glavi**: Standardizirana navigacija po poglavjih v več kot 40 dokumentacijskih datotekah
- **Navigacija v nogi**: Dosledne smernice za napredovanje in kazalniki dokončanja poglavij
- **Navzkrižno povezovanje**: Celovit sistem notranjih povezav, ki povezuje sorodne koncepte
- **Zemljevid poglavij**: Predloge in primeri jasno povezani z učnimi cilji

#### Izboljšava študijskega vodiča
- **📚 Celoviti učni cilji**: Prestrukturiran študijski vodič, ki se ujema s sistemom 8 poglavij
- **🎯 Ocena po poglavjih**: Vsako poglavje vključuje specifične učne cilje in praktične vaje
- **📋 Sledenje napredku**: Tedenski učni urnik z merljivimi rezultati in seznami za preverjanje dokončanja
- **❓ Vprašanja za oceno**: Vprašanja za preverjanje znanja za vsako poglavje z profesionalnimi rezultati
- **🛠️ Praktične vaje**: Praktične aktivnosti z resničnimi scenariji uvajanja in odpravljanja težav
- **📊 Napredovanje veščin**: Jasno napredovanje od osnovnih konceptov do podjetniških vzorcev s poudarkom na kariernem razvoju
- **🎓 Okvir za certificiranje**: Profesionalni razvojni rezultati in sistem priznanja skupnosti
- **⏱️ Upravljanje časovnice**: Strukturiran 10-tedenski učni načrt z validacijo mejnikov

### [v3.1.0] - 17. september 2025

#### Izboljšane rešitve z več agenti AI
**Ta različica izboljšuje rešitev za več agentov v maloprodaji z boljšim poimenovanjem agentov in izboljšano dokumentacijo.**

#### Spremenjeno
- **Terminologija več agentov**: Zamenjava "agent Cora" z "agent stranke" v celotni rešitvi za več agentov v maloprodaji za boljše razumevanje
- **Arhitektura agentov**: Posodobljena vsa dokumentacija, ARM predloge in primeri kode za dosledno poimenovanje "agent stranke"
- **Primeri konfiguracije**: Posodobljeni vzorci konfiguracije agentov z novimi poimenovalnimi konvencijami
- **Doslednost dokumentacije**: Zagotovljeno, da vse reference uporabljajo profesionalna, opisna imena agentov

#### Izboljšano
- **ARM paket predlog**: Posodobljena ARM predloga za več agentov v maloprodaji z referencami na agenta stranke
- **Diagrami arhitekture**: Osveženi diagrami Mermaid z novim poimenovanjem agentov
- **Primeri kode**: Python razredi in primeri implementacije zdaj uporabljajo poimenovanje CustomerAgent
- **Spremenljivke okolja**: Posodobljeni vsi skripti za uvajanje, da uporabljajo konvencije CUSTOMER_AGENT_NAME

#### Izboljšano
- **Izkušnja razvijalca**: Jasnejše vloge in odgovornosti agentov v dokumentaciji
- **Pripravljenost za proizvodnjo**: Boljše usklajevanje s podjetniškimi poimenovalnimi konvencijami
- **Učna gradiva**: Bolj intuitivno poimenovanje agentov za izobraževalne namene
- **Uporabnost predlog**: Poenostavljeno razumevanje funkcij agentov in vzorcev uvajanja

#### Tehnične podrobnosti
- Posodobljeni diagrami arhitekture Mermaid z referencami na CustomerAgent
- Zamenjava imen razredov CoraAgent z CustomerAgent v Python primerih
- Spremenjene konfiguracije ARM predlog JSON za uporabo tipa agenta "customer"
- Posodobljene spremenljivke okolja iz CORA_AGENT_* v CUSTOMER_AGENT_* vzorce
- Osveženi vsi ukazi za uvajanje in konfiguracije kontejnerjev

### [v3.0.0] - 12. september 2025

#### Glavne spremembe - Fokus na AI razvijalce in integracija Azure AI Foundry
**Ta različica preoblikuje repozitorij v celovito učno gradivo, osredotočeno na AI, z integracijo Azure AI Foundry.**

#### Dodano
- **🤖 Učna pot z AI na prvem mestu**: Popolna prestrukturacija s poudarkom na AI razvijalcih in inženirjih
- **Vodnik za integracijo Azure AI Foundry**: Celovita dokumentacija za povezovanje AZD z Azure AI Foundry storitvami
- **Vzorce uvajanja AI modelov**: Podroben vodnik, ki pokriva izbiro modelov, konfiguracijo in strategije uvajanja v produkcijo
- **Laboratorij AI delavnic**: 2-3 ure praktične delavnice za pretvorbo AI aplikacij v AZD rešitve
- **Najboljše prakse za produkcijo AI**: Vzorci, pripravljeni za podjetja, za skaliranje, spremljanje in varovanje AI delovnih obremenitev
- **Vodnik za odpravljanje težav, specifičnih za AI**: Celovito odpravljanje težav za Azure OpenAI, Cognitive Services in težave pri uvajanju AI
- **Galerija predlog AI**: Izbor predlog Azure AI Foundry z oceno kompleksnosti
- **Materiali za delavnice**: Popolna struktura delavnic s praktičnimi laboratorijskimi vajami in referenčnimi gradivi

#### Izboljšano
- **Struktura README**: Osredotočena na AI razvijalce z 45 % podatkov o zanimanju skupnosti iz Discorda Azure AI Foundry
- **Učne poti**: Namenska pot za AI razvijalce poleg tradicionalnih poti za študente in DevOps inženirje
- **Priporočila predlog**: Izbrane AI predloge, vključno z azure-search-openai-demo, contoso-chat in openai-chat-app-quickstart
- **Integracija skupnosti**: Izboljšana podpora skupnosti Discord z AI specifičnimi kanali in razpravami

#### Varnost in fokus na produkcijo
- **Vzorce upravljanih identitet**: Specifične konfiguracije avtentikacije in varnosti za AI
- **Optimizacija stroškov**: Sledenje uporabi žetonov in nadzor proračuna za AI delovne obremenitve
- **Uvajanje v več regijah**: Strategije za globalno uvajanje AI aplikacij
- **Spremljanje zmogljivosti**: Specifične meritve za AI in integracija Application Insights

#### Kakovost dokumentacije
- **Linearna struktura tečaja**: Logično napredovanje od začetnika do naprednih vzorcev uvajanja AI
- **Validirani URL-ji**: Vse zunanje povezave repozitorija preverjene in dostopne
- **Popolna referenca**: Vse notranje povezave dokumentacije preverjene in funkcionalne
- **Pripravljenost za produkcijo**: Vzorci uvajanja za podjetja z resničnimi primeri

### [v2.0.0] - 9. september 2025

#### Glavne spremembe - Prestrukturiranje repozitorija in profesionalna izboljšava
**Ta različica predstavlja pomembno prenovo strukture repozitorija in predstavitve vsebine.**

#### Dodano
- **Strukturiran učni okvir**: Vse strani dokumentacije zdaj vključujejo uvod, cilje učenja in rezultate učenja
- **Navigacijski sistem**: Dodane povezave na prejšnjo/naslednjo lekcijo skozi celotno dokumentacijo za vodeno napredovanje učenja
- **Študijski vodič**: Celovit study-guide.md z učnimi cilji, praktičnimi vajami in ocenjevalnimi gradivi
- **Profesionalna predstavitev**: Odstranjeni vsi emoji za izboljšano dostopnost in profesionalni videz
- **Izboljšana struktura vsebine**: Izboljšana organizacija in tok učnih gradiv

#### Spremenjeno
- **Format dokumentacije**: Standardizirana vsa dokumentacija z dosledno strukturo, osredotočeno na učenje
- **Tok navigacije**: Implementirano logično napredovanje skozi vsa učna gradiva
- **Predstavitev vsebine**: Odstranjeni dekorativni elementi v korist jasnega, profesionalnega formatiranja
- **Struktura povezav**: Posodobljene vse notranje povezave za podporo novemu navigacijskemu sistemu

#### Izboljšano
- **Dostopnost**: Odstranjena odvisnost od emoji za boljšo združljivost z bralniki zaslona
- **Profesionalni videz**: Čista, akademska predstavitev, primerna za podjetniško učenje
- **Izkušnja učenja**: Strukturiran pristop z jasnimi cilji in rezultati za vsako lekcijo
- **Organizacija vsebine**: Boljši logični tok in povezava med sorodnimi temami

### [v1.0.0] - 9. september 2025

#### Prva izdaja - Celovit učni repozitorij AZD

#### Dodano
- **Osnovna struktura dokumentacije**
  - Popolna serija vodnikov za začetek
  - Celovita dokumentacija za uvajanje in pripravo
  - Podrobni viri za odpravljanje težav in razhroščevanje
  - Orodja in postopki za validacijo pred uvajanjem

- **Modul za začetek**
  - Osnove AZD: Temeljni koncepti in terminologija
  - Vodnik za namestitev: Navodila za nastavitev glede na platformo
  - Vodnik za konfiguracijo: Nastavitev okolja in avtentikacija
  - Prvi projekt: Korak za korakom praktično učenje

- **Modul za uvajanje in pripravo**
  - Vodnik za uvajanje: Celovita dokumentacija delovnega toka
  - Vodnik za pripravo: Infrastruktura kot koda z Bicepom
  - Najboljše prakse za uvajanje v produkcijo
  - Vzorci arhitekture za več storitev

- **Modul za validacijo pred uvajanjem**
  - Načrtovanje zmogljivosti: Validacija razpoložljivosti virov Azure
  - Izbira SKU: Celovita navodila za izbiro storitvenih nivojev
  - Preverjanje pred uvajanjem: Avtomatizirani validacijski skripti (PowerShell in Bash)
  - Orodja za oceno stroškov in načrtovanje proračuna

- **Modul za odpravljanje težav**
  - Pogoste težave: Pogosto srečane težave in rešitve
  - Vodnik za razhroščevanje: Sistematične metodologije odpravljanja težav
  - Napredne diagnostične tehnike in orodja
  - Spremljanje zmogljivosti in optimizacija

- **Viri in reference**
  - Pomožni list ukazov: Hitri referenčni vodič za ključne ukaze
  - Slovar: Celovite definicije terminologije in kratic
  - Pogosta vprašanja: Podrobni odgovori na pogosta vprašanja
  - Zunanje povezave virov in povezave skupnosti

- **Primeri in predloge**
  - Primer preproste spletne aplikacije
  - Predloga za uvajanje statične spletne strani
  - Konfiguracija aplikacije v kontejnerju
  - Vzorci integracije podatkovnih baz
  - Primeri arhitekture mikro storitev
  - Implementacije funkcij brez strežnika

#### Funkcije
- **Podpora za več platform**: Vodniki za namestitev in konfiguracijo za Windows, macOS in Linux
- **Različne ravni znanja**: Vsebina zasnovana za študente do profesionalnih razvijalcev
- **Praktična usmerjenost**: Praktični primeri in scenariji iz resničnega sveta
- **Celovita pokritost**: Od osnovnih konceptov do naprednih podjetniških vzorcev
- **Pristop z varnostjo na prvem mestu**: Najboljše prakse za varnost vključene povsod
- **Optimizacija stroškov**: Navodila za stroškovno učinkovito uvajanje in upravljanje virov

#### Kakovost dokumentacije
- **Podrobni primeri kode**: Praktični, preizkušeni primer
- **Avtomatizacija AI cevovodov**: Integracija MLOps z Azure Machine Learning cevovodi  
- **Napredna varnost**: Vzorci ničelnega zaupanja, zasebne končne točke in napredna zaščita pred grožnjami  
- **Optimizacija zmogljivosti**: Napredne strategije prilagajanja in skaliranja za aplikacije AI z visokim pretokom  
- **Globalna distribucija**: Vzorci dostave vsebine in predpomnjenja na robu za AI aplikacije  

### Različica 3.0.0 (Načrtovano) - Nadomeščeno z aktualno izdajo  
#### Predlagane dodatke - Zdaj implementirano v v3.0.0  
- ✅ **Vsebina osredotočena na AI**: Celovita integracija Azure AI Foundry (Zaključeno)  
- ✅ **Interaktivni vodiči**: Praktična delavnica AI (Zaključeno)  
- ✅ **Napredni varnostni modul**: Varnostni vzorci specifični za AI (Zaključeno)  
- ✅ **Optimizacija zmogljivosti**: Strategije prilagajanja delovnih obremenitev AI (Zaključeno)  

### Različica 2.1.0 (Načrtovano) - Delno implementirano v v3.0.0  
#### Manjše izboljšave - Nekatere zaključene v aktualni izdaji  
- ✅ **Dodatni primeri**: Scenariji uvajanja osredotočeni na AI (Zaključeno)  
- ✅ **Razširjen FAQ**: Specifična vprašanja in reševanje težav za AI (Zaključeno)  
- **Integracija orodij**: Izboljšani vodiči za integracijo IDE in urejevalnikov  
- ✅ **Razširjeno spremljanje**: Vzorci spremljanja in opozarjanja specifični za AI (Zaključeno)  

#### Še načrtovano za prihodnje izdaje  
- **Dokumentacija prijazna mobilnim napravam**: Prilagodljiv dizajn za učenje na mobilnih napravah  
- **Dostop brez povezave**: Prenosljivi paketi dokumentacije  
- **Izboljšana integracija IDE**: Razširitev za VS Code za AZD + AI delovne tokove  
- **Nadzorna plošča skupnosti**: Sledenje metrikam skupnosti v realnem času in prispevkom  

## Prispevanje k dnevniku sprememb  

### Poročanje o spremembah  
Pri prispevanju v to repozitorij poskrbite, da vnosi v dnevnik sprememb vključujejo:  

1. **Številka različice**: Po semantičnem verzioniranju (glavna.manša.popravek)  
2. **Datum**: Datum izdaje ali posodobitve v formatu YYYY-MM-DD  
3. **Kategorija**: Dodano, Spremenjeno, Zastarelo, Odstranjeno, Popravljeno, Varnost  
4. **Jasen opis**: Jedrnat opis spremembe  
5. **Ocena vpliva**: Kako spremembe vplivajo na obstoječe uporabnike  

### Kategorije sprememb  

#### Dodano  
- Nove funkcije, razdelki dokumentacije ali zmogljivosti  
- Novi primeri, predloge ali učni viri  
- Dodatna orodja, skripte ali pripomočki  

#### Spremenjeno  
- Spremembe obstoječe funkcionalnosti ali dokumentacije  
- Posodobitve za izboljšanje jasnosti ali natančnosti  
- Prestrukturiranje vsebine ali organizacije  

#### Zastarelo  
- Funkcije ali pristopi, ki se ukinjajo  
- Razdelki dokumentacije, načrtovani za odstranitev  
- Metode, ki imajo boljše alternative  

#### Odstranjeno  
- Funkcije, dokumentacija ali primeri, ki niso več relevantni  
- Zastarele informacije ali ukinjeni pristopi  
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
- Spremembe, ki zahtevajo ukrepanje uporabnika  
- Pomembno prestrukturiranje vsebine ali organizacije  
- Spremembe, ki spreminjajo temeljni pristop ali metodologijo  

#### Manjša različica (X.Y.0)  
- Nove funkcije ali dodatki vsebine  
- Izboljšave, ki ohranjajo združljivost nazaj  
- Dodatni primeri, orodja ali viri  

#### Popravna različica (X.Y.Z)  
- Popravki napak in korekcije  
- Manjše izboljšave obstoječe vsebine  
- Pojasnila in manjše izboljšave  

## Povratne informacije skupnosti in predlogi  

Aktivno spodbujamo povratne informacije skupnosti za izboljšanje tega učnega vira:  

### Kako posredovati povratne informacije  
- **GitHub Issues**: Prijavite težave ali predlagajte izboljšave (dobrodošle specifične za AI)  
- **Discord razprave**: Delite ideje in sodelujte s skupnostjo Azure AI Foundry  
- **Pull Requests**: Prispevajte neposredne izboljšave vsebine, zlasti predloge in vodiče za AI  
- **Azure AI Foundry Discord**: Sodelujte v kanalu #Azure za razprave o AZD + AI  
- **Forumi skupnosti**: Sodelujte v širših razpravah razvijalcev Azure  

### Kategorije povratnih informacij  
- **Natančnost AI vsebine**: Popravki informacij o integraciji in uvajanju AI storitev  
- **Učna izkušnja**: Predlogi za izboljšanje učnega toka za razvijalce AI  
- **Manjkajoča AI vsebina**: Zahteve za dodatne predloge, vzorce ali primere AI  
- **Dostopnost**: Izboljšave za raznolike učne potrebe  
- **Integracija AI orodij**: Predlogi za boljšo integracijo delovnih tokov razvoja AI  
- **Vzorce za produkcijo AI**: Zahteve za vzorce uvajanja AI v podjetjih  

### Zavezanost odzivu  
- **Odziv na težave**: V 48 urah za prijavljene težave  
- **Zahteve za funkcije**: Ocena v enem tednu  
- **Prispevki skupnosti**: Pregled v enem tednu  
- **Varnostne težave**: Prednostna obravnava z pospešenim odzivom  

## Načrt vzdrževanja  

### Redne posodobitve  
- **Mesečni pregledi**: Natančnost vsebine in validacija povezav  
- **Četrtletne posodobitve**: Glavne dodatke in izboljšave vsebine  
- **Polletni pregledi**: Celovito prestrukturiranje in izboljšave  
- **Letne izdaje**: Glavne posodobitve različic z pomembnimi izboljšavami  

### Spremljanje in zagotavljanje kakovosti  
- **Avtomatizirano testiranje**: Redna validacija primerov kode in povezav  
- **Integracija povratnih informacij skupnosti**: Redno vključevanje predlogov uporabnikov  
- **Posodobitve tehnologije**: Usklajevanje z najnovejšimi storitvami Azure in izdaje azd  
- **Revizije dostopnosti**: Redni pregledi za vključujoče oblikovalske principe  

## Politika podpore različic  

### Podpora za aktualne različice  
- **Najnovejša glavna različica**: Polna podpora z rednimi posodobitvami  
- **Prejšnja glavna različica**: Varnostne posodobitve in kritični popravki za 12 mesecev  
- **Zapuščene različice**: Podpora skupnosti, brez uradnih posodobitev  

### Smernice za migracijo  
Ko so izdane glavne različice, zagotavljamo:  
- **Vodiči za migracijo**: Korak za korakom navodila za prehod  
- **Opombe o združljivosti**: Podrobnosti o prelomnih spremembah  
- **Podpora za orodja**: Skripte ali pripomočke za pomoč pri migraciji  
- **Podpora skupnosti**: Namenski forumi za vprašanja o migraciji  

---

**Navigacija**  
- **Prejšnja lekcija**: [Vodič za študij](resources/study-guide.md)  
- **Naslednja lekcija**: Vrni se na [Glavni README](README.md)  

**Ostanite obveščeni**: Spremljajte ta repozitorij za obvestila o novih izdajah in pomembnih posodobitvah učnih gradiv.  

---

**Omejitev odgovornosti**:  
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem maternem jeziku je treba obravnavati kot avtoritativni vir. Za ključne informacije priporočamo profesionalni človeški prevod. Ne prevzemamo odgovornosti za morebitna nesporazumevanja ali napačne razlage, ki bi nastale zaradi uporabe tega prevoda.