# Changelog - AZD Za Početnike

## Uvod

Ovaj zapis promjena dokumentira sve značajne promjene, ažuriranja i poboljšanja u spremištu AZD Za Početnike. Pridržavamo se principa semantičkog verzioniranja i održavamo ovaj zapis kako bismo korisnicima pomogli razumjeti što se promijenilo između verzija.

## Ciljevi učenja

Pregledom ovog zapisa promjena, moći ćete:
- Ostati informirani o novim značajkama i dodacima sadržaja
- Razumjeti poboljšanja postojeće dokumentacije
- Pratiti ispravke pogrešaka i korekcije za osiguranje točnosti
- Pratiti razvoj materijala za učenje kroz vrijeme

## Ishodi učenja

Nakon pregleda unosa u zapis promjena, moći ćete:
- Prepoznati novi sadržaj i resurse dostupne za učenje
- Razumjeti koje su sekcije ažurirane ili poboljšane
- Isplanirati svoj put učenja na temelju najnovijih materijala
- Dati povratne informacije i prijedloge za buduća poboljšanja

## Povijest verzija

### [v3.18.0] - 2026-03-16

#### AZD AI CLI naredbe, validacija sadržaja i proširenje predložaka
**Ova verzija dodaje pokrivenost naredbi `azd ai`, `azd extension` i `azd mcp` u svim poglavljima vezanim za AI, ispravlja neispravne poveznice i zastarjeli kod u agents.md, ažurira listu naredbi i u potpunosti preuređuje odjeljak Primjeri predložaka s validiranim opisima i novim Azure AI AZD predlošcima.**

