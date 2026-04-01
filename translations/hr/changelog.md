# Changelog - AZD za početnike

## Uvod

Ovaj changelog dokumentira sve značajne promjene, ažuriranja i poboljšanja u spremištu AZD za početnike. Slijedimo principe semantičkog verzioniranja i održavamo ovaj zapis kako bismo korisnicima pomogli razumjeti što se promijenilo između verzija.

## Ciljevi učenja

Pregledom ovog changeloga, vi ćete:
- Ostati informirani o novim značajkama i dodacima sadržaja
- Razumjeti poboljšanja napravljena u postojećoj dokumentaciji
- Pratiti ispravke grešaka i korekcije radi osiguranja točnosti
- Pratiti evoluciju materijala za učenje tijekom vremena

## Ishodi učenja

Nakon pregleda unosa u changelogu, moći ćete:
- Prepoznati novi sadržaj i dostupne resurse za učenje
- Razumjeti koje su sekcije ažurirane ili poboljšane
- Planirati svoj put učenja na temelju najsvježijih materijala
- Davati povratne informacije i prijedloge za buduća poboljšanja

## Povijest verzija

### [v3.19.1] - 2026-03-27

#### Pojašnjenje za početničko uvodno korištenje, validacija postava i konačno čišćenje AZD naredbi
**Ova verzija nadovezuje se na validacijsku provjeru AZD 1.23 s pregledom dokumentacije fokusiranim na početnike: pojašnjava uvodno vođenje za autentifikaciju s uputama prvenstveno za AZD, dodaje skripte za validaciju lokalnog postava, provjerava ključne naredbe prema aktualnom AZD CLI-u i uklanja posljednje zastarjele reference na naredbe u izvornom engleskom jeziku izvan changeloga.**

#### Dodano
- **🧪 Skripte za validaciju postava za početnike** s `validate-setup.ps1` i `validate-setup.sh` kako bi učenici mogli potvrditi potrebne alate prije početka Poglavlja 1
- **✅ Koraci validacije postava već na početku** u root README i README-u Poglavlja 1 kako bi se nedostajući preduvjeti uhvatili prije `azd up`

#### Promijenjeno
- **🔐 Uputstvo za autentifikaciju početnika** sada dosljedno tretira `azd auth login` kao primarni put za AZD tijekove rada, s napomenom da je `az login` opcionalan osim ako se direktno ne koriste Azure CLI naredbe
- **📚 Uvodni tijek Poglavlja 1** sada usmjerava učenike da potvrde svoj lokalni postav prije instalacije, autentifikacije i prvih koraka implementacije
- **🛠️ Poruke validatora** sada jasno odvajaju blokirajuće zahtjeve od opcionalnih upozorenja Azure CLI-ja za AZD-putanje fokusirane samo na početnike
- **📖 Dokumentacija o konfiguraciji, otklanjanju poteškoća i primjerima** sada razlikuje obaveznu AZD autentifikaciju od opcionalnog prijavljivanja u Azure CLI tamo gdje su ranije oba prikazana bez konteksta

#### Ispravljeno
- **📋 Preostale reference na naredbe u izvornom engleskom** ažurirane su na aktualne AZD oblike, uključujući `azd config show` u cheat sheetu i `azd monitor --overview` gdje je bila namijenjena uputa za Azure Portal prikaz
- **🧭 Tvrdnje za početnike u Poglavlju 1** ublažene kako bi se izbjeglo preveliko obećanje zajamčene nikakve greške ili povrata na sve predloške i Azure resurse
- **🔎 Validacija na uživo CLI-u** potvrdila je aktualnu podršku za `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` i `azd down --force --purge`

#### Ažurirane datoteke
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `examples/container-app/README.md`
- `examples/database-app/README.md`
- `resources/cheat-sheet.md`
- `validate-setup.ps1`
- `validate-setup.sh`

---

### [v3.19.0] - 2026-03-26

#### Validacija AZD 1.23.12, širenje okruženja radionice i osvježavanje AI modela
**Ova verzija obavlja valjanu provjeru dokumentacije protiv `azd` verzije `1.23.12`, ažurira zastarjele primjere AZD naredbi, osvježava upute za AI modele prema aktualnim zadanim postavkama i proširuje upute za radionicu izvan GitHub Codespaces na podršku i za dev kontejnere te lokalne klonove.**

#### Dodano
- **✅ Napomene o validaciji kroz glavna poglavlja i dokumente radionice** da jasnije označe testiranu osnovu verzije AZD CLI-ja za korisnike novijih ili starijih verzija
- **⏱️ Upute za timeout kod implementacija dugotrajnih AI aplikacija** s korištenjem `azd deploy --timeout 1800`
- **🔎 Koraci za inspekciju ekstenzija** s `azd extension show azure.ai.agents` u AI uputama
- **🌐 Šire upute o okruženjima radionice** koje pokrivaju GitHub Codespaces, dev kontejnere i lokalne klonove uz MkDocs

#### Promijenjeno
- **📚 Uvodni README-ovi poglavlja** sada dosljedno navode validaciju protiv `azd 1.23.12` kroz temelj, konfiguraciju, infrastrukturu, više-agentski pristup, pred-implementaciju, otklanjanje poteškoća i produkciju
- **🛠️ Reference na AZD naredbe** ažurirane su na trenutne oblike u dokumentima:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` ili `azd env get-value(s)` ovisno o kontekstu
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` gdje je bila namjera prikaz pregleda u Application Insights
- **🧪 Primjeri pregleda provisioning-a** pojednostavljeni na trenutno podržanu uporabu poput `azd provision --preview` i `azd provision --preview -e production`
- **🧭 Tijek radionice** ažuriran tako da polaznici mogu dovršiti laboratorije u Codespaces, dev kontejneru ili lokalnom klonu, ne pretpostavljajući jedino izvođenje u Codespaces
- **🔐 Upute za autentifikaciju** sada preferiraju `azd auth login` za AZD tijekove rada, dok se `az login` koristi kao opcionalno, ako se direktno koriste Azure CLI naredbe

#### Ispravljeno
- **🪟 Windows naredbe za instalaciju** normalizirane prema trenutnom velikom/malom pisanju paketa `winget` u vodiču za instalaciju
- **🐧 Upute za instalaciju na Linuxu** ispravljene kako bi se izbjegle nepodržane distro-specifične `azd` upute za upravitelja paketa i usmjerene na release materijale gdje je prikladno
- **📦 Primjeri AI modela** osvježeni s ranijih zadataka poput `gpt-35-turbo` i `text-embedding-ada-002` na trenutačne primjere poput `gpt-4.1-mini`, `gpt-4.1` i `text-embedding-3-large`
- **📋 Snippets za implementaciju i dijagnostiku** ispravljeni za korištenje aktualnih naredbi za okoliš i status u zapisima, skriptama i koracima za rješavanje problema
- **⚙️ GitHub Actions upute** ažurirane s `Azure/setup-azd@v1.0.0` na `Azure/setup-azd@v2`
- **🤖 Upute za davanje pristanka MCP/Copilot** ažurirane s `azd mcp consent` na `azd copilot consent list`

#### Poboljšano
- **🧠 Poglavlje o AI-u** sada bolje objašnjava ponašanje `azd ai` osjetljivo na preview, prijavu specifičnu za tenant, trenutnu uporabu ekstenzija i preporuke za implementaciju modela
- **🧪 Upute za radionicu** sada koriste realističnije primjere verzija i jasniji jezik za postavljanje okruženja u praktičnim laboratorijima
- **📈 Dokumentacija za produkciju i otklanjanje poteškoća** bolje je usklađena s aktualnim praćenjem, rezervnim modelom i primjerima troškova

