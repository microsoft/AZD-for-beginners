<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1bc63a39d4cf8fc5cb5c7040344be859",
  "translation_date": "2025-11-23T18:39:56+00:00",
  "source_file": "changelog.md",
  "language_code": "hr"
}
-->
# Dnevnik promjena - AZD za početnike

## Uvod

Ovaj dnevnik promjena bilježi sve značajne promjene, ažuriranja i poboljšanja u repozitoriju AZD za početnike. Pratimo principe semantičkog verzioniranja i održavamo ovaj zapis kako bismo korisnicima pomogli razumjeti što se promijenilo između verzija.

## Ciljevi učenja

Pregledom ovog dnevnika promjena, moći ćete:
- Biti informirani o novim značajkama i dodacima sadržaja
- Razumjeti poboljšanja u postojećoj dokumentaciji
- Pratiti ispravke grešaka i osigurati točnost
- Pratiti razvoj obrazovnih materijala kroz vrijeme

## Ishodi učenja

Nakon pregleda unosa u dnevniku promjena, moći ćete:
- Prepoznati novi sadržaj i resurse dostupne za učenje
- Razumjeti koji su dijelovi ažurirani ili poboljšani
- Planirati svoj put učenja na temelju najnovijih materijala
- Davati povratne informacije i prijedloge za buduća poboljšanja

## Povijest verzija

### [v3.8.0] - 2025-11-19

#### Napredna dokumentacija: Praćenje, sigurnost i obrasci za više agenata
**Ova verzija dodaje sveobuhvatne lekcije visoke kvalitete o integraciji Application Insights, obrascima autentifikacije i koordinaciji više agenata za produkcijska okruženja.**

#### Dodano
- **📊 Lekcija o integraciji Application Insights**: u `docs/pre-deployment/application-insights.md`:
  - AZD-fokusirano postavljanje s automatskim osiguravanjem resursa
  - Kompletni Bicep predlošci za Application Insights + Log Analytics
  - Funkcionalne Python aplikacije s prilagođenom telemetrijom (1.200+ linija)
  - Obrasci za praćenje AI/LLM (praćenje tokena/troškova za Azure OpenAI)
  - 6 Mermaid dijagrama (arhitektura, distribuirano praćenje, protok telemetrije)
  - 3 praktične vježbe (upozorenja, nadzorne ploče, praćenje AI)
  - Primjeri Kusto upita i strategije optimizacije troškova
  - Streaming uživo metrika i otklanjanje pogrešaka u stvarnom vremenu
  - Vrijeme učenja 40-50 minuta s obrascima spremnim za produkciju

- **🔐 Lekcija o obrascima autentifikacije i sigurnosti**: u `docs/getting-started/authsecurity.md`:
  - 3 obrasca autentifikacije (connection strings, Key Vault, managed identity)
  - Kompletni Bicep predlošci infrastrukture za sigurno postavljanje
  - Kôd aplikacije u Node.js s integracijom Azure SDK-a
  - 3 kompletne vježbe (omogućavanje managed identity, user-assigned identity, rotacija Key Vault-a)
  - Najbolje prakse sigurnosti i konfiguracije RBAC-a
  - Vodič za otklanjanje pogrešaka i analiza troškova
  - Obrasci za autentifikaciju bez lozinki spremni za produkciju

- **🤖 Lekcija o obrascima koordinacije više agenata**: u `docs/pre-deployment/coordination-patterns.md`:
  - 5 obrazaca koordinacije (sekvencijalni, paralelni, hijerarhijski, vođeni događajima, konsenzus)
  - Kompletna implementacija usluge orkestratora (Python/Flask, 1.500+ linija)
  - 3 specijalizirane implementacije agenata (Istraživač, Pisac, Urednik)
  - Integracija Service Bus-a za redove poruka
  - Upravljanje stanjem distribuiranih sustava pomoću Cosmos DB-a
  - 6 Mermaid dijagrama koji prikazuju interakcije agenata
  - 3 napredne vježbe (upravljanje timeout-om, logika ponovnog pokušaja, prekidač kruga)
  - Analiza troškova ($240-565/mjesečno) sa strategijama optimizacije
  - Integracija Application Insights za praćenje

#### Poboljšano
- **Poglavlje o pred-deploymentu**: Sada uključuje sveobuhvatne obrasce za praćenje i koordinaciju
- **Poglavlje za početnike**: Poboljšano profesionalnim obrascima autentifikacije
- **Spremnost za produkciju**: Potpuna pokrivenost od sigurnosti do praćenja
- **Pregled tečaja**: Ažuriran s referencama na nove lekcije u poglavljima 3 i 6

#### Promijenjeno
- **Progresija učenja**: Bolja integracija sigurnosti i praćenja kroz cijeli tečaj
- **Kvaliteta dokumentacije**: Dosljedni standardi visoke kvalitete (95-97%) u novim lekcijama
- **Obrasci za produkciju**: Potpuna pokrivenost za implementacije na razini poduzeća