#### Dodano
- **🤖 Pokrivenost za AZD AI CLI** u 7 datoteka (ranije samo u Poglavlju 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Novi odjeljak "Ekstenzije i AI naredbe" koji uvodi `azd extension`, `azd ai agent init` i `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opcija 4: `azd ai agent init` s usporednom tablicom (pristup predlošku nasuprot manifestu)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Pododjeljci "AZD ekstenzije za Foundry" i "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Brzi početak sada prikazuje oba puta implementacije, putem predloška i manifesta
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Odjeljak implementacije sada uključuje opciju `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Pododjeljak "AZD AI ekstenzijske naredbe za dijagnostiku"
  - `resources/cheat-sheet.md` — Novi odjeljak "AI & ekstenzijske naredbe" s `azd extension`, `azd ai agent init`, `azd mcp` i `azd infra generate`
- **📦 Novi AZD AI primjeri predložaka** u `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG chat s Blazor WebAssembly, Semantic Kernelom i podrškom za glasovni chat
  - **azure-search-openai-demo-java** — Java RAG chat koristeći Langchain4J s opcijama implementacije na ACA/AKS
  - **contoso-creative-writer** — Višeagentna aplikacija za kreativno pisanje koristeći Azure AI Agent Service, Bing Grounding i Prompty
  - **serverless-chat-langchainjs** — Serverless RAG koristeći Azure Functions + LangChain.js + Cosmos DB s lokalnom podrškom za Ollama razvoj
  - **chat-with-your-data-solution-accelerator** — Poslovni RAG akcelerator s administratorskim portalom, Teams integracijom i opcijama PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Referentna aplikacija za orkestraciju višestrukih MCP agenata s poslužiteljima u .NET, Pythonu, Javi i TypeScriptu
  - **azd-ai-starter** — Minimalni početni Bicep predložak za Azure AI infrastrukturu
  - **🔗 Link na izvrsnu AZD AI galeriju** — Referenca na [awesome-azd AI galeriju](https://azure.github.io/awesome-azd/?tags=ai) (80+ predložaka)

#### Ispravljeno
- **🔗 agents.md navigacija**: Poveznice Prethodno/Sljedeće sada odgovaraju redoslijedu lekcija u poglavlju 2 (Microsoft Foundry Integration → Agent → AI Model Deployment)
- **🔗 agents.md neispravne poveznice**: `production-ai-practices.md` je ispravljeno u `../chapter-08-production/production-ai-practices.md` (3 pojave)
- **📦 agents.md zastarjeli kod**: Zamjena `opencensus` s `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md nevažeći API**: Premještanje `max_tokens` iz `create_agent()` u `create_run()` kao `max_completion_tokens`
- **🔢 agents.md brojanje tokena**: Zamjena grube procjene `len//4` s `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Ispravljeno s "Cognitive Search + App Service" na "Azure AI Search + Azure Container Apps" (zadani host promijenjen u listopadu 2024)
- **contoso-chat**: Ažuriran opis za referenciranje Azure AI Foundry + Prompty, u skladu s stvarnim nazivom i tehnološkim stogom spremišta

#### Uklonjeno
- **ai-document-processing**: Uklonjena referenca na nefunkcionalni predložak (spremište nije javno dostupno kao AZD predložak)

#### Poboljšano
- **📝 agents.md zadaci**: Zadatak 1 sada prikazuje očekivani izlaz i korak `azd monitor`; zadatak 2 uključuje cjelokupan kod registracije `FunctionTool`; zadatak 3 zamjenjuje nejasne upute konkretnim `prepdocs.py` naredbama
- **📚 agents.md resursi**: Ažurirane poveznice na dokumentaciju za Azure AI Agent Service i brzo pokretanje
- **📋 agents.md tablica sljedećih koraka**: Dodan link na AI Workshop Lab za cjelovitu pokrivenost poglavlja

#### Ažurirane datoteke
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Poboljšanje navigacije tečaja
**Ova verzija poboljšava navigaciju kroz poglavlja README.md formata tablice.**

#### Promijenjeno
- **Tablica karte tečaja**: Poboljšana s izravnim poveznicama za lekcije, procjenama trajanja i ocjenama složenosti
- **Čišćenje mapa**: Uklonjene redundantne stare mape (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Provjera poveznica**: Sve 21+ unutarnje poveznice u tablici karte tečaja potvrđene

### [v3.16.0] - 2026-02-05

#### Ažuriranja naziva proizvoda
**Ova verzija ažurira reference proizvoda u skladu s trenutačnim Microsoftovim brendiranjem.**

#### Promijenjeno
- **Microsoft Foundry → Microsoft Foundry**: Sve reference ažurirane u neprevedenim datotekama
- **Azure AI Agent Service → Foundry Agents**: Naziv usluge ažuriran kako bi odražavao trenutačno brendiranje

#### Ažurirane datoteke
- `README.md` - Početna stranica tečaja
- `changelog.md` - Povijest verzija
- `course-outline.md` - Struktura tečaja
- `docs/chapter-02-ai-development/agents.md` - Vodič za AI agente
- `examples/README.md` - Dokumentacija primjera
- `workshop/README.md` - Početna stranica radionice
- `workshop/docs/index.md` - Indeks radionice
- `workshop/docs/instructions/*.md` - Sve datoteke uputa radionice

---

### [v3.15.0] - 2026-02-05

#### Velika restrukturacija spremišta: Imena mapa po poglavljima
**Ova verzija restrukturira dokumentaciju u namjenske mape po poglavljima radi bolje navigacije.**

#### Preimena mapa
Stare mape zamijenjene mapama označenim brojevima poglavlja:
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
- **📚 README datoteke poglavlja**: Kreirane README.md u svakoj mapi poglavlja s:
  - Ciljevima učenja i trajanjem
  - Tablicom lekcija s opisima
  - Naredbama za brzi početak
  - Navigacijom do drugih poglavlja

#### Promijenjeno
- **🔗 Ažurirane sve unutarnje poveznice**: 78+ putanja ažurirano kroz čitavu dokumentaciju
- **🗺️ Glavni README.md**: Ažurirana karta tečaja s novom strukturom poglavlja
- **📝 examples/README.md**: Ažurirane međureferencije na mape poglavlja

#### Uklonjeno
- Stara struktura mapa (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Restrukturiranje spremišta: Navigacija poglavljima
**Ova verzija je dodala README datoteke za navigaciju poglavljima (zamijenjeno verzijom v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Novi vodič za AI agente
**Ova verzija dodaje opsežan vodič za implementaciju AI agenata s Azure Developer CLI.**

#### Dodano
- **🤖 docs/microsoft-foundry/agents.md**: Cjeloviti vodič koji pokriva:
  - Što su AI agenti i kako se razlikuju od chatbotova
  - Tri brza predloška za pokretanje agenata (Foundry Agents, Prompty, RAG)
  - Obrasci arhitekture agenata (jedan agent, RAG, više agenata)
  - Konfiguracija i prilagodba alata
  - Praćenje i mjerenje metrika
  - Troškovi i optimizacija
  - Uobičajeni scenariji za rješavanje problema
  - Tri praktična zadatka sa kriterijima uspjeha

#### Struktura sadržaja
- **Uvod**: Koncepti agenata za početnike
- **Brzi početak**: Implementacija agenata s `azd init --template get-started-with-ai-agents`
- **Obrasci arhitekture**: Vizualni dijagrami obrazaca agenata
- **Konfiguracija**: Postavljanje alata i varijabli okoline
- **Praćenje**: Integracija s Application Insights
- **Zadaci**: Postupno praktično učenje (20-45 minuta svaki)

---

### [v3.12.0] - 2026-02-05

#### Ažuriranje DevContainer okruženja
**Ova verzija ažurira konfiguraciju kontejnera za razvoj s modernim alatima i boljim zadanim postavkama za AZD iskustvo učenja.**

#### Promijenjeno
- **🐳 Osnovna slika**: Ažurirana s `python:3.12-bullseye` na `python:3.12-bookworm` (najnoviji Debian stabilni)
- **📛 Ime kontejnera**: Promijenjeno s "Python 3" na "AZD za Početnike" radi jasnoće

#### Dodano
- **🔧 Nove značajke Dev kontejnera**:
  - `azure-cli` s omogućenim Bicep podrškom
  - `node:20` (LTS verzija za AZD predloške)
  - `github-cli` za upravljanje predlošcima
  - `docker-in-docker` za implementacije kontejnerskih aplikacija

- **🔌 Prosljeđivanje portova**: Prethodno konfigurirani portovi za uobičajeni razvoj:
  - 8000 (MkDocs pregled)
  - 3000 (Web aplikacije)
  - 5000 (Python Flask)
  - 8080 (API-jevi)

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
  - `eamodio.gitlens` - Vizualizacija Gita
  - `mhutchie.git-graph` - Povijest Gita

- **⚙️ VS Code postavke**: Dodane zadane postavke za Python interpreter, formatiranje pri spremanju i uklanjanje praznina

- **📦 Ažuriran requirements-dev.txt**:
  - Dodan MkDocs minify plugin
  - Dodan pre-commit za kvalitetu koda
  - Dodani Azure SDK paketi (azure-identity, azure-mgmt-resource)

#### Ispravljeno
- **Post-Create naredba**: Sada provjerava instalaciju AZD i Azure CLI pri pokretanju kontejnera

---

### [v3.11.0] - 2026-02-05

#### Preuređenje README prilagođenog početnicima
**Ova verzija značajno poboljšava README.md kako bi bila pristupačnija početnicima i dodaje ključne resurse za AI developere.**

#### Dodano
- **🆚 Usporedba Azure CLI vs AZD**: Jasno objašnjenje kada koristiti koji alat s praktičnim primjerima
- **🌟 Sjajne AZD poveznice**: Izravni linkovi na galeriju predložaka zajednice i resurse za doprinos:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ predložaka spremnih za implementaciju
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Doprinos zajednice
- **🎯 Vodič za brz početak**: Pojednostavljeni odjeljak s 3 koraka (Instaliraj → Prijavi se → Implementiraj)
- **📊 Navigacijska tablica prema iskustvu**: Jasne upute gdje započeti na temelju iskustva programera

#### Promijenjeno
- **Struktura README**: Restrukturirana za postupno otkrivanje - ključne informacije prvi
- **Uvodni odjeljak**: Prepisano za objašnjenje "Čarolije `azd up`" za potpune početnike
- **Uklonjeni duplicirani sadržaji**: Izbačen duplicirani odjeljak za rješavanje problema
- **Naredbe za rješavanje problema**: Ispravak reference na `azd logs` s valjanim `azd monitor --logs`

#### Ispravljeno
- **🔐 Naredbe za autentifikaciju**: Dodani `azd auth login` i `azd auth logout` u cheat-sheet.md
- **Nevaljane naredbe uklonjene**: Izbačen preostali `azd logs` iz README odjeljka za rješavanje problema

#### Napomene
- **Opseg**: Izmjene primijenjene na glavni README.md i resources/cheat-sheet.md
- **Ciljana publika**: Poboljšanja posebno namijenjena programerima novim u AZD-u

---

### [v3.10.0] - 2026-02-05

#### Ažuriranje točnosti naredbi Azure Developer CLI
**Ova verzija ispravlja nepostojeće AZD naredbe u dokumentaciji, osiguravajući da svi primjeri koda koriste valjani Azure Developer CLI sintaksu.**

#### Ispravljeno
- **🔧 Uklonjene nepostojeće AZD naredbe**: Temeljita revizija i ispravak nevaljanih naredbi:
  - `azd logs` (ne postoji) → zamijenjeno s `azd monitor --logs` ili Azure CLI alternativama
  - `azd service` podnaredbe (ne postoje) → zamijenjeno s `azd show` i Azure CLI naredbama
  - `azd infra import/export/validate` (ne postoje) → uklonjeno ili zamijenjeno valjanim alternativama
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` zastavice (ne postoje) → uklonjeno
  - `azd provision --what-if/--rollback` zastavice (ne postoje) → ažurirano na korištenje `--preview`
  - `azd config validate` (ne postoji) → zamijenjeno s `azd config list`
  - `azd info`, `azd history`, `azd metrics` (ne postoje) → uklonjeno

- **📚 Datoteke ažurirane s ispravcima naredbi**:
  - `resources/cheat-sheet.md`: Veliko preuređenje referenci naredbi
  - `docs/deployment/deployment-guide.md`: Ispravljene strategije rollbacka i implementacije
  - `docs/troubleshooting/debugging.md`: Ispravljeni dijelovi za analizu logova
  - `docs/troubleshooting/common-issues.md`: Ažurirane naredbe za rješavanje problema
  - `docs/troubleshooting/ai-troubleshooting.md`: Popravljen AZD debugging odjeljak
  - `docs/getting-started/azd-basics.md`: Ispravljene naredbe nadzora
  - `docs/getting-started/first-project.md`: Ažurirani primjeri nadzora i debugiranja
  - `docs/getting-started/installation.md`: Ispravljeni primjeri pomoći i verzije
  - `docs/pre-deployment/application-insights.md`: Ispravci za prikaz logova
  - `docs/pre-deployment/coordination-patterns.md`: Ispravljeni agent debugging naredbe

- **📝 Ažuriranje referenci verzije**:
  - `docs/getting-started/installation.md`: Zamjena hardkodirane verzije `1.5.0` generičkim `1.x.x` s linkom na izdanja

#### Promijenjeno
- **Strategije rollbacka**: Ažurirano dokumentiranje korištenjem rollbacka temeljenog na Gitu (AZD nema ugrađeni rollback)
- **Prikaz logova**: Zamjena referenci `azd logs` s `azd monitor --logs`, `azd monitor --live` i Azure CLI naredbama
- **Dio o izvedbi**: Uklonjene nepostojeće zastavice za paralelnu/incremental implementaciju, ponuđene valjane alternative

#### Tehnički detalji
- **Valjane AZD naredbe**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Valjane azd monitor zastavice**: `--live`, `--logs`, `--overview`
- **Uklonjene značajke**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Napomene
- **Verifikacija**: Naredbe potvrđene za Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Završetak radionice i poboljšanje kvalitete dokumentacije
**Ova verzija dovršava interaktivne module radionice, ispravlja sve neispravne poveznice u dokumentaciji i poboljšava ukupnu kvalitetu sadržaja za AI developere koji koriste Microsoft AZD.**

#### Dodano
- **📝 CONTRIBUTING.md**: Novi dokument s pravilima doprinosa s:
  - Jasnim uputama za prijavu problema i prijedloge promjena
  - Standardima dokumentacije za novi sadržaj
  - Smjernicama za primjere koda i konvencijama poruka commit-a
  - Podacima o uključivanju zajednice

#### Dovršeno
- **🎯 Modul radionice 7 (Zaključak)**: Potpuno dovršen modul zaključka s:
  - Sveobuhvatnim sažetkom postignuća radionice
  - Odjeljkom ključnih pojmova o AZD-u, predlošcima i Microsoft Foundry
  - Preporukama za nastavak učenja
  - Vježbama radionice ocijenjenim po težini
  - Povratnim informacijama zajednice i linkovima za podršku

- **📚 Modul radionice 3 (Deconstruct)**: Ažurirani ciljevi učenja s:
  - Uputama za aktiviranje GitHub Copilot s MCP serverima
  - Razumijevanjem strukture mapa AZD predložaka
  - Obrasci organizacije infrastrukture kao koda (Bicep)
  - Uputama za praktične zadatke

- **🔧 Modul radionice 6 (Teardown)**: Dovršen s:
  - Ciljevima čišćenja resursa i upravljanja troškovima
  - Upotrebom `azd down` za sigurno uklanjanje infrastrukture
  - Uputama za oporavak soft-obrisanih kognitivnih usluga
  - Bonus istraživačkim zadacima za GitHub Copilot i Azure Portal

#### Ispravljeno
- **🔗 Popravci neispravnih poveznica**: Riješeno 15+ neispravnih unutarnjih poveznica:
  - `docs/ai-foundry/ai-model-deployment.md`: Ispravljeni putovi do microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Ispravljeni putovi do ai-model-deployment.md i production-ai-practices.md
  - `docs/getting-started/first-project.md`: Zamijenjen nepostojeći cicd-integration.md sa deployment-guide.md
  - `examples/retail-scenario.md`: Ispravljeni putovi do FAQ i vodiča za rješavanje problema
  - `examples/container-app/microservices/README.md`: Ispravljeni putovi do kursa i vodiča za implementaciju
  - `resources/faq.md` i `resources/glossary.md`: Ažurirane reference na AI poglavlja
  - `course-outline.md`: Ispravljene reference na vodič instruktora i AI radionicu

- **📅 Statusni banner radionice**: Ažuriran s "U izradi" na aktivan status radionice s datumom veljače 2026.

- **🔗 Navigacija radionice**: Ispravljene neispravne navigacijske poveznice u README.md radionice koje su upućivale na nepostojeću mapu lab-1-azd-basics

#### Promijenjeno
- **Prezentacija radionice**: Uklonjena upozorenja "u izradi", radionica je sada potpuna i spremna za korištenje
- **Konzistentnost navigacije**: Osigurana ispravna međumodularna navigacija
- **Reference u putanjama učenja**: Ažurirane međupoveznice na točne microsoft-foundry putove

#### Validirano
- ✅ Sve engleske markdown datoteke sadrže valjane unutarnje poveznice
- ✅ Radionica moduli 0-7 kompletni s ciljevima učenja
- ✅ Navigacija između poglavlja i modula funkcionira ispravno
- ✅ Sadržaj je prikladan za AI developere koji koriste Microsoft AZD
- ✅ Korišten je pristupačan jezik i struktura za početnike
- ✅ CONTRIBUTING.md pruža jasne upute za doprinositelje

#### Tehnička implementacija
- **Validacija poveznica**: Automatizirani PowerShell skript provjerio sve .md unutarnje poveznice
- **Revizija sadržaja**: Ručni pregled kompletiranja radionice i prilagođenosti početnicima
- **Sustav navigacije**: Dosljedni obrasci navigacije između poglavlja i modula

#### Napomene
- **Opseg**: Izmjene primijenjene samo na englesku dokumentaciju
- **Prijevodi**: Mape prijevoda nisu ažurirane u ovoj verziji (automatski prijevod će se sinkronizirati kasnije)
- **Trajanje radionice**: Kompletna radionica pruža 3-4 sata praktične nastave

---

### [v3.8.0] - 2025-11-19

#### Napredna dokumentacija: Nadzor, sigurnost i obrasci višestrukih agenata
**Ova verzija dodaje sveobuhvatne A razine lekcije o integraciji Application Insights, obrascima autentifikacije i koordinaciji višestrukih agenata za produkcijske implementacije.**

#### Dodano
- **📊 Lekcija integracije Application Insights**: u `docs/pre-deployment/application-insights.md`:
  - AZD fokusirana implementacija s automatskim provisioniranjem
  - Potpuni Bicep predlošci za Application Insights + Log Analytics
  - Radne Python aplikacije s prilagođenom telemetrijom (1.200+ linija)
  - Obrasci praćenja AI/LLM-a (praćenje tokena/troškova Microsoft Foundry modela)
  - 6 Mermaid dijagrama (arhitektura, distribuirano praćenje, protok telemetrije)
  - 3 praktične vježbe (alerti, nadzorne ploče, AI monitoring)
  - Primjeri Kusto upita i strategije optimizacije troškova
  - Streaming metrika uživo i debugiranje u stvarnom vremenu
  - Vrijeme učenja 40-50 minuta s obrascima spremnim za produkciju

- **🔐 Lekcija o obrascima autentifikacije i sigurnosti**: u `docs/getting-started/authsecurity.md`:
  - 3 obrasca autentifikacije (stringovi veze, Key Vault, upravljani identitet)
  - Potpuni Bicep predlošci infrastrukture za sigurne implementacije
  - Kod aplikacije u Node.js s Azure SDK integracijom
  - 3 cjelovite vježbe (omogućavanje upravljanog identiteta, identiteta dodijeljenog korisniku, rotacija Key Vaulta)
  - Najbolje sigurnosne prakse i RBAC konfiguracije
  - Vodič za rješavanje problema i analiza troškova
  - Obrasci autentifikacije bez lozinke spremni za produkciju

- **🤖 Lekcija o obrascima koordinacije višestrukih agenata**: u `docs/pre-deployment/coordination-patterns.md`:
  - 5 obrazaca koordinacije (sekvencijalni, paralelni, hijerarhijski, pokretan događajima, konsenzus)
  - Potpuna implementacija servisnog orkestratora (Python/Flask, 1.500+ linija)
  - 3 specijalizirane implementacije agenata (Istraživač, Pisac, Urednik)
  - Integracija Service Bus za redove poruka
  - Upravljanje stanjem u Cosmos DB za distribuirane sustave
  - 6 Mermaid dijagrama koji prikazuju interakcije agenata
  - 3 napredne vježbe (rukovanje timeout-om, logika ponavljanja, circuit breaker)
  - Troškovna analiza (240-565 $/mjesečno) s optimizacijskim strategijama
  - Integracija Application Insights za nadzor

#### Poboljšano
- **Poglavlje prije implementacije**: Sada uključuje sveobuhvatne obrasce nadzora i koordinacije
- **Poglavlje za početak rada**: Poboljšano profesionalnim obrascima autentifikacije
- **Spremnost za produkciju**: Cjelovito pokrivanje od sigurnosti do promatranja sustava
- **Plan tečaja**: Ažurirano s uputama na nove lekcije u poglavljima 3 i 6

#### Promijenjeno
- **Napredak u učenju**: Bolja integracija sigurnosti i nadzora kroz cijeli tečaj
- **Kvaliteta dokumentacije**: Dosljedni A razini standardi (95-97%) kroz nove lekcije
- **Produkcijski obrasci**: Potpuno pokrivanje kraja do kraja za enterprise implementacije

#### Poboljšano
- **Iskustvo programera**: Jasan put od razvoja do praćenja u produkciji
- **Sigurnosni standardi**: Profesionalni obrasci za autentifikaciju i upravljanje tajnama
- **Observabilnost**: Potpuna integracija Application Insights s AZD-om
- **AI radna opterećenja**: Specijalizirano praćenje za Microsoft Foundry modele i višestruke agente

#### Validirano
- ✅ Sve lekcije uključuju kompletan radni kod (ne samo isječke)
- ✅ Mermaid dijagrami za vizualno učenje (ukupno 19 kroz 3 lekcije)
- ✅ Praktične vježbe s koracima provjere (ukupno 9)
- ✅ Šablone Bicep spremne za produkciju za implementaciju putem `azd up`
- ✅ Analiza troškova i strategije optimizacije
- ✅ Vodiči za rješavanje problema i najbolje prakse
- ✅ Provjere znanja s komandama za verifikaciju

#### Rezultati ocjene dokumentacije
- **docs/pre-deployment/application-insights.md**: - Sveobuhvatni vodič za praćenje
- **docs/getting-started/authsecurity.md**: - Profesionalni sigurnosni obrasci
- **docs/pre-deployment/coordination-patterns.md**: - Napredne višestruke agentne arhitekture
- **Sveukupni novi sadržaj**: - Konzistentni standardi visoke kvalitete

#### Tehnička implementacija
- **Application Insights**: Log Analytics + prilagođena telemetrija + distribuirano praćenje
- **Autentifikacija**: Managed Identity + Key Vault + RBAC obrasci
- **Višestruki agenti**: Service Bus + Cosmos DB + Container Apps + orkestracija
- **Praćenje**: Metrike u stvarnom vremenu + Kusto upiti + upozorenja + nadzorne ploče
- **Upravljanje troškovima**: Strategije probira, politike zadržavanja, kontrola budžeta

### [v3.7.0] - 2025-11-19

#### Poboljšanja kvalitete dokumentacije i novi primjer Microsoft Foundry modela
**Ova verzija poboljšava kvalitetu dokumentacije u cijelom spremištu i dodaje kompletan primjer implementacije Microsoft Foundry modela s chat sučeljem gpt-4.1.**

#### Dodano
- **🤖 Primjer chata Microsoft Foundry modela**: Potpuna implementacija gpt-4.1 s radnim primjercima u `examples/azure-openai-chat/`:
  - Potpuna infrastruktura Microsoft Foundry modela (implementacija gpt-4.1 modela)
  - Python CLI chat sučelje s poviješću razgovora
  - Integracija Key Vault-a za sigurno pohranjivanje API ključeva
  - Praćenje korištenja tokena i procjena troškova
  - Ograničavanje brzine i upravljanje greškama
  - Sveobuhvatan README s vodičem za implementaciju od 35-45 minuta
  - 11 datoteka spremnih za produkciju (Bicep šablone, Python aplikacija, konfiguracija)
- **📚 Vježbe dokumentacije**: Dodane praktične vježbe u vodič za konfiguraciju:
  - Vježba 1: Konfiguracija za više okruženja (15 minuta)
  - Vježba 2: Praksa upravljanja tajnama (10 minuta)
  - Jasna uspješna kriterija i koraci provjere
- **✅ Verifikacija implementacije**: Dodan odjeljak za provjeru u vodič za implementaciju:
  - Procedure provjere zdravlja sustava
  - Lista uspješnih kriterija
  - Očekivani izlazi za sve naredbe implementacije
  - Brzi vodič za rješavanje problema

#### Poboljšano
- **examples/README.md**: A-klasa kvalitete (93%):
  - Dodan azure-openai-chat u sve relevantne odjeljke
  - Broj lokalnih primjera ažuriran s 3 na 4
  - Dodano u tablicu primjera AI aplikacija
  - Integrirano u Brzi početak za srednje korisnike
  - Dodano u odjeljak Microsoft Foundry šablone
  - Ažurirane matrice usporedbe i odjeljci tehnologije
- **Kvaliteta dokumentacije**: Poboljšano B+ (87%) → A- (92%) u mapi docs:
  - Dodani očekivani izlazi za ključne primjere naredbi
  - Uključeni koraci verifikacije za promjene konfiguracije
  - Poboljšano praktično učenje s vježbama

#### Promijenjeno
- **Napredak u učenju**: Bolja integracija AI primjera za srednje korisnike
- **Struktura dokumentacije**: Više akcijskih vježbi s jasnim rezultatima
- **Proces verifikacije**: Dodani eksplicitni kriteriji uspjeha za ključne tijekove rada

#### Poboljšano
- **Iskustvo programera**: Implementacija Microsoft Foundry modela sada traje 35-45 minuta (naspram 60-90 za složene alternative)
- **Transparentnost troškova**: Jasne procjene troškova ($50-200/mjesečno) za primjer Microsoft Foundry modela
- **Put učenja**: AI programeri imaju jasan početak s azure-openai-chat
- **Standardi dokumentacije**: Konzistentni očekivani izlazi i koraci verifikacije

#### Validirano
- ✅ Microsoft Foundry primjer potpuno funkcionalan s `azd up`
- ✅ Sve 11 datoteka implementacije sintaktički ispravne
- ✅ Upute u README-u odgovaraju stvarnom iskustvu implementacije
- ✅ Linkovi u dokumentaciji ažurirani na 8+ lokacija
- ✅ Indeks primjera precizno odražava 4 lokalna primjera
- ✅ Nema dupliciranih vanjskih linkova u tablicama
- ✅ Sve navigacijske reference točne

#### Tehnička implementacija
- **Arhitektura Microsoft Foundry modela**: gpt-4.1 + Key Vault + Container Apps obrazac
- **Sigurnost**: Managed Identity spreman, tajne u Key Vault-u
- **Praćenje**: Integracija Application Insights
- **Upravljanje troškovima**: Praćenje tokena i optimizacija korištenja
- **Implementacija**: Jedna naredba `azd up` za kompletnu postavu

### [v3.6.0] - 2025-11-19

#### Velika nadogradnja: Primjeri implementacije Container App aplikacija
**Ova verzija donosi sveobuhvatne, produkcijski spremne primjere implementacije kontejneriziranih aplikacija koristeći Azure Developer CLI (AZD), s potpunom dokumentacijom i integracijom u put učenja.**

#### Dodano
- **🚀 Primjeri Container App aplikacija**: Novi lokalni primjeri u `examples/container-app/`:
  - [Glavni vodič](examples/container-app/README.md): Potpuni pregled kontejneriziranih implementacija, brzi start, produkcija i napredni obrasci
  - [Jednostavan Flask API](../../examples/container-app/simple-flask-api): REST API jednostavan za početnike s mogućnošću skaliranja na nula, provjera stanja, praćenje i rješavanje problema
  - [Mikrouslužna arhitektura](../../examples/container-app/microservices): Produkcijski spremna implementacija višestrukih usluga (API Gateway, Product, Order, User, Notification), asinhrone poruke, Service Bus, Cosmos DB, Azure SQL, distribuirano praćenje, blue-green/canary implementacija
- **Najbolje prakse**: Sigurnost, praćenje, optimizacija troškova i upute za CI/CD za kontejnerizirane radne procese
- **Primjeri koda**: Complete `azure.yaml`, Bicep šablone i implementacije usluga u više jezika (Python, Node.js, C#, Go)
- **Testiranje i rješavanje problema**: Scenariji end-to-end testiranja, naredbe za praćenje, vodiči za rješavanje problema

#### Promijenjeno
- **README.md**: Ažuriran za isticanje i povezivanje novih primjera container app aplikacija pod "Lokalni primjeri - Container aplikacije"
- **examples/README.md**: Ažuriran za naglašavanje primjera container app aplikacija, dodavanje unosa u matricu usporedbe i ažuriranje referenci na tehnologiju/arhitekturu
- **Plan i vodič za učenje**: Ažuriran za referenciranje novih primjera container app aplikacija i obrazaca implementacije u relevantnim poglavljima

#### Validirano
- ✅ Svi novi primjeri mogu se implementirati pomoću `azd up` i slijede najbolje prakse
- ✅ Unakrsne poveznice u dokumentaciji i navigacija ažurirane
- ✅ Primjeri pokrivaju scenarije od početničkih do naprednih, uključujući produkcijski mikrouslužni model

#### Napomene
- **Opseg**: Samo engleska dokumentacija i primjeri
- **Sljedeći koraci**: Proširenje dodatnim naprednim obrascima za kontejnere i CI/CD automatizacijom u budućim izdanjima

### [v3.5.0] - 2025-11-19

#### Rebrendiranje proizvoda: Microsoft Foundry
**Ova verzija implementira sveobuhvatnu promjenu naziva proizvoda iz "Microsoft Foundry" u "Microsoft Foundry" u cijeloj engleskoj dokumentaciji, odražavajući službenu Microsoftovu odluku o rebrandingu.**

#### Promijenjeno
- **🔄 Ažuriranje naziva proizvoda**: Potpuno rebrendiranje iz "Microsoft Foundry" u "Microsoft Foundry"
  - Ažurirane sve reference unutar engleske dokumentacije u mapi `docs/`
  - Preimenovana mapa: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Preimenovana datoteka: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Ukupno: 23 reference na sadržaj ažurirane u 7 dokumentacijskih datoteka

- **📁 Promjene strukture mapa**:
  - `docs/ai-foundry/` preimenovano u `docs/microsoft-foundry/`
  - Sve unakrsne reference ažurirane da odražavaju novu strukturu mapa
  - Navigacijski linkovi provjereni u cijeloj dokumentaciji

- **📄 Preimenovanja datoteka**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Sve interne veze ažurirane da referenciraju novi naziv datoteke

#### Ažurirane datoteke
- **Dokumentacija poglavlja** (7 datoteka):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 ažuriranja navigacijskih linkova
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 reference naziva proizvoda ažurirane
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Već koristi Microsoft Foundry (iz prethodnih ažuriranja)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 ažuriranja referenci (pregled, povratne informacije zajednice, dokumentacija)
  - `docs/getting-started/azd-basics.md` - 4 ažuriranja unakrsnih referenci
  - `docs/getting-started/first-project.md` - 2 ažuriranja navigacijskih linkova
  - `docs/getting-started/installation.md` - 2 ažuriranja na linkove za sljedeće poglavlje
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 ažuriranja referenci (navigacija, Discord zajednica)
  - `docs/troubleshooting/common-issues.md` - 1 ažuriranje navigacijskog linka
  - `docs/troubleshooting/debugging.md` - 1 ažuriranje navigacijskog linka

- **Datoteke strukture tečaja** (2 datoteke):
  - `README.md` - 17 ažuriranja referenci (pregled tečaja, naslovi poglavlja, odjeljak šablona, zajednički uvidi)
  - `course-outline.md` - 14 ažuriranja referenci (pregled, ciljevi učenja, resursi po poglavljima)

#### Validirano
- ✅ Nema preostalih putanja do mape "ai-foundry" u engleskoj dokumentaciji
- ✅ Nema preostalih referenci na naziv proizvoda "Microsoft Foundry" u engleskoj dokumentaciji
- ✅ Svi navigacijski linkovi funkcionalni s novom strukturom mapa
- ✅ Preimenovanja datoteka i mapa uspješno dovršena
- ✅ Unakrsne reference između poglavlja provjerene

#### Napomene
- **Opseg**: Promjene primijenjene samo na englesku dokumentaciju u mapi `docs/`
- **Prijevodi**: Mape prijevoda (`translations/`) nisu ažurirane u ovoj verziji
- **Radionica**: Materijali za radionicu (`workshop/`) nisu ažurirani u ovoj verziji
- **Primjeri**: Primjerni fajlovi još mogu sadržavati nasljedne nazive (bit će riješeno u budućem ažuriranju)
- **Vanjski linkovi**: Vanjski URL-ovi i GitHub repozitorijske reference ostaju nepromijenjene

#### Vodič za migraciju za suradnike
Ako imate lokalne grane ili dokumentaciju koja upućuje na staru strukturu:
1. Ažurirajte reference mapa: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Ažurirajte reference datoteka: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Zamijenite naziv proizvoda: "Microsoft Foundry" → "Microsoft Foundry"
4. Provjerite da svi unutarnji dokumentacijski linkovi i dalje rade

---

### [v3.4.0] - 2025-10-24

#### Pregled infrastrukture i poboljšanja validacije
**Ova verzija uvodi sveobuhvatnu podršku za novu preview značajku Azure Developer CLI-ja i poboljšava korisničko iskustvo radionice.**

#### Dodano
- **🧪 Dokumentacija značajke azd provision --preview**: Sveobuhvatno pokrivanje nove mogućnosti pregleda infrastrukture
  - Referenca naredbi i primjeri korištenja u cheat sheetu
  - Detaljna integracija u vodič za provisioning s upotrebama i prednostima
  - Integracija pred-pokretne provjere za sigurniju validaciju implementacije
  - Ažuriranja vodiča za početak rada sa sigurnosnim praksama implementacije
- **🚧 Banner statusa radionice**: Profesionalni HTML banner koji označava status razvoja radionice
  - Dizajn s gradijentom i indikatorima izgradnje za jasnu komunikaciju korisniku
  - Vrijeme zadnjeg ažuriranja radi transparentnosti
  - Mobilno prilagodljiv dizajn za sve uređaje

#### Poboljšano
- **Sigurnost infrastrukture**: Funkcionalnost pretpregleda integrirana u cjelokupnu dokumentaciju za implementaciju
- **Validacija prije implementacije**: Automatski skripti sada uključuju testiranje pregleda infrastrukture
- **Radni tijek programera**: Naredbeni nizovi ažurirani da uključuju preview kao najbolju praksu
- **Iskustvo radionice**: Jasne postavke očekivanja korisnika o statusu razvoja sadržaja

#### Promijenjeno
- **Najbolje prakse implementacije**: Radni tijek s fokusom na pregled prvi preporučeni pristup
- **Tok dokumentacije**: Validacija infrastrukture premještena ranije u proces učenja
- **Prezentacija radionice**: Profesionalna komunikacija statusa s jasnim vremenskim okvirom razvoja

#### Poboljšano
- **Pristup s fokusom na sigurnost**: Promjene infrastrukture sada se mogu validirati prije implementacije
- **Suradnja tima**: Rezultati preview pregleda mogu se dijeliti za pregled i odobrenje
- **Svijest o troškovima**: Bolje razumijevanje troškova resursa prije provisioninga
- **Smanjenje rizika**: Smanjeni neuspjesi implementacije kroz unaprijedenu validaciju

#### Tehnička implementacija
- **Integracija u više dokumenata**: Funkcionalnost pregleda dokumentirana u 4 ključne datoteke
- **Obrasci naredbi**: Dosljedna sintaksa i primjeri kroz dokumentaciju
- **Integracija najbolje prakse**: Preview uključen u validacijske tijekove rada i skripte
- **Vizualni indikatori**: Jasna obilježja NOVE značajke radi lakšeg pronalaženja

#### Infrastruktura radionice
- **Komunikacija statusa**: Profesionalni HTML banner s gradijentnim stilom
- **Korisničko iskustvo**: Jasno prikazan status razvoja sprječava zabunu
- **Profesionalna prezentacija**: Održava vjerodostojnost spremišta uz postavljanje očekivanja
- **Transparentnost vremenskog okvira**: Označeno datumom posljednjeg ažuriranja u listopadu 2025.

### [v3.3.0] - 2025-09-24

#### Poboljšani materijali radionice i interaktivno iskustvo učenja
**Ova verzija uvodi sveobuhvatne materijale radionice s interaktivnim vodičima u pregledniku i strukturiranim putovima učenja.**

#### Dodano
- **🎥 Interaktivni vodič radionice**: Radionica u pregledniku s mogućnošću pregleda MkDocs-a  
- **📝 Strukturirane upute radionice**: Sedmostupanjski vođeni put učenja od otkrivanja do prilagodbe  
  - 0-Uvod: Pregled radionice i postavljanje  
  - 1-Odabir-AI-Šablone: Proces otkrivanja i odabira šablone  
  - 2-Validacija-AI-Šablone: Postupci implementacije i validacije  
  - 3-Razgradnja-AI-Šablone: Razumijevanje arhitekture šablone  
  - 4-Konfiguracija-AI-Šablone: Konfiguracija i prilagodba  
  - 5-Prilagodba-AI-Šablone: Napredne modifikacije i iteracije  
  - 6-Rastavljanje-Infrastrukture: Čišćenje i upravljanje resursima  
  - 7-Zaključenje: Sažetak i sljedeći koraci  
- **🛠️ Alati za radionicu**: Konfiguracija MkDocs-a s temom Material za unaprijeđeno iskustvo učenja  
- **🎯 Praktični put učenja**: Trostupanjska metodologija (Otkrivanje → Implementacija → Prilagodba)  
- **📱 Integracija GitHub Codespaces**: Bešavni razvojni okoliš

#### Poboljšano  
- **AI Laboratorij radionice**: Proširen s cjelovitim strukturiranim iskustvom učenja od 2-3 sata  
- **Dokumentacija radionice**: Profesionalna prezentacija s navigacijom i vizualnim pomagalima  
- **Napredak u učenju**: Jasno vođenje korak-po-korak od odabira šablone do produkcijske implementacije  
- **Iskustvo programera**: Integrirani alati za pojednostavljene razvojne tokove

#### Unaprijeđeno  
- **Pristupačnost**: Sučelje u pregledniku s pretragom, funkcijom kopiranja i preklopom teme  
- **Učenje vlastitim tempom**: Fleksibilna struktura radionice koja odgovara različitim brzinama učenja  
- **Praktična primjena**: Scenariji implementacije AI šablona iz stvarnog svijeta  
- **Integracija zajednice**: Discord integracija za podršku i suradnju u radionici

#### Značajke radionice  
- **Ugrađena pretraga**: Brzo pronalaženje ključnih riječi i lekcija  
- **Kopiranje blokova koda**: Funkcija kopiranja kodova pri prelasku miša za sve primjere koda  
- **Preklop teme**: Podrška za tamni/svijetli način rada prema preference korisnika  
- **Vizualni materijali**: Snimke zaslona i dijagrami za bolje razumijevanje  
- **Integracija pomoći**: Izravan pristup Discord zajednici za podršku

### [v3.2.0] - 2025-09-17

#### Velika reorganizacija navigacije i sustav učenja temeljeno na poglavljima  
**Ova verzija uvodi opsežnu strukturu učenja po poglavljima s unaprijeđenom navigacijom kroz cijeli repozitorij.**

#### Dodano  
- **📚 Sustav učenja temeljeni na poglavljima**: Prestrukturiran cijeli tečaj u 8 progresivnih poglavlja  
  - Poglavlje 1: Osnove i Brzi početak (⭐ - 30-45 minuta)  
  - Poglavlje 2: AI-prvi razvoj (⭐⭐ - 1-2 sata)  
  - Poglavlje 3: Konfiguracija i Autentikacija (⭐⭐ - 45-60 minuta)  
  - Poglavlje 4: Infrastruktura kao kod i implementacija (⭐⭐⭐ - 1-1,5 sati)  
  - Poglavlje 5: Višelagenska AI rješenja (⭐⭐⭐⭐ - 2-3 sata)  
  - Poglavlje 6: Validacija i planiranje prije implementacije (⭐⭐ - 1 sat)  
  - Poglavlje 7: Otklanjanje problema i ispravljanje pogrešaka (⭐⭐ - 1-1,5 sati)  
  - Poglavlje 8: Produkcijski i enterprise obrasci (⭐⭐⭐⭐ - 2-3 sata)  
- **📚 Sveobuhvatan sustav navigacije**: Dosljedni navigacijski zaglavlja i podnožja u svakoj dokumentaciji  
- **🎯 Praćenje napretka**: Kontrolni popis za završetak tečaja i sustav provjere znanja  
- **🗺️ Vodič kroz put učenja**: Jasne ulazne točke za različite razine iskustva i ciljeve  
- **🔗 Navigacija unakrsnim povezivanjem**: Povezana poglavlja i preduvjeti jasno povezani

#### Poboljšano  
- **Struktura README-a**: Pretvorena u strukturiranu platformu za učenje s organizacijom po poglavljima  
- **Navigacija dokumentacijom**: Svaka stranica sada uključuje kontekst poglavlja i vodič za napredak  
- **Organizacija šablona**: Primjeri i šablone povezani s odgovarajućim poglavljima za učenje  
- **Integracija resursa**: "Cheat sheet" materijali, često postavljana pitanja i vodiči povezani s relevantnim poglavljima  
- **Integracija radionice**: Praktične laboratorijske vježbe povezane s više ciljeva učenja po poglavljima

#### Promijenjeno  
- **Napredak u učenju**: Prelazak s linearne dokumentacije na fleksibilno učenje temeljeno na poglavljima  
- **Pozicioniranje konfiguracije**: Vodič za konfiguraciju pomaknut u Poglavlje 3 radi boljeg toka učenja  
- **Integracija AI sadržaja**: Bolja integracija sadržaja specifičnog za AI kroz cijeli proces učenja  
- **Produkcijski sadržaj**: Napredni obrasci konsolidirani u Poglavlje 8 za enterprise korisnike

#### Unaprijeđeno  
- **Korisničko iskustvo**: Jasni navigacijski tragovi i indikatori napretka po poglavljima  
- **Pristupačnost**: Dosljedni navigacijski obrasci za lakše kretanje kroz tečaj  
- **Profesionalna prezentacija**: Sveučilišni stil strukture tečaja prikladan za akademsku i korporativnu obuku  
- **Učinkovitost učenja**: Smanjeno vrijeme pronalaska relevantnog sadržaja kroz poboljšanu organizaciju

#### Tehnička implementacija  
- **Navigacijska zaglavlja**: Standardizirana navigacija po poglavljima u više od 40 dokumentacijskih datoteka  
- **Podnožje navigacije**: Dosljedno vođenje kroz poglavlja i indikatori završetka  
- **Unutarnje povezivanje**: Sveobuhvatan sustav međupovezivanja povezanih pojmova  
- **Mapiranje poglavlja**: Šablone i primjeri jasno povezani s ciljevima učenja

#### Poboljšanje vodiča za učenje  
- **📚 Sveobuhvatni ciljevi učenja**: Prestrukturirani vodič za učenje usklađen s 8-poglavnom strukturom  
- **🎯 Procjena po poglavljima**: Svako poglavlje uključuje specifične ciljeve učenja i praktične vježbe  
- **📋 Praćenje napretka**: Tjedni raspored učenja s mjerljivim rezultatima i kontrolnim popisima  
- **❓ Pitanja za procjenu**: Provjere znanja za svako poglavlje s profesionalnim ishodima  
- **🛠️ Praktične vježbe**: Rukama na terenu s realnim scenarijima implementacije i otklanjanja problema  
- **📊 Napredovanje vještina**: Jasno napredovanje od osnovnih koncepata do enterprise obrazaca s fokusom na karijerni razvoj  
- **🎓 Okvir za certifikaciju**: Ishodi profesionalnog razvoja i sustav priznanja u zajednici  
- **⏱️ Upravljanje vremenskim okvirom**: Strukturirani plan učenja od 10 tjedana s validacijom prekretnica

### [v3.1.0] - 2025-09-17

#### Poboljšana višelagenska AI rješenja  
**Ova verzija poboljšava višelagensko maloprodajno rješenje boljim imenovanjem agenata i poboljšanom dokumentacijom.**

#### Promijenjeno  
- **Terminologija višelagenskih agentata**: "Cora agent" zamijenjen s "Kupac agent" kroz cijelo maloprodajno višelagensko rješenje radi boljeg razumijevanja  
- **Arhitektura agenata**: Ažurirana sva dokumentacija, ARM šablone i primjeri koda s dosljednim nazivom "Kupac agent"  
- **Primjeri konfiguracije**: Modernizirani obrasci konfiguracije agenata s ažuriranim nazivima  
- **Dosljednost u dokumentaciji**: Osigurano da svi upućuju na profesionalne i opisne nazive agenata

#### Poboljšano  
- **Pakiranje ARM šablona**: Ažuriran retail-multiagent-arm-template s referencama na Kupac agenta  
- **Dijagrami arhitekture**: Osvježeni Mermaid dijagrami s novim nazivima agenata  
- **Primjeri koda**: Python klase i implementacijski primjeri sada koriste CustomerAgent imenovanje  
- **Varijable okoliša**: Ažurirani svi skripti za implementaciju s CUSTOMER_AGENT_NAME konvencijama

#### Unaprijeđeno  
- **Iskustvo programera**: Jasnije uloge i odgovornosti agenata u dokumentaciji  
- **Spremnost za produkciju**: Bolja usklađenost s korporativnim standardima imenovanja  
- **Materijali za učenje**: Intuitivnije imenovanje agenata za obrazovne svrhe  
- **Upotrebljivost šablona**: Jednostavnije razumijevanje funkcija agenata i obrazaca implementacije

#### Tehnički detalji  
- Ažurirani Mermaid dijagrami s referencama na CustomerAgent  
- Zamijenjeni nazivi klasa CoraAgent s CustomerAgent u Python primjerima  
- Modificirane ARM JSON konfiguracije za "customer" tip agenta  
- Ažurirane varijable okoliša s CORA_AGENT_* na CUSTOMER_AGENT_*  
- Osvježene sve naredbe za implementaciju i konfiguracije kontejnera

### [v3.0.0] - 2025-09-12

#### Velike promjene - Fokus na AI programere i integracija Microsoft Foundryja  
**Ova verzija transformira repozitorij u sveobuhvatan resurs za učenje usmjeren na AI uz integraciju Microsoft Foundryja.**

#### Dodano  
- **🤖 AI-prvi put učenja**: Potpuna restrukturacija s prioritetom za AI programere i inženjere  
- **Vodič za integraciju Microsoft Foundryja**: Opsežna dokumentacija za povezivanje AZD-a sa servisima Microsoft Foundryja  
- **Obrasci implementacije AI modela**: Detaljni vodič koji pokriva odabir modela, konfiguraciju i strategije produkcijske primjene  
- **AI laboratorij radionice**: 2-3 satna praktična radionica za konverziju AI aplikacija u rješenja deployabilna s AZD-om  
- **Najbolje prakse za AI u produkciji**: Enterprise obrasci za skaliranje, nadzor i sigurnost AI radnih opterećenja  
- **Vodič za AI otklanjanje problema**: Opsežan vodič za rješavanje problema Microsoft Foundry modela, kognitivnih servisa i AI implementacija  
- **Galerija AI šablona**: Istaknuta zbirka Microsoft Foundry šablona s ocjenama složenosti  
- **Materijali za radionicu**: Cjelovita struktura radionice s praktičnim radionicama i referentnim materijalima

#### Poboljšano  
- **Struktura README-a**: Fokus na AI programere s podacima o zajednici od 45% interesa s Microsoft Foundry Discorda  
- **Putovi učenja**: Posvećeni AI developerski put pored tradicionalnih putova za studente i DevOps inženjere  
- **Preporuke šablona**: Istaknuti AI šabloni kao azure-search-openai-demo, contoso-chat i openai-chat-app-quickstart  
- **Integracija zajednice**: Poboljšana Discord podrška s AI-specifičnim kanalima i raspravama

#### Sigurnost i produkcijski fokus  
- **Obrasci upravljanih identiteta**: AI-specifične konfiguracije autentikacije i sigurnosti  
- **Optimizacija troškova**: Praćenje tokena i kontrola budžeta za AI radna opterećenja  
- **Višeregijska implementacija**: Strategije za globalnu implementaciju AI aplikacija  
- **Praćenje performansi**: AI-specifični metrički podaci i integracija Application Insights

#### Kvaliteta dokumentacije  
- **Linearni tijek tečaja**: Logičan napredak od početničkih do naprednih AI obrazaca implementacije  
- **Validirani URL-ovi**: Svi vanjski linkovi verified i dostupni  
- **Potpuna referenca**: Svi unutarnji linkovi dokumentacije potvrđeni i funkcionalni  
- **Spremnost za produkciju**: Enterprise obrasci za implementaciju s primjerima iz stvarnog svijeta

### [v2.0.0] - 2025-09-09

#### Velike promjene - restrukturiranje repozitorija i profesionalno unapređenje  
**Ova verzija predstavlja značajnu izmjenu strukture repozitorija i prezentacije sadržaja.**

#### Dodano  
- **Strukturirani okvir za učenje**: Sve dokumentacijske stranice sada uključuju uvod, ciljeve učenja i ishode učenja  
- **Sustav navigacije**: Dodane poveznice na prethodne/sljedeće lekcije kroz cijelu dokumentaciju za vođeni tijek učenja  
- **Vodič za proučavanje**: Cjelovit study-guide.md s ciljevima učenja, praktičnim vježbama i materijalima za procjenu  
- **Profesionalna prezentacija**: Uklonjene sve ikone emojija radi bolje pristupačnosti i profesionalnijeg izgleda  
- **Poboljšana struktura sadržaja**: Organizacija i tok materijala za učenje unaprijeđeni

#### Promijenjeno  
- **Format dokumentacije**: Standardizirana sva dokumentacija s dosljednom strukturom fokusiranom na učenje  
- **Tijek navigacije**: Implementiran logičan tijek kroz sve materijale za učenje  
- **Prezentacija sadržaja**: Uklonjeni ukrasni elementi u korist jasnog, profesionalnog formatiranja  
- **Struktura linkova**: Ažurirani svi unutarnji linkovi za podršku novom sustavu navigacije

#### Unaprijeđeno  
- **Pristupačnost**: Uklonjena ovisnost o emotikonima za bolju kompatibilnost sa čitačima zaslona  
- **Profesionalni izgled**: Čist, akademski stil prezentacije prikladan za enterprise učenje  
- **Iskustvo učenja**: Strukturirani pristup s jasnim ciljevima i ishodima za svaku lekciju  
- **Organizacija sadržaja**: Bolji logički tok i povezanost povezanih tema

### [v1.0.0] - 2025-09-09

#### Početno izdanje - Cjelovit AZD repozitorij za učenje

#### Dodano  
- **Osnovna dokumentacijska struktura**  
  - Kompletni vodič za početak rada  
  - Sveobuhvatna dokumentacija implementacije i aprovizacije  
  - Detaljni resursi za otklanjanje problema i vodiči za ispravljanje grešaka  
  - Alati i postupci za validaciju prije implementacije

- **Modul za početak rada**  
  - Osnove AZD-a: Temeljni koncepti i terminologija  
  - Vodič za instalaciju: Platform-specifične upute za postavljanje  
  - Vodič za konfiguraciju: Postavljanje okruženja i autentikacija  
  - Prvi projekt: Korak-po-korak praktični vodič

- **Modul implementacije i aprovizacije**  
  - Vodič za implementaciju: Kompletni radni tok dokumentiran  
  - Vodič za aprovizaciju: Infrastruktura kao kod s Bicep-om  
  - Najbolje prakse za produkcijsku implementaciju  
  - Obrasci arhitekture višeslužbenih sustava

- **Modul validacije prije implementacije**  
  - Planiranje kapaciteta: Validacija dostupnosti Azure resursa  
  - Odabir SKU-a: Detaljni vodič za odabir sloja usluge  
  - Provjere prije leta: Automatizirani skripti (PowerShell i Bash)  
  - Alati za procjenu troškova i planiranje budžeta

- **Modul otklanjanja problema**  
  - Uobičajeni problemi: Često prisutni problemi i rješenja  
  - Vodič za ispravljanje grešaka: Sistematske metodologije otklanjanja problema  
  - Napredne dijagnostičke tehnike i alati  
  - Praćenje i optimizacija performansi

- **Resursi i reference**  
  - Kratka lista naredbi: Brzi pregled osnovnih naredbi  
  - Rječnik: Detaljna terminologija i definicije skraćenica  
  - Česta pitanja: Detaljni odgovori na najčešća pitanja  
  - Vanjski izvori i veze u zajednicu

- **Primjeri i šablone**  
  - Primjer jednostavne web aplikacije  
  - Šablona za implementaciju statične web stranice  
  - Konfiguracija kontejnerskih aplikacija  
  - Obrasci integracije baza podataka  
  - Primjeri arhitekture mikroservisa  
  - Implementacije funkcija bez poslužitelja

#### Značajke  
- **Višeplatformska podrška**: Upute za instalaciju i konfiguraciju za Windows, macOS i Linux  
- **Više razina vještina**: Sadržaj dizajniran za studente do profesionalnih programera  
- **Praktični fokus**: Primjeri iz prakse i scenariji iz stvarnog svijeta  
- **Sveobuhvatno pokrivanje**: Od osnovnih koncepata do naprednih enterprise obrazaca  
- **Pristup fokusiran na sigurnost**: Najbolje sigurnosne prakse integrirane kroz sadržaj  
- **Optimizacija troškova**: Upute za ekonomičnu implementaciju i upravljanje resursima

#### Kvaliteta dokumentacije  
- **Detaljni primjeri koda**: Praktični, testirani primjeri koda  
- **Upute korak po korak**: Jasno i izvedivo vođenje  
- **Sveobuhvatno upravljanje greškama**: Otklanjanje uobičajenih problema  
- **Integracija najboljih praksi**: Industrijski standardi i preporuke  
- **Kompatibilnost verzija**: Ažurirano za najnovije Azure servise i azd značajke

## Planirana buduća poboljšanja

### Verzija 3.1.0 (Planirano)  
#### Proširenje AI platforme
- **Podrška za više modela**: Obrasci integracije za Hugging Face, Azure Machine Learning i prilagođene modele  
- **Okviri za AI agente**: Predlošci za LangChain, Semantic Kernel i AutoGen implementacije  
- **Napredni RAG obrasci**: Opcije vektorskih baza podataka izvan Azure AI Search (Pinecone, Weaviate itd.)  
- **AI promatranje**: Poboljšano praćenje performansi modela, korištenja tokena i kvalitete odgovora  

#### Iskustvo programera  
- **VS Code ekstenzija**: Integrirano AZD + Microsoft Foundry razvojno iskustvo  
- **Integracija GitHub Copilot-a**: AI-podržano generiranje AZD predložaka  
- **Interaktivni tutorijali**: Praktične vježbe kodiranja s automatskom validacijom za AI scenarije  
- **Video sadržaj**: Dodatni video tutorijali za vizualne učenike usredotočeni na AI implementacije  

### Verzija 4.0.0 (Planirano)  
#### Korporativni AI obrasci  
- **Okvir upravljanja**: Upravljanje AI modelima, usklađenost i revizijski tragovi  
- **Višekorisnički AI**: Obrasci za posluživanje više korisnika s izoliranim AI servisima  
- **Edge AI implementacija**: Integracija s Azure IoT Edge i kontejnerskim instancama  
- **Hibridni Cloud AI**: Obrasci implementacije u više oblaka i hibridnim okruženjima za AI zadatke  

#### Napredne značajke  
- **Automatizacija AI pipeline-a**: MLOps integracija s Azure Machine Learning pipeline-ima  
- **Napredna sigurnost**: Obrasci nulte povjerenja, privatne krajnje točke i napredna zaštita od prijetnji  
- **Optimizacija performansi**: Napredne strategije podešavanja i skaliranja za AI aplikacije s velikim opterećenjem  
- **Globalna distribucija**: Obrasci za isporuku sadržaja i edge keširanje za AI aplikacije  

### Verzija 3.0.0 (Planirano) - Zamijenjeno trenutnim izdanjem  
#### Predloženi dodaci - Sada implementirani u v3.0.0  
- ✅ **AI-usmjereni sadržaj**: Sveobuhvatna Microsoft Foundry integracija (Završeno)  
- ✅ **Interaktivni tutorijali**: Radionica s praktičnim AI zadacima (Završeno)  
- ✅ **Napredni sigurnosni modul**: AI-specifični sigurnosni obrasci (Završeno)  
- ✅ **Optimizacija performansi**: Strategije podešavanja AI opterećenja (Završeno)  

### Verzija 2.1.0 (Planirano) - Djelomično implementirano u v3.0.0  
#### Manja poboljšanja - Neki završeni u trenutnom izdanju  
- ✅ **Dodatni primjeri**: Scenariji implementacije usmjereni na AI (Završeno)  
- ✅ **Prošireni FAQ**: AI-specifična pitanja i rješavanje problema (Završeno)  
- **Integracija alata**: Poboljšani vodiči za integraciju u IDE i uređivače  
- ✅ **Proširenje praćenja**: AI-specifični obrasci za nadzor i upozorenja (Završeno)  

#### Još planirano za buduće izdanje  
- **Mobilno prilagođena dokumentacija**: Responzivni dizajn za mobilno učenje  
- **Pristup izvan mreže**: Paketi za preuzimanje dokumentacije  
- **Poboljšana integracija s IDE**: VS Code ekstenzija za AZD + AI tijekove rada  
- **Zajednički nadzorna ploča**: Metrike zajednice u stvarnom vremenu i praćenje doprinosa  

## Doprinos promjenama u zapisniku promjena

### Prijavljivanje promjena  
Kada doprinostite ovom spremištu, molimo osigurajte da unosi u zapisnik promjena sadrže:

1. **Broj verzije**: Slijedeći semantičko verzioniranje (glavna.manja.popravljena)  
2. **Datum**: Datum izdanja ili ažuriranja u formatu GGGG-MM-DD  
3. **Kategorija**: Dodano, Promijenjeno, Zastarjelo, Uklonjeno, Ispravljeno, Sigurnost  
4. **Jasni opis**: Sažeti opis promjene  
5. **Procjena utjecaja**: Kako promjene utječu na postojeće korisnike  

### Kategorije promjena

#### Dodano  
- Nove značajke, dijelovi dokumentacije ili mogućnosti  
- Novi primjeri, predlošci ili izvori za učenje  
- Dodatni alati, skripte ili korisnička pomagala  

#### Promijenjeno  
- Izmjene postojeće funkcionalnosti ili dokumentacije  
- Ažuriranja radi poboljšanja jasnoće ili točnosti  
- Preuređivanje sadržaja ili organizacije  

#### Zastarjelo  
- Značajke ili pristupi koji se ukidaju  
- Dijelovi dokumentacije planirani za uklanjanje  
- Metode koje imaju bolje alternative  

#### Uklonjeno  
- Značajke, dokumentacija ili primjeri koji više nisu relevantni  
- Zastarjeli podaci ili zastarjeli pristupi  
- Redundantni ili objedinjeni sadržaj  

#### Ispravljeno  
- Ispravci grešaka u dokumentaciji ili kodu  
- Rješavanje prijavljenih problema ili poteškoća  
- Poboljšanja točnosti ili funkcionalnosti  

#### Sigurnost  
- Poboljšanja ili ispravci vezani uz sigurnost  
- Ažuriranja sigurnosnih najboljih praksi  
- Rješavanje sigurnosnih ranjivosti  

### Smjernice za semantičko verzioniranje

#### Glavna verzija (X.0.0)  
- Promjene koje zahtijevaju akciju korisnika  
- Značajno preuređivanje sadržaja ili organizacije  
- Promjene koje mijenjaju temeljni pristup ili metodologiju  

#### Manja verzija (X.Y.0)  
- Nove značajke ili dodaci sadržaja  
- Poboljšanja koja održavaju kompatibilnost unazad  
- Dodatni primjeri, alati ili resursi  

#### Popravna verzija (X.Y.Z)  
- Ispravci grešaka i korekcije  
- Manja poboljšanja postojećeg sadržaja  
- Pojašnjenja i sitna poboljšanja  

## Povratne informacije i prijedlozi zajednice

Aktivno potičemo povratne informacije zajednice za poboljšanje ovog izvora za učenje:

### Kako dati povratnu informaciju  
- **GitHub Issues**: Prijavite probleme ili predložite poboljšanja (AI-specifični problemi su dobrodošli)  
- **Discord diskusije**: Podijelite ideje i sudjelujte u zajednici Microsoft Foundry  
- **Pull zahtjevi**: Izravni doprinosi poboljšanjima sadržaja, posebno AI predlošcima i vodičima  
- **Microsoft Foundry Discord**: Sudjelujte u #Azure kanalu za rasprave o AZD + AI  
- **Zajednički forumi**: Sudjelujte u širim raspravama o Azure razvoju  

### Kategorije povratnih informacija  
- **Točnost AI sadržaja**: Ispravci integracije i implementacije AI usluga  
- **Iskustvo učenja**: Prijedlozi za poboljšanje tijeka učenja AI developera  
- **Nedostajući AI sadržaj**: Zahtjevi za dodatne AI predloške, obrasce ili primjere  
- **Pristupačnost**: Poboljšanja za različite potrebe učenja  
- **Integracija AI alata**: Prijedlozi za bolju integraciju u AI razvojne tokove  
- **Proizvodni AI obrasci**: Zahtjevi za korporativne obrasce AI implementacije  

### Obaveza odgovora  
- **Odgovor na probleme**: Unutar 48 sati za prijavljene probleme  
- **Zahtjevi za značajke**: Evaluacija unutar jednog tjedna  
- **Doprinosi zajednice**: Pregled unutar jednog tjedna  
- **Sigurnosni problemi**: Prioritetna i hitna obrada  

## Raspored održavanja

### Redovita ažuriranja  
- **Mjesečni pregledi**: Provjera točnosti sadržaja i valjanosti poveznica  
- **Četvrtalna ažuriranja**: Veći dodaci i poboljšanja sadržaja  
- **Polugodišnji pregledi**: Temeljito preuređivanje i unapređenja  
- **Godišnja izdanja**: Glavna ažuriranja verzija sa značajnim unapređenjima  

### Praćenje i osiguranje kvalitete  
- **Automatizirano testiranje**: Redovita validacija primjera koda i poveznica  
- **Integracija povratnih informacija zajednice**: Redovno uključivanje prijedloga korisnika  
- **Ažuriranja tehnologije**: Usklađivanje s najnovijim Azure uslugama i azd izdanjima  
- **Revizije pristupačnosti**: Redoviti pregledi za principe inkluzivnog dizajna  

## Politika podrške verzija

### Podrška za trenutnu verziju  
- **Najnovija glavna verzija**: Puna podrška s redovitim ažuriranjima  
- **Prethodna glavna verzija**: Sigurnosne zakrpe i kritične ispravke tijekom 12 mjeseci  
- **Legacy verzije**: Samo podrška zajednice, bez službenih ažuriranja  

### Smjernice za migraciju  
Kada izlaze glavne verzije, pružamo:  
- **Vodiče za migraciju**: Korak-po-korak upute za prijelaz  
- **Bilješke o kompatibilnosti**: Detalji o promjenama koje prekidaju kompatibilnost  
- **Podrška alata**: Skripte ili alati za pomoć pri migraciji  
- **Zajednička podrška**: Namjenski forumi za pitanja o migraciji  

---

**Navigacija**  
- **Prethodna lekcija**: [Vodič za učenje](resources/study-guide.md)  
- **Sljedeća lekcija**: Povratak na [Glavni README](README.md)  

**Ostanite informirani**: Pratite ovo spremište za obavijesti o novim izdanjima i važnim ažuriranjima materijala za učenje.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:
Ovaj dokument je preveden korištenjem AI usluge za prijevod [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba se smatrati službenim i autoritativnim izvorom. Za kritične informacije preporučuje se profesionalni ljudski prijevod. Ne snosimo odgovornost za bilo kakve nesporazume ili pogrešne interpretacije koje proizađu iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->