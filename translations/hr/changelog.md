<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "73f4ab6147d5fac5f8c5ad72742e8e1d",
  "translation_date": "2025-09-18T11:56:46+00:00",
  "source_file": "changelog.md",
  "language_code": "hr"
}
-->
# Dnevnik promjena - AZD za početnike

## Uvod

Ovaj dnevnik promjena dokumentira sve značajne promjene, ažuriranja i poboljšanja u repozitoriju AZD za početnike. Pratimo principe semantičkog verzioniranja i održavamo ovaj dnevnik kako bismo korisnicima pomogli razumjeti što se promijenilo između verzija.

## Ciljevi učenja

Pregledom ovog dnevnika promjena, moći ćete:
- Biti informirani o novim značajkama i dodacima sadržaja
- Razumjeti poboljšanja postojeće dokumentacije
- Pratiti ispravke grešaka i osigurati točnost
- Pratiti razvoj obrazovnih materijala tijekom vremena

## Ishodi učenja

Nakon pregleda unosa u dnevniku promjena, moći ćete:
- Prepoznati novi sadržaj i resurse dostupne za učenje
- Razumjeti koji su dijelovi ažurirani ili poboljšani
- Planirati svoj put učenja na temelju najnovijih materijala
- Davati povratne informacije i prijedloge za buduća poboljšanja

## Povijest verzija

### [v3.2.0] - 2025-09-17

#### Velika reorganizacija navigacije i sustav učenja temeljen na poglavljima
**Ova verzija uvodi sveobuhvatnu strukturu učenja po poglavljima s poboljšanom navigacijom kroz cijeli repozitorij.**

#### Dodano
- **📚 Sustav učenja temeljen na poglavljima**: Restrukturiran cijeli tečaj u 8 progresivnih poglavlja za učenje
  - Poglavlje 1: Osnove i brzi početak (⭐ - 30-45 min)
  - Poglavlje 2: Razvoj s fokusom na AI (⭐⭐ - 1-2 sata)
  - Poglavlje 3: Konfiguracija i autentifikacija (⭐⭐ - 45-60 min)
  - Poglavlje 4: Infrastruktura kao kod i implementacija (⭐⭐⭐ - 1-1,5 sati)
  - Poglavlje 5: AI rješenja s više agenata (⭐⭐⭐⭐ - 2-3 sata)
  - Poglavlje 6: Validacija i planiranje prije implementacije (⭐⭐ - 1 sat)
  - Poglavlje 7: Rješavanje problema i otklanjanje grešaka (⭐⭐ - 1-1,5 sati)
  - Poglavlje 8: Obrasci za produkciju i poduzeća (⭐⭐⭐⭐ - 2-3 sata)
- **📚 Sveobuhvatan navigacijski sustav**: Dosljedni zaglavlja i podnožja navigacije kroz svu dokumentaciju
- **🎯 Praćenje napretka**: Popis za provjeru završetka tečaja i sustav za provjeru znanja
- **🗺️ Vodič za put učenja**: Jasne ulazne točke za različite razine iskustva i ciljeve
- **🔗 Križna navigacija**: Jasno povezani povezani dijelovi i preduvjeti

#### Poboljšano
- **Struktura README datoteke**: Pretvorena u strukturiranu platformu za učenje s organizacijom po poglavljima
- **Navigacija dokumentacijom**: Svaka stranica sada uključuje kontekst poglavlja i smjernice za napredovanje
- **Organizacija predložaka**: Primjeri i predlošci mapirani na odgovarajuća poglavlja za učenje
- **Integracija resursa**: Brzi vodiči, često postavljana pitanja i vodiči za učenje povezani s relevantnim poglavljima
- **Integracija radionica**: Praktične laboratorijske vježbe mapirane na ciljeve učenja iz više poglavlja

#### Promijenjeno
- **Progresija učenja**: Prelazak s linearne dokumentacije na fleksibilno učenje po poglavljima
- **Položaj konfiguracije**: Premješten vodič za konfiguraciju u Poglavlje 3 radi boljeg tijeka učenja
- **Integracija AI sadržaja**: Bolja integracija AI-specifičnog sadržaja kroz cijeli proces učenja
- **Sadržaj za produkciju**: Napredni obrasci konsolidirani u Poglavlje 8 za poduzeća

