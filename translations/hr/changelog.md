# Changelog - AZD Za Početnike

## Uvod

Ovaj changelog dokumentira sve značajne promjene, nadogradnje i poboljšanja u spremištu AZD Za Početnike. Pridržavamo se principa semantičkog verzioniranja i održavamo ovaj zapis kako bismo korisnicima pomogli razumjeti što se promijenilo između verzija.

## Ciljevi učenja

Pregledom ovog changeloga ćete:
- Ostati informirani o novim značajkama i dodacima sadržaja
- Razumjeti poboljšanja postojećih dokumenata
- Pratiti ispravke grešaka i korekcije radi osiguranja točnosti
- Pratiti razvojni put nastavnih materijala tijekom vremena

## Ishodi učenja

Nakon pregleda unosa u changelogu, moći ćete:
- Prepoznati novi sadržaj i dostupne resurse za učenje
- Razumjeti koje su sekcije ažurirane ili poboljšane
- Planirati svoj put učenja na temelju najnovijih materijala
- Dati povratne informacije i prijedloge za buduća poboljšanja

## Povijest verzija

### [v3.17.0] - 2026-02-05

#### Poboljšanje navigacije kroz tečaj
**Ova verzija poboljšava navigaciju kroz poglavlja README.md pomoću unaprijeđene tablične strukture.**