#### Poboljšano
- **Iskustvo programera**: Jasan put od razvoja do praćenja u produkciji
- **Sigurnosni standardi**: Profesionalni obrasci za autentifikaciju i upravljanje tajnama
- **Praćenje**: Potpuna integracija Application Insights s AZD-om
- **AI radna opterećenja**: Specijalizirano praćenje za Azure OpenAI i sustave s više agenata

#### Validirano
- ✅ Sve lekcije uključuju kompletan funkcionalan kôd (ne samo isječke)
- ✅ Mermaid dijagrami za vizualno učenje (ukupno 19 u 3 lekcije)
- ✅ Praktične vježbe s koracima za provjeru (ukupno 9)
- ✅ Bicep predlošci spremni za produkciju implementiraju se putem `azd up`
- ✅ Analiza troškova i strategije optimizacije
- ✅ Vodiči za otklanjanje pogrešaka i najbolje prakse
- ✅ Provjere znanja s naredbama za verifikaciju

#### Rezultati ocjenjivanja dokumentacije
- **docs/pre-deployment/application-insights.md**: - Sveobuhvatan vodič za praćenje
- **docs/getting-started/authsecurity.md**: - Profesionalni obrasci sigurnosti
- **docs/pre-deployment/coordination-patterns.md**: - Napredne arhitekture s više agenata
- **Ukupni novi sadržaj**: - Dosljedni standardi visoke kvalitete

#### Tehnička implementacija
- **Application Insights**: Log Analytics + prilagođena telemetrija + distribuirano praćenje
- **Autentifikacija**: Managed Identity + Key Vault + RBAC obrasci
- **Više agenata**: Service Bus + Cosmos DB + Container Apps + orkestracija
- **Praćenje**: Metrike uživo + Kusto upiti + upozorenja + nadzorne ploče
- **Upravljanje troškovima**: Strategije uzorkovanja, politike zadržavanja, kontrola proračuna

### [v3.7.0] - 2025-11-19

#### Poboljšanja kvalitete dokumentacije i novi primjer Azure OpenAI
**Ova verzija poboljšava kvalitetu dokumentacije u cijelom repozitoriju i dodaje kompletan primjer implementacije Azure OpenAI s GPT-4 sučeljem za chat.**

#### Dodano
- **🤖 Primjer chata Azure OpenAI**: Kompletna implementacija GPT-4 u `examples/azure-openai-chat/`:
  - Kompletna infrastruktura Azure OpenAI (GPT-4 model)
  - Python sučelje naredbenog retka za chat s poviješću razgovora
  - Integracija Key Vault-a za sigurno pohranjivanje API ključeva
  - Praćenje korištenja tokena i procjena troškova
  - Ograničavanje brzine i rukovanje pogreškama
  - Sveobuhvatan README s vodičem za implementaciju (35-45 minuta)
  - 11 datoteka spremnih za produkciju (Bicep predlošci, Python aplikacija, konfiguracija)
- **📚 Vježbe iz dokumentacije**: Dodane praktične vježbe u vodič za konfiguraciju:
  - Vježba 1: Konfiguracija za više okruženja (15 minuta)
  - Vježba 2: Praksa upravljanja tajnama (10 minuta)
  - Jasni kriteriji uspjeha i koraci za provjeru
- **✅ Verifikacija implementacije**: Dodan odjeljak za provjeru u vodič za implementaciju:
  - Postupci provjere ispravnosti
  - Popis kriterija uspjeha
  - Očekivani izlazi za sve naredbe implementacije
  - Brzi vodič za otklanjanje pogrešaka

#### Poboljšano
- **examples/README.md**: Ažurirano na kvalitetu A-razine (93%):
  - Dodan azure-openai-chat u sve relevantne odjeljke
  - Ažuriran broj lokalnih primjera s 3 na 4
  - Dodano u tablicu primjera AI aplikacija
  - Integrirano u Brzi početak za srednje napredne korisnike
  - Dodano u odjeljak predložaka Microsoft Foundry za Azure AI
  - Ažurirana usporedna matrica i odjeljci za pronalaženje tehnologije
- **Kvaliteta dokumentacije**: Poboljšana s B+ (87%) na A- (92%) u cijeloj mapi docs:
  - Dodani očekivani izlazi za ključne primjere naredbi
  - Uključeni koraci za provjeru promjena u konfiguraciji
  - Poboljšano praktično učenje s praktičnim vježbama

#### Promijenjeno
- **Progresija učenja**: Bolja integracija AI primjera za srednje napredne učenike
- **Struktura dokumentacije**: Više praktičnih vježbi s jasnim ishodima
- **Proces verifikacije**: Dodani eksplicitni kriteriji uspjeha ključnim radnim procesima