#### Poboljšano
- **Korisničko iskustvo**: Jasne navigacijske oznake i indikatori napredovanja kroz poglavlja
- **Pristupačnost**: Dosljedni navigacijski obrasci za lakše kretanje kroz tečaj
- **Profesionalna prezentacija**: Struktura tečaja u stilu sveučilišta pogodna za akademsku i korporativnu obuku
- **Učinkovitost učenja**: Smanjeno vrijeme za pronalazak relevantnog sadržaja kroz poboljšanu organizaciju

#### Tehnička implementacija
- **Navigacijska zaglavlja**: Standardizirana navigacija po poglavljima kroz više od 40 dokumentacijskih datoteka
- **Navigacija u podnožju**: Dosljedne smjernice za napredovanje i indikatori završetka poglavlja
- **Križno povezivanje**: Sveobuhvatan sustav unutarnjeg povezivanja povezanih koncepata
- **Mapiranje poglavlja**: Predlošci i primjeri jasno povezani s ciljevima učenja

#### Poboljšanje vodiča za učenje
- **📚 Sveobuhvatni ciljevi učenja**: Restrukturiran vodič za učenje kako bi se uskladio s 8-poglavlja sustavom
- **🎯 Procjena po poglavljima**: Svako poglavlje uključuje specifične ciljeve učenja i praktične vježbe
- **📋 Praćenje napretka**: Tjedni raspored učenja s mjerljivim ishodima i popisima za provjeru
- **❓ Pitanja za procjenu**: Pitanja za provjeru znanja za svako poglavlje s profesionalnim ishodima
- **🛠️ Praktične vježbe**: Praktične aktivnosti s pravim scenarijima implementacije i otklanjanja grešaka
- **📊 Napredak vještina**: Jasno napredovanje od osnovnih koncepata do obrazaca za poduzeća s fokusom na razvoj karijere
- **🎓 Okvir za certifikaciju**: Ishodi profesionalnog razvoja i sustav prepoznavanja u zajednici
- **⏱️ Upravljanje vremenom**: Strukturiran plan učenja od 10 tjedana s validacijom prekretnica

### [v3.1.0] - 2025-09-17

#### Poboljšana rješenja s više AI agenata
**Ova verzija poboljšava rješenje za maloprodaju s više agenata s boljim imenovanjem agenata i poboljšanom dokumentacijom.**

#### Promijenjeno
- **Terminologija za više agenata**: Zamijenjen naziv "Cora agent" s "Customer agent" u cijelom rješenju za maloprodaju radi jasnijeg razumijevanja
- **Arhitektura agenata**: Ažurirana sva dokumentacija, ARM predlošci i primjeri koda kako bi se koristilo dosljedno imenovanje "Customer agent"
- **Primjeri konfiguracije**: Modernizirani obrasci konfiguracije agenata s ažuriranim nazivima
- **Dosljednost dokumentacije**: Osigurano da svi navodi koriste profesionalna i opisna imena agenata

#### Poboljšano
- **ARM paket predložaka**: Ažuriran retail-multiagent-arm-template s referencama na Customer agenta
- **Dijagrami arhitekture**: Osvježeni Mermaid dijagrami s ažuriranim imenovanjem agenata
- **Primjeri koda**: Python klase i primjeri implementacije sada koriste imenovanje CustomerAgent
- **Varijable okruženja**: Ažurirani svi skripti za implementaciju kako bi koristili konvencije CUSTOMER_AGENT_NAME

#### Poboljšano
- **Iskustvo za programere**: Jasnije uloge i odgovornosti agenata u dokumentaciji
- **Spremnost za produkciju**: Bolje usklađivanje s konvencijama imenovanja u poduzećima
- **Materijali za učenje**: Intuitivnije imenovanje agenata za obrazovne svrhe
- **Upotrebljivost predložaka**: Pojednostavljeno razumijevanje funkcija agenata i obrazaca implementacije

