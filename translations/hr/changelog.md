<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ae2cfa632f02df516d4e7cdddbb4a8b5",
  "translation_date": "2025-10-24T18:09:56+00:00",
  "source_file": "changelog.md",
  "language_code": "hr"
}
-->
# Dnevnik promjena - AZD za početnike

## Uvod

Ovaj dnevnik promjena dokumentira sve značajne promjene, ažuriranja i poboljšanja u repozitoriju AZD za početnike. Pratimo principe semantičkog verzioniranja i održavamo ovaj zapis kako bismo korisnicima pomogli razumjeti što se promijenilo između verzija.

## Ciljevi učenja

Pregledom ovog dnevnika promjena, moći ćete:
- Biti informirani o novim značajkama i dodacima sadržaja
- Razumjeti poboljšanja u postojećoj dokumentaciji
- Pratiti ispravke grešaka i osigurati točnost
- Pratiti razvoj obrazovnih materijala kroz vrijeme

## Ishodi učenja

Nakon pregleda unosa u dnevniku promjena, moći ćete:
- Identificirati novi sadržaj i resurse dostupne za učenje
- Razumjeti koje su sekcije ažurirane ili poboljšane
- Planirati svoj put učenja na temelju najnovijih materijala
- Dati povratne informacije i prijedloge za buduća poboljšanja

## Povijest verzija

### [v3.4.0] - 2025-10-24

#### Poboljšanja pregleda infrastrukture i validacije
**Ova verzija uvodi sveobuhvatnu podršku za novu značajku pregleda Azure Developer CLI i poboljšava korisničko iskustvo radionica.**

#### Dodano
- **🧪 Dokumentacija značajke azd provision --preview**: Sveobuhvatan pregled nove mogućnosti pregleda infrastrukture
  - Referenca naredbi i primjeri korištenja u priručniku
  - Detaljna integracija u vodič za provisioniranje s primjerima upotrebe i prednostima
  - Integracija provjere prije implementacije za sigurniju validaciju
  - Ažuriranja vodiča za početak rada s praksama sigurnog implementiranja
- **🚧 Banner statusa radionice**: Profesionalni HTML banner koji označava status razvoja radionice
  - Dizajn s gradijentom i indikatorima gradnje za jasnu komunikaciju s korisnicima
  - Vrijeme posljednjeg ažuriranja za transparentnost
  - Dizajn prilagođen mobilnim uređajima za sve vrste uređaja

#### Poboljšano
- **Sigurnost infrastrukture**: Funkcionalnost pregleda integrirana u cijelu dokumentaciju o implementaciji
- **Validacija prije implementacije**: Automatizirani skripti sada uključuju testiranje pregleda infrastrukture
- **Razvojni tijek rada**: Ažurirani slijed naredbi uključuje pregled kao najbolju praksu
- **Iskustvo radionice**: Jasno postavljena očekivanja za korisnike o statusu razvoja sadržaja

#### Promijenjeno
- **Najbolje prakse implementacije**: Preporučuje se tijek rada s pregledom kao prvi korak
- **Tijek dokumentacije**: Validacija infrastrukture premještena ranije u proces učenja
- **Prezentacija radionice**: Profesionalna komunikacija statusa s jasnim vremenskim okvirom razvoja

#### Poboljšano
- **Pristup sigurnosti**: Promjene infrastrukture sada se mogu validirati prije implementacije
- **Suradnja tima**: Rezultati pregleda mogu se dijeliti za pregled i odobrenje
- **Svijest o troškovima**: Bolje razumijevanje troškova resursa prije provisioniranja
- **Smanjenje rizika**: Smanjeni neuspjesi implementacije kroz unaprijed validaciju

#### Tehnička implementacija
- **Integracija više dokumenata**: Značajka pregleda dokumentirana u 4 ključne datoteke
- **Uzorci naredbi**: Dosljedna sintaksa i primjeri kroz cijelu dokumentaciju
- **Integracija najboljih praksi**: Pregled uključen u validacijske tijekove rada i skripte
- **Vizualni indikatori**: Jasne oznake NOVIH značajki za lakše otkrivanje