#### Poboljšano
- **Iskustvo programera**: Implementacija Azure OpenAI sada traje 35-45 minuta (naspram 60-90 za složenije alternative)
- **Transparentnost troškova**: Jasne procjene troškova ($50-200/mjesečno) za primjer Azure OpenAI
- **Put učenja**: AI programeri imaju jasan početni korak s azure-openai-chat
- **Standardi dokumentacije**: Dosljedni očekivani izlazi i koraci za provjeru

#### Validirano
- ✅ Primjer Azure OpenAI potpuno funkcionalan s `azd up`
- ✅ Svi novi primjeri i dokumentacija ažurirani i provjereni
- **Radionica**: Materijali za radionicu (`workshop/`) nisu ažurirani u ovoj verziji
- **Primjeri**: Datoteke s primjerima možda još uvijek koriste staru terminologiju (bit će ažurirano u budućim verzijama)
- **Vanjske poveznice**: Vanjski URL-ovi i reference na GitHub repozitorij ostaju nepromijenjeni

#### Vodič za migraciju za suradnike
Ako imate lokalne grane ili dokumentaciju koja se referira na staru strukturu:
1. Ažurirajte reference na mape: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Ažurirajte reference na datoteke: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Zamijenite naziv proizvoda: "Azure AI Foundry" → "Microsoft Foundry"
4. Provjerite rade li svi unutarnji linkovi u dokumentaciji

---

### [v3.4.0] - 2025-10-24

#### Pregled infrastrukture i poboljšanja validacije
**Ova verzija uvodi sveobuhvatnu podršku za novu značajku pregleda Azure Developer CLI i poboljšava korisničko iskustvo radionice.**

#### Dodano
- **🧪 Dokumentacija značajke azd provision --preview**: Sveobuhvatno pokrivanje nove mogućnosti pregleda infrastrukture
  - Referenca naredbi i primjeri upotrebe u priručniku
  - Detaljna integracija u vodič za provision s primjerima upotrebe i prednostima
  - Integracija provjere prije implementacije za sigurniju validaciju
  - Ažuriranja vodiča za početak rada s praksama sigurnog implementiranja
- **🚧 Banner statusa radionice**: Profesionalni HTML banner koji označava status razvoja radionice
  - Dizajn s gradijentom i indikatorima gradnje za jasnu komunikaciju s korisnicima
  - Datum posljednjeg ažuriranja za transparentnost
  - Dizajn prilagođen mobilnim uređajima za sve vrste uređaja

#### Poboljšano
- **Sigurnost infrastrukture**: Funkcionalnost pregleda integrirana kroz dokumentaciju o implementaciji
- **Validacija prije implementacije**: Automatizirani skripti sada uključuju testiranje pregleda infrastrukture
- **Razvojni tijek rada**: Ažurirani slijedovi naredbi uključuju pregled kao najbolju praksu
- **Iskustvo radionice**: Jasno postavljena očekivanja za korisnike o statusu razvoja sadržaja

#### Promijenjeno
- **Najbolje prakse implementacije**: Preporučuje se tijek rada s pregledom kao prvi korak
- **Tijek dokumentacije**: Validacija infrastrukture premještena ranije u proces učenja
- **Prezentacija radionice**: Profesionalna komunikacija statusa s jasnim vremenskim okvirom razvoja

#### Poboljšano
- **Pristup sigurnosti na prvom mjestu**: Promjene infrastrukture sada se mogu validirati prije implementacije
- **Suradnja tima**: Rezultati pregleda mogu se dijeliti za pregled i odobrenje
- **Svijest o troškovima**: Bolje razumijevanje troškova resursa prije provisiona
- **Smanjenje rizika**: Smanjen broj neuspjelih implementacija kroz unaprijed validaciju

#### Tehnička implementacija
- **Integracija više dokumenata**: Značajka pregleda dokumentirana u 4 ključne datoteke
- **Obrasci naredbi**: Dosljedna sintaksa i primjeri kroz dokumentaciju
- **Integracija najboljih praksi**: Pregled uključen u validacijske tijekove rada i skripte
- **Vizualni indikatori**: Jasne oznake NOVIH značajki za lakše otkrivanje

#### Infrastruktura radionice
- **Komunikacija statusa**: Profesionalni HTML banner s gradijentnim stilom
- **Korisničko iskustvo**: Jasno označen status razvoja sprječava zabunu
- **Profesionalna prezentacija**: Održava vjerodostojnost repozitorija uz postavljanje očekivanja
- **Transparentnost vremenskog okvira**: Datum posljednjeg ažuriranja u listopadu 2025. za odgovornost

### [v3.3.0] - 2025-09-24

#### Poboljšani materijali za radionicu i interaktivno iskustvo učenja
**Ova verzija uvodi sveobuhvatne materijale za radionicu s interaktivnim vodičima u pregledniku i strukturiranim stazama učenja.**