#### Tehnički detalji
- Ažurirani Mermaid dijagrami arhitekture s referencama na CustomerAgent
- Zamijenjeni nazivi klasa CoraAgent s CustomerAgent u Python primjerima
- Modificirane JSON konfiguracije ARM predložaka za korištenje tipa agenta "customer"
- Ažurirane varijable okruženja iz CORA_AGENT_* u CUSTOMER_AGENT_* obrasce
- Osvježene sve naredbe za implementaciju i konfiguracije kontejnera

### [v3.0.0] - 2025-09-12

#### Glavne promjene - Fokus na AI razvoj i integracija s Azure AI Foundry
**Ova verzija transformira repozitorij u sveobuhvatan resurs za učenje s fokusom na AI s integracijom Azure AI Foundry.**

#### Dodano
- **🤖 Put učenja s fokusom na AI**: Potpuna restrukturacija s prioritetom na AI programere i inženjere
- **Vodič za integraciju s Azure AI Foundry**: Sveobuhvatna dokumentacija za povezivanje AZD-a s Azure AI Foundry uslugama
- **Obrasci za implementaciju AI modela**: Detaljan vodič koji pokriva odabir modela, konfiguraciju i strategije za produkcijsku implementaciju
- **AI radionica**: Praktična radionica od 2-3 sata za konverziju AI aplikacija u AZD rješenja
- **Najbolje prakse za produkciju AI-a**: Obrasci spremni za poduzeća za skaliranje, praćenje i osiguranje AI radnih opterećenja
- **Vodič za otklanjanje problema specifičnih za AI**: Sveobuhvatno otklanjanje problema za Azure OpenAI, Cognitive Services i AI implementacije
- **Galerija AI predložaka**: Istaknuta kolekcija predložaka Azure AI Foundry s ocjenama složenosti
- **Materijali za radionice**: Kompletna struktura radionica s praktičnim laboratorijima i referentnim materijalima

#### Poboljšano
- **Struktura README datoteke**: Fokusirana na AI programere s 45% podataka o interesu zajednice iz Azure AI Foundry Discorda
- **Putovi učenja**: Posvećen put za AI programere uz tradicionalne putove za studente i DevOps inženjere
- **Preporuke predložaka**: Istaknuti AI predlošci uključujući azure-search-openai-demo, contoso-chat i openai-chat-app-quickstart
- **Integracija zajednice**: Poboljšana podrška za Discord zajednicu s AI-specifičnim kanalima i raspravama

#### Fokus na sigurnost i produkciju
- **Obrasci za upravljane identitete**: AI-specifične konfiguracije autentifikacije i sigurnosti
- **Optimizacija troškova**: Praćenje korištenja tokena i kontrola proračuna za AI radna opterećenja
- **Implementacija u više regija**: Strategije za globalnu implementaciju AI aplikacija
- **Praćenje performansi**: AI-specifične metrike i integracija s Application Insights

#### Kvaliteta dokumentacije
- **Linearni tijek tečaja**: Logičan napredak od početnika do naprednih obrazaca za implementaciju AI-a
- **Validirani URL-ovi**: Svi vanjski linkovi repozitorija provjereni i dostupni
- **Kompletna referenca**: Svi unutarnji linkovi dokumentacije validirani i funkcionalni
- **Spremnost za produkciju**: Obrasci za implementaciju u poduzećima s primjerima iz stvarnog svijeta

### [v2.0.0] - 2025-09-09

#### Glavne promjene - Restrukturiranje repozitorija i profesionalno poboljšanje
**Ova verzija predstavlja značajnu reviziju strukture repozitorija i prezentacije sadržaja.**

#### Dodano
- **Strukturirani okvir za učenje**: Sve stranice dokumentacije sada uključuju uvod, ciljeve učenja i ishode učenja
- **Navigacijski sustav**: Dodane poveznice za prethodnu/sljedeću lekciju kroz svu dokumentaciju za vođeni napredak u učenju
- **Vodič za učenje**: Sveobuhvatan study-guide.md s ciljevima učenja, praktičnim vježbama i materijalima za procjenu
- **Profesionalna prezentacija**: Uklonjeni svi emoji simboli radi poboljšane pristupačnosti i profesionalnog izgleda
- **Poboljšana struktura sadržaja**: Poboljšana organizacija i tijek obrazovnih materijala