#### Infrastruktura radionice
- **Komunikacija statusa**: Profesionalni HTML banner s gradijentnim stilom
- **Korisničko iskustvo**: Jasno označen status razvoja sprječava zabunu
- **Profesionalna prezentacija**: Održava kredibilitet repozitorija uz postavljanje očekivanja
- **Transparentnost vremenskog okvira**: Vrijeme posljednjeg ažuriranja u listopadu 2025. za odgovornost

### [v3.3.0] - 2025-09-24

#### Poboljšani materijali radionice i interaktivno iskustvo učenja
**Ova verzija uvodi sveobuhvatne materijale radionice s interaktivnim vodičima u pregledniku i strukturiranim putovima učenja.**

#### Dodano
- **🎥 Interaktivni vodič za radionicu**: Iskustvo radionice u pregledniku s mogućnošću pregleda MkDocs
- **📝 Strukturirane upute za radionicu**: Vodič za učenje u 7 koraka od otkrivanja do prilagodbe
  - 0-Uvod: Pregled radionice i postavljanje
  - 1-Odabir-AI-predloška: Proces otkrivanja i odabira predloška
  - 2-Validacija-AI-predloška: Postupci implementacije i validacije
  - 3-Razlaganje-AI-predloška: Razumijevanje arhitekture predloška
  - 4-Konfiguracija-AI-predloška: Konfiguracija i prilagodba
  - 5-Prilagodba-AI-predloška: Napredne modifikacije i iteracije
  - 6-Razgradnja-infrastrukture: Čišćenje i upravljanje resursima
  - 7-Zaključak: Sažetak i sljedeći koraci
- **🛠️ Alati za radionicu**: Konfiguracija MkDocs s temom Material za poboljšano iskustvo učenja
- **🎯 Praktični put učenja**: Metodologija u 3 koraka (Otkrivanje → Implementacija → Prilagodba)
- **📱 Integracija s GitHub Codespaces**: Besprijekorno postavljanje razvojnog okruženja

#### Poboljšano
- **Laboratorij AI radionice**: Proširen s sveobuhvatnim strukturiranim iskustvom učenja od 2-3 sata
- **Dokumentacija radionice**: Profesionalna prezentacija s navigacijom i vizualnim pomagalima
- **Progresija učenja**: Jasne upute korak po korak od odabira predloška do implementacije u produkciju
- **Razvojno iskustvo**: Integrirani alati za pojednostavljene tijekove rada razvoja

#### Poboljšano
- **Pristupačnost**: Sučelje u pregledniku s pretraživanjem, funkcijom kopiranja i prebacivanjem tema
- **Samostalno učenje**: Fleksibilna struktura radionice koja prilagođava različite brzine učenja
- **Praktična primjena**: Scenariji implementacije AI predloška u stvarnom svijetu
- **Integracija zajednice**: Integracija Discorda za podršku radionici i suradnju

#### Značajke radionice
- **Ugrađeno pretraživanje**: Brzo otkrivanje ključnih riječi i lekcija
- **Kopiranje blokova koda**: Funkcija kopiranja na hover za sve primjere koda
- **Prebacivanje tema**: Podrška za tamni/svijetli način rada za različite preferencije
- **Vizualni materijali**: Snimke zaslona i dijagrami za poboljšano razumijevanje
- **Integracija pomoći**: Direktan pristup Discordu za podršku zajednice

### [v3.2.0] - 2025-09-17

#### Velika restrukturacija navigacije i sustav učenja po poglavljima
**Ova verzija uvodi sveobuhvatan sustav učenja po poglavljima s poboljšanom navigacijom kroz cijeli repozitorij.**