#### Dodano
- **🎥 Interaktivni vodič za radionicu**: Iskustvo radionice u pregledniku s mogućnošću pregleda MkDocs-a
- **📝 Strukturirane upute za radionicu**: Vodič za učenje u 7 koraka od otkrivanja do prilagodbe
  - 0-Uvod: Pregled i postavljanje radionice
  - 1-Odabir AI predloška: Proces otkrivanja i odabira predloška
  - 2-Validacija AI predloška: Postupci implementacije i validacije
  - 3-Razrada AI predloška: Razumijevanje arhitekture predloška
  - 4-Konfiguracija AI predloška: Konfiguracija i prilagodba
  - 5-Prilagodba AI predloška: Napredne izmjene i iteracije
  - 6-Uklanjanje infrastrukture: Čišćenje i upravljanje resursima
  - 7-Zaključak: Sažetak i sljedeći koraci
- **🛠️ Alati za radionicu**: Konfiguracija MkDocs-a s temom Material za poboljšano iskustvo učenja
- **🎯 Praktična staza učenja**: Metodologija u 3 koraka (Otkrivanje → Implementacija → Prilagodba)
- **📱 Integracija s GitHub Codespaces**: Besprijekorno postavljanje razvojnog okruženja

#### Poboljšano
- **AI laboratorij za radionice**: Proširen s 2-3 sata strukturiranog iskustva učenja
- **Dokumentacija radionice**: Profesionalna prezentacija s navigacijom i vizualnim pomagalima
- **Progresija u učenju**: Jasne upute korak po korak od odabira predloška do implementacije u produkciju
- **Iskustvo za developere**: Integrirani alati za pojednostavljene tijekove rada razvoja

#### Poboljšano
- **Pristupačnost**: Sučelje u pregledniku s pretraživanjem, funkcionalnošću kopiranja i prebacivanjem tema
- **Samostalno učenje**: Fleksibilna struktura radionice prilagođena različitim brzinama učenja
- **Praktična primjena**: Scenariji implementacije AI predložaka u stvarnom svijetu
- **Integracija zajednice**: Integracija s Discordom za podršku i suradnju u radionici

#### Značajke radionice
- **Ugrađeno pretraživanje**: Brzo pronalaženje ključnih riječi i lekcija
- **Kopiranje kodnih blokova**: Funkcionalnost kopiranja za sve primjere koda
- **Prebacivanje tema**: Podrška za tamni/svijetli način rada za različite preferencije
- **Vizualni materijali**: Snimke zaslona i dijagrami za bolje razumijevanje
- **Integracija pomoći**: Izravan pristup Discordu za podršku zajednice

### [v3.2.0] - 2025-09-17

#### Velika reorganizacija navigacije i sustav učenja temeljen na poglavljima
**Ova verzija uvodi sveobuhvatnu strukturu učenja temeljenu na poglavljima s poboljšanom navigacijom kroz cijeli repozitorij.**

#### Dodano
- **📚 Sustav učenja temeljen na poglavljima**: Restrukturiran cijeli tečaj u 8 progresivnih poglavlja učenja
  - Poglavlje 1: Osnove i brzi početak (⭐ - 30-45 min)
  - Poglavlje 2: Razvoj temeljen na AI (⭐⭐ - 1-2 sata)
  - Poglavlje 3: Konfiguracija i autentifikacija (⭐⭐ - 45-60 min)
  - Poglavlje 4: Infrastruktura kao kod i implementacija (⭐⭐⭐ - 1-1.5 sati)
  - Poglavlje 5: Višeagencijska AI rješenja (⭐⭐⭐⭐ - 2-3 sata)
  - Poglavlje 6: Validacija prije implementacije i planiranje (⭐⭐ - 1 sat)
  - Poglavlje 7: Rješavanje problema i otklanjanje grešaka (⭐⭐ - 1-1.5 sati)
  - Poglavlje 8: Produkcija i obrasci za poduzeća (⭐⭐⭐⭐ - 2-3 sata)
- **📚 Sveobuhvatan navigacijski sustav**: Dosljedni navigacijski zaglavlja i podnožja kroz svu dokumentaciju
- **🎯 Praćenje napretka**: Popis za provjeru završetka tečaja i sustav za verifikaciju učenja
- **🗺️ Vodič za stazu učenja**: Jasne ulazne točke za različite razine iskustva i ciljeve
- **🔗 Navigacija s unakrsnim referencama**: Jasno povezivanje povezanih poglavlja i preduvjeta