#### Promijenjeno
- **Format dokumentacije**: Standardizirana sva dokumentacija s dosljednom strukturom usmjerenom na učenje
- **Navigacijski tijek**: Implementiran logičan napredak kroz sve obrazovne materijale
- **Prezentacija sadržaja**: Uklonjeni dekorativni elementi u korist jasnog i profesionalnog formatiranja
- **Struktura poveznica**: Ažurirane sve unutarnje poveznice kako bi podržale novi navigacijski sustav

#### Poboljšano
- **Pristupačnost**: Uklonjena ovisnost o emojijima radi bolje kompatibilnosti sa čitačima ekrana
- **Profesionalni izgled**: Čista, akademska prezentacija pogodna za učenje u poduzećima
- **Iskustvo učenja**: Strukturirani pristup s jasnim ciljevima i ishodima za svaku lekciju
- **Organizacija sadržaja**: Bolji logički tijek i povezanost između povezanih tema

### [v1.0.0] - 2025-09-09

#### Početno izdanje - Sveobuhvatan AZD repozitorij za učenje

#### Dodano
- **Osnovna struktura dokumentacije**
  - Kompletan niz vodiča za početak
  - Sveobuhvatna dokumentacija za implementaciju i provisioniranje
  - Detaljni resursi za otklanjanje problema i vodiči za dijagnostiku
  - Alati i postupci za validaciju prije implementacije

- **Modul za početak**
  - Osnove AZD-a: Ključni koncepti i terminologija
  - Vodič za instalaciju: Upute za postavljanje specifične za platformu
  - Vodič za konfiguraciju: Postavljanje okruženja i autentifikacija
  - Prvi projekt: Korak-po-korak praktično učenje

- **Modul za implementaciju i provisioniranje**
  - Vodič za implementaciju: Kompletna dokumentacija tijeka rada
  - Vodič za provisioniranje: Infrastruktura kao kod s Bicepom
  - Najbolje prakse za produkcijske implementacije
  - Obrasci za arhitekturu s više usluga

- **Modul za validaciju prije implementacije**
  - Planiranje kapaciteta: Validacija dostupnosti Azure resursa
  - Odabir SKU-a: Sveobuhvatan vodič za odabir razine usluge
  - Provjere prije implementacije: Automatizirani validacijski skripti (PowerShell i Bash)
  - Alati za procjenu troškova i planiranje proračuna

- **Modul za otklanjanje problema**
  - Uobičajeni problemi: Često susretani problemi i rješenja
  - Vodič za dijagnostiku: Sustavne metodologije za otklanjanje problema
  - Napredne dijagnostičke tehnike i alati
  - Praćenje performansi i optimizacija

- **Resursi i reference**
  - Brzi vodič za naredbe: Brza referenca za ključne naredbe
  - Pojmovnik: Sveobuhvatne definicije terminologije i akronima
  - Često postavljana pitanja: Detaljni odgovori na uobičajena pitanja
  - Vanjske poveznice na resurse i veze sa zajednicom

- **Primjeri i predlošci**
  - Primjer jednostavne web aplikacije
  - Predložak za implementaciju statične web stranice
  - Konfiguracija aplikacije u kontejneru
  - Obrasci za integraciju baza podataka
  - Primjeri arhitekture mikroservisa
  - Implementacije serverless funkcija

#### Značajke
- **Podrška za više platformi**: Vodiči za instalaciju i konfiguraciju za Windows, macOS i Linux
- **Različite razine vještina**: Sadržaj dizajniran za studente do profesionalnih programera
- **Praktični fokus**: Praktični primjeri i scenariji iz stvarnog svijeta
- **Sveobuhvatna pokrivenost**: Od osnovnih koncepata do naprednih obrazaca za poduzeća
- **Sigurnost na prvom mjestu**: Najbolje
- **Automatizacija AI cjevovoda**: Integracija MLOps-a s Azure Machine Learning cjevovodima  
- **Napredna sigurnost**: Zero-trust obrasci, privatne krajnje točke i napredna zaštita od prijetnji  
- **Optimizacija performansi**: Napredne strategije podešavanja i skaliranja za AI aplikacije visokog kapaciteta  
- **Globalna distribucija**: Obrasci za isporuku sadržaja i predmemoriranje na rubnim točkama za AI aplikacije  