#### Ažurirane datoteke
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-03-configuration/configuration.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-06-pre-deployment/preflight-checks.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `docs/chapter-07-troubleshooting/common-issues.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `workshop/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/1-Select-AI-Template.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`
- `workshop/docs/instructions/3-Deconstruct-AI-Template.md`
- `workshop/docs/instructions/5-Customize-AI-Template.md`

---

### [v3.18.0] - 2026-03-16

#### AZD AI CLI naredbe, validacija sadržaja i proširenje predložaka
**Ova verzija dodaje pokrivenost naredbi `azd ai`, `azd extension` i `azd mcp` u svim AI-povezanim poglavljima, popravljajući prekinute poveznice i zastarjeli kod u agents.md, ažurira cheat sheet i temeljito preuređuje odjeljak Primjer predložaka s validiranim opisima i novim Azure AI AZD predlošcima.**

#### Dodano
- **🤖 Pokrivenost AZD AI CLI naredbi** u 7 datoteka (prije samo u Poglavlju 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Novi odjeljak "Ekstenzije i AI naredbe" uvodi `azd extension`, `azd ai agent init` i `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opcija 4: `azd ai agent init` s usporednom tablicom (pristup preko predloška vs. manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Pododjeljci "AZD ekstenzije za Foundry" i "Implementacija prvog agenta"
  - `docs/chapter-05-multi-agent/README.md` — Brzi početak sada pokazuje puteve implementacije preko predloška i manifesta
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Odjeljak implementacije sada uključuje opciju `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Pododjeljak "AZD AI ekstenzijske naredbe za dijagnostiku"
  - `resources/cheat-sheet.md` — Novi odjeljak "AI i ekstenzijske naredbe" s `azd extension`, `azd ai agent init`, `azd mcp` i `azd infra generate`
- **📦 Novi AZD AI primjeri predložaka** u `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG chat s Blazor WebAssembly, Semantic Kernel i podrškom za glasovni chat
  - **azure-search-openai-demo-java** — Java RAG chat koristeći Langchain4J s opcijama implementacije na ACA/AKS
  - **contoso-creative-writer** — Multagentska kreativna aplikacija za pisanje koristeći Azure AI Agent Service, Bing Grounding i Prompty
  - **serverless-chat-langchainjs** — Serverless RAG koristeći Azure Functions + LangChain.js + Cosmos DB s podrškom za lokalni razvoj s Ollama
  - **chat-with-your-data-solution-accelerator** — Enterprise RAG akcelerator s administrativnim portalom, integracijom Teams i opcijama PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Referentna aplikacija za MCP orkestraciju s više agenata s poslužiteljima u .NET, Python, Java i TypeScriptu
  - **azd-ai-starter** — Minimalni početni predložak Azure AI infrastrukture u Bicep-u
  - **🔗 Link na Awesome AZD AI Galeriju** — Referenca na [awesome-azd AI galeriju](https://azure.github.io/awesome-azd/?tags=ai) (80+ predložaka)

#### Ispravljeno
- **🔗 Navigacija u agents.md**: Poveznice Prethodno/Sljedeće sada odgovaraju redoslijedu lekcija u README-u Poglavlja 2 (Microsoft Foundry Integracija → Agenti → Implementacija AI modela)
- **🔗 Prekinute poveznice u agents.md**: `production-ai-practices.md` ispravljeno u `../chapter-08-production/production-ai-practices.md` (3 pojave)
- **📦 Zastarjeli kod u agents.md**: Zamijenjen `opencensus` s `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 Nevažeći API u agents.md**: Premješten `max_tokens` iz `create_agent()` u `create_run()` kao `max_completion_tokens`
- **🔢 Brojanje tokena u agents.md**: Zamijenjena gruba procjena `len//4` s `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Ispravljene usluge s "Cognitive Search + App Service" u "Azure AI Search + Azure Container Apps" (default host promijenjen u listopadu 2024)
- **contoso-chat**: Ažuriran opis da referira Azure AI Foundry + Prompty, u skladu s stvarnim naslovom i tehnološkim paketom repozitorija

#### Uklonjeno
- **ai-document-processing**: Uklonjena referenca na nefunkcionalni predložak (repo nije javno dostupan kao AZD predložak)

#### Poboljšano
- **📝 agents.md vježbe**: Vježba 1 sada prikazuje očekivani izlaz i korak `azd monitor`; Vježba 2 uključuje kompletan kod registracije `FunctionTool`; Vježba 3 zamjenjuje nejasne smjernice konkretnim naredbama `prepdocs.py`
- **📚 agents.md resursi**: Ažurirani dokumentacijski linkovi do aktualne Azure AI Agent Service dokumentacije i vodiča za početak
- **📋 agents.md tablica sljedećih koraka**: Dodan link na AI Workshop laboratorij za cjelovito pokrivanje poglavlja

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

#### Poboljšanje navigacije kroz tečaj
**Ova verzija poboljšava navigaciju kroz README.md poglavlja s unaprijeđenim tabličnim prikazom.**

#### Promijenjeno
- **Tablica karte tečaja**: Poboljšana s direktnim linkovima na lekcije, procjenama trajanja i ocjenama složenosti
- **Čišćenje mapa**: Uklonjene su redundantne stare mape (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Validacija linkova**: Provjereno svih 21+ internih linkova u tablici karte tečaja

### [v3.16.0] - 2026-02-05

#### Ažuriranja naziva proizvoda
**Ova verzija ažurira nazive proizvoda prema trenutačnom Microsoft brandingu.**

#### Promijenjeno
- **Microsoft Foundry → Microsoft Foundry**: Svi reference ažurirane u svim datotekama osim prijevoda
- **Azure AI Agent Service → Foundry Agents**: Naziv servisa ažuriran radi usklađivanja s trenutnim brandingom

#### Ažurirane datoteke
- `README.md` - Glavna ulazna stranica tečaja
- `changelog.md` - Povijest verzija
- `course-outline.md` - Struktura tečaja
- `docs/chapter-02-ai-development/agents.md` - Vodič za AI agente
- `examples/README.md` - Dokumentacija primjera
- `workshop/README.md` - Ulazna stranica radionice
- `workshop/docs/index.md` - Indeks radionice
- `workshop/docs/instructions/*.md` - Sve upute radionice

---

### [v3.15.0] - 2026-02-05

#### Velika prestrukturacija repozitorija: imenovanje mapa prema poglavljima
**Ova verzija prestrukturira dokumentaciju u namjenske mape poglavlja radi jasnije navigacije.**

#### Preimenovanja mapa
Stare mape zamijenjene su mapama označenima brojevima poglavlja:
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
  - Brzim komandama za početak
  - Navigacijom do ostalih poglavlja

#### Promijenjeno
- **🔗 Ažurirani svi interni linkovi**: 78+ staza ažurirano u svim dokumentacijskim datotekama
- **🗺️ Glavni README.md**: Ažurirana karta tečaja s novom strukturom poglavlja
- **📝 examples/README.md**: Ažurirane međureferencije na mape poglavlja

#### Uklonjeno
- Stara struktura mapa (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Prestrukturiranje repozitorija: Navigacija kroz poglavlja
**Ova verzija dodala je README datoteke za navigaciju po poglavljima (zamijenjeno verzijom v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Novi vodič za AI agente
**Ova verzija dodaje iscrpan vodič za implementaciju AI agenata pomoću Azure Developer CLI.**

#### Dodano
- **🤖 docs/microsoft-foundry/agents.md**: Potpuni vodič koji obuhvaća:
  - Što su AI agenti i kako se razlikuju od chatbota
  - Tri predloška za brzo pokretanje agenata (Foundry Agents, Prompty, RAG)
  - Arhitektonski obrasci agenata (jedan agent, RAG, multi-agent)
  - Konfiguracija i prilagodba alata
  - Praćenje i metrike nadzora
  - Troškovi i optimizacija
  - Česti problemi i rješavanje poteškoća
  - Tri praktične vježbe s kriterijima uspjeha

#### Struktura sadržaja
- **Uvod**: Koncepti agenata za početnike
- **Brzi početak**: Implementacija agenata pomoću `azd init --template get-started-with-ai-agents`
- **Arhitektonski obrasci**: Vizualni dijagrami obrazaca agenata
- **Konfiguracija**: Postavljanje alata i varijable okoline
- **Praćenje**: Integracija s Application Insights
- **Vježbe**: Postepeno praktično učenje (20-45 minuta svaka)

---

### [v3.12.0] - 2026-02-05

#### Ažuriranje DevContainer okruženja
**Ova verzija ažurira konfiguraciju razvojne kutije s modernim alatima i boljim zadanim postavkama za AZD iskustvo učenja.**

#### Promijenjeno
- **🐳 Bazna slika**: Ažurirano s `python:3.12-bullseye` na `python:3.12-bookworm` (najnoviji stabilni Debian)
- **📛 Ime kontejnera**: Promijenjeno iz "Python 3" u "AZD for Beginners" radi jasnosti

#### Dodano
- **🔧 Nove značajke Dev Container-a**:
  - `azure-cli` s omogućenim Bicep podrškom
  - `node:20` (LTS verzija za AZD predloške)
  - `github-cli` za upravljanje predlošcima
  - `docker-in-docker` za implementacije container app-a

- **🔌 Prosljeđivanje portova**: Predkonfigurirani portovi za uobičajeni razvoj:
  - 8000 (MkDocs pregled)
  - 3000 (Web aplikacije)
  - 5000 (Python Flask)
  - 8080 (API-jevi)

- **🧩 Novi VS Code dodaci**:
  - `ms-python.vscode-pylance` - Poboljšan Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Podrška za Azure Functions
  - `ms-azuretools.vscode-docker` - Podrška za Docker
  - `ms-azuretools.vscode-bicep` - Podrška za Bicep jezik
  - `ms-azure-devtools.azure-resource-groups` - Upravljanje Azure resursima
  - `yzhang.markdown-all-in-one` - Uređivanje Markdowna
  - `DavidAnson.vscode-markdownlint` - Markdown linting
  - `bierner.markdown-mermaid` - Podrška za Mermaid dijagrame
  - `redhat.vscode-yaml` - YAML podrška (za azure.yaml)
  - `eamodio.gitlens` - Vizualizacija Gita
  - `mhutchie.git-graph` - Povijest Gita

- **⚙️ VS Code postavke**: Dodane zadane postavke za Python interpreter, automatski format i uklanjanje praznina

- **📦 Ažurirani requirements-dev.txt**:
  - Dodan MkDocs minify dodatak
  - Dodan pre-commit za kvalitetu koda
  - Dodani Azure SDK paketi (azure-identity, azure-mgmt-resource)

#### Ispravljeno
- **Post-Create naredba**: Sada provjerava instalaciju AZD i Azure CLI na početku kontejnera

---

### [v3.11.0] - 2026-02-05

#### README prilagođen početnicima
**Ova verzija značajno poboljšava README.md radi bolje pristupačnosti početnicima i dodaje ključne resurse za AI developere.**

#### Dodano
- **🆚 Usporedba Azure CLI i AZD**: Jasno objašnjenje kada koristiti koji alat s praktičnim primjerima
- **🌟 Odlični AZD linkovi**: Direktni linkovi na zajedničku galeriju predložaka i resurse za doprinos:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ predložaka spremnih za implementaciju
  - [Predloži predložak](https://github.com/Azure/awesome-azd/issues) - Zajednički doprinos
- **🎯 Brzi vodič za početak**: Pojednostavljen 3-koraka vodič za početak (Instaliraj → Prijavi se → Implementiraj)
- **📊 Tablica za navigaciju prema iskustvu**: Jasne preporuke gdje početi prema iskustvu developera

#### Promijenjeno
- **Struktura README**: Reorganizirana za postepeno otkrivanje – najvažnije informacije prve
- **Uvodni odjeljak**: Prepisan kako bi objasnio "Čaroliju `azd up`" za potpune početnike
- **Uklonjen duplikat sadržaja**: Eliminiran duplikat sekcije za rješavanje problema
- **Naredbe za otklanjanje poteškoća**: Ispravljena referenca `azd logs` na važeći `azd monitor --logs`

#### Ispravljeno
- **🔐 Autentikacijske naredbe**: Dodani `azd auth login` i `azd auth logout` u cheat-sheet.md
- **Nevažeće naredbe uklonjene**: Uklonjene preostale `azd logs` iz sekcije za rješavanje problema u README

#### Napomene
- **Opseg**: Promjene primijenjene na glavni README.md i resources/cheat-sheet.md
- **Ciljana publika**: Poboljšanja namijenjena posebno developerima koji su novi u AZD-u

---

### [v3.10.0] - 2026-02-05

#### Ispravak točnosti Azure Developer CLI naredbi
**Ova verzija ispravlja nepostojeće AZD naredbe kroz cijelu dokumentaciju, osiguravajući da svi primjeri koda koriste važeću Azure Developer CLI sintaksu.**

#### Ispravljeno
- **🔧 Uklonjene nepostojeće AZD naredbe**: Temeljita revizija i korekcija nevažećih naredbi:
  - `azd logs` (ne postoji) → zamijenjeno s `azd monitor --logs` ili alternativama Azure CLI-ja
  - `azd service` podnaredbe (ne postoje) → zamijenjene s `azd show` i Azure CLI-jem
  - `azd infra import/export/validate` (ne postoje) → uklonjeno ili zamijenjeno valjanim alternativama
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` zastavice (ne postoje) → uklonjeno
  - `azd provision --what-if/--rollback` zastavice (ne postoje) → ažurirano na korištenje `--preview`
  - `azd config validate` (ne postoji) → zamijenjeno s `azd config list`
  - `azd info`, `azd history`, `azd metrics` (ne postoje) → uklonjeno

- **📚 Ažurirane datoteke s ispravcima naredbi**:
  - `resources/cheat-sheet.md`: Velika revizija referenci naredbi
  - `docs/deployment/deployment-guide.md`: Ispravljene strategije rollbacka i implementacije
  - `docs/troubleshooting/debugging.md`: Ispravljeni dijelovi za analizu dnevnika
  - `docs/troubleshooting/common-issues.md`: Ažurirane naredbe za rješavanje problema
  - `docs/troubleshooting/ai-troubleshooting.md`: Ispravljena sekcija za debugiranje AZD-a
  - `docs/getting-started/azd-basics.md`: Ispravljene naredbe za nadzor
  - `docs/getting-started/first-project.md`: Ažurirani primjeri nadzora i debugiranja
  - `docs/getting-started/installation.md`: Ispravljeni primjeri pomoći i verzije
  - `docs/pre-deployment/application-insights.md`: Ispravljene naredbe za pregled dnevnika
  - `docs/pre-deployment/coordination-patterns.md`: Ispravljene naredbe za debugiranje agenata

- **📝 Ažuriran referentni broj verzije**: 
  - `docs/getting-started/installation.md`: Promijenjena hardkodirana verzija `1.5.0` u generičku `1.x.x` s linkom na izdanja

#### Promijenjeno
- **Strategije rollbacka**: Ažurirana dokumentacija za korištenje rollbacka temeljena na Gitu (AZD nema ugrađeni rollback)
- **Pregled dnevnika**: Zamijenjene reference na `azd logs` s `azd monitor --logs`, `azd monitor --live` i Azure CLI naredbama
- **Sekcija performansi**: Uklonjene nepostojeće zastavice za paralelnu i inkrementalnu implementaciju, ponuđene valjane alternative

#### Tehnički detalji
- **Ispravne AZD naredbe**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Ispravne azd monitor zastavice**: `--live`, `--logs`, `--overview`
- **Uklonjene značajke**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Bilješke
- **Provjera**: Naredbe potvrđene u skladu s Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Dovršetak radionice i ažuriranje kvalitete dokumentacije
**Ova verzija dovršava interaktivne module radionice, ispravlja sve pokvarene poveznice u dokumentaciji i poboljšava ukupnu kvalitetu sadržaja za AI developere koji koriste Microsoft AZD.**

#### Dodano
- **📝 CONTRIBUTING.md**: Novi dokument s uputama za doprinos s:
  - Jasnim uputama o prijavljivanju problema i predlaganju promjena
  - Standardima dokumentacije za novi sadržaj
  - Smjernicama za primjere koda i konvencijama poruka o predaji
  - Informacijama o angažmanu zajednice

#### Dovršeno
- **🎯 Modul radionice 7 (Zaključak)**: Potpuno dovršen završni modul s:
  - Sveobuhvatnim sažetkom ostvarenih ciljeva radionice
  - Sekcijom o ključnim pojmovima pokrivajući AZD, predloške i Microsoft Foundry
  - Preporukama za nastavak učeničkog putovanja
  - Vježbama izazova radionice s ocjenama težine
  - Poveznicama za povratne informacije i podršku zajednice

- **📚 Modul radionice 3 (Deconstruct)**: Ažurirani ciljevi učenja s:
  - Uputama za aktivaciju GitHub Copilot na MCP poslužiteljima
  - Razumijevanjem strukture predložaka AZD mapa
  - Obrasci organizacije infrastrukture kao koda (Bicep)
  - Uputama za praktičnu laboratorijsku vježbu

- **🔧 Modul radionice 6 (Teardown)**: Dovršen s:
  - Ciljevima čišćenja resursa i upravljanja troškovima
  - Korištenjem `azd down` za sigurno uklanjanje infrastrukture
  - Uputama za oporavak softver izbrisanih kognitivnih servisa
  - Bonus pitanjima za istraživanje GitHub Copilot i Azure Portala

#### Ispravljeno
- **🔗 Ispravci pokvarenih poveznica**: Riješeno 15+ pokvarenih unutarnjih poveznica u dokumentaciji:
  - `docs/ai-foundry/ai-model-deployment.md`: Ispravljene putanje do microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Ispravljene putanje ai-model-deployment.md i production-ai-practices.md
  - `docs/getting-started/first-project.md`: Zamijenjen nepostojeći cicd-integration.md s deployment-guide.md
  - `examples/retail-scenario.md`: Ispravljene putanje do često postavljanih pitanja i vodiča za rješavanje problema
  - `examples/container-app/microservices/README.md`: Ispravljene putanje do kućnog tečaja i vodiča za implementaciju
  - `resources/faq.md` i `resources/glossary.md`: Ažurirane reference u AI poglavlju
  - `course-outline.md`: Ispravljene reference na vodič za instruktore i laboratorijske vježbe radionice AI

- **📅 Banner statusa radionice**: Ažuriran s "Under Construction" na aktivan status radionice s datumom veljača 2026.

- **🔗 Navigacija radionice**: Ispravljene pokvarene navigacijske poveznice u README.md radionice koje su upućivale na nepostojeću mapu lab-1-azd-basics

#### Promijenjeno
- **Prezentacija radionice**: Uklonjena upozorenja o "u izradi", radionica je sada dovršena i spremna za korištenje
- **Dosljednost navigacije**: Osigurana pravilna međumodularna navigacija svih modula radionice
- **Reference na put učenja**: Ažurirane međupoglavlja s točnim microsoft-foundry putanjama

#### Potvrđeno
- ✅ Sve engleske markdown datoteke imaju ispravne unutarnje poveznice
- ✅ Moduli radionice 0-7 su dovršeni s ciljevima učenja
- ✅ Navigacija između poglavlja i modula funkcionira ispravno
- ✅ Sadržaj je prikladan za AI developere koji koriste Microsoft AZD
- ✅ Očuvan je pristupačan jezik i struktura za početnike
- ✅ CONTRIBUTING.md pruža jasne upute za pridonose članove zajednice

#### Tehnička implementacija
- **Provjera poveznica**: Automatski PowerShell skript provjerio sve .md unutarnje poveznice
- **Revizija sadržaja**: Ručni pregled cjelovitosti radionice i prikladnosti za početnike
- **Sustav navigacije**: Dosljedni obrasci navigacije kroz poglavlja i module primijenjeni

#### Bilješke
- **Opseg**: Promjene primijenjene samo na englesku dokumentaciju
- **Prijevodi**: Mape prijevoda nisu ažurirane u ovoj verziji (automatski prijevod će se sinkronizirati naknadno)
- **Trajanje radionice**: Cjelovita radionica sada pruža 3-4 sata praktičnog učenja

---

### [v3.8.0] - 2025-11-19

#### Napredna dokumentacija: nadzor, sigurnost i obrasci višestrukih agenata
**Ova verzija dodaje sveobuhvatne lekcije A razine o integraciji Application Insights, obrascima autentikacije i koordinaciji višestrukih agenata za produkcijske implementacije.**

#### Dodano
- **📊 Lekcija o integraciji Application Insights**: u `docs/pre-deployment/application-insights.md`:
  - Implementacija usmjerena na AZD s automatskim provisioningom
  - Potpuni Bicep predlošci za Application Insights + Log Analytics
  - Radne Python aplikacije s prilagođenom telemetrijom (1.200+ linija)
  - Obrasci nadzora AI/LLM (praćenje tokena/troškova Microsoft Foundry modela)
  - 6 Mermaid dijagrama (arhitektura, distribuirano praćenje, tok telemetrije)
  - 3 praktične vježbe (alerti, nadzorne ploče, AI nadzor)
  - Primjeri Kusto upita i strategije optimizacije troškova
  - Streaming mjernih podataka u stvarnom vremenu i otklanjanje pogrešaka
  - Vrijeme učenja: 40-50 minuta s proizvodnim obrascima

- **🔐 Lekcija o obrascima autentikacije i sigurnosti**: u `docs/getting-started/authsecurity.md`:
  - 3 obrasca autentikacije (connection strings, Key Vault, upravljani identitet)
  - Potpuni Bicep predlošci za sigurnu infrastrukturu
  - Kod Node.js aplikacije s integracijom Azure SDK-a
  - 3 kompletne vježbe (omogućavanje upravljanog identiteta, user-assigned identiteta, rotacija u Key Vaultu)
  - Najbolje prakse sigurnosti i RBAC konfiguracije
  - Vodič za rješavanje problema i analiza troškova
  - Produkcijski obrasci autentikacije bez lozinki

- **🤖 Lekcija o obrascima koordinacije višestrukih agenata**: u `docs/pre-deployment/coordination-patterns.md`:
  - 5 obrasaca koordinacije (sekvencijalni, paralelni, hijerarhijski, na događaje temeljen, konsenzus)
  - Potpuna implementacija orkestratorske usluge (Python/Flask, 1.500+ linija)
  - 3 specijalizirane implementacije agenata (Istraživanje, Pisac, Urednik)
  - Integracija Service Bus-a za poruke u redu
  - Upravljanje stanjem u Cosmos DB za distribuirane sustave
  - 6 Mermaid dijagrama koji prikazuju interakcije agenata
  - 3 napredne vježbe (rukovanje prekoračenjem roka, logika ponovnog pokušaja, prekidač kruga)
  - Razrada troškova (240-565 $/mjesec) s optimizacijskim strategijama
  - Integracija Application Insights za nadzor

#### Poboljšano
- **Poglavlje prije implementacije**: Sada uključuje sveobuhvatne obrasce nadzora i koordinacije
- **Poglavlje za početnike**: Poboljšano profesionalnim obrascima autentikacije
- **Spremnost za produkciju**: Cjelovita pokrivenost od sigurnosti do observabilnosti
- **Pregled tečaja**: Ažuriran referencama na nove lekcije u Poglavljima 3 i 6

#### Promijenjeno
- **Napredak u učenju**: Bolja integracija sigurnosti i nadzora kroz cijeli tečaj
- **Kvaliteta dokumentacije**: Dosljedni standardi A razine (95-97%) za nove lekcije
- **Produkcijski obrasci**: Cjelovita pokrivenost od kraja do kraja za enterprise implementacije

#### Poboljšano
- **Iskustvo developera**: Jasan put od razvoja do produkcijskog nadzora
- **Sigurnosni standardi**: Profesionalni obrasci za autentikaciju i upravljanje tajnama
- **Observabilnost**: Potpuna integracija Application Insights s AZD
- **AI radna opterećenja**: Specijalizirani nadzor za Microsoft Foundry modele i sustave višestrukih agenata

#### Potvrđeno
- ✅ Sve lekcije sadrže kompletan radni kod (ne samo isječke)
- ✅ Mermaid dijagrami za vizualno učenje (ukupno 19 u 3 lekcije)
- ✅ Praktične vježbe s koracima za provjeru (ukupno 9)
- ✅ Produkcijski Bicep predlošci mogu se implementirati pomoću `azd up`
- ✅ Analiza troškova i strategije optimizacije
- ✅ Vodiči za rješavanje problema i najbolje prakse
- ✅ Provjere znanja s naredbama za verifikaciju

#### Rezultati ocjenjivanja dokumentacije
- **docs/pre-deployment/application-insights.md**: - Sveobuhvatan vodič za nadzor
- **docs/getting-started/authsecurity.md**: - Profesionalni sigurnosni obrasci
- **docs/pre-deployment/coordination-patterns.md**: - Napredne arhitekture višestrukih agenata
- **Ukupno novi sadržaj**: - Dosljedni visokokvalitetni standardi

#### Tehnička implementacija
- **Application Insights**: Log Analytics + prilagođena telemetrija + distribuirano praćenje
- **Autentikacija**: Upravljani identitet + Key Vault + RBAC obrasci
- **Višestruki agenti**: Service Bus + Cosmos DB + Container Apps + orkestracija
- **Nadzor**: Streaming mjernih podataka + Kusto upiti + alerti + nadzorne ploče
- **Upravljanje troškovima**: Strategije uzorkovanja, politike zadržavanja, kontrola budžeta

### [v3.7.0] - 2025-11-19

#### Poboljšanja kvalitete dokumentacije i novi primjer Microsoft Foundry modela
**Ova verzija poboljšava kvalitetu dokumentacije u cijelom repozitoriju i dodaje kompletan primjer implementacije Microsoft Foundry Modela s chat sučeljem gpt-4.1.**

#### Dodano
- **🤖 Microsoft Foundry Models Chat primjer**: Kompletna gpt-4.1 implementacija u `examples/azure-openai-chat/`:
  - Potpuna infrastruktura Microsoft Foundry Modela (implementacija modela gpt-4.1)
  - Python sučelje za chat iz komandne linije s poviješću razgovora
  - Integracija Key Vaulta za sigurno pohranjivanje API ključeva
  - Praćenje korištenja tokena i procjena troškova
  - Ograničenje brzine i rukovanje pogreškama
  - Sveobuhvatni README vodič za implementaciju (35-45 minuta)
  - 11 datoteka spremnih za produkciju (Bicep predlošci, Python aplikacija, konfiguracija)
- **📚 Vježbe za dokumentaciju**: Dodane praktične vježbe u vodič za konfiguraciju:
  - Vježba 1: Konfiguracija za više okruženja (15 minuta)
  - Vježba 2: Praksa upravljanja tajnama (10 minuta)
  - Jasni kriteriji uspjeha i koraci za verifikaciju
- **✅ Verifikacija implementacije**: Dodan odjeljak za verifikaciju vodiču za implementaciju:
  - Postupci provjere zdravlja
  - Kontrolni popis kriterija uspjeha
  - Očekivani izlazi za sve naredbe implementacije
  - Brza referenca za rješavanje problema

#### Poboljšano
- **examples/README.md**: Ažuriran na A razinu kvalitete (93%):
  - Dodan azure-openai-chat u sve relevantne sekcije
  - Povećan broj lokalnih primjera s 3 na 4
  - Dodan u tablicu primjera AI aplikacija
  - Integriran u Quick Start za srednje napredne korisnike
  - Dodan u odjeljak Microsoft Foundry predložaka
  - Ažurirani matrica usporedbe i sekcije za tehnologijske pronalaske
- **Kvaliteta dokumentacije**: Poboljšano sa B+ (87%) na A- (92%) u mapi docs:
  - Dodani očekivani izlazi za ključne primjere naredbi
  - Uključeni koraci verifikacije za promjene konfiguracije
  - Poboljšano praktično učenje s vježbama

#### Promijenjeno
- **Napredak u učenju**: Bolja integracija AI primjera za srednje napredne korisnike
- **Struktura dokumentacije**: Više primjenjivih vježbi s jasnim ishodima
- **Proces verifikacije**: Dodani eksplicitni kriteriji uspjeha za ključne tijekove rada

#### Poboljšano
- **Iskustvo developera**: Implementacija Microsoft Foundry Modela sada traje 35-45 minuta (u odnosu na 60-90 za složenije alternative)
- **Transparentnost troškova**: Jasne procjene troškova (50-200 $/mjesec) za primjer Microsoft Foundry Modela
- **Put učenja**: AI developeri imaju jasan početak s azure-openai-chat
- **Standardi dokumentacije**: Dosljedni očekivani izlazi i koraci verifikacije

#### Potvrđeno
- ✅ Primjer Microsoft Foundry Modela u potpunosti funkcionalan s `azd up`
- ✅ Sve 11 implementacijskih datoteka sintaktički ispravne
- ✅ Upute u README-u odgovaraju stvarnom iskustvu implementacije
- ✅ Ažurirane poveznice u dokumentaciji na 8+ lokacija
- ✅ Indeks primjera točno odražava 4 lokalna primjera
- ✅ Nema dupliciranih vanjskih poveznica u tablicama
- ✅ Sve reference za navigaciju ispravne

#### Tehnička implementacija
- **Arhitektura Microsoft Foundry Modela**: gpt-4.1 + Key Vault + Container Apps obrazac
- **Sigurnost**: Spremno za upravljani identitet, tajne u Key Vaultu
- **Nadzor**: Integracija Application Insights
- **Upravljanje troškovima**: Praćenje tokena i optimizacija korištenja
- **Implementacija**: Jednostavna naredba `azd up` za kompletnu postavu

### [v3.6.0] - 2025-11-19

#### Veliko ažuriranje: Primjeri implementacije Container aplikacija
**Ova verzija uvodi sveobuhvatne primjere implementacije produkcijski spremnih kontejneriziranih aplikacija koristeći Azure Developer CLI (AZD), s potpunom dokumentacijom i integracijom u put učenja.**

#### Dodano
- **🚀 Primjeri Container aplikacija**: Novi lokalni primjeri u `examples/container-app/`:
  - [Glavni vodič](examples/container-app/README.md): Potpuni pregled kontejneriziranih implementacija, brzi start, produkcija i napredni obrasci
  - [Jednostavan Flask API](../../examples/container-app/simple-flask-api): Prijateljski REST API za početnike s scale-to-zero, health probe, nadzorom i rješavanjem problema
  - [Mikroservisna arhitektura](../../examples/container-app/microservices): Produkcijski spremna višeslužbena implementacija (API Gateway, Product, Order, User, Notification), asinkrona razmjena poruka, Service Bus, Cosmos DB, Azure SQL, distribuirano praćenje, blue-green/canary deployment
- **Najbolje prakse**: Sigurnost, nadzor, optimizacija troškova i smjernice za CI/CD kontejneriziranih radnih opterećenja
- **Primjeri koda**: Potpuni `azure.yaml`, Bicep predlošci i implementacije servisa u više jezika (Python, Node.js, C#, Go)
- **Testiranje i rješavanje problema**: Scenariji kraja do kraja, naredbe za nadzor, upute za otklanjanje poteškoća

#### Promijenjeno
- **README.md**: Ažurirano da sadrži i poveže nove primjere kontejnerskih aplikacija pod "Lokalni primjeri - Kontejnerske aplikacije"
- **examples/README.md**: Ažurirano za isticanje primjera kontejnerskih aplikacija, dodavanje stavki u matricu usporedbe i ažuriranje referenci na tehnologije/arhitekturu
- **Pregled tečaja i vodič za učenje**: Ažurirano za referenciranje novih primjera kontejnerskih aplikacija i obrazaca implementacije u relevantnim poglavljima

#### Validirano
- ✅ Svi novi primjeri mogu se implementirati pomoću `azd up` i slijede najbolje prakse
- ✅ Dokumentacijske križne reference i navigacija ažurirane
- ✅ Primjeri pokrivaju scenarije od početničkih do naprednih, uključujući proizvodne mikroservise

#### Napomene
- **Opseg**: Samo dokumentacija i primjeri na engleskom jeziku
- **Sljedeći koraci**: Proširenje s dodatnim naprednim obrascima kontejnera i CI/CD automatizacijom u budućim izdanjima

### [v3.5.0] - 2025-11-19

#### Rebranding proizvoda: Microsoft Foundry
**Ova verzija provodi sveobuhvatnu promjenu naziva proizvoda s "Microsoft Foundry" na "Microsoft Foundry" u cijeloj engleskoj dokumentaciji, odražavajući službeni rebranding Microsofta.**

#### Promijenjeno
- **🔄 Ažuriranje naziva proizvoda**: Potpuni rebranding s "Microsoft Foundry" na "Microsoft Foundry"
  - Ažurirane sve reference u engleskoj dokumentaciji u mapi `docs/`
  - Preimenovana mapa: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Preimenovana datoteka: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Ukupno: 23 sadržajne reference ažurirane u 7 datoteka dokumentacije

- **📁 Promjene u strukturi mapa**:
  - `docs/ai-foundry/` preimenovana u `docs/microsoft-foundry/`
  - Sve križne reference ažurirane da odražavaju novu strukturu mapa
  - Navigacijske veze potvrđene u cijeloj dokumentaciji

- **📄 Preimenovanja datoteka**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Sve interne veze ažurirane da referenciraju novi naziv datoteke

#### Ažurirane datoteke
- **Dokumentacija poglavlja** (7 datoteka):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 ažuriranja navigacijskih linkova
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 ažuriranja referenci naziva proizvoda
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - već koristi Microsoft Foundry (iz prethodnih ažuriranja)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 ažuriranja referenci (pregled, povratne informacije zajednice, dokumentacija)
  - `docs/getting-started/azd-basics.md` - 4 ažuriranja križnih referenci
  - `docs/getting-started/first-project.md` - 2 ažuriranja navigacije poglavlja
  - `docs/getting-started/installation.md` - 2 ažuriranja sljedećih poglavlja
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 ažuriranja referenci (navigacija, Discord zajednica)
  - `docs/troubleshooting/common-issues.md` - 1 ažuriranje navigacijskog linka
  - `docs/troubleshooting/debugging.md` - 1 ažuriranje navigacijskog linka

- **Struktura tečaja** (2 datoteke):
  - `README.md` - 17 ažuriranih referenci (pregled tečaja, naslovi poglavlja, odjeljak predložaka, uvidi zajednice)
  - `course-outline.md` - 14 ažuriranih referenci (pregled, ciljevi učenja, resursi poglavlja)

#### Validirano
- ✅ Nema preostalih referenci na putanju mape "ai-foundry" u engleskim dokumentima
- ✅ Nema preostalih referenci na naziv proizvoda "Microsoft Foundry" u engleskim dokumentima
- ✅ Sve navigacijske veze funkcionalne s novom strukturom mapa
- ✅ Preimenovanja datoteka i mapa uspješno dovršena
- ✅ Križne reference između poglavlja potvrđene

#### Napomene
- **Opseg**: Promjene primijenjene samo na englesku dokumentaciju u mapi `docs/`
- **Prijevodi**: Mape za prijevode (`translations/`) nisu ažurirane u ovoj verziji
- **Radionice**: Materijali za radionicu (`workshop/`) nisu ažurirani u ovoj verziji
- **Primjeri**: Datoteke primjera mogu još uvijek sadržavati naslijeđene nazive (bit će riješeno u budućem ažuriranju)
- **Vanjske veze**: Vanjski URL-ovi i reference na GitHub repozitorije ostaju nepromijenjeni

#### Vodič za migraciju za suradnike
Ako imate lokalne grane ili dokumentaciju koja referencira staru strukturu:
1. Ažurirajte referencije mapa: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Ažurirajte referencije datoteka: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Zamijenite naziv proizvoda: "Microsoft Foundry" → "Microsoft Foundry"
4. Provjerite da sve interne veze u dokumentaciji još rade

---

### [v3.4.0] - 2025-10-24

#### Poboljšanja pregleda infrastrukture i validacije
**Ova verzija uvodi sveobuhvatnu podršku za novu Azure Developer CLI značajku pregleda i poboljšava korisničko iskustvo radionice.**

#### Dodano
- **🧪 Dokumentacija značajke azd provision --preview**: Detaljna pokrivenost nove mogućnosti pregleda infrastrukture
  - Referenca naredbe i primjeri korištenja u cheat sheetu
  - Detaljna integracija u vodič za provisioning s upotrebama i prednostima
  - Integracija provjere "pre-flight" za sigurniju validaciju implementacije
  - Ažuriranja vodiča za početak rada s praksama implementacije usmjerenim na sigurnost
- **🚧 Banner statusa radionice**: Profesionalni HTML banner koji pokazuje razvojni status radionice
  - Dizajn s gradijentom i indikatorima izgradnje za jasnu komunikaciju korisnicima
  - Vrijeme posljednjeg ažuriranja za transparentnost
  - Prilagodljiv dizajn za mobilne uređaje i sve vrste zaslona

#### Poboljšano
- **Sigurnost infrastrukture**: Funkcionalnost pregleda integrirana kroz cijelu dokumentaciju implementacije
- **Validacija prije implementacije**: Automatizirani skripti sada uključuju testiranje pregleda infrastrukture
- **Radni tijek developera**: Ažurirani slijed naredbi koji uključuje pregled kao najbolju praksu
- **Iskustvo radionice**: Jasno postavljena očekivanja korisnicima o statusu razvoja sadržaja

#### Promijenjeno
- **Najbolje prakse implementacije**: Preporučeni pristup sada je workflow s pregledom kao prvom radnjom
- **Tok dokumentacije**: Validacija infrastrukture pomaknuta ranije u proces učenja
- **Prezentacija radionice**: Profesionalna komunikacija statusa s jasnim vremenom razvoja

#### Poboljšano
- **Pristup prvi sigurnosti**: Promjene u infrastrukturi sada se mogu validirati prije implementacije
- **Suradnja u timu**: Rezultate pregleda mogu dijeliti za pregled i odobrenje
- **Svijest o troškovima**: Bolje razumijevanje troškova resursa prije provisioning-a
- **Smanjenje rizika**: Smanjenje neuspjeha implementacije kroz naprednu validaciju

#### Tehnička implementacija
- **Integracija kroz više dokumenata**: Dokumentirana značajka pregleda kroz 4 ključne datoteke
- **Obrasci naredbi**: Dosljedna sintaksa i primjeri kroz svu dokumentaciju
- **Integracija najboljih praksi**: Pregled uključen u tijekove validacije i skripte
- **Vizualni indikatori**: Jasni oznake NOVE značajke radi lakše prepoznatljivosti

#### Infrastruktura radionice
- **Komunikacija statusa**: Profesionalni HTML banner s gradijentnim stilom
- **Korisničko iskustvo**: Jasno naznačen status razvoja sprječava zabunu
- **Profesionalna prezentacija**: Održava vjerodostojnost repozitorija uz postavljanje očekivanja
- **Transparentnost vremenskog okvira**: Vrijeme posljednjeg ažuriranja u listopadu 2025. za odgovornost

### [v3.3.0] - 2025-09-24

#### Poboljšani materijali radionice i interaktivno učenje
**Ova verzija uvodi sveobuhvatne materijale radionice s interaktivnim vodičima u pregledniku i strukturiranim putovima učenja.**

#### Dodano
- **🎥 Interaktivni vodič radionice**: Radionica u pregledniku s mogućnošću pregleda MkDocs
- **📝 Strukturirane upute za radionicu**: 7-korak vođeni put učenja od otkrivanja do prilagodbe
  - 0-Uvod: Pregled i postavljanje radionice
  - 1-Odaberite AI predložak: Proces otkrivanja i odabira predloška
  - 2-Validirajte AI predložak: Postupci implementacije i validacije
  - 3-Razložite AI predložak: Razumijevanje arhitekture predloška
  - 4-Konfigurirajte AI predložak: Konfiguracija i prilagodba
  - 5-Prilagodite AI predložak: Napredne modifikacije i iteracije
  - 6-Razmontirajte infrastrukturu: Čišćenje i upravljanje resursima
  - 7-Zaključak: Sažetak i sljedeći koraci
- **🛠️ Alati za radionicu**: Konfiguracija MkDocs s temom Material za poboljšano iskustvo učenja
- **🎯 Pristup učenju praktičnim putem**: 3-korak metodologija (Otkrivanje → Implementacija → Prilagodba)
- **📱 Integracija GitHub Codespaces**: Besprijekorno postavljanje razvojnih okoliša

#### Poboljšano
- **Laboratorij AI radionice**: Proširen s detaljnim strukturiranim iskustvom učenja od 2-3 sata
- **Dokumentacija radionice**: Profesionalna prezentacija s navigacijom i vizualnim pomagalima
- **Napredak u učenju**: Jasno vođenje korak-po-korak od odabira predloška do proizvodne implementacije
- **Iskustvo developera**: Integrirani alati za pojednostavljene tokove rada razvoja

#### Poboljšano
- **Pristupačnost**: Sučelje u pregledniku s mogućnošću pretraživanja, kopiranja i promjenom teme
- **Učenje vlastitim tempom**: Fleksibilna struktura radionice za različite brzine učenja
- **Praktična primjena**: Scenariji implementacije stvarnih AI predložaka
- **Integracija zajednice**: Discord integracija za podršku i suradnju u radionici

#### Značajke radionice
- **Ugrađeno pretraživanje**: Brzo pronalaženje ključnih riječi i lekcija
- **Kopiranje blokova koda**: Mogućnost kopiranja koda prelaskom mišem preko primjera
- **Promjena teme**: Podrška za tamni/svijetli način rada za različite preferencije
- **Vizualni materijali**: Snimke zaslona i dijagrami za bolje razumijevanje
- **Integracija pomoći**: Direktan pristup Discord zajednici za podršku

### [v3.2.0] - 2025-09-17

#### Velika restrukturacija navigacije i sustav učenja po poglavljima
**Ova verzija uvodi sveobuhvatnu strukturu učenja po poglavljima s poboljšanom navigacijom u cijelom repozitoriju.**

#### Dodano
- **📚 Sustav učenja po poglavljima**: Cijeli tečaj restrukturiran u 8 progresivnih poglavlja učenja
  - Poglavlje 1: Osnove i brzi početak (⭐ - 30-45 minuta)
  - Poglavlje 2: AI-prvi razvoj (⭐⭐ - 1-2 sata)
  - Poglavlje 3: Konfiguracija i autentifikacija (⭐⭐ - 45-60 minuta)
  - Poglavlje 4: Infrastruktura kao kod i implementacija (⭐⭐⭐ - 1-1.5 sati)
  - Poglavlje 5: Višeagentna AI rješenja (⭐⭐⭐⭐ - 2-3 sata)
  - Poglavlje 6: Validacija i planiranje prije implementacije (⭐⭐ - 1 sat)
  - Poglavlje 7: Rješavanje problema i otklanjanje pogrešaka (⭐⭐ - 1-1.5 sati)
  - Poglavlje 8: Obrasci za proizvodnju i poduzeća (⭐⭐⭐⭐ - 2-3 sata)
- **📚 Sveobuhvatni navigacijski sustav**: Dosljedni zaglavlja i podnožja navigacije kroz svu dokumentaciju
- **🎯 Praćenje napretka**: Popis za dovršetak tečaja i sustav verifikacije učenja
- **🗺️ Vodič za put učenja**: Jasni ulazni bodovi za različite razine iskustva i ciljeve
- **🔗 Križna navigacija**: Jasno povezani povezani sadržaji i preduvjeti između poglavlja

#### Poboljšano
- **Struktura README-a**: Pretvorena u strukturiranu platformu za učenje organiziranu po poglavljima
- **Navigacija dokumentacije**: Svaka stranica sada uključuje kontekst poglavlja i smjernice za napredak
- **Organizacija predložaka**: Primjeri i predlošci mapirani na odgovarajuća poglavlja za učenje
- **Integracija resursa**: Cheat sheetovi, ČPP i vodiči za učenje povezani s relevantnim poglavljima
- **Integracija radionice**: Praktične laboratorije mapirane uz više ciljeva učenja po poglavljima

#### Promijenjeno
- **Napredak u učenju**: Prelazak s linearne dokumentacije na fleksibilno učenje po poglavljima
- **Smještaj konfiguracije**: Vodič za konfiguraciju premješten kao Poglavlje 3 za bolji tok učenja
- **Integracija AI sadržaja**: Bolja integracija AI-specifičnog sadržaja kroz cijeli tok učenja
- **Sadržaj za proizvodnju**: Napredni obrasci konsolidirani u Poglavlju 8 za poduzeća

#### Poboljšano
- **Korisničko iskustvo**: Jasni navigacijski putokazi i indikatori napretka kroz poglavlja
- **Pristupačnost**: Dosljedni navigacijski obrasci za lakše kretanje tečajem
- **Profesionalna prezentacija**: Struktura tečaja nalik sveučilišnom programu prikladna za akademsku i korporativnu obuku
- **Učinkovitost učenja**: Smanjeno vrijeme pronalaska relevantnog sadržaja kroz poboljšanu organizaciju

#### Tehnička implementacija
- **Navigacijski zaglavlja**: Standardizirana navigacija po poglavljima u više od 40 datoteka dokumentacije
- **Navigacija u podnožju**: Dosljedne smjernice za napredak i indikatori dovršetka poglavlja
- **Križno povezivanje**: Sveobuhvatan sustav unutarnjih poveznica koje povezuju povezane koncepte
- **Mapiranje poglavlja**: Predlošci i primjeri jasno povezani s ciljevima učenja

#### Poboljšanje vodiča za učenje
- **📚 Sveobuhvatni ciljevi učenja**: Restrukturiran vodič za učenje usklađen s 8-poglavnim sustavom
- **🎯 Procjena po poglavljima**: Svako poglavlje uključuje specifične ciljeve učenja i praktične vježbe
- **📋 Praćenje napretka**: Tjedni raspored učenja s mjerljivim ishodima i popisom za dovršavanje
- **❓ Pitanja za procjenu**: Pitanja za provjeru znanja u svakom poglavlju s profesionalnim ishodima
- **🛠️ Praktične vježbe**: Aktivnosti s implementacijom stvarnih scenarija i rješavanjem problema
- **📊 Napredak vještina**: Jasno napredovanje od osnovnih koncepata do poduzećnih obrazaca s fokusom na razvoj karijere
- **🎓 Okvir certifikacije**: Profesionalni razvoj i sustav priznanja u zajednici
- **⏱️ Upravljanje vremenskim okvirom**: Strukturirani plan učenja od 10 tjedana s validacijom prekretnica

### [v3.1.0] - 2025-09-17

#### Poboljšana višeagentna AI rješenja
**Ova verzija poboljšava maloagentno maloprodajno rješenje boljim imenovanjem agenata i unaprijeđenom dokumentacijom.**

#### Promijenjeno
- **Terminologija više agenata**: Zamjena "Cora agenta" s "Customer agent" kroz maloprodajno višagentno rješenje radi jasnijeg razumijevanja
- **Arhitektura agenata**: Ažurirana sva dokumentacija, ARM predlošci i primjeri koda za dosljedno korištenje naziva "Customer agent"
- **Primjeri konfiguracije**: Modernizirani obrasci konfiguracije agenata s ažuriranim nazivima
- **Konzistentnost dokumentacije**: Osigurana upotreba profesionalnih i opisnih naziva agenata u svim referencama

#### Poboljšano
- **ARM predložak paketa**: Ažuriran retail-multiagent-arm-template s referencama na Customer agenta  
- **Dijagrami arhitekture**: Osvježeni Mermaid dijagrami s ažuriranim imenima agenata  
- **Primjeri koda**: Python klase i primjeri implementacije sada koriste CustomerAgent imenovanje  
- **Varijable okoline**: Ažurirani svi skripti za deployment s konvencijama CUSTOMER_AGENT_NAME  

#### Poboljšano
- **Iskustvo developera**: Jasnije uloge i odgovornosti agenata u dokumentaciji  
- **Pripremljenost za produkciju**: Bolje usklađivanje s poduzećnim konvencijama imenovanja  
- **Materijali za učenje**: Intuitivnije imenovanje agenata za edukacijske svrhe  
- **Upotrebljivost predloška**: Pojednostavljeno razumijevanje funkcija agenata i obrazaca deploymenta  

#### Tehnički detalji
- Ažurirani Mermaid dijagrami arhitekture s referencama na CustomerAgent  
- Zamijenjena imena CoraAgent klasa s CustomerAgent u Python primjerima  
- Modificirane ARM predloške JSON konfiguracije za korištenje "customer" tipa agenta  
- Ažurirane varijable okoline iz CORA_AGENT_* u CUSTOMER_AGENT_* obrasce  
- Osvježeni svi deployment naredbe i konfiguracije kontejnera  

### [v3.0.0] - 2025-09-12

#### Glavne promjene - Fokus na AI developere i integracija Microsoft Foundry
**Ova verzija transformira repozitorij u sveobuhvatan AI-orijentiran edukacijski resurs s integracijom Microsoft Foundryja.**

#### Dodano
- **🤖 AI-prioritetni put učenja**: Potpuna restrukturacija s fokusom na AI developere i inženjere  
- **Vodič za integraciju Microsoft Foundryja**: Sveobuhvatna dokumentacija za povezivanje AZD-a s Microsoft Foundry uslugama  
- **Obrasci za deployment AI modela**: Detaljni vodič koji uključuje odabir modela, konfiguraciju i strategije produkcijskog deploymenta  
- **AI radionica laboratorij**: 2-3 sata praktičnog rada za pretvaranje AI aplikacija u AZD deployabilna rješenja  
- **Najbolje prakse za produkcijski AI**: Enterprise obrasci za skaliranje, nadzor i osiguranje AI radnih opterećenja  
- **Vodič za otklanjanje poteškoća specifičan za AI**: Sveobuhvatni alati za rješavanje problema s Microsoft Foundry modelima, Cognitive Services i AI deploymentom  
- **Galerija AI predložaka**: Izbor Microsoft Foundry predložaka s ocjenama kompleksnosti  
- **Materijali radionice**: Kompletna struktura radionice s praktičnim laboratorijima i referentnim materijalima  

#### Poboljšano
- **Struktura README-a**: Fokus na AI developere s 45% podataka o interesu zajednice sa Discorda Microsoft Foundryja  
- **Putovi učenja**: Poseban AI developer put uz tradicionalne putove za studente i DevOps inženjere  
- **Preporuke predložaka**: Istaknuti AI predlošci uključuju azure-search-openai-demo, contoso-chat i openai-chat-app-quickstart  
- **Integracija zajednice**: Poboljšana podrška zajednici na Discordu s AI-specifičnim kanalima i raspravama  

#### Sigurnost i fokus na produkciju
- **Uzorci upravljanih identiteta**: AI-specifične autentikacije i sigurnosne konfiguracije  
- **Optimizacija troškova**: Praćenje korištenja tokena i budžetske kontrole za AI radna opterećenja  
- **Multi-regionalni deployment**: Strategije za globalni deployment AI aplikacija  
- **Nadzor performansi**: AI-specifične metrike i integracija s Application Insights  

#### Kvaliteta dokumentacije
- **Linearna struktura tečaja**: Logičan napredak od početničkih do naprednih AI obrazaca deploymenta  
- **Validirani URL-ovi**: Svi vanjski repozitorijski linkovi su provjereni i dostupni  
- **Potpuna referenca**: Svi interni linkovi dokumentacije su validirani i funkcionalni  
- **Pripremljeno za produkciju**: Enterprise obrasci deploymenta s primjerima iz prakse  

### [v2.0.0] - 2025-09-09

#### Glavne promjene - Restrukturiranje repozitorija i profesionalno unaprjeđenje
**Ova verzija predstavlja značajnu preinaku strukture i prezentacije sadržaja repozitorija.**

#### Dodano
- **Strukturirani okvir učenja**: Sve stranice dokumentacije sada uključuju odjeljke Uvod, Ciljevi učenja i Ishodi učenja  
- **Navigacijski sustav**: Dodane poveznice Prethodni/Sljedeći lekciju kroz svu dokumentaciju radi vođenog napretka u učenju  
- **Vodič za učenje**: Sveobuhvatni study-guide.md s ciljevima učenja, praktičnim vježbama i materijalima za evaluaciju  
- **Profesionalna prezentacija**: Uklonjene sve emotikone radi bolje pristupačnosti i profesionalnog izgleda  
- **Poboljšana struktura sadržaja**: Organizacija i tok materijala za učenje  

#### Promijenjeno
- **Format dokumentacije**: Standardiziran sačinjeni format fokusiran na učenje  
- **Tok navigacije**: Implementiran logičan napredak kroz sve materijale za učenje  
- **Prezentacija sadržaja**: Uklonjeni dekorativni elementi u korist jasnog, profesionalnog oblikovanja  
- **Struktura linkova**: Ažurirani svi interni linkovi za podršku novom navigacijskom sustavu  

#### Poboljšano
- **Pristupačnost**: Eliminirane ovisnosti o emotikonima za bolje čitače zaslona  
- **Profesionalni izgled**: Čista, akademskog stila prezentacija prikladna za korporativno učenje  
- **Iskustvo učenja**: Strukturirani pristup s jasnim ciljevima i ishodima za svaku lekciju  
- **Organizacija sadržaja**: Bolji logički tok i povezanost srodnih tema  

### [v1.0.0] - 2025-09-09

#### Početno izdanje - Sveobuhvatni AZD edukacijski repozitorij

#### Dodano
- **Temeljna struktura dokumentacije**  
  - Kompletni vodiči za početak rada  
  - Opsežna dokumentacija za deployment i provisioning  
  - Detaljni resursi za otklanjanje poteškoća i debugging  
  - Alati i procedure za validaciju prije deploymenta  

- **Modul za početak rada**  
  - Osnove AZD-a: Temeljni koncepti i terminologija  
  - Vodič za instalaciju: Upute za instalaciju za različite platforme  
  - Vodič za konfiguraciju: Postavljanje okruženja i autentikacija  
  - Prvi projekt: Korak-po-korak praktični tutorial  

- **Modul deploymenta i provisioninga**  
  - Vodič za deployment: Kompletna radna procedura  
  - Vodič za provisioning: Infrastructure as Code s Bicepom  
  - Najbolje prakse za produkcijske deploymente  
  - Obrasci višeuslužne arhitekture  

- **Modul za validaciju prije deploymenta**  
  - Planiranje kapaciteta: Validacija dostupnosti Azure resursa  
  - Odabir SKU-a: Sveobuhvatne smjernice za nivoe usluge  
  - Pre-flight provjere: Automatizirani skripti za validaciju (PowerShell i Bash)  
  - Alati za procjenu troškova i planiranje budžeta  

- **Modul za otklanjanje poteškoća**  
  - Česti problemi: Uobičajeni izazovi i rješenja  
  - Vodič za debugging: Metode sistematičkog otklanjanja poteškoća  
  - Napredne dijagnostičke tehnike i alati  
  - Praćenje performansi i optimizacija  

- **Resursi i reference**  
  - Cheat Sheet za naredbe: Brza referenca ključnih naredbi  
  - Rječnik: Sveobuhvatni termini i definicije akronima  
  - Često postavljana pitanja: Detaljni odgovori na učestala pitanja  
  - Linkovi na vanjske resurse i zajednicu  

- **Primjeri i predlošci**  
  - Primjer jednostavne web aplikacije  
  - Predložak za deployment statičkog weba  
  - Konfiguracija kontejnerske aplikacije  
  - Obrasci integracije baza podataka  
  - Primjeri mikroservisne arhitekture  
  - Implementacije serverless funkcija  

#### Značajke
- **Višeplatformska podrška**: Vodiči za instalaciju i konfiguraciju za Windows, macOS i Linux  
- **Više razina stručnosti**: Sadržaj prilagođen od studenata do profesionalnih developera  
- **Praktični fokus**: Primjeri za vježbu i scenariji iz stvarnog svijeta  
- **Sveobuhvatna pokrivenost**: Od osnovnih pojmova do naprednih enterprise obrazaca  
- **Sigurnost na prvom mjestu**: Uključene sigurnosne najbolje prakse  
- **Optimizacija troškova**: Smjernice za ekonomičan deployment i upravljanje resursima  

#### Kvaliteta dokumentacije
- **Detaljni primjeri koda**: Praktični, testirani uzorci koda  
- **Upute korak po korak**: Jasne i provedive smjernice  
- **Sveobuhvatno rukovanje greškama**: Otklanjanje poteškoća za uobičajene probleme  
- **Integracija najboljih praksi**: Standardi industrije i preporuke  
- **Kompatibilnost verzija**: Ažurirano za najnovije Azure usluge i azd značajke  

## Planirana buduća unaprjeđenja

### Verzija 3.1.0 (Planirano)
#### Proširenje AI platforme
- **Podrška za više modela**: Obrasci integracije za Hugging Face, Azure Machine Learning i prilagođene modele  
- **Frameworki AI agenata**: Predlošci za LangChain, Semantic Kernel i AutoGen deployment  
- **Napredni RAG obrasci**: Opcije za vektorske baze podataka iznad Azure AI Searcha (Pinecone, Weaviate itd.)  
- **AI nadzor**: Poboljšani monitoring performansi modela, korištenja tokena i kvalitete odgovora  

#### Iskustvo developera
- **VS Code ekstenzija**: Integrirano razvojno iskustvo AZD + Microsoft Foundry  
- **GitHub Copilot integracija**: AI podržano generiranje AZD predložaka  
- **Interaktivni tutorijali**: Praktične kodne vježbe s automatiziranim validacijama za AI scenarije  
- **Video materijali**: Nadopunjavajući video tutorijali za vizualne učenike fokusirani na AI deployment  

### Verzija 4.0.0 (Planirano)
#### Enterprise obrasci za AI
- **Okvir upravljanja**: Upravljanje AI modelima, usklađenost i auditi  
- **Multi-tenant AI**: Obrasci za servisiranje više korisnika s izoliranim AI uslugama  
- **Deployment AI na rubu mreže**: Integracija s Azure IoT Edge i kontejnerskim instancama  
- **Hibridni cloud AI**: Multi-cloud i hibridni obrasci deploymenta AI radnih opterećenja  

#### Napredne funkcije
- **Automatizacija AI pipelinea**: MLOps integracija s Azure Machine Learning pipelineovima  
- **Napredna sigurnost**: Zero-trust obrasci, privatne krajnje točke i zaštita od prijetnji  
- **Optimizacija performansi**: Napredne strategije podešavanja i skaliranja za AI aplikacije visokog prometa  
- **Globalna distribucija**: Obrasci isporuke sadržaja i edge cache za AI aplikacije  

### Verzija 3.0.0 (Planirano) - Zamijenjeno trenutnim izdanjem
#### Predložena dodavanja - sada implementirana u v3.0.0
- ✅ **Sadržaj fokusiran na AI**: Sveobuhvatna integracija Microsoft Foundryja (Dovršeno)  
- ✅ **Interaktivni tutorijali**: Praktična AI radionica (Dovršeno)  
- ✅ **Napredni modul sigurnosti**: AI-specifični sigurnosni obrasci (Dovršeno)  
- ✅ **Optimizacija performansi**: Strategije podešavanja AI radnih opterećenja (Dovršeno)  

### Verzija 2.1.0 (Planirano) - Djelomično implementirano u v3.0.0
#### Manja poboljšanja - neki završeni u aktualnom izdanju
- ✅ **Dodatni primjeri**: AI fokusirani deployment scenariji (Dovršeno)  
- ✅ **Prošireni FAQ**: AI-specifična pitanja i rješavanje problema (Dovršeno)  
- **Integracija alata**: Poboljšane upute za IDE i uređivače  
- ✅ **Prošireni nadzor**: AI-specifični obrasci nadzora i alarma (Dovršeno)  

#### Još planirano za buduće izdanje
- **Mobilna pristupačnost dokumentacije**: Responzivan dizajn za učenje na mobilnim uređajima  
- **Offline pristup**: Moguće preuzimanje paketa dokumentacije  
- **Poboljšana integracija IDE-a**: VS Code ekstenzija za AZD + AI tijekove rada  
- **Zajednički nadzorni panel**: Stvarno-vremenski metrički prikazi i praćenje doprinosa  

## Doprinos promjenama u Changelog

### Prijavljivanje promjena
Prilikom doprinosa ovom repozitoriju, osigurajte da unosi u changelog uključuju:

1. **Broj verzije**: U skladu sa semantičkim verzioniranjem (major.minor.patch)  
2. **Datum**: Datum izdanja ili ažuriranja u formatu GGGG-MM-DD  
3. **Kategorija**: Dodano, Promijenjeno, Zastarjelo, Uklonjeno, Ispravljeno, Sigurnost  
4. **Jasan opis**: Sažet opis promjena  
5. **Procjena utjecaja**: Kako promjene utječu na postojeće korisnike  

### Kategorije promjena

#### Dodano
- Nove funkcije, dokumentacijski odjeljci ili mogućnosti  
- Novi primjeri, predlošci ili materijali za učenje  
- Dodatni alati, skripte ili utilitiyji  

#### Promijenjeno
- Izmjene postojećih funkcionalnosti ili dokumentacije  
- Ažuriranja za poboljšanje jasnoće ili točnosti  
- Restrukturiranje sadržaja ili organizacije  

#### Zastarjelo
- Funkcije ili pristupi koji se postupno ukidaju  
- Dijelovi dokumentacije predviđeni za uklanjanje  
- Metode za koje postoje bolji alternativni pristupi  

#### Uklonjeno
- Funkcije, dokumentacija ili primjeri koji više nisu relevantni  
- Zastarjele informacije ili ukinuti pristupi  
- Redundantni ili konsolidirani sadržaji  

#### Ispravljeno
- Ispravci pogrešaka u dokumentaciji ili kodu  
- Rješavanje prijavljenih problema ili poteškoća  
- Poboljšanja točnosti ili funkcionalnosti  

#### Sigurnost
- Sigurnosna poboljšanja ili popravci  
- Ažuriranja za sigurnosne najbolje prakse  
- Rješavanje sigurnosnih ranjivosti  

### Smjernice za semantičko verzioniranje

#### Glavna verzija (X.0.0)
- Promjene koje razbijaju kompatibilnost i zahtijevaju akciju korisnika  
- Značajna restrukturiranja sadržaja ili organizacije  
- Promjene koje mijenjaju temeljni pristup ili metodologiju  

#### Manja verzija (X.Y.0)
- Nove funkcije ili dodaci sadržaju  
- Poboljšanja koja održavaju kompatibilnost unatrag  
- Dodatni primjeri, alati ili resursi  

#### Patch verzija (X.Y.Z)
- Ispravci grešaka i korekcije  
- Manja poboljšanja postojeće funkcionalnosti  
- Pojašnjenja i sitna unapređenja  

## Povratne informacije i prijedlozi zajednice

Aktivno potičemo povratne informacije zajednice za unapređenje ovog edukacijskog resursa:

### Kako dati povratnu informaciju
- **GitHub Issues**: Prijavite probleme ili predložite poboljšanja (AI-specifični problemi dobrodošli)  
- **Discord rasprave**: Dijelite ideje i uključite se u Microsoft Foundry zajednicu  
- **Pull Requests**: Doprinose direktnim poboljšanjima sadržaja, osobito AI predlošcima i vodičima  
- **Microsoft Foundry Discord**: Sudjelujte u #Azure kanalu za rasprave o AZD + AI  
- **Zajednički forumi**: Sudjelujte u širim Azure developerskim raspravama  

### Kategorije povratnih informacija
- **Točnost AI sadržaja**: Ispravci integracije i deployment informacija AI servisa  
- **Iskustvo učenja**: Prijedlozi za poboljšanje toka učenja AI developera  
- **Nedostajući AI sadržaj**: Zahtjevi za dodatnim AI predlošcima, obrascima ili primjerima  
- **Pristupačnost**: Poboljšanja za različite potrebe učenja  
- **Integracija AI alata**: Prijedlozi za bolje integracije razvojnih tijekova AI  
- **Enterprise obrasci AI**: Zahtjevi za obrasce enterprise AI deploymenta  

### Obveza odgovora
- **Odgovor na probleme**: Unutar 48 sati za prijavljene probleme  
- **Zahtjevi za značajke**: Evaluacija unutar jednog tjedna  
- **Zajednički doprinosi**: Pregled unutar jednog tjedna  
- **Sigurnosni problemi**: Prioritetni i ubrzani odgovor  

## Raspored održavanja

### Redovita ažuriranja
- **Mjesečni pregledi**: Točnost sadržaja i validacija linkova  
- **Kvartalna ažuriranja**: Veći dodaci i poboljšanja sadržaja  
- **Polugodišnji pregledi**: Sveobuhvatna restrukturiranja i unaprjeđenja  
- **Godišnja izdanja**: Glavna izdanja s značajnim poboljšanjima  

### Nadzor i osiguranje kvalitete
- **Automatizirano testiranje**: Redovna validacija primjera koda i linkova  
- **Integracija povratnih informacija zajednice**: Redovito uključivanje korisničkih prijedloga  
- **Ažuriranja tehnologije**: Usuglašavanje s najnovijim Azure uslugama i azd značajkama  
- **Revizije pristupačnosti**: Redoviti pregledi inkluzivnog dizajna  

## Politika podrške verzijama

### Podrška za trenutnu verziju
- **Najnovija glavna verzija**: Potpuna podrška s redovitim ažuriranjima
- **Prethodna glavna verzija**: Sigurnosna ažuriranja i kritične ispravke u trajanju od 12 mjeseci
- **Legacy verzije**: Samo podrška zajednice, bez službenih ažuriranja

### Smjernice za migraciju
Kada se objave glavne verzije, pružamo:
- **Vodiče za migraciju**: Upute korak po korak za prijelaz
- **Napomene o kompatibilnosti**: Detalji o prekidajućim promjenama
- **Podršku alata**: Skripte ili alati za pomoć pri migraciji
- **Podršku zajednice**: Namjenski forumi za pitanja o migraciji

---

**Navigacija**
- **Prethodna lekcija**: [Study Guide](resources/study-guide.md)
- **Sljedeća lekcija**: Povratak na [Main README](README.md)

**Ostanite u tijeku**: Pratite ovaj repozitorij za obavijesti o novim izdanjima i važnim ažuriranjima materijala za učenje.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:
Ovaj dokument je preveden pomoću AI prevodilačke usluge [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo postići točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za kritične informacije preporučuje se profesionalni ljudski prijevod. Ne snosimo odgovornost za bilo kakva nesporazuma ili pogrešne interpretacije nastale korištenjem ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->