#### Dodano
- **📚 Sustav učenja po poglavljima**: Restrukturiran cijeli tečaj u 8 progresivnih poglavlja učenja
  - Poglavlje 1: Osnove i brzi početak (⭐ - 30-45 min)
  - Poglavlje 2: Razvoj s AI-jem (⭐⭐ - 1-2 sata)
  - Poglavlje 3: Konfiguracija i autentifikacija (⭐⭐ - 45-60 min)
  - Poglavlje 4: Infrastruktura kao kod i implementacija (⭐⭐⭐ - 1-1.5 sati)
  - Poglavlje 5: AI rješenja s više agenata (⭐⭐⭐⭐ - 2-3 sata)
  - Poglavlje 6: Validacija prije implementacije i planiranje (⭐⭐ - 1 sat)
  - Poglavlje 7: Rješavanje problema i otklanjanje grešaka (⭐⭐ - 1-1.5 sati)
  - Poglavlje 8: Produkcija i obrasci za poduzeća (⭐⭐⭐⭐ - 2-3 sata)
- **📚 Sveobuhvatan navigacijski sustav**: Dosljedni navigacijski zaglavlja i podnožja kroz svu dokumentaciju
- **🎯 Praćenje napretka**: Popis za provjeru završetka tečaja i sustav verifikacije učenja
- **🗺️ Vodič za put učenja**: Jasne ulazne točke za različite razine iskustva i ciljeve
- **🔗 Navigacija s unakrsnim referencama**: Jasno povezivanje povezanih poglavlja i preduvjeta

#### Poboljšano
- **Struktura README datoteke**: Pretvorena u strukturiranu platformu za učenje s organizacijom po poglavljima
- **Navigacija dokumentacijom**: Svaka stranica sada uključuje kontekst poglavlja i vodič za progresiju
- **Organizacija predložaka**: Primjeri i predlošci povezani s odgovarajućim poglavljima učenja
- **Integracija resursa**: Priručnici, FAQ-ovi i vodiči za učenje povezani s relevantnim poglavljima
- **Integracija radionice**: Praktični laboratoriji povezani s ciljevima učenja u više poglavlja

#### Promijenjeno
- **Progresija učenja**: Premješteno s linearne dokumentacije na fleksibilno učenje po poglavljima
- **Položaj konfiguracije**: Vodič za konfiguraciju premješten kao Poglavlje 3 za bolji tijek učenja
- **Integracija AI sadržaja**: Bolja integracija AI-specifičnog sadržaja kroz cijelo putovanje učenja
- **Produkcijski sadržaj**: Napredni obrasci konsolidirani u Poglavlje 8 za korporativne korisnike

#### Poboljšano
- **Korisničko iskustvo**: Jasni navigacijski tragovi i indikatori progresije poglavlja
- **Pristupačnost**: Dosljedni navigacijski uzorci za lakše kretanje kroz tečaj
- **Profesionalna prezentacija**: Struktura tečaja u stilu sveučilišta pogodna za akademsku i korporativnu obuku
- **Učinkovitost učenja**: Smanjeno vrijeme za pronalaženje relevantnog sadržaja kroz poboljšanu organizaciju

#### Tehnička implementacija
- **Navigacijski zaglavlja**: Standardizirana navigacija poglavlja kroz 40+ dokumentacijskih datoteka
- **Navigacija u podnožju**: Dosljedni vodiči za progresiju i indikatori završetka poglavlja
- **Unakrsno povezivanje**: Sveobuhvatan sustav unutarnjeg povezivanja povezanih koncepata
- **Mapiranje poglavlja**: Predlošci i primjeri jasno povezani s ciljevima učenja