#### Poboljšano
- **Struktura README-a**: Pretvorena u strukturiranu platformu za učenje s organizacijom po poglavljima
- **Navigacija dokumentacijom**: Svaka stranica sada uključuje kontekst poglavlja i smjernice za napredak
- **Organizacija predložaka**: Primjeri i predlošci povezani s odgovarajućim poglavljima učenja
- **Integracija resursa**: Priručnici, često postavljana pitanja i vodiči za učenje povezani s relevantnim poglavljima
- **Integracija radionice**: Praktične radionice povezane s ciljevima učenja iz više poglavlja

#### Promijenjeno
- **Progresija učenja**: Prelazak s linearnog dokumentiranja na fleksibilno učenje temeljeno na poglavljima
- **Položaj konfiguracije**: Vodič za konfiguraciju premješten kao Poglavlje 3 radi boljeg tijeka učenja
- **Integracija AI sadržaja**: Bolja integracija AI specifičnog sadržaja kroz cijelo putovanje učenja
- **Sadržaj za produkciju**: Napredni obrasci konsolidirani u Poglavlju 8 za poslovne korisnike

#### Poboljšano
- **Korisničko iskustvo**: Jasne navigacijske oznake i indikatori napretka kroz poglavlja
- **Pristupačnost**: Dosljedni obrasci navigacije za lakše kretanje kroz tečaj
- **Profesionalna prezentacija**: Struktura tečaja u stilu sveučilišta pogodna za akademsku i korporativnu obuku
- **Učinkovitost učenja**: Smanjeno vrijeme za pronalaženje relevantnog sadržaja kroz poboljšanu organizaciju

#### Tehnička implementacija
- **Navigacijski zaglavlja**: Standardizirana navigacija po poglavljima kroz više od 40 dokumentacijskih datoteka
- **Navigacija u podnožju**: Dosljedne smjernice za napredak i indikatori završetka poglavlja
- **Unakrsno povezivanje**: Sveobuhvatan sustav unutarnjeg povezivanja povezanih koncepata
- **Mapiranje poglavlja**: Predlošci i primjeri jasno povezani s ciljevima učenja

#### Poboljšanje vodiča za učenje
- **📚 Sveobuhvatni ciljevi učenja**: Restrukturirani vodič za učenje u skladu sa sustavom od 8 poglavlja
- **🎯 Procjena temeljena na poglavljima**: Svako poglavlje uključuje specifične ciljeve učenja i praktične vježbe
- **📋 Praćenje napretka**: Tjedni raspored učenja s mjerljivim ishodima i popisima za provjeru završetka
- **❓ Pitanja za procjenu**: Validacija znanja za svako poglavlje s profesionalnim ishodima
- **🛠️ Praktične vježbe**: Aktivnosti s pravim scenarijima implementacije i otklanjanja grešaka
- **📊 Napredak vještina**: Jasno napredovanje od osnovnih koncepata do obrazaca za poduzeća s fokusom na profesionalni razvoj
- **🎓 Okvir za certifikaciju**: Ishodi profesionalnog razvoja i sustav prepoznavanja u zajednici
- **⏱️ Upravljanje vremenom**: Strukturirani plan učenja od 10 tjedana s validacijom prekretnica

### [v3.1.0] - 2025-09-17

#### Poboljšana rješenja za više agenata u AI
**Ova verzija poboljšava rješenje za maloprodaju s više agenata s boljim imenovanjem agenata i poboljšanom dokumentacijom.**

#### Promijenjeno
- **Terminologija za više agenata**: Zamijenjen "Cora agent" s "Customer agent" u cijelom rješenju za maloprodaju s više agenata radi jasnijeg razumijevanja
- **Arhitektura agenata**: Ažurirana sva dokumentacija, ARM predlošci i primjeri koda za dosljedno korištenje naziva "Customer agent"
- **Primjeri konfiguracije**: Modernizirani obrasci konfiguracije agenata s ažuriranim nazivima
- **Dosljednost dokumentacije**: Osigurano da sve reference koriste profesionalne, deskriptivne nazive agenata

#### Poboljšano
- **Paket ARM predložaka**: Ažuriran retail-multiagent-arm-template s referencama na Customer agent
- **Arhitektonski dijagrami**: Osvježeni Mermaid dijagrami s ažuriranim nazivima agenata
- **Primjeri koda**: Python klase i primjeri implementacije sada koriste naziv CustomerAgent
- **Varijable okruženja**: Ažurirani svi skripti za implementaciju kako bi koristili konvencije CUSTOMER_AGENT_NAME

#### Poboljšano
- **Iskustvo developera**: Jasnije uloge i odgovornosti agenata u dokumentaciji
- **Spremnost za produkciju**: Bolje usklađivanje s poslovnim konvencijama imenovanja
- **Materijali za učenje**: Intuitivnija imena agenata za obrazovne svrhe
- **Upotrebljivost predložaka**: Pojednostavljeno razumijevanje funkcija agenata i obrazaca implementacije