#### Promjene
- **Tablica karte tečaja**: Unaprijeđena s izravnim poveznicama na lekcije, procjenama trajanja i ocjenama složenosti
- **Čišćenje mapa**: Uklonjene suvišne stare mape (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Provjera veza**: Provjereno preko 21 unutarnje poveznice u tablici karte tečaja

### [v3.16.0] - 2026-02-05

#### Ažuriranja naziva proizvoda
**Ova verzija ažurira reference na proizvode prema trenutnom Microsoftovom brendiranju.**

#### Promjene
- **Azure AI Foundry → Microsoft Foundry**: Sve reference ažurirane u datotekama koje nisu prijevodi
- **Azure AI Agent Service → Foundry Agents**: Naziv usluge ažuriran da odražava trenutno brendiranje

#### Ažurirane datoteke
- `README.md` - Glavna početna stranica tečaja
- `changelog.md` - Povijest verzija
- `course-outline.md` - Struktura tečaja
- `docs/chapter-02-ai-development/agents.md` - Vodič za AI agente
- `examples/README.md` - Dokumentacija primjera
- `workshop/README.md` - Početna stranica radionice
- `workshop/docs/index.md` - Indeks radionice
- `workshop/docs/instructions/*.md` - Sve datoteke s uputama za radionicu

---

### [v3.15.0] - 2026-02-05

#### Glavna restrukturacija spremišta: nazivi mapa prema poglavljima
**Ova verzija restrukturira dokumentaciju u posvećene mape poglavlja radi jasnije navigacije.**

#### Promjena imena mapa
Stare mape zamijenjene su mapama numeriranim prema poglavljima:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Dodano novo: `docs/chapter-05-multi-agent/`

#### Migracije datoteka
| Datoteka | Iz | U |
|------|------|---|
| azd-basics.md | getting-started/ | chapter-01-foundation/ |
| installation.md | getting-started/ | chapter-01-foundation/ |
| first-project.md | getting-started/ | chapter-01-foundation/ |
| configuration.md | getting-started/ | chapter-03-configuration/ |
| authsecurity.md | getting-started/ | chapter-03-configuration/ |
| microsoft-foundry-integration.md | microsoft-foundry/ | chapter-02-ai-development/ |
| agents.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-model-deployment.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-workshop-lab.md | microsoft-foundry/ | chapter-02-ai-development/ |
| production-ai-practices.md | microsoft-foundry/ | chapter-08-production/ |
| deployment-guide.md | deployment/ | chapter-04-infrastructure/ |
| provisioning.md | deployment/ | chapter-04-infrastructure/ |
| Sve datoteke pre-deployment | pre-deployment/ | chapter-06-pre-deployment/ |
| Sve datoteke troubleshooting | troubleshooting/ | chapter-07-troubleshooting/ |

#### Dodano
- **📚 README datoteke poglavlja**: Kreirani README.md u svakoj mapi poglavlja sa:
  - Ciljevima učenja i trajanjem
  - Tablicom lekcija s opisima
  - Brzim start naredbama
  - Navigacijom do ostalih poglavlja

#### Promijenjeno
- **🔗 Ažurirane sve unutarnje veze**: Preko 78 putanja ažurirano u svim dokumentima
- **🗺️ Glavni README.md**: Ažurirana karta tečaja s novom strukturom poglavlja
- **📝 examples/README.md**: Ažurirane križne reference na mape poglavlja

#### Uklonjeno
- Stara struktura mapa (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Restrukturiranje spremišta: Navigacija kroz poglavlja
**Ova verzija dodala je README datoteke za navigaciju po poglavljima (zastarjelo u korist v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Novi vodič za AI agente
**Ova verzija dodaje sveobuhvatan vodič za implementaciju AI agenata pomoću Azure Developer CLI.**

#### Dodano
- **🤖 docs/microsoft-foundry/agents.md**: Potpuni vodič koji obuhvaća:
  - Što su AI agenti i čime se razlikuju od chatbota
  - Tri predloška za brzi početak (Foundry Agents, Prompty, RAG)
  - Arhitektonski obrasci agenata (jedan agent, RAG, multi-agent)
  - Konfiguracija i prilagodba alata
  - Praćenje i metrike
  - Troškovi i optimizacija
  - Uobičajeni problemi i njihovo rješavanje
  - Tri praktične vježbe s kriterijima uspjeha

#### Struktura sadržaja
- **Uvod**: Koncepti agenata za početnike
- **Brzi početak**: Implementacija agenata s `azd init --template get-started-with-ai-agents`
- **Arhitektonski obrasci**: Vizualni dijagrami obrazaca agenata
- **Konfiguracija**: Podešavanje alata i varijable okoline
- **Praćenje**: Integracija s Application Insights
- **Vježbe**: Postupno praktično učenje (20-45 minuta po vježbi)

---

### [v3.12.0] - 2026-02-05

#### Ažuriranje DevContainer okoline
**Ova verzija ažurira konfiguraciju razvojne okoline s modernim alatima i boljim zadanim postavkama za AZD iskustvo učenja.**

#### Promijenjeno
- **🐳 Bazna slika**: Ažurirana sa `python:3.12-bullseye` na `python:3.12-bookworm` (najnoviji Debian stabilan)
- **📛 Naziv kontejnera**: Promijenjen iz "Python 3" u "AZD for Beginners" radi jasnoće

#### Dodano
- **🔧 Nove značajke Dev Container-a**:
  - `azure-cli` s omogućenim Bicep podrškom
  - `node:20` (LTS verzija za AZD predloške)
  - `github-cli` za upravljanje predlošcima
  - `docker-in-docker` za implementacije container aplikacija

- **🔌 Prosljeđivanje portova**: Unaprijed konfigurirani portovi za uobičajeni razvoj:
  - 8000 (MkDocs pregled)
  - 3000 (Web aplikacije)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Nove VS Code ekstenzije**:
  - `ms-python.vscode-pylance` - Poboljšani Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Podrška za Azure Functions
  - `ms-azuretools.vscode-docker` - Podrška za Docker
  - `ms-azuretools.vscode-bicep` - Podrška za Bicep jezik
  - `ms-azure-devtools.azure-resource-groups` - Upravljanje Azure resursima
  - `yzhang.markdown-all-in-one` - Uređivanje Markdowna
  - `DavidAnson.vscode-markdownlint` - Markdown linting
  - `bierner.markdown-mermaid` - Podrška za Mermaid dijagrame
  - `redhat.vscode-yaml` - Podrška za YAML (za azure.yaml)
  - `eamodio.gitlens` - Vizualizacija Git-a
  - `mhutchie.git-graph` - Povijest Gita

- **⚙️ VS Code postavke**: Dodane zadane postavke za Python interpreter, formatiranje pri spremanju i uklanjanje praznina

- **📦 Ažuriran requirements-dev.txt**:
  - Dodan MkDocs minify dodatak
  - Dodan pre-commit za kvalitetu koda
  - Dodani Azure SDK paketi (azure-identity, azure-mgmt-resource)

#### Ispravljeno
- **Post-Create naredba**: Sada provjerava instalaciju AZD-a i Azure CLI-ja prilikom pokretanja kontejnera

---

### [v3.11.0] - 2026-02-05

#### Preuređenje README za početnike
**Ova verzija znatno poboljšava README.md kako bi bio pristupačniji početnicima i dodaje bitne resurse za AI programere.**

#### Dodano
- **🆚 Usporedba Azure CLI i AZD**: Jasno objašnjenje kada koristiti svaki alat s praktičnim primjerima
- **🌟 Sjajne AZD poveznice**: Izravni linkovi na galeriju predložaka zajednice i resurse za doprinos:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ predložaka spremnih za implementaciju
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Doprinos zajednice
- **🎯 Brzi vodič za početak**: Jednostavan 3-korak za početak (Instalacija → Prijava → Implementacija)
- **📊 Tablica navigacije po iskustvu**: Jasne upute gdje započeti na temelju iskustva programera

#### Promijenjeno
- **Struktura README-a**: Preuređeno za postupno otkrivanje - najvažnije informacije prvo
- **Uvodni dio**: Prepisan da objasni "Čaroliju `azd up`" za potpune početnike
- **Uklonjen duplicirani sadržaj**: Uklonjena duplikatna sekcija za rješavanje problema
- **Naredbe za rješavanje problema**: Ispravljena referenca `azd logs` u korist valjanog `azd monitor --logs`

#### Ispravljeno
- **🔐 Naredbe za autentifikaciju**: Dodane `azd auth login` i `azd auth logout` u cheat-sheet.md
- **Nevažeće naredbe uklonjene**: Uklonjene preostale reference na `azd logs` iz README dijela o rješavanju problema

#### Napomene
- **Opseg**: Promjene primijenjene na glavni README.md i resources/cheat-sheet.md
- **Ciljna publika**: Poboljšanja posebno usmjerena na programere nove u AZD

---

### [v3.10.0] - 2026-02-05

#### Ispravak točnosti AZD naredbi
**Ova verzija ispravlja nepostojeće AZD naredbe kroz dokumentaciju, osiguravajući da svi primjeri koda koriste važeću sintaksu Azure Developer CLI-ja.**

#### Ispravljeno
- **🔧 Uklonjene nepostojeće AZD naredbe**: Opsežna revizija i ispravak nevažećih naredbi:
  - `azd logs` (ne postoji) → zamijenjeno s `azd monitor --logs` ili Azure CLI alternativama
  - Podnaredbe `azd service` (ne postoje) → zamijenjene s `azd show` i Azure CLI-jem
  - `azd infra import/export/validate` (ne postoje) → uklonjene ili zamijenjene važećim alternativama
  - Zastavice `azd deploy --rollback/--incremental/--parallel/--detect-changes` (ne postoje) → uklonjene
  - Zastavice `azd provision --what-if/--rollback` (ne postoje) → ažurirane za korištenje `--preview`
  - `azd config validate` (ne postoji) → zamijenjeno s `azd config list`
  - `azd info`, `azd history`, `azd metrics` (ne postoje) → uklonjene

- **📚 Ažurirane datoteke s ispravcima naredbi**:
  - `resources/cheat-sheet.md`: Velika promjena referenci naredbi
  - `docs/deployment/deployment-guide.md`: Ispravljene strategije rollback i implementacije
  - `docs/troubleshooting/debugging.md`: Ispravljene sekcije za analizu dnevnika
  - `docs/troubleshooting/common-issues.md`: Ažurirane naredbe za rješavanje problema
  - `docs/troubleshooting/ai-troubleshooting.md`: Ispravljena AZD debugging sekcija
  - `docs/getting-started/azd-basics.md`: Ispravljene naredbe za praćenje
  - `docs/getting-started/first-project.md`: Ažurirani primjeri praćenja i otklanjanja problema
  - `docs/getting-started/installation.md`: Ispravljeni primjeri pomoći i verzija
  - `docs/pre-deployment/application-insights.md`: Ispravljene naredbe za pregled dnevnika
  - `docs/pre-deployment/coordination-patterns.md`: Ispravljene naredbe za debugging agenata

- **📝 Ažurirana referenca verzije**: 
  - `docs/getting-started/installation.md`: Promijenjena hardkodirana verzija `1.5.0` u generički `1.x.x` s poveznicom na izdanja

#### Promijenjeno
- **Strategije rollback**: Ažurirana dokumentacija za korištenje rollbacka baziranog na Gitu (AZD nema ugrađeni rollback)
- **Pregled dnevnika**: Zamijenjene reference na `azd logs` s `azd monitor --logs`, `azd monitor --live` i Azure CLI naredbama
- **Sekcija Performanse**: Uklonjene nepostojeće zastavice za paralelnu/incrementalnu implementaciju, dane valjane alternative

#### Tehnički detalji
- **Ispravne AZD naredbe**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Ispravne oznake za azd monitor**: `--live`, `--logs`, `--overview`
- **Uklonjene značajke**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Napomene
- **Provjera**: Naredbe su potvrđene u odnosu na Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Dovršetak radionice i ažuriranje kvalitete dokumentacije
**Ova verzija dovršava interaktivne module radionice, popravlja sve neispravne veze u dokumentaciji i poboljšava ukupnu kvalitetu sadržaja za AI programere koji koriste Microsoft AZD.**

#### Dodano
- **📝 CONTRIBUTING.md**: Novi dokument s uputama za doprinos koji uključuje:
  - Jasne upute za prijavu problema i predlaganje promjena
  - Standarde dokumentacije za novi sadržaj
  - Smjernice za primjere koda i konvencije za poruke o promjenama
  - Informacije o angažmanu zajednice

#### Dovršeno
- **🎯 Modul radionice 7 (Zaključenje)**: Potpuno dovršen modul zaključenja s:
  - Sveobuhvatnim sažetkom postignuća radionice
  - Sekcijom ključno usvojenih pojmova o AZD-u, predlošcima i AI Foundry
  - Preporukama za nastavak puta učenja
  - Vježbama radionice s ocjenama težine
  - Poveznicama za povratne informacije i podršku zajednice

- **📚 Modul radionice 3 (Analiza)**: Ažurirani ciljevi učenja s:
  - Uputama za aktivaciju GitHub Copilota s MCP poslužiteljima
  - Razumijevanjem strukture mapa AZD predložaka
  - Organizacijskim obrascima infrastrukture kao koda (Bicep)
  - Uputama za praktične laboratorijske vježbe

- **🔧 Modul radionice 6 (Demontaža)**: Dovršen s:
  - Ciljevima čišćenja resursa i upravljanja troškovima
  - Korištenjem `azd down` za sigurno uklanjanje infrastrukture
  - Uputama za oporavak kognitivnih usluga koje su privremeno izbrisane
  - Bonus istraživanjima za GitHub Copilot i Azure Portal

#### Popravljeno
- **🔗 Popravak pokvarenih veza**: Riješeno više od 15 pokvarenih internih veza u dokumentaciji:
  - `docs/ai-foundry/ai-model-deployment.md`: Popravljeni putevi do microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Ispravljeni putovi ai-model-deployment.md i production-ai-practices.md
  - `docs/getting-started/first-project.md`: Zamijenjen nepostojeći cicd-integration.md s deployment-guide.md
  - `examples/retail-scenario.md`: Popravljeni putevi FAQ-a i vodiča za rješavanje problema
  - `examples/container-app/microservices/README.md`: Ispravljeni putovi za početnu stranicu te vodiče za implementaciju
  - `resources/faq.md` i `resources/glossary.md`: Ažurirane reference na poglavlja o AI-u
  - `course-outline.md`: Popravljene reference za vodič instruktora i laboratorij radionice AI

- **📅 Banner statusa radionice**: Ažuriran iz “U izradi” u aktivan status radionice s datumom veljače 2026.

- **🔗 Navigacija radionice**: Popravljene neispravne navigacijske veze u README.md radionice koje su pokazivale na nepostojeću mapu lab-1-azd-basics

#### Promijenjeno
- **Prezentacija radionice**: Uklonjena upozorenja “u izradi”, radionica je sada dovršena i spremna za korištenje
- **Dosljednost navigacije**: Osigurana pravilna međumodularna navigacija za sve module radionice
- **Reference na put učenja**: Ažurirane međureferencije poglavlja na ispravne microsoft-foundry puteve

#### Validirano
- ✅ Sve engleske markdown datoteke imaju ispravne interne veze
- ✅ Moduli radionice 0-7 su potpuni s ciljevima učenja
- ✅ Navigacija između poglavlja i modula funkcionalna
- ✅ Sadržaj je prikladan za AI programere koji koriste Microsoft AZD
- ✅ Očuvan je jezik i struktura prilagođena početnicima
- ✅ CONTRIBUTING.md pruža jasne smjernice za doprinose zajednice

#### Tehnička implementacija
- **Provjera veza**: Automatski PowerShell skripta je verificirala sve .md interne veze
- **Revizija sadržaja**: Ručni pregled potpune radionice i prikladnosti za početnike
- **Sustav navigacije**: Dosljedni obrasci navigacije po poglavljima i modulima

#### Napomene
- **Opseg**: Promjene su provedene samo u engleskoj dokumentaciji
- **Prijevodi**: Mape s prijevodima nisu ažurirane u ovoj verziji (automatski prijevod će se sinkronizirati kasnije)
- **Trajanje radionice**: Kompletna radionica sada pruža 3-4 sata praktičnog učenja

---

### [v3.8.0] - 2025-11-19

#### Napredna dokumentacija: nadzor, sigurnost i obrasci za više agenata
**Ova verzija dodaje sveobuhvatne lekcije najviše razine o integraciji Application Insightsa, obrascima autentikacije i koordinacije više agenata za produkcijske implementacije.**

#### Dodano
- **📊 Lekcija o integraciji Application Insightsa**: u `docs/pre-deployment/application-insights.md`:
  - Fokus na AZD implementacije s automatskim provisioningom
  - Potpuni Bicep predlošci za Application Insights + Log Analytics
  - Funkcionalne Python aplikacije s prilagođenom telemetrijom (1.200+ linija)
  - Obrasci nadzora za AI/LLM (praćenje Azure OpenAI tokena/troškova)
  - 6 Mermaid dijagrama (arhitektura, distribuirano praćenje, tijek telemetrije)
  - 3 praktične vježbe (alarme, nadzorne ploče, AI nadzor)
  - Primjeri Kusto upita i strategije optimizacije troškova
  - Streaming metrika uživo i debug u realnom vremenu
  - 40-50 minuta trajanja lekcije s proizvodnim obrascima

- **🔐 Lekcija o obrascima autentikacije i sigurnosti**: u `docs/getting-started/authsecurity.md`:
  - 3 obrasca autentikacije (connection strings, Key Vault, managed identity)
  - Potpuni Bicep predlošci infrastrukture za sigurne implementacije
  - Kod Node.js aplikacije s integracijom Azure SDK-a
  - 3 potpune vježbe (aktivacija managed identity, user-assigned identity, rotacija Key Vault ključeva)
  - Najbolje sigurnosne prakse i RBAC konfiguracije
  - Vodič za rješavanje problema i analizu troškova
  - Produkcijski spremni obrasci autentikacije bez lozinki

- **🤖 Lekcija o obrascima koordinacije više agenata**: u `docs/pre-deployment/coordination-patterns.md`:
  - 5 obrazaca koordinacije (sekvencijalni, paralelni, hijerarhijski, vođeni događajima, konsenzus)
  - Potpuna implementacija usluge orkestratora (Python/Flask, 1.500+ linija)
  - 3 specijalizirana agenta (Research, Writer, Editor)
  - Integracija Service Bus za redove poruka
  - Upravljanje stanjem s Cosmos DB za distribuirane sustave
  - 6 Mermaid dijagrama prikazujući interakcije agenata
  - 3 napredne vježbe (rukovanje timeoutom, retry logika, circuit breaker)
  - Prikaz troškova ($240-565/mjesečno) i strategije optimizacije
  - Integracija Application Insightsa za nadzor

#### Poboljšano
- **Poglavlje prije implementacije**: Sada uključuje sveobuhvatne obrasce nadzora i koordinacije
- **Poglavlje za početnike**: Poboljšano profesionalnim obrascima autentikacije
- **Spremnost za produkciju**: Potpuno pokrivanje od sigurnosti do promatranja
- **Pregled tečaja**: Ažuriran za nove lekcije u Poglavljima 3 i 6

#### Promijenjeno
- **Napredak u učenju**: Bolja integracija sigurnosti i nadzora kroz cijeli tečaj
- **Kvaliteta dokumentacije**: Dosljedni A-razredni standardi (95-97%) kroz nove lekcije
- **Obrasci za produkciju**: Potpuno end-to-end pokriće za enterprise implementacije

#### Poboljšano
- **Iskustvo developera**: Jasan put od razvoja do produkcijskog nadzora
- **Sigurnosni standardi**: Profesionalni obrasci autentikacije i upravljanja tajnama
- **Promatranje**: Potpuna integracija Application Insightsa s AZD-om
- **AI Workloads**: Specijalizirani nadzor za Azure OpenAI i sustave više agenata

#### Validirano
- ✅ Sve lekcije uključuju potpuni funkcionalni kod (ne samo isječke)
- ✅ Mermaid dijagrami za vizualno učenje (19 ukupno u 3 lekcije)
- ✅ Praktične vježbe s provjerama (9 ukupno)
- ✅ Produkcijski spremni Bicep predlošci deployabilni preko `azd up`
- ✅ Analiza troškova i strategije optimizacije
- ✅ Vodiči za rješavanje problema i najbolje prakse
- ✅ Kontrolne točke znanja s verifikacijskim naredbama

#### Rezultati ocjene dokumentacije
- **docs/pre-deployment/application-insights.md**: - Sveobuhvatan vodič za nadzor
- **docs/getting-started/authsecurity.md**: - Profesionalni sigurnosni obrasci
- **docs/pre-deployment/coordination-patterns.md**: - Napredne arhitekture za više agenata
- **Ukupni novi sadržaj**: - Dosljedni vrhunski standardi kvalitete

#### Tehnička implementacija
- **Application Insights**: Log Analytics + prilagođena telemetrija + distribuirano praćenje
- **Autentikacija**: Managed Identity + Key Vault + RBAC obrasci
- **Više agenata**: Service Bus + Cosmos DB + Container Apps + orkestracija
- **Nadzor**: Streaming metrika uživo + Kusto upiti + alarmi + nadzorne ploče
- **Upravljanje troškovima**: Strategije uzorkovanja, politike zadržavanja, kontrole budžeta

### [v3.7.0] - 2025-11-19

#### Poboljšanja kvalitete dokumentacije i novi primjer Azure OpenAI
**Ova verzija poboljšava kvalitetu dokumentacije u cijelom spremištu i dodaje potpuni primjer implementacije Azure OpenAI s GPT-4 chat sučeljem.**

#### Dodano
- **🤖 Primjer Azure OpenAI chat-a**: Potpuna GPT-4 implementacija s funkcionalnim rješenjem u `examples/azure-openai-chat/`:
  - Potpuna infrastruktura Azure OpenAI (implementacija GPT-4 modela)
  - Python sučelje za chat preko komandne linije s poviješću razgovora
  - Integracija s Key Vaultom za sigurno pohranjivanje API ključeva
  - Praćenje korištenja tokena i procjene troškova
  - Ograničenje brzine i rukovanje pogreškama
  - Sveobuhvatni README s vodičem za implementaciju (35-45 minuta)
  - 11 datoteka spremnih za produkciju (Bicep predlošci, Python aplikacija, konfiguracija)
- **📚 Vježbe za dokumentaciju**: Dodane praktične vježbe u vodič za konfiguraciju:
  - Vježba 1: Konfiguracija za više okruženja (15 minuta)
  - Vježba 2: Praksa upravljanja tajnama (10 minuta)
  - Jasni kriteriji uspjeha i provjere
- **✅ Verifikacija implementacije**: Dodan odjeljak za verifikaciju u vodič za implementaciju:
  - Postupci zdravstvene provjere
  - Lista kriterija uspjeha
  - Očekivani rezultati za sve implementacijske naredbe
  - Brzi referentni vodič za rješavanje problema

#### Poboljšano
- **examples/README.md**: Ažuriran na kvalitetu ocjene A (93%):
  - Dodan azure-openai-chat u sve relevantne sekcije
  - Ažuriran broj lokalnih primjera s 3 na 4
  - Uvršten u tablicu AI primjera aplikacija
  - Integriran u Quick Start za srednje korisnike
  - Dodan u Microsoft Foundry Templates sekciju
  - Ažurirane usporedne matrice i tehničke reference
- **Kvaliteta dokumentacije**: Poboljšana sa B+ (87%) na A- (92%) kroz folder docs:
  - Dodani očekivani rezultati kod ključnih naredbi
  - Uključene provjere za promjene konfiguracije
  - Poboljšano praktično učenje s vježbama

#### Promijenjeno
- **Napredak u učenju**: Bolja integracija AI primjera za srednje korisnike
- **Struktura dokumentacije**: Više akcijskih vježbi s jasnim ishodima
- **Proces verifikacije**: Dodani eksplicitni kriteriji uspjeha za ključne tokove rada

#### Poboljšano
- **Iskustvo developera**: Azure OpenAI implementacija traje sada 35-45 minuta (naspram 60-90 za složenije alternative)
- **Transparentnost troškova**: Jasne procjene troškova ($50-200/mjesečno) za Azure OpenAI primjer
- **Put učenja**: AI programeri imaju jasan ulazni punkt s azure-openai-chat
- **Standardi dokumentacije**: Dosljedni očekivani rezultati i provjere

#### Validirano
- ✅ Azure OpenAI primjer potpuno funkcionalan s `azd up`
- ✅ Sve 11 implementacijskih datoteka sintaktički ispravne
- ✅ Upute u README odgovaraju stvarnom iskustvu implementacije
- ✅ Veze u dokumentaciji ažurirane na 8+ lokacija
- ✅ Indeks primjera točno odražava 4 lokalna primjera
- ✅ Nema dupliciranih vanjskih veza u tablicama
- ✅ Sve reference u navigaciji ispravne

#### Tehnička implementacija
- **Arhitektura Azure OpenAI**: GPT-4 + Key Vault + Container Apps obrazac
- **Sigurnost**: Spremna managed identity, tajne u Key Vaultu
- **Nadzor**: Integracija Application Insights
- **Upravljanje troškovima**: Praćenje tokena i optimizacija korištenja
- **Implementacija**: Jedina `azd up` naredba za kompletnu postavu

### [v3.6.0] - 2025-11-19

#### Veliko ažuriranje: Primjeri implementacije Container App aplikacija
**Ova verzija donosi sveobuhvatne, produkcijski spremne primjere implementacije kontejneriziranih aplikacija koristeći Azure Developer CLI (AZD), s potpunom dokumentacijom i integracijom u put učenja.**

#### Dodano
- **🚀 Primjeri Container App aplikacija**: Novi lokalni primjeri u `examples/container-app/`:
  - [Glavni vodič](examples/container-app/README.md): Potpuni pregled kontejneriziranih implementacija, brzog starta, produkcije i naprednih obrazaca
  - [Jednostavan Flask API](../../examples/container-app/simple-flask-api): REST API za početnike s autoskaliranjem na nulu, health probeovima, nadzorom i rješavanjem problema
  - [Arhitektura mikroservisa](../../examples/container-app/microservices): Produkcijski spremna višeservisna implementacija (API Gateway, Product, Order, User, Notification), asinkrono poručivanje, Service Bus, Cosmos DB, Azure SQL, distribuirano praćenje, blue-green/canary implementacije
- **Najbolje prakse**: Sigurnost, nadzor, optimizacija troškova i vodiči za CI/CD za kontejnerizirane radne opterećenja
- **Primjeri koda**: Potpuni `azure.yaml`, Bicep predlošci i višelingvijski servisi (Python, Node.js, C#, Go)
- **Testiranje i otklanjanje poteškoća**: Scenariji krajnjeg do kraja testiranja, naredbe za nadzor, upute za otklanjanje problema

#### Promijenjeno
- **README.md**: Ažuriran za isticanje i povezivanje novih primjera Container App aplikacija pod "Lokalni primjeri - Container aplikacije"
- **examples/README.md**: Ažuriran za isticanje primjera container app, dodane stavke u matricu usporedbe i ažurirane reference tehnologija/arhitekture
- **Sadržaj tečaja i vodič za učenje**: Ažurirano za referencu na nove primjere aplikacija i obrasce implementacije kontejnera u relevantnim poglavljima

#### Potvrđeno
- ✅ Svi novi primjeri mogu se implementirati pomoću `azd up` i slijede najbolje prakse
- ✅ Dokumentacija ima ažurirane međulinke i navigaciju
- ✅ Primjeri pokrivaju scenarije od početničkih do naprednih, uključujući produkcijske mikroservise

#### Napomene
- **Opseg**: Samo dokumentacija i primjeri na engleskom jeziku
- **Sljedeći koraci**: Proširenje dodatnim naprednim obrascima kontejnera i automatizacijom CI/CD u budućim izdanjima

### [v3.5.0] - 2025-11-19

#### Promjena naziva proizvoda: Microsoft Foundry
**Ova verzija provodi opsežnu promjenu naziva proizvoda iz "Microsoft Foundry" u "Microsoft Foundry" u cijeloj engleskoj dokumentaciji, odražavajući službenu Microsoftovu promjenu brenda.**

#### Promijenjeno
- **🔄 Ažuriranje naziva proizvoda**: Potpuna promjena brenda iz "Microsoft Foundry" u "Microsoft Foundry"
  - Ažurirani svi upiti u engleskoj dokumentaciji u mapi `docs/`
  - Preimenovana mapa: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Preimenovana datoteka: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Ukupno: 23 reference sadržaja ažurirane u 7 datoteka dokumentacije

- **📁 Promjene strukture mapa**:
  - `docs/ai-foundry/` preimenovano u `docs/microsoft-foundry/`
  - Sve međureferencije ažurirane kako bi odražavale novu strukturu mapa
  - Validirani navigacijski linkovi u cijeloj dokumentaciji

- **📄 Preimenovanja datoteka**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Svi unutarnji linkovi ažurirani za novi naziv datoteke

#### Ažurirane datoteke
- **Dokumentacija poglavlja** (7 datoteka):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 ažuriranja navigacijskih linkova
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 reference naziva proizvoda ažurirane
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Već koristi Microsoft Foundry (iz prethodnih ažuriranja)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 reference ažurirane (pregled, povratne informacije zajednice, dokumentacija)
  - `docs/getting-started/azd-basics.md` - 4 ažuriranja međulinkova
  - `docs/getting-started/first-project.md` - 2 linka poglavlja ažurirana
  - `docs/getting-started/installation.md` - 2 linka za sljedeće poglavlje ažurirana
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 reference ažurirane (navigacija, Discord zajednica)
  - `docs/troubleshooting/common-issues.md` - 1 navigacijski link ažuriran
  - `docs/troubleshooting/debugging.md` - 1 navigacijski link ažuriran

- **Datoteke strukture tečaja** (2 datoteke):
  - `README.md` - 17 referenci ažurirano (pregled tečaja, naslovi poglavlja, odjeljak predložaka, uvidi zajednice)
  - `course-outline.md` - 14 referenci ažurirano (pregled, ciljevi učenja, resursi poglavlja)

#### Potvrđeno
- ✅ Nema preostalih referenci na mapu "ai-foundry" u engleskoj dokumentaciji
- ✅ Nema preostalih referenci na naziv proizvoda "Microsoft Foundry" u engleskoj dokumentaciji
- ✅ Svi navigacijski linkovi funkcioniraju s novom strukturom mapa
- ✅ Preimenovanja datoteka i mapa uspješno dovršena
- ✅ Validirane međulinke između poglavlja

#### Napomene
- **Opseg**: Promjene primijenjene samo u engleskoj dokumentaciji u mapi `docs/`
- **Prijevodi**: Mape prijevoda (`translations/`) nisu ažurirane u ovoj verziji
- **Radionica**: Materijali radionice (`workshop/`) nisu ažurirani u ovoj verziji
- **Primjeri**: Datoteke s primjerima još uvijek mogu sadržavati stare nazive (bit će riješeno u budućem ažuriranju)
- **Vanjski linkovi**: Vanjski URL-ovi i poveznice na GitHub repozitorij ostaju nepromijenjeni

#### Vodič za migraciju za suradnike
Ako imate lokalne grane ili dokumentaciju koja referencira staru strukturu:
1. Ažurirajte reference mapa: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Ažurirajte reference datoteka: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Zamijenite naziv proizvoda: "Microsoft Foundry" → "Microsoft Foundry"
4. Provjerite da svi interni linkovi u dokumentaciji ispravno rade

---

### [v3.4.0] - 2025-10-24

#### Poboljšanja pregleda infrastrukture i validacije
**Ova verzija uvodi potpunu podršku za novu funkcionalnost Azure Developer CLI pregleda te poboljšava korisničko iskustvo radionice.**

#### Dodano
- **🧪 azd provision --preview Dokumentacija značajke**: Opsežna pokrivenost nove funkcionalnosti pregleda infrastrukture
  - Referenca naredbi i primjeri korištenja u cheat sheetu
  - Detaljna integracija u vodiču za provisioning s primjerima upotrebe i prednostima
  - Integracija pre-flight provjere za sigurniju validaciju implementacije
  - Ažuriranja vodiča za početak rada s praksama sigurne implementacije
- **🚧 Banner statusa radionice**: Profesionalni HTML banner koji prikazuje status razvoja radionice
  - Dizajn s gradijentom i indikatorima izgradnje radi jasne korisničke komunikacije
  - Vrijeme posljednjeg ažuriranja za transparentnost
  - Mobilno prilagođen dizajn za sve vrste uređaja

#### Poboljšano
- **Sigurnost infrastrukture**: Funkcionalnost pregleda integrirana kroz cijelu dokumentaciju o implementaciji
- **Validacija prije implementacije**: Automatizirani skripti sada uključuju testiranje pregleda infrastrukture
- **Razvojni tok**: Ažurirane naredbe uključuju pregled kao najbolju praksu
- **Iskustvo radionice**: Jasno postavljena očekivanja korisnika o statusu sadržaja

#### Promijenjeno
- **Najbolje prakse implementacije**: Preporučena radna procedura je sada prvo pregled
- **Tok dokumentacije**: Validacija infrastrukture premještena ranije u proces učenja
- **Prezentacija radionice**: Profesionalna komunikacija statusa s jasnim vremenskim okvirom razvoja

#### Poboljšano
- **Sigurnost na prvom mjestu**: Promjene infrastrukture sada se mogu validirati prije implementacije
- **Suradnja tima**: Rezultati pregleda mogu se dijeliti radi pregleda i odobrenja
- **Svijest o troškovima**: Bolje razumijevanje troškova resursa prije provisioning-a
- **Smanjenje rizika**: Smanjen broj neuspjelih implementacija zahvaljujući ranijoj validaciji

#### Tehnička implementacija
- **Višedokumentna integracija**: Značajka pregleda dokumentirana u 4 ključne datoteke
- **Obrasci naredbi**: Dosljedna sintaksa i primjeri u cijeloj dokumentaciji
- **Integracija najboljih praksi**: Pregled uključen u radne tokove validacije i skripte
- **Vizualni indikatori**: Jasni oznake NOVE funkcionalnosti radi lakšeg pronalaženja

#### Infrastruktura radionice
- **Komunikacija statusa**: Profesionalni HTML banner s gradijentnim stilom
- **Korisničko iskustvo**: Jasno prikazan status razvoja za sprečavanje zabune
- **Profesionalna prezentacija**: Održava vjerodostojnost repozitorija dok postavlja očekivanja
- **Transparentnost vremenskog okvira**: Datum zadnjeg ažuriranja u listopadu 2025. za odgovornost

### [v3.3.0] - 2025-09-24

#### Poboljšani materijali radionice i interaktivno iskustvo učenja
**Ova verzija uvodi opsežne materijale radionice s pregledom u pregledniku i strukturiranim putem učenja.**

#### Dodano
- **🎥 Interaktivni vodič radionice**: Iskustvo radionice preko preglednika s MkDocs mogućnošću pregleda
- **📝 Strukturirane upute radionice**: 7-korak vođeni put učenja od otkrića do prilagodbe
  - 0-Uvod: Pregled radionice i početno postavljanje
  - 1-Izbor AI predloška: Proces otkrivanja i odabira predloška
  - 2-Validacija AI predloška: Procedura implementacije i validacije
  - 3-Razgradnja AI predloška: Razumijevanje arhitekture predloška
  - 4-Konfiguracija AI predloška: Konfiguracija i prilagodba
  - 5-Prilagodba AI predloška: Napredne modifikacije i iteracije
  - 6-Razgradnja infrastrukture: Čišćenje i upravljanje resursima
  - 7-Završetak: Sažetak i nadaljnji koraci
- **🛠️ Alati za radionicu**: Konfiguracija MkDocs s Material temom za poboljšano iskustvo učenja
- **🎯 Praktični put učenja**: 3-korak metodologija (Otkriće → Implementacija → Prilagodba)
- **📱 Integracija GitHub Codespaces**: Nesmetano postavljanje razvojnih okruženja

#### Poboljšano
- **AI radionica**: Proširena s opsežnim strukturiranim iskustvom učenja od 2-3 sata
- **Dokumentacija radionice**: Profesionalna prezentacija s navigacijom i vizualnim pomagalima
- **Napredovanje u učenju**: Jasna uputstva korak-po-korak od odabira predloška do produkcijske implementacije
- **Iskustvo developera**: Integrirani alati za pojednostavnjenje razvojnih tokova

#### Poboljšano
- **Pristupačnost**: Sučelje u pregledniku s pretragom, funkcijom kopiranja i preklopom tema
- **Učenje vlastitim tempom**: Fleksibilna struktura radionice prikladna za različite brzine učenja
- **Praktična primjena**: Scenariji implementacije AI predložaka u stvarnom svijetu
- **Integracija zajednice**: Discord integracija za podršku radionici i suradnju

#### Značajke radionice
- **Ugrađena pretraga**: Brzo pronalaženje ključnih riječi i lekcija
- **Kopiranje blokova koda**: Funkcija kopiranja na prelaz miša za sve primjere koda
- **Preklop teme**: Podrška za tamni/svijetli način rada za različite preferencije
- **Vizualni materijali**: Snimke zaslona i dijagrami za bolje razumijevanje
- **Integrirana pomoć**: Izravan pristup Discord zajednici za podršku

### [v3.2.0] - 2025-09-17

#### Velika reorganizacija navigacije i sustav učenja baziran na poglavljima
**Ova verzija uvodi cjelovit sustav učenja podijeljen u poglavlja s poboljšanom navigacijom kroz cijeli repozitorij.**

#### Dodano
- **📚 Sustav učenja po poglavljima**: Reorganizacija cijelog tečaja u 8 progresivnih poglavlja
  - Poglavlje 1: Osnove & Brzi početak (⭐ - 30-45 minuta)
  - Poglavlje 2: AI-prvi razvoj (⭐⭐ - 1-2 sata)
  - Poglavlje 3: Konfiguracija i autentikacija (⭐⭐ - 45-60 minuta)
  - Poglavlje 4: Infrastruktura kao kod i implementacija (⭐⭐⭐ - 1-1,5 sati)
  - Poglavlje 5: Multi-agent AI rješenja (⭐⭐⭐⭐ - 2-3 sata)
  - Poglavlje 6: Validacija i planiranje prije implementacije (⭐⭐ - 1 sat)
  - Poglavlje 7: Otklanjanje problema i ispravljanje pogrešaka (⭐⭐ - 1-1,5 sati)
  - Poglavlje 8: Produkcijski i enterprise obrasci (⭐⭐⭐⭐ - 2-3 sata)
- **📚 Sveobuhvatan navigacijski sustav**: Dosljedni navigacijski zaglavlja i podnožja u cijeloj dokumentaciji
- **🎯 Praćenje napretka**: Lista za provjeru dovršetka tečaja i sustav potvrde učenja
- **🗺️ Vodič kroz put učenja**: Jasne ulazne točke za različite razine iskustva i ciljeve
- **🔗 Navigacija s međulinkovima**: Povezana poglavlja i preduvjeti jasno povezani

#### Poboljšano
- **Struktura README-a**: Pretvorena u strukturiranu platformu za učenje s organizacijom po poglavljima
- **Navigacija dokumentacije**: Svaka stranica sada uključuje kontekst poglavlja i upute za napredak
- **Organizacija predložaka**: Primjeri i predlošci povezani s odgovarajućim poglavljima za učenje
- **Integracija resursa**: Cheatsheetovi, često postavljana pitanja i vodiči povezani s relevantnim poglavljima
- **Integracija radionice**: Praktične laboratorijske vježbe povezane s ciljevima više poglavlja

#### Promijenjeno
- **Napredak u učenju**: Prelazak s linearne dokumentacije na fleksibilno učenje po poglavljima
- **Smještaj konfiguracije**: Vodič za konfiguraciju premješten u Poglavlje 3 radi bolje logike učenja
- **Integracija AI sadržaja**: Bolja integracija AI specifičnog sadržaja kroz cijeli put učenja
- **Produkcijski sadržaj**: Napredni obrasci konsolidirani u Poglavlju 8 za enterprise korisnike

#### Poboljšano
- **Korisničko iskustvo**: Jasni navigacijski krušni putovi i indikatori napretka poglavlja
- **Pristupačnost**: Dosljedni obrasci navigacije olakšavaju prolaz kroz tečaj
- **Profesionalna prezentacija**: Struktura tečaja u stilu fakulteta pogodna za akademsku i korporativnu obuku
- **Učinkovitost učenja**: Kraće vrijeme pronalaska relevantnog sadržaja zahvaljujući boljoj organizaciji

#### Tehnička implementacija
- **Navigacijska zaglavlja**: Standardizirana navigacija po poglavljima kroz 40+ dokumentacijskih datoteka
- **Navigacija podnožja**: Dosljedna uputa za napredak i indikatori dovršetka poglavlja
- **Međulinkiranje**: Sveobuhvatan sustav unutarnjih poveznica za povezivanje srodnih koncepata
- **Mapiranje poglavlja**: Predlošci i primjeri jasno povezani s ciljevima učenja

#### Poboljšanje vodiča za učenje
- **📚 Sveobuhvatni ciljevi učenja**: Restrukturiran vodič za učenje usklađen s 8-poglavnim sustavom
- **🎯 Procjena po poglavljima**: Svako poglavlje uključuje specifične ciljeve učenja i praktične vježbe
- **📋 Praćenje napretka**: Tjedni raspored učenja s mjerljivim rezultatima i listama za provjeru
- **❓ Pitanja za provjeru znanja**: Pitanja za validaciju znanja za svako poglavlje sa stručnim ishodima
- **🛠️ Praktične vježbe**: Praktične aktivnosti s pravim scenarijima implementacije i otklanjanja problema
- **📊 Napredak vještina**: Jasna evolucija od osnovnih koncepata do enterprise obrazaca s fokusom na karijerni razvoj
- **🎓 Okvir za certifikaciju**: Profesionalni ishodi razvoja i sustav priznanja u zajednici
- **⏱️ Upravljanje vremenom**: Strukturirani 10-tjedni plan učenja s validacijom prekretnica

### [v3.1.0] - 2025-09-17

#### Poboljšana multi-agentna AI rješenja
**Ova verzija poboljšava rješenje za maloprodaju s više agenata boljim imenovanjem agenata i poboljšanom dokumentacijom.**

#### Promijenjeno
- **Terminologija za višestruke agente**: Zamijenjen naziv "Cora agent" s "Customer agent" u cijelom maloprodajnom multi-agentnom rješenju radi bolje jasnoće
- **Arhitektura agenata**: Ažurirana sva dokumentacija, ARM predlošci i primjeri koda za dosljedno korištenje naziva "Customer agent"
- **Primjeri konfiguracije**: Modernizirani obrasci konfiguracije agenata s ažuriranim nazivima
- **Konzistentnost dokumentacije**: Osigurano korištenje profesionalnih, opisnih imena agenata u svim referencama

#### Poboljšano
- **Paketi ARM predložaka**: Ažuriran retail-multiagent-arm-template s referencama na Customer agent
- **Arhitektonski dijagrami**: Osvježeni Mermaid dijagrami s ažuriranim imenima agenata
- **Primjeri koda**: Python klase i primjeri implementacije sada koriste CustomerAgent imenovanje
- **Promjenjive okoline**: Ažurirani svi skripti implementacije za korištenje konvencije CUSTOMER_AGENT_NAME

#### Poboljšano
- **Iskustvo programera**: Jasnije uloge i odgovornosti agenata u dokumentaciji  
- **Spremnost za produkciju**: Bolja usklađenost s nazivnim konvencijama poduzeća  
- **Materijali za učenje**: Intuitivnija imena agenata za obrazovne svrhe  
- **Upotrebljivost predložaka**: Pojednostavljeno razumijevanje funkcija agenata i obrazaca implementacije  

#### Tehnički detalji  
- Ažurirani Mermaid dijagrami arhitekture s referencama na CustomerAgent  
- Zamijenjena imena klasa CoraAgent s CustomerAgent u Python primjerima  
- Izmijenjene JSON konfiguracije ARM predložaka za korištenje tipa agenta "customer"  
- Ažurirane varijable okruženja s obrazaca CORA_AGENT_* na CUSTOMER_AGENT_*  
- Osvježene sve naredbe za implementaciju i konfiguracije kontejnera  

### [v3.0.0] - 2025-09-12  

#### Glavne promjene - Fokus na AI programere i integracija Microsoft Foundry  
**Ova verzija pretvara repozitorij u sveobuhvatni izvor za učenje usmjeren na AI s integracijom Microsoft Foundry.**  

#### Dodano  
- **🤖 AI-prvi put učenje**: Potpuna restrukturacija s prioritetom na AI programere i inženjere  
- **Vodič za integraciju Microsoft Foundry**: Sveobuhvatna dokumentacija za povezivanje AZD sa servisima Microsoft Foundry  
- **Obrasci implementacije AI modela**: Detaljni vodič za odabir modela, konfiguraciju i strategije implementacije u produkciju  
- **AI radionica**: 2-3 sata praktične radionice za pretvaranje AI aplikacija u AZD-deployable rješenja  
- **Najbolje prakse za AI u produkciji**: Obrasci spremni za poduzeća za skaliranje, nadzor i osiguranje AI radnih opterećenja  
- **Vodič za rješavanje problema specifičnih za AI**: Sveobuhvatno rješavanje problema za Azure OpenAI, Cognitive Services i AI implementacije  
- **Galerija AI predložaka**: Istaknuta kolekcija Microsoft Foundry predložaka s ocjenama složenosti  
- **Materijali za radionicu**: Potpuna struktura radionice s praktičnim laboratorijima i referentnim materijalima  

#### Poboljšano  
- **Struktura README-a**: Fokusirana na AI programere s 45% podataka o interesu zajednice iz Microsoft Foundry Discorda  
- **Putovi učenja**: Namijenjeni AI programerima pored tradicionalnih putova za studente i DevOps inženjere  
- **Preporuke predložaka**: Istaknuti AI predlošci uključuju azure-search-openai-demo, contoso-chat i openai-chat-app-quickstart  
- **Integracija zajednice**: Poboljšana podrška Discord zajednice s AI-specifičnim kanalima i raspravama  

#### Sigurnost i fokus na produkciju  
- **Obrasci upravljanih identiteta**: AI-specifične konfiguracije autentikacije i sigurnosti  
- **Optimizacija troškova**: Praćenje upotrebe tokena i kontrola budžeta za AI radna opterećenja  
- **Višeregionalna implementacija**: Strategije za globalnu implementaciju AI aplikacija  
- **Praćenje performansi**: AI-specifični metrički podaci i integracija s Application Insights  

#### Kvaliteta dokumentacije  
- **Linearna struktura tečaja**: Logički napredak od početničkih do naprednih obrazaca implementacije AI  
- **Validirani URL-ovi**: Svi vanjski linkovi na repozitorije provjereni i dostupni  
- **Potpuni referentni prikaz**: Svi interni linkovi dokumentacije provjereni i funkcionalni  
- **Spremno za produkciju**: Obrasci implementacije za poduzeća s primjerima iz stvarnog svijeta  

### [v2.0.0] - 2025-09-09  

#### Glavne promjene - Restrukturiranje repozitorija i profesionalno poboljšanje  
**Ova verzija predstavlja značajnu preradu strukture repozitorija i prezentacije sadržaja.**  

#### Dodano  
- **Strukturirani okvir za učenje**: Sve stranice dokumentacije sada uključuju Uvod, Ciljeve učenja i Ishode učenja  
- **Navigacijski sustav**: Dodani linkovi Prethodni/Sljedeći kroz cijelu dokumentaciju za vođeni napredak u učenju  
- **Studijski vodič**: Sveobuhvatni study-guide.md s ciljevima učenja, praktičnim vježbama i materijalima za procjenu  
- **Profesionalna prezentacija**: Uklonjeni svi emoji za poboljšanu pristupačnost i profesionalan izgled  
- **Poboljšana struktura sadržaja**: Bolja organizacija i tok materijala za učenje  

#### Promijenjeno  
- **Format dokumentacije**: Standardizirana dokumentacija sa strukturiranim fokusom na učenje  
- **Tok navigacije**: Implementiran logički napredak kroz sve materijale za učenje  
- **Prezentacija sadržaja**: Uklonjeni dekorativni elementi u korist jasnog, profesionalnog formatiranja  
- **Struktura linkova**: Ažurirani svi interni linkovi radi podrške novom navigacijskom sustavu  

#### Poboljšano  
- **Pristupačnost**: Uklonjene ovisnosti o emotikonima za bolju kompatibilnost s čitačima zaslona  
- **Profesionalni izgled**: Čist, akademski stil prikaza prikladan za poduzeća  
- **Iskustvo učenja**: Strukturirani pristup s jasnim ciljevima i ishodima za svaki lekciju  
- **Organizacija sadržaja**: Bolji logički tok i povezanost između povezanih tema  

### [v1.0.0] - 2025-09-09  

#### Početno izdanje - Sveobuhvatan AZD repozitorij za učenje  

#### Dodano  
- **Osnovna struktura dokumentacije**  
  - Kompletan serijal vodiča za početak  
  - Sveobuhvatna dokumentacija za implementaciju i provisioning  
  - Detaljni resursi za rješavanje problema i vodiči za debagiranje  
  - Alati i procedure za validaciju prije implementacije  

- **Modul za početak rada**  
  - Osnove AZD-a: osnovni pojmovi i terminologija  
  - Vodič za instalaciju: specifične upute za platformu  
  - Vodič za konfiguraciju: postavljanje okruženja i autentikacija  
  - Prvi projekt: korak-po-korak praktični vodič  

- **Modul za implementaciju i provisioning**  
  - Vodič za implementaciju: potpuna dokumentacija tijeka rada  
  - Vodič za provisioning: Infrastruktur kao kod s Bicep-om  
  - Najbolje prakse za implementacije u produkciju  
  - Obrasci arhitekture više servisa  

- **Modul za validaciju prije implementacije**  
  - Planiranje kapaciteta: validacija dostupnosti Azure resursa  
  - Odabir SKU-a: sveobuhvatan vodič po razinama usluge  
  - Prethodni testovi: automatizirani skripti validacije (PowerShell i Bash)  
  - Alati za procjenu troškova i planiranje budžeta  

- **Modul za rješavanje problema**  
  - Uobičajeni problemi: često susretani problemi i rješenja  
  - Vodič za debagiranje: sustavne metodologije rješavanja problema  
  - Napredne dijagnostičke tehnike i alati  
  - Nadzor performansi i optimizacija  

- **Resursi i reference**  
  - Cheat sheet naredbi: brzi pregled osnovnih naredbi  
  - Rječnik: opsežna terminologija i definicija akronima  
  - FAQ: detaljni odgovori na najčešća pitanja  
  - Vanjski resursi i poveznice za zajednicu  

- **Primjeri i predlošci**  
  - Jednostavan primjer web aplikacije  
  - Predložak za implementaciju statične web stranice  
  - Konfiguracija kontejnerskih aplikacija  
  - Obrasci integracije baze podataka  
  - Primjeri arhitekture mikrousluga  
  - Implementacije serverless funkcija  

#### Značajke  
- **Višeplatformska podrška**: vodiči za instalaciju i konfiguraciju za Windows, macOS i Linux  
- **Nivoi vještina**: sadržaj dizajniran za studente do profesionalnih developera  
- **Praktični fokus**: primjeri iz prakse i stvarni scenariji  
- **Sveobuhvatna pokrivenost**: od osnovnih pojmova do naprednih uzoraka za poduzeća  
- **Pristup orijentiran na sigurnost**: integrirane najbolje sigurnosne prakse kroz cijeli sadržaj  
- **Optimizacija troškova**: smjernice za isplative implementacije i upravljanje resursima  

#### Kvaliteta dokumentacije  
- **Detaljni primjeri koda**: praktični, testirani uzorci koda  
- **Upute korak po korak**: jasne, provedive smjernice  
- **Sveobuhvatno rukovanje pogreškama**: rješavanje uobičajenih problema  
- **Integracija najboljih praksi**: industrijski standardi i preporuke  
- **Kompatibilnost verzija**: ažurirano s najnovijim Azure servisima i azd značajkama  

## Planirana buduća poboljšanja  

### Verzija 3.1.0 (planirano)  
#### Širenje AI platforme  
- **Podrška za više modela**: obrasci integracije za Hugging Face, Azure Machine Learning i prilagođene modele  
- **Okviri za AI agente**: predlošci za implementacije LangChain, Semantic Kernel i AutoGen  
- **Napredni RAG obrasci**: opcije vektorskih baza podataka izvan Azure AI Search (Pinecone, Weaviate itd.)  
- **Promatranje AI**: poboljšani nadzor izvedbe modela, upotrebe tokena i kvalitete odgovora  

#### Iskustvo programera  
- **VS Code ekstenzija**: integrirano razvojno iskustvo AZD + AI Foundry  
- **GitHub Copilot integracija**: AI-pomoć pri generiranju AZD predložaka  
- **Interaktivni tutorijali**: praktične vježbe kodiranja s automatiziranom validacijom za AI scenarije  
- **Video sadržaji**: dodatni video tutorijali za vizualne učenike fokusirane na AI implementacije  

### Verzija 4.0.0 (planirano)  
#### Poslovni AI obrasci  
- **Okvir upravljanja**: upravljanje AI modelima, usklađenost i audit trails  
- **Multi-tenant AI**: obrasci za usluživanje više kupaca s izoliranim AI uslugama  
- **Edge AI implementacija**: integracija s Azure IoT Edge i kontejnerskim instancama  
- **Hibridni cloud AI**: multi-cloud i hibridni obrasci implementacije za AI radna opterećenja  

#### Napredne značajke  
- **Automatizacija AI pipelinea**: MLOps integracija s Azure Machine Learning pipelineima  
- **Napredna sigurnost**: obrasci zero-trust, privatne krajnje točke i napredna zaštita od prijetnji  
- **Optimizacija performansi**: napredne strategije podešavanja i skaliranja za AI aplikacije s velikim kapacitetom  
- **Globalna distribucija**: obrasci isporuke sadržaja i edge cache za AI aplikacije  

### Verzija 3.0.0 (planirano) - zamijenjeno trenutnim izdanjem  
#### Predložena dodavanja - sada implementirana u v3.0.0  
- ✅ **AI-fokusirani sadržaj**: sveobuhvatna Microsoft Foundry integracija (završeno)  
- ✅ **Interaktivni tutorijali**: praktična AI radionica (završeno)  
- ✅ **Napredni sigurnosni modul**: AI-specifični sigurnosni obrasci (završeno)  
- ✅ **Optimizacija performansi**: strategije podešavanja AI radnih opterećenja (završeno)  

### Verzija 2.1.0 (planirano) - djelomično implementirano u v3.0.0  
#### Manja poboljšanja - neka dovršena u trenutnom izdanju  
- ✅ **Dodatni primjeri**: AI-fokusirani scenariji implementacije (završeno)  
- ✅ **Prošireni FAQ**: AI-specifična pitanja i rješavanje problema (završeno)  
- **Integracija alata**: poboljšani vodiči za integraciju IDE-a i uređivača  
- ✅ **Proširenje nadzora**: AI-specifični obrasci praćenja i upozorenja (završeno)  

#### Još planirano za buduće izdanje  
- **Dokumentacija prilagođena mobilnim uređajima**: responzivni dizajn za mobilno učenje  
- **Pristup bez interneta**: preuzimanje paketa dokumentacije  
- **Poboljšana integracija IDE-a**: VS Code ekstenzija za AZD + AI tokove rada  
- **Zajednički nadzor**: metrike zajednice u realnom vremenu i praćenje doprinosa  

## Doprinos promjenama u zapisniku  

### Izvještavanje promjena  
Kod doprinosa ovom repozitoriju, molimo osigurajte da unosi u zapisnik uključuju:  

1. **Broj verzije**: prema semantičkom verzioniranju (glavna.mala.ispravak)  
2. **Datum**: datum izdanja ili ažuriranja u formatu GGGG-MM-DD  
3. **Kategorija**: Dodano, Promijenjeno, Zastarjelo, Uklonjeno, Popravljeno, Sigurnost  
4. **Jasan opis**: sažet opis promjene  
5. **Procjena utjecaja**: kako promjene utječu na postojeće korisnike  

### Kategorije promjena  

#### Dodano  
- Nove značajke, dijelovi dokumentacije ili mogućnosti  
- Novi primjeri, predlošci ili resursi za učenje  
- Dodatni alati, skripte ili utilitiji  

#### Promijenjeno  
- Izmjene postojećih funkcionalnosti ili dokumentacije  
- Ažuriranja radi poboljšanja jasnoće ili točnosti  
- Restrukturiranje sadržaja ili organizacije  

#### Zastarjelo  
- Značajke ili pristupi koji se ukidaju  
- Dijelovi dokumentacije označeni za uklanjanje  
- Metode za koje postoje bolji alternativni pristupi  

#### Uklonjeno  
- Značajke, dokumentacija ili primjeri koji više nisu relevantni  
- Zastarjele informacije ili zastarjeli pristupi  
- Suvišni ili objedinjeni sadržaj  

#### Popravljeno  
- Ispravci pogrešaka u dokumentaciji ili kodu  
- Rješavanje prijavljenih problema  
- Poboljšanja točnosti ili funkcionalnosti  

#### Sigurnost  
- Poboljšanja ili popravci vezani za sigurnost  
- Ažuriranja najboljih sigurnosnih praksi  
- Rješavanje sigurnosnih ranjivosti  

### Smjernice za semantičko verzioniranje  

#### Glavna verzija (X.0.0)  
- Promjene koje prekidaju kompatibilnost i zahtijevaju akciju korisnika  
- Značajne restrukturacije sadržaja ili organizacije  
- Promjene koje mijenjaju temeljni pristup ili metodologiju  

#### Mala verzija (X.Y.0)  
- Nove značajke ili dodavanje sadržaja  
- Nadogradnje koje održavaju kompatibilnost unatrag  
- Dodatni primjeri, alati ili resursi  

#### Ispravak (X.Y.Z)  
- Ispravci pogrešaka  
- Manja poboljšanja postojećeg sadržaja  
- Pojašnjenja i sitna poboljšanja  

## Povratne informacije i prijedlozi zajednice  

Aktivno potičemo povratne informacije zajednice radi poboljšanja ovog izvora za učenje:  

### Kako dati povratnu informaciju  
- **GitHub Issues**: Prijavite probleme ili predložite poboljšanja (AI-specifični problemi dobrodošli)  
- **Discord rasprave**: Dijelite ideje i sudjelujte u zajednici Microsoft Foundry  
- **Pull Requests**: Izravno doprinosite poboljšanjima sadržaja, posebice AI predložaka i vodiča  
- **Microsoft Foundry Discord**: Sudjelujte u kanalu #Azure za AZD + AI rasprave  
- **Zajednički forumi**: Sudjelujte u širim raspravama Azure developera  

### Kategorije povratnih informacija  
- **Točnost AI sadržaja**: Ispravci vezani za integraciju i implementaciju AI servisa  
- **Iskustvo učenja**: Prijedlozi za poboljšanje toka učenja AI programera  
- **Nedostajući AI sadržaj**: Zahtjevi za dodatnim AI predlošcima, obrascima ili primjerima  
- **Pristupačnost**: Poboljšanja za različite načine učenja  
- **Integracija AI alata**: Prijedlozi za bolje integracije AI razvojnih tokova  
- **Obrasci za produkciju AI**: Zahtjevi za obrasce implementacije AI u poduzećima  

### Obveze na povratne informacije  
- **Odgovor na problema**: unutar 48 sati za prijavljene probleme  
- **Zahtjevi za značajke**: evaluacija unutar jednog tjedna  
- **Doprinosi zajednice**: pregled unutar jednog tjedna  
- **Sigurnosni problemi**: prioritetna i ubrzana reakcija  

## Plan održavanja  

### Redovna ažuriranja  
- **Mjesečni pregledi**: provjera točnosti sadržaja i valjanosti linkova  
- **Kvartalna ažuriranja**: veći dodaci i poboljšanja sadržaja  
- **Polugodišnji pregledi**: sveobuhvatne restrukturacije i nadogradnje  
- **Godišnja izdanja**: glavne verzije s značajnim poboljšanjima  

### Praćenje i osiguranje kvalitete  
- **Automatizirano testiranje**: redovita validacija primjera koda i linkova  
- **Integracija povratnih informacija zajednice**: redovita implementacija prijedloga korisnika  
- **Ažuriranja tehnologije**: usklađivanje s najnovijim Azure servisima i azd izdanjima  
- **Revizije pristupačnosti**: redovni pregledi radi inkluzivnog dizajna  

## Pravila podrške verzijama  

### Podrška za trenutne verzije  
- **Najnovija glavna verzija**: puna podrška s redovitim ažuriranjima  
- **Prethodna glavna verzija**: sigurnosna ažuriranja i kritične ispravke 12 mjeseci  
- **Stare verzije**: podrška zajednice, bez službenih ažuriranja  

### Smjernice za migraciju  
Kada se objavljuju glavne verzije, pružamo:
- **Vodiči za migraciju**: Upute za prijelaz korak po korak
- **Bilješke o kompatibilnosti**: Detalji o promjenama koje prekidaju kompatibilnost
- **Podrška alata**: Skripte ili alati za pomoć pri migraciji
- **Podrška zajednice**: Posebni forumi za pitanja o migraciji

---

**Navigacija**
- **Prethodna lekcija**: [Studijski vodič](resources/study-guide.md)
- **Sljedeća lekcija**: Povratak na [Glavni README](README.md)

**Ostanite ažurirani**: Pratite ovaj repozitorij za obavijesti o novim izdanjima i važnim ažuriranjima materijala za učenje.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:
Ovaj dokument preveden je korištenjem AI usluge prevođenja [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za kritične informacije preporučuje se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nerazumijevanja ili pogrešna tumačenja koja proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->