#### Poboljšanje vodiča za učenje
- **📚 Sveobuhvatni ciljevi učenja**: Restrukturiran vodič za učenje kako bi se uskladio sa sustavom od 8 poglavlja
- **🎯 Procjena po poglavljima**: Svako poglavlje uključuje specifične ciljeve učenja i praktične vježbe
- **📋 Praćenje napretka**: Tjedni raspored učenja s mjerljivim ishodima i popisima za provjeru završetka
- **❓ Pitanja za procjenu**: Pitanja za validaciju znanja za svako poglavlje s profesionalnim ishodima
- **🛠️ Praktične vježbe**: Aktivnosti s stvarnim scenarijima implementacije i otklanjanja grešaka
- **📊 Napredak vještina**: Jasno napredovanje od osnovnih koncepata do obrazaca za poduzeća s fokusom na razvoj karijere
- **🎓 Okvir za certifikaciju**: Ishodi profesionalnog razvoja i sustav priznanja zajednice
- **⏱️ Upravljanje vremenskim okvirom**: Strukturirani plan učenja od 10 tjedana s validacijom prekretnica

### [v3.1.0] - 2025-09-17

#### Poboljšana rješenja s više AI agenata
**Ova verzija poboljšava rješenje za maloprodaju s više agenata s boljim imenovanjem agenata i poboljšanom dokumentacijom.**

#### Promijenjeno
- **Terminologija za više agenata**: Zamijenjen "Cora agent" s "Customer agent" u cijelom rješenju za maloprodaju s više agenata radi jasnijeg razumijevanja
- **Arhitektura agenata**: Ažurirana sva dokumentacija, ARM predlošci i primjeri koda za dosljedno korištenje naziva "Customer agent"
- **Primjeri konfiguracije**: Modernizirani uzorci konfiguracije agenata s ažuriranim konvencijama imenovanja
- **Dosljednost dokumentacije**: Osigurano da svi navodi koriste profesionalne, opisne nazive agenata

#### Poboljšano
- **Paket ARM predložaka**: Ažuriran retail-multiagent-arm-template s referencama na Customer agent
- **Arhitekturni dijagrami**: Osvježeni Mermaid dijagrami s ažuriranim imenovanjem agenata
- **Primjeri koda**: Python klase i primjeri implementacije sada koriste naziv CustomerAgent
- **Varijable okruženja**: Ažurirani svi skripti za implementaciju kako bi koristili konvencije CUSTOMER_AGENT_NAME

#### Poboljšano
- **Razvojno iskustvo**: Jasnije uloge i odgovornosti agenata u dokumentaciji
- **Spremnost za produkciju**: Bolje usklađivanje s korporativnim konvencijama imenovanja
- **Materijali za učenje**: Intuitivnije imenovanje agenata za obrazovne svrhe
- **Upotrebljivost predloška**: Pojednostavljeno razumijevanje funkcija agenata i obrazaca implementacije

#### Tehnički detalji
- Ažurirani Mermaid arhitekturni dijagrami s referencama na CustomerAgent
- Zamijenjeni nazivi klasa CoraAgent s CustomerAgent u Python primjerima
- Modificirane ARM konfiguracije predložaka JSON za korištenje tipa agenta "customer"
- Ažurirane varijable okruženja iz CORA_AGENT_* u CUSTOMER_AGENT_* uzorke
- Osvježene sve naredbe za implementaciju i konfiguracije kontejnera

### [v3.0.0] - 2025-09-12

#### Velike promjene - Fokus na AI razvoj i integracija Azure AI Foundry
**Ova verzija transformira repozitorij u sveobuhvatan resurs za učenje usmjeren na AI s integracijom Azure AI Foundry.**