#### Tehnički detalji
- Ažurirani Mermaid dijagrami arhitekture s referencama na CustomerAgent
- Zamijenjeni nazivi klasa CoraAgent s CustomerAgent u Python primjerima
- Modificirane ARM konfiguracije predložaka JSON za korištenje tipa agenta "customer"
- Ažurirane varijable okruženja s CORA_AGENT_* na CUSTOMER_AGENT_* obrasce
- Osvježene sve naredbe za implementaciju i konfiguracije kontejnera

### [v3.0.0] - 2025-09-12

#### Glavne promjene - Fokus na AI developere i integracija Azure AI Foundry
**Ova verzija transformira repozitorij u sveobuhvatan resurs za učenje s fokusom na AI developere i integraciju Azure AI Foundry.**

#### Dodano
- **🤖 Staza učenja s fokusom na AI**: Potpuno restrukturiranje s prioritetom na AI developere i inženjere
- **Vodič za integraciju Azure AI Foundry**: Sveobuhvatna dokumentacija za povezivanje AZD-a s uslugama Azure AI Foundry
- **Obrasci za implementaciju AI modela**: Detaljan vodič koji pokriva odabir modela, konfiguraciju i strategije implementacije u produkciju
- **AI laboratorij za radionice**: 2-3 sata praktične radionice za pretvaranje AI aplikacija u AZD implementacijska rješenja
- **Najbolje prakse za AI u produkciji**: Obrasci spremni za poduzeća za skaliranje, praćenje i osiguranje AI radnih opterećenja
- **Vodič za rješavanje problema specifičnih za AI**: Sveobuhvatno rješavanje problema za Azure OpenAI, Cognitive Services i AI implementacije
- **Galerija AI predložaka**: Istaknuta kolekcija predložaka Azure AI Foundry s ocjenama složenosti
- **Materijali za radionice**: Kompletna struktura radionice s praktičnim laboratorijima i referentnim materijalima

#### Poboljšano
- **Struktura README-a**: Fokusirana na AI developere s 45% podataka o interesu zajednice iz Azure AI Foundry Discorda
- **Staze učenja**: Posvećeno putovanje za AI developere uz tradicionalne staze za studente i DevOps inženjere
- **Preporuke predložaka**: Istaknuti AI predlošci uključujući azure
- **Prezentacija sadržaja**: Uklonjeni dekorativni elementi u korist jasnog, profesionalnog formatiranja
- **Struktura poveznica**: Ažurirane sve interne poveznice kako bi podržale novi navigacijski sustav

#### Poboljšano
- **Pristupačnost**: Uklonjena ovisnost o emojijima radi bolje kompatibilnosti sa čitačima ekrana
- **Profesionalni izgled**: Čisto, akademski stil prezentacije prikladan za korporativno učenje
- **Iskustvo učenja**: Strukturirani pristup s jasnim ciljevima i ishodima za svaku lekciju
- **Organizacija sadržaja**: Bolji logički slijed i povezanost između povezanih tema

### [v1.0.0] - 2025-09-09

#### Početno izdanje - Sveobuhvatni AZD repozitorij za učenje

#### Dodano
- **Osnovna struktura dokumentacije**
  - Kompletan vodič za početak
  - Sveobuhvatna dokumentacija za implementaciju i provisioniranje
  - Detaljni resursi za rješavanje problema i vodiči za otklanjanje grešaka
  - Alati i postupci za validaciju prije implementacije

- **Modul za početak**
  - Osnove AZD-a: Temeljni koncepti i terminologija
  - Vodič za instalaciju: Upute za postavljanje specifične za platformu
  - Vodič za konfiguraciju: Postavljanje okruženja i autentifikacija
  - Prvi projekt: Korak-po-korak praktično učenje

- **Modul za implementaciju i provisioniranje**
  - Vodič za implementaciju: Dokumentacija cjelokupnog tijeka rada
  - Vodič za provisioniranje: Infrastruktura kao kod s Bicepom
  - Najbolje prakse za implementacije u produkciji
  - Obrasci za arhitekturu s više usluga

- **Modul za validaciju prije implementacije**
  - Planiranje kapaciteta: Validacija dostupnosti Azure resursa
  - Odabir SKU-a: Sveobuhvatne smjernice za razine usluga
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
  - Česta pitanja: Detaljni odgovori na uobičajena pitanja
  - Vanjske poveznice na resurse i veze s zajednicom

- **Primjeri i predlošci**
  - Primjer jednostavne web aplikacije
  - Predložak za implementaciju statične web stranice
  - Konfiguracija aplikacije u kontejneru
  - Obrasci za integraciju baza podataka
  - Primjeri arhitekture mikroservisa
  - Implementacije serverless funkcija