### Verzija 3.0.0 (Planirano) - Zamijenjeno trenutnim izdanjem  
#### Predloženi dodaci - Sada implementirani u v3.0.0  
- ✅ **Sadržaj usmjeren na AI**: Sveobuhvatna integracija Azure AI Foundry (Dovršeno)  
- ✅ **Interaktivni vodiči**: Praktična radionica za AI (Dovršeno)  
- ✅ **Napredni sigurnosni modul**: Sigurnosni obrasci specifični za AI (Dovršeno)  
- ✅ **Optimizacija performansi**: Strategije podešavanja radnih opterećenja za AI (Dovršeno)  

### Verzija 2.1.0 (Planirano) - Djelomično implementirano u v3.0.0  
#### Manja poboljšanja - Neka dovršena u trenutnom izdanju  
- ✅ **Dodatni primjeri**: Scenariji implementacije usmjereni na AI (Dovršeno)  
- ✅ **Prošireni FAQ**: Pitanja i rješavanje problema specifičnih za AI (Dovršeno)  
- **Integracija alata**: Poboljšani vodiči za integraciju IDE-a i uređivača  
- ✅ **Proširenje praćenja**: Obrasci za praćenje i upozorenja specifični za AI (Dovršeno)  

#### Još uvijek planirano za buduće izdanje  
- **Dokumentacija prilagođena mobilnim uređajima**: Responzivni dizajn za učenje na mobilnim uređajima  
- **Pristup bez interneta**: Paketi dokumentacije za preuzimanje  
- **Poboljšana integracija IDE-a**: VS Code ekstenzija za AZD + AI radne tokove  
- **Zajednički nadzorna ploča**: Praćenje metrika zajednice u stvarnom vremenu i doprinosi  

## Doprinos promjenama  

### Prijavljivanje promjena  
Prilikom doprinosa ovom repozitoriju, osigurajte da unosi u dnevnik promjena uključuju:  

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
- Izmjene postojeće funkcionalnosti ili dokumentacije  
- Ažuriranja radi poboljšanja jasnoće ili točnosti  
- Restrukturiranje sadržaja ili organizacije  

#### Zastarjelo  
- Značajke ili pristupi koji se postupno ukidaju  
- Odjeljci dokumentacije predviđeni za uklanjanje  
- Metode koje imaju bolje alternative  

#### Uklonjeno  
- Značajke, dokumentacija ili primjeri koji više nisu relevantni  
- Zastarjele informacije ili ukinuti pristupi  
- Redundantni ili konsolidirani sadržaj  

#### Ispravljeno  
- Ispravci pogrešaka u dokumentaciji ili kodu  
- Rješavanje prijavljenih problema ili poteškoća  
- Poboljšanja točnosti ili funkcionalnosti  

#### Sigurnost  
- Poboljšanja ili ispravci vezani uz sigurnost  
- Ažuriranja najboljih sigurnosnih praksi  
- Rješavanje sigurnosnih ranjivosti  

### Smjernice za semantičko verzioniranje  

#### Glavna verzija (X.0.0)  
- Promjene koje prekidaju kompatibilnost i zahtijevaju akciju korisnika  
- Značajno restrukturiranje sadržaja ili organizacije  
- Promjene koje mijenjaju temeljni pristup ili metodologiju  

#### Sporedna verzija (X.Y.0)  
- Nove značajke ili dodaci sadržaju  
- Poboljšanja koja održavaju kompatibilnost unatrag  
- Dodatni primjeri, alati ili resursi  

#### Zakrpa (X.Y.Z)  
- Ispravci grešaka i korekcije  
- Manja poboljšanja postojećeg sadržaja  
- Pojašnjenja i male nadogradnje  