#### Dodano
- **🤖 Put učenja usmjeren na AI**: Potpuna restrukturacija s prioritetom na AI razvojne inženjere
- **Vodič za integraciju Azure AI Foundry**: Sveobuhvatna dokumentacija za povezivanje AZD-a s uslugama Azure AI Foundry
- **Obrasci implementacije AI modela**: Detaljan vodič koji pokriva odabir modela, konfiguraciju i strategije implementacije u produkciju
- **Laboratorij AI radionice**: Praktična radionica od 2-3 sata za pretvaranje AI aplikacija u AZD rješenja za implementaciju
- **Najbolje prakse za produkciju AI**: Obrasci spremni za poduzeća za skaliranje, praćenje i osiguranje AI opterećenja
- **Vodič za otklanjanje problema specifičnih za AI**: Sveobuhvatno otklanjanje problema za Azure OpenAI, Cognitive Services i AI implementacije
- **Galerija AI predložaka**: Istaknuta kolekcija predložaka Azure AI Foundry s ocjenama složenosti
- **Materijali za radionicu**: Kompletna struktura radionice s praktičnim laboratorijima i referentnim materijalima

#### Poboljšano
- **Struktura README datoteke**: Fokusirana na AI razvojne inženjere s 45% podataka o interesu zajednice iz Discorda Azure AI Foundry
- **Putovi učenja**: Posveć
- **Format dokumentacije**: Standardizirana sva dokumentacija s dosljednom strukturom usmjerenom na učenje
- **Navigacijski tok**: Implementiran logičan slijed kroz sve materijale za učenje
- **Prikaz sadržaja**: Uklonjeni dekorativni elementi u korist jasnog, profesionalnog formatiranja
- **Struktura poveznica**: Ažurirane sve interne poveznice kako bi podržale novi navigacijski sustav

#### Poboljšano
- **Pristupačnost**: Uklonjena ovisnost o emojijima radi bolje kompatibilnosti s čitačima ekrana
- **Profesionalni izgled**: Čist, akademski stil prezentacije prikladan za korporativno učenje
- **Iskustvo učenja**: Strukturirani pristup s jasnim ciljevima i rezultatima za svaku lekciju
- **Organizacija sadržaja**: Bolji logičan slijed i povezanost između povezanih tema

### [v1.0.0] - 2025-09-09

#### Početno izdanje - Sveobuhvatan AZD repozitorij za učenje

#### Dodano
- **Osnovna struktura dokumentacije**
  - Kompletan vodič za početak
  - Sveobuhvatna dokumentacija za implementaciju i pripremu
  - Detaljni resursi za rješavanje problema i vodiči za otklanjanje grešaka
  - Alati i postupci za validaciju prije implementacije

- **Modul za početak**
  - Osnove AZD-a: Temeljni koncepti i terminologija
  - Vodič za instalaciju: Upute za postavljanje specifične za platformu
  - Vodič za konfiguraciju: Postavljanje okruženja i autentifikacija
  - Prvi projekt: Vodič korak po korak za praktično učenje

- **Modul za implementaciju i pripremu**
  - Vodič za implementaciju: Dokumentacija kompletnog tijeka rada
  - Vodič za pripremu: Infrastruktura kao kod uz Bicep
  - Najbolje prakse za implementaciju u produkciji
  - Obrasci arhitekture za više usluga

- **Modul za validaciju prije implementacije**
  - Planiranje kapaciteta: Validacija dostupnosti Azure resursa
  - Odabir SKU-a: Sveobuhvatne smjernice za odabir razine usluge
  - Provjere prije implementacije: Automatizirani validacijski skripti (PowerShell i Bash)
  - Alati za procjenu troškova i planiranje budžeta

- **Modul za rješavanje problema**
  - Uobičajeni problemi: Često susretani problemi i rješenja
  - Vodič za otklanjanje grešaka: Sustavne metodologije za rješavanje problema
  - Napredne dijagnostičke tehnike i alati
  - Praćenje performansi i optimizacija

- **Resursi i reference**
  - Brzi vodič za naredbe: Brza referenca za ključne naredbe
  - Pojmovnik: Sveobuhvatne definicije terminologije i akronima
  - FAQ: Detaljni odgovori na često postavljana pitanja
  - Vanjske poveznice na resurse i veze s zajednicom