#### Značajke
- **Podrška za više platformi**: Vodiči za instalaciju i konfiguraciju za Windows, macOS i Linux
- **Različite razine vještina**: Sadržaj dizajniran za studente i profesionalne programere
- **Praktični fokus**: Praktični primjeri i scenariji iz stvarnog svijeta
- **Sveobuhvatna pokrivenost**: Od osnovnih koncepata do naprednih korporativnih obrazaca
- **Sigurnosni pristup**: Najbolje sigurnosne prakse integrirane kroz cijeli sadržaj
- **Optimizacija troškova**: Smjernice za isplative implementacije i upravljanje resursima

#### Kvaliteta dokumentacije
- **Detaljni primjeri koda**: Praktični, testirani primjeri koda
- **Upute korak-po-korak**: Jasne, provedive smjernice
- **Sveobuhvatno rukovanje greškama**: Rješavanje uobičajenih problema
- **Integracija najboljih praksi**: Industrijski standardi i preporuke
- **Kompatibilnost verzija**: Ažurirano s najnovijim Azure uslugama i značajkama azd-a

## Planirana buduća poboljšanja

### Verzija 3.1.0 (Planirano)
#### Proširenje AI platforme
- **Podrška za više modela**: Obrasci integracije za Hugging Face, Azure Machine Learning i prilagođene modele
- **Okviri za AI agente**: Predlošci za LangChain, Semantic Kernel i AutoGen implementacije
- **Napredni RAG obrasci**: Opcije za vektorske baze podataka izvan Azure AI Search (Pinecone, Weaviate itd.)
- **AI nadzor**: Poboljšano praćenje performansi modela, korištenja tokena i kvalitete odgovora

#### Iskustvo programera
- **VS Code ekstenzija**: Integrirano AZD + AI Foundry razvojno iskustvo
- **GitHub Copilot integracija**: AI-asistirano generiranje AZD predložaka
- **Interaktivni vodiči**: Praktične vježbe kodiranja s automatiziranom validacijom za AI scenarije
- **Video sadržaj**: Dodatni video vodiči za vizualne učenike s fokusom na AI implementacije

### Verzija 4.0.0 (Planirano)
#### Korporativni AI obrasci
- **Okvir za upravljanje**: Upravljanje AI modelima, usklađenost i revizijski tragovi
- **AI za više korisnika**: Obrasci za pružanje usluga više klijenata s izoliranim AI uslugama
- **AI na rubu**: Integracija s Azure IoT Edge i instancama kontejnera
- **Hibridni oblak AI**: Obrasci za implementaciju AI radnih opterećenja u više oblaka i hibridnim okruženjima

#### Napredne značajke
- **Automatizacija AI cjevovoda**: MLOps integracija s Azure Machine Learning cjevovodima
- **Napredna sigurnost**: Obrasci za zero-trust, privatne krajnje točke i naprednu zaštitu od prijetnji
- **Optimizacija performansi**: Napredne strategije podešavanja i skaliranja za AI aplikacije visokog kapaciteta
- **Globalna distribucija**: Obrasci za isporuku sadržaja i predmemoriranje na rubu za AI aplikacije

### Verzija 3.0.0 (Planirano) - Zamijenjeno trenutnim izdanjem
#### Predloženi dodaci - Sada implementirani u v3.0.0
- ✅ **Sadržaj usmjeren na AI**: Sveobuhvatna integracija Azure AI Foundry (Dovršeno)
- ✅ **Interaktivni vodiči**: Praktična AI radionica (Dovršeno)
- ✅ **Napredni sigurnosni modul**: Sigurnosni obrasci specifični za AI (Dovršeno)
- ✅ **Optimizacija performansi**: Strategije podešavanja AI radnih opterećenja (Dovršeno)

### Verzija 2.1.0 (Planirano) - Djelomično implementirano u v3.0.0
#### Manja poboljšanja - Neka dovršena u trenutnom izdanju
- ✅ **Dodatni primjeri**: Scenariji implementacije usmjereni na AI (Dovršeno)
- ✅ **Proširena FAQ**: Pitanja i rješavanje problema specifičnih za AI (Dovršeno)
- **Integracija alata**: Poboljšani vodiči za integraciju IDE-a i uređivača
- ✅ **Proširenje praćenja**: Obrasci za praćenje i upozorenja specifična za AI (Dovršeno)

#### Još uvijek planirano za buduće izdanje
- **Dokumentacija prilagođena mobilnim uređajima**: Responzivni dizajn za učenje na mobilnim uređajima
- **Offline pristup**: Dokumentacija dostupna za preuzimanje
- **Poboljšana integracija IDE-a**: VS Code ekstenzija za AZD + AI radne tokove
- **Nadzorna ploča zajednice**: Metrike zajednice u stvarnom vremenu i praćenje doprinosa

## Doprinos promjenama

### Prijava promjena
Prilikom doprinosa ovom repozitoriju, osigurajte da unosi u changelog uključuju:

1. **Broj verzije**: Slijedeći semantičko verzioniranje (major.minor.patch)
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
- Ažuriranja sigurnosnih najboljih praksi
- Rješavanje sigurnosnih ranjivosti

### Smjernice za semantičko verzioniranje

#### Glavna verzija (X.0.0)
- Promjene koje prekidaju kompatibilnost i zahtijevaju akciju korisnika
- Značajno restrukturiranje sadržaja ili organizacije
- Promjene koje mijenjaju temeljni pristup ili metodologiju

#### Manja verzija (X.Y.0)
- Nove značajke ili dodaci sadržaju
- Poboljšanja koja održavaju unatrag kompatibilnost
- Dodatni primjeri, alati ili resursi

#### Verzija zakrpe (X.Y.Z)
- Ispravci grešaka i korekcije
- Manja poboljšanja postojećeg sadržaja
- Pojašnjenja i mala poboljšanja

## Povratne informacije i prijedlozi zajednice

Aktivno potičemo povratne informacije zajednice kako bismo unaprijedili ovaj resurs za učenje:

### Kako pružiti povratne informacije
- **GitHub Issues**: Prijavite probleme ili predložite poboljšanja (dobrodošli su AI-specifični problemi)
- **Discord rasprave**: Podijelite ideje i uključite se u zajednicu Azure AI Foundry
- **Pull Requests**: Doprinesite izravnim poboljšanjima sadržaja, posebno AI predlošcima i vodičima
- **Azure AI Foundry Discord**: Sudjelujte u #Azure kanalu za rasprave o AZD + AI
- **Forumi zajednice**: Sudjelujte u širim raspravama o Azure razvoju

### Kategorije povratnih informacija
- **Točnost AI sadržaja**: Ispravci informacija o integraciji i implementaciji AI usluga
- **Iskustvo učenja**: Prijedlozi za poboljšanje tijeka učenja za AI programere
- **Nedostajući AI sadržaj**: Zahtjevi za dodatnim AI predlošcima, obrascima ili primjerima
- **Pristupačnost**: Poboljšanja za različite potrebe učenja
- **Integracija AI alata**: Prijedlozi za bolju integraciju radnih tokova za razvoj AI-a
- **Obrasci za produkcijski AI**: Zahtjevi za obrasce implementacije AI-a u korporativnom okruženju

### Obveza odgovora
- **Odgovor na problem**: U roku od 48 sati za prijavljene probleme
- **Zahtjevi za značajke**: Procjena u roku od tjedan dana
- **Doprinosi zajednice**: Pregled u roku od tjedan dana
- **Sigurnosni problemi**: Prioritet s ubrzanim odgovorom

## Raspored održavanja

### Redovita ažuriranja
- **Mjesečni pregledi**: Točnost sadržaja i validacija poveznica
- **Kvartalna ažuriranja**: Glavni dodaci i poboljšanja sadržaja
- **Polugodišnji pregledi**: Sveobuhvatno restrukturiranje i poboljšanja
- **Godišnja izdanja**: Glavna ažuriranja verzija sa značajnim poboljšanjima

### Praćenje i osiguranje kvalitete
- **Automatizirano testiranje**: Redovita validacija primjera koda i poveznica
- **Integracija povratnih informacija zajednice**: Redovito uključivanje prijedloga korisnika
- **Tehnološka ažuriranja**: Usklađivanje s najnovijim Azure uslugama i izdanjima azd-a
- **Revizije pristupačnosti**: Redoviti pregledi za inkluzivne principe dizajna

## Politika podrške verzijama

### Podrška za trenutnu verziju
- **Najnovija glavna verzija**: Potpuna podrška s redovitim ažuriranjima
- **Prethodna glavna verzija**: Sigurnosna ažuriranja i kritični popravci tijekom 12 mjeseci
- **Zastarjele verzije**: Samo podrška zajednice, bez službenih ažuriranja

### Smjernice za migraciju
Kada se izdaju glavne verzije, pružamo:
- **Vodiče za migraciju**: Upute korak-po-korak za prijelaz
- **Napomene o kompatibilnosti**: Detalji o promjenama koje prekidaju kompatibilnost
- **Podrška za alate**: Skripte ili alati za pomoć pri migraciji
- **Podrška zajednice**: Namjenski forumi za pitanja o migraciji

---

**Navigacija**
- **Prethodna lekcija**: [Vodič za učenje](resources/study-guide.md)
- **Sljedeća lekcija**: Povratak na [Glavni README](README.md)

**Ostanite ažurirani**: Pratite ovaj repozitorij za obavijesti o novim izdanjima i važnim ažuriranjima materijala za učenje.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:  
Ovaj dokument je preveden pomoću AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za ključne informacije preporučuje se profesionalni prijevod od strane čovjeka. Ne odgovaramo za nesporazume ili pogrešna tumačenja koja proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->