## Povratne informacije zajednice i prijedlozi  

Aktivno potičemo povratne informacije zajednice kako bismo poboljšali ovaj resurs za učenje:  

### Kako pružiti povratne informacije  
- **GitHub Issues**: Prijavite probleme ili predložite poboljšanja (dobrodošli su problemi specifični za AI)  
- **Discord rasprave**: Podijelite ideje i sudjelujte u zajednici Azure AI Foundry  
- **Pull Requests**: Doprinesite izravnim poboljšanjima sadržaja, posebno AI predlošcima i vodičima  
- **Azure AI Foundry Discord**: Sudjelujte u #Azure kanalu za rasprave o AZD + AI  
- **Zajednički forumi**: Sudjelujte u širim raspravama o razvoju na Azure platformi  

### Kategorije povratnih informacija  
- **Točnost AI sadržaja**: Ispravci informacija o integraciji i implementaciji AI usluga  
- **Iskustvo učenja**: Prijedlozi za poboljšanje tijeka učenja za AI programere  
- **Nedostajući AI sadržaj**: Zahtjevi za dodatnim AI predlošcima, obrascima ili primjerima  
- **Pristupačnost**: Poboljšanja za različite potrebe učenja  
- **Integracija AI alata**: Prijedlozi za bolju integraciju radnih tokova za AI razvoj  
- **Obrasci za AI u produkciji**: Zahtjevi za obrasce implementacije AI u poduzećima  

### Obveza odgovora  
- **Odgovor na probleme**: Unutar 48 sati za prijavljene probleme  
- **Zahtjevi za značajke**: Procjena unutar tjedan dana  
- **Doprinosi zajednice**: Pregled unutar tjedan dana  
- **Sigurnosni problemi**: Prioritetno s ubrzanim odgovorom  

## Raspored održavanja  

### Redovita ažuriranja  
- **Mjesečni pregledi**: Provjera točnosti sadržaja i valjanosti poveznica  
- **Kvartalna ažuriranja**: Veći dodaci i poboljšanja sadržaja  
- **Polugodišnji pregledi**: Sveobuhvatno restrukturiranje i poboljšanja  
- **Godišnja izdanja**: Glavna ažuriranja verzije sa značajnim poboljšanjima  

### Praćenje i osiguranje kvalitete  
- **Automatsko testiranje**: Redovita provjera valjanosti primjera koda i poveznica  
- **Integracija povratnih informacija zajednice**: Redovito uključivanje prijedloga korisnika  
- **Ažuriranja tehnologije**: Usklađivanje s najnovijim Azure uslugama i izdanjima azd-a  
- **Revizije pristupačnosti**: Redoviti pregledi za inkluzivne dizajnerske principe  

## Politika podrške verzijama  

### Podrška za trenutnu verziju  
- **Najnovija glavna verzija**: Potpuna podrška s redovitim ažuriranjima  
- **Prethodna glavna verzija**: Sigurnosna ažuriranja i kritični popravci tijekom 12 mjeseci  
- **Zastarjele verzije**: Podrška zajednice, bez službenih ažuriranja  

### Smjernice za migraciju  
Kada se izdaju glavne verzije, pružamo:  
- **Vodiče za migraciju**: Korak-po-korak upute za prijelaz  
- **Napomene o kompatibilnosti**: Detalji o promjenama koje prekidaju kompatibilnost  
- **Podrška za alate**: Skripte ili alati za pomoć pri migraciji  
- **Podrška zajednice**: Namjenski forumi za pitanja o migraciji  

---

**Navigacija**  
- **Prethodna lekcija**: [Vodič za učenje](resources/study-guide.md)  
- **Sljedeća lekcija**: Povratak na [Glavni README](README.md)  

**Ostanite informirani**: Pratite ovaj repozitorij za obavijesti o novim izdanjima i važnim ažuriranjima materijala za učenje.  

---

**Odricanje od odgovornosti**:  
Ovaj dokument je preveden pomoću AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za ključne informacije preporučuje se profesionalni prijevod od strane ljudskog prevoditelja. Ne preuzimamo odgovornost za bilo kakve nesporazume ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.