- **Primjeri i predlošci**
  - Primjer jednostavne web aplikacije
  - Predložak za implementaciju statične web stranice
  - Konfiguracija aplikacije u kontejneru
  - Obrasci za integraciju baza podataka
  - Primjeri arhitekture mikroservisa
  - Implementacije funkcija bez poslužitelja

#### Značajke
- **Podrška za više platformi**: Vodiči za instalaciju i konfiguraciju za Windows, macOS i Linux
- **Različite razine vještina**: Sadržaj namijenjen studentima i profesionalnim programerima
- **Praktični fokus**: Praktični primjeri i scenariji iz stvarnog svijeta
- **Sveobuhvatna pokrivenost**: Od osnovnih koncepata do naprednih korporativnih obrazaca
- **Pristup usmjeren na sigurnost**: Najbolje prakse za sigurnost integrirane u cijelom sadržaju
- **Optimizacija troškova**: Smjernice za isplative implementacije i upravljanje resursima

#### Kvaliteta dokumentacije
- **Detaljni primjeri koda**: Praktični, testirani uzorci koda
- **Upute korak po korak**: Jasne, provedive smjernice
- **Sveobuhvatno rješavanje grešaka**: Rješavanje uobičajenih problema
- **Integracija najboljih praksi**: Industrijski standardi i preporuke
- **Kompatibilnost verzija**: Ažurirano s najnovijim Azure uslugama i značajkama azd-a

## Planirana buduća poboljšanja

### Verzija 3.1.0 (Planirano)
#### Proširenje AI platforme
- **Podrška za više modela**: Obrasci integracije za Hugging Face, Azure Machine Learning i prilagođene modele
- **Okviri za AI agente**: Predlošci za LangChain, Semantic Kernel i AutoGen implementacije
- **Napredni RAG obrasci**: Opcije za vektorske baze podataka osim Azure AI Search (Pinecone, Weaviate itd.)
- **Praćenje AI-a**: Poboljšano praćenje performansi modela, korištenja tokena i kvalitete odgovora

#### Iskustvo programera
- **VS Code ekstenzija**: Integrirano AZD + AI Foundry razvojno iskustvo
- **GitHub Copilot integracija**: AI-asistirano generiranje AZD predložaka
- **Interaktivni vodiči**: Praktične vježbe kodiranja s automatiziranom validacijom za AI scenarije
- **Video sadržaj**: Dodatni video vodiči za vizualne učenike s fokusom na AI implementacije

### Verzija 4.0.0 (Planirano)
#### Korporativni AI obrasci
- **Okvir za upravljanje**: Upravljanje AI modelima, usklađenost i tragovi revizije
- **AI za više korisnika**: Obrasci za pružanje usluga više korisnicima s izoliranim AI uslugama
- **Implementacija AI-a na rubu**: Integracija s Azure IoT Edge i instancama kontejnera
- **Hibridni AI u oblaku**: Obrasci za implementaciju AI radnih opterećenja u više oblaka i hibridnim okruženjima

#### Napredne značajke
- **Automatizacija AI cjevovoda**: MLOps integracija s Azure Machine Learning cjevovodima
- **Napredna sigurnost**: Obrasci za nultu povjerenje, privatne krajnje točke i naprednu zaštitu od prijetnji
- **Optimizacija performansi**: Napredne strategije podešavanja i skaliranja za AI aplikacije visokog kapaciteta
- **Globalna distribucija**: Obrasci za isporuku sadržaja i predmemoriranje na rubu za AI aplikacije

### Verzija 3.0.0 (Planirano) - Zamijenjeno trenutnim izdanjem
#### Predloženi dodaci - Sada implementirani u v3.0.0
- ✅ **Sadržaj usmjeren na AI**: Sveobuhvatna integracija Azure AI Foundry (Dovršeno)
- ✅ **Interaktivni vodiči**: Praktična AI radionica (Dovršeno)
- ✅ **Napredni sigurnosni modul**: Obrasci sigurnosti specifični za AI (Dovršeno)
- ✅ **Optimizacija performansi**: Strategije podešavanja AI radnih opterećenja (Dovršeno)

### Verzija 2.1.0 (Planirano) - Djelomično implementirano u v3.0.0
#### Manja poboljšanja - Neka dovršena u trenutnom izdanju
- ✅ **Dodatni primjeri**: Scenariji implementacije usmjereni na AI (Dovršeno)
- ✅ **Prošireni FAQ**: Pitanja i rješavanje problema specifičnih za AI (Dovršeno)
- **Integracija alata**: Poboljšani vodiči za integraciju IDE-a i uređivača
- ✅ **Proširenje praćenja**: Obrasci za praćenje i upozorenja specifični za AI (Dovršeno)

#### Još planirano za buduće izdanje
- **Dokumentacija prilagođena mobilnim uređajima**: Responzivni dizajn za učenje na mobilnim uređajima
- **Pristup bez interneta**: Paketi dokumentacije za preuzimanje
- **Poboljšana integracija IDE-a**: VS Code ekstenzija za AZD + AI tijekove rada
- **Nadzorna ploča zajednice**: Metrike zajednice u stvarnom vremenu i praćenje doprinosa

## Doprinos promjenama

### Prijava promjena
Prilikom doprinosa ovom repozitoriju, osigurajte da unosi u changelog uključuju:

1. **Broj verzije**: Slijedeći semantičko verzioniranje (glavna.sporedna.zakrpa)
2. **Datum**: Datum izdanja ili ažuriranja u formatu YYYY-MM-DD
3. **Kategorija**: Dodano, Promijenjeno, Zastarjelo, Uklonjeno, Ispravljeno, Sigurnost
4. **Jasan opis**: Sažet opis promjene
5. **Procjena utjecaja**: Kako promjene utječu na postojeće korisnike

### Kategorije promjena

#### Dodano
- Nove značajke, odjeljci dokumentacije ili mogućnosti
- Novi primjeri, predlošci ili resursi za učenje
- Dodatni alati, skripte ili korisni programi

#### Promijenjeno
- Izmjene postojećih funkcionalnosti ili dokumentacije
- Ažuriranja radi poboljšanja jasnoće ili točnosti
- Restrukturiranje sadržaja ili organizacije

#### Zastarjelo
- Značajke ili pristupi koji se postupno ukidaju
- Odjeljci dokumentacije predviđeni za uklanjanje
- Metode koje imaju bolje alternative

#### Uklonjeno
- Značajke, dokumentacija ili primjeri koji više nisu relevantni
- Zastarjele informacije ili zastarjeli pristupi
- Suvišan ili konsolidiran sadržaj

#### Ispravljeno
- Ispravci pogrešaka u dokumentaciji ili kodu
- Rješavanje prijavljenih problema ili poteškoća
- Poboljšanja točnosti ili funkcionalnosti

#### Sigurnost
- Poboljšanja ili ispravci vezani uz sigurnost
- Ažuriranja najboljih praksi za sigurnost
- Rješavanje sigurnosnih ranjivosti

### Smjernice za semantičko verzioniranje

#### Glavna verzija (X.0.0)
- Promjene koje zahtijevaju radnje korisnika
- Značajno restrukturiranje sadržaja ili organizacije
- Promjene koje mijenjaju temeljni pristup ili metodologiju

#### Sporedna verzija (X.Y.0)
- Nove značajke ili dodaci sadržaju
- Poboljšanja koja održavaju kompatibilnost unatrag
- Dodatni primjeri, alati ili resursi

#### Zakrpa verzije (X.Y.Z)
- Ispravci grešaka i korekcije
- Manja poboljšanja postojećeg sadržaja
- Pojašnjenja i mala poboljšanja

## Povratne informacije i prijedlozi zajednice

Aktivno potičemo povratne informacije zajednice kako bismo poboljšali ovaj resurs za učenje:

### Kako pružiti povratne informacije
- **GitHub Issues**: Prijavite probleme ili predložite poboljšanja (dobrodošli su problemi specifični za AI)
- **Discord rasprave**: Podijelite ideje i sudjelujte u zajednici Azure AI Foundry
- **Pull Requests**: Doprinesite izravnim poboljšanjima sadržaja, posebno AI predlošcima i vodičima
- **Azure AI Foundry Discord**: Sudjelujte u #Azure kanalu za AZD + AI rasprave
- **Forumi zajednice**: Sudjelujte u širim raspravama među Azure programerima

### Kategorije povratnih informacija
- **Točnost AI sadržaja**: Ispravci informacija o integraciji i implementaciji AI usluga
- **Iskustvo učenja**: Prijedlozi za poboljšanje tijeka učenja za AI programere
- **Nedostajući AI sadržaj**: Zahtjevi za dodatne AI predloške, obrasce ili primjere
- **Pristupačnost**: Poboljšanja za različite potrebe učenja
- **Integracija AI alata**: Prijedlozi za bolju integraciju tijeka rada AI razvoja
- **Obrasci za produkcijski AI**: Zahtjevi za obrasce implementacije AI u korporativnom okruženju

### Obveza odgovora
- **Odgovor na probleme**: Unutar 48 sati za prijavljene probleme
- **Zahtjevi za značajke**: Procjena unutar tjedan dana
- **Doprinosi zajednice**: Pregled unutar tjedan dana
- **Sigurnosni problemi**: Neposredni prioritet s ubrzanim odgovorom

## Raspored održavanja

### Redovita ažuriranja
- **Mjesečni pregledi**: Točnost sadržaja i validacija poveznica
- **Kvartalna ažuriranja**: Glavni dodaci i poboljšanja sadržaja
- **Polugodišnji pregledi**: Sveobuhvatno restrukturiranje i poboljšanja
- **Godišnja izdanja**: Glavna ažuriranja verzije sa značajnim poboljšanjima

### Praćenje i osiguranje kvalitete
- **Automatizirano testiranje**: Redovita validacija primjera koda i poveznica
- **Integracija povratnih informacija zajednice**: Redovito uključivanje prijedloga korisnika
- **Ažuriranja tehnologije**: Usklađivanje s najnovijim Azure uslugama i izdanjima azd-a
- **Revizije pristupačnosti**: Redoviti pregledi za inkluzivne principe dizajna

## Politika podrške verzijama

### Podrška za trenutnu verziju
- **Najnovija glavna verzija**: Potpuna podrška s redovitim ažuriranjima
- **Prethodna glavna verzija**: Sigurnosna ažuriranja i kritični popravci tijekom 12 mjeseci
- **Zastarjele verzije**: Samo podrška zajednice, bez službenih ažuriranja

### Smjernice za migraciju
Kada se izdaju glavne verzije, pružamo:
- **Vodiče za migraciju**: Upute korak po korak za prijelaz
- **Napomene o kompatibilnosti**: Detalji o promjenama koje prekidaju kompatibilnost
- **Podrška za alate**: Skripte ili alati za pomoć pri migraciji
- **Podrška zajednice**: Namjenski forumi za pitanja o migraciji

---

**Navigacija**
- **Prethodna lekcija**: [Vodič za učenje](resources/study-guide.md)
- **Sljedeća lekcija**: Povratak na [Glavni README](README.md)

**Ostanite ažurirani**: Pratite ovaj repozitorij za obavijesti o novim izdanjima i važnim ažuriranjima materijala za učenje.

---

**Izjava o odricanju odgovornosti**:  
Ovaj dokument je preveden pomoću AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za ključne informacije preporučuje se profesionalni prijevod od strane čovjeka. Ne preuzimamo odgovornost za nesporazume ili pogrešna tumačenja koja proizlaze iz korištenja ovog prijevoda.